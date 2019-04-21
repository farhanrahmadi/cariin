import 'package:cariin_rev/state_management/user/user_model.dart';
class UserEvent {

  final String event;
  final UserModel payload;
  final DateTime timeStamp;

  UserEvent({this.event,this.payload, DateTime timeStamp})
  :this.timeStamp = timeStamp ?? DateTime.now();

}