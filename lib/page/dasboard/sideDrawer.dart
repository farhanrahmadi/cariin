import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cariin_rev/state_management/user/user_model.dart';
import 'package:cariin_rev/state_management/user/user_bloc.dart';

class SideDrawer extends StatelessWidget {
  Widget drawerItems() {
    return ListView(
      children: <Widget>[
        AccountHeader(),
        ListTile(
          onTap: () => print("Tapped"),
          leading: SvgPicture.asset(
            "assets/icon/profile.svg",
            width: 25.0,
            height: 25.0,
          ),
          title: Text(
            "Pengaturan Profile",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading: SvgPicture.asset(
            "assets/icon/bell.svg",
            width: 25.0,
            height: 25.0,
          ),
          title: Text(
            "Pengaturan Notifikasi",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading: SvgPicture.asset(
            "assets/icon/paper.svg",
            width: 25.0,
            height: 25.0,
          ),
          title: Text(
            "Tentang Kami",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading: SvgPicture.asset(
            "assets/icon/faq.svg",
            width: 25.0,
            height: 25.0,
          ),
          title: Text(
            "FAQ",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading: SvgPicture.asset(
            "assets/icon/merchant.svg",
            width: 25.0,
            height: 25.0,
          ),
          title: Text(
            "Daftar Merchant",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading: SvgPicture.asset(
            "assets/icon/referal.svg",
            width: 25.0,
            height: 25.0,
          ),
          title: Text(
            "Jadi Referal",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading: SvgPicture.asset(
            "assets/icon/EULA.svg",
            width: 20.0,
            height: 20.0,
          ),
          title: Text(
            "Syarat Dan Ketentuan",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading: SvgPicture.asset(
            "assets/icon/rateus.svg",
            width: 25.0,
            height: 25.0,
          ),
          title: Text(
            "Beri kami rating",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading: Image(
            image: AssetImage("assets/icon/logout.png"),
            width: 25.0,
            height: 25.0,
          ),
          title: Text(
            "Logout",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return drawerItems();
  }
}

class AccountHeader extends StatelessWidget {
  Widget sideDrawerHeader(AsyncSnapshot<User> snapshot) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
              fit: BoxFit.fill)),
      accountName: Text(
        "test",
        style: TextStyle(color: Colors.white),
      ),
      accountEmail:
          Text("example@email.com", style: TextStyle(color: Colors.white)),
      currentAccountPicture: CircleAvatar(
        child: new Container(
            width: 100.0,
            height: 100.0,
            decoration: new BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0),
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                        "https://lh5.googleusercontent.com/-f-S3nhKW0qk/AAAAAAAAAAI/AAAAAAAAAPc/HBhdWonjW7Q/s96-c/photo.jpg")))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.myAccount,
        builder: (context, AsyncSnapshot<User> snapshot) {
          if(!snapshot.hasData){
            return Container(child: Center(child: Text("kosong"),),);
          }
          print(snapshot.data);
          return UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                    fit: BoxFit.fill)),
            accountName: Text(
              snapshot.data.name,
              style: TextStyle(color: Colors.white),
            ),
            accountEmail:
            Text("example@email.com", style: TextStyle(color: Colors.white)),
            currentAccountPicture: CircleAvatar(
              child: new Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: new BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2.0),
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              "https://lh5.googleusercontent.com/-f-S3nhKW0qk/AAAAAAAAAAI/AAAAAAAAAPc/HBhdWonjW7Q/s96-c/photo.jpg")))),
            ),
          );
        });
  }
}
