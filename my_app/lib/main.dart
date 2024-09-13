import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BMICalculatorPage(),
    );
  }
}

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  double? bmi;
  String? bmiResult;
  String? bmiDescription;

  void calculateBMI() {
    double height = double.parse(heightController.text) / 100;
    double weight = double.parse(weightController.text);
    double calculatedBMI = weight / pow(height, 2);
    
    setState(() {
      bmi = calculatedBMI;
      bmiResult = bmi!.toStringAsFixed(2);

      if (bmi! < 18.5) {
        bmiDescription = 'Underweight';
      } else if (bmi! >= 18.5 && bmi! < 24.9) {
        bmiDescription = 'Normal weight';
      } else if (bmi! >= 25 && bmi! < 29.9) {
        bmiDescription = 'Overweight';
      } else {
        bmiDescription = 'Obesity';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height in cm',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight in kg',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20.0),
            if (bmi != null) ...[
              Text(
                'Your BMI is $bmiResult',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              Text(
                '$bmiDescription',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
