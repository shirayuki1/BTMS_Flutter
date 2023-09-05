import 'package:btms_refee/Models/bird.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'register_history.g.dart';

@JsonSerializable()
class register_history {
  final int? registerForm_Id, tournament_Id, birdId, candidate_Number;
  final String? payment_Id, payment_Status, status;
  final DateTime? createDate;

  factory register_history.fromJson(Map<String, dynamic> json) =>
      _$RegisterHistoryFromJson(json);

  // String token = await Candidate().getToken();

  register_history({
    this.registerForm_Id,
    this.tournament_Id,
    this.birdId,
    this.payment_Id,
    this.payment_Status,
    this.createDate,
    this.status,
    this.candidate_Number,
  });

  Map<String, dynamic> toJson() => _$RegisterHistoryToJson(this);
}
