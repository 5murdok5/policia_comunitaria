import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';

Widget loadwidget(
    {Color? colorIndicator = kprimaryColor,
    double size = 25,
    double strokeWidth = 2.7,
    EdgeInsetsGeometry padding = const EdgeInsets.all(0)}) {
  return Padding(
    padding: padding,
    child: SizedBox(
      height: size,
      width: size,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(colorIndicator!),
          strokeWidth: strokeWidth,
        ),
      ),
    ),
  );
}
