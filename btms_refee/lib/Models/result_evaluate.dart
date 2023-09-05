import 'package:btms_refee/Models/score_criteria.dart';
import 'package:btms_refee/Models/score_type.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'result_evaluate.g.dart';

@JsonSerializable()
class ResultEvaluate {
  final int? roundResultDetail_Id, roundResult_Id, referee_Id;
  final bool? isWarn;
  final String? note;
  // List<Map<String, dynamic>>? scoringCriterias;
  // final scoringCriterias?
  final List<ScoreType> scoreType;

  factory ResultEvaluate.fromJson(Map<String, dynamic> json) =>
      _$ResultEvaluateFromJson(json);

  // String token = await Candidate().getToken();

  ResultEvaluate({
    this.roundResultDetail_Id,
    this.referee_Id,
    this.roundResult_Id,
    this.isWarn,
    this.note,
    required this.scoreType,
  });

  Map<String, dynamic> toJson() => _$ResultEvaluateToJson(this);
}
