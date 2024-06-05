(*
  Unit Criada para realizar testes de leitura
  dos arquivos de extensão OFX (Open Financial Exchange).
  Criada em: 04/06/2024 - Junior
*)

unit OFXReader.View;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBClient, ExtCtrls, Buttons;

type
  TFOFXReader = class(TForm)
    OpenDialog1: TOpenDialog;
    DataSource1: TDataSource;
    pnlMain: TPanel;
    pnlMenu: TPanel;
    Panel1: TPanel;
    pnlPrincipal: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btnSelecionarArq: TButton;
    btnImportar: TBitBtn;
    Label1: TLabel;
    pnlTop: TPanel;
    LHeader: TLabel;
    Panel3: TPanel;
    procedure btnSelecionarArqClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOFXReader: TFOFXReader;

implementation

uses
  OFXReader;

{$R *.dfm}

procedure TFOFXReader.btnSelecionarArqClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    ShowMessage('Arquivo selecionado: ' + OpenDialog1.FileName);
  if OpenDialog1.FileName <> '' then
    btnImportar.Enabled := True
  else
    btnImportar.Enabled := False;
end;

procedure TFOFXReader.btnImportarClick(Sender: TObject);
var
  Reader : TOFXReader;
  TEMP: TClientDataSet;

begin
   if OpenDialog1.FileName = '' then
   begin
      ShowMessage('Selecione o arquivo para a importação.');
      Exit;
   end;
   Reader := TOFXReader.Create;
   try
     try
       // Importação do arquivo.
       Reader.LoadFromFile(trim(OpenDialog1.FileName));
       LHeader.Caption := 'Versão do Arquivo: '+ Reader.Header.Version +#13+
                          'Moeda: '+ Reader.Header.CurDef +#13+
                          'Banco: '   + Reader.Header.BankId   +#13+
                          //'Agência: ' + Reader.Header.BranchId +#13+
                          'Conta: '   + Reader.Header.AcctId+#13+
                          'Período: ' + Reader.Header.DtStart + ' A '+ Reader.Header.DtEnd;

     except
       ShowMessage('Falha durante a importação do arquivo.');
     end;

     try
       TEMP := Reader.ToClientDataSet;
       DataSource1.DataSet := TEMP;
       (* Se usarmos um memo.
       Memo1.Lines.Clear;
       // Cabeçalho
       Memo1.Lines.Add(Format('%-10s', ['Tipo']) + ' '+
                       Format('%-10s', ['Data']) + ' '+
                       Format('%15s',  ['Montante']) + ' '+
                       Format('%-12s',  ['FitID']) + ' ' +
                       Format('%-4s',  ['Cheque']) + ' ' +
                       Format('%-50s',  ['Memo']));
       // Transações
       for I:= 0 to Reader.TransactionCount-1 do
       begin
         Transaction := Reader.GetTransaction(I);

         (*
         Memo1.Lines.Add(Format('%-10s', [Transaction.TranType])+ ' ' +
                         Format('%-10s', [Transaction.DtPosted])+ ' ' +
                         Format('%15s',  [Transaction.TranAmt])+ ' ' +
                         Format('%-12s',  [Transaction.FitID])+ ' ' +
                         Format('%-4s',  [Transaction.CheckNum])+ ' ' +
                         Format('%-50s', [Transaction.Memo]));

       end;
         *)
     except
       on E: Exception do
       begin
         ShowMessage('Ocorreu um erro: '+E.Message);
       end;
     end;
   finally
     Reader.Free
   end;
   btnImportar.Enabled := False;
end;

procedure TFOFXReader.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

begin
   DBGrid1.Columns[2].Alignment := taRightJustify;
end;

end.
