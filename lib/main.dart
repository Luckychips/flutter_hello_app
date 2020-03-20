import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hello_app/pages/start.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.black,
            primaryIconTheme: IconThemeData(color: Colors.black),
            primaryTextTheme: TextTheme(
                title: TextStyle(color: Colors.white, fontFamily: "Aveny")),
            textTheme: TextTheme(title: TextStyle(color: Colors.black))),
        home: StartScreen());
  }
}
