import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class anotacaoEmtity extends Equatable {
  late int? anotacaoID;
  final String titulo;
  final String usuario;
  final String senha;

  anotacaoEmtity({
    this.anotacaoID,
    required this.titulo,
    required this.usuario,
    required this.senha});
    
      @override
      // TODO: implement props
      List<Object?> get props => [anotacaoID];
}