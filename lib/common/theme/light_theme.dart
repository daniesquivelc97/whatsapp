import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/extensions/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/utils/color_utils.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    backgroundColor: ColorUtils.backgoundLight,
    scaffoldBackgroundColor: ColorUtils.backgoundLight,
    extensions: [
      CustomThemeExtension.lightMode,
    ],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorUtils.greenLight,
        foregroundColor: ColorUtils.backgoundLight,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
  );
}
