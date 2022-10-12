import 'package:flutter/material.dart';

import '../../models/card.dart';

class ItemInfo extends StatelessWidget {
  final Item item;

  const ItemInfo({
    Key? key,
    required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '\$${item.total.toString().substring(0, item.total.toString().indexOf('.'))}',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Text(
              '${item.quantity}',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              'x',
              style: TextStyle(
                  color: Color.fromARGB(255, 239, 26, 172)),
            )
          ],
        ),
      ],
    );
  }
}
