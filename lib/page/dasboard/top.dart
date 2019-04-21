import 'package:flutter/material.dart';
import 'package:cariin_rev/component/carousel.dart';

class Top extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      overflow: Overflow.clip,
      children: <Widget>[
        MainCarousel(),
      ],
    );
  }
}
