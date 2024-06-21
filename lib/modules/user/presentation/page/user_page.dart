import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key})
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
          padding: EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 30,
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Perfil",
                style: TextStyle(
                  color: Color(0XFF272727),
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Username",
                style: TextStyle(
                  color: Color(0XFF272727),
                  fontSize: 25,
                  fontFamily: 'Signika',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(right: 4),
                child: _buildSelection(
                  context,
                  text: "Editar Perfil",
                  iconData: Icons.person,
                  route: "/edit_profile",
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(right: 4),
                child: _buildSelection(
                  context,
                  text: "Sair",
                  iconData: Icons.logout,
                  route: "/../../",
                ),
              ),
              Spacer(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Não gostou do app? ",
                      style: TextStyle(
                        color: Color(0XFFE26565),
                        fontSize: 15,
                        fontFamily: 'Signika',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "Excluir conta",
                      style: TextStyle(
                        color: Color(0XFFE26565),
                        fontSize: 15,
                        fontFamily: 'Signika',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
                textAlign: TextAlign.left,
              )
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
