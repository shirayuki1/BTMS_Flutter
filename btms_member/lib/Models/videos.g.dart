// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Videos _$VideosFromJson(Map<String, dynamic> json) {
  return Videos(
    image_Id: json['video_Id'] as int?,
    bird_Id: json['bird_Id'] as int?,
    link: json['link'] as String?,
  );
}

Map<String, dynamic> _$VideosToJson(Videos instance) => <String, dynamic>{
      'video_Id': instance.image_Id,
      'bird_Id': instance.bird_Id,
      'link': instance.link,
    };
