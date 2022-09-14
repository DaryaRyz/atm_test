class FinanceModel {
  final int cash;
  final CashType type;

  FinanceModel({
    required this.cash,
    required this.type,
  });
}

enum CashType {
  cashBack,
  cash,
}
