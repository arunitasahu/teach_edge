import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teach_edge/components/colors.dart';
import 'package:teach_edge/providers/screen_provider.dart';
import 'package:teach_edge/screens/discussions_screen.dart';
import 'package:teach_edge/screens/home_screen.dart';
import 'package:teach_edge/screens/live_class_screen.dart';
import 'package:teach_edge/screens/login_page.dart';
import 'package:teach_edge/screens/profile_screen.dart';
import 'package:teach_edge/screens/quiz_screen.dart';
import 'package:teach_edge/screens/register_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;
  final tabs = [
    const HomeScreen(),
    AnnouncementPage(),
    const LiveClass(),
    ForumPage(),
    const ProfilePage(
      name: '12th Science',
      teacherName: 'Teacher : Mrs. Rekha',
      students: ['R1: Ram', 'R2: Shyam', 'R3: Radha', 'R4: Rahul'],
      badges: ['Gold Badge', 'Silver Badge', 'Bronze Badge'],
      profilePictureUrl: 'https://example.com/profile-picture.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          const String url = 'https://ndl.iitkgp.ac.in/';
          final Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            throw 'Could not launc $url';
          }
        },
        backgroundColor: Colors.lightBlue[300],
        child: const Icon(
          Icons.local_library,
          size: 35,
        ),
      ),
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.quiz_rounded,
              color: Colors.black,
            ),
            label: 'Assignments',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_call,
              color: Colors.black,
              size: 25.0,
            ),
            label: 'Live Class',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_alt,
              color: Colors.black,
            ),
            label: 'Discussions',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
