import 'package:json_annotation/json_annotation.dart';

part 'pago.g.dart';

@JsonSerializable()
class Pago {
  int amount;
  @JsonKey(name: 'transaction_type')
  String transactionType;
  String status;
  @JsonKey(name: 'creation_date')
  String creationDate;
  @JsonKey(name: 'transaction_id')
  String transactionId;
  String ssn;
  String source;

  Pago({
    this.amount = 0,
    this.transactionType = "",
    this.status = "",
    this.creationDate = "",
    this.transactionId = "",
    this.ssn = "",
    this.source = "",
  });

  factory Pago.fromJson(Map<String, dynamic> data) => _$PagoFromJson(data);

  Map<String, dynamic> toJson() => _$PagoToJson(this);
}
