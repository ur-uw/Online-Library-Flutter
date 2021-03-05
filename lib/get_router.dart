import 'package:auth_laravel/controllers/bindings/authBindings/authBinding.dart';
import 'package:auth_laravel/controllers/bindings/authBindings/loginBinding.dart';
import 'package:auth_laravel/controllers/bindings/authBindings/registerBinding.dart';
import 'package:auth_laravel/screens/home_screen.dart';
import 'package:auth_laravel/screens/landing_screen.dart';
import 'package:auth_laravel/screens/log_in_screen.dart';
import 'package:auth_laravel/screens/register_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: '/', page: () => LandingScreen()),
    GetPage(name: '/home', page: () => HomeScreen(), binding: AuthBinding()),
    GetPage(name: '/login', page: () => LogInScreen(), bindings: [
      AuthBinding(),
      LoginBinding(),
    ]),
    GetPage(name: '/signUp', page: () => RegisterScreen(), bindings: [
      RegisterBinding(),
      AuthBinding(),
    ]),
  ];
}
