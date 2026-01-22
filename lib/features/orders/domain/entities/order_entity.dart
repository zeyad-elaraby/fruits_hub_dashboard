import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  final ShippingAddressEntity shippingAddressEntity;
  final OrderStatusEnum status;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final String orderId;
  OrderEntity({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressEntity,
    required this.status,
    required this.orderProducts,
    required this.paymentMethod,
    required this.orderId,
  });
}
