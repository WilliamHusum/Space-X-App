import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              Consumer<LaunchController>(
                  builder: (context, _pokemonController, widget) {
                return ListView.builder(
                    itemCount: _pokemonController.numberOfLaunches,
                    itemBuilder: (context, index) {
                      final Launch launch =
                          _pokemonController.getLaunchOf(index: index);
                      return pokemonRow(context, launch);
                    });
              }),
              const Icon(Icons.directions_transit),
              const Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }

  pokemonRow(BuildContext context, Launch launch) {
    final Future<String> launchImageURL = launch.fetchImageURL();
    return ListTile(
        leading: FutureBuilder(
          future: launchImageURL,
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return Hero(
                  tag: launch.name,
                  child: Image(image: NetworkImage(snapshot.data as String)));
            } else {
              return const Icon(Icons.image);
            }
          },
        ),
        title: Text(launch.name),
        // trailing: pokemon.favorite
        //     ? const Icon(Icons.favorite)
        //     : const Icon(Icons.favorite_border),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LaunchDetail(launch: launch)));
        });
  }
}
