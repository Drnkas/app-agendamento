class User {
  final String id;
  final String token;
  final String email;
  final String fullname;
  final String phone;
  final String document;

  const User({
    required this.id,
    required this.token,
    required this.email,
    required this.fullname,
    required this.phone,
    required this.document,
  });


  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      token: map['token'] as String,
      email: map['email'] as String,
      fullname: map['fullname'] as String,
      phone: map['phone'] as String,
      document: map['document'] as String,
    );
  }
}