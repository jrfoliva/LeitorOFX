program PrjOFXReader;

uses
  Forms,
  OFXReader.View in 'OFXReader.View.pas' {FOFXReader},
  OFXReader in 'OFXReader.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFOFXReader, FOFXReader);
  Application.Run;
end.
