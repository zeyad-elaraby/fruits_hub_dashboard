import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/cubit/update_order_cubit/update_order_cubit.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (orderEntity.status == OrderStatusEnum.pending) ...[
          CustomElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrderStatus(
                orderEntity.orderId,
                OrderStatusEnum.accepted,
              );
            },
            height: 30.h,
            title: "Accept",
            width: 45.w,
          ),
          CustomElevatedButton(
            backGroundColor: AppColors.errorColor,
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrderStatus(
                orderEntity.orderId,
                OrderStatusEnum.canceled,
              );
            },
            height: 30.h,
            title: "reject",
            width: 45.w,
          ),
        ],
        if (orderEntity.status == OrderStatusEnum.accepted) ...[
          CustomElevatedButton(
            backGroundColor: AppColors.lightPrimaryColor,
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrderStatus(
                orderEntity.orderId,
                OrderStatusEnum.delivered,
              );
            },
            height: 30.h,
            title: "Delivered",
            width: 45.w,
          ),
        ],
      ],
    );
  }
}
