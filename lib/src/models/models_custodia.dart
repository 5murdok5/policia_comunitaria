import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelCustodia {
  String? idUsuario;
  String? idAgente;
  ModelAgenteAceptado? infoAceptado;
  int? fechaCreado;
  String? lugarSalida;
  String? lugarDestino;
  String? motivo;
  String? idCustodia;
  ModelCustodia({
    this.idUsuario,
    this.idAgente,
    this.infoAceptado,
    this.fechaCreado,
    this.lugarSalida,
    this.lugarDestino,
    this.motivo,
    this.idCustodia,
  });

  ModelCustodia copyWith({
    String? idUsuario,
    String? idAgente,
    ModelAgenteAceptado? infoAceptado,
    int? fechaCreado,
    String? lugarSalida,
    String? lugarDestino,
    String? motivo,
    String? idCustodia,
  }) {
    return ModelCustodia(
      idUsuario: idUsuario ?? this.idUsuario,
      idAgente: idAgente ?? this.idAgente,
      infoAceptado: infoAceptado ?? this.infoAceptado,
      fechaCreado: fechaCreado ?? this.fechaCreado,
      lugarSalida: lugarSalida ?? this.lugarSalida,
      lugarDestino: lugarDestino ?? this.lugarDestino,
      motivo: motivo ?? this.motivo,
      idCustodia: idCustodia ?? this.idCustodia,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUsuario': idUsuario,
      'idAgente': idAgente,
      'infoAceptado': infoAceptado?.toMap(),
      'fechaCreado': fechaCreado,
      'lugarSalida': lugarSalida,
      'lugarDestino': lugarDestino,
      'motivo': motivo,
      'idCustodia': idCustodia,
    };
  }

  factory ModelCustodia.fromMap(Map<String, dynamic> map) {
    return ModelCustodia(
      idUsuario: map['idUsuario'] != null ? map['idUsuario'] as String : null,
      idAgente: map['idAgente'] != null ? map['idAgente'] as String : null,
      infoAceptado: map['infoAceptado'] != null
          ? ModelAgenteAceptado.fromMap(
              map['infoAceptado'] as Map<String, dynamic>)
          : null,
      fechaCreado:
          map['fechaCreado'] != null ? map['fechaCreado'] as int : null,
      lugarSalida:
          map['lugarSalida'] != null ? map['lugarSalida'] as String : null,
      lugarDestino:
          map['lugarDestino'] != null ? map['lugarDestino'] as String : null,
      motivo: map['motivo'] != null ? map['motivo'] as String : null,
      idCustodia:
          map['idCustodia'] != null ? map['idCustodia'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelCustodia.fromJson(String source) =>
      ModelCustodia.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelCustodia(idUsuario: $idUsuario, idAgente: $idAgente, infoAceptado: $infoAceptado, fechaCreado: $fechaCreado, lugarSalida: $lugarSalida, lugarDestino: $lugarDestino, motivo: $motivo, idCustodia: $idCustodia)';
  }

  @override
  bool operator ==(covariant ModelCustodia other) {
    if (identical(this, other)) return true;

    return other.idUsuario == idUsuario &&
        other.idAgente == idAgente &&
        other.infoAceptado == infoAceptado &&
        other.fechaCreado == fechaCreado &&
        other.lugarSalida == lugarSalida &&
        other.lugarDestino == lugarDestino &&
        other.motivo == motivo &&
        other.idCustodia == idCustodia;
  }

  @override
  int get hashCode {
    return idUsuario.hashCode ^
        idAgente.hashCode ^
        infoAceptado.hashCode ^
        fechaCreado.hashCode ^
        lugarSalida.hashCode ^
        lugarDestino.hashCode ^
        motivo.hashCode ^
        idCustodia.hashCode;
  }
}

class ModelAgenteAceptado {
  ModelUserAgente? agenteAceptado;
  int? fechaAceptado;
  ModelAgenteAceptado({
    this.agenteAceptado,
    this.fechaAceptado,
  });

  ModelAgenteAceptado copyWith({
    ModelUserAgente? agenteAceptado,
    int? fechaAceptado,
  }) {
    return ModelAgenteAceptado(
      agenteAceptado: agenteAceptado ?? this.agenteAceptado,
      fechaAceptado: fechaAceptado ?? this.fechaAceptado,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'agenteAceptado': agenteAceptado?.toMap(),
      'fechaAceptado': fechaAceptado,
    };
  }

  factory ModelAgenteAceptado.fromMap(Map<String, dynamic> map) {
    return ModelAgenteAceptado(
      agenteAceptado: map['agenteAceptado'] != null
          ? ModelUserAgente.fromMap(
              map['agenteAceptado'] as Map<String, dynamic>)
          : null,
      fechaAceptado:
          map['fechaAceptado'] != null ? map['fechaAceptado'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelAgenteAceptado.fromJson(String source) =>
      ModelAgenteAceptado.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ModelAgenteAceptado(agenteAceptado: $agenteAceptado, fechaAceptado: $fechaAceptado)';

  @override
  bool operator ==(covariant ModelAgenteAceptado other) {
    if (identical(this, other)) return true;

    return other.agenteAceptado == agenteAceptado &&
        other.fechaAceptado == fechaAceptado;
  }

  @override
  int get hashCode => agenteAceptado.hashCode ^ fechaAceptado.hashCode;
}

class ModelUserAgente {
  String? idAgente;
  String? nombres;
  String? rango;
  String? provincia;
  String? canton;
  String? parroquia;
  String? telefono1;
  String? telefono2;
  ModelUserAgente({
    this.idAgente,
    this.nombres,
    this.rango,
    this.provincia,
    this.canton,
    this.parroquia,
    this.telefono1,
    this.telefono2,
  });

  ModelUserAgente copyWith({
    String? idAgente,
    String? nombres,
    String? rango,
    String? provincia,
    String? canton,
    String? parroquia,
    String? telefono1,
    String? telefono2,
  }) {
    return ModelUserAgente(
      idAgente: idAgente ?? this.idAgente,
      nombres: nombres ?? this.nombres,
      rango: rango ?? this.rango,
      provincia: provincia ?? this.provincia,
      canton: canton ?? this.canton,
      parroquia: parroquia ?? this.parroquia,
      telefono1: telefono1 ?? this.telefono1,
      telefono2: telefono2 ?? this.telefono2,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idAgente': idAgente,
      'nombres': nombres,
      'rango': rango,
      'provincia': provincia,
      'canton': canton,
      'parroquia': parroquia,
      'telefono1': telefono1,
      'telefono2': telefono2,
    };
  }

  factory ModelUserAgente.fromMap(Map<String, dynamic> map) {
    return ModelUserAgente(
      idAgente: map['idAgente'] != null ? map['idAgente'] as String : null,
      nombres: map['nombres'] != null ? map['nombres'] as String : null,
      rango: map['rango'] != null ? map['rango'] as String : null,
      provincia: map['provincia'] != null ? map['provincia'] as String : null,
      canton: map['canton'] != null ? map['canton'] as String : null,
      parroquia: map['parroquia'] != null ? map['parroquia'] as String : null,
      telefono1: map['telefono1'] != null ? map['telefono1'] as String : null,
      telefono2: map['telefono2'] != null ? map['telefono2'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelUserAgente.fromJson(String source) =>
      ModelUserAgente.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelUserAgente(idAgente: $idAgente, nombres: $nombres, rango: $rango, provincia: $provincia, canton: $canton, parroquia: $parroquia, telefono1: $telefono1, telefono2: $telefono2)';
  }

  @override
  bool operator ==(covariant ModelUserAgente other) {
    if (identical(this, other)) return true;

    return other.idAgente == idAgente &&
        other.nombres == nombres &&
        other.rango == rango &&
        other.provincia == provincia &&
        other.canton == canton &&
        other.parroquia == parroquia &&
        other.telefono1 == telefono1 &&
        other.telefono2 == telefono2;
  }

  @override
  int get hashCode {
    return idAgente.hashCode ^
        nombres.hashCode ^
        rango.hashCode ^
        provincia.hashCode ^
        canton.hashCode ^
        parroquia.hashCode ^
        telefono1.hashCode ^
        telefono2.hashCode;
  }
}
