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
  UserInfo(this.userName,this.userNickName,this.userId,this.token);
}