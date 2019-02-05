unit CxP205;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, wwdbdatetimepicker, Mask, wwdbedit, wwdblook, Wwdbdlg,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBGrids, DB, wwSpeedButton,
  wwDBNavigator, ComCtrls, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe, ppPrnabl, ppCtrls, ppModule, daDatMod, ppBands,
  ppVar, fcLabel, GridControl, fcButton, fcImgBtn, fcShapeBtn, wwclient;

type
  TFPagos = class(TForm)
    pnlPie: TPanel;
    pnlDetalle: TPanel;
    pnlPendiente: TPanel;
    Label16: TLabel;
    dbgPendiente: TwwDBGrid;
    pnlDocCanje: TPanel;
    Label17: TLabel;
    dbgDocCanje: TwwDBGrid;
    ppdbCanje: TppDBPipeline;
    ppField37: TppField;
    ppField38: TppField;
    ppField39: TppField;
    ppField40: TppField;
    ppField41: TppField;
    ppField42: TppField;
    ppField43: TppField;
    ppField44: TppField;
    ppField45: TppField;
    ppField46: TppField;
    ppField47: TppField;
    ppField48: TppField;
    ppField49: TppField;
    ppField50: TppField;
    ppField51: TppField;
    ppField52: TppField;
    ppField53: TppField;
    ppField54: TppField;
    ppField55: TppField;
    ppField56: TppField;
    ppField57: TppField;
    ppField58: TppField;
    ppField59: TppField;
    ppField60: TppField;
    ppField61: TppField;
    ppField62: TppField;
    ppField63: TppField;
    ppField64: TppField;
    ppField65: TppField;
    ppField66: TppField;
    ppField67: TppField;
    ppField68: TppField;
    ppField69: TppField;
    ppField70: TppField;
    ppField71: TppField;
    ppField72: TppField;
    ppField73: TppField;
    ppField74: TppField;
    ppField75: TppField;
    ppField76: TppField;
    ppField77: TppField;
    ppField78: TppField;
    ppdbOPago: TppDBPipeline;
    pprOPago: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine3: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine4: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
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
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppDBText18: TppDBText;
    ppLabel17: TppLabel;
    ppDBText20: TppDBText;
    ppLabel19: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLine5: TppLine;
    ppLabel15: TppLabel;
    ppDBText17: TppDBText;
    Label24: TLabel;
    pnlEstado: TPanel;
    lblAnula: TLabel;
    lblActivo: TLabel;
    lblContab: TLabel;
    lblAcepta: TLabel;
    pnlCabecera: TPanel;
    pnlCab1: TPanel;
    lblCia: TLabel;
    lblOPago: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    meOPago: TwwDBEdit;
    pnlCab2: TPanel;
    lblFEmis: TLabel;
    lblTMon: TLabel;
    lblTCambio: TLabel;
    lblProv: TLabel;
    lblProvRuc: TLabel;
    lblProvDes: TLabel;
    lblBanco: TLabel;
    lblCCBco: TLabel;
    lblNoChq: TLabel;
    lblElabo: TLabel;
    lblFormPago: TLabel;
    lblAprob: TLabel;
    dbdtpFPago: TwwDBDateTimePicker;
    edtTMon: TEdit;
    dbeTCambio: TwwDBEdit;
    dblcTMon: TwwDBLookupCombo;
    dblcdProv: TwwDBLookupComboDlg;
    dblcdProvRuc: TwwDBLookupComboDlg;
    dbeGiradoA: TwwDBEdit;
    dblcBanco: TwwDBLookupCombo;
    dblcCCBco: TwwDBLookupCombo;
    dbeNoChq: TwwDBEdit;
    dbeElabo: TwwDBEdit;
    dbeAprob: TwwDBEdit;
    dblcFormPago: TwwDBLookupCombo;
    edtFormPago: TEdit;
    edtBanco: TEdit;
    edtCCBco: TEdit;
    fcLabel1: TfcLabel;
    bbtnSalir: TfcShapeBtn;
    bbtnRegresa: TfcShapeBtn;
    bbtnCancela: TfcShapeBtn;
    Z2bbtnGraba: TfcShapeBtn;
    Z2bbtnAcepta: TfcShapeBtn;
    Z2bbtnAnula: TfcShapeBtn;
    Z2bbtnImprime: TfcShapeBtn;
    Z2bbtnNuevo: TfcShapeBtn;
    bbtnBorra: TfcShapeBtn;
    bbtnOK: TfcShapeBtn;
    Shape1: TShape;
    bbtnCalc: TfcShapeBtn;
    bbtnSumat: TfcShapeBtn;
    Label1: TLabel;
    dblcClAux: TwwDBLookupCombo;
// Procedimientos de Inicio
    procedure FormActivate(Sender: TObject);
    procedure IniciaDatos;
    procedure meOPagoExit(Sender: TObject);
    procedure bbtnBorraClick(Sender: TObject);
    procedure bbtnOKClick(Sender: TObject);
// Procedimientos


    procedure dbgPendienteMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgPendienteEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDocCanjeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgDocCanjeEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDocCanjeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgPendienteDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure bbtnSumatClick(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure bbtnCalcClick(Sender: TObject);
// Final
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcdProvExit(Sender: TObject);
    procedure dblcdProvRucExit(Sender: TObject);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure Z2bbtnImprimeClick(Sender: TObject);
    procedure ppDBText5GetText(Sender: TObject; var Text: String);
    procedure ppDBText5Print(Sender: TObject);
    procedure ppDBCalc1Print(Sender: TObject);
    procedure dbgDocCanjeColExit(Sender: TObject);
    procedure Z2bbtnNuevoClick(Sender: TObject);
    procedure bbtnRegresaClick(Sender: TObject);
    procedure Z2bbtnAnulaClick(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure dbdtpFPagoExit(Sender: TObject);
    procedure IniciaBotonesDetalle;
    procedure MuestraEstado( xMovEstado, xMovConta : String ) ;
    procedure Actualizasaldos( xNuevo : Boolean);
    procedure dblcTMonExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcCCBcoExit(Sender: TObject);
    procedure dbgDocCanjeCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure EstadoDeForma( xxModo:Integer; xMovEstado, xMovConta : String );
    function  ValidaCabecera:Boolean;
    procedure FiltraCanje;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcdProvRucEnter(Sender: TObject);
    procedure dblcdProvEnter(Sender: TObject);
    procedure dblcClAuxExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xFlagGr : Boolean;
    xTDoc   : String;
    Function ExisteMovCxP(xxCia,xxTDiario,xxAAMM,xxNoReg:String):Boolean;
  end;

var
  FPagos   : TFPagos;
  xSQL     : String;
  xxTCambio: double;
  xCrea    : Boolean;
  xTSalLoc, xTSalExt, xTPagLoc, xTPagExt : double;

implementation

Uses CxPDM, CxP001;
{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}

procedure TFPagos.FormActivate(Sender: TObject);
begin
   xCrea := True;

   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );

   // Reglas de Negocio
   If DMCXP.wVRN_PagosParciales='S' then begin
      DMCXP.cdsCanje.FieldByname('CCPTCCJE').ReadOnly := False;
      DMCXP.cdsCanje.FieldByname('CCPMOLOC').ReadOnly := False;
      DMCXP.cdsCanje.FieldByname('CCPMOEXT').ReadOnly := False;
      end
   else begin
      DMCXP.cdsCanje.FieldByname('CCPTCCJE').ReadOnly := True;
      DMCXP.cdsCanje.FieldByname('CCPMOLOC').ReadOnly := True;
      DMCXP.cdsCanje.FieldByname('CCPMOEXT').ReadOnly := True;
   end;

   // Reglas de Negocio
   if DMCXP.wVRN_TCambioFijo='N' then
      dbeTCambio.Enabled:=True
   else begin
      dbeTCambio.Enabled:=False;
   end;

   if DMCXP.wModo='A' then begin
      IniciaDatos;
      EstadoDeForma( 0, ' ', ' ' );
      end
   else begin
      xFlagGr          := False;
      dblcCia.Text    := DMCXP.cdsOPago.FieldByName('CIAID').AsString;
      edtCia.Text     := DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);
      meOPago.Text    := DMCXP.cdsOPago.FieldByName('OPAGO').AsString;
      dblcdProv.Text  := DMCXP.cdsOPago.FieldByName('PROV').ASString;
      dblcdProvRuc.Text:=DMCXP.cdsOPago.FieldByName('PROVRUC').AsString;
      dbeGiradoA.Text := DMCXP.cdsOPago.FieldByName('ProvGIRA').AsString;
      edtFormPago.Text:= DMCXP.DisplayDescrip('TGE112','FPagoDes','FPagoId',dblcFormPago.Text);
      edtTMon.Text    := DMCXP.DisplayDescrip('TGE103','TMONDES', 'TMonID', dblcTMon.Text);

      If DMCXP.cdsOPago.FieldByName('OPESTADO').AsString='I' then
         EstadoDeForma(0,DMCXP.cdsOPago.FieldByName('OPESTADO').AsString,' ' )
      else
         EstadoDeForma(1,DMCXP.cdsOPago.FieldByName('OPESTADO').AsString,' ' );

      FiltraCanje;
   end;
   bbtnSumatClick(Sender);
   xCrea := False;
end;

procedure TFPagos.EstadoDeForma( xxModo:Integer; xMovEstado,xMovConta:String );
begin
   pnlCab1.Enabled      := False;
   bbtnOK.Enabled       := False;
   bbtnBorra.Enabled    := False;

   pnlDetalle.Enabled   := False;
   pnlPendiente.Enabled := False;
   pnlDocCanje.Enabled  := False;
   dbgPendiente.ReadOnly:= True;
   dbgDocCanje.ReadOnly := True;

   pnlPie.Enabled       := False;
   bbtnRegresa.Enabled  := False;
   bbtnCancela.Enabled  := False;
   Z2bbtnGraba.Enabled  := False;
   Z2bbtnAcepta.Enabled := False;
   Z2bbtnAnula.Enabled  := False;
   Z2bbtnImprime.Enabled:= False;
   Z2bbtnNuevo.Enabled  := False;

   lblActivo.Visible    := False;
   lblAcepta.Visible    := False;
   lblAnula.Visible     := False;
   lblContab.Visible    := False;

   If xxModo=0 then
      begin
         If (xMovEstado=' ') or (xMovEstado='') then begin
            pnlCab1.Enabled     := True;
            pnlCab2.Enabled     := True;
            dblcClAux.Enabled   := True;
            dblcdProv.Enabled   := True;
            dblcdProvRuc.Enabled:= True;
            bbtnOK.Enabled      := True;
            bbtnBorra.Enabled   := True;
            lblActivo.Visible   := False;
            dblcCia.SetFocus;
         end;
         If xMovEstado='T' then begin
            pnlCab2.Enabled     := True;
            dblcClAux.Enabled   := True;
            dblcdProv.Enabled   := True;
            dblcdProvRuc.Enabled:= True;
            bbtnOK.Enabled      := True;
            bbtnBorra.Enabled   := True;
            lblActivo.Visible   := False;
            dblcClAux.SetFocus;
         end;
         If xMovEstado='I' then begin
            pnlCab2.Enabled     := True;
            dblcClAux.Enabled   := False;
            dblcdProv.Enabled   := False;
            dblcdProvRuc.Enabled:= False;
            bbtnOK.Enabled      := True;
            bbtnBorra.Enabled   := True;

            lblActivo.Visible   := True;
            dbdtpFPago.SetFocus;
         end
      end
   else begin

      bbtnSumatClick( Self );
      pnlCab2.Enabled      := False;

      If xMovConta='S' then
         begin
            pnlDetalle.Enabled   := True;
            pnlDocCanje.Enabled  := True;

            lblContab.Visible    := True;
         end
      else begin
         If (xMovEstado='I') or (xMovEstado='T') then begin
            pnlDetalle.Enabled   := True;
            pnlPendiente.Enabled := True;
            pnlDocCanje.Enabled  := True;
            dbgPendiente.ReadOnly:= False;
            dbgDocCanje.ReadOnly := False;

            pnlPie.Enabled       := True;
            bbtnRegresa.Enabled  := True;
            bbtnCancela.Enabled  := True;
            Z2bbtnGraba.Enabled  := True;
            Z2bbtnAcepta.Enabled := True;
            Z2bbtnAnula.Enabled  := True;
            Z2bbtnImprime.Enabled:= True;

            lblActivo.Visible    := True;
         end;
         If (xMovEstado='P') or (xMovEstado='C') then begin
            pnlDetalle.Enabled   := True;
            pnlDocCanje.Enabled  := True;

            pnlPie.Enabled       := True;
            Z2bbtnImprime.Enabled:= True;

            lblAcepta.Visible    := True;
         end;
         If xMovEstado='A' then begin
            pnlDetalle.Enabled   := True;
            pnlDocCanje.Enabled  := True;

            pnlPie.Enabled       := True;
            Z2bbtnImprime.Enabled:= True;

            lblAnula.Visible     := True;
         end;
      end;
   end;

   if DMCXP.wModo='C' then begin // Si Entra Solo Para Consulta
      pnlCab1.Enabled      := False;
      pnlCab2.Enabled      := False;
      bbtnOK.Enabled       := False;
      bbtnBorra.Enabled    := False;

      pnlPendiente.Enabled := False;
      pnlDocCanje.Enabled  := False;
      dbgPendiente.ReadOnly:= True;
      dbgDocCanje.ReadOnly := True;

      pnlPie.Enabled       := False;
      bbtnRegresa.Enabled  := False;
      bbtnCancela.Enabled  := False;
      Z2bbtnGraba.Enabled  := False;
      Z2bbtnAcepta.Enabled := False;
      Z2bbtnAnula.Enabled  := False;
      Z2bbtnImprime.Enabled:= False;
      Z2bbtnNuevo.Enabled  := False;
   end;
end;

procedure TFPagos.IniciaDatos;
begin
   Filtracds( DMCXP.cdsMovCxP,  'Select * from CXP301 Where CIAID=''''' );
   Filtracds( DMCXP.cdsCanje,   'Select * from CXP304 Where CIAID=''''' );
   Filtracds( DMCXP.cdsDetCanje,'Select * from CXP305 Where CIAID=''''' );

   xFlagGr          := False;
   dblcCia.Text      := '';   // Código de Compañía
   edtCia.Text       := '';   // Descripción de la Compañía
   meOPago.Text      := '';   // Orden de Pago
   dblcdProv.Text    := '';    // Código de Proveedor
   dblcdProvRuc.Text := '';    // RUC del Proveedor
   dbeGiradoA.Text   := '';    // Pago Girado A ....
   dbdtpFPago.Date   := date; // Fecha de Pago
   dblcTMon.Text     := '';   // Tipo de Moneda
   edtTMon.Text      := '';   // Descripción de la Moneda
   dbeTCambio.Text   := '';   // Tipo de Cambio
   dblcFormPago.Text := '';   // Forma de Pago
   edtFormPago.Text  := '';   // descripción de forma de pago
   dblcBanco.Enabled := False;
   dblcBanco.Text    := '';   // Código de Banco
   edtBanco.Text     := '';   // Descripción de Banco
   dblcCCBco.Enabled := False;
   dblcCCBco.Text    := '';   // Cuenta Corriente del Banco
   edtCCBco.Text     := '';   // Descripción de la Cuenta Corriente
   dbeNoChq.Text     := '';   // Cheque
   dbeNoChq.Enabled  := False;
   dbeElabo.Text     := '';   // Elaborado por
   dbeAprob.Text     := '';   // Aprobado por
end;

procedure TFPagos.IniciaBotonesDetalle;
begin
   bbtnCalc.Enabled    := True;
   bbtnSumat.Enabled   := False;
   bbtnRegresa.Enabled    := False;
   bbtnCancela.Enabled:= False;
   Z2bbtnGraba.Enabled  := False;
   Z2bbtnAcepta.Enabled  := False;
   Z2bbtnAnula.Enabled   := False;
   Z2bbtnImprime.Enabled := False;
   //bbtnContab.Enabled  := False;
   Z2bbtnNuevo.Enabled   := False;
end;

{*******************************************************
PRIMER PANEL - DATOS INICIALES DE LA CABECERA
*******************************************************}

procedure TFPagos.meOPagoExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnSalir.Focused then exit;
   if Length(meOPago.Text)=0 then Exit;
   if strtoint(meOPago.Text)<=0 then begin
      Raise Exception.Create( ' Error en El Número de Orden ' )
   end;

   xFlagCal := False;
   meOPago.Text := Strzero(meOPago.Text,DMCXP.cdsOPago.FieldByName('OPAGO').DisplayWidth);

   if DMCXP.BuscaOPago( dblcCia.Text,meOPago.Text) then begin
      meOPago.SetFocus;
      Raise Exception.Create( 'Orden de Pago Existe' );
   end;

   meOPago.Text:=DMCXP.GrabaUltimoRegistro(' ',dblcCia.Text,'OP','','',StrToInt(meOPago.Text));
   meOPago.Text:=Strzero(meOPago.Text,DMCXP.cdsOPago.FieldByName('OPAGO').DisplayWidth);
   DMCXP.cdsOPago.Insert;
   DMCXP.cdsOPago.FieldByName('CIAID').AsString   := dblcCia.Text;  // Compañía
   DMCXP.cdsOPago.FieldByName('OPAGO').AsString   := meOPago.Text;  // Orden de Pago
   DMCXP.cdsOPago.FieldByName('OPEstado').AsString:= 'T';  // Pendiente
   DMCXP.cdsOPago.FieldByName('OPUSER').AsString  := DMCXP.wUsuario;  // usuario que registra
   DMCXP.cdsOPago.FieldByName('OPFREG').AsDateTime:= date;          // fecha que registra usuario
   DMCXP.cdsOPago.FieldByName('OPHREG').AsdateTime:= time;          // hora que registra usuario
   DMCXP.cdsOPago.Post;

   DMCXP.AplicaDatos( DMCXP.cdsOPago,  'OPago'  );

   xFlagGr:=True;

   EstadoDeForma( 0,DMCXP.cdsOPago.FieldByName('OPESTADO').AsString,' ' );
end;


{*******************************************************
SEGUNDO PANEL - DATOS ADICIONALES DE LA CABECERA
*******************************************************}
procedure TFPagos.dblcdProvExit(Sender: TObject);
var
   xWhere, xDes : String;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if dblcClAux.Focused then Exit;
   if Length(dblcClAux.Text)=0 then begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Falta Ingresar Clase de Auxiliar');
   end;

   if (length(dblcdProv.Text)>0) then
   begin
      xWhere:='ClAuxId='''+dblcClAux.Text+''' and Prov='''+dblcdProv.Text+'''';
      xDes  :=BuscaQry('dspTGE','TGE201','PROV,PROVRUC,PROVDes,ProvGirA',xWhere,'PROVDES');
      if length(xDes)=0 then
      begin
         dblcdProv.Text:='';
         dblcdProvRuc.Text:='';
         dblcdProv.SetFocus;
         Raise Exception.Create('Proveedor no existe');
      end;
      dblcdProvRuc.Text:=DMCXP.cdsQry.FieldByName('PROVRUC').AsString;
      DMCXP.cdsOPago.Edit;
      if DMCXP.cdsQry.fieldbyname('ProvGirA').AsString='' then
         DMCXP.cdsOPago.FieldByName('PROVGIRA').AsString:=DMCXP.cdsQry.fieldbyname('ProvDes').AsString
      else begin
         DMCXP.cdsOPago.FieldByName('PROVGIRA').AsString:=DMCXP.cdsQry.fieldbyname('ProvGira').AsString
      end;
      dbeGiradoA.SetFocus;
   end
   else begin
      dbeGiradoA.Text:='';
      dblcdProvRuc.SetFocus;
   end;
end;

procedure TFPagos.dblcdProvRucExit(Sender: TObject);
var
   xWhere, xDes : String;
begin
   if xCrea             then Exit;
   if bbtnBorra.Focused then Exit;
   if dblcClAux.Focused then Exit;
   if Length(dblcClAux.Text)=0 then begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Falta Ingresar Clase de Auxiliar');
   end;

   if (length(dblcdProvRuc.Text)>0) then
   begin
      xWhere:='ClAuxId='''+dblcClAux.Text+''' and ProvRuc='''+dblcdProvRuc.Text+'''';
      xDes  :=BuscaQry('dspTGE','TGE201','PROV,PROVRUC,PROVDES,ProvGirA',xWhere,'PROVDES');
      if length( xDes )=0 then
      begin
         dblcdProv.Text   :='';
         dblcdProvRuc.Text:='';
         dblcdProvRuc.SetFocus;
         Raise Exception.Create('RUC de Proveedor no existe');
      end;
      dblcdProv.Text:=DMCXP.cdsQry.FieldByName('PROV').AsString;
      DMCXP.cdsOPago.Edit;
      if DMCXP.cdsQry.fieldbyname('ProvGirA').AsString='' then
         DMCXP.cdsOPago.FieldByName('PROVGIRA').AsString:=DMCXP.cdsQry.fieldbyname('ProvDes').AsString
      else begin
         DMCXP.cdsOPago.FieldByName('PROVGIRA').AsString:=DMCXP.cdsQry.fieldbyname('ProvGirA').AsString
      end;
      dbeGiradoA.SetFocus;
   end
   else begin
      xDes:='';
      dblcdProv.SetFocus;
   end;
end;

procedure TFPagos.bbtnBorraClick(Sender: TObject);
begin
   If DMCXP.wModo='A' then
      begin
         if xFlagGr then begin
            DMCXP.cdsOPago.CancelUpdates;
            DMCXP.cdsMovCxP.CancelUpdates;
            DMCXP.cdsCanje.CancelUpdates;
            DMCXP.cdsOPago.Delete;
            DMCXP.AplicaDatos( DMCXP.cdsOPago, 'OPago' );
            DMCXP.cdsOPago.Insert;
            IniciaDatos;
            end
         else begin
            if Length(DMCXP.cdsOPago.FieldByName('OPESTADO').AsString)=0 then begin
               DMCXP.cdsOPago.CancelUpdates;
               DMCXP.cdsOPago.Insert;
               IniciaDatos;
               end
            else begin
            DMCXP.cdsOPago.CancelUpdates;
            end;
         end;
      end
   else begin
      DMCXP.cdsOPago.CancelUpdates;
   end;

   EstadoDeForma( 0, DMCXP.cdsOPago.FieldByName('OPESTADO').AsString,' ' );
end;

procedure TFPagos.bbtnOKClick(Sender: TObject);
var
   xMes : String;
   wAno, wMes, wDia: Word;
begin

   If not ValidaCabecera then Exit;  // Valida que Cabecera Tenga Datos Correctos

   if DMCXP.wModo='A' then begin
      DMCXP.cdsOPago.Edit;
      DecodeDate(dbdtpFPago.date, wAno, wMes, wDia);
      if wMes<10 then xMes:='0'+inttostr(wMes) else xMes:=inttostr(wMes);
      DMCXP.cdsOPago.FieldByName('OPANOMM').AsString := IntToStr(wAno)+xMes;
      DMCXP.cdsOPago.FieldByName('OPANO').AsString   := IntToStr(wAno);
      DMCXP.cdsOPago.FieldByName('OPMM').AsString    := xMes;
      if DMCXP.BuscaFecha('TGE114','FecAno','Fecha',dbdtpFPago.date ) then begin
         DMCXP.cdsOPago.FieldByName('OPDD').AsString   := DMCXP.cdsUltTGE.fieldbyname('FecDia').Value;        // día
         DMCXP.cdsOPago.FieldByName('OPTRI').AsString  := DMCXP.cdsUltTGE.fieldbyname('FecTrim').Value;      // trimestre
         DMCXP.cdsOPago.FieldByName('OPSEM').AsString  := DMCXP.cdsUltTGE.fieldbyname('FecSem').Value;       // semestre
         DMCXP.cdsOPago.FieldByName('OPSS').AsString   := DMCXP.cdsUltTGE.fieldbyname('FecSS').Value;         // semana
         DMCXP.cdsOPago.FieldByName('OPAATRI').AsString:= DMCXP.cdsUltTGE.fieldbyname('FecAATri').Value;   // año+trimestre
         DMCXP.cdsOPago.FieldByName('OPAASEM').AsString:= DMCXP.cdsUltTGE.fieldbyname('FecAASem').Value;   // año+semestre
         DMCXP.cdsOPago.FieldByName('OPAASS').AsString := DMCXP.cdsUltTGE.fieldbyname('FecAASS').Value;     // año+semana
      end;
      DMCXP.cdsOPago.Post;
      FiltraCanje;
   end;

// Actualiza Saldos de Doc. En Canje
   If not xFlagCal then begin
      ActualizaSaldos( False );
      xFlagCal := True;
   end;

   If ( DMCXP.cdsMovCxP.RecordCount=0 ) and ( DMCXP.cdsCanje.RecordCount=0 ) then
      Raise Exception.Create('Proveedor No tiene Documentos Pendientes de Pago');

   DMCXP.cdsCanje.First;
   If FRound(DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,8,3)<>FRound(strtofloat(dbeTCambio.Text),8,3) then begin
      While not DMCXP.cdsCanje.eof do begin
         DMCXP.cdsCanje.Edit;
         DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat := FRound(strtofloat(dbeTCambio.Text),8,3);
         DMCXP.cdsCanje.Next;
      end;
      DMCXP.cdsCanje.First;
   end;
   EstadoDeForma(1,DMCXP.cdsOPago.FieldByName('OPESTADO').AsString,' ' );
end;

procedure TFPagos.FiltraCanje;
var
   xFiltro : String;
begin
// Grid de Documentos Pendientes
   xFiltro := 'CIAID='''+dblcCia.Text+''' AND PROV='''+dblcdProv.Text+'''';
   Filtracds( DMCXP.cdsMovCXP, 'Select * from CXP301 Where '+xFiltro );

   DMCXP.cdsMovCxP.Filter:='';
   DMCXP.cdsMovCxP.Filter:='CPSaLLoc>0 and CPEstado=''P'' and '
                        +'CPCanje<>'''+meOPago.Text+'''';
   DMCXP.cdsMovCxP.Filtered:=True;


// Grid de Documentos a Canjear
   Filtracds(DMCXP.cdsCanje,'Select * from CXP304 Where '
                        +'CiaId='''   +dblcCia.Text+''' and '
                        +'TCanjeId=''OP'' and '
                        +'CCPCanje='''+meOPago.Text+'''' );

// Filtra froma de pago
   Filtracds(DMCXP.cdsDetCanje,'Select * from CXP305 Where '
                        +'CiaId='''   +dblcCia.Text+''' and '
                        +'TCanjeId=''OP'' and '
                        +'CCPCanje='''+meOPago.Text+'''' );
end;

function TFPagos.ValidaCabecera:Boolean;
begin
   if length(dblcCia.Text)=0      then raise exception.Create('Falta Código de Compañía');
   if length(edtCia.Text)=0       then raise exception.Create('Código de Compañía Errado');
   if length(meOPago.Text)=0      then raise exception.Create('Falta No.Orden de Pago');
   if length(dblcdProv.Text)=0    then raise exception.Create('Faltan Datos del Proveedor');
   if length(dbeGiradoA.Text)=0   then raise exception.Create('Datos del Proveedor Errados');
   if dbdtpFPago.Date=0           then raise exception.Create('Falta Fecha de Orden de Pago');
   if length(dblcTMon.Text)=0     then raise exception.Create('Falta Tipo de Moneda');
   if length(edtTMon.Text)=0      then raise exception.Create('Código de Moneda Errado');
   if length(dbeTCambio.Text)=0   then raise exception.Create('Falta Tipo de Cambio');
   if strtofloat(dbeTCambio.Text)<0 then raise exception.Create('Tipo de Cambio debe ser Mayor a 0');
   if length(edtFormPago.Text)=0  then raise exception.Create('Falta Forma de Pago');
   if (dblcBanco.Enabled=True) and (length(dblcBanco.Text)=0) then
   begin
      raise exception.Create('Falta definir Banco');
   end;
   if (dblcCCBco.Enabled=True) and (length(dblcCCBco.Text)=0) then
   begin
      raise exception.Create('Falta Cuenta Corriente Banco');
   end;
   if (dbeNoChq.Enabled=True) and (length(dbeNoChq.Text)=0) then
   begin
      raise exception.Create('Falta No. de Cheque');
   end;
   if length(dbeElabo.Text)=0 then raise exception.Create('Falta "Elaborado por:"');
   if length(dbeAprob.Text)=0 then raise exception.Create('Falta "Aprobado por:"');

   Result := True;
end;

procedure TFPagos.Actualizasaldos( xNuevo : Boolean);
begin
   DMCXP.cdsMovCxP.DisableControls;
   DMCXP.cdsMovCxP.Filtered:=False;
   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.First;
   While not DMCXP.cdsCanje.Eof do Begin
      DMCXP.cdsCanje.Edit;
      DMCXP.cdsMovCxP.Setkey;
      DMCXP.cdsMovCxP.FieldByName('CIAID').AsString   :=DMCXP.cdsCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString :=DMCXP.cdsCanje.FieldByName('TDIARID').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPANOMEs').AsString:=DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString :=DMCXP.cdsCanje.FieldByName('CPNOREg').AsString;
      if DMCXP.cdsMovCxP.GotoKey then begin
         DMCXP.cdsCanje.Edit;
         If DMCXP.wTMonLoc=DMCXP.cdsCanje.FieldByName('TMONID').AsString then
            DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2)
         else begin
            DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2) ;
         end;
         DMCXP.cdsMovCxP.Edit;
         If DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then begin
            DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoLoc').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat,15,2);
            DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
            end
         else begin
            DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoExt').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat,15,2);
            DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCCje').AsFloat,15,2);
         end;
      end;
      DMCXP.cdsCanje.Next;
   end;
   DMCXP.cdsCanje.First;
   DMCXP.cdsCanje.EnableControls;
   DMCXP.cdsMovCxP.Filtered:=True;
   DMCXP.cdsMovCxP.EnableControls;
end;

{*******************************************************
TERCER PANEL - DOCUMENTOS PENDIENTES DE CANCELACION
*******************************************************}

// Para Enviar a Documentos de Canje

procedure TFPagos.dbgPendienteMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgPendiente.BeginDrag(False);
end;

procedure TFPagos.dbgPendienteEndDrag(Sender, Target: TObject; X, Y: Integer);
var
  i: integer;
begin
   With DMCXP do Begin
      If Target=dbgDocCanje Then Begin
         DMCXP.cdsMovCxP.DisableControls;
         // Verifica que Documentos No Esten Pendientes de Actualización
         for i:= 0 to dbgPendiente.SelectedList.Count-1 do begin
             dbgPendiente.datasource.dataset.GotoBookmark(dbgPendiente.SelectedList.items[i]);
             If cdsMovCxP.FieldByName('TMonID').AsString = wTMonLoc then begin
                 If FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoLoc').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat,15,2)<>
                    FRound(DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat,15,2) then begin
                    ShowMessage('Error : Documento esta en Proceso de cancelación');
                    dbgPendiente.SelectedList.clear;
                    DMCXP.cdsMovCxP.First;
                    DMCXP.cdsMovCxP.EnableControls;
                    Exit;
                 end;
               end
             else begin
                If FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoExt').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat,15,2)<>
                   FRound(DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat,15,2) then begin
                   ShowMessage('Error : Documento esta en Proceso de cancelación');
                   dbgPendiente.SelectedList.clear;
                   DMCXP.cdsMovCxP.First;
                   DMCXP.cdsMovCxP.EnableControls;
                   Exit;
                end;
             end;
         end;//FOR

         ////////////////////////////////

         cdsCanje.DisableControls;
         for i:= 0 to dbgPendiente.SelectedList.Count-1 do begin
             dbgPendiente.datasource.dataset.GotoBookmark(dbgPendiente.SelectedList.items[i]);
             cdsCanje.SetKey;
             cdsCanje.FieldByName('CIAID').AsString    := DMCXP.cdsMovCxP.FieldByName('CiaID').AsString;
             cdsCanje.FieldByName('TCANJEID').AsString := 'OP';
             cdsCanje.FieldByName('CCPCANJE').AsString := meOPago.Text;
             cdsCanje.FieldByName('TDIARID').AsString  := DMCXP.cdsMovCxP.FieldByName('TDiarID').AsString;
             cdsCanje.FieldByName('CCPANOMM').AsString := DMCXP.cdsMovCxP.FieldByName('CPAnoMes').AsString;
             cdsCanje.FieldByName('CPNOREG').AsString  := DMCXP.cdsMovCxP.FieldByName('CPNoReg').AsString;
             if not cdsCanje.GotoKey then begin
                cdsCanje.Insert;
                cdsCanje.FieldByName('CIAID').AsString    := cdsMovCxP.FieldByName('CIAID').AsString;
                cdsCanje.FieldByName('TDIARID').AsString  := cdsMovCxP.FieldByName('TDIARID').AsString;
                cdsCanje.FieldByName('CPNOREG').AsString  := cdsMovCxP.FieldByName('CPNOREG').AsString;
                cdsCanje.FieldByName('CCPANOC').AsString  := cdsMovCxP.FieldByName('CPAAAA').AsString;
                cdsCanje.FieldByName('CCPANOMM').AsString := cdsMovCxP.FieldByName('CPANOMES').AsString;
                cdsCanje.FieldByName('CLAUXID').AsString  := cdsMovCxP.FieldByName('CLAUXID').AsString;
                cdsCanje.FieldByName('PROV').AsString     := cdsMovCxP.FieldByName('PROV').AsString;
                cdsCanje.FieldByName('PROVRUC').AsString  := cdsMovCxP.FieldByName('PROVRUC').AsString;
                cdsCanje.FieldByName('DOCID').AsString    := cdsMovCxP.FieldByName('DOCID').AsString;
                cdsCanje.FieldByName('LKDOCID').AsString  := cdsMovCxP.FieldByName('LKDOCID').AsString;
                cdsCanje.FieldByName('CPSERIE').AsString  := cdsMovCxP.FieldByName('CPSERIE').AsString;
                cdsCanje.FieldByName('CPNODOC').AsString  := cdsMovCxP.FieldByName('CPNODOC').AsString;
                cdsCanje.FieldByName('TCANJEID').AsString := 'OP';  // Orden de Pago
                cdsCanje.FieldByName('CCPCANJE').AsString := meOPago.Text;
                cdsCanje.FieldByName('CCPFCJE').AsDateTime:= cdsMovCxP.FieldByName('CPFCANJE').AsdateTime;
                cdsCanje.FieldByName('TMONID').AsString   := cdsMovCxP.FieldByName('TMONID').AsString;
                cdsCanje.FieldByName('CCPMOORI').AsFloat  := FRound(cdsMovCxP.FieldByName('CPMTOORI').AsFloat,15,2);
                cdsCanje.FieldByName('CCPMOLOC').AsFloat  := FRound(cdsMovCxP.FieldByName('CPSALLOC').AsFloat,15,2);
                cdsCanje.FieldByName('CCPMOEXT').AsFloat  := FRound(cdsMovCxP.FieldByName('CPSALEXT').AsFloat,15,2);
                cdsCanje.FieldByName('CCPTCDOC').Asfloat  := FRound(cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,8,3);
                cdsCanje.FieldByName('CCPTCCJE').Asfloat  := FRound(strtofloat(dbeTCambio.Text),8,3);
                cdsCanje.FieldByName('CCPESTDO').AsString := 'P';
                cdsCanje.FieldByName('CTATOTAL').AsString := cdsMovCxP.FieldByName('CTATOTAL').AsString;
                cdsCanje.FieldByName('CPTOTOT').AsString  := cdsMovCxP.FieldByName('CPTOTOT').AsString;
                cdsCanje.FieldByName('CPFVCMTO').AsDateTime:=cdsMovCxP.FieldByName('CPFVCMTO').AsDateTime;
                cdsCanje.FieldByName('CCPUSER').AsString  := DMCXP.wUsuario;
                cdsCanje.FieldByName('CCPFREG').AsDateTime:= Date;
                cdsCanje.FieldByName('CCPHREG').AsDateTime:= Time;

                cdsMovCxP.Edit;
                cdsMovCxP.FieldByName('CPCanje').AsString := meOPago.Text;
                cdsMovCxP.Post;
             end;
             dbgPendiente.datasource.dataset.Freebookmark(dbgPendiente.SelectedList.items[i]);
         end; // for
         dbgPendiente.SelectedList.clear;  { Clear selected record list since they are all deleted}
         cdsCanje.EnableControls;
         cdsMovCxP.EnableControls;
         bbtnSumat.click;
      end; // target
   end; // DMCXP
end;

// Para Recibir los Documentos de Canje

procedure TFPagos.dbgPendienteDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

{*******************************************************
CUARTO PANEL - DOCUMENTOS DE CANJE
*******************************************************}

// Para Recibir los Documentos Pendientes

procedure TFPagos.dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

// Para Enviar los Doc. de Canje a Pendientes

procedure TFPagos.dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocCanje.BeginDrag(False);
end;

procedure TFPagos.dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   If Target=dbgpendiente Then Begin
      With DMCXP do Begin
         cdsMovCxP.Filtered:=False;
         cdsMovCxP.SetKey;
         cdsMovCxP.FieldByName('CiaID').AsString   :=cdsCanje.FieldByName('CIAID').AsString   ;
         cdsMovCxP.FieldByName('TDiarID').AsString :=cdsCanje.FieldByName('TDIARID').AsString;
         cdsMovCxP.FieldByName('CPAnoMes').AsString:=cdsCanje.FieldByName('CCPANOMM').AsString;
         cdsMovCxP.FieldByName('CPNoReg').AsString :=cdsCanje.FieldByName('CPNOREG').AsString;

         if cdsMovCxP.GotoKey then begin
            cdsMovCxP.Edit;
            DMCXP.cdsMovCxP.FieldByName('TCanjeID').AsString:='';
            DMCXP.cdsMovCxP.FieldByName('CPCanje').AsString :='';

            If DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=wTMonLoc then begin
               DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoLoc').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat,15,2);
               If DMCXP.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat > 0 then
                  DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat/DMCXP.cdsMovCxP.FieldByName('CPTCamPa').AsFloat,15,2)
               else begin
                  DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat/DMCXP.cdsMovCxP.FieldByName('CPTCamPr').AsFloat,15,2);
               end;
               end
            else begin
               DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoExt').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat,15,2);
               If DMCXP.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat > 0 then
                  DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCamPa').AsFloat,15,2)
               else begin
                  DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCamPr').AsFloat,15,2);
               end;
            end;
            DMCXP.cdsMovCxP.Post;

            cdsCanje.Delete;
         end;
         cdsMovCxP.Filtered:=True;
      end;
   end;
end;

////////  Botones

procedure TFPagos.bbtnSumatClick(Sender: TObject);
Var
   xRegAct : TBookMark;
begin
   with DMCXP do begin
   // Totales de Documentos de canje
      cdsCanje.DisableControls;
      xRegAct := cdsCanje.GetBookmark;
      xTSalLoc := 0; xTSalExt := 0; xTPagLoc := 0; xTPagExt := 0;
      cdsCanje.First ;
      while not cdsCanje.Eof do begin
         xTSalLoc := xTSalLoc + cdsCanje.FieldByName('CPSALLOC').AsFloat;
         xTSalExt := xTSalExt + cdsCanje.FieldByName('CPSALEXT').AsFloat;
         xTPagLoc := xTPagLoc + cdsCanje.FieldByName('CCPMOLOC').AsFloat;
         xTPagExt := xTPagExt + cdsCanje.FieldByName('CCPMOEXT').AsFloat;
         cdsCanje.Next;
      end;
      dbgDocCanje.ColumnByName('CPSalLoc').FooterValue:=floattostrf(xTSalLoc, ffNumber, 10, 2);
      dbgDocCanje.ColumnByName('CPSalExt').FooterValue:=floattostrf(xTSalExt, ffNumber, 10, 2);
      dbgDocCanje.ColumnByName('CCPMoLoc').FooterValue:=floattostrf(xTPagLoc, ffNumber, 10, 2);
      dbgDocCanje.ColumnByName('CCPMoExt').FooterValue:=floattostrf(xTPagExt, ffNumber, 10, 2);
      cdsCanje.GotoBookmark(xRegAct);
      cdsCanje.FreeBookmark(xRegAct);
      cdsCanje.EnableControls;
   end;
end;

{*******************************************
Grabación Final de la Orden de Pago
********************************************}

procedure TFPagos.Z2bbtnGrabaClick(Sender: TObject);
var
  xRegAct : TBookMark;
  xPagLoc, xPagExt : double;
begin
   with DMCXP do begin
   // Verifica que existan Documentos
      if cdsCanje.RecordCount=0 then begin
         raise exception.Create(' No hay Documentos a Pagar ');
      end;

      DMCXP.cdsMovCxP.DisableControls;
      DMCXP.cdsMovCxP.Filtered:=False;
      DMCXP.cdsCanje.DisableControls;
      xRegAct := DMCXP.cdsCanje.GetBookmark;
      DMCXP.cdsCanje.First;
      While not DMCXP.cdsCanje.Eof do Begin
         DMCXP.cdsCanje.Edit;
         DMCXP.cdsMovCxP.Setkey;
         DMCXP.cdsMovCxP.FieldByName('CIAID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
         DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsCanje.FieldByName('TDIARID').AsString;
         DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString := DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString;
         DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsCanje.FieldByName('CPNOREG').AsString;
         if DMCXP.cdsMovCxP.GotoKey then begin
            If DMCXP.cdsMovCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then begin
               If FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2)>FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoLoc').AsFloat,15,2) Then begin
                  DMCXP.cdsCanje.EnableControls;
                  DMCXP.cdsMovCxP.Filtered:=True;
                  DMCXP.cdsMovCxP.EnableControls;
                  Raise exception.Create('Error : Monto pagado excede a Monto Total de Documento');
               end;
               end
            else begin
               If FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGEXt').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2)>FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoExt').AsFloat,15,2) Then begin
                  DMCXP.cdsCanje.EnableControls;
                  DMCXP.cdsMovCxP.Filtered:=True;
                  DMCXP.cdsMovCxP.EnableControls;
                  Raise exception.Create('Error : Monto pagado excede a Monto Total de Documento');
               End;
            end;

            DMCXP.cdsMovCxP.edit;
            If DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then begin
               xPagLoc:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
               DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat-xPagLoc,15,2);
               DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
               end
            else begin
               xPagExt:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2);
               DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat-xPagExt,15,2);
               DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
            end;
            DMCXP.cdsMovCxP.post;
         end;
         DMCXP.cdsCanje.Next;
      end;
      DMCXP.cdsCanje.GotoBookmark(xRegAct);
      DMCXP.cdsCanje.FreeBookmark(xRegAct);
      DMCXP.cdsCanje.EnableControls;
      DMCXP.cdsMovCxP.Filtered:=True;
      DMCXP.cdsMovCxP.EnableControls;

      DMCXP.cdsOPago.Edit;
      if DMCXP.cdsOPago.FieldByName('TMONID').AsString = wTMonLoc then
         DMCXP.cdsOPago.FieldByName('OPMTOORI').AsFloat := xTPagLoc
      else
         DMCXP.cdsOPago.FieldByName('OPMTOORI').AsFloat := xTPagExt;
      DMCXP.cdsOPago.FieldByName('OPMTOLOC').AsFloat := xTPagLoc;
      DMCXP.cdsOPago.FieldByName('OPMTOEXT').AsFloat := xTPagExt;
      DMCXP.cdsOPago.FieldByName('OPESTADO').AsString:= 'I';
      DMCXP.cdsOPago.FieldByName('OPUSER').AsString  := DMCXP.wUsuario;  // usuario que registra
      DMCXP.cdsOPago.FieldByName('OPFREG').AsDateTime:= date;          // fecha que registra usuario
      DMCXP.cdsOPago.FieldByName('OPHREG').AsDateTime:= time;          // hora que registra usuario
      DMCXP.cdsOPago.Post;

      DMCXP.AplicaDatos( DMCXP.cdsOPago,  'OPago'  );
      DMCXP.AplicaDatos( DMCXP.cdsCanje,  'Canje'  );
      DMCXP.AplicaDatos( DMCXP.cdsMovCxP, 'MovCxP' );

      EstadoDeForma(1,DMCXP.cdsOPago.FieldByName('OPESTADO').AsString,' ' );

      xFlagGr:= False;

      ShowMessage('Orden de Pago Grabada');
   end;
end;

procedure TFPagos.bbtnCalcClick(Sender: TObject);
begin
   WinExec('C:\windows\calc.exe',1 );  // Executa Aplicación
end;

{*******************************************************
FIN DE LA FORMA
*******************************************************}

procedure TFPagos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMCXP.cdsMovCxP.CancelUpdates;
   DMCXP.cdsCanje.CancelUpdates;
   DMCXP.cdsDetCanje.CancelUpdates;

   If ( DMCXP.wModo='A' ) and ( xFlagGr ) then begin
      DMCXP.cdsOPago.Delete;
      DMCXP.AplicaDatos( DMCXP.cdsOPago, 'OPago' );
      end
   else begin
      DMCXP.cdsOPago.CancelUpdates;
   end;
end;

procedure TFPagos.bbtnCancelaClick(Sender: TObject);
begin
   DMCXP.cdsMovCxP.CancelUpdates;
   DMCXP.cdsCanje.CancelUpdates;

   EstadoDeForma(0,DMCXP.cdsOPago.FieldByName('OPESTADO').AsString,' ' )
end;

procedure TFPagos.Z2bbtnAceptaClick(Sender: TObject);
var
   xClAux : String;
   xTotMN, xTotME : double;
begin
   DMCXP.cdsMovCxP.DisableControls;
   DMCXP.cdsMovCxP.Filtered:=False;
   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.First;
   While not DMCXP.cdsCanje.Eof do Begin
      DMCXP.cdsMovCxP.Setkey;
      DMCXP.cdsMovCxP.FieldByName('CiaID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsMovCxP.FieldByName('TDiarID').AsString  := DMCXP.cdsCanje.FieldByName('TDIARID').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPAnoMes').AsString := DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPNoReg').AsString  := DMCXP.cdsCanje.FieldByName('CPNOREG').AsString;
      if DMCXP.cdsMovCxP.GotoKey then begin
         xClAux := DMCXP.cdsMovCxP.FieldByName('ClAuxID').AsString;
         DMCXP.cdsMovCxP.edit;
         If DMCXP.cdsMovCxP.FieldByName('TMonID').AsString=DMCXP.wTMonLoc then begin
            DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
            DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
            If DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat <= 0 then
               DMCXP.cdsMovCxP.FieldByName('CPEstado').AsString:='C';
            end
         else begin
            DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2);
            DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
            If DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat <= 0 then
               DMCXP.cdsMovCxP.FieldByName('CPEstado').AsString:='C';
         end;
         DMCXP.cdsMovCxP.FieldByName('CPTCamPa').AsFloat:=FRound(DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
         DMCXP.cdsMovCxP.post;
      end;
      DMCXP.cdsCanje.Next;
   end;
   DMCXP.cdsMovCxP.Filtered:=True;
   DMCXP.cdsMovCxP.First;
   DMCXP.cdsMovCxP.EnableControls;
   DMCXP.cdsCanje.EnableControls;
////
   DMCXP.cdsDetCanje.First;
   While (not DMCXP.cdsDetCanje.Eof)and(DMCXP.cdsDetCanje.RecordCount>0) do
      DMCXP.cdsDetCanje.Delete;

   xTotMN := 0;
   xTotME := 0;
   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.First;
   While not DMCXP.cdsCanje.Eof do begin
      DMCXP.cdsDetCanje.Insert;
      DMCXP.cdsDetCanje.FieldByName('CIAID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').ASString;
      DMCXP.cdsDetCanje.FieldByName('CLAUXID').AsString  := DMCXP.cdsCanje.FieldByName('CLAUXID').AsString;
      DMCXP.cdsDetCanje.FieldByName('PROV').AsString     := DMCXP.cdsCanje.FieldByName('PROV').ASString;
      DMCXP.cdsDetCanje.FieldByName('PROVRUC').AsString  := DMCXP.cdsCanje.FieldByName('PROVRUC').AsString;
      DMCXP.cdsDetCanje.FieldByName('DOCID').AsString    := DMCXP.cdsCanje.FieldByName('DOCID').ASString;
      DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString  := DMCXP.cdsCanje.FieldByName('CPSERIE').AsString;
      DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString  := DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
      DMCXP.cdsDetCanje.FieldByName('CPNOREG').AsString  := DMCXP.cdsCanje.FieldByName('CPNOREG').AsString;
      DMCXP.cdsDetCanje.FieldByName('TCANJEID').AsString := DMCXP.cdsCanje.FieldByName('TCANJEID').AsString;
      DMCXP.cdsDetCanje.FieldByName('CCPCANJE').AsString := DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString;
      DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsString  := DMCXP.cdsCanje.FieldByName('CCPFCJE').AsString;
      DMCXP.cdsDetCanje.FieldByName('DOCID2').AsString   := wDocOP;
      DMCXP.cdsDetCanje.FieldByName('CPSERIE2').AsString := '000';
      DMCXP.cdsDetCanje.FieldByName('CPNODOC2').AsString := meOPago.Text;
      DMCXP.cdsDetCanje.FieldByName('TMONID').AsString   := DMCXP.cdsCanje.FieldByName('TMONID').AsString;

      If DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then begin
         DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := FRound(DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
         DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat := FRound(DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat,15,2);
         xTotMN := xTotMN + DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
         xTotME := xTotME + DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
         end
      else begin
         DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat := FRound(DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2);
         DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := FRound(DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat,15,2);
         xTotMN := xTotMN + DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
         xTotME := xTotME + DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
      end;

      DMCXP.cdsDetCanje.FieldByName('DCDUSER').AsString  := DMCXP.cdsCanje.FieldByName('CCPUSER').AsString;
      DMCXP.cdsDetCanje.FieldByName('DCDFREG').AsString  := DMCXP.cdsCanje.FieldByName('CCPFREG').AsString;
      DMCXP.cdsDetCanje.FieldByName('DCDHREG').AsString  := DMCXP.cdsCanje.FieldByName('CCPHREG').AsString;
      DMCXP.cdsDetCanje.FieldByName('DCDAAAA').AsString  := DMCXP.cdsCanje.FieldByName('CCPANOC').AsString;
      DMCXP.cdsDetCanje.FieldByName('DCDMM').AsString    := DMCXP.cdsCanje.FieldByName('CCPMM').AsString;
      DMCXP.cdsDetCanje.FieldByName('DCDDD').AsString    := DMCXP.cdsCanje.FieldByName('CCPDD').AsString;
      DMCXP.cdsDetCanje.FieldByName('DCDTRI').AsString   := DMCXP.cdsCanje.FieldByName('CCPTRI').AsString;
      DMCXP.cdsDetCanje.FieldByName('DCDSEM').AsString   := DMCXP.cdsCanje.FieldByName('CCPSEM').AsString;
      DMCXP.cdsDetCanje.FieldByName('DCDSS').AsString    := DMCXP.cdsCanje.FieldByName('CCPSS').AsString;
      DMCXP.cdsDetCanje.FieldByName('DCDANOMM').AsString := DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString;
      DMCXP.cdsDetCanje.FieldByName('DCDAATRI').AsString := DMCXP.cdsCanje.FieldByName('CCPAATRI').AsString;
      DMCXP.cdsDetCanje.FieldByName('DCDAASEM').AsString := DMCXP.cdsCanje.FieldByName('CCPAASEM').AsString;
      DMCXP.cdsDetCanje.FieldByName('DCDAASS').AsString  := DMCXP.cdsCanje.FieldByName('CCPAASS').AsString;
      DMCXP.cdsCanje.Next;
   end;
   DMCXP.cdsDetCanje.First;
   DMCXP.cdsCanje.First;
   DMCXP.cdsCanje.EnableControls;

   DMCXP.cdsOPago.Edit;
   DMCXP.cdsOPago.FieldByName('OPESTADO').AsString:='P';  // Pendiente

   DMCXP.SaldosAuxiliar( DMCXP.cdsOPago.FieldByName('CIAID').AsString, DMCXP.cdsOPago.FieldByName('OPANOMM').Asstring,
                       xClAux, DMCXP.cdsOPago.FieldByName('PROV').AsString,
                    '-', xTotMN, xTotME, DMCXP.cdsOPago.FieldByName('TMONID').AsString );

   DMCXP.AplicaDatos( DMCXP.cdsOPago,   'OPago'   );
   DMCXP.AplicaDatos( DMCXP.cdsDetCanje,'DetCanje');
   DMCXP.AplicaDatos( DMCXP.cdsMovCxP,  'MovCxP'  );

   EstadoDeForma(1,DMCXP.cdsOPago.FieldByName('OPESTADO').AsString,' ' );

   ShowMessage(' Orden de Pago Aceptada ');
end;

procedure TFPagos.Z2bbtnImprimeClick(Sender: TObject);
begin
   pprOPago.Print;
end;

procedure TFPagos.ppDBText5GetText(Sender: TObject; var Text: String);
begin
{   if DMCXP.cdsOPagoTMonID.Value=DMCXP.wTMonLoc then
      ppDBText5.DataField := 'OPMTOLOC'
   else
      ppDBText5.DataField := 'OPMTOEXT'
}
end;

procedure TFPagos.ppDBText5Print(Sender: TObject);
begin
   if DMCXP.cdsOPago.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
      ppDBText5.DataField := 'CCPMOLOC'
   else
      ppDBText5.DataField := 'CCPMOEXT'


end;

procedure TFPagos.ppDBCalc1Print(Sender: TObject);
begin
   if DMCXP.cdsOPago.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
      ppDBCalc1.DataField := 'CCPMOLOC'
   else
      ppDBCalc1.DataField := 'CCPMOEXT'

end;

procedure TFPagos.dbgDocCanjeColExit(Sender: TObject);
begin
   if dbgDocCanje.SelectedField.FieldName='CCPTCCJE' then begin
      dbgDocCanje.RefreshDisplay;
   end;

   if dbgDocCanje.SelectedField.FieldName='CCPMOLOC' then begin
      if FRound(DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2)>FRound(DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat,15,2) then begin
         ShowMessage('Monto excede a Saldo Actual');
         dbgDocCanje.SelectedIndex:=8; // debería ser 9 pero no hace caso
         dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
         end
      else begin
         bbtnSumatClick(Sender);
      end;
   end;

   if dbgDocCanje.SelectedField.FieldName='CCPMOEXT' then begin
      if FRound(DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2)>Fround(DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat,15,2) then begin
         ShowMessage('Monto excede a Saldo Actual');
         dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
         dbgDocCanje.SelectedIndex:=10; // debería ser 9 pero no hace caso
         end
      else begin
         bbtnSumatClick(Sender);
      end;
   end;
end;

procedure TFPagos.Z2bbtnNuevoClick(Sender: TObject);
begin
   if DMCXP.wAdmin='G' then Exit;
   if MessageDlg('Ingresar Nueva Orden de Pago'+chr(13)+chr(13)+
                 '     ¿ Esta Seguro ?    ',mtConfirmation, [mbYes, mbNo], 0)=mrNo
   then Exit;

   If ( DMCXP.wModo='A' ) and ( xFlagGr ) then begin
      DMCXP.cdsOPago.Delete;
      DMCXP.AplicaDatos( DMCXP.cdsOPago, 'OPago' );
   end;
   DMCXP.cdsOPago.Insert;
   IniciaDatos;
   EstadoDeForma( 0, ' ', ' ' );
end;

procedure TFPagos.bbtnRegresaClick(Sender: TObject);
begin
   EstadoDeForma(0,DMCXP.cdsOPago.FieldByName('OPESTADO').AsString,' ' )
end;

procedure TFPagos.Z2bbtnAnulaClick(Sender: TObject);
begin
   // Anula Orden de Pago
   DMCXP.cdsOPago.Edit;
   DMCXP.cdsOPago.FieldByName('OPESTADO').value:='A';  // Anulada

   // Actualiza los Saldos de los Documentos Canjeados
   DMCXP.cdsMovCxP.DisableControls;
   DMCXP.cdsMovCxP.Filtered:=False;
   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.First;
   While not DMCXP.cdsCanje.Eof do Begin
      if ExisteMovCxP( DMCXP.cdsCanje.FieldByName('CIAID').AsString,DMCXP.cdsCanje.FieldByName('TDIARID').AsString,
                       DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString,DMCXP.cdsCanje.FieldByName('CPNOREG').AsString) then begin
         DMCXP.cdsMovCxP.Edit;
         If DMCXP.cdsMovCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then begin
            DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoLoc').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat,15,2);
            If DMCXP.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat > 0 then
               DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat/DMCXP.cdsMovCxP.FieldByName('CPTCamPa').AsFloat,15,2)
            else begin
               DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat/DMCXP.cdsMovCxP.FieldByName('CPTCamPr').AsFloat,15,2);
            end;
            end
         else begin
            DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoExt').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat,15,2);
            If DMCXP.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat>0 then
               DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCamPa').AsFloat,15,2)
            else begin
               DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCamPr').AsFloat,15,2);
            end;
         end;
      end;
      DMCXP.cdsCanje.Next;
   end;
   DMCXP.cdsCanje.EnableControls;
   DMCXP.cdsMovCxP.Filtered:=True;
   DMCXP.cdsMovCxP.EnableControls;

   DMCXP.AplicaDatos( DMCXP.cdsOPago, 'OPago'  );
   DMCXP.AplicaDatos( DMCXP.cdsMovCxP,'MovCxP' );

   EstadoDeForma(1,DMCXP.cdsOPago.FieldByName('OPESTADO').AsString,' ' );

   ShowMessage(' Orden de Pago ANULADA ');
end;

Function TFPagos.ExisteMovCxP(xxCia,xxTDiario,xxAAMM,xxNoReg:String):Boolean;
begin
   DMCXP.cdsMovCxP.Setkey;
   DMCXP.cdsMovCxP.FieldByName('CiaId').AsString    := xxCia;
   DMCXP.cdsMovCxP.FieldByName('TDiarID').AsString  := xxTDiario;
   DMCXP.cdsMovCxP.FieldByName('CPAnoMes').AsString := xxAAMM;
   DMCXP.cdsMovCxP.FieldByName('CPNoReg').AsString  := xxNoReg;
   if DMCXP.cdsMovCxP.GotoKey then
      Result := True
   else
      Result := False;
end;

procedure TFPagos.dbeTCambioExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if bbtnOK.Focused  then Exit;

   if length(dbeTCambio.Text)=0 then begin
      ShowMessage('Falta Tipo de Cambio');
      dbeTCambio.SetFocus;
      exit;
   end;
   dbeTCambio.Text:=floattostr(strtofloat(dbeTCambio.Text));
   if strtofloat(dbeTCambio.Text)<0 then begin
      ShowMessage('Tipo de Cambio debe ser Mayor a 0');
      dbeTCambio.SetFocus;
      exit;
   end;
end;

procedure TFPagos.dbdtpFPagoExit(Sender: TObject);
var
   xWhere   : String;
   xFCierre : TDate;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if bbtnOK.Focused  then Exit;

   xWhere := 'CiaId='+''''+dblcCia.Text+'''';
   xFCierre := DMCXP.BuscaUltFecha('PrvUltCxP','CXP202','FCierre',xWhere);
   if dbdtpFPago.Date<=xFCierre then begin
      ShowMessage(' Error :  Ultima Fecha de Cierre '+DateToStr(xFCierre) );
      dbdtpFPago.SetFocus;
      exit;
   end;

   // Tipo de Cambio
   xWhere:='TMonId='+''''+DMCXP.wTMonExt            +''''+' and '
          +'Fecha=DATE('+''''+ FORMATDATETIME(DMCXP.wFormatFecha,dbdtpFPago.Date)+''''+')';
   if length(BuscaQry('PrvTGE','TGE107','*',xWhere,'TMonId'))>0 then
      xxTCambio:=DMCXP.cdsQry.fieldbyname('TCam'+DMCXP.wVRN_TipoCambio).Value
   else begin
      dbdtpFPago.SetFocus;
      Raise Exception.Create( ' Error :  Fecha No tiene Tipo de Cambio ' );
   end;

   if (DMCXP.wVRN_TCambioFijo='S') or
      ( (DMCXP.wVRN_TCambioFijo='N') and (DMCXP.cdsOPago.FieldByName('OPTCAMB').AsFloat=0) ) then begin
      dbeTCambio.Text:= floattostr(FRound(xxTCambio,7,3));
      DMCXP.cdsOPago.Edit;
      DMCXP.cdsOPago.FieldByName('OPTCAMB').AsFloat := FRound(xxTCambio,7,3);
      DMCXP.cdsOPago.Post;
   end;
end;


procedure TFPagos.MuestraEstado( xMovEstado, xMovConta : String ) ;
begin
   lblAcepta.Visible   := False;
   lblActivo.Visible := False;
   lblContab.Visible     := False;
   lblAnula.Visible    := False;

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
               lblActivo.Visible:=True;

end;



procedure TFPagos.dblcTMonExit(Sender: TObject);
var
   xWhere : string;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if bbtnOK.Focused  then Exit;

   xWhere:='TMonId='''+dblcTMon.Text+''' and (TMon_Loc=''L'' or TMon_Loc=''E'')';
   edtTMon.Text:=BuscaQry('PrvTGE','TGE103','TMONDES',xWhere,'TMONDES');
   if length(edtTMon.Text)=0 then begin
      ShowMessage('Falta Tipo de Moneda');
      dblcTMon.SetFocus;
      exit;
   end;

end;

procedure TFPagos.dblcCiaExit(Sender: TObject);
begin
   If xCrea Then Exit;
   if bbtnSalir.Focused then exit;

   edtCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);
   if length(edtCia.Text)=0 then begin
      dblcCia.SetFocus;
      Raise Exception.Create('Falta Código de Compañía');
      end
   else begin
   // determina último número de Orden de Pago incrementado en 1
      meOPago.Text:=DMCXP.UltimoRegistro(' ',dblcCia.Text,'OP','','' );
      meOPago.Text:=Strzero(meOPago.Text,DMCXP.cdsOPago.FieldByName('OPAGO').DisplayWidth);
   end;
   meOPago.SetFocus;
end;

procedure TFPagos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFPagos.dblcFormPagoExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if bbtnOK.Focused  then Exit;

   edtFormPago.Text:=DMCXP.DisplayDescrip('TGE112','FPagoDes','FPagoId',dblcFormPago.Text);
   if length(edtFormPago.Text)>0 then begin
      if DMCXP.cdsUltTGE.FieldByName('FPagoBco').Value='S' then begin
         dblcBanco.Enabled:=True;
         dblcCCBco.Enabled:=True;
         dbeNoChq.Enabled :=True;
         dblcBanco.TabOrder:=8;
         dblcCCBco.TabOrder:=9;
         dbeNoChq.TabOrder :=10;
         dblcBanco.SetFocus;
         end
      else begin
         dblcBanco.Enabled:=False;
         dblcCCBco.Enabled:=False;
         dbeNoChq.Enabled :=False;
         dblcBanco.Text:='';
         edtBanco.Text :='';
         dblcCCBco.Text:='';
         edtCCBco.Text :='';
         dbeNoChq.Text :='';
      end;
      end
   else begin
      dblcFormPago.SetFocus;
      Raise Exception.Create('Falta Forma de Pago');
   end;
end;

procedure TFPagos.dblcBancoExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if bbtnOK.Focused  then Exit;

   edtBanco.Text:=DMCXP.DisplayDescrip('TGE105','BancoNom','BancoId',dblcBanco.Text);
   if length(edtBanco.Text)>0 then begin
      DMCXP.cdsCCBco.Filter:='';
      DMCXP.cdsCCBco.Filter:='BANCOID='+''''+dblcBanco.Text+'''';
      DMCXP.cdsCCBco.Filtered:=True;
      dblcCCBco.Enabled:=true;
   end;
end;

procedure TFPagos.dblcCCBcoExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if bbtnOK.Focused  then Exit;

   edtCCBco.Text:=DMCXP.DisplayDescrip('TGE106','CCBcoDes','CCBcoId',dblcCCBco.Text);
end;

procedure TFPagos.dbgDocCanjeCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   If DMCXP.wVRN_PagosParciales='S' then begin
      If (FIELD.FieldName='CCPTCCJE') or
         (FIELD.FieldName='CCPMOLOC') or
         (FIELD.FieldName='CCPMOEXT') then begin
         AFont.Color  := clBlack;
         ABrush.Color := clWindow;
      end;
   end;
end;

procedure TFPagos.FormCreate(Sender: TObject);
begin
   If DMCXP.wAdmin='G' then begin
      DMCXP.wObjetoDesPr := Caption;
      FPrincipal.ListaComponentes(Self);
   end;
end;

procedure TFPagos.bbtnSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFPagos.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
   
   FPagos.Repaint;
end;

procedure TFPagos.dblcdProvRucEnter(Sender: TObject);
begin
   DMCXP.cdsProv.IndexFieldNames:='ProvDes';
end;

procedure TFPagos.dblcdProvEnter(Sender: TObject);
begin
   DMCXP.cdsProv.IndexFieldNames:='ProvDes';
end;

procedure TFPagos.dblcClAuxExit(Sender: TObject);
var
   xWhere : String;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if bbtnOK.Focused  then Exit;

   xWhere:='ClAuxId='''+dblcClAux.Text+''' and MODULO LIKE ''%'+DMCXP.wModulo+'%''';
   if length(BuscaQry('dspTGE','TGE102','CLAUXDES',xWhere,'CLAUXDES'))=0 then
   begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Clase de Auxiliar');
   end;

   Filtracds( DMCXP.cdsProv,'Select * from TGE201 Where CLAUXID='''+dblcClAux.Text+'''' );

   if Length(dblcdProv.Text)>0 then begin
      xWhere:='ClAuxId='''+dblcClAux.Text+''' and Prov='''+dblcdProv.Text+'''';
      if length(BuscaQry('dspTGE','TGE201','PROV,PROVRUC,PROVDES,ProvGirA',xWhere,'PROVDES'))=0 then
      begin
         dblcdProv.Text   :='';
         dblcdProvRuc.Text:='';
         dbeGiradoA.Text  :='';
         dblcdprov.SetFocus;
      end
      else begin
         dblcdProv.Text   :=DMCXP.cdsQry.FieldByname('PROV').AsString;
         dblcdProvRuc.Text:=DMCXP.cdsQry.FieldByname('PROVRUC').AsString;
      end;
   end;
   if Length(dblcdProv.Text)=0 then dblcdProv.SetFocus;
end;

end.
