import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Color(0xffb3e5f7),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/profilepic.png'),
                    radius: 75,
                    backgroundColor: Colors.white,
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' Feedback :',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 1.2857,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Updated badge layout in a column
                Column(
                  children: [
                    _buildBadgeContainerWithText(
                        'Efforts', 'images/badge1.png'),
                    _buildBadgeContainerWithText(
                        'Communication', 'images/badge2.png'),
                    _buildBadgeContainerWithText(
                        'Planning', 'images/badge3.png'),
                    SizedBox(height: 8),
                    // Box with the badge image
                    _buildBadgeBoxWithHeading(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBadgeContainerWithText(String text, String badgeImageAsset) {
    return Column(
      children: [
        Text(text),
        SizedBox(height: 8),
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
          SizedBox(height: 8),
          // Add the badge image here
          Image.asset(
            'images/badge4.png',
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
