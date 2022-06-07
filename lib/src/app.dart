import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:study_kakaotalk_profile_edit/src/pages/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("fail to load firebase!"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Home();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
