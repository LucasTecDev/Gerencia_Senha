import 'package:path/path.dart';
import 'package:plus_geo/data/anotacoes_sqlite.dart';
import 'package:plus_geo/core/data_general.dart';
import 'package:plus_geo/emtity/anotacoes_entity.dart';
import 'package:plus_geo/data/data_anotacoes.dart';
import 'package:sqflite/sqflite.dart';

class AnotacaoSQLiteDatasource {
  Future<Database> _getDatabase() async{

    // await deleteDatabase(
    //   join(await getDatabasesPath(), KDATABASE_NAME),
    // );

    return openDatabase(
      join(await getDatabasesPath(), KDATABASE_NAME),
      onCreate: (db, version) async {
        await db.execute(KCREATE_ANOTACAO_TABLE_SCRIPT);

        await db.rawInsert('''insert into $KANOTACAO_TABLE_NAME(
          $KANOTACAO_COLUMN_ANOTACAOTITULO, $KANOTACAO_COLUMN_ANOTACAOUSUARIO,
          $KANOTACAO_COLUMN_ANOTACAOSENHA) VALUES('Facebook','Lucas','aluno2508)''');

      },
      version: KDATABASE_VERSION
    );
  }

  Future create(anotacaoEmtity anotacao) async {
    try {
      final Database db = await _getDatabase();

      anotacao.anotacaoID = 
       await db.rawInsert('''insert into $KANOTACAO_TABLE_NAME(
         $KANOTACAO_COLUMN_ANOTACAOTITULO, $KANOTACAO_COLUMN_ANOTACAOUSUARIO,
         $KANOTACAO_COLUMN_ANOTACAOSENHA) VALUES(
          '${anotacao.titulo}', '${anotacao.usuario}', '${anotacao.senha}'
         ) ''');
    } catch (ex) {
      
    }
     
  }
}