import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:cariin_rev/page/restaurant_detail/view_model/restaurant_model.dart';

class RestaurantInfo extends StatelessWidget {

  final RestaurantDetailModel restauranInfo;

  RestaurantInfo(this.restauranInfo);

  StarRating drawrating(rating,size){
    return new StarRating(
      size: size,
      rating: rating,
      color: Colors.blueAccent,
      borderColor: Colors.grey,
      starCount: 5,
    );
  }

  LinearPercentIndicator _linearProgressIndicator(BuildContext context, double rating){
    double mainWidth = MediaQuery.of(context).size.width;
    double witdh = mainWidth * (5/3) / 4;
    return new LinearPercentIndicator(
      width: witdh,
      lineHeight: 8.0,
      percent: ((rating/5.0) * 100.0) / 100.0,
      progressColor: Colors.blue,
    );
  }
  Widget isOpen(){
    if(restauranInfo.isOpen){
      return Text("Open :", style: TextStyle(color: Colors.orangeAccent),);
    }else{
      return Text("Close :", style: TextStyle(color: Colors.grey),);
    }
  }


  Widget header(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Stack(
        children: <Widget>[
          new Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
              color: Colors.grey,
              image: new DecorationImage(
                image: new NetworkImage(
                    restauranInfo.bgImagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () => Navigator.pop(context) ,
              child: Image.asset("assets/icon/back.png",width: 60.0,height: 60.0,color: Colors.white,),
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child: Container(
                width: 80.0,
                height: 80.0,
                decoration: new BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.0),
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            restauranInfo.profileImagePath)))),
          ),
        ],
      ),
    );
  }

  Widget detail(BuildContext context) {
    double vw = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white10)),
        color: Colors.white
      ),
      child:  Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 8.0,),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 6.0,),
                          Text(restauranInfo.name, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 6.0,),
                          isOpen(),
                          Text(restauranInfo.workHour)
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 5.0,),
                          restauranInfo.discount.length > 0 ? Row(
                            children: <Widget>[Image.asset("assets/icon/discount.png",height: 30.0,width: 30.0),SizedBox(width: 5.0,), vw > 450.0 ? Text("Discount") : Container()],
                          ) : Row(),
                          SizedBox(width: 10.0,),
                          restauranInfo.isDelivery ? Row(
                            children: <Widget>[Image.asset("assets/icon/courier.png",height: 30.0,width: 30.0,),SizedBox(width: 5.0,),vw > 450.0 ? Container( width: MediaQuery.of(context).size.width * 0.2,child: Text("Pesan Antar",overflow: TextOverflow.clip)) : Container()],
                          ): Row(),
                        ],),
                      SizedBox(height: 10.0,)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(restauranInfo.overallRating.toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
                      drawrating(restauranInfo.overallRating,(MediaQuery.of(context).size.width/100 * 5)),
                      Text("${restauranInfo.reviewersCount.toString()} Ulasan", style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ),
              )
            ],
          )
    );
  }


  Widget info(BuildContext context){
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12, width: 1.0)),
                  color: Colors.white
                ),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset("assets/icon/spoon-fork.png",height: 20.0,width: 20.0),
                        Divider(color: Colors.black,height: 30.0,indent: 10.0, ),
                        Text("${restauranInfo.typeFood} ${restauranInfo.timeEstimate}",style: TextStyle(fontSize: 12.0),)],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12, width: 1.0)),
                    color: Colors.white
                ),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset("assets/icon/instagram.png",height: 20.0,width: 20.0),
                        Divider(color: Colors.black,height: 30.0,indent: 10.0, ),
                        Text(restauranInfo.instagramName,style: TextStyle(fontSize: 12.0))],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12, width: 1.0))
                ),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset("assets/icon/phone.png",height: 20.0,width: 20.0),
                        Divider(color: Colors.black,height: 30.0,indent: 10.0, ),
                        Text(restauranInfo.phoneNumber,style: TextStyle(fontSize: 12.0))],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12, width: 1.0))
                ),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset("assets/icon/pointer-bw.png",height: 30.0,width: 30.0),
                        Divider(color: Colors.black,height: 30.0,indent: 10.0, ),
                        Text(restauranInfo.address.replaceFirst(new RegExp(r"^\s+"), ""),style: TextStyle(fontSize: 12.0),)],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12, width: 1.0))
                ),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset("assets/icon/payment.png",height: 20.0,width: 20.0),
                        Divider(color: Colors.black,height: 30.0,indent: 10.0, ),
                        Text(restauranInfo.payment.map((i) => i.method.toString()).toString(),style: TextStyle(fontSize: 12.0))],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12, width: 1.0))
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset("assets/icon/setting.png",height: 20.0,width: 20.0),
                        Divider(color: Colors.black,height: 30.0,indent: 10.0, ),
                        Text("Fasilitas : ")],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(height: 30.0,width: 40.0,),
                        Column(
                          children: <Widget>[
                            restauranInfo.facility.isAc ? Row(
                              children: <Widget>[Image.asset("assets/icon/ac.png",height: 20.0,width: 20.0,),Text("Pesan Antar")],
                            ): Row(),
                            restauranInfo.facility.isParking ? Row(
                              children: <Widget>[Image.asset("assets/icon/parking.png",height: 20.0,width: 20.0,),Text("Pesan Antar")],
                            ): Row(),
                          ],
                        ),
                        SizedBox(height: 30.0,width: 40.0,),
                        Column(
                          children: <Widget>[
                            restauranInfo.facility.isVip ? Row(
                              children: <Widget>[Image.asset("assets/icon/vip.png",height: 20.0,width: 20.0,),Text("Pesan Antar")],
                            ): Row(),
                            restauranInfo.facility.isWifi ? Row(
                              children: <Widget>[Image.asset("assets/icon/wifi.png",height: 20.0,width: 20.0,),Text("Pesan Antar")],
                            ): Row(),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      )
    );
  }

  Widget comment(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26, width: 0.5)
      ),
      child: Column(
        children: [
          new Align(
            alignment: Alignment.centerLeft,
            child: Text("Rating Dan Ulasan", style: TextStyle(fontSize: 15.0),),
          ),
          SizedBox(height: 20.0,),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Text(restauranInfo.overallRating.toString(), style: TextStyle(fontSize: 32.0),),
                          drawrating(restauranInfo.overallRating,(MediaQuery.of(context).size.width/100 * 6)),
                          Text("${restauranInfo.reviewersCount.toString()} Ulasan", style: TextStyle(color: Colors.grey,fontSize: 12.0),)
                        ],
                      ),
                    )
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("5",style: TextStyle(fontSize: 13.0),),
                              SizedBox(width: 8.0,),
                              _linearProgressIndicator(context,restauranInfo.ratingDetail.fiveStar)
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text("4",style: TextStyle(fontSize: 13.0),),
                              SizedBox(width: 8.0,),
                              _linearProgressIndicator(context,restauranInfo.ratingDetail.fourStar)
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text("3",style: TextStyle(fontSize: 13.0),),
                              SizedBox(width: 8.0,),
                              _linearProgressIndicator(context,restauranInfo.ratingDetail.threeStar)
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text("2",style: TextStyle(fontSize: 13.0),),
                              SizedBox(width: 8.0,),
                              _linearProgressIndicator(context,restauranInfo.ratingDetail.twoStar)
                            ],
                          ), Row(
                            children: <Widget>[
                              Text("1",style: TextStyle(fontSize: 13.0),),
                              SizedBox(width: 8.0,),
                              _linearProgressIndicator(context,restauranInfo.ratingDetail.oneStar)
                            ],
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(children: <Widget>[Text("Tempat ${restauranInfo.placeRating.toString()}",style: TextStyle(fontSize: 12.0),), SizedBox(width: 2.0,),Icon(Icons.star,color: Colors.grey,size: 18.0,)],),
                ),
                Expanded(
                  flex: 1,
                  child: Row(children: <Widget>[Text("Rasa ${restauranInfo.menuRating.toString()}",style: TextStyle(fontSize: 12.0)), SizedBox(width: 2.0,),Icon(Icons.star,color: Colors.grey,size: 18.0,)],),
                ),
                Expanded(
                  flex: 1,
                  child: Row(children: <Widget>[Text("Pelayanan ${restauranInfo.serviceRating.toString()}",style: TextStyle(fontSize: 12.0)), SizedBox(width: 2.0,),Icon(Icons.star,color: Colors.grey,size: 18.0,)],),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          Text("Komentar Para Foodencer"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Container(
              height: 180.0,
              child: restauranInfo.comments.length > 0 ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context,i){
                  Comments comment = restauranInfo.comments[i];
                  return Row(
                    children: <Widget>[
                      Card(
                        elevation: 5.0,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 5.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image: new NetworkImage(
                                                comment.imagePath)))),
                                SizedBox(width: 50.0,),
                                Column(
                                  children: <Widget>[
                                    Text(comment.name),
                                    drawrating(comment.rating, 20.0)
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0,),
                            Container(width: 250.0,child: Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Text(comment.comment,softWrap: true,),
                            )),
                          ],
                        ),
                      ),
                      i == 2 ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: new Center(
                          child: new FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () => {},
                            child: Icon(Icons.chevron_right,color: Colors.blueAccent,),
                          ),
                        ),
                      ) : SizedBox(height: 10.0,),
                    ],
                  );
                },
              ) : Center(child: Text("Yuk jadi infoodencer yang pertma memberikan review >.<"),),
            )
          ),
        ],
      ),
    );
  }

  Widget discount (BuildContext context){
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Container(
          height: 180.0,
          child: restauranInfo.discount.length > 0 ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context,i){
              RestaurantDiscount discount = restauranInfo.discount[i];
              return Card(
                elevation: 3.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Image.network(discount.imagePath),
                    ),
                  ],
                ),
              );
            },
          ) : Center(child: Text("Belum ada diskon nih  >.<"),),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        header(context),
        detail(context),
        SizedBox(height: 5.0,),
        info(context),
        SizedBox(height: 5.0,),
        comment(context),
        discount(context),
        SizedBox(height: 20.0,),
      ],
    );
  }
}