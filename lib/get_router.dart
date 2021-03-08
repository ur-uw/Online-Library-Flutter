import 'package:auth_laravel/controllers/authControllers/bindings/authBindings/loginBinding.dart';
import 'package:auth_laravel/controllers/authControllers/bindings/authBindings/registerBinding.dart';
import 'package:auth_laravel/controllers/booksUsersController/bindings/booksUsersBindings.dart';
import 'package:auth_laravel/controllers/uiControllers/bindings/home_ui_binding.dart';
import 'package:auth_laravel/screens/home_screen.dart';
import 'package:auth_laravel/screens/landing_screen.dart';
import 'package:auth_laravel/screens/log_in_screen.dart';
import 'package:auth_laravel/screens/register_screen.dart';
import 'package:get/get.dart';

import 'controllers/authControllers/bindings/authBindings/authBinding.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: '/', page: () => LandingScreen()),
    GetPage(name: '/login', page: () => LogInScreen(), bindings: [
      AuthBinding(),
      LoginBinding(),
    ]),
    GetPage(name: '/register', page: () => RegisterScreen(), bindings: [
      RegisterBinding(),
      AuthBinding(),
    ]),
    GetPage(name: '/home', page: () => HomeScreen(), bindings: [
      AuthBinding(),
      BooksUsersBinding(),
      HomeScreenUiBindings(),
    ]),
  ];
}
