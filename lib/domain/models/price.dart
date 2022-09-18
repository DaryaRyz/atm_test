class Price {
  static const hashKey = 'hash';
  static const priceKey = 'price';

  String? hash;
  String? price;

  Price({
    this.hash,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      hashKey: hash,
      priceKey: price,
    };
  }

  Price.fromMap(Map<String, dynamic> map)
      : hash = map[hashKey],
        price = map[priceKey];
}