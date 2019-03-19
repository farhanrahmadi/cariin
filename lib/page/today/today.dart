import 'package:cariin_rev/page/today/Examples/example2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Today extends StatefulWidget {
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Example2(),
      ),
    );
  }

}