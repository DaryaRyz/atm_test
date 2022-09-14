import 'dart:async';

import 'package:atm_test/domain/models/atm_model.dart';
import 'package:atm_test/domain/models/event_model.dart';
import 'package:atm_test/domain/models/finance_model.dart';


abstract class AtmRepository {
  FutureOr<AtmModel> getAtm();
}

class MockAtmRepository implements AtmRepository {
  @override
  AtmModel getAtm() {
    return AtmModel(
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
        EventModel(
          title: 'Сейф переполнен',
          time: DateTime.fromMillisecondsSinceEpoch(1663052400000),
        ),
        EventModel(
          title: 'Сломался купюроприемник',
          extraInfo: '2341245',
          time: DateTime.fromMillisecondsSinceEpoch(1663042800000),
        ),
        EventModel(
          title: 'Закончилась наличка',
          extraInfo: 'Toshiba снековый',
          time: DateTime.fromMillisecondsSinceEpoch(1663042800000),
        ),
      ],
      financeList: [
        FinanceModel(cash: 5700, type: CashType.cash,),
        FinanceModel(cash: 1255, type: CashType.cashBack,),
        FinanceModel(cash: 5700, type: CashType.cash,),
      ],
    );
  }
}
