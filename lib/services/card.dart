import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/services/urls.dart';
import '../models/card.dart';
import 'local_db/auth_db.dart';
import 'package:http/http.dart' as http;

class CardService {
  static Future<UserCard?> getCard() async {
    try {
      String? token = await LocalDb.storage.read(key: 'token');
      if (token != null) {
        final response = await http.get(Uri.parse(ApiUrls.cardView),
            headers: {"Authorization": "Bearer $token"});
        if (response.statusCode == 200) {
          return cardFromJson(response.body);
        } else {
          print(response.body);
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<UserCard?> addToCard({required int id}) async {
    try {
      String? token = await LocalDb.storage.read(key: 'token');
      if (token != null) {
        final response = await http.post(Uri.parse(ApiUrls.addToCard),

            headers: {"Authorization": "Bearer $token"},
            body: jsonEncode({'product_id': id, 'quantity': 1}));

        if (response.statusCode == 200) {
          Get.snackbar(
            "Added to your card successfully",
            "",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 4),
            isDismissible: true,
            forwardAnimationCurve: Curves.easeOutBack,
          );
        } else {
          // print(response.body);
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<void> deleteFromCard({required int itemId}) async {
    try {
      String? token = await LocalDb.storage.read(key: 'token');
      if (token != null) {
        final response = await Dio().delete(
          'https://ayajafar001.pythonanywhere.com/api/Items/delete-item/$itemId',
          queryParameters: {'id': itemId},
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
            },
          ),
        );
        print(response.data);
        if (response.statusCode == 200) {
          Get.snackbar(
            "Item has been deleted successfully",
            "",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 4),
            isDismissible: true,
            forwardAnimationCurve: Curves.easeOutBack,
          );
        } else {
          print(response.data);
        }
      }
    } catch (e) {
      // print(e);
    }
    return null;
  }
}
