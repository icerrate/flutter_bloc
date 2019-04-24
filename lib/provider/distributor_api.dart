import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc_example/model/session.dart';
import 'package:flutter_bloc_example/model/login.dart';

class UserApi {

  Future<Session> login(Login body) async {
    print("login was called");
    return new Future.delayed(Duration(seconds: 2), () =>
        Session.fromJson(json.decode(distributorListResponse(body.email))));
  }

  String distributorListResponse(String email) {
    return "{"
    + "\"id\": \"5\","
    + "\"api_key\" : \"GHE74G74NFI9EW\","
    + "\"name\" : \"Mike Smith\","
    + "\"username\" : \"$email\""
    + "}";
  }
}
