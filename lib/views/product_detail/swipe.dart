import 'package:animated_icon/animate_icon.dart';
import 'package:animated_icon/animate_icons.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';

class SwipeIcon extends StatelessWidget {
  const SwipeIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    // AnimateIcon(
    //   key: UniqueKey(),
    //   onTap: () {},
    //   iconType: IconType.continueAnimation,
    //   height: 40,
    //   width: 35,
    //   color: Color.fromARGB(255, 103, 103, 103),
    //   animateIcon: AnimateIcons.dragRight,
    // );
    Image(
      height: 40,
      width: 40,
      image: NetworkImage(
          'https://cdn-icons-png.flaticon.com/512/4603/4603384.png'),
    );
  }
}
