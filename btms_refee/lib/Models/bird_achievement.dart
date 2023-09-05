import 'package:btms_refee/Models/bird.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'bird_achievement.g.dart';

@JsonSerializable()
class Bird_Achievement {
  final int? birdAchievement_Id, rank, tournament_Id, bird_Id;
  final Bird? bird;

  factory Bird_Achievement.fromJson(Map<String, dynamic> json) =>
      _$BirdAchievementFromJson(json);

  // String token = await Candidate().getToken();

  Bird_Achievement({
    this.birdAchievement_Id,
    this.tournament_Id,
    this.rank,
    this.bird_Id,
    this.bird,
  });

  Map<String, dynamic> toJson() => _$BirdAchievementToJson(this);
}
