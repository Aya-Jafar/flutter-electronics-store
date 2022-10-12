import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../models/product.dart';
import '../../services/urls.dart';

class ImagesPageView extends StatelessWidget {
  ImagesPageView({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  PageController pageViewController = PageController();
  // RxInt hight = 300.obs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageViewController,
        onPageChanged: (x) {
          pageViewController.animateToPage(x,
              duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
          // hight.value += 10;
        },
        scrollDirection: Axis.horizontal,
        itemCount: product.productImages.length,
        itemBuilder: (BuildContext context, int index) {
          return Image(
            // height: hight.value.toDouble(),
            image: NetworkImage(
                '${ApiUrls.baseUrl}${product.productImages[index]}'),
          );
        },
      ),
    );
  }
}
