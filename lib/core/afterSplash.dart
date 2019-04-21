import 'package:flutter/material.dart';
import 'package:cariin_rev/page/login/login.dart';
import 'package:cariin_rev/page/dasboard/dasboard.dart';
import 'package:cariin_rev/page/landing/landing.dart';


class AfterSplash extends StatelessWidget {

  Widget pageRender(){
      return Login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageRender()
    );
  }
}


