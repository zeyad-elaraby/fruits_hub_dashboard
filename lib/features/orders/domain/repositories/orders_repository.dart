import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepository {
  Stream<Either<Failure, List<OrderEntity>>> getOrders();
  Future<Either<Failure, List<OrderEntity>>> updateOrder(OrderStatusEnum status , String orderId);
}
