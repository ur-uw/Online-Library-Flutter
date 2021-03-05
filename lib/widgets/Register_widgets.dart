import 'package:auth_laravel/controllers/authControllers/register_controller.dart';
import 'package:auth_laravel/utils/constants.dart';
import 'package:auth_laravel/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterForm extends StatelessWidget {
  final RegisterController _signUpController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpController.signUpFormKey,
      child: Column(
        children: [
          buildFormField(
            fieldController: _signUpController.nameController,
            width: 300,
            showBorder: true,
            floatLabel: false,
            validator: (value) {
              if (value.isEmpty)
                return 'This field is required';
              else
                return null;
            },
            hintStyle: GoogleFonts.poppins(fontSize: 14),
            hintText: 'Full Name',
            inputBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: black,
              ),
            ),
          ),
          SizedBox(height: 15),
          buildFormField(
            fieldController: _signUpController.emailController,
            width: 300,
            showBorder: true,
            floatLabel: false,
            validator: (value) {
              if (value.isEmpty) {
                return 'This Field is required';
              } else if (!value.isEmail) {
                return 'Enter a valid email address';
              } else {
                return null;
              }
            },
            hintStyle: GoogleFonts.poppins(fontSize: 14),
            hintText: 'Email',
            inputBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: black,
              ),
            ),
          ),
          SizedBox(height: 15),
          buildFormField(
            fieldController: _signUpController.passwordController,
            showBorder: true,
            floatLabel: false,
            isPassword: true,
            width: 300,
            validator: (value) {
              if (value.isEmpty) {
                return 'This field is required';
              } else if (value.length < 8) {
                return 'Password must be at least 8 characters';
              } else if (value != _signUpController.confirmPasswordController.text) {
                return 'Passwords must match';
              } else {
                return null;
              }
            },
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
          buildFormField(
            fieldController: _signUpController.confirmPasswordController,
            isPassword: true,
            showBorder: true,
            floatLabel: false,
            width: 300,
            hintStyle: GoogleFonts.poppins(fontSize: 14),
            hintText: 'Confirm Password',
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
