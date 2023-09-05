import 'package:json_annotation/json_annotation.dart';
part 'videos.g.dart';

@JsonSerializable()
class Videos {
  final int? image_Id, bird_Id;
  final String? link;

  factory Videos.fromJson(Map<String, dynamic> json) => _$VideosFromJson(json);

  // String token = await Candidate().getToken();

  Videos({
    this.image_Id,
    this.bird_Id,
    this.link,
  });

  Map<String, dynamic> toJson() => _$VideosToJson(this);
}
