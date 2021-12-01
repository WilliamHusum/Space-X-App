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
        title: Text(widget.rocket.name ?? "No rocket"),
      ),
      body: ListView(
        children: [
          //Sidescroll af billeder
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                    height: 200,
                    width: 250,
                    child: Hero(
                      child: Image.network(widget.rocket.rocketImageUrl1,
                          scale: 2, height: 250, width: 350),
                      tag: widget.rocket.name ?? "No rocket",
                    )),
                SizedBox(
                  height: 200,
                  width: 250,
                  child: Hero(
                    child: Image.network(widget.rocket.rocketImageUrl2 ?? "",
                        scale: 2),
                    tag: widget.rocket.name! + "2",
                  ),
                ),
              ],
            ),
          ),
          Text(
            widget.rocket.name ?? "No rocket",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          const Divider(color: Colors.black),
          const Text("Description: ",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(
            widget.rocket.description,
            textAlign: TextAlign.center,
          ),
          const Divider(color: Colors.black),
          const Text("Technical details: ",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(
            "Weight: " + widget.rocket.mass + " kg.",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
          ),
          Text(
            "Price: \$" + widget.rocket.costPerLaunch,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
          ),
          Text(
            "Number of engines: ${widget.rocket.engines ?? "Info not available"}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
          ),
          Text(
            "Fuel amount: ${widget.rocket.fuelAmount ?? "Info not available"} tons",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
          ),
          const Divider(color: Colors.black),
        ],
      ),
    );
  }
}
