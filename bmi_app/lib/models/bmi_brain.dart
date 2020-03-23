import 'dart:math';

class BMI {
  double height;
  double weight;
  int age;

  double _bmi;

  BMI({int height, int weight, int age}) {
    _bmi = weight / pow(height / 100, 2);
  }

  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Under weight';
  }

  String getInterPretation() {
    if (_bmi >= 25)
      return 'You have a higher than normal body weight, Try to exercise more!';
    else if (_bmi > 18.5)
      return 'You have a mormal body weight. Good job!';
    else
      return 'You have a lower than normal body weight. You should eat a bit more!';
  }
}
