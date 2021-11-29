import 'package:flutter/material.dart';
import 'package:spacex_app/launch.dart';
import 'package:spacex_app/rocket.dart';
import 'crew.dart';
import 'network_service.dart';

class LaunchController extends ChangeNotifier {
  final List<Launch> _launches = [];
  final List<Crew> _crew = [];
  final List<Rocket> _rockets = [];
  final NetworkService _networkService = NetworkService();

  static const String jsonLaunchUrl = 'https://api.spacexdata.com/v4/launches';
  static const String jsonCrewUrl = 'https://api.spacexdata.com/v4/crew';
  static const String jsonRocketsUrl = 'https://api.spacexdata.com/v4/rockets';

//Henter dataen async, kan ikke gøres direkte i controlleren, da resten af koden vil køre videre før data er modtaget
  _fetchJSONLaunches() async {
    dynamic json = await _networkService.fetchJSONFrom(url: jsonLaunchUrl);
    for (var i = 0; i < 5; i++) {
      var launch = json![0];
      _launches.add(Launch.fromJson(launch));
    }
    notifyListeners();
  }

  _fetchJSONCrew() async {
    dynamic json = await _networkService.fetchJSONFrom(url: jsonCrewUrl);
    for (var i = 0; i < 5; i++) {
      var crew = json![0];
      _crew.add(Crew.fromJson(crew));
    }
    notifyListeners();
  }

  _fetchJSONRockets() async {
    dynamic json = await _networkService.fetchJSONFrom(url: jsonRocketsUrl);
    for (var i = 0; i < 5; i++) {
      var rocket = json![0];
      _rockets.add(Rocket.fromJson(rocket));
    }
    notifyListeners();
  }

  LaunchController() {
    _fetchJSONLaunches();
    _fetchJSONCrew();
    _fetchJSONRockets();
  }

//Launches
  launchHasChanged() {
    notifyListeners();
  }

  int get numberOfLaunches {
    return _launches.length;
  }

  Launch getLaunchOf({required int index}) {
    return _launches[index];
  }

  List<Launch> get launches {
    return _launches;
  }

  //Crew

  crewHasChanged() {
    notifyListeners();
  }

  int get numberOfCrew {
    return _crew.length;
  }

  Crew getCrewOf({required int index}) {
    return _crew[index];
  }

  List<Crew> get crews {
    return _crew;
  }

  //rockets
  rocketsHasChanged() {
    notifyListeners();
  }

  int get numberOfRockets {
    return _rockets.length;
  }

  Rocket getRocketOf({required int index}) {
    return _rockets[index];
  }

  List<Rocket> get rockets {
    return _rockets;
  }
}
