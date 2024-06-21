// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$isObscureAtom =
      Atom(name: '_AuthStore.isObscure', context: context);

  @override
  bool get isObscure {
    _$isObscureAtom.reportRead();
    return super.isObscure;
  }

  @override
  set isObscure(bool value) {
    _$isObscureAtom.reportWrite(value, super.isObscure, () {
      super.isObscure = value;
    });
  }

  late final _$_AuthStoreActionController =
      ActionController(name: '_AuthStore', context: context);

  @override
  void changeObscureText() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.changeObscureText');
    try {
      return super.changeObscureText();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isObscure: ${isObscure}
    ''';
  }
}
