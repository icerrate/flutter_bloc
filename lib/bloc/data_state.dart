import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class DataState extends Equatable {
  DataState([List props = const []]) : super(props);
}

class DataLoading extends DataState {
  @override
  String toString() => 'DataLoading';
}

class DataLoaded extends DataState {
  @override
  String toString() => 'DataLoaded';
}

class DataNotLoaded extends DataState {
  @override
  String toString() => 'DataNotLoaded';
}