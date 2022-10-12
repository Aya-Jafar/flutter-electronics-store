import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



// List<Product> trendingProductsFromJson(String str) =>
//     List<Product>.from(json.decode(str).map((x) => Product.fromJson(x.isBestSelling)));


class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.catogary,
    required this.brand,
    required this.rate,
    required this.colors,
    required this.ramsAndStorage,
    required this.cpu,
    required this.system,
    required this.isBestSelling,
    required this.isTrendingNow,
    required this.productImages,
  });

  int id;
  String name;
  double price;
  String catogary;
  String brand;
  double rate;
  List<String> colors;
  List<String> ramsAndStorage;
  String cpu;
  String system;
  bool isBestSelling;
  bool isTrendingNow;
  List<String> productImages;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        catogary: json["catogary"],
        brand: json["brand"],
        rate: json["rate"].toDouble(),
        colors: List<String>.from(json["colors"].map((x) => x)),
        ramsAndStorage:
            List<String>.from(json["rams_and_storage"].map((x) => x)),
        cpu: json["cpu"],
        system: json["system"],
        isBestSelling: json["is_best_selling"],
        isTrendingNow: json["is_trending_now"],
        productImages: List<String>.from(json["product_images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "catogary": catogary,
        "brand": brand,
        "rate": rate,
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "rams_and_storage": List<String>.from(ramsAndStorage.map((x) => x)),
        "cpu": cpu,
        "system": system,
        "is_best_selling": isBestSelling,
        "is_trending_now": isTrendingNow,
        "product_images": List<String>.from(productImages.map((x) => x)),
      };

}
