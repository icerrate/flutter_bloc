import 'package:meta/meta.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:flutter_bloc_example/provider/user_api.dart';
import 'package:flutter_bloc_example/model/session.dart';
import 'package:flutter_bloc_example/model/login.dart';

class UserRepository {

  static String idKey = "id_key";

  static String usernameKey = "username_key";

  static String nameKey = "name_key";

  static String apiKeyKey = "apikey_key";

  UserApi userApi;

  UserRepository({@required this.userApi});

  Future<Session> authenticate({
    @required String email,
    @required String password,
  }) async {
    print("authenticate()");
    Login login = Login(email: email, password: password);
    return await userApi.login(login);
  }

  Future<void> deleteSession() async {
    /// delete from keystore/keychain
    await FlutterKeychain.remove(key: idKey);
    await FlutterKeychain.remove(key: usernameKey);
    await FlutterKeychain.remove(key: nameKey);
    await FlutterKeychain.remove(key: apiKeyKey);
    return new Future.delayed(Duration(seconds: 3));
  }

  Future<void> persistSession(String id, String username, String name, String apiKey) async {
    /// write to keystore/keychain
    await FlutterKeychain.put(key: idKey, value: id);
    await FlutterKeychain.put(key: usernameKey, value: username);
    await FlutterKeychain.put(key: nameKey, value: name);
    await FlutterKeychain.put(key: apiKeyKey, value: apiKey);
    return new Future.delayed(Duration(seconds: 3));
  }

  Future<bool> hasSession() async {
    /// read from keystore/keychain
    String apiKey = await FlutterKeychain.get(key: apiKeyKey);
    return new Future.delayed(Duration(seconds: 2), () =>
      apiKey != null);
  }

  Future<Session> getSession() async {
    /// read from keystore/keychain
    String id = await FlutterKeychain.get(key: idKey);
    String username = await FlutterKeychain.get(key: usernameKey);
    String name = await FlutterKeychain.get(key: nameKey);
    String apiKey = await FlutterKeychain.get(key: apiKeyKey);
    return new Future.delayed(Duration(seconds: 2), () =>
        Session(id: id, username: username, name: name, apiKey: apiKey));
  }
}