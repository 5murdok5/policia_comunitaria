import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';

class CtCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? width;
  final double? height;
  final double blurshadow;
  final double radius;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool showShadow;
  final bool showborder;
  final Color? borderColor;
  final Color? shadowColor;
  final Offset shadowOfs;
  final double widthborder;

  const CtCard(
      {Key? key,
      required this.child,
      this.color = Colors.white,
      this.width,
      this.height,
      this.blurshadow = 9.0,
      this.radius = 8,
      this.showShadow = false,
      this.margin = const EdgeInsets.all(0),
      this.showborder = false,
      this.borderColor = kSecondaryColor,
      this.padding = const EdgeInsets.all(8),
      this.shadowOfs = const Offset(0, 2),
      this.shadowColor,
      this.widthborder = 0.7})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        boxShadow: [
          BoxShadow(
            color: !showShadow
                ? Colors.transparent
                : shadowColor ?? const Color.fromARGB(22, 0, 0, 0),
            blurRadius: blurshadow,
            offset: shadowOfs,
          ),
        ],
        border: Border.all(
          color: showborder ? borderColor! : Colors.transparent,
          width: widthborder,
        ),
        color: color,
      ),
      child: child,
    );
  }
}
