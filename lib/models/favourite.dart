import 'dart:convert';
import 'product.dart';

List<Favourite> favouriteFromJson(String str) =>
    List<Favourite>.from(json.decode(str).map((x) => Favourite.fromJson(x)));

String favouriteToJson(List<Favourite> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Favourite {
  Favourite({
    required this.id,
    required this.product,
  });

  int id;
  Product product;

  factory Favourite.fromJson(Map<String, dynamic> json) => Favourite(
        id: json["id"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product.toJson(),
      };
}
