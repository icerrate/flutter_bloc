import 'package:meta/meta.dart';
import 'package:flutter_bloc_example/provider/distributor_api.dart';
import 'package:flutter_bloc_example/model/distributor_list.dart';

class DistributorRepository {

  DistributorApi distributorApi;

  DistributorRepository({@required this.distributorApi});

  Future<DistributorList> getDistributorList() async {
    print("getDistributorList()");
    return await distributorApi.getDistributorList();
  }
}