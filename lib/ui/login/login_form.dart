import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_example/bloc/authentication_bloc.dart';
import 'package:flutter_bloc_example/bloc/authentication_state.dart';
import 'package:flutter_bloc_example/bloc/authentication_event.dart';

class LoginForm extends StatefulWidget {

  final AuthenticationBloc authenticationBloc;

  LoginForm({
    Key key,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationEvent, AuthenticationState>(
      bloc: widget.authenticationBloc,
      builder: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationFailure) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }
        return Container(
            child: Stack(
              children: <Widget>[
                Column(
                  key: _formKey,
                  children: <Widget>[
                    Text(
                      "My App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      controller: _usernameController,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(labelText: 'Password'),
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                        height: 42,
                        child: RaisedButton(
                          onPressed:
                          state is! AuthenticationLoading ? _onLoginButtonPressed : null,
                          child: Text('Login'),
                        )
                    ),
                    SizedBox(
                      height: 24,
                    )
                  ],
                ),
                Container(
                  child: state is AuthenticationLoading ? CircularProgressIndicator() : null,
                ),
              ],
            )
        );
      },
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _onLoginButtonPressed() {
    /*widget.authenticationBloc.dispatch(TryLogin(
      email: /*_usernameController.text*/ "agary.rohi@gmail.com",
      password: /*_passwordController.text*/ "098765",
    ));*/
  }
}