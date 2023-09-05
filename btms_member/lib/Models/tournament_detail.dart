import 'package:json_annotation/json_annotation.dart';

part 'tournament_detail.g.dart';

@JsonSerializable()
class TournamentDetails {
  final int? tournament_id;
  final String? name, description, sponsor, location, banner_URL, status;

  final DateTime? startDate, endDate, startRegisterDate, endRegisterDate;
  final int? minParticipant, maxParticipant;
  final double? participantFee;
  final List<dynamic>? tournamentOrganizers, prizers;

  factory TournamentDetails.fromJson(Map<String, dynamic> json) =>
      _$TournamentDetailsFromJson(json);

  TournamentDetails({
    this.tournament_id,
    this.name,
    this.description,
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
    this.tournamentOrganizers,
    this.prizers,
    this.status,
  });

  Map<String, dynamic> toJson() => _$TournamentDetailsToJson(this);
}
