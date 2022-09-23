import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/extensions/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/utils/color_utils.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      backgroundColor: ColorUtils.backgoundDark,
      scaffoldBackgroundColor: ColorUtils.backgoundDark,
      extensions: [
        CustomThemeExtension.darkMode,
      ],
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorUtils.greenDark,
          foregroundColor: ColorUtils.backgoundDark,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ));
}
