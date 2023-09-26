import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teach_edge/components/StudentCard.dart';
import 'package:teach_edge/components/colors.dart';
import 'package:teach_edge/model/student.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 240, 200),
          title: Text(
            'List of Students',
            style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        backgroundColor: primaryColor,
        body: ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              Student student = students[index];
              return StudentCard(name: student.name, rollNo: student.rollNo);
            }),
      ),
    );
  }
}
