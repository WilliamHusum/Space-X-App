import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_app/rocket.dart';

import 'crew.dart';
import 'launch.dart';
import 'launch_controller.dart';

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
    final Future<String> launchImageURL = launch.fetchImageURL();
    String launchStatus;
    if (launch.status.toString() == "false") {
      launchStatus = "Failed";
    } else {
      launchStatus = "Succeeded";
    }
    return ListTile(
        leading: FutureBuilder(
          future: launchImageURL,
          builder: (context, AsyncSnapshot<String> snapshot) {
            // if (snapshot.hasData) {
            return Hero(
                tag: launch.name,
                child: Image(image: NetworkImage(launch.imageUrl)));
            // } else {
            //   return const Icon(Icons.image);
            // }
          },
        ),
        title: Text(launch.name),
        subtitle: Text(launchStatus + "\n " + launch.date),
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => LaunchDetail(launch: launch)));
        });
  }

//Crew
  crewRow(BuildContext context, Crew crew) {
    // final Future<String> launchImageURL = launch.fetchImageURL();
    return ListTile(
        leading: FutureBuilder(
          // future: crewImageURL,
          builder: (context, AsyncSnapshot<String> snapshot) {
            // if (snapshot.hasData) {
            return Hero(
                tag: crew.name,
                child: Image(image: NetworkImage(crew.crewImageUrl)));
            // } else {
            //   return const Icon(Icons.image);
            // }
          },
        ),
        title: Text(crew.name),
        subtitle: Text("Status: " + crew.status),
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => LaunchDetail(launch: crew)));
        });
  }

//Rockets
  rocketRow(BuildContext context, Rocket rocket) {
    // final Future<String> launchImageURL = launch.fetchImageURL();
    return ListTile(
        leading: FutureBuilder(
          // future: crewImageURL,
          builder: (context, AsyncSnapshot<String> snapshot) {
            // if (snapshot.hasData) {
            return Hero(
                tag: rocket.name,
                child: Image(image: NetworkImage(rocket.rocketImageUrl)));
            // } else {
            // return const Icon(Icons.image);
            // }
          },
        ),
        title: Text(rocket.name),
        subtitle: Text(rocket.country),
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => LaunchDetail(launch: crew)));
        });
  }
}
