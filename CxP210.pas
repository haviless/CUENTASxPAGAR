unit CxP210;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdbdlg, Mask, wwdbedit, wwdbdatetimepicker, StdCtrls, Buttons, wwdblook,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,DB, ppCtrls, ppBands, ppVar,
  ppPrnabl, ppClass, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppCache,
  ppDBPipe, ppViewr, pptypes, oaVariables;

type
  TFCanjeCxC = class(TForm)
    pnlCabecera: TPanel;
    pnlCab1: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    pnlCab2: TPanel;
    bbtnOK: TBitBtn;
    bbtnBorra: TBitBtn;
    dblcTMon: TwwDBLookupCombo;
    Label11: TLabel;
    edtTMon: TEdit;
    Label9: TLabel;
    dtpFEmis: TwwDBDateTimePicker;
    Label12: TLabel;
    dbeTCambio: TwwDBEdit;
    lblProv: TLabel;
    dblcdProv: TwwDBLookupComboDlg;
    lblProvRuc: TLabel;
    dblcdProvRuc: TwwDBLookupComboDlg;
    lblProvNom: TLabel;
    edtProv: TEdit;
    Panel1: TPanel;
    pnlPie: TPanel;
    Label4: TLabel;
    bbtnCalc: TBitBtn;
    pnlEstado: TPanel;
    lblAnula: TLabel;
    lblActivo: TLabel;
    lblContab: TLabel;
    lblAcepta: TLabel;
    Label5: TLabel;
    lblEliminado: TLabel;
    bbtnRegresa: TBitBtn;
    bbtnCancela: TBitBtn;
    Z2bbtnGraba: TBitBtn;
    Z2bbtnAcepta: TBitBtn;
    Z2bbtnAnula: TBitBtn;
    Z2bbtnContab: TBitBtn;
    Z2bbtnNuevo: TBitBtn;
    pnlDetalle: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    dbgDocClie: TwwDBGrid;
    Panel3: TPanel;
    dbgDocCanjeProv: TwwDBGrid;
    Panel4: TPanel;
    dbgDocCanjeClie: TwwDBGrid;
    Label6: TLabel;
    edtClie: TEdit;
    lblClieRuc: TLabel;
    lblClie: TLabel;
    dbeNReg: TwwDBEdit;
    dbgDocProv: TwwDBGrid;
    Label1: TLabel;
    dblcClAux: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    dblcPrAux: TwwDBLookupCombo;
    Label10: TLabel;
    dblcdClie: TwwDBLookupComboDlg;
    dblcdClieRuc: TwwDBLookupComboDlg;
    Z2bbtnPreview: TBitBtn;
    lblNoReg: TLabel;
    meNoReg: TwwDBEdit;
    lblTDiario: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    ppdbpPreview: TppDBPipeline;
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
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcdProvExit(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgDocClieDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);

    procedure dblcdProvEnter(Sender: TObject);
    procedure dbgDocProvDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgDocCanjeProvDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgDocCanjeClieDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbeNRegExit(Sender: TObject);
    procedure dtpFEmisExit(Sender: TObject);
    procedure dbgDocProvEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDocProvMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgDocClieMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgDocClieEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDocCanjeProvMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgDocCanjeClieMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgDocCanjeProvEndDrag(Sender, Target: TObject; X,
      Y: Integer);
    procedure dbgDocCanjeClieEndDrag(Sender, Target: TObject; X,
      Y: Integer);
    procedure bbtnCalcClick(Sender: TObject);
    procedure Z2bbtnNuevoClick(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure dbgDocCanjeProvColExit(Sender: TObject);
    procedure dbgDocCanjeClieColExit(Sender: TObject);
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure Z2bbtnContabClick(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dblcClAuxExit(Sender: TObject);
    procedure dblcPrAuxExit(Sender: TObject);
    procedure dblcdClieExit(Sender: TObject);
    procedure dblcdClieEnter(Sender: TObject);
    procedure dblcdClieDropDown(Sender: TObject);
    procedure dblcdProvDropDown(Sender: TObject);
    procedure dbgDocCanjeClieFieldChanged(Sender: TObject; Field: TField);
    procedure dbgDocCanjeProvFieldChanged(Sender: TObject; Field: TField);
    procedure Z2bbtnPreviewClick(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure meNoRegExit(Sender: TObject);
    procedure bbtnRegresaClick(Sender: TObject);
    procedure pprPreviewPreviewFormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     wAno, wMes,wDia : word;
     xMes    : string;     
     Procedure GrabaDetCanje;
     function  ValidaCabecera: boolean;
     Function CanjesAceptados:Boolean;
     function VerificaCuadre:boolean;
     procedure Sumatotal;
     procedure Inicializafooter;
     procedure FiltraCanje;
     procedure EstadoDeForma(xxModo:Integer; xMovEstado,xMovLibera:String);
     procedure SumadbgProv;
     procedure SumadbgClie;
     procedure IniciaForma;
     Procedure GrabaRegCxP305;
     Procedure GrabaRegCxC305;
     function CuadraCanje: boolean;
     procedure ActualizaCabecera;
     Procedure ActualizaPago;//CXP,CXC
     Procedure ActualizaSaldoCxP(xxPeriodo,xxNReg : string;xxSaldoCxPO,xxSaldoCxPL,xxSaldoCxPE : double);
     Procedure ActualizaSaldoCxC(xxPeriodo,xxNReg : string;xxSaldoCxPO,xxSaldoCxPL,xxSaldoCxPE : double);
     Procedure ActualizaPagoCxP(xxPeriodo,xxNReg,xxEstado : string;xxPagoPO,xxPagoPL,xxPagoPE : double);
     Procedure ActualizaPagoCxC(xxPeriodo,xxNReg,xxEstado : string;xxPagoPO,xxPagoPL,xxPagoPE : double);
     function BuscaCxPReg( PCia,PNoReg:String):Boolean;
     procedure HallaMontosProv;
     procedure HallaMontosClie;
     procedure SeteaGrids;     
     procedure GeneraAsiento;
     procedure CargaDataSource;
  public
    { Public declarations }
  end;

  procedure OPCompensacion; stdcall;

exports
  OPCompensacion;

var
  xAnoMes : String;
  FCanjeCxC : TFCanjeCxC;
  xregresa  : boolean;
  xCrea     : boolean;
  xFlagGr   : boolean;
implementation

{$R *.DFM}

uses CxPDM, CXP001;

procedure OPCompensacion;
var
   xSQL : String;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if not FVariables.w_OP_Registro then
   begin
      xSQL:='Select * from CXP310 '
           +'Where CIAID=''ZZ'' AND CJCANJE=''ZZZZZ'' ';
      DMCXP.cdsCjeCxC.Close;
      DMCXP.cdsCjeCxC.DataRequest( xSQL );
      DMCXP.cdsCjeCxC.Open;
      DMCXP.wModo := 'A';
      FCanjeCxC := TFCanjeCxC.Create( Application );
      FCanjeCxC.ActiveMDIChild;
      FVariables.ConfiguraForma( Screen.ActiveForm );
   end
   else
   begin
      ShowMessage( 'Opcion en USO' );
   end
end;


procedure TFCanjeCxC.bbtnOKClick(Sender: TObject);
var
xFiltro : string;
begin
   ValidaCabecera;
   if xControlFec(dblcCia.Text, dtpFEmis.Date) = False then
   begin
    	Exit;
   end;

   //** 03/09/2001 - pjsv, se adjuntan algunos campos, para que no salgan todos
   dbgDocProv.Selected.clear;
//   dbgDocProv.Selected.Add('TDIARID'#9'2'#9'TD');
   dbgDocProv.Selected.Add('CPANOMES'#9'6'#9'Periodo');
   dbgDocProv.Selected.Add('TMONID'#9'3'#9'TM');
   dbgDocProv.Selected.Add('DOCID'#9'2'#9'TD');
   dbgDocProv.Selected.Add('CPSERIE'#9'4'#9'Serie');
   dbgDocProv.Selected.Add('CPNODOC'#9'5'#9'No.Doc');
   dbgDocProv.Selected.Add('CPSALLOC'#9'10'#9'Saldo MN');
   dbgDocProv.Selected.Add('CPSALEXT'#9'10'#9'Saldo ME');
//   dbgDocProv.Selected.Add('CPNOREG'#9'10'#9'Registro');

   dbgDocClie.Selected.clear;
//   dbgDocClie.Selected.Add('TDIARID'#9'3'#9'TD');
   dbgDocClie.Selected.Add('CCANOMES'#9'6'#9'Periodo');
   dbgDocClie.Selected.Add('TMONID'#9'3'#9'TM');
   dbgDocClie.Selected.Add('DOCID'#9'3'#9'TD');   
   dbgDocClie.Selected.Add('CCSERIE'#9'4'#9'Serie');
   dbgDocClie.Selected.Add('CCNODOC'#9'5'#9'No.Doc');
   dbgDocClie.Selected.Add('CCSALLOC'#9'10'#9'Saldo MN');
   dbgDocClie.Selected.Add('CCSALEXT'#9'10'#9'Saldo ME');
//   dbgDocClie.Selected.Add('CCNOREG'#9'10'#9'Registro');

   if not xRegresa then
   begin

      FiltraCanje;

      SeteaGrids;

      if DMCXP.cdsQry3.RecordCount = 0 then
      begin
         dblcdProv.text := '';
         raise Exception.Create('Error: Proveedor no tiene Documentos Pendientes');
      end;

      dbgDocProv.DataSource := DMCXP.dsQry3;
      dbgDocClie.DataSource := DMCXP.dsQry4;

      xFiltro := ' CIAID='   +''''+dblcCia.Text    +''''+' and '+
                 ' PROV='    +''''+dblcdProv.Text  +''''+' and '+
                 ' CJCANJE=' +''''+dbeNreg.Text    +'''';
      Filtracds( DMCXP.cdsDetCjeProv,  'Select * from CXP311 Where '+xFiltro );
      xFiltro := '';
      xFiltro := ' CIAID='   +''''+dblcCia.Text    +''''+' and '+
                 ' CLIEID=' +'''' +dblcdClie.Text  +''''+' and '+
                 ' CJCANJE='+'''' +dbeNreg.Text    +'''';
      Filtracds( DMCXP.cdsDetCjeClie,  'Select * from CXP312 Where '+xFiltro );

      if DMCXP.cdsDetCjeClie.RecordCount = 0 then begin
         if DMCXP.cdsQry4.RecordCount = 0 then begin
            dblcdClie.text := '';
            raise Exception.Create('Error: Cliente no tiene Documentos Pendientes');
         end;
      end;

   end;

   SumaTotal;

   DMCXP.cdsCjeCxC.Edit;
   DMCXP.cdsCjeCxC.fieldbyname('PROVDES').AsString   := edtProv.text;
   DMCXP.cdsCjeCxC.fieldbyname('CLIEDES').AsString   := edtClie.text;
   DMCXP.cdsCjeCxC.fieldbyname('TCANJEID').AsString  := 'CO';
   if DMCXP.BuscaFecha('TGE114','FECANO','FECHA',dtpFEmis.date ) then begin
      DMCXP.cdsCjeCxC.fieldbyname('CJAAAA').AsString  := DMCXP.cdsUltTGE.fieldbyname('FECANO'  ).Value;    // ano
      DMCXP.cdsCjeCxC.fieldbyname('CJMM').AsString    := DMCXP.cdsUltTGE.fieldbyname('FECMES'  ).Value;    // mes
      DMCXP.cdsCjeCxC.fieldbyname('CJDD').AsString    := DMCXP.cdsUltTGE.fieldbyname('FecDia'  ).Value;    // día
      DMCXP.cdsCjeCxC.fieldbyname('CjTRI').AsString   := DMCXP.cdsUltTGE.fieldbyname('FecTrim' ).Value;    // trimestre
      DMCXP.cdsCjeCxC.fieldbyname('CjSEM').AsString   := DMCXP.cdsUltTGE.fieldbyname('FecSem'  ).Value;    // semestre
      DMCXP.cdsCjeCxC.fieldbyname('CjSS').AsString    := DMCXP.cdsUltTGE.fieldbyname('FecSS'   ).Value;    // semana
      DMCXP.cdsCjeCxC.fieldbyname('CjAATRI').AsString := DMCXP.cdsUltTGE.fieldbyname('FecAATri').Value;    // año+trimestre
      DMCXP.cdsCjeCxC.fieldbyname('CjAASEM').AsString := DMCXP.cdsUltTGE.fieldbyname('FecAASem').Value;    // año+semestre
      DMCXP.cdsCjeCxC.fieldbyname('CjAASS').AsString  := DMCXP.cdsUltTGE.fieldbyname('FecAASS' ).Value;    // año+semana
   end;
   DMCXP.cdsCjeCxC.fieldbyname('CJUSER').AsString     := DMCXP.wUsuario; // usuario que registra
   DMCXP.cdsCjeCxC.fieldbyname('CJFREG').value        := Date;         // fecha que registra Usuario
   DMCXP.cdsCjeCxC.fieldbyname('CJHREG').value        := Time;         // Hora de Registro de Usuario


   EstadoDeForma(1,DMCXP.cdsCjeCxC.fieldbyname('CJESTADO').AsString,DMCXP.cdsCjeCxC.fieldbyname('CJ_CONTA').AsString );
   //** 03/09/2001 - pjsv, formatea los campos numericos
   //** para el GRID de Canje Prov
   TNumericField(DMCXP.cdsDetCjeProv.FieldByName('DCJSALLOC')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.cdsDetCjeProv.FieldByName('DCJSALEXT')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.cdsDetCjeProv.FieldByName('DCJMOLOC')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.cdsDetCjeProv.FieldByName('DCJMOEXT')).DisplayFormat := '###,###,##0.00';
   //** para el GRID de Canje Prov
   TNumericField(DMCXP.cdsDetCjeClie.FieldByName('DCJSALLOC')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.cdsDetCjeClie.FieldByName('DCJSALEXT')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.cdsDetCjeClie.FieldByName('DCJMOLOC')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.cdsDetCjeClie.FieldByName('DCJMOEXT')).DisplayFormat := '###,###,##0.00';
   //**
end;

function TFCanjeCxC.ValidaCabecera: boolean;
begin
  if length(dblcCia.Text)=0   then raise exception.Create('Falta Código de Compañía');
  if length(edtCia.Text)=0 then raise exception.Create('Código de Compañía Errado');

  if length(dblcdProv.text)= 0 then  raise Exception.Create('Falta Ingresar Cód. Proveedor');
  if length(edtProv.Text)=0 then raise exception.Create('Proveedor Errado');

  if dtpFEmis.Date=0 then raise exception.Create('Falta Fecha de Comprobante');

  if length(dblcdClie.text)= 0 then  raise Exception.Create('Falta Ingresar Cód. Cliente');
  If length(edtClie.Text)=0 then raise exception.Create('Cliente Errado');

  If length(dbeTCambio.Text)=0 then raise exception.Create('Tipo de Cambio no existe');

//  if dblcdProv.text <>dblcdClie.text then raise Exception.Create('Ingrese Códigos Válidos');

  result := true;
end;


procedure TFCanjeCxC.dblcCiaExit(Sender: TObject);
var
   xWhere : string;
   xCanje :string;
begin
   If xCrea then Exit;

   edtCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CIAID',dblcCia.Text);

   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Compañía no existe');
      dblcCia.Text:='';
      dblcCia.SetFocus;
   end;
   if length(edtCia.Text)>0 then begin
      //determina último número de registro incrementado en 1
      xWhere := 'CIAID='+''''+dblcCia.Text+'''';
      xCanje :=DMCXP.BuscaUltTGE('PrvUltCxP','CXP310','CJCANJE',xWhere);
      DMCXP.cdsCjeCxC.fieldbyname('CJCANJE').value:= StrZero(xCanje,6);
   end

end;

procedure TFCanjeCxC.dblcTMonExit(Sender: TObject);
var
   XWhere : string;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   
   xWhere := 'TMONID='+''''+dblcTMon.Text+''''
           + ' and (TMON_LOC='+''''+'L'+''''+' OR TMON_LOC='+''''+'E'+''''+')';

   edtTMon.Text:=BuscaQry('PrvTGE','TGE103','TMONDES,TMON_LOC',xWhere,'TMONDES');

   if length(edtTMon.Text)=0 then
   begin
      ShowMessage('Falta Tipo de Moneda');
      dblcTMon.SetFocus;
      exit;
   end;

end;

procedure TFCanjeCxC.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;

end;

function TFCanjeCxC.VerificaCuadre:boolean;
var
    xTotCxC,xTotCxP  : double;
begin
 result := false;
 xTotCxC := OperClientDataSet( DMCXP.cdsQry4 , 'SUM(CCMTOORI)', '');
 xTotCxP := OperClientDataSet( DMCXP.cdsQry3 , 'SUM(CPMTOORI)', '');
  if xTotCxC= xTotCxP then
     result := true;
end;

procedure TFCanjeCxC.dblcdProvExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if dblcClAux.Focused then Exit;

   if length(dblcdProv.Text)>0 then
   begin
       edtProv.Text:=DMCXP.DisplayDescrip('TGE201','PROVDES','PROV',dblcdProv.Text);
       if length(edtProv.Text)=0 then
       begin
          dblcdProv.Text:='';
          dblcdProvRuc.Text:='';
          dblcdProv.SetFocus;
          Raise Exception.Create('Proveedor no existe');
       end;
       DMCXP.cdsCjeCxC.fieldbyname('ProvRuc').AsString :=DMCXP.cdsULTTGE.FieldByName('ProvRuc').AsString;

   end
   else begin
            dblcdProvRuc.Text := '';
            edtClie.Text      := '';
            Showmessage('Código de Proveedor NO Registrado');
            dblcdProv.text := '';
            dblcdProv.Setfocus;
            exit;
   end;

end;

procedure TFCanjeCxC.dbeTCambioExit(Sender: TObject);
begin

  if xCrea then Exit;

end;

procedure TFCanjeCxC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //** 03/09/2001 - pjsv, para que no quede en memoria y salgan errores de que los campos
  //** no existen
  DMCXP.cdsQRY2.filter := '';
  DMCXP.cdsQRY2.Filtered := False;
  DMCXP.cdsQRY2.IndexFieldNames := '';
  DMCXP.cdsQRY2.close ;
  DMCXP.cdsQry3.close ;
  DMCXP.cdsQRY3.filter := '';
  DMCXP.cdsQRY3.Filtered := False;
  DMCXP.cdsQRY3.IndexFieldNames := '';
  DMCXP.cdsQry4.close ;
  DMCXP.cdsQRY4.filter := '';
  DMCXP.cdsQRY4.Filtered := False;
  DMCXP.cdsQRY4.IndexFieldNames := '';
  //**
  DMCXP.cdsCjeCxC.CancelUpdates;

//  FVariables.ActualizaFiltro( DMCXP.cdsCjeCxC, FPrincipal.Mantc, DMCXP.wModo );
   if not (FPrincipal.Mantc=nil) then
      FPrincipal.Mantc.RefreshFilter;

  Action:=caFree;
end;

procedure TFCanjeCxC.SumaTotal;
var
   xTotMto1,xTotMto2  : double;
begin
  xTotMto1 := OperClientDataSet( DMCXP.cdsQry4 , 'SUM(CCMTOORI)', '');
  xTotMto2 := OperClientDataSet( DMCXP.cdsQry3 , 'SUM(CPMTOORI)', '');
  dbgDocProv.ColumnByName('CPMTOORI').FooterValue :=floattostrf(xTotMto2, ffNumber, 10, 2);
  dbgDocClie.ColumnByName('CCMTOORI').FooterValue :=floattostrf(xTotMto1, ffNumber, 10, 2);

end;


procedure TFCanjeCxC.dbgDocClieDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFCanjeCxC.dblcdClieExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if dblcPrAux.Focused then Exit;

  if length(dblcdClie.Text)>0 then
  begin
  	edtClie.Text:=DMCXP.DisplayDescrip('TGE204','CLIEDES','CLIEID',dblcdClie.Text);
    if length(edtClie.Text)=0 then
    begin
    	dblcdClie.Text:='';
      dblcdClieRuc.Text:='';
      //dblcdClie.SetFocus;
      Raise Exception.Create('Cliente no existe');
    end;
    DMCXP.cdsCjeCxC.fieldbyname('ClieRuc').AsString :=DMCXP.cdsQRY2.FieldByName('clieRuc').AsString;
    bbtnOk.SetFocus;
  end
  else
  begin
  	edtClie.Text := '';
    Showmessage('Código de Cliente NO Registrado');
    dblcdClie.text := '';
    //dblcdClie.Setfocus;
    exit;
  end;
end;

procedure TFCanjeCxC.dblcdProvEnter(Sender: TObject);
begin
   if dblcClAux.Text='' then
      dblcClAux.SetFocus;

   if DMCXP.wVRN_ProvOrden<>'' then
      DMCXP.cdsProv.IndexFieldNames:=DMCXP.wVRN_ProvOrden
   else begin
      DMCXP.cdsProv.IndexFieldNames:='Prov';
   end;
end;

procedure TFCanjeCxC.dblcdClieEnter(Sender: TObject);
begin
   if dblcPrAux.Text='' then
      dblcPrAux.SetFocus;
   DMCXP.cdsQRY2.IndexFieldNames:='ClieDes';

end;

Procedure TFCanjeCxC.FiltraCanje;
var
   xFiltro : String;
begin
   DMCXP.cdsQry3.IndexFieldNames := '';
   DMCXP.cdsQry3.Filter   :='';
   DMCXP.cdsQry3.Filtered := False;
   DMCXP.cdsQry3.Close;


   DMCXP.cdsQry3.ProviderName := 'prvEjecuta'  ;
   xFiltro := 'CIAID='''+dblcCia.Text+''' AND PROV='''+dblcdProv.Text+'''';
   xFiltro := xFiltro + '  AND CPESTADO='+''''+'P'           +'''';
   Filtracds( DMCXP.cdsQry3,'Select * from CXP301 Where '+xFiltro );
   DMCXP.cdsQry3.Filtered := False;
   DMCXP.cdsQry3.Filter   :=   'CPSALLOC >0 and FLAGVAR<>'+''''+'XX'+'''';
   DMCXP.cdsQry3.Filtered := True;

   DMCXP.cdsQry4.IndexFieldNames := '';
   DMCXP.cdsQry4.Filter   :='';
   DMCXP.cdsQry4.Filtered := False;
   DMCXP.cdsQry4.Close;


   DMCXP.cdsQry4.ProviderName := 'prvEjecuta'   ;
   xFiltro := 'CIAID='''+dblcCia.Text+''' AND CLIEID='''+dblcdClie.Text+'''';
   xFiltro := xFiltro + ' AND CCESTADO='+''''+'P'           +'''';
   Filtracds( DMCXP.cdsQry4,'Select * from CXC301 Where '+xFiltro );

   DMCXP.cdsQry4.Filtered := False;
   DMCXP.cdsQry4.Filter   :=   'CCSALLOC>0 and '+
                             'FLAGVAR<>'+''''+'XX'+'''';
   DMCXP.cdsQry4.Filtered := True;

   if DMCXP.wModo <> 'A' then
    begin
      xFiltro := '';
      xFiltro := 'CIAID='''+dblcCia.Text+''' AND CJCANJE ='''+dbeNReg.text +'''';
      Filtracds( DMCXP.cdsDetCjeProv,'Select * from CXP311 Where '+xFiltro );
      Filtracds( DMCXP.cdsDetCjeClie,'Select * from CXP312 Where '+xFiltro );
    end;
  //** 09/08/2001 - pjsv
   DMCXP.cdsQry3.IndexFieldNames       := 'CIAID;PROV;CPNOREG';
   DMCXP.cdsQry4.indexfieldnames       := 'CIAID;CLIEID;CCNOREG';
   DMCXP.cdsDetCjeProv.indexfieldnames := 'CIAID;PROV;DCJNOREG';
   DMCXP.cdsDetCjeClie.indexfieldnames := 'CIAID;CLIEID;CJCANJE';
  //**
end;


procedure TFCanjeCxC.dbgDocProvDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFCanjeCxC.dbgDocCanjeProvDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;

end;

procedure TFCanjeCxC.dbgDocCanjeClieDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFCanjeCxC.EstadoDeForma(xxModo:Integer; xMovEstado,xMovLibera:String);
begin
   pnlCab1.Enabled      := False;
   pnlCab2.Enabled      := False;
   bbtnOK.Enabled       := False;
   bbtnBorra.Enabled    := False;
   dblcCia.Enabled      := True;

   pnlDetalle.Enabled   := False;
   dbgDocProv.enabled := false;
   dbgDocProv.ReadOnly   := True;
   dbgDocClie.enabled := false;
   dbgDocClie.ReadOnly   := True;
   dbgDocCanjeProv.enabled := false;
   dbgDocCanjeProv.ReadOnly   := True;
   dbgDocCanjeClie.enabled := false;
   dbgDocCanjeClie.ReadOnly   := True;

   pnlPie.Refresh;
   pnlPie.Enabled       := False;
   bbtnRegresa.Enabled  := False;
   bbtnCancela.Enabled  := False;
   Z2bbtnGraba.Enabled  := False;
   Z2bbtnContab.Enabled := False;
   Z2bbtnAcepta.Enabled := False;
   Z2bbtnAnula.Enabled  := False;
   Z2bbtnNuevo.Enabled  := False;
   Z2bbtnPreview.Enabled:= False;

   lblActivo.Visible    := False;

   lblAcepta.Visible    := False;
   lblAnula.Visible     := False;
   lblContab.Visible    := False;
   if xxModo=0 then // cuando va hacia la cabecera
      begin
         If (xMovEstado=' ') then
            begin
               pnlCab1.Enabled    := True;
               pnlCab2.Enabled    := True;
               bbtnOK.Enabled     := True;
               bbtnBorra.Enabled  := True;
               lblActivo.Visible  := False;
               dblcCia.SetFocus;
            end
         else begin
            If (xMovEstado='I') or (xMovEstado='T') then begin
               pnlCab2.Enabled    := True;
               bbtnOK.Enabled     := True;
               bbtnBorra.Enabled  := True;
               lblActivo.Visible  := True;
            end
         end
      end
   else begin // cuando el foco esta en el Detalle

      If xMovLibera='S' then  //Cuando esta Impreso
         begin
            pnlDetalle.Enabled   := True;
            lblContab.Visible    := True;
            pnlPie.Enabled       := True;
            Z2bbtnPreview.Enabled:= True;
         end
      else begin
         If xMovEstado='T' then // temporal grabado desde cabecera
         begin
            pnlDetalle.Enabled   := True;
            dbgDocProv.ReadOnly   := False;
            dbgDocProv.enabled    := true;
            dbgDocClie.ReadOnly   := False;
            dbgDocClie.enabled    := true;
            dbgDocCanjeProv.ReadOnly   := False;
            dbgDocCanjeProv.enabled    := true;
            dbgDocCanjeClie.ReadOnly   := False;
            dbgDocCanjeClie.enabled    := true;

            pnlPie.Enabled       := True;
            bbtnRegresa.Enabled  := True;
            bbtnCancela.Enabled  := True;
            Z2bbtnGraba.Enabled  := True;
            lblActivo.Visible    := True;
         end;
         If xMovEstado='I' then // si ya esta grabado
         begin
            pnlDetalle.Enabled   := True;
            dbgDocProv.Enabled    := True;
            dbgDocProv.ReadOnly   := False;
            dbgDocClie.Enabled    := True;
            dbgDocClie.ReadOnly   := False;
            dbgDocCanjeProv.Enabled    := True;
            dbgDocCanjeProv.ReadOnly   := False;
            dbgDocCanjeClie.Enabled    := True;
            dbgDocCanjeClie.ReadOnly   := False;

            pnlPie.Enabled       := True;
            bbtnRegresa.Enabled  := True;
            bbtnCancela.Enabled  := True;
            Z2bbtnGraba.Enabled  := True;
            Z2bbtnAcepta.Enabled := True;
            Z2bbtnAnula.Enabled  := True;
            lblActivo.Visible    := True;
            Z2bbtnPreview.Enabled:= True;
         end;
         If (xMovEstado='P') or (xMovEstado='C') then
         begin
            pnlDetalle.Enabled   := True;
            pnlPie.Enabled       := True;
            lblAcepta.Visible    := True;
            Z2bbtnContab.Enabled:=True;
            Z2bbtnPreview.Enabled:= True;
         end;
         if xMovEstado='A' then // anulado
         begin
            pnlDetalle.Enabled   := True;
            pnlPie.Enabled       := True;
            lblAnula.Visible     := True;

         end;
      end;

      if (DMCXP.wModo='A') and ((xMovEstado='I') or (xMovEstado='P')or (xMovLibera='S')) then begin
         Z2bbtnNuevo.Enabled  := True;
      end;

   end;

   if DMCXP.wModo='C' then begin // Si Entra Solo Para Consulta
      pnlCab1.Enabled      := False;
      pnlCab2.Enabled      := False;
      bbtnOK.Enabled       := False;
      bbtnBorra.Enabled    := False;

      pnlDetalle.Enabled   := False;
      dbgDocProv.ReadOnly   := True;
      dbgDocClie.ReadOnly   := True;
      dbgDocCanjeProv.ReadOnly   := True;
      dbgDocCanjeClie.ReadOnly   := True;

      pnlPie.Refresh;
      pnlPie.Enabled       := False;
      If DMCXP.wAdmin='G' then begin
         pnlPie.Enabled       := True;
         Z2bbtnGraba.Enabled  := True;
         Z2bbtnAcepta.Enabled := True;
         Z2bbtnAnula.Enabled  := True;
         Z2bbtnNuevo.Enabled  := True;
      end
      else begin
           bbtnRegresa.Enabled  := False;
           bbtnCancela.Enabled  := False;
           Z2bbtnGraba.Enabled  := False;
           Z2bbtnAcepta.Enabled := False;
           Z2bbtnAnula.Enabled  := False;
           Z2bbtnNuevo.Enabled  := False;
           end;
      pnlPie.Refresh;
   end;
end;



procedure TFCanjeCxC.dbeNRegExit(Sender: TObject);
var
   xNReg  : string;
begin
  if xCrea then Exit;
  DMCXP.cdsCjeCxC.fieldbyname('CjEstado').AsString  := 'T';
  dbeNReg.text:= StrZero(dbeNReg.text,6);
  xNReg :=    dbeNReg.text;
  DMCXP.cdsCjeCxC.fieldbyname('CjCanje').AsString  := xNReg;
  If dbeNReg.text='000000' then begin
     dbeNReg.SetFocus;
     raise exception.Create('Error :  Falta Registrar Número de Canje');
  end;
  if BuscaCxPReg(dblcCia.text,dbeNReg.text) then
     raise exception.create('Error: Registro Duplicado');
  xFlagGr := true;

end;

procedure TFCanjeCxC.dtpFEmisExit(Sender: TObject);
var
   xTCambio        : double;
   xWhere, xNoreg    : string;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

   if xControlFec(dblcCia.Text, dtpFEmis.Date) = False then
   begin
    	Exit;
   end;

   DecodeDate(dtpFEmis.Date, wAno, wMes, wDia);
   xAnomes := FLoatToStr(wAno) + Strzero(FloatToStr(wMes),2);
   if wMes<10 then xMes:='0'+inttostr(wMes) else xMes:=inttostr(wMes);

   xWhere:='TMONID='+''''+DMCXP.wTMonExt            +''''+' and '
          +'FECHA='''+ FORMATDATETIME(DMCXP.wFormatFecha,dtpFEMis.Date)+''' ';
   if length(BuscaQry('PrvTGE','TGE107','*',xWhere,'TMONID'))>0 then
      xTCambio:=DMCXP.cdsQry.fieldbyname('TCAM'+DMCXP.wVRN_TipoCambio).Value
   else begin
      dtpFEMis.SetFocus;
      Raise Exception.Create( ' Error :  Fecha No tiene Tipo de Cambio ' );
   end;

   dbeTCambio.Text := floattostr(FRound(xTCambio,7,3));
   DMCXP.cdsCjeCxC.fieldbyname('CJANOMES').value:= IntToStr(wAno)+xMes;
   DMCXP.cdsCjeCxC.fieldbyname('CJTCAM').Value  := FRound(xTCambio,7,3);

   xAnomes := DMCXP.cdsCjeCxC.fieldbyname('CJANOMES').value;
   xNoreg   := DMCXP.UltimoRegistroCXP310( dblcCia.Text, dblcTDiario.Text, xAnoMes );
   DMCXP.cdsCjeCxC.fieldbyname('CPNOREG').Value:= Strzero( xNoreg, DMCXP.cdsCjeCxC.fieldbyname('CPNOREG').Size );
end;

procedure TFCanjeCxC.dbgDocProvEndDrag(Sender, Target: TObject; X,
  Y: Integer);
var
   i : integer;
   xTempLoc, xTempExt : double;
begin
// inicia arrastre - Grids de CxP
   xFlagCalP := true;
   If Target=dbgDocCanjeProv then
    begin
     DMCXP.cdsDetCjeProv.DisableControls;
     for i:= 0 to dbgDocProv.SelectedList.Count-1 do
      begin
       dbgDocProv.datasource.dataset.GotoBookmark(dbgDocProv.SelectedList.items[i]);
       DMCXP.cdsDetCjeProv.SetKey;
       DMCXP.cdsDetCjeProv.fieldbyname('CiaID').AsString   := DMCXP.cdsQry3.fieldbyname('CiaID').AsString;
       DMCXP.cdsDetCjeProv.fieldbyname('Prov').AsString    := DMCXP.cdsQry3.fieldbyname('Prov').AsString;
       DMCXP.cdsDetCjeProv.fieldbyname('DCJNOREG').AsString := DMCXP.cdsQry3.fieldbyname('CPNOREG').AsString;
       if not DMCXP.cdsDetCjeProv.GotoKey then
        begin
         If FRound(DMCXP.cdsQry3.fieldbyname('CPMtoLoc').AsFloat-DMCXP.cdsQry3.fieldbyname('CPPagLoc').AsFloat,15,2)<>
            FRound(DMCXP.cdsQry3.fieldbyname('CPSalLoc').AsFloat,15,2) then
          begin
           ShowMessage('Error : Documento esta en Proceso de cancelación');
           DMCXP.cdsQry3.First;
           DMCXP.cdsQry3.EnableControls;
           Exit;
          end
         else
          begin
           //** 03/09/2001 - pjsv, se pasa a False para poder asignarles datos
           DMCXP.cdsDetCjeProv.fieldbyname('DOCID').ReadOnly := False;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJSALLOC').ReadOnly := False;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJSALEXT').ReadOnly := False;
           //**
           DMCXP.cdsDetCjeProv.EnableControls;
           //DMCXP.cdsDetCjeProv.CancelUpdates;
           if DMCXP.cdsDetCjeProv.State in [dsInsert, dsEdit] then
              cdsPost( DMCXP.cdsDetCjeProv );
           DMCXP.cdsDetCjeProv.Insert;
           DMCXP.cdsDetCjeProv.fieldbyname('CIAID').AsString     := DMCXP.cdsQry3.fieldbyname('CIAID').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('CLAUXID').AsString   := DMCXP.cdsQry3.fieldbyname('CLAUXID').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('PROV').AsString      := DMCXP.cdsQry3.fieldbyname('PROV').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('PROVRUC').AsString   := DMCXP.cdsQry3.fieldbyname('PROVRUC').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('TDIARID').AsString   := DMCXP.cdsQry3.fieldbyname('TDIARID').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('DCPANOMM').AsString  := DMCXP.cdsQry3.fieldbyname('CPANOMES').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('TCANJEID').AsString  := 'CO';
           DMCXP.cdsDetCjeProv.fieldbyname('CJCANJE').AsString   := dbeNReg.text;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJTCAM').Asfloat    := strtofloat(dbeTCambio.text);
           DMCXP.cdsDetCjeProv.fieldbyname('DCJSERIE').AsString  := DMCXP.cdsQry3.fieldbyname('CPSERIE').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('DOCID').AsString     := DMCXP.cdsQry3.fieldbyname('DOCID').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJNODOC').Asstring  := DMCXP.cdsQry3.fieldbyname('CPNODOC').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJNOREG').AsString  := DMCXP.cdsQry3.fieldbyname('CPNOREG').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('CUENTAID').AsString  := DMCXP.cdsQry3.fieldbyname('CTATOTAL').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJSALLOC').AsFloat  := DMCXP.cdsQry3.fieldbyname('CPSALLOC').AsFloat;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJSALEXT').AsFloat  := DMCXP.cdsQry3.fieldbyname('CPSALEXT').AsFloat;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJMOLOC').AsFloat   := DMCXP.cdsQry3.fieldbyname('CPSALLOC').AsFloat;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJMOEXT').AsFloat   := DMCXP.cdsQry3.fieldbyname('CPSALEXT').AsFloat;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJESTADO').AsString := 'I';
           DMCXP.cdsDetCjeProv.fieldbyname('DCJUser').AsString   := DMCXP.wUsuario;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJFReg').Value      := date;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJHReg').Value      := time;
           DMCXP.cdsDetCjeProv.fieldbyname('TMONID').AsString    := DMCXP.cdsCjeCxC.fieldbyname('TMONID').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJDD').AsString     := DMCXP.cdsCjeCxC.fieldbyname('CJDD').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJMM').AsString     := DMCXP.cdsCjeCxC.fieldbyname('CJMM').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJTri').AsString    := DMCXP.cdsCjeCxC.fieldbyname('CJTRI').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJSem').AsString    := DMCXP.cdsCjeCxC.fieldbyname('CJSEM').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJSS').AsString     := DMCXP.cdsCjeCxC.fieldbyname('CJSS').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJAATri').AsString  := DMCXP.cdsCjeCxC.fieldbyname('CJAATRI').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJAASem').AsString  := DMCXP.cdsCjeCxC.fieldbyname('CJAASem').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJAASS').AsString   := DMCXP.cdsCjeCxC.fieldbyname('CJAASS').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJANOMM').AsString  := DMCXP.cdsCjeCxC.fieldbyname('CJANOMES').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('TDIARID2').AsString  := DMCXP.cdsCjeCxC.fieldbyname('TDIARID').AsString;
           DMCXP.cdsDetCjeProv.fieldbyname('DCJFCJE').Value      := dtpFEmis.date;
           cdsPost( DMCXP.cdsDetCjeProv );

           DMCXP.cdsQry3.Edit;
           DMCXP.cdsQry3.fieldbyname('FlagVar').AsString  := 'XX';
           DMCXP.cdsQry3.Post;
          end;
        end;
        dbgDocProv.datasource.dataset.Freebookmark(dbgDocProv.SelectedList.items[i]);
      end;
      dbgDocProv.SelectedList.clear;  { Clear selected record list since they are all deleted}
      DMCXP.cdsQry3.EnableControls;
      DMCXP.cdsDetCjeProv.EnableControls;
      dbgDocCanjeProv.RefreshDisplay;
   end;
 SumadbgProv;
end;

procedure TFCanjeCxC.dbgDocProvMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocProv.BeginDrag(False);
end;

procedure TFCanjeCxC.dbgDocClieMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocClie.BeginDrag(False);
end;

procedure TFCanjeCxC.dbgDocClieEndDrag(Sender, Target: TObject; X, Y: Integer);
var
   i : integer;
begin
   xFlagCalC := true;
   If Target=dbgDocCanjeClie then
    begin
      DMCXP.cdsDetCjeclie.DisableControls;
      for i:= 0 to dbgDocClie.SelectedList.Count-1 do
       begin
          dbgDocClie.datasource.dataset.GotoBookmark(dbgDocClie.SelectedList.items[i]);
          DMCXP.cdsDetCjeClie.SetKey;
          DMCXP.cdsDetCjeClie.fieldbyname('CiaID').AsString   := DMCXP.cdsQry4.fieldbyname('CiaID').AsString;
          DMCXP.cdsDetCjeClie.fieldbyname('ClieId').AsString  := DMCXP.cdsQry4.fieldbyname('ClieId').AsString;
          DMCXP.cdsDetCjeClie.fieldbyname('CJCANJE').AsString := DMCXP.cdsQry4.fieldbyname('CCCANJE').AsString;
          if not DMCXP.cdsDetCjeClie.GotoKey then
            begin
                 If FRound(DMCXP.cdsQry4.fieldbyname('CCMtoLoc').AsFloat-DMCXP.cdsQry4.fieldbyname('CCPagLoc').AsFloat,15,2)<>
                    FRound(DMCXP.cdsQry4.fieldbyname('CCSalLoc').AsFloat,15,2) then
                  begin
                    ShowMessage('Error : Documento esta en Proceso de cancelación');
//                    dbgPendientes.SelectedList.clear;
                    DMCXP.cdsQry4.First;
                    DMCXP.cdsQry4.EnableControls;
                    Exit;
                  end
                 else
                  begin
                      //** 03/09/2001 - pjsv, se pasa a False para poder asignarles datos
                      DMCXP.cdsDetCjeClie.fieldbyname('DOCID').ReadOnly := False;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJSALLOC').ReadOnly := False;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJSALEXT').ReadOnly := False;
                      //**
                      DMCXP.cdsDetCjeClie.EnableControls;
                      DMCXP.cdsDetCjeClie.Insert;
                      DMCXP.cdsDetCjeClie.fieldbyname('CIAID').AsString    := DMCXP.cdsQry4.fieldbyname('CIAID').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('CLIEID').AsString   := DMCXP.cdsQry4.fieldbyname('CLIEID').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('CLIERUC').AsString  := DMCXP.cdsQry4.fieldbyname('CLIERUC').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('CLAUXCLIE').AsString:= DMCXP.cdsQry4.fieldbyname('CLAUXID').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('TDIARID').AsString  := DMCXP.cdsQry4.fieldbyname('TDIARID').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCPANOMM').AsString := DMCXP.cdsQry4.fieldbyname('CCANOMES').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJSERIE').AsString := DMCXP.cdsQry4.fieldbyname('CCSERIE').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('DOCID').AsString    := DMCXP.cdsQry4.fieldbyname('DOCID').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJTCAM').AsFloat   := strtofloat(dbeTCambio.text);
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJNODOC').Asstring := DMCXP.cdsQry4.fieldbyname('CCNODOC').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJNOREG').AsString := DMCXP.cdsQry4.fieldbyname('CCNOREG').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('CUENTAID').AsString := DMCXP.cdsQry4.fieldbyname('CTATOTAL').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJSALLOC').AsFloat := DMCXP.cdsQry4.fieldbyname('CCSALLOC').AsFloat;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJSALEXT').AsFloat := DMCXP.cdsQry4.fieldbyname('CCSALEXT').AsFloat;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJMOLOC').AsFloat  := DMCXP.cdsQry4.fieldbyname('CCSALLOC').AsFloat;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJMOEXT').AsFloat  := DMCXP.cdsQry4.fieldbyname('CCSALEXT').AsFloat;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJUser').Value     := DMCXP.wUsuario;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJFReg').Value     := date;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJHReg').Value     := time;
                      DMCXP.cdsDetCjeClie.fieldbyname('CJCANJE').AsString  := dbeNReg.text;
                      DMCXP.cdsDetCjeClie.fieldbyname('TCANJEID').AsString := 'CO';
                      DMCXP.cdsDetCjeClie.fieldbyname('TMONID').AsString   := DMCXP.cdsCjeCxC.fieldbyname('TMONID').AsString;

                      DMCXP.cdsDetCjeClie.fieldbyname('DCJDD').AsString    := DMCXP.cdsCjeCxC.fieldbyname('CJDD').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJMM').AsString    := DMCXP.cdsCjeCxC.fieldbyname('CJMM').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJTri').AsString   := DMCXP.cdsCjeCxC.fieldbyname('CJTRI').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJSem').AsString   := DMCXP.cdsCjeCxC.fieldbyname('CJSEM').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJSS').AsString    := DMCXP.cdsCjeCxC.fieldbyname('CJSS').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJAATri').AsString := DMCXP.cdsCjeCxC.fieldbyname('CJAATRI').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJAASem').AsString := DMCXP.cdsCjeCxC.fieldbyname('CJAASem').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJAASS').AsString  := DMCXP.cdsCjeCxC.fieldbyname('CJAASS').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJANOMM').AsString := DMCXP.cdsCjeCxC.fieldbyname('CJANOMES').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('TDIARID2').AsString  := DMCXP.cdsCjeCxC.fieldbyname('TDIARID').AsString;
                      DMCXP.cdsDetCjeClie.fieldbyname('DCJFCJE').Value     := dtpFEmis.date;
                      cdsPost( DMCXP.cdsDetCjeClie );
                      DMCXP.cdsQry4.Edit;
                      DMCXP.cdsQry4.fieldbyname('FlagVar').AsString  := 'XX';
                      DMCXP.cdsQry4.Post;
                  end;
            end;
          dbgDocClie.datasource.dataset.Freebookmark(dbgDocClie.SelectedList.items[i]);
       end;
      dbgDocClie.SelectedList.clear;  { Clear selected record list since they are all deleted}
      DMCXP.cdsQry4.EnableControls;
      DMCXP.cdsDetCjeClie.EnableControls;
      dbgDocCanjeClie.RefreshDisplay;

    end;
 SumadbgClie;
 xFlagCalC := True;

end;

procedure TFCanjeCxC.dbgDocCanjeProvMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 dbgDocCanjeProv.BeginDrag(False);
 //** 03/09/2001 - pjsv, para que se editen
 DMCXP.cdsDetCjeProv.fieldbyname('DOCID').ReadOnly := True;
 DMCXP.cdsDetCjeProv.fieldbyname('DCJSALLOC').ReadOnly := True;
 DMCXP.cdsDetCjeProv.fieldbyname('DCJSALEXT').ReadOnly := True;
 //**
end;

procedure TFCanjeCxC.dbgDocCanjeClieMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocCanjeClie.BeginDrag(False);
   //** 03/09/2001 - pjsv, para que se editen
   DMCXP.cdsDetCjeClie.fieldbyname('DOCID').ReadOnly := True;
   DMCXP.cdsDetCjeClie.fieldbyname('DCJSALLOC').ReadOnly := True;
   DMCXP.cdsDetCjeClie.fieldbyname('DCJSALEXT').ReadOnly := True;
   //**
end;

procedure TFCanjeCxC.dbgDocCanjeProvEndDrag(Sender, Target: TObject; X,
  Y: Integer);
  var
     i : integer;
begin
// regreso de arrastre - Grids de CxP
   If Target=dbgDocProv then
    begin
     try
      DMCXP.cdsQry3.DisableControls;
      DMCXP.cdsQry3.Filtered := False;
      DMCXP.cdsQry3.Filter   :=   'CPSALLOC >0 and '+
                                'FLAGVAR='+''''+'XX'+'''';
      DMCXP.cdsQry3.Filtered := True;
      for i:= 0 to dbgDocCanjeProv.SelectedList.Count-1 do
       begin
          dbgDocCanjeProv.datasource.dataset.GotoBookmark(dbgDocCanjeProv.SelectedList.items[i]);
          DMCXP.cdsQry3.SetKey;
          DMCXP.cdsQry3.fieldbyname('CiaID').AsString   := DMCXP.cdsDetCjeProv.fieldbyname('CiaID').AsString;
          DMCXP.cdsQry3.fieldbyname('Prov').AsString    := DMCXP.cdsDetCjeProv.fieldbyname('Prov').AsString;
          DMCXP.cdsQry3.fieldbyname('CPNOREG').AsString := DMCXP.cdsDetCjeProv.fieldbyname('DCJNOREG').AsString;
          if DMCXP.cdsQry3.GotoKey then
            begin
             DMCXP.cdsQry3.Edit;
             DMCXP.cdsQry3.fieldbyname('FlagVar').AsString  := '';
             DMCXP.cdsQry3.Post;
             DMCXP.cdsDetCjeProv.Delete;
           end;
          dbgDocCanjeProv.datasource.dataset.Freebookmark(dbgDocCanjeProv.SelectedList.items[i]);
       end;
      dbgDocCanjeProv.SelectedList.clear;  { Clear selected record list since they are all deleted}
      DMCXP.cdsDetCjeProv.EnableControls;
      DMCXP.cdsQry3.EnableControls;
      dbgDocProv.RefreshDisplay;
     Finally
      DMCXP.cdsQry3.Filtered := False;
      DMCXP.cdsQry3.Filter   :=   'CPSALLOC >0 and '+
                             'FLAGVAR<>'+''''+'XX'+'''';
      DMCXP.cdsQry3.Filtered := True;
      DMCXP.cdsQry3.EnableControls;
     end;
    end;
   SumadbgProv;
end;

procedure TFCanjeCxC.dbgDocCanjeClieEndDrag(Sender, Target: TObject; X,
  Y: Integer);
  var
      i : integer;
begin
   If Target=dbgDocClie then
    begin
     try
      DMCXP.cdsQry4.DisableControls;
      DMCXP.cdsQry4.Filtered := False;
      DMCXP.cdsQry4.Filter   :=   'CCSALLOC>0 and '+
                                'FLAGVAR='+''''+'XX'+'''';
//      DMCXP.cdsQry4.Filtered := True;
//      DMCXP.cdsQry4.First;
      for i:= 0 to dbgDocCanjeClie.SelectedList.Count-1 do
       begin
          dbgDocCanjeClie.datasource.dataset.GotoBookmark(dbgDocCanjeClie.SelectedList.items[i]);
          DMCXP.cdsQry4.SetKey;
          DMCXP.cdsQry4.fieldbyname('CiaID').AsString   := DMCXP.cdsDetCjeClie.fieldbyname('CiaID').AsString;
          DMCXP.cdsQry4.fieldbyname('ClieId').AsString  := DMCXP.cdsDetCjeClie.fieldbyname('ClieId').AsString;
          DMCXP.cdsQry4.fieldbyname('CCNOREG').AsString := DMCXP.cdsDetCjeClie.fieldbyname('DCJNOREG').AsString;
          if DMCXP.cdsQry4.GotoKey then
           begin
             DMCXP.cdsQry4.Edit;
             DMCXP.cdsQry4.fieldbyname('FlagVar').AsString  := '';
             DMCXP.cdsQry4.fieldbyname('CCSALLOC').AsFloat  := DMCXP.cdsQry4.fieldbyname('CCMTOLOC').AsFloat-DMCXP.cdsQry4.fieldbyname('CCPAGLOC').AsFloat;
             DMCXP.cdsQry4.fieldbyname('CCSALEXT').AsFloat  := DMCXP.cdsQry4.fieldbyname('CCMTOEXT').AsFloat-DMCXP.cdsQry4.fieldbyname('CCPAGEXT').AsFloat;
             DMCXP.cdsQry4.fieldbyname('CCSALORI').AsFloat  := DMCXP.cdsQry4.fieldbyname('CCMTOORI').AsFloat-DMCXP.cdsQry4.fieldbyname('CCPAGORI').AsFloat;
             DMCXP.cdsQry4.Post;
             DMCXP.cdsDetCjeClie.Delete;
           end;
          dbgDocCanjeClie.datasource.dataset.Freebookmark(dbgDocCanjeClie.SelectedList.items[i]);
       end;
      dbgDocCanjeClie.SelectedList.clear;  { Clear selected record list since they are all deleted}
      DMCXP.cdsDetCjeClie.EnableControls;
      DMCXP.cdsQry4.EnableControls;
      dbgDocClie.RefreshDisplay;
     finally
      DMCXP.cdsQry4.Filtered := False;
      DMCXP.cdsQry4.Filter   :=   'CCSALLOC>0 and '+
                                'FLAGVAR<>'+''''+'XX'+'''';
      DMCXP.cdsQry4.Filtered := True;
      DMCXP.cdsQry4.EnableControls;
     end;
    end;
  SumadbgClie;
end;

procedure TFCanjeCxC.bbtnCalcClick(Sender: TObject);
begin
  WinExec('C:\windows\calc.exe',1 );  // Executa Aplicación
end;

procedure TFCanjeCxC.Inicializafooter;
begin
   dbgDocCanjeClie.ColumnByName('DCJMOLOC').FooterValue  :='';
   dbgDocCanjeClie.ColumnByName('DCJMOEXT').FooterValue  :='';
   dbgDocCanjeClie.ColumnByName('DCJSALLOC').FooterValue :='';
   dbgDocCanjeClie.ColumnByName('DCJSALEXT').FooterValue :='';
   dbgDocCanjeProv.ColumnByName('DCJMOLOC').FooterValue  :='';
   dbgDocCanjeProv.ColumnByName('DCJMOEXT').FooterValue  :='';
   dbgDocCanjeProv.ColumnByName('DCJSALLOC').FooterValue :='';
   dbgDocCanjeProv.ColumnByName('DCJSALEXT').FooterValue :='';
end;

procedure TFCanjeCxC.SumadbgClie;
var
  xMtoLoc,xMtoExt,
  xPgoLoc,xPgoExt  : double;
  xRegAct          : tbookmark;
begin
   DMCXP.cdsDetCjeClie.DisableControls;
   xRegAct := DMCXP.cdsDetCjeClie.GetBookmark;
   xMtoLoc:= 0; xMtoExt:= 0; xPgoLoc:=0; xPgoExt:= 0;
   DMCXP.cdsDetCjeClie.First ;
   While not DMCXP.cdsDetCjeClie.Eof do Begin
      xMtoLoc := xMtoLoc + DMCXP.cdsDetCjeClie.fieldbyname('DCJMOLOC').AsFloat;
      xMtoExt := xMtoExt + DMCXP.cdsDetCjeClie.fieldbyname('DCJMOEXT').AsFloat;
      xPgoLoc := xPgoLoc + DMCXP.cdsDetCjeClie.fieldbyname('DCJSALLOC').AsFloat;
      xPgoExt := xPgoExt + DMCXP.cdsDetCjeClie.fieldbyname('DCJSALEXT').AsFloat;

      DMCXP.cdsDetCjeClie.Next;
   end;
   dbgDocCanjeClie.ColumnByName('DCJMOLOC').FooterValue  :=floattostrf(xMtoLoc, ffNumber, 10, 2);
   dbgDocCanjeClie.ColumnByName('DCJMOEXT').FooterValue  :=floattostrf(xMtoExt, ffNumber, 10, 2);
   dbgDocCanjeClie.ColumnByName('DCJSALLOC').FooterValue :=floattostrf(xPgoLoc, ffNumber, 10, 2);
   dbgDocCanjeClie.ColumnByName('DCJSALEXT').FooterValue :=floattostrf(xPgoExt, ffNumber, 10, 2);

   DMCXP.cdsDetCjeClie.GotoBookmark(xRegAct);
   DMCXP.cdsDetCjeClie.FreeBookmark(xRegAct);
   DMCXP.cdsDetCjeClie.EnableControls;
end;

procedure TFCanjeCxC.SumadbgProv;
var
 xMtoLoc,xMtoExt,
  xPgoLoc,xPgoExt  : double;
  xRegAct          : tbookmark;
begin
   DMCXP.cdsDetCjeProv.DisableControls;
   xRegAct := DMCXP.cdsDetCjeProv.GetBookmark;
   xMtoLoc:= 0; xMtoExt:= 0; xPgoLoc:=0; xPgoExt:= 0;
   DMCXP.cdsDetCjeProv.First ;
   While not DMCXP.cdsDetCjeProv.Eof do Begin
      xMtoLoc := xMtoLoc + DMCXP.cdsDetCjeProv.fieldbyname('DCJMOLOC').AsFloat;
      xMtoExt := xMtoExt + DMCXP.cdsDetCjeProv.fieldbyname('DCJMOEXT').AsFloat;
      xPgoLoc := xPgoLoc + DMCXP.cdsDetCjeProv.fieldbyname('DCJSALLOC').AsFloat;
      xPgoExt := xPgoExt + DMCXP.cdsDetCjeProv.fieldbyname('DCJSALEXT').AsFloat;

      DMCXP.cdsDetCjeProv.Next;
   end;
   dbgDocCanjeProv.ColumnByName('DCJMOLOC').FooterValue  :=floattostrf(xMtoLoc, ffNumber, 10, 2);
   dbgDocCanjeProv.ColumnByName('DCJMOEXT').FooterValue  :=floattostrf(xMtoExt, ffNumber, 10, 2);
   dbgDocCanjeProv.ColumnByName('DCJSALLOC').FooterValue :=floattostrf(xPgoLoc, ffNumber, 10, 2);
   dbgDocCanjeProv.ColumnByName('DCJSALEXT').FooterValue :=floattostrf(xPgoExt, ffNumber, 10, 2);

   DMCXP.cdsDetCjeProv.GotoBookmark(xRegAct);
   DMCXP.cdsDetCjeProv.FreeBookmark(xRegAct);
   DMCXP.cdsDetCjeProv.EnableControls;
end;


procedure TFCanjeCxC.IniciaForma;
begin
   Filtracds( DMCXP.cdsDetCjeProv,  'Select * from CXP311 Where CiaId = ''''' );
   Filtracds( DMCXP.cdsDetCjeClie,  'Select * from CXP312 Where CiaID = ''''' );
   DMCXP.cdsDetCjeProv.close;
   DMCXP.cdsDetCjeClie.close;
   edtCia.text    := '';
   dbeNReg.text   := '';
   dtpFEmis.date  := date;
   edtTMon.text   := '';
   dbeTCambio.text:= '';
   edtProv.text   := '';
   edtClie.text   := '';
   edtTDiario.Text:= '';
end;


procedure TFCanjeCxC.Z2bbtnNuevoClick(Sender: TObject);
begin
   if MessageDlg('Ingresar Nuevo Canje'+chr(13)+chr(13)+
                 '   ¿ Está Seguro ?  ',mtConfirmation, [mbYes, mbNo], 0)=mrYes then begin

      // Cancela todas las modificaciones en los
      DMCXP.cdsCjeCxC.CancelUpdates;
      // Reinicializa todo
      DMCXP.cdsCjeCxC.Insert;
      IniciaForma;

      DMCXP.cdsQry3.close;
      DMCXP.cdsQry4.close;
      Filtracds( DMCXP.cdsDetCjeProv,'Select * from CXP311 Where CIAID=''''' );
      Filtracds( DMCXP.cdsDetCjeClie,'Select * from CXP312 Where CIAID=''''' );
      EstadoDeForma( 0, ' ', ' ' );
      Inicializafooter;
   end;
end;


procedure TFCanjeCxC.Z2bbtnGrabaClick(Sender: TObject);
begin
   If DMCXP.cdsDetCjeProv.RecordCount=0 Then Raise exception.Create('Falta Registrar Documentos a Canjear del Proveedor');
   If DMCXP.cdsDetCjeClie.RecordCount=0 Then Raise exception.Create('Falta Registrar Documentos a Canjear del Cliente.');

   if not CuadraCanje then raise exception.create('Montos a Canjear de Documentos no cuadran ');

   if DMCXP.BuscaCxP310( dblcCia.text,dblcTDiario.Text, DMCXP.cdsCjeCxC.FieldByname('CJANOMES').Asstring,
                   meNoreg.text, DMCXP.cdsCjeCxC.FieldByname('CJCANJE').Asstring ) then begin
      ShowMessage('Error : Comprobante Duplicado Verificar');
      Exit;
   end;

   ActualizaCabecera;

   GrabaDetCanje;

   DMCXP.AplicaDatos( DMCXP.cdsCjeCxC,     'CANJECXC' );
   DMCXP.AplicaDatos( DMCXP.cdsDetCjeProv, 'DETCJEPROV' );
   DMCXP.AplicaDatos( DMCXP.cdsDetCjeClie, 'DETCJECLIE' );

   EstadoDeForma(1,DMCXP.cdsCjeCxC.fieldbyname('CJEstado').AsString,DMCXP.cdsCjeCxC.fieldbyname('CJ_Conta').AsString );


   ShowMessage(' Canje de Documento. Grabado ');

end;


Procedure TFCanjeCxC.GrabaDetCanje;
Var
   xSalTL,xSalTE,xSalTO,
   xSaldoPO,xSaldoPL, xSaldoPE,
   xSaldoTempO,xSaldoTempL,xSaldoTempE,
   xSaldoCxPO,xSaldoCxPL,xSaldoCxPE : double;
   xSaldoCxCO,xSaldoCxCL,xSaldoCxCE            : double;
   xPeriodo , xNReg, xPeriodo2 , xNReg2        : string;
   xnRegP,xnRegC,i  : integer;   //# de Reg, de Prov y Cliente
begin
   xnRegC := DMCXP.cdsDetCjeClie.recordcount;
   xnRegP := DMCXP.cdsDetCjeProv.recordcount;
   DMCXP.cdsDetCjeClie.First;
   i:=1;
   DMCXP.cdsDetCjeClie.Disablecontrols;
   DMCXP.cdsDetCjeProv.First;
   DMCXP.cdsDetCjeProv.Disablecontrols;
   xSaldoTempO :=0; xSaldoTempL :=0; xSaldoTempE :=0;    xSaldoPL:= 0; xSaldoPE:= 0; xSaldoPO:= 0; xSalTL  := 0; xSalTO  := 0; xSalTE  := 0;

   while not DMCXP.cdsDetCjeProv.Eof do begin
      //xPeriodo := DMCXP.cdsDetCjeProv.fieldbyname('DCJANOMM').value;
      xPeriodo := DMCXP.cdsDetCjeProv.fieldbyname('DCPANOMM').value;
      xNReg    := DMCXP.cdsDetCjeProv.fieldbyname('DCJNOREG').value;
      xSaldoPL := DMCXP.cdsDetCjeProv.fieldbyname('DCJMOLOC').AsFloat;
      xSaldoPE := DMCXP.cdsDetCjeProv.fieldbyname('DCJMOEXT').AsFloat;
      if DMCXP.cdsDetCjeprov.fieldbyname('TMonID').Value=DMCXP.wTMonLoc Then
         xSaldoPO := DMCXP.cdsDetCjeProv.fieldbyname('DCJMOLOC').value
      else
          xSaldoPO := DMCXP.cdsDetCjeProv.fieldbyname('DCJMOEXT').value;

      xSaldoCxCL:= 0; xSaldoCxCE:= 0; xSaldoCxCO:= 0; xSaldoCxPL:= 0; xSaldoCxPE:= 0; xSaldoCxPO:= 0;

      if xSaldoPO > 0 then  begin
         While not DMCXP.cdsDetCjeClie.Eof do begin
            //xPeriodo2   := DMCXP.cdsDetCjeClie.fieldbyname('DCJANOMM').value;
            xNReg2      := DMCXP.cdsDetCjeClie.fieldbyname('DCJNOREG').value;
            xPeriodo2   := DMCXP.cdsDetCjeClie.fieldbyname('DCPANOMM').value;
            xSaldoTempL := xSaldoTempL + DMCXP.cdsDetCjeClie.fieldbyname('DCJMOLOC').AsFloat;
            xSaldoTempE := xSaldoTempE + DMCXP.cdsDetCjeClie.fieldbyname('DCJMOEXT').AsFloat ;
            if DMCXP.cdsDetCjeClie.fieldbyname('TMonID').Value=DMCXP.wTMonLoc Then begin
               xSalTO   := DMCXP.cdsDetCjeClie.fieldbyname('DCJMOLOC').Asfloat;//Temporal de cliente
               xSaldoTempO := xSaldoTempO + DMCXP.cdsDetCjeClie.fieldbyname('DCJMOLOC').AsFloat;
               if xNRegC >=1 then begin
                  xSaldoCxCL := FRound(DMCXP.cdsDetCjeClie.fieldbyname('DCJSALLOC').Asfloat - DMCXP.cdsDetCjeClie.fieldbyname('DCJMOLOC').Asfloat,15,2);
                  xSaldoCxCE := FRound(DMCXP.cdsDetCjeClie.fieldbyname('DCJSALEXT').Asfloat - DMCXP.cdsDetCjeClie.fieldbyname('DCJMOEXT').Asfloat,15,2);
                  xSaldoCxCO := xSaldoCxCL;
               end;
            end
            else begin
               xSalTO := DMCXP.cdsDetCjeClie.fieldbyname('DCJMOEXT').value;
               xSaldoTempO := xSaldoTempO + DMCXP.cdsDetCjeClie.fieldbyname('DCJMOEXT').AsFloat;
               if xNRegC >= 1 then begin
                  xSaldoCxCL := FRound(DMCXP.cdsDetCjeClie.fieldbyname('DCJSALLOC').Asfloat - DMCXP.cdsDetCjeClie.fieldbyname('DCJMOLOC').Asfloat,15,2);
                  xSaldoCxCE := FRound(DMCXP.cdsDetCjeClie.fieldbyname('DCJSALEXT').Asfloat - DMCXP.cdsDetCjeClie.fieldbyname('DCJMOEXT').Asfloat,15,2);
                  xSaldoCxCO := xSaldoCxCE;
               end;
            end;

            if xNregC >= 1 then begin
               ActualizaSaldoCxC(xPeriodo2, xNReg2, xSaldoCxCO,xSaldoCxCL,xSaldoCxcE);
               GrabaRegCxC305; // Grabar en CxC305 en monto = al canje
            end;

            if (xnRegC>= xNregP)or (i<=xNregC)then begin
               DMCXP.cdsDetCjeClie.Next;
               i := i +1;
            end;
         end;//while

         if (xSaldoTempO >= 0) or (xnRegC >= xnRegP)then begin
            GrabaRegCxP305; // Grabar en cxp305 en monto = al canje
            xSaldoCxPL := FRound(DMCXP.cdsDetCjeProv.fieldbyname('DCJSALLOC').Asfloat - DMCXP.cdsDetCjeProv.fieldbyname('DCJMOLOC').Asfloat,15,2);
            xSaldoCxPE := FRound(DMCXP.cdsDetCjeprov.fieldbyname('DCJSALEXT').Asfloat - DMCXP.cdsDetCjeProv.fieldbyname('DCJMOEXT').Asfloat,15,2);
            if DMCXP.cdsDetCjeprov.fieldbyname('TMonID').Value=DMCXP.wTMonLoc Then begin
               xSaldoCxPO := xSaldoCxPL ;
            end
            else begin
               xSaldoCxPO := xSaldoCxPE ;
            end;
            ActualizaSaldoCxP(xperiodo, xNReg,xSaldoCxPO,xSaldoCxPL,xSaldoCxPE);

            DMCXP.cdsDetCjeProv.Next;
         end;
      end;
   end;
   try
      DMCXP.cdsDetCjeclie.EnableControls;
   except
   end;

end;

Procedure TFCanjeCxC.ActualizaPago;
Var
	xSAldoCl, xSaldoCE, xSaldoCo,
  xSaldoPL,   xSaldoPE,xSaldoPO,
  xPagoPL,   xPagoPE,xPagoPO,
  xSaldoTempO,xSaldoTempL,xSaldoTempE, xSaldoCxPO,xSaldoCxPL,xSaldoCxPE : double;
  xPeriodo ,xNReg,xPeriodo2, xNReg2,xEstado                   : string;
  xnRegP,xnRegC,i  : integer;   //# de Reg, de Prov y Cliente
begin
  xnRegC := DMCXP.cdsDetCjeClie.recordcount;
  xnRegP := DMCXP.cdsDetCjeProv.recordcount;
  DMCXP.cdsDetCjeClie.First;
  i:=1;
  DMCXP.cdsDetCjeClie.Disablecontrols;
  DMCXP.cdsDetCjeProv.First;
  DMCXP.cdsDetCjeProv.Disablecontrols;

  xEstado := '';
  xSaldoPL := 0; xSaldoPE := 0; xSaldoPO := 0;
  While not DMCXP.cdsDetCjeProv.Eof do
  begin
  	xPeriodo := DMCXP.cdsDetCjeProv.fieldbyname('DCJANOMM').value;
    xNReg    := DMCXP.cdsDetCjeProv.fieldbyname('DCJNOREG').value;
    {//** 03/10/2001 - pjsv
    //xSaldoCL := DMCXP.cdsDetCjeClie.fieldbyname('DCJMoLoc').AsFloat;
    //xSaldoCE := DMCXP.cdsDetCjeClie.fieldbyname('DCJMoExt').AsFloat;
    xSaldoCL := DMCXP.cdsDetCjeClie.fieldbyname('DCJSALLoc').AsFloat;
    xSaldoCE := DMCXP.cdsDetCjeClie.fieldbyname('DCJSALExt').AsFloat;
    //**}
    xSaldoPL := DMCXP.cdsDetCjeProv.fieldbyname('DCJMoLoc').AsFloat;
    xSaldoPE := DMCXP.cdsDetCjeProv.fieldbyname('DCJMoExt').AsFloat;
    if DMCXP.cdsDetCjeProv.fieldbyname('TMonID').Value=DMCXP.wTMonLoc Then
    begin
    	xSaldoPO := xSaldoPL ;
    end
    else
    begin
    	xSaldoPO := xSaldoPL ;
    end;

    xSaldoCL:= 0; xSaldoCE:= 0; xSaldoCO:= 0;
    xSaldoCxPO := 0; xSaldoCxPL := 0; xSaldoCxPE := 0;
    xPagoPO := 0; xPagoPL := 0; xPagoPE := 0;
    xSaldoTempO :=0;    xSaldoTempL :=0;    xSaldoTempE :=0;
    if xSaldoPO > 0 then
    begin
    	While not DMCXP.cdsDetCjeClie.Eof do
      begin
      	xPeriodo2 := DMCXP.cdsDetCjeClie.fieldbyname('DCPANOMM').value;
        xNReg2    := DMCXP.cdsDetCjeClie.fieldbyname('DCJNOREG').value;
        //** 03/10/2001 - pjsv
        //xSaldoCL := DMCXP.cdsDetCjeClie.fieldbyname('DCJMoLoc').AsFloat;
        //xSaldoCE := DMCXP.cdsDetCjeClie.fieldbyname('DCJMoExt').AsFloat;
        xSaldoCL := DMCXP.cdsDetCjeClie.fieldbyname('DCJSALLoc').AsFloat;
        xSaldoCE := DMCXP.cdsDetCjeClie.fieldbyname('DCJSALExt').AsFloat;
        //**
        xSaldoTempL := xSaldoTempL + DMCXP.cdsDetCjeClie.fieldbyname('DCJMoLoc').AsFloat;//total a descontar
        xSaldoTempE := xSaldoTempE + DMCXP.cdsDetCjeClie.fieldbyname('DCJMoExt').AsFloat;
        if DMCXP.cdsDetCjeClie.fieldbyname('TMonID').Value=DMCXP.wTMonLoc Then
        begin
           xSaldoTempO := xSaldoTempL;
           //** 03/10/2001 - pjsv
           xSaldoCO := xSaldoTempL; //xSaldoCL;//pago original
           if (xSaldoCL-DMCXP.cdsDetCjeClie.fieldbyname('DCJMoLoc').AsFloat = 0) then
            xEstado := 'C'
           else
           	xEstado := 'P';
           //**
        end
        else
        begin
          xSaldoTempO := xSaldoTempE;
          //** 03/10/2001 - pjsv
          xSaldoCO := xSaldoTempE;//xSaldocE;
          if (xSaldocE = 0) then xEstado := 'C'
          else xEstado := 'P';
          //**
        end;
        if xNregC >= 1 then
        begin
        	ActualizaPagoCxC(xperiodo2, xNReg2,xEstado,xSaldoCO,xSaldoCL,xSaldoCE);//Actualiza Pagos en CxC301
        end;
        if  (xnRegC>= xNregP)or (i<=xNregC)then
        begin
        	DMCXP.cdsDetCjeClie.Next;
          i := i +1;
        end ;
      end;//while
    	if (xSaldoTempO >= 0) or (xnRegC >= xnRegP) then
      begin
      	//** 03/10/2001 - pjsv
        //xsaldoCxPL := DMCXP.cdsDetCjeProv.fieldbyname('DCJMOLoc').AsFloat;
        //xsaldoCxPE := DMCXP.cdsDetCjeProv.fieldbyname('DCJMOExt').AsFloat;
        xSaldoCxPL := DMCXP.cdsDetCjeProv.fieldbyname('DCJSALLOC').AsFloat;
        xSaldoCxPE := DMCXP.cdsDetCjeProv.fieldbyname('DCJSALEXT').AsFloat;
        xPagoPL    := DMCXP.cdsDetCjeProv.fieldbyname('DCJMOLOC').AsFloat;
        xPagoPE    := DMCXP.cdsDetCjeProv.fieldbyname('DCJMOEXT').AsFloat;
        //**
        if DMCXP.cdsDetCjeprov.fieldbyname('TMONID').Value=DMCXP.wTMonLoc Then
        begin
        	//** 03/10/2001 - pjsv
          xPagoPO := xPagoPL;//xSaldoCxPL;
          if (xSaldoCxPL-DMCXP.cdsDetCjeProv.fieldbyname('DCJMOLOC').AsFloat = 0) then
          	xEstado := 'C'
          else xEstado := 'P';
           //**
          end
        	else
         	begin
          	//** 03/10/2001 - pjsv
           	xPagoPO := xPagoPL;//xSaldoTempE;
           	if (xSaldoCxPE = 0) then
            	xEstado := 'C'
           	else
            	xEstado := 'P';
           //**
         end;
         ActualizaPagoCxP(xperiodo, xNReg,xEstado,xPagoPO,xPagoPL,xPagoPE);
         DMCXP.cdsDetCjeProv.Next;
			end;
  	end;
  end;
  DMCXP.cdsDetCjeClie.EnableControls;
  DMCXP.cdsDetCjeProv.EnableControls;
end;

Procedure TFCanjeCxC.ActualizaSaldoCxP(xxPeriodo,xxNReg : string;xxSaldoCxPO,xxSaldoCxPL,xxSaldoCxPE : double);
var
   xSQL : string;
begin
       xSQL := 'Update CXP301 Set CPSALORI = '+''+floattostr(xxSaldoCxPO)+'';
       xSQL :=  xSQL + ' , CPSALLOC = '+''+floattostr(xxSaldoCxPL)+'';
       xSQL :=  xSQL + ' , CPSALEXT = '+''+floattostr(xxSaldoCxPE)+'';
       xSQL :=  xSQL + ' , Flagvar ='+''''+''+'''';
       xSQL :=  xSQL + '  Where CIAID =' +''''+dblcCia.Text    +'''';
       xSQL :=  xSQL + '  and PROV =' +''''+dblcdPROV.Text    +'''';
       xSQL :=  xSQL + '  and CPANOMES =' +''''+xxPeriodo    +'''';
       xSQL :=  xSQL + '  and CPNOREG =' +''''+xxNReg    +'''';
       xSQL := UpperCase( xSQL );
       DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

end;
Procedure TFCanjeCxC.ActualizaSaldoCxC(xxPeriodo,xxNReg : string;xxSaldoCxPO,xxSaldoCxPL,xxSaldoCxPE : double);
var
   xSQL : string;
begin
       xSQL := 'Update CXC301 Set CCSALORI = '+''+floattostr(xxSaldoCxPO)+'';
       xSQL :=  xSQL + ' , CCSALLOC = '+''+floattostr(xxSaldoCxPL)+'';
       xSQL :=  xSQL + ' , CCSALEXT = '+''+floattostr(xxSaldoCxPE)+'';
       xSQL :=  xSQL + ' , Flagvar ='+''''+''+'''';
       xSQL :=  xSQL + '  Where CIAID =' +''''+dblcCia.Text    +'''';
       xSQL :=  xSQL + '  and CLIEID =' +''''+dblcdClie.Text    +'''';
       xSQL :=  xSQL + '  and CCANOMES =' +''''+xxPeriodo    +'''';
       xSQL :=  xSQL + '  and CCNOREG =' +''''+xxNReg    +'''';
       xSQL := UpperCase( xSQL );
       try
        DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
       except
       end;

end;

Procedure TFCanjeCxC.ActualizaPagoCxP(xxPeriodo,xxNReg,xxEstado : string;xxPagoPO,xxPagoPL,xxPagoPE : double);
var
	xSQL : string;
begin
  //** 03/10/2001 - PJSV
  xSQL := 'Update CXP301 Set CPPAGORI = '+DMCXP.wReplacCeros +'(CPPAGORI,0) + '+''+floattostr(xxPagoPO)+'';
  xSQL :=  xSQL + ' , CPPAGLOC ='+DMCXP.wReplacCeros+'(CPPAGLOC,0) + '+''+floattostr(xxPagoPL)+'';
  xSQL :=  xSQL + ' , CPPAGEXT ='+DMCXP.wReplacCeros+'(CPPAGEXT,0) + '+''+floattostr(xxPagoPE)+'';
  //**
  if Length(xxEstado)>0 then
  xSQL :=  xSQL + ' , CPESTADO ='+''''+xxEstado+'''';
  xSQL :=  xSQL + '  Where CIAID =' +''''+dblcCia.Text    +'''';
  xSQL :=  xSQL + '  and PROV =' +''''+dblcdPROV.Text    +'''';
  xSQL :=  xSQL + '  and CPANOMES =' +''''+xxPeriodo    +'''';
  xSQL :=  xSQL + '  and CPNOREG =' +''''+xxNReg    +'''';
  xSQL := UpperCase( xSQL );
  DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
end;
Procedure TFCanjeCxC.ActualizaPagoCxC(xxPeriodo,xxNReg,xxEstado : string;xxPagoPO,xxPagoPL,xxPagoPE : double);
var
  xSQL : string;
begin
  //** 03/10/2001 - PJSV
  xSQL := 'Update CXC301 Set CCPAGORI = '+DMCXP.wReplacCeros+'(CCPAGORI,0) +'+''+floattostr(xxPagoPO)+'';
  xSQL :=  xSQL + ' , CCPAGLOC ='+DMCXP.wReplacCeros+'(CCPAGLOC,0) + '+''+floattostr(xxPagoPL)+'';
  xSQL :=  xSQL + ' , CCPAGEXT ='+DMCXP.wReplacCeros+'(CCPAGEXT,0) +'+''+floattostr(xxPagoPE)+'';
  //**
  if Length(xxEstado)>0 then
  xSQL :=  xSQL + ' , CCESTADO ='+''''+xxEstado+'''';
  xSQL :=  xSQL + '  Where CIAID =' +''''+dblcCia.Text    +'''';
  xSQL :=  xSQL + '  and CLIEID =' +''''+dblcdClie.Text    +'''';
  xSQL :=  xSQL + '  and CCANOMES =' +''''+xxPeriodo    +'''';
  xSQL :=  xSQL + '  and CCNOREG =' +''''+xxNReg    +'''';
  xSQL := UpperCase( xSQL );
  DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
end;


Procedure TFCanjeCxC.GrabaRegCxP305;
var
   xSQL, xNReg  : string;
   xWhere : string;
begin
   xWhere := 'CIAID='+''''+dblcCia.Text+''''+' and TCANJEID='+''''+'LE'+'''';
   xNReg  := DMCXP.BuscaUltTGE('PrvUltCxP','CXP305','CCPCANJE',xWhere);

   xSQL:= 'INSERT INTO CXP305(CIAID, PROV, PROVRUC, ';
   xSQL:= xSQL+'DOCID, CPSERIE, CPNODOC, CPNOREG, TCANJEID, CCPCANJE, CCPFCJE, CPSERIE2, CPNODOC2, ';
   xSQL:= xSQL+'TMONID, DCDMOLOC, DCDMOEXT, DCDUSER, DCDFREG, DCDHREG, ';
   xSQL:= xSQL+'DCDMM, DCDDD, DCDTRI, DCDSEM, DCDSS, DCDANOMM, DCDAATRI, DCDAASEM, ';
   xSQL := xSQL + 'DCDTCAMB, SALLOC, SALEXT) VALUES ('+''''+dblcCia.text+''''+','+''''+dblcdProv.text+'''';
   xSQL := xSQL + ','+''''+dblcdProvRuc.text+'''';
   xSQL := xSQL +','+''''+DMCXP.cdsDetCjeProv.fieldbyname('DOCID').AsString+''','+''''+DMCXP.cdsDetCjeProv.fieldbyname('DCJSERIE').AsString+'''';
   xSQL := xSQL + ','+''''+DMCXP.cdsDetCjeProv.fieldbyname('DCJNODOC').AsString +''''+','+''''+DMCXP.cdsDetCjeProv.fieldbyname('DCJNOREG').AsString+'''';
   xSQL:= xSQL+ ','+''''+'CI' +''''+','+''''+xNReg +''''+','+''''+FORMATDATETIME(DMCXP.wFormatFecha,dtpFemis.date ) +'''';
   xSQL:= xSQL+ ','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJSERIE').AsString +''''+','+''''+ DMCXP.cdsDetCjeProv.fieldbyname('DCJNODOC').AsString+'''';
   xSQL:= xSQL+ ','+''''+dblcTmon.text +'''';
   xSQL:= xSQL+ ','+''+DMCXP.cdsDetCjeClie.fieldbyname('DCJMOLOC').AsString +''+','+''+DMCXP.cdsDetCjeProv.fieldbyname('DCJMOEXT').AsString +''+','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJUSER').value +'''';
//   xSQL:= xSQL+ ','+''''+FORMATDATETIME(DMCXP.wFormatFecha,Date ) +''''+','+''''+FORMATDATETIME('HH:MM',Date ) +''''+','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJMM').AsString +'''';
   xSQL:= xSQL+ ','+''''+FORMATDATETIME(DMCXP.wFormatFecha,Date ) +''''+','+DMCXP.wRepHorServi+','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJMM').AsString +'''';
   xSQL:= xSQL+ ','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJDD').value +''''+','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJTRI').AsString +''''+','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJSEM').AsString +'''';
   xSQL:= xSQL+ ','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJSS').value +''''+','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJANOMM').AsString +''''+','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJAATRI').value +'''';
   xSQL:= xSQL+ ','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJAASEM').value +''''+','+''+dbeTCambio.text+''+','+''+DMCXP.cdsDetCjeClie.fieldbyname('DCJSALLOC').AsString +''+','+''+DMCXP.cdsDetCjeClie.fieldbyname('DCJSALEXT').AsString +')';
   xSQL := UpperCase( xSQL );

   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

end;

Procedure TFCanjeCxC.GrabaRegCxC305;
var
   xSQL, xNReg  : string;
   xWhere : string;
begin
   xWhere := 'CIAID='+''''+dblcCia.Text+''''+' and TCANJEID='+''''+'LE'+'''';
   xNReg  := DMCXP.BuscaUltTGE('PrvUltCxP','CXC305','CCCANJE',xWhere);

   xSQL:= 'Insert into CXC305(CIAID ,CLIEID , CLIERUC ';
   xSQL:= xSQL+', DOCID, CCSERIE, CCNODOC, CCNOREG, TCANJEID, CCCANJE , CCFCANJE , CCSERIE2 ,  CCNODOC2';
   xSQL:= xSQL+', TMONID, DCCMTOLOC, DCCMTOEXT, DCCUSER,DCCFREG , DCCHREG';
   xSQL:= xSQL+', DCCMM, DCCDD, DCCTRI, DCCSEM, DCCSS,DCCANOMM, DCCAATRI, DCCAASEM';
   xSQL := xSQL + ',DCCTCAMB,SALLOC, SALEXT) Values ('+''''+dblcCia.text+''''+','+''''+dblcdProv.text+'''';
   xSQL := xSQL + ','+''''+dblcdClieRuc.text+'''';
   xSQL := xSQL +','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DOCID').AsString+''''+','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJSERIE').AsString+'''';
   xSQL := xSQL + ','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJNODOC').AsString +''''+','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJNOREG').AsString+'''';
   xSQL:= xSQL+ ','+''''+'CI' +''''+','+''''+xNReg +''''+','+''''+FORMATDATETIME(DMCXP.wFormatFecha,dtpFemis.date ) +'''';
   xSQL:= xSQL+ ','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJSERIE').AsString +''''+','+''''+ DMCXP.cdsDetCjeClie.fieldbyname('DCJNODOC').AsString+'''';
   xSQL:= xSQL+ ','+''''+dblcTmon.text +'''';
   xSQL:= xSQL+ ','+''+DMCXP.cdsDetCjeClie.fieldbyname('DCJMOLOC').AsString +''+','+''+DMCXP.cdsDetCjeProv.fieldbyname('DCJMOEXT').AsString +''+','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJUSER').value +'''';
//   xSQL:= xSQL+ ','+''''+FORMATDATETIME(DMCXP.wFormatFecha,Date ) +''''+','+''''+FORMATDATETIME('HH:MM',time ) +''''+','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJMM').AsString +'''';
   xSQL:= xSQL+ ','+''''+FORMATDATETIME(DMCXP.wFormatFecha,Date ) +''''+','+DMCXP.wRepHorServi+', '+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJMM').AsString +'''';
   xSQL:= xSQL+ ','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJDD').value +''''+','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJTRI').AsString +''''+','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJSEM').AsString +'''';
   xSQL:= xSQL+ ','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJSS').value +''''+','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJANOMM').AsString +''''+','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJAATRI').value +'''';
   xSQL:= xSQL+ ','+''''+DMCXP.cdsDetCjeClie.fieldbyname('DCJAASEM').value +''''+','+''+dbeTCambio.text+''+','+''+DMCXP.cdsDetCjeClie.fieldbyname('DCJSALLOC').AsString +''+','+''+DMCXP.cdsDetCjeClie.fieldbyname('DCJSALEXT').AsString +')';
   xSQL := UpperCase( xSQL );

   ShowMessage( 'Detalle : '+xSQL );
   
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

end;


procedure TFCanjeCxC.ActualizaCabecera;
var
   xPagoLocProv,xPagoExtProv  : double;
begin
   DMCXP.cdsCjeCxC.Edit;
   xPagoLocProv := OperClientDataSet( DMCXP.cdsDetCjeProv , 'SUM(DCJMOLOC)', '');
   xPagoExtProv := OperClientDataSet( DMCXP.cdsDetCjeProv , 'SUM(DCJMOEXT)', '');

   DMCXP.cdsCjeCxC.fieldbyname('CJMTOLOC').value := xPagoLocProv;
   DMCXP.cdsCjeCxC.fieldbyname('CJMTOEXT').value := xPagoExtProv;
   DMCXP.cdsCjeCxC.fieldbyname('CJESTADO').value := 'I';
   cdsPost( DMCXP.cdsCjeCxC );
end;

function TFCanjeCxC.CuadraCanje: boolean;
var
   xPagoLocClie,xPagoExtClie  : double;
   xPagoLocProv,xPagoExtProv  : double;
begin
   if DMCXP.cdsCjeCxC.fieldbyname('TMonID').Value=DMCXP.wTMonLoc then
    begin
     xPagoLocProv := OperClientDataSet( DMCXP.cdsDetCjeProv , 'SUM(DCJMOLOC)', '');
     xPagoLocClie := OperClientDataSet( DMCXP.cdsDetCjeClie , 'SUM(DCJMOLOC)', '');
     if (xPagoLocClie <> xPagoLocProv) then
      result := false
     else result := True;
    end
   else
    begin
     xPagoExtProv := OperClientDataSet( DMCXP.cdsDetCjeProv , 'SUM(DCJMOEXT)', '');
     xPagoExtClie := OperClientDataSet( DMCXP.cdsDetCjeClie , 'SUM(DCJMOEXT)', '');
     if (xPagoExtClie <>xPagoExtProv) then
      result := false
     else result := True;
    end;
end;


procedure TFCanjeCxC.dbgDocCanjeProvColExit(Sender: TObject);
begin
   if dbgDocCanjeProv.SelectedField.FieldName='DCJMOLOC' then
    begin
     if ( DMCXP.cdsDetCjeProv.fieldbyname('DCJMOLOC').Value>DMCXP.cdsDetCjeProv.fieldbyname('DCJSalLoc').Value ) or
        ( DMCXP.cdsDetCjeProv.fieldbyname('DCJMOLOC').Value < 0 ) then
      begin
       if DMCXP.cdsDetCjeProv.fieldbyname('DCJMOLOC').Value>DMCXP.cdsDetCjeProv.fieldbyname('DCJSalLoc').Value then
        ShowMessage(' Error :  Monto excede a Saldo Actual ')
       else
        ShowMessage(' Error :  Monto Debe Ser Mayor a Cero ');
      end
     else
      begin
       //** 03/09/2001 - pjsv, actualiza los montos de los otros campos, antes que se actualice el Footer
        HallaMontosProv;
       //**
       SumadbgProv;
      end;
    end;

   if dbgDocCanjeProv.SelectedField.FieldName='DCJMOEXT' then
    begin
     if ( DMCXP.cdsDetCjeProv.fieldbyname('DCJMOEXT').Value>DMCXP.cdsDetCjeProv.fieldbyname('DCJSalExt').Value ) or
        ( DMCXP.cdsDetCjeProv.fieldbyname('DCJMoExt').Value<0 ) then
      begin
       if DMCXP.cdsDetCjeProv.fieldbyname('DCJMOEXT').Value>DMCXP.cdsDetCjeProv.fieldbyname('DCJSalExt').Value then
        ShowMessage('Monto excede a Saldo Actual')
       else
        ShowMessage(' Error :  Monto Debe Ser Mayor a Cero ');
      end
     else
      begin
       //** 03/09/2001 - pjsv, actualiza los montos de los otros campos, antes que se actualice el Footer
       HallaMontosProv;
       //**
       SumadbgProv;
      end;
    end;
end;

procedure TFCanjeCxC.dbgDocCanjeClieColExit(Sender: TObject);
begin
   if dbgDocCanjeClie.SelectedField.FieldName='DCJMOLOC' then
    begin
     if ( DMCXP.cdsDetCjeClie.fieldbyname('DCJMOLOC').Value>DMCXP.cdsDetCjeClie.fieldbyname('DCJSalLoc').Value ) or
        ( DMCXP.cdsDetCjeClie.fieldbyname('DCJMOLOC').Value < 0 ) then
      begin
       if DMCXP.cdsDetCjeClie.fieldbyname('DCJMOLOC').Value>DMCXP.cdsDetCjeClie.fieldbyname('DCJSalLoc').Value then
        ShowMessage(' Error :  Monto excede a Saldo Actual ')
       else
        ShowMessage(' Error :  Monto Debe Ser Mayor a Cero ');
      end
     else
      begin
       //** 03/09/2001 - pjsv, actualiza los montos de los otros campos, antes que se actualice el Footer
        HallaMontosClie;
       //**
       SumadbgClie;
      end;
//     if DMCXP.cdsDetCjeClie.State in [dsInsert,dsEdit] then post;
   end;

   if dbgDocCanjeClie.SelectedField.FieldName='DCJMOEXT' then
    begin
     if ( DMCXP.cdsDetCjeClie.fieldbyname('DCJMOEXT').Value>DMCXP.cdsDetCjeClie.fieldbyname('DCJSalExt').Value ) or
        ( DMCXP.cdsDetCjeClie.fieldbyname('DCJMoExt').Value<0 ) then
       begin
        if DMCXP.cdsDetCjeClie.fieldbyname('DCJMOEXT').Value>DMCXP.cdsDetCjeClie.fieldbyname('DCJSalExt').Value then
          ShowMessage('Monto excede a Saldo Actual')
        else
         ShowMessage(' Error :  Monto Debe Ser Mayor a Cero ');
       end
      else
       begin
       //** 03/09/2001 - pjsv, actualiza los montos de los otros campos, antes que se actualice el Footer
        HallaMontosClie;
       //**
       SumadbgClie;
      end;
   end;

end;

procedure TFCanjeCxC.Z2bbtnAceptaClick(Sender: TObject);

begin
  If DMCXP.cdsDetCjeProv.RecordCount=0 Then Raise exception.Create('Falta Registrar Documentos a Canjear del Proveedor');
  If DMCXP.cdsDetCjeClie.RecordCount=0 Then Raise exception.Create('Falta Registrar Documentos a Canjear del Cliente.');

  if not CuadraCanje then raise exception.create('Montos a Canjear de Documentos no cuadran ');

   DMCXP.cdsCjeCxC.DisableControls;
   // Actualiza Canjes  Estado='P'
   DMCXP.cdsCjeCxC.Edit;
   DMCXP.cdsCjeCxC.fieldbyname('CJESTADO').Value := 'P';
   DMCXP.cdsCjeCxC.fieldbyname('CJUSER').Value   := DMCXP.wUsuario;
   DMCXP.cdsCjeCxC.fieldbyname('CJFREG').Value   := date;
   DMCXP.cdsCjeCxC.fieldbyname('CJHREG').Value   := Time;
   cdsPost( DMCXP.cdsCjeCxC );

   DMCXP.cdsCjeCxC.EnableControls;
   //Proveedor
   DMCXP.SaldosAuxiliar( DMCXP.cdsCjeCxC.fieldbyname('CIAID').AsString,DMCXP.cdsCjeCxC.fieldbyname('CJANOMES').Value,
                       DMCXP.cdsCjeCxC.fieldbyname('CLAUXPROV').Value,DMCXP.cdsCjeCxC.fieldbyname('PROV').Value,
                       '-', DMCXP.cdsCjeCxC.fieldbyname('CJMTOLOC').value, DMCXP.cdsCjeCxC.fieldbyname('CJMTOEXT').value, DMCXP.cdsCjeCxC.fieldbyname('TMONID').value );
   //Cliente
   DMCXP.SaldosAuxiliar( DMCXP.cdsCjeCxC.fieldbyname('CIAID').AsString,DMCXP.cdsCjeCxC.fieldbyname('CJANOMES').Value,
                       DMCXP.cdsCjeCxC.fieldbyname('CLAUXCLIE').Value,DMCXP.cdsCjeCxC.fieldbyname('CLIEID').Value,
                       '-', DMCXP.cdsCjeCxC.fieldbyname('CJMTOLOC').value, DMCXP.cdsCjeCxC.fieldbyname('CJMTOEXT').value, DMCXP.cdsCjeCxC.fieldbyname('TMONID').value );

   ActualizaPago;

   DMCXP.AplicaDatos( DMCXP.cdsCjeCxC, 'CANJECXC' );

   EstadoDeForma(1,DMCXP.cdsCjeCxC.fieldbyname('CJEstado').AsString,DMCXP.cdsCjeCxC.fieldbyname('CJ_Conta').AsString );

   ShowMessage(' Canje de Documentos Aceptado ');

end;

procedure TFCanjeCxC.Z2bbtnContabClick(Sender: TObject);
var
   xTDiar   : string;
   xPeriodo, xNoReg, xSQL : string;
begin
   if not CanjesAceptados then Raise exception.Create(' Error :  Falta Aceptar Canje ');

   if DMCXP.MesCerrado(copy(xAnomes,5,2),copy(xAnomes,1,4),dblcCia.text) then
   begin
      ShowMessage(' Mes cerrado, no se puede contabilizar');
      exit;
   end;

   if MessageDlg( 'Contabiliza Compensación' + chr(13)+
                  '     ¿Esta Seguro?      ', mtConfirmation,[mbYes, mbNo],0)=mrNo then
     	exit;

   GeneraAsiento;

   xSQL:='Delete FROM CNT311 Where CIAID='+quotedstr(dblcCia.text) +' and '
        + 'CNTANOMM='+quotedstr(DMCXP.cdsCjeCxC.FieldByName('CJANOMES').AsString) +' and '
        + 'TDIARID='+quotedstr(dblcTDiario.text) +' and '
        + 'CNTCOMPROB='+quotedstr(meNoReg.text);
   try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
   except
   end;

   xSQL:='Delete FROM CNT310 Where CIAID='+quotedstr(dblcCia.text) +' and '
        + 'CNTANOMM='+quotedstr(DMCXP.cdsCjeCxC.FieldByName('CJANOMES').AsString) +' and '
        + 'TDIARID='+quotedstr(dblcTDiario.text) +' and '
        + 'CNTCOMPROB='+quotedstr(meNoReg.text);
   try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
   except
   end;

   DMCXP.GeneraContab( dblcCia.Text, dblcTDiario.text, DMCXP.cdsCjeCxC.FieldByName('CJANOMES').AsString, DMCXP.cdsCjeCxC.FieldByName('CPNOREG').AsString, Self, 'C' );

   DMCXP.cdsCjeCxC.Edit;
   DMCXP.cdsCjeCxC.fieldbyname('CJ_CONTA').Value := 'S';
   DMCXP.cdsCjeCxC.fieldbyname('CJUser').Value   := DMCXP.wUsuario;
   DMCXP.cdsCjeCxC.fieldbyname('CJFReg').Value   := date;
   DMCXP.cdsCjeCxC.fieldbyname('CJHReg').Value   := Time;
   cdsPost( DMCXP.cdsCjeCxC );

   DMCXP.AplicaDatos( DMCXP.cdsCjeCxC, 'CANJECXC' );
   
   EstadoDeForma(1,DMCXP.cdsCjeCxC.fieldbyname('CJEstado').AsString,DMCXP.cdsCjeCxC.fieldbyname('CJ_Conta').AsString );
   Z2bbtnContab.enabled := False;
   ShowMessage('Registro Contabilizado');
end;

Function TFCanjeCxC.CanjesAceptados:Boolean;
begin
// DMCXP.cdsCjeCxC.First;
   If DMCXP.cdsCjeCxC.fieldbyname('CJEstado').AsString='P' then
      Result := True
   else
      Result := False;
end;

procedure TFCanjeCxC.dblcTDiarioExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

  edtTDiario.Text:= DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);
  if length(edtTDiario.Text)=0 then
   begin
      ShowMessage('Diario no existe');
      dblcTDiario.Text:='';
      dblcTDiario.SetFocus;
   end;

  dblcClAux.SetFocus;
end;
function TFCanjeCxC.BuscaCxPReg( PCia,PNoReg:String):Boolean;
var
   xSQL: String;
begin
   xSQL:='select * from CXP310 Where ';
   xSQL:= xSQL + 'CiaID='   +''''+ PCia +''''+' and ';
   xSQL:= xSQL + 'CJcanje=' +''''+ PNoReg +'''';
   xSQL := UpperCase( xSQL );
   DMCXP.cdsUltTGE.Close;
   DMCXP.cdsUltTGE.ProviderName:='dspCxP';
   DMCXP.cdsUltTGE.DataRequest(xSQL);
   DMCXP.cdsUltTGE.Open;
   If DMCXP.cdsUltTGE.RecordCount>0 then
      result:=True
   Else
      result:=False;
end;


procedure TFCanjeCxC.dblcClAuxExit(Sender: TObject);
var
	xWhere : string;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

  xWhere:='ClAuxId='''+dblcClAux.Text+''' and MODULO LIKE ''%'+DMCXP.wModulo+'%''';
  if length(BuscaQry('dspTGE','TGE102','CLAUXDES',xWhere,'CLAUXDES'))=0 then
  begin
     dblcClAux.SetFocus;
     Raise Exception.Create('Clase de Auxiliar');
  end;
  Screen.Cursor:=crHourGlass;
  Filtracds( DMCXP.cdsProv,'Select CLAUXID, PROV, PROVRUC, PROVDES, PROVABR from TGE201 Where CLAUXID='''+dblcClAux.Text+'''' );
  Screen.Cursor:=crDefault;
end;

procedure TFCanjeCxC.dblcPrAuxExit(Sender: TObject);
var
	xWhere : string;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

  xWhere:='ClAuxId='''+dblcClAux.Text+''' and MODULO LIKE ''%'+DMCXP.wModulo+'%''';
  if length(BuscaQry('dspTGE','TGE102','CLAUXDES',xWhere,'CLAUXDES'))=0 then
  begin
  	dblcPrAux.SetFocus;
    Raise Exception.Create('Clase de Auxiliar');
  end;
  Screen.Cursor:=crHourGlass;
  Filtracds( DMCXP.cdsQRY2,'SELECT CLAUXID, CLIEID, CLIERUC, CLIEDES, CLIEABR FROM TGE204 WHERE CLAUXID='''+dblcPrAux.Text+'''' );
  Screen.Cursor:=crDefault;
end;

//**03/09/2001 - pjsv
procedure TFCanjeCxC.HallaMontosProv;
begin
   DMCXP.cdsDetCjeProv.Edit;
   if dbgDocCanjeProv.SelectedField.FieldName='DCJMOLOC' then
    begin
     DMCXP.cdsDetCjeProv.fieldbyname('DCJMOEXT').AsFloat := DMCXP.cdsDetCjeProv.fieldbyname('DCJMOLOC').AsFloat / strtofloat(dbeTCambio.text);
    end;
   if dbgDocCanjeProv.SelectedField.FieldName='DCJMOEXT' then
    begin
     DMCXP.cdsDetCjeProv.fieldbyname('DCJMOLOC').AsFloat  := DMCXP.cdsDetCjeProv.fieldbyname('DCJMOEXT').AsFloat * strtofloat(dbeTCambio.text);
    end;
end;

procedure TFCanjeCxC.HallaMontosClie;
begin
   DMCXP.cdsDetCjeClie.Edit;
   if dbgDocCanjeClie.SelectedField.FieldName='DCJMOLOC' then
    begin
     DMCXP.cdsDetCjeClie.fieldbyname('DCJMOEXT').AsFloat := DMCXP.cdsDetCjeClie.fieldbyname('DCJMOLOC').AsFloat / strtofloat(dbeTCambio.text);
    end;
   if dbgDocCanjeClie.SelectedField.FieldName='DCJMOEXT' then
    begin
     DMCXP.cdsDetCjeClie.fieldbyname('DCJMOLOC').AsFloat  := DMCXP.cdsDetCjeClie.fieldbyname('DCJMOEXT').AsFloat * strtofloat(dbeTCambio.text);
    end;
end;
//**

//** 18/09/2001 - PJSV
procedure TFCanjeCxC.dblcdClieDropDown(Sender: TObject);
begin
	DMCXP.cdsQRY2.IndexFieldNames:='ClieDes';
end;

procedure TFCanjeCxC.dblcdProvDropDown(Sender: TObject);
begin
end;


//** 19/09/2001 - PJSV
procedure TFCanjeCxC.dbgDocCanjeClieFieldChanged(Sender: TObject;
  Field: TField);
  var
   xField : TField;
begin
   if (DMCXP.cdsDetCjeClie.State<>dsInsert) and (DMCXP.cdsDetCjeClie.State<>dsBrowse) then
   begin
    xField := dbgDocCanjeClie.GetActiveField;
    If Field = xField then
     dbgDocCanjeClie.OnColExit(sender);
   end;
end;

procedure TFCanjeCxC.dbgDocCanjeProvFieldChanged(Sender: TObject;
  Field: TField);
  var
   xField : TField;
begin
   if (DMCXP.cdsDetCjeProv.State<>dsInsert) and (DMCXP.cdsDetCjeProv.State<>dsBrowse) then
   begin
    xField := dbgDocCanjeProv.GetActiveField;
    If Field = xField then
       dbgDocCanjeProv.OnColExit(sender);
   end;
end;

{procedure TFCanjeCxC.GeneraDiferenciaCambio;
begin
   xDifCLoc:=0;
   xDifCExt:=0;
   if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
    begin
      xPagAnt := FRound( DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat,15,2);
      If DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat > xPagAnt then
       begin
         xDifCam  := FRound( DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat - xPagAnt,15,2);
         xDifCLoc := FRound( (-1)*(DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat - xPagAnt),15,2);
         xCtaDif  := DMCXP.wDifAjuP;
         xGloDif  := 'Perdida - Ajuste por Diferencia de Cambio';
         xDH      := 'D'
       end
      else
       begin
         xDifCam  := FRound(xPagAnt - DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat,15,2);
         xDifCLoc := FRound(xPagAnt - DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat,15,2);
         xCtaDif  := DMCXP.wDifAjuG;
         xGloDif  := 'Ganancia - Ajuste por Diferencia de Cambio';
         xDH      := 'H'
       end;
      end
   else
    begin
      xPagAnt := FRound( DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat,15,2);
      If DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat > xPagAnt then
       begin
         xDifCam  := FRound( DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat - xPagAnt,15,2);
         xDifCExt := FRound( (-1)*(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat - xPagAnt),15,2);
         xCtaDif  := DMCXP.wDifAjuP;
         xGloDif  := 'Perdida - Ajuste por Diferencia de Cambio';
         xDH      := 'D'
       end
      else
       begin
         xDifCam  := xPagAnt - DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
         xDifCExt := xPagAnt - DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
         xCtaDif  := DMCXP.wDifAjuG;
         xGloDif  := 'Ganancia - Ajuste por Diferencia de Cambio';
         xDH      := 'H'
       end;
    end;
end;

procedure TFLetras.GrabaDiferenciaCambio;
begin
   If xDifCam > 0 Then begin
      DMCXP.cdsDetCxP.Insert;
      DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := DMCXP.cdsLetras.FieldByName('TCANJEID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := DMCXP.cdsLetras.FieldByName('CPCANJE').AsString;
      DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsLetras.FieldByName('TDIARID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsLetras.FieldByName('CPNOREG').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsLetras.FieldByName('CPANOMES').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := DMCXP.cdsLetras.FieldByName('CPAAAA').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := xLote;
      DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xCtaDif;
      //cdsDetCxPCptoID.value   := cdsCanjeCptoTot.Value;
      DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsCanje.FieldByName('PROV').AsString;
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsCanje.FieldByName('DOCID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := DMCXP.cdsCanje.FieldByName('CPSERIE').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGloDif;
      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := xDH;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat  := DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat;
      //
      if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := FRound(xDifCam,15,2);
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(xDifCam,15,2);
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := 0;
         end
      else begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := FRound(xDifCam,15,2);
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := 0;
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound(xDifCam,15,2);
      end;
      //
      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime:= DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:= DMCXP.cdsCanje.FieldByName('CPFVCMTO').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime:= dbdtpFComp.Date;
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'P';
      DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := DMCXP.wTMonLoc;
      DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString    := DMCXP.cdsLetras.FieldByName('CPMM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString    := DMCXP.cdsLetras.FieldByName('CPDD').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString   := DMCXP.cdsLetras.FieldByName('CPTRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString   := DMCXP.cdsLetras.FieldByName('CPSEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString    := DMCXP.cdsLetras.FieldByName('CPSS').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString := DMCXP.cdsLetras.FieldByName('CPAATRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString := DMCXP.cdsLetras.FieldByName('CPAASEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString  := DMCXP.cdsLetras.FieldByName('CPAASS').AsString;
      DetCxPUsuario;  // Graba Usuario, Fecha y Hora
   end;
end;
}
//**


//** 03/10/2001 - PJSV
procedure TFCanjeCxC.SeteaGrids;
begin
    dbgDocProv.Selected.clear;
    dbgDocProv.Selected.Add('TDIARID'#9'2'#9'TD');
    dbgDocProv.Selected.Add('CPANOMES'#9'6'#9'Periodo');
    dbgDocProv.Selected.Add('TMONID'#9'2'#9'TM');
    dbgDocProv.Selected.Add('CPSERIE'#9'4'#9'Serie');
    dbgDocProv.Selected.Add('CPNODOC'#9'6'#9'No.Doc');
    dbgDocProv.Selected.Add('CPSALLOC'#9'10'#9'Saldo MN');
    dbgDocProv.Selected.Add('CPSALEXT'#9'10'#9'Saldo ME');
    dbgDocProv.Selected.Add('CPNOREG'#9'10'#9'Registro');

    dbgDocClie.Selected.clear;
    dbgDocClie.Selected.Add('TDIARID'#9'2'#9'TD');
    dbgDocClie.Selected.Add('CCANOMES'#9'6'#9'Periodo');
    dbgDocClie.Selected.Add('TMONID'#9'2'#9'TM');
    dbgDocClie.Selected.Add('CCSERIE'#9'4'#9'Serie');
    dbgDocClie.Selected.Add('CCNODOC'#9'6'#9'No.Doc');
    dbgDocClie.Selected.Add('CCSALLOC'#9'10'#9'Saldo MN');
    dbgDocClie.Selected.Add('CCSALEXT'#9'10'#9'Saldo ME');
    dbgDocClie.Selected.Add('CCNOREG'#9'10'#9'Registro');

    dbgDocCanjeProv.Selected.clear;
    dbgDocCanjeProv.Selected.Add('DOCID'#2'4'#9'Doc.');
    dbgDocCanjeProv.Selected.Add('DCJNODOC'#9'6'#9'No.Doc');
    dbgDocCanjeProv.Selected.Add('DCJSALLOC'#9'10'#9'Saldo MN');
    dbgDocCanjeProv.Selected.Add('DCJSALEXT'#9'10'#9'Saldo ME');
    dbgDocCanjeProv.Selected.Add('DCJMOLOC'#9'10'#9'Pago MN');
    dbgDocCanjeProv.Selected.Add('DCJMOEXT'#9'10'#9'Pago ME');

    dbgDocCanjeClie.Selected.clear;
    dbgDocCanjeClie.Selected.Add('DOCID'#9'2'#9'Doc.');
    dbgDocCanjeClie.Selected.Add('DCJNODOC'#9'6'#9'No.Doc');
    dbgDocCanjeClie.Selected.Add('DCJSALLOC'#9'10'#9'Saldo MN');
    dbgDocCanjeClie.Selected.Add('DCJSALEXT'#9'10'#9'Saldo ME');
    dbgDocCanjeCLie.Selected.Add('DCJMOLOC'#9'10'#9'Pago MN');
    dbgDocCanjeClie.Selected.Add('DCJMOEXT'#9'10'#9'Pago ME');
end;


procedure TFCanjeCxC.Z2bbtnPreviewClick(Sender: TObject);
var
   xTDiar, mesdes, mes, ano,tMoneda,MONABR, xWhere   : string;
   xPeriodo, xNoReg, xSQL : string;
   xTotHaber : Double;
begin


   if DMCXP.cdsCjeCxC.fieldbyname('CJ_CONTA').AsString<>'S' then begin

      GeneraAsiento;

      xSQL:='Delete FROM CNT311 Where CIAID='+quotedstr(dblcCia.text) +' and '
           + 'CNTANOMM='+quotedstr(DMCXP.cdsCjeCxC.FieldByName('CJANOMES').AsString) +' and '
           + 'TDIARID='+quotedstr(dblcTDiario.text) +' and '
           + 'CNTCOMPROB='+quotedstr(meNoReg.text);
      try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
      except
      end;

      xSQL:='Delete FROM CNT310 Where CIAID='+quotedstr(dblcCia.text) +' and '
           + 'CNTANOMM='+quotedstr(DMCXP.cdsCjeCxC.FieldByName('CJANOMES').AsString) +' and '
           + 'TDIARID='+quotedstr(dblcTDiario.text) +' and '
           + 'CNTCOMPROB='+quotedstr(meNoReg.text);
      try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
      except
      end;

      DMCXP.GeneraContab( dblcCia.Text, dblcTDiario.text, DMCXP.cdsCjeCxC.FieldByName('CJANOMES').AsString, meNoReg.text, Self, 'P' );

      // Se Transfiere la Data Generada en el SOLContabiliza
      DMCXP.cdsCXP.Data:=DMCXP.cdsMovCnt.data;

      ppdbpPreview.DataSource := DMCXP.dsCxP;

      pprPreview.TEMPLATE.FileName:=ExtractFilePath( application.ExeName ) + wRutaRpt+'\CxPVoucher.rtm' ;
      pprPreview.template.LoadFromFile ;

//      pplblestado.caption:='Previo';
      if DMCXP.cdsCjeCxC.fieldbyname('CJ_CONTA').AsString='S' then
         pplblDesEstado.caption:='Contabilizado'
      else
         pplblDesEstado.caption:='Previo';

      pplblCodProv.caption := dblcdProv.text;
      pplblProveedor.Caption:=edtProv.text ;

      xSQL:='SELECT CNTGLOSA FROM CNT310 WHERE CIAID='+quotedstr(dblcCia.text) +' AND '
           +  'CNTANOMM='+quotedstr(DMCXP.cdsCjeCxC.FieldByName('CJANOMES').AsString) +' AND '
           +  'TDIARID='+quotedstr(dblcTDiario.text) +' AND '
           +  'CNTCOMPROB='+quotedstr(meNoReg.text);
      DMCXP.cdsQry5.close;
      DMCXP.cdsQry5.ProviderName := 'dspTGE';
      DMCXP.cdsQry5.DataRequest(xsql);
      DMCXP.cdsQry5.Open;

      pplblTipoCamb.Caption := FloatToStrF(StrToFloat(dbeTCambio.text),ffNumber,10,3);

      //lblPeriodo.Caption  := meAnoMM.text ;  reemplazado por
      mes:=copy(DMCXP.cdsCjeCxC.FieldByName('CJANOMES').AsString,5,2);
      ano:=copy(DMCXP.cdsCjeCxC.FieldByName('CJANOMES').AsString,1,4);

      xWhere := 'MESIDR='''+mes+'''';
      mesdes := DMCXP.DisplayDescrip2('dspTGE','TGE181','MESDESL',XWHERE,'MESDESL');
      pplblAnoMes.Caption  :=mesdes+' '+ano;
      pplblNoCompro.Caption := meNoReg.text ;
      pplblestado.caption :='Previo';
      tMoneda := DMCXP.DisplayDescrip2('dspTGE','TGE103','TMON_LOC','TMONID='+quotedstr(dblcTMon.text),'TMON_LOC');
      MONABR:= DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONABR','TMONID='+quotedstr(dblcTMon.text),'TMONABR');

      DMCXP.CdsDetCxP.first;
      while not DMCXP.CdsDetCxP.EOF do
      begin
         if DMCXP.CdsDetCxP.fieldbyname('TIPDET').Asstring = 'TO' then
         begin
            pplblMontoImporte.Caption  := MONABR+FloatToStrF(DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat,ffNumber,15,2);
            break;
         end;
         DMCXP.CdsDetCxP.next;
      end;
      If TMoneda = 'L' then
      begin
      pplblMonedaDoc.Visible := false;
      ppdbMtoExt.Visible:= false;
      pplblCntTCambio.Visible:= false;
      ppdbCntTCambio.Visible:= false;
      end;
   end;


   if DMCXP.cdsCjeCxC.fieldbyname('CJ_CONTA').AsString='S' then begin
      xsql:='SELECT * FROM CNT301 '
         +'WHERE CIAID='+quotedstr(dblcCia.text) +' AND '
         +'CNTANOMM='+quotedstr(DMCXP.cdsCjeCxC.FieldByName('CJANOMES').AsString) +' AND '
         +'TDIARID='+quotedstr(dblcTDiario.text) +' AND '
         +'CNTCOMPROB='+quotedstr(meNoReg.text)
         +' order by CNT301.CNTREG';
      DMCXP.cdsCxP.Close;
      DMCXP.cdsCxP.DataRequest(xSQL);
      DMCXP.cdsCxP.Open;

      ppdbpPreview.DataSource := DMCXP.dsCxP;

      pprPreview.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\CxPVoucher.rtm' ;
      pprPreview.template.LoadFromFile ;

      mes:=copy(DMCXP.cdsCxP.fieldbyname('CNTANOMM').asstring,5,2);
      ano:=copy(DMCXP.cdsCxP.fieldbyname('CNTANOMM').asstring,1,4);

      xWhere := 'MESIDR='''+mes+'''';
      mesdes := DMCXP.DisplayDescrip2('dspTGE','TGE181','MESDESL',XWHERE,'MESDESL');
      pplblPeriodo.Caption  :=mesdes+' '+ano;
      MONABR:= DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONABR','TMONID='+quotedstr(dblcTMon.text),'TMONABR');

      pplblestado.caption:='Contabilizado';
      xTotHaber := 0;

      // DMCXP.cdsDetCxP.DisableControls;
      DMCXP.cdsCxP.First ;
      while not DMCXP.cdsCxP.Eof do
      begin
         if DMCXP.cdsCxP.FieldByName('CNTDH').AsString = 'H' then
            xTotHaber:= xTotHaber+FRound(DMCXP.cdsCxP.Fieldbyname('CNTMTOORI').Value,15,2);
         DMCXP.cdsCxP.Next;
      end;
      DMCXP.cdsCxP.First;

//      ppLabel15.Caption:=MONABR+ FloatToStrF(xTotHaber,ffNumber,15,2);

   end;

   pplblCiades.Caption   := edtCia.text ;
   pplblCodProv.Caption := dblcdProv.Text;
   pplblDiario.Caption   := edtTDiario.text  ;
   pplblTDiario.Caption       := dblcTDiario.text ;
   pplblTipoCamb.Caption := FloatToStrF(StrToFloat(dbeTCambio.text),ffNumber,10,3);
   pplblNoCompro.Caption := meNoReg.text ;
   pplblProveedor.Caption:= edtProv.text ;
   pplblmonedaDes.caption   := DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONDES','TMONID='+quotedstr(dblcTMon.text),'TMONDES');
   ppLblglosaDes.caption   := DMCXP.cdsCxP.fieldbyname('CNTGLOSA').asstring;

   DMCXP.cdsCxP.IndexFieldNames:='CNTREG';

   pprPreview.Print;
   pprPreview.Stop;
   ppdbpPreview.DataSource := nil ;
   DMCXP.cdsCxP.IndexFieldNames:='';

end;


procedure TFCanjeCxC.GeneraAsiento;
var
   xSQL : String;
begin
   // Elimina del CXP302
   xSQL:='Delete From CXP302 '
        +'Where CIAID='''   +DMCXP.cdsCjeCxC.FieldByName('CIAID').AsString   +''' AND '
        +      'DCPANOMM='''+DMCXP.cdsCjeCxC.FieldByName('CJANOMES').AsString+''' AND '
        +      'TDIARID=''' +DMCXP.cdsCjeCxC.FieldByName('TDIARID').AsString +''' AND '
        +      'CPNOREG=''' +DMCXP.cdsCjeCxC.FieldByName('CPNOREG').AsString+''' ';
   try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;

   xSQL:='CIAID='''   +DMCXP.cdsCjeCxC.FieldByName('CIAID').AsString   +''' AND '
        +'DCPANOMM='''+DMCXP.cdsCjeCxC.FieldByName('CJANOMES').AsString+''' AND '
        +'TDIARID=''' +DMCXP.cdsCjeCxC.FieldByName('TDIARID').AsString +''' AND '
        +'CPNOREG=''' +DMCXP.cdsCjeCxC.FieldByName('CPNOREG').AsString +''' ';
   Filtracds( DMCXP.cdsDetCxP,  'Select * from CXP302 Where '+xSQL );

   //
   // Cuentas Por Pagar
   //
   DMCXP.cdsDetCjeProv.First;
   while not DMCXP.cdsDetCjeProv.Eof do begin

      DMCXP.cdsDetCxP.Insert;
      DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsCjeCxC.FieldByName('CIAID').AsString;
      DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := DMCXP.cdsCjeCxC.FieldByName('TCANJEID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := DMCXP.cdsCjeCxC.FieldByName('CJCANJE').AsString;
      DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsCjeCxC.FieldByName('TDIARID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsCjeCxC.FieldByName('CPNOREG').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsCjeCxC.FieldByName('CJANOMES').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime:= DMCXP.cdsCjeCxC.FieldByName('CJFCMPRB').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := DMCXP.cdsCjeCxC.FieldByName('CJAAAA').AsString;
      DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := DMCXP.cdsDetCjeProv.FieldByName('CUENTAID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   := DMCXP.cdsDetCjeProv.FieldByName('CUENTAID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := DMCXP.cdsDetCjeProv.FieldByName('CLAUXID').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsDetCjeProv.FieldByName('PROV').AsString;
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsDetCjeProv.FieldByName('DOCID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := DMCXP.cdsDetCjeProv.FieldByName('DCJSERIE').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsDetCjeProv.FieldByName('DCJNODOC').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := 'Compensaciòn';
      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := 'D';
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsCjeCxC.FieldByName('CJTCAM').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := DMCXP.cdsCjeCxC.FieldByName('TMONID').AsString;

      if DMCXP.cdsCjeCxC.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
         DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsDetCjeProv.FieldByName('DCJMOEXT').AsFloat
      else begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsDetCjeProv.FieldByName('DCJMOLOC').AsFloat;
      end;

      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat   := DMCXP.cdsDetCjeProv.FieldByName('DCJMOLOC').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat   := DMCXP.cdsDetCjeProv.FieldByName('DCJMOEXT').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime := DMCXP.cdsCjeCxC.FieldByName('CJFCMPRB').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:= DMCXP.cdsCjeCxC.FieldByName('CJFCMPRB').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString  := 'P';
      DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString     := DMCXP.cdsCjeCxC.FieldByName('CJMM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString     := DMCXP.cdsCjeCxC.FieldByName('CJDD').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString    := DMCXP.cdsCjeCxC.FieldByName('CJTRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString    := DMCXP.cdsCjeCxC.FieldByName('CJSEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString     := DMCXP.cdsCjeCxC.FieldByName('CJSS').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString  := DMCXP.cdsCjeCxC.FieldByName('CJAATRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString  := DMCXP.cdsCjeCxC.FieldByName('CJAASEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString   := DMCXP.cdsCjeCxC.FieldByName('CJAASS').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString   := DMCXP.wUsuario;
      DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime := Date;
      DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime := time;
      cdsPost( DMCXP.cdsDetCxP );

      DMCXP.cdsDetCjeProv.Next;
   end;

   //
   // Cuentas Por Cobrar
   //
   DMCXP.cdsDetCjeClie.First;
   while not DMCXP.cdsDetCjeClie.Eof do begin
      DMCXP.cdsDetCxP.Insert;
      DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsCjeCxC.FieldByName('CIAID').AsString;
      DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := DMCXP.cdsCjeCxC.FieldByName('TCANJEID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := DMCXP.cdsCjeCxC.FieldByName('CJCANJE').AsString;
      DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsCjeCxC.FieldByName('TDIARID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsCjeCxC.FieldByName('CPNOREG').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsCjeCxC.FieldByName('CJANOMES').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime:= DMCXP.cdsCjeCxC.FieldByName('CJFCMPRB').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := DMCXP.cdsCjeCxC.FieldByName('CJAAAA').AsString;
      DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := DMCXP.cdsDetCjeClie.FieldByName('CUENTAID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   := DMCXP.cdsDetCjeClie.FieldByName('CUENTAID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := DMCXP.cdsDetCjeClie.FieldByName('CLAUXCLIE').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsDetCjeClie.FieldByName('CLIEID').AsString;
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsDetCjeClie.FieldByName('DOCID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := DMCXP.cdsDetCjeClie.FieldByName('DCJSERIE').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsDetCjeClie.FieldByName('DCJNODOC').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := 'Compensaciòn';
      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := 'H';
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsCjeCxC.FieldByName('CJTCAM').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := DMCXP.cdsCjeCxC.FieldByName('TMONID').AsString;

      if DMCXP.cdsCjeCxC.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
         DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsDetCjeClie.FieldByName('DCJMOEXT').AsFloat
      else begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsDetCjeClie.FieldByName('DCJMOLOC').AsFloat;
      end;

      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat   := DMCXP.cdsDetCjeClie.FieldByName('DCJMOLOC').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat   := DMCXP.cdsDetCjeClie.FieldByName('DCJMOEXT').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime := DMCXP.cdsCjeCxC.FieldByName('CJFCMPRB').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:= DMCXP.cdsCjeCxC.FieldByName('CJFCMPRB').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString  := 'P';
      DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString     := DMCXP.cdsCjeCxC.FieldByName('CJMM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString     := DMCXP.cdsCjeCxC.FieldByName('CJDD').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString    := DMCXP.cdsCjeCxC.FieldByName('CJTRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString    := DMCXP.cdsCjeCxC.FieldByName('CJSEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString     := DMCXP.cdsCjeCxC.FieldByName('CJSS').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString  := DMCXP.cdsCjeCxC.FieldByName('CJAATRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString  := DMCXP.cdsCjeCxC.FieldByName('CJAASEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString   := DMCXP.cdsCjeCxC.FieldByName('CJAASS').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString   := DMCXP.wUsuario;
      DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime := Date;
      DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime := time;
      DMCXP.CdsDetCxP.fieldbyname('TIPDET').Asstring    := 'TO';
      cdsPost( DMCXP.cdsDetCxP );

      DMCXP.cdsDetCjeClie.Next;
   end;

   DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DetCxP' );

end;

procedure TFCanjeCxC.ppDetailBand2BeforePrint(Sender: TObject);
begin
	pplblFecEmision.Caption := DMCXP.CdsCxP.Fieldbyname('CNTFEMIS').AsString;
end;

procedure TFCanjeCxC.meNoRegExit(Sender: TObject);
begin
   if DMCXP.BuscaCxP310( dblcCia.text,dblcTDiario.Text, DMCXP.cdsCjeCxC.FieldByname('CJANOMES').Asstring,
                   meNoreg.text, DMCXP.cdsCjeCxC.FieldByname('CJCANJE').Asstring ) then begin
      ShowMessage('Error : Comprobante Duplicado Verificar');
      meNoReg.SetFocus;
   end;
end;

procedure TFCanjeCxC.bbtnRegresaClick(Sender: TObject);
begin
   If DMCXP.wAdmin='G' then Exit;

   EstadoDeForma(0,DMCXP.cdsCjeCxC.fieldbyname('CJEstado').AsString,DMCXP.cdsCjeCxC.fieldbyname('CJ_Conta').AsString );

   xRegresa := true;
end;

procedure TFCanjeCxC.pprPreviewPreviewFormCreate(Sender: TObject);
begin
  pprPreview.PreviewForm.ClientHeight := 500;
  pprPreview.PreviewForm.ClientWidth := 700;			// ppViewr
  tppviewer(pprPreview.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFCanjeCxC.FormShow(Sender: TObject);
var
   xWhere : String;
begin
  DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );

//Temporalmente hasta que se cree filtro
  DMCXP.cdsQRY2.ProviderName := 'prvEjecuta';
  xCrea       := True;

  // Si El Password es del Administrador
  If DMCXP.wAdmin='G' then
  begin
  	DMCXP.wModo := 'C';
  end;

  if DMCXP.wModo='A' then
  begin
  	DMCXP.cdsCjeCxC.Insert;
    DMCXP.cdsCjeCxC.FieldByName('TDIARID').AsString:=DMCXP.cdsQry6.FieldByname('TDIARID').Asstring;
    edtTDiario.Text:=DMCXP.cdsQry6.FieldByname('TDIARDES').Asstring;
    IniciaForma;
    EstadoDeForma( 0, ' ', ' ' );
    dblcCia.SetFocus;
  end
  else
  begin
  	xFlagGr          := False;
    DMCXP.cdsCjeCxC.Edit;
    edtCia.Text    := DMCXP.DisplayDescrip('TGE101','CIADES','CIAID',dblcCia.Text);

  	xWhere:='CLAUXID='''+dblcPrAux.Text+''' and CLIEID='''+dblcdClie.Text+'''';
		edtClie.Text:=BuscaQry('dspTGE','TGE204','CLIEID, CLIERUC, CLIEDES',xWhere,'CLIEDES');
    //edtClie.text   := DMCXP.DisplayDescrip('TGE204','CLIEDES','CLIEID',dblcdClie.Text);

  	xWhere:='ClAuxId='''+dblcClAux.Text+''' and PROV='''+dblcdProv.Text+'''';
		edtProv.Text:=BuscaQry('dspTGE','TGE201','PROV,PROVRUC,PROVDES',xWhere,'PROVDES');
    //edtProv.Text   := DMCXP.DisplayDescrip('TGE201','PROVDES','PROV',dblcdProv.Text);

    edtTMon.Text   := DMCXP.DisplayDescrip('TGE103','TMONDES', 'TMONID', dblcTMon.Text);
    edtTDiario.Text:= DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);
    xAnomes := DMCXP.cdsCjeCxC.FieldByName('CJANOMES').AsString;
    If DMCXP.cdsCjeCxC.fieldbyname('CjEstado').AsString='I' then
    	EstadoDeForma(0,DMCXP.cdsCjeCxC.fieldbyname('CjEstado').AsString,' ')
    else
    	EstadoDeForma(1,DMCXP.cdsCjeCxC.fieldbyname('CjEstado').AsString,DMCXP.cdsCjeCxC.fieldbyname('Cj_conta').AsString );

    FiltraCanje;
  end;
  Inicializafooter;
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

  xCrea     := False;
end;

procedure TFCanjeCxC.FormCreate(Sender: TObject);
var
   xSQL : String;
begin
   DMCXP.cdsCxP.IndexFieldNames:='';
   xSQL:='select * From TGE104 Where REGISTRO=''R''';
   DMCXP.cdsQry6.Close;
   DMCXP.cdsQry6.DataRequest(xSQL);
   DMCXP.cdsQry6.Open;

   CargaDataSource;

end;

procedure TFCanjeCxC.CargaDataSource;
begin
   dblcCia.DataSource        :=DMCXP.dsCjeCxC;
   dblcCia.LookupTable       :=DMCXP.cdsCia;
   dbeNReg.DataSource        :=DMCXP.dsCjeCxC;
   dtpFEmis.DataSource       :=DMCXP.dsCjeCxC;
   dblcTMon.DataSource       :=DMCXP.dsCjeCxC;
   dblcTMon.LookupTable      :=DMCXP.cdsTMon;
   dbeTCambio.DataSource     :=DMCXP.dsCjeCxC;
   dblcTDiario.DataSource    :=DMCXP.dsCjeCxC;
   dblcTDiario.LookupTable   :=DMCXP.cdsTDiario;
   dblcClAux.DataSource      :=DMCXP.dsCjeCxC;
   dblcClAux.LookupTable     :=DMCXP.cdsClAux;
   dblcdProv.DataSource      :=DMCXP.dsCjeCxC;
   dblcdProv.LookupTable     :=DMCXP.cdsProv;
   dblcdProvRuc.DataSource   :=DMCXP.dsCjeCxC;
   dblcdProvRuc.LookupTable  :=DMCXP.cdsProv;
   dblcPrAux.DataSource      :=DMCXP.dsCjeCxC;
   dblcPrAux.LookupTable     :=DMCXP.cdsClAux;
   dblcdClie.DataSource      :=DMCXP.dsCjeCxC;
   dblcdClie.LookupTable     :=DMCXP.cdsQry2;
   dblcdClieRuc.DataSource   :=DMCXP.dsCjeCxC;
   dblcdClieRuc.LookupTable  :=DMCXP.cdsQry2;
   meNoReg.DataSource        :=DMCXP.dsCjeCxC;

   dbgDocCanjeProv.DataSource:=DMCXP.dsDetCjeProv;
   dbgDocCanjeClie.DataSource:=DMCXP.dsDetCjeClie;
end;


end.

