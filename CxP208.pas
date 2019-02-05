unit CxP208;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, wwdblook, Wwdbdlg, wwdbdatetimepicker, Buttons,
  Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, DB, ComCtrls, Tabnotbk, Menus,
  DBClient, wwclient, ppDB, ppDBPipe, ppCtrls, ppBands, ppVar, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport,ppViewr, variants,
  pptypes, oaVariables;

type
  TFIntermediacion = class(TForm)
    pnlCabecera: TPanel;
    pnlDetalle: TPanel;
    pnlPie: TPanel;
    Z2bbtnGraba: TBitBtn;
    bbtnCancela: TBitBtn;
    bbtnCalc: TBitBtn;
    Z2bbtnContab: TBitBtn;
    Z2bbtnNuevo: TBitBtn;
    Z2bbtnImprime: TBitBtn;
    Z2bbtnAcepta: TBitBtn;
    Z2bbtnAnula: TBitBtn;
    bbtnDel1: TBitBtn;
    bbtnSumat: TBitBtn;
    bbtnGen302: TBitBtn;
    Label6: TLabel;
    bbtnRegresa: TBitBtn;
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
    lblSerie: TLabel;
    lblNoDoc: TLabel;
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
    edtSerie: TwwDBEdit;
    edtNoDoc: TwwDBEdit;
    dbeNoReg: TwwDBEdit;
    pnlEstado: TPanel;
    lblAnula: TLabel;
    lblActivo: TLabel;
    lblContab: TLabel;
    lblAcepta: TLabel;
    Label12: TLabel;
    Label8: TLabel;
    dblcClAux: TwwDBLookupCombo;
    lblEliminado: TLabel;
    pnlActuali: TPanel;
    lblActuali: TLabel;
    Z2bbtnPreview: TBitBtn;
    ppdbpPreview: TppDBPipeline;
    Label9: TLabel;
    dblcdCptoTotal: TwwDBLookupComboDlg;
    Label13: TLabel;
    dbeDescCptoTot: TwwDBEdit;
    pgctDocumentos: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pnlPendientes2: TPanel;
    Label1: TLabel;
    dbgPendientes2: TwwDBGrid;
    pnlDetCanje: TPanel;
    Label4: TLabel;
    dbgDetCanje: TwwDBGrid;
    edtFinal: TEdit;
    pnlDetCxP: TPanel;
    Label5: TLabel;
	 dbgDetCxP: TwwDBGrid;
    btnActReg: TwwIButton;
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
	 dblcdCCosto: TwwDBLookupComboDlg;
	 edtTipReg: TEdit;
	 edtCCosto: TEdit;
	 dbeImporte: TwwDBEdit;
	 dbeDH: TwwDBEdit;
	 bbtnRegOk: TBitBtn;
	 bbtnRegCanc: TBitBtn;
	 dbeCuenta: TwwDBEdit;
	 dbeGlosa: TwwDBEdit;
	 dblcTipReg: TwwDBLookupCombo;
	 dblcdCnpEgr: TwwDBLookupComboDlg;
	 StaticText1: TStaticText;
	 dblcTipPre: TwwDBLookupCombo;
	 dbeTipPre: TwwDBEdit;
	 dblcdPresup: TwwDBLookupComboDlg;
	 edtPresup: TEdit;
    pprPreview: TppReport;
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
	 procedure bbtnOKClick(Sender: TObject);
	 procedure dbgPendientesDragOver(Sender, Source: TObject; X, Y: Integer;
		State: TDragState; var Accept: Boolean);
	 procedure dbgCanjeDragOver(Sender, Source: TObject; X, Y: Integer;
		State: TDragState; var Accept: Boolean);
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
    procedure dbgDetCanjeColExit(Sender: TObject);
    procedure Z2bbtnAnulaClick(Sender: TObject);
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EstadoDeBotones( xMovEstado, xMovConta : String );
    procedure MuestraEstado( xMovEstado, xMovConta : String ) ;
    procedure bbtnRegresaClick(Sender: TObject);
    procedure IniciaBotonesDetalle;
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
    procedure pgctDocumentosChange(Sender: TObject);
    procedure dblcdCptoTotalExit(Sender: TObject);
    procedure pprPreviewPreviewFormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
	 strTemp : String;
	 wCtaTotal : String;
    xNRegistro,xAnomes,xGlosa,xMensaje,xDistri,xCta_Ccos : String;
    XnrEG : iNTEGER;
    //**
    // para presupuestos - pjsv - 17/10/2000
    procedure CalculoNivelSupe;
    procedure inicializoCero(xcds : TwwClientDataSet);
    procedure CreaSuperior;
    procedure CalculoNivel;
    procedure GeneraDiferenciaCambio;
    function  AsientoCuadra: Boolean;
    procedure CargaDataSource;
  public
    { Public declarations }
  end;

  procedure OPIntermediacion; stdcall;

exports
  OPIntermediacion;

var
  xRegAct, xRegAct2 ,  xRegMov : TBookMark;
  FIntermediacion: TFIntermediacion;
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

implementation

uses CxPDM, CxP001, CxP778;

{$R *.DFM}

procedure OPIntermediacion;
var
   xSQL : String;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if not FVariables.w_OP_Registro then
   begin
      xSQL:='Select * from CXP301 '
           +'Where CIAID=''ZZ'' AND TDIARID=''ZZ'' AND CPANOMES=''ZZZZ''';
      DMCXP.cdsMovCxP2.Close;
      DMCXP.cdsMovCxP2.DataRequest( xSQL );
      DMCXP.cdsMovCxP2.Open;
      DMCXP.wModo := 'A';
      FIntermediacion:= TFIntermediacion.Create( Application );
      FVariables.w_OP_Registro:=True;
      FIntermediacion.ActiveMDIChild;
      FVariables.ConfiguraForma( Screen.ActiveForm );
   end
   else
   begin
      ShowMessage( 'Opcion en USO' );
   end
end;


procedure TFIntermediacion.EstadoDeForma(xxModo:Integer; xMovEstado,xMovConta:String);
begin
   pnlCab1.Enabled      := False;
   pnlCab2.Enabled      := False;
   dtpFComp.Enabled     := False;
   dbeNoReg.Enabled     := False;

   bbtnOK.Enabled       := False;
   bbtnBorra.Enabled    := False;

   pnlDetalle.Enabled   := False;
   pnlRegistro.Visible  := False;

   dbgPendientes2.Enabled := False;
   dbgDetCanje.Enabled    := False;
   dbgDetCxP.Enabled      := False;
   dbgPendientes2.ReadOnly:= True;
   dbgDetCanje.ReadOnly   := True;
   dbgDetCxP.ReadOnly     := True;
   btnActReg.Enabled      := False;

   pnlPie.Refresh;
   pnlPie.Enabled       := False;
   bbtnRegresa.Enabled  := False;
   bbtnCancela.Enabled  := False;
   Z2bbtnGraba.Enabled  := False;
   Z2bbtnAcepta.Enabled := False;
   Z2bbtnAnula.Enabled  := False;
   Z2bbtnImprime.Enabled:= False;
	Z2bbtnPreview.Enabled:= False;
   Z2bbtnContab.Enabled := False;
   Z2bbtnNuevo.Enabled  := False;

   lblActivo.Visible    := False;
   lblAcepta.Visible    := False;
   lblAnula.Visible     := False;
   lblContab.Visible    := False;
   lblEliminado.Visible := False ;

   if xxModo=0 then
   begin
      if (xMovEstado=' ') or (xMovEstado='') then
      begin
         pnlCab1.Enabled    := True;
         pnlCab2.Enabled    := True;
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
         pnlPie.Enabled       := true;
         Z2bbtnPreview.Enabled := True;
	 dbgDetCanje.Enabled  := True;
	 dbgDetCxP.Enabled    := True;

	 lblContab.Visible    := True;
      end
      else begin
	 If xMovEstado='I' then
	 begin
	    pnlDetalle.Enabled     := True;
	    dbgPendientes2.Enabled := True;
	    dbgDetCanje.Enabled    := True;
	    dbgDetCxP.Enabled      := True;
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
	 end
	 else
	 begin
	    if (xMovEstado='P') or (xMovEstado='C') then
	    begin
	       pnlDetalle.Enabled    := True;
	       dbgDetCanje.Enabled   := True;
	       dbgDetCxP.Enabled     := True;

	       pnlPie.Enabled       := True;
	       Z2bbtnImprime.Enabled:= True;
	       Z2bbtnPreview.Enabled:= True;
	       Z2bbtnContab.Enabled := True;
               Z2bbtnNuevo.Enabled  := true;
	       lblAcepta.Visible    := True;
	    end
	    else
	    begin // Anulado
	       pnlDetalle.Enabled    := True;
	       dbgDetCanje.Enabled   := True;
	       dbgDetCxP.Enabled     := True;

	       pnlPie.Enabled       := True;
	       Z2bbtnImprime.Enabled:= True;
	       Z2bbtnPreview.Enabled:= True;
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

      dbgPendientes2.Enabled := False;
      dbgDetCanje.Enabled    := False;
      dbgDetCxP.Enabled      := False;
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
	 Z2bbtnImprime.Enabled:= True;
	 Z2bbtnPreview.Enabled:= True;
	 Z2bbtnContab.Enabled := True;
	 Z2bbtnNuevo.Enabled  := True;
      end
      else begin
	 Z2bbtnGraba.Enabled  := False;
	 Z2bbtnAcepta.Enabled := False;
	 Z2bbtnAnula.Enabled  := False;
	 Z2bbtnImprime.Enabled:= False;
	 Z2bbtnPreview.Enabled:= False;
	 Z2bbtnContab.Enabled := False;
	 Z2bbtnNuevo.Enabled  := False;
      end;
      pnlPie.Refresh;
   end;
end;



procedure TFIntermediacion.IniciaForma(xModo : String ); // A=Adic, M=Mod, C=Cons
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

procedure TFIntermediacion.FiltraGrids;
var
	xFiltro : string;
begin
// Filtro para Documentos aptos para elección del Proveedor
	xFiltro:= 'CIAID='         +''''+dblcCia.Text  +''''
			  + ' and AUXIDINTER='     +''''+dblcdProv.Text+''''
			  + ' and DOCID<>'   +''''+wTDoc         +'''';
	Filtracds( DMCXP.cdsMovCxP,'Select * from CXP301 Where '+xFiltro );
	Filtracds( DMCXP.cdsQry5,'Select * from CXP301 Where '+xFiltro );
	DMCXP.cdsMovCxP.Filtered := False;
	DMCXP.cdsMovCxP.Filter   := ' CPESTADO=''P'' AND (CPSALLOC > 0 OR CPSALEXT > 0)'
									+' and FLAGVAR<>'+''''+'XX'+'''';
	DMCXP.cdsMovCxP.Filtered := True;

// Filtro para cdsLetras que se utilizará para Documentos Pendientes
	xFiltro:= 'CIAID='   +''''+ dblcCia.Text  +''''+ ' and '
			  + 'AUXIDINTER='    +''''+ dblcdProv.Text+''''+ ' and '
			  + 'DOCID<>'  +''''+ wTDoc         +'''';
	Filtracds( DMCXP.cdsLetras,'Select * from CXP301 Where '+xFiltro );
	DMCXP.cdsLetras.Filtered := False;
	DMCXP.cdsLetras.Filter   := 'CPESTADO='+''''+ 'P' +''''+ ' and '
									+ '(CPSALLOC > 0 OR CPSALEXT > 0) '+' and FLAGVAR<>'+''''+'XX'+'''';
	DMCXP.cdsLetras.Filtered := True;
	dbgPendientes2.Selected.Clear;
//	dbgPendientes2.Selected.Add('TDIARID'#9'3'#9'TD'#9'F');
	dbgPendientes2.Selected.Add('PROV'#9'10'#9'Proveedor'#9'F'); // debe salir
	dbgPendientes2.Selected.Add('CPNOREG'#9'11'#9'No.Reg'#9'F');
	dbgPendientes2.Selected.Add('CPANOMES'#9'7'#9'Periodo'#9'F');
	dbgPendientes2.Selected.Add('CPSERIE'#9'6'#9'Serie'#9'F');
	dbgPendientes2.Selected.Add('CPNODOC'#9'14'#9'No.Documento'#9'F');
	dbgPendientes2.Selected.Add('CPFCMPRB'#9'10'#9'Fecha~Comprobante'#9'F');
//	dbgPendientes2.Selected.Add('CPTCAMPR'#9'9'#9'T.Cambio~Provisión'#9'F');
	dbgPendientes2.Selected.Add('CPMTOORI'#9'15'#9'Total'#9'F');
	dbgPendientes2.Selected.Add('CPSALLOC'#9'14'#9'Saldo~Mon.Local'#9'F');
	dbgPendientes2.Selected.Add('CPSALEXT'#9'14'#9'Saldo~Mon.Extranjera'#9'F');
	dbgPendientes2.RedrawGrid;

   // ANAX  AGREGADO POR ANA FORMATO DE NUMEROS
  TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOORI')).DisplayFormat := '###,###,##0.00';
  TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOORI')).EditFormat := '########0.00';

  TNumericField(DMCXP.CdsLetras.FieldByName('CPSALLOC')).DisplayFormat := '###,###,##0.00';
  TNumericField(DMCXP.CdsLetras.FieldByName('CPSALLOC')).EditFormat := '########0.00';

  TNumericField(DMCXP.CdsLetras.FieldByName('CPSALEXT')).DisplayFormat := '###,###,##0.00';
  TNumericField(DMCXP.CdsLetras.FieldByName('CPSALEXT')).EditFormat := '########0.00';
  //FIN DE ANAX


// Filtro para Documentos escogidos para el Canje
	xFiltro:= 'CIAID='    +''''+ dblcCia.Text+''''+ ' and '
			  + 'TCANJEID=' +''''+ 'CB'        +''''+ ' and '
			  + 'CCPCANJE=' +''''+ wCje        +''''
//           + ' and PROV='   +''''+dblcdProv.Text+''''
			  + ' and DOCID<>'   +''''+wTDoc         +'''';

	Filtracds( DMCXP.cdsCanje,'Select * from CXP304 Where '+xFiltro );

// Filtra Compañía+NC+No.Canje en Detalle de Canje
	xFiltro:= 'CIAID='   +''''+dblcCia.Text+''''+' and '
			  + 'TCANJEID='+''''+'CB'        +''''+' and '
			  + 'CCPCANJE='+''''+wCje        +''''
//           + ' and PROV='     +''''+dblcdProv.Text+''''
			  + ' and DOCID<>'   +''''+wTDoc         +'''';
	Filtracds( DMCXP.cdsDetCanje,'Select * from CXP305 Where '+xFiltro );
	dbgDetCanje.Selected.Clear;
	dbgDetCanje.Selected.Add('PROV'#9'10'#9'Proveedor'#9'F');
	dbgDetCanje.Selected.Add('DOCID'#9'3'#9'DOC'#9'F');
	dbgDetCanje.Selected.Add('CPSERIE'#9'6'#9'Serie'#9'T');
	dbgDetCanje.Selected.Add('CPNODOC'#9'16'#9'No.Documento'#9'T');
	dbgDetCanje.Selected.Add('CCPFCJE'#9'12'#9'Fecha~Comprobante'#9'F');
	dbgDetCanje.Selected.Add('DCDTCAMB'#9'8'#9'Tipo de~Cambio'#9'F');
	dbgDetCanje.Selected.Add('DCDMOLOC'#9'15'#9'Amortización~Mon.Local'#9'F');
	dbgDetCanje.Selected.Add('DCDMOEXT'#9'15'#9'Amortización~Mon.Extranjera'#9'F');
	dbgDetCanje.RedrawGrid;

// Filtra DetCxP para mostrar DetContable(dbgDetCxp) si NCredito Existe
	xFiltro:= 'CIAID    =''' + dblcCia.Text  + ''' and '
			  + 'TDIARID  =''' + DMCXP.cdsMovCxP2.fieldbyname('TDIARID').AsString  + ''' and '
			  + 'DCPANOMM =''' + DMCXP.cdsMovCxP2.fieldbyname('CPANOMES').AsString + ''' and '
			  + 'CPNOREG  =''' + dbeNoReg.Text  + '''' ;
	Filtracds( DMCXP.cdsDetCxP,'Select * from CXP302 Where '+xFiltro );
	dbgDetCxP.Selected.Clear;
	dbgDetCxP.Selected.Add('TREGID'#9'6'#9'Tipo de~Registro'#9'F');
	dbgDetCxP.Selected.Add('CPTOID'#9'9'#9'Concepto'#9'F');
	dbgDetCxP.Selected.Add('CUENTAID'#9'14'#9'Cuenta Contable'#9'F');
	dbgDetCxP.Selected.Add('DCPGLOSA'#9'40'#9'Glosa'#9'F');
//	dbgDetCxP.Selected.Add('CCOSID'#9'10'#9'Centro~Costo'#9'F');
	dbgDetCxP.Selected.Add('DCPDH'#9'4'#9'Debe~Haber'#9'F');
	dbgDetCxP.Selected.Add('DCPMOORI'#9'14'#9'Importe'#9'F');
	dbgDetCxP.Selected.Add('PARPRESID'#9'10'#9'Partida~Presupuestal'#9'F');
	dbgDetCxP.RedrawGrid;
end;

procedure TFIntermediacion.EstadoDePanel( xxModo : String );
begin
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
					dbgDetCanje.ReadOnly:= False;
               dbgDetCxP.ReadOnly  := False;
               pnlPie.Enabled      := true;
            end;
         end;
      end;
   end;
end;


procedure TFIntermediacion.dblcCiaExit(Sender: TObject);
var
	xSQL : String;
begin
	If xCrea then Exit;

	edtCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);
	if length(edtCia.Text)=0 then
	begin
		dblcCia.SetFocus;
		Raise Exception.Create('Compañía no existe');
	end;
	if Length(dblcClAux.Text)=0 then dblcClAux.SetFocus;

    if DMCXP.wVRN_CCosCia='N' then
    	 xSQL:='SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 '
					+'Where CCOSMOV='+quotedstr('S')
    else
     	 xSQL:='SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 '
					+'Where CCOSMOV='+quotedstr('S')
          +' and CCOSCIAS LIKE ('+quotedstr('%'+dblcCia.Text+'%')+' ) ';

	 DMCXP.cdsCCosto.Close;
	 DMCXP.cdsCCosto.DataRequest(xSQL);
	 DMCXP.cdsCCosto.open;
	 DMCXP.cdsCCosto.Filter:='';
	 DMCXP.cdsCCosto.Filtered:=False;
	 DMCXP.cdsCCosto.IndexFieldNames :='CCOSID';

    if DMCXP.wVRN_CptoCia='N' then
    	 xSQL:='select * from CXP201 '
    else
    	 xSQL:='select * from CXP201 '
		    	 	+'Where CIAID='+quotedstr(dblcCia.Text);

  	DMCXP.cdsCnpEgr.Close;
	  DMCXP.cdsCnpEgr.DataRequest( xSQL );
	  DMCXP.cdsCnpEgr.Open;
end;

procedure TFIntermediacion.dblcdProvExit(Sender: TObject);
var
	 xWhere : String;
begin
	 if xCrea then Exit;
	 if dblcClAux.Focused then Exit;
	 if bbtnBorra.Focused then Exit;
	 if Length(dblcClAux.Text)=0 then begin
			dblcClAux.SetFocus;
			Raise Exception.Create('Falta Ingresar Clase de Auxiliar');
	 end;

	 if (length(dblcdProv.Text)>0) then
	 begin

			if DMCXP.wAnchoProv > 0 then
			begin
				if ((Length(dblcdProv.Text) < DMCXP.wAnchoProv) and (Length(dblcdProv.Text)>0)) then
				begin
					dblcdProv.Text:=StrZero(dblcdProv.Text,DMCXP.wAnchoProv);
				end;
			end;

			xWhere:='ClAuxId='''+dblcClAux.Text+''' and Prov='''+dblcdProv.Text+'''';
			edtProv.Text:=BuscaQry('dspTGE','TGE201','PROV,PROVRUC,PROVDES',xWhere,'PROVDES');
			if length(edtProv.Text)=0 then
			begin
				 if DMCXP.cdsMovCxP2.State in [dsEdit, dsInsert] then
				 begin
						DMCXP.cdsMovCxP2.fieldbyname('PROV').AsString   :='';
						DMCXP.cdsMovCxP2.fieldbyname('PROVRUC').AsString:='';
						dblcdProvRuc.Text:='';
				 end
				 else
				 begin
						DMCXP.cdsMovCxP2.Edit;
						DMCXP.cdsMovCxP2.fieldbyname('PROV').AsString   :='';
						DMCXP.cdsMovCxP2.fieldbyname('PROVRUC').AsString:='';
						dblcdProvRuc.Text:='';
				 end;
				 ShowMessage('Código de Proveedor no existe!');
				 dblcdProv.SetFocus;
				 exit;
			end;
			if DMCXP.cdsMovCxP2.State in [dsEdit, dsInsert] then
			begin
				DMCXP.cdsMovCxP2.fieldbyname('PROVRUC').AsString:=DMCXP.cdsQry.FieldByName('PROVRUC').AsString;
				dblcdProvRuc.Text:=DMCXP.cdsQry.FieldByName('PROVRUC').AsString;
			end
			else
			begin
				DMCXP.cdsMovCxP2.Edit;
				DMCXP.cdsMovCxP2.fieldbyname('PROVRUC').AsString:=DMCXP.cdsQry.FieldByName('PROVRUC').AsString;
				dblcdProvRuc.Text:=DMCXP.cdsQry.FieldByName('PROVRUC').AsString;
			end;
			edtSerie.SetFocus;
	 end
	 else begin
			edtProv.Text:='';
			dblcdProvRuc.SetFocus;
	 end;
end;

procedure TFIntermediacion.dblcdProvRucExit(Sender: TObject);
var
	 xWhere : String;
begin
	 if xCrea             then Exit;
	 if dblcClAux.Focused then Exit;
	 if bbtnBorra.Focused then Exit;
	 if Length(dblcClAux.Text)=0 then begin
			dblcClAux.SetFocus;
			Raise Exception.Create('Falta Ingresar Clase de Auxiliar');
	 end;

	 if (length(dblcdProvRuc.Text)>0) then
	 begin
			xWhere:='ClAuxId='''+dblcClAux.Text+''' and ProvRuc='''+dblcdProvRuc.Text+'''';
			edtProv.Text:=BuscaQry('dspTGE','TGE201','PROV,PROVRUC,PROVDES',xWhere,'PROVDES');
			if length(edtProv.Text)=0 then
			begin
				 DMCXP.cdsMovCxP2.fieldbyname('PROV').AsString   :='';
				 DMCXP.cdsMovCxP2.fieldbyname('PROVRUC').AsString:='';
				 dblcdProvRuc.SetFocus;
				 Raise Exception.Create('RUC de Proveedor no existe');
			end;
			DMCXP.cdsMovCxP2.fieldbyname('PROV').AsString:=DMCXP.cdsQry.FieldByName('PROV').AsString;
			edtSerie.SetFocus;
	 end
	 else begin
			edtProv.Text:='';
			dblcdProv.SetFocus;
	 end;
end;

procedure TFIntermediacion.InicializaVars;
begin
	wCje      := '';
   wSimbMn   := '';
   wEstadTem := '';              // si regresa de Det a Pend (cuando existe N/C)
   wCuadra   := False;
   wRegGrab  := False;
   edtFinal.Text:= '';
   edtSerie.Text:= '';
   edtNoDoc.Text:= '';
   
   xFlagGr   := False;
end;

procedure TFIntermediacion.InicializaCds;
begin
	DMCXP.cdsDetCxP.EnableControls;
	DMCXP.cdsDetCanje.EnableControls;
	DMCXP.cdsCanje.EnableControls;

	Filtracds( DMCXP.cdsMovCxP,  'Select * from CXP301 Where CIAID=''''' );
	Filtracds( DMCXP.cdsCanje,   'Select * from CXP304 Where CIAID=''''' );
	Filtracds( DMCXP.cdsLetras,  'Select * from CXP301 Where CIAID=''''' );
	Filtracds( DMCXP.cdsDetCanje,'Select * from CXP305 Where CIAID=''''' );
	Filtracds( DMCXP.cdsDetCxP,  'Select * from CXP302 Where CIAID=''''' );
end;

function TFIntermediacion.Consistencia: Boolean;
begin
	if length(dblcCia.Text)=0 then
	begin
//		raise exception.Create('Ingrese Compañía');
		ShowMessage('Ingrese Compañía');
		dblcCia.SetFocus;
		exit;
	end;
	if length(dblcdProv.Text)=0 then
	begin
//		raise exception.Create('Ingrese Proveedor');
		ShowMessage('Ingrese Proveedor');
		dblcdProv.SetFocus;
		exit;
	end;
	if length(edtSerie.Text)=0 then
	begin
//		raise exception.Create('Ingrese Serie del Documento');
		ShowMessage('Ingrese Serie del Documento');
		edtSerie.SetFocus;
		exit;
	end;
	if length(edtNoDoc.Text)=0 then
	begin
//		raise exception.Create('Ingrese Número del Documento');
		ShowMessage('Ingrese Número del Documento');
		edtNoDoc.SetFocus;
		exit;
	end;
	if dtpFComp.Date=0 then
	begin
//		raise exception.Create('Ingrese Fecha del comprobante');
		ShowMessage('Ingrese Fecha del comprobante');
		dtpFComp.SetFocus;
		exit;
	end;
	if length(dbeNoReg.Text)=0 then
	begin
//		raise exception.Create('Ingrese Número del comprobante');
		ShowMessage('Ingrese Número del comprobante');
		dbeNoReg.SetFocus;
		exit;
	end;
	if length(dblcTMon.Text)=0 then
	begin
//		raise exception.Create('Ingrese Moneda');
		ShowMessage('Ingrese Moneda');
		dblcTMon.SetFocus;
		exit;
	end;
	if length(dbeTCambio.Text)=0 then
	begin
//		raise exception.Create('Ingrese Tipo de Cambio');
		ShowMessage('Ingrese Tipo de Cambio');
		dbeTCambio.SetFocus;
		exit;
	end;
	if dbdtpFRecep.Date=0 then
	begin
//		raise exception.Create('Ingrese Fecha de Recepción del Documento');
		ShowMessage('Ingrese Fecha de Recepción del Documento');
		dbdtpFRecep.SetFocus;
		exit;
	end;
	if dbdtpFEmis.Date=0 then
	begin
//		raise exception.Create('Ingrese Fecha de Emisión del Documento');
		ShowMessage('Ingrese Fecha de Emisión del Documento');
		dbdtpFEmis.SetFocus;
		exit;
	end;
	if length(dblcdCptoTotal.text)=0 then
	begin
//		raise exception.Create('Ingrese Concepto Total');
		ShowMessage('Ingrese Concepto Total');
		dblcdCptoTotal.SetFocus;
		exit;
	end;
	if length(dbeDescCptoTot.text)=0 then
	begin
//		raise exception.Create('Ingrese Descripción de Concepto Total');
		ShowMessage('Ingrese Descripción de Concepto Total');
		dbeDescCptoTot.SetFocus;
		exit;
	end;
	Result := true;
end;

procedure TFIntermediacion.bbtnOKClick(Sender: TObject);
var
	xWhere : String;
begin
  if not Consistencia then Exit;

  if DMCXP.wModo='A' then
	begin
	  xWhere:='CiaId='+''''+dblcCia.Text+''''+' and TCanjeID='+''''+'CB'+'''';
	  wCje  :=DMCXP.BuscaUltTGE('PrvUltCxP','CXP305','CCPCanje',xWhere);
	  wCje  :=StrZero(wCje,6);
	  DMCXP.cdsMovCxP2.Edit;
	  DMCXP.cdsMovCxP2.fieldbyname('CPSERIE').AsString := edtSerie.Text;
	  DMCXP.cdsMovCxP2.fieldbyname('CPNODOC').AsString := edtNoDoc.Text;
	  DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString:='I';
    FiltraGrids;
	end;

  DatosdeFecha;

  EstadoDeForma(1,DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString,DMCXP.cdsMovCxP2.fieldbyname('CP_CONTA').AsString );

  DatosCds;
  bbtnSumatClick(Sender);
end;

procedure TFIntermediacion.DatosCds;
begin
	DMCXP.cdsMovCxP2.Edit;
	DMCXP.cdsMovCxP2.fieldbyname('CLAUXID').AsString   :=dblcClAux.Text;    // clase de Auxiliar=CP <-- constante
	DMCXP.cdsMovCxP2.fieldbyname('CPSERIE').AsString   :=edtSerie.Text;
	DMCXP.cdsMovCxP2.fieldbyname('CPNODOC').AsString   :=edtNoDoc.Text;
	DMCXP.cdsMovCxP2.fieldbyname('CPFCMPRB').AsDateTime:=dtpFComp.Date;

	DMCXP.cdsMovCxP2.fieldbyname('TCANJEID').AsString  :='CB';
	DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString   :=wCje;
	DMCXP.cdsMovCxP2.fieldbyname('CPFCANJE').AsDateTime:=dtpFComp.Date;
	DMCXP.cdsMovCxP2.fieldbyname('CPUSER').AsString    :=DMCXP.wUsuario;
	DMCXP.cdsMovCxP2.fieldbyname('CPFREG').AsDateTime  :=date;
	DMCXP.cdsMovCxP2.fieldbyname('CPHREG').AsDateTime  :=time;

	if DMCXP.wModo='A' then

	else begin   // si no es nuevo
		DMCXP.cdsCanje.DisableControls;
		DMCXP.cdsCanje.First;
	// Recalcula saldos si NCredito ya existe
		While not DMCXP.cdsCanje.Eof do
		Begin
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
				DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat:= DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
				DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat:= DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
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
end;

procedure TFIntermediacion.dtpFCompExit(Sender: TObject);
var
	wLote,  wMes, xWhere: string;
	Year, Month, Day: Word;
begin
	if xCrea then Exit;
	if bbtnBorra.Focused then Exit;

	dbdtpFRecep.Date:=dtpFComp.Date;
	dbdtpFEmis.Date :=dtpFComp.Date;
	DecodeDate(dtpFComp.Date, Year, Month, Day);
	wMes := inttostr(Month);
	if Month<10 then wMes := '0'+inttostr(Month);
   wAnoMM:= IntToStr(Year)+wMes;
   xTAno := IntToStr(Year);
   xTMes := wMes;
	dbeNoReg.Text := DMCXP.UltimoRegistro(xTAutoNum,dblcCia.Text,wTDiar,xTAno,xTMes );
   //** 06/09/2001 - pjsv, se utilizan en la llamada al prorrateo
   xAnomes := xTAno+xTMes;
   xNRegistro := dbeNoReg.Text;
	//**
   DMCXP.cdsMovCxP2.fieldbyname('CPNOREG').AsString:=StrZero(dbeNoReg.Text,DMCXP.cdsMovCxP2.fieldbyname('CPNoReg').Size);
   xWhere := 'TDiarId='+''''+wTDiar+''''+' and CPAnoMes='+''''+wAnoMM+'''';
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

procedure TFIntermediacion.DatosdeFecha;
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

procedure TFIntermediacion.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFIntermediacion.dbgCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFIntermediacion.CalculaTotalCje;
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

procedure TFIntermediacion.CalculaTotalDetCje;
var
	 xSigno : String;
begin
 // Totales de Documentos de canje  (Cancelación)
	 wTDev2:=0;
	 DMCXP.cdsDetCanje.DisableControls;  // inhab. movim. de puntero pal grid
	 xRegAct := DMCXP.cdsDetCanje.GetBookmark;  // marca reg. donde se quedo
	 if DMCXP.cdsTDoc.IndexFieldNames<>'DOCID' then
   	  DMCXP.cdsTDoc.IndexFieldNames:='DOCID';
	 DMCXP.cdsDetCanje.First ;
	 while not DMCXP.cdsDetCanje.Eof do
	 begin
			xSigno := '+';
			DMCXP.cdsTDoc.SetKey;
			DMCXP.cdsTDoc.FieldByName('DOCID').AsString := DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
			if DMCXP.cdsTDoc.Gotokey then
				 if DMCXP.cdsTDoc.FieldByName('DOCRESTA').AsString='S' then
						xSigno:='-';
			if dblcTMon.Text = DMCXP.wTMonExt then
				 begin
					 if xSigno='+' then
							wTDev2 := wTDev2 + DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat
					 else
							wTDev2 := wTDev2 - DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
				 end
			else
			 begin
				 if xSigno='+' then
						wTDev2 := wTDev2 + DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat
				 else
						wTDev2 := wTDev2 - DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
			 end;
			DMCXP.cdsDetCanje.Next;
	 end;
	 DMCXP.cdsDetCanje.GotoBookmark(xRegAct);
	 DMCXP.cdsDetCanje.FreeBookmark(xRegAct);
	 DMCXP.cdsDetCanje.EnableControls;
end;

procedure TFIntermediacion.LlenaDetCxP;
begin
   DMCXP.cdsDetCxP.Edit;
   DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    :=dblcCia.Text;
   DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  :=wTDiar;
   DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  :=dbeNoReg.Text;
   DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  :='CP';
   DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat  :=strtofloat(dbeTCambio.Text);
   DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime:=dtpFComp.Date;
   DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString :='P'; // Pendiente
   DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
   DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime:=date;
   DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime:=time;
   DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   :=dblcTMon.Text;
   DMCXP.cdsDetCxP.fieldbyname('TCANJEID').AsString :='CB';
   DMCXP.cdsDetCxP.fieldbyname('CANJE').AsString    :=wCje;

   if DMCXP.BuscaFecha('TGE114','FECANO','FECHA',dtpFComp.date) then
   begin
      DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString :=DMCXP.cdsUltTGE.fieldbyname('FECANO').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString:=DMCXP.cdsUltTGE.fieldbyname('FECANO').AsString+DMCXP.cdsUltTGE.fieldbyname('FECMES').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString   :=DMCXP.cdsUltTGE.fieldbyname('FECMES').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString   :=DMCXP.cdsUltTGE.fieldbyname('FECDIA').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString  :=DMCXP.cdsUltTGE.fieldbyname('FECTRIM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString  :=DMCXP.cdsUltTGE.fieldbyname('FECSEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString   :=DMCXP.cdsUltTGE.fieldbyname('FECSS').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAATri').AsString:=DMCXP.cdsUltTGE.fieldbyname('FECAATRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASem').AsString:=DMCXP.cdsUltTGE.fieldbyname('FECAASEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString :=DMCXP.cdsUltTGE.fieldbyname('FECAASS').AsString;
   end;
end;

procedure TFIntermediacion.dbgPendientes2DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
	Accept:=True;
end;

procedure TFIntermediacion.dbgPendientes2EndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   if Target=dbgDetCanje Then
   begin
      if fRound( (DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat-DMCXP.cdsLetras.FieldByName('CPPAGLOC').AsFloat),15,2 ) <>
         FRound( DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat,15,2 ) then
      begin
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
         DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString := DMCXP.cdsLetras.FieldByName('CPSERIE').AsString;

      DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString := DMCXP.cdsLetras.FieldByName('CPNODOC').AsString;
      if not( DMCXP.cdsDetCanje.GotoKey ) then
      begin
	 DMCXP.cdsDetCanje.Insert;
	 DMCXP.cdsDetCanje.FieldByName('CIAID').AsString      := DMCXP.cdsLetras.FieldByName('CIAID').AsString;
	 DMCXP.cdsDetCanje.FieldByName('CLAUXID').AsString 	:= trim(dblcClAux.Text) ;
	 DMCXP.cdsDetCanje.FieldByName('PROV').AsString       := DMCXP.cdsLetras.FieldByName('PROV').AsString;
	 DMCXP.cdsDetCanje.FieldByName('PROVRUC').AsString    := DMCXP.cdsLetras.FieldByName('PROVRUC').AsString;
	 DMCXP.cdsDetCanje.FieldByName('DOCID').AsString      := DMCXP.cdsLetras.FieldByName('DOCID').AsString;
	 DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString    := DMCXP.cdsLetras.FieldByName('CPSERIE').AsString;
	 DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString    := DMCXP.cdsLetras.FieldByName('CPNODOC').AsString;
	 DMCXP.cdsDetCanje.FieldByName('CPNOREG').AsString    := DMCXP.cdsLetras.FieldByName('CPNOREG').AsString;
	 DMCXP.cdsDetCanje.FieldByName('TCANJEID').AsString   := 'CB';
	 DMCXP.cdsDetCanje.FieldByName('CCPCANJE').AsString   := wCje;
	 DMCXP.cdsDetCanje.FieldByName('DOCID2').AsString     := DMCXP.cdsLetras.FieldByName('DOCID').AsString;
	 DMCXP.cdsDetCanje.FieldByName('CPSERIE2').AsString   := DMCXP.cdsLetras.FieldByName('CPSERIE').AsString;
	 DMCXP.cdsDetCanje.FieldByName('CPNODOC2').AsString   := DMCXP.cdsLetras.FieldByName('CPNODOC').AsString;
	 DMCXP.cdsDetCanje.FieldByName('TMONID').AsString     := DMCXP.cdsLetras.FieldByName('TMONID').AsString;    // T.mon del doc - no modif.
	 // vhn - Se puede Modificar
	 DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := False;
	 DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := False;
	 DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := False;
	 DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := False;
	 DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsDateTime   := dtpFComp.Date;    // modif.
//  Según los documentos orígenes de la Nota de Cobranza se toma el tipo de cambio de cada provisión
//   y no el tipo de cambio de la misma nota de cobranza, si fuese así debería considerarse en la aceptación
//   un ajuste por diferencia de cambio
//	 DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat  := strtofloat(dbeTCambio.Text);  // modif.
	 //DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat  := DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat;
         // SE CAMBIO POR PEDIDO DE JORGE 05/0572003
	 DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat  := DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat;
	 xFlagCal := False;
	 DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat  := DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat;
	 DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat  := DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat;
	 xFlagCal := False;
	 DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat  := DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat;
	 xFlagCal := True;

	 // Reglas de Negocio
	 If DMCXP.wVRN_PagosParciales='S' then
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

	 // Actualiza Archivo de Canjes CXP304
	 if Length(DMCXP.cdsLetras.FieldByName('CPSerie').AsString)=0 then
	    DMCXP.cdsCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPNODOC'
	 else
	 begin
	    DMCXP.cdsCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
	 end;
	 DMCXP.cdsCanje.SetKey;
	 DMCXP.cdsCanje.FieldByName('CIAID').AsString   :=DMCXP.cdsLetras.FieldByName('CIAID').AsString;
	 DMCXP.cdsCanje.FieldByName('PROV').AsString    :=DMCXP.cdsLetras.FieldByName('PROV').AsString;
	 DMCXP.cdsCanje.FieldByName('DOCID').AsString   :=DMCXP.cdsLetras.FieldByName('DOCID').AsString;

	 if Length(DMCXP.cdsLetras.FieldByName('CPSerie').AsString)>0 then
	    DMCXP.cdsCanje.FieldByName('CPSERIE').AsString :=DMCXP.cdsLetras.FieldByName('CPSERIE').AsString;

	 DMCXP.cdsCanje.FieldByName('CPNODOC').AsString :=DMCXP.cdsLetras.FieldByName('CPNODOC').AsString;
	 if not(DMCXP.cdsCanje.GotoKey) then
	 begin
	    DMCXP.cdsCanje.Insert;
	    DMCXP.cdsCanje.FieldByName('CIAID').AsString    := DMCXP.cdsLetras.FieldByName('CIAID').AsString;
	    DMCXP.cdsCanje.FieldByName('TDIARID').AsString  := DMCXP.cdsLetras.FieldByName('TDIARID').AsString;
	    DMCXP.cdsCanje.FieldByName('CPNOREG').AsString  := DMCXP.cdsLetras.FieldByName('CPNOREG').AsString;
	    DMCXP.cdsCanje.FieldByName('CCPANOC').AsString  := DMCXP.cdsLetras.FieldByName('CPAAAA').AsString;
	    DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString := DMCXP.cdsLetras.FieldByName('CPANOMES').AsString;
	    DMCXP.cdsCanje.FieldByName('PROV').AsString     := DMCXP.cdsLetras.FieldByName('PROV').AsString;
	    DMCXP.cdsCanje.FieldByName('PROVRUC').AsString  := DMCXP.cdsLetras.FieldByName('PROVRUC').AsString;
	    DMCXP.cdsCanje.FieldByName('DOCID').AsString    := DMCXP.cdsLetras.FieldByName('DOCID').AsString;
	    DMCXP.cdsCanje.FieldByName('CPSERIE').AsString  := DMCXP.cdsLetras.FieldByName('CPSERIE').AsString;
	    DMCXP.cdsCanje.FieldByName('CPNODOC').AsString  := DMCXP.cdsLetras.FieldByName('CPNODOC').AsString;
	    DMCXP.cdsCanje.FieldByName('TCANJEID').AsString := 'CB';
	    DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString := wCje;
	    DMCXP.cdsCanje.FieldByName('CCPFCJE').AsDateTime:= dtpFComp.Date;    // modif.
	    DMCXP.cdsCanje.FieldByName('TMONID').AsString   := DMCXP.cdsLetras.FieldByName('TMONID').AsString;    // T.mon del doc - no modif.
	    DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat  := strtofloat(dbeTCambio.Text);  // modif.
	    DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsString := DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsString;
	    //DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsString := DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsString;
	    DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat  := DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat;
	    DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat  := DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat;
	    DMCXP.cdsCanje.FieldByName('CJEANTMN').AsFloat  := 0;
	    DMCXP.cdsCanje.FieldByName('CJEANTME').AsFloat  := 0;
	    DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat  := 0;   // modificable
	    DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat  := 0;   // modif.
	    DMCXP.cdsCanje.FieldByName('CCPESTDO').AsString := 'P';
	    DMCXP.cdsCanje.FieldByName('CCPUSER').AsString  := DMCXP.wUsuario;
	    DMCXP.cdsCanje.FieldByName('CCPFREG').AsdateTime:= date;
	    DMCXP.cdsCanje.FieldByName('CCPHREG').AsDateTime:= time;
	    DMCXP.cdsCanje.FieldByName('CCPMM').AsString    := DMCXP.cdsLetras.FieldByName('CPMM').AsString;
	    DMCXP.cdsCanje.FieldByName('CCPDD').AsString    := DMCXP.cdsLetras.FieldByName('CPDD').AsString;
	    DMCXP.cdsCanje.FieldByName('CCPTRI').AsString   := DMCXP.cdsLetras.FieldByName('CPTri').AsString;
	    DMCXP.cdsCanje.FieldByName('CCPSEM').AsString   := DMCXP.cdsLetras.FieldByName('CPSem').AsString;
	    DMCXP.cdsCanje.FieldByName('CCPSS').AsString    := DMCXP.cdsLetras.FieldByName('CPSS').AsString;
	    DMCXP.cdsCanje.FieldByName('CCPAATRI').AsString := DMCXP.cdsLetras.FieldByName('CPAATri').AsString;
	    DMCXP.cdsCanje.FieldByName('CCPAASEM').AsString := DMCXP.cdsLetras.FieldByName('CPAASem').AsString;
	    DMCXP.cdsCanje.FieldByName('CCPAASS').AsString  := DMCXP.cdsLetras.FieldByName('CPAASS').AsString;
            //CLG: 26/02/2003
	    DMCXP.cdsCanje.FieldByName('CLAUXID').AsString  := DMCXP.cdsLetras.FieldByName('CLAUXID').AsString;
            DMCXP.cdsCanje.FieldByName('CPFEMIS').AsDateTime:= DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime;
	    cdsPost(DMCXP.cdsCanje);
	 end;
	 DMCXP.cdsCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';

	 DMCXP.cdsLetras.Edit;
	 DMCXP.cdsLetras.FieldByName('FlagVar').AsString := 'XX';
	 cdsPost( DMCXP.cdsLetras );
      end;
      DMCXP.cdsDetCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
      DMCXP.cdsDetCanje.first;
      xGlosa := '';
      while not DMCXP.cdsDetCanje.eof do
      begin
         If xGlosa = '' then
	    xGlosa := 'Doc. '+DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString + ' - '
	 else
	    xGlosa := xGlosa + ' - Doc. '+DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString + ' - ';
	 DMCXP.cdsDetCanje.next;
      end;
      bbtnSumatClick(Sender);
      DMCXP.cdsLetras.Filtered := True;
   end;
end;

procedure TFIntermediacion.dbgPendientes2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgPendientes2.BeginDrag(False);
end;

procedure TFIntermediacion.dbgDetCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFIntermediacion.dbgDetCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
	if Target=dbgPendientes2 then
	begin
		DMCXP.cdsLetras.Filtered := false;
		if DMCXP.cdsLetras.IndexFieldNames<>'CIAID;PROV;DOCID;CPSERIE;CPNODOC' then
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
			DMCXP.cdsLetras.FieldByName('FLAGVAR').AsString := '';
		end;

		if Length(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString)=0 then
			DMCXP.cdsCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPNODOC'
		else
		begin
			DMCXP.cdsCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
		end;
		DMCXP.cdsCanje.SetKey;
		DMCXP.cdsCanje.FieldByName('CIAID').AsString   :=DMCXP.cdsDetCanje.FieldByName('CIAID').AsString;
		DMCXP.cdsCanje.FieldByName('PROV').AsString    :=DMCXP.cdsDetCanje.FieldByName('PROV').AsString;
		DMCXP.cdsCanje.FieldByName('DOCID').AsString   :=DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
		if Length(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString)>0 then
			DMCXP.cdsCanje.FieldByName('CPSERIE').AsString :=DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString;
		DMCXP.cdsCanje.FieldByName('CPNODOC').AsString :=DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString;
		if DMCXP.cdsCanje.GotoKey then
			DMCXP.cdsCanje.Delete;

		DMCXP.cdsDetCanje.Delete;
	end;
	xGlosa := '';
	while not DMCXP.cdsDetCanje.eof do
	begin
		if xGlosa = '' then
			xGlosa := 'Doc. '+ DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString  + ' - '
		else
			xGlosa := xGlosa + ' - Doc. '+DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString  + ' - ';
		DMCXP.cdsDetCanje.next;
	end;
	DMCXP.cdsLetras.Filtered := True;
	dbgPendientes2.RefreshDisplay;
	bbtnSumatClick(Sender);
end;

procedure TFIntermediacion.dbgDetCanjeMouseDown(Sender: TObject;
          Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDetCanje.BeginDrag(False);
end;

procedure TFIntermediacion.Z2bbtnGrabaClick(Sender: TObject);
var
 xSql : String;
begin
   if DMCXP.cdsDetCxP.RecordCount<=0 then
      raise exception.create('No hay Registros para el Detalle!');

   DMCXP.cdsLetras.Filtered := False;
   DMCXP.cdsDetCanje.DisableControls;
   DMCXP.cdsDetCanje.First;
   DMCXP.cdsDetCanje.EnableControls;
   DMCXP.cdsLetras.Filtered := True;

   DMCXP.cdsMovCxP2.Edit;
   DMCXP.cdsMovCxP2.FieldByName('PROVDES').AsString :=edtProv.Text; // Drescripcion del Proovedor
   //mmy
   // Esto resuelve el problema de la Nota de Crédito que duplica el
   // valor gravado o el IGV
   DMCXP.cdsMovCxP2.FieldByName('CPGRAVAD2').AsFloat:=0;
   DMCXP.cdsMovCxP2.FieldByName('CPIGV2').AsFloat   :=0;
   DMCXP.cdsMovCxP2.FieldByName('CPNOGRAV').AsFloat :=0;
   // fin
   DMCXP.cdsMovCxP2.FieldByName('CPGRAVAD').AsFloat :=0;
   DMCXP.cdsMovCxP2.FieldByName('CPIGV').AsFloat    :=0;
   DMCXP.cdsMovCxP2.FieldByName('CPISC').AsFloat    :=0;
   DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat :=0;
   DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat :=0;
   DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat :=0;

   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.First;
   while not DMCXP.cdsDetCxP.Eof do Begin
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
      //** 17/11/2000 pjsv
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'N';
      //**
      DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString :=dbeLote.Text;
      DMCXP.cdsDetCxP.FieldByName('TMONID').AsString  :=dblcTMon.Text;
      if dblcTMon.Text = DMCXP.wTMonLoc then
      begin
	 DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
	 DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat/DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
      end
      else
      begin
	 DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
	 DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat*DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
      end;
      cdsPost( DMCXP.cdsDetCxP );
      DMCXP.cdsDetCxP.Next;
   end;
   DMCXP.cdsDetCxP.EnableControls;

   // ya k pueden cambiar en cualquier momento se asignan aqui
   DMCXP.cdsMovCxP2.FieldByName('DCPLOTE').AsString   :=dbeLote.Text;
   DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString    :=dblcTMon.Text;
   DMCXP.cdsMovCxP2.FieldByName('CPTCAMPR').AsFloat   :=strtofloat(dbeTCambio.Text);
   DMCXP.cdsMovCxP2.FieldByName('CPTCAMPA').AsFloat   :=strtofloat(dbeTCambio.Text);
   DMCXP.cdsMovCxP2.FieldByName('CPTCAMAJ').AsFloat   :=strtofloat(dbeTCambio.Text);
   DMCXP.cdsMovCxP2.FieldByName('CPFRECEP').AsDateTime:=dbdtpFRecep.Date;
   DMCXP.cdsMovCxP2.FieldByName('CPFEMIS').AsDateTime :=dbdtpFEmis.Date;
   //CARLOS 28/01/2002
   DMCXP.cdsMovCxP2.FieldByName('CPSALORI').AsFloat:=DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat;
   //*
   if dblcTMon.Text = DMCXP.wTMonLoc then
   begin
      DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsString:=DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsString;
      DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat :=FRound(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsMovCxP2.FieldByName('CPTCAMPA').AsFloat,15,2);
      //CARLOS 28/01/2002
      DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsFloat:=DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat;
      DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsMovCxP2.FieldByName('CPTCAMPA').AsFloat,15,2);
      //*
   end
   else
   begin
      DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsString:=DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsString;
      DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat:=FRound(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsMovCxP2.FieldByName('CPTCAMPA').AsFloat,15,2);
      //CARLOS 28/01/2002
      DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsFloat:=DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat;
      DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsMovCxP2.FieldByName('CPTCAMPA').AsFloat,15,2);
      //*
   end;
   cdsPost( DMCXP.cdsMovCxP2 );
   DMCXP.cdsMovCxP2.Post;

   DMCXP.AplicaDatos( DMCXP.cdsMovCxP2, 'MovCxP2'  );
   DMCXP.AplicaDatos( DMCXP.cdsLetras,  'Letras'   );
   DMCXP.AplicaDatos( DMCXP.cdsDetCxP,  'DetCxP'   );
   DMCXP.AplicaDatos( DMCXP.cdsDetCanje,'DetCanje' );
   DMCXP.AplicaDatos( DMCXP.cdsCanje,  'Canje'  );

   FiltraGrids;

   EstadoDeForma(1,DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString,DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString );
   Z2bbtnPreview.Enabled := True;
   ShowMessage('Registro Grabado con Exito... Pulse Intro para continuar');

   xFlagGr := False;
   wRegGrab:=True;
end;

procedure TFIntermediacion.bbtnCancelaClick(Sender: TObject);
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


procedure TFIntermediacion.dblcTipRegExit(Sender: TObject);
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
		if DMCXP.cdsDetCxP.State=dsInsert then
	  	 LlenaDetCxp;

		DMCXP.cdsDetCxP.FieldByName('TREGID').AsString  :=dblcTipReg.Text;
		xWhere := 'TRegId='+''''+dblcTipReg.Text+'''';
		DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString:=BuscaQry('PrvTGE','TGE113','*',xWhere,'TIPDET');

    if DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString='' then
		if DMCXP.cdsQry.fieldbyname('DCPDH').AsString='D' then
			DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString:='H'
		else
			DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString:='D';

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
		dblcdCnpEgr.Enabled:=True;
		DMCXP.cdsCnpEgr.IndexFieldNames:='CptoDes';
		DMCXP.cdsCCosto.IndexFieldNames:='CCosDes';
	end; // si no se apretó botón de cancelar
end;

procedure TFIntermediacion.dblcdCnpEgrExit(Sender: TObject);
var
  xsql,ssql, xWhere : string;
begin
	if xCrea  = true then exit;
	if bbtnRegCanc.Focused then exit;

// Validaciones
	DMCXP.cdsCnpEgr.IndexFieldNames:='CPTOID';
	DMCXP.cdsCnpEgr.SetKey;
	DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString:=dblcdCnpEgr.text;
	if not DMCXP.cdsCnpEgr.Gotokey then
	begin
		ShowMessage('Código de Concepto Errado, intente nuevamente');
		dblcdCnpEgr.Clear;
		dblcdCnpEgr.SetFocus;
		exit;
	end;

	DMCXP.cdsDetCxP.edit;
	DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString:=DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString;

	if DMCXP.wVRN_GlosaDup='N' then
		DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:=DMCXP.cdsCnpEgr.FieldByName('CPTODES').AsString
	else
	begin
		if Length(DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString)=0 then
			DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:=DMCXP.cdsCnpEgr.FieldByName('CPTODES').AsString;
	end;
	xGlosa := DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString;
	xMensaje:='';

   xWhere := 'CIAID ='+QuotedStr(dblcCia.Text)
            +' and CUENTAID ='+QuotedStr(DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString);
	if length(BuscaQry('PrvTGE','TGE202','CUENTAID, CTA_CCOS',xWhere,'CUENTAID'))>0 then
	begin
	 //** (3) si lleva Centro de Costo
		if DMCXP.cdsQry.FieldByName('CTA_CCOS').AsString = 'S' then
		begin
			xCta_Ccos := 'S';
			xWhere := 'CuentaId='+quotedstr(DMCXP.cdsQry.fieldbyname('CUENTAId').AsString);
			if DMCXP.cdsCnpEgr.fieldbyname('CCOSPORCEN').AsString = 'S' then
			begin
			 //** 03/09/2001 - pjsv, si Tiene Marcado el Flag de Distribucion por C.Costo
				xSQL := 'SELECT sum(PORCENTAJE) TOTAL from CXP102  where ciaid='+quotedstr(dblcCia.text)+
										' and CPTOID='+quotedstr(dblcdCnpEgr.text);
				DMCXP.cdsQry3.Close;
				DMCXP.cdsQry3.ProviderName := 'dspTGE';
				DMCXP.cdsQry3.DataRequest(xSql);
				DMCXP.cdsQry3.Open;
			 //** si suman el 100%
				if DMCXP.cdsQry3.FieldByName('TOTAL').AsFloat = 100 then
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
			DMCXP.cdsDetCxP.FieldByname('CCOSID').AsString:='';
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

	if xMensaje = '1' then
	begin
		if strTemp <> dblcdCnpEgr.text then
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
	else
		xDistri := '';

	 //** si la distribucion es Manual y la Cuenta si Tiene Centro de Costo
	if (xDistri = '') and (xCta_Ccos ='S') then
	begin
		if DMCXP.cdsCCosto.recordcount > 0 then
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
end;

procedure TFIntermediacion.bbtnBorraClick(Sender: TObject);
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
            DMCXP.AplicaDatos( DMCXP.cdsMovCxP2, 'MovCxP2' );
            DMCXP.cdsMovCxP2.Insert;
            DMCXP.cdsMovCxP2.FieldByName('DOCID').AsString := wTDoc;
            edtCia.Text   := '';
            edtProv.text  := '';
            edtSerie.Text := '';
				edtNoDoc.Text := '';
				dbeDescCptoTot.Text := '';
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
					dbeDescCptoTot.Text := '';
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

procedure TFIntermediacion.bbtnSumatClick(Sender: TObject);
begin
	 with DMCXP do
	 begin
			CalculaTotalDetCje;
			dbgDetCanje.ColumnByName('CPNoDoc').FooterValue:='Totales';
			if dblcTMon.Text = wTMonExt then
			begin
				 dbgDetCanje.ColumnByName('DCDMoExt').FooterValue:=floattostrf(wTDev2,ffNumber,15,2);
				 //** 13/07/2001 - pjsv
				 If (dbeTCambio.text <> '') and (dbeTCambio.text <> '0') then
						dbgDetCanje.ColumnByName('DCDMoLoc').FooterValue:= floattostrf(wTDev2*StrToFloat(dbeTCambio.text),ffNumber,15,2);
			end
			else
			begin
				 dbgDetCanje.ColumnByName('DCDMoLoc').FooterValue:=floattostrf(wTDev2,ffNumber,15,2);
			//** 13/07/2001 - pjsv
				 If (dbeTCambio.text <> '') and (dbeTCambio.text <> '0') then
						dbgDetCanje.ColumnByName('DCDMoExt').FooterValue:= floattostrf(wTDev2/StrToFloat(dbeTCambio.text),ffNumber,15,2);
			end;
	 end;
end;

procedure TFIntermediacion.bbtnGen302Click(Sender: TObject);
var
   I: Integer;
   wTasa, wSubT, xTotal: Double;
   sResta:string;
begin
   DMCXP.cdsTipReg.IndexFieldNames:='TIPDET';
   xNReg:=0;

// verifica que no exista detalle registrado previamente
   if DMCXP.cdsDetCxP.recordcount>0 then
   begin
      if MessageDlg(' Ya existe Detalle, ¿ reprocesar ?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
      begin
	 DMCXP.cdsDetCxP.EmptyDataSet;
      end;
   end;

// pasa los Totales de DetCanje a DetCXP
   DMCXP.cdsCanje.First;
   while not DMCXP.cdsCanje.EOF do
   begin
      DMCXP.cdsQry5.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
      DMCXP.cdsQry5.Setkey;
      DMCXP.cdsQry5.FieldByName('CIAID').AsString  := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsQry5.FieldByName('PROV').AsString   := DMCXP.cdsCanje.FieldByName('PROV').AsString;
      DMCXP.cdsQry5.FieldByName('DOCID').AsString  := DMCXP.cdsCanje.FieldByName('DOCID').AsString;
      DMCXP.cdsQry5.FieldByName('CPSERIE').AsString:= DMCXP.cdsCanje.FieldByName('CPSERIE').AsString;
      DMCXP.cdsQry5.FieldByName('CPNODOC').AsString:= DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
      if not DMCXP.cdsQry5.GotoKey then
      begin
	 raise exception.Create('Error Documento ya no está en Grid de Facturas a escoger!!!!');
      end;

      DMCXP.cdsDetCxP.Insert;
      LlenaDetCxP;

      DMCXP.cdsTipReg.IndexFieldNames:='TIPDET';
      DMCXP.cdsTipReg.SetKey;
      DMCXP.cdsTipReg.fieldbyname('TIPDET').AsString:='MG';
      DMCXP.cdsTipReg.Gotokey;
				//
      DMCXP.cdsDetCxP.Edit;
      //CLG: 26/02/2003
      // CAMPOS VARIABLES
      DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  :=DMCXP.cdsCanje.FieldByName('CLAUXID').AsString;//dblcClAux.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString :=DMCXP.cdsCanje.FieldByName('PROV').AsString;//dblcdProv.Text;
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    :=DMCXP.cdsCanje.FieldByName('DOCID').AsString;//wTDoc;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  :=DMCXP.cdsCanje.FieldByName('CPSERIE').AsString;//edtSerie.Text;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  :=DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;//edtNoDoc.Text;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  :=DMCXP.cdsQry5.fieldbyname('CPTCAMAJ').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime:=DMCXP.cdsCanje.FieldByName('CPFEMIS').AsDateTime;//dbdtpFEmis.Date;

      DMCXP.cdsDetCxP.FieldByName('TREGID').AsString := DMCXP.cdsTipReg.fieldbyname('TREGID').AsString;
      DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString := DMCXP.cdsTipReg.fieldbyname('TIPDET').AsString;
      sResta:=BuscaQry('dspTGE','TGE110','DOCRESTA','DOCMOD=''CXP'' AND DOCID='+QuotedStr(DMCXP.cdsCanje.FieldByName('DOCID').AsString),'DOCRESTA');
      if sResta='S' then
  	 DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString  := 'H'
      else
  	 DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString  := 'D';

      DMCXP.cdsDetCxP.fieldbyname('CPTOID').AsString  := DMCXP.cdsQry5.fieldbyname('CPTOTOT').AsString;
      DMCXP.cdsDetCxP.fieldbyname('CUENTAID').AsString:= DMCXP.cdsQry5.fieldbyname('CTATOTAL').AsString;

      DMCXP.cdsDetCxP.fieldbyname('DCPGLOSA').AsString:=BuscaQry('dspTGE','TGE201','PROVDES','PROV='+quotedstr(DMCXP.cdsCanje.FieldByName('PROV').AsString),'PROVDES');

      if dblcTMon.Text = DMCXP.wTMonLoc then
      begin
	 DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsCanje.fieldbyname('CPSALLOC').AsFloat;
	 DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsCanje.fieldbyname('CPSALLOC').AsFloat;
	 wSubT := DMCXP.cdsCanje.fieldbyname('CPSALLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat;
	 wSubT := fRound(wSubT,15,2);
	 DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := wSubT;
         if sResta='S' then
  	    xTotal := xTotal-DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
         else
  	    xTotal := xTotal+DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
      end
      else
      begin
	 DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsCanje.fieldbyname('CPSALEXT').AsFloat;
	 DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsCanje.fieldbyname('CPSALEXT').AsFloat;
	 wSubT := DMCXP.cdsCanje.fieldbyname('CPSALEXT').AsFloat*DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat;
	 wSubT := fRound(wSubT,15,2);
	 DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := wSubT;
         if sResta='S' then
  	    xTotal := xTotal-DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat
         else
  	    xTotal := xTotal+DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat;


      end;
      xNReg:=xNReg+1;
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger   :=xNReg;
      
      DMCXP.cdsDetCxP.Post;

      DMCXP.cdsCanje.Next;
   end;

   DMCXP.cdsDetCxP.Insert;
   LlenaDetCxP;

   DMCXP.cdsTipReg.IndexFieldNames:='TIPDET';
   DMCXP.cdsTipReg.SetKey;
   DMCXP.cdsTipReg.fieldbyname('TIPDET').AsString:='TO';
   DMCXP.cdsTipReg.Gotokey;
			//
   DMCXP.cdsDetCxP.Edit;

   //CLG: 26/02/2003
   // CAMPOS VARIABLES
   DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  :=dblcClAux.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString :=dblcdProv.Text;
   DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    :=wTDoc;
   DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  :=edtSerie.Text;
   DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  :=edtNoDoc.Text;
   DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  :=DMCXP.cdsMovCxP2.FieldByName('CPTCAMPR').AsFloat;
   DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime:=dbdtpFEmis.Date;
   DMCXP.cdsDetCxP.FieldByName('TREGID').AsString   := DMCXP.cdsTipReg.fieldbyname('TREGID').AsString;
   DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString   := DMCXP.cdsTipReg.fieldbyname('TIPDET').AsString;
   DMCXP.cdsDetCxP.fieldbyname('DCPDH').AsString    := 'H';
   DMCXP.cdsDetCxP.fieldbyname('CPTOID').AsString   := dblcdCptoTotal.Text;
   DMCXP.cdsDetCxP.fieldbyname('CUENTAID').AsString := wCtaTotal;
   DMCXP.cdsDetCxP.fieldbyname('DCPGLOSA').AsString := edtProv.Text;

   if dblcTMon.Text = DMCXP.wTMonLoc then
   begin
      DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := xTotal;
      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := xTotal;
      wSubT := xTotal/strtofloat(dbeTCambio.Text);
      wSubT := fRound(wSubT,15,2);
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := wSubT;
   end
   else
   begin
      DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := xTotal;
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := xTotal;
      wSubT := xTotal*strtofloat(dbeTCambio.Text);
      wSubT := fRound(wSubT,15,2);
      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := wSubT;
   end;
   xNReg:=xNReg+1;
   DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger   :=xNReg;
   DMCXP.cdsDetCxP.Post;

   DMCXP.cdsTipReg.IndexFieldNames:='TREGID';
end;


procedure TFIntermediacion.GeneraDiferenciaCambio;
var
   xDebe, xHabe, xDifCam, xDifCLoc : Double;
   xCtaDif, xGloDif, xDH, xSQL : String;
begin

   // Falta completar el SQL y el while
   xSQL:='Select * from CXP302 '
        +'Where CIAID='''   +DMCXP.cdsDetCxP.FieldByName('CIAID').AsString   +''' AND '
        +      'TDIARID=''' +DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString +''' AND '
        +      'DCPANOMM='''+DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString+''' AND '
        +      'CPNOREG=''' +DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString +''' ';
   DMCXP.cdsQry6.Close;
   DMCXP.cdsQry6.IndexFieldNames:='';
   DMCXP.cdsQry6.Filter  :='';
   DMCXP.cdsQry6.Filtered:=False;
   DMCXP.cdsQry6.DataRequest( xSQL );
   DMCXP.cdsQry6.Open;

   xNReg:=DMCXP.cdsQry6.RecordCount;

   while not DMCXP.cdsQry6.Eof do begin
      xDebe:=FRound(DMCXP.cdsQry6.FieldByName('DCPMOEXT').AsFloat*DMCXP.cdsQry6.FieldByName('CPTCAMPR').AsFloat,15,2);
      xHabe:=FRound(DMCXP.cdsQry6.FieldByName('DCPMOEXT').AsFloat*DMCXP.cdsQry6.FieldByName('CPTCAMPA').AsFloat,15,2);

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
         DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsQry6.FieldByName('CIAID').AsString;
         DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsQry6.FieldByName('TDIARID').AsString;
         DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := 'NC';
         DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsQry6.FieldByName('CPNOREG').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := copy(DMCXP.cdsQry6.FieldByName('DCPANOMM').AsString,1,4);
         DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsQry6.FieldByName('DCPANOMM').AsString;
         DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
         DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := dblcdProv.Text;
         DMCXP.cdsDetCxP.FieldByName('PROVRUC').AsString  := dblcdProvRuc.Text;
         DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsQry6.FieldByName('DOCID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := DMCXP.cdsQry6.FieldByName('CPSERIE').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsQry6.FieldByName('CPNODOC').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsQry6.FieldByName('CPTCAMPR').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat  := DMCXP.cdsQry6.FieldByName('CPTCAMPA').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDatetime:= DMCXP.cdsQry6.FieldByName('CPFEMIS').AsDatetime;
         DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDatetime:= DMCXP.cdsQry6.FieldByName('DCPFCOM').AsDatetime;
         DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := DMCXP.cdsQry6.FieldByName('DCPLOTE').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'P'; // Pendiente
         DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
         DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime:= Date;
         DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime:= Time;

         DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString :=DMCXP.cdsQry6.FieldByName('DCPANOC').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString   :=DMCXP.cdsQry6.FieldByName('DCPMM').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString   :=DMCXP.cdsQry6.FieldByName('DCPDD').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString  :=DMCXP.cdsQry6.FieldByName('DCPTRI').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString  :=DMCXP.cdsQry6.FieldByName('DCPSEM').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString   :=DMCXP.cdsQry6.FieldByName('DCPSS').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString:=DMCXP.cdsQry6.FieldByName('DCPAATRI').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString:=DMCXP.cdsQry6.FieldByName('DCPAASEM').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString :=DMCXP.cdsQry6.FieldByName('DCPAASS').AsString;

         DMCXP.cdsDetCxP.FieldByName('FLAGVAR').AsString :='DC';
         DMCXP.cdsDetCxP.FieldByName('TMONID').AsString  := dblcTMon.Text;

         //DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := xLote;
         DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
         DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xCtaDif;
         DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGloDif;
         DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := xDH;
         //
         if DMCXP.cdsCanje.FieldByName('TMONID').AsString=DMCXP.wTMonExt then begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := 0; // FRound(xDifCam,15,2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(xDifCam,15,2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := 0;
            end
         else begin
            DMCXP.cdsDetCxP.FieldByName('DCPMoOri').AsFloat := 0; //FRound(xDifCam,15,2);
            DMCXP.cdsDetCxP.FieldByName('DCPMoLoc').AsFloat := 0;
            DMCXP.cdsDetCxP.FieldByName('DCPMoExt').AsFloat := FRound(xDifCam,15,2);
         end;

         xNReg:=xNReg+1;
         DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger   :=xNReg;
         cdsPost( DMCXP.cdsDetCxP );
      end;
      DMCXP.cdsQry6.Next;
   end;
   DMCXP.AplicaDatos( DMCXP.cdsDetCxP,  'DetCxP'   );
end;


procedure TFIntermediacion.dbgDetCxPEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   if Target=bbtnDel1 then begin
      if DMCXP.cdsDetCxP.RecordCount > 0 then DMCXP.cdsDetCxP.Delete;
      if (DMCXP.cdsDetCxP.RecordCount=0) and (wTDev2>0) then bbtnGen302.Enabled:=True;
   end;
end;

procedure TFIntermediacion.dbgDetCxPMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     dbgDetCxP.BeginDrag(False);
end;

procedure TFIntermediacion.bbtnDel1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
     Accept:=True;
end;

procedure TFIntermediacion.bbtnCalcClick(Sender: TObject);
begin
	WinExec('C:\windows\calc.exe',1 );  // Executa Aplicación
end;

procedure TFIntermediacion.edtNoDocExit(Sender: TObject);
begin
   If xCrea then Exit;

   if bbtnBorra.Focused then Exit;

   if edtNoDoc.Text='' then
   begin
      ShowMessage('Falta No. de Documento');
      edtNoDoc.SetFocus;
      exit;
   end;

   if DMCXP.BuscaCxPDoc( dblcCia.Text,dblcdProv.Text,wTDoc,edtSerie.Text,edtNoDoc.Text) then begin
      edtNoDoc.SetFocus;
      Raise Exception.Create('Documento ya Fue Registrado');
   end;
   DMCXP.cdsMovCxP2.Edit;
   DMCXP.cdsMovCxP2.FieldByName('CPSERIE').AsString:= edtSerie.Text;
   DMCXP.cdsMovCxP2.FieldByName('CPNODOC').AsString:= edtNoDoc.Text;

   if dtpFComp.Date=0 then dtpFComp.SetFocus;

end;


procedure TFIntermediacion.Z2bbtnContabClick(Sender: TObject);
var
   xSQL : String;
begin
   //** 13/09/2001 - pjsv
   If DMCXP.MesCerrado(copy(xAnomes,5,2),copy(xAnomes,1,4),dblcCia.text) then
    begin
     ShowMessage(' Mes cerrado, no se puede contabilizar');
     exit;
    end;
   //**

   DMCXP.cdsMovCxP2.Edit;
   DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString :='S';
   cdsPost( DMCXP.cdsMovCxP2 );
   DMCXP.AplicaDatos( DMCXP.cdsMovCxP2, 'MovCxP2' );

   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.ReadOnly:=False;
   DMCXP.cdsDetCxP.First;

   GeneraDiferenciaCambio;

   DMCXP.GeneraContab(dblcCia.Text, wTDiar, DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString, DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString, Self, 'C' );

   xsql:='DELETE FROM CXP302 '
           +'WHERE CIAID='   +quotedstr( dblcCia.text)+' and '
           +      'TDIARID=' +quotedstr(wTdiar)              +' and '
           +      'DCPANOMM='+quotedstr(xAnomes)             +' and '
           +      'CPNOREG=' +quotedstr(dbeNoReg.text)       +' and '
           +      'FLAGVAR=''DC'' ';
   DMCXP.cdsCxP.Close;
   DMCXP.cdsCxP.DataRequest(xSQL);
   try
     DMCXP.cdsCxP.Execute;
   except
   end;

   FiltraGrids;

   EstadoDeForma(1,DMCXP.cdsMovCxP2.FieldByName('CPEstado').AsString,DMCXP.cdsMovCxP2.FieldByName('CP_Conta').AsString );

   while not DMCXP.cdsDetCxP.Eof do Begin
      DMCXP.cdsDetCxP.Edit;
      DMCXP.cdsDetCxP.FieldByName('DCPFLCDR').AsString:='S';
      cdsPost( DMCXP.cdsDetCxP );
      DMCXP.cdsDetCxP.Next;
   end;

   DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DetCxP' );
   DMCXP.cdsDetCxP.ReadOnly:=True;
   DMCXP.cdsDetCxP.EnableControls;
   Z2bbtnContab.enabled := False;

   ShowMessage('Registro Contabilizado... Pulse Intro para continuar');
end;

procedure TFIntermediacion.Z2bbtnNuevoClick(Sender: TObject);
begin
	  // si no es NC Contabilizada existente Ó Anulado ---> para evitar confirmacion
	  if not(wRegGrab) then begin   // si no viene de bbtnGrabar
		  if MessageDlg('Registra un Nuevo Documento'+chr(13)+
			 '          ¿Esta Seguro?  ',mtConfirmation, [mbYes, mbNo], 0)=mrNo
		  then exit;
	  end;
	  If ( DMCXP.wModo='A' ) and ( xFlagGr ) then begin
		  DMCXP.cdsMovCxP2.Delete;
		  DMCXP.AplicaDatos( DMCXP.cdsMovCxP2, 'MovCxP2' );
	  end;
    
     //ANAX AGREGADO POR ANA
     if DMCXP.wModo='A' then
   	begin
         DMCXP.cdsMovCxP2.Insert;
         DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString := wTDoc;
         edtCia.Text   := '';
         edtProv.text  := '';
         edtSerie.Text := '';
         edtNoDoc.Text := '';
         edtTMon.Text  := '';
         dbeDescCptoTot.text:='';
	   end;
      //ANAX FIN DE AGREGACION


	  pnlPie.Enabled:=False;
	  pnlDetalle.Enabled:=False;
	  Z2bbtnAcepta.Enabled:=True;
	  Z2bbtnAnula.Enabled :=True;
	  CompntesEnabled(True);  // Pape1,2,3 - Sumat,2 - btCont - btOk - pnlPtes,2
	  pgctDocumentos.ActivePageIndex:= 0;
	  dbgDetCanje.ColumnByName('DCDMoLoc').FooterValue:='';
	  dbgDetCanje.ColumnByName('DCDMoExt').FooterValue:='';
	  InicializaCds;
	  pnlCabecera.Enabled:=True;
	  InicializaVars;
	  if (wRegGrab) then exit;   // si viene de bbtnGrabar
	  Z2bbtnGraba.Enabled:=True;

	  dbgDetCanje.ReadOnly:=False;
	  dbgDetCxP.ReadOnly  :=False;
	  Z2bbtnPreview.Enabled := False;
	  bbtnBorra.Click;
end;

procedure TFIntermediacion.dbgDetCanjeColExit(Sender: TObject);
begin
     if dbgDetCanje.SelectedField.FieldName='DCDTCAMB' then dbgDetCanje.RefreshDisplay;
     If DMCXP.wVRN_PagosParciales='S' then
      begin
        if (dbgDetCanje.SelectedField.FieldName='DCDMOLOC') and (DMCXP.cdsDetCanje.FieldByName('CIAID').AsString<>'') then
         begin
           if DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat>DMCXP.cdsDetCanje.FieldByName('SALLOC').AsFloat then
            begin
              DMCXP.cdsDetCanje.Edit;
                DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := DMCXP.cdsDetCanje.FieldByName('CJEANTMN').AsFloat;
                //** 26/07/2001 - pjsv - es el campo contrario
					 DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat  := DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
                //**
                DMCXP.cdsDetCanje.Post;
                raise exception.create('Error: Monto no debe ser mayor al Saldo');
            end
           else  //** 16/07/2001 - pjsv
            begin
             DMCXP.cdsDetCanje.Edit;
             DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat:= DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat / StrToFloat(dbeTCambio.text);
             TNumericField(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT')).DisplayFormat := '###,###,##0.00';
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
            end
           else
            begin //** 16/07/2001 - pjsv
             DMCXP.cdsDetCanje.Edit;
             DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat:= DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat * StrToFloat(dbeTCambio.text);
             TNumericField(DMCXP.cdsDetCanje.FieldByName('DCDMOLOC')).DisplayFormat := '###,###,##0.00';
              //** 26/07/2001 - pjsv - es el campo contrario
              DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat  := DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
              //**
             DMCXP.cdsDetCanje.Post;
            end; //**
         end
        else  bbtnSumatClick(Sender);
      end
end;

procedure TFIntermediacion.Z2bbtnAnulaClick(Sender: TObject);
begin
   DMCXP.cdsMovCxP2.Edit;
   DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString:='A';
   cdsPost( DMCXP.cdsMovCxP2 );
   DMCXP.AplicaDatos( DMCXP.cdsMovCxP2, 'MovCxP2' );

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
	DMCXP.AplicaDatos( DMCXP.cdsLetras, 'Letras' );
	DMCXP.cdsLetras.EnableControls;
	DMCXP.cdsLetras.Filtered := True;

	FiltraGrids;

	EstadoDeForma(1,DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString,DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString );

	ShowMessage('Registro Anulado... Pulse Intro para continuar');
end;

procedure TFIntermediacion.Z2bbtnAceptaClick(Sender: TObject);
//Var
 //xNmes,xtmonid,xano,xmes,xsql, ssql : string;
 //iX : integer;
begin
   if wTDev2=0 then
      raise exception.Create('Información Incompleta en Cancelación');
   if DMCXP.cdsDetCxP.RecordCount=0 then raise exception.Create('Ingrese Detalle Contable');
   if not VerificaTotal( ) then raise exception.Create('TOTAL no cuadra con Total de Documentos seleccionados');
   if not CuadraDH( ) then raise exception.Create('Error:  Asiento No Cuadra');

   try
      DMCXP.cdsDetCxP.DisableControls;
      screen.Cursor := crHOURGLASS;
      pnlActuali.Visible := true;
      pnlActuali.Refresh;

      DMCXP.cdsMovCxP2.Edit;
      DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString :='P';
      cdsPost( DMCXP.cdsMovCxP2 );

      DMCXP.AplicaDatos( DMCXP.cdsMovCxP2, 'MovCxP2' );

      DMCXP.HalloCXPREG(dblcCia.text,wTDiar,xAnomes,xNRegistro) ;

      DMCXP.cdsLetras.Filtered := False;
      DMCXP.cdsDetCanje.DisableControls;
      DMCXP.cdsDetCanje.First;
      // Actualiza Montos Pagados y Saldos en CXP301 (Docs. a los k aplica la NC)
      while not DMCXP.cdsDetCanje.Eof do
      begin
	 if Length(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString)=0 then
	 	DMCXP.cdsLetras.IndexFieldNames:='CIAID;PROV;DOCID;CPNODOC'
	 else DMCXP.cdsLetras.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
	 DMCXP.cdsLetras.Setkey;
	 DMCXP.cdsLetras.FieldByName('CIAID').AsString  := DMCXP.cdsDetCanje.FieldByName('CIAID').AsString;
	 DMCXP.cdsLetras.FieldByName('PROV').AsString   := DMCXP.cdsDetCanje.FieldByName('PROV').AsString;
	 DMCXP.cdsLetras.FieldByName('DOCID').AsString  := DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
	 if Length(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString)>0 then
	 	DMCXP.cdsLetras.FieldByName('CPSERIE').AsString:= DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString;
	 DMCXP.cdsLetras.FieldByName('CPNODOC').AsString:=DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString;
	 if DMCXP.cdsLetras.GotoKey then
	  begin
	 	DMCXP.cdsLetras.Edit;
	 	DMCXP.cdsLetras.FieldByName('CPPAGORI').AsFloat:=DMCXP.cdsLetras.FieldByName('CPPAGORI').AsFloat+DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat;
	 	DMCXP.cdsLetras.FieldByName('CPPAGLOC').AsFloat:=DMCXP.cdsLetras.FieldByName('CPPAGLOC').AsFloat+DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
	 	DMCXP.cdsLetras.FieldByName('CPPAGEXT').AsFloat:=DMCXP.cdsLetras.FieldByName('CPPAGEXT').AsFloat+DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
	 	if dblcTMon.Text = DMCXP.wTMonLoc then
	 	begin
	 		DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat:=DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat-DMCXP.cdsLetras.FieldByName('CPPAGLOC').AsFloat;
	 		DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat:=DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat-DMCXP.cdsLetras.FieldByName('CPPAGEXT').AsFloat;
	 		DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat:= DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat
	 	end
	 	else
	 	begin
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

      if DMCXP.cdsCia.FieldByName('PRORATEO').AsString='S' then begin
         if DMCXP.cdsMovCxP.FieldByName('CPIGV2').AsFloat>0 then
            FToolCont.Prorrateo(dblcCia.text,wTDiar,DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString,dbeNoReg.text);
      end;

      DMCXP.SaldosAuxiliar( DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString,DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString,
      			  DMCXP.cdsMovCxP2.FieldByName('CLAUXID').AsString, DMCXP.cdsMovCxP2.FieldByName('PROV').AsString,'-',
      			  DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat,DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat,
      			  DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString);
      DMCXP.cdsLetras.Filtered := True;
      DMCXP.cdsDetCanje.EnableControls;

      DMCXP.AplicaDatos( DMCXP.cdsLetras,  'Letras' );
      FiltraGrids;
      EstadoDeForma(1,DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString,DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString );

      // VHN  pRESUPUESTOS
      //if wActuaPresu then CalculoNivel;

      ShowMessage('Registro Aceptado... Pulse Intro para continuar');
   Finally
      DMCXP.cdsDetCxP.EnableControls;
      pnlActuali.Visible := false;
      screen.Cursor := crDEFAULT;
   end;
end;


//////  F U N C I O N E S   //////
procedure TFIntermediacion.CamposKEnabled(PVal:Boolean);
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

procedure TFIntermediacion.CompntesEnabled(PVal:Boolean);
begin
   bbtnDel1.Enabled      :=PVal;
   bbtnSumat.Enabled     :=PVal;
   Z2bbtnContab.Enabled    :=PVal;
	bbtnOK.Enabled        :=PVal;
	pnlPendientes2.Visible:=PVal;
end;

function TFIntermediacion.VerificaTotal:Boolean;
begin
   with DMCXP do Begin
	  cdsDetCxP.IndexFieldNames:='CiaId;TDiarId;CPNoReg;DCPAnoMM;TipDet';   //Busca Monto total en DetCxP
	  cdsDetCxP.SetKey;
	  cdsDetCxP.FieldByName('CIAID').AsString   := dblcCia.Text;      // ojo, debería ser del MovCxP2 ?
	  cdsDetCxP.FieldByName('TDIARID').AsString := wTDiar;            // ojo, debería ser del MovCxP2 ?
	  cdsDetCxP.FieldByName('CPNOREG').AsString := dbeNoReg.Text;   // ojo, debería ser del MovCxP2 ?
	  cdsDetCxP.FieldByName('DCPANOMM').AsString:= cdsMovCxP2.FieldByName('CPANOMES').AsString;
	  cdsDetCxP.FieldByName('TIPDET').AsString  := 'TO';
	  if not(cdsDetCxP.Gotokey)
     then raise exception.Create('No hay un TOTAL definido en Asignación')
     else begin
			 cdsDetCxP.IndexFieldNames:='';
          if FRound(wTDev2,15,2) <> FRound(cdsDetCxP.FieldByName('DCPMOORI').AsFloat,15,2) then result:=False
          else result:=True;
     end;
	end;
end;

function TFIntermediacion.CuadraDH:Boolean;
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
   End;
end;


procedure TFIntermediacion.dblcTMonExit(Sender: TObject);
var
	xWhere : string;
begin
	If xCrea then Exit;
  if bbtnBorra.Focused then Exit;

	dblcTMon.Text:=Uppercase(dblcTMon.Text);
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

procedure TFIntermediacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
  	If ( DMCXP.wModo='A' ) and ( xFlagGr ) then begin
       DMCXP.cdsMovCxP2.Delete;
		   DMCXP.AplicaDatos( DMCXP.cdsMovCxP2, 'MovCxP2' );
  	end
  	else
	  	 DMCXP.cdsMovCxP2.CancelUpdates;

  	If DMCXP.cdsLetras.active then
	  	 DMCXP.cdsLetras.CancelUpdates;
  	DMCXP.cdsDetCxP.CancelUpdates;
	  DMCXP.cdsMovCxP.CancelUpdates;
  	DMCXP.cdsCanje.CancelUpdates;
    DMCXP.cdsDetCanje.CancelUpdates;
    DMCXP.cdsLetras.Filtered := False;

	  DMCXP.cdsMovCxP.ReadOnly  := False;
    DMCXP.cdsCanje.ReadOnly   := False;
    DMCXP.cdsLetras.ReadOnly  := False;
    DMCXP.cdsDetCanje.ReadOnly:= False;
	  DMCXP.cdsDetCxP.ReadOnly  := False;
  except
  end;

  FVariables.w_OP_Registro:=False;
//  FVariables.ActualizaFiltro( DMCXP.cdsMovCxP2, FPrincipal.GIntermediacion, DMCXP.wModo );
   if not (FPrincipal.GIntermediacion=nil) then
      FPrincipal.GIntermediacion.RefreshFilter;

  Action:=caFree;
end;

procedure TFIntermediacion.MuestraEstado( xMovEstado, xMovConta : String ) ;
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


procedure TFIntermediacion.EstadoDeBotones( xMovEstado, xMovConta : String );
begin

   bbtnCalc.Enabled    := True;
   bbtnSumat.Enabled   := False;
   bbtnRegresa.Enabled    := False;
   bbtnCancela.Enabled := False;
   Z2bbtnGraba.Enabled  := False;
   Z2bbtnAcepta.Enabled  := False;
	Z2bbtnAnula.Enabled   := False;
   Z2bbtnImprime.Enabled := False;
   Z2bbtnPreview.Enabled:= False;
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
      Z2bbtnImprime.Enabled  := True;
      Z2bbtnPreview.Enabled:= True;
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
            Z2bbtnImprime.Enabled := True;
            Z2bbtnPreview.Enabled:= True;
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
               Z2bbtnImprime.Enabled := True;
               Z2bbtnPreview.Enabled:= true;
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

procedure TFIntermediacion.IniciaBotonesDetalle;
begin

   bbtnCalc.Enabled      := True;
   bbtnSumat.Enabled     := False;
   bbtnRegresa.Enabled   := False;
   bbtnCancela.Enabled   := False;
   Z2bbtnGraba.Enabled   := False;
   Z2bbtnAcepta.Enabled  := False;
   Z2bbtnAnula.Enabled   := False;
	Z2bbtnImprime.Enabled := False;
   Z2bbtnPreview.Enabled:= False;
   Z2bbtnContab.Enabled  := False;
   Z2bbtnNuevo.Enabled   := False;
end;


procedure TFIntermediacion.bbtnRegresaClick(Sender: TObject);
begin

   EstadoDeForma(0,DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString,DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString );

end;

procedure TFIntermediacion.dbeTCambioExit(Sender: TObject);
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

procedure TFIntermediacion.edtSerieExit(Sender: TObject);
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

procedure TFIntermediacion.edtSerieKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then edtNoDoc.setfocus;
end;

procedure TFIntermediacion.dblcCiaKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dblcdProv.setfocus;
end;

procedure TFIntermediacion.dbeNoRegExit(Sender: TObject);
begin
   If xCrea then Exit;

   if (not( bbtnBorra.Focused)) and (not( dtpFComp.Focused))then begin

		dbeNoReg.Text := StrZero(dbeNoReg.Text,DMCXP.cdsMovCxP2.FieldByName('CPNOREG').Size);

      if DMCXP.BuscaCxPReg(dblcCia.Text,wTDiar,wAnoMM,dbeNoReg.Text) then begin
         dbeNoReg.SetFocus;
         Raise Exception.Create( 'No.de Registro Duplicado' );
      end;
      //** 06/09/2001 - pjsv, se utiliza en la llamada al prorrateo
      xNRegistro := dbeNoReg.Text;
      //**

      pnlCab1.Enabled := False;
      dtpFComp.Enabled:= False;
      dbeNoReg.Enabled   := False;
      dbeNoReg.Text := DMCXP.GrabaUltimoRegistro(xTAutoNum,dblcCia.Text,wTDiar,xTAno,xTMes,StrToInt(dbeNoReg.Text));
      DMCXP.cdsMovCxP2.FieldByName('CPTCAMPR').AsFloat := FRound(xxTCambio,7,3);
      DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString :=wTDiar;
      DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString := StrZero(dbeNoReg.Text,DMCXP.cdsMovCxP2.FieldByName('CPNOREG').Size);
      DMCXP.cdsMovCxP2.FieldByName('CPSERIE').AsString := edtSerie.Text;
      DMCXP.cdsMovCxP2.FieldByName('CPNODOC').AsString := edtNoDoc.Text;
      DMCXP.cdsMovCxP2.FieldByName('CPUSER').AsString  :=DMCXP.wUsuario;
      DMCXP.cdsMovCxP2.FieldByName('CPFREG').AsDateTime:=date;
		DMCXP.cdsMovCxP2.FieldByName('CPHREG').AsDateTime:=time;
      cdsPost( DMCXP.cdsMovCxP2 );

      DMCXP.AplicaDatos( DMCXP.cdsMovCxP2, 'MovCxP2' );
      xFlagGr := True;
   end;
end;

procedure TFIntermediacion.dblcdProvKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dblcdProvRuc.setfocus;
end;

procedure TFIntermediacion.dblcdProvRucKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then edtSerie.setfocus;
end;

procedure TFIntermediacion.edtNoDocKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dtpFComp.setfocus;
end;

procedure TFIntermediacion.dtpFCompKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dbeNoReg.setfocus;
end;

procedure TFIntermediacion.dbeNoRegKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dbeLote.setfocus;
end;

procedure TFIntermediacion.dbeLoteKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dblcTMon.setfocus;
end;

procedure TFIntermediacion.dblcTMonKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dbeTCambio.setfocus;
end;

procedure TFIntermediacion.dbeTCambioKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dbdtpFRecep.setfocus;
end;

procedure TFIntermediacion.dbdtpFRecepKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then dbdtpFEmis.setfocus;
end;

procedure TFIntermediacion.dbdtpFEmisKeyPress(Sender: TObject; var Key: Char);
begin
   If Key=#13 then bbtnOK.setfocus;
end;

procedure TFIntermediacion.btnActRegClick(Sender: TObject);
begin
	pnlDetCxP.Enabled  := False;
	pnlRegistro.Visible:= True;
	pnlRegistro.SetFocus;
	DMCXP.cdsDetCxP.Insert;
   dblcTipReg.Enabled:= True;
   dblcTipReg.Text   := '';
   dblcTipReg.SetFocus;
end;

procedure TFIntermediacion.bbtnRegOkClick(Sender: TObject);
var
xSql : String;
xDiferencia,xMontoOri : Double;
xRecord : Integer;
begin
	xTemTReg  := DMCXP.cdsDetCxP.FieldByName('TREGID').AsString;
	xTemCpto  := DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString;
	xTemCta   := DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString;
	xTemDH    := DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString;
	//** 18/12/2000 - pjsv - para presupuesto
	xtippre   := dblcTipPre.Text;
	//**
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
		  cdsPost( DMCXP.cdsDetCxP );
		  //** inserta un nuevo registro
		  DMCXP.cdsDetCxP.Insert;
		  dblcTipReg.Text := xTemTReg;
		  DMCXP.cdsDetCxP.FieldByName('TREGID').AsString   := xTemTReg;
		  DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   := xTemCpto;
		  DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xTemCta;
		  DMCXP.cdsDetCxP.FieldByName('DCPDH').ASString    := xTemDH;
		  DMCXP.cdsDetCxP.FieldByName('TIPPRESID').AsString := xTipPre;
		  edtCCosto.Text := '';
		  dblcTipReg.Enabled:=True;
		  dblcTipReg.SetFocus;
		end
	  else
		begin
		  cdsPost( DMCXP.cdsDetCxP );
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
				DMCXP.cdsDetCxP.FieldByName('TIPPRESID').AsString := xTipPre;
				//** cargo glosa
				if Length(DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString)=0 then
				 DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGlosa;
				edtCCosto.Text := '';
			  end;
		  end
		 else
		  begin
			 cdsPost( DMCXP.cdsDetCxP );
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
	 pnlDetCxP.Enabled:= True;
end;

procedure TFIntermediacion.bbtnRegCancClick(Sender: TObject);
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

procedure TFIntermediacion.dbeDHExit(Sender: TObject);
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

procedure TFIntermediacion.dblcdCCostoExit(Sender: TObject);
begin
   if not bbtnRegCanc.Focused then begin
      edtCCosto.Text:=DMCXP.DisplayDescrip('TGE203','CCOSDES','CCOSID',dblcdCCosto.Text);
      if length(DMCXP.DisplayDescrip('TGE203','CCOSDES','CCOSID',dblcdCCosto.Text))=0 then
      begin

			raise exception.Create('Centro de Costo Errado');
      end;
   end;
end;

procedure TFIntermediacion.dbeImporteExit(Sender: TObject);
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

procedure TFIntermediacion.dbgDetCxPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if not btnActReg.Enabled then Exit;

   if (key=VK_Delete) and (ssCtrl in Shift) then
   begin
      if MessageDlg('¿Esta Seguro de Eliminar Registro?',mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      begin
         DMCXP.cdsDetCxP.Delete;
      end;
   end;
end;

procedure TFIntermediacion.dbgDetCxPDblClick(Sender: TObject);
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

procedure TFIntermediacion.dbgDetCanjeCalcCellColors(Sender: TObject;
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

procedure TFIntermediacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;


procedure TFIntermediacion.FormCreate(Sender: TObject);
begin
   If DMCXP.wAdmin='G' then begin
      DMCXP.wObjetoDesPr := Caption;
      FPrincipal.ListaComponentes(Self);
   end;

   CargaDataSource;

end;


procedure TFIntermediacion.CargaDataSource;
begin
   dblcCia.DataSource        :=DMCXP.dsMovCxP2;
   dblcCia.LookupTable       :=DMCXP.cdsCia;
   dblcClAux.DataSource      :=DMCXP.dsMovCxP2;
   dblcClAux.LookupTable     :=DMCXP.cdsClAux;
   dblcdProv.DataSource      :=DMCXP.dsMovCxP2;
   dblcdProv.LookupTable     :=DMCXP.cdsProv;
   dblcdProvRuc.DataSource   :=DMCXP.dsMovCxP2;
   dblcdProvRuc.LookupTable  :=DMCXP.cdsProv;
   dtpFComp.DataSource       :=DMCXP.dsMovCxP2;
   dbeNoReg.DataSource       :=DMCXP.dsMovCxP2;
   dbeLote.DataSource        :=DMCXP.dsMovCxP2;
   dblcTMon.DataSource       :=DMCXP.dsMovCxP2;
   dblcTMon.LookupTable      :=DMCXP.cdsTMon;
   dbeTCambio.DataSource     :=DMCXP.dsMovCxP2;
   dbdtpFRecep.DataSource    :=DMCXP.dsMovCxP2;
   dbdtpFEmis.DataSource     :=DMCXP.dsMovCxP2;
   dblcdCptoTotal.DataSource :=DMCXP.dsMovCxP2;
   dblcdCptoTotal.LookupTable:=DMCXP.cdsCnpEgr;

   dblcTipReg.DataSource     :=nil;
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

   dbgPendientes2.DataSource :=DMCXP.dsLetras;
   dbgDetCanje.DataSource    :=DMCXP.dsDetCanje;
   dbgDetCxP.DataSource      :=DMCXP.dsDetCxP;
end;


procedure TFIntermediacion.dblcdProvEnter(Sender: TObject);
begin
   if DMCXP.wVRN_ProvOrden<>'' then
      DMCXP.cdsProv.IndexFieldNames:=DMCXP.wVRN_ProvOrden
   else begin
      DMCXP.cdsProv.IndexFieldNames:='Prov';
   end;
end;

procedure TFIntermediacion.dblcdProvRucEnter(Sender: TObject);
begin
   DMCXP.cdsProv.IndexFieldNames:='ProvDes';
end;

procedure TFIntermediacion.dblcClAuxExit(Sender: TObject);
var
	xWhere : String;
begin
  if xCrea then Exit;
  if bbtnBorra.Focused then Exit;

	dblcClAux.Text:=Uppercase(dblcClAux.Text);
  xWhere:='CLAUXID='''+dblcClAux.Text+''' AND MODULO LIKE ''%'+DMCXP.wModulo+'%''';
  if length(BuscaQry('dspTGE','TGE102','CLAUXDES',xWhere,'CLAUXDES'))=0 then
  begin
  	dblcClAux.SetFocus;
    Raise Exception.Create('Clase de Auxiliar');
  end;
  Screen.Cursor:=crHourGlass;
  Filtracds( DMCXP.cdsProv,'SELECT * FROM TGE201 WHERE CLAUXID='''+dblcClAux.Text+'''' );
  if Length(dblcdProv.Text)>0 then
  begin
  	xWhere:='CLAUXID='''+dblcClAux.Text+''' AND PROV='''+dblcdProv.Text+'''';
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
procedure TFIntermediacion.CalculoNivel;
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
procedure TFIntermediacion.CreaSuperior;
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
procedure TFIntermediacion.inicializoCero;
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
procedure TFIntermediacion.CalculoNivelSupe;
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

procedure TFIntermediacion.dblcTipPreExit(Sender: TObject);
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

procedure TFIntermediacion.dblcdPresupExit(Sender: TObject);
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

procedure TFIntermediacion.Z2bbtnPreviewClick(Sender: TObject);
var
  xSQL, xFiltro : string;
  ssql,xliq : string;
  TSimbolo,TMoneda : String;
  xTotHaber:double;
begin
   if DMCXP.wAdmin='G' then Exit;

   if DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString<>'S' then begin

      if not AsientoCuadra then
         raise exception.Create('Error:  Asiento No Cuadra');

      xSQL:='delete FROM CNT311 Where CIAID='+quotedstr(dblcCia.text) +' and '+
            'CNTANOMM='+quotedstr(xAnomes) +' and '+
            'TDIARID='+quotedstr(wTdiar) +' and '+
           'CNTCOMPROB='+quotedstr(dbeNoReg.text);
      Try
        DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
      except
      end;

      xSQL:='delete FROM CNT310 Where CIAID='+quotedstr(dblcCia.text) +' and '+
            'CNTANOMM='+quotedstr(xAnomes) +' and '+
            'TDIARID='+quotedstr(wTdiar) +' and '+
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
               FToolCont.Prorrateo(dblcCia.text,wTDiar,xAnomes,xNRegistro);

         end
         else
            if (DMCXP.cdsCia.FieldByName('IGVSN').AsString='2') then
            begin
               if DMCXP.cdsMovCxP2.FieldByName('CPIGV').AsFloat>0 then
                  FToolCont.Prorrateo(dblcCia.text,wTDiar,xAnomes,xNRegistro);
            end;
      end;

      GeneraDiferenciaCambio;

      DMCXP.GeneraContab(dblcCia.Text, wTDiar, xAnomes, xNRegistro, Self, 'P' );

      xsql:='DELETE FROM CXP302 '
           +'WHERE CIAID='   +quotedstr( dblcCia.text)+' and '
           +      'TDIARID=' +quotedstr(wTdiar)              +' and '
           +      'DCPANOMM='+quotedstr(xAnomes)             +' and '
           +      'CPNOREG=' +quotedstr(dbeNoReg.text)       +' and '
           +      'FLAGVAR=''DC'' ';
      DMCXP.cdsCxP.Close;
      DMCXP.cdsCxP.DataRequest(xSQL);
      try
        DMCXP.cdsCxP.Execute;
      except
      end;

      xFiltro:= 'CIAID    =''' + dblcCia.Text  + ''' and '
			  + 'TDIARID  =''' + DMCXP.cdsMovCxP2.fieldbyname('TDIARID').AsString  + ''' and '
			  + 'DCPANOMM =''' + DMCXP.cdsMovCxP2.fieldbyname('CPANOMES').AsString + ''' and '
			  + 'CPNOREG  =''' + dbeNoReg.Text  + '''' ;
      Filtracds( DMCXP.cdsDetCxP,'Select * from CXP302 Where '+xFiltro );

      DMCXP.cdsCXP.Data:=DMCXP.cdsMovCnt.data;
   end
   else begin

      xsql:='SELECT * FROM CNT301 '
           +'WHERE CIAID='     +quotedstr( dblcCia.text)+' and '
           +      'TDIARID='   +quotedstr(wTdiar)              +' and '
           +      'CNTANOMM='  +quotedstr(xAnomes)             +' and '
           +      'CNTCOMPROB='+quotedstr(dbeNoReg.text)       +' '
           +'Order by CNT301.CNTREG';
      DMCXP.cdsCxP.Close;
      DMCXP.cdsCxP.DataRequest(xSQL);
      DMCXP.cdsCxP.Open;
   end;

   ppdbpPreview.DataSource     := DMCXP.dsCxP;
   pprPreview.TEMPLATE.FileName:= ExtractFilePath( application.ExeName ) + wRutaRpt+'\CxPVoucher.rtm' ;
   pprPreview.template.LoadFromFile ;

   pplblCiades.Caption   := edtCia.text ;
   pplblDiarioDes.Caption   := DMCXP.DisplayDescrip2('dspTGE','TGE104','TDIARDES','TDIARID='+quotedstr(wTDiar),'TDIARDES');
   pplblTDiario.Caption       := wTDiar;
   pplblProveedor.Caption:= edtProv.text;
   pplblCodProv.Caption := dblcdProv.text;
   pplblglosaDes.caption   := DMCXP.cdsCxP.fieldbyname('CNTGLOSA').asstring;
   pplblTipoCamb.Caption := FloatToStrF(StrToFloat(dbeTCambio.text),ffNumber,10,3);
   pplblAnoMes.Caption  := xAnomes;
   pplblNoCompro.Caption := dbeNoReg.text ;
   pplblmonedaDes.caption   := DMCXP.DisplayDescrip2('dspTGE','TGE103','TMON_LOC, TMONDES, TMONABR ','TMONID='+quotedstr(dblcTMon.text),'TMONDES');
   tMoneda := DMCXP.cdsQry.FieldByname('TMON_LOC').AsString;
   tsimbolo:= DMCXP.cdsQry.FieldByname('TMONABR').AsString;

   xTotHaber:= 0;
   DMCXP.CdsDetCxP.first;
   while not DMCXP.CdsDetCxP.EOF do
   begin
      if DMCXP.CdsDetCxP.fieldbyname('DCPDH').Asstring = 'H' then
         xTotHaber:= xTotHaber+FRound(DMCXP.cdsDetCxP.Fieldbyname('DCPMOORI').AsFloat,15,2);
      DMCXP.CdsDetCxP.next;
   end;
   DMCXP.CdsDetCxP.first;
   pplblMontoImporte.Caption:=tSimbolo+' '+FloatToStrF(xTotHaber,ffNumber,15,2);

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

procedure TFIntermediacion.ppDetailBand2BeforePrint(Sender: TObject);
begin
   pplblFecEmision.Caption := DMCXP.CdsCxP.Fieldbyname('CNTFEMIS').AsString;
end;

procedure TFIntermediacion.dblcdCnpEgrEnter(Sender: TObject);
begin
  strTemp := dblcdCnpEgr.text;
end;

Function TFIntermediacion.AsientoCuadra:Boolean;
var
   xTotDebe, xTotHaber : double;
   xCampo  : String;
begin
   Result    := False;
   xTotDebe  := 0;
   xTotHaber := 0;
   if DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString=DMCXP.wTMonLoc then
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

procedure TFIntermediacion.pgctDocumentosChange(Sender: TObject);
begin
	bbtnSumatClick(Sender);

	if DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString = 'S' then
	begin
		bbtnSumat.Click;
		exit;
	end;

	if pgctDocumentos.ActivePageIndex = 1 then
	begin
		edtFinal.Text:='La Nota de Cobranza amortizará la suma de '
						  + wSimbMn +'  '+ floattostrf(wTDev2,ffNumber,15,2);
		bbtnGen302.Enabled:=False;
		if (DMCXP.cdsDetCxP.RecordCount=0) and (wTDev2>0) then
			bbtnGen302.Enabled:=True;
	end
	else
	begin  // pestaña 0
		bbtnGen302.Enabled:=False;
		if pgctDocumentos.ActivePageIndex = 0 then
			bbtnSumat.Click;
	end;
end;

procedure TFIntermediacion.dblcdCptoTotalExit(Sender: TObject);
var
	xWhere : String;
begin
	DMCXP.cdsCnpEgr.IndexFieldNames:='CPTOID';
	DMCXP.cdsCnpEgr.SetKey;
	DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString:=dblcdCptoTotal.text;
	if not DMCXP.cdsCnpEgr.Gotokey then
	begin
		ShowMessage('Código de Concepto Errado, intente nuevamente');
		dblcdCptoTotal.Clear;
		dblcdCptoTotal.SetFocus;
		exit;
	end;
	wCtaTotal := DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString;
	if wCtaTotal='' then
	begin
		ShowMessage('Código de Concepto no tiene Cuenta Contable');
		dblcdCptoTotal.Clear;
		dblcdCptoTotal.SetFocus;
		exit;
	end;
	dbeDescCptoTot.text:=DMCXP.cdsCnpEgr.FieldByName('CPTODES').AsString;
end;

procedure TFIntermediacion.pprPreviewPreviewFormCreate(Sender: TObject);
begin
  pprPreview.PreviewForm.ClientHeight := 580;
  pprPreview.PreviewForm.ClientWidth := 780;			// ppViewr
  tppviewer(pprPreview.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFIntermediacion.FormShow(Sender: TObject);
var
  xsql, xxCia, xxProv, xxDoc, xWhere : String;
begin
   xCrea := True;
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );

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

   ///////////  Busca TDocId y TDiarId - Inicio
   DMCXP.cdsTDoc.Filter:='';
   DMCXP.cdsTDoc.Filter:='DOC_FREG='+''''+FPrincipal.xTipoProv+''''+' and '
							 +'DOCMOD=  '+''''+'CXP'+'''';
   DMCXP.cdsTDoc.Filtered:=True;
   if DMCXP.cdsTDoc.RecordCount>0 then
   begin
      if DMCXP.cdsTDoc.RecordCount>1 then
      begin
	 ShowMessage('Ojo: Existe más de un registro tipo N - N/Crédito');
	 // Pide eleccion de FReg 'N' que existan en TDoc (TGE110)
      end;
      wTDoc := DMCXP.cdsTDoc.fieldbyname('DOCID').AsString;
      if (DMCXP.cdsTDoc.fieldbyname('TDIARID').AsString<>'') and (DMCXP.cdsTDoc.fieldbyname('TDIARID2').AsString<>'') then
      begin
	 ShowMessage('Ojo: Esta N/Crédito tiene más de un T/Diario');
	 // Pide eleccion de TDiarID
      end;
      wTDiar    := DMCXP.cdsTDoc.fieldbyname('TDIARID').AsString;  // Default(x ahora)
      xTAutoNum := DMCXP.DisplayDescrip('TGE104','AutoNum','TDiarID',wTDiar);
   end
   else begin
      ShowMessage('Tipos de Documento no registra definición de N/Crédito');
      // Forma de Registro (N) no definido en tabla TDocum(TGE110)     ¿?
      // Salir de N/Credito
   end;
   ///////////  Busca TDocId y TDiarId - Fin... Resultado: wTDoc y wTDiar

   InicializaCds;   // Inicializa en Blanco (Filtra) Client Data Sets--> CiaId=''
   InicializaVars;

   // Reglas de Negocio
   If DMCXP.wVRN_PagosParciales='S' then
   begin
      DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := False;
      DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := True;
      DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := False;
      DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := False;
   end
   else begin
      DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := True;
      DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := True;
      DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := True;
      DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := True;
   end;

   If DMCXP.wAdmin='G' then begin
      DMCXP.wModo := 'C';
   end;

   DMCXP.cdsTDoc.Filtered:=False;

   pgctDocumentos.ActivePageIndex:= 0;

   if DMCXP.wModo='A' then
   begin
      DMCXP.cdsMovCxP2.Insert;
      DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString := wTDoc;
      edtCia.Text   := '';
      edtProv.text  := '';
      edtSerie.Text := '';
      edtNoDoc.Text := '';
      dbeDescCptoTot.text:='';
      EstadoDeForma( 0, ' ', ' ' );
   end
   else
   begin
      xxCia        := DMCXP.cdsMovCxP2.fieldbyname('CIAID').AsString;
      xxProv       := DMCXP.cdsMovCxP2.fieldbyname('PROV').AsString;
      xxDoc        := DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString;
      edtSerie.Text:= DMCXP.cdsMovCxP2.fieldbyname('CPSERIE').AsString;
      edtNoDoc.text:= DMCXP.cdsMovCxP2.fieldbyname('CPNODOC').AsString;
      wCje         := DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString;
      //** 06/09/2001 - pjsv, se utiliza en la llamada al prorrateo
      xNRegistro   := DMCXP.cdsMovCxP2.fieldbyname('CPNOREG').AsString;
      xAnomes      := DMCXP.cdsMovCxP2.fieldbyname('CPANOMES').AsString;
      //**
      edtCia.Text  := DMCXP.DisplayDescrip('TGE101','CIADES','CIAID', xxCia  );
      //edtProv.text := DMCXP.DisplayDescrip('TGE201','PROVDES','PROV', xxProv );

      xWhere:='ClAuxId='''+dblcClAux.Text+''' and Prov='''+dblcdProv.Text+'''';
      edtProv.Text:=BuscaQry('dspTGE','TGE201','PROV,PROVRUC,PROVDES',xWhere,'PROVDES');

      dbeDescCptoTot.text := DMCXP.DisplayDescrip('CXP201','CPTODES','CPTOID', dblcdCptoTotal.text );
      wCtaTotal:=DMCXP.cdsULTTGE.FieldByName('CUENTAID').AsString;
      //**
      xWhere       := 'TMonId='''+dblcTMon.Text+''' and ( TMon_Loc=''L'' or TMon_Loc=''E'' )';
      edtTMon.Text := BuscaQry('PrvTGE','TGE103','TMONDES,TMONABR',xWhere,'TMONDES');
      if length(edtTMon.Text)>0 then
         wSimbMn:=DMCXP.cdsQry.FieldByName('TMONABR').AsString;

      if DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString='I' then
	 EstadoDeForma(0,DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString,' ' )
      else
	 EstadoDeForma(1,DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString,DMCXP.cdsMovCxP2.fieldbyname('CP_CONTA').AsString );

      if DMCXP.wVRN_CCosCia='N' then
	 xSQL:='SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 '
	      +'Where CCOSMOV='+quotedstr('S')
      else
	 xSQL:='SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 '
	      +'Where CCOSMOV='+quotedstr('S')
	      +' and CCOSCIAS LIKE ('+quotedstr('%'+dblcCia.Text+'%')+' ) ';

      DMCXP.cdsCCosto.Close;
      DMCXP.cdsCCosto.DataRequest(xSQL);
      DMCXP.cdsCCosto.open;
      DMCXP.cdsCCosto.Filter:='';
      DMCXP.cdsCCosto.Filtered:=False;
      DMCXP.cdsCCosto.IndexFieldNames :='CCOSID';

      if DMCXP.wVRN_CptoCia='N' then
	 xSQL:='select * from CXP201 '
      else
	 xSQL:='select * from CXP201 '
	      +'Where CIAID='+quotedstr(dblcCia.Text);

      DMCXP.cdsCnpEgr.Close;
      DMCXP.cdsCnpEgr.DataRequest( xSQL );
      DMCXP.cdsCnpEgr.Open;

      FiltraGrids;
      DMCXP.cdsDetCxP.IndexFieldNames:='TIPDET';
      DMCXP.cdsDetCxP.SetKey;
      DMCXP.cdsDetCxP.fieldbyname('TIPDET').AsString:='TO';
      DMCXP.cdsDetCxP.GotoNearest;
      if DMCXP.cdsDetCxP.fieldbyname('TIPDET').AsString='TO' then
	 dbeDescCptoTot.Text := DMCXP.cdsDetCxP.fieldbyname('DCPGLOSA').AsString;

      DMCXP.cdsDetCxP.IndexFieldNames:='';
   end;

   xCrea := False;
end;

end.


