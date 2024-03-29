unit U_pesq_usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_Form_pesquisa_padrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls;

type
  TFrm_Pesq_usuario = class(TFrm_pesquisa_padrao)
    Q_pesq_padraoID_USUARIO: TIntegerField;
    Q_pesq_padraoNOME: TStringField;
    Q_pesq_padraoTIPO: TStringField;
    Q_pesq_padraoCADASTRO: TDateField;
    procedure bt_pesquisaClick(Sender: TObject);
    procedure cb_chave_pesquisaChange(Sender: TObject);
    procedure bt_TransferirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Pesq_usuario: TFrm_Pesq_usuario;

implementation

{$R *.dfm}

procedure TFrm_Pesq_usuario.bt_pesquisaClick(Sender: TObject);
begin


  Q_pesq_padrao.Close;     //fechou a query
  Q_pesq_padrao.SQL.add(''); // adicionou no sql vazio
  q_pesq_padrao.Params.Clear; // limpou os parametros
  Q_pesq_padrao.SQL.Clear; // limpou o sql
  Q_pesq_padrao.SQL.Add('SELECT ID_USUARIO,NOME,TIPO,CADASTRO FROM USUARIO'); // adicionou o sql das colunas/dados

  case cb_chave_pesquisa.ItemIndex of
  0:begin        // pesquisa por codigo
    Q_pesq_padrao.SQL.Add('WHERE ID_USUARIO =:PID_USUARIO'); // com a condi��o id recebendo pid criando parametro
    Q_pesq_padrao.ParamByName('PID_USUARIO').AsString:=ed_nome.Text; // nome recebeu um texto para fazer a pesquisa em PID apontando para o compo parametro
    end;

    1:begin // pesquisa por nome
    Q_pesq_padrao.SQL.Add('WHERE NOME LIKE :PNOME'); // com a condi��o id recebendo pid criando parametro
    Q_pesq_padrao.ParamByName('PNOME').AsString:= '%' + ed_nome.Text + '%'; // nome recebeu um texto para fazer a pesquisa em PID apontando para o compo parametro
    end;

    2:begin    // pesquisa por data
      Q_pesq_padrao.SQL.Add('WHERE CADASTRO =:PCADASTRO');
      Q_pesq_padrao.ParamByName('PCADASTRO').AsDate:=strTodate(mk_inicio.Text);
    end;

    3:begin    // pesquisa por periodo
      Q_pesq_padrao.SQL.Add('WHERE CADASTRO BETWEEN :PINICIO AND :PFIM');
      Q_pesq_padrao.ParamByName('PINICIO').AsDate:=strTodate(mk_inicio.Text);
      Q_pesq_padrao.ParamByName('PFIM').AsDate:=strTodate(mk_fim.Text);
    end;

    4:begin   // PESQUISA TODOS USUARIOS.
      Q_pesq_padrao.SQL.Add('ORDER BY ID_USUARIO');
    end;
  end;

  Q_pesq_padrao.Open; // Abriu a consulta  mostrando o resultado

  if Q_pesq_padrao.IsEmpty then     // caso nao tiver o registro vazio
  begin
    Messagedlg('Registro n�o encontrado!',mtInformation, [mbOk],0);   // mensagem de nao encontrado
  end
  else
   abort;
end;

procedure TFrm_Pesq_usuario.bt_TransferirClick(Sender: TObject);
begin
    inherited;
  if Q_pesq_padrao.RecordCount > 0 then    // se query for maior que 0
    begin
      codigo:=Q_pesq_padraoID_Usuario.AsInteger;     //variavel codigo recebeu idcliente
    end
    else
    abort;

end;

procedure TFrm_Pesq_usuario.cb_chave_pesquisaChange(Sender: TObject);
begin
  case cb_chave_pesquisa.ItemIndex of
  0:begin // pesquisa pelo codigo
    ed_nome.Visible:=true;
    ed_nome.SetFocus;
    mk_inicio.Visible:=False;
    mk_fim.Visible:=False;
    lb_nome.Visible:=True;
    lb_nome.Caption:='Digito o c�digo';
    lb_fim.Visible:=false;
    lb_inicio.Visible:=false;
    end;

  1:begin // pesquisa pelo nome
    ed_nome.Visible:=true;
    ed_nome.SetFocus;
    mk_inicio.Visible:=False;
    mk_fim.Visible:=False;
    lb_nome.Visible:=True;
    lb_nome.Caption:='Digito o nome';
    lb_inicio.Visible:=false;
    lb_fim.Visible:=false;
    end;

  2:begin //sele��o por data
    ed_nome.Visible:=False;
    mk_inicio.Visible:=true;
    mk_inicio.SetFocus;
    mk_fim.Visible:=false;
    lb_nome.Visible:=false;
    lb_inicio.Visible:=True;
    lb_inicio.Caption:='Digite a data';
    lb_fim.Visible:=false;
    end;

    3:begin // por periodo
    ed_nome.Visible:=false;
    mk_inicio.Visible:=true;
    mk_inicio.SetFocus;
    mk_fim.Visible:=true;
    lb_nome.Visible:=false;
    lb_inicio.Visible:=True;
    lb_inicio.Caption:='Digite o periodo';
    lb_fim.Visible:=True;
    end;

    4:begin // por periodo
    ed_nome.Visible:=false;
    mk_inicio.Visible:=FALSE;
    mk_fim.Visible:=false;
    lb_nome.Visible:=false;
    lb_inicio.Visible:=True;
    lb_inicio.Caption:= 'MOSTRANDO TODOS OS REGRISTRO';
    lb_fim.Visible:=false;
    end;

  end;

end;
procedure TFrm_Pesq_usuario.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  bt_transferir.Click;
end;

end.
