class Tasbeeh {
  String name;
  int currentCount;
  int targetCount;
  DateTime startDate;

  Tasbeeh({
    required this.name,
    this.currentCount = 0,
    required this.targetCount,
    required this.startDate,
  });
}
