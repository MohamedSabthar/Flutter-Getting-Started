import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(Boss());

class Boss extends StatelessWidget {
  const Boss({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BossPage(),
    );
  }
}

class BossPage extends StatelessWidget {
  const BossPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(
          'BOSS',
          style: TextStyle(
              fontFamily: 'RacingSansOne',
              color: Colors.white70,
              letterSpacing: 1),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: BossAnswer(),
    );
  }
}

class BossAnswer extends StatefulWidget {
  BossAnswer({Key key}) : super(key: key);

  @override
  _BossAnswerState createState() => _BossAnswerState();
}

class _BossAnswerState extends State<BossAnswer> {
  List<String> answers = ['Yes', 'No', 'I have no Idea'];
  int answer = 0;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Text(
            answers[answer].toUpperCase(),
            style: TextStyle(
                fontSize: 30,
                color: Colors.white70,
                fontFamily: 'RacingSansOne',
                letterSpacing: 3),
          ),
        ),
      ),
      splashColor: Colors.transparent,
      onPressed: () {
        setState(() {
          answer = Random.secure().nextInt(3);
        });
      },
    );
  }
}
