import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/views/home/products_page.dart';

import '../../models/account.dart';
import '../../services/auth.dart';
import '../current_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pass1Controller = TextEditingController();
  TextEditingController pass2Controller = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Account? response;

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    pass1Controller.dispose();
    pass2Controller.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: userNameController,
                  decoration: const InputDecoration(hintText: 'User name'),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                TextField(
                  controller: pass1Controller,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                TextField(
                  controller: pass2Controller,
                  decoration:
                      const InputDecoration(hintText: 'Confirm Password'),
                ),
                TextField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  // inputFormatters: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.digitsOnly
                  // ], // Only numbers can be enter
                  decoration: const InputDecoration(hintText: 'Phone number'),
                ),
                ElevatedButton(
                  child: const Text('REGISTER'),
                  onPressed: () async {
                    response = await AuthService.signUp(
                        userName: userNameController.text,
                        email: emailController.text,
                        password1: pass1Controller.text,
                        password2: pass2Controller.text,
                        phoneNumber: phoneNumberController.text);

                    if (response != null) {
                      Get.offAll(() => CurrentPage());
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}
