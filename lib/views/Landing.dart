import 'package:flutter/material.dart';
import 'package:productivity_tracker/Componets/NumWidget.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});
  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Neko Syndicate",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0)),
                const Text("Productivity Tracker",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
                FilledButton(
                    onPressed: () {_settingModalCompanyBottomSheet(context);},
                    child: const Text('Choose your Company')
                ),
                FilledButton.tonal(
                    onPressed: () {  },
                    child: const Text('Connect to Private Dedicated Server')
                )
              ]
          )
        )
    );
  }
}

void _settingModalCompanyBottomSheet(context){
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
        return Container(
          margin: const EdgeInsets.all(10.0),
          child: Wrap(
            children: <Widget>[
               ListTile(
                   shape: const RoundedRectangleBorder(
                       borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(10),
                           topRight: Radius.circular(10),
                           bottomRight: Radius.circular(10),
                           bottomLeft: Radius.circular(10))),
                  leading:  const Icon(Icons.add_circle),
                  title:  const Text('Neko Syndicate'),
                  onTap: () => {}
              ),
              ListTile(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  leading:  const Icon(Icons.phone_android),
                  title:  const Text('Neko Syndicate 2241 Debug'),
                  onTap: () => {}
              ),
            ],
          ),
        );
      }
  );
}
