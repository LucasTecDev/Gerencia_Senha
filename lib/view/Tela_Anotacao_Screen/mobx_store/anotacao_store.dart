import 'package:mobx/mobx.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner watch

part 'anotacao_store.g.dart';

class Anotacaostore = _Anotacaostore with _$Anotacaostore;

abstract class _Anotacaostore with Store {
  // #region _Titulo
  @observable
  String? _titulo;

  @computed
  String? get titulo => _titulo ?? '';

  @action
  AtualizarNome({required String titulo}) {
    _titulo = titulo;
  }
  // #endregion

  // #region _Usuario
  @observable
  String? _usuario;

  @computed
  String? get usuario => _usuario ?? '';

  @action
  AtualizarUsuario({required String usuario}) {
    _usuario = usuario;
  }
  // #endregion

  // #region _Senha

  @observable
  String? _senha;

  @computed
  String? get senha => _senha ?? '';

  @action
  AtualizarSenha({required String senha}) {
    _senha = senha;
  }
  // #endregion

  @computed
  bool get dadosPreenchidos =>
  titulo!.isNotEmpty && usuario!.isNotEmpty && senha!.isNotEmpty;
  
}
