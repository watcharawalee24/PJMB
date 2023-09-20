// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
    int? id;
    String? firstName;
    String? lastName;
    int? age;
    String? skintype;
    String? email;
    String? password;
    String? address;

    Users({
        this.id,
        this.firstName,
        this.lastName,
        this.age,
        this.skintype,
        this.email,
        this.password,
        this.address,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        age: json["age"],
        skintype: json["Skintype"],
        email: json["email"],
        password: json["password"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "age": age,
        "Skintype": skintype,
        "email": email,
        "password": password,
        "address": address,
    };
}
