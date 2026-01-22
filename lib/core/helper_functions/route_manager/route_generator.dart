import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/orders_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.dashboardView:
      return MaterialPageRoute(builder: (context) => DashboardView());
    case AppRoutes.addProductView:
      return MaterialPageRoute(builder: (context) => AddProductView());
    case AppRoutes.ordersView:
      return MaterialPageRoute(builder: (context) => OrdersView());

    default:
      return MaterialPageRoute(
        builder: (context) =>
            Scaffold(body: Center(child: Text('No Route Found'))),
      );
  }
}
