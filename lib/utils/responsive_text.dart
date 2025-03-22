import 'package:flutter/material.dart';
import '../utils/responsive_widget.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;

  const ResponsiveText({super.key,
    required this.text,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: ResponsiveWidget.getResponsiveFontSize(context),
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}