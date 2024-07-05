import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/busca_cep_store.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/widgets/busca_widgets.dart';
import 'package:estudo_flutter/shared/mobx/cidade_estado_store.dart';
import 'package:estudo_flutter/shared/mobx/loading_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:estudo_flutter/shared/widgets/global_themes.dart';
import 'package:estudo_flutter/shared/widgets/global_widgets.dart';

class BuscaCepPage extends StatefulWidget {
  const BuscaCepPage({super.key});
  @override
  _BuscaCepPageState createState() => _BuscaCepPageState();
}

final GlobalWidgets widgets = GlobalWidgets();
final ThemeColors themeColors = ThemeColors();

class _BuscaCepPageState extends State<BuscaCepPage> {
  final loadingStore = LoadingStore();
  final TextEditingController _textController = TextEditingController();
  String _displayText = '';
  final BuscaCepStore _buscaCepStore = Modular.get<BuscaCepStore>();
  final CidadeEstadoStore buscaCepPageStore = CidadeEstadoStore();
  BuscaWidgets buscaWidgets = BuscaWidgets();


  Future<void> _confirmText() async {
    loadingStore.isLoading = true;
    final String cep = _textController.text;
    try {
      final String cepText = await _buscaCepStore.getText(cep);
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        loadingStore.isLoading = false;
        _displayText = cepText;
      });
    } catch (e) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        loadingStore.isLoading = false;
        _displayText = 'Erro ao fazer a requisição. Detalhes: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeColors.white,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(
            left: 36,
            top: 62,
            right: 36,
          ),
          child: Column(
            children: [
              Text(
                "BuscaCep",
                style: widgets.titleStyle,
              ),
              const SizedBox(height: 86),
              buscaWidgets.buildCepInput(_textController, "Digite o CEP para a busca"),
              const SizedBox(height: 10),
              buscaWidgets.confirmButton(_confirmText),
              const SizedBox(height: 40),
              Observer(builder: (_) {
                LoadingStore loadingStore = LoadingStore();
                if (loadingStore.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Text(
                    _displayText,
                    style: widgets.textInputStyle,
                  );
                }
              }),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
