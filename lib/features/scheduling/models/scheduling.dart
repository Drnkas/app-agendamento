class Scheduling {

  final String id;
  final DateTime startDate;
  final DateTime endDate;

  const Scheduling({
    required this.id,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }

  factory Scheduling.fromMap(Map<String, dynamic> map) {
    return Scheduling(
      id: map['id'] as String,
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
    );
  }
}