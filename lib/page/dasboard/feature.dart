import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              child: SvgPicture.asset(
                "assets/feature/cariin.svg",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          InkWell(
            onTap: () => goToRestaurantDetail(),
            child: new Card(
              elevation: 5.0,
              child: SvgPicture.asset(
                "assets/feature/restaurant.svg",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          InkWell(
            onTap: () => goToRestaurantDetail(),
            child: new Card(
                elevation: 5.0,
                child: SvgPicture.asset(
                  "assets/feature/discount.svg",
                  fit: BoxFit.fitHeight,
                )),
          ),
          InkWell(
            onTap: () => goToRestaurantDetail(),
            child: new Card(
              elevation: 5.0,
              child: SvgPicture.asset(
                "assets/feature/cafe.svg",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          InkWell(
            onTap: () => goToToday(),
            child: new Card(
              elevation: 5.0,
              child: SvgPicture.asset(
                "assets/feature/today.svg",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          InkWell(
            onTap: () => goToRestaurantDetail(),
            child: new Card(
              elevation: 5.0,
              child: SvgPicture.asset(
                "assets/feature/delivery.svg",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
