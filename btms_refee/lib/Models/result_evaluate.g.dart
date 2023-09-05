// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'result_evaluate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultEvaluate _$ResultEvaluateFromJson(Map<String, dynamic> json) {
  return ResultEvaluate(
    roundResultDetail_Id: json['roundResultDetail_Id'] as int?,
    roundResult_Id: json['roundResult_Id'] as int?,
    referee_Id: json['referee_Id'] as int?,
    isWarn: json['isWarn'] as bool?,
    note: json['note'] as String?,
    // scoringCriterias: json['scoringCriterias'] as List<Map<String, dynamic>>?,
    scoreType: (json['scoringCriteriaTypes'] as List<dynamic>)
        .map((e) => ScoreType.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResultEvaluateToJson(ResultEvaluate instance) =>
    <String, dynamic>{
      'roundResultDetail_Id': instance.roundResultDetail_Id,
      'roundResult_Id': instance.roundResult_Id,
      'referee_Id': instance.referee_Id,
      'isWarn': instance.isWarn,
      'note': instance.note,
      'scoringCriteriaTypes': instance.scoreType,
    };
