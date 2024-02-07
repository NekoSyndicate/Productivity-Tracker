import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productivity_tracker/Componets/NumWidget.dart';

import '../ServerLayer/ServerConnector.dart';
import '../models/LoginViewModel.dart';

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
  String _tm_number = "";
  String _store_number = "";


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
                    onChanged: (text) {
                      _tm_number = text;
                    },
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
                    onChanged: (text) {
                      _store_number = text;
                    },
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
                        loginAction(_access_code, _tm_number, _store_number)
                            .then((value) => print(value));
                      },
                      child: const Text('Submit')),
                ])
        ));
  }
}
