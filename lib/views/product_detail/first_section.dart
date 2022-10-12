

import 'package:flutter/material.dart';
import 'package:get_x_first_trial/views/product_detail/swipe.dart';

import '../../models/product.dart';
import 'page_view.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 2.3,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          // shape: BoxShape.circle,
          color: Color.fromARGB(255, 228, 228, 228),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80.0),
              bottomRight: Radius.circular(80.0)),
        ),
        child: Column(
          children: [
            ImagesPageView(product: product),
            SizedBox(
              height: 10,
            ),
            SwipeIcon(),
            SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}
