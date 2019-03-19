import 'dart:async';

import 'package:cariin_rev/page/login/login.dart';
import 'package:flutter/material.dart';
import 'package:cariin_rev/page/landing/page_reveal.dart';
import 'package:cariin_rev/page/landing/page_dragger.dart';
import 'package:cariin_rev/page/landing/pager_indicator.dart';
import 'package:cariin_rev/page/landing/pages.dart';
class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> with TickerProviderStateMixin {
  StreamController<SlideUpdate> slideUpdateStream;
  AnimatedPageDragger animatedPageDragger;

  int activeIndex = 0;
  int nextPageIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;

  _LandingState() {
    slideUpdateStream = new StreamController<SlideUpdate>();

    slideUpdateStream.stream.listen((SlideUpdate event) {
      setState(() {
        if (event.updateType == UpdateType.dragging) {
//          print('Sliding ${event.direction} at ${event.slidePercent}');
          slideDirection = event.direction;
          slidePercent = event.slidePercent;

          if (slideDirection == SlideDirection.leftToRight) {
            nextPageIndex = activeIndex - 1;
          } else if (slideDirection == SlideDirection.rightToLeft) {
            nextPageIndex = activeIndex + 1;
          } else {
            nextPageIndex = activeIndex;
          }
        } else if (event.updateType == UpdateType.doneDragging) {
          if (slidePercent > 0.5) {
            animatedPageDragger = new AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.open,
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );
          } else {
            animatedPageDragger = new AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.close,
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );

            nextPageIndex = activeIndex;
          }

          animatedPageDragger.run();
        } else if (event.updateType == UpdateType.animating) {
//          print('Sliding ${event.direction} at ${event.slidePercent}');
          slideDirection = event.direction;
          slidePercent = event.slidePercent;
        } else if (event.updateType == UpdateType.doneAnimating) {
          print(slideDirection);
          if(slideDirection == SlideDirection.none && nextPageIndex == 2){
//            print('yess');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          }
          activeIndex = nextPageIndex;
          slideDirection = SlideDirection.none;
          slidePercent = 0.0;

          animatedPageDragger.dispose();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: [
          new Page(
            viewModel: pages[activeIndex],
            percentVisible: 1.0,
          ),
          new PageReveal(
            revealPercent: slidePercent,
            child: new Page(
              viewModel: pages[nextPageIndex],
              percentVisible: slidePercent,
            ),
          ),
          new PagerIndicator(
            viewModel: new PagerIndicatorViewModel(
              pages,
              activeIndex,
              slideDirection,
              slidePercent,
            ),
          ),
          new PageDragger(
            canDragLeftToRight: activeIndex > 0,
            canDragRightToLeft: activeIndex < pages.length - 1,
            slideUpdateStream: this.slideUpdateStream,
          ),
        ],
      ),
    );
  }
}
