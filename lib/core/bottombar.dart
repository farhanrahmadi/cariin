import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainBottomBar extends StatelessWidget {
  int index;
  dynamic changeIndex;

  MainBottomBar(this.index, this.changeIndex);

  SvgPicture definePic(int i) {
    switch (i) {
      case 0:
        {
          if (index == 0) {
            return new SvgPicture.asset(
              "assets/bottombar/home-active.svg",
              width: 40,
              height: 30,
              semanticsLabel: 'home',
            );
          } else {
            return new SvgPicture.asset(
              "assets/bottombar/home-unactive.svg",
              width: 40,
              height: 30,
              semanticsLabel: 'home-active',
            );
          }
          break;
        }
      case 1:
        {
          if (index == 1) {
            return new SvgPicture.asset(
              "assets/bottombar/booking-active.svg",
              width: 40.0,
              height: 30.0,
              semanticsLabel: 'booking',
            );
          } else {
            return new SvgPicture.asset(
                "assets/bottombar/booking-unactive.svg",
                width: 40.0,
                height: 30.0,
                semanticsLabel: 'booking-active',
            );
          }
          break;
        }
      case 2:
        {
          if (index == 2) {
            return new SvgPicture.asset(
                "assets/bottombar/news-active.svg",
                width: 40.0,
                height: 30.0,
              semanticsLabel: 'news',
            );
          } else {
            return new SvgPicture.asset(
                "assets/bottombar/news-unactive.svg",
                width: 40.0,
                height: 30.0,
                semanticsLabel: 'news-active',
            );
          }
          break;
        }
      case 3:
        {
          if (index == 3) {
            return new SvgPicture.asset(
                "assets/bottombar/news-active.svg",
                width: 40.0,
                height: 30.0,
                semanticsLabel: 'merchant-active',
            );
          } else {
            return new SvgPicture.asset(
                "assets/bottombar/news-unactive.svg",
                width: 40.0,
                height: 30.0,
              semanticsLabel: 'merchant-active',
            );
          }
          break;
        }
    }
  }

  @override
  BottomNavigationBar build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      items: bottomBarItem(),
      onTap: changeIndex,
      type: BottomNavigationBarType.fixed,
    );
  }

  List<BottomNavigationBarItem> bottomBarItem() {
    return [
      BottomNavigationBarItem(
        icon: definePic(0),
        title: Text('Home'),
      ),
      BottomNavigationBarItem(icon: definePic(1), title: Text('Scan')),
      BottomNavigationBarItem(icon: definePic(2), title: Text('News')),
      BottomNavigationBarItem(icon: definePic(3), title: Text('Merchant'))
    ];
  }
}
