import 'package:bmi_app/models/bmi_brain.dart';

import '../components/cutom_bottom_button.dart';
import '../components/custom_rounded_icon_button.dart';
import '../theme.dart';
import '../components/custom_continer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusult_page.dart';

enum Gender { male, female }

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Gender selectedGender;
  int height = 100;
  int weight = 50;
  int age = 18;

  void changeColor(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: CustomContainer(
                    margin: EdgeInsets.fromLTRB(20, 20, 10, 20),
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.mars,
                          size: 70.0,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'MALE',
                          style: kSmallTexStyle,
                        ),
                      ],
                    ),
                    onTap: () {
                      changeColor(Gender.male);
                    },
                  ),
                ),
                Expanded(
                  child: CustomContainer(
                    margin: EdgeInsets.fromLTRB(10, 20, 20, 20),
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.venus,
                          size: 70.0,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'FEMALE',
                          style: kSmallTexStyle,
                        ),
                      ],
                    ),
                    onTap: () {
                      changeColor(Gender.female);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomContainer(
              color: kActiveCardColor,
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kSmallTexStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kBigTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kSmallTexStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: kPrimaryAccentColor,
                      overlayColor: kPrimaryAccentOverlayColor,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 220,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomContainer(
                    color: kActiveCardColor,
                    margin: EdgeInsets.fromLTRB(20, 20, 10, 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT (kg)',
                          style: kSmallTexStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomRoundedIconButton(
                              onTap: () {
                                setState(() {
                                  if (weight > 0) weight--;
                                });
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.minus,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CustomRoundedIconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.plus,
                                size: 30,
                              ),
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomContainer(
                    color: kActiveCardColor,
                    margin: EdgeInsets.fromLTRB(10, 20, 20, 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kSmallTexStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomRoundedIconButton(
                              onTap: () {
                                setState(() {
                                  if (age > 0) age--;
                                });
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.minus,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CustomRoundedIconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.plus,
                                size: 30,
                              ),
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomBottomButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: BMI(age: age, weight: weight, height: height),
                  ),
                ),
              );
            },
            child: Center(
              child: Text(
                'CALCULATE YOU\'R BMI',
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
