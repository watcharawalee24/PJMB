// To parse this JSON data, do
//
//     final cartData = cartDataFromJson(jsonString);

import 'dart:convert';

List<CartData> cartDataFromJson(String str) => List<CartData>.from(json.decode(str).map((x) => CartData.fromJson(x)));

String cartDataToJson(List<CartData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartData {
  String? img;
    String? name;
    String? description;
    int? price;
    int? quantity;
    int? id;

    CartData({
      this.img,
        this.name,
        this.description,
        this.price,
        this.quantity,
        this.id,
    });

    factory CartData.fromJson(Map<String, dynamic> json) => CartData(
      img: json['img'],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
      "img":img,
        "name": name,
        "description": description,
        "price": price,
        "quantity": quantity,
        "id": id,
    };
}
