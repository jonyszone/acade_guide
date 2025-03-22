import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/course_model.dart';

class CourseService {
  Future<List<Course>> loadCourses() async {
    final String response = await rootBundle.loadString('assets/courses.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Course.fromJson(json)).toList();
  }
}