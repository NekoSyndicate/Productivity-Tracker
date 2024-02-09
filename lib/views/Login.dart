import 'dart:async';

import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:productivity_tracker/Componets/NumWidget.dart';
import 'package:productivity_tracker/views/Tracker.dart';

import '../data_layer/ServerConnector.dart';
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("NekoSyndicate 2241 Beta Login"),
        ),
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
                  SizedBox(height: 10),
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
                  SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Access Code',
                    ),
                    onChanged: (text) {
                      _access_code = text;
                    },
                  ),
                  SizedBox(height: 10),
                  FilledButton(
                      onPressed: () async {
                        bool valid = await loginAction(_access_code, _tm_number, _store_number);
                        if (valid) {
                          await storeInfo(_access_code, _tm_number, _store_number, "neko_beta").then((value) =>
                              Navigator.push(context,
                                  PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 250),
                                    child: const Tracker(title: 'Neko Syn 2241 Beta',),
                                  )
                              )
                          );
                        }
                      },
                      child: const Text('Submit')),
                ])
        ));
  }
}
