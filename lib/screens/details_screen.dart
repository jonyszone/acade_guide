import 'package:flutter/material.dart';
import '../models/course_model.dart';
import '../utils/responsive_padding.dart';
import '../utils/responsive_text.dart';

class DetailsScreen extends StatelessWidget {
  final Course course;

  const DetailsScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: 'course-${course.id}',
          child: Material(
            color: Colors.transparent,
            child: ResponsiveText(
              text: course.courseName,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ResponsivePadding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              ResponsiveText(
                text: 'University: ${course.universityName}',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10),
              ResponsiveText(text: 'Duration: ${course.duration}'),
              SizedBox(height: 20),
              ResponsiveText(
                text: 'Description:',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10),
              ResponsiveText(text: course.description),
            ],
          ),
        ),
      ),
    );
  }
}