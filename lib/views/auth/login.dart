import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/services/auth.dart';
import 'package:get_x_first_trial/views/auth/signup.dart';
import 'package:get_x_first_trial/views/current_page.dart';
import 'package:get_x_first_trial/views/home/products_page.dart';
import '../../models/account.dart';
import '../../services/local_db/auth_db.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Image(
            //   image: NetworkImage(
            //       'https://ayajafar001.pythonanywhere.com/eCommerce-API/products_images/My_project.png'),
            // ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: passController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            ElevatedButton(
              child: const Text('LOGIN'),
              onPressed: () async {
                // print(account);

                Account? response = await AuthService.signIn(
                    email: emailController.text, password: passController.text);

                if (response != null) {
                  Get.to(() => CurrentPage());
                }
              },
            ),
            Row(
              children: [
                const Text('Don\'t have an account ? '),
                TextButton(
                    onPressed: () {
                      Get.to(() => RegisterPage());
                    },
                    child: const Text('Register Now'))
              ],
            )
          ],
        ),
      )),
    );
  }
}
