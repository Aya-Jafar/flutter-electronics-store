import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/services/urls.dart';

import '../../models/product.dart';
import '../home/test_grid.dart';

class TrendingContainer extends StatelessWidget {
  const TrendingContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Stack(
          children: [
            Container(
                height: 200,
                width: 310,
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromARGB(255, 225, 72, 151),
                        Color.fromARGB(255, 94, 3, 72),
                        Color.fromARGB(255, 8, 18, 69),
                      ],
                    )),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Image(
                        height: 170,
                        width: 150,
                        image: NetworkImage(
                            '${ApiUrls.baseUrl}${product.productImages[0]}'),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: (310 / 3),
                      // alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '50% off',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 217, 255),
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 255, 255, 255),
                              onPrimary: Color.fromARGB(255, 8, 18, 69),
                              shadowColor: Color.fromARGB(255, 106, 107, 106),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              minimumSize: Size(70, 35),
                            ),
                            onPressed: () {
                              // Get.to(() => TestGrid());
                            },
                            child: Text('Buy Now'),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ],
    ));
  }
}
