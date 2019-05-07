import 'dart:async';
import 'package:cariin_rev/page/dasboard/sideDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:cariin_rev/core/bottombar.dart';
import 'package:cariin_rev/page/dasboard/top.dart';
import 'package:cariin_rev/page/dasboard/feature.dart';
import 'package:cariin_rev/page/list_restaurant/list_restaurant.dart';
import 'package:cariin_rev/page/today/today.dart';
import 'package:cariin_rev/state_management/user/user_bloc.dart';




class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int navBarIndex = 0;
  String barcode = "";
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    bloc.fetchUser();
    super.initState();
  }

  handleDrawer() {
    _key.currentState.openDrawer();
  }


  changeNavbarIndex(index){
    if(index == 1){
     scan();
    }
    setState(() {
      navBarIndex = index;
    });
  }

  goToRestaurantDetail(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListRestaurants()),
      );
  }

  goToToday(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Today()),
    );
  }



  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Cariin",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
      resizeToAvoidBottomPadding: false,
        drawer: new Drawer(
          child:SideDrawer()
        ),
      body: ListView(
          children: <Widget>[
            Top(),
            SizedBox(height: 30.0,),
            MainFeature(goToRestaurantDetail,goToToday),
          ],
        ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: MainBottomBar(navBarIndex,changeNavbarIndex),
      )
    );
  }
}
