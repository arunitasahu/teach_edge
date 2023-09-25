import 'package:flutter/material.dart';
import 'package:teach_edge/presentation/pages/Profile%20Page/profile_page.dart';
import 'package:teach_edge/presentation/pages/announcement_page/announcement_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teach Edge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
          title: 'Teach Edge Home'), // Set MyHomePage as the initial route
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(
                      name: 'CLASS A1',
                      teacherName: 'Teacher : Alice',
                      students: [
                        'R1: Harry',
                        'R2: Bob',
                        'R3: Charlie',
                        'R4: Anna'
                      ],
                      badges: ['Gold Badge', 'Silver Badge', 'Bronze Badge'],
                      profilePictureUrl:
                          'https://example.com/profile-picture.jpg',
                    ),
                  ),
                );
              },
              child: const Text('Go to Profile Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        AnnouncementPage(), // Navigate to the AnnouncementPage
                  ),
                );
              },
              child: const Text('Go to Assignment Page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
