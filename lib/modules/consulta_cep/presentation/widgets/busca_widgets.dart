import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/busca_cep_store.dart';
import 'package:estudo_flutter/shared/mobx/cidade_estado_store.dart';
import 'package:estudo_flutter/shared/mobx/loading_store.dart';
import 'package:estudo_flutter/shared/widgets/global_themes.dart';
import 'package:estudo_flutter/shared/widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BuscaWidgets{
  final GlobalWidgets widgets = GlobalWidgets();
  final ThemeColors themeColors = ThemeColors();
  final BuscaCepStore _buscaCepStore = Modular.get<BuscaCepStore>();
  //final CidadeEstadoStore buscaCepPageStore = CidadeEstadoStore();
  final LoadingStore loadingStore = LoadingStore();


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

  Widget confirmButton(bool buscaPorCep, Future<void> _confirmText(), TextEditingController _textController2, CidadeEstadoStore buscaCepPageStore) {
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

  Widget buildEstadoCidadeSelecao(TextEditingController _textController2, Future<void> _confirmText(), CidadeEstadoStore buscaCepPageStore) {
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
                          buscaCepPageStore.setCidadeSelecionada(null);
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
                              confirmButton(false, _confirmText, _textController2, buscaCepPageStore),
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
