import 'package:flutter/material.dart';
import 'package:flutter_hello_app/pages/main_navigation_tabs.dart';

class StartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(53, 98, 255, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Alber",
              style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.white)
            ),
            RaisedButton(
              color: Colors.teal,
              child: Text('Go Ahead', style: TextStyle(fontSize: 24, color: Colors.green)),
              onPressed: () {
                Route route = PageRouteBuilder(pageBuilder: (context, animation1, animation2) => MainNavigationTabs());
                Navigator.pushReplacement(context, route);
              },
            )
          ]
        )
      )
    );
  }
}