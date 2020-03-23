import 'package:flutter/material.dart';

class DetailMeScreen extends StatelessWidget {
  static const String id = 'detail_me_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("DETAIL ME"),
            Container(
              child: RaisedButton(
                color: Colors.amber,
                child: Text('go to back',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: () {
                  Navigator.pop(context);
                }
              )
            )
          ],
        )
      )
    );
  }
}
