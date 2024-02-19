// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stranger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StrangerModel _$StrangerModelFromJson(Map<String, dynamic> json) =>
    StrangerModel(
      uuid: json['uuid'] as String?,
      avatar: json['avatar'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      lastLocation: json['lastLocation'] == null
          ? null
          : LocationModel.fromJson(
              json['lastLocation'] as Map<String, dynamic>),
      interestsDescription: json['interestsDescription'] as String?,
    );

Map<String, dynamic> _$StrangerModelToJson(StrangerModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'avatar': instance.avatar,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'lastLocation': instance.lastLocation,
      'interestsDescription': instance.interestsDescription,
    };
