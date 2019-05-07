import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cariin_rev/core/static_data.dart';
import './user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localstorage/flutter_localstorage.dart';


class UserApiProvider {
  StaticData _staticData = new StaticData();
  LocalStorage LS = new LocalStorage();


  Future<User> fetchUser() async {
    String url = '${_staticData.MainLink}/mobile/auth/my_account';
    var request = await http.get(url, headers: {
      'Authorization': LS.getItem("apiKey"),
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    var res = jsonDecode(request.body);
    if (res["error"] == null) {
      return compute(userFromJson, request.body);
    } else {
      throw Exception('Failed to Load');
    }
  }

//  Future addTodo(title) async {
//    final response = await client.post("$_url/create", body: {'name': title});
//    if (response.statusCode == 200) {
//      return response;
//    } else {
//      throw Exception('Failed to add data');
//    }
//  }
//
//  Future updateTodo(ids) async {
//    // print('$_url$ids/update');
//    final response = await client.put("$_url$ids/update", body: {'done': "true"});
//    if (response.statusCode == 200) {
//      print('berhasil di update');
//      return response;
//    } else {
//      throw Exception('Failed to update data');
//    }
//  }
}