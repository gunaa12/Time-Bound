class User {
  String message;
  final int id;
  String access_token;
  String refresh_token;

  User({required this.message, required this.id, required this.access_token, required this.refresh_token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      message: json['message'],
      id: json['id'],
      access_token: json['access_token'],
      refresh_token: json['refresh_token']
    );
  }
}