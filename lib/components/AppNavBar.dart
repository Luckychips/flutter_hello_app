import 'package:flutter/material.dart';

class AppNavBar extends StatefulWidget with PreferredSizeWidget {
  final String title;

  AppNavBar({Key key, @required this.title}) : super(key: key);

  @override
  _AppBarState createState() => _AppBarState(title);

  @override
  Size get preferredSize => Size.fromHeight(44);
}

class _AppBarState extends State<AppNavBar>  {
  String title;

  _AppBarState(this.title);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: BackButton(
            color: Colors.lightGreen
        ),
        title: Text(title),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.directions_boat, color: Colors.lightBlueAccent),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.directions_bike, color: Colors.lightBlueAccent),
            onPressed: () {

            },
          ),
        ]
    );
  }
}