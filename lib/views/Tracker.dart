import 'package:flutter/material.dart';
import 'package:productivity_tracker/Componets/NumWidget.dart';

class Tracker extends StatefulWidget {
  const Tracker({super.key, required this.title});
  final String title;
  @override
  State<Tracker> createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            NumWidget(name: "Example 1"),
            NumWidget(name: "Example 2"),
            NumWidget(name: "Example 3"),
            NumWidget(name: "Example 4"),
            NumWidget(name: "Example 5"),
            NumWidget(name: "Example 6"),
            NumWidget(name: "Example 7"),
            NumWidget(name: "Example 8"),
          ],
        ),
      ),
    );
  }
}
