import 'package:flutter/material.dart';
import 'package:spacex_app/launch.dart';
import 'network_service.dart';

class LaunchController extends ChangeNotifier {
  final List<Launch> _launches = [];
  final NetworkService _networkService = NetworkService();

  static const String JSON_launch_url =
      'https://api.spacexdata.com/v4/launches';

//Henter dataen async, kan ikke gøres direkte i controlleren, da resten af koden vil køre videre før data er modtaget
  _fetchJSON() async {
    dynamic json = await _networkService.fetchJSONFrom(url: JSON_launch_url);
    for (var i = 0; i < 5; i++) {
      var launch = json![0];
      _launches.add(Launch.fromJson(launch));
    }
    notifyListeners();
  }

  LaunchController() {
    _fetchJSON();
  }

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
}
