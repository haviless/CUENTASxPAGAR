Unit CxP264;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   CxP264
// Formulario           :   FOrdenPagoCab
// Fecha de Creación    :
// Autor                :   Hugo Noriega
// Objetivo             :   Registra la cabecera de la Orden de pago

// Actualizaciones      :
// HPC_201107_CXP  10/10/2011  Se implementa la función fg_Valida_AsientoContable que se
//                             encarga de validar si el asiento contable se generará correctamente
// HPC_201206_CXP  17/05/2012  Solo deben contabilizar la orden de pago los usuarios de contabilidad
// HPC_201305_CXP  25/10/2013  Modificacion de Fecha, Eliminar el Detalle de las Ordenes de Pago solo si esta en estado Inicial
// HPC_201307_CXP  26/11/2013  Ajustes
// HPC_201401_CXP  10/02/2014  Modificar los ControlTrans, AplicaDato y los ApplyUpdates.
// HPC_201412_CXP  15/09/2014  Automatización de emisión de comprobantes de retencion manuales cuando los pagos
//                             sean diferentes a cheques.
// HPC_201413_CXP  14/11/2014  Regularización Automatización de generación de la retención de IGV 
// HPC_201501_CXP  28/05/2015  Se añade Transferencias Interbancarias
// HPC_201503_CXP  15/09/2015  Exportación de archivos hacia BBVA
//                 16/09/2015  Impresión de Órden de Pago
// HPC_201504_CXP  05/10/2015  Se corrige Cta Cte BBVA, Exportación de archivos hacia BBVA
//                 07/10/2015  Se modificó programa para los descuentos de préstamos para los trabajadores que emiten Recibo por Honorarios
//                 07/10/2015  Se cambio la generación de la Serie y Numero doc en la contabilización desde la Orden de Pago
// HPC_201601_CXP  04/01/2016  Nueva serie de Comprobante de Retención, diferente
//                                   a la de Cheques de Tesorería
//                             Se añaden variables para controlar Agencia, NroCuenta,
//                                   Digito de Control para exportacion de archivo BBVA
//                             Se apertura dataset para tomar los datos de las cuentas bancarias
//                                   del BBVA de los proveedores
//                             Ajustes en la forma de armar Cuenta Bancaria para Exportar BBVA
//                             Se cambia valor fijo de moneda por variable
//                             Se cambia forma de alimentar las retenciones ya que una Orden de
//                                   Pago puede tener en simultáneo Detracciones y Retenciones
//                             Se incluye Número de Serie para incluir en llave de búsqueda
//                                   de Retenciones
//                             Busca serie por default en archivo de Series de Documentos
//
// HPC_201602_CXP  15/03/2016  DAF_2015001728_CXP_1 Nota de Crédito disminuye importe del Total de la Orden de Pago
//                 25/04/2016  DAF_2016000574_CXP_1 Ajustes a la Generación y Contabilización de Retenciones IGV
// HPC_201603_CXP  01/07/2016  DAF_2015001591_CXP_1 Asigna Banco y Moneda en Archivo de Exportación de acuerdo a Datos de Cabecera
//                 30/06/2016  DAF_2015001728_CXP_2 Ajusta selección de Canje por Nota de Crédito
//                 15/07/2016  DAF_2016000978_CXP_1 Ajustes a la Generación y Contabilización de Retenciones IGV.
// HPC_201604_CXP  01/08/2016  DAF_2015001591_CXP_2 Verifica que no tenga Forma de Pago <<Cheque de Gerencia>>
//                 23/08/2016  DAF_2016000575_CXP_1 Agrega rutina que genera archivo para SUNAT
//                 08/09/2016  DAF_2015001979_CXP_1 Incluye Número de Planilla en Glosa
//                 09/09/2016  DAF_2016000198_CXP_1 cambio de mantenimiento de datos de Transferencia Interbancaria (CXP265)
//                                                  Añade datos e importe adicional por Transferencia Interbancaria
// HPC_201701_CXP  20/04/2017  REQ 2017 Punto 9     Se ha modificado para que contabilice y coloque el Número de Operación en la
//                             columna de Numero de Documento y en la glosa de la cabecera y detalle del asiento se le está retirando
//                             el número de operación
//HPC_201701_CXP   27/04/2017  REQ 2017             Se ha modificado para que valide el Plan de Cuenta para otros descuentos en la contabilización de
//                             Ordenes de Pago.
//HPC_201703_CXP   16/05/2017  DAF_2016001580_CXP_1 Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago

//HPC_201705_CXP   01/08/2017  DAF-2017-0231-04 Se modifico la rutina de exportacion, para que considere a los documentos
//                             con id=69, estos se exportan con "F" en la columna xTDoc
//                 14/08/2017  DAF-2017-0231-07 Ajustes en Contabilización de Órdenes de Pago origen 53
//HPC_201706_CXP   08/09/2017  DAF-2017-0783-08 Se modifico la rutina de Validación al SEMT
//                             Se acumula importe por proveedor para luego validar dicho importe.
//                             Se considera el tipo de cambio para documentos con importe en dolares.
// HPC_201707_CXP              Ajuste en la opción de Nota de Crédito


Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, DBCtrls, wwdblook,
   wwdbdatetimepicker, Mask, wwdbedit, ExtCtrls, DB,
   Wwdbdlg, ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppBands, ppCache, DBGrids, ppViewr, pptypes, ppCtrls, ppVar,
   ppPrnabl, ppParameter;

Type
   TFOrdenPagoCab = Class(TForm)
      dbgDetalle: TwwDBGrid;
      pnlCab: TPanel;
      Label2: TLabel;
      dbeNumero: TwwDBEdit;
      Label3: TLabel;
      DBMemo: TDBMemo;
      Panel2: TPanel;
      pnlGraba: TPanel;
      Label4: TLabel;
      bbtnGraba: TBitBtn;
      dbeUsuGraba: TwwDBEdit;
      pnlVisa: TPanel;
      Label5: TLabel;
      bbtnAcepta: TBitBtn;
      dbeUsuAcepta: TwwDBEdit;
      z2bbtnAnula: TBitBtn;
      wwDBGrid1IButton: TwwIButton;
      bbtnExporta: TBitBtn;
      sdGraba: TSaveDialog;
      Memo1: TMemo;
      edtEstado: TEdit;
      pnlCab2: TPanel;
      lblBanco: TLabel;
      dblcBanco: TwwDBLookupCombo;
      edtBanco: TEdit;
      lblCCBco: TLabel;
      dblcCCBco: TwwDBLookupCombo;
      pnlCnt: TPanel;
      Label6: TLabel;
      dbeNumPla: TwwDBEdit;
      bbtnContabiliza: TBitBtn;
      bbtnRet: TBitBtn;
      bbtnVerCont: TBitBtn;
      BitBtn1: TBitBtn;
      BitBtn3: TBitBtn;
      bbtnRetUno: TBitBtn;
      pnlCab1: TPanel;
      lblCia: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      dblcTMoneda: TwwDBLookupCombo;
      edtTMoneda: TEdit;
      lblTMon: TLabel;
      dtpFechaCnt: TwwDBDateTimePicker;
      Label7: TLabel;
      bbtnIni: TBitBtn;
      pnlCab3: TPanel;
      Label1: TLabel;
      dtpFecha: TwwDBDateTimePicker;
      bbtnPago: TBitBtn;
   // Inicio HPC_201604_CXP
      {
      pnlConstancia: TPanel;
      Label9: TLabel;
      btnActualizarConstancia: TBitBtn;
      btnCerrarPanelConstancia: TBitBtn;
      dblcdProv: TwwDBLookupComboDlg;
      edtProv: TEdit;
      Label8: TLabel;
      dblcBanco1: TwwDBLookupCombo;
      edtBanco1: TEdit;
      Label10: TLabel;
      Label11: TLabel;
      dblcClAux: TwwDBLookupCombo;
      edtCtaCte: TEdit;
      rgOperacion: TRadioGroup;
      }
   // Fin HPC_201604_CXP
      ppdbReporte: TppDBPipeline;
      pprReporte: TppReport;
      ppDesigner1: TppDesigner;
      bbtnImprime: TBitBtn;
      btnExportarExcel: TBitBtn;
      dbgExporta: TDBGrid;
      sbDiseno: TSpeedButton;
      cbDiseno: TCheckBox;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
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
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel15: TppLabel;
      ppLine8: TppLine;
      ppLine9: TppLine;
      ppLine10: TppLine;
      ppLine11: TppLine;
      ppLine12: TppLine;
      ppLine13: TppLine;
      ppLine14: TppLine;
      ppLine15: TppLine;
      ppLine16: TppLine;
      ppLine17: TppLine;
      ppLine18: TppLine;
      ppLine19: TppLine;
      ppLine20: TppLine;
      ppLine21: TppLine;
      ppLine22: TppLine;
      ppLine23: TppLine;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLine24: TppLine;
      ppLabel23: TppLabel;
      ppLine25: TppLine;
      ppLabel24: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppDBText22: TppDBText;
      ppLine3: TppLine;
      ppLabel16: TppLabel;
      ppLine4: TppLine;
      ppLabel17: TppLabel;
      ppLine5: TppLine;
      ppLabel18: TppLabel;
      ppLine6: TppLine;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppLine7: TppLine;
      ppLabel19: TppLabel;
      ppDBText23: TppDBText;
      pnlConstancia1: TPanel;
      Label12: TLabel;
      edtConstancia: TwwDBEdit;
      btnActConstancia: TBitBtn;
      btnCerrarPanelConsta: TBitBtn;
   // Inicio HPC_201602_CXP
   // Botón para registrar descuento
      bbtnDesCnt: TBitBtn;
   // Inicio HPC_201604_CXP
      bbtnDatosTransf: TBitBtn;
      rgOperacion: TRadioGroup;
      pnlImprDest: TPanel;
      bbtnImpDest: TBitBtn;
      StaticText3: TStaticText;
      dblcdImpDest: TwwDBLookupComboDlg;
      bbtnImpDestCanc: TBitBtn;	
   // Inicio HPC_201703_CXP
   // Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
      cbTodos: TCheckBox;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
    ppLabel25: TppLabel;
    ppLine26: TppLine;
    ppDBText24: TppDBText;
    ppDBCalc5: TppDBCalc;
// Fin HPC_201707_CXP
   // Fin HPC_201703_CXP
      Procedure wwDBGrid1IButtonClick(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcTMonedaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure bbtnGrabaClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure dbgDetalleKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure bbtnExportaClick(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcTMonedaExit(Sender: TObject);
      Procedure bbtnAceptaClick(Sender: TObject);
      Procedure dblcBancoExit(Sender: TObject);
	  procedure bbtnContabilizaClick(Sender: TObject);
      Procedure z2bbtnAnulaClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcCCBcoEnter(Sender: TObject);
      Procedure dbgDetalleDblClick(Sender: TObject);
      Procedure dblcBancoNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcCCBcoNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure bbtnRetClick(Sender: TObject);
      Procedure bbtnVerContClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure BitBtn3Click(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnIniClick(Sender: TObject);
      Procedure bbtnRetUnoClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dtpFechaExit(Sender: TObject);
      procedure bbtnPagoClick(Sender: TObject);
   // Inicio HPC_201604_CXP
   // cambia mantenimiento de datos de Transferencia Interbancaria
      //procedure btnActualizarConstanciaClick(Sender: TObject);
   // Fin HPC_201604_CXP
      procedure rgOperacionClick(Sender: TObject);
      procedure btnCerrarPanelConstanciaClick(Sender: TObject);
   // Inicio HPC_201604_CXP
   // retira por cambio de mantenimiento de datos de Transferencia Interbancaria
   //   procedure dblcClAuxExit(Sender: TObject);
   //   procedure dblcdProvExit(Sender: TObject);
   //   procedure dblcBanco1Exit(Sender: TObject);
   // Fin HPC_201604_CXP
      procedure bbtnImprimeClick(Sender: TObject);
      procedure btnExportarExcelClick(Sender: TObject);
      procedure sbDisenoClick(Sender: TObject);
      procedure pprReportePreviewFormCreate(Sender: TObject);
      procedure btnActConstanciaClick(Sender: TObject);
      procedure btnCerrarPanelConstaClick(Sender: TObject);
   // Inicio HPC_201602_CXP
   // Rutuina de Botón para registrar descuento
      procedure bbtnDesCntClick(Sender: TObject);
   // Inicio HPC_201604_CXP
   // Botón que invoca formulario de datos de Transferencia Interbancaria
      procedure bbtnDatosTransfClick(Sender: TObject);
      procedure bbtnImpDestClick(Sender: TObject);
      Procedure SelecImpresDest;
      Procedure GeneraTxtRetElec;
      procedure bbtnImpDestCancClick(Sender: TObject);
      procedure dtpFechaCntExit(Sender: TObject);  
// Inicio HPC_201703_CXP
// Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
      procedure cbTodosClick(Sender: TObject);
// Fin HPC_201703_CXP

   // Fin HPC_201604_CXP
   // Fin HPC_201602_CXP

   Private
    { Private declarations }
      Procedure GrabaTexto(Datos: TDatasource; Fichero: String; Delimitador: char);
// Inicio HPC_201703_CXP
// Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
      Procedure ValidacionSEMT(Datos: TDatasource; Fichero: String; Delimitador: char);
// Fin HPC_201703_CXP
      Procedure SumaGrid;
      Procedure fg_HabilitaPanelConstancia;
      Procedure CargaGridDetalle;
      Function SumaCuentas: String;
      Function ValidaRetenciones: Boolean;
      Procedure CreaRetenciones;
      Procedure CargaDataSource;
      Function fg_Valida_AsientoContable(wgCiaid, wgNumOrdenPago, wgOrigen: String): Boolean;
      Function fg_validaCierreContable(wgFecha: TDateTime): Boolean;
      Function ValidaUsuarioCNT(sUsuario: String): Boolean;
// Inicio HPC_201703_CXP
// Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
      Function ValidaOPSEMT(): Boolean;
// Fin HPC_201703_CXP
      procedure DevuelvePeriodo(var sAno : String ; var sMes : String ) ;
      function  Redondea(currDato:Currency;digitos:word=2):Currency;
      function  NumLetra(const mNum: Currency; const iIdioma, iModo: Smallint): String;
      Procedure ObtenerNumretencion(xCia,xPeriodo,xTdiarid: String);
      Procedure GrabaTextoBBVA(Datos: TDatasource; Fichero: String; Delimitador: char);
      Function SumaCuentasBBVA: String;
// Inicio HPC_201706_CXP
// Nuevo rutina para obtener la data para la validacion SEMT
      Procedure ValidacionSEMT_CargaData;
// fin HPC_201706_CXP
   Public
    { Public declarations }
      nImpPago: Double;
      xnumserie: String;
      xnumretencion: String;
      xnumcomprob : String;
      dImpOtrDes: Double;

   // Inicio HPC_201604_CXP
      wsBanco : String; // Abreviatura de Banco
      xTCambio: String; // Tipo de Cambio
      wDatosOk_CCI : Boolean; // Flag que indica que datos CCI están OK
   // Fin HPC_201604_CXP

   End;

Var
   FOrdenPagoCab: TFOrdenPagoCab;
   xContinuaGrab : Boolean;
   xEsDomiciliado : String;
// Inicio HPC_201602_CXP
// Añade RUC en los campos que devuelve la consulta d ela Compañía
   wCiaRUC : String;
// Fin HPC_201602_CXP
// Inicio HPC_201604_CXP
   wIP_Impresora : String;
   wId_Rutadest  : String;
   xTienda  : String;
   xPVenta  : String;
// Fin HPC_201604_CXP

Implementation

{$R *.dfm}

// Inicio HPC_201604_CXP
// Se añade formulario CXP265 para actualización de datos de Transferencia Interbancaria
//Uses CXPDM, CXP262, CXP266, CXP268, StrUtils, CXP260;
Uses CXPDM, CXP262, CXP266, CXP268, StrUtils, CXP260, CXP265;
// Fin HPC_201604_CXP

Function TFOrdenPagoCab.ValidaUsuarioCNT(sUsuario: String): Boolean;
Var
// Inicio: HPC_201504_CXP
   sSQL,xsSql: String;
// Fin: HPC_201504_CXP
Begin
   sSQL := 'Select B.USERID, C.USERNOM '
         + '  from TGE001 A, TGE007 B, TGE006 C '
         + ' where A.MODULOID IN (''CNT'') AND A.TIPO=''0'' '
         + '   and B.USERID=''' + sUsuario + ''' '
         + '   and B.USERID IS NOT NULL '
         + '   and A.GRUPOID=B.GRUPOID(+) '
         + '   and B.USERID=C.USERID(+) '
         + '   and ( (FECEXP IS NULL AND FECFIN_PWD IS NULL ) OR ( TO_DATE(SYSDATE)<FECFIN_PWD )  ) ';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(sSql);
   DMCXP.cdsQry.Open;

   Result := False;
   If DMCXP.cdsQry.RecordCount > 0 Then
      Result := True;

End;

Procedure TFOrdenPagoCab.CargaDataSource;
Var
   xSQL: String;
Begin
   // Cabecera
   dblcCia.LookupTable := DMCXP.cdsCia;
   dblcCia.DataSource := DMCXP.dsOPago;
   dtpFecha.DataSource := DMCXP.dsOPago;
   dtpFechaCnt.DataSource := DMCXP.dsOPago;
   dblcTMoneda.LookupTable := DMCXP.cdsTMon;
   dblcTMoneda.DataSource := DMCXP.dsOPago;
   dbeNumero.DataSource := DMCXP.dsOPago;
   DBMemo.DataSource := DMCXP.dsOPago;

   dbeUsuGraba.DataSource := DMCXP.dsOPago;
   dbeUsuAcepta.DataSource := DMCXP.dsOPago;
   dblcBanco.DataSource := DMCXP.dsOPago;
   dblcBanco.LookupTable := DMCXP.cdsBanco;
   dblcCCBco.DataSource := DMCXP.dsOPago;
   dblcCCBco.LookupTable := DMCXP.cdsCCBco;
   dbeNumPla.DataSource := DMCXP.dsOPago;

   // Detalle
   dbgDetalle.DataSource := DMCXP.dsDetallePres;

// Inicio HPC_201604_CXP
   rgOperacion.Enabled := True;

// retira por cambio de mantenimiento de datos de Transferencia Interbancaria
   {
   If length(dblcCia.text) > 0 Then
      xSQL := 'Select CIAID, NUMERO, CLAUXID, PROV, BANCOID, CCBCOID, '
            + '       USUREG, FECREG, USUMOD, FECMOD, CPFREG '
            + '  from CXP_ORD_PAG_TINT '
            + ' where CIAID = '+quotedstr(dblcCia.text)
            + '   and NUMERO ='+ quotedstr(dbeNumero.TEXT)
   else
      xSQL := 'Select CIAID, NUMERO, CLAUXID, PROV, BANCOID, CCBCOID, '
            + '       USUREG, FECREG, USUMOD, FECMOD, CPFREG '
            + '  from CXP_ORD_PAG_TINT '
            + ' where CIAID = ''xxx'' '
            + '   and NUMERO =''0'' ' ;

   DMCXP.cdsQry13.Close;
   DMCXP.cdsQry13.DataRequest(xSQL);
   DMCXP.cdsQry13.Open;

   dblcClAux.DataSource := DMCXP.dsQry13;
   dblcClAux.LookupTable := DMCXP.cdsClAux;
   dblcdProv.DataSource := DMCXP.dsQry13;
   dblcdProv.LookupTable := DMCXP.cdsProv;
   }
// Fin HPC_201604_CXP
End;

Procedure TFOrdenPagoCab.wwDBGrid1IButtonClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'P' Then
   Begin
      ShowMessage('Orden de Pago se encuentra en Estado Aceptado');
      Exit;
   End;
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago se encuentra en Estado Anulado');
      Exit;
   End;

   If dblcCia.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar la Compañía');
      Exit;
   End;

   If dblcTMoneda.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar el Tipo de Moneda');
      Exit;
   End;

   If Trim(DBMemo.Text) = '' Then
   Begin
      ShowMessage('Falta Ingresar la Observación');
      Exit;
   End;

   If dtpFecha.Date = 0 Then
   Begin
      ShowMessage('Falta Ingresar la fecha');
      Exit;
   End;

   xContinuaGrab := True;

   If DMCXP.cdsOPago.fieldByname('NUMERO').AsString = '' Then
      bbtnGrabaClick(Self);

   Try
      FOrdenSelec := TFOrdenSelec.Create(Application);
      FOrdenSelec.ShowModal;
   Finally
      FOrdenSelec.Free;

   // Inicio HPC_201703_CXP
   // Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
      xSQL := 'Select D.CIAID, D.NUMERO, D.ITEM, D.CLAUXID, D.AUXID, D.DOCID, D.CPSERIE, D.CPNODOC, D.TMONID, D.CPMTOORI, D.CPPAGORI, D.CPSALORI, D.IMPPAGO, D.IMPRETE, D.FREG, D.HREG, D.USUARIO, '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            + '       D.CCOSID, '
// Fin HPC_201707_CXP
            + '       D.ESTADO, D.IMPDEVO, D.RQCIAID, D.RQORIGEN, D.NUMDETRAC, D.NUMCONSTA,'
            + '       C.CIAID, C.CPANOMES, C.TDIARID, C.CPNOREG, C.CLAUXID, C.PROV, C.PROVRUC, C.DOCID, C.CPSERIE, C.CPNODOC, C.CPFRECEP, C.CPFEMIS, C.CPFVCMTO, C.TMONID, C.CPTCAMPR, C.CPTCAMPA, '
            + '       C.CPESTADO, C.CPOCOMP, C.CP_CONTA, C.CPGRAVAD, C.CPNOGRAV, C.CPIGV, C.CPISC, C.CPDCTO, C.CPSERVIC, C.CPMTOORI, C.CPMTOLOC, C.CPMTOEXT, C.CPPAGORI, C.CPPAGLOC, C.CPPAGEXT, '
            + '       C.CPSALORI, C.CPSALLOC, C.CPSALEXT, C.TCANJEID, C.CPCANJE, C.CPFCANJE, C.CPUSER, C.CPFREG, C.CPHREG, C.CPAAAA, C.CPMM, C.CPDD, C.CPTRI, C.CPSEM, C.CPSS, C.CPAATRI, C.CPAASEM, '
            + '       C.CPAASS, C.CPFCMPRB, C.DCPLOTE, C.DCPCOMP, C.CTATOTAL, C.FLAGVAR, C.CPTOTOT, C.CPIGV2, C.CPGRAVAD2, C.CPHMOD, C.FLAGVAR2, C.PROVDES, C.CLAUXREND, C.AUXIDREND, C.CCBCOID, '
            + '       C.BANCOID, C.SITUAID, C.CPFLAGTDOC, C.CXPRRHH, C.AUXIDINTER, C.CLAUXINTER, C.CPTCAMDOL, C.PROVRETIGV, C.CPTCAMAJ, C.DTRPORC, C.CPMTOORIB, C.DTRFLAG, C.FECDEPDET, C.NUMDEPDET, '
            + '       C.ADQ_NO_GRAV, C.IGV_GRA_NO_DEST, C.CP_OTROS, C.CPTODETRSUNATID, C.TIPOOPERSUNATID, C.PORCDESC, C.CP4TAPENSION, C.SNPAFPID, C.TIPCOMAFPID, D.IMPOTRDTO, D.OBSERVA, D.CTAOTRDTO,D.VALORDPAG '
            + '  from CXP_ORD_PAG_DET D '
            + ' INNER JOIN CXP301 C ON D.CLAUXID = C.CLAUXID AND D.AUXID=C.PROV AND D.DOCID = C.DOCID AND D.CPSERIE =C.CPSERIE and D.CPNODOC = C.CPNODOC '
            + ' where D.CIAID =''' + DMCXP.cdsOPago.FieldByname('CIAID').AsString + ''' '
            + '   and D.NUMERO=''' + DMCXP.cdsOPago.FieldByname('NUMERO').AsString + ''' '
            + '   and C.CPESTADO in (''C'',''P'') '
            + ' order by D.ITEM';
   // Fin HPC_201703_CXP

      DMCXP.cdsDetallePres.Close;
      DMCXP.cdsDetallePres.DataRequest(xSQL);
      DMCXP.cdsDetallePres.Open;
      SumaGrid;
   End;

End;

Procedure TFOrdenPagoCab.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFOrdenPagoCab.dblcTMonedaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFOrdenPagoCab.bbtnGrabaClick(Sender: TObject);
Var
   xSQL: String;
   nCont: Integer;
   nReg: Integer;
   xTieneReg : boolean;
   xTipOperacion: String;
Begin
   xTipOperacion := '';
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'P' Then
   Begin
      ShowMessage('Orden de Pago se encuentra Aceptada');
      Exit;
   End;
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago Esta Anulada');
      Exit;
   End;

// Inicio HPC_201604_CXP
   If DMCXP.cdsOPago.fieldByname('USUCONTA').AsString <> '' Then
   Begin
      ShowMessage('Orden de Pago ya fue contabilizada');
      Exit;
   End;

   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'C' Then
   Begin
      ShowMessage('Orden de Pago ya se encuentra CONFIRMADA');
      Exit;
   End;


   If dblcCia.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar la Compañía');
      dblcCia.SetFocus;
      Exit;
   End;
   If dblcTMoneda.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar el Tipo de Moneda');
      dblcTMoneda.SetFocus;
      Exit;
   End;
   If Trim(DBMemo.Text) = '' Then
   Begin
      ShowMessage('Falta Ingresar la Observación');
      DBMemo.SetFocus;
      Exit;
   End;
   If dtpFecha.Date = 0 Then
   Begin
      ShowMessage('Falta Ingresar la fecha');
      dtpFecha.SetFocus;
      Exit;
   End;
// Fin HPC_201604_CXP
   If fg_validaCierreContable(dtpFecha.Date) = True Then
   Begin
      ShowMessage(' Mes Cerrado Contablemente!!!, No se puede Registrar');
      Exit;
   End;

   if rgOperacion.ItemIndex =0 then
      xTipOperacion := 'A'
   else
      xTipOperacion := 'T';

   DMCXP.DCOM1.AppServer.IniciaTransaccion;
   if FOrdenPago.xgTipoAct='I' then
   begin
      xSQL := 'Select lpad(to_char(nvl(to_number(max(NUMERO)),0)+1),6,''0'') NUMMAX '
            + '  From CXP_ORD_PAG_CAB '
            + ' Where CIAID='+quotedstr(dblcCia.Text);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      DMCXP.cdsOPago.Edit;
      DMCXP.cdsOPago.fieldByname('NUMERO').AsString := DMCXP.cdsQry.fieldByname('NUMMAX').AsString;
      DMCXP.cdsOPago.fieldByname('USUARIO').AsString := DMCXP.wUsuario;
      DMCXP.cdsOPago.fieldByname('ESTADO').AsString  := 'I';
      DMCXP.cdsOPago.fieldByname('FECHA').AsString   := dtpFecha.Text;
      DMCXP.cdsOPago.fieldByname('BANCOID').AsString := dblcBanco.Text;
      DMCXP.cdsOPago.fieldByname('CCBCOID').AsString := dblcCCBco.Text;
      SumaGrid; // MONPAG con Sumatoria del Detalle
      DMCXP.cdsOPago.Post;

      xSQL := 'Insert into CXP_ORD_PAG_CAB(CIAID, NUMERO, USUARIO, FECHA, TMONID, '
            + '                            ESTADO, BANCOID, CCBCOID, OBSERVA, FLAG_OPER) '
             +'values('+quotedstr(dblcCia.Text)+ ', '
                       +quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString)+', '
                       +quotedstr(DMCXP.wUsuario)+', '
                       +quotedstr(datetostr(dtpFecha.date))+', '
                       +quotedstr(dblcTMoneda.Text)+', '
                       +quotedstr('I')+', '
                       +quotedstr(dblcBanco.Text)+', '
                       +quotedstr(dblcCCBco.Text)+', '
                       +quotedstr(DBMemo.Text)+', '
                       +quotedstr(xTipOperacion)+') ';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al añadir el nuevo registro en la cabecera..');
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
      rgOperacion.Enabled := True;
   // Inicio HPC_201604_CXP
   // retira controles anteriores de los datos interbancarios
      {
      dblcClAux.Enabled := True;
      dblcdProv.Enabled := True;
      dblcBanco1.Enabled := True;
      }
   // Fin HPC_201604_CXP
   end
   else
   begin
      If DMCXP.cdsOPago.fieldByname('NUMERO').AsString <> '' Then
      Begin
         DMCXP.cdsOPago.Edit;
         DMCXP.cdsOPago.fieldByname('USUARIO').AsString := DMCXP.wUsuario;
         DMCXP.cdsOPago.fieldByname('ESTADO').AsString  := 'I';
         DMCXP.cdsOPago.fieldByname('FECHA').AsDateTime := dtpFecha.Date;
         DMCXP.cdsOPago.fieldByname('BANCOID').AsString := dblcBanco.Text;
         DMCXP.cdsOPago.fieldByname('CCBCOID').AsString := dblcCCBco.Text;
         DMCXP.cdsOPago.fieldByname('FLAG_OPER').AsString := trim(xTipOperacion);
         SumaGrid; // MONPAG con Sumatoria del Detalle
         DMCXP.cdsOPago.Post;
         xSQL := ' update CXP_ORD_PAG_CAB '
                +'   set USUARIO='+quotedstr(DMCXP.cdsOPago.fieldByname('USUARIO').AsString)+', '
                +'       ESTADO='+quotedstr(DMCXP.cdsOPago.fieldByname('ESTADO').AsString)+', '
                +'       FECHA='+quotedstr(datetostr(dtpFecha.date))+', '
                +'       BANCOID='+quotedstr(DMCXP.cdsOPago.fieldByname('BANCOID').AsString)+', '
                +'       CCBCOID='+quotedstr(DMCXP.cdsOPago.fieldByname('CCBCOID').AsString)+', '
                +'       MONPAG='+quotedstr(DMCXP.cdsOPago.fieldByname('MONPAG').AsString)+', '
                +'       FLAG_OPER='+quotedstr(DMCXP.cdsOPago.fieldByname('FLAG_OPER').AsString)+' '
                +' where CIAID='+quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
                +'   and NUMERO='+quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString);
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error en la actualización del registro en la cabecera..');
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            Exit;
         End;
      End;
   // Inicio HPC_201604_CXP
   // retira controles anteriores de los datos interbancarios
      {
      if (DMCXP.cdsOPago.fieldByname('ESTADO').AsString ='T') OR (DMCXP.cdsOPago.fieldByname('ESTADO').AsString ='I') then
      Begin
         dblcClAux.Enabled := True;
         dblcdProv.Enabled := True;
         dblcBanco1.Enabled := True;
      End
      Else
      Begin
         dblcClAux.Enabled := False;
         dblcdProv.Enabled := False;
         dblcBanco1.Enabled := False;
      End;
      }
   // Fin HPC_201604_CXP
   end;

   Try
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
   Except
      ShowMessage('Error en la actualización del registro en la cabecera..');
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      Exit;
   End;

   If DMCXP.cdsOPago.fieldByname('NUMERO').AsString = '' Then
   Begin
      nCont := 1;
      While (DMCXP.cdsOPago.fieldByname('NUMERO').AsString = '') And (nCont <= 10) Do
      Begin

         xSQL := 'Select LPAD(TO_CHAR(NVL(TO_NUMBER(MAX(NUMERO)),0)+1),6,''0'') NUMMAX '
               + '  From CXP_ORD_PAG_CAB '
               + ' Where CIAID=''' + dblcCia.Text + ''' '; //and modulo is null';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;
         DMCXP.cdsOPago.fieldByname('NUMERO').AsString := DMCXP.cdsQry.fieldByname('NUMMAX').AsString;
         DMCXP.cdsOPago.Post;

         If DMCXP.cdsOPago.ApplyUpdates(-1) > 0 Then
            DMCXP.cdsOPago.fieldByname('NUMERO').AsString := '';
         inc(nCont);
      End;
      If DMCXP.cdsOPago.fieldByname('NUMERO').AsString = '' Then
      Begin
         ShowMessage('Error al grabar, intente nuevamente');
         Exit;
      End;
      If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'I' Then edtEstado.Text := 'INICIAL';
      pnlCab1.Enabled := False;
   End
   Else
   Begin
      If DMCXP.cdsDetallePres.RecordCount = 0 Then
      Begin
         ShowMessage('No existe Registros en el Detalle, no se actualizará');
//         DMCXP.DCOM1.AppServer.GrabaTransaccion;
         CargaGridDetalle;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
         If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'I' Then
         Begin
            //deshabilitar
            bbtnExporta.Enabled := false;
            bbtnPago.Enabled := false;
            bbtnContabiliza.Enabled := false;
            dbeNumPla.Enabled := false;
            dtpFechaCnt.Enabled := false;
            //habilitar
            bbtnGraba.Enabled := true;
            bbtnAcepta.Enabled := true;
            z2bbtnAnula.Enabled := true;
            pnlCab2.Enabled := true;
            
            edtEstado.Text := 'INICIAL';
         End;
// Fin HPC_201707_CXP
         pnlCab1.Enabled := False;
         FOrdenPago.xgTipoAct:='M';
         Exit;
      End;
   END;

  // borrado de registros físicos
      DMCXP.DCOM1.AppServer.IniciaTransaccion;

      xSQL := 'Delete from CXP_ORD_PAG_DET '
            + ' where CIAID =''' + DMCXP.cdsOPago.FieldByname('CIAID').AsString + ''' '
            + '   and NUMERO=''' + DMCXP.cdsOPago.FieldByname('NUMERO').AsString + ''' ';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en la Transaccion Eliminar');
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
      End;

   nReg := 0;
   DMCXP.cdsDetallePres.First;
   While Not DMCXP.cdsDetallePres.EOF Do
   Begin
      nReg := nReg + 1;
   // Inicio HPC_201703_CXP
   // Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
      xSQL := 'Insert into CXP_ORD_PAG_DET(CIAID, NUMERO, ITEM, CLAUXID, AUXID, DOCID, CPSERIE, CPNODOC, '
            + '                            TMONID, CPMTOORI, CPPAGORI, CPSALORI, IMPPAGO, IMPRETE, FREG, HREG, USUARIO, ESTADO, '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            + '                            IMPDEVO, RQCIAID, RQORIGEN, NUMDETRAC, NUMCONSTA, OBSERVA, IMPOTRDTO,VALORDPAG,CTAOTRDTO,CCOSID) '
// Fin HPC_201707_CXP
            + 'Values( '+quotedstr(DMCXP.cdsOPago.FieldByName('CIAID').AsString) + ', '
            +            quotedstr(DMCXP.cdsOPago.FieldByName('NUMERO').AsString) + ', '
            +            quotedstr(strzero(IntToStr(nReg), 3)) + ', '
            +            quotedstr(DMCXP.cdsDetallePres.FieldByName('CLAUXID').AsString) + ', '
            +            quotedstr(DMCXP.cdsDetallePres.FieldByName('AUXID').AsString) + ', '
            +            quotedstr(DMCXP.cdsDetallePres.FieldByName('DOCID').AsString) + ', '
            +            quotedstr(DMCXP.cdsDetallePres.FieldByName('CPSERIE').AsString) + ', '
            +            quotedstr(DMCXP.cdsDetallePres.FieldByName('CPNODOC').AsString) + ', '
            +            quotedstr(DMCXP.cdsDetallePres.FieldByName('TMONID').AsString) + ', '
            +            FloatToStr(DMCXP.cdsDetallePres.FieldByName('CPMTOORI').AsFloat) + ', '
            +            FloatToStr(DMCXP.cdsDetallePres.FieldByName('CPPAGORI').AsFloat) + ', '
            +            FloatToStr(DMCXP.cdsDetallePres.FieldByName('CPSALORI').AsFloat) + ', '
            +            FloatToStr(DMCXP.cdsDetallePres.FieldByName('IMPPAGO').AsFloat) + ', '
            +            FloatToStr(DMCXP.cdsDetallePres.FieldByName('IMPRETE').AsFloat) + ', '
            +            'SYSDATE, SYSDATE, '
            +            quotedstr(DMCXP.wUsuario) + ', '
            +            quotedstr('P')+', '
            +            FloatToStr(DMCXP.cdsDetallePres.FieldByName('IMPDEVO').AsFloat) + ', '
            +            quotedstr(DMCXP.cdsDetallePres.FieldByName('RQCIAID').AsString) + ', '
            +            quotedstr(DMCXP.cdsDetallePres.FieldByName('RQORIGEN').AsString) + ', '
            +            quotedstr(DMCXP.cdsDetallePres.FieldByName('NUMDETRAC').AsString) + ', '
            +            quotedstr(DMCXP.cdsDetallePres.FieldByName('NUMCONSTA').AsString) + ', '
            +            quotedstr(DMCXP.cdsDetallePres.FieldByName('OBSERVA').AsString) + ', '
            +            FloatToStr(DMCXP.cdsDetallePres.FieldByName('IMPOTRDTO').AsFloat) + ', '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            +            quotedstr(DMCXP.cdsDetallePres.FieldByName('VALORDPAG').AsString) + ', '
            +            quotedstr(DMCXP.cdsDetallePres.FieldByName('CTAOTRDTO').AsString) + ', '
            +            quotedstr(DMCXP.cdsDetallePres.FieldByName('CCOSID').AsString) + ' '
// Fin HPC_201707_CXP
            +       ' )';
   // Fin HPC_201703_CXP
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en la Transacción Insertar');
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
      End;
      DMCXP.cdsDetallePres.Next;
   End;
   DMCXP.DCOM1.AppServer.GrabaTransaccion;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'I' Then
   Begin
      //deshabilitar
      bbtnExporta.Enabled := false;
      bbtnPago.Enabled := false;
      bbtnContabiliza.Enabled := false;
      dbeNumPla.Enabled := false;
      dtpFechaCnt.Enabled := false;
      //habilitar
      bbtnGraba.Enabled := true;
      bbtnAcepta.Enabled := true;
      z2bbtnAnula.Enabled := true;
      pnlCab2.Enabled := true;
      edtEstado.Text := 'INICIAL';
   End;
// Fin HPC_201707_CXP
   pnlCab1.Enabled := False;
   FOrdenPago.xgTipoAct:='M';
   ShowMessage('Grabado');
   CargaGridDetalle;

// Inicio HPC_201706_CXP
// Se comento lo anterior
//// Inicio HPC_201703_CXP
//// Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
//   DMCXP.cdsDetallePres.Filter := '';
//// Inicio HPC_201705_CXP
//// Ajuste de la Validación al SEMT para los Pagos a proveedores en la Orden de Pago
//   DMCXP.cdsDetallePres.Filter := 'IMPPAGO > 3500';
//// Fin HPC_201705_CXP
//   DMCXP.cdsDetallePres.Filtered := true;
//   If DMCXP.cdsDetallePres.Recordcount > 0 Then
//   begin
//      If Not sdGraba.Execute Then
//      begin
//        DMCXP.cdsDetallePres.Filtered := false;
//        Exit;
//      end;
//      ValidacionSEMT(DMCXP.dsDetallePres, sdGraba.FileName, ',');
//   end;
//
//   DMCXP.cdsDetallePres.Filtered := false;
//// Fin HPC_201703_CXP

// Ahora se usa nueva rutina para obtener la data para la validacion
   ValidacionSEMT_CargaData;
   If DMCXP.cdsQry10.Recordcount > 0 Then
   begin
      If Not sdGraba.Execute Then
      begin
        Exit;
      end;
      ValidacionSEMT(DMCXP.dsQry10, sdGraba.FileName, ',');
   end;
// Fin HPC_201706_CXP

End;

Procedure TFOrdenPagoCab.SumaGrid;
Var
   dImpPago: Double;
Begin
   dImpPago := 0;
// Inicio HPC_201504_CXP
   dImpOtrDes :=0;
// Fin HPC_201504_CXP
   DMCXP.cdsDetallePres.First;
   While Not DMCXP.cdsDetallePres.Eof Do
   Begin
      dImpPago := dImpPago + DMCXP.cdsDetallePres.FieldByname('IMPPAGO').AsFloat;
// Inicio HPC_201504_CXP
      dImpOtrDes := dImpOtrDes + DMCXP.cdsDetallePres.FieldByname('IMPOTRDTO').AsFloat;
// Fin HPC_201504_CXP
      DMCXP.cdsDetallePres.Next;
   End;
   If (DMCXP.cdsOPago.State = dsInsert) Or (DMCXP.cdsOPago.State = dsEdit) Then
   Begin
      DMCXP.cdsOPago.fieldByname('MONPAG').AsFloat := dImpPago;
   End;
   dbgDetalle.ColumnByName('IMPPAGO').FooterValue := floattostrf(dImpPago, ffNumber, 10, 2);
   DMCXP.cdsDetallePres.First;
End;

Procedure TFOrdenPagoCab.FormActivate(Sender: TObject);
Var
   xSQL: String;
Begin
   bbtnRetUno.Visible := False;
   bbtnIni.Visible := False;
   bbtnIni.Visible := True;

   dbgDetalle.Selected.Clear;
   dbgDetalle.Selected.Add('CLAUXID'#9'4'#9'Cl.~Aux.'#9'F');
   dbgDetalle.Selected.Add('AUXID'#9'10'#9'Id.~Prov.'#9'F');
   dbgDetalle.Selected.Add('DOCID'#9'3'#9'Doc.'#9'F');
   dbgDetalle.Selected.Add('CPSERIE'#9'6'#9'Serie'#9'F');
   dbgDetalle.Selected.Add('CPNODOC'#9'15'#9'No.~Documento'#9'F');
   dbgDetalle.Selected.Add('TMONID'#9'3'#9'TM'#9'F');
   dbgDetalle.Selected.Add('CPMTOORI'#9'11'#9'Importe'#9'F');
   dbgDetalle.Selected.Add('CPPAGORI'#9'11'#9'Importe~Pagado'#9'F');
   dbgDetalle.Selected.Add('CPSALORI'#9'11'#9'Importe~Saldo'#9'F');
   dbgDetalle.Selected.Add('IMPPAGO'#9'11'#9'Monto a~Pagar'#9'F');
   dbgDetalle.Selected.Add('IMPRETE'#9'13'#9'Afecto a~Retención/Detrac.'#9'F');
// Inicio HPC_201703_CXP
// Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
   dbgDetalle.Selected.Add('VALORDPAG'#9'3'#9'SEMT~ '#9'F');
   dbgDetalle.SetControlType('VALORDPAG', fctCheckBox,'S;N');
// Fin HPC_201703_CXP
   pnlCab.Enabled := False;
   pnlCab2.Enabled := False;
   pnlCab3.Enabled := False;
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = '' Then
   Begin
      pnlCab.Enabled := True;
      pnlCab1.Enabled := True;
      pnlCab2.Enabled := True;
      pnlCab3.Enabled := True;

      xSQL := 'select trunc(sysdate) FECHA from DUAL';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      DMCXP.cdsOPago.fieldByname('FECHA').AsDateTime := DMCXP.cdsQry.FieldByName('FECHA').AsDateTime;

   End;

   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'I' Then
   Begin
      pnlCab.Enabled := True;
      pnlCab1.Enabled := False;
      pnlCab2.Enabled := True;
      pnlCab3.Enabled := True;
      edtEstado.Text := 'INICIAL';
   End;

   pnlCnt.Enabled := True;
   If DMCXP.cdsOPago.fieldByname('USUCONTA').AsString <> '' Then
   Begin
      pnlCnt.Enabled := False;
   End;

   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'P' Then edtEstado.Text := 'ACEPTADO';
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'I' Then
   Begin
       //deshabilitar
       bbtnExporta.Enabled := false;
       bbtnPago.Enabled := false;
       bbtnContabiliza.Enabled := false;
       dbeNumPla.Enabled := false;
       dtpFechaCnt.Enabled := false;
       //habilitar
       bbtnGraba.Enabled := true;
       bbtnAcepta.Enabled := true;
       pnlCab2.Enabled := true;
   End;

   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'P' Then
   Begin
       //deshabilitar
       bbtnGraba.Enabled := false;
       bbtnAcepta.Enabled := false;
       bbtnContabiliza.Enabled := false;
       pnlCab2.Enabled := false;
       //habilitar
       bbtnPago.Enabled := true;
       dbeNumPla.Enabled := true;
       dtpFechaCnt.Enabled := true;
       bbtnExporta.Enabled := true;
   End;

   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'C' Then
   Begin
       //deshabilitar
       bbtnGraba.Enabled := false;
       bbtnAcepta.Enabled := false;
       bbtnPago.Enabled := false;
       pnlCab2.Enabled := false;
       dbeNumPla.Enabled := false;
       dtpFechaCnt.Enabled := false;
       //habilitar
       bbtnContabiliza.Enabled := true;
       bbtnExporta.Enabled := true;
   End;

   If ((DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'C') AND (DMCXP.cdsOPago.fieldByname('USUCONTA').AsString <> '')) Then
   Begin
       //deshabilitar
       bbtnGraba.Enabled := false;
       bbtnAcepta.Enabled := false;
       bbtnPago.Enabled := false;
       bbtnContabiliza.Enabled := false;
       dbeNumPla.Enabled := false;
       dtpFechaCnt.Enabled := false;
       bbtnExporta.Enabled := false;
       pnlCab2.Enabled := false;
   End;


   If ((DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'P')
        Or ((DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'C') AND (DMCXP.cdsOPago.fieldByname('USUCONTA').AsString = ''))
        Or ((DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'C') AND (DMCXP.cdsOPago.fieldByname('USUCONTA').AsString <> ''))
   ) Then
   Begin
       wwDBGrid1IButton.Enabled := false;
   End;
// Fin HPC_201707_CXP
   
// Inicio HPC_201504_CXP
   If (DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'C') AND (DMCXP.cdsOPago.fieldByname('USUCONTA').AsString = '') Then edtEstado.Text := 'CONFIRMADO';
   If (DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'C') AND (DMCXP.cdsOPago.fieldByname('USUCONTA').AsString <> '') Then edtEstado.Text := 'CONTABILIZADO';
// Fin HPC_201504_CXP
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then edtEstado.Text := 'ANULADO';

   edtBanco.Text := DMCXP.DisplayDescrip('TGE105', 'BancoNom', 'BancoId', dblcBanco.Text);
// Inicio HPC_201604_BCP
   wsBanco := DMCXP.cdsULTTGE.FieldByName('BANCOABR').AsString;
// Fin HPC_201604_BCP
   xSQL := 'CIAID=' + quotedstr(dblcCia.Text);
   edtCia.Text := BuscaQry('dspTGE', 'TGE101', 'CIAABR,CIARETIGV,EXOIGV', xSQL, 'CIAABR');
   xSQL := 'TMONID=' + '''' + dblcTMoneda.Text + '''';
   edtTMoneda.Text := BuscaQry('PrvTGE', 'TGE103', 'TMONDES, TMON_LOC', xSQL, 'TMONDES');

// Inicio HPC_201604_BCP
// Inicia rgOperación para ver si la Orden de Pago es por Abono en cuenta o Transferencia Interbancaria en base al archivo de Transf.Interbancarias
   xSQL := 'Select CIAID, NUMERO, CLAUXID, PROV, BANCOID, CCBCOID, USUREG, FECREG, USUMOD, FECMOD, CPFREG, '
      + '          CUENTAID, CCOSID, TMONID, CPMTOORI, CPMTOLOC, CPMTOEXT '
      + '     from CXP_ORD_PAG_TINT '
      + '    where CIAID ='+quotedstr(DMCXP.cdsOPago.FieldByname('CIAID').AsString)
      + '      and NUMERO='+quotedstr(DMCXP.cdsOPago.FieldByname('NUMERO').AsString);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;

   rgOperacion.OnClick := nil;
   rgOperacion.Enabled := False;
   if DMCXP.cdsQry.Recordcount=0 then
      rgOperacion.ItemIndex := 0
   else
      rgOperacion.ItemIndex := 1;
   rgOperacion.Enabled := True;
   rgOperacion.OnClick := rgOperacionClick;

// Fin HPC_201604_BCP

   xSQL := 'Select D.CIAID, D.NUMERO, D.ITEM, D.CLAUXID, D.AUXID, D.DOCID, D.CPSERIE, D.CPNODOC, D.TMONID, D.CPMTOORI, D.CPPAGORI, D.CPSALORI, D.IMPPAGO, D.IMPRETE, D.FREG, D.HREG, '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
         + '       D.CCOSID, '
// Fin HPC_201707_CXP
         +'        D.USUARIO, D.ESTADO, D.IMPDEVO, D.RQCIAID, D.RQORIGEN, D.NUMDETRAC, D.NUMCONSTA,'
         + '       C.CIAID, C.CPANOMES, C.TDIARID, C.CPNOREG, C.CLAUXID, C.PROV, C.PROVRUC, C.DOCID, C.CPSERIE, C.CPNODOC, C.CPFRECEP, C.CPFEMIS, C.CPFVCMTO, C.TMONID, C.CPTCAMPR, '
         + '       C.CPTCAMPA, C.CPESTADO, C.CPOCOMP, C.CP_CONTA, C.CPGRAVAD, C.CPNOGRAV, C.CPIGV, C.CPISC, C.CPDCTO, C.CPSERVIC, C.CPMTOORI, C.CPMTOLOC, C.CPMTOEXT, C.CPPAGORI, '
         + '       C.CPPAGLOC, C.CPPAGEXT, C.CPSALORI, C.CPSALLOC, C.CPSALEXT, C.TCANJEID, C.CPCANJE, C.CPFCANJE, C.CPUSER, C.CPFREG, C.CPHREG, C.CPAAAA, C.CPMM, C.CPDD, C.CPTRI, '
         + '       C.CPSEM, C.CPSS, C.CPAATRI, C.CPAASEM, C.CPAASS, C.CPFCMPRB, C.DCPLOTE, C.DCPCOMP, C.CTATOTAL, C.FLAGVAR, C.CPTOTOT, C.CPIGV2, C.CPGRAVAD2, C.CPHMOD, C.FLAGVAR2, '
         + '       C.PROVDES, C.CLAUXREND, C.AUXIDREND, C.CCBCOID, C.BANCOID, C.SITUAID, C.CPFLAGTDOC, C.CXPRRHH, C.AUXIDINTER, C.CLAUXINTER, C.CPTCAMDOL, C.PROVRETIGV, C.CPTCAMAJ, '
         + '       C.DTRPORC, C.CPMTOORIB, C.DTRFLAG, C.FECDEPDET, C.NUMDEPDET, C.ADQ_NO_GRAV, C.IGV_GRA_NO_DEST, C.CP_OTROS, C.CPTODETRSUNATID, C.TIPOOPERSUNATID, C.PORCDESC, '
// Inicio HPC_201703_CXP
// Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
         + '       C.CP4TAPENSION, C.SNPAFPID, C.TIPCOMAFPID, D.IMPOTRDTO, D.OBSERVA, D.CTAOTRDTO,D.VALORDPAG '
// Fin HPC_201703_CXP
         + '  from CXP_ORD_PAG_DET D '
         + ' INNER JOIN CXP301 C ON D.CLAUXID = C.CLAUXID AND D.AUXID=C.PROV AND D.DOCID = C.DOCID AND D.CPSERIE =C.CPSERIE and D.CPNODOC = C.CPNODOC '
         + ' where D.CIAID =''' + DMCXP.cdsOPago.FieldByname('CIAID').AsString + ''' '
         + '   and D.NUMERO=''' + DMCXP.cdsOPago.FieldByname('NUMERO').AsString + ''' '
         + '   and C.CPESTADO in (''C'',''P'') '
         + ' order by D.ITEM';
   DMCXP.cdsDetallePres.Close;
   DMCXP.cdsDetallePres.DataRequest(xSQL);
   DMCXP.cdsDetallePres.Open;   
   CargaDataSource;	 

// Inicio HPC_201705_CXP  
// Ajustes en Contabilización de Órdenes de Pago origen 53
   if DMCXP.cdsOPago.FieldByname('FECHA').AsDateTime>0 then
   Begin
      if DMCXP.cdsOPago.FieldByname('ESTADO').AsString='C' then
      begin
          dtpFechaCnt.date := DMCXP.cdsOPago.FieldByname('FECCONTA').AsDateTime;
          xTCambio := '0';
          xSQL := 'TMONID='+quotedstr(DMCXP.wTMonExt)+' and FECHA='+quotedstr(datetostr(dtpFechaCnt.date));
          If length(BuscaQry('PrvTGE', 'TGE107', 'TMONID, TCAM' + DMCXP.wVRN_TipoCambio, xSQL, 'TMONID')) > 0 Then
             xTCambio := FloatToStr(DMCXP.cdsQry.fieldbyname('TCAM' + DMCXP.wVRN_TipoCambio).AsFloat);
      end
      else
      begin
          xTCambio := '0';
          xSQL := 'TMONID='+quotedstr(DMCXP.wTMonExt)+' and FECHA='+quotedstr(datetostr(dtpFecha.date));
          If length(BuscaQry('PrvTGE', 'TGE107', 'TMONID, TCAM' + DMCXP.wVRN_TipoCambio, xSQL, 'TMONID')) > 0 Then
             xTCambio := FloatToStr(DMCXP.cdsQry.fieldbyname('TCAM' + DMCXP.wVRN_TipoCambio).AsFloat);
      end;

      If xTCambio = '0' Then
      Begin
         ShowMessage('Falta ingresar el Tipo de Cambio');
         dtpFecha.SetFocus;
         Exit;
      End;
   End;

// Fin HPC_201705_CXP

   //SumaGrid;

End;

Procedure TFOrdenPagoCab.dbgDetalleKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (Key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If DMCXP.cdsOPago.FieldByname('USUACEPTA').AsString <> '' Then
      Begin
         ShowMessage('No se Puede Eliminar detalle. Documento esta Aceptado');
         Exit;
      End;
      DMCXP.cdsDetallePres.Delete;
   End;
End;

Procedure TFOrdenPagoCab.bbtnExportaClick(Sender: TObject);
// Inicio HPC_201602_CXP
// 15/03/2016 DAF_2015001728_CXP_1 Variable xSQL para armar contenedor de Notas de Crédito
Var
   xSQL: String;
// Inicio HPC_201603_CXP
// variable que define si se encontró Cta de Banco del Proveedor
   xCtaBancoHallada : Boolean;
// Fin HPC_201603_CXP
// Fin HPC_201602_CXP
Begin
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago Esta Anulada');
      Exit;
   End;
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'I' Then
   Begin
      ShowMessage('Orden de Pago se encuentra en Estado Inicial');
      Exit;
   End;

// Inicio HPC_201603_CXP
// se realizará la Grabación sólo si todas las Cuentas de Bancos de Proveedores coinciden con datos de Cabecera
//   If Not sdGraba.Execute Then Exit;

   If DMCXP.cdsDetallePres.RecordCount > 0 Then
   Begin
   // Nota de Crédito disminuye importe del Total de la Orden de Pago
      xSQL := 'Select CIAID, DOCID, CLAUXID, PROV, CPSERIE, CPNODOC, CPNOREG, 0.00 DESCUENTO '
         +    '  from CXP301'
         +    ' where 1<>1';
      DMCXP.cdsQry3.Close;
      DMCXP.cdsQry3.DataRequest(xSQL);
      DMCXP.cdsQry3.Open;

      xCtaBancoHallada := True;

      DMCXP.cdsDetallePres.First;
   // DAF_2016001026_1 Verifica que Moneda y Banco de Cuenta de Banco del Proveedor coincidan con datos de Cabecera
      while not DMCXP.cdsDetallePres.EOF do
      Begin
         xSQL := 'Select PROV, CCBCOID, BANCOID, CLAUXID, CIAID, FPAGOID, TMONID, USUARIO, FECREG, DETRACCION, CODBCOCCI, CCBCODC '
               + '  from CAJA102 '
               + ' where CLAUXID='+quotedstr(DMCXP.cdsDetallePres.FieldByName('CLAUXID').AsString)
               + '   and PROV='+quotedstr(DMCXP.cdsDetallePres.FieldByName('AUXID').AsString)
               + '   and BANCOID='+quotedstr(dblcBanco.Text)
               + '   and TMONID='+quotedstr(dblcTMoneda.Text);
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;
         If DMCXP.cdsQry.RecordCount=0 then
         Begin
         // Inicio HPC_201604_CXP
         // Verifica que no tenga Forma de Pago <<Cheque de Gerencia>>
            xSQL := 'Select PROV, CCBCOID, BANCOID, CLAUXID, CIAID, FPAGOID, TMONID, USUARIO, FECREG, DETRACCION, CODBCOCCI, CCBCODC '
                  + '  from CAJA102 '
                  + ' where CLAUXID='+quotedstr(DMCXP.cdsDetallePres.FieldByName('CLAUXID').AsString)
                  + '   and PROV='+quotedstr(DMCXP.cdsDetallePres.FieldByName('AUXID').AsString)
                  + '   and FPAGOID=''CH'' ';
            DMCXP.cdsQry.Close;
            DMCXP.cdsQry.DataRequest(xSQL);
            DMCXP.cdsQry.Open;
            If DMCXP.cdsQry.RecordCount=0 then
            Begin
               ShowMessage('El Proveedor '
                          +DMCXP.cdsDetallePres.FieldByName('CLAUXID').AsString+'-'
                          +DMCXP.cdsDetallePres.FieldByName('AUXID').AsString+','
                          +' NO TIENE BANCO Y/O MONEDA definida en el Maestro de Proveedores');
               xCtaBancoHallada := False;
            End;
         // Fin HPC_201604_CXP
         End;

         if xCtaBancoHallada then
         Begin
            if DMCXP.cdsDetallePres.FieldByName('DOCID').AsString='07' then
            Begin
               DMCXP.cdsQry3.Append;
               DMCXP.cdsQry3.FieldByName('CIAID').AsString := DMCXP.cdsDetallePres.FieldByName('CIAID').AsString;
               DMCXP.cdsQry3.FieldByName('DOCID').AsString := DMCXP.cdsDetallePres.FieldByName('DOCID').AsString;
               DMCXP.cdsQry3.FieldByName('CLAUXID').AsString := DMCXP.cdsDetallePres.FieldByName('CLAUXID').AsString;
               DMCXP.cdsQry3.FieldByName('PROV').AsString := DMCXP.cdsDetallePres.FieldByName('AUXID').AsString;
               DMCXP.cdsQry3.FieldByName('CPSERIE').AsString := DMCXP.cdsDetallePres.FieldByName('CPSERIE').AsString;
               DMCXP.cdsQry3.FieldByName('CPNODOC').AsString := DMCXP.cdsDetallePres.FieldByName('CPNODOC').AsString;
               DMCXP.cdsQry3.FieldByName('CPNOREG').AsString := DMCXP.cdsDetallePres.FieldByName('CPNOREG').AsString;
               DMCXP.cdsQry3.FieldByName('DESCUENTO').AsFloat := DMCXP.cdsDetallePres.FieldByName('IMPPAGO').AsFloat;
               DMCXP.cdsQry3.Post;
               DMCXP.cdsDetallePres.Delete;
            End
            Else
               DMCXP.cdsDetallePres.Next;
         End
         Else
            DMCXP.cdsDetallePres.Next;
      End;

      if xCtaBancoHallada then
      Begin
         DMCXP.cdsQry3.First;
         while not DMCXP.cdsQry3.EOF do
         Begin
         // Busca relación de Nota de Crédito en archivo de Detalle de Nota de Crédito
         // 30/06/2016  DAF_2015001728_CXP_2 incluye Estado de la Cuenta por Pagar
            {
            xSQL := 'Select DOCID, CPSERIE, CPNODOC '
               +    '  from CXP304 '
               +    ' where CIAID='+quotedstr(DMCXP.cdsQry3.FieldByName('CIAID').AsString)
               +    '   and TCANJEID=''NC'' '
               +    '   and CCPCANJE=(Select CPCANJE '
               +    '                   from CXP301 '
               +    '                  where CIAID='+quotedstr(DMCXP.cdsQry3.FieldByName('CIAID').AsString)
               +    '                    and CLAUXID='+quotedstr(DMCXP.cdsQry3.FieldByName('CLAUXID').AsString)
               +    '                    and DOCID=''07'' '
               +    '                    and PROV='+quotedstr(DMCXP.cdsQry3.FieldByName('PROV').AsString)
               +    '                    and CPSERIE='+quotedstr(DMCXP.cdsQry3.FieldByName('CPSERIE').AsString)
               +    '                    and CPNODOC='+quotedstr(DMCXP.cdsQry3.FieldByName('CPNODOC').AsString)+')';
            }
            xSQL := 'Select DOCID, CPSERIE, CPNODOC '
               +    '  from CXP304 '
               +    ' where CIAID='+quotedstr(DMCXP.cdsQry3.FieldByName('CIAID').AsString)
               +    '   and TCANJEID=''NC'' '
               +    '   and CCPCANJE=(Select CPCANJE '
               +    '                   from CXP301 '
               +    '                  where CIAID='+quotedstr(DMCXP.cdsQry3.FieldByName('CIAID').AsString)
               +    '                    and CLAUXID='+quotedstr(DMCXP.cdsQry3.FieldByName('CLAUXID').AsString)
               +    '                    and DOCID=''07'' '
               +    '                    and PROV='+quotedstr(DMCXP.cdsQry3.FieldByName('PROV').AsString)
               +    '                    and CPSERIE='+quotedstr(DMCXP.cdsQry3.FieldByName('CPSERIE').AsString)
               +    '                    and CPNODOC='+quotedstr(DMCXP.cdsQry3.FieldByName('CPNODOC').AsString)
               +    '                    and CPESTADO in (''C'',''P''))';
            DMCXP.cdsQry.Close;
            DMCXP.cdsQry.DataRequest(xSQL);
            DMCXP.cdsQry.Open;
            if DMCXP.cdsQry.RecordCount>0 then
            Begin
               while not DMCXP.cdsQry.EOF do
               Begin
                  If DMCXP.cdsDetallePres.Locate('CIAID;DOCID;CLAUXID;AUXID;CPSERIE;CPNODOC',
                       VarArrayOf([DMCXP.cdsQry3.FieldByName('CIAID').AsString,
                                  DMCXP.cdsQry.FieldByName('DOCID').AsString,
                                  DMCXP.cdsQry3.FieldByName('CLAUXID').AsString,
                                  DMCXP.cdsQry3.FieldByName('PROV').AsString,
                                  DMCXP.cdsQry.FieldByName('CPSERIE').AsString,
                                  DMCXP.cdsQry.FieldByName('CPNODOC').AsString]),
                                 [loCaseInsensitive]) Then
                  Begin
                     DMCXP.cdsDetallePres.Edit;
                     DMCXP.cdsDetallePres.FieldByName('IMPOTRDTO').AsFloat :=
                                   DMCXP.cdsQry3.FieldByName('DESCUENTO').AsFloat;
                     DMCXP.cdsDetallePres.FieldByName('IMPPAGO').AsFloat :=
                           DMCXP.cdsDetallePres.FieldByName('IMPPAGO').AsFloat
                          +DMCXP.cdsQry3.FieldByName('DESCUENTO').AsFloat;
                     DMCXP.cdsDetallePres.Post;
                  End;
                  DMCXP.cdsQry.Next;
               End;
            End
            Else
            Begin
               If DMCXP.cdsDetallePres.Locate('CIAID;DOCID;CLAUXID;AUXID',
                   VarArrayOf([DMCXP.cdsQry3.FieldByName('CIAID').AsString,
                               DMCXP.cdsQry3.FieldByName('DOCID').AsString,
                               DMCXP.cdsQry3.FieldByName('CLAUXID').AsString,
                               DMCXP.cdsQry3.FieldByName('PROV').AsString]),
                              [loCaseInsensitive]) Then
               Begin
                  DMCXP.cdsDetallePres.Edit;
                  DMCXP.cdsDetallePres.FieldByName('IMPOTRDTO').AsFloat :=
                                DMCXP.cdsQry3.FieldByName('DESCUENTO').AsFloat;
                  DMCXP.cdsDetallePres.FieldByName('IMPPAGO').AsFloat :=
                        DMCXP.cdsDetallePres.FieldByName('IMPPAGO').AsFloat
                       +DMCXP.cdsQry3.FieldByName('DESCUENTO').AsFloat;
                  DMCXP.cdsDetallePres.Post;
               End;
            End;
            DMCXP.cdsQry3.Next;
         End;

         If Not sdGraba.Execute Then Exit;

         if DMCXP.cdsOPago.fieldByname('BANCOID').AsString = '05' then
            GrabaTextoBBVA(DMCXP.dsDetallePres, sdGraba.FileName, ',')
         Else
            GrabaTexto(DMCXP.dsDetallePres, sdGraba.FileName, ',');

      End;
   // Fin HPC_201603_CXP
   End
   Else
   Begin
      ShowMessage('No existe detalle para generar archivo de Texto');
   End;
End;

Procedure TFOrdenPagoCab.GrabaTexto(Datos: TDatasource; Fichero: String; Delimitador: char);
Var
   f: textfile;
   n, i: integer;
   Linea, Entero, Decimal, Cuenta, Importe, Punto, xSQL, Ruc, xCtaCte, xTmpC, xTM, xfec, xNom, xTipD: String;
   xTDoc, xNoDoc, xRuc, xRef, xDir, xDis, xPro, xDep, xContacto, xCtl, xReg: String;
   nTotal: Double;
Begin
   xCtl := SumaCuentas;

   If xCtl = '' Then
   Begin
      Exit;
   End;

   AssignFile(f, Fichero);
   Rewrite(f);

// Cabecera
//         1         2         3         4         5         6         7         8         9        10        11
//12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
//# P 12345678901234567890  1234567890123  ddmmaaaa                    123456789012345      9               1
// 1 C                    S/             12        12345678901234567890               123456 123456789012345

   If Length(dblcCCBco.Text) = 16 Then
   Begin
      //194-0625508-0-61
      xTmpC := StringReplace(dblcCCBco.Text, '-', '', [rfReplaceAll]);
      xCtaCte := Copy(xTmpC, 1, 3) + '0' + Copy(xTmpC, 4, 13) + '      ';
   End;
   If Length(dblcCCBco.Text) = 17 Then
   Begin
      //194-04238403-0-14
      xTmpC := StringReplace(dblcCCBco.Text, '-', '', [rfReplaceAll]);
      xCtaCte := xTmpC + '      ';
   End;

   Importe := FormatFloat('######.#0', DMCXP.cdsOPago.FieldByname('MONPAG').AsCurrency);
   Entero := Copy(StrZero(Importe, 16), 1, 13);
   Decimal := Copy(StrZero(Importe, 16), 15, 2);

   If dblcTMoneda.text = 'N' Then
      xTM := 'S/'
   Else
      xTM := 'US';

   xfec := StringReplace(dtpFecha.text, '/', '', [rfReplaceAll]);
   xfec := StringReplace(xFec, '-', '', [rfReplaceAll]);
   xfec := StringReplace(xFec, '-', '', [rfReplaceAll]);
   xRef := Copy(DMCXP.cdsOPago.FieldByname('OBSERVA').AsString + '                    ', 1, 20);
   xReg := RightStr('000000' + Trim(IntToStr(Datos.DataSet.RecordCount)), 6);

   Linea := '#1PC' + xCtaCte + xTM + Entero + Decimal + xFec + xRef + xCtl + xReg + '9' + '               ' + '0';

   Memo1.Lines.Add(Linea);
   writeln(f, Linea);

   With Datos.DataSet Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         xSQL := 'Select * '
               + '  from TGE201 '
               + ' where CLAUXID=''' + Datos.DataSet.FieldByName('CLAUXID').AsString + ''' '
               + '   and PROV=''' + Datos.DataSet.FieldByName('AUXID').AsString + '''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.indexfieldnames := '';
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;

      // Inicio HPC_201603_CXP
      // 01/07/2016  DAF_2015001591_CXP_1 Asigna Banco y Moneda en Archivo de Exportación de acuerdo a Datos de Cabecera
         {
         xSQL := 'Select * '
               + '  from CAJA102 '
               + ' where CLAUXID=''' + Datos.DataSet.FieldByName('CLAUXID').AsString + ''' '
               + '   and PROV=''' + Datos.DataSet.FieldByName('AUXID').AsString + ''' '
               + '   and CIAID=''' + dblcCia.Text + '''';
         }
         xSQL := 'Select PROV, CCBCOID, BANCOID, CLAUXID, CIAID, FPAGOID, TMONID, USUARIO, FECREG, DETRACCION, CODBCOCCI, CCBCODC '
               + '  from CAJA102 '
               + ' where CLAUXID='+quotedstr(Datos.DataSet.FieldByName('CLAUXID').AsString)
               + '   and PROV='+quotedstr(Datos.DataSet.FieldByName('AUXID').AsString)
      //         + '   and CIAID='+quotedstr(dblcCia.Text)
               + '   and BANCOID='+quotedstr(dblcBanco.Text)
               + '   and TMONID='+quotedstr(dblcTMoneda.Text);
      // Fin HPC_201603_CXP
         DMCXP.cdsQry2.Close;
         DMCXP.cdsQry2.indexfieldnames := '';
         DMCXP.cdsQry2.DataRequest(xSQL);
         DMCXP.cdsQry2.Open;

// Detalle
//         1         2         3         4         5         6         7         8         9        10        11        12        13        14        15        16        17        18        19        20        21        22        23        24        25        26        27        28        29
//12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
// 2 12345678901234567890                                        S/               RUC            F          1                                        0 1                                        12345678901234567890                    12345678901234567890
//  C                    1234567890123456789012345678901234567890  123456789012345   123456789012 1234567890 1234567890123456789012345678901234567890 0 1234567890123456789012345678901234567890                    12345678901234567890                    1234567890123456789012345678901234567890

         Linea := ' 2';

         If DMCXP.cdsQry2.FieldByname('FPAGOID').AsString = 'AB' Then
         Begin
            xCtaCte := '';
            xTmpC := '';
            If Length(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString) = 16 Then
            Begin
              //194-0625508-0-61   -- 13
               xTmpC := StringReplace(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString, '-', '', [rfReplaceAll]);
               xCtaCte := Copy('2C' + Copy(xTmpC, 1, 3) + '0' + Copy(xTmpC, 4, 13) + '                       ', 1, 22);
            End;
            If Length(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString) = 17 Then
            Begin
              //194-04238403-0-14     -- 14
               xTmpC := StringReplace(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString, '-', '', [rfReplaceAll]);
               xCtaCte := Copy('2A' + xTmpC + '                       ', 1, 22);
            End;
            If Length(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString) <= 15 Then
            Begin
               ShowMessage('Error en Cuenta de ' + DMCXP.cdsQry.FieldByName('PROVDES').AsString);
               CloseFile(f);
               Exit;
            End;
         End
         Else
         Begin
            xCtaCte := Copy('0G' + '                          ', 1, 22);
         End;

         If DMCXP.cdsQry.FieldByname('TIPPERID').AsString = '02' Then
         Begin
            xTipD := 'RUC';
            xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVRUC').AsString) + '            ', 1, 12);
         End
         Else
         Begin
            If Copy(DMCXP.cdsQry.FieldByName('PROVRUC').AsString, 1, 2) = '10' Then
            Begin
               xTipD := 'RUC';
               xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVRUC').AsString) + '            ', 1, 12);
            End
            Else
            Begin
               xTipD := '   ';
               If DMCXP.cdsQry.FieldByname('TIPDOCID').AsString = '01' Then xTipD := 'DNI';
               If DMCXP.cdsQry.FieldByname('TIPDOCID').AsString = '04' Then xTipD := 'CE ';
               If DMCXP.cdsQry.FieldByname('TIPDOCID').AsString = '07' Then xTipD := 'PAS';
               xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVDNI').AsString) + '            ', 1, 12);
            End;
         End;

         xNom := Copy(DMCXP.cdsQry.FieldByName('PROVDES').AsString + '                                        ', 1, 40);
         Importe := FormatFloat('######.#0', Datos.DataSet.FieldByName('IMPPAGO').AsCurrency);
         Entero := Copy(StrZero(Importe, 16), 1, 13);
         Decimal := Copy(StrZero(Importe, 16), 15, 2);

         //INICIO HPC_201705_CXP
         // Se incluye nuevo documento 69 para la condición
         If (Datos.DataSet.FieldByName('DOCID').AsString = '01') Or // Factura por pagar
            (Datos.DataSet.FieldByName('DOCID').AsString = '02') Or // Recibo por Honorario
            (Datos.DataSet.FieldByName('DOCID').AsString = '03') Or // Boleta de venta
            (Datos.DataSet.FieldByName('DOCID').AsString = '05') Or // Boleto Aviacion
            (Datos.DataSet.FieldByName('DOCID').AsString = '14') Or // Recibo de Servicio Publico
            (Datos.DataSet.FieldByName('DOCID').AsString = '16') Or // Boleto Transporte
            (Datos.DataSet.FieldByName('DOCID').AsString = '19') Or // Boleto espectaculo publico
            (Datos.DataSet.FieldByName('DOCID').AsString = '12') Or // Ticket de Maquina registradora
            (Datos.DataSet.FieldByName('DOCID').AsString = '69') Then //Nuevo documento 69 para la condicion
         //FIN HPC_201705_CXP
            xTDoc := 'F'
         Else
         Begin
            If Datos.DataSet.FieldByName('DOCID').AsString = '07' Then
               xTDoc := 'N'
            Else
               xTDoc := 'D';
         End;
         If DMCXP.cdsQry.FieldByname('FPAGOID').AsString = 'CH' Then
            xTDoc := 'F';

         xNoDoc := RightStr('0000000000' + Datos.DataSet.FieldByName('CPSERIE').AsString + Datos.DataSet.FieldByName('CPNODOC').AsString, 10);

         xRef := Copy('REFERENCIA                                          ', 1, 40);
         xDir := Copy(DMCXP.cdsQry.FieldByname('PROVDIR').AsString + '                                                     ', 1, 40);

         xSQL := 'SELECT * FROM TGE147 '
               + ' WHERE UBIGEOID=''' + DMCXP.cdsQry.FieldByname('DPTOID').AsString
                                      + DMCXP.cdsQry.FieldByname('CIUDID').AsString
                                      + DMCXP.cdsQry.FieldByname('PROVCZIP').AsString + '''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;

         xDis := Copy(DMCXP.cdsQry.FieldByname('UBIGEODIST').AsString + '                       ', 1, 20);
         xPro := Copy(DMCXP.cdsQry.FieldByname('UBIGEOPROV').AsString + '                       ', 1, 20);
         xDep := Copy(DMCXP.cdsQry.FieldByname('UBIGEODPTO').AsString + '                       ', 1, 20);
         xContacto := Copy('                                                   ', 1, 40);

         Linea := ' ' + xCtaCte + xNom + xTM + Entero + Decimal + xTipD + xRuc + xTDoc + xNoDoc + '1' + xRef + '0' + '0' + '0' + xDir + xDis + xPro + xDep + xContacto;

         Memo1.Lines.Add(Linea);
         writeln(f, Linea);
         Next;
      End;
      EnableControls;
   End;

   CloseFile(f);
   MessageDlg(' Diskette Se Grabo Con Exito ', mtInformation, [mbOk], 0);
End;

Procedure TFOrdenPagoCab.GrabaTextoBBVA(Datos: TDatasource; Fichero: String; Delimitador: char);
Var
   f: textfile;
   n, i: integer;
   Linea, Entero, Decimal, Cuenta, Importe, Punto, xSQL, Ruc, xCtaCte, xTmpC, xTM, xfec, xNom, xTipD: String;
   xTDoc, xNoDoc, xRuc, xRef, xDir, xContacto, xCtl, xReg: String;
   xTproc, xFecProc, xHorProc, xValPerte, xBlanco: String;
   nTotal: Double;
   xTipAbon, xAbonAgr, xIndavi, xMedavi,xIndProc,xDescrip,xFiller: String;
// Inicio HPC_201601_CXP
// Se añaden variables para controlar Agencia, NroCuenta, Digito de Control para exportacion de archivo BBVA
   xBcoAge, xNroCta, xDigCtr: String;
// Fin HPC_201601_CXP
Begin
   xCtl := SumaCuentasBBVA;

   If xCtl = '' Then
   Begin
      Exit;
   End;

   AssignFile(f, Fichero);
   Rewrite(f);

// Cabecera
//         1         2         3         4         5         6         7         8         9        10        11
//12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
//# P 12345678901234567890  1234567890123  ddmmaaaa                    123456789012345      9               1
// 1 C                    S/             12        12345678901234567890               123456 123456789012345

// Inicio HPC_201504_CXP
   {
   If Length(dblcCCBco.Text) = 20 Then
   Begin
      xTmpC := StringReplace(dblcCCBco.Text, '-', '', [rfReplaceAll]);
      xCtaCte := Copy(xTmpC, 1, 4) + Copy(xTmpC, 5, 4) + Copy(xTmpC, 9, 2) + '000'+Copy(xTmpC, 11, 17);
   End;
   }
   if copy(dblcCCBco.Text,1,4)<>'0011' then
      xCtaCte := '00110'+StringReplace(dblcCCBco.Text, '-', '', [rfReplaceAll])
   else
      xCtaCte := StringReplace(dblcCCBco.Text, '-', '', [rfReplaceAll]);
   xCtaCte := copy(xCtaCte+'                    ',1,20);
// Fin HPC_201504_CXP

   Importe := FormatFloat('######.#0', DMCXP.cdsOPago.FieldByname('MONPAG').AsCurrency);
   Entero := Copy(StrZero(Importe, 16), 1, 13);
   Decimal := Copy(StrZero(Importe, 16), 15, 2);

   If dblcTMoneda.text = 'N' Then
      xTM := 'PEN'
   Else
      xTM := 'USD';

   xfec := StringReplace(dtpFecha.text, '/', '', [rfReplaceAll]);
   xfec := StringReplace(xFec, '-', '', [rfReplaceAll]);
   xfec := StringReplace(xFec, '-', '', [rfReplaceAll]);
   xRef := Copy(DMCXP.cdsOPago.FieldByname('OBSERVA').AsString + '                         ', 1, 25);
   xFecProc:= '        ';
   xHorProc:= ' ';
   xTproc:= 'A';
   xReg := RightStr('000000' + Trim(IntToStr(Datos.DataSet.RecordCount)), 6);
   xValPerte:= 'S';
          //                 1         1         1         1         1         1
          // 8     9         0         1         2         3         4         5
          // 45678901234567890123456789012345678901234567890123456789012345678901
   xBlanco:='000000000000000000                                                  ';
   Linea := '750' + xCtaCte + xTM + Entero + Decimal + xTproc + xFecProc + xHorProc + xRef + xReg + xValPerte + xBlanco;

   Memo1.Lines.Add(Linea);
   writeln(f, Linea);

   Datos.DataSet.DisableControls;
   Datos.DataSet.First;
   While Not Datos.DataSet.Eof Do
   Begin
      xSQL := 'Select PROV, PROVDES, PROVABR, TIPPERID, PROVAPEPAT, PROVAPEMAT, '
            + '       PROVNOMBRE, PROVDNI, PROVRUC, PROVEXONER, PROVGIRA, PAISID, '
            + '       PROVDIR, PROVCZIP, PROVTELF, PROVFAX, PROVEMAI, PROVREPR, '
            + '       PROVSALL, PROVSALE, CLAUXID, DPTOID, CIUDID, GIROID, CLASIFID, '
            + '       SECECOID, PROVLUGPAG, PROVCOMMIN, PROVCOMMAX, PROVEMAIL, '
            + '       PROVUFMOV, ACTXOC, PROVNOMCOM, PROVRETIGV, USERID, FREG, HREG, '
            + '       PROVNOMBRE1, TIPDIARID, PROV_PROC, EQUPROOFI, CENCOSOFI, ACTIVO, '
            + '       SEXO, FECNAC, TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, MZADOMIC, '
            + '       LOTEDOMIC, TIPZONAID, NOMZONA, REFDOMIC, ESDOMIC, TIPDOCID, '
            + '       CONVDOBTRI, FPAGOID, TIPLOCID, USOLOCID, PERADM, PERPRO, PEREXT, '
            + '       FECEXON4TA, SNPAFPID, TIPCOMAFPID '
            + '  from TGE201 '
            + ' where CLAUXID=''' + Datos.DataSet.FieldByName('CLAUXID').AsString + ''' '
            + '   and PROV=''' + Datos.DataSet.FieldByName('AUXID').AsString + '''';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.indexfieldnames := '';
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;

   // Inicio HPC_201601_CXP
   // Se apertura dataset para tomar los datos de las cuentas bancarias del BBVA de los proveedores

   // Inicio HPC_201603_CXP
   // 01/07/2016  DAF_2015001591_CXP_1 Asigna Banco y Moneda en Archivo de Exportación de acuerdo a Datos de Cabecera
      {
      xSQL := 'Select PROV, CCBCOID, BANCOID, CLAUXID, CIAID, FPAGOID, TMONID, '
            + '       USUARIO, FECREG, DETRACCION, CODBCOCCI, CCBCODC '
            + '  from CAJA102 '
            + ' where CLAUXID=''' + Datos.DataSet.FieldByName('CLAUXID').AsString + ''' '
            + '   and PROV=''' + Datos.DataSet.FieldByName('AUXID').AsString + ''' '
            + '   and BANCOID='''+'05'+ ''' '
            + '   and CIAID=''' + dblcCia.Text + '''';
      }
      xSQL := 'Select PROV, CCBCOID, BANCOID, CLAUXID, CIAID, FPAGOID, TMONID, USUARIO, FECREG, DETRACCION, CODBCOCCI, CCBCODC '
            + '  from CAJA102 '
            + ' where CLAUXID='+quotedstr(Datos.DataSet.FieldByName('CLAUXID').AsString)
            + '   and PROV='+quotedstr(Datos.DataSet.FieldByName('AUXID').AsString)
   //         + '   and CIAID='+quotedstr(dblcCia.Text)
            + '   and BANCOID='+quotedstr(dblcBanco.Text)
            + '   and TMONID='+quotedstr(dblcTMoneda.Text);
   // Fin HPC_201603_CXP

   // Fin HPC_201601_CXP
      DMCXP.cdsQry2.Close;
      DMCXP.cdsQry2.indexfieldnames := '';
      DMCXP.cdsQry2.DataRequest(xSQL);
      DMCXP.cdsQry2.Open;

// Detalle
//         1         2         3         4         5         6         7         8         9        10        11        12        13        14        15        16        17        18        19        20        21        22        23        24        25        26        27        28        29
//12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
// 2 12345678901234567890                                        S/               RUC            F          1                                        0 1                                        12345678901234567890                    12345678901234567890
//  C                    1234567890123456789012345678901234567890  123456789012345   123456789012 1234567890 1234567890123456789012345678901234567890 0 1234567890123456789012345678901234567890                    12345678901234567890                    1234567890123456789012345678901234567890

      Linea := ' 2';

      If DMCXP.cdsQry2.FieldByname('BANCOID').AsString = '05' Then
      Begin
         xTipAbon:= 'P';
         If DMCXP.cdsQry2.FieldByname('FPAGOID').AsString = 'AB' Then
         Begin
         // Inicio HPC_201504_CXP
            if Length(trim(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString)) > 0 Then
            //If Length(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString) = 20 Then
            Begin
            // Inicio HPC_201601_CXP
            // Ajustes en la forma de armar Cuenta Bancaria para Exportar BBVA
               xCtaCte := DMCXP.cdsQry2.FieldByname('CCBCOID').AsString ;
               xBcoAge := copy(xCtaCte,1,8);
               xNroCta := copy(xCtaCte,9,18);
               if  (DMCXP.cdsQry2.FieldByname('CCBCODC').isNull)  Or
                   (DMCXP.cdsQry2.FieldByname('CCBCODC').AsString = '') Then
                   xDigCtr := '00'
               else
                   xDigCtr := DMCXP.cdsQry2.FieldByname('CCBCODC').AsString;

               xCtaCte := xBcoAge + xDigCtr + xNroCta ;

              // CtaCte := Copy(xTmpC, 1, 3) + '0' + Copy(xTmpC, 4, 13) + '      ';

              // if copy(dblcCCBco.Text,1,4)<>'0011' then
              //    xCtaCte := '0011'+StringReplace(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString, '-', '', [rfReplaceAll])
              // else
              //    xCtaCte := StringReplace(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString, '-', '', [rfReplaceAll]);
              // xCtaCte := Copy(trim(xCtaCte) + '                    ', 1, 20);
            // Fin HPC_201601_CXP               
            end
            else
            begin
               ShowMessage('El proveedor no tiene la cuenta de banco con el formato correcto ' + DMCXP.cdsQry.FieldByName('PROVDES').AsString +Chr(13)+
               'Si es tipo de abono cuenta propia el formato es el siguiente 0011xxxxDCnnnnnnnnnn' +Chr(13)+
               'Donde'+Chr(13)+
               'xxxx = Oficina' +Chr(13)+
               'DC, dígitos de control, si no los conoce informar "00" ' +Chr(13)+
               ' ' +Chr(13)+
               'nnnnnnnnnn = Núm. de cuenta ');
               CloseFile(f);
               Exit;
            End;
         // Fin HPC_201504_CXP
         End;
      end
      else if Length(DMCXP.cdsQry2.FieldByname('BANCOID').AsString) = 2 Then
      begin
         xTipAbon:= 'I';
         If Length(DMCXP.cdsQry2.FieldByname('CODBCOCCI').AsString) = 20 Then
         Begin
            xCtaCte := Copy(DMCXP.cdsQry2.FieldByname('CODBCOCCI').AsString + '                    ',1,20);
         end
         else
         begin
            ShowMessage('El proveedor no tiene la cuenta Interbancario CCI con el formato correcto ' + DMCXP.cdsQry.FieldByName('PROVDES').AsString) ;
            CloseFile(f);
            Exit;
         End;
      end
      else
      begin
         xTipAbon:= 'O';
         xCtaCte := '                    ';
      End;

      If DMCXP.cdsQry.FieldByname('TIPPERID').AsString = '01' Then
      Begin
         xTipD := 'L';
      // Inicio HPC_201504_CXP
         xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVDNI').AsString) + '            ', 1, 12);
      // Fin HPC_201504_CXP
      End
      Else If DMCXP.cdsQry.FieldByname('TIPPERID').AsString = '02' Then
      Begin
         xTipD := 'R';
         xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVRUC').AsString) + '            ', 1, 12);
      End
      Else
      Begin
         If Copy(DMCXP.cdsQry.FieldByName('PROVRUC').AsString, 1, 2) = '10' Then
         Begin
            xTipD := 'R';
            xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVRUC').AsString) + '            ', 1, 12);
         End
         Else
         Begin
            xTipD := '   ';
            If DMCXP.cdsQry.FieldByname('TIPDOCID').AsString = '01' Then xTipD := 'L';
            If DMCXP.cdsQry.FieldByname('TIPDOCID').AsString = '04' Then xTipD := 'E';
            If DMCXP.cdsQry.FieldByname('TIPDOCID').AsString = '07' Then xTipD := 'P';
            xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVDNI').AsString) + '            ', 1, 12);
         End;
      End;

      xNom := Copy(DMCXP.cdsQry.FieldByName('PROVDES').AsString + '                                        ', 1, 40);
      Importe := FormatFloat('######.#0', Datos.DataSet.FieldByName('IMPPAGO').AsCurrency);
      Entero := Copy(StrZero(Importe, 16), 1, 13);
      Decimal := Copy(StrZero(Importe, 16), 15, 2);

      If (Datos.DataSet.FieldByName('DOCID').AsString = '01') Or // Factura por pagar
         (Datos.DataSet.FieldByName('DOCID').AsString = '02') Or // Recibo por Honorario
//           (Datos.DataSet.FieldByName('DOCID').AsString = '03') Or // Boleta de venta
         (Datos.DataSet.FieldByName('DOCID').AsString = '05') Or // Boleto Aviacion
         (Datos.DataSet.FieldByName('DOCID').AsString = '14') Or // Recibo de Servicio Publico
         (Datos.DataSet.FieldByName('DOCID').AsString = '16') Or // Boleto Transporte
         (Datos.DataSet.FieldByName('DOCID').AsString = '19') Or // Boleto espectaculo publico
         (Datos.DataSet.FieldByName('DOCID').AsString = '12') Then // Ticket de Maquina registradora
         xTDoc := 'F'
      Else
      Begin
         If Datos.DataSet.FieldByName('DOCID').AsString = '07' Then
            xTDoc := 'N'
         Else
            xTDoc := 'B';
      End;
      If DMCXP.cdsQry.FieldByname('FPAGOID').AsString = 'CH' Then
         xTDoc := 'F';

      xNoDoc := LeftStr(Datos.DataSet.FieldByName('CPSERIE').AsString + Datos.DataSet.FieldByName('CPNODOC').AsString+ '            ', 12);
      xAbonAgr:= 'N';
      xRef := Copy('REFERENCIA                                          ', 1, 40);
      xDir := Copy(DMCXP.cdsQry.FieldByname('PROVDIR').AsString + '                                                     ', 1, 40);
      xIndavi:= ' ';
      xMedavi := Copy('                                                    ', 1, 50);
      xContacto := Copy('                                                   ', 1, 30);
      xIndProc := '  ';
    // Inicio HPC_201504_CXP
//      xDescrip := Copy('                                                   ', 1, 30);
      //          2 2         2         2         2         2
      //          2 3         4         5         6         7
      //          89012345678901234567890123456789012345678901234567
      xFiller := '00000000000000000000000000000000                  ';
//      Linea := '002' + xTipD + xRuc + xTipAbon + xCtaCte + xNom + Entero + Decimal + xTDoc + xNoDoc + xAbonAgr + xRef + xIndavi + xMedavi + xContacto + xDescrip + xFiller;
      Linea := '002' + xTipD + xRuc + xTipAbon + xCtaCte + xNom + Entero + Decimal + xTDoc + xNoDoc + xAbonAgr + xRef + xIndavi + xMedavi + xContacto + xFiller;
    // Fin HPC_201504_CXP
      Memo1.Lines.Add(Linea);
      writeln(f, Linea);
      Datos.DataSet.Next;
   End;
   Datos.DataSet.EnableControls;

   CloseFile(f);
   MessageDlg(' Diskette se grabó con éxito ', mtInformation, [mbOk], 0);
End;

Function TFOrdenPagoCab.SumaCuentasBBVA: String;
Var
   nTotal: Double;
   xSQL, xTmpC, xCtaCte: String;
Begin
   nTotal := 0;
   DMCXP.cdsDetallePres.First;
   While Not DMCXP.cdsDetallePres.Eof Do
   Begin
      xSQL := 'Select PROV, PROVDES, PROVABR, TIPPERID, PROVAPEPAT, PROVAPEMAT, '
            + '       PROVNOMBRE, PROVDNI, PROVRUC, PROVEXONER, PROVGIRA, PAISID, '
            + '       PROVDIR, PROVCZIP, PROVTELF, PROVFAX, PROVEMAI, PROVREPR, '
            + '       PROVSALL, PROVSALE, CLAUXID, DPTOID, CIUDID, GIROID, CLASIFID, '
            + '       SECECOID, PROVLUGPAG, PROVCOMMIN, PROVCOMMAX, PROVEMAIL, '
            + '       PROVUFMOV, ACTXOC, PROVNOMCOM, PROVRETIGV, USERID, FREG, HREG, '
            + '       PROVNOMBRE1, TIPDIARID, PROV_PROC, EQUPROOFI, CENCOSOFI, ACTIVO, '
            + '       SEXO, FECNAC, TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, MZADOMIC, '
            + '       LOTEDOMIC, TIPZONAID, NOMZONA, REFDOMIC, ESDOMIC, TIPDOCID, '
            + '       CONVDOBTRI, FPAGOID, TIPLOCID, USOLOCID, PERADM, PERPRO, PEREXT, '
            + '       FECEXON4TA, SNPAFPID, TIPCOMAFPID '
            + '  from TGE201 '
            + ' where CLAUXID=''' + DMCXP.cdsDetallePres.FieldByName('CLAUXID').AsString + ''' '
            + '   and PROV=''' + DMCXP.cdsDetallePres.FieldByName('AUXID').AsString + '''';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.indexfieldnames := '';
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;

      xSQL := 'Select PROV, CCBCOID, BANCOID, CLAUXID, CIAID, FPAGOID, TMONID, '
            + '       USUARIO, FECREG, DETRACCION, CODBCOCCI '
            + '  from CAJA102 '
            + ' where CLAUXID=''' + DMCXP.cdsDetallePres.FieldByName('CLAUXID').AsString + ''' '
            + '   and PROV=''' + DMCXP.cdsDetallePres.FieldByName('AUXID').AsString + ''' '
            + '   and CIAID=''' + dblcCia.Text + '''';
      DMCXP.cdsQry2.Close;
      DMCXP.cdsQry2.indexfieldnames := '';
      DMCXP.cdsQry2.DataRequest(xSQL);
      DMCXP.cdsQry2.Open;

      nTotal := nTotal + 1;

      DMCXP.cdsDetallePres.Next;
   End;

   If nTotal > 0 Then
      Result := RightStr('00000000000000' + Trim(FloatToStr(nTotal)), 15)
   Else
      Result := RightStr('000000000000000', 15);
End;

Function TFOrdenPagoCab.SumaCuentas: String;
Var
   nTotal: Double;
   xSQL, xTmpC, xCtaCte: String;
Begin
   nTotal := 0;
   DMCXP.cdsDetallePres.First;
   While Not DMCXP.cdsDetallePres.Eof Do
   Begin
      xSQL := 'Select * FROM TGE201 '
            + ' where CLAUXID=''' + DMCXP.cdsDetallePres.FieldByName('CLAUXID').AsString + ''' '
            + '   and PROV=''' + DMCXP.cdsDetallePres.FieldByName('AUXID').AsString + '''';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.indexfieldnames := '';
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;

   // Inicio HPC_201603_CXP
   // 01/07/2016  DAF_2015001591_CXP_1 Asigna Banco y Moneda en Archivo de Exportación de acuerdo a Datos de Cabecera
      {
      xSQL := 'Select * FROM CAJA102 '
            + ' where CLAUXID=''' + DMCXP.cdsDetallePres.FieldByName('CLAUXID').AsString + ''' '
            + '   and PROV=''' + DMCXP.cdsDetallePres.FieldByName('AUXID').AsString + ''' '
            + '   and CIAID=''' + dblcCia.Text + '''';
      }
      xSQL := 'Select PROV, CCBCOID, BANCOID, CLAUXID, CIAID, FPAGOID, TMONID, USUARIO, FECREG, DETRACCION, CODBCOCCI, CCBCODC '
            + '  from CAJA102 '
            + ' where CLAUXID='+quotedstr(DMCXP.cdsDetallePres.FieldByName('CLAUXID').AsString)
            + '   and PROV='+quotedstr(DMCXP.cdsDetallePres.FieldByName('AUXID').AsString)
   //         + '   and CIAID='+quotedstr(dblcCia.Text)
            + '   and BANCOID='+quotedstr(dblcBanco.Text)
            + '   and TMONID='+quotedstr(dblcTMoneda.Text);
   // Fin HPC_201603_CXP
      
      DMCXP.cdsQry2.Close;
      DMCXP.cdsQry2.indexfieldnames := '';
      DMCXP.cdsQry2.DataRequest(xSQL);
      DMCXP.cdsQry2.Open;

   // Inicio HPC_201604_CXP
   // Verifica que no tenga Forma de Pago <<Cheque de Gerencia>>
      If DMCXP.cdsQry2.RecordCount=0 then
      Begin
         xSQL := 'Select PROV, CCBCOID, BANCOID, CLAUXID, CIAID, FPAGOID, TMONID, USUARIO, FECREG, DETRACCION, CODBCOCCI, CCBCODC '
               + '  from CAJA102 '
               + ' where CLAUXID='+quotedstr(DMCXP.cdsDetallePres.FieldByName('CLAUXID').AsString)
               + '   and PROV='+quotedstr(DMCXP.cdsDetallePres.FieldByName('AUXID').AsString)
               + '   and FPAGOID=''CH'' ';
         DMCXP.cdsQry2.Close;
         DMCXP.cdsQry2.DataRequest(xSQL);
         DMCXP.cdsQry2.Open;
      End;
   // Fin HPC_201604_CXP

      If DMCXP.cdsQry2.FieldByname('FPAGOID').AsString = 'AB' Then
      Begin
         If Length(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString) = 16 Then
         Begin
              //194-0625508-0-61
            xTmpC := StringReplace(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString, '-', '', [rfReplaceAll]);
            xTmpC := '00' + Copy(xTmpC, 4, 10);
         End;
         If Length(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString) = 17 Then
         Begin
              //194-04238403-0-14
            xTmpC := StringReplace(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString, '-', '', [rfReplaceAll]);
            xTmpC := '0' + Copy(xTmpC, 4, 11);
         End;
         If xTmpC = '' Then
         Begin
            ShowMessage('Error en Datos del Proveedor ' + Trim(DMCXP.cdsQry.FieldByname('PROV').AsString) + ' - ' + Trim(DMCXP.cdsQry.FieldByname('PROVDES').AsString) + ', RUC ' + Trim(DMCXP.cdsQry.FieldByname('PROVRUC').AsString) + ',  Cta.Cte.:' + DMCXP.cdsQry2.FieldByname('CCBCOID').AsString);
            Break;
         End;
      End
      Else
      Begin
         If DMCXP.cdsQry2.FieldByname('FPAGOID').AsString = 'CH' Then
         Begin
            If DMCXP.cdsQry.FieldByName('PROVRUC').AsString <> '' Then
               xTmpC := Copy('0' + Trim(DMCXP.cdsQry.FieldByName('PROVRUC').AsString), 1, 12)
            Else
               xTmpC := Copy('00000000' + Trim(DMCXP.cdsQry.FieldByName('PROVDNI').AsString), 1, 12)
         End
         Else
         Begin
            ShowMessage('Error en Datos del Proveedor ' + Trim(DMCXP.cdsQry.FieldByname('PROV').AsString) + ' - ' + Trim(DMCXP.cdsQry.FieldByname('PROVDES').AsString) + ', RUC ' + Trim(DMCXP.cdsQry.FieldByname('PROVRUC').AsString) + ',  Cta.Cte.:' + DMCXP.cdsQry2.FieldByname('CCBCOID').AsString);
            Break;
         End;
      End;

      nTotal := nTotal + StrToFloat(xTmpC);

      DMCXP.cdsDetallePres.Next;
   End;

   If nTotal > 0 Then
      Result := RightStr('00000000000000' + Trim(FloatToStr(nTotal)), 15)
   Else
      Result := RightStr('000000000000000', 15);
End;

Procedure TFOrdenPagoCab.dblcCiaExit(Sender: TObject);
Var
   xWhere: String;
Begin
// Inicio HPC_201602_CXP
// Añade RUC en los campos que devuelve la consulta d ela Compañía
   xWhere := 'CIAID=' + quotedstr(dblcCia.Text);
   edtCia.Text := BuscaQry('dspTGE', 'TGE101', 'CIAABR,CIARETIGV,EXOIGV,CIARUC', xWhere, 'CIAABR');
   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Error en código de Compañía');
      dblcCia.SetFocus;
   End;
   wCiaRUC := DMCXP.cdsQry.FieldByName('CIARUC').AsString;
// Fin HPC_201602_CXP
End;

Procedure TFOrdenPagoCab.dblcTMonedaExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If trim(dblcTMoneda.Text) = '' Then Exit;

   Screen.Cursor := crHourGlass;
   xWhere := 'TMONID=' + '''' + dblcTMoneda.Text + '''';
   edtTMoneda.Text := BuscaQry('PrvTGE', 'TGE103', 'TMONDES, TMON_LOC', xWhere, 'TMONDES');
   Screen.Cursor := crDefault;

   If length(edtTMoneda.Text) = 0 Then
   Begin
      ShowMessage('Error en Tipo de Moneda');
      dblcTMoneda.SetFocus;
   End;
End;

Procedure TFOrdenPagoCab.bbtnAceptaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'P' Then
   Begin
      ShowMessage('Orden de Pago se encuentra Aceptada');
      Exit;
   End;
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago Esta Anulada');
      Exit;
   End;

// Inicio HPC_201604_CXP
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'C' Then
   Begin
      ShowMessage('Orden de Pago ya se encuentra CONFIRMADA');
      Exit;
   End;
   If DMCXP.cdsOPago.fieldByname('USUCONTA').AsString <> '' Then
   Begin
      ShowMessage('Orden de Pago ya fue contabilizada');
      Exit;
   End;
// Fin HPC_201604_CXP

   If dblcBanco.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar la Banco');
      Exit;
   End;
   If dblcCCBco.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar la Cuenta Corriente');
      Exit;
   End;
   If Length(Trim(dblcCCBco.Text)) < 15 Then
   Begin
      ShowMessage('Debe Ingresar Correctamente la Cuenta Corriente');
      Exit;
   End;
   If fg_validaCierreContable(dtpFecha.Date) = True Then
   Begin
      ShowMessage(' Mes Cerrado Contablemente!!!, No se puede Registrar');
      Exit;
   End;
   If MessageDlg('¿ Aceptar Orden de Pago ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;
   // Inicio HPC_201703_CXP
   // Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
   If ValidaOPSEMT() Then
   Begin
      ShowMessage('Se debe validar a todos los proveedores al SEMT');

      Exit;
   End;
   // Fin HPC_201703_CXP
   If DMCXP.cdsOPago.fieldByname('NUMERO').AsString = '' Then
      ShowMessage('Error al Grabar')
   Else
   Begin
      DMCXP.cdsOPago.Edit;
      DMCXP.cdsOPago.fieldByname('ESTADO').AsString := 'P';
      DMCXP.cdsOPago.fieldByname('USUACEPTA').AsString := DMCXP.wUsuario;
      DMCXP.cdsOPago.fieldByname('FECACEPTA').AsDateTime := DATE;
      DMCXP.cdsOPago.fieldByname('MODULO').AsString := 'TLC';
      SumaGrid;
      DMCXP.cdsOPago.Post;

      xSQL := 'Update CXP_ORD_PAG_CAB '
             +'   set ESTADO='+quotedstr('P')+', '
             +'       BANCOID='+quotedstr(dblcBanco.Text)+', '
             +'       CCBCOID='+quotedstr(dblcCCBco.Text)+', '
             +'       USUACEPTA='+quotedstr(DMCXP.wUsuario)+', '
             +'       MONPAG='+quotedstr(DMCXP.cdsOPago.fieldByname('MONPAG').AsString) +', '
             +'       FECACEPTA= trunc(sysdate), '
             +'       MODULO='+quotedstr('TLC')
             +' where CIAID='+quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
             +'   and NUMERO='+quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en la Aceptación de la Orden de Pago');
         Exit;
      End;
   //   CreaRetenciones;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'P' Then
      Begin
         edtEstado.Text := 'ACEPTADO';
         wwDBGrid1IButton.Enabled := false;
         //deshabilitar
         bbtnGraba.Enabled := false;
         bbtnAcepta.Enabled := false;
         bbtnContabiliza.Enabled := false;
         pnlCab2.Enabled := false;
         //habilitar
         bbtnPago.Enabled := true;
         dbeNumPla.Enabled := true;
         dtpFechaCnt.Enabled := true;
         bbtnExporta.Enabled := true;

      End;
// Fin HPC_201707_CXP

      pnlCab.Enabled := False;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      //pnlCab2.Enabled := False;
// Fin HPC_201707_CXP
      ShowMessage('Aceptada');
   End;

End;

Procedure TFOrdenPagoCab.dblcBancoExit(Sender: TObject);
Var
   xSQL: String;
Begin
// Inicio HPC_201604_BCP
//   edtBanco.Text := DMCXP.DisplayDescrip('TGE105', 'BancoNom', 'BancoId', dblcBanco.Text);
   edtBanco.Text := DMCXP.DisplayDescrip('TGE105', 'BANCONOM', 'BANCOID', dblcBanco.Text);
   wsBanco := DMCXP.cdsULTTGE.FieldByName('BANCOABR').AsString;
// Fin HPC_201604_BCP

   If length(edtBanco.Text) > 0 Then
   Begin
      xSQL := 'Select CIAID, BANCOID, CCBCOID '
            + '  from TGE106 '
            + ' where CIAID=''02'' '
            + '   and BANCOID='+quotedstr(dblcBanco.Text)
            + '   and TMONID='+quotedstr(dblcTMoneda.Text)
            + '   and CUEEMICHE=''A'' ';
      DMCXP.cdsCCBco.Close;
      DMCXP.cdsCCBco.DataRequest(xSQL);
      DMCXP.cdsCCBco.Open;
      dblcCCBco.Enabled := true;
   End;
End;

Procedure TFOrdenPagoCab.bbtnContabilizaClick(Sender: TObject);
Var
// Inicio HPC_201604_CXP
//   xSQL, xNoComp, xPeriodo, xOrigen, xLote, xTCambio, xCta166, xCta466, xWhere, xCiaAbr: String;
   xSQL, xNoComp, xPeriodo, xOrigen, xLote, xCta166, xCta466, xWhere, xCiaAbr, xGlosa, xSQL1, xSQL2, xSQL3: String;
// Fin HPC_201604_CXP
   xSQLDESC : String;
Begin
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago Esta Anulada');
      Exit;
   End;
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString <> 'C' Then
   Begin
      ShowMessage('Orden de Pago no está CONFIRMADA');
      Exit;
   End;

   If Not ValidaUsuarioCNT(DMCXP.wUsuario) Then
   Begin
   // Inicio HPC_201602_CXP
   // corrige palabra Area por Área
      ShowMessage('La Contabilización de la Orden de Pago, solo la deben realizar los Usuarios del Área de Contabilidad');
   // Fin HPC_201602_CXP
      Exit;
   End;

   If DMCXP.cdsOPago.fieldByname('USUCONTA').AsString <> '' Then
   Begin
      ShowMessage('Orden de Pago ya fue contabilizada');
      Exit;
   End;

   // Se cambia la fecha de Contabilización
   //If fg_validaCierreContable(dtpFecha.Date) = True Then
   If fg_validaCierreContable(dtpFechaCnt.Date) = True Then
   Begin
      ShowMessage(' Mes Cerrado Contablemente!!!, No se puede Registrar');
      Exit;
   End;
   ValidaRetenciones;

   xWhere := 'CIAID=' + quotedstr(dblcCia.Text);
   xCiaAbr := BuscaQry('dspTGE', 'TGE101', 'CIAABR,CIARETIGV,EXOIGV', xWhere, 'CIAABR');
   xOrigen := '53';
   // Se cambia la fecha de Contabilización
   xPeriodo := Copy(dtpFechaCnt.text, 7, 4) + Copy(dtpFechaCnt.text, 4, 2);
   xLote := Copy(dbeNumero.Text, 3, 4);
   xTCambio := '0';
   xWhere := 'TMONID=''' + DMCXP.wTMonExt + ''' and FECHA=''' + dtpFechaCnt.text + '''';
   If length(BuscaQry('PrvTGE', 'TGE107', '*', xWhere, 'TMONID')) > 0 Then
      xTCambio := FloatToStr(DMCXP.cdsQry.fieldbyname('TCAM' + DMCXP.wVRN_TipoCambio).AsFloat);
   If xTCambio = '0' Then
   Begin
      ShowMessage('Falta ingresar el Tipo de Cambio');
      Exit;
   End;
   If fg_Valida_AsientoContable(DMCXP.cdsOPago.fieldByname('CIAID').AsString,
      DMCXP.cdsOPago.fieldByname('NUMERO').AsString, xOrigen) = False Then
   Begin
      Exit;
   End;

// Inicio HPC_201504_CXP
   sumaGrid;
   If (DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'C')
      and (DMCXP.cdsOPago.fieldByname('USUCONTA').AsString = '')
      and (DMCXP.cdsOPago.fieldByname('NUMOPE').AsString = '') Then
   Begin
      ShowMessage('Indique primero el Número de Operación');
      fg_HabilitaPanelConstancia;
      Exit;
   End;
// Fin HPC_201504_CXP

   If MessageDlg('¿ Contabilizar Orden de Pago ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCXP.DCOM1.AppServer.IniciaTransaccion;

   // Inicio HPC_201604_CXP

      ///////////////////////////////////////////////
      //  ASIENTO EN COMPAÑIA DE LA ORDEN DE PAGO  //
      ///////////////////////////////////////////////

      xSQL := 'Select lpad(to_char(nvl(max(CNTCOMPROB),0)+1),10,''0'') NOCOMP '
         + '     from CNT300 '
         + '    where CIAID='+quotedstr(dblcCia.Text)
         + '      and CNTANOMM='+quotedstr(xPeriodo)
         + '      and TDIARID='+quotedstr(xOrigen);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.indexfieldnames := '';
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      xNoComp := DMCXP.cdsQry.FieldByName('NOCOMP').AsString;

      xSQL := ' Select CTADEBE, B.CTA_AUX AUX_D, B.CTA_CCOS CCOS_D, CTAHABER, C.CTA_AUX AUX_H, C.CTA_CCOS CCOS_H, TDIARID, '
         + '           CIAORIGEN, TDIARID2 '
         + '      from CAJA103 A, TGE202 B, TGE202 C '
         + '     where A.CIAID='+quotedstr(dblcCia.Text)
         + '       and B.CIAID=A.CIAID AND A.CTADEBE=B.CUENTAID '
         + '       and C.CIAID=A.CIAID AND A.CTAHABER=C.CUENTAID ';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      xCta166 := DMCXP.cdsQry.FieldByName('CTADEBE').AsString;
      xCta466 := DMCXP.cdsQry.FieldByName('CTAHABER').AsString;

      If xCta466 = '' Then
      Begin
         xSQL := 'Select CTAPRINC '
            + '     From TGE106 '
            + '    Where CIAID=''02'' '
            + '      and BANCOID='+quotedstr(DMCXP.cdsOPago.FieldByname('BANCOID').AsString)
            + '      and CCBCOID='+quotedstr(DMCXP.cdsOPago.FieldByname('CCBCOID').AsString);
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;
         xCta466 := DMCXP.cdsQry.FieldByName('CTAPRINC').AsString;
      End;

   // cabecera
// Inicio HPC_201701_CXP
// 20/04/2017  Se ha modificado para que contabilice y coloque el Número de Operación en la columna de Numero
//de Documento y en la glosa de la cabecera y detalle del asiento se le está retirando el número de operación
//    xGlosa := 'OP:' + DMCXP.cdsOPago.FieldByname('NUMOPE').AsString+'/PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString + '-' + wsBanco;
      xGlosa := 'PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString + '-' + wsBanco;
// Fin HPC_201701_CXP
      if length(xGlosa)>50 then xGlosa := copy(xGlosa,1,50);
      xSQL := 'Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
            + '                    CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
            + '                    CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
            + '                    CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, '
            + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
            + '                    CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
            + 'Select A.CIAID, ''' + xOrigen + ''', ''' + xNoComp + ''', '
            + '       ''' + xPeriodo + ''', ''' + xLote + ''', '+quotedstr(xGlosa)+ ', '+xTCambio+ ', ''' + dtpFechaCnt.text + ''', '
            + '       ''I'', ''N'', NULL, ''' + DMCXP.wUsuario + ''', trunc(SYSDATE), SYSDATE, b.fecano , b.fecmes, b.fecdia, '
            + '       b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, A.TMONID,  NULL, NULL, NULL, TDIARDES, '
            + '       CASE WHEN A.TMONID=''N'' THEN IMPPAGO ELSE round(IMPPAGO*' + xTCambio + ',2) END, CASE WHEN A.TMONID=''D'' THEN IMPPAGO ELSE round(IMPPAGO/' + xTCambio + ',2) END, '
            + '       CASE WHEN A.TMONID=''N'' THEN IMPPAGO ELSE round(IMPPAGO*' + xTCambio + ',2) END, CASE WHEN A.TMONID=''D'' THEN IMPPAGO ELSE round(IMPPAGO/' + xTCambio + ',2) END, '
            + '       0, 0, NULL, ''CXP'', ''CXP'' '
            + '  from CXP_ORD_PAG_CAB A, TGE114 B, TGE104 C, '
            + '  (SELECT CIAID,NUMERO, (SUM(IMPPAGO) + SUM(nvl(impotrdto,0))) IMPPAGO FROM CXP_ORD_PAG_DET WHERE CIAID='+quotedstr(dblcCia.Text)+' AND NUMERO ='+quotedstr(dbeNumero.text)+' GROUP BY CIAID, NUMERO) F '
            + ' where A.CIAID='+quotedstr(dblcCia.Text)
            + '   and A.NUMERO='+quotedstr(dbeNumero.text)
            + '   and F.CIAID=A.CIAID and F.NUMERO=A.NUMERO '
            + '   and A.FECHA=B.FECHA '
            + '   and C.TDIARID='+quotedstr(xOrigen);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Error en la Grabación de la Cabecera Contable');
         Exit;
      End;

      xSQL := 'INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
            + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
            + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
            + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
            + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
            + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
            + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
            + 'Select A.CIAID, ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , B.FECANO, ''' + xPeriodo + ''', ''' + xLote + ''', D.CTATOTAL, D.CLAUXID, PROV, '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            //+ '       D.DOCID, D.CPSERIE, D.CPNODOC, SUBSTR(D.PROVDES,1,40), case when A.IMPPAGO<0 then ''H'' else ''D'' END, NULL, ' + xTCambio + ', '

            + '       D.DOCID, D.CPSERIE, D.CPNODOC, SUBSTR(D.PROVDES,1,40), case when A.IMPPAGO<0 then ''H'' else ''D'' END, CASE WHEN E.CTA_CCOS = ''S'' THEN A.CCOSID ELSE NULL END CCOSID, ' + xTCambio + ', '
// Fin HPC_201707_CXP
            + '       ABS(case when impotrdto is null then imppago else impotrdto + imppago end) IMPPAGO, '
            + '       ABS(CASE WHEN A.TMONID=''N'' THEN ABS(case when impotrdto is null then imppago else impotrdto + imppago end) ELSE round((case when impotrdto is null then imppago else impotrdto + imppago end) * ' + xTCambio + ',2) END), '
            + '       ABS(CASE WHEN A.TMONID=''D'' THEN A.IMPPAGO ELSE round((case when impotrdto is null then imppago else impotrdto + imppago end)/' + xTCambio + ',2) END), '
            + '       D.CPFEMIS, D.CPFVCMTO, ''' + DMCXP.cdsOPago.FieldByname('FECCONTA').AsString + ''', ''I'', ''N'', ''N'', ''' + DMCXP.wUsuario + ''', '
            + '       trunc(SYSDATE), SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, '
            + '       A.TMONID, NULL, NULL, NULL, C.TDIARDES, E.CTAABR, SUBSTR(D.PROVDES,1,15), F.DOCABR, NULL, '
            + '       case when A.IMPPAGO>=0 then CASE WHEN A.TMONID=''N'' THEN case when impotrdto is null then imppago else impotrdto + imppago end ELSE round(case when impotrdto is null then imppago else impotrdto + imppago end *' + xTCambio + ',2) END ELSE 0 END, '
            + '       case when A.IMPPAGO>=0 then CASE WHEN A.TMONID=''D'' THEN case when impotrdto is null then imppago else impotrdto + imppago end ELSE round(case when impotrdto is null then imppago else impotrdto + imppago end /' + xTCambio + ',2) END ELSE 0 END, '
            + '       case when A.IMPPAGO<0 then ABS(CASE WHEN A.TMONID=''N'' THEN case when impotrdto is null then imppago else impotrdto + imppago end ELSE round(case when impotrdto is null then imppago else impotrdto + imppago end *2.825,2) END) ELSE 0 END, '
            + '       case when A.IMPPAGO<0 then ABS(CASE WHEN A.TMONID=''D'' THEN case when impotrdto is null then imppago else impotrdto + imppago end ELSE round(case when impotrdto is null then imppago else impotrdto + imppago end /2.825,2) END) ELSE 0 END, '
            + '       0, 0, NULL, NULL, NULL, ''CXP'', ROWNUM, ''CXP'', NULL '
            + '  from CXP_ORD_PAG_DET A, CXP301 D, TGE114 B, TGE104 C, TGE202 E, TGE110 F '
            + ' where A.CIAID=''' + DMCXP.cdsOPago.FieldByname('CIAID').AsString + ''' AND A.NUMERO=''' + DMCXP.cdsOPago.FieldByname('NUMERO').AsString + ''' '
            + '   and A.CIAID=D.CIAID(+) AND A.CLAUXID=D.CLAUXID AND A.AUXID=D.PROV '
            + '   and A.DOCID=D.DOCID(+) AND NVL(A.CPSERIE,''0'')=NVL(D.CPSERIE,''0'') AND A.CPNODOC=D.CPNODOC(+) '
            + '   and D.CPESTADO IN (''P'',''C'') '
            + '   and B.FECHA(+)=''' + DMCXP.cdsOPago.FieldByname('FECCONTA').AsString + ''' '
            + '   and C.TDIARID(+)=''' + xOrigen + ''' '
            + '   and A.CIAID=E.CIAID AND D.CTATOTAL=E.CUENTAID '
            + '   and A.DOCID=F.DOCID '
            + ' order BY A.ITEM ';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Error en la Grabación 1 del Detalle Contable');
         Exit;
      End;

   // DETALLE 2
// Inicio HPC_201701_CXP
// 20/04/2017  Se ha modificado para que contabilice y coloque el Número de Operación en la columna de Numero
//de Documento y en la glosa de la cabecera y detalle del asiento se le está retirando el número de operación

//    xGlosa := 'OP:' + DMCXP.cdsOPago.FieldByname('NUMOPE').AsString+'/PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString + '-' + wsBanco;
      xGlosa := 'PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString + '-' + wsBanco;
// Fin HPC_201701_CXP
      if length(xGlosa)>40 then xGlosa := copy(xGlosa,1,40);
      {
      xSQL := 'INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
            + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
            + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
            + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
            + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
            + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
            + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
            + 'Select A.CIAID, ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , b.fecano, ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCta466 + ''', NULL, NULL, '
            + '       ''21'', ''OP'','+DMCXP.cdsOPago.FieldByname('NUMOPE').AsString+','
          //  + ' ''OP'', ''' + DMCXP.cdsOPago.FieldByname('NUMOPE').AsString + ''', ''' + DMCXP.cdsOPago.FieldByname('NUMOPE').AsString + ' - ABONO EN CUENTA'', '
            +         quotedstr(xGlosa) + ', '
            + '       ''H'', NULL, ' + xTCambio + ', '
            + '       (F.IMPPAGO), '
//            + '       CASE WHEN A.TMONID=''N'' THEN (A.IMPPAGO+A.IMPOTRDTO) ELSE round((A.IMPPAGO+A.IMPOTRDTO)*' + xTCambio + ',2) END, '
//            + '       CASE WHEN A.TMONID=''D'' THEN (A.IMPPAGO+A.IMPOTRDTO) ELSE round((A.IMPPAGO+A.IMPOTRDTO)/' + xTCambio + ',2) END, '
            + '       CASE WHEN A.TMONID=''N'' THEN IMPPAGO ELSE round(IMPPAGO*' + xTCambio + ',2) END, '
            + '       CASE WHEN A.TMONID=''D'' THEN IMPPAGO ELSE round(IMPPAGO/' + xTCambio + ',2) END, '
            + '       ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''' + dtpFechaCnt.text + ''', ''I'', ''N'', ''N'', '
            + '       ''' + DMCXP.wUsuario + ''', '
            + '       trunc(SYSDATE), SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, '
            + '       A.TMONID, NULL, NULL, NULL, C.TDIARDES, E.CTAABR, NULL, ''A Cuenta'', NULL, 0, 0, '
//            + '       CASE WHEN A.TMONID=''N'' THEN (A.IMPPAGO+A.IMPOTRDTO) ELSE round((A.IMPPAGO+A.IMPOTRDTO)*' + xTCambio + ',2) END, '
//            + '       CASE WHEN A.TMONID=''D'' THEN (A.IMPPAGO+A.IMPOTRDTO) ELSE round((A.IMPPAGO+A.IMPOTRDTO)/' + xTCambio + ',2) END, '
            + '       CASE WHEN A.TMONID=''N'' THEN IMPPAGO ELSE round(IMPPAGO*' + xTCambio + ',2) END, '
            + '       CASE WHEN A.TMONID=''D'' THEN IMPPAGO ELSE round(IMPPAGO/' + xTCambio + ',2) END, '
            + '       0, 0, NULL, NULL, '
            + '       NULL, ''CXP'', ' + IntToStr(DMCXP.cdsDetallePres.RecordCount + 1) + ', ''CXP'', NULL '
            + '  from CXP_ORD_PAG_CAB A, TGE106 D, TGE114 B, TGE104 C, TGE202 E, '
            + '  (SELECT CIAID,NUMERO, (SUM(IMPPAGO) + SUM(impotrdto)) IMPPAGO FROM CXP_ORD_PAG_DET WHERE CIAID='+quotedstr(dblcCia.Text)+' AND NUMERO ='+quotedstr(dbeNumero.text)+' GROUP BY CIAID, NUMERO) F '
            + ' where A.CIAID='+quotedstr(dblcCia.Text)
            + '   and A.NUMERO='+quotedstr(dbeNumero.text)
            + '   and A.CIAID=A.CIAID and F.NUMERO=A.NUMERO '
            + '   and B.FECHA(+)='+quotedstr(dtpFechaCnt.text)
            + '   and C.TDIARID(+)='+quotedstr(xOrigen)
            + '   and D.CIAID=''02'' and D.BANCOID=A.BANCOID and D.CCBCOID=A.CCBCOID '
            + '   and A.CIAID=E.CIAID '
            + '   and E.CUENTAID='+quotedstr(xCta466);
      }

   // Si Cia='02' Importe + Comisión -- Cuenta 104xxxx
   // Si Cia<>'02' Importe -- Cuenta 466xx
      xSQL1 := 'Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
            + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
            + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
            + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
            + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
            + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
            + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
            + 'Select A.CIAID, '+ quotedstr(xOrigen) + ' TDIARID, ' + quotedstr(xNoComp) + ' CNTCOMPROB, B.FECANO CNTANO, '
            +         quotedstr(xPeriodo) + ' CNTANOMM, ' + quotedstr(xLote) + ' CNTLOTE, ' + quotedstr(xCta466) + ' CUENTAID, '
            + '       NULL CLAUXID, NULL AUXID, ''21'' DOCID, ''OP'' CNTSERIE, '
            +         quotedstr(DMCXP.cdsOPago.FieldByname('NUMOPE').AsString)+' CNTNODOC, '
            +         quotedstr(xGlosa) + ' CNTGLOSA, '
            + '       ''H'' CNTDH, NULL CCOSID, ' + xTCambio + ' CNTTCAMBIO, ';

         If dblcCia.Text = '02' Then
         Begin
            xSQL1 := xSQL1 + ' (F.IMPPAGO+nvl(COMIS_CCI,0)) CNTMTOORI, '
            + '       CASE WHEN A.TMONID=''N'' THEN (IMPPAGO+nvl(COMIS_CCI,0)) ELSE round((IMPPAGO+nvl(COMIS_CCI,0))*' + xTCambio + ',2) END CNTMTOLOC, '
            + '       CASE WHEN A.TMONID=''D'' THEN (IMPPAGO+nvl(COMIS_CCI,0)) ELSE round((IMPPAGO+nvl(COMIS_CCI,0))/' + xTCambio + ',2) END CNTMTOEXT, '
         End
         Else
         Begin
            xSQL1 := xSQL1 + ' F.IMPPAGO CNTMTOORI, '
            + '       CASE WHEN A.TMONID=''N'' THEN (IMPPAGO) ELSE round((IMPPAGO)*' + xTCambio + ',2) END CNTMTOLOC, '
            + '       CASE WHEN A.TMONID=''D'' THEN (IMPPAGO) ELSE round((IMPPAGO)/' + xTCambio + ',2) END CNTMTOEXT, '
         End;

         xSQL1 := xSQL1
// Inicio HPC_201705_CXP
// Ajustes en Contabilización de Órdenes de Pago origen 53
            +         quotedstr(datetostr(dtpFechacnt.date)) + ' CNTFEMIS, '
            +         quotedstr(datetostr(dtpFechacnt.date)) + ' CNTFVCMTO, '
// Fin HPC_201705_CXP
            +         quotedstr(datetostr(dtpFechaCnt.date)) + ' CNTFCOMP, '
            + '       ''I'' CNTESTADO, ''N'' CNTCUADRE, ''N'' CNTFAUTOM, '   + quotedstr(DMCXP.wUsuario) + ' CNTUSER, '
            + '       trunc(SYSDATE) CNTFREG, SYSDATE CNTHREG, B.FECMES CNTMM, B.FECDIA CNTDD, B.FECTRIM CNTTRI, B.FECSEM CNTSEM, '
            + '       B.FECSS CNTSS, B.FECAATRI CNTAATRI, B.FECAASEM CNTAASEM, B.FECAASS CNTAASS, '
            + '       A.TMONID, NULL FLAGVAR, NULL FCONS, NULL CNTFMEC, C.TDIARDES, E.CTAABR CTADES, NULL AUXDES, ''A Cuenta'' DOCDES, ';

         If dblcCia.Text = '02' Then
         Begin
            xSQL1 := xSQL1 + '       NULL CCOSDES, 0.00 CNTDEBEMN, 0.00 CNTDEBEME, '
            + '       CASE WHEN A.TMONID=''N'' THEN (IMPPAGO + nvl(COMIS_CCI, 0)) ELSE round((IMPPAGO + nvl(COMIS_CCI,0))*' + xTCambio + ',2) END CNTHABEMN, '
            + '       CASE WHEN A.TMONID=''D'' THEN (IMPPAGO + nvl(COMIS_CCI, 0)) ELSE round((IMPPAGO + nvl(COMIS_CCI,0))/' + xTCambio + ',2) END CNTHABEME, ';
         End
         Else
         Begin
            xSQL1 := xSQL1 + '       NULL CCOSDES, 0.00 CNTDEBEMN, 0.00 CNTDEBEME, '
            + '       CASE WHEN A.TMONID=''N'' THEN (IMPPAGO) ELSE round((IMPPAGO)*' + xTCambio + ',2) END CNTHABEMN, '
            + '       CASE WHEN A.TMONID=''D'' THEN (IMPPAGO) ELSE round((IMPPAGO)/' + xTCambio + ',2) END CNTHABEME, ';
         End;

         xSQL1 := xSQL1
            + '       0 CNTSALDMN, 0 CNTSALDME, NULL CAMPOVAR, NULL CNTTS, NULL CNTPAGADO,'
            + '       ''CXP'' CNTMODDOC, ' + IntToStr(DMCXP.cdsDetallePres.RecordCount + 1) + ' CNTREG, ''CXP'' MODULO, NULL VTA_SECU '
            + '  from CXP_ORD_PAG_CAB A, TGE106 D, TGE114 B, TGE104 C, TGE202 E, '
            + '      (Select CIAID,NUMERO, sum(IMPPAGO) IMPPAGO '
            + '         from CXP_ORD_PAG_DET '
            + '        where CIAID='+quotedstr(dblcCia.Text)
            + '          and NUMERO ='+quotedstr(dbeNumero.text)
            + '        group by CIAID, NUMERO) F ';

         If dblcCia.Text = '02' Then
         Begin
            xSQL1 := xSQL1 + ', (Select CIAID, NUMERO, CPMTOORI COMIS_CCI '
            + '         from CXP_ORD_PAG_TINT '
            + '        where CIAID = '+quotedstr(dblcCia.Text)
            + '          and NUMERO = '+quotedstr(dbeNumero.text)+') G '
         End;

         xSQL1 := xSQL1
            + ' where A.CIAID='+quotedstr(dblcCia.Text)
            + '   and A.NUMERO='+quotedstr(dbeNumero.text)
            + '   and F.CIAID=A.CIAID and F.NUMERO=A.NUMERO '
            + '   and B.FECHA(+)='+quotedstr(dtpFechaCnt.text)
            + '   and C.TDIARID(+)='+quotedstr(xOrigen)
            + '   and D.CIAID=''02'' and D.BANCOID=A.BANCOID and D.CCBCOID=A.CCBCOID '
            + '   and A.CIAID=E.CIAID '
            + '   and E.CUENTAID='+quotedstr(xCta466)
            + '   and F.CIAID(+)=A.CIAID and F.NUMERO(+)=A.NUMERO ';

         If dblcCia.Text = '02' Then
         Begin
            xSQL1 := xSQL1 + '   and G.CIAID(+)=A.CIAID and G.NUMERO(+)=A.NUMERO ';
         End;

   // Otros descuentos
// Inicio HPC_201701_CXP
// 27/04/2017 Se ha modificado para que valide el Plan de Cuenta para otros descuentos en la contabilización de
//                             Ordenes de Pago

      xSQL2 := ' union all '
            + 'Select A.CIAID, '+ quotedstr(xOrigen) + ' TDIARID, '+ quotedstr(xNoComp) + ' CNTCOMPROB, '
            + '       B.FECANO CNTANO, '+ quotedstr(xPeriodo)+' CNTANOMM, '+ quotedstr(xLote) + ' CNTLOTE, '
            + '       A.CTAOTRDTO CUENTAID, '
            + '       CASE WHEN G.CTA_AUX=''S'' THEN A.CLAUXID ELSE NULL END CLAUXID, CASE WHEN G.CTA_AUX=''S'' THEN A.AUXID ELSE NULL END AUXID, '
            + '       ''21'' DOCID, ''OP'' CNTSERIE, '+quotedstr(DMCXP.cdsOPago.FieldByname('NUMOPE').AsString)+' CNTNODOC, '
            +         quotedstr(xGlosa) + ' CNTGLOSA, '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            //+ '       ''H'' CNTDH, NULL CCOSID, ' + xTCambio + ' CNTTCAMBIO, '
            + '       ''H'' CNTDH, CASE WHEN G.CTA_CCOS = ''S'' THEN A.CCOSID ELSE NULL END CCOSID, ' + xTCambio + ' CNTTCAMBIO, '
// Fin HPC_201707_CXP
            + '       sum(nvl(IMPOTRDTO,0)) CNTMTOORI, '
            + '       CASE WHEN A.TMONID=''N'' THEN sum(nvl(impotrdto,0)) ELSE round(sum(nvl(impotrdto,0))*' + xTCambio + ',2) END CNTMTOLOC, '
            + '       CASE WHEN A.TMONID=''D'' THEN sum(nvl(impotrdto,0)) ELSE round(sum(nvl(impotrdto,0))/' + xTCambio + ',2) END CNTMTOEXT, '
// Inicio HPC_201705_CXP
// Ajustes en Contabilización de Órdenes de Pago origen 53
            + '       ''' + dtpFechacnt.text + ''' CNTFEMIS, ''' + dtpFechacnt.text + ''' CNTFVCMTO, ''' + dtpFechaCnt.text + ''' CNTFCOMP, '
// Fin HPC_201703_CXP
            + '       ''I'' CNTESTADO, ''N'' CNTCUADRE, ''N'' CNTFAUTOM, '
            + '       ''' + DMCXP.wUsuario + ''' CNTUSER, '
            + '       trunc(SYSDATE) CNTFREG, SYSDATE CNTHREG, B.FECMES CNTMM, B.FECDIA CNTDD, B.FECTRIM CNTTRI, B.FECSEM CNTSEM, '
            + '       B.FECSS CNTSS, B.FECAATRI CNTAATRI, B.FECAASEM CNTAASEM, B.FECAASS CNTAASS, A.TMONID, NULL FLAGVAR, NULL FCONS, '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            + '       NULL CNTFMEC, C.TDIARDES, G.CTAABR CTADES, NULL AUXDES, ''A Cuenta'' DOCDES, NULL CCOSDES, 0.00 CNTDEBEMN, 0.00 CNTDEBEME, '
// Fin HPC_201707_CXP
            + '       case when A.TMONID=''N'' then sum(nvl(IMPOTRDTO,0)) else round(sum(nvl(IMPOTRDTO,0))*' + xTCambio + ',2) end CNTHABEMN, '
            + '       case when A.TMONID=''D'' then sum(nvl(IMPOTRDTO,0)) else round(sum(nvl(IMPOTRDTO,0))/' + xTCambio + ',2) end CNTHABEME, '
            + '       0 CNTSALDMN, 0 CNTSALDME, NULL CAMPOVAR, NULL CNTTS, NULL CNTPAGADO, '
            + '       ''CXP'' CNTMODDOC, ' + IntToStr(DMCXP.cdsDetallePres.RecordCount + 2) + ' CNTREG, ''CXP'' MODULO, NULL VTA_SECU '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            //+ '  from CXP_ORD_PAG_DET A, CXP_ORD_PAG_CAB F, TGE106 D, TGE114 B, TGE104 C, TGE202 E, TGE202 G '
            + '  from CXP_ORD_PAG_DET A, CXP_ORD_PAG_CAB F, TGE106 D, TGE114 B, TGE104 C, TGE202 G '
// Fin HPC_201707_CXP
            + ' where A.CIAID='+quotedstr(dblcCia.Text)
            + '   and A.NUMERO='+quotedstr(dbeNumero.text)
            + '   and F.CIAID=A.CIAID and F.NUMERO=A.NUMERO '
            + '   and B.FECHA(+)='+quotedstr(datetostr(dtpFechaCnt.date))
            + '   and C.TDIARID(+)='+quotedstr(xOrigen)
            + '   and D.CIAID=''02'' and D.BANCOID=F.BANCOID and D.CCBCOID=F.CCBCOID '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            {+ '   and A.CIAID=E.CIAID '
            + '   and E.CUENTAID='+quotedstr(xCta466) }
// Fin HPC_201707_CXP
            + '   and nvl(impotrdto, 0)>0 '
            + '   and A.CIAID = G.CIAID '
            + '   and A.CTAOTRDTO = G.CUENTAID '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            + ' group by G.CTA_CCOS, CCOSID,A.CIAID, b.fecano, A.CTAOTRDTO, A.TMONID, B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, '
            + '          B.FECAATRI, B.FECAASEM , B.FECAASS, C.TDIARDES, G.CTAABR, G.CTA_AUX, A.CLAUXID, A.AUXID ';
// Fin HPC_201707_CXP
// Fin HPC_201701_CXP
   // Comisión Interbancaria, va al DEBE
      xSQL3 := '';
      If dblcCia.Text = '02' Then
      Begin
         xSQL3 := ' union all '
            + 'Select A.CIAID, '+ quotedstr(xOrigen) + ' TDIARID, '+ quotedstr(xNoComp) + ' CNTCOMPROB, B.FECANO CNTANO, '
            + '       '+ quotedstr(xPeriodo)+' CNTANOMM, '+ quotedstr(xLote) + ' CNTLOTE, A.CUENTAID, '
            + '       null CLAUXID, null AUXID, ''21'' DOCID, ''OP'' CNTSERIE, '
            +         quotedstr(DMCXP.cdsOPago.FieldByname('NUMOPE').AsString)+' CNTNODOC, '
            +         quotedstr('COMIS.CCI - '+xGlosa)+' CNTGLOSA, ''D'' CNTDH, A.CCOSID, '+xTCambio+' CNTTCAMBIO, '
            + '       A.CPMTOORI CNTMTOORI, A.CPMTOLOC CNTMTOLOC, A.CPMTOEXT CNTMTOEXT, '
// Inicio HPC_201705_CXP
// Ajustes en Contabilización de Órdenes de Pago origen 53
            +         quotedstr(datetostr(dtpFechacnt.date))+' CNTFEMIS, '
            +         quotedstr(datetostr(dtpFechacnt.date))+' CNTFVCMTO,'
// Fin HPC_201705_CXP            
            +         quotedstr(datetostr(dtpFechaCnt.date))+' CNTFCOMP,'
            + '       ''I'' CNTESTADO, ''N'' CNTCUADRE, ''N'' CNTFAUTOM, '+QuotedStr(DMCXP.wUsuario)+' CNTUSER, '
            + '       trunc(SYSDATE) CNTFREG, SYSDATE CNTHREG, b.fecmes CNTMM, b.fecdia CNTDD, '
            + '       b.fectrim CNTTRI, b.fecsem CNTSEM, b.fecss CNTSS, b.fecaatri CNTAATRI, '
            + '       b.fecaasem CNTAASEM, b.fecaass CNTAASS, A.TMONID, '
            + '       NULL FLAGVAR, NULL FCONS, NULL CNTFMEC, C.TDIARDES, E.CTAABR CTADES, '
            + '       NULL AUXDES, ''CCI'' DOCDES, NULL CCOSDES, '
            + '       A.CPMTOLOC CNTDEBEMN, A.CPMTOEXT CNTDEBEME, '
            + '       0.00 CNTHABEMN, 0.00 CNTHABEME, '
            + '       0 CNTSALDMN, 0 CNTSALDME, NULL CAMPOVAR, NULL CNTTS, NULL CNTPAGADO, '
            + '       ''CXP'' CNTMODDOC, 3 CNTREG, ''CXP'' MODULO, NULL CTA_SECU '
            + '  from CXP_ORD_PAG_TINT A, '
            + '       TGE114 B, TGE104 C, '
            + '       TGE202 E '
            + ' where A.CIAID = '+quotedstr(dblcCia.Text)
            + '   and A.NUMERO = '+quotedstr(dbeNumero.text)
            + '   and B.FECHA(+) = '+quotedstr(datetostr(dtpFechaCnt.date))
            + '   and C.TDIARID(+) = '+quotedstr(xOrigen)
            + '   and A.CIAID = E.CIAID and E.CUENTAID = A.CUENTAID ';
      End;
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL( xSQL1 + xSQL2 + xSQL3);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Error en la Grabación 2 del Detalle Contable');
         Exit;
      End;

      xSQL := 'Update CXP_ORD_PAG_CAB '
             +'   set USUCONTA='+quotedstr(DMCXP.wUsuario)+', '
             +'       TDIARID='+ quotedstr(xOrigen) +', '
             +'       CNTANOMM='+ quotedstr(xPeriodo) +', '
             +'       CNTCOMPROB='+ quotedstr(xNoComp) +' '
             +' where CIAID='+quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
             +'   and NUMERO='+quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
         DMCXP.cdsOPago.Edit;
         DMCXP.cdsOPago.fieldByname('USUCONTA').AsString := DMCXP.wUsuario;
         DMCXP.cdsOPago.Post;
// Fin HPC_201707_CXP
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Error en la Contabilización de la Orden de Pago');
         Exit;
      End;

   ///////////////////////////////
   //  ASIENTO EN COMPAÑIA 02   //
   ///////////////////////////////

      If dblcCia.Text <> '02' Then
      Begin
         xSQL := 'Select LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
               + ' where CIAID=''02'' AND CNTANOMM=''' + xPeriodo + ''' AND TDIARID=''' + xOrigen + '''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.indexfieldnames := '';
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;
         xNoComp := DMCXP.cdsQry.FieldByName('NOCOMP').AsString;
// Inicio HPC_201701_CXP
// 20/04/2017  Se ha modificado para que contabilice y coloque el Número de Operación en la columna de Numero
//de Documento y en la glosa de la cabecera y detalle del asiento se le está retirando el número de operación
//       xGlosa := 'OP:' + DMCXP.cdsOPago.FieldByname('NUMOPE').AsString+'/PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString + '-' + wsBanco + ' ' + xCiaAbr;
         xGlosa := 'PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString + '-' + wsBanco + ' ' + xCiaAbr;
// Fin HPC_201701_CXP
         if length(xGlosa)>40 then xGlosa := copy(xGlosa,1,40);
         xSQL := 'Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
               + '                    CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
               + '                    CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
               + '                    CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
               + '                    TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
               + 'Select ''02'', ''' + xOrigen + ''', ''' + xNoComp + ''', '
               + '       ''' + xPeriodo + ''', ''' + xLote + ''', '
               +         quotedstr(xGlosa) + ', '
               +         xTCambio + ', ''' + dtpFechaCnt.text + ''', '
               + '       ''I'', ''N'', NULL, ''' + DMCXP.wUsuario + ''', trunc(SYSDATE), SYSDATE, b.fecano , b.fecmes, b.fecdia, '
               + '       b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, A.TMONID,  NULL, NULL, NULL, TDIARDES, '
               + '       CASE WHEN A.TMONID=''N'' THEN IMPPAGO ELSE round(IMPPAGO*' + xTCambio + ',2) END, CASE WHEN A.TMONID=''D'' THEN IMPPAGO ELSE round(IMPPAGO/' + xTCambio + ',2) END, '
               + '       CASE WHEN A.TMONID=''N'' THEN IMPPAGO ELSE round(IMPPAGO*' + xTCambio + ',2) END, CASE WHEN A.TMONID=''D'' THEN IMPPAGO ELSE round(IMPPAGO/' + xTCambio + ',2) END, '
               + ' 0, 0, NULL, ''CXP'', ''CXP'' '
               + '  from CXP_ORD_PAG_CAB A, TGE114 B, TGE104 C, '
               + '  (SELECT CIAID,NUMERO, SUM(IMPPAGO) IMPPAGO FROM CXP_ORD_PAG_DET WHERE CIAID='+quotedstr(dblcCia.Text)+' AND NUMERO ='+quotedstr(dbeNumero.text)+' GROUP BY CIAID, NUMERO) F '
               + ' where A.CIAID=''' + dblcCia.Text + ''' AND A.NUMERO=''' + dbeNumero.text + ''' '// and modulo is null '
               + '   and A.FECCONTA=B.FECHA '
               + '   and F.CIAID=A.CIAID and F.NUMERO=A.NUMERO '
               + '   and C.TDIARID=''' + xOrigen + '''';
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;                            // quinto retorna boton contabiliza
            ShowMessage('Error en la Grabación 2 de la Cabecera Contable');
            Exit;
         End;
      // DETALLE 1
// Inicio HPC_201701_CXP
// 20/04/2017  Se ha modificado para que contabilice y coloque el Número de Operación en la columna de Numero
//de Documento y en la glosa de la cabecera y detalle del asiento se le está retirando el número de operación
//       xGlosa := 'OP:' + DMCXP.cdsOPago.FieldByname('NUMOPE').AsString+'/PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString + '-' + wsBanco;
xGlosa := 'PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString + '-' + wsBanco;
// Fin HPC_201701_CXP
         if length(xGlosa)>40 then xGlosa := copy(xGlosa,1,40);
         xSQL := 'INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
               + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
               + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
               + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
               + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
               + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
               + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
               + 'Select ''02'', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , b.fecano, ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCta166 + ''', NULL, NULL, '
// Inicio HPC_201701_CXP
// 20/04/2017  Se ha modificado para que contabilice y coloque el Número de Operación en la columna de Numero
//de Documento y en la glosa de la cabecera y detalle del asiento se le está retirando el número de operación
//             + '       ''21'', ''ABO'', ''' + dbeNumPla.text + ''', '
               + '       ''21'', ''OP'', ' + quotedstr(DMCXP.cdsOPago.FieldByname('NUMOPE').AsString) + ', '
// Fin HPC_201701_CXP
               +         quotedstr(xGlosa) + ', '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
               //+ '       ''D'', NULL, ' + xTCambio + ', '
               + '       ''D'', CASE WHEN G.CTA_CCOS = ''S'' THEN A.CCOSID ELSE NULL END CCOSID, ' + xTCambio + ', '
// Fin HPC_201707_CXP
               + '       A.IMPPAGO, '
               + '       ABS(CASE WHEN A.TMONID=''N'' THEN A.IMPPAGO ELSE round(A.IMPPAGO * ' + xTCambio + ',2) END), '
               + '       ABS(CASE WHEN A.TMONID=''D'' THEN A.IMPPAGO ELSE round(A.IMPPAGO / ' + xTCambio + ',2) END), '
// Inicio HPC_201705_CXP
// Ajustes en Contabilización de Órdenes de Pago origen 53
               + '       ''' + dtpFechaCnt.text + ''', ''' + dtpFechaCnt.text + ''', ''' + dtpFechaCnt.text + ''', ''I'', ''N'', ''N'', ''' + DMCXP.wUsuario + ''', '
// Fin HPC_201705_CXP
               + '       trunc(SYSDATE), SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, '
               + '       A.TMONID, NULL, NULL, NULL, C.TDIARDES, G.CTAABR, NULL, ''A Cuenta'', NULL, '
               + '       CASE WHEN A.TMONID=''N'' THEN A.IMPPAGO ELSE round(A.IMPPAGO * ' + xTCambio + ',2) END , '
               + '       CASE WHEN A.TMONID=''D'' THEN A.IMPPAGO ELSE round(A.IMPPAGO / ' + xTCambio + ',2) END , '
               + '       0, 0, 0, 0, NULL, NULL, '
               + '       NULL, ''CXP'', 1, ''CXP'', NULL '
               + '  from CXP_ORD_PAG_DET A, TGE106 D, TGE114 B, TGE104 C, TGE202 G, CXP_ORD_PAG_CAB F '
               + ' where A.CIAID=''' + dblcCia.Text + ''' AND A.NUMERO=''' + dbeNumero.text + ''' '//and modulo is null '
               + '   and F.CIAID=A.CIAID and F.NUMERO=A.NUMERO '
               + '   and B.FECHA(+)=''' + dtpFechaCnt.text + ''' '
               + '   and C.TDIARID(+)=''' + xOrigen + ''' '
               + '   and D.CIAID=''02'' AND D.BANCOID=F.BANCOID AND D.CCBCOID=F.CCBCOID '
               + '   and G.CIAID=''02'' AND G.CUENTAID=''' + xCta166 + '''';
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('Error en la Grabación 3 del Detalle Contable');
            Exit;
         End;

      // DETALLE 2
// Inicio HPC_201701_CXP
// 20/04/2017  Se ha modificado para que contabilice y coloque el Número de Operación en la columna de Numero
//de Documento y en la glosa de la cabecera y detalle del asiento se le está retirando el número de operación
//       xGlosa := xCiaAbr+' OP:' + DMCXP.cdsOPago.FieldByname('NUMOPE').AsString+'/PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString + '-' + wsBanco;
         xGlosa := xCiaAbr+' /PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString + '-' + wsBanco;
// Fin HPC_201701_CXP
         if length(xGlosa)>40 then xGlosa := copy(xGlosa,1,40);
         xSQL := 'INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
               + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
               + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
               + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
               + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
               + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
               + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
               + 'Select '+quotedstr('02')+' CIAID, '
               +         quotedstr(xOrigen) + ' TDIARID, '
               +         quotedstr(xNoComp) + ' CNTCOMPROB, '
               + '       B.FECANO CNTANO, '
               +         quotedstr(xPeriodo) + ' CNTANOMM, '
               +         quotedstr(xLote) + ' CNTLOTE, '
               + '       D.CTAPRINC CUENTAID, '
               + '       NULL CLAUXID, NULL AUXID, '
               +         quotedstr('21')+' DOCID, '
// Inicio HPC_201701_CXP
// 20/04/2017  Se ha modificado para que contabilice y coloque el Número de Operación en la columna de Numero
//de Documento y en la glosa de la cabecera y detalle del asiento se le está retirando el número de operación
               +         quotedstr('OP')+' CNTSERIE, '
//             +         quotedstr(dbeNumPla.text) + ' CNTNODOC, '
               +         quotedstr(DMCXP.cdsOPago.FieldByname('NUMOPE').AsString) + ' CNTNODOC, '
// Fin HPC_201701_CXP
               +         quotedstr(xGlosa) + ' CNTGLOSA, '
               +         quotedstr('H')+' CNTDH,'
               + '       NULL CCOSID, '
               +         xTCambio + ' CNTTCAMBIO, '
               + '       (F.IMPPAGO + nvl(COMIS_CCI,0)) CNTMTOORI, '
               + '       case when A.TMONID=''N'' then (F.IMPPAGO + nvl(COMIS_CCI,0)) else round((F.IMPPAGO + nvl(COMIS_CCI,0))*' + xTCambio + ',2) end CNTMTOLOC, '
               + '       case when A.TMONID=''D'' then (F.IMPPAGO + nvl(COMIS_CCI,0)) else round((F.IMPPAGO + nvl(COMIS_CCI,0))/' + xTCambio + ',2) end CNTMTOEXT, '
// Inicio HPC_201705_CXP
// Ajustes en Contabilización de Órdenes de Pago origen 53
               +         quotedstr(datetostr(dtpFechaCnt.date))+' CNTFEMIS,'
               +         quotedstr(datetostr(dtpFechaCnt.date))+' CNTFVCMTO,'
// Fin HPC_201705_CXP
               +         quotedstr(datetostr(dtpFechaCnt.date))+' CNTFCOMP,'
               + '       ''I'' CNTESTADO, ''N'' CNTCUADRE, ''N'' CNTFAUTOM, '
               +         quotedstr(DMCXP.wUsuario) + ' CNTUSER, '
               + '       trunc(sysdate) CNTFREG, sysdate CNTHREG, B.FECMES CNTMM, B.FECDIA CNTDD, B.FECTRIM CNTTRI, '
               + '       B.FECSEM CNTSEM, B.FECSS CNTSS, B.FECAATRI CNTAATRI, B.FECAASEM CNTAASEM, B.FECAASS CNTAASS, '
               + '       A.TMONID, NULL FLAGVAR, NULL FCONS, NULL CNTFMEC, C.TDIARDES, E.CTAABR CTADES, NULL AUXDES, ''A Cuenta'' DOCDES, '
               + '       NULL CCOSDES, 0 CNTDEBEMN, 0 CNTDEBEME, '
               + '       CASE WHEN A.TMONID=''N'' THEN (F.IMPPAGO + nvl(COMIS_CCI,0)) ELSE round((F.IMPPAGO + nvl(COMIS_CCI,0))*' + xTCambio + ',2) END CNTHABEMN, '
               + '       CASE WHEN A.TMONID=''D'' THEN (F.IMPPAGO + nvl(COMIS_CCI,0)) ELSE round((F.IMPPAGO + nvl(COMIS_CCI,0))/' + xTCambio + ',2) END CNTHABEME, '
               + '       0 CNTSALDMN, 0 CNTSALDME, NULL CAMPOVAR, NULL CNTTS, '
               + '       NULL CNTPAGADO, ''CXP'' CNTMODDOC, 2 CNTREG, ''CXP'' MODULO, NULL CTA_SECU '
               + '  from CXP_ORD_PAG_CAB A, TGE106 D, TGE114 B, TGE104 C, TGE202 E, '
               + '      (Select CIAID, NUMERO, sum(IMPPAGO) IMPPAGO '
               + '         from CXP_ORD_PAG_DET '
               + '        where CIAID='+quotedstr(dblcCia.Text)
               + '          and NUMERO ='+quotedstr(dbeNumero.text)
               + '        group by CIAID, NUMERO) F, '
               + '     (Select CIAID, NUMERO, CPMTOORI COMIS_CCI '
               + '         from CXP_ORD_PAG_TINT '
               + '        where CIAID = '+quotedstr(dblcCia.Text)
               + '          and NUMERO = '+quotedstr(dbeNumero.text)+') G '
               + ' where A.CIAID=''' + dblcCia.Text + ''' AND A.NUMERO=''' + dbeNumero.text + ''' '//and modulo is null '
               + '   and B.FECHA(+)=''' + dtpFechaCnt.text + ''' '
               + '   and C.TDIARID(+)=''' + xOrigen + ''' '
               + '   and D.CIAID=''02'' AND D.BANCOID=A.BANCOID AND D.CCBCOID=A.CCBCOID '
               + '   and E.CIAID=''02'' AND E.CUENTAID=''' + xCta166 + ''''
               + '   and F.CIAID(+)=A.CIAID and F.NUMERO(+)=A.NUMERO '
               + '   and G.CIAID(+)=A.CIAID and G.NUMERO(+)=A.NUMERO ';

         xGlosa := 'COMIS.CCI - '+xGlosa;
         if length(xGlosa)>40 then xGlosa := copy(xGlosa,1,40);

         xSQL3 := ' union all '
               + 'Select '+quotedstr('02')+' CIAID, '+ quotedstr(xOrigen) + ' TDIARID, '+ quotedstr(xNoComp) + ' CNTCOMPROB, B.FECANO CNTANO, '
               + '       '+ quotedstr(xPeriodo)+' CNTANOMM, '+ quotedstr(xLote) + ' CNTLOTE, A.CUENTAID, '
               + '       null CLAUXID, null AUXID, ''21'' DOCID, ''OP'' CNTSERIE, '
               +         quotedstr(DMCXP.cdsOPago.FieldByname('NUMOPE').AsString)+' CNTNODOC, '
               +         quotedstr(xGlosa)+' CNTGLOSA, ''D'' CNTDH, A.CCOSID, '+xTCambio+' CNTTCAMBIO, '
               + '       A.CPMTOORI CNTMTOORI, A.CPMTOLOC CNTMTOLOC, A.CPMTOEXT CNTMTOEXT, '
// Inicio HPC_201705_CXP
// Ajustes en Contabilización de Órdenes de Pago origen 53
               +         quotedstr(datetostr(dtpFechaCnt.date))+' CNTFEMIS, '
               +         quotedstr(datetostr(dtpFechaCnt.date))+' CNTFVCMTO,'
// Fin HPC_201705_CXP
               +         quotedstr(datetostr(dtpFechaCnt.date))+' CNTFCOMP,'
               + '       ''I'' CNTESTADO, ''N'' CNTCUADRE, ''N'' CNTFAUTOM, '+QuotedStr(DMCXP.wUsuario)+' CNTUSER, '
               + '       trunc(SYSDATE) CNTFREG, SYSDATE CNTHREG, b.fecmes CNTMM, b.fecdia CNTDD, '
               + '       b.fectrim CNTTRI, b.fecsem CNTSEM, b.fecss CNTSS, b.fecaatri CNTAATRI, '
               + '       b.fecaasem CNTAASEM, b.fecaass CNTAASS, A.TMONID, '
               + '       NULL FLAGVAR, NULL FCONS, NULL CNTFMEC, C.TDIARDES, E.CTAABR CTADES, '
               + '       NULL AUXDES, ''CCI'' DOCDES, NULL CCOSDES, '
               + '       A.CPMTOLOC CNTDEBEMN, A.CPMTOEXT CNTDEBEME, '
               + '       0.00 CNTHABEMN, 0.00 CNTHABEME, '
               + '       0 CNTSALDMN, 0 CNTSALDME, NULL CAMPOVAR, NULL CNTTS, NULL CNTPAGADO, '
               + '       ''CXP'' CNTMODDOC, 3 CNTREG, ''CXP'' MODULO, NULL CTA_SECU '
               + '  from CXP_ORD_PAG_TINT A, '
               + '       TGE114 B, TGE104 C, '
               + '       TGE202 E '
               + ' where A.CIAID = '+quotedstr(dblcCia.Text)
               + '   and A.NUMERO = '+quotedstr(dbeNumero.text)
               + '   and B.FECHA(+) = '+quotedstr(datetostr(dtpFechaCnt.date))
               + '   and C.TDIARID(+) = '+quotedstr(xOrigen)
               + '   and A.CIAID = E.CIAID and E.CUENTAID = A.CUENTAID ';
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL+xSQL3);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('Error en la Grabación 4 del Detalle Contable');
            Exit;
         end;

      // Otros descuentos
         xSQL:='Select DOCID, DOCMOD, DOCDES, DOCABR, DOC_FREG, TDIARID, TDIARID2, DOCTIPREG, '
            +  '       DOCRESTA, COADOCID, FCING, DOCCONTA, DOCIDORIG, F_EMIDOC, DOCPROV, '
            +  '       DOCRECCAJ, DOCPLAZO, REFALM, URQALM, DOCRETIGV, GRACIAVCTO, DOCLENGTH, '
            +  '       DOCAF, DTRAFECTO, TDOC_SUNAT, AFEC_REGPENSION, AFEC_REND_CXP, '
            +  '       TDIARID_REND, RETENCION, FLAG_MOSTRAR_DOC, DETRACCION1 '
            +  '  from TGE110 '
            +  ' where DOCMOD=''CXP'' '
            +  '   and DOCTIPREG=''4C'' '
            +  '   and DOCID='+quotedstr(DMCXP.cdsDetallePres.fieldByname('DOCID').AsString)+'';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;
         if DMCXP.cdsQry.recordcount <> 0 then
         begin
            if dImpOtrDes > 0 then
            begin
            // Detalle 3 - Adicional de otros descuentos
               xGlosa := 'OP:' + DMCXP.cdsOPago.FieldByname('NUMOPE').AsString+'/PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString + '-' + wsBanco;
               if length(xGlosa)>40 then xGlosa := copy(xGlosa,1,40);
               xSQL := 'INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                     + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                     + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                     + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                     + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                     + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                     + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                     + 'Select ''02'' CIAID, '+quotedstr(xOrigen)+' TDIARID, '+quotedstr(xNoComp)+' CNTCOMPROB , B.FECANO CNGTANO, '+quotedstr(xPeriodo)+' CNTANOMM, '+quotedstr(xLote)+' CNTLOTE, A.CTAOTRDTO CUENTAID, '
                     + '       D.CLAUXID, PROV AUXID, D.DOCID, D.CPSERIE CNTSERIE, D.CPNODOC CNTNODOC, SUBSTR(D.PROVDES,1,40) CNTGLOSA, '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
                     //+ '       case when nvl(A.IMPOTRDTO,0)>0 then ''H'' else ''D'' END CNTDH, NULL CCOSID, ' + xTCambio + ' CNTTCAMBIO, '
                     + '       case when nvl(A.IMPOTRDTO,0)>0 then ''H'' else ''D'' END CNTDH, CASE WHEN E.CTA_CCOS = ''S'' THEN A.CCOSID ELSE NULL END CCOSID, ' + xTCambio + ' CNTTCAMBIO, '
// Fin HPC_201707_CXP
                     + '       nvl(A.IMPOTRDTO,0) CNTMTOORI, '
                     + '       case when A.TMONID=''N'' then nvl(A.IMPOTRDTO,0) else round(nvl(A.IMPOTRDTO,0)*' + xTCambio + ',2) end CNTMTOLOC, '
                     + '       case when A.TMONID=''D'' then nvl(A.IMPOTRDTO,0) else round(nvl(A.IMPOTRDTO,0)/' + xTCambio + ',2) end CNTMTOEXT, '
// Inicio HPC_201705_CXP
// Ajustes en Contabilización de Órdenes de Pago origen 53
                     + '       D.CPFEMIS CNTFEMIS, D.CPFVCMTO CNTFVCMTO, '+quotedstr(datetostr(dtpFechaCnt.date))+' CNTFCOMP, ''I'' CNTESTADO, ''N'' CNTCUADRE, ''N'' CNTFAUTOM, '+quotedstr(DMCXP.wUsuario)+' CNTUSER, '
// Fin HPC_201705_CXP                     
                     + '       trunc(SYSDATE) CNTFREG, SYSDATE CNTHREG, B.FECMES CNTMM, B.FECDIA CNTDD, B.FECTRIM CNTTRI, B.FECSEM CNTSEM, B.FECSS CNTSS, '
                     + '       B.FECAATRI CNTAATRI, B.FECAASEM CNTAASEM, B.FECAASS CNTAASS, '
                     + '       A.TMONID, NULL FLAGVAR, NULL FCONS, NULL CNTFMEC, C.TDIARDES, E.CTAABR CTADES, SUBSTR(D.PROVDES,1,15) AUXDES, F.DOCABR DOCDES, NULL CCOSDES, '
                     + '       case when nvl(A.IMPOTRDTO,0)<=0 then case when A.TMONID=''N'' then nvl(A.IMPOTRDTO,0)*-1 else round(nvl(A.IMPOTRDTO,0)*' + xTCambio + ',2)*-1 end else 0 end CNTDEBEMN, '
                     + '       case when nvl(A.IMPOTRDTO,0)<=0 then case when A.TMONID=''D'' then nvl(A.IMPOTRDTO,0)*-1 else round(nvl(A.IMPOTRDTO,0)/' + xTCambio + ',2)*-1 end else 0 end CNTDEBEME, '
                     + '       case when nvl(A.IMPOTRDTO,0)>0  then case when A.TMONID=''N'' then nvl(A.IMPOTRDTO,0) else round(nvl(A.IMPOTRDTO,0)*' + xTCambio + ',2) end else 0 end CNTHABEMN, '
                     + '       case when nvl(A.IMPOTRDTO,0)>0  then case when A.TMONID=''D'' then nvl(A.IMPOTRDTO,0) else round(nvl(A.IMPOTRDTO,0)/' + xTCambio + ',2) end else 0 end CNTHABEME, '
                     + '       0 CNTSALDMN, 0 CNTSALDME, NULL CAMPOVAR, NULL CNTTS, NULL CNTPAGADO, ''CXP'' CNTMODDOC, ROWNUM, ''CXP'' MODULO, NULL CTA_SECU '
                     + '  from CXP_ORD_PAG_DET A, CXP301 D, TGE114 B, TGE104 C, TGE202 E, TGE110 F '
                     + ' where A.CIAID='+quotedstr(dblcCia.Text)
                     + '   AND A.NUMERO='+quotedstr(dbeNumero.text)
                     + '   and D.CIAID(+)=A.CIAID and D.CLAUXID=A.CLAUXID and D.PROV=A.AUXID and D.DOCID(+)=A.DOCID '
                     + '   and nvl(A.CPSERIE,''0'')=nvl(D.CPSERIE,''0'') and D.CPNODOC(+) = A.CPNODOC '
                     + '   and D.CPESTADO IN (''P'',''C'') '
                     + '   and B.FECHA(+)='+quotedstr(datetostr(dtpFecha.date))
                     + '   and C.TDIARID(+)='+quotedstr(xOrigen)
                     + '   and A.CIAID=E.CIAID AND A.CTAOTRDTO=E.CUENTAID '
                     + '   and A.DOCID=F.DOCID '
                     + '   and nvl(A.IMPOTRDTO,0)<>0 '
                     + ' order BY A.ITEM ';
               Try
                  DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  DMCXP.DCOM1.AppServer.RetornaTransaccion;
                  ShowMessage('Error en la Grabación 2 del Detalle Contable');
                  Exit;
               End;
            end;
         end;
      end;
   // Fin HPC_201604_CXP

// ACTUALIZA SALDOS
      DMCXP.cdsDetallePres.First;
      While Not DMCXP.cdsDetallePres.Eof Do
      Begin
         If DMCXP.cdsDetallePres.fieldByname('TMONID').AsString = 'N' Then
         Begin
            xSQL := 'Update CXP301 '
                  + 'set CPPAGORI=NVL(CPPAGORI,0) + ' + DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsString + ', '
                  + '    CPPAGLOC=NVL(CPPAGLOC,0) + ' + DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsString + ', '
                  + '    CPPAGEXT=NVL(CPPAGEXT,0) + round(' + DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsString + '/' + xTCambio + ',2), '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
                  //NO SE HACE PAGOS PARCIALES ENTONCES LOS SALDOS DEBEN SER CERO Y ESTADO C
                  {+ '    CPSALORI=NVL(CPSALORI,0) - ' + DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsString + ', '
                  + '    CPSALLOC=NVL(CPSALLOC,0) - ' + DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsString + ', '
                  + '    CPSALEXT=NVL(CPSALEXT,0) - round(' + DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsString + '/' + xTCambio + ',2), '
                  + '    CPESTADO=CASE WHEN NVL(CPSALORI,0) - ' + DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsString + '<=0 THEN ''C'' ELSE CPESTADO END '}
                  + '    CPSALORI= 0, '
                  + '    CPSALLOC= 0, '
                  + '    CPSALEXT=0, '
                  + '    CPESTADO= ''C'' '
// Fin HPC_201707_CXP
                  + ' Where CIAID=''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''' '
                  + '   and CLAUXID=''' + DMCXP.cdsDetallePres.fieldByname('CLAUXID').AsString + ''' '
                  + '   and PROV=''' + DMCXP.cdsDetallePres.fieldByname('AUXID').AsString + ''' '
                  + '   and DOCID=''' + DMCXP.cdsDetallePres.fieldByname('DOCID').AsString + ''' '
                  + '   and CPSERIE=''' + DMCXP.cdsDetallePres.fieldByname('CPSERIE').AsString + ''' '
                  + '   and CPNODOC=''' + DMCXP.cdsDetallePres.fieldByname('CPNODOC').AsString + ''' AND CPESTADO IN (''C'',''P'')';
         End
         Else
         Begin
            xSQL := 'Update CXP301 '
                  + '   set CPPAGORI=NVL(CPPAGORI,0) + ' + DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsString + ', '
                  + '       CPPAGEXT=NVL(CPPAGEXT,0) + ' + DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsString + ', '
                  + '       CPPAGLOC=NVL(CPPAGLOC,0) + round(' + DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsString + '*' + xTCambio + ',2), '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
                  //NO SE HACE PAGOS PARCIALES ENTONCES LOS SALDOS DEBEN SER CERO Y ESTADO C
                  {+ '       CPSALORI=NVL(CPSALORI,0) - ' + DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsString + ', '
                  + '       CPSALEXT=NVL(CPSALEXT,0) - ' + DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsString + ', '
                  + '       CPSALLOC=NVL(CPSALLOC,0) - round(' + DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsString + '*' + xTCambio + ',2), '
                  + '       CPESTADO=CASE WHEN NVL(CPSALORI,0) - ' + DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsString + '<=0 THEN ''C'' ELSE CPESTADO END '}
                  + '    CPSALORI= 0, '
                  + '    CPSALLOC= 0, '
                  + '    CPSALEXT=0, '
                  + '    CPESTADO= ''C'' '
// Fin HPC_201707_CXP
                  + ' Where CIAID=''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''' '
                  + '   and CLAUXID=''' + DMCXP.cdsDetallePres.fieldByname('CLAUXID').AsString + ''' '
                  + '   and PROV=''' + DMCXP.cdsDetallePres.fieldByname('AUXID').AsString + ''' '
                  + '   and DOCID=''' + DMCXP.cdsDetallePres.fieldByname('DOCID').AsString + ''' '
                  + '   and CPSERIE=''' + DMCXP.cdsDetallePres.fieldByname('CPSERIE').AsString + ''' '
                  + '   and CPNODOC=''' + DMCXP.cdsDetallePres.fieldByname('CPNODOC').AsString + ''' AND CPESTADO IN (''C'',''P'')';
         End;

         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('Error en la Amortización de la Cuenta por Pagar');
            Exit;
         End;

         xSQL := 'Update CXP301 '
               + '   set CPPAGORI=NVL(CPMTOORI,0), CPPAGLOC=NVL(CPMTOLOC,0), CPPAGEXT=NVL(CPMTOEXT,0), '
               + '       CPSALORI=0, CPSALLOC=0, CPSALEXT=0 '
               + ' where CIAID=''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''' '
               + '   and CLAUXID=''' + DMCXP.cdsDetallePres.fieldByname('CLAUXID').AsString + ''' '
               + '   and PROV=''' + DMCXP.cdsDetallePres.fieldByname('AUXID').AsString + ''' '
               + '   and DOCID=''' + DMCXP.cdsDetallePres.fieldByname('DOCID').AsString + ''' '
               + '   and CPSERIE=''' + DMCXP.cdsDetallePres.fieldByname('CPSERIE').AsString + ''' '
               + '   and CPNODOC=''' + DMCXP.cdsDetallePres.fieldByname('CPNODOC').AsString + ''' and CPSALORI<0 AND CPESTADO IN (''C'',''P'')';
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('Error en la Cancelación de la Cuenta por Pagar');
            Exit;
         End;

         DMCXP.cdsDetallePres.Next;
      End;

      Screen.Cursor := crDefault;
      Screen.Cursor := crHourGlass;

   // Asiento de Retencion
      xContinuaGrab := True;
      bbtnRetClick(Self);
      if not xContinuaGrab then
      begin
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo contabilizar las retenciones');
         pnlCab.Enabled := False;
         pnlCab2.Enabled := False;
         pnlCnt.Enabled := True;
      end
      else
      begin
         edtEstado.Text := 'CONTABILIZADO';
         pnlCab.Enabled := False;
         pnlCab2.Enabled := False;
         pnlCnt.Enabled := False;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
         //deshabilitar
         bbtnGraba.Enabled := false;
         bbtnAcepta.Enabled := false;
         bbtnPago.Enabled := false;
         bbtnContabiliza.Enabled := false;
         dbeNumPla.Enabled := false;
         dtpFechaCnt.Enabled := false;
         bbtnExporta.Enabled := false;
         pnlCab2.Enabled := false;
// Fin HPC_201707_CXP
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
         ShowMessage('Contabilizado');
      end;
   // Inicio HPC_201504_CXP
      dImpOtrDes := 0;
   // Fin HPC_201504_CXP
      Screen.Cursor := crDefault;
   End;
End;

Function TFOrdenPagoCab.ValidaRetenciones: Boolean;
Var
   sMensaje, xSQL, xNumRet: String;
Begin
      // ACTUALIZA SALDOS
   DMCXP.cdsDetallePres.First;
   DMCXP.cdsDetallePres.Filtered := False;
   DMCXP.cdsDetallePres.Filter := '';
   DMCXP.cdsDetallePres.Filter := 'IMPRETE>0';
   DMCXP.cdsDetallePres.IndexFieldNames := 'CLAUXID;AUXID;DOCID;CPSERIE;CPNODOC';
   DMCXP.cdsDetallePres.Filtered := True;

   Result := False;
   sMensaje := '';

   DMCXP.cdsDetallePres.First;
   While Not DMCXP.cdsDetallePres.Eof Do
   Begin

      xSQL := 'Select CIAID, CLAUXID, AUXID, DOCID, SERIE, NODOC, MTOORI, MTORETORI, RETSERIE, RETNUMERO '
            + '  from CNT320 '
            + ' where CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
            + '   and CLAUXID=''' + DMCXP.cdsDetallePres.fieldByname('CLAUXID').AsString + ''' '
            + '   and AUXID=''' + DMCXP.cdsDetallePres.fieldByname('AUXID').AsString + ''' '
            + '   and DOCID=''' + DMCXP.cdsDetallePres.fieldByname('DOCID').AsString + ''' '
            + '   and NODOC LIKE ''%' + DMCXP.cdsDetallePres.fieldByname('CPNODOC').AsString + '%'' AND NVL(ECESTADO,''P'')<>''A'''
            + '   and FECPAGO>=''' + DateToStr(dtpFecha.Date - 2) + '''';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.indexfieldnames := '';
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;

      xNumRet := DMCXP.cdsQry.fieldByname('RETNUMERO').AsString;

      If xNumRet = '' Then
      Begin
         sMensaje := sMensaje
            + 'Compañía ' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + '  '
            + 'Auxiliar ' + DMCXP.cdsDetallePres.fieldByname('CLAUXID').AsString + '-' + DMCXP.cdsDetallePres.fieldByname('AUXID').AsString + '  '
            + 'Documento ' + DMCXP.cdsDetallePres.fieldByname('DOCID').AsString + ' ' + DMCXP.cdsDetallePres.fieldByname('CPNODOC').AsString + '  ' + chr(13);
         Result := True;
      End;

      DMCXP.cdsDetallePres.Next;
   End;

   DMCXP.cdsDetallePres.Filtered := False;
   DMCXP.cdsDetallePres.Filter := '';
   DMCXP.cdsDetallePres.IndexFieldNames := '';
   DMCXP.cdsDetallePres.First;

   If sMensaje <> '' Then
   Begin
      ShowMessage('Verifique si faltan registrar las Retenciones de los siguientes Proveedores ' + chr(13) + chr(13) + sMensaje)
   End;
End;

Procedure TFOrdenPagoCab.CreaRetenciones;
Var
// Inicio HPC_201603_CXP
// DAF_2016000978_CXP_1 Ajustes a la Generación y Contabilización de Retenciones IGV. - Variables Clase de Auxiliar y Proveedor, retira xCliente
//   sMensaje, xSQL, xNumRet, siRet, xCliente,xsSQL, xCia, xTdiarid: String;
   xSQL, xNumRet, siRet, xClaseAux, xProveedor ,xsSQL, xCia, xTdiarid: String;
   xTCAMVPV : Double;
// Fin HPC_201603CXP
   sAno , sMes, xPeriodo : String ;
   iFrac  : Extended ;
   itotal : Currency;
   ltotal : String;
// Inicio HPC_201604_CXP
// Tasa de Retención IGV
   xNumReg: Integer;
   xTasaRet: Double;
   xfArchivoTexto: TextFile;
   xsNombreTxt, xCarpeta, xsClave, xTDocSunat : String;
// Fin HPC_201604_CXP
Begin
// Inicio HPC_201603_CXP
// DAF_2016000978_CXP_1 Ajustes a la Generación y Contabilización de Retenciones IGV.
   {
// Inicio HPC_201602_CXP
// DAF_2016000574_CXP_1 Ajustes a la Generación y Contabilización de Retenciones IGV

// Actualiza Saldos
   DMCXP.cdsDetallePres.First;
   DMCXP.cdsDetallePres.Filtered := False;
   DMCXP.cdsDetallePres.Filter := '';
   DMCXP.cdsDetallePres.Filter := 'IMPRETE>0 and PROVRETIGV=''S'' ';
   DMCXP.cdsDetallePres.IndexFieldNames := 'CLAUXID;AUXID;DOCID;CPSERIE;CPNODOC';
   DMCXP.cdsDetallePres.Filtered := True;

   sMensaje := '';

   DMCXP.cdsDetallePres.First;
   xCliente:= DMCXP.cdsDetallePres.fieldByname('AUXID').AsString;
// Campos a llenar en CNT320
   if DMCXP.cdsRetencion.Active then
      DMCXP.cdsRetencion.Close;

   xCia:= '02';
   xTDiarId := '40';
   xSQL := 'Select CIAID, TDIARID, ANOMM, ECNOCOMP, FECPAGO, CLAUXID, AUXID, AUXRUC, '
      + '          DOCID, DOCDES, SERIE, NODOC, TRANID, TRANDES, DH, MTOORI, MTOLOC, '
      + '          MTOEXT, USUARIO, FREG, HREG, MTORETORI, MTORETLOC, MTORETEXT, FECEMI, '
      + '          RETSERIE, RETNUMERO, DOCID2, CPNODOC, CPNOREG, CPSERIE, ECESTADO, '
      + '          RETTOTDES, TCAMB, TMONIDFAC, FOTROREG, CIARUC, TASARET, NUMREGRET '
      + '     from CNT320 '
      + '    where ECNOCOMP = (Select max(ECNOCOMP) '
      + '                        from CNT320 '
      + '                       where CIAID = '+quotedstr(xCia)
      + '                         and TDIARID = '+quotedstr(xTDiarId)
      + '                         and not ECNOCOMP like ''%A%'') ';
   DMCXP.cdsRetencion.DataRequest(xSQL);
   DMCXP.cdsRetencion.Open ;

   itotal :=0;
   while not DMCXP.cdsDetallePres.Eof do
   begin
      DMCXP.cdsRetencion.Append ;
      DMCXP.cdsRetencion.FieldByName('CIAID').AsString   := xCia;
      DMCXP.cdsRetencion.FieldByName('TDIARID').AsString := xTdiarid;
      DevuelvePeriodo(sAno,sMes);
      xPeriodo := sAno + sMes;
      DMCXP.cdsRetencion.FieldByName('ANOMM').AsString   := xPeriodo;
      DMCXP.cdsRetencion.FieldByName('FECPAGO').AsDateTime := dtpFechaCnt.Date;
      DMCXP.cdsRetencion.FieldByName('CLAUXID').AsString := DMCXP.cdsDetallePres.FieldBYName('CLAUXID').AsString ;
      DMCXP.cdsRetencion.FieldByName('AUXID').AsString   := DMCXP.cdsDetallePres.FieldBYName('AUXID').AsString;
      DMCXP.cdsRetencion.FieldByName('AUXRUC').AsString  := DMCXP.cdsDetallePres.FieldBYName('PROVRUC').AsString;
      DMCXP.cdsRetencion.FieldByName('DOCID').AsString   := DMCXP.cdsDetallePres.FieldBYName('DOCID').AsString;
      DMCXP.cdsRetencion.FieldByName('SERIE').AsString   := DMCXP.cdsDetallePres.FieldBYName('CPSERIE').AsString;
      If length(DMCXP.cdsDetallePres.FieldBYName('CPNODOC').AsString)< 8 then
        DMCXP.cdsRetencion.FieldByName('NODOC').AsString := strZero(DMCXP.cdsDetallePres.FieldBYName('CPNODOC').AsString,8)
      Else
      Begin
        DMCXP.cdsRetencion.FieldByName('NODOC').AsString := DMCXP.cdsDetallePres.FieldBYName('CPNODOC').AsString;
      End;

      xSQL := 'Select DOCRESTA, DOCDES '
         + '     from TGE110 '
         + '    where DOCMOD=''CXP'' '
         + '      and DOCID='+quotedstr(DMCXP.cdsDetallePres.FieldBYName('DOCID').AsString);
      DMCXP.cdsQry2.close ;
      DMCXP.cdsQry2.DataRequest(xSQL);
      DMCXP.cdsQry2.Open ;
      if DMCXP.cdsQry2.recordcount > 0 then
      begin
         if DMCXP.cdsQry2.FieldByName('DOCRESTA').AsString='S' then
            DMCXP.cdsRetencion.FieldByName('DH').AsString := 'D'
         else
            DMCXP.cdsRetencion.FieldByName('DH').AsString := 'H';
         DMCXP.cdsRetencion.FieldByName('DOCDES').AsString := DMCXP.cdsQry2.FieldByName('DOCDES').AsString;
      end;
      DMCXP.cdsRetencion.FieldByName('MTOORI').AsCurrency := DMCXP.cdsDetallePres.FieldBYName('CPMTOORI').AsCurrency;

      xSQL := 'Select TCAMVPV '
         + '     from TGE107 '
         + '    where TMONID = ''D'' '
         + '      and FECHA = '+quotedstr(datetostr(dtpFechaCnt.Date));
      DMCXP.cdsQry2.Close;
      DMCXP.cdsQry2.DataRequest(xSQL);
      DMCXP.cdsQry2.Open;

      if DMCXP.cdsDetallePres.FieldBYName('TMONID').AsString = 'N' then
      begin
        DMCXP.cdsRetencion.FieldByName('MTOLOC').AsCurrency := DMCXP.cdsDetallePres.FieldBYName('CPMTOORI').AsCurrency;
        DMCXP.cdsRetencion.FieldByName('MTOEXT').AsCurrency :=
                redondea(DMCXP.cdsDetallePres.FieldBYName('CPMTOORI').AsCurrency / DMCXP.cdsQry2.FieldBYName('TCAMVPV').AsCurrency );
      end
      else
      begin
        DMCXP.cdsRetencion.FieldByName('MTOEXT').AsCurrency := DMCXP.cdsDetallePres.FieldBYName('CPMTOORI').AsCurrency;
        DMCXP.cdsRetencion.FieldByName('MTOLOC').AsCurrency :=
                redondea(DMCXP.cdsDetallePres.FieldBYName('CPMTOORI').AsCurrency * DMCXP.cdsQry2.FieldBYName('TCAMVPV').AsCurrency );
      end;

      DMCXP.cdsRetencion.FieldByName('USUARIO').AsString := DMCXP.wUsuario;
      DMCXP.cdsRetencion.FieldByName('FREG').AsDateTime  := Date;
      DMCXP.cdsRetencion.FieldByName('HREG').AsDateTime  := time;
      DMCXP.cdsRetencion.FieldByName('MTORETORI').AsCurrency := DMCXP.cdsDetallePres.FieldBYName('IMPRETE').AsCurrency;

      if DMCXP.cdsDetallePres.FieldBYName('TMONID').AsString = 'N' then
      begin
        DMCXP.cdsRetencion.FieldByName('MTORETLOC').AsCurrency := DMCXP.cdsDetallePres.FieldBYName('IMPRETE').AsCurrency ;
        DMCXP.cdsRetencion.FieldByName('MTORETEXT').AsCurrency :=
                redondea(DMCXP.cdsDetallePres.FieldBYName('IMPRETE').AsCurrency / DMCXP.cdsQry2.FieldBYName('TCAMVPV').AsCurrency );
      end
      else
      begin
        DMCXP.cdsRetencion.FieldByName('MTORETEXT').AsCurrency := DMCXP.cdsDetallePres.FieldBYName('IMPRETE').AsCurrency ;
        DMCXP.cdsRetencion.FieldByName('MTORETLOC').AsCurrency :=
                redondea(DMCXP.cdsDetallePres.FieldBYName('IMPRETE').AsCurrency * DMCXP.cdsQry2.FieldBYName('TCAMVPV').AsCurrency );
      end;

      DMCXP.cdsRetencion.FieldByName('FECEMI').AsDateTime := DMCXP.cdsDetallePres.FieldBYName('CPFEMIS').AsDateTime;
      DMCXP.cdsRetencion.FieldByName('TRANDES').AsString := trim(dbeNumero.text) ;
   // Se Recupera en base al Maximo de la Tabla según serie de Tabla FAC103
      DMCXP.cdsRetencion.FieldByName('DOCID2').Clear ;
      DMCXP.cdsRetencion.FieldByName('CPNODOC').Clear ;
      DMCXP.cdsRetencion.FieldByName('CPNOREG').Clear ;
      DMCXP.cdsRetencion.FieldByName('CPSERIE').Clear ;
      DMCXP.cdsRetencion.FieldByName('ECESTADO').Clear ;
      itotal := itotal + DMCXP.cdsDetallePres.FieldBYName('IMPRETE').AsCurrency ;

      DMCXP.cdsRetencion.FieldByName('TCAMB').AsCurrency   := DMCXP.cdsQry2.FieldBYName('TCAMVPV').AsCurrency ;
      DMCXP.cdsRetencion.FieldByName('TMONIDFAC').AsString   := DMCXP.cdsDetallePres.FieldBYName('TMONID').AsString ;
      DMCXP.cdsRetencion.FieldByName('FOTROREG').AsString   := '1' ;
      DMCXP.cdsRetencion.FieldByName('CIARUC').AsString   := wCiaRUC;

      IF (xNumRetencion ='') or (xcliente <> DMCXP.cdsDetallePres.FieldBYName('AUXID').AsString) then
      begin
         ObtenerNumretencion(xCia,xPeriodo,xTDiarId);
         xCliente:= DMCXP.cdsDetallePres.fieldByname('AUXID').AsString;
      End;
      DMCXP.cdsRetencion.FieldByName('RETSERIE').AsString  := xnumserie ;
      DMCXP.cdsRetencion.FieldByName('RETNUMERO').AsString := xnumretencion ;
      DMCXP.cdsRetencion.FieldByName('ECNOCOMP').AsString  := xnumcomprob ;
      DMCXP.cdsRetencion.Post;

      xSQL := 'Insert into CNT320(CIAID, TDIARID, ANOMM, FECPAGO, CLAUXID, AUXID, AUXRUC, DOCID, '
         + '                      SERIE, NODOC, DH, DOCDES, MTOORI, MTOLOC, MTOEXT, USUARIO, '
         + '                      FREG, HREG, MTORETORI, MTORETLOC, MTORETEXT, FECEMI, TRANDES, '
         + '                      TCAMB, TMONIDFAC, '
         + '                      FOTROREG, CIARUC, RETSERIE, RETNUMERO, ECNOCOMP) '
         + '   Values('
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('CIAID').AsString)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('TDIARID').AsString)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('ANOMM').AsString)+','
         +            quotedstr(datetostr(DMCXP.cdsRetencion.FieldByName('FECPAGO').AsDateTime))+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('CLAUXID').AsString)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('AUXID').AsString)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('AUXRUC').AsString)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('DOCID').AsString)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('SERIE').AsString)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('NODOC').AsString)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('DH').AsString)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('DOCDES').AsString)+','
         +            floattostr(DMCXP.cdsRetencion.FieldByName('MTOORI').AsCurrency)+','
         +            floattostr(DMCXP.cdsRetencion.FieldByName('MTOLOC').AsCurrency)+','
         +            floattostr(DMCXP.cdsRetencion.FieldByName('MTOEXT').AsCurrency)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('USUARIO').AsString)+','
         +            quotedstr(datetostr(DMCXP.cdsRetencion.FieldByName('FREG').AsDateTime))+','
         +            quotedstr(datetostr(DMCXP.cdsRetencion.FieldByName('HREG').AsDateTime))+','
         +            floattostr(DMCXP.cdsRetencion.FieldByName('MTORETORI').AsCurrency)+','
         +            floattostr(DMCXP.cdsRetencion.FieldByName('MTORETLOC').AsCurrency)+','
         +            floattostr(DMCXP.cdsRetencion.FieldByName('MTORETEXT').AsCurrency)+','
         +            quotedstr(datetostr(DMCXP.cdsRetencion.FieldByName('FECEMI').AsDateTime))+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('TRANDES').AsString)+','
         +            floattostr(DMCXP.cdsRetencion.FieldByName('TCAMB').AsCurrency)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('TMONIDFAC').AsString)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('FOTROREG').AsString)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('CIARUC').AsString)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('RETSERIE').AsString)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('RETNUMERO').AsString)+','
         +            quotedstr(DMCXP.cdsRetencion.FieldByName('ECNOCOMP').AsString)+')';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al grabar la Retención de IGV');
         xContinuaGrab := False;
         Exit;
      End;
      DMCXP.cdsDetallePres.Next ;
   end;

   ifrac := frac(itotal)* 100 ;
   ltotal := NumLetra(TRUNC(itotal),1,1)+' Y ' + formatfloat('00',ifrac)+ '/100'+' '+DMCXP.wTMonLocDes;

   xSQL := 'Update CNT320 '
      + '      Set RETTOTDES= '+quotedstr(ltotal)
      + '    where RETSERIE='+quotedstr(xnumserie)
      + '      and RETNUMERO='+quotedstr(xnumretencion);
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      xContinuaGrab := False;
      ShowMessage('No se pudo actualizar el Monto en Letras en la Retención');
      Exit;
   End;

   DMCXP.cdsDetallePres.Filtered := False;
   DMCXP.cdsDetallePres.Filter := '';
// Fin HPC_201602_CXP
   }
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
// DAF_2016000978_CXP_1 Ajustes a la Generación y Contabilización de Retenciones IGV.
//                      Reordenamiento de loop por Proveedor y número de Retención

// Reordenamiento de Detalle de la Orden de Pago por Clase y Código de Proveedor
   DMCXP.cdsDetallePres.First;
   DMCXP.cdsDetallePres.Filtered := False;
   DMCXP.cdsDetallePres.Filter := '';
   DMCXP.cdsDetallePres.Filter := 'IMPRETE>0 and PROVRETIGV=''S'' ';
   DMCXP.cdsDetallePres.IndexFieldNames := 'CLAUXID;AUXID;DOCID;CPSERIE;CPNODOC';
   DMCXP.cdsDetallePres.Filtered := True;
   DMCXP.cdsDetallePres.First;

   xClaseAux  := DMCXP.cdsDetallePres.fieldByname('CLAUXID').AsString;
   xProveedor := DMCXP.cdsDetallePres.fieldByname('AUXID').AsString;

// Campos a llenar en CNT320
   if DMCXP.cdsRetencion.Active then
      DMCXP.cdsRetencion.Close;

   xCia:= '02';
   xTDiarId := '40';
   xSQL := 'Select CIAID, TDIARID, ANOMM, ECNOCOMP, FECPAGO, CLAUXID, AUXID, AUXRUC, '
      + '          DOCID, DOCDES, SERIE, NODOC, TRANID, TRANDES, DH, MTOORI, MTOLOC, '
      + '          MTOEXT, USUARIO, FREG, HREG, MTORETORI, MTORETLOC, MTORETEXT, FECEMI, '
      + '          RETSERIE, RETNUMERO, DOCID2, CPNODOC, CPNOREG, CPSERIE, ECESTADO, '
      + '          RETTOTDES, TCAMB, TMONIDFAC, FOTROREG, CIARUC, TASARET, NUMREGRET '
      + '     from CNT320 '
      + '    where 1<>1 ';
   DMCXP.cdsRetencion.DataRequest(xSQL);
   DMCXP.cdsRetencion.Open ;

   DevuelvePeriodo(sAno,sMes);
   xPeriodo := sAno + sMes;

   xSQL := 'Select TCAMVPV '
      + '     from TGE107 '
      + '    where TMONID = ''D'' '
      + '      and FECHA = '+quotedstr(datetostr(dtpFechaCnt.Date));
   DMCXP.cdsQry2.Close;
   DMCXP.cdsQry2.DataRequest(xSQL);
   DMCXP.cdsQry2.Open;
   xTCAMVPV := DMCXP.cdsQry2.FieldBYName('TCAMVPV').AsFloat;

// Inicio HPC_201604_CXP
// Tasa de Retención
   xSQL := 'Select TASACAN '
      + '     from TGE108 '
      + '    where TASATPO=''R'' ';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No hay Tasa de Retención');
      exit;
   End;
   xTasaRet := DMCXP.cdsQry.FieldByName('TASACAN').AsFloat;
// Fin HPC_201604_CXP

   xSQL := 'Select CIARUC from TGE101 where CIAID=' + quotedstr(dblcCia.Text);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   wCiaRUC := DMCXP.cdsQry.FieldByName('CIARUC').AsString;

   While not DMCXP.cdsDetallePres.Eof do
   Begin
      itotal :=0;
      xNumRetencion := '';
      ObtenerNumretencion(xCia,xPeriodo,xTDiarId);

      xClaseAux := DMCXP.cdsDetallePres.FieldBYName('CLAUXID').AsString;
      xProveedor := DMCXP.cdsDetallePres.FieldBYName('AUXID').AsString;
   // Inicio HPC_201604_CXP
      xNumReg := 1;
   // Fin HPC_201604_CXP
      While (DMCXP.cdsDetallePres.FieldBYName('CLAUXID').AsString=xClaseAux) and
            (DMCXP.cdsDetallePres.FieldBYName('AUXID').AsString=xProveedor) and
            not DMCXP.cdsDetallePres.Eof do
      Begin
         DMCXP.cdsRetencion.Append ;
         DMCXP.cdsRetencion.FieldByName('CIAID').AsString   := xCia;
         DMCXP.cdsRetencion.FieldByName('TDIARID').AsString := xTdiarid;
         DMCXP.cdsRetencion.FieldByName('ANOMM').AsString   := xPeriodo;
         DMCXP.cdsRetencion.FieldByName('FECPAGO').AsDateTime := dtpFechaCnt.Date;
         DMCXP.cdsRetencion.FieldByName('CLAUXID').AsString := xClaseAux;
         DMCXP.cdsRetencion.FieldByName('AUXID').AsString   := xProveedor;
         DMCXP.cdsRetencion.FieldByName('AUXRUC').AsString  := DMCXP.cdsDetallePres.FieldBYName('PROVRUC').AsString;
         DMCXP.cdsRetencion.FieldByName('DOCID').AsString   := DMCXP.cdsDetallePres.FieldBYName('DOCID').AsString;
         DMCXP.cdsRetencion.FieldByName('SERIE').AsString   := DMCXP.cdsDetallePres.FieldBYName('CPSERIE').AsString;
         DMCXP.cdsRetencion.FieldByName('NODOC').AsString := DMCXP.cdsDetallePres.FieldBYName('CPNODOC').AsString;

         xSQL := 'Select DOCRESTA, DOCDES '
            + '     from TGE110 '
            + '    where DOCMOD=''CXP'' '
            + '      and DOCID='+quotedstr(DMCXP.cdsDetallePres.FieldBYName('DOCID').AsString);
         DMCXP.cdsQry2.close ;
         DMCXP.cdsQry2.DataRequest(xSQL);
         DMCXP.cdsQry2.Open ;
         if DMCXP.cdsQry2.recordcount > 0 then
         begin
            if DMCXP.cdsQry2.FieldByName('DOCRESTA').AsString='S' then
               DMCXP.cdsRetencion.FieldByName('DH').AsString := 'D'
            else
               DMCXP.cdsRetencion.FieldByName('DH').AsString := 'H';
            DMCXP.cdsRetencion.FieldByName('DOCDES').AsString := DMCXP.cdsQry2.FieldByName('DOCDES').AsString;
         end;
         DMCXP.cdsRetencion.FieldByName('MTOORI').AsCurrency := DMCXP.cdsDetallePres.FieldBYName('CPMTOORI').AsCurrency;

         if DMCXP.cdsDetallePres.FieldBYName('TMONID').AsString = 'N' then
         begin
            DMCXP.cdsRetencion.FieldByName('MTOLOC').AsCurrency := DMCXP.cdsDetallePres.FieldBYName('CPMTOORI').AsCurrency;
            DMCXP.cdsRetencion.FieldByName('MTOEXT').AsCurrency :=
                   redondea(DMCXP.cdsDetallePres.FieldBYName('CPMTOORI').AsCurrency / xTCAMVPV );
         end
         else
         begin
            DMCXP.cdsRetencion.FieldByName('MTOEXT').AsCurrency := DMCXP.cdsDetallePres.FieldBYName('CPMTOORI').AsCurrency;
            DMCXP.cdsRetencion.FieldByName('MTOLOC').AsCurrency :=
                   redondea(DMCXP.cdsDetallePres.FieldBYName('CPMTOORI').AsCurrency * xTCAMVPV );
         end;

         DMCXP.cdsRetencion.FieldByName('USUARIO').AsString := DMCXP.wUsuario;
         DMCXP.cdsRetencion.FieldByName('FREG').AsDateTime  := Date;
         DMCXP.cdsRetencion.FieldByName('HREG').AsDateTime  := time;
         DMCXP.cdsRetencion.FieldByName('MTORETORI').AsCurrency := DMCXP.cdsDetallePres.FieldBYName('IMPRETE').AsCurrency;

         if DMCXP.cdsDetallePres.FieldBYName('TMONID').AsString = 'N' then
         begin
            DMCXP.cdsRetencion.FieldByName('MTORETLOC').AsCurrency := DMCXP.cdsDetallePres.FieldBYName('IMPRETE').AsCurrency ;
            DMCXP.cdsRetencion.FieldByName('MTORETEXT').AsCurrency :=
                   redondea(DMCXP.cdsDetallePres.FieldBYName('IMPRETE').AsCurrency / xTCAMVPV );
         end
         else
         begin
            DMCXP.cdsRetencion.FieldByName('MTORETEXT').AsCurrency := DMCXP.cdsDetallePres.FieldBYName('IMPRETE').AsCurrency ;
            DMCXP.cdsRetencion.FieldByName('MTORETLOC').AsCurrency :=
                   redondea(DMCXP.cdsDetallePres.FieldBYName('IMPRETE').AsCurrency * xTCAMVPV );
         end;

         DMCXP.cdsRetencion.FieldByName('FECEMI').AsDateTime := DMCXP.cdsDetallePres.FieldBYName('CPFEMIS').AsDateTime;
         DMCXP.cdsRetencion.FieldByName('TRANDES').AsString := trim(dbeNumero.text) ;
      // Se Recupera en base al Maximo de la Tabla según serie de Tabla FAC103
         DMCXP.cdsRetencion.FieldByName('DOCID2').Clear ;
         DMCXP.cdsRetencion.FieldByName('CPNODOC').Clear ;
         DMCXP.cdsRetencion.FieldByName('CPNOREG').Clear ;
         DMCXP.cdsRetencion.FieldByName('CPSERIE').Clear ;
         DMCXP.cdsRetencion.FieldByName('ECESTADO').Clear ;
       //  itotal := itotal + DMCXP.cdsDetallePres.FieldBYName('IMPRETE').AsCurrency ;
         itotal := itotal + DMCXP.cdsRetencion.FieldBYName('MTORETLOC').AsCurrency ;

         DMCXP.cdsRetencion.FieldByName('TCAMB').AsCurrency   := xTCAMVPV ;
         DMCXP.cdsRetencion.FieldByName('TMONIDFAC').AsString := DMCXP.cdsDetallePres.FieldBYName('TMONID').AsString ;
         DMCXP.cdsRetencion.FieldByName('FOTROREG').AsString  := '1' ;
         DMCXP.cdsRetencion.FieldByName('CIARUC').AsString    := wCiaRUC;

         DMCXP.cdsRetencion.FieldByName('RETSERIE').AsString  := xnumserie ;
         DMCXP.cdsRetencion.FieldByName('RETNUMERO').AsString := xnumretencion ;
         DMCXP.cdsRetencion.FieldByName('ECNOCOMP').AsString  := xnumcomprob ;
         DMCXP.cdsRetencion.Post;

// Inicio HPC_201604_CXP
         xSQL := 'Insert into CNT320(CIAID, TDIARID, ANOMM, FECPAGO, CLAUXID, AUXID, AUXRUC, DOCID, '
            + '                      SERIE, NODOC, DH, DOCDES, MTOORI, MTOLOC, MTOEXT, USUARIO, '
            + '                      FREG, HREG, MTORETORI, MTORETLOC, MTORETEXT, FECEMI, TRANDES, '
            + '                      TCAMB, TMONIDFAC, '
            + '                      FOTROREG, CIARUC, RETSERIE, RETNUMERO, ECNOCOMP, TASARET, NUMREGRET) '
            + '   Values('
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('CIAID').AsString)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('TDIARID').AsString)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('ANOMM').AsString)+','
            +            quotedstr(datetostr(DMCXP.cdsRetencion.FieldByName('FECPAGO').AsDateTime))+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('CLAUXID').AsString)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('AUXID').AsString)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('AUXRUC').AsString)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('DOCID').AsString)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('SERIE').AsString)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('NODOC').AsString)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('DH').AsString)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('DOCDES').AsString)+','
            +            floattostr(DMCXP.cdsRetencion.FieldByName('MTOORI').AsCurrency)+','
            +            floattostr(DMCXP.cdsRetencion.FieldByName('MTOLOC').AsCurrency)+','
            +            floattostr(DMCXP.cdsRetencion.FieldByName('MTOEXT').AsCurrency)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('USUARIO').AsString)+','
            +            ' trunc(sysdate),'
            +            ' sysdate,'
            +            floattostr(DMCXP.cdsRetencion.FieldByName('MTORETORI').AsCurrency)+','
            +            floattostr(DMCXP.cdsRetencion.FieldByName('MTORETLOC').AsCurrency)+','
            +            floattostr(DMCXP.cdsRetencion.FieldByName('MTORETEXT').AsCurrency)+','
            +            quotedstr(datetostr(DMCXP.cdsRetencion.FieldByName('FECEMI').AsDateTime))+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('TRANDES').AsString)+','
            +            floattostr(DMCXP.cdsRetencion.FieldByName('TCAMB').AsCurrency)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('TMONIDFAC').AsString)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('FOTROREG').AsString)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('CIARUC').AsString)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('RETSERIE').AsString)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('RETNUMERO').AsString)+','
            +            quotedstr(DMCXP.cdsRetencion.FieldByName('ECNOCOMP').AsString)+ ', '
            +            floatToStr(xTasaRet) + ', '
            +            'trim(to_char(' + inttostr(xNumReg) + ',' + quotedstr('000') + ')))';
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error al grabar la Retención de IGV');
            xContinuaGrab := False;
            Exit;
         End;
         DMCXP.cdsDetallePres.Next;
         xNumReg := xNumReg + 1;
      end;
// Fin HPC_201604_CXP

      ifrac := frac(itotal)* 100 ;
      ltotal := NumLetra(TRUNC(itotal),1,1)+' Y ' + formatfloat('00',ifrac)+ '/100'+' '+DMCXP.wTMonLocDes;

      xSQL := 'Update CNT320 '
         + '      Set RETTOTDES= '+quotedstr(ltotal)
         + '    where RETSERIE='+quotedstr(xnumserie)
         + '      and RETNUMERO='+quotedstr(xnumretencion);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         xContinuaGrab := False;
         ShowMessage('No se pudo actualizar el Monto en Letras en la Retención');
         Exit;
      End;
   //
   // Inicio HPC_201604_CXP
   // Agrega rutina que genera archivo para SUNAT
      Try
      xSQL := ' Begin '
            + '    DB2ADMIN.SP_TXT_CNT320_RETIGV2(' + quotedstr(xnumserie) + ','
            +      quotedstr(xnumretencion) + ','
            +      QuotedStr(DMCXP.wUsuario) + ','
            +      QuotedStr('ACEPTADO')     + ','
            +      QuotedStr(wIP_Impresora)  + '); '
            + ' End;';
          DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         xContinuaGrab := False;
         ShowMessage('No se pudo generar el archivo txt para SUNAT');
         Exit;
      End;
{
      if DMCXP.DCOM1.AppServer.GenTxtCRE('02', xnumserie, xnumretencion, DMCXP.cdsRetencion.FieldByName('DOCID').AsString)='OK' then
         ShowMessage('CRE Generado correctamente')
      Else
      Begin
         ShowMessage('CRE no se Generó');
         Exit;
      End;
}
   // Resolviendo ID de Envio
      xsClave :=  '02' + xnumserie + xnumretencion;

   // Resolviendo último número de Envio
      xSQL := 'Select max(NUMENVRET) NUMENVRET '
         + '     from db2admin.CAJA_CERT_RETIGV '
         + '    where CODRETIGV = '+QuotedStr(xsClave);
      DMCXP.cdsQry4.Close;
      DMCXP.cdsQry4.DataRequest(xSQL);
      DMCXP.cdsQry4.Open;

   // Resolviendo Tipo de Documento Sunat
      xSQL := 'Select TDOC_SUNAT '
         + '  From db2admin.TGE110 '
         + '  Where DOCID = ' +QuotedStr(DMCXP.cdsRetencion.FieldByName('DOCID').AsString);
      DMCXP.cdsQry6.Close;
      DMCXP.cdsQry6.DataRequest(xSQL);
      DMCXP.cdsQry6.Open;

      xTDocSunat := DMCXP.cdsQry6.FieldByName('TDOC_SUNAT').AsString;

   // Resolviendo Carpeta para Archivo
      xSQL := 'Select RUTADES '
         + '  From db2admin.TGE837 '
         + '  Where APLIC = ' +QuotedStr('RET')
         + '   And RUTAID = ' +QuotedStr(wId_Rutadest);
      DMCXP.cdsQry6.Close;
      DMCXP.cdsQry6.DataRequest(xSQL);
      DMCXP.cdsQry6.Open;

      xCarpeta := DMCXP.cdsQry6.FieldByName('RUTADES').AsString;

   // Seleccionando Registros para escribir en Txt
      xSQL := 'Select NUMDETLIN, DESDETLIN '
         +    '  from db2admin.CAJA_CERT_RETIGV '
         +    '  where CODRETIGV  = ' +QuotedStr(xsClave)
         +    '    and NUMENVRET  = ' +inttostr(DMCXP.cdsQry4.FieldByName('NUMENVRET').AsInteger);
   //      +    '     and ESTADOFAC = ' +QuotedStr('ACEPTADO');
      DMCXP.cdsQry8.Close;
      DMCXP.cdsQry8.DataRequest(xSQL);
      DMCXP.cdsQry8.Open;
      DMCXP.cdsQry8.IndexFieldNames := 'NUMDETLIN';

   //
      xsNombreTxt := xCarpeta+'RE_'+xTDocSunat+'_'+xnumserie+'_'+xnumretencion+'.txt';
      AssignFile(xfArchivoTexto, xsNombreTxt);
      Rewrite(xfArchivoTexto);

      DMCXP.cdsQry8.First;
      while not DMCXP.cdsQry8.EOF do
      Begin
         WriteLn(xfArchivoTexto, DMCXP.cdsQry8.FieldByName('DESDETLIN').AsString);
         DMCXP.cdsQry8.Next;
      End;
      CloseFile(xfArchivoTexto);

   // Fin HPC_201604_CXP

   End;

//
   DMCXP.cdsDetallePres.Filtered := False;
   DMCXP.cdsDetallePres.Filter := '';
// Fin HPC_201603_CXP
End;

Procedure TFOrdenPagoCab.z2bbtnAnulaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMCXP.cdsOPago.fieldByname('USUCONTA').AsString <> '' Then
   Begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      ShowMessage('Orden de Pago esta Contabilizada. No se puede Anular');
// Fin HPC_201707_CXP
      Exit;
   End;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'C' Then
   Begin
      ShowMessage('Orden de Pago esta Confirmada. No se puede Anular');
      Exit;
   End;
// Fin HPC_201707_CXP
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago Esta Anulada');
      Exit;
   End;

   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'P' Then
   Begin
      If MessageDlg('Orden de Pago se encuentra Aceptada ¿ Desea Anular ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
         Exit;
   End
   Else
   Begin
      If MessageDlg('¿ Desea Anular Orden de Pago?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
         Exit;
   End;

   If DMCXP.cdsOPago.fieldByname('NUMERO').AsString = '' Then
      ShowMessage('Error al Grabar')
   Else
   Begin
      DMCXP.cdsOPago.Edit;
      DMCXP.cdsOPago.fieldByname('ESTADO').AsString := 'A';
      DMCXP.cdsOPago.fieldByname('USUANULA').AsString := DMCXP.wUsuario;
      DMCXP.cdsOPago.fieldByname('FECANU').AsDateTime := Date;
      DMCXP.cdsOPago.Post;

      xSQL := 'Update CXP_ORD_PAG_CAB '
             +'   set ESTADO='+quotedstr('A')+', '
             +'       USUANULA='+quotedstr(DMCXP.wUsuario)+', '
             +'       FECANU= trunc(sysdate) '
             +' where CIAID='+quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
             +'   and NUMERO='+quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en la Aceptación de la Orden de Pago');
         Exit;
      End;

      xSQL := 'Update CNT320 '
             +'   set ECESTADO='+quotedstr('A')+', '
             +'       FREG=trunc(sysdate), '
             +'       HREG= sysdate '
             +' where CIAID='+quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
             +'   and TRANDES='+quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en la Anulación de la retención');
         Exit;
      End;

      If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then edtEstado.Text := 'ANULADO';
      pnlCab.Enabled := False;
      pnlCab2.Enabled := False;
      ShowMessage('Anulada');
   End;
End;

Procedure TFOrdenPagoCab.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMCXP.cdsOPago.CancelUpdates;
   FOrdenPago.bbtnBuscarClick(Sender);
   DMCXP.cdsReporte.Close;
   DMCXP.cdsReporte.IndexFieldNames:='';
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   DMCXP.cdsMovCxP.Filter := '';
   DMCXP.cdsMovCxP.Filtered := false;
   DMCXP.cdsMovCxP.IndexFieldNames := '';
   DMCXP.cdsMovCxP.close;
// Fin HPC_201707_CXP
End;

Procedure TFOrdenPagoCab.dblcCCBcoEnter(Sender: TObject);
Begin
   If dblcBanco.text = '' Then
   Begin
      ShowMessage('Debe ingresar Banco');
   End;
End;

// Inicio HPC_201703_CXP
// Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
Procedure TFOrdenPagoCab.dbgDetalleDblClick(Sender: TObject);
var
  xSQL : String;
Begin

   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'P' Then
   Begin
      ShowMessage('Orden de Pago se encuentra Aceptada');
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      Exit;
// Fin HPC_201707_CXP
   End;

   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago se encuentra Anulada');
      Exit;
   End;

   If DMCXP.cdsOPago.fieldByname('USUCONTA').AsString <> '' Then
   Begin
      ShowMessage('Orden de Pago ya fue contabilizada');
      Exit;
   End;

   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'C' Then
   Begin
      ShowMessage('Orden de Pago ya se encuentra CONFIRMADA');
      Exit;
   End;

   If MessageDlg('Si desea validar SEMT presionar (YES)' + #13 +
                      'Si desea cambiar importes, otros descuentos presionar (NO): ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
         if DMCXP.cdsDetallePres.FieldByname('VALORDPAG').AsString='N' then
         begin
            DMCXP.cdsDetallePres.Edit;
            DMCXP.cdsDetallePres.FieldByname('VALORDPAG').AsString:='S'
         end
         else
         begin
            DMCXP.cdsDetallePres.Edit;
            DMCXP.cdsDetallePres.FieldByname('VALORDPAG').AsString:='N';
         end;

        DMCXP.cdsDetallePres.Post;

        xSQL := ' update CXP_ORD_PAG_DET '
               +'   set VALORDPAG='+quotedstr(DMCXP.cdsDetallePres.fieldByname('VALORDPAG').AsString)+' '
               +' where CIAID='+quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
               +'   and NUMERO='+quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString)
               +'   and ITEM='+quotedstr(DMCXP.cdsDetallePres.fieldByname('ITEM').AsString);
        Try
           DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
        Except
           ShowMessage('Error en la actualización del registro en la cabecera..');
           DMCXP.DCOM1.AppServer.RetornaTransaccion;
           Exit;
        End;

        xSQL := 'Select D.CIAID, D.NUMERO, D.ITEM, D.CLAUXID, D.AUXID, D.DOCID, D.CPSERIE, D.CPNODOC, D.TMONID, D.CPMTOORI, D.CPPAGORI, D.CPSALORI, D.IMPPAGO, D.IMPRETE, D.FREG, D.HREG, D.USUARIO, '
              + '       D.ESTADO, D.IMPDEVO, D.RQCIAID, D.RQORIGEN, D.NUMDETRAC, D.NUMCONSTA,'
              + '       C.CIAID, C.CPANOMES, C.TDIARID, C.CPNOREG, C.CLAUXID, C.PROV, C.PROVRUC, C.DOCID, C.CPSERIE, C.CPNODOC, C.CPFRECEP, C.CPFEMIS, C.CPFVCMTO, C.TMONID, C.CPTCAMPR, C.CPTCAMPA, '
              + '       C.CPESTADO, C.CPOCOMP, C.CP_CONTA, C.CPGRAVAD, C.CPNOGRAV, C.CPIGV, C.CPISC, C.CPDCTO, C.CPSERVIC, C.CPMTOORI, C.CPMTOLOC, C.CPMTOEXT, C.CPPAGORI, C.CPPAGLOC, C.CPPAGEXT, '
              + '       C.CPSALORI, C.CPSALLOC, C.CPSALEXT, C.TCANJEID, C.CPCANJE, C.CPFCANJE, C.CPUSER, C.CPFREG, C.CPHREG, C.CPAAAA, C.CPMM, C.CPDD, C.CPTRI, C.CPSEM, C.CPSS, C.CPAATRI, C.CPAASEM, '
              + '       C.CPAASS, C.CPFCMPRB, C.DCPLOTE, C.DCPCOMP, C.CTATOTAL, C.FLAGVAR, C.CPTOTOT, C.CPIGV2, C.CPGRAVAD2, C.CPHMOD, C.FLAGVAR2, C.PROVDES, C.CLAUXREND, C.AUXIDREND, C.CCBCOID, '
              + '       C.BANCOID, C.SITUAID, C.CPFLAGTDOC, C.CXPRRHH, C.AUXIDINTER, C.CLAUXINTER, C.CPTCAMDOL, C.PROVRETIGV, C.CPTCAMAJ, C.DTRPORC, C.CPMTOORIB, C.DTRFLAG, C.FECDEPDET, C.NUMDEPDET, '
              + '       C.ADQ_NO_GRAV, C.IGV_GRA_NO_DEST, C.CP_OTROS, C.CPTODETRSUNATID, C.TIPOOPERSUNATID, C.PORCDESC, C.CP4TAPENSION, C.SNPAFPID, C.TIPCOMAFPID, D.IMPOTRDTO, D.OBSERVA, D.CTAOTRDTO,D.VALORDPAG '
              + '  from CXP_ORD_PAG_DET D '
              + ' INNER JOIN CXP301 C ON D.CLAUXID = C.CLAUXID AND D.AUXID=C.PROV AND D.DOCID = C.DOCID AND D.CPSERIE =C.CPSERIE and D.CPNODOC = C.CPNODOC '
              + ' where D.CIAID =''' + DMCXP.cdsOPago.FieldByname('CIAID').AsString + ''' '
              + '   and D.NUMERO=''' + DMCXP.cdsOPago.FieldByname('NUMERO').AsString + ''' '
              + '   and C.CPESTADO in (''C'',''P'') '
              + ' order by D.ITEM';
      // Fin HPC_201604_CXP

        DMCXP.cdsSQL.Close;
        DMCXP.cdsSQL.DataRequest(xSQL);
        DMCXP.cdsSQL.Open;

        CargaGridDetalle;
   end
   else
   begin

        Try
           FEditaOP := TFEditaOP.Create(SELF);

           If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'P' Then
           Begin
              FEditaOP.pnlcab.enabled := False;
              FEditaOP.dbeRetencion.enabled := False;
              FEditaOP.bbtnCamb.enabled := False;
           End;

           FEditaOP.ShowModal;
        Finally
           FEditaOP.Free;
        End;
   end;

End;
// Fin HPC_201703_CXP 

Procedure TFOrdenPagoCab.dblcBancoNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFOrdenPagoCab.dblcCCBcoNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFOrdenPagoCab.bbtnRetClick(Sender: TObject);
Var
   xLLave, xNumRet, xSQL, xCiaAbr: String;
   xNoComp, xPeriodo, xOrigen, xLote, xTCambio, xCta166, xCta466, xWhere, xCtaRet: String;
// Inicio HPC_201601_CXP
// se incluye variable xNumSer para incluir en llave de búsqueda de Retenciones
   xNumSer, xGlosa: String;
// HPC_201602_CXP
// DAF_2016000574_CXP_1 Variables nuevas para ajustes a la Contabilización de Retenciones
   xCabFilial, xAsiRetCia02 : boolean;
// Fin HPC_201602_CXP
// Fin HPC_201601_CXP
Begin
   xWhere := 'CIAID=' + quotedstr(dblcCia.Text);
   xCiaAbr := BuscaQry('dspTGE', 'TGE101', 'CIAABR,CIARETIGV,EXOIGV', xWhere, 'CIAABR');
// Inicio HPC_201601_CXP
// se incluye variable xNumSer para incluir en llave de búsqueda de Retenciones
   xNumSer:= '';
// Fin HPC_201601_CXP
   xCtaRet := '4010105';
   xOrigen := '53';
   xPeriodo := Copy(dtpFecha.text, 7, 4) + Copy(dtpFecha.text, 4, 2);
   //xLote :='ABCT';
   xLote := Copy(dbeNumero.Text, 3, 4);
   xTCambio := '0';
// Inicio HPC_201604_CXP
   xWhere := 'TMONID='+quotedstr(DMCXP.wTMonExt)+' and FECHA=''' + dtpFecha.text + '''';
// Fin HPC_201604_CXP
   If length(BuscaQry('PrvTGE', 'TGE107', '*', xWhere, 'TMONID')) > 0 Then
      xTCambio := FloatToStr(DMCXP.cdsQry.fieldbyname('TCAM' + DMCXP.wVRN_TipoCambio).AsFloat);

   If xTCambio = '0' Then
   Begin
      ShowMessage('Falta ingresar el Tipo de Cambio');
      Exit;
   End;

   xSQL := 'Select CTADEBE, B.CTA_AUX AUX_D, B.CTA_CCOS CCOS_D, CTAHABER, C.CTA_AUX AUX_H, C.CTA_CCOS CCOS_H, TDIARID, CIAORIGEN, TDIARID2 '
         + '  from CAJA103 A, TGE202 B, TGE202 C '
         + ' where A.CIAID=''' + dblcCia.Text + ''' '
         + '   and B.CIAID=A.CIAID AND A.CTADEBE=B.CUENTAID '
         + '   and C.CIAID=A.CIAID AND A.CTAHABER=C.CUENTAID ';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   xCta166 := DMCXP.cdsQry.FieldByName('CTADEBE').AsString;
   xCta466 := DMCXP.cdsQry.FieldByName('CTAHABER').AsString;

   If dblcCia.Text = '02' Then xCta466 := xCtaRet;

      // ACTUALIZA SALDOS
   DMCXP.cdsDetallePres.First;
   DMCXP.cdsDetallePres.Filtered := False;
   DMCXP.cdsDetallePres.Filter := '';
   DMCXP.cdsDetallePres.Filter := 'IMPRETE>0';
   DMCXP.cdsDetallePres.IndexFieldNames := 'CLAUXID;AUXID;DOCID;CPSERIE;CPNODOC';
   DMCXP.cdsDetallePres.Filtered := True;

// Inicio HPC_201601_CXP
// Se cambia forma de alimentar las retenciones ya que una Orden de Pago puede
// tener en simultáneo Detracciones y Retenciones
// se incluye Número de Serie para incluir en llave de búsqueda de Retenciones

(*
   xLLave := '';
   DMCXP.cdsDetallePres.First;
   While Not DMCXP.cdsDetallePres.Eof Do
   Begin
      If xLLave <> DMCXP.cdsDetallePres.FieldByname('CLAUXID').AsString + DMCXP.cdsDetallePres.FieldByname('AUXID').AsString Then
      Begin
         xSQL := 'Select CIAID, CLAUXID, AUXID, DOCID, SERIE, NODOC, MTOORI, MTORETORI, RETSERIE, RETNUMERO '
               + '  from CNT320 '
               + ' where CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
               + '   and CLAUXID=''' + DMCXP.cdsDetallePres.fieldByname('CLAUXID').AsString + ''' '
               + '   and AUXID=''' + DMCXP.cdsDetallePres.fieldByname('AUXID').AsString + ''' '
               + '   and DOCID=''' + DMCXP.cdsDetallePres.fieldByname('DOCID').AsString + ''' '
               + '   and NODOC LIKE ''%' + DMCXP.cdsDetallePres.fieldByname('CPNODOC').AsString + '%'' AND NVL(ECESTADO,''P'')<>''A'''
               + '   and FECPAGO>=''' + DateToStr(dtpFecha.Date - 2) + '''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.indexfieldnames := '';
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;

         xNumRet := DMCXP.cdsQry.fieldByname('RETNUMERO').AsString;

         xSQL := 'Select CIAID, CLAUXID, AUXID, DOCID, SERIE, NODOC, MTOORI, MTORETORI, RETSERIE, RETNUMERO '
               + '  from CNT320 '
               + ' where CIAID=''' + DMCXP.cdsQry.fieldByname('CIAID').AsString + ''' AND RETNUMERO=''' + xNumret + '''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.indexfieldnames := '';
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;

         /////////////

          //////////////////////////////////
         //  ASIENTO EN COMPAÑIA FILIAL  //
         //////////////////////////////////

         xSQL := 'Select LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
               + ' where CIAID=''' + dblcCia.Text + ''' AND CNTANOMM=''' + xPeriodo + ''' AND TDIARID=''' + xOrigen + '''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.indexfieldnames := '';
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;
         xNoComp := DMCXP.cdsQry.FieldByName('NOCOMP').AsString;

         // cabecera
         xSQL := 'Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
               + '                    CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
               + '                    CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
               + '                    CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
               + '                    TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
               + 'Select ''' + dblcCia.Text + ''', ''' + xOrigen + ''', ''' + xNoComp + ''', '
               + '       ''' + xPeriodo + ''', ''' + xLote + ''', ''P:' + dbeNumPla.text + ' / ' + dblcCia.Text + ' / Ret:''||RETNUMERO, ' + xTCambio + ', ''' + dtpFecha.text + ''', '
               + '       ''I'', ''N'', NULL, ''' + DMCXP.wUsuario + ''', SYSDATE, SYSDATE, max(b.fecano) , max(b.fecmes), max(b.fecdia), '
               + '       max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), ''N'' TMONID,  NULL, NULL, NULL, '
               + '       max(TDIARDES), sum(A.MTORETLOC), sum(MTORETEXT), sum(A.MTORETLOC), sum(MTORETEXT), 0, 0, NULL, ''CXP'', ''CXP'' '
               + '  from CNT320 A, TGE114 B, TGE104 C '
               + ' where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
               + '   and RETNUMERO=''' + xNumret + ''' '
               + '   and ''' + dtpFecha.text + '''=B.FECHA '
               + '   and C.TDIARID=''' + xOrigen + ''' '
               + ' group by RETNUMERO';
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            xContinuaGrab := False;
            ShowMessage('Error en la Grabación de Retenciones Cabecera');
            Exit;
         End;
         // DETALLE 1
         xSQL := 'Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
               + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
               + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
               + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
               + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
               + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
               + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
               + 'Select ''' + dblcCia.Text + ''', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , b.fecano, ''' + xPeriodo + ''', ''' + xLote + ''', D.CTATOTAL, D.CLAUXID, PROV, '
               + '       D.DOCID, D.CPSERIE, D.CPNODOC, SUBSTR(D.PROVDES,1,40), ''D'', NULL, ' + xTCambio + ', A.MTORETLOC, A.MTORETLOC, MTORETEXT, '
               + '       D.CPFEMIS, D.CPFVCMTO, ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMCXP.wUsuario + ''', '
               + '       SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, '
               + '       ''N'' TMONID, NULL, NULL, NULL, C.TDIARDES, E.CTAABR, SUBSTR(D.PROVDES,1,15), F.DOCABR, NULL, '
               + '       A.MTORETLOC, MTORETEXT, 0, 0, 0, 0, NULL, NULL, '
               + '       NULL, ''CXP'', ROWNUM, ''CXP'', NULL '
               + '  from CNT320 A, CXP301 D, TGE114 B, TGE104 C, TGE202 E, TGE110 F '
               + ' where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
               + '   and RETNUMERO=''' + xNumret + ''' '
               + '   and D.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
               + '   and A.CLAUXID=D.CLAUXID AND A.AUXID=D.PROV AND A.DOCID=D.DOCID(+) '
               + '   and CAST(D.CPNODOC AS NUMERIC)= CAST(NODOC AS NUMERIC) '
               + '   and D.CPSERIE = SERIE '
               + '   and D.CPESTADO IN (''P'',''C'') '
               + '   and B.FECHA(+)=''' + dtpFecha.text + ''' '
               + '   and C.TDIARID(+)=''' + xOrigen + ''' '
               + '   and A.CIAID=E.CIAID AND D.CTATOTAL=E.CUENTAID '
               + '   and A.DOCID=F.DOCID ';
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            xContinuaGrab := False;
            ShowMessage('Error en la Grabación de Retenciones Detalle 1');
            Exit;
         End;

         // DETALLE 2
         xSQL := 'Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
               + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
               + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
               + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
               + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
               + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
               + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
               + 'Select ''' + dblcCia.Text + ''', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , max(b.fecano), ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCta466 + ''', NULL, NULL, '
               + '       ''49'', RETSERIE, RETNUMERO, ''P:' + dbeNumPla.text + ' / Ret:''||RETNUMERO, ''H'', NULL, ' + xTCambio + ', sum(A.MTORETLOC), sum(A.MTORETLOC), sum(A.MTORETEXT), '
               + '       ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMCXP.wUsuario + ''', '
               + '       SYSDATE, SYSDATE, max(b.fecmes), max(b.fecdia), max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
               + '       ''N'' TMONID, NULL, NULL, NULL, MAX(C.TDIARDES), MAX(E.CTAABR), NULL, ''A Cuenta'', NULL, '
               + '       0, 0, sum(A.MTORETLOC), sum(A.MTORETEXT), 0, 0, NULL, NULL, '
               + '       NULL, ''CXP'', ' + IntToStr(DMCXP.cdsDetallePres.RecordCount + 1) + ', ''CXP'', NULL '
               + '  from CNT320 A, TGE114 B, TGE104 C, TGE202 E '
               + ' where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
               + '   and RETNUMERO=''' + xNumret + ''' '
               + '   and B.FECHA(+)=''' + dtpFecha.text + ''' '
               + '   and C.TDIARID(+)=''' + xOrigen + ''' '
               + '   and A.CIAID=E.CIAID AND ''' + xCta466 + '''=E.CUENTAID '
               + ' group by RETSERIE, RETNUMERO';
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            xContinuaGrab := False;
            ShowMessage('Error en la Grabación de Retenciones Detalle 2');
            Exit;
         End;

         ///////////////////////////////
         //  ASIENTO EN COMPAÑIA 02   //
         ///////////////////////////////

         xSQL := 'Select LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
               + ' where CIAID=''02'' AND CNTANOMM=''' + xPeriodo + ''' AND TDIARID=''' + xOrigen + '''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.indexfieldnames := '';
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;
         xNoComp := DMCXP.cdsQry.FieldByName('NOCOMP').AsString;

         If dblcCia.Text <> '02' Then
         Begin
            // cabecera
            xSQL := 'Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
                  + '                    CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
                  + '                    CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
                  + '                    CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
                  + '                    TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
                  + 'Select ''02'', ''' + xOrigen + ''', ''' + xNoComp + ''', '
                  + '       ''' + xPeriodo + ''', ''' + xLote + ''', ''Ret:''||RETNUMERO||'' ' + xCiaAbr + ''', ' + xTCambio + ', ''' + dtpFecha.text + ''', '
                  + '       ''I'', ''N'', NULL, ''' + DMCXP.wUsuario + ''', SYSDATE, SYSDATE, max(b.fecano) , max(b.fecmes), max(b.fecdia), '
                  + '       max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), ''N'' TMONID,  NULL, NULL, NULL, '
                  + '       max(TDIARDES), sum(A.MTORETLOC), sum(MTORETEXT), sum(A.MTORETLOC), sum(MTORETEXT), 0, 0, NULL, ''CXP'', ''CXP'' '
                  + '  from CNT320 A, TGE114 B, TGE104 C '
                  + ' Where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
                  + '   AND RETNUMERO=''' + xNumret + ''' '
                  + '   AND ''' + dtpFecha.text + '''=B.FECHA '
                  + '   AND C.TDIARID=''' + xOrigen + ''' '
                  + ' GROUP BY RETNUMERO';
            Try
               DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               xContinuaGrab := False;
               ShowMessage('Error en la Grabación de Retenciones Cabecera Cia<>02');
               Exit;
            End;

            // DETALLE 1
            xSQL := 'Insert INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + 'Select ''02'', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , max(b.fecano), ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCta166 + ''', NULL, NULL, '
                  + '       ''49'', RETSERIE, RETNUMERO, ''P:' + dbeNumPla.text + ' / Ret:''' + '||RETNUMERO, ''D'', NULL, ' + xTCambio + ', sum(A.MTORETLOC), sum(A.MTORETLOC), sum(A.MTORETEXT), '
                  + '       ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMCXP.wUsuario + ''', '
                  + '       SYSDATE, SYSDATE, max(b.fecmes), max(b.fecdia), max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
                  + '       ''N'' TMONID, NULL, NULL, NULL, MAX(C.TDIARDES), MAX(E.CTAABR), NULL, ''A Cuenta'', NULL, '
                  + '       sum(A.MTORETLOC), sum(A.MTORETEXT), 0, 0, 0, 0, NULL, NULL, '
                  + '       NULL, ''CXP'', ' + IntToStr(1) + ', ''CXP'', NULL '
                  + '  from CNT320 A, TGE114 B, TGE104 C, TGE202 E '
                  + ' where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
                  + '   and RETNUMERO=''' + xNumret + ''' '
                  + '   and B.FECHA(+)=''' + dtpFecha.text + ''' '
                  + '   and C.TDIARID(+)=''' + xOrigen + ''' '
                  + '   and ''02''=E.CIAID AND ''' + xCta166 + '''=E.CUENTAID '
                  + ' group by RETSERIE, RETNUMERO';
            Try
               DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               xContinuaGrab := False;
               ShowMessage('Error en la Grabación de Retenciones Detalle 1 Cia<>02');
               Exit;
            End;

            // DETALLE 2
            xSQL := 'Insert INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + 'Select ''02'', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , max(b.fecano), ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCtaRet + ''', NULL, NULL, '
                  + '       ''49'', RETSERIE, RETNUMERO, ''' + Trim(xCiaAbr) + ' / Ret:''||RETNUMERO, ''H'', NULL, ' + xTCambio + ', sum(A.MTORETLOC), sum(A.MTORETLOC), sum(A.MTORETEXT), '
                  + '       ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMCXP.wUsuario + ''', '
                  + '       SYSDATE, SYSDATE, max(b.fecmes), max(b.fecdia), max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
                  + '       ''N'' TMONID, NULL, NULL, NULL, MAX(C.TDIARDES), MAX(E.CTAABR), NULL, ''A Cuenta'', NULL, '
                  + '       0, 0, sum(A.MTORETLOC), sum(A.MTORETEXT), 0, 0, NULL, NULL, '
                  + '       NULL, ''CXP'', ' + IntToStr(2) + ', ''CXP'', NULL '
                  + '  from CNT320 A, TGE114 B, TGE104 C, TGE202 E '
                  + ' where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
                  + '   and RETNUMERO=''' + xNumret + ''' '
                  + '   and B.FECHA(+)=''' + dtpFecha.text + ''' '
                  + '   and C.TDIARID(+)=''' + xOrigen + ''' '
                  + '   and ''02''=E.CIAID AND ''' + xCtaRet + '''=E.CUENTAID '
                  + ' group by RETSERIE, RETNUMERO';
            Try
               DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               xContinuaGrab := False;
               ShowMessage('Error en la Grabación de Retenciones Detalle 2 Cia<>02');
               Exit;
            End;
         End;

         xLLave := DMCXP.cdsDetallePres.FieldByname('CLAUXID').AsString + DMCXP.cdsDetallePres.FieldByname('AUXID').AsString;
      End;
      DMCXP.cdsDetallePres.Next;
   End;
*)

// Inicio HPC_201602_CXP - DAF_2016000574_CXP_1
// Ajustes a la Contabilización de Retenciones
   xLLave := '';
   DMCXP.cdsDetallePres.First;
   While Not DMCXP.cdsDetallePres.Eof Do
   Begin
      xCabFilial := True;
      xAsiRetCia02 :=  True;

      xLLave := DMCXP.cdsDetallePres.FieldByname('CLAUXID').AsString + DMCXP.cdsDetallePres.FieldByname('AUXID').AsString;
      While (DMCXP.cdsDetallePres.FieldByname('CLAUXID').AsString + DMCXP.cdsDetallePres.FieldByname('AUXID').AsString = xLLave)
        and (Not DMCXP.cdsDetallePres.Eof) Do
      Begin
         xSQL := 'Select CIAID, CLAUXID, AUXID, DOCID, SERIE, NODOC, MTOORI, MTORETORI, RETSERIE, RETNUMERO '
               + '  from CNT320 '
               + ' where CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
               + '   and CLAUXID=''' + DMCXP.cdsDetallePres.fieldByname('CLAUXID').AsString + ''' '
               + '   and AUXID=''' + DMCXP.cdsDetallePres.fieldByname('AUXID').AsString + ''' '
               + '   and DOCID=''' + DMCXP.cdsDetallePres.fieldByname('DOCID').AsString + ''' '
               + '   and NODOC LIKE ''%' + DMCXP.cdsDetallePres.fieldByname('CPNODOC').AsString + '%'' AND NVL(ECESTADO,''P'')<>''A'''
               + '   and FECPAGO>=''' + DateToStr(dtpFecha.Date - 2) + '''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.indexfieldnames := '';
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;

         xNumRet := DMCXP.cdsQry.fieldByname('RETNUMERO').AsString;
         xNumSer:= DMCXP.cdsQry.fieldByname('RETSERIE').AsString;

         If length(xNumRet)>0 then
         Begin
            xSQL := 'Select CIAID, CLAUXID, AUXID, DOCID, SERIE, NODOC, MTOORI, MTORETORI, '
               + '          RETSERIE, RETNUMERO '
               + '     from CNT320 '
               + '    where CIAID='+quotedstr(DMCXP.cdsQry.fieldByname('CIAID').AsString)
               + '      and RETNUMERO='+quotedstr(xNumret)
               + '      and RETSERIE='+quotedstr(xNumser);
            DMCXP.cdsQry.Close;
            DMCXP.cdsQry.indexfieldnames := '';
            DMCXP.cdsQry.DataRequest(xSQL);
            DMCXP.cdsQry.Open;

            //////////////////////////////////
            //  ASIENTO EN COMPAÑIA FILIAL  //
            //////////////////////////////////

            if xCabFilial then
            Begin
               xSQL := 'Select lpad(to_char(nvl(max(CNTCOMPROB),0)+1),10,''0'') NOCOMP '
                  + '     from CNT300 '
                  + '    where CIAID='+quotedstr(dblcCia.Text)
                  + '      and CNTANOMM='+quotedstr(xPeriodo)
                  + '      and TDIARID='+quotedstr(xOrigen);
               DMCXP.cdsQry.Close;
               DMCXP.cdsQry.indexfieldnames := '';
               DMCXP.cdsQry.DataRequest(xSQL);
               DMCXP.cdsQry.Open;
               xNoComp := DMCXP.cdsQry.FieldByName('NOCOMP').AsString;

            // cabecera
            // Inicio HPC_201604_CXP
               xSQL := 'Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
                  + '                       CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
                  + '                       CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
                  + '                       CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
                  + '                       TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
                  + '   Select '+quotedstr(dblcCia.Text) + ', '
                  +              quotedstr(xOrigen) + ', '
                  +              quotedstr(xNoComp) + ', '
                  +              quotedstr(xPeriodo) + ', '
                  +              quotedstr(xLote) + ', '
               //   +              quotedstr('P:' + dbeNumPla.text + ' / ' + dblcCia.Text + ' / Ret:')+'||RETNUMERO, '
                  +         quotedstr('OP:' + DMCXP.cdsOPago.FieldByname('NUMOPE').AsString+'/PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString + '-' + wsBanco + ' ' + dblcCia.Text) + ', '
// Inicio HPC_201705_CXP
// Ajustes en Contabilización de Órdenes de Pago origen 53
                  +              xTCambio + ', '+quotedstr(dtpFechacnt.text) + ', '
// Fin HPC_201705_CXP
                  + '            ''I'', ''N'', NULL, '+quotedstr(DMCXP.wUsuario)+', SYSDATE, SYSDATE,'
                  + '            max(B.FECANO) , max(B.FECMES), max(B.FECDIA), '
                  + '            max(B.FECTRIM), max(B.FECSEM), max(B.FECSS), '
                  + '            max(B.FECAATRI), max(B.FECAASEM), max(B.FECAASS), '
                  + '            ''N'' TMONID, NULL, NULL, NULL, '
                  + '            max(TDIARDES), sum(A.MTORETLOC), sum(MTORETEXT), sum(A.MTORETLOC), '
                  + '            sum(MTORETEXT), 0, 0, NULL, ''CXP'', ''CXP'' '
                  + '       from CNT320 A, TGE114 B, TGE104 C '
                  + '      where A.CIAID in ('+quotedstr(DMCXP.cdsDetallePres.fieldByname('CIAID').AsString) + ',''02'') '
                  + '        and A.RETNUMERO='+quotedstr(xNumret)
                  + '        and A.RETSERIE='+quotedstr(xNumser)
                  + '        and B.FECHA='+quotedstr(dtpFecha.text)
                  + '        and C.TDIARID='+quotedstr(xOrigen)
                  + '    group by RETNUMERO';
            // Fin HPC_201604_CXP
               Try
                  DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  xContinuaGrab := False;
                  ShowMessage('Error en la Grabación de Retenciones Cabecera');
                  Exit;
               End;
               xCabFilial := False;

            // DETALLE 1
               xSQL := 'Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                     + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                     + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                     + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                     + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                     + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                     + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                     + 'Select ''' + dblcCia.Text + ''', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , b.fecano, ''' + xPeriodo + ''', ''' + xLote + ''', D.CTATOTAL, D.CLAUXID, PROV, '
                     + '       D.DOCID, D.CPSERIE, D.CPNODOC, SUBSTR(D.PROVDES,1,40), ''D'', NULL, ' + xTCambio + ', A.MTORETLOC, A.MTORETLOC, MTORETEXT, '
// Inicio HPC_201705_CXP
// Ajustes en Contabilización de Órdenes de Pago origen 53
                     + '       D.CPFEMIS, D.CPFVCMTO, ''' + dtpFechacnt.text + ''', ''I'', ''N'', ''N'', ''' + DMCXP.wUsuario + ''', '
// Fin HPC_201705_CXP
                     + '       SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, '
                     + '       ''N'' TMONID, NULL, NULL, NULL, C.TDIARDES, E.CTAABR, SUBSTR(D.PROVDES,1,15), F.DOCABR, NULL, '
                     + '       A.MTORETLOC, MTORETEXT, 0, 0, 0, 0, NULL, NULL, '
                     + '       NULL, ''CXP'', ROWNUM, ''CXP'', NULL '
                     + '  from CNT320 A, CXP301 D, TGE114 B, TGE104 C, TGE202 E, TGE110 F '
                     + ' where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
                     + '   and RETNUMERO=''' + xNumret + ''' '
                     + '   and RETSERIE=''' + xNumser + ''' '
                     + '   and D.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
                     + '   and A.CLAUXID=D.CLAUXID AND A.AUXID=D.PROV AND A.DOCID=D.DOCID(+) '
              //       + '   and A.DOCID='+quotedstr(DMCXP.cdsDetallePres.fieldByname('DOCID').AsString)
              //       + '   and A.SERIE='+quotedstr(DMCXP.cdsDetallePres.fieldByname('CPSERIE').AsString)
              //       + '   and A.NODOC=substr(''00000000''||'+quotedstr(DMCXP.cdsDetallePres.fieldByname('CPNODOC').AsString)+',-8) '
                     + '   and CAST(D.CPNODOC AS NUMERIC)= CAST(NODOC AS NUMERIC) '
                     + '   and D.CPSERIE = SERIE '
                     + '   and D.CPESTADO IN (''P'',''C'') '
                     + '   and B.FECHA(+)=''' + dtpFecha.text + ''' '
                     + '   and C.TDIARID(+)=''' + xOrigen + ''' '
                     + '   and A.CIAID=E.CIAID AND D.CTATOTAL=E.CUENTAID '
                     + '   and A.DOCID=F.DOCID ';
               Try
                  DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  xContinuaGrab := False;
                  ShowMessage('Error en la Grabación de Retenciones Detalle 1');
                  Exit;
               End;

            // DETALLE 2
            // Inicio HPC_201604_CXP
               xGlosa := 'OP:' + DMCXP.cdsOPago.FieldByname('NUMOPE').AsString
                      +'/PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString
                      + 'Ret:'+xNumret;

               xSQL := 'Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                      DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                      CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                      CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                      TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                      CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                      CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + '   Select ''' + dblcCia.Text + ''', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , max(b.fecano), ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCta466 + ''', NULL, NULL, '
                  + '          ''49'', RETSERIE, RETNUMERO, '
                //  + '          ''P:' + dbeNumPla.text + ' / Ret:''||RETNUMERO, '
                  +         quotedstr(xGlosa)+', '
                  + '          ''H'', NULL, ' + xTCambio + ', sum(A.MTORETLOC), sum(A.MTORETLOC), sum(A.MTORETEXT), '
// Inicio HPC_201705_CXP
// Ajustes en Contabilización de Órdenes de Pago origen 53
                  + '          ''' + dtpFechacnt.text + ''', ''' + dtpFechacnt.text + ''', ''' + dtpFechacnt.text + ''', ''I'', ''N'', ''N'', ''' + DMCXP.wUsuario + ''', '
// Fin HPC_201705_CXP
                  + '          SYSDATE, SYSDATE, max(b.fecmes), max(b.fecdia), max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
                  + '          ''N'' TMONID, NULL, NULL, NULL, MAX(C.TDIARDES), MAX(E.CTAABR), NULL, ''A Cuenta'', NULL, '
                  + '          0, 0, sum(A.MTORETLOC), sum(A.MTORETEXT), 0, 0, NULL, NULL, '
                  + '          NULL, ''CXP'', ' + IntToStr(DMCXP.cdsDetallePres.RecordCount + 1) + ', ''CXP'', NULL '
                  + '     from CNT320 A, TGE114 B, TGE104 C, TGE202 E '
                  + '    where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
                  + '      and RETNUMERO=''' + xNumret + ''' '
                  + '      and RETSERIE=''' + xNumser + ''' '
                  + '      and B.FECHA(+)=''' + dtpFecha.text + ''' '
                  + '      and C.TDIARID(+)=''' + xOrigen + ''' '
                  + '      and A.CIAID=E.CIAID AND ''' + xCta466 + '''=E.CUENTAID '
                  + '    group by RETSERIE, RETNUMERO';
            // Fin HPC_201604_CXP
               Try
                  DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  xContinuaGrab := False;
                  ShowMessage('Error en la Grabación de Retenciones Detalle 2');
                  Exit;
               End;
            End;

            ///////////////////////////////
            //  ASIENTO EN COMPAÑIA 02   //
            ///////////////////////////////

            If dblcCia.Text <> '02' Then
            Begin
               if xAsiRetCia02 then
               Begin
                  xSQL := 'Select LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
                        + ' where CIAID=''02'' AND CNTANOMM=''' + xPeriodo + ''' AND TDIARID=''' + xOrigen + '''';
                  DMCXP.cdsQry.Close;
                  DMCXP.cdsQry.indexfieldnames := '';
                  DMCXP.cdsQry.DataRequest(xSQL);
                  DMCXP.cdsQry.Open;
                  xNoComp := DMCXP.cdsQry.FieldByName('NOCOMP').AsString;

               // cabecera
                  xSQL := 'Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
                     + '                       CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
                     + '                       CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
                     + '                       CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
                     + '                       TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
                     + '   Select ''02'', ''' + xOrigen + ''', ''' + xNoComp + ''', '
// Inicio HPC_201705_CXP
// Ajustes en Contabilización de Órdenes de Pago origen 53
                     + '          ''' + xPeriodo + ''', ''' + xLote + ''', ''Ret:''||RETNUMERO||'' ' + xCiaAbr + ''', ' + xTCambio + ', ''' + dtpFechacnt.text + ''', '
// Fin HPC_201705_CXP
                     + '          ''I'', ''N'', NULL, ''' + DMCXP.wUsuario + ''', SYSDATE, SYSDATE, max(b.fecano) , max(b.fecmes), max(b.fecdia), '
                     + '          max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), ''N'' TMONID,  NULL, NULL, NULL, '
                     + '          max(TDIARDES), sum(A.MTORETLOC), sum(MTORETEXT), sum(A.MTORETLOC), sum(MTORETEXT), 0, 0, NULL, ''CXP'', ''CXP'' '
                     + '     from CNT320 A, TGE114 B, TGE104 C '
                     + '    Where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
                     + '      AND RETNUMERO=''' + xNumret + ''' '
                     + '      and RETSERIE=''' + xNumser + ''' '
                     + '      AND ''' + dtpFecha.text + '''=B.FECHA '
                     + '      AND C.TDIARID=''' + xOrigen + ''' '
                     + '    GROUP BY RETNUMERO';
                  Try
                     DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
                  Except
                     xContinuaGrab := False;
                     ShowMessage('Error en la Grabación de Retenciones Cabecera Cia<>02');
                     Exit;
                  End;

                  // DETALLE 1
                  // Inicio HPC_201604_CXP
                  xGlosa := 'OP:' + DMCXP.cdsOPago.FieldByname('NUMOPE').AsString
                      +'/PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString
                      + 'Ret:'+xNumret;

                  xSQL := 'Insert INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                     + '                      DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                     + '                      CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                     + '                      CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                     + '                      TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                     + '                      CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                     + '                      CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                     + '   Select ''02'', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , max(b.fecano), ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCta166 + ''', NULL, NULL, '
                     + '          ''49'', RETSERIE, RETNUMERO, '
                  //   + '          ''P:' + dbeNumPla.text + ' / Ret:''' + '||RETNUMERO, '
                     +         quotedstr(xGlosa)+', '
                     + '          ''D'', NULL, ' + xTCambio + ', sum(A.MTORETLOC), sum(A.MTORETLOC), sum(A.MTORETEXT), '
// Inicio HPC_201705_CXP
// Ajustes en Contabilización de Órdenes de Pago origen 53
                     + '          ''' + dtpFechacnt.text + ''', ''' + dtpFechacnt.text + ''', ''' + dtpFechacnt.text + ''', ''I'', ''N'', ''N'', ''' + DMCXP.wUsuario + ''', '
// Fin HPC_201705_CXP
                     + '          SYSDATE, SYSDATE, max(b.fecmes), max(b.fecdia), max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
                     + '          ''N'' TMONID, NULL, NULL, NULL, MAX(C.TDIARDES), MAX(E.CTAABR), NULL, ''A Cuenta'', NULL, '
                     + '          sum(A.MTORETLOC), sum(A.MTORETEXT), 0, 0, 0, 0, NULL, NULL, '
                     + '          NULL, ''CXP'', ' + IntToStr(1) + ', ''CXP'', NULL '
                     + '     from CNT320 A, TGE114 B, TGE104 C, TGE202 E '
                     + '    where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
                     + '      and RETNUMERO=''' + xNumret + ''' '
                     + '      and RETSERIE=''' + xNumser + ''' '
                     + '      and B.FECHA(+)=''' + dtpFecha.text + ''' '
                     + '      and C.TDIARID(+)=''' + xOrigen + ''' '
                     + '      and ''02''=E.CIAID AND ''' + xCta166 + '''=E.CUENTAID '
                     + '    group by RETSERIE, RETNUMERO';
                  // Fin HPC_201604_CXP
                  Try
                     DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
                  Except
                     xContinuaGrab := False;
                     ShowMessage('Error en la Grabación de Retenciones Detalle 1 Cia<>02');
                     Exit;
                  End;

                  // DETALLE 2
                  xSQL := 'Insert INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                     + '                      DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                     + '                      CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                     + '                      CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                     + '                      TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                     + '                      CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                     + '                      CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                     + '   Select ''02'', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , max(b.fecano), ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCtaRet + ''', NULL, NULL, '
                     + '          ''49'', RETSERIE, RETNUMERO, ''' + Trim(xCiaAbr) + ' / Ret:''||RETNUMERO, ''H'', NULL, ' + xTCambio + ', sum(A.MTORETLOC), sum(A.MTORETLOC), sum(A.MTORETEXT), '
// Inicio HPC_201705_CXP
// Ajustes en Contabilización de Órdenes de Pago origen 53
                     + '          ''' + dtpFechacnt.text + ''', ''' + dtpFechacnt.text + ''', ''' + dtpFechacnt.text + ''', ''I'', ''N'', ''N'', ''' + DMCXP.wUsuario + ''', '
// Fin HPC_201705_CXP
                     + '          SYSDATE, SYSDATE, max(b.fecmes), max(b.fecdia), max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
                     + '          ''N'' TMONID, NULL, NULL, NULL, MAX(C.TDIARDES), MAX(E.CTAABR), NULL, ''A Cuenta'', NULL, '
                     + '          0, 0, sum(A.MTORETLOC), sum(A.MTORETEXT), 0, 0, NULL, NULL, '
                     + '          NULL, ''CXP'', ' + IntToStr(2) + ', ''CXP'', NULL '
                     + '     from CNT320 A, TGE114 B, TGE104 C, TGE202 E '
                     + '    where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
                     + '      and RETNUMERO=''' + xNumret + ''' '
                     + '      and RETSERIE=''' + xNumser + ''' '
                     + '      and B.FECHA(+)=''' + dtpFecha.text + ''' '
                     + '      and C.TDIARID(+)=''' + xOrigen + ''' '
                     + '      and ''02''=E.CIAID AND ''' + xCtaRet + '''=E.CUENTAID '
                     + '    group by RETSERIE, RETNUMERO';
                  Try
                     DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
                  Except
                     xContinuaGrab := False;
                     ShowMessage('Error en la Grabación de Retenciones Detalle 2 Cia<>02');
                     Exit;
                  End;
                  xAsiRetCia02 := False;
               End; // xAsiRetCia02
            End; // Cia<>02
         End; //If length(xNumRet)>0 then
         DMCXP.cdsDetallePres.Next;
      End;
   End;
// Fin HPC_201602_CXP

   pnlCab.Enabled := False;
   pnlCab2.Enabled := False;
   pnlCnt.Enabled := False;

   DMCXP.cdsDetallePres.Filtered := False;
   DMCXP.cdsDetallePres.Filter := '';
   DMCXP.cdsDetallePres.IndexFieldNames := '';
   DMCXP.cdsDetallePres.First;

End;

Procedure TFOrdenPagoCab.bbtnVerContClick(Sender: TObject);
Var
   xSQL, xOrigen, xPeriodo, xLote: String;
Begin

   Try
      // Inicio HPC_201701_CXP  REQ 2017  Mostrar el Total
      SumaGrid;
      // Fin    HPC_201701_CXP
  
      xOrigen := '53';
      xPeriodo := Copy(dtpFechaCnt.text, 7, 4) + Copy(dtpFechaCnt.text, 4, 2);
      xLote := Copy(dbeNumero.Text, 3, 4);

      If dblcTMoneda.Text = 'D' Then
         xSQL := 'Select * FROM CNT300 '
               + ' where CIAID in (''' + dblcCia.Text + ''',''02'' ) and CNTANOMM=''' + xPeriodo + ''' '
               + '   and TDIARID=''' + xOrigen + ''' and CNTLOTE=''' + xLote + ''' '
               + '   and ( CNTDEBEME=' + StringReplace(dbgDetalle.ColumnByName('IMPPAGO').FooterValue, ',', '', [rfReplaceAll]) + ' '
               + '      or CNTHABEME=' + StringReplace(dbgDetalle.ColumnByName('IMPPAGO').FooterValue, ',', '', [rfReplaceAll]) + ' '
               + '      or CNTDEBEMN=' + StringReplace(dbgDetalle.ColumnByName('IMPPAGO').FooterValue, ',', '', [rfReplaceAll]) + ' ) '
               + ' order by CIAID, CNTCOMPROB'
      Else
         xSQL := 'Select * FROM CNT300 '
               + ' where CIAID in (''' + dblcCia.Text + ''',''02'' ) and CNTANOMM=''' + xPeriodo + ''' '
               + '   and TDIARID=''' + xOrigen + ''' and CNTLOTE=''' + xLote + ''' '
               + '   and (CNTDEBEMN=' + StringReplace(dbgDetalle.ColumnByName('IMPPAGO').FooterValue, ',', '', [rfReplaceAll]) + ' '
               + '     or CNTHABEMN=' + StringReplace(dbgDetalle.ColumnByName('IMPPAGO').FooterValue, ',', '', [rfReplaceAll]) + ' '
               + '     or CNTDEBEME=' + StringReplace(dbgDetalle.ColumnByName('IMPPAGO').FooterValue, ',', '', [rfReplaceAll]) + ' ) '
               + '  order BY CIAID, CNTCOMPROB';

      nImpPago := StrToFloat(StringReplace(dbgDetalle.ColumnByName('IMPPAGO').FooterValue, ',', '', [rfReplaceAll]));

      DMCXP.cdsDetCjeProv.Close;
      DMCXP.cdsDetCjeProv.indexfieldnames := '';
      DMCXP.cdsDetCjeProv.DataRequest(xSQL);
      DMCXP.cdsDetCjeProv.Open;

      FAsientos := TFAsientos.Create(self);
      FAsientos.pnlLote.Visible := False;
      FAsientos.ShowModal;
   Finally
      FAsientos.Free;
   End;
End;

Procedure TFOrdenPagoCab.BitBtn1Click(Sender: TObject);
Var
   xSQL, xOrigen, xPeriodo, xLote: String;
Begin
   Try
      xOrigen := '53';
      xPeriodo := Copy(dtpFecha.text, 7, 4) + Copy(dtpFecha.text, 4, 2);
      xLote := Copy(dbeNumero.Text, 3, 4);

      xSQL := 'Select a.*, rowid FROM CNT300 a '
            + ' where CIAID in (''' + dblcCia.Text + ''',''02'' ) and CNTANOMM=''' + xPeriodo + ''' '
            + '   and TDIARID=''' + xOrigen + ''' and CNTFCOMP=''' + dtpFecha.Text + ''' and CNTLOTE=''ABCT'' '
            + ' order BY CIAID, CNTCOMPROB';
      DMCXP.cdsDetCjeProv.Close;
      DMCXP.cdsDetCjeProv.indexfieldnames := '';
      DMCXP.cdsDetCjeProv.DataRequest(xSQL);
      DMCXP.cdsDetCjeProv.Open;

      FAsientos := TFAsientos.Create(self);
      FAsientos.pnlLote.Visible := True;
      FAsientos.ShowModal;
   Finally
      FAsientos.Free;
   End;
End;

Procedure TFOrdenPagoCab.BitBtn3Click(Sender: TObject);
Var
   xSQL, xOrigen, xPeriodo, xLote: String;
Begin
   Try
      xOrigen := '53';
      xPeriodo := Copy(dtpFecha.text, 7, 4) + Copy(dtpFecha.text, 4, 2);
      xLote := Copy(dbeNumero.Text, 3, 4);

      xSQL := 'Select a.*, rowid FROM CNT300 a '
            + ' where CIAID in (''' + dblcCia.Text + ''',''02'' ) and CNTANOMM=''' + xPeriodo + ''' '
            + '   and TDIARID=''' + xOrigen + ''' and CNTFCOMP=''' + dtpFecha.Text + ''' '
            + ' order BY CIAID, CNTCOMPROB';
      DMCXP.cdsDetCjeProv.Close;
      DMCXP.cdsDetCjeProv.indexfieldnames := '';
      DMCXP.cdsDetCjeProv.DataRequest(xSQL);
      DMCXP.cdsDetCjeProv.Open;

      FAsientos := TFAsientos.Create(self);
      FAsientos.pnlLote.Visible := True;
      FAsientos.ShowModal;
   Finally
      FAsientos.Free;
   End;
End;

Procedure TFOrdenPagoCab.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFOrdenPagoCab.bbtnIniClick(Sender: TObject);
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
var
  xSQL : String;
// Fin HPC_201707_CXP
Begin
   If DMCXP.cdsOPago.fieldByname('USUCONTA').AsString <> '' Then
   Begin
      ShowMessage('Orden de Pago ya fue contabilizada. No se puede cambiar a Inicial');
      Exit;
   End;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   If ((DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'C') And (DMCXP.cdsOPago.fieldByname('USUCONTA').AsString = '')) Then
   Begin
      ShowMessage('Orden de Pago ya fue confirmado. No se puede cambiar a Inicial');
      Exit;
   End;
// Fin HPC_201707_CXP
   DMCXP.cdsOPago.Edit;
   DMCXP.cdsOPago.fieldByname('USUACEPTA').AsString := '';
   DMCXP.cdsOPago.fieldByname('ESTADO').AsString := 'I';
   DMCXP.cdsOPago.Post;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   {If DMCXP.cdsOPago.ApplyUpdates(-1) > 0 Then
   Begin
      ShowMessage('Error al grabar 1');
      Exit;
   End;}

   xSQL := 'Update CXP_ORD_PAG_CAB '
         +'   set USUACEPTA='+quotedstr(DMCXP.cdsOPago.fieldByname('USUACEPTA').AsString)+', '
         +'       ESTADO='+quotedstr(DMCXP.cdsOPago.fieldByname('ESTADO').AsString)
         +' where CIAID='+quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
         +'   and NUMERO='+quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString);
   Try
     DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
     If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'I' Then
     Begin
       //deshabilitar
       bbtnExporta.Enabled := false;
       bbtnPago.Enabled := false;
       bbtnContabiliza.Enabled := false;
       dbeNumPla.Enabled := false;
       dtpFechaCnt.Enabled := false;
       //habilitar
       bbtnGraba.Enabled := true;
       bbtnAcepta.Enabled := true;
       pnlCab2.Enabled := true;
     End;
   Except
     DMCXP.DCOM1.AppServer.RetornaTransaccion;                               //cuarto retorna boton contabiliza
     ShowMessage('Error en regresar a estado Inicial la Orden de Pago');
     Exit;
// Fin HPC_201707_CXP
   End;
   ShowMessage('Orden de Pago en Estado Inicial');

End;

Procedure TFOrdenPagoCab.bbtnRetUnoClick(Sender: TObject);
Var
   xLLave, xNumRet, xSQL, xCiaAbr, xNoDoc, xDoc: String;
// Inicio HPC_201604_CXP
//   xNoComp, xPeriodo, xOrigen, xLote, xTCambio, xCta166, xCta466, xWhere, xCtaRet: String;
   xNoComp, xPeriodo, xOrigen, xLote, xCta166, xCta466, xWhere, xCtaRet, xGlosa: String;
// Fin HPC_201604_CXP
Begin
   If MessageDlg('¿ Esta Seguro de Generar Asiento de Retenciones ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

   xWhere := 'CIAID=' + quotedstr(dblcCia.Text);
   xCiaAbr := BuscaQry('dspTGE', 'TGE101', 'CIAABR,CIARETIGV,EXOIGV', xWhere, 'CIAABR');

   xCtaRet := '4010105';
   xOrigen := '53';
   xPeriodo := Copy(dtpFecha.text, 7, 4) + Copy(dtpFecha.text, 4, 2);
   xLote := Copy(dbeNumero.Text, 3, 4);
   xTCambio := '0';
// Inicio HPC_201604_CXP
   xWhere := 'TMONID='+quotedstr(DMCXP.wTMonExt)+' and FECHA=''' + dtpFecha.text + '''';
// Fin HPC_201604_CXP
   If length(BuscaQry('PrvTGE', 'TGE107', '*', xWhere, 'TMONID')) > 0 Then
      xTCambio := FloatToStr(DMCXP.cdsQry.fieldbyname('TCAM' + DMCXP.wVRN_TipoCambio).AsFloat);

   If xTCambio = '0' Then
   Begin
      ShowMessage('Falta ingresar el Tipo de Cambio');
      Exit;
   End;

   xSQL := 'Select CTADEBE, B.CTA_AUX AUX_D, B.CTA_CCOS CCOS_D, CTAHABER, C.CTA_AUX AUX_H, C.CTA_CCOS CCOS_H, TDIARID, CIAORIGEN, TDIARID2 '
         + '  From CAJA103 A, TGE202 B, TGE202 C '
         + ' Where A.CIAID=''' + dblcCia.Text + ''' '
         + '   and B.CIAID=A.CIAID AND A.CTADEBE=B.CUENTAID '
         + '   and C.CIAID=A.CIAID AND A.CTAHABER=C.CUENTAID ';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   xCta166 := DMCXP.cdsQry.FieldByName('CTADEBE').AsString;
   xCta466 := DMCXP.cdsQry.FieldByName('CTAHABER').AsString;

      // ACTUALIZA SALDOS

   xLLave := DMCXP.cdsDetallePres.FieldByname('CLAUXID').AsString + DMCXP.cdsDetallePres.FieldByname('AUXID').AsString;

   xDoc := DMCXP.cdsDetallePres.fieldByname('DOCID').AsString;
   xNoDoc := DMCXP.cdsDetallePres.fieldByname('CPNODOC').AsString;

   xSQL := 'Select CIAID, CLAUXID, AUXID, DOCID, SERIE, NODOC, MTOORI, MTORETORI, RETSERIE, RETNUMERO '
         + '  from CNT320 '
         + ' where CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + '   and CLAUXID=''' + DMCXP.cdsDetallePres.fieldByname('CLAUXID').AsString + ''' '
         + '   and AUXID=''' + DMCXP.cdsDetallePres.fieldByname('AUXID').AsString + ''' '
         + '   and DOCID=''' + xDoc + ''' '
         + '   and NODOC LIKE ''%' + xNoDoc + '%'' AND NVL(ECESTADO,''P'')<>''A'''
         + '   and FECPAGO>=''' + DateToStr(dtpFecha.Date - 2) + '''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.indexfieldnames := '';
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;

   xNumRet := DMCXP.cdsQry.fieldByname('RETNUMERO').AsString;

   xSQL := 'Select CIAID, CLAUXID, AUXID, DOCID, SERIE, NODOC, MTOORI, MTORETORI, RETSERIE, RETNUMERO '
         + '  from CNT320 '
         + ' where CIAID=''' + DMCXP.cdsQry.fieldByname('CIAID').AsString + ''' AND RETNUMERO=''' + xNumret + '''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.indexfieldnames := '';
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;

   If DMCXP.cdsQry.RecordCount <= 0 Then
   Begin
      ShowMessage('Error no Existe retención generada para este documento');
      Exit;
   End;

          //////////////////////////////////
         //  ASIENTO EN COMPAÑIA FILIAL  //
         //////////////////////////////////

   xSQL := 'Select LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP '
         + '  from CNT300 '
         + ' where CIAID=''' + dblcCia.Text + ''' AND CNTANOMM=''' + xPeriodo + ''' AND TDIARID=''' + xOrigen + '''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.indexfieldnames := '';
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   xNoComp := DMCXP.cdsQry.FieldByName('NOCOMP').AsString;

         // cabecera
// Inicio HPC_201604_CXP
        xGlosa := 'OP:' + DMCXP.cdsOPago.FieldByname('NUMOPE').AsString
                      +'/PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString
                      + 'Ret:'+xNumret;
   xSQL := 'Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
         + '                    CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
         + '                    CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
         + '                    CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
         + '                    TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
         + 'Select ''' + dblcCia.Text + ''', ''' + xOrigen + ''', ''' + xNoComp + ''', '
         + '       ''' + xPeriodo + ''', ''' + xLote + ''', '
       //  + '       ''P:' + dbeNumPla.text + ' / ' + dblcCia.Text + ' / Ret:''||RETNUMERO, '
         +         quotedstr(xGlosa)+', '
         +         xTCambio + ', ''' + dtpFecha.text + ''', '
         + '       ''I'', ''N'', NULL, ''' + DMCXP.wUsuario + ''', SYSDATE, SYSDATE, max(b.fecano) , max(b.fecmes), max(b.fecdia), '
         + '       max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), ''N'' TMONID,  NULL, NULL, NULL, '
         + '       max(TDIARDES), sum(A.MTORETLOC), sum(MTORETEXT), sum(A.MTORETLOC), sum(MTORETEXT), 0, 0, NULL, ''CXP'', ''CXP'' '
         + '  from CNT320 A, TGE114 B, TGE104 C '
         + ' where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + '   and RETNUMERO=''' + xNumret + ''' '
         + '   and ''' + dtpFecha.text + '''=B.FECHA '
         + '   and C.TDIARID=''' + xOrigen + ''' '
         + ' group BY RETNUMERO';
// Fin HPC_201604_CXP
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 1
   xSQL := 'Insert Into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
         + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
         + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
         + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
         + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
         + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO ) '
         + 'Select ''' + dblcCia.Text + ''', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , b.fecano, ''' + xPeriodo + ''', ''' + xLote + ''', D.CTATOTAL, D.CLAUXID, PROV, '
         + '       D.DOCID, D.CPSERIE, D.CPNODOC, SUBSTR(D.PROVDES,1,40), ''D'', NULL, ' + xTCambio + ', A.MTORETLOC, A.MTORETLOC, MTORETEXT, '
         + '       D.CPFEMIS, D.CPFVCMTO, ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMCXP.wUsuario + ''', '
         + '       SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, '
         + '       ''N'' TMONID, NULL, NULL, NULL, C.TDIARDES, E.CTAABR, SUBSTR(D.PROVDES,1,15), F.DOCABR, NULL, '
         + '       A.MTORETLOC, MTORETEXT, 0, 0, 0, 0, NULL, NULL, '
         + '       NULL, ''CXP'', ROWNUM, ''CXP'' '
         + '  from CNT320 A, CXP301 D, TGE114 B, TGE104 C, TGE202 E, TGE110 F '
         + ' where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + '   and RETNUMERO=''' + xNumret + ''' '
         + '   and D.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + '   and A.CLAUXID=D.CLAUXID AND A.AUXID=D.PROV AND A.DOCID=D.DOCID(+) '
         + '   and D.CPNODOC = NODOC '
         + '   and D.CPSERIE = SERIE '
         + '   and D.CPESTADO IN (''P'',''C'') '
         + '   and B.FECHA(+)=''' + dtpFecha.text + ''' '
         + '   and C.TDIARID(+)=''' + xOrigen + ''' '
         + '   and A.CIAID=E.CIAID AND D.CTATOTAL=E.CUENTAID '
         + '   and A.DOCID=F.DOCID ';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 2
// Inicio HPC_201604_CXP
   xGlosa := 'OP:' + DMCXP.cdsOPago.FieldByname('NUMOPE').AsString
                      +'/PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString
                      + 'Ret:'+xNumret;
   xSQL := 'Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
         + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
         + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
         + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
         + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
         + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
         + 'Select ''' + dblcCia.Text + ''', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , max(b.fecano), ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCta466 + ''', NULL, NULL, '
         + '       ''49'', RETSERIE, RETNUMERO, '
       //  + '       ''P:' + dbeNumPla.text + ' / Ret:''||RETNUMERO, '
         +         quotedstr(xGlosa)+', '
         + '       ''H'', NULL, ' + xTCambio + ', sum(A.MTORETLOC), sum(A.MTORETLOC), sum(A.MTORETEXT), '
         + '       ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMCXP.wUsuario + ''', '
         + '       SYSDATE, SYSDATE, max(b.fecmes), max(b.fecdia), max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
         + '       ''N'' TMONID, NULL, NULL, NULL, MAX(C.TDIARDES), MAX(E.CTAABR), NULL, ''A Cuenta'', NULL, '
         + '       0, 0, sum(A.MTORETLOC), sum(A.MTORETEXT), 0, 0, NULL, NULL, '
         + '       NULL, ''CXP'', ' + IntToStr(DMCXP.cdsDetallePres.RecordCount + 1) + ', ''CXP'', NULL '
         + '  from CNT320 A, TGE114 B, TGE104 C, TGE202 E '
         + ' where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + '   and RETNUMERO=''' + xNumret + ''' '
         + '   and B.FECHA(+)=''' + dtpFecha.text + ''' '
         + '   and C.TDIARID(+)=''' + xOrigen + ''' '
         + '   and A.CIAID=E.CIAID AND ''' + xCta466 + '''=E.CUENTAID '
         + ' group BY RETSERIE, RETNUMERO';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
// Fin HPC_201604_CXP

         ///////////////////////////////
         //  ASIENTO EN COMPAÑIA 02   //
         ///////////////////////////////

   xSQL := 'Select LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP '
         + '  from CNT300 '
         + ' where CIAID=''02'' AND CNTANOMM=''' + xPeriodo + ''' AND TDIARID=''' + xOrigen + '''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.indexfieldnames := '';
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   xNoComp := DMCXP.cdsQry.FieldByName('NOCOMP').AsString;
         // cabecera
   xSQL := 'Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
         + '                    CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
         + '                    CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
         + '                    CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
         + '                    TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
         + 'Select ''02'', ''' + xOrigen + ''', ''' + xNoComp + ''', '
         + '       ''' + xPeriodo + ''', ''' + xLote + ''', ''Ret:''||RETNUMERO||'' ' + xCiaAbr + ''', ' + xTCambio + ', ''' + dtpFecha.text + ''', '
         + '       ''I'', ''N'', NULL, ''' + DMCXP.wUsuario + ''', SYSDATE, SYSDATE, max(b.fecano) , max(b.fecmes), max(b.fecdia), '
         + '       max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), ''N'' TMONID,  NULL, NULL, NULL, '
         + '       max(TDIARDES), sum(A.MTORETLOC), sum(MTORETEXT), sum(A.MTORETLOC), sum(MTORETEXT), 0, 0, NULL, ''CXP'', ''CXP'' '
         + '  from CNT320 A, TGE114 B, TGE104 C '
         + ' Where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + '   and RETNUMERO=''' + xNumret + ''' '
         + '   and ''' + dtpFecha.text + '''=B.FECHA '
         + '   and C.TDIARID=''' + xOrigen + ''' '
         + ' group by RETNUMERO';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 1
// Inicio HPC_201604_CXP
   xGlosa := 'OP:' + DMCXP.cdsOPago.FieldByname('NUMOPE').AsString
                      +'/PLA:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString
                      + 'Ret:'+xNumret;
   xSQL := 'Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
         + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
         + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
         + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
         + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
         + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
         + 'Select ''02'', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , max(b.fecano), ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCta166 + ''', NULL, NULL, '
         + '       ''49'', RETSERIE, RETNUMERO, '
      //   + '       ''P:' + dbeNumPla.text + ' / Ret:''' + '||RETNUMERO, '
         +         quotedstr(xGlosa)+', '
         + '       ''D'', NULL, ' + xTCambio + ', sum(A.MTORETLOC), sum(A.MTORETLOC), sum(A.MTORETEXT), '
         + '       ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMCXP.wUsuario + ''', '
         + '       SYSDATE, SYSDATE, max(b.fecmes), max(b.fecdia), max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
         + '       ''N'' TMONID, NULL, NULL, NULL, MAX(C.TDIARDES), MAX(E.CTAABR), NULL, ''A Cuenta'', NULL, '
         + '       sum(A.MTORETLOC), sum(A.MTORETEXT), 0, 0, 0, 0, NULL, NULL, '
         + '       NULL, ''CXP'', ' + IntToStr(1) + ', ''CXP'', NULL '
         + '  from CNT320 A, TGE114 B, TGE104 C, TGE202 E '
         + ' where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + '   and RETNUMERO=''' + xNumret + ''' '
         + '   and B.FECHA(+)=''' + dtpFecha.text + ''' '
         + '   and C.TDIARID(+)=''' + xOrigen + ''' '
         + '   and ''02''=E.CIAID AND ''' + xCta166 + '''=E.CUENTAID '
         + ' group by RETSERIE, RETNUMERO';
// Fin HPC_201604
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 2
   xSQL := 'Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
         + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
         + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
         + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
         + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
         + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
         + 'Select ''02'', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , max(b.fecano), ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCtaRet + ''', NULL, NULL, '
         + '       ''49'', RETSERIE, RETNUMERO, ''' + Trim(xCiaAbr) + ' / Ret:''||RETNUMERO, ''H'', NULL, ' + xTCambio + ', sum(A.MTORETLOC), sum(A.MTORETLOC), sum(A.MTORETEXT), '
         + '       ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMCXP.wUsuario + ''', '
         + '       SYSDATE, SYSDATE, max(b.fecmes), max(b.fecdia), max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
         + '       ''N'' TMONID, NULL, NULL, NULL, MAX(C.TDIARDES), MAX(E.CTAABR), NULL, ''A Cuenta'', NULL, '
         + '       0, 0, sum(A.MTORETLOC), sum(A.MTORETEXT), 0, 0, NULL, NULL, '
         + '       NULL, ''CXP'', ' + IntToStr(2) + ', ''CXP'', NULL '
         + '  From CNT320 A, TGE114 B, TGE104 C, TGE202 E '
         + ' where A.CIAID IN (''' + DMCXP.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + '   and RETNUMERO=''' + xNumret + ''' '
         + '   and B.FECHA(+)=''' + dtpFecha.text + ''' '
         + '   and C.TDIARID(+)=''' + xOrigen + ''' '
         + '   and ''02''=E.CIAID AND ''' + xCtaRet + '''=E.CUENTAID '
         + ' group by RETSERIE, RETNUMERO';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

   pnlCab.Enabled := False;
   pnlCab2.Enabled := False;
   pnlCnt.Enabled := False;

   DMCXP.cdsDetallePres.Filtered := False;
   DMCXP.cdsDetallePres.Filter := '';
   DMCXP.cdsDetallePres.IndexFieldNames := '';
   DMCXP.cdsDetallePres.First;
End;

Procedure TFOrdenPagoCab.FormCreate(Sender: TObject);
var
   xTipOperacion, xSQL : String;

Begin
   CargaDataSource;

   rgOperacion.Onclick := nil;
   if DMCXP.cdsOPago.fieldByname('FLAG_OPER').AsString ='T' then
   Begin
      xTipOperacion := 'T';
      rgOperacion.itemindex := 1;
   End
   else
   Begin
      xTipOperacion := 'A';
      rgOperacion.ItemIndex := 0;
   End;
   rgOperacion.Onclick := rgOperacionClick;

   If (DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'T') or (DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'I') Then
   Begin
      rgOperacion.Enabled := True;
   End
   else
   Begin
      rgOperacion.Enabled := False;
   End;

// Inicio HCP_201604_CXP
// transfiere inicialización de datos interbancarios a formulario CXP265
   {
   if xTipOperacion='T' then
   begin
      xSQL := 'Select C.CIAID, C.NUMERO, C.CLAUXID, C.PROV, C.BANCOID, C.CCBCOID, '
            + '       C.USUREG, C.FECREG, C.USUMOD, C.FECMOD, C.CPFREG, T.PROVDES, G.BANCONOM '
            + '  From CXP_ORD_PAG_TINT C '
            + ' inner join TGE201 T ON C.CLAUXID = T.CLAUXID AND C.PROV = T.PROV '
            + ' inner join TGE105 G ON C.BANCOID = G.BANCOID '
            + ' Where C.CIAID='+quotedstr(dblcCia.Text)
            + '   and C.NUMERO ='+quotedstr(dbeNumero.Text) ;
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;

      dblcClAux.Text := Trim(DMCXP.cdsQry.fieldByname('CLAUXID').AsString);
      dblcdProv.Text := Trim(DMCXP.cdsQry.fieldByname('PROV').AsString);
      edtProv.Text := Trim(DMCXP.cdsQry.fieldByname('PROVDES').AsString);
      dblcBanco1.text := Trim(DMCXP.cdsQry.fieldByname('BANCOID').AsString);
      edtBanco.text := Trim(DMCXP.cdsQry.fieldByname('BANCONOM').AsString);
      edtCtaCte.Text := Trim(DMCXP.cdsQry.fieldByname('CCBCOID').AsString);
   End;

   if (DMCXP.cdsOPago.fieldByname('ESTADO').AsString ='T') OR (DMCXP.cdsOPago.fieldByname('ESTADO').AsString ='I') then
   BEGIN
      dblcClAux.ENABLED := TRUE;
      dblcdProv.ENABLED := TRUE;
      dblcBanco1.ENABLED := TRUE;
   END
   ELSE
   BEGIN
      dblcClAux.ENABLED := FALSE;
      dblcdProv.ENABLED := FALSE;
      dblcBanco1.ENABLED := FALSE;
   END;
   }
// Fin HPC_201604_CXP
End;

Function TFOrdenPagoCab.fg_Valida_AsientoContable(wgCiaid, wgNumOrdenPago, wgOrigen: String): Boolean;
Var
   xsMensaje, xsSql: String;
Begin
//verIfica si el detalle de la contabilización corresponde a todos los documentos
//contenidos en la Orden de Pago
   xsSQL := ' Select A.*  FROM CXP_ORD_PAG_DET  A '
          + '  where A.CIAID=' + QuotedStr(wgCiaid) + ' AND A.NUMERO=' + QuotedStr(wgNumOrdenPago)
          + '    and Not Exists (Select 1 FROM CXP301 D, TGE114 B, TGE104 C, TGE202 E, TGE110 F, CXP_ORD_PAG_CAB '
          + '                     where A.CIAID=D.CIAID(+) AND A.CLAUXID=D.CLAUXID AND A.AUXID=D.PROV '
          + '                       and A.DOCID=D.DOCID(+) AND NVL(A.CPSERIE,''0'')=NVL(D.CPSERIE,''0'') '
          + '                       and A.CPNODOC=D.CPNODOC(+) '
          + '                       and D.CPESTADO IN (''P'',''C'') '
          + '                       and B.FECHA(+)=' + QuotedStr(DMCXP.cdsOPago.FieldByname('FECHA').AsString)
          + '                       and C.TDIARID(+)=' + QuotedStr(wgOrigen)
          + '                       and A.CIAID=E.CIAID AND D.CTATOTAL=E.CUENTAID '
          + '                       and A.DOCID=F.DOCID '
          + '                       and A.CIAID = CXP_ORD_PAG_CAB.CIAID '
          + '                       and A.NUMERO = CXP_ORD_PAG_CAB.NUMERO )';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xsSql);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount > 0 Then
   Begin
      xsMensaje := 'El pago del documento ' + #13
                  +' Serie :' + DMCXP.cdsQry.FieldByname('CPSERIE').AsString
                  +' Número :' + DMCXP.cdsQry.FieldByname('CPNODOC').AsString
                  +' no puede ser Contabilizado ';
      ShowMessage(xsMensaje);
      Result := False;
      Exit;
   End;
   Result := True;
End;

Procedure TFOrdenPagoCab.dtpFechaExit(Sender: TObject);
Begin
   If fg_validaCierreContable(dtpFecha.Date) = True Then
   Begin
      ShowMessage(' Mes Cerrado Contablemente!!!, No se puede Registrar');
      dtpFecha.SetFocus;
      Exit;
   End;
// Inicio HPC_201604_CXP
   xTCambio := '0';
   xSQL := 'TMONID='+quotedstr(DMCXP.wTMonExt)+' and FECHA='+quotedstr(datetostr(dtpFecha.date));
   If length(BuscaQry('PrvTGE', 'TGE107', 'TMONID, TCAM' + DMCXP.wVRN_TipoCambio, xSQL, 'TMONID')) > 0 Then
      xTCambio := FloatToStr(DMCXP.cdsQry.fieldbyname('TCAM' + DMCXP.wVRN_TipoCambio).AsFloat);
   If xTCambio = '0' Then
   Begin
      ShowMessage('Falta ingresar el Tipo de Cambio');
      dtpFecha.SetFocus;
      Exit;
   End;

   DBMemo.SetFocus;
// Fin HPC_201604_CXP
End;

Function TFOrdenPagoCab.fg_validaCierreContable(
   wgFecha: TDateTime): Boolean;
Var
   xnAnio, xnMes, xnDia: Word;
Begin
   decodeDate(wgFecha, xnAnio, xnMes, xnDia);
   If DMCXP.MesCerrado(intToStr(xnMes), intToStr(xnAnio), dblcCia.text) Then
   Begin
      Result := True;
      exit;
   End;
   Result := False;
End;

Procedure TFOrdenPagoCab.CargaGridDetalle;
Var
   xSQL: String;
Begin
   dbgDetalle.Selected.Clear;
   dbgDetalle.Selected.Add('CLAUXID'#9'4'#9'Cl.~Aux.'#9'F');
   dbgDetalle.Selected.Add('AUXID'#9'10'#9'Id.~Prov.'#9'F');
   dbgDetalle.Selected.Add('DOCID'#9'3'#9'Doc.'#9'F');
   dbgDetalle.Selected.Add('CPSERIE'#9'6'#9'Serie'#9'F');
   dbgDetalle.Selected.Add('CPNODOC'#9'15'#9'No.~Documento'#9'F');
   dbgDetalle.Selected.Add('TMONID'#9'3'#9'TM'#9'F');
   dbgDetalle.Selected.Add('CPMTOORI'#9'11'#9'Importe'#9'F');
   dbgDetalle.Selected.Add('CPPAGORI'#9'11'#9'Importe~Pagado'#9'F');
   dbgDetalle.Selected.Add('CPSALORI'#9'11'#9'Importe~Saldo'#9'F');
   dbgDetalle.Selected.Add('IMPPAGO'#9'11'#9'Monto a~Pagar'#9'F');
   dbgDetalle.Selected.Add('IMPRETE'#9'13'#9'Afecto a~Retención/Detrac.'#9'F');
// Inicio HPC_201703_CXP
// Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
   dbgDetalle.Selected.Add('VALORDPAG'#9'3'#9'SEMT~  '#9'F');
   dbgDetalle.SetControlType('VALORDPAG', fctCheckBox,'S;N');

   xSQL := 'Select D.CIAID, D.NUMERO, D.ITEM, D.CLAUXID, D.AUXID, D.DOCID, D.CPSERIE, D.CPNODOC, D.TMONID, D.CPMTOORI, D.CPPAGORI, D.CPSALORI, D.IMPPAGO, D.IMPRETE, D.FREG, D.HREG, '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
         + '       D.CCOSID, '
// Fin HPC_201707_CXP
         + '       D.USUARIO, D.ESTADO, D.IMPDEVO, D.RQCIAID, D.RQORIGEN, D.NUMDETRAC, D.NUMCONSTA,'
         + '       C.CIAID, C.CPANOMES, C.TDIARID, C.CPNOREG, C.CLAUXID, C.PROV, C.PROVRUC, C.DOCID, C.CPSERIE, C.CPNODOC, C.CPFRECEP, C.CPFEMIS, C.CPFVCMTO, C.TMONID, C.CPTCAMPR, '
         + '       C.CPTCAMPA, C.CPESTADO, C.CPOCOMP, C.CP_CONTA, C.CPGRAVAD, C.CPNOGRAV, C.CPIGV, C.CPISC, C.CPDCTO, C.CPSERVIC, C.CPMTOORI, C.CPMTOLOC, C.CPMTOEXT, C.CPPAGORI, '
         + '       C.CPPAGLOC, C.CPPAGEXT, C.CPSALORI, C.CPSALLOC, C.CPSALEXT, C.TCANJEID, C.CPCANJE, C.CPFCANJE, C.CPUSER, C.CPFREG, C.CPHREG, C.CPAAAA, C.CPMM, C.CPDD, C.CPTRI, '
         + '       C.CPSEM, C.CPSS, C.CPAATRI, C.CPAASEM, C.CPAASS, C.CPFCMPRB, C.DCPLOTE, C.DCPCOMP, C.CTATOTAL, C.FLAGVAR, C.CPTOTOT, C.CPIGV2, C.CPGRAVAD2, C.CPHMOD, C.FLAGVAR2, '
         + '       C.PROVDES, C.CLAUXREND, C.AUXIDREND, C.CCBCOID, C.BANCOID, C.SITUAID, C.CPFLAGTDOC, C.CXPRRHH, C.AUXIDINTER, C.CLAUXINTER, C.CPTCAMDOL, C.PROVRETIGV, C.CPTCAMAJ, '
         + '       C.DTRPORC, C.CPMTOORIB, C.DTRFLAG, C.FECDEPDET, C.NUMDEPDET, C.ADQ_NO_GRAV, C.IGV_GRA_NO_DEST, C.CP_OTROS, C.CPTODETRSUNATID, C.TIPOOPERSUNATID, C.PORCDESC, '
         + '       C.CP4TAPENSION, C.SNPAFPID, C.TIPCOMAFPID, D.NUMCONSTA, D.IMPOTRDTO, D.OBSERVA, D.CTAOTRDTO,D.VALORDPAG '
         + '  from CXP_ORD_PAG_DET D '
         + ' INNER JOIN CXP301 C ON D.CLAUXID = C.CLAUXID AND D.AUXID=C.PROV AND D.DOCID = C.DOCID AND D.CPSERIE =C.CPSERIE and D.CPNODOC = C.CPNODOC '
         + ' where D.CIAID =''' + DMCXP.cdsOPago.FieldByname('CIAID').AsString + ''' '
         + '   and D.NUMERO=''' + DMCXP.cdsOPago.FieldByname('NUMERO').AsString + ''' '
         + '   and C.CPESTADO in (''C'',''P'') '
         + ' order by D.ITEM';
// Fin HPC_201703_CXP

   DMCXP.cdsDetallePres.Close;
   DMCXP.cdsDetallePres.DataRequest(xSQL);
   DMCXP.cdsDetallePres.Open;
   CargaDataSource;   

End;

procedure TFOrdenPagoCab.DevuelvePeriodo(var sAno, sMes: String);
var
  Year, Month, Day : Word;
begin
  DecodeDate(dtpFecha.Date, Year, Month, Day);
  sano := StrZero(inttostr(Year),4);
  sMes := StrZero(inttostr(Month),2);
end;

function TFOrdenPagoCab.Redondea(currDato:Currency;digitos:word=2): Currency;
begin
   result := strtocurr(floattostrf(currDato,ffFixed,15,digitos));
end;

function TFOrdenPagoCab.NumLetra(const mNum: Currency; const iIdioma,
  iModo: Smallint): String;
const
  iTopFil: Smallint = 6;
  iTopCol: Smallint = 10;
  aCastellano: array[0..5, 0..9] of PChar =
  ( ('UNA ','DOS ','TRES ','CUATRO ','CINCO ',
    'SEIS ','SIETE ','OCHO ','NUEVE ','UN '),
    ('ONCE ','DOCE ','TRECE ','CATORCE ','QUINCE ',
    'DIECISEIS ','DIECISIETE ','DIECIOCHO ','DIECINUEVE ',''),
    ('DIEZ ','VEINTE ','TREINTA ','CUARENTA ','CINCUENTA ',
    'SESENTA ','SETENTA ','OCHENTA ','NOVENTA ','VEINTI'),
    ('CIEN ','DOSCIENTAS ','TRESCIENTAS ','CUATROCIENTAS ','QUINIENTAS ',
    'SEISCIENTAS ','SETECIENTAS ','OCHOCIENTAS ','NOVECIENTAS ','CIENTO '),
    ('CIEN ','DOSCIENTOS ','TRESCIENTOS ','CUATROCIENTOS ','QUINIENTOS ',
    'SEISCIENTOS ','SETECIENTOS ','OCHOCIENTOS ','NOVECIENTOS ','CIENTO '),
    ('MIL ','MILLON ','MILLONES ','CERO ','Y ',
    'UNO ','DOS ','CON ','','') );
  aCatalan: array[0..5, 0..9] of PChar =
  ( ( 'UNA ','DUES ','TRES ','QUATRE ','CINC ',
    'SIS ','SET ','VUIT ','NOU ','UN '),
    ( 'ONZE ','DOTZE ','TRETZE ','CATORZE ','QUINZE ',
    'SETZE ','DISSET ','DIVUIT ','DINOU ',''),
    ( 'DEU ','VINT ','TRENTA ','QUARANTA ','CINQUANTA ',
    'SEIXANTA ','SETANTA ','VUITANTA ','NORANTA ','VINT-I-'),
    ( 'CENT ','DOS-CENTES ','TRES-CENTES ','QUATRE-CENTES ','CINC-CENTES ',
    'SIS-CENTES ','SET-CENTES ','VUIT-CENTES ','NOU-CENTES ','CENT '),
    ( 'CENT ','DOS-CENTS ','TRES-CENTS ','QUATRE-CENTS ','CINC-CENTS ',
    'SIS-CENTS ','SET-CENTS ','VUIT-CENTS ','NOU-CENTS ','CENT '),
    ( 'MIL ','MILIO ','MILIONS ','ZERO ','-',
    'UN ','DOS ','AMB ','','') );
var
  aTexto: array[0..5, 0..9] of PChar;
  cTexto, cNumero: String;
  iCentimos, iPos: Smallint;
  bHayCentimos, bHaySigni: Boolean;

  (*************************************)
  (* Cargar Textos según Idioma / Modo *)
  (*************************************)

procedure NumLetra_CarTxt;
var
 i, j: Smallint;
begin
  (* Asignación según Idioma *)

    for i := 0 to iTopFil - 1 do
      for j := 0 to iTopCol - 1 do
        case iIdioma of
          1: aTexto[i, j] := aCastellano[i, j];
          2: aTexto[i, j] := aCatalan[i, j];
        else
          aTexto[i, j] := aCastellano[i, j];
        end;

    (* Asignación si Modo Masculino *)

    if (iModo = 1) then
    begin
      for j := 0 to 1 do
        aTexto[0, j] := aTexto[5, j + 5];

      for j := 0 to 9 do
        aTexto[3, j] := aTexto[4, j];
    end; 
  end;
 
  (****************************)
  (* Traducir Dígito -Unidad- *)
  (****************************)
 
  procedure NumLetra_Unidad;
  begin 
    if not( (cNumero[iPos] = '0') or (cNumero[iPos - 1] = '1')
     or ((Copy(cNumero, iPos - 2, 3) = '001') and ((iPos = 3) or (iPos = 9))) ) then 
      if (cNumero[iPos] = '1') and (iPos <= 6) then
        cTexto := cTexto + aTexto[0, 9]
      else 
        cTexto := cTexto + aTexto[0, StrToInt(cNumero[iPos]) - 1];
 
    if ((iPos = 3) or (iPos = 9)) and (Copy(cNumero, iPos - 2, 3) <> '000') then
      cTexto := cTexto + aTexto[5, 0];

    if (iPos = 6) then 
      if (Copy(cNumero, 1, 6) = '000001') then
        cTexto := cTexto + aTexto[5, 1]
      else 
        cTexto := cTexto + aTexto[5, 2];
  end; 
 
  (****************************)
  (* Traducir Dígito -Decena- *)
  (****************************)
 
  procedure NumLetra_Decena;
  begin 
    if (cNumero[iPos] = '0') then
      Exit
    else if (cNumero[iPos + 1] = '0') then
      cTexto := cTexto + aTexto[2, StrToInt(cNumero[iPos]) - 1]
    else if (cNumero[iPos] = '1') then 
      cTexto := cTexto + aTexto[1, StrToInt(cNumero[iPos + 1]) - 1]
    else if (cNumero[iPos] = '2') then 
      cTexto := cTexto + aTexto[2, 9]
    else 
      cTexto := cTexto + aTexto[2, StrToInt(cNumero[iPos]) - 1]
        + aTexto[5, 4];
  end; 
 
  (*****************************)
  (* Traducir Dígito -Centena- *)
  (*****************************)

  procedure NumLetra_Centena;
  var
    iPos2: Smallint;
  begin
    if (cNumero[iPos] = '0') then
      Exit;
 
    iPos2 := 4 - Ord(iPos > 6);
 
    if (cNumero[iPos] = '1') and (Copy(cNumero, iPos + 1, 2) <> '00') then 
      cTexto := cTexto + aTexto[iPos2, 9]
    else 
      cTexto := cTexto + aTexto[iPos2, StrToInt(cNumero[iPos]) - 1];
  end;

  (**************************************)
  (* Eliminar Blancos previos a guiones *)
  (**************************************)

procedure NumLetra_BorBla;
var
    i: Smallint;
  begin
    i := Pos(' -', cTexto);

    while (i > 0) do
    begin
      Delete(cTexto, i, 1);
      i := Pos(' -', cTexto);
    end;
  end;

begin
  (* Control de Argumentos *)

  if (mNum < 0.00) or (mNum > 999999999999.99) or (iIdioma < 1) or (iIdioma > 2)
    or (iModo < 1) or (iModo > 2) then
  begin
    Result := 'ERROR EN ARGUMENTOS';
    Abort;
  end;

  (* Cargar Textos según Idioma / Modo *)

  NumLetra_CarTxt;

  (* Bucle Exterior -Tratamiento Céntimos-     *)
  (* NOTA: Se redondea a dos dígitos decimales *)

  cNumero := Trim(Format('%12.0f', [Int(mNum)]));
  cNumero := StringOfChar('0', 12 - Length(cNumero)) + cNumero;
  iCentimos := Trunc((Frac(mNum) * 100) + 0.5);

  repeat
    (* Detectar existencia de Céntimos *)

    if (iCentimos <> 0) then
      bHayCentimos := True
    else
      bHayCentimos := False;

    (* Bucle Interior -Traducción- *)

    bHaySigni := False;

    for iPos := 1 to 12 do
    begin
      (* Control existencia Dígito significativo *)

      if not(bHaySigni) and (cNumero[iPos] = '0') then
        Continue
      else
        bHaySigni := True;

      (* Detectar Tipo de Dígito *)

      case ((iPos - 1) mod 3) of
        0: NumLetra_Centena;
        1: NumLetra_Decena;
        2: NumLetra_Unidad;
      end;
    end;

    (* Detectar caso 0 *)

    if (cTexto = '') then
      cTexto := aTexto[5, 3];

    (* Traducir Céntimos -si procede- *)

    if (iCentimos <> 0) then
    begin
      cTexto := cTexto + aTexto[5, 7];
      cNumero := Trim(Format('%.12d', [iCentimos]));
      iCentimos := 0;
    end;
  until not (bHayCentimos);

  (* Eliminar Blancos innecesarios -sólo Catalán- *)

  if (iIdioma = 2) then
    NumLetra_BorBla;

  (* Retornar Resultado *)

  Result := Trim(cTexto);
end;

Procedure TFOrdenPagoCab.ObtenerNumretencion(xCia, xPeriodo, xTdiarid: String);
var
   xSQL : String;
Begin
// Inicio HPC_201601_CXP
{
// Inicio HPC_201601_CXP
// Busca serie por default en archivo de Series de Documentos
   xSQL := ' Select SERIEID '
      +    '   from FAC103 '
      +    '  where CIAID='+quotedstr(xCia)
      +    '    and FLAGV='+quotedstr('R1');
// Fin HPC_201601_CXP
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount > 0 Then
   Begin
      xnumserie := DMCXP.cdsQry.fieldbyname('SERIEID').AsString;
   End
   Else
   Begin
      xnumserie := '';
   End;
}
   xNumSerie := '';
   xSQL := 'Select SERIERET '
      + '     from CXP104 '
      + '    where CIARUC='+quotedstr(wCiaRUC)
      + '      and VIGENCIA=''S'' ';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount > 0 Then
   Begin
      xNumSerie := DMCXP.cdsQry.fieldbyname('SERIERET').AsString;
   End;

   xSQL := ' Select RETNUMERO '
          +'   from CNT320 '
       //   +'  where RETSERIE = '''+ DMCXP.cdsQry.fieldbyname('SERIEID').AsString +''' '
          +'  where RETSERIE = '+quotedstr(xNumSerie)
          +'    and RETNUMERO = '
          +'                 (Select max(RETNUMERO) '
          +'                    from CNT320 '
       //   +'                   Where RETSERIE = '''+ DMCXP.cdsQry.fieldbyname('SERIEID').AsString +''')';
          +'                   Where RETSERIE = '+quotedstr(xNumSerie)+')';
// Fin HPC_201604_CXP
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount > 0 Then
   Begin
      xnumretencion := strzero(inttostr(DMCXP.cdsQry.fieldbyname('RETNUMERO').AsInteger + 1),10);
   End
   Else
   Begin	 
      xnumretencion :='0000000001';
   End;

   xSQL := 'SELECT ECNOCOMP '
         + '  FROM CNT320 '
         + ' WHERE CIAID   = ''' + xcia + ''' '
         + '   AND ANOMM   = ''' + xPeriodo + ''' '
         + '   AND TDIARID = ''' + xTdiarid + ''' '
         + '   AND ECNOCOMP = '
         + '   (SELECT MAX(ECNOCOMP) '
         + '      FROM CNT320 '
         + '     WHERE CIAID       = ''' + xcia + ''' '
         + '       AND ANOMM   = ''' + xPeriodo + ''' '
         + '        AND TDIARID = ''' + xTdiarid + ''' '
         + '      AND NOT ECNOCOMP LIKE ''%A%'') ';

   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount > 0 Then
   Begin
      xnumcomprob := strzero(inttostr(DMCXP.cdsQry.fieldbyname('ECNOCOMP').AsInteger + 1),10);
   End
   Else
   Begin
      xnumcomprob :='0000000001';
   End;

End;

procedure TFOrdenPagoCab.bbtnPagoClick(Sender: TObject);
var xSQL : String;
begin
   If dtpFechaCnt.Date = 0 Then
   Begin
      ShowMessage('Falta Ingresar la fecha de Pago');
      Exit;
   End;

   If dbeNumPla.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar Número de Planilla de Banco');
      Exit;
   End;
// Inicio HPC_201703_CXP
// Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'I' Then
   Begin
      ShowMessage('Orden de Pago no está ACEPTADA');
      Exit;
   End;
// Fin HPC_201703_CXP
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'C' Then
   Begin
      ShowMessage('Orden de Pago ya se encuentra CONFIRMADA');
      Exit;
   End;
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString <> 'P' Then
   Begin
      ShowMessage('Orden de Pago no está ACEPTADA');
      Exit;
   End;

   If MessageDlg('¿ Confirmar Orden de Pago ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
   // Inicio HPC_201604_CXP
   // Control de Grabación Transaccional para Retenciones
      xContinuaGrab := False;
      SelecImpresDest;
      If not xContinuaGrab then
      Begin
         ShowMessage('No continuará con la Confirmación de la Orden de Pago');
         exit;
      End;

      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      Screen.Cursor := crHourGlass;
      CreaRetenciones;
      If not xContinuaGrab then
      Begin
         Screen.Cursor := crDefault;
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;
   // Fin HPC_201604_CXP

      DMCXP.cdsOPago.Edit;
      DMCXP.cdsOPago.fieldByname('ESTADO').AsString := 'C';
      DMCXP.cdsOPago.fieldByname('NUMPLA').AsString := Trim(dbeNumPla.Text);
      DMCXP.cdsOPago.fieldByname('FECCONTA').AsDateTime := (dtpFechaCnt.Date);
      DMCXP.cdsOPago.Post;
      xSQL := 'Update CXP_ORD_PAG_CAB '
             +'   set NUMPLA='+quotedstr(dbeNumPla.Text)+', '
             +'       FECCONTA='+quotedstr(datetostr(dtpFechaCnt.Date))+', '
             +'       ESTADO='+quotedstr('C')+' '
             +' where CIAID='+quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
             +'   and NUMERO='+quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
      // Inicio HPC_201604_CXP
         Screen.Cursor := crDefault;
      // Fin HPC_201604_CXP
         DMCXP.DCOM1.AppServer.RetornaTransaccion;                               //cuarto retorna boton contabiliza
         ShowMessage('Error en la Confirmación de la Orden de Pago');
         Exit;
      End;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
      Screen.Cursor := crDefault;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'C' Then
      Begin
         edtEstado.Text := 'CONFIRMADA';
         //deshabilitar
         bbtnGraba.Enabled := false;
         bbtnAcepta.Enabled := false;
         bbtnPago.Enabled := false;
         pnlCab2.Enabled := false;
         dbeNumPla.Enabled := false;
         dtpFechaCnt.Enabled := false;
         //habilitar
         bbtnContabiliza.Enabled := true;
         bbtnExporta.Enabled := true;
      End;
// Fin HPC_201707_CXP
      ShowMessage('Pago Confirmado');
   End;
End;

// Inicio HPC_201604_CXP
// cambia mantenimiento de datos de Transferencia Interbancaria
{
procedure TFOrdenPagoCab.btnActualizarConstanciaClick(Sender: TObject);
Var
   xSQL: String;
begin
   If dblcClAux.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar la Clase Auxiliar');
      Exit;
   End;
   If dblcdProv.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar el código de Proveedor');
      Exit;
   End;
   If dblcBanco1.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar el Banco que se va a realizar la Transferencia');
      Exit;
   End;
   If edtCtaCte.Text = '' Then
   Begin
      ShowMessage('No tiene cuenta Bancaria');
      Exit;
   End;

   If (DMCXP.cdsOPago.fieldByname('ESTADO').AsString = '') or (DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'T') or (DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'I') Then
   Begin
      xSQL := ' Select CIAID, NUMERO, CLAUXID, PROV, BANCOID, CCBCOID, '
            + '        USUREG, FECREG, USUMOD, FECMOD, CPFREG '
            + '   from CXP_ORD_PAG_TINT '
            + '  where CIAID='+quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
            + '    and NUMERO='+quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      If DMCXP.cdsQry.RecordCount = 0 Then
      Begin
         xSQL := 'Insert into CXP_ORD_PAG_TINT(CIAID, NUMERO, CLAUXID, PROV, BANCOID, '
               + '                             CCBCOID, USUREG, FECREG, USUMOD, FECMOD, CPFREG) '
               + 'values('+quotedstr(dblcCia.Text)+ ', '
               +           quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString)+', '
               +           quotedstr(dblcClAux.Text)+', '
               +           quotedstr(dblcdProv.Text)+', '
               +           quotedstr(dblcBanco1.Text)+', '
               +           quotedstr(edtCtaCte.Text)+', '
               +           quotedstr(DMCXP.wUsuario)+', '
               + '         sysdate, '
               +           quotedstr(DMCXP.wUsuario)+', '
               + '         sysdate, '
               + '         trunc(sysdate)) ';
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      End
      Else
      Begin
         xSQL := 'Update CXP_ORD_PAG_TINT '
                +'   set CLAUXID='+quotedstr(dblcClAux.Text)+', '
                +'       PROV='+quotedstr(dblcdProv.Text)+', '
                +'       BANCOID='+quotedstr(dblcBanco1.Text)+', '
                +'       CCBCOID='+quotedstr(edtCtaCte.Text)+', '
                +'       USUMOD='+quotedstr(DMCXP.wUsuario)+', '
                +'       FECMOD=SYSDATE, '
                +'       CPFREG= TRUNC(SYSDATE) '
                +' where CIAID='+quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
                +'   and NUMERO='+quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString);
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

         xSQL := ' Select CIAID, NUMERO, ITEM, CLAUXID, AUXID, DOCID, CPSERIE,CPNODOC, '
                +'        TMONID, CPMTOORI, CPPAGORI, CPSALORI '
                +'   from CXP_ORD_PAG_DET '
                +'  where CIAID='+quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
                +'    and NUMERO='+quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString);
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;
         DMCXP.cdsQry.First;
         If DMCXP.cdsQry.RecordCount > 0 Then
         Begin
            If (DMCXP.cdsQry.fieldByname('CLAUXID').AsString =TRIM(dblcClAux.Text)) AND (DMCXP.cdsQry.fieldByname('AUXID').AsString = TRIM(dblcdProv.Text)) THEN
            Begin
                ShowMessage('Continúa con el mismo proveedor la Orden de Pago');
            end
            else
            begin
               xSQL := 'Delete from CXP_ORD_PAG_DET '
                     + ' where CIAID =''' + DMCXP.cdsOPago.FieldByname('CIAID').AsString + ''' '
                     + '   and NUMERO=''' + DMCXP.cdsOPago.FieldByname('NUMERO').AsString + ''' ';
               Try
                  DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
                  ShowMessage('Debido al Cambio de Proveedor se procedió a eliminar el Detalle de la Orden');
               Except
                  ShowMessage('Error en la Transaccion Eliminar');
               End;
            end;
         end;
      End;
   End;

   pnlCab.enabled := True;
   pnlGraba.enabled := True;
   pnlVisa.Enabled := True;
   pnlCab2.Enabled := True;
   pnlCnt.Enabled := True;

   DMCXP.cdsQry2.Filtered := false;
   rgoperacion.enabled := True;

   pnlConstancia.visible := False;
end;
}
// Fin HPC_201604_CXP

procedure TFOrdenPagoCab.rgOperacionClick(Sender: TObject);
begin
// Inicio HPC_201604_CXP
// cambia mantenimiento de datos de Transferencia Interbancaria
// rgOperacion.ItemIndex=0 --> Abono en cuenta //// rgOperacion.ItemIndex=1 --> Transferencia Interbancaria
   if rgOperacion.ItemIndex=1 then
   Begin
      pnlCab.enabled := False;
      pnlGraba.enabled := False;
      pnlVisa.Enabled := False;
      pnlCab2.enabled := False;
      pnlCnt.Enabled := False;
   //   pnlConstancia.Visible := True;
      bbtnDatosTransf.Click;
   End
   else
   Begin
   //   pnlConstancia.Visible := False;
      pnlCab.enabled := True;
      pnlGraba.enabled := True;
      pnlVisa.Enabled := True;
      pnlCab2.Enabled := True;
      pnlCnt.Enabled := True;
      rgoperacion.enabled := True;
   End;
// Fin HPC_201604_CXP
end;

procedure TFOrdenPagoCab.btnCerrarPanelConstanciaClick(Sender: TObject);
begin
// Inicio HPC_201604_CXP
// cambia mantenimiento de datos de Transferencia Interbancaria
//   pnlConstancia.Visible := False;
// Fin HPC_201604_CXP
   pnlCab.enabled := True;
   pnlGraba.enabled := True;
   pnlVisa.Enabled := True;
   pnlCab2.Enabled := True;
   pnlCnt.Enabled := True;
   rgoperacion.enabled := True;
end;

// Inicio HPC_201604_CXP
// cambia mantenimiento de datos de Transferencia Interbancaria
{
procedure TFOrdenPagoCab.dblcClAuxExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If dblcCia.Focused Then Exit;
   If Length(dblcClAux.Text) = 0 Then Exit;

   xWhere := 'CLAUXID=''' + dblcClAux.Text + ''' and MODULO LIKE ''%' + DMCXP.wModulo + '%''';
   If length(BuscaQry('dspTGE', 'TGE102', 'CLAUXDES', xWhere, 'CLAUXDES')) = 0 Then
   Begin

   End;
   Screen.Cursor := crHourGlass;

   xWhere := 'Select CLAUXID, PROV, PROVRUC, PROVDES, PROVABR, PROVNOMCOM, PROVRETIGV, PAISID, PROVDIR, '
           + '       PROVCZIP, PROVTELF, PROVFAX, PROVEMAI, CONVDOBTRI '
           + '  from TGE201 '
           + ' where CLAUXID = '+quotedstr(dblcClAux.Text)
           + '   and NVL(ACTIVO,''N'')=''S'' ';
   Filtracds(DMCXP.cdsProv, xWhere);

   If Length(dblcdProv.Text) > 0 Then
   Begin
      DMCXP.cdsQry13.Edit;
      xWhere := 'CLAUXID=''' + dblcClAux.Text + ''' AND PROV=''' + dblcdProv.Text + ''' and NVL(ACTIVO,''N'')=''S''';
      If length(BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES', xWhere, 'ProvDES')) = 0 Then
      Begin
         DMCXP.cdsQry13.fieldbyname('PROV').AsString := '';
         edtProv.Text := '';
         dblcdProv.SetFocus;
      End
      Else
      Begin
         DMCXP.cdsQry13.fieldbyname('PROV').AsString := DMCXP.cdsQry.FieldByname('PROV').AsString;
         edtProv.Text := DMCXP.cdsQry.FieldByname('PROVDES').AsString;
      End;
   End;

   If Length(dblcdProv.Text) = 0 Then dblcdProv.SetFocus;
   Screen.Cursor := crDefault;
end;

procedure TFOrdenPagoCab.dblcdProvExit(Sender: TObject);
Var
   xWhere, xSQL : String;
Begin

   If dblcClAux.Focused Then Exit;
   If btnCerrarPanelConstancia.Focused Then Exit;

   If length(dblcClAux.Text) = 0 Then
   Begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Falta Ingresar Clase de Auxiliar');
   End;

   If DMCXP.wAnchoProv > 0 Then
   Begin
      If ((Length(dblcdProv.Text) < DMCXP.wAnchoProv) And (Length(dblcdProv.Text) > 0)) Then
      Begin
         dblcdProv.Text := StrZero(dblcdProv.Text, DMCXP.wAnchoProv);
      End;
   End;

   if (length(dblcdProv.Text)=0) then
   Begin
      ShowMessage('Indique un Código del Proveedor');
      dblcdProv.SetFocus;
      exit;
   End;

   if length(dblcdProv.Text)>0 then
   begin
      xWhere := 'CLAUXID='+quotedstr(dblcClAux.Text)
              + ' and PROV='+quotedstr(dblcdProv.Text);
      edtProv.Text := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV, ACTIVO, ESDOMIC', xWhere, 'PROVDES');

      xSQL := 'Select * '
            + '  from CAJA102 '
            + ' where CLAUXID=' + quotedstr(dblcClAux.Text) + ' '
            + '   and PROV=' + quotedstr(dblcdProv.Text) + ' '
            + '   AND BANCOID NOT IN (''03'')';
      xSQL := 'select CAJA102.CLAUXID, CAJA102.PROV, CAJA102.BANCOID, TGE105.BANCONOM, '
            + '       CAJA102.CCBCOID '
            + '  from CAJA102, TGE105 '
            + ' where CAJA102.CLAUXID=' + quotedstr(dblcClAux.Text)
            + '   and CAJA102.PROV=' + quotedstr(dblcdProv.Text)
            + '   and CAJA102.FPAGOID=''AB'' '
            + '   and CAJA102.BANCOID<>''03'' '
            + '   and TGE105.BANCOID=CAJA102.BANCOID ';
      DMCXP.cdsQry2.Close;
      DMCXP.cdsQry2.indexfieldnames := '';
      DMCXP.cdsQry2.DataRequest(xSQL);
      DMCXP.cdsQry2.Open;
      DMCXP.cdsQry2.Filtered := false;
      dblcBanco1.LookupTable := DMCXP.cdsQry2;
      dblcBanco1.Selected.Clear;
      dblcBanco1.Selected.Add('BANCOID'#9'4'#9'Banco'#9'F');
      dblcBanco1.Selected.Add('BANCONOM'#9'30'#9'Nombre del Banco'#9'F');
      dblcBanco1.Selected.Add('CCBCOID'#9'15'#9'Cta.Cte.'#9'F');
   end;
end;

procedure TFOrdenPagoCab.dblcBanco1Exit(Sender: TObject);
Var
   xWhere: String;
Begin
   if btnCerrarPanelConstancia.Focused then exit;

   if length(dblcBanco1.Text)>0 then
   Begin
      If length(DMCXP.cdsQry2.FieldByName('BANCONOM').AsString) = 0 Then
      begin
         ShowMessage('No existe este Banco');
         edtBanco1.Text :='';
         edtCtaCte.text :='';
         dblcBanco1.SetFocus;
         Exit;
      end;
      edtBanco1.Text := DMCXP.cdsQry2.fieldbyname('BANCONOM').AsString;
      edtCtaCte.text := DMCXP.cdsQry2.fieldbyname('CCBCOID').AsString;
   End
   Else
   Begin
      ShowMessage('Defina correctamente el Banco y Cta.Cte');
      edtBanco1.text :='';
      edtCtaCte.text :='';
      dblcBanco1.SetFocus;
      Exit;
   end;
   btnActualizarConstancia.setfocus;
end;
}
// Fin HPC_201604_CXP

procedure TFOrdenPagoCab.bbtnImprimeClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago está Anulada');
      Exit;
   End;
// Inicio HPC_201602_CXP
// DAF_2015001728_CXP_1 condiciona Importe Neto para Notas de Crédito
{
   xSQL :='Select A.CIAID CIAORDEN, H.CIADES, A.NUMERO, G.ESTADO, G.FECHA, A.ITEM, '
      + '         B.CIAID CIAPROV, B.CPANOMES, B.TDIARID, B.CPNOREG, B.CLAUXID, B.PROV, '
      + '         C.PROVRUC, '
      + '         C.PROVDES, D.DCPGLOSA, B.DOCID, B.CPSERIE, B.CPNODOC, B.TMONID, '
      + '         B.CPMTOORI IMPTOTAL, '
      + '         B.DTRPORC, E.DCPMOORI IMPDETRAC, '
      + '         case when B.DTRPORC<=0 then A.IMPRETE else 0.00 end IMPRETIGV, '
      + '         A.IMPPAGO, '
      + '         case when B.DTRPORC<=0 and A.IMPRETE>0 then D.DCPMOORI-A.IMPRETE else D.DCPMOORI end IMPNETO, '
      + '         F.FPAGOID, '
      + '         G.USUARIO, G.USUACEPTA '
      + '    from CXP_ORD_PAG_DET A, CXP301 B, TGE201 C, CXP302 D, CXP302 E, '
      + '         (select CIAID, CLAUXID, PROV, max(FPAGOID) FPAGOID '
      + '            from CAJA102 '
      + '           group by CIAID, CLAUXID, PROV) F, '
      + '         CXP_ORD_PAG_CAB G, TGE101 H '
      + '   where A.CIAID='+quotedstr(dblcCia.Text)
      + '     and A.NUMERO='+quotedstr(dbeNumero.Text)
      + '     and B.CLAUXID=A.CLAUXID and B.PROV=A.AUXID '
      + '         and B.DOCID=A.DOCID and B.CPSERIE=A.CPSERIE and B.CPNODOC=A.CPNODOC '
      + '         and B.CPESTADO in (''C'',''P'') '
      + '     and C.CLAUXID=A.CLAUXID and C.PROV=A.AUXID '
      + '     and D.CIAID=B.CIAID and D.DCPANOMM=B.CPANOMES and D.TDIARID=B.TDIARID '
      + '         and D.CPNOREG=B.CPNOREG and D.TIPDET=''TO'' '
      + '     and E.CIAID(+)=B.CIAID and E.DCPANOMM(+)=B.CPANOMES and E.TDIARID(+)=B.TDIARID '
      + '         and E.CPNOREG(+)=B.CPNOREG and E.TIPDET(+)=''I4'' '
      + '     and F.CIAID(+)=B.CIAID and F.CLAUXID(+)=B.CLAUXID and F.PROV(+)=B.PROV '
      + '     and G.CIAID=A.CIAID and G.NUMERO=A.NUMERO '
      + '     and H.CIAID=A.CIAID ';
}

// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   xSQL :='Select A.CIAID CIAORDEN, H.CIADES, A.NUMERO, G.ESTADO, G.FECHA, A.ITEM, '
      + '         B.CIAID CIAPROV, B.CPANOMES, B.TDIARID, B.CPNOREG, B.CLAUXID, B.PROV, '
      + '         C.PROVRUC, '
      + '         C.PROVDES, D.DCPGLOSA, B.DOCID, B.CPSERIE, B.CPNODOC, B.TMONID, '
      + '         case when B.DOCID=''07'' then B.CPMTOORI*-1 else B.CPMTOORI + case when B.DTRPORC>0 then nvl(E.DCPMOORI, 0) else 0 end end IMPTOTAL, '
      + '         B.DTRPORC, E.DCPMOORI IMPDETRAC, '
      + '         case when B.DTRPORC<=0 then A.IMPRETE else 0.00 end IMPRETIGV, '
      + '         A.IMPPAGO, '
      //+ '         case when B.DTRPORC<=0 and A.IMPRETE>0 then D.DCPMOORI-A.IMPRETE else case when B.DOCID=''07'' then D.DCPMOORI*-1 else D.DCPMOORI end end IMPNETO, '
      + '         case when B.DTRPORC<=0 and A.IMPRETE>0 then A.CPSALORI-A.IMPRETE -A.IMPOTRDTO else A.IMPPAGO end IMPNETO, '
      + '         A.IMPOTRDTO, '
// Fin HPC_201707_CXP
      + '         F.FPAGOID, '
      + '         G.USUARIO, G.USUACEPTA '
      + '    from CXP_ORD_PAG_DET A, CXP301 B, TGE201 C, CXP302 D, CXP302 E, '
      + '         (select CIAID, CLAUXID, PROV, max(FPAGOID) FPAGOID '
      + '            from CAJA102 '
      + '           group by CIAID, CLAUXID, PROV) F, '
      + '         CXP_ORD_PAG_CAB G, TGE101 H '
      + '   where A.CIAID='+quotedstr(dblcCia.Text)
      + '     and A.NUMERO='+quotedstr(dbeNumero.Text)
      + '     and B.CLAUXID=A.CLAUXID and B.PROV=A.AUXID '
      + '         and B.DOCID=A.DOCID and B.CPSERIE=A.CPSERIE and B.CPNODOC=A.CPNODOC '
      + '         and B.CPESTADO in (''C'',''P'') '
      + '     and C.CLAUXID=A.CLAUXID and C.PROV=A.AUXID '
      + '     and D.CIAID=B.CIAID and D.DCPANOMM=B.CPANOMES and D.TDIARID=B.TDIARID '
      + '         and D.CPNOREG=B.CPNOREG and D.TIPDET=''TO'' '
      + '     and E.CIAID(+)=B.CIAID and E.DCPANOMM(+)=B.CPANOMES and E.TDIARID(+)=B.TDIARID '
      + '         and E.CPNOREG(+)=B.CPNOREG and E.TIPDET(+)=''I4'' '
      + '     and F.CIAID(+)=B.CIAID and F.CLAUXID(+)=B.CLAUXID and F.PROV(+)=B.PROV '
      + '     and G.CIAID=A.CIAID and G.NUMERO=A.NUMERO '
      + '     and H.CIAID=A.CIAID ';
// Fin HPC_201602_CXP

   DMCXP.cdsReporte.Close;
   DMCXP.cdsReporte.DataRequest(xSql);
   DMCXP.cdsReporte.Open;
   DMCXP.cdsReporte.IndexFieldNames:='TDIARID;PROVDES;CPANOMES;CPNOREG';

   ppdbReporte.DataSource := DMCXP.dsReporte;
   pprReporte.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\CxPOPago.rtm';
   pprReporte.template.LoadFromFile;

   If cbDiseno.Checked Then
   Begin
      ppDesigner1.Report := pprReporte;
      ppDesigner1.ShowModal;
   End
   Else
   Begin
      pprReporte.print;
   End;
end;

procedure TFOrdenPagoCab.btnExportarExcelClick(Sender: TObject);
Var
   xSQL: String;
begin
   Try
      Screen.Cursor := crHourGlass;
      If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
      Begin
         ShowMessage('Orden de Pago está Anulada');
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
         Screen.Cursor := crDefault;
         Exit;
      End;

      xSQL :='Select A.CIAID CIAORDEN, H.CIADES, A.NUMERO, G.ESTADO, G.FECHA, A.ITEM, '
            + '         B.CIAID CIAPROV, B.CPANOMES, B.TDIARID, B.CPNOREG, B.CLAUXID, B.PROV, '
            + '         C.PROVRUC, '
            + '         C.PROVDES, D.DCPGLOSA, B.DOCID, B.CPSERIE, B.CPNODOC, B.TMONID, '
            + '         B.CPMTOORI IMPTOTAL, '
            + '         B.DTRPORC, E.DCPMOORI IMPDETRAC, '
            + '         case when B.DTRPORC<=0 then A.IMPRETE else 0.00 end IMPRETIGV, '
            + '         A.IMPPAGO, '
            //+ '         case when B.DTRPORC<=0 and A.IMPRETE>0 then D.DCPMOORI-A.IMPRETE else D.DCPMOORI end IMPNETO, '
            + '         A.IMPPAGO IMPNETO, '
            + '         F.FPAGOID, '
            + '         G.USUARIO, G.USUACEPTA '
            + '    from CXP_ORD_PAG_DET A, CXP301 B, TGE201 C, CXP302 D, CXP302 E, '
            + '         (select CIAID, CLAUXID, PROV, max(FPAGOID) FPAGOID '
            + '            from CAJA102 '
            + '           group by CIAID, CLAUXID, PROV) F, '
            + '         CXP_ORD_PAG_CAB G, TGE101 H '
            + '   where A.CIAID='+quotedstr(dblcCia.Text)
            + '     and A.NUMERO='+quotedstr(dbeNumero.Text)
            + '     and B.CLAUXID=A.CLAUXID and B.PROV=A.AUXID '
            + '         and B.DOCID=A.DOCID and B.CPSERIE=A.CPSERIE and B.CPNODOC=A.CPNODOC '
            + '         and B.CPESTADO in (''C'',''P'') '
            + '     and C.CLAUXID=A.CLAUXID and C.PROV=A.AUXID '
            + '     and D.CIAID=B.CIAID and D.DCPANOMM=B.CPANOMES and D.TDIARID=B.TDIARID '
            + '         and D.CPNOREG=B.CPNOREG and D.TIPDET=''TO'' '
            + '     and E.CIAID(+)=B.CIAID and E.DCPANOMM(+)=B.CPANOMES and E.TDIARID(+)=B.TDIARID '
            + '         and E.CPNOREG(+)=B.CPNOREG and E.TIPDET(+)=''I4'' '
            + '     and F.CIAID(+)=B.CIAID and F.CLAUXID(+)=B.CLAUXID and F.PROV(+)=B.PROV '
            + '     and G.CIAID=A.CIAID and G.NUMERO=A.NUMERO '
            + '     and H.CIAID=A.CIAID ';
// Fin HPC_201707_CXP
      DMCXP.cdsReporte.Close;
      DMCXP.cdsReporte.DataRequest(xSql);
      DMCXP.cdsReporte.Open;
      DMCXP.cdsReporte.IndexFieldNames:='TDIARID;PROVDES;CPANOMES;CPNOREG';

      dbgExporta.datasource := DMCXP.dsReporte;
      DMCXP.HojaExcel('Orden de Compra', DMCXP.dsReporte, dbgExporta);
      DMCXP.cdsReporte.Close;
      Screen.Cursor := crDefault;
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;
end;

procedure TFOrdenPagoCab.sbDisenoClick(Sender: TObject);
begin
   cbDiseno.Checked := not cbDiseno.Checked;
end;

procedure TFOrdenPagoCab.pprReportePreviewFormCreate(Sender: TObject);
begin
   pprReporte.PreviewForm.WindowState := wsMaximized;
   TppViewer(pprReporte.PreviewForm.Viewer).ZoomSetting:=zsPageWidth; //zs100Percent;
end;

// Inicio HPC_201504_CXP
Procedure TFOrdenPagoCab.fg_HabilitaPanelConstancia;
Begin
   pnlConstancia1.Visible := True;
   pnlConstancia1.Top := 208;
   pnlConstancia1.Left := 304;
   dbgDetalle.Enabled := False;
End;
// Fin HPC_201504_CXP

// Inicio HPC_201504_CXP
procedure TFOrdenPagoCab.btnActConstanciaClick(Sender: TObject);
Var
   xsSql: String;
Begin
   pnlConstancia1.Visible := False;
   dbgDetalle.Enabled := True;
   xsSql := ' UPDATE CXP_ORD_PAG_CAB SET NUMOPE = ' + QuotedStr(trim(edtConstancia.text)) +
            ' WHERE CIAID =' + QuotedStr(DMCXP.cdsOPago.FieldByname('CIAID').AsString) +
            ' AND NUMERO =' + QuotedStr(DMCXP.cdsOPago.FieldByname('NUMERO').AsString) ;
   DMCXP.DCOM1.AppServer.EjecutaSQL(xsSql);

   DMCXP.cdsOPago.edit;
   DMCXP.cdsOPago.FieldByname('NUMOPE').AsString:=trim(edtConstancia.text);
   DMCXP.cdsOPago.post;
end;
// Fin HPC_201504_CXP

// Inicio HPC_201504_CXP
procedure TFOrdenPagoCab.btnCerrarPanelConstaClick(Sender: TObject);
begin
   pnlConstancia1.Visible := False;
   dbgDetalle.Enabled := True;
   CargaGridDetalle;
end;
// Fin HPC_201504_CXP

// Inicio HPC_201602_CXP
// DAF_2016000574_CXP_1 Botón para ajustar datos luego de Descontabilización
procedure TFOrdenPagoCab.bbtnDesCntClick(Sender: TObject);
var
   xSQL : String;
begin
   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago Esta Anulada');
      Exit;
   End;

   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString <> 'C' Then
   Begin
      ShowMessage('Orden de Pago no está CONFIRMADA');
      Exit;
   End;

   If Not ValidaUsuarioCNT(DMCXP.wUsuario) Then
   Begin
      ShowMessage('La DesContabilización de la Orden de Pago, solo la deben realizar los Usuarios del Área de Contabilidad');
      Exit;
   End;

   If DMCXP.cdsOPago.fieldByname('USUCONTA').AsString = '' Then
   Begin
      ShowMessage('Orden de Pago No está contabilizada');
      Exit;
   End;

   If fg_validaCierreContable(dtpFechaCnt.Date) = True Then
   Begin
      ShowMessage(' Mes Cerrado Contablemente!!!, No se puede Registrar');
      Exit;
   End;

   xSQL := 'Update CXP_ORD_PAG_CAB '
      + '      set USUCONTA=null'
      + '    where CIAID='+quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
      + '      and NUMERO='+quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString);
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('Error en la DesContabilización de la Orden de Pago');
      Exit;
   End;
   ShowMessage('Ok');
end;
// Fin HPC_201602_CXP

// Inicio HPC_201604_CXP
// cambia mantenimiento de datos de Transferencia Interbancaria
procedure TFOrdenPagoCab.bbtnDatosTransfClick(Sender: TObject);
begin
   wDatosOk_CCI := False;
   if rgOperacion.ItemIndex=1 then
   begin
      rgoperacion.enabled := False;
      Try
         FOPagoTransfInterb := TFOPagoTransfInterb.Create(Application);
         FOPagoTransfInterb.ShowModal;
      Finally
         FOPagoTransfInterb.Free;
      End;
   end
   else
   begin
      ShowMessage('Este botón sólo es para datos de Transferencias Interbancarias');
      exit;
   end;
end;
// Fin HPC_201604_CXP

// Inicio HPC_201604_CXP
procedure TFOrdenPagoCab.SelecImpresDest;
Var
   xSQL, xImpdefault, xCiaid  : String;
begin
// Resolviendo Tienda / Id Impresora
{
Delete from FAC_FE_PVTA where CIAID='02' and TIE_ID='01' and PVTA_ID='01';
Insert into FAC_FE_PVTA(CIAID, TIE_ID, PVTA_ID, PVTA_DES, IMP_ID, IMP_LOGO, PVTA_ACTIVO, FEC_ALTA, FEC_MODI)
Values('02', '01', '01', 'Cont 01', 'IMP008', 'CertRetIGV.jpg', 'S', trunc(sysdate), trunc(sysdate));
}
   wIP_Impresora := '';
   {
   xSQL := 'Select TIE_ID, PVTA_ID '
         + '  from DB2ADMIN.FAC206 T '
         + ' where CIAID  = ' + QuotedStr(xCiaid)
         + '   and USERID = ' + QuotedStr(DMCXP.wUsuario);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;

   If DMCXP.cdsQry.RecordCount=0 then
   Begin
      ShowMessage('El usuario no tiene definido un Destino de Impresión Asociado');
      xContinuaGrab := False;
      exit;
   End;

   xTienda := DMCXP.cdsQry.FieldByName('TIE_ID').AsString;
   xPVenta := DMCXP.cdsQry.FieldByName('PVTA_ID').AsString;
   }
   xCiaId := '02';
   xTienda := '01';
   xPVenta := '01';

// Resolviendo Impresora de Destino(Default)
   xSQL := 'Select T.IMP_ID, T.IMP_DES, T.IMP_IP, T.IMP_RUTAID '
         + '  from DB2ADMIN.FAC_FE_IMPR T, DB2ADMIN.FAC_FE_PVTA R '
         + ' where R.CIAID   = ' + QuotedStr(xCiaid)
         + '   and R.TIE_ID  = ' + QuotedStr(xTienda)
         + '   and R.PVTA_ID = ' + QuotedStr(xPVenta)
         + '   and T.IMP_ID  = R.IMP_ID '
         + '   and nvl(T.IMP_ACTIVO,''N'')=''S'' ' ;
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   xImpdefault   := DMCXP.cdsQry.FieldByName('IMP_DES').AsString;
   wIP_Impresora := DMCXP.cdsQry.FieldByName('IMP_IP').AsString;
   wId_Rutadest  := DMCXP.cdsQry.FieldByName('IMP_RUTAID').AsString;
   If DMCXP.cdsQry.RecordCount=0 then
   Begin
      ShowMessage('El usuario no tiene definida una Impresora');
      xContinuaGrab := False;
      exit;
   End;
{
// Carga Todas las Impresoras de Tienda
   xSQL := 'Select R.IMP_ID, R.IMP_DES, R.IMP_IP, R.IMP_RUTAID '
         + '  from DB2ADMIN.FAC_FE_PVTA T, DB2ADMIN.FAC_FE_IMPR R  '
         + ' where T.CIAID   = ' + QuotedStr(xCiaid)
         + '   and T.TIE_ID  = ' + QuotedStr(xTienda)
         + '   and R.IMP_ID  = T.IMP_ID '
         + '   and nvl(R.IMP_ACTIVO,''N'')=''S'' ' ;
   DMCXP.cdsQry9.Close;
   DMCXP.cdsQry9.DataRequest(xSQL);
   DMCXP.cdsQry9.Open;
   DMCXP.cdsQry9.IndexFieldNames :=  'IMP_DES';
   dblcdImpDest.LookUpField:='IMP_DES';
   dblcdImpDest.LookUpTable:=DMCXP.cdsQry9;
   dblcdImpDest.text := xImpdefault;
}
   xContinuaGrab := True;
//   pnlImprDest.visible := True;
end;
// Fin HPC_201604_CXP

// Inicio HPC_201604_CXP
procedure TFOrdenPagoCab.bbtnImpDestClick(Sender: TObject);
begin
   pnlImprDest.visible := False;

   xContinuaGrab := True;
   wIP_Impresora := DMCXP.cdsQry9.FieldByName('IMP_IP').AsString;
   wId_Rutadest  := DMCXP.cdsQry9.FieldByName('IMP_RUTAID').AsString;

//   GeneraTxtRetElec;
//   ShowMessage('Archivo fue Enviado a Sunat');
   exit;
end;
// Fin HPC_201604_CXP

// Inicio HPC_201604_CXP
procedure TFOrdenPagoCab.GeneraTxtRetElec;
var
   xSQL: String;
   xfArchivoTexto: TextFile;
   xsNombreTxt, xCarpeta, xsClave, xTDocSunat : String;
begin
   {
   DMCXP.DCOM1.AppServer.IniciaTransaccion;
   xSQL := ' Begin '
         +    '    DB2ADMIN.SP_TXT_CNT320_RETIGV2('+quotedstr(xnumserie) +','
         +         quotedstr(xnumretencion)+','
         +         QuotedStr(DMCXP.wUsuario) + ','
         +         QuotedStr('ACEPTADO')     + ','
         +         QuotedStr(wIP_Impresora)  + ') '
         + ' End;';
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo generar el archivo electrónico para SUNAT');
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;
   }
(*
// Resolviendo ID de Envio
   xsClave :=  '02' + xnumserie + xnumretencion;

// Resolviendo último número de Envio
   xSQL := 'Select max(NUMENVFAC) NUMENVFAC '
      + '     from db2admin.FAC_FACT_ELEC '
      + '    where CODFACELE = '+QuotedStr(xsClave);
   DMCXP.cdsQry4.Close;
   DMCXP.cdsQry4.DataRequest(xSQL);
   DMCXP.cdsQry4.Open;

// Resolviendo Tipo de Documento Sunat
   xSQL := 'Select TDOC_SUNAT '
      + '  From db2admin.TGE110 '
      + '  Where DOCID = ' +QuotedStr(lkcDocid.text);
   DMCXP.cdsQry6.Close;
   DMCXP.cdsQry6.DataRequest(xSQL);
   DMCXP.cdsQry6.Open;

   xTDocSunat := DMCXP.cdsQry6.FieldByName('TDOC_SUNAT').AsString;

// Resolviendo Carpeta para Archivo
   xSQL := 'Select RUTADES '
      + '  From db2admin.TGE837 '
      + '  Where APLIC = ' +QuotedStr('RET')
      + '   And RUTAID = ' +QuotedStr(wId_Rutadest);
   DMCXP.cdsQry6.Close;
   DMCXP.cdsQry6.DataRequest(xSQL);
   DMCXP.cdsQry6.Open;

   xCarpeta := DMCXP.cdsQry6.FieldByName('RUTADES').AsString;

// Seleccionando Registros para escribir en Txt
   xSQL := 'Select NUMDETLIN, DESDETLIN '
      +    '  from db2admin.FAC_FACT_ELEC '
      +    '  where CODFACELE  = ' +QuotedStr(xsClave)
      +    '    and NUMENVFAC  = ' +inttostr(DMCXP.cdsQry4.FieldByName('NUMENVRET').AsInteger);
//      +    '     and ESTADOFAC = ' +QuotedStr('ACEPTADO');
   DMCXP.cdsQry8.Close;
   DMCXP.cdsQry8.DataRequest(xSQL);
   DMCXP.cdsQry8.Open;
   DMCXP.cdsQry8.IndexFieldNames := 'NUMDETLIN';

//
   xsNombreTxt := xCarpeta+'RE_'+xTDocSunat+'_'+dbeRetSerie.text+'_'+dbeRetNumero.text+'.txt';
   AssignFile(xfArchivoTexto, xsNombreTxt);
   Rewrite(xfArchivoTexto);

   DMCXP.cdsQry8.First;
   while not DMCXP.cdsQry8.EOF do
   Begin
      WriteLn(xfArchivoTexto, DMCXP.cdsQry8.FieldByName('DESDETLIN').AsString);
      DMCXP.cdsQry8.Next;
   End;
   CloseFile(xfArchivoTexto);
*)
end;
// Fin HPC_201604_CXP

// Inicio HPC_201604_CXP
procedure TFOrdenPagoCab.bbtnImpDestCancClick(Sender: TObject);
begin
   pnlImprDest.visible := False;
   xContinuaGrab := False;
   Exit;
end;
// Fin HPC_201604_CXP

// Inicio HPC_201604_CXP
procedure TFOrdenPagoCab.dtpFechaCntExit(Sender: TObject);
begin
   If fg_validaCierreContable(dtpFechaCnt.Date) = True Then
   Begin
      ShowMessage(' Mes Cerrado Contablemente!!!, No se puede Registrar');
      dtpFechaCnt.SetFocus;
      Exit;
   End;

   if dtpFechaCnt.Date<dtpFecha.Date then
   Begin
      ShowMessage(' Fecha de Contabilización no puede ser menor a la Fecha de la Orden de Pago');
      dtpFechaCnt.SetFocus;
      Exit;
   End;

   xTCambio := '0';
   xSQL := 'TMONID='+quotedstr(DMCXP.wTMonExt)+' and FECHA='+quotedstr(datetostr(dtpFechaCnt.date));
   If length(BuscaQry('PrvTGE', 'TGE107', 'TMONID, TCAM' + DMCXP.wVRN_TipoCambio, xSQL, 'TMONID')) > 0 Then
      xTCambio := FloatToStr(DMCXP.cdsQry.fieldbyname('TCAM' + DMCXP.wVRN_TipoCambio).AsFloat);
   If xTCambio = '0' Then
   Begin
      ShowMessage('Falta ingresar el Tipo de Cambio');
      dtpFechaCnt.SetFocus;
      Exit;
   End;
end;
// Fin HPC_201604_CXP

// Inicio HPC_201703_CXP
// Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
Procedure TFOrdenPagoCab.ValidacionSEMT(Datos: TDatasource; Fichero: String; Delimitador: char);
Var
   f: textfile;
   n, i: integer;
   Linea, Entero, Decimal, Cuenta, Importe, Punto, xSQL, Ruc, xCtaCte, xTmpC, xTM, xfec, xNom, xTipD: String;
   xTDoc, xNoDoc, xRuc, xRef, xDir, xDis, xPro, xDep, xContacto, xCtl, xReg: String;
   nTotal: Double;
Begin

   AssignFile(f, Fichero);
   Rewrite(f);

   With Datos.DataSet Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         xSQL := 'Select * '
               + '  from TGE201 '
               + ' where CLAUXID=''' + Datos.DataSet.FieldByName('CLAUXID').AsString + ''' '
               + '   and PROV=''' + Datos.DataSet.FieldByName('AUXID').AsString + '''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.indexfieldnames := '';
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;

// Detalle
// RUC|MONTO
         Linea := ' 1';	

// Inicio HPC_201706_CXP  
// Nueva rutina para obtener la data para la validacion SEMT
         If DMCXP.cdsQry.FieldByname('TIPPERID').AsString = '02' Then
         Begin
            xTipD := 'RUC';
            xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVRUC').AsString) + '            ', 1, 11);
         End
         Else
         Begin
            If Copy(DMCXP.cdsQry.FieldByName('PROVRUC').AsString, 1, 2) = '10' Then
            Begin
               xTipD := 'RUC';
               xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVRUC').AsString) + '            ', 1, 11);
            End
            Else
            Begin
               xTipD := '   ';
               If DMCXP.cdsQry.FieldByname('TIPDOCID').AsString = '01' Then xTipD := 'DNI';
               If DMCXP.cdsQry.FieldByname('TIPDOCID').AsString = '04' Then xTipD := 'CE ';
               If DMCXP.cdsQry.FieldByname('TIPDOCID').AsString = '07' Then xTipD := 'PAS';
               xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVDNI').AsString) + '            ', 1, 11);
            End;
         End;
// Fin HPC_201706_CXP	

         xNom := Copy(DMCXP.cdsQry.FieldByName('PROVDES').AsString + '                                        ', 1, 40);
         Importe := FormatFloat('######.#0', Datos.DataSet.FieldByName('IMPPAGO').AsCurrency);

         Linea := xRuc + '|' + Importe;

         Memo1.Lines.Add(Linea);
         writeln(f, Linea);
         Next;
      End;
      EnableControls;
   End;

   CloseFile(f);
   MessageDlg(' Archivo Validación SEMT se generó con éxito ', mtInformation, [mbOk], 0);

End;
// Fin HPC_201703_CXP

// Inicio HPC_201703_CXP
// Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
procedure TFOrdenPagoCab.cbTodosClick(Sender: TObject);
var xSQL : String;
begin
    if DMCXP.cdsDetallePres.RecordCount >0 then
    begin
       if cbtodos.Checked = true then
       begin
          xSQL := ' update CXP_ORD_PAG_DET '
                 +'   set VALORDPAG=''S'' '
                 +' where CIAID='+quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
                 +'   and NUMERO='+quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString);
          Try
             DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
          Except
             ShowMessage('Error en la actualización del registro en la cabecera..');
             DMCXP.DCOM1.AppServer.RetornaTransaccion;
             Exit;
          End;
       end
       else
       begin
          xSQL := ' update CXP_ORD_PAG_DET '
                 +'   set VALORDPAG=''N'' '
                 +' where CIAID='+quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
                 +'   and NUMERO='+quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString);
          Try
             DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
          Except
             ShowMessage('Error en la actualización del registro en la cabecera..');
             DMCXP.DCOM1.AppServer.RetornaTransaccion;
             Exit;
          End;
       end;
    end
    else
    begin
        ShowMessage('No existe detalle para validar al SEMT de la Orden de Pago');
    end;
    CargaGridDetalle;

end;
// Fin HPC_201703_CXP

// Inicio HPC_201703_CXP
// Se ha implementado la Validación al SEMT para los Pagos a Proveedores en la Orden de Pago
Function TFOrdenPagoCab.ValidaOPSEMT(): Boolean;
Begin

   Result := False;
   DMCXP.cdsDetallePres.First;
   While Not DMCXP.cdsDetallePres.EOF Do
   Begin
       If DMCXP.cdsDetallePres.fieldByname('VALORDPAG').AsString ='N' Then
          Result := True;
       DMCXP.cdsDetallePres.Next;
   end;

End;
// Fin HPC_201703_CXP

// Inicio HPC_201706_CXP
// Nueva rutina para obtener la data para la validacion SEMT
Procedure TFOrdenPagoCab.ValidacionSEMT_CargaData;
Var
   xSQL: String;
Begin

   xTCambio := '0';
   xSQL := 'TMONID='+quotedstr(DMCXP.wTMonExt)+' and FECHA='+quotedstr(datetostr(dtpFecha.date));
   If length(BuscaQry('PrvTGE', 'TGE107', 'TMONID, TCAM' + DMCXP.wVRN_TipoCambio, xSQL, 'TMONID')) > 0 Then
      xTCambio := FloatToStr(DMCXP.cdsQry.fieldbyname('TCAM' + DMCXP.wVRN_TipoCambio).AsFloat);
   If xTCambio = '0' Then
   Begin
      ShowMessage('Falta ingresar el Tipo de Cambio');
      dtpFecha.SetFocus;
      Exit;
   End;

   xSQL := 'Select D.CLAUXID, D.AUXID, SUM( CASE WHEN D.TMONID = ''D'' THEN ROUND(D.IMPPAGO*' + xTCambio + ',2) ELSE D.IMPPAGO END) AS IMPPAGO '
         + '  from CXP_ORD_PAG_DET D '
         + ' INNER JOIN CXP301 C ON D.CLAUXID = C.CLAUXID AND D.AUXID=C.PROV AND D.DOCID = C.DOCID AND D.CPSERIE =C.CPSERIE and D.CPNODOC = C.CPNODOC '
         + ' where D.CIAID =''' + DMCXP.cdsOPago.FieldByname('CIAID').AsString + ''' '
         + '   and D.NUMERO=''' + DMCXP.cdsOPago.FieldByname('NUMERO').AsString + ''' '
         + '   and C.CPESTADO in (''C'',''P'') '
         + ' group by D.CLAUXID, D.AUXID '
		     + ' having SUM( CASE WHEN D.TMONID = ''D'' THEN ROUND(D.IMPPAGO*' + xTCambio + ',2) ELSE D.IMPPAGO END) > 3500 '
         + ' order by D.AUXID';

   DMCXP.cdsQry10.Close;
   DMCXP.cdsQry10.DataRequest(xSQL);
   DMCXP.cdsQry10.Open;

End;
// Fin HPC_201706_CXP

end.

