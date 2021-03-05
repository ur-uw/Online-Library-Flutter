import 'package:auth_laravel/controllers/authController.dart';
import 'package:auth_laravel/models/user_model.dart';
import 'package:auth_laravel/services/AuthService.dart';
import 'package:auth_laravel/utils/widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final AuthController _authController = Get.find();
  final AuthService _authService = AuthService();
  TextEditingController emailController;
  TextEditingController passwordController;

  Future<void> login() async {
    try {
      String email = emailController.text.trim();
      String password = passwordController.text;
      print(email);
      var data = await _authService.loginUser(email, password);

      if (data['user'] != null) {
        _authController.setCurrentUser = User.fromJson(data['user']);
        _authController.setToken = data['token'];
        _authController.setLoginState = 'yes';
        Get.offAllNamed('/home');
      } else {
        print(data);
        showWarning(message: 'Incorrect email or password please try again');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }
}
