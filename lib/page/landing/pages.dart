import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


final pages = [
  new PageViewModel(
      const Color(0xFF678FB4),
      'assets/landing/landing1.png',
      'Hotels',
      'All hotels and hostels are sorted by hospitality rating',
      'assets/icon/cloud.png'
  ),
  new PageViewModel(
      const Color(0xFF65B0B4),
      'assets/landing/landing2.png',
      'Banks',
      'We carefully verify all banks before adding them into the app',
      'assets/icon/cofee.png'
  ),
  new PageViewModel(
    const Color(0xFF9B90BC),
    'assets/landing/landing3.png',
    'Store',
    'All local stores are categorized for your convenience',
    'assets/icon/search.png',
  ),
];



class Page extends StatelessWidget {

  final PageViewModel viewModel;
  final double percentVisible;

  Page({
    this.viewModel,
    this.percentVisible = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: viewModel.color,
        child: new  Opacity(
          opacity: percentVisible,
          child: new Container(
            decoration: new BoxDecoration(
              color: viewModel.color,
              image: new DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(percentVisible), BlendMode.dstATop),
                image: new AssetImage(viewModel.heroAssetPath),
                fit: BoxFit.fill,
              ),
            ),
            child: null /* add child content here */,
          ),
        )
    );
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetPath;

  PageViewModel(
    this.color,
    this.heroAssetPath,
    this.title,
    this.body,
    this.iconAssetPath,
  );
}