import 'package:auth_laravel/controllers/authController.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(
    isLoggedIn: await AuthController().checkIfUserIsLogged(),
  ));
}
