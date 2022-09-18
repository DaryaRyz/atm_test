class Finance {
  final int cash;
  final CashType type;

  Finance({
    required this.cash,
    required this.type,
  });
}

enum CashType {
  cashBack,
  cash,
}
