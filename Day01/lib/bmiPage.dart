import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final TextEditingController editingController1 = TextEditingController();
  final TextEditingController editingController2 = TextEditingController();

  double bmi = 0.0;
  String status = "Not calculated yet";

  void calculate() {
    setState(() {
      double height = double.tryParse(editingController1.text) ?? 0.0;
      double weight = double.tryParse(editingController2.text) ?? 0.0;

      if (height > 0 && weight > 0) {
        height = height / 100; // Convert height from cm to meters
        bmi = weight / (height * height);

        if (bmi < 18.5) {
          status = "Underweight";
        } else if (bmi >= 18.5 && bmi < 24.9) {
          status = "Normal weight";
        } else if (bmi >= 25 && bmi < 30) {
          status = "Overweight";
        } else {
          status = "Obesity";
        }
      } else {
        status = "Please enter valid values";
      }
    });

    editingController1.clear();
    editingController2.clear();
  }

  @override
  void dispose() {
    editingController1.dispose();
    editingController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "BMI Calculator",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Height (cm):"),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              controller: editingController1,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "Enter Height",
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Weight (kg):"),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              controller: editingController2,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "Enter Weight",
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: calculate,
                        child: const Text("Submit"),
                      ),
                      const SizedBox(height: 32),
                      Text("BMI: ${bmi.toStringAsFixed(2)}"),
                      Text("Status: $status"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
