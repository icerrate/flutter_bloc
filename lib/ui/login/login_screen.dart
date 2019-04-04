import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_example/bloc/authentication_bloc.dart';
import 'package:flutter_bloc_example/repository/session_repository.dart';
import 'package:flutter_bloc_example/common/my_colors.dart';

class LoginScreen extends StatefulWidget {

  LoginScreen({Key key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  AuthenticationBloc _authenticationBloc;

  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _authenticationBloc = AuthenticationBloc(SessionRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.green,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 72,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: Image(
                  alignment: Alignment(0, 1),
                  image: AssetImage('assets/ic_logo_colored.png')
              ),
            ),
            Flex(
              direction: Axis.vertical,
              children: <Widget>[
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 36),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Colors.white
                      ),
                      helperStyle: TextStyle(
                          color: Colors.white
                      ),
                      prefixStyle: TextStyle(
                        color: Colors.white
                      ),
                      suffixStyle: TextStyle(
                          color: Colors.white
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,
                        width: 2)
                      )
                    ),
                    controller: _usernameController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 36),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(labelText: 'Password'),
                    controller: _passwordController,
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    color: MyColors.darkGreen,
                    margin: EdgeInsets.symmetric(horizontal: 36),
                    child: MaterialButton(
                      //onPressed:
                      /*state is! AuthenticationLoading ? _onLoginButtonPressed :*/ //null,
                        child: Text('Login',
                            style: TextStyle(color: MyColors.smokeWhite))
                    )
                ),
                SizedBox(
                  height: 24,
                )
              ]
            )
          ],
        )
    );
  }
}