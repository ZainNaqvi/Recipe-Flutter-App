import 'package:flutter/foundation.dart';

class Recipe {
  String? name;
  String? images;
  double? rating;
  String? totalTime;

  Recipe(
      {required this.name,
      required this.images,
      required this.rating,
      required this.totalTime});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json["name"],
      images: json["images"][0]["hostedLargeUrl"],
      rating: json["rating"],
      totalTime: json["totalTime"],
    );
  }
  static List<Recipe> recipeFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }
}
