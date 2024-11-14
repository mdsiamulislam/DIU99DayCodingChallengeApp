import 'package:day13/screen/chat_page.dart';
import 'package:day13/screen/login_page.dart';
import 'package:day13/screen/reg_page.dart';
import 'package:day13/screen/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (Firebase.apps.isNotEmpty) {
    print('Firebase is connected!');
  } else {
    print('Firebase is not connected.');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: WelcomePage.id ,
      routes: {
        WelcomePage.id : (context) => const WelcomePage(),
        LoginPage.id : (context) => const LoginPage(),
        RegPage.id : (context) => const RegPage(),
        ChatPage.id : (context) => const ChatPage(),
      },
    );
  }
}
