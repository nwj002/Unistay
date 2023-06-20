class RegisterUserModel {
  String email;
  String phoneNumber;
  String password;
  String confirmPassword;

  RegisterUserModel({
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });
}
