import 'package:json_annotation/json_annotation.dart';

part 'tournament.g.dart';

@JsonSerializable()
class Tournament {
  final int? tournament_Id;
  final String? name, sponsor, location, banner_URL, status;

  final DateTime? startDate, endDate, startRegisterDate, endRegisterDate;
  final int? minParticipant, maxParticipant;
  final double? participantFee;

  factory Tournament.fromJson(Map<String, dynamic> json) =>
      _$TournamentFromJson(json);

  Tournament({
    this.tournament_Id,
    this.name,
    this.endDate,
    this.sponsor,
    this.location,
    this.startRegisterDate,
    this.endRegisterDate,
    this.banner_URL,
    this.startDate,
    this.minParticipant,
    this.maxParticipant,
    this.participantFee,
    this.status,
  });

  set _status(String newStatus) {
    _status = newStatus;
  }

  Map<String, dynamic> toJson() => _$TournamentToJson(this);
}
