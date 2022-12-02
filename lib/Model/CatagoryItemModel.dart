// To parse this JSON data, do
//
//     final catagoryItemModel = catagoryItemModelFromJson(jsonString);

import 'dart:convert';

List<CatagoryItemModel> catagoryItemModelFromJson(String str) => List<CatagoryItemModel>.from(json.decode(str).map((x) => CatagoryItemModel.fromJson(x)));

String catagoryItemModelToJson(List<CatagoryItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatagoryItemModel {
    CatagoryItemModel({
      required  this.id,
      required  this.title,
      required  this.price,
      required  this.description,
      required  this.category,
      required  this.image,
      required  this.rating,
    });

    int id;
    String title;
    double price;
    String description;
    String category;
    String image;
    Rating rating;

    factory CatagoryItemModel.fromJson(Map<String, dynamic> json) => CatagoryItemModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating.toJson(),
    };
}

class Rating {
    Rating({
      required  this.rate,
      required  this.count,
    });

    double rate;
    int count;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}
