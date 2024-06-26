import 'package:flutter/material.dart';
import '../widgets/user_widgets.dart';

class UserPage extends StatelessWidget {
    UserPage({super.key});
    
  UserWidgets widgets = UserWidgets();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFFFFFF),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 30,
          ),
          child: Container(child:
            widgets.buildUser(context),
          ),
        ),
      ),
    );
  }
}