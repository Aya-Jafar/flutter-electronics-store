import 'dart:convert';
import 'package:get_x_first_trial/services/urls.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';
import 'local_db/auth_db.dart';

class ProductService {
  static Future<List<Product>> getProducts() async {
    try {
      String? token = await LocalDb.storage.read(key: 'token');
      if (token != null) {
        final response = await http.get(Uri.parse(ApiUrls.allProductsUrl),
            headers: {"Authorization": "Bearer $token"});
        if (response.statusCode == 200) {
          return productFromJson(response.body);
        } else {
          print(response.body);
        }
      }
    } catch (e) {
      print(e);
    }
    return <Product>[];
  }
}
