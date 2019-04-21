import 'package:cariin_rev/state_management/user/user_model.dart';

class UserState {
  UserModel _user = new UserModel(name: "", image: "");

  UserModel get user => _user;

  void changeUser(UserModel val) => _user = val;
}