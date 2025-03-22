import 'package:flutter/material.dart';
import '../utils/responsive_widget.dart';

class ResponsivePadding extends StatelessWidget {
  final Widget child;

  const ResponsivePadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveWidget.getResponsivePadding(context),
      child: child,
    );
  }
}