// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filekvstorage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

kvFile _$kvFileFromJson(Map<String, dynamic> json) {
  return kvFile(
      json['clientAccToken'] as String,
      json['userId'] as String,
      json['userNickName'] as String,
      json['userToken'] as String,
      json['serviceEndPoint'] as String);
}

Map<String, dynamic> _$kvFileToJson(kvFile instance) => <String, dynamic>{
      'userNickName': instance.userNickName,
      'userId': instance.userId,
      'userToken': instance.userToken,
      'clientAccToken': instance.clientAccToken,
      'serviceEndPoint': instance.serviceEndPoint
    };
