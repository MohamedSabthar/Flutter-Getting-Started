import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(DiceApp());

class DiceApp extends StatelessWidget {
  const DiceApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red.shade900,
        appBar: AppBar(
          centerTitle: true,
          elevation: 10,
          title: Text(
            'DICEE',
            style: TextStyle(
                fontFamily: 'RacingSansOne',
                color: Colors.white70,
                letterSpacing: 2),
          ),
          backgroundColor: Colors.red.shade900,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  DicePage({Key key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int playerOneDice = 1;
  int playerTwoDice = 1;

  changeDiceNumber(dice) {
    int nextNumber = Random.secure().nextInt(6) + 1;
    setState(() {
      dice == 1 ? playerOneDice = nextNumber : playerTwoDice = nextNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
              child: FlatButton(
                splashColor: Colors.transparent,
                child: Image.asset('images/dice$playerOneDice.png'),
                onPressed: () {
                  changeDiceNumber(1);
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
              child: FlatButton(
                splashColor: Colors.transparent,
                child: Image.asset('images/dice$playerTwoDice.png'),
                onPressed: () {
                  changeDiceNumber(2);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
