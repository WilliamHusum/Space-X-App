import 'package:flutter/material.dart';
import 'package:spacex_app/launch.dart';

// ignore: must_be_immutable
class LaunchDetail extends StatefulWidget {
  Launch launch;

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
          // FutureBuilder(builder: (context, snapshot) {
          Hero(
            child: Image.network(
                widget.launch.imageUrl ??
                    "https://cdn1.iconfinder.com/data/icons/ios-11-glyphs/30/rocket-512.png",
                scale: 2),
            tag: widget.launch.name,
          ),
          Text(
            widget.launch.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          Text(
            widget.launch.date,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10),
          ),
          Text(
            widget.launch.details ?? "No details",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10),
          ),

          // }
        ],
      ),
    );
  }
}
