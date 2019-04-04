
class Error {
  String code;
  String message;

  Error({this.code, this.message});

  String get getCode => code;

  String get getMessage => message;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['code'] = code;
    json['message'] = message;
    return json;
  }
}