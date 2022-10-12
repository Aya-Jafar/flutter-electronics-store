import 'package:flutter/material.dart';

import '../../models/product.dart';

class RateGenerator extends StatelessWidget {
  const RateGenerator({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
              product.rate.toInt(),
              (index) => const Icon(Icons.star_rounded,
                  color: const Color.fromARGB(
                      255, 255, 193, 59),
                  size: 15)),
        ),
        
        const Icon(Icons.star_half_rounded,
            size: 15,
            color:
                const Color.fromARGB(255, 255, 193, 59))
      ],
    );
  }
}
