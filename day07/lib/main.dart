import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:day06/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String defaultUser = "admin";
  int defaultPin = 1234;

  String sharedUser = "";
  int sharedPin = 0;

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  Future<void> setShared(String user, int pin) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString('user', user);
    await preference.setInt('pin', pin);
  }

  Future<void> getShared() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      sharedUser = pref.getString('user')!;
      sharedPin = pref.getInt ('pin')!;
    });
  }

  @override
  void initState() {
    super.initState();
    getShared().then((_) {
      if (sharedUser == defaultUser && sharedPin == defaultPin) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController1,
              decoration: InputDecoration(labelText: 'Enter username'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: textEditingController2,
              decoration: InputDecoration(labelText: 'Enter PIN'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String inputUser = textEditingController1.text;
                int inputPin = int.tryParse(textEditingController2.text) ?? 0;

                setShared(inputUser, inputPin);

                if (inputUser == defaultUser && inputPin == defaultPin) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomePage()),
                  );
                } else {
                  print("Invalid username or PIN");
                }
              },
              child: Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
