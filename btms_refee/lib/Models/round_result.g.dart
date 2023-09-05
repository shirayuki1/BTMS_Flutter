// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'round_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoundResult _$RoundResultFromJson(Map<String, dynamic> json) {
  return RoundResult(
      roundResult_Id: json['roundResult_Id'] as int,
      round_Id: json['round_Id'] as int?,
      // bird_Id: json['bird_Id'] as int?,
      candidateNumber: json['candidateNumber'] as int?,
      rank: json['rank'] as int?,
      warnCount: json['warnCount'] as int?,
      isPass: json['isPass'] as bool?,
      isEvaluate: json['isEvaluate'] as bool?,
      // bird: json['bird'] as Bird?,
      bird: json['bird'] == null
          ? null
          : Bird.fromJson(json['bird'] as Map<String, dynamic>));
}

Map<String, dynamic> _$RoundResultToJson(RoundResult instance) =>
    <String, dynamic>{
      'roundResult_Id': instance.roundResult_Id,
      'round_Id': instance.round_Id,
      // 'bird_Id': instance.bird_Id,
      'candidateNumber': instance.candidateNumber,
      'rank': instance.rank,
      'warnCount': instance.warnCount,
      'isPass': instance.isPass,
      'bird': instance.bird,
      'isEvaluate': instance.isEvaluate,
    };
