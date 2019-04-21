import 'package:cariin_rev/page/list_restaurant/items.dart';
import 'package:flutter/material.dart';
import './view_model/dummy.dart';


class ListRestaurants extends StatefulWidget {
  @override
  _ListRestaurantsState createState() => _ListRestaurantsState();
}

class _ListRestaurantsState extends State<ListRestaurants> {
  List<Map<String,dynamic>> dummy = dataDummy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset("assets/icon/back.png"),
        ),
        actions: <Widget>[
          new Container(
            height: 10.0,
              padding: new EdgeInsets.only(top: 0.0),
            width: 220.0,
              child: new TextField(
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: Colors.black
                  ),
                decoration: new InputDecoration(
                  prefixIcon: Icon(Icons.search),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[800]),
                    hintText: "Carriin ",
                    fillColor: Colors.white70),
              )
          ),
          SizedBox(width: 10.0,),
          new GestureDetector(
            onTap: () => print('tapped'),
            child: new Row(
              children: <Widget>[
                new Text('Citayam', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.0,),),
                new Image.asset("assets/icon/pointer.png", width: 40.0,)
              ],
            ),
          )
        ],
      ),
      body: Items(dataDummy),
      resizeToAvoidBottomPadding: false,
    );
  }
}