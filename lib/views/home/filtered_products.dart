import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/views/product_detail/detail_page.dart';
import '../../controllers/product.dart';
import '../widgets/product_container.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FilterdProducts extends StatefulWidget {
  final String catogary;

  FilterdProducts({Key? key, required this.catogary}) : super(key: key);

  @override
  State<FilterdProducts> createState() => FilterdProductsState();

  static RxInt currentPage = 0.obs;
}

PageController pageViewController = PageController();

class FilterdProductsState extends State<FilterdProducts> {
  late final HomeController _homeController;

  @override
  void initState() {
    _homeController = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 3.3;
    double cardHeight = MediaQuery.of(context).size.height / 3.6;

    return Expanded(
      child: PageView(
          controller: pageViewController,
          onPageChanged: (x) {
            FilterdProducts.currentPage.value = x;
          },
          children: [
            GridView.count(
                childAspectRatio: 1 / 1.2,
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                physics: const ScrollPhysics(),
                children: _homeController.allProductsList
                    .where((element) => element.catogary == widget.catogary)
                    .map((e) => GestureDetector(
                          onTap: () => Get.to(() => DetailPage(
                                product: e,
                              )),
                          child: Column(
                            children: [
                              ProductContainer(
                                product: e,
                              ),
                              Text(e.name),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '\$ ',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 2, 122, 202)),
                                  ),
                                  Text('${e.price.toString()}'),
                                ],
                              )
                            ],
                          ),
                        ))
                    .toList()),
          ]),
    );
  }
}
