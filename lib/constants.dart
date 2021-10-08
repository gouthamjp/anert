import 'package:flutter/material.dart';
class GreenTvmTheme{
  GreenTvmTheme._();

  //Fonts
  static const fontReg = 'Inter';
  static const fontBld = 'Inter Bold';
  static const fontExtraBold = 'Inter ExtraBold';
  static const fontMedium = 'Inter Medium';
  static const fontSemiBold = 'Inter SemiBold';
  

  //Colors
  static const Color primaryBlue= Color(0xFF243DE2);
  static const Color textColor = Color(0xFF0F172A);
  static const Color descriptionTextColor = Color(0xFF64748B);
  static const Color secondaryGray = Color(0xFFE0E2E7);
  
  
  static const TextStyle appBarTextStyle = TextStyle(
  color: textColor,
  fontSize: 16,
  fontFamily: fontMedium,
  );

  static const TextStyle frontTitle = TextStyle(
  color: primaryBlue,
  fontSize: 42,
  fontFamily: fontExtraBold,
  fontWeight: FontWeight.w900,
  );

  static const TextStyle descriptionTextStyle = TextStyle(
  color: descriptionTextColor,
  fontSize: 14,
  fontFamily: fontReg,
  );

  static const TextStyle buttonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontFamily: fontMedium,
  );
  
  static const TextStyle fieldHeading = TextStyle(
  color: textColor,
  fontSize: 16,
  fontFamily: fontReg,
  );
  
 static const TextStyle hintTextStyle = TextStyle(
  color: descriptionTextColor,
  fontSize: 16,
  fontFamily: fontReg,
  );
}


