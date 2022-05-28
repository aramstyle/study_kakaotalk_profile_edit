// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_kakaotalk_profile_edit/src/component/text_editor_widget.dart';
import 'package:study_kakaotalk_profile_edit/src/controller/image_crop_controller.dart';
import 'package:study_kakaotalk_profile_edit/src/controller/profile_controller.dart';

class Profile extends GetView<ProfileController> {
  const Profile({Key? key}) : super(key: key);

  Widget _header() {
    return Positioned(
      top: Get.mediaQuery.padding.top,
      left: 0,
      right: 0,
      child: Obx(
        () => Container(
          padding: const EdgeInsets.all(20),
          child: controller.isEditMyProfile.value
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: controller.rollback,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                          Text(
                            "프로필 편집",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        debugPrint("프로필 편집 저장");
                        //controller.toggleEditProfile();
                        controller.save();
                      },
                      child: const Text(
                        "완료",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.close_sharp, color: Colors.white),
                    Row(
                      children: [
                        Icon(Icons.qr_code, color: Colors.white),
                        SizedBox(width: 10),
                        Icon(Icons.settings, color: Colors.white)
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Widget _backgroundImage() {
    return Positioned(
        top: 0,
        right: 0,
        left: 0,
        bottom: 0,
        child: GestureDetector(
          onTap: () {
            debugPrint("change!");
            controller.pickImage(PROFILE_IMAGE_TYPE.BACKGROUND);
          },
          child: Obx(
            () => Container(
              child: controller.myProfile.value.backgroundFile == null
                  ? Container(
                      color: Colors.transparent,
                    )
                  : Image.file(
                      controller.myProfile.value.backgroundFile!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ));
  }

  Widget _oneButton(IconData icon, String title, Function ontap) {
    return GestureDetector(
      onTap: ontap(),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _footer() {
    return Obx(
      () => controller.isEditMyProfile.value
          ? Container()
          : Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        debugPrint("footer 나와의 채팅");
                      },
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(
                            Icons.chat_bubble,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "나와의 채팅",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        debugPrint("footer 프로필 편집");
                        controller.toggleEditProfile();
                      },
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "프로필 편집",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        debugPrint("footer 카카오스토리");
                      },
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "카카오스토리",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _myProfile_profileImage() {
    return GestureDetector(
      onTap: () {
        controller.pickImage(PROFILE_IMAGE_TYPE.AVARTAR);
      },
      child: Container(
        width: 120,
        height: 120,
        child: Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                    width: 100,
                    height: 100,
                    child: controller.myProfile.value.avatarFile == null
                        ? Image.network(
                            "https://i.stack.imgur.com/l60Hf.png",
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            controller.myProfile.value.avatarFile!,
                            fit: BoxFit.cover,
                          )),
              ),
            ),
            controller.isEditMyProfile.value
                ? Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Icon(
                          Icons.camera_alt,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget _myProfile_profileInfo() {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            controller.myProfile.value.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          controller.myProfile.value.discription,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _edit_myProfile_profileInfo() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Obx(
          () => Column(
            children: [
              GestureDetector(
                onTap: () async {
                  debugPrint("닉네임");
                  var strvalue = await Get.dialog(TextEditorWidget(
                    text: controller.myProfile.value.name,
                  ));

                  if (strvalue != null) {
                    controller.updateName(strvalue);
                  }
                },
                child: Stack(children: [
                  Container(
                    height: 45,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.white),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        controller.myProfile.value.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 15,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                  )
                ]),
              ),
              GestureDetector(
                onTap: () async {
                  debugPrint("디스크립션");
                  var strvalue = await Get.dialog(TextEditorWidget(
                    text: controller.myProfile.value.discription,
                  ));

                  if (strvalue != null) {
                    controller.updateDiscription(strvalue);
                  }
                },
                child: Stack(children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.white),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        controller.myProfile.value.discription,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 15,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                  )
                ]),
              ),
            ],
          ),
        ));
  }

  Widget _myProfile() {
    return Positioned(
      bottom: 120,
      left: 0,
      right: 0,
      child: Container(
        height: 250,
        child: Obx(
          () => Column(
            children: [
              _myProfile_profileImage(),
              controller.isEditMyProfile.value
                  ? _edit_myProfile_profileInfo()
                  : _myProfile_profileInfo(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3f3f3f),
      // 입력키패드가 나오면서 메인 화면이 좇아 올라가는 현상 안나오게 하는 설정
      resizeToAvoidBottomInset: false,
      // body: Container(
      //   child: Stack(
      //     children: [
      //       _backgroundImage(),
      //       _header(),
      //     ],
      //   ),
      // ),
      body: Stack(
        children: <Widget>[
          _backgroundImage(),
          _header(),
          _myProfile(),
          _footer(),
        ],
      ),
    );
  }
}
