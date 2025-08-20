import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService {
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _userIdKey = 'user_id';
  static const String _userEmailKey = 'user_email';
  static const String _userFirstNameKey = 'user_first_name';
  static const String _userLastNameKey = 'user_last_name';
  static const String _userPhoneKey = 'user_phone';
  static const String _userProfileImageKey = 'user_profile_image';
  static const String _isEmailVerifiedKey = 'is_email_verified';
  static const String _isPhoneVerifiedKey = 'is_phone_verified';
  static const String _firstTimeLoginKey = 'first_time_login';

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Check if this is first time login
  static Future<bool> isFirstTimeLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstTimeLoginKey) ?? true;
  }

  // Save user login state and data
  static Future<void> saveUserLogin({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
    bool isEmailVerified = false,
    bool isPhoneVerified = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Generate a simple user ID based on email
    final userId = 'user_${email.hashCode.abs()}';
    
    await prefs.setBool(_isLoggedInKey, true);
    await prefs.setString(_userIdKey, userId);
    await prefs.setString(_userEmailKey, email);
    
    if (firstName != null) {
      await prefs.setString(_userFirstNameKey, firstName);
    }
    if (lastName != null) {
      await prefs.setString(_userLastNameKey, lastName);
    }
    if (phoneNumber != null) {
      await prefs.setString(_userPhoneKey, phoneNumber);
    }
    if (profileImageUrl != null) {
      await prefs.setString(_userProfileImageKey, profileImageUrl);
    }
    
    await prefs.setBool(_isEmailVerifiedKey, isEmailVerified);
    await prefs.setBool(_isPhoneVerifiedKey, isPhoneVerified);
    
    // Mark that first time login is complete
    await prefs.setBool(_firstTimeLoginKey, false);
  }

  // Get saved user data
  static Future<User?> getSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    
    if (!await isLoggedIn()) {
      return null;
    }
    
    final userId = prefs.getString(_userIdKey);
    final email = prefs.getString(_userEmailKey);
    final firstName = prefs.getString(_userFirstNameKey) ?? 'User';
    final lastName = prefs.getString(_userLastNameKey) ?? '';
    final phoneNumber = prefs.getString(_userPhoneKey);
    final profileImageUrl = prefs.getString(_userProfileImageKey);
    final isEmailVerified = prefs.getBool(_isEmailVerifiedKey) ?? false;
    final isPhoneVerified = prefs.getBool(_isPhoneVerifiedKey) ?? false;
    
    if (userId == null || email == null) {
      return null;
    }
    
    return User(
      id: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      profileImageUrl: profileImageUrl,
      createdAt: DateTime.now().subtract(const Duration(days: 30)), // Approximate
      isEmailVerified: isEmailVerified,
      isPhoneVerified: isPhoneVerified,
      preferences: UserPreferences(
        emailNotifications: true,
        pushNotifications: true,
        smsNotifications: false,
        currency: 'USD',
        language: 'English',
        darkMode: false,
      ),
      addresses: [], // Will be loaded separately if needed
    );
  }

  // Simulate login authentication
  static Future<bool> authenticateUser(String email, String password) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Simple validation - in real app, this would be server-side
    if (email.isNotEmpty && password.length >= 6) {
      return true;
    }
    return false;
  }

  // Simulate signup
  static Future<bool> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Simple validation - in real app, this would be server-side
    if (email.isNotEmpty && password.length >= 8 && firstName.isNotEmpty) {
      return true;
    }
    return false;
  }

  // Update user profile
  static Future<void> updateUserProfile({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    if (firstName != null && firstName.isNotEmpty) {
      await prefs.setString(_userFirstNameKey, firstName);
    }
    if (lastName != null && lastName.isNotEmpty) {
      await prefs.setString(_userLastNameKey, lastName);
    }
    if (phoneNumber != null) {
      if (phoneNumber.isEmpty) {
        await prefs.remove(_userPhoneKey);
      } else {
        await prefs.setString(_userPhoneKey, phoneNumber);
      }
    }
    if (profileImageUrl != null) {
      if (profileImageUrl.isEmpty) {
        await prefs.remove(_userProfileImageKey);
      } else {
        await prefs.setString(_userProfileImageKey, profileImageUrl);
      }
    }
  }

  // Validate profile update data
  static bool validateProfileUpdate({
    String? firstName,
    String? lastName,
    String? phoneNumber,
  }) {
    if (firstName != null && firstName.trim().length < 2) {
      return false;
    }
    if (lastName != null && lastName.trim().length < 2) {
      return false;
    }
    if (phoneNumber != null && phoneNumber.isNotEmpty && phoneNumber.length < 10) {
      return false;
    }
    return true;
  }

  // Logout user
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Clear all user-related data
    await prefs.remove(_isLoggedInKey);
    await prefs.remove(_userIdKey);
    await prefs.remove(_userEmailKey);
    await prefs.remove(_userFirstNameKey);
    await prefs.remove(_userLastNameKey);
    await prefs.remove(_userPhoneKey);
    await prefs.remove(_userProfileImageKey);
    await prefs.remove(_isEmailVerifiedKey);
    await prefs.remove(_isPhoneVerifiedKey);
    
    // Keep first time login as false so they don't see onboarding again
    // await prefs.remove(_firstTimeLoginKey);
  }

  // Clear all data (for testing or complete reset)
  static Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
