import 'package:spacex_app/launch_controller.dart';
import 'package:spacex_app/rocket.dart';

class Launch {
  final String name;
  final String? imageUrl;
  final bool? status;
  final String? details;
  final String date;
  final String? rocketID;
  final Rocket? rocket;

  Launch({
    required this.name,
    required this.imageUrl,
    required this.status,
    required this.details,
    required this.date,
    required this.rocketID,
    required this.rocket,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    LaunchController? launchController;
    var rcktID = json['rocket'];
    Rocket? rocket2 = launchController!.getRocketOfLaunch(rcktID);
    if (rocket2 == null) {
      throw Exception("No rocket");
    }
    return Launch(
      name: json['name'],
      imageUrl: json['links']['patch']['small'],
      status: json['success'],
      details: json['details'],
      date: json['date_utc'],
      rocketID: json['rocket'],
      rocket: rocket2,
    );
  }
}
