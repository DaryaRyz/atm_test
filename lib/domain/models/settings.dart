import 'package:atm_test/domain/models/price_model.dart';

class Settings {
  static const decimalPositionCashKey = 'decimalPositionCash';
  static const decimalPositionCashlessKey = 'decimalPositionCashless';
  static const scaleFactorCashKey = 'scaleFactorCash';
  static const scaleFactorCashlessKey = 'scaleFactorCashless';
  static const soundOnKey = 'soundOn';
  static const isUsingKey = 'isUsing';
  static const priceListKey = 'priceList';

  final String decimalPositionCash;
  final String decimalPositionCashless;
  final String scaleFactorCash;
  final String scaleFactorCashless;
  final bool soundOn;
  final bool isUsing;
  final List<PriceModel> priceList;

  Settings({
    required this.decimalPositionCash,
    required this.decimalPositionCashless,
    required this.scaleFactorCash,
    required this.scaleFactorCashless,
    required this.soundOn,
    required this.isUsing,
    required this.priceList,
  });

  Map<String, dynamic> toMap() {
    return {
      decimalPositionCashKey: decimalPositionCash,
      decimalPositionCashlessKey: decimalPositionCashless,
      scaleFactorCashKey: scaleFactorCash,
      scaleFactorCashlessKey: scaleFactorCashless,
      soundOnKey: soundOn,
      isUsingKey: isUsing,
      priceListKey: priceList,
    };
  }

  Settings.fromMap(Map<String, dynamic> map)
      : decimalPositionCash = map[decimalPositionCashKey],
        decimalPositionCashless = map[decimalPositionCashlessKey],
        scaleFactorCash = map[scaleFactorCashKey],
        scaleFactorCashless = map[scaleFactorCashlessKey],
        soundOn = map[soundOnKey],
        isUsing = map[isUsingKey],
        priceList = map[priceListKey];
}
