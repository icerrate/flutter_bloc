import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  final String id;
  final String username;
  final String name;
  final String apiKey;

  LoggedIn({@required this.id, @required this.username,
    @required this.name, @required this.apiKey}) : super([id, username, name, apiKey]);

  @override
  String toString() => 'LoggedIn { username : $username name : $name apiKey: $apiKey }';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}