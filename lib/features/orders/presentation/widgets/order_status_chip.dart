import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderStatusChip extends StatelessWidget {
  const OrderStatusChip({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getOrderStatusColor(orderEntity.status),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        _getOrderStatusText(orderEntity.status),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color _getOrderStatusColor(OrderStatusEnum status) {
    switch (status) {
      case OrderStatusEnum.pending:
        return AppColors.colorF4A91F;
      case OrderStatusEnum.accepted:
        return AppColors.primaryColor;
      case OrderStatusEnum.delivered:
        return AppColors.color5DB957;
      case OrderStatusEnum.canceled:
        return AppColors.errorColor;
    }
  }

  String _getOrderStatusText(OrderStatusEnum status) {
    switch (status) {
      case OrderStatusEnum.pending:
        return 'Pending';
      case OrderStatusEnum.accepted:
        return 'Accepted';
      case OrderStatusEnum.delivered:
        return 'Delivered';
      case OrderStatusEnum.canceled:
        return 'Canceled';
    }
  }
}
