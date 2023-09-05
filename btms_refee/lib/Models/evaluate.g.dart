// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'evaluate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evaluate _$EvaluateFromJson(Map<String, dynamic> json) {
  return Evaluate(
    roundResult_Id: json['roundResult_Id'] as int?,
    isWarn: json['isWarn'] as bool?,
    note: json['note'] as String?,
    scoringCriterias: json['scoringCriterias'] as List<Map<String, int>>?,
  );
}

Map<String, dynamic> _$EvaluateToJson(Evaluate instance) => <String, dynamic>{
      'roundResult_Id': instance.roundResult_Id,
      'isWarn': instance.isWarn,
      'note': instance.note,
      'scoringCriterias': instance.scoringCriterias,
    };
