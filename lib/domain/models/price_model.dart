class PriceModel {
  static const hashKey = 'hash';
  static const priceKey = 'price';

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

  Map<String, dynamic> toMap() {
    return {
      hashKey: hash,
      priceKey: price,
    };
  }

  PriceModel.fromMap(Map<String, dynamic> map)
      : hash = map[hashKey],
        price = map[priceKey];
}