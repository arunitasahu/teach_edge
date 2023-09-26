import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teach_edge/components/colors.dart';

class ForumPage extends StatelessWidget {
  final List<Class> classes = List.generate(
    10,
    (index) => Class(
      id: 'class${index + 1}',
      name: 'Class ${index + 1}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 240, 200),
        title: const Text('Class Forum'),
      ),
      body: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index) {
          return ClassTile(classObj: classes[index]);
        },
      ),
    );
  }
}

class Class {
  final String id;
  final String name;
  final List<Post> parentPosts = [];
  final List<Post> studentPosts = [];
  final List<Post> teacherPosts = [];

  Class({required this.id, required this.name});
}

class ClassTile extends StatelessWidget {
  final Class classObj;

  ClassTile({required this.classObj});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(classObj.name),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClassDetailsPage(classObj: classObj),
          ),
        );
      },
    );
  }
}

class ClassDetailsPage extends StatefulWidget {
  final Class classObj;

  ClassDetailsPage({required this.classObj});

  @override
  _ClassDetailsPageState createState() => _ClassDetailsPageState();
}

class _ClassDetailsPageState extends State<ClassDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 240, 200),
          title: Text(widget.classObj.name),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Parents'),
              Tab(text: 'Students'),
              Tab(text: 'Teachers'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ColumnSection(
              posts: widget.classObj.parentPosts,
              onPostSubmitted: (content) {
                setState(() {
                  widget.classObj.parentPosts.add(Post(
                    author: 'Parent',
                    content: content,
                  ));
                });
              },
            ),
            ColumnSection(
              posts: widget.classObj.studentPosts,
              onPostSubmitted: (content) {
                setState(() {
                  widget.classObj.studentPosts.add(Post(
                    author: 'Student',
                    content: content,
                  ));
                });
              },
            ),
            ColumnSection(
              posts: widget.classObj.teacherPosts,
              onPostSubmitted: (content) {
                setState(() {
                  widget.classObj.teacherPosts.add(Post(
                    author: 'Teacher',
                    content: content,
                  ));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ColumnSection extends StatelessWidget {
  final List<Post> posts;
  final Function(String content) onPostSubmitted;

  ColumnSection({
    required this.posts,
    required this.onPostSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return PostDialog(
                  onPostSubmitted: onPostSubmitted,
                );
              },
            );
          },
          child: const Text('Create Post'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return PostTile(post: posts[index]);
            },
          ),
        ),
      ],
    );
  }
}

class Post {
  final String author;
  final String content;
  int likes;
  int dislikes;
  int comments;
  int views;

  Post({
    required this.author,
    required this.content,
    this.likes = 0,
    this.dislikes = 0,
    this.comments = 0,
    this.views = 0,
  });
}

class PostTile extends StatelessWidget {
  final Post post;

  PostTile({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.content),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up),
                      onPressed: () {
                        // Handle liking the post.
                      },
                    ),
                    Text(post.likes.toString()),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(Icons.thumb_down),
                      onPressed: () {
                        // Handle disliking the post.
                      },
                    ),
                    Text(post.dislikes.toString()),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.comment),
                      onPressed: () {
                        // Open a comment section for this post.
                      },
                    ),
                    Text(post.comments.toString()),
                  ],
                ),
                Text('Views: ${post.views}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PostDialog extends StatefulWidget {
  final Function(String content) onPostSubmitted;

  PostDialog({required this.onPostSubmitted});

  @override
  _PostDialogState createState() => _PostDialogState();
}

class _PostDialogState extends State<PostDialog> {
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Post'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _contentController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Content',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String content = _contentController.text.trim();
                if (content.isNotEmpty) {
                  widget.onPostSubmitted(content);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }
}
