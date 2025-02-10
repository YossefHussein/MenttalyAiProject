import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/features/presentation/auth_screens/pages/login_page.dart';
import 'package:mental_health_app/presentation/home_screen/home_screen.dart';
import 'package:mental_health_app/presentation/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  Future<bool> _checkOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    return prefs.getBool('onboarding_completed') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        // this for lenten on change in firebase
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return const HomeScreen();
          } else {
            // If the user is not authenticated, check if onboarding is completed
            return FutureBuilder<bool>(
              future: _checkOnboardingCompleted(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show a loading indicator while checking onboarding status
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(), // Loading indicator
                        SizedBox(height: 16), // Add some spacing
                        Text("Loading..."), // Optional: Add a loading message
                      ],
                    ),
                  );
                } else {
                  if (snapshot.data == false) {
                    // If onboarding is not completed, show the onboarding screen
                    return const OnboardingScreen();
                  } else {
                    // If onboarding is completed, show the login screen
                    return const LogInScreen();
                  }
                }
              },
            );
          }
        },
      ),
    );
  }
}
