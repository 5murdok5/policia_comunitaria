import 'package:flutter/cupertino.dart';
import 'package:policiacomunitaria/src/ui/pages/custodia/page.custodia.dart';
import 'package:policiacomunitaria/src/ui/pages/home/page.home.dart';
import 'package:policiacomunitaria/src/ui/pages/login/page.login.dart';
import 'package:policiacomunitaria/src/ui/pages/login/page_register.dart';
import 'package:policiacomunitaria/src/ui/pages/splash/page.splash.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const PageSplash(),
    '/home': (context) => const HomePage(),
    '/login': (context) => const PageLogin(),
    '/register': (context) => const PageRegister(),
    '/custodia': (context) => const PageCustodia(),
  };
}
