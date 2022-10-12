import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/models/card.dart';
import 'package:get_x_first_trial/services/card.dart';

class CardController extends GetxController {
  late UserCard card;

  RxList<Item> itemsInCard = <Item>[].obs;
  RxDouble totalPrice = 0.0.obs;
  RxInt totalQnt = 0.obs;

  // RxInt itemTotalQnt = 1.obs;
  // RxDouble itemTotalPrice = 0.0.obs;

  @override
  void onInit() {
    getItemInCard();
    // print('hello card controller !!');

    super.onInit();
  }

  void getItemInCard() async {
    if (await CardService.getCard() != null) {
      card = (await CardService.getCard())!;

      totalPrice.value = card.cartTotal;
      totalQnt.value = card.cartQuantity;
      itemsInCard.value = card.items;
    }

    // return itemsInCard;
  }

  void deleteItem({required Item item}) async {
    (await CardService.deleteFromCard(itemId: item.id));
    itemsInCard.removeWhere((element) => element.id == item.id);
    totalQnt.value -= item.quantity;
    totalPrice.value -= item.total;
    // totalPrice.value
    //     .toString()
    //     .substring(0, totalPrice.value.toString().indexOf('.') + 2);
  }
}
