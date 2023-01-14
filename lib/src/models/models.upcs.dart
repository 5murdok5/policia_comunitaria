// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:latlong2/latlong.dart';

class ModelsUpcs {
  String? fistStreet;
  String? secondStreet;
  String? threeStreet;
  String? reference;
  String? phone1;
  String? phone2;
  String? nameUpc;
  LatLng? location;
  bool? isOpen;
  int index;
  ModelsUpcs({
    this.fistStreet,
    this.secondStreet,
    this.threeStreet,
    this.reference,
    this.phone1,
    this.phone2,
    this.nameUpc,
    this.location,
    this.isOpen,
    this.index = 0,
  });

  ModelsUpcs copyWith({
    String? fistStreet,
    String? secondStreet,
    String? threeStreet,
    String? reference,
    String? phone1,
    String? phone2,
    String? nameUpc,
    LatLng? location,
    bool? isOpen,
  }) {
    return ModelsUpcs(
      fistStreet: fistStreet ?? this.fistStreet,
      secondStreet: secondStreet ?? this.secondStreet,
      threeStreet: threeStreet ?? this.threeStreet,
      reference: reference ?? this.reference,
      phone1: phone1 ?? this.phone1,
      phone2: phone2 ?? this.phone2,
      nameUpc: nameUpc ?? this.nameUpc,
      location: location ?? this.location,
      isOpen: isOpen ?? this.isOpen,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fistStreet': fistStreet,
      'secondStreet': secondStreet,
      'threeStreet': threeStreet,
      'reference': reference,
      'phone1': phone1,
      'phone2': phone2,
      'nameUpc': nameUpc,
      'location': location,
      'isOpen': isOpen,
    };
  }

  factory ModelsUpcs.fromMap(Map<String, dynamic> map) {
    return ModelsUpcs(
      fistStreet:
          map['fistStreet'] != null ? map['fistStreet'] as String : null,
      secondStreet:
          map['secondStreet'] != null ? map['secondStreet'] as String : null,
      threeStreet:
          map['threeStreet'] != null ? map['threeStreet'] as String : null,
      reference: map['reference'] != null ? map['reference'] as String : null,
      phone1: map['phone1'] != null ? map['phone1'] as String : null,
      phone2: map['phone2'] != null ? map['phone2'] as String : null,
      nameUpc: map['nameUpc'] != null ? map['nameUpc'] as String : null,
      location: map['location'],
      isOpen: map['isOpen'] != null ? map['isOpen'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelsUpcs.fromJson(String source) =>
      ModelsUpcs.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelsUpcs(fistStreet: $fistStreet, secondStreet: $secondStreet, threeStreet: $threeStreet, reference: $reference, phone1: $phone1, phone2: $phone2, nameUpc: $nameUpc, location: $location, isOpen: $isOpen)';
  }

  @override
  bool operator ==(covariant ModelsUpcs other) {
    if (identical(this, other)) return true;

    return other.fistStreet == fistStreet &&
        other.secondStreet == secondStreet &&
        other.threeStreet == threeStreet &&
        other.reference == reference &&
        other.phone1 == phone1 &&
        other.phone2 == phone2 &&
        other.nameUpc == nameUpc &&
        other.location == location &&
        other.isOpen == isOpen;
  }

  @override
  int get hashCode {
    return fistStreet.hashCode ^
        secondStreet.hashCode ^
        threeStreet.hashCode ^
        reference.hashCode ^
        phone1.hashCode ^
        phone2.hashCode ^
        nameUpc.hashCode ^
        location.hashCode ^
        isOpen.hashCode;
  }
}

final List<ModelsUpcs> listTestUpcs = [
  ModelsUpcs(
    fistStreet:
        'Laboris ullamco pariatur ut dolor nisi occaecat ex tempor sit officia tempor occaecat.',
    isOpen: true,
    location: LatLng(-4.012779, -79.197240),
    nameUpc: 'La Pradera',
    phone1: '0989989898',
    phone2: '21049039',
    reference: 'Cerca del Parque junto a las canchas',
    secondStreet: 'Consequat pariatur enim sint 22',
    threeStreet: '',
    index: 0,
  ),
  ModelsUpcs(
    fistStreet:
        'Laboris ullamco pariatur ut dolor nisi occaecat ex tempor sit officia tempor occaecat.',
    isOpen: true,
    location: LatLng(-4.011353, -79.198685),
    nameUpc: 'La Pradera 3',
    phone1: '0989989898',
    phone2: '21049039',
    reference: 'Cerca del Parque junto a las canchas',
    secondStreet: 'Consequat pariatur enim sint 22',
    threeStreet: '',
    index: 1,
  ),
  ModelsUpcs(
    fistStreet:
        'Laboris ullamco pariatur ut dolor nisi occaecat ex tempor sit officia tempor occaecat.',
    isOpen: true,
    location: LatLng(-4.012343, -79.198471),
    nameUpc: 'La Pradera 4',
    phone1: '0989989898',
    phone2: '21049039',
    reference: 'Cerca del Parque junto a las canchas',
    secondStreet: 'Consequat pariatur enim sint 22',
    threeStreet: '',
    index: 2,
  ),
  ModelsUpcs(
    fistStreet:
        'Laboris ullamco pariatur ut dolor nisi occaecat ex tempor sit officia tempor occaecat.',
    isOpen: true,
    location: LatLng(-4.013460, -79.198302),
    nameUpc: 'La Pradera 5',
    phone1: '0989989898',
    phone2: '21049039',
    reference: 'Cerca del Parque junto a las canchas',
    secondStreet: 'Consequat pariatur enim sint 22',
    threeStreet: '',
    index: 3,
  ),
];
