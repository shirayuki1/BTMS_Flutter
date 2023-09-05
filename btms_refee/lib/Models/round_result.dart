import 'dart:async';
import 'package:btms_refee/Models/bird.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'round_result.g.dart';

@JsonSerializable()
class RoundResult {
  final int roundResult_Id;
  final int? round_Id,
      // bird_Id,
      rank,
      warnCount,
      candidateNumber;
  // numberBirdAttend,
  // refereePointRule;
  final bool? isPass, isEvaluate;
  final Bird? bird;

  factory RoundResult.fromJson(Map<String, dynamic> json) =>
      _$RoundResultFromJson(json);

  // String token = await Candidate().getToken();

  RoundResult({
    required this.roundResult_Id,
    this.round_Id,
    // this.bird_Id,
    this.candidateNumber,
    this.rank,
    this.warnCount,
    this.isPass,
    this.bird,
    this.isEvaluate,
  });

  Map<String, dynamic> toJson() => _$RoundResultToJson(this);
}
