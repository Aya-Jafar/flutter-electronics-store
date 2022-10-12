import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/controllers/favourite.dart';
import 'package:get_x_first_trial/wrapper.dart';
import 'controllers/card.dart';
import 'controllers/product.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(CardController());
    Get.put(FavController());


    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API-integration',
      home: Wrapper(),
      // initialBinding: HomeBindings(),
    );
  }
}

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(CardController());
  }
}
