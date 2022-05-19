import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_kakaotalk_profile_edit/src/controller/profile_controller.dart';

class Profile extends GetView<ProfileController> {
  const Profile({Key? key}) : super(key: key);

  Widget _header() {
    return Positioned(
      top: Get.mediaQuery.padding.top,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                debugPrint("프로필 편집 취소");
                controller.toggleEditProfile();
              },
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
          },
          child: Container(
            color: Colors.transparent,
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
    return Container(
      width: 120,
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Stack(
          children: [
            Image.network(
              "https://i.stack.imgur.com/l60Hf.png",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Widget _myProfile_profileInfo() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "AR",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          "안녕하세요! 이아람입니다.",
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
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              debugPrint("이름");
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
                    "AR",
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
            onTap: () {
              debugPrint("설명");
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
                    "안녕하세요! 이아람입니다.",
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
    );
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
