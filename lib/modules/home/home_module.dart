import 'package:estudo_flutter/modules/consulta_cep/consulta_cep_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
//import 'presentation/home_page.dart';
import 'presentation/pages/home_page.dart';
import 'package:estudo_flutter/modules/user/user_module.dart';

class HomeModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => HomePage());
    r.module('/busca_cep/', module: ConsultaCepModule());
    r.module('/user', module: UserModule());
  }
}
