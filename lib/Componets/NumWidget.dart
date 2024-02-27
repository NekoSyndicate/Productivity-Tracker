import 'dart:async';

import 'package:flutter/material.dart';
import 'package:productivity_tracker/data_layer/ServerConnector.dart';

class NumWidget extends StatefulWidget {
  const NumWidget({super.key, required this.name, required this.id});
  final String name;
  final String id;
  @override
  State<NumWidget> createState() => _NumWidgetState(name, id);
}


enum Operations { add, sub}

class _NumWidgetState extends State<NumWidget> {

  String name;
  String id;
  _NumWidgetState(this.name, this.id);


  int _counter = 0;

  void _setCounter(int value) {
    setState(() {
      _counter = value;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    set(id, _counter);
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    set(id, _counter);
  }
  @override

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(const Duration(seconds: 2), (timer) async {
        _setCounter(await get(id) as int);
      });
    });

    return Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 6.0),
    child: Row(
        children: <Widget>[
          Text(
            '$name: $_counter',
            textAlign: TextAlign.left,
            overflow: TextOverflow.clip,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
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
