import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentCard extends StatelessWidget {
  final String name;
  final String rollNo;
  const StudentCard({super.key, required this.name, required this.rollNo});

  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.black,
              child: const ClipOval(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            name,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            rollNo,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w300,
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );
  }
}
