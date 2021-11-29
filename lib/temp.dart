import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_app/launch.dart';
import 'package:spacex_app/launch_controller.dart';

import 'launch_detail.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (BuildContext context) => LaunchController(),
        child: const MyApp()),
  );
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    Consumer<LaunchController>(builder: (context, _launchController, widget) {
      return ListView.builder(
          itemCount: _launchController.numberOfLaunches,
          itemBuilder: (context, index) {
            final Launch launch = _launchController.getLaunchOf(index: index);
            return launchRow(context, launch);
          });
    }),
    const Text(
      'Crew',
      style: optionStyle,
    ),
    const Text(
      'Rockets',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceX'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Launches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Crew',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight_takeoff),
            label: 'Rockets',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  // static launchRow(BuildContext context, Launch launch) {}

  static launchRow(BuildContext context, Launch launch) {
    // String nameCapitalized = launch.name.capitalize();
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
        // trailing: launch.favorite
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
