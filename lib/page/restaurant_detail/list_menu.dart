import 'package:cariin_rev/page/restaurant_detail/view_model/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ListMenu extends StatelessWidget {
  final RestaurantDetailModel restauranInfo;

  ListMenu(this.restauranInfo);

  Widget isOpen() {
    if (restauranInfo.isOpen) {
      return Text(
        "Open :",
        style: TextStyle(color: Colors.orangeAccent),
      );
    } else {
      return Text(
        "Close :",
        style: TextStyle(color: Colors.grey),
      );
    }
  }

  StarRating drawrating(rating, size) {
    return new StarRating(
      size: size,
      rating: rating,
      color: Colors.blueAccent,
      borderColor: Colors.grey,
      starCount: 5,
    );
  }

  Widget header(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Stack(
        children: <Widget>[
          new Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
              color: Colors.grey,
              image: new DecorationImage(
                image: new NetworkImage(restauranInfo.bgImagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () => {},
              child: Image.asset(
                "assets/icon/back.png",
                width: 60.0,
                height: 60.0,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child: Container(
                width: 80.0,
                height: 80.0,
                decoration: new BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.0),
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image:
                            new NetworkImage(restauranInfo.profileImagePath)))),
          ),
        ],
      ),
    );
  }

  Widget detail(BuildContext context) {
    double vw = MediaQuery.of(context).size.width;
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.white10)),
            color: Colors.white),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          restauranInfo.name,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 6.0,
                        ),
                        isOpen(),
                        Text(restauranInfo.workHour)
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 5.0,
                        ),
                        restauranInfo.discount.length > 0
                            ? Row(
                                children: <Widget>[
                                  Image.asset("assets/icon/discount.png",
                                      height: 30.0, width: 30.0),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  vw > 450.0 ? Text("Discount") : Container()
                                ],
                              )
                            : Row(),
                        SizedBox(
                          width: 10.0,
                        ),
                        restauranInfo.isDelivery
                            ? Row(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/icon/courier.png",
                                    height: 30.0,
                                    width: 30.0,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  vw > 450.0
                                      ? Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Text("Pesan Antar",
                                              overflow: TextOverflow.clip))
                                      : Container()
                                ],
                              )
                            : Row(),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      restauranInfo.overallRating.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24.0),
                    ),
                    drawrating(restauranInfo.overallRating,
                        (MediaQuery.of(context).size.width / 100 * 5)),
                    Text(
                      "${restauranInfo.reviewersCount.toString()} Ulasan",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  List<Widget> tabBarWiget() {
    List<Widget> data = [
      Text(
        "Semua",
        style: TextStyle(color: Colors.black),
      )
    ];
    for (int i = 0; i < (restauranInfo.menuType.length - 1); i++) {
      data.add(Tab(
        child: Text(
          restauranInfo.menuType[i].name,
          style: TextStyle(color: Colors.black),
        ),
      ));
    }
    return data;
  }

  List<Widget> allItem(index, BuildContext context) {
    List<Widget> data = [];
    Menu menu;
    var controller = new MoneyMaskedTextController(leftSymbol: "Rp. ");
    for (int i = 0; i < (restauranInfo.listMenu.length - 1); i++) {
      menu = restauranInfo.listMenu[i];
      controller.updateValue(menu.price);
      index == menu.typeId ? data.add(item(menu, controller,context)) : null;
    }
    return data;
  }

  showingSnackbar(BuildContext context) {
    return showBottomSheet(
        context: context,
        builder: (BuildContext context) => Container(
          height: 90.0,
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white12,width: 1.0)),
          ),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Menu di tambahkan ke pesanan",style: TextStyle(fontSize: 12.0,color: Colors.blueAccent),),
                trailing: FlatButton(
                  child: Text("OK",style: TextStyle(fontSize: 12.0,color: Colors.blueAccent,fontWeight: FontWeight.bold)),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget item(menu, controller,BuildContext context) {
    return InkWell(
      splashColor: Colors.grey,
      onTap: () => showingSnackbar(context),
      child: Card(
        elevation: 3.0,
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                width: 200.0,
                height: 80.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(menu.imagePath),
                        fit: BoxFit.fitWidth)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 100.0,
                              child: Text(
                                menu.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  controller.text,
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/icon/sand-clock.png",
                              height: 20.0,
                              width: 20.0,
                            ),
                            Text(menu.estimateTime),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> allMenu(BuildContext context) {
    List<Widget> data = [];
    Menu menu;
    var controller = new MoneyMaskedTextController(leftSymbol: "Rp. ");
    for (int i = 0; i < (restauranInfo.listMenu.length - 1); i++) {
      menu = restauranInfo.listMenu[i];
      controller.updateValue(menu.price);
      data.add(item(menu, controller,context));
    }
    return data;
  }

  List<Widget> tabBarItem(BuildContext context) {
    List<Widget> data = [
      GridView.count(
        crossAxisCount: 2,
        children: allMenu(context),
      )
    ];
    for (int i = 0; i < (restauranInfo.menuType.length - 1); i++) {
      data.add(GridView.count(
        padding: EdgeInsets.all(10.0),
        crossAxisCount: 2,
        children: allItem(i,context),
      ));
    }
    return data;
  }

  Widget menuList(BuildContext context) {
    return DefaultTabController(
        length: restauranInfo.menuType.length,
        initialIndex: 0,
        child: Column(
          children: [
            TabBar(isScrollable: true, tabs: tabBarWiget()),
            Container(
              height: 400.0,
              child: TabBarView(
                children: tabBarItem(context),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      header(context),
      detail(context),
      SizedBox(
        height: 5.0,
      ),
      menuList(context)
    ]);
  }
}
