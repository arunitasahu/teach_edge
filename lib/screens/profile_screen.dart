import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teach_edge/components/colors.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String teacherName;
  final List<String> students;
  final List<String> badges;
  final String profilePictureUrl;

  const ProfilePage({
    Key? key,
    required this.name,
    required this.teacherName,
    required this.students,
    required this.badges,
    required this.profilePictureUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text('Profile Page'),
          backgroundColor: const Color.fromARGB(255, 255, 240, 200),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 200,
                      width: 200,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/logo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 1.2857,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ExpansionTile(
                      title: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '$teacherName',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      children: students
                          .map(
                            (teamMember) => Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 16.0,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  teamMember,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Feedback',
                        style: GoogleFonts.lato(fontSize: 18.0),
                      )),
                  const SizedBox(height: 20),

                  // Updated badge layout in a column
                  Column(
                    children: [
                      _buildBadgeContainerWithText(
                          'Efforts', 'assets/badge1.jpg'),
                      _buildBadgeContainerWithText(
                          'Communication', 'assets/badge2.jpg'),
                      _buildBadgeContainerWithText(
                          'Planning', 'assets/badge3.jpg'),
                      const SizedBox(height: 8),
                      // Box with the badge image
                      _buildBadgeBoxWithHeading(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildBadgeContainerWithText(String text, String badgeImageAsset) {
    return Column(
      children: [
        Text(text),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              badgeImageAsset,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBadgeBoxWithHeading() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 1),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Removed the "Badge" heading text
          const SizedBox(height: 8),
          // Add the badge image here
          Image.asset(
            'assets/badge4.jpg',
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
