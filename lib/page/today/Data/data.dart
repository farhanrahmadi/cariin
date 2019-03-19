import 'package:cariin_rev/page/today/Data/styles.dart';
import 'package:flutter/material.dart';

//List imageData = [
//  image1,
//  image2,
//  image3,
//  image4,
//  image5,
//  image6,
//  image7,
//  image8,
//  image9,
//  image10,
//];


List imageData = List.generate(10, (int index){
  return Container(
    height: 400,
    width: 300,
    decoration: BoxDecoration(
        image: new DecorationImage(
          image: new NetworkImage('http://loremflickr.com/320/240/dog'),
          fit: BoxFit.cover,
        ),
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(8))),
  );
});