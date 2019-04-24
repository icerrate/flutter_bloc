import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_example/bloc/authentication_bloc.dart';
import 'package:flutter_bloc_example/bloc/login_bloc.dart';
import 'package:flutter_bloc_example/bloc/login_state.dart';
import 'package:flutter_bloc_example/bloc/login_event.dart';
import 'package:flutter_bloc_example/common/my_colors.dart';
import 'package:flutter_bloc_example/ui/common/text_field.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  LoginForm({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginBloc get _loginBloc => widget.loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (
          BuildContext context,
          LoginState state,
          ) {
        if (state is LoginFailure) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        return Form(
          child: Column(
            children: [
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
                      child: MyFormField(
                        hint: "Email",
                        controller: _usernameController,
                        contentPadding: EdgeInsets.all(8),
                        obscureText: false
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 36),
                      child: MyFormField(
                        hint: "Password",
                        controller: _passwordController,
                        contentPadding: EdgeInsets.all(8),
                        obscureText: true
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
                          onPressed:
                            state is! LoginLoading ? _onLoginButtonPressed : null,
                          child:
                            Text('Login',
                              style: TextStyle(color: MyColors.smokeWhite)
                            )
                        )
                    ),
                    SizedBox(
                      height: 24,
                    )
                  ]
              ),
              Container(
                child:
                state is LoginLoading ? CircularProgressIndicator() : null,
              ),
            ],
          ),
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
    _loginBloc.dispatch(LoginButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }
}