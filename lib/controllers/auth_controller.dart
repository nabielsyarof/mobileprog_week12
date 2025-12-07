import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService;

  AuthController(this._authService);

  bool _loading = false;
  bool get loading => _loading;

  Future<bool> login(String username, String password) async {
    _loading = true;
    notifyListeners();

    final result = await _authService.login(username, password);

    _loading = false;
    notifyListeners();

    return result;
  }

  String? get user => _authService.currentUser;

  void logout() {
    _authService.logout();
    notifyListeners();
  }
}