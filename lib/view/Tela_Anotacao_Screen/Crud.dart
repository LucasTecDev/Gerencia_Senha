import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plus_geo/data/anotacoes_sqlite.dart';
import 'package:plus_geo/emtity/anotacoes_entity.dart';

import 'mobx_store/anotacao_store.dart';

class NewListPage extends StatelessWidget {
  
  final _anotacaoStore = GetIt.I.get<Anotacaostore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Anotações')),
      ),
      // Titulo, Usuario, Senha, Imagem
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: 'Titulo'),
                    onChanged: (value) => _anotacaoStore.AtualizarNome(titulo: value),
                    ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: 'Usuário'),
                    onChanged: (value) => _anotacaoStore..AtualizarUsuario(usuario: value),
                    ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: 'Senha'),
                    onChanged: (value) => _anotacaoStore.AtualizarSenha(senha: value),
                  ),
                  ],
                ),
              ),
              Container(
                width: 200,
                child: Stack( 
                  alignment: Alignment.bottomRight,
                  children: [
                   FlutterLogo(size: 300),
                  Icon(
                    Icons.add_a_photo,
                    size: 35,
                    ),
                ],),
              ),
              // SizedBox(height: 40,),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 200),
                child: Observer(builder: (_) 
                {return ElevatedButton.icon(
                  onPressed: _anotacaoStore.dadosPreenchidos ? _botaoGravar() : null,
                  icon: Icon(Icons.save),
                  label: Text('Gravar'),
                );
                })
              ),
            ],
          ),
        ),
      ),
    );
  }

  _botaoGravar() async {
    await AnotacaoSQLiteDatasource().create(
      anotacaoEmtity(
        titulo: _anotacaoStore.titulo!,
        usuario: _anotacaoStore.usuario!,
        senha: _anotacaoStore.senha!),
    );
  }
  
}