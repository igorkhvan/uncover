import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? uuid;
  final String? phone;
  final String? avatar;
  @JsonKey(includeFromJson: false)
  String? authToken;
  @JsonKey(includeFromJson: false)
  String? firebaseToken;
  final String? firstName;
  final String? lastName;

  UserModel({
    this.uuid,
    this.phone,
    this.avatar,
    this.authToken,
    this.firebaseToken,
    this.firstName,
    this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
