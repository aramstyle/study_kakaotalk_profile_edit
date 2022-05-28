import 'package:get/get.dart';
import 'package:study_kakaotalk_profile_edit/src/model/user_model.dart';

class ProfileController extends GetxController {
  RxBool isEditMyProfile = false.obs;
  Rx<UserModel> myProfile = UserModel(name: "아람", discription: "안녕하세요!").obs;

  @override
  void onInit() {
    isEditMyProfile(false);
    super.onInit();
  }

  void toggleEditProfile() {
    isEditMyProfile(!isEditMyProfile.value);
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
}
