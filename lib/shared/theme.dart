import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color whiteColor = const Color(0xFFFFFFFF);
Color blackColor = const Color(0xFF1D1617);
Color redColor = const Color(0xFFED3443);
Color greyColor = const Color(0xFF9B9B9B);
Color lightGreyColor = const Color(0xFFF2F4F7);
Color yellowColor = const Color(0xFFE59500);
Color greenColor = const Color(0xFF18B23C);
Color purpleColor = const Color(0xFF633FB0);
Color lightBackgroundColor = const Color(0xffF6F8FB);
Color darkBackgroundColor = const Color(0xFF121212);

Color blueColor1 = const Color(0xff92A3FD);
Color blueColor2 = const Color(0xff9DCEFF);
Color purpleColor1 = const Color(0xffC58BF2);
Color purpleColor2 = const Color(0xffEEA4CE);

Gradient primaryGradien = const LinearGradient(colors: [
  Color(0xff92A3FD),
  Color(0xff9DCEFF),
]); //

Gradient secondaryGradien = const LinearGradient(colors: [
  Color(0xffC58BF2),
  Color(0xffEEA4CE),
]); //

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: whiteColor,
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  color: const Color(0xFF778293),
);

TextStyle purpleTextStyle = GoogleFonts.poppins(
  color: purpleColor,
);

TextStyle yellowTextStyle = GoogleFonts.poppins(
  color: yellowColor,
);

TextStyle greenTextStyle = GoogleFonts.poppins(
  color: greenColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
