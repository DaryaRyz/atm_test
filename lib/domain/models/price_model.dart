class PriceModel {
  static const hashKey = 'hash';
  static const priceKey = 'price';

  String? hash;
  String? price;

  PriceModel({
    this.hash,
    this.price,
  });

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