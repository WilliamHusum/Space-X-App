import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'crew.dart';
import 'launch.dart';

// ignore: must_be_immutable
class CrewDetail extends StatefulWidget {
  Crew crew;
  Launch launch;

  CrewDetail({Key? key, required this.crew, required this.launch})
      : super(key: key);

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
          Text("Status: ${widget.crew.status}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12)),
          Text("Agency: ${widget.crew.agency}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12)),
          const Divider(color: Colors.black),
          const Text("Launch information",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text("Launch: ${widget.launch.name}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12)),
          Text(
            DateFormat('dd-MM-yyyy - kk:mm').format(widget.launch.date),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
          // }
        ],
      ),
    );
  }
}
