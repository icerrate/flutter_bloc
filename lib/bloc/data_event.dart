import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class DataEvent extends Equatable {
  DataEvent([List props = const []]) : super(props);
}

class LoadData extends DataEvent {
  @override
  String toString() => 'LoadData';
}