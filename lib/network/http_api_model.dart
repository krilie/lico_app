import 'package:json_annotation/json_annotation.dart';

part 'http_api_model.g.dart';

// ==========
class Ret {
  Ret loadJson(Map<String, dynamic> json) {}
}

// ===============================================================
@JsonSerializable()
class StdRet implements Ret {
  String code;
  String message;

  StdRet(this.code, this.message);

  factory StdRet.fromJson(Map<String, dynamic> json) => _$StdRetFromJson(json);

  Map<String, dynamic> toJson() => _$StdRetToJson(this);

  @override
  StdRet loadJson(Map<String, dynamic> json) {
    return StdRet.fromJson(json);
  }
}

// =================================================================
@JsonSerializable()
class UserLoginRet implements Ret {
  String token;

  UserLoginRet(this.token);

  factory UserLoginRet.fromJson(Map<String, dynamic> json) =>
      _$UserLoginRetFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginRetToJson(this);

  @override
  UserLoginRet loadJson(Map<String, dynamic> json) {
    return UserLoginRet.fromJson(json);
  }
}
