import 'package:json_annotation/json_annotation.dart';

part 'stranger_model.g.dart';

@JsonSerializable()
class StrangerModel {
  final String? uuid;
  final String? avatar;
  final String? firstName;
  final String? lastName;
  final String? lastLocation;
  final String? interestsDescription;

  StrangerModel({
    this.uuid,
    this.avatar,
    this.firstName,
    this.lastName,
    this.lastLocation,
    this.interestsDescription
  });

  factory StrangerModel.fromJson(Map<String, dynamic> json) =>
      _$StrangerModelFromJson(json);

  Map<String, dynamic> toJson() => _$StrangerModelToJson(this);
}
