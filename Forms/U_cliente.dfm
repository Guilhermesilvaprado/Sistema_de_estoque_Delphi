inherited Frm_cliente: TFrm_cliente
  Caption = 'CADASTRO DE CLIENTES'
  ClientHeight = 506
  ClientWidth = 866
  ExplicitWidth = 872
  ExplicitHeight = 535
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 224
    Top = 88
    Width = 58
    Height = 13
    Caption = 'ID_CLIENTE'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 224
    Top = 136
    Width = 29
    Height = 13
    Caption = 'NOME'
    FocusControl = db_nome
  end
  object Label3: TLabel [2]
    Left = 224
    Top = 184
    Width = 54
    Height = 13
    Caption = 'ENDERECO'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 512
    Top = 184
    Width = 43
    Height = 13
    Caption = 'NUMERO'
    FocusControl = DBEdit4
  end
  object Label5: TLabel [4]
    Left = 224
    Top = 232
    Width = 39
    Height = 13
    Caption = 'BAIRRO'
    FocusControl = DBEdit5
  end
  object Label6: TLabel [5]
    Left = 440
    Top = 232
    Width = 38
    Height = 13
    Caption = 'CIDADE'
    FocusControl = DBEdit6
  end
  object Label7: TLabel [6]
    Left = 224
    Top = 280
    Width = 13
    Height = 13
    Caption = 'UF'
    FocusControl = DBEdit7
  end
  object Label8: TLabel [7]
    Left = 440
    Top = 280
    Width = 19
    Height = 13
    Caption = 'CEP'
    FocusControl = DBEdit8
  end
  object Label9: TLabel [8]
    Left = 224
    Top = 328
    Width = 50
    Height = 13
    Caption = 'TELEFONE'
    FocusControl = DBEdit9
  end
  object Label10: TLabel [9]
    Left = 440
    Top = 328
    Width = 19
    Height = 13
    Caption = 'CPF'
    FocusControl = DBEdit10
  end
  object Label11: TLabel [10]
    Left = 224
    Top = 376
    Width = 30
    Height = 13
    Caption = 'EMAIL'
    FocusControl = DBEdit11
  end
  object Label12: TLabel [11]
    Left = 402
    Top = 91
    Width = 55
    Height = 13
    Caption = 'CADASTRO'
    FocusControl = DB_cadastro
  end
  inherited Panel1: TPanel
    Width = 866
    ExplicitWidth = 866
    inherited bt_pesquisar: TBitBtn
      OnClick = bt_pesquisarClick
    end
  end
  inherited Panel2: TPanel
    Top = 441
    Width = 866
    ExplicitTop = 441
    ExplicitWidth = 866
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
    end
  end
  object DBEdit1: TDBEdit [14]
    Left = 224
    Top = 104
    Width = 161
    Height = 21
    DataField = 'ID_CLIENTE'
    DataSource = ds_padrao
    TabOrder = 2
  end
  object db_nome: TDBEdit [15]
    Left = 224
    Top = 152
    Width = 378
    Height = 21
    DataField = 'NOME'
    DataSource = ds_padrao
    TabOrder = 3
  end
  object DBEdit3: TDBEdit [16]
    Left = 224
    Top = 200
    Width = 282
    Height = 21
    DataField = 'ENDERECO'
    DataSource = ds_padrao
    TabOrder = 4
  end
  object DBEdit4: TDBEdit [17]
    Left = 512
    Top = 200
    Width = 90
    Height = 21
    DataField = 'NUMERO'
    DataSource = ds_padrao
    TabOrder = 5
  end
  object DBEdit5: TDBEdit [18]
    Left = 224
    Top = 248
    Width = 200
    Height = 21
    DataField = 'BAIRRO'
    DataSource = ds_padrao
    TabOrder = 6
  end
  object DBEdit6: TDBEdit [19]
    Left = 440
    Top = 248
    Width = 162
    Height = 21
    DataField = 'CIDADE'
    DataSource = ds_padrao
    TabOrder = 7
  end
  object DBEdit7: TDBEdit [20]
    Left = 224
    Top = 299
    Width = 200
    Height = 21
    DataField = 'UF'
    DataSource = ds_padrao
    TabOrder = 8
  end
  object DBEdit8: TDBEdit [21]
    Left = 440
    Top = 296
    Width = 162
    Height = 21
    DataField = 'CEP'
    DataSource = ds_padrao
    TabOrder = 9
  end
  object DBEdit9: TDBEdit [22]
    Left = 224
    Top = 347
    Width = 200
    Height = 21
    DataField = 'TELEFONE'
    DataSource = ds_padrao
    TabOrder = 10
  end
  object DBEdit10: TDBEdit [23]
    Left = 440
    Top = 344
    Width = 162
    Height = 21
    DataField = 'CPF'
    DataSource = ds_padrao
    TabOrder = 11
  end
  object DBEdit11: TDBEdit [24]
    Left = 224
    Top = 392
    Width = 378
    Height = 21
    DataField = 'EMAIL'
    DataSource = ds_padrao
    TabOrder = 12
  end
  object DB_cadastro: TDBEdit [25]
    Left = 402
    Top = 107
    Width = 200
    Height = 21
    DataField = 'CADASTRO'
    DataSource = ds_padrao
    TabOrder = 13
  end
  inherited Q_padrao: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_ID_CLIENTE'
    UpdateOptions.AutoIncFields = 'ID_CLIENTE'
    SQL.Strings = (
      'SELECT ID_CLIENTE,'
      'NOME,'
      'ENDERECO,'
      'NUMERO,'
      'BAIRRO,'
      'CIDADE,'
      'UF,'
      'CEP,'
      'TELEFONE,'
      'CPF,'
      'EMAIL,'
      'CADASTRO'
      'FROM CLIENTE'
      'ORDER BY ID_CLIENTE')
    Left = 752
    Top = 168
    object Q_padraoID_CLIENTE: TFDAutoIncField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object Q_padraoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object Q_padraoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 100
    end
    object Q_padraoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
    end
    object Q_padraoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 100
    end
    object Q_padraoCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
      Size = 100
    end
    object Q_padraoUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Q_padraoCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      EditMask = '00000\-000;0;_'
      Size = 16
    end
    object Q_padraoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      EditMask = '!\(99\)00000-0000;0;_'
      Size = 16
    end
    object Q_padraoCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      EditMask = '000\.000\.000\-00;0;_'
      Size = 16
    end
    object Q_padraoEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 100
    end
    object Q_padraoCADASTRO: TDateField
      FieldName = 'CADASTRO'
      Origin = 'CADASTRO'
      Required = True
    end
  end
  inherited ds_padrao: TDataSource
    Left = 752
    Top = 120
  end
end
