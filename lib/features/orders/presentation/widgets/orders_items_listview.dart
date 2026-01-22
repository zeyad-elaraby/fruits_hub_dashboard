import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/order_item.dart';

class OrdersItemsListview extends StatelessWidget {
  const OrdersItemsListview({super.key, required this.ordersList});
  final List<OrderEntity> ordersList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return OrderItemWidget(orderEntity: ordersList[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10.h);
      },
      itemCount: ordersList.length,
    );
  }
}
