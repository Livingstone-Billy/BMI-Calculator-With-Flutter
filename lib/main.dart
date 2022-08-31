import 'package:flutter/material.dart';
import 'dart:math';

void main() =>runApp(const BMIApp());

class BMIApp extends StatelessWidget{
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context){
    const appTitle = 'BMI Index Calculator';
    return const MaterialApp(
      title: appTitle,
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget{
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator>{

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  void dispose(){
    heightController.dispose();
    weightController.dispose();

    super.dispose();
  }

  double _getBMIIndex(String height, String weight){
    double heightInMetres = double.parse(height) / 100;

    double bmiIndex = double.parse(weight) / pow(heightInMetres, 2);

    double index = double.parse((bmiIndex).toStringAsFixed(1));

    return index;
  }

  String status = "BMI Index";

  @override
  Widget build(BuildContext context){

    var bmiTable = Container(
      margin: const EdgeInsets.only(top: 20),
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
                    children: const [
                      Text(
                        "UnderWeight",
                        style: TextStyle(
                          color: Colors.greenAccent
                        ),
                      ),
                      Text(
                        "NormalWeight",
                        style: TextStyle(
                            color: Colors.blueAccent
                        ),
                      ),
                      Text(
                        "OverWeight",
                        style: TextStyle(
                            color: Colors.redAccent
                        ),
                      ),
                      Text(
                        "Obese",
                        style: TextStyle(
                            color: Colors.red
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "18.5",
                        style: TextStyle(
                          color: Colors.greenAccent
                        ),
                      ),
                      Text(
                        "18.5 - 24.9",
                        style: TextStyle(
                            color: Colors.blueAccent
                        ),
                      ),
                      Text(
                        "25 - 29.9",
                        style: TextStyle(
                            color: Colors.redAccent
                        ),
                      ),
                      Text(
                        "30",
                        style: TextStyle(
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Index Calculator'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextFormField(
              controller: heightController,
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your height in cm'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child:  TextFormField(
              controller: weightController,
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your weight in kg'
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                actions: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'Your BMI index is ${_getBMIIndex(heightController.text,
                              weightController.text)}'
                      ),
                      bmiTable,
                      ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      )
                    ],
                  )
                ],
              );
            }
          );
        },
        tooltip: 'Compute BMI',
        child: const Text('BMI'),
      ),
    );
  }
}
