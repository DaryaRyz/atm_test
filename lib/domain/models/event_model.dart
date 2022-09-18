class EventModel {
  final String title;
  final String? extraInfo;
  final DateTime time;

  EventModel({
    required this.title,
    this.extraInfo,
    required this.time,
  });
}
