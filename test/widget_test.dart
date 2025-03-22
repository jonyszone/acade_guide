// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:acade_guide/models/course_model.dart';
import 'package:acade_guide/widgets/course_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CourseListItem should display course details', (WidgetTester tester) async {
    final course = Course(
      id: '1',
      universityName: 'Harvard University',
      courseName: 'Computer Science 101',
      description: 'An introductory course to computer science.',
      duration: '12 weeks',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CourseListItem(
            course: course,
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.text('Computer Science 101'), findsOneWidget);
    expect(find.text('Harvard University'), findsOneWidget);
  });
}
