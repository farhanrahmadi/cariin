import 'package:flutter/material.dart';
import 'package:cariin_rev/page/restaurant_detail/restaurant_detail.dart';
import 'package:cariin_rev/page/list_restaurant/list_restaurant.dart';
import 'package:cariin_rev/page/login/login.dart';
import 'package:cariin_rev/page/dasboard/dasboard.dart';
import 'package:cariin_rev/page/landing/landing.dart';


class AfterSplash extends StatelessWidget {

  Widget pageRender(){
      return Landing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageRender()
    );
  }
}


