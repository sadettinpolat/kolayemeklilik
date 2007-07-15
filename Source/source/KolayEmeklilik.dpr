program KolayEmeklilik;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {frmAna},
  UnitTEmekli in 'lib\UnitTEmekli.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'KolayEmeklilik';
  Application.CreateForm(TfrmAna, frmAna);
  Application.Run;
end.
