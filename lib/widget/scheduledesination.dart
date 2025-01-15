class Scheduledesination {
  final String destinationId;
  final String image;
  final String destinationName;
  final String location;
  final String date;

  Scheduledesination(
      {required this.destinationId,
      required this.image,
      required this.destinationName,
      required this.date,
      required this.location});

  List<Scheduledesination> scheduleDestination = [
    Scheduledesination(
        image: '',
        destinationName: '',
        date: '',
        location: '',
        destinationId: '')
  ];
}
