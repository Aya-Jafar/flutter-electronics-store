import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product.dart';
import 'filtered_products.dart';

class CatogariesRow extends StatelessWidget {
  const CatogariesRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CatogaryTab(
            currentPage: 0,
            catogary: 'Phones',
          ),
          CatogaryTab(
            currentPage: 1,
            catogary: 'Laptops',
          ),
          CatogaryTab(
            currentPage: 2,
            catogary: 'Tablets',
          ),
          CatogaryTab(
            currentPage: 3,
            catogary: 'Desktop pc',
          ),
        ]);
  }
}

class CatogaryTab extends StatefulWidget {
  const CatogaryTab({Key? key, this.currentPage = 0, required this.catogary})
      : super(key: key);

  final int currentPage;
  final String catogary;

  @override
  State<CatogaryTab> createState() => _CatogaryTabState();
}

class _CatogaryTabState extends State<CatogaryTab> {
  late final HomeController homeController;

  @override
  void initState() {
    homeController = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          FilterdProducts.currentPage.value = widget.currentPage;
          homeController.selectedCategory.value = widget.catogary;
          // pageViewController.animateToPage(widget.currentPage,
          //     duration: Duration(seconds: 12), curve: Curves.linear);
        },
        child: Text(
          widget.catogary,
          style: TextStyle(
            color: FilterdProducts.currentPage.value == widget.currentPage
                ? Color.fromARGB(255, 2, 122, 202)
                : Colors.black,
            fontWeight: FilterdProducts.currentPage.value == widget.currentPage
                ? FontWeight.bold
                : FontWeight.w400,
            fontSize: FilterdProducts.currentPage.value == widget.currentPage
                ? 17
                : 15,
          ),
        ),
      );
    });
  }
}
