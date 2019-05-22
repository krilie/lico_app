import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserInfo {
  String userName;
  String userNickName;
  String userId;
  String token;
  UserInfo(this.userName,this.userNickName,this.userId,this.token);
}