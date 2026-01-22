import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int count;
  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.count,
  });
  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      name: json["name"],
      code: json["code"],
      imageUrl: json["imageUrl"],
      price: json["price"],
      count: json["count"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "code": code,
      "imageUrl": imageUrl,
      "price": price,
      "count": count,
    };
  }

  OrderProductEntity toEntity() {
    return OrderProductEntity(
      name: name,
      code: code,
      imageUrl: imageUrl,
      price: price,
      count: count,
    );
  }
}
