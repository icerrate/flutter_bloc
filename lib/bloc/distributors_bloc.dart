import 'dart:async';

import 'package:flutter_bloc_example/bloc/data_event.dart';
import 'package:flutter_bloc_example/bloc/data_state.dart';
import 'package:flutter_bloc_example/model/distributor_list.dart';
import 'package:flutter_bloc_example/repository/distributor_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class DistributorsBloc extends Bloc<DataEvent, DataState> {

  final DistributorRepository distributorRepository;

  DistributorList distributorsList;

  DistributorsBloc ({@required this.distributorRepository}): assert(distributorRepository != null);

  @override
  DataState get initialState => DataLoading();

  @override
  Stream<DataState> mapEventToState(DataState currentState, DataEvent event) async* {
    if (event is LoadData) {
      try {
        distributorsList = await distributorRepository.getDistributorList();
        yield DataLoaded();
      } catch (_) {
        yield DataNotLoaded();
      }
    }
  }
}