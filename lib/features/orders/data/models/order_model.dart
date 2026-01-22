import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String status;
  final String paymentMethod;
  final String orderId;
  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
    required this.orderId,
    required this.status,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json["totalPrice"],
      uId: json["uId"],
      shippingAddressModel: ShippingAddressModel.fromJson(
        json["shippingAddress"],
      ),
      status: json["status"],
      orderProducts: (json["orderProducts"] as List<dynamic>)
          .map((e) => OrderProductModel.fromJson(e))
          .toList(),
      paymentMethod: json["paymentMethod"],
      orderId: json["orderId"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "totalPrice": totalPrice,
      "uId": uId,
      "shippingAddress": shippingAddressModel.toJson(),
      "status": "pending",
      "date": DateTime.now().toString(),
      "orderProducts": orderProducts.map((e) => e.toJson()).toList(),
      "paymentMethod": paymentMethod,
      "orderId": orderId,
    };
  }

  OrderEntity toEntity() {
    return OrderEntity(
      uId: uId,
      orderId: orderId,
      totalPrice: totalPrice,
      status: OrderStatusEnum.values.firstWhere(
        (e) => e.name.toString() == status,
        orElse: () => OrderStatusEnum.pending,
      ),
      paymentMethod: paymentMethod,
      shippingAddressEntity: shippingAddressModel.toEntity(),
      orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
    );
  }
}
