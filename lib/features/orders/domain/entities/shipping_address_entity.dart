class ShippingAddressEntity {
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? city;
  String? floor;
  ShippingAddressEntity({
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.city,
    this.floor,
  });
  @override
  String toString() {
    return '$city, $address, $floor';
  }
}
