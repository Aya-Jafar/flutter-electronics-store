import 'dart:developer';

import 'package:animated_icon/animate_icon.dart';
import 'package:animated_icon/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/services/local_db/auth_db.dart';
import 'package:get_x_first_trial/views/auth/login.dart';
import 'services/auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  login() async {
    // await Future.delayed(Duration(seconds: 2));
    try {
      Map currentUserData = await AuthService.readUserData();

      String? email = currentUserData['email'];
      String? password = currentUserData['password'];

      if (await AuthService.userDataExists()) {
        AuthService.signIn(email: email!, password: password!);
        // print('HOOOME SCREEEEN For already loggedin usereees');

      } else {
        Get.offAll(() => LoginPage());
      }
    } catch (e) {
      Get.offAll(() => LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    // login();
    WidgetsBinding.instance.addPostFrameCallback((_) => login());

    return Scaffold(
      body: Center(
        child: AnimateIcon(
          key: UniqueKey(),
          onTap: () {},
          iconType: IconType.continueAnimation,
          height: 70,
          width: 70,
          color: Color.fromARGB(255, 127, 2, 44),
          animateIcon: AnimateIcons.loading3,
        ),
      ),
    );
  }
}
