// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pago.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pago _$PagoFromJson(Map<String, dynamic> json) => Pago(
      amount: json['amount'] as int? ?? 0,
      transactionType: json['transaction_type'] as String? ?? "",
      status: json['status'] as String? ?? "",
      creationDate: json['creation_date'] as String? ?? "",
      transactionId: json['transaction_id'] as String? ?? "",
      ssn: json['ssn'] as String? ?? "",
      source: json['source'] as String? ?? "",
    );

Map<String, dynamic> _$PagoToJson(Pago instance) => <String, dynamic>{
      'amount': instance.amount,
      'transaction_type': instance.transactionType,
      'status': instance.status,
      'creation_date': instance.creationDate,
      'transaction_id': instance.transactionId,
      'ssn': instance.ssn,
      'source': instance.source,
    };
