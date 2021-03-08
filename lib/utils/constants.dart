import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color black = Color(0xff252427);
Color white = Colors.white;
const API_BASE_URL = 'http://10.0.2.2:8000/api';
TextStyle defaultTextStyle = GoogleFonts.poppins(fontSize: 14, color: white);

enum ErrorTypes {
  email,
  password,
  name,
}
