abstract class NetworkUtils {

  static Map<String, String> buildServiceHeaders({String app}) {
    Map<String, String> headers = {
      "Content-Type":"application/json; charset=utf-8"
    };
    if (app != null) {
      headers.addAll({"app": app});
    }
    return headers;
  }
}