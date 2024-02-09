import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:productivity_tracker/Componets/NumWidget.dart';
import 'package:productivity_tracker/data_layer/DataConnector.dart';

import '../models/LandingViewModel.dart';
import '../models/LoginViewModel.dart';
import 'Login.dart';
import 'Tracker.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {



  @override
  Widget build(BuildContext context) {
    isAuthed().then((value) async => {
        if (value) {
              Navigator.push(context,
                PageTransition(
                  type: PageTransitionType.bottomToTop,
                  duration: const Duration(milliseconds: 250),
                  child: const Tracker(title: 'Neko Syn 2241 Beta',),
                )
              )
        } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
            content: const Text('Unable to access server (Check your network or Contact your Administator)'),
            showCloseIcon: true,
            duration: const Duration(days: 2),
            backgroundColor: Theme.of(context).colorScheme.error,
          )
        )
        }
      }
    );

    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(flex: 5),
          Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.onBackground,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              margin:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: const Wrap(children: <Widget>[
                Image(image: AssetImage('assets/logo.png'))
              ])),
          const Text("Neko Syndicate",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0)),
          const Text(
            "Productivity Tracker",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
          Spacer(flex: 5),
          FilledButton(
              onPressed: () {
                _settingModalCompanyBottomSheet(context);
              },
              child: const Text('Choose your Company')),
                  Spacer(flex: 1),
          FilledButton.tonal(
              onPressed: () {},
              child: const Text('Connect to Private Dedicated Server')),
                  Spacer(flex: 10),
                ])
        ));
  }
}

void _settingModalCompanyBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          margin: const EdgeInsets.all(10.0),
          child: Wrap(
            children: <Widget>[
              ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  leading: const Icon(Icons.add_circle),
                  title: const Text('Neko Syndicate'),
                  onTap: () => {}),
              ListTile(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  leading: const Icon(Icons.phone_android),
                  title: const Text('Neko Syndicate 2241 Debug'),
                  onTap: () => {
                    Navigator.pop(context),
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.bottomToTop,
                        duration: const Duration(milliseconds: 250),
                        child: Login(),
                      ))
                  }),
            ],
          ),
        );
      });
}
