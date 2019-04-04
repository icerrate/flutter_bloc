import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_bloc_example/bloc/authentication_bloc.dart';
import 'package:flutter_bloc_example/repository/session_repository.dart';
import 'package:flutter_bloc_example/utils/injector.dart';

/*class App extends StatefulWidget {

  App({Key key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  AuthenticationBloc authenticationBloc;

  SessionRepository sessionRepository = Injector.sessionRepository();

  @override
  void initState() {
    authenticationBloc = AuthenticationBloc(sessionRepository: sessionRepository);
    authenticationBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  void dispose() {
    authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
        bloc: authenticationBloc,
        child: ScopedModelDescendant<AppModel>(
          builder: (context, child, model) => MaterialApp(
            theme: model.theme,
            home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
              bloc: authenticationBloc,
              builder: (BuildContext context, AuthenticationState state) {
                if (state is AuthenticationUninitialized) {
                  return SplashScreen();
                }
                if (state is AuthenticationNeverAuthenticated) {
                  return IntroductionScreen();
                }
                if (state is AuthenticationUnauthenticated) {
                  return LoginScreen();
                }
                if (state is AuthenticationAuthenticated) {
                  return HomeScreen(mainPerson: persons[0]);
                }
              },
            ),
          ),
        )
    );
  }
}*/