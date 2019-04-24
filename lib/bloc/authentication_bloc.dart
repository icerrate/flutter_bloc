import 'dart:async';

import 'package:flutter_bloc_example/bloc/authentication_event.dart';
import 'package:flutter_bloc_example/bloc/authentication_state.dart';
import 'package:flutter_bloc_example/repository/user_repository.dart';
import 'package:flutter_bloc_example/model/session.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepository userRepository;

  Session session;

  AuthenticationBloc ({@required this.userRepository}): assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationState state,
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool hasSession = await userRepository.hasSession();

      if (hasSession) {
        session = await userRepository.getSession();
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistSession(event.id, event.username, event.name, event.apiKey);
      session = Session(id: event.id, username: event.username, name: event.name, apiKey: event.apiKey);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteSession();
      yield AuthenticationUnauthenticated();
    }
  }
}