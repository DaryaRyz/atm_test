import 'package:atm_test/domain/models/price.dart';

class Settings {
  static const decimalPositionCashKey = 'decimalPositionCash';
  static const decimalPositionCashlessKey = 'decimalPositionCashless';
  static const scaleFactorCashKey = 'scaleFactorCash';
  static const scaleFactorCashlessKey = 'scaleFactorCashless';
  static const soundOnKey = 'soundOn';
  static const isUsingKey = 'isUsing';
  static const priceListKey = 'priceList';

  final String decimalCash;
  final String decimalCashless;
  final String scaleCash;
  final String scaleCashless;
  final bool soundOn;
  final bool isUsing;
  final List<Price> priceList;

  Settings({
    required this.decimalCash,
    required this.decimalCashless,
    required this.scaleCash,
    required this.scaleCashless,
    required this.soundOn,
    required this.isUsing,
    required this.priceList,
  });

  Settings.empty()
      : priceList = [
          Price(),
          Price(),
        ],
        decimalCash = '',
        decimalCashless = '',
        scaleCash = '',
        scaleCashless = '',
        soundOn = true,
        isUsing = true;

  Map<String, dynamic> toMap() {
    return {
      decimalPositionCashKey: decimalCash,
      decimalPositionCashlessKey: decimalCashless,
      scaleFactorCashKey: scaleCash,
      scaleFactorCashlessKey: scaleCashless,
      soundOnKey: soundOn,
      isUsingKey: isUsing,
      priceListKey: priceList.map((element) => element.toMap()).toList(),
    };
  }

  Settings.fromMap(Map<String, dynamic> map)
      : decimalCash = map[decimalPositionCashKey],
        decimalCashless = map[decimalPositionCashlessKey],
        scaleCash = map[scaleFactorCashKey],
        scaleCashless = map[scaleFactorCashlessKey],
        soundOn = map[soundOnKey],
        isUsing = map[isUsingKey],
        priceList = _priceListFromMap(map[priceListKey]);

  static List<Price> _priceListFromMap(List mapList) {
    List<Price> result = [];
    for (var element in mapList) {
      result.add(Price.fromMap(element));
    }
    return result;
  }
}

enum ShowNotification {
  positive,
  negative,
  unknown,
}
