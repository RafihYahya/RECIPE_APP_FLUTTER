import 'package:flutter/material.dart';

class RecipeIngredient {
  double? id;
  double number;
  String type;
  Image? image;
  String? imageUrl;

  RecipeIngredient(
      {this.id,
      required this.number,
      required this.type,
      this.image,
      this.imageUrl});
}
