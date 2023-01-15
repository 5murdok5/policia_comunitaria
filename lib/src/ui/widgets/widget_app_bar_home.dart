import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

PreferredSizeWidget customAppbar({
  String title = '',
  double sizeTitle = 18,
  Widget? iconBack,
  Widget? iconAction,
  Color? colorApp = Colors.white,
  Color? colorText = Colors.black,
  PreferredSizeWidget? bottom,
  EdgeInsetsGeometry? paddingtitle,
  bool showBackButton = false,
  Function()? onTapAddonBack,
  bool showLogo = true,
  bool capitalizaeFirst = true,
  Function()? onpressbackbtn,
}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: colorApp,
    automaticallyImplyLeading: false,
    bottom: bottom,
    title: title == ""
        ? iconBack ?? const SizedBox()
        : Row(
            children: [
              InkWell(
                onTap: showBackButton
                    ? () {
                        if (onpressbackbtn != null) {
                          onpressbackbtn();
                        } else {
                          if (onTapAddonBack != null) onTapAddonBack();
                          back();
                        }
                      }
                    : null,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    showBackButton
                        ? Icon(
                            Icons.keyboard_arrow_left_rounded,
                            color: colorText,
                          )
                        : const SizedBox(),
                    Padding(
                      padding: paddingtitle ?? const EdgeInsets.only(left: 10),
                      child: iconBack ??
                          text(
                            title,
                            type: 'subtitle',
                            color: colorText,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
  );
}
