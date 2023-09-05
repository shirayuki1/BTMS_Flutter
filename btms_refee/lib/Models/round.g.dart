// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Round _$RoundFromJson(Map<String, dynamic> json) {
  return Round(
    round_Id: json['round_Id'] as int?,
    tournament_Id: json['tournament_Id'] as int?,
    name: json['name'] as String?,
    roundNumber: json['roundNumber'] as int?,
    // startTime: json['startTime'] == null
    //     ? null
    //     : DateTime.parse(json['startTime'] as String),
    // endTime: json['endTime'] == null
    //     ? null
    //     : DateTime.parse(json['endTime'] as String),
    numberBirdPass: json['numberBirdPass'] as int?,
    numberBirdAttend: json['numberBirdAttend'] as int?,
    status: json['status'] as String?,
    refereePointRule: json['refereePointRule'] as int?,
    isLastRound: json['isLastRound'] as bool?,
  );
}

Map<String, dynamic> _$RoundToJson(Round instance) => <String, dynamic>{
      'round_Id': instance.round_Id,
      'tournament_Id': instance.tournament_Id,
      'name': instance.name,
      'roundNumber': instance.roundNumber,
      // 'startTime': instance.startTime,
      'endTime': instance.endTime,
      'numberBirdPass': instance.numberBirdPass,
      'numberBirdAttend': instance.numberBirdAttend,
      'status': instance.status,
      'refereePointRule': instance.refereePointRule,
      'isLastRound': instance.isLastRound,
    };
