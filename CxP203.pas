unit CxP203;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, wwdbdatetimepicker, Mask, wwdbedit, wwdblook, Wwdbdlg,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBGrids, DB, wwSpeedButton,
  wwDBNavigator, ComCtrls, jpeg, Tabnotbk, wwclient, ppDB, ppDBPipe, ppVar,
  ppCtrls, ppBands, ppClass, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, ppViewr, ppTypes, Variants, oaVariables;

type
  TFLetras = class(TForm)
		pnlPie: TPanel;
    Z2bbtnGraba: TBitBtn;
    Z2bbtnContab: TBitBtn;
    Z2bbtnAnula: TBitBtn;
    pnlDetalle: TPanel;
    tnbDetalle: TTabbedNotebook;
    pnlPendientes: TPanel;
    Label6: TLabel;
    dbgPendientes: TwwDBGrid;
    pnlDocCanje: TPanel;
    Label5: TLabel;
    dbgDocCanje: TwwDBGrid;
    pnlLetras: TPanel;
    Label14: TLabel;
    dbgLetras: TwwDBGrid;
    bbtnRegresa: TBitBtn;
    bbtnCancela: TBitBtn;
    Z2bbtnNuevo: TBitBtn;
    Z2bbtnAcepta: TBitBtn;
    Label8: TLabel;
    pnlCabecera: TPanel;
    pnlCab2: TPanel;
    lblTDoc: TLabel;
    lblTDiario: TLabel;
    lblFCanje: TLabel;
    lblFRecep: TLabel;
    lblTMon: TLabel;
    lblTCambio: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    lblCnpEgr: TLabel;
    Label13: TLabel;
    lblGlosa: TLabel;
    dblcTDoc: TwwDBLookupCombo;
    edtTDoc: TEdit;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    dbdtpFEmis: TwwDBDateTimePicker;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    dbeTCLet: TwwDBEdit;
    dbdtpFComp: TwwDBDateTimePicker;
    dbeLote: TwwDBEdit;
    dblcdCnpEgr: TwwDBLookupComboDlg;
    dbeCuenta: TwwDBEdit;
    dbeGlosa: TwwDBEdit;
    bbtnOk: TBitBtn;
    bbtnBorra: TBitBtn;
    pnlCab1: TPanel;
    Label1: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Label2: TLabel;
    edtCanje: TwwDBEdit;
    dblcdProv: TwwDBLookupComboDlg;
    Label3: TLabel;
    Label4: TLabel;
    dblcdProvRuc: TwwDBLookupComboDlg;
    edtProv: TEdit;
    pnlEstado: TPanel;
    lblAnula: TLabel;
    lblActivo: TLabel;
    lblContab: TLabel;
    lblAcepta: TLabel;
    Label9: TLabel;
    btnActReg: TwwIButton;
    pnlRegistro: TPanel;
    dbeNoReg: TwwDBEdit;
    dbeLetra: TwwDBEdit;
    dbdtpFVcmto: TwwDBDateTimePicker;
    dbeImporte: TwwDBEdit;
    lblTipReg: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    bbtnRegOk: TBitBtn;
    bbtnRegCanc: TBitBtn;
    bbtnCalc: TBitBtn;
    bbtnSumat: TBitBtn;
    edtFinal: TEdit;
    Label17: TLabel;
    dtpFRecep: TwwDBDateTimePicker;
    Label18: TLabel;
    dblcdPresup: TwwDBLookupComboDlg;
    Label19: TLabel;
    Z2bbtnPreview: TBitBtn;
    dblcClAux: TwwDBLookupCombo;
    ppdbpPreview: TppDBPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    ppField7: TppField;
    ppField8: TppField;
    ppField9: TppField;
    ppField10: TppField;
    ppField11: TppField;
    ppField12: TppField;
    ppField13: TppField;
    ppField14: TppField;
    ppField15: TppField;
    ppField16: TppField;
    ppField17: TppField;
    ppField18: TppField;
    ppField19: TppField;
    ppField20: TppField;
    ppField21: TppField;
    ppField22: TppField;
    ppField23: TppField;
    ppField24: TppField;
    ppField25: TppField;
    ppField26: TppField;
    ppField27: TppField;
    ppField28: TppField;
    ppField29: TppField;
    ppField30: TppField;
    ppField31: TppField;
    ppField32: TppField;
    ppField33: TppField;
    ppField34: TppField;
    ppField35: TppField;
    ppField36: TppField;
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
    Button1: TButton;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCanjeExit(Sender: TObject);
    procedure dbgPendientesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDocCanjeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgDocCanjeEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDocCanjeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bbtnBasuraDragOver(Sender, Source: TObject; X, Y: Integer;
			State: TDragState; var Accept: Boolean);
    procedure bbtnOkClick(Sender: TObject);
    procedure dbgPendientesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure BitBtn3DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure bbtnSumatClick(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure bbtnCalcClick(Sender: TObject);
    procedure dblcdCnpEgrExit(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure DetCxPUsuario;
    procedure DetCxP2Usuario;
    procedure InicializaDatos;
    procedure InicializaPaneles;
    procedure InicializaClientDataSet;
    procedure bbtnCancelaClick(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dbgDocCanjeColExit(Sender: TObject);
    Procedure GrabaDetCanje;
    Procedure GrabaRegCxP305;
    procedure dbdtpFEmisExit(Sender: TObject);
    procedure Z2bbtnContabClick(Sender: TObject);
    procedure dbgLetrasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure InicializaPies;
    procedure BloqueaCampos;
    Procedure FiltraCanje;
    procedure InicializaCampos;
    procedure InicializaCamposSiNoExiste;
    procedure dbeTCLetExit(Sender: TObject);
    procedure bbtnBorraClick(Sender: TObject);
    procedure bbtnRegresaClick(Sender: TObject);
    procedure Z2bbtnNuevoClick(Sender: TObject);
    procedure Z2bbtnAnulaClick(Sender: TObject);
    procedure ActualizaSaldosMovCxP;
    procedure ActualizaPagadoMovCxP;
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure tnbDetalleChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcdProvExit(Sender: TObject);
    procedure dblcdProvRucExit(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure btnActRegClick(Sender: TObject);
    procedure bbtnRegOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnRegCancClick(Sender: TObject);
    procedure dbgLetrasDblClick(Sender: TObject);
    procedure dbgLetrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrabaContabilidadDocumentos;
    procedure GrabaContabilidadLetra;
    procedure GeneraDiferenciaCambio;
    procedure GrabaDiferenciaCambio;
    procedure dbgDocCanjeCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgDocCanjeKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnRegresaEnter(Sender: TObject);
    procedure IniciaForma(xModo : String ); // A=Adic, M=Mod, C=Cons
    procedure EstadoDePanel( xxModo : String );
    procedure EstadoDeForma(xxModo:Integer; xMovEstado,xMovConta:String);
    procedure FormCreate(Sender: TObject);
    procedure dblcdPresupExit(Sender: TObject);
    procedure dblcdProvEnter(Sender: TObject);
    procedure dblcdProvRucEnter(Sender: TObject);
    procedure dblcClAuxExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcSituaExit(Sender: TObject);
    procedure Z2bbtnPreviewClick(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure pprPreviewPreviewFormCreate(Sender: TObject);
    procedure CalculaRetencionIGV;
    //CIM 21/06/2002
    procedure GrabaContabilidadRetencion;
    procedure Button1Click(Sender: TObject);
    procedure GeneraDetalleRetencion;
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcClAuxNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcTDocNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcTDiarioNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcTMonNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
  private
		{ Private declarations }
    xDescrip : string;
    xNCL,xNCE : Double;
    xAnoMes : String;
    numreg  : iNTEGER;
    xxTCamDol : double;
    procedure CargaDataSource;
  public
    { Public declarations }
    xTipoProv    : String;
    Function VerificaTotal:Boolean;
    Function GeneraAsientoCanje:Boolean;
    Function AsientoCuadra:Boolean;
    Function ValidaCabecera: Boolean;
    Function ExisteMovCxP(xxCia,xxTDiario,xxAAMM,xxNoReg:String):Boolean;
    Function ExisteLetras(xxCia,xxTCanje,xxCanje:String):Boolean;
    Function VerificaDocumentosPendientes:Boolean;
    Function LetrasAceptadas:Boolean;
  end;

  procedure OPLetras; stdcall;

exports
  OPLetras;

var
   FLetras   : TFLetras;
   xSQL      : String;
   xTAutoNum,xTAno,xTMes : String;
   xGlosa, xLote, xCuenta, xPresup, xConcepto, xCtaDif, xGloDif, xDH : String;
   xDifCam, xPagAnt, xDifCLoc, xDifCExt : double;
   xRetIGV, xxTCambio : double;
   xCrea     : Boolean;
   TemMovCxP : TwwClientDataSet;
   xConta,xCptoRet,xCtaRet    : string;
   //cim 03/07/2002
   xPagoParc : boolean;
   //cim 02/09/2002
   xTotPago : double;

implementation

Uses CxPDM, CxP001, CxP223;

{$R *.DFM}

procedure OPLetras;
var
   xSQL : String;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if not FVariables.w_OP_Registro then
   begin
      xSQL:='Select * from CXP308 Where CIAID=''ZZ'' AND TCANJEID=''ZZ''';
      DMCXP.cdsCCanje.Close;
      DMCXP.cdsCCanje.DataRequest( xSQL );
      DMCXP.cdsCCanje.Open;
      DMCXP.wModo :='A';
      FLetras := TFLetras.Create( Application );
      FLetras.xTipoProv :='L';
      FVariables.w_OP_Registro:=True;
      FLetras.ActiveMDIChild;
      FVariables.ConfiguraForma( Screen.ActiveForm );
   end
   else
   begin
      ShowMessage( 'Opcion en USO' );
   end
end;


procedure TFLetras.dblcdProvExit(Sender: TObject);
var
   xWhere : String;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if dblcClAux.Focused then Exit;
   if Length(dblcClAux.Text)=0 then begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Falta Ingresar Clase de Auxiliar');
   end;

   if length(dblcdProv.Text)>0 then
   begin
       if DMCXP.wAnchoProv > 0 then
       begin
         if Length(dblcdProv.Text) < DMCXP.wAnchoProv then
         begin
           dblcdProv.Text:=StrZero(dblcdProv.Text, DMCXP.wAnchoProv);
         end;
       end;

       xWhere:='ClAuxId='''+dblcClAux.Text+''' and Prov='''+dblcdProv.Text+''' and NVL(ACTIVO,''N'')=''S''';
       edtProv.Text:=BuscaQry('dspTGE','TGE201','PROV,PROVRUC,PROVDES',xWhere,'PROVDES');

       if length(edtProv.Text)=0 then
       begin
          dblcdProv.Text:='';
          dblcdProvRuc.Text:='';
          dblcdProv.SetFocus;
          Raise Exception.Create('Proveedor no existe');
       end;
       dblcdProvRuc.Text:=DMCXP.cdsULTTGE.FieldByName('ProvRuc').AsString;
       DMCXP.cdsCCanje.fieldbyname('PROVRUC').AsString  := dblcdProvRuc.Text;
       DMCXP.cdsCCanje.fieldbyname('PROVDES').AsString  := edtProv.Text;
       DMCXP.cdsCCanje.fieldbyname('CJESTADO').AsString := 'T';

       DMCXP.cdsCCanje.Post;
       DMCXP.AplicaDatos( DMCXP.cdsCCanje, 'CCanje'  );

      EstadoDeForma( 0, DMCXP.cdsCCanje.fieldbyname('CJEstado').AsString, ' ' );

       if not dblcTDoc.enabled then
          dblcTDoc.enabled:=True;
       pnlcab2.enabled:=True;
       dblcTDoc.SetFocus;
   end
   else begin
      edtProv.Text:='';
      dblcdProvRuc.SetFocus;
   end;
end;

procedure TFLetras.EstadoDeForma(xxModo:Integer; xMovEstado,xMovConta:String);
begin
   pnlCab1.Enabled      := False;
   pnlCab2.Enabled      := False;
   dblcTDoc.Enabled     := False;
   dblcTDiario.Enabled  := False;
   dbdtpFComp.Enabled   := False;

   bbtnOK.Enabled       := False;
   bbtnBorra.Enabled    := False;

   pnlDetalle.Enabled     := False;
   dbgPendientes.Enabled  := False;
   dbgDocCanje.Enabled    := False;
   dbgLetras.Enabled      := False;
   dbgPendientes.ReadOnly := True;
   dbgDocCanje.ReadOnly   := True;
   dbgLetras.ReadOnly     := True;
   btnActReg.Enabled      := False;
   pnlRegistro.Visible    := False;

   pnlPie.Refresh;
   pnlPie.Enabled       := False;
   bbtnRegresa.Enabled  := False;
   bbtnCancela.Enabled  := False;
   Z2bbtnGraba.Enabled  := False;
   Z2bbtnAcepta.Enabled := False;
   Z2bbtnAnula.Enabled  := False;
//   Z2bbtnImprime.Enabled:= False;
   Z2bbtnContab.Enabled := False;
   Z2bbtnNuevo.Enabled  := False;
   Z2bbtnPreview.Enabled:= False;

   lblActivo.Visible    := False;
   lblAcepta.Visible    := False;
   lblAnula.Visible     := False;
   lblContab.Visible    := False;

   If xxModo=0 then
   begin
      If xMovEstado=' ' then
      begin
            pnlCab1.Enabled    := True;
            pnlCab2.Enabled    := True;
            dblcTDoc.Enabled   := True;
            dblcTDiario.Enabled:= True;
            dbdtpFComp.Enabled := True;
            bbtnOK.Enabled     := True;
            bbtnBorra.Enabled  := True;

            lblActivo.Visible  := False;

            dblcCia.SetFocus;
      end;

      If xMovEstado='T' then
      begin
         pnlCab2.Enabled    := True;
         dblcTDoc.Enabled   := True;
         dblcTDiario.Enabled:= True;
         dbdtpFComp.Enabled   := True;
         bbtnOK.Enabled     := True;
         bbtnBorra.Enabled  := True;

         lblActivo.Visible  := False;
         dblcTDoc.SetFocus;
      end;


      If xMovEstado='I' then
      begin
         pnlCab2.Enabled    := True;
         bbtnOK.Enabled     := True;
         bbtnBorra.Enabled  := True;

         lblActivo.Visible  := True;

         dbeGlosa.SetFocus;
      end;
      If xMovEstado='X' then
      begin
         pnlCab1.Enabled     := True;
         dblcClAux.Enabled   := True;
         dblcdProv.Enabled   := True;
         dblcdProvRuc.Enabled:= True;
         bbtnOK.Enabled      := True;
         bbtnBorra.Enabled   := True;
      end;
   end
   else begin

      If xMovConta='S' then
      begin
         pnlDetalle.Enabled   := True;
         pnlPie.Enabled       := True;
         dbgDocCanje.Enabled  := True;
         dbgLetras.Enabled    := True;

         lblContab.Visible    := True;
         Z2bbtnPreview.Enabled:= True;
      end
      else begin

         If xMovEstado='T' then
         begin
            pnlDetalle.Enabled    := True;
            dbgPendientes.Enabled := True;
            dbgDocCanje.Enabled   := True;
            dbgLetras.Enabled     := True;
            dbgPendientes.ReadOnly:= False;
            dbgDocCanje.ReadOnly  := False;
            dbgLetras.ReadOnly    := False;
            btnActReg.Enabled     := True;
            //CIM 07/06/2002
            pnlPendientes.Enabled := true;
            pnlDocCanje.Enabled   := true;
            pnlLetras.Enabled     := true;
            //*

            pnlPie.Enabled       := True;
            bbtnRegresa.Enabled  := True;
            bbtnCancela.Enabled  := True;
            Z2bbtnGraba.Enabled  := True;
            lblActivo.Visible    := True;
         end;

         If xMovEstado='I' then
         begin
           pnlDetalle.Enabled     := True;
           dbgPendientes.Enabled  := True;
           dbgDocCanje.Enabled    := True;
           dbgLetras.Enabled      := True;
           dbgPendientes.ReadOnly := False;
           dbgDocCanje.ReadOnly   := False;
           dbgLetras.ReadOnly     := False;
           btnActReg.Enabled      := True;


           pnlPie.Enabled       := True;
           bbtnRegresa.Enabled  := True;
           bbtnCancela.Enabled  := True;
           Z2bbtnGraba.Enabled  := True;
           Z2bbtnAcepta.Enabled := True;
           Z2bbtnAnula.Enabled  := True;
           Z2bbtnPreview.Enabled:= True;
           Z2bbtnNuevo.Enabled  := True;

           lblActivo.Visible    := True;
         end;

         If (xMovEstado='P') or (xMovEstado='C') then
         begin
               pnlDetalle.Enabled   := True;
               dbgDocCanje.Enabled  := True;
               dbgLetras.Enabled    := True;

               pnlPie.Enabled       := True;
               Z2bbtnPreview.Enabled:= True;
   //                Z2bbtnImprime.Enabled:= True;
               if xConta<>'N' then Z2bbtnContab.Enabled:=True;

               lblAcepta.Visible    := True;
               Z2bbtnNuevo.Enabled  := True;
         end;

         If xMovEstado='A' then
         begin // Anulado
            pnlDetalle.Enabled    := True;

            dbgDocCanje.Enabled  := True;
            dbgLetras.Enabled    := True;

            pnlPie.Enabled       := True;
            lblAnula.Visible     := True;
         end;
      end;
   end;

   if DMCXP.wModo='C' then begin // Si Entra Solo Para Consulta
      pnlCab1.Enabled      := False;
      pnlCab2.Enabled      := False;

      bbtnOK.Enabled       := False;
      bbtnBorra.Enabled    := False;

      dbgPendientes.Enabled  := False;
      dbgDocCanje.Enabled    := False;
      dbgLetras.Enabled      := False;
      dbgPendientes.ReadOnly := True;
      dbgDocCanje.ReadOnly   := True;
      dbgLetras.ReadOnly     := True;
      btnActReg.Enabled      := False;

      pnlPie.Refresh;
      pnlPie.Enabled       := False;
      bbtnRegresa.Enabled  := False;
      bbtnCancela.Enabled  := False;
      Z2bbtnGraba.Enabled  := False;
      Z2bbtnAcepta.Enabled := False;
      Z2bbtnAnula.Enabled  := False;
      Z2bbtnPreview.Enabled:= False;
//      Z2bbtnImprime.Enabled:= False;
      Z2bbtnContab.Enabled := False;
      Z2bbtnNuevo.Enabled  := False;
   end;
end;


procedure TFLetras.IniciaForma(xModo : String ); // A=Adic, M=Mod, C=Cons
begin

   if xModo='A' then
    begin
//      DMCXP.cdsMovCxP2.Insert;
      InicializaClientDataSet;
      InicializaPaneles;
      InicializaPies;
      InicializaDatos;
      InicializaCampos;
    end
   else
    begin
      if xModo='M' then
       begin
         dblcCia.Text    := DMCXP.cdsMoVCxP2.FieldByName('CIAID').AsString;
         edtCanje.Text   := DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString;
         dblcdProv.Text  := DMCXP.cdsMovCxP2.FieldByName('PROV').AsString;
         edtCia.Text     := DMCXP.DisplayDescrip('TGE101','CIADES','CIAID',dblcCia.Text);
         edtProv.text    := DMCXP.DisplayDescrip('TGE201','PROVDES','PROVRUC',dblcdProvRuc.Text);
         dblcTDoc.Text   := DMCXP.cdsDetCxP.FieldByName('DOCID').AsString;
         dblcTDiario.Text:= DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString;
         edtTDoc.Text    := DMCXP.DisplayDescrip('TGE110','DOCDES',  'DOCID',  dblcTDoc.Text);
         edtTDiario.Text := DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);
         edtTMon.Text    := DMCXP.DisplayDescrip('TGE103','TMONDES', 'TMONID', dblcTMon.Text);
         end
       else
        begin
         dblcCia.Text    := DMCXP.cdsMoVCxP2.FieldByName('CIAID').AsString;
         edtCanje.Text   := DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString;
         dblcdProv.Text  := DMCXP.cdsMovCxP2.FieldByName('PROV').AsString;
         edtCia.Text     := DMCXP.DisplayDescrip('TGE101','CIADES','CIAID',dblcCia.Text);
         edtProv.text    := DMCXP.DisplayDescrip('TGE201','PROVDES','PROVRUC',dblcdProvRuc.Text);
         dblcTDoc.Text   := DMCXP.cdsDetCxP.FieldByName('DOCID').AsString;
         dblcTDiario.Text:= DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString;
         edtTDoc.Text    := DMCXP.DisplayDescrip('TGE110','DOCDES',  'DOCID',  dblcTDoc.Text);
         edtTDiario.Text := DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);
         edtTMon.Text    := DMCXP.DisplayDescrip('TGE103','TMONDES', 'TMONID', dblcTMon.Text);
       end;
      FiltraCanje;
   end;
end;

procedure TFLetras.EstadoDePanel( xxModo : String );
begin
   pnlPendientes.Enabled := False;
   pnlDocCanje.Enabled   := False;
   pnlLetras.Enabled     := False;
   dbgPendientes.ReadOnly:= True;
   dbgDocCanje.ReadOnly  := True;
   dbgLetras.ReadOnly    := True;

   if xxModo=' ' then begin // Adiciona
      pnlCabecera.Enabled:= True;
      pnlCab1.Enabled    := True;
      pnlCab2.Enabled    := True;

      bbtnOK.Enabled     := True;
      bbtnBorra.Enabled  := True;

      pnlDetalle.Enabled    := False;
      dbgPendientes.ReadOnly:= False;
      dbgDocCanje.ReadOnly  := False;
      dbgLetras.ReadOnly    := False;
      pnlPie.Enabled        := False;
      end
   else begin
      if xxModo='I' then begin
         pnlCabecera.Enabled  := True;
         pnlCab1.Enabled      := False;
         pnlCab2.Enabled      := True;

         bbtnOK.Enabled      := True;
         bbtnBorra.Enabled   := True;

         pnlPendientes.Enabled := True;
         pnlDocCanje.Enabled   := True;
         pnlLetras.Enabled     := True;
         pnlDetalle.Enabled    := True;
         dbgPendientes.ReadOnly:= False;
         dbgDocCanje.ReadOnly  := False;
         dbgLetras.ReadOnly    := False;

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

               pnlDetalle.Enabled    := True;
               pnlPendientes.Enabled := True;
               pnlDocCanje.Enabled   := True;
               pnlLetras.Enabled     := True;
               dbgPendientes.ReadOnly:= False;
               dbgDocCanje.ReadOnly  := False;
               dbgLetras.ReadOnly    := False;
               pnlPie.Enabled        := True;
            end;
         end;
      end;
   end;
end;

procedure TFLetras.InicializaPies;
begin

   dbgDocCanje.ColumnByName('CPNoDoc').FooterValue :='Totales';
   dbgDocCanje.ColumnByName('CPSalLoc').FooterValue:='';
   dbgDocCanje.ColumnByName('CPSalExt').FooterValue:='';
   dbgDocCanje.ColumnByName('CCPMoLoc').FooterValue:='';
   dbgDocCanje.ColumnByName('CCPMoExt').FooterValue:='';

   dbgLetras.ColumnByName('CPNoDoc').FooterValue :='Totales';
//   dbgLetras.ColumnByName('lkTMonID').FooterValue:=DMCXP.cdsLetras.FieldByName('TMONID').AsString;
   dbgLetras.ColumnByName('CPMtoOri').FooterValue:='';
   dbgLetras.ColumnByName('CPMtoLoc').FooterValue:='';
   dbgLetras.ColumnByName('CPMtoExt').FooterValue:='';

end;

procedure TFLetras.InicializaDatos;
begin
   dblcdProvRuc.Text :='';
   dblcdProv.Text    :='';
   dtpFRecep.Date    := date;
   dbdtpFEmis.Date   := date;
   dblcTMon.Text     := '';
   edtTMon.Text      := '';
   dbeTCLet.Text     := '';
   dbeLote.Text      := '';
   dbdtpFComp.Date   := date;
   dbeCuenta.Text    := '';
   dbeGlosa.Text     := '';
   edtProv.Text      := '';
   dblcCia.Text      := '';
   edtCia.Text       := '';
   edtCanje.Text     := '';
   dblcTDoc.Text     := '';
   edtTDoc.Text      := '';
   dblcTDiario.Text  := '';
   edtTDiario.Text   := '';
end;

procedure TFLetras.InicializaPaneles;
begin
   // Inicializa Paneles
   pnlCabecera.Enabled   := True;
   pnlPendientes.Enabled := False;
   pnlDocCanje.Enabled   := False;
   pnlLetras.Enabled     := False;
   tnbDetalle.PageIndex  := 0;
end;


procedure TFLetras.BloqueaCampos;
begin
   dblcCia.Enabled      := False;
   edtCanje.Enabled     := False;
   dblcdProv.Enabled    := False;
   dblcdProvRuc.Enabled := False;
   dblcTDoc.Enabled     := False;
   dblcTDiario.Enabled  := False;
   dbdtpFComp.Enabled   := False;
end;

procedure TFLetras.InicializaCampos;
begin
   dblcCia.Enabled       := True;
   edtCanje.Enabled      := True;
   dblcdProv.Enabled     := False;
   dblcdProvRuc.Enabled  := False;
   dblcTDoc.Enabled      := False;
   dblcTDiario.Enabled   := False;
	 dbdtpFEmis.Enabled    := True;
	 dtpFRecep.Enabled     := True;
   dblcTMon.Enabled      := True;
	 dbeTCLet.Enabled      := True;
	 dbdtpFComp.Enabled    := True;
	 dbeLote.Enabled       := True;
	 dblcdCnpEgr.Enabled   := True;
   dbeGlosa.Enabled      := True;
   dblcCia.SetFocus;
end;


procedure TFLetras.InicializaCamposSiNoExiste;
begin
   dblcCia.Enabled      := False;
   edtCanje.Enabled     := False;
   dblcdProv.Enabled    := True;
   dblcdProvRuc.Enabled := True;
   dblcTDoc.Enabled     := True;
   dblcTDiario.Enabled  := True;
   dbdtpFEmis.Enabled   := True;
   dtpFRecep.Enabled    := True;
   dblcTMon.Enabled     := True;

   // Reglas de Negocio
   if DMCXP.wVRN_TCambioFijo='N' then
      dbeTCLet.Enabled:=True
   else begin
      dbeTCLet.Enabled:=False;
   end;

   dbdtpFComp.Enabled   := True;
   dbeLote.Enabled      := True;
   dblcdCnpEgr.Enabled  := True;
   dblcdCnpEgr.rEADoNLY := fALSE;
   dbeGlosa.Enabled     := True;
end;



procedure TFLetras.InicializaClientDataSet;
begin
   Filtracds( DMCXP.cdsDetCanje,'Select * from CXP305 Where CIAID=''''' );
   // Filtra Tipos de documentos aptos para guardar como Provisión
   Filtracds( DMCXP.cdsDetCxP,'Select * from CXP302 Where CIAID=''''' );
   // Documentos Pendientes
   Filtracds( DMCXP.cdsMovCxP,'Select * from CXP301 Where CIAID=''''' );
   // Documentos Seleccionados para Canje
   Filtracds( DMCXP.cdsCanje, 'Select * from CXP304 Where CIAID=''''' );
   // Documentos Seleccionados para Canje
   Filtracds( DMCXP.cdsLetras,'Select * from CXP301 Where CIAID=''''' );

   DMCXP.cdsTDoc.Filtered:=true;

end;

procedure TFLetras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // Cancela todas las modificaciones en los cds.

   DMCXP.cdsLetras.CancelUpdates;
   DMCXP.cdsDetCxP.CancelUpdates;
   DMCXP.cdsMovCxP.CancelUpdates;
   DMCXP.cdsCanje.CancelUpdates;
   DMCXP.cdsDetCanje.CancelUpdates;
//   DMCXP.cdsDetRet.CancelUpdates;

   If ( DMCXP.cdsCanje.RecordCount=0 ) and (DMCXP.cdsLetras.RecordCount=0) then begin
      if ( DMCXP.cdsCCanje.fieldbyname('CJESTADO').AsString='T' ) OR
         ( DMCXP.cdsCCanje.fieldbyname('CJESTADO').AsString='X' ) THEN
      begin
         DMCXP.cdsCCanje.Delete;
         DMCXP.AplicaDatos( DMCXP.cdsCCanje, 'CCanje' );
      end;   

   end;

   DMCXP.cdsCCanje.CancelUpdates;

//   FVariables.ActualizaFiltro( DMCXP.cdsCCanje, FPrincipal.GLetras, DMCXP.wModo );
   if not (FPrincipal.GLetras=nil) then
      FPrincipal.GLetras.RefreshFilter;

   TemMovCxP.Free;

   // Eliminar Filtros
   DMCXP.cdsDetCxP.Filtered := False;
   DMCXP.cdsTDoc.Filtered   := False;
   DMCXP.cdsCanje.Filtered  := False;
   DMCXP.cdsLetras.Filtered := False;
   DMCXP.cdsTMon.Filtered   := False;
   dblcCia.Enabled        := True;
   edtCanje.Enabled       := True;

   FVariables.w_OP_Registro:=False;

   Action:=caFree;
end;

Procedure TFLetras.FiltraCanje;
var
   xFiltro : String;
begin
   if dblcdProv.Text = '' then
      xFiltro := 'CIAID='''+dblcCia.Text+''' AND CLAUXID='''+dblcClAux.Text+''' and (PROV='+quotedstr(dblcdProv.Text)+' AND PROV IS NULL)'
   else
      xFiltro := 'CIAID='''+dblcCia.Text+''' AND CLAUXID='''+dblcClAux.Text+''' and PROV='+quotedstr(dblcdProv.Text);

   Filtracds( DMCXP.cdsMovCxP,'Select * from CXP301 Where '+xFiltro );

   DMCXP.cdsMovCxP.IndexFieldNames  :='CIAID;TDIARID;CPANOMES;CPNOREG';

   DMCXP.cdsMovCxP.Filtered := False;

   DMCXP.cdsMovCxP.Filter   := '( ( CPSALLOC>0 OR CPSALEXT > 0 ) and CPSALORI > 0) AND '+
			     'CPESTADO='+''''+'P'           +''''+' and '+
			     'CPCANJE<>'+''''+edtCanje.Text +''''+' and '+
			     'FLAGVAR<>'+''''+'XX'+'''';

   DMCXP.cdsMovCxP.Filtered := True;

   xFiltro:='CIAID='   +''''+dblcCia.Text +''''+' AND '+
            'TCANJEID='+''''+'LE'         +''''+' AND '+
            'CCPCANJE='+''''+edtCanje.text+'''';
   Filtracds( DMCXP.cdsCanje,'Select * from CXP304 Where '+xFiltro );

   xFiltro := 'CIAID='   +''''+dblcCia.Text +''''+' and '+
              'TCANJEID='+''''+'LE'         +''''+' and '+
              'CCPCANJE='+''''+edtCanje.text+'''';
   Filtracds( DMCXP.cdsDetCanje,'Select * from CXP305 Where '+xFiltro );

   xFiltro := 'CIAID='   +''''+dblcCia.Text +''''+' and '+
              'TCANJEID='+''''+'LE'         +''''+' and '+
              'CPCANJE=' +''''+edtCanje.Text+'''';
   Filtracds( DMCXP.cdsLetras,'Select * from CXP301 Where '+xFiltro );
   //CIM 02/09/2002
   xFiltro :=  ' CIAID='+Quotedstr(dblcCia.text)+
              ' AND PROV='+Quotedstr(dblcdProv.text)+
              ' AND CANJE='+Quotedstr(edtCanje.text);
   Filtracds( DMCXP.cdsDetRet,'Select * from CXP313 Where '+xFiltro );

   //ANAX

   TNumericField(DMCXP.CdsMovCxP.FieldByName('CPMTOORI')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.CdsMovCxP.FieldByName('CPMTOORI')).EditFormat := '########0.00';
   TNumericField(DMCXP.CdsMovCxP.FieldByName('CPSALLOC')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.CdsMovCxP.FieldByName('CPSALLOC')).EditFormat := '########0.00';
   TNumericField(DMCXP.CdsMovCxP.FieldByName('CPSALEXT')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.CdsMovCxP.FieldByName('CPSALEXT')).EditFormat := '########0.00';
   TNumericField(DMCXP.CdsMovCxP.FieldByName('CPTCAMPR')).DisplayFormat := '#,##0.000';
   TNumericField(DMCXP.CdsMovCxP.FieldByName('CPTCAMPR')).EditFormat := '########0.00';

   TNumericField(DMCXP.CdsCanje.FieldByName('CCPMOORI')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.CdsCanje.FieldByName('CCPMOORI')).EditFormat := '########0.00';
   TNumericField(DMCXP.CdsCanje.FieldByName('CPSALORI')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.CdsCanje.FieldByName('CPSALORI')).EditFormat := '########0.00';
   TNumericField(DMCXP.CdsCanje.FieldByName('CPSALLOC')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.CdsCanje.FieldByName('CPSALLOC')).EditFormat := '########0.00';
   TNumericField(DMCXP.CdsCanje.FieldByName('CPSALEXT')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.CdsCanje.FieldByName('CPSALEXT')).EditFormat := '########0.00';
   TNumericField(DMCXP.CdsCanje.FieldByName('CCPMOLOC')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.CdsCanje.FieldByName('CCPMOLOC')).EditFormat := '########0.00';
   TNumericField(DMCXP.CdsCanje.FieldByName('CCPMOEXT')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.CdsCanje.FieldByName('CCPMOEXT')).EditFormat := '########0.00';
   TNumericField(DMCXP.CdsCanje.FieldByName('CCPTCCJE')).DisplayFormat := '#,##0.000';
   TNumericField(DMCXP.CdsCanje.FieldByName('CCPTCCJE')).EditFormat := '########0.00';


   TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOORI')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOORI')).EditFormat := '########0.00';
   TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOLOC')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOLOC')).EditFormat := '########0.00';
   TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOEXT')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOEXT')).EditFormat := '########0.00';


   //FIN DE ANAX
   


end;


procedure TFLetras.edtCanjeExit(Sender: TObject);
begin
	 If xCrea then Exit;

   edtCanje.Text:= StrZero(edtCanje.Text,6);
   If edtCanje.Text='000000' then begin
      edtcanje.SetFocus;
      raise exception.Create('Error :  Falta Registrar Número de Canje');
   end;

   DMCXP.cdsLetras.Filtered := False;

	 If ExisteLetras(dblcCia.Text,'LE',edtCanje.Text) then begin
			edtCanje.SetFocus;
			Raise Exception.Create( 'Canje Ya Existe' )
	 end;

	 DMCXP.cdsCCanje.Insert;
	 DMCXP.cdsCCanje.fieldbyname('CIAID').AsString    := dblcCia.Text;
	 DMCXP.cdsCCanje.fieldbyname('TCANJEID').AsString := 'LE';
	 DMCXP.cdsCCanje.fieldbyname('CANJE').AsString    := edtCanje.Text;
	 DMCXP.cdsCCanje.fieldbyname('CJESTADO').AsString := 'X';
   DMCXP.cdsCCanje.fieldbyname('CJUSER').AsString   := DMCXP.wUsuario;
   DMCXP.cdsCCanje.fieldbyname('CJFREG').Value      := Date;
   DMCXP.cdsCCanje.fieldbyname('CJFHOR').Value      := Time;
   cdsPost( DMCXP.cdsCCanje );

   xSQL := ' Select * From CXP308 WHERE CIAID ='+QuotedStr(dblcCia.Text)
          +' AND TCANJEID ='+QuotedStr('LE')
          +' AND CANJE ='+QuotedStr(edtCanje.Text);
   DMCXP.cdsCCanje.DataRequest( xSQL );

   DMCXP.AplicaDatos( DMCXP.cdsCCanje, 'CCanje'  );

//GAR***************************************************************************
   edtProv.Clear;
   edtTDoc.Clear;
   edtTDiario.Clear;
   edtTMon.Clear;
//GAR***************************************************************************

   // Si No Existe Canje Se Inserta Registro
   {FiltraCanje;      // Filtra cdsCanje, cdsDetCanje, cdsLetras

   DMCXP.cdsDetCxP.Insert;
   DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := dblcCia.Text;
   DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := 'LE';
   DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := edtCanje.Text;
   DMCXP.cdsTDoc.Filtered:=true;
   InicializaCamposSiNoExiste;}
   bbtnSumatClick(Sender);
end;

procedure TFLetras.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgPendientes.BeginDrag(False);
end;

procedure TFLetras.dbgPendientesEndDrag(Sender,Target:TObject; X,Y:Integer);
var
   i: integer;
   xTipReg : String;
begin
   if Target=dbgDocCanje then begin
      with DMCXP do
      begin
         DMCXP.cdsMovCxP.DisableControls;
      // Verifica que Documentos No Esten Pendientes de Actualización
         for i:= 0 to dbgPendientes.SelectedList.Count-1 do
         begin
             dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);
             //** 27/07/2001 -pjsv - cuando es una NC no debe de validar
             If DMCXP.cdsMovCxP.FieldByName('TCANJEID').AsString<> 'NC' then
             //**
             begin
               If cdsMovCxP.FieldByName('TMonID').AsString=wTMonLoc then
                begin
                   If FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoLoc').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat,15,2)<>
                      FRound(DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat,15,2) then
                     begin
                      ShowMessage('Error : Documento esta en Proceso de cancelación');
                      dbgPendientes.SelectedList.clear;
                      DMCXP.cdsMovCxP.First;
                      DMCXP.cdsMovCxP.EnableControls;
											Exit;
                    end;
                end
               else
                begin
                  If FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoExt').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat,15,2)<>
                     FRound(DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat,15,2) then
                   begin
                     ShowMessage('Error : Documento esta en Proceso de cancelación');
                     dbgPendientes.SelectedList.clear;
                     DMCXP.cdsMovCxP.First;
                     DMCXP.cdsMovCxP.EnableControls;
                     Exit;
                   end;
                end;
              end;
         end;//FOR

         ////////////////////////////////

         cdsCanje.DisableControls;
         for i:= 0 to dbgPendientes.SelectedList.Count-1 do
         begin
             dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);
             cdsCanje.SetKey;
             cdsCanje.FieldByName('CIAID').AsString    := DMCXP.cdsMovCxP.FieldByName('CiaID').AsString;
             cdsCanje.FieldByName('TCANJEID').AsString := 'LE';
             cdsCanje.FieldByName('CCPCANJE').AsString := edtCanje.Text;
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
                cdsCanje.FieldByName('CPSERIE').AsString  := cdsMovCxP.FieldByName('CPSERIE').AsString;
                cdsCanje.FieldByName('CPNODOC').AsString  := cdsMovCxP.FieldByName('CPNODOC').AsString;

                cdsCanje.FieldByName('TCANJEID').AsString := 'LE';
                cdsCanje.FieldByName('CCPCANJE').AsString := edtCanje.Text;
                //CIM 13/06/2002                 dbdtpFEmis
//                cdsCanje.FieldByName('CCPFCJE').AsDateTime:= cdsMovCxP.FieldByName('CPFCANJE').AsDateTime;
                cdsCanje.FieldByName('CPFEMIS').AsDateTime:= cdsMovCxP.FieldByName('CPFEMIS').AsDateTime;
                cdsCanje.FieldByName('CCPFCJE').AsDateTime:= dbdtpFEmis.Date;
                cdsCanje.FieldByName('TMONID').AsString   := cdsMovCxP.FieldByName('TMONID').AsString;
                // JORGE
                xTipReg := DMCXP.DisplayDescrip2('dspTGE','TGE110','DOC_FREG,DOCTIPREG','DOCID='+quotedstr(DMCXP.cdsMovCxP.FieldByName('DOCID').AsString),'DOC_FREG');
                if (xTipReg = 'N') or (DMCXP.cdsQry.FieldByName('DOCTIPREG').AsString='NC') then // Nota de CREDITO
                 begin
                  cdsCanje.FieldByName('CCPMOORI').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOORI').AsFloat * -1,15,2);
                  cdsCanje.FieldByName('CCPMOLOC').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat * -1,15,2);
                  cdsCanje.FieldByName('CCPMOEXT').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat * -1,15,2);
                  //** pjsv - acumula los montos de las nostas de credito
                  xNCL := xNCL + cdsCanje.FieldByName('CCPMOLOC').AsFloat;
                  xNCE := xNCE + cdsCanje.FieldByName('CCPMOEXT').AsFloat;
                  //**
                 end
                else
                 begin
                  cdsCanje.FieldByName('CCPMOORI').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoOri').AsFloat,15,2);
                  cdsCanje.FieldByName('CCPMOLOC').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat,15,2);
                  cdsCanje.FieldByName('CCPMOEXT').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat,15,2);
                 end;
                //**
                cdsCanje.FieldByName('CJEANTMN').AsFloat  := 0;
                cdsCanje.FieldByName('CJEANTME').AsFloat  := 0;
//                cdsCanje.FieldByName('CCPTCDOC').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPTCamPr').AsFloat,8,3);
                cdsCanje.FieldByName('CCPTCDOC').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat,8,3);
                cdsCanje.FieldByName('CCPTCCJE').AsFloat  := FRound(strtofloat(dbeTCLet.Text),8,3);

                If wTMonLoc=cdsCanje.FieldByName('TMONID').AsString then begin
                   //CIM 24/06/2002
                   cdsCanje.FieldByName('CPSALORI').AsFloat := FRound( cdsCanje.FieldByName('CCPMOORI').AsFloat,15,2);
                   //*
                   cdsCanje.FieldByName('CPSALLOC').AsFloat := FRound( cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
                   cdsCanje.FieldByName('CPSALEXT').AsFloat := FRound( cdsCanje.FieldByName('CCPMOLOC').AsFloat/cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
                   cdsCanje.FieldByName('CCPMOEXT').AsFloat := FRound( cdsCanje.FieldByName('CCPMOLOC').AsFloat/cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
                end
                else begin
                   //CIM 24/06/2002
                   If wTMonExt=cdsCanje.FieldByName('TMONID').AsString then begin
                      cdsCanje.FieldByName('CPSALORI').AsFloat := FRound( cdsCanje.FieldByName('CCPMOORI').AsFloat,15,2);
                      cdsCanje.FieldByName('CPSALLOC').AsFloat := FRound( cdsCanje.FieldByName('CCPMOEXT').AsFloat*cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
                      cdsCanje.FieldByName('CPSALEXT').AsFloat := FRound( cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2);
                      cdsCanje.FieldByName('CCPMOLOC').AsFloat := FRound( cdsCanje.FieldByName('CCPMOEXT').AsFloat*cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
                   end
                   else
                   begin
                      cdsCanje.FieldByName('CPSALORI').AsFloat := FRound( cdsCanje.FieldByName('CCPMOORI').AsFloat,15,2);
                      cdsCanje.FieldByName('CPSALLOC').AsFloat := FRound( cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2 );
                      cdsCanje.FieldByName('CPSALEXT').AsFloat := FRound( cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2);
//                      cdsCanje.FieldByName('CCPMOLOC').AsFloat := FRound( cdsCanje.FieldByName('CCPMOEXT').AsFloat*cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
                   end
                   //*
                end;

                cdsCanje.FieldByName('CCPESTDO').AsString := 'P';
                cdsCanje.FieldByName('CTATOTAL').AsString := cdsMovCxP.FieldByName('CtaTotal').AsString;
                cdsCanje.FieldByName('CPTOTOT').AsString  := cdsMovCxP.FieldByName('CptoTot').AsString;
                cdsCanje.FieldByName('CPFVCMTO').AsdateTime:= cdsMovCxP.FieldByName('CPFVcmto').AsDateTime;
                cdsCanje.FieldByName('CCPUSER').AsString  := DMCXP.wUsuario;
                cdsCanje.FieldByName('CCPFREG').AsDateTime:= date;
                cdsCanje.FieldByName('CCPHREG').AsDateTime := time;
                cdsCanje.FieldByName('CCPMM').AsString    := cdsMovCxP.FieldByName('CPMM').AsString;
                cdsCanje.FieldByName('CCPDD').AsString    := cdsMovCxP.FieldByName('CPDD').AsString;
                cdsCanje.FieldByName('CCPTRI').AsString   := cdsMovCxP.FieldByName('CPTri').AsString;
                cdsCanje.FieldByName('CCPSEM').AsString   := cdsMovCxP.FieldByName('CPSem').AsString;
                cdsCanje.FieldByName('CCPSS').AsString    := cdsMovCxP.FieldByName('CPSS').AsString;
                cdsCanje.FieldByName('CCPAATRI').AsString := cdsMovCxP.FieldByName('CPAATri').AsString;
                cdsCanje.FieldByName('CCPAASEM').AsString := cdsMovCxP.FieldByName('CPAASem').AsString;
                cdsCanje.FieldByName('CCPAASS').AsString  := cdsMovCxP.FieldByName('CPAASS').AsString;
                cdsPost( DMCXP.cdsCanje );
                cdsMovCxP.Edit;
                cdsMovCxP.FieldByName('FlagVar').AsString := 'XX';
                cdsPost( DMCXP.cdsMovCxP );
             end;
             dbgPendientes.datasource.dataset.Freebookmark(dbgPendientes.SelectedList.items[i]);
         end;
         dbgPendientes.SelectedList.clear;  { Clear selected record list since they are all deleted}
         cdsMovCxP.EnableControls;
         cdsCanje.EnableControls;
         DMCXP.cdsMovCxP.Filtered:=True;
         dbgPendientes.RefreshDisplay;
         bbtnSumatClick(Sender);
      End;
   End;
end;

procedure TFLetras.dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFLetras.dbgDocCanjeEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
   If Target=dbgpendientes Then Begin
      DMCXP.cdsMovCxP.Filtered:=False;
      DMCXP.cdsMovCxP.SetKey;
      DMCXP.cdsMovCxP.FieldByName('CIAID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsCanje.FieldByName('TDIARID').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString := DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsCanje.FieldByName('CPNOREG').AsString;
      if DMCXP.cdsMovCxP.GotoKey then begin
         DMCXP.cdsMovCxP.Edit;
         DMCXP.cdsMovCxP.FieldByName('FLAGVAR').AsString:='';
         If DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then begin
            //** 16/07/2001 - pjsv,
            DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound( DMCXP.cdsMovCxP.FieldByName('CPMtoLoc').AsFloat+DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat,15,2);
            DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound( DMCXP.cdsMovCxP.FieldByName('CPMtoLoc').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat,15,2);
            //**
            If DMCXP.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat > 0 then
               DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat/DMCXP.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat,15,2)
            else begin
               DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat/DMCXP.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat,15,2);
            end;
            end
         else begin
            //** 16/07/2001 - pjsv
            DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoExt').AsFloat+DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat,15,2);
            DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoExt').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat,15,2);
            //**
            If DMCXP.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat > 0 then
               DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat,15,2)
            else begin
               DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat,15,2);
            end;
         end;

         DMCXP.cdsCanje.Delete;
      end;
      DMCXP.cdsMovCxP.Filtered:=True;
      dbgPendientes.RefreshDisplay;
      bbtnSumatClick(Sender);
   end;
end;

procedure TFLetras.dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocCanje.BeginDrag(False);
end;

procedure TFLetras.bbtnBasuraDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

Function TFLetras.ValidaCabecera: Boolean;
var
   xWhere : String;
begin
   if length(dblcCia.Text)=0   then raise exception.Create('Falta Código de Compañía');
   if length(edtCia.Text)=0 then raise exception.Create('Código de Compañía Errado');
   if (length(edtCanje.Text)=0) or (edtCanje.Text='000000') then raise exception.Create('Falta No. de Canje');
   If length(dblcdProv.Text)=0 then raise exception.Create('Falta Registrar Proveedor');
   If length(edtProv.Text)=0 then raise exception.Create('Proveedor Errado');
   if dbdtpFEmis.Date=0 then raise exception.Create('Falta Fecha de Canje');
   if length(dblcTMon.Text)=0 then raise exception.Create('Falta Tipo de Moneda');
   if length(edtTMon.Text)=0 then raise exception.Create('Código de Moneda Errado');
   if length(dbeTCLet.Text)=0 then raise exception.Create('Falta Tipo de Cambio');
{   If length(dbeLote.Text)=0 then raise exception.Create('Falta Registrar Lote');}
   If dbdtpFComp.Date=0 then raise exception.Create('Falta Fecha de Comprobante');
   if length(dbeCuenta.Text)=0 then raise exception.Create('Falta Registrar Cuenta');
//GAR***************************************************************************
   If Length(dblcdCnpEgr.Text) > 0 Then
    begin
     xWhere := 'CUENTAID ='+QuotedStr(DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString)
              +' And CIAID ='+QuotedStr(dblcCia.Text);
     If Length(DMCXP.DisplayDescrip2('prvSQL', 'TGE202', 'CUENTAID, CTA_ME', xWhere, 'CTA_ME')) > 0 Then
      begin
       If DMCXP.cdsQry.FieldByName('CTA_ME').AsString = 'S' Then
        begin
         If dblcTMon.Text <> DMCXP.cdsQry.FieldByName('CTA_ME').AsString Then
          begin
           Beep;
           MessageDlg('El Tipo de Moneda para la Cuenta '+DMCXP.cdsQry.FieldByName('CUENTAID').AsString+' Debe Ser ''S''', mtInformation, [mbOk], 0);
           Result := False;
           Exit;
          end;
        end;
      end;
    end;
//GAR***************************************************************************
   if length(dbeGlosa.Text)=0 then raise exception.Create('Código de Cuenta Errado');
   Result := true;
end;

Function TFLetras.ExisteMovCxP(xxCia,xxTDiario,xxAAMM,xxNoReg:String):Boolean;
begin
   DMCXP.cdsMovCxP.Setkey;
   DMCXP.cdsMovCxP.FieldByName('CiaId').AsString   := xxCia;
   DMCXP.cdsMovCxP.FieldByName('TDiarID').AsString := xxTDiario;
   DMCXP.cdsMovCxP.FieldByName('CPAnoMes').AsString:= xxAAMM;
   DMCXP.cdsMovCxP.FieldByName('CPNoReg').AsString := xxNoReg;
   if DMCXP.cdsMovCxP.GotoKey then Result:=True else Result:=False;
end;

function TFLetras.ExisteLetras(xxCia,xxTCanje,xxCanje:String):Boolean;
var
   xSQL: String;
begin
   xSQL:='select CANJE from CXP308 Where ';
   xSQL:= xSQL + 'CIAID='    +''''+ xxCia +''''+' and ';
   xSQL:= xSQL + 'TCANJEID=' +''''+ xxTCanje +''''+' and ';
   xSQL:= xSQL + 'CANJE='    +''''+ xxCanje +'''';
   xSQL := UpperCase( xSQL );
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.ProviderName:='dspTGE';
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   if DMCXP.cdsQry.RecordCount>0 then
      result:=True
   else
      result:=False;
end;

procedure TFLetras.bbtnOkClick(Sender: TObject);
var
   xFecStr : String;
begin
   xFlagCal := True;

   if not ValidaCabecera then Exit;  // Valida que Cabecera Tenga Datos Correctos

   //CLG: 27/11/2003
   // VALIDA LA CUENTA DEL CONCEPTO
   if (DMCXP.LaCuentaSeRegistraSoloEnME(dblcCia.text,dblcdCnpEgr.text,'')) and (dblcTMon.text=DMCXP.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+DMCXP.cdsQry.FieldByName('CUENTAID').AsString+' del Concepto '+dblcdCnpEgr.text+' Se registra sólo en Moneda Extranjera.');
   end;

   if xControlFec(dblcCia.Text, dtpFRecep.Date) = False then
   begin
      Exit;
   end;

   DMCXP.cdsTDoc.Filtered := False;
   xFecStr := DateToStr(dbdtpFEmis.date);
   xTAno   := Copy(xFecStr, 7, 4);
   xTMes   := Copy(xFecStr, 4, 2);

   if DMCXP.wModo = 'A' then
   begin
      FiltraCanje;      // Filtra cdsCanje, cdsDetCanje, cdsLetras
   end;

   If (DMCXP.cdsMovCxP.RecordCount = 0) and (DMCXP.cdsCanje.RecordCount = 0) then
   begin
      DMCXP.cdsCCanje.Edit;
      DMCXP.cdsCCanje.fieldbyname('CJEstado').AsString:='X';
      EstadoDeForma( 0, DMCXP.cdsCCanje.fieldbyname('CJEstado').AsString, ' ' );

      Raise Exception.Create(' Proveedor No tiene Documentos Pendientes de Pago ');
   end;

   xAnomes := xTAno + xTMes;

   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.First;
   While not DMCXP.cdsCanje.Eof do
   Begin
      DMCXP.cdsCanje.Edit;
      DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat := FRound(StrToFloat(dbeTCLet.text),15,4);

      If DMCXP.cdsCanje.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
      begin
        DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
        DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat := FRound( DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
      end
      else
      begin
        DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
        DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat := FRound( DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
      end;

      if ExisteMovCxP( DMCXP.cdsCanje.FieldByName('CIAID').AsString,DMCXP.cdsCanje.FieldByName('TDIARID').AsString,
                       DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString,DMCXP.cdsCanje.FieldByName('CPNOREG').AsString) then
                       begin
         DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat:=(DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat);
         DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat:=(DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat);
      end;
      DMCXP.cdsCanje.FieldByName('CJEANTMN').AsFloat := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
      DMCXP.cdsCanje.FieldByName('CJEANTME').AsFloat := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
      DMCXP.cdsCanje.Next;
   end;
   DMCXP.cdsCanje.EnableControls;

	 xFrecep := dtpFRecep.Date;

   EstadoDeForma(1, DMCXP.cdsCCanje.fieldbyname('CJEstado').AsString, ' ' );

   bbtnSumatClick(Sender);
end;

procedure TFLetras.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFLetras.BitBtn3DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFLetras.bbtnSumatClick(Sender: TObject);
Var
   xxTotal, xTSalLoc, xTSalExt, xTPagLoc, xTPagExt, xTTotLet, xTTotLoc, xTTotExt, xTSalLet : double;
   xTMonAbr,xSQL,xTMonID : String;
   xRegAct : TBookMark;
   //cim 24/06/2002
   xTPagOri : double;
begin
   xSQL := 'TMONID = '+quotedstr(dblcTMon.Text);
   xTMonAbr := DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONABR',xSQL,'TMONABR');
// Totales de Documentos de canje
   DMCXP.cdsCanje.DisableControls;
   xRegAct := DMCXP.cdsCanje.GetBookmark;
   xTSalLoc := 0;
   xTSalExt := 0;
   //cim 24/06/2002
   xTPagOri := 0;
   //
   xTPagLoc := 0;
   xTPagExt := 0;
   DMCXP.cdsCanje.First ;
   while not DMCXP.cdsCanje.Eof do
   begin
      xTSalLoc := xTSalLoc + DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat;
      xTSalExt := xTSalExt + DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat;
      //cim 24/06/2002
      xTPagOri := xTPagLoc + DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat;
      xTPagLoc := xTPagLoc + DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
      xTPagExt := xTPagExt + DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
      DMCXP.cdsCanje.Next;
   end;
   dbgDocCanje.ColumnByName('CPSalLoc').FooterValue:=floattostrf(xTSalLoc, ffNumber, 10, 2);
   dbgDocCanje.ColumnByName('CPSalExt').FooterValue:=floattostrf(xTSalExt, ffNumber, 10, 2);
   dbgDocCanje.ColumnByName('CCPMoLoc').FooterValue:=floattostrf(xTPagLoc, ffNumber, 10, 2);
   dbgDocCanje.ColumnByName('CCPMoExt').FooterValue:=floattostrf(xTPagExt, ffNumber, 10, 2);

   xRetIGV := 0;
   CalculaRetencionIGV;

   DMCXP.cdsCanje.GotoBookmark(xRegAct);
   DMCXP.cdsCanje.FreeBookmark(xRegAct);
   DMCXP.cdsCanje.EnableControls;

// Totales de Letras por Pagar
   DMCXP.cdsLetras.DisableControls;
   xRegAct  := DMCXP.cdsLetras.GetBookmark;
   xTTotLet := 0;
   xTSalLet := 0;
   xTTotLoc := 0;
   xTTotExt := 0;
   xTMonID  := xTmonAbr;
   DMCXP.cdsLetras.First ;
   while not DMCXP.cdsLetras.eof do
   begin
      xTTotLet := xTTotLet + DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat;
      xTTotLoc := xTTotLoc + DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat;
      xTTotExt := xTTotExt + DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat;
      xTSalLet := xTSalLet + DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat;
      DMCXP.cdsLetras.Next;
   end;
//
   dbgLetras.ColumnByName('CPMtoOri').FooterValue:=floattostrf(xTTotLet, ffNumber, 10, 2);
   dbgLetras.ColumnByName('CPMtoLoc').FooterValue:=floattostrf(xTTotLoc, ffNumber, 10, 2);
   dbgLetras.ColumnByName('CPMtoExt').FooterValue:=floattostrf(xTTotExt, ffNumber, 10, 2);
   DMCXP.cdsLetras.GotoBookmark(xRegAct);
   DMCXP.cdsLetras.FreeBookmark(xRegAct);
   DMCXP.cdsLetras.EnableControls;
   if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
      xxTotal := xTPagLoc
   else
   begin
      //CIM 24/06/2002
      if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
         xxTotal := xTPagExt
      else
         xxTotal := xTPagOri;
      //*
   end;
   edtFinal.Text:='Letras se deberan Generar por la suma de '
                 + trimright(xTmonAbr) +'  '
                 + trimleft(floattostrf( xxToTal ,ffNumber,15,2));
   if xRetIGV>0 then
   begin
      if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
         xRetIGV:=FRound(xRetIGV/FRound(strtofloat(dbeTCLet.Text),8,3),15,2);

      edtFinal.Text:=edtFinal.Text+' - Ret. IGV '
                 + trimleft(floattostrf( xRetIGV,ffNumber,15,2))
                 + '='+trimleft(floattostrf( xxToTal-xRetIGV ,ffNumber,15,2));
   end;
end;

procedure TFLetras.Z2bbtnGrabaClick(Sender: TObject);
Var
   xCuadra : Boolean;
   xSql : String;
   xRetIGVtemp, XRETLETRA : double;
begin
   // Verifica que existan Documentos
   If DMCXP.cdsCanje.RecordCount=0 Then Raise exception.Create('Falta Registrar Documentos a Canjear');
   // Verifica que existan Letras
   If DMCXP.cdsLetras.RecordCount=0 Then raise exception.Create('Falta Registrar Letras');
   // Verifica que Totales Cuadren
   xCuadra := True;
   If DMCXP.cdsMovCxP.FieldByName('TCANJEID').AsString <> 'NC' then
   begin
     If not VerificaTotal() Then
      begin
       ShowMessage('Total Documentos a Canjear y Total Letras NO Cuadran');
       xCuadra := False;
      end;
   end;
   If xCuadra then
   begin
     // Actualiza Letras

     XRETLETRA:=0;
     if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
        xRetIGV:=FRound(xRetIGV/FRound(strtofloat(dbeTCLet.Text),8,3),15,2);


     xRetIGVtemp:=xRetIGV;
     XRETLETRA:= FRound(xRetIGVtemp/DMCXP.cdsLetras.RecordCount,15,2);

     DMCXP.cdsLetras.First;
     while not DMCXP.cdsLetras.eof do
     begin
        DMCXP.cdsLetras.Edit;
        DMCXP.cdsLetras.FieldByName('PROVDES').AsString   :=edtProv.Text; // Drescripcion del Proovedor
        DMCXP.cdsLetras.FieldByName('CPESTADO').AsString  := 'I';
        DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime := dbdtpFEmis.Date;
        DMCXP.cdsLetras.FieldByName('CPFRECEP').AsDateTime:= dtpFRecep.date;
        DMCXP.cdsLetras.FieldByName('CPFCMPRB').AsDateTime:= dbdtpFComp.Date;
        DMCXP.cdsLetras.FieldByName('DCPLOTE').AsString   := dbeLote.Text;
        DMCXP.cdsLetras.FieldByName('CPTOTOT').AsString   := dblcdCnpEgr.Text;
        DMCXP.cdsLetras.FieldByName('CTATOTAL').AsString  := dbeCuenta.Text;
        DMCXP.cdsLetras.FieldByName('CPTOTOT').AsString   := dblcdCnpEgr.Text;
        DMCXP.cdsLetras.FieldByName('CPUSER').AsString    := DMCXP.wUsuario;
        DMCXP.cdsLetras.FieldByName('CPGRAVAD').AsFloat   := DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat;
        DMCXP.cdsLetras.FieldByName('CPFREG').AsDateTime  := date;
        DMCXP.cdsLetras.FieldByName('CPHREG').AsDateTime  := Time;
        if xRetIGV>0 then
        begin
{          if DMCXP.cdsLetras.RecNo=DMCXP.cdsLetras.RecordCount then
          begin
            DMCXP.cdsLetras.FieldByName('CPNOGRAV').AsFloat   :=  xRetIGVtemp
          end
          else
          begin
            DMCXP.cdsLetras.FieldByName('CPNOGRAV').AsFloat   :=  XRETLETRA;
            xRetIGVtemp:=FRound(xRetIGVtemp-XRETLETRA,15,2)
          end;
          DMCXP.cdsLetras.fieldbyname('PROVRETIGV').AsString := 'S';  // Indica que el Documento está sujeto a retención IGV.}
        end
        else
           DMCXP.cdsLetras.fieldbyname('PROVRETIGV').AsString := 'N'; // Indica que el Documento No está sujeto a retención IGV.

        cdsPost( DMCXP.cdsLetras );
        DMCXP.cdsLetras.Next;
     end;
     ActualizaSaldosMovCxP;
     //cim 24/06/20002
     bbtnSumatClick(Sender);


     DMCXP.cdsLetras.First;
     DMCXP.cdsCCanje.Edit;
     DMCXP.cdsCCanje.fieldbyname('CPNOREG').AsString:=DMCXP.cdsLetras.FieldByName('CPNOREG').AsString;
     DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat:=xRetIGV;
     DMCXP.cdsCCanje.fieldbyname('CJESTADO').AsString  :='I';
     DMCXP.cdsCCanje.fieldbyname('CJUSER').AsString  :=DMCXP.wUsuario;
     DMCXP.cdsCCanje.fieldbyname('CJFREG').Value     :=Date;
     DMCXP.cdsCCanje.fieldbyname('CJFHOR').Value     :=Time;
     //CIM 03/07/2002
     DMCXP.cdsCCanje.fieldbyname('CJLETINI').AsString     := DMCXP.cdsLetras.FieldByName('CPNODOC').AsString;
     DMCXP.cdsCCanje.fieldbyname('CJNUMLET').AsFloat      := DMCXP.cdsLetras.RecordCount;
     DMCXP.cdsCCanje.fieldbyname('CJDIAS').AsFloat        := DMCXP.cdsLetras.FieldByName('CPFVCMTO').AsDatetime-DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDatetime;
     DMCXP.cdsCCanje.fieldbyname('CJLETFVCTO').AsDatetime := DMCXP.cdsLetras.FieldByName('CPFVCMTO').AsDatetime;
     DMCXP.cdsCCanje.fieldbyname('CJTOTORI').AsFloat      := DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat;
     DMCXP.cdsCCanje.fieldbyname('CJTOTLOC').AsFloat      := DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat;
     DMCXP.cdsCCanje.fieldbyname('CJTOTEXT').AsFloat      := DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat;
     //*
     //CIM 28/08/2002
     DMCXP.cdsCanje.DisableControls;
     DMCXP.cdsCanje.First;
     DMCXP.cdsCCanje.fieldbyname('NDDOC').AsString    := DMCXP.cdsCanje.FieldByName('DOCID').AsString;
     DMCXP.cdsCCanje.fieldbyname('NDSERIE').AsString  := DMCXP.cdsCanje.FieldByName('CPSERIE').AsString;
     DMCXP.cdsCCanje.fieldbyname('NDNUMERO').AsString := DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
     //*

     DMCXP.AplicaDatos( DMCXP.cdsCCanje, 'CCanje' );

     DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DetCxP' );
     DMCXP.AplicaDatos( DMCXP.cdsLetras, 'Letras' );

     DMCXP.AplicaDatos( DMCXP.cdsCanje,  'Canje'  );

{     // Si Canje Esta cuadrado, Grabar CxP305
     If xCuadra then GrabaDetCanje;
 }
//     If xCuadra then GrabaAsientoOperativo;

     FiltraCanje;

     EstadoDeForma(1,DMCXP.cdsLetras.FieldByName('CPESTADO').AsString,DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString);
     ShowMessage('  Registro de Canje Grabado  ');
   end;
end;

procedure TFLetras.ActualizaSaldosMovCxP;
var
   xRegAct : TBookMark;
   xMontoL,xMontoE : Double; // 01/08/2001 - pjsv, para los montos de las N.C.
   //CIM 24/06/2002
   xMontoO : double;
   xTipReg : string;
   //*
begin
   // Actualiza Saldo de MovCxP
   DMCXP.cdsMovCxP.DisableControls;
   DMCXP.cdsMovCxP.Filtered:=False;
   DMCXP.cdsCanje.DisableControls;
   xRegAct := DMCXP.cdsCanje.GetBookmark;
   DMCXP.cdsCanje.First;
   while not DMCXP.cdsCanje.Eof do
   begin
      DMCXP.cdsCanje.Edit;
      DMCXP.cdsMovCxP.Setkey;
      DMCXP.cdsMovCxP.FieldByName('CIAID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsCanje.FieldByName('TDIARID').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString := DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsCanje.FieldByName('CPNOREG').AsString;
      if DMCXP.cdsMovCxP.GotoKey then
       begin
         //** 01/08/2001 - pjsv,
        xTipReg := DMCXP.DisplayDescrip2('dspTGE','TGE110','DOC_FREG,DOCTIPREG','DOCID='+quotedstr(DMCXP.cdsMovCxP.FieldByName('DOCID').AsString),'DOC_FREG');
        if (xTipReg = 'N') or (DMCXP.cdsQry.FieldByName('DOCTIPREG').AsString='NC') then // Nota de CREDITO
        //If DMCXP.DisplayDescrip2('dspTGE','TGE110','DOC_FREG','DOCID='+quotedstr(DMCXP.cdsMovCxP.FieldByName('DOCID').AsString)+' AND DOCMOD=''CXP'' ','DOC_FREG')  = 'N' then
          begin
           //** 01/08/2001 - pjsv, solo entra cuando es N.C., se vuelve a * por -1 para pasarlo a positivo el monto
           //** xque es vez de restar sumaba el saldo de la N.C. y nunca se mataba
           xMontoE := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat * -1;
           xMontoL := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat * -1;

          end
        else
         begin //** 01/08/2001 - pjsv, cuando es un monto de cuelquir tipo de provision
           xMontoO := DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat;
           xMontoE := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
           xMontoL := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
         end;
        //**
        If DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
         begin
          If FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat + xMontoL,15,2) > FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat,15,2) then
           Raise exception.Create('Error : Monto pagado excede a Monto Total de Documento');
         end
        else
         begin
         //CIM 24/06/2002
           If DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonExt then
           begin
              If FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat + xMontoE,15,2) > FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat,15,2) Then
                  Raise exception.Create('Error : Monto pagado excede a Monto Total de Documento');
           end
           else
           begin
              If FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat + xMontoE,15,2) > FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOORI').AsFloat,15,2) Then
                  Raise exception.Create('Error : Monto pagado excede a Monto Total de Documento');

           end;

         end;

        DMCXP.cdsMovCxP.edit;
        If DMCXP.cdsMovCxP.FieldByName('TMonID').AsString=DMCXP.wTMonLoc then
         begin
          DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat - (DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat + xMontoL),15,2);
          DMCXP.cdsMovCxP.FieldByName('CPSalORI').AsFloat:=DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat;
          DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
         end
        else
         begin
            If DMCXP.cdsMovCxP.FieldByName('TMonID').AsString=DMCXP.wTMonExt then
            begin
               DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoExt').AsFloat-(DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat + xMontoE),15,2);
               DMCXP.cdsMovCxP.FieldByName('CPSalORI').AsFloat:=DMCXP.cdsMovCxP.FieldByName('CPSalEXT').AsFloat;
               DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
            end
            else//Otras monedas extranjeras
            begin
               DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat-(DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat + xMontoE),15,2);
               DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOORI').AsFloat-(DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat + xMontoO),15,2);
               DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat-(DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat + xMontoL),15,2);
            end
         end;
        DMCXP.cdsMovCxP.FieldByName('FlagVar').AsString := '';
        DMCXP.cdsMovCxP.Post;
      end;
      DMCXP.cdsCanje.Next;
   end;

   DMCXP.AplicaDatos( DMCXP.cdsMovCxP, 'MovCxP' );

   DMCXP.cdsCanje.GotoBookmark(xRegAct);
   DMCXP.cdsCanje.FreeBookmark(xRegAct);
   DMCXP.cdsCanje.EnableControls;
   DMCXP.cdsMovCxP.Filtered:=True;
   DMCXP.cdsMovCxP.EnableControls;
end;

Procedure TFLetras.GrabaDetCanje;
var
   xSalLoc,xSalExt,xSaldoC,xSaldoL : double;
   xMtoRet, xMtoRetMO : double;
   xWhere : String;

   xMtoAbonosMN, xMtoAbonosME : double;
   xMtoCArgosMN, xMtoCargosME : double;
begin
   DMCXP.cdsDetCanje.EmptyDataSet;

   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.First;
   while not DMCXP.cdsCanje.Eof do
   begin
      DMCXP.cdsDetCanje.Insert;
      DMCXP.cdsDetCanje.FieldByName('CIAID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsDetCanje.FieldByName('PROV').AsString     := DMCXP.cdsCanje.FieldByName('PROV').AsString;
      DMCXP.cdsDetCanje.FieldByName('PROVRUC').AsString  := DMCXP.cdsCanje.FieldByName('PROVRUC').AsString;
      DMCXP.cdsDetCanje.FieldByName('DOCID').AsString    := DMCXP.cdsCanje.FieldByName('DOCID').AsString;
      DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString  := DMCXP.cdsCanje.FieldByName('CPSERIE').AsString;
      DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString  := DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
//      DMCXP.cdsDetCanje.FieldByName('CPNOREG').AsString  := DMCXP.cdsLetras.FieldByName('CPNOREG').AsString;
      DMCXP.cdsDetCanje.FieldByName('CPNOREG').AsString  := DMCXP.cdsCanje.FieldByName('CPNOREG').AsString;
      DMCXP.cdsDetCanje.FieldByName('TCANJEID').AsString := DMCXP.cdsCanje.FieldByName('TCANJEID').AsString;
      DMCXP.cdsDetCanje.FieldByName('CCPCANJE').AsString := DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString;
      DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsDateTime:= DMCXP.cdsCanje.FieldByName('CCPFCJE').AsDateTime;
      DMCXP.cdsDetCanje.FieldByName('DOCID2').AsString   := DMCXP.cdsLetras.FieldByName('TCANJEID').AsString;
      DMCXP.cdsDetCanje.FieldByName('CPSERIE2').AsString := '000';
      DMCXP.cdsDetCanje.FieldByName('CPNODOC2').AsString := edtCanje.text; //DMCXP.cdsLetras.FieldByName('CCPCANJE').AsString;
      DMCXP.cdsDetCanje.FieldByName('TMONID').AsString   := DMCXP.cdsCanje.FieldByName('TMONID').AsString;
      DMCXP.cdsDetCanje.FieldByName('DCDUSER').AsString  := DMCXP.cdsCanje.FieldByName('CCPUSER').AsString;
      DMCXP.cdsDetCanje.FieldByName('DCDFREG').AsdateTime:= DMCXP.cdsCanje.FieldByName('CCPFREG').AsDateTime;
      DMCXP.cdsDetCanje.FieldByName('DCDHREG').AsDateTime:= DMCXP.cdsCanje.FieldByName('CCPHREG').AsDateTime;
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
      DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := FRound(DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
      DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat := FRound(DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2);
      DMCXP.cdsDetCanje.Post;
      DMCXP.cdsCanje.Next;
   end;
   DMCXP.AplicaDatos( DMCXP.cdsDetCanje, 'DetCanje' );

   DMCXP.cdsLetras.CancelUpdates;
   DMCXP.cdsDetCanje.First;
   DMCXP.cdsLetras.EnableControls;
   DMCXP.cdsCanje.EnableControls;

{
// calcula total documentos de descuentos
 // primero el monto de las letras
   xMtoAbonosMN := 0;
   xMtoAbonosME := 0;
   DMCXP.cdsLetras.DisableControls;
   DMCXP.cdsLetras.First;
   while not DMCXP.cdsLetras.Eof do
   begin
      xMtoAbonosMN := xMtoAbonosMN+DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat;
      xMtoAbonosME := xMtoAbonosME+DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat;
      DMCXP.cdsLetras.Next;
   end;
 // luego los documentos de descuento usados en el total a canjear
   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.First;
   while not DMCXP.cdsCanje.Eof do
   begin
      xWhere := 'DOCMOD='+quotedstr('CXP')
               +' and DOCID='+quotedstr(DMCXP.cdsCanje.FieldByName('DOCID').AsString);
      if DMCXP.DisplayDescrip2('dspTGE','TGE110','DOCRESTA',xWhere,'DOCRESTA') = 'S' then
      begin
         xMtoAbonosMN := xMtoAbonosMN+DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
         xMtoAbonosME := xMtoAbonosME+DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
      end;
      DMCXP.cdsCanje.Next;
   end;
 // Añade la retención de IGV si lo hubiese
   xMtoAbonosMN := xMtoAbonosMN + xRetIGV;
   xMtoAbonosME := xMtoAbonosME + FRound(xRetIGV/FRound(strtofloat(dbeTCLet.Text),8,3),12,2);
   xMtoAbonosMN := FRound(xMtoAbonosMN,12,2);
   xMtoAbonosME := FRound(xMtoAbonosME,12,2);

 // Acumula Cargos de Documentos a Pagar
   DMCXP.cdsCanje.First;
   while not DMCXP.cdsCanje.Eof do
   begin
      xWhere := 'DOCMOD='+quotedstr('CXP')
               +' and DOCID='+quotedstr(DMCXP.cdsCanje.FieldByName('DOCID').AsString);
      if DMCXP.DisplayDescrip2('dspTGE','TGE110','DOCRESTA',xWhere,'DOCRESTA') = 'N' then
      begin
         if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
            xSaldoC := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
//            while xSaldoC>0

      end;
      DMCXP.cdsCanje.Next;
   end;




   xMtoRetMO := xRetIGV;
   if dblcTMon.Text= DMCXP.wTMonExt then
      xMtoRet:=xRetIGV*FRound(strtofloat(dbeTCLet.Text),8,3)
   else
      if dblcTMon.Text= DMCXP.wTMonLoc then
         xMtoRet:=xRetIGV;

   DMCXP.cdsDetCanje.EmptyDataSet;

   DMCXP.cdsLetras.First;

   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.First;
   while not DMCXP.cdsCanje.Eof do
   begin
      xWhere := 'DOCID='+quotedstr(DMCXP.cdsCanje.FieldByName('DOCID').AsString);
      if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
      begin
         if DMCXP.DisplayDescrip2('dspTGE','TGE110','DOC_FREG',xWhere,'DOC_FREG') = 'N' then // Nota de CREDITO
            xSaldoC := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat * -1
         else
            xSaldoC := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
      end
      else
      begin
         if DMCXP.DisplayDescrip2('dspTGE','TGE110','DOC_FREG',xWhere,'DOC_FREG') = 'N' then // Nota de CREDITO
            xSaldoC := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat * -1
         else
            xSaldoC := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
      end;
      xSalLoc := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
      xSalExt := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
      while (xSaldoC-xMtoRetMO) > 0 do
      begin
         while (not DMCXP.cdsLetras.Eof) and (xSaldoC>0) do
         begin
            if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc Then
            begin
               if xNCL <> 0 then
                  xSaldoL := DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat + (xNCL * -2)
               else
                  xSaldoL := DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat;
            end
            else
            begin
               if xNCE <> 0 then
                  xSaldoL := DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat + (xNCE * -2)
               else
                  xSaldoL := DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat;
            end;

            DMCXP.cdsDetCanje.Insert;
            if xSaldoL<=xSaldoC then
            begin
            // Grabar en cxp305 en monto = a la letra
               GrabaRegCxP305;
               if DMCXP.cdsDetCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
               begin
                  DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := FRound(DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat,15,2);
                  DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat := FRound(DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
                  xSalLoc := FRound( xSalLoc-DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat,15,2);
                  xSalExt := FRound( xSalExt-DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat,15,2);
                  xSaldoC := xSalLoc;
               end
               else
               begin
                  DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat := FRound(DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat,15,2);
                  DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := FRound(DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
                  xSalExt := FRound(xSalExt-DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat,15,2);
                  xSalLoc := FRound(xSalLoc-DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat,15,2);
                  xSaldoC := xSalExt;
               end;
               DMCXP.cdsLetras.Edit;
               DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := 0;
               DMCXP.cdsLetras.Delete;
            end
            else
            begin
            // Grabar en cxp305 en monto = xSalLoc
               GrabaRegCxP305;
               if DMCXP.cdsDetCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
               begin
                  DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := FRound(xSalLoc,15,2);
                  DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat := FRound(xSalLoc/DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat,15,2);
               end
               else
               begin
                  DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat := FRound(xSalExt,15,2);
                  DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := FRound(xSalExt*DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat,15,2);
               end;
               DMCXP.cdsLetras.Edit;
               DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound(DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat-xSalLoc,15,2);
               DMCXP.cdsLetras.FieldByName('CPMtoExt').AsFloat := FRound(DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat-xSalExt,15,2);
               xSalLoc := 0;
               xSalExt := 0;
               xSaldoC := 0;
            end;
            DMCXP.cdsDetCanje.Post;
         end;
      end;
      DMCXP.cdsCanje.Next;
   end;
   DMCXP.AplicaDatos( DMCXP.cdsDetCanje, 'DetCanje' );

   DMCXP.cdsLetras.CancelUpdates;
   DMCXP.cdsDetCanje.First;
   DMCXP.cdsLetras.EnableControls;
   DMCXP.cdsCanje.EnableControls;
}
end;

Procedure TFLetras.GrabaRegCxP305;
begin
   DMCXP.cdsDetCanje.FieldByName('CIAID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
   DMCXP.cdsDetCanje.FieldByName('PROV').AsString     := DMCXP.cdsCanje.FieldByName('PROV').AsString;
   DMCXP.cdsDetCanje.FieldByName('PROVRUC').AsString  := DMCXP.cdsCanje.FieldByName('PROVRUC').AsString;
   DMCXP.cdsDetCanje.FieldByName('DOCID').AsString    := DMCXP.cdsCanje.FieldByName('DOCID').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString  := DMCXP.cdsCanje.FieldByName('CPSERIE').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString  := DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPNOREG').AsString  := DMCXP.cdsLetras.FieldByName('CPNOREG').AsString;
   DMCXP.cdsDetCanje.FieldByName('TCANJEID').AsString := DMCXP.cdsCanje.FieldByName('TCANJEID').AsString;
   DMCXP.cdsDetCanje.FieldByName('CCPCANJE').AsString := DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString;
   DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsDateTime:= DMCXP.cdsCanje.FieldByName('CCPFCJE').AsDateTime;
   DMCXP.cdsDetCanje.FieldByName('DOCID2').AsString   := DMCXP.cdsLetras.FieldByName('DOCID').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPSERIE2').AsString := DMCXP.cdsLetras.FieldByName('CPSERIE').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPNODOC2').AsString := DMCXP.cdsLetras.FieldByName('CPNODOC').AsString;
   DMCXP.cdsDetCanje.FieldByName('TMONID').AsString   := DMCXP.cdsCanje.FieldByName('TMONID').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDUSER').AsString  := DMCXP.cdsCanje.FieldByName('CCPUSER').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDFREG').AsdateTime:= DMCXP.cdsCanje.FieldByName('CCPFREG').AsDateTime;
   DMCXP.cdsDetCanje.FieldByName('DCDHREG').AsDateTime:= DMCXP.cdsCanje.FieldByName('CCPHREG').AsDateTime;
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
end;


procedure TFLetras.DetCxPUsuario;
begin
   DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
   DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime:= Date;
   DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime:= time;
end;

procedure TFLetras.DetCxP2Usuario;
begin
   DMCXP.cdsDetCxP2.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
   DMCXP.cdsDetCxP2.FieldByName('DCPFREG').AsDateTime:= Date;
   DMCXP.cdsDetCxP2.FieldByName('DCPHREG').AsDateTime:= time;
end;

Function TFLetras.VerificaTotal:Boolean;
Var
   xTPagLoc, xTPagExt, xTLetOri, xTLetLoc, xTLetExt, xDifLoc, xDifExt : double;
   //cim 24/06/2002
   xTPagOri : double;
   //*
   xRegAct : TBookMark;
begin
   Result := False;

   DMCXP.cdsMovCxP.DisableControls;
   DMCXP.cdsMovCxP.Filtered:=False;
   DMCXP.cdsCanje.DisableControls;
   xRegAct  := DMCXP.cdsCanje.GetBookmark;
   xTPagLoc := 0; xTPagExt := 0;
   //cim 24/06/2002
   xTPagOri := 0;
   //*
   DMCXP.cdsCanje.First;
   While not DMCXP.cdsCanje.Eof do
   Begin
      DMCXP.cdsCanje.Edit;
      DMCXP.cdsMovCxP.Setkey;
      DMCXP.cdsMovCxP.FieldByName('CiaID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsMovCxP.FieldByName('TDiarID').AsString  := DMCXP.cdsCanje.FieldByName('TDIARID').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPAnoMes').AsString := DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPNoReg').AsString  := DMCXP.cdsCanje.FieldByName('CPNOREG').AsString;
      if DMCXP.cdsMovCxP.GotoKey then
      begin
         If DMCXP.cdsMovCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then begin
            If FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2)
               > FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat,15,2) then begin
               Raise exception.Create('Error : Monto pagado excede a Monto Total de Documento');
            end;
            end
         else
         begin
         //CIM 24/06/2002
            If DMCXP.cdsMovCxP.FieldByName('TMONID').AsString = DMCXP.wTMonExt then begin
               If FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2)
                  > FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat,15,2) Then begin
                  Raise exception.Create('Error : Monto pagado excede a Monto Total de Documento');
               End;
            end
            else//PARA OTRAS MONEDAS EXTRANJERAS
               If FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat,15,2)
                  > FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOORI').AsFloat,15,2) Then begin
                  Raise exception.Create('Error : Monto pagado excede a Monto Total de Documento');
               End;
         //*
         end;
      end;
      xTPagOri := FRound( xTPagLoc + DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat,15,2);      
      xTPagLoc := FRound( xTPagLoc + DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
      xTPagExt := FRound( xTPagExt + DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2);
      DMCXP.cdsCanje.Next;
   end;
   DMCXP.cdsCanje.GotoBookmark(xRegAct);
   DMCXP.cdsCanje.FreeBookmark(xRegAct);
   DMCXP.cdsCanje.EnableControls;
   DMCXP.cdsMovCxP.Filtered:=True;
   DMCXP.cdsMovCxP.EnableControls;

   //CLG: 31/05/2002
   xRetIGV := 0;
   CalculaRetencionIGV;

{   If DMCXP.cdsLetras.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
   begin
      If FRound(xTLetLoc,15,2)=FRound(xTPagLoc-(xRegIGV*strtofloat(dbeTCLet.Text)),15,2) then
         Result := True;
   end
   Else
   begin
      If DMCXP.cdsLetras.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
      begin
         If FRound(xTLetExt,15,2)=FRound(xTPagExt-xRegIGV,15,2) then
            Result := True
      //carlos 04/03/2002
      end
      else
      begin
         If FRound(xTLetLoc,15,2)=FRound(xTPagLoc-(xRegIGV*strtofloat(dbeTCLet.Text)),15,2) then
            Result := True
      //
      end;
   end;}


   // Totales de Letras por Pagar
   DMCXP.cdsLetras.DisableControls;
   xRegAct  := DMCXP.cdsLetras.GetBookmark;
   xTLetOri := 0; xTLetLoc := 0; xTLetExt := 0;
   DMCXP.cdsLetras.First ;
   While not DMCXP.cdsLetras.Eof do
   Begin
      xTLetOri := xTLetOri + FRound(DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
      xTLetLoc := xTLetLoc + FRound(DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat,15,2);
      xTLetExt := xTLetExt + FRound(DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat,15,2);
      DMCXP.cdsLetras.Next;
   end;

   If DMCXP.cdsLetras.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
   begin
      If FRound(xTLetLoc,15,2)=FRound(xTPagLoc-xRetIGV,15,2) then
         Result := True;
      end
   Else
   begin
      If DMCXP.cdsLetras.FieldByName('TMONID').AsString = DMCXP.wTMonExt then begin
         If FRound(xTLetExt,15,2)=FRound(xTPagExt-(xRetIGV/strtofloat(dbeTCLet.Text)),15,2) then
            Result := True
			//carlos 04/03/2002
			end
			else
			begin
				 If FRound(xTLetOri,15,2)=FRound(xTPagOri-xRetIGV,15,2) then
						Result := True
      //
      end;
   end;

   xDifLoc:=0; xDifExt:=0;

   If Result then begin
      If xTLetLoc<>xTPagLoc then
      begin
         xDifLoc := FRound( xTPagLoc-xReTIGV-xTLetLoc, 5, 2);
      end;
      If xTLetExt<>xTPagExt then begin
         xDifExt := FRound((xTPagExt-xReTIGV/strtofloat(dbeTCLet.Text))-xTLetExt,5,2)
      end;
   end;

   DMCXP.cdsLetras.Last;
   DMCXP.cdsLetras.Edit;
   DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound(DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat + xDifLoc,15,2);
   DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound(DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat + xDifExt,15,2);
   DMCXP.cdsLetras.GotoBookmark(xRegAct);
   DMCXP.cdsLetras.FreeBookmark(xRegAct);
   DMCXP.cdsLetras.EnableControls;
end;



procedure TFLetras.bbtnCalcClick(Sender: TObject);
begin

WinExec('C:\windows\calc.exe',1 );  // Executa Aplicación

end;

procedure TFLetras.dblcdCnpEgrExit(Sender: TObject);
var
   xWhere : String;
begin
	DMCXP.cdsCnpEgr.SetKey;
	DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString := dblcdCnpEgr.text;
	if not DMCXP.cdsCnpEgr.Gotokey then
   begin
	   ShowMessage('Error : Código de Concepto No Existe ');
      exit;
   end;
   if DMCXP.cdsCnpEgr.FieldByname('NIVELMOV').AsString<>'S' then
   begin
	   ShowMessage( 'Error : Concepto No es de Movimiento');
      dblcdCnpEgr.SetFocus;
		Exit;
   end;

   dbeCuenta.Text := DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString;
   DMCXP.cdsCCanje.FieldByName('CJGLOSA').AsString  := DMCXP.cdsCnpEgr.FieldByName('CPTODES').AsString;
   DMCXP.cdsCCanje.FieldByName('CUENTAID').AsString := DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString;
   if length(dbeGlosa.Text) = 0 then
      DMCXP.cdsCCanje.FieldByName('DCPGLOSA').AsString := DMCXP.cdsCnpEgr.FieldByName('CPTODES').AsString;

//   xWhere := 'CuentaId='+''''+DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString+'''';
//GAR **************************************************************************
   xWhere := 'CIAID ='+QuotedStr(dblcCia.Text)
            +' and CUENTAID ='+QuotedStr(DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString);
   if length(BuscaQry('PrvTGE','TGE202','CUENTAID, CTA_PRES, CTA_ME', xWhere, 'CUENTAID'))>0 then
   begin
      if DMCXP.cdsQry.fieldbyname('CTA_PRES').Value='S' then
      begin
         dblcdPresup.Enabled  := True;
         dblcdPresup.TabOrder := 9;
         dblcdPresup.SetFocus;
         end
      else
      begin
         DMCXP.cdsDetCxP.Edit;
         DMCXP.cdsDetCxP.FieldByName('PARPRESID').AsString:='';
         dblcdPresup.Enabled := False;
         dbeGlosa.SetFocus;
      end;
   end
   else
   begin
      ShowMessage('Cuenta Contable NO existe para la Compañía indicada');
      dblcdCnpEgr.SetFocus;
      exit;
//			Raise Exception.Create('No tiene Cuenta Contable');
   end;
//GAR***************************************************************************
end;

procedure TFLetras.dblcTMonExit(Sender: TObject);
Var
   xWhere,xTipo : String;
begin

	 xWhere := 'TMONID='+''''+dblcTMon.Text+'''' ;
	 //CARLOS 04/03/2002
//           + ' and (TMON_LOC='+''''+'L'+''''+' OR TMON_LOC='+''''+'E'+''''+')';

   edtTMon.Text:=BuscaQry('PrvTGE','TGE103','TMONDES,TMON_LOC',xWhere,'TMONDES');


   if length(edtTMon.Text)=0 then
   begin
      ShowMessage('Falta Tipo de Moneda');
      dblcTMon.SetFocus;
      exit;
   end;

   //CIM 24/06/2002
   xTipo:=DMCXP.cdsQry.FieldByName('TMON_LOC').AsString;

   if (xTipo='L') then
      xWhere:='TMonId='+''''+DMCXP.wTMonExt+''''+' and '
             +'Fecha='+DMCXP.wRepFuncDate+''''+ FormatDateTime(DMCXP.wFormatFecha,dbdtpFComp.Date)+''''+')'
   else
      xWhere:='TMonId='+''''+dblcTMon.Text+''''+' and '
             +'Fecha='+DMCXP.wRepFuncDate+''''+ FormatDateTime(DMCXP.wFormatFecha,dbdtpFComp.Date)+''''+')';

{	 xWhere:='TMONID='+''''+dblcTMon.text+''''+' and '
					+'FECHA='''+ FORMATDATETIME(DMCXP.wFormatFecha,dbdtpFComp.Date)+''' ';}
	 if length(BuscaQry('PrvTGE','TGE107','*',xWhere,'TMONID'))>0 then
   begin
	  		xxTCambio:=DMCXP.cdsQry.fieldbyname('TCAM'+DMCXP.wVRN_TipoCambio).AsFloat;
        if (xTipo<>'L') and (xTipo<>'E') then begin
            xWhere:='TMonId='+''''+DMCXP.wTMonExt+''''+' and '
                   +'Fecha='+DMCXP.wRepFuncDate+''''+ FormatDateTime(DMCXP.wFormatFecha,dbdtpFComp.Date)+''''+')';
            if length(BuscaQry('PrvTGE','TGE107','*',xWhere,'TMONID'))>0 then
               xxTCamDol:=DMCXP.cdsQry.fieldbyname('TCam'+DMCXP.wVRN_TipoCambio).AsFloat
            else begin
               ShowMessage( ' Error :  Fecha No tiene Tipo de Cambio Dolares' );
               dbdtpFComp.SetFocus;
               Exit;
            end;
        end;

   end
	 else
   begin
			dbdtpFComp.SetFocus;

			Raise Exception.Create( ' Error :  Fecha No tiene Tipo de Cambio ' );
	 end;
   //*
	 dbeTCLet.Text := floattostr(FRound(xxTCambio,7,3));
	 DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsFloat := FRound(xxTCambio,7,3);
   DMCXP.cdsCCanje.fieldbyname('CPTCAMDOL').AsFloat := FRound(xxTCamDol,7,3);

   if Length(dbeTCLet.Text)>0 then begin
      DMCXP.cdsLetras.First;
      If (DMCXP.cdsLetras.FieldByName('TMONID').AsString <> dblcTMon.Text) then begin
         While not DMCXP.cdsLetras.eof do begin
            DMCXP.cdsLetras.Edit;
            DMCXP.cdsLetras.FieldByName('TMONID').AsString     := dblcTMon.Text;
            If DMCXP.cdsLetras.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then begin
               DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
               DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat,15,2 );
               DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
               DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
               DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat,15,2 );
               end
            Else begin
               DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat,15,2 );
               DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
               DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
               DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat,15,2 );
               DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            end;
            DMCXP.cdsLetras.Next;
         end;
         DMCXP.cdsLetras.First;
      end;
   end;

end;

procedure TFLetras.bbtnCancelaClick(Sender: TObject);
begin

   DMCXP.cdsMovCxP.CancelUpdates;
   DMCXP.cdsCanje.CancelUpdates;
   DMCXP.cdsLetras.CancelUpdates;

   EstadoDeForma(0,DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString, ' ' );
end;

procedure TFLetras.dbdtpFCompExit(Sender: TObject);
Var
   xWhere, xMes   : String;
   xFCierre : TDate;
   wAno, wMes, wDia: Word;
begin
	 if xControlFec(dblcCia.Text, dbdtpFComp.Date) = False then
	 begin
			dbdtpFEmis.SetFocus;
			Exit;
	 end;

  //CIM 24/06/2002

	 DMCXP.cdsCCanje.FieldByName('CJFCOMP').AsDateTime := dbdtpFComp.date;

	 DecodeDate(dbdtpFComp.Date, wAno, wMes, wDia);
	 if wMes<10 then xMes:='0'+inttostr(wMes) else xMes:=inttostr(wMes);

	 DMCXP.cdsCCanje.FieldByName('CJAAMM').AsString:= IntToStr(wAno)+xMes;
	 DMCXP.cdsCCanje.FieldByName('CJAA').AsString:=DMCXP.DisplayDescrip('TGE114','FECANO','FECHA',FormatDateTime(DMCXP.wFormatFecha,DMCXP.CdsCCanje.FieldByName('CJFCOMP').AsDateTime) ) ;

	 if length(DMCXP.cdsCCanje.FieldByName('CJAA').AsString) > 0 then
	 begin
			DMCXP.cdsCCanje.FieldByName('CJMM').AsString   := DMCXP.cdsUltTge.FieldByName('FECMES').AsString;    // mes
			DMCXP.cdsCCanje.FieldByName('CJDD').AsString   := DMCXP.cdsUltTge.FieldByName('FecDia').AsString;    // día
			DMCXP.cdsCCanje.FieldByName('CJTRI').AsString  := DMCXP.cdsUltTge.FieldByName('FecTrim').AsString;   // trimestre
			DMCXP.cdsCCanje.FieldByName('CJSEM').AsString  := DMCXP.cdsUltTge.FieldByName('FecSem').AsString;    // semestre
			DMCXP.cdsCCanje.FieldByName('CJSS').AsString   := DMCXP.cdsUltTge.FieldByName('FecSS').AsString;     // semana
			DMCXP.cdsCCanje.FieldByName('CJAATRI').AsString:= DMCXP.cdsUltTge.FieldByName('FecAATri').AsString;  // año+trimestre
			DMCXP.cdsCCanje.FieldByName('CJAASEM').AsString:= DMCXP.cdsUltTge.FieldByName('FecAASem').AsString;  // año+semestre
			DMCXP.cdsCCanje.FieldByName('CJAASS').AsString := DMCXP.cdsUltTge.FieldByName('FecAASS').AsString;   // año+semana
	 end;
//   xWhere:='CIAID='''+dblcCia.Text+''' and TDIARID='''+dblcTDiario.Text+''' and DCPANOMM='''+DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString+'''';
//   DMCXP.cdsCCanje.FieldByName('DCPLOTE').AsString:=DMCXP.BuscaUltTGE('PrvUltCxP','CXP302','DCPLOTE',xWhere);
//   DMCXP.cdsCCanje.FieldByName('DCPLOTE').AsString:=Strzero(DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString, DMCXP.cdsDetCxP.FieldByName('DCPLOTE').DisplayWidth);

end;

procedure TFLetras.dbgDocCanjeColExit(Sender: TObject);
begin
   if DMCXP.cdsCCanje.fieldbyname('CJESTADO').AsString='P' then exit;
   if dbgDocCanje.SelectedField.FieldName='CCPTCCJE' then begin
      DMCXP.cdsCanje.Edit;
      WITH DMCXP DO BEGIN
         If wTMonLoc=DMCXP.cdsCanje.FieldByName('TMONID').AsString then
         begin
            cdsCanje.FieldByName('CPSALEXT').AsFloat := FRound( cdsCanje.FieldByName('CPSALLOC').AsFloat/cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
            cdsCanje.FieldByName('CCPMOEXT').AsFloat := FRound( cdsCanje.FieldByName('CCPMOLOC').AsFloat/cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
         end
         else begin
            cdsCanje.FieldByName('CPSALLOC').AsFloat := FRound( cdsCanje.FieldByName('CPSALEXT').AsFloat*cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
            cdsCanje.FieldByName('CCPMOLOC').AsFloat := FRound( cdsCanje.FieldByName('CCPMOEXT').AsFloat*cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
         end;
      END;
      dbgDocCanje.RefreshDisplay;
   end;

   if dbgDocCanje.SelectedField.FieldName='CCPMOLOC' then begin
      if ( DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat>DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat ) or
         ( DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat<0 ) then begin

         if DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat > DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat then
            ShowMessage(' Error :  Monto excede a Saldo Actual ')
         else
            ShowMessage(' Error :  Monto Debe Ser Mayor a Cero ');

         DMCXP.cdsCanje.Edit;
         DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat:=DMCXP.cdsCanje.FieldByName('CJEANTMN').AsFloat;
         if DMCXP.cdsCanje.fieldbyname('TMONID').AsString= DMCXP.wTmonLoc then
            DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat
         else
            if DMCXP.cdsCanje.fieldbyname('TMONID').AsString= DMCXP.wTmonExt   then
               DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;

         DMCXP.cdsCanje.Post;
         dbgDocCanje.SelectedIndex:=8; // debería ser 9 pero no hace caso
         dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
         end
      else begin
         DMCXP.cdsCanje.Edit;
         DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat := FRound( DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
         if DMCXP.cdsCanje.fieldbyname('TMONID').AsString= DMCXP.wTmonLoc then
            DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat
         else
            if DMCXP.cdsCanje.fieldbyname('TMONID').AsString= DMCXP.wTmonExt   then
               DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;

         bbtnSumatClick(Sender);
      end;
   end;

   if dbgDocCanje.SelectedField.FieldName='CCPMOEXT' then begin
      if ( DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat > DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat ) or
         ( DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat < 0 ) then begin

         if DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat > DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat then
            ShowMessage('Monto excede a Saldo Actual')
         else
            ShowMessage(' Error :  Monto Debe Ser Mayor a Cero ');

         DMCXP.cdsCanje.Edit;
         DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat:=DMCXP.cdsCanje.FieldByName('CJEANTME').AsFloat;
         if DMCXP.cdsCanje.fieldbyname('TMONID').AsString= DMCXP.wTmonLoc then
            DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat
         else
            if DMCXP.cdsCanje.fieldbyname('TMONID').AsString= DMCXP.wTmonExt   then
               DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
         
         DMCXP.cdsCanje.Post;
         dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
         dbgDocCanje.SelectedIndex:=10; // debería ser 9 pero no hace caso
         end
      else begin
         DMCXP.cdsCanje.Edit;
         DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat := FRound( DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
         if DMCXP.cdsCanje.fieldbyname('TMONID').AsString= DMCXP.wTmonLoc then
            DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat
         else
            if DMCXP.cdsCanje.fieldbyname('TMONID').AsString= DMCXP.wTmonExt   then
               DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
         
         bbtnSumatClick(Sender);
      end;
   end;
end;

procedure TFLetras.dbdtpFEmisExit(Sender: TObject);
begin

   DMCXP.cdsCCanje.FieldByName('CJFCOMP').AsDateTime := DMCXP.cdsCCanje.FieldByName('CJFCANJE').AsDateTime
end;

procedure TFLetras.Z2bbtnContabClick(Sender: TObject);
var
	 xRegAct : TBookMark;
  XtABLA : sTRING;
begin
	 if DMCXP.MesCerrado(copy(xAnomes,5,2),copy(xAnomes,1,4),dblcCia.text) then
	 begin
			ShowMessage(' Mes cerrado, no se puede contabilizar');
			exit;
	 end;

	 if not LetrasAceptadas then Raise exception.Create(' Error :  Falta Aceptar Canje ');
	 if not AsientoCuadra   then Raise exception.Create(' Error :  Asiento No Cuadra ');

	 if MessageDlg( 'Contabiliza Canje de Letras' + chr(13)+
									'       ¿Esta Seguro?       ',mtConfirmation,[mbYes, mbNo],0)=mrNo then
			exit;


	 If not GeneraAsientoCanje() then Raise exception.Create('Error Generando Asiento Contable');

	 DMCXP.cdsDetCxP.DataRequest('Select * from CXP302' );
	 DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DetCxP' );
	 xTabla:='CNT311';

	 DMCXP.GeneraContab( dblcCia.Text, dblcTDiario.Text, DMCXP.cdsLetras.FieldByName('CPANOMES').AsString, '0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString, Self, 'C' );

	 DMCXP.cdsLetras.DisableControls;
	 xRegAct := DMCXP.cdsLetras.GetBookmark;
	 DMCXP.cdsLetras.First;
	 While not DMCXP.cdsLetras.Eof do Begin

			DMCXP.cdsLetras.Edit;
			DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString := 'S';
			cdsPost( DMCXP.cdsLetras );
			DMCXP.cdsLetras.Next;
	 end;
	 DMCXP.AplicaDatos( DMCXP.cdsLetras, 'Letras' );
	 DMCXP.cdsCCanje.Edit;
	 DMCXP.cdsCCanje.fieldbyname('CJ_CONTA').AsString:='S';
	 DMCXP.cdsCCanje.fieldbyname('CJUSER').AsString  :=DMCXP.wUsuario;
	 DMCXP.cdsCCanje.fieldbyname('CJFREG').Value     :=Date;
	 DMCXP.cdsCCanje.fieldbyname('CJFHOR').Value     :=Time;
	 DMCXP.AplicaDatos( DMCXP.cdsCCanje, 'CCanje' );

	 FiltraCanje;

	 DMCXP.cdsLetras.GotoBookmark(xRegAct);
	 DMCXP.cdsLetras.FreeBookmark(xRegAct);
	 DMCXP.cdsLetras.EnableControls;

	 EstadoDeForma( 1, DMCXP.cdsCCanje.FieldByName('CJESTADO').AsString, DMCXP.cdsCCanje.FieldByName('CJ_CONTA').AsString );

	 ShowMessage('Registro Contabilizado');
end;

function TFLetras.GeneraAsientoCanje: Boolean;
var
	 xRegAct : TBookMark;
	 XfILTRO,xWhere : sTRING;
   xTDebe, xTHaber, xDifFinal : double;
begin

	 xFiltro:='CIAID='''   +dblcCia.Text +''''+' and '+
						'TDIARID=''' +dblcTDiario.Text+''''+' and '+
						'DCPANOMM='''+DMCXP.cdsccANJE.FieldByName('CJAAMM').AsString+''' and '+
						'CPNOREG=''' +'0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString+'''';
	 Filtracds( DMCXP.cdsDetCxP,'Select * from CXP302 Where '+xFiltro );

	 DMCXP.cdsDetCxP.First;

	 DMCXP.cdsCanje.IndexFieldNames    :='CIAID;TCANJEID;CCPCANJE;DOCID;CPSERIE;CPNODOC';
	 DMCXP.cdsDetCxP.DisableControls;
	 DMCXP.cdsDetCxP.First;
	 xGlosa    := DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString;
	 xLote     := dbeLote.Text;
	 xCuenta   := dbeCuenta.Text;
	 xPresup   := dblcdPresup.Text;
	 xConcepto := dblcdCnpEgr.Text;

	 while (not DMCXP.cdsDetCxP.Eof) and (DMCXP.cdsDetCxP.RecordCount>0) do begin
			DMCXP.cdsDetCxP.Delete;
	 end;

	 DMCXP.cdsDetCxP.First;
	 DMCXP.cdsLetras.DisableControls;
	 xRegAct := DMCXP.cdsLetras.GetBookmark;

	 numreg:=0;

	 GrabaContabilidadDocumentos;
   //CIM 21/06/2002
   //Genera Cuenta puente de Retencion
   if DMCXP.cdsCCanje.FieldByName('MTORETIGV').AsFloat>0 then
      GrabaContabilidadRetencion;
   //*

	 DMCXP.cdsLetras.First;
	 While not DMCXP.cdsLetras.Eof do
	 begin

			GrabaContabilidadLetra;

			DMCXP.cdsLetras.Next;
	 end;

// Aqui se debe Generar la diferencia de Cambio Final del Canje
// se debe considerar los documentos a canjear la cuenta puente de retención y las letras
   xTDebe := 0;
   xTHaber := 0;

   xDifCam  := 0;
   xDifCLoc := 0;
   xDifCExt := 0;

   xWhere:='CIAID='''+dblcCia.Text+''' and CTA_DIFC=''P'' ';
	 DMCXP.wDifAjuP:=DMCXP.DisplayDescrip2('dspTGE','TGE202','CUENTAID', xWhere, 'CUENTAID');
   xWhere:='CIAID='''+dblcCia.Text+''' and CTA_DIFC=''G'' ';
	 DMCXP.wDifAjuG:=DMCXP.DisplayDescrip2('dspTGE','TGE202','CUENTAID', xWhere, 'CUENTAID');

   DMCXP.cdsLetras.First;
   DMCXP.cdsDetCxP.First;
   while not DMCXP.cdsDetCxP.EOF do
   begin
      if DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString='D' then
         xTDebe := xTDebe+FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat,15,2)
      else
         xTHaber := xTHaber+FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat,15,2);
      DMCXP.cdsDetCxP.Next;
   end;

   if abs(xTDebe-xTHaber)>0 then
   begin
      xDifFinal := FRound(xTDebe-xTHaber,15,2);
      if xDifFinal>0 then
      begin
         // Ganancia por diferencia de Cambio
         if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
         begin
            xDifCam  := FRound(xDifFinal,15,2);
            xDifCLoc := FRound(xDifFinal,15,2);
         end
         else
         begin
            xDifCam  := FRound(xDifFinal,15,2);
            xDifCExt := FRound(xDifFinal,15,2);
         end;
         DMCXP.cdsDetCxP.Insert;
         DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsLetras.FieldByName('CIAID').AsString;
         DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := DMCXP.cdsLetras.FieldByName('TCANJEID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := DMCXP.cdsLetras.FieldByName('CPCANJE').AsString;
         DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsLetras.FieldByName('TDIARID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := '0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := Copy(DMCXP.cdsLetras.FieldByName('CPANOMES').AsString,1,4);
         DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsLetras.FieldByName('CPANOMES').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := xLote;
         DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
         xCtaDif  := DMCXP.wDifAjuG;
         xGloDif  := 'Ganancia - Ajuste por Dif. de Cambio';
         xDH      := 'H';
         DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xCtaDif;
         DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
         DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsCCanje.FieldByName('PROV').AsString;
         DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsCCanje.FieldByName('DOCID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := '0000';
         DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsCCanje.FieldByName('CANJE').AsString;;
         DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGloDif;
         DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := xDH;
         DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsFloat;
         if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
         begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := FRound(xDifCam,15,2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(xDifCam,15,2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := 0;
         end
         else
         begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := FRound(xDifCam,15,2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := 0;
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound(xDifCam,15,2);
         end;
         DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime:= DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:= DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime;
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
         NUMREG:=NUMREG+1;
         DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger:=NUMREG;
         DetCxPUsuario;  // Graba Usuario, Fecha y Hora
         cdsPost( DMCXP.cdsDetCxP );
      end
      else
      begin
      // Pérdida por Diferencia de Cambio
         if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
         begin
            xDifCam  := FRound(xDifFinal,15,2);
            xDifCLoc := FRound( (-1)*(xDifFinal),15,2);
         end
         else
         begin
            xDifCam  := FRound(xDifFinal ,15,2);
            xDifCExt := FRound( (-1)*(xDifFinal),15,2);
         end;
         DMCXP.cdsDetCxP.Insert;
         DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsLetras.FieldByName('CIAID').AsString;
         DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := DMCXP.cdsLetras.FieldByName('TCANJEID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := DMCXP.cdsLetras.FieldByName('CPCANJE').AsString;
         DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsLetras.FieldByName('TDIARID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := '0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := Copy(DMCXP.cdsLetras.FieldByName('CPANOMES').AsString,1,4);
         DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsLetras.FieldByName('CPANOMES').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := xLote;
         DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
				 xCtaDif  := DMCXP.wDifAjuP;
				 xGloDif  := 'Perdida - Ajuste por Dif. de Cambio';
				 xDH      := 'D';
         DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xCtaDif;
         DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
         DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsCCanje.FieldByName('PROV').AsString;
         DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsCCanje.FieldByName('DOCID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := '0000';
         DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsCCanje.FieldByName('CANJE').AsString;;
         DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGloDif;
         DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := xDH;
         DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsFloat;
         if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
         begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := FRound(xDifCLoc,15,2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(xDifCLoc,15,2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := 0;
         end
         else
         begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := FRound(xDifCExt,15,2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(xDifCExt,15,2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := 0;
         end;
         DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime  := DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime := DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime;
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
         NUMREG:=NUMREG+1;
         DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger:=NUMREG;
         DetCxPUsuario;  // Graba Usuario, Fecha y Hora
         cdsPost( DMCXP.cdsDetCxP );
      end;
   end;

	 DMCXP.cdsLetras.GotoBookmark(xRegAct);
	 DMCXP.cdsLetras.FreeBookmark(xRegAct);
	 DMCXP.cdsLetras.EnableControls;

	 DMCXP.cdsCanje.EnableControls;
	 DMCXP.cdsDetCxP.First;
	 DMCXP.cdsDetCxP.EnableControls;

	 DMCXP.cdsCanje.IndexFieldNames    :='CIAID;TCANJEID;CCPCANJE;TDIARID;CCPANOMM;CPNOREG';
	 Result := True;
end;

procedure TFLetras.GeneraDiferenciaCambio;
var
   xWhere : String;
begin
   xDifCLoc:=0;
   xDifCExt:=0;

   xWhere:='CIAID='''+dblcCia.Text+''' and CTA_DIFGP=''P'' ';
   DMCXP.wDifAjuP:=DMCXP.DisplayDescrip2('dspTGE','TGE202','CUENTAID', xWhere, 'CUENTAID');
   xWhere:='CIAID='''+dblcCia.Text+''' and CTA_DIFGP=''G'' ';
   DMCXP.wDifAjuG:=DMCXP.DisplayDescrip2('dspTGE','TGE202','CUENTAID', xWhere, 'CUENTAID');

   if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then begin
      xPagAnt := FRound( DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat,15,2);
      If DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat < xPagAnt then begin
	 xDifCam  := FRound( xPagAnt-DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat, 15, 2 );
	 xDifCLoc := FRound( (-1)*(xPagAnt-DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat), 15, 2 );
{	 xCtaDif  := DMCXP.wDifAjuP;
	 xGloDif  := 'Perdida - Ajuste por Dif. de Cambio';
	 xDH      := 'D'}
	 xCtaDif  := DMCXP.wDifAjuG;
	 xGloDif  := 'Ganancia - Ajuste por Dif. de Cambio';
	 xDH      := 'H'
      end
      else begin
	 xDifCam  := FRound( DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat-xPagAnt, 15, 2 );
	 xDifCLoc := FRound( (-1)*(DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat-xPagAnt), 15, 2 );
{	 xCtaDif  := DMCXP.wDifAjuG;
	 xGloDif  := 'Ganancia - Ajuste por Dif. de Cambio';
	 xDH      := 'H'}
	 xCtaDif  := DMCXP.wDifAjuP;
	 xGloDif  := 'Perdida - Ajuste por Dif. de Cambio';
	 xDH      := 'D'
      end;
   end
   else begin
      xPagAnt := FRound( DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat,15,2);
      If DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat < xPagAnt then begin
      	 xDifCam  := FRound( DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat - xPagAnt,15,2);
      	 xDifCExt := FRound( (-1)*(DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat - xPagAnt),15,2);
{     	 xCtaDif  := DMCXP.wDifAjuP;
      	 xGloDif  := 'Perdida - Ajuste por Dif. de Cambio';
      	 xDH      := 'D'}
      	 xCtaDif  := DMCXP.wDifAjuG;
      	 xGloDif  := 'Ganancia - Ajuste por Dif. de Cambio';
      	 xDH      := 'H'
      	 end
      else begin
      	 xDifCam  := xPagAnt - DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
      	 xDifCExt := xPagAnt - DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
{     	 xCtaDif  := DMCXP.wDifAjuG;
      	 xGloDif  := 'Ganancia - Ajuste por Dif. de Cambio';
      	 xDH      := 'H'}
      	 xCtaDif  := DMCXP.wDifAjuP;
      	 xGloDif  := 'Perdida - Ajuste por Dif. de Cambio';
      	 xDH      := 'D'
      end;
   end;
end;


procedure TFLetras.GrabaContabilidadDocumentos;
var
	 xfiltro : string;
begin

	 DMCXP.cdsCanje.First;
	 while not DMCXP.cdsCanje.Eof do begin

      xDifCLoc:=0;
      xDifCExt:=0;
			if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
				 GeneraDiferenciaCambio;

			DMCXP.cdsDetCxP.Insert;
			DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsCCanje.fieldbyname('CIAID').AsString;
			DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := DMCXP.cdsCCanje.fieldbyname('TCANJEID').AsString;
			DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := DMCXP.cdsCCanje.fieldbyname('CANJE').AsString;
			DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsCCanje.FieldByName('TDIARID').AsString;
			DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := '0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsCCanje.FieldByName('CJAAMM').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := DMCXP.cdsCCanje.FieldByName('CJAA').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := xLote;
			DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
			DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := DMCXP.cdsCanje.FieldByName('CTATOTAL').AsString;
			DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   := DMCXP.cdsCanje.FieldByName('CPTOTOT').AsString;
			DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
			DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsCanje.FieldByName('PROV').AsString;
			DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsCanje.FieldByName('DOCID').AsString;
			DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := DMCXP.cdsCanje.FieldByName('CPSERIE').AsString;
			DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := dbeGlosa.Text;

			if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
					DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat
			else begin
					DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
			end;
			DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := FRound(DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat + xDifCLoc,15,2);
			DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := FRound(DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat + xDifCExt,15,2);

			xFiltro:='Select * from TGE110 where DOCMOD=''CXP'' AND DOCID='''+DMCXP.cdsCanje.FieldByName('DOCID').AsString+'''';
			DMCXP.cdsQry.Close;
			DMCXP.cdsQry.DataRequest( xFiltro );
			DMCXP.cdsQry.Open;

			if DMCXP.cdsQry.FieldByName('DOCRESTA').AsString='S' then begin
				 DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString  := 'H';
				 DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat*-1;
				 DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat*-1;
				 DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat*-1;
			end
			else begin
				 DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString  := 'D';
			end;

			DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := TRIM(DMCXP.cdsQry.FieldByname('DOCDES').AsString)+' '+DMCXP.cdsCanje.FieldByName('CPSERIE').AsString+' '+DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;

			DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat;
			DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := DMCXP.cdsCanje.FieldByName('TMONID').AsString;

			DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime:= DMCXP.cdsCanje.FieldByName('CPFEMIS').AsDateTime;

			DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:=DMCXP.cdsCanje.FieldByName('CPFVCMTO').AsDateTime;
			DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime:= dbdtpFComp.Date;
			DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'P';
			DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString    := DMCXP.cdsLetras.FieldByName('CPMM').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString    := DMCXP.cdsLetras.FieldByName('CPDD').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString   := DMCXP.cdsLetras.FieldByName('CPTRI').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString   := DMCXP.cdsLetras.FieldByName('CPSEM').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString    := DMCXP.cdsLetras.FieldByName('CPSS').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString := DMCXP.cdsLetras.FieldByName('CPAATRI').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString := DMCXP.cdsLetras.FieldByName('CPAASEM').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString  := DMCXP.cdsLetras.FieldByName('CPAASS').AsString;
			NUMREG:=NUMREG+1;
			DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger:=NUMREG;
			DetCxPUsuario;  // Graba Usuario, Fecha y Hora
			cdsPost( DMCXP.cdsDetCxP );

			if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
				 GrabaDiferenciaCambio;

			DMCXP.cdsCanje.Next;
	 end;


{

///////////////
	 xFiltro := 'CIAID='   +''''+dblcCia.Text +''''+' and '+
							'TCANJEID='+''''+'LE'         +''''+' and '+
							'CCPCANJE='+''''+edtCanje.text+''''+' and '+
							'DOCID2='  +''''+DMCXP.cdsLetras.FieldByName('DOCID').AsString  +''''+' and '+
							'CPSERIE2='+''''+DMCXP.cdsLetras.FieldByName('CPSERIE').AsString+''''+' and '+
							'CPNODOC2='+''''+DMCXP.cdsLetras.FieldByName('CPNODOC').AsString+'''';
	 Filtracds( DMCXP.cdsDetCanje,'Select * from CXP305 Where '+xFiltro );

	 DMCXP.cdsDetCanje.First;
	 while not DMCXP.cdsDetCanje.Eof do begin
			DMCXP.cdsCanje.SetKey;
			DMCXP.cdsCanje.FieldByName('CIAID').AsString    := DMCXP.cdsLetras.FieldByName('CIAID').AsString;
			DMCXP.cdsCanje.FieldByName('TCANJEID').AsString := DMCXP.cdsLetras.FieldByName('TCANJEID').AsString;
			DMCXP.cdsCanje.FieldByName('CCPCANJe').AsString := DMCXP.cdsLetras.FieldByName('CPCANJE').AsString;
			DMCXP.cdsCanje.FieldByName('DOCID').AsString    := DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
			DMCXP.cdsCanje.FieldByName('CPSERIE').AsString  := DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString;
			DMCXP.cdsCanje.FieldByName('CPNODOC').AsString  := DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString;
			if DMCXP.cdsCanje.GotoKey then begin
				 GeneraDiferenciaCambio;
				 DMCXP.cdsDetCxP.Insert;
				 DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsLetras.FieldByName('CIAID').AsString;
				 DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := DMCXP.cdsLetras.FieldByName('TCANJEID').AsString;
				 DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := DMCXP.cdsLetras.FieldByName('CPCANJE').AsString;
				 DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsLetras.FieldByName('TDIARID').AsString;
				 DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsLetras.FieldByName('CPNOREG').AsString;
				 DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsLetras.FieldByName('CPANOMEs').AsString;
				 DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := DMCXP.cdsLetras.FieldByName('CPAAAA').AsString;
				 DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := xLote;
				 DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
				 DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := DMCXP.cdsCanje.FieldByName('CTATOTAL').AsString;
				 DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   := DMCXP.cdsCanje.FieldByName('CPTOTOT').AsString;
				 DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
				 DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsCanje.FieldByName('PROV').AsString;
				 DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsCanje.FieldByName('DOCID').AsString;
				 DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := DMCXP.cdsCanje.FieldByName('CPSERIE').AsString;
				 DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
				 DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGlosa;
				 DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := 'D';
				 DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat;
				 DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := DMCXP.cdsCanje.FieldByName('TMONID').AsString;
				 if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
						DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat
				 else begin
						DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
				 end;
				 DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat + xDifCLoc,15,2);
				 DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat + xDifCExt,15,2);

				 DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime:= DMCXP.cdsCanje.FieldByName('CPFEMIS').AsDateTime;

				 DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:=DMCXP.cdsCanje.FieldByName('CPFVCMTO').AsDateTime;
				 DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime:= dbdtpFComp.Date;
				 DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'P';
				 DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString    := DMCXP.cdsLetras.FieldByName('CPMM').AsString;
				 DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString    := DMCXP.cdsLetras.FieldByName('CPDD').AsString;
				 DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString   := DMCXP.cdsLetras.FieldByName('CPTRI').AsString;
				 DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString   := DMCXP.cdsLetras.FieldByName('CPSEM').AsString;
				 DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString    := DMCXP.cdsLetras.FieldByName('CPSS').AsString;
				 DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString := DMCXP.cdsLetras.FieldByName('CPAATRI').AsString;
				 DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString := DMCXP.cdsLetras.FieldByName('CPAASEM').AsString;
				 DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString  := DMCXP.cdsLetras.FieldByName('CPAASS').AsString;
				 DetCxPUsuario;  // Graba Usuario, Fecha y Hora
				 cdsPost( DMCXP.cdsDetCxP );

				 GrabaDiferenciaCambio;

			end;
			DMCXP.cdsDetCanje.Next;
	 end;
}
end;

procedure TFLetras.GrabaDiferenciaCambio;
begin
	 If xDifCam > 0 Then begin
			DMCXP.cdsDetCxP.Insert;
			DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
			DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := DMCXP.cdsLetras.FieldByName('TCANJEID').AsString;
			DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := DMCXP.cdsLetras.FieldByName('CPCANJE').AsString;
			DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsLetras.FieldByName('TDIARID').AsString;
			DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := '0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString;
			//DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsLetras.FieldByName('CPNOREG').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsLetras.FieldByName('CPANOMES').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := Copy(DMCXP.cdsLetras.FieldByName('CPANOMES').AsString,1,4);
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
			NUMREG:=NUMREG+1;
			DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger:=NUMREG;
			DetCxPUsuario;  // Graba Usuario, Fecha y Hora
			cdsPost( DMCXP.cdsDetCxP );
	 end;
end;

procedure TFLetras.GrabaContabilidadLetra;
begin
	 DMCXP.cdsDetCxP.Insert;
	 DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsLetras.FieldByName('CIAID').AsString;
	 DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := DMCXP.cdsLetras.FieldByName('TCANJEID').AsString;
	 DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := DMCXP.cdsLetras.FieldByName('CPCANJE').AsString;

	 DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsLetras.FieldByName('TDIARID').AsString;
	 DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := '0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString;
	 DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := Copy(DMCXP.cdsLetras.FieldByName('CPANOMES').AsString,1,4);
	 DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsLetras.FieldByName('CPANOMES').AsString;
	 DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := xLote;
	 DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
	 DMCXP.cdsdetCxP.FieldByName('CPTOID').AsString   := xConcepto;
	 DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xCuenta;
	 DMCXP.cdsDetCxP.FieldByName('PARPRESID').AsString:= xPresup;
	 DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
	 DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsLetras.FieldByName('PROV').AsString;
	 DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsLetras.FieldByName('DOCID').AsString;
	 DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := '00000';
	 DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsLetras.FieldByName('CPNODOC').AsString;
	 DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := 'Letra # '+DMCXP.cdsLetras.FieldByName('CPNODOC').AsString;
	 DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := 'H';
	 DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat;
	 DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat  := DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat;
	 DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat;
	 DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat;
	 DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime:= DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime;
	 DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:=DMCXP.cdsLetras.FieldByName('CPFVCMTO').AsDateTime;
	 DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime:=dbdtpFComp.Date;
	 DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'P';
	 DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := DMCXP.cdsLetras.FieldByName('TMONID').AsString;
	 DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString    := DMCXP.cdsLetras.FieldByName('CPMM').AsString;
	 DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString    := DMCXP.cdsLetras.FieldByName('CPDD').AsString;
	 DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString   := DMCXP.cdsLetras.FieldByName('CPTRI').AsString;
	 DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString   := DMCXP.cdsLetras.FieldByName('CPSEM').AsString;
	 DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString    := DMCXP.cdsLetras.FieldByName('CPSS').AsString;
	 DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString := DMCXP.cdsLetras.FieldByName('CPAATRI').AsString;
	 DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString := DMCXP.cdsLetras.FieldByName('CPAASEM').AsString;
	 DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString  := DMCXP.cdsLetras.FieldByName('CPAASS').AsString;
	 NUMREG:=NUMREG+1;
	 DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger:=NUMREG;
	 DetCxPUsuario;  // Graba Usuario, Fecha y Hora
	 cdsPost( DMCXP.cdsDetCxP );

end;

Function TFLetras.AsientoCuadra:Boolean;
var
	 xRegAct : TBookMark;
	 xTPagLoc, xTPagExt  : double;
	 xTLetOri, xTLetLoc, xTLetExt : double;
   //CIM 17/06/2002
   xMtoRet : double;
begin
	 Result := False;

// CIM 17/06/2002
   xRetIGV := DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat;
   if dblcTMon.Text= DMCXP.wTMonExt then
//      xMtoRet:=xRetIGV*FRound(strtofloat(dbeTCLet.Text),8,3)
//      xMtoRet:=FRound(xRetIGV/strtofloat(dbeTCLet.Text),8,2)
      xMtoRet:=FRound(xRetIGV,8,2)
   else
      if dblcTMon.Text= DMCXP.wTMonLoc then
         xMtoRet:=xRetIGV;
   //*

	 DMCXP.cdsMovCxP.DisableControls;
	 DMCXP.cdsMovCxP.Filtered:=False;
	 DMCXP.cdsCanje.DisableControls;
	 xRegAct  := DMCXP.cdsCanje.GetBookmark;
	 xTPagLoc := 0; xTPagExt := 0;
	 DMCXP.cdsCanje.First;
	 While not DMCXP.cdsCanje.Eof do Begin
			xTPagLoc := xTPagLoc + FRound(DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
      xTPagExt := xTPagExt + FRound(DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2);
      DMCXP.cdsCanje.Next;
   end;
   DMCXP.cdsCanje.GotoBookmark(xRegAct);
   DMCXP.cdsCanje.FreeBookmark(xRegAct);
   DMCXP.cdsCanje.EnableControls;
   DMCXP.cdsMovCxP.Filtered:=True;
   DMCXP.cdsMovCxP.EnableControls;

   // Totales de Letras por Pagar
   DMCXP.cdsLetras.DisableControls;
	 xRegAct  := DMCXP.cdsLetras.GetBookmark;
   xTLetOri := 0; xTLetLoc := 0; xTLetExt := 0;
   DMCXP.cdsLetras.First ;
   while not DMCXP.cdsLetras.Eof do
   begin
      xTLetOri := xTLetOri + FRound(DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
      xTLetLoc := xTLetLoc + FRound(DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat,15,2);
      xTLetExt := xTLetExt + FRound(DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat,15,2);
      DMCXP.cdsLetras.Next;
   end;

   If DMCXP.cdsLetras.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then begin
//      If FRound(xTLetLoc,15,2)=FRound(xTPagLoc,15,2) then
      If FRound(xTLetLoc,15,2)=FRound(xTPagLoc-xMtoRet,15,2) then
         Result := True;
      end
   Else begin
      If DMCXP.cdsLetras.FieldByName('TMONID').AsString=DMCXP.wTMonExt then begin
//         If FRound(xTLetExt,15,2)=FRound(xTPagExt,15,2) then
         If FRound(xTLetExt,15,2)=FRound(xTPagExt-xMtoRet,15,2) then
            Result := True
			end
			//carlos 04/03/2002
			else
			begin
				 If FRound(xTLetLoc,15,2)=FRound(xTPagLoc,15,2) then
				 Result := True;
      end;
   end;
   DMCXP.cdsLetras.GotoBookmark(xRegAct);
	 DMCXP.cdsLetras.FreeBookmark(xRegAct);
   DMCXP.cdsLetras.EnableControls;
end;

procedure TFLetras.dbgLetrasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgLetras.BeginDrag(False);
end;

procedure TFLetras.dbeTCLetExit(Sender: TObject);
begin
   if length(dbeTCLet.Text)=0 then
   begin
      ShowMessage('Falta Tipo de Cambio');
      dbeTCLet.SetFocus;
      exit;
   end;

   dbeTCLet.Text:=floattostr(strtofloat(dbeTCLet.Text));
   if strtofloat(dbeTCLet.Text)<0 then
   begin
      ShowMessage('Tipo de Cambio debe ser Mayor a 0');
      dbeTCLet.Text:='';
      dbeTCLet.SetFocus;
      exit;
   end;
	 DMCXP.cdsLetras.First;
   If FRound(DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat,8,3)<>FRound(strtofloat(dbeTCLet.Text),8,3) then
   begin
      While not DMCXP.cdsLetras.eof do
      begin
         DMCXP.cdsLetras.Edit;
         DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat := FRound(strtofloat(dbeTCLet.Text),8,3);
         DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat := FRound(strtofloat(dbeTCLet.Text),8,3);
         If DMCXP.cdsLetras.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then begin
            DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat,15,2 );
            DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat,15,2 );
            end
         Else begin
            DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat,15,2 );
            DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat,15,2 );
            DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
         end;
         DMCXP.cdsLetras.Next;
      end;
      DMCXP.cdsLetras.First;
   end;
end;

procedure TFLetras.bbtnBorraClick(Sender: TObject);
var
   xNumReg : Integer;
begin
   xNumReg := DMCXP.cdsDetCxP.RecordCount;

   DMCXP.cdsLetras.CancelUpdates;
   DMCXP.cdsDetCxP.CancelUpdates;
   DMCXP.cdsMovCxP.CancelUpdates;
   DMCXP.cdsCanje.CancelUpdates;
   DMCXP.cdsDetCanje.CancelUpdates;

   If ( DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString='I' ) or
      ( Length(DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString)=0 ) then begin
      If DMCXP.wModo='A' then begin
         if DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString='' then begin
            InicializaClientDataSet;
            dblcCia.Enabled  := True;
            edtCanje.Enabled := True;
            EstadoDeForma( 0, ' ', ' ' );
            InicializaCampos;
            InicializaDatos;
            dblcCia.SetFocus;
            Exit;
         end;
         if xNumReg>DMCXP.cdsDetCxP.RecordCount then begin
						InicializaClientDataSet;
            dblcCia.Enabled  := True;
            edtCanje.Enabled := True;
            EstadoDeForma( 0, ' ', ' ' );
            InicializaCampos;
            InicializaDatos;
            dblcCia.SetFocus;
         end
         else begin
            dblcTDoc.Text   := DMCXP.cdsDetCxP.FieldByName('DOCID').AsString;
            dblcTDiario.Text:= DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString;
            edtTDoc.Text    := DMCXP.DisplayDescrip('TGE110','DOCDES',  'DOCID',  dblcTDoc.Text);
            edtTDiario.Text := DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);
            edtTMon.Text    := DMCXP.DisplayDescrip('TGE103','TMONDES', 'TMONID', dblcTMon.Text);
            EstadoDeForma(0,DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString,' ' );
            dbdtpFEmis.SetFocus;
         end
         end
      else begin
         dblcTDoc.Text   := DMCXP.cdsDetCxP.FieldByName('DOCID').AsString;
         dblcTDiario.Text:= DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString;
         edtTDoc.Text    := DMCXP.DisplayDescrip('TGE110','DOCDES',  'DocID',  dblcTDoc.Text);
         edtTDiario.Text := DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);
         edtTMon.Text    := DMCXP.DisplayDescrip('TGE103','TMONDES', 'TMonID', dblcTMon.Text);
         EstadoDeForma(0,DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString,' ' );
         dbdtpFEmis.SetFocus;
      end;
	 end;
   // Cancela todas las modificaciones en los
end;

procedure TFLetras.bbtnRegresaClick(Sender: TObject);
begin
   EstadoDeForma(0, DMCXP.cdsCCanje.fieldbyname('CJESTADO').AsString, ' ' );
end;

procedure TFLetras.Z2bbtnNuevoClick(Sender: TObject);
begin
   if MessageDlg('Ingresar Nuevo Canje'+chr(13)+chr(13)+
                 '   ¿ Esta Seguro ?  ',mtConfirmation, [mbYes, mbNo], 0)=mrYes then begin

      // Cancela todas las modificaciones en los
      DMCXP.cdsLetras.CancelUpdates;
      DMCXP.cdsDetCxP.CancelUpdates;
      DMCXP.cdsMovCxP.CancelUpdates;
      DMCXP.cdsCanje.CancelUpdates;
      DMCXP.cdsDetCanje.CancelUpdates;

//JORGE : 28/01/2002
      DMCXP.wModo:='A';
      InicializaClientDataSet;
      InicializaPaneles;
      InicializaPies;
      InicializaDatos;
			EstadoDeForma( 0, ' ', ' ' );
      InicializaCampos;
   end;
end;

procedure TFLetras.Z2bbtnAnulaClick(Sender: TObject);
var
   xRegAct : TBookMark;
begin

   DMCXP.cdsLetras.First;
   If DMCXP.cdsLetras.FieldByName('CPESTADO').AsString='A' then
      raise exception.Create(' Error :  Canje ya fue Anulado ');
   If DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString='S' then
      raise exception.Create(' Error :  Canje ya fue Contabilizado ');
   If not VerificaDocumentosPendientes then
      raise exception.Create(' Error :  Letras ya han sido Amortizadas ');

   // Anula todas Las letras del canje
   DMCXP.cdsLetras.DisableControls;
   xRegAct := DMCXP.cdsLetras.GetBookmark;
   DMCXP.cdsLetras.First;
   While not DMCXP.cdsLetras.Eof do begin
      DMCXP.cdsLetras.Edit;
      DMCXP.cdsLetras.FieldByName('CPESTADO').AsString:='A';
      cdsPost( DMCXP.cdsLetras );
      DMCXP.cdsLetras.Next;
	 end;
   DMCXP.cdsLetras.GotoBookmark(xRegAct);
   DMCXP.cdsLetras.FreeBookmark(xRegAct);
   DMCXP.cdsLetras.EnableControls;
   /////////////
   // Actualiza los Saldos de los Documentos Canjeados
   DMCXP.cdsMovCxP.DisableControls;
   DMCXP.cdsMovCxP.Filtered:=False;
   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.First;
   While not DMCXP.cdsCanje.Eof do Begin
      DMCXP.cdsCanje.Edit;
      if ExisteMovCxP( DMCXP.cdsCanje.FieldByName('CIAID').AsString,DMCXP.cdsCanje.FieldByName('TDIARID').AsString,
                       DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString,DMCXP.cdsCanje.FieldByName('CPNOREG').AsString) then begin
         DMCXP.cdsMovCxP.Edit;
         If DMCXP.cdsMovCxP.FieldByName('TMonID').AsString=DMCXP.wTMonLoc then begin
            DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoLoc').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat,15,2);
            If DMCXP.cdsMovCxP.FieldByName('CPTCamPa').AsFloat > 0 then
               DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat/DMCXP.cdsMovCxP.FieldByName('CPTCamPa').AsFloat,15,2)
            else begin
               DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat/DMCXP.cdsMovCxP.FieldByName('CPTCamAJ').AsFloat,15,2);
            end;
            end
         else begin
            DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoExt').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat,15,2);
            If DMCXP.cdsMovCxP.FieldByName('CPTCamPa').AsFloat > 0 then
               DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCamPa').AsFloat,15,2)
						else begin
               DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCamAJ').AsFloat,15,2);
            end;
         end;
         cdsPost( DMCXP.cdsMovCxP );
      end;
      DMCXP.cdsCanje.Next;
   end;
   DMCXP.cdsCanje.EnableControls;
   DMCXP.cdsMovCxP.Filtered:=True;
   DMCXP.cdsMovCxP.EnableControls;
   //
   DMCXP.AplicaDatos( DMCXP.cdsLetras, 'Letras' );
   DMCXP.AplicaDatos( DMCXP.cdsMovCxP, 'MovCxP' );
   DMCXP.cdsCCanje.Edit;
   DMCXP.cdsCCanje.fieldbyname('CJEstado').AsString:='A';
   DMCXP.cdsCCanje.fieldbyname('CJUSER').AsString  :=DMCXP.wUsuario;
   DMCXP.cdsCCanje.fieldbyname('CJFREG').Value     :=Date;
   DMCXP.cdsCCanje.fieldbyname('CJFHOR').Value     :=Time;
   DMCXP.AplicaDatos( DMCXP.cdsCCanje, 'CCanje' );

   FiltraCanje;

   EstadoDeForma(1,DMCXP.cdsLetras.FieldByName('CPESTADO').AsString,DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString);

   ShowMessage(' Canje de Letras Anulado ');

end;

Function TFLetras.VerificaDocumentosPendientes:Boolean;
begin
   DMCXP.cdsLetras.First;
   While not DMCXP.cdsLetras.Eof do begin
      If DMCXP.cdsMovCxP.FieldByName('TMonID').AsString=DMCXP.wTMonLoc then begin
         If FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoLoc').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat,15,2)<>
            FRound(DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat,15,2) then begin
            Result := False;
            Exit;
         end;
         end
      else begin
         If FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoExt').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat,15,2)<>
            FRound(DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat,15,2) then begin
            Result := False;
            Exit;
         end;
      end;
      DMCXP.cdsLetras.Next;
   end;
   Result := True;
end;


procedure TFLetras.Z2bbtnAceptaClick(Sender: TObject);
var
   xRegAct : TBookMark;
   xTotMN, xTotME : double;
begin
   if DMCXP.MesCerrado(copy(xAnomes,5,2),copy(xAnomes,1,4),dblcCia.text) then
   begin
     ShowMessage(' Mes cerrado, no se puede contabilizar');
     exit;
   end;

   If LetrasAceptadas   then Raise exception.Create(' Error :  Canje ya fue Aceptado ');
   If DMCXP.cdsCanje.RecordCount=0  Then Raise exception.Create(' Error :  Falta registrar Documentos a Canjear');
   If DMCXP.cdsLetras.RecordCount=0 Then Raise exception.Create(' Error :  Falta registrar Letras');
   If not AsientoCuadra then Raise exception.Create(' Error:  Canje No Cuadra ');

   if MessageDlg( 'Acepta Canje de Letras' + chr(13)+
   								'     ¿Esta Seguro?    ',mtConfirmation,[mbYes, mbNo],0)=mrNo then
   		exit;

   ActualizaPagadoMovCxP;

   DMCXP.cdsLetras.DisableControls;
   xRegAct := DMCXP.cdsLetras.GetBookmark;


   // Actualiza Letras  Estado='P'
   xTotMN := 0;
   xTotME := 0;
   DMCXP.cdsLetras.First;
   While not DMCXP.cdsLetras.eof do
   begin
     DMCXP.cdsLetras.Edit;
     DMCXP.cdsLetras.FieldByName('CPESTADO').AsString := 'P';
     DMCXP.cdsLetras.FieldByName('CPUSER').AsString   := DMCXP.wUsuario;
     DMCXP.cdsLetras.FieldByName('CPFREG').AsDateTime := date;
     DMCXP.cdsLetras.FieldByName('CPHREG').AsDateTime := Time;
     xTotMN := xTotMN + DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat;
     xTotME := xTotME + DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat;
     cdsPost( DMCXP.cdsLetras );
     DMCXP.cdsLetras.Next;
   end;
   DMCXP.cdsLetras.GotoBookmark(xRegAct);
   DMCXP.cdsLetras.FreeBookmark(xRegAct);
   DMCXP.cdsLetras.EnableControls;

   xRetIGV := 0;
   CalculaRetencionIGV;
   //CIM 10/09/2002
   if xRetIGV>0 then
   begin
      if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
         xRetIGV:=xRetIGV/FRound(strtofloat(dbeTCLet.Text),8,3);

      GeneraDetalleRetencion;
   end;

   xTotMN:=xTotMN-xRetIGV;
   xTotME:=xTotME-FRound((xRetIGV/strtofloat(dbeTCLet.Text)),15,2);

   DMCXP.SaldosAuxiliar( DMCXP.cdsCCanje.FieldByName('CIAID').AsString, DMCXP.cdsCCanje.fieldbyname('CJAAMM').AsString,
                       DMCXP.cdsCCanje.FieldByName('CLAUXID').AsString,DMCXP.cdsCCanje.FieldByName('PROV').AsString,
   		        '=', xTotMN, xTotME, DMCXP.cdsCCanje.fieldbyname('TMONID').AsString );

   ShowMessage('6');

   DMCXP.AplicaDatos( DMCXP.cdsLetras, 'Letras' );

   DMCXP.cdsCCanje.Edit;
   DMCXP.cdsCCanje.fieldbyname('CJEstado').AsString:='P';
   DMCXP.cdsCCanje.fieldbyname('CJ_CONTA').AsString:='N';
   DMCXP.cdsCCanje.fieldbyname('CJUSER').AsString  :=DMCXP.wUsuario;
   DMCXP.cdsCCanje.fieldbyname('CJFREG').Value     :=Date;
   DMCXP.cdsCCanje.fieldbyname('CJFHOR').Value     :=Time;
   DMCXP.AplicaDatos( DMCXP.cdsCCanje, 'CCanje' );
   ShowMessage('9');

   GrabaDetCanje;
   ShowMessage('10');
   FiltraCanje;
   ShowMessage('11');

   EstadoDeForma(1,DMCXP.cdsLetras.FieldByName('CPESTADO').AsString,DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString);

   ShowMessage(' Canje de Letras Aceptado ');
end;

procedure TFLetras.ActualizaPagadoMovCxP;
var
   xxML, xxME,xxMO : double;
begin
   xxML := 0;
   xxME := 0;
   xxMO := 0;
   DMCXP.cdsMovCxP.DisableControls;
   DMCXP.cdsMovCxP.Filtered:=False;
   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.First;
   while not DMCXP.cdsCanje.Eof do
   Begin
      DMCXP.cdsMovCxP.Setkey;
      DMCXP.cdsMovCxP.FieldByName('CIAID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsCanje.FieldByName('TDIARID').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString := DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsCanje.FieldByName('CPNOREg').AsString;
      if DMCXP.cdsMovCxP.GotoKey then
      begin
        If (DMCXP.DisplayDescrip2('dspTGE','TGE110','DOC_FREG,DOCTIPREG','DOCID='+quotedstr(DMCXP.cdsMovCxP.FieldByName('DOCID').AsString),'DOC_FREG')  = 'N')  OR
           (DMCXP.cdsQry.FieldByName('DOCTIPREG').AsString='NC') then
        begin
           xxMO := DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat * -1;
           xxME := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat * -1;
           xxML := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat * -1;
          end
        else
         begin //** 01/08/2001 - pjsv, cuando es un monto de cuelquir tipo de provision
           xxMO := DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat;
           xxML := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
           xxME := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
         end;
         DMCXP.cdsMovCxP.edit;
         If DMCXP.cdsMovCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
          begin
           DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat+xxML,15,2);
           DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat:=DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat;
           DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
           If DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat <= 0 then
             DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString:='C';
          end
         else
          begin
            //CIM 24/06/2002
            If DMCXP.cdsMovCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
            begin
               DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat+xxME,15,2);
               DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat:=DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat;
               DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
               If DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat <= 0 then
                  DMCXP.cdsMovCxP.FieldByName('CPEstado').AsString:='C';
            end
            else//Otras monedas extranjeras
            begin
               DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat+xxME,15,2);
               DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat+xxMO,15,2);
               DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat+xxML,15,2);
               If DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat <= 0 then
                  DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString:='C';
            end;
          end;
         DMCXP.cdsMovCxP.FieldByName('CPTCamPa').AsFloat:=FRound(DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
         cdsPost( DMCXP.cdsMovCxP );
      end;
      DMCXP.cdsCanje.Next;
   end;
   DMCXP.AplicaDatos( DMCXP.cdsMovCxP, 'MovCxP' );
   DMCXP.cdsMovCxP.Filtered:=True;
   DMCXP.cdsMovCxP.First;
   DMCXP.cdsMovCxP.EnableControls;
   DMCXP.cdsCanje.EnableControls;
end;

Function TFLetras.LetrasAceptadas:Boolean;
begin
   DMCXP.cdsLetras.First;
   If DMCXP.cdsLetras.FieldByName('CPESTADO').AsString = 'P' then
      Result := True
   else
      Result := False;
end;

procedure TFLetras.tnbDetalleChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
   If tnbDetalle.ActivePage='  Documentos de Canje  ' then
   begin
      If DMCXP.cdsCanje.RecordCount=0 then
      begin
         tnbDetalle.ActivePage := '  Documentos de Canje  ';
         tnbDetalle.PageIndex  := 0;
         Raise Exception.Create(' No se han registrado Documentos ');
      end;

   end;

   bbtnSumatClick(Sender);

end;

procedure TFLetras.dblcCiaExit(Sender: TObject);
var
   xWhere, xSQL : String;
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
      xWhere := 'CIAID='+''''+dblcCia.Text+''''+' and TCANJEID='+''''+'LE'+'''';
      edtCanje.Text := DMCXP.BuscaUltTGE('PrvUltCxP','CXP308','CANJE',xWhere);
   end;

    if DMCXP.wVRN_CptoCia='N' then
    	 xSQL:='select * from CXP201 '
    else
    	 xSQL:='select * from CXP201 '
		    	 	+'Where CIAID='+quotedstr(dblcCia.Text);

  	DMCXP.cdsCnpEgr.Close;
	  DMCXP.cdsCnpEgr.DataRequest( xSQL );
	  DMCXP.cdsCnpEgr.Open;

  	edtCanje.SetFocus;

end;

procedure TFLetras.dblcdProvRucExit(Sender: TObject);
var
   xWhere : String;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if dblcClAux.Focused then Exit;
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
      DMCXP.cdsCCanje.fieldbyname('PROV').AsString:=dblcdProv.Text;
      DMCXP.cdsCCanje.fieldbyname('CJEstado').AsString:='T';
      DMCXP.cdsCCanje.Post;
      DMCXP.cdsCCanje.DataRequest( 'Select * from CXP308' );
      DMCXP.AplicaDatos( DMCXP.cdsCCanje, 'CCanje'  );

       if not dblcTDoc.enabled then
          dblcTDoc.enabled:=True;
       pnlcab2.enabled:=True;
       dblcTDoc.SetFocus;
   end
   else begin
      edtProv.Text:='';
      dblcdProv.SetFocus;
   end;
end;

procedure TFLetras.dblcTDocExit(Sender: TObject);
var
   xFiltro, xWhere : string;

begin
   If xCrea then Exit;

   //xWhere:='DOCID='''+dblcTDoc.Text+''' and DOC_FREG='''+FPrincipal.xTipoProv+'''';
   xWhere:='DOCID='''+dblcTDoc.Text+''' and DOC_FREG='''+xTipoProv+'''';
   edtTDoc.Text:=BuscaQry('PrvTGE','TGE110','*',xWhere,'DocDes');

   if length(edtTDoc.Text)=0 then
   begin
      ShowMessage('Falta Código de Documento');
      dblcTDoc.SetFocus;
      Exit;
   end;

   with DMCXP do begin
      if length(edtTDoc.Text)>0 then begin
      // Asigna Tipo de Diario a lookup combo TDiario
//         DMCXP.cdsDetCxP.Edit;
         DMCXP.cdsCCanje.FieldByName('TDIARID').AsString:= DMCXP.cdsQry.FieldByName('TDIARID').Value;
         xConta  := DMCXP.cdsQry.fieldbyname('DOCCONTA').AsString;
      // Busca descripción TDiario y asigna a edit TDiario
         edtTDiario.Text:=DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);
      // Filtra Tipo de Diario específico
         xFiltro:='TDIARID='+cdsTDoc.fieldbyname('TDIARID').AsString;
         if length(cdsTDoc.fieldbyname('TDIARID2').AsString) > 0 then begin
            xFiltro:=xFiltro+'or TDIARID='+''''+cdsTDoc.fieldbyname('TDIARID2').AsString+'''';
         end;
         cdsTDiario.Filter  := '';
         cdsTDiario.Filter  := xFiltro;
         cdsTDiario.Filtered:= true;
         if cdsTDiario.Recordcount=1 then begin
            if dblcTDiario.Enabled then perform(CM_DialogKey,VK_TAB,0);
            dblcTDiario.Enabled:=false;
            end
         else begin
            dblcTDiario.Enabled:=true;
         end;
      end;
   end;
end;

procedure TFLetras.dblcTDiarioExit(Sender: TObject);
var
   xWhere : string;
begin

   edtTDiario.Text:=DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);

   if length(edtTDiario.Text)=0 then
   begin
      ShowMessage('Falta Tipo de Diario');
      dblcTDiario.SetFocus;
   end;
   //CIM 21/06/2002
   xWhere := 'CiaId='+''''+dblcCia.Text+''''+' and TDiarId='+''''+dblcTDiario.Text+''''+' and CJAAMM='+''''+''+'''';
   dbeLote.Text:=DMCXP.BuscaUltTGE('PrvUltCxP','CXP308','CJLOTE',xWhere);
   dbeLote.Text:=Strzero(dbeLote.Text,DMCXP.cdsDetCxP.fieldbyname('DCPLOTE').DisplayWidth);
   //
end;

procedure TFLetras.btnActRegClick(Sender: TObject);
begin
   pnlPie.Enabled     :=False;
   dbgletras.Enabled  :=False;
   pnlRegistro.Visible:=True;
   pnlRegistro.SetFocus;
   DMCXP.cdsLetras.Insert;
   dbeNoReg.Enabled := True;
   xTAutoNum := DMCXP.DisplayDescrip('TGE104','AUTONUM','TDIARID',dblcTDiario.Text);
   dbeNoReg.Text:=DMCXP.UltimoRegistro(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes);
   dbeNoReg.Text:=Strzero( dbeNoReg.Text,DMCXP.cdsLetras.FieldByName('CPNOREG').Size );
   DMCXP.cdsLetras.FieldByName('CPNOREG').Value := dbeNoReg.Text;
   DMCXP.cdsLetras.FieldByName('TMONID').Value := DMCXP.cdsDetCxP.FieldByName('TMONID').AsString;
   dbeNoReg.SetFocus;
end;

procedure TFLetras.bbtnRegOkClick(Sender: TObject);
var
   xEstado,xTNoReg : String;
   xTotalLetra,xTotalDoc : Double;
   cdsClone    : TwwClientDataSet;
begin
  cdsClone    := TwwClientDataSet.Create(nil);
  try
   cdsClone.CloneCursor(DMCXP.cdsLetras,True);
   If Length(dbeLetra.Text)=0 then
    begin
      dbeLetra.SetFocus;
      Raise Exception.Create('Error :  Falta Registrar Número de Letra');
    end;
   If dbdtpFVcmto.Date=0 then
    begin
      dbdtpFVcmto.SetFocus;
      Raise Exception.Create('Error :  Falta Registrar Fecha de Vencimiento');
    end;
   //** 16/07/2001 - pjsv, para validar que el monto de la letra no sea mayor que del Doc
   xTotalLetra := 0;
   xTotalDoc := 0;
   cdsClone.first;
   while not cdsClone.eof do
    begin
     If dblcTMon.text = DMCXP.wTMonLoc then
      xTotalLetra := xTotalLetra + cdsClone.fieldbyname('CPMTOLOC').AsFloat
     else
      xTotalLetra := xTotalLetra + cdsClone.fieldbyname('CPMTOEXT').AsFloat;
     cdsClone.next;
    end;
   DMCXP.cdsCanje.first;
   while not DMCXP.cdsCanje.eof do
    begin
     If dblcTMon.text = DMCXP.wTMonLoc then
      xTotalDoc := xTotalDoc + DMCXP.cdsCanje.fieldbyname('CCPMOLOC').AsFloat
     else
      xTotalDoc := xTotalDoc + DMCXP.cdsCanje.fieldbyname('CCPMOEXT').AsFloat;
     DMCXP.cdsCanje.next;
    end;
   If dblcTMon.text = DMCXP.wTMonLoc then
    begin
     If xTotalLetra > xTotalDoc  then
      begin
       dbeImporte.SetFocus;
       Raise Exception.Create('Error : Total Importe Mayor que el total del Doc. a Canjear');
      end;
    end
   else
    begin
     If xTotalLetra > xTotalDoc then
      begin
       dbeImporte.SetFocus;
       Raise Exception.Create('Error : Total Importe Mayor que el total del Doc. a Canjear');
      end;
    end;
   //**

   If Length(dbeImporte.Text)=0 then begin
      dbeImporte.SetFocus;
      Raise Exception.Create('Error :  Falta Registrar Importe');
   end;
   if DMCXP.cdsLetras.State=dsInsert then
    begin
      dbeNoReg.Text := DMCXP.GrabaUltimoRegistro(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes,StrToInt(dbeNoReg.Text));
      dbeNoReg.Text := StrZero( dbeNoReg.Text,DMCXP.cdsLetras.FieldByName('CPNOREG').Size );
    end;
   //**
   DMCXP.cdsLetras.FieldByName('CIAID').AsString    := dblcCia.text; //DMCXP.cdsDetCxP.FieldByName('CIAID').AsString;
	 DMCXP.cdsLetras.FieldByName('TCANJEID').AsString := 'LE';
   DMCXP.cdsLetras.FieldByName('CPCANJE').AsString  := edtCanje.Text;

   DMCXP.cdsLetras.FieldByName('CPANOMES').AsString  := DMCXP.cdsCCanje.FieldByName('CJAAMM').AsString;
   DMCXP.cdsLetras.FieldByName('TDIARID').AsString   := DMCXP.cdsCCanje.FieldByName('TDIARID').AsString;
   DMCXP.cdsLetras.FieldByName('CPNOREG').AsString   := dbeNoReg.Text;
   DMCXP.cdsLetras.FieldByName('CLAUXID').AsString   := dblcClAux.Text;
   DMCXP.cdsLetras.FieldByName('PROV').AsString      := dblcdProv.text;
   DMCXP.cdsLetras.FieldByName('PROVRUC').AsString   := dblcdProvRuc.Text;
   DMCXP.cdsLetras.FieldByName('DOCID').AsString     := dblcTDoc.text;
   DMCXP.cdsLetras.FieldByName('CPSERIE').AsString   := '000';
   DMCXP.cdsLetras.FieldByName('CPFRECEP').AsDateTime:= xFRecep;
   DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime := dbdtpFEmis.date; //DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime;
   DMCXP.cdsLetras.FieldByName('TMONID').AsString    := dblcTMon.text;   //DMCXP.cdsDetCxP.FieldByName('TMONID').AsString;
   DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat   := StrToFloat(dbeTCLet.text);
   DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat   := StrToFloat(dbeTCLet.text);
   DMCXP.cdsLetras.FieldByName('CPTCAMDOL').AsFloat  := DMCXP.cdsCCanje.fieldbyname('CPTCAMDOL').AsFloat;
   DMCXP.cdsLetras.FieldByName('CPESTADO').AsString  := 'I';
   DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString  := 'N';

   If DMCXP.cdsLetras.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
    begin
      DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
      DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat,15,2 );
      DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
      DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
      DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat,15,2 );
    end
   Else
    begin
    //cim 24/06/2002
      If DMCXP.cdsLetras.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
      begin
         DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat,15,2 );
         DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
         DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
         DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat,15,2 );
         DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
      end
      else
      begin
         DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat,15,2 );
         DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMDOL').AsFloat,15,2);
         DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
         DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMAJ').AsFloat,15,2 );
         DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMDOL').AsFloat,15,2);

      end;

    end;

   DMCXP.cdsLetras.FieldByName('CPFCANJE').AsDateTime:= dbdtpFEmis.date; // DMCXP.cdsCCanje.FieldByName('CPFEMIS').AsDateTime;
   DMCXP.cdsLetras.FieldByName('CTATOTAL').AsString  := dbeCuenta.text; //DMCXP.cdsCCanje.FieldByName('CUENTAID').AsString;
   DMCXP.cdsLetras.FieldByName('CPTOTOT').AsString   := dblcdCnpEgr.text; //DMCXP.cdsCCanje.FieldByName('CPTOID').AsString;
   DMCXP.cdsLetras.FieldByName('CPFCMPRB').AsDateTime:= dbdtpFComp.date; //DMCXP.cdsCCanje.FieldByName('DCPFCOM').AsDateTime;
   DMCXP.cdsLetras.FieldByName('DCPLOTE').AsString   := '000'; //DMCXP.cdsCCanje.FieldByName('DCPLOTE').AsString;
   DMCXP.cdsLetras.FieldByName('CPAAAA').AsString    := DMCXP.cdsCCanje.FieldByName('CJAA').AsString;
   DMCXP.cdsLetras.FieldByName('CPMM').AsString      := DMCXP.cdsCCanje.FieldByName('CJMM').AsString;
   DMCXP.cdsLetras.FieldByName('CPDD').AsString      := DMCXP.cdsCCanje.FieldByName('CJDD').AsString;
   DMCXP.cdsLetras.FieldByName('CPTRI').AsString     := DMCXP.cdsCCanje.FieldByName('CJTRI').AsString;
   DMCXP.cdsLetras.FieldByName('CPSEM').AsString     := DMCXP.cdsCCanje.FieldByName('CJSEM').AsString;
   DMCXP.cdsLetras.FieldByName('CPSS').AsString      := DMCXP.cdsCCanje.FieldByName('CJSS').AsString;
   DMCXP.cdsLetras.FieldByName('CPAATRI').AsString   := DMCXP.cdsCCanje.FieldByName('CJAATRI').AsString;
   DMCXP.cdsLetras.FieldByName('CPAASEM').AsString   := DMCXP.cdsCCanje.FieldByName('CJAASEM').AsString;
   DMCXP.cdsLetras.FieldByName('CPAASS').AsString    := DMCXP.cdsCCanje.FieldByName('CJAASS').AsString;
   cdsPost( DMCXP.cdsLetras );

   if DMCXP.cdsLetras.State=dsInsert then
    begin
      dbeNoReg.Enabled:= True;
      dbeNoReg.Text   := DMCXP.UltimoRegistro(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes );
      xTNoReg         := Strzero( dbeNoReg.Text, DMCXP.cdsLetras.FieldByName('CPNOREG').Size );
      bbtnSumatClick(Sender);
      DMCXP.cdsLetras.Insert;
      DMCXP.cdsLetras.FieldByName('TMONID').AsString  := dblcTMon.text; //DMCXP.cdsDetCxP.FieldByName('TMONID').AsString;
      DMCXP.cdsLetras.FieldByName('CPNOREG').AsString := xTNoReg;
      dbeNoReg.SetFocus;
    end
   else
    begin
      bbtnSumatClick(Sender);
      pnlPie.Enabled     :=True;
      dbgletras.Enabled  :=True;
      pnlRegistro.Visible:=False;
      dbgLetras.SetFocus;
    end;
   //** 16/07/2001 - pjsv
   DMCXP.cdsCCBco.filter := '';
   DMCXP.cdsCCBco.filtered := true;
   //**
  except
  end;
end;

procedure TFLetras.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFLetras.bbtnRegCancClick(Sender: TObject);
begin
   if DMCXP.cdsLetras.State=dsInsert then
      DMCXP.cdsLetras.Delete
   else begin
      DMCXP.cdsLetras.Cancel;
   end;
   pnlRegistro.Visible:=False;
   pnlPie.Enabled     :=True;
   dbgletras.Enabled  :=True;
   dbgLetras.SetFocus;
   bbtnSumatClick(Sender);
   DMCXP.cdsCCBco.filter := '';
   DMCXP.cdsCCBco.filtered := true;
end;

procedure TFLetras.dbgLetrasDblClick(Sender: TObject);
begin
   If btnActReg.Enabled then begin
      pnlPie.Enabled   :=False;
      dbeNoReg.Enabled := False;
      dbgletras.Enabled:=False;
      DMCXP.cdsLetras.Edit;
      pnlRegistro.Visible := True;
      dbeLetra.SetFocus;
   end;
end;

procedure TFLetras.dbgLetrasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if not btnActReg.Enabled then Exit;

   if (key=VK_Delete) and (ssCtrl in Shift) then
   begin
      if MessageDlg('¿Esta Seguro de Eliminar Registro?',mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      begin
         DMCXP.cdsLetras.Delete;
      end;
   end;
end;

procedure TFLetras.dbgDocCanjeCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
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

procedure TFLetras.dbgDocCanjeKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin

      dbgDocCanjeColExit(Sender);

   end;
end;

procedure TFLetras.bbtnRegresaEnter(Sender: TObject);
begin
   dbgDocCanjeColExit(Sender);
end;

procedure TFLetras.FormCreate(Sender: TObject);
begin
   If DMCXP.wAdmin='G' then begin
      DMCXP.wObjetoDesPr := Caption;
      FPrincipal.ListaComponentes(Self);
   end;

   CargaDataSource;
end;


procedure TFLetras.CargaDataSource;
begin
   dblcCia.DataSource        :=nil;
   dblcCia.LookupTable       :=DMCXP.cdsCia;
   dblcClAux.DataSource      :=DMCXP.dsCCanje;
   dblcClAux.LookupTable     :=DMCXP.cdsClAux;
   dblcdProv.DataSource      :=DMCXP.dsCCanje;
   dblcdProv.LookupTable     :=DMCXP.cdsProv;
   dblcdProvRuc.DataSource   :=DMCXP.dsCCanje;
   dblcdProvRuc.LookupTable  :=DMCXP.cdsProv;
   dblcTDoc.DataSource       :=DMCXP.dsCCanje;
   dblcTDoc.LookupTable      :=DMCXP.cdsTDoc;
   dblcTDiario.DataSource    :=DMCXP.dsCCanje;
   dblcTDiario.LookupTable   :=DMCXP.cdsTDiario;
   dbdtpFEmis.DataSource     :=DMCXP.dsCCanje;
   dtpFRecep.DataSource      :=DMCXP.dsCCanje;
   dbdtpFComp.DataSource     :=DMCXP.dsCCanje;
   dblcTMon.DataSource       :=DMCXP.dsCCanje;
   dblcTMon.LookupTable      :=DMCXP.cdsTMon;
   dbeTCLet.DataSource       :=DMCXP.dsCCanje;
   dbeLote.DataSource        :=DMCXP.dsDetCxP;
   dblcdCnpEgr.DataSource    :=DMCXP.dsCCanje;
   dblcdCnpEgr.LookupTable   :=DMCXP.cdsCnpEgr;
   dbeCuenta.DataSource      :=DMCXP.dsCCanje;
   dbeGlosa.DataSource       :=DMCXP.dsCCanje;
   dblcdPresup.DataSource    :=DMCXP.dsDetCxP;


   dbeNoReg.DataSource       :=DMCXP.dsLetras;
   dbeLetra.DataSource       :=DMCXP.dsLetras;
   dbdtpFVcmto.DataSource    :=DMCXP.dsLetras;
   dbeImporte.DataSource     :=DMCXP.dsLetras;

   dbgPendientes.DataSource  :=DMCXP.dsMovCxP;
   dbgDocCanje.DataSource    :=DMCXP.dsCanje;
   dbgLetras.DataSource      :=DMCXP.dsLetras;
end;


procedure TFLetras.dblcdPresupExit(Sender: TObject);
begin
   if Length(DMCXP.DisplayDescrip('TGE216','PARPRESDES','PARPRESID',dblcdPresup.Text))=0 then
   begin
      dblcdPresup.SetFocus;
      raise exception.Create('Partida Presupuestal Errada');
   end;
end;

procedure TFLetras.dblcdProvEnter(Sender: TObject);
begin
   if dblcClAux.text='' then dblcClAux.SetFocus;

   if DMCXP.wVRN_ProvOrden<>'' then
      DMCXP.cdsProv.IndexFieldNames:=DMCXP.wVRN_ProvOrden
   else begin
      DMCXP.cdsProv.IndexFieldNames:='Prov';
   end;   
end;

procedure TFLetras.dblcdProvRucEnter(Sender: TObject);
begin
   if dblcClAux.text='' then dblcClAux.SetFocus;

   DMCXP.cdsProv.IndexFieldNames:='ProvDes';
end;

procedure TFLetras.dblcClAuxExit(Sender: TObject);
var
   xWhere : String;

begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

   xWhere:='CLAUXID='''+dblcClAux.Text+''' and MODULO LIKE ''%'+DMCXP.wModulo+'%''';
   if length(BuscaQry('dspTGE','TGE102','CLAUXDES',xWhere,'CLAUXDES'))=0 then
   begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Clase de Auxiliar No Válida');
   end;
   Screen.Cursor:=crHourGlass;

   Filtracds( DMCXP.cdsProv,'Select * from TGE201 Where CLAUXID='''+dblcClAux.Text+''' and NVL(ACTIVO,''N'')=''S''' );

   if Length(dblcdProv.Text)>0 then begin
      xWhere:='ClAuxId='''+dblcClAux.Text+''' and Prov='''+dblcdProv.Text+''' and NVL(ACTIVO,''N'')=''S''';
      if length(BuscaQry('dspTGE','TGE201','PROV,PROVRUC,PROVDES',xWhere,'PROVDES'))=0 then
      begin
         dblcdProv.Text   :='';
         dblcdProvRuc.Text:='';
         edtProv.Text:='';
         dblcdprov.SetFocus;
      end
      else begin
         dblcdProv.Text   :=DMCXP.cdsQry.FieldByname('PROV').AsString;
         dblcdProvRuc.Text:=DMCXP.cdsQry.FieldByname('PROVRUC').AsString;
         edtProv.Text     :=DMCXP.cdsQry.FieldByname('PROVDES').AsString;;
      end;
   end;

   dblcdProv.Enabled   :=True;
   dblcdProvRuc.Enabled:=True;
   if Length(dblcdProv.Text)=0 then dblcdProv.SetFocus;

//   EstadoDeForma( 0, DMCXP.cdsCCanje.fieldbyname('CJESTADO').AsString, ' ' );
   Screen.Cursor:=crDefault;
end;

procedure TFLetras.dblcBancoExit(Sender: TObject);
begin
   //** 31/07/2001 - pjsv
   //xDescrip := 'BANCOID='+quotedstr(dblcBanco.text);
   //edtBanco.text := DMCXP.DisplayDescrip2('prvSQL','TGE105','*',xdescrip,'BANCOABR');
   //** 31/07/2001 - pjsv
   //DMCXP.cdsCCBco.filter := 'BANCOID='+quotedstr(dblcBanco.text);
   //DMCXP.cdsCCBco.filtered := true;
   //**
//**
end;

procedure TFLetras.dblcSituaExit(Sender: TObject);
begin
	 //** 316/07/2001 - pjsv
	 //xDescrip := 'SITUAID='+quotedstr(dblcSitua.text);
	 //edtSituacion.text := DMCXP.DisplayDescrip2('prvSQL','CXC104','*',xdescrip,'SITUADES');
	 //**
end;

procedure TFLetras.Z2bbtnPreviewClick(Sender: TObject);
var
	xPeriodo, xDiario, xNComprob, xTabla, xTablaCab, mes, ano, xWhere, MesDes, tMoneda, MONABR : string;
	SUMA, xTotHaber, xSuma : Double;
	x10 : Integer;
	xRegAct : TBookMark;
   xSQL : String;
   //cim 27/06/2002
   xDCPDH : STring;
   //
begin
   xDiario :=DMCXP.cdsLetras.FieldByName('TDIARID').AsString;
   xPeriodo:=DMCXP.cdsLetras.FieldByName('CPANOMES').AsString;
   xDCPDH := 'H';
   //*
   if DMCXP.cdsLetras.RecordCount=0 then
   begin
      ShowMessage( 'Error : No Existen Letras' );
      Exit;
   end;

   if DMCXP.cdsCCanje.FieldByName('CJ_CONTA').AsString='S' then
   begin
      xTablaCab := 'CNT300';
		xTabla:='CNT301';
      xSql:='SELECT  A.*, TGE103.TMONDES, TGE103.TMONABR, '
           +  '0.00 TOTAL, CXP308.PROV, P.PROVDES, CXP308.CANJE CPNOREG '
           +'FROM '+xTabla+' A, TGE103, CXP308, TGE201 P '
           +'WHERE A.CIAID='''     +dblcCia.text+''' AND '
           +      'A.CNTANOMM='''  +xperiodo    +''' AND '
           +      'A.TDIARID='''   +xDiario     +''' AND '
           +      'A.CNTCOMPROB='''+'0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString+''' AND '
           +      'A.TMONID=TGE103.TMONID  AND '
           +      'SUBSTR(A.CNTCOMPROB,5,6)=CXP308.CANJE AND CXP308.CIAID= '+quotedstr(dblcCia.text)+' AND '
           +      'CXP308.CJAAMM='''+xperiodo+''' AND CXP308.TDIARID='+quotedstr(dblcTDiario.text)
           +  ' AND P.CLAUXID='''+dblcClAux.Text+''' and P.PROV='''+dblcdProv.Text+''' '
           +' ORDER BY A.CNTREG ';
      DMCXP.cdsCxP.Close;
      DMCXP.cdsCxP.DataRequest(xSQL);
      DMCXP.cdsCxP.Open;
   end
   else
   begin
      GeneraAsientoCanje;
      DMCXP.cdsDetCxP.DataRequest('Select * from CXP302' );
      DMCXP.cdsLetras.First;
      DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DetCxP' );
      xTablaCab := 'CNT310';
      xTabla:='CNT311';

      DMCXP.GeneraContab( dblcCia.Text, dblcTDiario.Text, DMCXP.cdsLetras.FieldByName('CPANOMES').AsString, '0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString, Self, 'P' );
      DMCXP.cdsCXP.Data:=DMCXP.cdsMovCnt.data;
   end;

   xSQL:='CIAID='''   +dblcCia.Text +''''+' and '+
	 'TDIARID=''' +dblcTDiario.Text+''''+' and '+
	 'DCPANOMM='''+DMCXP.cdsccANJE.FieldByName('CJAAMM').AsString+''' and '+
	 'CPNOREG=''' +'0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString+'''';
   Filtracds( DMCXP.cdsDetCxP,'Select * from CXP302 Where '+xSQL );
   //*

   // Se Transfiere la Data Generada en el SOLContabiliza

	if DMCXP.cdsDetCxP.recordcount=0 then
		raise exception.Create('No existen Registros Contabilizados para la Consulta');

	xSQL:='SELECT CNTGLOSA FROM '+xTablaCab+' WHERE CIAID='+quotedstr(dblcCia.text) +' AND '
			 +  'CNTANOMM='+quotedstr(DMCXP.cdsLetras.FieldByName('CPANOMES').AsString) +' AND '
			 +  'TDIARID='+quotedstr(dblcTDiario.text) +' AND '
			 +  'CNTCOMPROB='+quotedstr('0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString);
	DMCXP.cdsQry5.close;
	DMCXP.cdsQry5.ProviderName := 'dspTGE';
	DMCXP.cdsQry5.DataRequest(xsql);
	DMCXP.cdsQry5.Open;

	ppdbpPreview.DataSource := DMCXP.dsCxP;
	pprPreview.TEMPLATE.FileName:=ExtractFilePath( application.ExeName ) + wRutaRpt+'\CxPVoucher.rtm' ;
	pprPreview.template.LoadFromFile ;

  if DMCXP.cdsCCanje.FieldByName('CJ_CONTA').AsString='S' then
     pplblDesEstado.caption:='Contabilizado'
  else
     pplblDesEstado.caption:='Previo';

  pplblCodProv.caption := dblcdProv.text;
  pplblProveedor.Caption:=edtProv.text ;
	pplblTipoCamb.Caption := FloatToStrF(StrToFloat(dbeTCLet.text),ffNumber,10,3);

	 //lblPeriodo.Caption  := meAnoMM.text ;  reemplazado por
	mes:=copy(DMCXP.cdsLetras.FieldByName('CPANOMES').AsString,5,2);
	ano:=copy(DMCXP.cdsLetras.FieldByName('CPANOMES').AsString,1,4);

	xWhere := 'MESIDR='''+mes+'''';
	mesdes := DMCXP.DisplayDescrip2('dspTGE','TGE181','MESDESL',XWHERE,'MESDESL');

  pplblAnoMes.Caption  := mesdes+' '+ano;
	pplblNoCompro.Caption := '0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString;

	 tMoneda := DMCXP.DisplayDescrip2('dspTGE','TGE103','TMON_LOC','TMONID='+quotedstr(dblcTMon.text),'TMON_LOC');
	 MONABR:= DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONABR','TMONID='+quotedstr(dblcTMon.text),'TMONABR');

	 xSuma:= 0;
	 DMCXP.CdsDetCxP.first;
	 while not DMCXP.CdsDetCxP.EOF do
	 begin
//		 if DMCXP.CdsDetCxP.fieldbyname('CUENTAID').Asstring = dbeCuenta.text then
		 if DMCXP.CdsDetCxP.fieldbyname('DCPDH').Asstring = xDCPDH then
		 begin
				xSuma  :=xSuma+ FRound(DMCXP.cdsDetCxP.FieldByname('DCPMOORI').AsFloat,15,2);
		 end;
		 DMCXP.CdsDetCxP.next;
	 end;
	 pplblMontoImporte.Caption  := MONABR+FloatToStrF( xSuma,ffNumber,15,2);

	 If TMoneda = 'L' then
	 begin
      pplblMonedaDoc.Visible := false;
      ppdbMtoExt.Visible:= false;
      pplblCntTCambio.Visible:= false;
      ppdbCntTCambio.Visible:= false;
	 end;

	 pplblCiades.Caption   := edtCia.text ;
	 pplblDiarioDes.Caption   := edtTDiario.text  ;
	 pplblTDiario.Caption       := dblcTDiario.text ;
//	 lblTipoCamb.Caption := FloatToStrF(StrToFloat(dbeTCLet.text),ffNumber,10,3);
//	 lblNoCompro.Caption := '0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString;
//	 lblProveedor.Caption:= edtProv.text ;
	 pplblmonedaDes.caption   := DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONDES','TMONID='+quotedstr(dblcTMon.text),'TMONDES');
//	 pLblglosa.caption   := DMCXP.cdsCxP.fieldbyname('CNTGLOSA').asstring;
	 pplblglosaDes.caption   := dbeGlosa.Text;

	 DMCXP.cdsCxP.IndexFieldNames:='CNTREG';

	 pprPreview.Print;
   pprPreview.Stop;
   ppdbpPreview.DataSource := nil ;
   DMCXP.cdsCxP.IndexFieldNames:='';
   DMCXP.cdsCxP.Close;
   DMCXP.cdsMovCnt.Close;

end;

procedure TFLetras.ppDetailBand2BeforePrint(Sender: TObject);
begin
	pplblFecEmision.Caption := DMCXP.CdsCxP.Fieldbyname('CNTFEMIS').AsString;
end;

procedure TFLetras.pprPreviewPreviewFormCreate(Sender: TObject);
begin
  pprPreview.PreviewForm.ClientHeight := 580;
  pprPreview.PreviewForm.ClientWidth := 780;			// ppViewr
  tppviewer(pprPreview.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFLetras.CalculaRetencionIGV;
var
   xRegAct     : TBookMark;
   xSQL, xTasaDes : String;
   xBreak  : Boolean;
   xTasaRet, xTasaMonto : double;
   xTotRetMN,xTotRetME,xTotPagMN,xTotPagME : double;
   xTasaFec : TDatetime;

begin
// Para Saber si la Compañía Retiene IGV
   xSQL:='Select CIAID, CIARETIGV from TGE101 '
        +'where CIAID='+quotedstr(DMCXP.cdsCanje.FieldByName('CIAID').AsString);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.Datarequest( xSQL );
   DMCXP.cdsQry.Open;

   if DMCXP.cdsQry.FieldByName('CIARETIGV').AsString<>'S' then
      Exit;

// Para Saber si al Proveedor se le debe retener;
   xSQL:='Select PROVRETIGV from TGE201 '
		  	+'Where CLAUXID='''+DMCXP.cdsCanje.FieldByName('CLAUXID').AsString+''' and '
			 	+      'PROV='''   +DMCXP.cdsCanje.FieldByName('PROV').AsString   +'''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.Datarequest(xSQL);
   DMCXP.cdsQry.Open;

   if DMCXP.cdsQry.FieldByName('PROVRETIGV').AsString='N' then
      Exit;

   xSQL:='Select TASAMTO, TASACAN, TASADES,TASAFEC from TGE108 Where TASAFLG=''R''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.Datarequest( xSQL );
   DMCXP.cdsQry.Open;
   if DMCXP.cdsQry.RecordCount=0 then
   begin
      ShowMessage('No hay Tasa de Retención definida');
      exit;
   end;
   xTasaRet := DMCXP.cdsQry.FieldByname('TASACAN').AsFloat;
   xTasaMonto := DMCXP.cdsQry.FieldByname('TASAMTO').AsFloat;
   xTasaDes := DMCXP.cdsQry.FieldByname('TASADES').AsString;
   xTasaFec := DMCXP.cdsQry.FieldByname('TASAFEC').AsDateTime;

   xSQL:='Select CPTOID, CUENTAID from CAJA201 Where CPTOIS=''R''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.Datarequest( xSQL );
   DMCXP.cdsQry.Open;

   if DMCXP.cdsQry.RecordCount=0 then
   begin
      ShowMessage('No hay Conceptos de Caja que Indiquen Retención Tipo "R"');
      exit;
   end;

   xCptoRet:=DMCXP.cdsQry.FieldByName('CPTOID').AsString;
   xCtaRet :=DMCXP.cdsQry.FieldByName('CUENTAID').AsString;

   xRegAct := DMCXP.cdsCanje.GetBookmark;
   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.IndexFieldNames:='PROV';
   DMCXP.cdsCanje.First;

   xTotRetMN:=0;
   xTotRetME:=0;
   xTotPagMN:=0;
   xTotPagME:=0;

   DMCXP.cdsMovCxP.DisableControls;
   DMCXP.cdsMovCxP.Filtered:=False;
   xPagoParc:= false;
   while not DMCXP.cdsCanje.Eof do
   begin

      if DMCXP.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
             VarArrayOf([DMCXP.cdsCanje.FieldByName('CIAID').AsString,
                         DMCXP.cdsCanje.FieldByName('TDIARID').AsString,
                         DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString,
                         DMCXP.cdsCanje.FieldByName('CPNOREG').AsString]), []) then
      begin
      // Para saber si el Documento es de Retención
         xSQL:='select DOCRETIGV from TGE110 '
              +'where DOCMOD=''CXP'' and DOCID='''+DMCXP.cdsMovCxP.FieldByName('DOCID').AsString+'''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.Datarequest( xSQL );
         DMCXP.cdsQry.Open;

         if DMCXP.cdsQry.FieldByName('DOCRETIGV').AsString='S' then
         begin
         //CIM 11/06/2002
            if ((DMCXP.cdsMovCxP.FieldByName('CPIGV').AsFloat>0) and  (DMCXP.cdsMovCxP.FieldByName('CPFEMIS').AsDateTime>=xTasaFec)) OR
               (DMCXP.cdsMovCxP.FieldByName('PROVRETIGV').AsString='S') then
            begin

							if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
							begin
								xTotRetMN:=xTotRetMN + DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat;
								xTotRetME:=xTotRetME + FRound((DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat)/DMCXP.cdsMovCxP.fieldbyname('CPTCAMAJ').AsFloat,15,2);
							end
							else
							if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonExt then
							begin
								xTotRetME:=xTotRetME + DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat;
								xTotRetMN:=xTotRetMN + FRound((DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat)*DMCXP.cdsMovCxP.fieldbyname('CPTCAMAJ').AsFloat,15,2);
							end;
               xTotPagMN:=xTotPagMN + DMCXP.cdsCanje.fieldbyname('CCPMOLOC').AsFloat;
               xTotPagME:=xTotPagME + DMCXP.cdsCanje.fieldbyname('CCPMOEXT').AsFloat;
               if DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat>DMCXP.cdsCanje.fieldbyname('CCPMOLOC').AsFloat then
                  xPagoParc := true;
               ////////////////
            end;
         end;
         DMCXP.cdsCanje.Next;
      end;
   end;

//   xTotPagMN := xTotRetMN;
   //cim 03/07/2002 Falta resolver cuando el pago es parcial
   //esto es para pago total
   if xTotRetMN>=xTasaMonto then
   begin
      if xTotPagMN>xTotRetMN then
         xRetIGV := FRound( xTotRetMN*xTasaRet/100, 15, 2 )
      else
         if xTotRetMN>=xTasaMonto then
            xRetIGV := FRound( xTotPagMN*xTasaRet/100, 15, 2 );
      //cim 02/09/2002
      if dblcTMon.Text= DMCXP.wTMonLoc then
         xTotPago := xTotPagMN
      else
      if dblcTMon.Text= DMCXP.wTMonExt then
         xTotPago := xTotPagME;

      //*
   end;

//   InsertaRetencionIGV;

   DMCXP.cdsCanje.IndexFieldNames:='';

   DMCXP.cdsCanje.GotoBookmark(xRegAct);
   DMCXP.cdsCanje.FreeBookmark(xRegAct);
   DMCXP.cdsCanje.EnableControls;
   DMCXP.cdsMovCxP.Filtered:=True;
   DMCXP.cdsMovCxP.First;
   DMCXP.cdsMovCxP.EnableControls;
end;
//CIM 21/06/2002
procedure TFLetras.GrabaContabilidadRetencion;
var
	 xfiltro,xWhere : string;
begin
  		DMCXP.cdsDetCxP.Insert;
			DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsCCanje.fieldbyname('CIAID').AsString;
			DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := DMCXP.cdsCCanje.fieldbyname('TCANJEID').AsString;
			DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := DMCXP.cdsCCanje.fieldbyname('CANJE').AsString;
			DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsCCanje.FieldByName('TDIARID').AsString;
			DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := '0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsCCanje.FieldByName('CJAAMM').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := DMCXP.cdsCCanje.FieldByName('CJAA').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := xLote;
			DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';

      xWhere:='CPTOIS='+Quotedstr('R');
      BuscaQry('dspTGE','CAJA201','CPTOID,CPTODES,CUENTAID',xWhere,'CUENTAID');

			DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := DMCXP.cdsQry.FieldByName('CUENTAID').AsString;
			DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   := DMCXP.cdsQry.FieldByName('CPTOID').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := DMCXP.cdsQry.FieldByName('CPTODES').AsString;

			DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
			DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsCCanje.FieldByName('PROV').AsString;

			DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := '';
			DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := '000';
			DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := 'S/N';

 		  DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := 'H';

  		DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsCCanje.FieldByName('MTORETIGV').AsFloat;
			if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
      begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := DMCXP.cdsCCanje.FieldByName('MTORETIGV').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := FRound(DMCXP.cdsCCanje.FieldByName('MTORETIGV').AsFloat/DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsFloat ,15,2);
      end
			else
      begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := FRound(DMCXP.cdsCCanje.FieldByName('MTORETIGV').AsFloat*DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsFloat ,15,2);
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := DMCXP.cdsCCanje.FieldByName('MTORETIGV').AsFloat;
      end;

			DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsFloat;
			DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := DMCXP.cdsCCanje.FieldByName('TMONID').AsString;

			DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime:= DMCXP.cdsCCanje.FieldByName('CJFCANJE').AsDateTime;

			DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime := DMCXP.cdsCCanje.FieldByName('CJFCANJE').AsDateTime;
			DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime:= DMCXP.cdsCCanje.FieldByName('CJFCOMP').AsDateTime;
			DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'P';
			DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString    := DMCXP.cdsCCanje.FieldByName('CJMM').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString    := DMCXP.cdsCCanje.FieldByName('CJDD').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString   := DMCXP.cdsCCanje.FieldByName('CJTRI').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString   := DMCXP.cdsCCanje.FieldByName('CJSEM').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString    := DMCXP.cdsCCanje.FieldByName('CJSS').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString := DMCXP.cdsCCanje.FieldByName('CJAATRI').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString := DMCXP.cdsCCanje.FieldByName('CJAASEM').AsString;
			DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString  := DMCXP.cdsCCanje.FieldByName('CJAASS').AsString;
			NUMREG:=NUMREG+1;
			DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger:=NUMREG;
			DetCxPUsuario;  // Graba Usuario, Fecha y Hora
			cdsPost( DMCXP.cdsDetCxP );

end;

procedure TFLetras.Button1Click(Sender: TObject);
begin
  GeneraDetalleRetencion;
  Showmessage('ok');
end;

procedure TFLetras.GeneraDetalleRetencion;
var
   xSQL : string;
   xTotNetoOri,xTotNetoLoc,xTotNetoExt : double;
   xTTotLetOri,xTTotLetLoc,xTTotLetExt : double;
   xTRetOri : double;
   xTRetLoc : double;
   xTRetExt : double;
	 xTemRetOri,xTemRetLoc,xTemRetExt:Double;
	 xTasaRet,xTotPorc,xPorc,xTotRetIGV : double;
	 xMtoAfectoO,xMtoAfectoL,	xMtoAfectoE : double;
 	 bUltLetra,bUltFact : boolean;
	 xTasaFec : TDatetime;
	 xResta,xPorcPago : double;
begin
	 //Calcula Total Pago
	 xSQL:='Select TASAMTO, TASACAN, TASADES,TASAFEC from TGE108 Where TASAFLG=''R''';
	 DMCXP.cdsQry.Close;
	 DMCXP.cdsQry.Datarequest( xSQL );
	 DMCXP.cdsQry.Open;
	 if DMCXP.cdsQry.RecordCount=0 then
	 begin
	 	 ShowMessage('No hay Tasa de Retención definida');
		 exit;
	 end;
	 xTasaRet  := FRound(DMCXP.cdsQry.FieldByname('TASACAN').AsFloat/100,15,2);
	 xTasaFec  := DMCXP.cdsQry.FieldByname('TASAFEC').AsDateTime;
	 xResta    := 1;
   xPorcPago := 1;

	 DMCXP.cdsLetras.DisableControls;
	 xTTotLetOri := 0;
	 xTTotLetLoc := 0;
	 xTTotLetExt := 0;
   xTRetOri    := 0;
	 xTRetLoc    := 0;
	 xTRetExt    := 0;
	 xTotNetoOri := 0;
	 xTotNetoLoc := 0;
	 xTotNetoExt := 0;
	 xTemRetOri  := 0;
	 xTemRetLoc  := 0;
	 xTemRetExt  := 0;
	 xTotRetIGV  := 0;
	 bUltLetra   := false;
	 bUltFact    := false;

	 if DMCXP.cdsDetRet.RecordCount>0 then
	 begin
       DMCXP.cdsDetRet.First;

       while not DMCXP.cdsDetRet.Eof do
       begin
             DMCXP.cdsDetRet.Delete
       end;
       DMCXP.cdsDetRet.Edit;
       DMCXP.cdsDetRet.Post;
	 end;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
	    xSQL:=' SELECT CXP304.*,TGE110.DOCRETIGV '+
            ' FROM CXP304 LEFT JOIN TGE110 ON CXP304.DOCID=TGE110.DOCID  '+
            ' WHERE CIAID='+Quotedstr(DMCXP.cdsCCanje.FieldByName('CIAID').AsString)+
            ' AND TCANJEID='+Quotedstr('LE')+
            ' AND CCPCANJE='+Quotedstr(DMCXP.cdsCCanje.FieldByName('CANJE').AsString)+
            ' AND TGE110.DOCMOD=''CXP'' '+
            ' AND TGE110.DOCRETIGV=''S''';
   end;
   if SRV_D = 'ORACLE' then
   begin
	    xSQL:=' SELECT CXP304.*, TGE110.DOCRETIGV '+
            ' FROM CXP304, TGE110 '+
            ' WHERE CIAID='+Quotedstr(DMCXP.cdsCCanje.FieldByName('CIAID').AsString)+
            ' AND TCANJEID='+Quotedstr('LE')+
            ' AND CCPCANJE='+Quotedstr(DMCXP.cdsCCanje.FieldByName('CANJE').AsString)+
            ' AND TGE110.DOCMOD=''CXP'' '+
            ' AND TGE110.DOCRETIGV=''S'' '+
            ' AND CXP304.DOCID=TGE110.DOCID';
   end;
	 DMCXP.cdsCanjeClone.Filter := '';
	 DMCXP.cdsCanjeClone.Filtered := false;
	 DMCXP.cdsCanjeClone.Close;
	 DMCXP.cdsCanjeClone.DataRequest(xSQL);
	 DMCXP.cdsCanjeClone.Open;

	 DMCXP.cdsLetras.First ;
	 while not DMCXP.cdsLetras.eof do
	 begin
       xTTotLetOri := xTTotLetOri + DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat;
       xTTotLetLoc := xTTotLetLoc + DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat;
       xTTotLetExt := xTTotLetExt + DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat;
       DMCXP.cdsLetras.Next;
	 end;

	 xTRetOri := DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat;

	 if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
	 begin
		  xTRetLoc := FRound(DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat,15,2);
		  xTRetExt := FRound(DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat/DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,2);
	 end
	 else
   begin
       if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
       begin
          xTRetLoc := FRound(DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat*DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,2);
          xTRetExt := FRound(DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat,15,2);
       end;
   end;


	 DMCXP.cdsLetras.First ;
	 DMCXP.cdsCanje.DisableControls;
	 DMCXP.cdsCanjeClone.First;

	 While not DMCXP.cdsLetras.Eof do
	 begin

		 if DMCXP.cdsLetras.RecNo=DMCXP.cdsLetras.RecordCount then
		 begin
          xPorc := Fround(100-xTotPorc,15,2);
          if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
          begin
             xTemRetOri := Fround(xTRetOri-xTotRetIgv,15,3);
             xTemRetLoc := xTemRetOri;
             xTemRetExt := Fround(xTemRetOri/DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3)
          end
          else
             if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
             begin
                xTemRetOri := FRound(xTRetOri-xTotRetIgv,15,3);
                xTemRetExt := xTemRetOri;
                xTemRetLoc := Fround(xTemRetOri*DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3)
             end;
		 end
		 else
		 begin
          if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
          begin
             xPorc := FRound(FRound((DMCXP.cdsLetras.fieldbyname('CPMTOLOC').AsFloat/xTTotLetLoc),15,4)*100,15,2);
             xTemRetOri := FRound(xTRetOri*FRound(xPorc/100,15,4),15,3);
             xTemRetLoc := xTemRetOri;
             xTemRetExt := Fround(xTemRetOri/DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3)
          end
          else
             if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
             begin
                xPorc := FRound(FRound((DMCXP.cdsLetras.fieldbyname('CPMTOEXT').AsFloat/xTTotLetExt),15,4)*100,15,2);
                xTemRetOri := FRound(xTRetOri*FRound(xPorc/100,15,4),15,3);
                xTemRetExt := xTemRetOri;
                xTemRetLoc := Fround(xTemRetOri*DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3)
             end;
		 end;//if

		 if DMCXP.cdsLetras.RecNo=DMCXP.cdsLetras.RecordCount then
		 begin
          bUltLetra := true ;
          DMCXP.cdsLetras.Edit;
          DMCXP.cdsLetras.FieldByName('CPNOGRAV').AsFloat   := FRound(xTRetOri-xTotRetIgv,15,2);
          DMCXP.cdsLetras.fieldbyname('PROVRETIGV').AsString := 'S';  // Indica que el Documento está sujeto a retención IGV.
          DMCXP.cdsLetras.Post;
		 end
		 else
		 begin
			 bUltLetra := false;
			 DMCXP.cdsLetras.Edit;
			 DMCXP.cdsLetras.FieldByName('CPNOGRAV').AsFloat   :=   FRound(xTemRetOri,15,2);
			 DMCXP.cdsLetras.fieldbyname('PROVRETIGV').AsString := 'S';  // Indica que el Documento está sujeto a retención IGV.
			 DMCXP.cdsLetras.Post;
		 end;//if

		 xTotRetIGV := FRound(xTotRetIGV+xTemRetOri,15,3);

		 While not DMCXP.cdsCanjeClone.Eof do
		 begin
				xSQL:='select DOCRETIGV,DOCRESTA from TGE110 '
							+'where DOCMOD=''CXP'' and DOCID='''+DMCXP.cdsCanjeClone.FieldByName('DOCID').AsString+'''';
				DMCXP.cdsQry.Close;
				DMCXP.cdsQry.Datarequest( xSQL );
				DMCXP.cdsQry.Open;

{				if DMCXP.cdsQry.FieldByName('DOCRESTA').AsString='S' then
					 xResta:=-1
				else
					 xResta:=1; }

				xSQL :=  ' SELECT * FROM CXP301 '+
                     ' WHERE CIAID='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('CIAID').AsString)+
                     ' AND TDIARID='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('TDIARID').AsString)+
                     ' AND CPANOMES='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('CCPANOMM').AsString)+
                     ' AND DOCID='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('DOCID').AsString)+
                     ' AND CPSERIE='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('CPSERIE').AsString)+
                     ' AND CPNODOC='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('CPNODOC').AsString)+
                     ' AND (CPESTADO=''P'' OR CPESTADO=''C'')';

			   DMCXP.cdsMovCxP.IndexFieldNames:='';
				DMCXP.cdsMovCxP.Filter:='';
				DMCXP.cdsMovCxP.Filtered:= false;
				DMCXP.cdsMovCxP.Close;
				DMCXP.cdsMovCxP.DataRequest(xSQL);
				DMCXP.cdsMovCxP.Open;
				xMtoAfectoO := (DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat)*xResta;
				if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
				begin
{					xMtoAfectoL:=(DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat)*xResta;
					xMtoAfectoE:=(FRound((DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat)/DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat,15,2))*xResta;}
//          xPorcPago  := FRound( DMCXP.cdsCanjeClone.fieldbyname('CCPMOLOC').AsFloat/(DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat),15,5);
          xPorcPago  := FRound( DMCXP.cdsCanjeClone.fieldbyname('CCPMOLOC').AsFloat/(DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat),15,5);
					xMtoAfectoL:= Fround((DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat)*xResta*xPorcPago,15,2);
					xMtoAfectoE:= FRound((FRound((DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat)/DMCXP.cdsMovCxP.fieldbyname('CPTCAMAJ').AsFloat,15,2))*xResta*xPorcPago,15,2);

				end
				else
				if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonExt then
				begin
//          xPorcPago  := FRound(DMCXP.cdsCanjeClone.fieldbyname('CCPMOEXT').AsFloat/(DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat),15,5);
          xPorcPago  := FRound(DMCXP.cdsCanjeClone.fieldbyname('CCPMOEXT').AsFloat/(DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat),15,5);
					xMtoAfectoE:= FRound((DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat)*xResta*xPorcPago,15,2);
					xMtoAfectoL:= FRound((FRound((DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat)*DMCXP.cdsMovCxP.fieldbyname('CPTCAMAJ').AsFloat,15,2))*xResta*xPorcPago,15,2);
				end;
        xMtoAfectoO := FRound(xMtoAfectoO*xPorcPago,15,2);

				if ((DMCXP.cdsQry.FieldByName('DOCRETIGV').AsString='S') and  (DMCXP.cdsMovCxp.FieldByName('CPFEMIS').AsDateTime>=xTasaFec) )then
				begin
					 DMCXP.cdsDetRet.Insert;
					 DMCXP.cdsDetRet.FieldByName('CIAID').AsString    := DMCXP.cdsLetras.fieldbyname('CIAID').AsString;
					 DMCXP.cdsDetRet.FieldByName('TCANJEID').AsString := DMCXP.cdsLetras.fieldbyname('TCANJEID').AsString;
					 DMCXP.cdsDetRet.FieldByName('CANJE').AsString    := DMCXP.cdsLetras.fieldbyname('CPCANJE').AsString;
					 DMCXP.cdsDetRet.FieldByName('CLAUXID').AsString  := DMCXP.cdsLetras.fieldbyname('CLAUXID').AsString;
					 DMCXP.cdsDetRet.FieldByName('PROV').AsString     := DMCXP.cdsLetras.fieldbyname('PROV').AsString;
					 DMCXP.cdsDetRet.FieldByName('PROVRUC').AsString  := DMCXP.cdsLetras.fieldbyname('PROVRUC').AsString;
					 DMCXP.cdsDetRet.FieldByName('CPANOMES').AsString := DMCXP.cdsLetras.fieldbyname('CPANOMES').AsString;
					 DMCXP.cdsDetRet.FieldByName('CJTCAMBIO').AsFloat := DMCXP.cdsLetras.fieldbyname('CPTCAMAJ').AsFloat;
					 DMCXP.cdsDetRet.FieldByName('CPRETFEMIS').AsDatetime := DMCXP.cdsCCanje.fieldbyname('CJFCANJE').AsDateTime;

					 DMCXP.cdsDetRet.FieldByName('TMONID').AsString     := DMCXP.cdsLetras.fieldbyname('TMONID').AsString;
					 DMCXP.cdsDetRet.FieldByName('CPNOREGLET').AsString := DMCXP.cdsLetras.fieldbyname('CPNOREG').AsString;
					 DMCXP.cdsDetRet.FieldByName('DOCID').AsString      := DMCXP.cdsLetras.fieldbyname('DOCID').AsString;
					 DMCXP.cdsDetRet.FieldByName('CPSERIE').AsString    := DMCXP.cdsLetras.fieldbyname('CPSERIE').AsString;
					 DMCXP.cdsDetRet.FieldByName('CPNODOC').AsString    := DMCXP.cdsLetras.fieldbyname('CPNODOC').AsString;
					 DMCXP.cdsDetRet.FieldByName('CPFEMIS').AsDatetime  := DMCXP.cdsLetras.fieldbyname('CPFEMIS').AsDatetime;
					 DMCXP.cdsDetRet.FieldByName('CPFVCMTO').AsDatetime := DMCXP.cdsLetras.fieldbyname('CPFVCMTO').AsDatetime;

					 DMCXP.cdsDetRet.FieldByName('CPMTOORI').AsFloat    := DMCXP.cdsLetras.fieldbyname('CPMTOORI').AsFloat;
					 DMCXP.cdsDetRet.FieldByName('CPMTOLOC').AsFloat    := DMCXP.cdsLetras.fieldbyname('CPMTOLOC').AsFloat;
					 DMCXP.cdsDetRet.FieldByName('CPMTOEXT').AsFloat    := DMCXP.cdsLetras.fieldbyname('CPMTOEXT').AsFloat;

					 if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
					 begin
                   if DMCXP.cdsLetras.RecNo=DMCXP.cdsLetras.RecordCount then
                      DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat :=FRound(100-xTotPorc,15,2)
                   else
                      DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat := FRound(FRound((DMCXP.cdsLetras.fieldbyname('CPMTOLOC').AsFloat/xTTotLetLoc),15,4)*100,15,2);
					 end
					 else
                   if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
                   begin
                      if DMCXP.cdsLetras.RecNo=DMCXP.cdsLetras.RecordCount then
                         DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat :=FRound(100-xTotPorc,15,2)
                      else
                         DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat := FRound(FRound((DMCXP.cdsLetras.fieldbyname('CPMTOEXT').AsFloat/xTTotLetExt),15,4)*100,15,2);
                   end;

					 if bUltLetra then
					 begin
                   DMCXP.cdsDetRet.FieldByName('CPNETOORI').AsFloat  :=	 xMtoAfectoO - OperClientDataSet( DMCXP.cdsDetRet, 'SUM(CPNETOORI)', 'CPSERIE2='
                   +Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPSERIE').AsString)+' AND CPNODOC2='+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPNODOC').AsString));

                   DMCXP.cdsDetRet.FieldByName('CPNETOLOC').AsFloat  :=   xMtoAfectoL - OperClientDataSet( DMCXP.cdsDetRet, 'SUM(CPNETOLOC)', 'CPSERIE2='
                   +Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPSERIE').AsString)+' AND CPNODOC2='+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPNODOC').AsString));

                   DMCXP.cdsDetRet.FieldByName('CPNETOEXT').AsFloat  :=   xMtoAfectoE - OperClientDataSet( DMCXP.cdsDetRet, 'SUM(CPNETOEXT)', 'CPSERIE2='
                   +Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPSERIE').AsString)+' AND CPNODOC2='+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPNODOC').AsString));

                   DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat:= FRound(100-xTotPorc,15,2);
                   if DMCXP.cdsCanjeClone.RecNo=DMCXP.cdsCanjeClone.RecordCount then
                   begin
                      DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat:= xTemRetOri;
                      DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat:= xTemRetLoc;
                      DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat:= xTemRetExt;
                   end
                   else
                   begin
                      if DMCXP.cdsCanjeClone.RecNo=DMCXP.cdsCanjeClone.RecordCount then
                      begin
                         DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat:= xTemRetOri;
                         DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat:= xTemRetLoc;
                         DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat:= xTemRetExt;
                      end
                      else
                      begin
                         if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
                            DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPNETOLOC').AsFloat*xTasaRet,15,3)
                         else
                            if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
                               DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPNETOEXT').AsFloat*xTasaRet,15,3);

                         if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
                         begin
                            DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat  := DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat;
                            DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat/DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3);
                         end
                         else
                            if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
                            begin
                               DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat*DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3);
                               DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat  := DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat;
                            end;
                      end;

                      xTemRetOri := FRound(xTemRetOri -DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat,15,3);
                      xTemRetLoc := FRound(xTemRetLoc -DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat,15,3);
                      xTemRetExt := FRound(xTemRetExt -DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat,15,3);
                   end;
					 end
                else
                begin
                   DMCXP.cdsDetRet.FieldByName('CPNETOORI').AsFloat  := Fround(xMtoAfectoO*FRound((DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat/100),8,4),15,2);
                   DMCXP.cdsDetRet.FieldByName('CPNETOLOC').AsFloat  := Fround(xMtoAfectoL*FRound((DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat/100),8,4),15,2);
                   DMCXP.cdsDetRet.FieldByName('CPNETOEXT').AsFloat  := Fround(xMtoAfectoE*FRound((DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat/100),8,4),15,2);

                   if DMCXP.cdsCanjeClone.RecNo=DMCXP.cdsCanjeClone.RecordCount then
                   begin
                      DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat:= xTemRetOri;
                      DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat:= xTemRetLoc;
                      DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat:= xTemRetExt;
                   end
                   else
                   begin
                      if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
                           DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPNETOLOC').AsFloat*xTasaRet,15,3)
                      else
                           if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
                               DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPNETOEXT').AsFloat*xTasaRet,15,3);

                      if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
                      begin
                           DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat  := DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat;
                           DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat/DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3);
                      end
                      else
                           if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
                           begin
                              DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat*DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3);
                              DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat  := DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat;
                           end;
                      xTemRetOri := FRound(xTemRetOri -DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat,15,3);
                      xTemRetLoc := FRound(xTemRetLoc -DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat,15,3);
                      xTemRetExt := FRound(xTemRetExt -DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat,15,3);
                   end;
                end;

					 DMCXP.cdsDetRet.FieldByName('TMONID2').AsString     := DMCXP.cdsCanjeClone.fieldbyname('TMONID').AsString;
                DMCXP.cdsDetRet.FieldByName('DOCID2').AsString      := DMCXP.cdsCanjeClone.fieldbyname('DOCID').AsString;
                DMCXP.cdsDetRet.FieldByName('CPSERIE2').AsString    := DMCXP.cdsCanjeClone.fieldbyname('CPSERIE').AsString;
                DMCXP.cdsDetRet.FieldByName('CPNODOC2').AsString    := DMCXP.cdsCanjeClone.fieldbyname('CPNODOC').AsString;
                DMCXP.cdsDetRet.FieldByName('CPFEMIS2').AsDatetime  := DMCXP.cdsCanjeClone.fieldbyname('CPFEMIS').AsDatetime;
                DMCXP.cdsDetRet.FieldByName('CPFVCMTO2').AsDatetime := DMCXP.cdsCanjeClone.fieldbyname('CPFVCMTO').AsDatetime;

                DMCXP.cdsDetRet.FieldByName('CPMTOORI2').AsFloat    := xMtoAfectoO;
                DMCXP.cdsDetRet.FieldByName('CPMTOLOC2').AsFloat    := xMtoAfectoL;
                DMCXP.cdsDetRet.FieldByName('CPMTOEXT2').AsFloat    := xMtoAfectoE;
                DMCXP.cdsDetRet.FieldByName('CPANOMES2').AsString   := DMCXP.cdsCanjeClone.fieldbyname('CCPANOMM').AsString;
                DMCXP.cdsDetRet.FieldByName('CPTCAMPR').AsFloat     := DMCXP.cdsCanjeClone.fieldbyname('CCPTCDOC').AsFloat;

                DMCXP.cdsDetRet.FieldByName('CPFREG').value         := Date;
                DMCXP.cdsDetRet.FieldByName('CPHREG').value         := Time;
                DMCXP.cdsDetRet.FieldByName('CPUSER').AsString      := DMCXP.wUsuario;
                DMCXP.cdsDetRet.Post;
                DMCXP.cdsCanjeClone.Next;
           end
           else
           begin
              DMCXP.cdsCanjeClone.Next;
           end;

     end;//canje

     DMCXP.cdsLetras.Next;
     xTotPorc := FRound(xTotPorc+DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat,15,2);
     DMCXP.cdsCanjeClone.First;
    end;
    DMCXP.AplicaDatos( DMCXP.cdsDetRet, 'DetRet'  );
    DMCXP.cdsCanje.EnableControls;
    DMCXP.cdsLetras.EnableControls;
end;

procedure TFLetras.dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
  NewValue: String; var Accept: Boolean);
begin
//GAR***************************************************************************
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
//GAR***************************************************************************
end;

procedure TFLetras.dblcClAuxNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
//GAR***************************************************************************
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
//GAR***************************************************************************
end;

procedure TFLetras.dblcTDocNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
//GAR***************************************************************************
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
//GAR***************************************************************************
end;

procedure TFLetras.dblcTDiarioNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
//GAR***************************************************************************
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
//GAR***************************************************************************
end;

procedure TFLetras.dblcTMonNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
//GAR***************************************************************************
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
//GAR***************************************************************************
end;

procedure TFLetras.FormShow(Sender: TObject);
var
 xsql, xWhere : string;
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );

   xCrea := True;
   xsql := 'SELECT * FROM TGE105 WHERE BCOTIPCTA='+quotedstr('B');
   DMCXP.cdsBanco.close;
   DMCXP.cdsBanco.DataRequest(xsql);
   DMCXP.cdsBanco.open;

   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );

   if DMCXP.wModo='A' then begin
      InicializaClientDataSet;
      InicializaDatos;
      EstadoDeForma( 0, ' ', ' ' );
      dblcCia.SetFocus;
      end
   else
    begin
      dblcCia.Text     := DMCXP.cdsCCanje.fieldbyname('CiaId').AsString;
      edtCanje.Text    := DMCXP.cdsCCanje.fieldbyname('Canje').AsString;
      dblcdProv.Text   := DMCXP.cdsCCanje.fieldbyname('PROV').AsString;
      dblcdProvRuc.Text:= DMCXP.cdsCCanje.fieldbyname('PROVRUC').AsString;
      dblcClAux.Text   := DMCXP.cdsCCanje.fieldbyname('CLAUXID').AsString;
      xAnomes          := DMCXP.cdsCCanje.fieldbyname('CJAAMM').AsString;

      FiltraCanje;

      edtCia.Text     := DMCXP.DisplayDescrip('TGE101','CIADES','CIAID',dblcCia.Text);
      xWhere:='ClAuxId='''+dblcClAux.Text+''' and Prov='''+dblcdProv.Text+'''';
      edtProv.Text    :=BuscaQry('dspTGE','TGE201','Prov, ProvRUC, ProvDES',xWhere,'ProvDES');
      //edtProv.text    := DMCXP.DisplayDescrip('TGE201','PROVDES','PROV',dblcdProv.Text);
      dblcTDoc.Text   := DMCXP.cdsCCanje.fieldbyname('DOCID').AsString;
      dblcTDiario.Text:= DMCXP.cdsCCanje.fieldbyname('TDIARID').AsString;
      //CIM 18/06/2002
      xWhere:='DOCID='''+dblcTDoc.Text+''' and DOCMOD='''+'CXP'+'''';
      edtTDoc.Text  :=BuscaQry('dspTGE','TGE110','DOCDES,DOCCONTA',xWhere,'DOCDES');
      //edtTDoc.Text    := DMCXP.DisplayDescrip('TGE110','DOCDES',  'DOCID',  dblcTDoc.Text);
      //xConta          := DMCXP.cdsULTTGE.fieldbyname('DOCCONTA').AsString;
      xConta          := DMCXP.cdsQry.fieldbyname('DOCCONTA').AsString;
      //*
      edtTDiario.Text := DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);
      edtTMon.Text    := DMCXP.DisplayDescrip('TGE103','TMONDES', 'TMONID', dblcTMon.Text);

       if DMCXP.wVRN_CptoCia='N' then
          xSQL:='select * from CXP201 '
       else
          xSQL:='select * from CXP201 '
               +'Where CIAID='+quotedstr(dblcCia.Text);

       DMCXP.cdsCnpEgr.Close;
       DMCXP.cdsCnpEgr.DataRequest( xSQL );
       DMCXP.cdsCnpEgr.Open;


      If DMCXP.cdsCCanje.fieldbyname('CJESTADO').AsString='I' then
         EstadoDeForma(0,DMCXP.cdsCCanje.fieldbyname('CJESTADO').AsString,' ' )
      else
         EstadoDeForma(1,DMCXP.cdsCCanje.fieldbyname('CJESTADO').AsString,DMCXP.cdsCCanje.fieldbyname('CJ_CONTA').AsString );
    end;

   tnbDetalle.PageIndex := 0;

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

   if DMCXP.wVRN_ProvAutoDD='S' then
      dblcdProv.AutoDropDown:=true
   else begin
      dblcdProv.AutoDropDown:=false;
   end;

   if DMCXP.wVRN_CptoCia='N' then
      xSQL:='select * from CXP201 '
   else begin
      xSQL:='select * from CXP201 '
           +'Where CIAID='+quotedstr(dblcCia.Text);
   end;
   DMCXP.cdsCnpEgr.Close;
   DMCXP.cdsCnpEgr.DataRequest( xSQL );
   DMCXP.cdsCnpEgr.Open;
	DMCXP.cdsCnpEgr.IndexFieldNames:='CPTOID';
// Nota : Los Conceptos no se filtran por "Sólo Movimientos", el usuario necesita ver los Títulos
// del Concepto.

   xCrea := False;

end;

end.
