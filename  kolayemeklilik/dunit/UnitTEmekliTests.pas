unit UnitTEmekliTests;

interface

uses
  UnitTEmekli,
  TestFrameWork,sysutils;

type
  TEmekliTests = class(TTestCase)
  private
  Emekli:TEmekli;
  protected

    procedure SetUp; override;
    procedure TearDown; override;

  published

    // Test methods
    procedure TestEmeklilikDurumunuHesapla;
    procedure _08_09_1976_TarihindenOnceSigortaliOlanlariTestEt;
    procedure _08_09_1976_TarihindenOnce55YasindakiErkekSigortaliOlanlariTestEt;
    procedure _09_09_1976_23_05_1980_TarihinlerindeErkekSigortaliOlanlariTestEt;
    procedure _24_05_1979_23_11_1980_TarihinlerindeErkekSigortaliOlanlariTestEt;
    procedure _24_11_1980_23_05_1982_TarihinlerindeErkekSigortaliOlanlariTestEt;
    procedure _01_04_1981_DenSonraAskerlikGeriCekiliyormuDogruSekildeTestEt;

  end;

implementation

{ TEmekliTests }

procedure TEmekliTests.SetUp;
begin
  inherited;
  Emekli := TEmekli.Create;
end;

procedure TEmekliTests.TearDown;
begin
  inherited;
  Emekli.Free;
  Emekli :=Nil;
end;

procedure TEmekliTests.TestEmeklilikDurumunuHesapla;
begin
Emekli.PrimOdemeGunSayisi := 6999;  //7000 g�n laz�m
emekli.Cinsiyet := cnErkek;
emekli.DogumTarihi := StrToDate('01.01.1980');
emekli.SigortaliBaslangicTarihi :=StrToDate('01.01.2006');
Check(emekli.EmeklilikDurumunuHesapla=false,'Emekli hesaplama metodu yanl�� �al���yor');
end;

procedure TEmekliTests._01_04_1981_DenSonraAskerlikGeriCekiliyormuDogruSekildeTestEt;
begin
emekli.SigortaliBaslangicTarihi :=StrToDate('01.04.1981');
emekli.Cinsiyet := cnErkek;
emekli.DogumTarihi := StrToDate('01.04.1980');
emekli.HesaplamaYapiacalTarih := StrToDate('01.04.2026');

Emekli.PrimOdemeGunSayisi := 5075;
Check(emekli.EmeklilikDurumunuHesapla=false,'yanl�� �al���yor_2');
end;

procedure TEmekliTests._08_09_1976_TarihindenOnce55YasindakiErkekSigortaliOlanlariTestEt;
begin
emekli.SigortaliBaslangicTarihi :=StrToDate('08.09.1976');
emekli.Cinsiyet := cnErkek;
emekli.DogumTarihi := StrToDate('01.01.1950');
Emekli.PrimOdemeGunSayisi := 3599;  // 3600 olmasi lazim
Check(emekli.EmeklilikDurumunuHesapla=false,'yanl�� �al���yor_2');

emekli.DogumTarihi := StrToDate('01.01.1950');
Emekli.PrimOdemeGunSayisi := 3600;  // 3600 olmasi lazim
Check(emekli.EmeklilikDurumunuHesapla,'yanl�� �al���yor_3');

end;

procedure TEmekliTests._08_09_1976_TarihindenOnceSigortaliOlanlariTestEt;
begin
Emekli.PrimOdemeGunSayisi := 5000;  // 5000 olmasi lazim
emekli.Cinsiyet := cnErkek;
emekli.DogumTarihi := StrToDate('01.01.1953');
emekli.SigortaliBaslangicTarihi :=StrToDate('08.09.1976');
Check(emekli.EmeklilikDurumunuHesapla,'yanl�� �al���yor');
end;

procedure TEmekliTests._09_09_1976_23_05_1980_TarihinlerindeErkekSigortaliOlanlariTestEt;
begin
emekli.SigortaliBaslangicTarihi :=StrToDate('09.09.1976');
emekli.Cinsiyet := cnErkek;
emekli.DogumTarihi := StrToDate('01.01.1950');
Emekli.PrimOdemeGunSayisi := 5000;  // 5000 olmasi lazim
Check(emekli.EmeklilikDurumunuHesapla,'yanl�� �al���yor_1');
emekli.SigortaliBaslangicTarihi :=StrToDate('23.05.1979');
Check(emekli.EmeklilikDurumunuHesapla,'yanl�� �al���yor_2');
end;

procedure TEmekliTests._24_05_1979_23_11_1980_TarihinlerindeErkekSigortaliOlanlariTestEt;
begin
emekli.SigortaliBaslangicTarihi :=StrToDate('24.05.1979');
emekli.Cinsiyet := cnErkek;
emekli.DogumTarihi := StrToDate('01.01.1950');
Emekli.PrimOdemeGunSayisi := 5000;  // 5000 olmasi lazim
Check(emekli.EmeklilikDurumunuHesapla,'yanl�� �al���yor_1');
emekli.SigortaliBaslangicTarihi :=StrToDate('23.11.1980');
Check(emekli.EmeklilikDurumunuHesapla,'yanl�� �al���yor_2');
end;

procedure TEmekliTests._24_11_1980_23_05_1982_TarihinlerindeErkekSigortaliOlanlariTestEt;
begin
emekli.SigortaliBaslangicTarihi :=StrToDate('24.11.1980');
emekli.Cinsiyet := cnErkek;
emekli.DogumTarihi := StrToDate('01.01.1950');
Emekli.PrimOdemeGunSayisi := 5075;  // 5000 olmasi lazim
emekli.HesaplamaYapiacalTarih :=StrToDate('24.05.2007');
Check(emekli.EmeklilikDurumunuHesapla,'yanl�� �al���yor_1');
emekli.SigortaliBaslangicTarihi :=StrToDate('23.05.1982');
Check(emekli.EmeklilikDurumunuHesapla,'yanl�� �al���yor_2');

end;

initialization

  TestFramework.RegisterTest('UnitTEmekliTests Suite',
    TEmekliTests.Suite);

end.
