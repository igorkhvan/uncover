// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uuid: json['uuid'] as String?,
      login: json['login'] as String?,
      avatar: json['avatar'] as String?,
      authToken: json['auth_token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'login': instance.login,
      'avatar': instance.avatar,
      'auth_token': instance.authToken,
    };
