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
  List<String> _displayText = []; // Passo 1: Alterar para List<String>
  final BuscaCepStore _buscaCepStore = Modular.get<BuscaCepStore>();

  Future<void> _confirmText() async {
    loadingStore.isLoading = true;
    String cep = _textController2.text;
    cep = '${buscaCepPageStore.estadoSelecionado}/${buscaCepPageStore.cidadeSelecionada}/${_textController2.text}';
    print('https://viacep.com.br/ws/$cep/json/');
    try {
      // Passo 2: Modificar para receber uma lista de strings
      final List<String> cepTextList = await _buscaCepStore.getList(cep); // Supondo que getText agora retorna List<String>
      await Future.delayed(const Duration(seconds: 1));
       
      setState(() {
        loadingStore.isLoading = false;
        _displayText = cepTextList; // Atualizar _displayText com a lista recebida
      });
    } catch (e) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        loadingStore.isLoading = false;
        _displayText = ['Erro ao fazer a requisição. Detalhes: $e']; // Usar uma lista aqui também
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
                        buscaWidgets.confirmButton(_confirmText),
                      ],
                    );
                  } else {
                    return Container(); // Ou qualquer outro widget para o estado inicial
                  }
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _displayText.length,
                  itemBuilder: (context, index) {
                    return Text(_displayText[index]); // Exibir cada item da lista
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
