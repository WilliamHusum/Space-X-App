import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_app/rocket.dart';
import 'package:spacex_app/rocket_detail.dart';

import 'crew.dart';
import 'crew_detail.dart';
import 'launch.dart';
import 'launch_controller.dart';
import 'launch_detail.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (BuildContext context) => LaunchController(),
        child: const TabBarDemo()),
  );
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.flag), text: "Launches"),
                Tab(icon: Icon(Icons.person), text: "Crew"),
                Tab(icon: Icon(Icons.flight_takeoff), text: "Rockets"),
              ],
            ),
            title: const Text('Space X'),
          ),
          body: TabBarView(
            children: [
              //Launches
              Consumer<LaunchController>(
                  builder: (context, _launchController, widget) {
                return ListView.builder(
                    itemCount: _launchController.numberOfLaunches,
                    itemBuilder: (context, index) {
                      final Launch launch =
                          _launchController.getLaunchOf(index: index);
                      return launchRow(context, launch);
                    });
              }),
              //Crew
              Consumer<LaunchController>(
                  builder: (context, _launchController, widget) {
                return ListView.builder(
                    itemCount: _launchController.numberOfCrew,
                    itemBuilder: (context, index) {
                      final Crew crew =
                          _launchController.getCrewOf(index: index);
                      return crewRow(context, crew);
                    });
              }),
              //Rockets
              Consumer<LaunchController>(
                  builder: (context, _launchController, widget) {
                return ListView.builder(
                    itemCount: _launchController.numberOfRockets,
                    itemBuilder: (context, index) {
                      final Rocket rocket =
                          _launchController.getRocketOf(index: index);
                      return rocketRow(context, rocket);
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }

//Launch

  launchRow(BuildContext context, Launch launch) {
    String launchStatus;
    if (launch.status == false) {
      launchStatus = "Failed";
    } else if (launch.status == null) {
      launchStatus = "No data";
    } else {
      launchStatus = "Succeeded";
    }
    return ListTile(
        leading: Hero(
          tag: launch.name,
          child: Image(
            image: NetworkImage(launch.imageUrl ??
                "https://cdn1.iconfinder.com/data/icons/ios-11-glyphs/30/rocket-512.png"),
          ),
        ),
        title: Text(launch.name),
        subtitle: Text(launchStatus + "\n " + launch.date),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LaunchDetail(launch: launch)));
        });
  }

//Crew
  crewRow(BuildContext context, Crew crew) {
    return ListTile(
        leading: FutureBuilder(
          // future: crewImageURL,
          builder: (context, AsyncSnapshot<String> snapshot) {
            return Hero(
                tag: crew.name,
                child: Image(image: NetworkImage(crew.crewImageUrl)));
          },
        ),
        title: Text(crew.name),
        subtitle: Text("Status: " + crew.status + " \nAgency: " + crew.agency),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CrewDetail(crew: crew)));
        });
  }

//Rockets
  rocketRow(BuildContext context, Rocket rocket) {
    return ListTile(
        leading: Hero(
            tag: rocket.name ?? "No rocket",
            child: Image(image: NetworkImage(rocket.rocketImageUrl1))),
        title: Text(rocket.name ?? "No rocket"),
        subtitle: Text(rocket.country),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RocketDetail(rocket: rocket)));
        });
  }
}
