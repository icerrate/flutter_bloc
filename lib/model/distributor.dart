class Session {
  String id;
  String name;
  String level;
  String points;

  Session({this.id, this.name, this.level, this.points});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
        id: json['id'],
        name: json['name'],
        level: json['level'],
        points: json['points']
    );
  }
}