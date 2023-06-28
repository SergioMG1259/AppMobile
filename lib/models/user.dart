class User {
  int? id;
  String? name;
  String? lastName;
  String? photo;
  double? score;
  String? email;
  User({
     this.id,
     this.name,
     this.lastName,
     this.photo,
     this.score,
    this.email
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      photo: json['photo'],
      score: json['score'],
      email: json['email']
    );
  }
}