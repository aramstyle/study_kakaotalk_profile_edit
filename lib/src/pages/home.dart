import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:study_kakaotalk_profile_edit/src/controller/profile_controller.dart';
import 'package:study_kakaotalk_profile_edit/src/pages/login_widget.dart';
import 'package:study_kakaotalk_profile_edit/src/pages/profile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        ProfileController.to.authStateCanges(snapshot.data);

        if (!snapshot.hasData) {
          return LoginWidget();
        } else {
          return Profile();
        }
      },
    );
  }
}
