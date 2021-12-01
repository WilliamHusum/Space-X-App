import 'package:flutter/material.dart';
import 'package:spacex_app/launch.dart';
import 'package:spacex_app/launch_controller.dart';
import 'package:spacex_app/rocket.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class LaunchDetail extends StatefulWidget {
  Launch launch;
  // LaunchController launchController;
  // Rocket rocket;

  LaunchDetail({Key? key, required this.launch}) : super(key: key);

  @override
  State<LaunchDetail> createState() => _LaunchDetailState();
}

class _LaunchDetailState extends State<LaunchDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.launch.name),
      ),
      body: ListView(
        children: [
          //Launch billede
          Hero(
            child: Image.network(
                widget.launch.imageUrl ??
                    "https://cdn1.iconfinder.com/data/icons/ios-11-glyphs/30/rocket-512.png",
                height: 200,
                scale: 2),
            tag: widget.launch.name,
          ),
          //Overskrift med Launch name
          Text(
            widget.launch.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          const Divider(color: Colors.black),
          Text(
            DateFormat('dd-MM-yyyy - kk:mm').format(widget.launch.date),
            // widget.launch.date.toLocal().toIso8601String(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
          const Divider(color: Colors.black),
          const Text("Launch details: ",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(
            widget.launch.details ?? "No details",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
          const Divider(color: Colors.black),

          // Text(widget.launch.rocket!.name ?? "No rocket"),

          // }
        ],
      ),
    );
  }
}
