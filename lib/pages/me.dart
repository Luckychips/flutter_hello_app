import 'package:flutter/material.dart';
import './detail/me.dart';

class MeScreen extends StatelessWidget {
  static const String id = 'me_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("me"),
            Container(
              child: RaisedButton(
                color: Colors.lightBlue,
                child: Text('move to detail',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailMeScreen())
                  );
                }
              )
            )
          ],
        )
      )
    );
  }
}
