import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/busca_cep_store.dart';
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
  final TextEditingController _textController2 = TextEditingController();
  String _displayText = '';
  final BuscaCepStore _buscaCepStore = Modular.get<BuscaCepStore>();
  //String? estadoSelecionado;
  //String? cidadeSelecionada;
  //List<String> cidades = [];
  final CidadeEstadoStore buscaCepPageStore = CidadeEstadoStore();

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
              buildCepInput(_textController, "Digite o CEP para a busca"),
              const SizedBox(height: 10),
              confirmButton(true),
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
              Container(
                child: buildEstadoCidadeSelecao(),
              ),
              Observer(
                builder: (_) {
                  if (buscaCepPageStore.cidadeSelecionada != null) {
                    return Column(
                      children: [
                        buildCepInput(_textController2,
                            "Digite o Logradouro para a busca"),
                        const SizedBox(height: 10),
                        confirmButton(false),
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

  Widget buildCepInput(TextEditingController controller, String hintText) {
    return SizedBox(
        width: 302,
        child: TextFormField(
          focusNode: FocusNode(),
          autofocus: true,
          controller: controller,
          style: widgets.textInputStyle,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: widgets.textInputStyle,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                22,
              ),
              borderSide: BorderSide(
                color: themeColors.greyWhite,
                width: 1,
              ),
            ),
            focusedBorder: widgets.outlineBorder,
            disabledBorder: widgets.outlineBorder,
            border: widgets.outlineBorder,
            filled: true,
            //fillColor: themeColors.greyWhite,
            fillColor: const Color(0XFFF6F6F6),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ));
  }

  Widget confirmButton(bool buscaPorCep) {
    return Container(
      width: double.maxFinite,
      height: 32,
      margin: const EdgeInsets.only(
        left: 30,
        right: 28,
      ),
      child: ElevatedButton(
        style: widgets.elevatedButtonStyle,
        onPressed: () {
          if (buscaPorCep) {
            _confirmText();
          } else {
            // Implementar ação após seleção da cidade
            print(
                '${buscaCepPageStore.estadoSelecionado}/${buscaCepPageStore.cidadeSelecionada}/${_textController2.text}');
          }
        },
        child: Text(
          "Buscar",
          style: widgets.buttonTextStyle,
        ),
      ),
    );
  }

  Widget buildEstadoCidadeSelecao() {
    return FutureBuilder<List<Estado>>(
      future: _buscaCepStore.carregarEstadosCidades(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          List<Estado> estados = snapshot.data!;
          return Column(
            children: [
              Observer(
                  builder: (_) => DropdownButton<String>(
                        hint: const Text("Selecione o Estado"),
                        value: buscaCepPageStore.estadoSelecionado,
                        onChanged: (newValue) {
                          buscaCepPageStore.setEstadoSelecionado(newValue);
                          buscaCepPageStore.setCidades(estados
                              .firstWhere((estado) => estado.sigla == newValue)
                              .cidades);
                        },
                        items: estados
                            .map<DropdownMenuItem<String>>((Estado estado) {
                          return DropdownMenuItem<String>(
                            value: estado.sigla,
                            child: Text(estado.nome),
                          );
                        }).toList(),
                      )),
              Observer(
                builder: (_) => DropdownButton<String>(
                  hint: const Text("Selecione a Cidade"),
                  value: buscaCepPageStore.cidades.isNotEmpty
                      ? buscaCepPageStore.cidadeSelecionada
                      : null,
                  onChanged: buscaCepPageStore.cidades.isNotEmpty
                      ? (newValue) {
                          buscaCepPageStore.setCidadeSelecionada(newValue);
                          // Implementar ação após seleção da cidade
                          print(
                              '${buscaCepPageStore.estadoSelecionado}/${buscaCepPageStore.cidadeSelecionada}/${_textController2.text}');
                          Column(
                            children: [
                              buildCepInput(_textController2,
                                  "Digite o Logradouro para a busca"),
                              const SizedBox(height: 10),
                              confirmButton(false),
                            ],
                          );
                        }
                      : null,
                  items: buscaCepPageStore.cidades
                      .map<DropdownMenuItem<String>>((String cidade) {
                    return DropdownMenuItem<String>(
                      value: cidade,
                      child: Text(cidade),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        } else {
          return const Text('No data found');
        }
      },
    );
  }
}
