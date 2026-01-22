// Sub-widget to render a single product row cleanly
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/custom_cached_network_image.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';

class OrderProductItem extends StatelessWidget {
  final OrderProductEntity product;

  const OrderProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Product Image
        CustomCachedNetworkImage(
          imageUrl: product.imageUrl,
          height: 50,
          width: 50,
        ),
        const SizedBox(width: 12),

        // Product Name and Code
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (product.code.isNotEmpty)
                Text(
                  'Code: ${product.code}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
            ],
          ),
        ),

        // Count and Price
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'x${product.count}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${product.price}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
