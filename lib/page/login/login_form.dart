import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {

  dynamic formKey,submit, validatePassword,data,showPass,validateEmail,isLoading;
  bool _obsecureText;


  LoginForm(this.formKey,this._obsecureText,this.submit, this.validatePassword,this.data,this.showPass,this.validateEmail,this.isLoading);
  @override

  Widget secureIcon(){
    return Icon(!_obsecureText ? Icons.visibility : Icons.visibility_off, color: Colors.grey);
  }

  Widget emailForm(){
    return  new TextFormField(
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.white)),
        hintText: "Masukan Email Anda",
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black26),
      ),
      onSaved: (String value) => data.username = value,
      validator: validateEmail,
    );
  }

  Widget passFrom(){
    return new TextFormField(
      style: TextStyle(color: Colors.black),
      obscureText: _obsecureText,
      decoration: InputDecoration(
          hintText: "Masukan Password Anda",
          labelText: "Password",
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(color: Colors.black26),
          suffixIcon: GestureDetector(
              onTap: showPass,
              child: secureIcon()
          )),
      onSaved: (String value) => data.password = value,
      validator: validatePassword,
    );
  }

  Widget descText(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          "Lupa Pasword ?",
          textAlign: TextAlign.end,
          style: TextStyle(color: Colors.black, fontSize: 15.0),
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailForm(),
            passFrom(),
            SizedBox(height: 10.0,),
            descText(),
          ],
        ),
      ),
    );
  }
}
