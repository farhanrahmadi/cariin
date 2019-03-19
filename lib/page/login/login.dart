import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cariin_rev/page/login/login_model.dart';
import 'package:cariin_rev/page/login/top_layer.dart';
import 'package:cariin_rev/page/dasboard/dasboard.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  LoginData data = new LoginData();
  bool obsecureText = true;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  bool isLoading = false;
  GoogleSignInAccount _currentUser;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );


  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }


  _LoginState() {
    initState();
  }

  String validatePassword(String value) {
    if (value.length < 8) {
      return "Password minimal 8 karakter";
    }
    setState(() {
      isLoading = !isLoading;
    });
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Email Anda Tidak Valid';
    else
      return null;
  }

  void submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save(); // Save our form now.
      new Timer(new Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      });
    }
  }

  void showPass() {
    setState(() {
      obsecureText = !obsecureText;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
      body:  Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/login-bg.png"), fit: BoxFit.cover),
            ),
          ),
          TopLayer(formKey, obsecureText, submit, validatePassword, data,
              showPass, validateEmail, isLoading,_handleSignIn)
        ],
      ),
    );
  }
}
