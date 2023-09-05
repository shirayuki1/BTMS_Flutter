// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'register_history.dart';
// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

register_history _$RegisterHistoryFromJson(Map<String, dynamic> json) {
  return register_history(
    registerForm_Id: json['registerForm_Id'] as int?,
    tournament_Id: json['tournament_Id'] as int?,
    birdId: json['birdId'] as int?,
    payment_Id: json['payment_Id'] as String?,
    payment_Status: json['payment_Status'] as String?,
    createDate: json['createDate'] == null
        ? null
        : DateTime.parse(json['createDate'] as String),
    status: json['status'] as String?,
    candidate_Number: json['candidate_Number'] as int?,
  );
}

Map<String, dynamic> _$RegisterHistoryToJson(register_history instance) =>
    <String, dynamic>{
      'registerForm_Id': instance.registerForm_Id,
      'tournament_Id': instance.tournament_Id,
      'birdId': instance.birdId,
      'payment_Id': instance.payment_Id,
      'payment_Status': instance.payment_Status,
      'createDate': instance.createDate,
      'status': instance.status,
      'candidate_Number': instance.candidate_Number,
    };
