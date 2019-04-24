import 'package:flutter_bloc_example/model/distributor.dart';

class DistributorList {
  
  List<Distributor> distributors;

  DistributorList({this.distributors});

  factory DistributorList.fromJson(Map<String, dynamic> json) {
    List<Distributor> distributors = List();
    if (json.containsKey('distributors')) {
      for (var account in json['distributors']) {
        distributors.add(Distributor.fromJson(account));
      }
    }
    return DistributorList(
        distributors: distributors
    );
  }
}