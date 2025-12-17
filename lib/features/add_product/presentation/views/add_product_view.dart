import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/service_locator.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widgets/add_product_view_body.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widgets/add_product_view_body_bloc_consumer.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add Product"),
      body: BlocProvider(
        create: (context) => sl<AddProductCubit>(),
        child: AddProductViewBodyBlocConsumer(),
      ),
    );
  }
}
