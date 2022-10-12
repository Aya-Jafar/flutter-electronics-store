import 'dart:isolate';

import 'package:animated_icon/animate_icon.dart';
import 'package:animated_icon/animate_icons.dart';
import 'package:flutter/material.dart';

import '../../controllers/product.dart';
import '../../services/auth.dart';
import '../current_page.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({Key? key, this.isHomePage = false, required this.text})
      : super(key: key);
  final String text;
  final bool isHomePage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: const EdgeInsets.only(left: 20, top: 25),
            child: Text(
              text,
              style: TextStyle(
                  color: Color.fromARGB(255, 76, 76, 76), fontSize: 22),
            )),
        isHomePage
            ? Padding(
                padding: const EdgeInsets.only(top: 25, right: 20.0),
                child: AnimateIcon(
                  key: UniqueKey(),
                  onTap: () {
                    AuthService.logOut();
                  },
                  iconType: IconType.animatedOnTap,
                  height: 23,
                  width: 23,
                  color: Color.fromARGB(255, 0, 115, 246),
                  animateIcon: AnimateIcons.signOut,
                ))
            : Text(''),
      ],
    );
  }
}
