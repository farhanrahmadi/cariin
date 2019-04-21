import 'package:cariin_rev/page/restaurant_detail/info.dart';
import 'package:cariin_rev/page/restaurant_detail/list_menu.dart';
import 'package:cariin_rev/page/restaurant_detail/reserve.dart';
import 'package:flutter/material.dart';
import 'package:cariin_rev/page/restaurant_detail/view_model/restaurant_model.dart';


class RestaurantDetail extends StatefulWidget {
  @override
  _RestaurantDetailState createState() => new _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final RestaurantDetailModel restaurantData = dataDummy;
  final List _orders = orders;

  List<Widget> _page () {
    return <Widget>[
      ListMenu(restaurantData),
      RestaurantInfo(restaurantData),
      Reservation(_orders)
    ];
  }

  static const _tabs = <Tab>[
    Tab(icon: null, text: "MENU"),
    Tab(icon: null, text: "INFO"),
    Tab(icon: null, text: "PESAN"),
  ];

  static const textStyle = TextStyle(
      fontSize: 12.0,
      color: Colors.white,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w600);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: null,
      body: TabBarView(
        children: _page(),
        controller: _tabController,
      ),
      bottomNavigationBar:  Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black26,width: 1.0))
        ),
        child: TabBar(
            tabs: _tabs,
            controller: _tabController,
            labelColor:Colors.blue,
            labelStyle: textStyle.copyWith(
                fontSize: 16.0,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w700),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.white, width: 8.0),
            ),
            unselectedLabelColor: Color(0xFF000000),
            unselectedLabelStyle: textStyle.copyWith(
                fontSize: 12.0,
                color: Color(0xFF000000),
                fontWeight: FontWeight.w700),
          ),
      ),

    );
  }
}
