import 'package:flutter/material.dart';

class MainFeature extends StatelessWidget {
  dynamic goToRestaurantDetail;
  dynamic goToToday;

  MainFeature(this.goToRestaurantDetail, this.goToToday);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        shrinkWrap: true,
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          InkWell(
            onTap: () => goToRestaurantDetail(),
            child: new Card(
              elevation: 5.0,
              child: Image.asset(
                "assets/feature/cariin.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          InkWell(
            onTap: () => goToRestaurantDetail(),
            child: new Card(
              elevation: 5.0,
              child: Image.asset(
                "assets/feature/restaurant.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          InkWell(
            onTap: () => goToRestaurantDetail(),
            child: new Card(
                elevation: 5.0,
                child: Image.asset(
                  "assets/feature/discount.png",
                  fit: BoxFit.fitHeight,
                )),
          ),
          InkWell(
            onTap: () => goToRestaurantDetail(),
            child: new Card(
              elevation: 5.0,
              child: Image.asset(
                "assets/feature/cafe.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          InkWell(
            onTap: () => goToToday(),
            child: new Card(
              elevation: 5.0,
              child: Image.asset(
                "assets/feature/today.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          InkWell(
            onTap: () => goToRestaurantDetail(),
            child: new Card(
              elevation: 5.0,
              child: Image.asset(
                "assets/feature/deliver.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
