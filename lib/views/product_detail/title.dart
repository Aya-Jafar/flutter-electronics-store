import 'package:flutter/material.dart';
import 'package:get_x_first_trial/views/product_detail/rate.dart';

import '../../models/product.dart';

class TitleBuilder extends StatelessWidget {
  const TitleBuilder({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            RateGenerator(product: product)
          ],
        ),
        Row(
          children: [
            const Text('\$ ',
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 239, 139, 0),
                    fontWeight: FontWeight.bold)),
            Text('${product.price}',
                style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 69, 69, 69),
                    fontWeight: FontWeight.w600)),
          ],
        )
      ],
    );
  }
}

// Widget splitLongName(String name) {
//   if (name.length >= 12) {
//     return Text(
//       name,
//       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//     );
//   } else {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           name.split(' ').sublist(0, 2).join(' '),
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         Text(
//           name.split(' ').sublist(2).join(' '),
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//       ],
//     );

//   }
// }
