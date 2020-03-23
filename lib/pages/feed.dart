import 'package:flutter/material.dart';


class FeedScreen extends StatefulWidget {
  @override
  TransformPager createState() {
    return new TransformPager();
  }
}

class TransformPager extends State<FeedScreen> {
  static const String id = 'feed_screen';

  var backgroundColor = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 83,
              duration: Duration(seconds: 1),
              decoration: BoxDecoration(
                  color: backgroundColor
              ),
              child: Center(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    color: Colors.teal,
                    padding: EdgeInsets.all(15.0),
                    child: Text('transform',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        if (backgroundColor == Colors.pink) {
                          backgroundColor = Colors.lightGreen;
                        } else {
                          backgroundColor = Colors.pink;
                        }
                      });
                    },
                  )
              )
          ),
        ],
      )),
    );
  }
}