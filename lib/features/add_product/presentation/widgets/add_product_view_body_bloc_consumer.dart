import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_snack_bar.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/cubit/add_product_state.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widgets/add_product_view_body.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (BuildContext context, AddProductState state) {
        if (state is AddProductError) {
          customSnackBar(
            context: context,
            title: "Error",
            message: state.message,
            contentType: ContentType.failure,
          );
        }
        if (state is AddProductSuccess) {
          customSnackBar(
            context: context,
            title: "Success",
            message: "Product added successfully",
            contentType: ContentType.success,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddProductLoading,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
