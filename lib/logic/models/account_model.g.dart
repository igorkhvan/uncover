// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      uuid: json['uuid'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
