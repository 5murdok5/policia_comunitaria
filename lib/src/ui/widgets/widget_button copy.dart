import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_load.dart';

///types:  secondary, primary_line, secondary_line, light_primary, solid_primary, emply=defauld primary
button(
  String text, {
  Function()? onTap,
  String type = 'primary',
  bool disable = false,
  bool load = false,
  bool showArrow = true,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry margin = const EdgeInsets.symmetric(vertical: 4),
  double radius = 6.0,
}) {
  switch (type) {
    case 'secondary':
      return Button(
        textbtn: text,
        colorBtn: kSecondaryColor,
        colorText: Colors.white,
        disable: disable,
        load: load,
        padding: padding,
        showArrowIcon: showArrow,
        margin: margin,
        onTap: onTap,
        radius: radius,
      );
    case 'cancel':
      return Button(
        textbtn: text,
        colorBtn: Colors.redAccent,
        colorText: Colors.white,
        disable: disable,
        load: load,
        padding: padding,
        showArrowIcon: showArrow,
        margin: margin,
        onTap: onTap,
        radius: radius,
      );
    case 'primary_line':
      return Button(
        textbtn: text,
        onlyBorder: true,
        disable: disable,
        load: load,
        padding: padding,
        showArrowIcon: showArrow,
        margin: margin,
        onTap: onTap,
        radius: radius,
      );
    case 'secondary_line':
      return Button(
        textbtn: text,
        colorBtn: kSecondaryColor.withAlpha(200),
        onlyBorder: true,
        disable: disable,
        load: load,
        padding: padding,
        showArrowIcon: showArrow,
        margin: margin,
        onTap: onTap,
        radius: radius,
      );
    case 'light_primary':
      return Button(
        textbtn: text,
        colorBtn: Colors.white,
        onlyBorder: true,
        disable: disable,
        load: load,
        padding: padding,
        showArrowIcon: showArrow,
        margin: margin,
        onTap: onTap,
        radius: radius,
      );
    case 'solid_primary':
      return Button(
        textbtn: text,
        colorBtn: Colors.white,
        colorText: kSecondaryColor,
        disable: disable,
        load: load,
        padding: padding,
        showArrowIcon: showArrow,
        margin: margin,
        onTap: onTap,
        radius: radius,
      );
    default:
      return Button(
        textbtn: text,
        disable: disable,
        load: load,
        padding: padding,
        showArrowIcon: showArrow,
        margin: margin,
        onTap: onTap,
        radius: radius,
      );
  }
}

class Button extends StatelessWidget {
  final double radius;
  final String textbtn;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final Color? colorBtn;
  final Color? colorText;
  final bool onlyBorder;
  final bool showArrowIcon;
  final bool? load;
  final bool? disable;
  final double width;
  final Widget? widgetText;

  final EdgeInsetsGeometry margin;
  const Button({
    Key? key,
    this.radius = 6,
    this.textbtn = "text_example",
    this.onTap,
    this.colorBtn = kprimaryColor,
    this.colorText = kSecondaryColor,
    this.onlyBorder = false,
    this.showArrowIcon = true,
    this.margin = const EdgeInsets.symmetric(vertical: 4),
    this.load,
    this.disable = false,
    this.padding,
    this.widgetText,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: load == true ? 0.82 : 1.0,
      child: Padding(
        padding: margin,
        child: InkWell(
          splashColor: onlyBorder
              ? colorBtn!.withAlpha(100)
              : kprimaryColor.withAlpha(100),
          onTap: load == true || disable == true ? null : onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Material(
                  color: onlyBorder
                      ? Colors.transparent
                      : disable == true
                          ? colorBtn!.withAlpha(100)
                          : colorBtn,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: width,
                    padding:
                        padding ?? const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: onlyBorder
                            ? disable == true
                                ? Colors.grey[300]!
                                : colorBtn!
                            : Colors.transparent,
                        width: 1.7,
                      ),
                      borderRadius: BorderRadius.circular(radius),
                      color: onlyBorder
                          ? Colors.transparent
                          : disable == true
                              ? colorBtn!.withAlpha(50)
                              : Colors.transparent,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widgetText ?? const SizedBox(),
                        Text(
                          textbtn,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.subtitle2!.copyWith(
                            color: onlyBorder
                                ? disable == true
                                    ? colorText!.withAlpha(120)
                                    : colorBtn
                                : disable == true
                                    ? colorText!.withAlpha(120)
                                    : colorText ?? kTextBlackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: load == true
                      ? loadwidget(
                          colorIndicator: onlyBorder
                              ? disable!
                                  ? colorText!.withAlpha(130)
                                  : colorBtn
                              : disable!
                                  ? colorText!.withAlpha(130)
                                  : colorText,
                        )
                      : Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: showArrowIcon
                              ? onlyBorder
                                  ? disable == true
                                      ? colorText!.withAlpha(130)
                                      : colorBtn
                                  : disable == true
                                      ? colorText!.withAlpha(130)
                                      : colorText
                              : Colors.transparent,
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
