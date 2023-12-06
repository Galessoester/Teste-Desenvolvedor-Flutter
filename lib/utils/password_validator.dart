class PasswordValidator {
  static bool isPasswordValid(String password) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');
    return regex.hasMatch(password);
  }
}