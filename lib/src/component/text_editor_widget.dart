// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class TextEditorWidget extends StatefulWidget {
  final String text;
  const TextEditorWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<TextEditorWidget> createState() => _TextEditorWidgetState();
}

class _TextEditorWidgetState extends State<TextEditorWidget> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _textEditingController.text = widget.text;
    super.initState();
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              debugPrint("프로필 편집 취소");
              Get.back();
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
              debugPrint("완료버튼 클릭");
              Get.back(result: _textEditingController.text);
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
    );
  }

  Widget _editTextField() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          controller: _textEditingController,
          maxLength: 20,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white),
          decoration: InputDecoration(
            hintText: "이야람",
            hintStyle: TextStyle(fontSize: 18, color: Colors.white),
            counterStyle: TextStyle(fontSize: 14, color: Colors.white),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: const EdgeInsets.all(0), // 기본값이 들어가 있어서 위치가 안맞았던거임.
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            _header(),
            Expanded(
              child: _editTextField(),
            ),
          ],
        ));
  }
}
