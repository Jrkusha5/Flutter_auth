

class User {
  final String fname;
  final String lname;
  final String email;
  final String password;
  final String country;
  final String phone;
  final String city;
  final String role;

  User({
    required this.fname,
    required this.lname,
    required this.email,
    required this.password,
    required this.country,
    required this.phone,
    required this.city,
    this.role = "USER", // Default role to "USER"
  });

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "email": email,
        "password": password,
        "country": country,
        "phone": phone,
        "city": city,
        "role": role,
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fname: json['fname'],
      lname: json['lname'],
      email: json['email'],
      password: json['password'],
      country: json['country'],
      phone: json['phone'],
      city: json['city'],
      role: json['role'] ?? "USER", // Default role if missing
    );
  }
}
