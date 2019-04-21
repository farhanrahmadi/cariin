import 'package:flutter/material.dart';
import 'package:cariin_rev/core/app_route.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) =>
          MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true), child: child),
      title: 'Cariin',
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
        fontFamily: 'Roboto'
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: AppRouter
    );
  }
}





