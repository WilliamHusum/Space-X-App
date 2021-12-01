class Rocket {
  final String? name;
  final String rocketImageUrl1;
  final String? rocketImageUrl2;
  final String country;
  final String costPerLaunch;
  final String description;
  final String mass;
  final String? engines;
  final String? fuelAmount;
  final String id;
  

  Rocket({
    required this.name,
    required this.rocketImageUrl1,
    required this.rocketImageUrl2,
    required this.country,
    required this.costPerLaunch,
    required this.description,
    required this.mass,
    required this.engines,
    required this.fuelAmount,
    required this.id,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      name: json['name'],
      rocketImageUrl1: json['flickr_images'][0],
      rocketImageUrl2: json['flickr_images'][1],
      country: json['country'],
      costPerLaunch: json['cost_per_launch'].toString(),
      description: json['description'],
      mass: json['mass']['kg'].toString(),
      engines: json['first_stage']['engines'].toString(),
      fuelAmount: json['first_stage']['fuel_amount_tons'].toString(),
      id: json['id'],
    );
  }
}
