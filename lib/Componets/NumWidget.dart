import 'package:flutter/material.dart';

class NumWidget extends StatefulWidget {
  const NumWidget({super.key, required this.name});
  final String name;
  @override
  State<NumWidget> createState() => _NumWidgetState(name);
}


enum Operations { add, sub}

class _NumWidgetState extends State<NumWidget> {

  String name;
  _NumWidgetState(this.name);

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 6.0),
    child: Row(
        children: <Widget>[
          Text(
            '$name: $_counter',
            textAlign: TextAlign.left,
            overflow: TextOverflow.clip,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
          ),
          Spacer(),
          FilledButton(
            onPressed: () {_incrementCounter();},
            child: const Text('+',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
          ),
        Padding(
            padding: EdgeInsets.only(left: 5),
          child: FilledButton(
            onPressed: () {_decrementCounter();},
            child: const Text('-',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
          )
        ),
        ]
    )
    );
  }
}
