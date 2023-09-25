import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

class AnnouncementPage extends StatefulWidget {
  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedType = 'Event';
  String description = '';
  List<PlatformFile> attachments = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _openFilePicker() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        attachments.addAll(result.files);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Personalized Courses '),
        backgroundColor: Color(0xffb3e5f7), // Set the AppBar background color
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Date:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(DateFormat('MMM dd, yyyy').format(selectedDate)),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select Date'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Time:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(selectedTime.format(context)),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Select Time'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Type:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedType,
              onChanged: (String? Value) {
                setState(() {
                  selectedType = Value!;
                });
              },
              items: <String>[
                'Event',
                'Meeting',
                'News',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Attachments:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: _openFilePicker,
              child: Text('Add Attachments'),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: attachments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(attachments[index].name),
                );
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle the announcement submission here
                // You can use the selectedDate, selectedTime, selectedType,
                // description, and attachments variables to create the announcement.
              },
              child: Text('Submit Announcement'),
            ),
          ],
        ),
      ),
    );
  }
}
