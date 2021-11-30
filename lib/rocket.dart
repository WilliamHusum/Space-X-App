class Rocket {
  final String name;
  final String rocketImageUrl;
  final String country;
  final String costPerLaunch;
  final String description;
  final String mass;

  Rocket({
    required this.name,
    required this.rocketImageUrl,
    required this.country,
    required this.costPerLaunch,
    required this.description,
    required this.mass,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      name: json['name'],
      rocketImageUrl: json['flickr_images'][0],
      country: json['country'],
      costPerLaunch: json['cost_per_launch'].toString(),
      description: json['description'],
      mass: json['mass']['kg'].toString(),
    );
  }
}
