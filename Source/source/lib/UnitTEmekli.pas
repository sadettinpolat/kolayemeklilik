unit UnitTEmekli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Forms,
  Dialogs, DateUtils,Controls;

type TCinsiyet = (cnErkek,cnKadin);

type
  TEmekli = class
  private
    fSigortaliBaslangicTarihi:TDate;
    fDogumTarihi:TDate;
    fCinsiyet:TCinsiyet;
    fPrimOdemeGunSayisi:Smallint;
    fSigortalininYasi:Byte;
    fEmeklilikIcinGerekliSigortaSuresi:Byte;
    fEmeklilikIcinGerekliYas:Byte;
    fEmeklilikIcinGerekliPrimOdemeGunSayisi:Smallint;
    fEmeklilikIcinGerekliSigortaSuresi_YastanEmeklilik:Byte;
    fEmeklilikIcinGerekliYas_YastanEmeklilik:Byte;
    fEmeklilikIcinGerekliPrimOdemeGunSayisi_YastanEmeklilik:Smallint;
    FHesaplamaYapilacakTarih: TDate;
    fLog:TStrings;
    FoutGerekliPrimSayisi: Integer;
    FoutGecerliPrimSayisi: Integer;
    FoutGerekliHizmetYili: Integer;
    FoutGerekliYas: Integer;
    FoutGecerliHizmetYili: Integer;
    FoutGecerliYas: Integer;
    FIstegePrimOdemeGunSayisi: Smallint;
    FAskerlikBorclanmaTarihi: TDate;
    FAskerlikBorclanmaPrimSayisi: Smallint;
//    FDigerSandiklardakiPrimler: Smallint;
    FYastanEmeklilikIcinSonSartinSaglandigiTarih: TDate;
    FBagKurPrimSayisi: Smallint;
    FEmekliSandigiPrimSayisi: Smallint;
    fEmekliOlabilecegiTarih:TDate;
    FoutYastanEmekliOlabilecegiTarihi: TDate;
    FoutNormalSekildeOlabilecegiTarihi: TDate;

    function  HizmetYiliniTamamlayacagiTarihiBul(aSigortayaGirisTarihi:TDate;aHizmetYili:Byte):TDate;
    function  PrimSayisiniTamamlayacagiTarihiBul(aHesaplamaYapilanTarih:TDate;aOdemesiGerekenPrimSayisi:Smallint):TDate;
    function  YasiniDolduracagiTarihiBul(aDogumTarihi:TDate;aGerekliYas:Byte):TDate;
    function  getIlkIseGirisTarihi:string;
    procedure ErkeklerIcinGerekliOlanEmeklilikSartlariniBul_YastanEmeklilik;
    procedure KadinlarIcinGerekliOlanEmeklilikSartlariniBul_YastanEmeklilik;
    procedure ErkeklerIcinGerekliOlanEmeklilikSartlariniBul;
    procedure KadinlarIcinGerekliOlanEmeklilikSartlariniBul;
    function GerekliOlanPrimOdemeGunSayisiniBul(aTarih:TDate):Smallint;
    function  getSigortaliBaslangicTarihi: TDate;
    procedure setSigortaliBaslangicTarihi(const Value: TDate);
    function  getDogumTarihi: TDate;
    procedure setDogumTarihi(const Value: TDate);
    function  getCinsiyet: TCinsiyet;
    procedure setCinsiyet(const Value: TCinsiyet);
    function  getPrimOdemeGunSayisi: Smallint;
    procedure setPrimOdemeGunSayisi(const Value: Smallint);
    Function EmekliSartlari_YeterliPrimiVarMi():Boolean;
    Function EmekliSartlari_EmeklilikYasiGelmisMi():Boolean;
    Function EmekliSartlari_SigortalilikSuresiniDoldurmusMu():Boolean;
    procedure SetIstegePrimOdemeGunSayisi(const Value: Smallint);
    procedure SetAskerlikBorclanmaTarihi(const Value: TDate);
    procedure SetAskerlikBorclanmaPrimSayisi(const Value: Smallint);
    procedure SetYastanEmeklilikIcinSonSartinSaglandigiTarih(
      const Value: TDate);
    procedure SetBagKurPrimSayisi(const Value: Smallint);
    procedure SetEmekliSandigiPrimSayisi(const Value: Smallint);
    { Private declarations }
  public
    { Public declarations }
  constructor Create;
  destructor Destroy;override;
  function EmeklilikDurumunuHesapla_Yastan():Boolean;
  function EmeklilikDurumunuHesapla():Boolean;
  property HesaplamaYapiacalTarih:TDate read FHesaplamaYapilacakTarih write fHesaplamaYapilacakTarih;
  property PrimOdemeGunSayisi:Smallint read getPrimOdemeGunSayisi write setPrimOdemeGunSayisi;
  property Cinsiyet:TCinsiyet read getCinsiyet write setCinsiyet;
  property DogumTarihi:TDate read getDogumTarihi write setDogumTarihi;
  property SigortaliBaslangicTarihi:TDate read getSigortaliBaslangicTarihi write setSigortaliBaslangicTarihi;
  property IstegePrimOdemeGunSayisi:Smallint read FIstegePrimOdemeGunSayisi write SetIstegePrimOdemeGunSayisi;
  property AskerlikBorclanmaTarihi:TDate read FAskerlikBorclanmaTarihi write SetAskerlikBorclanmaTarihi;
  property AskerlikBorclanmaPrimSayisi:Smallint read FAskerlikBorclanmaPrimSayisi write SetAskerlikBorclanmaPrimSayisi;
  property EmekliSandigiPrimSayisi:Smallint read FEmekliSandigiPrimSayisi write SetEmekliSandigiPrimSayisi;
  property BagKurPrimSayisi:Smallint read FBagKurPrimSayisi write SetBagKurPrimSayisi;
  property YastanEmeklilikIcinSonSartinSaglandigiTarih:TDate read FYastanEmeklilikIcinSonSartinSaglandigiTarih write SetYastanEmeklilikIcinSonSartinSaglandigiTarih;
  property Log:TStrings read FLog;
  property outGerekliPrimSayisi:Integer read FoutGerekliPrimSayisi;
  property outGecerliPrimSayisi:Integer read FoutGecerliPrimSayisi;
  property outGerekliHizmetYili:Integer read FoutGerekliHizmetYili;
  property outGecerliHizmetYili:Integer read FoutGecerliHizmetYili;
  property outGerekliYas:Integer read FoutGerekliYas;
  property outGecerliYas:Integer read FoutGecerliYas;
  property outYastanEmekliOlabilecegiTarihi:TDate read FoutYastanEmekliOlabilecegiTarihi;
  property outNormalSekildeEmekliOlabilecegiTarihi:TDate read FoutNormalSekildeOlabilecegiTarihi;

  end;


implementation

{ TEmekli }

constructor TEmekli.Create;
begin
inherited;
  FHesaplamaYapilacakTarih :=Now;
  fLog :=TStringList.Create;
end;

destructor TEmekli.Destroy;
begin
  FreeAndNil(fLog);
end;

function TEmekli.EmeklilikDurumunuHesapla: Boolean;
begin
Result :=False;
flog.Clear;
flog.Add('Emeklilik hesaplama iþlemine baþlanýldý...');
flog.Add('Veriler analiz ediliyor...');
fEmekliOlabilecegiTarih := FHesaplamaYapilacakTarih;
fSigortalininYasi       := YearsBetween(FHesaplamaYapilacakTarih,fDogumTarihi);

if getCinsiyet = cnErkek Then
begin
  ErkeklerIcinGerekliOlanEmeklilikSartlariniBul;
  ErkeklerIcinGerekliOlanEmeklilikSartlariniBul_YastanEmeklilik;
  flog.Add('Sigortalýnýn Cinsiyeti: Erkek');
end
else
begin
  KadinlarIcinGerekliOlanEmeklilikSartlariniBul;
  KadinlarIcinGerekliOlanEmeklilikSartlariniBul_YastanEmeklilik;
  flog.Add('Sigortalýnýn Cinsiyeti: Bayan');
end;

flog.Add('Ýlk iþe giriþ tarihi: ' + getIlkIseGirisTarihi);

if EmekliSartlari_YeterliPrimiVarMi = false then
  Result := False
else
  Result := True;

if EmekliSartlari_EmeklilikYasiGelmisMi = false then
  Result := Result and False
else
  Result := Result and True;


if EmekliSartlari_SigortalilikSuresiniDoldurmusMu = false then
  Result := Result and False
else
  Result := Result and True;



if result Then
begin
  if FEmekliSandigiPrimSayisi  + FBagKurPrimSayisi > 1260 then
    flog.Add('Eðer son 2520 günlük primin büyük kýsmý SSK ya yatmýþsa emekli olabilirsiniz.')
  else
    flog.Add('Tebrikler. Emekliliðe hak kazanmýþsýnýz');
end
else
begin
  flog.Add('En erken emekli olabileceði tarih --> ' + DateToStr(fEmekliOlabilecegiTarih));
//  EmeklilikDurumunuHesapla_Yastan;
end;

end;

function TEmekli.EmeklilikDurumunuHesapla_Yastan: Boolean;
var
_EnBuyukTarih,_15Yil,_55Yas,_3600Gun:TDate; temp3600:String;
begin
Result :=False;
fEmekliOlabilecegiTarih := FHesaplamaYapilacakTarih;
fSigortalininYasi := YearsBetween(FHesaplamaYapilacakTarih,fDogumTarihi);
if getSigortaliBaslangicTarihi <StrToDate('23.05.2002') then
begin
_15Yil := StrToDate('01.01.1880');
_55Yas := StrToDate('01.01.1880');
_3600Gun := StrToDate('01.01.1880');


_15Yil:= HizmetYiliniTamamlayacagiTarihiBul(getSigortaliBaslangicTarihi,15);
if  getCinsiyet = cnErkek then
 _55Yas := YasiniDolduracagiTarihiBul(fDogumTarihi,55)
else
 _55Yas := YasiniDolduracagiTarihiBul(fDogumTarihi,50);


if getPrimOdemeGunSayisi < 3600 Then
begin
  _3600Gun := PrimSayisiniTamamlayacagiTarihiBul(FHesaplamaYapilacakTarih,3600 - getPrimOdemeGunSayisi);
//  temp3600 := DateToStr(_3600Gun);
//  if sInputQuery('3600 gün ne zaman dolacak?','3600 günün  dolacaðý tarihi giriniz...',temp3600) then
//    _3600Gun := StrToDate(temp3600);
end
else
 _3600Gun := FHesaplamaYapilacakTarih;





_EnBuyukTarih := _15Yil;
if _55Yas > _EnBuyukTarih Then
   _EnBuyukTarih := _55Yas;

if _3600Gun > _EnBuyukTarih Then
   _EnBuyukTarih := _3600Gun;

FYastanEmeklilikIcinSonSartinSaglandigiTarih :=_EnBuyukTarih;

if getCinsiyet = cnErkek then
  ErkeklerIcinGerekliOlanEmeklilikSartlariniBul_YastanEmeklilik
else
  KadinlarIcinGerekliOlanEmeklilikSartlariniBul_YastanEmeklilik;
log.Add('');
log.Add('================== YAÞ DURUMUNA GÖRE ==================');
log.Add('');
log.Add('Normal þartlarda emekliliðe hak kazanamýyor !!! ');
log.Add('Yaþtan emeklilik durumu inceleniyor...');
log.Add('Yaþtan emeklilik þartlarý:');
log.Add('Bütün þartlarýn saðlandýðý en yakýn tarih:' + datetostr(FYastanEmeklilikIcinSonSartinSaglandigiTarih));
log.Add('Yaþtan emeklilik için gerekli hizmet süresi:' + inttostr(fEmeklilikIcinGerekliSigortaSuresi_YastanEmeklilik));
log.Add('Yaþtan emeklilik için gerekli prim sayýsý:' + inttostr(fEmeklilikIcinGerekliPrimOdemeGunSayisi_YastanEmeklilik));
log.Add('Yaþtan emeklilik için gerekli yaþ:' + inttostr(fEmeklilikIcinGerekliYas_YastanEmeklilik));

_15Yil:= HizmetYiliniTamamlayacagiTarihiBul(getSigortaliBaslangicTarihi,fEmeklilikIcinGerekliSigortaSuresi_YastanEmeklilik);
log.Add('15 Yýllýk hizmet süresinin tamamlandýðý tarih:' + DateToStr(_15Yil));
_55Yas := YasiniDolduracagiTarihiBul(fDogumTarihi,fEmeklilikIcinGerekliYas_YastanEmeklilik);
log.Add(inttostr(fEmeklilikIcinGerekliYas_YastanEmeklilik) + ' yaþ þartýnýn tamamlandýðý tarih:' + DateToStr(_55Yas));
log.Add('3600 günün tamamlandýðý tarih:' + DateToStr(_3600Gun));

_EnBuyukTarih := _15Yil;
if _55Yas > _EnBuyukTarih Then
   _EnBuyukTarih := _55Yas;

if _3600Gun > _EnBuyukTarih Then
   _EnBuyukTarih := _3600Gun;
log.Add('Yaþtan emekli olabileceði en yakýn tarih:' + datetostr(_EnBuyukTarih));
if _EnBuyukTarih <= FHesaplamaYapilacakTarih then
begin
 result := true;
 log.Add('Tebrikler. Yaþtan emekliliðe hak kazanmýþsýnýz.');
end
else
begin
 result := false;
 log.Add('Þu an için yaþtan emekli olamazsýnýz.');
end;


{15 yili ne zaman dolduruyor ?
55 yasini ne zaman dolduruyor ?
3600 u ne zaman dolduruyor ?
  3600 u yoksa kullanicidan iste
en buyuk tarihi skalada yerine koy
sartlari bul
hizmet süresi yeterli mi
yasi yeterli mi
primi yeterli mi

}
end;

end;

function TEmekli.EmekliSartlari_EmeklilikYasiGelmisMi: Boolean;
begin
Result := fSigortalininYasi >= fEmeklilikIcinGerekliYas;
FoutGerekliYas :=fEmeklilikIcinGerekliYas;
FoutGecerliYas := fSigortalininYasi;
flog.Add('Sigortalýnýn emekli olabilmesi için gerekli olan yaþ :' + inttostr(fEmeklilikIcinGerekliYas));
flog.Add('Sigortalýnýn þu an ki yaþý :' + inttostr(fSigortalininYasi));

if Result = False Then
begin
  if IncYear(fDogumTarihi,fEmeklilikIcinGerekliYas) > fEmekliOlabilecegiTarih then
     fEmekliOlabilecegiTarih := YasiniDolduracagiTarihiBul(fDogumTarihi,fEmeklilikIcinGerekliYas);
end;

end;

function TEmekli.EmekliSartlari_SigortalilikSuresiniDoldurmusMu: Boolean;
var
tempGecerliTarih:TDate;
begin

if getSigortaliBaslangicTarihi >= StrToDate('01.04.1981') then
begin
   if  YearsBetween(getSigortaliBaslangicTarihi,fDogumTarihi) <18 then
   begin
     tempGecerliTarih := IncYear(fDogumTarihi,18);
     if tempGecerliTarih > FHesaplamaYapilacakTarih then tempGecerliTarih :=FHesaplamaYapilacakTarih;
     Result := YearsBetween(FHesaplamaYapilacakTarih,tempGecerliTarih) >= fEmeklilikIcinGerekliSigortaSuresi;
     FoutGerekliHizmetYili :=fEmeklilikIcinGerekliSigortaSuresi;
     FoutGecerliHizmetYili :=YearsBetween(FHesaplamaYapilacakTarih,tempGecerliTarih);
     flog.Add('Sigortalýnýn emekli olabilmesi için gerekli olan hizmet yýlý :' + inttostr(fEmeklilikIcinGerekliSigortaSuresi));
     flog.Add('Sigortalýnýn þu an ki hizmet yýlý :' + inttostr(YearsBetween(FHesaplamaYapilacakTarih,tempGecerliTarih)));
     flog.Add('Sigortalý 18 yaþýndan önce iþe girdiðinden giriþ tarihi 18 yaþýna çekildi -->' + datetostr(tempGecerliTarih));
   end
   else
   begin
    Result := YearsBetween(FHesaplamaYapilacakTarih,getSigortaliBaslangicTarihi) >= fEmeklilikIcinGerekliSigortaSuresi;
    FoutGerekliHizmetYili :=fEmeklilikIcinGerekliSigortaSuresi;
    FoutGecerliHizmetYili :=YearsBetween(FHesaplamaYapilacakTarih,getSigortaliBaslangicTarihi);
    flog.Add('Sigortalýnýn emekli olabilmesi için gerekli olan hizmet yýlý :' + inttostr(fEmeklilikIcinGerekliSigortaSuresi));
    flog.Add('Sigortalýnýn þu an ki hizmet yýlý :' + inttostr(YearsBetween(FHesaplamaYapilacakTarih,getSigortaliBaslangicTarihi)));
   end;
end
else
begin
  Result := YearsBetween(FHesaplamaYapilacakTarih,getSigortaliBaslangicTarihi) >= fEmeklilikIcinGerekliSigortaSuresi;
  FoutGerekliHizmetYili :=fEmeklilikIcinGerekliSigortaSuresi;
  FoutGecerliHizmetYili :=YearsBetween(FHesaplamaYapilacakTarih,getSigortaliBaslangicTarihi);
  flog.Add('Sigortalýnýn emekli olabilmesi için gerekli olan hizmet yýlý :' + inttostr(fEmeklilikIcinGerekliSigortaSuresi));
  flog.Add('Sigortalýnýn þu an ki hizmet yýlý :' + inttostr(YearsBetween(FHesaplamaYapilacakTarih,getSigortaliBaslangicTarihi)));
end;

if Result = False Then
begin
  if IncYear(getSigortaliBaslangicTarihi,FoutGerekliHizmetYili) > fEmekliOlabilecegiTarih then
     fEmekliOlabilecegiTarih := HizmetYiliniTamamlayacagiTarihiBul(getSigortaliBaslangicTarihi,FoutGerekliHizmetYili);
end;

end;

function TEmekli.EmekliSartlari_YeterliPrimiVarMi: Boolean;
var
fark:smallint;
begin
Result := getPrimOdemeGunSayisi >= fEmeklilikIcinGerekliPrimOdemeGunSayisi;
FoutGerekliPrimSayisi :=fEmeklilikIcinGerekliPrimOdemeGunSayisi;
FoutGecerliPrimSayisi := getPrimOdemeGunSayisi;
flog.Add('Sigortalýnýn ödemesi gereken prim sayýsý:' + inttostr(fEmeklilikIcinGerekliPrimOdemeGunSayisi));
flog.Add('Sigortalýnýn ödemiþ olduðu prim sayýsý:' + inttostr(getPrimOdemeGunSayisi));
if Result = False Then
begin
   fEmekliOlabilecegiTarih := FHesaplamaYapilacakTarih;
   fark:=fEmeklilikIcinGerekliPrimOdemeGunSayisi - getPrimOdemeGunSayisi;
   fEmekliOlabilecegiTarih := PrimSayisiniTamamlayacagiTarihiBul(fEmekliOlabilecegiTarih,Fark);

end;
end;

procedure TEmekli.ErkeklerIcinGerekliOlanEmeklilikSartlariniBul;
begin


fEmeklilikIcinGerekliSigortaSuresi       := 25;

if  getSigortaliBaslangicTarihi <= StrToDate('08.09.1976') then
begin
  if fSigortalininYasi >=55 Then
  begin
    fEmeklilikIcinGerekliSigortaSuresi       := 15;
    fEmeklilikIcinGerekliYas                 := 55;
    fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 3600;
  end
  else
  begin
    fEmeklilikIcinGerekliYas                 := 0;
    fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5000;
  end;

end
else
if (getSigortaliBaslangicTarihi >= StrToDate('09.09.1976')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1979')) then
begin
  fEmeklilikIcinGerekliYas                 := 44;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5000;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1979')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.11.1980')) then
begin
  fEmeklilikIcinGerekliYas                 := 45;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5000;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.11.1980')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1982')) then
begin
  fEmeklilikIcinGerekliYas                 := 46;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5075;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1982')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.11.1983')) then
begin
  fEmeklilikIcinGerekliYas                 := 47;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5150;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.11.1983')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1985')) then
begin
  fEmeklilikIcinGerekliYas                 := 48;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5225;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1985')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.11.1986')) then
begin
  fEmeklilikIcinGerekliYas                 := 49;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5300;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.11.1986')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1988')) then
begin
  fEmeklilikIcinGerekliYas                 := 50;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5375;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1988')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.11.1989')) then
begin
  fEmeklilikIcinGerekliYas                 := 51;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5450;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.11.1989')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1991')) then
begin
  fEmeklilikIcinGerekliYas                 := 52;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5525;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1991')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.11.1992')) then
begin
  fEmeklilikIcinGerekliYas                 := 53;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5600;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.11.1992')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1994')) then
begin
  fEmeklilikIcinGerekliYas                 := 54;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5675;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1994')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.11.1995')) then
begin
  fEmeklilikIcinGerekliYas                 := 55;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5750;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.11.1995')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1997')) then
begin
  fEmeklilikIcinGerekliYas                 := 56;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5825;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1997')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.11.1998')) then
begin
  fEmeklilikIcinGerekliYas                 := 57;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5900;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.11.1998')) and
   (getSigortaliBaslangicTarihi <= StrToDate('08.09.1999')) then
begin
  fEmeklilikIcinGerekliYas                 := 58;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5975;
end
else
if getSigortaliBaslangicTarihi >= StrToDate('09.09.1999') then
begin
  fEmeklilikIcinGerekliYas                 := 60;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 7000;
end;
end;

procedure TEmekli.ErkeklerIcinGerekliOlanEmeklilikSartlariniBul_YastanEmeklilik;
begin
fEmeklilikIcinGerekliSigortaSuresi_YastanEmeklilik       := 15;
fEmeklilikIcinGerekliPrimOdemeGunSayisi_YastanEmeklilik := 3600;

if  FYastanEmeklilikIcinSonSartinSaglandigiTarih <= StrToDate('23.05.2002') then
    fEmeklilikIcinGerekliYas_YastanEmeklilik := 55
else
if  (FYastanEmeklilikIcinSonSartinSaglandigiTarih >= StrToDate('24.05.2002')) and
    (FYastanEmeklilikIcinSonSartinSaglandigiTarih <= StrToDate('23.05.2005'))  then
    fEmeklilikIcinGerekliYas_YastanEmeklilik := 56
else
if  (FYastanEmeklilikIcinSonSartinSaglandigiTarih >= StrToDate('24.05.2005')) and
    (FYastanEmeklilikIcinSonSartinSaglandigiTarih <= StrToDate('23.05.2008'))  then
    fEmeklilikIcinGerekliYas_YastanEmeklilik := 57
else
if  (FYastanEmeklilikIcinSonSartinSaglandigiTarih >= StrToDate('24.05.2008')) and
    (FYastanEmeklilikIcinSonSartinSaglandigiTarih <= StrToDate('23.05.2011'))  then
    fEmeklilikIcinGerekliYas_YastanEmeklilik := 58
else
if  (FYastanEmeklilikIcinSonSartinSaglandigiTarih >= StrToDate('24.05.2011')) and
    (FYastanEmeklilikIcinSonSartinSaglandigiTarih <= StrToDate('23.05.2014'))  then
    fEmeklilikIcinGerekliYas_YastanEmeklilik := 59
else
    fEmeklilikIcinGerekliYas_YastanEmeklilik := 60

end;

function TEmekli.GerekliOlanPrimOdemeGunSayisiniBul(
  aTarih: TDate): Smallint;
begin

//


end;

function TEmekli.getCinsiyet: TCinsiyet;
begin
Result :=fCinsiyet;
end;

function TEmekli.getDogumTarihi: TDate;
begin
result := fDogumTarihi;
end;

function TEmekli.getIlkIseGirisTarihi: string;
begin
if (FAskerlikBorclanmaPrimSayisi > 0) and (FAskerlikBorclanmaTarihi < fSigortaliBaslangicTarihi) then
begin
    result := DateToStr(getSigortaliBaslangicTarihi);
    log.Add('Askerlik borçlanmasýndan dolayý iþe giriþ geri çekildi.');
end
else
  result :=  DateToStr(getSigortaliBaslangicTarihi);
end;

function TEmekli.getPrimOdemeGunSayisi: Smallint;
begin
result := fPrimOdemeGunSayisi + FIstegePrimOdemeGunSayisi + FAskerlikBorclanmaPrimSayisi + FEmekliSandigiPrimSayisi + FBagKurPrimSayisi;
end;

function TEmekli.getSigortaliBaslangicTarihi: TDate;
begin
if (FAskerlikBorclanmaPrimSayisi > 0) and (FAskerlikBorclanmaTarihi < fSigortaliBaslangicTarihi) then
begin
    result := fSigortaliBaslangicTarihi - FAskerlikBorclanmaPrimSayisi;
 //   log.Add('Askerlik borçlanmasýndan dolayý iþe giriþ geri çekildi -->'+ DateToStr(Result));
end
else
  result :=  fSigortaliBaslangicTarihi;
end;

function TEmekli.HizmetYiliniTamamlayacagiTarihiBul(
  aSigortayaGirisTarihi: TDate; aHizmetYili: Byte): TDate;
begin
Result := IncYear(aSigortayaGirisTarihi,aHizmetYili);
end;

procedure TEmekli.KadinlarIcinGerekliOlanEmeklilikSartlariniBul;
begin
fEmeklilikIcinGerekliSigortaSuresi       := 20;

if  getSigortaliBaslangicTarihi <= StrToDate('08.09.1981') then
begin
  if fSigortalininYasi >= 50 then
  begin
    fEmeklilikIcinGerekliSigortaSuresi       := 15;
    fEmeklilikIcinGerekliYas                 := 50;
    fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 3600;
  end
  else
  begin
    fEmeklilikIcinGerekliYas                 := 0;
    fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5000;
  end;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('09.09.1981')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1984')) then
begin
  fEmeklilikIcinGerekliYas                 := 40;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5000;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1984')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1985')) then
begin
  fEmeklilikIcinGerekliYas                 := 41;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5000;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1985')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1986')) then
begin
  fEmeklilikIcinGerekliYas                 := 42;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5075;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1986')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1987')) then
begin
  fEmeklilikIcinGerekliYas                 := 43;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5150;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1987')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1988')) then
begin
  fEmeklilikIcinGerekliYas                 := 44;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5225;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1988')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1989')) then
begin
  fEmeklilikIcinGerekliYas                 := 45;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5300;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1989')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1990')) then
begin
  fEmeklilikIcinGerekliYas                 := 46;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5375;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1990')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1991')) then
begin
  fEmeklilikIcinGerekliYas                 := 47;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5450;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1991')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1992')) then
begin
  fEmeklilikIcinGerekliYas                 := 48;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5525;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1992')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1993')) then
begin
  fEmeklilikIcinGerekliYas                 := 49;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5600;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1993')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1994')) then
begin
  fEmeklilikIcinGerekliYas                 := 50;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5675;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1994')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1995')) then
begin
  fEmeklilikIcinGerekliYas                 := 51;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5750;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1995')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1996')) then
begin
  fEmeklilikIcinGerekliYas                 := 52;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5825;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1996')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1997')) then
begin
  fEmeklilikIcinGerekliYas                 := 53;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5900;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1997')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1998')) then
begin
  fEmeklilikIcinGerekliYas                 := 54;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5975;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1998')) and
   (getSigortaliBaslangicTarihi <= StrToDate('23.05.1999')) then
begin
  fEmeklilikIcinGerekliYas                 := 55;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5975;
end
else
if (getSigortaliBaslangicTarihi >= StrToDate('24.05.1999')) and
   (getSigortaliBaslangicTarihi <= StrToDate('08.09.1999')) then
begin
  fEmeklilikIcinGerekliYas                 := 56;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 5975;
end
else
if getSigortaliBaslangicTarihi >= StrToDate('09.09.1999') then
begin
  fEmeklilikIcinGerekliYas                 := 58;
  fEmeklilikIcinGerekliPrimOdemeGunSayisi  := 7000;
end;

end;

procedure TEmekli.KadinlarIcinGerekliOlanEmeklilikSartlariniBul_YastanEmeklilik;
begin
fEmeklilikIcinGerekliSigortaSuresi_YastanEmeklilik       := 15;
fEmeklilikIcinGerekliPrimOdemeGunSayisi_YastanEmeklilik := 3600;

if  FYastanEmeklilikIcinSonSartinSaglandigiTarih <= StrToDate('23.05.2002') then
    fEmeklilikIcinGerekliYas_YastanEmeklilik := 50
else
if  (FYastanEmeklilikIcinSonSartinSaglandigiTarih >= StrToDate('24.05.2002')) and
    (FYastanEmeklilikIcinSonSartinSaglandigiTarih <= StrToDate('23.05.2005'))  then
    fEmeklilikIcinGerekliYas_YastanEmeklilik := 52
else
if  (FYastanEmeklilikIcinSonSartinSaglandigiTarih >= StrToDate('24.05.2005')) and
    (FYastanEmeklilikIcinSonSartinSaglandigiTarih <= StrToDate('23.05.2008'))  then
    fEmeklilikIcinGerekliYas_YastanEmeklilik := 54
else
if  (FYastanEmeklilikIcinSonSartinSaglandigiTarih >= StrToDate('24.05.2008')) and
    (FYastanEmeklilikIcinSonSartinSaglandigiTarih <= StrToDate('23.05.2011'))  then
    fEmeklilikIcinGerekliYas_YastanEmeklilik := 56
else
    fEmeklilikIcinGerekliYas_YastanEmeklilik := 58
end;

function TEmekli.PrimSayisiniTamamlayacagiTarihiBul(
  aHesaplamaYapilanTarih: TDate;
  aOdemesiGerekenPrimSayisi: Smallint): TDate;
begin
   Result := IncMonth(aHesaplamaYapilanTarih,aOdemesiGerekenPrimSayisi div 30);
   Result := IncDay(Result,aOdemesiGerekenPrimSayisi mod 30);
end;

procedure TEmekli.SetAskerlikBorclanmaPrimSayisi(const Value: Smallint);
begin
  FAskerlikBorclanmaPrimSayisi := Value;
end;

procedure TEmekli.SetAskerlikBorclanmaTarihi(const Value: TDate);
begin
  FAskerlikBorclanmaTarihi := Value;
end;

procedure TEmekli.SetBagKurPrimSayisi(const Value: Smallint);
begin
  FBagKurPrimSayisi := Value;
end;

procedure TEmekli.setCinsiyet(const Value: TCinsiyet);
begin
fCinsiyet := Value;
end;


procedure TEmekli.setDogumTarihi(const Value: TDate);
begin
fDogumTarihi := Value;
end;



procedure TEmekli.SetEmekliSandigiPrimSayisi(const Value: Smallint);
begin
  FEmekliSandigiPrimSayisi := Value;
end;

procedure TEmekli.SetIstegePrimOdemeGunSayisi(const Value: Smallint);
begin
  FIstegePrimOdemeGunSayisi := Value;
end;

procedure TEmekli.setPrimOdemeGunSayisi(const Value: Smallint);
begin
fPrimOdemeGunSayisi := Value;
end;

procedure TEmekli.setSigortaliBaslangicTarihi(const Value: TDate);
begin
fSigortaliBaslangicTarihi := Value;
end;

procedure TEmekli.SetYastanEmeklilikIcinSonSartinSaglandigiTarih(
  const Value: TDate);
begin
  FYastanEmeklilikIcinSonSartinSaglandigiTarih := Value;
end;

function TEmekli.YasiniDolduracagiTarihiBul(aDogumTarihi: TDate;
  aGerekliYas: Byte): TDate;
begin
   Result := IncYear(aDogumTarihi,aGerekliYas);
end;

end.
