import 'dart:async';

import 'package:atm_test/domain/models/atm.dart';
import 'package:atm_test/domain/models/event.dart';
import 'package:atm_test/domain/models/finance.dart';


abstract class AtmRepository {
  FutureOr<Atm> getAtm();
}

class MockAtmRepository implements AtmRepository {
  @override
  Future<Atm> getAtm() async {
    await Future.delayed(const Duration(seconds: 1));
    return Atm(
      id: '13856646',
      busType: 'MDB',
      atmNumber: '54467345',
      type: 'Снековый',
      modem: '3463457365',
      isWorking: false,
      signalLevel: 'Стабильный',
      location: 'ТЦ Мега, Химки',
      fullnessLevel: 75,
      eventList: [
        Event(
          title: 'Сейф переполнен',
          time: DateTime.fromMillisecondsSinceEpoch(1663052400000),
        ),
        Event(
          title: 'Сломался купюроприемник',
          extraInfo: '2341245',
          time: DateTime.fromMillisecondsSinceEpoch(1663042800000),
        ),
        Event(
          title: 'Закончилась наличка',
          extraInfo: 'Toshiba снековый',
          time: DateTime.fromMillisecondsSinceEpoch(1663042800000),
        ),
      ],
      financeList: [
        Finance(cash: 5700, type: CashType.cash,),
        Finance(cash: 1255, type: CashType.cashBack,),
        Finance(cash: 5700, type: CashType.cash,),
      ],
    );
  }
}
