// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MessageModel {
  String? message;
  String? type;
  int? dateSend;
  int? dateRecived;
  String? idUser;
  MessageModel({
    this.message,
    this.type,
    this.dateSend,
    this.dateRecived,
    this.idUser,
  });

  MessageModel copyWith({
    String? message,
    String? type,
    int? dateSend,
    int? dateRecived,
    String? idUser,
  }) {
    return MessageModel(
      message: message ?? this.message,
      type: type ?? this.type,
      dateSend: dateSend ?? this.dateSend,
      dateRecived: dateRecived ?? this.dateRecived,
      idUser: idUser ?? this.idUser,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'type': type,
      'dateSend': dateSend,
      'dateRecived': dateRecived,
      'idUser': idUser,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      message: map['message'] != null ? map['message'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      dateSend: map['dateSend'] != null ? map['dateSend'] as int : null,
      dateRecived:
          map['dateRecived'] != null ? map['dateRecived'] as int : null,
      idUser: map['idUser'] != null ? map['idUser'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageModel(message: $message, type: $type, dateSend: $dateSend, dateRecived: $dateRecived, idUser: $idUser)';
  }

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.type == type &&
        other.dateSend == dateSend &&
        other.dateRecived == dateRecived &&
        other.idUser == idUser;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        type.hashCode ^
        dateSend.hashCode ^
        dateRecived.hashCode ^
        idUser.hashCode;
  }
}
