import 'dart:convert';

import 'package:get_x_first_trial/models/product.dart';

UserCard cardFromJson(String str) => UserCard.fromJson(json.decode(str));
String cardToJson(UserCard data) => json.encode(data.toJson());

class UserCard {
  UserCard({
    required this.id,
    required this.cartTotal,
    required this.cartQuantity,
    required this.items,
  });

  int id;
  double cartTotal;
  int cartQuantity;
  List<Item> items;

  factory UserCard.fromJson(Map<String, dynamic> json) => UserCard(
        id: json["id"],
        cartTotal: json["cart_total"].toDouble(),
        cartQuantity: json["cart_quantity"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cart_total": cartTotal,
        "cart_quantity": cartQuantity,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.id,
    required this.quantity,
    required this.total,
    required this.product,
  });

  int id;
  int quantity;
  double total;
  Product product;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        quantity: json["quantity"],
        total: json["total"].toDouble(),
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "total": total,
        "product": product.toJson(),
      };
}
