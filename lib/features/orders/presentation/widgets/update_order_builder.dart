import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_snack_bar.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/cubit/update_order_cubit/update_order_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/cubit/update_order_cubit/update_order_state.dart';

class UpdateOrderBuilder extends StatelessWidget {
  const UpdateOrderBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
      listener: (context, state) {
        if (state is UpdateOrderSuccess) {
          customSnackBar(
            context: context,
            title: "success",
            message: "updated successfully",
            contentType: ContentType.success,
          );
        }
        if (state is UpdateOrderFailure) {
          customSnackBar(
            context: context,
            title: "Error",
            message: state.error,
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is UpdateOrderLoading,
          child: child,
        );
      },
    );
  }
}
