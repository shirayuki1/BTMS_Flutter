import 'dart:async';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'round.g.dart';

@JsonSerializable()
class Round {
  final String? name, status;
  final DateTime? startTime, endTime;
  final int? round_Id,
      tournament_Id,
      roundNumber,
      numberBirdPass,
      numberBirdAttend,
      refereePointRule;
  final bool? isLastRound;

  factory Round.fromJson(Map<String, dynamic> json) => _$RoundFromJson(json);

  // String token = await Candidate().getToken();

  Round({
    this.round_Id,
    this.tournament_Id,
    this.name,
    this.roundNumber,
    this.startTime,
    this.endTime,
    this.numberBirdPass,
    this.numberBirdAttend,
    this.status,
    this.refereePointRule,
    this.isLastRound,
  });

  Map<String, dynamic> toJson() => _$RoundToJson(this);
}
