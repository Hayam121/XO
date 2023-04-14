import 'package:flutter/material.dart';
import 'package:pro2/login.dart';

import 'game.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: LoginScreen.routeName,
    routes: {
      GameScreeen.routeName: (context) => const GameScreeen(),
      LoginScreen.routeName: (context) => LoginScreen()
    },
    theme: ThemeData(
        textTheme: const TextTheme(
            // ignore: deprecated_member_use
            headline1: TextStyle(
                fontSize: 40, color: Colors.blue, fontWeight: FontWeight.bold),
            // ignore: deprecated_member_use
            headline2: TextStyle(
                fontSize: 28,
                color: Colors.amber,
                fontWeight: FontWeight.bold))),
  ));
}
