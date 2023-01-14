import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

dismiseToast() => ScaffoldMessenger.of(ctx!).hideCurrentSnackBar();

showToast(
  String description, {
  String? title,
  String type = 'info',
  String? textBtnAction,
  Function()? ontapAction,
  int timeVisible = 2100,
  bool showClosebtn = false,
}) {
  ScaffoldMessenger.of(ctx!).clearSnackBars();

  final color = types(type);
  SnackBarAction? action = ontapAction != null
      ? SnackBarAction(
          label: 'tap',
          onPressed: ontapAction,
          textColor: color['text'],
        )
      : null;

  final snackBar = SnackBar(
    content: Row(
      children: [
        // if (type == 'load')
        //   loadwidget(
        //     size: 22,
        //     padding: const EdgeInsets.only(right: 15),
        //     colorIndicator: color['text'],
        //   ),
        Expanded(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                title != null
                    ? text(
                        title,
                        color: color['text'],
                        type: 'title2',
                        size: 17,
                      )
                    : const SizedBox(),
                text(
                  description,
                  color: color['text'],
                  type: 'subtitle2',
                  size: 15,
                ),
              ],
            ),
          ),
        ),
        if (showClosebtn)
          InkWell(
            onTap: dismiseToast,
            child: CircleAvatar(
              backgroundColor: color['text'],
              maxRadius: 14,
              child: Icon(
                Icons.close,
                color: color['color'],
                size: 17,
              ),
            ),
          )
      ],
    ),
    action: action,
    dismissDirection:
        type == 'load' ? DismissDirection.none : DismissDirection.down,
    backgroundColor: color['color'],
    duration: Duration(
      milliseconds: type == 'load' ? 9999999999999 : timeVisible,
    ),
  );

  return ScaffoldMessenger.of(ctx!).showSnackBar(snackBar);
}

Map<String, Color> types(type) {
  int alphaColor = 200;
  switch (type) {
    case 'success':
      return {
        'color':
            const Color.fromARGB(255, 189, 255, 184).withAlpha(alphaColor + 10),
        'text': const Color.fromARGB(255, 70, 70, 70),
      };
    case 'error':
      return {
        'color': Colors.redAccent.withAlpha(alphaColor + 10),
        'text': const Color.fromARGB(255, 255, 255, 255),
      };
    case 'info':
    case 'load':
      return {
        'color': kSecondaryColor.withAlpha(alphaColor + 20),
        'text': const Color.fromARGB(255, 255, 255, 255),
      };
    case 'warning':
      return {
        'color': kprimaryColor.withAlpha(240),
        'text': kSecondaryColor,
      };
    case 'alert':
      return {
        'color': kprimaryColor.withAlpha(alphaColor),
        'text': Colors.white,
      };
    default:
      return {
        'color': Colors.black.withAlpha(alphaColor),
        'text': Colors.white,
      };
  }
}
