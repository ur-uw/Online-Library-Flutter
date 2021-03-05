import 'package:auth_laravel/controllers/authControllers/login_controller.dart';
import 'package:auth_laravel/utils/constants.dart';
import 'package:auth_laravel/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInForm extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginController.loginFormKey,
      child: Column(
        children: [
          buildFormField(
            width: 300,
            fieldController: _loginController.emailController,
            showBorder: true,
            floatLabel: false,
            hintStyle: GoogleFonts.poppins(fontSize: 14),
            hintText: 'Email',
            validator: (value) {
              if (value.isEmpty) {
                return 'This field is required';
              } else if (!value.isEmail) {
                return 'Enter a valid email address';
              } else {
                return null;
              }
            },
            inputBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: black,
              ),
            ),
          ),
          SizedBox(height: 15),
          buildFormField(
            showBorder: true,
            floatLabel: false,
            isPassword: true,
            width: 300,
            validator: (value) {
              if (value.isEmail) {
                return 'This field is required';
              } else if (value.length < 8) {
                return 'Enter at least 8 characters';
              } else {
                return null;
              }
            },
            fieldController: _loginController.passwordController,
            hintStyle: GoogleFonts.poppins(fontSize: 14),
            hintText: 'Password',
            inputBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: black,
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
