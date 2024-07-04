import 'package:flutter/material.dart';
import 'package:estudo_flutter/shared/widgets/global_themes.dart';
import 'package:estudo_flutter/shared/widgets/global_widgets.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

final GlobalWidgets widgets = GlobalWidgets();
final ThemeColors themeColors = ThemeColors();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeColors.white,
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(
            left: 32,
            top: 62,
            right: 32,
          ),
          child: Column(
            children: [
              Text(
                "BuscaCep",
                style: widgets.titleStyle,
              ),
              const SizedBox(height: 42),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(right: 4),
                child: widgets.buildSelection(
                  context,
                  text: "Perfil",
                  iconData: Icons.person,
                  route: '/user',
                  returnable: true,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(right: 4),
                child: widgets.buildSelection(
                  context,
                  text: "Busca Cep",
                  iconData: Icons.search,
                  route: '/busca_cep',
                  returnable: true,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(right: 4),
                child: widgets.buildSelection(
                  context,
                  text: "Busca por Endereço",
                  iconData: Icons.location_on,
                  route: '/busca_cep/endereco',
                  returnable: true,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(right: 4),
                child: widgets.buildSelection(
                  context,
                  text: "Histórico de Busca",
                  iconData: Icons.history,
                  route: '/busca_cep/history',
                  returnable: true,
                ),
              ),
              const SizedBox(height: 4)
            ],
          ),
        ),
      ),
    );
  }
}
