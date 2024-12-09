import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../utils/shared_prefs.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Register User
  Future<bool> register(User user) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    final result = await AuthService.register(user);

    _isLoading = false;
    notifyListeners();

    if (result['success']) {
      return true;
    } else {
      _errorMessage = result['error'] ?? 'Unknown error occurred';
      return false;
    }
  }

  // Login User
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    final result = await AuthService.login(email, password);
    print('Login Response: $result');

    _isLoading = false;
    notifyListeners();

    if (result['success']) {
      final data = result['data'];

      // Access token from 'data' map
      final token = data['userToken'] ?? null;

      if (token != null && token.isNotEmpty) {
        await SharedPrefs.saveToken(token); // Save token locally
        return true;
      } else {
        _errorMessage = 'Token not found in response';
        return false;
      }
    } else {
      _errorMessage = result['error'] ?? 'Unknown error occurred';
      return false;
    }
  }
}
