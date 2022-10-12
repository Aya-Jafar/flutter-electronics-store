import 'package:animated_icon/animate_icon.dart';
import 'package:animated_icon/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/models/product.dart';
import 'package:get_x_first_trial/services/card.dart';
import 'package:get_x_first_trial/services/favourite.dart';
import 'package:get_x_first_trial/views/product_detail/properties.dart';
import 'package:get_x_first_trial/views/product_detail/title.dart';
import 'colors_row.dart';
import 'first_section.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 228, 228, 228),
            elevation: 0,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: AnimateIcon(
                  key: UniqueKey(),
                  onTap: () {
                    FavService.markAsFavourite(id: product.id);
                  },
                  iconType: IconType.animatedOnTap,
                  height: 40,
                  width: 35,
                  color: Color.fromARGB(255, 103, 103, 103),
                  animateIcon: AnimateIcons.heart2,
                ),
              )
            ],
          ),
          body: Column(
            children: [
              FirstSection(product: product),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    TitleBuilder(product: product),
                    const SizedBox(
                      height: 30,
                    ),
                    PropertiesRow(product: product),
                    // TODO: Add capacity row
                    const SizedBox(
                      height: 30,
                    ),
                    ColorsRow(product: product),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 180, 180, 180),
                        onPrimary: Color.fromARGB(255, 31, 31, 31),
                        shadowColor: Color.fromARGB(255, 85, 86, 85),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width - 10, 50),
                      ),
                      onPressed: () {
                        CardService.addToCard(id: product.id);
                      },
                      child: const Text(
                        // TODO: Customize the font
                        'Add to card',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
