// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(
      json['userName'] as String,
      json['userNickName'] as String,
      json['userId'] as String,
      json['token'] as String,
      (json['tokens'] as List)
          ?.map((e) =>
              e == null ? null : UserToken.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'userName': instance.userName,
      'userNickName': instance.userNickName,
      'userId': instance.userId,
      'token': instance.token,
      'tokens': instance.tokens
    };

UserToken _$UserTokenFromJson(Map<String, dynamic> json) {
  return UserToken(
      json['token'] as String, json['name'] as String, json['exp'] as String);
}

Map<String, dynamic> _$UserTokenToJson(UserToken instance) => <String, dynamic>{
      'token': instance.token,
      'name': instance.name,
      'exp': instance.exp
    };
