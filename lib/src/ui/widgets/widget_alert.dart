import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_button%20copy.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

showAlert({
  String? title,
  String? description,
  String? textCancel,
  String? textAcept,
  Widget? contentWidget,
  Function()? onAcept,
  Function()? onCancel,
}) {
  return showDialog<String>(
    context: ctx!,
    builder: (BuildContext context) => AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: text(
              title ?? 'Title Here',
              type: 'subtitle',
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.close,
                size: 18,
                color: Colors.grey[600],
              ),
            ),
          )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (description != null)
            text(description, textAlign: TextAlign.center, type: 'body2'),
          if (contentWidget != null) const SizedBox(height: 15),
          if (contentWidget != null) contentWidget,
        ],
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      titlePadding: const EdgeInsets.only(
        top: 15.0,
        bottom: 5,
        left: 20,
        right: 20,
      ),
      actionsPadding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 2,
        bottom: 7.0,
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            onCancel != null
                ? Expanded(
                    child: button(
                      textCancel ?? 'Cancelar',
                      showArrow: false,
                      radius: 5,
                      padding: const EdgeInsets.all(8),
                      type: 'secondary_line',
                      onTap: () {
                        onCancel();
                        Navigator.pop(context);
                      },
                    ),
                  )
                : const Expanded(child: SizedBox()),
            const SizedBox(
              width: 6,
            ),
            onAcept != null
                ? Expanded(
                    child: button(
                      textAcept ?? 'Aceptar',
                      showArrow: false,
                      padding: const EdgeInsets.all(8),
                      radius: 5,
                      type: '',
                      onTap: () {
                        onAcept();
                        Navigator.pop(context);
                      },
                    ),
                  )
                : const Expanded(child: SizedBox()),
          ],
        )
      ],
    ),
  );
}
