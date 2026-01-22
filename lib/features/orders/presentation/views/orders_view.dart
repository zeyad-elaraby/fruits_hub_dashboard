import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/service_locator.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/cubit/update_order_cubit/update_order_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/orders_view_body.dart';
import '../cubit/fetch_orders_cubit/fetch_orders_cubit.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<FetchOrdersCubit>()..getOrders()),
        BlocProvider(create: (context) => sl<UpdateOrderCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Orders')),
        body: OrdersViewBody(),
      ),
    );
  }
}
