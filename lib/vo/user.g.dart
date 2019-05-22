// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(json['userName'] as String, json['userNickName'] as String,
      json['userId'] as String, json['token'] as String);
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'userName': instance.userName,
      'userNickName': instance.userNickName,
      'userId': instance.userId,
      'token': instance.token
    };
