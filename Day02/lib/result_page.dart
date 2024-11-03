import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final int age;
  final int weight;

  ResultPage({super.key, required this.bmi, required this.age, required this.weight});

  String getStatus() {
    if (bmi < 18.5) return "Underweight";
    else if (bmi < 24.9) return "Normal";
    else if (bmi < 29.9) return "Overweight";
    else return "Obesity";
  }

  String getMessage() {
    String status = getStatus();
    if (status == "Normal") return "You have a normal body weight.";
    return "Consider adjusting your weight for better health.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Result: ", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  Text(getStatus(), style: TextStyle(fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold)),
                  Text(bmi.toStringAsFixed(1), style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
                  Text(getMessage(), style: TextStyle(fontSize: 30, color: Colors.red.shade200, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Center(child: Text("Recalculate BMI")),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
