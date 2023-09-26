class Course {
  final String name;
  final String subject;
  final String instructor;
  final String duration;
  final String imagePath;

  Course({
    required this.name,
    required this.subject,
    required this.instructor,
    required this.duration,
    required this.imagePath,
  });
}

final List<Course> courses = [
  Course(
      name: 'Data Structures in Java',
      subject: 'Computer Science',
      instructor: 'NPTEL',
      duration: '16 hours',
      imagePath: 'assets/java.png'),
  Course(
      name: 'Data Structures in C++',
      subject: 'Computer Science',
      instructor: 'NPTEL',
      duration: '21 hours',
      imagePath: 'assets/cpp.png'),
  Course(
      name: 'Web Development',
      subject: 'Computer Science',
      instructor: 'Udemy',
      duration: '11 hours',
      imagePath: 'assets/webd.png'),
  Course(
      name: 'Machine Learning with Python',
      subject: 'Computer Science',
      instructor: 'Coursera',
      duration: '19 hours',
      imagePath: 'assets/ml.png'),
  Course(
      name: 'Operating System',
      subject: 'Computer Science',
      instructor: 'College',
      duration: '10 hours',
      imagePath: 'assets/os.png')
];
