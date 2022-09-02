// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anotacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Anotacaostore on _Anotacaostore, Store {
  Computed<String?>? _$tituloComputed;

  @override
  String? get titulo => (_$tituloComputed ??=
          Computed<String?>(() => super.titulo, name: '_Anotacaostore.titulo'))
      .value;
  Computed<String?>? _$usuarioComputed;

  @override
  String? get usuario =>
      (_$usuarioComputed ??= Computed<String?>(() => super.usuario,
              name: '_Anotacaostore.usuario'))
          .value;
  Computed<String?>? _$senhaComputed;

  @override
  String? get senha => (_$senhaComputed ??=
          Computed<String?>(() => super.senha, name: '_Anotacaostore.senha'))
      .value;
  Computed<bool>? _$dadosPreenchidosComputed;

  @override
  bool get dadosPreenchidos => (_$dadosPreenchidosComputed ??= Computed<bool>(
          () => super.dadosPreenchidos,
          name: '_Anotacaostore.dadosPreenchidos'))
      .value;

  late final _$_tituloAtom =
      Atom(name: '_Anotacaostore._titulo', context: context);

  @override
  String? get _titulo {
    _$_tituloAtom.reportRead();
    return super._titulo;
  }

  @override
  set _titulo(String? value) {
    _$_tituloAtom.reportWrite(value, super._titulo, () {
      super._titulo = value;
    });
  }

  late final _$_usuarioAtom =
      Atom(name: '_Anotacaostore._usuario', context: context);

  @override
  String? get _usuario {
    _$_usuarioAtom.reportRead();
    return super._usuario;
  }

  @override
  set _usuario(String? value) {
    _$_usuarioAtom.reportWrite(value, super._usuario, () {
      super._usuario = value;
    });
  }

  late final _$_senhaAtom =
      Atom(name: '_Anotacaostore._senha', context: context);

  @override
  String? get _senha {
    _$_senhaAtom.reportRead();
    return super._senha;
  }

  @override
  set _senha(String? value) {
    _$_senhaAtom.reportWrite(value, super._senha, () {
      super._senha = value;
    });
  }

  late final _$_AnotacaostoreActionController =
      ActionController(name: '_Anotacaostore', context: context);

  @override
  dynamic AtualizarNome({required String titulo}) {
    final _$actionInfo = _$_AnotacaostoreActionController.startAction(
        name: '_Anotacaostore.AtualizarNome');
    try {
      return super.AtualizarNome(titulo: titulo);
    } finally {
      _$_AnotacaostoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic AtualizarUsuario({required String usuario}) {
    final _$actionInfo = _$_AnotacaostoreActionController.startAction(
        name: '_Anotacaostore.AtualizarUsuario');
    try {
      return super.AtualizarUsuario(usuario: usuario);
    } finally {
      _$_AnotacaostoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic AtualizarSenha({required String senha}) {
    final _$actionInfo = _$_AnotacaostoreActionController.startAction(
        name: '_Anotacaostore.AtualizarSenha');
    try {
      return super.AtualizarSenha(senha: senha);
    } finally {
      _$_AnotacaostoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titulo: ${titulo},
usuario: ${usuario},
senha: ${senha},
dadosPreenchidos: ${dadosPreenchidos}
    ''';
  }
}
