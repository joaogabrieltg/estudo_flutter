import 'package:flutter/material.dart';
import 'package:estudo_flutter/shared/widgets/global_widgets.dart';
import 'package:estudo_flutter/shared/widgets/global_themes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserWidgets {
  static GlobalWidgets widgets = GlobalWidgets();
  static ThemeColors themeColors = ThemeColors();

  Widget buildSelection(
    BuildContext context, {
    required String text,
    required IconData iconData,
    required String route,
    required bool returnable,
  }) {
    return GestureDetector(
      onTap: () {
        if (!returnable) {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return modalBuilderLogout(context, text, route);
            },
          );
          //Modular.to.navigate(route);
        } else {
          //Modular.to.pushNamed(route);
        }
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
              child: Icon(
                iconData,
                color: themeColors.white,
                size: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                text,
                style: TextStyle(
                  color: themeColors.grey,
                  fontSize: 17,
                  fontFamily: 'Signika',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: themeColors.iconGreen,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  //title, mainText, buttonText, underlineText, underlineTextColor, route
  Widget modalBuilderLogout(BuildContext context, String text, String route) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: themeColors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 32,
            decoration: BoxDecoration(
              color: themeColors.greyWhite,
              borderRadius: BorderRadius.circular(
                2,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "Tem Certeza?",
            style: TextStyle(
              color: themeColors.black,
              fontSize: 24,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Tem certeza que deseja sair do app?",
            style: TextStyle(
              color: themeColors.grey,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 56),
          SizedBox(
            width: double.maxFinite,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColors.green,
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
              ),
              onPressed: () {
                 Modular.to.pushNamed('/');
              },
              child: Text(
                "Sim, tenho!",
                style: widgets.buttonTextStyle,
              ),
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child:Text(
            "Cancelar",
            style: widgets.selectableTextStyle.copyWith(decoration: TextDecoration.underline),
          ),
          ),
          
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  //title, mainText, buttonText, underlineText, underlineTextColor, route
  Widget modalBuilderExcluir(BuildContext context, String route) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: themeColors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 32,
            decoration: BoxDecoration(
              color: themeColors.white,
              borderRadius: BorderRadius.circular(
                2,
              ),
            ),
          ),
          const SizedBox(height: 38),
          Text(
            "Excluir conta?",
            style: widgets.titleStyle.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: double.maxFinite,
            child: Text(
              "Esta ação vai excluir sua conta permanentemente e ela não poderá ser revertida",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: widgets.textInputStyle.copyWith(color: themeColors.grey),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.maxFinite,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColors.green,
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
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar", style: widgets.buttonTextStyle),
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Modular.to.pushNamed('/');
            },
            child: Text(
            "Excluir conta",
            style: widgets.selectableTextStyle.copyWith(
                color: themeColors.red, decoration: TextDecoration.underline),
          ),
          ),          
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget buildUser(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 20),
      Text(
        "Perfil",
        style: widgets.titleStyle.copyWith(color: themeColors.darkGrey),
      ),
      Text(
        "Username",
        style: widgets.titleStyle
            .copyWith(color: themeColors.darkGrey, fontSize: 25),
      ),
      const SizedBox(height: 20),
      Container(
        width: double.maxFinite,
        margin: const EdgeInsets.only(right: 4),
        child: buildSelection(
          context,
          text: "Editar Perfil",
          iconData: Icons.person,
          route: "/edit_profile",
          returnable: true,
        ),
      ),
      const SizedBox(height: 16),
      Container(
        width: double.maxFinite,
        margin: const EdgeInsets.only(right: 4),
        child: buildSelection(
          context,
          text: "Sair",
          iconData: Icons.logout,
          route: "/",
          returnable: false,
        ),
      ),
      const Spacer(),
      GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return modalBuilderExcluir(context, "Excluir conta");
            },
          );
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Não gostou do app? ",
                style: widgets.textInputStyle
                    .copyWith(color: themeColors.red, fontSize: 14),
              ),
              TextSpan(
                  text: "Excluir conta",
                  style: widgets.textInputStyle.copyWith(
                      color: themeColors.red,
                      fontSize: 14,
                      decoration: TextDecoration.underline)),
            ],
          ),
        ),
      ),
    ]);
  }
}