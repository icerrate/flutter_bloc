import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_example/common/my_colors.dart';
import 'package:flutter_bloc_example/repository/distributor_repository.dart';
import 'package:flutter_bloc_example/utils/injector.dart';
import 'package:flutter_bloc_example/bloc/distributors_bloc.dart';
import 'package:flutter_bloc_example/bloc/data_event.dart';
import 'package:flutter_bloc_example/bloc/data_state.dart';
import 'package:flutter_bloc_example/bloc/authentication_bloc.dart';
import 'package:flutter_bloc_example/bloc/authentication_event.dart';
import 'package:flutter_bloc_example/bloc/authentication_state.dart';
import 'package:flutter_bloc_example/model/distributor.dart';
import 'package:flutter_bloc_example/utils/dialog_utils.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  AuthenticationBloc _authenticationBloc;

  DistributorsBloc _distributorsBloc;

  DistributorRepository distributorRepository = Injector.distributorRepository();

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _distributorsBloc = DistributorsBloc(distributorRepository: distributorRepository);
    _distributorsBloc.dispatch(LoadData());
    super.initState();
  }

  @override
  void dispose() {
    _distributorsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    return _loadDrawerHeader(_authenticationBloc);
                  } else {
                    return Container();
                  }
                }
            ),
            Column(
              children: <Widget>[
                _loadDrawerOptions(context, _authenticationBloc)
              ]
            )
          ],
        ),
      ),
      body: Container(
        color: MyColors.smokeWhite,
        child: BlocBuilder<DataEvent, DataState>(
            bloc: _distributorsBloc,
            builder: (BuildContext context, DataState state) {
              if (state is DataLoading) {
                return Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(MyColors.green),
                    )
                );
              } else if (state is DataLoaded) {
                return _loadBody(_distributorsBloc);
              } else {
                return Container();
              }
            }
        )
      )
    );
  }

  Widget _loadDrawerHeader(AuthenticationBloc authenticationBloc) {
    return UserAccountsDrawerHeader(
        accountName: Text(authenticationBloc.session.name),
        accountEmail: Text(authenticationBloc.session.username),
        currentAccountPicture: ClipOval(
            child: FadeInImage.assetNetwork(
              placeholder: "assets/placeholder_person.png",
              image: "https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/male/29.png",
            )
        )
    );
  }

  Widget _loadDrawerOptions(BuildContext context, AuthenticationBloc authenticationBloc) {
    return ListTileTheme(
        dense: true,
        child: new ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            onTap: () {
              Navigator.of(context).pop(); // close the drawer
              createSimpleDialog(context, "Logout", "Are you sure?", () => authenticationBloc.dispatch(LoggedOut()));
            }
        )
    );
  }

  Widget _loadBody(DistributorsBloc distributorsBloc) {
    return ListView.builder(
        itemCount: distributorsBloc.distributorsList.distributors.length,
        itemBuilder: (context, position) {
          Distributor distributor = distributorsBloc.distributorsList.distributors[position];
          return ListTile(
              trailing: Image(
                  alignment: Alignment(0, 0),
                  width: 36,
                  height: 36,
                  image: AssetImage('assets/ic_stone_${distributor.level}.png')
              ),
              dense: false,
              title: Text(distributor.name, style: TextStyle(color: Colors.black87)),
              subtitle: Text("Points: ${distributor.points}", style: TextStyle(color: Colors.black45)),
              leading: ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/placeholder_person.png",
                    image: distributorsBloc.distributorsList.distributors[position].photo,
                    height: 56.0,
                    width: 56.0,
                  )
              )
          );
        }
    );
  }
}