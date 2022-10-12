import 'dart:math';

import 'package:animated_icon/animate_icon.dart';
import 'package:animated_icon/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:get_x_first_trial/views/product_detail/properties.dart';

import '../../models/product.dart';

class ColorsRow extends StatelessWidget {
  const ColorsRow({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // AnimateIcon(
        //   key: UniqueKey(),
        //   onTap: () {},
        //   iconType: IconType.,
        //   height: 70,
        //   width: 70,
        //   color: Color.fromARGB(255, 127, 2, 44),
        //   animateIcon: AnimateIcons.loading3,
        // ),
        Text('Available Colors',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 67, 67, 67))),
        Row(
          children: product.colors
              .map((e) => Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(right: 10, top: 12, bottom: 15),
                    decoration: BoxDecoration(
                        color: Property.parseColor(e).withOpacity(0.8),
                        shape: BoxShape.circle),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
