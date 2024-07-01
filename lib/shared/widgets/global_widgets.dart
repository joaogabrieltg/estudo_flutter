import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'global_themes.dart';

class GlobalWidgets {
  static ThemeColors themeColors = ThemeColors();
  TextStyle textInputStyle = TextStyle(
    color: themeColors.lightGrey,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  TextStyle selectableTextStyle = TextStyle(
    color: themeColors.green,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  TextStyle buttonTextStyle = TextStyle(
    color: themeColors.white,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  TextStyle titleStyle = TextStyle(
    color: themeColors.black,
    fontSize: 30,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  TextStyle menuStyle = TextStyle(
    color: themeColors.grey,
    fontSize: 17,
    fontFamily: 'Signika',
    fontWeight: FontWeight.w400,
  );
  Icon selectArrow = Icon(
    Icons.arrow_forward_ios,
    color: themeColors.iconGreen,
    size: 24,
  );
  Icon menuIcon(IconData iconData) {
    return Icon(
      iconData,
      color: themeColors.white,
      size: 24,
    );
  }

  OutlineInputBorder outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      22,
    ),
    borderSide: BorderSide(
      color: themeColors.greyWhite,
      width: 1,
    ),
  );
  ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color(0XFF5DB075),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        24,
      ),
    ),
    visualDensity: const VisualDensity(
      vertical: -4,
      horizontal: -4,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 14,
    ),
  );

  Widget buildSelection(
    BuildContext context, {
    required String text,
    required IconData iconData,
    required String route,
    required bool returnable,
    modalBuilder,
  }) {
    return GestureDetector(
      onTap: () {
        if (!returnable) {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return modalBuilder(context, text, route);
            },
          );
        }
        else{
          Modular.to.pushNamed(route);}
      },
      child: Container(
        color: Colors
            .transparent, // Add a transparent color to ensure the GestureDetector is effective over the entire row area.
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: themeColors.iconGreen,
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: menuIcon(iconData),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                text,
                style: menuStyle,
              ),
            ),
            const Spacer(),
            selectArrow,
          ],
        ),
      ),
    );
  }
}
