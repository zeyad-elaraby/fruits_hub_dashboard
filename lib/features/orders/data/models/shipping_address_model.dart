import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? city;
  String? floor;
  ShippingAddressModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.city,
    this.floor,
  });
  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      city: json['city'],
      floor: json['floor'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "address": address,
      "city": city,
      "floor": floor,
    };
  }

  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      city: city,
      floor: floor,
    );
  }
}
