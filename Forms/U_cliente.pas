unit U_cliente;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_padrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask;
type
  TFrm_cliente = class(TFrm_padrao)
    Q_padraoID_CLIENTE: TFDAutoIncField;
    Q_padraoNOME: TStringField;
    Q_padraoENDERECO: TStringField;
    Q_padraoNUMERO: TIntegerField;
    Q_padraoBAIRRO: TStringField;
    Q_padraoCIDADE: TStringField;
    Q_padraoUF: TStringField;
    Q_padraoCEP: TStringField;
    Q_padraoCPF: TStringField;
    Q_padraoEMAIL: TStringField;
    Q_padraoCADASTRO: TDateField;
    Q_padraoTELEFONE: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    db_nome: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DB_cadastro: TDBEdit;
    procedure bt_novoClick(Sender: TObject);
    procedure bt_pesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Frm_cliente: TFrm_cliente;
implementation
{$R *.dfm}

uses U_Pesq_Cliente;
procedure TFrm_cliente.bt_novoClick(Sender: TObject);
begin
  inherited;
  db_cadastro.Text:=DateTostr(now);
  db_nome.SetFocus;
end;
procedure TFrm_Cliente.bt_PesquisarClick(Sender: TObject);
begin
Frm_pesq_cliente:=Tfrm_pesq_cliente.Create(self);
Frm_pesq_cliente.ShowModal;
try
  if Frm_pesq_cliente.codigo > 0 then
    begin
      Q_padrao.Open;
      Q_padrao.Locate('ID_CLIENTE', Frm_pesq_cliente.codigo,[],); // localizamos o que foi pesquisada  no form pesquisa
    end;

finally
  Frm_pesq_cliente.Free;
  Frm_pesq_cliente:=nil;
end;

end;

End.
