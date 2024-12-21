// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectionStore on _ConnectionStore, Store {
  Computed<bool>? _$isConnectedComputed;

  @override
  bool get isConnected =>
      (_$isConnectedComputed ??= Computed<bool>(() => super.isConnected,
              name: '_ConnectionStore.isConnected'))
          .value;

  late final _$_connectivityResultAtom =
      Atom(name: '_ConnectionStore._connectivityResult', context: context);

  @override
  ConnectivityResult get _connectivityResult {
    _$_connectivityResultAtom.reportRead();
    return super._connectivityResult;
  }

  @override
  set _connectivityResult(ConnectivityResult value) {
    _$_connectivityResultAtom.reportWrite(value, super._connectivityResult, () {
      super._connectivityResult = value;
    });
  }

  late final _$initConnectivityAsyncAction =
      AsyncAction('_ConnectionStore.initConnectivity', context: context);

  @override
  Future<void> initConnectivity() {
    return _$initConnectivityAsyncAction.run(() => super.initConnectivity());
  }

  late final _$_ConnectionStoreActionController =
      ActionController(name: '_ConnectionStore', context: context);

  @override
  void onConnectivityChanged(ConnectivityResult result) {
    final _$actionInfo = _$_ConnectionStoreActionController.startAction(
        name: '_ConnectionStore.onConnectivityChanged');
    try {
      return super.onConnectivityChanged(result);
    } finally {
      _$_ConnectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isConnected: ${isConnected}
    ''';
  }
}
