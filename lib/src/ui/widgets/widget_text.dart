import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';

// text('Hola1', type: 'title'),
// text('Hola1', type: 'title2'),
// text('Hola1', type: 'subtitle'),
// text('Hola1', type: 'body'),
// text('Hola1', type: 'body2'),

/// Widget de text general para toda la app
/// types for textStyle : title - title2 - subtitle - body1 - body2
Widget text(
  String text, {
  String type = 'body',
  Color? color,
  double? size,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  int? maxLines,
  double top = 0,
  double left = 0,
  double bottom = 0,
  double right = 0,
}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(left, top, right, bottom),
    child: Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines ?? 10,
      overflow: TextOverflow.ellipsis,
      style: getTypeTest(
        type,
        addStyle: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
        ),
      ),
    ),
  );
}

TextStyle? getTypeTest(String value, {TextStyle? addStyle}) {
  switch (value) {
    case 'title':
      return theme.textTheme.headline1!.copyWith(
        color: addStyle?.color,
        fontSize: addStyle?.fontSize,
        fontWeight: addStyle?.fontWeight,
      );
    case 'title2':
      return theme.textTheme.headline2!.copyWith(
        color: addStyle?.color,
        fontSize: addStyle?.fontSize,
        fontWeight: addStyle?.fontWeight,
      );
    case 'subtitle':
      return theme.textTheme.subtitle1!.copyWith(
        color: addStyle?.color,
        fontSize: addStyle?.fontSize,
        fontWeight: addStyle?.fontWeight,
      );
    case 'subtitle2':
      return theme.textTheme.subtitle2!.copyWith(
        color: addStyle?.color,
        fontSize: addStyle?.fontSize,
        fontWeight: addStyle?.fontWeight,
      );
    case 'body':
      return theme.textTheme.bodyText1!.copyWith(
        color: addStyle?.color,
        fontSize: addStyle?.fontSize,
        fontWeight: addStyle?.fontWeight,
      );
    case 'body2':
      return theme.textTheme.bodyText2!.copyWith(
        color: addStyle?.color,
        fontSize: addStyle?.fontSize,
        fontWeight: addStyle?.fontWeight,
      );
    case 'light':
      return theme.textTheme.headline3!.copyWith(
        color: addStyle?.color,
        fontSize: addStyle?.fontSize,
        fontWeight: addStyle?.fontWeight,
      );
    case 'light2':
      return theme.textTheme.headline4!.copyWith(
        color: addStyle?.color,
        fontSize: addStyle?.fontSize,
        fontWeight: addStyle?.fontWeight,
      );
    default:
      return theme.textTheme.bodyText2!.copyWith(
        color: addStyle?.color,
        fontSize: addStyle?.fontSize,
        fontWeight: addStyle?.fontWeight,
      );
  }
}
