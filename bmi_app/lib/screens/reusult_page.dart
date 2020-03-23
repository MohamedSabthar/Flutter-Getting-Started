import 'package:bmi_app/models/bmi_brain.dart';

import '../components/custom_continer.dart';
import '../components/cutom_bottom_button.dart';
import '../theme.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({this.bmi});
  final BMI bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.bottomLeft,
                width: double.infinity,
                child: Text(
                  'Your Result',
                  style: kBigTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: CustomContainer(
              margin: EdgeInsets.all(20),
              color: kActiveCardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    bmi.getResult().toUpperCase(),
                    style: kSmallTexStyle.copyWith(
                        color: Colors.green.shade300,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2),
                  ),
                  Text(
                    bmi.getBMI().toUpperCase(),
                    style: kBigTextStyle.copyWith(fontSize: 100.0),
                  ),
                  Text(
                    bmi.getInterPretation(),
                    style: kSmallTexStyle.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          CustomBottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Text(
                'RE-CALCULATE YOU\'R BMI',
                textAlign: TextAlign.center,
                style: kSmallTexStyle.apply(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
