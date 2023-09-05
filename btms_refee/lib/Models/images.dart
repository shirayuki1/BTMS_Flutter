
import 'package:json_annotation/json_annotation.dart';
part 'images.g.dart';

@JsonSerializable()
class Images {
  final int? image_Id, bird_Id;
  final String? link;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  // String token = await Candidate().getToken();

  Images({
    this.image_Id,
    this.bird_Id,
    this.link,
  });

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}
