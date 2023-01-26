import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';

//Actions

// global context app
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
BuildContext? ctx = navigatorKey.currentContext;

back() => Navigator.pop(ctx!);
void dismisKeybr() => Get.focusScope!.unfocus();

//Global Theme
ThemeData theme = Theme.of(ctx!);
Themes th = Themes();

//size screen
double height = MediaQuery.of(ctx!).size.height;
double width = MediaQuery.of(ctx!).size.width;
Size size = MediaQuery.of(ctx!).size;

//  paddings
double paddingHzApp = (width * 0.08) - 8;

String toCapitalized(text) => text.length > 0
    ? '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}'
    : '';

//TOdas las primeras letras mayusculas
String toTitleCase(text) => text
    .replaceAll(RegExp(' +'), ' ')
    .toString()
    .split(' ')
    .map((str) => toCapitalized(str))
    .join(' ');

// const myLocation = LatLng(-12.0562176, -77.0296812);

//import firebase db
final FirebaseFirestore db = FirebaseFirestore.instance;
