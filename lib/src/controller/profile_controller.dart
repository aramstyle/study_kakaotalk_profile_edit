// ignore_for_file: constant_identifier_names, camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:study_kakaotalk_profile_edit/src/controller/image_crop_controller.dart';
import 'package:study_kakaotalk_profile_edit/src/model/user_model.dart';

enum PROFILE_IMAGE_TYPE {
  AVARTAR,
  BACKGROUND,
}

class ProfileController extends GetxController {
  RxBool isEditMyProfile = false.obs;
  UserModel originMyProfile = UserModel(name: "닉네임", discription: "설명을 입력해주세요");
  Rx<UserModel> myProfile = UserModel().obs;

  @override
  void onInit() {
    isEditMyProfile(false);
    myProfile(UserModel.clone(originMyProfile));
    super.onInit();
  }

  void toggleEditProfile() {
    isEditMyProfile(!isEditMyProfile.value);
  }

  void rollback() {
    myProfile(UserModel.clone(originMyProfile));
    toggleEditProfile();
  }

  void updateName(String name) {
    myProfile.update((val) {
      val?.name = name;
    });
  }

  void updateDiscription(String discription) {
    myProfile.update((val) {
      val?.discription = discription;
    });
  }

  void pickImage(PROFILE_IMAGE_TYPE type) async {
    if (!isEditMyProfile.value) return;

    XFile? file = await ImageCropController.to.selectImage(type);
    if (file == null) return;

    switch (type) {
      case PROFILE_IMAGE_TYPE.AVARTAR:
        myProfile.update((my) {
          my?.avatarFile = File(file.path);
        });
        break;
      case PROFILE_IMAGE_TYPE.BACKGROUND:
        myProfile.update((my) {
          my?.backgroundFile = File(file.path);
        });
        break;
    }
  }

  void save() {
    originMyProfile = UserModel.clone(myProfile.value);
    toggleEditProfile();
  }
}
