import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

final mockShippingAddress = ShippingAddressEntity(
  name: "Ahmed Mohamed",
  email: "ahmed.mohamed@example.com",
  phoneNumber: "+201234567890",
  address: "123 El Tahrir Street",
  city: "Cairo",
  floor: "3rd Floor, Apt 12",
);

// 2. Create a List of Products
final mockOrderProducts = [
  OrderProductEntity(
    name: "Organic Bananas",
    code: "FRUIT-001",
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg", // Valid placeholder
    price: 12.50,
    count: 2,
  ),
  OrderProductEntity(
    name: "Red Apples",
    code: "FRUIT-002",
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/commons/1/15/Red_Apple.jpg", // Valid placeholder
    price: 8.00,
    count: 5,
  ),
  OrderProductEntity(
    name: "Fresh Avocados",
    code: "FRUIT-005",
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/commons/c/c9/Avocado_Hass_-_single_and_halved.jpg",
    price: 25.00,
    count: 1,
  ),
];

// 3. Create the Order Model
final mockOrderModel = OrderEntity(
  uId: "user_12345",
  orderId: "ORD-2026-7890",
  totalPrice: 90.0, // (12.5*2) + (8*5) + (25*1) = 25 + 40 + 25 = 90
  paymentMethod: "PayPal",
  shippingAddressEntity: mockShippingAddress,
  orderProducts: mockOrderProducts,
  status: OrderStatusEnum.pending,
);

// ---
// Optional: A List of Orders if you want to test a ListView
final List<OrderEntity> mockOrdersList = [
  mockOrderModel,
  mockOrderModel,
  mockOrderModel,
  OrderEntity(
    uId: "user_12345",
    orderId: "ORD-2026-7891",
    totalPrice: 45.0,
    paymentMethod: "Cash on Delivery",
    shippingAddressEntity: mockShippingAddress,
    orderProducts: [
      OrderProductEntity(
        name: "Mango",
        code: "FRUIT-099",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/9/90/Hapus_Mango.jpg",
        price: 45.00,
        count: 1,
      ),
    ],
    status: OrderStatusEnum.pending,
  ),
];
