// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'score_criteria.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoreCriteria _$ScoreCriteriaFromJson(Map<String, dynamic> json) {
  // json['weight'] as String;

  return ScoreCriteria(
    id: json['scoringCriteria_Id'] as int?,
    name: json['name'] as String?,
    // applyFromRound: json['applyFromRound'] as int?,
    isSelected: false,
    // isSelected: json['bt'] as bool,
  );
}

Map<String, dynamic> _$ScoreCriteriaToJson(ScoreCriteria instance) =>
    <String, dynamic>{
      'scoringCriteria_Id': instance.id,
      'name': instance.name,
      // 'applyFromRound': instance.applyFromRound,
      // 'bt': instance.isSelected,
    };
