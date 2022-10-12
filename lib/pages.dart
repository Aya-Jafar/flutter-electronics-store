import 'package:flutter/material.dart';
import 'package:get_x_first_trial/views/favourite/fav_page.dart';
import 'package:get_x_first_trial/views/home/products_page.dart';
import 'views/card/card_page.dart';


class Pages {
  static const List<Widget> pages = <Widget>[
    ProductsPage(),
    CardPage(),
    FavouritePage(),
  ];
}
