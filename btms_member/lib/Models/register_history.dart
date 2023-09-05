import 'package:btms_member/Models/bird.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'register_history.g.dart';

@JsonSerializable()
class register_history {
  final int? registerForm_Id, tournament_Id, birdId, candidate_Number;
  final String? payment_Id, payment_Status, status;
  final DateTime? createdDate;
  final Bird? bird;

  factory register_history.fromJson(Map<String, dynamic> json) =>
      _$RegisterHistoryFromJson(json);

  // String token = await Candidate().getToken();

  register_history({
    this.registerForm_Id,
    this.tournament_Id,
    this.birdId,
    this.payment_Id,
    this.payment_Status,
    this.createdDate,
    this.status,
    this.candidate_Number,
    this.bird,
  });

  Map<String, dynamic> toJson() => _$RegisterHistoryToJson(this);
}
