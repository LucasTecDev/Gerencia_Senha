const String KDATABASE_NAME = 'Gerencia_pass_db';

const String KANOTACAO_TABLE_NAME = 'anotacao';
const String KANOTACAO_COLUMN_ANOTACAOID = 'anotacaoID';
const String KANOTACAO_COLUMN_ANOTACAOTITULO = 'anotacaoTitulo';
const String KANOTACAO_COLUMN_ANOTACAOUSUARIO = 'anotacaoUsuario';
const String KANOTACAO_COLUMN_ANOTACAOSENHA = 'anotacaoSenha';

const String KCREATE_ANOTACAO_TABLE_SCRIPT = ''' 
  CREATE TABLE $KANOTACAO_TABLE_NAME
  (
    $KANOTACAO_COLUMN_ANOTACAOID INTEGER PRIMARY KEY,
    $KANOTACAO_COLUMN_ANOTACAOTITULO TEXT,
    $KANOTACAO_COLUMN_ANOTACAOUSUARIO TEXT,
    $KANOTACAO_COLUMN_ANOTACAOSENHA TEXT
  )
 ''';