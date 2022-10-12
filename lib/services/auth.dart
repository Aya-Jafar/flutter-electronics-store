import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_x_first_trial/models/account.dart';
import 'package:get_x_first_trial/services/urls.dart';
import 'package:http/http.dart' as http;
import '../views/auth/login.dart';
import '../views/current_page.dart';
import 'local_db/auth_db.dart';

class AuthService {
  // user@example.com
  // stringstr

  static Future<Account?> signIn(
      {required String email, required String password}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        final response = await http.post(
          Uri.parse(ApiUrls.signIn),
          body: jsonEncode({"email": email, "password": password}),
        );
        if (response.statusCode == 200) {
          Map<String, dynamic> accountOut =
              jsonDecode(response.body)['account'];

          // print(response.body);
          await saveUserData(email, password, response);

          Get.offAll(() => CurrentPage());

          Account.current = Account.fromJson(accountOut);

          return Account.fromJson(accountOut);
        } else if (response.statusCode == 404) {
          return errorMessage((jsonDecode(response.body)['message']));
        } else {
          return errorMessage((jsonDecode(response.body)['detail'][0]['msg']));
        }
      } else {
        // print(response.body);
        return errorMessage("Email and password should not be empty");
      }
    } catch (e) {
      // print(e);
      Get.snackbar(
        "Please try again",
        "Make sure your email and password is correct",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      return null;
    }
  }

  static Future<Account?> signUp(
      {required String userName,
      required String email,
      required String password1,
      required String password2,
      required String phoneNumber}) async {
    try {
      if ([userName, email, password1, password2, phoneNumber]
          .every((e) => e.isNotEmpty)) {
        final response = await http.post(
          Uri.parse(ApiUrls.signUp),
          body: jsonEncode({
            "user_name": userName,
            "email": email,
            "password1": password1,
            "password2": password2,
            "phone_number": phoneNumber
          }),
        );
        // print(response.statusCode);

        if (response.statusCode == 201) {
          Map<String, dynamic> accountOut =
              jsonDecode(response.body)['account'];

          Account.current = Account.fromJson(accountOut);

          await saveUserData(email, password1, response);

          Get.to(() => CurrentPage());

          return Account.fromJson(accountOut);
        } else if (response.statusCode == 404) {
          return errorMessage((jsonDecode(response.body)['message']));
        } else {
          String msg = (jsonDecode(response.body)['detail'][0]['msg']);
          String errorLocation =
              jsonDecode(response.body)['detail'][0]['loc'][2];

          (errorLocation == 'phone_number')
              ? msg = "Invalid phone number"
              : msg = "Password should have at least 8 characters";

          return errorMessage(msg);
        }
      } else {
        return errorMessage("All fields should not be empty");
      }
    } catch (e) {
      // print(e);

      Get.snackbar(
        "Registeration failed",
        "Please try again 🙏",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      return null;
    }
  }

  static Future<void> saveUserData(
      String email, String password, http.Response response) async {
    await LocalDb.storage.write(key: 'email', value: email);
    await LocalDb.storage.write(key: 'password', value: password);

    await LocalDb.storage.write(
        key: 'token', value: jsonDecode(response.body)['token']['access']);
  }

  static Future<Map> readUserData() async {
    return await LocalDb.storage.readAll();
  }

  static Future<bool> userDataExists() async {
    String? email = await LocalDb.storage.read(key: 'email');
    String? password = await LocalDb.storage.read(key: 'password');

    if (email != null && password != null) {
      return true;
    } else {
      return false;
    }
  }

  static errorMessage(String msg) {
    Get.snackbar(
      msg,
      "Please try again",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
    return null;
  }

  static logOut() async {
    await LocalDb.storage.delete(
      key: 'email',
    );
    await LocalDb.storage.delete(
      key: 'password',
    );
    await LocalDb.storage.delete(
      key: 'token',
    );
    Get.offAll(LoginPage());
  }
}
