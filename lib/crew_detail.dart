import 'package:flutter/material.dart';

import 'crew.dart';

// ignore: must_be_immutable
class CrewDetail extends StatefulWidget {
  Crew crew;

  CrewDetail({Key? key, required this.crew}) : super(key: key);

  @override
  State<CrewDetail> createState() => _CrewDetailState();
}

class _CrewDetailState extends State<CrewDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.crew.name),
      ),
      body: ListView(
        children: [
          Hero(
            child: Image.network(widget.crew.crewImageUrl, scale: 2),
            tag: widget.crew.name,
          ),
          Text(
            widget.crew.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),

          // }
        ],
      ),
    );
  }
}
