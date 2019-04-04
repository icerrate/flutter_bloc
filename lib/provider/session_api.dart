import 'dart:async';
import 'package:flutter_bloc_example/utils/resources.dart';
import 'package:flutter_bloc_example/model/session.dart';
import 'package:flutter_bloc_example/utils/status.dart';
import 'package:flutter_bloc_example/provider/api_client.dart';
import 'package:flutter_bloc_example/utils/network_utils.dart';
import 'package:flutter_bloc_example/model/login.dart';
import 'package:flutter/material.dart';

class SessionApi extends Api {

  static const String _loginServiceUrl = "/api/professional/v1.0/user/login/";

  Map _headers;

  SessionApi({@required baseUrl})
      : super(baseUrl: baseUrl) {
    _headers = NetworkUtils.buildServiceHeaders();
  }

  Future<Resource<Session>> login(Login body) async {
    print("login was called");
    String url = "${this.baseUrl + _loginServiceUrl}";
    Resource response = await post(url, _headers, body: body.toJson());
    switch (response.status) {
      case Status.SUCCESS:
        debugPrint(url);
        debugPrint(response.data.toString());
        return Resource.success(Session.fromJson(response.data));
        break;
      default:
        return Resource.error(response.message);
        break;
    }
  }
}