class Session {
  int id;
  String apiKey;
  String username;

  Session({this.id, this.apiKey, this.username});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
        id: json['id'],
        apiKey: json['api_key'],
        username: json['username']
    );
  }
}