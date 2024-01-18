import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel {
  final String? uuid;
  final String? login;
  final String? avatar;
  final String? authToken;
  @JsonKey(includeFromJson: false)
  final String? firstName;
  @JsonKey(includeFromJson: false)
  final String? lastName;

  UserModel(
      {this.uuid,
      this.login,
      this.avatar,
      this.authToken,
      this.firstName,
      this.lastName});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
