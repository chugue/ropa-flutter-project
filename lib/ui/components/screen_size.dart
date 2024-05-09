import 'package:flutter/material.dart';

class ScreenSize {
  static double getScreenWidth(BuildContext context, {double factor = 1.0}) {
    return MediaQuery.of(context).size.width * factor;
  }
}
