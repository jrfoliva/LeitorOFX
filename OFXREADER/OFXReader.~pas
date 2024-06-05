(*
  Unit Criada para realizar a leitura
  dos arquivos de extensão OFX (Open Financial Exchange).
  Criada em: 04/06/2024 - Junior

  Métodos:
    LoadFromFile : Realiza a leitura do arquivo preenchendo um cabeçalho "TOFXHeader" com os dados
    do banco e um array com variável do tipo RECORD para cada transação "FTransactions".

    ToClientDataSet : Cria uma "TEMP" com os dados da transação, e retorna este TClientDaTaSet preenchido.

  Como Exemplo, foi deixado o projeto em S:\Junior\Projetos\OFXREADER
  para testes e melhor compreensão.
*)

unit OFXReader;

interface

uses
  Classes, SysUtils, DB, DBClient;

type

  TOFXHeader = record
    Version : String;
    CurDef  : String;
    BankId  : String;
    BranchId: String;
    AcctId  : String;
    DtStart : String;
    DtEnd   : String;
  end;

  TOFXTransaction = record
    TranType: string;
    DtPosted: string;
    TrnAmt  : string;
    FitID   : string;
    CheckNum: string;
    Memo    : string;
  end;

  TOFXReader = class
  private
    FTransactions: Array of TOFXTransaction;
    FHeader: TOFXHeader;
    function ParseAndFormatDateTime(const DateTimeStr: string): string;
    function FindSubstringInStrings(const Strings: TStringList; const SubStr: string): Integer;
  public
    property Header: TOFXHeader read FHeader write FHeader;
    //procedure ProcessarArquivoOFX(const nomeArquivo: string);
    procedure LoadFromFile(const FileName: String);
    function GetTransaction(index: Integer): TOFXTransaction;
    function TransactionCount: Integer;
    function ToClientDataSet: TClientDataSet;
  end;


implementation


{ TOFXReader }

function TOFXReader.GetTransaction(index: Integer): TOFXTransaction;
begin
  Result := FTransactions[index];
end;

function TOFXReader.FindSubstringInStrings(const Strings: TStringList; const SubStr: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Strings.Count - 1 do
  begin
    if Pos(SubStr, Strings[I]) > 0 then
    begin
      Result := I;
      Break;
    end;
  end;
end;


procedure TOFXReader.LoadFromFile(const FileName: String);
var
  FileStream : TFileStream;
  StringList : TStringList;
  Line       : String;
  Tran       : TOFXTransaction;
  I,Index, inicio, fim : Integer;


begin
  SetLength(FTransactions, 0);
  FileStream := TFileStream.Create(FileName, fmOpenRead);
  try
    StringList := TStringList.Create;
    try
      StringList.LoadFromStream(FileStream);
      // Monta o cabeçalho da transação;
      if StringList.Count > 0 then
      begin
         index := FindSubstringInStrings(StringList, 'VERSION:');
         if index > 0 then
         begin
           inicio := Pos(':', StringList[index])+1;
           fim := Length(StringList[index])+1;
           FHeader.Version := Copy(StringList[index], inicio, (fim-inicio));
         end;

         index := FindSubstringInStrings(StringList, '<CURDEF>');
         if index > 0 then
         begin
           inicio := Pos('>', StringList[index])+1;
           fim    := Pos('</CURDEF>', StringList[index]);
           if fim = 0 then
             fim := Length(StringList[index])+1;
           FHeader.CurDef := Copy(StringList[index], inicio, (fim-inicio));
         end;

         index := FindSubstringInStrings(StringList, '<BANKID>');
         if index > 0 then
         begin
           inicio := Pos('>', StringList[index])+1;
           fim    := Pos('</BANKID>', StringList[index]);
           if fim = 0 then
             fim := Length(StringList[index])+1;
           FHeader.BankId := Copy(StringList[index], inicio, (fim-inicio));
         end;

         index := FindSubstringInStrings(StringList, '<BRANCHID>');
         if index > 0 then
         begin
           inicio := Pos('>', StringList[index])+1;
           fim    := Pos('</BRANCHID>', StringList[index]);
           if fim = 0 then
             fim := Length(StringList[index])+1;
           FHeader.BranchId := Copy(StringList[index], inicio, (fim-inicio));
         end;

         index := FindSubstringInStrings(StringList, '<ACCTID>');
         if index > 0 then
         begin
           inicio := Pos('>', StringList[index])+1;
           fim    := Pos('</ACCTID>', StringList[index]);
           if fim = 0 then
             fim := Length(StringList[index])+1;
           FHeader.AcctId := Copy(StringList[index], inicio, (fim-inicio));
         end;

         index := FindSubstringInStrings(StringList, '<DTSTART>');
         if index > 0 then
         begin
           inicio := Pos('>', StringList[index])+1;
           fim    := Pos('</DTSTART>', StringList[index]);
           if fim = 0 then
             fim := Length(StringList[index])+1;
           FHeader.DtStart := ParseAndFormatDateTime(Copy(StringList[index], inicio, (fim-inicio)));
         end;

         index := FindSubstringInStrings(StringList, '<DTEND>');
         if index > 0 then
         begin
           inicio := Pos('>', StringList[index])+1;
           fim    := Pos('</DTEND>', StringList[index]);
           if fim = 0 then
             fim := Length(StringList[index])+1;
           FHeader.DtEnd := ParseAndFormatDateTime(Copy(StringList[index], inicio, (fim-inicio)));
         end;
      end;

      for I:= 0 to StringList.Count-1 do
      begin
        Line := Trim(StringList[I]);

        if Pos('<TRNTYPE>', Line) > 0 then
        begin
          inicio := Pos('>', Line)+1;
          fim    := Pos('</TRNTYPE>', Line);
          if fim = 0 then
            fim := Length(Line)+1;
          Tran.TranType := Copy(Line, inicio, (fim-inicio));
        end;

        if Pos('<DTPOSTED>', Line) > 0 then
        begin
          inicio := Pos('>', Line)+1;
          fim    := Pos('</DTPOSTED>', Line);
          if fim = 0 then
            fim := Length(Line)+1;
          Tran.DtPosted := Copy(Line, inicio, (fim-inicio));
        end;

        if Pos('<TRNAMT>', Line) > 0 then
        begin
          inicio := Pos('>', Line)+1;
          fim    := Pos('</TRNAMT>', Line);
          if fim = 0 then
            fim := Length(Line)+1;
          Tran.TrnAmt := Copy(Line, inicio, (fim-inicio));
        end;

        if Pos('<FITID>', Line) > 0 then
        begin
          inicio := Pos('>', Line)+1;
          fim    := Pos('</FITID>', Line);
          if fim = 0 then
            fim := Length(Line)+1;
          Tran.FitID := Copy(Line, inicio, (fim-inicio));
        end;

        if Pos('<CHECKNUM>', Line) > 0 then
        begin
          inicio := Pos('>', Line)+1;
          fim    := Pos('</CHECKNUM>', Line);
          if fim = 0 then
            fim := Length(Line)+1;
          Tran.CheckNum := Copy(Line, inicio, (fim-inicio));
        end;

        if Pos('<MEMO>', Line) > 0 then
        begin
          inicio := Pos('>', Line)+1;
          fim    := Pos('</MEMO>', Line);
          if fim = 0 then
            fim := Length(Line)+1;
          Tran.Memo := Copy(Line, inicio, (fim-inicio));
        end;

        if Line = '</STMTTRN>' then
        begin
          SetLength(FTransactions, Length(FTransactions) + 1);
          FTransactions[High(FTransactions)] := Tran;
        end;
      end;
    finally
      StringList.Free;
    end;
  finally
    FileStream.Free;
  end;
end;

function TOFXReader.ParseAndFormatDateTime(const DateTimeStr: string): string;
var
  Year, Month, Day, Hour, Min, Sec: Word;
begin
  Result := '';
  if DateTimeStr <> '' then
  begin
    // Extrair partes da string de data
    Year := StrToInt(Copy(DateTimeStr, 1, 4));
    Month := StrToInt(Copy(DateTimeStr, 5, 2));
    Day := StrToInt(Copy(DateTimeStr, 7, 2));
    Hour := StrToIntDef(Copy(DateTimeStr, 9, 2),0);
    Min := StrToIntDef(Copy(DateTimeStr, 11, 2),0);
    Sec := StrToIntDef(Copy(DateTimeStr, 13, 2),0);

    // Formatar a data e hora para 'dd/mm/yyyy hh:nn:ss'
    Result := Format('%2.2d/%2.2d/%4.4d %2.2d:%2.2d:%2.2d', [Day, Month, Year, Hour, Min, Sec]);
  end
end;

(*procedure TOFXReader.ProcessarArquivoOFX(const nomeArquivo: string);
var
  FileStream : TFileStream;
  StringList : TStringList;
  Line       : String;
  Versao     : TVersion;
  I          : Integer;
begin
  if trim(nomeArquivo) = '' then
  begin
    ShowMessage('Selecione o arquivo para processamento!');
    Exit;
  end;
  FNomeArquivo := nomeArquivo
  FileStream : TFileStream.Create(nomeArquivo, fmOpenRead);
  try
    StringList := TStringList.Create;
    try
      StringList.LoadFromStream(FileStream);
      for I:=0 to StringList.Count-1 do
      begin
        Line := StringList[I]
        if Pos('VERSAO:', Line) > 0 then
        begin
           Versao := Copy(Line, Pos(':', Line)+1, Length(Line)-1)
           Break;
        end;
      end;
    finally
      StringList.Free;
    end;
  finally
    FileStream.Free;
  end;

  Case Versao of
    '10'  : ProcessarVersao10;
    '102' : ProcessarVersao102;
    '20'  : ProcessarVersao20;
    '21'  : ProcessarVersao21;
  end;
end; *)

function TOFXReader.ToClientDataSet: TClientDataSet;
var
  CDS: TClientDataSet;
  I: Integer;
begin
  CDS := TClientDataSet.Create(nil);
  try
    with CDS.FieldDefs do
    begin
      Add('TranType', ftString, 20);
      Add('DtPosted', ftString, 25);
      Add('TrnAmt' , ftString, 20);
      Add('FitID'   , ftString, 20);
      Add('CheckNum', ftString, 20);
      Add('Memo'    , ftString, 50);
    end;
    CDS.CreateDataSet;
    CDS.IndexFieldNames := 'DtPosted';


    for I := 0 to High(FTransactions) do
    begin
      CDS.Append;
      CDS.FieldByName('TranType').AsString   := FTransactions[I].TranType;
      CDS.FieldByName('DtPosted').AsString   := ParseAndFormatDateTime(FTransactions[I].DtPosted);
      CDS.FieldByName('TrnAmt').AsString     := FormatFloat('#,##0.00', StrToFloat(StringReplace(FTransactions[I].TrnAmt, '.',',',[rfReplaceAll])));
      CDS.FieldByName('FitID').AsString      := FTransactions[I].FitID;
      CDS.FieldByName('CheckNum').AsString   := FTransactions[I].CheckNum;
      CDS.FieldByName('Memo').AsString       := FTransactions[I].Memo;
      CDS.Post;
    end;

    Result := CDS;
  except
    CDS.Free;
    raise;
  end;
end;

function TOFXReader.TransactionCount: Integer;
begin
  Result := Length(FTransactions);
end;

end.
