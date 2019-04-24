import 'dart:async';
import 'package:cariin_rev/state_management/user/user_provider.dart';

import './user_model.dart';

class Repository{
  final userApiProvider = UserApiProvider();

  Future<User> fetchUser() => userApiProvider.fetchUser();

}