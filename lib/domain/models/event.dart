class Event {
  final String title;
  final String? extraInfo;
  final DateTime time;

  Event({
    required this.title,
    this.extraInfo,
    required this.time,
  });
}
