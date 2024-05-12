import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/* ✅라이트 모드 */
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF000000),
  // 아이콘 색상
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF6EAEE7),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFFFFFFF),
  onBackground: Color(0xFF1A1C18),
  shadow: Color(0xFF000000),
  outlineVariant: Color(0xFFFFFFFF),
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF1A1C18),
);
/* ✅다크 모드 */
const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF000000),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF6EAEE7),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFFCFDF6),
  onBackground: Color(0xFF1A1C18),
  shadow: Color(0xFF000000),
  outlineVariant: Color(0xFFC9D1C7),
  surface: Color(0xFFF9FAF3),
  onSurface: Color(0xFF1A1C18),
);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        lightColorScheme.primary, // Slightly darker shade for the button
      ),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      // text color
      elevation: MaterialStateProperty.all<double>(5.0),
      // shadow
      padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 18)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Adjust as needed
        ),
      ),
    ),
  ),
);

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
);

// 2
TextTheme textTheme() {
  return TextTheme(
    displayLarge: GoogleFonts.notoSans(fontSize: 18.0, color: Colors.black),
    displayMedium: GoogleFonts.notoSans(fontSize: 16.0, color: Colors.black),
    bodyLarge: GoogleFonts.notoSans(
        fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyMedium: GoogleFonts.notoSans(fontSize: 14.0, color: Colors.black),
    titleMedium: GoogleFonts.notoSans(fontSize: 15.0, color: Colors.black),
  );
}

// 3
IconThemeData iconTheme() {
  return const IconThemeData(
    color: Colors.black,
  );
}

// 4
AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: false,
    color: Colors.white,
    elevation: 0.0,
    iconTheme: iconTheme(),
    titleTextStyle: GoogleFonts.nanumGothic(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}

// 5
BottomNavigationBarThemeData bottomNavigatorTheme() {
  return const BottomNavigationBarThemeData(
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.black54,
    showUnselectedLabels: true,
  );
}

// 6
ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    bottomNavigationBarTheme: bottomNavigatorTheme(),
    primarySwatch: Colors.orange,
    dialogTheme: DialogTheme(
      backgroundColor: Colors.transparent,
    ),
  );
}
