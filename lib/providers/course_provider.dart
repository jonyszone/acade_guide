import 'package:flutter/material.dart';
import '../models/course_model.dart';
import '../services/course_service.dart';

class CourseProvider with ChangeNotifier {
  final CourseService _courseService = CourseService();
  List<Course> _courses = [];
  List<Course> _filteredCourses = [];
  bool _isLoading = false;

  List<Course> get filteredCourses => _filteredCourses;
  bool get isLoading => _isLoading;

  Future<void> loadCourses() async {
    _isLoading = true;
    notifyListeners();

    _courses = await _courseService.loadCourses();
    _filteredCourses = _courses;
    _isLoading = false;
    Future.microtask(() {
      notifyListeners();
    });
  }

  void searchCourses(String query) {
    if (query.isEmpty) {
      _filteredCourses = _courses;
    } else {
      _filteredCourses = _courses
          .where((course) =>
      course.courseName.toLowerCase().contains(query.toLowerCase()) ||
          course.universityName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    Future.microtask(() {
      notifyListeners();
    });
  }
}