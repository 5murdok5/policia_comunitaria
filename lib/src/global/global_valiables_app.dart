import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/models/models.services.dart';
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

final List<ModelServices> listServicesMd = [
  ModelServices(
    title: 'Buscar UPC',
    description:
        'Laborum aliqua labore dolore aliqua. Labore mollit cillum enim officia veniam commodo cupidatat. Laborum voluptate do velit fugiat tempor laboris veniam pariatur reprehenderit consectetur aliqua nisi. Quis exercitation magna ex pariatur ullamco deserunt eu reprehenderit minim non ullamco dolor exercitation.',
    enable: true,
    iconService: 'https://i.imgur.com/KIfaqYD.png',
    largeDescription:
        'Proident labore pariatur veniam labore aliquip sit excepteur tempor in duis nulla id officia voluptate. Nulla sit dolor cillum cupidatat pariatur non Lorem nostrud. Laborum quis occaecat ut adipisicing. Consequat ad pariatur cillum cillum ut ad aliquip dolore. Do esse aliquip minim veniam culpa fugiat sunt id aute tempor tempor non in. Eu quis exercitation fugiat amet ipsum adipisicing aliquip laboris proident tempor cupidatat do. Aliquip proident qui tempor minim. Deserunt minim ipsum aliquip aliqua anim eiusmod ut nulla exercitation.',
  ),
  ModelServices(
    title: 'Emergencia',
    description:
        'Laborum aliqua labore dolore aliqua. Labore mollit cillum enim officia veniam commodo cupidatat. Laborum voluptate do velit fugiat tempor laboris veniam pariatur reprehenderit consectetur aliqua nisi. Quis exercitation magna ex pariatur ullamco deserunt eu reprehenderit minim non ullamco dolor exercitation.',
    enable: true,
    iconService: 'https://i.imgur.com/FK2owpe.png',
    largeDescription:
        'Proident labore pariatur veniam labore aliquip sit excepteur tempor in duis nulla id officia voluptate. Nulla sit dolor cillum cupidatat pariatur non Lorem nostrud. Laborum quis occaecat ut adipisicing. Consequat ad pariatur cillum cillum ut ad aliquip dolore. Do esse aliquip minim veniam culpa fugiat sunt id aute tempor tempor non in. Eu quis exercitation fugiat amet ipsum adipisicing aliquip laboris proident tempor cupidatat do. Aliquip proident qui tempor minim. Deserunt minim ipsum aliquip aliqua anim eiusmod ut nulla exercitation.',
  ),
  ModelServices(
    title: 'Denuncias',
    description:
        'Laborum aliqua labore dolore aliqua. Labore mollit cillum enim officia veniam commodo cupidatat. Laborum voluptate do velit fugiat tempor laboris veniam pariatur reprehenderit consectetur aliqua nisi. Quis exercitation magna ex pariatur ullamco deserunt eu reprehenderit minim non ullamco dolor exercitation.',
    enable: true,
    iconService: 'https://i.imgur.com/jxaG2cx.png',
    largeDescription:
        'Proident labore pariatur veniam labore aliquip sit excepteur tempor in duis nulla id officia voluptate. Nulla sit dolor cillum cupidatat pariatur non Lorem nostrud. Laborum quis occaecat ut adipisicing. Consequat ad pariatur cillum cillum ut ad aliquip dolore. Do esse aliquip minim veniam culpa fugiat sunt id aute tempor tempor non in. Eu quis exercitation fugiat amet ipsum adipisicing aliquip laboris proident tempor cupidatat do. Aliquip proident qui tempor minim. Deserunt minim ipsum aliquip aliqua anim eiusmod ut nulla exercitation.',
  ),
  ModelServices(
    title: 'Custodia',
    description:
        'Laborum aliqua labore dolore aliqua. Labore mollit cillum enim officia veniam commodo cupidatat. Laborum voluptate do velit fugiat tempor laboris veniam pariatur reprehenderit consectetur aliqua nisi. Quis exercitation magna ex pariatur ullamco deserunt eu reprehenderit minim non ullamco dolor exercitation.',
    enable: true,
    iconService: 'https://i.imgur.com/lZIjdoX.png',
    largeDescription:
        'Proident labore pariatur veniam labore aliquip sit excepteur tempor in duis nulla id officia voluptate. Nulla sit dolor cillum cupidatat pariatur non Lorem nostrud. Laborum quis occaecat ut adipisicing. Consequat ad pariatur cillum cillum ut ad aliquip dolore. Do esse aliquip minim veniam culpa fugiat sunt id aute tempor tempor non in. Eu quis exercitation fugiat amet ipsum adipisicing aliquip laboris proident tempor cupidatat do. Aliquip proident qui tempor minim. Deserunt minim ipsum aliquip aliqua anim eiusmod ut nulla exercitation.',
  ),
];
