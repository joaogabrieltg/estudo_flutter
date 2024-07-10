import 'package:estudo_flutter/modules/consulta_cep/domain/entities/estado_entities.dart';
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

  Widget confirmButton(Future<void> Function() confirmText) {
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
            confirmText();
        },
        child: Text(
          "Buscar",
          style: widgets.buttonTextStyle,
        ),
      ),
    );
  }

  Widget buildEstadoCidadeSelecao(TextEditingController textController2, Future<void> Function() confirmText, CidadeEstadoStore buscaCepPageStore) {
    return FutureBuilder<List<EstadoEntity>>(
      future: _buscaCepStore.carregarEstadosCidades(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          List<EstadoEntity> estados = snapshot.data!;
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
                            .map<DropdownMenuItem<String>>((EstadoEntity estado) {
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
                          print('${buscaCepPageStore.estadoSelecionado}/${buscaCepPageStore.cidadeSelecionada}/${textController2.text}');
                          Column(
                            children: [
                              buildCepInput(textController2,
                                  "Digite o Logradouro para a busca"),
                              const SizedBox(height: 10),
                              confirmButton(confirmText),
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
