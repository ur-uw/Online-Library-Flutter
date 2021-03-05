import 'package:auth_laravel/controllers/authController.dart';
import 'package:auth_laravel/services/AuthService.dart';
import 'package:auth_laravel/utils/constants.dart';
import 'package:auth_laravel/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          child: Obx(() {
            if (_authController != null && _authController.currentUsr != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  text(
                    '${_authController.currentUsr.name} \n'
                    'Token: ${_authController.getToken}',
                    color: white,
                  ),
                  TextButton(
                    onPressed: () async {
                      FlutterSecureStorage storage = FlutterSecureStorage();
                      await storage.deleteAll();
                      AuthService().logOut(_authController.getToken);
                      Get.offAllNamed('/');
                    },
                    child: text('Log out'),
                  ),
                ],
              );
            } else {
              return Center(
                child: text('loading...', color: white, fontSize: 36),
              );
            }
          }),
        ),
      ),
    );
  }
}
