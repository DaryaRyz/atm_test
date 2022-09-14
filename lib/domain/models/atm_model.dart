
import 'package:atm_test/domain/models/event_model.dart';
import 'package:atm_test/domain/models/finance_model.dart';

class AtmModel {
  final String type;
  final String atmNumber;
  final bool isWorking;
  final String location;
  final String busType;
  final String signalLevel;
  final String id;
  final String modem;
  final double fullnessLevel;
  final List<EventModel> eventList;
  final List<FinanceModel> financeList;

  AtmModel({
    required this.type,
    required this.atmNumber,
    required this.isWorking,
    required this.location,
    required this.busType,
    required this.signalLevel,
    required this.id,
    required this.modem,
    required this.fullnessLevel,
    required this.eventList,
    required this.financeList,
  });
}
