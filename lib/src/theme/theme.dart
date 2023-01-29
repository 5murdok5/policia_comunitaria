import 'package:flutter/material.dart';

const Color KmodeALertColor = Colors.redAccent;

const Color kprimaryColor = Color(0xFF0B195E);
const Color kSecondaryColor = Color(0xFF1c232f);
const Color kSecondaryColorDark = Color.fromARGB(255, 13, 32, 65);
const Color kScafoldColor = Color(0xFFF9F9F9);

const Color kTextBlackColor = Color(0xFF313131);
const Color kTextWhiteColor = Color(0xDAF9F9F9);
const Color kiconColor = kSecondaryColor;

class Themes {
  static const TextStyle headline1 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 22,
    fontWeight: FontWeight.w800,
  );
  static const TextStyle headline2 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 19,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle subtitle2 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle bodyText2 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle headline3 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 15,
    fontWeight: FontWeight.w200,
  );
  static const TextStyle headline4 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 15,
    fontWeight: FontWeight.w100,
  );
  setThemeLight() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: kScafoldColor,
      brightness: Brightness.light,
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        headline1: headline1.copyWith(
          color: kTextBlackColor,
        ),
        headline2: headline2.copyWith(
          color: kTextBlackColor,
        ),
        headline3: headline3.copyWith(
          color: kTextBlackColor,
        ),
        headline4: headline4.copyWith(
          color: kTextBlackColor,
        ),
        subtitle1: subtitle1.copyWith(
          color: kTextBlackColor,
        ),
        subtitle2: subtitle2.copyWith(
          color: kTextBlackColor,
        ),
        bodyText1: bodyText1.copyWith(
          color: kTextBlackColor,
        ),
        bodyText2: bodyText2.copyWith(
          color: kTextBlackColor,
        ),
      ),
    );
  }
}
