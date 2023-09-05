// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'bird.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bird _$BirdFromJson(Map<String, dynamic> json) {
  // json['weight'] as String;
  String weight = json['weight'].toString();
  double weightdouble = double.parse(weight);

  // json['height'] as String;
  String height = json['height'].toString();
  double heightdouble = double.parse(height);

  return Bird(
    bird_Id: json['bird_Id'] as int?,
    bird_type: json['birdType_Id'] as int?,
    name: json['name'] as String?,
    gender: json['gender'] as String?,
    identifyingCharacteristics: json['identifyingCharacteristics'] as String?,
    // weight: json['weight'] as int?,
    weight: weightdouble,
    // height: json['height'] as int?,
    height: heightdouble,
    color: json['color'] as String?,
    qrCode: json['qrCode'] as String?,
    status: json['status'] as String?,
    bannerUrl: json['bannerUrl'] as String?,
    // bird_type: json['status'] as int?,
  );
}

Map<String, dynamic> _$BirdToJson(Bird instance) => <String, dynamic>{
      'bird_Id': instance.bird_Id,
      'birdType_Id': instance.bird_type,
      'name': instance.name,
      'gender': instance.gender,
      'identifyingCharacteristics': instance.identifyingCharacteristics,
      'weight': instance.weight,
      'height': instance.height,
      'color': instance.color,
      'qrCode': instance.qrCode,
      'status': instance.status,
      'bannerUrl': instance.bannerUrl,
      // 'status': instance.bird_type, //sua
    };
