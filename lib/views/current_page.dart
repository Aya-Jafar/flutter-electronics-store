import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/pages.dart';
import '../controllers/product.dart';
import '../models/account.dart';

class CurrentPage extends StatefulWidget {
  CurrentPage({Key? key}) : super(key: key);

  @override
  State<CurrentPage> createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  late final HomeController _homeController;

  @override
  void initState() {
    _homeController = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return Pages.pages.elementAt(_homeController.currentPage.value);
        }),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            currentIndex: _homeController.currentPage.value,
            fixedColor: Color.fromARGB(255, 197, 5, 69),
            unselectedItemColor: Color.fromARGB(255, 46, 46, 46),
            selectedFontSize: 15,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            unselectedFontSize: 13,  
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
            onTap: (x) {
              _homeController.currentPage.value = x;
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image(
                    height: 35,
                    width: 40,
                    image: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/7633/7633790.png')),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image(
                    height: 35,
                    width: 40,
                    image: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/5135/5135979.png')),
                label: 'Card',
              ),
              BottomNavigationBarItem(
                icon: Image(
                    height: 35,
                    width: 40,
                    image: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/5135/5135668.png')),
                label: 'Favourite',
              ),

              // BottomNavigationBarItem(
              //   icon: Icon(Icons.person),
              //   label: 'Profile',
              // ),
            ],
          );
        }),
      ),
    );
  }
}
