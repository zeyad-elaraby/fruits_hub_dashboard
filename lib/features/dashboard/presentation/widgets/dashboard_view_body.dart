import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CustomElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.addProductView);
            },
            title: "add products",
          ),
        ),
      ],
    );
  }
}
