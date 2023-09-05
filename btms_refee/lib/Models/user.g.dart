// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    user_id: json['user_Id'] as int?,
    email: json['email'] as String?,
    // password: json['Password'] as String?,
    dayOfBirth: json['dayOfBirth'] == null
        ? null
        : DateTime.parse(json['dayOfBirth'] as String),
    // createDate: json['createdDate'] == null
    //     ? null
    //     : DateTime.parse(json['createdDate'] as String),
    // emailVerified: json['EmailVertify'] as bool?,
    // phoneVerfied: json['PhoneVertify'] as bool?,
    phone: json['phone'] as String?,
    imageUrl: json['image'] as String?,
    fullname: json['fullName'] as String?,
    // isActive: json['isActive'] as bool?,
    role: json['role'] as String?,
    accessToken: json['authToken'] as String?,
    refreshToken: json['refreshToken'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_Id': instance.user_id,
      'email': instance.email,
      // 'Password': instance.password,
      'dayOfBirth': instance.dayOfBirth,
      // 'createdDate': instance.createDate,
      // 'EmailVertify': instance.emailVerified,
      // 'PhoneVertify': instance.phoneVerfied,
      'phone': instance.phone,
      'image': instance.imageUrl,
      'fullName': instance.fullname,
      // 'isActive': instance.isActive,
      'role': instance.role,
      'authToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
