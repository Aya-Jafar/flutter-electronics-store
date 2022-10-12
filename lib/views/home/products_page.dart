import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/models/account.dart';
import 'package:get_x_first_trial/views/widgets/title_row.dart';
import '../../controllers/product.dart';
import '../widgets/trending_container.dart';
import 'catogaries.dart';
import 'filtered_products.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() {
    return _ProductsPageState();
  }
}

class _ProductsPageState extends State<ProductsPage> {
  late final HomeController homeController;

  @override
  void initState() {
    homeController = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TitleRow(
          text: 'Welcome, ${Account.current.userName}',
          isHomePage: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // TODO: ADD search text field here
         
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: homeController.allProductsList
                      .where((element) => element.isBestSelling)
                      .map((e) => TrendingContainer(
                            product: e,
                          ))
                      .toList())),
          const SizedBox(
            height: 40,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: const CatogariesRow())),
          const SizedBox(
            height: 30,
          ),
          Obx(() {
            return FilterdProducts(
              catogary: homeController.selectedCategory.value,
            );
          })
        ]),
      ),
    );
  }
}
