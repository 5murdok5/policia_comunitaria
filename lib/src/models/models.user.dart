// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:policiacomunitaria/src/models/models_emergencia.dart';

class UserModel {
  String? dni;
  String? name;
  String? email;
  String? userApp;
  String? direccion;
  String? idUser;
  Location? userLocation;
  UserModel({
    this.dni,
    this.name,
    this.email,
    this.userApp,
    this.direccion,
    this.idUser,
    this.userLocation,
  });

  UserModel copyWith({
    String? dni,
    String? name,
    String? email,
    String? userApp,
    String? direccion,
    String? idUser,
  }) {
    return UserModel(
      dni: dni ?? this.dni,
      name: name ?? this.name,
      email: email ?? this.email,
      userApp: userApp ?? this.userApp,
      direccion: direccion ?? this.direccion,
      idUser: idUser ?? this.idUser,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dni': dni,
      'name': name,
      'email': email,
      'userApp': userApp,
      'direccion': direccion,
      'idUser': idUser,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      dni: map['dni'] != null ? map['dni'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      userApp: map['userApp'] != null ? map['userApp'] as String : null,
      direccion: map['direccion'] != null ? map['direccion'] as String : null,
      idUser: map['idUser'] != null ? map['idUser'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(dni: $dni, name: $name, email: $email, userApp: $userApp, direccion: $direccion, idUser: $idUser)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.dni == dni &&
        other.name == name &&
        other.email == email &&
        other.userApp == userApp &&
        other.direccion == direccion &&
        other.idUser == idUser;
  }

  @override
  int get hashCode {
    return dni.hashCode ^
        name.hashCode ^
        email.hashCode ^
        userApp.hashCode ^
        direccion.hashCode ^
        idUser.hashCode;
  }
}
