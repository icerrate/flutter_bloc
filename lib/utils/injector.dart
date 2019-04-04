import 'package:flutter_bloc_example/repository/session_repository.dart';
import 'package:flutter_bloc_example/provider/session_api.dart';
import 'package:flutter/material.dart';

class Injector extends InheritedWidget {

  static String _baseUrl = "http://staging.innovati.pe";

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => child == oldWidget.child;

  static SessionRepository sessionRepository() {
    return SessionRepository(sessionApi: SessionApi(baseUrl: _baseUrl));
  }
}
