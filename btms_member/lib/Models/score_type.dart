import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'score_type.g.dart';

@JsonSerializable()
class ScoreType {
  final int? id;
  final String? name;

  factory ScoreType.fromJson(Map<String, dynamic> json) =>
      _$ScoreTypeFromJson(json);

  // String token = await Candidate().getToken();

  ScoreType({
    this.id,
    this.name,
  });

  Map<String, dynamic> toJson() => _$ScoreTypeToJson(this);
}
