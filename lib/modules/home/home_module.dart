import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/home_page.dart';
import '../consulta_cep/presentation/page/busca_cep_page.dart';


class AppModule extends Module {
  @override
    void routes(r) {
    r.child('/',child: (_,) =>HomePage());
    r.child('/busca_cep',child: (_,) =>BuscaCepPage());
  }
}