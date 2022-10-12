import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/services/product.dart';
import '../models/product.dart';

class HomeController extends GetxController {
  RxString selectedCategory = 'Phones'.obs;
  RxInt currentPage = 0.obs;
  RxString searchResult = ''.obs;

  List<Product> allProductsList = <Product>[];

  @override
  void onInit() {
    getHomeProductsList();
    print('Inside onInit in product controller');

    super.onInit();
  }

  Future<List<Product>> getHomeProductsList() async {
    allProductsList = await ProductService.getProducts();
    // print(allProductsList);
    return allProductsList;
  }

}
