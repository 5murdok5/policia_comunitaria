// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:policiacomunitaria/src/ui/pages/denuncias/page.denuncias.dart';
import 'package:policiacomunitaria/src/ui/pages/emergencia/page.emergencia.dart';
import 'package:policiacomunitaria/src/ui/pages/searchUpc/page.searchupc.dart';

class ModelServices {
  String? title;
  String? description;
  String? largeDescription;
  bool? enable;
  String? iconService;
  Widget? page;
  ModelServices({
    this.title,
    this.description,
    this.largeDescription,
    this.enable,
    this.iconService,
    this.page,
  });
}

final List<ModelServices> listServicesMd = [
  ModelServices(
    title: 'Buscar UPC',
    description:
        'Laborum aliqua labore dolore aliqua. Labore mollit cillum enim officia veniam commodo cupidatat. Laborum voluptate do velit fugiat tempor laboris veniam pariatur reprehenderit consectetur aliqua nisi. Quis exercitation magna ex pariatur ullamco deserunt eu reprehenderit minim non ullamco dolor exercitation.',
    enable: true,
    iconService: 'https://i.imgur.com/KIfaqYD.png',
    largeDescription:
        'Proident labore pariatur veniam labore aliquip sit excepteur tempor in duis nulla id officia voluptate. Nulla sit dolor cillum cupidatat pariatur non Lorem nostrud. Laborum quis occaecat ut adipisicing. Consequat ad pariatur cillum cillum ut ad aliquip dolore. Do esse aliquip minim veniam culpa fugiat sunt id aute tempor tempor non in. Eu quis exercitation fugiat amet ipsum adipisicing aliquip laboris proident tempor cupidatat do. Aliquip proident qui tempor minim. Deserunt minim ipsum aliquip aliqua anim eiusmod ut nulla exercitation.',
    page: const PageSearchUpc(),
  ),
  ModelServices(
    title: 'Emergencia',
    description:
        'Laborum aliqua labore dolore aliqua. Labore mollit cillum enim officia veniam commodo cupidatat. Laborum voluptate do velit fugiat tempor laboris veniam pariatur reprehenderit consectetur aliqua nisi. Quis exercitation magna ex pariatur ullamco deserunt eu reprehenderit minim non ullamco dolor exercitation.',
    enable: true,
    iconService: 'https://i.imgur.com/FK2owpe.png',
    largeDescription:
        'Proident labore pariatur veniam labore aliquip sit excepteur tempor in duis nulla id officia voluptate. Nulla sit dolor cillum cupidatat pariatur non Lorem nostrud. Laborum quis occaecat ut adipisicing. Consequat ad pariatur cillum cillum ut ad aliquip dolore. Do esse aliquip minim veniam culpa fugiat sunt id aute tempor tempor non in. Eu quis exercitation fugiat amet ipsum adipisicing aliquip laboris proident tempor cupidatat do. Aliquip proident qui tempor minim. Deserunt minim ipsum aliquip aliqua anim eiusmod ut nulla exercitation.',
    page: const Emergencia(),
  ),
  ModelServices(
    title: 'Denuncias',
    description:
        'Laborum aliqua labore dolore aliqua. Labore mollit cillum enim officia veniam commodo cupidatat. Laborum voluptate do velit fugiat tempor laboris veniam pariatur reprehenderit consectetur aliqua nisi. Quis exercitation magna ex pariatur ullamco deserunt eu reprehenderit minim non ullamco dolor exercitation.',
    enable: true,
    iconService: 'https://i.imgur.com/jxaG2cx.png',
    largeDescription:
        'Proident labore pariatur veniam labore aliquip sit excepteur tempor in duis nulla id officia voluptate. Nulla sit dolor cillum cupidatat pariatur non Lorem nostrud. Laborum quis occaecat ut adipisicing. Consequat ad pariatur cillum cillum ut ad aliquip dolore. Do esse aliquip minim veniam culpa fugiat sunt id aute tempor tempor non in. Eu quis exercitation fugiat amet ipsum adipisicing aliquip laboris proident tempor cupidatat do. Aliquip proident qui tempor minim. Deserunt minim ipsum aliquip aliqua anim eiusmod ut nulla exercitation.',
    page: const PageDenuncias(),
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
