import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'user.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class UserInfo {
  String userName;
  String userNickName;
  String userId;
  String token;
  List<UserToken> tokens;
  UserInfo(this.userName,this.userNickName,this.userId,this.token,this.tokens);

  factory UserInfo.fromJson(Map<String,dynamic> json) => _$UserInfoFromJson(json);
  Map<String,dynamic> toJson()=>_$UserInfoToJson(this);

}
@JsonSerializable()
class UserToken{
  String token;
  String name;
  String exp;
  UserToken(this.token,this.name,this.exp);

  factory UserToken.fromJson(Map<String,dynamic> json) => _$UserTokenFromJson(json);
  Map<String,dynamic> toJson()=>_$UserTokenToJson(this);
}