import 'package:auth_laravel/controllers/authControllers/register_controller.dart';
import 'package:auth_laravel/utils/constants.dart';
import 'package:auth_laravel/utils/widget_functions.dart';
import 'package:auth_laravel/widgets/Register_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController _signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height / 5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Assets/lines.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(top: 40),
                  child: text(
                    'ONLINE LIBRARY',
                    style: GoogleFonts.quicksand(color: white, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: Get.height / 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 45),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Icon(Icons.arrow_back_ios),
                            ),
                          ),
                          SizedBox(height: 15),
                          text("Create Account",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold, color: black)),
                          SizedBox(height: 20),
                          RegisterForm(),
                          Container(
                            width: 300,
                            height: 52,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              color: black,
                              child: text('Sign Up',
                                  style:
                                      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.normal, color: white)),
                              onPressed: () {
                                if (_signUpController.signUpFormKey.currentState.validate()) {
                                  _signUpController.register();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
