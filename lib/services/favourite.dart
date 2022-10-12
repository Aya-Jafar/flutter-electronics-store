import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/models/favourite.dart';
import 'package:get_x_first_trial/services/urls.dart';

import 'local_db/auth_db.dart';
import 'package:http/http.dart' as http;

class FavService {
  static Future<List<Favourite>> getAllFavourite() async {
    try {
      String? token = await LocalDb.storage.read(key: 'token');
      if (token != null) {
        final response = await http.get(Uri.parse(ApiUrls.allFavourite),
            headers: {"Authorization": "Bearer $token"});
        if (response.statusCode == 200) {
          // print(response.body);
          return favouriteFromJson(response.body);
        } else {
          // print(response.body);
        }
      }
    } catch (e) {
      print(e);
    }
    return <Favourite>[];
  }

  static Future<void> markAsFavourite({required int id}) async {
    try {
      String? token = await LocalDb.storage.read(key: 'token');
      if (token != null) {
        final response = await http.post(
            Uri.parse(
                'https://ayajafar001.pythonanywhere.com/api/Favourites/mark-as-favourite/?id=$id'),
            headers: {"Authorization": "Bearer $token"},
            body: jsonEncode({'id': id}));

        if (response.statusCode == 200) {
          Get.snackbar(
            "Added to your favourites successfully",
            "",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 4),
            isDismissible: true,
            forwardAnimationCurve: Curves.easeOutBack,
          );
        } else if (response.statusCode == 400) {
          Get.snackbar(
            "Product is already in your favourites list",
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
      // print(e);
    }
    return null;
  }

  static Future<void> deleteFavourite({required int id}) async {
    try {
      String? token = await LocalDb.storage.read(key: 'token');
      if (token != null) {
        final response = await Dio().delete(
          'https://ayajafar001.pythonanywhere.com/api/Favourites/delete-favourite/?id=$id',
          queryParameters: {'id': id},
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
            },
          ),
        );
        // print(response.statusCode);
        if (response.statusCode == 200) {
          // print(response.data);
          Get.snackbar(
            "Favourite has been deleted successfully",
            "",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 4),
            isDismissible: true,
            forwardAnimationCurve: Curves.easeOutBack,
          );
        } else {
          // print(response.data);
        }
      }
    } catch (e) {
      // print(e);
    }
    return null;
  }
}
