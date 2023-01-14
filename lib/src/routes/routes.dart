import 'package:flutter/cupertino.dart';
import 'package:policiacomunitaria/src/ui/pages/home/page.home.dart';
import 'package:policiacomunitaria/src/ui/pages/login/page.login.dart';
import 'package:policiacomunitaria/src/ui/pages/splash/page.splash.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashPage(),
    '/home': (context) => const HomePage(),
    '/login': (context) => const LoginPage(),
  };
}
