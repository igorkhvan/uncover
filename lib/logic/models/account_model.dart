import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  final String? uuid;
  final String? phone;
  final String? avatar;
  @JsonKey(includeFromJson: false)
  String? authToken;
  @JsonKey(includeFromJson: false)
  String? firebaseToken;
  final String? firstName;
  final String? lastName;
  @JsonKey(includeFromJson: false)
  String? lastLocation;
  @JsonKey(includeFromJson: false)
  String? interests;

  AccountModel({
    this.uuid,
    this.phone,
    this.avatar,
    this.authToken,
    this.firebaseToken,
    this.firstName,
    this.lastName,
    this.lastLocation,
    this.interests
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
