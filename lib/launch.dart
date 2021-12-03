class Launch {
  final String name;
  final String? imageUrl;
  final bool? status;
  final String? details;
  final DateTime date;
  final String? rocketID;
  final String launchID;

  Launch({
    required this.name,
    required this.imageUrl,
    required this.status,
    required this.details,
    required this.date,
    required this.rocketID,
    required this.launchID,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      name: json['name'],
      imageUrl: json['links']['patch']['small'],
      status: json['success'],
      details: json['details'],
      date: DateTime.fromMillisecondsSinceEpoch(json['date_unix'] * 1000),
      rocketID: json['rocket'],
      launchID: json['id'],
    );
  }
}
