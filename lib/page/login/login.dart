import 'dart:convert';
import 'package:cariin_rev/core/static_data.dart';
import 'package:cariin_rev/state_management/user/user_bloc.dart';
import 'package:cariin_rev/state_management/user/user_bloc_provider.dart';
import 'package:cariin_rev/state_management/user/user_event.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cariin_rev/page/login/form_login.dart';
import 'package:flutter_localstorage/flutter_localstorage.dart';
import 'package:cariin_rev/state_management/user/user_model.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final UserBloc _bloc = new UserBloc();
  Widget mainLogo = AnimatedOpacity(
    opacity: 1,
    duration: Duration(seconds: 1),
    child: Image.asset(
      "assets/icon/cariin-bg-tranparent.png",
      width: 160,
      height: 160,
    ),
  );

  Widget divider() {
    return new Row(
      children: <Widget>[
        new Flexible(
          child: new Center(
            child: new Container(
              margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
              height: 2.0,
              color: Colors.black,
            ),
          ),
        ),
        new Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Text(
            "Atau",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        new Flexible(
          child: new Center(
            child: new Container(
              margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
              height: 2.0,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.1;
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Container(
        decoration: BoxDecoration(
//          image: DecorationImage(
//              image: AssetImage("assets/login-bg.png"), fit: BoxFit.fitWidth),
            ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: padding.toDouble()),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              mainLogo,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              UserBlocProvider(bloc: _bloc, child: _authGoogle()),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              divider(),
              FormLogin(),
            ],
          ),
        ),
      ),
    );
  }
}

class _authGoogle extends StatefulWidget {
  @override
  __authGoogleState createState() => __authGoogleState();
}

class __authGoogleState extends State<_authGoogle> {
  LocalStorage localStorage = new LocalStorage();
  StaticData _staticData = new StaticData();

  void getData(res, bloc) async {
    final url = '${_staticData.MainLink}/mobile/auth/google';
    var body = json.encode({'id_token': res});
    var request = await http.post(url, body: body, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    var response = jsonDecode(request.body);
    if (response["error"] != null) {
      return showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text("Terjadi Kesalahan"),
                content: Text(response["message"]),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Oke"))
                ],
              ));
    }
    bloc.inputSink.add(UserEvent(
        event: "CHANGE_USER",
        payload: UserModel(name: response["name"], image: response["image"])));
    localStorage.setItem("apiKey", response["token"]);
    Navigator.pushNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    final UserEvent event = new UserEvent();
    final UserBloc bloc = UserBlocProvider.of(context).bloc;
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    Future<void> _handleSignInGoogle() async {
      try {
        await _googleSignIn.signIn().then((result) {
          result.authentication.then((googleKey) {
            getData(googleKey.idToken, bloc);
          }).catchError((err) {
            print('inner error');
          });
        }).catchError((err) {
          print('error occured');
        });
      } catch (error) {
        print(error);
      }
    }

    Widget sosmedBox() {
      return Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: new InkWell(
              onTap: _handleSignInGoogle,
              child: new Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/icon/google-icon.png",
                      height: 50.0,
                      width: 50,
                    ),
                    Flexible(
                      child: Text(
                        'Login Dengan Google',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
        ],
      );
    }

    return sosmedBox();
  }
}
