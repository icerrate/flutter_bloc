import 'package:flutter_bloc_example/repository/user_repository.dart';
import 'package:flutter_bloc_example/provider/user_api.dart';
import 'package:flutter/material.dart';

class Injector extends InheritedWidget {

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => child == oldWidget.child;

  static UserRepository userRepository() {
    return UserRepository(sessionApi: UserApi());
  }
}
