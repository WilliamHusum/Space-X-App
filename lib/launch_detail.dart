import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:spacex_app/launch.dart';
import 'package:spacex_app/rocket.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class LaunchDetail extends StatefulWidget {
  Launch launch;
  Rocket rocket;

  LaunchDetail({Key? key, required this.launch, required this.rocket})
      : super(key: key);

  @override
  State<LaunchDetail> createState() => _LaunchDetailState();
}

class _LaunchDetailState extends State<LaunchDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Launch details"),
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
          Text(
            widget.launch.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          Text(
            DateFormat('dd-MM-yyyy - kk:mm').format(widget.launch.date),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
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

          Container(
              child:
                  const Icon(MdiIcons.rocket, size: 50, color: Colors.blueGrey),
              alignment: Alignment.center),

          const Text("Rocket details: ",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(
            "Name: ${widget.rocket.name ?? "No rocket"}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            "Country: ${widget.rocket.country}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            "Weight: " + widget.rocket.mass + " kg.",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            "Price: \$" + widget.rocket.costPerLaunch,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            "Number of engines: ${widget.rocket.engines ?? "Info not available"}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            "Fuel amount: ${widget.rocket.fuelAmount ?? "Info not available"} tons",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),

          const Divider(color: Colors.black),

          const Text("Rocket images: ",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Hero(
            child: Image.network(widget.rocket.rocketImageUrl1,
                height: 200, scale: 2),
            tag: widget.rocket.name ?? "No rocket",
          ),
          Hero(
            child: Image.network(
                widget.rocket.rocketImageUrl2 ??
                    "https://cdn1.iconfinder.com/data/icons/ios-11-glyphs/30/rocket-512.png",
                height: 200,
                scale: 2),
            tag: widget.rocket.rocketImageUrl2 ?? "No rocket",
          ),
        ],
      ),
    );
  }
}
