import 'package:flutter/material.dart'; // ignore_for_file: must_be_immutable
import '../widgets/auth_widgets.dart';

// ignore_for_file: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailInputController = TextEditingController();

  TextEditingController passwordInputController = TextEditingController();

  AuthScreenWidgets widgets = AuthScreenWidgets();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        title: const Text(
          'BuscaCep', style: TextStyle(
          fontFamily: 'Inter',
          color: Color(0XFFFFFFFF),
          fontWeight: FontWeight.w400)),
        backgroundColor: Color(0XFF5DB075),
      ),
        backgroundColor: Color(0XFFFFFFFF),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 14,
            top: 60,
            right: 14,
          ),
          child: Column(
            children: [widgets.buildLoginForm(context, emailInputController, passwordInputController), SizedBox(height: 4)],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  
}
