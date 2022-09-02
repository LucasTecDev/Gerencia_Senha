import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plus_geo/data/data_anotacoes.dart';
import 'package:plus_geo/view/Tela_Anotacao_Screen/mobx_store/anotacao_store.dart';
import 'package:plus_geo/view/Tela_Welcome_Screen/Welcome.dart';
import 'package:plus_geo/view/Tela_bloqueio_Screen/BlockPage.dart';

void main() {
  GetIt.I.registerSingleton<Anotacaostore>(Anotacaostore());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // o repositorio de dados eh instanciado antes do app apresentar a lista de
  // notas, essa instancia eh dependencia do NotesCubit que eh responsavel pelas
  // regras de negocio do aplicativo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            buttonColor: Colors.blue.shade500,
          ),
          home: const BlockScreen(),
    );
}
}

