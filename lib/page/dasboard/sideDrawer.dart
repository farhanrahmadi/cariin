import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {

  Widget accountHeader(){
    return  UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage("https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),fit: BoxFit.fill)
      ),
      accountName: Text('Crystal widjaja'),
      accountEmail: Text("example@email.com"),
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

                        'http://jadiberita.com/wp-content/uploads/2017/09/Crystal-Widjaja-Inovasee.jpg')))),
      ),
    );
  }

  Widget drawerItems(){
    return ListView(
      children: <Widget>[
        accountHeader(),
        ListTile(
          onTap: () => print("Tapped"),
//          leading:  Image(image: AssetImage("assets/icon/faq.png"),width: 25.0,height: 25.0,),
          title: Text("Pengaturan Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading:  Image(image: AssetImage("assets/icon/bell.png"),width: 25.0,height: 25.0,),
          title: Text("Pengaturan Notifikasi",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading:  Image(image: AssetImage("assets/icon/paper.png"),width: 25.0,height: 25.0,),
          title: Text("Tentang Kami",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading: Image(image: AssetImage("assets/icon/faq.png"),width: 25.0,height: 25.0,),
          title: Text("FAQ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading: Image(image: AssetImage("assets/icon/merchant.png"),width: 25.0,height: 25.0,),
          title: Text("Daftar Merchant",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading: Image(image: AssetImage("assets/icon/referal.png"),width: 25.0,height: 25.0,),
          title: Text("Jadi Referal",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading: Image(image: AssetImage("assets/icon/EULA.png"),width: 25.0,height: 25.0,),
          title: Text("Syarat Dan Ketentuan",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading: Image(image: AssetImage("assets/icon/rateus.png"),width: 25.0,height: 25.0,),
          title: Text("Beri kami rating",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
        ),
        ListTile(
          onTap: () => print("Tapped"),
          leading: Image(image: AssetImage("assets/icon/logout.png"),width: 25.0,height: 25.0,),
          title: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return drawerItems();
  }
}

