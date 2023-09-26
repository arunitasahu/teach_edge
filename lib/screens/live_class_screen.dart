import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:teach_edge/components/colors.dart';
import 'package:teach_edge/model/class_meet.dart';

class LiveClass extends StatefulWidget {
  const LiveClass({super.key});

  @override
  State<LiveClass> createState() => _LiveClassState();
}

class _LiveClassState extends State<LiveClass> {
  final List<Classdata> _liveclass = [
    Classdata(
        subject: 'C Programming',
        date: DateTime.now(),
        time: TimeOfDay.now(),
        category: Category.ComputerScience),
    Classdata(
        subject: 'Polynomial',
        date: DateTime.now(),
        time: TimeOfDay.now(),
        category: Category.Maths)
  ];
  void _openAddClassOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewClass(onNewClass: _addClass),
    );
  }

  void _addClass(Classdata item) {
    setState(() {
      _liveclass.add(item);
    });
  }

  void _removeClass(Classdata item) {
    final ClassIndex = _liveclass.indexOf(item);
    setState(() {
      _liveclass.remove(item);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Class Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _liveclass.insert(ClassIndex, item);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 240, 200),
          title: Text(
            'Live Class',
            style: GoogleFonts.lato(fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: _openAddClassOverlay,
              //icon: const Icon(Icons.add),

              child: Text(
                'New Class',
                style: GoogleFonts.lato(fontSize: 20, color: Colors.blue),
              ),
            )
          ]),
      body: _liveclass.isNotEmpty
          ? ClassList(class1: _liveclass, onRemoveClass: _removeClass)
          : const Center(child: Text('No Upcoming Class')),
    );
  }
}

class ClassList extends StatelessWidget {
  const ClassList(
      {super.key, required this.class1, required this.onRemoveClass});

  final List<Classdata> class1;
  final void Function(Classdata item) onRemoveClass;

  @override
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: class1.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(class1[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
        ),
        onDismissed: (direction) {
          onRemoveClass(class1[index]);
        },
        child: Classcard(class1[index]),
      ),
    );
  }
}

class Classcard extends StatelessWidget {
  const Classcard(this.item, {super.key});
  final Classdata item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.subject,
                style: const TextStyle(
                  fontSize: 22,
                )),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(item.getFormattedTime()),
                const Spacer(),
                Text(item.formattedDate),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NewClass extends StatefulWidget {
  const NewClass({super.key, required this.onNewClass});
  final void Function(Classdata item) onNewClass;
  @override
  State<NewClass> createState() => _NewClassState();
}

class _NewClassState extends State<NewClass> {
  final _subjectController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();
  TimeOfDay? _selectedTime = TimeOfDay.now();
  Category _selectedCategory = Category.English;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _submitData() {
    if (_subjectController.text.trim().isEmpty ||
        _selectedDate == null ||
        _selectedTime == null) {
      if (Platform.isIOS) {
        showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text('Invalid Input'),
            content: const Text(
                'Please make sure a valid subject, date, or time was entered.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('OK'),
              )
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Invalid Input'),
            content: const Text(
                'Please make sure a valid subject, date, or time was entered.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('OK'),
              )
            ],
          ),
        );
      }
      return;
    }
    widget.onNewClass(Classdata(
        subject: _subjectController.text,
        date: _selectedDate!,
        time: _selectedTime!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _subjectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: Column(
              children: [
                TextField(
                  controller: _subjectController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Subject',
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _selectedTime == null
                                ? 'No Time Selected'
                                : _selectedTime!.format(context),
                          ),
                          IconButton(
                            onPressed: () {
                              _selectTime(context);
                            },
                            icon: const Icon(Icons.access_time),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _selectedDate == null
                                ? 'No Date Selected'
                                : DateFormat('MMM dd, yyyy')
                                    .format(_selectedDate!),
                          ),
                          IconButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            icon: const Icon(Icons.calendar_today),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    DropdownButton(
                      value: _selectedCategory,
                      items: Category.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name.toUpperCase()),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                    ),
                    const Spacer(),
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    //   child: const Text('Cancel'),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        _submitData();
                      },
                      child: const Text('Save Class'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
