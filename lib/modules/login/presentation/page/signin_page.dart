import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController usernameoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordoneController = TextEditingController();

  TextEditingController passwordconfirmController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 16,
            top: 58,
            right: 16,
          ),
          child: Column(
            children: [
              Text(
                "Cadastre-se",
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 32),
              _buildUserInputSection(context),
              SizedBox(height: 30),
              _buildSignupButton(context),
              SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Já tem uma conta? ",
                      style: TextStyle(
                        color: Color(0XFF5DB075),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "Acesse-a",
                      style: TextStyle(
                        color: Color(0XFF5DB075),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 4)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserInputSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            width: 342,
            child: TextFormField(
              focusNode: FocusNode(),
              autofocus: true,
              controller: usernameoneController,
              style: TextStyle(
                color: Color(0XFFBDBDBD),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: "Nome de usuário",
                hintStyle: TextStyle(
                  color: Color(0XFFBDBDBD),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: Color(0XFFFFFFFF),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            width: 342,
            child: TextFormField(
              focusNode: FocusNode(),
              autofocus: true,
              controller: emailController,
              style: TextStyle(
                color: Color(0XFFBDBDBD),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(
                  color: Color(0XFFBDBDBD),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: Color(0XFFFFFFFF),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            width: 342,
            child: TextFormField(
              focusNode: FocusNode(),
              autofocus: true,
              controller: passwordoneController,
              style: TextStyle(
                color: Color(0XFFBDBDBD),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "Senha",
                hintStyle: TextStyle(
                  color: Color(0XFFBDBDBD),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(30, 14, 16, 14),
                  child: Text(
                    "Show",
                    style: TextStyle(
                      color: Color(0XFF5DB075),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                suffixIconConstraints: BoxConstraints(
                  maxHeight: 50,
                ),
                filled: true,
                fillColor: Color(0XFFFFFFFF),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            width: 342,
            child: TextFormField(
              focusNode: FocusNode(),
              autofocus: true,
              controller: passwordconfirmController,
              style: TextStyle(
                color: Color(0XFFBDBDBD),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "Confirmar Senha",
                hintStyle: TextStyle(
                  color: Color(0XFFBDBDBD),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: Color(0XFFFFFFFF),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSignupButton(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFF5DB075),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              24,
            ),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 14,
          ),
        ),
        onPressed: () {},
        child: Text(
          "Cadastrar",
          style: TextStyle(
            color: Color(0XFFFFFFFF),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}