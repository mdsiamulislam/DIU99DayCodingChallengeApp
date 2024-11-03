import 'package:bmiapp/result_page.dart';
import 'package:flutter/material.dart';

enum SetClick {
  increased,
  decreased,
  none
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF090D22),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF090D22),
          foregroundColor: Colors.white,
        ),
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int height = 120, weight = 70, age = 25;

  void weightChange(SetClick weightChange, SetClick ageChange) {
    setState(() {
      if (weightChange == SetClick.increased && weight < 200) {
        weight++;
      } else if (weightChange == SetClick.decreased && weight > 0) {
        weight--;
      } else if (ageChange == SetClick.increased && age < 120) {
        age++;
      } else if (ageChange == SetClick.decreased && age > 0) {
        age--;
      }
    });
  }

  double calculateBMI() {
    return weight / ((height / 100) * (height / 100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GenderCard(icon: Icons.male, label: "Male"),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: GenderCard(icon: Icons.female, label: "Female"),
                ),
              ],
            ),
            SizedBox(height: 10),
            HeightCard(height: height, onChanged: (newHeight) {
              setState(() {
                height = newHeight;
              });
            }),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: InputCard(
                    title: "Weight",
                    value: weight,
                    onIncrease: () => weightChange(SetClick.increased, SetClick.none),
                    onDecrease: () => weightChange(SetClick.decreased, SetClick.none),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InputCard(
                    title: "Age",
                    value: age,
                    onIncrease: () => weightChange(SetClick.none, SetClick.increased),
                    onDecrease: () => weightChange(SetClick.none, SetClick.decreased),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmi: calculateBMI(),
                      age: age,
                      weight: weight,
                    ),
                  ),
                );
              },
              child: Container(
                child: Center(child: Text("Calculate Your BMI")),
                padding: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const GenderCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(icon, size: 80),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class HeightCard extends StatelessWidget {
  final int height;
  final ValueChanged<int> onChanged;

  const HeightCard({required this.height, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("HEIGHT", style: TextStyle(fontSize: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text("$height", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              Text("cm"),
            ],
          ),
          Slider(
            value: height.toDouble(),
            onChanged: (double newHeight) {
              onChanged(newHeight.floor());
            },
            max: 220.0,
            min: 100.0,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class InputCard extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const InputCard({required this.title, required this.value, required this.onIncrease, required this.onDecrease});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(title),
          Text("$value", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: onIncrease,
                child: CircleAvatar(
                  child: Icon(Icons.add),
                  backgroundColor: Colors.red.shade700,
                ),
              ),
              GestureDetector(
                onTap: onDecrease,
                child: CircleAvatar(
                  child: Icon(Icons.remove),
                  backgroundColor: Colors.red.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
