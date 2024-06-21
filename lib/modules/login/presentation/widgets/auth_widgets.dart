import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../shared/mobx/auth_store.dart';

class AuthScreenWidgets {
  Widget buildEmailInput(
      BuildContext context, TextEditingController emailInputController) {
    return SizedBox(
      width: 342,
      child: TextFormField(
        focusNode: FocusNode(),
        autofocus: true,
        controller: emailInputController,
        decoration: InputDecoration(
          labelText: "Login",
          labelStyle: TextStyle(
            color: Color(0XFFBDBDBD),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          hintText: "Login",
          hintStyle: TextStyle(
            color: Color(0XFFBDBDBD),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Color(0XFFFFFFFF),
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
        ),
        style: TextStyle(
          color: Color(0XFFBDBDBD),
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  /// Section Widget
  // ignore: use_function_type_syntax_for_parameters
  Widget buildPasswordInput(
      BuildContext context, TextEditingController passwordInputController) {
        final AuthStore authStore = AuthStore();
    return Observer(builder: (_) {
      return SizedBox(
        width: 342,
        child: TextFormField(
          focusNode: FocusNode(),
          autofocus: true,
          controller: passwordInputController,
          style: TextStyle(
            color: Color(0XFFBDBDBD),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          textInputAction: TextInputAction.done,
          obscureText: authStore.isObscure,
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
              child: GestureDetector(
                onTap: () {
                  //fazer funcionar
                  authStore.changeObscureText();
                },
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
            ),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 50,
            ),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      );
    });
  }

  /// Section Widget
  Widget buildLoginButton(BuildContext context) {
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
        onPressed: () {
          //Envia p/ store
          Modular.to.pushNamed('/home/');
        },
        child: Text(
          "Login",
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

  /// Section Widget
  Widget buildLoginForm(
      BuildContext context,
      TextEditingController emailInputController,
      TextEditingController passwordInputController) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Text(
            "Login",
            style: TextStyle(
              color: Color(0XFF000000),
              fontSize: 30,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 28),
          buildEmailInput(context, emailInputController),
          SizedBox(height: 16),
          buildPasswordInput(context, passwordInputController),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Modular.to.pushNamed(
                  '/register/'); //TODO: Implementar a redefinição de senha
            },
            child: Text(
              "Esqueceu sua senha?",
              style: TextStyle(
                color: Color(0XFF5DB075),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 124),
          buildLoginButton(context),
          SizedBox(height: 16),
          GestureDetector(
              onTap: () {
                Modular.to.pushNamed('/register/');
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Não tem conta? ",
                      style: TextStyle(
                        color: Color(0XFF5DB075),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "Cadastre-se",
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
              ))
        ],
      ),
    );
  }
}
