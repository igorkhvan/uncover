import 'package:json_annotation/json_annotation.dart';
import 'package:uncover/logic/models/location_model.dart';

part 'stranger_model.g.dart';

@JsonSerializable()
class StrangerModel {
  final String? uuid;
  final String? avatar;
  final String? firstName;
  final String? lastName;
  final LocationModel? lastLocation;
  final List<String>? tags;
  final String? interestsDescription;
  final int? connections;
  final int? likes;
  final int? thanks;
  final String? mood;
  final int? distance;

  StrangerModel({
    this.uuid,
    this.avatar,
    this.firstName,
    this.lastName,
    this.lastLocation,
    this.tags,
    this.interestsDescription,
    this.connections,
    this.likes,
    this.thanks,
    this.mood,
    this.distance,
  });

  factory StrangerModel.fromJson(Map<String, dynamic> json) =>
      _$StrangerModelFromJson(json);

  Map<String, dynamic> toJson() => _$StrangerModelToJson(this);
}
