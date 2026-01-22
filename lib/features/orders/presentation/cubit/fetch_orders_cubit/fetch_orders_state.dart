import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class FetchOrdersState {}

class FetchOrdersInitial extends FetchOrdersState {}

class FetchOrdersLoading extends FetchOrdersState {}

class FetchOrdersSuccess extends FetchOrdersState {
  final List<OrderEntity> orders;
  FetchOrdersSuccess(this.orders);
}

class FetchhOrdersFailure extends FetchOrdersState {
  final String error;
  FetchhOrdersFailure(this.error);
}
