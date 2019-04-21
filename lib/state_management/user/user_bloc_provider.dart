import 'package:flutter/material.dart';
import './user_bloc.dart';

class UserBlocProvider extends InheritedWidget {
  final UserBloc bloc;
  final Widget child;

  const UserBlocProvider({
    Key key,
    @required this.bloc, this.child
  });

  static UserBlocProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(UserBlocProvider) as UserBlocProvider;
  }

  @override
  bool updateShouldNotify(UserBlocProvider old) => true;
}
