import 'dart:math';

import 'package:my_app/main.dart';

class GenerateBMI extends BMICalculator{
  //height should be in cm weight in kg

  double calculateBMI(){

    double heightInMetres = double.parse(bmiInput[0]) /100;

    double bmiIndex = double.parse(bmiInput[1]) / pow(heightInMetres, 2);

    return bmiIndex;
  }
}