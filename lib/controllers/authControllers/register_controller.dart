import 'package:auth_laravel/controllers/authController.dart';
import 'package:auth_laravel/models/user_model.dart';
import 'package:auth_laravel/services/AuthService.dart';
import 'package:auth_laravel/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RegisterController extends GetxController {
  AuthService _authService = AuthService();
  AuthController _authController = Get.find();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController emailController;
  TextEditingController nameController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;

  Future<void> register() async {
    try {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text;
      var data = await _authService.registerUser(name, email, password);
      print(data);
      if (data['user'] != null) {
        _authController.setCurrentUser = User.fromJson(data['user']);
        _authController.setToken = data['token'];
        _authController.setLoginState = 'yes';
        Get.offAllNamed('/home');
      } else {
        if (data['errors'] != null) {
          Map<String, dynamic> responseErrors = data['errors'];
          print(responseErrors['email']);
          if (responseErrors['name']?.first != null) {
            showWarning(message: responseErrors['name'].first);
          } else if (responseErrors['email']?.first != null) {
            showWarning(message: responseErrors['email'].first);
          } else {
            showWarning(message: responseErrors['password']?.first);
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController?.dispose();
    nameController?.dispose();
    passwordController?.dispose();
    confirmPasswordController?.dispose();
    super.onClose();
  }
}
