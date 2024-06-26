import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  TextEditingController usernameoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordoneController = TextEditingController();

  TextEditingController passwordconfirmController = TextEditingController();

  AuthScreenWidgets widgets = AuthScreenWidgets();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFFFFFF),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(
            left: 16,
            top: 58,
            right: 16,
          ),
          child: Column(
            children: [
              const Text(
                "Cadastre-se",
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 32),
              _buildUserInputSection(context),
              const SizedBox(height: 30),
              widgets.buildAuthButton(context,"Cadastrar"),
              const SizedBox(height: 8),
              RichText(
                text: const TextSpan(
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
              const SizedBox(height: 4)
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
              style: const TextStyle(
                color: Color(0XFFBDBDBD),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              decoration: const InputDecoration(
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
          const SizedBox(height: 16),
          SizedBox(
            width: 342,
            child: TextFormField(
              focusNode: FocusNode(),
              autofocus: true,
              controller: emailController,
              style: const TextStyle(
                color: Color(0XFFBDBDBD),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              decoration: const InputDecoration(
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
          const SizedBox(height: 16),
          SizedBox(
            width: 342,
            child: TextFormField(
              focusNode: FocusNode(),
              autofocus: true,
              controller: passwordoneController,
              style: const TextStyle(
                color: Color(0XFFBDBDBD),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
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
          const SizedBox(height: 16),
          SizedBox(
            width: 342,
            child: TextFormField(
              focusNode: FocusNode(),
              autofocus: true,
              controller: passwordconfirmController,
              style: const TextStyle(
                color: Color(0XFFBDBDBD),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
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
        ),
        onPressed: () {},
        child: const Text(
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