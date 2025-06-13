// -------------------------------------------------------------------------
//  Archivo: client.dart
//  Capitulo: Estilo Microservicios
//  Autor(es): Perla Velasco & Yonathan Mtz. & Jorge Solís
//  Version: 3.0.0 Febrero 2022
//  Descripción:
//
//    Éste archivo define las propiedades de un Cliente.
//
// -------------------------------------------------------------------------
import 'package:json_annotation/json_annotation.dart';
part 'cliente.g.dart';

@JsonSerializable()
class Cliente {
  String name;
  @JsonKey(name: 'last_name')
  String lastName;
  @JsonKey(name: 'job_title')
  String jobTitle;
  String company;
  String birthdate;
  String ssn;
  String address;
  @JsonKey(name: 'blood_group')
  String bloodGroup;
  String sex;
  String email;
  @JsonKey(name: 'credit_card_number')
  String creditCardNumber;
  @JsonKey(name: 'credit_card_provider')
  String creditCardProvider;
  @JsonKey(name: 'credit_card_security_code')
  String creditCardSecurityCode;
  @JsonKey(name: 'credit_card_expire')
  String creditCardExpire;
  String policy;
  String clabe;

  Cliente({
    this.name = "",
    this.lastName = "",
    this.jobTitle = "",
    this.company = "",
    this.birthdate = "",
    this.ssn = "",
    this.address = "",
    this.bloodGroup = "",
    this.sex = "",
    this.email = "",
    this.creditCardNumber = "",
    this.creditCardProvider = "",
    this.creditCardSecurityCode = "",
    this.creditCardExpire = "",
    this.policy = "",
    this.clabe = "",
  });

  factory Cliente.fromJson(Map<String, dynamic> data) =>
      _$ClienteFromJson(data);

  Map<String, dynamic> toJson() => _$ClienteToJson(this);
}
