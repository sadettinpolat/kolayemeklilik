unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,UnitTEmekli, Mask,dateutils, ImgList, ActnList, Menus,
  Buttons, ExtCtrls, ComCtrls, ToolWin, Spin;

const strProgramAdi='Kolay Emeklilik';
const strProgramVersiyon = '1.2 Beta';

type
  TfrmAna = class(TForm)
    sStatusBar1: TStatusBar;
    sToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    memoResult: TMemo;
    MainMenu1: TMainMenu;
    Dosya1: TMenuItem;
    Hakknda1: TMenuItem;
    Yardm1: TMenuItem;
    Hakknda2: TMenuItem;
    sGroupBox1: TGroupBox;
    sLabel1: TLabel;
    sLabel2: TLabel;
    sLabel3: TLabel;
    sLabel4: TLabel;
    sLabel5: TLabel;
    Image1: TImage;
    cmbCinsiyet: TComboBox;
    edtPrimOdemeGunSayisi: TSpinEdit;
    edtIstegeBagliGunSayisi: TSpinEdit;
    sLabel6: TLabel;
    sLabel7: TLabel;
    sLabel9: TLabel;
    edtAskerlikPrimSayisi: TSpinEdit;
    edtBagkur: TSpinEdit;
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
    S: TGroupBox;
    sPanel1: TPanel;
    sBitBtn2: TBitBtn;
    sBitBtn1: TBitBtn;
    Image2: TImage;
    imgOK1: TImage;
    imgOK1_2: TImage;
    imgOK2: TImage;
    imgOK2_2: TImage;
    imgOK3: TImage;
    imgOk3_2: TImage;
    sLabel8: TLabel;
    sLabel10: TLabel;
    sLabel11: TLabel;
    sLabel12: TLabel;
    sLabel13: TLabel;
    sLabel14: TLabel;
    sLabel15: TLabel;
    sLabel16: TLabel;
    sLabel17: TLabel;
    sLabel18: TLabel;
    sLabel19: TLabel;
    sLabel20: TLabel;
    imgGulen: TImage;
    imgAglayan: TImage;
    sBitBtn3: TBitBtn;
    edtEmekliSandigi: TSpinEdit;
    sLabel21: TLabel;
    AlanlarSfrla1: TMenuItem;
    actYardim: TAction;
    Image3: TImage;
    edtDogumTarihi: TMaskEdit;
    edtSigortaliBaslangicTarihi: TMaskEdit;
    edtAskerlikTarihi: TMaskEdit;
    edtHesaplamaYapilacakTarih: TMaskEdit;
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
edtHesaplamaYapilacakTarih.Text := DateToStr(now);

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
////////////////  kontrol sat�rlar� /////////////////////////////////

EnKucukTarih :=StrToDate('01.01.1900');
EnBuyukTarih := StrToDate('01.01.2100');

if TryStrToDate(edtDogumTarihi.Text,dumyDate) = false Then
begin
   edtDogumTarihi.SetFocus;
   ShowMessage('Hatal� bir do�um tarihi girdiniz! L�tfen ge�erli bir tarih giriniz...');
   Exit;
End;

if (StrToDate(edtDogumTarihi.Text) < EnKucukTarih) or ( StrToDate(edtDogumTarihi.Text) > EnBuyukTarih) Then
begin
   edtDogumTarihi.SetFocus;
   ShowMessage('Hatal� bir do�um tarihi girdiniz! L�tfen ge�erli bir tarih giriniz...');
   Exit;
End;



if TryStrToDate(edtSigortaliBaslangicTarihi.Text,dumyDate) = false Then
begin
   edtSigortaliBaslangicTarihi.SetFocus;
   ShowMessage('SSK Ba�lang�� tarihini hatal� girdiniz! L�tfen ge�erli bir tarih giriniz...');
   Exit;
End;

if (StrToDate(edtSigortaliBaslangicTarihi.Text) < EnKucukTarih) or (StrToDate(edtSigortaliBaslangicTarihi.Text) > EnBuyukTarih) Then
begin
   edtSigortaliBaslangicTarihi.SetFocus;
   ShowMessage('SSK Ba�lang�� tarihini hatal� girdiniz! L�tfen ge�erli bir tarih giriniz...');
   Exit;
End;



if TryStrToInt(edtPrimOdemeGunSayisi.Text,dumyInteger) = false Then
begin
   edtPrimOdemeGunSayisi.SetFocus;
   ShowMessage('SSK G�n say�s� hatal�. L�tfen ge�erli bir say� giriniz...');
   Exit;
End;


if TryStrToInt(edtIstegeBagliGunSayisi.Text,dumyInteger) = false Then
begin
   edtIstegeBagliGunSayisi.SetFocus;
   ShowMessage('�ste�e Ba�l� G�n say�s� hatal�. L�tfen ge�erli bir say� giriniz...');
   Exit;
End;


if TryStrToInt(edtAskerlikPrimSayisi.Text,dumyInteger) = false Then
begin
   edtAskerlikPrimSayisi.SetFocus;
   ShowMessage('Askerlik G�n say�s� hatal�. L�tfen ge�erli bir say� giriniz...');
   Exit;
End;

if dumyInteger > 0 Then
  if TryStrToDate(edtAskerlikTarihi.Text,dumyDate) = false Then
  begin
     edtAskerlikTarihi.SetFocus;
     ShowMessage('Askerlik tarihini hatal� girdiniz! L�tfen ge�erli bir tarih giriniz ya da askerlik bor�lanmas�n� 0 yap�n�z.');
     Exit;
  End;

if dumyInteger > 0 Then
  if (StrToDate(edtAskerlikTarihi.Text) < EnKucukTarih) or (StrToDate(edtAskerlikTarihi.Text) > EnBuyukTarih) Then
  begin
      edtAskerlikTarihi.SetFocus;
      ShowMessage('Askerlik tarihini hatal� girdiniz! L�tfen ge�erli bir tarih giriniz ya da askerlik bor�lanmas�n� 0 yap�n�z.');
     Exit;
  End;



if dumyInteger > 0 Then
  if YearsBetween(StrToDate(edtAskerlikTarihi.Text),StrToDate(edtDogumTarihi.Text)) <18 Then
  begin
     edtAskerlikTarihi.SetFocus;
     ShowMessage('Askerlik tarihi ge�ersiz! 18 ya��na gelmeden askere gidilemez...');
     Exit;
End;


if TryStrToInt(edtBagkur.Text,dumyInteger) = false Then
begin
   edtBagkur.SetFocus;
   ShowMessage('Ba�-Kur G�n say�s� hatal�. L�tfen ge�erli bir say� giriniz...');
   Exit;
End;

if TryStrToInt(edtEmekliSandigi.Text,dumyInteger) = false Then
begin
   edtEmekliSandigi.SetFocus;
   ShowMessage('Emekli Sand��� say�s� hatal�. L�tfen ge�erli bir say� giriniz...');
   Exit;
End;

  if TryStrToDate(edtHesaplamaYapilacakTarih.Text,dumyDate) = false Then
  begin
     edtHesaplamaYapilacakTarih.SetFocus;
     ShowMessage('Hesaplama tarihini hatal� girdiniz! L�tfen ge�erli bir tarih giriniz.');
     Exit;
  End;


if (StrToDate(edtHesaplamaYapilacakTarih.Text) < EnKucukTarih) or (StrToDate(edtHesaplamaYapilacakTarih.Text) > EnBuyukTarih) Then
begin
    edtHesaplamaYapilacakTarih.SetFocus;
    ShowMessage('Hesaplama tarihini hatal� girdiniz! L�tfen ge�erli bir tarih giriniz.');
   Exit;
End;

//    ShowMessage(inttostr(DaysBetween(edtHesaplamaYapilacakTarih.Date,edtSigortaliBaslangicTarihi.Date)));
if DaysBetween(StrToDate(edtHesaplamaYapilacakTarih.Text),StrToDate(edtSigortaliBaslangicTarihi.Text))  < edtPrimOdemeGunSayisi.Value then
begin
    edtPrimOdemeGunSayisi.SetFocus;
    ShowMessage('Belirtilen y�llar aras�nda belirtilen prim miktar�n� yat�rm�� olamaz. L�tfen de�erleri d�zeltip tekrar deneyin...');
   Exit;
End;


if StrToDate(edtSigortaliBaslangicTarihi.Text) <= StrToDate(edtDogumTarihi.Text) then
begin
    edtSigortaliBaslangicTarihi.SetFocus;
    ShowMessage('Sigortaya ba�lang�� tarihi do�um tarihinden k���k olamaz');
   Exit;
End;


////////////////  kontrol sat�rlar� /////////////////////////////////


Emekli                          := TEmekli.Create;
Emekli.DogumTarihi              := StrToDate(edtDogumTarihi.Text);
Emekli.SigortaliBaslangicTarihi := StrToDate(edtSigortaliBaslangicTarihi.Text);
Emekli.HesaplamaYapiacalTarih   := StrToDate(edtHesaplamaYapilacakTarih.Text);

if cmbCinsiyet.ItemIndex = 0 then
   Emekli.Cinsiyet := cnErkek
else
  Emekli.Cinsiyet := cnKadin;

Emekli.PrimOdemeGunSayisi          := StrToInt(edtPrimOdemeGunSayisi.Text);
Emekli.IstegePrimOdemeGunSayisi    := StrToInt(edtIstegeBagliGunSayisi.Text);
Emekli.AskerlikBorclanmaPrimSayisi := StrToInt(edtAskerlikPrimSayisi.Text);
if Emekli.AskerlikBorclanmaPrimSayisi > 0 then
 Emekli.AskerlikBorclanmaTarihi     := StrToDate(edtAskerlikTarihi.Text);
Emekli.BagKurPrimSayisi            := StrToInt(edtBagkur.Text);
Emekli.EmekliSandigiPrimSayisi     := StrToInt(edtEmekliSandigi.Text);


memoResult.Lines.Clear;
imgGulen.Visible   := false;
imgAglayan.Visible := false;


if Emekli.EmeklilikDurumunuHesapla then
begin
  imgGulen.Visible := true;
  if son2520GunuKontrolEt then
        ShowMessage('D�KKAT!!! Son 2520 g�nl�k hizmetinde en �ok SSK primi varsa emekli olabilir ! ');
end
else
begin
  imgAglayan.Visible := true;
  if emekli.EmeklilikDurumunuHesapla_Yastan then
  begin
    if son2520GunuKontrolEt then
        ShowMessage('D�KKAT!!! Son 2520 g�nl�k hizmetinde en �ok SSK primi varsa bu ki�i ya�tan emekli olabilir ! ')
    else
       ShowMessage('D�KKAT! Bu ki�i ya�tan emekli olabiliyor...');

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
ShowMessage('Hakeder yaz�s� hen�z eklenmedi !');
end;

procedure TfrmAna.Hakknda2Click(Sender: TObject);
begin
ShowMessage(strProgramAdi + ' '+ strProgramVersiyon + #13+ 'Sadettin POLAT' + #13+ 'sadettinpolat@mail.ru'+#13+'http://www.sadettinpolat.com' + #13+#13 + 'Yard�mlar�n dolay� Kadir UZUN''a te�ekk�r ederim.');
end;

procedure TfrmAna.ToolButton8Click(Sender: TObject);
begin
   Yardm1.Click
end;

procedure TfrmAna.actYardimExecute(Sender: TObject);
begin
 ShowMessage('Yard�m b�l�m� haz�rlan�yor !');
end;

procedure TfrmAna.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if MessageDlg('Program� kapatmak istiyor musunuz?',mtInformation,[mbyes,mbno],0) = mrno then
  Action :=caNone;

end;

function TfrmAna.son2520GunuKontrolEt():Boolean;
begin
  result :=edtBagkur.Value + edtEmekliSandigi.Value > 1260;
  image3.Visible := result;
end;

end.
