import 'dart:async';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'prizes.g.dart';

@JsonSerializable()
class Prizes {
  final String? name;
  final int? prize_Id, tournament_Id, rank;
  final double? price;

  factory Prizes.fromJson(Map<String, dynamic> json) => _$PrizesFromJson(json);

  // String token = await Candidate().getToken();

  Prizes({
    this.prize_Id,
    this.tournament_Id,
    this.name,
    this.price,
    this.rank,
  });

  Map<String, dynamic> toJson() => _$PrizesToJson(this);
}
