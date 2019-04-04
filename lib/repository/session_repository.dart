import 'package:meta/meta.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:flutter_bloc_example/provider/session_api.dart';
import 'package:flutter_bloc_example/model/session.dart';
import 'package:flutter_bloc_example/model/login.dart';
import 'package:flutter_bloc_example/utils/status.dart';

class SessionRepository {

  static String usernameKey = "username_key";

  static String apiKeyKey = "apikey_key";

  SessionApi sessionApi;

  SessionRepository({@required this.sessionApi});

  Future<Session> authenticate({
    @required String email,
    @required String password,
  }) async {
    print("authenticate()");
    Login login = Login(email: email, password: password);
    final resource = await sessionApi.login(login);
    switch (resource.status) {
      case Status.ERROR:
        print(resource.message);
        break;
      default:
        print(resource.code);
        break;
    }
    return resource.data;
  }

  Future<void> deleteSession() async {
    /// delete from keystore/keychain
    await FlutterKeychain.remove(key: usernameKey);
    await FlutterKeychain.remove(key: apiKeyKey);
    return;
  }

  Future<void> persistSession(String username, String apiKey) async {
    /// write to keystore/keychain
    await FlutterKeychain.put(key: usernameKey, value: username);
    await FlutterKeychain.put(key: apiKeyKey, value: apiKey);
    return;
  }

  Future<bool> hasSession() async {
    /// read from keystore/keychain
    String apiKey = await FlutterKeychain.get(key: apiKeyKey);
    return apiKey != null;
  }

  Future<Session> getSession() async {
    /// read from keystore/keychain
    String username = await FlutterKeychain.get(key: apiKeyKey);
    String apiKey = await FlutterKeychain.get(key: apiKeyKey);
    return Session(username: username, apiKey: apiKey);
  }
}