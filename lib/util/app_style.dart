import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color mWhite = Color(0xffffffff);
const Color mGrey = Color.fromRGBO(124, 124, 124, 1);
const Color mGrey2 = Color.fromRGBO(242, 243, 242, 1);
const Color mBlack = Color.fromARGB(255, 0, 0, 0);
const Color mYellow = Color.fromRGBO(232, 190, 19, 1);
const Color mAccent = Color.fromRGBO(152, 255, 152, 0.1);


const double mBorderRadius = 16.0;

final ButtonStyle buttonyellow = ElevatedButton.styleFrom(
  minimumSize: const Size(400, 50), 
  backgroundColor: mYellow,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(mBorderRadius),),
  ),
);

final mBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(mBorderRadius),
  borderSide: BorderSide.none,
);

final mExtraBold = GoogleFonts.poppins(
  color: Colors.black,
  fontWeight: FontWeight.w800,
);

final mBold = GoogleFonts.poppins(
  color: Colors.black,
  fontWeight: FontWeight.w700,
);

final mSemibold = GoogleFonts.poppins(
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

final mMedium = GoogleFonts.poppins(
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

final mRegular = GoogleFonts.poppins(
  color: Colors.black,
  fontWeight: FontWeight.w400,
);
