// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tournament _$TournamentFromJson(Map<String, dynamic> json) {
  // String participantFee = json['participantFee'].toString();
  // double participantFeeDouble = double.parse(participantFee.toString());

  // // json['height'] as String;
  // String height = json['height'].toString();
  // double heightdouble = double.parse(height);

  return Tournament(
    tournament_Id: json['tournament_Id'] as int?,
    name: json['name'] as String?,
    // description: json['description'] as String?,
    sponsor: json['sponsor'] as String?,
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    endDate: json['endDate'] == null
        ? null
        : DateTime.parse(json['endDate'] as String),
    startRegisterDate: json['startRegisterDate'] == null
        ? null
        : DateTime.parse(json['startRegisterDate'] as String),
    endRegisterDate: json['endRegisterDate'] == null
        ? null
        : DateTime.parse(json['endRegisterDate'] as String),
    location: json['location'] as String?,
    minParticipant: json['minParticipant'] as int?,
    maxParticipant: json['maxParticipant'] as int?,
    // participantFee: participantFeeDouble,
    participantFee: json['participantFee'] as double,

    banner_URL: json['banner_URL'] as String?,
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$TournamentToJson(Tournament instance) =>
    <String, dynamic>{
      'tournament_Id': instance.tournament_Id,
      'name': instance.name,
      // 'description': instance.description,
      'sponsor': instance.sponsor,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'startRegisterDate': instance.startRegisterDate,
      'endRegisterDate': instance.endRegisterDate,
      'location': instance.location,
      'minParticipant': instance.minParticipant,
      'maxParticipant': instance.maxParticipant,
      'participantFee': instance.participantFee,
      'banner_URL': instance.banner_URL,
      'status': instance.status,
    };
