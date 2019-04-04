import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const []]) : super(props);
}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUninitialized';
}

class AuthenticationAuthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}

class AuthenticationFailure extends AuthenticationState {
  final String error;

  AuthenticationFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'AuthenticationFailure { error: $error }';
}