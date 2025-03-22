import 'package:flutter/material.dart';
import '../models/course_model.dart';
import '../utils/responsive_text.dart';

class CourseListItem extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const CourseListItem({super.key,
    required this.course,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
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
        subtitle: ResponsiveText(text: course.universityName),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
        onTap: onTap,
      ),
    );
  }
}