import 'package:flutter/material.dart';
import 'package:pro2/gamebutton.dart';
import 'package:pro2/playerData.dart';

// ignore: must_be_immutable
class GameScreeen extends StatefulWidget {
  static const String routeName = 'game';

  const GameScreeen({super.key});

  @override
  State<GameScreeen> createState() => _GameScreeenState();
}

class _GameScreeenState extends State<GameScreeen> {
  List<String> board = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  int player1SCore = 0;

  int player2SCore = 0;

  @override
  Widget build(BuildContext context) {
    PlayerData args = ModalRoute.of(context)?.settings.arguments as PlayerData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic_Tok'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      // ignore: unnecessary_string_interpolations
                      '${args.name1}',
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      '$player1SCore',
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      // ignore: unnecessary_string_interpolations
                      '${args.name2}',
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      '$player2SCore',
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(board[0], 0, onBtclick),
                GameButton(board[1], 1, onBtclick),
                GameButton(board[2], 2, onBtclick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(board[3], 3, onBtclick),
                GameButton(board[4], 4, onBtclick),
                GameButton(board[5], 5, onBtclick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(board[6], 6, onBtclick),
                GameButton(board[7], 7, onBtclick),
                GameButton(board[8], 8, onBtclick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  bool checkwinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == symbol &&
          board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (board[i] == symbol &&
          board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        return true;
      }
    }
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }
    return false;
  }

  void initBoard() {
    board = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
  }

  void onBtclick(index) {
    if (board[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      board[index] = 'X';
      var win = checkwinner('X');

      if (win) {
        player1SCore += 10;
        initBoard();
        counter == 0;
      }
      counter++;
    } else {
      board[index] = 'O';
      var win = checkwinner('O');
      if (win) {
        player2SCore += 10;
        initBoard();
        counter == 0;
      }
      counter++;
    }
    if (counter == 9) {
      initBoard();
    }
    setState(() {

    });
  }
}
  

