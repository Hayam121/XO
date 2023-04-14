import 'package:flutter/material.dart';
import 'package:pro2/game.dart';

import 'playerData.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';
  String name1 = '';
  String name2 = '';

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(children: [
        TextField(
          decoration: const InputDecoration(hintText: 'Player 1'),
          onChanged: (value) {
            name1 = value;
          },
        ),
        TextField(
          decoration: const InputDecoration(hintText: 'Player 2 '),
          onChanged: (c) {
            name2 = c;
          },
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, GameScreeen.routeName,
                  arguments: PlayerData(name1, name2));
            },
            child: const Text("Let's Go"))
      ]),
    );
  }
}
