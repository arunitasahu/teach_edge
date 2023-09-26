import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseCard extends StatelessWidget {
  final String name;
  final String subject;
  final String instructor;
  final String duration;
  final String imagePath;

  const CourseCard({
    super.key,
    required this.name,
    required this.subject,
    required this.instructor,
    required this.duration,
    required this.imagePath,
  });

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
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
                  name,
                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    instructor,
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 48,
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_rounded,
                    size: 20,
                    color: Colors.blue,
                  ),
                  Text(
                    duration,
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
