import 'package:http/http.dart' as http;
import 'dart:convert';

class Crew {
  final String name;
  final String crewImageUrl;
  final String agency;
  final String status;
  // final DateTime date;

  Crew({
    required this.name,
    required this.crewImageUrl,
    required this.agency,
    required this.status,
    // required this.date,
  });

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      name: json['name'],
      crewImageUrl: json['image'],
      agency: json['agency'],
      status: json['status'],
      // date: json['date_utc'],
    );
  }

  Future<String> fetchImageURL() async {
    final response = await http.get(Uri.parse(crewImageUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return jsonData['sprites']['other']['official-artwork']['front_default'];
    } else {
      return '';
    }
  }
}
