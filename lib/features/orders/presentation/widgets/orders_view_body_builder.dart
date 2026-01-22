import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/order_moc_data.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/cubit/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/cubit/fetch_orders_cubit/fetch_orders_state.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/filter_sction.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/orders_items_listview.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersViewBodyBuilder extends StatelessWidget {
  const OrdersViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        FilterSection(),
        BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
          buildWhen: (previous, current) =>
              current is FetchOrdersLoading ||
              current is FetchOrdersSuccess ||
              current is FetchhOrdersFailure,
          builder: (context, state) {
            switch (state) {
              case FetchOrdersLoading _:
                return Expanded(
                  child: Skeletonizer(
                    child: OrdersItemsListview(ordersList: mockOrdersList),
                  ),
                );
              case FetchOrdersSuccess _:
                return Expanded(
                  child: OrdersItemsListview(ordersList: state.orders),
                );
              case FetchhOrdersFailure _:
                return Center(child: Text(state.error));
              default:
                return Container();
            }
          },
        ),
      ],
    );
  }
}
