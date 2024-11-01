import 'package:flutter/material.dart';

class TempPage extends StatefulWidget {
  const TempPage({super.key});

  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  final TextEditingController tempController = TextEditingController();
  double result = 0.0;
  String conversionType = "Celsius to Fahrenheit";

  void calculate() {
    setState(() {
      double inputTemp = double.tryParse(tempController.text) ?? 0.0;

      if (conversionType == "Celsius to Fahrenheit") {
        result = (inputTemp * 9 / 5) + 32;
      } else {
        result = (inputTemp - 32) * 5 / 9;
      }
    });

    tempController.clear();
  }

  @override
  void dispose() {
    tempController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperature Converter"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Temperature Converter",
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
                      DropdownButton<String>(
                        value: conversionType,
                        items: <String>[
                          "Celsius to Fahrenheit",
                          "Fahrenheit to Celsius"
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            conversionType = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: tempController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Enter Temperature",
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: calculate,
                        child: const Text("Convert"),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        "Result: ${result.toStringAsFixed(2)} ${conversionType == "Celsius to Fahrenheit" ? "°F" : "°C"}",
                        style: const TextStyle(fontSize: 20),
                      ),
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
