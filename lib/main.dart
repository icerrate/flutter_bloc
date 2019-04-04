import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/authentication_bloc.dart';
import 'package:flutter_bloc_example/ui/splash_screen.dart';
import 'package:flutter_bloc_example/ui/login/login_screen.dart';
import 'package:flutter_bloc_example/utils/injector.dart';
import 'package:flutter_bloc_example/ui/introduction_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<AuthenticationBloc>(
        bloc: AuthenticationBloc(Injector.sessionRepository()),
        child: IntroductionScreen(),
      ),
      routes: <String, WidgetBuilder> {
        "": (BuildContext context) => SplashScreen(),
        "/introduction": (BuildContext context) => IntroductionScreen(),
        "/login": (BuildContext context) => LoginScreen()
      },
    );
  }
}
