import 'package:flutter/material.dart';
import './core/afterSplash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) =>
          MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true), child: child),
      title: 'Cariin',
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        fontFamily: 'Roboto'
      ),
      home: CariinApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CariinApp extends StatefulWidget {
  @override
  _CariinAppState createState() => _CariinAppState();
}


class _CariinAppState extends State<CariinApp> {


  @override
  Widget build(BuildContext context) {
    return new AfterSplash();
  }
}





