import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';



const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { Maths, Science, ComputerScience, English, SocialStudies }

class Classdata {
  Classdata({
    required this.subject,
    required this.date,
    required this.time,
    required this.category,
  }) : id = uuid.v4();

  final String subject;
  final DateTime date;
  final TimeOfDay time;
  final String id;
  final Category category;

  String getFormattedTime() {
    final formatter = DateFormat('hh:mm a');
    return formatter.format(DateTime(time.hour, time.minute));
  }

  String get formattedDate {
    return formatter.format(date);
}
}