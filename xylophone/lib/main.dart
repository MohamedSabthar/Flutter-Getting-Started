import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.tealAccent,
        body: SafeArea(
          child: Xylophone(),
        ),
      ),
    );
  }
}

Widget buildKey({Color color, String wav}) {
  return Expanded(
    child: FlatButton(
      child: Container(),
      color: color,
      onPressed: () {
        final player = AudioCache();
        player.play(wav);
      },
    ),
  );
}

class Xylophone extends StatelessWidget {
  const Xylophone({Key key}) : super(key: key);
  static AudioCache player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildKey(color: Colors.red, wav: 'note1.wav'),
        buildKey(color: Colors.green, wav: 'note2.wav'),
        buildKey(color: Colors.blue, wav: 'note3.wav'),
        buildKey(color: Colors.yellow, wav: 'note4.wav'),
        buildKey(color: Colors.orange, wav: 'note5.wav'),
        buildKey(color: Colors.indigo, wav: 'note6.wav'),
        buildKey(color: Colors.pink, wav: 'note7.wav'),
      ],
    );
  }
}
