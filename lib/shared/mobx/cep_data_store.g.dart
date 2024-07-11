// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CepDataStore on _CepDataStore, Store {
  late final _$cepsAtom = Atom(name: '_CepDataStore.ceps', context: context);

  @override
  List<Map<String, dynamic>> get ceps {
    _$cepsAtom.reportRead();
    return super.ceps;
  }

  @override
  set ceps(List<Map<String, dynamic>> value) {
    _$cepsAtom.reportWrite(value, super.ceps, () {
      super.ceps = value;
    });
  }

  late final _$_CepDataStoreActionController =
      ActionController(name: '_CepDataStore', context: context);

  @override
  void setCeps(List<Map<String, dynamic>> cepList) {
    final _$actionInfo = _$_CepDataStoreActionController.startAction(
        name: '_CepDataStore.setCeps');
    try {
      return super.setCeps(cepList);
    } finally {
      _$_CepDataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ceps: ${ceps}
    ''';
  }
}
