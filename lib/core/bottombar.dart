import 'package:flutter/material.dart';

class MainBottomBar extends StatelessWidget {
  int index;
  dynamic changeIndex;

  MainBottomBar(this.index, this.changeIndex);

  Image definePic(int i) {
    switch (i) {
      case 0:
        {
          if (index == 0) {
            return Image.asset(
              "assets/bottombar/home-active.png",
              width: 60,
              height: 60,
            );
          } else {
            return Image.asset("assets/bottombar/home-unactive.png",
                width: 60, height: 60);
          }
          break;
        }
      case 1:
        {
          if (index == 1) {
            return Image.asset("assets/bottombar/booking-active.png",
                width: 60, height: 60);
          } else {
            return Image.asset("assets/bottombar/booking-unactive.png",
                width: 60, height: 60);
          }
          break;
        }
      case 2:
        {
          if (index == 2) {
            return Image.asset("assets/bottombar/love-active.png",
                width: 60, height: 60);
          } else {
            return Image.asset("assets/bottombar/love-unactive.png",
                width: 60, height: 60);
          }
          break;
        }
      case 3:
        {
          return Image.asset("assets/bottombar/profil.png",
              width: 60, height: 60);
          break;
        }
    }
  }

  @override
  BottomNavigationBar build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      // this will be set when a new tab is tapped
      items: bottomBarItem(),
      onTap: changeIndex,
      iconSize: 40,
      type: BottomNavigationBarType.fixed,
    );
  }

  List<BottomNavigationBarItem> bottomBarItem() {
    return [
      BottomNavigationBarItem(
        icon: definePic(0),
        title: Text(''),
      ),
      BottomNavigationBarItem(
          icon: definePic(1),
          title: Text('')
      ),
      BottomNavigationBarItem(icon: definePic(2), title: Text('')),
      BottomNavigationBarItem(
          icon: new Container(
              width: 45.0,
              height: 45.0,
              decoration: new BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0),
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          'http://jadiberita.com/wp-content/uploads/2017/09/Crystal-Widjaja-Inovasee.jpg')))),
          title: Text(''))
    ];
  }
}
