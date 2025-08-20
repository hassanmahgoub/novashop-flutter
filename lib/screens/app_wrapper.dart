import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../splash_screen.dart';
import 'login_screen.dart';
import 'main_navigation_screen.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  // Remove automatic initialization to prevent setState during build

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        // Initialize auth if not done yet (safe way)
        if (!authProvider.hasInitialized) {
          // Use Future.microtask to avoid setState during build
          Future.microtask(() {
            if (mounted) {
              authProvider.initializeAuth();
            }
          });
          return const SplashScreen();
        }

        // Show splash screen while loading
        if (authProvider.isLoading) {
          return const SplashScreen();
        }

        // Show main app if user is logged in
        if (authProvider.isLoggedIn && authProvider.currentUser != null) {
          return const MainNavigationScreen(key: ValueKey('main_nav'));
        }

        // Show login screen if user is not logged in
        return const LoginScreen(key: ValueKey('login'));
      },
    );
  }
}
