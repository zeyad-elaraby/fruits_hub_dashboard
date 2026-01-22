import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';

import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';

import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

import '../../domain/repositories/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final DatabaseService databaseService;
  OrdersRepositoryImpl(this.databaseService);

  @override
  Stream<Either<Failure, List<OrderEntity>>> getOrders() async* {
    try {
      await for (var data in databaseService.getStreamData(
        path: BackEndPoints.getOrders,
      )) {
        List<OrderEntity> orders = List<OrderEntity>.from(
          (data as List<dynamic>).map((e) => OrderModel.fromJson(e).toEntity()),
        ).toList();

        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> updateOrder(
    OrderStatusEnum status,
    String orderId,
  ) async {
    try {
      await databaseService.updateData(
        path: BackEndPoints.updateOrders,
        documentId: orderId,
        data: {"status": status.name},
      );
      return Right([]);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
