import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_admin/SendData.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Admin',
      theme: ThemeData(
        radioTheme: RadioThemeData(
          fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
        ),
        brightness: Brightness.light,
        backgroundColor: Color.fromRGBO(37, 44, 74, 1.0),
        primaryColor: Color.fromRGBO(190, 56, 55, 1.0),
      ),
      home: SendData(),
    );
  }
}
