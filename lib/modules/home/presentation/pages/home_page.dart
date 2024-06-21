import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 32,
            top: 62,
            right: 32,
          ),
          child: Column(
            children: [
              Text(
                "BuscaCep",
                style: TextStyle(
                  color: Color(0XFF272727),
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 42),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(right: 4),
                child: _buildSelection(
                  context,
                  text: "Perfil",
                  iconData: Icons.person,
                  route: '/user',
                ),
              ),
              SizedBox(height: 14),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(right: 4),
                child: _buildSelection(
                  context,
                  text: "Busca Cep",
                  iconData: Icons.search,
                  route: '/busca_cep',
                ),
              ),
              SizedBox(height: 14),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(right: 4),
                child: _buildSelection(
                  context,
                  text: "Histórico de Busca",
                  iconData: Icons.history,
                  route: '/busca_cep/history',
                ),
              ),
              SizedBox(height: 4)
            ],
          ),
        ),
      ),
    );
  }

  /// Common widget
Widget _buildSelection(
  BuildContext context, {
  required String text,
  required IconData iconData,
  required String route,
}) {
  return GestureDetector(
    onTap: () {
      Modular.to.pushNamed(route);
    },
    child: Container(
      color: Colors.transparent, // Add a transparent color to ensure the GestureDetector is effective over the entire row area.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Color(0XFF91C788),
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            padding: EdgeInsets.all(12),
            child: Icon(
              iconData,
              color: Color(0XFFFFFFFF),
              size: 24,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              text,
              style: TextStyle(
                color: Color(0XFF707070),
                fontSize: 17,
                fontFamily: 'Signika',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Color(0XFF5DB075),
            size: 24,
          ),
        ],
      ),
    ),
  );
}
}
