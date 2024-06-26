import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../shared/mobx/auth_store.dart';
import 'package:estudo_flutter/shared/widgets/global_widgets.dart';


class AuthScreenWidgets {
  
  TextStyle textInputStyle = GlobalWidgets().textInputStyle;
  TextStyle selectableTextStyle = GlobalWidgets().selectableTextStyle;
  TextStyle buttonTextStyle = GlobalWidgets().buttonTextStyle;
  TextStyle titleStyle = GlobalWidgets().titleStyle;

  Widget buildTextInput(BuildContext context,
      TextEditingController emailInputController, String label) {
    return SizedBox(
      width: 342,
      child: TextFormField(
        focusNode: FocusNode(),
        autofocus: true,
        controller: emailInputController,
        style: textInputStyle,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: textInputStyle,
          labelStyle: textInputStyle,
        ),
      ),
    );
  }

  /// Section Widget
  Widget buildPasswordInput(BuildContext context,
      TextEditingController passwordInputController, bool confirmarSenha) {
    final AuthStore authStore = AuthStore();
    return Observer(builder: (_) {
      return SizedBox(
        width: 342,
        child: TextFormField(
          focusNode: FocusNode(),
          autofocus: true,
          controller: passwordInputController,
          style: textInputStyle,
          textInputAction: TextInputAction.done,
          obscureText: authStore.isObscure,
          decoration: InputDecoration(
            hintText: confirmarSenha ? "Confirmar Senha" : "Senha",
            hintStyle: textInputStyle,
            suffixIcon: confirmarSenha
                ? null
                : Padding(
                    padding: const EdgeInsets.fromLTRB(30, 14, 16, 14),
                    child: GestureDetector(
                      onTap: () {
                        //fazer funcionar
                        authStore.changeObscureText();
                      },
                      child: Text(
                        "Show",
                        style: selectableTextStyle,
                      ),
                    ),
                  ),
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 50,
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 14,
            ),
          ),
        ),
      );
    });
  }

  /// Section Widget
  Widget buildAuthButton(BuildContext context, String label) {
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
        onPressed: () {
          //Envia p/ store
          Modular.to.pushNamed('/home/');
        },
        child: Text(
          label,
          style: buttonTextStyle,
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
            style: titleStyle,
          ),
          const SizedBox(height: 28),
          buildTextInput(context, emailInputController, "Login"),
          const SizedBox(height: 16),
          buildPasswordInput(context, passwordInputController, false),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Modular.to.pushNamed(
                  '/register/'); //TODO: Implementar a redefinição de senha
            },
            child: Text(
              "Esqueceu sua senha?",
              style: selectableTextStyle,
            ),
          ),
          const SizedBox(height: 124),
          buildAuthButton(context, "Login"),
          const SizedBox(height: 16),
          GestureDetector(
              onTap: () {
                Modular.to.pushNamed('/register/');
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Não tem conta? ",
                      style: selectableTextStyle,
                    ),
                    TextSpan(
                      text: "Cadastre-se",
                      style: selectableTextStyle.copyWith(decoration: TextDecoration.underline),
                    )
                  ],
                ),
                textAlign: TextAlign.left,
              ))
        ],
      ),
    );
  }

  Widget buildSigninForm(
      BuildContext context,
      TextEditingController usernameInputController,
      TextEditingController emailInputController,
      TextEditingController passwordInputController,
      TextEditingController confirmPasswordInputController) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Text(
            "Cadastre-se",
            style: titleStyle,
          ),
          const SizedBox(height: 28),
          buildTextInput(context, usernameInputController, "Nome de Usuário"),
          const SizedBox(height: 16),
          buildTextInput(context, emailInputController, "Email"),
          const SizedBox(height: 16),
          buildPasswordInput(context, passwordInputController, false),
          const SizedBox(height: 16),
          buildPasswordInput(context, confirmPasswordInputController, true),
          const SizedBox(height: 124),
          buildAuthButton(context, "Cadastre-se"),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Modular.to.pushNamed('/');
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Já tem uma conta? ",
                    style:selectableTextStyle,
                  ),
                  TextSpan(
                    text: "Acesse-a",
                    style: selectableTextStyle.copyWith(decoration: TextDecoration.underline),
                  )
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
