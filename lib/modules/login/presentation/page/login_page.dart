import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailInputController = TextEditingController();

  TextEditingController passwordInputController = TextEditingController();

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
            left: 14,
            top: 60,
            right: 14,
          ),
          child: Column(
            children: [widgets.buildLoginForm(context, emailInputController, passwordInputController), const SizedBox(height: 4)],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  
}
