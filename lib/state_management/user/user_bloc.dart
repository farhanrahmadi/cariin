import 'dart:async';

import './user_model.dart';
import './user_state.dart';
import './user_event.dart';

class UserBloc{
  UserEvent userEvent = new UserEvent();
  final UserState _state = new UserState();
  final _input = StreamController<UserEvent>();
  final _output = StreamController<UserState>.broadcast();

  StreamSink<UserEvent> get inputSink => _input.sink;
  Stream<UserState> get outputStream => _output.stream;


  UserBloc(){
    void onEvent(String event,UserModel payload) {
      switch (event) {
        case "CHANGE_USER":
          _state.changeUser(payload);
          break;
        default:
          _output.sink.add(_state);
      }


    }
  }

  void dispose(){
    _input.close();
    _output.close();
  }

}