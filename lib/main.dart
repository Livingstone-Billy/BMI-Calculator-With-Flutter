import 'package:flutter/material.dart';
import 'bmi_calculate.dart';

void main() =>runApp(BMIApp());

class BMIApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: BMICalculator(),
    );
  }
}


class BMICalculator extends StatelessWidget{

  List bmiInput = ["0", "1"];
  
  @override
  Widget build(BuildContext context){
    final heightTextField = Container(
      margin: const EdgeInsets.only(top: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Enter your height in cm',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              // color: Colors.blue[400],
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (text){
              bmiInput[0] = text;
            },
          ),
        ],
      ),
    );

    final weightTextField = Container(
      margin: const EdgeInsets.only(top: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Enter your weight in kg',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              // color: Colors.blue[400],
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (text){
              bmiInput[1] = text;
            },
          ),
        ],
      ),
    );
    return MaterialApp(
      title: 'BMI Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
          backgroundColor: Colors.green[800],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 240,
              child: Column(
                children: [
                  heightTextField,
                  weightTextField,
                  Container(
                    margin: const EdgeInsets.only(top: 80),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[600],
                        minimumSize: const Size(200, 70),
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>BMITableInfo())
                        );
                      },
                      child: const Text(
                          'Compute BMI',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}

class BMITableInfo extends StatelessWidget{

  GenerateBMI calculator = GenerateBMI();
  final BMICalculator _calculator = BMICalculator();

  @override
  Widget build(BuildContext context){
    var decTexStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      fontSize: 18,
    );
    var bmiInfoSection = Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
           const Text(
            'Your BMI Score',
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w500,
              fontSize: 18
            ),
          ),
          SizedBox(
            width: 200,
            height: 70,
            child: Card(
              color: Colors.green,
              child: Center(
                child: Text(
                  '${calculator.calculateBMI()}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );

    var bmiTable = Container(
      margin: const EdgeInsets.only(top: 80),
      child: Card(
        child: InkWell(
          onTap: (){
            debugPrint("BMI Score Tapped");
          },
          child: SizedBox(
            height: 150,
            width: 350,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "UnderWeight",
                      style: decTexStyle,
                    ),
                    const Text(
                      "NormalWeight",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          color: Colors.blueAccent
                      ),
                    ),
                    const Text(
                      "OverWeight",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: Colors.red
                      ),
                    ),
                    const Text(
                      "Obese",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: Colors.red
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "18.5",
                      style: decTexStyle,
                    ),
                    const Text(
                      "18.5 - 24.9",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          color: Colors.blueAccent
                      ),
                    ),
                    const Text(
                      "25 - 29.9",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          color: Colors.red
                      ),
                    ),
                    const Text(
                      "30",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          color: Colors.red
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );

    var backButton = Container(
      margin: const EdgeInsets.only(top: 98),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          minimumSize: const Size(150, 60)
        ),
        onPressed: ()=> Navigator.pop(context),
        child: Text(
          'Back',
          style: decTexStyle,
        ),
      ),
    );

    return MaterialApp(
      title: 'BMI Result Page',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                bmiInfoSection,
                bmiTable,
                backButton
              ],
            ),
          ),
        ),
      ),
    );
  }
}
