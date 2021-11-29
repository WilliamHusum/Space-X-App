import 'package:http/http.dart' as http;
import 'dart:convert';

class Rocket {
  final String name;
  final String rocketImageUrl;
  final String country;

  Rocket({
    required this.name,
    required this.rocketImageUrl,
    required this.country,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      name: json['name'],
      rocketImageUrl: json['flickr_images'][0],
      country: json['country'],
    );
  }

  Future<String> fetchImageURL() async {
    final response = await http.get(Uri.parse(rocketImageUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return jsonData['sprites']['other']['official-artwork']['front_default'];
    } else {
      return '';
    }
  }
}
