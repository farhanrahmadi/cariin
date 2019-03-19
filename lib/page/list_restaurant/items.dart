import 'package:flutter/material.dart';
import 'package:cariin_rev/page/list_restaurant/item.dart';
import 'package:cariin_rev/page/restaurant_detail/restaurant_detail.dart';

class Items extends StatelessWidget {
  List<Map<String, dynamic>> data;

  Items(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,top: 5.0,right: 10.0),
      child: new ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: Colors.transparent,
              ),
          itemCount: data.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RestaurantDetail()),
                ), child: new Item(data[index]));
          }),
    );
  }
}
