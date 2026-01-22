import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repositories/orders_repository.dart';
import 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  StreamSubscription? _ordersSubscription;
  FetchOrdersCubit(this.ordersRepository) : super(FetchOrdersInitial());
  final OrdersRepository ordersRepository;
  void getOrders() async {
    emit(FetchOrdersLoading());
    _ordersSubscription = ordersRepository.getOrders().listen((result) {
      result.fold(
        (failure) => emit(FetchhOrdersFailure(failure.message)),
        (orders) => emit(FetchOrdersSuccess(orders)),
      );
    });
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    return super.close();
  }
}
