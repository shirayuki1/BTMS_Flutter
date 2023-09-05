import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int? user_id;
  final String? email,
      password,
      imageUrl,
      phone,
      fullname,
      accessToken,
      refreshToken,
      role;

  final DateTime? dayOfBirth;
  final bool? isActive, emailVerified, phoneVerfied;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User({
    this.accessToken,
    this.refreshToken,
    this.user_id,
    this.fullname,
    this.role,
    this.imageUrl,
    this.phone,
    this.email,
    // this.createDate,
    this.dayOfBirth,
    this.isActive,
    this.emailVerified,
    this.phoneVerfied,
    this.password,
  });

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
