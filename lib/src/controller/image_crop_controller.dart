import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:study_kakaotalk_profile_edit/src/controller/profile_controller.dart';

class ImageCropController extends GetxController {
  static ImageCropController get to => Get.find();

  Future<XFile?> selectImage(PROFILE_IMAGE_TYPE type) async {
    XFile? _file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (_file == null) return null;
    return _cropImage(_file, type);
  }

  Future<XFile?> _cropImage(XFile file, PROFILE_IMAGE_TYPE type) async {
    List<CropAspectRatioPreset> presets = [];

    switch (type) {
      case PROFILE_IMAGE_TYPE.AVARTAR:
        presets = [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
        ];
        break;
      case PROFILE_IMAGE_TYPE.BACKGROUND:
        presets = [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ];
        break;
    }

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatioPresets: presets,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile == null) return null;
    return XFile(croppedFile.path);
  }
}
