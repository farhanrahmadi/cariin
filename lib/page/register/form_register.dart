import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cariin_rev/core/static_data.dart';
import 'package:cariin_rev/page/register/view_model/register.dart';
import 'package:flutter_localstorage/flutter_localstorage.dart';

class FormRegister extends StatefulWidget {
  @override
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  bool _obsecureText = true, isLoading = false;
  RegisterData data = new RegisterData();
  StaticData _staticData = new StaticData();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  LocalStorage localStorage = new LocalStorage();

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Email Anda Tidak Valid';
    else
      return null;
  }

  String validateName(String value) {
    Pattern hasNum = r'(?=.*[0-9])';
    if (new RegExp(hasNum).hasMatch(value))
      return "Tidak boleh ada angka di nama";
    else
      return null;
  }

  String validatePhoneNumber(String value) {
    if (value.length < 11 && value.length > 13)
      return "Nomor anda tidak valid silakan masukan ulang";
    else if (value[0].toString() == '0')
      return "Tidak perlu mengunakan angka 0";
    else
      return null;
  }

  String validatePassword(String value) {
    Pattern min6 = r'^(?=.{8,})';
    Pattern hasNum = r'(?=.*[0-9])';
    if (!new RegExp(min6).hasMatch(value))
      return 'Minimal karakter adalah 6';
    else if (!new RegExp(hasNum).hasMatch(value))
      return 'Password harus terdiri dari huruf dan angka';
    else
      return null;
  }

  Widget emailForm() {
    return new TextFormField(
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        hintText: "Masukan Email Anda",
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black26),
      ),
      onSaved: (String value) => data.email = value,
      validator: validateEmail,
    );
  }

  Widget nameForm() {
    return new TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        hintText: "Masukan Nama Anda",
        labelText: "Nama",
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black26),
      ),
      onSaved: (String value) => data.name = value,
      validator: validateName,
    );
  }

  Widget usernameForm() {
    return new TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        hintText: "Masukan Nama Penguna Anda",
        labelText: "Username",
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black26),
      ),
      onSaved: (String value) => data.username = value,
    );
  }

  Widget phoneNumberForm() {
    return new TextFormField(
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        prefixText: "+62 ",
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        hintText: "Masukan no Anda",
        labelText: "No Handphone",
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black26),
      ),
      onSaved: (String value) => data.email = value,
      validator: validatePhoneNumber,
    );
  }

  Widget passFrom() {
    return new TextFormField(
      style: TextStyle(color: Colors.black),
      obscureText: _obsecureText,
      decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          hintText: "Masukan Password Anda",
          labelText: "Password",
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(color: Colors.black26),
          suffixIcon: GestureDetector(onTap: showPass, child: secureIcon())),
      onSaved: (String value) => data.password = value,
      validator: validatePassword,
    );
  }

  void showPass() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  Widget secureIcon() {
    return Icon(!_obsecureText ? Icons.visibility : Icons.visibility_off,
        color: Colors.grey);
  }


  void submit() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      final url = '${_staticData.MainLink}mobile/users';
      var res;
      formKey.currentState.save(); // Save our form now.
      var body = json.encode({
        'password': data.password,
        'email': data.email,
        'password_confirmation': data.password,
        'username': data.username,
        'role': 'user',
        'name': data.name
      });

      res = await http.post(url, body: body, headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });

      setState(() {
        isLoading = false;
      });
      var response = jsonDecode(res.body);
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
      localStorage.setItem("apiKey", response["token"]);
      Navigator.pushNamed(context, '/dashboard');
    }
  }

  Widget login() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Sudah punya akun ?"),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/login'),
            child: Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget submitButton() {
    return InkWell(
        onTap: submit,
        child: new Container(
          height: 50.0,
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
          ),
          child: !isLoading
              ? new Text(
                  "Daftar",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                )
              : new CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            nameForm(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            usernameForm(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            emailForm(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            phoneNumberForm(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            passFrom(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            submitButton(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            login(),
          ],
        ));
  }
}
