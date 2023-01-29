// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class EmergenciaModel {
  Location? ubicacionUsuario;
  String? urlAudio;
  int? fechaSolicitud;
  String? estado;
  String? idUsuario;
  String? idUsuarioRespuesta;
  String? idEmergencia;
  List<History>? history;
  EmergenciaModel({
    this.ubicacionUsuario,
    this.urlAudio,
    this.fechaSolicitud,
    this.estado,
    this.idUsuario,
    this.idUsuarioRespuesta,
    this.idEmergencia,
    this.history,
  });

  EmergenciaModel copyWith({
    Location? ubicacionUsuario,
    String? urlAudio,
    int? fechaSolicitud,
    String? estado,
    String? idUsuario,
    String? idUsuarioRespuesta,
    String? idEmergencia,
    List<History>? history,
  }) {
    return EmergenciaModel(
      ubicacionUsuario: ubicacionUsuario ?? this.ubicacionUsuario,
      urlAudio: urlAudio ?? this.urlAudio,
      fechaSolicitud: fechaSolicitud ?? this.fechaSolicitud,
      estado: estado ?? this.estado,
      idUsuario: idUsuario ?? this.idUsuario,
      idUsuarioRespuesta: idUsuarioRespuesta ?? this.idUsuarioRespuesta,
      idEmergencia: idEmergencia ?? this.idEmergencia,
      history: history ?? this.history,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ubicacionUsuario': ubicacionUsuario?.toMap(),
      'urlAudio': urlAudio,
      'fechaSolicitud': fechaSolicitud,
      'estado': estado,
      'idUsuario': idUsuario,
      'idUsuarioRespuesta': idUsuarioRespuesta,
      'idEmergencia': idEmergencia,
      'history': history?.map((x) => x.toMap()).toList(),
    };
  }

  factory EmergenciaModel.fromMap(Map<String, dynamic> map) {
    return EmergenciaModel(
      ubicacionUsuario: map['ubicacionUsuario'] != null
          ? Location.fromMap(map['ubicacionUsuario'] as Map<String, dynamic>)
          : null,
      urlAudio: map['urlAudio'] != null ? map['urlAudio'] as String : null,
      fechaSolicitud:
          map['fechaSolicitud'] != null ? map['fechaSolicitud'] as int : null,
      estado: map['estado'] != null ? map['estado'] as String : null,
      idUsuario: map['idUsuario'] != null ? map['idUsuario'] as String : null,
      idUsuarioRespuesta: map['idUsuarioRespuesta'] != null
          ? map['idUsuarioRespuesta'] as String
          : null,
      idEmergencia:
          map['idEmergencia'] != null ? map['idEmergencia'] as String : null,
      history: map['history'] != null
          ? List<History>.from(
              (map['history'] as List<int>).map<History?>(
                (x) => History.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmergenciaModel.fromJson(String source) =>
      EmergenciaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EmergenciaModel(ubicacionUsuario: $ubicacionUsuario, urlAudio: $urlAudio, fechaSolicitud: $fechaSolicitud, estado: $estado, idUsuario: $idUsuario, idUsuarioRespuesta: $idUsuarioRespuesta, idEmergencia: $idEmergencia, history: $history)';
  }

  @override
  bool operator ==(covariant EmergenciaModel other) {
    if (identical(this, other)) return true;

    return other.ubicacionUsuario == ubicacionUsuario &&
        other.urlAudio == urlAudio &&
        other.fechaSolicitud == fechaSolicitud &&
        other.estado == estado &&
        other.idUsuario == idUsuario &&
        other.idUsuarioRespuesta == idUsuarioRespuesta &&
        other.idEmergencia == idEmergencia &&
        listEquals(other.history, history);
  }

  @override
  int get hashCode {
    return ubicacionUsuario.hashCode ^
        urlAudio.hashCode ^
        fechaSolicitud.hashCode ^
        estado.hashCode ^
        idUsuario.hashCode ^
        idUsuarioRespuesta.hashCode ^
        idEmergencia.hashCode ^
        history.hashCode;
  }
}

class Location {
  double latitude;
  double longitude;
  Location({
    required this.latitude,
    required this.longitude,
  });

  Location copyWith({
    double? latitude,
    double? longitude,
  }) {
    return Location(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Location(latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}

class History {
  String detalle;
  int fecha;
  History({
    required this.detalle,
    required this.fecha,
  });

  History copyWith({
    String? detalle,
    int? fecha,
  }) {
    return History(
      detalle: detalle ?? this.detalle,
      fecha: fecha ?? this.fecha,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'detalle': detalle,
      'fecha': fecha,
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      detalle: map['detalle'] as String,
      fecha: map['fecha'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory History.fromJson(String source) =>
      History.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'History(detalle: $detalle, fecha: $fecha)';

  @override
  bool operator ==(covariant History other) {
    if (identical(this, other)) return true;

    return other.detalle == detalle && other.fecha == fecha;
  }

  @override
  int get hashCode => detalle.hashCode ^ fecha.hashCode;
}
