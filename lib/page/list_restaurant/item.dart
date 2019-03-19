import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
class Item extends StatelessWidget {
  dynamic data;

  Item(this.data);

  StarRating drawrating(rating){
    return new StarRating(
        size: 15.0,
        rating: rating,
        color: Colors.blueAccent,
        borderColor: Colors.grey,
        starCount: 5,
    );
  }

  double toDouble(payload){
    return payload;
  }



  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 3.0,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: new Container(
              height: 90.0,
              width: 90.0,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                      fit: BoxFit.fitHeight,
                        image: new NetworkImage(data['imagePath'])))),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
              child: Container(
                height: 90.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Text(data['name'],style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),overflow: TextOverflow.clip,),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(child: Text(data['rating'].toString(), style: TextStyle(fontSize: 12.0),overflow: TextOverflow.clip)),
                        drawrating(data['rating']),
                        Container(width: MediaQuery.of(context).size.width * 0.2,child: Text(data['distance'].toString()+" Km", style: TextStyle(fontSize: 12.0),overflow: TextOverflow.clip))
                      ],
                    ),
                    Text('${data["district"]},${data['city']}-${data['province']}',style: TextStyle(color: Colors.grey,fontSize: 12.0),),
                    Row(
                      children: <Widget>[
                        Text(data['isOpen']? "Open Now, " : "Close Now, ", style: TextStyle(fontSize: 12.0,color: data['isOpen']? Colors.orangeAccent : Colors.grey) ),
                        Text('${data['openHour']} - ${data['closeHour']}',style: TextStyle(fontSize: 12.0,color: Colors.blueAccent),)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Estimasi ',style: TextStyle(fontSize: 12.0,),),
                        Text('${data["avgPrice"]}',style: TextStyle(fontSize: 12.0,color: Colors.blueAccent),),
                        Text('/${data["people"].toString()} orang',style: TextStyle(fontSize: 12.0,),)
                      ],
                    ),
                    SizedBox(height: 5.0,)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset("assets/icon/map.png",width: 40.0,height: 40.0,)
                ],
              ),
          )
        ],
      ),
    );
  }
}
