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
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      interestsDescription: json['interestsDescription'] as String?,
      connections: json['connections'] as int?,
      likes: json['likes'] as int?,
      thanks: json['thanks'] as int?,
      mood: json['mood'] as String?,
      distance: json['distance'] as int?,
    );

Map<String, dynamic> _$StrangerModelToJson(StrangerModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'avatar': instance.avatar,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'lastLocation': instance.lastLocation,
      'tags': instance.tags,
      'interestsDescription': instance.interestsDescription,
      'connections': instance.connections,
      'likes': instance.likes,
      'thanks': instance.thanks,
      'mood': instance.mood,
      'distance': instance.distance,
    };
