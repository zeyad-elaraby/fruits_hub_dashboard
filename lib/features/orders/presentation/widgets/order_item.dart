import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/cubit/update_order_cubit/update_order_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/order_action_button.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/order_product_item.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/order_status_chip.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderEntity orderEntity;

  const OrderItemWidget({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '\$${orderEntity.totalPrice.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                OrderStatusChip(orderEntity: orderEntity),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'Order #${orderEntity.orderId}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
                fontSize: 11.sp,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),

            // Payment Method Chip
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Payment: ${orderEntity.paymentMethod}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const Divider(height: 24),

            // Customer / Shipping Info Summary
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 16,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '${orderEntity.shippingAddressEntity.name} • ${orderEntity.shippingAddressEntity.toString()}',
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // List of Ordered Products
            ...orderEntity.orderProducts.map((product) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: OrderProductItem(product: product),
              );
            }),

            OrderActionButtons(orderEntity: orderEntity),
          ],
        ),
      ),
    );
  }
}
