import 'package:cariin_rev/page/register/form_register.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
            "Daftar",
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
              divider(),
              FormRegister(),
            ],
          ),
        ),
      ),
    );
  }
}

