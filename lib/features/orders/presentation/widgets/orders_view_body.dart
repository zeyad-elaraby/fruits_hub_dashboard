import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/orders_view_body_builder.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/update_order_builder.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: UpdateOrderBuilder(
        child: OrdersViewBodyBuilder(),
      ),
    );
  }
}
