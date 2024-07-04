import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/busca_cep_store.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/widgets/busca_widgets.dart';
import 'package:estudo_flutter/shared/mobx/cidade_estado_store.dart';
import 'package:estudo_flutter/shared/mobx/loading_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:estudo_flutter/shared/widgets/global_themes.dart';
import 'package:estudo_flutter/shared/widgets/global_widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BuscaLogradouroPage extends StatefulWidget {
  const BuscaLogradouroPage({super.key});
  @override
  _BuscaLogradouroPageState createState() => _BuscaLogradouroPageState();
}

final GlobalWidgets widgets = GlobalWidgets();
final ThemeColors themeColors = ThemeColors();

class _BuscaLogradouroPageState extends State<BuscaLogradouroPage> {
  final loadingStore = LoadingStore();
  final TextEditingController _textController2 = TextEditingController();
  final CidadeEstadoStore buscaCepPageStore = CidadeEstadoStore();
  BuscaWidgets buscaWidgets = BuscaWidgets();
  String _displayText = '';
  final BuscaCepStore _buscaCepStore = Modular.get<BuscaCepStore>();


  Future<void> _confirmText() async {
    loadingStore.isLoading = true;
    final String cep = _textController2.text;
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
              buscaWidgets.buildEstadoCidadeSelecao(_textController2, _confirmText, buscaCepPageStore),
              Observer(
                builder: (_) {
                  if (buscaCepPageStore.cidadeSelecionada != null) {
                    return Column(
                      children: [
                        buscaWidgets.buildCepInput(_textController2,
                            "Digite o Logradouro para a busca"),
                        const SizedBox(height: 10),
                        buscaWidgets.confirmButton(false, _confirmText,_textController2, buscaCepPageStore),
                      ],
                    );
                  } else {
                    return Container(); // Ou qualquer outro widget para o estado inicial
                  }
                },
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }

}
