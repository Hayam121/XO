import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GameButton extends StatelessWidget {
   
  String text;
  int index;
  Function callback;
  GameButton(this.text,this.index,this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ElevatedButton(onPressed: (){
      callback(index);
    },
    child:Text(text,style: Theme.of(context).textTheme
    // ignore: deprecated_member_use
    .headline1?.copyWith(color: Colors.white),),));
  }
}
