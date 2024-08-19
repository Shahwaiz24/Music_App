class UserloginModel {
  final String email;
  final String password;

  UserloginModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class UserSignUpModel {
  final String fullname;
  final String email;
  final String password;

  UserSignUpModel({required this.email, required this.password, required this.fullname});
  
  Map<String, dynamic> toJson() {
    return {
      'fullname' : fullname,
      'email': email,
      'password': password,
    };
  }
}
