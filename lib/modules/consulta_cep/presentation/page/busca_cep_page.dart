import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/busca_cep_store.dart';
import 'package:estudo_flutter/shared/mobx/loading_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart'; // ignore_for_file: must_be_immutable

class BuscaCepPage extends StatefulWidget {
  @override
  _BuscaCepPageState createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {
  final loadingStore = LoadingStore();
  final TextEditingController _textController = TextEditingController();
  String _displayText = '';
  final BuscaCepStore _buscaCepStore = Modular.get<BuscaCepStore>();
  
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
        backgroundColor: Color(0XFFFFFFFF),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 36,
            top: 62,
            right: 36,
          ),
          child: Column(
            children: [
              Text(
                "BuscaCep",
                style: TextStyle(
                  color: Color(0XFF272727),
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 86),
              SizedBox(
                width: 302,
                child: TextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: _textController,
                  style: TextStyle(
                    color: Color(0XFFBDBDBD),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Digite o CEP para a busca",
                    hintStyle: TextStyle(
                      color: Color(0XFFBDBDBD),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        22,
                      ),
                      borderSide: BorderSide(
                        color: Color(0XFFE8E8E8),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        22,
                      ),
                      borderSide: BorderSide(
                        color: Color(0XFFE8E8E8),
                        width: 1,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        22,
                      ),
                      borderSide: BorderSide(
                        color: Color(0XFFE8E8E8),
                        width: 1,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        22,
                      ),
                      borderSide: BorderSide(
                        color: Color(0XFFE8E8E8),
                        width: 1,
                      ),
                    ),
                    filled: true,
                    fillColor: Color(0XFFF6F6F6),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.maxFinite,
                height: 32,
                margin: EdgeInsets.only(
                  left: 30,
                  right: 28,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF5DB074),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                    ),
                    visualDensity: const VisualDensity(
                      vertical: -4,
                      horizontal: -4,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 6,
                    ),
                  ),
                  onPressed: () {
                    _confirmText();
                  },
                  child: Text(
                    "Buscar",
                    style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Observer(builder: (_) {
              LoadingStore loadingStore = LoadingStore();
              if (loadingStore.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Text(
                  _displayText,
                  style: const TextStyle(
                      color: Color(0XFFBDBDBD),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                );
              }
            }),
            ],
          ),
        ),
      ),
    );
  }
}
