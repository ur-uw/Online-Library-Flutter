import 'package:auth_laravel/utils/constants.dart';
import 'package:auth_laravel/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Assets/lines.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(top: 50),
                  child: text(
                    'ONLINE LIBRARY',
                    style: GoogleFonts.quicksand(color: white, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height / 3.5),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('Assets/books.png'),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: text(
                        "Welcome to the Online Library. A service "
                        "dedicated to knowledgeable people of the world. This is one of the largest and most "
                        "authoritative collections of online journals, books, and research resources,covering  "
                        "lief, health, social and physical sciences.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.normal, color: black),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: 220,
                      height: 52,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        color: black,
                        child: text('Sign Up',
                            style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.normal, color: white)),
                        onPressed: () => Get.toNamed('/register'),
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Container(
                      width: 220,
                      height: 52,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: black, width: 3),
                        ),
                        child: text('Sign In',
                            style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.normal, color: black)),
                        onPressed: () => Get.toNamed('/login'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
