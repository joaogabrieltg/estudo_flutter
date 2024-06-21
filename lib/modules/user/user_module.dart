import 'package:flutter_modular/flutter_modular.dart';
import 'package:estudo_flutter/modules/user/presentation/page/user_page.dart';

class UserModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const UserPage());
  }
}
