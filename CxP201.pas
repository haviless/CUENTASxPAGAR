Unit CxP201;

//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : CxP201
//Formulario               : FProvision
//Fecha de Creación        :
//Autor                    : Equipo de Desarrollo
//Objetivo                 : Registra la Provisión de los documentos

// Actualizaciones:
// SAR2009-0732
// SAR2010-0196   DAD-AS-2010-0006
// SAR2010-0207   DAD-AS-2010-0008
// HPP_201101_CXP 01/03/2011: Se verifica la fecha del documento para obtener.
//                            el porcentaje de IGV. si el documento es menor o igual
//                            al 28/02/2011 entonces el IGV será 0.19 en caso contrario
//                            el IGV serà el obtenido de la tabla TGE113.
// HPP_201103_CXP 15/06/2011: Obtiene los datos del documento de la Orden de Pago
//                            Registrado en el módulo de adquisiones.
// HPC_201107_CXP 10/10/2011: Habilita el botón bbtnCalc cuando la provisión está aceptada
//                            y aún no está pagada. Este botón es usado para recalcular
//                            los totales cuando la provisión no se realizó correctamente.
// HPC_201110_CXP 08/11/2011: Considera el item del documento en la Orden de Pago.
// HPC_201209_CXP 23/11/2012: Generación automática del detalle de la provisión en los
//                            casos que no es afecto al IGV.
// HPC_201304_CXP 22/10/2013  agregado por Christian Flores
//                            Se adiciono el Registro de Cuenta 15 B.I. No Domiciliadas
//                            para su automatización al momento de la carga en el Detalle de Provisiones.
// HPC_201306_CXP 26/11/2013  Indica Mensaje de Suspensión de Renta de 4ta Categoría.
// HPC_201401_CXP 13/01/2014  Modifica Mensaje de Suspensión de Renta de 4ta Categoría.
//                10/02/2014  Modificar los ControlTrans, AplicaDato y los ApplyUpdates.
// HPC_201402_CXP 10/03/2014  Modificar los ControlTrans, AplicaDato y los ApplyUpdates.
// HPC_201403_CXP 20/03/2014  Modificar los ControlTrans, AplicaDato y los ApplyUpdates.
// HPC_201404_CXP 26/03/2014  Se agrega campos TMONID, CPTCAMPR, CPTCAMAJ a script de Update de CXP301.
// HPC_201405_CXP 11/04/2014  Ajustes para Rentas No Domiciliadas y Renta 2da Categoría.
// HPC_201406_CXP 23/04/2014  Retirar los ApplyUpdates del Formulario CXP201 Comprobantes.
//                            Se retiró validación donde fecha de Deposito de Detracción no puede ser menor a la fecha de comprobante.
//                            Se uniformiza rutina que valida código y Ruc de Proveedor.
//                            Se renombra botón que aplica pagos a la provisión y se reordena su habilitación de acuerdo al estado.
//                            Se incluye control de cierres en la anulación.
//                            Al botón que marca provisión para retención IGV se añadió validación de proveedor.
// HPC_201407_CXP 30/05/2014  Se cambia de cdsDetCxP a cdsMovCxP en la desactivación de Retención de IGV
//                02/06/2014  Se actualiza usuario, fecha y hora de registro en grabación de cabecera y detalle
//                            Las actualizaciones se realizan en base al Nro de Registro de la Provisión y no
//                            en base al número del detalle
// HPC_201408_CXP 18/06/2014  Se incluye los campos
//                            al momento de actualizar el archivo de cabecera
// HPC_201410_CXP 23/07/2014  Cambios por inclusión de campos y validaciones de Régimen de Pensión
// HPC_201411_CXP 15/08/2014  Adicionales Régimen de Pensión
// SPP_201411_CXP 28/08/2014  Revisión control de calidad.
// HPC_201501_CXP 25/05/2014  Retiro de proceso de calculo por Derogación de Ley 29903
// HPC_201604_CXP 16/08/2016  DAF_2016001170 Valida que Serie tenga longitud fija si así lo requiere
//                31/10/2016  DAF_2016001440 Lleva Saldo de la Provisión al valor del Registro Tipo 'TO' del Detalle
//                22/11/2016  Compara Total TO del Detalle versus Saldo de la Provisión para ACEPTAR
//                17/10/2016  DAF_2016001421_CXP_1 Libera Provisión de Gestión de Fondos para poder Anular.
// HPC_201701_CXP 04/04/2017  Considera Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00 (cambio de JCC que nunca paso a producción pero es el ultimo fuente)
//                            La Fecha de Emisión del documento deben ser Menor o Igual a la fecha de Comprobante
// HPC_201702_CXP  05/05/2017  se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
// HPC_201704_CXP           : Seguros-Automatización de Devengue de Seguros

// HPC_201705_CXP 31/07/2017  Cambio en validacion de documento duplicado
//                            Nueva Opción Importar detalles
// HPC_201707_CXP              Ajuste en la opción de Nota de Crédito
// HPC_201803_CXP 05/03/2018  Se implementa debido a la solicitud de Orden de Pago

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   wwdblook, Wwdotdot, Mask, wwdbedit, Wwdbdlg, wwdbdatetimepicker,
   StdCtrls, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Buttons, Wwkeycb, DB,
   Wwdbcomb, wwSpeedButton, wwDBNavigator, wwidlg, wwclient, ppCtrls,
   ppBands, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppDB, ppComm,
   ppRelatv, ppCache, ppDBPipe, ppViewr, Menus, ComCtrls, oaVariables,
// Inicio HPC_201704_CXP
// Seguros-Automatización de Devengue de Seguros
// Inicio HPC_201705_CXP
// Nueva Librería
   Spin, Variants, ppTypes, ppParameter, wwFrame, Wwdbspin, IniFiles,DateUtils,
   StrContainer; 
//Fin HPC_201705_CXP
// Fin HPC_201704_CXP

Type
   TFProvision = Class(TForm)
      pnlCab4: TPanel;
      pnlDetalle: TPanel;
      pnlCab1: TPanel;
      lblCia: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      lblProv: TLabel;
      dblcdProv: TwwDBLookupComboDlg;
      lblProvRuc: TLabel;
      dblcdProvRuc: TwwDBLookupComboDlg;
      lblProvNom: TLabel;
      edtProv: TEdit;
      pnlCab2: TPanel;
      lblTDoc: TLabel;
      edtTDoc: TEdit;
      lblSerie: TLabel;
      lblNoDoc: TLabel;
      lblTDiario: TLabel;
      dblcTDiario: TwwDBLookupCombo;
      edtTDiario: TEdit;
      lblAnoMes: TLabel;
      lblNoReg: TLabel;
      pnlCab3: TPanel;
      Label9: TLabel;
      Label10: TLabel;
      dtpFVcmto: TwwDBDateTimePicker;
      Label11: TLabel;
      dblcTMon: TwwDBLookupCombo;
      edtTMon: TEdit;
      Label12: TLabel;
      dbeTCambio: TwwDBEdit;
      lblOCompra: TLabel;
      Label14: TLabel;
      dtpFRecep: TwwDBDateTimePicker;
      Label1: TLabel;
      dbeLote: TwwDBEdit;
      bbtnOK: TBitBtn;
      bbtnBorra: TBitBtn;
      edtSerie: TwwDBEdit;
      edtNoDoc: TwwDBEdit;
      meAnoMM: TwwDBEdit;
    meNoReg: TwwDBEdit;
      Label15: TLabel;
      dtpFComp: TwwDBDateTimePicker;
      pnlPie: TPanel;
      bbtnCalc: TBitBtn;
      pnlEstado: TPanel;
      lblAnula: TLabel;
      lblActivo: TLabel;
      lblContab: TLabel;
      lblAcepta: TLabel;
      Label3: TLabel;
      bbtnRegresa: TBitBtn;
      bbtnCancela: TBitBtn;
      Z2bbtnGraba: TBitBtn;
      Z2bbtnAcepta: TBitBtn;
      Z2bbtnAnula: TBitBtn;
      Z2bbtnContab: TBitBtn;
      Z2bbtnNuevo: TBitBtn;
      dtpFEmis: TwwDBDateTimePicker;
      dblcTDoc: TwwDBLookupCombo;
      dblcClAux: TwwDBLookupCombo;
      Label6: TLabel;
      pnlImpuesto: TPanel;
      bbtnGenReg: TBitBtn;
      dblcImpuesto: TwwDBLookupCombo;
      edtImpuesto: TEdit;
      lblEliminado: TLabel;
      Label4: TLabel;
      dblcClAuxResp: TwwDBLookupCombo;
      dblcdResp: TwwDBLookupComboDlg;
      Label8: TLabel;
      edtResp: TEdit;
      pnlActuali: TPanel;
      lblActuali: TLabel;
      Z2bbtnPreview: TBitBtn;
      ppdbpPreview: TppDBPipeline;
      pprPreview: TppReport;
      MainMenu1: TMainMenu;
      lblInter: TLabel;
      chkInter: TCheckBox;
      dblcClauxInter: TwwDBLookupCombo;
      lblClauxInter: TLabel;
      lblProvInter: TLabel;
      dblcdInter: TwwDBLookupComboDlg;
      edtIntermediario: TEdit;
      dblcdOCompra: TwwDBLookupComboDlg;
      lblRetIGV: TLabel;
      PageControl1: TPageControl;
      TabSheet1: TTabSheet;
      dbgDetCxP: TwwDBGrid;
      btnActReg: TwwIButton;
      TabSheet2: TTabSheet;
      pnlCanje: TPanel;
      Label2: TLabel;
      dbgCanje: TwwDBGrid;
      dbgCanjeIButton: TwwIButton;
      pnlPendientes: TPanel;
      Label7: TLabel;
      dbgPendientes: TwwDBGrid;
      bbtnTotal: TBitBtn;
      seDias: TSpinEdit;
      pnlRegReferencia: TPanel;
      Label13: TLabel;
      Label24: TLabel;
      Label16: TLabel;
      dblcRefTipoDoc: TwwDBLookupCombo;
      edtReftipDoc: TEdit;
      Panel3: TPanel;
      bbtnDocref: TBitBtn;
      bbtnCancelar: TBitBtn;
      edtRefSerie: TEdit;
      edtRefNodoc: TEdit;
      Label17: TLabel;
      Label18: TLabel;
      dtpFComp2: TwwDBDateTimePicker;
      bbtnAplicaPagos: TBitBtn; // HPC_201406_CXP Ex-BitBtn1
      ppHeaderBand2: TppHeaderBand;
      pplblCiaDes: TppLabel;
      ppsvFecha: TppSystemVariable;
      pplblModulo: TppLabel;
      pplblPeriodo: TppLabel;
      pplblNroComp: TppLabel;
      pplblTDiario: TppLabel;
      pplblDiarioDes: TppLabel;
      pplblAnoMes: TppLabel;
      pplblNoCompro: TppLabel;
      pplblProvDes: TppLabel;
      pplblProveedor: TppLabel;
      pplblMoneda: TppLabel;
      pplblMonedaDes: TppLabel;
      pplblGlosa: TppLabel;
      pplblGlosaDes: TppLabel;
      pplblSerie: TppLabel;
      pplblNoDoc: TppLabel;
      pplblFEmision: TppLabel;
      pplblCuenta: TppLabel;
      pplblDescrip: TppLabel;
      pplblProvId: TppLabel;
      pplblCCosto: TppLabel;
      pplblCntTCambio: TppLabel;
      pplblMonedaDoc: TppLabel;
      pplblDebe: TppLabel;
      pplblHaber: TppLabel;
      pplblCodProv: TppLabel;
      ppdbCntTCambio: TppDBText;
      pplblFecComp: TppLabel;
      ppdbCia: TppDBText;
      pplblFecEmision: TppLabel;
      ppdbFecComp: TppDBText;
      pplblEstado: TppLabel;
      ppLblDesEstado: TppLabel;
      pplblTit: TppLabel;
      pplblFecha: TppLabel;
      ppraya1: TppLabel;
      ppraya2: TppLabel;
      ppraya3: TppLabel;
      pplblItem: TppLabel;
      pplblFecDoc: TppLabel;
      pplblImporte: TppLabel;
      pplblMontoImporte: TppLabel;
      pplblTipCam: TppLabel;
      pplblHora: TppLabel;
      ppsvHora: TppSystemVariable;
      pplblTipoCamb: TppLabel;
      pplblDiario: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppdbSerie: TppDBText;
      ppdbNoDoc: TppDBText;
      ppdbCuenta: TppDBText;
      ppdbDebe: TppDBText;
      ppdbHaber: TppDBText;
      ppdbGlosa: TppDBText;
      ppdbCCos: TppDBText;
      ppdbMtoExt: TppDBText;
      ppdbFEmis: TppDBText;
      ppdbItem: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      ppdbcDebe: TppDBCalc;
      ppdbcHaber: TppDBCalc;
      ppRaya4: TppLabel;
      ppLabel1: TppLabel;
      lbDTRCpto: TListBox;
      lbDTRPorc: TListBox;
      Label19: TLabel;
      cbSujetoaRetIGV: TCheckBox;
      TabSheet3: TTabSheet;
      pnlDetraccion: TPanel;
      Label20: TLabel;
      Label21: TLabel;
      dbeNumDet: TwwDBEdit;
      dtpFecDet: TwwDBDateTimePicker;
      bbtnGrabaDet: TBitBtn;
      Bevel1: TBevel;
      bbtnEliminaDet: TBitBtn;
      pnlSunat: TPanel;
      pnlSunat2: TPanel;
      bbtnTR: TBitBtn;
      bbtnSR: TBitBtn;
      pnlRegistro: TPanel;
      lblTipReg: TLabel;
      lblCnpEgr: TLabel;
      lblCCosto: TLabel;
      lblDH: TLabel;
      lblImporte: TLabel;
      lblGlosa: TLabel;
      lblCuenta: TLabel;
      lblTipPre: TLabel;
      lblPresu: TLabel;
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
      dbeGlosa: TwwDBEdit;
      StaticText1: TStaticText;
      dblcTipPre: TwwDBLookupCombo;
      dbeTipPre: TwwDBEdit;
      edtPresup: TEdit;
      dblcdPresup: TwwDBLookupComboDlg;
      cbRepGlosa: TCheckBox;
      bbtnDet: TBitBtn;
      Btn_OrdenPago: TBitBtn;
      lbl_DocsOrdenPago: TLabel;
      Label5: TLabel;
      lblDet: TLabel;
      dbeDetrac: TwwDBEdit;
      Panel1: TPanel;
      Label22: TLabel;
      Label23: TLabel;
      Bevel2: TBevel;
      bbtnGrabSut: TBitBtn;
      bbtnElimSun: TBitBtn;
      dblcTipoD: TwwDBLookupCombo;
      edtTipoD: TwwDBEdit;
      dblcOperD: TwwDBLookupCombo;
      edtOperD: TwwDBEdit;
      StaticText2: TStaticText;
      StaticText3: TStaticText;
      dbePor: TwwDBEdit;
      lblPor: TLabel;
      lblsusp4c: TLabel;
      bbtnSNP: TBitBtn;
    bbtnLiberaGFN: TBitBtn;
// Inicio HPC_201704_CXP
// Seguros-Automatización de Devengue de Seguros
    Label25: TLabel;
    cbSeguros: TCheckBox;
    pnlSeguroDatos: TPanel;
    Label26: TLabel;
    lblTitulo1: TLabel;
    bbtnOk1: TBitBtn;
    bbtnCanc1: TBitBtn;
    btnSalir: TBitBtn;
    Label27: TLabel;
    Label28: TLabel;
    dbeConcepto: TwwDBEdit;
    dblcConcepto: TwwDBLookupComboDlg;
    dbePoliza: TwwDBEdit;
    dtpFIVigencia: TwwDBDateTimePicker;
    Label29: TLabel;
    dtpFFVigencia: TwwDBDateTimePicker;
    btnGrabarSeg: TBitBtn;
    btnLimpiarSeg: TBitBtn;
// Fin HPC_201704_CXP
      //Inicio HPC_201705_CXP
      sdImportDetalles: TSaveDialog;
      scData: TStrContainer;
      bbtnImportDetalles: TBitBtn;
      //Fin HPC_201705_CXP
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure bbtnOKClick(Sender: TObject);
      Procedure bbtnCancelaClick(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure dblcdCCostoExit(Sender: TObject);
      Procedure dblcTipRegExit(Sender: TObject);
      Procedure meNoRegExit(Sender: TObject);
      Procedure dblcdProvRucExit(Sender: TObject);
      Procedure edtProvExit(Sender: TObject);
      Procedure dblcdProvExit(Sender: TObject);
      Procedure dblcdCnpEgrExit(Sender: TObject);
      Procedure dtpFCompExit(Sender: TObject);
      Procedure Z2bbtnContabClick(Sender: TObject);
      Procedure edtNoDocExit(Sender: TObject);
      Procedure bbtnBorraClick(Sender: TObject);
      Procedure dblcTDocExit(Sender: TObject);
      Procedure edtSerieExit(Sender: TObject);
      Procedure dblcTDiarioExit(Sender: TObject);
      Procedure dtpFEmisExit(Sender: TObject);
      Procedure dtpFVcmtoExit(Sender: TObject);
      Procedure dblcTMonExit(Sender: TObject);
      Procedure dbeTCambioExit(Sender: TObject);
      Procedure dbeOCompraExit(Sender: TObject);
      Procedure dtpFRecepExit(Sender: TObject);
      Procedure dbeLoteExit(Sender: TObject);
      Procedure bbtnRegresaClick(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure Z2bbtnAnulaClick(Sender: TObject);
      Procedure Z2bbtnAceptaClick(Sender: TObject);
      Procedure bbtnCalcClick(Sender: TObject);
      Procedure dbgDetCxPDblClick(Sender: TObject);
      Procedure btnActRegClick(Sender: TObject);
      Procedure bbtnRegOkClick(Sender: TObject);
      Procedure bbtnRegCancClick(Sender: TObject);
      Procedure dbeDHExit(Sender: TObject);
      Procedure dbeImporteExit(Sender: TObject);
      Procedure dbgDetCxPKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dblcdProvEnter(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcClAuxExit(Sender: TObject);
      Procedure bbtnGenRegClick(Sender: TObject);
      Procedure dblcImpuestoExit(Sender: TObject);
      Procedure dblcdPresupExit(Sender: TObject);
      Procedure dblcdProvRucEnter(Sender: TObject);
      Procedure dblcClAuxRespExit(Sender: TObject);
      Procedure dblcdRespExit(Sender: TObject);
      Procedure dblcTipPreExit(Sender: TObject);
      Procedure Z2bbtnPreviewClick(Sender: TObject);
      Procedure ppDetailBand2BeforePrint(Sender: TObject);
      Procedure dblcdCnpEgrEnter(Sender: TObject);
      Procedure pprPreviewPreviewFormCreate(Sender: TObject);
      Procedure dbeGlosaExit(Sender: TObject);
      Procedure chkInterClick(Sender: TObject);
      Procedure dblcClauxInterExit(Sender: TObject);
      Procedure dblcdInterEnter(Sender: TObject);
      Procedure dblcdInterExit(Sender: TObject);
      Procedure chkInterExit(Sender: TObject);
      Procedure dblcdOCompraEnter(Sender: TObject);
      Procedure dblcdOCompraExit(Sender: TObject);
      Procedure dblcTipRegEnter(Sender: TObject);
      Procedure dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
      Procedure dbgPendientesMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      Procedure dbgCanjeDragOver(Sender, Source: TObject; X, Y: Integer;
         State: TDragState; Var Accept: Boolean);
      Procedure dbgCanjeEndDrag(Sender, Target: TObject; X, Y: Integer);
      Procedure dbgCanjeMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      Procedure dbgPendientesDragOver(Sender, Source: TObject; X, Y: Integer;
         State: TDragState; Var Accept: Boolean);
      Procedure bbtnTotalClick(Sender: TObject);
      Procedure seDiasExit(Sender: TObject);
      Procedure dblcImpuestoEnter(Sender: TObject);
      Procedure dbgCanjeIButtonClick(Sender: TObject);
      Procedure bbtnDocrefClick(Sender: TObject);
      Procedure dblcRefTipoDocExit(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure dbgCanjeDblClick(Sender: TObject);
      Procedure bbtnAplicaPagosClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dtpFecDetExit(Sender: TObject);
      Procedure bbtnGrabaDetClick(Sender: TObject);
      Procedure TabSheet3Enter(Sender: TObject);
      Procedure bbtnEliminaDetClick(Sender: TObject);
      Procedure PageControl1Change(Sender: TObject);
      Procedure bbtnTRClick(Sender: TObject);
      Procedure bbtnSRClick(Sender: TObject);
      Procedure bbtnDetClick(Sender: TObject);
      Procedure Btn_OrdenPagoClick(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcTipoDNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcOperDNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcTipoDExit(Sender: TObject);
      Procedure dblcOperDExit(Sender: TObject);
      Procedure bbtnGrabSutClick(Sender: TObject);
      Procedure bbtnElimSunClick(Sender: TObject);
      procedure bbtnSNPClick(Sender: TObject);
      procedure bbtnSNPMouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
   // Inicio HPC_201604_CXP
   // 17/10/2016 DAF_2016001421_CXP_1 Se añade botón para liberar Provisión de Gestión de Fondos
      procedure bbtnLiberaGFNClick(Sender: TObject);
   // Fin HPC_201604_CXP

   // Inicio HPC_201701_CXP
   // Considera Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00
      function validaSusp4ta(xgClAux, xgProveedor: string): Boolean;
   // Fin HPC_201701_CXP
// Inicio HPC_201704_CXP
// Seguros-Automatización de Devengue de Seguros
    procedure cbSegurosClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure dblcConceptoEnter(Sender: TObject);
    procedure dblcConceptoExit(Sender: TObject);
    procedure dtpFIVigenciaExit(Sender: TObject);
    procedure btnGrabarSegClick(Sender: TObject);
    procedure btnLimpiarSegClick(Sender: TObject);
// Fin HPC_201704_CXP

      //Inicio HPC_201705_CXP
      //Nuevas funciones para el manejo de la opción importar detalles
      Procedure bbtnImportDetallesClick(Sender: TObject);
      Procedure GeneraLog(iLinea:integer;sTexto, sLinea: string; var xfArchivoTexto: TextFile; var bLineTotal: Boolean);
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
    procedure dblcCiaChange(Sender: TObject);	 
// Fin HPC_201803_CXP
      //Fin HPC_201705_CXP

   Private
    { Private declarations }
      sCalcSaldos: String;
      xTotalL: double;
      xGlosaRep: String;
      xDias: TDate;
      XFLAGCCOS: String;
      xGlosa, strTemp, xMensaje, xDistri, xCta_Ccos, xExoIgv, xDtrAfecto: String;
      numreg: Integer;
      xImpAmort, xTotFac, xImpDtr: Double;
      wtasa, xTOT, xIGV, xTOTLOC, xTOTEXT, xTCambio: double;
      fMenu: TForm;
// Inicio HPC_201704_CXP
// Seguros-Automatización de Devengue de Seguros
      xdblcConcepto,xdbeConcepto,xdbePoliza,xdtpFIVigencia,xdtpFFVigencia: String;
// Fin HPC_201704_CXP

      Procedure CalculoNivelSupe;
      Procedure inicializoCero(xcds: TwwClientDataSet);
      Procedure CreaSuperior;
      Procedure CalculoNivel;
      Procedure Items;
      Procedure AnulaProvision;
      Procedure CargaDataSource;
      Procedure Detraccion;
      Procedure ActualizaMontos;
      Procedure EstadoDeDetraccion;
      Procedure EstadoDeSunat;
      Procedure ProveedoresNotificados;
      Procedure ProveedoresNoHabidos_NoHallados;
      Procedure RecalculaTotales;

      Procedure CopiaRegistro(xCds_fuente, xCds_destino: TwwClientDataSet);
      Procedure ImpuestoReg06(xTipoRegistro, xTipoDetalle: String);
      Procedure ActualizaOrdenPago(pEvento: String);
      Procedure botonOrdenPago(pCiaid, pProveedor: String);
      Function ValidaTotalOrdPago(pOrdenPago: String; wgItemOP: Integer; pTotal: Double): Boolean;
      Procedure ObtenerNumOrdenPago;
   Public
    { Public declarations }

      // Inicio HPC_201702_CXP
      // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
      xorigen,xDtrAfectoP: String;
      // Fin HPC_201702_CXP
      xOrdenPago: String;
      xnItemOP: Integer;
      xTotalOrdenPago: Double;
      inifile: TIniFile;

      xFiltroTDiar: String;
      wCje: String;
      xflag: String;
      xTituProv: String;
      xTipoProv: String;
      xDTRPorc: DOUBLE;
      xDTRMasDeUno: String;
      xDOCTIPREG: String;
      xEXON4TA: String;
      Procedure IniciaForma;
      Procedure FiltraCanje;
      Procedure GrabaDet;
      Procedure EstadoDeForma(xxModo: Integer; xMovEstado, xMovConta: String);
      Function Consistencia: Boolean;
      Function AsientoCuadra: Boolean;

      Procedure ConfiguraGrids(wwFormaL: TForm; wwNCampos: Integer);
      Procedure ConfiguraForma(wwForma: TForm; wwNCampos: Integer);
      Procedure ConfiguraCombos(wwFormaL: TForm; wwNCampos: Integer);
      Procedure ConfiguraLabels(wwFormaL: TForm; wwNCampos: Integer);
      Procedure ConfiguraPaneles(wwFormaL: TForm; wwNCampos: Integer);
      Function ValidaDetraccion(xCds_detdocumento: TwwClientDataSet): String;

   Published
      Property Menu: TForm Read fMenu Write fMenu;
   End;

Var
   FProvision: TFProvision;
   xSQL: String;
   xNuevoProv, xNuevaProv, xRegresa: Boolean;
   xTAutoNum, xTAno, xTMes: String;
   xxTCambio, xxTCamDol: Double;
   xCia: String;
   xTDi: String;
   xAMe: String;
   xNRe: String;
   xCrea: Boolean;
   xTemTReg: String;
   xTemCpto: String;
   xTemCta: String;
   xTemDH: String;
   xFlagGr: Boolean;
   xConta: String;
   xtippre: String;
   wCiaRetIGV, wProvRetIGV, wDocRetIGV: Boolean; // wCiaRetIGV determina si Cia es Agente de Retenciónj
                                       // wProvRetIGV determina si Proveedor esta sujeto a RetIGV

   xTasaRet, xTasaMonto, xTasaDTR: double;
   xTasaDes: String;
   xTasaFec: TDatetime;
   xCpto06, xCta06: String;
   xEsDomiciliado : String;
   xNuevoDet : boolean;

// Inicio HPC_201604_CXP
// 16/08/2016  DAF_2016001170 Variables para validar que Serie tenga longitud fija si así lo requiere
   xReqLongSerFija : boolean;
   xLongSerFija : Integer;

   xReqLongNroDocFija : boolean;
   xLongNroDocFija : Integer;
// Fin HPC_201604_CXP

// Inicio HPC_201701_CXP
// Considera Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00
   xValorMinRta4ta : Currency;
// Fin HPC_201701_CXP

Implementation

Uses CxPDM, CxP001, CxP778, CXP240, CXP250, CXP270, CXP130;

{$R *.DFM}

Procedure TFProvision.FiltraCanje;
Var
   xFiltro: String;
Begin
   xFiltro := 'CIAID=' + '''' + dblcCia.Text + '''' + ' and ' +
      'DCPANOMM=' + '''' + meAnoMM.Text + '''' + ' and ' +
      'TDIARID=' + '''' + dblcTdiario.Text + '''' + ' and ' +
      'CPNOREG=' + '''' + meNoReg.Text + '''';
   Filtracds(DMCXP.cdsDetCxP, 'Select * from CXP302 Where ' + xFiltro);

   xFiltro := 'CIAID=' + '''' + dblcCia.Text + ''''
            + ' and PROV=' + '''' + dblcdProv.Text + ''''
            + ' and DOCID<>' + '''' + dblcTDoc.Text + ''''
            + ' and (CPESTADO=''P'' or CPESTADO=''C'' ) ';
   DMCXP.cdsMovCxP2.close;
   DMCXP.cdsMovCxP2.dataRequest('SELECT * FROM CXP301 WHERE ' + xFiltro);
   DMCXP.cdsMovCxP2.Open;

// Filtra Compañía+NC+No.Canje en Detalle de Canje
   xFiltro := 'CIAID=' + '''' + dblcCia.Text + '''' + ' and '
            + 'TCANJEID=' + '''' + 'PR' + '''' + ' and '
            + 'DOCID2=' + '''' + dblcTDoc.Text + '''' + ' and '
            + 'CPSERIE2=' + '''' + edtSerie.Text + '''' + ' and '
            + 'CPNODOC2=' + '''' + edtNoDoc.Text + '''';
   Filtracds(DMCXP.cdsDetCanje, 'Select * from CXP305 Where ' + xFiltro);
End;

Procedure TFProvision.EstadoDeForma(xxModo: Integer; xMovEstado, xMovConta: String);
Begin
   bbtnOK.Enabled := False;
   bbtnBorra.Enabled := False;
   dblcCia.Enabled := True;
   edtProv.Enabled := False;
   pnlDetalle.Enabled := False;
   dbgDetCxP.ReadOnly := True;
   btnActReg.Enabled := False;
   pnlRegistro.Visible := False;
   bbtnTR.Visible := False;
   bbtnDet.Visible := False;

   pnlPie.Refresh;
   pnlPie.Enabled := False;
   pnlImpuesto.Enabled := False;
   bbtnRegresa.Enabled := False;
   bbtnCancela.Enabled := False;
   Z2bbtnGraba.Enabled := False;
   Z2bbtnAcepta.Enabled := False;
   Z2bbtnAnula.Enabled := False;
   Z2bbtnContab.Enabled := False;
   Z2bbtnNuevo.Enabled := False;
   Z2bbtnPreview.Enabled := False;
   bbtnAplicaPagos.Enabled := False;

   lblActivo.Visible := False;
   lblAcepta.Visible := False;
   lblAnula.Visible := False;
   lblContab.Visible := False;
   lblEliminado.Visible := False;

   If xxModo = 0 Then // cuando va hacia la cabecera
   Begin
      If (xMovEstado = ' ') Or (xMovEstado = '') Then
      Begin
         pnlCab1.Enabled := True;
         pnlCab2.Enabled := True;

         dblcTDoc.Enabled := True;
         dblcTDiario.Enabled := True;
         meNoReg.Enabled := True;
         dblcClAuxInter.Enabled := True;
         dblcdInter.Enabled := True;
         chkInter.Enabled := True;

         pnlCab3.Enabled := True;
         bbtnOK.Enabled := True;
         bbtnBorra.Enabled := True;

         lblActivo.Visible := False;

         dblcCia.SetFocus;
      End
      Else
      Begin
         If (xMovEstado = 'I') Or (xMovEstado = 'T') Then
         Begin
            pnlCab1.Enabled := False;
            pnlCab2.Enabled := True;

            dblcTDoc.Enabled := False;
            dblcTDiario.Enabled := False;
            meNoReg.Enabled := False;
            dblcClAuxInter.Enabled := False;
            dblcdInter.Enabled := False;
            chkInter.Enabled := False;

            pnlCab3.Enabled := True;
            bbtnOK.Enabled := True;
            bbtnBorra.Enabled := True;
            lblActivo.Visible := True;
            dtpFRecep.Font.Color := clNavy;
            dtpFRecep.SetFocus;
         End
      End
   End
   Else
   Begin // cuando el foco esta en el Detalle

      pnlCab1.Enabled := False;
      pnlCab2.Enabled := False;
      pnlCab3.Enabled := False;

      If xMovConta = 'S' Then
      Begin
         pnlDetalle.Enabled := True;
         lblContab.Visible := True;
         pnlPie.Enabled := True;
         Z2bbtnPreview.Enabled := True;
         bbtnTR.Visible := True;
         bbtnDet.Visible := True;
      End
      Else
      Begin
         If xMovEstado = 'T' Then // temporal grabado desde cabecera
         Begin
            pnlDetalle.Enabled := True;
            dbgDetCxP.ReadOnly := False;
            btnActReg.Enabled := True;

            pnlPie.Enabled := True;
            pnlImpuesto.Enabled := True;
            bbtnRegresa.Enabled := True;
            bbtnCancela.Enabled := True;
            Z2bbtnGraba.Enabled := True;
            lblActivo.Visible := True;
         End;
         If xMovEstado = 'I' Then // si ya esta grabado
         Begin

            pnlDetalle.Enabled := True;
            dbgDetCxP.ReadOnly := False;
            btnActReg.Enabled := True;

            pnlPie.Enabled := True;
            pnlImpuesto.Enabled := True;
            bbtnRegresa.Enabled := True;
            bbtnCancela.Enabled := True;
            Z2bbtnGraba.Enabled := True;
            Z2bbtnAcepta.Enabled := True;
            Z2bbtnAnula.Enabled := True;
            bbtnAplicaPagos.Enabled := False;
            lblActivo.Visible := True;
         End;
         If (xMovEstado = 'P') Or (xMovEstado = 'C') Then
         Begin
            pnlDetalle.Enabled := True;
            pnlPie.Enabled := True;
            Z2bbtnPreview.Enabled := True;
            If xConta <> 'N' Then
               Z2bbtnContab.Enabled := True;
            lblAcepta.Visible := True;
            Z2bbtnAnula.Enabled := True;
            bbtnTR.Visible := True;
            bbtnDet.Visible := True;
            bbtnAplicaPagos.Enabled := True;
         End;
         If xMovEstado = 'A' Then // anulado
         Begin
            pnlDetalle.Enabled := True;
            pnlPie.Enabled := True;
            lblAnula.Visible := True;
            bbtnAplicaPagos.Enabled := False;
         End;
         If xMovEstado = 'E' Then // anulado
         Begin
            pnlDetalle.Enabled := True;
            pnlPie.Enabled := True;
            lblEliminado.Visible := True;
            bbtnAplicaPagos.Enabled := False;
         End;
      End;

      If DMCXP.wModo = 'A' Then
      Begin
         Z2bbtnNuevo.Enabled := True;
      End;

   End;

   If DMCXP.wModo = 'C' Then
   Begin // Si Entra Solo Para Consulta
      pnlCab1.Enabled := False;
      pnlCab2.Enabled := False;
      pnlCab3.Enabled := False;
      bbtnOK.Enabled := False;
      bbtnBorra.Enabled := False;

      pnlDetalle.Enabled := False;
      dbgDetCxP.ReadOnly := True;
      btnActReg.Enabled := False;

      pnlPie.Refresh;
      pnlPie.Enabled := False;
      If DMCXP.wAdmin = 'G' Then
      Begin
         pnlPie.Enabled := True;
         Z2bbtnGraba.Enabled := True;
         Z2bbtnAcepta.Enabled := True;
         Z2bbtnAnula.Enabled := True;
         Z2bbtnContab.Enabled := True;
         Z2bbtnNuevo.Enabled := True;
         Z2bbtnPreview.Enabled := True;
      End
      Else
      Begin
         bbtnRegresa.Enabled := False;
         bbtnCancela.Enabled := False;
         Z2bbtnGraba.Enabled := False;
         Z2bbtnAcepta.Enabled := False;
         Z2bbtnAnula.Enabled := False;
         Z2bbtnContab.Enabled := False;
         Z2bbtnNuevo.Enabled := False;
         Z2bbtnPreview.Enabled := True;
         bbtnAplicaPagos.Enabled := False;
      End;
      pnlPie.Refresh;
   End;
End;

Procedure TFProvision.IniciaForma;
Begin
   xSQL := 'Select * from CXP302 where CIAID='+quotedstr('');
   Filtracds(DMCXP.cdsDetCxP, xSQL);

   pnlSunat.Visible := False;
   pnlSunat2.Visible := False;
   xFlagGr := False;
   wDocRetIGV := False;
   wCiaRetIGV := False;
   wProvRetIGV := False;
   lblRetIGV.visible := False;
   cbSujetoaRetIGV.checked := False;
   cbSujetoaRetIGV.visible := False;
   edtCia.Text := '';
   edtProv.Text := '';
   edtTDoc.Text := '';
   edtTDiario.Text := '';
   edtTMon.Text := '';
   dblcImpuesto.Text := '';
   dblcdresp.Text := '';
   edtImpuesto.Text := '';
   edtresp.Text := '';
   xTemTReg := '';
   xTemCpto := '';
   xTemCta := '';
   xTemDH := '';
   chkInter.Checked := false;
   dblcClauxInter.Visible := false;
   dblcdInter.Visible := false;
   edtIntermediario.Visible := false;
   lblClauxInter.Visible := false;
   lblProvInter.Visible := false;
   edtIntermediario.Text := '';
   xImpAmort := 0;

   xDTRPorc := 0;
   xImpDtr := 0;
   dbeDetrac.Visible := False;
   lblDet.Visible := False;
   xOrdenPago := '';
   xnItemOP := 0;

   dtpFComp.Enabled := True;
End;

Procedure TFProvision.FormClose(Sender: TObject; Var Action: TCloseAction);
Var
   sSQL: String;
Begin
   xCrea := true;

   If DMCXP.cdsDetCxP.Active Then
      DMCXP.cdsDetCxP.CancelUpdates;

   DMCXP.cdsTDiario.Filtered := false;
   If ((DMCXP.wModo = 'A') And (xFlagGr)) or (DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString = 'T') Then
   Begin
      If (DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString = 'P') Or
         (DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString = 'C') Then
        // No Borra Nada
      Else
      Begin
         xSQL := 'DELETE from CXP302 '
               + ' WHERE CIAID=' + '''' + dblcCia.Text + '''' + ' and '
               + '       TDIARID=' + '''' + dblcTdiario.Text + '''' + ' and '
               + '       DCPANOMM=' + '''' + meAnoMM.Text + '''' + ' and '
               + '       CPNOREG=' + '''' + meNoReg.Text + '''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         Try
            DMCXP.cdsQry.Execute;
         Except
         End;

         xSQL := 'DELETE from CXP301 '
               + ' WHERE CIAID=' + '''' + dblcCia.Text + '''' + ' and '
               + '       TDIARID=' + '''' + dblcTdiario.Text + '''' + ' and '
               + '       CPANOMES=' + '''' + meAnoMM.Text + '''' + ' and '
               + '       CPNOREG=' + '''' + meNoReg.Text + '''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         Try
            DMCXP.cdsQry.Execute;
         Except
         End;
      End;
   End
   Else
   Begin
      DMCXP.cdsMovCxP.CancelUpdates;
   End;

   ssql := 'SELECT * FROM TGE102';
   DMCXP.cdsCLAux1.DataRequest(ssql);

   dblcCia.Enabled := True;
   edtProv.Enabled := False;
   lblActivo.Visible := False;
   lblAcepta.Visible := False;
   lblAnula.Visible := False;
   lblContab.Visible := False;
   lblEliminado.Visible := false;
   pnlRegistro.Visible := false;
   DMCXP.cdsDetCxP.IndexFieldNames := '';
  //
   DMCXP.cdsCCosto.Filter := '';
   DMCXP.cdsCCosto.Filtered := False;
   DMCXP.cdsCCosto.IndexFieldNames := '';
   DMCXP.cdsCCosto.Close;

   DMCXP.cdsCnpEgr.Filter := '';
   DMCXP.cdsCnpEgr.Filtered := false;
   DMCXP.cdsCnpEgr.IndexFieldNames := '';
   DMCXP.cdsCnpEgr.Close;

   DMCXP.cdsQry2.Filter := '';
   DMCXP.cdsQry2.Filtered := false;
   DMCXP.cdsQry2.IndexFieldNames := '';
   DMCXP.cdsQry2.Close;

   DMCXP.cdsQry3.Filter := '';
   DMCXP.cdsQry3.Filtered := false;
   DMCXP.cdsQry3.IndexFieldNames := '';
   DMCXP.cdsQry3.Close;

   DMCXP.cdsQry5.Filter := '';
   DMCXP.cdsQry5.Filtered := false;
   DMCXP.cdsQry5.IndexFieldNames := '';
   DMCXP.cdsQry5.Close;

   DMCXP.cdsQry6.Filter := '';
   DMCXP.cdsQry6.Filtered := false;
   DMCXP.cdsQry6.IndexFieldNames := '';
   DMCXP.cdsQry6.Close;

   DMCXP.cdsSQL.Filter := '';
   DMCXP.cdsSQL.Filtered := false;
   DMCXP.cdsSQL.IndexFieldNames := '';
   DMCXP.cdsSQL.Close;

   DMCXP.cdsCxP.Filter := '';
   DMCXP.cdsCxP.Filtered := false;
   DMCXP.cdsCxP.IndexFieldNames := '';
   DMCXP.cdsCxP.Close;

   DMCXP.cdsMovCxP2.Filter := '';
   DMCXP.cdsMovCxP2.Filtered := false;
   DMCXP.cdsMovCxP2.IndexFieldNames := '';
   DMCXP.cdsMovCxP2.close;

   DMCXP.cdsDetCanje.Filter := '';
   DMCXP.cdsDetCanje.Filtered := false;
   DMCXP.cdsDetCanje.IndexFieldNames := '';
   DMCXP.cdsDetCanje.close;

   FVariables.w_OP_Registro := False;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;

   FPrincipal.GProvision.RefreshFilter;
   Action := caFree;
End;

Function TFProvision.Consistencia: Boolean;
Begin
 // consistencia Código de Compañía
   If length(dblcCia.Text) = 0 Then
      Raise exception.Create('Falta Código de Compañía');
   If length(edtCia.Text) = 0 Then
      Raise exception.Create('Código de Compañía Errado');

 // consistencia Código de Proveedor
   If length(dblcdProv.Text) = 0 Then
      Raise exception.Create('Faltan Datos del Proveedor');
   If length(edtProv.Text) = 0 Then
      Raise exception.Create('Código/RUC de Proveedor Errado');

 // consistencia ingreso de tipo de documento
   If length(dblcTDoc.Text) = 0 Then
      Raise exception.Create('Falta Tipo de Documento');
   If length(lblTDoc.Caption) = 0 Then
      Raise exception.Create('Tipo de Documento Errado');

 // consistencia No.Doc
   If length(edtNoDoc.Text) = 0 Then
      Raise exception.Create('Falta No. de Documento');

 // consistencia ingreso de Tipo de Diario
   If length(dblcTDiario.Text) = 0 Then
      Raise exception.Create('Falta Tipo de Diario');
   If length(edtTDiario.Text) = 0 Then
      Raise exception.Create('Tipo de Diario Errado');

 // consistencia Periodo
   If length(meAnoMM.Text) < 6 Then
      Raise exception.Create('Periodo Errado (AAAAMM)');

 // consistencia ingreso de No.Registro
   If length(meNoReg.Text) = 0 Then
      Raise exception.Create('Falta No.Registro');

 // consistencia ingreso de Fecha de Documento
   If dtpFEmis.Date = 0 Then
      Raise exception.Create('Falta Fecha de Documento');

 // consistencia ingreso de Fecha de Vencimiento
   If dtpFVcmto.Date = 0 Then
      Raise exception.Create('Falta Fecha de Vencimiento');

 // consistencia ingreso de Tipo de Moneda
   If length(dblcTMon.Text) = 0 Then
      Raise exception.Create('Falta Tipo de Moneda');
   If length(edtTMon.Text) = 0 Then
      Raise exception.Create('Tipo de Moneda Errado');

 // consistencia ingreso de Fecha de Comprobante
   If dtpFComp.Date = 0 Then
      Raise exception.Create('Falta Fecha de Comprobante');

 // consistencia ingreso de Tipo de Cambio
   If dbeTCambio.Text = '' Then
      Raise exception.Create('Falta Tipo de Cambio');
   If strtofloat(dbeTCambio.Text) = 0 Then
      Raise exception.Create('Falta Tipo de Cambio');

 // Fecha de Recepción
   If dtpFRecep.date = 0 Then
      Raise exception.Create('Falta Fecha de Recepción');

 // consistencia ingreso de Lote
   If length(dbeLote.Text) = 0 Then
      Raise exception.Create('Falta No.Lote');

   If DMCXP.wVRN_OrdenCompra = 'S' Then
   Begin
      If length(dblcdOCompra.Text) = 0 Then
         Raise exception.Create('Falta Orden de Compra');
   End;

// Inicio HPC_201604_CXP
// 16/08/2016  DAF_2016001170 Inicializa variables que Valida que Serie tenga longitud fija si así lo requiere
   If xReqLongSerFija then
   Begin
      If length(edtSerie.Text)<>xLongSerFija then
      Begin
         edtSerie.SetFocus;
         Raise exception.Create('Longitud de la Serie debe ser de '+inttostr(xLongSerFija)+' caracteres');
      End;
   End;
// Fin HPC_201604_CXP

   Result := True;
End;

Procedure TFProvision.bbtnOKClick(Sender: TObject);
Var
   xFiltro, xSQL: String;
Begin
   If Not Consistencia Then Exit;

   sCalcSaldos := 'S';

// buscar en Proveedores Notificados por SUNAT
   ProveedoresNotificados;

   ProveedoresNoHabidos_NoHallados;

   xGlosaRep := '';

   If xControlFec(dblcCia.Text, dtpFComp.Date) = False Then
   Begin
      Exit;
   End;

// Impuestos
   dblcImpuesto.Text := DMCXP.cdsTipReg2.FieldByName('TREGID').AsString;
   edtImpuesto.Text := DMCXP.cdsTipReg2.FieldByname('TREGDES').AsString;

   DMCXP.cdsMovCxP.Edit;
   DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString := dblcClAux.Text;
   DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString := 'N';
   If Length(edtSerie.Text) = 0 Then
   Begin
      DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString := ' ';
      edtSerie.Text := ' ';
   End;
   If chkInter.Checked Then
      DMCXP.cdsMovCxP.fieldbyname('CPFLAGTDOC').AsString := 'I';

   If DMCXP.BuscaFecha('TGE114', 'FECANO', 'FECHA', dtpFComp.date) Then
   Begin
      DMCXP.cdsMovCxP.fieldbyname('CPAAAA').AsString := DMCXP.cdsUltTGE.fieldbyname('FECANO').AsString; // ano
      DMCXP.cdsMovCxP.fieldbyname('CPMM').AsString := DMCXP.cdsUltTGE.fieldbyname('FECMES').AsString; // mes
      DMCXP.cdsMovCxP.fieldbyname('CPDD').AsString := DMCXP.cdsUltTGE.fieldbyname('FECDIA').AsString; // día
      DMCXP.cdsMovCxP.fieldbyname('CPTRI').AsString := DMCXP.cdsUltTGE.fieldbyname('FECTRIM').AsString; // trimestre
      DMCXP.cdsMovCxP.fieldbyname('CPSEM').AsString := DMCXP.cdsUltTGE.fieldbyname('FECSEM').AsString; // semestre
      DMCXP.cdsMovCxP.fieldbyname('CPSS').AsString := DMCXP.cdsUltTGE.fieldbyname('FECSS').AsString; // semana
      DMCXP.cdsMovCxP.fieldbyname('CPAATRI').AsString := DMCXP.cdsUltTGE.fieldbyname('FECAATRI').AsString; // año+trimestre
      DMCXP.cdsMovCxP.fieldbyname('CPAASEM').AsString := DMCXP.cdsUltTGE.fieldbyname('FECAASEM').AsString; // año+semestre
      DMCXP.cdsMovCxP.fieldbyname('CPAASS').AsString := DMCXP.cdsUltTGE.fieldbyname('FECAASS').AsString; // año+semana
   End;

   DMCXP.cdsMovCxP.fieldbyname('CPUSER').AsString := DMCXP.wUsuario; // usuario que registra
   DMCXP.cdsMovCxP.fieldbyname('CPFREG').AsDateTime := Date;         // fecha que registra Usuario
   DMCXP.cdsMovCxP.fieldbyname('CPHREG').AsDateTime := Time;         // Hora de Registro de Usuario
   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   If xorigen = 'CxP130' Then
   Begin
     If length(FListaOrdenPago.xdbeDetracOP) <> 0 Then//jesus
     Begin
       dbeDetrac.Text := FListaOrdenPago.xdbeDetracOP;
       DMCXP.cdsMovCxP.fieldbyname('DTRPORC').AsFloat := StrToFloat(dbeDetrac.Text);
//       cbSujetoaRetIGV.Checked := false;
     End
     Else
     Begin
       dbeDetrac.Text := '0';
       DMCXP.cdsMovCxP.fieldbyname('DTRPORC').AsFloat := StrToFloat(dbeDetrac.Text);
//       cbSujetoaRetIGV.Checked := true;
     End;
   End;
   // Fin HPC_201702_CXP
   If DMCXP.wModo = 'M' Then
      xDTRPorc := DMCXP.cdsMovCxP.fieldbyname('DTRPORC').AsFloat;
   DMCXP.cdsMovCxP.Post;
   DMCXP.DCOM1.AppServer.IniciaTransaccion;
   xSQL := ' Update CXP301 '
         + '    set TMONID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString)+','
         + '        CPTCAMPR = ' + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat)+','
         + '        CPTCAMAJ = ' + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat)+','
         + '        CPTCAMDOL = ' + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPTCAMDOL').AsFloat)+','
         + '        CLAUXID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString)+','
         + '        CP_CONTA = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString)+','
         + '        CPSERIE = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString)+','
         + '        CPFLAGTDOC = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPFLAGTDOC').AsString)+','
         + '        CPAAAA = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPAAAA').AsString)+','
         + '        CPMM = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPMM').AsString)+','
         + '        CPDD = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPDD').AsString)+','
         + '        CPTRI = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPTRI').AsString)+','
         + '        CPSEM = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPSEM').AsString)+','
         + '        CPSS = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPSS').AsString)+','
         + '        CPAATRI = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPAATRI').AsString)+','
         + '        CPAASEM = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPAASEM').AsString)+','
         + '        CPAASS = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPAASS').AsString)+','
         + '        CPUSER = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPUSER').AsString)+','
         + '        CPFREG = trunc(sysdate), '
         + '        CPHREG = sysdate, '
         + '        CPFRECEP = '+quotedstr(datetostr(DMCXP.cdsMovCxP.fieldbyname('CPFRECEP').AsDateTime))+','
         + '        CPFEMIS = '+quotedstr(datetostr(DMCXP.cdsMovCxP.FieldByname('CPFEMIS').AsDateTime))+','
         + '        CPFVCMTO = '+quotedstr(datetostr(DMCXP.cdsMovCxP.FieldByname('CPFVCMTO').AsDateTime))+','
         + '        DCPLOTE = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('DCPLOTE').AsString)+','
         + '        CPOCOMP = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPOCOMP').AsString)+','
         + '        CLAUXREND = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CLAUXREND').AsString)+','
         + '        AUXIDREND = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('AUXIDREND').AsString)+','
// Inicio HPC_201704_CXP
         + '        DTRPORC = ' + floattostr(DMCXP.cdsMovCxP.fieldbyname('DTRPORC').AsFloat)+','
// Seguros-Automatización de Devengue de Seguros
         + '        CPTOID = ' + quotedstr(xdblcConcepto)+','
         + '        CPTODES = ' + quotedstr(xdbeConcepto)+','
         + '        NROPOL = ' + quotedstr(xdbePoliza)+','
         + '        FECINIVIG = TO_DATE(' + quotedstr(xdtpFIVigencia)+',''dd/MM/yyyy''),'
         + '        FECFINVIG = TO_DATE(' + quotedstr(xdtpFFVigencia)+',''dd/MM/yyyy'')'
// Fin HPC_201704_CXP
         + '  Where CIAID=' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
         + '    and TDIARID=' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString)
         + '    and CPANOMES=' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
         + '    and CPNOREG=' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString);

   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se puede grabar la cabecera de la Provisión');
      exit;
   End;

   If Not xRegresa Then
   Begin
      xFiltro := 'CIAID=' + '''' + dblcCia.Text + '''' + ' and ' +
                 'TDIARID=' + '''' + dblcTdiario.Text + '''' + ' and ' +
                 'DCPANOMM=' + '''' + meAnoMM.Text + '''' + ' and ' +
                 'CPNOREG=' + '''' + meNoReg.Text + '''';
      Filtracds(DMCXP.cdsDetCxP, 'Select * from CXP302 Where ' + xFiltro);

      xFiltro := 'CIAID=' + '''' + dblcCia.Text + ''''
               + ' and PROV=' + '''' + dblcdProv.Text + ''''
               + ' and DOCID<>' + '''' + dblcTDoc.Text + ''''
               + ' and (CPESTADO=''P'' or CPESTADO=''C'' ) ';
      DMCXP.cdsMovCxP2.close;
      DMCXP.cdsMovCxP2.dataRequest('SELECT * FROM CXP301 WHERE ' + xFiltro);
      DMCXP.cdsMovCxP2.Open;

      xFiltro := 'CIAID=' + '''' + dblcCia.Text + '''' + ' and ' +
         'CPANOMES=' + '''' + meAnoMM.Text + '''' + ' and ' +
         'TDIARID2=' + '''' + dblcTdiario.Text + '''' + ' and ' +
         'CPNOREG2=' + '''' + meNoReg.Text + '''' + ' and ' +
         'TCANJEID=' + '''' + 'FC' + '''';
      Filtracds(DMCXP.cdsCanje, 'Select * from CXP304 Where ' + xFiltro);

      xFiltro := 'CIAID=' + '''' + dblcCia.Text + '''' + ' and '
               + 'TCANJEID=' + '''' + 'PR' + '''' + ' and '
               + 'DOCID2=' + '''' + dblcTDoc.Text + '''' + ' and '
               + 'CPSERIE2=' + '''' + edtSerie.Text + '''' + ' and '
               + 'CPNODOC2=' + '''' + edtNoDoc.Text + '''';
      Filtracds(DMCXP.cdsDetCanje, 'Select * from CXP305 Where ' + xFiltro);

   End;

   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.Eof Do
   Begin
      DMCXP.cdsDetCxP.Edit;
      DMCXP.cdsDetCxP.fieldbyname('TMONID').AsString := DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString;

      If DMCXP.cdsDetCxP.fieldbyname('CPTCAMPR').AsFloat <> DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat Then
         DMCXP.cdsDetCxP.fieldbyname('CPTCAMPR').AsFloat := DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat;

      If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc Then
      Begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat / DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 2);
      End
      Else
      Begin
         If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonExt Then
         Begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat * DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         End
         Else
         Begin // Otras Monedas Extranjeras
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat * DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 15, 2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat / DMCXP.cdsMovCxP.fieldbyname('CPTCAMDOL').AsFloat, 15, 2)
         End;
      End;

      xSQL := ' Update CXP302 '
            + '    SET TMONID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('TMONID').AsString)+','
            + '        CPTCAMPR = '+floattostr(DMCXP.cdsDetCxP.fieldbyname('CPTCAMPR').AsFloat)+', '
            + '        DCPMOLOC = '+floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOLOC').AsFloat)+', '
            + '        DCPMOEXT = '+floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOEXT').AsFloat)+', '
            + '        DCPFREG = trunc(sysdate), '
            + '        DCPHREG = sysdate '
            + '  Where CIAID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)
            + '    and TDIARID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('TDIARID').AsString)
            + '    and DCPANOMM = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPANOMM').AsString)
            + '    and DCPREG = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPREG').AsString)
            + '    and CPNOREG = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPNOREG').AsString);
      Try
          DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
          DMCXP.DCOM1.AppServer.RetornaTransaccion;
          ShowMessage('No se puede grabar el detalle de la Provisión');
          exit;
      End;
      DMCXP.cdsDetCxP.Next;
   End;

   DMCXP.DCOM1.AppServer.GrabaTransaccion;

   DMCXP.cdsDetCxP.IndexFieldNames := 'DCPREG';

   DMCXP.cdsDetCxP.First;

   EstadoDeForma(1, DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString, DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString);

   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   If xorigen = 'CxP201' Then
   Begin
   If DMCXP.cdsDetCxP.RecordCount <= 0 Then btnActReg.OnClick(Self);
   End;
   // Fin HPC_201702_CXP
   xTemTReg := '';
   xTemCpto := '';
   xTemCta := '';
   xTemDH := '';
   Btn_OrdenPago.Enabled := False;

   cbRepGlosa.Checked := False;
   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   xorigen := 'CxP201';
   // Fin HPC_201702_CXP
End;

Procedure TFProvision.bbtnCancelaClick(Sender: TObject);
Begin
   If DMCXP.wAdmin = 'G' Then Exit;

   DMCXP.cdsDetCxP.CancelUpdates;
   EstadoDeForma(0, DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString, DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString);
   Z2bbtnPreview.Enabled := False;
End;

Procedure TFProvision.Z2bbtnGrabaClick(Sender: TObject);
Var
   xTGravad: double; // 'MG' Base Imponible Gravada (va al DEBE)
   xTGravad2: double; // 'NG' Base Imponible Mixta (va al DEBE)
   xTNoGrav: double; // 'MN' Base Imponible No Gravada (va al DEBE)
   xTIGV: double; // 'I1' IGV Base Imponible Gravada (va al DEBE)
   xTIGV2: double; // 'I3' IGV Base Imponible Mixta (va al DEBE)
   xTIGV3: double; // 'I2' IGV Base Imponible No Gravada (va al DEBE)
   xTANoGrav: double; // 'AN' Adquisiciones No Gravadas
   xTISC: double; // 'I5' ISC (va al DEBE)
   xTDcto: double; // 'DC' Descuento (va al HABER)
   xTOtros: double; // '0T' Otros (va al DEBE)
   xTotal: double; // 'TO' Total de la Cuenta por Pagar

// Inicio HPC_201604_CXP
// 17/10/2016  Lleva Saldo de la Provisión al valor del Registro Tipo 'TO' del Detalle
   xSalTotal : Currency;
// Fin HPC_201604_CXP

   xTGravadL, xTGravad2L, xTNoGravL, xTIGVL, xTIGV2L, xTIGV3L, xTANoGravL,
      xTISCL, xTDctoL, xTOtrosL: double;

//para almacenar Montos Temporales en Soles de MG,MG2,MN,ISC,SERV e IGV cuando la moneda es en dolares
   xTemGravadL, xTemGravad2L, xTemNoGravL, xTemIGVL, xTemIGV2L, xTemIGV3L, xTemANoGravL,
      xTemISCL, xTemDctoL, xTemOtrosL: double;

//bbolean x Tipo de Detalle para soles
   xbGravadL, xbGravad2L, xbNoGravL,
      xbIGVL, xbIGV2L, xbIGV3L,
      xbANoGravL, xbISCL, xbDctoL, xbOtrosL: boolean;

   xTDebe, xTHaber, xTotMaxSer: double;
   xSumExt, xSumLocAcu: double;

   xWhere, xCtaTotal, xCptoTot: String;
   xSql, cExisteRegistroDetraccion, cDocumentos: String;
   xValidaDetraccion: String;
Begin
   If DMCXP.wAdmin = 'G' Then Exit;

   If Not DMCXP.Accesos_a_Registros(DMCXP.cdsMovCxP.fieldbyname('CPUSER').AsString) Then
      Exit;

// determina si provisión no ha sido registrada en otro comprobante
   xSQL := 'select * from CXP301 '
         + ' Where CLAUXID=' + quotedstr(dblcClAux.Text)
         + '   and PROV=' + quotedstr(dblcdProv.Text)
         + '   and DOCID=' + quotedstr(dblcTDoc.Text)
         + '   and CPSERIE=' + quotedstr(edtSerie.Text)
         + '   and CPNODOC=' + quotedstr(edtNoDoc.Text)
         + '   and CPESTADO<>' + quotedstr('E');
   DMCXP.cdsQry.Filter := '';
   DMCXP.cdsQry.Filtered := True;
   DMCXP.cdsQry.IndexFieldNames := '';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount > 0 Then
   Begin
      If DMCXP.cdsQry.RecordCount > 1 Then
      Begin
         ShowMessage('Documento ya fue registrado con otros Números de Registros, revise');
         exit;
      End;
      If (DMCXP.cdsQry.FieldByName('CIAID').AsString <> dblcCia.Text) Or
         (DMCXP.cdsQry.FieldByName('CPNOREG').AsString <> meNoReg.Text) Or
         (DMCXP.cdsQry.FieldByName('CPANOMES').AsString <> meAnoMM.Text) Then
      Begin
         ShowMessage('Documento ya fue registrado en otro Momento');
         exit;
      End;
   End;

// se inicializa variables declaradas
   xTGravad := 0;
   xTGravad2 := 0;
   xTNoGrav := 0;
   xTIGV := 0;
   xTIGV2 := 0;
   xTIGV3 := 0;
   xTISC := 0;
   xTDcto := 0;
   xTOtros := 0;
   xTotal := 0;
   xTANoGrav := 0;

   xTGravadL := 0;
   xTGravad2L := 0;
   xTNoGravL := 0;
   xTIGVL := 0;
   xTIGV2L := 0;
   xTIGV3L := 0;
   xTANoGravL := 0;
   xTISCL := 0;
   xTDctoL := 0;
   xTOtrosL := 0;
   xTotalL := 0;

//bbolean x Tipo de Detalle para soles
   xbGravadL := false;
   xbGravad2L := false;
   xbNoGravL := false;
   xbIGVL := false;
   xbIGV2L := false;
   xbIGV3L := false;
   xbANoGravL := false;
   xbISCL := false;
   xbDctoL := false;
   xbOtrosL := false;

// Variables para ajuste del campo en soles cuando la provision es en dolares
   xTemGravadL := 0;
   xTemGravad2L := 0;
   xTemNoGravL := 0;
   xTemIGVL := 0;
   xTemIGV2L := 0;
   xTemIGV3L := 0;
   xTemANoGravL := 0;
   xTemISCL := 0;
   xTemDctoL := 0;
   xTemOtrosL := 0;

   If DMCXP.cdsDetCxP.RecordCount = 0 Then
      Raise exception.create('No hay un Detalle especificado');

// Comprueba que registros estén correctamente ingresados
   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.Eof Do
   Begin
   // consistencia Tipo de Registro
      If length(DMCXP.cdsDetCxP.FieldByName('TREGID').AsString) = 0 Then
         Raise exception.Create('Falta especificar el Tipo de Registro');
   // consistencia Concepto
      If length(DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString) = 0 Then
      Begin
         dblcTipRegExit(self); // toma las propiedades del registro
         DMCXP.cdsDetCxP.EnableControls;
         Raise exception.Create('Falta especificar el Concepto');
      End;
   // consistencia Debe Haber
      If length(DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString) = 0 Then
      Begin
         dblcTipRegExit(self); // toma las propiedades del TIPO DE registro
         DMCXP.cdsDetCxP.EnableControls;
         Raise exception.Create('Falta especificar si es Debe/Haber');
      End;
   // consistencia Centro de Costo
      DMCXP.cdsDetCxP.Next;
   End;

// calcula sumatorias del detalle
   DMCXP.cdsDetCxP.First;
   xTDebe := 0;
   xTHaber := 0;
   cExisteRegistroDetraccion := 'N';
   While Not DMCXP.cdsDetCxP.eof Do
   Begin
      If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString <> 'TO') Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xTDebe := xTDebe + FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat, 15, 2);
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'H' Then
            xTHaber := xTHaber + FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat, 15, 2);
      End;

   // Si existe Registro con Detalle de Detracción (I4)
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I4' Then
      Begin
         cExisteRegistroDetraccion := 'S';
      End;

   // Base Imponible Renta 2da Categoría
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'BI' Then
      Begin
         xTGravad := xTGravad + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         xTGravadL := xTGravadL + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
      End;

   // Base Imponible Gravada
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MG' Then
      Begin
         xTGravad := xTGravad + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         xTGravadL := xTGravadL + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
      End;

   // Base Imponible Mixta
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'NG' Then
      Begin
         xTGravad2 := xTGravad2 + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         xTGravad2L := xTGravad2L + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
      End;

   // Base Imponible No Gravado
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MN' Then
      Begin
         xTNoGrav := xTNoGrav + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         xTNoGravL := xTNoGravL + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
      End;

   // IGV Base Imponible Gravada (de MG)
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I1' Then
      Begin
         xTIGV := xTIGV + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xTIGVL := xTIGVL + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
         Else
         // si el documento es Nota de Crédito o Adelanto
            If DMCXP.DisplayDescrip2('dspTGE', 'TGE110', 'DOCID,DOCTIPREG', 'DOCID=' + quotedstr(dblcTDoc.text), 'DOCTIPREG') = 'NC' Then
               xTIGVL := xTIGVL + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
            Else
               xTIGVL := xTIGVL - DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'SC' Then
      Begin
         xTIGV := xTIGV + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xTIGVL := xTIGVL + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
         Else
         // si el documento es Nota de Crédito o Adelanto
            If DMCXP.DisplayDescrip2('dspTGE', 'TGE110', 'DOCID,DOCTIPREG', 'DOCID=' + quotedstr(dblcTDoc.text), 'DOCTIPREG') = 'NC' Then
               xTIGVL := xTIGVL + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
            Else
               xTIGVL := xTIGVL - DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
      End;

   // IGV (de I3) IGV Mixta
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I3' Then
      Begin
         xTIGV2 := xTIGV2 + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xTIGV2L := xTIGV2L + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
         Else
         // si el documento es Nota de Crédito o Adelanto
            If DMCXP.DisplayDescrip2('dspTGE', 'TGE110', 'DOCID,DOCTIPREG', 'DOCID=' + quotedstr(dblcTDoc.text), 'DOCTIPREG') = 'NC' Then
               xTIGV2L := xTIGV2L + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
            Else
               xTIGV2L := xTIGV2L - DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
      End;

   // IGV (de I2) IGV Base Imponible No Gravada
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I2' Then
      Begin
         xTIGV3 := xTIGV3 + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xTIGV3L := xTIGV3L + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
         Else
         // si el documento es Nota de Crédito o Adelanto
            If DMCXP.DisplayDescrip2('dspTGE', 'TGE110', 'DOCID,DOCTIPREG', 'DOCID=' + quotedstr(dblcTDoc.text), 'DOCTIPREG') = 'NC' Then
               xTIGV3L := xTIGV3L + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
            Else
               xTIGV3L := xTIGV3L - DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
      End;

   // ISC (I5)..
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I5' Then
      Begin
         xTISC := xTISC + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xTISCL := xTISCL + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
         Else
         // si el documento es Nota de Crédito o Adelanto
            If DMCXP.DisplayDescrip2('dspTGE', 'TGE110', 'DOCID,DOCTIPREG', 'DOCID=' + quotedstr(dblcTDoc.text), 'DOCTIPREG') = 'NC' Then
               xTISCL := xTISCL + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
            Else
               xTISCL := xTISCL - DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
      End;

   // Descuento
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'DC' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
         Begin
            xTDctoL := xTDctoL + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
            xTDcto := xTDcto + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         End
         Else
         Begin
         // si el documento es Nota de Crédito o Adelanto
            If DMCXP.DisplayDescrip2('dspTGE', 'TGE110', 'DOCID,DOCTIPREG', 'DOCID=' + quotedstr(dblcTDoc.text), 'DOCTIPREG') = 'NC' Then
            Begin
               xTDctoL := xTDctoL + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
               xTDcto := xTDcto + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
            End
            Else
            Begin
               xTDctoL := xTDctoL - DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
               xTDcto := xTDcto - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
            End;
         End;
      End;

   // Adquisiciones No Gravadas
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'AN' Then
      Begin
         xTANoGrav := xTANoGrav + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xTANoGravL := xTANoGravL + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
         Else
         // si el documento es Nota de Crédito o Adelanto
            If DMCXP.DisplayDescrip2('dspTGE', 'TGE110', 'DOCID,DOCTIPREG', 'DOCID=' + quotedstr(dblcTDoc.text), 'DOCTIPREG') = 'NC' Then
               xTANoGravL := xTANoGravL + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
            Else
               xTANoGravL := xTANoGravL - DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
      End;

   // Otros
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'OT' Then
      Begin
         xTOtros := xTOtros + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xTOtrosL := xTOtrosL + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
         Else
         // si el documento es Nota de Crédito o Adelanto
            If DMCXP.DisplayDescrip2('dspTGE', 'TGE110', 'DOCID,DOCTIPREG', 'DOCID=' + quotedstr(dblcTDoc.text), 'DOCTIPREG') = 'NC' Then
               xTOtrosL := xTOtrosL + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
            Else
               xTOtrosL := xTOtrosL - DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
      End;

     // Si se Modifica algunos campos de Cabecera
      DMCXP.cdsDetCxP.Edit;

      If DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime <> DMCXP.cdsMovCxP.FieldByName('CPFCMPRB').AsDateTime Then // F. Recepción
         DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime := DMCXP.cdsMovCxP.FieldByName('CPFCMPRB').AsDateTime;

      If DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime <> DMCXP.cdsMovCxP.FieldByName('CPFEMIS').AsDateTime Then // F. Recepción
         DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime := DMCXP.cdsMovCxP.FieldByName('CPFEMIS').AsDateTime;

      If DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime <> DMCXP.cdsMovCxP.FieldByName('CPFVCMTO').AsDateTime Then // F. Recepción
         DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime := DMCXP.cdsMovCxP.FieldByName('CPFVCMTO').AsDateTime;

      If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString <> DMCXP.cdsMovCxP.FieldByName('TMONID').AsString Then // T. Moneda
         DMCXP.cdsDetCxP.FieldByName('TMONID').AsString := DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;

      If DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat <> DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat Then // T. Cambio
         DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat;

      If DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString <> DMCXP.cdsMovCxP.FieldByName('DCPLOTE').AsString Then // Lote
         DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString := DMCXP.cdsMovCxP.FieldByName('DCPLOTE').AsString;

     // Fin de si se Modifica algunos campos de Cabecera

      DMCXP.cdsDetCxP.Next;
   End;

   If dblcTdiario.Text = '08' Then
   Begin
      xValidaDetraccion := ValidaDetraccion(DMCXP.cdsDetCxP);
      If length(xValidaDetraccion) > 0 Then
      Begin
         If MessageDlg(xValidaDetraccion + chr(13) + ' ¿Desea continuar? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;
      End;
   End;

// Calcula Total
   Begin
      xTemGravadL := FRound(xTGravad * FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2);
      If xTemGravadL <> xTGravadL Then
         xbGravadL := True;

      xTemGravad2L := FRound(xTGravad2 * FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2);
      If xTemGravad2L <> xTGravad2L Then
         xbGravad2L := true;

      xTemNoGravL := FRound(xTNoGrav * FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2);
      If xTemNoGravL <> xTNoGravL Then
         xbNoGravL := true;

      If xTIGVL >= 0 Then
         xTemIGVL := FRound(xTIGV * FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2)
      Else
         xTemIGVL := FRound(xTIGV * FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat * (-1), 12, 3), 15, 2);
      If xTemIGVL <> xTIGVL Then
         xbIGVL := True;

      If xTIGV2L >= 0 Then
         xTemIGV2L := FRound(xTIGV2 * FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2)
      Else
         xTemIGV2L := FRound(xTIGV2 * FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat * (-1), 12, 3), 15, 2);
      If xTemIGV2L <> xTIGV2L Then
         xbIGV2L := true;

      If xTIGV3L >= 0 Then
         xTemIGV3L := FRound(xTIGV3 * FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2)
      Else
         xTemIGV3L := FRound(xTIGV3 * FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat * (-1), 12, 3), 15, 2);
      If xTemIGV3L <> xTIGV3L Then
         xbIGV3L := true;

      xTemANoGravL := FRound(xTANoGrav * FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2);
      If xTemANoGravL <> xTANoGravL Then
         xbANoGravL := true;

      If xTISCL >= 0 Then
         xTemISCL := FRound(xTISC * FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2)
      Else
         xTemISCL := FRound(xTISC * FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat * (-1), 12, 3), 15, 2);
      If xTemISCL <> xTISCL Then
         xbISCL := true;

      xTemDctoL := FRound(xTDcto * FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2);
      If xTemDctoL <> xTDctoL Then
         xbDctoL := true;

      xTemOtrosL := FRound(xTOtros * FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2);
      If xTemOtrosL <> xTOtrosL Then
         xbOtrosL := true;

   End;

   xTotal := 0;
   xToTalL := 0;

   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.eof Do
   Begin
      If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'TO') Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xTDebe := xTDebe + FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat, 15, 2);
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'H' Then
            xTHaber := xTHaber + FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat, 15, 2);

         If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString <> DMCXP.wTMonLoc Then
         Begin
            xTotalL := xTemGravadL + xTemGravad2L + xTemNoGravL
               + xTemIGVL + xTemIGV2L + xTemIGV3L + xTemANoGravL
               + xTemISCL + xTemOtrosL + xTemDctoL; //Para moneda Local

            If xToTalL > 0 Then
            Begin
               DMCXP.cdsDetCxP.Edit;
               DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := xTotalL;
              ///////////////////////////////////////////////////////////////////////////////
              // por tratarse de la Detraccion
               If xDtrPorc > 0 Then
                  DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat :=
                     FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
                     * DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 15, 2);
              ///////////////////////////////////////////////////////////////////////////////

               DMCXP.cdsDetCxP.Post;
            End
         End;
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'H' Then
            xTotal := xTotal + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
         // si el documento es Nota de Crédito o Adelanto
            If DMCXP.DisplayDescrip2('dspTGE', 'TGE110', 'DOCID,DOCTIPREG', 'DOCID=' + quotedstr(dblcTDoc.text), 'DOCTIPREG') = 'NC' Then
               xTotal := xTotal + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
            Else
               xTotal := xTotal - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;

         xCtaTotal := DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString;
         xCptoTot := DMCXP.cdsDetCxp.FieldByName('CPTOID').AsString;
      // Inicio HPC_201604_CXP
      // 17/10/2016  Lleva Saldo de la Provisión al valor del Registro Tipo 'TO' del Detalle
         xSalTotal := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      // Fin HPC_201604_CXP
      End;

     //////para ajustar los montos en soles por tipo de detalle(MG,MN) cuando la provision es en dolares
      If dblcTMon.text = DMCXP.wTmonExt Then
      Begin
         If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'BI') And (xbGravadL) Then
         Begin // Monto Gravado/Base Imponible/Monto Afecto
           //xTGravad
            DMCXP.cdsDetCxP.Edit;
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat + Fround(xTemGravadL - xTGravadL, 15, 2);
            DMCXP.cdsDetCxP.Post;
            xbGravadL := false;
         End;

         If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MG') And (xbGravadL) Then
         Begin // Monto Gravado/Base Imponible/Monto Afecto
           //xTGravad
            DMCXP.cdsDetCxP.Edit;
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat + Fround(xTemGravadL - xTGravadL, 15, 2);
            DMCXP.cdsDetCxP.Post;
            xbGravadL := false;
         End;

         If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'NG') And (xbGravad2L) Then
         Begin // Monto Gravado 2/Base Imponible 2/Monto No Afecto a IGV
           //xTGravad2
            DMCXP.cdsDetCxP.Edit;
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat + Fround(xTemGravad2L - xTGravad2L, 15, 2);
            DMCXP.cdsDetCxP.Post;
            xbGravad2L := false;
         End;

         If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MN') And (xbNoGravL) Then
         Begin // Monto No Gravado
           //xTNoGrav
            DMCXP.cdsDetCxP.Edit;
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat + Fround(xTemNoGravL - xTNoGravL, 15, 2);
            DMCXP.cdsDetCxP.Post;
            xbNoGravL := false;
         End;

         If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I1') And (xbIGVL) Then
         Begin // IGV
           //xTIGV:=
            DMCXP.cdsDetCxP.Edit;
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat + Fround(xTemIGVL - xTIGVL, 15, 2);
            DMCXP.cdsDetCxP.Post;
            xbIGVL := false;
         End;

         If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I3') And (xbIGV2L) Then
         Begin // IGV2
            //xTIGV2:=
            DMCXP.cdsDetCxP.Edit;
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat + Fround(xTemIGV2L - xTIGV2L, 15, 2);
            DMCXP.cdsDetCxP.Post;
            xbIGV2L := false;
         End;

         If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I2') And (xbIGV3L) Then
         Begin // IGV3
            //xTIGV2:=
            DMCXP.cdsDetCxP.Edit;
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat + Fround(xTemIGV3L - xTIGV3L, 15, 2);
            DMCXP.cdsDetCxP.Post;
            xbIGV3L := false;
         End;

         If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'AN') And (xbANoGravL) Then
         Begin // Adquisiciones No Gravadas
            DMCXP.cdsDetCxP.Edit;
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat + Fround(xTemANoGravL - xTANoGrav, 15, 2);
            DMCXP.cdsDetCxP.Post;
            xbANoGravL := false;
         End;

         If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I5') And (xbISCL) Then
         Begin // ISC
           //xTISC:=
            DMCXP.cdsDetCxP.Edit;
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat + Fround(xTemISCL - xTISCL, 15, 2);
            DMCXP.cdsDetCxP.Post;
            xbISCL := false;
         End;

         If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'DC') And (xbDctoL) Then
         Begin // Descuento
           //xTDcto:=
            DMCXP.cdsDetCxP.Edit;
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat + Fround(xTemDctoL - xTDctoL, 15, 2);
            DMCXP.cdsDetCxP.Post;
            xbDctoL := false;
         End;

         If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'OT') And (xbOtrosL) Then
         Begin // Otros
            DMCXP.cdsDetCxP.Edit;
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat + Fround(xTemOtrosL - xTOtrosL, 15, 2);
            DMCXP.cdsDetCxP.Post;
            xbOtrosL := false;
         End;
      End;

      DMCXP.cdsDetCxP.Next;
   End;

   //Valida el total de la orden de pago con la provisión
   If ValidaTotalOrdPago(xOrdenPago, xnItemOP, xTHaber) = False Then
   Begin
      If MessageDlg('El total del documento es:' + FloatToStr(xTHaber) + ', ' + #13 +
                  'y es distinto al de la Orden de Pago que es: ' + FloatToStr(xTotalOrdenPago) + #13 +
                  '¿Desea continuar de todas maneras?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Begin
         Exit;
      End;
   End;
   DMCXP.cdsDetCxP.EnableControls;
   If (FRound(xTDebe, 15, 2) - FRound(xTHaber, 15, 2)) > 0 Then
   Begin
      If MessageDlg('No hay coincidencia entre Debe y Haber' + chr(13)
         + '      ¿Continuar con Grabación?       ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Begin
         dbgDetCxp.SelectedIndex := 0;
         exit;
      End;
   End;

// graba sumatorias del detalle en cabecera CxP
   If DMCXP.wVRN_OrdenCompra = 'S' Then
   Begin
      If FRound(xTHaber, 15, 2) > FRound(xImpAmort, 15, 2) Then
      Begin
         If MessageDlg('Monto de Factura es Mayor que la Orden de Compra' + chr(13)
            + '      ¿Continuar con Grabación?       ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Begin
            dbgDetCxp.SelectedIndex := 0;
            exit;
         End;
      End;
   End
   Else
   Begin
      If dblcdOCompra.Text <> '' Then
      Begin
         If FRound(xTHaber, 15, 2) > FRound(xImpAmort, 15, 2) Then
         Begin
            If MessageDlg('Monto de Factura es Mayor que la Orden de Compra' + chr(13)
               + '      ¿Continuar con Grabación?       ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
            Begin
               dbgDetCxp.SelectedIndex := 0;
               exit;
            End;
         End;
      End;
   End;

   Items;

  ////////////////////////////////////////////////////////////////////////
  /// Por ser un Concepto afecto a Detracción
   If xDtrPorc > 0 Then
   Begin
      // Inicio HPC_201702_CXP
      // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
      //xTotal := xTotal + xImpDtr;
      // Fin HPC_201702_CXP
      If cExisteRegistroDetraccion = 'S' Then
      Begin
         cbSujetoaRetIGV.visible := False;
         cbSujetoaRetIGV.Checked := False;
      End;
   End;
  ///////////////////////////////////////////////////////////////////////

  // Limite permitido por SUNAT para registrar recibos por honorarios S/.2589
   //If (dblcClAux.text = 'H') And (dblcTDoc.text = '02') Then
   If dblcTDoc.text = '02' Then
   Begin
      xSQL := 'select TASAID, TASACAN, TASAMTO from TGE108 a WHERE TASAFLG=''4''';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      xTotMaxSer := DMCXP.cdsQry.FieldByName('TASAMTO').Asfloat;

   // Inicio HPC_201701_CXP
   // Considera Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00
      {
      xSQL := 'select NVL(SUM( CASE WHEN TMONID=''N'' '
            + '                     THEN NVL(CPGRAVAD,0)+NVL(CPNOGRAV,0) '
            + '                     ELSE (NVL(CPGRAVAD,0)+NVL(CPNOGRAV,0))*CPTCAMPR END ),0) TOTSER '
            + '  from CXP301 '
            + ' Where CLAUXID=' + quotedstr(dblcClAux.Text)
            + '   and PROV=' + quotedstr(dblcdProv.Text)
            + '   and CPANOMES=' + quotedstr(meAnoMM.Text)
            + '   and CPESTADO IN (''P'',''C'')';
      }
      xSQL := 'select NVL(SUM(CASE WHEN TMONID=''N'' '
            + '       THEN NVL(CPGRAVAD,0)+NVL(CPNOGRAV,0)+NVL(CPGRAVAD2,0)+nvl(ADQ_NO_GRAV,0) '
            + '       ELSE (NVL(CPGRAVAD,0)+NVL(CPNOGRAV,0)+NVL(CPGRAVAD2,0)+nvl(ADQ_NO_GRAV,0))*CPTCAMPR END),0) TOTSER '
            + '  from CXP301 '
            + ' Where CLAUXID=' + quotedstr(dblcClAux.Text)
            + '   and PROV=' + quotedstr(dblcdProv.Text)
            + '   and CPANOMES=' + quotedstr(meAnoMM.Text)
      //      + '   and ( CPESTADO IN (''P'',''C'') or '
            + '   and (CPESTADO IN (''I'') AND DOCID=' + quotedstr(dblcTDoc.text)
            + '                            AND CPSERIE=' + quotedstr(edtSerie.text)
            + '                            AND CPNODOC=' + quotedstr(edtNoDoc.text)
            + '        )';
   // Fin HPC_201701_CXP
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      If (DMCXP.cdsQry.FieldByName('TOTSER').AsFloat + xTGravadL + xTGravad2L + xTNoGravL > xTotMaxSer)
         And (xTIGV + xTIGV2 <= 0) Then
      Begin
         xSQL := 'select DOCID||''   ''||CPSERIE||''  -  ''||CPNODOC DOCUM, '
               + '       CASE WHEN TMONID=''N'' THEN NVL(CPGRAVAD,0)+NVL(CPNOGRAV,0) '
               + '            ELSE (NVL(CPGRAVAD,0)+NVL(CPNOGRAV,0))*CPTCAMPR END TOTAL '
               + '  from CXP301 '
               + ' Where CLAUXID=' + quotedstr(dblcClAux.Text)
               + '   and PROV=' + quotedstr(dblcdProv.Text)
               + '   and CPANOMES=' + quotedstr(meAnoMM.Text)
               + '   and CPESTADO IN (''P'',''C'', ''I'')';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;
         cDocumentos := '';
         While Not DMCXP.cdsQry.Eof Do
         Begin
            cDocumentos := cDocumentos + DMCXP.cdsQry.FieldByName('DOCUM').AsString + '   S/.' + DMCXP.cdsQry.FieldByName('TOTAL').AsString + chr(13);
            DMCXP.cdsQry.Next;
         End;

         ShowMessage('El proveedor ' + dblcClAux.text + ' - ' + dblcdProv.text + ' - ' + edtProv.Text + ',' + chr(13) +
            'supera el monto limite permitido por SUNAT de S/.' + FloatToStr(xTotMaxSer) + '.' + chr(13) +
            chr(13) + cDocumentos);

      // Revisar en maestro de proveedores si tiene exoneración de retención
         xSQL := 'select PROVEXONER '
            + 'from TGE201 '
            + 'Where CLAUXID=' + quotedstr(dblcClAux.Text)
            + '  and PROV=' + quotedstr(dblcdProv.Text);
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;

         If DMCXP.cdsQry.FieldByname('PROVEXONER').AsString <> '' Then
         Begin
            ShowMessage('El proveedor ' + dblcClAux.text + ' - ' + dblcdProv.text + ' - ' + edtProv.Text + ',' + chr(13) +
               'Tiene Formulario de Exoneración No.' + trim(DMCXP.cdsQry.FieldByname('PROVEXONER').AsString) + '.' + chr(13) +
               'verificar...');
         End;
      End;

   // Inicio HPC_201701_CXP
   // 23/01/2017 Considera Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00
      If xValorMinRta4ta>0 then
      Begin
         If DMCXP.cdsQry.FieldByName('TOTSER').AsFloat>xValorMinRta4ta then
         Begin
            If not validaSusp4ta(dblcClAux.Text, dblcdProv.Text) then
            Begin
               ShowMessage('El Proveedor no tiene Suspensión de 4ta.Categoría, regularize por el Maestro de Proveedores');
            End;
         End;
      End;
   // Fin HPC_201701_CXP
   End;

   If (cbSujetoaRetIGV.visible) And (Not cbSujetoaRetIGV.Checked) Then
   Begin
      If (xTGravad > xTasaMonto) Then
         ShowMessage('La Provisión debería estar sujeta a Retención del I.G.V.');
   End;

   DMCXP.DCOM1.AppServer.IniciaTransaccion;

// Inicio HPC_201604_CXP
// 17/10/2016  Lleva Saldo de la Provisión al valor del Registro Tipo 'TO' del Detalle
   xSQL:=' UPDATE CXP301 '
        +'    SET PROVDES =''' + edtProv.Text + ''', CPGRAVAD = ' + floattostr(xTGravad) + ' , '
        +'        CPGRAVAD2 = ' + floattostr(xTGravad2) + ' , CPIGV = ' + floattostr(xTIGV) + ', '
        +'        CPIGV2 = ' + floattostr(xTIGV2) + ', '
        +'        CPDCTO = ' + floattostr(xTDcto)+ ' , CPNOGRAV = ' + floattostr(xTNoGrav)+ ', '
        +'        CPMTOORI = ' + floattostr(xTotal)+ ', CP_OTROS = ' + floattostr(xTOtros)+ ' , '
        +'        IGV_GRA_NO_DEST = ' + floattostr(xTIGV3)+ ', ADQ_NO_GRAV = ' + floattostr(xTANoGrav)+ ', '
//        +'        CPISC = ' + floattostr(xTISC)+ ' , CPSALORI = ' + floattostr(xTotal)+ ', '
        +'        CPISC = ' + floattostr(xTISC)+ ' , CPSALORI = ' + floattostr(xSalTotal)+ ', ';

   If cExisteRegistroDetraccion = 'S' Then
      xSQL:=xSQL + ' DTRPORC = '+ floattostr(xDTRPorc)+', '
   Else
      xSQL:=xSQL + ' DTRPORC = 0, ';
   If (DMCXP.cdsMovCxP.fieldbyname('FLAGVAR').AsString = '') Or (DMCXP.cdsMovCxP.fieldbyname('FLAGVAR').IsNull) Then
      xSQL:=xSQL + ' FLAGVAR =''.'',' ;
   If cbSujetoaRetIGV.Checked Then
      xSQL:=xSQL + ' PROVRETIGV =''S'', '
   else
      xSQL:=xSQL + ' PROVRETIGV =''N'', ';
   If DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString = DMCXP.wTMonLoc Then
   Begin
      xSQL:=xSQL + ' CPMTOLOC=' + floattostr(xTotal)+ ', '
                 + ' CPMTOEXT ='+ floattostr(FRound(xTotal/ FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2))+', '
            //     + ' CPSALLOC='+floattostr(xTotal)+', '
            //     + ' CPSALEXT='+ floattostr(FRound((xTotal/ FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3)), 15, 2)) +',' ;
                 + ' CPSALLOC='+floattostr(xSalTotal)+', '
                 + ' CPSALEXT='+ floattostr(FRound((xSalTotal/ FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3)), 15, 2)) +',' ;
   end
   Else
   Begin
      If DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString = DMCXP.wTMonExt Then
      Begin
          xSQL:=xSQL + ' CPMTOLOC=' + floattostr(xTotalL)+ ', '
                     + ' CPMTOEXT ='+ floattostr(xTotal)+', '
                //     + ' CPSALLOC='+floattostr(xTotalL)+', CPSALEXT='+ floattostr(xTotal) +',';
                     + ' CPSALLOC='+floattostr(FRound((xSalTotal*FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3)), 15, 2))+','
                     + ' CPSALEXT='+ floattostr(xSalTotal) +',';
      end
      else // para cuando no es dólares ni soles
      begin
          xSQL:=xSQL + ' CPMTOLOC=' + floattostr(FRound(xTotalL, 15, 2)) + ', '
                     + ' CPMTOEXT ='+ floattostr(FRound(DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat / DMCXP.cdsMovCxP.fieldbyname('CPTCAMDOL').AsFloat, 15, 2)) +', '
                  //   + ' CPSALLOC='+floattostr(DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat)+','
                  //   + ' CPSALEXT='+ floattostr(DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat) +',';
                     + ' CPSALLOC='+floattostr(xSalTotal)+', '
                     + ' CPSALEXT='+ floattostr(FRound((xSalTotal/ FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3)), 15, 2)) +',' ;
      end;
   end;
// Fin HPC_201604_CXP

   If sCalcSaldos = 'S' Then
   Begin
      xSQL := xSQL + ' CTATOTAL= ''' + xCtaTotal + ''', '
                   + ' CPTOTOT = '''+xCptoTot+''' , '
                   + ' CPESTADO =''I'', '
                   + ' CPUSER ='''+DMCXP.wUsuario+''', '
                   + ' CPFREG = trunc(sysdate), CPHREG=sysdate ';
   end
   else
   begin
      xSQL := xSQL + ' CTATOTAL= ''' + xCtaTotal + ''' , '
                   + ' CPTOTOT = '''+xCptoTot+''' , CPPAGORI =0, CPPAGLOC =0 , '
                   + ' CPPAGEXT=0 ';
   end;

   xSQL :=xSQL + ' WHERE CIAID ='''+DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString+''' '
               + '   AND CPANOMES ='''+DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString+''' '
               + '   AND TDIARID ='''+DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString+''' '
               + '   AND CPNOREG ='''+DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString+''' '
               + '   AND CLAUXID ='''+DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString+''' '
               + '   AND PROV ='''+DMCXP.cdsMovCxP.fieldbyname('PROV').AsString+''' '
               + '   AND DOCID ='''+DMCXP.cdsMovCxP.fieldbyname('DOCID').AsString+''' '
               + '   AND CPSERIE ='''+DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString+''' '
               + '   AND CPNODOC ='''+DMCXP.cdsMovCxP.fieldbyname('CPNODOC').AsString+''' ' ;
   try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
      ShowMessage('No se ha podido actualizar los totales en la cabecera');
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      exit;
   end;

   xSQL := 'Select * '
         + '  from CXP301 '
         + ' Where CIAID = ' + quotedstr(dblcCia.Text)
         + '   and CPANOMES = ' + quotedstr(meAnoMM.Text)
         + '   and TDIARID = ' + quotedstr(dblcTdiario.Text)
         + '   and CPNOREG = ' + quotedstr(meNoReg.Text);
   DMCXP.cdsMovCxP.Close;
   DMCXP.cdsMovCxP.DataRequest(xSQL);
   DMCXP.cdsMovCxP.Open;
     xSQL := 'delete from CXP302 '
           + ' where CIAID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)
           + '   and TDIARID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('TDIARID').AsString)
           + '   and DCPANOMM = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPANOMM').AsString)
           + '   and CPNOREG = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPNOREG').AsString);
     DMCXP.cdsQry.Close;
     DMCXP.cdsQry.DataRequest(xSQL);
     Try
        DMCXP.cdsQry.Execute;
     Except
     End;

     DMCXP.cdsDetCxP.First ;
     While Not DMCXP.cdsDetCxP.Eof Do
     Begin
         xSQL := ' Insert into CXP302(CIAID, TDIARID, CPNOREG, DCPANOC, DCPANOMM, DCPLOTE, TRANSID, CPTOID, CUENTAID, '
               + '                    CLAUXID, DCPAUXID, DOCID, CPSERIE, CPNODOC, DCPGLOSA, DCPDH, CCOSID, '
               + '                    CPTCAMPR, DCPMOORI, DCPMOLOC, DCPMOEXT, CPFEMIS, CPFVCMTO, DCPFCOM, DCPESTDO, '
               + '                    DCPUSER, DCPFREG, DCPHREG, DCPMM, DCPDD, DCPTRI, DCPSEM, DCPSS, DCPAATRI, '
               + '                    DCPAASEM, DCPAASS, TREGID, TMONID, TIPDET, DCPREG) '
               + ' Values( ' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('TDIARID').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPNOREG').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPANOC').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPANOMM').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPLOTE').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('TRANSID').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPTOID').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('CUENTAID').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('CLAUXID').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPAUXID').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DOCID').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPSERIE').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPNODOC').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPGLOSA').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+', '
               +               floattostr(DMCXP.cdsDetCxP.fieldbyname('CPTCAMPR').AsFloat)+', '
               +               floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat)+', '
               +               floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOLOC').AsFloat)+', '
               +               floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOEXT').AsFloat)+', '
               +               quotedstr(datetostr(DMCXP.cdsDetCxP.fieldbyname('CPFEMIS').AsDateTime))+', '
               +               quotedstr(datetostr(DMCXP.cdsDetCxP.fieldbyname('CPFVCMTO').AsDateTime))+', '
               +               quotedstr(datetostr(DMCXP.cdsDetCxP.fieldbyname('DCPFCOM').AsDateTime))+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPESTDO').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPUSER').AsString)+', '
               + '             trunc(sysdate), '
               + '             sysdate, '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPMM').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPDD').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPTRI').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPSEM').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPSS').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPAATRI').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPAASEM').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPAASS').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('TREGID').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('TMONID').AsString)+', '
               +               quotedstr(DMCXP.cdsDetCxP.fieldbyname('TIPDET').AsString)+', '
               +               inttostr(DMCXP.cdsDetCxP.fieldbyname('DCPREG').AsInteger)+')';
         try
             DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         except

         end;
         DMCXP.cdsDetCxP.Next;
     End;

   DMCXP.DCOM1.AppServer.GrabaTransaccion;

   xWhere := 'Select * from CXP302 '
           + ' Where CIAID = ' + quotedstr(dblcCia.Text)
           + '   and DCPANOMM = ' + quotedstr(meAnoMM.Text)
           + '   and TDIARID = ' + quotedstr(dblcTdiario.Text)
           + '   and CPNOREG = ' + quotedstr(meNoReg.Text);
   DMCXP.cdsDetCxP.Close;
   DMCXP.cdsDetCxP.DataRequest(xWhere);
   DMCXP.cdsDetCxP.Open;

   if DMCXP.cdsDetCanje.Active then
   begin
      if DMCXP.cdsDetCanje.ApplyUpdates(0)>0 then
      begin
         ShowMessage('No se pudo actualizar el detalle Canje de la provisión - 1');
         exit;
      end;
   end;

   If DMCXP.wTipoAdicion = 'xFiltro' Then
   Begin
      DMCXP.ActualizaFiltro(FPrincipal.GProvision, DMCXP.cdsMovCxP, DMCXP.wModo);
   End;

   xFlagGr := False;

   EstadoDeForma(1, DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString, DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString);

   Z2bbtnPreview.Enabled := True;
   Z2bbtnNuevo.Enabled := True;

   If sCalcSaldos = 'S' Then
   Begin
      ShowMessage(' Registro de Provisión Grabado ');
   End;

   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   //ActualizaOrdenPago('GRABAR');
   ActualizaOrdenPago('ACEPTAR');
   xorigen := 'CxP201';
   // Fin HPC_201702_CXP
End;

Procedure TFProvision.dblcdCCostoExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then exit;
   If bbtnRegCanc.Focused Then exit;

   xWhere := 'CCOSID=''' + dblcdCCosto.Text + ''' and CCOSMOV=''S'' AND CCOSACT=''S'' '
      + ' and CCOSCIAS LIKE (' + quotedstr('%' + dblcCia.Text + '%') + ' )';
   edtCCosto.Text := BuscaQry('dspTGE', 'TGE203', 'CCOSDES', xWhere, 'CCOSDES');

   If length(edtCCosto.Text) = 0 Then
   Begin
      edtCCosto.Text := '';
      ShowMessage('Centro de Costo NO esta Activo');
      dblcdCCosto.setfocus;
      Exit;
   End;
End;

Procedure TFProvision.dblcTipRegExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea = true Then exit;

   //Inicio HPC_201705_CXP
   //Se modifico la condicional del If para que no se ejecute el bloque if cuando se ejecuta la rutina importar detalles
   //If Not bbtnRegCanc.Focused Then  --antes
   If Not bbtnRegCanc.Focused and Not bbtnImportDetalles.Focused Then
   //Fin HPC_201705_CXP
   Begin
      edtTipReg.Text := DMCXP.DisplayDescrip('TGE113', 'TREGDES', 'TRegID', dblcTipReg.Text);
      If length(edtTipReg.Text) = 0 Then
      Begin
         ShowMessage('Debe Ingresar el Tipo de Registro');
         dblcTipReg.SetFocus;
         exit;
      End;
      wTasa := 0;
      wTasa := FRound((DMCXP.cdsULTTGE.FieldByName('TASA').AsFloat / 100), 7, 4);
      If (dtpFEmis.date <= StrToDate('28/02/2011')) And
         ((DMCXP.cdsULTTGE.FieldByName('TREGID').AsString = '03') Or
         (DMCXP.cdsULTTGE.FieldByName('TREGID').AsString = '04') Or
         (DMCXP.cdsULTTGE.FieldByName('TREGID').AsString = '09')) Then
         wTasa := 0.19;
      If xNuevoDet Then
      Begin
         DMCXP.cdsDetCxP.Edit;
         DMCXP.cdsDetCxP.FieldByName('CIAID').AsString := DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString;
         DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString := DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString := DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString := copy(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString, 1, 4);
         DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString := DMCXP.cdsMovCxP.fieldbyname('DCPLOTE').AsString;
         DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString := 'CP';
         DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString := dblcClAux.Text;
         DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsMovCxP.fieldbyname('PROV').AsString;
         DMCXP.cdsDetCxP.FieldByName('DOCID').AsString := DMCXP.cdsMovCxP.fieldbyname('DOCID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString := DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString := DMCXP.cdsMovCxP.fieldbyname('CPNODOC').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat := FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 7, 3);
         DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFEMIS').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFVCMTO').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFCMPRB').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('TREGID').AsString := dblcTipReg.Text;
         DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'I'; // Activo
         DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString := DMCXP.wUsuario;
         DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFREG').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPHREG').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPMM').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString := DMCXP.cdsMovCxP.fieldbyname('CPDD').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString := DMCXP.cdsMovCxP.fieldbyname('CPTRI').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPSEM').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString := DMCXP.cdsMovCxP.fieldbyname('CPSS').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString := DMCXP.cdsMovCxP.fieldbyname('CPAATRI').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPAASEM').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString := DMCXP.cdsMovCxP.fieldbyname('CPAASS').AsString;
         DMCXP.cdsDetCxP.FieldByName('TMONID').AsString := DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString;
         xWhere := 'TRegId=' + '''' + dblcTipReg.Text + '''';
         DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString := BuscaQry('PrvTGE', 'TGE113', '*', xWhere, 'TIPDET');
         DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString := DMCXP.cdsQry.fieldbyname('DCPDH').AsString;
      End
      Else
      Begin
         DMCXP.cdsDetCxP.edit;
      End;

      If xNuevoDet Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc Then
         Begin
            If Length(DMCXP.cdsQry.fieldbyname('CPTOMN').AsString) > 0 Then
            Begin
               DMCXP.cdsDetCxP.Edit;
               DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString := DMCXP.cdsQry.fieldbyname('CPTOMN').AsString;
               DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := DMCXP.cdsQry.fieldbyname('CUENTAMN').AsString;
            End;
         End
         Else
         Begin
            If Length(DMCXP.cdsQry.fieldbyname('CPTOME').AsString) > 0 Then
            Begin
               DMCXP.cdsDetCxP.Edit;
               DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString := DMCXP.cdsQry.fieldbyname('CPTOME').AsString;
               DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := DMCXP.cdsQry.fieldbyname('CUENTAME').AsString;
            End;
         End;
      End;
      dblcdCnpEgr.Enabled := True;
      DMCXP.cdsCnpEgr.IndexFieldNames := 'CPTOID';

      If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '10' Then
      Begin
         dblcImpuesto.Text := '';
      End;

      If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '01' Then
      Begin
         dblcImpuesto.Text := '03';
         If dblcTDiario.Text = '19' Then dblcImpuesto.Text := '12'; // 4ta categoría
      End;

      If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '02' Then
      Begin
         dblcImpuesto.Text := '04';
      End;

      If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '06' Then
      Begin
         dblcImpuesto.Text := '09';
         xCpto06 := DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString;
         xCta06 := DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '15' Then
      Begin
         dblcImpuesto.Text := '14';
      End;

      If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '21' Then
      Begin
         dblcImpuesto.Text := '20';
      End;

      dblcImpuesto.Enabled := False;
      edtImpuesto.Text := DMCXP.DisplayDescrip('TGE113', 'TREGDES', 'TREGID', dblcImpuesto.Text);
   End; // si no se apretó botón de cancelar
End;

Procedure TFProvision.meNoRegExit(Sender: TObject);
Var
   i: Integer;
   xWhere, xxNoReg: String;
   xSQL : String;
Begin
   for i:= 1 to Length(meNoReg.Text) do
   if not(Upcase(meNoReg.Text[i]) in [#8,'0'..'9']) then
   begin
     ShowMessage('Nro. de Registro generado incorrectamente, reintente generarlo nuevamente');
     dtpFComp.SetFocus;
     exit;
   end;

   If xCrea Then Exit;

   If (Not (bbtnBorra.Focused)) And (Not (dtpFComp.Focused)) Then
   Begin
      If length(meNoReg.Text) = 0 Then
      Begin
         dtpFComp.SetFocus;
         Raise Exception.Create('Falta No.Registro');
      End;

      If Length(edtNoDoc.Text) = 0 Then
      Begin
         edtSerie.SetFocus;
         Raise Exception.Create('Falta No.Documento');
      End;

      meNoReg.Text := Strzero(meNoReg.Text, DMCXP.cdsMovCxP.fieldbyname('CPNOREG').Size);

      If DMCXP.BuscaCxPReg(dblcCia.Text, dblcTDiario.Text, meAnoMM.Text, meNoReg.Text) Then
      Begin
         ShowMessage('No.de Registro Duplicado');
         If (length(edtTDiario.Text) > 0) And (length(meAnoMM.Text) = 6) Then
         Begin
            xTAutoNum := DMCXP.DisplayDescrip('TGE104', 'AUTONUM', 'TDIARID', dblcTDiario.Text);
            meNoReg.Text := DMCXP.UltimoRegistroCXP(xTAutoNum, dblcCia.Text, dblcTDiario.Text, xTAno, xTMes);
            meNoReg.Text := Strzero(meNoReg.Text, DMCXP.cdsMovCxP.fieldbyname('CPNOREG').Size);
         End;
         dtpFComp.SetFocus;
         Exit;
      End
      Else
      Begin

         meNoReg.Text := DMCXP.GrabaUltimoRegistro(xTAutoNum, dblcCia.Text, dblcTDiario.Text, xTAno, xTMes, StrToInt(meNoReg.Text));
         xxNoReg := Strzero(meNoReg.Text, DMCXP.cdsMovCxP.fieldbyname('CPNOREG').Size);

         xWhere := 'CIAID=' + '''' + dblcCia.Text + '''' + ' and TDIARID=' + '''' + dblcTDiario.Text + '''' + ' and CPANOMES=' + '''' + meAnoMM.Text + '''';
         dbeLote.Text := DMCXP.BuscaUltTGE('PrvUltCxP', 'CXP301', 'DCPLOTE', xWhere);
         dbeLote.Text := Strzero(DMCXP.cdsMovCxP.fieldbyname('DCPLOTE').AsString, DMCXP.cdsMovCxP.fieldbyname('DCPLOTE').Size);

         DMCXP.cdsMovCxP.Edit;
         DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString := meAnoMM.Text;
         DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString := xxNoReg;
         meNoReg.Text := xxNoReg;
         DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString := 'T';
         DMCXP.cdsMovCxP.fieldbyname('DCPLOTE').AsString := Strzero(dbeLote.Text, DMCXP.cdsMovCxP.Fieldbyname('DCPLOTE').Size);
         DMCXP.cdsMovCxP.fieldbyname('CPUSER').AsString := DMCXP.wUsuario;
         DMCXP.cdsMovCxP.fieldbyname('CPFRECEP').AsDateTime := Date;
         DMCXP.cdsMovCxP.fieldbyname('CPFREG').AsDateTime := Date;
         DMCXP.cdsMovCxP.fieldbyname('CPHREG').AsDateTime := Time;
         DMCXP.cdsMovCxP.post;

         xSQL := ' Insert into CXP301( CIAID, CPANOMES, TDIARID, CPNOREG, CLAUXID, PROV, PROVRUC, DOCID, CPSERIE, '
               + '                     CPNODOC,CPFRECEP,CPFEMIS,CPFVCMTO,CPESTADO,CPUSER,CPFREG,CPHREG,CPFCMPRB,DCPLOTE ) '
               + ' Values( '+quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)+', '
               +             quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)+', '
               +             quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString)+', '
               +             quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString)+', '
               +             quotedstr(DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString)+', '
               +             quotedstr(DMCXP.cdsMovCxP.fieldbyname('PROV').AsString)+', '
               +             quotedstr(DMCXP.cdsMovCxP.fieldbyname('PROVRUC').AsString)+', '
               +             quotedstr(DMCXP.cdsMovCxP.fieldbyname('DOCID').AsString)+', '
               +             quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString) + ', '
               +             quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNODOC').AsString)+', '
               +             quotedstr(datetostr(DMCXP.cdsMovCxP.fieldbyname('CPFRECEP').AsDateTime))+', '
               +             quotedstr(datetostr(DMCXP.cdsMovCxP.fieldbyname('CPFEMIS').AsDateTime))+', '
               +             quotedstr(datetostr(DMCXP.cdsMovCxP.fieldbyname('CPFVCMTO').AsDateTime))+', '
               +             quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString)+', '
               +             quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPUSER').AsString)+', '
               + '           trunc(sysdate),  '
               + '           sysdate, '
               +             quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPFCMPRB').AsString)+', '
               +             quotedstr(DMCXP.cdsMovCxP.fieldbyname('DCPLOTE').AsString)+' )';
            Try
               DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('No se pudo actualizar la cabecera de la provisión, intente con otro número de Registro - 3889');
               dtpFComp.SetFocus;
               exit;
            End;
            DMCXP.cdsMovCxP.Edit;
            DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString := meNoReg.Text;
            DMCXP.cdsMovCxP.Post;

         EstadoDeForma(0, DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString, DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString);
         xFlagGr := True;

         If (wDocRetIGV) And (dtpFEmis.Date >= xTasaFec) Then
         Begin
            lblRetIGV.Visible := True;
            lblRetIGV.Font.Color := clRed;
            cbSujetoaRetIGV.Visible := True;
         End
         Else
         Begin
            lblRetIGV.Visible := False;
            cbSujetoaRetIGV.Visible := False;
         End;
         dtpFComp.Enabled := False;
      End;
   End;

End;

Procedure TFProvision.dblcdProvRucExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If dblcClAux.Focused Then Exit;
   If bbtnBorra.Focused Then Exit;
   If dblcdProv.Focused Then Exit;
   If Length(dblcClAux.Text) = 0 Then
   Begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Falta Ingresar Clase de Auxiliar');
   End;
   If (Length(dblcdProv.Text) > 0) And (Length(dblcdProvRuc.Text) = 0) Then Exit;

   xEsDomiciliado := 'S';

   If Not xNuevoProv Then
   Begin
      If Length(dblcdProv.Text) + length(dblcdProvRuc.Text) > 0 Then
      Begin
         xWhere := 'PROVRUC=''' + dblcdProvRuc.Text + ''' and NVL(ACTIVO,''N'')=''S''';
         edtProv.Text := BuscaQry('dspTGE', 'TGE201', 'PROV,PROVRUC,PROVDES,ESDOMIC', xWhere, 'PROVDES');
         If length(dblcdProvRuc.Text) > 0 Then
         Begin
            If dblcdProvRuc.Text = DMCXP.cdsQry.FieldByName('PROVRUC').AsString Then
            Begin
               DMCXP.cdsMovCxP.FieldByName('PROV').AsString := DMCXP.cdsQry.FieldByName('PROV').AsString;
               xEsDomiciliado := DMCXP.cdsQry.FieldByName('ESDOMIC').AsString;
               dblcTDoc.SetFocus;
            End
            Else
            Begin
               dblcdProv.Text := '';
               edtProv.Text := '';
               If MessageDlg('RUC de Proveedor NO Registrado' + chr(13) + ' ¿agregar como Nuevo? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
               Begin
                  dblcdProv.Text := dblcdProvRuc.Text;
                  edtProv.Enabled := true;
                  dblcClAux.Enabled := False;
                  dblcdProv.SetFocus;
                  xNuevoProv := true;
                  dblcdProv.AutoDropDown := false;
               End
               Else
               Begin
                  edtProv.Text := '';
                  dblcdProvRuc.SetFocus;
               End;
            End;
         End
         Else
         Begin
            edtProv.Text := '';
            dblcdProv.SetFocus;
         End;
      End
      Else
      Begin
         edtProv.Text := '';
         dblcdProv.SetFocus;
      End;
   End
   Else
   Begin
      xWhere := 'PROVRUC=''' + dblcdProvRuc.Text + ''' and NVL(ACTIVO,''N'')=''S''';
      edtProv.Text := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV, ACTIVO', xWhere, 'PROVDES');
      If length(dblcdProvRuc.Text) > 0 Then
      Begin
         If DMCXP.cdsQry.FieldByName('ACTIVO').AsString = 'S' Then
         Begin
            If dblcdProvRuc.Text = DMCXP.cdsQry.FieldByName('PROVRUC').AsString Then
            Begin

               wProvRetIGV := False;
               If wCiaRetIGV Then
               Begin
                  If DMCXP.cdsQry.FieldByName('PROVRETIGV').AsString <> 'N' Then wProvRetIGV := True;
               End;

               DMCXP.cdsMovCxP.FieldByName('PROV').AsString := DMCXP.cdsQry.FieldByName('PROV').AsString;
               dblcTDoc.SetFocus;
               exit;
            End
            Else
            Begin
               ShowMessage('RUC de Proveedor tiene Error');
               dblcdProvRuc.SetFocus;
            End;
         End
         Else
         Begin
            ShowMessage('Proveedor NO se encuentra Activo');
            dblcdProv.SetFocus;
         End;
      End
      Else
         edtProv.SetFocus;
   End;

   // buscar en Proveedores Notificados por SUNAT
   ProveedoresNotificados;
   ProveedoresNoHabidos_NoHallados;
End;

Procedure TFProvision.edtProvExit(Sender: TObject);
Var
   xWhere, xExiste, xPROVRETIGV, xPROVABR: String;
Begin
   If xCrea Then Exit;
   If dblcClAux.Focused Then Exit;
   If dblcdProv.Focused Then Exit;
   If dblcdProvRuc.Focused Then Exit;

   If xNuevoProv Then
   Begin

      If Length(edtProv.Text) = 0 Then
      Begin
         edtProv.SetFocus;
         Raise Exception.Create('Falta Razón Social')
      End;

      xWhere := 'CLAUXID=''' + dblcClAux.Text + ''' and PROV=''' + dblcdProv.Text + ''' ';
      xExiste := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV', xWhere, 'PROVDES');
      If DMCXP.cdsQry.FieldByName('PROVDES').AsString <> '' Then
      Begin
         ShowMessage('Error : Codigo de Proveedor Existe');
         dblcdProv.SetFocus;
         Exit;
      End;

      xWhere := 'PROVRUC=''' + dblcdProvRuc.Text + ''' ';
      xExiste := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV', xWhere, 'PROVDES');
      If DMCXP.cdsQry.FieldByName('PROVDES').AsString <> '' Then
      Begin
         ShowMessage('Error : Codigo de R.U.C. Existe');
         dblcdProvRuc.SetFocus;
         Exit;
      End;

      If MessageDlg('Código : ' + '''' + dblcdProv.Text + '''' + chr(13) +
         'RUC    : ' + '''' + dblcdProvRuc.Text + '''' + chr(13) +
         'Razón  : ' + '''' + edtProv.Text + '''' + chr(13) +
         'Cl.Aux.: ' + '''' + dblcClAux.Text + '''' + chr(13) +
         '¿Datos Conformes? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
        If length(edtProv.Text) > DMCXP.cdsProv.FieldByName('PROVABR').DisplayWidth Then
            xPROVABR := copy(edtProv.Text, 1, DMCXP.cdsProv.FieldByName('PROVABR').DisplayWidth)
         Else
         Begin
            xPROVABR := edtProv.Text;
         End;

         xSQL := 'Select RUC from CXP203 where RUC=' + quotedstr(dblcdProvRuc.Text);
         DMCXP.cdsQry2.Close;

         DMCXP.cdsQry2.Filter := '';
         DMCXP.cdsQry2.IndexFieldNames := '';
         DMCXP.cdsQry2.DataRequest(xSQL);
         DMCXP.cdsQry2.Open;
         If DMCXP.cdsQry2.RecordCount > 0 Then
            xPROVRETIGV := 'N'
         Else
            xPROVRETIGV := 'S';
         DMCXP.cdsQry2.Close;
         DMCXP.cdsQry2.Filter := '';
         DMCXP.cdsQry2.IndexFieldNames := '';

         xSQL:=' INSERT INTO TGE201 (PROV, PROVRUC, PROVDES, CLAUXID, ACTIVO, PROVABR, PROVRETIGV)'+
               ' VALUES ('''+dblcdProv.Text+''','''+dblcdProvRuc.Text+''','''+edtProv.Text+''','''+dblcClAux.Text+''',''S'','''+ xPROVABR+ ''' ,''' + xPROVRETIGV +''') ';

         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

         xSQL := 'Select * from TGE201 where PROV=' + quotedstr(dblcdProv.Text);
         DMCXP.cdsProv.Close;

         DMCXP.cdsProv.DataRequest(xSQL);
         DMCXP.cdsProv.Open;
         DMCXP.GrabaAuxConta(DMCXP.cdsProv);
         xNuevoProv := false;
         edtProv.Enabled := False;
         dblcClAux.Enabled := True;
         dblcTDoc.SetFocus;
      End
      Else
         edtProv.SetFocus;
   End;
End;

Procedure TFProvision.dblcdProvExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If dblcClAux.Focused Then Exit;
   If bbtnBorra.Focused Then Exit;

   If length(dblcClAux.Text) = 0 Then
   Begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Falta Ingresar Clase de Auxiliar');
   End;

   xEsDomiciliado := 'S';

   If Not xNuevoProv Then
   Begin
      If DMCXP.wAnchoProv > 0 Then
      Begin
         If ((Length(dblcdProv.Text) < DMCXP.wAnchoProv) And (Length(dblcdProv.Text) > 0)) Then
         Begin
            dblcdProv.Text := StrZero(dblcdProv.Text, DMCXP.wAnchoProv);
         End;
      End;

      if (length(dblcdProv.Text)=0) and (dblcdProvRuc.Focused) then
          exit;

      if (length(dblcdProvRuc.Text)=0) and (dblcdProv.Focused) then
          exit;

      if (length(dblcdProv.Text)=0) and (length(dblcdProvRuc.Text)=0) then
      Begin
         ShowMessage('Indique un Código o RUC del Proveedor');
         dblcdProv.SetFocus;
         exit;
      End;

      if length(dblcdProv.Text)>0 then
         xWhere := 'CLAUXID='+quotedstr(dblcClAux.Text)
                 + ' and PROV='+quotedstr(dblcdProv.Text)
      else
         xWhere := 'CLAUXID='+quotedstr(dblcClAux.Text)
                 + ' and PROVRUC='+quotedstr(dblcdProvRuc.Text);
      edtProv.Text := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV, ACTIVO, ESDOMIC', xWhere, 'PROVDES');

   // Inicio HPC_201604_CXP
      If False then //length(DMCXP.cdsQry.FieldByName('PROVRUC').AsString)>0 then
      Begin
         if not DMCXP.fg_ValidaNroRUC(DMCXP.cdsQry.FieldByName('PROVRUC').AsString) then
         Begin
            dblcdProv.SetFocus;
            Exit;
         End;
      End;
   // Fin HPC_201604_CXP

      If length(edtProv.Text) > 0 Then
      Begin
         if length(dblcdProv.Text)>0 then
            DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString := DMCXP.cdsQry.FieldByName('PROVRUC').AsString
         else
            DMCXP.cdsMovCxP.FieldByName('PROV').AsString := DMCXP.cdsQry.FieldByName('PROV').AsString;

         If DMCXP.cdsQry.FieldByName('ACTIVO').AsString = 'S' Then
         Begin
            wProvRetIGV := False;
            If wCiaRetIGV Then
            Begin
               If DMCXP.cdsQry.FieldByName('PROVRETIGV').AsString <> 'N' Then wProvRetIGV := True;
            End;
            dblcTDoc.SetFocus;
            xEsDomiciliado := DMCXP.cdsQry.FieldByName('ESDOMIC').AsString;
         End
         Else
         Begin
            ShowMessage('Proveedor NO se encuentra Activo');
            dblcdProv.SetFocus;
            exit;
         End;
      End
      Else // No se encontró RUC o Código de Proveedor
      Begin
         dblcdProvRuc.Text := '';
         edtProv.Text := '';
         If MessageDlg('Código de Proveedor NO Registrado' + chr(13) + ' ¿agregar como Nuevo? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString := dblcdProv.Text;
            edtProv.Enabled := true;
            dblcdProvRuc.SetFocus;
            xNuevoProv := true;
         End
         Else
         Begin
            edtProv.Text := '';
            dblcdProv.SetFocus;
            Exit;
         End;
      End;
   End
   Else
   Begin
      edtProv.SetFocus;
   End;

   // buscar en Proveedores Notificados por SUNAT
   ProveedoresNotificados;

   // buscar en Proveedores No Habidos / No Hallados
   ProveedoresNoHabidos_NoHallados;

   If DMCXP.wVRN_ProvAutoDD = 'S' Then
   Else
   Begin
      dblcdProv.AutoDropDown := False
   End;
   botonOrdenPago(dblcCia.Text, dblcdProv.Text);
End;

Procedure TFProvision.ProveedoresNotificados;
Var
   xWhere, sRes: String;
Begin
   pnlSunat.Visible := False;
   xWhere := 'PROVRUC=''' + DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString + ''' AND ESTADO=''A''';
   sRes := BuscaQry('dspTGE', 'CXP_PRO_NOT_SUN', 'PROVRUC, PROVDES, ESTADO', xWhere, 'ESTADO');
   If sRes = 'A' Then
   Begin
      pnlSunat.Visible := True;
   End;
   
End;

Procedure TFProvision.ProveedoresNoHabidos_NoHallados;
Var
   xWhere, sRes: String;
Begin
   pnlSunat2.Visible := False;
   xWhere := 'PROVRUC=''' + DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString + '''';
   sRes := BuscaQry('dspTGE', 'CXP_PRO_NO_HAB', 'PROVRUC, PROVDES, ESTADO', xWhere, 'ESTADO');
   If sRes <> '' Then
   Begin
      pnlSunat2.Caption := 'Proveedor ' + DMCXP.cdsQry.FieldByName('ESTADO').AsString+' por SUNAT';
      pnlSunat2.Visible := True;
   End;
End;

Procedure TFProvision.dblcdCnpEgrExit(Sender: TObject);
Var
   xsql, xWhere, xxCta: String;
Begin
   If xCrea Then exit;

   If bbtnRegCanc.Focused Then Exit;

   DMCXP.cdsCnpEgr.IndexFieldNames := 'CPTOID';

   DMCXP.cdsCnpEgr.SetKey;
   DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString := dblcdCnpEgr.text;
   If Not DMCXP.cdsCnpEgr.Gotokey Then
   Begin
      DMCXP.cdsDetCxP.edit;
      DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString := '';
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := '';
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := '';
      ShowMessage('Error : Código de Concepto No Existe ');
      dblcdCnpEgr.SetFocus;
      Exit;
   End;

   If DMCXP.cdsCnpEgr.FieldByname('NIVELMOV').AsString <> 'S' Then
   Begin
      DMCXP.cdsDetCxP.edit;
      DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString := '';
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := '';
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := '';
      ShowMessage('Error : Concepto No es de Movimiento');
      dblcdCnpEgr.SetFocus;
      Exit;
   End;

   xxCta := DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString;

  /////////////////////////////////////////////////////////////////////
  // obtiene el Porcentaje de Detraccion de acuerdo al concepto
   If length(DMCXP.cdsCnpEgr.FieldByName('DTRPORC').AsString) > 0 Then
   Begin
     // carga el listbox que contiene los conceptos digitados que son afectos a DETRACCION
      lbDTRCpto.Items.Add(DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString);
      lbDTRPorc.Items.Add(FloatToStrF(xDTRPorc, ffFixed, 15, 4));
      dbeDetrac.Visible := True;
      lblDet.Visible := True;
      DMCXP.cdsMovCxP.edit;
      DMCXP.cdsMovCxP.fieldbyname('DTRPORC').AsFLoat := xDTRPorc;
      DMCXP.cdsMovCxP.Post;
   End;
  //////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////
  // si el Tipo de Documento (TGE110) seleccionado no esta afecto a Detraccion
  // NO se afectara la Provision con la Detraccion
   If xDTRAfecto = 'N' Then
   Begin
      xDTRPorc := 0;
      dbeDetrac.Visible := False;
      lblDet.Visible := False;
      DMCXP.cdsMovCxP.edit;
      DMCXP.cdsMovCxP.fieldbyname('DTRPORC').AsFLoat := 0;
      DMCXP.cdsMovCxP.Post;
   End;
  /////////////////////////////////////////////////////////////////////

   DMCXP.cdsDetCxP.edit;
   DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString;

   If xGlosaRep <> '' Then
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGlosaRep
   Else
   Begin
      If (DMCXP.wSRV_RUTA = '\\INCORESA') Then
         DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := edtProv.Text
      Else
      Begin
         If DMCXP.wVRN_GlosaDup = 'N' Then
            DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := DMCXP.cdsCnpEgr.FieldByName('CPTODES').AsString
         Else
         Begin
            DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := DMCXP.cdsCnpEgr.FieldByName('CPTODES').AsString;
         End;
      End;
   End;
   xGlosa := DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString;

   xMensaje := '';
   If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'TO' Then
   Begin
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := edtProv.Text;
   End;
   //

// (2) si la cuenta contable exite
   xWhere := 'CIAID=' + Quotedstr(dblcCia.text) + ' and CUENTAID=' + quotedstr(DMCXP.cdsCnpEgr.fieldbyname('CUENTAID').AsString);
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
         xCta_Ccos := 'S';
         xWhere := 'CUENTAID=' + quotedstr(DMCXP.cdsQry.fieldbyname('CUENTAID').AsString);
         If DMCXP.cdsCnpEgr.fieldbyname('DTRPORC').AsString = 'S' Then
         Begin
            xSQL := 'select sum(PORCENTAJE) TOTAL from CXP102 where CIAID=' + quotedstr(dblcCia.text)
               + ' and CPTOID=' + quotedstr(dblcdCnpEgr.text);
            DMCXP.cdsQry3.Close;
            DMCXP.cdsQry3.ProviderName := 'dspTGE';
            DMCXP.cdsQry3.DataRequest(xSql);
            DMCXP.cdsQry3.Open;
      //** si suman el 100%
            If DMCXP.cdsQry3.FieldByName('TOTAL').AsFloat = 100 Then
               xMensaje := '1'
            Else
               xMensaje := '2';
         End
         Else
            xMensaje := '2';
      End
      Else
      Begin
         xMensaje := '2';
         xCta_Ccos := 'N';
         DMCXP.cdsDetCxP.FieldByname('CCOSID').AsString := '';
         dblcdCCosto.Enabled := False;
      End;
   End
   Else
   Begin
      ShowMessage('Cuenta Contable NO existe para la Compañía indicada');
      dblcdCnpEgr.SetFocus;
      exit;
   End;

   If xMensaje = '1' Then
   Begin
      If MessageDlg('¿ Distribución de C.Costo Automática ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         xDistri := 'S';
         DMCXP.cdsDetCxP.FieldByname('CCOSID').AsString := '';
         dblcdCCosto.Enabled := false;
      End
      Else
         xDistri := '';
   End
   Else
      xDistri := '';

   //** si la distribucion es Manual y la Cuenta si Tiene Centro de Costo
   If (xDistri = '') And (xCta_Ccos = 'S') Then
   Begin
      dblcdCCosto.Enabled := true;

      xWhere := 'CIAID=''' + dblcCia.Text + ''' and CUENTAID=' + '''' + dbeCuenta.Text + '''';
      BuscaQry('PrvTGE', 'TGE202', '*', xWhere, 'CUENTAID');
      If (DMCXP.cdsQry.fieldbyname('CTA_PRES').AsString = 'S') And (wActuaPresu = true) Then
      Begin
         xSQL := 'Select * from PPRES201 WHERE PARPRES_IS=''S''';
         DMCXP.cdsPresup.Close;
         DMCXP.cdsPresup.DataRequest(xSQL);
         DMCXP.cdsPresup.Open;

         dblcTipPre.Enabled := true;
         dblcdPresup.Enabled := true;
         lblPresu.Enabled := true;
         lblTipPre.Enabled := true;
      End
      Else
      Begin
         dblcTipPre.Enabled := false;
         dbeTipPre.Text := '';
         dblcdPresup.Enabled := false;
         lblTipPre.Enabled := false;
         lblPresu.Enabled := false;
      End;
   End;
End;

Procedure TFProvision.dtpFCompExit(Sender: TObject);
Var
   xMes: String;
   wAno, wMes, wDia: Word;
Begin
   If xCrea Then Exit;
   If bbtnBorra.Focused Then Exit;
   If edtNoDoc.Focused Then Exit;
   If edtSerie.Focused Then Exit;
   If dblcTDoc.Focused Then Exit;
   If dblcTDiario.Focused Then Exit;

   If Length(edtNoDoc.Text) = 0 Then
   Begin
      edtNoDoc.SetFocus;
      Raise Exception.Create('Falta Número de Documento');
   End;
   If dtpFComp.Date = 0 Then
   Begin
      dtpFComp.SetFocus;
      Raise Exception.Create('Falta Fecha de Comprobante');
   End;

   If xControlFec(dblcCia.Text, dtpFComp.Date) = False Then
   Begin
      dtpFComp.SetFocus;
      Exit;
   End;

   DecodeDate(dtpFComp.Date, wAno, wMes, wDia);

      If wMes < 10 Then
         xMes := '0' + inttostr(wMes)
      Else
         xMes := inttostr(wMes);
      meAnoMM.Text := IntToStr(wAno) + xMes;
      xTMes := xMes;
      xTAno := IntToStr(wAno);

      If (length(edtTDiario.Text) > 0) And (length(meAnoMM.Text) = 6) Then
      Begin
         xTAutoNum := DMCXP.DisplayDescrip('TGE104', 'AUTONUM', 'TDIARID', dblcTDiario.Text);
         meNoReg.Text := DMCXP.UltimoRegistroCXP(xTAutoNum, dblcCia.Text, dblcTDiario.Text, xTAno, xTMes);
         meNoReg.Text := Strzero(meNoReg.Text, DMCXP.cdsMovCxP.fieldbyname('CPNOREG').Size);
      End;
      DMCXP.cdsMovCxP.Edit;
      DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString := meNoReg.Text;
      DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString := meAnoMM.Text;
      DMCXP.cdsMovCxP.fieldbyname('CPFRECEP').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFCMPRB').AsDateTime;
   // si pertenece a una orden de pago no se actualiza la fecha del documento
      If xnItemOP = 0 Then
         DMCXP.cdsMovCxP.fieldbyname('CPFEMIS').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFCMPRB').AsDateTime;
      DMCXP.cdsMovCxP.fieldbyname('CPFVCMTO').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFCMPRB').AsDateTime;
      DMCXP.cdsMovCxP.Post;
   // se deshabilita edición de Nro. de Registro
   //  meNoReg.SetFocus;
      meNoRegExit(Sender);
End;

Procedure TFProvision.Z2bbtnContabClick(Sender: TObject);
Var
   xWhere: String;
Begin
   If DMCXP.wAdmin = 'G' Then Exit;

   If Not AsientoCuadra Then
      Raise exception.Create('Error:  Asiento No Cuadra');

   If DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString = 'S' Then
      Raise exception.Create('Error:  Asiento ya fue Contabilizado');

   If DMCXP.MesCerrado(copy(meAnoMM.text, 5, 2), copy(meAnoMM.text, 1, 4), dblcCia.text) Then
   Begin
      ShowMessage(' Mes Cerrado!!!, No se puede contabilizar');
      exit;
   End;

   If Not DMCXP.Accesos_a_Registros(DMCXP.cdsMovCxP.fieldbyname('CPUSER').AsString) Then
      Exit;

// verifica que en ese momento no se haya realizado alguna actualización con respecto al documento
// que se está provisionando
   xWhere := 'CIAID=' + quotedstr(dblcCia.Text)
           + '  and TDIARID=' + quotedstr(dblcTdiario.Text)
           + '  and CPANOMES=' + quotedstr(meAnoMM.Text)
           + '  and CPNOREG=' + quotedstr(meNoReg.Text);
   If length(BuscaQry('PrvTGE', 'CXP301', '*', xWhere, 'CIAID')) > 0 Then
   Begin
      If (DMCXP.cdsQry.fieldbyname('CP_CONTA').AsString = 'S') Then
      Begin
         ShowMessage('Registro ya fue Contabilizado');
         Exit;
      End;

      If DMCXP.cdsQry.fieldbyname('CPESTADO').AsString = 'A' Then
      Begin
         ShowMessage('Registro fue Anulado)');
         Exit;
      End;

      If DMCXP.cdsQry.fieldbyname('CPESTADO').AsString = 'E' Then
      Begin
         ShowMessage('Registro fue Eliminado');
         Exit;
      End;
   End;

   If MessageDlg('Contabiliza Documentos' + chr(13) +
      '    ¿Esta Seguro?     ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Else
      exit;

   If (DMCXP.cdsCia.FieldByName('PRORATEO').AsString = 'S') Then
   Begin
      If (DMCXP.cdsCia.FieldByName('IGVSN').AsString = '1') Then
      Begin
         If DMCXP.cdsMovCxP.FieldByName('CPIGV2').AsFloat > 0 Then
            FToolCont.Prorrateo(dblcCia.text, dblcTDiario.text,
               DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString,
               DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString);
      End
      Else
         If (DMCXP.cdsCia.FieldByName('IGVSN').AsString = '2') Then
         Begin
            If DMCXP.cdsMovCxP.FieldByName('CPIGV').AsFloat > 0 Then
               FToolCont.Prorrateo(dblcCia.text, dblcTDiario.text,
                  DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString,
                  DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString);
         End;
   End;

   Try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;

      DMCXP.GeneraContab(dblcCia.Text, dblcTDiario.Text, meAnoMM.Text, meNoReg.text, Self, 'C');

      xSQL := 'Select CNTCOMPROB from CNT301 '
            + 'WHERE CIAID=' + quotedstr(dblcCia.Text) + ' AND '
            + 'CNTANOMM=' + quotedstr(meAnoMM.Text) + ' AND '
            + 'TDIARID=' + quotedstr(dblcTDiario.Text) + ' AND '
            + 'CNTCOMPROB=' + quotedstr(meNoReg.text);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.ProviderName := 'dspTGE';
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;

      If DMCXP.cdsQry.Recordcount <= 0 Then
      Begin
         xSQL := 'delete from CNT300 '
               + 'WHERE CIAID=' + quotedstr(dblcCia.Text) + ' AND '
               + 'CNTANOMM=' + quotedstr(meAnoMM.Text) + ' AND '
               + 'TDIARID=' + quotedstr(dblcTDiario.Text) + ' AND '
               + 'CNTCOMPROB=' + quotedstr(meNoReg.text);
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.ProviderName := 'dspTGE';
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Execute;
         ShowMessage('Error al Contabilizar Provisión');
         Exit;
      End;

      xSQL := 'Select CNTCOMPROB from CNT300 '
            + 'WHERE CIAID=' + quotedstr(dblcCia.Text) + ' AND '
            + 'CNTANOMM=' + quotedstr(meAnoMM.Text) + ' AND '
            + 'TDIARID=' + quotedstr(dblcTDiario.Text) + ' AND '
            + 'CNTCOMPROB=' + quotedstr(meNoReg.text);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.ProviderName := 'dspTGE';
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;

      If DMCXP.cdsQry.Recordcount <= 0 Then
      Begin
         xSQL := 'delete from CNT301 '
               + 'WHERE CIAID=' + quotedstr(dblcCia.Text) + ' AND '
               + 'CNTANOMM=' + quotedstr(meAnoMM.Text) + ' AND '
               + 'TDIARID=' + quotedstr(dblcTDiario.Text) + ' AND '
               + 'CNTCOMPROB=' + quotedstr(meNoReg.text);
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.ProviderName := 'dspTGE';
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Execute;
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Error al Contabilizar Provisión');
         Exit;
      End;

      DMCXP.cdsMovCxP.Edit;
      DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString := 'S';

         xSQL := ' Update CXP301 '
               + '    set CP_CONTA = '+quotedstr(DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString)+', '
               + '        CPUSER = '+quotedstr(DMCXP.wUsuario)+', '
               + '        CPFREG = trunc(sysdate), '
               + '        CPHREG = sysdate '
               + '  Where CIAID = '+quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
               + '    and TDIARID = '+quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString)
               + '    and CPANOMES = '+quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
               + '    and CPNOREG = '+quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString);
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

      DMCXP.DCOM1.AppServer.GrabaTransaccion;

   Except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('Error al Contabilizar...');
      Exit;
   End;

   EstadoDeForma(1, DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString, DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString);

   Z2bbtnPreview.Enabled := true;
   If DMCXP.wTipoAdicion = 'xFiltro' Then
   Begin
      DMCXP.ActualizaFiltro(FPrincipal.GProvision, DMCXP.cdsMovCxP, 'M');
   End;
   ShowMessage('Asiento Automático Generado' + chr(13) + 'y Registro Contabilizado ');

End;

Function TFProvision.AsientoCuadra: Boolean;
Var
   xTotDebe, xTotHaber: double;
   xCampo: String;
Begin
   Result := False;
   xTotDebe := 0;
   xTotHaber := 0;
   If DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString = DMCXP.wTMonLoc Then
      xCampo := 'DCPMOLOC'
   Else
      xCampo := 'DCPMOEXT';

   DMCXP.cdsDetCxP.Close;
   DMCXP.cdsDetCxP.Open;

   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.Eof Do
   Begin
      If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
         xTotDebe := xTotDebe + FRound(DMCXP.cdsDetCxP.Fieldbyname(xCampo).AsFloat, 15, 2)
      Else
      Begin
         xTotHaber := xTotHaber + FRound(DMCXP.cdsDetCxP.Fieldbyname(xCampo).AsFloat, 15, 2);
      End;
      DMCXP.cdsDetCxP.Next;
   End;
   DMCXP.cdsDetCxP.First;

   xTotFac := FRound(xTotHaber, 15, 2);

   If FRound(xTotDebe, 15, 2) = FRound(xTotHaber, 15, 2) Then
      Result := True;
End;

Procedure TFProvision.edtNoDocExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If bbtnBorra.Focused Then Exit;
   If edtSerie.Focused Then Exit;

   If length(edtNoDoc.Text) = 0 Then
   Begin
      ShowMessage('Falta No. de Documento');
      edtNoDoc.SetFocus;
      exit;
   End;

// Inicio HPC_201604_CXP
// 16/08/2016  DAF_2016001170 Valida que Serie tenga longitud fija si así lo requiere
   If xReqLongNroDocFija then
   Begin
      If length(edtNoDoc.Text)>xLongNroDocFija then
      Begin
         ShowMessage('Longitud del Número de Documento debe ser máximo de '+inttostr(xLongNroDocFija)+' caracteres');
         edtNoDoc.SetFocus;
         exit;
      End;
   End;
// Fin HPC_201604_CXP

   If Not meNoReg.Enabled Then
   Begin
      //Inicio HPC_201705_CXP
      //Se comento porque la búsqueda será con una nueva rutina
      //If DMCXP.BuscaCxPDoc(dblcCia.Text, dblcdProv.Text, dblcTDoc.Text, edtSerie.Text, edtNoDoc.Text) Then
      If DMCXP.BuscaCxPDocDup(dblcClaux.Text, dblcdProv.Text, dblcTDoc.Text, edtSerie.Text, edtNoDoc.Text) Then
      Begin         
         If DMCXP.cdsUltTGE.RecordCount > 1 Then
         Begin
            edtNoDoc.SetFocus;
            ShowMessage('Documento ya fue registrado');
            exit;
         End;
         //Se añadió nuevas condiciones a la validación
         If (DMCXP.cdsUltTGE.FieldByName('CIAID').AsString <> dblcCia.Text) Or
            (DMCXP.cdsUltTGE.FieldByName('TDIARID').AsString <> dblcTdiario.Text) Or
            (DMCXP.cdsUltTGE.FieldByName('CPANOMES').AsString <> meAnoMM.Text) Or
            (DMCXP.cdsUltTGE.FieldByName('CPNOREG').AsString <> meNoReg.Text) Then
         Begin
            edtNoDoc.SetFocus;
            ShowMessage('Documento ya fue registrado');
            exit;
         End;
      //Fin HPC_201705_CXP
      End;
   End
   Else
   Begin

      //Inicio HPC_201705_CXP
      //Se comento porque la búsqueda será con una nueva rutina
      //If DMCXP.BuscaCxPDoc(dblcCia.Text, dblcdProv.Text, dblcTDoc.Text, edtSerie.Text, edtNoDoc.Text) Then
      If DMCXP.BuscaCxPDocDup(dblcClaux.Text, dblcdProv.Text, dblcTDoc.Text, edtSerie.Text, edtNoDoc.Text) Then
      Begin
         //Se comento
         //edtNoDoc.SetFocus;
         //Raise Exception.Create('Documento ya Fue Registrado' );

         //Se añadió nuevas condiciones a la validación
         If DMCXP.cdsUltTGE.RecordCount > 1 Then
         Begin
            edtNoDoc.SetFocus;
            ShowMessage('Documento ya fue registrado');
            exit;
         End;

         If (DMCXP.cdsUltTGE.FieldByName('CIAID').AsString <> dblcCia.Text) Or
            (DMCXP.cdsUltTGE.FieldByName('TDIARID').AsString <> dblcTdiario.Text) Or
            (DMCXP.cdsUltTGE.FieldByName('CPANOMES').AsString <> meAnoMM.Text) Or
            (DMCXP.cdsUltTGE.FieldByName('CPNOREG').AsString <> meNoReg.Text) Then
         Begin
            edtNoDoc.SetFocus;
            ShowMessage('Documento ya fue registrado');
            exit;
         End;
      //Fin HPC_201705_CXP
      End
      Else
      Begin // si no lo encontró en MovCxP
         xWhere := 'CIAID=' + '''' + dblcCia.Text + '''' + ' and TDIARID=' + '''' + dblcTDiario.Text + '''' + ' and CPANOMES=' + '''' + meAnoMM.Text + '''';
         dbeLote.Text := DMCXP.BuscaUltTGE('PrvUltCxP', 'CXP301', 'DCPLOTE', xWhere);
         dbeLote.Text := Strzero(dbeLote.Text, DMCXP.cdsMovCxP.fieldbyname('DCPLOTE').DisplayWidth);
      End;

      If DMCXP.wVRN_InterMed = 'S' Then
         chkInter.SetFocus
      Else
         If dblcTDiario.Enabled Then
            dblcTDiario.SetFocus
         Else
            dtpFComp.SetFocus;
   End;
End;

Procedure TFProvision.bbtnBorraClick(Sender: TObject);
Begin
   If DMCXP.wModo = 'A' Then
   Begin
      If xFlagGr Then
      Begin
         DMCXP.cdsDetCxP.CancelUpdates;

         If DMCXP.cdsMovCxP.Recordcount > 0 Then
         Begin
            xSql := ' delete from CXP301 '
                  + '  where CIAID =' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
                  + '    and CPANOMES = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
                  + '    and CPNOREG = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString)
                  + '    and TDIARID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString);
            Try
               DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('No se puede borrar el registro, Intente nuevamente...');
               exit;
            End;
         End;

         DMCXP.cdsMovCxP.Insert;
         IniciaForma;
      End
      Else
      Begin
         If Length(DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString) = 0 Then
         Begin
            DMCXP.cdsMovCxP.CancelUpdates;
            DMCXP.cdsMovCxP.Insert;
            IniciaForma;
         End
         Else
         Begin
            DMCXP.cdsMovCxP.CancelUpdates;
         End;
      End;
   End
   Else
   Begin
      DMCXP.cdsMovCxP.CancelUpdates;
   End;
   EstadoDeForma(0, DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString, ' ');

End;

Procedure TFProvision.dblcTDocExit(Sender: TObject);
Var
   xTDiar2, xWhere: String;
Begin

   If Btn_OrdenPago.Focused Then Exit;
   If xCrea Then Exit;
   If bbtnBorra.Focused Then Exit;

// Inicio HPC_201604_CXP
// 16/08/2016  DAF_2016001170 Inicializa variables que Valida que Serie tenga longitud fija si así lo requiere
   xReqLongSerFija := False;
   xLongSerFija := 0;
   xReqLongNroDocFija := False;
   xLongNroDocFija := 0;
// Fin HPC_201604_CXP

   xWhere := 'DOCID=''' + dblcTDoc.Text + ''' and '
           + 'DOC_FREG=''' + xTipoProv + ''' and DOCMOD=''CXP''';
   edtTDoc.Text := BuscaQry('PrvTGE', 'TGE110', '*', xWhere, 'DocDes');

   If length(edtTDoc.Text) > 0 Then
   Begin
   // Inicio HPC_201604_CXP
   // 16/08/2016  DAF_2016001170 Inicializa variables que Valida que Serie tenga longitud fija si así lo requiere
      xReqLongSerFija := (DMCXP.cdsQry.fieldbyname('RQ_LONGSER_FIJA').AsString='S');
      xLongSerFija := DMCXP.cdsQry.fieldbyname('LONGSERIE_FIJA').AsInteger;
      xReqLongNroDocFija := (DMCXP.cdsQry.fieldbyname('RQ_LONGNUM_FIJA').AsString='S');
      xLongNroDocFija := DMCXP.cdsQry.fieldbyname('LONGNUMDOC_FIJA').AsInteger;
      {
   // Factura
      If dblcTDoc.Text='01' then
      Begin
         xReqLongSerFija := True;
         xLongSerFija := 4;
         xReqLongNroDocFija := False;
         xLongNroDocFija := 0;
      End;
   // Ticket
      If dblcTDoc.Text='12' then
      Begin
         xReqLongSerFija := False;
         xLongSerFija := 0;
         xReqLongNroDocFija := True;
         xLongNroDocFija := 12;
      End;
      }
   // Fin HPC_201604_CXP

      xDtrAfecto := DMCXP.cdsQry.fieldbyname('DTRAFECTO').AsString;
      // Inicio HPC_201702_CXP
      // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
      xDtrAfectoP := DMCXP.cdsQry.fieldbyname('DTRAFECTO').AsString; 
      // Fin HPC_201702_CXP
      xDOCTIPREG := DMCXP.cdsQry.fieldbyname('DOCTIPREG').AsString;
      wDocRetIGV := False;
      If (wCiaRetIGV And wProvRetIGV) Then
      Begin
         If DMCXP.cdsQry.fieldbyname('DOCRETIGV').AsString = 'S' Then
         Begin
            wDocRetIGV := True;
         End;
      End;

      xConta := DMCXP.cdsQry.fieldbyname('DOCCONTA').AsString;
      xTDiar2 := DMCXP.cdsQry.fieldbyname('TDIARID2').AsString;
   // Asigna Tipo de Diario a lookup combo TDiario
      DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString := DMCXP.cdsQry.fieldbyname('TDIARID').Asstring;
   // Busca descripción TDiario y asigna a edit TDiario
      edtTDiario.Text := DMCXP.DisplayDescrip('TGE104', 'TDIARDES', 'TDIARID', dblcTDiario.Text);
   // Filtra Tipo de Diario específico

      xFiltroTDiar := 'TDIARID=' + QuotedStr(DMCXP.cdsUltTGE.fieldbyname('TDIARID').Asstring) + ' ';

      If length(xTDiar2) > 0 Then
      Begin
         xFiltroTDiar := xFiltroTDiar + ' or TDIARID=' + '''' + xTDiar2 + '''';
      End;
      DMCXP.cdsTDiario.Filter := '';
      DMCXP.cdsTDiario.Filter := xFiltroTDiar;
      DMCXP.cdsTDiario.Filtered := true;
      If DMCXP.cdsTDiario.Recordcount = 0 Then
      Begin
         dblcTDoc.SetFocus;
         Raise Exception.Create('Documento No Tiene Tipo De Diario asignado');
      End;
      If DMCXP.cdsTDiario.Recordcount = 1 Then
         dblcTDiario.Enabled := false
      Else
      Begin
         dblcTDiario.Enabled := true;
      End;
   End
   Else
   Begin
      dblcTDoc.SetFocus;
      Raise Exception.Create('Falta Código de Documento');
   End;

   xWhere := 'CLAUXID=''' + dblcClAux.Text + ''' and PROV=''' + dblcdProv.Text + '''';
   xEXON4TA := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV, ACTIVO, ESDOMIC,PROVEXONER', xWhere, 'PROVEXONER');

   lblsusp4c.visible := False;
   IF xDOCTIPREG ='4C' THEN
   BEGIN
      IF xEXON4TA <>'' THEN
           lblsusp4c.visible := True;
   END
   ELSE
   BEGIN
        lblsusp4c.visible := False;
   END;

// Inicio HPC_201701_CXP
// Considera Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00
   xValorMinRta4ta := 0;
   if xDOCTIPREG ='4C' then
      xValorMinRta4ta := 1500;
// Fin HPC_201701_CXP

   edtserie.SetFocus;
End;

Procedure TFProvision.edtSerieExit(Sender: TObject);
Begin
   If xCrea Then Exit;

// Inicio HPC_201604_CXP
// 16/08/2016  DAF_2016001170 Inicializa variables que Valida que Serie tenga longitud fija si así lo requiere
   If xReqLongSerFija then
   Begin
      If length(edtSerie.Text)<>xLongSerFija then
      Begin
         ShowMessage('Longitud de la Serie debe ser de '+inttostr(xLongSerFija)+' caracteres');
         edtSerie.SetFocus;
         exit;
      End;
   End;
   If dblcTDoc.Text='02' then
   Begin
      If edtSerie.Text <> 'E001' then
      Begin
         ShowMessage('Serie no pertenece a Recibos por Honorarios Electrónicos');
         edtSerie.SetFocus;
         exit;
      End;
   End;
// Fin HPC_201604_CXP

   If bbtnBorra.Focused Then Exit;
   If edtNoDoc.Focused Then Exit;
   If dtpFComp.Focused Then Exit;
   If dblcTDoc.Focused Then Exit;

   edtNoDoc.SetFocus;
End;

Procedure TFProvision.dblcTDiarioExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;

   If Not bbtnBorra.Focused Then
   Begin
      If length(xFiltroTDiar) > 0 Then
      Begin
         xWhere := '(' + xFiltroTDiar + ') and TDIARID=' + '''' + dblcTDiario.Text + '''';
         edtTDiario.Text := BuscaQry('PrvTGE', 'TGE104', '*', xWhere, 'TDIARDES');
      End;
      If length(edtTDiario.Text) = 0 Then
      Begin
         ShowMessage('Falta Tipo de Diario');
         dblcTDiario.SetFocus;
      End;
   End;
End;

Procedure TFProvision.dtpFEmisExit(Sender: TObject);
Begin
   If xCrea Then Exit;

   If Not bbtnBorra.Focused Then
   Begin
      If dtpFEmis.Date = 0 Then
      Begin
         ShowMessage('Falta Fecha de Emisión');
         dtpFEmis.SetFocus;
      End;

	  //Inicio HPC_201701_CXP La fecha de emisión del documento debe ser menor o igual a la fecha de Comprobante
      //Validación al generar libros diarios y mayor que se envían a sunat(PLE)
      If dtpFEmis.Date > dtpFComp.Date Then
      Begin
          showmessage('La fecha de emisión del documento debe ser menor o igual a la fecha '+dtpFComp.Text+' del Comprobante');
          dtpFEmis.SetFocus;
      End;
      //Fin HPC_201701_CXP				
						  

      If (wDocRetIGV) And (dtpFEmis.Date >= xTasaFec) Then
      Begin
         lblRetIGV.Visible := True;
         lblRetIGV.Font.Color := clRed;
         cbSujetoaRetIGV.Visible := True;
      End
      Else
      Begin
         lblRetIGV.Visible := False;
         cbSujetoaRetIGV.Visible := False;
      End;

      If dtpFEmis.Modified Then
      Begin
         If seDias.Value > 0 Then
         Begin
            DMCXP.cdsMovCxP.Edit;
            DMCXP.cdsMovCxP.FieldByname('CPFVCMTO').Value := DMCXP.cdsMovCxP.FieldByname('CPFEMIS').Value + seDias.Value;
         End;

         If (dtpFVcmto.Date < dtpFEmis.date) Or (dtpFVcmto.Date = 0) Then
         Begin
            DMCXP.cdsMovCxP.FieldByname('CPFVCMTO').AsDateTime := DMCXP.cdsMovCxP.FieldByname('CPFEMIS').AsDateTime + seDias.Value;
         End;
         If dtpFRecep.Date = 0 Then
         Begin
            dtpFRecep.Date := dtpFEmis.date;
         End;
      End;

      If length(dblcTMon.Text) > 0 Then
         dblcTMonExit(self);
   End;
End;

Procedure TFProvision.dtpFVcmtoExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtnBorra.Focused Then Exit;

   If dtpFVcmto.Date = 0 Then
   Begin
      ShowMessage('Falta Fecha de Vencimiento');
      dtpFVcmto.SetFocus;
      Exit;
   End;
   If dtpFVcmto.Date < dtpFEmis.Date Then
   Begin
      ShowMessage('Fecha de Vencimiento debe ser mayor o Igual a Fecha de Emisión');
      dtpFVcmto.SetFocus;
      Exit;
   End;
   seDias.Value := StrToInt(StringReplace(FloatToStrF((dtpFVcmto.date - dtpFEmis.Date), ffnumber, 10, 0), ',', '', [rfReplaceAll]));
End;

Procedure TFProvision.dblcTMonExit(Sender: TObject);
Var
   xWhere, xTipo: String;
Begin
   If xCrea Then Exit;
   If dtpFVcmto.Focused Then Exit;
   If dtpFEmis.Focused Then Exit;

   Screen.Cursor := crHourGlass;
   If Not bbtnBorra.Focused Then
   Begin
      xWhere := 'TMONID=' + '''' + dblcTMon.Text + '''';
      edtTMon.Text := BuscaQry('PrvTGE', 'TGE103', 'TMONDES, TMON_LOC', xWhere, 'TMONDES');
      Screen.Cursor := crDefault;
      If length(edtTMon.Text) = 0 Then
      Begin
         ShowMessage('Falta Tipo de Moneda');
         dblcTMon.SetFocus;
         exit;
      End;

      xTipo := DMCXP.cdsQry.FieldByName('TMON_LOC').AsString;

      If (xTipo = 'L') Then
         xWhere := 'TMONID=' + '''' + DMCXP.wTMonExt + '''' + ' and '
            + 'FECHA=' + DMCXP.wRepFuncDate + '''' + FormatDateTime(DMCXP.wFormatFecha, dtpFEmis.Date) + '''' + ')'
      Else
         xWhere := 'TMONID=' + '''' + dblcTMon.Text + '''' + ' and '
            + 'FECHA=' + DMCXP.wRepFuncDate + '''' + FormatDateTime(DMCXP.wFormatFecha, dtpFEmis.Date) + '''' + ')';

      If length(BuscaQry('PrvTGE', 'TGE107', '*', xWhere, 'TMONID')) > 0 Then
      Begin
         xxTCambio := DMCXP.cdsQry.fieldbyname('TCAM' + DMCXP.wVRN_TipoCambio).AsFloat;
         xxTCamDol := xxTCambio;

         If (xTipo <> 'L') And (xTipo <> 'E') Then
         Begin
            xWhere := 'TMONID=' + '''' + DMCXP.wTMonExt + '''' + ' and '
               + 'FECHA=' + DMCXP.wRepFuncDate + '''' + FormatDateTime(DMCXP.wFormatFecha, dtpFEmis.Date) + '''' + ')';
            If length(BuscaQry('PrvTGE', 'TGE107', '*', xWhere, 'TMONID')) > 0 Then
               xxTCamDol := DMCXP.cdsQry.fieldbyname('TCAM' + DMCXP.wVRN_TipoCambio).AsFloat
            Else
            Begin
               ShowMessage(' Fecha No tiene Tipo de Cambio Dólares');
               dtpFEmis.SetFocus;
               Exit;
            End;
         End;
      End
      Else
      Begin
         ShowMessage(' Fecha No tiene Tipo de Cambio para la Moneda seleccionada');
         dtpFEmis.SetFocus;
         Exit;
      End;

      DMCXP.cdsMovCxP.Edit;
      DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat := xxTCambio;
      DMCXP.cdsMovCxP.fieldbyname('CPTCAMAJ').AsFloat := xxTCambio;
      DMCXP.cdsMovCxP.fieldbyname('CPTCAMDOL').AsFloat := xxTCamDol;

   End;
   Screen.Cursor := crDefault;
End;

Procedure TFProvision.dbeTCambioExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtnBorra.Focused Then Exit;

   If length(dbeTCambio.Text) = 0 Then
   Begin
      ShowMessage('Falta Tipo de Cambio');
      dbeTCambio.SetFocus;
      exit;
   End;
   dbeTCambio.Text := floattostr(strtofloat(dbeTCambio.Text));
   If strtofloat(dbeTCambio.Text) < 0 Then
   Begin
      ShowMessage('Tipo de Cambio debe ser Mayor a 0');
      dbeTCambio.Text := '';
      dbeTCambio.SetFocus;
      exit;
   End;
End;

Procedure TFProvision.dbeOCompraExit(Sender: TObject);
Begin
   If xCrea Then Exit;

   If Not bbtnBorra.Focused Then
   Begin

   // Regla de Negocio  :  Si Se debe Registrar Orden de Compra
      If DMCXP.wVRN_OrdenCompra = 'S' Then
      Begin
         If length(dblcdOCompra.Text) = 0 Then
         Begin
            ShowMessage('Falta Orden de Compra');
            dblcdOCompra.SetFocus;
            Exit;
         End
      End;
   End;
End;

Procedure TFProvision.dtpFRecepExit(Sender: TObject);
Begin
   If xCrea Then Exit;

   If Not bbtnBorra.Focused Then
   Begin
      If dtpFRecep.Date = 0 Then
      Begin
         ShowMessage('Falta Fecha de Recepción del Documento');
         dtpFRecep.SetFocus;
      End;	  
   End;
End;

Procedure TFProvision.dbeLoteExit(Sender: TObject);
Begin
   If xCrea Then Exit;

   If Not bbtnBorra.Focused Then
   Begin
      If length(dbeLote.Text) = 0 Then
      Begin
         ShowMessage('Falta No.Lote');
         dbeLote.SetFocus;
      End;
   End;
End;

Procedure TFProvision.bbtnRegresaClick(Sender: TObject);
Begin
   If DMCXP.wAdmin = 'G' Then Exit;

   EstadoDeForma(0, DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString, DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString);

   xRegresa := true;
End;

Procedure TFProvision.Z2bbtnNuevoClick(Sender: TObject);
Var
   xWhere, xCia, xCla, xPro, xDoc, xTDi, xTmo: String;
Begin
   If DMCXP.wAdmin = 'G' Then Exit;

   If MessageDlg('Registra un Nuevo Documento' + chr(13) +
      '          ¿Esta Seguro?  ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then exit;

   If DMCXP.cdsDetCxP.Active Then
      DMCXP.cdsDetCxP.CancelUpdates;

   DMCXP.cdsDetCxP.Close;

   If (DMCXP.wModo = 'A') And (xFlagGr) Then
   Begin
      DMCXP.DCOM1.AppServer.IniciaTransaccion;

      xSQL := 'Delete from CXP302 '
            + ' where CIAID = ' + quotedstr(dblcCia.Text)
            + '   and TDIARID = ' + quotedstr(dblcTdiario.Text)
            + '   and DCPANOMM = ' + quotedstr(meAnoMM.Text)
            + '   and CPNOREG = ' + quotedstr(meNoReg.Text);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      Try
         DMCXP.cdsQry.Execute;
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede eliminar el detalle de la provisión');
         Exit;
      End;

      If DMCXP.cdsMovCxP.Recordcount > 0 Then
      Begin
         xSql := ' delete from CXP301 '
               + ' where CIAID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
               + '   and CPANOMES = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
               + '   and CPNOREG = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString)
               + '   and TDIARID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString);
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se puede eliminar la cabecera de la provisión');
            exit;
         End;
      End;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;

   End;
   IniciaForma;

   DMCXP.wModo := 'A';

   xCia := DMCXP.cdsMovCxP.FieldByName('CIAID').AsString;
   xCla := DMCXP.cdsMovCxP.FieldByName('CLAUXID').AsString;
   xPro := DMCXP.cdsMovCxP.FieldByName('PROV').AsString;
   xDoc := DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
   xTDi := DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString;
   xTmo := DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;

   DMCXP.cdsMovCxP.Insert;

   DMCXP.cdsMovCxP.FieldByName('CIAID').AsString := xCia;
   DMCXP.cdsMovCxP.FieldByName('CLAUXID').AsString := xCla;
   DMCXP.cdsMovCxP.FieldByName('PROV').AsString := xPro;
   DMCXP.cdsMovCxP.FieldByName('DOCID').AsString := xDoc;
   DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString := xTDi;
   DMCXP.cdsMovCxP.FieldByName('TMONID').AsString := xTmo;

   EstadoDeForma(0, ' ', ' ');

   edtCia.Text := DMCXP.DisplayDescrip('TGE101', 'CIADES', 'CIAID', dblcCia.Text);

   dblcClAux.OnExit(dblcClAux);

   xWhere := 'CLAUXID=''' + dblcClAux.Text + ''' and PROV=''' + dblcdProv.Text + '''';
   edtProv.Text := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV, ACTIVO', xWhere, 'PROVDES');

   xWhere := 'DOCID=' + '''' + dblcTDoc.Text + '''' + ' and DOC_FREG=' + '''' + FPrincipal.xTipoProv + '''';
   edtTDoc.Text := BuscaQry('PrvTGE', 'TGE110', '*', xWhere, 'DocDes');

   xConta := DMCXP.cdsQry.fieldbyname('DOCCONTA').AsString;
   edtTDiario.Text := DMCXP.DisplayDescrip('TGE104', 'TDIARDES', 'TDIARID', dblcTDiario.Text);

   xWhere := 'TMONID=' + '''' + dblcTMon.Text + '''' + ' and (TMON_LOC=' + '''' + 'L' + '''' + ' or TMON_LOC=' + '''' + 'E' + '''' + ')';
   edtTMon.Text := BuscaQry('PrvTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');

   Z2bbtnPreview.Enabled := False;
   edtSerie.SetFocus;

End;

Procedure TFProvision.dblcCiaExit(Sender: TObject);
Var
   xSQL, xWhere: String;
Begin
   If xCrea Then Exit;

   xWhere := 'CIAID=' + quotedstr(dblcCia.Text);
   edtCia.Text := BuscaQry('dspTGE', 'TGE101', 'CIAABR,CIARETIGV,EXOIGV', xWhere, 'CIAABR');

   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Falta Código de Compañía');
      dblcCia.SetFocus;
   End;

// Determina Si la Cía es Agente de Retención de IGV
   wCiaRetIGV := False;
   xExoIGV := DMCXP.cdsQry.FieldByName('EXOIGV').AsString;
   If DMCXP.cdsQry.FieldByName('CIARETIGV').AsString = 'S' Then wCiaRetIGV := True;

   dblcClAux.SetFocus;

   If DMCXP.wVRN_CCosCia = 'N' Then
      xSQL := 'Select CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV '
            + '  from TGE203 '
            + ' where CCOSMOV=' + quotedstr('S')
            + '   and CCOSACT=''S'''
   Else
      xSQL := 'Select CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV '
            + '  from TGE203 '
            + ' where CCOSMOV=' + quotedstr('S')
            + '   and CCOSCIAS LIKE (' + quotedstr('%' + dblcCia.Text + '%') + ' ) '
            + '   and CCOSACT=''S''';
   DMCXP.cdsCCosto.Close;
   DMCXP.cdsCCosto.DataRequest(xSQL);
   DMCXP.cdsCCosto.open;
   DMCXP.cdsCCosto.Filter := '';
   DMCXP.cdsCCosto.Filtered := False;
   DMCXP.cdsCCosto.IndexFieldNames := 'CCOSID';

   If DMCXP.wVRN_CptoCia = 'N' Then
      xSQL := 'select * from CXP201 A ' // cuando la tabla de Conceptos NO tiene Compañía
            + ' WHERE EXISTS ( SELECT CUENTAID FROM TGE202 B '
            + '                 WHERE A.CUENTAID=B.CUENTAID AND B.CTAACT=''S'' '
            + '                   AND B.CIAID=''' + dblcCia.Text + ''' and CTA_MOV=''S'' ) '
            + ' ORDER BY A.CPTOID'
   Else
      xSQL := 'select A.CPTOID, A.CPTODES, A.CUENTAID, NIVELMOV, DTRPORC, CCOSPORCEN From CXP201 A '
            + 'WHERE EXISTS ( SELECT CUENTAID FROM TGE202 B '
            + 'WHERE A.CUENTAID=B.CUENTAID AND B.CTAACT=''S'' '
            + 'AND B.CIAID=''' + dblcCia.Text + ''' and CTA_MOV=''S'') '
            + 'ORDER BY A.CPTOID';

   DMCXP.cdsCnpEgr.Close;
   DMCXP.cdsCnpEgr.DataRequest(xSQL);
   DMCXP.cdsCnpEgr.Open;
   // inicializa listBox
   lbDTRCpto.Items.Clear;
   lbDTRPorc.Items.Clear;
End;

Procedure TFProvision.Z2bbtnAnulaClick(Sender: TObject);
Var
   sSigno, xWhere: String;
Begin
   If DMCXP.wAdmin = 'G' Then Exit;

   If Not DMCXP.Accesos_a_Registros(DMCXP.cdsMovCxP.fieldbyname('CPUSER').AsString) Then
      Exit;

   If xControlFec(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString, DMCXP.cdsMovCxP.fieldbyname('CPFCMPRB').AsDateTime) = False Then
      Exit;

   If MessageDlg('Anular Comprobante' + chr(13) +
      '   ¿Esta Seguro?   ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then exit;

   If (DMCXP.cdsMovCxP.Modified) Or (DMCXP.cdsMovCxP.ChangeCount > 0) Then
      Raise exception.Create(' Debe Grabar primero las Actualizaciones realizadas');
   If (DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString = 'S') Or
      ((DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat - DMCXP.cdsMovCxP.fieldbyname('CPSALLOC').AsFloat) > 0) Then
   Begin
      ShowMessage('Registro No Se Puede Anular (Sólo Consulta))');
      Exit;
   End;

   If DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Registro Ya fue Anulado)');
      Exit;
   End;

   If DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString = 'E' Then
   Begin
      ShowMessage('Registro Fue Eliminado');
      Exit;
   End;

// verifica que en ese momento no se haya realizado alguna actualización con respecto al documento
// que se está provisionando
   xWhere := 'CIAID=' + quotedstr(dblcCia.Text)
      + '  and TDIARID=' + quotedstr(dblcTdiario.Text)
      + '  and CPANOMES=' + quotedstr(meAnoMM.Text)
      + '  and CPNOREG=' + quotedstr(meNoReg.Text);
   If length(BuscaQry('PrvTGE', 'CXP301', '*', xWhere, 'CIAID')) > 0 Then
   Begin
      If (DMCXP.cdsQry.fieldbyname('CP_CONTA').AsString = 'S') Or
         ((DMCXP.cdsQry.fieldbyname('CPMTOLOC').AsFloat - DMCXP.cdsQry.fieldbyname('CPSALLOC').AsFloat) > 0) Then
      Begin
         ShowMessage('Registro No Se Puede Anular (Sólo Consulta))');
         Exit;
      End;
      If DMCXP.cdsQry.fieldbyname('CPESTADO').AsString = 'A' Then
      Begin
         ShowMessage('Registro Ya fue Anulado)');
         Exit;
      End;

      If DMCXP.cdsQry.fieldbyname('CPESTADO').AsString = 'E' Then
      Begin
         ShowMessage('Registro Fue Eliminado');
         Exit;
      End;
   End;

   sSigno := '-';
   If DMCXP.DisplayDescrip2('dspTGE', 'TGE110', 'DOCID,DOCTIPREG', 'DOCID=' + quotedstr(dblcTDoc.text), 'DOCTIPREG') = 'NC' Then
      sSigno := '+'
   Else
      sSigno := '-';

   If DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString = 'P' Then
   Begin
      DMCXP.SaldosAuxiliar(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString, DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString,
         DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString, DMCXP.cdsMovCxP.fieldbyname('PROV').AsString, sSigno,
         DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat, DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat, DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString);

   End;
// Inicio HPC_201702_CXP
   //ActualizaOrdenPago('ANULAR');
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
   xSQL := ' SELECT COUNT(LOG130.NUMORDPAG) CANTIDAD FROM LOG130 ' +
      ' WHERE LOG130.PROV = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('PROV').AsString) +
      ' AND LOG130.ODCID = ' + QuotedStr(dblcdOCompra.Text) +
      '   AND LOG130.NUMORDPAG = ' + QuotedStr(xOrdenPago) +
      '   AND LOG130.ITEM = ' + IntToStr(xnItemOP) +
      '   AND LOG130.CPESTTRA = '+QuotedStr('PROVISIONADO');
// Fin HPC_201803_CXP

   DMCXP.cdsQry2.Close;
   DMCXP.cdsQry2.DataRequest(xSQL);
   DMCXP.cdsQry2.Open;
   If(StrToFloat(DMCXP.cdsQry2.fieldbyname('CANTIDAD').AsString) >= 1) Then
   Begin
     ActualizaOrdenPago('ANULAR');
   End;
// Fin HPC_201702_CXP
   DMCXP.cdsMovCxP.Edit;
   DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString := 'A';
   DMCXP.cdsMovCxP.Post;
      xSQL := ' Update CXP301 '
            + '    set CPESTADO = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString)+','
            + '        CPUSER = '+quotedstr(DMCXP.wUsuario)+', '
            + '        CPFREG = trunc(sysdate), '
            + '        CPHREG = sysdate '
            + '  Where CIAID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
            + '    and TDIARID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString)
            + '    and CPANOMES = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
            + '    and CPNOREG = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo actualizar la cabecera de la provisión - 3889');
         exit;
      End;

      xSQL := ' Update CXP302 '
            + '    set DCPESTDO = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString)+','
            + '        DCPFREG = trunc(sysdate), '
            + '        DCPHREG = sysdate '
            + '  Where CIAID = ' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)
            + '    and TDIARID = ' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('TDIARID').AsString)
            + '    and DCPANOMM = ' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPANOMM').AsString)
            + '    and CPNOREG = ' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPNOREG').AsString);
      Try
          DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo actualizar el detalle de la provisión 3918');
         exit;
      End;

   EstadoDeForma(1, DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString, DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString);

   ShowMessage('<<< Registro Anulado >>>');
   If DMCXP.wTipoAdicion = 'xFiltro' Then
   Begin
      DMCXP.ActualizaFiltro(FPrincipal.GProvision, DMCXP.cdsMovCxP, 'M');
   End;

End;

Procedure TFProvision.AnulaProvision;
Var
   xSQL, xMes, xAno,
      xNmes, xtmonid, ssql: String;
   iX: integer;
Begin
   xMes := DMCXP.strMes(DMCXP.cdsMovCxP.fieldbyname('CPFCMPRB').AsDateTime);
   xAno := DMCXP.strAno(DMCXP.cdsMovCxP.fieldbyname('CPFCMPRB').AsDateTime);

   sSQL := 'SELECT * FROM TGE401 '
      + 'WHERE CIAID=''' + DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString + ''' AND '
      + 'ANO=''' + xAno + ''' AND '
      + 'CLAUXID=''' + DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString + ''' AND '
      + 'AUXID=''' + DMCXP.cdsMovCxP.fieldbyname('PROV').AsString + '''';
   DMCXP.cdsQry.close;
   DMCXP.cdsQry.DataRequest(sSQL);
   DMCXP.cdsQry.open;

   If DMCXP.cdsQry.RecordCount >= 1 Then
   Begin

      xSQL := 'UPDATE TGE401 SET DEBETMN' + xMes + ' = DEBETMN' + xMes + '- '
         + DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsString + ','
         + 'DEBETME' + xMes + ' = DEBETME' + xMes + '- '
         + DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsString;

      xtmonid := DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString;

      If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      Begin
         For iX := StrToInt(xMes) To 12 Do
         Begin
            xNmes := StrZero(IntToStr(iX), 2);
            If DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString = DMCXP.wTMonExt Then
               xsql := xsql + ' ,SALDTME' + xNmes + ' = (CASE WHEN ' + quotedstr(xtmonid) + ' = ''' + DMCXP.wTMonExt + '''' +
                  ' THEN  SALDTME' + xNmes + '- ' +
                  DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsString +
                  ' END),' +
                  ' SALDSME' + xNmes + ' = (CASE WHEN ' + quotedstr(xtmonid) + ' = ''' + DMCXP.wTMonExt + '''' +
                  ' THEN SALDSME' + xNmes + '- ' +
                  DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsString +
                  ' END),' +
                  ' SALDSMN' + xNmes + ' = (CASE WHEN ' + quotedstr(xtmonid) + ' = ''' + DMCXP.wTMonExt + '''' +
                  ' THEN SALDSMN' + xNmes + '- ' +
                  DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsString +
                  ' END)';
            If DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString = DMCXP.wTMonLoc Then
               xsql := xsql + ' ,SALDTME' + xNmes + ' = (CASE WHEN ' + quotedstr(xtmonid) + ' = ''' + DMCXP.wTMonLoc + '''' +
                  ' THEN  SALDTMN' + xNmes + '- ' +
                  DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsString +
                  ' END),' +
                  ' SALDSME' + xNmes + ' = (CASE WHEN ' + quotedstr(xtmonid) + ' = ''' + DMCXP.wTMonLoc + '''' +
                  ' THEN SALDSMN' + xNmes + '- ' +
                  DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsString +
                  ' END),' +
                  ' SALDSMN' + xNmes + ' = (CASE WHEN ' + quotedstr(xtmonid) + ' = ''' + DMCXP.wTMonLoc + '''' +
                  ' THEN SALDSME' + xNmes + '- ' +
                  DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsString +
                  ' END)';
         End;
         xSQL := xSQL + ' WHERE CIAID=' + '''' + DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString + '''' + ' AND '
            + ' ANO=' + '''' + xAno + '''' + ' AND '
            + ' CLAUXID=' + '''' + DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString + '''' + ' AND '
            + ' AUXID=' + '''' + DMCXP.cdsMovCxP.fieldbyname('PROV').AsString + ''' ';
      End;
      If SRV_D = 'ORACLE' Then
      Begin
         For iX := StrToInt(xMes) To 12 Do
         Begin
            xNmes := StrZero(IntToStr(iX), 2);
            If DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString = DMCXP.wTMonExt Then
               xsql := xsql + ' ,SALDTME' + xNmes + ' = (DECODE(' + quotedstr(xtmonid) + ',''' + DMCXP.wTMonExt + ''',' +
                  ' SALDTME' + xNmes + '- ' +
                  DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsString +
                  ' ,0)),' +
                  ' SALDSME' + xNmes + ' = (DECODE(' + quotedstr(xtmonid) + ',''' + DMCXP.wTMonExt + ''',' +
                  ' SALDSME' + xNmes + '- ' +
                  DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsString +
                  ' ,0)),' +
                  ' SALDSMN' + xNmes + ' = (DECODE(' + quotedstr(xtmonid) + ',''' + DMCXP.wTMonExt + ''',' +
                  ' SALDSMN' + xNmes + '- ' +
                  DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsString +
                  ' ,0))';
            If DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString = DMCXP.wTMonLoc Then
               xsql := xsql + ' ,SALDTME' + xNmes + ' = (DECODE(' + quotedstr(xtmonid) + ',''' + DMCXP.wTMonLoc + ''',' +
                  ' THEN  SALDTMN' + xNmes + '- ' +
                  DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsString +
                  ' ,0)),' +
                  ' SALDSME' + xNmes + ' = (DECODE(' + quotedstr(xtmonid) + ',''' + DMCXP.wTMonLoc + ''',' +
                  ' SALDSMN' + xNmes + '- ' +
                  DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsString +
                  ' ,0)),' +
                  ' SALDSMN' + xNmes + ' = (DECODE(' + quotedstr(xtmonid) + ',''' + DMCXP.wTMonLoc + ''',' +
                  ' SALDSME' + xNmes + '- ' +
                  DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsString +
                  ' ,0))';
         End;
         xSQL := xSQL + ' WHERE CIAID=' + '''' + DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString + '''' + ' AND '
            + ' ANO=' + '''' + xAno + '''' + ' AND '
            + ' CLAUXID=' + '''' + DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString + '''' + ' AND '
            + ' AUXID=' + '''' + DMCXP.cdsMovCxP.fieldbyname('PROV').AsString + '''';
      End;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   End
   Else
      ShowMessage('Error : No Existe Registros para Actualizar');

End;

Procedure TFProvision.Z2bbtnAceptaClick(Sender: TObject);
Var
   sSigno, cDocumentos, xFiltro: String;
   xTotMaxSer: Double;
   xValidaDetraccion: String;
Begin
   If DMCXP.wAdmin = 'G' Then Exit;

   If Not DMCXP.Accesos_a_Registros(DMCXP.cdsMovCxP.fieldbyname('CPUSER').AsString) Then
      Exit;

   // Se agrega para validar que grabe los totALES
   If DMCXP.cdsMovCxP.fieldbyname('CTATOTAL').AsString = '' Then
   Begin
      ShowMessage('No se puede Aceptar ( Cuenta de Total no se grabo con exito ), debe grabar nuevamente');
      Exit;
   End;

// Inicio HPC_201604_CXP
// 22/11/2016  Compara Total TO del Detalle versus Saldo de la Provisión para ACEPTAR
   { // Repetido
      // Se agrega para validar que grabe los totALES
   If DMCXP.cdsMovCxP.fieldbyname('CTATOTAL').AsString = '' Then
   Begin
      ShowMessage('No se puede Aceptar, debe grabar nuevamente( Cuentas de Total )');
      Exit;
   End;
   }
   xSQL := 'Select DCPMOORI '
      +    '  from CXP302 '
      +    ' where CIAID=' + quotedstr(dblcCia.Text)
      +    '   and DCPANOMM=' + quotedstr(meAnoMM.Text)
      +    '   and TDIARID=' + quotedstr(dblcTdiario.Text)
      +    '   and CPNOREG=' + quotedstr(meNoReg.Text)
      +    '   and TIPDET=''TO'' ';
   DMCXP.cdsQry.close;
   DMCXP.cdsQry.dataRequest(xSQL);
   DMCXP.cdsQry.Open;

   If DMCXP.cdsQry.RecordCount=0 then
   Begin
      ShowMessage('No hay en el detalle registro que identifique al Total');
      Exit;
   End;

   If DMCXP.cdsQry.FieldByName('DCPMOORI').AsFloat <> DMCXP.cdsMovCxP.fieldbyname('CPSALORI').AsFloat Then
   Begin
      ShowMessage('El Saldo Total del Detalle no es igual al Saldo a Pagar, revise');
      Exit;
   End;

   {
   If DMCXP.cdsMovCxP.fieldbyname('CPMTOORI').AsFloat <> DMCXP.cdsMovCxP.fieldbyname('CPSALORI').AsFloat Then
   Begin
      ShowMessage('No se puede Aceptar, debe grabar nuevamente');
      Exit;
   End;
   }
// Final HPC_201604_CXP

   Try
      DMCXP.cdsDetCxP.DisableControls;
      screen.Cursor := crHOURGLASS;
      pnlActuali.Visible := true;
      pnlActuali.Refresh;
      sSigno := '+';
      If DMCXP.DisplayDescrip2('dspTGE', 'TGE110', 'DOCID,DOCTIPREG', 'DOCID=' + quotedstr(dblcTDoc.text), 'DOCTIPREG') = 'NC' Then
         sSigno := '-'
      Else
         sSigno := '+';

      If (DMCXP.cdsMovCxP.Modified) Or (DMCXP.cdsMovCxP.ChangeCount > 0) Then
         Raise exception.Create(' Debe Grabar primero las Actualizaciones realizadas');

      If Not AsientoCuadra Then
         Raise exception.Create(' Error:  Asiento NO Cuadra ');

      If dblcTdiario.Text = '08' Then
      Begin
         xValidaDetraccion := ValidaDetraccion(DMCXP.cdsDetCxP);
         If length(xValidaDetraccion) > 0 Then
         Begin
            If MessageDlg(xValidaDetraccion + chr(13) + ' ¿Desea continuar? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;
         End;
      End;

   // Limite permitido por SUNAT para registrar recibos por honorarios
      //If (dblcClAux.text = 'H') And (dblcTDoc.text = '02') Then
      If dblcTDoc.text = '02' Then
      Begin
         xSQL := 'select TASAID, TASACAN, TASAMTO from TGE108 a WHERE TASAFLG=''4''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;
         xTotMaxSer := DMCXP.cdsQry.FieldByName('TASAMTO').Asfloat;

         xSQL := 'select NVL(SUM(CASE WHEN TMONID=''N'' '
               + '       THEN NVL(CPGRAVAD,0)+NVL(CPNOGRAV,0)+NVL(CPGRAVAD2,0)+nvl(ADQ_NO_GRAV,0) '
               + '       ELSE (NVL(CPGRAVAD,0)+NVL(CPNOGRAV,0)+NVL(CPGRAVAD2,0)+nvl(ADQ_NO_GRAV,0))*CPTCAMPR END),0) TOTSER '
               + '  from CXP301 '
               + ' Where CLAUXID=' + quotedstr(dblcClAux.Text)
               + '   and PROV=' + quotedstr(dblcdProv.Text)
               + '   and CPANOMES=' + quotedstr(meAnoMM.Text)
          //     + '   and ( CPESTADO IN (''P'',''C'') or'
               + '   and (CPESTADO IN (''I'') AND DOCID=' + quotedstr(dblcTDoc.text)
               + '                            AND CPSERIE=' + quotedstr(edtSerie.text)
               + '                            AND CPNODOC=' + quotedstr(edtNoDoc.text)
               + '        )';

         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;
         If (DMCXP.cdsQry.FieldByName('TOTSER').AsFloat > xTotMaxSer) And (DMCXP.cdsMovCxP.FieldByName('CPIGV').AsFloat + DMCXP.cdsMovCxP.FieldByName('CPIGV2').AsFloat <= 0) Then
         Begin
            xSQL := 'select DOCID||''   ''||CPSERIE||''  -  ''||CPNODOC DOCUM, '
                  + '       case when TMONID=''N'' '
                  + '            then NVL(CPGRAVAD,0)+NVL(CPNOGRAV,0) '
                  + '            else (NVL(CPGRAVAD,0)+NVL(CPNOGRAV,0))*CPTCAMPR END TOTAL '
                  + '  from CXP301 '
                  + ' Where CLAUXID=' + quotedstr(dblcClAux.Text)
                  + '   and PROV=' + quotedstr(dblcdProv.Text)
                  + '   and CPANOMES=' + quotedstr(meAnoMM.Text)
                  + '   and CPESTADO IN (''P'',''C'')';
            DMCXP.cdsQry.Close;
            DMCXP.cdsQry.DataRequest(xSQL);
            DMCXP.cdsQry.Open;
            cDocumentos := '';
            While Not DMCXP.cdsQry.Eof Do
            Begin
               cDocumentos := cDocumentos + DMCXP.cdsQry.FieldByName('DOCUM').AsString + '   S/.' + DMCXP.cdsQry.FieldByName('TOTAL').AsString + chr(13);
               DMCXP.cdsQry.Next;
            End;
            ShowMessage('El proveedor ' + dblcClAux.text + ' - ' + dblcdProv.text + ' - ' + edtProv.Text + ',' + chr(13) +
               'supera el monto limite permitido por SUNAT de S/.' + FloatToStr(xTotMaxSer) + '. ' + chr(13) +
               'Debe registrar el documento con los Impuestos de Retenciones.' + chr(13) +
               chr(13) + cDocumentos);

         // Revisa en maestro de proveedores si tiene exoneración de retención
            xSQL := 'select PROVEXONER '
               + 'from TGE201 '
               + 'Where CLAUXID=' + quotedstr(dblcClAux.Text)
               + '  and PROV=' + quotedstr(dblcdProv.Text);
            DMCXP.cdsQry.Close;
            DMCXP.cdsQry.DataRequest(xSQL);
            DMCXP.cdsQry.Open;
            If DMCXP.cdsQry.FieldByname('PROVEXONER').AsString <> '' Then
            Begin
               ShowMessage('El proveedor ' + dblcClAux.text + ' - ' + dblcdProv.text + ' - ' + edtProv.Text + ',' + chr(13) +
                  'Tiene Formulario de Exoneración No.' + trim(DMCXP.cdsQry.FieldByname('PROVEXONER').AsString) + '.' + chr(13));
            End
            Else
               Exit;
         End;

      // Inicio HPC_201701_CXP
      // Considera Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00
         If xValorMinRta4ta>0 then
         Begin
            If DMCXP.cdsQry.FieldByName('TOTSER').AsFloat>xValorMinRta4ta then
            Begin
               If not validaSusp4ta(dblcClAux.Text, dblcdProv.Text) then
               Begin
                  ShowMessage('El Proveedor no tiene Suspensión de 4ta.Categoría, regularize por el Maestro de Proveedores');
                  Exit;
               End;
            End;
         End;
      // Fin HPC_201701_CXP

      End;

      If DMCXP.wVRN_OrdenCompra = 'S' Then
      Begin
         If FRound(xTotFac, 15, 2) > FRound(xImpAmort, 15, 2) Then
         Begin
            Raise exception.Create('Monto de Factura es Mayor que la Orden de Compra');
         End;
      End
      Else
      Begin
         If dblcdOCompra.Text <> '' Then
         Begin
            If FRound(xTotFac, 15, 2) > FRound(xImpAmort, 15, 2) Then
            Begin
               Raise exception.Create('Monto de Factura es Mayor que la Orden de Compra.');
            End;
         End;
      End;

      If (cbSujetoaRetIGV.visible) And (Not cbSujetoaRetIGV.Checked) Then
      Begin
         If (DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat >= xTasaMonto) Then
            If Not MessageDlg('Atención : La provisión Debería estar sujeta a Retención del I.G.V.'
               + #13 + #13 + 'Desea aceptar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
               exit;
      End;

   // Refresca DETALLE
      xFiltro := 'CIAID=' + quotedstr(dblcCia.Text)
         + ' and TDIARID=' + quotedstr(dblcTdiario.Text)
         + ' and DCPANOMM=' + quotedstr(meAnoMM.Text)
         + ' and CPNOREG=' + quotedstr(meNoReg.Text);
      Filtracds(DMCXP.cdsDetCxP, 'Select * from CXP302 Where ' + xFiltro);
      DMCXP.cdsDetCxP.IndexFieldNames := 'DCPREG';

   // verifica que Total Debe cuadre con Total Haber
      DMCXP.CuadraAsiento;

      DMCXP.cdsMovCxP.Edit;
      DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString := 'P';
      DMCXP.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat;
      DMCXP.cdsMovCxP.fieldbyname('CPUSER').AsString := DMCXP.wUsuario; // usuario que registra
      DMCXP.cdsMovCxP.fieldbyname('CPFREG').AsDateTime := Date; // fecha que registra Usuario
      DMCXP.cdsMovCxP.fieldbyname('CPHREG').AsDateTime := Time; // Hora de Registro de Usuario
   ///////////////////////////////////////////////////////////////////////////////////////////////////////
   // guardamos el valor en el campo backup, para usarlo posteriormente en el modulo de CAJA- CAJA228.pas
   // para ser usado en la DETRACCION
      DMCXP.cdsMovCxP.FieldByName('CPMTOORIB').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPMTOORI').AsFloat;
   ///////////////////////////////////////////////////////////////////////////////////////////////////////

   // Marca para indicar q esta pendiente de aplicar la NC a un documento
      If (sSigno = '-') Then
         DMCXP.cdsMovCxP.fieldbyname('FLAGVAR').AsString := 'P';
   DMCXP.cdsMovCxP.Post;
   DMCXP.DCOM1.AppServer.IniciaTransaccion;
   ////////////////////////////////////////////////////////////////////////////////////////////////////
   // insertamos el registro al file CXP309, por tratarse de una provision que se le aplica DETRACCION
   //
      If DMCXP.cdsMovCxP.fieldbyname('DTRPORC').AsFloat > 0 Then
      Begin
      /// ACCESA AL CXP302 PARA TOMAR LOS DATOS DEL TIPDET='I4' - DETRACCION
         xSQL := 'SELECT * '
               + '  FROM CXP302 '
               + ' WHERE CIAID=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CIAID').AsString)
               + '   AND TDIARID=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString)
               + '   AND DCPANOMM=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString)
               + '   AND CPNOREG=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString)
               + '   AND CLAUXID=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CLAUXID').AsString)
               + '   AND DCPAUXID=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('PROV').AsString)
               + '   AND TIPDET=' + quotedstr('I4')
               + '   AND DCPESTDO=' + quotedstr('I');
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.Filtered := False;
         DMCXP.cdsQry.Filter := '';
         DMCXP.cdsQry.IndexName := '';
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.open;

         xSQL := 'Update CXP302 '
               + '   set FLAGVAR = ''N'', '
               + '       DCPFREG = trunc(sysdate), '
               + '       DCPHREG = sysdate '
               + ' where CIAID=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CIAID').AsString)
               + '   and TDIARID=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString)
               + '   and DCPANOMM=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString)
               + '   and CPNOREG=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString)
               + '   and CLAUXID=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CLAUXID').AsString)
               + '   and DCPAUXID=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('PROV').AsString)
               + '   and TIPDET=' + quotedstr('I4')
               + '   and DCPESTDO=' + quotedstr('I');
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se puede actualizar a N el Flag en el detalle de la provisión');
            exit;
         End;

         xSQL := 'Insert into CXP309(DTRFLAG, CIAID, TDIARID, CPANOMES, CPNOREG, CLAUXID, '
               + '                   PROV, DOCID, CPSERIE, CPNODOC, CPFCMPRB, CPFEMIS, '
               + '                   CPFVCMTO, TMONID, CPTCAMPR, CPMTOORI, CPMTOLOC, '
               + '                   CPMTOEXT, CPSALORI, CPSALLOC, CPSALEXT, DTRPORC, '
               + '                   CPESTADO, DCPLOTE, CP_CONTA, CTATOTAL, CPTOTOT, '
               + '                   CPUSER, CPFREG, CPHREG) '
               + 'values(''S'','
               +         quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString) + ','
               +         quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString) + ','
               +         quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString) + ','
               +         quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString) + ','
               +         quotedstr(DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString) + ','
               +         quotedstr(DMCXP.cdsMovCxP.fieldbyname('PROV').AsString) + ','
               +         quotedstr(DMCXP.cdsMovCxP.fieldbyname('DOCID').AsString) + ','
               +         quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString) + ','
               +         quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNODOC').AsString) + ','
               +         quotedstr(datetostr(DMCXP.cdsMovCxP.FieldByName('CPFCMPRB').AsDateTime)) + ','
               +         quotedstr(datetostr(DMCXP.cdsMovCxP.fieldbyname('CPFEMIS').AsDateTime)) + ','
               +         quotedstr(datetostr(DMCXP.cdsMovCxP.fieldbyname('CPFVCMTO').AsDateTime)) + ','
               +         quotedstr(DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString) + ','
               +         floattostr(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat) + ','
               +         floattostr(DMCXP.cdsQry.fieldbyname('DCPMOORI').AsFloat) + ','
               +         floattostr(DMCXP.cdsQry.fieldbyname('DCPMOLOC').AsFloat) + ','
               +         floattostr(DMCXP.cdsQry.fieldbyname('DCPMOEXT').AsFloat) + ','
               +         floattostr(DMCXP.cdsQry.fieldbyname('DCPMOORI').AsFloat) + ','
               +         floattostr(DMCXP.cdsQry.fieldbyname('DCPMOLOC').AsFloat) + ','
               +         floattostr(DMCXP.cdsQry.fieldbyname('DCPMOEXT').AsFloat) + ','
               +         floattostr(DMCXP.cdsMovCxP.FieldByName('DTRPORC').AsFloat) + ','
               +         quotedstr(DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString) + ','
               +         quotedstr(DMCXP.cdsMovCxP.FieldByName('DCPLOTE').AsString) + ','
               +         quotedstr('N') + ','
               +         quotedstr(DMCXP.cdsQry.FieldByName('CUENTAID').AsString) + ','
               +         quotedstr(DMCXP.cdsQry.FieldByName('CPTOID').AsString) + ','
               +         quotedstr(DMCXP.wUsuario) + ','
               + '       trunc(sysdate),'
               + '       sysdate)';
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      try
        xSQL :=     'CALL SP_CNT_REC_SAL('
        +QuotedStr(DMCXP.cdsMovCxP.FieldByName('CIAID').AsString)+','
        +QuotedStr(DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString)+','
        +QuotedStr(DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString)+','
        +QuotedStr(DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString)+','
        +QuotedStr(dbeDetrac.Text)+')' ;
        DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);
      Except
          showmessage('Error al intentar recalcular los saldos');
          exit;
      Raise;
      End;
// Fin HPC_201707_CXP 
      xSQL := 'Update CXP301 '
             +'   set CPESTADO =' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString)+','
             +'       CPTCAMAJ =' + floattostr(DMCXP.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat)+','
             +'       CPUSER =' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CPUSER').AsString)+','
             +'       CPFREG =trunc(sysdate) '+','
             +'       CPHREG =sysdate '+','
             +'       CPMTOORIB =' + floattostr(DMCXP.cdsMovCxP.FieldByName('CPMTOORIB').AsFloat)+','
             +'       FLAGVAR =' + quotedstr(DMCXP.cdsMovCxP.FieldByName('FLAGVAR').AsString)
             +' where CIAID=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CIAID').AsString)
             +'   and TDIARID=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString)
             +'   and CPANOMES=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString)
             +'   and CPNOREG=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede actualizar la cabecera de la provisión');
         exit;
      End;

      xSQL := 'Update CXP302 '
             +'   set DCPESTDO =''P'', '
             +'       DCPFREG = trunc(sysdate), '
             +'       DCPHREG = sysdate '
             +' where CIAID=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CIAID').AsString)
             +'   and TDIARID=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString)
             +'   and DCPANOMM=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString)
             +'   and CPNOREG=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString)
             +'   and CLAUXID=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('CLAUXID').AsString)
             +'   and DCPAUXID=' + quotedstr(DMCXP.cdsMovCxP.FieldByName('PROV').AsString);
       Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
       Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede actualizar el campo DCPESTDO a P el detalle de la provisión');
         exit;
       End;

      DMCXP.SaldosAuxiliar(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString, DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString,
      DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString, DMCXP.cdsMovCxP.fieldbyname('PROV').AsString, sSigno,
      DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat, DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat, DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString);

      EstadoDeForma(1, DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString, DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString);

      If wActuaPresu Then
         CalculoNivel;

   // Actualiza Orden de Compra
// Inicio HPC_201803_CXP
// Se implementa debido a la Solicitud de Orden de Pago
      If dblcdOCompra.Text <> '' Then
      Begin
//         If dblcCia.Text = '04' Then
//         Begin
         xSQL := ' select ciaid, numordpag, odcciaid, odcid, prov, cpciaid, cpanomes, tdiarid, cpnoreg, docid, cpserie, cpnodoc, cpfrecep, cpfemis, cpfvcmto, cpobs, tmonid, cptcampr, '
               + ' basimp, igv, total, cpesttra, cpfectra, cpusutra, obsanu, usuanu, fecanu, usureg, fecreg, usumod, fecmod, item, bancoid, bancotmonid, banconumcta, bancocci, ccosid '
               + '  from LOG130 '
               + ' Where CIAID=' + quotedstr(dblcCia.Text)
               + '   and PROV=' + quotedstr(dblcdProv.Text)
               + '   and ODCID=' + quotedstr(dblcdOCompra.Text);
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;
         If DMCXP.cdsQry.FieldByname('odcciaid').AsString <> '' Then
         Begin

             xSQL := ' Update LOG304 '
                   + ' set ODCTIMPAMOR=NVL(ODCTIMPAMOR,0)+' + FloatToStr(FRound(xTotFac, 15, 2))
                   + ' Where CIAID=' + quotedstr(DMCXP.cdsQry.FieldByname('odcciaid').AsString)
                   + '   and PROV=' + quotedstr(dblcdProv.Text)
                   + '   and ODCID=' + quotedstr(dblcdOCompra.Text);
 (*        End
         Else
         Begin
            xSQL := ' Update LOG304 '
               + ' set ODCTIMPAMOR=NVL(ODCTIMPAMOR,0)+' + FloatToStr(FRound(xTotFac, 15, 2))
               + ' Where CIAID = ' + QuotedStr('02')
               + '   and PROV=' + quotedstr(dblcdProv.Text)
               + '   and ODCID=' + quotedstr(dblcdOCompra.Text);
         End;
 *)
             Try
                DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
             Except
             End;
         end;
      End;
// Fin HPC_201803_CXP
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
      xSQL := 'Select * '
            + '  from CXP301 '
            + ' Where CIAID = ' + quotedstr(dblcCia.Text)
            + '   and CPANOMES = ' + quotedstr(meAnoMM.Text)
            + '   and TDIARID = ' + quotedstr(dblcTdiario.Text)
            + '   and CPNOREG = ' + quotedstr(meNoReg.Text);
      DMCXP.cdsMovCxP.Close;
      DMCXP.cdsMovCxP.DataRequest(xSQL);
      DMCXP.cdsMovCxP.Open;

      ActualizaOrdenPago('ACEPTAR');
      ShowMessage(' Registro de Provisión Aceptado ');
      If DMCXP.wTipoAdicion = 'xFiltro' Then
      Begin
         DMCXP.ActualizaFiltro(FPrincipal.GProvision, DMCXP.cdsMovCxP, 'M');
      End;

      xSQL := 'SELECT A.BANCOID, BANCOABR, CCBCOID, ECNOCHQ, ECFEMICH, ECSALMN, ECSALME, '
            + '       0.00 PAGOMN, 0.00 PAGOME, ECTCAMB, CIAID, TDIARID, ECANOMM, ECNOCOMP '
            + '  FROM CAJA302 A, TGE105 B '
            + ' Where A.CIAID=' + quotedstr(dblcCia.Text)
            + '   and A.CLAUXID=' + quotedstr(dblcClAux.text)
            + '   and A.PROV=' + quotedstr(dblcdProv.Text)
            + '   and (ECSALMN>0 AND ECSALME>0) '
            + '   and A.BANCOID=B.BANCOID';
      DMCXP.cdsDetCanje.Close;
      DMCXP.cdsDetCanje.DataRequest(xSQL);
      DMCXP.cdsDetCanje.Open;

      If DMCXP.cdsDetCanje.Recordcount > 0 Then
      Begin
         If MessageDlg('Desea Aplicar Pagos' + chr(13) +
            '   ¿Esta Seguro?     ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
            exit;
         Try
            FAplicaCaja := TFAplicaCaja.Create(Self);
            FAplicaCaja.xModo := 'NUEVO';
            FAplicaCaja.ShowModal;
         Finally
            FAplicaCaja.Free;
         End
      End;

   Finally
      DMCXP.cdsNivelPresu.close;
      DMCXP.cdsDetCxP.EnableControls;
      pnlActuali.Visible := false;
      screen.Cursor := crDEFAULT;
   End;
End;

Procedure TFProvision.bbtnCalcClick(Sender: TObject);
Var
   xSQL: String;
Begin
// se habilitará el botón que recalcula totales sólo si la provisión está aceptada
// y aún no está cancelada

   If (DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString <> 'P') Then
   Begin
      ShowMessage(' Sólo se puede recalcular Provisiones Aceptadas');
      exit;
   End;

   If DMCXP.cdsMovCxP.FieldByName('CP_CONTA').AsString = 'S' Then
   Begin
      ShowMessage(' No se puede recalcular Provisiones Contabilizadas');
      exit;
   End;

   If DMCXP.MesCerrado(copy(meAnoMM.text, 5, 2), copy(meAnoMM.text, 1, 4), dblcCia.text) Then
   Begin
      ShowMessage(' Mes Cerrado!!!, No se puede Recalcular registro');
      exit;
   End;

   If MessageDlg('¿ Se actualizará el registro: ' + DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString + ', desea continuar ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      wSigueGrab := True;

      sCalcSaldos := 'N';

      DMCXP.cdsDetCxP.DisableControls;
      DMCXP.cdsDetCxP.First;
      While Not DMCXP.cdsDetCxP.Eof Do
      Begin
         DMCXP.cdsDetCxP.Edit;
         bbtnRegOkClick(Self);
         DMCXP.cdsDetCxP.Next;
      End;
      DMCXP.cdsDetCxP.EnableControls;

      Z2bbtnGrabaClick(self); // Recalcula calcula detalle

      RecalculaTotales; // Recalcula Cabecera

      if not wSigueGrab then exit;

      sCalcSaldos := 'S';

      If DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString = 'S' Then
      Begin
         xSQL := 'delete from CNT301 '
               + ' where CIAID=' + quotedstr(dblcCia.Text)
               + '   and CNTANOMM=' + quotedstr(meAnoMM.Text)
               + '   and TDIARID=' + quotedstr(dblcTdiario.Text)
               + '   and CNTCOMPROB=' + quotedstr(meNoReg.Text);
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.ProviderName := 'dspTGE';
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Execute;

         xSQL := 'delete from CNT300 '
               + ' where CIAID=' + quotedstr(dblcCia.Text)
               + '   and CNTANOMM=' + quotedstr(meAnoMM.Text)
               + '   and TDIARID=' + quotedstr(dblcTdiario.Text)
               + '   and CNTCOMPROB=' + quotedstr(meNoReg.Text);
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Execute;

         DMCXP.GeneraContab(dblcCia.Text, dblcTDiario.Text, meAnoMM.Text, meNoReg.text, Self, 'C');
      End;

      ShowMessage('Actualización finalizada');
   End;
End;

Procedure TFProvision.dbgDetCxPDblClick(Sender: TObject);
Begin
   If btnActReg.Enabled Then
   Begin
      If (DMCXP.cdsDetCxP.State = dsInsert) Or (DMCXP.cdsDetCxP.State = dsEdit) Then
         DMCXP.cdsDetCxP.Post;

      pnlDetalle.Enabled := False;
      pnlPie.Enabled := False;
      pnlRegistro.Visible := True;
      pnlRegistro.BringToFront;
      pnlRegistro.SetFocus;
      DMCXP.cdsDetCxP.Edit;
      dblcTipReg.Text := DMCXP.cdsDetCxP.FieldByName('TREGID').AsString;
      dblcTipRegExit(Sender);

      If dblcdCCosto.Text <> '' Then
      Begin
         DMCXP.cdsCCosto.IndexFieldNames := 'CCOSID';
         DMCXP.cdsCCosto.SetKey;
         DMCXP.cdsCCosto.FieldByName('CCOSID').AsString := dblcdCCosto.Text;
         DMCXP.cdsCCosto.GotoKey;
         edtCCosto.Text := DMCXP.cdsCCosto.FieldByName('CCOSDES').AsString;
      End
      Else
      Begin
         edtCCosto.Text := '';
      End;
      //**
      dblcTipReg.Enabled := False;
      dblcdCnPEgr.SetFocus;
   End;
End;

Procedure TFProvision.btnActRegClick(Sender: TObject);
Begin
   XFLAGCCOS := '0';
   pnlDetalle.Enabled := False;
   pnlPie.Enabled := False;
   pnlRegistro.Visible := True;
   pnlRegistro.BringToFront;
   pnlRegistro.SetFocus;

   numreg := numreg + 1;
   DMCXP.cdsDetCxP.Last;
   numreg := DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger + 1;

   DMCXP.cdsDetCxP.Append;
   If DMCXP.wVRN_GlosaRep = 'S' Then
      cbRepGlosa.Checked := True;

   If lblsusp4c.visible = True Then
   Begin
      xTemTReg :='10';
      dblcTipReg.Text :=xTemTReg;
   End
   Else
   Begin
      dblcTipReg.Text := xTemTReg;
   End;

   DMCXP.cdsDetCxP.FieldByName('TREGID').AsString := xTemTReg;
   DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString := xTemCpto;
   DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xTemCta;
   DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString := xTemDH;
   DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger := numreg;

   edtCCosto.Text := '';
   edtTipReg.text := '';
   dblcTipReg.Enabled := True;
   dblcTipReg.SetFocus;
   xNuevoDet := True;
End;

Procedure TFProvision.bbtnRegOkClick(Sender: TObject);
Var
   xSQL, xTipDet, xWhere: String;
   xDiferencia, xMontoOri, xIGVx, xTotMG, xTotTO, xCalc: Double;
   xRecord: Integer;
   cdsClone: TwwClientDataSet;
Begin
   // VALIDA LA CUENTA DEL CONCEPTO
   If (DMCXP.LaCuentaSeRegistraSoloEnME(dblcCia.text, dblcdCnpEgr.text, '')) And (dblcTMon.text = DMCXP.wTMonLoc) Then
   Begin
      Raise Exception.Create('La cuenta ' + DMCXP.cdsQry.FieldByName('CUENTAID').AsString + ' del Concepto ' + dblcdCnpEgr.text + ' Se registra sólo en Moneda Extranjera.');
   End;
   If cbRepGlosa.Checked Then
   Begin
      xGlosaRep := DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString;
   End;
   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   If xorigen='CxP130' Then
   Begin
       xGlosaRep := FListaOrdenPago.xdbeGlosaOP;

       DMCXP.cdsDetCxP.Edit;
       dblcTipReg.Text := FListaOrdenPago.xdblcTRegistroOP;
       edtTipReg.Text := FListaOrdenPago.xedtTRegistroOP;
       dblcdCnpEgr.Text := FListaOrdenPago.xdblcdCnpEgrOP;
       dbeCuenta.Text := FListaOrdenPago.xdbeCuentaOP;
       dbeGlosa.Text := FListaOrdenPago.xdbeGlosaOP;
       dblcdCCosto.Text  := FListaOrdenPago.xdblcdCCostoOP;
       edtCCosto.Text := FListaOrdenPago.xedtCCostoOP;

       xWhere := 'TRegId=' + '''' + FListaOrdenPago.xdblcTRegistroOP + '''';
       DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString := BuscaQry('PrvTGE', 'TGE113', 'TIPDET', xWhere, 'TIPDET');
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
       if (dblcTipReg.Text = '10') or (dblcTipReg.Text='08') then
       begin
          DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := Fround((DMCXP.cdsQry1.FieldByName('BASIMP').AsFloat + DMCXP.cdsQry1.FieldByName('IGV').AsFloat),15,2);
       end
       else
       begin
          DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsQry1.FieldByName('BASIMP').AsFloat;
       end;
// Fin HPC_201803_CXP
   End;
   // Fin HPC_201702_CXP
   xTipDet := DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString;
   xIGVx := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;

   If xTipDet = 'I1' Then
   Begin
      cdsClone := TwwClientDataSet.Create(Nil);
      cdsClone.CloneCursor(DMCXP.cdsDetCxP, True);
   End;

   xDiferencia := 0;
   If length(dblcTipReg.Text) = 0 Then
   Begin
      dblcTipReg.SetFocus;
      Raise Exception.Create('Debe Ingresar Tipo de Registro');
   End;
   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   If xorigen = 'CxP201' Then
   Begin
   If length(dbeImporte.Text) = 0 Then
   Begin
      dbeImporte.SetFocus;
      Raise Exception.Create('Debe Ingresar Importe de Registro');
   End;
   End;
   // Fin HPC_201702_CXP

   If length(dblcdCnpEgr.Text) = 0 Then
   Begin
      dblcdCnpEgr.SetFocus;
      Raise Exception.Create('Debe Ingresar Concepto');
   End;

  //** (3) si lleva Centro de Costo
   If xCta_Ccos = 'S' Then
   Begin
      If DMCXP.cdsCnpEgr.fieldbyname('CCOSPORCEN').AsString = 'S' Then
      Else
      Begin
         If length(edtCCosto.Text) = 0 Then
         Begin
            Raise Exception.Create('Falta ingresar tipo de Costo');
         End;
      End;
   End;

   If length(dbeCuenta.Text) = 0 Then
   Begin
      Raise Exception.Create('Debe seleccionar el Tipo de Costo');
   End;
   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   If xorigen='CxP130' Then
   Begin
      xTemTReg := dblcTipReg.Text;
      xTemCpto := dblcdCnpEgr.Text;
      xTemCta := dbeCuenta.Text;
      xTemDH := 'D';
   End
   Else
   Begin
      xTemTReg := DMCXP.cdsDetCxP.FieldByName('TREGID').AsString;
      xTemCpto := DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString;
      xTemCta := DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString;
      xTemDH := DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString;
   End;
   // Fin HPC_201702_CXP
   xtippre := dblcTipPre.Text;

   // Inicio HPC_201702_CXP
  // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   If xorigen = 'CxP130' Then
    Begin

      numreg := numreg + 1;
      numreg := DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger + 1;
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger := numreg;

      DMCXP.cdsDetCxP.FieldByName('TREGID').AsString := xTemTReg;
      DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString := xTemCpto;
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xTemCta;
      DMCXP.cdsDetCxP.FieldByName('DCPDH').ASString := xTemDH;
      DMCXP.cdsDetCxP.FieldByName('TIPPRESID').AsString := xTipPre;
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGlosaRep;

      DMCXP.cdsDetCxP.FieldByName('CIAID').AsString := DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString;
      DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString := DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString := DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString := copy(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString, 1, 4);
      DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString := DMCXP.cdsMovCxP.fieldbyname('DCPLOTE').AsString;
      DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString := 'CP';
      DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString := FProvision.dblcClAux.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsMovCxP.fieldbyname('PROV').AsString;
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString := DMCXP.cdsMovCxP.fieldbyname('DOCID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString := DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString := DMCXP.cdsMovCxP.fieldbyname('CPNODOC').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat := FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 7, 3);
      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFEMIS').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFVCMTO').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFCMPRB').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'I'; // Activo
      DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString := DMCXP.wUsuario;
      DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFREG').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPHREG').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPMM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString := DMCXP.cdsMovCxP.fieldbyname('CPDD').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString := DMCXP.cdsMovCxP.fieldbyname('CPTRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPSEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString := DMCXP.cdsMovCxP.fieldbyname('CPSS').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString := DMCXP.cdsMovCxP.fieldbyname('CPAATRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPAASEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString := DMCXP.cdsMovCxP.fieldbyname('CPAASS').AsString;
      DMCXP.cdsDetCxP.FieldByName('TMONID').AsString := DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString;
      xNuevoDet := true;
   End;
   // Fin HPC_201702_CXP
   If xDistri <> 'S' Then // si no tiene distribución automatica por Centro de Costo
   Begin
      If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc Then
      Begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFLoat;
         If DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat > 0 Then
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat / DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 2);
      End
      Else
      Begin
         If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonExt Then
         Begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat * DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         End
         Else
         Begin // Otras Monedas Extranjeras
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat * DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 15, 2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat / DMCXP.cdsMovCxP.fieldbyname('CPTCAMDOL').AsFloat, 15, 2);
         End;
      End;

      If xNuevoDet Then
      Begin
         DMCXP.cdsDetCxP.Edit;
         DMCXP.cdsDetCxP.Post;

         xSQL := ' Insert into CXP302(CIAID, TDIARID, CPNOREG, DCPANOC, DCPANOMM, DCPLOTE, TRANSID, CPTOID, CUENTAID, '
               + '                    CLAUXID, DCPAUXID, DOCID, CPSERIE, CPNODOC, DCPGLOSA, DCPDH, CCOSID, CPTCAMPR, '
               + '                    DCPMOORI, DCPMOLOC, DCPMOEXT, CPFEMIS, CPFVCMTO, DCPFCOM, DCPESTDO, '
               + '                    DCPUSER, DCPFREG, DCPHREG, DCPMM, DCPDD, DCPTRI, DCPSEM, DCPSS, DCPAATRI, '
               + '                    DCPAASEM, DCPAASS, TREGID, TMONID, TIPDET, DCPREG ) '
               + ' Values( ' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('TDIARID').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPNOREG').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPANOC').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPANOMM').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPLOTE').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('TRANSID').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPTOID').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CUENTAID').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CLAUXID').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPAUXID').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DOCID').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPSERIE').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPNODOC').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPGLOSA').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+', '
                             + floattostr(DMCXP.cdsDetCxP.fieldbyname('CPTCAMPR').AsFloat)+', '
                             + floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat)+', '
                             + floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOLOC').AsFloat)+', '
                             + floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOEXT').AsFloat)+', '
                             + quotedstr(datetostr(DMCXP.cdsDetCxP.fieldbyname('CPFEMIS').AsDateTime))+', '
                             + quotedstr(datetostr(DMCXP.cdsDetCxP.fieldbyname('CPFVCMTO').AsDateTime))+', '
                             + quotedstr(datetostr(DMCXP.cdsDetCxP.fieldbyname('DCPFCOM').AsDateTime))+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPESTDO').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPUSER').AsString)+', '
                             + ' TRUNC(SYSDATE), '
                             + ' SYSDATE,  '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPMM').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPDD').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPTRI').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPSEM').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPSS').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPAATRI').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPAASEM').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPAASS').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('TREGID').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('TMONID').AsString)+', '
                             + quotedstr(DMCXP.cdsDetCxP.fieldbyname('TIPDET').AsString)+', '
                             + inttostr(DMCXP.cdsDetCxP.fieldbyname('DCPREG').AsInteger)+' )';
         try
             DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         except
             ShowMessage('No se puede ingresar el detalle de la provisión');
             exit;
         end;
         DMCXP.cdsDetCxP.Append;
         dblcTipReg.Text := xTemTReg;
         DMCXP.cdsDetCxP.FieldByName('TREGID').AsString := xTemTReg;
         DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString := xTemCpto;
         DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xTemCta;
         DMCXP.cdsDetCxP.FieldByName('DCPDH').ASString := xTemDH;
         DMCXP.cdsDetCxP.FieldByName('TIPPRESID').AsString := xTipPre;
         // Inicio HPC_201702_CXP
         // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
         If xorigen = 'CxP201' Then
         Begin
         numreg := numreg + 1;
         DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger := numreg;
         End;
         // Fin HPC_201702_CXP
         If xGlosaRep <> '' Then
            DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGlosaRep
         Else
            DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xglosa;

         // Inicio HPC_201702_CXP
         // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
         If xorigen = 'CxP201' Then
         Begin
         edtCCosto.Text := '';
         xNuevoDet := True;
         dblcTipReg.Enabled := True;
         dblcTipReg.SetFocus;
         End;
         // Fin HPC_201702_CXP
      End
      Else
      Begin
         DMCXP.cdsDetCxP.Edit;
         DMCXP.cdsDetCxP.FieldByName('DCPUSER').ASString := DMCXP.wUsuario;
         DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime := Date;
         DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime := Time;

            xSQL := ' Update CXP302 '
                  + '    set TREGID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('TREGID').AsString)+','
                  + '        CPTOID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPTOID').AsString)+','
                  + '        CUENTAID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CUENTAID').AsString)+','
                  + '        DCPGLOSA = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPGLOSA').AsString)+','
                  + '        CCOSID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+','
                  + '        TIPPRESID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('TIPPRESID').AsString)+','
                  + '        PARPRESID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('PARPRESID').AsString)+','
                  + '        DCPDH = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString)+','
                  + '        DCPMOORI = ' + floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat)+','
                  + '        DCPMOLOC = ' + floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOLOC').AsFloat)+','
                  + '        DCPMOEXT = ' + floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOEXT').AsFloat)+','
                  + '        DCPUSER = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPUSER').AsString)+','
                  + '        DCPFREG = trunc(sysdate), '
                  + '        DCPHREG = sysdate '
                  + '  Where CIAID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)
                  + '    and DCPANOMM='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPANOMM').AsString)
                  + '    and TDIARID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('TDIARID').AsString)
                  + '    and CPNOREG='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPNOREG').AsString)
                  + '    and DCPREG='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPREG').AsString);
            Try
               DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('No se pudo actualizar el detalle de la provisión - 3b');
               exit;
            End;

         pnlRegistro.Visible := False;
         pnlDetalle.Enabled := True;
         pnlPie.Enabled := True;
      End;
   End
   Else // si tiene distribución automatica por Centro de Costo
   Begin
      xSql := 'Select * '
             +'  from CXP102 '
             +' where CIAID=' + quotedstr(dblcCia.text)
             +'   and CPTOID=' + quotedstr(xTemCpto)
             +' order by CCOSID';
      DMCXP.cdsQry3.Close;
      DMCXP.cdsQry3.ProviderName := 'dspTGE';
      DMCXP.cdsQry3.DataRequest(xSql);
      DMCXP.cdsQry3.Open;
      DMCXP.cdsQry3.First;
      xRecord := 0;
      xMontoOri := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFLoat;
      While Not DMCXP.cdsQry3.Eof Do
      Begin
         xRecord := xRecord + 1;
    //** mientras sea menor que el RecordCount se halla por el porcentaje
         If xRecord < DMCXP.cdsQry3.RecordCount Then
         Begin
            If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc Then
            Begin
               DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := FRound((xMontoOri * DMCXP.cdsQry3.FieldByName('PORCENTAJE').AsFloat) / 100, 15, 3);
               DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound((xMontoOri * DMCXP.cdsQry3.FieldByName('PORCENTAJE').AsFloat) / 100, 15, 3);
               If DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat > 0 Then
                  DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound(((xMontoOri * DMCXP.cdsQry3.FieldByName('PORCENTAJE').AsFloat) / 100) / DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 3);
               xDiferencia := FRound(xDiferencia + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat, 15, 2);
            End
            Else
            Begin
               DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := FRound((xMontoOri * DMCXP.cdsQry3.FieldByName('PORCENTAJE').AsFloat) / 100, 15, 3);
               DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(((xMontoOri * DMCXP.cdsQry3.FieldByName('PORCENTAJE').AsFloat) / 100) * DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 3);
               DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound((xMontoOri * DMCXP.cdsQry3.FieldByName('PORCENTAJE').AsFloat) / 100, 15, 3);
               xDiferencia := FRound(xDiferencia + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat, 15, 3);
            End;
         End
         Else //** si el xRecord = al RecordCount se halla por diferencia
         Begin
            If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc Then
            Begin
               DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := FRound(xMontoOri - xDiferencia, 15, 2);
               DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat; //xMontoOri -xDiferencia;
               If DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat > 0 Then
                  DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound((DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat) / DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 2);
            End
            Else
            Begin
               DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := FRound(xMontoOri - xDiferencia, 15, 2);
               DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound((DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat) * DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 2);
               DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
            End;
         End;
         If xNuevoDet Then
         Begin
            DMCXP.cdsDetCxP.Edit;
            DMCXP.cdsDetCxP.FieldByName('CCOSID').AsString := DMCXP.cdsQry3.FieldByName('CCOSID').AsString;
            DMCXP.cdsDetCxP.post;

            xSQL := ' Insert into CXP302(CIAID, TDIARID, CPNOREG, DCPANOC, DCPANOMM, DCPLOTE, TRANSID, CPTOID, CUENTAID, '
                  + '                    CLAUXID, DCPAUXID, DOCID, CPSERIE, CPNODOC, DCPGLOSA,DCPDH, CCOSID, CPTCAMPR, '
                  + '                    DCPMOORI, DCPMOLOC, DCPMOEXT, CPFEMIS, CPFVCMTO, DCPFCOM, DCPESTDO, DCPUSER, '
                  + '                    DCPFREG, DCPHREG, DCPMM, DCPDD, DCPTRI, DCPSEM, DCPSS, DCPAATRI, DCPAASEM, DCPAASS, '
                  + '                    TREGID,TMONID,TIPDET,DCPREG ) '
                  + ' Values('+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('TDIARID').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPNOREG').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPANOC').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPANOMM').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPLOTE').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('TRANSID').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPTOID').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('CUENTAID').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('CLAUXID').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPAUXID').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DOCID').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPSERIE').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPNODOC').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPGLOSA').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+', '
                  +            floattostr(DMCXP.cdsDetCxP.fieldbyname('CPTCAMPR').AsFloat)+', '
                  +            floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat)+', '
                  +            floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOLOC').AsFloat)+', '
                  +            floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOEXT').AsFloat)+', '
                  +            quotedstr(datetostr(DMCXP.cdsDetCxP.fieldbyname('CPFEMIS').AsDateTime))+', '
                  +            quotedstr(datetostr(DMCXP.cdsDetCxP.fieldbyname('CPFVCMTO').AsDateTime))+', '
                  +            quotedstr(datetostr(DMCXP.cdsDetCxP.fieldbyname('DCPFCOM').AsDateTime))+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPESTDO').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPUSER').AsString)+', '
                  + '          trunc(sysdate), '
                  + '          sysdate, '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPMM').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPDD').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPTRI').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPSEM').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPSS').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPAATRI').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPAASEM').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPAASS').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('TREGID').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('TMONID').AsString)+', '
                  +            quotedstr(DMCXP.cdsDetCxP.fieldbyname('TIPDET').AsString)+', '
                  +            inttostr(DMCXP.cdsDetCxP.fieldbyname('DCPREG').AsInteger)+' )';
            try
                DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
            except
                ShowMessage('No se puedo ingresar el detalle de la provisión');
                exit;
            end;

     //** inserta un nuevo registro
            If xRecord < DMCXP.cdsQry3.RecordCount Then
            Begin
               DMCXP.cdsDetCxP.Append;
               dblcTipReg.Text := xTemTReg;
               DMCXP.cdsDetCxP.FieldByName('TREGID').AsString := xTemTReg;
               DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString := xTemCpto;
               DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xTemCta;
               DMCXP.cdsDetCxP.FieldByName('DCPDH').ASString := xTemDH;
               DMCXP.cdsDetCxP.FieldByName('TIPPRESID').AsString := xTipPre;
               numreg := numreg + 1;
               DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger := numreg;
               dblcTipReg.OnExit(dblcTipReg);
      //** cargo glosa
               If xGlosaRep <> '' Then
                  DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGlosaRep
               Else
               Begin
                  If Length(DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString) = 0 Then
                     DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGlosa;
               End;
               edtCCosto.Text := '';

            End;
         End
         Else
         Begin
            DMCXP.cdsDetCxP.Edit;

            DMCXP.cdsDetCxP.Post;
            xSQL := ' Update CXP302 '
                  + '    set TREGID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('TREGID').AsString)+','
                  + '        CPTOID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPTOID').AsString)+','
                  + '        CUENTAID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CUENTAID').AsString)+','
                  + '        DCPGLOSA = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPGLOSA').AsString)+','
                  + '        CCOSID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+','
                  + '        TIPPRESID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('TIPPRESID').AsString)+','
                  + '        PARPRESID = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('PARPRESID').AsString)+','
                  + '        DCPDH = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString)+','
                  + '        DCPMOORI = '+quotedstr(floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat))+','
                  + '        DCPMOLOC = '+quotedstr(floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOLOC').AsFloat))+','
                  + '        DCPMOEXT = '+quotedstr(floattostr(DMCXP.cdsDetCxP.fieldbyname('DCPMOEXT').AsFloat))+','
                  + '        DCPUSER = '+quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPUSER').AsString)+','
                  + '        DCPFREG = trunc(sysdate), '
                  + '        DCPHREG = sysdate '
                  + ' Where CIAID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)
                  + '   and TDIARID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('TDIARID').AsString)
                  + '   and DCPANOMM='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPANOMM').AsString)
                  + '   and DCPREG='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPREG').AsString)
                  + '   and CPNOREG'+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPNOREG').AsString);
            Try
               DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('No se pudo actualizar el detalle de la provisión - 3b');
               exit;
            End;

     //** inserta un nuevo registro
            If xRecord < DMCXP.cdsQry3.RecordCount Then
            Begin
               DMCXP.cdsDetCxP.Append;
               dblcTipReg.Text := xTemTReg;
               DMCXP.cdsDetCxP.FieldByName('TREGID').AsString := xTemTReg;
               DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString := xTemCpto;
               DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xTemCta;
               DMCXP.cdsDetCxP.FieldByName('DCPDH').ASString := xTemDH;
               DMCXP.cdsDetCxP.FieldByName('TIPPRESID').AsString := xTipPre;
               numreg := numreg + 1;
               DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger := numreg;
               dblcTipReg.OnExit(dblcTipReg);
               If xGlosaRep <> '' Then
                  DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGlosaRep
               Else
               Begin
                  If Length(DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString) = 0 Then
                     DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGlosa;
               End;
               edtCCosto.Text := '';

            End;
            pnlRegistro.Visible := False;
            pnlDetalle.Enabled := True;
            pnlPie.Enabled := True;
         End;
         DMCXP.cdsQry3.next;
      End;

      DMCXP.cdsDetCxP.Append;
      DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString := '';

   End;

 // Repetir Glosa
   If cbRepGlosa.Checked Then
   Begin
      DMCXP.cdsDetCxP.First;
      While Not DMCXP.cdsDetCxP.Eof Do
      Begin
         DMCXP.cdsDetCxP.Edit;
         DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGlosaRep;
         DMCXP.cdsDetCxP.Next;
      End;

   // Las actualizaciones se realizan en base al Nro de Registro de la Provisión y no
   // en base al número del detalle
      xSQL := ' Update CXP302 '
            + '    SET DCPGLOSA = ' + quotedstr(xGlosaRep)+','
            + '        DCPFREG = trunc(sysdate), '
            + '        DCPHREG = sysdate '
            + '  Where CIAID = ' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)
            + '    and DCPANOMM = ' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPANOMM').AsString)
            + '    and TDIARID = ' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('TDIARID').AsString)
            + '    and CPNOREG = ' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPNOREG').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo actualizar la glosa del detalle');
         exit;
      End;
   End;

   If xTipDet = 'I1' Then
   Begin
      cdsClone.First;
      While Not cdsClone.eof Do
      Begin
         If (cdsClone.FieldByname('TIPDET').AsString = 'MG') or (cdsClone.FieldByname('TIPDET').AsString = 'BI') Then
         Begin
            xTotMG := xTotMG + cdsClone.fieldByName('DCPMOORI').AsFloat;
         End;
         If (cdsClone.FieldByname('TIPDET').AsString = 'TO') Then
         Begin
            xTotTO := xTotTO + cdsClone.fieldByName('DCPMOORI').AsFloat;
         End;
         cdsClone.Next;
      End;

      xWhere := 'Select * from TGE113 WHERE TREGID=' + '''' + xTemTReg + '''';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xWhere);
      DMCXP.cdsQry.Open;

      If sCalcSaldos = 'N' Then Exit;

      If xTotMG > 0 Then
      Begin
         xCalc := FRound(xTotMG * DMCXP.cdsQry.FieldByname('TASA').AsFloat / 100, 15, 2);
         If xIGVx <> xCalc Then
         Begin
            ShowMessage('IGV no Cuadra con respecto a la Base Imponible');
            Exit;
         End;
      End;
      If xTotTO > 0 Then
      Begin
         xCalc := FRound(xTotTO / ((DMCXP.cdsQry.FieldByname('TASA').AsFloat / 100) + 1), 15, 2);
         xCalc := FRound(xTotTO - xCalc, 15, 2);
         If xIGVx <> xCalc Then
         Begin
            ShowMessage('IGV no Cuadra Con Respecto al Total');
            Exit;
         End;
      End;
      cdsClone.Free;
   End;

   If (xTemTReg = '15') OR (xTemTReg = '21') Then
   begin
      lblpor.visible := True;
      dbepor.visible := True;
      dbepor.enabled := True;
      dbepor.text := '0';
      dbeDetrac.visible := FALSE;
      lblDet.visible := FALSE;
      dbeDetrac.enabled := FALSE;
      dbeDetrac.text := '0';
   end;
   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   xorigen := 'CxP201';
   // Fin HPC_201702_CXP
End;

Procedure TFProvision.Items;
Var
   xCont: Integer;
Begin
   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.eof Do
   Begin
      DMCXP.cdsDetCxP.Edit;
      DMCXP.cdsDetCxP.fieldByName('DCPREG').AsInteger := DMCXP.cdsDetCxP.fieldByName('DCPREG').AsInteger + 100;
      DMCXP.cdsDetCxP.First;
      If DMCXP.cdsDetCxP.fieldByName('DCPREG').AsInteger > 100 Then Break;
   End;

   xCont := 1;
   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.eof Do
   Begin
      DMCXP.cdsDetCxP.Edit;
      DMCXP.cdsDetCxP.fieldByName('DCPREG').AsInteger := xCont;
      DMCXP.cdsDetCxP.next;
      xCont := xCont + 1;
   End;
End;

Procedure TFProvision.bbtnRegCancClick(Sender: TObject);
Begin
   If xNuevoDet then
      DMCXP.cdsDetCxP.Delete
   Else
   Begin
      DMCXP.cdsDetCxp.Cancel;
   End;
   pnlRegistro.Visible := False;
   pnlDetalle.Enabled := True;
   pnlPie.Enabled := True;
   dblcdCCosto.Text := '';
   dblcdCCosto.Enabled := False;
   xNuevoDet := False;
   If xCrea = False Then
      dbgDetCxP.SetFocus;
End;

Procedure TFProvision.dbeDHExit(Sender: TObject);
Begin
   If xCrea = true Then exit;
   If Not bbtnRegCanc.Focused Then
   Begin
      If (dbeDH.Text <> 'D') And (dbeDH.Text <> 'H') Then
      Begin
         ShowMessage('Digite sólo D(para Debe) o H(para Haber)');
         DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString := '';
         dbeDH.SetFocus;
      End;
   End;
End;

Procedure TFProvision.dbeImporteExit(Sender: TObject);
Begin
   If xCrea = true Then exit;
   If bbtnRegCanc.Focused Then Exit;
   If length(dbeImporte.Text) = 0 Then
      dbeImporte.Text := '0';
   If strtofloat(dbeImporte.Text) <= 0 Then
   Begin
      ShowMessage('Importe debe ser mayor que 0');
      DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := 0;
      dbeImporte.SetFocus;
   End;
End;

Procedure TFProvision.dbgDetCxPKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Var
   xCont: Integer;
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
   // si se trata de DETRACCION, siempre se eliminarán todos los registros
   // por lo tanto tendrá que digitarse nuevamente el concepto de la
   // DETRACCION y volver a generar los registros respectivos
      If xDTRPorc > 0 Then // por eliminar registros de DETRACCION
      Begin
         If MessageDlg('Al tratarse de una provisión con Detracción, se eliminarán todos los registros ¿Continuar? ',
                              mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            xSQL := 'Delete from CXP302 '
                  + ' where CIAID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
                  + '   and TDIARID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString)
                  + '   and DCPANOMM = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
                  + '   and CPNOREG = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString);
            Try
               DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('No se puede Eliminar el detalle de la Provisión con detracción');
               exit;
            End;
            xSQL := 'select * from CXP302 '
                  + ' where CIAID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
                  + '   and TDIARID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString)
                  + '   and DCPANOMM = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
                  + '   and CPNOREG = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString)
                  + ' order by CPNOREG';
            DMCXP.cdsDetCxP.Close;
            DMCXP.cdsDetCxP.DataRequest(xSQL);
            DMCXP.cdsDetCxP.open;
            dbgDetCxp.RefreshDisplay;
            DMCXP.cdsMovCxP.Edit;
            DMCXP.cdsMovCxP.fieldbyname('DTRPORC').AsFLoat := 0;
            DMCXP.cdsMovCxP.Post;
            ShowMessage('Se eliminó correctamente el detalle de la provisión');
         End;
      End
      Else
      Begin
         If MessageDlg('¿Esta Seguro de Eliminar Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            If (DMCXP.cdsMovCxP.fieldbyname('CPESTADO').Value = 'I') or
               (DMCXP.cdsMovCxP.fieldbyname('CPESTADO').Value = 'T') then
            Begin
               xCont:= DMCXP.cdsDetCxP.fieldbyname('DCPREG').AsInteger;
               DMCXP.cdsDetCxP.Delete;
               xSQL := 'Delete from CXP302 '
                     + ' where CIAID = ' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)
                     + '   and TDIARID = ' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('TDIARID').AsString)
                     + '   and DCPANOMM = ' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('DCPANOMM').AsString)
                     + '   and CPNOREG = ' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CPNOREG').AsString)
                     + '   and DCPREG = ' + inttostr(xCont);
               Try
                  DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  ShowMessage('No se puede Eliminar el detalle de la Provisión mediante las teclas');
                  exit;
               End;
               items;

               If DMCXP.cdsDetCxP.Recordcount <= 0 Then
               Begin
                  DMCXP.cdsMovCxP.Edit;
                  DMCXP.cdsMovCxP.fieldbyname('DTRPORC').AsFLoat := 0;
                  DMCXP.cdsMovCxP.fieldbyname('PORCDESC').AsFLoat := 0;
                  DMCXP.cdsMovCxP.Post;
               End;
               ShowMessage('Se eliminó correctamente el detalle de la provisión');
            end
            else
            Begin
               ShowMessage('Situación de la provisión no permite eliminación de registros');
            End;
         End;
      End;
   End;
End;

Procedure TFProvision.dblcdProvEnter(Sender: TObject);
Begin
   If DMCXP.wVRN_ProvOrden <> '' Then
      DMCXP.cdsProv.IndexFieldNames := DMCXP.wVRN_ProvOrden
   Else
   Begin
      DMCXP.cdsProv.IndexFieldNames := 'PROV';
   End;
End;

Procedure TFProvision.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFProvision.FormCreate(Sender: TObject);
Begin
   If (DMCXP.wAdmin = 'G') Then
   Begin
      DMCXP.wObjetoDesPr := Caption;
      FPrincipal.ListaComponentes(Self);
   End;

   DMCXP.cdsCxP.Filter := '';
   DMCXP.cdsCxP.Filtered := false;
   DMCXP.cdsCxP.IndexFieldNames := '';
   DMCXP.cdsCxP.Close;

   DMCXP.cdsQry.Filter := '';
   DMCXP.cdsQry.Filtered := false;
   DMCXP.cdsQry.IndexFieldNames := '';
   DMCXP.cdsQry.Close;

   DMCXP.cdsQry6.Filter := '';
   DMCXP.cdsQry6.Filtered := false;
   DMCXP.cdsQry6.IndexFieldNames := '';
   DMCXP.cdsQry6.Close;

   CargaDataSource;

   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   xorigen := 'CxP201';
   // Fin HPC_201702_CXP
// Inicio HPC_201704_CXP
// Seguros-Automatización de Devengue de Seguros
   pnlSeguroDatos.Visible := False;
   xSql := 'SELECT CPTOID,CPTODES FROM CXP201 WHERE 1=1 ORDER BY CPTOID';
   DMCXP.cdsQry15.Close;
   DMCXP.cdsQry15.DataRequest(xSQL);
   DMCXP.cdsQry15.Open;
   dblcConcepto.LookupTable := DMCXP.cdsQry15;
   dtpFFVigencia.Enabled := False;
// Fin HPC_201704_CXP
End;

Procedure TFProvision.CargaDataSource;
Begin
   dblcCia.DataSource := DMCXP.dsMovCxP;
   dblcCia.LookupTable := DMCXP.cdsCia;
   dblcClAux.DataSource := DMCXP.dsMovCxP;
   dblcClAux.LookupTable := DMCXP.cdsClAux;
   dblcdProv.DataSource := DMCXP.dsMovCxP;
   dblcdProv.LookupTable := DMCXP.cdsProv;
   dblcdProvRuc.DataSource := DMCXP.dsMovCxP;
   dblcdProvRuc.LookupTable := DMCXP.cdsProv;
   dblcTDoc.DataSource := DMCXP.dsMovCxP;
   dblcTDoc.LookupTable := DMCXP.cdsTDoc;
   edtSerie.DataSource := DMCXP.dsMovCxP;
   edtNoDoc.DataSource := DMCXP.dsMovCxP;
   dblcClAuxInter.DataSource := DMCXP.dsMovCxP;
   dblcClAuxInter.LookupTable := DMCXP.cdsClAux;
   dblcdInter.DataSource := DMCXP.dsMovCxP;
   dblcdInter.LookupTable := DMCXP.cdsProv;
   dblcTDiario.DataSource := DMCXP.dsMovCxP;
   dblcTDiario.LookupTable := DMCXP.cdsTDiario;
   dtpFComp.DataSource := DMCXP.dsMovCxP;
   meAnoMM.DataSource := DMCXP.dsMovCxP;

   meNoReg.DataSource := nil;

   dtpFRecep.DataSource := DMCXP.dsMovCxP;
   dtpFEmis.DataSource := DMCXP.dsMovCxP;
   dtpFVcmto.DataSource := DMCXP.dsMovCxP;
   dblcTMon.DataSource := DMCXP.dsMovCxP;
   dblcTMon.LookupTable := DMCXP.cdsTMon;
   dbeTCambio.DataSource := DMCXP.dsMovCxP;
   dbeLote.DataSource := DMCXP.dsMovCxP;
   dblcdOCompra.DataSource := DMCXP.dsMovCxP;
   dblcdOCompra.LookupTable := DMCXP.cdsQry6;
   dblcClAuxResp.DataSource := DMCXP.dsMovCxP;
   dblcClAuxResp.LookupTable := DMCXP.cdsClAux1;
   dblcdResp.DataSource := DMCXP.dsMovCxP;
   dblcdResp.LookupTable := DMCXP.cdsResp;

   dblcTipReg.DataSource := DMCXP.dsDetCxP;
   dblcTipReg.LookupTable := DMCXP.cdsTipReg;
   dblcdCnpEgr.DataSource := DMCXP.dsDetCxP;
   dblcdCnpEgr.LookupTable := DMCXP.cdsCnpEgr;
   dbeCuenta.DataSource := DMCXP.dsDetCxP;
   dbeGlosa.DataSource := DMCXP.dsDetCxP;
   dblcdCCosto.DataSource := DMCXP.dsDetCxP;
   dblcdCCosto.LookupTable := DMCXP.cdsCCosto;
   dblcTipPre.DataSource := DMCXP.dsDetCxP;
   dblcTipPre.LookupTable := DMCXP.cdsTipPre;
   dblcdPresup.DataSource := DMCXP.dsDetCxP;
   dblcdPresup.LookupTable := DMCXP.cdsPresup;
   dbeDH.DataSource := DMCXP.dsDetCxP;
   dbeImporte.DataSource := DMCXP.dsDetCxP;

   dblcImpuesto.DataSource := Nil;
   dblcImpuesto.LookupTable := DMCXP.cdsTipReg2;

   dblcRefTipoDoc.DataSource := Nil;
   dblcRefTipoDoc.LookupTable := DMCXP.cdsQry10;

   dbgDetCxP.DataSource := DMCXP.dsDetCxP;
   dbgPendientes.DataSource := DMCXP.dsMovCxP2;
   dbgCanje.DataSource := DMCXP.dsDetCanje;

   dtpFecDet.DataSource := DMCXP.dsMovCxP;
   dbeNumDet.DataSource := DMCXP.dsMovCxP;
   dbeDetrac.DataSource := DMCXP.dsMovCxP;

   dblcTipoD.DataSource := DMCXP.dsMovCxP;
   dblcTipoD.LookupTable := DMCXP.cdsTipo;

   dblcOperD.DataSource := DMCXP.dsMovCxP;
   dblcOperD.LookupTable := DMCXP.cdsOper;

End;

Procedure TFProvision.dblcClAuxExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If bbtnBorra.Focused Then Exit;
   If dblcCia.Focused Then Exit;

   xNuevoProv := False;
   xWhere := 'CLAUXID=''' + dblcClAux.Text + ''' and MODULO LIKE ''%' + DMCXP.wModulo + '%''';
   If length(BuscaQry('dspTGE', 'TGE102', 'CLAUXDES', xWhere, 'CLAUXDES')) = 0 Then
   Begin
      dblcClAux.SetFocus;

      Raise Exception.Create('Clase de Auxiliar');
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
      DMCXP.cdsMovCxP.Edit;
      xWhere := 'CLAUXID=''' + dblcClAux.Text + ''' AND PROV=''' + dblcdProv.Text + ''' and NVL(ACTIVO,''N'')=''S''';
      If length(BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES', xWhere, 'ProvDES')) = 0 Then
      Begin
         DMCXP.cdsMovCxP.fieldbyname('PROV').AsString := '';
         DMCXP.cdsMovCxP.fieldbyname('PROVRUC').AsString := '';
         edtProv.Text := '';
         dblcdProv.SetFocus;
      End
      Else
      Begin
         DMCXP.cdsMovCxP.fieldbyname('PROV').AsString := DMCXP.cdsQry.FieldByname('PROV').AsString;
         DMCXP.cdsMovCxP.fieldbyname('PROVRUC').AsString := DMCXP.cdsQry.FieldByname('PROVRUC').AsString;
         edtProv.Text := DMCXP.cdsQry.FieldByname('PROVDES').AsString;
      End;
   End;
   If Length(dblcdProv.Text) = 0 Then dblcdProv.SetFocus;
   Screen.Cursor := crDefault;
End;

Procedure TFProvision.bbtnGenRegClick(Sender: TObject);
Var
   xBaseImp, xImpuTot, wImpTotal: Double; //wtasa, xTOT, xIGV : Double;
   xWhere, xBusca, wExoIGV, xCCosId, xTipReg, xTipDet, xDH: String;
   x: integer;
Begin

   xNuevoDet := True;
   xCpto06 := '';
   xCta06 := '';
   xCCosId := '';
// Inicialiazando el DataSet Auxiliar
   Filtracds(DMCXP.cdsDetCxP2, 'Select * from CXP302 Where 1=2');

   If DMCXP.cdsDetCxP.RecordCount = 0 Then Exit;

   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.eof Do
   Begin	 
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
      If Not ((DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'BI') Or
         (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'MG') Or
         (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'NG') Or
         (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'MN') Or
         (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'AN') Or
         (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'OT')) Then
      Begin
         DMCXP.cdsDetCxP.Delete;
      End
      Else
      Begin
         DMCXP.cdsDetCxP.Next;
      End;											   
// Fin HPC_201803_CXP
   End;

   xBaseImp := 0;
   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.eof Do
   Begin	
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
      If (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'BI') Or
         (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'MG') Or
         (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'NG') Or
         (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'MN') Or
         (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'AN') Or
         (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'OT') Then
      Begin
         xBaseImp := xBaseImp + FRound(DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat, 15, 2);

         xBusca := DMCXP.DisplayDescrip('TGE113', 'TREGDES', 'TRegID', dblcTipReg.Text);
// Inicio HPC_201702_CXP
// se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
         If (DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '10') or (DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '08') Then
         Begin
            dblcImpuesto.Text := '';
         End;
// Fin HPC_201702_CXP 
// Fin HPC_201803_CXP
         If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '01' Then
         Begin
            dblcImpuesto.Text := '03';
            If xDOCTIPREG = '4C' Then dblcImpuesto.Text := '12'; // 4ta categoría
         End;

         If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '02' Then
         Begin
            dblcImpuesto.Text := '04';
         End;

         If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '06' Then
         Begin
            dblcImpuesto.Text := '09';
            xCpto06 := DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString;
            xCta06 := DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString;
            xCCosId := DMCXP.cdsDetCxP.FieldByName('CCOSID').AsString;
            CopiaRegistro(DMCXP.cdsDetCxP, DMCXP.cdsDetCxP2);

         End;

         If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '15' Then
         Begin
            dblcImpuesto.Text := '14';
         End;

         If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '21' Then
         Begin
            dblcImpuesto.Text := '20';
         End;

         dblcImpuesto.Enabled := False;
         edtImpuesto.Text := DMCXP.DisplayDescrip('TGE113', 'TREGDES', 'TREGID', dblcImpuesto.Text);
         xTipReg := dblcImpuesto.Text;
         xTipDet := DMCXP.cdsULTTGE.FieldByName('TIPDET').AsString;
         xDH := DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString;

         wTasa := 0;

         IF  (DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '15') OR (DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '21') Then
             wTasa := FRound((StrToFloat(dbepor.text) / 100), 7, 4)
         Else
             wTasa := FRound((DMCXP.cdsULTTGE.FieldByName('TASA').AsFloat / 100), 7, 4);  // linea original

         If (dtpFEmis.date <= StrToDate('28/02/2011')) And
            ((DMCXP.cdsULTTGE.FieldByName('TREGID').AsString = '03') Or
            (DMCXP.cdsULTTGE.FieldByName('TREGID').AsString = '04') Or
            (DMCXP.cdsULTTGE.FieldByName('TREGID').AsString = '09')
            ) Then
            wTasa := 0.19;
      End;
      DMCXP.cdsDetCxP.Next;
   End;	 
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
{
   DMCXP.cdsTipReg2.SetKey;
   DMCXP.cdsTipReg2.FieldByName('TREGID').AsString := dblcImpuesto.Text;

   If edtImpuesto.Text<>'' then
   Begin
     if not DMCXP.cdsTipReg2.GotoKey then
     begin
        ShowMessage('Tipo de Impuesto No encontrado');
        exit;
     end;
   End;
}
   If edtImpuesto.Text<>'' then
   Begin
      DMCXP.cdsTipReg2.SetKey;
      DMCXP.cdsTipReg2.FieldByName('TREGID').AsString := dblcImpuesto.Text;
      if not DMCXP.cdsTipReg2.GotoKey then
      begin
         ShowMessage('Tipo de Impuesto No encontrado');
         exit;
      end;
   End;
// Fin HPC_201803_CXP

   DMCXP.cdsDetCxP.First;
   xImpuTot := 0;
   xDTRMasDeUno := '0';
   xDTRPorc := 0;
   While Not DMCXP.cdsDetCxP.eof Do
   Begin
      If Copy(DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString, 1, 1) = 'I' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByname('DCPDH').AsString = 'D' Then
            xImpuTot := xImpuTot + FRound(DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat, 15, 2)
         Else
            xImpuTot := xImpuTot - FRound(DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat, 15, 2);
      End;

   // busca si el concepto esta afecto a DETRACCION
      For x := 0 To lbDTRCpto.Items.Count - 1 Do
      Begin
         If lbDTRCpto.Items.Strings[x] = DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString Then
         Begin
            xDTRMasDeUno := '1'; // para controlar que no se procese mas de un concepto, si se trata de DETRACCION
            xDTRPorc := FRound(StrToFloat(lbDTRPorc.Items.Strings[x]), 15, 4);

            xDTRPorc := DMCXP.cdsMovCxP.FieldByName('DTRPORC').AsFLoat;
         End;
      End;

      DMCXP.cdsDetCxP.Next;
   End;

   /////////////////////////////////////////////////////////////////////////////
   // para controlar si la base imponible incluye el IGV, si la Cia. es
   // exonerada de IGV, la base incluye el IGV, por lo tanto no se sumara nuevamente
   // el cálculo automático de impuestos si debe calcular IGV desde Enero 2010.
   wImpTotal := FRound((xBaseImp * (1 + wTasa)), 15, 2);
   /////////////////////////////////////////////////////////////////////////////

   If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonExt Then
      wImpTotal := FRound(wImpTotal * DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 2);

   ////////////////////////////////////////////////////////////////////
   // esto se realiza como advertencia, solo en el caso que se trate de
   // un tipo de documento(TGE110-DTRAFECTO), concepto(CXP201-DTRPORC)y monto(TEG108-TASAMTO) afectos a detraccion
   If (xDtrPorc > 0) And (xDTRAfecto = 'S') And (wImpTotal > xTasaDTR) Then
   Else
   Begin // si no se cunplen las condiciones para DETRAER
      xDTRPorc := 0; //xDTRAfecto:='N';
   End;

   If xDtrPorc > 0 Then
   Begin
      If MessageDlg('  Se afectará la DETRACCIÓN ' + chr(13) + chr(13)
         + '¿  quiere Continuar? ' + chr(13),
         mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Begin
         DMCXP.cdsDetCxP.EnableControls;
         Exit;
      End;
   End;

   ////////////////////////////////////////////////////////////////////
   // mensaje de advertencia, para que de acuerdo al flag de la compañia,
   // se genera a criterio del usuario el registro de IGV
   // y tambien siempre y cuando en el TGE110-DOCTIPREG sea diferente de '4C'
   // recibos por honorarios
   If (xExoIGV = 'A') And (xDOCTIPREG <> '4C') Then
   Begin
      wExoIGV := 'S';
      If MessageDlg('  Desea generar IGV ' + chr(13) + chr(13),
         mtConfirmation, [mbYes, mbNo], 0) = mrYes Then wExoIGV := 'N'; // 'N' si genera IGV
   End;

// Se añade Usuario que actualiza
   xSQL := 'Update CXP301 '
         + '   set CPFREG = trunc(sysdate), '
         + '       CPHREG = sysdate, '
         + '       CPUSER = '+quotedstr(DMCXP.wUsuario)+', '
         + '       DTRPORC ='+floattostr(xDTRPorc);
   if (DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '15') // B.I. NO DOMICILIADA
      or (DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '21') Then // B.IMPONIB. 2DA.CATEG
      xSQL := xSQL + ' ,PORCDESC= '''+(dbePor.text)+''' ';
   xSQL := xSQL
         + ' Where CIAID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
         + '   and CPANOMES = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
         + '   and TDIARID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString)
         + '   and CPNOREG = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString)
         + '   and CLAUXID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString)
         + '   and PROV = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('PROV').AsString)
         + '   and DOCID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('DOCID').AsString)
         + '   and CPSERIE  = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString)
         + '   and CPNODOC = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNODOC').AsString);
   try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;

   ////////////////////////////////
   //         IMPUESTOS        ////
   ////////////////////////////////
   xIGV := 0;
   If length(xCpto06) > 0 Then
   Begin
      xIGV := FRound((xBaseImp * wTasa), 15, 2);
      ImpuestoReg06(xTipReg, xTipDet);
   End;

   // SOLO SI LA CIA NO ESTA EXONERADA DE IGV

   If ((wExoIgv = 'N') Or (xDOCTIPREG = '4C') Or (xExoIgv = 'N'))
      And (length(xCpto06) = 0) Then // xDOCTIPREG (TGE110), por ser Renta de 4categoria
   Begin // documento '02' recibo x honorarios
      xIGV := FRound((xBaseImp * wTasa), 15, 2);

      DMCXP.cdsDetCxP.Last;
      numreg := DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger + 1;

      DMCXP.cdsDetCxP.Append;
      DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat := xIGV;
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger := numreg;

      GrabaDet;

      If length(xCCosId) > 0 Then
      Begin
         DMCXP.cdsDetCxP.FieldByname('CCOSID').AsString := xCCosId;
      End;

      DMCXP.cdsDetCxP.FieldByname('TREGID').AsString := xTipReg; //'03';
      DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString := xTipDet; // 'I1'

      If xDOCTIPREG = '4C' Then
         DMCXP.cdsDetCxP.FieldByname('DCPDH').AsString := 'H'
      Else
         xWhere := 'TREGID=''' + xTipReg + '''';
         xDH := BuscaQry('dspTGE', 'TGE113', 'DCPDH', xWhere, 'DCPDH');
         DMCXP.cdsDetCxP.FieldByname('DCPDH').AsString := xDH;
      If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'H' Then
         xIGV := xIGV * (-1);

      If xNuevoDet Then
      Begin
         DMCXP.cdsDetCxP.Edit;
         If DMCXP.cdsDetCxP.FieldByname('TMONID').AsString = DMCXP.wTMonLoc Then
         Begin
            DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString := DMCXP.cdsTipReg2.fieldbyname('CPTOMN').AsString;
            DMCXP.cdsDetCxP.FieldByname('CUENTAID').AsString := DMCXP.cdsTipReg2.fieldbyname('CUENTAMN').AsString;
         End
         Else
         Begin
            DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString := DMCXP.cdsTipReg2.fieldbyname('CPTOME').AsString;
            DMCXP.cdsDetCxP.FieldByname('CUENTAID').AsString := DMCXP.cdsTipReg2.fieldbyname('CUENTAME').AsString;
         End;

      // glosa repetir
         If xGlosaRep <> '' Then
            DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGlosaRep
         Else
         Begin
            DMCXP.cdsCnpEgr.IndexFieldNames := 'CPTOID';
            DMCXP.cdsCnpEgr.SetKey;
            DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString := DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString;
            If DMCXP.cdsCnpEgr.Gotokey Then
            Begin
               DMCXP.cdsDetCxP.FieldByname('DCPGLOSA').AsString := DMCXP.cdsCnpEgr.fieldbyname('CPTODES').AsString;
            End;
         End;
      End;

      If (DMCXP.cdsDetCxP.State = dsInsert) Or (DMCXP.cdsDetCxP.State = dsEdit) Then
         DMCXP.cdsDetCxP.Post;

      If DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat <= 0 Then
      Begin
         DMCXP.cdsDetCxP.delete;
      End;
   End;

//////////////////////////////
//        T O T A L         //
//////////////////////////////

   xTOTLOC := 0;
   xTOTEXT := 0;

   xTOT := FRound((xBaseImp + xImpuTot + xIGV ), 15, 2);

   //Valida el total de la orden de pago con la provisión
   If ValidaTotalOrdPago(xOrdenPago, xnItemOP, xTOT) = False Then
   Begin
      ShowMessage('El total del documento es: ' + FloatToStr(xTOT) + ',' + #13 +
         'y es distinto a lo registrado en la Orden de Pago que es: ' + FloatToStr(xTotalOrdenPago));

   End;

   ActualizaMontos;

   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.eof Do
   Begin
      If DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'TO' Then
      Begin
         DMCXP.cdsDetCxP.Delete;
         Break;
      End;
      DMCXP.cdsDetCxP.Next;
   End;

   DMCXP.cdsDetCxP.Append;
   DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat := xTOT;
   numreg := numreg + 1;
   DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger := numreg;

   xBusca := 'Select B.* '
           + '  from CXP103 A, TGE113 B '
           + ' Where A.CIAID = ' + quotedstr(dblcCia.Text)
           + '   and A.TREGID = ' + quotedstr(DMCXP.cdsTipReg2.fieldbyname('TREGID').AsString)
           + '   and A.TREGREL = B.TREGID '
           + '   and B.TIPDET=''TO'' '
           + ' Order by TIPDET';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xBusca);
   DMCXP.cdsQry.Open;

   If DMCXP.cdsQry.Recordcount <= 0 Then
   Begin
      xWhere := 'TIPDET=' + '''' + 'TO' + '''';
      DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString := BuscaQry('PrvTGE', 'TGE113', '*', xWhere, 'TIPDET');
   End;

   DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString := DMCXP.cdsQry.fieldbyname('TIPDET').AsString;
   DMCXP.cdsDetCxP.FieldByname('TREGID').AsString := DMCXP.cdsQry.fieldbyname('TREGID').AsString;
   DMCXP.cdsDetCxP.FieldByname('DCPDH').AsString := DMCXP.cdsQry.fieldbyname('DCPDH').AsString;

   GrabaDet;

   If xNuevoDet Then
   Begin
      DMCXP.cdsDetCxP.Edit;
      If DMCXP.cdsDetCxP.FieldByname('TMONID').AsString = DMCXP.wTMonLoc Then
      Begin
         DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString := DMCXP.cdsQry.fieldbyname('CPTOMN').AsString;
         DMCXP.cdsDetCxP.FieldByname('CUENTAID').AsString := DMCXP.cdsQry.fieldbyname('CUENTAMN').AsString;
      End
      Else
      Begin
         DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString := DMCXP.cdsQry.fieldbyname('CPTOME').AsString;
         DMCXP.cdsDetCxP.FieldByname('CUENTAID').AsString := DMCXP.cdsQry.fieldbyname('CUENTAME').AsString;
      End;

   // Repetir Glosa
      If xGlosaRep <> '' Then
         DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGlosaRep
      Else
      Begin
         xWhere := 'CPTOID=' + '''' + DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString + '''';
         If length(BuscaQry('PrvCxP', 'CXP201', '*', xWhere, 'CPTOID')) > 0 Then
            DMCXP.cdsDetCxP.FieldByname('DCPGLOSA').AsString := DMCXP.cdsQry.fieldbyname('CPTODES').AsString;
      End;
   End;

   xMensaje := '';
   If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'TO' Then
   Begin
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := edtProv.Text;
   End;

   DMCXP.cdsDetCxP.Post;

   Items;

   xImpDtr := 0;
   If xDTRPorc > 0 Then
      Detraccion;

   xNuevoDet := False;

// fuerza grabado de registros insertados en forma automática
   Z2bbtnGrabaClick(Sender);

   DMCXP.cdsDetCxP.EnableControls;
   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   xorigen := 'CxP201';//jesus
   // Fin HPC_201702_CXP
End;

Procedure TFProvision.GrabaDet ;
Begin
   DMCXP.cdsDetCxP.FieldByName('CIAID').AsString := DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString;
   DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString := DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString;
   DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString := DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString;
   DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString := Copy(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString, 1, 4);
   DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString;
   DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString := DMCXP.cdsMovCxP.fieldbyname('DCPLOTE').AsString;
   DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString := 'CP';
   DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString := dblcClAux.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsMovCxP.fieldbyname('PROV').AsString;
   DMCXP.cdsDetCxP.FieldByName('DOCID').AsString := DMCXP.cdsMovCxP.fieldbyname('DOCID').AsString;
   DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString := DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString;
   DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString := DMCXP.cdsMovCxP.fieldbyname('CPNODOC').AsString;
   DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat := FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 7, 3);
   DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsdateTime := DMCXP.cdsMovCxP.fieldbyname('CPFEMIS').AsDateTime;
   DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFVCMTO').AsDateTime;
   DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsdateTime := DMCXP.cdsMovCxP.fieldbyname('CPFCMPRB').AsDateTime;
   DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'I'; // Activo
   DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString := DMCXP.wUsuario;
   DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFREG').AsDateTime;
   DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPHREG').AsDateTime;
   DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPMM').AsString;
   DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString := DMCXP.cdsMovCxP.fieldbyname('CPDD').AsString;
   DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString := DMCXP.cdsMovCxP.fieldbyname('CPTRI').AsString;
   DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPSEM').AsString;
   DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString := DMCXP.cdsMovCxP.fieldbyname('CPSS').AsString;
   DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString := DMCXP.cdsMovCxP.fieldbyname('CPAATRI').AsString;
   DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPAASEM').AsString;
   DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString := DMCXP.cdsMovCxP.fieldbyname('CPAASS').AsString;
   DMCXP.cdsDetCxP.FieldByName('TMONID').AsString := DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString;

   If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc Then
   Begin
      If DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'TO' Then
      Begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := xTOTLOC;
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := xTOTEXT;
      End
      Else
      Begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat / DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 2);
      End;
   End
   Else
   Begin
      If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonExt Then
      Begin
         If DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'TO' Then
         Begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := xTOTLOc;
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := xTOTEXT;
         End
         Else
         Begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat * DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         End
      End
      Else
      Begin // Otras Monedas Extranjeras
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat * DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 2);
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat / DMCXP.cdsMovCxP.fieldbyname('CPTCAMDOL').AsFloat, 15, 2);
      End;
   End;
End;

Procedure TFProvision.dblcImpuestoExit(Sender: TObject);
Begin
   If Length(dblcImpuesto.Text) > 0 Then
      edtImpuesto.Text := DMCXP.cdsTipReg2.FieldByname('TREGDES').AsString;
End;

Procedure TFProvision.dblcdProvRucEnter(Sender: TObject);
Begin
   DMCXP.cdsProv.IndexFieldNames := 'PROVDES';
End;

Procedure TFProvision.dblcClAuxRespExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If bbtnBorra.Focused Then Exit;
   If dblcClAuxResp.Text = '' Then Exit;

   Screen.Cursor := crHourGlass;
   xNuevoProv := False;
   xWhere := 'CLAUXID=''' + dblcClAuxResp.Text + '''';
   If length(BuscaQry('dspTGE', 'TGE102', 'CLAUXDES', xWhere, 'CLAUXDES')) = 0 Then
   Begin
      Screen.Cursor := crDefault;
      dblcClAuxResp.SetFocus;
      Raise Exception.Create('Clase de Auxiliar');
   End;
   Filtracds(DMCXP.cdsResp, 'SELECT * FROM TGE201 WHERE CLAUXID=''' + dblcClAuxResp.Text + ''' and NVL(ACTIVO,''N'')=''S''');
   Screen.Cursor := crDefault;
   dblcdResp.SetFocus;
End;

Procedure TFProvision.dblcdRespExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If dblcClAuxResp.Focused Then Exit;
   If bbtnBorra.Focused Then Exit;

   If Length(dblcdResp.Text) = 0 Then
   Begin
      DMCXP.cdsMovCxP.Edit;
      DMCXP.cdsMovCxP.FieldByname('CLAUXREND').AsString := '';
      Exit;
   End;

   If Length(dblcClAuxResp.Text) = 0 Then
   Begin
      dblcClAuxResp.SetFocus;
      Raise Exception.Create('Falta Ingresar Clase de Auxiliar de Responsable');
   End;

   xWhere := 'CLAUXID=''' + dblcClAuxResp.Text + ''' and PROV=''' + dblcdResp.Text + ''' and NVL(ACTIVO,''N'')=''S''';
   edtResp.Text := BuscaQry('dspTGE', 'TGE201', 'PROV,PROVRUC,PROVDES', xWhere, 'PROVDES');

   If length(edtResp.Text) = 0 Then
   Begin

   End;
End;

Procedure TFProvision.CalculoNivel;
Var
   xmonto, xhora, xfecha, xEjecuMN, xEjecuME, xmes, ssql: String;
   xcambio: double;
   iX: integer;
   xtotal: Array[1..48] Of double;
   xtotG: Array[1..6] Of double;
   xasxmes: Array[1..24] Of double;
   xmoxmes: Array[1..24] Of double;
   xvpxmes: Array[1..24] Of double;
   xestado: bool; // para controlar el error del infinito
   xIS: String;
Begin
   { crea los niveles superiores si no tuviera }
   If (SRV_D = 'DB2NT') Or
      (SRV_D = 'DB2400') Then
   Begin
      CreaSuperior;
      DMCXP.cdsDetCxP.First;
      While Not DMCXP.cdsDetCxP.eof Do
      Begin
   { registros que tienen las pp}
         If ((DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MG') Or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'NG')
            Or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MN') Or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'BI'))
            And (DMCXP.cdsDetCxP.FieldByName('PARPRESID').AsString <> '') Then
         Begin
            xmes := copy(meAnoMM.Text, 5, 2);
            ssql := '';
            ssql := 'Update PPRES301 Set ';
            If dblcTMon.Text = DMCXP.wTMonLoc Then
            Begin
               xCambio := StrToFloat(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString) / StrToFloat(dbeTCambio.text);
               xEjecuME := '(' + DMCXP.wReplacCeros + '(DPREEJME' + xmes + ',0) + ' + FloatToStr(xcambio) + ')';
               xEjecuMN := '(' + DMCXP.wReplacCeros + '(DPREEJMN' + xmes + ',0) + ' + DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString + ')';
               xmonto := DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString;
            End
            Else
            Begin
               xCambio := StrToFloat(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString) * StrToFloat(dbeTCambio.text);
               xEjecuME := '(' + DMCXP.wReplacCeros + '(DPREEJME' + xmes + ',0) + ' + DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString + ')';
               xEjecuMN := '(' + DMCXP.wReplacCeros + '(DPREEJMN' + xmes + ',0) + ' + FloatToStr(xcambio) + ')';
               xmonto := DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString;
            End;
            ssql := ssql + 'DPREEJMN' + xmes + '= DEC(' + xEjecuMN + ',15,2), ';
            ssql := ssql + 'DPREEJME' + xmes + '= DEC(' + xEjecuME + ',15,2), ';
            If dblcTMon.Text = DMCXP.wTMonLoc Then
            Begin
               ssql := ssql + 'DPREVMMN' + xmes + '= DEC((' + DMCXP.wReplacCeros + '(DPREASMN' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOMN' + xmes + ',0))-(' + DMCXP.wReplacCeros + '(DPREEJMN' + xmes + ',0)+' + xmonto + '),15,2), ';
               ssql := ssql + 'DPREVMME' + xmes + '= DEC((' + DMCXP.wReplacCeros + '(DPREASME' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOME' + xmes + ',0))-(' + DMCXP.wReplacCeros + '(DPREEJME' + xmes + ',0)+' + FloatToStr(xcambio) + '),15,2), ';
               ssql := ssql + 'DPREVPMN' + xmes + '= (CASE WHEN ' + DMCXP.wReplacCeros + '(DPRETOASMN,0)+' + DMCXP.wReplacCeros + '(DPRETOMOMN,0)=0' +
                  ' THEN 200' +
                  ' ELSE DEC(((' + DMCXP.wReplacCeros + '(DPREEJMN' + xmes + ',0)+' + xmonto + ')/(' + DMCXP.wReplacCeros + '(DPREASMN' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOMN' + xmes + ',0)))*100,15,2)END),';
               ssql := ssql + 'DPREVPME' + xmes + '= (CASE WHEN ' + DMCXP.wReplacCeros + '(DPRETOASME,0)+' + DMCXP.wReplacCeros + '(DPRETOMOME,0)=0' +
                  ' THEN 200' +
                  ' ELSE DEC(((' + DMCXP.wReplacCeros + '(DPREEJME' + xmes + ',0)+' + xmonto + ')/(' + DMCXP.wReplacCeros + '(DPREASME' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOME' + xmes + ',0)))*100,15,2)END),';
               ssql := ssql + 'DPRETOEJMN=DEC(' + DMCXP.wReplacCeros + '(DPREEJMN01,0)+' + DMCXP.wReplacCeros + '(DPREEJMN02,0)+' + DMCXP.wReplacCeros + '(DPREEJMN03,0)+' + DMCXP.wReplacCeros + '(DPREEJMN04,0)+' + DMCXP.wReplacCeros + '(DPREEJMN05,0)+' + DMCXP.wReplacCeros + '(DPREEJMN06,0)+' +
                  '' + DMCXP.wReplacCeros + '(DPREEJMN07,0)+' + DMCXP.wReplacCeros + '(DPREEJMN08,0)+' + DMCXP.wReplacCeros + '(DPREEJMN09,0)+' + DMCXP.wReplacCeros + '(DPREEJMN10,0)+' + DMCXP.wReplacCeros + '(DPREEJMN11,0)+' + DMCXP.wReplacCeros + '(DPREEJMN12,0)+' +
                  xmonto + ',15,2),';
               ssql := ssql + 'DPRETOVMMN=DEC(' + DMCXP.wReplacCeros + '(DPREVMMN01,0)+' + DMCXP.wReplacCeros + '(DPREVMMN02,0)+' + DMCXP.wReplacCeros + '(DPREVMMN03,0)+' + DMCXP.wReplacCeros + '(DPREVMMN04,0)+' + DMCXP.wReplacCeros + '(DPREVMMN05,0)+' + DMCXP.wReplacCeros + '(DPREVMMN06,0)+' +
                  '' + DMCXP.wReplacCeros + '(DPREVMMN07,0)+' + DMCXP.wReplacCeros + '(DPREVMMN08,0)+' + DMCXP.wReplacCeros + '(DPREVMMN09,0)+' + DMCXP.wReplacCeros + '(DPREVMMN10,0)+' + DMCXP.wReplacCeros + '(DPREVMMN11,0)+' + DMCXP.wReplacCeros + '(DPREVMMN12,0)+' +
                  '(' + DMCXP.wReplacCeros + '(DPREASMN' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOMN' + xmes + ',0))-(' + DMCXP.wReplacCeros + '(DPREEJMN' + xmes + ',0)+' + xmonto + '),15,2),';

               ssql := ssql + 'DPRETOVPMN=(CASE WHEN ' + DMCXP.wReplacCeros + '(DPRETOASMN,0)+' + DMCXP.wReplacCeros + '(DPRETOMOMN,0)=0' +
                  ' THEN 200' +
                  ' ELSE DEC(((' + DMCXP.wReplacCeros + '(DPREEJMN01,0)+' + DMCXP.wReplacCeros + '(DPREEJMN02,0)+' + DMCXP.wReplacCeros + '(DPREEJMN03,0)+' + DMCXP.wReplacCeros + '(DPREEJMN04,0)+' + DMCXP.wReplacCeros + '(DPREEJMN05,0)+' + DMCXP.wReplacCeros + '(DPREEJMN06,0)+' +
                  ' ' + DMCXP.wReplacCeros + '(DPREEJMN07,0)+' + DMCXP.wReplacCeros + '(DPREEJMN08,0)+' + DMCXP.wReplacCeros + '(DPREEJMN09,0)+' + DMCXP.wReplacCeros + '(DPREEJMN10,0)+' + DMCXP.wReplacCeros + '(DPREEJMN11,0)+' + DMCXP.wReplacCeros + '(DPREEJMN12,0)+' +
                  xmonto + ')/((' + DMCXP.wReplacCeros + '(DPRETOASMN,0) )+(' + DMCXP.wReplacCeros + '(DPRETOMOMN,0))))*100,15,2)END),';
               ssql := ssql + 'DPRETOEJME=DEC(' + DMCXP.wReplacCeros + '(DPREEJME01,0)+' + DMCXP.wReplacCeros + '(DPREEJME02,0)+' + DMCXP.wReplacCeros + '(DPREEJME03,0)+' + DMCXP.wReplacCeros + '(DPREEJME04,0)+' + DMCXP.wReplacCeros + '(DPREEJME05,0)+' + DMCXP.wReplacCeros + '(DPREEJME06,0)+' +
                  '' + DMCXP.wReplacCeros + '(DPREEJME07,0)+' + DMCXP.wReplacCeros + '(DPREEJME08,0)+' + DMCXP.wReplacCeros + '(DPREEJME09,0)+' + DMCXP.wReplacCeros + '(DPREEJME10,0)+' + DMCXP.wReplacCeros + '(DPREEJME11,0)+' + DMCXP.wReplacCeros + '(DPREEJME12,0)+' +
                  FloatToStr(xcambio) + ',15,2),';
               ssql := ssql + 'DPRETOVMME=DEC(' + DMCXP.wReplacCeros + '(DPREVMME01,0)+' + DMCXP.wReplacCeros + '(DPREVMME02,0)+' + DMCXP.wReplacCeros + '(DPREVMME03,0)+' + DMCXP.wReplacCeros + '(DPREVMME04,0)+' + DMCXP.wReplacCeros + '(DPREVMME05,0)+' + DMCXP.wReplacCeros + '(DPREVMME06,0)+' +
                  '' + DMCXP.wReplacCeros + '(DPREVMME07,0)+' + DMCXP.wReplacCeros + '(DPREVMME08,0)+' + DMCXP.wReplacCeros + '(DPREVMME09,0)+' + DMCXP.wReplacCeros + '(DPREVMME10,0)+' + DMCXP.wReplacCeros + '(DPREVMME11,0)+' + DMCXP.wReplacCeros + '(DPREVMME12,0)+' +
                  '(' + DMCXP.wReplacCeros + '(DPREASME' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOME' + xmes + ',0))-(' + DMCXP.wReplacCeros + '(DPREEJME' + xmes + ',0)+' + FloatToStr(xcambio) + '),15,2),';
               ssql := ssql + 'DPRETOVPME=(CASE WHEN ' + DMCXP.wReplacCeros + '(DPRETOASME,0)+' + DMCXP.wReplacCeros + '(DPRETOMOME,0)=0' +
                  ' THEN 200' +
                  ' ELSE DEC(((' + DMCXP.wReplacCeros + '(DPREEJME01,0)+' + DMCXP.wReplacCeros + '(DPREEJME02,0)+' + DMCXP.wReplacCeros + '(DPREEJME03,0)+' + DMCXP.wReplacCeros + '(DPREEJME04,0)+' + DMCXP.wReplacCeros + '(DPREEJME05,0)+' + DMCXP.wReplacCeros + '(DPREEJME06,0)+' +
                  ' ' + DMCXP.wReplacCeros + '(DPREEJME07,0)+' + DMCXP.wReplacCeros + '(DPREEJME08,0)+' + DMCXP.wReplacCeros + '(DPREEJME09,0)+' + DMCXP.wReplacCeros + '(DPREEJME10,0)+' + DMCXP.wReplacCeros + '(DPREEJME11,0)+' + DMCXP.wReplacCeros + '(DPREEJME12,0)+' +
                  xmonto + ')/((' + DMCXP.wReplacCeros + '(DPRETOASME,0) )+(' + DMCXP.wReplacCeros + '(DPRETOMOME,0))))*100,15,2)END),';
            End
            Else
            Begin
               ssql := ssql + 'DPREVMMN' + xmes + '= DEC((' + DMCXP.wReplacCeros + '(DPREASMN' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOMN' + xmes + ',0))-(' + DMCXP.wReplacCeros + '(DPREEJMN' + xmes + ',0)+' + FloatToStr(xcambio) + '),15,2), ';
               ssql := ssql + 'DPREVMME' + xmes + '= DEC((' + DMCXP.wReplacCeros + '(DPREASME' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOME' + xmes + ',0))-(' + DMCXP.wReplacCeros + '(DPREEJME' + xmes + ',0)+' + xmonto + '),15,2), ';
               ssql := ssql + 'DPREVPMN' + xmes + '= (CASE WHEN ' + DMCXP.wReplacCeros + '(DPREASMN' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOMN' + xmes + ',0) = 0' +
                  ' THEN 200' +
                  ' ELSE DEC(((' + DMCXP.wReplacCeros + '(DPREEJMN' + xmes + ',0)+' + FloatToSTr(xcambio) + ')/(' + DMCXP.wReplacCeros + '(DPREASMN' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOMN' + xmes + ',0)))*100,15,2)END), ';
               ssql := ssql + 'DPREVPME' + xmes + '= (CASE WHEN ' + DMCXP.wReplacCeros + '(DPREASME' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOME' + xmes + ',0) = 0 ' +
                  ' THEN 200' +
                  ' ELSE DEC(((' + DMCXP.wReplacCeros + '(DPREEJME' + xmes + ',0)+' + xmonto + ')/(' + DMCXP.wReplacCeros + '(DPREASME' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOME' + xmes + ',0)))*100,15,2)END),';
               ssql := ssql + 'DPRETOEJME=DEC(' + DMCXP.wReplacCeros + '(DPREEJME01,0)+' + DMCXP.wReplacCeros + '(DPREEJME02,0)+' + DMCXP.wReplacCeros + '(DPREEJME03,0)+' + DMCXP.wReplacCeros + '(DPREEJME04,0)+' + DMCXP.wReplacCeros + '(DPREEJME05,0)+' + DMCXP.wReplacCeros + '(DPREEJME06,0)+' +
                  '' + DMCXP.wReplacCeros + '(DPREEJME07,0)+' + DMCXP.wReplacCeros + '(DPREEJME08,0)+' + DMCXP.wReplacCeros + '(DPREEJME09,0)+' + DMCXP.wReplacCeros + '(DPREEJME10,0)+' + DMCXP.wReplacCeros + '(DPREEJME11,0)+' + DMCXP.wReplacCeros + '(DPREEJME12,0)+' +
                  xmonto + ',15,2),';
               ssql := ssql + 'DPRETOVMME=DEC(' + DMCXP.wReplacCeros + '(DPREVMME01,0)+' + DMCXP.wReplacCeros + '(DPREVMME02,0)+' + DMCXP.wReplacCeros + '(DPREVMME03,0)+' + DMCXP.wReplacCeros + '(DPREVMME04,0)+' + DMCXP.wReplacCeros + '(DPREVMME05,0)+' + DMCXP.wReplacCeros + '(DPREVMME06,0)+' +
                  '' + DMCXP.wReplacCeros + '(DPREVMME07,0)+' + DMCXP.wReplacCeros + '(DPREVMME08,0)+' + DMCXP.wReplacCeros + '(DPREVMME09,0)+' + DMCXP.wReplacCeros + '(DPREVMME10,0)+' + DMCXP.wReplacCeros + '(DPREVMME11,0)+' + DMCXP.wReplacCeros + '(DPREVMME12,0)+' +
                  '(' + DMCXP.wReplacCeros + '(DPREASME' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOME' + xmes + ',0))-(' + DMCXP.wReplacCeros + '(DPREEJME' + xmes + ',0)+' + xmonto + '),15,2),';
               ssql := ssql + 'DPRETOVPME=(CASE WHEN ' + DMCXP.wReplacCeros + '(DPRETOASME,0)+' + DMCXP.wReplacCeros + '(DPRETOMOME,0) = 0 ' +
                  ' THEN 200 ' +
                  ' ELSE DEC(((' + DMCXP.wReplacCeros + '(DPREEJME01,0)+' + DMCXP.wReplacCeros + '(DPREEJME02,0)+' + DMCXP.wReplacCeros + '(DPREEJME03,0)+' + DMCXP.wReplacCeros + '(DPREEJME04,0)+' + DMCXP.wReplacCeros + '(DPREEJME05,0)+' + DMCXP.wReplacCeros + '(DPREEJME06,0)+' +
                  '' + DMCXP.wReplacCeros + '(DPREEJME07,0)+' + DMCXP.wReplacCeros + '(DPREEJME08,0)+' + DMCXP.wReplacCeros + '(DPREEJME09,0)+' + DMCXP.wReplacCeros + '(DPREEJME10,0)+' + DMCXP.wReplacCeros + '(DPREEJME11,0)+' + DMCXP.wReplacCeros + '(DPREEJME12,0)+' +
                  xmonto + ')/((' + DMCXP.wReplacCeros + '(DPRETOASME,0))+(' + DMCXP.wReplacCeros + '(DPRETOMOME,0))))*100,15,2)END),';
               ssql := ssql + 'DPRETOEJMN=DEC(' + DMCXP.wReplacCeros + '(DPREEJMN01,0)+' + DMCXP.wReplacCeros + '(DPREEJMN02,0)+' + DMCXP.wReplacCeros + '(DPREEJMN03,0)+' + DMCXP.wReplacCeros + '(DPREEJMN04,0)+' + DMCXP.wReplacCeros + '(DPREEJMN05,0)+' + DMCXP.wReplacCeros + '(DPREEJMN06,0)+' +
                  '' + DMCXP.wReplacCeros + '(DPREEJMN07,0)+' + DMCXP.wReplacCeros + '(DPREEJMN08,0)+' + DMCXP.wReplacCeros + '(DPREEJMN09,0)+' + DMCXP.wReplacCeros + '(DPREEJMN10,0)+' + DMCXP.wReplacCeros + '(DPREEJMN11,0)+' + DMCXP.wReplacCeros + '(DPREEJMN12,0)+' +
                  FloatToStr(xcambio) + ',15,2),';
               ssql := ssql + 'DPRETOVMMN=DEC(' + DMCXP.wReplacCeros + '(DPREVMMN01,0)+' + DMCXP.wReplacCeros + '(DPREVMMN02,0)+' + DMCXP.wReplacCeros + '(DPREVMMN03,0)+' + DMCXP.wReplacCeros + '(DPREVMMN04,0)+' + DMCXP.wReplacCeros + '(DPREVMMN05,0)+' + DMCXP.wReplacCeros + '(DPREVMMN06,0)+' +
                  '' + DMCXP.wReplacCeros + '(DPREVMMN07,0)+' + DMCXP.wReplacCeros + '(DPREVMMN08,0)+' + DMCXP.wReplacCeros + '(DPREVMMN09,0)+' + DMCXP.wReplacCeros + '(DPREVMMN10,0)+' + DMCXP.wReplacCeros + '(DPREVMMN11,0)+' + DMCXP.wReplacCeros + '(DPREVMMN12,0)+' +
                  '(' + DMCXP.wReplacCeros + '(DPREASMN' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOMN' + xmes + ',0))-(' + DMCXP.wReplacCeros + '(DPREEJMN' + xmes + ',0)+' + FloatToStr(xcambio) + '),15,2),';

               ssql := ssql + 'DPRETOVPMN=(CASE WHEN ' + DMCXP.wReplacCeros + '(DPRETOASMN,0)+' + DMCXP.wReplacCeros + '(DPRETOMOMN,0) = 0' +
                  ' THEN 200 ' +
                  ' ELSE DEC(((' + DMCXP.wReplacCeros + '(DPREEJMN01,0)+' + DMCXP.wReplacCeros + '(DPREEJMN02,0)+' + DMCXP.wReplacCeros + '(DPREEJMN03,0)+' + DMCXP.wReplacCeros + '(DPREEJMN04,0)+' + DMCXP.wReplacCeros + '(DPREEJMN05,0)+' + DMCXP.wReplacCeros + '(DPREEJMN06,0)+' +
                  ' ' + DMCXP.wReplacCeros + '(DPREEJMN07,0)+' + DMCXP.wReplacCeros + '(DPREEJMN08,0)+' + DMCXP.wReplacCeros + '(DPREEJMN09,0)+' + DMCXP.wReplacCeros + '(DPREEJMN10,0)+' + DMCXP.wReplacCeros + '(DPREEJMN11,0)+' + DMCXP.wReplacCeros + '(DPREEJMN12,0)+' +
                  FloatToStr(xcambio) + ')/(' + DMCXP.wReplacCeros + '(DPRETOASMN,0)+' + DMCXP.wReplacCeros + '(DPRETOMOMN,0)))*100,15,2)END),';
            End;
            ssql := ssql + 'RQPARTUSER=' + quotedstr(DMCXP.wUsuario);
            xFecha := formatdatetime(DMCXP.wFormatFecha, Date);
            ssql := ssql + ',RQPARTFREG =' + quotedstr(xfecha);
            xhora := formatdatetime('hh:nn:ss', time);
            ssql := ssql + ',RQPARTHREG =' + quotedstr(xhora) +
               ' WHERE CIAID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString) +
               ' AND CCOSID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString) +
               ' AND TIPPRESID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('TIPPRESID').AsString) +
               ' AND PARPRESID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('PARPRESID').AsString) +
               ' AND RQPARTANO=' + quotedstr(copy(meAnoMM.Text, 1, 4));
            Try
               DMCXP.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
               Raise exception.Create('No se pudo actualizar Presupuesto');
            End;
      // se inicia la actualización de la cabecera
      { inicializo en cero el arreglo }
            For iX := 1 To 48 Do
               xTotal[iX] := 0;
            For iX := 1 To 6 Do
               xTotg[iX] := 0;
            For iX := 1 To 24 Do
               xasxmes[iX] := 0;
            For iX := 1 To 24 Do
               xmoxmes[iX] := 0;
            For iX := 1 To 24 Do
               xvpxmes[iX] := 0;
      { para cargar los AS y MO de cada mes }
            ssql := '';
            ssql := 'SELECT * FROM PPRES300' +
               ' WHERE CIAID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString) +
               ' AND CCOSID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString) +
               ' AND RQPARTANO=' + quotedstr(copy(meAnoMM.Text, 1, 4));
            DMCXP.cdsQry2.Close;
            DMCXP.cdsQry2.ProviderName := 'dspCxP';
            DMCXP.cdsQry2.DataRequest(ssql);
            DMCXP.cdsQry2.open;
            DMCXP.cdsQry2.First;
            While Not DMCXP.cdsQry2.Eof Do
            Begin
               For iX := 1 To 12 Do
               Begin
                  xmes := StrZero(IntToStr(iX), 2);
                  xasxmes[iX] := DMCXP.cdsQry2.fieldbyname('DPREASMN' + xmes).AsFloat;
                  xasxmes[iX + 12] := DMCXP.cdsQry2.fieldbyname('DPREASME' + xmes).AsFloat;
                  xmoxmes[iX] := DMCXP.cdsQry2.fieldbyname('DPREMOMN' + xmes).AsFloat;
                  xmoxmes[iX + 12] := DMCXP.cdsQry2.fieldbyname('DPREMOME' + xmes).AsFloat;
               End;
               DMCXP.cdsQry2.Next;
            End;

      { actualiza la cabecera de Presupuesto PPRES300, toma del PPRES301
       los EJ,VM y VP por mes para un mismo centro de costo y los sumariza
       para cargarlos a los campos respectivos del PPRES300 }
            ssql := '';
            ssql := 'SELECT * FROM PPRES301' +
               ' WHERE CIAID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString) +
               ' AND CCOSID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString) +
               ' AND RQPARTANO=' + quotedstr(copy(meAnoMM.Text, 1, 4));
            DMCXP.cdsQry2.Close;
            DMCXP.cdsQry2.ProviderName := 'dspCxP';
            DMCXP.cdsQry2.DataRequest(ssql);
            DMCXP.cdsQry2.open;
            DMCXP.cdsQry2.First;
      { recorro la tabla PPRES301 para hallar los totales por mes y
       por campos( EJ, VM, VP ) y por mes }
            While Not DMCXP.cdsQry2.Eof Do
            Begin
               ssql := '';
               ssql := 'PARPRESID=' + quotedstr(DMCXP.cdsQry2.fieldbyname('PARPRESID').AsString);
               xIS := BuscaQRY('dspPlaParPre', 'PPRES201', '*', ssql, 'PARPRES_IS');
       //**
               For iX := 1 To 24 Do
                  Case iX Of
        { para DPREEJMN01..12 }
                     1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12:
                        Begin
                           xmes := StrZero(IntToStr(iX), 2);
                           If xIS = 'S' Then
                              xTotal[iX] := xTotal[iX] + DMCXP.cdsQry2.fieldbyname('DPREEJMN' + xmes).AsFloat
                           Else
                              xTotal[iX] := xTotal[iX] - DMCXP.cdsQry2.fieldbyname('DPREEJMN' + xmes).AsFloat;
                        End;
        { para DPREEJME01..12 }
                     13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24:
                        Begin
                           xmes := StrZero(IntToStr(iX - 12), 2);
                           If xIS = 'S' Then
                              xTotal[iX] := xTotal[iX] + DMCXP.cdsQry2.fieldbyname('DPREEJME' + xmes).AsFloat
                           Else
                              xTotal[iX] := xTotal[iX] - DMCXP.cdsQry2.fieldbyname('DPREEJME' + xmes).AsFloat;
                        End;
                  End;
               DMCXP.cdsQry2.next;
            End;
      // para controlar el error del INFINITO
            xestado := false;
            For ix := 1 To 12 Do
               If (xasxmes[ix] <> 0) Or (xmoxmes[ix] <> 0) Then
               Begin
                  xestado := true;
                  Break;
               End;
      { hallo el total por mes de VP }
            For ix := 1 To 12 Do
            Begin
               If StrZero(IntToStr(iX), 2) = copy(meAnoMM.text, 5, 2) Then
               Begin
                { para DPREVMMN01..12 }
                  xTotal[iX + 24] := (xasxmes[iX] + xmoxmes[iX]) - xTotal[iX];
                { para DPREVMME01..12 }
                  xTotal[iX + 36] := (xasxmes[iX + 12] + xmoxmes[iX + 12]) - xTotal[iX + 12];
                  If xestado = False Then
                  Begin
                   // los igualo a cero
                     xvpxmes[iX] := 0;
                   { para VPME }
                     xvpxmes[iX + 12] := 0;
                  End
                  Else
                  Begin
                  { para VPMN }
                     xvpxmes[iX] := (xtotal[ix] / (xasxmes[iX] + xmoxmes[iX])) * 100;
                  { para VPME }
                     xvpxmes[iX + 12] := (xtotal[ix + 12] / (xasxmes[iX + 12] + xmoxmes[iX + 12])) * 100;
                  End;
               End;
            End;
            ssql := '';
            ssql := 'Update PPRES300 Set ';
            For iX := 1 To 12 Do
            Begin
               xmes := StrZero(IntToStr(iX), 2);
             { carga para cada mes y campo el valor hallado en las lineas de
               arriba }
               ssql := ssql + ' DPREEJMN' + xmes + '=DEC(' + FloatToStr(xtotal[iX]) + ',15,2),';
               ssql := ssql + ' DPREEJME' + xmes + '=DEC(' + FloatToStr(xtotal[iX + 12]) + ',15,2),';
               ssql := ssql + ' DPREVMMN' + xmes + '=DEC(' + FloatToStr(xtotal[iX + 24]) + ',15,2),';
               ssql := ssql + ' DPREVMME' + xmes + '=DEC(' + FloatToStr(xtotal[iX + 36]) + ',15,2),';
               ssql := ssql + ' DPREVPMN' + xmes + '=DEC(' + FloatToStr(xvpxmes[iX]) + ',15,2),';
               ssql := ssql + ' DPREVPME' + xmes + '=DEC(' + FloatToStr(xvpxmes[iX + 12]) + ',15,2),';
            End;
           { SUMATORIA DE LOS EJMN, LOS DOCE MESES }
            For iX := 1 To 12 Do
               xtotG[1] := xtotG[1] + xtotal[iX];
           { SUMATORIA DE LOS EJME, LOS DOCE MESES }
            For iX := 13 To 24 Do
               xtotG[2] := xtotG[2] + xtotal[iX];
           { SUMATORIA DE LOS MOMN, LOS DOCE MESES }
            For iX := 25 To 36 Do
               xtotG[3] := xtotG[3] + xtotal[iX];
           { SUMATORIA DE LOS MOME, LOS DOCE MESES }
            For iX := 37 To 48 Do
               xtotG[4] := xtotG[4] + xtotal[iX];
           {  calculo del total VPMN si es <> de 0 al menos uno, para que no me de
              el error de INFINITO }
            If xestado = False Then
            Begin
             // los igualo a cero
               xtotG[5] := 0;
               xtotG[6] := 0;
            End
            Else
            Begin
             // calculo del Total VMMN
               xtotG[5] := (xtotG[1] / ((xasxmes[1] + xasxmes[2] + xasxmes[3] + xasxmes[4] + xasxmes[5] + xasxmes[6] +
                  xasxmes[7] + xasxmes[8] + xasxmes[9] + xasxmes[10] + xasxmes[11] + xasxmes[12]) +
                  (xmoxmes[1] + xmoxmes[2] + xmoxmes[3] + xmoxmes[4] + xmoxmes[5] + xmoxmes[6] +
                  xmoxmes[7] + xmoxmes[8] + xmoxmes[9] + xmoxmes[10] + xmoxmes[11] + xmoxmes[12]))) * 100;
             { calculo del total VPME }
               xtotG[6] := (xtotG[2] / ((xasxmes[13] + xasxmes[14] + xasxmes[15] + xasxmes[16] + xasxmes[17] + xasxmes[18] +
                  xasxmes[19] + xasxmes[20] + xasxmes[21] + xasxmes[22] + xasxmes[23] + xasxmes[24]) +
                  (xmoxmes[13] + xmoxmes[14] + xmoxmes[15] + xmoxmes[16] + xmoxmes[17] + xmoxmes[18] +
                  xmoxmes[19] + xmoxmes[20] + xmoxmes[21] + xmoxmes[22] + xmoxmes[23] + xmoxmes[24]))) * 100;
            End;
           { asigno los totales para EJ,VM y VP en MN y ME }
            ssql := ssql + ' DPRETOEJMN=DEC(' + FloatToStr(xtotg[1]) + ',15,2),';
            ssql := ssql + ' DPRETOEJME=DEC(' + FloatToStr(xtotg[2]) + ',15,2),';
            ssql := ssql + ' DPRETOVMMN=DEC(' + FloatToStr(xtotg[3]) + ',15,2),';
            ssql := ssql + ' DPRETOVMME=DEC(' + FloatToStr(xtotg[4]) + ',15,2),';
            ssql := ssql + ' DPRETOVPMN=DEC(' + FloatToStr(xtotg[5]) + ',15,2),';
            ssql := ssql + ' DPRETOVPME=DEC(' + FloatToStr(xtotg[6]) + ',15,2),';
           { otros campos a actualizar }
            ssql := ssql + 'RQPARTUSER=' + quotedstr(DMCXP.wUsuario);
            xFecha := formatdatetime(DMCXP.wFormatFecha, Date);
            ssql := ssql + ',RQPARTFREG =' + quotedstr(xfecha);
            xhora := formatdatetime('hh:nn:ss', time);
            ssql := ssql + ',RQPARTHREG =' + quotedstr(xhora) +
           { condicional }
            ' WHERE CIAID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString) +
               ' AND CCOSID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString) +
               ' AND RQPARTANO=' + quotedstr(copy(meAnoMM.Text, 1, 4));
            Try
               DMCXP.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
               Raise exception.Create('No se pudo actualizar Presupuesto');
            End;
         End;
         DMCXP.cdsDetCxP.Next;
      End;
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         CreaSuperior;
         DMCXP.cdsDetCxP.First;
         While Not DMCXP.cdsDetCxP.eof Do
         Begin
      { registros que tienen las pp}
            If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MG') Or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'NG')
               Or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MN') Or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'BI') Then
            Begin
               xmes := copy(meAnoMM.Text, 5, 2);
               ssql := '';
               ssql := 'Update PPRES301 Set ';
               If dblcTMon.Text = DMCXP.wTMonLoc Then
               Begin
                  xCambio := StrToFloat(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString) / StrToFloat(dbeTCambio.text);
                  xEjecuME := '(' + DMCXP.wReplacCeros + '(DPREEJME' + xmes + ',0) + ' + FloatToStr(xcambio) + ')';
                  xEjecuMN := '(' + DMCXP.wReplacCeros + '(DPREEJMN' + xmes + ',0) + ' + DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString + ')';
                  xmonto := DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString;
               End
               Else
               Begin
                  xCambio := StrToFloat(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString) * StrToFloat(dbeTCambio.text);
                  xEjecuME := '(' + DMCXP.wReplacCeros + '(DPREEJME' + xmes + ',0) + ' + DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString + ')';
                  xEjecuMN := '(' + DMCXP.wReplacCeros + '(DPREEJMN' + xmes + ',0) + ' + FloatToStr(xcambio) + ')';
                  xmonto := DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString;
               End;
               ssql := ssql + 'DPREEJMN' + xmes + '= TRUNC(' + xEjecuMN + ',2), ';
               ssql := ssql + 'DPREEJME' + xmes + '= TRUNC(' + xEjecuME + ',2), ';
               If dblcTMon.Text = DMCXP.wTMonLoc Then
               Begin
                  ssql := ssql + 'DPREVMMN' + xmes + '= TRUNC((' + DMCXP.wReplacCeros + '(DPREASMN' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOMN' + xmes + ',0))-(' + DMCXP.wReplacCeros + '(DPREEJMN' + xmes + ',0)+' + xmonto + '),2), ';
                  ssql := ssql + 'DPREVMME' + xmes + '= TRUNC((' + DMCXP.wReplacCeros + '(DPREASME' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOME' + xmes + ',0))-(' + DMCXP.wReplacCeros + '(DPREEJME' + xmes + ',0)+' + FloatToStr(xcambio) + '),2), ';

                  ssql := ssql + 'DPREVPMN' + xmes + '= (DECODE(NVL(DPRETOASMN,0)+NVL(DPRETOMOMN,0),0, 200, ' +
                     'TRUNC(((' + DMCXP.wReplacCeros + '(DPREEJMN' + xmes + ',0)+' + xmonto + ')/(' + DMCXP.wReplacCeros + '(DPREASMN' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOMN' + xmes + ',0)))*100,2)),';

                  ssql := ssql + 'DPREVPME' + xmes + '= (DECODE(NVL(DPRETOASME,0)+NVL(DPRETOMOME,0),0, 200, ' +
                     'TRUNC(((' + DMCXP.wReplacCeros + '(DPREEJME' + xmes + ',0)+' + xmonto + ')/(' + DMCXP.wReplacCeros + '(DPREASME' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOME' + xmes + ',0)))*100,2)), ';

                  ssql := ssql + 'DPRETOEJMN=TRUNC(' + DMCXP.wReplacCeros + '(DPREEJMN01,0)+' + DMCXP.wReplacCeros + '(DPREEJMN02,0)+' + DMCXP.wReplacCeros + '(DPREEJMN03,0)+' + DMCXP.wReplacCeros + '(DPREEJMN04,0)+' + DMCXP.wReplacCeros + '(DPREEJMN05,0)+' + DMCXP.wReplacCeros + '(DPREEJMN06,0)+' +
                     '' + DMCXP.wReplacCeros + '(DPREEJMN07,0)+' + DMCXP.wReplacCeros + '(DPREEJMN08,0)+' + DMCXP.wReplacCeros + '(DPREEJMN09,0)+' + DMCXP.wReplacCeros + '(DPREEJMN10,0)+' + DMCXP.wReplacCeros + '(DPREEJMN11,0)+' + DMCXP.wReplacCeros + '(DPREEJMN12,0)+' +
                     xmonto + ',2), ';
                  ssql := ssql + 'DPRETOVMMN=TRUNC(' + DMCXP.wReplacCeros + '(DPREVMMN01,0)+' + DMCXP.wReplacCeros + '(DPREVMMN02,0)+' + DMCXP.wReplacCeros + '(DPREVMMN03,0)+' + DMCXP.wReplacCeros + '(DPREVMMN04,0)+' + DMCXP.wReplacCeros + '(DPREVMMN05,0)+' + DMCXP.wReplacCeros + '(DPREVMMN06,0)+' +
                     '' + DMCXP.wReplacCeros + '(DPREVMMN07,0)+' + DMCXP.wReplacCeros + '(DPREVMMN08,0)+' + DMCXP.wReplacCeros + '(DPREVMMN09,0)+' + DMCXP.wReplacCeros + '(DPREVMMN10,0)+' + DMCXP.wReplacCeros + '(DPREVMMN11,0)+' + DMCXP.wReplacCeros + '(DPREVMMN12,0)+' +
                     '(' + DMCXP.wReplacCeros + '(DPREASMN' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOMN' + xmes + ',0))-(' + DMCXP.wReplacCeros + '(DPREEJMN' + xmes + ',0)+' + xmonto + '),2), ';

                  ssql := ssql + 'DPRETOVPMN' + xmes + '= (DECODE(NVL(DPRETOASMN,0)+NVL(DPRETOMOMN,0),0, 200, ' +
                     'TRUNC(((' + DMCXP.wReplacCeros + '(DPREEJMN01,0)+' + DMCXP.wReplacCeros + '(DPREEJMN02,0)+' + DMCXP.wReplacCeros + '(DPREEJMN03,0)+' + DMCXP.wReplacCeros + '(DPREEJMN04,0)+' + DMCXP.wReplacCeros + '(DPREEJMN05,0)+' + DMCXP.wReplacCeros + '(DPREEJMN06,0)+' +
                     ' ' + DMCXP.wReplacCeros + '(DPREEJMN07,0)+' + DMCXP.wReplacCeros + '(DPREEJMN08,0)+' + DMCXP.wReplacCeros + '(DPREEJMN09,0)+' + DMCXP.wReplacCeros + '(DPREEJMN10,0)+' + DMCXP.wReplacCeros + '(DPREEJMN11,0)+' + DMCXP.wReplacCeros + '(DPREEJMN12,0)+' +
                     xmonto + ')/((' + DMCXP.wReplacCeros + '(DPRETOASMN,0) )+(' + DMCXP.wReplacCeros + '(DPRETOMOMN,0))))*100,2))), ';

                  ssql := ssql + 'DPRETOEJME=TRUNC(' + DMCXP.wReplacCeros + '(DPREEJME01,0)+' + DMCXP.wReplacCeros + '(DPREEJME02,0)+' + DMCXP.wReplacCeros + '(DPREEJME03,0)+' + DMCXP.wReplacCeros + '(DPREEJME04,0)+' + DMCXP.wReplacCeros + '(DPREEJME05,0)+' + DMCXP.wReplacCeros + '(DPREEJME06,0)+' +
                     '' + DMCXP.wReplacCeros + '(DPREEJME07,0)+' + DMCXP.wReplacCeros + '(DPREEJME08,0)+' + DMCXP.wReplacCeros + '(DPREEJME09,0)+' + DMCXP.wReplacCeros + '(DPREEJME10,0)+' + DMCXP.wReplacCeros + '(DPREEJME11,0)+' + DMCXP.wReplacCeros + '(DPREEJME12,0)+' +
                     FloatToStr(xcambio) + ',2),';

                  ssql := ssql + 'DPRETOEJME=TRUNC(' + DMCXP.wReplacCeros + '(DPREVMME01,0)+' + DMCXP.wReplacCeros + '(DPREVMME02,0)+' + DMCXP.wReplacCeros + '(DPREVMME03,0)+' + DMCXP.wReplacCeros + '(DPREVMME04,0)+' + DMCXP.wReplacCeros + '(DPREVMME05,0)+' + DMCXP.wReplacCeros + '(DPREVMME06,0)+' +
                     '' + DMCXP.wReplacCeros + '(DPREVMME07,0)+' + DMCXP.wReplacCeros + '(DPREVMME08,0)+' + DMCXP.wReplacCeros + '(DPREVMME09,0)+' + DMCXP.wReplacCeros + '(DPREVMME10,0)+' + DMCXP.wReplacCeros + '(DPREVMME11,0)+' + DMCXP.wReplacCeros + '(DPREVMME12,0)+' +
                     '(' + DMCXP.wReplacCeros + '(DPREASME' + xmes + ',0) + ' + DMCXP.wReplacCeros + '(DPREMOME' + xmes + ',0))-(' + DMCXP.wReplacCeros + '(DPREEJME' + xmes + ',0)+' + FloatToStr(xcambio) + '),2),';

                  ssql := ssql + 'DPRETOVPME=(DECODE(NVL(DPRETOASME,0)+NVL(DPRETOMOME,0),0,200, ' +
                     'TRUNC(((' + DMCXP.wReplacCeros + '(DPREEJME01,0)+' + DMCXP.wReplacCeros + '(DPREEJME02,0)+' + DMCXP.wReplacCeros + '(DPREEJME03,0)+' + DMCXP.wReplacCeros + '(DPREEJME04,0)+' + DMCXP.wReplacCeros + '(DPREEJME05,0)+' + DMCXP.wReplacCeros + '(DPREEJME06,0)+' +
                     ' ' + DMCXP.wReplacCeros + '(DPREEJME07,0)+' + DMCXP.wReplacCeros + '(DPREEJME08,0)+' + DMCXP.wReplacCeros + '(DPREEJME09,0)+' + DMCXP.wReplacCeros + '(DPREEJME10,0)+' + DMCXP.wReplacCeros + '(DPREEJME11,0)+' + DMCXP.wReplacCeros + '(DPREEJME12,0)+' +
                     xmonto + ')/((' + DMCXP.wReplacCeros + '(DPRETOASME,0) )+(' + DMCXP.wReplacCeros + '(DPRETOMOME,0))))*100,2))), ';

               End
               Else
               Begin
                  ssql := ssql + 'DPREVMMN' + xmes + '= TRUNC((NVL(DPREASMN' + xmes + ',0) + NVL(DPREMOMN' + xmes + ',0))-(NVL(DPREEJMN' + xmes + ',0)+' + FloatToStr(xcambio) + '),2), ';
                  ssql := ssql + 'DPREVMME' + xmes + '= TRUNC((NVL(DPREASME' + xmes + ',0) + NVL(DPREMOME' + xmes + ',0))-(NVL(DPREEJME' + xmes + ',0)+' + xmonto + '),2), ';
                  ssql := ssql + 'DPREVPMN' + xmes + '= (DECODE(NVL(DPREASMN' + xmes + ',0) + NVL(DPREMOMN' + xmes + ',0),0,200, ' +
                     ' TRUNC(((NVL(DPREEJMN' + xmes + ',0)+' + FloatToSTr(xcambio) + ')/(NVL(DPREASMN' + xmes + ',0) + NVL(DPREMOMN' + xmes + ',0)))*100,2))), ';
                  ssql := ssql + 'DPREVPME' + xmes + '= (DECODE(NVL(DPREASME' + xmes + ',0) + NVL(DPREMOME' + xmes + ',0),0,200, ' +
                     'TRUNC(((NVL(DPREEJME' + xmes + ',0)+' + xmonto + ')/(NVL(DPREASME' + xmes + ',0) + NVL(DPREMOME' + xmes + ',0)))*100,2))),';
                  ssql := ssql + 'DPRETOEJME=TRUNC(NVL(DPREEJME01,0)+NVL(DPREEJME02,0)+NVL(DPREEJME03,0)+NVL(DPREEJME04,0)+NVL(DPREEJME05,0)+NVL(DPREEJME06,0)+' +
                     'NVL(DPREEJME07,0)+NVL(DPREEJME08,0)+NVL(DPREEJME09,0)+NVL(DPREEJME10,0)+NVL(DPREEJME11,0)+NVL(DPREEJME12,0)+' +
                     xmonto + ',2),';
                  ssql := ssql + 'DPRETOVMME=TRUNC(NVL(DPREVMME01,0)+NVL(DPREVMME02,0)+NVL(DPREVMME03,0)+NVL(DPREVMME04,0)+NVL(DPREVMME05,0)+NVL(DPREVMME06,0)+' +
                     'NVL(DPREVMME07,0)+NVL(DPREVMME08,0)+NVL(DPREVMME09,0)+NVL(DPREVMME10,0)+NVL(DPREVMME11,0)+NVL(DPREVMME12,0)+' +
                     '(NVL(DPREASME' + xmes + ',0) + NVL(DPREMOME' + xmes + ',0))-(NVL(DPREEJME' + xmes + ',0)+' + xmonto + '),2),';
                  ssql := ssql + 'DPRETOVPME=(DECODE(NVL(DPRETOASME,0)+NVL(DPRETOMOME,0),0,200, ' +
                     ' TRUNC(((NVL(DPREEJME01,0)+NVL(DPREEJME02,0)+NVL(DPREEJME03,0)+NVL(DPREEJME04,0)+NVL(DPREEJME05,0)+NVL(DPREEJME06,0)+' +
                     'NVL(DPREEJME07,0)+NVL(DPREEJME08,0)+NVL(DPREEJME09,0)+NVL(DPREEJME10,0)+NVL(DPREEJME11,0)+NVL(DPREEJME12,0)+' +
                     xmonto + ')/((NVL(DPRETOASME,0))+(NVL(DPRETOMOME,0))))*100,2))),';
                  ssql := ssql + 'DPRETOEJMN=TRUNC(NVL(DPREEJMN01,0)+NVL(DPREEJMN02,0)+NVL(DPREEJMN03,0)+NVL(DPREEJMN04,0)+NVL(DPREEJMN05,0)+NVL(DPREEJMN06,0)+' +
                     'NVL(DPREEJMN07,0)+NVL(DPREEJMN08,0)+NVL(DPREEJMN09,0)+NVL(DPREEJMN10,0)+NVL(DPREEJMN11,0)+NVL(DPREEJMN12,0)+' +
                     FloatToStr(xcambio) + ',2),';
                  ssql := ssql + 'DPRETOVMMN=TRUNC(NVL(DPREVMMN01,0)+NVL(DPREVMMN02,0)+NVL(DPREVMMN03,0)+NVL(DPREVMMN04,0)+NVL(DPREVMMN05,0)+NVL(DPREVMMN06,0)+' +
                     'NVL(DPREVMMN07,0)+NVL(DPREVMMN08,0)+NVL(DPREVMMN09,0)+NVL(DPREVMMN10,0)+NVL(DPREVMMN11,0)+NVL(DPREVMMN12,0)+' +
                     '(NVL(DPREASMN' + xmes + ',0) + NVL(DPREMOMN' + xmes + ',0))-(NVL(DPREEJMN' + xmes + ',0)+' + FloatToStr(xcambio) + '),2),';

                  ssql := ssql + 'DPRETOVPMN=(DECODE(NVL(DPRETOASMN,0)+NVL(DPRETOMOMN,0),0,200, ' +
                     ' TRUNC(((NVL(DPREEJMN01,0)+NVL(DPREEJMN02,0)+NVL(DPREEJMN03,0)+NVL(DPREEJMN04,0)+NVL(DPREEJMN05,0)+NVL(DPREEJMN06,0)+' +
                     ' NVL(DPREEJMN07,0)+NVL(DPREEJMN08,0)+NVL(DPREEJMN09,0)+NVL(DPREEJMN10,0)+NVL(DPREEJMN11,0)+NVL(DPREEJMN12,0)+' +
                     FloatToStr(xcambio) + ')/(NVL(DPRETOASMN,0)+NVL(DPRETOMOMN,0)))*100,2))),';
               End;
               ssql := ssql + 'RQPARTUSER=' + quotedstr(DMCXP.wUsuario);
               xFecha := formatdatetime(DMCXP.wFormatFecha, Date);
               ssql := ssql + ',RQPARTFREG =' + quotedstr(xfecha);
               xhora := formatdatetime('hh:nn:ss', time);
               ssql := ssql + ',RQPARTHREG =' + quotedstr(xhora) +
                  ' WHERE CIAID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString) +
                  ' AND CCOSID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString) +
                  ' AND TIPPRESID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('TIPPRESID').AsString) +
                  ' AND PARPRESID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('PARPRESID').AsString) +
                  ' AND RQPARTANO=' + quotedstr(copy(meAnoMM.Text, 1, 4));
               Try
                  DMCXP.DCOM1.AppServer.EjecutaSQL(sSQL);
               Except
                  Raise exception.Create('No se pudo actualizar Presupuesto');
               End;
           // se inicia la actualización de la cabecera
           { inicializo en cero el arreglo }
               For iX := 1 To 48 Do
                  xTotal[iX] := 0;
               For iX := 1 To 6 Do
                  xTotg[iX] := 0;
               For iX := 1 To 24 Do
                  xasxmes[iX] := 0;
               For iX := 1 To 24 Do
                  xmoxmes[iX] := 0;
               For iX := 1 To 24 Do
                  xvpxmes[iX] := 0;
           { para cargar los AS y MO de cada mes }
               ssql := '';
               ssql := 'SELECT * FROM PPRES300' +
                  ' WHERE CIAID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString) +
                  ' AND CCOSID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString) +
                  ' AND RQPARTANO=' + quotedstr(copy(meAnoMM.Text, 1, 4));
               DMCXP.cdsQry2.Close;
               DMCXP.cdsQry2.ProviderName := 'dspCxP';
               DMCXP.cdsQry2.DataRequest(ssql);
               DMCXP.cdsQry2.open;
               DMCXP.cdsQry2.First;
               While Not DMCXP.cdsQry2.Eof Do
               Begin
                  For iX := 1 To 12 Do
                  Begin
                     xmes := StrZero(IntToStr(iX), 2);
                     xasxmes[iX] := StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREASMN' + xmes).AsString);
                     xasxmes[iX + 12] := StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREASME' + xmes).AsString);
                     xmoxmes[iX] := StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREMOMN' + xmes).AsString);
                     xmoxmes[iX + 12] := StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREMOME' + xmes).AsString);
                  End;
                  DMCXP.cdsQry2.Next;
               End;

           { actualiza la cabecera de Presupuesto PPRES300, toma del PPRES301
             los EJ,VM y VP por mes para un mismo centro de costo y los sumariza
             para cargarlos a los campos respectivos del PPRES300 }
               ssql := '';
               ssql := 'SELECT * FROM PPRES301' +
                  ' WHERE CIAID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString) +
                  ' AND CCOSID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString) +
                  ' AND RQPARTANO=' + quotedstr(copy(meAnoMM.Text, 1, 4));
               DMCXP.cdsQry2.Close;
               DMCXP.cdsQry2.ProviderName := 'dspCxP';
               DMCXP.cdsQry2.DataRequest(ssql);
               DMCXP.cdsQry2.open;
               DMCXP.cdsQry2.First;
           { recorro la tabla PPRES301 para hallar los totales por mes y
             por campos( EJ, VM, VP ) y por mes }
               While Not DMCXP.cdsQry2.Eof Do
               Begin
                  ssql := '';
                  ssql := 'PARPRESID=' + quotedstr(DMCXP.cdsQry2.fieldbyname('PARPRESID').AsString);
                  xIS := BuscaQRY('dspPlaParPre', 'PPRES201', '*', ssql, 'PARPRES_IS');
             //**
                  For iX := 1 To 24 Do
                     Case iX Of
                { para DPREEJMN01..12 }
                        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12:
                           Begin
                              xmes := StrZero(IntToStr(iX), 2);
                    // del PPRES201 es I = resta,  o S = suma
                              If xIS = 'S' Then
                                 xTotal[iX] := xTotal[iX] + StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREEJMN' + xmes).AsString)
                              Else
                                 xTotal[iX] := xTotal[iX] - StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREEJMN' + xmes).AsString)
                           End;
               { para DPREEJME01..12 }
                        13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24:
                           Begin
                              xmes := StrZero(IntToStr(iX - 12), 2);
                    // del PPRES201 es I = resta,  o S = suma
                              If xIS = 'S' Then
                                 xTotal[iX] := xTotal[iX] + StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREEJME' + xmes).AsString)
                              Else
                                 xTotal[iX] := xTotal[iX] - StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREEJME' + xmes).AsString)
                           End;
                     End;
                  DMCXP.cdsQry2.next;
               End;
           // para controlar el error del INFINITO
               xestado := false;
               For ix := 1 To 12 Do
                  If (xasxmes[ix] <> 0) Or (xmoxmes[ix] <> 0) Then
                  Begin
                     xestado := true;
                     Break;
                  End;
           { hallo el total por mes de VP }
               For ix := 1 To 12 Do
               Begin
                  If StrZero(IntToStr(iX), 2) = copy(meAnoMM.text, 5, 2) Then
                  Begin
                { para DPREVMMN01..12 }
                     xTotal[iX + 24] := (xasxmes[iX] + xmoxmes[iX]) - xTotal[iX];
                { para DPREVMME01..12 }
                     xTotal[iX + 36] := (xasxmes[iX + 12] + xmoxmes[iX + 12]) - xTotal[iX + 12];
                // se agrego el 23/10/200 pjsv
                     If xestado = False Then
                     Begin
                   // los igualo a cero
                        xvpxmes[iX] := 0;
                   { para VPME }
                        xvpxmes[iX + 12] := 0;
                     End
                     Else
                     Begin
                  { para VPMN }
                        xvpxmes[iX] := (xtotal[ix] / (xasxmes[iX] + xmoxmes[iX])) * 100;
                  { para VPME }
                        xvpxmes[iX + 12] := (xtotal[ix + 12] / (xasxmes[iX + 12] + xmoxmes[iX + 12])) * 100;
                     End;
                  End;
               End;
               ssql := '';
               ssql := 'Update PPRES300 Set ';
               For iX := 1 To 12 Do
               Begin
                  xmes := StrZero(IntToStr(iX), 2);
             { carga para cada mes y campo el valor hallado en las lineas de
               arriba }
                  ssql := ssql + ' DPREEJMN' + xmes + '=TRUNC(' + FloatToStr(xtotal[iX]) + ',2),';
                  ssql := ssql + ' DPREEJME' + xmes + '=TRUNC(' + FloatToStr(xtotal[iX + 12]) + ',2),';
                  ssql := ssql + ' DPREVMMN' + xmes + '=TRUNC(' + FloatToStr(xtotal[iX + 24]) + ',2),';
                  ssql := ssql + ' DPREVMME' + xmes + '=TRUNC(' + FloatToStr(xtotal[iX + 36]) + ',2),';
                  ssql := ssql + ' DPREVPMN' + xmes + '=TRUNC(' + FloatToStr(xvpxmes[iX]) + ',2),';
                  ssql := ssql + ' DPREVPME' + xmes + '=TRUNC(' + FloatToStr(xvpxmes[iX + 12]) + ',2),';
               End;
           { SUMATORIA DE LOS EJMN, LOS DOCE MESES }
               For iX := 1 To 12 Do
                  xtotG[1] := xtotG[1] + xtotal[iX];
           { SUMATORIA DE LOS EJME, LOS DOCE MESES }
               For iX := 13 To 24 Do
                  xtotG[2] := xtotG[2] + xtotal[iX];
           { SUMATORIA DE LOS MOMN, LOS DOCE MESES }
               For iX := 25 To 36 Do
                  xtotG[3] := xtotG[3] + xtotal[iX];
           { SUMATORIA DE LOS MOME, LOS DOCE MESES }
               For iX := 37 To 48 Do
                  xtotG[4] := xtotG[4] + xtotal[iX];
           {  calculo del total VPMN si es <> de 0 al menos uno, para que no me de
              el error de INFINITO }
               If xestado = False Then
               Begin
             // los igualo a cero
                  xtotG[5] := 0;
                  xtotG[6] := 0;
               End
               Else
               Begin
             // calculo del Total VMMN
                  xtotG[5] := (xtotG[1] / ((xasxmes[1] + xasxmes[2] + xasxmes[3] + xasxmes[4] + xasxmes[5] + xasxmes[6] +
                     xasxmes[7] + xasxmes[8] + xasxmes[9] + xasxmes[10] + xasxmes[11] + xasxmes[12]) +
                     (xmoxmes[1] + xmoxmes[2] + xmoxmes[3] + xmoxmes[4] + xmoxmes[5] + xmoxmes[6] +
                     xmoxmes[7] + xmoxmes[8] + xmoxmes[9] + xmoxmes[10] + xmoxmes[11] + xmoxmes[12]))) * 100;
             { calculo del total VPME }
                  xtotG[6] := (xtotG[2] / ((xasxmes[13] + xasxmes[14] + xasxmes[15] + xasxmes[16] + xasxmes[17] + xasxmes[18] +
                     xasxmes[19] + xasxmes[20] + xasxmes[21] + xasxmes[22] + xasxmes[23] + xasxmes[24]) +
                     (xmoxmes[13] + xmoxmes[14] + xmoxmes[15] + xmoxmes[16] + xmoxmes[17] + xmoxmes[18] +
                     xmoxmes[19] + xmoxmes[20] + xmoxmes[21] + xmoxmes[22] + xmoxmes[23] + xmoxmes[24]))) * 100;
               End;
           { asigno los totales para EJ,VM y VP en MN y ME }
               ssql := ssql + ' DPRETOEJMN=TRUNC(' + FloatToStr(xtotg[1]) + ',2),';
               ssql := ssql + ' DPRETOEJME=TRUNC(' + FloatToStr(xtotg[2]) + ',2),';
               ssql := ssql + ' DPRETOVMMN=TRUNC(' + FloatToStr(xtotg[3]) + ',2),';
               ssql := ssql + ' DPRETOVMME=TRUNC(' + FloatToStr(xtotg[4]) + ',2),';
               ssql := ssql + ' DPRETOVPMN=TRUNC(' + FloatToStr(xtotg[5]) + ',2),';
               ssql := ssql + ' DPRETOVPME=TRUNC(' + FloatToStr(xtotg[6]) + ',2),';
           { otros campos a actualizar }
               ssql := ssql + 'RQPARTUSER=' + quotedstr(DMCXP.wUsuario);
               xFecha := formatdatetime(DMCXP.wFormatFecha, Date);
               ssql := ssql + ',RQPARTFREG =' + quotedstr(xfecha);
               xhora := formatdatetime('hh:nn:ss', time);
               ssql := ssql + ',RQPARTHREG =' + quotedstr(xhora) +
           { condicional }
               ' WHERE CIAID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString) +
                  ' AND CCOSID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString) +
                  ' AND RQPARTANO=' + quotedstr(copy(meAnoMM.Text, 1, 4));
               Try
                  DMCXP.DCOM1.AppServer.EjecutaSQL(sSQL);
               Except
                  Raise exception.Create('No se pudo actualizar Presupuesto');
               End;
            End;
            DMCXP.cdsDetCxP.Next;
         End;
      End;
   { ahora para los niveles speriores }
   CalculoNivelSupe;
End;

Procedure TFProvision.CreaSuperior;
Var
   xppcomun, ssql, xcc: String;
   xmaxdigitosup, xmaxnivelsup, xmaxnivelinf: String;
   xpp, xmaxdigitoint, xmaxnivelint, xmaxdigitoinf: String;
   xcontador: Integer;
   xcia, xccosid, xtippresid, xano: String;
Begin
   { tabla de niveles}
   ssql := '';
   ssql := 'SELECT * FROM PPRES103 ORDER BY PARPRESNIV';
   DMCXP.cdsNivelPresu.close;
   DMCXP.cdsNivelPresu.DataRequest(ssql);
   DMCXP.cdsNivelPresu.Open;
   { se recorre el client del detalle, por lo que en este se encuentran
     las P.P. a actualizar}
   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.eof Do
   Begin
      If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MG') Or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'NG')
         Or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MN') Or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'BI') Then
      Begin
         If xcc <> DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString Then
         Begin
          { tabla de detalle del presupuesto }
            ssql := '';
            ssql := 'SELECT * FROM PPRES301' +
               ' WHERE CIAID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString) +
               ' AND CCOSID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString) +
               ' AND RQPARTANO=' + quotedstr(copy(meAnoMM.Text, 1, 4));
            DMCXP.cdsDetallePres.Close;
            DMCXP.cdsDetallePres.DataRequest(ssql);
            DMCXP.cdsDetallePres.open;
            xcc := DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString;
         End;
         ssql := '';
         ssql := 'SELECT * FROM PPRES201';
         DMCXP.cdsPlaParPre.Close;
         DMCXP.cdsPlaParPre.DataRequest(ssql);
         DMCXP.cdsPlaParPre.open;
          { se toma 01 por defecto para el nivel máximo superior }
         xmaxnivelsup := '01';
         DMCXP.cdsNivelPresu.First;
          { se jala el máximo digito superior }
         xmaxdigitosup := DMCXP.cdsNivelPresu.fieldbyname('DIGITOS').AsString;
          { se carga a partir de la P.P. digitada el digito en común
            ejmp. si se digito 10101 --> el digito comuún es 1
                  si se digito 20501 --> el digito común es 2  }
         xppcomun := copy(DMCXP.cdsDetCxP.fieldbyname('PARPRESID').AsString, 1, StrToInt(xmaxdigitosup));
         DMCXP.cdsNivelPresu.Last;
          { jalo el máximo nivel inferior de la tabla de niveles }
         xmaxnivelinf := DMCXP.cdsNivelPresu.fieldbyname('PARPRESNIV').AsString;
          { se jala el máximo digito inferior }
         xmaxdigitoinf := DMCXP.cdsNivelPresu.fieldbyname('DIGITOS').AsString;
          { este proceso se repite hasta que la variable xmaxnivelint se iguale
            a la xmaxnivelsup. Esto me permite generar los niveles superiores
            que cuyo primer digito sea igual a la variable xppcomun }
         xcontador := 0;
         Repeat
           { ejemp. si el xmaxnivelinf = 03 ==>  xmaxnivelint = 02. }
            xmaxnivelint := StrZero(IntToStr(StrToInt(xmaxnivelinf) - xcontador), 2);
            xcontador := 1;
            ssql := '';
            ssql := 'PARPRESNIV=' + quotedstr(xmaxnivelint);
            xcia := Trim(dblcCia.Text);
            xccosid := Trim(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString);
            xtippresid := Trim(DMCXP.cdsDetCxP.fieldbyname('TIPPRESID').AsString);
            xano := Trim(copy(meAnoMM.text, 1, 4));
            xmaxdigitoint := buscaQRY('dspNivelPresu', 'PPRES103', '*', ssql, 'DIGITOS');
            xpp := Trim(copy(DMCXP.cdsDetCxP.fieldbyname('PARPRESID').AsString, 1, StrToInt(xmaxdigitoint)));
            If DMCXP.cdsPlaParPre.Locate('PARPRESID', VarArrayOf([xpp]), [loCaseInsensitive]) Then
               If Not DMCXP.cdsDetallePres.Locate('CIAID;CCOSID;TIPPRESID;PARPRESID;RQPARTANO', VarArrayOf([xcia, xccosid, xtippresid, xpp, xano]), [loCaseInsensitive]) Then
                  DMCXP.cdsDetallePres.insert;
            If DMCXP.cdsDetallePres.State = dsInsert Then
            Begin
               DMCXP.cdsDetCxP.Edit;
               DMCXP.cdsDetallePres.fieldbyname('CIAID').AsString := dblcCia.Text;
               DMCXP.cdsDetallePres.fieldbyname('CCOSID').AsString := DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString;
               DMCXP.cdsDetallePres.fieldbyname('TIPPRESID').AsString := DMCXP.cdsDetCxP.fieldbyname('TIPPRESID').AsString;
               DMCXP.cdsDetallePres.fieldbyname('RQPARTANO').AsString := Copy(FProvision.meAnoMM.Text, 1, 4);
               DMCXP.cdsDetallePres.FieldByName('PARPRESID').AsString := DMCXP.cdsPlaParPre.fieldbyname('PARPRESID').AsString;
               DMCXP.cdsDetallePres.FieldByName('PARPREDES').AsString := DMCXP.cdsPlaParPre.fieldbyname('PARPRESDES').AsString;
               DMCXP.cdsDetallePres.FieldByName('TMONID').AsString := dblcTMon.Text;
               DMCXP.cdsDetallePres.FieldByName('RQPARTUSER').AsString := DMCXP.wusuario;
               DMCXP.cdsDetallePres.FieldByName('RQPARTFREG').AsString := DateToStr(Date());
               DMCXP.cdsDetallePres.FieldByName('RQPARTHREG').AsString := TimeToStr(Time());
               DMCXP.cdsDetallePres.FieldByName('RQPARTIS').AsString := DMCXP.cdsPlaParPre.fieldbyname('PARPRES_IS').AsString;
               DMCXP.cdsDetallePres.FieldByName('PARPRESNIV').AsString := DMCXP.cdsPlaParPre.fieldbyname('PARPRESNIV').AsString;
               // inicializo en cero todos los montos
               inicializoCero(DMCXP.cdsDetallePres);
               DMCXP.cdsDetallePres.Post;
               DMCXP.cdsDetallePres.ApplyUpdates(0);
               
            End;
            xmaxnivelinf := xmaxnivelint;
         Until xmaxnivelsup = xmaxnivelint;
      End;
      DMCXP.cdsDetCxP.Next;
   End;
End;

Procedure TFProvision.inicializoCero;
Var
   iX: integer;
   xmes: String;
Begin
    { inicializo los demás campos en cero }
   For iX := 1 To 12 Do
   Begin
      xmes := StrZero(IntToStr(iX), 2);
      xcds.FieldByName('DPRERQMN' + xmes).AsString := '0';
      xcds.FieldByName('DPRERQME' + xmes).AsString := '0';
      xcds.FieldByName('DPRERMME' + xmes).AsString := '0';
      xcds.FieldByName('DPRERMMN' + xmes).AsString := '0';
      xcds.FieldByName('DPREASMN' + xmes).AsString := '0';
      xcds.FieldByName('DPREASME' + xmes).AsString := '0';
      xcds.FieldByName('DPREMOMN' + xmes).AsString := '0';
      xcds.FieldByName('DPREMOME' + xmes).AsString := '0';
      xcds.FieldByName('DPREEJMN' + xmes).AsString := '0';
      xcds.FieldByName('DPREEJME' + xmes).AsString := '0';
      xcds.FieldByName('DPREVMMN' + xmes).AsString := '0';
      xcds.FieldByName('DPREVMME' + xmes).AsString := '0';
      xcds.FieldByName('DPREVPMN' + xmes).AsString := '0';
      xcds.FieldByName('DPREVPME' + xmes).AsString := '0';
   End;
   xcds.FieldByName('DPRETORQMN').AsString := '0';
   xcds.FieldByName('DPRETORQME').AsString := '0';
   xcds.FieldByName('DPRETORMMN').AsString := '0';
   xcds.FieldByName('DPRETORMME').AsString := '0';
   xcds.FieldByName('DPRETOASMN').AsString := '0';
   xcds.FieldByName('DPRETOASME').AsString := '0';
   xcds.FieldByName('DPRETOMOMN').AsString := '0';
   xcds.FieldByName('DPRETOMOME').AsString := '0';
   xcds.FieldByName('DPRETOEJMN').AsString := '0';
   xcds.FieldByName('DPRETOEJME').AsString := '0';
   xcds.FieldByName('DPRETOVMMN').AsString := '0';
   xcds.FieldByName('DPRETOVMME').AsString := '0';
   xcds.FieldByName('DPRETOVPMN').AsString := '0';
   xcds.FieldByName('DPRETOVPME').AsString := '0';
End;

Procedure TFProvision.CalculoNivelSupe;
Var
   xppcomun, xmaxdigitosup, xmaxnivelsup, xmaxnivelinf, ssql: String;
   xcc, xmes, xmaxdigitoint, xmaxnivelint, xmaxdigitoinf: String;
   ix: integer;
   xestado, xestado1: bool;
  { para los EJMN y EJME del mes 01 al mes 12 }
   xmontos: Array[1..24] Of double;
  { para los ASMN y ASME del mes 01 al mes 12 }
   xmontosas: Array[1..24] Of double;
  { para los MOMN y MOME del mes 01 al mes 12 }
   xmontosmo: Array[1..24] Of double;
   xtotvmmn, xtotvmme, xtotejmn, xtotejme: double;
Begin
   xestado := False;
   xestado1 := False;
   { tabla de niveles, se ordena por el nivel }
   ssql := '';
   ssql := 'SELECT * FROM PPRES103 ORDER BY PARPRESNIV';
   DMCXP.cdsNivelPresu.close;
   DMCXP.cdsNivelPresu.DataRequest(ssql);
   DMCXP.cdsNivelPresu.open;
   DMCXP.cdsNivelPresu.First;
   { se inicializa en cero }
   //xtotvmmn := 0; xtotvmme := 0;
   { se recorre el client del detalle, por lo que en este se encuentran
     las P.P. a actualizar}
   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.eof Do
   Begin
      If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MG') Or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'NG')
         Or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MN') Or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'BI') Then
      Begin
        { solo si se cambia de centro de costo }
         If xcc <> DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString Then
         Begin
          { tabla de detalle del presupuesto }
            ssql := '';
            ssql := 'SELECT * FROM PPRES301' +
               ' WHERE CIAID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString) +
               ' AND CCOSID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString) +
               ' AND RQPARTANO=' + quotedstr(copy(meAnoMM.Text, 1, 4));
            DMCXP.cdsDetallePres.Close;
            DMCXP.cdsDetallePres.DataRequest(ssql);
            DMCXP.cdsDetallePres.open;
          { se carga la variable }
            xcc := DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString;
         End;
         If xppcomun <> copy(DMCXP.cdsDetCxP.fieldbyname('PARPRESID').AsString, 1, 1) Then
         Begin
          //////////// poceso para genera los niveles superiores ////////////
            ssql := '';
            ssql := 'SELECT * FROM PPRES201';
            DMCXP.cdsPlaParPre.Close;
            DMCXP.cdsPlaParPre.DataRequest(ssql);
            DMCXP.cdsPlaParPre.open;
          { se toma 01 por defecto para el nivel máximo superior }
            xmaxnivelsup := '01';
            DMCXP.cdsNivelPresu.First;
          { se jala el máximo digito superior }
            xmaxdigitosup := DMCXP.cdsNivelPresu.fieldbyname('DIGITOS').AsString;
          { se carga a partir de la P.P. digitada el digito en común
            ejmp. si se digito 10101 --> el digito comuún es 1
                  si se digito 20501 --> el digito común es 2  }
            xppcomun := copy(DMCXP.cdsDetCxP.fieldbyname('PARPRESID').AsString, 1, StrToInt(xmaxdigitosup));
            DMCXP.cdsNivelPresu.Last;
          { jalo el máximo nivel inferior de la tabla de niveles }
            xmaxnivelinf := DMCXP.cdsNivelPresu.fieldbyname('PARPRESNIV').AsString;
          { se jala el máximo digito inferior }
            xmaxdigitoinf := DMCXP.cdsNivelPresu.fieldbyname('DIGITOS').AsString;

          { se filtra la tabla por CIA, TIPPRESID RQPARTANO y PARPRESID cuyo digito
            sustraido se igual al xppcomun }
            ssql := '';
            ssql := 'SELECT PARPRESID,PARPREDES,RQPARTIS,TMONID,' +
               'DPREEJMN01,DPREEJMN02,DPREEJMN03,DPREEJMN04,DPREEJMN05,DPREEJMN06,' +
               'DPREEJMN07,DPREEJMN08,DPREEJMN09,DPREEJMN10,DPREEJMN11,DPREEJMN12,' +
               'DPREEJME01,DPREEJME02,DPREEJME03,DPREEJME04,DPREEJME05,DPREEJME06,' +
               'DPREEJME07,DPREEJME08,DPREEJME09,DPREEJME10,DPREEJME11,DPREEJME12,' +

            'DPREVMMN01,DPREVMMN02,DPREVMMN03,DPREVMMN04,DPREVMMN05,DPREVMMN06,' +
               'DPREVMMN07,DPREVMMN08,DPREVMMN09,DPREVMMN10,DPREVMMN11,DPREVMMN12,' +
               'DPREVMME01,DPREVMME02,DPREVMME03,DPREVMME04,DPREVMME05,DPREVMME06,' +
               'DPREVMME07,DPREVMME08,DPREVMME09,DPREVMME10,DPREVMME11,DPREVMME12,' +

            'DPREVPMN01,DPREVPMN02,DPREVPMN03,DPREVPMN04,DPREVPMN05,DPREVPMN06,' +
               'DPREVPMN07,DPREVPMN08,DPREVPMN09,DPREVPMN10,DPREVPMN11,DPREVPMN12,' +
               'DPREVPME01,DPREVPME02,DPREVPME03,DPREVPME04,DPREVPME05,DPREVPME06,' +
               'DPREVPME07,DPREVPME08,DPREVPME09,DPREVPME10,DPREVPME11,DPREVPME12,' +

            'DPREASMN01,DPREASMN02,DPREASMN03,DPREASMN04,DPREASMN05,DPREASMN06,' +
               'DPREASMN07,DPREASMN08,DPREASMN09,DPREASMN10,DPREASMN11,DPREASMN12,' +
               'DPREASME01,DPREASME02,DPREASME03,DPREASME04,DPREASME05,DPREASME06,' +
               'DPREASME07,DPREASME08,DPREASME09,DPREASME10,DPREASME11,DPREASME12,' +

            'DPREMOMN01,DPREMOMN02,DPREMOMN03,DPREMOMN04,DPREMOMN05,DPREMOMN06,' +
               'DPREMOMN07,DPREMOMN08,DPREMOMN09,DPREMOMN10,DPREMOMN11,DPREMOMN12,' +
               'DPREMOME01,DPREMOME02,DPREMOME03,DPREMOME04,DPREMOME05,DPREMOME06,' +
               'DPREMOME07,DPREMOME08,DPREMOME09,DPREMOME10,DPREMOME11,DPREMOME12' +

            ' FROM PPRES301 WHERE CIAID=' + quotedstr(dblcCia.Text) +
               ' AND CCOSID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString) +
               ' AND TIPPRESID=' + quotedstr(DMCXP.cdsDetCxP.fieldbyname('TIPPRESID').AsString) +
               ' AND SUBSTR(PARPRESID,1,' + xmaxdigitosup + ')=' + quotedstr(xppcomun) +
               ' AND RQPARTANO=' + quotedstr(Copy(FProvision.meAnoMM.Text, 1, 4));
            DMCXP.cdsSQL.Close;
            DMCXP.cdsSQL.DataRequest(ssql);
            DMCXP.cdsSQL.Open;
            DMCXP.cdsSQL.first;
          { este proceso se repite hasta que la variable xmaxnivelint se iguale
            a la xmaxnivelsup. Esto me permite generar los niveles superiores
            que cuyo primer digito sea igual a la variable xppcomun }
            Repeat
            { ejemp. si el xmaxnivelinf = 03 ==>  xmaxnivelint = 02. }
               xmaxnivelint := StrZero(IntToStr(StrToInt(xmaxnivelinf) - 1), 2);
               ssql := '';
               ssql := 'PARPRESNIV=' + quotedstr(xmaxnivelint);
               xmaxdigitoint := buscaQRY('dspNivelPresu', 'PPRES103', '*', ssql, 'DIGITOS');
            { filtra la tabla de P.P.P. por todas aquellas cuyo digito sean igual al del
              xmaxdigitoint }
               ssql := '';
               ssql := 'SELECT * FROM PPRES201 WHERE LENGTH(PARPRESID)=' + xmaxdigitoint +
                  ' ORDER BY PARPRESID';
               DMCXP.cdsPlaParPre.Close;
               DMCXP.cdsPlaParPre.DataRequest(ssql);
               DMCXP.cdsPlaParPre.Open;
           { se recorre la tabla }
               While Not DMCXP.cdsPlaParPre.Eof Do
               Begin
                  DMCXP.cdsSQL.First;
               { se blanquea }
                  For iX := 1 To 24 Do
                  Begin
                     xmontos[iX] := 0;
                     xmontosas[iX] := 0;
                     xmontosmo[iX] := 0;
                  End;
                { se recorre el clon del detalle }
                  While Not DMCXP.cdsSQL.Eof Do
                  Begin
                  { si el # de digitos es = al # maximo de digitos inferior }
                     If length(DMCXP.cdsSQL.fieldbyname('PARPRESID').AsString) = StrToInt(xmaxdigitoinf) Then
                   { si la sustracción es = al nivel de la P.P..}
                        If copy(DMCXP.cdsSQL.fieldbyname('PARPRESID').AsString, 1, StrToInt(xmaxdigitoint)) =
                           DMCXP.cdsPlaParPre.fieldbyname('PARPRESID').AsString Then
                           For iX := 1 To 12 Do
                           Begin
                      // se halla los montos para las 2 monesa y los 12 meses
                     {se agrego esta linea 17/10/2000 para que sólo actualice el mes del periodo
                      y ya no los 12 meses }
                              xmes := StrZero(IntToStr(iX), 2);
                              xmontos[iX] := xmontos[iX] + DMCXP.cdsSQL.fieldbyname('DPREEJMN' + xmes).AsFloat;
                              xmontos[iX + 12] := xmontos[iX + 12] + DMCXP.cdsSQL.fieldbyname('DPREEJME' + xmes).AsFloat;
                              xmontosas[iX] := xmontosas[iX] + DMCXP.cdsSQL.fieldbyname('DPREASMN' + xmes).AsFloat;
                              xmontosas[iX + 12] := xmontosas[iX + 12] + DMCXP.cdsSQL.fieldbyname('DPREASME' + xmes).AsFloat;
                              xmontosmo[iX] := xmontosmo[iX] + DMCXP.cdsSQL.fieldbyname('DPREMOMN' + xmes).AsFloat;
                              xmontosmo[iX + 12] := xmontosmo[iX + 12] + DMCXP.cdsSQL.fieldbyname('DPREMOME' + xmes).AsFloat;
//                       end;
                           End;
                     DMCXP.cdsSQL.next;
                  End;
                 { si hubiera montos }
                  For iX := 1 To 12 Do
                     If xmontos[iX] <> 0 Then
                     Begin
                        xestado := true;
                        break;
                     End;
                 { si es true, me indica que al menos hay una cantidad a actualizar }
                  If xestado = true Then
                  Begin
                     xtotejmn := 0;
                     xtotejme := 0;
                   { para posicionarme sobre el nivel en el clon }
                     If DMCXP.cdsSQL.Locate('PARPRESID', DMCXP.cdsPlaParPre.fieldbyname('PARPRESID').AsString, [loCaseInsensitive]) Then
                        DMCXP.cdsSQL.Edit;
                   { para posicionarme sobre el nivel en el detalle }
                     If DMCXP.cdsDetallePres.Locate('PARPRESID', DMCXP.cdsPlaParPre.fieldbyname('PARPRESID').AsString, [loCaseInsensitive]) Then
                        DMCXP.cdsDetallePres.Edit;
                     For iX := 1 To 12 Do
                     Begin
                        xmes := StrZero(IntToStr(iX), 2);
                      { para el cdsSQL }
                        DMCXP.cdsSQL.fieldbyname('DPREEJMN' + xmes).AsString := FloatToStr(xmontos[iX]);
                        DMCXP.cdsSQL.fieldbyname('DPREEJME' + xmes).AsString := FloatToStr(xmontos[iX + 12]);
                      { para el detalle }
                        DMCXP.cdsDetallePres.fieldbyname('DPREEJMN' + xmes).AsString := FloatToStr(xmontos[iX]);
                        DMCXP.cdsDetallePres.fieldbyname('DPREEJME' + xmes).AsString := FloatToStr(xmontos[iX + 12]);
                      //** 06/11/2000
                        If xmontos[iX] > 0 Then
                        Begin
                           DMCXP.cdsDetallePres.fieldbyname('DPREVMMN' + xmes).AsString := FloatToStr((xmontosas[iX] + xmontosmo[iX]) - xmontos[iX]);
                           DMCXP.cdsDetallePres.fieldbyname('DPREVMME' + xmes).AsString := FloatToStr((xmontosas[iX + 12] + xmontosmo[iX + 12]) - xmontos[iX + 12]);
                        End;
                      //**
                        If xmontos[iX] <> 0 Then
                           If (xmontosas[iX] <> 0) Or (xmontosmo[iX] <> 0) Then
                              DMCXP.cdsDetallePres.fieldbyname('DPREVPMN' + xmes).AsString :=
                                 FloatToStr((xmontos[iX] / (xmontosas[iX] + xmontosmo[iX])) * 100)
                           Else
                              DMCXP.cdsDetallePres.fieldbyname('DPREVPMN' + xmes).AsFloat := 200;
                        If xmontos[iX + 12] <> 0 Then
                           If (xmontosas[iX + 12] <> 0) Or (xmontosmo[iX + 12] <> 0) Then
                              DMCXP.cdsDetallePres.fieldbyname('DPREVPME' + xmes).AsString :=
                                 FloatToStr((xmontos[iX + 12] / (xmontosas[iX + 12] + xmontosmo[iX + 12])) * 100)
                           Else
                              DMCXP.cdsDetallePres.fieldbyname('DPREVPME' + xmes).AsFloat := 200;
                       { totales de EJ y VM }
                     End;
                     xtotvmmn := (xmontosas[1] + xmontosas[2] + xmontosas[3] + xmontosas[4] + xmontosas[5] + xmontosas[6] +
                        xmontosas[7] + xmontosas[8] + xmontosas[9] + xmontosas[10] + xmontosas[11] + xmontosas[12] +
                        xmontosmo[1] + xmontosmo[2] + xmontosmo[3] + xmontosmo[4] + xmontosmo[5] + xmontosmo[6] +
                        xmontosmo[7] + xmontosmo[8] + xmontosmo[9] + xmontosmo[10] + xmontosmo[11] + xmontosmo[12]) -
                        (xmontos[1] + xmontos[2] + xmontos[3] + xmontos[4] + xmontos[5] + xmontos[6] +
                        xmontos[7] + xmontos[8] + xmontos[9] + xmontos[10] + xmontos[11] + xmontos[12]);
                     xtotvmme := (xmontosas[13] + xmontosas[14] + xmontosas[15] + xmontosas[16] + xmontosas[17] + xmontosas[18] +
                        xmontosas[19] + xmontosas[20] + xmontosas[21] + xmontosas[22] + xmontosas[23] + xmontosas[24] +
                        xmontosmo[13] + xmontosmo[14] + xmontosmo[15] + xmontosmo[16] + xmontosmo[17] + xmontosmo[18] +
                        xmontosmo[19] + xmontosmo[20] + xmontosmo[21] + xmontosmo[22] + xmontosmo[23] + xmontosmo[24]) -
                        (xmontos[13] + xmontos[14] + xmontos[15] + xmontos[16] + xmontos[17] + xmontos[18] +
                        xmontos[19] + xmontos[20] + xmontos[21] + xmontos[22] + xmontos[23] + xmontos[24]);
                     For iX := 1 To 12 Do
                     Begin
                     { totales de EJ y VM }
                        xtotejmn := xtotejmn + xmontos[iX];
                        xtotejme := xtotejme + xmontos[iX + 12];
                     End;
                    //**

                    { para el detalle, se asignan los totales }
                     DMCXP.cdsDetallePres.fieldbyname('DPRETOEJMN').AsString := FloatToStr(xtotejmn);
                     DMCXP.cdsDetallePres.fieldbyname('DPRETOEJME').AsString := FloatToStr(xtotejme);
                     DMCXP.cdsDetallePres.fieldbyname('DPRETOVMMN').AsString := FloatToStr(xtotvmmn);
                     DMCXP.cdsDetallePres.fieldbyname('DPRETOVMME').AsString := FloatToStr(xtotvmme);
                     { si hubiera montos }
                     For iX := 1 To 12 Do
                        If (xmontosas[iX] <> 0) Or (xmontosmo[iX] <> 0) Then
                        Begin
                           xestado1 := true;
                           break;
                        End;
                     { me indica que hay que actualizar los VP }
                     If xEstado1 = true Then
                     Begin
                        DMCXP.cdsDetallePres.fieldbyname('DPRETOVPMN').AsString :=
                           FloatToStr(((xmontos[1] + xmontos[2] + xmontos[3] + xmontos[4] + xmontos[5] + xmontos[6] +
                           xmontos[7] + xmontos[8] + xmontos[9] + xmontos[10] + xmontos[11] + xmontos[12]) /
                           (xmontosas[1] + xmontosas[2] + xmontosas[3] + xmontosas[4] + xmontosas[5] + xmontosas[6] +
                           xmontosas[7] + xmontosas[8] + xmontosas[9] + xmontosas[10] + xmontosas[11] + xmontosas[12] +
                           xmontosmo[1] + xmontosmo[2] + xmontosmo[3] + xmontosmo[4] + xmontosmo[5] + xmontosmo[6] +
                           xmontosmo[7] + xmontosmo[8] + xmontosmo[9] + xmontosmo[10] + xmontosmo[11] + xmontosmo[12])) * 100);
                        DMCXP.cdsDetallePres.fieldbyname('DPRETOVPME').AsString :=
                           FloatToStr(((xmontos[13] + xmontos[14] + xmontos[15] + xmontos[16] + xmontos[17] + xmontos[18] +
                           xmontos[19] + xmontos[20] + xmontos[21] + xmontos[22] + xmontos[23] + xmontos[24]) /
                           (xmontosas[13] + xmontosas[14] + xmontosas[15] + xmontosas[16] + xmontosas[17] + xmontosas[18] +
                           xmontosas[19] + xmontosas[20] + xmontosas[21] + xmontosas[22] + xmontosas[23] + xmontosas[24] +
                           xmontosmo[13] + xmontosmo[14] + xmontosmo[15] + xmontosmo[16] + xmontosmo[17] + xmontosmo[18] +
                           xmontosmo[19] + xmontosmo[20] + xmontosmo[21] + xmontosmo[22] + xmontosmo[23] + xmontosmo[24])) * 100);
                        xestado1 := false;
                     End
                     Else
                     Begin
                        DMCXP.cdsDetallePres.fieldbyname('DPRETOVPMN').AsString := FloatToStr(200);
                        DMCXP.cdsDetallePres.fieldbyname('DPRETOVPME').AsString := FloatToStr(200);
                     End;
                     DMCXP.cdsSQL.Post;
                     DMCXP.cdsDetallePres.Post;
                     DMCXP.cdsDetallePres.ApplyUpdates(0);
                     xEstado := false;
                  End;
                  DMCXP.cdsPlaParPre.next;
               End;
                 { se igualan variables }
               xmaxnivelinf := xmaxnivelint;
               xmaxdigitoinf := xmaxdigitoint;
            Until xmaxnivelsup = xmaxnivelint;
         End;
      End;
      DMCXP.cdsDetCxP.Next;
   End;
End;

Procedure TFProvision.dblcTipPreExit(Sender: TObject);
Begin
   If xCrea = true Then exit;
   If bbtnRegCanc.Focused Then exit;
   If dblcdCCosto.Focused Then exit;
   If dblcdCnpEgr.Focused Then exit;
   If dblcTipReg.Focused Then exit;
   If Length(dblcTipPre.Text) = 0 Then
   Begin
      Raise exception.Create('Falta Tipo de Presupuesto');
      dblcTipPre.SetFocus;
   End;
End;

Procedure TFProvision.dblcdPresupExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea = true Then exit;
   If bbtnRegCanc.Focused Then exit;
   If dblcdCCosto.Focused Then exit;
   If dblcdCnpEgr.Focused Then exit;
   If dblcTipReg.Focused Then exit;

   xWhere := 'CIAID=''' + dblcCia.Text + ''' and PARPRESID=''' + dblcdPresup.Text + '''';
   edtPresup.Text := BuscaQry('dspTGE', 'PPRES201', '*', xWhere, 'PARPRESDES');
   If Length(edtPresup.text) = 0 Then
   Begin
      Raise exception.Create('Falta Partida Presupuestal');
      dblcdPresup.SetFocus;
   End;
End;

Procedure TFProvision.Z2bbtnPreviewClick(Sender: TObject);
Var
   xSQL, mes, ano, xwhere, MONABR: String;
   TMoneda, mesdes: String;
   xTotHaber: DOUBLE;
Begin
   If DMCXP.wAdmin = 'G' Then Exit;

   If DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString <> 'S' Then
   Begin
      If Not AsientoCuadra Then
         Raise exception.Create('Error:  Asiento No Cuadra');

   // Inicio HPC_201406_CXP
      xSQL := 'Delete from CNT311 '
            + ' Where CIAID = ' + quotedstr(dblcCia.text)
            + '   and CNTANOMM = ' + quotedstr(meAnoMM.text)
            + '   and TDIARID = ' + quotedstr(dblcTDiario.text)
            + '   and CNTCOMPROB=' + quotedstr(meNoReg.text);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
      Except
      End;

      xSQL := 'Delete from CNT310 '
            + ' Where CIAID = ' + quotedstr(dblcCia.text)
            + '   and CNTANOMM = ' + quotedstr(meAnoMM.text)
            + '   and TDIARID = ' + quotedstr(dblcTDiario.text)
            + '   and CNTCOMPROB = ' + quotedstr(meNoReg.text);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
      Except
      End;
   // Fin HPC_201406_CXP

      //INICIO DEL FOR
      If (DMCXP.cdsCia.FieldByName('PRORATEO').AsString = 'S') Then
      Begin
         If (DMCXP.cdsCia.FieldByName('IGVSN').AsString = '1') Then
         Begin
            If DMCXP.cdsMovCxP.FieldByName('CPIGV2').AsFloat > 0 Then
               FToolCont.Prorrateo(dblcCia.text, dblcTDiario.text,
                  DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString,
                  DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString);
         End
         Else
            If (DMCXP.cdsCia.FieldByName('IGVSN').AsString = '2') Then
            Begin
               If DMCXP.cdsMovCxP.FieldByName('CPIGV').AsFloat > 0 Then
                  FToolCont.Prorrateo(dblcCia.text, dblcTDiario.text,
                     DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString,
                     DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString);
            End;
      End;

      DMCXP.GeneraContab(dblcCia.Text, dblcTDiario.Text, meAnoMM.Text, meNoReg.text, Self, 'P');

      // Se Transfiere la Data Generada en el SOLContabiliza
      DMCXP.cdsCXP.Data := DMCXP.cdsMovCnt.data;

      ppdbpPreview.DataSource := DMCXP.dsCxP;

      pprPreview.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\CxPVoucher.rtm';
      pprPreview.template.LoadFromFile;

      pplblDesEstado.caption := 'Previo';
   // Inicio HPC_201406_CXP
      xSQL := 'SELECT CNTGLOSA '
            + '  FROM CNT310 '
            + ' WHERE CIAID = ' + quotedstr(dblcCia.text)
            + '   AND CNTANOMM = ' + quotedstr(meAnoMM.text)
            + '   AND TDIARID = ' + quotedstr(dblcTDiario.text)
            + '   AND CNTCOMPROB = ' + quotedstr(meNoReg.text);
   // Fin HPC_201406_CXP
      DMCXP.cdsQry5.close;
      DMCXP.cdsQry5.ProviderName := 'dspTGE';
      DMCXP.cdsQry5.DataRequest(xsql);
      DMCXP.cdsQry5.Open;

      pplblTipoCamb.Caption := FloatToStrF(StrToFloat(dbeTCambio.text), ffNumber, 10, 3);

      mes := copy(meAnoMM.text, 5, 2);
      ano := copy(meAnoMM.text, 1, 4);

      xWhere := 'MESIDR=''' + mes + '''';
      mesdes := DMCXP.DisplayDescrip2('dspTGE', 'TGE181', 'MESDESL', XWHERE, 'MESDESL');

      pplblAnoMes.Caption := mesdes + ' ' + ano;
      pplblNoCompro.Caption := meNoReg.text;
      pplblDesEstado.caption := 'Previo';
   End;

   If DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString = 'S' Then
   Begin
   // Inicio HPC_201406_CXP
      xSQL := 'Select * '
            + '  from CNT301 '
            + ' where CIAID=' + quotedstr(dblcCia.text)
            + '   and CNTANOMM=' + quotedstr(meAnoMM.text)
            + '   and TDIARID=' + quotedstr(dblcTDiario.text)
            + '   and CNTCOMPROB=' + quotedstr(meNoReg.text)
            + ' order by CNT301.CNTREG';
   // Fin HPC_201406_CXP
      DMCXP.cdsCxP.Close;
      DMCXP.cdsCxP.DataRequest(xSQL);
      DMCXP.cdsCxP.Open;

      ppdbpPreview.DataSource := DMCXP.dsCxP;

      pprPreview.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\CxPVoucher.rtm';
      pprPreview.template.LoadFromFile;

      mes := copy(DMCXP.cdsCxP.fieldbyname('CNTANOMM').asstring, 5, 2);
      ano := copy(DMCXP.cdsCxP.fieldbyname('CNTANOMM').asstring, 1, 4);

      xWhere := 'MESIDR=''' + mes + '''';
      mesdes := BuscaQry('dspTGE', 'TGE181', 'MESDESL', xWhere, 'MESDESL');

      pplblAnoMes.Caption := mesdes + ' ' + ano;
      pplblDesEstado.caption := 'Contabilizado';

   End;
   TMoneda := BuscaQry('dspTGE', 'TGE103', 'TMON_LOC', 'TMONID=' + quotedstr(dblcTMon.text), 'TMON_LOC');
   TMoneda := BuscaQry('dspTGE', 'TGE103', 'TMONABR', 'TMONID=' + quotedstr(dblcTMon.text), 'TMONABR');

   If TMoneda = 'L' Then
   Begin
      pplblMonedaDoc.Visible := false;
      ppdbMtoExt.Visible := false;
      pplblCntTCambio.Visible := false;
      ppdbCntTCambio.Visible := false;
   End;

   xTotHaber := 0;
   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.Eof Do
   Begin
      If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'H' Then
         xTotHaber := xTotHaber + FRound(DMCXP.cdsDetCxP.Fieldbyname('DCPMOORI').AsFloat, 15, 2);
      DMCXP.cdsDetCxP.Next;
   End;

   DMCXP.cdsDetCxP.First;
   pplblMontoImporte.Caption := MONABR + ' ' + FloatToStrF(xTotHaber, ffNumber, 15, 2);

   pplblMonedaDoc.Caption := MONABR;
   pplblCiades.Caption := edtCia.text;
   pplblCodProv.Caption := dblcdProv.Text;
   pplblDiarioDes.Caption := edtTDiario.text;
   pplblTDiario.Caption := dblcTDiario.text;
   pplblTipoCamb.Caption := FloatToStrF(StrToFloat(dbeTCambio.text), ffNumber, 10, 3);
   pplblNoCompro.Caption := meNoReg.text;
   pplblProveedor.Caption := edtProv.text;
   pplblMonedaDes.caption := DMCXP.DisplayDescrip2('dspTGE', 'TGE103', 'TMONDES', 'TMONID=' + quotedstr(dblcTMon.text), 'TMONDES');
   pplblGlosaDes.caption := DMCXP.cdsCxP.fieldbyname('CNTGLOSA').asstring;

   DMCXP.cdsCxP.IndexFieldNames := 'CNTREG';

   pprPreview.Print;
   pprPreview.Stop;
   ppdbpPreview.DataSource := Nil;
   DMCXP.cdsCxP.IndexFieldNames := '';
   DMCXP.cdsCxP.Close;
   DMCXP.cdsMovCnt.Close;
End;

Procedure TFProvision.ppDetailBand2BeforePrint(Sender: TObject);
Begin
   pplblFecEmision.Caption := DMCXP.CdsCxP.Fieldbyname('CNTFEMIS').AsString;
End;

Procedure TFProvision.dblcdCnpEgrEnter(Sender: TObject);
Begin
   DMCXP.cdsCnpEgr.IndexFieldNames := 'CUENTAID';
End;

Procedure TFProvision.pprPreviewPreviewFormCreate(Sender: TObject);
Begin
   pprPreview.PreviewForm.ClientHeight := 580;
   pprPreview.PreviewForm.ClientWidth := 780;
   tppviewer(pprPreview.PreviewForm.Viewer).zoomSetting := zspageWidth;
End;

Procedure TFProvision.dbeGlosaExit(Sender: TObject);
Begin
   xGlosa := DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString;
End;

Procedure TFProvision.chkInterClick(Sender: TObject);
Begin
   If chkInter.Checked Then
   Begin
      lblClauxInter.Visible := true;
      lblProvInter.Visible := true;
      dblcClauxInter.Visible := true;
      dblcdInter.Visible := true;
      edtIntermediario.Visible := true;
      edtIntermediario.Text := '';
      dblcClauxInter.SetFocus;
   End
   Else
   Begin
      lblClauxInter.Visible := False;
      lblProvInter.Visible := False;
      dblcClauxInter.Visible := False;
      dblcdInter.Visible := False;
      edtIntermediario.Visible := False;
      edtIntermediario.Text := '';
      If (DMCXP.cdsMovCxP.State = dsInsert) Or (DMCXP.cdsMovCxP.State = dsEdit) Then
      Begin
         DMCXP.cdsMovCxP.fieldbyname('CLAUXINTER').AsString := '';
         DMCXP.cdsMovCxP.fieldbyname('AUXIDINTER').AsString := '';
      End;
   End;
End;

Procedure TFProvision.dblcClauxInterExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If bbtnBorra.Focused Then Exit;
   If chkInter.Focused Then Exit;

   dblcClAuxInter.Text := UpperCase(dblcClAuxInter.Text);
   xNuevoProv := False;
   xWhere := 'CLAUXID=''' + dblcClAuxInter.Text + ''' and MODULO LIKE ''%' + DMCXP.wModulo + '%''';
   If length(BuscaQry('dspTGE', 'TGE102', 'CLAUXDES', xWhere, 'CLAUXDES')) = 0 Then
   Begin
      dblcClAuxInter.SetFocus;
      Raise Exception.Create('Clase de Auxiliar de Intermediario');
   End;
   Screen.Cursor := crHourGlass;
   Filtracds(DMCXP.cdsProv, 'SELECT * FROM TGE201 WHERE CLAUXID=''' + dblcClAuxInter.Text + ''' and NVL(ACTIVO,''N'')=''S''');

   If Length(dblcdInter.Text) > 0 Then
   Begin
      DMCXP.cdsMovCxP.Edit;
      xWhere := 'CLAUXID=''' + dblcClAuxInter.Text + ''' AND PROV=''' + dblcdInter.Text + ''' and NVL(ACTIVO,''N'')=''S''';
      If length(BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES', xWhere, 'ProvDES')) = 0 Then
      Begin
         DMCXP.cdsMovCxP.fieldbyname('AUXIDINTER').AsString := '';
         dblcdInter.SetFocus;
      End
      Else
      Begin
         DMCXP.cdsMovCxP.fieldbyname('AUXIDINTER').AsString := DMCXP.cdsQry.FieldByname('PROV').AsString;
      End;
   End;
   If Length(dblcdInter.Text) = 0 Then dblcdInter.SetFocus;
   Screen.Cursor := crDefault;

End;

Procedure TFProvision.dblcdInterEnter(Sender: TObject);
Begin
   DMCXP.cdsProv.IndexFieldNames := 'PROVDES';
End;

Procedure TFProvision.dblcdInterExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If dblcClAuxInter.Focused Then Exit;
   If bbtnBorra.Focused Then Exit;
   If Length(dblcClAuxInter.Text) = 0 Then
   Begin
      dblcClAuxInter.SetFocus;
      Raise Exception.Create('Falta Ingresar Clase de Auxiliar de Intermediario');
   End;

   xWhere := 'CLAUXID=''' + dblcClAuxInter.Text + ''' and PROV=''' + dblcdInter.Text + ''' and NVL(ACTIVO,''N'')=''S''';
   edtIntermediario.Text := BuscaQry('dspTGE', 'TGE201', 'PROV,PROVRUC,PROVDES', xWhere, 'PROVDES');
   If length(dblcdInter.Text) > 0 Then
   Begin
      If dblcdInter.Text = DMCXP.cdsQry.FieldByName('Prov').AsString Then
      Begin
         dtpFComp.SetFocus;
      End
      Else
      Begin
         edtIntermediario.Text := '';
         dblcdInter.SetFocus;
         Showmessage('Ingrese Código de Intermediario');
         Exit;
      End;
   End
   Else
   Begin
      edtIntermediario.Text := '';
      Showmessage('Ingrese Código de Intermediario');
      dblcdInter.SetFocus;
   End;

End;

Procedure TFProvision.chkInterExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtnBorra.Focused Then Exit;
   If edtNoDoc.Focused Then Exit;
   If edtSerie.Focused Then Exit;
   If dblcTDoc.Focused Then Exit;

   If Not dblcClauxInter.Visible Then
      dtpFComp.SetFocus;
End;

Procedure TFProvision.dblcdOCompraEnter(Sender: TObject);
Var
   xSQL: String;
Begin
// Inicio HPC_201406_CXP
   {
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := 'Select ODCID, PROV, ODCFEMI, COALESCE(ODCTOTALG,0)-COALESCE(ODCTIMPAMOR,0) ODCTIMPAMOR '
         + 'From LOG304 '
         + 'Where CIAID=''' + dblcCia.Text + ''' and PROV=''' + dblcdProv.Text + ''' and '
         + 'COALESCE(ODCTOTALG,0)-COALESCE(ODCTIMPAMOR,0)>0';
   End;
   If SRV_D = 'ORACLE' Then
   Begin
      If dblcCia.Text = '04' Then
      Begin
         xSQL := 'Select ODCID, PROV, ODCFEMI, NVL(ODCTOTALG,0)-NVL(ODCTIMPAMOR,0) ODCTIMPAMOR '
            + 'From LOG304 '
            + 'Where CIAID=''' + dblcCia.Text + ''' and PROV=''' + dblcdProv.Text + ''' and '
            + 'NVL(ODCTOTALG,0)-NVL(ODCTIMPAMOR,0)>0';
      End
      Else
      Begin
         xSQL := 'Select ODCID, PROV, ODCFEMI, NVL(ODCTOTALG,0)-NVL(ODCTIMPAMOR,0) ODCTIMPAMOR '
            + 'From LOG304 '
            + 'Where CIAID = ' + QuotedStr('02') + ' and PROV = ' + QuotedStr(dblcdProv.Text) + ' and '
            + 'NVL(ODCTOTALG,0)-NVL(ODCTIMPAMOR,0)>0';
      End;
   End;
   }
   If dblcCia.Text = '04' Then
   Begin
      xSQL := 'Select ODCID, PROV, ODCFEMI, NVL(ODCTOTALG,0)-NVL(ODCTIMPAMOR,0) ODCTIMPAMOR '
            + '  From LOG304 '
            + ' Where CIAID = '+quotedstr(dblcCia.Text)
            + '   and PROV = '+quotedstr(dblcdProv.Text)
            + '   and (nvl(ODCTOTALG,0) - nvl(ODCTIMPAMOR,0)) > 0 ';
   End
   Else
   Begin
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
     (* xSQL := 'Select ODCID, PROV, ODCFEMI, NVL(ODCTOTALG,0)-NVL(ODCTIMPAMOR,0) ODCTIMPAMOR '
            + '  From LOG304 '
            + ' Where CIAID = ' + QuotedStr('02')
            + '   and PROV = ' + QuotedStr(dblcdProv.Text)
            + '   and (nvl(ODCTOTALG,0)-nvl(ODCTIMPAMOR,0)) > 0';*)
      xSQL := 'Select ODCID, PROV, ODCFEMI, NVL(ODCTOTALG,0)-NVL(ODCTIMPAMOR,0) ODCTIMPAMOR '
            + '  From LOG304 '
            + ' Where PROV = ' + QuotedStr(dblcdProv.Text)
            + '   and (nvl(ODCTOTALG,0)-nvl(ODCTIMPAMOR,0)) > 0';
// Fin HPC_201803_CXP
   End;
// Fin HPC_201406_CXP
   DMCXP.cdsQry6.Close;
   DMCXP.cdsQry6.DataRequest(xSQL);
   DMCXP.cdsQry6.Open;
   xImpAmort := 0;
End;

Procedure TFProvision.dblcdOCompraExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtnBorra.Focused Then Exit;

   // Regla de Negocio  :  Si Se debe Registrar Orden de Compra
   If DMCXP.wVRN_OrdenCompra = 'S' Then
   Begin
      If length(dblcdOCompra.Text) = 0 Then
      Begin
         ShowMessage('Falta Orden de Compra');
         dblcdOCompra.SetFocus;
         Exit;
      End;
      If DMCXP.cdsQry6.Locate('ODCID', VarArrayOf([dblcdOCompra.Text]), [loCaseInsensitive]) Then
         xImpAmort := DMCXP.cdsQry6.FieldByName('ODCTIMPAMOR').AsFloat
      Else
      Begin
         ShowMessage('Orden de Compra No Existe');
         dblcdOCompra.SetFocus;
         Exit;
      End;
   End
   Else
   Begin
      If dblcdOCompra.Text <> '' Then
      Begin
         If DMCXP.cdsQry6.Locate('ODCID', VarArrayOf([dblcdOCompra.Text]), [loCaseInsensitive]) Then
            xImpAmort := DMCXP.cdsQry6.FieldByName('ODCTIMPAMOR').AsFloat
         Else
         Begin
            ShowMessage('Orden de Compra No Existe');
            dblcdOCompra.SetFocus;
            Exit;
         End;
      End;
   End;
End;

Procedure TFProvision.dblcTipRegEnter(Sender: TObject);
var
   xSQL : String;
Begin
   DMCXP.cdsTipReg.Filter := '';
   DMCXP.cdsTipReg.IndexFieldNames := 'TREGID';
   xSQL := 'Select * from TGE113 ';
   if xEsDomiciliado='S' then
      xSQL := xSQL + ' where TREGID not in (''14'',''15'') ';
   xSQL := xSQL + ' order by TREGID ';
   Filtracds(DMCXP.cdsTipReg, xSQL);
   dblcTipReg.LookupField := 'TREGID';
   dblcTipReg.LookupTable := DMCXP.cdsTipReg;
End;

Procedure TFProvision.dbgPendientesEndDrag(Sender, Target: TObject; X,
   Y: Integer);
Begin
   If Not btnActReg.Enabled Then Exit;
   If DMCXP.cdsMovCxP2.recordcount = 0 Then Exit;

   If Target = dbgCanje Then
   Begin

      If Length(DMCXP.cdsMovCxP2.FieldByName('CPSERIE').AsString) = 0 Then
         DMCXP.cdsDetCanje.IndexFieldNames := 'CIAID;PROV;DOCID;CPNODOC'
      Else
         DMCXP.cdsDetCanje.IndexFieldNames := 'CIAID;PROV;DOCID;CPSERIE;CPNODOC';

      DMCXP.cdsDetCanje.SetKey;
      DMCXP.cdsDetCanje.FieldByName('CIAID').AsString := DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString;
      DMCXP.cdsDetCanje.FieldByName('PROV').AsString := DMCXP.cdsMovCxP2.FieldByName('PROV').AsString;
      DMCXP.cdsDetCanje.FieldByName('DOCID').AsString := DMCXP.cdsMovCxP2.FieldByName('DOCID').AsString;

      If Length(DMCXP.cdsMovCxP2.FieldByName('CPSERIE').AsString) > 0 Then
         DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString := DMCXP.cdsMovCxP2.FieldByName('CPSERIE').AsString;

      DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString := DMCXP.cdsMovCxP2.FieldByName('CPNODOC').AsString;
      If Not (DMCXP.cdsDetCanje.GotoKey) Then
      Begin
         DMCXP.cdsDetCanje.Insert;
         DMCXP.cdsDetCanje.FieldByName('CIAID').AsString := DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString;
         DMCXP.cdsDetCanje.FieldByName('CLAUXID').AsString := trim(dblcClAux.Text);
         DMCXP.cdsDetCanje.FieldByName('PROV').AsString := DMCXP.cdsMovCxP2.FieldByName('PROV').AsString;
         DMCXP.cdsDetCanje.FieldByName('PROVRUC').AsString := DMCXP.cdsMovCxP2.FieldByName('PROVRUC').AsString;
         DMCXP.cdsDetCanje.FieldByName('DOCID').AsString := DMCXP.cdsMovCxP2.FieldByName('DOCID').AsString;
         DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString := DMCXP.cdsMovCxP2.FieldByName('CPSERIE').AsString;
         DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString := DMCXP.cdsMovCxP2.FieldByName('CPNODOC').AsString;
         DMCXP.cdsDetCanje.FieldByName('CPNOREG').AsString := DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString;
         DMCXP.cdsDetCanje.FieldByName('TCANJEID').AsString := 'PR';
         DMCXP.cdsDetCanje.FieldByName('CCPCANJE').AsString := '';
         DMCXP.cdsDetCanje.FieldByName('FLAGVAR').AsString := 'S'; // S// SE ENCUENTRA EN EL GRID , N NO SE ENCUENTRA
         DMCXP.cdsDetCanje.FieldByName('DOCID2').AsString := DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
         DMCXP.cdsDetCanje.FieldByName('CPSERIE2').AsString := DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
         DMCXP.cdsDetCanje.FieldByName('CPNODOC2').AsString := DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
         DMCXP.cdsDetCanje.FieldByName('TMONID').AsString := DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString; // T.mon del doc - no modif.
         DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsDateTime := DMCXP.cdsMovCxP2.FieldByName('CPFCMPRB').AsdateTime;
         DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPTCAMPR').AsFloat;

         xFlagCal := False;
         DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPSALORI').AsFloat;
         DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsFloat;
         xFlagCal := False;
         DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsFloat;
         xFlagCal := True;

         DMCXP.cdsDetCanje.FieldByName('SALLOC').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsFloat;
         DMCXP.cdsDetCanje.FieldByName('SALEXT').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsFloat;
         DMCXP.cdsDetCanje.FieldByName('DCDUSER').AsString := DMCXP.wUsuario;
         DMCXP.cdsDetCanje.FieldByName('DCDFREG').AsdateTime := date;
         DMCXP.cdsDetCanje.FieldByName('DCDHREG').AsDateTime := time;
         DMCXP.cdsDetCanje.FieldByName('DCDAAAA').AsString := DMCXP.cdsMovCxP2.FieldByName('CPAAAA').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDMM').AsString := DMCXP.cdsMovCxP2.FieldByName('CPMM').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDDD').AsString := DMCXP.cdsMovCxP2.FieldByName('CPDD').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDTRI').AsString := DMCXP.cdsMovCxP2.FieldByName('CPTRI').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDSEM').AsString := DMCXP.cdsMovCxP2.FieldByName('CPSEM').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDSS').AsString := DMCXP.cdsMovCxP2.FieldByName('CPSS').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDANOMM').AsString := DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDAATRI').AsString := DMCXP.cdsMovCxP2.FieldByName('CPAATRI').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDAASEM').AsString := DMCXP.cdsMovCxP2.FieldByName('CPAASEM').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDAASS').AsString := DMCXP.cdsMovCxP2.FieldByName('CPAASS').AsString;
         DMCXP.cdsDetCanje.post;
         DMCXP.cdsMovCxP2.Edit;
         DMCXP.cdsMovCxP2.FieldByName('FLAGVAR').AsString := 'XX';
         DMCXP.cdsMovCxP2.Post;

         DMCXP.cdsMovCxP2.Filtered := False;
         DMCXP.cdsMovCxP2.Filter := '';
         DMCXP.cdsMovCxP2.Filter := 'FLAGVAR<>' + '''' + 'XX' + '''';

         DMCXP.cdsMovCxP2.Filtered := True;

      End;
      DMCXP.cdsDetCanje.IndexFieldNames := 'CIAID;PROV;DOCID;CPSERIE;CPNODOC';
   End;
End;

Procedure TFProvision.dbgPendientesMouseDown(Sender: TObject;
   Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
   dbgPendientes.BeginDrag(False);
End;

Procedure TFProvision.dbgCanjeDragOver(Sender, Source: TObject; X,
   Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
   Accept := True;
End;

Procedure TFProvision.dbgCanjeEndDrag(Sender, Target: TObject; X,
   Y: Integer);
Begin

   If Not btnActReg.Enabled Then Exit;
   If DMCXP.cdsDetCanje.recordcount = 0 Then Exit;

   If Target = dbgPendientes Then
   Begin
      DMCXP.cdsMovCxP2.Filtered := False;
      If Length(DMCXP.cdsCanje.FieldByName('CPSERIE').AsString) = 0 Then
         DMCXP.cdsMovCxP2.IndexFieldNames := 'CIAID;PROV;DOCID;CPNODOC'
      Else
      Begin
         DMCXP.cdsMovCxP2.IndexFieldNames := 'CIAID;PROV;DOCID;CPSERIE;CPNODOC';
      End;
      DMCXP.cdsMovCxP2.SetKey;
      DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString := DMCXP.cdsDetCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsMovCxP2.FieldByName('PROV').AsString := DMCXP.cdsDetCanje.FieldByName('PROV').AsString;
      DMCXP.cdsMovCxP2.FieldByName('DOCID').AsString := DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
      If Length(DMCXP.cdsCanje.FieldByName('CPSERIE').AsString) > 0 Then
         DMCXP.cdsMovCxP2.FieldByName('CPSERIE').AsString := DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString;
      DMCXP.cdsMovCxP2.FieldByName('CPNODOC').AsString := DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString;
      If DMCXP.cdsMovCxP2.GotoKey Then
      Begin
         DMCXP.cdsDetCanje.Delete;
         DMCXP.cdsMovCxP2.Edit;
         DMCXP.cdsMovCxP2.FieldByName('FLAGVAR').AsString := '.';
         DMCXP.cdsMovCxP2.Post;
      End
      Else
         DMCXP.cdsDetCanje.Delete;

      DMCXP.cdsMovCxP2.IndexFieldNames := 'CIAID;PROV;DOCID;CPSERIE;CPNODOC';
      DMCXP.cdsMovCxP2.Filtered := True;
   End;
End;

Procedure TFProvision.dbgCanjeMouseDown(Sender: TObject;
   Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
   dbgCanje.BeginDrag(False);
End;

Procedure TFProvision.dbgPendientesDragOver(Sender, Source: TObject; X,
   Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
   Accept := True;
End;

Procedure TFProvision.bbtnTotalClick(Sender: TObject);
Var
   xBaseImp, xImpuTot, xITotal, xTOT, xIGV: Double;
   xWhere, xBusca, xTRTot, xTRIgv, xTipDet: String;
   xMtoMG, xMtoNG, xTasa: double;
Begin
   If Length(dblcImpuesto.Text) = 0 Then Exit;

   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.eof Do
   Begin
      // Inicia HPC_201405_CXP
      If (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'MG') Or (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'NG') Or (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'BI') Then
      // Fin HPC_201405_CXP
      Begin
         DMCXP.cdsDetCxP.Delete;
      End
      Else
      Begin
         DMCXP.cdsDetCxP.Next;
      End;
   End;

   DMCXP.cdsDetCxP.First;
   xBaseImp := 0;
   xImpuTot := 0;
   xITotal := 0;

   xMtoMG := 0;
   xMtoNG := 0;
   xTasa := 0;
   //*

   While Not DMCXP.cdsDetCxP.eof Do
   Begin
      If Copy(DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString, 1, 1) = 'I' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByname('DCPDH').AsString = 'D' Then
            xImpuTot := xImpuTot + FRound(DMCXP.cdsDetCxP.FieldByname('DCPMoOri').Value, 15, 2)
         Else
            xImpuTot := xImpuTot - FRound(DMCXP.cdsDetCxP.FieldByname('DCPMoOri').Value, 15, 2);
         xTRIgv := DMCXP.cdsDetCxP.FieldByname('TRegId').AsString;
      End;
      If Copy(DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString, 1, 1) = 'T' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByname('DCPDH').AsString = 'H' Then
            xITotal := xITotal + FRound(DMCXP.cdsDetCxP.FieldByname('DCPMoOri').Value, 15, 2)
         Else
            xITotal := xITotal - FRound(DMCXP.cdsDetCxP.FieldByname('DCPMoOri').Value, 15, 2);
         xTRTot := DMCXP.cdsDetCxP.FieldByname('TRegId').AsString;
      End;
      DMCXP.cdsDetCxP.Next;
   End;

   //////////////////////////////
   //         I. G. V.         //
   //////////////////////////////
   If xImpuTot <= 0 Then
   Begin

      xBusca := 'Select B.* from CXP103 A, TGE113 B '
         + 'Where A.CIAID=''' + dblcCia.Text + ''' and A.TREGREL=''' + xTRTot + ''' '
         + 'and A.TREGID=B.TREGID AND SUBSTR(B.TIPDET,1,1)=''I'' '
         + 'Order by TIPDET';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xBusca);
      DMCXP.cdsQry.Open;

      xTasa := FRound((DMCXP.cdsQry.FieldByName('Tasa').AsFloat / 100) + 1, 7, 2);
      xBaseImp := FRound((xITotal / wTasa), 15, 2);
      xIGV := FRound((xITotal - xBaseImp), 15, 2);

      DMCXP.cdsDetCxP.Last;
      numreg := DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger + 1;

      DMCXP.cdsDetCxP.Append;
      DMCXP.cdsDetCxP.FieldByname('DCPMoOri').Value := xIGV;
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger := numreg;

      GrabaDet;

      DMCXP.cdsDetCxP.FieldByname('TRegId').Value := DMCXP.cdsQry.fieldbyname('TRegID').AsString;
      DMCXP.cdsDetCxP.FieldByname('TIPDET').Value := DMCXP.cdsQry.FieldByName('TipDet').AsString;
      DMCXP.cdsDetCxP.FieldByname('DCPDH').Value := DMCXP.cdsQry.FieldByName('DCPDH').AsString;

      If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'H' Then
         xIGV := xIGV * (-1);

   // Inicio HPC_201407_CXP
      //If DMCXP.cdsDetCxP.State = dsInsert Then
      If xNuevoDet Then
   // Fin HPC_201407_CXP
      Begin
      // Inicio HPC_201407_CXP
         DMCXP.cdsDetCxP.Edit;
      // Fin HPC_201407_CXP
         If DMCXP.cdsDetCxP.FieldByname('TMonId').Value = DMCXP.wTMonLoc Then
         Begin
            DMCXP.cdsDetCxP.FieldByname('CPTOID').Value := DMCXP.cdsTipReg2.fieldbyname('CPTOMN').AsString;
            DMCXP.cdsDetCxP.FieldByname('CUENTAID').Value := DMCXP.cdsTipReg2.fieldbyname('CUENTAMN').AsString;
         End
         Else
         Begin
            DMCXP.cdsDetCxP.FieldByname('CPTOID').Value := DMCXP.cdsTipReg2.fieldbyname('CPTOME').AsString;
            DMCXP.cdsDetCxP.FieldByname('CUENTAID').Value := DMCXP.cdsTipReg2.fieldbyname('CUENTAME').AsString;
         End;

         DMCXP.cdsCnpEgr.IndexFieldNames := 'CPTOID';
         DMCXP.cdsCnpEgr.SetKey;
         DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString := DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString;
         If DMCXP.cdsCnpEgr.Gotokey Then
         Begin
            DMCXP.cdsDetCxP.FieldByname('DCPGLOSA').Value := DMCXP.cdsCnpEgr.fieldbyname('CPTODES').AsString;
         End;
      End;
      DMCXP.cdsDetCxP.Post;
   End
   Else
   Begin
   // Inicio HPC_201406_CXP
      xBusca := ' Select B.* '
              + '   from TGE113 B '
              + '  where substr(B.TIPDET,1,1)=''I'' '
              + '  Order by B.TIPDET';
   // Fin HPC_201406_CXP
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xBusca);
      DMCXP.cdsQry.Open;

      xTasa := FRound((DMCXP.cdsQry.FieldByName('Tasa').AsFloat / 100) + 1, 7, 2);
      If xImpuTot > 0 Then
      Begin
         xMtoMG := FRound(xImpuTot / (xTasa - 1), 15, 2);
         xMtoNG := FRound(xITotal - xImpuTot - xMtoMG, 15, 2);
         xBaseImp := xMtoMG;
      End
      Else
         xBaseImp := FRound((xITotal / xTasa), 15, 2);

   End;

   //////////////////////////////
   //   BASE IMPONIBLE         //
   //////////////////////////////

   If DMCXP.wVRN_ObTDiario = 'S' Then
   Begin
      xTipDet := DMCXP.DisplayDescrip('CXP104', 'TIPDET', 'TDIARID', dblcTDiario.Text);
      xBusca := 'Select B.* from TGE113 B Where B.TIPDET=' + Quotedstr(xTipDet);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xBusca);
      DMCXP.cdsQry.Open;
   End
   Else
      // Inicia HPC_201405_CXP
      xBusca := 'Select B.* from TGE113 B Where B.TIPDET in (''MG'',''BI'') ';
      // Fin HPC_201405_CXP
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xBusca);
   DMCXP.cdsQry.Open;

   xTOTLOC := 0;
   xTOTEXT := 0;

   xTOT := FRound((xBaseImp), 15, 2);
   If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc Then
   Begin
      xTOTLOC := xTOT;
      xTOTEXT := FRound(xTOTLOC / DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 2);
   End
   Else
   Begin
      If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonExt Then
      Begin
         xTOTEXT := xTOT;
         xTOTLOC := FRound(xTOT * DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 2);
      End
      Else
      Begin // Otras Monedas Extranjeras
      End;

   End;

   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.eof Do
   Begin
      // Inicia HPC_201405_CXP
      If (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'MG') Or (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'NG') Or (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = 'BI') Then
      // Fin HPC_201405_CXP
      Begin
         DMCXP.cdsDetCxP.Delete
      End
      Else
         DMCXP.cdsDetCxP.Next;
   End;

   DMCXP.cdsDetCxP.Append;
   DMCXP.cdsDetCxP.FieldByname('DCPMOORI').Value := xTOT;
   numreg := numreg + 1;
   DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger := numreg;

   DMCXP.cdsDetCxP.FieldByname('TIPDET').Value := DMCXP.cdsQry.fieldbyname('TIPDET').AsString;
   DMCXP.cdsDetCxP.FieldByname('TRegId').Value := DMCXP.cdsQry.fieldbyname('TREGID').AsString;
   DMCXP.cdsDetCxP.FieldByname('DCPDH').Value := DMCXP.cdsQry.fieldbyname('DCPDH').AsString;

   GrabaDet;

// Inicio HPC_201407_CXP
   //If DMCXP.cdsDetCxP.State = dsInsert Then
   If xNuevoDet Then
// Fin HPC_201407_CXP
   Begin
   // Inicio HPC_201407_CXP
      DMCXP.cdsDetCxP.Edit;
   // Fin HPC_201407_CXP
      If DMCXP.cdsDetCxP.FieldByname('TMonId').Value = DMCXP.wTMonLoc Then
      Begin
         DMCXP.cdsDetCxP.FieldByname('CPTOID').Value := DMCXP.cdsQry.fieldbyname('CPTOMN').AsString;
         DMCXP.cdsDetCxP.FieldByname('CUENTAID').Value := DMCXP.cdsQry.fieldbyname('CUENTAMN').AsString;
      End
      Else
      Begin
         DMCXP.cdsDetCxP.FieldByname('CPTOID').Value := DMCXP.cdsQry.fieldbyname('CPTOME').AsString;
         DMCXP.cdsDetCxP.FieldByname('CUENTAID').Value := DMCXP.cdsQry.fieldbyname('CUENTAME').AsString;
      End;
      xWhere := 'CPTOID=' + '''' + DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString + '''';
      If length(BuscaQry('PrvCxP', 'CXP201', '*', xWhere, 'CPTOID')) > 0 Then
         DMCXP.cdsDetCxP.FieldByname('DCPGLOSA').Value := DMCXP.cdsQry.fieldbyname('CPTODES').AsString;
   End;

   DMCXP.cdsDetCxP.Post;

   Items;

   //////////////////////////////
   //   BASE NOGRAVADA         //
   //////////////////////////////
   If xMtoNG > 0 Then
   Begin
      xBusca := 'Select B.* from TGE113 B Where B.TIPDET=''MN'' ';

      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xBusca);
      DMCXP.cdsQry.Open;

      xTOTLOC := 0;
      xTOTEXT := 0;

      xTOT := FRound((xMtoNG), 15, 2);
      If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc Then
      Begin
         xTOTLOC := xTOT;
         xTOTEXT := FRound(xTOTLOC / DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 2);
      End
      Else
      Begin
         If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonExt Then
         Begin
            xTOTEXT := xTOT;
            xTOTLOC := FRound(xTOT * DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 2);
         End
         Else
         Begin // Otras Monedas Extranjeras
         End;

      End;

      DMCXP.cdsDetCxP.First;
      While Not DMCXP.cdsDetCxP.eof Do
      Begin
         If (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString = DMCXP.cdsQry.FieldByName('TIPDET').AsString) Then
         Begin
            DMCXP.cdsDetCxP.Delete
         End
         Else
            DMCXP.cdsDetCxP.Next;
      End;

      DMCXP.cdsDetCxP.Append;
      DMCXP.cdsDetCxP.FieldByname('DCPMOORI').Value := xTOT;
      numreg := numreg + 1;
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger := numreg;

      DMCXP.cdsDetCxP.FieldByname('TREGID').Value := DMCXP.cdsQry.fieldbyname('TREGID').AsString;
      DMCXP.cdsDetCxP.FieldByname('TIPDET').Value := DMCXP.cdsQry.fieldbyname('TIPDET').AsString;
      DMCXP.cdsDetCxP.FieldByname('DCPDH').Value := DMCXP.cdsQry.fieldbyname('DCPDH').AsString;

      GrabaDet;

   // Inicio HPC_201407_CXP
      //If DMCXP.cdsDetCxP.State = dsInsert Then
      If xNuevoDet Then
   // Fin HPC_201407_CXP
      Begin
      // Inicio HPC_201407_CXP
         DMCXP.cdsDetCxP.Edit;
      // Fin HPC_201407_CXP
         If DMCXP.cdsDetCxP.FieldByname('TMonId').Value = DMCXP.wTMonLoc Then
         Begin
            DMCXP.cdsDetCxP.FieldByname('CPTOID').Value := DMCXP.cdsQry.fieldbyname('CPTOMN').AsString;
            DMCXP.cdsDetCxP.FieldByname('CUENTAID').Value := DMCXP.cdsQry.fieldbyname('CUENTAMN').AsString;
         End
         Else
         Begin
            DMCXP.cdsDetCxP.FieldByname('CPTOID').Value := DMCXP.cdsQry.fieldbyname('CPTOME').AsString;
            DMCXP.cdsDetCxP.FieldByname('CUENTAID').Value := DMCXP.cdsQry.fieldbyname('CUENTAME').AsString;
         End;
         xWhere := 'CPTOID=' + '''' + DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString + '''';
         If length(BuscaQry('PrvCxP', 'CXP201', '*', xWhere, 'CPTOID')) > 0 Then
            DMCXP.cdsDetCxP.FieldByname('DCPGLOSA').Value := DMCXP.cdsQry.fieldbyname('CPTODES').AsString;
      End;

      DMCXP.cdsDetCxP.Post;
      Items;
   End;

   DMCXP.cdsDetCxP.EnableControls;
End;

Procedure TFProvision.seDiasExit(Sender: TObject);
Begin
   DMCXP.cdsMovCxP.Edit;
   xDias := DMCXP.cdsMovCxP.FieldByname('CPFEMIS').Value + seDias.Value;
   DMCXP.cdsMovCxP.FieldByname('CPFVCMTO').Value := xDias;
   DMCXP.cdsMovCxP.FieldByname('CPFVCMTO').Value := DMCXP.cdsMovCxP.FieldByname('CPFEMIS').Value;
   DMCXP.cdsMovCxP.FieldByname('CPFVCMTO').AsDateTime := DMCXP.cdsMovCxP.FieldByname('CPFVCMTO').AsDateTime + seDias.Value;
End;

Procedure TFProvision.dblcImpuestoEnter(Sender: TObject);
Begin
   DMCXP.cdsTipReg2.IndexFieldNames := 'TREGID';
End;

Procedure TFProvision.dbgCanjeIButtonClick(Sender: TObject);
Begin
   dblcRefTipoDoc.Selected.Clear;
   dblcRefTipoDoc.Selected.Add('DOCID'#9'3'#9'Id'#9'F');
   dblcRefTipoDoc.Selected.Add('DOCDES'#9'30'#9'Documento'#9'F');

   xflag := 'INSERTA';
   pnlRegReferencia.visible := True;
   pnlRegReferencia.BringToFront;
   pnlRegReferencia.Enabled := True;
   dblcRefTipoDoc.setfocus;
   dblcRefTipoDoc.text := '';
   edtReftipDoc.text := '';
   edtRefSerie.text := '';
   edtRefNodoc.text := '';
End;

Procedure TFProvision.bbtnDocrefClick(Sender: TObject);
Begin
   If length(dblcRefTipoDoc.text) = 0 Then
   Begin
      dblcRefTipoDoc.setfocus;
      Showmessage('Debe ingresar el Tipo de Documento');
      Exit;
   End;

   If length(edtReftipDoc.text) = 0 Then
   Begin
      edtReftipDoc.setfocus;
      Showmessage('Tipo de Documento Errado');
      Exit;
   End;

   If length(edtRefSerie.text) = 0 Then
   Begin
      edtRefSerie.setfocus;
      Showmessage('Falta ingresar la Serie del Documento');
      Exit;
   End;

   If length(edtRefNodoc.text) = 0 Then
   Begin
      edtRefNodoc.setfocus;
      Showmessage('Falta ingresar el número del Documento');
      Exit;
   End;

   If dtpFComp2.Date = 0 Then
   Begin
      dtpFComp2.setfocus;
      Showmessage('Falta ingresar Fecha del Documento');
      Exit;
   End;

   If DMCXP.cdsDetCanje.RecordCount > 0 Then
   Begin
      DMCXP.cdsDetcanje.First;
      While Not DMCXP.cdsDetCanje.Eof Do
      Begin
         If DMCXP.cdsDetCanje.FieldByName('DOCID').asstring = dblcRefTipoDoc.text Then
         Begin
            If DMCXP.cdsDetCanje.FieldByName('CPSERIE').asstring = edtRefSerie.text Then
            Begin
               If DMCXP.cdsDetCanje.FieldByName('CPNODOC').asstring = edtRefNodoc.text Then
               Begin
                  edtRefNodoc.setfocus;
                  Showmessage('El Documento ya ha sido registrado en esta Provision');
                  Exit;
               End;
            End;
         End;
         DMCXP.cdsDetcanje.next;
      End;
   End;

   If xflag = 'INSERTA' Then
      DMCXP.cdsDetCanje.insert;
   If xflag = 'EDITA' Then
      DMCXP.cdsDetCanje.EDIT;

   DMCXP.cdsDetCanje.Insert;
   DMCXP.cdsDetCanje.FieldByName('CIAID').AsString := DMCXP.cdsMovCxP.FieldByName('CIAID').AsString;
   DMCXP.cdsDetCanje.FieldByName('CLAUXID').AsString := trim(dblcClAux.Text);
   DMCXP.cdsDetCanje.FieldByName('PROV').AsString := DMCXP.cdsMovCxP.FieldByName('PROV').AsString;
   DMCXP.cdsDetCanje.FieldByName('PROVRUC').AsString := DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString;
   DMCXP.cdsDetCanje.FieldByName('DOCID').AsString := dblcRefTipoDoc.text;
   DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString := edtRefSerie.text;
   DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString := edtRefNodoc.text;
   DMCXP.cdsDetCanje.FieldByName('CPNOREG').AsString := meNoReg.text;
   DMCXP.cdsDetCanje.FieldByName('TCANJEID').AsString := 'PR';
   DMCXP.cdsDetCanje.FieldByName('CCPCANJE').AsString := '';
   DMCXP.cdsDetCanje.FieldByName('DOCID2').AsString := DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPSERIE2').AsString := DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPNODOC2').AsString := DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
   DMCXP.cdsDetCanje.FieldByName('TMONID').AsString := DMCXP.cdsMovCxP.FieldByName('TMONID').AsString; // T.mon del doc - no modif.

   DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsDateTime := dtpFComp2.Date;
   DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat;
   DMCXP.cdsDetCanje.FieldByName('FLAGVAR').AsString := 'N'; // S// SE ENCUENTRA EN EL GRID , N NO SE ENCUENTRA
   DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat := 0;
   DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := 0;
   DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat := 0;
   DMCXP.cdsDetCanje.FieldByName('SALLOC').AsFloat := 0;
   DMCXP.cdsDetCanje.FieldByName('SALEXT').AsFloat := 0;
   DMCXP.cdsDetCanje.FieldByName('DCDUSER').AsString := DMCXP.wUsuario;
   DMCXP.cdsDetCanje.FieldByName('DCDFREG').AsdateTime := date;
   DMCXP.cdsDetCanje.FieldByName('DCDHREG').AsDateTime := time;
   DMCXP.cdsDetCanje.FieldByName('DCDAAAA').AsString := DMCXP.cdsMovCxP.FieldByName('CPAAAA').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDMM').AsString := DMCXP.cdsMovCxP.FieldByName('CPMM').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDDD').AsString := DMCXP.cdsMovCxP.FieldByName('CPDD').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDTRI').AsString := DMCXP.cdsMovCxP.FieldByName('CPTRI').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDSEM').AsString := DMCXP.cdsMovCxP.FieldByName('CPSEM').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDSS').AsString := DMCXP.cdsMovCxP.FieldByName('CPSS').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDANOMM').AsString := DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDAATRI').AsString := DMCXP.cdsMovCxP.FieldByName('CPAATRI').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDAASEM').AsString := DMCXP.cdsMovCxP.FieldByName('CPAASEM').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDAASS').AsString := DMCXP.cdsMovCxP.FieldByName('CPAASS').AsString;
   DMCXP.cdsDetCanje.Post;
End;

Procedure TFProvision.dblcRefTipoDocExit(Sender: TObject);
Begin
   If bbtnCancelar.focused Then exit;
   If Length(dblcRefTipoDoc.Text) = 0 Then
   Begin
      dblcRefTipoDoc.SetFocus;
      Raise Exception.Create(' Error :  Falta Registrar Documento de Referencia ');
   End;
   edtReftipDoc.Text := DMCXP.cdsQry10.FieldByName('DOCDES').AsString;
   If length(edtReftipDoc.Text) = 0 Then
   Begin
      dblcRefTipoDoc.SetFocus;
      Raise Exception.Create(' Error :  Falta Registrar Documento de Referencia ');
   End;

End;

Procedure TFProvision.bbtnCancelarClick(Sender: TObject);
Begin
   If dblcRefTipoDoc.focused Then exit;
   pnlRegReferencia.visible := False;

End;

Procedure TFProvision.dbgCanjeDblClick(Sender: TObject);
Begin
   If DMCXP.cdsDetCanje.FieldByName('FLAGVAR').AsString = 'S' Then
   Begin
      Showmessage('No se puede Modificar');
      Exit;
   End
   Else
   Begin
   End;

End;

Procedure TFProvision.bbtnAplicaPagosClick(Sender: TObject);  // HPC_201406_CXP Ex-BitBtn1
Var
   xSQL, xFiltro: String;
Begin
// Inicio HPC_201406_CXP
   If (DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString <> 'P') Then
   Begin
      ShowMessage(' Sólo se puede aplicar pagos a Provisiones Aceptadas');
      exit;
   End;

   xSQL := 'Select A.BANCOID, BANCOABR, CCBCOID, ECNOCHQ, ECFEMICH, ECSALMN, ECSALME, '
         + '       0.00 PAGOMN, 0.00 PAGOME, ECTCAMB, CIAID, TDIARID, ECANOMM, ECNOCOMP '
         + '  from CAJA302 A, TGE105 B '
         + ' where A.CIAID = '+quotedstr(dblcCia.Text)
         + '   and A.CLAUXID = '+quotedstr(dblcClAux.text)
         + '   and A.PROV = '+quotedstr(dblcdProv.Text)
         + '   and A.BANCOID=B.BANCOID';
// Fin HPC_201406_CXP
   DMCXP.cdsDetCanje.Close;
   DMCXP.cdsDetCanje.DataRequest(xSQL);
   DMCXP.cdsDetCanje.Open;

   If DMCXP.cdsDetCanje.Recordcount > 0 Then
   Begin
      If MessageDlg('Desea Aplicar Pagos' + chr(13) +
         '   ¿Esta Seguro?     ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         exit;
      Try
         FAplicaCaja := TFAplicaCaja.Create(Self);
         FAplicaCaja.xModo := 'NUEVO';
         FAplicaCaja.ShowModal;
      Finally
         FAplicaCaja.Free;
         xFiltro := 'CIAID=' + '''' + dblcCia.Text + '''' + ' and ' +
            'DCPANOMM=' + '''' + meAnoMM.Text + '''' + ' and ' +
            'TDIARID=' + '''' + dblcTdiario.Text + '''' + ' and ' +
            'CPNOREG=' + '''' + meNoReg.Text + '''';
         Filtracds(DMCXP.cdsDetCxP, 'Select * from CXP302 Where ' + xFiltro);
      End
   End;
End;

Procedure TFProvision.FormShow(Sender: TObject);
Var
   ssql, xWhere, xSQL: String;
// Inicio HPC_201501_CXP
// Inicia HPC_201410_CXP
// xTIPPERID: String;
// xFECNAC: String;
// xSNPAFPID: String;
// xTIPCOMAFPID: String;
// xREGPENSION: String;
// xDOCID: String;
// xWhe: String;
// Fin HPC_201410_CXP
// Final HPC_201501_CXP
Begin
   xCrea := True;
   DMCXP.AccesosUsuarios(DMCXP.wModulo, DMCXP.wUsuario, '2', Screen.ActiveForm.Name);

   xTipoProv := 'P';

   PageControl1.ActivePage := TabSheet1;

   /////////////////////////////////////////////////////////////////////////////////
   // RETENCION
   xSQL := 'Select TASAMTO, TASACAN, TASADES,TASAFEC from TGE108 Where TASAFLG=''R''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.Datarequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount = 0 Then
   Begin
      dtpFEmis.SetFocus;
      Raise exception.Create('No hay Tasa de Retención definida');
   End;
   xTasaRet := DMCXP.cdsQry.FieldByname('TASACAN').AsFloat;
   xTasaMonto := DMCXP.cdsQry.FieldByname('TASAMTO').AsFloat;
   xTasaDes := DMCXP.cdsQry.FieldByname('TASADES').AsString;
   xTasaFec := DMCXP.cdsQry.FieldByname('TASAFEC').AsDateTime;
   /////////////////////////////////////////////////////////////////////////////////
   // DETRACCION
   xSQL := 'Select TASAMTO, TASACAN, TASADES,TASAFEC from TGE108 Where TASAFLG=''D''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.Datarequest(xSQL);
   DMCXP.cdsQry.Open;
   xTasaDTR := DMCXP.cdsQry.FieldByname('TASAMTO').AsFloat;
   /////////////////////////////////////////////////////////////////////////////////

   DMCXP.cdsQry10.Close;
   DMCXP.cdsQry10.DataRequest('SELECT * FROM TGE110  WHERE  DOCMOD=''CXP'' ORDER BY DOCID ');
   DMCXP.cdsQry10.Open;
   xDtrAfecto := DMCXP.cdsQry10.fieldbyname('DTRAFECTO').AsString;
   edtTDoc.Text := DMCXP.cdsQry10.fieldbyname('DOCDES').AsString;

   DMCXP.AccesosUsuarios(DMCXP.wModulo, DMCXP.wUsuario, '2', Screen.ActiveForm.Name);

   If xTipoProv = 'O' Then
   Begin
      lblOCompra.Visible := False;
      dblcdOCompra.Visible := False;
   End
   Else
   Begin
      lblOCompra.Visible := True;
      dblcdOCompra.Visible := True;
   End;

  // Regla de Negocio  :  Si Se debe Registrar Orden de Compra
   If DMCXP.wVRN_OrdenCompra = 'N' Then
   Begin
      lblOCompra.Visible := False;
      dblcdOCompra.Visible := False;
   End;

  // Regla de Negocio  :  Para Usar Opcion de Intermediación
   chkInter.Visible := False;
   lblInter.Visible := False;
   If DMCXP.wVRN_InterMed = 'S' Then
   Begin
      chkInter.Visible := True;
      lblInter.Visible := True;
   End;

   If DMCXP.wVRN_ProvAutoDD = 'S' Then
   Else
   Begin
      dblcdProv.AutoDropDown := false;
   End;

   If DMCXP.wVRN_AutoDDLC = 'S' Then
   Begin
      dblcTDiario.AutoDropDown := True;
      dblcTDoc.AutoDropDown := True;
      dblcClAux.AutoDropDown := True;
      dblcTMon.AutoDropDown := True;
      dblcClauxInter.AutoDropDown := True;
      dblcClAuxResp.AutoDropDown := True;
      dblcTipReg.AutoDropDown := True;
   End
   Else
   Begin
      dblcTDiario.AutoDropDown := False;
      dblcTDoc.AutoDropDown := False;
      dblcClAux.AutoDropDown := False;
      dblcTMon.AutoDropDown := False;
      dblcClauxInter.AutoDropDown := False;
      dblcClAuxResp.AutoDropDown := False;
      dblcTipReg.AutoDropDown := False;
   End;

  // Para Determinar la Longitud del Lote
   dbeLote.MaxLength := DMCXP.wAnchoLote;

   xGlosaRep := '';

   // Si El Password es del Administrador
   If DMCXP.wAdmin = 'G' Then
   Begin
      DMCXP.wModo := 'C';
   End;

// Inicio HPC_201406_CXP
   Filtracds(DMCXP.cdsTipReg2, 'select * from TGE113 where TIPDET in (''I1'',''I2'',''I3'',''SC'') order by TREGID');
// Fin HPC_201406_CXP

   dblcImpuesto.Selected.Clear;
   dblcImpuesto.Selected.Add('TREGID'#9'3'#9'Id'#9'F');
   dblcImpuesto.Selected.Add('TREGDES'#9'30'#9'Descripción'#9'F');
   dblcImpuesto.Selected.Add('DCPDH'#9'2'#9'D/H'#9'F');
   dblcImpuesto.Selected.Add('TIPDET'#9'3'#9'TIPDET'#9'F');

   DMCXP.cdsTipReg.IndexFieldNames := 'TREGID';

   If DMCXP.wModo = 'A' Then
   Begin
      DMCXP.cdsMovCxP.Insert;
      IniciaForma;
      EstadoDeForma(0, ' ', ' ');
      dblcCia.SetFocus;
   End
   Else
   Begin

      seDias.Value := StrToInt(FloatToStrF((dtpFVcmto.date - dtpFEmis.Date), ffnumber, 10, 0));

      If (DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString = 'I') Or
         (DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString = 'T') Then
      Begin

         If DMCXP.wVRN_CCosCia <> 'S' Then
            xSQL := 'SELECT CCOSID, CCOSDES, CCOSABR, CCOSNIV, CCOSMOV FROM TGE203 '
               + 'Where CCOSACT=' + quotedstr('S')
         Else
            xSQL := 'SELECT CCOSID, CCOSDES, CCOSABR, CCOSNIV, CCOSMOV FROM TGE203 '
               + 'Where CCOSCIAS LIKE (' + quotedstr('%' + dblcCia.Text + '%') + ' ) '
               + 'and CCOSACT=' + quotedstr('S') + ' and CCOSMOV=' + quotedstr('S');

         DMCXP.cdsCCosto.Close;
         DMCXP.cdsCCosto.DataRequest(xSQL);
         DMCXP.cdsCCosto.open;
         DMCXP.cdsCCosto.Filter := '';
         DMCXP.cdsCCosto.Filtered := False;
         DMCXP.cdsCCosto.IndexFieldNames := 'CCOSID';
      End;

      If DMCXP.wVRN_CptoCia = 'N' Then
         xSQL := 'select * from CXP201 '
      Else
         xSQL := 'select A.CPTOID, A.CPTODES, A.CUENTAID, NIVELMOV, DTRPORC, CCOSPORCEN From CXP201 A '
            + 'WHERE EXISTS ( SELECT CUENTAID FROM TGE202 B '
            + 'WHERE A.CUENTAID=B.CUENTAID AND B.CTAACT=''S'' '
            + 'AND B.CIAID=''' + dblcCia.Text + ''') '
            + 'ORDER BY A.CPTOID';

      DMCXP.cdsCnpEgr.Close;
      DMCXP.cdsCnpEgr.DataRequest(xSQL);
      DMCXP.cdsCnpEgr.Open;

      xFlagGr := False;
      dblcImpuesto.Text := '';
      edtImpuesto.Text := '';
      DMCXP.cdsMovCxP.Edit;

      If DMCXP.cdsMovCxP.FieldByName('AUXIDINTER').AsString = '' Then
      Begin
         chkInter.Checked := False;
         lblProvInter.Visible := False;
         lblClAuxInter.Visible := False;
         dblcdInter.Visible := False;
         dblcClAuxInter.Visible := False;
         edtIntermediario.Visible := False;
      End
      Else
      Begin
         pnlCab2.Enabled := True;
         chkInter.Checked := True;
         lblProvInter.Visible := True;
         lblClAuxInter.Visible := True;
         dblcdInter.Visible := True;
         dblcClAuxInter.Visible := True;
         edtIntermediario.Visible := True;
         xWhere := 'ClAuxId=''' + dblcClAuxInter.Text + ''' and Prov=''' + dblcdInter.Text + '''';
         edtIntermediario.Text := BuscaQry('dspTGE', 'TGE201', 'Prov,ProvRUC,ProvDES', xWhere, 'ProvDES');
      End;

   // Inicio HPC_201408_CXP
      meNoReg.Text := DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString;
      dtpFComp.Enabled := False;
   // Fin HPC_201408_CXP

      cbSujetoaRetIGV.Checked := (DMCXP.cdsMovCxP.fieldbyname('PROVRETIGV').AsString = 'S');
      edtCia.Text := DMCXP.DisplayDescrip('TGE101', 'CIADES', 'CIAID', dblcCia.Text);

      wCiaRetIGV := False;
      xExoIGV := DMCXP.cdsULTTGE.FieldByName('EXOIGV').AsString;
      If DMCXP.cdsULTTGE.FieldByName('CIARETIGV').AsString = 'S' Then wCiaRetIGV := True;

      //edtProv.text := DMCXP.DisplayDescrip('TGE201', 'PROVDES', 'PROV', dblcdProv.Text);
      xWhere := 'CLAUXID=''' + dblcClAux.Text + ''' and PROV=''' + dblcdProv.Text + '''';
      edtProv.Text := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV, ACTIVO', xWhere, 'PROVDES');

      xWhere := 'DOCID=' + '''' + dblcTDoc.Text + '''' + ' and DOC_FREG=' + '''' + xTipoProv + '''';

      wProvRetIGV := False;
      If wCiaRetIGV Then
      Begin
         If DMCXP.cdsQry.FieldByName('PROVRETIGV').AsString <> 'N' Then wProvRetIGV := True;
      End;

      edtTDoc.Text := BuscaQry('PrvTGE', 'TGE110', '*', xWhere, 'DOCDES');
      xDtrAfecto := DMCXP.cdsQry.fieldbyname('DTRAFECTO').AsString;

      If xDTRAfecto = 'N' Then
      Begin
         xDTRPorc := 0;
         dbeDetrac.Visible := False;
         lblDet.Visible := False;
      End;

      If DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString = 'I' Then
      Begin
         If (wCiaRetIGV And wProvRetIGV) Then
         Begin
            If DMCXP.cdsQry.fieldbyname('DOCRETIGV').AsString = 'S' Then
            Begin
               cbSujetoaRetIGV.Visible := True;
               lblRetIGV.visible := True;
            End;
         End;
      End
      Else
      Begin
         cbSujetoaRetIGV.Visible := (DMCXP.cdsMovCxP.fieldbyname('PROVRETIGV').AsString = 'S');
         lblRetIGV.visible := (DMCXP.cdsMovCxP.fieldbyname('PROVRETIGV').AsString = 'S');
      End;

      xConta := DMCXP.cdsQry.fieldbyname('DOCCONTA').AsString;
      xDOCTIPREG := DMCXP.cdsQry.fieldbyname('DOCTIPREG').AsString;
      edtTDiario.Text := DMCXP.DisplayDescrip('TGE104', 'TDIARDES', 'TDIARID', dblcTDiario.Text);

      xWhere := 'CLAUXID=''' + dblcClAux.Text + ''' and PROV=''' + dblcdProv.Text + '''';
      xEXON4TA := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV, ACTIVO, ESDOMIC,PROVEXONER', xWhere, 'PROVEXONER');
      lblsusp4c.visible := False;
      IF xDOCTIPREG ='4C' THEN
      BEGIN
         IF xEXON4TA <>'' THEN
           lblsusp4c.visible := True;
      END
      ELSE
      BEGIN
           lblsusp4c.visible := False;
      END;
//Inicio HPC_201501_CXP
{
// Inicia HPC_201410_CXP
       lblAfecLey.Visible := False;
       lblRegPension.Visible := False;
       lblRegPension.caption := '';
       xTIPPERID := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV, ACTIVO, ESDOMIC,PROVEXONER,TIPPERID,FECNAC,SNPAFPID,TIPCOMAFPID', xWhere, 'TIPPERID');
       xWhe := 'AFEC_REGPENSION=''S'' and DOCTIPREG=''4C''';
       xDOCID := BuscaQry('dspTGE', 'TGE110', 'DOCID,DOCMOD,DOCDES,DOCABR,DOCTIPREG,AFEC_REGPENSION', xWhe, 'DOCID');
       IF length(xDOCID)>0 then
       Begin
         IF (xTIPPERID ='01') AND (dblcClAux.Text='H') THEN
         BEGIN
              xSNPAFPID := DMCXP.cdsMovCxP.FieldByName('SNPAFPID').AsString;
              xTIPCOMAFPID := DMCXP.cdsMovCxP.FieldByName('TIPCOMAFPID').AsString;
              xWhere := 'SNPAFPID=''' + xSNPAFPID + ''' ';
              xREGPENSION := BuscaQry('dspTGE', 'RRHH103', 'SNPAFPID,SNPAFPDES,SNPAFPABR', xWhere, 'SNPAFPDES');
              IF length(xSNPAFPID)>0 then
              Begin
                lblAfecLey.Visible := True;
                lblRegPension.Visible := True;
                lblRegPension.caption := xREGPENSION;
              End
              Else
              Begin
                lblAfecLey.Visible := False;
                lblRegPension.Visible := False;
              End;

         END;
       END;
// Fin HPC_201410_CXP
}
//Final HPC_201501_CXP

      xWhere := 'TMONID=' + '''' + dblcTMon.Text + ''''; // +' and (TMon_Loc='+''''+'L'+''''+' or TMon_Loc='+''''+'E'+''''+')';
      edtTMon.Text := BuscaQry('PrvTGE', 'TGE103', 'TMONDES, TMON_LOC', xWhere, 'TMONDES');

      If (DMCXP.cdsQry.FieldByName('TMON_LOC').AsString <> 'L') And (DMCXP.cdsQry.FieldByName('TMON_LOC').AsString <> 'E') Then
      Begin
         xWhere := 'TMONID=' + '''' + DMCXP.wTMonExt + '''' + ' and '
            + 'FECHA=' + DMCXP.wRepFuncDate + '''' + FormatDateTime(DMCXP.wFormatFecha, dtpFEmis.Date) + '''' + ')';
         If length(BuscaQry('PrvTGE', 'TGE107', '*', xWhere, 'TMONID')) > 0 Then
            xxTCamDol := DMCXP.cdsQry.fieldbyname('TCAM' + DMCXP.wVRN_TipoCambio).AsFloat;
      End;

      xWhere := 'CLAUXID=''' + dblcClAuxResp.Text + ''' and PROV=''' + dblcdResp.Text + '''';
      edtResp.Text := BuscaQry('dspTGE', 'TGE201', 'PROV,PROVRUC,PROVDES', xWhere, 'PROVDES');
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
    // Orden de Compra
(*      If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      Begin
         xSQL := 'Select ODCID, PROV, ODCFEMI, COALESCE(ODCTOTALG,0)-COALESCE(ODCTIMPAMOR,0) ODCTIMPAMOR '
            + 'From LOG304 '
            + 'Where CIAID=''' + dblcCia.Text + ''' and PROV=''' + dblcdProv.Text + ''' and '
            + ' ODCID=''' + dblcdOCompra.Text + ''' ';
      End;
*)
      If SRV_D = 'ORACLE' Then
      Begin
         (*xSQL := 'Select ODCID, PROV, ODCFEMI, NVL(ODCTOTALG,0)-NVL(ODCTIMPAMOR,0) ODCTIMPAMOR '
            + 'From LOG304 '
            + 'Where CIAID=''' + dblcCia.Text + ''' and PROV=''' + dblcdProv.Text + ''' and '
            + ' ODCID=''' + dblcdOCompra.Text + ''' '*)
         xSQL := 'Select ODCID, PROV, ODCFEMI, NVL(ODCTOTALG,0)-NVL(ODCTIMPAMOR,0) ODCTIMPAMOR '
            + 'From LOG304 '
            + 'Where PROV=''' + dblcdProv.Text + ''' and '
            + ' ODCID=''' + dblcdOCompra.Text + ''' '
      End;
// Fin HPC_201803_CXP
      DMCXP.cdsQry6.Close;
      DMCXP.cdsQry6.DataRequest(xSQL);
      DMCXP.cdsQry6.Open;

      xImpAmort := DMCXP.cdsQry6.FieldByName('ODCTIMPAMOR').AsFloat;

   // buscar en Proveedores Notificados por SUNAT
      ProveedoresNotificados;

   // buscar en Proveedores No Habidos y No Hallados
      ProveedoresNoHabidos_NoHallados;

      If DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString = 'I' Then
         EstadoDeForma(0, DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString, ' ')
      Else
         EstadoDeForma(1, DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString, DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString);

      FiltraCanje;
   End;

  // Reglas de Negocio
   If DMCXP.wVRN_TCambioFijo = 'N' Then
      dbeTCambio.Enabled := True
   Else
   Begin
      dbeTCambio.Enabled := False;
   End;

   xCrea := False;
   xNuevoprov := False;
   ssql := '';
   ssql := 'SELECT * FROM TGE102 WHERE RESPFF=''S''';
   DMCXP.cdsCLAux1.Close;
   DMCXP.cdsCLAux1.DataRequest(ssql);
   DMCXP.cdsCLAux1.open;

   DMCXP.cdsDetCxP.IndexFieldNames := 'DCPREG';
   If DMCXP.wModo <> 'A' Then
   Begin
      ObtenerNumOrdenPago;
   End;

  ///////////////////////////////////////////
  //inicializa variables
   xDTRPorc := 0; // Porcentaje de DETRACCION
  //////////////////////////////////////////////////////////////////////////////
  // Esto se realiza solo cuando es modificacion, para identificar que existe
  // algun concepto afecto a DETRACCION

   pnlDetraccion.Enabled := False;
   dbeDetrac.Visible := False;
   lblDet.Visible := False;

   If DMCXP.wModo = 'M' Then
   Begin
      DMCXP.cdsCnpEgr.IndexFieldNames := 'CPTOID';
      DMCXP.cdsDetCxP.First;
      While Not DMCXP.cdsDetCxP.Eof Do
      Begin
         DMCXP.cdsCnpEgr.SetKey;
         DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString := DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString;
         DMCXP.cdsCnpEgr.Gotokey;
         If length(DMCXP.cdsCnpEgr.FieldByName('DTRPORC').AsString) > 0 Then
         Begin
            pnlDetraccion.Enabled := True;
            xDTRPorc := DMCXP.cdsCnpEgr.FieldByName('DTRPORC').AsFLoat;
           // carga el listbox que contiene los conceptos digitados que son afectos a DETRACCION
            lbDTRCpto.Items.Add(DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString);
            lbDTRPorc.Items.Add(FloatToStrF(xDTRPorc, ffFixed, 15, 4));
            dbeDetrac.Visible := True;
            lblDet.Visible := True;
         End;

         If length(DMCXP.cdsmovCxP.FieldByName('PORCDESC').AsString) > 0 Then
         Begin
            pnlDetraccion.Enabled := True;
            lblpor.visible := True;
            dbepor.visible := True;
            dbepor.text := DMCXP.cdsmovCxP.FieldByName('PORCDESC').AsString;
            dbeDetrac.Visible := FALSE;
            lblDet.Visible := FALSE;
         End;

         If ((DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString = 'P')
            Or (DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString = 'C'))
            And
            ((DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString = '42203')
            Or (DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString = '42204')) Then
            pnlDetraccion.Enabled := True;

         DMCXP.cdsDetCxP.Next;
      End;

      If (DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString = 'C') Or (DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString = 'P') Then
      Begin
         pnlDetraccion.Enabled := True;
      End;

      If xDTRAfecto = 'N' Then
      Begin
         xDTRPorc := 0;
         dbeDetrac.Visible := False;
         lblDet.Visible := False;
      End;
   End;
// Inicio HPC_201701_CXP
   // Considera Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00
   xValorMinRta4ta := 0;
   if xDOCTIPREG ='4C' then
      xValorMinRta4ta := 1500;
// Fin HPC_201701_CXP
// Inicio HPC_201704_CXP
// Seguros-Automatización de Devengue de Seguros
   If DMCXP.wModo = 'M' Then
   Begin
      xSQL := 'SELECT CPTOID,CPTODES,NROPOL,FECINIVIG,FECFINVIG FROM CXP301 WHERE '
             +' CIAID ='+ QuotedStr(dblcCia.Text)
             +' AND TDIARID ='+ QuotedStr(dblcTDiario.Text)
             +' AND CPANOMES ='+ QuotedStr(meAnoMM.Text)
             +' AND CPNOREG ='+ QuotedStr(meNoReg.Text);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;

      if(length(DMCXP.cdsQry.FieldByName('CPTOID').AsString)>0)then
      begin
          cbSeguros.Checked:= true;
          dblcConcepto.Text := DMCXP.cdsQry.FieldByName('CPTOID').AsString;
          xdblcConcepto :=  DMCXP.cdsQry.FieldByName('CPTOID').AsString;
          dbeConcepto.Text := DMCXP.cdsQry.FieldByName('CPTODES').AsString;
          xdbeConcepto  :=  DMCXP.cdsQry.FieldByName('CPTODES').AsString;
          dbePoliza.Text := DMCXP.cdsQry.FieldByName('NROPOL').AsString;
          xdbePoliza    :=  DMCXP.cdsQry.FieldByName('NROPOL').AsString;
          dtpFIVigencia.Date := DMCXP.cdsQry.FieldByName('FECINIVIG').AsDateTime;
          xdtpFIVigencia:=  dtpFIVigencia.text;
          dtpFFVigencia.Date := DMCXP.cdsQry.FieldByName('FECFINVIG').AsDateTime;
          xdtpFFVigencia:=  dtpFFVigencia.text;
      end
      else
      begin
          pnlSeguroDatos.Visible:= false;
      end;
   End;
// Fin HPC_201704_CXP
End;

Procedure TFProvision.ConfiguraPaneles(wwFormaL: TForm; wwNCampos: Integer);
Var
   i, y, wPosFin: Integer;
   wPanel, wPanelName, wPanelColor: String;
Begin

   ShowMessage('Panel');

   wwFormaL := Screen.ActiveForm;

   wPanel := IniFile.ReadString('PANEL', 'PANEL_' + StrZero(IntToStr(y), 3), '');

   If wPanel <> '' Then
   Begin
      wPosFin := Pos('][', wPanel) - 1;
      wPanelName := Copy(wPanel, 1, wPosFin);
      wPanelColor := Copy(wPanel, wPosFin + 3, Length(wPanel) - wPosFin + 3);
      ShowMessage('1.7');

      ShowMessage(IntToStr(wwNCampos));

      For i := 0 To wwFormaL.ComponentCount - 1 Do
      Begin
         ShowMessage('1.8');

         If wwFormaL.Components[i].ClassName = 'TPanel' Then
         Begin
            ShowMessage('1.9');
            If TPanel(wwFormaL.components[i]).Name = wPanelName Then
            Begin
               ShowMessage('1.10');
               TPanel(wwFormaL.components[i]).Color := StringToColor(wPanelColor);
               Break;
            End;
         End;
      End;
      ShowMessage('1.11');
   End;

   ShowMessage('Fin Panel');

End;

Procedure TFProvision.ConfiguraLabels(wwFormaL: TForm; wwNCampos: Integer);
Var
   i, y, wPosIni, wPosFin: Integer;
   wLabel, wLabelName, wLabelCaption: String;
   wLabelTamano, wLabelColor, wLabelFont, wLabelNegrita: String;
Begin

   wwFormaL := Screen.ActiveForm;

   wLabelTamano := IniFile.ReadString('LABEL', 'TAMAÑO', '');
   wLabelColor := IniFile.ReadString('LABEL', 'COLOR', '');
   wLabelFont := IniFile.ReadString('LABEL', 'FONT', '');
   wLabelNegrita := IniFile.ReadString('LABEL', 'NEGRITA', '');

   For y := 1 To 100 Do
   Begin

      wLabel := IniFile.ReadString('LABEL', 'LABEL_' + StrZero(IntToStr(y), 3), '');

      If wLabel <> '' Then
      Begin
         wPosIni := Pos('=', wLabel) + 1;
         wPosFin := Pos('][', wLabel) - 1;
         wLabelName := Copy(wLabel, 1, wPosFin);
         wLabelCaption := Copy(wLabel, wPosFin + 3, Length(wLabel) - wPosFin + 3);

         For i := 0 To wwFormaL.ComponentCount - 1 Do
         Begin
            If wwFormaL.Components[i].ClassName = 'TLabel' Then
            Begin

               TLabel(wwFormaL.components[i]).Font.Color := StringToColor(wLabelColor);
               TLabel(wwFormaL.components[i]).Font.Name := wLabelFont;
               TLabel(wwFormaL.components[i]).Font.Size := StrToInt(wLabelTamano);

               If wLabelNegrita = 'SI' Then
                  TLabel(wwFormaL.components[i]).Font.Style := TLabel(wwFormaL.components[i]).Font.Style + [fsBold]
               Else
                  TLabel(wwFormaL.components[i]).Font.Style := TLabel(wwFormaL.components[i]).Font.Style - [fsBold];

               If TLabel(wwFormaL.components[i]).Name = wLabelName Then
               Begin
                  TLabel(wwFormaL.components[i]).Caption := wLabelCaption;
                  Break;
               End;
            End;
         End;

      End;
   End;
End;

Procedure TFProvision.ConfiguraCombos(wwFormaL: TForm; wwNCampos: Integer);
Var
   i, y, wPosIni, wPosFin: Integer;
   wArriba, wAbajo, wDerecha, wIzquierda: String;
   wColorFondo, wFontTamano, wFontColor, wFontName: String;
   wwFormaLxx: TForm;

Begin

   ShowMessage('Combos');
   ShowMessage('Combos 1');

   wArriba := IniFile.ReadString('COMBOS', 'BORDE_ARRIBA', '');
   wAbajo := IniFile.ReadString('COMBOS', 'BORDE_ABAJO', '');
   wDerecha := IniFile.ReadString('COMBOS', 'BORDE_DERECHA', '');
   wIzquierda := IniFile.ReadString('COMBOS', 'BORDE_IZQUIERDA', '');
   wColorFondo := IniFile.ReadString('COMBOS', 'COLOR_FONDO', '');
   wFontTamano := IniFile.ReadString('COMBOS', 'FONT_TAMAÑO', '');
   wFontColor := IniFile.ReadString('COMBOS', 'FONT_COLOR', '');
   wFontName := IniFile.ReadString('COMBOS', 'FONT_NAME', '');

   ShowMessage('Combos 2');
   For i := 0 To FProvision.ComponentCount - 1 Do
   Begin
      ShowMessage('Combos 3');
      If FProvision.Components[i].ClassName = 'TwwDBLookupCombo' Then
      Begin
         TwwDBLookupCombo(FProvision.components[i]).Frame.Enabled := False;

         If wIzquierda = 'SI' Then
            TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders + [efLeftBorder]
         Else
            TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders - [efLeftBorder];

         If wArriba = 'SI' Then
            TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders + [efTopBorder]
         Else
            TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders - [efTopBorder];

         If wDerecha = 'SI' Then
            TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders + [efRightBorder]
         Else
            TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders - [efRightBorder];

         If wAbajo = 'SI' Then
            TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders + [efBottomBorder]
         Else
            TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupCombo(FProvision.components[i]).Frame.NonFocusBorders - [efBottomBorder];

         TwwDBLookupCombo(FProvision.components[i]).Frame.Transparent := True;
         TwwDBLookupCombo(FProvision.components[i]).Font.Color := StringToColor(wFontColor);
         TwwDBLookupCombo(FProvision.components[i]).Font.Name := wFontName;
         TwwDBLookupCombo(FProvision.components[i]).Font.Size := StrToInt(wFontTamano);
         TwwDBLookupCombo(FProvision.components[i]).Color := StringToColor(wColorFondo);
         TwwDBLookupCombo(FProvision.components[i]).Frame.Enabled := True;
      End;

      If FProvision.Components[i].ClassName = 'TwwDBLookupComboDlg' Then
      Begin
         TwwDBLookupComboDlg(FProvision.components[i]).Frame.Enabled := False;

         If wIzquierda = 'SI' Then
            TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders + [efLeftBorder]
         Else
            TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders - [efLeftBorder];

         If wArriba = 'SI' Then
            TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders + [efTopBorder]
         Else
            TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders - [efTopBorder];

         If wDerecha = 'SI' Then
            TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders + [efRightBorder]
         Else
            TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders - [efRightBorder];

         If wAbajo = 'SI' Then
            TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders + [efBottomBorder]
         Else
            TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders := TwwDBLookupComboDlg(FProvision.components[i]).Frame.NonFocusBorders - [efBottomBorder];

         TwwDBLookupComboDlg(FProvision.components[i]).Frame.Enabled := True;
         TwwDBLookupComboDlg(FProvision.components[i]).Frame.Transparent := True;
         TwwDBLookupComboDlg(FProvision.components[i]).Font.Color := StringToColor(wFontColor);
         TwwDBLookupComboDlg(FProvision.components[i]).Font.Name := wFontName;
         TwwDBLookupComboDlg(FProvision.components[i]).Font.Size := StrToInt(wFontTamano);
         TwwDBLookupComboDlg(FProvision.components[i]).Color := StringToColor(wColorFondo);
      End;

      If FProvision.Components[i].ClassName = 'TwwDBEdit' Then
      Begin
         TwwDBEdit(FProvision.components[i]).Frame.Enabled := False;

         If wIzquierda = 'SI' Then
            TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders + [efLeftBorder]
         Else
            TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders - [efLeftBorder];

         If wArriba = 'SI' Then
            TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders + [efTopBorder]
         Else
            TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders - [efTopBorder];

         If wDerecha = 'SI' Then
            TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders + [efRightBorder]
         Else
            TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders - [efRightBorder];

         If wAbajo = 'SI' Then
            TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders + [efBottomBorder]
         Else
            TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBEdit(FProvision.components[i]).Frame.NonFocusBorders - [efBottomBorder];

         TwwDBEdit(FProvision.components[i]).Frame.Enabled := True;
         TwwDBEdit(FProvision.components[i]).Frame.Transparent := True;
         TwwDBEdit(FProvision.components[i]).Font.Color := StringToColor(wFontColor);
         TwwDBEdit(FProvision.components[i]).Font.Name := wFontName;
         TwwDBEdit(FProvision.components[i]).Font.Size := StrToInt(wFontTamano);
         TwwDBEdit(FProvision.components[i]).Color := StringToColor(wColorFondo);
      End;

      If FProvision.Components[i].ClassName = 'TwwDBDateTimePicker' Then
      Begin
         TwwDBDateTimePicker(FProvision.components[i]).Frame.Enabled := False;

         If wIzquierda = 'SI' Then
            TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders := TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders + [efLeftBorder]
         Else
            TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders := TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders - [efLeftBorder];

         If wArriba = 'SI' Then
            TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders := TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders + [efTopBorder]
         Else
            TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders := TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders - [efTopBorder];

         If wDerecha = 'SI' Then
            TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders := TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders + [efRightBorder]
         Else
            TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders := TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders - [efRightBorder];

         If wAbajo = 'SI' Then
            TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders := TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders + [efBottomBorder]
         Else
            TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders := TwwDBDateTimePicker(FProvision.components[i]).Frame.NonFocusBorders - [efBottomBorder];

         TwwDBDateTimePicker(FProvision.components[i]).Frame.Enabled := True;
         TwwDBDateTimePicker(FProvision.components[i]).Frame.Transparent := True;
         TwwDBDateTimePicker(FProvision.components[i]).Font.Color := StringToColor(wFontColor);
         TwwDBDateTimePicker(FProvision.components[i]).Font.Name := wFontName;
         TwwDBDateTimePicker(FProvision.components[i]).Font.Size := StrToInt(wFontTamano);
         TwwDBDateTimePicker(FProvision.components[i]).Color := StringToColor(wColorFondo);
      End;

      If FProvision.Components[i].ClassName = 'TwwDBSpinEdit' Then
      Begin
         TwwDBSpinEdit(FProvision.components[i]).Frame.Enabled := False;

         If wIzquierda = 'SI' Then
            TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders + [efLeftBorder]
         Else
            TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders - [efLeftBorder];

         If wArriba = 'SI' Then
            TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders + [efTopBorder]
         Else
            TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders - [efTopBorder];

         If wDerecha = 'SI' Then
            TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders + [efRightBorder]
         Else
            TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders - [efRightBorder];

         If wAbajo = 'SI' Then
            TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders + [efBottomBorder]
         Else
            TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders := TwwDBSpinEdit(FProvision.components[i]).Frame.NonFocusBorders - [efBottomBorder];

         TwwDBSpinEdit(FProvision.components[i]).Frame.Enabled := True;
         TwwDBSpinEdit(FProvision.components[i]).Frame.Transparent := True;
         TwwDBSpinEdit(FProvision.components[i]).Font.Color := StringToColor(wFontColor);
         TwwDBSpinEdit(FProvision.components[i]).Font.Name := wFontName;
         TwwDBSpinEdit(FProvision.components[i]).Font.Size := StrToInt(wFontTamano);
         TwwDBSpinEdit(FProvision.components[i]).Color := StringToColor(wColorFondo);

      End;

   End;

   ShowMessage('Fin Combos');

End;

Procedure TFProvision.ConfiguraGrids(wwFormaL: TForm; wwNCampos: Integer);
Var
   i, y, wPosIni, wPosFin: Integer;
   wDetalleFontTamano, wDetalleFontColor, wDetalleFontName: String;
   wTituloFontTamano, wTituloFontColor, wTituloFontName: String;
   wTituloColor, wPieColor: String;
Begin

   ShowMessage('Grids');

   ShowMessage(Screen.ActiveForm.Name);

   wwFormaL := Screen.ActiveForm;

   wDetalleFontTamano := IniFile.ReadString('GRID', 'DETALLE_FONT_TAMAÑO', '');
   wDetalleFontColor := IniFile.ReadString('GRID', 'DETALLE_FONT_COLOR', '');
   wDetalleFontName := IniFile.ReadString('GRID', 'DETALLE_FONT_NAME', '');

   wTituloFontTamano := IniFile.ReadString('GRID', 'TITULO_FONT_TAMAÑO', '');
   wTituloFontColor := IniFile.ReadString('GRID', 'TITULO_FONT_COLOR', '');
   wTituloFontName := IniFile.ReadString('GRID', 'TITULO_FONT_NAME', '');
   wTituloColor := IniFile.ReadString('GRID', 'TITULO_COLOR', '');
   wPieColor := IniFile.ReadString('GRID', 'PIE_COLOR', '');

   For i := 0 To wwFormaL.ComponentCount - 1 Do
   Begin
      If wwFormaL.Components[i].ClassName = 'TwwDBGrid' Then
      Begin

         TwwDBGrid(wwFormaL.components[i]).Font.Color := StringToColor(wDetalleFontColor);
         TwwDBGrid(wwFormaL.components[i]).Font.Name := wDetalleFontName;
         TwwDBGrid(wwFormaL.components[i]).Font.Size := StrToInt(wDetalleFontTamano);

         TwwDBGrid(wwFormaL.components[i]).TitleFont.Color := StringToColor(wTituloFontColor);
         TwwDBGrid(wwFormaL.components[i]).TitleFont.Name := wTituloFontName;
         TwwDBGrid(wwFormaL.components[i]).TitleFont.Size := StrToInt(wTituloFontTamano);
         TwwDBGrid(wwFormaL.components[i]).TitleColor := StringToColor(wTituloColor);
         TwwDBGrid(wwFormaL.components[i]).FooterColor := StringToColor(wPieColor);
      End;
   End;
   ShowMessage('fin Grids');

End;

Procedure TFProvision.ConfiguraForma(wwForma: TForm; wwNCampos: Integer);
Begin
   ShowMessage('1');
   inifile := TIniFile.Create('C:\SOLExes\oaSistema.ini');

   ShowMessage('2');
   ConfiguraPaneles(wwForma, wwNCampos);

   ShowMessage('3');
   ConfiguraCombos(wwForma, wwNCampos);

   ShowMessage('4');
   ConfiguraLabels(wwForma, wwNCampos);

   ShowMessage('5');
   ConfiguraGrids(wwForma, wwNCampos);

   ShowMessage('6');
End;

Procedure TFProvision.Detraccion;
Var
   wCont: integer;
   wNewTot: Double;
Begin
   //////////////////////////////////////////////////////////////////////////////
   // variables calculadas para usarla en la Detraccion
// Inicio HPC_201402_CXP
   xImpDtr := FROUND(xTOT * (xDTRPorc / 100.00),15,2); // Importe de Detraccion sobre el Total
// Fin HPC_201402_CXP
   wNewTot := xTOT - xImpDtr; // Importe Total Nuevo
   //////////////////////////////////////////////////////////////////////////////

   wCont := 1;
   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.eof Do
   Begin
      DMCXP.cdsDetCxP.Edit;
      //// esto se realiza por existir Detraccion
      If DMCXP.cdsDetCxP.fieldByName('TIPDET').AsString = 'TO' Then
      Begin
         DMCXP.cdsDetCxP.fieldByName('DCPMOORI').AsFloat := wNewTot;
         xTOT := wNewTot;
         ActualizaMontos;
         DMCXP.cdsDetCxP.fieldByName('DCPMOLOC').AsFloat := xTOTLOC;
         DMCXP.cdsDetCxP.fieldByName('DCPMOEXT').AsFloat := xTOTEXT;
      End;
      ////
      DMCXP.cdsDetCxP.next;
      wCont := wCont + 1;
   End;
   /////////////////////////////////////////////////////////////////////////////
   // Adiciona Registros por la Detraccion
   // el nuevo registro tendra los mismos datos que el registro tipo 'TO', pero
   // con la diferencia en el monto y el TIPDET.
   xSQL := 'SELECT * from TGE113 '
      + 'WHERE TIPDET=' + quotedstr('I4');
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   DMCXP.cdsDetCxP.Append;
   GrabaDet;
   DMCXP.cdsDetCxP.fieldByName('TIPDET').AsString := DMCXP.cdsQry.FieldByName('TIPDET').AsString;
   DMCXP.cdsDetCxP.fieldByName('DCPREG').AsInteger := wCont;
   DMCXP.cdsDetCxP.FieldByName('TREGID').AsString := DMCXP.cdsQry.FieldByName('TREGID').AsString;
   DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := DMCXP.cdsQry.FieldByName('TREGDES').AsString;
   If DMCXP.cdsDetCxP.FieldByname('TMONID').AsString = DMCXP.wTMonLoc Then
   Begin
      DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString := DMCXP.cdsQry.fieldbyname('CPTOMN').AsString;
      DMCXP.cdsDetCxP.FieldByname('CUENTAID').AsString := DMCXP.cdsQry.fieldbyname('CUENTAMN').AsString;
   End
   Else
   Begin
      DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString := DMCXP.cdsQry.fieldbyname('CPTOME').AsString;
      DMCXP.cdsDetCxP.FieldByname('CUENTAID').AsString := DMCXP.cdsQry.fieldbyname('CUENTAME').AsString;
   End;
   DMCXP.cdsDetCxP.FieldByName('DCPDH').ASString := DMCXP.cdsQry.FieldByName('DCPDH').AsString;
   DMCXP.cdsDetCxP.fieldByName('DCPMOORI').AsFloat := xImpDtr;
   xTOT := xImpDtr;
   ActualizaMontos;
   DMCXP.cdsDetCxP.fieldByName('DCPMOLOC').AsFloat := xTOTLOC;
   DMCXP.cdsDetCxP.fieldByName('DCPMOEXT').AsFloat := xTOTEXT;
   /////////////////////////////////////////////////////////////////////////////
End;

Procedure TFProvision.ActualizaMontos;
Begin
   If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc Then
   Begin
      xTOTLOC := xTOT;
      xTOTEXT := FRound(xTOTLOC / DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 15, 2);
   End
   Else
   Begin
      If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonExt Then
      Begin
         xTOTEXT := xTOT;
         xTOTLOC := FRound(xTOT * DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 15, 2);
      End
      Else
      Begin // Otras Monedas Extranjeras
      End;
   End;

End;

Procedure TFProvision.dtpFecDetExit(Sender: TObject);
Begin
   If dtpFecDet.Date = 0 Then Exit;
// Inicio HPC_201406_CXP
{
   If dtpFecDet.Date < dtpFEmis.date Then
   Begin
      ShowMessage('Fecha de Deposito de Detracción no puede ser menor a la fecha de comprobante...');
      dtpFecDet.SetFocus;
   End;
}
// Fin HPC_201406_CXP
End;

Procedure TFProvision.bbtnGrabaDetClick(Sender: TObject);
Begin

   If dtpFecDet.Date = 0 Then
   Begin
      ShowMessage('Falta ingresar Fecha de deposito de la Detracción');
      dtpFecDet.SetFocus;
      Exit;
   End;

// Inicio HPC_201406_CXP
{
   If dtpFecDet.Date < dtpFEmis.date Then
   Begin
      ShowMessage('Fecha de Deposito de Detracción no puede ser menor a la fecha de comprobante...');
      dtpFecDet.SetFocus;
      Exit;
   End;
}
// Fin HPC_201406_CXP

   If dbeNumDet.Text = '' Then
   Begin
      ShowMessage('Falta ingresar Número de Constancia de deposito de la Detracción');
      dtpFecDet.SetFocus;
      Exit;
   End;

   If MessageDlg('Grabar Constancia de deposito de Detracción' + chr(13) +
      '              ¿ Esta Seguro ?     ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      exit;
// Inicio HPC_201406_CXP

   //DMCXP.cdsMovCxP.Edit;
   //DMCXP.cdsMovCxP.post;
   //if DMCXP.cdsMovCxP.ApplyUpdates(0)>0 then
   //begin
   //   ShowMessage('No se pudo actualizar la cabecera de la provisión - 2');
   //   exit;
   //end;
 // Inicio HPC_201407_CXP
 // Se añade Usuario, Fecha y Hora de actualización
    xSQL := ' Update CXP301 '
          + '    Set NUMDEPDET = '+quotedstr(DMCXP.cdsMovCxP.fieldbyname('NUMDEPDET').AsString)+','
          + '        FECDEPDET = '+quotedstr(datetostr(DMCXP.cdsMovCxP.fieldbyname('FECDEPDET').AsDatetime))+','
          + '        CPUSER = '+quotedstr(DMCXP.wUsuario)+', '
          + '        CPFREG = trunc(sysdate), '
          + '        CPHREG = sysdate '
          + '  Where CIAID = '+quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
          + '    and TDIARID = '+quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString)
          + '    and CPANOMES = '+quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
          + '    and CPNOREG = '+quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString);
 // Fin HPC_201407_CXP
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se puede Eliminar Constancia de Depósito');
      exit;
   End;
// Fin HPC_201406_CXP

   EstadoDeDetraccion;

   ShowMessage('Grabo Constancia de Detracción - Ok');

End;

Procedure TFProvision.EstadoDeDetraccion;
Begin
   If dbeNumDet.Text <> '' Then
   Begin
      dbeNumDet.Enabled := False;
      dtpFecDet.Enabled := False;
      bbtnGrabaDet.Enabled := False;
      bbtnEliminaDet.Enabled := True;
   End
   Else
   Begin
      dbeNumDet.Enabled := True;
      dtpFecDet.Enabled := True;
      bbtnGrabaDet.Enabled := True;
      bbtnEliminaDet.Enabled := False;
   End;
End;

Procedure TFProvision.EstadoDeSunat;
Begin
   If (dblcTipoD.Text <> '') And (dblcOperD.Text <> '') Then
   Begin
      dblcTipoD.Enabled := False;
      dblcOperD.Enabled := False;
      bbtnGrabSut.Enabled := False;
      bbtnElimSun.Enabled := True;
   End
   Else
   Begin
      dblcTipoD.Enabled := True;
      dblcOperD.Enabled := True;
      bbtnGrabSut.Enabled := True;
      bbtnElimSun.Enabled := False;
   End;
End;

Procedure TFProvision.TabSheet3Enter(Sender: TObject);
Begin
   EstadoDeDetraccion;
End;

Procedure TFProvision.bbtnEliminaDetClick(Sender: TObject);
Begin
   If MessageDlg('Eliminar Constancia de deposito de Detracción' + chr(13) +
      '            ¿ Esta Seguro ?     ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      exit;

   DMCXP.cdsMovCxP.Edit;
   DMCXP.cdsMovCxP.FieldByName('NUMDEPDET').AsString := '';
   DMCXP.cdsMovCxP.FieldByName('FECDEPDET').AsDateTime := 0;
// Inicio HPC_201407_CXP
// Añade Usuario, Fecha y Hora de Actualización

   xSQL := ' Update CXP301 '
         + '    SET NUMDEPDET ='''','
         + '        FECDEPDET =null, '
         + '        CPUSER = '+quotedstr(DMCXP.wUsuario)+', '
         + '        CPFREG = trunc(sysdate), '
         + '        CPHREG = sysdate '
         + '  Where CIAID = ' +quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
         + '    and TDIARID = ' +quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString)
         + '    and CPANOMES = ' +quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
         + '    and CPNOREG = ' +quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString);
// Fin HPC_201407_CXP

   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se puede Eliminar Constancia de Depósito');
      exit;
   End;
   //if DMCXP.cdsMovCxP.ApplyUpdates(0)>0 then
   //begin
   //   ShowMessage('No se pudo actualizar la cabecera de la provisión - 3');
   //   exit;
   //end;
// Fin HPC_201406_CXP
   EstadoDeDetraccion;
   ShowMessage('Grabo Constancia de Detracción - Ok');

End;

Procedure TFProvision.PageControl1Change(Sender: TObject);
Begin
   If PageControl1.ActivePageIndex = 2 Then
   Begin
      EstadoDeDetraccion;
      dblcTipoDExit(Self);
      dblcOperDExit(self);
      EstadoDeSunat;
   End;
End;

Procedure TFProvision.bbtnTRClick(Sender: TObject);
Begin

   If (DMCXP.cdsDetCxP.fieldByName('TIPDET').AsString = 'TO') Then
   Begin
      ShowMessage('No se puede cambiar el Total del Documento');
      Exit;
   End;
   Try
      FTipoReg := TFTipoReg.Create(Self); // CXP250.pas
      FTipoReg.ShowModal;
   Finally
      RecalculaTotales;
      FTipoReg.Free;
   End;
End;

Procedure TFProvision.bbtnSRClick(Sender: TObject);
Begin

   If DMCXP.cdsMovCxP.fieldbyname('CPPAGORI').AsFloat <> 0 Then
   Begin
      ShowMessage('No se puede cambiar estado de Retención. Porque existe un pago realizado');
      Exit;
   End;

   If cbSujetoaRetIGV.Checked Then
   Begin
      If MessageDlg('Documento esta marcado para Retención del IGV' + chr(13)
         + '      ¿Desea cambiar Situación?      ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMCXP.cdsMovCxP.Edit;
         DMCXP.cdsMovCxP.fieldbyname('PROVRETIGV').AsString := 'N';
// Inicio HPC_201406_CXP
         //DMCXP.cdsMovCxP.post;
         //if DMCXP.cdsMovCxP.ApplyUpdates(0)>0 then
         //begin
         //   ShowMessage('No se pudo actualizar la cabecera de la provisión - 4');
         //   exit;
         //end;

      // Inicio HPC_201407_CXP
      // Se cambia de cdsDetCxP a cdsMovCxP
      // Añade Usuario, Fecha y Hora de Actualización
         DMCXP.cdsMovCxP.post;
         xSQL := ' Update CXP301 '
               + '    set PROVRETIGV = ' +quotedstr(DMCXP.cdsMovCxP.fieldbyname('PROVRETIGV').AsString)+','
               + '        CPUSER = '+quotedstr(DMCXP.wUsuario)+', '
               + '        CPFREG = trunc(sysdate), '
               + '        CPHREG = sysdate '
               + '  Where CIAID = ' +quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
               + '    and TDIARID = ' +quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString)
               + '    and CPANOMES = ' +quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
               + '    and CPNOREG = ' +quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString);
      // Fin HPC_201407_CXP
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo actualizar la cabecera de la provisión para retención');
            exit;
         End;
// Fin HPC_201406_CXP

         lblRetIGV.Visible := False;
         cbSujetoaRetIGV.Checked := False;
         cbSujetoaRetIGV.Visible := False;
      End;
   End
   Else
   Begin
   // Inicio HPC_201406_CXP
      xSQL :=  'CLAUXID='+quotedstr(dblcClAux.Text) + ' and PROV='+quotedstr(dblcdProv.Text);
      if BuscaQry('dspTGE', 'TGE201', 'PROVRETIGV', xSQL, 'PROVRETIGV')='N' then
      begin
         ShowMessage('Al proveedor no se le puede marcar para generar Retención de IGV');
         exit;
      end;

      If MessageDlg('Documento No esta marcado para generar Retención del IGV' + chr(13)
         + '      ¿Desea cambiar Situación?      ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMCXP.cdsMovCxP.Edit;
         DMCXP.cdsMovCxP.fieldbyname('PROVRETIGV').AsString := 'S';
      // Inicio HPC_201407_CXP
      // Se incluye el Post a la actualización virtual del Registro
      // Añade Usuario, Fecha y Hora de Actualización
         DMCXP.cdsMovCxP.post;
         //if DMCXP.cdsMovCxP.ApplyUpdates(0)>0 then
         //begin
         //   ShowMessage('No se pudo actualizar la cabecera de la provisión - 5');
         //   exit;
         //end;

         xSQL := ' Update CXP301 '
               + '    set PROVRETIGV = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('PROVRETIGV').AsString)+','
               + '        CPUSER = '+quotedstr(DMCXP.wUsuario)+', '
               + '        CPFREG = trunc(sysdate), '
               + '        CPHREG = sysdate '
               + '  Where CIAID=' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
               + '    and TDIARID=' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString)
               + '    and CPANOMES=' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
               + '    and CPNOREG=' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString);
      // Fin HPC_201407_CXP
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo actualizar la cabecera de la provisión para retención');
            exit;
         End;
         ShowMessage('Se ha marcado la provisión para generar Retención de IGV con éxito');
// Fin HPC_201406_CXP

         lblRetIGV.Visible := True;
         lblRetIGV.Font.Color := clRed;
         cbSujetoaRetIGV.Checked := True;
         cbSujetoaRetIGV.Visible := True;
      End;
   End;
End;

Procedure TFProvision.RecalculaTotales;
Var
   xSQL: String;
   xcpgravad, xcpgravad2, xcpigv, xcpigv2, xcpdcto, xcpnograv, xcpmtoori,
      xcp_otros, xadq_no_grav, xigv_gra_no_dest, xCPSERVIC, xCPISC: double;
   x_comprobante: String;
Begin
   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.First;
   xcpgravad := 0;
   xcpgravad2 := 0;
   xcpigv := 0;
   xcpigv2 := 0;
   xcpdcto := 0;
   xcpnograv := 0;
   xcpmtoori := 0;
   xcp_otros := 0;
   xadq_no_grav := 0;
   xigv_gra_no_dest := 0;
   xcpigv2 := 0;
   xCPISC := 0;
   xCPSERVIC := 0;
   While Not DMCXP.cdsDetCxP.EOF Do
   Begin
      // Inicia HPC_201405_CXP
      If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MG') or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'BI') Then
      // Fin HPC_201405_CXP
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpgravad := xcpgravad + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpgravad := xcpgravad - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'NG' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpgravad2 := xcpgravad2 + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpgravad2 := xcpgravad2 - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I1' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpigv := xcpigv + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpigv := xcpigv - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I3' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpigv2 := xcpigv2 + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpigv2 := xcpigv2 - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'DC' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpdcto := xcpdcto + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpdcto := xcpdcto - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MN' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpnograv := xcpnograv + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpnograv := xcpnograv - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'TO') Or
         (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I4') Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpmtoori := xcpmtoori + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpmtoori := xcpmtoori - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'OT' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcp_otros := xcp_otros + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcp_otros := xcp_otros - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'AN' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xadq_no_grav := xadq_no_grav + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xadq_no_grav := xadq_no_grav - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I2' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xigv_gra_no_dest := xigv_gra_no_dest + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xigv_gra_no_dest := xigv_gra_no_dest - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I5' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpISC := xcpISC + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpISC := xcpISC - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      xCPSERVIC := 0;

      DMCXP.cdsDetCxP.Next;
   End;
   DMCXP.cdsDetCxP.EnableControls;

   If xCPGRAVAD < 0 Then xCPGRAVAD := xCPGRAVAD * -1;
   If xcpgravad2 < 0 Then xcpgravad2 := xcpgravad2 * -1;
   If xcpigv < 0 Then xcpigv := xcpigv * -1;
   If xcpigv2 < 0 Then xcpigv2 := xcpigv2 * -1;
   If xcpdcto < 0 Then xcpdcto := xcpdcto * -1;
   If xcpnograv < 0 Then xcpnograv := xcpnograv * -1;
   If xcpmtoori < 0 Then xcpmtoori := xcpmtoori * -1;
   If xcp_otros < 0 Then xcp_otros := xcp_otros * -1;
   If xadq_no_grav < 0 Then xadq_no_grav := xadq_no_grav * -1;
   If xigv_gra_no_dest < 0 Then xigv_gra_no_dest := xigv_gra_no_dest * -1;
   If xcpigv2 < 0 Then xcpigv2 := xcpigv2 * -1;
   If xCPISC < 0 Then xCPISC := xCPISC * -1;
   If xCPSERVIC < 0 Then xCPSERVIC := xCPSERVIC * -1;

   //actualizando la cabecera
   DMCXP.cdsMovCxP.Edit;
   DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat := xCPGRAVAD;
   DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD2').AsFloat := xcpgravad2;
   DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat := xcpigv;
   DMCXP.cdsMovCxP.fieldbyname('CPIGV2').AsFloat := xcpigv2;
   DMCXP.cdsMovCxP.fieldbyname('CPDCTO').AsFloat := xcpdcto;
   DMCXP.cdsMovCxP.fieldbyname('CPNOGRAV').AsFloat := xcpnograv;
   DMCXP.cdsMovCxP.fieldbyname('CP_OTROS').AsFloat := xcp_otros;
   DMCXP.cdsMovCxP.fieldbyname('ADQ_NO_GRAV').AsFloat := xadq_no_grav;
   DMCXP.cdsMovCxP.fieldbyname('IGV_GRA_NO_DEST').AsFloat := xigv_gra_no_dest;
   DMCXP.cdsMovCxP.fieldbyname('CPISC').AsFloat := xCPISC;
   DMCXP.cdsMovCxP.fieldbyname('CPSERVIC').AsFloat := xCPSERVIC;
   DMCXP.cdsMovCxP.fieldbyname('CPHREG').AsDateTime := Date + Time; // Hora de Registro de Usuario

   Begin
      DMCXP.cdsMovCxP.fieldbyname('CPMTOORI').AsFloat := xcpmtoori;
      DMCXP.cdsMovCxP.fieldbyname('CPSALORI').AsFloat := xcpmtoori; // Saldo en moneda Local
      If DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString = DMCXP.wTMonLoc Then
      Begin
         DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat := xcpmtoori; // Total en moneda local
         DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat := FRound(xcpmtoori / FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2); // Total en moneda extranjera
         DMCXP.cdsMovCxP.fieldbyname('CPSALLOC').AsFloat := xcpmtoori; // Saldo en moneda Local
         DMCXP.cdsMovCxP.fieldbyname('CPSALEXT').AsFloat := FRound(xcpmtoori / FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2); // Saldo en moneda extranjera
      End
      Else
      Begin
         If DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString = DMCXP.wTMonExt Then
         Begin
            DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat := xTotalL; // Total en moneda local
            DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat := xcpmtoori; // Total en moneda extranjera
            DMCXP.cdsMovCxP.fieldbyname('CPSALLOC').AsFloat := xTotalL; // Saldo en moneda Local
            DMCXP.cdsMovCxP.fieldbyname('CPSALEXT').AsFloat := xcpmtoori; // Saldo en moneda extranjera
         End;
      End;
   End;
// Inicio HPC_201406_CXP
   {
   if DMCXP.cdsMovCxP.ApplyUpdates(0)>0 then                 // 1
   begin
      ShowMessage('No se pudo actualizar la cabecera de la provisión - 6');
      exit;
   end;
   }

// Inicio HPC_201407_CXP
// Añade Usuario, Fecha y Hora de Actualización
   xSQL := ' Update CXP301 '
         + '    set CPGRAVAD = '       + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat)+','
         + '        CPGRAVAD2 = '      + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD2').AsFloat)+','
         + '        CPIGV = '          + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat)+','
         + '        CPIGV2 = '         + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPIGV2').AsFloat)+','
         + '        CPDCTO = '         + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPDCTO').AsFloat)+','
         + '        CPNOGRAV = '       + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPNOGRAV').AsFloat)+','
         + '        CP_OTROS = '       + floattostr(DMCXP.cdsMovCxP.fieldbyname('CP_OTROS').AsFloat)+','
         + '        ADQ_NO_GRAV = '    + floattostr(DMCXP.cdsMovCxP.fieldbyname('ADQ_NO_GRAV').AsFloat)+','
         + '        IGV_GRA_NO_DEST = '+ floattostr(DMCXP.cdsMovCxP.fieldbyname('IGV_GRA_NO_DEST').AsFloat)+','
         + '        CPISC ='           + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPISC').AsFloat)+','
         + '        CPSERVIC = '       + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPSERVIC').AsFloat)+','
         + '        CPMTOORI = '       + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPMTOORI').AsFloat)+','
         + '        CPSALORI = '       + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPSALORI').AsFloat)+','
         + '        CPMTOLOC = '       + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat)+','
         + '        CPMTOEXT = '       + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat)+','
         + '        CPSALLOC = '       + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPSALLOC').AsFloat)+','
         + '        CPSALEXT = '       + floattostr(DMCXP.cdsMovCxP.fieldbyname('CPSALEXT').AsFloat)+','
         + '        CPUSER = '+quotedstr(DMCXP.wUsuario)+', '
         + '        CPFREG = trunc(sysdate), '
         + '        CPHREG = sysdate '
         + '  Where CIAID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
         + '    and TDIARID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString)
         + '    and CPANOMES = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
         + '    and CPNOREG = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString);
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      wSigueGrab := False;
      ShowMessage('No se puede grabar la cabecera de la Provisión');
      exit;
   End;
// Fin HPC_201407_CXP
End;

Procedure TFProvision.CopiaRegistro(xCds_fuente, xCds_destino: TwwClientDataSet);
Var
   x: Integer;
Begin
   xCds_destino.Append;
   For x := 0 To DMCXP.cdsDetCxP.FieldCount - 1 Do
   Begin
      xCds_destino.FieldByName(xCds_fuente.Fields[x].DisplayName).Value
         := xCds_fuente.Fields[x].Value;
   End;
End;

Procedure TFProvision.ImpuestoReg06(xTipoRegistro, xTipoDetalle: String);
Var

   xIGVParcial: double;
Begin
   xIGVParcial := 0;
   DMCXP.cdsDetCxP2.First;

   While Not DMCXP.cdsDetCxP2.Eof Do
   Begin

      numreg := numreg + 1;

      CopiaRegistro(DMCXP.cdsDetCxP2, DMCXP.cdsDetCxP);

      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString := DMCXP.cdsDetCxP2.FieldByName('DCPDH').AsString;
      DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat := FRound((DMCXP.cdsDetCxP2.FieldByname('DCPMOORI').AsFloat) * wTasa, 15, 2);
      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound((DMCXP.cdsDetCxP2.FieldByName('DCPMOLOC').AsFloat) * wTasa, 15, 2);
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound((DMCXP.cdsDetCxP2.FieldByName('DCPMOEXT').AsFloat) * wTasa, 15, 2);
      DMCXP.cdsDetCxP.FieldByname('TREGID').AsString := xTipoRegistro;
      DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString := xTipoDetalle;
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger := numreg;
      xIGVParcial := xIGVParcial + DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat;
      DMCXP.cdsDetCxP2.Next;
   End;
   If xIGV <> xIGVParcial Then
   Begin
      xIGVParcial := xIGV - xIGVParcial;
      DMCXP.cdsDetCxP2.Edit;
      DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat := DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat + xIGVParcial;
      If DMCXP.cdsMovCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc Then
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat + xIGVParcial
      Else
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat + xIGVParcial;

   End;
End;

Procedure TFProvision.bbtnDetClick(Sender: TObject);
Begin
   Try
      FDetrac := TFDetrac.Create(Self);
      FDetrac.ShowModal;
   Finally
      FDetrac.Free;
   End;

End;

Function TFProvision.ValidaDetraccion(xCds_detdocumento: TwwClientDataSet): String;
Var
   xResultado: String;
   xFlag: integer;
   xPorcDetraccion, xPorcDetraccion_Ant: double;
   xConcepto, xConcepto_Ant: String;
   xTipDet: String;
Begin
   xSQL := ' select * '
      + ' from CXP201 A '
      + ' where exists ( select CUENTAID '
      + '                from TGE202 B '
      + '                where B.CUENTAID=A.CUENTAID and B.CTAACT=''S'' '
      + '                  and CTA_MOV=' + quotedstr('S') + ') '
      + '   and A.DTRPORC > 0 '
      + ' order by A.CPTOID';
   DMCXP.cdsQry16.Close;
   DMCXP.cdsQry16.DataRequest(xSQL);
   DMCXP.cdsQry16.Open;

   xFlag := 0;
   xPorcDetraccion_Ant := 0;
   xResultado := '';
   xCds_detdocumento.first;
   While Not xCds_detdocumento.Eof Do
   Begin
    //verifico si el concepto tiene detracción
      xTipDet := xCds_detdocumento.fieldbyname('TIPDET').AsString;
      // Inicia HPC_201405_CXP
      If (xTipDet = 'MN') Or (xTipDet = 'NG') Or (xTipDet = 'MG') Or (xTipDet = 'BI') Or (xTipDet = 'AN') Then
      // Fin HPC_201405_CXP
      Begin
         If DMCXP.cdsQry16.Locate('CPTOID', xCds_detdocumento.fieldbyname('CPTOID').AsString, [loCaseInsensitive]) Then
         Begin
            xFlag := xFlag + 1;
            xPorcDetraccion := DMCXP.cdsQry16.fieldbyname('DTRPORC').AsFloat;
            xConcepto := xCds_detdocumento.fieldbyname('CPTOID').AsString;
            If (xPorcDetraccion <> xPorcDetraccion_Ant) And (xFlag > 1) Then
            Begin
               xResultado := xConcepto + '-->' + floatToStr(xPorcDetraccion) + '% ' + chr(13)
                  + xConcepto_Ant + '-->' + floatToStr(xPorcDetraccion_Ant) + '% ' + chr(13)
                  + 'Los Porcentajes de Detracción son distintos';
            End;
            xPorcDetraccion_Ant := xPorcDetraccion;
            xConcepto_Ant := xConcepto;
         End;
      End;
      xCds_detdocumento.Next;
   End;

   If xFlag > 0 Then
   Begin
      xCds_detdocumento.first;
      If Not xCds_detdocumento.Locate('TREGID', '13', [loCaseInsensitive]) Then
      Begin
         xResultado := xResultado + chr(13) + chr(13) + 'Debe Ingresar el tipo de registro (13-DETRACCION)';
      End;
   End;

   xCds_detdocumento.first;
   If xCds_detdocumento.Locate('TREGID', '13', [loCaseInsensitive]) And (xFlag = 0) Then
   Begin
      xResultado := xResultado + chr(13)
         + 'Existe un registro Tipo (13-DETRACCION) pero ' + chr(13)
         + 'El concepto de la Base Imponible no tiene Detracción';
   End;
   Result := xResultado;
End;

Procedure TFProvision.botonOrdenPago(pCiaid, pProveedor: String);
Begin
   xSQL := ' SELECT LOG130.NUMORDPAG, ' +
      ' LOG130.ODCCIAID, ' +
      ' LOG130.ODCID, ' +
      ' LOG130.CPCIAID, ' +
      ' LOG130.DOCID, ' +
      ' TGE110.DOCDES  DOCID_DES ,   ' +
      ' LOG130.TMONID,   ' +
      // Inicio HPC_201702_CXP
      // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
      ' LPAD(LOG130.CPSERIE,4,''0'') CPSERIE,   ' +
      ' trunc(sysdate) CPFCMPRB, ' +
      // Fin HPC_201702_CXP
      ' LOG130.CPNODOC,   ' +
      ' LOG130.CPFEMIS,   ' +
      ' LOG130.CPFRECEP,   ' +
      ' LOG130.CPFVCMTO,   ' +
      // Inicio HPC_201702_CXP
      // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra+
       ' LOG130.TOTAL,   '+      
       ' LOG130.BASIMP,   '+
       ' LOG130.IGV,   '+
      // Fin HPC_201702_CXP
// Inicio HPC_201803_CXP
// Se implemento debido a la solicitud de Orden de Pago
      ' LOG130.ITEM,   ' +
      ' LOG130.CIAID,  ' +
      ' LOG130.CCOSID  ' +
// Fin HPC_201803_CXP
      ' FROM LOG130 , TGE110  ' +
      ' WHERE TGE110.DOCID = LOG130.DOCID ' +
      ' AND TGE110.DOCMOD = ' + QuotedStr('CXP') +
      ' AND NVL(LOG130.CPESTTRA,' + QuotedStr('X') + ') = ' + QuotedStr('ACEPTADO') +
      ' AND LOG130.PROV = ' + QuotedStr(pProveedor);

   DMCXP.cdsQry1.Close;
   DMCXP.cdsQry1.DataRequest(xSQL);
   DMCXP.cdsQry1.Open;

   If DMCXP.cdsQry1.RecordCount > 0 Then
   Begin
      Btn_OrdenPago.Enabled := True;
      lbl_DocsOrdenPago.Enabled := True;
   End
   Else
   Begin
      Btn_OrdenPago.Enabled := False;
      lbl_DocsOrdenPago.Enabled := False;
   End;
End;

Procedure TFProvision.Btn_OrdenPagoClick(Sender: TObject);
Begin
   Try
      FListaOrdenPago := TFListaOrdenPago.Create(Self); // CXP130.pas
      FListaOrdenPago.ShowModal;
   Finally
      FListaOrdenPago.Free;
   End;
End;
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
Function TFProvision.ValidaTotalOrdPago(pOrdenPago: String; wgItemOP: Integer; pTotal: Double): Boolean;
Var
   xsCompaniaOPago: String;
Begin
   xTotalOrdenPago := 0;
   If pOrdenPago = '' Then
   Begin
      Result := True;
      Exit;
   End;
(*
   If dblcCia.Text = '04' Then
   Begin
      xsCompaniaOPago := dblcCia.Text;
   End
   Else
   Begin
      xsCompaniaOPago := '02';
   End;
*) 
   xSQL := ' select ciaid, numordpag, odcciaid, odcid, prov, cpciaid, cpanomes, tdiarid, cpnoreg, docid, cpserie, cpnodoc, cpfrecep, cpfemis, cpfvcmto, cpobs, tmonid, cptcampr, '
         + ' basimp, igv, total, cpesttra, cpfectra, cpusutra, obsanu, usuanu, fecanu, usureg, fecreg, usumod, fecmod, item, bancoid, bancotmonid, banconumcta, bancocci, ccosid '
         + '  from LOG130 '
         + ' Where PROV=' + quotedstr(dblcdProv.Text)
         + '   and ODCID=' + quotedstr(dblcdOCompra.Text)
         + '   AND NUMORDPAG = ' + QuotedStr(xOrdenPago)
         + '   AND ITEM = ' + IntToStr(wgItemOP);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.FieldByname('ciaid').AsString <> '' Then
   Begin
         xsCompaniaOPago := DMCXP.cdsQry.FieldByname('ciaid').AsString;
   End;
   xSQL := ' SELECT LOG130.TOTAL FROM LOG130 '
         + ' WHERE LOG130.PROV=' + quotedstr(dblcdProv.Text)
         + ' AND LOG130.NUMORDPAG = ' + QuotedStr(pOrdenPago)
         + ' AND LOG130.ITEM = ' + IntToStr(wgItemOP)
         + ' AND LOG130.ODCID = ' + QuotedStr(dblcdOCompra.Text);

   DMCXP.cdsQry2.Close;
   DMCXP.cdsQry2.DataRequest(xSQL);
   DMCXP.cdsQry2.Open;
   xTotalOrdenPago := StrToFloat(DMCXP.cdsQry2.fieldbyname('TOTAL').AsString);
   If Abs(StrToFloat(DMCXP.cdsQry2.fieldbyname('TOTAL').AsString) - pTotal) > 0.1 Then
   Begin
      Result := False;
      Exit;
   End;
   Result := True;

End;
// Fin HPC_201803_CXP
Procedure TFProvision.ActualizaOrdenPago(pEvento: String);
Var
   xsCompaniaOPago: String;
Begin
   If xOrdenPago = '' Then Exit;
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
   xSQL := ' select ciaid, numordpag, odcciaid, odcid, prov, cpciaid, cpanomes, tdiarid, cpnoreg, docid, cpserie, cpnodoc, cpfrecep, cpfemis, cpfvcmto, cpobs, tmonid, cptcampr, '
               + ' basimp, igv, total, cpesttra, cpfectra, cpusutra, obsanu, usuanu, fecanu, usureg, fecreg, usumod, fecmod, item, bancoid, bancotmonid, banconumcta, bancocci, ccosid '
               + '  from LOG130 '
               + ' Where LOG130.PROV=' + quotedstr(dblcdProv.Text)
               + '   and LOG130.ODCID=' + quotedstr(dblcdOCompra.Text)
               + '   AND LOG130.ITEM = ' + IntToStr(xnItemOP)
               + '   AND LOG130.NUMORDPAG = ' + QuotedStr(xOrdenPago);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.FieldByname('odcciaid').AsString <> '' Then
   Begin
      xsCompaniaOPago := DMCXP.cdsQry.FieldByname('odcciaid').AsString;
   End;
(*
   If dblcCia.Text = '04' Then
   Begin
      xsCompaniaOPago := dblcCia.Text;
   End
   Else
   Begin
      xsCompaniaOPago := '02';
   End;
*)
   If pEvento = 'ACEPTAR' Then
   Begin
      xSQL := ' UPDATE LOG130 SET LOG130.CPESTTRA = ' + QuotedStr('PROVISIONADO') + ', ' +
         ' LOG130.CPCIAID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString) + ', ' +
         ' LOG130.DOCID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('DOCID').AsString) + ', ' +
         ' LOG130.CPSERIE = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString) + ', ' +
         ' LOG130.CPNODOC = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CPNODOC').AsString) + ', ' +
         ' LOG130.CPFRECEP = TO_DATE(' + QuotedStr(datetostr(dtpFRecep.Date)) + ',' + quotedStr('DD/MM/YYYY') + '), ' +
         ' LOG130.CPFEMIS = TO_DATE(' + QuotedStr(datetostr(dtpFEmis.Date)) + ',' + quotedStr('DD/MM/YYYY') + '), ' +
         ' LOG130.TMONID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString) + ', ' +
         ' LOG130.CPFECTRA = sysdate, ' +
         ' LOG130.CPUSUTRA = ' + QuotedStr(DMCXP.wUsuario) + ', ' +
         ' LOG130.CPANOMES = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString) + ', ' +
         ' LOG130.TDIARID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString) + ', ' +
         ' LOG130.CPNOREG = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString) + ', ' +
         ' LOG130.USUMOD = ' + QuotedStr(DMCXP.wUsuario) + ', ' +
         ' LOG130.FECMOD = sysdate ' +
         ' Where LOG130.PROV=' + quotedstr(dblcdProv.Text) +
         '   and LOG130.ODCID=' + quotedstr(dblcdOCompra.Text) +
         '   AND LOG130.ITEM = ' + IntToStr(xnItemOP) +
         '   AND LOG130.NUMORDPAG = ' + QuotedStr(xOrdenPago);
   End;
   If pEvento = 'ACEPTARX' Then
   Begin
      xSQL := ' UPDATE LOG130 SET LOG130.CPESTTRA = ' + QuotedStr('PROVISIONADO') + ', ' +
         ' LOG130.CPCIAID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString) + ', ' +
         ' LOG130.CPFECTRA = sysdate, ' +
         ' LOG130.CPUSUTRA = ' + QuotedStr(DMCXP.wUsuario) + ', ' +
         ' LOG130.CPANOMES = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString) + ', ' +
         ' LOG130.TDIARID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString) + ', ' +
         ' LOG130.CPNOREG = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString) + ', ' +
         ' LOG130.USUMOD = ' + QuotedStr(DMCXP.wUsuario) + ', ' +
         ' LOG130.FECMOD = sysdate ' +
         ' Where LOG130.PROV=' + quotedstr(dblcdProv.Text) +
         '   and LOG130.ODCID=' + quotedstr(dblcdOCompra.Text) +
         '   AND LOG130.ITEM = ' + IntToStr(xnItemOP) +
         '   AND LOG130.NUMORDPAG = ' + QuotedStr(xOrdenPago);
   End;
   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   If (pEvento = 'ELIMINAR') Then
   // Fin HPC_201702_CXP
   Begin
   // revirtiendo el saldo de la Orden de Compra
      xSQL := ' UPDATE LOG304 SET   ODCTIMPAMOR = ODCTIMPAMOR - NVL((SELECT LOG130.TOTAL FROM LOG130 ' +
         ' WHERE LOG130.ODCCIAID = LOG304.CIAID ' +
         ' AND LOG130.PROV = LOG304.PROV ' +
         ' AND LOG130.ODCID = LOG304.ODCID ' +
         ' AND LOG130.CPCIAID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString) +
         ' AND LOG130.CPANOMES = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString) +
         ' AND LOG130.TDIARID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString) +
         ' AND LOG130.CPNOREG = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString) + '  ),0) ' +
         ' WHERE CIAID = ' + QuotedStr(xsCompaniaOPago) +
         ' AND PROV = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('PROV').AsString) +
         ' AND ODCID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CPOCOMP').AsString);
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

      xSQL := ' UPDATE LOG130 SET LOG130.CPESTTRA = ' + QuotedStr('ACEPTADO') + ', ' +
         ' LOG130.CPCIAID =  NULL, ' +
         ' LOG130.CPFECTRA = NULL, ' +
         ' LOG130.CPUSUTRA = NULL,' +
         ' LOG130.CPANOMES = NULL, ' +
         ' LOG130.TDIARID = NULL, ' +
         ' LOG130.CPNOREG = NULL, ' +
         ' LOG130.USUMOD = ' + QuotedStr(DMCXP.wUsuario) + ', ' +
         ' LOG130.FECMOD = sysdate ' +
         ' WHERE LOG130.CPCIAID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString) +
         '   AND LOG130.ODCID=' + quotedstr(dblcdOCompra.Text) +
         '   AND LOG130.NUMORDPAG = ' + QuotedStr(xOrdenPago) +
         '   AND LOG130.ITEM = ' + IntToStr(xnItemOP);
   End;
   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   If (pEvento = 'ANULAR') Then
   Begin
   // revirtiendo el saldo de la Orden de Compra
      xSQL := ' UPDATE LOG304 SET   ODCTIMPAMOR = ODCTIMPAMOR - NVL((SELECT LOG130.TOTAL FROM LOG130 ' +
         ' WHERE LOG130.ODCCIAID = LOG304.CIAID ' +
         ' AND LOG130.PROV = LOG304.PROV ' +
         ' AND LOG130.ODCID = LOG304.ODCID ' +
         ' AND LOG130.CPCIAID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString) +
         ' AND LOG130.CPANOMES = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString) +
         ' AND LOG130.TDIARID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString) +
         ' AND LOG130.CPNOREG = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString) + '  ),0) ' +
         ' WHERE CIAID = ' + QuotedStr(xsCompaniaOPago) +
         ' AND PROV = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('PROV').AsString) +
         ' AND ODCID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CPOCOMP').AsString);
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

      xSQL := ' UPDATE LOG130 SET LOG130.CPESTTRA = ' + QuotedStr('ANULADO') + ', ' +
         ' LOG130.CPCIAID = NULL, ' +
         ' LOG130.CPFECTRA = NULL, ' +
         ' LOG130.CPUSUTRA = NULL,' +
         ' LOG130.CPANOMES = NULL, ' +
         ' LOG130.TDIARID = NULL, ' +
         ' LOG130.CPNOREG = NULL, ' +
         ' LOG130.USUMOD = ' + QuotedStr(DMCXP.wUsuario) + ', ' +
         ' LOG130.FECMOD = sysdate ' +
         ' WHERE LOG130.CPCIAID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString) +
         '   AND LOG130.ODCID=' + quotedstr(dblcdOCompra.Text) +
         '   AND LOG130.NUMORDPAG = ' + QuotedStr(xOrdenPago) +
         '   AND LOG130.ITEM = ' + IntToStr(xnItemOP);
   End;
   // Fin HPC_201702_CXP
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
// Fin HPC_201803_CXP
End;

Procedure TFProvision.ObtenerNumOrdenPago;
Begin
   xSQL := ' SELECT LOG130.NUMORDPAG, LOG130.ITEM  FROM LOG130 ' +
      ' WHERE LOG130.CPCIAID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString) +
      ' AND LOG130.PROV = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('PROV').AsString) +
      ' AND LOG130.DOCID = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('DOCID').AsString) +
      ' AND LOG130.CPSERIE = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString) +
      ' AND LOG130.CPNODOC = ' + QuotedStr(DMCXP.cdsMovCxP.fieldbyname('CPNODOC').AsString);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount > 0 Then
   Begin
      xOrdenPago := DMCXP.cdsQry.fieldbyname('NUMORDPAG').AsString;
      xnItemOP := DMCXP.cdsQry.fieldbyname('ITEM').AsInteger;
   End
   Else
   Begin
      xOrdenPago := '';
   End;
End;

Procedure TFProvision.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFProvision.dblcTipoDNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFProvision.dblcOperDNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFProvision.dblcTipoDExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CPTODETRSUNATID=' + quotedstr(dblcTipoD.Text);
   edtTipoD.Text := BuscaQry('dspTGE', 'CXP_DETR_SUNAT', '*', xWhere, 'CPTODETRSUNATDES');
End;

Procedure TFProvision.dblcOperDExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'TIPOOPERSUNATID=' + quotedstr(dblcOperD.Text);
   edtOperD.Text := BuscaQry('dspTGE', 'CXP_TIP_OPER_SUNAT', '*', xWhere, 'TIPOOPERSUNATDES');
End;

Procedure TFProvision.bbtnGrabSutClick(Sender: TObject);
Begin
   If edtTipoD.Text = '' Then
   Begin
      ShowMessage('Falta ingresar Código de bienes o servicios sujetos de Detracción');
      dblcTipoD.SetFocus;
      Exit;
   End;

   If edtOperD.Text = '' Then
   Begin
      ShowMessage('Falta ingresar Tipo de Operaciones sujetas al Sistema');
      dblcOperD.SetFocus;
      Exit;
   End;

   If MessageDlg('Grabar Datos de SUNAT' + chr(13) +
      '   ¿ Esta Seguro ?  ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      exit;
// Inicio HPC_201406_CXP

   //DMCXP.cdsMovCxP.Edit;
   //DMCXP.cdsMovCxP.post;
   //if DMCXP.cdsMovCxP.ApplyUpdates(0)>0 then
   //begin
   //   ShowMessage('No se puede actualizar la cabecera de la provisión - 7');
   //   exit;
   //end;

// Inicio HPC_201407_CXP
// Añade Usuario, Fecha y Hora de Actualización
   xSQL := ' Update CXP301 '
         + '    set CPTODETRSUNATID = '+quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPTODETRSUNATID').AsString) + ', '
         + '        TIPOOPERSUNATID = '+quotedstr(DMCXP.cdsMovCxP.fieldbyname('TIPOOPERSUNATID').AsString) + ', '
         + '        CPUSER = '+quotedstr(DMCXP.wUsuario)+', '
         + '        CPFREG = trunc(sysdate), '
         + '        CPHREG = sysdate '
         + '  Where CIAID='+quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
         + '    and TDIARID='+quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString)
         + '    and CPANOMES='+quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
         + '    and CPNOREG='+quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString);
// Fin HPC_201407_CXP
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se puede Grabar datos de la Sunat');
      exit;
   End;
// Fin HPC_201406_CXP

   EstadoDeSunat;

   ShowMessage('Grabo Datos SUNAT - Ok');
End;

Procedure TFProvision.bbtnElimSunClick(Sender: TObject);
Begin
   If MessageDlg('Eliminar Datos SUNAT' + chr(13) +
      '   ¿ Esta Seguro ?  ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      exit;

   DMCXP.cdsMovCxP.Edit;
   DMCXP.cdsMovCxP.FieldByName('CPTODETRSUNATID').AsString := '';
   DMCXP.cdsMovCxP.FieldByName('TIPOOPERSUNATID').AsString := '';
   DMCXP.cdsMovCxP.post;
// Inicio HPC_201406_CXP

// Inicio HPC_201407_CXP
// Añade Usuario, Fecha y Hora de Actualización
   xSQL := ' Update CXP301 '
         + '    set CPTODETRSUNATID = '''', '
         + '        TIPOOPERSUNATID = '''', '
         + '        CPUSER = '+quotedstr(DMCXP.wUsuario)+', '
         + '        CPFREG = trunc(sysdate), '
         + '        CPHREG = sysdate '
         + '  Where CIAID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
         + '    and TDIARID = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString)
         + '    and CPANOMES = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
         + '    and CPNOREG = ' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString);
// Fin HPC_201407_CXP
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se puede Eliminar datos de la Sunat');
      exit;
   End;
   //if DMCXP.cdsMovCxP.ApplyUpdates(0)>0 then
   //begin
   //   ShowMessage('No se pudo actualizar la cabecera de la provisión - 8');
   //   exit;
   //end;

// Fin HPC_201406_CXP

   dblcTipoDExit(Self);
   dblcOperDExit(self);

   EstadoDeSunat;

   ShowMessage('Grabo Datos SUNAT - Ok');
End;

// Inicio SPP_201411_CXP
procedure TFProvision.bbtnSNPClick(Sender: TObject);
begin
  If bbtnSNP.Font.Color = clNavy then
     bbtnSNP.Font.Color := clLime
  Else
     bbtnSNP.Font.Color :=clNavy;
end;
// Fin SPP_201411_CXP

// Inicio SPP_201411_CXP
procedure TFProvision.bbtnSNPMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
Begin
  If bbtnSNP.Font.Color = clLime then
     bbtnSNP.Hint := 'Se generará retención del SNP'

  Else
     bbtnSNP.Hint :='No se Generará retención del SNP';

end;
// Fin SPP_201411_CXP

// Inicio HPC_201604_CXP
// 17/10/2016 DAF_2016001421_CXP_1 Se añade botón para liberar Provisión de Gestión de Fondos
procedure TFProvision.bbtnLiberaGFNClick(Sender: TObject);
begin
   If DMCXP.cdsMovCxP.fieldbyname('DOCID').AsString<>'02' then
   Begin
      ShowMessage('Sólo se pueden Liberar Recibos por Honorarios');
      exit;
   End;

   If xControlFec(dblcCia.Text, dtpFComp.Date) = False Then
   Begin
      Exit;
   End;

   If DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString='S' then
   Begin
      ShowMessage('No se pueden Liberar Recibos Contabilizados');
      exit;
   End;

   If DMCXP.cdsMovCxP.fieldbyname('CPESTADO').AsString<>'P' then
   Begin
      ShowMessage('Sólo se pueden Liberar Recibos en Estado ACEPTADO');
      exit;
   End;

   If DMCXP.cdsMovCxP.fieldbyname('DCPLOTE').AsString<>'GESF' then
   Begin
      ShowMessage('Sólo se pueden Liberar Recibos generados desde Gestión de Fondos');
      exit;
   End;

   If MessageDlg(' ¿Desea Liberar el Recibo por Honorarios? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;
   
   xSQL := 'Update CXP301 '
      +    '   Set CPPAGORI=0, CPPAGLOC=0, CPPAGEXT=0, '
      +    '       CPSALORI=CPMTOORI, CPSALLOC=CPMTOORI, CPSALEXT=CPMTOEXT '
      +    ' where CIAID='+quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
      +    '   and CPANOMES='+quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString)
      +    '   and TDIARID='+quotedstr(DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString)
      +    '   and CPNOREG='+quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString);
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo liberar el Recibo por Honorarios');
      exit;
   End;
   ShowMessage('Recibo por Honorarios Liberado');
end;
// Fin HPC_201604_CXP

// Inicio HPC_201701_CXP
// Considera Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00
function TFProvision.validaSusp4ta(xgClAux, xgProveedor: string): Boolean;
var
   xSQL : String;
   wAno, wMes, wDia : Word;
Begin
   result := False;

   DecodeDate(dtpFEmis.Date, wAno, wMes, wDia);

   xSQL := 'Select CPNOREG '
          +'  from CXP302 '
          +' where CIAID='+quotedstr(dblcCia.Text)
          +'   and DCPANOMM='+quotedstr(meAnoMM.Text)
          +'   and TDIARID='+quotedstr(dblcTDiario.Text)
          +'   and CPNOREG='+quotedstr(meNoReg.Text)
          +'   and TIPDET=''I1'' ';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount>0 then
   Begin
      result := True;
   End
   Else
   Begin
      xSQL := 'Select FECEXON4TA '
             +'  from TGE201 '
             +' where CLAUXID='+quotedstr(xgClAux)
             +'   and PROV='+quotedstr(xgProveedor)
             +'   and to_char(FECEXON4TA,''YYYY'')='+quotedstr(inttostr(wAno));
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      If DMCXP.cdsQry.RecordCount>0 then
      Begin
         result := True;
      End;
   End;
End;
// Fin HPC_201701_CXP
// Inicio HPC_201704_CXP
// Seguros-Automatización de Devengue de Seguros
procedure TFProvision.cbSegurosClick(Sender: TObject);
begin
      if(cbSeguros.checked) then
      begin
        pnlSeguroDatos.Visible := True;
      end
      else
      begin
        pnlSeguroDatos.Visible := False;
      end;
      if((length(xdblcConcepto)>0) Or (length(xdbePoliza)>0) Or (length(xdtpFIVigencia)>0) Or (length(xdtpFFVigencia)>0))then
      begin
         pnlSeguroDatos.Visible := True;
         cbSeguros.Checked:= true;
      end;
end;
// Fin HPC_201704_CXP
// Inicio HPC_201704_CXP
// Seguros-Automatización de Devengue de Seguros
procedure TFProvision.btnSalirClick(Sender: TObject);
begin  
     if((length(dblcConcepto.text)=0) And (length(dbePoliza.text)=0) And (length(dtpFIVigencia.text)=0) And (length(dtpFFVigencia.text)=0))then
     begin
       pnlSeguroDatos.Visible := False;
       cbSeguros.Checked:= false;
     end
     else
     begin
        if(length(xdblcConcepto)=0)then
        begin
           dblcConcepto.text:='';
        end;
        if(length(xdbeConcepto)=0)then
        begin
           dbeConcepto.text:='';
        end;
        if(length(xdbePoliza)=0)then
        begin
           dbePoliza.text:='';
        end;
        if(length(xdtpFIVigencia)=0)then
        begin
           dtpFIVigencia.text:='';
        end;
        if(length(xdtpFFVigencia)=0)then
        begin
           dtpFIVigencia.text:='';
        end;
        pnlSeguroDatos.Visible := False;
        if((length(xdblcConcepto)=0) And (length(xdbePoliza)=0) And (length(xdtpFIVigencia)=0) And (length(xdtpFFVigencia)=0))then
        begin
           cbSeguros.Checked:= false;
        end;
     end;
end;
// Fin HPC_201704_CXP
// Inicio HPC_201704_CXP
// Seguros-Automatización de Devengue de Seguros
procedure TFProvision.dblcConceptoEnter(Sender: TObject);
begin
    DMCXP.cdsQry15.IndexFieldNames := 'CPTOID';
end;
// Fin HPC_201704_CXP
// Inicio HPC_201704_CXP
// Seguros-Automatización de Devengue de Seguros
procedure TFProvision.dblcConceptoExit(Sender: TObject);
begin
   DMCXP.cdsQry15.IndexFieldNames := 'CPTOID';
   DMCXP.cdsQry15.SetKey;
   DMCXP.cdsQry15.FieldbyName('CPTOID').AsString := dblcConcepto.Text;
   DMCXP.cdsQry15.GotoKey;
   If (length(dblcConcepto.text)=0)  Then
   Begin
      ShowMessage('Falta Código de Concepto');
      //dblcConcepto.SetFocus;
      exit;
   End;

   dbeConcepto.Text := DMCXP.cdsQry15.FieldByName('CPTODES').AsString;
end;
// Fin HPC_201704_CXP
// Inicio HPC_201704_CXP
// Seguros-Automatización de Devengue de Seguro
procedure TFProvision.dtpFIVigenciaExit(Sender: TObject);
begin
   //incrementar 1 año IncYear(IncDay(dtpFIVigencia.date,-),1);
   dtpFFVigencia.date := IncYear(dtpFIVigencia.date,1);
end;
// Fin HPC_201704_CXP
// Inicio HPC_201704_CXP
// Seguros-Automatización de Devengue de Seguro
procedure TFProvision.btnGrabarSegClick(Sender: TObject);
begin
     xdblcConcepto :=  dblcConcepto.text;
     xdbeConcepto  :=  dbeConcepto.text;
     xdbePoliza    :=  dbePoliza.text;
     xdtpFIVigencia:=  dtpFIVigencia.text;
     xdtpFFVigencia:=  dtpFFVigencia.text;
     pnlSeguroDatos.Visible := False;
end;
// Fin HPC_201704_CXP
// Inicio HPC_201704_CXP
// Seguros-Automatización de Devengue de Seguro
procedure TFProvision.btnLimpiarSegClick(Sender: TObject);
begin
     xdblcConcepto :=  '';
     xdbeConcepto  :=  '';
     xdbePoliza    :=  '';
     xdtpFIVigencia:=  '';
     xdtpFFVigencia:=  '';
     dblcConcepto.text := '';
     dbeConcepto.text := '';
     dbePoliza.text := '';
     dtpFIVigencia.text := '';
     dtpFFVigencia.text := '';
end;
// Fin HPC_201704_CXP

// Inicio HPC_201705_CXP
// Nuevo opción para importar detalles desde un archivo de texto 
Procedure TFProvision.bbtnImportDetallesClick(Sender: TObject);
var
   i : Integer;
   sLine, sLineTotal, cSepara, sDato, xWhere, sNombreArchivo, xSQL : String;
   sTREGID, sCPTOID, sDCPGLOSA, sCCOSID, sCUENTAID, sDCPDH: String;
   dDCPMOORI:Double;
   nPosI, nPosF, nMes : Integer;
   bError, bLineTotal: boolean;
   xfArchivoTexto: TextFile;
Begin

   if not sdImportDetalles.Execute then Exit;

   Try
      scData.Lines.LoadFromFile( sdImportDetalles.FileName);
   Except
      ShowMessage('Error : Al Leer Archivo (1)');
      Exit;
   End;

   cSepara:=',';
   sNombreArchivo :=  sdImportDetalles.FileName;
   sNombreArchivo :=  stringreplace(sNombreArchivo, '.txt', '',[rfReplaceAll, rfIgnoreCase]) + '_Log' + FormatDateTime('YYYYMMDDhhnnss',Now) + '.txt';

   AssignFile(xfArchivoTexto, sNombreArchivo);
   Rewrite(xfArchivoTexto);

   For i:=0 to scData.Lines.Count-1 do
   Begin
      bLineTotal := False;
      bError := False;

      sLineTotal:=Copy(scData.Lines.Strings[i],1,Length(scData.Lines.Strings[i]));
      sLine:=Copy(scData.Lines.Strings[i],1,Length(scData.Lines.Strings[i]));
      nPosF:=Pos( cSepara, sLine );
      sTREGID:=Copy(sLine,1,nPosF-1);

      sLine:=Copy(sLine,nPosF+1,Length(sLine));
      nPosF:=Pos( cSepara, sLine );
      sCPTOID:=Copy(sLine,1,nPosF-1);

      sLine:=Copy(sLine,nPosF+1,Length(sLine));
      nPosF:=Pos( cSepara, sLine );
      sDCPGLOSA:=Copy(sLine,1,nPosF-1);

      sLine:=Copy(sLine,nPosF+1,Length(sLine));
      nPosF:=Pos( cSepara, sLine );
      sCCOSID:=Copy(sLine,1,nPosF-1);

      sLine:=Copy(sLine,nPosF+1,Length(sLine));
      nPosF:=Pos( cSepara, sLine );
      sDCPDH:=Copy(sLine,1,nPosF-1);

      sLine:=Copy(sLine,nPosF+1,Length(sLine));
      nPosF:=Pos( cSepara, sLine );
      If nPosF = 0 Then
          sDato:=sLine
      Else
          sDato:=Copy(sLine,1,nPosF-1);

      If sDato = '' Then
          dDCPMOORI:= 0
      Else
          dDCPMOORI:=StrToFloat(sDato);

      //Validamos Linea Detalle (Item)
      //1. validar TREGID
      If sTREGID = '' Then
      Begin
          bError := True;
          GeneraLog(i + 1,'    Debe ingresar el Tipo de Registro', sLineTotal,xfArchivoTexto, bLineTotal);
      End
      Else
      Begin
          If xEsDomiciliado='S' Then
              If (sTREGID = '14') OR (sTREGID = '15') Then
              Begin
                  bError := True;
                  GeneraLog(i + 1,'    Tipo de Registro no debe ser 14 o 15', sLineTotal,xfArchivoTexto, bLineTotal);
              End;
      End;

      //2. validar sCPTOID
      If sCPTOID = '' Then
      Begin
          bError := True;
          GeneraLog(i + 1,'    Debe ingresar el concepto', sLineTotal,xfArchivoTexto, bLineTotal);
      End
      Else
      Begin
          DMCXP.cdsCnpEgr.SetKey;
          DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString := sCPTOID;
          If Not DMCXP.cdsCnpEgr.Gotokey Then
          Begin
              bError := True;
              GeneraLog(i + 1,'    Concepto No Existe', sLineTotal,xfArchivoTexto, bLineTotal);
          End;

          If DMCXP.cdsCnpEgr.FieldByname('NIVELMOV').AsString <> 'S' Then
          Begin
              bError := True;
              GeneraLog(i + 1,'    Concepto No es de Movimiento', sLineTotal,xfArchivoTexto, bLineTotal);
          End;
      End;

      //3. validar CUENTAID
      sCUENTAID := DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString;

      xWhere := 'CIAID=' + Quotedstr(dblcCia.text) + ' and CUENTAID=' + quotedstr(sCUENTAID);
      If length(BuscaQry('PrvTGE', 'TGE202', 'CUENTAID, CTA_CCOS, CTAACT', xWhere, 'CUENTAID')) > 0 Then
      Begin
          If DMCXP.cdsQry.FieldByName('CTAACT').AsString = 'N' Then
          Begin
              GeneraLog(i + 1,'    Cuenta Contable NO está Activa', sLineTotal,xfArchivoTexto, bLineTotal);
              bError := True;
          End;
      End
      else
      Begin
          GeneraLog(i + 1,'    Cuenta Contable NO existe para la Compañía indicada', sLineTotal,xfArchivoTexto, bLineTotal);
          bError := True;
      End;


      //4. validar sDCPGLOSA
      If sDCPGLOSA = '' Then
          sDCPGLOSA := DMCXP.cdsCnpEgr.FieldByName('CPTODES').AsString;


      //5. validar sCCOSID
      If sCCOSID = '' Then
      Begin
          bError := True;
          GeneraLog(i + 1,'    Debe ingresar el Centro de Costo', sLineTotal,xfArchivoTexto, bLineTotal);
      End
      Else
      Begin
          xWhere := 'CCOSID=''' + sCCOSID + ''' and CCOSMOV=''S'' AND CCOSACT=''S'' '
                     + ' and CCOSCIAS LIKE (' + quotedstr('%' + dblcCia.Text + '%') + ' )';

          If length(BuscaQry('dspTGE', 'TGE203', 'CCOSDES', xWhere, 'CCOSDES')) = 0 Then
          Begin
              bError := True;
              GeneraLog(i + 1,'    Centro de Costo NO está Activo', sLineTotal,xfArchivoTexto, bLineTotal);
          End;
      End;

      //6. validar sDCPDH
      If sDCPDH = '' Then
      Begin
          bError := True;
          GeneraLog(i + 1,'    Debe ingresar D(para Debe) o H(para Haber)', sLineTotal,xfArchivoTexto, bLineTotal);
      End
      Else
      Begin
          If (sDCPDH <> 'D') And (sDCPDH <> 'H') Then
          Begin
              bError := True;
              GeneraLog(i + 1,'    Se acepta sólo D(para Debe) o H(para Haber)', sLineTotal,xfArchivoTexto, bLineTotal);
          End;
      End;

      If dDCPMOORI <= 0 Then
      Begin
          bError := True;
          GeneraLog(i + 1,'    Importe debe ser mayor a 0', sLineTotal,xfArchivoTexto, bLineTotal);
      End;


      //Si no hubo error entonces insertar el registro
      If not(bError) Then
      Begin

          dblcTipReg.setfocus;
          dblcTipReg.text := sTREGID;

          dblcdCnpEgr.setfocus;
          dblcdCnpEgr.text := sCPTOID;

          dbeGlosa.setfocus;
          dbeGlosa.text := sDCPGLOSA;

          dblcdCCosto.setfocus;
          dblcdCCosto.text := sCCOSID;

          dbeDH.setfocus;
          dbeDH.text := sDCPDH;

          dbeImporte.setfocus;
          dbeImporte.text := FloatToStr(dDCPMOORI);

          bbtnRegOk.setfocus;
          bbtnRegOkClick(self);

      End;
   End;
   CloseFile(xfArchivoTexto);

   bbtnRegCanc.setfocus;
   bbtnRegCancClick(self);

End;
// Fin HPC_201705_CXP

// Inicio HPC_201705_CXP
// Nueva funcion que permite registrar una linea de error en el archivo log del proceso
Procedure TFProvision.GeneraLog(iLinea:integer;sTexto, sLinea: string; var xfArchivoTexto: TextFile; var bLineTotal: Boolean);
Begin
    If bLineTotal Then
        WriteLn(xfArchivoTexto, sTexto)
    Else
    Begin
        WriteLn(xfArchivoTexto, 'Linea ' + IntToStr(iLinea) + ':' + sLinea );
        WriteLn(xfArchivoTexto, sTexto);
        bLineTotal := True;
    End;
End;
// Fin HPC_201705_CXP
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
procedure TFProvision.dblcCiaChange(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;

   xWhere := 'CIAID=' + quotedstr(dblcCia.Text);
   edtCia.Text := BuscaQry('dspTGE', 'TGE101', 'CIAABR,CIARETIGV,EXOIGV', xWhere, 'CIAABR');

end;
// Fin HPC_201803_CXP
End.
