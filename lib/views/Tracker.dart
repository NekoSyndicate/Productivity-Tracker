import 'package:flutter/material.dart';
import 'package:productivity_tracker/Componets/NumWidget.dart';

import '../data_layer/DataConnector.dart';
import '../data_layer/ServerConnector.dart';

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

  Future<Map<String, dynamic>> getSchema() async {
    DataConnector con = await DataConnector.create();
    String access_code = await con.getAccessCode();
    return schema(access_code);
  }

  List<Widget> createMetrics(Map<String, dynamic> schema) {
    List<Widget> metrics = [];
    for (int i = 0; i < schema!['schema'].length; i++) {
      dynamic metric_data = schema!['schema'][i];
      metrics.add(NumWidget(name: metric_data['name'].toString(), id:metric_data["id"].toString()));
    }
    return metrics;
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(future: getSchema(), builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: createMetrics(snapshot.data!),
          ),
        ),
      );

    });
  }
}
