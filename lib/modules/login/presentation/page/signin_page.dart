import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  AuthScreenWidgets widgets = AuthScreenWidgets();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BuscaCep',
              style: TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0XFFFFFFFF),
                  fontWeight: FontWeight.w400)),
          backgroundColor: const Color(0XFF5DB075),
        ),
        backgroundColor: const Color(0XFFFFFFFF),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(
            left: 14,
            top: 60,
            right: 14,
          ),
          child: Column(
            children: [
              widgets.buildSigninForm(
                  context,
                  usernameController,
                  emailController,
                  passwordController,
                  confirmPasswordController),
              const SizedBox(height: 4)
            ],
          ),
        ),
      ),
    );
  }
}