import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DashboardViewBody());
  }
}
