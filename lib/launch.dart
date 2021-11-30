class Launch {
  final String name;
  final String? imageUrl;
  final bool? status;
  final String? details;
  final String date;

  Launch({
    required this.name,
    required this.imageUrl,
    required this.status,
    required this.details,
    required this.date,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    // var tempDetails = json['details'];
    // tempDetails ??= "No details";
    var tempStatus = json['status'];
    tempStatus ??= "No status";

    // print("name: " + json['name']);
    /*print("img url: " + json['links']['patch']['small']);
    print("succes: " + json['success'].toString());
    print("date: " + json['date_utc']);*/
    // print("-----------------------------------");

    return Launch(
      name: json['name'],
      imageUrl: json['links']['patch']['small'],
      status: json['success'],
      details: "tempDetails",
      date: json['date_utc'],
    );
  }
}
