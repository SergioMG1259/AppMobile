class UserShort {
  int id;
  String name;
  String lastName;
  String photo;
  double score;

  UserShort({
    required this.id,
    required this.name,
    required this.lastName,
    required this.photo,
    required this.score,
  });

  factory UserShort.fromJson(Map<String, dynamic> json) {
    return UserShort(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      photo: json['photo'],
      score: json['score'],
    );
  }
}