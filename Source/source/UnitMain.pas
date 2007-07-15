unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,UnitTEmekli, Mask,dateutils, sSkinManager,
  sSkinProvider, sHintManager, sButton, Buttons, sSpeedButton, sBitBtn,
  sPageControl, sTabControl, sMemo, ComCtrls, ToolWin, sToolBar, sStatusBar,
  Menus, sLabel, sMaskEdit, sCustomComboEdit, sTooledit, sGroupBox,
  ExtCtrls, sComboBox, sEdit, sSpinEdit, ActnList, ImgList,sdialogs, sPanel;

const strProgramAdi='Kolay Emeklilik';
const strProgramVersiyon = '1.2 Beta';

type
  TfrmAna = class(TForm)
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    sHintManager1: TsHintManager;
    sStatusBar1: TsStatusBar;
    sToolBar1: TsToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    memoResult: TsMemo;
    MainMenu1: TMainMenu;
    Dosya1: TMenuItem;
    Hakknda1: TMenuItem;
    Yardm1: TMenuItem;
    Hakknda2: TMenuItem;
    sGroupBox1: TsGroupBox;
    edtDogumTarihi: TsDateEdit;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    Image1: TImage;
    edtSigortaliBaslangicTarihi: TsDateEdit;
    cmbCinsiyet: TsComboBox;
    edtPrimOdemeGunSayisi: TsSpinEdit;
    edtIstegeBagliGunSayisi: TsSpinEdit;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sLabel9: TsLabel;
    edtAskerlikTarihi: TsDateEdit;
    edtAskerlikPrimSayisi: TsSpinEdit;
    edtBagkur: TsSpinEdit;
    ActionList1: TActionList;
    actAlanlariSifirla: TAction;
    ImageList16x16: TImageList;
    ImageList32x32: TImageList;
    actEmeklilikHesapla: TAction;
    actBilgilerinGecerliliginiKontrolEt: TAction;
    actCikis: TAction;
    N1: TMenuItem;
    k1: TMenuItem;
    EmeklilikHesapla1: TMenuItem;
    S: TsGroupBox;
    sPanel1: TsPanel;
    sBitBtn2: TsBitBtn;
    sBitBtn1: TsBitBtn;
    Image2: TImage;
    imgOK1: TImage;
    imgOK1_2: TImage;
    imgOK2: TImage;
    imgOK2_2: TImage;
    imgOK3: TImage;
    imgOk3_2: TImage;
    sLabel8: TsLabel;
    sLabel10: TsLabel;
    sLabel11: TsLabel;
    sLabel12: TsLabel;
    sLabel13: TsLabel;
    sLabel14: TsLabel;
    sLabel15: TsLabel;
    sLabel16: TsLabel;
    sLabel17: TsLabel;
    sLabel18: TsLabel;
    sLabel19: TsLabel;
    sLabel20: TsLabel;
    edtHesaplamaYapilacakTarih: TsDateEdit;
    imgGulen: TImage;
    imgAglayan: TImage;
    sBitBtn3: TsBitBtn;
    edtEmekliSandigi: TsSpinEdit;
    sLabel21: TsLabel;
    AlanlarSfrla1: TMenuItem;
    actYardim: TAction;
    Image3: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure actAlanlariSifirlaExecute(Sender: TObject);
    procedure actEmeklilikHesaplaExecute(Sender: TObject);
    procedure actCikisExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbCinsiyetChange(Sender: TObject);
    procedure edtAskerlikPrimSayisiChange(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
    procedure Hakknda2Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure actYardimExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function son2520GunuKontrolEt():Boolean;
  public
  Emekli:TEmekli;
    { Public declarations }
  end;

var
  frmAna: TfrmAna;

implementation


{$R *.dfm}

procedure TfrmAna.Button1Click(Sender: TObject);
begin

Emekli :=TEmekli.Create;
Emekli.DogumTarihi := StrToDate(edtDogumTarihi.Text);
Emekli.SigortaliBaslangicTarihi := StrToDate(edtSigortaliBaslangicTarihi.Text);

if cmbCinsiyet.ItemIndex = 0 then
   Emekli.Cinsiyet := cnErkek
else
  Emekli.Cinsiyet := cnKadin;

Emekli.PrimOdemeGunSayisi := StrToInt(edtPrimOdemeGunSayisi.Text);

memoResult.Lines.Clear;
if Emekli.EmeklilikDurumunuHesapla then
 memoResult.Lines.Add('emekli olabilir')
else
 memoResult.Lines.Add('emekli olamaz')

end;

procedure TfrmAna.Button2Click(Sender: TObject);
var
a:extended;
begin
a:=YearsBetween(now,strtodate('30.12.1976'));


ShowMessage(FloatToStr(a));
end;

procedure TfrmAna.actAlanlariSifirlaExecute(Sender: TObject);
begin

edtDogumTarihi.Text :='';
edtSigortaliBaslangicTarihi.Text :='';
edtPrimOdemeGunSayisi.Text :='0';
edtIstegeBagliGunSayisi.Text :='0';
cmbCinsiyet.ItemIndex :=0;
edtAskerlikTarihi.Text :='';
edtAskerlikPrimSayisi.Text :='0';
edtEmekliSandigi.Text :='0';
edtBagkur.Text :='0';
edtAskerlikTarihi.Enabled :=False;
edtHesaplamaYapilacakTarih.Date := now;

sLabel14.Caption := '0';
sLabel15.Caption := '0';

sLabel16.Caption := '0';
sLabel17.Caption := '0';

sLabel18.Caption := '0';
sLabel19.Caption := '0';

imgOK1.Visible := false;
imgOK1_2.Visible := false;
imgOK2.Visible := false;
imgOK2_2.Visible := false;
imgOK3.Visible := false;
imgOk3_2.Visible := false;
imgGulen.Visible :=false;
imgAglayan.Visible :=false;
edtDogumTarihi.SetFocus;
image3.Visible := false;

end;

procedure TfrmAna.actEmeklilikHesaplaExecute(Sender: TObject);

var
dumyDate:TDateTime;
dumyInteger:Integer;
EnKucukTarih,EnBuyukTarih:TDate;
begin
////////////////  kontrol satýrlarý /////////////////////////////////

EnKucukTarih :=StrToDate('01.01.1900');
EnBuyukTarih := StrToDate('01.01.2100');

if TryStrToDate(edtDogumTarihi.Text,dumyDate) = false Then
begin
   edtDogumTarihi.SetFocus;
   sShowMessage('Hatalý bir doðum tarihi girdiniz! Lütfen geçerli bir tarih giriniz...');
   Exit;
End;

if (edtDogumTarihi.Date < EnKucukTarih) or (edtDogumTarihi.Date > EnBuyukTarih) Then
begin
   edtDogumTarihi.SetFocus;
   sShowMessage('Hatalý bir doðum tarihi girdiniz! Lütfen geçerli bir tarih giriniz...');
   Exit;
End;



if TryStrToDate(edtSigortaliBaslangicTarihi.Text,dumyDate) = false Then
begin
   edtSigortaliBaslangicTarihi.SetFocus;
   sShowMessage('SSK Baþlangýç tarihini hatalý girdiniz! Lütfen geçerli bir tarih giriniz...');
   Exit;
End;

if (edtSigortaliBaslangicTarihi.Date < EnKucukTarih) or (edtSigortaliBaslangicTarihi.Date > EnBuyukTarih) Then
begin
   edtSigortaliBaslangicTarihi.SetFocus;
   sShowMessage('SSK Baþlangýç tarihini hatalý girdiniz! Lütfen geçerli bir tarih giriniz...');
   Exit;
End;



if TryStrToInt(edtPrimOdemeGunSayisi.Text,dumyInteger) = false Then
begin
   edtPrimOdemeGunSayisi.SetFocus;
   sShowMessage('SSK Gün sayýsý hatalý. Lütfen geçerli bir sayý giriniz...');
   Exit;
End;


if TryStrToInt(edtIstegeBagliGunSayisi.Text,dumyInteger) = false Then
begin
   edtIstegeBagliGunSayisi.SetFocus;
   sShowMessage('Ýsteðe Baðlý Gün sayýsý hatalý. Lütfen geçerli bir sayý giriniz...');
   Exit;
End;


if TryStrToInt(edtAskerlikPrimSayisi.Text,dumyInteger) = false Then
begin
   edtAskerlikPrimSayisi.SetFocus;
   sShowMessage('Askerlik Gün sayýsý hatalý. Lütfen geçerli bir sayý giriniz...');
   Exit;
End;

if dumyInteger > 0 Then
  if TryStrToDate(edtAskerlikTarihi.Text,dumyDate) = false Then
  begin
     edtAskerlikTarihi.SetFocus;
     sShowMessage('Askerlik tarihini hatalý girdiniz! Lütfen geçerli bir tarih giriniz ya da askerlik borçlanmasýný 0 yapýnýz.');
     Exit;
  End;

if dumyInteger > 0 Then
  if (edtAskerlikTarihi.Date < EnKucukTarih) or (edtAskerlikTarihi.Date > EnBuyukTarih) Then
  begin
      edtAskerlikTarihi.SetFocus;
      sShowMessage('Askerlik tarihini hatalý girdiniz! Lütfen geçerli bir tarih giriniz ya da askerlik borçlanmasýný 0 yapýnýz.');
     Exit;
  End;



if dumyInteger > 0 Then
  if YearsBetween(edtAskerlikTarihi.Date,edtDogumTarihi.Date) <18 Then
  begin
     edtAskerlikTarihi.SetFocus;
     sShowMessage('Askerlik tarihi geçersiz! 18 yaþýna gelmeden askere gidilemez...');
     Exit;
End;


if TryStrToInt(edtBagkur.Text,dumyInteger) = false Then
begin
   edtBagkur.SetFocus;
   sShowMessage('Bað-Kur Gün sayýsý hatalý. Lütfen geçerli bir sayý giriniz...');
   Exit;
End;

if TryStrToInt(edtEmekliSandigi.Text,dumyInteger) = false Then
begin
   edtEmekliSandigi.SetFocus;
   sShowMessage('Emekli Sandýðý sayýsý hatalý. Lütfen geçerli bir sayý giriniz...');
   Exit;
End;

  if TryStrToDate(edtHesaplamaYapilacakTarih.Text,dumyDate) = false Then
  begin
     edtHesaplamaYapilacakTarih.SetFocus;
     sShowMessage('Hesaplama tarihini hatalý girdiniz! Lütfen geçerli bir tarih giriniz.');
     Exit;
  End;


if (edtHesaplamaYapilacakTarih.Date < EnKucukTarih) or (edtHesaplamaYapilacakTarih.Date > EnBuyukTarih) Then
begin
    edtHesaplamaYapilacakTarih.SetFocus;
    sShowMessage('Hesaplama tarihini hatalý girdiniz! Lütfen geçerli bir tarih giriniz.');
   Exit;
End;

//    ShowMessage(inttostr(DaysBetween(edtHesaplamaYapilacakTarih.Date,edtSigortaliBaslangicTarihi.Date)));
if DaysBetween(edtHesaplamaYapilacakTarih.Date,edtSigortaliBaslangicTarihi.Date)  < edtPrimOdemeGunSayisi.Value then
begin
    edtPrimOdemeGunSayisi.SetFocus;
    sShowMessage('Belirtilen yýllar arasýnda belirtilen prim miktarýný yatýrmýþ olamaz. Lütfen deðerleri düzeltip tekrar deneyin...');
   Exit;
End;


if StrToDate(edtSigortaliBaslangicTarihi.Text) <= StrToDate(edtDogumTarihi.Text) then
begin
    edtSigortaliBaslangicTarihi.SetFocus;
    sShowMessage('Sigortaya baþlangýç tarihi doðum tarihinden küçük olamaz');
   Exit;
End;


////////////////  kontrol satýrlarý /////////////////////////////////


Emekli                          := TEmekli.Create;
Emekli.DogumTarihi              := StrToDate(edtDogumTarihi.Text);
Emekli.SigortaliBaslangicTarihi := StrToDate(edtSigortaliBaslangicTarihi.Text);
Emekli.HesaplamaYapiacalTarih   := edtHesaplamaYapilacakTarih.Date;

if cmbCinsiyet.ItemIndex = 0 then
   Emekli.Cinsiyet := cnErkek
else
  Emekli.Cinsiyet := cnKadin;

Emekli.PrimOdemeGunSayisi          := StrToInt(edtPrimOdemeGunSayisi.Text);
Emekli.IstegePrimOdemeGunSayisi    := StrToInt(edtIstegeBagliGunSayisi.Text);
Emekli.AskerlikBorclanmaTarihi     := edtAskerlikTarihi.Date;
Emekli.AskerlikBorclanmaPrimSayisi := StrToInt(edtAskerlikPrimSayisi.Text);
Emekli.BagKurPrimSayisi            := StrToInt(edtBagkur.Text);
Emekli.EmekliSandigiPrimSayisi     := StrToInt(edtEmekliSandigi.Text);


memoResult.Lines.Clear;
imgGulen.Visible   := false;
imgAglayan.Visible := false;


if Emekli.EmeklilikDurumunuHesapla then
begin
  imgGulen.Visible := true;
  if son2520GunuKontrolEt then
        sShowMessage('DÝKKAT!!! Son 2520 günlük hizmetinde en çok SSK primi varsa emekli olabilir ! ');
end
else
begin
  imgAglayan.Visible := true;
  if emekli.EmeklilikDurumunuHesapla_Yastan then
  begin
    if son2520GunuKontrolEt then
        sShowMessage('DÝKKAT!!! Son 2520 günlük hizmetinde en çok SSK primi varsa bu kiþi yaþtan emekli olabilir ! ')
    else
       sShowMessage('DÝKKAT! Bu kiþi yaþtan emekli olabiliyor...');

     imgAglayan.Visible := false;
     imgGulen.Visible := true;

  end;

end;

sLabel14.Caption := inttostr(emekli.outGerekliHizmetYili);
sLabel15.Caption := inttostr(emekli.outGecerliHizmetYili);

sLabel16.Caption := inttostr(emekli.outGerekliYas);
sLabel17.Caption := inttostr(emekli.outGecerliYas);

sLabel18.Caption := inttostr(emekli.outGerekliPrimSayisi);
sLabel19.Caption := inttostr(emekli.outGecerliPrimSayisi);

imgOK1.Visible   := emekli.outGecerliHizmetYili >= emekli.outGerekliHizmetYili;
imgOK1_2.Visible := not imgOK1.Visible;

imgOK2.Visible   := emekli.outGecerliYas >= emekli.outGerekliYas;
imgOK2_2.Visible := not imgOK2.Visible;

imgOK3.Visible   := emekli.outGecerliPrimSayisi >= emekli.outGerekliPrimSayisi;
imgOK3_2.Visible := not imgOK3.Visible;


memoResult.Lines := emekli.Log;



end;

procedure TfrmAna.actCikisExecute(Sender: TObject);
begin
close;
end;

procedure TfrmAna.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Return then
  SelectNext(ActiveControl,true,true);
end;

procedure TfrmAna.FormShow(Sender: TObject);
begin
actAlanlariSifirla.Execute;
edtDogumTarihi.SetFocus;

end;

procedure TfrmAna.FormCreate(Sender: TObject);
begin
    ThousandSeparator := '.';
    DecimalSeparator  := ',';
    ShortDateFormat   := 'dd.mm.yyyy';
    DateSeparator     := '.';
    LongTimeFormat    := 'HH:mm:ss';
    TimeSeparator     := ':';
    Caption := strProgramAdi + ' ' + strProgramVersiyon;

memoResult.ScrollBars :=ssBoth;
memoResult.Lines.Clear;
memoResult.Lines.Add(Caption);
WindowState :=wsMaximized;
end;

procedure TfrmAna.cmbCinsiyetChange(Sender: TObject);
begin
edtAskerlikTarihi.Enabled := cmbCinsiyet.ItemIndex = 0;
edtAskerlikPrimSayisi.Enabled := edtAskerlikTarihi.Enabled;
end;

procedure TfrmAna.edtAskerlikPrimSayisiChange(Sender: TObject);
begin
edtAskerlikTarihi.Enabled := edtAskerlikPrimSayisi.Value > 0;
end;

procedure TfrmAna.sBitBtn3Click(Sender: TObject);
begin
sShowMessage('Hakeder yazýsý henüz eklenmedi !');
end;

procedure TfrmAna.Hakknda2Click(Sender: TObject);
begin
sShowMessage(strProgramAdi + ' '+ strProgramVersiyon + #13+ 'Sadettin POLAT' + #13+ 'sadettinpolat@mail.ru'+#13+'http://www.sadettinpolat.com' + #13+#13 + 'Yardýmlarýn dolayý Kadir UZUN''a teþekkür ederim.');
end;

procedure TfrmAna.ToolButton8Click(Sender: TObject);
begin
   Yardm1.Click
end;

procedure TfrmAna.actYardimExecute(Sender: TObject);
begin
 sShowMessage('Yardým bölümü hazýrlanýyor !');
end;

procedure TfrmAna.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if sMessageDlg('Programý kapatmak istiyor musunuz?',mtInformation,[mbyes,mbno],0) = mrno then
  Action :=caNone;

end;

function TfrmAna.son2520GunuKontrolEt():Boolean;
begin
  result :=edtBagkur.Value + edtEmekliSandigi.Value > 1260;
  image3.Visible := result;
end;

end.
