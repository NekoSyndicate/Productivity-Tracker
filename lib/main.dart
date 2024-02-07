import 'package:flutter/material.dart';
import 'package:productivity_tracker/views/Login.dart';
import 'package:productivity_tracker/views/Tracker.dart';
import 'package:productivity_tracker/views/Landing.dart';
import 'package:catppuccin_flutter/catppuccin_flutter.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    ColorScheme CatTheme = ColorScheme(
        brightness: Brightness.dark,
        primary: catppuccin.mocha.green,
        onPrimary: catppuccin.mocha.crust,
        secondary: catppuccin.mocha.sapphire,
        onSecondary: catppuccin.mocha.crust,
        error: catppuccin.mocha.red,
        onError: catppuccin.mocha.crust,
        background: catppuccin.mocha.base,
        onBackground: catppuccin.mocha.crust,
        surface: catppuccin.mocha.surface0,
        onSurface: catppuccin.mocha.text
    );

    return MaterialApp(
      title: 'Neko Syndicate Productivity Tracker',
      theme: ThemeData(
        colorScheme: CatTheme,
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const Landing(),
        '/login': (context) => const Login(),
      },
    );
  }
}

