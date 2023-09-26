import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

class LiveClass {
  final String subject;
  final DateTime date;
  final TimeOfDay time;

  final String category;

  LiveClass(
      {required this.subject,
      required this.date,
      required this.time,
      required this.category});
}

final List<LiveClass> classes = [
  LiveClass(
      subject: 'C Programming',
      date: DateTime.now(),
      time: TimeOfDay.now(),
      category: 'ComputerScience'),
  LiveClass(
      subject: 'Polynomial',
      date: DateTime.now(),
      time: TimeOfDay.now(),
      category: 'Maths'),
  LiveClass(
      subject: 'Gravity',
      date: DateTime.now(),
      time: TimeOfDay.now(),
      category: 'Physics'),
  LiveClass(
      subject: 'Organic',
      date: DateTime.now(),
      time: TimeOfDay.now(),
      category: 'Chemistry')
];
