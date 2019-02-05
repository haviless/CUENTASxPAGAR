unit CXP231;

// Actualizaciones    :
// HPC_201501_CXP  24/04/2015  Importación de Recibos por Honorarios Electrónicos.
// HPC_201602_CXP  14/04/2016  DAF_2016000190_CXP_1
//                             Bifurcación de Cuenta y Concepto Cta 42 por Tipo de Moneda
//                             Asigna Orden de Cuenta Contable a Tabla de Conceptos
//                             Valida Concepto y Cuenta Contable
//                             Diferencia Tipo de Moneda de acuerdo a registro que se importa
//                             Reordena control Transaccional en grabación de Provisión por Pagar
//
// HPC_201701_CXP  26/04/2017  Importación de Recibos por Honorarios Electrónicos, validaciones de la suspensión
//                             de cuarta categoría cuando el TR es 10 y sean mayores a S/. 1500.00 antes de registrar.
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, wwdbedit, wwdbdatetimepicker, wwdblook,
  ExtCtrls, Wwdbdlg, Wwdbigrd, Grids, Wwdbgrid;

type
  TFImpRecHonElectCXP = class(TForm)
    bbtnRegAnt: TBitBtn;
    bbtnRegSig: TBitBtn;
    gbPersonaNatural: TGroupBox;
    lblTipodocumento: TLabel;
    lblNumDocumento: TLabel;
    lblNombre: TLabel;
    lblNombre2: TLabel;
    lblApPaterno: TLabel;
    lblApMaterno: TLabel;
    lblNacionalidad: TLabel;
    lblSexo: TLabel;
    dblcTipDoc: TwwDBLookupCombo;
    edtTipDoc: TEdit;
    dbeDNI: TwwDBEdit;
    dbeNombres: TwwDBEdit;
    dbeSnombres: TwwDBEdit;
    dbeApepat: TwwDBEdit;
    dbeApemat: TwwDBEdit;
    dblcdPais: TwwDBLookupComboDlg;
    dbePais: TEdit;
    dblcSexo: TwwDBLookupCombo;
    Label1: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label17: TLabel;
    dblcClAux: TwwDBLookupCombo;
    dbeClAux: TEdit;
    dbeProv: TwwDBEdit;
    dblcTipper: TwwDBLookupCombo;
    dbeTipPer: TEdit;
    dbeRuc: TwwDBEdit;
    gbDatosGenerales: TGroupBox;
    lblCorrelativo: TLabel;
    lblCia: TLabel;
    lblFecComp: TLabel;
    lblAnoMes: TLabel;
    lblProvNom: TLabel;
    dbeCorrelativo: TwwDBEdit;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dtpFComp: TwwDBDateTimePicker;
    dbeAnoMM: TwwDBEdit;
    edtProv: TEdit;
    gbDatosRHCab: TGroupBox;
    lblTDoc: TLabel;
    lblSerie: TLabel;
    lblNoDoc: TLabel;
    lblTDiario: TLabel;
    lblNoReg: TLabel;
    lblFecDoc: TLabel;
    lblGlosa: TLabel;
    lblTMon: TLabel;
    dblcTDoc: TwwDBLookupCombo;
    edtTDoc: TEdit;
    edtSerie: TwwDBEdit;
    edtNoDoc: TwwDBEdit;
    edtTDiario: TEdit;
    meNoReg: TwwDBEdit;
    dbeTDiario: TwwDBEdit;
    dtpFEmis: TwwDBDateTimePicker;
    pnlEstado: TPanel;
    lblEstado: TLabel;
    Label3: TLabel;
    dbeGlosa: TwwDBEdit;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    gbDatosRHDet: TGroupBox;
    bbtnEnv_a_CxP: TBitBtn;
    Label2: TLabel;
    dbeNombreTotal: TwwDBEdit;
    dbgDetCxP: TwwDBGrid;
    pnlRegistro: TPanel;
    lblTipReg: TLabel;
    lblCnpEgr: TLabel;
    lblCCosto: TLabel;
    lblDH: TLabel;
    lblImporte: TLabel;
    Label4: TLabel;
    lblCuenta: TLabel;
    dblcTipReg: TwwDBLookupCombo;
    dblcdCnpEgr: TwwDBLookupComboDlg;
    dblcdCCosto: TwwDBLookupComboDlg;
    edtTipReg: TEdit;
    edtCCosto: TEdit;
    dbeImporte: TwwDBEdit;
    dbeDH: TwwDBEdit;
    bbtnRegOk: TBitBtn;
    bbtnRegCanc: TBitBtn;
    dbeCuenta: TwwDBEdit;
    dbeGlosaDet: TwwDBEdit;
    StaticText1: TStaticText;
    edtPresup: TEdit;
    Label5: TLabel;
    dblcdCCostoCab: TwwDBLookupComboDlg;
    edtCCostoCab: TEdit;
    btnActReg: TBitBtn;
// Inicio HPC_201701_CXP
// 26/04/2017  Importación de Recibos por Honorarios Electrónicos, validaciones de la suspensión
//             de cuarta categoría cuando el TR es 10 y sean mayores a S/. 1500.00 antes de registrar.
    gbExon4ta: TGroupBox;
    Label30: TLabel;
    Label6: TLabel;
    dbeExonera: TwwDBEdit;
    dbdtpFechaExon4ta: TwwDBDateTimePicker;
// Fin HPC_201701_CXP
    procedure LlenaDatosparaCXP;
    procedure bbtnRegAntClick(Sender: TObject);
    procedure bbtnRegSigClick(Sender: TObject);
    procedure btnActRegClick(Sender: TObject);
    procedure dblcdCCostoCabExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnEnv_a_CxPClick(Sender: TObject);
    procedure dblcdCCostoCabEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgDetCxPDblClick(Sender: TObject);
    procedure bbtnRegCancClick(Sender: TObject);
    procedure bbtnRegOkClick(Sender: TObject);
    procedure dtpFCompExit(Sender: TObject);
 // Inicio HPC_201602_CXP
 // DAF_2016000190_CXP_1 Se asigna Orden a Tabla de Conceptos :
 //  - al Ingresar al componente ordena por CUENTAID
    procedure dblcdCnpEgrEnter(Sender: TObject);
 //  - al salir valida Concepto y Cuenta Contable
    procedure dblcdCnpEgrExit(Sender: TObject);
 // Fin HPC_201602_CXP
  private
    { Private declarations }
    Procedure CargaDataSource;
  public
    { Public declarations }
  end;

var
   FImpRecHonElectCXP: TFImpRecHonElectCXP;
   xSQL : String;
   xTCambio : currency;
   xCompletaDatos: Boolean;
   xCptoBasImp, xCtaBasImp : String; // Concepto y Cuenta de Base Imponible
   xCptoRta4ta, xCtaRta4ta : String; // Concepto y Cuenta de Renta de 4ta
   xCptoNeto, xCtaNeto : String; // Concepto y Cuenta del Neto
// Inicio HPC_201701_CXP
// 26/04/2017 Considera Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00
   xValorMinRta4ta : Currency;
// Fin HPC_201701_CXP
implementation

uses CxPDM, CXP230;

{$R *.dfm}

procedure TFImpRecHonElectCXP.bbtnRegAntClick(Sender: TObject);
begin
   if xCompletaDatos then
   begin
      if MessageDlg(' Se registraron valores para este registro nuevo '+chr(13)
                   +'¿Descartar estos datos y continuar al registro anterior? ',
                   mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Exit;
   end;
   DMCXP.cdsQry2.Prior;
   LlenaDatosparaCXP;
end;

procedure TFImpRecHonElectCXP.bbtnRegSigClick(Sender: TObject);
begin
   if xCompletaDatos then
   begin
      if MessageDlg(' Se registraron valores para este registro nuevo '+chr(13)
                   +'¿Descartar estos datos y continuar al registro siguiente? ',
                   mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Exit;
   end;
   DMCXP.cdsQry2.Next;
   LlenaDatosparaCXP;
end;

procedure TFImpRecHonElectCXP.btnActRegClick(Sender: TObject);
var
   wAno, wMes, wDia : word;
   xNumReg : Integer;
begin
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Debe indicar primero la Compañía');
      dblcCia.SetFocus;
      Exit;
   end;

   if length(edtCCostoCab.Text)=0 then
   begin
      ShowMessage('Debe indicar el Centro de Costo');
      dblcdCCostoCab.SetFocus;
      Exit;
   end;

   decodedate(dtpFComp.Date, wAno, wMes, wDia);

// Número de Registro
   meNoReg.Text := DMCXP.UltimoRegistroCXP('S', dblcCia.Text, dbeTDiario.Text,
                      copy(FImpRecHonElect.dbeAnoMM.Text,1,4),
                      copy(FImpRecHonElect.dbeAnoMM.Text,5,2));
   meNoReg.Text := Strzero(meNoReg.Text, 10);

   xNumReg := 1;

   DMCXP.cdsDetCxP.EmptyDataSet;

// Inicio HPC_201602_CXP
// DAF_2016000190_CXP_1
// Diferencia Tipo de Moneda de acuerdo a registro que se importa

// Inserta Base Imponible
   DMCXP.cdsDetCxP.Append;
   DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := dblcCia.Text;
   DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := dbeTDiario.Text;
   DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := meNoReg.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := copy(FImpRecHonElect.dbeAnoMM.Text,1,4);
   DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := FImpRecHonElect.dbeAnoMM.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := 'RH_E';
   DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
   DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   := xCptoBasImp;
   DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xCtaBasImp;
   DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := dbeProv.Text;
   DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := dblcTDoc.Text;
   DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := edtSerie.Text;
   DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := edtNoDoc.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := dbeGlosa.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := 'D';
   DMCXP.cdsDetCxP.FieldByName('CCOSID').AsString   := dblcdCCostoCab.Text;
   DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := xTCambio;

   DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := dblcTMon.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat  := DMCXP.cdsQry2.FieldByName('CPGRAVAD').AsFloat;

   If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString  = DMCXP.wTMonLoc then
   Begin
      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := DMCXP.cdsQry2.FieldByName('CPGRAVAD').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := FRound(DMCXP.cdsQry2.FieldByName('CPGRAVAD').AsFloat / xTCambio, 15, 2);
   End
   Else
   Begin
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := DMCXP.cdsQry2.FieldByName('CPGRAVAD').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := FRound(DMCXP.cdsQry2.FieldByName('CPGRAVAD').AsFloat * xTCambio, 15, 2);
   End;

   DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime:= dtpFEmis.Date;
   DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:= dtpFEmis.Date;
   DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime:= dtpFComp.Date;
   DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'I';
   DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
   DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString    := copy(FImpRecHonElect.dbeAnoMM.Text,5,2);
   DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString    := Strzero(inttostr(wDia),2);
//   DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := DMCXP.wTMonLoc;
// Fin HPC_201602_CXP

   if DMCXP.cdsQry2.FieldByName('CPIGV').AsFloat>0 then
   Begin
      DMCXP.cdsDetCxP.FieldByName('TREGID').AsString   := '01';
      DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString   := 'MG';
   End
   Else
   Begin
      DMCXP.cdsDetCxP.FieldByName('TREGID').AsString   := '10';
      DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString   := 'AN';
   End;
   DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  := xNumReg;
   DMCXP.cdsDetCxP.Post;

// Renta de 4ta Categoría
   if DMCXP.cdsQry2.FieldByName('CPIGV').AsFloat>0 then
   Begin
      xNumReg := xNumreg + 1;

      DMCXP.cdsDetCxP.Append;
      DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := dblcCia.Text;
      DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := dbeTDiario.Text;
      DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := meNoReg.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := copy(FImpRecHonElect.dbeAnoMM.Text,1,4);
      DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := FImpRecHonElect.dbeAnoMM.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := 'RH_E';
      DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
      DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   := xCptoRta4ta;
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xCtaRta4ta;
      DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := dbeProv.Text;
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := dblcTDoc.Text;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := edtSerie.Text;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := edtNoDoc.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := dbeGlosa.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := 'H';
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := xTCambio;

// Inicio HPC_201602_CXP
// DAF_2016000190_CXP_1
// Diferencia Tipo de Moneda de acuerdo a registro que se importa
      DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := dblcTMon.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat  := DMCXP.cdsQry2.FieldByName('CPIGV').AsFloat;

      If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString  = DMCXP.wTMonLoc then
      Begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := DMCXP.cdsQry2.FieldByName('CPIGV').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := FRound(DMCXP.cdsQry2.FieldByName('CPIGV').AsFloat / xTCambio, 15, 2);
      End
      Else
      Begin
// Inicio HPC_201701_CXP
// 26/04/2017 Considera Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := DMCXP.cdsQry2.FieldByName('CPIGV').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := FRound(DMCXP.cdsQry2.FieldByName('CPIGV').AsFloat * xTCambio, 15, 2);
// Fin HPC_201701_CXP
      End;

      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime:= dtpFEmis.Date;
      DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:= dtpFEmis.Date;
      DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime:= dtpFComp.Date;
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'I';
      DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
      DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString    := copy(FImpRecHonElect.dbeAnoMM.Text,5,2);
      DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString    := Strzero(inttostr(wDia),2);
//      DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := DMCXP.wTMonLoc;
// Fin HPC_201602_CXP

      DMCXP.cdsDetCxP.FieldByName('TREGID').AsString   := '12';
      DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString   := 'I1';
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  := xNumReg;
      DMCXP.cdsDetCxP.Post;
   End;

// Inicio HPC_201602_CXP
// DAF_2016000190_CXP_1
// Bifurcación de Cuenta y Concepto Cta 42 por Tipo de Moneda
   if dblcTMon.Text='N' then
   begin
      xCptoNeto := '42101';
      xCtaNeto := '42101';
   end
   else
   begin
      xCptoNeto := '42102';
      xCtaNeto := '42102';
   end;
// Fin HPC_201602_CXP

   xNumReg := xNumreg + 1;
   DMCXP.cdsDetCxP.Append;
   DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := dblcCia.Text;
   DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := dbeTDiario.Text;
   DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := meNoReg.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := copy(FImpRecHonElect.dbeAnoMM.Text,1,4);
   DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := FImpRecHonElect.dbeAnoMM.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := 'RH_E';
   DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
   DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   := xCptoNeto;
   DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xCtaNeto;
   DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := dbeProv.Text;
   DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := dblcTDoc.Text;
   DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := edtSerie.Text;
   DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := edtNoDoc.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := dbeGlosa.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := 'H';
   DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := xTCambio;

// Inicio HPC_201602_CXP
// DAF_2016000190_CXP_1
// Diferencia Tipo de Moneda de acuerdo a registro que se importa
   DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := dblcTMon.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat  := DMCXP.cdsQry2.FieldByName('CPMTOORI').AsFloat;

   If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString  = DMCXP.wTMonLoc then
   Begin
      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := DMCXP.cdsQry2.FieldByName('CPMTOORI').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := FRound(DMCXP.cdsQry2.FieldByName('CPMTOORI').AsFloat / xTCambio, 15, 2);
   End
   Else
   Begin
// Inicio HPC_201701_CXP
// 26/04/2017 Considera Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := DMCXP.cdsQry2.FieldByName('CPMTOORI').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := FRound(DMCXP.cdsQry2.FieldByName('CPMTOORI').AsFloat * xTCambio, 15, 2);
// Fin HPC_201701_CXP
   End;

   DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime:= dtpFEmis.Date;
   DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:= dtpFEmis.Date;
   DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime:= dtpFComp.Date;
   DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'I';
   DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
   DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString    := copy(FImpRecHonElect.dbeAnoMM.Text,5,2);
   DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString    := Strzero(inttostr(wDia),2);
   DMCXP.cdsDetCxP.FieldByName('TREGID').AsString   := '07';
   DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString   := 'TO';
   DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  := xNumReg;
   DMCXP.cdsDetCxP.Post;
// Fin HPC_201602_CXP

   xCompletaDatos := True;
end;

procedure TFImpRecHonElectCXP.dblcdCCostoCabExit(Sender: TObject);
Var
   xWhere: String;
Begin
   if bbtnRegSig.Focused Then exit;

   if bbtnRegAnt.Focused Then exit;

   if length(dblcdCCostoCab.Text)=0 then exit;

   xWhere := 'CCOSID='+quotedstr(dblcdCCostoCab.Text)
           + ' and CCOSMOV=''S'' '
           + ' and CCOSACT=''S'' ';
   if length(dblcCia.Text)>0 then
      xWhere := xWhere
           + ' and CCOSCIAS like (' + quotedstr('%' + dblcCia.Text + '%') + ' )';
   edtCCostoCab.Text := BuscaQry('dspTGE', 'TGE203', 'CCOSDES', xWhere, 'CCOSDES');

   If length(edtCCostoCab.Text) = 0 Then
   Begin
      edtCCostoCab.Text := '';
      ShowMessage('Centro de Costo NO está Activo o disponible para la Compañía');
      dblcdCCostoCab.setfocus;
      Exit;
   End;
   xCompletaDatos := True;

end;

procedure TFImpRecHonElectCXP.LlenaDatosparaCXP;
var
   xWhere : String;
   xAno, xMes, xDia : word;
begin
   xCompletaDatos := False;

// Correlativo
   dbeCorrelativo.DataSource := DMCXP.dsQry2;
   dbeCorrelativo.DataField := 'CORRELATIVO';

// Compañía
   edtCia.Text := '';
   if length(DMCXP.cdsQry2.FieldByName('CIA').AsString)>0 then
   begin
      dblcCia.Text := DMCXP.cdsQry2.FieldByName('CIA').AsString;
      xWhere := 'CIAID=' + quotedstr(dblcCia.Text);
      edtCia.Text := BuscaQry('dspTGE', 'TGE101', 'CIAABR,CIARETIGV,EXOIGV', xWhere, 'CIAABR');
      dblcCia.Enabled := False;
   end
   else
   begin
      dblcCia.LookupTable := DMCXP.cdsCia;
      dblcCia.LookUpField := 'CIAID';
      dblcCia.Enabled := True;
   end;

// Centro de Costo
   edtCCostoCab.Text := '';
   if length(DMCXP.cdsQry2.FieldByName('CCOSID').AsString)>0 then
   begin
      dblcdCCostoCab.Text := DMCXP.cdsQry2.FieldByName('CCOSID').AsString;
      xWhere := 'CCOSID=' + quotedstr(dblcdCCostoCab.Text);
      edtCCostoCab.Text := BuscaQry('dspTGE', 'TGE203', 'CCOSDES', xWhere, 'CCOSDES');
      dblcdCCostoCab.Enabled := False;
   end
   else
   begin
      dblcdCCostoCab.Text := '';
      dblcdCCostoCab.Enabled := True;
   end;

// Periodo (Año+Mes)
   dbeAnoMM.Text := FImpRecHonElect.dbeAnoMM.Text;

// Fecha de Comprobante
   decodedate(DMCXP.cdsQry2.FieldByName('CPFEMIS').AsDateTime, xAno, xMes, xDia);
   if (inttostr(xAno) + Strzero(inttostr(xMes),2)) = dbeAnoMM.Text then
      dtpFComp.date := DMCXP.cdsQry2.FieldByName('CPFEMIS').AsDateTime
   else
      dtpFComp.date := strtoDate('01/' + copy(dbeAnoMM.Text,5,2)+ '/' + copy(dbeAnoMM.Text,1,4));

// Tipo de Cambio
   xTCambio:= 0.00;
   xWhere := 'TMONID = ' + quotedstr(DMCXP.wTMonExt)
           + ' and FECHA = ' + quotedstr(datetostr(DMCXP.cdsQry2.FieldByName('CPFEMIS').AsDateTime));
   if length(BuscaQry('PrvTGE', 'TGE107', '*', xWhere, 'TMONID')) > 0 Then
      xTCambio:=DMCXP.cdsQry.fieldbyname('TCAM' + DMCXP.wVRN_TipoCambio).AsFloat;

// RUC
   dbeRuc.Text := DMCXP.cdsQry2.FieldByName('PROVRUC').AsString;

// Nombre Trabajador
   edtProv.Text := DMCXP.cdsQry2.FieldByName('PROVDES').AsString;
// Inicio HPC_201701_CXP
// 26/04/2017  Importación de Recibos por Honorarios Electrónicos, validaciones de la suspensión
//             de cuarta categoría cuando el TR es 10 y sean mayores a S/. 1500.00 antes de registrar.

   xSQL := 'select CLAUXID, PROV, PROVDES, PROVRUC, FECEXON4TA, TIPPERID, TIPDOCID, '
         + '       PROVDNI, PAISID, PROVNOMBRE, PROVNOMBRE1, PROVAPEPAT, PROVAPEMAT, SEXO, PROVEXONER,'
         + '       case when CLAUXID=''H'' then 1 '
         + '            when CLAUXID=''Z'' then 2 '
         + '            when CLAUXID=''D'' then 3 '
         + '            when CLAUXID=''P'' then 4 '
         + '            else 5 '
         + '        end ORDENCLASE'
         + '  from TGE201 '
         + ' where PROVRUC='+quotedstr(DMCXP.cdsQry2.FieldByName('PROVRUC').AsString);
// Fin HPC_201701_CXP
   DMCXP.cdsQry3.Close;
   DMCXP.cdsQry3.DataRequest(xSQL);
   DMCXP.cdsQry3.Open;
   DMCXP.cdsQry3.IndexFieldNames := 'ORDENCLASE';
   dbeNombreTotal.Text := DMCXP.cdsQry2.FieldByName('PROVDES').AsString;
   if DMCXP.cdsQry3.RecordCount>0 then
   Begin
      DMCXP.cdsQry3.First;
      dblcClAux.Text  := DMCXP.cdsQry3.FieldByName('CLAUXID').AsString; // Clase Auxiliar
      dbeProv.Text    := DMCXP.cdsQry3.FieldByName('PROV').AsString; // Código de Proveedor
      dbeRuc.Text     := DMCXP.cdsQry2.FieldByName('PROVRUC').AsString; // RUC de Proveedor
      dblcTipper.Text := DMCXP.cdsQry3.FieldByName('TIPPERID').AsString; // Tipo de Persona
      dblcTipDoc.Text := DMCXP.cdsQry3.FieldByName('TIPDOCID').AsString; // Tipo de Documento de Identidad del Proveedor
      dbeDNI.Text     := DMCXP.cdsQry3.FieldByName('PROVDNI').AsString; // Número de Documento de Identidad
      dblcdPais.Text  := DMCXP.cdsQry3.FieldByName('PAISID').AsString; // Nacionalidad del Proveedor
      dblcSexo.Text   := DMCXP.cdsQry3.FieldByName('SEXO').AsString; // dblcSexo
      dbeNombres.Text := DMCXP.cdsQry3.FieldByName('PROVNOMBRE').AsString; // Primer Nombre del Proveedor
      dbeSnombres.Text:= DMCXP.cdsQry3.FieldByName('PROVNOMBRE1').AsString; // Segundo Nombre del Proveedor
      dbeApepat.Text  := DMCXP.cdsQry3.FieldByName('PROVAPEPAT').AsString; // Apellido Paterno del Proveedor
      dbeApemat.Text  := DMCXP.cdsQry3.FieldByName('PROVAPEMAT').AsString; // Apellido Materno del Proveedor
// Inicio HPC_201701_CXP
// 26/04/2017  Importación de Recibos por Honorarios Electrónicos, validaciones de la suspensión
//             de cuarta categoría cuando el TR es 10 y sean mayores a S/. 1500.00 antes de registrar.

      dbeExonera.Text := DMCXP.cdsQry3.FieldByName('PROVEXONER').AsString; // Número de Exoneración
      dbdtpFechaExon4ta.Date := DMCXP.cdsQry3.FieldByName('FECEXON4TA').AsdateTime; // Fecha de Exoneración
// Fin HPC_201701_CXP
      dblcClAux.Enabled  := False; // Clase Auxiliar
      dbeProv.Enabled    := False; // Código de Proveedor
      dbeRuc.Enabled     := False; // RUC de Proveedor
      dblcTipper.Enabled := False; // Tipo de Persona
      dblcTipDoc.Enabled := False; // Tipo de Documento de Identidad del Proveedor
      dbeDNI.Enabled     := False; // Número de Documento de Identidad
      dblcdPais.Enabled  := False; // Nacionalidad del Proveedor
      dblcSexo.Enabled   := False; // dblcSexo
      dbeNombres.Enabled := False; // Primer Nombre del Proveedor
      dbeSnombres.Enabled:= False; // Segundo Nombre del Proveedor
      dbeApepat.Enabled  := False; // Apellido Paterno del Proveedor
      dbeApemat.Enabled  := False; // Apellido Materno del Proveedor
   End
   Else
   Begin
      dblcClAux.Text  := 'H'; // Clase Auxiliar

   // Código de Proveedor
      xSQL := 'select F_MAX_PROV(' + quotedstr(dblcClAux.Text) + ') NPROV from DUAL';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      dbeProv.Text    := DMCXP.cdsQry.FieldByName('NPROV').AsString; // Código de Proveedor

      dbeRuc.Text     := DMCXP.cdsQry2.FieldByName('PROVRUC').AsString; // RUC de Proveedor
      dblcTipper.Text := '01'; // Tipo de Persona
      dblcTipDoc.Text := '01'; // Tipo de Documento de Identidad del Proveedor
      dbeDNI.Text     := copy(DMCXP.cdsQry2.FieldByName('PROVRUC').AsString,3,8); // Número de Documento de Identidad
      dblcdPais.Text  := '01'; // Nacionalidad del Proveedor
      dbeNombres.Text := ''; // Primer Nombre del Proveedor
      dbeSnombres.Text:= ''; // Segundo Nombre del Proveedor
      dbeApepat.Text  := ''; // Apellido Paterno del Proveedor
      dbeApemat.Text  := ''; // Apellido Materno del Proveedor

      dblcClAux.Enabled  := True; // Clase Auxiliar
      dbeProv.Enabled    := True; // Código de Proveedor
      dbeRuc.Enabled     := True; // RUC de Proveedor
      dblcTipper.Enabled := True; // Tipo de Persona
      dblcTipDoc.Enabled := True; // Tipo de Documento de Identidad del Proveedor
      dbeDNI.Enabled     := True; // Número de Documento de Identidad
      dblcdPais.Enabled  := True; // Nacionalidad del Proveedor
      dblcSexo.Enabled   := True; // dblcSexo
      dbeNombres.Enabled := True; // Primer Nombre del Proveedor
      dbeSnombres.Enabled:= True; // Segundo Nombre del Proveedor
      dbeApepat.Enabled  := True; // Apellido Paterno del Proveedor
      dbeApemat.Enabled  := True; // Apellido Materno del Proveedor
   End;
// Inicio HPC_201701_CXP
// 26/04/2017  Importación de Recibos por Honorarios Electrónicos, validaciones de la suspensión
//             de cuarta categoría cuando el TR es 10 y sean mayores a S/. 1500.00 antes de registrar.
   dbeExonera.DataSource := DMCXP.dsQry3;
   dbdtpFechaExon4ta.DataSource := DMCXP.dsQry3;
   DMCXP.cdsQry3.IndexFieldNames := '';
// Fin HPC_201701_CXP
// Descripción de Clase de Auxiliar
   xSQL := 'CLAUXID='+quotedstr(dblcClAux.Text);
   dbeClAux.Text := BuscaQry('dspTGE', 'TGE102', 'CLAUXDES', xSQL, 'CLAUXDES');

// Descripción de Tipo de Persona
   xSQL := 'TIPPERID='+quotedstr(dblcTipPer.Text);
   dbeTipPer.Text := BuscaQry('dspTGE', 'TGE109', 'TIPPERDES', xSQL, 'TIPPERDES');

// Descripción Tipo Documento de Identidad
   xSQL := 'TIPDOCID='+quotedstr(dblcTipDoc.Text);
   edtTipDoc.Text := BuscaQry('dspTGE', 'SUNAT101', 'TIPDOCDES', xSQL, 'TIPDOCDES');

// Descripción de Nacionalidad del Proveedor
   xSQL := 'PAISID='+quotedstr(dblcdPais.Text);
   dbePais.Text := BuscaQry('dspTGE', 'TGE118', 'PAISDES', xSQL, 'PAISDES');

// Fecha de Emisión
   dtpFEmis.Date := DMCXP.cdsQry2.FieldByName('CPFEMIS').AsDateTime;

// Tipo de Documento
   dblcTDoc.Text := DMCXP.cdsQry2.FieldByName('DOCID').AsString;

   xSQL := 'Select TGE110.DOCDES, TGE110.TDIARID, TGE104.TDIARDES '
         + '  from TGE110, TGE104 '
         + ' where TGE110.DOCMOD=''CXP'' '
         + '   and TGE110.DOCID='+quotedstr(DMCXP.cdsQry2.FieldByName('DOCID').AsString)
         + '   and TGE104.TDIARID(+)=TGE110.TDIARID';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   if DMCXP.cdsQry.RecordCount=0 then
   Begin
      dblcTDoc.Text := '02';
      xSQL := 'Select TGE110.DOCDES, TGE110.TDIARID, TGE104.TDIARDES '
            + '  from TGE110, TGE104 '
            + ' where TGE110.DOCMOD=''CXP'' '
            + '   and TGE110.DOCID='+quotedstr(dblcTDoc.Text)
            + '   and TGE104.TDIARID(+)=TGE110.TDIARID';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
   End;

// Documento
   edtTDoc.Text := DMCXP.cdsQry.FieldByName('DOCDES').AsString;

// Tipo de Diario
   dbeTDiario.Text := DMCXP.cdsQry.FieldByName('TDIARID').AsString;
   edtTDiario.Text := DMCXP.cdsQry.FieldByName('TDIARDES').AsString;

// Número de Serie
   edtSerie.Text := DMCXP.cdsQry2.FieldByName('CPSERIE').AsString;

// Número de documento
   edtNoDoc.Text := DMCXP.cdsQry2.FieldByName('CPNODOC').AsString;

// Tipo de Moneda
   dblcTMon.Text := DMCXP.cdsQry2.FieldByName('TMONID').AsString;
   xSQL := 'TMONID='+quotedstr(DMCXP.cdsQry2.FieldByName('TMONID').AsString);
   edtTMon.Text  := BuscaQry('dspTGE', 'TGE103', 'TMONDES', xSQL, 'TMONDES');

// Glosa
   dbeGlosa.Text := DMCXP.cdsQry2.FieldByName('CPGLOSA').AsString;

// Número de Registro
   meNoReg.Text := DMCXP.cdsQry2.FieldByName('NOREG').AsString;

// Estado  NUEVO=FUCSIA
   if DMCXP.cdsQry2.FieldByName('CPESTADO').AsString='T' then
   Begin
      lblEstado.Caption := 'NUEVO';
      lblEstado.Font.Color := clFuchsia;
   End;

// Estado  ACTIVO(INICIAL)=VERDE
   if DMCXP.cdsQry2.FieldByName('CPESTADO').AsString='I' then
   Begin
      lblEstado.Caption := 'INICIAL';
      lblEstado.Font.Color := clGreen;
   End;

// Estado  ACEPTADO=AZUL
   if DMCXP.cdsQry2.FieldByName('CPESTADO').AsString='P' then
   Begin
      lblEstado.Caption := 'ACEPTADO';
      lblEstado.Font.Color := clBlue;
   End;

// Estado  CANCELADO=AZUL
   if DMCXP.cdsQry2.FieldByName('CPESTADO').AsString='C' then
   Begin
      lblEstado.Caption := 'CANCELADO';
      lblEstado.Font.Color := clBlue;
   End;

// Estado  REVERTIDO=ROJO
   if DMCXP.cdsQry2.FieldByName('CPESTADO').AsString='R' then
   Begin
      lblEstado.Caption := 'REVERTIDO';
      lblEstado.Font.Color := clRed;
   End;

// Estado  ANULADO=ROJO
   if DMCXP.cdsQry2.FieldByName('CPESTADO').AsString='A' then
   Begin
      lblEstado.Caption := 'ANULADO';
      lblEstado.Font.Color := clRed;
   End;

   if (DMCXP.cdsQry2.FieldByName('ENVIADO_A_CXP').AsString = 'S') or
      (DMCXP.cdsQry2.FieldByName('CPESTADO').AsString='R') then
   Begin
      dtpFComp.Enabled := False;
      dtpFEmis.Enabled := False;
      dblcTDoc.Enabled := False;
      edtSerie.Enabled := False;
      edtNoDoc.Enabled := False;
      dbeTDiario.Enabled := False;
      dblcdCCostoCab.Enabled := False;
      dblcTMon.Enabled := False;
      dbeGlosa.Enabled := False;
      meNoReg.Enabled  := False;
      bbtnEnv_a_CxP.Enabled := False;
      btnActReg.Enabled := False;

      xSQL := 'Select CIAID, TDIARID, CPNOREG, DCPANOC, DCPANOMM, DCPLOTE, TRANSID, CPTOID, '
            + '       CUENTAID, CLAUXID, DCPAUXID, DOCID, CPSERIE, CPNODOC, DCPGLOSA, DCPDH, '
            + '       CCOSID, CPTCAMPR, DCPMOORI, DCPMOLOC, DCPMOEXT, CPFEMIS, CPFVCMTO, DCPFCOM, '
            + '       DCPESTDO, DCPUSER, DCPFREG, DCPHREG, DCPMM, DCPDD, '
            + '       TREGID, TMONID, TIPDET, DCPREG '
            + '  from CXP302 '
            + ' where CIAID='+quotedstr(DMCXP.cdsQry2.FieldByName('CIA').AsString)
            + '   and DCPANOMM='+quotedstr(DMCXP.cdsQry2.FieldByName('ANOMES').AsString)
            + '   and TDIARID='+quotedstr(DMCXP.cdsQry2.FieldByName('TDIARIO').AsString)
            + '   and CPNOREG='+quotedstr(DMCXP.cdsQry2.FieldByName('NOREG').AsString)
            + ' Order by DCPREG';
   End
   Else
   Begin
      dtpFComp.Enabled := True;
      dtpFEmis.Enabled := False;
      dblcTDoc.Enabled := False;
      edtSerie.Enabled := False;
      edtNoDoc.Enabled := False;
      dbeTDiario.Enabled := False;
      dblcdCCostoCab.Enabled := True;
      dblcTMon.Enabled := False;
      dbeGlosa.Enabled := True;
      meNoReg.Enabled  := False;
      bbtnEnv_a_CxP.Enabled := True;
      btnActReg.Enabled := True;
      xSQL := 'Select CIAID, TDIARID, CPNOREG, DCPANOC, DCPANOMM, DCPLOTE, TRANSID, CPTOID, '
            + '       CUENTAID, CLAUXID, DCPAUXID, DOCID, CPSERIE, CPNODOC, DCPGLOSA, DCPDH, '
            + '       CCOSID, CPTCAMPR, DCPMOORI, DCPMOLOC, DCPMOEXT, CPFEMIS, CPFVCMTO, DCPFCOM, '
            + '       DCPESTDO, DCPUSER, DCPFREG, DCPHREG, DCPMM, DCPDD, '
            + '       TREGID, TMONID, TIPDET, DCPREG '
            + '  from CXP302 '
            + ' where 1<>1';
   End;
   DMCXP.cdsDetCxP.Close;
   DMCXP.cdsDetCxP.DataRequest(xSQL);
   DMCXP.cdsDetCxP.Open;
end;

procedure TFImpRecHonElectCXP.FormCreate(Sender: TObject);
begin
   dblcdCCostoCab.LookupTable := DMCXP.cdsCCosto;
   dblcdCCostoCab.LookUpField := 'CCOSID';
   dblcdCCosto.LookupTable := DMCXP.cdsCCosto;
   dblcdCCosto.LookUpField := 'CCOSID';

   xSQL := 'Select CIAID, TDIARID, CPNOREG, DCPANOC, DCPANOMM, DCPLOTE, TRANSID, CPTOID, '
         + '       CUENTAID, CLAUXID, DCPAUXID, DOCID, CPSERIE, CPNODOC, DCPGLOSA, DCPDH, '
         + '       CCOSID, CPTCAMPR, DCPMOORI, DCPMOLOC, DCPMOEXT, CPFEMIS, CPFVCMTO, DCPFCOM, '
         + '       DCPESTDO, DCPUSER, DCPFREG, DCPHREG, DCPMM, DCPDD, '
         + '       TREGID, TMONID, TIPDET, DCPREG '
         + '  from CXP302 '
         + ' where 1<>1';
   DMCXP.cdsDetCxP.Close;
   DMCXP.cdsDetCxP.DataRequest(xSQL);
   DMCXP.cdsDetCxP.Open;
   dbgDetCxP.DataSource := DMCXP.dsDetCxP;
   dbgDetCxP.Selected.Clear;
   dbgDetCxP.Selected.Add('DCPREG'#9'3'#9'Item'#9'F');
   dbgDetCxP.Selected.Add('TREGID'#9'3'#9'TR'#9'F');
   dbgDetCxP.Selected.Add('CPTOID'#9'7'#9'Concepto'#9'F');
   dbgDetCxP.Selected.Add('CUENTAID'#9'7'#9'Cuenta~Contable'#9'F');
   dbgDetCxP.Selected.Add('DCPGLOSA'#9'25'#9'Glosa'#9'F');
   dbgDetCxP.Selected.Add('CCOSID'#9'7'#9'Centro de~Costo'#9'F');
   dbgDetCxP.Selected.Add('DCPDH'#9'4'#9'Debe~Haber'#9'F');
   dbgDetCxP.Selected.Add('DCPMOORI'#9'10'#9'Importe'#9'F');
   dbgDetCxP.ApplySelected;

// CONCEPTOS Y CUENTAS DE DETALLE
// Base Imponible
   xCptoBasImp := '93201';
   xCtaBasImp := '93201';
// Renta de 4ta Categoría
   xCptoRta4ta := '4010704';
   xCtaRta4ta := '4010704';
// Total Neto
   xCptoNeto := '42101';
   xCtaNeto := '42101';
// Inicio HPC_201701_CXP
// 26/04/2017  Importación de Recibos por Honorarios Electrónicos, validaciones de la suspensión
//             de cuarta categoría cuando el TR es 10 y sean mayores a S/. 1500.00 antes de registrar.

   xValorMinRta4ta := 1500;
// Fin HPC_201701_CXP

   CargaDataSource;
end;

procedure TFImpRecHonElectCXP.dblcCiaExit(Sender: TObject);
Var
   xSQL, xWhere: String;
Begin
   xWhere := 'CIAID=' + quotedstr(dblcCia.Text);
   edtCia.Text := BuscaQry('dspTGE', 'TGE101', 'CIAABR,CIARETIGV,EXOIGV', xWhere, 'CIAABR');

   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Indique el Código de Compañía');
      dblcCia.SetFocus;
   End;

   if (dblcCia.Text='03') or (dblcCia.Text='06') then
   Begin
      ShowMessage('Compañía está desactivada');
      dblcCia.SetFocus;
   End;

   if (dblcCia.Text='01') then
   Begin
      ShowMessage('No se pueden registrar Honorarios Profesionales sobre la Cía Consolidada');
      dblcCia.SetFocus;
   End;

   xCompletaDatos := True;
end;

procedure TFImpRecHonElectCXP.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
end;

procedure TFImpRecHonElectCXP.bbtnEnv_a_CxPClick(Sender: TObject);
var
   wAno, wMes, wDia : word;
// Variables para diferenciar montos en MN yME
   xCPMTOORI, xCPMTOLOC, xCPMTOEXT : Currency;
// Inicio HPC_201701_CXP
// 26/04/2017  Importación de Recibos por Honorarios Electrónicos, validaciones de la suspensión
//             de cuarta categoría cuando el TR es 10 y sean mayores a S/. 1500.00 antes de registrar.

   xsexiste : Integer;
   xSigue : Boolean;
// Fin HPC_201701_CXP
begin
// Verifica Compañía
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Debe indicar primero la Compañía');
      dblcCia.SetFocus;
      Exit;
   end;

// Verifica Periodo abierto en la Cía
   If xControlFec(dblcCia.Text, dtpFComp.Date) = False Then
   Begin
      dblcCia.SetFocus;
      Exit;
   End;

// Verifica Centro de Costo
   if length(edtCCostoCab.Text)=0 then
   begin
      ShowMessage('Debe indicar el Centro de Costo');
      dblcdCCostoCab.SetFocus;
      Exit;
   end;

// Inicio HPC_201602_CXP
// Traslada evaluación del Detalle antes de la grabación
// Verifica que haya detalle
   if DMCXP.cdsDetCxP.RecordCount<1 then
   Begin
      ShowMessage('No hay Detalle generado');
      Exit;
   end;
// Fin HPC_201602_CXP

// Verifica Datos del Proveedor
   if dblcClAux.Enabled then
   Begin
   // Clase de Auxiliar
      if length(dbeClAux.Text)=0 then
      Begin
         ShowMessage('Debe indicar la Clase de Auxiliar');
         dblcClAux.SetFocus;
         Exit;
      end;
   // Código de Proveedor
      if length(dbeProv.Text)=0 then
      Begin
         ShowMessage('Debe indicar el Código de Proveedor');
         dbeProv.SetFocus;
         Exit;
      end;
   // RUC de Proveedor
      if length(dbeRuc.Text)=0 then
      Begin
         ShowMessage('Debe indicar el RUC del Proveedor');
         dbeRuc.SetFocus;
         Exit;
      end;
   // Tipo de Persona
      if length(dbeTipPer.Text)=0 then
      Begin
         ShowMessage('Debe indicar el Tipo de Persona');
         dblcTipper.SetFocus;
         Exit;
      end;
   // Tipo de Documento de Identidad
      if length(edtTipDoc.Text)=0 then
      Begin
         ShowMessage('Debe indicar el Tipo de Documento de Identidad');
         dblcTipDoc.SetFocus;
         Exit;
      end;
   // Nº de Doc.Ident
      if length(dbeDNI.Text)=0 then
      Begin
         ShowMessage('Debe indicar el Nº de Doc.Ident');
         dbeDNI.SetFocus;
         Exit;
      end;
   // Nacionalidad
      if length(dbePais.Text)=0 then
      Begin
         ShowMessage('Debe indicar la Nacionalidad');
         dblcdPais.SetFocus;
         Exit;
      end;
   // Sexo
      if length(dblcSexo.Text)=0 then
      Begin
         ShowMessage('Debe indicar el Sexo');
         dblcSexo.SetFocus;
         Exit;
      end;
   // Nombre
      if length(dbeNombres.Text)=0 then
      Begin
         ShowMessage('Debe indicar al menos un Nombre');
         dbeNombres.SetFocus;
         Exit;
      end;
   // Apellido Paterno
      if length(dbeApepat.Text)=0 then
      Begin
         ShowMessage('Debe indicar el Apellido Paterno');
         dbeApepat.SetFocus;
         Exit;
      end;
   // Apellido Materno
      if length(dbeApemat.Text)=0 then
      Begin
         if MessageDlg(' No hay Apellido Materno '+chr(13)
                      +'¿Continuar? ',
                      mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Begin
            dbeApemat.SetFocus;
            Exit;
         end;
      end;
   // Nombre Completo del Proveedor
      if length(dbeNombreTotal.Text)=0 then
      Begin
         ShowMessage('Debe indicar el Nombre Total del Proveedor');
         dbeNombreTotal.SetFocus;
         Exit;
      end;

   // Inicio HPC_201602_CXP
   // Inserta inicio de control Transaccional antes de iniciar las actualizaciones de datos
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
   // Fin HPC_201602_CXP

      xSQL := 'Insert into TGE201(CLAUXID, PROV, PROVDES, TIPPERID, '
            + '                   PROVAPEPAT, PROVAPEMAT, PROVNOMBRE, PROVNOMBRE1, PROVDNI, '
            + '                   PROVRUC, PROVGIRA, PAISID, PROVNOMCOM, PROVRETIGV, '
            + '                   ACTIVO, SEXO, ESDOMIC, TIPDOCID, CONVDOBTRI, '
            + '                   USERID, FREG, HREG) '
            + ' values ('
            +            quotedstr(dblcClAux.Text)+', '
            +            quotedstr(dbeProv.Text)+', '
            +            quotedstr(dbeNombreTotal.Text)+', '
            +            quotedstr(dblcTipper.Text)+', '
            +            quotedstr(dbeApepat.Text)+', '
            +            quotedstr(dbeApemat.Text)+', '
            +            quotedstr(dbeNombres.Text)+', '
            +            quotedstr(dbeSnombres.Text)+', '
            +            quotedstr(dbeDNI.Text)+', '
            +            quotedstr(dbeRuc.Text)+', '
            +            quotedstr(dbeNombreTotal.Text)+', '
            +            quotedstr(dblcdPais.Text)+', '
            +            quotedstr(dbeNombreTotal.Text)+', '
            +            quotedstr('S')+', '
            +            quotedstr('S')+', '
            +            quotedstr(dblcSexo.Text)+', '
            +            quotedstr('S')+', '
            +            quotedstr(dblcTipDoc.Text)+', '
            +            quotedstr('0')+', '
            +            quotedstr(DMCXP.wUsuario)+', '
            +            'trunc(sysdate), '
            +            'sysdate)';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede añadir al Trabajador Independiente');
         exit;
      End;

      xSQL := 'Insert into CNT201(AUXID, AUXNOMB, AUXRUC, PAISID, CLAUXID, AUXGIRA, '
            + '                   PROVRETIGV, AUXDNI, PROVRUC, ACTIVO) '
            + ' values ('
            +            quotedstr(dbeProv.Text)+', '
            +            quotedstr(dbeNombreTotal.Text)+', '
            +            quotedstr(dbeRuc.Text)+', '
            +            quotedstr(dblcdPais.Text)+', '
            +            quotedstr(dblcClAux.Text)+', '
            +            quotedstr(dbeNombreTotal.Text)+', '
            +            quotedstr('S')+', '
            +            quotedstr(dbeDNI.Text)+', '
            +            quotedstr(dbeRuc.Text)+', '
            +            quotedstr('S')+') ';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede añadir al Trabajador Independiente');
         exit;
      End;
   // Inicio HPC_201602_CXP
   // Graba con control Transaccional
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
   // Fin HPC_201602_CXP
   End;
// Inicio HPC_201701_CXP
// 26/04/2017  Importación de Recibos por Honorarios Electrónicos, validaciones de la suspensión
//             de cuarta categoría cuando el TR es 10 y sean mayores a S/. 1500.00 antes de registrar.

   xSQL := ' Update TGE201 '
            + '    SET PROVEXONER = '+quotedstr(dbeExonera.Text)+', '
            + '        FECEXON4TA = '+quotedstr(datetostr(dbdtpFechaExon4ta.Date))+' '
            + '  Where CLAUXID = '+quotedstr(dblcClAux.Text)
            + '    and PROV = '+quotedstr(dbeProv.Text);
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se puede Actualizar la Exoneración de Cuarta Categoría');
      exit;
   End;

   If dblcTDoc.Text='02' then
   Begin
     If xValorMinRta4ta>0 then
     Begin
        If (DMCXP.cdsQry2.FieldByName('CPGRAVAD').AsFloat) > xValorMinRta4ta then
        Begin
           xSigue := False;

           DecodeDate(dtpFComp.Date, wAno, wMes, wDia);

           xsexiste :=0;
           DMCXP.cdsDetCxP.First;
           while not DMCXP.cdsDetCxP.EOF do
           begin
             If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString='I1' then
             Begin
                xsexiste := xsexiste +1;
             end;

           DMCXP.cdsDetCxP.Next;
           end;

           If xsexiste>0 then
           Begin
              xSigue := True;
           End
           Else
           Begin
              xSQL := 'Select FECEXON4TA '
                     +'  from TGE201 '
                     +' where CLAUXID='+quotedstr(DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString)
                     +'   and PROV='+quotedstr(DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString)
                     +'   and to_char(FECEXON4TA,''YYYY'')='+quotedstr(inttostr(wAno));
              DMCXP.cdsQry.Close;
              DMCXP.cdsQry.DataRequest(xSQL);
              DMCXP.cdsQry.Open;
              If DMCXP.cdsQry.RecordCount>0 then
              Begin
                 xSigue := True;
              End;
           End;

           If not xSigue then
           Begin
//              DMCXP.DCOM1.AppServer.RetornaTransaccion;
              ShowMessage('El Proveedor no tiene Suspensión de 4ta.Categoría, regularice!! ');
              Exit;
           End;
        End;
     End;
   End;

// Fin HPC_201701_CXP
// Inicio HPC_201602_CXP
// Traslada evaluación del Detalle antes de la grabación
{
// Verifica que haya detalle
   if DMCXP.cdsDetCxP.RecordCount<1 then
   Begin
      ShowMessage('No hay Detalle generado');
      Exit;
   end;
}
// Inserta inicio de control Transaccional antes de iniciar las actualizaciones de datos
   DMCXP.DCOM1.AppServer.IniciaTransaccion;
// Fin HPC_201602_CXP

   decodedate(dtpFComp.Date, wAno, wMes, wDia);

   xSQL := 'Insert into CXP301(CIAID, CPANOMES, TDIARID, CPNOREG, CLAUXID, PROV, PROVRUC, '
         + '                   DOCID, CPSERIE, CPNODOC, CPFRECEP, CPFEMIS, CPFVCMTO, '
         + '                   TMONID, CPTCAMPR, CPTCAMPA, CPESTADO, CP_CONTA, CPGRAVAD, '
         + '                   CPNOGRAV, CPIGV, CPISC, CPDCTO, CPMTOORI, CPMTOLOC, CPMTOEXT, '
         + '                   CPPAGORI, CPPAGLOC, CPPAGEXT, CPSALORI, CPSALLOC, CPSALEXT, '
         + '                   CPUSER, CPFREG, CPHREG, CPAAAA, CPMM, CPDD, '
         + '                   CPFCMPRB, DCPLOTE, CTATOTAL, CPTOTOT, CPIGV2, CPGRAVAD2, '
         + '                   PROVDES, CPTCAMDOL, PROVRETIGV, CPTCAMAJ, DTRPORC, CPMTOORIB, '
         + '                   ADQ_NO_GRAV, IGV_GRA_NO_DEST, CP_OTROS, CP4TAPENSION) '
         + 'Values ('
         +           quotedstr(dblcCia.Text)+','    // CIAID
         +           quotedstr(dbeAnoMM.Text)+','   // CPANOMES
         +           quotedstr(dbeTDiario.Text)+',' // TDIARID
         +           quotedstr(meNoReg.Text)+','    // CPNOREG
         +           quotedstr(dblcClAux.Text)+','  // CLAUXID
         +           quotedstr(dbeProv.Text)+','    // PROV
         +           quotedstr(dbeRuc.Text)+','     // PROVRUC
         +           quotedstr(dblcTDoc.Text)+','   // DOCID
         +           quotedstr(edtSerie.Text)+','   // CPSERIE
         +           quotedstr(edtNoDoc.Text)+','   // CPNODOC
         +           quotedstr(dtpFEmis.Text)+','   // CPFRECEP
         +           quotedstr(dtpFEmis.Text)+','   // CPFEMIS
         +           quotedstr(dtpFEmis.Text)+','   // CPFVCMTO
         +           quotedstr(dblcTMon.Text)+','   // TMONID
         +           floattostr(xTCambio)+','       // CPTCAMPR
         +           floattostr(0.00)+','           // CPTCAMPA
         +           quotedstr('I')+','             // CPESTADO
         +           quotedstr('N')+',';            // CP_CONTA

// Inicio HPC_201602_CXP
// DAF_2016000190_CXP_1 Bifurcación de Cuenta y Concepto Cta 42 por Tipo de Moneda
// Total Neto
   if dblcTMon.Text='N' then
   begin
      xCptoNeto := '42101';
      xCtaNeto := '42101';
   end
   else
   begin
      xCptoNeto := '42102';
      xCtaNeto := '42102';
   end;
// Fin HPC_201602_CXP

// CPGRAVAD
   if DMCXP.cdsQry2.FieldByName('CPIGV').AsFloat>0 then
      xSQL := xSQL + floattostr(DMCXP.cdsQry2.FieldByName('CPGRAVAD').AsFloat)+','  // CPGRAVAD
   else
      xSQL := xSQL + '0.00,';  // CPGRAVAD

// CPNOGRAV
   xSQL := xSQL + '0.00,'; // CPNOGRAV

// CPIGV
   if DMCXP.cdsQry2.FieldByName('CPIGV').AsFloat>0 then
      xSQL := xSQL + floattostr(DMCXP.cdsQry2.FieldByName('CPIGV').AsFloat)+','
   else
      xSQL := xSQL + floattostr(0.00)+',';            // CPIGV

// Inicio HPC_201602_CXP
// Diferencia montos en MN yME
   xCPMTOORI := DMCXP.cdsQry2.FieldByName('CPMTOORI').AsFloat;
   If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString  = DMCXP.wTMonLoc then
   Begin
      xCPMTOLOC := xCPMTOORI;
      xCPMTOEXT := FRound(xCPMTOORI / xTCambio,15,2);
   End
   Else
   Begin
      xCPMTOEXT := xCPMTOORI;
      xCPMTOLOC := FRound(xCPMTOORI * xTCambio,15,2);
   End;

   xSQL := xSQL
         +           floattostr(0.00)+','           // CPISC
         +           floattostr(0.00)+','           // CPDCTO
         +           floattostr(xCPMTOORI)+','      // CPMTOORI
         +           floattostr(xCPMTOLOC)+','      // CPMTOLOC
         +           floattostr(xCPMTOEXT)+','      // CPMTOEXT
         +           floattostr(0.00)+','           // CPPAGORI
         +           floattostr(0.00)+','           // CPPAGLOC
         +           floattostr(0.00)+','           // CPPAGEXT
         +           floattostr(xCPMTOORI)+','      // CPSALORI
         +           floattostr(xCPMTOLOC)+','      // CPSALLOC
         +           floattostr(xCPMTOEXT)+','      // CPSALEXT
         +           quotedstr(DMCXP.wUsuario)+','  // CPUSER
         +           ' trunc(sysdate),'             // CPFREG
         +           ' sysdate,'                    // CPHREG
         +           quotedstr(copy(dbeAnoMM.Text,1,4))+','           // CPAAAA
         +           quotedstr(copy(dbeAnoMM.Text,5,2))+','           // CPMM
         +           quotedstr(Strzero(inttostr(wDia),2))+','         // CPDD

         +           quotedstr(datetostr(dtpFComp.Date))+','           // CPFCMPRB
         +           quotedstr('RH_E')+','           // DCPLOTE
         +           quotedstr(xCtaNeto)+','           // CTATOTAL
         +           quotedstr(xCptoNeto)+','           // CPTOTOT
         +           floattostr(0.00)+','           // CPIGV2
         +           floattostr(0.00)+','           // CPGRAVAD2

         +           quotedstr(copy(dbeNombreTotal.Text,1,80))+','           // PROVDES
         +           floattostr(xTCambio)+','           // CPTCAMDOL
         +           quotedstr('N')+','           // PROVRETIGV
         +           floattostr(xTCambio)+','           // CPTCAMAJ
         +           floattostr(0.00)+','           // DTRPORC
         +           floattostr(xCPMTOORI)+','; // CPMTOORIB
// Fin HPC_201602_CXP

// ADQ_NO_GRAV
   if DMCXP.cdsQry2.FieldByName('CPIGV').AsFloat>0 then
      xSQL := xSQL + '0.00, '
   else
      xSQL := xSQL + floattostr(DMCXP.cdsQry2.FieldByName('CPGRAVAD').AsFloat)+',';

   xSQL := xSQL
         +           floattostr(0.00)+','           // IGV_GRA_NO_DEST
         +           floattostr(0.00)+','           // CP_OTROS
         +           floattostr(0.00)+')';          // CP4TAPENSION

// Inicio HPC_201602_CXP
   // Retira inicio de control Transaccional
//   DMCXP.DCOM1.AppServer.IniciaTransaccion;
// Fin HPC_201602_CXP
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se puede grabar la cabecera de la Provisión');
      exit;
   End;

// Inserta Detalles
   DMCXP.cdsDetCxP.First;
   while not DMCXP.cdsDetCxP.EOF do
   begin
      xSQL := 'Insert into CXP302(CIAID, TDIARID, CPNOREG, DCPANOC, DCPANOMM, DCPLOTE, '
            + '                   TRANSID, CPTOID, CUENTAID, CLAUXID, DCPAUXID, DOCID, '
            + '                   CPSERIE, CPNODOC, DCPGLOSA, DCPDH, CCOSID, CPTCAMPR, '
            + '                   DCPMOORI, DCPMOLOC, DCPMOEXT, CPFEMIS, CPFVCMTO, DCPFCOM, '
            + '                   DCPESTDO, DCPUSER, DCPFREG, DCPHREG, DCPMM, DCPDD, '
            + '                   TMONID, TREGID, TIPDET, DCPREG) '
            + 'values('
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('CIAID').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('DOCID').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('CCOSID').AsString)+','
            +          floattostr(DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat)+','
            +          floattostr(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat)+','
            +          floattostr(DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat)+','
            +          floattostr(DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat)+','
            +          quotedstr(datetostr(DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime))+','
            +          quotedstr(datetostr(DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime))+','
            +          quotedstr(datetostr(DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime))+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString)+','
            + '        trunc(sysdate), '
            + '        sysdate,'
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('TMONID').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('TREGID').AsString)+','
            +          quotedstr(DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString)+','
            +          quotedstr(inttostr(DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger))+')';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede grabar el Detalle de la Provisión');
         exit;
      End;
      DMCXP.cdsDetCxP.Next;
   end;
   DMCXP.DCOM1.AppServer.GrabaTransaccion;

   DMCXP.cdsQry2.Edit;
   DMCXP.cdsQry2.FieldByName('CIA').AsString      := dblcCia.Text;
   DMCXP.cdsQry2.FieldByName('ANOMES').AsString   := dbeAnoMM.Text;
   DMCXP.cdsQry2.FieldByName('TDIARIO').AsString  := dbeTDiario.Text;
   DMCXP.cdsQry2.FieldByName('NOREG').AsString    := meNoReg.Text;
   DMCXP.cdsQry2.FieldByName('CPESTADO').AsString := 'I';
   DMCXP.cdsQry2.FieldByName('ENVIADO_A_CXP').AsString := 'S';
   DMCXP.cdsQry2.FieldByName('CCOSID').AsString := dblcdCCostoCab.Text;
   DMCXP.cdsQry2.Post;

   FImpRecHonElect.lblNroRegistros.Caption := inttostr(DMCXP.cdsQry2.RecordCount)+' Registros';

   if xCompletaDatos then
   begin
      if MessageDlg(' Registro Transferido a Cuentas por Pagar '+chr(13)
                   +'¿continuar al registro siguiente? ',
                   mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
           DMCXP.cdsQry2.Next;
           LlenaDatosparaCXP;
      End
      else
      Begin
         Close;
      End;
   end;


end;

procedure TFImpRecHonElectCXP.dblcdCCostoCabEnter(Sender: TObject);
begin
   if length(dblcCia.Text)>0 then
   begin
      xSQL := 'Select CCOSID, CCOSDES, CCOSABR, CCOSNIV, CCOSMOV '
            + '  from TGE203 '
            + ' Where CCOSACT=' + quotedstr('S')
            + '   and CCOSMOV=' + quotedstr('S')
            + '   and CCOSCIAS like (' + quotedstr('%' + dblcCia.Text + '%') + ' )';
      DMCXP.cdsCCosto.Close;
      DMCXP.cdsCCosto.DataRequest(xSQL);
      DMCXP.cdsCCosto.open;
      DMCXP.cdsCCosto.Filter := '';
      DMCXP.cdsCCosto.Filtered := False;
      DMCXP.cdsCCosto.IndexFieldNames := 'CCOSID';
   end;
end;

procedure TFImpRecHonElectCXP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMCXP.cdsCCosto.Filter := '';
   DMCXP.cdsCCosto.Filtered := False;
   DMCXP.cdsCCosto.IndexFieldNames := '';
   DMCXP.cdsCCosto.Close;

   DMCXP.cdsQry3.Filter := '';
   DMCXP.cdsQry3.Filtered := False;
   DMCXP.cdsQry3.IndexFieldNames := '';
   DMCXP.cdsQry3.Close;

   DMCXP.cdsQry.Filter := '';
   DMCXP.cdsQry.Filtered := False;
   DMCXP.cdsQry.IndexFieldNames := '';
   DMCXP.cdsQry.Close;

   DMCXP.cdsDetCxP.Filter := '';
   DMCXP.cdsDetCxP.Filtered := False;
   DMCXP.cdsDetCxP.IndexFieldNames := '';
   DMCXP.cdsDetCxP.Close;
end;

procedure TFImpRecHonElectCXP.dbgDetCxPDblClick(Sender: TObject);
begin
  if lblEstado.Caption = 'NUEVO' then
  begin
      gbDatosRHDet.Enabled := False;
      pnlRegistro.Visible := True;
      pnlRegistro.BringToFront;
      pnlRegistro.SetFocus;
      DMCXP.cdsDetCxP.Edit;
      dblcTipReg.Text := DMCXP.cdsDetCxP.FieldByName('TREGID').AsString;
      edtTipReg.Text := DMCXP.DisplayDescrip('TGE113', 'TREGDES', 'TRegID', dblcTipReg.Text);
      If length(edtTipReg.Text) = 0 Then
      Begin
         ShowMessage('Debe Ingresar el Tipo de Registro');
         dblcTipReg.SetFocus;
         exit;
      End;
      dblcdCnpEgr.Text := DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString;
      dbeCuenta.Text := DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString;
      dbeGlosaDet.Text := DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString;
      dblcdCCosto.Text := DMCXP.cdsDetCxP.FieldByName('CCOSID').AsString;

      If dblcdCCosto.Text <> '' Then
      Begin
         edtCCosto.Text := DMCXP.DisplayDescrip('TGE203', 'CCOSDES', 'CCOSID', dblcdCCosto.Text)
      End
      Else
      Begin
         edtCCosto.Text := '';
      End;
      dbeDH.Text := DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString;
      dbeImporte.Text := floattostr(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat);

      dblcTipReg.Enabled := True;
      dbeDH.Enabled := False;
      dbeImporte.Enabled := False;
      bbtnRegOk.Enabled := True;
      dblcdCnPEgr.SetFocus;
   end
   else
   begin
      gbDatosRHDet.Enabled := False;
      pnlRegistro.Visible := True;
      pnlRegistro.BringToFront;
      pnlRegistro.SetFocus;
      DMCXP.cdsDetCxP.Edit;
      dblcTipReg.Text := DMCXP.cdsDetCxP.FieldByName('TREGID').AsString;
      edtTipReg.Text := DMCXP.DisplayDescrip('TGE113', 'TREGDES', 'TRegID', dblcTipReg.Text);
      If length(edtTipReg.Text) = 0 Then
      Begin
         ShowMessage('Debe Ingresar el Tipo de Registro');
         dblcTipReg.SetFocus;
         exit;
      End;
      dblcdCnpEgr.Text := DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString;
      dbeCuenta.Text := DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString;
      dbeGlosaDet.Text := DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString;
      dblcdCCosto.Text := DMCXP.cdsDetCxP.FieldByName('CCOSID').AsString;

      If dblcdCCosto.Text <> '' Then
      Begin
         edtCCosto.Text := DMCXP.DisplayDescrip('TGE203', 'CCOSDES', 'CCOSID', dblcdCCosto.Text)
      End
      Else
      Begin
         edtCCosto.Text := '';
      End;
      dbeDH.Text := DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString;
      dbeImporte.Text := floattostr(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat);

      dblcdCnpEgr.Enabled := False;
      dbeCuenta.Enabled := False;
      dbeGlosaDet.Enabled := False;
      dblcdCCosto.Enabled := False;
      dblcTipReg.Enabled := False;
      dbeDH.Enabled := False;
      dbeImporte.Enabled := False;
      bbtnRegOk.Enabled := False;
   end;
End;

procedure TFImpRecHonElectCXP.bbtnRegCancClick(Sender: TObject);
begin
   pnlRegistro.Visible := False;
   gbDatosRHDet.Enabled := True;
   dblcdCCosto.Text := '';
   dblcdCCosto.Enabled := False;
end;

Procedure TFImpRecHonElectCXP.CargaDataSource;
var
   xSQL : String;
Begin
// Clase de Auxiliar
   xSQL := 'Select CLAUXID, CLAUXDES, CLAUXABR, TAUXID, CLAUXFLG, CLAUXRUC, MODULO, '
         + '       RESPFF, CLAUXLOG, CLAUXCP, CLAUXFF '
         + '  from TGE102 '
         + ' where MODULO like ''%CXP%'' ';
   DMCXP.cdsClAux.Close;
   DMCXP.cdsClAux.DataRequest(xSQL);
   DMCXP.cdsClAux.Open;
   dblcClAux.Selected.Clear;
   dblcClAux.Selected.Add('CLAUXID'#9'3'#9'Código'#9'F');
   dblcClAux.Selected.Add('CLAUXDES'#9'15'#9'Clase Auxiliar'#9'F');
   dblcClAux.LookupTable := DMCXP.cdsClAux;

// Tipo de Persona
   xSQL := 'Select TIPPERID, TIPPERDES, TIPPERABR, TIPPERS, FLGIGV, DATOS_RUC, DATOS_PERS, '
         + '       TDOC_SUNAT '
         + '  from TGE109 ';
   DMCXP.cdsTipPer.Close;
   DMCXP.cdsTipPer.DataRequest(xSQL);
   DMCXP.cdsTipPer.Open;
   dblcTipper.Selected.Clear;
   dblcTipper.Selected.Add('TIPPERID'#9'3'#9'Código'#9'F');
   dblcTipper.Selected.Add('TIPPERDES'#9'15'#9'Tipo de Persona'#9'F');
   dblcTipper.LookupTable := DMCXP.cdsTipPer;

// Tipo de Documento
   xSQL := 'Select TIPDOCID, TIPDOCDES, VALIDALONG '
         + '  from SUNAT101';
   DMCXP.cdsQry14.Close;
   DMCXP.cdsQry14.DataRequest(xSQL);
   DMCXP.cdsQry14.Open;
   dblcTipDoc.Selected.Clear;
   dblcTipDoc.Selected.Add('TIPDOCID'#9'3'#9'Código'#9'F');
   dblcTipDoc.Selected.Add('TIPDOCDES'#9'15'#9'Tipo de Doc.Ident'#9'F');
   dblcTipDoc.LookupTable := DMCXP.cdsQry14;

// País
   xSQL := 'select PAISABR, PAISDES, PAISID, FNACIONAL, CODSUNAT '
         + '  from TGE118 '
         + ' order by PAISID';
   DMCXP.cdsPais.Close;
   DMCXP.cdsPais.DataRequest(xSQL);
   DMCXP.cdsPais.Open;
   dblcdPais.Selected.Clear;
   dblcdPais.Selected.Add('PAISID'#9'3'#9'Código'#9'F');
   dblcdPais.Selected.Add('PAISDES'#9'15'#9'País'#9'F');
   dblcdPais.LookupTable := DMCXP.cdsPais;

// Sexo
   xSQL := 'Select ID, DESCRIP from TGE817';
   DMCXP.cdsQry15.Close;
   DMCXP.cdsQry15.DataRequest(xSQL);
   DMCXP.cdsQry15.Open;
   dblcSexo.Selected.Clear;
   dblcSexo.Selected.Add('ID'#9'3'#9'Código'#9'F');
   dblcSexo.Selected.Add('DESCRIP'#9'10'#9'Sexo'#9'F');
   dblcSexo.LookupTable := DMCXP.cdsQry15;

   dblcTipReg.DataSource := DMCXP.dsDetCxP;
   dblcTipReg.LookupTable := DMCXP.cdsTipReg;

   dblcdCnpEgr.DataSource := DMCXP.dsDetCxP;
   dblcdCnpEgr.LookupTable := DMCXP.cdsCnpEgr;
End;

procedure TFImpRecHonElectCXP.bbtnRegOkClick(Sender: TObject);
begin
   DMCXP.cdsDetCxP.Edit;
   DMCXP.cdsDetCxP.FieldByName('TREGID').AsString := dblcTipReg.text;
   DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString := dblcdCnpEgr.Text;
   DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := dbeCuenta.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := dbeGlosaDet.Text;
   DMCXP.cdsDetCxP.FieldByName('CCOSID').AsString := dblcdCCosto.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString := dbeDH.Text;
// Inicio HPC_201602_CXP
// registra montos según moneda
   DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := strtofloat(dbeImporte.Text);

   If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString  = DMCXP.wTMonLoc then
   Begin
      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat / xTCambio, 15, 2);
   End
   Else
   Begin
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat * xTCambio, 15, 2);
   End;
// Fin HPC_201602_CXP

   DMCXP.cdsDetCxP.post;

   pnlRegistro.Visible := False;
   gbDatosRHDet.Enabled := True;

   dblcdCCosto.Text := '';
   dblcdCCosto.Enabled := False;
end;

procedure TFImpRecHonElectCXP.dtpFCompExit(Sender: TObject);
var
   wAno, wMes, wDia : Word;
begin
// Verifica Periodo abierto en la Cía
   If xControlFec(dblcCia.Text, dtpFComp.Date) = False Then
   Begin
      dtpFComp.SetFocus;
      Exit;
   End;

   decodedate(dtpFComp.Date, wAno, wMes, WDia);
   if (inttostr(wAno)+strzero(inttostr(wMes),2))<>dbeAnoMM.Text then
   begin
      ShowMessage('Año+Mes de la Fecha del Comprobante -->'+(inttostr(wAno)+strzero(inttostr(wMes),2))
                 +chr(13)
                 +'no coincice con el Año+Mes de la Fecha General del Proceso -->'+dbeAnoMM.Text);
      dtpFComp.SetFocus;
      Exit;
   end;
end;

// Inicio HPC_201602_CXP
// DAF_2016000190_CXP_1 Fuerza orden de Conceptos por Cuenta Contable al ingresar al componente
procedure TFImpRecHonElectCXP.dblcdCnpEgrEnter(Sender: TObject);
begin
   DMCXP.cdsCnpEgr.IndexFieldNames := 'CUENTAID';
end;
// Fin HPC_201602_CXP

// Inicio HPC_201602_CXP
// DAF_2016000190_CXP_1 Valida que Concepto exista, que sea de Movimiento
procedure TFImpRecHonElectCXP.dblcdCnpEgrExit(Sender: TObject);
Var
   xWhere : String;
Begin
   If bbtnRegCanc.Focused Then Exit;

   DMCXP.cdsCnpEgr.IndexFieldNames := 'CPTOID';

   DMCXP.cdsCnpEgr.SetKey;
   DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString := dblcdCnpEgr.text;
   If Not DMCXP.cdsCnpEgr.Gotokey Then
   Begin
      dblcdCnpEgr.Text := '';
      dbeCuenta.Text := '';
      ShowMessage('Error : Código de Concepto No Existe ');
      dblcdCnpEgr.SetFocus;
      Exit;
   End;

   If DMCXP.cdsCnpEgr.FieldByname('NIVELMOV').AsString <> 'S' Then
   Begin
      dblcdCnpEgr.Text := '';
      dbeCuenta.Text := '';
      ShowMessage('Error : Concepto No es de Movimiento');
      dblcdCnpEgr.SetFocus;
      Exit;
   End;

   dbeCuenta.Text := DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString;

   xWhere := 'CIAID=' + Quotedstr(dblcCia.text)
      + ' and CUENTAID=' + quotedstr(DMCXP.cdsCnpEgr.fieldbyname('CUENTAID').AsString);
   If length(BuscaQry('PrvTGE', 'TGE202', 'CUENTAID, CTA_CCOS, CTAACT', xWhere, 'CUENTAID')) > 0 Then
   Begin
      If DMCXP.cdsQry.FieldByName('CTAACT').AsString = 'N' Then
      Begin
         ShowMessage('Cuenta Contable NO ESTA ACTIVA. VERIFICAR CON CONTABILIDAD');
         dblcdCnpEgr.SetFocus;
         exit;
      End;

 // (3) si lleva Centro de Costo
      If DMCXP.cdsQry.FieldByName('CTA_CCOS').AsString = 'S' Then
      Begin
         If length(trim(dblcdCCosto.Text))=0 then
         Begin
            If length(trim(dblcdCCostoCab.Text))= 0 then
            Begin
               ShowMessage('Debe indicar el Centro de Costo');
               dblcdCCostoCab.SetFocus;
               Exit;
            End;
            dblcdCCosto.Text := dblcdCCostoCab.Text;
         End;
      End
      Else
      Begin
         dblcdCCosto.Text := '';
      End;
   End
   Else
   Begin
      ShowMessage('Cuenta Contable NO existe para la Compañía indicada');
      dblcdCnpEgr.SetFocus;
      exit;
   End;
end;
// Fin HPC_201602_CXP

end.
