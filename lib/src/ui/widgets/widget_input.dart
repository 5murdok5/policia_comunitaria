import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';

class Input extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? showError;
  final EdgeInsetsGeometry padding;
  final Widget? prefixIcon;
  final int? maxLines;
  final bool readOnly;
  final bool autofocus;
  final Function()? onTap;
  final Color? colorInput;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final bool uppercasse;
  final bool enable;
  final double radiusInp;
  const Input({
    Key? key,
    this.title = "text example",
    this.controller,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText,
    this.showError,
    this.padding = const EdgeInsets.only(
      bottom: 12,
    ),
    this.prefixIcon,
    this.maxLines,
    this.readOnly = false,
    this.onTap,
    this.colorInput = Colors.transparent,
    this.autofocus = false,
    this.onChanged,
    this.focusNode,
    this.uppercasse = true,
    this.enable = true,
    this.radiusInp = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        focusNode: focusNode,
        onTap: onTap,
        readOnly: readOnly,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        autofocus: autofocus,
        maxLines: maxLines,
        enabled: enable,
        onChanged: onChanged,
        style: theme.textTheme.bodyText1!.copyWith(
          color: showError == true ? Colors.red : kSecondaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          labelText: title,
          fillColor: colorInput,
          labelStyle: theme.textTheme.bodyText1!.copyWith(
            color: showError == true ? Colors.red : kSecondaryColor,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kSecondaryColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(radiusInp),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kSecondaryColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kSecondaryColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class DropMenuList extends StatefulWidget {
  final bool isExpanded;
  final List<String> items;
  final bool? showError;
  final Function(String value) valueSelected;
  const DropMenuList({
    Key? key,
    this.isExpanded = false,
    this.showError,
    required this.valueSelected,
    required this.items,
  }) : super(key: key);

  @override
  State<DropMenuList> createState() => _DropMenuListState();
}

class _DropMenuListState extends State<DropMenuList> {
  String valueSelected = "";
  @override
  void initState() {
    setState(() {
      valueSelected = widget.items[0];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: widget.showError == true
              ? Colors.red
              : kSecondaryColor.withAlpha(205),
          style: BorderStyle.solid,
          width: 0.80,
        ),
      ),
      child: DropdownButton<String>(
        style: theme.textTheme.bodyText1!.copyWith(
          color: widget.showError == true ? Colors.red : kSecondaryColor,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        value: valueSelected,
        isExpanded: widget.isExpanded,
        borderRadius: BorderRadius.circular(8),
        items: widget.items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            valueSelected = value!;
          });
          widget.valueSelected(value!);
        },
      ),
    );
  }
}
