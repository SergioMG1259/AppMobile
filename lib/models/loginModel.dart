class LoginModel {
  final int id;
  final String role;

  LoginModel({
    required this.id,
    required this.role,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      role: json['role'],
    );
  }
}