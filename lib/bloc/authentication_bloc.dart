import 'dart:async';

import 'package:flutter_bloc_example/bloc/authentication_event.dart';
import 'package:flutter_bloc_example/bloc/authentication_state.dart';
import 'package:flutter_bloc_example/repository/session_repository.dart';
import 'package:bloc/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SessionRepository sessionRepository;

  AuthenticationBloc (this.sessionRepository);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationState currentState,
      AuthenticationEvent event,
      ) async* {
    if (event is AppStarted) {
      //final bool hasToken = await userRepository.hasToken();
      bool hasToken = true;
      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      //await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      //await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}