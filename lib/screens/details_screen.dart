import 'package:flutter/material.dart';
import '../models/course_model.dart';

class DetailsScreen extends StatelessWidget {
  final Course course;

  DetailsScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.courseName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('University: ${course.universityName}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Duration: ${course.duration}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Description:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(course.description, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}