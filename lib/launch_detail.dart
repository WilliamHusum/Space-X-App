import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_app/launch.dart';
import 'package:spacex_app/launch_controller.dart';

// ignore: must_be_immutable
class LaunchDetail extends StatefulWidget {
  Launch launch;

  LaunchDetail({Key? key, required Launch this.launch}) : super(key: key);

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
          // Text(widget.pokemon.name),
          FutureBuilder(
              future: widget.launch.fetchImageURL(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  String imageURL = snapshot.data as String;
                  return Hero(
                      child: Image.network(imageURL), tag: widget.launch.name);
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          // InkWell(
          //   // child: Icon(widget.launch.favorite
          //       // ? Icons.favorite
          //       // : Icons.favorite_border),
          //   onTap: () {
          //     setState(() {
          //       // widget.launch.favorite = !(widget.launch.favorite);
          //       Provider.of<LaunchController>(context, listen: false)
          //           .launchHasChanged();
          //     });
          //   },
          // ),
          //FAB der gemmer det data vi har indtastet og går tilbage
          FloatingActionButton(onPressed: () {
            Navigator.pop(context, widget.launch);
          })
        ],
      ),
    );
  }
}
