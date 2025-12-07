class AuthService {
  String? _loggedUser;

  Future<bool> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 1)); // simulasi API
    if (username == "admin" && password == "1234") {
      _loggedUser = username;
      return true;
    }
    return false;
  }

  String? get currentUser => _loggedUser;

  void logout() {
    _loggedUser = null;
  }
}