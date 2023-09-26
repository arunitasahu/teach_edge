class Testimonial {
  final String imagepath;
  final String feedback;

  Testimonial({required this.imagepath, required this.feedback});
}

final List<Testimonial> testimonials = [
  Testimonial(
      imagepath: 'assets/1.jpeg',
      feedback:
          "This app has transformed the way I interact with my students. It's user-friendly and allows me to share course materials, assignments, and announcements effortlessly. My students are more engaged than ever before."),
  Testimonial(
      imagepath: 'assets/2.jpeg',
      feedback:
          "The live classes feature is a game-changer for me. I can schedule and conduct live science experiments with my students, and they can interact and ask questions in real-time. It brings the subject to life!")
];
