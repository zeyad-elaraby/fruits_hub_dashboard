import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repositories/orders_repository.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/cubit/update_order_cubit/update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.ordersRepository) : super(UpdateOrderInitial());
  final OrdersRepository ordersRepository;
  void updateOrderStatus(String orderId, OrderStatusEnum status) async {
    emit(UpdateOrderLoading());
    final result = await ordersRepository.updateOrder(status, orderId);
    result.fold(
      (failure) => emit(UpdateOrderFailure(failure.message)),
      (orders) => emit(UpdateOrderSuccess()),
    );
  }
}
