import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_example/bloc/authentication_bloc.dart';
import 'package:flutter_bloc_example/bloc/authentication_event.dart';
import 'package:flutter_bloc_example/bloc/authentication_state.dart';
import 'package:flutter_bloc_example/utils/dialog_utils.dart';
import 'package:flutter_bloc_example/common/my_colors.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            BlocBuilder<AuthenticationEvent, AuthenticationState>(
                bloc: _authenticationBloc,
                builder: (BuildContext context, AuthenticationState state) {
                  if (state is AuthenticationAuthenticated) {
                    return UserAccountsDrawerHeader(
                      accountName: Text(_authenticationBloc.session.name),
                      accountEmail: Text(_authenticationBloc.session.username),
                      currentAccountPicture: ClipOval(
                          child: FadeInImage.assetNetwork(
                            placeholder: "assets/placeholder_person.png",
                            image: "https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/male/29.png",
                          )
                      )
                    );
                  } else {
                    return Container();
                  }
                }
            ),
            Column(
              children: <Widget>[
                ListTileTheme(
                  dense: true,
                  child: new ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Logout"),
                    onTap: () {
                      Navigator.of(context).pop(); // close the drawer
                      createSimpleDialog(context, "Logout", "Are you sure?", () => _authenticationBloc.dispatch(LoggedOut()));
                    }
                  )
                )
              ]
            )
          ],
        ),
      ),
      body: Container(

      ),
    );
  }
}