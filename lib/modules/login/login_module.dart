import 'package:estudo_flutter/modules/home/home_module.dart';
import 'package:estudo_flutter/modules/login/presentation/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void routes(r) {
    r.child('/',child: (context) => LoginPage());
    r.module('/home/',module: HomeModule());
  }
}