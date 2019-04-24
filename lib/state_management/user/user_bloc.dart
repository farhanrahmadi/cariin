import 'package:rxdart/rxdart.dart';
import 'package:cariin_rev/state_management/user/user_resources.dart';
import 'package:cariin_rev/state_management/user/user_model.dart';

class UserBloc {
  final _repository = Repository();
  final _accountFetcher = PublishSubject<User>();
//  final _title = BehaviorSubject<String>();
//  final _id = BehaviorSubject<String>();

  Observable<User> get myAccount => _accountFetcher.stream;
//  Function(String) get updateTitle => _title.sink.add;
//  Function(String) get getId => _id.sink.add;

  fetchAllTodo() async {
    User user = await _repository.fetchUser();
    _accountFetcher.sink.add(user);
  }

//  addSaveTodo() {
//    _repository.addSaveTodo(_title.value);
//  }
//
//  updateTodo() {
//    print(_id.value);
//    _repository.updateSaveTodo(_id.value);
//  }


  dispose(){
//    _title.close();
//    _id.close();
    _accountFetcher.close();
  }
}

final bloc = UserBloc();