import 'package:fruits_hub_dashboard/features/add_product/domain/entity/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num rating;
  final String date;
  final String reviewDescription;

  ReviewModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.reviewDescription,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) => ReviewModel(
    name: entity.name,
    image: entity.image,
    rating: entity.rating,
    date: entity.date,
    reviewDescription: entity.reviewDescription,
  );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    name: json['name'],
    image: json['image'],
    rating: json['rating'],
    date: json['date'],
    reviewDescription: json['reviewDescription'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image,
    'rating': rating,
    'date': date,
    'reviewDescription': reviewDescription,
  };
}
