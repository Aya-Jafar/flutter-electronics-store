import 'package:flutter/material.dart';
import 'package:get_x_first_trial/services/urls.dart';

import '../../models/product.dart';

class ProductContainer extends StatelessWidget {
  final Product product;

  const ProductContainer({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 240,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(144, 234, 233, 233),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image(
            image:
                NetworkImage('${ApiUrls.baseUrl}${product.productImages[0]}')),
      ),
    );
  }
}
