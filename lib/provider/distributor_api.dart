import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc_example/model/distributor_list.dart';

class DistributorApi {

  Future<DistributorList> getDistributorList() async {
    print("getDistributorList was called");
    return new Future.delayed(Duration(seconds: 2), () =>
        DistributorList.fromJson(json.decode(distributorListResponse())));
  }

  String distributorListResponse() {
    return "{"
    + "\"distributors\": ["
    + "{"
    + "\"id\" : \"1\","
    + "\"name\" : \"Mary Wilson\","
    + "\"photo\" : \"https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/female/10.png\","
    + "\"level\" : \"3\","
    + "\"points\" : \"950\""
    + "},"
    + "{"
    + "\"id\" : \"2\","
    + "\"name\" : \"Jay Parker\","
    + "\"photo\" : \"https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/male/4.png\","
    + "\"level\" : \"1\","
    + "\"points\" : \"250\""
    + "},"
    + "{"
    + "\"id\" : \"3\","
    + "\"name\" : \"David Miller\","
    + "\"photo\" : \"https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/male/79.png\","
    + "\"level\" : \"2\","
    + "\"points\" : \"600\""
    + "},"
    + "{"
    + "\"id\" : \"4\","
    + "\"name\" : \"Larry Adams\","
    + "\"photo\" : \"https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/male/102.png\","
    + "\"level\" : \"4\","
    + "\"points\" : \"1200\""
    + "},"
    + "{"
    + "\"id\" : \"5\","
    + "\"name\" : \"Sara Clark\","
    + "\"photo\" : \"https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/female/102.png\","
    + "\"level\" : \"6\","
    + "\"points\" : \"2100\""
    + "},"
    + "{"
    + "\"id\" : \"6\","
    + "\"name\" : \"Jhon Angelov\","
    + "\"photo\" : \"https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/male/56.png\","
    + "\"level\" : \"5\","
    + "\"points\" : \"1500\""
    + "}"
    + "]"
    + "}";
  }
}
