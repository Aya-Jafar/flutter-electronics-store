import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/controllers/card.dart';
import 'package:get_x_first_trial/services/favourite.dart';
import '../widgets/title_row.dart';
import 'items_listview.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  late final CardController cardController;

  @override
  void initState() {
    cardController = Get.find();

    cardController.getItemInCard();

    //print(cardController.itemsInCard.length);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const TitleRow(
              text: 'Card',
            )),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(() {
            return cardController.itemsInCard.isEmpty
                ? const Center(
                    child: Text('Your Card is empty'),
                  )
                : Column(
                    children: [
                      Expanded(
                          child: ItemsListView(cardController: cardController)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(cardController.totalQnt.toString()),
                            Text(
                                '\$${cardController.totalPrice.toString().substring(0, cardController.totalPrice.toString().indexOf('.') + 2)}'),
                          ],
                        ),
                      )
                    ],
                  );
          }),
        ));
  }
}
