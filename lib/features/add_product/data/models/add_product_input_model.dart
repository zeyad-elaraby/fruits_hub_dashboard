import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/data/models/review_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entity/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;
  final String code;
  final String description;
  final String price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expiratioMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewModel> reviews;

  AddProductInputModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
    this.isOrganic = false,
    required this.expiratioMonths,
    required this.numberOfCalories,
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.unitAmount,
    required this.reviews,
  });

  factory AddProductInputModel.fromEntity(AddProductInputEntity entity) =>
      AddProductInputModel(
        name: entity.name,
        code: entity.code,
        description: entity.description,
        price: entity.price,
        image: entity.image,
        isFeatured: entity.isFeatured,
        imageUrl: entity.imageUrl,
        isOrganic: entity.isOrganic,
        expiratioMonths: entity.expiratioMonths,
        numberOfCalories: entity.numberOfCalories,
        avgRating: entity.avgRating,
        ratingCount: entity.ratingCount,
        unitAmount: entity.unitAmount,
        reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      );


  Map<String, dynamic> toJson() => {
    'name': name,
    'code': code,
    'description': description,
    'price': price,
    'isFeatured': isFeatured,
    'imageUrl': imageUrl,
    'isOrganic': isOrganic,
    'expiratioMonths': expiratioMonths,
    'numberOfCalories': numberOfCalories,
    'avgRating': avgRating,
    'ratingCount': ratingCount,
    'unitAmount': unitAmount,
    "reviews": reviews.map((e) => e.toJson()).toList(),
  };
}
