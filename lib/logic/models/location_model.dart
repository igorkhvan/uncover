import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  @JsonKey(fromJson: toDouble)
  final double? latitude;
  @JsonKey(fromJson: toDouble)
  final double? longitude;

  LocationModel({this.latitude, this.longitude});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

double? toDouble(double? number) {
  return number ?? 0.0;
}