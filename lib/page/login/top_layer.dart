import 'package:flutter/material.dart';
import 'package:cariin_rev/page/login/login_form.dart';

class TopLayer extends StatelessWidget {
  dynamic formKey,obsecureText,submit, validatePassword,data,showPass,validateEmail,isLoading,_handleSignIn;
  TopLayer(this.formKey,this.obsecureText,this.submit, this.validatePassword,this.data,this.showPass,this.validateEmail,this.isLoading,this._handleSignIn);

   Widget sosmedBox() {
     return Column(
       children: <Widget>[
         new InkWell(
           onTap: () => _handleSignIn(),
           child: new Container(
             decoration: BoxDecoration(
               border: Border.all(color: Colors.black45, width: 1.0),
               borderRadius: BorderRadius.circular(10.0),
             ),
             child: Row(
               children: <Widget>[
                 Image.asset(
                   "assets/icon/google-icon.png", height: 40.0, width: 40,),
                 Flexible(child: Text('Login Dengan Google', style: TextStyle(
                     fontSize: 18, fontWeight: FontWeight.bold),),),
               ],
             ),
           ),
         ),
         SizedBox(height: 20.0,),
         new InkWell(
           onTap: () => print('tapped'),
           child: new Container(
             decoration: BoxDecoration(
               border: Border.all(color: Colors.black45, width: 1.0),
               borderRadius: BorderRadius.circular(10.0),
             ),
             child: Row(
               children: <Widget>[
                 Image.asset(
                   "assets/icon/facebook-icon.png", height: 40.0, width: 40,),
                 Flexible(child: Text('Login Dengan Facebook', style: TextStyle(
                     fontSize: 18, fontWeight: FontWeight.bold),),)
               ],
             ),
           ),
         )
       ],
     );
   }

  final Widget divider = new Row(
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
      new Padding(padding: const EdgeInsets.only(left: 5.0, right: 5.0), child: Text('Atau'),),
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
  Widget mainLogo = AnimatedOpacity(
    opacity: 1,
    duration: Duration(seconds: 1),
    child: Image.asset(
      "assets/icon/cariin-bg-tranparent.png",
      width: 160,
      height: 160,
    ),
  );

  Widget submitButton() {
    return  InkWell(
        onTap: submit,
        child:  new Container(
          width: 320.0,
          height: 70.0,
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
          ),
          child: !isLoading ? new Text(
            "Masuk",
            style: new TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.3,
            ),
          ) : new CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
                Colors.white
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        mainLogo,
        Center(child: new Text('Cariin', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),),
        SizedBox(height: 10,),
        Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),child: sosmedBox(),),
        SizedBox(height: 10,),
        Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),child: divider,),
        LoginForm(formKey,obsecureText,submit, validatePassword,data,showPass,validateEmail,isLoading),
        SizedBox(height: 20.0,),
        Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30), child: submitButton())
      ],
    );
  }
}

