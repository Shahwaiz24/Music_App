class UserloginModel {
  final String email;
  final String password;

  UserloginModel({required this.email, required this.password});
}

class UserSignUpModel {
  final String fullname;
  final String email;
  final String password;

  UserSignUpModel({required this.email, required this.password, required this.fullname});
}
