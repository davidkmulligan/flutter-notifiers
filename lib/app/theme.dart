import 'package:flutter/material.dart';

// abstract class Light {
//   static Color primary = const Color(0xFF006C4B);
//   static Color onPrimary = const Color(0xFFFFFFFF);
//   static Color primaryContainer = const Color(0xFF89F8C7);
//   static Color onPrimaryContainer = const Color(0xFF002114);

//   static Color secondary = const Color(0xFF4D6357);
//   static Color onSecondary = const Color(0xFFFFFFFF);
//   static Color secondaryContainer = const Color(0xFFCFE8D9);
//   static Color onSecondaryContainer = const Color(0xFF0A1F16);

//   static Color background = const Color(0xFFFBFDF9);
//   static Color onBackground = const Color(0xFF191C1A);
//   static Color backgroundFaded = const Color(0x38FBFDF9);

//   static Color surface = const Color(0xFFEAF3EB);
//   static Color onSurface = const Color(0xFF191C1A);
//   static Color onSurfaceAccent = const Color(0xFFC0C9C2);

//   static Color outline = const Color(0xFF191C1A);
// }

abstract class Palette {
  static Color primary = const Color(0xFF006C4B);

  static Color surface = const Color(0xFFEAF3EB);

  static Color secondaryContainer = const Color(0xFF006C4B);

  static Color error = const Color(0xFF9E1035);

  static Color background = const Color(0xFFFBFDF9);
  static Color onBackground = const Color(0xFF191C1A);
  static Color onBackgroundFaded = const Color(0x74191C1A);
}

abstract class Typography {
  static TextStyle headline(Color color) {
    return TextStyle(
      fontFamily: 'Manrope',
      fontSize: 22.0,
      letterSpacing: 0.0,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle headline2(Color color) {
    return TextStyle(
      fontFamily: 'Manrope',
      fontSize: 18.0,
      letterSpacing: 0.0,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle body(Color color) {
    return TextStyle(
      fontFamily: 'Manrope',
      fontSize: 14.0,
      letterSpacing: 0.52,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle label(Color color) {
    return TextStyle(
      fontFamily: 'Manrope',
      fontSize: 12.0,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }
}

//   static TextStyle bodyMedium(Color color) => TextStyle(
//         fontFamily: 'Manrope',
//         // height: 20.0,
//         fontSize: 14.0,
//         letterSpacing: 0.52,
//         fontWeight: FontWeight.w400,
//         color: color,
//       );

// abstract class Typography {
//   static TextStyle display(Color color) => TextStyle(
//         fontFamily: 'Manrope',
//         // height: 44.0,
//         fontSize: 36.0,
//         letterSpacing: 0.0,
//         fontWeight: FontWeight.w400,
//         color: color,
//       );

//   static TextStyle headlineMedium(Color color) => TextStyle(
//         fontFamily: 'Manrope',
//         // height: 36.0,
//         fontSize: 28.0,
//         letterSpacing: 0.0,
//         fontWeight: FontWeight.w400,
//         color: color,
//       );

//   static TextStyle headlineSmall(Color color) => TextStyle(
//         fontFamily: 'Manrope',
//         // height: 32.0,
//         fontSize: 24.0,
//         letterSpacing: 0.0,
//         fontWeight: FontWeight.w400,
//         color: color,
//       );

//   static TextStyle titleLarge(Color color) => TextStyle(
//       fontFamily: 'Manrope',
//       // height: 28.0,
//       fontSize: 22.0,
//       letterSpacing: 0.0,
//       fontWeight: FontWeight.w400,
//       color: color);

//   static TextStyle titleMedium(Color color) => TextStyle(
//         fontFamily: 'Manrope',
//         // height: 24.0,
//         fontSize: 18.0,
//         letterSpacing: 0.15,
//         fontWeight: FontWeight.w500,
//         color: color,
//       );

//   static TextStyle titleSmall(Color color) => TextStyle(
//         fontFamily: 'Manrope',
//         // height: 20.0,
//         fontSize: 16.0,
//         letterSpacing: 0.1,
//         fontWeight: FontWeight.w500,
//         color: color,
//       );

//   static TextStyle labelLarge(Color color) => TextStyle(
//         fontFamily: 'Manrope',
//         // height: 20.0,
//         fontSize: 14.0,
//         letterSpacing: 0.1,
//         fontWeight: FontWeight.w500,
//         color: color,
//       );

//   static TextStyle labelMedium(Color color) => TextStyle(
//         fontFamily: 'Manrope',
//         // height: 16.0,
//         fontSize: 12.0,
//         letterSpacing: 0.5,
//         fontWeight: FontWeight.w500,
//         color: color,
//       );

//   static TextStyle labelSmall(Color color) => TextStyle(
//         fontFamily: 'Manrope',
//         // height: 6.0,
//         fontSize: 11.0,
//         letterSpacing: 0.5,
//         fontWeight: FontWeight.w500,
//         color: color,
//       );

//   static TextStyle bodyLarge(Color color) => TextStyle(
//         fontFamily: 'Manrope',
//         // height: 24.0,
//         fontSize: 16.0,
//         letterSpacing: 0.15,
//         fontWeight: FontWeight.w400,
//         color: color,
//       );

//   static TextStyle bodyMedium(Color color) => TextStyle(
//         fontFamily: 'Manrope',
//         // height: 20.0,
//         fontSize: 14.0,
//         letterSpacing: 0.52,
//         fontWeight: FontWeight.w400,
//         color: color,
//       );

//   static TextStyle bodySmall(Color color) => TextStyle(
//         fontFamily: 'Manrope',
//         // height: 16.0,
//         fontSize: 12.0,
//         letterSpacing: 0.4,
//         fontWeight: FontWeight.w400,
//         color: color,
//       );
// }
