// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return Images(
    image_Id: json['image_Id'] as int?,
    bird_Id: json['bird_Id'] as int?,
    link: json['link'] as String?,
  );
}

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'image_Id': instance.image_Id,
      'bird_Id': instance.bird_Id,
      'link': instance.link,
    };
