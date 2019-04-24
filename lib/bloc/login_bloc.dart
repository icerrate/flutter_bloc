import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/repository/user_repository.dart';

import 'package:flutter_bloc_example/bloc/login_event.dart';
import 'package:flutter_bloc_example/bloc/login_state.dart';
import 'package:flutter_bloc_example/bloc/authentication_event.dart';
import 'package:flutter_bloc_example/bloc/authentication_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginState state, LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final session = await userRepository.authenticate(
          email: event.username,
          password: event.password,
        );

        authenticationBloc.dispatch(
            LoggedIn(id: session.id, username: session.username, name: session.name, apiKey: session.apiKey));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}