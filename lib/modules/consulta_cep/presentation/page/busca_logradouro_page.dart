import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/busca_cep_store.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/widgets/busca_widgets.dart';
import 'package:estudo_flutter/shared/mobx/cep_data_store.dart';
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
  final CepDataStore cepDataStore = CepDataStore();
  BuscaWidgets buscaWidgets = BuscaWidgets();
  List<Map<String, dynamic>> _ceps = []; // Passo 1: Alterar para List<String>
  final BuscaCepStore _buscaCepStore = Modular.get<BuscaCepStore>();

  Future<void> _confirmText() async {
    cepDataStore.setCeps(_ceps);
    loadingStore.setLoading(true);
    String cep = _textController2.text;
    cep =
        '${buscaCepPageStore.estadoSelecionado}/${buscaCepPageStore.cidadeSelecionada}/${_textController2.text}';
    print('https://viacep.com.br/ws/$cep/json/');
    try {
      final List<Map<String, dynamic>> cepTextList =
          await _buscaCepStore.getList(cep);
      await Future.delayed(const Duration(seconds: 1));
      loadingStore.setLoading(false);
      _ceps = cepTextList;
      cepDataStore.setCeps(_ceps);
    } catch (e) {
      await Future.delayed(const Duration(seconds: 2));
      loadingStore.setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeColors.white,
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
    child: Container(
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
              buscaWidgets.buildEstadoCidadeSelecao(
                  _textController2, _confirmText, buscaCepPageStore),
              Observer(
                builder: (_) {
                  if (buscaCepPageStore.cidadeSelecionada != null) {
                    return Column(
                        children: [
                          buscaWidgets.buildCepInput(_textController2,
                              "Digite o Logradouro para a busca"),
                          const SizedBox(height: 10),
                          buscaWidgets.confirmButton(_confirmText),
                        ],
                    );
                  } else {
                    return Container(); // Ou qualquer outro widget para o estado inicial
                  }
                },
              ),
              Observer(builder: (_) {
                if (cepDataStore.ceps.isNotEmpty) {
                  return buscaWidgets.buscaCard(cepDataStore.ceps);
                } else {
                  return Container(); // Ou qualquer outro widget para o estado inicial
                }
              }),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
