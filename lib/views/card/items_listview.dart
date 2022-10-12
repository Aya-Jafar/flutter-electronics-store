import 'package:flutter/material.dart';
import '../../controllers/card.dart';
import '../../services/urls.dart';
import 'item_info.dart';


class ItemsListView extends StatelessWidget {
  const ItemsListView({
    Key? key,
    required this.cardController,
  }) : super(key: key);

  final CardController cardController;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: cardController.itemsInCard
            .map((e) => Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(144, 234, 233, 233),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: Image(
                        image: NetworkImage(
                            '${ApiUrls.baseUrl}${e.product.productImages[0]}')),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        e.product.name,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: ItemInfo(item: e),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        cardController.deleteItem(item: e);
                      },
                      child: Container(
                        height: 50,
                        width: 40,
                        alignment: Alignment.center,
                        child: const Image(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/5136/5136827.png')),
                      ),
                    ),
                  ),
                ))
            .toList());
  }
}
