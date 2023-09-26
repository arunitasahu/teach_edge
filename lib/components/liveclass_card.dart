import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:teach_edge/model/class_data.dart';

class LiveClassCard extends StatelessWidget {
  final String subject;
  final DateTime date;
  final TimeOfDay time;
  final String category;
  const LiveClassCard(
      {super.key,
      required this.subject,
      required this.date,
      required this.time,
      required this.category});

  @override
  Widget build(BuildContext context) {
    String formatTimeOfDay(TimeOfDay time) {
      final now = DateTime.now();
      final dateTime =
          DateTime(now.year, now.month, now.day, time.hour, time.minute);
      final formattedTime =
          DateFormat.jm().format(dateTime); // Use 'jm' pattern
      return formattedTime;
    }

    String formatDate(DateTime dateTime) {
      return DateFormat('d MMMM').format(dateTime);
    }

    return Container(
      height: 80,
      width: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.04),
          width: 1.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                child: const ClipOval(
                    child: Icon(
                  Icons.calendar_month_rounded,
                  size: 40,
                )),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  subject,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.watch_later_rounded,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        formatTimeOfDay(time),
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 43,
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 20,
                    color: Colors.blue,
                  ),
                  Text(
                    formatDate(date),
                    style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
