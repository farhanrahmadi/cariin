import 'package:cariin_rev/core/afterSplash.dart';
import 'package:cariin_rev/page/login/login.dart';
import 'package:cariin_rev/page/landing/landing.dart';
import 'package:cariin_rev/page/register/register.dart';
import 'package:cariin_rev/page/dasboard/dasboard.dart';
import 'package:cariin_rev/page/list_restaurant/list_restaurant.dart';
import 'package:cariin_rev/page/restaurant_detail/restaurant_detail.dart';

final AppRouter =  {
  '/': (context) => AfterSplash(),
  '/login': (context) => Login(),
  '/register': (context) => Register(),
  '/landing': (context) => Landing(),
  '/today': (context) => Landing(),
  '/dashboard': (context) => Dashboard(),
  '/list_restaurant': (context) => ListRestaurants(),
  '/restaurant_detail': (context) => RestaurantDetail(),

};