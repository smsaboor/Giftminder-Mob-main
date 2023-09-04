class Event {
  String eventId;
  String events;
  int reminderDay;
  DateTime eventDate;
  List<String> interest;
  String person;
  String formatedDate;
  Event({
    required this.formatedDate,
    required this.person,
    required this.eventDate,
    required this.eventId,
    required this.events,
    required this.interest,
    required this.reminderDay}
    );
}


