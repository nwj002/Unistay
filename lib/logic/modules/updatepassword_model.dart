class UpdatePasswordModel {
  String currentPassword;
  String newPassword;
  String confirmPassword;

  UpdatePasswordModel({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
}
