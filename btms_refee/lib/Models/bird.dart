import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'bird.g.dart';

@JsonSerializable()
class Bird {
  final int? bird_Id, bird_type;
  final String? name,
      gender,
      identifyingCharacteristics,
      color,
      qrCode,
      status,
      bannerUrl;
  final double? weight, height;
  bool isSelected;

  factory Bird.fromJson(Map<String, dynamic> json) => _$BirdFromJson(json);

  // String token = await Candidate().getToken();

  Bird({
    this.bird_Id,
    this.name,
    this.identifyingCharacteristics,
    this.gender,
    this.color,
    this.weight,
    this.height,
    this.bird_type,
    this.qrCode,
    this.status,
    this.bannerUrl,
    this.isSelected = false,
  });

  Map<String, dynamic> toJson() => _$BirdToJson(this);
}
