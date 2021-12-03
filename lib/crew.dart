import 'package:http/http.dart' as http;
import 'dart:convert';

class Crew {
  final String name;
  final String crewImageUrl;
  final String agency;
  final String status;
  final String launchID;

  Crew({
    required this.name,
    required this.crewImageUrl,
    required this.agency,
    required this.status,
    required this.launchID,
  });

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      name: json['name'],
      crewImageUrl: json['image'],
      agency: json['agency'],
      status: json['status'],
      launchID: json['launches'][0],
    );
  }
}
