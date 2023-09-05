import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'score_criteria.g.dart';

@JsonSerializable()
class ScoreCriteria {
  final int? id, scoreTypeId, applyFromRound;
  final String? name;

  factory ScoreCriteria.fromJson(Map<String, dynamic> json) =>
      _$ScoreCriteriaFromJson(json);

  // String token = await Candidate().getToken();

  ScoreCriteria({
    this.id,
    this.name,
    this.scoreTypeId,
    this.applyFromRound,
  });

  Map<String, dynamic> toJson() => _$ScoreCriteriaToJson(this);
}
