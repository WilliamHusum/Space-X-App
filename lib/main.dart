import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
                Tab(icon: Icon(MdiIcons.rocketLaunch), text: "Launches"),
                Tab(icon: Icon(MdiIcons.accountGroup), text: "Crew"),
                Tab(icon: Icon(MdiIcons.rocket), text: "Rockets"),
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
                      final Rocket? rocket = _launchController
                          .getRocketOfLaunch(launch.rocketID ?? "");
                      return Card(child: launchRow(context, launch, rocket!));
                      // return ;
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
                      final Launch? launch =
                          _launchController.getLaunchOfCrew(crew.launchID);
                      return Card(child: crewRow(context, crew, launch!));
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
                      return Card(child: rocketRow(context, rocket));
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }

//Launch
  launchRow(BuildContext context, Launch launch, Rocket rocket) {
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
        //DateFormat formaterer DateTime til det ønskede format
        subtitle: Text(launchStatus +
            "\n " +
            DateFormat('dd-MM-yyyy - kk:mm').format(launch.date)),
        trailing: const Icon(Icons.navigate_next),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      LaunchDetail(launch: launch, rocket: rocket)));
        });
  }

//Crew
  crewRow(BuildContext context, Crew crew, Launch launch) {
    return ListTile(
        leading: Hero(
          tag: crew.name,
          child: Image(image: NetworkImage(crew.crewImageUrl), width: 60),
        ),
        title: Text(crew.name),
        subtitle: Text("Status: " + crew.status + " \nAgency: " + crew.agency),
        trailing: const Icon(Icons.navigate_next),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CrewDetail(crew: crew, launch: launch)));
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
        trailing: const Icon(Icons.navigate_next),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RocketDetail(rocket: rocket)));
        });
  }
}
