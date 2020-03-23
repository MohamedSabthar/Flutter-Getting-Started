import 'package:flutter/material.dart';

void main() => runApp(BusinessApp());

class BusinessApp extends StatelessWidget {
  const BusinessApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.teal,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/me.jpg'),
                  radius: 70,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Mohamed Sabthar',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                      fontFamily: 'RacingSansOne',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white54,
                      letterSpacing: 3),
                ),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: Divider(
                    color: Colors.grey.shade200,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      size: 30,
                      color: Colors.teal.shade400,
                    ),
                    title: Text(
                      '(+94)77-339-8389',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.mail,
                      size: 30,
                      color: Colors.teal.shade400,
                    ),
                    title: Text(
                      'sabtharugc0@gmail.com',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
