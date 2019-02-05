unit CXP402;

// Actualizaciones:
// HPC_201303_CXP    22/10/2013  Realiza ajustes a la opción de Registro de Compras que genera
//                               el archivo texto para importar a PLE SUNAT,
//                               respecto a los montos totales de los documentos por Pagar
// HPC_201308_CXP    16/12/2013  Modificación a SQL que llama al registro de compras
//                               se pone función TRUNC a las fechas
// HPC_201406_CXP    02/05/2014  Se mejoró el tiempo de respuesta en la grabación del archivo base para el PLE.
//                               valida tipo de documento de identidad de proveedor
//                               valida RUC o DNI
// HPC_201409_CXP    30/05/2014  Realizar modificaciones del archivo que se genera del PLE al formato nuevo de Sunat.
// HPC_201602_CXP    18/02/2016  Se cambia validación de Número de Serie para Notas de Crédito
//                               debido a la inclusión de Facturas Electrónicas
//                               retiro de comentarios de HPC_20140*_CXP
//                               Para Enero y Diciembre se antepone A=Apertura y C=Cierre en correlativo que va al PLE
//                   18/02/2016  Cambios para PLE a partir de Enero 2016
//                               Se añade radiogroup que distingue generación de Domiciliados versus No Docimicilados
//                               Se añade rutina para exportar PLE de Proveedores No Domiciliados
// HPC_201604_CXP    11/08/2016  DAF_2016001428 Se cambia SQL que alimenta tabla con registros PLE, se tomará Razón Social del MAestro de Proveedores
//

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBClient, wwclient, ComCtrls, FileCtrl,
  Grids, Wwdbigrd, Wwdbgrid, ppEndUsr, ppParameter, ppBands, ppClass,
  ppCtrls, ppStrtch, ppRegion, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
//Inicio HPC_201602_CXP
// Se añade unidad de Control de Unidades Externas
  ppComm, ppRelatv, ppDB, ppDBPipe, wwExport, shellapi, DBGrids, ExtCtrls;
//Fin HPC_201602_CXP

type
  TFRegComprasPLE = class(TForm)
    bbtnGenExport: TBitBtn;
    bbtnRegCanc: TBitBtn;
    prgb_Progreso: TProgressBar;
    sdNombreArchivo: TSaveDialog;
    dbgRegCompPLE: TwwDBGrid;
    bbtnValida: TBitBtn;
    bbtnResumenxCia: TBitBtn;
    ppdbRegCompPLE: TppDBPipeline;
    pprRegCompPLE: TppReport;
    ppDesigner1: TppDesigner;
    btnExportarExcel: TBitBtn;
    ppParameterList1: TppParameterList;
    dbgRegCompPLEIButton: TwwIButton;
    bbtnDuplica: TBitBtn;
    bbtnRenumera: TBitBtn;
    dbgExporta: TDBGrid;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine2: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppLine1: TppLine;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBText1: TppDBText;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    cbDiseno: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
 // Inicio HPC_201602_CXP
 // Se añade radiogroup que distingue generación de Domiciliados versus No Docimicilados
    rgTam: TRadioGroup;
 // Fin HPC_201602_CXP
    procedure bbtnRegCancClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    Function  fg_PLEprocesaRegCompras(wgPeriodo: String): Boolean;
    procedure pr_abre_RegCompPLE;
    Procedure fg_PLEinsertaTabla(wgRegistroCompras: TwwClientDataSet; wgPeriodo: String);
    Procedure fg_PLEeliminaRegCompras(wgPeriodo: String);
    Function  fg_PLEobtieneTdocProv(wgTipoAuxiliar,wgAuxiliarId, wgNumDocIdentidad: String): String;
    Procedure fg_PLEdocReferenciaNC(Var wgFechaDocRef: String; Var wgTDocRef: String;
                                    Var wgSerieRef: String; Var wgNumDocRef: String; wgCiaNC, wgCanjeNC, wgProvNC: String);
    Procedure fg_PLEexportarFormato(wgPeriodo, wgRutaArchivo: String);
 // Inicio HPC_201602_CXP
 // Se añade rutina para exportar PLE de Proveedores No Domiciliados
    Procedure fg_PLEexportarFormatoNoDom(wgPeriodo, wgRutaArchivo: String);
 // Fin HPC_201602_CXP
    procedure bbtnGenExportClick(Sender: TObject);
    Function  fg_PLEvalidaDatos : Boolean;
    procedure bbtnValidaClick(Sender: TObject);
    procedure dbgRegCompPLETitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure bbtnResumenxCiaClick(Sender: TObject);
    procedure btnExportarExcelClick(Sender: TObject);
    procedure bbtnDuplicaClick(Sender: TObject);
    procedure dbgRegCompPLEDblClick(Sender: TObject);
    procedure dbgRegCompPLEIButtonClick(Sender: TObject);
    procedure bbtnRenumeraClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegComprasPLE: TFRegComprasPLE;
  xsSQL : String;
  xsModFecEmi, xsModDocId, xsModSerie, xsModNoDoc : String;

implementation

uses CxP401, CXPDM, CXP422;

{$R *.dfm}

procedure TFRegComprasPLE.bbtnRegCancClick(Sender: TObject);
begin
   Close;
end;

procedure TFRegComprasPLE.fg_PLEdocReferenciaNC(var wgFechaDocRef,
  wgTDocRef, wgSerieRef, wgNumDocRef: String; wgCiaNC, wgCanjeNC,
  wgProvNC: String);
Var
   xsSql: String;
Begin
   xsSql := ' Select CXP301.CPFEMIS, CXP304.DOCID ,CXP304.CPSERIE , CXP304.CPNODOC '
          + '   from CXP304,CXP301 '
          + '  where CXP304.CIAID = CXP301.CIAID '
          + '    and CXP304.DOCID = CXP301.DOCID '
          + '    and CXP304.CPSERIE = CXP301.CPSERIE '
          + '    and CXP304.CPNODOC = CXP301.CPNODOC '
          + '    and CXP304.Prov = CXP301.Prov  '
          + '    and CXP304.TCANJEID IN ' + QuotedStr('NC')
          + '    and CXP304.CIAID = ' + QuotedStr(wgCiaNC)
          + '    and CXP304.CCPCANJE = ' + QuotedStr(wgCanjeNC)
          + '    and CXP304.Prov = ' + QuotedStr(wgProvNC);
   DMCXP.cdsQry.close;
   DMCXP.cdsQry.DataRequest(xsSql);
   DMCXP.cdsQry.open;
   If DMCXP.cdsQry.RecordCount > 0 Then
   Begin
      wgFechaDocRef := 'To_date(' + QuotedStr(DMCXP.cdsQry.FieldByName('CPFEMIS').AsString) + ',' + QuotedStr('dd/mm/yyyy') + ')';
      wgTDocRef := DMCXP.cdsQry.FieldByName('DOCID').AsString;
      wgSerieRef := DMCXP.cdsQry.FieldByName('CPSERIE').AsString;
      wgNumDocRef := DMCXP.cdsQry.FieldByName('CPNODOC').AsString;
   End
   Else
   Begin
      wgFechaDocRef := 'Null';
      wgTDocRef := '';
      wgSerieRef := '';
      wgNumDocRef := '';
   End;
   //si es nota de débito
   xsModFecEmi := wgFechaDocRef;
   xsModDocId  := wgTDocRef;
   xsModSerie  := wgSerieRef;
   xsModNoDoc  := wgNumDocRef;
end;

procedure TFRegComprasPLE.fg_PLEeliminaRegCompras(wgPeriodo: String);
Var
   xsSql: String;
Begin
   xsSql := ' DELETE CXP_REG_COM WHERE PERIODO = ' + QuotedStr(wgPeriodo);
   DMCXP.DCOM1.AppServer.EjecutaSQL(xsSql);
end;

procedure TFRegComprasPLE.fg_PLEexportarFormato(wgPeriodo,
  wgRutaArchivo: String);
Var
   xsSql: String;
   xfArchivoTexto: TextFile;
   xsDelimitador: String;

   xsPeriodoRC: String;
   xsMes: String;
   xsRER: String;
   xsCantid : Integer;
   xsTamano : Integer;

   xsCorrelativo: String;
   xdFecEmi: String;
   xdFecPag: String;
   xsDocId: String;
   xsSerie: String;
   xsAnio: String;
   xsNoDoc: String;
   xsImpOpeDia: String;
   xsProvDocId: String;
   xsProvDocNum: String;
   xsProvRazSoc: String;
   xsBasImp: String;
   xsIgv: String;
   xsBasImpMixto: String;
   xsIgvMixto: String;
   xsBasImpGas: String;
   xsIgvGas: String;
   xsAdqNoGrav: String;
   xsImpIsc: String;
   xsImpOtros: String;
   xsImpTotal: String;
   xsTipoCambio: String;
   xsNumDocNoDom: String;
   xsFecDetraccion: String;
   xsNumDetraccion: String;
   xsFlgRet: String;
   xsFlgMod: String;

// Inicio HPC_201602_CXP
// añade variables para nuevos campos
   xsTMon : String; //  Tipo de Moneda
   xsTipoBien : String; // Tipo de Bien (Tabla 30 de PLE de SUNAT)
// Fin HPC_201602_CXP

Begin
   xsDelimitador := '|';
// Inicio HPC_201602_CXP
// Se añade condicional para seleccionar PLE de Proveedores Domiciliados
   xsSql :=  ' SELECT CXP_REG_COM.PERIODO, CXP_REG_COM.CORRELATIVO, CXP_REG_COM.FECEMI, '
      + '             CXP_REG_COM.FECPAG, CXP_REG_COM.DOCID, CXP_REG_COM.CPSERIE, '
      + '             CXP_REG_COM.ANIO, CXP_REG_COM.CPNODOC, CXP_REG_COM.IMPOPEDIA, '
      + '             CXP_REG_COM.PROVDOCID, CXP_REG_COM.PROVDOCNUM, CXP_REG_COM.PROVRAZSOC, '
      + '             CXP_REG_COM.BASIMP, CXP_REG_COM.IGV, CXP_REG_COM.BASIMPMIX, '
      + '             CXP_REG_COM.IGVMIX, CXP_REG_COM.BASIMPGAS, CXP_REG_COM.IGVGAS, '
      + '             CXP_REG_COM.ADQNOGRAV, CXP_REG_COM.IMPISC, CXP_REG_COM.IMPOTROS, '
      + '             CXP_REG_COM.IMPTOTAL, CXP_REG_COM.CPTCAMPR, CXP_REG_COM.MODFECEMI, '
      + '             CXP_REG_COM.MODDOCID, CXP_REG_COM.MODCPSERIE, CXP_REG_COM.MODCPNODOC, '
      + '             CXP_REG_COM.NUMDOCNODOM, CXP_REG_COM.FECCONDTR, CXP_REG_COM.NUMCONDTR, '
      + '             CXP_REG_COM.FLGRET, CXP_REG_COM.FLGMOD, CXP_REG_COM.CIAID, '
      + '             CXP_REG_COM.TDIARID, CXP_REG_COM.CPNOREG, CXP_REG_COM.CLAUXID, '
      + '             CXP_REG_COM.PROV, CXP_REG_COM.CPCANJE, CXP_REG_COM.ESDOMIC, '
      + '             nvl(IMPTOTAL,0) TOTALGRAL, '
      + '             TO_CHAR(CXP_REG_COM.FECEMI,' + QuotedStr('YYYYMM') + ') PERIODODOC '
      + '        FROM CXP_REG_COM '
      + '       WHERE nvl(ESDOMIC,''S'') =''S'' AND PERIODO = ' + QuotedStr(wgPeriodo);
// Fin HPC_201602_CXP

   DMCXP.cdsQry2.close;
   DMCXP.cdsQry2.DataRequest(xsSql);
   DMCXP.cdsQry2.open;
   DMCXP.cdsQry2.IndexFieldNames := 'CORRELATIVO';

   AssignFile(xfArchivoTexto, wgRutaArchivo);
   Rewrite(xfArchivoTexto);
   While Not DMCXP.cdsQry2.Eof Do
   Begin
   // Inicio HPC_201602_CXP
   // Cambios para PLE a partir de Enero 2016
   // Se toman datos de la Provisión por Pagar
      xsSql := 'Select CIAID, CPANOMES, TDIARID, CPNOREG, CLAUXID, PROV, '
         + '           PROVRUC, DOCID, CPSERIE, CPNODOC, CPFRECEP, CPFEMIS, '
         + '           CPFVCMTO, TMONID, CPTCAMPR, CPTCAMPA, CPESTADO, CPOCOMP, '
         + '           CP_CONTA, CPGRAVAD, CPNOGRAV, CPIGV, CPISC, CPDCTO, CPSERVIC, '
         + '           CPMTOORI, CPMTOLOC, CPMTOEXT, CPPAGORI, CPPAGLOC, CPPAGEXT, '
         + '           CPSALORI, CPSALLOC, CPSALEXT, TCANJEID, CPCANJE, CPFCANJE, '
         + '           CPUSER, CPFREG, CPHREG, CPAAAA, CPMM, CPDD, CPTRI, CPSEM, '
         + '           CPSS, CPAATRI, CPAASEM, CPAASS, CPFCMPRB, DCPLOTE, DCPCOMP, '
         + '           CTATOTAL, FLAGVAR, CPTOTOT, CPIGV2, CPGRAVAD2, CPHMOD, FLAGVAR2, '
         + '           PROVDES, CLAUXREND, AUXIDREND, CCBCOID, BANCOID, SITUAID, CPFLAGTDOC, '
         + '           CXPRRHH, AUXIDINTER, CLAUXINTER, CPTCAMDOL, PROVRETIGV, CPTCAMAJ, '
         + '           DTRPORC, CPMTOORIB, DTRFLAG, FECDEPDET, NUMDEPDET, ADQ_NO_GRAV, '
         + '           IGV_GRA_NO_DEST, CP_OTROS, CPTODETRSUNATID, TIPOOPERSUNATID, '
         + '           PORCDESC, CP4TAPENSION, SNPAFPID, TIPCOMAFPID '
         + '      from CXP301 '
         + '     where CIAID='+quotedstr(DMCXP.cdsQry2.FieldByName('CIAID').AsString)
         + '       and CPANOMES='+quotedstr(DMCXP.cdsQry2.FieldByName('PERIODO').AsString)
         + '       and TDIARID='+quotedstr(DMCXP.cdsQry2.FieldByName('TDIARID').AsString)
         + '       and CPNOREG='+quotedstr(DMCXP.cdsQry2.FieldByName('CPNOREG').AsString);
      xsTMon := 'PEN';
      xsTipoBien := '1';
      DMCXP.cdsQry.close;
      DMCXP.cdsQry.DataRequest(xsSql);
      DMCXP.cdsQry.open;
      If DMCXP.cdsQry.Recordcount>0 then
      Begin
         if DMCXP.cdsQry.FieldByName('TMONID').AsString = 'D' then
            xsTMon := 'USD';
         if DMCXP.cdsQry.FieldByName('DTRPORC').AsFloat > 0 then
            xsTipoBien := '4';
      End;
   // Fin HPC_201602_CXP

      xsPeriodoRC := wgPeriodo + '00';
      xsMes :=  copy(wgPeriodo,5,2);
      If (StrToInt(xsMes) > 1) and (StrToInt(xsMes) < 12)  then
         xsRER := 'M';
   // Inicio HPC_201602_CXP
   // Para Enero y Diciembre se antepone A=Apertura y C=Cierre
      If (StrToInt(xsMes) = 1) then
         xsRER := 'A';
      If (StrToInt(xsMes) = 12) then
         xsRER := 'C';
      xsCorrelativo := DMCXP.cdsQry2.FieldByName('TDIARID').AsString + DMCXP.cdsQry2.FieldByName('CIAID').AsString + COPY(DMCXP.cdsQry2.FieldByName('CPNOREG').AsString,6,5);
   // Fin HPC_201602_CXP
      xdFecEmi := DMCXP.cdsQry2.FieldByName('FECEMI').AsString;
      If DMCXP.cdsQry2.FieldByName('DOCID').AsString = '14' Then
      Begin
         xdFecPag := DMCXP.cdsQry2.FieldByName('FECPAG').AsString;
      End
      Else
      Begin
         xdFecPag := DMCXP.cdsQry2.FieldByName('FECPAG').AsString;
      End;
      xsDocId := DMCXP.cdsQry2.FieldByName('DOCID').AsString;
      xsSerie := DMCXP.cdsQry2.FieldByName('CPSERIE').AsString;
// Inicio HPC_201602_CXP
// Se condiciona según Tipo de Documento
      If (xsDocId = '01') Or (xsDocId = '03') Or (xsDocId = '04') Or (xsDocId = '06') Or (xsDocId = '07') Or (xsDocId = '08') Then
      Begin
         If Length(xsSerie) = 0 Then
         Begin
            xsSerie := '-';
         End
         Else
            If Length(xsSerie) <= 4 Then
            Begin
               xsSerie := StringOfChar('0', 4 - Length(xsSerie)) + xsSerie;
            End
            Else
            Begin
               xsSerie := Copy(xsSerie, Length(xsSerie)+1- 4, 4);

            End;
      End;
// Fin HPC_201602_CXP
      xsAnio := '0';

      xsNoDoc := StringReplace(DMCXP.cdsQry2.FieldByName('CPNODOC').AsString, '-', '', [rfreplaceall]);
      xsImpOpeDia := DMCXP.cdsQry2.FieldByName('IMPOPEDIA').AsString;
      xsProvDocId := DMCXP.cdsQry2.FieldByName('PROVDOCID').AsString;
      If Length(xsProvDocId) = 0 Then
      Begin
         xsProvDocId := '0';
      End;
      xsProvDocNum := DMCXP.cdsQry2.FieldByName('PROVDOCNUM').AsString;
      If Length(xsProvDocNum) = 0 Then
      Begin
         xsProvDocNum := '-';
      End;
      xsProvRazSoc := DMCXP.cdsQry2.FieldByName('PROVRAZSOC').AsString;
      If Length(xsProvRazSoc) = 0 Then
      Begin
         xsProvRazSoc := '-';
      End;
      xsBasImp := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('BASIMP').AsFloat);

      xsIgv := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('IGV').AsFloat);
      xsBasImpMixto := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('BASIMPMIX').AsFloat);
      xsIgvMixto := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('IGVMIX').AsFloat);
      xsBasImpGas := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('BASIMPGAS').AsFloat);
      xsIgvGas := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('IGVGAS').AsFloat);
      xsAdqNoGrav := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('ADQNOGRAV').AsFloat);
      xsImpIsc := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('IMPISC').AsFloat);
      xsImpOtros := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('IMPOTROS').AsFloat);

      xsImpTotal := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('TOTALGRAL').AsFloat);

      xsTipoCambio := FormatFloat('##0.000', DMCXP.cdsQry2.FieldByName('CPTCAMPR').AsFloat);
      xsModFecEmi := DMCXP.cdsQry2.FieldByName('MODFECEMI').AsString;
      If Length(xsModFecEmi) = 0 Then
      Begin
         xsModFecEmi := '01/01/0001';
      End;
      xsModDocId := DMCXP.cdsQry2.FieldByName('MODDOCID').AsString;
      If Length(xsModDocId) = 0 Then
      Begin
         xsModDocId := '00';
      End;
      xsModSerie := DMCXP.cdsQry2.FieldByName('MODCPSERIE').AsString;
// Inicio HPC_201602_CXP
// Se condiciona Código de Documento del módulo
      If (xsModDocId = '01') Or (xsModDocId = '03') Or (xsModDocId = '04') Or (xsModDocId = '06') Then
      Begin
         If Length(xsModSerie) = 0 Then
         Begin
            xsModSerie := '-';
         End
         Else
         begin
            If Length(xsModSerie) <= 4 Then
            begin
               xsModSerie := StringOfChar('0', 4 - Length(xsModSerie)) + xsModSerie;
            end
            else
            begin
               xsModSerie := Copy(xsModSerie, Length(xsModSerie)+1- 4, 4);
            end;
         end;
      End;

//      If Length(xsModSerie) = 0 Then
//      Begin
//         xsModSerie := '-';
//      End;
// Fin HPC_201602_CXP

      xsModNoDoc := DMCXP.cdsQry2.FieldByName('MODCPNODOC').AsString;
      If Length(xsModNoDoc) = 0 Then
      Begin
         xsModNoDoc := '-';
      End;
      xsNumDocNoDom := DMCXP.cdsQry2.FieldByName('NUMDOCNODOM').AsString;
      If Length(xsNumDocNoDom) = 0 Then
      Begin
         xsNumDocNoDom := '-';
      End;
      xsFecDetraccion := DMCXP.cdsQry2.FieldByName('FECCONDTR').AsString;
      If Length(xsFecDetraccion) = 0 Then
      Begin
         xsFecDetraccion := '01/01/0001';
      End;
      xsNumDetraccion := DMCXP.cdsQry2.FieldByName('NUMCONDTR').AsString;
      If Length(xsNumDetraccion) = 0 Then
      Begin
         xsNumDetraccion := '0';
      End;
      xsFlgRet := DMCXP.cdsQry2.FieldByName('FLGRET').AsString;
      xsFlgMod := DMCXP.cdsQry2.FieldByName('FLGMOD').AsString;

// Inicio HPC_201602_CXP
// Cambios para PLE a partir de Enero 2016
{
      WriteLn(xfArchivoTexto, xsPeriodoRC + xsDelimitador + // 1
         xsCorrelativo + xsDelimitador +                    // 2
         xsRER+xsCorrelativo + xsDelimitador +              // 3
         xdFecEmi + xsDelimitador +                         // 4
         xdFecPag + xsDelimitador +                         // 5
         xsDocId + xsDelimitador +                          // 6
         xsSerie + xsDelimitador +                          // 7
         xsAnio + xsDelimitador +                           // 8
         xsNoDoc + xsDelimitador +                          // 9
         xsImpOpeDia + xsDelimitador +                      // 10
         xsProvDocId + xsDelimitador +                      // 11
         xsProvDocNum + xsDelimitador +                     // 12
         xsProvRazSoc + xsDelimitador +                     // 13
         xsBasImp + xsDelimitador +                         // 14
         xsIgv + xsDelimitador +                            // 15
         xsBasImpMixto + xsDelimitador +                    // 16
         xsIgvMixto + xsDelimitador +                       // 17
         xsBasImpGas + xsDelimitador +                      // 18
         xsIgvGas + xsDelimitador +                         // 19
         xsAdqNoGrav + xsDelimitador +                      // 20
         xsImpIsc + xsDelimitador +                         // 21
         xsImpOtros + xsDelimitador +                       // 22
         xsImpTotal + xsDelimitador +                       // 23
         xsTipoCambio + xsDelimitador +                     // 24
         xsModFecEmi + xsDelimitador +                      // 25
         xsModDocId + xsDelimitador +                       // 26
         xsModSerie + xsDelimitador +                       // 27
         xsDelimitador +                                    // 28
         xsModNoDoc + xsDelimitador +                       // 29
         xsNumDocNoDom + xsDelimitador +                    // 30
         xsFecDetraccion + xsDelimitador +                  // 31
         xsNumDetraccion + xsDelimitador +                  // 32
         xsFlgRet + xsDelimitador +                         // 33
         xsFlgMod + xsDelimitador);                         // 34
}
      WriteLn(xfArchivoTexto, xsPeriodoRC + xsDelimitador + // 1
         xsCorrelativo + xsDelimitador +                    // 2
         xsRER+xsCorrelativo + xsDelimitador +              // 3
         xdFecEmi + xsDelimitador +                         // 4
         xdFecPag + xsDelimitador +                         // 5
         xsDocId + xsDelimitador +                          // 6
         xsSerie + xsDelimitador +                          // 7
         xsAnio + xsDelimitador +                           // 8
         xsNoDoc + xsDelimitador +                          // 9
         xsDelimitador +                                    // 10
         xsProvDocId + xsDelimitador +                      // 11
         xsProvDocNum + xsDelimitador +                     // 12
         xsProvRazSoc + xsDelimitador +                     // 13
         xsBasImp + xsDelimitador +                         // 14
         xsIgv + xsDelimitador +                            // 15
         xsBasImpMixto + xsDelimitador +                    // 16
         xsIgvMixto + xsDelimitador +                       // 17
         xsBasImpGas + xsDelimitador +                      // 18
         xsIgvGas + xsDelimitador +                         // 19
         xsAdqNoGrav + xsDelimitador +                      // 20
         xsImpIsc + xsDelimitador +                         // 21
         xsImpOtros + xsDelimitador +                       // 22
         xsImpTotal + xsDelimitador +                       // 23
         xsTMon + xsDelimitador +                           // 24
         xsTipoCambio + xsDelimitador +                     // 25
         xsModFecEmi + xsDelimitador +                      // 26
         xsModDocId + xsDelimitador +                       // 27
         xsModSerie + xsDelimitador +                       // 28
         xsDelimitador +                                    // 29
         xsModNoDoc + xsDelimitador +                       // 30
    //   xsNumDocNoDom + xsDelimitador +                    // 31
         xsFecDetraccion + xsDelimitador +                  // 31
         xsNumDetraccion + xsDelimitador +                  // 32
         xsDelimitador +                                    // 33
         xsTipoBien + xsDelimitador +                       // 34
         xsDelimitador +                                    // 35
         xsDelimitador +                                    // 36
         xsDelimitador +                                    // 37
         xsDelimitador +                                    // 38
         xsDelimitador +                                    // 39
         xsDelimitador +                                    // 40
         xsFlgMod + xsDelimitador);                         // 41
// Fin HPC_201602_CXP

      DMCXP.cdsQry2.Next;
   End;
   CloseFile(xfArchivoTexto);
   DMCXP.cdsQry2.Close;
   DMCXP.cdsQry2.IndexFieldNames := '';
   ShowMessage('Archivo '+wgRutaArchivo+#13+' generado correctamente');
end;

// Inicio HPC_201602_CXP
// Se añade rutina para exportar PLE de Proveedores No Domiciliados
procedure TFRegComprasPLE.fg_PLEexportarFormatoNoDom(wgPeriodo,
  wgRutaArchivo: String);
Var
   xsSql: String;
   xfArchivoTexto: TextFile;
   xsDelimitador: String;
   xsPeriodoRC: String;
   xsMes: String;
   xsRER: String;
   xsCantid : Integer;
   xsTamano : Integer;
   xsCorrelativo: String;
   xdFecEmi: String;
   xdFecPag: String;
   xsDocId: String;
   xsSerie: String;
   xsAnio: String;
   xsNoDoc: String;
   xsImpOpeDia: String;
   xsProvDocId: String;
   xsProvDocNum: String;
   xsProvRazSoc: String;
   xsBasImp: String;
   xsIgv: String;
   xsBasImpMixto: String;
   xsIgvMixto: String;
   xsBasImpGas: String;
   xsIgvGas: String;
   xsAdqNoGrav: String;
   xsImpIsc: String;
   xsImpOtros: String;
   xsImpTotal: String;
   xsTipoCambio: String;
   xsNumDocNoDom: String;
   xsFecDetraccion: String;
   xsNumDetraccion: String;
   xsFlgRet: String;
   xsFlgMod: String;
   xsPaisOrig: String;
   xsProvDes: String;
   xsProvDNI: String;
   xsProvconvenio: String;
   xsTipoRenta: String;
   xsEstadoAjuste: String;
   xsTMon : String; //  Tipo de Moneda
   xsTipoBien : String; // Tipo de Bien (Tabla 30 de PLE de SUNAT)

Begin
   xsDelimitador := '|';
   xsSql :=  ' Select CXP_REG_COM.PERIODO, CXP_REG_COM.CORRELATIVO, CXP_REG_COM.FECEMI, '
      + '             CXP_REG_COM.FECPAG, CXP_REG_COM.DOCID, CXP_REG_COM.CPSERIE, '
      + '             CXP_REG_COM.ANIO, CXP_REG_COM.CPNODOC, CXP_REG_COM.IMPOPEDIA, '
      + '             CXP_REG_COM.PROVDOCID, CXP_REG_COM.PROVDOCNUM, CXP_REG_COM.PROVRAZSOC, '
      + '             CXP_REG_COM.BASIMP, CXP_REG_COM.IGV, CXP_REG_COM.BASIMPMIX, '
      + '             CXP_REG_COM.IGVMIX, CXP_REG_COM.BASIMPGAS, CXP_REG_COM.IGVGAS, '
      + '             CXP_REG_COM.ADQNOGRAV, CXP_REG_COM.IMPISC, CXP_REG_COM.IMPOTROS, '
      + '             CXP_REG_COM.IMPTOTAL, CXP_REG_COM.CPTCAMPR, CXP_REG_COM.MODFECEMI, '
      + '             CXP_REG_COM.MODDOCID, CXP_REG_COM.MODCPSERIE, CXP_REG_COM.MODCPNODOC, '
      + '             CXP_REG_COM.NUMDOCNODOM, CXP_REG_COM.FECCONDTR, CXP_REG_COM.NUMCONDTR, '
      + '             CXP_REG_COM.FLGRET, CXP_REG_COM.FLGMOD, CXP_REG_COM.CIAID, '
      + '             CXP_REG_COM.TDIARID, CXP_REG_COM.CPNOREG, CXP_REG_COM.CLAUXID, '
      + '             CXP_REG_COM.PROV, CXP_REG_COM.CPCANJE, CXP_REG_COM.ESDOMIC, '
      + '             nvl(IMPTOTAL,0) TOTALGRAL, '
      + '             TO_CHAR(CXP_REG_COM.FECEMI,' + QuotedStr('YYYYMM') + ') PERIODODOC '
      + '        from CXP_REG_COM '
      + '       where nvl(ESDOMIC,''S'') =''N'' and PERIODO = ' + QuotedStr(wgPeriodo);
   DMCXP.cdsQry2.close;
   DMCXP.cdsQry2.DataRequest(xsSql);
   DMCXP.cdsQry2.open;
   DMCXP.cdsQry2.IndexFieldNames := 'CORRELATIVO';

   AssignFile(xfArchivoTexto, wgRutaArchivo);
   Rewrite(xfArchivoTexto);
   While Not DMCXP.cdsQry2.Eof Do
   Begin
      xsPaisOrig:='';
      xsProvDes:='';
      xsProvDNI:='';
      xsProvconvenio:='';
      xsTipoRenta:='';
      xsEstadoAjuste:='';
// Cambios para PLE a partir de Enero 2016
// Se toman datos de la Provisión por Pagar
      xsSql := 'Select C.CIAID, C.CPANOMES, C.TDIARID, C.CPNOREG, C.CLAUXID, C.PROV, '
         + '           C.PROVRUC, C.DOCID, C.CPSERIE, C.CPNODOC, C.CPFRECEP, C.CPFEMIS, '
         + '           C.CPFVCMTO, C.TMONID, C.CPTCAMPR, C.CPTCAMPA, C.CPESTADO, C.CPOCOMP, '
         + '           C.CP_CONTA, C.CPGRAVAD, C.CPNOGRAV, C.CPIGV, C.CPISC, C.CPDCTO, C.CPSERVIC, '
         + '           C.CPMTOORI, C.CPMTOLOC, C.CPMTOEXT, C.CPPAGORI, C.CPPAGLOC, C.CPPAGEXT, '
         + '           C.CPSALORI, C.CPSALLOC, C.CPSALEXT, C.TCANJEID, C.CPCANJE, C.CPFCANJE, '
         + '           C.CPUSER, C.CPFREG, C.CPHREG, C.CPAAAA, C.CPMM, C.CPDD, C.CPTRI, C.CPSEM, '
         + '           C.CPSS, C.CPAATRI, C.CPAASEM, C.CPAASS, C.CPFCMPRB, C.DCPLOTE, C.DCPCOMP, '
         + '           C.CTATOTAL, C.FLAGVAR, C.CPTOTOT, C.CPIGV2, C.CPGRAVAD2, C.CPHMOD, C.FLAGVAR2, '
         + '           C.PROVDES, C.CLAUXREND, C.AUXIDREND, C.CCBCOID, C.BANCOID, C.SITUAID, C.CPFLAGTDOC, '
         + '           C.CXPRRHH, C.AUXIDINTER, C.CLAUXINTER, C.CPTCAMDOL, C.PROVRETIGV, C.CPTCAMAJ, '
         + '           C.DTRPORC, C.CPMTOORIB, C.DTRFLAG, C.FECDEPDET, C.NUMDEPDET, C.ADQ_NO_GRAV, '
         + '           C.IGV_GRA_NO_DEST, C.CP_OTROS, C.CPTODETRSUNATID, C.TIPOOPERSUNATID, '
         + '           C.PORCDESC, C.CP4TAPENSION, C.SNPAFPID, C.TIPCOMAFPID, U.PAISDES, U.CODSUNAT,T.TIPPERID,T.PROVDNI,T.PROVRUC PROVRUCNODOM, T.PAISID '
         + '      from CXP301 C '
         + '      inner join tge201 T on C.CLAUXID= T.CLAUXID AND C.PROV = T.PROV '
         + '      INNER JOIN TGE118 U on T.PAISID = U.PAISID  '
         + '     where C.CIAID='+quotedstr(DMCXP.cdsQry2.FieldByName('CIAID').AsString)
         + '       and C.CPANOMES='+quotedstr(DMCXP.cdsQry2.FieldByName('PERIODO').AsString)
         + '       and C.TDIARID='+quotedstr(DMCXP.cdsQry2.FieldByName('TDIARID').AsString)
         + '       and C.CPNOREG='+quotedstr(DMCXP.cdsQry2.FieldByName('CPNOREG').AsString);
      xsTMon := 'PEN';
      xsTipoBien := '1';
      DMCXP.cdsQry.close;
      DMCXP.cdsQry.DataRequest(xsSql);
      DMCXP.cdsQry.open;
      If DMCXP.cdsQry.Recordcount>0 then
      Begin
         if DMCXP.cdsQry.FieldByName('TMONID').AsString = 'D' then
            xsTMon := 'USD';
         if DMCXP.cdsQry.FieldByName('DTRPORC').AsFloat > 0 then
            xsTipoBien := '4';
         If (DMCXP.cdsQry.fieldbyname('CODSUNAT').AsString = '') Or (DMCXP.cdsQry.fieldbyname('CODSUNAT').IsNull) Then
         begin
            ShowMessage('No existe código Sunat en el Maestro de Nacionalidad '+DMCXP.cdsQry.fieldbyname('PAISID').AsString+#13+DMCXP.cdsQry.fieldbyname('PAISDES').AsString+' actualice!!!');
            exit;
         end
         else
         begin
            xsPaisOrig := DMCXP.cdsQry.FieldByName('CODSUNAT').AsString;
         end;

         If (DMCXP.cdsQry.fieldbyname('PROVDES').AsString = '') Or (DMCXP.cdsQry.fieldbyname('PROVDES').IsNull) Then
         begin
            ShowMessage('No existe la descripción del Proveedor en el Maestro '+DMCXP.cdsQry.fieldbyname('CLAUXID').AsString+#13+DMCXP.cdsQry.fieldbyname('PROV').AsString+' actualice!!!');
            exit;
         end
         else
         begin
            xsProvDes := DMCXP.cdsQry.FieldByName('PROVDES').AsString;
         end;

         If (DMCXP.cdsQry.fieldbyname('PROVRUCNODOM').IsNull) and (DMCXP.cdsQry.fieldbyname('PROVDNI').IsNull) Then
         begin
            ShowMessage('No existe el número de identificación del sujeto no domiciliado '+#13+DMCXP.cdsQry.fieldbyname('CLAUXID').AsString+' '+DMCXP.cdsQry.fieldbyname('PROV').AsString+' actualice!!!');
            exit;
         end
         else
         begin
            If (DMCXP.cdsQry.fieldbyname('TIPPERID').AsString = '03') then
               xsProvDNI := DMCXP.cdsQry.FieldByName('PROVDNI').AsString
            else if (DMCXP.cdsQry.fieldbyname('TIPPERID').AsString = '04') then
               xsProvDNI := DMCXP.cdsQry.FieldByName('PROVRUCNODOM').AsString;
         end;
      End;
      xsProvconvenio:='00';
      xsTipoRenta:='18';
      xsEstadoAjuste:='0';
      xsPeriodoRC := wgPeriodo + '00';
      xsMes :=  copy(wgPeriodo,5,2);
      If (StrToInt(xsMes) > 1) and (StrToInt(xsMes) < 12)  then
         xsRER := 'M';
   // Para Enero y Diciembre se antepone A=Apertura y C=Cierre
      If (StrToInt(xsMes) = 1) then
         xsRER := 'A';
      If (StrToInt(xsMes) = 12) then
         xsRER := 'C';
      xsCorrelativo := DMCXP.cdsQry2.FieldByName('TDIARID').AsString + DMCXP.cdsQry2.FieldByName('CIAID').AsString + COPY(DMCXP.cdsQry2.FieldByName('CPNOREG').AsString,6,5);
      xdFecEmi := DMCXP.cdsQry2.FieldByName('FECEMI').AsString;
      If DMCXP.cdsQry2.FieldByName('DOCID').AsString = '14' Then
      Begin
         xdFecPag := DMCXP.cdsQry2.FieldByName('FECPAG').AsString;
      End
      Else
      Begin
         xdFecPag := DMCXP.cdsQry2.FieldByName('FECPAG').AsString;
      End;

      xsDocId := DMCXP.cdsQry2.FieldByName('DOCID').AsString;
      xsSerie := DMCXP.cdsQry2.FieldByName('CPSERIE').AsString;
      If (xsDocId = '01') Or (xsDocId = '03') Or (xsDocId = '06') Or (xsDocId = '07') Or (xsDocId = '08') Then
      Begin
         If Length(xsSerie) = 0 Then
         Begin
            xsSerie := '-';
         End
         Else
            If Length(xsSerie) <= 4 Then
            Begin
               xsSerie := StringOfChar('0', 4 - Length(xsSerie)) + xsSerie;
            End
            Else
            Begin


            End;
      End;
      xsAnio := '0';

      xsNoDoc := StringReplace(DMCXP.cdsQry2.FieldByName('CPNODOC').AsString, '-', '', [rfreplaceall]);
      xsImpOpeDia := DMCXP.cdsQry2.FieldByName('IMPOPEDIA').AsString;
      xsProvDocId := DMCXP.cdsQry2.FieldByName('PROVDOCID').AsString;
      If Length(xsProvDocId) = 0 Then
      Begin
         xsProvDocId := '0';
      End;
      xsProvDocNum := DMCXP.cdsQry2.FieldByName('PROVDOCNUM').AsString;
      If Length(xsProvDocNum) = 0 Then
      Begin
         xsProvDocNum := '-';
      End;
      xsProvRazSoc := DMCXP.cdsQry2.FieldByName('PROVRAZSOC').AsString;
      If Length(xsProvRazSoc) = 0 Then
      Begin
         xsProvRazSoc := '-';
      End;
      xsBasImp := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('BASIMP').AsFloat);

      xsIgv := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('IGV').AsFloat);
      xsBasImpMixto := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('BASIMPMIX').AsFloat);
      xsIgvMixto := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('IGVMIX').AsFloat);
      xsBasImpGas := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('BASIMPGAS').AsFloat);
      xsIgvGas := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('IGVGAS').AsFloat);
      xsAdqNoGrav := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('ADQNOGRAV').AsFloat);
      xsImpIsc := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('IMPISC').AsFloat);
      xsImpOtros := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('IMPOTROS').AsFloat);

      xsImpTotal := FormatFloat('##0.00', DMCXP.cdsQry2.FieldByName('TOTALGRAL').AsFloat);

      xsTipoCambio := FormatFloat('##0.000', DMCXP.cdsQry2.FieldByName('CPTCAMPR').AsFloat);
      xsModFecEmi := DMCXP.cdsQry2.FieldByName('MODFECEMI').AsString;
      If Length(xsModFecEmi) = 0 Then
      Begin
         xsModFecEmi := '01/01/0001';
      End;
      xsModDocId := DMCXP.cdsQry2.FieldByName('MODDOCID').AsString;
      If Length(xsModDocId) = 0 Then
      Begin
         xsModDocId := '00';
      End;


      xsModSerie := DMCXP.cdsQry2.FieldByName('MODCPSERIE').AsString;
      If Length(xsModSerie) = 0 Then
      Begin
         xsModSerie := '-';
      End;
      xsModNoDoc := DMCXP.cdsQry2.FieldByName('MODCPNODOC').AsString;
      If Length(xsModNoDoc) = 0 Then
      Begin
         xsModNoDoc := '-';
      End;
      xsNumDocNoDom := DMCXP.cdsQry2.FieldByName('NUMDOCNODOM').AsString;
      If Length(xsNumDocNoDom) = 0 Then
      Begin
         xsNumDocNoDom := '-';
      End;
      xsFecDetraccion := DMCXP.cdsQry2.FieldByName('FECCONDTR').AsString;
      If Length(xsFecDetraccion) = 0 Then
      Begin
         xsFecDetraccion := '01/01/0001';
      End;
      xsNumDetraccion := DMCXP.cdsQry2.FieldByName('NUMCONDTR').AsString;
      If Length(xsNumDetraccion) = 0 Then
      Begin
         xsNumDetraccion := '0';
      End;
      xsFlgRet := DMCXP.cdsQry2.FieldByName('FLGRET').AsString;
      xsFlgMod := DMCXP.cdsQry2.FieldByName('FLGMOD').AsString;

      WriteLn(xfArchivoTexto, xsPeriodoRC + xsDelimitador + // 1
         xsCorrelativo + xsDelimitador +                    // 2
         xsRER+xsCorrelativo + xsDelimitador +              // 3
         xdFecEmi + xsDelimitador +                         // 4
         xsDocId + xsDelimitador +                          // 5
         xsSerie + xsDelimitador +                          // 6
         xsNoDoc + xsDelimitador +                          // 7
         xsDelimitador +                                    // 8
         xsDelimitador +                                    // 9
         xsImpTotal + xsDelimitador +                      // 10
         xsDelimitador +                                    // 11
         xsDelimitador +                                    // 12
         xsDelimitador +                                    // 13
         xsDelimitador +                                    // 14
         xsDelimitador +                                    // 15
         xsTMon + xsDelimitador +                           // 16
         xsTipoCambio + xsDelimitador +                     // 17
         xsPaisOrig + xsDelimitador +                       // 18
         xsProvDes + xsDelimitador +                        // 19
         xsDelimitador +                                    // 20
         xsProvDNI + xsDelimitador +                        // 21
         xsDelimitador +                                    // 22
         xsDelimitador +                                    // 23
         xsDelimitador +                                    // 24
         xsDelimitador +                                    // 25
         xsDelimitador +                                    // 26
         xsDelimitador +                                    // 27
         xsDelimitador +                                    // 28
         xsDelimitador +                                    // 29
         xsDelimitador +                                    // 30
         xsProvconvenio + xsDelimitador +                   // 31
         xsDelimitador +                                    // 32
         xsTipoRenta + xsDelimitador +                      // 33
         xsDelimitador +                                    // 34
         xsDelimitador +                                    // 35
         xsEstadoAjuste + xsDelimitador +                   // 36
         xsDelimitador);                                    // 37

      DMCXP.cdsQry2.Next;
   End;
   CloseFile(xfArchivoTexto);
   DMCXP.cdsQry2.Close;
   DMCXP.cdsQry2.IndexFieldNames := '';
   ShowMessage('Archivo '+wgRutaArchivo+#13+' generado correctamente');
   
end;
// Fin HPC_201602_CXP

procedure TFRegComprasPLE.fg_PLEinsertaTabla(
  wgRegistroCompras: TwwClientDataSet; wgPeriodo: String);
Var
   xsPeriodoRC: String;
   xsCorrelativo: String;
   xsFecEmi: String;
   xsFecPag: String;
   xsDocId: String;
   xsSerie: String;
   xsAnio: String;
   xsNoDoc: String;
   xsImpOpeDia: String;
   xsProvDocId: String;
   xsProvDocNum: String;
   xsProvRazSoc: String;
   xsBasImp: String;
   xsIgv: String;
   xsBasImpMixto: String;
   xsIgvMixto: String;
   xsBasImpGas: String;
   xsIgvGas: String;
   xsAdqNoGrav: String;
   xsImpIsc: String;
   xsImpOtros: String;
   xsImpTotal: String;
   xsTipoCambio: String;
   xsNumDocNoDom: String;
   xsFecDetraccion: String;
   xsNumDetraccion: String;
   xsFlgRet: String;
   xsFlgMod: String;
   xsCompania: String;
   xsTDiario: String;
   xsCPNoReg: String;
   xsClauxId: String;
   xsProv: String;
   xsObserv: String;

   xnCorrelativo: Double;
   xsSql: String;
Begin

   fg_PLEeliminaRegCompras(wgPeriodo);
   //validamos los datos usando el mismo clientdataset (cdsRegCompra)
   xnCorrelativo := 1;

// inicializa barra de progreso que se muestra en la pantalla
   prgb_Progreso.Max := wgRegistroCompras.RecordCount;
   prgb_Progreso.Min := 0;
   prgb_Progreso.Position := 0;

   While Not wgRegistroCompras.Eof Do
   Begin

      xsPeriodoRC := wgPeriodo;
      xsCorrelativo := FormatFloat('0000000', xnCorrelativo);
      xsFecEmi := wgRegistroCompras.FieldByName('FECEMI').AsString;
      xsFecPag := wgRegistroCompras.FieldByName('FECPAG').AsString;

      xsDocId := wgRegistroCompras.FieldByName('DOCID').AsString;
      xsSerie := wgRegistroCompras.FieldByName('CPSERIE').AsString;
      xsAnio := wgRegistroCompras.FieldByName('ANIO').AsString;
      xsNoDoc := wgRegistroCompras.FieldByName('CPNODOC').AsString;
      xsImpOpeDia := wgRegistroCompras.FieldByName('IMPOPEDIA').AsString;

      xsProvDocId := wgRegistroCompras.FieldByName('PROVDOCID').AsString;
      xsProvDocNum := wgRegistroCompras.FieldByName('PROVDOCNUM').AsString;
      if (xsProvDocId='1') and (length(xsProvDocNum)=11) then
         xsProvDocId:='6';

      xsProvRazSoc := wgRegistroCompras.FieldByName('PROVRAZSOC').AsString;
      xsBasImp := wgRegistroCompras.FieldByName('BASIMP').AsString;
      xsIgv := wgRegistroCompras.FieldByName('IGV').AsString;
      xsBasImpMixto := wgRegistroCompras.FieldByName('BASIMPMIX').AsString;
      xsIgvMixto := wgRegistroCompras.FieldByName('IGVMIX').AsString;
      xsBasImpGas := wgRegistroCompras.FieldByName('BASIMPGAS').AsString;
      xsIgvGas := wgRegistroCompras.FieldByName('IGVGAS').AsString;
      xsAdqNoGrav := wgRegistroCompras.FieldByName('ADQNOGRAV').AsString;
      xsImpIsc := wgRegistroCompras.FieldByName('IMPISC').AsString;
      xsImpOtros := wgRegistroCompras.FieldByName('IMPOTROS').AsString;
      xsImpTotal := wgRegistroCompras.FieldByName('IMPTOTAL').AsString;
      xsTipoCambio := wgRegistroCompras.FieldByName('CPTCAMPR').AsString;
      xsObserv := wgRegistroCompras.FieldByName('OBS_X_ERROR').AsString;
      //en el caso de ser NC
      If xsDocId = '07' Then
      Begin
         fg_PLEdocReferenciaNC(xsModFecEmi, xsModDocId, xsModSerie, xsModNoDoc,
            wgRegistroCompras.FieldByName('CIAID').AsString,
            wgRegistroCompras.FieldByName('CPCANJE').AsString,
            wgRegistroCompras.FieldByName('PROV').AsString);
      End
      Else
         If xsDocId = '08' Then
         Begin
            xsModFecEmi := ' To_date(' + QuotedStr(xsFecEmi) + ',' + QuotedStr('dd/mm/yyyy') + ')';
            xsModDocId := xsDocId;
            xsModSerie := xsSerie;
            xsModNoDoc := xsNoDoc;
         End
         Else
         Begin
            xsModFecEmi := 'Null';
            xsModDocId := '';
            xsModSerie := '';
            xsModNoDoc := '';
         End;

      xsSql := ' CLAUXID = ' + QuotedStr(wgRegistroCompras.FieldByName('CLAUXID').AsString)
              +' AND PROV = ' + QuotedStr(wgRegistroCompras.FieldByName('PROV').AsString)
              +' AND TIPPERID IN (' + QuotedStr('03') + ',' + QuotedStr('04') + ') ';

      If Length(BuscaQry('dspTGE', 'TGE201', 'PROVRUC', xsSql, 'PROVRUC')) > 0 Then
      Begin
         xsNumDocNoDom := DMCXP.cdsQry.FieldByName('PROVRUC').AsString;
      End
      Else
      Begin
         xsNumDocNoDom := '';
      End;

      xsFecDetraccion := wgRegistroCompras.FieldByName('FECCONDTR').AsString;
      If Length(xsFecDetraccion) = 0 Then
      Begin
         xsFecDetraccion := 'NULL';
      End
      Else
      Begin
         xsFecDetraccion := 'To_date(' + QuotedStr(xsFecDetraccion) + ',' + QuotedStr('dd/mm/yyyy') + ')';
      End;
      xsNumDetraccion := wgRegistroCompras.FieldByName('NUMCONDTR').AsString;
      xsFlgRet := wgRegistroCompras.FieldByName('FLGRET').AsString;
      xsFlgMod := wgRegistroCompras.FieldByName('FLGMOD').AsString;

      If xsPeriodoRC = wgRegistroCompras.FieldByName('PERIODODOC').AsString Then //en el mismo periodo
      Begin
         xsFlgMod := '1';
      End
      Else
         If StrToFloat(xsPeriodoRC) - StrToFloat(wgRegistroCompras.FieldByName('PERIODODOC').AsString) < 100 Then //menos de 12 meses
         Begin
            xsFlgMod := '6';
         End
         Else
            If StrToFloat(xsPeriodoRC) - StrToFloat(wgRegistroCompras.FieldByName('PERIODODOC').AsString) >= 100 Then //mas de 12 meses
            Begin
               xsFlgMod := '7';
            End;

      xsCompania := wgRegistroCompras.FieldByName('CIAID').AsString;
      xsTDiario := wgRegistroCompras.FieldByName('TDIARID').AsString;
      xsCPNoReg := wgRegistroCompras.FieldByName('CPNOREG').AsString;
      xsClauxId := wgRegistroCompras.FieldByName('CLAUXID').AsString;
      xsProv := wgRegistroCompras.FieldByName('PROV').AsString;
// Inicio HPC_201602_CXP
// se añade flag de domiciliado
      xsSql := ' INSERT INTO CXP_REG_COM (PERIODO, CORRELATIVO, '
             + '                          FECEMI, '
             + '                          FECPAG, '
             + '                          DOCID, CPSERIE, ANIO, '
             + '                          CPNODOC, IMPOPEDIA, PROVDOCID, PROVDOCNUM, '
             + '                          PROVRAZSOC, BASIMP, IGV, BASIMPMIX, IGVMIX, '
             + '                          BASIMPGAS, IGVGAS, ADQNOGRAV, IMPISC, '
             + '                          IMPOTROS, IMPTOTAL, CPTCAMPR, MODFECEMI, MODDOCID, '
             + '                          MODCPSERIE, MODCPNODOC, NUMDOCNODOM, '
             + '                          FECCONDTR, NUMCONDTR, FLGRET, FLGMOD, '
             + '                          CIAID, TDIARID, CPNOREG, '
             + '                          CLAUXID, PROV, CPCANJE, ESDOMIC) '
             + ' Values ('+ QuotedStr(xsPeriodoRC)+', '+QuotedStr(xsCorrelativo)+', '
                          +'to_date('+QuotedStr(xsFecEmi)+','+QuotedStr('dd/mm/yyyy')+'), '
                          +'to_date('+QuotedStr(xsFecPag)+','+QuotedStr('dd/mm/yyyy')+'), '
                          + QuotedStr(xsDocId)+', '+QuotedStr(xsSerie)+', '+ xsAnio + ', '
                          + QuotedStr(xsNoDoc)+', '+xsImpOpeDia+', '+QuotedStr(xsProvDocId)+', '+QuotedStr(xsProvDocNum)+', '
                          + QuotedStr(xsProvRazSoc)+', '+xsBasImp+', '+xsIgv+', '+xsBasImpMixto+', '+xsIgvMixto+', '
                          + xsBasImpGas+', '+xsIgvGas+', '+xsAdqNoGrav+', '+xsImpIsc+', '
                          + xsImpOtros+', '+xsImpTotal+', '+xsTipoCambio+', '+xsModFecEmi+', '+QuotedStr(xsModDocId)+', '
                          + QuotedStr(xsModSerie)+', '+QuotedStr(xsModNoDoc)+', '+QuotedStr(xsNumDocNoDom)+', '
                          + xsFecDetraccion+', '+QuotedStr(xsNumDetraccion)+', '+QuotedStr(xsFlgRet)+', '+QuotedStr(xsFlgMod)+', '
                          + QuotedStr(xsCompania)+', '+QuotedStr(xsTDiario)+', '+QuotedStr(xsCPNoReg)+', '
                          + QuotedStr(xsClauxId)+', '+QuotedStr(xsProv) +','
                          + Quotedstr(wgRegistroCompras.FieldByName('CPCANJE').AsString) +','
                          + Quotedstr(wgRegistroCompras.FieldByName('ESDOMIC').AsString)
                          + ') ';
// Fin HPC_201602_CXP
      DMCXP.DCOM1.AppServer.EjecutaSQL(xsSql);

   // incrementa barra de progreso que se muestra en la pantalla
      prgb_Progreso.Position := prgb_Progreso.Position + 1;

      xnCorrelativo := xnCorrelativo + 1;
      wgRegistroCompras.Next;
   End;
   xsSQL := 'update CXP_REG_COM '
           +'   set IMPTOTAL = ADQNOGRAV + BASIMPGAS + BASIMPMIX + BASIMP + IGV + IGVMIX + IGVGAS + IMPOTROS '
           +' where PERIODO='+quotedstr(FCRegComp.dbeAnoMM.Text);
   DMCXP.DCOM1.AppServer.EjecutaSQL(xsSql);
end;

function TFRegComprasPLE.fg_PLEobtieneTdocProv(wgTipoAuxiliar,
  wgAuxiliarId, wgNumDocIdentidad: String): String;
Begin
   If Length(wgNumDocIdentidad) = 11 Then
   Begin
      Result := '6';
   End
   Else
   Begin
      Result := '1';
   End;
end;

function TFRegComprasPLE.fg_PLEprocesaRegCompras(
  wgPeriodo: String): Boolean;
Var
   xTieneErrores: Boolean;
Begin
   xTieneErrores := False;
// Inicio HPC_201602_CXP
// se restan los descuentos que ya están en Negativos
   xsSql := ' SELECT CXP301.CPANOMES  PERIODO, '
           +'        LPAD(ROWNUM,10,' + QuotedStr('0') + ') CORRELATIVO, '
           +'        trunc(CXP301.CPFEMIS) FECEMI, '
           +'        trunc(CXP301.CPFEMIS) FECPAG, '
           +'       (SELECT TGE110.TDOC_SUNAT '
           +'          FROM TGE110 '
           +'         WHERE TGE110.DOCID = CXP301.DOCID '
           +'           AND TGE110.DOCMOD = ' + QuotedStr('CXP') + ' ) DOCID,'
           +'        CXP301.CPSERIE, '
           +'        TO_NUMBER(SUBSTR(CXP301.CPANOMES,1,4)) ANIO, '
           +'        CXP301.CPNODOC, '
           +'        0 IMPOPEDIA, '
           +'       (select substr(TGE109.TDOC_SUNAT,2,1) TDOC_SUNAT '
           +'          from TGE201, TGE109 '
           +'         where TGE201.CLAUXID = CXP301.CLAUXID '
           +'           and TGE201.PROV = CXP301.PROV '
           +'           and TGE201.TIPPERID=TGE109.TIPPERID ) PROVDOCID, '
           +'        CXP301.PROVRUC PROVDOCNUM, '
// Inicio HPC_201604_CXP
//    11/08/2016  Se cambia SQL que alimenta tabla con registros PLE, se tomará Razón Social del MAestro de Proveedores
           // +'        substr(CXP301.PROVDES,1,60) PROVRAZSOC, '
           +'        substr(TGE201.PROVDES,1,60) PROVRAZSOC, '
// Fin HPC_201604_CXP
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuotedStr('N') + ' THEN CXP301.CPGRAVAD        ELSE CXP301.CPGRAVAD * CXP301.CPTCAMPR END),0) BASIMP, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N') + ' THEN CXP301.CPIGV           ELSE CXP301.CPIGV * CXP301.CPTCAMPR END),0) IGV, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N') + ' THEN CXP301.CPGRAVAD2       ELSE CXP301.CPGRAVAD2 * CXP301.CPTCAMPR END),0) BASIMPMIX, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N') + ' THEN CXP301.CPIGV2          ELSE CXP301.CPIGV2 * CXP301.CPTCAMPR END),0) IGVMIX, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N') + ' THEN CXP301.CPNOGRAV        ELSE CXP301.CPNOGRAV * CXP301.CPTCAMPR END),0) BASIMPGAS, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N') + ' THEN CXP301.IGV_GRA_NO_DEST ELSE CXP301.IGV_GRA_NO_DEST * CXP301.CPTCAMPR END),0) IGVGAS, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N') + ' THEN CXP301.ADQ_NO_GRAV     ELSE CXP301.ADQ_NO_GRAV * CXP301.CPTCAMPR END),0) ADQNOGRAV, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N') + ' THEN CXP301.CPISC           ELSE CXP301.CPISC * CXP301.CPTCAMPR END),0) IMPISC, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N') + ' THEN CXP301.CP_OTROS        ELSE CXP301.CP_OTROS * CXP301.CPTCAMPR END),0) '

        // SE RESTAN LOS DESCUENTOS q ya estan en negativo
           +' + NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N')
           +'             THEN NVL(CXP301.CPDCTO,0)*(case when CXP301.CPDCTO>0 then -1 else 1 end)   '
           +'             ELSE NVL(CXP301.CPDCTO,0)*CXP301.CPTCAMPR*(case when CXP301.CPDCTO>0 then -1 else 1 end) END '
           +'        )'
           +'       ,0) IMPOTROS, '

           +'        CXP301.CPMTOLOC IMPTOTAL, '
           +'        0.00 TOTALGRAL, '
           +'        CXP301.CPTCAMPR, '
           +'        sysdate MODFECEMI, '
           +'        '' '' MODDOCID, '
           +'        '' '' MODCPSERIE, '
           +'        '' '' MODCPNODOC, '
           +'        '' '' NUMDOCNODOM, '
           +'        trunc(CXP301.FECDEPDET) FECCONDTR, '
           +'        CXP301.NUMDEPDET NUMCONDTR, '
           +'       (CASE WHEN CXP301.PROVRETIGV = ' + QuotedStr('S') + ' THEN 1 ELSE 0 END) FLGRET,  '
           +'        1 FLGMOD, '
           +'        CXP301.CIAID, CXP301.TDIARID, CXP301.CPNOREG, CXP301.CLAUXID, CXP301.PROV, CXP301.CPCANJE, '
           +'        TO_CHAR(CXP301.CPFEMIS,' + QuotedStr('YYYYMM') + ') PERIODODOC, '
           +'        ''                                                                                                    '' OBS_X_ERROR, '
           +'   TGE201.ESDOMIC '
           +'   FROM CXP301, TGE201 '
           +'  WHERE CXP301.CPANOMES = ' + QuotedStr(FCRegComp.dbeAnoMM.Text)
           +'    AND CXP301.CPESTADO IN (' + QuotedStr('C') + ',' + QuotedStr('P') + ')'
           +'    AND CXP301.TDIARID = ' + QuotedStr('08')
           +'    AND TGE201.CLAUXID = CXP301.CLAUXID '
           +'   AND TGE201.PROV = CXP301.PROV '
           +'  ORDER BY CXP301.CIAID, CXP301.CPNOREG ';
   DMCXP.cdsRegCompra.close;
   DMCXP.cdsRegCompra.DataRequest(xsSql);
   DMCXP.cdsRegCompra.open;
// Fin HPC_201602_CXP

   DMCXP.cdsRegCompra.First;
   while not DMCXP.cdsRegCompra.EOF do
   begin
      DMCXP.cdsRegCompra.Edit;
      DMCXP.cdsRegCompra.FieldByName('MODFECEMI').AsDateTime := 0;

      DMCXP.cdsRegCompra.FieldByName('MODDOCID').AsString := '';
      DMCXP.cdsRegCompra.FieldByName('MODCPSERIE').AsString := '';
      DMCXP.cdsRegCompra.FieldByName('MODCPNODOC').AsString := '';
      DMCXP.cdsRegCompra.FieldByName('NUMDOCNODOM').AsString := '';

      DMCXP.cdsRegCompra.FieldByName('TOTALGRAL').AsFloat := DMCXP.cdsRegCompra.FieldByName('IMPTOTAL').AsFloat
                                                            +DMCXP.cdsRegCompra.FieldByName('IMPOTROS').AsFloat;

      if DMCXP.cdsRegCompra.FieldByName('DOCID').AsString='07' OR DMCXP.cdsRegCompra.FieldByName('DOCID').AsString='87' then
      begin
         DMCXP.cdsRegCompra.FieldByName('BASIMP').AsFloat := DMCXP.cdsRegCompra.FieldByName('BASIMP').AsFloat*-1;
         DMCXP.cdsRegCompra.FieldByName('IGV').AsFloat := DMCXP.cdsRegCompra.FieldByName('IGV').AsFloat*-1;
         DMCXP.cdsRegCompra.FieldByName('BASIMPMIX').AsFloat := DMCXP.cdsRegCompra.FieldByName('BASIMPMIX').AsFloat*-1;
         DMCXP.cdsRegCompra.FieldByName('IGVMIX').AsFloat := DMCXP.cdsRegCompra.FieldByName('IGVMIX').AsFloat*-1;
         DMCXP.cdsRegCompra.FieldByName('BASIMPGAS').AsFloat := DMCXP.cdsRegCompra.FieldByName('BASIMPGAS').AsFloat*-1;
         DMCXP.cdsRegCompra.FieldByName('IGVGAS').AsFloat := DMCXP.cdsRegCompra.FieldByName('IGVGAS').AsFloat*-1;
         DMCXP.cdsRegCompra.FieldByName('ADQNOGRAV').AsFloat := DMCXP.cdsRegCompra.FieldByName('ADQNOGRAV').AsFloat*-1;
         DMCXP.cdsRegCompra.FieldByName('IMPISC').AsFloat := DMCXP.cdsRegCompra.FieldByName('IMPISC').AsFloat*-1;
         DMCXP.cdsRegCompra.FieldByName('IMPOTROS').AsFloat := DMCXP.cdsRegCompra.FieldByName('IMPOTROS').AsFloat*-1;
         DMCXP.cdsRegCompra.FieldByName('IMPTOTAL').AsFloat := DMCXP.cdsRegCompra.FieldByName('IMPTOTAL').AsFloat*-1;
         DMCXP.cdsRegCompra.Post;
      end;
      DMCXP.cdsRegCompra.Next;
   end;

// si no hay error entonces insertamos en la tabla el registro de compras
   DMCXP.cdsRegCompra.First;
   fg_PLEinsertaTabla(DMCXP.cdsRegCompra, wgPeriodo);

   Result := True;
end;

procedure TFRegComprasPLE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMCXP.cdsRegCompra.IndexFieldNames := '';
   Action := caFree;
end;

procedure TFRegComprasPLE.FormShow(Sender: TObject);
Var
   xsSql: String;
   xsProcesar :String;
   xsRuc,xsNombre,xsCarpeta :String;
begin
   bbtnGenExport.Enabled := False;
   xsSQL := 'Select * from CXP_REG_COM where PERIODO='+quotedstr(FCRegComp.dbeAnoMM.Text)+' and ROWNUM=1';
   DMCXP.cdsQry.close;
   DMCXP.cdsQry.DataRequest(xsSQL);
   DMCXP.cdsQry.open;
   xsProcesar := 'NO';
   Screen.Cursor := crDefault;
   if DMCXP.cdsQry.RecordCount > 0 Then
   Begin
      If MessageDlg('Desea Generar Nuevamente el Registro de Compras?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         xsProcesar := 'SI';
   End
   else
      xsProcesar := 'SI';

   If xsProcesar = 'SI' Then
   Begin
      If fg_PLEprocesaRegCompras(FCRegComp.dbeAnoMM.Text) Then
      Begin
         ShowMessage('Datos Generados correctamente');
         bbtnGenExport.Enabled := True;
      End;
   End;

   pr_abre_RegCompPLE;
   dbgRegCompPLE.Selected.Clear;
   dbgRegCompPLE.Selected.Add('PERIODO'#9'8'#9'Periodo'#9'F');
   dbgRegCompPLE.Selected.Add('CORRELATIVO'#9'10'#9'Correlativo'#9'F');
   dbgRegCompPLE.Selected.Add('FECEMI'#9'10'#9'Fecha~Emisión'#9'F');
   dbgRegCompPLE.Selected.Add('FECPAG'#9'10'#9'Fecha~Pago'#9'F');
   dbgRegCompPLE.Selected.Add('DOCID'#9'8'#9'Tipo~Doc'#9'F');
   dbgRegCompPLE.Selected.Add('CPSERIE'#9'8'#9'Serie'#9'F');
   dbgRegCompPLE.Selected.Add('ANIO'#9'8'#9'Año'#9'F');
   dbgRegCompPLE.Selected.Add('CPNODOC'#9'15'#9'Número~Documento'#9'F');

   dbgRegCompPLE.Selected.Add('ADQNOGRAV'#9'10'#9'Adquis~No Gravadas'#9'F');
   dbgRegCompPLE.Selected.Add('BASIMPGAS'#9'10'#9'Adq.Gravadas~p/Oper No Grav'#9'F');
   dbgRegCompPLE.Selected.Add('IGVGAS'#9'10'#9'IGV Gasto'#9'F');

   dbgRegCompPLE.Selected.Add('BASIMPMIX'#9'10'#9'B.Imp. Mixta'#9'F');
   dbgRegCompPLE.Selected.Add('IGVMIX'#9'10'#9'IGV Mixto'#9'F');

   dbgRegCompPLE.Selected.Add('BASIMP'#9'10'#9'Gravado'#9'F');
   dbgRegCompPLE.Selected.Add('IGV'#9'10'#9'IGV Gravado'#9'F');

   dbgRegCompPLE.Selected.Add('IMPOTROS'#9'10'#9'Otros Cargos'#9'F');
   dbgRegCompPLE.Selected.Add('IMPTOTAL'#9'10'#9'TOTAL'#9'F');

   dbgRegCompPLE.Selected.Add('IMPOPEDIA'#9'10'#9'Imp.Operat~Diario'#9'F');
   dbgRegCompPLE.Selected.Add('PROVDOCID'#9'8'#9'Tipo Doc.~Proveedor'#9'F');
   dbgRegCompPLE.Selected.Add('PROVDOCNUM'#9'12'#9'Nro.Doc~Proveedor'#9'F');
   dbgRegCompPLE.Selected.Add('PROVRAZSOC'#9'40'#9'Razón Social'#9'F');
   dbgRegCompPLE.Selected.Add('IMPISC'#9'10'#9'ISC'#9'F');
   dbgRegCompPLE.Selected.Add('CPTCAMPR'#9'10'#9'T.Cambio'#9'F');
   dbgRegCompPLE.Selected.Add('MODFECEMI'#9'10'#9'Fecha Emisión~Mod'#9'F');
   dbgRegCompPLE.Selected.Add('MODDOCID'#9'10'#9'Nro.Doc~Mod'#9'F');
   dbgRegCompPLE.Selected.Add('MODCPSERIE'#9'10'#9'Serie~Mod'#9'F');
   dbgRegCompPLE.Selected.Add('MODCPNODOC'#9'10'#9'Nro.Doc~Mod'#9'F');
   dbgRegCompPLE.Selected.Add('NUMDOCNODOM'#9'10'#9'Nro.Doc~No domiciliado'#9'F');
   dbgRegCompPLE.Selected.Add('FECCONDTR'#9'10'#9'Fecha Detracción'#9'F');
   dbgRegCompPLE.Selected.Add('NUMCONDTR'#9'10'#9'Nro.Comp~Detracción'#9'F');
   dbgRegCompPLE.Selected.Add('FLGRET'#9'10'#9'Indica~Retención'#9'F');
   dbgRegCompPLE.Selected.Add('FLGMOD'#9'10'#9'Indica~Modificación'#9'F');
   dbgRegCompPLE.Selected.Add('CIAID'#9'8'#9'Compañía'#9'F');
   dbgRegCompPLE.Selected.Add('TDIARID'#9'6'#9'TDiario'#9'F');
   dbgRegCompPLE.Selected.Add('CPNOREG'#9'13'#9'NºRegistro'#9'F');
   dbgRegCompPLE.Selected.Add('CLAUXID'#9'8'#9'Clase~Auxiliar'#9'F');
   dbgRegCompPLE.Selected.Add('PROV'#9'10'#9'Código~Proveedor'#9'F');
   dbgRegCompPLE.Selected.Add('CPCANJE'#9'8'#9'NºCanje'#9'F');
   dbgRegCompPLE.Selected.Add('OBS_X_ERROR'#9'20'#9'Observac~x Error'#9'F');
   dbgRegCompPLE.dataSource := DMCXP.dsRegCompra;
end;

procedure TFRegComprasPLE.pr_abre_RegCompPLE;
begin
   xsSql := ' SELECT CXP_REG_COM.PERIODO, '
           +'        LPAD(CXP_REG_COM.CORRELATIVO,10,' + QuotedStr('0') + ') CORRELATIVO, '
           +'        CXP_REG_COM.FECEMI, '
           +'        CXP_REG_COM.FECPAG, '
           +'        CXP_REG_COM.DOCID,'
           +'        CXP_REG_COM.CPSERIE, '
           +'        CXP_REG_COM.ANIO, '
           +'        CXP_REG_COM.CPNODOC, '
           +'        CXP_REG_COM.IMPOPEDIA, '
           +'        CXP_REG_COM.PROVDOCID, '
           +'        CXP_REG_COM.PROVDOCNUM, '
           +'        CXP_REG_COM.PROVRAZSOC, '
           +'        CXP_REG_COM.BASIMP, '
           +'        CXP_REG_COM.IGV, '
           +'        CXP_REG_COM.BASIMPMIX, '
           +'        CXP_REG_COM.IGVMIX, '
           +'        CXP_REG_COM.BASIMPGAS, '
           +'        CXP_REG_COM.IGVGAS, '
           +'        CXP_REG_COM.ADQNOGRAV, '
           +'        CXP_REG_COM.IMPISC, '
           +'        CXP_REG_COM.IMPOTROS, '
           +'        CXP_REG_COM.IMPTOTAL, '
           +'        CXP_REG_COM.CPTCAMPR, '
           +'        CXP_REG_COM.MODFECEMI, '
           +'        CXP_REG_COM.MODDOCID, '
           +'        CXP_REG_COM.MODCPSERIE, '
           +'        CXP_REG_COM.MODCPNODOC, '
           +'        CXP_REG_COM.NUMDOCNODOM, '
           +'        CXP_REG_COM.FECCONDTR, '
           +'        CXP_REG_COM.NUMCONDTR, '
           +'        CXP_REG_COM.FLGRET,  '
           +'        CXP_REG_COM.FLGMOD, '
           +'        CXP_REG_COM.CIAID, '
           +'        TGE101.CIADES, '
           +'        CXP_REG_COM.TDIARID, '
           +'        CXP_REG_COM.CPNOREG, '
           +'        CXP_REG_COM.CLAUXID, '
           +'        CXP_REG_COM.PROV, '
           +'        CXP_REG_COM.CPCANJE, '
           +'        ''      '' PERIODODOC, '
           +'        ''                                                                                                    '' OBS_X_ERROR '
           +'   FROM CXP_REG_COM, TGE101 '
           +'  WHERE CXP_REG_COM.PERIODO = ' + QuotedStr(FCRegComp.dbeAnoMM.Text)
           +'    AND TGE101.CIAID = CXP_REG_COM.CIAID '
           +'  ORDER BY CORRELATIVO ';
   DMCXP.cdsRegCompra.close;
   DMCXP.cdsRegCompra.DataRequest(xsSQL);
   DMCXP.cdsRegCompra.open;
   DMCXP.cdsRegCompra.IndexFieldNames:='CORRELATIVO';

   DMCXP.cdsRegCompra.First;
end;

procedure TFRegComprasPLE.bbtnGenExportClick(Sender: TObject);
var
   xsRuc, xsNombre, xsCarpeta :String;
begin
   xsRuc := BuscaQry('dspTGE', 'TGE101', 'CIARUC', 'CIAID = ' + QuotedStr('01'), 'CIARUC');
   xsNombre := 'LE' + xsRuc + FCRegComp.dbeAnoMM.Text + '00' + '080100' + '00' + '1' + '1' + '1' + '1' + '.txt';
   If SelectDirectory('Selecciona una Carpeta', '', xsCarpeta) Then
   Begin
      If Copy(xsCarpeta, Length(xsCarpeta), 1) <> '\' Then
      Begin
         xsCarpeta := xsCarpeta + '\';
      End;
   // Inicio HPC_201602_CXP
   // Diferencia formato de Exportación
      if rgtam.itemindex =0 then
      begin
         fg_PLEexportarFormato(FCRegComp.dbeAnoMM.Text, xsCarpeta +xsNombre);
      end
      else
      begin
         xsNombre := 'LE' + xsRuc + FCRegComp.dbeAnoMM.Text + '00' + '080200' + '00' + '1' + '1' + '1' + '1' + '.txt';
         fg_PLEexportarFormatoNoDom(FCRegComp.dbeAnoMM.Text, xsCarpeta +xsNombre);
      end;
   // Fin HPC_201602_CXP
   End;
end;

function TFRegComprasPLE.fg_PLEvalidaDatos : Boolean;
Var
   xsPeriodo: String;
   xsCorrelativo: String;
   xdFecEmi: String;
   xdFecPag: String;
   xsDocId: String;
   xsSerie: String;
   xsAnio: String;
   xsNoDoc: String;
   xsImpOpeDia: String;
   xsProvDocId: String;
   xsProvDocNum: String;
   xsProvRazSoc: String;
   xsBasImp: String;
   xsIgv: String;
   xsBasImpMixto: String;
   xsIgvMixto: String;
   xsBasImpGas: String;
   xsIgvGas: String;
   xsAdqNoGrav: String;
   xsImpIsc: String;
   xsImpOtros: String;
   xsImpTotal: String;
   xsTipoCambio: String;
   xsModFecEmi: String;
   xsModDocId: String;
   xsModSerie: String;
   xsModNoDoc: String;
   xsNumDocNoDom: String;
   xsFecDetraccion: String;
   xsNumDetraccion: String;
   xsFlgRet: String;
   xsFlgMod: String;
   xsMensaje : String;
   xsNumero : Integer;
Begin
// validamos los datos usando el mismo clientdataset (cdsRegCompra)
   xsMensaje := '';

// 1.valida periodo informado
   xsPeriodo := DMCXP.cdsRegCompra.FieldByName('PERIODO').AsString;

// 2.valida correlativo
   xsCorrelativo := DMCXP.cdsRegCompra.FieldByName('CORRELATIVO').AsString;

// 3.valida Fecha emision documento
   xdFecEmi := DMCXP.cdsRegCompra.FieldByName('FECEMI').AsString;
   If Length(xdFecEmi) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [3] Fecha de emisión incorrecto';
   End;

// 4.valida Fecha de Vencim o pago
   xdFecPag := DMCXP.cdsRegCompra.FieldByName('FECPAG').AsString;

// 5.valida Tipo de comprobante de pago
   xsDocId := DMCXP.cdsRegCompra.FieldByName('DOCID').AsString;
   If Length(xsDocId) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [5] Tipo de Comprobante incorrecto' + #13;
   End;

// 6.valida Serie
   xsSerie := DMCXP.cdsRegCompra.FieldByName('CPSERIE').AsString;
   If Length(xsSerie) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [6] Número de Serie incorrecto' + #13;
   End;

// 7.valida año
   xsAnio := DMCXP.cdsRegCompra.FieldByName('ANIO').AsString;

// Inicio HPC_201602_CXP
// Se cambia validación de Número de Serie para Notas de Crédito
// debido a la inclusión de Facturas Electrónicas
// 8.valida número de documento
   xsNoDoc := DMCXP.cdsRegCompra.FieldByName('CPNODOC').AsString;
   If Length(xsNoDoc) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [7] Número de comprobante incorrecto' + #13;
   End;

   If Length(xsSerie) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [8] Número de Serie incorrecto' + #13;
   End;

{
   If (xsDocId = '07')  then
   Begin
      Try
         result := True;
         xsNumero:= strtoint(xsSerie);
      Except
         result := false;
      End;
      If result = false then
      Begin
            If (COPY(xsSerie,1,1) = 'E') OR (COPY(xsSerie,1,1) = 'F') Then
            Begin

            End
            Else
            Begin
               xsMensaje := xsMensaje + ' [8] Si es electrónico la serie debe ser E001 o FXXX(donde X es alfanumérico)' + #13;
            End;
      End;
   End;
}
// Fin HPC_201602_CXP

// 9.valida importe por operaciones registradas consolidadas por dia
   xsImpOpeDia := DMCXP.cdsRegCompra.FieldByName('IMPOPEDIA').AsString;
   If Length(xsImpOpeDia) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [9] Debe tener un valor' + #13;
   End;

// 10.valida tipo de documento de identidad de proveedor
   if length(DMCXP.cdsRegCompra.FieldByName('PROVDOCID').AsString)=0 then
   Begin
      xsMensaje := xsMensaje + ' [10] Debe tener Tipo de Doc.Identidad' + #13;
   End;

// 11.valida RUC o DNI
   xsProvDocNum := DMCXP.cdsRegCompra.FieldByName('PROVDOCNUM').AsString;
   if (length(DMCXP.cdsRegCompra.FieldByName('PROVDOCID').AsString)>0) then
   Begin
      if DMCXP.cdsRegCompra.FieldByName('PROVDOCID').AsString='1' then
      begin
         if length(DMCXP.cdsRegCompra.FieldByName('PROVDOCNUM').AsString)<>8 then
            xsMensaje := xsMensaje + ' [11] Longitud Nro.Doc.Identidad Errado' + #13;
      end;
      if DMCXP.cdsRegCompra.FieldByName('PROVDOCID').AsString='6' then
      begin
         if length(DMCXP.cdsRegCompra.FieldByName('PROVDOCNUM').AsString)<>11 then
            xsMensaje := xsMensaje + ' [11] Longitud RUC Errado' + #13
         else
            if (copy(DMCXP.cdsRegCompra.FieldByName('PROVDOCNUM').AsString,1,2)<>'20') and
               (copy(DMCXP.cdsRegCompra.FieldByName('PROVDOCNUM').AsString,1,1)<>'1') then
               xsMensaje := xsMensaje + ' [11] Nro.RUC Errado' + #13;
      end;
   End;

// 12.valida Razón social
   xsProvRazSoc := DMCXP.cdsRegCompra.FieldByName('PROVRAZSOC').AsString;
   If Length(xsProvRazSoc) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [12] Debe tener Razón social' + #13;
   End;

// 13.valida Base imponible
   xsBasImp := DMCXP.cdsRegCompra.FieldByName('BASIMP').AsString;
   If Length(xsBasImp) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [13] Base imponible incorrecto' + #13;
   End;

// 14.valida Igv
   xsIgv := DMCXP.cdsRegCompra.FieldByName('IGV').AsString;
   If Length(xsIgv) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [14] Igv Incorrecto' + #13;
   End;

// 15.valida Base Imponible Mixto
   xsBasImpMixto := DMCXP.cdsRegCompra.FieldByName('BASIMPMIX').AsString;
   If Length(xsBasImpMixto) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [15] Base Imponible Mixto Incorrecto' + #13;
   End;

// 16.valida Igv Mixto
   xsIgvMixto := DMCXP.cdsRegCompra.FieldByName('IGVMIX').AsString;
   If Length(xsBasImpMixto) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [16] Igv Mixto Incorrecto' + #13;
   End;

// 17.valida Base imponible gasto
   xsBasImpGas := DMCXP.cdsRegCompra.FieldByName('BASIMPGAS').AsString;
   If Length(xsBasImpGas) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [17] Base Imponible Gasto Incorrecto' + #13;
   End;

// 18.valida IGV Gasto
   xsIgvGas := DMCXP.cdsRegCompra.FieldByName('IGVGAS').AsString;
   If Length(xsIgvGas) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [18] IGV Gasto Incorrecto' + #13;
   End;

// 19.valida Adquisiciones no gravadas
   xsAdqNoGrav := DMCXP.cdsRegCompra.FieldByName('ADQNOGRAV').AsString;
   If Length(xsAdqNoGrav) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [19] Adquisiciones No Gravadas Incorrecto' + #13;
   End;

// 20.valida Impuesto selectivo al consumo
   xsImpIsc := DMCXP.cdsRegCompra.FieldByName('IMPISC').AsString;
   If Length(xsImpIsc) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [20] ISC Incorrecto' + #13;
   End;

// 21.valida Otros impuestos
   xsImpOtros := DMCXP.cdsRegCompra.FieldByName('IMPOTROS').AsString;
   If Length(xsImpOtros) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [21] Otros Impuestos Incorrecto' + #13;
   End;

// 22.valida importe total
   xsImpTotal := DMCXP.cdsRegCompra.FieldByName('IMPTOTAL').AsString;
   If Length(xsImpOtros) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [22] Total Incorrecto' + #13;
   End;

// 23.valida Tipo de cambio
   xsTipoCambio := DMCXP.cdsRegCompra.FieldByName('CPTCAMPR').AsString;
   If Length(xsTipoCambio) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [23] Tipo de Cambio Incorrecto' + #13;
   End;

// 24.valida Fecha de emisión de constancia de detracción
   xsFecDetraccion := DMCXP.cdsRegCompra.FieldByName('FECCONDTR').AsString;

// 25.valida Número de comprobante de detracción
   xsNumDetraccion := DMCXP.cdsRegCompra.FieldByName('NUMCONDTR').AsString;

// 26.valida Flag si existe retención
   xsFlgRet := DMCXP.cdsRegCompra.FieldByName('FLGRET').AsString;
   If Length(xsFlgRet) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [31] Flag que indica si hay retención o no' + #13;
   End;

// 27.valida Estado que identifica la oportunidad de la anotación
   xsFlgMod := DMCXP.cdsRegCompra.FieldByName('FLGMOD').AsString;
   If Length(xsFlgMod) = 0 Then
   Begin
      xsMensaje := xsMensaje + ' [32] Flag de Oportunidad del registro' + #13;
   End;

   Result := True;
   if length(xsMensaje)>0 then
   begin
      xsMensaje := 'T.Doc:'+xsDocId+' Serie:'+xsSerie+' No.Doc.'+xsNoDoc + chr(13)+ xsMensaje;
      ShowMessage(xsMensaje);
      {
      DMCXP.cdsRegCompra.Insert;
      DMCXP.cdsRegCompra.FieldByName('OBS_X_ERROR').AsString := copy(xsMensaje,1,100);
      DMCXP.cdsRegCompra.Post;
      }
      Result := False;
   end;
end;

procedure TFRegComprasPLE.bbtnValidaClick(Sender: TObject);
Var
   xsSql: String;
   xTieneErrores: Boolean;
Begin
   bbtnGenExport.Enabled := False;
   xTieneErrores := False;
   DMCXP.cdsRegCompra.First;
   while not DMCXP.cdsRegCompra.EOF do
   begin
      if not fg_PLEvalidaDatos then xTieneErrores := True;
      if xTieneErrores then
         break;
      DMCXP.cdsRegCompra.Next;
   end;
   if xTieneErrores then
   Begin
      ShowMessage('Los datos no se han validado correctamente');
      Exit;
   End;
// si no hay error entonces insertamos en la tabla el registro de compras
   DMCXP.cdsRegCompra.First;
   bbtnGenExport.Enabled := True;
end;

procedure TFRegComprasPLE.dbgRegCompPLETitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   DMCXP.cdsRegCompra.IndexFieldNames := AFieldName;
end;

procedure TFRegComprasPLE.bbtnResumenxCiaClick(Sender: TObject);
begin
   DMCXP.cdsRegCompra.DisableControls;
   DMCXP.cdsRegCompra.IndexfieldNames:='CORRELATIVO';
   ppdbRegCompPLE.DataSource := DMCXP.dsRegCompra;
   pprRegCompPLE.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RegCompPLE_Resumen.rtm';
   pprRegCompPLE.Template.LoadFromFile;
   If cbDiseno.Checked Then
   Begin
      ppDesigner1.Report := pprRegCompPLE;
      ppDesigner1.ShowModal;
   End
   Else
   Begin
      pprRegCompPLE.Print;
      pprRegCompPLE.Stop;
   End;
   pprRegCompPLE.DataPipeline := Nil;
   ppdbRegCompPLE.DataSource := Nil;
   DMCXP.cdsRegCompra.EnableControls;
end;

procedure TFRegComprasPLE.btnExportarExcelClick(Sender: TObject);
begin
   Try
      Screen.Cursor := crHourGlass;

      dbgExporta.datasource := DMCXP.dsRegCompra;
      DMCXP.HojaExcel('RegistroCompras', DMCXP.dsRegCompra, dbgExporta);
      Screen.Cursor := crDefault;
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;
end;

procedure TFRegComprasPLE.bbtnDuplicaClick(Sender: TObject);
var
   xCorrelativo, xsProvDocId, xsModFecEmi, xsFecDetraccion : String;
begin
   Screen.Cursor := crHourglass;
   xsSQL := 'select case when cast(max(CORRELATIVO) as integer)+1<10 then ''000000''||cast(cast(max(CORRELATIVO) as integer)+1 as varchar2(7)) '
           +'            when cast(max(CORRELATIVO) as integer)+1<100 then ''00000''||cast(cast(max(CORRELATIVO) as integer)+1 as varchar2(7)) '
           +'            when cast(max(CORRELATIVO) as integer)+1<1000 then ''0000''||cast(cast(max(CORRELATIVO) as integer)+1 as varchar2(7)) '
           +'            when cast(max(CORRELATIVO) as integer)+1<10000 then ''000''||cast(cast(max(CORRELATIVO) as integer)+1 as varchar2(7)) '
           +'            when cast(max(CORRELATIVO) as integer)+1<100000 then ''00''||cast(cast(max(CORRELATIVO) as integer)+1 as varchar2(7)) '
           +'            when cast(max(CORRELATIVO) as integer)+1<1000000 then ''0''||cast(cast(max(CORRELATIVO) as integer)+1 as varchar2(7)) '
           +'            else cast(cast(max(CORRELATIVO) as integer)+1 as varchar2(7)) '
           +'       end CORRELATIVO '
           +'  from CXP_REG_COM '
           +' where PERIODO='+quotedstr(DMCXP.cdsRegCompra.FieldByName('PERIODO').AsString);
// define Nro Correlativo
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xsSQL);
   DMCXP.cdsQry.Open;
   xCorrelativo := DMCXP.cdsQry.FieldByName('CORRELATIVO').AsString;

   xsProvDocId := fg_PLEobtieneTdocProv(DMCXP.cdsRegCompra.FieldByName('CLAUXID').AsString,
                                        DMCXP.cdsRegCompra.FieldByName('PROV').AsString,
                                        DMCXP.cdsRegCompra.FieldByName('PROVDOCNUM').AsString);
   If Length(xsProvDocId) = 0 Then
   Begin
      xsProvDocId := '0';
   End;

   xsModFecEmi := DMCXP.cdsRegCompra.FieldByName('MODFECEMI').AsString;
   If Length(xsModFecEmi) = 0 Then xsModFecEmi := '01/01/0001';

   xsFecDetraccion := DMCXP.cdsRegCompra.FieldByName('FECCONDTR').AsString;
   If Length(xsFecDetraccion) = 0 Then xsFecDetraccion := '01/01/0001';

// añade registro duplicado
   xsSQL := ' Insert into CXP_REG_COM (PERIODO, CORRELATIVO, FECEMI, FECPAG, DOCID, CPSERIE, ANIO, '
          + '                          CPNODOC, IMPOPEDIA, PROVDOCID, PROVDOCNUM, PROVRAZSOC, BASIMP, '
          + '                          IGV, BASIMPMIX, IGVMIX, BASIMPGAS, IGVGAS, ADQNOGRAV, IMPISC, '
          + '                          IMPOTROS, IMPTOTAL, CPTCAMPR, MODFECEMI, MODDOCID, MODCPSERIE, '
          + '                          MODCPNODOC, NUMDOCNODOM, FECCONDTR, NUMCONDTR, FLGRET, FLGMOD, '
          + '                          CIAID, TDIARID, CPNOREG, CLAUXID, PROV) '
          + ' Values ('+ QuotedStr(DMCXP.cdsRegCompra.FieldByName('PERIODO').AsString)+', '
                       + QuotedStr(xCorrelativo)+', '
                       + quotedstr(datetostr(DMCXP.cdsRegCompra.FieldByName('FECEMI').AsDateTime))+', '
                       + quotedstr(datetostr(DMCXP.cdsRegCompra.FieldByName('FECPAG').AsDateTime))+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('DOCID').AsString)+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('CPSERIE').AsString)+', '
                       + DMCXP.cdsRegCompra.FieldByName('ANIO').AsString + ', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('CPNODOC').AsString)+', '
                       + DMCXP.cdsRegCompra.FieldByName('IMPOPEDIA').AsString+', '
                       + QuotedStr(xsProvDocId)+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('PROVDOCNUM').AsString)+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('PROVRAZSOC').AsString)+', '
                       + DMCXP.cdsRegCompra.FieldByName('BASIMP').AsString+', '
                       + DMCXP.cdsRegCompra.FieldByName('IGV').AsString+', '
                       + DMCXP.cdsRegCompra.FieldByName('BASIMPMIX').AsString+', '
                       + DMCXP.cdsRegCompra.FieldByName('IGVMIX').AsString+', '
                       + DMCXP.cdsRegCompra.FieldByName('BASIMPGAS').AsString+', '
                       + DMCXP.cdsRegCompra.FieldByName('IGVGAS').AsString+', '
                       + DMCXP.cdsRegCompra.FieldByName('ADQNOGRAV').AsString+', '
                       + DMCXP.cdsRegCompra.FieldByName('IMPISC').AsString+', '
                       + DMCXP.cdsRegCompra.FieldByName('IMPOTROS').AsString+', '
                       + DMCXP.cdsRegCompra.FieldByName('IMPTOTAL').AsString+', '
                       + DMCXP.cdsRegCompra.FieldByName('CPTCAMPR').AsString+', '
                       + quotedstr(xsModFecEmi)+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('MODDOCID').AsString)+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('MODCPSERIE').AsString)+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('MODCPNODOC').AsString)+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('NUMDOCNODOM').AsString)+', '
                       + QuotedStr(xsFecDetraccion)+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('NUMCONDTR').AsString)+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('FLGRET').AsString)+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('FLGMOD').AsString)+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('CIAID').AsString)+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('TDIARID').AsString)+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('CPNOREG').AsString)+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('CLAUXID').AsString)+', '
                       + QuotedStr(DMCXP.cdsRegCompra.FieldByName('PROV').AsString)+') ';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xsSQL);
   DMCXP.cdsRegCompra.EnableControls;
   pr_abre_RegCompPLE;
   DMCXP.cdsRegCompra.EnableControls;
   DMCXP.cdsRegCompra.Last;
   Screen.Cursor := crDefault;
   ShowMessage('Registro ha sido duplicado con el número '+xCorrelativo);
end;

procedure TFRegComprasPLE.dbgRegCompPLEDblClick(Sender: TObject);
begin
{   try
      FMantRegCompPLE_xReg := TFMantRegCompPLE_xReg.Create( Application );
      FMantRegCompPLE_xReg.ShowModal;
   finally
      FMantRegCompPLE_xReg.Free;
   end;
   pr_abre_RegCompPLE;
}
end;

procedure TFRegComprasPLE.dbgRegCompPLEIButtonClick(Sender: TObject);
var
   xCorrelativo : String;
begin
{
}
end;

procedure TFRegComprasPLE.bbtnRenumeraClick(Sender: TObject);
var
   xCorrelativo1 : integer;
   xcorrelativo2 : String;
begin
   xCorrelativo1 := 2109;
   DMCXP.cdsRegCompra.Last;
   while xCorrelativo1>192 do
   begin
      xCorrelativo2:= strzero(inttostr(xCorrelativo1+1),7);
      xsSQL := 'update CXP_REG_COM '
             +'   set CORRELATIVO='+quotedstr(xCorrelativo2)
             +' where PERIODO='+quotedstr('201303')
             +'   and CORRELATIVO='+quotedstr(strzero(inttostr(xCorrelativo1),7));
      DMCXP.DCOM1.AppServer.EjecutaSQL(xsSql);
      xCorrelativo1 := xCorrelativo1-1;
      DMCXP.cdsRegCompra.Prior;
   end;
end;

procedure TFRegComprasPLE.BitBtn1Click(Sender: TObject);
var
   xSQL : String;
begin
// Compara Registros generados para el PLE (CXP_REG_COM) vs Cabecera de Provisiones (CXP301) vs Detalle de Provisiones (CXP302)
(*
   xSQL := 'select A.CPNOREG, B.TMONID, B.CPTCAMPR, B.DOCID,
    -- Base Imponible con Crédito Fiscal al 100%
       DET_CPGRAVAD,
       (case when B.DOCID='07' then -1 else 1 end)*(case when B.TMONID='N' then CPGRAVAD else round(CPGRAVAD*B.CPTCAMPR,2) end) CPGRAVAD,
       BASIMP PLE_BASIMP,
    -- IGV  de Base Imponible con Crédito Fiscal al 100%
       DET_CPIGV,
       (case when B.DOCID='07' then -1 else 1 end)*
       (case when B.TMONID='N' then CPIGV else round(CPIGV*B.CPTCAMPR,2) end) CPIGV,
       IGV PLE_IGV,
    -- Base Imponible con Crédito Fiscal Mixto
       DET_CPGRAVAD2,
       (case when B.DOCID='07' then -1 else 1 end)*
       (case when B.TMONID='N' then CPGRAVAD2 else round(CPGRAVAD2*B.CPTCAMPR,2) end) CPGRAVAD2,
       BASIMPMIX PLE_BASIMP_MIX,
    -- IGV de Base Imponible con Crédito Fiscal Mixto
       DET_CPIGV2,
       (case when B.DOCID='07' then -1 else 1 end)*
       (case when B.TMONID='N' then CPIGV2 else round(CPIGV2*B.CPTCAMPR,2) end) CPIGV2,
       IGVMIX PLE_IGVMIX,
    -- Base Imponible No Gravada
       DET_CPNOGRAV,
       (case when B.DOCID='07' then -1 else 1 end)*
       (case when B.TMONID='N' then CPNOGRAV else round(CPNOGRAV*B.CPTCAMPR,2) end) CPNOGRAV,
    -- IGV por Gravadas de No Destino
       DET_IGV_GRA_NO_DEST,
       (case when B.DOCID='07' then -1 else 1 end)*
       (case when B.TMONID='N' then IGV_GRA_NO_DEST else round(IGV_GRA_NO_DEST*B.CPTCAMPR,2) end) IGV_GRA_NO_DEST,
    -- Adquisiciones No Gravadas   
       DET_ADQ_NO_GRAV,
       (case when B.DOCID='07' then -1 else 1 end)*
       (case when B.TMONID='N' then ADQ_NO_GRAV else round(ADQ_NO_GRAV*B.CPTCAMPR,2) end) ADQ_NO_GRAV,
       ADQNOGRAV PLE_ADQNOGRAV,
    -- Otros Cargos   
       DET_CP_OTROS,
       (case when B.DOCID='07' then -1 else 1 end)*
       (case when B.TMONID='N' then CP_OTROS else round(CP_OTROS*B.CPTCAMPR,2) end) CP_OTROS,
    -- Descuentos
       DET_CPDCTO,
       (case when B.DOCID='07' then -1 else 1 end)*
       (case when B.TMONID='N' then CPDCTO else round(CPDCTO*B.CPTCAMPR,2) end) CPDCTO,
    -- Servicios
       DET_CPSERVIC,
       (case when B.DOCID='07' then -1 else 1 end)*
       (case when B.TMONID='N' then CPSERVIC else round(CPSERVIC*B.CPTCAMPR,2) end) CPSERVIC,
       IMPOTROS PLE_OTROS,
    -- Monto Total Original
       DET_CPMTOORI,
       (case when B.DOCID='07' then -1 else 1 end)*
       (case when B.TMONID='N' then CPMTOORI else round(CPMTOORI*B.CPTCAMPR,2) end) CPMTOORI,       
    -- Monto Total en Moneda Local
       DET_CPMTOLOC,
       CPMTOLOC,
       IMPTOTAL PLE_IMPTOTAL,
    -- Monto Moneda Extranjera   
       DET_CPMTOEXT,
       CPMTOEXT,
    -- ISC   
       DET_CPISC,
       (case when B.DOCID='07' then -1 else 1 end)*
       (case when B.TMONID='N' then CPISC else round(CPISC*B.CPTCAMPR,2) end) CPISC,
    -- Renta 4ta   
       DET_CP4TA--,
--       CP4TA
from (
select A.CIAID, A.TDIARID, A.DCPANOMM, A.CPNOREG,
   sum(CASE WHEN TIPDET='MG'                 THEN DCPMOLOC * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) DET_CPGRAVAD,
   sum(CASE WHEN TIPDET='I1' AND TREGID='03' THEN DCPMOLOC * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) DET_CPIGV,
   sum(CASE WHEN TIPDET='NG'                 THEN DCPMOLOC * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) DET_CPGRAVAD2,
   sum(CASE WHEN TIPDET='I3'                 THEN DCPMOLOC * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) DET_CPIGV2,
   sum(CASE WHEN TIPDET='MN'                 THEN DCPMOLOC * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) DET_CPNOGRAV,
   sum(CASE WHEN TIPDET='I2'                 THEN DCPMOLOC * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) DET_IGV_GRA_NO_DEST,
   sum(CASE WHEN TIPDET='AN'                 THEN DCPMOLOC * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) DET_ADQ_NO_GRAV,
   sum(CASE WHEN TIPDET='OT'                 THEN DCPMOLOC * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) DET_CP_OTROS,
   sum(CASE WHEN TIPDET='DC'                 THEN DCPMOLOC * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) DET_CPDCTO,
   sum(CASE WHEN TIPDET='SV'                 THEN DCPMOLOC * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) DET_CPSERVIC,
   sum(CASE WHEN TIPDET='TO' or TIPDET='I4'  THEN DCPMOLOC * CASE WHEN DCPDH='D' THEN -1 ELSE 1 END ELSE 0 END) DET_CPMTOORI,
   sum(CASE WHEN TIPDET='TO' or TIPDET='I4'  THEN DCPMOLOC * CASE WHEN DCPDH='D' THEN -1 ELSE 1 END ELSE 0 END) DET_CPMTOLOC,
   sum(CASE WHEN TIPDET='TO' or TIPDET='I4'  THEN DCPMOEXT * CASE WHEN DCPDH='D' THEN -1 ELSE 1 END ELSE 0 END) DET_CPMTOEXT,
   sum(CASE WHEN TIPDET='I2'                 THEN DCPMOLOC * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) DET_CPISC,
   sum(CASE WHEN TIPDET='I1' AND TREGID='12' THEN DCPMOLOC * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) DET_CP4TA
from CXP302@dbprodlee A, CXP301@dbprodlee B
 where A.CIAID='13' and A.TDIARID='08' and A.DCPANOMM='201310'
   and B.CIAID=A.CIAID and B.TDIARID=A.TDIARID and B.CPANOMES=A.DCPANOMM and B.CPNOREG=A.CPNOREG
   and (B.CPESTADO='P' OR B.CPESTADO='C' OR B.CPESTADO='A')
 group by A.CIAID, A.TDIARID, A.DCPANOMM, A.CPNOREG
  ) A, CXP301@dbprodlee B, CXP_REG_COM@dbprodlee C
 where A.CIAID='13' and A.TDIARID='08' and A.DCPANOMM='201310'
   and B.CIAID=A.CIAID and B.TDIARID=A.TDIARID and B.CPANOMES=A.DCPANOMM and B.CPNOREG=A.CPNOREG
   and (B.CPESTADO='P' OR B.CPESTADO='C' OR B.CPESTADO='A')
   and C.CIAID(+)='13' and C.PERIODO(+)='201310' and C.CPNOREG(+)=A.CPNOREG
*)
end;

procedure TFRegComprasPLE.BitBtn2Click(Sender: TObject);
begin
(*
select CIAID, TDIARID, CPANOMES, CPNOREG,
       sum(CPGRAVAD) CPGRAVAD,
       sum(CPIGV) CPIGV,
       sum(CPGRAVAD2) CPGRAVAD2,
       sum(CPIGV2) CPIGV2,
       sum(CPNOGRAV) CPNOGRAV,
       sum(IGV_GRA_NO_DEST) IGV_GRA_NO_DEST,
       sum(ADQ_NO_GRAV) ADQ_NO_GRAV,
       sum(CP_OTROS) CP_OTROS,
       sum(CPDCTO) CPDCTO,
       sum(CPSERVIC) CPSERVIC,
       sum(CPMTOORI) CPMTOORI,
       sum(CPMTOLOC) CPMTOLOC,
       sum(CPMTOEXT) CPMTOEXT,
       sum(CPISC) CPISC,
       sum(CP4TA) CP4TA,
       sum(CPNODOM) CPNODOM,
       sum(CP2TA) CP2TA
  from (       
Select 'CXP301' ORIGEN, CIAID, TDIARID, CPANOMES, CPNOREG,
       case when DOCID='07' then CPGRAVAD else -CPGRAVAD end CPGRAVAD,
       case when DOCID='07' then CPIGV else -CPIGV end CPIGV,
       case when DOCID='07' then CPGRAVAD2 else -CPGRAVAD2 end CPGRAVAD2,
       case when DOCID='07' then CPIGV2 else -CPIGV2 end CPIGV2,
       case when DOCID='07' then CPNOGRAV else -CPNOGRAV end CPNOGRAV,
       case when DOCID='07' then IGV_GRA_NO_DEST else -IGV_GRA_NO_DEST end IGV_GRA_NO_DEST,
       case when DOCID='07' then ADQ_NO_GRAV else -ADQ_NO_GRAV end ADQ_NO_GRAV,
       case when DOCID='07' then CP_OTROS else -CP_OTROS end CP_OTROS,
       case when DOCID='07' then CPDCTO else -CPDCTO end CPDCTO,
       case when DOCID='07' then CPSERVIC else -CPSERVIC end CPSERVIC,
       case when DOCID='07' then CPMTOORI else -CPMTOORI end CPMTOORI,
       case when DOCID='07' then CPMTOLOC else -CPMTOLOC end CPMTOLOC,
       case when DOCID='07' then CPMTOEXT else -CPMTOEXT end CPMTOEXT,
       case when DOCID='07' then CPISC else -CPISC end CPISC,
       0.00 CP4TA,
       0.00 CPNODOM,
       0.00 CP2TA
  FROM CXP301--@dbprodlee
         where CIAID='10' and TDIARID='08' and CPANOMES='201404' and CPESTADO not in ('A','I','E')
union all
Select 'CXP302' ORIGEN, CIAID, TDIARID, DCPANOMM CPANOMES, CPNOREG, --DCPGLOSA, TIPDET,
       sum(CASE WHEN TIPDET='MG' or TIPDET='BI' THEN DCPMOORI * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) CPGRAVAD,
       sum(CASE WHEN TIPDET='I1' AND TREGID='03' THEN DCPMOORI * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) CPIGV,
       sum(CASE WHEN TIPDET='NG' THEN DCPMOORI * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) CPGRAVAD2,
       sum(CASE WHEN TIPDET='I3' THEN DCPMOORI * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) CPIGV2,
       sum(CASE WHEN TIPDET='MN' THEN DCPMOORI * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) CPNOGRAV,
       sum(CASE WHEN TIPDET='I2' THEN DCPMOORI * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) IGV_GRA_NO_DEST,
       sum(CASE WHEN TIPDET='AN' THEN DCPMOORI * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) ADQ_NO_GRAV,
       sum(CASE WHEN TIPDET='OT' THEN DCPMOORI * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) CP_OTROS,
       sum(CASE WHEN TIPDET='DC' THEN DCPMOORI * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) CPDCTO,
       sum(CASE WHEN TIPDET='SV' THEN DCPMOORI * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) CPSERVIC,
       sum(CASE WHEN TIPDET='TO' or TIPDET='I4' THEN DCPMOORI * CASE WHEN DCPDH='D' THEN -1 ELSE 1 END ELSE 0 END) CPMTOORI,
       sum(CASE WHEN TIPDET='TO' or TIPDET='I4' THEN DCPMOLOC * CASE WHEN DCPDH='D' THEN -1 ELSE 1 END ELSE 0 END) CPMTOLOC,
       sum(CASE WHEN TIPDET='TO' or TIPDET='I4' THEN DCPMOEXT * CASE WHEN DCPDH='D' THEN -1 ELSE 1 END ELSE 0 END) CPMTOEXT,
       sum(CASE WHEN TIPDET='I2' THEN DCPMOORI * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) CPISC,
       sum(CASE WHEN TIPDET='I1' AND TREGID='12' THEN DCPMOORI * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) CP4TA,
       sum(CASE WHEN TIPDET='I1' AND TREGID='14' THEN DCPMOORI * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) CPNODOM,
       sum(CASE WHEN TIPDET='SC' AND TREGID='20' THEN DCPMOORI * CASE WHEN DCPDH='H' THEN -1 ELSE 1 END ELSE 0 END) CP2TA
  FROM CXP302--@dbprodlee
         where CIAID='10' and TDIARID='08' and DCPANOMM='201404' and DCPESTDO not in ('A','I','E')
group by CIAID, TDIARID, DCPANOMM, CPNOREG
)
group by CIAID, TDIARID, CPANOMES, CPNOREG
having abs(sum(CPGRAVAD))>0.02 or
       abs(sum(CPIGV))>0.02 or
       abs(sum(CPGRAVAD2))>0.02 or
       abs(sum(CPIGV2))>0.02 or
       abs(sum(CPNOGRAV))>0.02 or
       abs(sum(IGV_GRA_NO_DEST))>0.02 or
       abs(sum(ADQ_NO_GRAV))>0.02 or
       abs(sum(CP_OTROS))>0.02 or
       abs(sum(CPDCTO))>0.02 or
       abs(sum(CPSERVIC))>0.02 or
       abs(sum(CPMTOORI))>0.02 or
       abs(sum(CPMTOLOC))>0.02 or
       abs(sum(CPMTOEXT))>0.02 or
   --    sum(CPISC)<>0 or
       abs(sum(CP4TA))>0.02 or
       abs(sum(CPNODOM))>0.02 or
       abs(sum(CP2TA))>0.02
order by CIAID, TDIARID, CPANOMES, CPNOREG
*)
end;

end.
