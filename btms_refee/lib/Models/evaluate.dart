import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'evaluate.g.dart';

@JsonSerializable()
class Evaluate {
  final int? roundResult_Id;
  final bool? isWarn;
  final String? note;
  List<Map<String, int>>? scoringCriterias;
  // final scoringCriterias?

  factory Evaluate.fromJson(Map<String, dynamic> json) =>
      _$EvaluateFromJson(json);

  // String token = await Candidate().getToken();

  Evaluate({
    this.roundResult_Id,
    this.isWarn,
    this.note,
    this.scoringCriterias,
  });

  Map<String, dynamic> toJson() => _$EvaluateToJson(this);
}
