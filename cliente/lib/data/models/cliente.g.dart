// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cliente _$ClienteFromJson(Map<String, dynamic> json) => Cliente(
      name: json['name'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
      jobTitle: json['job_title'] as String? ?? "",
      company: json['company'] as String? ?? "",
      birthdate: json['birthdate'] as String? ?? "",
      ssn: json['ssn'] as String? ?? "",
      address: json['address'] as String? ?? "",
      bloodGroup: json['blood_group'] as String? ?? "",
      sex: json['sex'] as String? ?? "",
      email: json['email'] as String? ?? "",
      creditCardNumber: json['credit_card_number'] as String? ?? "",
      creditCardProvider: json['credit_card_provider'] as String? ?? "",
      creditCardSecurityCode:
          json['credit_card_security_code'] as String? ?? "",
      creditCardExpire: json['credit_card_expire'] as String? ?? "",
      policy: json['policy'] as String? ?? "",
      clabe: json['clabe'] as String? ?? "",
    );

Map<String, dynamic> _$ClienteToJson(Cliente instance) => <String, dynamic>{
      'name': instance.name,
      'last_name': instance.lastName,
      'job_title': instance.jobTitle,
      'company': instance.company,
      'birthdate': instance.birthdate,
      'ssn': instance.ssn,
      'address': instance.address,
      'blood_group': instance.bloodGroup,
      'sex': instance.sex,
      'email': instance.email,
      'credit_card_number': instance.creditCardNumber,
      'credit_card_provider': instance.creditCardProvider,
      'credit_card_security_code': instance.creditCardSecurityCode,
      'credit_card_expire': instance.creditCardExpire,
      'policy': instance.policy,
      'clabe': instance.clabe,
    };
