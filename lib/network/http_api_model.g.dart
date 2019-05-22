// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StdRet _$StdRetFromJson(Map<String, dynamic> json) {
  return StdRet(json['code'] as String, json['message'] as String);
}

Map<String, dynamic> _$StdRetToJson(StdRet instance) =>
    <String, dynamic>{'code': instance.code, 'message': instance.message};

UserLoginRet _$UserLoginRetFromJson(Map<String, dynamic> json) {
  return UserLoginRet(json['token'] as String);
}

Map<String, dynamic> _$UserLoginRetToJson(UserLoginRet instance) =>
    <String, dynamic>{'token': instance.token};
