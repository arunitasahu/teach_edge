import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teach_edge/components/CourseCard.dart';
import 'package:teach_edge/components/colors.dart';
import 'package:teach_edge/components/liveclass_card.dart';
import 'package:teach_edge/components/testimonial_card.dart';
import 'package:teach_edge/model/class_data.dart';
import 'package:teach_edge/model/course.dart';
import 'package:teach_edge/model/testimonial.dart';
import 'package:teach_edge/screens/login_page.dart';
import 'package:teach_edge/screens/settings_screen.dart';
import 'package:teach_edge/screens/student_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 240, 200),
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            'Dashboard',
            style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    (MaterialPageRoute(builder: (context) => StudentList())));
              },
              icon: const Icon(Icons.list_alt_sharp),
            ),
            PopupMenuButton<String>(
              iconSize: 30,
              offset: const Offset(0, 52),
              onSelected: (value) {
                if (value == 'settings') {
                  Navigator.of(context).push((MaterialPageRoute(
                      builder: (context) => SettingsPage())));
                } else if (value == 'help_support') {
                } else if (value == 'logout') {
                  Navigator.of(context).push(
                      (MaterialPageRoute(builder: (context) => LoginPage())));
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'settings',
                  child: Text('Settings'),
                ),
                const PopupMenuItem<String>(
                  value: 'help_support',
                  child: Text('Help and Support'),
                ),
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0),
            child: Column(
              children: [
                Text(
                  'Welcome to TeachEdge',
                  style: GoogleFonts.lato(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 30, 1, 81)),
                ),
                const SizedBox(height: 12.0),
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/logo.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 10.0),
                  child: Text(
                    'Your Courses',
                    style: GoogleFonts.lato(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 30, 1, 81)),
                  ),
                ),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        Course course = courses[index];
                        return CourseCard(
                          duration: course.duration,
                          imagePath: course.imagePath,
                          name: course.name,
                          instructor: course.instructor,
                          subject: course.subject,
                        );
                      }),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 10.0),
                  child: Text(
                    'Upcoming Classes',
                    style: GoogleFonts.lato(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 30, 1, 81)),
                  ),
                ),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: classes.length,
                      itemBuilder: (context, index) {
                        LiveClass classa = classes[index];
                        return LiveClassCard(
                            subject: classa.subject,
                            date: classa.date,
                            time: classa.time,
                            category: classa.category);
                      }),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 10.0),
                  child: Text(
                    'Testimonials',
                    style: GoogleFonts.lato(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 30, 1, 81)),
                  ),
                ),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: testimonials.length,
                      itemBuilder: (context, index) {
                        Testimonial testimonial = testimonials[index];
                        return TestiMonialCard(
                            imagepath: testimonial.imagepath,
                            feedback: testimonial.feedback);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
