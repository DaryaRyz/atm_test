
import 'package:atm_test/domain/models/event.dart';
import 'package:atm_test/domain/models/finance.dart';

class Atm {
  final String type;
  final String atmNumber;
  final bool isWorking;
  final String location;
  final String busType;
  final String signalLevel;
  final String id;
  final String modem;
  final double fullnessLevel;
  final List<Event> eventList;
  final List<Finance> financeList;

  Atm({
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
