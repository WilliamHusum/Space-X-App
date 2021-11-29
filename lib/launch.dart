import 'package:http/http.dart' as http;
import 'dart:convert';

class Launch {
  final String name;
  final String imageUrl;
  final bool status;
  final String details;
  final String date;

  Launch({
    required this.name,
    required this.imageUrl,
    required this.status,
    required this.details,
    required this.date,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      name: json['name'],
      imageUrl: json['links']['patch']['small'],
      status: json['success'],
      details: json['details'],
      date: json['date_utc'].toString(),
    );
  }

  Future<String> fetchImageURL() async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return jsonData['sprites']['other']['official-artwork']['front_default'];
    } else {
      return '';
    }
  }
}
