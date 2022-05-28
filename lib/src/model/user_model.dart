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
    this.lastLoginTime,
    this.createdTime,
  });
}
