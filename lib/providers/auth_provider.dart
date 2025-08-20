import 'dart:async';
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;
  bool _isLoggedIn = false;
  bool _hasInitialized = false;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  bool get hasInitialized => _hasInitialized;

  // Initialize auth state on app start
  Future<void> initializeAuth() async {
    if (_hasInitialized) return; // Prevent multiple initializations

    _isLoading = true;
    notifyListeners();

    try {
      _isLoggedIn = await AuthService.isLoggedIn();
      if (_isLoggedIn) {
        _currentUser = await AuthService.getSavedUser();
      }
    } catch (e) {
      debugPrint('Error initializing auth: $e');
      _isLoggedIn = false;
      _currentUser = null;
    }

    _isLoading = false;
    _hasInitialized = true;
    notifyListeners();
  }

  // Login user
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final success = await AuthService.authenticateUser(email, password);
      
      if (success) {
        // Save user login data
        await AuthService.saveUserLogin(
          email: email,
          password: password, // In real app, don't save password
          firstName: _extractFirstName(email),
          lastName: 'User',
          isEmailVerified: true,
        );

        // Load user data
        _currentUser = await AuthService.getSavedUser();
        _isLoggedIn = true;
        
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint('Login error: $e');
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  // Register new user
  Future<bool> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final success = await AuthService.registerUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
      
      if (success) {
        // Save user registration data
        await AuthService.saveUserLogin(
          email: email,
          password: password, // In real app, don't save password
          firstName: firstName,
          lastName: lastName,
          isEmailVerified: true,
        );

        // Load user data
        _currentUser = await AuthService.getSavedUser();
        _isLoggedIn = true;
        
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint('Registration error: $e');
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  // Update user profile
  Future<bool> updateProfile({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
  }) async {
    if (_currentUser == null) return false;

    // Validate input data
    if (!AuthService.validateProfileUpdate(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
    )) {
      return false;
    }

    try {
      await AuthService.updateUserProfile(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        profileImageUrl: profileImageUrl,
      );

      // Reload user data
      _currentUser = await AuthService.getSavedUser();
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint('Profile update error: $e');
      return false;
    }
  }

  // Logout user
  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      await AuthService.logout();
      _currentUser = null;
      _isLoggedIn = false;
    } catch (e) {
      debugPrint('Logout error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  // Check if first time login
  Future<bool> isFirstTimeLogin() async {
    return await AuthService.isFirstTimeLogin();
  }

  // Helper method to extract first name from email
  String _extractFirstName(String email) {
    final username = email.split('@')[0];
    return username.split('.')[0].replaceAll(RegExp(r'[0-9]'), '').toLowerCase();
  }
}
