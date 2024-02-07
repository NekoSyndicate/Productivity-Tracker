import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productivity_tracker/Componets/NumWidget.dart';

import '../models/ServerConnector.dart';

class Login extends StatefulWidget {
  Login({super.key}) {
    //Take in ServerID
    //Verify that can connect to server

  }
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _access_code = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Hello World"),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Team Member Number',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Store Number',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Access Code',
                    ),
                    onChanged: (text) {
                      _access_code = text;
                    },
                  ),
                  FilledButton(
                      onPressed: () {
                        validAccessCode(_access_code).then((value) => print(value));
                      },
                      child: const Text('Submit')),
                ])
        ));
  }
}
