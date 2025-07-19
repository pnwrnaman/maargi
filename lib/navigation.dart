import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'LoginPage.dart';
import 'about_us_page.dart';

class NavigationService {
  static void navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  static void navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  static void navigateToAbout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AboutUsPage()),
    );
  }
}
