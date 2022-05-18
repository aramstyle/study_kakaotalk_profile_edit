import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
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
    return Positioned(
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
            _oneButton(
              Icons.chat_bubble,
              "나와의 채팅",
              () {},
            ),
            _oneButton(
              Icons.edit,
              "프로필 편집",
              () {},
            ),
            _oneButton(
              Icons.chat_bubble_outline,
              "카카오스토리",
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _myProfile_profileImage() {
    return Container(
      width: 120,
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          "https://i.stack.imgur.com/l60Hf.png",
          fit: BoxFit.cover,
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

  Widget _myProfile() {
    return Positioned(
      bottom: 120,
      left: 0,
      right: 0,
      child: Container(
        height: 200,
        child: Column(
          children: [
            _myProfile_profileImage(),
            _myProfile_profileInfo(),
          ],
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
