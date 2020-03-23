import 'package:bmi_app/screens/main_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMIApp());

class BMIApp extends StatelessWidget {
  const BMIApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0F1327),
        scaffoldBackgroundColor: Color(0xff090B22),
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
