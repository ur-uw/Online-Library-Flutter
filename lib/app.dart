import 'package:auth_laravel/get_router.dart';
import 'package:auth_laravel/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  final bool isLoggedIn;

  const App({@required this.isLoggedIn});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: black,
        accentColor: white,
        appBarTheme: AppBarTheme(
          backgroundColor: black,
        ),
      ),
      initialRoute: isLoggedIn ? '/home' : '/',
    );
  }
}
