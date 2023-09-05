// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'score_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoreType _$ScoreTypeFromJson(Map<String, dynamic> json) {
  // json['weight'] as String;

  return ScoreType(
    id: json['scoringCriteriaType_Id'] as int?,
    name: json['name'] as String?,
    scoringCriterias: (json['scoringCriterias'] as List<dynamic>?)
        ?.map((e) => ScoreCriteria.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ScoreTypeToJson(ScoreType instance) => <String, dynamic>{
      'scoringCriteriaType_Id': instance.id,
      'name': instance.name,
      'scoringCriterias': instance.scoringCriterias,
    };
