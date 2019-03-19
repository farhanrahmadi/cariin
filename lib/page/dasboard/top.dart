import 'package:flutter/material.dart';
import 'package:cariin_rev/component/carousel.dart';

class Top extends StatelessWidget {




//  Widget _toolBar() {
//    return Row(
//      mainAxisSize: MainAxisSize.max,
//      children: <Widget>[
//        new SizedBox(
//          width: 20.0,
//        ),
//        new IconButton(icon: Icon(Icons.menu), onPressed: handleDrawer)
//      ],
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      overflow: Overflow.clip,
      children: <Widget>[
        MainCarousel(),
//        _toolBar(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Jkt',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.white),
            ),
            new GestureDetector(
              child: new Image.asset(
                "assets/icon/pointer.png",
                width: 50.0,
                height: 50.0,
              ),
              onTap: () => print('tapperd'),
            )
          ],
        )
      ],
    );
  }
}
