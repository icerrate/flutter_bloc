import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/authentication_bloc.dart';
import 'package:flutter_bloc_example/repository/user_repository.dart';
import 'package:flutter_bloc_example/utils/injector.dart';
import 'package:flutter_bloc_example/bloc/authentication_event.dart';
import 'package:flutter_bloc_example/bloc/authentication_state.dart';
import 'package:flutter_bloc_example/ui/splash_screen.dart';
import 'package:flutter_bloc_example/ui/login/login_screen.dart';
import 'package:flutter_bloc_example/ui/home_screen.dart';
import 'package:flutter_bloc_example/ui/common/loading_indicator.dart';
import 'package:flutter_bloc_example/common/my_themes.dart';
import 'package:flutter_bloc_example/common/my_colors.dart';

class App extends StatefulWidget {

  App({Key key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  AuthenticationBloc authenticationBloc;

  UserRepository userRepository = Injector.userRepository();

  @override
  void initState() {
    authenticationBloc = AuthenticationBloc(userRepository: userRepository);
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
      child: MaterialApp(
        theme: new ThemeData(
          primaryColor: MyColors.green,
          accentColor: Colors.white,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white70,
          brightness: Brightness.dark,
        ),
        home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
          bloc: authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationUninitialized) {
              return SplashScreen();
            }
            if (state is AuthenticationAuthenticated) {
              return HomeScreen();
            }
            if (state is AuthenticationUnauthenticated) {
              return LoginScreen(userRepository: userRepository);
            }
            if (state is AuthenticationLoading) {
              return LoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}