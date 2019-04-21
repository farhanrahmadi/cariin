import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class MainCarousel extends StatefulWidget {
  @override
  _MainCarouselState createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width,
        child: new Carousel(
          dotSize: 6.0,
          dotSpacing: 15.0,
          dotColor: Colors.blueAccent,
          indicatorBgPadding: 5.0,
          dotBgColor: Colors.purple.withOpacity(0.0),
          overlayShadowColors: Colors.white,
          overlayShadowSize: 0.7,
          images: [
            new NetworkImage('https://ucarecdn.com/5f83f9c5-7294-46cc-b944-2a059bfdb17a/banner.png'),
            new NetworkImage('https://ucarecdn.com/5f83f9c5-7294-46cc-b944-2a059bfdb17a/banner.png'),
            new NetworkImage('https://ucarecdn.com/5f83f9c5-7294-46cc-b944-2a059bfdb17a/banner.png'),
          ],
        )
    );
  }
}

