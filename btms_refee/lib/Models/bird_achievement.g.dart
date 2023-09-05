// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'bird_achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bird_Achievement _$BirdAchievementFromJson(Map<String, dynamic> json) {
  return Bird_Achievement(
    birdAchievement_Id: json['birdAchievement_Id'] as int?,
    tournament_Id: json['tournament_Id'] as int?,
    rank: json['rank'] as int?,
    bird_Id: json['bird_Id'] as int?,
    bird: json['bird'] == null
        ? null
        : Bird.fromJson(json['bird'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BirdAchievementToJson(Bird_Achievement instance) =>
    <String, dynamic>{
      'birdAchievement_Id': instance.birdAchievement_Id,
      'tournament_Id': instance.tournament_Id,
      'rank': instance.rank,
      'bird_Id': instance.bird_Id,
    };
