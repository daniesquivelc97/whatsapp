import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/extensions/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/utils/color_utils.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.langBtnBgColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        highlightColor: context.theme.langBtnHighlightColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.language,
                color: ColorUtils.greenDark,
              ),
              SizedBox(height: 10),
              Text(
                'English',
                style: TextStyle(
                  color: ColorUtils.greenDark,
                ),
              ),
              SizedBox(height: 10),
              Icon(
                Icons.keyboard_arrow_down,
                color: ColorUtils.greenDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
