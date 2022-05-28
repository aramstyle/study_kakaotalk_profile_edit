import 'dart:io';

class UserModel {
  String uid; // 고객 고유키
  String docId; // document id
  String name; // 이름
  String discription; // 설명
  String avatarUrl;
  String backgroundUrl;
  File? avatarFile;
  File? backgroundFile;
  DateTime? lastLoginTime;
  DateTime? createdTime;

  UserModel({
    this.uid = "",
    this.docId = "",
    this.name = "",
    this.discription = "",
    this.avatarUrl = "",
    this.backgroundUrl = "",
    this.avatarFile,
    this.backgroundFile,
    this.lastLoginTime,
    this.createdTime,
  });

  UserModel.clone(UserModel user)
      : this(
          uid: user.uid,
          docId: user.docId,
          name: user.name,
          discription: user.discription,
          avatarUrl: user.avatarUrl,
          backgroundUrl: user.backgroundUrl,
          avatarFile: user.avatarFile,
          backgroundFile: user.backgroundFile,
          lastLoginTime: user.lastLoginTime,
          createdTime: user.createdTime,
        );
}
