class PriceModel {
  final String? hash;
  final String? price;

  PriceModel({
    this.hash,
    this.price,
  });

  PriceModel copyWith({
    final String? hash,
    final String? price,
  }) =>
      PriceModel(
        hash: hash ?? this.hash,
        price: price ?? this.price,
      );
}
