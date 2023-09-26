import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestiMonialCard extends StatelessWidget {
  final String imagepath;
  final String feedback;
  const TestiMonialCard(
      {super.key, required this.imagepath, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: Colors.grey[200],
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
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 70,
                width: 70,
                child: ClipOval(
                  child: Image.asset(
                    imagepath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      feedback,
                      style: GoogleFonts.lato(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
