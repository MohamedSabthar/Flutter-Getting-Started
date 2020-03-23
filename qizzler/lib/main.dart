import 'package:flutter/material.dart';
import 'package:qizzler/model/quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(QuizzlerApp());

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quizzler(),
    );
  }
}

class Quizzler extends StatefulWidget {
  Quizzler({Key key}) : super(key: key);

  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> scoreKeeper = [];
  int correct = 0;
  QuizBrain _quizBrain = QuizBrain();

  processAnswer(bool answer) {
    if (_quizBrain.getAnswer() == answer) correct++;
    if (_quizBrain.isFinished()) {
      showAlert();
    } else
      setState(() {
        if (_quizBrain.getAnswer() == answer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        _quizBrain.nextQuestion();
      });
  }

  showAlert() {
    Alert(
      context: context,
      title: "Quizzler !",
      desc: "Your score is $correct out of 10.",
    ).show();
    setState(() {
      _quizBrain.resetQuestion();
      scoreKeeper.clear();
      correct = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      _quizBrain.getQuestion(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white70,
                        fontFamily: 'RacingSansOne',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                height: MediaQuery.of(context).size.height / 12,
                child: FlatButton(
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 25,
                        fontFamily: 'RacingSansOne',
                      ),
                    ),
                  ),
                  onPressed: () {
                    processAnswer(true);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                height: MediaQuery.of(context).size.height / 12,
                child: FlatButton(
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 25,
                        fontFamily: 'RacingSansOne',
                      ),
                    ),
                  ),
                  onPressed: () {
                    processAnswer(false);
                  },
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  child: Wrap(
                    children: scoreKeeper,
                  ))
            ],
          ),
        ));
  }
}
