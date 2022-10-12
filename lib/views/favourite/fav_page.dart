import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/services/favourite.dart';
import 'package:get_x_first_trial/views/widgets/title_row.dart';

import '../../controllers/favourite.dart';
import '../../services/urls.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  late final FavController favController;

  @override
  void initState() {
    favController = Get.find();

    favController.getAllFavourites();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: TitleRow(text: 'Favourite')),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Obx(() {
            return favController.FavList.isEmpty
                ? Center(
                    child: Text('No favourite products is added yet'),
                  )
                : ListView(
                    children: favController.FavList.map((e) => Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(144, 234, 233, 233),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            leading: Image(
                                image: NetworkImage(
                                    '${ApiUrls.baseUrl}${e.product.productImages[0]}')),
                            title: Text(
                              e.product.name,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                favController.deleteFav(id: e.id);
                              },
                              child: const Icon(Icons.favorite_rounded,
                                  color: Color.fromARGB(255, 67, 67, 67)),
                            ),
                          ),
                        )).toList());
          }),
        ));
  }
}
