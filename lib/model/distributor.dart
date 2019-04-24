class Distributor {
  String id;
  String name;
  String photo;
  String level;
  String points;

  Distributor({this.id, this.name, this.photo, this.level, this.points});

  factory Distributor.fromJson(Map<String, dynamic> json) {
    return Distributor(
        id: json['id'],
        name: json['name'],
        photo: json['photo'],
        level: json['level'],
        points: json['points']
    );
  }
}