import 'package:flutter/material.dart';

class Utils {
  static Color blackPrimary = Color(0xff1E1E1E);
  static Color bluePrimary = Color(0xff00C2CB);
  static Color white = Color(0xffFFFFFF);
  static Color black = Color(0xff121111);
  static Color blueText = Color(0xff7CEEFF);
  static Color roundBlue = Color(0xff06A0B5);
  static Color gridColor = Color(0xff436369);
  static LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xff0E0E0E), Color(0xff102B2D), Utils.blackPrimary],
    stops: const [0.0, 0.35, 1.0],
  );
}
