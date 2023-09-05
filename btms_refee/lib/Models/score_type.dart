import 'package:btms_refee/Models/score_criteria.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'score_type.g.dart';

@JsonSerializable()
class ScoreType {
  final int? id;
  final String? name;
  final List<ScoreCriteria>? scoringCriterias;

  factory ScoreType.fromJson(Map<String, dynamic> json) =>
      _$ScoreTypeFromJson(json);

  // String token = await Candidate().getToken();

  ScoreType({
    this.id,
    this.name,
    this.scoringCriterias,
  });

  Map<String, dynamic> toJson() => _$ScoreTypeToJson(this);
}
