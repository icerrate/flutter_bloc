import 'package:flutter_bloc_example/utils/status.dart';

class Resource<T> {
  final Status status;
  final T data;
  final String code;
  final String message;
  final int responseCode;

  Resource({this.status, this.data, this.code, this.message, this.responseCode = 200});

  factory Resource.success(T data) {
    return Resource(status: Status.SUCCESS, data: data, message: null, responseCode: 200);
  }

  factory Resource.error(String msg, {T data, int code = 500}) {
    return Resource(status: Status.ERROR, data: data, message: msg, responseCode: code);
  }

  factory Resource.loading(T data) {
    return Resource(status: Status.LOADING, data: data, message: null, responseCode: 0);
  }
}