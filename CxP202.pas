unit CxP202;
//*********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201101_CXP
// FECHA DE MODIF.  : 01/03/2011
// DESCRIPCION      : Se verifica la fecha del documento para obtener
//                    el porcentaje de IGV. si el documento es menor o igual
//                    al 28/02/2011 entonces el IGV será 0.19 en caso contrario
//                    el IGV serà el obtenido de la tabla TGE113
//*********************************************************
// HPC_201401_CXP 10/02/2014  Modificar los ControlTrans, AplicaDato y los ApplyUpdates.
// HPC_201707_CXP   : Ajuste en la opción de Nota de Crédito
// HPC_201802_CXP	: Ajustes para registrar Nota de Crédito No Domiciliados
// HPC_201805_CXP	: Ajustes para registrar Nota de Crédito Nueva Forma de Descuento

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, wwdblook, Wwdbdlg, wwdbdatetimepicker, Buttons, ppTypes,
  Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, DB, ComCtrls, Tabnotbk, Menus,
  DBClient, wwclient, ppDB, ppDBPipe, ppCtrls, ppBands, ppVar, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppViewr, Variants,
  oaVariables;

type
  TFNotasDC = class(TForm)
    pnlCabecera: TPanel;
    pnlDetalle: TPanel;
    pnlPie: TPanel;
    Z2bbtnGraba: TBitBtn;
    bbtnCancela: TBitBtn;
    bbtnCalc: TBitBtn;
    edtFinal: TEdit;
    pnlPendientes: TPanel;
    dbgPendientes: TwwDBGrid;
    Label2: TLabel;
    pnlCanje: TPanel;
    Label3: TLabel;
    dbgCanje: TwwDBGrid;
    pnlPendientes2: TPanel;
    Label1: TLabel;
    dbgPendientes2: TwwDBGrid;
    pnlDetCanje: TPanel;
    Label4: TLabel;
    dbgDetCanje: TwwDBGrid;
    pnlDetCxP: TPanel;
    Label5: TLabel;
    dbgDetCxP: TwwDBGrid;
    Z2bbtnContab: TBitBtn;
    Z2bbtnNuevo: TBitBtn;
    Z2bbtnAcepta: TBitBtn;
    Z2bbtnAnula: TBitBtn;
    bbtnDel1: TBitBtn;
    bbtnSumat: TBitBtn;
    bbtnGen302: TBitBtn;
    bbtnRegresa: TBitBtn;
    tnbkDetalle: TTabbedNotebook;
    pnlCab1: TPanel;
    pnlCab2: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    lblprov: TLabel;
    dblcdProv: TwwDBLookupComboDlg;
    lblRuc: TLabel;
    dblcdProvRuc: TwwDBLookupComboDlg;
    edtProv: TEdit;
    lblFComprob: TLabel;
    dtpFComp: TwwDBDateTimePicker;
    lblComprob: TLabel;
    lblLote: TLabel;
    dbeLote: TwwDBEdit;
    lblTMon: TLabel;
    dblcTMon: TwwDBLookupCombo;
    lblTCam: TLabel;
    dbeTCambio: TwwDBEdit;
    lblFRecep: TLabel;
    dbdtpFRecep: TwwDBDateTimePicker;
    lblFEmis: TLabel;
    dbdtpFEmis: TwwDBDateTimePicker;
    bbtnBorra: TBitBtn;
    bbtnOK: TBitBtn;
    lblProvNom: TLabel;
    edtTMon: TEdit;
    dbeNoReg: TwwDBEdit;
    pnlEstado: TPanel;
    lblAnula: TLabel;
    lblActivo: TLabel;
    lblContab: TLabel;
    lblAcepta: TLabel;
    pnlRegistro: TPanel;
    lblTipReg: TLabel;
    lblCnpEgr: TLabel;
    lblCCosto: TLabel;
    lblDH: TLabel;
    lblImporte: TLabel;
    lblGlosa: TLabel;
    lblCuenta: TLabel;
    dblcdCCosto: TwwDBLookupComboDlg;
    edtTipReg: TEdit;
    edtCCosto: TEdit;
    dbeImporte: TwwDBEdit;
    dbeDH: TwwDBEdit;
    bbtnRegOk: TBitBtn;
    bbtnRegCanc: TBitBtn;
    dbeCuenta: TwwDBEdit;
    dbeGlosa: TwwDBEdit;
    btnActReg: TwwIButton;
    dblcTipReg: TwwDBLookupCombo;
    dblcdCnpEgr: TwwDBLookupComboDlg;
    Label8: TLabel;
    StaticText1: TStaticText;
    dblcClAux: TwwDBLookupCombo;
    lblEliminado: TLabel;
    lblTipPre: TLabel;
    dblcTipPre: TwwDBLookupCombo;
    dbeTipPre: TwwDBEdit;
    lblPresu: TLabel;
    dblcdPresup: TwwDBLookupComboDlg;
    edtPresup: TEdit;
    pnlActuali: TPanel;
    lblActuali: TLabel;
    rgDoc: TRadioGroup;
    Z2bbtnPreview: TBitBtn;
    pprPreview: TppReport;
    ppdbpPreview: TppDBPipeline;
    lblTDiario: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    lblSerie: TLabel;
    lblNoDoc: TLabel;
    edtSerie: TwwDBEdit;
    edtNoDoc: TwwDBEdit;
    cbRepGlosa: TCheckBox;
    pnlImpuesto: TPanel;
    Label7: TLabel;
    bbtnGenReg: TBitBtn;
    dblcImpuesto: TwwDBLookupCombo;
    edtImpuesto: TEdit;
    bbtnTotal: TBitBtn;
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
    Z2bbtnPAplica: TBitBtn;
    rgAplica: TRadioGroup;
    Bevel1: TBevel;
    lblRetIGV: TLabel;
    cbSujetoaRetIGV: TCheckBox;
    Label6: TLabel;	  
// Inicio HPC_201802_CXP 
// Ajustes para registrar Nota de Crédito No Domiciliados
    lblTDoc: TLabel;
    dblcTDoc: TwwDBLookupCombo;
    edtTDoc: TEdit;		
// Fin HPC_201802_CXP
    procedure bbtnOKClick(Sender: TObject);
    procedure dbgPendientesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgPendientesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgCanjeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgCanjeEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgCanjeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dtpFCompExit(Sender: TObject);
    procedure LlenaDetCxp;
    procedure CalculaTotalCje;
    procedure CalculaTotalDetCje;
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure dbgPendientes2DragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgPendientes2EndDrag(Sender, Target: TObject; X,
      Y: Integer);
    procedure dbgPendientes2MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgDetCanjeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgDetCanjeEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDetCanjeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure dblcTipRegExit(Sender: TObject);
    procedure dblcdCnpEgrExit(Sender: TObject);
    procedure InicializaVars;
    procedure InicializaCds;
    procedure DatosCds;
    procedure DatosdeFecha;
    procedure dblcdProvExit(Sender: TObject);
    procedure dblcdProvRucExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    //procedure dblcTMonChange(Sender: TObject);
    procedure bbtnBorraClick(Sender: TObject);
    procedure CamposKEnabled(PVal:Boolean);
    procedure CompntesEnabled(PVal:Boolean);
    Function VerificaTotal:Boolean;
    Function CuadraDH:Boolean;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
    Function CuadraMontoRef:Boolean;
// Fin HPC_201707_CXP
    procedure bbtnSumatClick(Sender: TObject);
    procedure bbtnGen302Click(Sender: TObject);
    procedure dbgDetCxPEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDetCxPMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bbtnDel1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure bbtnCalcClick(Sender: TObject);
    procedure edtNoDocExit(Sender: TObject);
    procedure Z2bbtnContabClick(Sender: TObject);
    procedure Z2bbtnNuevoClick(Sender: TObject);
    procedure dbgCanjeColExit(Sender: TObject);
    procedure dbgDetCanjeColExit(Sender: TObject);
    procedure _Click(Sender: TObject);
    procedure Z2bbtnAnulaClick(Sender: TObject);
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EstadoDeBotones( xMovEstado, xMovConta : String );
    procedure MuestraEstado( xMovEstado, xMovConta : String ) ;
    procedure bbtnRegresaClick(Sender: TObject);
    procedure IniciaBotonesDetalle;
    procedure _Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure dbeTCambioExit(Sender: TObject);
    procedure edtSerieExit(Sender: TObject);
    procedure edtSerieKeyPress(Sender: TObject; var Key: Char);
    procedure dblcCiaKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNoRegExit(Sender: TObject);
    procedure dblcdProvKeyPress(Sender: TObject; var Key: Char);
    procedure dblcdProvRucKeyPress(Sender: TObject; var Key: Char);
    procedure edtNoDocKeyPress(Sender: TObject; var Key: Char);
    procedure dtpFCompKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNoRegKeyPress(Sender: TObject; var Key: Char);
    procedure dbeLoteKeyPress(Sender: TObject; var Key: Char);
    procedure dblcTMonKeyPress(Sender: TObject; var Key: Char);
    procedure dbeTCambioKeyPress(Sender: TObject; var Key: Char);
    procedure dbdtpFRecepKeyPress(Sender: TObject; var Key: Char);
    procedure dbdtpFEmisKeyPress(Sender: TObject; var Key: Char);
    procedure btnActRegClick(Sender: TObject);
    procedure bbtnRegOkClick(Sender: TObject);
    procedure bbtnRegCancClick(Sender: TObject);
    procedure dbeDHExit(Sender: TObject);
    procedure dblcdCCostoExit(Sender: TObject);
    procedure dbeImporteExit(Sender: TObject);
    procedure dbgDetCxPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgDetCxPDblClick(Sender: TObject);
    procedure dbgDetCanjeCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure IniciaForma(xModo : String ); // A=Adic, M=Mod, C=Cons
    procedure EstadoDePanel( xxModo : String );
    procedure FiltraGrids;
    function  Consistencia: Boolean;
    procedure EstadoDeForma(xxModo:Integer; xMovEstado,xMovConta:String);
    procedure FormCreate(Sender: TObject);
    procedure dblcdPresupExit(Sender: TObject);
    procedure dblcdProvEnter(Sender: TObject);
    procedure dblcdProvRucEnter(Sender: TObject);
    procedure dblcClAuxExit(Sender: TObject);
    procedure dblcTipPreExit(Sender: TObject);
    procedure Z2bbtnPreviewClick(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure dblcdCnpEgrEnter(Sender: TObject);
    procedure pprPreviewPreviewFormCreate(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dblcImpuestoEnter(Sender: TObject);
    procedure dblcImpuestoExit(Sender: TObject);
    procedure bbtnGenRegClick(Sender: TObject);
    procedure bbtnTotalClick(Sender: TObject);
    procedure Z2bbtnPAplicaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
    procedure dbdtpFEmisExit(Sender: TObject); 
// Inicio HPC_201802_CXP 
// Ajustes para registrar Nota de Crédito No Domiciliados
    procedure dblcTDocExit(Sender: TObject);
// Fin HPC_201802_CXP
// Fin HPC_201707_CXP

  private
    { Private declarations }
    xFiltroTDiar:String;
    strTemp : String;
    //** 03/09/2001 - pjsv
    xNRegistro,xAnomes,xGlosa,xMensaje,xDistri,xCta_Ccos : String;
    numreg : Integer;
    xTOTLOC,xTOTEXT : double;
    xNReg : Integer;
    //**
    // para presupuestos - pjsv - 17/10/2000
    procedure CalculoNivelSupe;
    procedure inicializoCero(xcds : TwwClientDataSet);
    procedure CreaSuperior;
    procedure CalculoNivel;
    function  AsientoCuadra: Boolean;
    procedure Items;
    procedure GrabaDet;
    procedure GrabaCabeceraCanje;
    procedure GrabaDetalleCanje;
    procedure LlenaDetCxP1(xxNReg:string);
    procedure GeneraDiferenciaCambio(xxNReg:string);
    procedure AnulaNotaCredito ;
    procedure CargaDataSource;
    function  FiltraDocGrid : Boolean;
    //Inicio SAR666
    procedure CopiaRegistro(xCds_fuente, xCds_destino :TwwClientDataSet);
    procedure ImpuestoReg06(xTipoRegistro, xTipoDetalle :String; xTasa, xIGV09 :double);
    //Fin SAR666
    PROCEDURE RecalculaTotales ;
  public
    { Public declarations }
    xGlosaRep : String;
    xTipoProv : String;
  end;

var
  xRegAct, xRegAct2 ,  xRegMov : TBookMark;
  FNotasDC: TFNotasDC;
  wRegGrab, wCuadra, wNuevo: Boolean;
  wSimbMn, wTDoc, wTDiar, wCje, wAnoMes, wEstadTem: string;
  wTDev, wTDev2, wIgv: Double;  // Cantidad IGV para restarle al saldo y tener MtoMax de Ingreso
  xTAutoNum, xTAno, xTMes : String;
  xxTCambio : double;
  xCrea : Boolean;
  TemMovCxP  : TwwClientDataSet;
  TemMovCxP2 : TwwClientDataSet;
  wAnoMM     : String;
  xFlagGr    : Boolean;
  xTemTReg  : String;
  xTemCpto  : String;
  xTemCta   : String;
  xTemDH    : String;
  xtippre   : string;
  xNoReg      : string;


implementation

uses CxPDM, CxP001, CxP778;

{$R *.DFM}


procedure TFNotasDC.EstadoDeForma(xxModo:Integer; xMovEstado,xMovConta:String);
begin
   pnlCab1.Enabled      := False;
   pnlCab2.Enabled      := False;
   dtpFComp.Enabled     := False;
   dbeNoReg.Enabled     := False;
   dblcTDiario.Enabled  := False;

   bbtnOK.Enabled       := False;
   bbtnBorra.Enabled    := False;

   pnlDetalle.Enabled   := False;
   pnlRegistro.Visible  := False;

   dbgPendientes.Enabled  := False;
   dbgCanje.Enabled       := False;
   dbgPendientes2.Enabled := False;
   dbgDetCanje.Enabled    := False;
   dbgDetCxP.Enabled      := False;
   dbgPendientes.ReadOnly := True;
   dbgCanje.ReadOnly      := True;
   dbgPendientes2.ReadOnly:= True;
   dbgDetCanje.ReadOnly   := True;
   dbgDetCxP.ReadOnly     := True;
   btnActReg.Enabled      := False;

   pnlPie.Refresh;
   pnlPie.Enabled       := False;
   //FVariables.fcbBotones.Buttons['bbtnRegresa'].Enabled:=False;
   bbtnRegresa.Enabled  := False;
   //FVariables.fcbBotones.Buttons['bbtnCancela'].Enabled:=False;
   bbtnCancela.Enabled  := False;
   Z2bbtnGraba.Enabled  := False;
   Z2bbtnAcepta.Enabled := False;
   Z2bbtnAnula.Enabled  := False;
   Z2bbtnContab.Enabled := False;
   Z2bbtnNuevo.Enabled  := False;
   Z2bbtnPreview.Enabled:= False;

   lblActivo.Visible    := False;
   lblAcepta.Visible    := False;
   lblAnula.Visible     := False;
   lblContab.Visible    := False;
   lblEliminado.Visible := False ;

   If xxModo=0 then
      begin
         If (xMovEstado=' ') or (xMovEstado='') then
            begin
               pnlCab1.Enabled    := True;
               pnlCab2.Enabled    := True;
               dblcTDiario.Enabled:= True;
               dtpFComp.Enabled   := True;
               dbeNoReg.Enabled   := True;
               bbtnOK.Enabled     := True;
               bbtnBorra.Enabled  := True;

               lblActivo.Visible  := False;

               dblcCia.SetFocus;
            end
         else begin
            If xMovEstado='I' then begin
               pnlCab2.Enabled    := True;
               bbtnOK.Enabled     := True;
               bbtnBorra.Enabled  := True;

               lblActivo.Visible  := True;

               dbeLote.SetFocus;
            end
         end
      end
   else begin
      If xMovConta='S' then
         begin
            pnlDetalle.Enabled   := True;
            pnlPie.Enabled       := True;
            Z2bbtnPreview.Enabled:= True;
            dbgCanje.Enabled     := True;
            dbgDetCanje.Enabled  := True;
            dbgDetCxP.Enabled    := True;

            lblContab.Visible    := True;
         end
      else begin
         If xMovEstado='I' then
            begin
               pnlDetalle.Enabled     := True;
               dbgPendientes.Enabled  := True;
               dbgCanje.Enabled       := True;
               dbgPendientes2.Enabled := True;
               dbgDetCanje.Enabled    := True;
               dbgDetCxP.Enabled      := True;
               dbgPendientes.ReadOnly := False;
               dbgCanje.ReadOnly      := False;
               dbgPendientes2.ReadOnly:= False;
               dbgDetCanje.ReadOnly   := False;
               dbgDetCxP.ReadOnly     := False;
               btnActReg.Enabled      := True;

               pnlPie.Enabled       := True;
               bbtnRegresa.Enabled  := True;
               bbtnCancela.Enabled  := True;
               Z2bbtnGraba.Enabled  := True;
               Z2bbtnAcepta.Enabled := True;
               Z2bbtnAnula.Enabled  := True;

               lblActivo.Visible    := True;
               if DMCXP.wModo='A' then
                  Z2bbtnNuevo.Enabled  := true;

            end
         else
         begin
            If (xMovEstado='P') or (xMovEstado='C') then
               begin
                  pnlDetalle.Enabled    := True;
                  dbgCanje.Enabled      := True;
                  dbgDetCanje.Enabled   := True;
                  dbgDetCxP.Enabled     := True;

                  pnlPie.Enabled       := True;
                  Z2bbtnContab.Enabled := True;
                  Z2bbtnPreview.Enabled:= True;
                  Z2bbtnAnula.Enabled:=True;

                  lblAcepta.Visible    := True;
                  if DMCXP.wModo='A' then
                     Z2bbtnNuevo.Enabled  := true;
               end
            else
            begin // Anulado
               pnlDetalle.Enabled    := True;
               dbgCanje.Enabled      := True;
               dbgDetCanje.Enabled   := True;
               dbgDetCxP.Enabled     := True;

               Z2bbtnPAplica.Enabled :=False;

               pnlPie.Enabled       := True;
               if xMovEstado = 'A' then
                  lblAnula.Visible     := True
               else
                  lblEliminado.Visible := True ;
            end;
         end;
      end;
   end;

   if DMCXP.wModo='C' then begin // Si Entra Solo Para Consulta
      pnlCab1.Enabled      := False;
      pnlCab2.Enabled      := False;

      bbtnOK.Enabled       := False;
      bbtnBorra.Enabled    := False;

      dbgPendientes.Enabled  := False;
      dbgCanje.Enabled       := False;
      dbgPendientes2.Enabled := False;
      dbgDetCanje.Enabled    := False;
      dbgDetCxP.Enabled      := False;
      dbgPendientes.ReadOnly := True;
      dbgCanje.ReadOnly      := True;
      dbgPendientes2.ReadOnly:= True;
      dbgDetCanje.ReadOnly   := True;
      dbgDetCxP.ReadOnly     := True;
      btnActReg.Enabled      := False;

      pnlPie.Refresh;
      pnlPie.Enabled       := False;
      bbtnRegresa.Enabled  := False;
      bbtnCancela.Enabled  := False;
      if DMCXP.wAdmin='G' then begin
         pnlPie.Enabled       := True;
         Z2bbtnGraba.Enabled  := True;
         Z2bbtnAcepta.Enabled := True;
         Z2bbtnAnula.Enabled  := True;
         Z2bbtnContab.Enabled := True;
         Z2bbtnNuevo.Enabled  := True;
         end
      else begin
         Z2bbtnGraba.Enabled  := False;
         Z2bbtnAcepta.Enabled := False;
         Z2bbtnAnula.Enabled  := False;
         Z2bbtnContab.Enabled := False;
         Z2bbtnNuevo.Enabled  := False;
      end;
      pnlPie.Refresh;
   end;
end;



procedure TFNotasDC.IniciaForma(xModo : String ); // A=Adic, M=Mod, C=Cons
var
   xWhere : String;
begin

   if xModo='A' then begin

      Filtracds( DMCXP.cdsDetCxP,'Select * from CXP302 Where CIAID=''''' );

      edtCia.Text    := '';
      edtProv.Text   := '';
      edtTMon.Text   := '';
      end
   else begin

      wCje:=DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString;

      if xModo='M' then begin
         edtCia.Text  :=DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);
         edtProv.text :=DMCXP.DisplayDescrip('TGE201','PROVDES','PROVRUC',dblcdProvRuc.Text);
         xWhere       :='TMonId='+''''+dblcTMon.Text+''''+' and (TMon_Loc='+''''+'L'+''''+' or TMon_Loc='+''''+'E'+''''+')';
         edtTMon.Text :=BuscaQry('PrvTGE','TGE103','TMONDES',xWhere,'TMONDES');
         end
      else begin
         edtCia.Text    := DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);
         edtProv.text   := DMCXP.DisplayDescrip('TGE201','PROVDES','PROVRUC',dblcdProvRuc.Text);
         xWhere         := 'TMonId='+''''+dblcTMon.Text+''''+' and (TMon_Loc='+''''+'L'+''''+' or TMon_Loc='+''''+'E'+''''+')';
         edtTMon.Text   := BuscaQry('PrvTGE','TGE103','TMONDES',xWhere,'TMONDES');
      end;

      FiltraGrids;

   end;


   // Reglas de Negocio
   if DMCXP.wVRN_TCambioFijo='N' then
      dbeTCambio.Enabled:=True
   else begin
      dbeTCambio.Enabled:=False;
   end;

end;

procedure TFNotasDC.FiltraGrids;
var
   xFiltro : string;
begin
// Filtro para Documentos aptos para elección del Proveedor
   xFiltro:='CIAID=''' +dblcCia.Text+''' and PROV='''+dblcdProv.Text+''' and '
           +'DOCID<>'''+wTDoc+'''';

   If rgDoc.itemindex = 0 then
      xFiltro := xFiltro + ' AND CPESTADO=''P'' AND (CPSALLOC > 0 OR CPSALEXT > 0) '
   else
      xFiltro := xFiltro + ' AND CPESTADO=''C'' AND (ABS(CPSALLOC) < 0.5 and ABS(CPSALEXT) < 0.5) ';
   xFiltro:=xFiltro+'ORDER BY CPANOMES, DOCID, CPSERIE, CPNODOC ';

   DMCXP.cdsMovCxP.close;
   DMCXP.cdsMovCxP.dataRequest('SELECT * FROM CXP301 WHERE '+xFiltro);
   DMCXP.cdsMovCxP.Open;
// Filtracds( DMCXP.cdsMovCxP,'Select * from CXP301 Where '+xFiltro );

// Filtro para Documentos escogidos para el Canje
   xFiltro:='CIAID='''+ dblcCia.Text+''' and '
           +'TCANJEID=''NC'' and CCPCANJE='''+wCje+''' and '
           +'PROV='''+dblcdProv.Text+''' and DOCID<>'''+wTDoc+'''';
//   SHOWMESSAGE(xFiltro);
   Filtracds( DMCXP.cdsCanje,'Select * from CXP304 Where '+xFiltro );

// Filtro para cdsLetras que se utilizará para Documentos Pendientes
   xFiltro:= 'CIAID='   +''''+ dblcCia.Text  +''''+ ' and '
           + 'PROV='    +''''+ dblcdProv.Text+''''+ ' and '
           + 'DOCID<>'  +''''+ wTDoc         +'''';
   xFiltro:=xFiltro+'ORDER BY CPANOMES, DOCID, CPSERIE, CPNODOC ';
   
   Filtracds( DMCXP.cdsLetras,'Select * from CXP301 Where '+xFiltro );

   DMCXP.cdsLetras.Filtered := False;
   DMCXP.cdsLetras.Filter:= 'CPESTADO=''P'' and (CPSALLOC>0 OR CPSALEXT>0)';
   DMCXP.cdsLetras.Filtered := True;

// Filtra Compañía+NC+No.Canje en Detalle de Canje
   xFiltro:='CIAID='   +''''+dblcCia.Text+''''+' and '
           +'TCANJEID=''NC'' and CCPCANJE='''+wCje+''' and '
           +'PROV='''+dblcdProv.Text+''' and DOCID<>'''+wTDoc+'''';

   Filtracds( DMCXP.cdsDetCanje,'Select * from CXP305 Where '+xFiltro );


// Filtra DetCxP para mostrar DetContable(dbgDetCxp) si NCredito Existe
   xFiltro:= 'CIAID    =''' + dblcCia.Text  + ''' and '
           + 'DCPANOMM =''' + DMCXP.cdsMovCxP2.fieldbyname('CPANOMES').AsString + ''' and '
           + 'TDIARID  =''' + DMCXP.cdsMovCxP2.fieldbyname('TDIARID').AsString  + ''' and '
           + 'CPNOREG  =''' + DMCXP.cdsMovCxP2.fieldbyname('CPNOREG').AsString  + '''' ;

   Filtracds( DMCXP.cdsDetCxP,'Select * from CXP302 Where '+xFiltro );
     //ANAX
  // ASP_26022010 //TNumericField(DMCXP.CdsMovCxP.FieldByName('CPMTOORI')).DisplayFormat := '###,###,##0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsMovCxP.FieldByName('CPMTOORI')).EditFormat := '########0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsMovCxP.FieldByName('CPSALLOC')).DisplayFormat := '###,###,##0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsMovCxP.FieldByName('CPSALLOC')).EditFormat := '########0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsMovCxP.FieldByName('CPSALEXT')).DisplayFormat := '###,###,##0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsMovCxP.FieldByName('CPSALEXT')).EditFormat := '########0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsMovCxP.FieldByName('CPTCAMPR')).DisplayFormat := '#,##0.000';
  // ASP_26022010 //TNumericField(DMCXP.CdsMovCxP.FieldByName('CPTCAMPR')).EditFormat := '###0.000';

  // ASP_26022010 //TNumericField(DMCXP.CdsCanje.FieldByName('CCPMOLOC')).DisplayFormat := '###,###,##0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsCanje.FieldByName('CCPMOLOC')).EditFormat := '########0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsCanje.FieldByName('CCPMOEXT')).DisplayFormat := '###,###,##0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsCanje.FieldByName('CCPMOEXT')).EditFormat := '########0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsCanje.FieldByName('CCPTCCJE')).DisplayFormat := '#,##0.000';
  // ASP_26022010 //TNumericField(DMCXP.CdsCanje.FieldByName('CCPTCCJE')).EditFormat := '###0.000';

  // ASP_26022010 //TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOORI')).DisplayFormat := '###,###,##0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOORI')).EditFormat := '########0.00';

  // ASP_26022010 //TNumericField(DMCXP.CdsLetras.FieldByName('CPSALLOC')).DisplayFormat := '###,###,##0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsLetras.FieldByName('CPSALLOC')).EditFormat := '########0.00';

  // ASP_26022010 //TNumericField(DMCXP.CdsLetras.FieldByName('CPSALEXT')).DisplayFormat := '###,###,##0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsLetras.FieldByName('CPSALEXT')).EditFormat := '########0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsLetras.FieldByName('CPTCAMPR')).DisplayFormat := '#,##0.000';
  // ASP_26022010 //TNumericField(DMCXP.CdsLetras.FieldByName('CPTCAMPR')).EditFormat := '###0.000';


  // ASP_26022010 //TNumericField(DMCXP.CdsMovCxP.FieldByName('CPTCAMPR')).DisplayFormat := '#,##0.000';
  // ASP_26022010 //TNumericField(DMCXP.CdsMovCxP.FieldByName('CPTCAMPR')).EditFormat := '###0.000';


  // ASP_26022010 //TNumericField(DMCXP.CdsDetCanje.FieldByName('DCDMOLOC')).DisplayFormat := '###,###,##0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsDetCanje.FieldByName('DCDMOLOC')).DisplayFormat := '########0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsDetCanje.FieldByName('DCDTCAMB')).DisplayFormat := '#,##0.000';
  // ASP_26022010 //TNumericField(DMCXP.CdsDetCanje.FieldByName('DCDTCAMB')).EditFormat := '###0.000';

  // ASP_26022010 //TNumericField(DMCXP.CdsDetCanje.FieldByName('DCDMOEXT')).DisplayFormat := '###,###,##0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsDetCanje.FieldByName('DCDMOEXT')).EditFormat := '########0.00';

  // ASP_26022010 //TNumericField(DMCXP.CdsDetCxP.FieldByName('DCPMOORI')).DisplayFormat := '###,###,##0.00';
  // ASP_26022010 //TNumericField(DMCXP.CdsDetCxP.FieldByName('DCPMOORI')).EditFormat := '########0.00';
  //FIN ANAX

end;

procedure TFNotasDC.EstadoDePanel( xxModo : String );
begin
   dbgCanje.ReadOnly   := True;
   dbgDetCanje.ReadOnly:= True;
   dbgDetCxP.ReadOnly  := True;

   dtpFComp.Enabled     := True;
   dbeNoReg.Enabled   := True;

   if xxModo=' ' then begin // Adiciona
      pnlCabecera.Enabled:= True;
      pnlCab1.Enabled    := True;
      pnlCab2.Enabled    := True;

      bbtnOK.Enabled     := True;
      bbtnBorra.Enabled  := True;

      pnlDetalle.Enabled := False;
      dbgDetCxP.ReadOnly := False;
      pnlPie.Enabled     := False;
      end
   else begin
      if xxModo='I' then begin
         pnlCabecera.Enabled  := True;
         pnlCab1.Enabled      := False;
         dtpFComp.Enabled     := False;
         dbeNoReg.Enabled   := False;
         pnlCab2.Enabled      := True;

         bbtnOK.Enabled      := True;
         bbtnBorra.Enabled   := True;

         pnlDetalle.Enabled  := True;
         dbgCanje.ReadOnly   := False;
         dbgDetCanje.ReadOnly:= False;
         dbgDetCxP.ReadOnly  := False;

         pnlPie.Enabled     := True;

         end
      else begin
         if (xxModo='P') or (xxModo='A') or (xxModo='C') then begin
            pnlCabecera.Enabled:= False;
            pnlCab1.Enabled    := False;
            pnlCab2.Enabled    := False;

            bbtnOK.Enabled     := False;
            bbtnBorra.Enabled  := False;

            pnlDetalle.Enabled := True;
            pnlPie.Enabled     := True;
            end
         else begin
            if xxModo='D' then begin   // Modificar Detalle
               pnlCabecera.Enabled:= False;
               pnlCab1.Enabled    := False;
               pnlCab2.Enabled    := False;

               bbtnOK.Enabled     := False;
               bbtnBorra.Enabled  := False;

               pnlDetalle.Enabled  := True;
               dbgCanje.ReadOnly   := False;
               dbgDetCanje.ReadOnly:= False;
               dbgDetCxP.ReadOnly  := False;
               pnlPie.Enabled      := true;
            end;
         end;
      end;
   end;
end;

procedure TFNotasDC.dblcCiaExit(Sender: TObject);
var
   xSQL : String;
begin
   if xCrea then Exit;

	 edtCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);
	 if length(edtCia.Text)=0 then
	 begin
		  ShowMessage('Compañía no existe');
		  dblcCia.SetFocus;
      Exit;
	 end;

	 if Length(dblcClAux.Text)=0 then dblcClAux.SetFocus;

   if DMCXP.wVRN_CCosCia='N' then
    	xSQL:='SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 '
					 +'Where CCOSMOV='+quotedstr('S')
           + ' and CCOSACT=''S'''
   else
     	xSQL:='SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 '
  				 +'Where CCOSMOV='+quotedstr('S')
           +' and CCOSCIAS LIKE ('+quotedstr('%'+dblcCia.Text+'%')+' ) '
           + ' and CCOSACT=''S''';

	 DMCXP.cdsCCosto.Close;
	 DMCXP.cdsCCosto.DataRequest(xSQL);
	 DMCXP.cdsCCosto.open;
	 DMCXP.cdsCCosto.Filter:='';
	 DMCXP.cdsCCosto.Filtered:=False;
	 DMCXP.cdsCCosto.IndexFieldNames :='CCOSID';

// JORGE 31/01/2002
// El concepto no tiene compañía pero las cuentas contables si, abre solo los conceptos
// de aquellas cuentas contables que tiene la compañía

   if DMCXP.wVRN_CptoCia='N' then
   	  xSQL:='select * from CXP201 '
   else
      xSQL:='select A.CPTOID, A.CPTODES, A.CUENTAID, NIVELMOV, DTRPORC, CCOSPORCEN From CXP201 A '
           +'WHERE EXISTS ( SELECT CUENTAID FROM TGE202 B '
           +               'WHERE A.CUENTAID=B.CUENTAID AND B.CTAACT=''S'' '
           +                 'AND B.CIAID='''+dblcCia.Text+''') '
           +'ORDER BY A.CPTOID';

   DMCXP.cdsCnpEgr.Close;
	 DMCXP.cdsCnpEgr.DataRequest( xSQL );
	 DMCXP.cdsCnpEgr.Open;
end;

procedure TFNotasDC.dblcdProvExit(Sender: TObject);
var
// Inicio HPC_201802_CXP
// Ajustes para registrar Nota de Crédito No Domiciliados
   xWhere, xSQL1 : String;
begin
   If xCrea then Exit;
   if Length(dblcClAux.Text)=0 then begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Falta Ingresar Clase de Auxiliar');
   end;

   if (length(dblcdProv.Text)>0) then
   begin
      xWhere:='ClAuxId='''+dblcClAux.Text+''' and Prov='''+dblcdProv.Text+''' and NVL(ACTIVO,''N'')=''S''';
      edtProv.Text:=BuscaQry('dspTGE','TGE201','PROV,PROVRUC,PROVDES, ESDOMIC',xWhere,'PROVDES');
      if length(edtProv.Text)=0 then
      begin
         dblcdProv.Text:='';
         dblcdProvRuc.Text:='';
         dblcdProv.SetFocus;

         Raise Exception.Create('Proveedor no existe');
      end;
      dblcdProvRuc.Text:=DMCXP.cdsQry.FieldByName('PROVRUC').AsString;

      IF DMCXP.cdsQry.FieldByName('ESDOMIC').AsString = 'N' THEN
      BEGIN
          xSQL1 := ' Select docid, docmod, docdes, docabr, doc_freg, tdiarid, tdiarid2, doctipreg, docresta, coadocid, fcing, docconta, docidorig, f_emidoc, docprov, docreccaj, '
               + ' docplazo, refalm, urqalm, docretigv, graciavcto, doclength, docaf, dtrafecto, tdoc_sunat, afec_regpension, afec_rend_cxp, tdiarid_rend, retencion, flag_mostrar_doc, '
               + ' detraccion1, rq_longser_fija, longserie_fija, rq_longnum_fija, longnumdoc_fija, flag_valida_rend '
               + '  from TGE110 '
               + ' where DOC_FREG = '+quotedstr(xTipoProv)+' and DOCID =''97'' AND '
               + ' DOCMOD=  ''CXP'' '
               + ' Order by DOCID ';
      END
      ELSE
      BEGIN
          xSQL1 := ' Select docid, docmod, docdes, docabr, doc_freg, tdiarid, tdiarid2, doctipreg, docresta, coadocid, fcing, docconta, docidorig, f_emidoc, docprov, docreccaj, '
               + ' docplazo, refalm, urqalm, docretigv, graciavcto, doclength, docaf, dtrafecto, tdoc_sunat, afec_regpension, afec_rend_cxp, tdiarid_rend, retencion, flag_mostrar_doc, '
               + ' detraccion1, rq_longser_fija, longserie_fija, rq_longnum_fija, longnumdoc_fija, flag_valida_rend '
               + '  from TGE110 '
               + ' where DOC_FREG = '+quotedstr(xTipoProv)+' and DOCID =''07'' and '
               + ' DOCMOD=  ''CXP'' '
               + ' Order by DOCID ';
      END;
          DMCXP.cdsTDoc.Close;
          DMCXP.cdsTDoc.DataRequest(xSQL1);
          DMCXP.cdsTDoc.open;
          DMCXP.cdsTDoc.Filter := '';
          DMCXP.cdsTDoc.Filtered := False;
          DMCXP.cdsTDoc.IndexFieldNames := 'DOCID';
 (*
      DMCXP.cdsTDoc.Filter:='';
   DMCXP.cdsTDoc.Filter:='DOC_FREG='+''''+xTipoProv+''''+' and '
                      +'DOCMOD=  '+''''+'CXP'+'''';
   DMCXP.cdsTDoc.Filtered:=True;

      dblcTDoc.Selected.Clear;
      dblcTDoc.Selected.Add('DOCID'#9'3'#9'Id~Banco.'#9'F');
      dblcTDoc.Selected.Add('BANCONOM'#9'25'#9'Banco.'#9'F');
      dblcTDoc.Selected.Add('CCBCOID'#9'18'#9'Cuenta~Bancaria'#9'F');
      dblcTDoc.Selected.Add('TMONID'#9'2'#9'Moneda'#9'F');
      if dblcTDiario.Enabled then
         dblcTDiario.SetFocus
      else
         edtSerie.SetFocus;
*)
      dblcTDoc.SetFocus;
// Fin HPC_201802_CXP
   end
   else begin
      edtProv.Text:='';
      dblcdProvRuc.SetFocus;
   end;
end;

procedure TFNotasDC.dblcdProvRucExit(Sender: TObject);
var
   xWhere : String;
begin
   if xCrea             then Exit;
   if bbtnBorra.Focused then Exit;
   if Length(dblcClAux.Text)=0 then begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Falta Ingresar Clase de Auxiliar');
   end;

   if (length(dblcdProvRuc.Text)>0) then
   begin
      xWhere:='ClAuxId='''+dblcClAux.Text+''' and ProvRuc='''+dblcdProvRuc.Text+''' and NVL(ACTIVO,''N'')=''S''';
      edtProv.Text:=BuscaQry('dspTGE','TGE201','PROV,PROVRUC,PROVDES',xWhere,'PROVDES');
      if length(edtProv.Text)=0 then
      begin
         dblcdProv.Text   :='';
         dblcdProvRuc.Text:='';
         dblcdProvRuc.SetFocus;
         Raise Exception.Create('RUC de Proveedor no existe');
      end;
      
      dblcdProv.Text:=DMCXP.cdsQry.FieldByName('PROV').AsString;

      if dblcTDiario.Enabled then
         dblcTDiario.SetFocus
      else
         edtSerie.SetFocus;

   end
   else begin
      edtProv.Text:='';
      dblcdProv.SetFocus;
   end;
end;

procedure TFNotasDC.InicializaVars;
begin
   wCje      := '';
   wSimbMn   := '';
   wEstadTem := '';              // si regresa de Det a Pend (cuando existe N/C)
   wCuadra   := False;
   wRegGrab  := False;
   edtFinal.Text:= '';
   edtSerie.Text:= '';
   edtNoDoc.Text:= '';
   //cim 16/09/2002
   edtTMon.Text :='';
   xFlagGr   := False;
   dblcTDiario.Text:='';
   edtTDiario.Text :='';
end;

procedure TFNotasDC.InicializaCds;
begin
   DMCXP.cdsDetCxP.EnableControls;
   DMCXP.cdsDetCanje.EnableControls;
   DMCXP.cdsCanje.EnableControls;

//  Filtracds( DMCXP.cdsMovCxP2,  'Select * from CXP301 Where CIAID=''''' );
   Filtracds( DMCXP.cdsMovCxP,  'Select * from CXP301 Where CIAID=''''' );
   Filtracds( DMCXP.cdsCanje,   'Select * from CXP304 Where CIAID=''''' );
   Filtracds( DMCXP.cdsLetras,  'Select * from CXP301 Where CIAID=''''' );
   Filtracds( DMCXP.cdsDetCanje,'Select * from CXP305 Where CIAID=''''' );
   Filtracds( DMCXP.cdsDetCxP,  'Select * from CXP302 Where CIAID=''''' );
end;

function TFNotasDC.Consistencia: Boolean;
begin
   if length(dblcCia.Text)=0 then
      raise exception.Create('Ingrese Compañía');
   If length(dblcdProv.Text)=0 then
      raise exception.Create('Ingrese Proveedor');
   If length(edtSerie.Text)=0 then
      raise exception.Create('Ingrese Serie del Documento');
   If length(edtNoDoc.Text)=0 then
      raise exception.Create('Ingrese Número del Documento');
   if dtpFComp.Date=0 then
      raise exception.Create('Ingrese Fecha del comprobante');
   if length(dbeNoReg.Text)=0 then
      raise exception.Create('Ingrese Número del comprobante');
   if length(dblcTMon.Text)=0 then
      raise exception.Create('Ingrese Moneda');
   if length(dbeTCambio.Text)=0 then
      raise exception.Create('Ingrese Tipo de Cambio');
   if dbdtpFRecep.Date=0 then
      raise exception.Create('Ingrese Fecha de Recepción del Documento');
   if dbdtpFEmis.Date=0 then
      raise exception.Create('Ingrese Fecha de Emisión del Documento');
   If rgDoc.ItemIndex = -1 then
      raise exception.Create('Escoja sobre que tipo de Documento quiere Trabajar');
   Result := true;
end;

procedure TFNotasDC.bbtnOKClick(Sender: TObject);
var
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   xWhere,xSQL  : String;
// Fin HPC_201707_CXP
   xxc1, xxc2, xxc3 : String;
begin
  if not Consistencia then Exit;

  if xControlFec(dblcCia.Text, dtpFComp.Date) = False then
  begin
     Exit;
  end;

  xGlosaRep:='';

  if DMCXP.wModo='A' then
   begin
     {
     xWhere:='CiaId='''+dblcCia.Text+''' and TCanjeID=''NC'' ';
     wCje  :=DMCXP.BuscaUltTGE('PrvUltCxP','CXP305','CCPCanje',xWhere);
     wCje  :=StrZero(wCje,6);
     }
     xWhere:='CIAID='+QuotedStr(dblcCia.Text)+' AND TCANJEID='+QuotedStr('NC');
     xxc1 :=StrZero(DMCXP.BuscaUltTGE( 'dspTGE','CXP304','CCPCANJE',xWhere ), 6 );
     xxc2 :=StrZero(DMCXP.BuscaUltTGE( 'dspTGE','CXP301','CPCANJE', xWhere ), 6 );
     xxc3 :=StrZero(DMCXP.BuscaUltTGE( 'dspTGE','CXP308','CANJE',   xWhere ), 6 );
     if xxc1>xxc2 then
        wCje:=xxc1
     else
        wCje:=xxc2;

     if wCje<xxc3 then
        wCje:=xxc3;

     DMCXP.cdsMovCxP2.Edit;
     DMCXP.cdsMovCxP2.fieldbyname('CPSERIE').AsString   := edtSerie.Text;
     DMCXP.cdsMovCxP2.fieldbyname('CPNODOC').AsString   := edtNoDoc.Text;
     DMCXP.cdsMovCxP2.fieldbyname('CPFVCMTO').AsDateTime:=dbdtpFEmis.Date;
     DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString  :='I';

     //VHN
     //DMCXP.cdsMovCxP2.fieldbyname('CPFLAGTDOC').AsString:= IntToStr(rgDoc.ItemIndex);
     DMCXP.cdsMovCxP2.fieldbyname('CPFLAGTDOC').AsString:= IntToStr(rgAplica.ItemIndex);

     FiltraGrids;
     //cim
     if DMCXP.cdsMovCxP.recordcount=0 then
        raise exception.Create('No existen Documentos para el Proveedor');
   end;

  DatosdeFecha;

  EstadoDeForma(1,DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString,DMCXP.cdsMovCxP2.fieldbyname('CP_CONTA').AsString );

  DatosCds;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
  xSQL := 'UPDATE DB2ADMIN.CXP301 SET '
            +' CPSERIE ='+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSERIE').AsString)+', '
            +' CPNODOC ='+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPNODOC').AsString)+', '
            +' CPFRECEP ='+QuotedStr(dbdtpFRecep.Text)+', '
            +' CPFEMIS ='+QuotedStr(dbdtpFEmis.Text)+', '
            +' TMONID ='+QuotedStr(dblcTMon.Text)+', '
            +' DCPLOTE ='+QuotedStr(dbeLote.Text)
            +' WHERE '
            +' CIAID = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString)+' AND '
            +' CPANOMES = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString)+' AND '
            +' TDIARID = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString)+' AND '
            +' CPNOREG = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString);
     DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
// Fin HPC_201707_CXP     
  if rgAplica.ItemIndex=0 then
     pnlPendientes2.Enabled:=False
  else
     pnlPendientes2.Enabled:=True;


  // vhn 20120703
  pnlPendientes2.Enabled:=True;

  bbtnSumatClick(Sender);
end;

procedure TFNotasDC.DatosCds;
begin
   DMCXP.cdsMovCxP2.Edit;
   DMCXP.cdsMovCxP2.fieldbyname('CLAUXID').AsString   :=dblcClAux.Text;    // clase de Auxiliar=CP <-- constante
   DMCXP.cdsMovCxP2.fieldbyname('CPSERIE').AsString   :=edtSerie.Text;
   DMCXP.cdsMovCxP2.fieldbyname('CPNODOC').AsString   :=edtNoDoc.Text;
   DMCXP.cdsMovCxP2.fieldbyname('CPFCMPRB').AsDateTime:=dtpFComp.Date;

   DMCXP.cdsMovCxP2.fieldbyname('TCANJEID').AsString  :='NC';
   DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString   :=wCje;
   DMCXP.cdsMovCxP2.fieldbyname('CPFCANJE').AsDateTime:=dtpFComp.Date;
   DMCXP.cdsMovCxP2.fieldbyname('CPUSER').AsString    :=DMCXP.wUsuario;
   DMCXP.cdsMovCxP2.fieldbyname('CPFREG').AsDateTime  :=date;
   DMCXP.cdsMovCxP2.fieldbyname('CPHREG').AsDateTime  :=time;

   if DMCXP.wModo='A' then

   else begin   // si no es nuevo
      DMCXP.cdsCanje.DisableControls;
      DMCXP.cdsCanje.First;
      While not DMCXP.cdsCanje.Eof do Begin  // Recalcula saldos si NCredito ya existe
         DMCXP.cdsCanje.Edit;
         if Length(DMCXP.cdsCanje.FieldByName('CPSerie').AsString)=0 then
            DMCXP.cdsMovCxP.IndexFieldNames:='CIAID;PROV;DOCID;CPNODOC'
         else begin
            DMCXP.cdsMovCxP.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
         end;
         DMCXP.cdsMovCxP.Setkey;
         DMCXP.cdsMovCxP.FieldByName('CiaId').AsString  := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
         DMCXP.cdsMovCxP.FieldByName('Prov').AsString   := DMCXP.cdsCanje.FieldByName('PROV').AsString;
         DMCXP.cdsMovCxP.FieldByName('DocId').AsString  := DMCXP.cdsCanje.FieldByName('DOCID').AsString;
         if Length(DMCXP.cdsCanje.FieldByName('CPSerie').AsString)>0 then
            DMCXP.cdsMovCxP.FieldByName('CPSerie').AsString:= DMCXP.cdsCanje.FieldByName('CPSERIE').AsString;
         DMCXP.cdsMovCxP.FieldByName('CPNoDoc').AsString:= DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
         if DMCXP.cdsMovCxP.GotoKey then begin
            DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
            DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2);
         end;
         DMCXP.cdsCanje.FieldByName('CJEANTMN').AsFloat := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
         DMCXP.cdsCanje.FieldByName('CJEANTME').AsFloat := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
         DMCXP.cdsMovCxP.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
         DMCXP.cdsCanje.Next;
      end;
      DMCXP.cdsCanje.EnableControls;

      DMCXP.cdsDetCanje.DisableControls;
      DMCXP.cdsDetCanje.First;
      While not DMCXP.cdsDetCanje.Eof do begin  // Recalcula saldos si NCredito ya existe
         DMCXP.cdsDetCanje.Edit;
         if Length(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString)=0 then
            DMCXP.cdsLetras.IndexFieldNames:='CIAID;PROV;DOCID;CPNODOC'
         else begin
            DMCXP.cdsLetras.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
         end;
         DMCXP.cdsLetras.Setkey;
         DMCXP.cdsLetras.FieldByName('CIAID').AsString  := DMCXP.cdsDetCanje.FieldByName('CIAID').AsString;
         DMCXP.cdsLetras.FieldByName('PROV').AsString   := DMCXP.cdsDetCanje.FieldByName('PROV').AsString;
         DMCXP.cdsLetras.FieldByName('DOCID').AsString  := DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
         if Length(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString)>0 then
            DMCXP.cdsLetras.FieldByName('CPSERIE').AsString:= DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString;
         DMCXP.cdsLetras.FieldByName('CPNODOC').AsString:= DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString;
         if DMCXP.cdsLetras.GotoKey then begin
           /// saldo cdsDetCanje=(saldo de cdsLet)+(monto canje de cdsDetCanje)
           DMCXP.cdsDetCanje.FieldByName('SALLOC').AsFloat:=DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat+DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
           DMCXP.cdsDetCanje.FieldByName('SALEXT').AsFloat:=DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat+DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
         end;
         DMCXP.cdsDetCanje.FieldByName('CJEANTMN').AsFloat := DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
         DMCXP.cdsDetCanje.FieldByName('CJEANTME').AsFloat := DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
         DMCXP.cdsLetras.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
         DMCXP.cdsDetCanje.Next;
      end;
      DMCXP.cdsDetCanje.EnableControls;
   end;                 // si no es nuevo
   // Inicio HPC_201707_CXP
   //Ajuste en la opción de Nota de Crédito
   DMCXP.cdsCanje.FieldByname('DOCID').ReadOnly := True;
   DMCXP.cdsCanje.FieldByname('CPSERIE').ReadOnly := True;
   DMCXP.cdsCanje.FieldByname('CPNODOC').ReadOnly := True;
   DMCXP.cdsCanje.FieldByname('CCPFCJE').ReadOnly := True;
   DMCXP.cdsCanje.FieldByname('CCPTCCJE').ReadOnly := True;
   DMCXP.cdsCanje.FieldByname('CCPMOLOC').ReadOnly := True;
   DMCXP.cdsCanje.FieldByname('CCPMOEXT').ReadOnly := True;
   // Fin HPC_201707_CXP
end;

procedure TFNotasDC.dtpFCompExit(Sender: TObject);
var
   wLote,  wMes, xWhere: string;
   Year, Month, Day: Word;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

   if xControlFec(dblcCia.Text, dtpFComp.Date) = False then
   begin
      dtpFComp.SetFocus;
    	Exit;
   end;

   dbdtpFRecep.Date:=dtpFComp.Date;
   dbdtpFEmis.Date :=dtpFComp.Date;
   DecodeDate(dtpFComp.Date, Year, Month, Day);
   wMes := inttostr(Month);
   if Month<10 then wMes := '0'+inttostr(Month);
   wAnoMM:= IntToStr(Year)+wMes;
   xTAno := IntToStr(Year);
   xTMes := wMes;

   xTAutoNum   := DMCXP.DisplayDescrip('TGE104','AUTONUM','TDIARID',dblcTDiario.Text);
   dbeNoReg.Text:= DMCXP.UltimoRegistroCXP(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes );
   dbeNoReg.Text:= Strzero(dbeNoReg.Text, DMCXP.cdsMovCxP2.fieldbyname('CPNOREG').Size );

   //** 06/09/2001 - pjsv, se utilizan en la llamada al prorrateo
   xAnomes := xTAno+xTMes;
   xNRegistro := dbeNoReg.Text;
   //**
   DMCXP.cdsMovCxP2.fieldbyname('CPNOREG').AsString:=StrZero(dbeNoReg.Text,DMCXP.cdsMovCxP2.fieldbyname('CPNoReg').Size);
   xWhere := 'TDiarId='+''''+dblcTDiario.Text+''''+' and CPAnoMes='+''''+wAnoMM+'''';
   wLote  := DMCXP.BuscaUltTGE('PrvUltCxP','CXP301','DCPLote',xWhere);
   DMCXP.cdsMovCxP2.fieldbyname('DCPLOTE').Value := StrZero(wLote,DMCXP.cdsMovCxP2.fieldbyname('DCPLOTE').Size);
   DMCXP.cdsMovCxP2.fieldbyname('CPANOMES').AsString:= xAnomes;

   xWhere := 'TMonId='+''''+DMCXP.wTMonExt            +''''+' and '
           + 'Fecha='+DMCXP.wRepFuncDate+''''+ FORMATDATETIME(DMCXP.wFormatFecha,dtpFComp.Date)+''''+')';
   if length(BuscaQry('PrvTGE','TGE107','*',xWhere,'TMonId'))>0 then
      xxTCambio:=DMCXP.cdsQry.fieldbyname('TCam'+DMCXP.wVRN_TipoCambio).Value
   else begin
      dtpFComp.SetFocus;
      Raise Exception.Create( ' Error :  Fecha No tiene Tipo de Cambio ' );
   end;
   dbeNoReg.SetFocus;
end;

procedure TFNotasDC.DatosdeFecha;
begin
   DMCXP.cdsMovCxP2.Edit;
   DMCXP.cdsMovCxP2.fieldbyname('CPFCMPRB').AsDateTime :=dtpFComp.Date;
   if DMCXP.BuscaFecha('TGE114','FecAno','Fecha',dtpFComp.date ) then begin
      DMCXP.cdsMovCxP2.fieldbyname('CPAAAA').AsString := DMCXP.cdsUltTGE.fieldbyname('FECANO'  ).AsString;    // ano
      DMCXP.cdsMovCxP2.fieldbyname('CPMM').AsString   := DMCXP.cdsUltTGE.fieldbyname('FECMES'  ).AsString;    // mes
      DMCXP.cdsMovCxP2.fieldbyname('CPDD').AsString   := DMCXP.cdsUltTGE.fieldbyname('FECDIA'  ).AsString;    // día
      DMCXP.cdsMovCxP2.fieldbyname('CPTRI').AsString  := DMCXP.cdsUltTGE.fieldbyname('FECTRIM' ).AsString;    // trimestre
      DMCXP.cdsMovCxP2.fieldbyname('CPSEM').AsString  := DMCXP.cdsUltTGE.fieldbyname('FECSEM'  ).AsString;    // semestre
      DMCXP.cdsMovCxP2.fieldbyname('CPSS').AsString   := DMCXP.cdsUltTGE.fieldbyname('FECSS'   ).AsString;    // semana
      DMCXP.cdsMovCxP2.fieldbyname('CPAATRI').AsString:= DMCXP.cdsUltTGE.fieldbyname('FECAATRI').AsString;    // año+trimestre
      DMCXP.cdsMovCxP2.fieldbyname('CPAASEM').AsString:= DMCXP.cdsUltTGE.fieldbyname('FECAASEM').AsString;    // año+semestre
      DMCXP.cdsMovCxP2.fieldbyname('CPAASS').AsString := DMCXP.cdsUltTGE.fieldbyname('FECAASS' ).AsString;    // año+semana
   end;
end;

procedure TFNotasDC.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFNotasDC.dbgPendientesEndDrag(Sender, Target: TObject; X,
  Y: Integer);
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
var
 xSQL: String;
// Fin HPC_201707_CXP
begin
   If Target=dbgCanje Then Begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      DMCXP.cdsCanje.FieldByname('DOCID').ReadOnly := False;
      DMCXP.cdsCanje.FieldByname('CPSERIE').ReadOnly := False;
      DMCXP.cdsCanje.FieldByname('CPNODOC').ReadOnly := False;
      DMCXP.cdsCanje.FieldByname('CCPFCJE').ReadOnly := False;
      DMCXP.cdsCanje.FieldByname('CCPTCCJE').ReadOnly := False;
      DMCXP.cdsCanje.FieldByname('CCPMOLOC').ReadOnly := False;
      DMCXP.cdsCanje.FieldByname('CCPMOEXT').ReadOnly := False;
// Fin HPC_201707_CXP
      if Length(DMCXP.cdsMovCxP.FieldByName('CPSerie').AsString)=0 then
         DMCXP.cdsCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPNODOC'
      else begin
         DMCXP.cdsCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
      end;
      DMCXP.cdsCanje.SetKey;
      DMCXP.cdsCanje.FieldByName('CIAID').AsString   :=DMCXP.cdsMovCxP.FieldByName('CIAID').AsString;
      DMCXP.cdsCanje.FieldByName('PROV').AsString    :=DMCXP.cdsMovCxP.FieldByName('PROV').AsString;
      DMCXP.cdsCanje.FieldByName('DOCID').AsString   :=DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
      if Length(DMCXP.cdsMovCxP.FieldByName('CPSerie').AsString)>0 then
         DMCXP.cdsCanje.FieldByName('CPSERIE').AsString :=DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
      DMCXP.cdsCanje.FieldByName('CPNODOC').AsString :=DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
      if not(DMCXP.cdsCanje.GotoKey) then begin
         DMCXP.cdsCanje.Insert;
         DMCXP.cdsCanje.FieldByName('CIAID').AsString    := DMCXP.cdsMovCxP.FieldByName('CIAID').AsString;
         DMCXP.cdsCanje.FieldByName('TDIARID').AsString  := DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString;
         DMCXP.cdsCanje.FieldByName('CPNOREG').AsString  := DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString;
         DMCXP.cdsCanje.FieldByName('CCPANOC').AsString  := DMCXP.cdsMovCxP.FieldByName('CPAAAA').AsString;
         DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString := DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString;
         DMCXP.cdsCanje.FieldByName('PROV').AsString     := DMCXP.cdsMovCxP.FieldByName('PROV').AsString;
         DMCXP.cdsCanje.FieldByName('PROVRUC').AsString  := DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString;
         DMCXP.cdsCanje.FieldByName('DOCID').AsString    := DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
         DMCXP.cdsCanje.FieldByName('CPSERIE').AsString  := DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
         DMCXP.cdsCanje.FieldByName('CPNODOC').AsString  := DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
         DMCXP.cdsCanje.FieldByName('TCANJEID').AsString := 'NC';
         DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString := wCje;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
         //DMCXP.cdsCanje.FieldByName('CCPFCJE').AsDateTime:= dtpFComp.Date;    // modif.
         DMCXP.cdsCanje.FieldByName('CCPFCJE').AsDateTime:= DMCXP.cdsMovCxP.FieldByName('CPFCMPRB').AsDateTime;
// Fin HPC_201707_CXP
         DMCXP.cdsCanje.FieldByName('TMONID').AsString   := DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;    // T.mon del doc - no modif.
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
         //DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat  := strtofloat(dbeTCambio.Text);  // modif.
         DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat  := DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat;
// Fin HPC_201707_CXP
         DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsString := DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsString;
         DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat  := DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat;
         DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat  := DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;
         DMCXP.cdsCanje.FieldByName('CJEANTMN').AsFloat  := 0;
         DMCXP.cdsCanje.FieldByName('CJEANTME').AsFloat  := 0;
         DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat  := 0;   // modificable
         DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat  := 0;   // modif.
         DMCXP.cdsCanje.FieldByName('CCPESTDO').AsString := 'P';
         DMCXP.cdsCanje.FieldByName('CCPUSER').AsString  := DMCXP.wUsuario;
         DMCXP.cdsCanje.FieldByName('CCPFREG').AsdateTime:= date;
         DMCXP.cdsCanje.FieldByName('CCPHREG').AsDateTime:= time;
         DMCXP.cdsCanje.FieldByName('CCPMM').AsString    := DMCXP.cdsMovCxP.FieldByName('CPMM').AsString;
         DMCXP.cdsCanje.FieldByName('CCPDD').AsString    := DMCXP.cdsMovCxP.FieldByName('CPDD').AsString;
         DMCXP.cdsCanje.FieldByName('CCPTRI').AsString   := DMCXP.cdsMovCxP.FieldByName('CPTri').AsString;
         DMCXP.cdsCanje.FieldByName('CCPSEM').AsString   := DMCXP.cdsMovCxP.FieldByName('CPSem').AsString;
         DMCXP.cdsCanje.FieldByName('CCPSS').AsString    := DMCXP.cdsMovCxP.FieldByName('CPSS').AsString;
         DMCXP.cdsCanje.FieldByName('CCPAATRI').AsString := DMCXP.cdsMovCxP.FieldByName('CPAATri').AsString;
         DMCXP.cdsCanje.FieldByName('CCPAASEM').AsString := DMCXP.cdsMovCxP.FieldByName('CPAASem').AsString;
         DMCXP.cdsCanje.FieldByName('CCPAASS').AsString  := DMCXP.cdsMovCxP.FieldByName('CPAASS').AsString;
         cdsPost( DMCXP.cdsCanje );
      end;
      DMCXP.cdsCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      DMCXP.cdsCanje.FieldByname('DOCID').ReadOnly := True;
      DMCXP.cdsCanje.FieldByname('CPSERIE').ReadOnly := True;
      DMCXP.cdsCanje.FieldByname('CPNODOC').ReadOnly := True;
      DMCXP.cdsCanje.FieldByname('CCPFCJE').ReadOnly := True;
      DMCXP.cdsCanje.FieldByname('CCPTCCJE').ReadOnly := True;
      DMCXP.cdsCanje.FieldByname('CCPMOLOC').ReadOnly := True;
      DMCXP.cdsCanje.FieldByname('CCPMOEXT').ReadOnly := True;

      dbeTCambio.Text := DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsString;

      xSQL := 'UPDATE DB2ADMIN.CXP301 SET '
            +' CPTCAMPR ='+QuotedStr(dbeTCambio.Text)
            +' WHERE '
            +' CIAID = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString)+' AND '
            +' CPANOMES = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString)+' AND '
            +' TDIARID = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString)+' AND '
            +' CPNOREG = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString);
     DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

// Fin HPC_201707_CXP
   end;
end;

procedure TFNotasDC.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     dbgPendientes.BeginDrag(False);
end;

procedure TFNotasDC.dbgCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFNotasDC.dbgCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   If Target=dbgPendientes then begin
      if Length(DMCXP.cdsCanje.FieldByName('CPSERIE').AsString)=0 then
         DMCXP.cdsMovCxP.IndexFieldNames:='CIAID;PROV;DOCID;CPNODOC'
      else begin
         DMCXP.cdsMovCxP.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
      end;
      DMCXP.cdsMovCxP.SetKey;
      DMCXP.cdsMovCxP.FieldByName('CIAID').AsString  :=DMCXP.cdsCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsMovCxP.FieldByName('PROV').AsString   :=DMCXP.cdsCanje.FieldByName('PROV').AsString;
      DMCXP.cdsMovCxP.FieldByName('DOCID').AsString  :=DMCXP.cdsCanje.FieldByName('DOCID').AsString;
      if Length(DMCXP.cdsCanje.FieldByName('CPSERIE').AsString)>0 then
         DMCXP.cdsMovCxP.FieldByName('CPSerie').AsString:= DMCXP.cdsCanje.FieldByName('CPSERIE').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString:=DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
      if DMCXP.cdsMovCxP.GotoKey then begin
         DMCXP.cdsMovCxP.Edit;
         if wEstadTem <> '' then
           DMCXP.cdsMovCxP.FieldByName('CPEstado').AsString := wEstadTem;
         cdsPost( DMCXP.cdsMovCxP );
         DMCXP.cdsCanje.Delete;
      end;
      DMCXP.cdsMovCxP.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
   end;
   If (Target=bbtnDel1) and (DMCXP.cdsCanje.RecordCount > 0)
   Then DMCXP.cdsCanje.Delete;
end;

procedure TFNotasDC.dbgCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     dbgCanje.BeginDrag(False);
end;

procedure TFNotasDC.CalculaTotalCje;
begin
     // Totales de Documentos de canje  (Referencia)
     With DMCXP do Begin
     wTDev:=0;
     cdsCanje.DisableControls;  // inhab. movim. de puntero pal grid
     xRegAct := cdsCanje.GetBookmark;  // marca reg. donde se quedo
     cdsCanje.First ;
     While not cdsCanje.Eof do Begin
         if dblcTMon.Text = wTMonExt
         then wTDev := wTDev + cdsCanje.FieldByName('CCPMOEXT').AsFloat
         else wTDev := wTDev + cdsCanje.FieldByName('CCPMOLOC').AsFloat;
         cdsCanje.Next;
     end;
     cdsCanje.GotoBookmark(xRegAct);
     cdsCanje.FreeBookmark(xRegAct);
     cdsCanje.EnableControls;
     End;

end;

procedure TFNotasDC.CalculaTotalDetCje;
begin
   // Totales de Documentos de canje  (Cancelación)
   wTDev2:=0;
   DMCXP.cdsDetCanje.DisableControls;  // inhab. movim. de puntero pal grid
   xRegAct := DMCXP.cdsDetCanje.GetBookmark;  // marca reg. donde se quedo
   DMCXP.cdsDetCanje.First ;
   while not DMCXP.cdsDetCanje.Eof do begin
      if dblcTMon.Text = DMCXP.wTMonExt then
         wTDev2 := wTDev2 + DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat
      else
         wTDev2 := wTDev2 + DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
      DMCXP.cdsDetCanje.Next;
   end;
   DMCXP.cdsDetCanje.GotoBookmark(xRegAct);
   DMCXP.cdsDetCanje.FreeBookmark(xRegAct);
   DMCXP.cdsDetCanje.EnableControls;
end;

procedure TFNotasDC.LlenaDetCxP;
begin
     DMCXP.cdsDetCxP.Edit;
     DMCXP.cdsDetCxP.FieldByName('CIAID').AsString     :=dblcCia.Text;
     DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString   :=dblcTDiario.Text;
     DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString   :=dbeNoReg.Text;
     DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString   :=copy(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString,1,4);
     DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString  :=DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString;
     DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString   :='CP';
     DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString   := DMCXP.cdsMovCxP2.fieldbyname('DCPLOTE').AsString;     
     DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString   :=dblcClAux.Text;
     DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString  :=dblcdProv.Text;
     DMCXP.cdsDetCxP.FieldByName('DOCID').AsString     :=wTDoc;
     DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString   :=edtSerie.Text;
     DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString   :=edtNoDoc.Text;
     DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat   :=DMCXP.cdsMovCxP2.FieldByName('CPTCAMPR').AsFloat;
     DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat   :=strtofloat(dbeTCambio.Text);
     DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime :=dbdtpFEmis.Date;
     DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime :=dtpFComp.Date;
     DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:=dbdtpFEmis.Date;
     DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString  :='P';
     DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString   := DMCXP.wUsuario;
     DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime :=date;
     DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime :=time;
     DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString     :=DMCXP.cdsMovCxP2.FieldByName('CPMM').AsString;
     DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString     :=DMCXP.cdsMovCxP2.FieldByName('CPDD').AsString;
     DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString    :=DMCXP.cdsMovCxP2.FieldByName('CPTRI').AsString;
     DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString    :=DMCXP.cdsMovCxP2.FieldByName('CPSEM').AsString;
     DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString     :=DMCXP.cdsMovCxP2.FieldByName('CPSS').AsString;
     DMCXP.cdsDetCxP.FieldByName('DCPAATri').AsString  :=DMCXP.cdsMovCxP2.FieldByName('CPAATRI').AsString;
     DMCXP.cdsDetCxP.FieldByName('DCPAASem').AsString  :=DMCXP.cdsMovCxP2.FieldByName('CPAASEM').AsString;
     DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString   :=DMCXP.cdsMovCxP2.FieldByName('CPAASS').AsString;
     DMCXP.cdsDetCxP.FieldByName('TMONID').AsString    :=dblcTMon.Text;
end;

procedure TFNotasDC.dbgPendientes2DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFNotasDC.dbgPendientes2EndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   If Target=dbgDetCanje Then
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
     DMCXP.cdsDetCanje.FieldByName('DOCID').ReadOnly := False;
     DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := False;
     DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := False;
     DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := False;
     DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := False;
// Fin HPC_201707_CXP
    Begin
      if FRound( (DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat-DMCXP.cdsLetras.FieldByName('CPPAGLOC').AsFloat),15,2 ) <>
         FRound( DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat,15,2 ) then begin
         ShowMessage('Documento esta en trámite y no es elegible');
         exit;
      end;
      if Length(DMCXP.cdsLetras.FieldByName('CPSERIE').AsString)=0 then
         DMCXP.cdsDetCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPNODOC'
      else
         DMCXP.cdsDetCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';

      DMCXP.cdsDetCanje.SetKey;
      DMCXP.cdsDetCanje.FieldByName('CIAID').AsString   := DMCXP.cdsLetras.FieldByName('CIAID').AsString;
      DMCXP.cdsDetCanje.FieldByName('PROV').AsString    := DMCXP.cdsLetras.FieldByName('PROV').AsString;
      DMCXP.cdsDetCanje.FieldByName('DOCID').AsString   := DMCXP.cdsLetras.FieldByName('DOCID').AsString;
      if Length(DMCXP.cdsLetras.FieldByName('CPSERIE').AsString)=0 then
      else
         DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString := DMCXP.cdsLetras.FieldByName('CPSERIE').AsString;

      DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString := DMCXP.cdsLetras.FieldByName('CPNODOC').AsString;
      if not( DMCXP.cdsDetCanje.GotoKey ) then
      begin
         DMCXP.cdsDetCanje.Insert;
         DMCXP.cdsDetCanje.FieldByName('CIAID').AsString      := DMCXP.cdsLetras.FieldByName('CIAID').AsString;
         DMCXP.cdsDetCanje.FieldByName('CLAUXID').AsString    := trim(dblcClAux.Text) ;
         DMCXP.cdsDetCanje.FieldByName('PROV').AsString       := DMCXP.cdsLetras.FieldByName('PROV').AsString;
         DMCXP.cdsDetCanje.FieldByName('PROVRUC').AsString    := DMCXP.cdsLetras.FieldByName('PROVRUC').AsString;
         DMCXP.cdsDetCanje.FieldByName('DOCID').AsString      := DMCXP.cdsLetras.FieldByName('DOCID').AsString;
         DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString    := DMCXP.cdsLetras.FieldByName('CPSERIE').AsString;
         DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString    := DMCXP.cdsLetras.FieldByName('CPNODOC').AsString;
         DMCXP.cdsDetCanje.FieldByName('CPNOREG').AsString    := DMCXP.cdsLetras.FieldByName('CPNOREG').AsString;
         DMCXP.cdsDetCanje.FieldByName('TCANJEID').AsString   := 'NC';
         DMCXP.cdsDetCanje.FieldByName('CCPCANJE').AsString   := wCje;
         DMCXP.cdsDetCanje.FieldByName('DOCID2').AsString     := DMCXP.cdsMovCxP2.FieldByName('DOCID').AsString;
         DMCXP.cdsDetCanje.FieldByName('CPSERIE2').AsString   := DMCXP.cdsMovCxP2.FieldByName('CPSERIE').AsString;
         DMCXP.cdsDetCanje.FieldByName('CPNODOC2').AsString   := DMCXP.cdsMovCxP2.FieldByName('CPNODOC').AsString;
         DMCXP.cdsDetCanje.FieldByName('TMONID').AsString     := DMCXP.cdsLetras.FieldByName('TMONID').AsString;    // T.mon del doc - no modif.
         // vhn - Se puede Modificar
         DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := False;
         DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := False;
         DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := False;
         DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := False;
         DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsDateTime   := dtpFComp.Date;    // modif.
         // VHN 20/04/2003
         DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat  := DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat;
         DMCXP.cdsDetCanje.FieldByName('CPTCAMAJ').AsFloat  := strtofloat(dbeTCambio.Text);

         xFlagCal := False;
         //** 26/07/2001 - pjsv
         DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat  := DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat;
         //**
         DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat  := DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat;
         xFlagCal := False;
         DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat  := DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat;
         xFlagCal := True;

         // Reglas de Negocio
         If DMCXP.wVRN_PagosParciales='S' then
          begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            DMCXP.cdsDetCanje.FieldByName('DOCID').ReadOnly  := True;
            //DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := False;
            DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := True;
// Fin HPC_201707_CXP
            DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := True;
            DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := False;
            DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := False;
          end
         else
          begin
            DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := True;
            DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := True;
            DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := True;
            DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := True;
          end;
         //
         DMCXP.cdsDetCanje.FieldByName('SALLOC').AsFloat    := DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat;
         DMCXP.cdsDetCanje.FieldByName('SALEXT').AsFloat    := DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat;
         DMCXP.cdsDetCanje.FieldByName('DCDUSER').AsString  := DMCXP.wUsuario;
         DMCXP.cdsDetCanje.FieldByName('DCDFREG').AsdateTime:= date;
         DMCXP.cdsDetCanje.FieldByName('DCDHREG').AsDateTime:= time;
         DMCXP.cdsDetCanje.FieldByName('DCDAAAA').AsString  := DMCXP.cdsLetras.FieldByName('CPAAAA').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDMM').AsString    := DMCXP.cdsLetras.FieldByName('CPMM').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDDD').AsString    := DMCXP.cdsLetras.FieldByName('CPDD').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDTRI').AsString   := DMCXP.cdsLetras.FieldByName('CPTRI').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDSEM').AsString   := DMCXP.cdsLetras.FieldByName('CPSEM').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDSS').AsString    := DMCXP.cdsLetras.FieldByName('CPSS').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDANOMM').AsString := DMCXP.cdsLetras.FieldByName('CPANOMES').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDAATRI').AsString := DMCXP.cdsLetras.FieldByName('CPAATRI').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDAASEM').AsString := DMCXP.cdsLetras.FieldByName('CPAASEM').AsString;
         DMCXP.cdsDetCanje.FieldByName('DCDAASS').AsString  := DMCXP.cdsLetras.FieldByName('CPAASS').AsString;
         cdsPost( DMCXP.cdsDetCanje );
      end;
      DMCXP.cdsDetCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
      DMCXP.cdsDetCanje.first;
      xGlosa := '';
      while not DMCXP.cdsDetCanje.eof do
       begin
        If xGlosa = '' then xGlosa := 'Doc. '+DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString + ' - '
        else xGlosa := xGlosa + ' - Doc. '+DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString + ' - ';
        DMCXP.cdsDetCanje.next;
       end;
     bbtnSumatClick(Sender);
    end;
end;

procedure TFNotasDC.dbgPendientes2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgPendientes2.BeginDrag(False);
end;

procedure TFNotasDC.dbgDetCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFNotasDC.dbgDetCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   If Target=dbgPendientes2 Then
   Begin
      if Length(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString)=0 then
         DMCXP.cdsLetras.IndexFieldNames:='CIAID;PROV;DOCID;CPNODOC'
      else
         DMCXP.cdsLetras.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';

      DMCXP.cdsLetras.SetKey;
      DMCXP.cdsLetras.FieldByName('CIAID').AsString  :=DMCXP.cdsDetCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsLetras.FieldByName('PROV').AsString   :=DMCXP.cdsDetCanje.FieldByName('PROV').AsString;
      DMCXP.cdsLetras.FieldByName('DOCID').AsString  :=DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
      if Length(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString)>0 then
         DMCXP.cdsLetras.FieldByName('CPSERIE').AsString:=DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString;
      DMCXP.cdsLetras.FieldByName('CPNODOC').AsString:=DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString;
      if DMCXP.cdsLetras.GotoKey then
      begin
         DMCXP.cdsLetras.Edit;
         if wEstadTem <> '' then
            DMCXP.cdsLetras.FieldByName('CPESTADO').AsString := wEstadTem;
         DMCXP.cdsDetCanje.Delete;
      end;
      cdsPost( DMCXP.cdsLetras );
      DMCXP.cdsLetras.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
   end;
   If (Target=bbtnDel1) and (DMCXP.cdsDetCanje.RecordCount > 0) Then
      DMCXP.cdsDetCanje.Delete;
   DMCXP.cdsDetCanje.first;
   xGlosa := '';
   while not DMCXP.cdsDetCanje.eof do
   begin
      If xGlosa = '' then xGlosa := 'Doc. '+ DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString  + ' - '
      else xGlosa := xGlosa + ' - Doc. '+DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString  + ' - ';
      DMCXP.cdsDetCanje.next;
   end;
   bbtnSumatClick(Sender);
end;

procedure TFNotasDC.dbgDetCanjeMouseDown(Sender: TObject;
   Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDetCanje.BeginDrag(False);
end;

procedure TFNotasDC.Z2bbtnGrabaClick(Sender: TObject);
var
   xSql : String;
begin
   if not DMCXP.Accesos_a_Registros( DMCXP.cdsMovCxP2.fieldbyname('CPUSER').AsString ) then
      Exit;

   // vhn 20120703
   {if rgAplica.ItemIndex=1 then begin
      if DMCXP.cdsDetCanje.RecordCount<=0 then
         Raise exception.create('No hay Registros para el Detalle!');
   end;
   }

   DMCXP.cdsDetCxP.First;
   while not DMCXP.cdsDetCxP.Eof do begin
      if DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString='' then begin
         ShowMessage('Error : Falta Registrar Cuenta');
         Exit;
      end;
      DMCXP.cdsDetCxP.Next;
   end;

   DMCXP.cdsLetras.Filtered := False;
   DMCXP.cdsDetCanje.DisableControls;
   DMCXP.cdsDetCanje.First;
   DMCXP.cdsDetCanje.EnableControls;
   DMCXP.cdsLetras.Filtered := True;

   DMCXP.cdsMovCxP2.Edit;
   DMCXP.cdsMovCxP2.FieldByName('PROVDES').AsString :=edtProv.Text;
   DMCXP.cdsMovCxP2.FieldByName('CPGRAVAD2').AsFloat:=0;
   DMCXP.cdsMovCxP2.FieldByName('CPIGV2').AsFloat   :=0;
   DMCXP.cdsMovCxP2.FieldByName('CPNOGRAV').AsFloat :=0;
   DMCXP.cdsMovCxP2.FieldByName('CPGRAVAD').AsFloat :=0;
   DMCXP.cdsMovCxP2.FieldByName('CPIGV').AsFloat    :=0;
   DMCXP.cdsMovCxP2.FieldByName('CPISC').AsFloat    :=0;
   DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat :=0;
   DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat :=0;
   DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat :=0;

   if rgAplica.ItemIndex = 0 then
   begin
      DMCXP.cdsMovCxP2.FieldByName('CPSALORI').AsFloat:=0;   // necesario?
      DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsFloat:=0;   // necesario?
      DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsFloat:=0;   // necesario?
   end
   else begin
      DMCXP.cdsMovCxP2.FieldByName('CPSALORI').AsFloat:= FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat,15,2);
      DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsFloat:= FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat,15,2);
      DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsFloat:= FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat,15,2);
   end;
  {
  if cbSujetoaRetIGV.Checked then
     DMCXP.cdsMovCxP2.fieldbyname('PROVRETIGV').AsString := 'S'   // Indica que el Documento está sujeto a retención IGV.
  else
     DMCXP.cdsMovCxP2.fieldbyname('PROVRETIGV').AsString := 'N';  // Indica que el Documento No está sujeto a retención IGV.
  }

   DMCXP.cdsDetCxP.DisableControls;

   Items;

   DMCXP.cdsDetCxP.First;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   try
          xSQL := 'CALL SP_CNT_DEL_NOT_CRE_DET('
          +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CIAID').AsString)+','
          +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString)+','
          +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString)+','
          +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString)
          +')' ;
          DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);

   Except
          showmessage('Error al intentar eliminar el detalle de la nota de crédito');
          exit;
   Raise;
   End;
// Fin HPC_201707_CXP
   while not DMCXP.cdsDetCxP.Eof do begin

      if DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MG' then
         DMCXP.cdsMovCxP2.FieldByName('CPGRAVAD').AsFloat:=DMCXP.cdsMovCxP2.FieldByName('CPGRAVAD').AsFloat  +DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      if DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'NG' then
         DMCXP.cdsMovCxP2.FieldByName('CPGRAVAD2').AsFloat:=DMCXP.cdsMovCxP2.FieldByName('CPGRAVAD2').AsFloat+DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      if DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MN' then
         DMCXP.cdsMovCxP2.FieldByName('CPNOGRAV').AsFloat:=DMCXP.cdsMovCxP2.FieldByName('CPNOGRAV').AsFloat  +DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      if DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I1' then
         DMCXP.cdsMovCxP2.FieldByName('CPIGV').AsFloat   :=DMCXP.cdsMovCxP2.FieldByName('CPIGV').AsFloat     +DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      if DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I2' then
         DMCXP.cdsMovCxP2.FieldByName('CPISC').AsFloat   :=DMCXP.cdsMovCxP2.FieldByName('CPISC').AsFloat     +DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      if DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I3' then
         DMCXP.cdsMovCxP2.FieldByName('CPIGV2').AsFloat  :=DMCXP.cdsMovCxP2.FieldByName('CPIGV2').AsFloat    +DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      if DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'DC' then
         DMCXP.cdsMovCxP2.FieldByName('CPDCTO').AsFloat  :=DMCXP.cdsMovCxP2.FieldByName('CPDCTO').AsFloat    +DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      if DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'SV' then
         DMCXP.cdsMovCxP2.FieldByName('CPSERVIC').AsFloat:=DMCXP.cdsMovCxP2.FieldByName('CPSERVIC').AsFloat  +DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      if DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'TO' then begin
         DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat:=DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat  +DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         DMCXP.cdsMovCxP2.FieldByName('CTATOTAL').AsString:=DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString;
         DMCXP.cdsMovCxP2.FieldByName('CPTOTOT').DisplayWidth := 15;
         DMCXP.cdsMovCxP2.FieldByName('CPTOTOT').AsString :=DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString;
      end;

      // Actualiza Montos en Moneda L y E
      DMCXP.cdsDetCxP.Edit;
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'I';
      DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString :=dbeLote.Text;
      DMCXP.cdsDetCxP.FieldByName('TMONID').AsString  :=dblcTMon.Text;
      if dblcTMon.Text = DMCXP.wTMonLoc then
      begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat/DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat,15,2);
      end
      else begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat*DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat,15,2);
      end;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      //cdsPost( DMCXP.cdsDetCxP );
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat   :=strtofloat(dbeTCambio.Text);
      try
          xSQL := 'CALL SP_CNT_ING_NOT_CRE_DET('
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CIAID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPCOMP').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DOCID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CCOSID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPFLCDR').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPFLAUT').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TREGID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TMONID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('FLAGVAR').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CANJE').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('PARPRESID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPPRORORI').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPPRORMOLOC').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPPRORMOEXT').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TIPPRESID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPREG').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CXPRRHH').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('PROVRUC').AsString)
            +')' ;
            DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);
      Except
          showmessage('Error al intentar grabar el detalle de la nota de crédito');
          exit;
      Raise;
      End;
// Fin HPC_201707_CXP
      DMCXP.cdsDetCxP.Next;
   end;
   DMCXP.cdsDetCxP.EnableControls;

   // Adicion de VHN
   DMCXP.CuadraAsiento;

   // ya k pueden cambiar en cualquier momento se asignan aqui
   DMCXP.cdsMovCxP2.FieldByName('DCPLOTE').AsString   :=dbeLote.Text;
   DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString    :=dblcTMon.Text;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   IF DMCXP.cdsDetCxP.recordcount>0 then
      DMCXP.cdsMovCxP2.FieldByName('CPTCAMPR').AsFloat   :=strtofloat(DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsString)
   else
      DMCXP.cdsMovCxP2.FieldByName('CPTCAMPR').AsFloat   :=strtofloat(dbeTCambio.Text);
// Fin HPC_201707_CXP
   DMCXP.cdsMovCxP2.FieldByName('CPTCAMPA').AsFloat   :=strtofloat(dbeTCambio.Text);
   DMCXP.cdsMovCxP2.FieldByName('CPTCAMAJ').AsFloat   :=strtofloat(dbeTCambio.Text);
   DMCXP.cdsMovCxP2.FieldByName('CPFRECEP').AsDateTime:=dbdtpFRecep.Date;
   DMCXP.cdsMovCxP2.FieldByName('CPFEMIS').AsDateTime :=dbdtpFEmis.Date;

   if dblcTMon.Text = DMCXP.wTMonLoc then
   begin
      DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').Asfloat:=FRound(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat,15,2);
      DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat:=FRound(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsMovCxP2.FieldByName('CPTCAMPA').AsFloat,15,2);
   end
   else begin
      DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat:=FRound(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat,15,2);
      DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat:=FRound(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsMovCxP2.FieldByName('CPTCAMPA').AsFloat,15,2);
   end;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   //cdsPost( DMCXP.cdsMovCxP2 );
   //DMCXP.cdsMovCxP2.Post;

   If length(DMCXP.cdsMovCxP2.FieldByName('CPDCTO').AsString)=0 Then
   Begin                                        
       DMCXP.cdsMovCxP2.Edit;
       DMCXP.cdsMovCxP2.FieldByName('CPDCTO').AsString := '0.0';
       DMCXP.cdsMovCxP2.Post;
   End;
   If length(DMCXP.cdsMovCxP2.FieldByName('CPSERVIC').AsString)=0 Then
   Begin
       DMCXP.cdsMovCxP2.Edit;
       DMCXP.cdsMovCxP2.FieldByName('CPSERVIC').AsString := '0.0';
       DMCXP.cdsMovCxP2.Post;
   End;
   DMCXP.cdsMovCxP2.Edit;
   DMCXP.cdsMovCxP2.FieldByName('CPFLAGTDOC').AsString := IntToStr(rgDoc.itemindex);
   try
      xSQL := 'CALL SP_CNT_UPD_NOT_CRE_CAB('
      +'''I'','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString)+',' 
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('PROVDES').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('DCPLOTE').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPTCAMPR').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPTCAMAJ').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPFRECEP').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPFEMIS').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPDCTO').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSERVIC').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPGRAVAD2').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPIGV2').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPNOGRAV').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPGRAVAD').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPIGV').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPISC').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSALORI').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsString)+','

      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPFVCMTO').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPTCAMPA').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('TCANJEID').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPFCANJE').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPAAAA').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPMM').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPDD').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPTRI').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSEM').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSS').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPAATRI').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPAASEM').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPAASS').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CTATOTAL').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPTOTOT').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPFLAGTDOC').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('ADQ_NO_GRAV').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('IGV_GRA_NO_DEST').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CP_OTROS').AsString)

      +')' ;
      DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);
    Except
        showmessage('Error al intentar grabar la cabecera de la nota de crédito');
        exit;
    Raise;
    End;
// Fin HPC_201707_CXP

// Inicia HPC_201401_CXP
      //DMCXP.AplicaDatos(DMCXP.cdsMovCxP2, 'MovCxP2');
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      {if DMCXP.cdsMovCxP2.ApplyUpdates(0)>0 then
      begin
         ShowMessage('No se pudo actualizar');
         exit;
      end; }
// Fin HPC_201707_CXP
      //DMCXP.AplicaDatos( DMCXP.cdsLetras,  'Letras'   );
      if DMCXP.cdsLetras.ApplyUpdates(0)>0 then
      begin
         ShowMessage('No se pudo actualizar');
         exit;
      end;
      //DMCXP.AplicaDatos( DMCXP.cdsDetCxP,  'DetCxP'   );
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      {if DMCXP.cdsDetCxP.ApplyUpdates(0)>0 then
      begin
         ShowMessage('No se pudo actualizar');
         exit;
      end; }
// Fin HPC_201707_CXP
      //DMCXP.AplicaDatos( DMCXP.cdsDetCanje,  'DetCanje'   );
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   DMCXP.cdsDetCanje.First;

   try
          xSQL := 'CALL SP_CNT_DEL_APLI_DOC_REF('
          +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CIAID').AsString)+','
          +QuotedStr(DMCXP.cdsDetCanje.FieldByName('PROV').AsString)+','
          +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CCPCANJE').AsString)
          +')' ;
          DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);

   Except
          showmessage('Error al intentar eliminar documentos de aplicación');
          exit;
   Raise;
   End;


   while not DMCXP.cdsDetCanje.Eof do begin
      try
        xSQL := 'CALL SP_CNT_ING_APLI_DOC_REF('
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CIAID').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('PROV').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('PROVRUC').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DOCID').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CPNOREG').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('TCANJEID').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CCPCANJE').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DOCID2').AsString)+','   //
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CPSERIE2').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CPNODOC2').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('TMONID').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DCDUSER').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DCDAAAA').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DCDMM').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DCDDD').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DCDTRI').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DCDSEM').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DCDSS').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DCDANOMM').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DCDAATRI').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DCDAASEM').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DCDAASS').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('FLAGVAR').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CJEANTMN').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CJEANTME').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('SALLOC').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('SALEXT').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CLAUXID').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CAJAAAMM').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CAJACOMP').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CAJATDIAR').AsString)+','
        +QuotedStr(DMCXP.cdsDetCanje.FieldByName('CPTCAMAJ').AsString)
        +')' ;
        DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);
      Except
          showmessage('Error al intentar grabar los documentos de referencia de la nota de crédito');
          exit;
      Raise;
      End;
      DMCXP.cdsDetCanje.Next;
   End;
      {if DMCXP.cdsDetCanje.ApplyUpdates(0)>0 then
      begin
         ShowMessage('No se pudo actualizar');
         exit;
      end;}
// Fin HPC_201707_CXP
   xsql := 'TCANJEID='+quotedstr(DMCXP.cdsCanje.FieldByName('TCANJEID').AsString)+' AND CCPCANJE='+quotedstr(DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString);

   //DMCXP.AplicaDatos( DMCXP.cdsCanje,  'Canje'   );
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   DMCXP.cdsCanje.First;

   try
          xSQL := 'CALL SP_CNT_DEL_DOC_REF('
          +QuotedStr(DMCXP.cdsCanje.FieldByName('CIAID').AsString)+','
          +QuotedStr(DMCXP.cdsCanje.FieldByName('PROV').AsString)+','
          +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString)
          +')' ;
          DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);

   Except
          showmessage('Error al intentar eliminar documentos de referencia');
          exit;
   Raise;
   End;



   while not DMCXP.cdsCanje.Eof do begin
      try
        xSQL := 'CALL SP_CNT_ING_DOC_REF('
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CIAID').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('TDIARID').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CPNOREG').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPANOC').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('PROVRUC').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('PROV').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('DOCID').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CPSERIE').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CPNODOC').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('TCANJEID').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPFCJE').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('TMONID').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPTCLET').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPMOORI').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CPSALORI').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CPSALLOC').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CPSALEXT').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPESTDO').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPUSER').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPMM').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPDD').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPTRI').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPSEM').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPSS').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPAATRI').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPAASEM').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CCPAASS').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CTATOTAL').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('FLAGVAR').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CPTOTOT').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CPFVCMTO').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('SALREAL').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('MTOCANAN').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CJEANTMN').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CJEANTME').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CPFEMIS').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CLAUXID').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('TDIARID2').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CPANOMES').AsString)+','
        +QuotedStr(DMCXP.cdsCanje.FieldByName('CPNOREG2').AsString)
        +')' ;
        DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);
      Except
          showmessage('Error al intentar grabar los documentos de referencia de la nota de crédito');
          exit;
      Raise;
      End;
      DMCXP.cdsCanje.Next;
   End;

      {if DMCXP.cdsCanje.ApplyUpdates(0)>0 then
      begin
         ShowMessage('No se pudo actualizar');
         exit;
      end;}
// Fin HPC_201707_CXP
// Finaliza HPC_201401_CXP

   FiltraGrids;

   EstadoDeForma(1,DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString,DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString );
   Z2bbtnPreview.Enabled := True;
   ShowMessage('Registro Grabado con Exito... Pulse Intro para continuar');
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   {if DMCXP.wTipoAdicion='xFiltro' then
   begin
      DMCXP.ActualizaFiltro(FPrincipal.GNCredito,DMCXP.cdsMovCxP2,DMCXP.wModo);
   end;}
   if DMCXP.wTipoAdicion='xFiltro' then
   begin
      //DMCXP.ActualizaFiltro(FPrincipal.GNCredito,DMCXP.cdsMovCxP2,DMCXP.wModo);
      DMCXP.ActualizaFiltro(FPrincipal.GNCredito,DMCXP.cdsMovCxP2,'M');
   end;

   DMCXP.cdsCanje.FieldByname('DOCID').ReadOnly := True;
   DMCXP.cdsCanje.FieldByname('CPSERIE').ReadOnly := True;
   DMCXP.cdsCanje.FieldByname('CPNODOC').ReadOnly := True;
   DMCXP.cdsCanje.FieldByname('CCPFCJE').ReadOnly := True;
   DMCXP.cdsCanje.FieldByname('CCPTCCJE').ReadOnly := True;
   DMCXP.cdsCanje.FieldByname('CCPMOLOC').ReadOnly := True;
   DMCXP.cdsCanje.FieldByname('CCPMOEXT').ReadOnly := True;

// Fin HPC_201707_CXP
   //INICIO SAR666
   //para que recalcule los totales para el PLE
   RecalculaTotales;
   //FIN SAR666
   xFlagGr := False;
   wRegGrab:=True;

end;

procedure TFNotasDC.bbtnCancelaClick(Sender: TObject);
begin
   // Cancela todas las modificaciones en los
   DMCXP.cdsLetras.CancelUpdates   ;
   DMCXP.cdsDetCxP.CancelUpdates   ;
   DMCXP.cdsMovCxP2.CancelUpdates  ;
   DMCXP.cdsMovCxP.CancelUpdates   ;
   DMCXP.cdsCanje.CancelUpdates    ;
   DMCXP.cdsDetCanje.CancelUpdates ;
   Z2bbtnPreview.Enabled := False;
   EstadoDeForma(0,DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString,DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString );
end;

procedure TFNotasDC.dblcTipRegExit(Sender: TObject);
Var
   xWhere : String;
begin
   if not bbtnRegCanc.Focused then
      begin
      edtTipReg.Text:=DMCXP.DisplayDescrip('TGE113','TREGDES','TRegID',dblcTipReg.Text);
      if length(edtTipReg.Text)=0 then
      begin
         ShowMessage('Debe Ingresar Tipo de Registro');
         dblcTipReg.SetFocus;
         exit;
      end;
      if DMCXP.cdsDetCxP.State=dsInsert then begin
         LlenaDetCxp;
         DMCXP.cdsDetCxP.FieldByName('TREGID').AsString  :=dblcTipReg.Text;
         xWhere := 'TRegId='+''''+dblcTipReg.Text+'''';
         DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString:=BuscaQry('PrvTGE','TGE113','*',xWhere,'TIPDET');
         if DMCXP.cdsQry.fieldbyname('DCPDH').AsString='D' then
            DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString:='H'
         else
            DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString:='D';
      end;

      if DMCXP.cdsDetCxP.State=dsInsert then
      begin
         if DMCXP.cdsDetCxP.fieldbyname('TMONID').AsString=DMCXP.wTMonLoc then // si es en moneda local
            begin
               DMCXP.cdsDetCxP.fieldbyname('CPTOID').AsString  :=DMCXP.cdsQry.fieldbyname('CPTOMN').AsString;
               DMCXP.cdsDetCxP.fieldbyname('CUENTAID').AsString:=DMCXP.cdsQry.fieldbyname('CUENTAMN').AsString;
            end
         else begin
            DMCXP.cdsDetCxP.fieldbyname('CPTOID').AsString  :=DMCXP.cdsQry.fieldbyname('CPTOME').AsString;
            DMCXP.cdsDetCxP.fieldbyname('CUENTAID').AsString:=DMCXP.cdsQry.fieldbyname('CUENTAME').AsString;
         end;
         If Length( DMCXP.cdsDetCxP.fieldbyname('CUENTAID').AsString )>0 then begin
            dblcdCnpEgrExit(sender);
         end;
      end;
      
      //Inicio SAR666
      if DMCXP.cdsDetCxP.FieldByName('TREGID').AsString='01' then
      begin
         dblcImpuesto.Text := '03';
         if dblcTDiario.Text = '19' then dblcImpuesto.Text := '12'; // 4ta categoría
      end;
      if DMCXP.cdsDetCxP.FieldByName('TREGID').AsString='02' then
      begin
         dblcImpuesto.Text := '04';
      end;
      if DMCXP.cdsDetCxP.FieldByName('TREGID').AsString='06' then
      begin
         dblcImpuesto.Text := '09';
      end;
      dblcImpuesto.Enabled := False;
      edtImpuesto.Text:=DMCXP.DisplayDescrip('TGE113','TREGDES','TREGID',dblcImpuesto.Text);
      //Fin SAR666

      dblcdCnpEgr.Enabled:=True;
      DMCXP.cdsCnpEgr.IndexFieldNames:='CptoDes';
      DMCXP.cdsCCosto.IndexFieldNames:='CCosDes';
   end; // si no se apretó botón de cancelar
end;

procedure TFNotasDC.dblcdCnpEgrExit(Sender: TObject);
var
  xsql, ssql, xWhere, xxCta : string;
begin
   if xCrea then exit;

   if bbtnRegCanc.Focused then Exit;

   xxCta:=DMCXP.DisplayDescrip2('prvSQL','CXP201','CPTOID, CPTODES, NIVELMOV, CUENTAID','CPTOID='+quotedStr(dblcdCnpEgr.text),'CPTOID');

   if DMCXP.cdsQry.FieldByName('CPTOID').AsString='' then
   begin
      DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString  :='';
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:='';
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString:='';
      ShowMessage('Error : Código de Concepto No Existe ');
      dblcdCnpEgr.SetFocus;
      Exit;
   end;
   if DMCXP.cdsQry.FieldByName('NIVELMOV').ASString ='N'  then
   begin
      DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString  :='';
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:='';
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString:='';
      ShowMessage( 'Error : Solo puede Seleccionar un Codigo de Concepto de Ultimo Nivel ');
      dblcdCnpEgr.SetFocus;
      Exit;
   end;

   DMCXP.cdsDetCxP.edit;

   DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString:=DMCXP.cdsQry.fieldbyname('CUENTAID').AsString;

   if xGlosaRep<>'' then
       DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:=xGlosaRep
   else
   begin
      if (DMCXP.wSRV_RUTA='\\INCORESA') then
        DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:=edtProv.Text
      else
      begin
       if DMCXP.wVRN_GlosaDup='N' then
          DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:=DMCXP.cdsCnpEgr.FieldByName('CPTODES').AsString
       else
       begin
          DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:=DMCXP.cdsCnpEgr.FieldByName('CPTODES').AsString;
       end;
      end;
   END;
	xGlosa := DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString;

   xMensaje:='';

   //** (2) si la cuenta contable exite
	xWhere:='CIAID='+Quotedstr(dblcCia.text)+' and CUENTAID='+quotedstr(DMCXP.cdsQry.fieldbyname('CUENTAID').AsString);
   if length(BuscaQry('PrvTGE','TGE202','CUENTAID, CTA_CCOS, CTAACT',xWhere,'CUENTAID'))>0 then
   begin

      // VHNDEMA 20060109
	  	if DMCXP.cdsQry.FieldByName('CTAACT').AsString='N' then
	  	begin
         ShowMessage('Cuenta Contable NO ESTA ACTIVA. VERIFICAR CON CONTABILIDAD');
         dblcdCnpEgr.SetFocus;
         exit;
      end;
      // END VHNDEMA

      //** (3) si lleva Centro de Costo
      if DMCXP.cdsQry.FieldByName('CTA_CCOS').AsString = 'S' then
      begin
         xCta_Ccos := 'S';
         //**(4) 03/09/2001 - pjsv, si Tiene Marcado el Flag de Distribucion por C.Costo
         if BuscaQry('PrvCxP','CXP201','CCOSPORCEN',xWhere,'CCOSPORCEN') = 'S' then
         begin
            //** 03/09/2001 - pjsv, si Tiene Marcado el Flag de Distribucion por C.Costo
            xsql := 'SELECT sum(PORCENTAJE) TOTAL from CXP102  where ciaid='+quotedstr(dblcCia.text)+
                    ' and CPTOID='+quotedstr(dblcdCnpEgr.text);
            DMCXP.cdsQry3.Close;
            DMCXP.cdsQry3.ProviderName := 'dspTGE';
            DMCXP.cdsQry3.DataRequest(xSql);
            DMCXP.cdsQry3.Open;
            //** si suman el 100%
            If DMCXP.cdsQry3.FieldByName('TOTAL').AsFloat = 100 then
               xMensaje := '1'
            else
               xMensaje := '2';
         end
         else
            xMensaje := '2';

      end
      else
      begin
         xMensaje := '2';
         xCta_Ccos := 'N';
         dblcdCCosto.text:='';
         dblcdCCosto.Enabled:=False;
      end;

   end
   else
   begin
      ShowMessage('Cuenta Contable NO existe para la Compañía indicada');
      dblcdCnpEgr.SetFocus;
      exit;
//			Raise Exception.Create('No tiene Cuenta Contable');
   end;


   If xMensaje = '1' then
   begin
      If strTemp <> dblcdCnpEgr.text then
      begin
         if MessageDlg('¿ Distribución de C.C. Automática ?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
         begin
            xDistri := 'S';
            dblcdCCosto.text:='';
            dblcdCCosto.Enabled:=false;
         end
         else
            xDistri := '';
      end;
   end
   else xDistri := '';

   //** si la distribucion es Manual y la Cuenta si Tiene Centro de Costo
   If (xDistri = '') and (xCta_Ccos ='S') then
   begin

      dblcdCCosto.text:='';
      dblcdCCosto.Enabled:=true;

      xWhere := 'CIAID='''+dblcCia.Text+''' and CuentaId='+''''+dbeCuenta.Text+'''';

      BuscaQry('PrvTGE','TGE202','*',xWhere,'CuentaId');
      if (DMCXP.cdsQry.fieldbyname('CTA_PRES').Value='S') and (wActuaPresu = true) then
      begin
         //** 08/10/2000 Percy, para el tipo de presupuesto
         dblcTipPre.Enabled:=true;
         dblcdPresup.Enabled:=true;
         lblPresu.Enabled:=true;
         lblTipPre.Enabled:=true;
         //**
      end
      else
      begin
         dblcTipPre.Enabled:=false;
         dbeTipPre.Text := '';
         dblcdPresup.Enabled:=false;
         lblTipPre.Enabled:=false;
         lblPresu.Enabled:=false;
      end;
   end;

{
   if xCrea  = true then exit;
   if not bbtnRegCanc.Focused then
    begin
     //** Validaciones
     xWhere := 'CPTOID='+quotedstr(dblcdCnpEgr.Text);
     //** (1) si se digito Concepto
     if length(BuscaQry('PrvCxP','CXP201','*',xWhere,'CPTOID'))>0 then
      begin
       DMCXP.cdsDetCxP.edit;
       //** cargo cuenta contable
       DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString:=DMCXP.cdsQry.fieldbyname('CUENTAID').AsString;
       //** cargo glosa
//       if Length(DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString)=0 then
//       If Length(dbeGlosa.text) = 0 then
         DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:=DMCXP.cdsQry.fieldbyname('CPTODES').AsString;
       xGlosa := DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString;
       //** (2) si la cuenta contable exite
       xWhere := 'CuentaId='+quotedstr(DMCXP.cdsQry.fieldbyname('CUENTAId').AsString);
       if length(BuscaQry('PrvTGE','TGE202','CUENTAID',xWhere,'CUENTAID'))>0 then
        begin
         //** (3) si lleva Centro de Costo
         if BuscaQry('PrvTGE','TGE202','CTA_CCOS',xWhere,'CTA_CCOS') = 'S' then
          begin
            xCta_Ccos := 'S';
           //**(4) 03/09/2001 - pjsv, si Tiene Marcado el Flag de Distribucion por C.Costo
           if BuscaQry('PrvCxP','CXP201','CCOSPORCEN',xWhere,'CCOSPORCEN') = 'S' then
            begin
             //** 03/09/2001 - pjsv, si Tiene Marcado el Flag de Distribucion por C.Costo
             xsql := 'SELECT sum(PORCENTAJE) TOTAL from CXP102  where ciaid='+quotedstr(dblcCia.text)+
                     ' and CPTOID='+quotedstr(dblcdCnpEgr.text);
             DMCXP.cdsQry3.Close;
             DMCXP.cdsQry3.ProviderName := 'dspTGE';
             DMCXP.cdsQry3.DataRequest(xSql);
             DMCXP.cdsQry3.Open;
             //** si suman el 100%
             If DMCXP.cdsQry3.FieldByName('TOTAL').AsFloat = 100 then
              xMensaje := '1'
             else xMensaje := '2';
            end
           else  xMensaje := '2';
          end
         else
          begin
           xMensaje := '2';
           xCta_Ccos := 'N'
          end;
        end
       else Raise Exception.Create('No tiene Cuenta Contable');
      end
     else  Raise Exception.Create('No se a digitado Concepto');
    end;

    If xMensaje = '1' then
     begin
       If strTemp <> dblcdCnpEgr.text then
        begin
         if MessageDlg('¿ Distribución de C.C. Automática ?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
          begin
           xDistri := 'S';
           dblcdCCosto.Enabled:=false;
          end
         else
           xDistri := '';
        end;
     end
    else xDistri := '';

    //** si la distribucion es Manual y la Cuenta si Tiene Centro de Costo
    If (xDistri = '') and (xCta_Ccos ='S') then
    begin
      //** 17/11/2000 PJSV
      ssql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
      DMCXP.cdsCCosto.Close;
      DMCXP.cdsCCosto.DataRequest(ssql);
      DMCXP.cdsCCosto.open;
      If DMCXP.cdsCCosto.recordcount > 0 then
         dblcdCCosto.Enabled:=true;
    end;

     xWhere := 'CPTOID='+quotedstr(dblcdCnpEgr.Text);
     BuscaQry('PrvCxP','CXP201','*',xWhere,'CPTOID');
     xWhere := 'CuentaId='+''''+DMCXP.cdsQry.fieldbyname('CUENTAId').AsString+'''';
     BuscaQry('PrvTGE','TGE202','*',xWhere,'CuentaId');
     if (DMCXP.cdsQry.fieldbyname('CTA_PRES').Value='S') and (wActuaPresu = true) then
      begin
       //** 08/10/2000 Percy, para el tipo de presupuesto
       dblcTipPre.Enabled:=true;
       dblcdPresup.Enabled:=true;
       lblPresu.Enabled:=true;
       lblTipPre.Enabled:=true;
       //**
      end
     else
      begin
       dblcTipPre.Enabled:=false;
       dbeTipPre.Text := '';
       dblcdPresup.Enabled:=false;
       lblTipPre.Enabled:=false;
       lblPresu.Enabled:=false;
      end;
}
end;


procedure TFNotasDC.bbtnBorraClick(Sender: TObject);
var
   xWhere : String;
begin
   If DMCXP.wModo='A' then
      begin
         if xFlagGr then begin
            DMCXP.cdsLetras.CancelUpdates;
            DMCXP.cdsDetCxP.CancelUpdates;
            DMCXP.cdsMovCxP.CancelUpdates;
            DMCXP.cdsCanje.CancelUpdates;
            DMCXP.cdsDetCanje.CancelUpdates;
            DMCXP.cdsMovCxP2.Delete;
// Inicia HPC_201401_CXP
            //DMCXP.AplicaDatos(DMCXP.cdsMovCxP2, 'MovCxP2');
            if DMCXP.cdsMovCxP2.ApplyUpdates(0)>0 then
            begin
               ShowMessage('Error, No se puede eliminar');
               exit;
            end;
// Finaliza HPC_201401_CXP
            DMCXP.cdsMovCxP2.Insert;
            DMCXP.cdsMovCxP2.FieldByName('DOCID').AsString := wTDoc;
            edtCia.Text   := '';
            edtProv.text  := '';
            edtSerie.Text := '';
            edtNoDoc.Text := '';
            end
         else begin
            if Length(DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString)=0 then begin
               DMCXP.cdsMovCxP2.CancelUpdates;
               DMCXP.cdsMovCxP2.Insert;
               DMCXP.cdsMovCxP2.FieldByName('DOCID').AsString := wTDoc;
               edtCia.Text   := '';
               edtProv.text  := '';
               edtSerie.Text := '';
               edtNoDoc.Text := '';
               end
            else begin
               DMCXP.cdsMovCxP2.CancelUpdates;
               xWhere       := 'TMonId='+''''+dblcTMon.Text+''''+' and (TMon_Loc='+''''+'L'+''''+' or TMon_Loc='+''''+'E'+''''+')';
               edtTMon.Text := BuscaQry('PrvTGE','TGE103','TMONDES',xWhere,'TMONDES');
            end;
         end;
      end
   else begin
      DMCXP.cdsMovCxP2.CancelUpdates;
      xWhere       := 'TMonId='+''''+dblcTMon.Text+''''+' and (TMon_Loc='+''''+'L'+''''+' or TMon_Loc='+''''+'E'+''''+')';
      edtTMon.Text := BuscaQry('PrvTGE','TGE103','TMONDES',xWhere,'TMONDES');
   end;
   EstadoDeForma(0,DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString,' ' );
end;

procedure TFNotasDC.bbtnSumatClick(Sender: TObject);
begin
   with DMCXP do Begin
      CalculaTotalDetCje;
      dbgDetCanje.ColumnByName('CPNoDoc').FooterValue:='Totales';
      if dblcTMon.Text = wTMonExt then
       begin
         dbgDetCanje.ColumnByName('DCDMoExt').FooterValue:=floattostrf(wTDev2,ffNumber,15,2);
         //** 13/07/2001 - pjsv
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
         If (dbeTCambio.text <> '') and (dbeTCambio.text <> '0') and (DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat>0) then
          //dbgDetCanje.ColumnByName('DCDMoLoc').FooterValue:= floattostrf(wTDev2*StrToFloat(dbeTCambio.text),ffNumber,15,2);
          dbgDetCanje.ColumnByName('DCDMoLoc').FooterValue:= floattostrf(wTDev2*DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat,ffNumber,15,2);
// Fin HPC_201707_CXP
       end
      else
       begin
         dbgDetCanje.ColumnByName('DCDMoLoc').FooterValue:=floattostrf(wTDev2,ffNumber,15,2);
         //** 13/07/2001 - pjsv
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
         If (dbeTCambio.text <> '') and (dbeTCambio.text <> '0') and (DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat>0) then
          //dbgDetCanje.ColumnByName('DCDMoExt').FooterValue:= floattostrf(wTDev2/StrToFloat(dbeTCambio.text),ffNumber,15,2);
          try
            dbgDetCanje.ColumnByName('DCDMoExt').FooterValue:= floattostrf(wTDev2/DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat,ffNumber,15,2);
          except
          end;
// Fin HPC_201707_CXP
       end;
   End;
end;

procedure TFNotasDC.bbtnGen302Click(Sender: TObject);
Var
   I: Integer;
   wTasa, wSubT: double;
begin
   DMCXP.cdsTipReg.IndexFieldNames:='TIPDET';
   with DMCXP do Begin

			wSubT:=0;
			if wTDev2=0 then
			begin
				 Showmessage('Ingrese un Monto mayor a 0');
				 exit;
			end;

      cdsDetCxP.Filtered:=True;     // Filtra los registros en DetCxP Ingresados
      if (cdsDetCxP.RecordCount=0) then begin   // N.de Credito nueva
         numreg:=numreg+1;
         DMCXP.cdsDetCxP.Last;
         numreg:=DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger;

         cdsDetCxP.fieldbyname('CUENTAID').ReadOnly:=False;   //  por problems al crear
         cdsCnpEgr.IndexFieldNames  :='CptoId';
         cdsTipReg.SetKey;
         cdsTipReg.fieldbyname('TIPDET').AsString:='I1';
         cdsTipReg.Gotokey;
         wTasa:=1+(cdsTipReg.fieldbyname('TASA').AsFloat/100);
         //INICIO HPP_201101_CXP
         if dtpFComp.date <= StrToDate('28/02/2011')  then
            wTasa := 0.19;
         //FIN HPP_201101_CXP
         for I:=1 to 3 do begin      //llena el archivo contable (sugerido)
             cdsDetCxP.Insert;
             numreg:=numreg+1;
             DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  := numreg;
             LlenaDetCxP;

             cdsPost( DMCXP.cdsDetCxP );

             cdsTipReg.SetKey;
             if I=1 then cdsTipReg.fieldbyname('TIPDET').AsString:='MG';
             if I=2 then cdsTipReg.fieldbyname('TIPDET').AsString:='I1';
             if I=3 then cdsTipReg.fieldbyname('TIPDET').AsString:='TO';
             cdsTipReg.Gotokey;
             // Valida si el archivo esta con definicion minima
             //
             cdsDetCxP.Edit;
             cdsDetCxP.FieldByName('TREGID').AsString := DMCXP.cdsTipReg.fieldbyname('TREGID').AsString;
             cdsDetCxP.FieldByName('TIPDET').AsString := DMCXP.cdsTipReg.fieldbyname('TIPDET').AsString;
             if DMCXP.cdsTipReg.fieldbyname('DCPDH').AsString='D' then
                cdsDetCxP.fieldbyname('DCPDH').AsString  := 'H'
             else begin
                cdsDetCxP.fieldbyname('DCPDH').AsString  := 'D';
             end;
             if dblcTMon.Text = wTMonExt then begin
                cdsDetCxP.fieldbyname('CPTOID').AsString  := DMCXP.cdsTipReg.fieldbyname('CPTOME').AsString;
                cdsDetCxP.fieldbyname('CUENTAID').AsString:= DMCXP.cdsTipReg.fieldbyname('CUENTAME').AsString;
             end
             else begin
                cdsDetCxP.fieldbyname('CPTOID').AsString  := DMCXP.cdsTipReg.fieldbyname('CPTOMN').AsString;
                cdsDetCxP.fieldbyname('CUENTAID').AsString:= DMCXP.cdsTipReg.fieldbyname('CUENTAMN').AsString;
             end;
             cdsCnpEgr.IndexFieldNames  :='CptoId';
             cdsCnpEgr.SetKey;
             cdsCnpEgr.FieldByName('CPTOID').AsString := DMCXP.cdsDetCxP.fieldbyname('CPTOID').AsString;
             if cdsCnpEgr.Gotokey then
               cdsDetCxP.fieldbyname('DCPGLOSA').AsString := xGlosa + ' '+DMCXP.cdsCnpEgr.FieldByName('CPTODES').AsString;
//           Deberia validar integridad: si la cta de Cpto esta en Cuentas

             if I=1 then begin
                wSubT:=FRound((wTDev2/wTasa),15,2);
                DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := wSubT;
             end;
             if I=2 then begin
                if (wSubt+FRound(wSubT*(wTasa-1),15,2))=wTDev2 then
                   DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := FRound(wSubT*(wTasa-1),15,2)
                else begin
                   DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := FRound(wTDev2-wSubT,15,2);
                end;
             end;
             if I=3 then begin
                DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := wTDev2;
             end;

             cdsPost( DMCXP.cdsDetCxP );

         end;  // endFor
         cdsDetCxP.Post;
      end;
      bbtnGen302.Enabled:=False;
   end;

   DMCXP.cdsTipReg.IndexFieldNames:='TREGID';
end;

procedure TFNotasDC.dbgDetCxPEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   If Target=bbtnDel1 then begin
     if DMCXP.cdsDetCxP.RecordCount > 0 then DMCXP.cdsDetCxP.Delete;
     if (DMCXP.cdsDetCxP.RecordCount=0) and (wTDev2>0) then bbtnGen302.Enabled:=True;
   end;
end;

procedure TFNotasDC.dbgDetCxPMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     dbgDetCxP.BeginDrag(False);
end;

procedure TFNotasDC.bbtnDel1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
     Accept:=True;
end;

procedure TFNotasDC.bbtnCalcClick(Sender: TObject);
begin
	WinExec('C:\windows\calc.exe',1 );  // Executa Aplicación
end;

procedure TFNotasDC.edtNoDocExit(Sender: TObject);
begin
   If xCrea then Exit;

   if bbtnBorra.Focused then Exit;

   if edtNoDoc.Text='' then
   begin
      ShowMessage('Falta No. de Documento');
      edtNoDoc.SetFocus;
      exit;
   end;

   if not dbeNoReg.Enabled then begin
      if DMCXP.BuscaCxPDoc( dblcCia.Text,dblcdProv.Text,wTDoc,edtSerie.Text,edtNoDoc.Text) then
      begin
         if DMCXP.cdsUltTGE.RecordCount>1 then begin
            edtNoDoc.SetFocus;
            ShowMessage('Documento ya Fue Registrado');
            Exit;
         end
         else begin
            if DMCXP.BuscaCxPDoc2( dblcCia.Text,dblcdProv.Text,wTDoc,edtSerie.Text,edtNoDoc.Text,dblcTDiario.Text,xAnoMes,dbeNoreg.text) then
            else begin
               edtNoDoc.SetFocus;
               ShowMessage('Documento ya Fue Registrado');
               Exit;
            end;
         end;
      end;
   end
   else begin
      if DMCXP.BuscaCxPDoc( dblcCia.Text,dblcdProv.Text,wTDoc,edtSerie.Text,edtNoDoc.Text) then begin
         edtNoDoc.SetFocus;
         Raise Exception.Create('Documento ya Fue Registrado');
      end;
   end;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   {DMCXP.cdsMovCxP2.Edit;
   DMCXP.cdsMovCxP2.FieldByName('CPSERIE').AsString:= edtSerie.Text;
   DMCXP.cdsMovCxP2.FieldByName('CPNODOC').AsString:= edtNoDoc.Text;
   DMCXP.cdsMovCxP2.Post;  }
// Fin HPC_201707_CXP
   if dtpFComp.Date=0 then dtpFComp.SetFocus;

end;


procedure TFNotasDC.Z2bbtnContabClick(Sender: TObject);
var
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   sSQL,xSQL : String;
// Fin HPC_201707_CXP
begin
   //** 13/09/2001 - pjsv
   if DMCXP.MesCerrado(copy(xAnomes,5,2),copy(xAnomes,1,4),dblcCia.text) then
   begin
      ShowMessage(' Mes cerrado, no se puede contabilizar');
      exit;
   end;
   //**
   if not DMCXP.Accesos_a_Registros( DMCXP.cdsMovCxP2.fieldbyname('CPUSER').AsString ) then
      Exit;


   if MessageDlg( 'Contabiliza Nota de Crédito' + chr(13)+
                  '      ¿Esta Seguro?       ',mtConfirmation,[mbYes, mbNo],0)=mrNo then
      exit;

   DMCXP.cdsMovCxP2.Edit;
   DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString :='S';
   cdsPost( DMCXP.cdsMovCxP2 );
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   xSQL := 'UPDATE CXP301 SET '
                +' CP_CONTA = '+ QuotedStr(DMCXP.cdsMovCxP2.fieldbyname('CP_CONTA').AsString)
                +' WHERE '
                +' CIAID = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString)+' AND'
                +' CPANOMES = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString) +' AND'
                +' TDIARID = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString) +' AND'
                +' CPNOREG = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString);
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);  

// Inicia HPC_201401_CXP
   //DMCXP.AplicaDatos(DMCXP.cdsMovCxP2, 'MovCxP2');
   {if DMCXP.cdsMovCxP2.ApplyUpdates(0)>0 then
   begin
      ShowMessage('No se puede actualizar');
      exit;
   end;}
// Fin HPC_201707_CXP
// Finaliza HPC_201401_CXP

   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.ReadOnly:=False;
   DMCXP.cdsDetCxP.First;

   ///////////////////////////////////
   //  Asiento de la Nota de Credito
   ///////////////////////////////////

   DMCXP.GeneraContab( dblcCia.Text, dblcTDiario.Text, DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString, DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString, Self, 'C' );

   ///////////////////////
   //  Asiento del Canje
   ///////////////////////

   if rgAplica.ItemIndex=1 then
   begin
      sSQL:='SELECT * FROM CXP308 '
           +'WHERE CIAID='''+dblcCia.Text+''' AND TCANJEID=''NC'' '
           +  'AND CANJE='''+DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString+'''';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest( sSQL );
      DMCXP.cdsQry.Open;

      if DMCXP.cdsQry.FieldByName('CJ_CONTA').AsString<>'S' then begin

         DMCXP.GeneraContab( dblcCia.Text, DMCXP.cdsQry.FieldByName('TDIARID').AsString,
                           DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString,
                           DMCXP.cdsQry.FieldByName('CCCMPRB').AsString, Self, 'C' );
      end;
   end;

   FiltraGrids;

   EstadoDeForma(1,DMCXP.cdsMovCxP2.FieldByName('CPEstado').AsString,DMCXP.cdsMovCxP2.FieldByName('CP_Conta').AsString );

   while not DMCXP.cdsDetCxP.Eof do Begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      {DMCXP.cdsDetCxP.Edit;
      DMCXP.cdsDetCxP.FieldByName('DCPFLCDR').AsString:='S';
      cdsPost( DMCXP.cdsDetCxP ); }

      xSQL := 'UPDATE CXP302 SET '
                +' DCPFLCDR = '+ QuotedStr('S')
                +' WHERE '
                +' CPNOREG = '+QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString)+' AND'
                +' CIAID = '+QuotedStr(DMCXP.cdsDetCxP.FieldByName('CIAID').AsString) +' AND'
                +' DCPANOC = '+QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString) +' AND'
                +' DCPANOMM = '+QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString)+' AND'
                +' DCPREG = '+QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPREG').AsString) ;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
// Fin HPC_201707_CXP
      DMCXP.cdsDetCxP.Next;
   end;

// Inicia HPC_201401_CXP
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   //DMCXP.AplicaDatos(DMCXP.cdsDetCxP, 'DetCxP');
   {if DMCXP.cdsDetCxP.ApplyUpdates(0)>0 then
   begin
      ShowMessage('No se pudo actualizar el detalle');
      exit;
   end;}
// Fin HPC_201707_CXP
// Finaliza HPC_201401_CXP

   DMCXP.cdsDetCxP.ReadOnly:=True;
   DMCXP.cdsDetCxP.EnableControls;
   Z2bbtnContab.enabled := False;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   pnlImpuesto.Enabled := False;
// Fin HPC_201707_CXP   
   ShowMessage('Registro Contabilizado... Pulse Intro para continuar');
   if DMCXP.wTipoAdicion='xFiltro' then
   begin
      DMCXP.ActualizaFiltro(FPrincipal.GNCredito,DMCXP.cdsMovCxP2,'M');
   end;

end;

procedure TFNotasDC.Z2bbtnNuevoClick(Sender: TObject);
var
   //CIM 16/09/2002
   xCia : string;
   xSQL,xMes,xAnoMM : string;
   Y,M,D : word;

begin
   // si no es NC Contabilizada existente Ó Anulado ---> para evitar confirmacion
   if not(wRegGrab) then begin   // si no viene de bbtnGrabar
      if MessageDlg('Registra un Nuevo Documento'+chr(13)+
        '          ¿Esta Seguro?  ',mtConfirmation, [mbYes, mbNo], 0)=mrNo
      then exit;
   end;
   if DMCXP.cdsDetCxP.Active then
      DMCXP.cdsDetCxP.CancelUpdates;

   If ( DMCXP.wModo='A' ) and ( xFlagGr ) then begin

      // vhndema
      if ( DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString='P') or
         ( DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString='C') then
         // No Borra Nada
      else
      begin
         DecodeDate(dtpFComp.Date, Y, M, D);
         xMes := inttostr(M);
         if M<10 then xMes := '0'+inttostr(M);
            xAnoMM:= IntToStr(Y)+xMes;

         xSQL:='DELETE from CXP302 '
                +'WHERE CIAID='   +''''+dblcCia.Text    +''''+' and '
                +      'TDIARID=' +''''+dblcTdiario.Text+''''+' and '
                +      'DCPANOMM='+''''+xAnoMM    +''''+' and '
                +      'CPNOREG=' +''''+dbeNoReg.Text    +'''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest( xSQL );
        try
           DMCXP.cdsQry.Execute;
        except
        end;

        DMCXP.cdsMovCxP2.Delete;
// Inicia HPC_201401_CXP
        //DMCXP.AplicaDatos(DMCXP.cdsMovCxP2, 'MovCxP2');
        if DMCXP.cdsMovCxP2.ApplyUpdates(0)>0 then
        begin
           ShowMessage('No se puede eliminar');
           exit;
        end;
// Finaliza HPC_201401_CXP
      end;
   end;

   pnlPie.Enabled:=False;
   pnlDetalle.Enabled:=False;
   Z2bbtnAcepta.Enabled:=True;
   Z2bbtnAnula.Enabled :=True;
   CompntesEnabled(True);  // Pape1,2,3 - Sumat,2 - btCont - btOk - pnlPtes,2
   tnbkDetalle.PageIndex:= 0;
   dbgCanje.ColumnByName('CCPMoLoc').FooterValue:='';
   dbgCanje.ColumnByName('CCPMoExt').FooterValue:='';
   dbgDetCanje.ColumnByName('DCDMoLoc').FooterValue:='';
   dbgDetCanje.ColumnByName('DCDMoExt').FooterValue:='';
   //cim 16/09/2002
   DMCXP.wModo := 'A';
   xCIa:= DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString;
   //*
   InicializaCds;
   pnlCabecera.Enabled:=True;
   InicializaVars;
   if (wRegGrab) then exit;   // si viene de bbtnGrabar
   Z2bbtnGraba.Enabled:=True;

   dbgCanje.ReadOnly   :=False;
   dbgDetCanje.ReadOnly:=False;
   dbgDetCxP.ReadOnly  :=False;
   Z2bbtnPreview.Enabled := False;
   bbtnBorra.Click;
   dblcCia.Text := xCia;
end;

procedure TFNotasDC.dbgCanjeColExit(Sender: TObject);
begin
   if dbgCanje.SelectedField.FieldName='CCPTCCJE' then begin
      dbgCanje.RefreshDisplay;
   end;

   if (dbgCanje.SelectedField.FieldName='CCPMOLOC') and (DMCXP.cdsCanje.FieldByName('CIAID').AsString<>'') then begin
      if DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat >= DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat then begin
         ShowMessage('Precaución: Monto no debería ser mayor o igual al Saldo');
      end;
   end;
   if (dbgCanje.SelectedField.FieldName='CCPMOEXT') and (DMCXP.cdsCanje.FieldByName('CIAID').AsString<>'') then begin
      if DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat >= DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat then begin
         ShowMessage('Precaución: Monto no debería ser mayor o igual al Saldo');
      end;
   end;
end;

procedure TFNotasDC.dbgDetCanjeColExit(Sender: TObject);
begin
     if dbgDetCanje.SelectedField.FieldName='DCDTCAMB' then dbgDetCanje.RefreshDisplay;
     If DMCXP.wVRN_PagosParciales='S' then
      begin
        if (dbgDetCanje.SelectedField.FieldName='DCDMOLOC') and (DMCXP.cdsDetCanje.FieldByName('CIAID').AsString<>'') then
         begin
           if DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat>DMCXP.cdsDetCanje.FieldByName('SALLOC').AsFloat then
            begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
              If rgDoc.ItemIndex = 0 then
               begin
                DMCXP.cdsDetCanje.Edit;
// Fin HPC_201707_CXP
                DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := DMCXP.cdsDetCanje.FieldByName('CJEANTMN').AsFloat;
                //** 26/07/2001 - pjsv - es el campo contrario
                DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat  := DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
                //**
                DMCXP.cdsDetCanje.Post;
                raise exception.create('Error: Monto no debe ser mayor al Saldo');
               end
              else
               begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
                DMCXP.cdsDetCanje.Edit;
                //DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat:= DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat / StrToFloat(dbeTCambio.text);
                DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat:= DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat / DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat;
// Fin HPC_201707_CXP
                // ASP_26022010 //TNumericField(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT')).DisplayFormat := '###,###,##0.00';
                //** 26/07/2001 - pjsv - es el campo contrario
                DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat  := DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
                //**
                DMCXP.cdsDetCanje.Post;
               end;
            end
           else  //** 16/07/2001 - pjsv
            begin
             DMCXP.cdsDetCanje.Edit;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
             //DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat:= DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat / StrToFloat(dbeTCambio.text);
             DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat:= DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat / DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat;
// Fin HPC_201707_CXP
             // ASP_26022010 //TNumericField(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT')).DisplayFormat := '###,###,##0.00';
              //** 26/07/2001 - pjsv - es el campo contrario
              DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat  := DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
              //**
             DMCXP.cdsDetCanje.Post;
            end; //**
         end
        else  bbtnSumatClick(Sender);

        if (dbgDetCanje.SelectedField.FieldName='DCDMOEXT') and (DMCXP.cdsDetCanje.FieldByName('CIAID').AsString<>'') then
         begin
           if DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat>DMCXP.cdsDetCanje.FieldByName('SALEXT').AsFloat then
            begin
              DMCXP.cdsDetCanje.Edit;
              DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat:=DMCXP.cdsDetCanje.FieldByName('CJEANTME').AsFloat;
              //** 26/07/2001 - pjsv - es el campo contrario
              DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat  := DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
              //**
              DMCXP.cdsDetCanje.Post;
             If rgDoc.ItemIndex = 0 then
              raise exception.create('Error: Monto no debe ser mayor al Saldo');
            end
           else
            begin //** 16/07/2001 - pjsv
             DMCXP.cdsDetCanje.Edit;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
             //DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat:= DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat * StrToFloat(dbeTCambio.text);
             DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat:= DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat * DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat;
// Fin HPC_201707_CXP
             // ASP_26022010 //TNumericField(DMCXP.cdsDetCanje.FieldByName('DCDMOLOC')).DisplayFormat := '###,###,##0.00';
              //** 26/07/2001 - pjsv - es el campo contrario
              DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat  := DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
              //**
             DMCXP.cdsDetCanje.Post;
            end; //**
         end
        else  bbtnSumatClick(Sender);
      end
end;

procedure TFNotasDC._Click(Sender: TObject);
begin

   if DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString = 'S' then begin bbtnSumat.Click; exit; end;

   if tnbkDetalle.PageIndex = 2 then begin
      edtFinal.Text:='Nota de Crédito deberá ser cancelada por la suma de '
                    + wSimbMn +'  '+ floattostrf(wTDev2,ffNumber,15,2);

//      if (wTDev2 > 0) and (DMCXP.cdsMovCxP2CP_Conta.Value <> 'S') and (DMCXP.cdsMovCxP2CPEstado.Value = 'I')
      If rgDoc.ItemIndex = 0 then
       begin
        if ( DMCXP.cdsDetCxP.RecordCount=0 ) and ( wTDev2>0 ) then bbtnGen302.Enabled:=True
        else bbtnGen302.Enabled:=False;
       end
      else bbtnGen302.Enabled:=True;
   end
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   else
   begin  // pestaña 0  ó  1
      If (tnbkDetalle.PageIndex = 0 ) Then
      Begin
         bbtnGen302.Enabled:=False;
      End;
      If tnbkDetalle.PageIndex = 1 then
      Begin
         dbgDetCanje.Selected.Clear;
         dbgDetCanje.Selected.Add('DOCID'#9'3'#9'DOC'#9'F');
         dbgDetCanje.Selected.Add('CPSERIE'#9'6'#9'Serie'#9'T');
         dbgDetCanje.Selected.Add('CPNODOC'#9'16'#9'No.Documento'#9'T');
         dbgDetCanje.Selected.Add('CCPFCJE'#9'12'#9'Fecha~Aplicación'#9'F');
         dbgDetCanje.Selected.Add('DCDTCAMB'#9'8'#9'Tipo de~Cambio'#9'F');
         dbgDetCanje.Selected.Add('DCDMOLOC'#9'15'#9'Amortización~Mon.Local'#9'F');
         dbgDetCanje.Selected.Add('DCDMOEXT'#9'15'#9'Amortización~Mon.Extranjera'#9'F');
         bbtnSumat.Click;
      End;
// Fin HPC_201707_CXP
   end;
end;

procedure TFNotasDC.Z2bbtnAnulaClick(Sender: TObject);
var
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   sSQL,xSQL : String;
// Fin HPC_201707_CXP
begin
   if DMCXP.wAdmin='G' then Exit;

   if not DMCXP.Accesos_a_Registros( DMCXP.cdsMovCxP2.fieldbyname('CPUSER').AsString ) then
      Exit;

   if MessageDlg( 'Anular Comprobante' + chr(13)+
                '   ¿Esta Seguro?   ',mtConfirmation,[mbYes, mbNo],0)=mrNo
      then exit;

   if DMCXP.cdsMovCxP2.fieldbyname('CP_CONTA').AsString='S' then begin
//      ((DMCXP.cdsMovCxP2.fieldbyname('CPMTOLOC').AsFloat-DMCXP.cdsMovCxP2.fieldbyname('CPPAGLOC').AsFloat)>0) then begin
      ShowMessage('Registro No Se Puede Anular (Sólo Consulta))');
      Exit;
   end;

   if DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString='A' then begin
      ShowMessage('Registro Ya fue Anulado)');
      Exit;
   end;

   if DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString='E' then begin
      ShowMessage('Registro Fue Eliminado');
      Exit;
   end;


   AnulaNotaCredito;

   DMCXP.SaldosAuxiliar( DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString,DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString,
                       DMCXP.cdsMovCxP2.FieldByName('CLAUXID').AsString, DMCXP.cdsMovCxP2.FieldByName('PROV').AsString,'+',
                       DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat,DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat,
                       DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString);

   DMCXP.cdsMovCxP2.Edit;
   DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString := 'A';
   DMCXP.cdsMovCxP2.Post;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   xSQL := 'UPDATE CXP301 SET '
                +' CPESTADO = '+ QuotedStr(DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString)
                +' WHERE '
                +' CIAID = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString)+' AND'
                +' CPANOMES = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString) +' AND'
                +' TDIARID = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString) +' AND'
                +' CPNOREG = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString);
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);


// Inicia HPC_201401_CXP
   //DMCXP.AplicaDatos(DMCXP.cdsMovCxP2, 'MovCxP2');
   {if DMCXP.cdsMovCxP2.ApplyUpdates(0)>0 then
   begin
      ShowMessage('No se puede actualizar');
      exit;
   end;}
// Fin HPC_201707_CXP
// Finaliza HPC_201401_CXP

   DMCXP.cdsDetCxP.First;
   while not DMCXP.cdsDetCxP.Eof do
   begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      {DMCXP.cdsDetCxP.Edit;
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString:='A';
      DMCXP.cdsDetCxP.Post; }
      xSQL := 'UPDATE CXP302 SET '
                +' DCPESTDO = '+ QuotedStr('A')
                +' WHERE '
                +' CPNOREG = '+QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString)+' AND'
                +' CIAID = '+QuotedStr(DMCXP.cdsDetCxP.FieldByName('CIAID').AsString) +' AND'
                +' DCPANOC = '+QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString) +' AND'
                +' DCPANOMM = '+QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString)+' AND'
                +' DCPREG = '+QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPREG').AsString) ;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
// Fin HPC_201707_CXP
      DMCXP.cdsDetCxP.Next;
   end;
// Inicia HPC_201401_CXP
     //DMCXP.AplicaDatos(DMCXP.cdsDetCxP, 'DetCxP');
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
     {if DMCXP.cdsDetCxP.ApplyUpdates(0)>0 then
     begin
        ShowMessage('No se puede actualizar');
        exit;
     end;}
// Fin HPC_201707_CXP
// Finaliza HPC_201401_CXP

  // Anula Canje
  sSQL:='Update CXP308 SET CJESTADO=''A'', CJ_CONTA=''N'', CJUSER='''+DMCXP.wUsuario+''', '
       +   'CJFREG='+DMCXP.wRepFecServi+', CJFHOR='+DMCXP.wRepFecServi+' '
       +'WHERE CIAID='''   +DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString   +''' '
       +  'AND TCANJEID='''+DMCXP.cdsMovCxP2.FieldByName('TCANJEID').AsString+''' '
       +  'AND CANJE='''   +DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString   +''' ';
  DMCXP.cdsCCanje.Close;
  DMCXP.cdsCCanje.DataRequest(sSQL);
  try
    DMCXP.cdsCCanje.Execute;
  except
  end;

///////////////////////////

   DMCXP.cdsLetras.Filtered := False;
   DMCXP.cdsLetras.DisableControls;
   DMCXP.cdsLetras.First;
   While not DMCXP.cdsLetras.Eof do Begin
      // Saldo = Monto - Pagado
      DMCXP.cdsLetras.Edit;
      DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat:=DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat-DMCXP.cdsLetras.FieldByName('CPPAGORI').AsFloat;
      DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat:=DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat-DMCXP.cdsLetras.FieldByName('CPPAGLOC').AsFloat;
      DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat:=DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat-DMCXP.cdsLetras.FieldByName('CPPAGEXT').AsFloat;
      cdsPost( DMCXP.cdsLetras );
      DMCXP.cdsLetras.Next;
   end;
// Inicia HPC_201401_CXP
   //DMCXP.AplicaDatos(DMCXP.cdsLetras, 'Letras');
   if DMCXP.cdsLetras.ApplyUpdates(0)>0 then
   begin
      ShowMessage('No se puede actualizar');
      exit;
   end;
// Finaliza HPC_201401_CXP
   DMCXP.cdsLetras.EnableControls;
   DMCXP.cdsLetras.Filtered := True;

   FiltraGrids;

   EstadoDeForma(1,DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString,DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString );

   ShowMessage('Registro Anulado... Pulse Intro para continuar');
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   {if DMCXP.wTipoAdicion='xFiltro' then
   begin
      DMCXP.ActualizaFiltro(FPrincipal.GProvision,DMCXP.cdsMovCxP2,'M');
   end;}
// Fin HPC_201707_CXP

end;


procedure TFNotasDC.AnulaNotaCredito ;
var
   xWhere, xSQL, xMes, xAno : String;
begin

   xWhere:='CIAID='''+DMCXP.cdsMovCxP2.fieldbyname('CIAID').AsString+''' and '
          +'TCANJEID=''NC'' AND CCPCANJE='''+DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString+''' ';

   DMCXP.cdsDetCanje.First ;
   while not DMCXP.cdsDetCanje.Eof do
   begin

      xSQL  :='SELECT * FROM CXP301 ' ;
      xWhere:='WHERE CIAID   = ''' + DMCXP.cdsDetCanje.fieldbyname('CIAID').AsString   + ''' ' +
                'AND DOCID   = ''' + DMCXP.cdsDetCanje.fieldbyname('DOCID').AsString   + ''' ' +
                'AND CPSERIE = ''' + DMCXP.cdsDetCanje.fieldbyname('CPSERIE').AsString + ''' ' +
                'AND CPNODOC = ''' + DMCXP.cdsDetCanje.fieldbyname('CPNODOC').AsString + ''' ' +
                'AND CLAUXID = ''' + DMCXP.cdsDetCanje.fieldbyname('CLAUXID').AsString + ''' ' +
                'AND CPESTADO <> ''E'' ' +
                'AND PROV    = ''' + DMCXP.cdsDetCanje.fieldbyname('PROV').AsString    + ''' ' ;
      xSQL := xSQL + xWhere ;
      DMCXP.cdsqry.Close ;
      DMCXP.cdsQry.DataRequest(xSQL) ;
      DMCXP.cdsQry.Open  ;

      if not DMCXP.cdsQry.FieldByName('CPPAGLOC').IsNull then
      begin
         if DMCXP.cdsQry.FieldByName('CPPAGLOC').AsFloat <> 0 then
         begin

            //poner código que comprueba si la unica cancelación es de la nota de crédito
            //if (DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat <> DMCXP.cdsqry.FieldByName('CPPAGLOC').AsFloat) and
            //   (DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat <> DMCXP.cdsqry.FieldByName('CPPAGEXT').AsFloat) then
            //   Raise Exception.create('No se puede Eliminar, pues la Provisión'+#13+
            //                         'ya tiene Cancelaciones' )
         end
         else
            if DMCXP.cdsQry.FieldByName('CPSALLOC').AsFloat <> DMCXP.cdsQry.FieldByName('CPMTOLOC').AsFloat then
               Raise Exception.create('No se puede Eliminar, Debe Anular '+#13+
                                      'la Cancelación Pendiente en Caja' ) ;
      end
      else
         if DMCXP.cdsQry.FieldByName('CPSALLOC').AsFloat <> DMCXP.cdsQry.FieldByName('CPMTOLOC').AsFloat then
            Raise Exception.create('No se puede Eliminar, Debe Anular '+#13+
                                   'la Cancelación Pendiente en Caja' ) ;

      DMCXP.cdsDetCanje.Next ;
   end;

   //Aqui empieza reversión de documentos afectos a nota de credito
   DMCXP.cdsDetCanje.First ;
   while not DMCXP.cdsDetCanje.Eof do
   begin
      xSQL := 'SELECT * FROM CXP301 ' ;
      xWhere := ' WHERE CIAID       = ''' + DMCXP.cdsDetCanje.fieldbyname('CIAID').AsString   + ''' ' +
                       'AND DOCID   = ''' + DMCXP.cdsDetCanje.fieldbyname('DOCID').AsString   + ''' ' +
                       'AND CPSERIE = ''' + DMCXP.cdsDetCanje.fieldbyname('CPSERIE').AsString + ''' ' +
                       'AND CPNODOC = ''' + DMCXP.cdsDetCanje.fieldbyname('CPNODOC').AsString + ''' ' +
                       'AND CLAUXID = ''' + DMCXP.cdsDetCanje.fieldbyname('CLAUXID').AsString + ''' ' +
                       'AND CPESTADO <> ''E'' ' +
                      'AND PROV    = ''' + DMCXP.cdsDetCanje.fieldbyname('PROV').AsString    + ''' ' ;
      xSQL := xSQL + xWhere ;
      DMCXP.cdsGrab.Close ;
      DMCXP.cdsGrab.DataRequest(xSQL) ;
      DMCXP.cdsGrab.Open  ;
      DMCXP.cdsGrab.Edit ;


      if (DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').asstring = 'C') then
      begin
         DMCXP.cdsgrab.FieldByName('CPPAGLOC').AsFloat:=DMCXP.cdsgrab.FieldByName('CPPAGLOC').AsFloat -
                                                      DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
         DMCXP.cdsgrab.FieldByName('CPPAGEXT').AsFloat:=DMCXP.cdsgrab.FieldByName('CPPAGEXT').AsFloat -
                                                      DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
      end;

      DMCXP.cdsgrab.FieldByName('CPSALLOC').AsFloat:=DMCXP.cdsgrab.FieldByName('CPSALLOC').AsFloat+
                                                              DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat    ;
      DMCXP.cdsgrab.FieldByName('CPSALEXT').AsFloat:=DMCXP.cdsgrab.FieldByName('CPSALEXT').AsFloat+
                                                              DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat     ;

      if DMCXP.cdsGrab.fieldbyname('TMONID').AsString = DMCXP.wTMonLoc then
      begin
         if (DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').asstring = 'C') then
            DMCXP.cdsgrab.FieldByName('CPPAGORI').AsFloat := DMCXP.cdsgrab.FieldByName('CPPAGLOC').AsFloat ;
         DMCXP.cdsgrab.FieldByName('CPSALORI').AsFloat := DMCXP.cdsgrab.FieldByName('CPSALLOC').AsFloat ;
      end
      else begin
         if (DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').asstring = 'C') then
            DMCXP.cdsgrab.FieldByName('CPPAGORI').AsFloat := DMCXP.cdsgrab.FieldByName('CPPAGEXT').AsFloat ;
         DMCXP.cdsgrab.FieldByName('CPSALORI').AsFloat := DMCXP.cdsgrab.FieldByName('CPSALEXT').AsFloat ;
      end ;

      if DMCXP.cdsGrab.FieldByName('CPESTADO').AsString = 'C' then
         DMCXP.cdsGrab.FieldByName('CPESTADO').AsString:= 'P' ;

      DMCXP.cdsgrab.Post ;
// Inicia HPC_201401_CXP
   //DMCXP.AplicaDatos(DMCXP.cdsgrab, '');
   if DMCXP.cdsgrab.ApplyUpdates(0)>0 then
   begin
      ShowMessage('No se pudo actualizar');
      exit;
   end;
// Finaliza HPC_201401_CXP
      DMCXP.cdsDetCanje.Next ;
   end;
end;

procedure TFNotasDC.Z2bbtnAceptaClick(Sender: TObject);
Var
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   xFiltro, xSQL : string;
// Fin HPC_201707_CXP
begin
   if DMCXP.cdsCanje.RecordCount<=0 then
      Raise exception.create('Debe Seleccionar un Documentos de Referencia...');

   DMCXP.cdsDetCxP.First;
   while not DMCXP.cdsDetCxP.Eof do begin
      if DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString='' then begin
         ShowMessage('Error : Falta Registrar Cuenta');
         Exit;
      end;
      DMCXP.cdsDetCxP.Next;
   end;

   {
   If rgAplica.ItemIndex=1 then
   begin
      // Verifica que cuadre Nota de Credito (CXP302) CON Documentos a Cancelar CXP305
      if wTDev2=0 then raise exception.Create('Información Incompleta en Cancelación');
      if not VerificaTotal( ) then raise exception.Create('Total Nota de Crédito NO CUADRA con Total de Documentos seleccionados');
   end;
   }

   if DMCXP.cdsDetCxP.RecordCount=0 then raise exception.Create('Ingrese Detalle Contable');
   if not CuadraDH( ) then raise exception.Create('Error:  Asiento No Cuadra');

   if not DMCXP.Accesos_a_Registros( DMCXP.cdsMovCxP2.fieldbyname('CPUSER').AsString ) then
      Exit;


   try
      if rgAplica.ItemIndex = 1 then
      begin

         DMCXP.cdsDetCxP.DisableControls;
         screen.Cursor := crHOURGLASS;
         pnlActuali.Visible := true;
         pnlActuali.Refresh;
         //**
         DMCXP.cdsMovCxP2.Edit;
         DMCXP.cdsMovCxP2.FieldByName('CPPAGORI').AsFloat  := DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat;
         DMCXP.cdsMovCxP2.FieldByName('CPPAGLOC').AsFloat  := DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat;
         DMCXP.cdsMovCxP2.FieldByName('CPPAGEXT').AsFloat  := DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat;
         DMCXP.cdsMovCxP2.FieldByName('CPSALORI').AsFloat  := 0;
         DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsFloat  := 0;
         DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsFloat  := 0;
         DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString :='C';
         cdsPost( DMCXP.cdsMovCxP2 );
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
         xSQL := 'UPDATE CXP301 SET '
                +' CPPAGORI = '+ QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPPAGORI').AsString)+','
                +' CPPAGLOC = '+ QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPPAGLOC').AsString)+','
                +' CPPAGEXT = '+ QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPPAGEXT').AsString)+','
                +' CPSALORI = '+ QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSALORI').AsString)+','
                +' CPSALLOC = '+ QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsString)+','
                +' CPSALEXT = '+ QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsString)+','
                +' CPESTADO = '+ QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString)
                +' WHERE '
                +' CIAID = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString)+' AND'
                +' CPANOMES = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString) +' AND'
                +' TDIARID = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString) +' AND'
                +' CPNOREG = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString);
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

// Inicia HPC_201401_CXP
         //DMCXP.AplicaDatos(DMCXP.cdsMovCxP2, 'MovCxP2');
         {if DMCXP.cdsMovCxP2.ApplyUpdates(0)>0 then
         begin
            ShowMessage('No se pudo actualizar');
            exit;
         end; }
// Fin HPC_201707_CXP
// Finaliza HPC_201401_CXP
         //** 02/10/2001 - pjsv, para que genera el correlativo
         DMCXP.HalloCXPREG(dblcCia.text,dblcTDiario.Text,xAnomes,xNRegistro) ;

         DMCXP.cdsLetras.Filtered := False;
         DMCXP.cdsDetCanje.DisableControls;
         DMCXP.cdsDetCanje.First;
         // Actualiza Montos Pagados y Saldos en CXP301 (Docs. a los k aplica la NC)
         while not DMCXP.cdsDetCanje.Eof do
         begin
            if Length(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString)=0 then
               DMCXP.cdsLetras.IndexFieldNames:='CIAID;PROV;DOCID;CPNODOC'
            else
               DMCXP.cdsLetras.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
            DMCXP.cdsLetras.Setkey;
            DMCXP.cdsLetras.FieldByName('CIAID').AsString:=DMCXP.cdsDetCanje.FieldByName('CIAID').AsString;
            DMCXP.cdsLetras.FieldByName('PROV').AsString :=DMCXP.cdsDetCanje.FieldByName('PROV').AsString;
            DMCXP.cdsLetras.FieldByName('DOCID').AsString:=DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
            if Length(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString)>0 then
               DMCXP.cdsLetras.FieldByName('CPSERIE').AsString:=DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString;
            DMCXP.cdsLetras.FieldByName('CPNODOC').AsString:=DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString;
            if DMCXP.cdsLetras.GotoKey then
            begin
               DMCXP.cdsLetras.Edit;
               if DMCXP.cdsLetras.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
               begin
                  DMCXP.cdsLetras.FieldByName('CPPAGORI').AsFloat:=DMCXP.cdsLetras.FieldByName('CPPAGORI').AsFloat+DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
                  DMCXP.cdsLetras.FieldByName('CPPAGLOC').AsFloat:=DMCXP.cdsLetras.FieldByName('CPPAGLOC').AsFloat+DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
                  DMCXP.cdsLetras.FieldByName('CPPAGEXT').AsFloat:=DMCXP.cdsLetras.FieldByName('CPPAGEXT').AsFloat+DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
                  DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat:=DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat-DMCXP.cdsLetras.FieldByName('CPPAGLOC').AsFloat;
                  DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat:=DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat-DMCXP.cdsLetras.FieldByName('CPPAGEXT').AsFloat;
                  DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat:= DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat
               end
               else begin
                  DMCXP.cdsLetras.FieldByName('CPPAGORI').AsFloat:=DMCXP.cdsLetras.FieldByName('CPPAGORI').AsFloat+DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
                  DMCXP.cdsLetras.FieldByName('CPPAGLOC').AsFloat:=DMCXP.cdsLetras.FieldByName('CPPAGLOC').AsFloat+DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
                  DMCXP.cdsLetras.FieldByName('CPPAGEXT').AsFloat:=DMCXP.cdsLetras.FieldByName('CPPAGEXT').AsFloat+DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
                  DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat:=DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat-DMCXP.cdsLetras.FieldByName('CPPAGEXT').AsFloat;
                  DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat:=DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat-DMCXP.cdsLetras.FieldByName('CPPAGLOC').AsFloat;
                  DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat:= DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat
               end;
               cdsPost( DMCXP.cdsLetras );
            end
            else
               raise exception.Create('Error inesperado al grabar registro');

            DMCXP.cdsDetCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
            DMCXP.cdsDetCanje.Next;
         end;
         DMCXP.cdsDetCanje.EnableControls;

         if DMCXP.cdsCia.FieldByName('PRORATEO').AsString='S' then
         begin
            if DMCXP.cdsMovCxP.FieldByName('CPIGV2').AsFloat>0 then
               FToolCont.Prorrateo(dblcCia.text,dblcTDiario.Text,DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString,dbeNoReg.text);
         end;

         DMCXP.cdsLetras.Filtered := True;
         DMCXP.cdsDetCanje.EnableControls;

// Inicia HPC_201401_CXP
   //DMCXP.AplicaDatos(DMCXP.cdsLetras, 'Letras');
   if DMCXP.cdsLetras.ApplyUpdates(0)>0 then
   begin
      ShowMessage('No se puede actualizar');
      exit;
   end;
// Finaliza HPC_201401_CXP

         ////////////////////////////////////////////////////////////////////////
         //  GENERA ASIENTO Y CABECERA DE LA APLICACION DE LA NOTA DE CREDITO  //
         //  en CXP308 Y CXP302                                                //
         ////////////////////////////////////////////////////////////////////////
         GrabaCabeceraCanje;

         GrabaDetalleCanje;

      end;

      FiltraGrids;

      if rgAplica.ItemIndex = 0 then
      begin
         DMCXP.cdsMovCxP2.Edit;
         //DMCXP.cdsMovCxP2.FieldByName('CPPAGORI').AsFloat  := DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat;
         //DMCXP.cdsMovCxP2.FieldByName('CPPAGLOC').AsFloat  := DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat;
         //DMCXP.cdsMovCxP2.FieldByName('CPPAGEXT').AsFloat  := DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat;
         DMCXP.cdsMovCxP2.FieldByName('CPSALORI').AsFloat  := DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat;
         DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsFloat  := DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat;
         DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsFloat  := DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat;
         DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString :='P';
         cdsPost( DMCXP.cdsMovCxP2 );
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
          xSQL := 'UPDATE CXP301 SET '
                +' CPSALORI = '+ QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSALORI').AsString)+','
                +' CPSALLOC = '+ QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsString)+','
                +' CPSALEXT = '+ QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsString)+','
                +' CPESTADO = '+ QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString)
                +' WHERE '
                +' CIAID = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString)+' AND'
                +' CPANOMES = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString) +' AND'
                +' TDIARID = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString) +' AND'
                +' CPNOREG = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString);
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);


         xSQL := 'UPDATE CXP302 SET '
                +' DCPESTDO = '+ QuotedStr('P')
                +' WHERE '
                +' CIAID = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString)+' AND'
                +' CPNOREG = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString) +' AND'
                //+' DCPANOC = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString) +' AND'
                +' DCPANOMM = '+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString);
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

// Inicia HPC_201401_CXP
         //DMCXP.AplicaDatos(DMCXP.cdsMovCxP2, 'MovCxP2');
         {if DMCXP.cdsMovCxP2.ApplyUpdates(0)>0 then
         begin
            ShowMessage('No se puede actualizar');
            exit;
         end;  }
// Fin HPC_201707_CXP
// Finaliza HPC_201401_CXP
      end;

      // Actualiza Saldo de Proveedor
      DMCXP.SaldosAuxiliar( DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString,DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString,
                          DMCXP.cdsMovCxP2.FieldByName('CLAUXID').AsString, DMCXP.cdsMovCxP2.FieldByName('PROV').AsString,'-',
                          DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat,DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat,
                          DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString);


      EstadoDeForma(1,DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString,DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString );

      xFiltro:= 'CIAID    =''' + dblcCia.Text  + ''' and '
              + 'DCPANOMM =''' + DMCXP.cdsMovCxP2.fieldbyname('CPANOMES').AsString + ''' and '
              + 'TDIARID  =''' + DMCXP.cdsMovCxP2.fieldbyname('TDIARID').AsString  + ''' and '
              + 'CPNOREG  =''' + DMCXP.cdsMovCxP2.fieldbyname('CPNOREG').AsString  + '''' ;

      Filtracds( DMCXP.cdsDetCxP,'Select * from CXP302 Where '+xFiltro );
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      pnlImpuesto.Enabled := False;
// Fin HPC_201707_CXP
      ShowMessage('Registro Aceptado... Pulse Intro para continuar');
      if DMCXP.wTipoAdicion='xFiltro' then
      begin
         DMCXP.ActualizaFiltro(FPrincipal.GNCredito,DMCXP.cdsMovCxP2,'M');
      end;


   Finally
      DMCXP.cdsDetCxP.EnableControls;
      pnlActuali.Visible := false;
      screen.Cursor := crDEFAULT;
   end;
end;

//////  F U N C I O N E S   //////
procedure TFNotasDC.CamposKEnabled(PVal:Boolean);
begin
   dblcCia.Enabled      :=PVal;
   dblcClAux.Enabled    :=PVal;
   dblcdProv.Enabled    :=PVal;
   dblcdProvRuc.Enabled :=PVal;
   edtSerie.Enabled     :=PVal;
   edtNoDoc.Enabled     :=PVal;
   dtpFComp.Enabled:=PVal;
   dbeNoReg.Enabled   :=PVal;
end;

procedure TFNotasDC.CompntesEnabled(PVal:Boolean);
begin
   bbtnDel1.Enabled      :=PVal;
   bbtnSumat.Enabled     :=PVal;
   Z2bbtnContab.Enabled    :=PVal;
   bbtnOK.Enabled        :=PVal;
   pnlPendientes.Visible :=PVal;
   pnlPendientes2.Visible:=PVal;
end;

function TFNotasDC.VerificaTotal:Boolean;
var
  dTotal : Double;
begin
  dTotal:=0;
  DMCXP.cdsDetCxP.First;
  while not DMCXP.cdsDetCxP.Eof do
  begin
    if ( DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString='TO' ) or
       ( DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString='I4' ) then
       dTotal:=dTotal+FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat,15,2);
    DMCXP.cdsDetCxP.Next;
  end;

  if FRound(wTDev2,15,2) <> FRound( dTotal,15,2) then
     result:=False
  else
     result:=True;
  {
  DMCXP.cdsDetCxP.IndexFieldNames:='CiaId;TDiarId;CPNoReg;DCPAnoMM;TipDet';   //Busca Monto total en DetCxP
  DMCXP.cdsDetCxP.SetKey;
  DMCXP.cdsDetCxP.FieldByName('CIAID').AsString   := dblcCia.Text;      // ojo, debería ser del MovCxP2 ?
  DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString := dblcTDiario.Text;            // ojo, debería ser del MovCxP2 ?
  DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString := dbeNoReg.Text;   // ojo, debería ser del MovCxP2 ?
  DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString:= cdsMovCxP2.FieldByName('CPANOMES').AsString;
  DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString  := 'TO';
  if not(cdsDetCxP.Gotokey)
     then raise exception.Create('No hay un TOTAL definido en Asignación')
     else begin
          cdsDetCxP.IndexFieldNames:='';
          if FRound(wTDev2,15,2) <> FRound(cdsDetCxP.FieldByName('DCPMOORI').AsFloat,15,2) then result:=False
          else result:=True;
     end;
  end;
  }
end;

function TFNotasDC.CuadraDH:Boolean;
var
   wTotD, wTotH : double;
begin
   With DMCXP do Begin
   wTotD := 0;
   wTotH := 0;
   cdsDetCxP.DisableControls;
   cdsDetCxP.First ;
   While not cdsDetCxP.Eof do begin
      If cdsDetCxP.fieldbyname('DCPDH').AsString='D'
      then wTotD:= wTotD + cdsDetCxP.FieldByName('DCPMOORI').AsFloat
      else wTotH:= wTotH + cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      cdsDetCxP.Next;
   end;
   cdsDetCxP.First;
   cdsDetCxP.EnableControls;

   If FRound(wTotD,15,2)=FRound(wTotH,15,2) then result:=True
   else result:=False;
   End;   // with DMCXP
end;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
function TFNotasDC.CuadraMontoRef:Boolean;
var
   wTotD, wTotRef : double;
begin
   With DMCXP do Begin
   wTotD := 0;
   wTotRef := 0;
   cdsDetCxP.DisableControls;
   cdsDetCxP.First ;
   While not cdsDetCxP.Eof do begin
      If cdsDetCxP.fieldbyname('DCPDH').AsString='D' then
      wTotD:= cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      cdsDetCxP.Next;
   end;
   cdsDetCxP.First;
   cdsDetCxP.EnableControls;


   cdsCanje.DisableControls;
   cdsCanje.First ;
   While not cdsCanje.Eof do begin
      wTotRef:= wTotRef +cdsCanje.FieldByName('CCPMOLOC').AsFloat;
      cdsCanje.Next;
   end;
   cdsCanje.First;
   cdsCanje.EnableControls;

   If FRound(wTotD,15,2)=FRound(wTotRef,15,2) then result:=True
   else result:=False;
   End;   // with DMCXP
end;
// Fin HPC_201707_CXP
//////  F U N C I O N E S   //////


procedure TFNotasDC.dblcTMonExit(Sender: TObject);
var
	xWhere : string;
begin
	If xCrea then Exit;
  if bbtnBorra.Focused then Exit;

  xWhere := 'TMONID='+''''+dblcTMon.Text+''''
            +' AND (TMON_LOC='+''''+'L'+''''+' OR TMON_LOC='+''''+'E'+''''+')';
   edtTMon.Text:=BuscaQry('PrvTGE','TGE103','*',xWhere,'TMONDES');
   if length(edtTMon.Text)>0 then wSimbMn:=DMCXP.cdsQry.FieldByName('TMONABR').Value;

   if length(edtTMon.Text)=0 then
   begin
      ShowMessage('Falta Tipo de Moneda');
      dblcTMon.SetFocus;
      exit;
   end;
end;

procedure TFNotasDC.FormClose(Sender: TObject; var Action: TCloseAction);
var
    xSQL,xMes,xAnoMM : string;
    Y,M,D : word;
begin
   if DMCXP.cdsDetCxP.Active then
      DMCXP.cdsDetCxP.CancelUpdates;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   try
      xSQL := 'CALL SP_CNT_DEL_NOT_CRE_CAB('
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString)
      +')' ;
      DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);
    Except
        showmessage('Error al intentar eliminar la cabecera de la nota de crédito');
        exit;
    Raise;
    End;
// Fin HPC_201707_CXP
   If ( DMCXP.wModo='A' ) and ( xFlagGr ) then begin

      // vhndema
      if ( DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString='P') or
         ( DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString='C') then
         // No Borra Nada
      else
      begin
         DecodeDate(dtpFComp.Date, Y, M, D);
         xMes := inttostr(M);
         if M<10 then xMes := '0'+inttostr(M);
            xAnoMM:= IntToStr(Y)+xMes;

         xSQL:='DELETE from CXP302 '
                +'WHERE CIAID='   +''''+dblcCia.Text    +''''+' and '
                +      'TDIARID=' +''''+dblcTdiario.Text+''''+' and '
                +      'DCPANOMM='+''''+xAnoMM    +''''+' and '
                +      'CPNOREG=' +''''+dbeNoReg.Text    +'''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest( xSQL );
        try
           DMCXP.cdsQry.Execute;
        except
        end;

        DMCXP.cdsMovCxP2.Delete;
// Inicia HPC_201401_CXP
         //DMCXP.AplicaDatos(DMCXP.cdsMovCxP2, 'MovCxP2');
         if DMCXP.cdsMovCxP2.ApplyUpdates(0)>0 then
         begin
            ShowMessage('No se puede eliminar');
            exit;
         end;
// Finaliza HPC_201401_CXP
      end;
      // end vhndema
   end;

   If DMCXP.cdsMovCxP2.active then
      DMCXP.cdsMovCxP2.CancelUpdates;
   If DMCXP.cdsLetras.active then
      DMCXP.cdsLetras.CancelUpdates;
   If DMCXP.cdsDetCxP.active then
      DMCXP.cdsDetCxP.CancelUpdates;
   If DMCXP.cdsMovCxP.active then
      DMCXP.cdsMovCxP.CancelUpdates;
   If DMCXP.cdsCanje.active then
      DMCXP.cdsCanje.CancelUpdates;
   If DMCXP.cdsDetCanje.active then
      DMCXP.cdsDetCanje.CancelUpdates;

   DMCXP.cdsLetras.Filtered := False;

   DMCXP.cdsMovCxP.ReadOnly  := False;
   DMCXP.cdsCanje.ReadOnly   := False;
   DMCXP.cdsLetras.ReadOnly  := False;
   DMCXP.cdsDetCanje.ReadOnly:= False;
   DMCXP.cdsDetCxP.ReadOnly  := False;

   FVariables.w_OP_Registro:=False;

   Action:=caFree;
end;

procedure TFNotasDC.MuestraEstado( xMovEstado, xMovConta : String ) ;
begin
   lblAcepta.Visible  := False;
   lblActivo.Visible  := False;
   lblContab.Visible  := False;
   lblAnula.Visible   := False;
   lblEliminado.Visible := False ;

   if xMovConta='S' then
      lblContab.Visible:=True
   else
      if xMovEstado='A' then
         lblAnula.Visible:=true
      else
         if xMovEstado='P' then
            lblAcepta.Visible:=True
         else
            if xMovEstado='I' then
               lblActivo.Visible:=True
            else
               if xMovEstado = 'E' then
                  lblEliminado.Visible := true ;

end;


procedure TFNotasDC.EstadoDeBotones( xMovEstado, xMovConta : String );
begin

   bbtnCalc.Enabled    := True;
   bbtnSumat.Enabled   := False;
   bbtnRegresa.Enabled    := False;
   bbtnCancela.Enabled := False;
   Z2bbtnGraba.Enabled  := False;
   Z2bbtnAcepta.Enabled  := False;
   Z2bbtnAnula.Enabled   := False;
   Z2bbtnContab.Enabled  := False;
   Z2bbtnNuevo.Enabled   := False;
   btnActReg.Enabled   := False;

   pnlDetalle.Enabled      := True;
   DMCXP.cdsMovCxP.ReadOnly  := True;
   DMCXP.cdsCanje.ReadOnly   := True;
   DMCXP.cdsLetras.ReadOnly  := True;
   DMCXP.cdsDetCanje.ReadOnly:= True;
   DMCXP.cdsDetCxP.ReadOnly  := True;

   If xMovConta='S' then begin
      Z2bbtnNuevo.Enabled    := True;
      end
   else begin
      If xMovEstado='A' then begin
         Z2bbtnNuevo.Enabled    := True;
         end
      Else begin
         If xMovEstado='P' then begin
            Z2bbtnContab.Enabled  := True;
            Z2bbtnNuevo.Enabled   := True;
            end
         else begin
            If xMovEstado='I' then begin
               btnActReg.Enabled  := True;
               bbtnSumat.Enabled   := True;
               bbtnRegresa.Enabled    := True;
               bbtnCancela.Enabled:= True;
               Z2bbtnGraba.Enabled   := True;
               Z2bbtnAcepta.Enabled  := True;
               Z2bbtnAnula.Enabled   := True;
               Z2bbtnNuevo.Enabled   := True;
               DMCXP.cdsMovCxP.ReadOnly  := False;
               DMCXP.cdsCanje.ReadOnly   := False;
               DMCXP.cdsLetras.ReadOnly  := False;
               DMCXP.cdsDetCanje.ReadOnly:= False;
               DMCXP.cdsDetCxP.ReadOnly  := False;
            end;
         end;
      end;
   end;
end;

procedure TFNotasDC.IniciaBotonesDetalle;
begin

   bbtnCalc.Enabled      := True;
   bbtnSumat.Enabled     := False;
   bbtnRegresa.Enabled   := False;
   bbtnCancela.Enabled   := False;
   Z2bbtnGraba.Enabled   := False;
   Z2bbtnAcepta.Enabled  := False;
   Z2bbtnAnula.Enabled   := False;
   Z2bbtnContab.Enabled  := False;
   Z2bbtnNuevo.Enabled   := False;
end;


procedure TFNotasDC.bbtnRegresaClick(Sender: TObject);
begin

   EstadoDeForma(0,DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString,DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString );

end;

procedure TFNotasDC._Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
   bbtnSumatClick(Sender);
end;

procedure TFNotasDC.dbeTCambioExit(Sender: TObject);
begin
   If xCrea then Exit;

   if bbtnBorra.Focused then Exit;
   if length(dbeTCambio.Text)=0 then
   begin
      ShowMessage('Falta Tipo de Cambio');
      dbeTCambio.SetFocus;
      exit;
   end;
//   dbeTCambio.Text:=floattostr(strtofloat(dbeTCambio.Text));
   if strtofloat(dbeTCambio.Text)<0 then
   begin
      ShowMessage('Tipo de Cambio debe ser Mayor a 0');
      dbeTCambio.Text:='';
      dbeTCambio.SetFocus;
      exit;
   end;
end;

procedure TFNotasDC.edtSerieExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if length(edtSerie.Text)=0 then
   begin
      edtSerie.SetFocus;
      Raise Exception.Create('Falta No.Serie');
   end;
   if Length(edtNoDoc.Text)=0 then edtNoDoc.SetFocus;
end;

procedure TFNotasDC.edtSerieKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then edtNoDoc.setfocus;
end;

procedure TFNotasDC.dblcCiaKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dblcdProv.setfocus;
end;

procedure TFNotasDC.dbeNoRegExit(Sender: TObject);
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
var
   xSQL:string;
// Fin HPC_201707_CXP

begin
   If xCrea then Exit;

   if (not( bbtnBorra.Focused)) and (not( dtpFComp.Focused))then begin

      dbeNoReg.Text := StrZero(dbeNoReg.Text,DMCXP.cdsMovCxP2.FieldByName('CPNOREG').Size);

      if DMCXP.BuscaCxPReg(dblcCia.Text,dblcTDiario.Text,wAnoMM,dbeNoReg.Text) then begin
         dbeNoReg.SetFocus;
         Raise Exception.Create( 'No.de Registro Duplicado' );
      end;
      //** 06/09/2001 - pjsv, se utiliza en la llamada al prorrateo
      xNRegistro := dbeNoReg.Text;
      //**

      pnlCab1.Enabled    := False;
      dblcTDiario.Enabled:= False;
      dtpFComp.Enabled   := False;
      dbeNoReg.Enabled   := False;
      dbeNoReg.Text := DMCXP.GrabaUltimoRegistro(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes,StrToInt(dbeNoReg.Text));
      DMCXP.cdsMovCxP2.FieldByName('CPTCAMPR').AsFloat := FRound(xxTCambio,7,3);
// Inicio HPC_201802_CXP
// Ajustes para registrar Nota de Crédito No Domiciliados
      DMCXP.cdsMovCxP2.FieldByName('DOCID').AsString :=dblcTDoc.Text;
// Fin HPC_201802_CXP
      DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString :=dblcTDiario.Text;
      DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString := StrZero(dbeNoReg.Text,DMCXP.cdsMovCxP2.FieldByName('CPNOREG').Size);
      DMCXP.cdsMovCxP2.FieldByName('CPSERIE').AsString := edtSerie.Text;
      DMCXP.cdsMovCxP2.FieldByName('CPNODOC').AsString := edtNoDoc.Text;
      DMCXP.cdsMovCxP2.FieldByName('CPUSER').AsString  :=DMCXP.wUsuario;
      DMCXP.cdsMovCxP2.FieldByName('CPFREG').AsDateTime:=date;
      DMCXP.cdsMovCxP2.FieldByName('CPHREG').AsDateTime:=time;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      DMCXP.cdsMovCxP2.FieldByName('PROVRUC').AsString := dblcdProvRuc.Text;
      cdsPost( DMCXP.cdsMovCxP2 );

       try
          xSQL := 'CALL SP_CNT_ING_NOT_CRE_CAB('
          +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString)+','
          +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString)+','
          +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString)+','
          +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString)+','
          +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CLAUXID').AsString)+','
          +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('PROV').AsString)+','
          +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('PROVRUC').AsString)+','
          +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('DOCID').AsString)+','
          +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSERIE').AsString)+','
          +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPNODOC').AsString)+','
          +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPTCAMPR').AsString)+','
          +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPUSER').AsString)+','
          +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPFCMPRB').AsString)+','
          +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('DCPLOTE').AsString)
          +')' ;
          DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);
        Except
            showmessage('Error al intentar grabar la cabecera de la nota de crédito');
            exit;
        Raise;
        End;        
// Inicia HPC_201401_CXP
         //DMCXP.AplicaDatos(DMCXP.cdsMovCxP2, 'MovCxP2');
         {if DMCXP.cdsMovCxP2.ApplyUpdates(0)>0 then
         begin
            ShowMessage('No se puede actualizar');
            exit;
         end;} 
// Fin HPC_201707_CXP
// Finaliza HPC_201401_CXP
      xFlagGr := True;
   end;
end;

procedure TFNotasDC.dblcdProvKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dblcdProvRuc.setfocus;
end;

procedure TFNotasDC.dblcdProvRucKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then edtSerie.setfocus;
end;

procedure TFNotasDC.edtNoDocKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dtpFComp.setfocus;
end;

procedure TFNotasDC.dtpFCompKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dbeNoReg.setfocus;
end;

procedure TFNotasDC.dbeNoRegKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dbeLote.setfocus;
end;

procedure TFNotasDC.dbeLoteKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dblcTMon.setfocus;
end;

procedure TFNotasDC.dblcTMonKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dbeTCambio.setfocus;
end;

procedure TFNotasDC.dbeTCambioKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dbdtpFRecep.setfocus;
end;

procedure TFNotasDC.dbdtpFRecepKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dbdtpFEmis.setfocus;
end;

procedure TFNotasDC.dbdtpFEmisKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then bbtnOK.setfocus;
end;

procedure TFNotasDC.btnActRegClick(Sender: TObject);
begin
   if rgAplica.ItemIndex=1 then begin
      if wTDev2=0 then
      begin
         Showmessage('Ingrese un Monto mayor a 0');
         exit;
      end;
   end;

   pnlDetCxP.Enabled  := False;
   pnlRegistro.Visible:= True;
   pnlRegistro.SetFocus;

   numreg:=numreg+1;
   DMCXP.cdsDetCxP.Last;
   numreg:=DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger+1;

   DMCXP.cdsDetCxP.Insert;
   DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger:=numreg;
   DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:=dbdtpFEmis.Date;
   dblcTipReg.Enabled:= True;
   dblcTipReg.Text   := '';
   edtTipReg.text    := '';
   edtCCosto.text    := '';
   dblcTipReg.SetFocus;
end;

procedure TFNotasDC.bbtnRegOkClick(Sender: TObject);
var
xSql : String;
xDiferencia,xMontoOri : Double;
xRecord : Integer;
begin
   //CLG: 27/11/2003
   // VALIDA LA CUENTA DEL CONCEPTO
   if (DMCXP.LaCuentaSeRegistraSoloEnME(dblcCia.text,dblcdCnpEgr.text,'')) and (dblcTMon.text=DMCXP.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+DMCXP.cdsQry.FieldByName('CUENTAID').AsString+' del Concepto '+dblcdCnpEgr.text+' Se registra sólo en Moneda Extranjera.');
   end;

   xTemTReg  := DMCXP.cdsDetCxP.FieldByName('TREGID').AsString;
   xTemCpto  := DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString;
   xTemCta   := DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString;
   xTemDH    := DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString;
   //** 18/12/2000 - pjsv - para presupuesto
   xtippre   := dblcTipPre.Text;
   //**
   if cbRepGlosa.Checked then BEGIN
      xGlosaRep:=dbeGlosa.text;
   end;


   If xDistri <> 'S' then
    begin
     if DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
      begin
        DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFLoat;
        if DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat>0 then
          DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat/DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
      end
     else
      begin
       DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat*DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
       DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      end;
     if DMCXP.cdsDetCxP.State=dsInsert then
      begin
//        cdsPost( DMCXP.cdsDetCxP );
         DMCXP.cdsDetCxP.Edit;
         cdsPost( DMCXP.cdsDetCxP );
         // VHN
         // Repetir Glosa
         if cbRepGlosa.Checked then BEGIN
            DMCXP.cdsDetCxP.First;
            while not DMCXP.cdsDetCxP.Eof do begin
               DMCXP.cdsDetCxP.Edit;
               DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:=xGlosaRep;
               DMCXP.cdsDetCxP.Next;
            end;
            cbRepGlosa.Checked:=False;
         end;
// Inicia HPC_201401_CXP
         //DMCXP.AplicaDatos(DMCXP.cdsDetCxP, 'DetCxP');
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
         {if DMCXP.cdsDetCxP.ApplyUpdates(0)>0 then
         begin
            ShowMessage('No se puede actualizar');
            exit;
         end;}
// Fin HPC_201707_CXP
// Finaliza HPC_201401_CXP
				//**

        //** inserta un nuevo registro
        DMCXP.cdsDetCxP.Append;
        dblcTipReg.Text := xTemTReg;
        DMCXP.cdsDetCxP.FieldByName('TREGID').AsString   := xTemTReg;
        DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   := xTemCpto;
        DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xTemCta;
        DMCXP.cdsDetCxP.FieldByName('DCPDH').ASString    := xTemDH;
        DMCXP.cdsDetCxP.FieldByName('TIPPRESID').AsString := xTipPre;
        numreg:=numreg+1;
        DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  := numreg;
        if xGlosaRep<>'' then
           DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:=xGlosaRep
        else
           DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:=xglosa;

        edtCCosto.Text := '';
        dblcTipReg.Enabled:=True;
        dblcTipReg.SetFocus;
      end
     else
     begin
        cdsPost( DMCXP.cdsDetCxP );
        DMCXP.cdsDetCxP.Post;
        pnlRegistro.Visible:=False;
        pnlDetalle.Enabled  :=True;
        pnlPie.Enabled     :=True;
        //** 10/10/2001 - pjsv
        pnlDetCxP.Enabled:= True;
        //**
      end;
    end
   else
    begin
     xSql := 'SELECT * FROM CXP102 WHERE CIAID='+quotedstr(dblcCia.text)+
             ' AND CPTOID='+quotedstr(xTemCpto)+'ORDER BY CCOSID';
     DMCXP.cdsQry3.Close;
     DMCXP.cdsQry3.ProviderName := 'dspTGE';
     DMCXP.cdsQry3.DataRequest(xSql);
     DMCXP.cdsQry3.Open;
     DMCXP.cdsQry3.First;
     xRecord := 0;
     xMontoOri := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFLoat;
     while not DMCXP.cdsQry3.Eof Do
      begin
       xRecord := xRecord + 1;
       //** mientras sea menor que el RecordCount se halla por el porcentaje
       If xRecord < DMCXP.cdsQry3.RecordCount then
        begin
         if DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
          begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat:=  FRound((xMontoOri * DMCXP.cdsQry3.FieldByName('PORCENTAJE').AsFloat)/100,15,3) ;
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:= FRound((xMontoOri * DMCXP.cdsQry3.FieldByName('PORCENTAJE').AsFloat)/100,15,3) ;
            if DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat>0 then
              DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=FRound(((xMontoOri *DMCXP.cdsQry3.FieldByName('PORCENTAJE').AsFloat)/100)/DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,3);
            xDiferencia := FRound(xDiferencia + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat,15,2);
          end
         else
          begin
           DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat:= FRound((xMontoOri * DMCXP.cdsQry3.FieldByName('PORCENTAJE').AsFloat)/100,15,3);
           DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=FRound(((xMontoOri * DMCXP.cdsQry3.FieldByName('PORCENTAJE').AsFloat)/100)*DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,3);
           DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:= FRound((xMontoOri * DMCXP.cdsQry3.FieldByName('PORCENTAJE').AsFloat)/100,15,3);
           xDiferencia := FRound(xDiferencia + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat,15,3);
          end;
        end
       else //** si el = al RecordCount se halla por diferencia
        begin
         if DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
          begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat:=  FRound(xMontoOri -xDiferencia,15,2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:= DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat; //xMontoOri -xDiferencia;
            if DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat>0 then
              DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=FRound((DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat)/DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
          end
         else
          begin
           DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat:= FRound(xMontoOri -xDiferencia,15,2) ;
           DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=FRound((DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat)*DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
           DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:= DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
          end;
        end;
       if DMCXP.cdsDetCxP.State=dsInsert then
        begin
          DMCXP.cdsDetCxP.FieldByName('CCOSID').AsString:= DMCXP.cdsQry3.FieldByName('CCOSID').AsString;
          cdsPost( DMCXP.cdsDetCxP );
          //** inserta un nuevo registro
          If xRecord < DMCXP.cdsQry3.RecordCount then
           begin
            DMCXP.cdsDetCxP.Insert;
            dblcTipReg.OnExit(dblcTipReg);
            dblcTipReg.Text := xTemTReg;
            DMCXP.cdsDetCxP.FieldByName('TREGID').AsString   := xTemTReg;
            DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   := xTemCpto;
            DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xTemCta;
            DMCXP.cdsDetCxP.FieldByName('DCPDH').ASString    := xTemDH;
            DMCXP.cdsDetCxP.FieldByName('TIPPRESID').AsString:= xTipPre;
            numreg:=numreg+1;
            DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  := numreg;
            //** cargo glosa
            if Length(DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString)=0 then
             DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGlosa;
            edtCCosto.Text := '';
           end;
        end
       else
        begin
          cdsPost( DMCXP.cdsDetCxP );
          DMCXP.cdsDetCxP.Post;
          If xRecord < DMCXP.cdsQry3.RecordCount then
           begin
            //** inserta un nuevo registro
            DMCXP.cdsDetCxP.Insert;
            dblcTipReg.OnExit(dblcTipReg);
            dblcTipReg.Text := xTemTReg;
            DMCXP.cdsDetCxP.FieldByName('TREGID').AsString   := xTemTReg;
            DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   := xTemCpto;
            DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xTemCta;
            DMCXP.cdsDetCxP.FieldByName('DCPDH').ASString    := xTemDH;
            DMCXP.cdsDetCxP.FieldByName('TIPPRESID').AsString := xTipPre;
            numreg:=numreg+1;
            DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  := numreg;
            //** cargo glosa
            if Length(DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString)=0 then
             DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGlosa;
            edtCCosto.Text := '';
           end;
          pnlRegistro.Visible:=False;
          pnlDetalle.Enabled  :=True;
          pnlPie.Enabled     :=True;
          pnlDetCxP.Enabled:= True;
        end;
        DMCXP.cdsQry3.next;
      end;
    end;
    //GLOSA
    if cbRepGlosa.Checked then BEGIN
       DMCXP.cdsDetCxP.First;
		 while not DMCXP.cdsDetCxP.Eof do begin
          DMCXP.cdsDetCxP.Edit;
          DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:=xGlosaRep;
          DMCXP.cdsDetCxP.Next;
       end;
// Inicia HPC_201401_CXP
      //DMCXP.AplicaDatos(DMCXP.cdsDetCxP, 'DetCxP');
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      {if DMCXP.cdsDetCxP.ApplyUpdates(0)>0 then
      begin
         ShowMessage('No se puede actualizar');
         exit;
      end; }
// Fin HPC_201707_CXP
// Finaliza HPC_201401_CXP
       cbRepGlosa.Checked:=False;
    end;

    pnlDetCxP.Enabled:= True;
end;

procedure TFNotasDC.bbtnRegCancClick(Sender: TObject);
begin
   if DMCXP.cdsDetCxP.State=dsInsert then
      DMCXP.cdsDetCxP.Delete
   else begin
      DMCXP.cdsDetCxp.Cancel;
   end;
   pnlRegistro.Visible:= False;
   pnlDetCxP.Enabled:=True;
   dbgDetCxP.SetFocus;
end;

procedure TFNotasDC.dbeDHExit(Sender: TObject);
begin
   if not bbtnRegCanc.Focused then begin
      if (dbeDH.Text<>'D') and (dbeDH.Text<>'H') then
      begin
         ShowMessage('Digite sólo D(para Debe) o H(para Haber)');
         DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString:='';
         dbeDH.SetFocus;
      end;
   end;
end;

procedure TFNotasDC.dblcdCCostoExit(Sender: TObject);
var
   xWhere : String;
begin
   if bbtnRegCanc.Focused then Exit;

   xWhere:='CCOSID='''+dblcdCCosto.Text+''' and CCOSMOV=''S'' AND CCOSACT=''S''';
   edtCCosto.Text:=BuscaQry('dspTGE','TGE203','CCOSDES',xWhere,'CCOSDES');

   if length(edtCCosto.Text)=0 then
   begin
      edtCCosto.Text:='';
      ShowMessage( 'Error : Centro de Costo Errado ');
      dblcdCCosto.setfocus;
      Exit;
   end;
end;

procedure TFNotasDC.dbeImporteExit(Sender: TObject);
begin
   if not bbtnRegCanc.Focused then begin
      if length(dbeImporte.Text)=0 then
         dbeImporte.Text:='0';
      if strtofloat(dbeImporte.Text)<=0 then
      begin
         ShowMessage('Importe debe ser mayor que 0');
         DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat:=0;
         dbeImporte.SetFocus;
      end;
   end;
end;

procedure TFNotasDC.dbgDetCxPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if not btnActReg.Enabled then Exit;

   if (key=VK_Delete) and (ssCtrl in Shift) then
   begin
      if MessageDlg('¿Esta Seguro de Eliminar Registro?',mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      begin
         DMCXP.cdsDetCxP.Delete;
         Items;
      end;
   end;
end;

procedure TFNotasDC.dbgDetCxPDblClick(Sender: TObject);
begin
   if btnActReg.Enabled then
   begin
      pnlDetCxP.Enabled:=False;
      pnlRegistro.Visible:=True;
      pnlRegistro.SetFocus;
      DMCXP.cdsDetCxP.Edit;
      dblcTipReg.Text:=DMCXP.cdsDetCxP.FieldByName('TREGID').AsString;
      dblcTipRegExit(Sender);
      edtCCosto.Text:=DMCXP.DisplayDescrip('TGE203','CCOSDES','CCOSID',dblcdCCosto.Text);
      //** 18/12/2000 - pjsv
      //edtPresup.Text:=DMCXP.DisplayDescrip('TGE216','PARPRESDES','PARPRESID',dblcdPresup.Text);
      edtPresup.Text:=DMCXP.DisplayDescrip('PPRES201','PARPRESDES','PARPRESID',dblcdPresup.Text);
      //**
      dblcTipReg.Enabled:=False;
      dblcdCnPEgr.SetFocus;
   end;
end;

procedure TFNotasDC.dbgDetCanjeCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   If DMCXP.wVRN_PagosParciales='S' then begin
      If (FIELD.FieldName='CCPFCJE') or
         (FIELD.FieldName='DCDTCAMB') or
         (FIELD.FieldName='DCDMOLOC') or
         (FIELD.FieldName='DCDMOEXT') then begin
         AFont.Color  := clBlack;
         ABrush.Color := clWindow;
      end;
   end;
end;

procedure TFNotasDC.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFNotasDC.FormCreate(Sender: TObject);
begin
   If ( DMCXP.wAdmin='G' ) then
   begin
      DMCXP.wObjetoDesPr := Caption;
      FPrincipal.ListaComponentes(Self);
   end;

   CargaDataSource;

end;

procedure TFNotasDC.CargaDataSource;
begin
   dblcCia.DataSource        :=DMCXP.dsMovCxP2;
   dblcCia.LookupTable       :=DMCXP.cdsCia;
   dblcClAux.DataSource      :=DMCXP.dsMovCxP2;
   dblcClAux.LookupTable     :=DMCXP.cdsClAux;
   dblcdProv.DataSource      :=DMCXP.dsMovCxP2;
   dblcdProv.LookupTable     :=DMCXP.cdsProv;
   dblcdProvRuc.DataSource   :=DMCXP.dsMovCxP2;
   dblcdProvRuc.LookupTable  :=DMCXP.cdsProv;
// Inicio HPC_201802_CXP 
// Ajustes para registrar Nota de Crédito No Domiciliados
   dblcTDoc.DataSource := DMCXP.dsMovCxP2;
   dblcTDoc.LookupTable := DMCXP.cdsTDoc;
// Fin HPC_201802_CXP
   dblcTDiario.DataSource    :=nil;
   dblcTDiario.LookupTable   :=DMCXP.cdsTDiario;
   dtpFComp.DataSource       :=DMCXP.dsMovCxP2;
   dbeNoReg.DataSource       :=DMCXP.dsMovCxP2;
   dbdtpFRecep.DataSource    :=DMCXP.dsMovCxP2;
   dbdtpFEmis.DataSource     :=DMCXP.dsMovCxP2;
   dblcTMon.DataSource       :=DMCXP.dsMovCxP2;
   dblcTMon.LookupTable      :=DMCXP.cdsTMon;
   dbeTCambio.DataSource     :=DMCXP.dsMovCxP2;
   dbeLote.DataSource        :=DMCXP.dsMovCxP2;

   dblcTipReg.DataSource     :=DMCXP.dsDetCxP;
   dblcTipReg.LookupTable    :=DMCXP.cdsTipReg;
   dblcdCnpEgr.DataSource    :=DMCXP.dsDetCxP;
   dblcdCnpEgr.LookupTable   :=DMCXP.cdsCnpEgr;
   dbeCuenta.DataSource      :=DMCXP.dsDetCxP;
   dbeGlosa.DataSource       :=DMCXP.dsDetCxP;
   dblcdCCosto.DataSource    :=DMCXP.dsDetCxP;
   dblcdCCosto.LookupTable   :=DMCXP.cdsCCosto;
   dblcTipPre.DataSource     :=DMCXP.dsDetCxP;
   dblcTipPre.LookupTable    :=DMCXP.cdsTipPre;
   dbeTipPre.DataSource      :=DMCXP.dsTipPre;
   dblcdPresup.DataSource    :=DMCXP.dsDetCxP;
   dblcdPresup.LookupTable   :=DMCXP.cdsPresup;
   dbeDH.DataSource          :=DMCXP.dsDetCxP;
   dbeImporte.DataSource     :=DMCXP.dsDetCxP;

   dblcImpuesto.DataSource   :=nil;
   dblcImpuesto.LookupTable  :=DMCXP.cdsTipReg2;

   dbgPendientes.DataSource  :=DMCXP.dsMovCxP;
   dbgCanje.DataSource       :=DMCXP.dsCanje;
   dbgPendientes2.DataSource :=DMCXP.dsLetras;
   dbgDetCanje.DataSource    :=DMCXP.dsDetCanje;
   dbgDetCxP.DataSource      :=DMCXP.dsDetCxP;
end;

procedure TFNotasDC.dblcdProvEnter(Sender: TObject);
begin
   if DMCXP.wVRN_ProvOrden<>'' then
      DMCXP.cdsProv.IndexFieldNames:=DMCXP.wVRN_ProvOrden
   else begin
      DMCXP.cdsProv.IndexFieldNames:='Prov';
   end;
///MODIFICADO PRO ANA
//   DMCXP.cdsProv.IndexFieldNames:='ProvDes';
//   DMCXP.cdsProv.IndexFieldNames:='Prov';
end;

procedure TFNotasDC.dblcdProvRucEnter(Sender: TObject);
begin
   DMCXP.cdsProv.IndexFieldNames:='ProvDes';
end;

procedure TFNotasDC.dblcClAuxExit(Sender: TObject);
var
	xWhere : String;
begin
  if xCrea then Exit;
  if bbtnBorra.Focused then Exit;

  xWhere:='CLAUXID='''+dblcClAux.Text+''' AND MODULO LIKE ''%'+DMCXP.wModulo+'%''';
  if length(BuscaQry('dspTGE','TGE102','CLAUXDES',xWhere,'CLAUXDES'))=0 then
  begin
  	dblcClAux.SetFocus;
    Raise Exception.Create('Clase de Auxiliar');
  end;
  Screen.Cursor:=crHourGlass;

  xWhere:='SELECT CLAUXID, PROV, PROVRUC, PROVDES, PROVABR, PROVNOMCOM,PROVRETIGV,PAISID,PROVDIR,PROVCZIP,PROVTELF,PROVFAX,PROVEMAI '
         +'FROM TGE201 WHERE CLAUXID='''+dblcClAux.Text+''' and NVL(ACTIVO,''N'')=''S''';
  Filtracds( DMCXP.cdsProv, xWhere );

  if Length(dblcdProv.Text)>0 then
  begin
  	xWhere:='CLAUXID='''+dblcClAux.Text+''' AND PROV='''+dblcdProv.Text+''' and NVL(ACTIVO,''N'')=''S''';
    if length(BuscaQry('dspTGE','TGE201','PROV,PROVRUC,PROVDES',xWhere,'PROVDES'))=0 then
    begin
    	dblcdProv.Text   :='';
      dblcdProvRuc.Text:='';
      edtProv.Text:='';
      dblcdprov.SetFocus;
    end
    else
    begin
    	dblcdProv.Text   :=DMCXP.cdsQry.FieldByname('PROV').AsString;
      dblcdProvRuc.Text:=DMCXP.cdsQry.FieldByname('PROVRUC').AsString;
      edtProv.Text     :=DMCXP.cdsQry.FieldByname('PROVDES').AsString;;
    end;
  end;
  if Length(dblcdProv.Text)=0 then dblcdProv.SetFocus;
  Screen.Cursor:=crDefault;
end;

//**********************************************************************//
{ pjsv - para presupuestos }
{ 08/10/20000 pjsv. para actualizar el monto ejecutado, monto variación y
  y variación en porcentaje en el PPRES301, se debe de recorrer el cds del
 grid para ver si hay MG,MN,NG }
procedure TFNotasDC.CalculoNivel;
var
  xmonto,xhora,xfecha,xEjecuMN,xEjecuME,xmes,ssql : string;
  xcambio : double;
  iX : integer;
  { xtotal[1] hasta xtotal[12] = EJMN01..EJMN12 --sumatoria por mes
    xtotal[13] hasta xtotal[24] = EJME01..EJME12 --sumatoria por mes
    xtotal[25] hasta xtotal[36] = VMMN01..VMME12 --sumatoria por mes
    xtotal[37] hasta xtotal[48] = VMME01..VMME12 --sumatoria por mes     }
  xtotal : Array[1..48] of double;
 { xtotg[1] = xtotal[1] hasta xtotal[12]
   xtotg[2] = xtotal[13] hasta xtotal[24]
   xtotg[3] = xtotal[23] hasta xtotal[36]
   xtotg[4] = xtotal[37] hasta xtotal[48]  }
  xtotG : Array[1..6] of double;
  { guarda los montos asignados del PPRES300}
  xasxmes : Array[1..24] of double;
  { guarda los montos modificados del PPRES300}
  xmoxmes : Array[1..24] of double;
  { xvpxmes[1] = (xtotal[1]/xasxmes[1]+xmoxmes[1])*100 para cada mes y MN,ME.
    xtotal[25] hasta xtotal[48] no se toma }
  xvpxmes : Array[1..24] of double;
  xestado : bool;
  xIS : string;
begin
   { crea los niveles superiores si no tuviera }
 if (SRV_D = 'DB2NT') or
    (SRV_D = 'DB2400') then
 begin
  CreaSuperior;
   DMCXP.cdsDetCxP.First;
    while not DMCXP.cdsDetCxP.eof do
     begin
      { registros que tienen las pp}
      if ( (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString='MG') or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString='NG')
            or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString='MN') )
         and ( DMCXP.cdsDetCxP.FieldByName('PARPRESID').AsString<>'' ) then
      begin
           xmes := xtmes; //copy(meAnoMM.Text,5,2);
           ssql := '';
           ssql := 'Update PPRES301 Set ';
           if dblcTMon.Text = DMCXP.wTMonLoc then
             begin
               xCambio := StrToFloat(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString)/ StrToFloat(dbeTCambio.text);
               xEjecuME := '('+DMCXP.wReplacCeros+'(DPREEJME'+xmes+',0) - '+FloatToStr(xcambio)+')';
               xEjecuMN := '('+DMCXP.wReplacCeros+'(DPREEJMN'+xmes+',0) - '+DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString+')';
               xmonto :=  DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString;
             end
           else
            begin
               xCambio := StrToFloat(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString)* StrToFloat(dbeTCambio.text);
               xEjecuME := '('+DMCXP.wReplacCeros+'(DPREEJME'+xmes+',0) - '+DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString+')';
               xEjecuMN := '('+DMCXP.wReplacCeros+'(DPREEJMN'+xmes+',0) - '+FloatToStr(xcambio)+')';
               xmonto := DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString;
            end;
           ssql := ssql + 'DPREEJMN'+xmes+'= DEC('+xEjecuMN+',15,2), ';
           ssql := ssql + 'DPREEJME'+xmes+'= DEC('+xEjecuME+',15,2), ';
           if dblcTMon.Text = DMCXP.wTMonLoc then
            begin
             ssql := ssql + 'DPREVMMN'+xmes+'= DEC(('+DMCXP.wReplacCeros+'(DPREASMN'+xmes+',0) + '+DMCXP.wReplacCeros+'(DPREMOMN'+xmes+',0))-('+DMCXP.wReplacCeros+'(DPREEJMN'+xmes+',0)-'+xmonto+'),15,2), ';
             ssql := ssql + 'DPREVMME'+xmes+'= DEC(('+DMCXP.wReplacCeros+'(DPREASME'+xmes+',0) + '+DMCXP.wReplacCeros+'(DPREMOME'+xmes+',0))-('+DMCXP.wReplacCeros+'(DPREEJME'+xmes+',0)-'+FloatToStr(xcambio)+'),15,2), ';
             ssql := ssql + 'DPREVPMN'+xmes+'= (CASE WHEN '+DMCXP.wReplacCeros+'(DPRETOASMN,0)+'+DMCXP.wReplacCeros+'(DPRETOMOMN,0)=0'+
                                               ' THEN 200'+
                                               ' ELSE DEC((('+DMCXP.wReplacCeros+'(DPREEJMN'+xmes+',0)-'+xmonto+')/('+DMCXP.wReplacCeros+'(DPREASMN'+xmes+',0) + '+DMCXP.wReplacCeros+'(DPREMOMN'+xmes+',0)))*100,15,2)END),';
             ssql := ssql + 'DPREVPME'+xmes+'= (CASE WHEN '+DMCXP.wReplacCeros+'(DPRETOASME,0)+'+DMCXP.wReplacCeros+'(DPRETOMOME,0)=0'+
                                               ' THEN 200'+
                                               ' ELSE DEC((('+DMCXP.wReplacCeros+'(DPREEJME'+xmes+',0)-'+xmonto+')/('+DMCXP.wReplacCeros+'(DPREASME'+xmes+',0) + '+DMCXP.wReplacCeros+'(DPREMOME'+xmes+',0)))*100,15,2)END),';
             ssql := ssql + 'DPRETOEJMN=DEC('+DMCXP.wReplacCeros+'(DPREEJMN01,0)+'+DMCXP.wReplacCeros+'(DPREEJMN02,0)+'+DMCXP.wReplacCeros+'(DPREEJMN03,0)+'+DMCXP.wReplacCeros+'(DPREEJMN04,0)+'+DMCXP.wReplacCeros+'(DPREEJMN05,0)+'+DMCXP.wReplacCeros+'(DPREEJMN06,0)+'+
                                           ''+DMCXP.wReplacCeros+'(DPREEJMN07,0)+'+DMCXP.wReplacCeros+'(DPREEJMN08,0)+'+DMCXP.wReplacCeros+'(DPREEJMN09,0)+'+DMCXP.wReplacCeros+'(DPREEJMN10,0)+'+DMCXP.wReplacCeros+'(DPREEJMN11,0)+'+DMCXP.wReplacCeros+'(DPREEJMN12,0)-'+
                                           xmonto+',15,2),';
             ssql := ssql + 'DPRETOVMMN=DEC('+DMCXP.wReplacCeros+'(DPREVMMN01,0)+'+DMCXP.wReplacCeros+'(DPREVMMN02,0)+'+DMCXP.wReplacCeros+'(DPREVMMN03,0)+'+DMCXP.wReplacCeros+'(DPREVMMN04,0)+'+DMCXP.wReplacCeros+'(DPREVMMN05,0)+'+DMCXP.wReplacCeros+'(DPREVMMN06,0)+'+
                                           ''+DMCXP.wReplacCeros+'(DPREVMMN07,0)+'+DMCXP.wReplacCeros+'(DPREVMMN08,0)+'+DMCXP.wReplacCeros+'(DPREVMMN09,0)+'+DMCXP.wReplacCeros+'(DPREVMMN10,0)+'+DMCXP.wReplacCeros+'(DPREVMMN11,0)+'+DMCXP.wReplacCeros+'(DPREVMMN12,0)+'+
                                           '('+DMCXP.wReplacCeros+'(DPREASMN'+xmes+',0) + '+DMCXP.wReplacCeros+'(DPREMOMN'+xmes+',0))-('+DMCXP.wReplacCeros+'(DPREEJMN'+xmes+',0)-'+xmonto+'),15,2),';

             ssql := ssql + 'DPRETOVPMN=(CASE WHEN '+DMCXP.wReplacCeros+'(DPRETOASMN,0)+'+DMCXP.wReplacCeros+'(DPRETOMOMN,0)=0'+
                                         ' THEN 200'+
                                         ' ELSE DEC((('+DMCXP.wReplacCeros+'(DPREEJMN01,0)+'+DMCXP.wReplacCeros+'(DPREEJMN02,0)+'+DMCXP.wReplacCeros+'(DPREEJMN03,0)+'+DMCXP.wReplacCeros+'(DPREEJMN04,0)+'+DMCXP.wReplacCeros+'(DPREEJMN05,0)+'+DMCXP.wReplacCeros+'(DPREEJMN06,0)+'+
                                         ' '+DMCXP.wReplacCeros+'(DPREEJMN07,0)+'+DMCXP.wReplacCeros+'(DPREEJMN08,0)+'+DMCXP.wReplacCeros+'(DPREEJMN09,0)+'+DMCXP.wReplacCeros+'(DPREEJMN10,0)+'+DMCXP.wReplacCeros+'(DPREEJMN11,0)+'+DMCXP.wReplacCeros+'(DPREEJMN12,0)-'+
                                          xmonto+')/(('+DMCXP.wReplacCeros+'(DPRETOASMN,0) )+('+DMCXP.wReplacCeros+'(DPRETOMOMN,0))))*100,15,2)END),';
             ssql := ssql +'DPRETOEJME=DEC('+DMCXP.wReplacCeros+'(DPREEJME01,0)+'+DMCXP.wReplacCeros+'(DPREEJME02,0)+'+DMCXP.wReplacCeros+'(DPREEJME03,0)+'+DMCXP.wReplacCeros+'(DPREEJME04,0)+'+DMCXP.wReplacCeros+'(DPREEJME05,0)+'+DMCXP.wReplacCeros+'(DPREEJME06,0)+'+
                                          ''+DMCXP.wReplacCeros+'(DPREEJME07,0)+'+DMCXP.wReplacCeros+'(DPREEJME08,0)+'+DMCXP.wReplacCeros+'(DPREEJME09,0)+'+DMCXP.wReplacCeros+'(DPREEJME10,0)+'+DMCXP.wReplacCeros+'(DPREEJME11,0)+'+DMCXP.wReplacCeros+'(DPREEJME12,0)-'+
                                           FloatToStr(xcambio)+',15,2),';
             ssql := ssql + 'DPRETOVMME=DEC('+DMCXP.wReplacCeros+'(DPREVMME01,0)+'+DMCXP.wReplacCeros+'(DPREVMME02,0)+'+DMCXP.wReplacCeros+'(DPREVMME03,0)+'+DMCXP.wReplacCeros+'(DPREVMME04,0)+'+DMCXP.wReplacCeros+'(DPREVMME05,0)+'+DMCXP.wReplacCeros+'(DPREVMME06,0)+'+
                                           ''+DMCXP.wReplacCeros+'(DPREVMME07,0)+'+DMCXP.wReplacCeros+'(DPREVMME08,0)+'+DMCXP.wReplacCeros+'(DPREVMME09,0)+'+DMCXP.wReplacCeros+'(DPREVMME10,0)+'+DMCXP.wReplacCeros+'(DPREVMME11,0)+'+DMCXP.wReplacCeros+'(DPREVMME12,0)+'+
                                           '('+DMCXP.wReplacCeros+'(DPREASME'+xmes+',0) + '+DMCXP.wReplacCeros+'(DPREMOME'+xmes+',0))-('+DMCXP.wReplacCeros+'(DPREEJME'+xmes+',0)-'+FloatToStr(xcambio)+'),15,2),';
             ssql := ssql + 'DPRETOVPME=(CASE WHEN '+DMCXP.wReplacCeros+'(DPRETOASME,0)+'+DMCXP.wReplacCeros+'(DPRETOMOME,0)=0'+
                                         ' THEN 200'+
                                         ' ELSE DEC((('+DMCXP.wReplacCeros+'(DPREEJME01,0)+'+DMCXP.wReplacCeros+'(DPREEJME02,0)+'+DMCXP.wReplacCeros+'(DPREEJME03,0)+'+DMCXP.wReplacCeros+'(DPREEJME04,0)+'+DMCXP.wReplacCeros+'(DPREEJME05,0)+'+DMCXP.wReplacCeros+'(DPREEJME06,0)+'+
                                         ' '+DMCXP.wReplacCeros+'(DPREEJME07,0)+'+DMCXP.wReplacCeros+'(DPREEJME08,0)+'+DMCXP.wReplacCeros+'(DPREEJME09,0)+'+DMCXP.wReplacCeros+'(DPREEJME10,0)+'+DMCXP.wReplacCeros+'(DPREEJME11,0)+'+DMCXP.wReplacCeros+'(DPREEJME12,0)-'+
                                          FloatToStr(xcambio)+')/(('+DMCXP.wReplacCeros+'(DPRETOASME,0) )+('+DMCXP.wReplacCeros+'(DPRETOMOME,0))))*100,15,2)END),';
            end
           else
            begin
             ssql := ssql + 'DPREVMMN'+xmes+'= DEC(('+DMCXP.wReplacCeros+'(DPREASMN'+xmes+',0) + '+DMCXP.wReplacCeros+'(DPREMOMN'+xmes+',0))-('+DMCXP.wReplacCeros+'(DPREEJMN'+xmes+',0)-'+FloatToStr(xcambio)+'),15,2), ';
             ssql := ssql + 'DPREVMME'+xmes+'= DEC(('+DMCXP.wReplacCeros+'(DPREASME'+xmes+',0) + '+DMCXP.wReplacCeros+'(DPREMOME'+xmes+',0))-('+DMCXP.wReplacCeros+'(DPREEJME'+xmes+',0)-'+xmonto+'),15,2), ';
             ssql := ssql + 'DPREVPMN'+xmes+'= (CASE WHEN '+DMCXP.wReplacCeros+'(DPREASMN'+xmes+',0) + '+DMCXP.wReplacCeros+'(DPREMOMN'+xmes+',0) = 0'+
                                               ' THEN 200'+
                                               ' ELSE DEC((('+DMCXP.wReplacCeros+'(DPREEJMN'+xmes+',0)-'+FloatToSTr(xcambio)+')/('+DMCXP.wReplacCeros+'(DPREASMN'+xmes+',0) + '+DMCXP.wReplacCeros+'(DPREMOMN'+xmes+',0)))*100,15,2)END), ';
             ssql := ssql + 'DPREVPME'+xmes+'= (CASE WHEN '+DMCXP.wReplacCeros+'(DPREASME'+xmes+',0) + '+DMCXP.wReplacCeros+'(DPREMOME'+xmes+',0) = 0 '+
                                               ' THEN 200'+
                                               ' ELSE DEC((('+DMCXP.wReplacCeros+'(DPREEJME'+xmes+',0)-'+xmonto+')/('+DMCXP.wReplacCeros+'(DPREASME'+xmes+',0) + '+DMCXP.wReplacCeros+'(DPREMOME'+xmes+',0)))*100,15,2)END),';
             ssql := ssql + 'DPRETOEJME=DEC('+DMCXP.wReplacCeros+'(DPREEJME01,0)+'+DMCXP.wReplacCeros+'(DPREEJME02,0)+'+DMCXP.wReplacCeros+'(DPREEJME03,0)+'+DMCXP.wReplacCeros+'(DPREEJME04,0)+'+DMCXP.wReplacCeros+'(DPREEJME05,0)+'+DMCXP.wReplacCeros+'(DPREEJME06,0)+'+
                                           ''+DMCXP.wReplacCeros+'(DPREEJME07,0)+'+DMCXP.wReplacCeros+'(DPREEJME08,0)+'+DMCXP.wReplacCeros+'(DPREEJME09,0)+'+DMCXP.wReplacCeros+'(DPREEJME10,0)+'+DMCXP.wReplacCeros+'(DPREEJME11,0)+'+DMCXP.wReplacCeros+'(DPREEJME12,0)-'+
                                           xmonto+',15,2),';
             ssql := ssql + 'DPRETOVMME=DEC('+DMCXP.wReplacCeros+'(DPREVMME01,0)+'+DMCXP.wReplacCeros+'(DPREVMME02,0)+'+DMCXP.wReplacCeros+'(DPREVMME03,0)+'+DMCXP.wReplacCeros+'(DPREVMME04,0)+'+DMCXP.wReplacCeros+'(DPREVMME05,0)+'+DMCXP.wReplacCeros+'(DPREVMME06,0)+'+
                                           ''+DMCXP.wReplacCeros+'(DPREVMME07,0)+'+DMCXP.wReplacCeros+'(DPREVMME08,0)+'+DMCXP.wReplacCeros+'(DPREVMME09,0)+'+DMCXP.wReplacCeros+'(DPREVMME10,0)+'+DMCXP.wReplacCeros+'(DPREVMME11,0)+'+DMCXP.wReplacCeros+'(DPREVMME12,0)+'+
                                           '('+DMCXP.wReplacCeros+'(DPREASME'+xmes+',0) + '+DMCXP.wReplacCeros+'(DPREMOME'+xmes+',0))-('+DMCXP.wReplacCeros+'(DPREEJME'+xmes+',0)-'+xmonto+'),15,2),';
             ssql := ssql + 'DPRETOVPME=(CASE WHEN '+DMCXP.wReplacCeros+'(DPRETOASME,0)+('+DMCXP.wReplacCeros+'(DPRETOMOME,0) = 0 '+
                                        ' THEN 200 '+
                                        ' ELSE DEC((('+DMCXP.wReplacCeros+'(DPREEJME01,0)+'+DMCXP.wReplacCeros+'(DPREEJME02,0)+'+DMCXP.wReplacCeros+'(DPREEJME03,0)+'+DMCXP.wReplacCeros+'(DPREEJME04,0)+'+DMCXP.wReplacCeros+'(DPREEJME05,0)+'+DMCXP.wReplacCeros+'(DPREEJME06,0)+'+
                                               ''+DMCXP.wReplacCeros+'(DPREEJME07,0)+'+DMCXP.wReplacCeros+'(DPREEJME08,0)+'+DMCXP.wReplacCeros+'(DPREEJME09,0)+'+DMCXP.wReplacCeros+'(DPREEJME10,0)+'+DMCXP.wReplacCeros+'(DPREEJME11,0)+'+DMCXP.wReplacCeros+'(DPREEJME12,0)-'+
                                                xmonto+')/(('+DMCXP.wReplacCeros+'(DPRETOASME,0))+('+DMCXP.wReplacCeros+'(DPRETOMOME,0))))*100,15,2)END),';
             ssql := ssql +'DPRETOEJMN=DEC('+DMCXP.wReplacCeros+'(DPREEJMN01,0)+'+DMCXP.wReplacCeros+'(DPREEJMN02,0)+'+DMCXP.wReplacCeros+'(DPREEJMN03,0)+'+DMCXP.wReplacCeros+'(DPREEJMN04,0)+'+DMCXP.wReplacCeros+'(DPREEJMN05,0)+'+DMCXP.wReplacCeros+'(DPREEJMN06,0)+'+
                                          ''+DMCXP.wReplacCeros+'(DPREEJMN07,0)+'+DMCXP.wReplacCeros+'(DPREEJMN08,0)+'+DMCXP.wReplacCeros+'(DPREEJMN09,0)+'+DMCXP.wReplacCeros+'(DPREEJMN10,0)+'+DMCXP.wReplacCeros+'(DPREEJMN11,0)+'+DMCXP.wReplacCeros+'(DPREEJMN12,0)-'+
                                           FloatToStr(xcambio)+',15,2),';
             ssql := ssql + 'DPRETOVMMN=DEC('+DMCXP.wReplacCeros+'(DPREVMMN01,0)+'+DMCXP.wReplacCeros+'(DPREVMMN02,0)+'+DMCXP.wReplacCeros+'(DPREVMMN03,0)+'+DMCXP.wReplacCeros+'(DPREVMMN04,0)+'+DMCXP.wReplacCeros+'(DPREVMMN05,0)+'+DMCXP.wReplacCeros+'(DPREVMMN06,0)+'+
                                           ''+DMCXP.wReplacCeros+'(DPREVMMN07,0)+'+DMCXP.wReplacCeros+'(DPREVMMN08,0)+'+DMCXP.wReplacCeros+'(DPREVMMN09,0)+'+DMCXP.wReplacCeros+'(DPREVMMN10,0)+'+DMCXP.wReplacCeros+'(DPREVMMN11,0)+'+DMCXP.wReplacCeros+'(DPREVMMN12,0)+'+
                                           '('+DMCXP.wReplacCeros+'(DPREASMN'+xmes+',0) + '+DMCXP.wReplacCeros+'(DPREMOMN'+xmes+',0))-('+DMCXP.wReplacCeros+'(DPREEJMN'+xmes+',0)-'+FloatToStr(xcambio)+'),15,2),';

             ssql := ssql + 'DPRETOVPMN=(CASE WHEN '+DMCXP.wReplacCeros+'(DPRETOASMN,0)+'+DMCXP.wReplacCeros+'(DPRETOMOMN,0) = 0'+
                                   ' THEN 200 '+
                                   ' ELSE DEC((('+DMCXP.wReplacCeros+'(DPREEJMN01,0)+'+DMCXP.wReplacCeros+'(DPREEJMN02,0)+'+DMCXP.wReplacCeros+'(DPREEJMN03,0)+'+DMCXP.wReplacCeros+'(DPREEJMN04,0)+'+DMCXP.wReplacCeros+'(DPREEJMN05,0)+'+DMCXP.wReplacCeros+'(DPREEJMN06,0)+'+
                                   ' '+DMCXP.wReplacCeros+'(DPREEJMN07,0)+'+DMCXP.wReplacCeros+'(DPREEJMN08,0)+'+DMCXP.wReplacCeros+'(DPREEJMN09,0)+'+DMCXP.wReplacCeros+'(DPREEJMN10,0)+'+DMCXP.wReplacCeros+'(DPREEJMN11,0)+'+DMCXP.wReplacCeros+'(DPREEJMN12,0)+'+
                                    FloatToStr(xcambio)+')/('+DMCXP.wReplacCeros+'(DPRETOASMN,0)+'+DMCXP.wReplacCeros+'(DPRETOMOMN,0)))*100,15,2)END),';
            end;
           ssql := ssql + 'RQPARTUSER='+ quotedstr(DMCXP.wUsuario);
           xFecha := formatdatetime(DMCXP.wFormatFecha,Date);
           ssql := ssql + ',RQPARTFREG =Date('+quotedstr(xfecha)+')';
           xhora := formatdatetime('hh:nn:ss',time);
           ssql := ssql + ',RQPARTHREG =time('+quotedstr(xhora)+')'+
                          ' WHERE CIAID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)+
                          ' AND CCOSID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+
                          ' AND TIPPRESID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('TIPPRESID').AsString)+
                          ' AND PARPRESID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('PARPRESID').AsString)+
                          ' AND RQPARTANO='+quotedstr(xtano);
           DMCXP.DCOM1.AppServer.EjecutaSQL(sSQL);

           // se inicia la actualización de la cabecera
           { inicializo en cero el arreglo }
           For iX := 1 to 48 do xTotal[iX]  :=0;
           For iX := 1 to 6  do xTotg[iX]   :=0;
           For iX := 1 to 24 do xasxmes[iX] :=0;
           For iX := 1 to 24 do xmoxmes[iX] :=0;
           For iX := 1 to 24 do xvpxmes[iX] :=0;
           { para cargar los AS y MO de cada mes }
           ssql := '';
           ssql := 'SELECT * FROM PPRES300'+
                   ' WHERE CIAID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)+
                   ' AND CCOSID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+
                   ' AND RQPARTANO='+quotedstr(xtano);
           DMCXP.cdsQry2.Close;
           DMCXP.cdsQry2.ProviderName:= 'dspCxP';
           DMCXP.cdsQry2.DataRequest(ssql);
           DMCXP.cdsQry2.open;
           DMCXP.cdsQry2.First;
           while not DMCXP.cdsQry2.Eof do
            begin
             For iX := 1 to 12 do
              begin
                xmes := StrZero(IntToStr(iX),2);
                xasxmes[iX]    := StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREASMN'+xmes).AsString);
                xasxmes[iX+12] := StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREASME'+xmes).AsString);
                xmoxmes[iX]    := StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREMOMN'+xmes).AsString);
                xmoxmes[iX+12] := StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREMOME'+xmes).AsString);
              end;
             DMCXP.cdsQry2.Next;
            end;

           { actualiza la cabecera de Presupuesto PPRES300, toma del PPRES301
             los EJ,VM y VP por mes para un mismo centro de costo y los sumariza
             para cargarlos a los campos respectivos del PPRES300 }
           ssql := '';
           ssql := 'SELECT * FROM PPRES301'+
                   ' WHERE CIAID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)+
                   ' AND CCOSID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+
                   ' AND RQPARTANO='+quotedstr(xtano);
           DMCXP.cdsQry2.Close;
           DMCXP.cdsQry2.ProviderName:= 'dspCxP';
           DMCXP.cdsQry2.DataRequest(ssql);
           DMCXP.cdsQry2.open;
           DMCXP.cdsQry2.First;
           { recorro la tabla PPRES301 para hallar los totales por mes y
             por campos( EJ, VM, VP ) y por mes }
           while not DMCXP.cdsQry2.Eof do
            begin
             //** 03/11/2000 - pjsv
             ssql := '';
             ssql := 'PARPRESID='+quotedstr(DMCXP.cdsQry2.fieldbyname('PARPRESID').AsString);
             xIS := BuscaQRY('dspPlaParPre','PPRES201','*',ssql,'PARPRES_IS');
             //**
             For iX := 1 to 24 do
              case iX of
                { para DPREEJMN01..12 }
               1,2,3,4,5,6,7,8,9,10,11,12 :
                  begin
                    xmes := StrZero(IntToStr(iX),2);
                    //** 03/11/2000 - pjsv, tiene que chequear si el PARPRES_IS
                    // del PPRES201 es I = resta,  o S = suma
                    if xIS = 'S' then
                     xTotal[iX] := xTotal[iX] + StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREEJMN'+xmes).AsString)
                    else
                     xTotal[iX] := xTotal[iX] - StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREEJMN'+xmes).AsString)
                  end;
               { para DPREEJME01..12 }
               13,14,15,16,17,18,19,20,21,22,23,24 :
                  begin
                    xmes := StrZero(IntToStr(iX-12),2);
                    //** 03/11/2000 - pjsv, tiene que chequear si el PARPRES_IS
                    // del PPRES201 es I = resta,  o S = suma
                    if xIS = 'S' then
                     xTotal[iX] := xTotal[iX] + StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREEJME'+xmes).AsString)
                    else
                     xTotal[iX] := xTotal[iX] - StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREEJME'+xmes).AsString)
                  end;
              end;
             DMCXP.cdsQry2.next;
            end;
           // para controlar el error del INFINITO
           xestado := false;
           for ix := 1 to 12 do
            if (xasxmes[ix] <> 0) or (xmoxmes[ix] <> 0) then
             begin
              xestado := true; Break;
             end;
           { hallo el total por mes de VP }
           for ix := 1 to 12 do
            begin
             // se agrega 17/10/2000 pjsv - para que solo calcule el mes
             // del periodo, si se quita el if calcula todos los meses
             if StrZero(IntToStr(iX),2) = xtmes then
              begin
                { para DPREVMMN01..12 }
                xTotal[iX+24] := (xasxmes[iX]+xmoxmes[iX]) - xTotal[iX];
                { para DPREVMME01..12 }
                xTotal[iX+36] := (xasxmes[iX+12]+xmoxmes[iX+12])  - xTotal[iX+12];
                // se agrego el 23/10/200 pjsv
                if xestado = False then
                  begin
                   // los igualo a cero
                   xvpxmes[iX] := 0;
                   { para VPME }
                   xvpxmes[iX+12] := 0;
                  end
                else
                 begin
                  { para VPMN }
                  xvpxmes[iX]    := (xtotal[ix]/(xasxmes[iX]+xmoxmes[iX]))*100;
                  { para VPME }
                  xvpxmes[iX+12] := (xtotal[ix+12]/(xasxmes[iX+12]+xmoxmes[iX+12]))*100;
                 end;
              end;
            end;
           ssql := '';
           ssql := 'Update PPRES300 Set ';
           For iX := 1 to 12 do
            begin
             xmes := StrZero(IntToStr(iX),2);
             { carga para cada mes y campo el valor hallado en las lineas de
               arriba }
             ssql := ssql + ' DPREEJMN'+xmes+'=DEC('+FloatToStr(xtotal[iX]) +',15,2),';
             ssql := ssql + ' DPREEJME'+xmes+'=DEC('+FloatToStr(xtotal[iX+12]) +',15,2),';
             ssql := ssql + ' DPREVMMN'+xmes+'=DEC('+FloatToStr(xtotal[iX+24]) +',15,2),';
             ssql := ssql + ' DPREVMME'+xmes+'=DEC('+FloatToStr(xtotal[iX+36]) +',15,2),';
             ssql := ssql + ' DPREVPMN'+xmes+'=DEC('+FloatToStr(xvpxmes[iX]) +',15,2),';
             ssql := ssql + ' DPREVPME'+xmes+'=DEC('+FloatToStr(xvpxmes[iX+12]) +',15,2),';
            end;
           { SUMATORIA DE LOS EJMN, LOS DOCE MESES }
           For iX := 1 to 12 do
             xtotG[1] := xtotG[1] + xtotal[iX];
           { SUMATORIA DE LOS EJME, LOS DOCE MESES }
           For iX := 13 to 24 do
             xtotG[2] := xtotG[2] + xtotal[iX];
           { SUMATORIA DE LOS MOMN, LOS DOCE MESES }
           For iX := 25 to 36 do
             xtotG[3] := xtotG[3] + xtotal[iX];
           { SUMATORIA DE LOS MOME, LOS DOCE MESES }
           For iX := 37 to 48 do
             xtotG[4] := xtotG[4] + xtotal[iX];
           if xestado = False then
            begin
             // los igualo a cero
             xtotG[5] := 0; xtotG[6] := 0;
            end
           else
            begin
             {  calculo del total VPMN }
             xtotG[5] := (xtotG[1]/((xasxmes[1]+xasxmes[2]+xasxmes[3]+xasxmes[4]+xasxmes[5]+xasxmes[6]+
                                   xasxmes[7]+xasxmes[8]+xasxmes[9]+xasxmes[10]+xasxmes[11]+xasxmes[12])+
                                   (xmoxmes[1]+xmoxmes[2]+xmoxmes[3]+xmoxmes[4]+xmoxmes[5]+xmoxmes[6]+
                                   xmoxmes[7]+xmoxmes[8]+xmoxmes[9]+xmoxmes[10]+xmoxmes[11]+xmoxmes[12])))*100;
             { calculo del total VPME }
             xtotG[6] := (xtotG[2]/((xasxmes[13]+xasxmes[14]+xasxmes[15]+xasxmes[16]+xasxmes[17]+xasxmes[18]+
                                   xasxmes[19]+xasxmes[20]+xasxmes[21]+xasxmes[22]+xasxmes[23]+xasxmes[24])+
                                   (xmoxmes[13]+xmoxmes[14]+xmoxmes[15]+xmoxmes[16]+xmoxmes[17]+xmoxmes[18]+
                                   xmoxmes[19]+xmoxmes[20]+xmoxmes[21]+xmoxmes[22]+xmoxmes[23]+xmoxmes[24])))*100;
            end;
           { asigno los totales para EJ,VM y VP en MN y ME }
           ssql := ssql + ' DPRETOEJMN=DEC('+FloatToStr(xtotg[1]) +',15,2),';
           ssql := ssql + ' DPRETOEJME=DEC('+FloatToStr(xtotg[2]) +',15,2),';
           ssql := ssql + ' DPRETOVMMN=DEC('+FloatToStr(xtotg[3]) +',15,2),';
           ssql := ssql + ' DPRETOVMME=DEC('+FloatToStr(xtotg[4]) +',15,2),';
           ssql := ssql + ' DPRETOVPMN=DEC('+FloatToStr(xtotg[5]) +',15,2),';
           ssql := ssql + ' DPRETOVPME=DEC('+FloatToStr(xtotg[6]) +',15,2),';
           { otros campos a actualizar }
           ssql := ssql + 'RQPARTUSER='+ quotedstr(DMCXP.wUsuario);
           xFecha := formatdatetime(DMCXP.wFormatFecha,Date);
           ssql := ssql + ',RQPARTFREG =Date('+quotedstr(xfecha)+')';
           xhora := formatdatetime('hh:nn:ss',time);
           ssql := ssql + ',RQPARTHREG =time('+quotedstr(xhora)+')'+
           { condicional }
                          ' WHERE CIAID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)+
                          ' AND CCOSID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+
                          ' AND RQPARTANO='+quotedstr(xtano);
           DMCXP.DCOM1.AppServer.EjecutaSQL(sSQL);
        end;
       DMCXP.cdsDetCxP.Next;
     end;
   { ahora para los niveles speriores }
  end
  else
	if SRV_D = 'ORACLE' then
  begin
  CreaSuperior;
   DMCXP.cdsDetCxP.First;
    while not DMCXP.cdsDetCxP.eof do
     begin
      { registros que tienen las pp}
      if (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString='MG') or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString='NG')
         or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString='MN') then
        begin
           xmes := xtmes; //copy(meAnoMM.Text,5,2);
           ssql := '';
           ssql := 'Update PPRES301 Set ';
           if dblcTMon.Text = DMCXP.wTMonLoc then
             begin
               xCambio := StrToFloat(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString)/ StrToFloat(dbeTCambio.text);
               xEjecuME := '('+DMCXP.wReplacCeros+'(DPREEJME'+xmes+',0) - '+FloatToStr(xcambio)+')';
               xEjecuMN := '('+DMCXP.wReplacCeros+'(DPREEJMN'+xmes+',0) - '+DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString+')';
               xmonto :=  DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString;
             end
           else
            begin
               xCambio := StrToFloat(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString)* StrToFloat(dbeTCambio.text);
               xEjecuME := '('+DMCXP.wReplacCeros+'(DPREEJME'+xmes+',0) - '+DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString+')';
               xEjecuMN := '('+DMCXP.wReplacCeros+'(DPREEJMN'+xmes+',0) - '+FloatToStr(xcambio)+')';
               xmonto := DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsString;
            end;
           ssql := ssql + 'DPREEJMN'+xmes+'= TRUNC('+xEjecuMN+',2), ';
           ssql := ssql + 'DPREEJME'+xmes+'= TRUNC('+xEjecuME+',2), ';
           if dblcTMon.Text = DMCXP.wTMonLoc then
            begin
             ssql := ssql + 'DPREVMMN'+xmes+'= TRUNC((NVL(DPREASMN'+xmes+',0) + NVL(DPREMOMN'+xmes+',0))-(NVL(DPREEJMN'+xmes+',0)-'+xmonto+'),2), ';
             ssql := ssql + 'DPREVMME'+xmes+'= TRUNC((NVL(DPREASME'+xmes+',0) + NVL(DPREMOME'+xmes+',0))-(NVL(DPREEJME'+xmes+',0)-'+FloatToStr(xcambio)+'),2), ';
             ssql := ssql + 'DPREVPMN'+xmes+'= (DECODE(NVL(DPRETOASMN,0)+NVL(DPRETOMOMN,0),0,200,'+
                                               ' TRUNC(((NVL(DPREEJMN'+xmes+',0)-'+xmonto+')/(NVL(DPREASMN'+xmes+',0) + NVL(DPREMOMN'+xmes+',0)))*100,2))),';
             ssql := ssql + 'DPREVPME'+xmes+'= (DECODE(NVL(DPRETOASME,0)+NVL(DPRETOMOME,0),0,200,'+
                                               ' TRUNC(((NVL(DPREEJME'+xmes+',0)-'+xmonto+')/(NVL(DPREASME'+xmes+',0) + NVL(DPREMOME'+xmes+',0)))*100,2))),';
             ssql := ssql + 'DPRETOEJMN=TRUNC(NVL(DPREEJMN01,0)+NVL(DPREEJMN02,0)+NVL(DPREEJMN03,0)+NVL(DPREEJMN04,0)+NVL(DPREEJMN05,0)+NVL(DPREEJMN06,0)+'+
                                           'NVL(DPREEJMN07,0)+NVL(DPREEJMN08,0)+NVL(DPREEJMN09,0)+NVL(DPREEJMN10,0)+NVL(DPREEJMN11,0)+NVL(DPREEJMN12,0)-'+
                                           xmonto+',2),';
             ssql := ssql + 'DPRETOVMMN=TRUNC(NVL(DPREVMMN01,0)+NVL(DPREVMMN02,0)+NVL(DPREVMMN03,0)+NVL(DPREVMMN04,0)+NVL(DPREVMMN05,0)+NVL(DPREVMMN06,0)+'+
                                           'NVL(DPREVMMN07,0)+NVL(DPREVMMN08,0)+NVL(DPREVMMN09,0)+NVL(DPREVMMN10,0)+NVL(DPREVMMN11,0)+NVL(DPREVMMN12,0)+'+
                                           '(NVL(DPREASMN'+xmes+',0) + NVL(DPREMOMN'+xmes+',0))-(NVL(DPREEJMN'+xmes+',0)-'+xmonto+'),2),';

             ssql := ssql + 'DPRETOVPMN=(DECODE(NVL(DPRETOASMN,0)+NVL(DPRETOMOMN,0),0,200,'+
                                         ' TRUNC(((NVL(DPREEJMN01,0)+NVL(DPREEJMN02,0)+NVL(DPREEJMN03,0)+NVL(DPREEJMN04,0)+NVL(DPREEJMN05,0)+NVL(DPREEJMN06,0)+'+
                                         ' NVL(DPREEJMN07,0)+NVL(DPREEJMN08,0)+NVL(DPREEJMN09,0)+NVL(DPREEJMN10,0)+NVL(DPREEJMN11,0)+NVL(DPREEJMN12,0)-'+
                                          xmonto+')/((NVL(DPRETOASMN,0) )+(NVL(DPRETOMOMN,0))))*100,2))),';
             ssql := ssql +'DPRETOEJME=TRUNC(NVL(DPREEJME01,0)+NVL(DPREEJME02,0)+NVL(DPREEJME03,0)+NVL(DPREEJME04,0)+NVL(DPREEJME05,0)+NVL(DPREEJME06,0)+'+
                                          'NVL(DPREEJME07,0)+NVL(DPREEJME08,0)+NVL(DPREEJME09,0)+NVL(DPREEJME10,0)+NVL(DPREEJME11,0)+NVL(DPREEJME12,0)-'+
                                           FloatToStr(xcambio)+',2),';
             ssql := ssql + 'DPRETOVMME=TRUNC(NVL(DPREVMME01,0)+NVL(DPREVMME02,0)+NVL(DPREVMME03,0)+NVL(DPREVMME04,0)+NVL(DPREVMME05,0)+NVL(DPREVMME06,0)+'+
                                           'NVL(DPREVMME07,0)+NVL(DPREVMME08,0)+NVL(DPREVMME09,0)+NVL(DPREVMME10,0)+NVL(DPREVMME11,0)+NVL(DPREVMME12,0)+'+
                                           '(NVL(DPREASME'+xmes+',0) + NVL(DPREMOME'+xmes+',0))-(NVL(DPREEJME'+xmes+',0)-'+FloatToStr(xcambio)+'),2),';
             ssql := ssql + 'DPRETOVPME=(DECODE(NVL(DPRETOASME,0)+NVL(DPRETOMOME,0),0,200,'+
                                         ' TRUNC(((NVL(DPREEJME01,0)+NVL(DPREEJME02,0)+NVL(DPREEJME03,0)+NVL(DPREEJME04,0)+NVL(DPREEJME05,0)+NVL(DPREEJME06,0)+'+
                                         ' NVL(DPREEJME07,0)+NVL(DPREEJME08,0)+NVL(DPREEJME09,0)+NVL(DPREEJME10,0)+NVL(DPREEJME11,0)+NVL(DPREEJME12,0)-'+
                                          FloatToStr(xcambio)+')/((NVL(DPRETOASME,0) )+(NVL(DPRETOMOME,0))))*100,2))),';
            end
           else
            begin
             ssql := ssql + 'DPREVMMN'+xmes+'= TRUNC((NVL(DPREASMN'+xmes+',0) + NVL(DPREMOMN'+xmes+',0))-(NVL(DPREEJMN'+xmes+',0)-'+FloatToStr(xcambio)+'),2), ';
             ssql := ssql + 'DPREVMME'+xmes+'= TRUNC((NVL(DPREASME'+xmes+',0) + NVL(DPREMOME'+xmes+',0))-(NVL(DPREEJME'+xmes+',0)-'+xmonto+'),2), ';
             ssql := ssql + 'DPREVPMN'+xmes+'= (DECODE(NVL(DPREASMN'+xmes+',0) + NVL(DPREMOMN'+xmes+',0),0,200,'+
                                               ' TRUNC(((NVL(DPREEJMN'+xmes+',0)-'+FloatToSTr(xcambio)+')/(NVL(DPREASMN'+xmes+',0) + NVL(DPREMOMN'+xmes+',0)))*100,2))), ';
             ssql := ssql + 'DPREVPME'+xmes+'= (DECODE(NVL(DPREASME'+xmes+',0) + NVL(DPREMOME'+xmes+',0),0,200,'+
                                               ' TRUNC(((NVL(DPREEJME'+xmes+',0)-'+xmonto+')/(NVL(DPREASME'+xmes+',0) + NVL(DPREMOME'+xmes+',0)))*100,2))),';
             ssql := ssql + 'DPRETOEJME=DEC(NVL(DPREEJME01,0)+NVL(DPREEJME02,0)+NVL(DPREEJME03,0)+NVL(DPREEJME04,0)+NVL(DPREEJME05,0)+NVL(DPREEJME06,0)+'+
                                           'NVL(DPREEJME07,0)+NVL(DPREEJME08,0)+NVL(DPREEJME09,0)+NVL(DPREEJME10,0)+NVL(DPREEJME11,0)+NVL(DPREEJME12,0)-'+
                                           xmonto+',2),';
             ssql := ssql + 'DPRETOVMME=TRUNC(NVL(DPREVMME01,0)+NVL(DPREVMME02,0)+NVL(DPREVMME03,0)+NVL(DPREVMME04,0)+NVL(DPREVMME05,0)+NVL(DPREVMME06,0)+'+
                                           'NVL(DPREVMME07,0)+NVL(DPREVMME08,0)+NVL(DPREVMME09,0)+NVL(DPREVMME10,0)+NVL(DPREVMME11,0)+NVL(DPREVMME12,0)+'+
                                           '(NVL(DPREASME'+xmes+',0) + NVL(DPREMOME'+xmes+',0))-(NVL(DPREEJME'+xmes+',0)-'+xmonto+'),2),';
             ssql := ssql + 'DPRETOVPME=(DECODE(NVL(DPRETOASME,0)+(NVL(DPRETOMOME,0),0,200, '+
                                        ' TRUNC(((NVL(DPREEJME01,0)+NVL(DPREEJME02,0)+NVL(DPREEJME03,0)+NVL(DPREEJME04,0)+NVL(DPREEJME05,0)+NVL(DPREEJME06,0)+'+
                                               'NVL(DPREEJME07,0)+NVL(DPREEJME08,0)+NVL(DPREEJME09,0)+NVL(DPREEJME10,0)+NVL(DPREEJME11,0)+NVL(DPREEJME12,0)-'+
                                                xmonto+')/((NVL(DPRETOASME,0))+(NVL(DPRETOMOME,0))))*100,2))),';
             ssql := ssql +'DPRETOEJMN=TRUNC(NVL(DPREEJMN01,0)+NVL(DPREEJMN02,0)+NVL(DPREEJMN03,0)+NVL(DPREEJMN04,0)+NVL(DPREEJMN05,0)+NVL(DPREEJMN06,0)+'+
                                          'NVL(DPREEJMN07,0)+NVL(DPREEJMN08,0)+NVL(DPREEJMN09,0)+NVL(DPREEJMN10,0)+NVL(DPREEJMN11,0)+NVL(DPREEJMN12,0)-'+
                                           FloatToStr(xcambio)+',2),';
             ssql := ssql + 'DPRETOVMMN=TRUNC(NVL(DPREVMMN01,0)+NVL(DPREVMMN02,0)+NVL(DPREVMMN03,0)+NVL(DPREVMMN04,0)+NVL(DPREVMMN05,0)+NVL(DPREVMMN06,0)+'+
                                           'NVL(DPREVMMN07,0)+NVL(DPREVMMN08,0)+NVL(DPREVMMN09,0)+NVL(DPREVMMN10,0)+NVL(DPREVMMN11,0)+NVL(DPREVMMN12,0)+'+
                                           '(NVL(DPREASMN'+xmes+',0) + NVL(DPREMOMN'+xmes+',0))-(NVL(DPREEJMN'+xmes+',0)-'+FloatToStr(xcambio)+'),2),';

             ssql := ssql + 'DPRETOVPMN=(DECODE(NVL(DPRETOASMN,0)+NVL(DPRETOMOMN,0),0,,200, '+
                                   ' TRUNC(((NVL(DPREEJMN01,0)+NVL(DPREEJMN02,0)+NVL(DPREEJMN03,0)+NVL(DPREEJMN04,0)+NVL(DPREEJMN05,0)+NVL(DPREEJMN06,0)+'+
                                   ' NVL(DPREEJMN07,0)+NVL(DPREEJMN08,0)+NVL(DPREEJMN09,0)+NVL(DPREEJMN10,0)+NVL(DPREEJMN11,0)+NVL(DPREEJMN12,0)+'+
                                    FloatToStr(xcambio)+')/(NVL(DPRETOASMN,0)+NVL(DPRETOMOMN,0)))*100,2))),';
            end;
           ssql := ssql + 'RQPARTUSER='+ quotedstr(DMCXP.wUsuario);
           xFecha := formatdatetime(DMCXP.wFormatFecha,Date);
           ssql := ssql + ',RQPARTFREG =Date('+quotedstr(xfecha)+')';
           xhora := formatdatetime('hh:nn:ss',time);
           ssql := ssql + ',RQPARTHREG =time('+quotedstr(xhora)+')'+
                          ' WHERE CIAID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)+
                          ' AND CCOSID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+
                          ' AND TIPPRESID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('TIPPRESID').AsString)+
                          ' AND PARPRESID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('PARPRESID').AsString)+
                          ' AND RQPARTANO='+quotedstr(xtano);
           DMCXP.DCOM1.AppServer.EjecutaSQL(sSQL);

           // se inicia la actualización de la cabecera
           { inicializo en cero el arreglo }
           For iX := 1 to 48 do xTotal[iX]  :=0;
           For iX := 1 to 6  do xTotg[iX]   :=0;
           For iX := 1 to 24 do xasxmes[iX] :=0;
           For iX := 1 to 24 do xmoxmes[iX] :=0;
           For iX := 1 to 24 do xvpxmes[iX] :=0;
           { para cargar los AS y MO de cada mes }
           ssql := '';
           ssql := 'SELECT * FROM PPRES300'+
                   ' WHERE CIAID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)+
                   ' AND CCOSID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+
                   ' AND RQPARTANO='+quotedstr(xtano);
           DMCXP.cdsQry2.Close;
           DMCXP.cdsQry2.ProviderName:= 'dspCxP';
           DMCXP.cdsQry2.DataRequest(ssql);
           DMCXP.cdsQry2.open;
           DMCXP.cdsQry2.First;
           while not DMCXP.cdsQry2.Eof do
            begin
             For iX := 1 to 12 do
              begin
                xmes := StrZero(IntToStr(iX),2);
                xasxmes[iX]    := StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREASMN'+xmes).AsString);
                xasxmes[iX+12] := StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREASME'+xmes).AsString);
                xmoxmes[iX]    := StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREMOMN'+xmes).AsString);
                xmoxmes[iX+12] := StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREMOME'+xmes).AsString);
              end;
             DMCXP.cdsQry2.Next;
            end;

           { actualiza la cabecera de Presupuesto PPRES300, toma del PPRES301
             los EJ,VM y VP por mes para un mismo centro de costo y los sumariza
             para cargarlos a los campos respectivos del PPRES300 }
           ssql := '';
           ssql := 'SELECT * FROM PPRES301'+
                   ' WHERE CIAID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)+
                   ' AND CCOSID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+
                   ' AND RQPARTANO='+quotedstr(xtano);
           DMCXP.cdsQry2.Close;
           DMCXP.cdsQry2.ProviderName:= 'dspCxP';
           DMCXP.cdsQry2.DataRequest(ssql);
           DMCXP.cdsQry2.open;
           DMCXP.cdsQry2.First;
           { recorro la tabla PPRES301 para hallar los totales por mes y
             por campos( EJ, VM, VP ) y por mes }
           while not DMCXP.cdsQry2.Eof do
            begin
             //** 03/11/2000 - pjsv
             ssql := '';
             ssql := 'PARPRESID='+quotedstr(DMCXP.cdsQry2.fieldbyname('PARPRESID').AsString);
             xIS := BuscaQRY('dspPlaParPre','PPRES201','*',ssql,'PARPRES_IS');
             //**
             For iX := 1 to 24 do
              case iX of
                { para DPREEJMN01..12 }
               1,2,3,4,5,6,7,8,9,10,11,12 :
                  begin
                    xmes := StrZero(IntToStr(iX),2);
                    //** 03/11/2000 - pjsv, tiene que chequear si el PARPRES_IS
                    // del PPRES201 es I = resta,  o S = suma
                    if xIS = 'S' then
                     xTotal[iX] := xTotal[iX] + StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREEJMN'+xmes).AsString)
                    else
                     xTotal[iX] := xTotal[iX] - StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREEJMN'+xmes).AsString)
                  end;
               { para DPREEJME01..12 }
               13,14,15,16,17,18,19,20,21,22,23,24 :
                  begin
                    xmes := StrZero(IntToStr(iX-12),2);
                    //** 03/11/2000 - pjsv, tiene que chequear si el PARPRES_IS
                    // del PPRES201 es I = resta,  o S = suma
                    if xIS = 'S' then
                     xTotal[iX] := xTotal[iX] + StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREEJME'+xmes).AsString)
                    else
                     xTotal[iX] := xTotal[iX] - StrToFloat(DMCXP.cdsQry2.fieldbyname('DPREEJME'+xmes).AsString)
                  end;
              end;
             DMCXP.cdsQry2.next;
            end;
           // para controlar el error del INFINITO
           xestado := false;
           for ix := 1 to 12 do
            if (xasxmes[ix] <> 0) or (xmoxmes[ix] <> 0) then
             begin
              xestado := true; Break;
             end;
           { hallo el total por mes de VP }
           for ix := 1 to 12 do
            begin
             // se agrega 17/10/2000 pjsv - para que solo calcule el mes
             // del periodo, si se quita el if calcula todos los meses
             if StrZero(IntToStr(iX),2) = xtmes then
              begin
                { para DPREVMMN01..12 }
                xTotal[iX+24] := (xasxmes[iX]+xmoxmes[iX]) - xTotal[iX];
                { para DPREVMME01..12 }
                xTotal[iX+36] := (xasxmes[iX+12]+xmoxmes[iX+12])  - xTotal[iX+12];
                // se agrego el 23/10/200 pjsv
                if xestado = False then
                  begin
                   // los igualo a cero
                   xvpxmes[iX] := 0;
                   { para VPME }
                   xvpxmes[iX+12] := 0;
                  end
                else
                 begin
                  { para VPMN }
                  xvpxmes[iX]    := (xtotal[ix]/(xasxmes[iX]+xmoxmes[iX]))*100;
                  { para VPME }
                  xvpxmes[iX+12] := (xtotal[ix+12]/(xasxmes[iX+12]+xmoxmes[iX+12]))*100;
                 end;
              end;
            end;
           ssql := '';
           ssql := 'Update PPRES300 Set ';
           For iX := 1 to 12 do
            begin
             xmes := StrZero(IntToStr(iX),2);
             { carga para cada mes y campo el valor hallado en las lineas de
               arriba }
             ssql := ssql + ' DPREEJMN'+xmes+'=TRUNC('+FloatToStr(xtotal[iX]) +',2),';
             ssql := ssql + ' DPREEJME'+xmes+'=TRUNC('+FloatToStr(xtotal[iX+12]) +',2),';
             ssql := ssql + ' DPREVMMN'+xmes+'=TRUNC('+FloatToStr(xtotal[iX+24]) +',2),';
             ssql := ssql + ' DPREVMME'+xmes+'=TRUNC('+FloatToStr(xtotal[iX+36]) +',2),';
             ssql := ssql + ' DPREVPMN'+xmes+'=TRUNC('+FloatToStr(xvpxmes[iX]) +',2),';
             ssql := ssql + ' DPREVPME'+xmes+'=TRUNC('+FloatToStr(xvpxmes[iX+12]) +',2),';
            end;
           { SUMATORIA DE LOS EJMN, LOS DOCE MESES }
           For iX := 1 to 12 do
             xtotG[1] := xtotG[1] + xtotal[iX];
           { SUMATORIA DE LOS EJME, LOS DOCE MESES }
           For iX := 13 to 24 do
             xtotG[2] := xtotG[2] + xtotal[iX];
           { SUMATORIA DE LOS MOMN, LOS DOCE MESES }
           For iX := 25 to 36 do
             xtotG[3] := xtotG[3] + xtotal[iX];
           { SUMATORIA DE LOS MOME, LOS DOCE MESES }
           For iX := 37 to 48 do
             xtotG[4] := xtotG[4] + xtotal[iX];
           if xestado = False then
            begin
             // los igualo a cero
             xtotG[5] := 0; xtotG[6] := 0;
            end
           else
            begin
             {  calculo del total VPMN }
             xtotG[5] := (xtotG[1]/((xasxmes[1]+xasxmes[2]+xasxmes[3]+xasxmes[4]+xasxmes[5]+xasxmes[6]+
                                   xasxmes[7]+xasxmes[8]+xasxmes[9]+xasxmes[10]+xasxmes[11]+xasxmes[12])+
                                   (xmoxmes[1]+xmoxmes[2]+xmoxmes[3]+xmoxmes[4]+xmoxmes[5]+xmoxmes[6]+
                                   xmoxmes[7]+xmoxmes[8]+xmoxmes[9]+xmoxmes[10]+xmoxmes[11]+xmoxmes[12])))*100;
             { calculo del total VPME }
             xtotG[6] := (xtotG[2]/((xasxmes[13]+xasxmes[14]+xasxmes[15]+xasxmes[16]+xasxmes[17]+xasxmes[18]+
                                   xasxmes[19]+xasxmes[20]+xasxmes[21]+xasxmes[22]+xasxmes[23]+xasxmes[24])+
                                   (xmoxmes[13]+xmoxmes[14]+xmoxmes[15]+xmoxmes[16]+xmoxmes[17]+xmoxmes[18]+
                                   xmoxmes[19]+xmoxmes[20]+xmoxmes[21]+xmoxmes[22]+xmoxmes[23]+xmoxmes[24])))*100;
            end;
           { asigno los totales para EJ,VM y VP en MN y ME }
           ssql := ssql + ' DPRETOEJMN=TRUNC('+FloatToStr(xtotg[1]) +',2),';
           ssql := ssql + ' DPRETOEJME=TRUNC('+FloatToStr(xtotg[2]) +',2),';
           ssql := ssql + ' DPRETOVMMN=TRUNC('+FloatToStr(xtotg[3]) +',2),';
           ssql := ssql + ' DPRETOVMME=TRUNC('+FloatToStr(xtotg[4]) +',2),';
           ssql := ssql + ' DPRETOVPMN=TRUNC('+FloatToStr(xtotg[5]) +',2),';
           ssql := ssql + ' DPRETOVPME=TRUNC('+FloatToStr(xtotg[6]) +',2),';
           { otros campos a actualizar }
           ssql := ssql + 'RQPARTUSER='+ quotedstr(DMCXP.wUsuario);
           xFecha := formatdatetime(DMCXP.wFormatFecha,Date);
           ssql := ssql + ',RQPARTFREG =Date('+quotedstr(xfecha)+')';
           xhora := formatdatetime('hh:nn:ss',time);
           ssql := ssql + ',RQPARTHREG =time('+quotedstr(xhora)+')'+
           { condicional }
                          ' WHERE CIAID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)+
                          ' AND CCOSID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+
                          ' AND RQPARTANO='+quotedstr(xtano);
           DMCXP.DCOM1.AppServer.EjecutaSQL(sSQL);
        end;
       DMCXP.cdsDetCxP.Next;
     end;
  end;
   { ahora para los niveles speriores }  
   CalculoNivelSupe;
end;

{ pjsv - para presupuestos }
procedure TFNotasDC.CreaSuperior;
var
  xppcomun,ssql,xcc : string;
  xmaxdigitosup,xmaxnivelsup,xmaxnivelinf : string;
  xpp,xmaxdigitoint,xmaxnivelint,xmaxdigitoinf : string;
  xcontador : Integer;
  xcia,xccosid,xtippresid,xano : string;
begin
   { tabla de niveles}
   ssql :='';
   ssql := 'SELECT * FROM PPRES103 ORDER BY PARPRESNIV';
   DMCXP.cdsNivelPresu.close;
   DMCXP.cdsNivelPresu.DataRequest(ssql);
   DMCXP.cdsNivelPresu.Open;
   { se recorre el client del detalle, por lo que en este se encuentran
     las P.P. a actualizar}
   DMCXP.cdsDetCxP.First;
   while not DMCXP.cdsDetCxP.eof do
    begin
     if (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString='MG') or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString='NG')
         or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString='MN') then
      begin
        if xcc <> DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString then
         begin
          { tabla de detalle del presupuesto }
          ssql := '';
          ssql := 'SELECT * FROM PPRES301'+
                 ' WHERE CIAID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)+
                 ' AND CCOSID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+
                 ' AND RQPARTANO='+quotedstr(xtano);
          DMCXP.cdsDetallePres.Close;
          DMCXP.cdsDetallePres.DataRequest(ssql);
          DMCXP.cdsDetallePres.open;
          xcc := DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString;
         end;
          ssql := '';
          ssql := 'SELECT * FROM PPRES201';
          DMCXP.cdsPlaParPre.Close;
          DMCXP.cdsPlaParPre.DataRequest(ssql);
          DMCXP.cdsPlaParPre.open;
          { se toma 01 por defecto para el nivel máximo superior }
          xmaxnivelsup:='01';
          DMCXP.cdsNivelPresu.First;
          { se jala el máximo digito superior }
          xmaxdigitosup := DMCXP.cdsNivelPresu.fieldbyname('DIGITOS').AsString;
          { se carga a partir de la P.P. digitada el digito en común
            ejmp. si se digito 10101 --> el digito comuún es 1
                  si se digito 20501 --> el digito común es 2  }
          xppcomun := copy(DMCXP.cdsDetCxP.fieldbyname('PARPRESID').AsString,1,StrToInt(xmaxdigitosup));
          DMCXP.cdsNivelPresu.Last;
          { jalo el máximo nivel inferior de la tabla de niveles }
          xmaxnivelinf := DMCXP.cdsNivelPresu.fieldbyname('PARPRESNIV').AsString;
          { se jala el máximo digito inferior }
          xmaxdigitoinf := DMCXP.cdsNivelPresu.fieldbyname('DIGITOS').AsString;
          { este proceso se repite hasta que la variable xmaxnivelint se iguale
            a la xmaxnivelsup. Esto me permite generar los niveles superiores
            que cuyo primer digito sea igual a la variable xppcomun }
          xcontador := 0;
          repeat
           { ejemp. si el xmaxnivelinf = 03 ==>  xmaxnivelint = 02. }
           xmaxnivelint := StrZero(IntToStr(StrToInt(xmaxnivelinf)-xcontador),2);
           xcontador := 1;
           ssql := '';
           ssql := 'PARPRESNIV='+quotedstr(xmaxnivelint);
           xcia := Trim(dblcCia.Text);
           xccosid := Trim(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString);
           xtippresid := Trim(DMCXP.cdsDetCxP.fieldbyname('TIPPRESID').AsString);
           xano := Trim(xtano);
           xmaxdigitoint := buscaQRY('dspNivelPresu','PPRES103','*',ssql,'DIGITOS');
           xpp := Trim(copy(DMCXP.cdsDetCxP.fieldbyname('PARPRESID').AsString,1,StrToInt(xmaxdigitoint)));
           if DMCXP.cdsPlaParPre.Locate ('PARPRESID',VarArrayOf([xpp]) ,[loCaseInsensitive]) then
            if not DMCXP.cdsDetallePres.Locate ('CIAID;CCOSID;TIPPRESID;PARPRESID;RQPARTANO',VarArrayOf([xcia,xccosid,xtippresid,xpp,xano]) ,[loCaseInsensitive]) then
              DMCXP.cdsDetallePres.insert;
           if DMCXP.cdsDetallePres.State = dsInsert then
            begin
               DMCXP.cdsDetallePres.fieldbyname('CIAID').AsString := dblcCia.Text;
               DMCXP.cdsDetallePres.fieldbyname('CCOSID').AsString := DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString;
               DMCXP.cdsDetallePres.fieldbyname('TIPPRESID').AsString := DMCXP.cdsDetCxP.fieldbyname('TIPPRESID').AsString;
               DMCXP.cdsDetallePres.fieldbyname('RQPARTANO').AsString :=  xtano;
               DMCXP.cdsDetallePres.FieldByName('PARPRESID').AsString  := DMCXP.cdsPlaParPre.fieldbyname('PARPRESID').AsString;
               DMCXP.cdsDetallePres.FieldByName('PARPREDES').AsString  := DMCXP.cdsPlaParPre.fieldbyname('PARPRESDES').AsString;
               DMCXP.cdsDetallePres.FieldByName('TMONID').AsString     := dblcTMon.Text;
               DMCXP.cdsDetallePres.FieldByName('RQPARTUSER').AsString := DMCXP.wusuario;
               DMCXP.cdsDetallePres.FieldByName('RQPARTFREG').AsString := DateToStr(Date());
               DMCXP.cdsDetallePres.FieldByName('RQPARTHREG').AsString := TimeToStr(Time());
               DMCXP.cdsDetallePres.FieldByName('RQPARTIS').AsString   := DMCXP.cdsPlaParPre.fieldbyname('PARPRES_IS').AsString;
               DMCXP.cdsDetallePres.FieldByName('PARPRESNIV').AsString   := DMCXP.cdsPlaParPre.fieldbyname('PARPRESNIV').AsString;
               // inicializo en cero todos los montos
               inicializoCero(DMCXP.cdsDetallePres);
               DMCXP.cdsDetallePres.Post;
               DMCXP.cdsDetallePres.ApplyUpdates(0);
            end;
            xmaxnivelinf := xmaxnivelint;
          until xmaxnivelsup = xmaxnivelint;
      end;
     DMCXP.cdsDetCxP.Next;
    end;
end;


{ pjsv - para presupuestos }
procedure TFNotasDC.inicializoCero;
var
 iX : integer;
 xmes : string;
begin
    { inicializo los demás campos en cero }
    for iX := 1 to 12 do
     begin
      xmes := StrZero(IntToStr(iX),2);
      xcds.FieldByName('DPRERQMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPRERQME'+xmes).AsString   := '0';
      xcds.FieldByName('DPRERMME'+xmes).AsString   := '0';
      xcds.FieldByName('DPRERMMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPREASMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPREASME'+xmes).AsString   := '0';
      xcds.FieldByName('DPREMOMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPREMOME'+xmes).AsString   := '0';
      xcds.FieldByName('DPREEJMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPREEJME'+xmes).AsString   := '0';
      xcds.FieldByName('DPREVMMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPREVMME'+xmes).AsString   := '0';
      xcds.FieldByName('DPREVPMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPREVPME'+xmes).AsString   := '0';
     end;
    xcds.FieldByName('DPRETORQMN').AsString   := '0';
    xcds.FieldByName('DPRETORQME').AsString   := '0';
    xcds.FieldByName('DPRETORMMN').AsString   := '0';
    xcds.FieldByName('DPRETORMME').AsString   := '0';
    xcds.FieldByName('DPRETOASMN').AsString   := '0';
    xcds.FieldByName('DPRETOASME').AsString   := '0';
    xcds.FieldByName('DPRETOMOMN').AsString   := '0';
    xcds.FieldByName('DPRETOMOME').AsString   := '0';
    xcds.FieldByName('DPRETOEJMN').AsString   := '0';
    xcds.FieldByName('DPRETOEJME').AsString   := '0';
    xcds.FieldByName('DPRETOVMMN').AsString   := '0';
    xcds.FieldByName('DPRETOVMME').AsString   := '0';
    xcds.FieldByName('DPRETOVPMN').AsString   := '0';
    xcds.FieldByName('DPRETOVPME').AsString   := '0';
end;


{ pjsv - para presupuestos }
procedure TFNotasDC.CalculoNivelSupe;
var
  xppcomun,xmaxdigitosup,xmaxnivelsup,xmaxnivelinf,ssql : string;
  xcc,xmes,xmaxdigitoint,xmaxnivelint,xmaxdigitoinf : string;
  ix : integer;
  xestado,xestado1 : bool;
  { para los EJMN y EJME del mes 01 al mes 12 }
  xmontos : array[1..24] of double;
  { para los ASMN y ASME del mes 01 al mes 12 }
  xmontosas : array[1..24] of double;
  { para los MOMN y MOME del mes 01 al mes 12 }
  xmontosmo : array[1..24] of double;
  xtotvmmn,xtotvmme, xtotejmn,xtotejme : double;
begin
   xestado := False; xestado1 := False;
   { tabla de niveles, se ordena por el nivel }
   ssql :='';
   ssql := 'SELECT * FROM PPRES103 ORDER BY PARPRESNIV';
   DMCXP.cdsNivelPresu.close;
   DMCXP.cdsNivelPresu.DataRequest(ssql);
   DMCXP.cdsNivelPresu.open;
   DMCXP.cdsNivelPresu.First;
   { se inicializa en cero }
//   xtotvmmn := 0; xtotvmme := 0;
   { se recorre el client del detalle, por lo que en este se encuentran
     las P.P. a actualizar}
   DMCXP.cdsDetCxP.First;
   while not DMCXP.cdsDetCxP.eof do
    begin
     if (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString='MG') or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString='NG')
         or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString='MN') then
      begin
        { solo si se cambia de centro de costo }
        if xcc <> DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString then
         begin
          { tabla de detalle del presupuesto }
          ssql := '';
          ssql := 'SELECT * FROM PPRES301'+
                 ' WHERE CIAID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CIAID').AsString)+
                 ' AND CCOSID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+
                 ' AND RQPARTANO='+quotedstr(xtano);
          DMCXP.cdsDetallePres.Close;
          DMCXP.cdsDetallePres.DataRequest(ssql);
          DMCXP.cdsDetallePres.open;
          { se carga la variable }
          xcc := DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString;
         end;
       if xppcomun <> copy(DMCXP.cdsDetCxP.fieldbyname('PARPRESID').AsString,1,1) then
         begin
          //////////// poceso para genera los niveles superiores ////////////
          ssql := '';
          ssql := 'SELECT * FROM PPRES201';
          DMCXP.cdsPlaParPre.Close;
          DMCXP.cdsPlaParPre.DataRequest(ssql);
          DMCXP.cdsPlaParPre.open;
          { se toma 01 por defecto para el nivel máximo superior }
          xmaxnivelsup:='01';
          DMCXP.cdsNivelPresu.First;
          { se jala el máximo digito superior }
          xmaxdigitosup := DMCXP.cdsNivelPresu.fieldbyname('DIGITOS').AsString;
          { se carga a partir de la P.P. digitada el digito en común
            ejmp. si se digito 10101 --> el digito comuún es 1
                  si se digito 20501 --> el digito común es 2  }
          xppcomun := copy(DMCXP.cdsDetCxP.fieldbyname('PARPRESID').AsString,1,StrToInt(xmaxdigitosup));
          DMCXP.cdsNivelPresu.Last;
          { jalo el máximo nivel inferior de la tabla de niveles }
          xmaxnivelinf := DMCXP.cdsNivelPresu.fieldbyname('PARPRESNIV').AsString;
          { se jala el máximo digito inferior }
          xmaxdigitoinf := DMCXP.cdsNivelPresu.fieldbyname('DIGITOS').AsString;

          { se filtra la tabla por CIA, TIPPRESID RQPARTANO y PARPRESID cuyo digito
            sustraido se igual al xppcomun }
          ssql := '';
          ssql := 'SELECT PARPRESID,PARPREDES,RQPARTIS,TMONID,'+
                         'DPREEJMN01,DPREEJMN02,DPREEJMN03,DPREEJMN04,DPREEJMN05,DPREEJMN06,'+
                         'DPREEJMN07,DPREEJMN08,DPREEJMN09,DPREEJMN10,DPREEJMN11,DPREEJMN12,'+
                         'DPREEJME01,DPREEJME02,DPREEJME03,DPREEJME04,DPREEJME05,DPREEJME06,'+
                         'DPREEJME07,DPREEJME08,DPREEJME09,DPREEJME10,DPREEJME11,DPREEJME12,'+

                         'DPREVMMN01,DPREVMMN02,DPREVMMN03,DPREVMMN04,DPREVMMN05,DPREVMMN06,'+
                         'DPREVMMN07,DPREVMMN08,DPREVMMN09,DPREVMMN10,DPREVMMN11,DPREVMMN12,'+
                         'DPREVMME01,DPREVMME02,DPREVMME03,DPREVMME04,DPREVMME05,DPREVMME06,'+
                         'DPREVMME07,DPREVMME08,DPREVMME09,DPREVMME10,DPREVMME11,DPREVMME12,'+

                         'DPREVPMN01,DPREVPMN02,DPREVPMN03,DPREVPMN04,DPREVPMN05,DPREVPMN06,'+
                         'DPREVPMN07,DPREVPMN08,DPREVPMN09,DPREVPMN10,DPREVPMN11,DPREVPMN12,'+
                         'DPREVPME01,DPREVPME02,DPREVPME03,DPREVPME04,DPREVPME05,DPREVPME06,'+
                         'DPREVPME07,DPREVPME08,DPREVPME09,DPREVPME10,DPREVPME11,DPREVPME12,'+

                         'DPREASMN01,DPREASMN02,DPREASMN03,DPREASMN04,DPREASMN05,DPREASMN06,'+
                         'DPREASMN07,DPREASMN08,DPREASMN09,DPREASMN10,DPREASMN11,DPREASMN12,'+
                         'DPREASME01,DPREASME02,DPREASME03,DPREASME04,DPREASME05,DPREASME06,'+
                         'DPREASME07,DPREASME08,DPREASME09,DPREASME10,DPREASME11,DPREASME12,'+

                         'DPREMOMN01,DPREMOMN02,DPREMOMN03,DPREMOMN04,DPREMOMN05,DPREMOMN06,'+
                         'DPREMOMN07,DPREMOMN08,DPREMOMN09,DPREMOMN10,DPREMOMN11,DPREMOMN12,'+
                         'DPREMOME01,DPREMOME02,DPREMOME03,DPREMOME04,DPREMOME05,DPREMOME06,'+
                         'DPREMOME07,DPREMOME08,DPREMOME09,DPREMOME10,DPREMOME11,DPREMOME12'+


                  ' FROM PPRES301 WHERE CIAID='+quotedstr(dblcCia.Text)+
                  ' AND CCOSID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('CCOSID').AsString)+
                  ' AND TIPPRESID='+quotedstr(DMCXP.cdsDetCxP.fieldbyname('TIPPRESID').AsString)+
                  ' AND SUBSTR(PARPRESID,1,'+xmaxdigitosup+')='+quotedstr(xppcomun)+
                  ' AND RQPARTANO='+quotedstr(xtano);
          DMCXP.cdsSQL.Close;
          DMCXP.cdsSQL.DataRequest(ssql);
          DMCXP.cdsSQL.Open;
          DMCXP.cdsSQL.first;
          { este proceso se repite hasta que la variable xmaxnivelint se iguale
            a la xmaxnivelsup. Esto me permite generar los niveles superiores
            que cuyo primer digito sea igual a la variable xppcomun }
          repeat
            { ejemp. si el xmaxnivelinf = 03 ==>  xmaxnivelint = 02. }
            xmaxnivelint := StrZero(IntToStr(StrToInt(xmaxnivelinf)-1),2);
            ssql := '';
            ssql := 'PARPRESNIV='+quotedstr(xmaxnivelint);
            xmaxdigitoint := buscaQRY('dspNivelPresu','PPRES103','*',ssql,'DIGITOS');
            { filtra la tabla de P.P.P. por todas aquellas cuyo digito sean igual al del
              xmaxdigitoint }
            ssql := '';
            ssql := 'SELECT * FROM PPRES201 WHERE LENGTH(PARPRESID)='+xmaxdigitoint+
                    ' ORDER BY PARPRESID';
            DMCXP.cdsPlaParPre.Close;
            DMCXP.cdsPlaParPre.DataRequest(ssql);
            DMCXP.cdsPlaParPre.Open;
            { se recorre la tabla }
            while not DMCXP.cdsPlaParPre.Eof do
             begin
               DMCXP.cdsSQL.First;
               { se blanquea }
               for iX := 1 to 24 do
                begin
                  xmontos[iX] := 0;
                  xmontosas[iX] :=0;
                  xmontosmo[iX] :=0;
                end;
                { se recorre el clon del detalle }
                while not DMCXP.cdsSQL.Eof do
                 begin
                  { si el # de digitos es = al # maximo de digitos inferior }
                  if length(DMCXP.cdsSQL.fieldbyname('PARPRESID').AsString) = StrToInt(xmaxdigitoinf) then
                   { si la sustracción es = al nivel de la P.P..}
                   if copy(DMCXP.cdsSQL.fieldbyname('PARPRESID').AsString,1,StrToInt(xmaxdigitoint)) =
                    DMCXP.cdsPlaParPre.fieldbyname('PARPRESID').AsString then
                    For iX := 1 to 12 do
                     begin
                      // se halla los montos para las 2 monesa y los 12 meses
                     {se agrego esta linea 17/10/2000 para que sólo actualice el mes del periodo
                      y ya no los 12 meses }
//06/11/2000
//                     if DMCXP.StrZero(IntToStr(iX),2) = xtmes then
//                       begin
                        xmes := StrZero(IntToStr(iX),2);
                        xmontos[iX]    := xmontos[iX]    + DMCXP.cdsSQL.fieldbyname('DPREEJMN'+xmes).value;
                        xmontos[iX+12] := xmontos[iX+12] + DMCXP.cdsSQL.fieldbyname('DPREEJME'+xmes).value;
                        xmontosas[iX]    := xmontosas[iX]    + DMCXP.cdsSQL.fieldbyname('DPREASMN'+xmes).value;
                        xmontosas[iX+12] := xmontosas[iX+12] + DMCXP.cdsSQL.fieldbyname('DPREASME'+xmes).value;
                        xmontosmo[iX]    := xmontosmo[iX]    + DMCXP.cdsSQL.fieldbyname('DPREMOMN'+xmes).value;
                        xmontosmo[iX+12] := xmontosmo[iX+12] + DMCXP.cdsSQL.fieldbyname('DPREMOME'+xmes).value;
//                       end;
                     end;
                   DMCXP.cdsSQL.next;
                 end;
                 { si hubiera montos }
                 for iX := 1 to 12 do
                  if xmontos[iX] <> 0 then
                    begin
                     xestado := true; break;
                    end;
                 { si es true, me indica que al menos hay una cantidad a actualizar }
                 if xestado = true then
                  begin
                   xtotejmn := 0;
                   xtotejme := 0;
                   { para posicionarme sobre el nivel en el clon }
                   if DMCXP.cdsSQL.Locate('PARPRESID',DMCXP.cdsPlaParPre.fieldbyname('PARPRESID').AsString,[loCaseInsensitive]) then
                      DMCXP.cdsSQL.Edit;
                   { para posicionarme sobre el nivel en el detalle }
                   if DMCXP.cdsDetallePres.Locate('PARPRESID',DMCXP.cdsPlaParPre.fieldbyname('PARPRESID').AsString,[loCaseInsensitive]) then
                      DMCXP.cdsDetallePres.Edit;
                   for iX := 1 to 12 do
                    begin
                      xmes := StrZero(IntToStr(iX),2);
                      { para el cdsSQL }
                      DMCXP.cdsSQL.fieldbyname('DPREEJMN'+xmes).AsString := FloatToStr(xmontos[iX]);
                      DMCXP.cdsSQL.fieldbyname('DPREEJME'+xmes).AsString := FloatToStr(xmontos[iX+12]);
                      { para el detalle }
                      DMCXP.cdsDetallePres.fieldbyname('DPREEJMN'+xmes).AsString := FloatToStr(xmontos[iX]);
                      DMCXP.cdsDetallePres.fieldbyname('DPREEJME'+xmes).AsString := FloatToStr(xmontos[iX+12]);
                      //** 06/11/2000
                      if xmontos[iX] > 0 then
                       begin
                        DMCXP.cdsDetallePres.fieldbyname('DPREVMMN'+xmes).AsString := FloatToStr((xmontosas[iX] +xmontosmo[iX]) - xmontos[iX]);
                        DMCXP.cdsDetallePres.fieldbyname('DPREVMME'+xmes).AsString := FloatToStr((xmontosas[iX+12] +xmontosmo[iX+12]) - xmontos[iX+12]);
                       end;
                      //**
                      if xmontos[iX] <> 0 then
                       if (xmontosas[iX] <> 0) or (xmontosmo[iX] <> 0) then
                         DMCXP.cdsDetallePres.fieldbyname('DPREVPMN'+xmes).AsString :=
                          FloatToStr((xmontos[iX] / (xmontosas[iX] + xmontosmo[iX]))*100)
                       else
                         DMCXP.cdsDetallePres.fieldbyname('DPREVPMN'+xmes).value := 200;
                      if xmontos[iX+12] <> 0 then
                       if (xmontosas[iX+12] <> 0) or (xmontosmo[iX+12] <> 0) then
                         DMCXP.cdsDetallePres.fieldbyname('DPREVPME'+xmes).AsString :=
                          FloatToStr((xmontos[iX+12] / (xmontosas[iX+12] + xmontosmo[iX+12]))*100)
                       else
                         DMCXP.cdsDetallePres.fieldbyname('DPREVPME'+xmes).value := 200;
                       { totales de EJ y VM }
//                      xtotejmn := xtotejmn + xmontos[iX];
//                      xtotejme := xtotejme + xmontos[iX+12];
//                      xtotvmmn := xtotvmmn + StrToFloat(DMCXP.cdsDetallePres.fieldbyname('DPREVMMN'+xmes).AsString);
//                      xtotvmme := xtotvmme + StrToFloat(DMCXP.cdsDetallePres.fieldbyname('DPREVMME'+xmes).AsString);
                    end;
                   xtotvmmn := (xmontosas[1]+xmontosas[2]+xmontosas[3]+xmontosas[4]+xmontosas[5]+xmontosas[6]+
                                     xmontosas[7]+xmontosas[8]+xmontosas[9]+xmontosas[10]+xmontosas[11]+xmontosas[12]+
                                     xmontosmo[1]+xmontosmo[2]+xmontosmo[3]+xmontosmo[4]+xmontosmo[5]+xmontosmo[6]+
                                     xmontosmo[7]+xmontosmo[8]+xmontosmo[9]+xmontosmo[10]+xmontosmo[11]+xmontosmo[12]) -
                                (xmontos[1]+xmontos[2]+xmontos[3]+xmontos[4]+xmontos[5]+xmontos[6]+
                                    xmontos[7]+xmontos[8]+xmontos[9]+xmontos[10]+xmontos[11]+xmontos[12]);
                   xtotvmme := (xmontosas[13]+xmontosas[14]+xmontosas[15]+xmontosas[16]+xmontosas[17]+xmontosas[18]+
                                xmontosas[19]+xmontosas[20]+xmontosas[21]+xmontosas[22]+xmontosas[23]+xmontosas[24]+
                                xmontosmo[13]+xmontosmo[14]+xmontosmo[15]+xmontosmo[16]+xmontosmo[17]+xmontosmo[18]+
                                xmontosmo[19]+xmontosmo[20]+xmontosmo[21]+xmontosmo[22]+xmontosmo[23]+xmontosmo[24]) -
                                (xmontos[13]+xmontos[14]+xmontos[15]+xmontos[16]+xmontos[17]+xmontos[18]+
                                 xmontos[19]+xmontos[20]+xmontos[21]+xmontos[22]+xmontos[23]+xmontos[24]);
                   //** 06/11/2000
                   for iX := 1 to 12 do
                    begin
                     { totales de EJ y VM }
                      xtotejmn := xtotejmn + xmontos[iX];
                      xtotejme := xtotejme + xmontos[iX+12];
                    end;
                    //**
                    { para el detalle, se asignan los totales }
                     DMCXP.cdsDetallePres.fieldbyname('DPRETOEJMN').AsString := FloatToStr(xtotejmn);
                     DMCXP.cdsDetallePres.fieldbyname('DPRETOEJME').AsString := FloatToStr(xtotejme);
                     DMCXP.cdsDetallePres.fieldbyname('DPRETOVMMN').AsString := FloatToStr(xtotvmmn);
                     DMCXP.cdsDetallePres.fieldbyname('DPRETOVMME').AsString := FloatToStr(xtotvmme);
                     { si hubiera montos }
                     for iX := 1 to 12 do
                      if (xmontosas[iX] <> 0) or (xmontosmo[iX] <> 0) then
                       begin
                        xestado1 := true;
                        break;
                       end;
                     { me indica que hay que actualizar los VP }
                     if xEstado1 = true then
                      begin
                       DMCXP.cdsDetallePres.fieldbyname('DPRETOVPMN').AsString :=
                         FloatToStr(((xmontos[1]+xmontos[2]+xmontos[3]+xmontos[4]+xmontos[5]+xmontos[6]+
                                    xmontos[7]+xmontos[8]+xmontos[9]+xmontos[10]+xmontos[11]+xmontos[12])/
                                    (xmontosas[1]+xmontosas[2]+xmontosas[3]+xmontosas[4]+xmontosas[5]+xmontosas[6]+
                                     xmontosas[7]+xmontosas[8]+xmontosas[9]+xmontosas[10]+xmontosas[11]+xmontosas[12]+
                                     xmontosmo[1]+xmontosmo[2]+xmontosmo[3]+xmontosmo[4]+xmontosmo[5]+xmontosmo[6]+
                                     xmontosmo[7]+xmontosmo[8]+xmontosmo[9]+xmontosmo[10]+xmontosmo[11]+xmontosmo[12]))*100);
                        DMCXP.cdsDetallePres.fieldbyname('DPRETOVPME').AsString :=
                         FloatToStr(((xmontos[13]+xmontos[14]+xmontos[15]+xmontos[16]+xmontos[17]+xmontos[18]+
                                    xmontos[19]+xmontos[20]+xmontos[21]+xmontos[22]+xmontos[23]+xmontos[24]) /
                                    (xmontosas[13]+xmontosas[14]+xmontosas[15]+xmontosas[16]+xmontosas[17]+xmontosas[18]+
                                     xmontosas[19]+xmontosas[20]+xmontosas[21]+xmontosas[22]+xmontosas[23]+xmontosas[24]+
                                     xmontosmo[13]+xmontosmo[14]+xmontosmo[15]+xmontosmo[16]+xmontosmo[17]+xmontosmo[18]+
                                     xmontosmo[19]+xmontosmo[20]+xmontosmo[21]+xmontosmo[22]+xmontosmo[23]+xmontosmo[24]))*100);
                        xestado1 := false;
                      end
                     else
                      begin
                       DMCXP.cdsDetallePres.fieldbyname('DPRETOVPMN').AsString := FloatToStr(200);
                       DMCXP.cdsDetallePres.fieldbyname('DPRETOVPME').AsString := FloatToStr(200);
                      end;
                     DMCXP.cdsSQL.Post;
                     DMCXP.cdsDetallePres.Post;
                     DMCXP.cdsDetallePres.ApplyUpdates(0);
                     xEstado := false;
                   end;
                   DMCXP.cdsPlaParPre.next;
                  end;
                 { se igualan variables }
                 xmaxnivelinf := xmaxnivelint;
                 xmaxdigitoinf := xmaxdigitoint;
          until xmaxnivelsup = xmaxnivelint;
         end;
      end;
     DMCXP.cdsDetCxP.Next;
    end;
end;

procedure TFNotasDC.dblcTipPreExit(Sender: TObject);
begin
  if xCrea  = true then exit;
  if bbtnRegCanc.Focused then exit;
  if dblcdCCosto.Focused then exit;
  if dblcdCnpEgr.Focused then exit;
  if dblcTipReg.Focused then exit;
  if Length(dblcTipPre.Text) = 0 then
   begin
    raise exception.Create('Falta Tipo de Presupuesto');
    dblcTipPre.SetFocus;
   end;
end;

procedure TFNotasDC.dblcdPresupExit(Sender: TObject);
begin
  if xCrea  = true then exit;
  if bbtnRegCanc.Focused then exit;
  if dblcdCCosto.Focused then exit;
  if dblcdCnpEgr.Focused then exit;
  if dblcTipReg.Focused then exit;
  //** 18/12/2000 - pjsv
  //edtPresup.Text:=DMCXP.DisplayDescrip('TGE216','PARPRESDES','PARPRESID',dblcdPresup.Text);
  edtPresup.Text:=DMCXP.DisplayDescrip('PPRES201','PARPRESDES','PARPRESID',dblcdPresup.Text);
  //**
  if Length(edtPresup.text)=0 then
   begin
    raise exception.Create('Falta Partida Presupuestal');
    dblcdPresup.SetFocus;
  end;
end;

procedure TFNotasDC.Z2bbtnPreviewClick(Sender: TObject);
var
  xSQL,mes,ano,xwhere,MONABR : string;
  ssql,xliq : string;
  mesdes : String;
  TSimbolo,TMoneda : String;
  xTotHaber:DOUBLE;
  xDia, xMes, xAno : word;
begin
   if DMCXP.wAdmin='G' then Exit;

   if DMCXP.cdsMovCxP2.fieldbyname('CP_CONTA').AsString <> 'S' then
   begin
      if not AsientoCuadra then
         raise exception.Create('Error:  Asiento No Cuadra');

      xSQL:='delete FROM CNT311 Where CIAID='+quotedstr(dblcCia.text) +' and '+
            'CNTANOMM='+quotedstr(xAnomes) +' and '+
            'TDIARID='+quotedstr(dblcTDiario.Text) +' and '+
            'CNTCOMPROB='+quotedstr(dbeNoReg.text);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
      except
      end;

      xSQL:='delete FROM CNT310 Where CIAID='+quotedstr(dblcCia.text) +' and '+
            'CNTANOMM='+quotedstr(xAnomes) +' and '+
            'TDIARID='+quotedstr(dblcTDiario.Text) +' and '+
            'CNTCOMPROB='+quotedstr(dbeNoReg.text);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
      except
      end;

      if (DMCXP.cdsCia.FieldByName('PRORATEO').AsString='S') then
      begin
         if (DMCXP.cdsCia.FieldByName('IGVSN').AsString='1') then
         begin
            if DMCXP.cdsMovCxP2.FieldByName('CPIGV2').AsFloat>0 then
               FToolCont.Prorrateo(dblcCia.text,dblcTDiario.Text,xAnomes,xNRegistro);
         end
         else
            if (DMCXP.cdsCia.FieldByName('IGVSN').AsString='2') then
            begin
               if DMCXP.cdsMovCxP2.FieldByName('CPIGV').AsFloat>0 then
                  FToolCont.Prorrateo(dblcCia.text,dblcTDiario.Text,xAnomes,xNRegistro);
            end;
      end;

      DMCXP.GeneraContab(dblcCia.Text, dblcTDiario.Text, xAnomes, xNRegistro, Self, 'P' );

      DMCXP.cdsCXP.Data:=DMCXP.cdsMovCnt.data;

      decodedate(dtpFComp.Date,xAno,xMes,xDia);
      mes:= strzero(inttostr(xMes),2);
      ano:= inttostr(xAno);
      xWhere := 'MESIDR='''+mes+'''';
      mesdes := DMCXP.DisplayDescrip2('dspTGE','TGE181','MESDESL',XWHERE,'MESDESL');
   end;

   if DMCXP.cdsMovCxP2.fieldbyname('CP_CONTA').AsString = 'S' then
   begin
      xsql:='SELECT * FROM CNT301 '
         +'WHERE CIAID='+quotedstr(dblcCia.text) +' AND '
         +'CNTANOMM='+quotedstr(xAnomes) +' AND '
         +'TDIARID='+quotedstr(dblcTDiario.Text) +' AND '
         +'CNTCOMPROB='+quotedstr(dbeNoReg.text)
         +' order by CNT301.CNTREG';
      DMCXP.cdsCxP.Close;
      DMCXP.cdsCxP.DataRequest(xSQL);
      DMCXP.cdsCxP.Open;

      ppdbpPreview.DataSource := DMCXP.dsCxP;

      mes:=copy(DMCXP.cdsCxP.fieldbyname('CNTANOMM').asstring,5,2);
      ano:=copy(DMCXP.cdsCxP.fieldbyname('CNTANOMM').asstring,1,4);

      xWhere := 'MESIDR='''+mes+'''';
      mesdes := DMCXP.DisplayDescrip2('dspTGE','TGE181','MESDESL',XWHERE,'MESDESL');

   end;

  // DMCXP.cdsDetCxP.DisableControls;
   ppdbpPreview.DataSource     := DMCXP.dsCxP;
   pprPreview.TEMPLATE.FileName:= ExtractFilePath( application.ExeName ) + wRutaRpt+'\CxPVoucher.rtm' ;
   pprPreview.template.LoadFromFile ;

   TMoneda:= DMCXP.DisplayDescrip2('dspTGE','TGE103','TMON_LOC','TMONID='+quotedstr(dblcTMon.text),'TMON_LOC');
   MONABR := DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONABR', 'TMONID='+quotedstr(dblcTMon.text),'TMONABR' );

   pplblMonedaDoc.Caption := MONABR;
   pplblCiades.Caption    := edtCia.text ;
   pplblCodProv.Caption   := dblcdProv.Text;
   pplblDiarioDes.Caption := DMCXP.DisplayDescrip2('dspTGE','TGE104','TDIARDES','TDIARID='+quotedstr(dblcTDiario.Text),'TDIARDES');
   pplblTDiario.Caption   := dblcTDiario.Text;
   pplblProveedor.Caption := edtProv.text;
   pplblGlosaDes.caption  := DMCXP.cdsCxP.fieldbyname('CNTGLOSA').asstring;
   pplblTipoCamb.Caption  := FloatToStrF(StrToFloat(dbeTCambio.text),ffNumber,10,3);
   pplblAnoMes.Caption    := xAnomes;
   pplblNoCompro.Caption  := dbeNoReg.text ;
   pplblMonedaDes.caption := DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONDES','TMONID='+quotedstr(dblcTMon.text),'TMONDES');
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   pplblFecEmision.Caption := DMCXP.cdsCanje.Fieldbyname('CCPFCJE').AsString;
// Fin HPC_201707_CXP

   xTotHaber:= 0;
   DMCXP.cdsDetCxP.First ;
   while not DMCXP.cdsDetCxP.Eof do
   begin
      if DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'H' then
         xTotHaber:= xTotHaber+FRound(DMCXP.cdsDetCxP.Fieldbyname('DCPMOORI').AsFloat,15,2);
      DMCXP.cdsDetCxP.Next;
   end;
   DMCXP.cdsDetCxP.First;
   pplblMontoImporte.Caption:=MONABR+' '+FloatToStrF(xTotHaber,ffNumber,15,2);

   if TMoneda = 'L' then
   begin
      pplblMonedaDoc.Visible := false;
      ppdbMtoExt.Visible:= false;
      pplblCntTCambio.Visible:= false;
      ppdbCntTCambio.Visible:= false;
   end;

   if DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString='S' then
      pplblDesEstado.caption:='Contabilizado'
   else
      pplblDesEstado.caption:='Previo';

   pprPreview.Print;
   pprPreview.Stop;
   ppdbpPreview.DataSource:=nil ;
end;

procedure TFNotasDC.ppDetailBand2BeforePrint(Sender: TObject);
begin
//   pplblMesDia.Caption := DMCXP.CdsCxP.Fieldbyname('CNTFEMIS').AsString;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
	pplblFecEmision.Caption := DMCXP.cdsDetCanje.Fieldbyname('CCPFCJE').AsString;
// Fin HPC_201707_CXP
end;

procedure TFNotasDC.dblcdCnpEgrEnter(Sender: TObject);
begin
  strTemp := dblcdCnpEgr.text;
end;

Function TFNotasDC.AsientoCuadra:Boolean;
var
   xTotDebe, xTotHaber : double;
   xCampo  : String;
begin
   Result    := False;
   xTotDebe  := 0;
   xTotHaber := 0;
   if DMCXP.cdsMovCxP2.fieldbyname('TMONID').AsString=DMCXP.wTMonLoc then
      xCampo:= 'DCPMOLOC'
   else
      xCampo:= 'DCPMOEXT';

//   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.First ;
   While not DMCXP.cdsDetCxP.Eof do begin
      If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' then
         xTotDebe := xTotDebe +FRound(DMCXP.cdsDetCxP.Fieldbyname(xCampo).Value,15,2)
      else begin
         xTotHaber:= xTotHaber+FRound(DMCXP.cdsDetCxP.Fieldbyname(xCampo).Value,15,2);
      end;
      DMCXP.cdsDetCxP.Next;
   end;
   DMCXP.cdsDetCxP.First;
//   DMCXP.cdsDetCxP.EnableControls;

   If FRound(xTotDebe,15,2)=FRound(xTotHaber,15,2) then
      Result := True;
end;

procedure TFNotasDC.Items;
var
 xCont : Integer;
begin
   xCont := 1;
   DMCXP.cdsDetCxP.First;
   while not DMCXP.cdsDetCxP.eof do
    begin
      DMCXP.cdsDetCxP.Edit;
      DMCXP.cdsDetCxP.fieldByName('DCPREG').AsInteger := xCont;
      DMCXP.cdsDetCxP.next;
      xCont := xCont + 1;
    end;
end;


procedure TFNotasDC.pprPreviewPreviewFormCreate(Sender: TObject);
begin
  pprPreview.PreviewForm.ClientHeight := 580;
  pprPreview.PreviewForm.ClientWidth := 780;			// ppViewr
  tppviewer(pprPreview.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFNotasDC.dblcTDiarioExit(Sender: TObject);
var
   xWhere : String;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

   if length(xFiltroTDiar)>0 then
   begin
      xWhere := '('+xFiltroTDiar+') and TDiarId='+''''+dblcTDiario.Text+'''';
      edtTDiario.Text:=BuscaQry('PrvTGE','TGE104','*',xWhere,'TDiarDes');
   end;
   if length(edtTDiario.Text)=0 then
   begin
      ShowMessage('Falta Tipo de Diario');
      dblcTDiario.SetFocus;
   end;
end;

procedure TFNotasDC.dblcImpuestoEnter(Sender: TObject);
begin
   DMCXP.cdsTipReg2.IndexFieldNames:='TREGID';
end;

procedure TFNotasDC.dblcImpuestoExit(Sender: TObject);
begin
  If Length( dblcImpuesto.Text )>0 then
  	edtImpuesto.Text := DMCXP.cdsTipReg2.FieldByname( 'TRegDes' ).AsString;

end;

procedure TFNotasDC.bbtnGenRegClick(Sender: TObject);
var
	xBaseImp, xImpuTot, wtasa, xTOT, xIGV : Double;
   xWhere, xBusca : String;
   //Inicio SAR666
   xTRegId06, xTipDet :String;
   //Fin SAR666
begin
   If Length(dblcImpuesto.Text)=0 Then Exit;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   DMCXP.cdsTipReg2.Filtered := False;
   DMCXP.cdsTipReg2.Filter:= 'TREGID='''+dblcImpuesto.Text+'''';
   DMCXP.cdsTipReg2.Filtered := True;
// Fin HPC_201707_CXP
   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.First;
   while not DMCXP.cdsDetCxP.eof do
   begin
     if DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString=DMCXP.cdsTipReg2.FieldByName('TipDet').AsString then
     begin
        DMCXP.cdsDetCxP.Delete;
     end
     else begin
        DMCXP.cdsDetCxP.Next;
     end;
   end;

   DMCXP.cdsDetCxP.First;
   xBaseImp :=0;
   xImpuTot :=0;
   wTasa    :=0;
   //Inicio SAR666
   xTRegId06 := '' ;
   xTipDet := '';
   //Fin SAR666
   //Inicialiazando el DataSet Auxiliar
   Filtracds( DMCXP.cdsDetCxP2, 'Select * from CXP302 Where 1=2' );

   while not DMCXP.cdsDetCxP.eof do
   begin
     //Inicio SAR666
     //if (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString='MG') or (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString='NG')  then
     if (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString='MG') or (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString='NG')
          or (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString='MN') then
     //Fin SAR666
     begin // Monto Gravado/Base Imponible/Monto Afecto
        xBaseImp:=xBaseImp+FRound(DMCXP.cdsDetCxP.FieldByname('DCPMoOri').Value,15,2);
     end;
     if Copy(DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString,1,1)='I' then
     begin
        if DMCXP.cdsDetCxP.FieldByname('DCPDH').AsString='D' then
           xImpuTot:=xImpuTot+FRound(DMCXP.cdsDetCxP.FieldByname('DCPMOORI').Value,15,2)
        else
           xImpuTot:=xImpuTot-FRound(DMCXP.cdsDetCxP.FieldByname('DCPMOORI').Value,15,2);
     end;
     //Inicio SAR666
     if DMCXP.cdsDetCxP.FieldByName('TREGID').AsString='06' then
     begin
        CopiaRegistro( DMCXP.cdsDetCxP, DMCXP.cdsDetCxP2);
        xTRegId06 := '09' ;
        xTipDet :=DMCXP.DisplayDescrip('TGE113','TIPDET','TREGID',xTRegId06);
     end;
     //Fin SAR666
     DMCXP.cdsDetCxP.Next;
   end;

   wTasa := FRound( (DMCXP.cdsTipReg2.FieldByName('TASA').AsFloat/100) ,7,2);
   //INICIO HPP_201101_CXP
   if dtpFComp.date <= StrToDate('28/02/2011')  then
      wTasa := 0.19;
   //FIN HPP_201101_CXP
   //////////////////////////////
   //         I. G. V.         //
   //////////////////////////////
   xIGV := FRound( (xBaseImp * wTasa),15,2 );

  //Inicio SAR666
   if length(xTRegId06)>0 then
   begin
      ImpuestoReg06(xTRegId06, xTipDet, wTasa, xIGV) ;
   end
   else
   begin
   //Fin SAR666

      DMCXP.cdsDetCxP.Last;
      numreg:=DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger+1;

      DMCXP.cdsDetCxP.Append;
      DMCXP.cdsDetCxP.FieldByname('DCPMOORI').Value := xIGV;
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  := numreg;

   //   GrabaDet;
      LlenaDetCxp;

      DMCXP.cdsDetCxP.FieldByname('TREGID').Value  := DMCXP.cdsTipReg2.fieldbyname('TREGID').AsString;  //'03';
      DMCXP.cdsDetCxP.FieldByname('TIPDET').Value  := DMCXP.cdsTipReg2.FieldByName('TIPDET').AsString; // 'I1'

      wTasa := FRound( (DMCXP.cdsTipReg2.FieldByName('Tasa').AsFloat/100) ,7,2);
      //INICIO HPP_201101_CXP
      if dtpFComp.date <= StrToDate('28/02/2011')  then
         wTasa := 0.19;
      //FIN HPP_201101_CXP
      //REVISAR
      if DMCXP.cdsTipReg2.fieldbyname('DCPDH').AsString='D' then
          DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString  := 'H'
      else begin
          DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString  := 'D';
      end;
      //

   //   DMCXP.cdsDetCxP.FieldByname('DCPDH').Value:= DMCXP.cdsTipReg2.FieldByName('DCPDH').AsString;

   //   if DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString='H' then
   //      xIGV:=xIGV*(-1);

      if DMCXP.cdsDetCxP.State=dsInsert then
      begin
  	      if DMCXP.cdsDetCxP.FieldByname('TMonId').Value=DMCXP.wTMonLoc then
         begin
            DMCXP.cdsDetCxP.FieldByname('CPTOID').Value  :=DMCXP.cdsTipReg2.fieldbyname('CPTOMN').AsString;
            DMCXP.cdsDetCxP.FieldByname('CUENTAID').Value:=DMCXP.cdsTipReg2.fieldbyname('CUENTAMN').AsString;
         end
         else
         begin
            DMCXP.cdsDetCxP.FieldByname('CPTOID').Value  :=DMCXP.cdsTipReg2.fieldbyname('CPTOME').AsString;
            DMCXP.cdsDetCxP.FieldByname('CUENTAID').Value:=DMCXP.cdsTipReg2.fieldbyname('CUENTAME').AsString;
         end;

         // glosa repetir
         if xGlosaRep<>'' then
            DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:=xGlosaRep
         else
         begin
            if (DMCXP.wSRV_RUTA='\\INCORESA') then
               DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:=edtProv.Text
            else
            begin
               DMCXP.cdsCnpEgr.IndexFieldNames:='CPTOID';
               DMCXP.cdsCnpEgr.SetKey;
               DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString:=DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString;
               if DMCXP.cdsCnpEgr.Gotokey then
               begin
                  DMCXP.cdsDetCxP.FieldByname('DCPGLOSA').Value:=DMCXP.cdsCnpEgr.fieldbyname('CPTODES').AsString;
               end;
            end;
         end;
      end;
   //Inicio SAR666
   end;
   //Fin SAR666
   cdsPost( DMCXP.cdsDetCxP );
   DMCXP.cdsDetCxP.Post;


//////////////////////////////
//        T O T A L         //
//////////////////////////////
   //CIM 11/06/2002
   xTOTLOC :=0;
   xTOTEXT :=0;

   xTOT := FRound( (xBaseImp + xImpuTot + xIGV), 15, 2 );
   if DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
   begin
      xTOTLOC:=xTOT;
      xTOTEXT:=FRound(xTOTLOC/DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
   end
   else
   begin
     if DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
     begin
        xTOTEXT:=xTOT;
        xTOTLOC:=FRound(xTOT*DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
     end
     else begin // Otras Monedas Extranjeras
     end;

   end;

   DMCXP.cdsDetCxP.First;
   while not DMCXP.cdsDetCxP.eof do
   begin
      if DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString='TO' then
      begin
        DMCXP.cdsDetCxP.Delete;
        Break;
      end;
			DMCXP.cdsDetCxP.Next;
	 end;

	 DMCXP.cdsDetCxP.Append;
	 DMCXP.cdsDetCxP.FieldByname('DCPMOORI').Value := xTOT;
	 numreg:=numreg+1;
	 DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  := numreg;

    xBusca:='Select B.* from CXP103 A, TGE113 B '
           +'Where A.CIAID='''+dblcCia.Text+''' and A.TREGID='''+DMCXP.cdsTipReg2.fieldbyname('TREGID').AsString+''' '
           +  'and A.TREGREL=B.TREGID AND B.TIPDET=''TO'' '
           +'Order by TIPDET';
    DMCXP.cdsQry.Close;
    DMCXP.cdsQry.DataRequest( xBusca );
    DMCXP.cdsQry.Open;

    if DMCXP.cdsQry.Recordcount<=0 then begin
      //CIM 11/06/2002
       xWhere := 'TIPDET='+''''+'TO'+'''';
       DMCXP.cdsDetCxP.FieldByname('TIPDET').Value:=BuscaQry('PrvTGE','TGE113','*',xWhere,'TIPDET');
    end;

	 DMCXP.cdsDetCxP.FieldByname('TIPDET').Value := DMCXP.cdsQry.fieldbyname('TIPDET').AsString;
	 DMCXP.cdsDetCxP.FieldByname('TRegId').Value := DMCXP.cdsQry.fieldbyname('TREGID').AsString;

    ///////////
    if DMCXP.cdsQry.fieldbyname('DCPDH').AsString='D' then
       DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString  := 'H'
    else begin
       DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString  := 'D';
    end;
    ///////////


//	 DMCXP.cdsDetCxP.FieldByname('DCPDH').Value  := DMCXP.cdsQry.fieldbyname('DCPDH').AsString;

//    GrabaDet;
    LlenaDetCxp;

	 if DMCXP.cdsDetCxP.State=dsInsert then
	 begin
		 if DMCXP.cdsDetCxP.FieldByname('TMonId').Value=DMCXP.wTMonLoc then
     begin
        DMCXP.cdsDetCxP.FieldByname('CPTOID').Value  :=DMCXP.cdsQry.fieldbyname('CPTOMN').AsString;
        DMCXP.cdsDetCxP.FieldByname('CUENTAID').Value:=DMCXP.cdsQry.fieldbyname('CUENTAMN').AsString;
     end
     else
     begin
        DMCXP.cdsDetCxP.FieldByname('CPTOID').Value  :=DMCXP.cdsQry.fieldbyname('CPTOME').AsString;
        DMCXP.cdsDetCxP.FieldByname('CUENTAID').Value:=DMCXP.cdsQry.fieldbyname('CUENTAME').AsString;
     end;

     //Repetir Glosa
     if xGlosaRep<>'' then
         DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:=xGlosaRep
     else
     begin
       if (DMCXP.wSRV_RUTA='\\INCORESA') then
           DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:=edtProv.Text
       else
       begin
         xWhere := 'CPTOID='+''''+DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString+'''';
         if length(BuscaQry('PrvCxP','CXP201','*',xWhere,'CPTOID'))>0 then
            DMCXP.cdsDetCxP.FieldByname('DCPGLOSA').Value:=DMCXP.cdsQry.fieldbyname('CPTODES').AsString;
       end;  
     end;
   end;
   ///*

   cdsPost( DMCXP.cdsDetCxP );
   DMCXP.cdsDetCxP.Post;

   Items;
   
   DMCXP.cdsDetCxP.EnableControls;

// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   DMCXP.cdsTipReg2.Filtered := False;
// Fin HPC_201707_CXP
end;

procedure TFNotasDC.bbtnTotalClick(Sender: TObject);
var
	xBaseImp, xImpuTot, xITotal, wtasa, xTOT, xIGV : Double;
   xWhere, xBusca, xTRTot, xTRIgv : String;
begin
   If Length(dblcImpuesto.Text)=0 Then Exit;

   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.First;
   while not DMCXP.cdsDetCxP.eof do
   begin
      if (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString='MG') or (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString='NG')  then
      begin
         DMCXP.cdsDetCxP.Delete;
      end
      else begin
         DMCXP.cdsDetCxP.Next;
      end;
   end;

   DMCXP.cdsDetCxP.First;
   xBaseImp :=0;
   xImpuTot :=0;
   xITotal  :=0;
   wTasa    :=0;
   while not DMCXP.cdsDetCxP.eof do
   begin
      if Copy(DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString,1,1)='I' then
      begin
         xImpuTot:=xImpuTot+FRound(DMCXP.cdsDetCxP.FieldByname('DCPMoOri').Value,15,2);
         xTRIgv:=DMCXP.cdsDetCxP.FieldByname('TRegId').AsString;
      end;
      if Copy(DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString,1,1)='T' then
      begin
         xITotal:=xITotal+FRound(DMCXP.cdsDetCxP.FieldByname('DCPMoOri').Value,15,2);
         xTRTot:=DMCXP.cdsDetCxP.FieldByname('TRegId').AsString;
      end;
      DMCXP.cdsDetCxP.Next;
   end;


   //////////////////////////////
   //         I. G. V.         //
   //////////////////////////////
   if xImpuTot<=0 then begin

      xBusca:='Select B.* from CXP103 A, TGE113 B '
             +'Where A.CIAID='''+dblcCia.Text+''' and A.TREGREL='''+xTRTot+''' '
             +  'and A.TREGID=B.TREGID AND SUBSTR(B.TIPDET,1,1)=''I'' '
             +'Order by TIPDET';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest( xBusca );
      DMCXP.cdsQry.Open;

      wTasa   :=FRound( (DMCXP.cdsQry.FieldByName('Tasa').AsFloat/100)+1 ,7,2);
      //INICIO HPP_201101_CXP
      if dtpFComp.date <= StrToDate('28/02/2011')  then
         wTasa := 0.19;
      //FIN HPP_201101_CXP
      xBaseImp:=FRound( (xITotal / wTasa),   15,2 );
      xIGV    :=FRound( (xITotal - xBaseImp),15,2 );

      DMCXP.cdsDetCxP.Last;
      numreg:=DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger+1;

      DMCXP.cdsDetCxP.Append;
      DMCXP.cdsDetCxP.FieldByname('DCPMoOri').Value := xIGV;
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  := numreg;

//      GrabaDet;
      LlenaDetCxp;

      DMCXP.cdsDetCxP.FieldByname('TRegId').Value  := DMCXP.cdsQry.fieldbyname('TRegID').AsString;
      DMCXP.cdsDetCxP.FieldByname('TIPDET').Value  := DMCXP.cdsQry.FieldByName('TipDet').AsString;
      //////////////
      if DMCXP.cdsQry.fieldbyname('DCPDH').AsString='D' then
         DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString  := 'H'
      else begin
         DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString  := 'D';
      end;
      /////////////

//      DMCXP.cdsDetCxP.FieldByname('DCPDH').Value   := DMCXP.cdsQry.FieldByName('DCPDH').AsString;
 //CIM 24/02/2003
{      if DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString='H' then
         xIGV:=xIGV*(-1);}

      if DMCXP.cdsDetCxP.State=dsInsert then
      begin
  	      if DMCXP.cdsDetCxP.FieldByname('TMonId').Value=DMCXP.wTMonLoc then
         begin
            DMCXP.cdsDetCxP.FieldByname('CPTOID').Value  :=DMCXP.cdsTipReg2.fieldbyname('CPTOMN').AsString;
            DMCXP.cdsDetCxP.FieldByname('CUENTAID').Value:=DMCXP.cdsTipReg2.fieldbyname('CUENTAMN').AsString;
         end
         else begin
            DMCXP.cdsDetCxP.FieldByname('CPTOID').Value  :=DMCXP.cdsTipReg2.fieldbyname('CPTOME').AsString;
            DMCXP.cdsDetCxP.FieldByname('CUENTAID').Value:=DMCXP.cdsTipReg2.fieldbyname('CUENTAME').AsString;
         end;

         DMCXP.cdsCnpEgr.IndexFieldNames:='CPTOID';
         DMCXP.cdsCnpEgr.SetKey;
         DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString:=DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString;
         if DMCXP.cdsCnpEgr.Gotokey then
         begin
        	   DMCXP.cdsDetCxP.FieldByname('DCPGLOSA').Value:=DMCXP.cdsCnpEgr.fieldbyname('CPTODES').AsString;
         end;
      end;
      cdsPost( DMCXP.cdsDetCxP );
      DMCXP.cdsDetCxP.Post;
   end
   else begin
      xBaseImp:=FRound( (xITotal - xImpuTot ),   15,2 );
   end;


   //////////////////////////////
   //   BASE IMPONIBLE         //
   //////////////////////////////

   xBusca:='Select B.* from TGE113 B Where B.TIPDET=''MG'' ';

   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xBusca );
   DMCXP.cdsQry.Open;

   xTOTLOC :=0;
   xTOTEXT :=0;

  	xTOT := FRound( (xBaseImp) , 15, 2 );
   if DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
   begin
      xTOTLOC:=xTOT;
      xTOTEXT:=FRound(xTOTLOC/DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
   end
   else
   begin
     if DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
     begin
        xTOTEXT:=xTOT;
        xTOTLOC:=FRound(xTOT*DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
     end
     else begin // Otras Monedas Extranjeras
     end;

   end;

   DMCXP.cdsDetCxP.First;
   while not DMCXP.cdsDetCxP.eof do
   begin
      if (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString='MG') or (DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString='NG')  then
      begin
         DMCXP.cdsDetCxP.Delete
      end
      else
			DMCXP.cdsDetCxP.Next;
	 end;

	 DMCXP.cdsDetCxP.Append;
	 DMCXP.cdsDetCxP.FieldByname('DCPMOORI').Value := xTOT;
	 numreg:=numreg+1;
	 DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  := numreg;

	 DMCXP.cdsDetCxP.FieldByname('TIPDET').Value := DMCXP.cdsQry.fieldbyname('TIPDET').AsString;
	 DMCXP.cdsDetCxP.FieldByname('TRegId').Value := DMCXP.cdsQry.fieldbyname('TREGID').AsString;
    ///////////
    if DMCXP.cdsQry.fieldbyname('DCPDH').AsString='D' then
       DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString  := 'H'
    else begin
       DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString  := 'D';
    end;
    ///////////
//	 DMCXP.cdsDetCxP.FieldByname('DCPDH').Value  := DMCXP.cdsQry.fieldbyname('DCPDH').AsString;

    //GrabaDet;
    LlenaDetCxp;

    if DMCXP.cdsDetCxP.State=dsInsert then
    begin
     if DMCXP.cdsDetCxP.FieldByname('TMonId').Value=DMCXP.wTMonLoc then
     begin
        DMCXP.cdsDetCxP.FieldByname('CPTOID').Value  :=DMCXP.cdsQry.fieldbyname('CPTOMN').AsString;
        DMCXP.cdsDetCxP.FieldByname('CUENTAID').Value:=DMCXP.cdsQry.fieldbyname('CUENTAMN').AsString;
     end
     else
     begin
        DMCXP.cdsDetCxP.FieldByname('CPTOID').Value  :=DMCXP.cdsQry.fieldbyname('CPTOME').AsString;
        DMCXP.cdsDetCxP.FieldByname('CUENTAID').Value:=DMCXP.cdsQry.fieldbyname('CUENTAME').AsString;
     end;
     xWhere := 'CPTOID='+''''+DMCXP.cdsDetCxP.FieldByname('CPTOID').AsString+'''';
     if length(BuscaQry('PrvCxP','CXP201','*',xWhere,'CPTOID'))>0 then
        DMCXP.cdsDetCxP.FieldByname('DCPGLOSA').Value:=DMCXP.cdsQry.fieldbyname('CPTODES').AsString;
   end;
   ///*

   cdsPost( DMCXP.cdsDetCxP );
   DMCXP.cdsDetCxP.Post;

   Items;

   DMCXP.cdsDetCxP.EnableControls;

end;

procedure TFNotasDC.GrabaDet;
begin

  DMCXP.cdsDetCxP.FieldByName('CIAID').AsString     := DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString;
  DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString   := DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString;
  DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString   := DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString   := Copy( DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString,1,4);
  DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString  := DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString   := DMCXP.cdsMovCxP.fieldbyname('DCPLOTE').AsString;
  DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString   := 'CP';
  DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString   := dblcClAux.Text;
  DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString  := DMCXP.cdsMovCxP.fieldbyname('PROV').AsString;
  DMCXP.cdsDetCxP.FieldByName('DOCID').AsString     := DMCXP.cdsMovCxP.fieldbyname('DOCID').AsString;
  DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString   := DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString;
  DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString   := DMCXP.cdsMovCxP.fieldbyname('CPNODOC').AsString;
  DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat   := FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat,7,3);
  DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsdateTime := DMCXP.cdsMovCxP.fieldbyname('CPFEMIS').AsDateTime;
  DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:= DMCXP.cdsMovCxP.fieldbyname('CPFVCMTO').AsDateTime;
  DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsdateTime := DMCXP.cdsMovCxP.fieldbyname('CPFCMPRB').AsDateTime;
  DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString  := 'I'; // Activo
  DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString   := DMCXP.wUsuario;
  DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFREG').AsDateTime;
  DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPHREG').AsDateTime;
  DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString     := DMCXP.cdsMovCxP.fieldbyname('CPMM').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString     := DMCXP.cdsMovCxP.fieldbyname('CPDD').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString    := DMCXP.cdsMovCxP.fieldbyname('CPTRI').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString    := DMCXP.cdsMovCxP.fieldbyname('CPSEM').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString     := DMCXP.cdsMovCxP.fieldbyname('CPSS').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString  := DMCXP.cdsMovCxP.fieldbyname('CPAATRI').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString  := DMCXP.cdsMovCxP.fieldbyname('CPAASEM').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString   := DMCXP.cdsMovCxP.fieldbyname('CPAASS').AsString;
  DMCXP.cdsDetCxP.FieldByName('TMONID').AsString    := DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString;
  //CIM 11/06/2002
  if DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
  begin
      if DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString='TO' then
      begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=xTOTLOC;
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=xTOTEXT;
      end
      else
      begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat/DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
      end;
 	end
  else
  begin
    if DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
    begin
       if DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString='TO' then
       begin
          DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=xTOTLOc;
          DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=xTOTEXT;
       end
       else
       begin
          DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat*DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
          DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
       end
    end
    else begin // Otras Monedas Extranjeras
       DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=FRound( DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat*DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat, 15, 2 );
       DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=FRound( DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat/DMCXP.cdsMovCxP.fieldbyname('CPTCAMDOL').AsFloat, 15, 2 );
    end;
  end;
end;


procedure TFNotasDC.GrabaCabeceraCanje;
var
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
  sSQL,xNCanje,xSQL:string;
// Fin HPC_201707_CXP
  xxC1,xxC2,xxC3:string;
  a,m,d:word;
  xxTAno,xxTMes,xxTDiar:string;
  nNoReg:integer;
begin
   DecodeDate(dbdtpFEmis.Date,a,m,d);
   xxTAno:=StrZero(IntToStr(a),4);
   xxTMes:=StrZero(IntToStr(m),2);

   xxTDiar:=BuscaQry('dspTGE','TGE110','TDIARID','DOCTIPREG=''AP'' AND DOCMOD=''CXP''','TDIARID');
   xTAutoNum:=DMCXP.DisplayDescrip('TGE104','AUTONUM','TDIARID',xxTDiar);
   xNoReg   :=DMCXP.UltimoRegistro(xTAutoNum,dblcCia.text,xxTDiar,xxTAno,xxTMes );
   nNoReg   :=StrToInt(xNoReg);
   xNoReg   :='';
   while Length(xNoReg)=0 do
   begin
      xNoReg:=DMCXP.GrabaUltimoRegistro(xTAutoNum,dblcCia.text,xxTDiar,xxTAno,xxTMes, nNoReg );
      xNoReg:=StrZero( xNoReg, 10 );
      if not DMCXP.BuscaCxPReg(dblcCia.text,xxTDiar,xxTAno+xxTMes,xNoReg) then
      begin
           xNoReg:=StrZero( xNoReg, 10 );
         Break;
      end;
      nNoReg:=nNoReg+1;
   end;

  sSQL:='CIAID='+QuotedStr(dblcCia.Text)+' AND TCANJEID='+QuotedStr('NC');
  xxc1 :=StrZero(DMCXP.BuscaUltTGE('dspTGE','CXP304','CCPCANJE',sSQL),6);
  xxc2 :=StrZero(DMCXP.BuscaUltTGE('dspTGE','CXP301','CPCANJE',sSQL),6);
  xxc3 :=StrZero(DMCXP.BuscaUltTGE('dspTGE','CXP308','CANJE',sSQL),6);
  if xxc1>xxc2 then
   wCje:=xxc1
  else
   wCje:=xxc2;

  if wCje<xxc3 then
   wCje:=xxc3;

  wCje:=DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString;

  sSQL:=' SELECT * FROM CXP308 WHERE CIAID=''CLG'' AND TCANJEID=''CLG'' AND CANJE=''CLG'' ';
  DMCXP.cdsCCanje.Close;
  DMCXP.cdsCCanje.DataRequest(sSQL);
  DMCXP.cdsCCanje.Open;

  wTDiar:=xxTDiar;
  DMCXP.cdsCCanje.Insert;
  DMCXP.cdsCCanje.FieldByName('CIAID').AsString     :=dblcCia.text;
  DMCXP.cdsCCanje.FieldByName('TCANJEID').AsString  :='NC';
  DMCXP.cdsCCanje.FieldByName('CANJE').AsString     :=DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString;
  DMCXP.cdsCCanje.FieldByName('PROV').AsString      :=dblcdProv.text;
  DMCXP.cdsCCanje.FieldByName('PROVRUC').AsString   :=dblcdProvRuc.text;
  DMCXP.cdsCCanje.FieldByName('DOCID').AsString     :=DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
  DMCXP.cdsCCanje.FieldByName('TDIARID').AsString   :=xxTDiar;
  DMCXP.cdsCCanje.FieldByName('CCCMPRB').AsString   :=xNoreg ;
  DMCXP.cdsCCanje.FieldByName('CJFCANJE').AsDateTime:=dbdtpFEmis.date;
  DMCXP.cdsCCanje.FieldByName('CJFVALOR').AsDateTime:=dbdtpFEmis.date;
  DMCXP.cdsCCanje.FieldByName('CJFCOMP').AsDateTime :=dbdtpFEmis.date;
  DMCXP.cdsCCanje.FieldByName('TMONID').AsString    :=DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;
  DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsString :=DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsString;
  DMCXP.cdsCCanje.FieldByName('CJLOTE').AsString   :='';
  DMCXP.cdsCCanje.FieldByName('CPTOID').AsString   :=DMCXP.cdsMovCxP.FieldByName('CPTOTOT').AsString;
  DMCXP.cdsCCanje.FieldByName('CUENTAID').AsString :=DMCXP.cdsMovCxP.FieldByName('CTATOTAL').AsString;
  DMCXP.cdsCCanje.FieldByName('CJGLOSA').AsString  :=BuscaQry('dspTGE','CXP201','CPTODES','CPTOID='+QuotedStr(DMCXP.cdsMovCxP.FieldByName('CPTOTOT').AsString),'CPTODES');
  DMCXP.cdsCCanje.FieldByName('CJNUMLET').AsInteger:=0;
  DMCXP.cdsCCanje.FieldByName('CJDIAS').AsInteger  :=0;
  DMCXP.cdsCCanje.FieldByName('CJLETINI').AsString :='';
  DMCXP.cdsCCanje.FieldByName('CJUSER').AsString   :=DMCXP.wUsuario;
  DMCXP.cdsCCanje.FieldByName('CJFREG').AsDateTime :=Date;
  DMCXP.cdsCCanje.FieldByName('CJFHOR').AsDateTime :=Time;
  DMCXP.cdsCCanje.FieldByName('CJESTADO').AsString :='C';
  DMCXP.cdsCCanje.FieldByName('CLAUXID').AsString  :=DMCXP.cdsMovCxP.FieldByName('CLAUXID').AsString;
  DMCXP.cdsCCanje.FieldByName('CJEGIRADO').AsString:=DMCXP.cdsMovCxP.FieldByName('PROVDES').AsString;

  DMCXP.cdsCCanje.FieldByName('CJAAMM').AsString := xxTAno+xxTMes;

  if DMCXP.BuscaFecha('TGE114','FECANO','FECHA',dbdtpFEmis.date ) then
  begin
    DMCXP.cdsCCanje.FieldByName('CJAA').AsString   := DMCXP.cdsULTTGE.FieldByName('FECANO').AsString;
    DMCXP.cdsCCanje.FieldByName('CJMM').AsString   := DMCXP.cdsULTTGE.FieldByName('FECMES').AsString;      // mes
    DMCXP.cdsCCanje.FieldByName('CJDD').AsString   := DMCXP.cdsULTTGE.FieldByName('FECDIA').AsString;      // día
    DMCXP.cdsCCanje.FieldByName('CJTRI').AsString  := DMCXP.cdsULTTGE.FieldByName('FECTRIM').AsString;     // trimestre
    DMCXP.cdsCCanje.FieldByName('CJSEM').AsString  := DMCXP.cdsULTTGE.FieldByName('FECSEM').AsString;      // semestre
    DMCXP.cdsCCanje.FieldByName('CJSS').AsString   := DMCXP.cdsULTTGE.FieldByName('FECSS').AsString;       // semana
    DMCXP.cdsCCanje.FieldByName('CJAATRI').AsString:= DMCXP.cdsULTTGE.FieldByName('FECAATRI').AsString;    // año+trimestre
    DMCXP.cdsCCanje.FieldByName('CJAASEM').AsString:= DMCXP.cdsULTTGE.FieldByName('FECAASEM').AsString;    // año+semestre
    DMCXP.cdsCCanje.FieldByName('CJAASS').AsString := DMCXP.cdsULTTGE.FieldByName('FECAASS').AsString;     // año+semana
  end;
  DMCXP.cdsCCanje.Post;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
  xSQL := 'INSERT INTO CXP308 '
         +'( CIAID,TCANJEID,CANJE,PROV,PROVRUC,DOCID,TDIARID,CCCMPRB,CJFCANJE,CJFVALOR,CJFCOMP'
         +'  ,TMONID,CJTCAMBIO,CJLOTE,CPTOID,CUENTAID,CJGLOSA,CJNUMLET,CJDIAS,CJLETINI,CJUSER'
         +'  ,CJFREG,CJFHOR,CJESTADO,CLAUXID,CJEGIRADO,CJAAMM,CJAA,CJMM,CJDD,CJTRI,CJSEM,CJSS'
         +'  ,CJAATRI,CJAASEM,CJAASS) VALUES('
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CIAID').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('TCANJEID').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CANJE').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('PROV').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('PROVRUC').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('DOCID').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('TDIARID').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CCCMPRB').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJFCANJE').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJFVALOR').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJFCOMP').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('TMONID').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJLOTE').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CPTOID').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CUENTAID').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJGLOSA').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJNUMLET').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJDIAS').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJLETINI').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJUSER').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJFREG').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJFHOR').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJESTADO').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CLAUXID').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJEGIRADO').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJAAMM').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJAA').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJMM').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJDD').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJTRI').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJSEM').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJSS').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJAATRI').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJAASEM').AsString)+','
         +QuotedStr(DMCXP.cdsCCanje.FieldByName('CJAASS').AsString)+')';

         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

// Inicia HPC_201401_CXP
      //DMCXP.AplicaDatos(DMCXP.cdsCCanje, 'CCanje');
      {if DMCXP.cdsCCanje.ApplyUpdates(0)>0 then
      begin
         ShowMessage('No se puede insertar');
         exit;
      end;}
// Fin HPC_201707_CXP
// Finaliza HPC_201401_CXP

  {
  DMCXP.SaldosAuxiliar( DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString,   DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString,
                      DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString, DMCXP.cdsMovCxP.fieldbyname('PROV').AsString, sSigno,
                      DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat, DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat,
                      DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString);
   }
end;


procedure TFNotasDC.GrabaDetalleCanje;
Var
   I: Integer;
   wTasa, wSubT, dDebe, dHabe : Double;
   xsql : String;
begin
   Filtracds( DMCXP.cdsDetCxP, 'Select * from CXP302 Where CIAID=''CLG''' );

   xNReg:=0;
   DMCXP.cdsDetCanje.DisableControls;
   DMCXP.cdsDetCanje.First;
   if DMCXP.cdsDetCanje.RecordCount>0 then
   begin
      // INSERTA LOS REGISTROS DE LOS DOCUMENTOS SELECCIONADOS EN EL HABER
      while not DMCXP.cdsDetCanje.EOF do
      begin
         xSQL:='Select * from CXP301 A '
              +'Where CIAID='''  +dblcCia.text   +''' and CLAUXID='''+dblcClAux.text+''' '
              +  'and PROV='''   +dblcdProv.text +''' '
              +  'and DOCID='''  +DMCXP.cdsDetCanje.FieldByName('DOCID').AsString  +''' '
              +  'and CPSERIE='''+DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString+''' '
              +  'and CPNODOC='''+DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString+''' ';
         DMCXP.cdsQry1.Close;
         DMCXP.cdsQry1.DataRequest( xSQL );
         DMCXP.cdsQry1.Open;

         DMCXP.cdsDetCxP.Insert;
         LlenaDetCxP1(xNoReg);
         //BuscaQry('dspTGE','CXC208','CIAID,CPTOCAB,CPTODES,CPTOABR,CUENTAID,TREGID,TIPDET,CCDH','CIAID='+QuotedStr(dblcCia.text)+' AND CPTOCAB='+QuotedStr(DMCXP.cdsCanjes.FieldByName('CPTOID').AsString),'CPTOCAB');

         DMCXP.cdsDetCxP.Edit;
         //DMCXP.cdsDetCxC.FieldByName('TREGID').AsString:=DMCXP.cdsQry.FieldByName('TREGID').AsString;
         //DMCXP.cdsDetCxC.FieldByName('TIPDET').AsString:=DMCXP.cdsQry.FieldByName('TIPDET').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    :='D';
         DMCXP.cdsDetCxP.FieldByName('DOCID').AsString   := DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString := DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString := DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString  := DMCXP.cdsQry1.FieldByName('CPTOTOT').AsString;
         DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString:= DMCXP.cdsQry1.FieldByName('CTATOTAL').AsString;
         // vhndema
         // DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:= DMCXP.DisplayDescrip2('prvSQL','CXP201','CPTOID, CPTODES, NIVELMOV, CUENTAID','CPTOID='+quotedStr(DMCXP.cdsQry1.FieldByName('CPTOTOT').AsString),'CPTOID');
         DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:= DMCXP.DisplayDescrip2('prvSQL','CXP201','CPTOID, CPTODES, NIVELMOV, CUENTAID','CPTOID='+quotedStr(DMCXP.cdsQry1.FieldByName('CPTOTOT').AsString),'CPTODES');
         // end vhndema


         if DMCXP.cdsDetCanje.FieldByName('TMONID').AsString=DMCXP.wTMonExt then
         begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat*DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat,15,2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
            DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
         end
         else begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
            DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
         end;

         DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat   :=DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat   :=DMCXP.cdsDetCanje.FieldByName('CPTCAMAJ').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDatetime :=DMCXP.cdsQry1.FieldByName('CPFEMIS').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDatetime:=DMCXP.cdsQry1.FieldByName('CPFVCMTO').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('TMONID').AsString    :=DMCXP.cdsDetCanje.FieldByName('TMONID').AsString;
         xNReg:=xNReg+1;
         DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger   :=xNReg;
         DMCXP.cdsDetCxP.Post;
         dDebe:=FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat*DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat,15,2);
         dHabe:=FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat*DMCXP.cdsDetCanje.FieldByName('CPTCAMAJ').AsFloat,15,2);

         if DMCXP.cdsQry1.FieldByName('TMONID').AsString=DMCXP.wTMonExt then
         begin
            GeneraDiferenciaCambio(xNoReg);;

         end;

         DMCXP.cdsDetCanje.Next;
      end;

      // INSERTA EL REGISTRO DE LA NOTA DE CREDITO EN EL DEBE
      DMCXP.cdsDetCanje.First;
      DMCXP.cdsDetCxP.Insert;
      LlenaDetCxP1(xNoReg);
      //BuscaQry('dspTGE','CXC208','CIAID,CPTOCAB,CPTODES,CPTOABR,CUENTAID,TREGID,TIPDET,CCDH','CIAID='+QuotedStr(dblcCia.text)+' AND CPTOCAB='+QuotedStr(DMCXP.cdsMovCxC.FieldByName('CCPTOTOT').AsString),'CPTOCAB');

      DMCXP.cdsDetCxP.Edit;
      //DMCXP.cdsDetCxC.FieldByName('TREGID').AsString:=DMCXP.cdsQry.FieldByName('TREGID').AsString;
      //DMCXP.cdsDetCxC.FieldByName('TIPDET').AsString:=DMCXP.cdsQry.FieldByName('TIPDET').AsString;

      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString     :='H';
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString     :=DMCXP.cdsMovCxP2.FieldByName('DOCID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString   :=edtSerie.text;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString   :=edtNoDoc.text;
      DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString    :=DMCXP.cdsMovCxP2.FieldByName('CPTOTOT').AsString;
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString  :=DMCXP.cdsMovCxP2.FieldByName('CTATOTAL').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString  :=BuscaQry('dspTGE','CXP201','CPTODES','CPTOID='+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPTOTOT').AsString),'CPTODES');
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat   :=DMCXP.cdsMovCxP2.FieldByName('CPTCAMAJ').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat   :=DMCXP.cdsMovCxP2.FieldByName('CPTCAMAJ').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDatetime :=DMCXP.cdsMovCxP2.FieldByName('CPFEMIS').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDatetime:=DMCXP.cdsMovCxP2.FieldByName('CPFVCMTO').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('TMONID').AsString    :=DMCXP.cdsDetCanje.FieldByName('TMONID').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat   :=DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat   :=DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat;

      if DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
      begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat;
      end
      else begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat;
      end;
      xNReg:=xNReg+1;
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger   :=xNReg;
      DMCXP.cdsDetCxP.Post;
   end;
   DMCXP.cdsDetCanje.EnableControls;

   dDebe:=FRound(OperClientDataSet(DMCXP.cdsDetCxP,'SUM(DCPMOLOC)','DCPDH=''D'''),15,2);
   dHabe:=FRound(OperClientDataSet(DMCXP.cdsDetCxP,'SUM(DCPMOLOC)','DCPDH=''H'''),15,2);
   if dDebe>dHabe then
   begin
      //HABER GANANCIA
      //GeneraDiferenciaCambio('D1');
   end
   else
   begin
      if dDebe<dHabe then
      begin
         // DEBE PERDIDA
        // GeneraDiferenciaCambio('D2');
      end;
   end;
// Inicia HPC_201401_CXP
   //DMCXP.AplicaDatos(DMCXP.cdsDetCxP, 'DetCxP');

// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   DMCXP.cdsDetCxP.First;
   try
          xSQL := 'CALL SP_CNT_DEL_NOT_CRE_DET('
          +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CIAID').AsString)+','
          +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString)+','
          +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString)+','
          +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString)
          +')' ;
          DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);

   Except
          showmessage('Error al intentar eliminar el detalle de la nota de crédito');
          exit;
   Raise;
   End;

   while not DMCXP.cdsDetCxP.Eof do begin
      try
          xSQL := 'CALL SP_CNT_ING_NOT_CRE_DET('
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CIAID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPCOMP').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DOCID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CCOSID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPFLCDR').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPFLAUT').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TREGID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TMONID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('FLAGVAR').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CANJE').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('PARPRESID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPPRORORI').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPPRORMOLOC').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CPPRORMOEXT').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('TIPPRESID').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('DCPREG').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('CXPRRHH').AsString)+','
            +QuotedStr(DMCXP.cdsDetCxP.FieldByName('PROVRUC').AsString)
            +')' ;
            DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);
      Except
          showmessage('Error al intentar grabar el detalle de la nota de crédito');
          exit;
      Raise;
      End;
      DMCXP.cdsDetCxP.Next;
   end;



   {if DMCXP.cdsDetCxP.ApplyUpdates(0)>0 then
   begin
      ShowMessage('No se puede actualizar');
      exit;
   end;}
// Fin HPC_201707_CXP
// Finaliza HPC_201401_CXP
end;

procedure TFNotasDC.LlenaDetCxP1(xxNReg:string);
begin
  DMCXP.cdsDetCxP.Edit;
  DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := dblcCia.Text;
  DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := wTDiar;
  DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := xxNReg;
  DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString   := copy(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString,1,4);
  DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString;
  DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
  DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := dblcdProv.Text;
  DMCXP.cdsDetCxP.FieldByName('PROVRUC').AsString  := dblcdProvRuc.Text;
  DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
  DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString;
  DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString;
  DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsDetCanje.FieldByName('CPTCAMAJ').AsFloat;
  DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat  := DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat;
  DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDatetime:= DMCXP.cdsQry1.FieldByName('CPFEMIS').AsDateTime;
  DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDatetime:= dtpFComp.Date;
  DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'P'; // Pendiente
  DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString   := DMCXP.wUsuario;
  DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime := Date;
  DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime := Time;
  DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString     := DMCXP.cdsMovCxP.FieldByName('CPMM').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString     := DMCXP.cdsMovCxP.FieldByName('CPDD').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString    := DMCXP.cdsMovCxP.FieldByName('CPTRI').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString    := DMCXP.cdsMovCxP.FieldByName('CPSEM').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString     := DMCXP.cdsMovCxP.FieldByName('CPSS').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString  := DMCXP.cdsMovCxP.FieldByName('CPAATRI').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString  := DMCXP.cdsMovCxP.FieldByName('CPAASEM').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString   := DMCXP.cdsMovCxP.FieldByName('CPAASS').AsString;
  DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := dblcTMon.Text;
  DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := 'NC';
  DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString;
end;


procedure TFNotasDC.GeneraDiferenciaCambio(xxNReg:string);
var
   xDebe, xHabe, xDifCam, xDifCLoc : Double;
   xCtaDif, xGloDif, xDH : String;
begin
   xDebe:=FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat*DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat,15,2);
   xHabe:=FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat*DMCXP.cdsDetCanje.FieldByName('CPTCAMAJ').AsFloat,15,2);

   if xDebe < xHabe then begin
      xDifCam  := FRound( xHabe-xDebe,15,2);
      xDifCLoc := FRound( xHabe-xDebe,15,2);

      xCtaDif  := DMCXP.wDifAjuP;
      xCtaDif  := DMCXP.displaydescrip2('dspTGE','TGE202','CUENTAID','CIAID='''+dblcCia.Text+''' AND CTA_DIFGP=''P''','CUENTAID');
      xGloDif  := 'Perdida - Ajuste por Diferencia de Cambio';
      xDH      := 'D'
   end
   else begin
      xDifCam  := FRound( xDebe-xHabe,15,2);
      xDifCLoc := FRound( xDebe-xHabe,15,2);
      xCtaDif  := DMCXP.wDifAjuG;
      xCtaDif  := DMCXP.displaydescrip2('dspTGE','TGE202','CUENTAID','CIAID='''+dblcCia.Text+''' AND CTA_DIFGP=''G''','CUENTAID');
      xGloDif  := 'Ganancia - Ajuste por Diferencia de Cambio';
      xDH      := 'H'
   end;

   If xDifCam > 0 Then begin
      DMCXP.cdsDetCxP.Insert;
      DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := dblcCia.Text;
      DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := wTDiar;
      DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := 'NC';
      DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := xxNReg;
      DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := copy(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString,1,4);
      DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString;
      DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := dblcdProv.Text;
      DMCXP.cdsDetCxP.FieldByName('PROVRUC').AsString  := dblcdProvRuc.Text;
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsDetCanje.FieldByName('CPTCAMAJ').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat  := DMCXP.cdsDetCanje.FieldByName('CPTCAMAJ').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDatetime:= DMCXP.cdsQry1.FieldByName('CPFEMIS').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDatetime:= dtpFComp.Date;
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'P'; // Pendiente
      DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
      DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime:= Date;
      DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime:= Time;
      DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString    := DMCXP.cdsMovCxP.FieldByName('CPMM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString    := DMCXP.cdsMovCxP.FieldByName('CPDD').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString   := DMCXP.cdsMovCxP.FieldByName('CPTRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString   := DMCXP.cdsMovCxP.FieldByName('CPSEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString    := DMCXP.cdsMovCxP.FieldByName('CPSS').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString := DMCXP.cdsMovCxP.FieldByName('CPAATRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString := DMCXP.cdsMovCxP.FieldByName('CPAASEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString  := DMCXP.cdsMovCxP.FieldByName('CPAASS').AsString;
      DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := dblcTMon.Text;

      //DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := xLote;
      DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xCtaDif;
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGloDif;
      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := xDH;
      //
      if DMCXP.cdsCanje.FieldByName('TMONID').AsString=DMCXP.wTMonExt then begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := FRound(xDifCam,15,2);
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(xDifCam,15,2);
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := 0;
         end
      else begin
         DMCXP.cdsDetCxP.FieldByName('DCPMoOri').AsFloat := FRound(xDifCam,15,2);
         DMCXP.cdsDetCxP.FieldByName('DCPMoLoc').AsFloat := 0;
         DMCXP.cdsDetCxP.FieldByName('DCPMoExt').AsFloat := FRound(xDifCam,15,2);
      end;

      xNReg:=xNReg+1;
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger   :=xNReg;
   end;
end;


procedure TFNotasDC.Z2bbtnPAplicaClick(Sender: TObject);
var
   xSQL, xTDiario, xNoComp  : String;
   xDia, xMes, xAno : word;
   mes, ano, xwhere, MONABR : string;
   mesdes : String;
   TSimbolo,TMoneda : String;
   xTotHaber:DOUBLE;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   a,m,d:word;
   xxTAno,xxTMes:string;
// Fin HPC_201707_CXP   
begin
   if DMCXP.wAdmin='G' then Exit;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   DecodeDate(Date,a,m,d);
   //DecodeDate(dbdtpFEmis.Date,a,m,d);
   xxTAno:=StrZero(IntToStr(a),4);
   xxTMes:=StrZero(IntToStr(m),2);
// Fin HPC_201707_CXP
   xSQL:='Select * from CXP308 '
        +'Where CIAID='''   +dblcCia.text+''' '
        +  'and TCANJEID='''+DMCXP.cdsMovCxP2.FieldByName('TCANJEID').AsString+''' '
        +  'and CANJE='''   +DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString +''' ';
   DMCXP.cdsQry11.Close;
   DMCXP.cdsQry11.DataRequest( xSQL );
   DMCXP.cdsQry11.Open;

   xTDiario:=DMCXP.cdsQry11.FieldByname('TDIARID').AsString;
   xNoComp :=DMCXP.cdsQry11.FieldByname('CCCMPRB').AsString;

   if DMCXP.cdsQry11.fieldbyname('CJ_CONTA').AsString <> 'S' then
   begin
      if not AsientoCuadra then
         raise exception.Create('Error:  Asiento No Cuadra');

      xSQL:='Select * FROM CXP302 '
           +'Where CIAID='   +quotedstr( dblcCia.text ) +' and '
           +      'TDIARID=' +quotedstr( xTDiario )     +' and '
           +      'DCPANOMM='+quotedstr( xAnomes  )     +' and '
           +      'CPNOREG=' +quotedstr( xNoComp  );
      Try
         DMCXP.cdsQry10.Close;
         DMCXP.cdsQry10.DataRequest( xSql );
         DMCXP.cdsQry10.Open;
      except
         Exit;
      end;

      if DMCXP.cdsQry10.RecordCount<=0 then begin
         ShowMessage('Nota de Credito No ha sido Aplicada');
         Exit;
      end;

      xSQL:='Delete FROM CNT311 '
           +'Where CIAID='     +quotedstr( dblcCia.text ) +' and '
           +      'CNTANOMM='  +quotedstr( xAnomes  )     +' and '
           +      'TDIARID='   +quotedstr( xTDiario )     +' and '
           +      'CNTCOMPROB='+quotedstr( xNoComp  );
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
      except
      end;

      xSQL:='Delete FROM CNT310 '
           +'Where CIAID='     +quotedstr( dblcCia.text ) +' and '
           +      'CNTANOMM='  +quotedstr( xAnomes  )     +' and '
           +      'TDIARID='   +quotedstr( xTDiario )     +' and '
           +      'CNTCOMPROB='+quotedstr( xNoComp  );
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
      except
      end;

// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      DMCXP.GeneraContab_NC( dblcCia.Text, xTDiario, (xxTAno+xxTMes), DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString,
                             xNoComp, Self, 'P' );
      //DMCXP.GeneraContab( dblcCia.Text, xTDiario, xAnomes, xNoComp, Self, 'P' );
// Fin HPC_201707_CXP

      DMCXP.cdsCXP.Data:=DMCXP.cdsMovCnt.data;

      decodedate(dtpFComp.Date,xAno,xMes,xDia);
      mes:= strzero(inttostr(xMes),2);
      ano:= inttostr(xAno);
      xWhere := 'MESIDR='''+mes+'''';
      mesdes := DMCXP.DisplayDescrip2('dspTGE','TGE181','MESDESL',XWHERE,'MESDESL');
   end;

   if DMCXP.cdsQry11.fieldbyname('CJ_CONTA').AsString = 'S' then
   begin
      xSql:='SELECT * FROM CNT301 '
           +'WHERE CIAID=' + quotedstr( dblcCia.text) +' AND '
           +  'CNTANOMM='  + quotedstr( xAnomes  )    +' AND '
           +  'TDIARID='   + quotedstr( xTDiario )    +' AND '
           +  'CNTCOMPROB='+ quotedstr( xNoComp  )    +' '
           +'Order by CNT301.CNTREG';
      DMCXP.cdsCxP.Close;
      DMCXP.cdsCxP.DataRequest(xSQL);
      DMCXP.cdsCxP.Open;

      ppdbpPreview.DataSource := DMCXP.dsCxP;

      mes:=copy(DMCXP.cdsCxP.fieldbyname('CNTANOMM').asstring,5,2);
      ano:=copy(DMCXP.cdsCxP.fieldbyname('CNTANOMM').asstring,1,4);

      xWhere:= 'MESIDR='''+mes+'''';
      mesdes:= DMCXP.DisplayDescrip2( 'dspTGE', 'TGE181', 'MESDESL', xWHERE, 'MESDESL' );
   end;

   DMCXP.cdsQry11.Close;

   ppdbpPreview.DataSource     := DMCXP.dsCxP;
   pprPreview.TEMPLATE.FileName:= ExtractFilePath( application.ExeName ) + wRutaRpt+'\CxPVoucher.rtm' ;
   pprPreview.template.LoadFromFile ;

   TMoneda:= DMCXP.DisplayDescrip2('dspTGE','TGE103','TMON_LOC','TMONID='+quotedstr(dblcTMon.text),'TMON_LOC');
   MONABR := DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONABR', 'TMONID='+quotedstr(dblcTMon.text),'TMONABR' );

   pplblMonedaDoc.Caption := MONABR;
   pplblCiades.Caption    := edtCia.text ;
   pplblCodProv.Caption   := dblcdProv.Text;
   pplblDiarioDes.Caption := DMCXP.DisplayDescrip2('dspTGE','TGE104','TDIARDES','TDIARID='+quotedstr(xTDiario),'TDIARDES');
   pplblTDiario.Caption   := xTDiario;
   pplblProveedor.Caption := edtProv.text;
   pplblGlosaDes.caption  := DMCXP.cdsCxP.fieldbyname('CNTGLOSA').asstring;
   pplblTipoCamb.Caption  := FloatToStrF(StrToFloat(dbeTCambio.text),ffNumber,10,3);
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   pplblAnoMes.Caption    := (xxTAno+xxTMes);
// Fin HPC_201707_CXP
   pplblNoCompro.Caption  := xNoComp;
   pplblMonedaDes.caption := DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONDES','TMONID='+quotedstr(dblcTMon.text),'TMONDES');
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   pplblFecEmision.Caption := DMCXP.cdsDetCanje.Fieldbyname('CCPFCJE').AsString;
// Fin HPC_201707_CXP

   xTotHaber:= 0;
   DMCXP.cdsDetCxP.First ;
   while not DMCXP.cdsDetCxP.Eof do
   begin
      if DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'H' then
         xTotHaber:= xTotHaber+FRound(DMCXP.cdsDetCxP.Fieldbyname('DCPMOORI').AsFloat,15,2);
      DMCXP.cdsDetCxP.Next;
   end;
   DMCXP.cdsDetCxP.First;
   pplblMontoImporte.Caption:=MONABR+' '+FloatToStrF(xTotHaber,ffNumber,15,2);

   if TMoneda = 'L' then
   begin
      pplblMonedaDoc.Visible := false;
      ppdbMtoExt.Visible:= false;
      pplblCntTCambio.Visible:= false;
      ppdbCntTCambio.Visible:= false;
   end;

   if DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString='S' then
      pplblDesEstado.caption:='Contabilizado'
   else
      pplblDesEstado.caption:='Previo';

   pprPreview.Print;
   pprPreview.Stop;
   ppdbpPreview.DataSource:=nil ;
end;

procedure TFNotasDC.FormShow(Sender: TObject);
var				   
// Inicio HPC_201802_CXP
// Ajustes para registrar Nota de Crédito No Domiciliados
   xsql, xxCia, xxProv, xxDoc, xWhere, xTDiar2, xSQL1 : String;
// Fin HPC_201802_CXP
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );

   xTipoProv :='N';

   xCrea := True;

   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );

//   FVariables.CreaBotones( FNotasDC, True, True, True, True, True, True, True, True, False, False, False );

   // Reglas de Negocio
   if DMCXP.wVRN_TCambioFijo='N' then
      dbeTCambio.Enabled:=True
   else begin
      dbeTCambio.Enabled:=False;
   end;

  if DMCXP.wVRN_ProvAutoDD='S' then
     dblcdProv.AutoDropDown:=true
  else begin
     dblcdProv.AutoDropDown:=false;
  end;

  Filtracds( DMCXP.cdsTipReg2,'SELECT * FROM TGE113 WHERE SUBSTR(TIPDET,1,1)=''I''' );

  xGlosaRep:='';

// Inicio HPC_201802_CXP	
// Ajustes para registrar Nota de Crédito No Domiciliados
(*
   ///////////  Busca TDocId y TDiarId - Inicio
   DMCXP.cdsTDoc.Filter:='';
   DMCXP.cdsTDoc.Filter:='DOC_FREG='+''''+xTipoProv+''''+' and '
                      +'DOCMOD=  '+''''+'CXP'+'''';
   DMCXP.cdsTDoc.Filtered:=True;

   if DMCXP.cdsTDoc.RecordCount>0 then
   begin

      //edtTDoc.Text:=BuscaQry('PrvTGE','TGE110','*',xWhere,'DocDes');
      xTDiar2 := DMCXP.cdsTDoc.fieldbyname('TDIARID2').AsString;
      // Asigna Tipo de Diario a lookup combo TDiario
      dblcTDiario.Text:=DMCXP.cdsTDoc.fieldbyname('TDiarID').Asstring;

      // Busca descripción TDiario y asigna a edit TDiario
      edtTDiario.Text  := DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);

      // Filtra Tipo de Diario específico
      xFiltroTDiar:='TDiarID='+''''+DMCXP.cdsTDoc.fieldbyname('TDIARID').Asstring+'''';
      if length(xTDiar2)>0 then begin
         xFiltroTDiar:=xFiltroTDiar+' or TDiarID='+''''+xTDiar2+'''';
      end;
      DMCXP.cdsTDiario.Filter  :='';
      DMCXP.cdsTDiario.Filter  :=xFiltroTDiar;
      DMCXP.cdsTDiario.Filtered:=true;
      if DMCXP.cdsTDiario.Recordcount=0 then begin
         //dblcTDoc.SetFocus;
         Raise Exception.Create('Documento No Tiene Tipo De Diario asignado');
      end;
      if DMCXP.cdsTDiario.Recordcount=1 then
         dblcTDiario.Enabled:=false
      else begin
         dblcTDiario.Enabled:=true;
      end;

      if DMCXP.cdsTDoc.RecordCount>1 then
      begin
         ShowMessage('Ojo: Existe más de un registro tipo N - N/Crédito');
         // Pide eleccion de FReg 'N' que existan en TDoc (TGE110)
      end;
      wTDoc := DMCXP.cdsTDoc.fieldbyname('DOCID').AsString;
      if (DMCXP.cdsTDoc.fieldbyname('TDIARID').AsString<>'') and (DMCXP.cdsTDoc.fieldbyname('TDIARID2').AsString<>'') then
      begin
         //ShowMessage('Ojo: Esta N/Crédito tiene más de un T/Diario');
         // Pide eleccion de TDiarID
      end;
      wTDiar    := DMCXP.cdsTDoc.fieldbyname('TDIARID').AsString;  // Default(x ahora)
      xTAutoNum := DMCXP.DisplayDescrip('TGE104','AutoNum','TDiarID',dblcTDiario.Text);
   end
   else begin
      ShowMessage('Tipos de Documento no registra definición de N/Crédito');
      // Forma de Registro (N) no definido en tabla TDocum(TGE110)     ¿?
      // Salir de N/Credito
   end;
   ///////////  Busca TDocId y TDiarId - Fin... Resultado: wTDoc y wTDiar
*)
// Fin HPC_201802_CXP

   InicializaVars;

   If DMCXP.wAdmin='G' then
   begin
      DMCXP.wModo:='C';
   end;
// Inicio HPC_201802_CXP  
// Ajustes para registrar Nota de Crédito No Domiciliados
//   DMCXP.cdsTDoc.Filtered:=False;
// Fin HPC_201802_CXP

   if DMCXP.wModo='A' then
   begin
      DMCXP.cdsMovCxP2.Insert;
      DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString := wTDoc;
      edtCia.Text   := '';
      edtProv.text  := '';
      edtSerie.Text := '';
      edtNoDoc.Text := '';	
// Inicio HPC_201802_CXP 
// Ajustes para registrar Nota de Crédito No Domiciliados
      dblcTDoc.Text := '';
// Fin HPC_201802_CXP
      rgDoc.Enabled := True;
      rgDoc.itemindex := -1;

      InicializaCds;   // Inicializa en Blanco (Filtra) Client Data Sets--> CiaId=''

      tnbkDetalle.PageIndex:= 0;

      // Reglas de Negocio
      if DMCXP.wVRN_PagosParciales='S' then
       begin
         DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := False;
         DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := True;
         DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := False;
         DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := False;
       end
      else
       begin
         DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := True;
         DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := True;
         DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := True;
         DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := True;
       end;

      EstadoDeForma( 0, ' ', ' ' );

   end
   else
   begin
// Inicio HPC_201802_CXP 
// Ajustes para registrar Nota de Crédito No Domiciliados
      // Filtra Tipo de Diario específico
      wTDoc := DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString;
      xWhere := 'DOCID='+quotedstr(wTDoc)+' and '
           + 'DOC_FREG=''' + xTipoProv + ''' and DOCMOD=''CXP''';
      edtTDoc.Text := BuscaQry('PrvTGE', 'TGE110', '*', xWhere, 'DocDes');

      xFiltroTDiar:='TDiarID='+''''+DMCXP.cdsTDoc.fieldbyname('TDIARID').Asstring+'''';
      if length(xTDiar2)>0 then begin
         xFiltroTDiar:=xFiltroTDiar+' or TDiarID='+''''+xTDiar2+'''';
      end;
      DMCXP.cdsTDiario.Filter  :='';
      DMCXP.cdsTDiario.Filter  :=xFiltroTDiar;
      DMCXP.cdsTDiario.Filtered:=true;
      if DMCXP.cdsTDiario.Recordcount=0 then begin
         //dblcTDoc.SetFocus;
         Raise Exception.Create('Documento No Tiene Tipo De Diario asignado');
      end;
      if DMCXP.cdsTDiario.Recordcount=1 then
         dblcTDiario.Enabled:=false
      else begin
         dblcTDiario.Enabled:=true;
      end;

      xWhere:='SELECT CLAUXID, PROV, PROVRUC, PROVDES, PROVABR, PROVNOMCOM,PROVRETIGV,PAISID,PROVDIR,PROVCZIP,PROVTELF,PROVFAX,PROVEMAI, ESDOMIC '
         +'FROM TGE201 WHERE CLAUXID='+quotedstr(dblcClAux.Text)+' and PROV ='+quotedstr(DMCXP.cdsMovCxP2.fieldbyname('PROV').AsString)+' and NVL(ACTIVO,''N'')=''S''';
// Fin HPC_201802_CXP
      Filtracds( DMCXP.cdsProv, xWhere );

      xxCia        := DMCXP.cdsMovCxP2.fieldbyname('CIAID').AsString;
      xxProv       := DMCXP.cdsMovCxP2.fieldbyname('PROV').AsString;
      xxDoc        := DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString;
      edtSerie.Text:= DMCXP.cdsMovCxP2.fieldbyname('CPSERIE').AsString;
      edtNoDoc.text:= DMCXP.cdsMovCxP2.fieldbyname('CPNODOC').AsString;
      wCje         := DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString;
      //** 06/09/2001 - pjsv, se utiliza en la llamada al prorrateo
      xNRegistro   := DMCXP.cdsMovCxP2.fieldbyname('CPNOREG').AsString;
      xAnomes      := DMCXP.cdsMovCxP2.fieldbyname('CPANOMES').AsString;
      // Diario
      dblcTDiario.Text:= DMCXP.cdsMovCxP2.fieldbyname('TDIARID').AsString;
      xWhere := '('+xFiltroTDiar+') and TDiarId='+''''+dblcTDiario.Text+'''';
      edtTDiario.Text:=BuscaQry('PrvTGE','TGE104','*',xWhere,'TDiarDes');
      //**
      edtCia.Text  := DMCXP.DisplayDescrip('TGE101','CIADES','CIAID', xxCia  );
      edtProv.text := DMCXP.DisplayDescrip('TGE201','PROVDES','PROV', xxProv );
      //** 25/07/2001 - pjsv
      if DMCXP.cdsMovCxP2.fieldbyname('CPFLAGTDOC').AsString <> '' then
         rgDoc.ItemIndex := StrToInt(DMCXP.cdsMovCxP2.fieldbyname('CPFLAGTDOC').AsString);
      rgDoc.Enabled := False;
      //**
      xWhere       := 'TMonId='+''''+dblcTMon.Text+''''+' and (TMon_Loc='+''''+'L'+''''+' or TMon_Loc='+''''+'E'+''''+')';
      edtTMon.Text := BuscaQry('PrvTGE','TGE103','TMONDES',xWhere,'TMONDES');
// Inicio HPC_201802_CXP
// Ajustes para registrar Nota de Crédito No Domiciliados
      IF DMCXP.cdsProv.FieldByName('ESDOMIC').AsString = 'N' THEN
      BEGIN
          xSQL1 := ' Select docid, docmod, docdes, docabr, doc_freg, tdiarid, tdiarid2, doctipreg, docresta, coadocid, fcing, docconta, docidorig, f_emidoc, docprov, docreccaj, '
               + ' docplazo, refalm, urqalm, docretigv, graciavcto, doclength, docaf, dtrafecto, tdoc_sunat, afec_regpension, afec_rend_cxp, tdiarid_rend, retencion, flag_mostrar_doc, '
               + ' detraccion1, rq_longser_fija, longserie_fija, rq_longnum_fija, longnumdoc_fija, flag_valida_rend '
               + '  from TGE110 '
               + ' where DOC_FREG = '+quotedstr(xTipoProv)+' and DOCID =''97'' AND '
               + ' DOCMOD=  ''CXP'' '
               + ' Order by DOCID ';
      END
      ELSE
      BEGIN
          xSQL1 := ' Select docid, docmod, docdes, docabr, doc_freg, tdiarid, tdiarid2, doctipreg, docresta, coadocid, fcing, docconta, docidorig, f_emidoc, docprov, docreccaj, '
               + ' docplazo, refalm, urqalm, docretigv, graciavcto, doclength, docaf, dtrafecto, tdoc_sunat, afec_regpension, afec_rend_cxp, tdiarid_rend, retencion, flag_mostrar_doc, '
               + ' detraccion1, rq_longser_fija, longserie_fija, rq_longnum_fija, longnumdoc_fija, flag_valida_rend '
               + '  from TGE110 '
               + ' where DOC_FREG = '+quotedstr(xTipoProv)+' and DOCID =''07'' and '
               + ' DOCMOD=  ''CXP'' '
               + ' Order by DOCID ';
      END;
      DMCXP.cdsTDoc.Close;
      DMCXP.cdsTDoc.DataRequest(xSQL1);
      DMCXP.cdsTDoc.open;
      DMCXP.cdsTDoc.Filter := '';
      DMCXP.cdsTDoc.Filtered := False;
      DMCXP.cdsTDoc.IndexFieldNames := 'DOCID';

// Fin HPC_201802_CXP
    if DMCXP.wVRN_CCosCia='N' then
    	 xSQL:='SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 '
					+'Where CCOSMOV='+quotedstr('S')
          // vhndema 20050107
          + ' and CCOSACT=''S'''
    else
     	 xSQL:='SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 '
					+'Where CCOSMOV='+quotedstr('S')
          +' and CCOSCIAS LIKE ('+quotedstr('%'+dblcCia.Text+'%')+' ) '
          + ' and CCOSACT=''S''';
          // END VHNDEMA

      DMCXP.cdsCCosto.Close;
      DMCXP.cdsCCosto.DataRequest(xSQL);
      DMCXP.cdsCCosto.open;
      DMCXP.cdsCCosto.Filter:='';
      DMCXP.cdsCCosto.Filtered:=False;
      DMCXP.cdsCCosto.IndexFieldNames :='CCOSID';

      if DMCXP.wVRN_CptoCia='N' then
      	 xSQL:='select * from CXP201 '
      else
      xSQL:='select A.CPTOID, A.CPTODES, A.CUENTAID, NIVELMOV, DTRPORC, CCOSPORCEN From CXP201 A '
           +'WHERE EXISTS ( SELECT CUENTAID FROM TGE202 B '
           +               'WHERE A.CUENTAID=B.CUENTAID AND B.CTAACT=''S'' '
           +                 'AND B.CIAID='''+dblcCia.Text+''') '
           +'ORDER BY A.CPTOID';
    	DMCXP.cdsCnpEgr.Close;
	    DMCXP.cdsCnpEgr.DataRequest( xSQL );
	    DMCXP.cdsCnpEgr.Open;

      FiltraGrids;

      tnbkDetalle.PageIndex:= 0;

      // Reglas de Negocio
      if DMCXP.wVRN_PagosParciales='S' then
       begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
         DMCXP.cdsDetCanje.FieldByName('DOCID').ReadOnly := True;
         DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := True;
         DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := True;
         DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := true;
         DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := true;
// Fin HPC_201707_CXP
       end
      else
       begin
         DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := True;
         DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := True;
         DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := True;
         DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := True;
       end;

      if DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString='I' then
         EstadoDeForma(0,DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString,' ' )
      else
         EstadoDeForma(1,DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString,DMCXP.cdsMovCxP2.fieldbyname('CP_CONTA').AsString );

   end;

   xCrea := False;
end;


function TFNotasDC.FiltraDocGrid : Boolean;
var
	xFiltro, xSelDoc : String;
begin
	DMCXP.cdsTDoc.Filter:='';
	// JORGE
	//    	 xTipoProv  := 'P';  // para Provisiones (facturas, n/Débito)
	//       xTipoProv  := 'N';  // para Notas de Crédito
	//       xTipoProv  := 'L';  // para Letras
	//	 xTipoProv  := 'T';  // para préstamos de terceros
	//  	 xTipoProv  := 'I';  // pera Intermediación
	//  	 xTipoProv  := 'F';  // Facturas del Exterior
	//  	 xTipoProv  := '4C'; // Cuarta Categoria

	xFiltro := '(DOC_FREG='+QuotedStr( xTipoProv)+' and DOCMOD='+QuotedStr('CXP')+')';

	if xTipoProv='P' then
		xFiltro := '( ( DOC_FREG=''P'' OR DOC_FREG=''F'' ) and DOCMOD='+QuotedStr('CXP')+')';

	if xTipoProv='N' then
		xFiltro := xFiltro + ' or (DOCTIPREG='+QuotedStr('NC')+' and DOCMOD='+QuotedStr('CXP')+')' ;

	if xTipoProv='L' then
		xFiltro := xFiltro + ' or (DOCTIPREG='+QuotedStr('LT')+' and DOCMOD='+QuotedStr('CXP')+')' ;

	if xTipoProv='4C' then
	   xFiltro := xFiltro + ' or (DOCTIPREG='+QuotedStr('4C')+' and DOCMOD='+QuotedStr('CXP')+')' ;

	DMCXP.cdsTDoc.Filter:= xFiltro;
	DMCXP.cdsTDoc.Filtered:=True;
	xSelDoc := '';
	while not DMCXP.cdsTDoc.Eof do
	begin
		if Length(xSelDoc)=0 then
			xSelDoc := 'CXP301.DOCID='+''''+DMCXP.cdsTDoc.FieldByName('DOCID').AsString+''''
		else
			xSelDoc := xSelDoc+ ' or CXP301.DOCID='+''''+DMCXP.cdsTDoc.FieldByName('DOCID').AsString+'''';
		DMCXP.cdsTDoc.Next;
	end;
	if Length( xSelDoc )=0 then
		Raise Exception.Create('No Existen Tipos de Documentos Registrados para Esta Opcion');

	Result := True;
end;
//Inicio SAR666
procedure TFNotasDC.CopiaRegistro(xCds_fuente, xCds_destino :TwwClientDataSet);
var
x :Integer;
begin
   xCds_destino.Append;
   for x:=0 to DMCXP.cdsDetCxP.FieldCount -1 do
   begin
      xCds_destino.FieldByName(xCds_fuente.Fields[x].DisplayName).Value
                      :=xCds_fuente.Fields[x].Value;
   end;
end;

procedure TFNotasDC.ImpuestoReg06 (xTipoRegistro, xTipoDetalle :String; xTasa, xIGV09 :double);
var

   xIGVParcial : double;
begin
   xIGVParcial := 0;
   DMCXP.cdsDetCxP2.First;

   while not DMCXP.cdsDetCxP2.Eof do
   begin

      numreg := numreg + 1 ;

      CopiaRegistro( DMCXP.cdsDetCxP2, DMCXP.cdsDetCxP);

      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString   := DMCXP.cdsDetCxP2.FieldByName('DCPDH').AsString;
      DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat := FRound((DMCXP.cdsDetCxP2.FieldByname('DCPMOORI').AsFloat)*xTasa,15,2);
      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound((DMCXP.cdsDetCxP2.FieldByName('DCPMOLOC').AsFloat)*xTasa,15,2);
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound((DMCXP.cdsDetCxP2.FieldByName('DCPMOEXT').AsFloat)*xTasa,15,2);
      DMCXP.cdsDetCxP.FieldByname('TREGID').AsString  := xTipoRegistro;
      DMCXP.cdsDetCxP.FieldByname('TIPDET').AsString  := xTipoDetalle;
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  := numreg;
      xIGVParcial := xIGVParcial+DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat;
      DMCXP.cdsDetCxP2.Next;
   end;
   if xIGV09<>xIGVParcial then
   begin
      xIGVParcial := xIGV09-xIGVParcial;
      //DMCXP.cdsDetCxP2.Prior;
      DMCXP.cdsDetCxP2.Edit;
      DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat := DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat+xIGVParcial;
      if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat+xIGVParcial
      else
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat+xIGVParcial;

   end;
end;
//Fin SAR666
procedure TFNotasDC.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;
//INICIO SAR666
Procedure TFNotasDC.RecalculaTotales;
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
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MG' Then
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

// Inicio HPC_201805_CXP
// Se comenta el tipdet I4 de Detracción
      If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'TO')  then //Or
//         (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I4') Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpmtoori := xcpmtoori + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpmtoori := xcpmtoori - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;
// Fin HPC_201805_CXP

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
   DMCXP.cdsMovCxP2.Edit;
   DMCXP.cdsMovCxP2.fieldbyname('CPGRAVAD').AsFloat := xCPGRAVAD;
   DMCXP.cdsMovCxP2.fieldbyname('CPGRAVAD2').AsFloat := xcpgravad2;
   DMCXP.cdsMovCxP2.fieldbyname('CPIGV').AsFloat := xcpigv;
   DMCXP.cdsMovCxP2.fieldbyname('CPIGV2').AsFloat := xcpigv2;
   DMCXP.cdsMovCxP2.fieldbyname('CPDCTO').AsFloat := xcpdcto;
   DMCXP.cdsMovCxP2.fieldbyname('CPNOGRAV').AsFloat := xcpnograv;
   DMCXP.cdsMovCxP2.fieldbyname('CP_OTROS').AsFloat := xcp_otros;
   DMCXP.cdsMovCxP2.fieldbyname('ADQ_NO_GRAV').AsFloat := xadq_no_grav;
   DMCXP.cdsMovCxP2.fieldbyname('IGV_GRA_NO_DEST').AsFloat := xigv_gra_no_dest;
   DMCXP.cdsMovCxP2.fieldbyname('CPISC').AsFloat := xCPISC;
   DMCXP.cdsMovCxP2.fieldbyname('CPSERVIC').AsFloat := xCPSERVIC;
   DMCXP.cdsMovCxP2.fieldbyname('CPHREG').AsDateTime := Date + Time; // Hora de Registro de Usuario

   //If (DMCXP.cdsMovCxP2.fieldbyname('CPPAGORI').AsFloat = 0) And
   //   (DMCXP.cdsMovCxP2.fieldbyname('CPSALORI').AsFloat = DMCXP.cdsMovCxP2.fieldbyname('CPMTOORI').AsFloat) Then
   Begin
      DMCXP.cdsMovCxP2.fieldbyname('CPMTOORI').AsFloat := xcpmtoori;
      DMCXP.cdsMovCxP2.fieldbyname('CPSALORI').AsFloat := xcpmtoori; // Saldo en moneda Local
      If DMCXP.cdsMovCxP2.fieldbyname('TMONID').AsString = DMCXP.wTMonLoc Then
      Begin
         DMCXP.cdsMovCxP2.fieldbyname('CPMTOLOC').AsFloat := xcpmtoori; // Total en moneda local
         DMCXP.cdsMovCxP2.fieldbyname('CPMTOEXT').AsFloat := FRound(xcpmtoori / FRound(DMCXP.cdsMovCxP2.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2); // Total en moneda extranjera
         DMCXP.cdsMovCxP2.fieldbyname('CPSALLOC').AsFloat := xcpmtoori; // Saldo en moneda Local
         DMCXP.cdsMovCxP2.fieldbyname('CPSALEXT').AsFloat := FRound(xcpmtoori / FRound(DMCXP.cdsMovCxP2.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2); // Saldo en moneda extranjera
      End
      Else
      Begin
         If DMCXP.cdsMovCxP2.fieldbyname('TMONID').AsString = DMCXP.wTMonExt Then
         Begin
            DMCXP.cdsMovCxP2.fieldbyname('CPMTOLOC').AsFloat := FRound(xcpmtoori * FRound(DMCXP.cdsMovCxP2.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2); // Total en moneda local
            DMCXP.cdsMovCxP2.fieldbyname('CPMTOEXT').AsFloat := xcpmtoori; // Total en moneda extranjera
            DMCXP.cdsMovCxP2.fieldbyname('CPSALLOC').AsFloat := FRound(xcpmtoori * FRound(DMCXP.cdsMovCxP2.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2); // Saldo en moneda Local
            DMCXP.cdsMovCxP2.fieldbyname('CPSALEXT').AsFloat := xcpmtoori; // Saldo en moneda extranjera
         End;
      End;
   End;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   try
      xSQL := 'CALL SP_CNT_UPD_NOT_CRE_CAB('
      +'''I'','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString)+',' 
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('PROVDES').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('DCPLOTE').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPTCAMPR').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPTCAMAJ').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPFRECEP').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPFEMIS').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPDCTO').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSERVIC').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPGRAVAD2').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPIGV2').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPNOGRAV').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPGRAVAD').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPIGV').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPISC').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSALORI').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsString)+','

      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPFVCMTO').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPTCAMPA').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('TCANJEID').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPFCANJE').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPAAAA').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPMM').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPDD').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPTRI').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSEM').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPSS').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPAATRI').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPAASEM').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPAASS').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CTATOTAL').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPTOTOT').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPFLAGTDOC').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('ADQ_NO_GRAV').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('IGV_GRA_NO_DEST').AsString)+','
      +QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CP_OTROS').AsString)

      +')' ;
      DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);
    Except
        showmessage('Error al intentar grabar la cabecera de la nota de crédito');
        exit;
    Raise;
    End;
// Inicia HPC_201401_CXP
   //DMCXP.AplicaDatos(DMCXP.cdsMovCxP2, 'MovCxP2');
   {if DMCXP.cdsMovCxP2.ApplyUpdates(0)>0 then
   begin
      ShowMessage('No se puede actualizar');
      exit;
   end;}
// Fin HPC_201707_CXP
// Finaliza HPC_201401_CXP

End;
//FIN SAR666
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
procedure TFNotasDC.dbdtpFEmisExit(Sender: TObject);
begin
    If dbdtpFEmis.Date > dtpFComp.Date then
    Begin
      dbdtpFEmis.SetFocus;
      raise exception.Create('F. Emisión no debe ser mayor a F. Registro');
    End;
end;
// Fin HPC_201707_CXP
// Inicio HPC_201802_CXP
// Ajustes para registrar Nota de Crédito No Domiciliados
procedure TFNotasDC.dblcTDocExit(Sender: TObject);
var
   xsql, xxCia, xxProv, xxDoc, xWhere, xTDiar2, esdomic : String;
Begin
   esdomic :='';
   xWhere := 'DOCID=''' + dblcTDoc.Text + ''' and '
           + 'DOC_FREG=''' + xTipoProv + ''' and DOCMOD=''CXP''';
   edtTDoc.Text := BuscaQry('PrvTGE', 'TGE110', '*', xWhere, 'DocDes');

   if length(edtTDoc.Text)>0 then
   begin
      xWhere:='CLAUXID='+quotedstr(dblcClAux.Text)+' and PROV ='+quotedstr(dblcdProv.Text)+' and NVL(ACTIVO,''N'')=''S''';
         esdomic := BuscaQry('PrvTGE', 'TGE201', '*', xWhere, 'ESDOMIC');
         //      Filtracds( DMCXP.cdsProv, xWhere );
      if (esdomic='S') and (dblcTDoc.Text='97') then
      begin
          ShowMessage('No se puede seleccionar el tipo de documento');
          dblcTDoc.setfocus;
          exit;
      end;
      if (esdomic='N') and (dblcTDoc.Text='07') then
      begin
          ShowMessage('No se puede seleccionar el tipo de documento');
          dblcTDoc.setfocus;
          exit;
      end;
      wTDoc := DMCXP.cdsTDoc.fieldbyname('DOCID').AsString;
      //edtTDoc.Text:=BuscaQry('PrvTGE','TGE110','*',xWhere,'DocDes');
      xTDiar2 := DMCXP.cdsTDoc.fieldbyname('TDIARID2').AsString;
      // Asigna Tipo de Diario a lookup combo TDiario
      dblcTDiario.Text:=DMCXP.cdsTDoc.fieldbyname('TDiarID').Asstring;

      // Busca descripción TDiario y asigna a edit TDiario
      edtTDiario.Text  := DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);

      // Filtra Tipo de Diario específico
      xFiltroTDiar:='TDiarID='+''''+DMCXP.cdsTDoc.fieldbyname('TDIARID').Asstring+'''';
      if length(xTDiar2)>0 then begin
         xFiltroTDiar:=xFiltroTDiar+' or TDiarID='+''''+xTDiar2+'''';
      end;
      DMCXP.cdsTDiario.Filter  :='';
      DMCXP.cdsTDiario.Filter  :=xFiltroTDiar;
      DMCXP.cdsTDiario.Filtered:=true;
      if DMCXP.cdsTDiario.Recordcount=0 then begin
         //dblcTDoc.SetFocus;
         Raise Exception.Create('Documento No Tiene Tipo De Diario asignado');
      end;
      if DMCXP.cdsTDiario.Recordcount=1 then
         dblcTDiario.Enabled:=false
      else begin
         dblcTDiario.Enabled:=true;
      end;
      wTDoc := DMCXP.cdsTDoc.fieldbyname('DOCID').AsString;
      if (DMCXP.cdsTDoc.fieldbyname('TDIARID').AsString<>'') and (DMCXP.cdsTDoc.fieldbyname('TDIARID2').AsString<>'') then
      begin
         //ShowMessage('Ojo: Esta N/Crédito tiene más de un T/Diario');
         // Pide eleccion de TDiarID
      end;
      wTDiar    := DMCXP.cdsTDoc.fieldbyname('TDIARID').AsString;  // Default(x ahora)
      xTAutoNum := DMCXP.DisplayDescrip('TGE104','AutoNum','TDiarID',dblcTDiario.Text);
   end
   else begin
      ShowMessage('Tipos de Documento no registra definición de N/Crédito');
      // Forma de Registro (N) no definido en tabla TDocum(TGE110)     ¿?
      // Salir de N/Credito
   end;

end;
// Fin HPC_201802_CXP
end.


