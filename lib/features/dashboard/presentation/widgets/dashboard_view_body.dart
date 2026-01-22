import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          CustomElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.addProductView);
            },
            title: "add products",
          ),

          CustomElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.ordersView);
            },
            title: "View orders",
          ),
        ],
      ),
    );
  }
}
