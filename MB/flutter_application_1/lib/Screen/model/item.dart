// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
    int? id;
    String? img;
    String? name;
    String? description;
    String? price;
    String? rating;

    Item({
        this.id,
        this.img,
        this.name,
        this.description,
        this.price,
        this.rating,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["ID"],
        img: json["img"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        rating: json["rating"],
    );

  get quantity => null;

    Map<String, dynamic> toJson() => {
        "ID": id,
        "img": img,
        "name": name,
        "description": description,
        "price": price,
        "rating": rating,
    };
}
