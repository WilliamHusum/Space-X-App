import 'package:flutter/material.dart';
import 'package:spacex_app/rocket.dart';

// ignore: must_be_immutable
class RocketDetail extends StatefulWidget {
  Rocket rocket;

  RocketDetail({Key? key, required this.rocket}) : super(key: key);

  @override
  State<RocketDetail> createState() => _RocketDetailState();
}

class _RocketDetailState extends State<RocketDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.rocket.name),
      ),
      body: ListView(
        children: [
          Text(
            widget.rocket.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          Hero(
            child: Image.network(widget.rocket.rocketImageUrl, scale: 2),
            tag: widget.rocket.name,
          ),
          Text(
            "Description: " + widget.rocket.description,
          )
        ],
      ),
    );
  }
}
