unit CXP240;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, Mask, wwdbedit, Wwdbdlg,
  StdCtrls, wwdblook, ExtCtrls, DB, Buttons, ppDB, ppDBPipe, ppCtrls,
  ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, ppViewr, pptypes, oaVariables;

type
  TFAplicaCaja = class(TForm)
    pnlCab1: TPanel;
    lblCia: TLabel;
    lblProv: TLabel;
    lblProvNom: TLabel;
    Label6: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dblcdProv: TwwDBLookupComboDlg;
    edtProv: TEdit;
    dblcClAux: TwwDBLookupCombo;
    Panel1: TPanel;
    dbgPagos: TwwDBGrid;
    Label1: TLabel;
    Z2bbtnAcepta: TBitBtn;
    bbtnCancela: TBitBtn;
    pnlCanje: TPanel;
    Label2: TLabel;
    Label8: TLabel;
    edtDocDes2: TEdit;
    dbdtpFEmis: TwwDBDateTimePicker;
    dblcDoc2: TwwDBLookupCombo;
    Z2bbtnContab: TBitBtn;
    Label12: TLabel;
    dbeTCambio: TwwDBEdit;
    Label9: TLabel;
    dbeLote: TwwDBEdit;
    Label10: TLabel;
    dbeAnoMM: TwwDBEdit;
    Z2bbtnPreview: TBitBtn;
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
    ppdbpPreview: TppDBPipeline;
    Label15: TLabel;
    dtpFComp: TwwDBDateTimePicker;
    pnlEstado: TPanel;
    lblAnula: TLabel;
    lblActivo: TLabel;
    lblContab: TLabel;
    lblAcepta: TLabel;
    lblEliminado: TLabel;
    Label5: TLabel;
    lblTDoc: TLabel;
    lblSerie: TLabel;
    lblNoDoc: TLabel;
    lblTDiario: TLabel;
    lblNoReg: TLabel;
    lblAnoMes: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    edtTDoc: TEdit;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    edtSerie: TwwDBEdit;
    edtNoDoc: TwwDBEdit;
    meNoReg: TwwDBEdit;
    dblcTDoc: TwwDBLookupCombo;
    meAnoMM: TwwDBEdit;
    dbeSalMN: TwwDBEdit;
    dbeSalME: TwwDBEdit;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    Bevel1: TBevel;
    Label7: TLabel;
    edtCanje: TEdit;
    Label13: TLabel;
    edtComp: TEdit;
    Label14: TLabel;
    dblcTDiario2: TwwDBLookupCombo;
    edtTDDes: TEdit;
    procedure dbgPagosColExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbdtpFEmisExit(Sender: TObject);
    procedure Z2bbtnPreviewClick(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure pprPreviewPreviewFormCreate(Sender: TObject);
    procedure Z2bbtnContabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    xRegAct : TBookMark;
    xNoReg  : String;
    wCje    : String;
    wTDiar  : String;
    xNReg   : Integer;
    xxTDiar : string;
    xTotMN, xTotME : Double;
    procedure SumatTotal(Sender: TObject);
    procedure GrabaCabeceraCanje;
    procedure GrabaDetalleCanje;
    procedure LlenaDetCxP1(xxNReg:string);
    procedure GeneraDiferenciaCambio(xxNReg:string);
    procedure GeneraDiferenciaCambio2(xxNReg:string);
    procedure ActualizaCaja;
    function  AsientoCuadra:Boolean;
    procedure ActualizaSaldoCXP;
    Procedure GrabaDetCanje;
    procedure EstadoDeForma( xMovEstado, xMovConta : String );
    procedure CargaDataSource;
  public
    { Public declarations }
    xModo : String;
  end;

var
  FAplicaCaja: TFAplicaCaja;

implementation

{$R *.DFM}

Uses CXPDM, CXP001;

procedure TFAplicaCaja.dbgPagosColExit(Sender: TObject);
begin

   if xModo='EDITA' then Exit;

   if ( dbgPagos.SelectedField.FieldName='PAGOMN' ) then
   begin
      DMCXP.cdsDetCanje.Edit;
      if DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsFloat>DMCXP.cdsDetCanje.FieldByName('ECSALMN').AsFloat then
      begin
         DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsFloat:=0;
         DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat:=0;
         raise exception.create('Error: Monto no debe ser mayor al Saldo');
      end
      else begin
         DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat:=FRound( DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsFloat / DMCXP.cdsDetCanje.FieldByName('ECTCAMB').AsFloat,15,2);
         //TNumericField(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT')).DisplayFormat := '###,###,##0.00';
      end;
      SumatTotal(Sender);
   end;

   if ( dbgPagos.SelectedField.FieldName='PAGOME' ) then
   begin
      DMCXP.cdsDetCanje.Edit;
      if DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat>DMCXP.cdsDetCanje.FieldByName('ECSALME').AsFloat then
      begin
         DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsFloat:=0;
         DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat:=0;
         raise exception.create('Error: Monto no debe ser mayor al Saldo');
      end
      else begin
         DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsFloat:=FRound( DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat * DMCXP.cdsDetCanje.FieldByName('ECTCAMB').AsFloat,15,2);
         //TNumericField(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT')).DisplayFormat := '###,###,##0.00';
      end;
      SumatTotal(Sender);
   end;
end;


procedure TFAplicaCaja.SumatTotal(Sender: TObject);
begin
   xTotMN:=0;
   xTotME:=0;
   DMCXP.cdsDetCanje.DisableControls;  // inhab. movim. de puntero pal grid
   xRegAct := DMCXP.cdsDetCanje.GetBookmark;  // marca reg. donde se quedo
   DMCXP.cdsDetCanje.First ;
   while not DMCXP.cdsDetCanje.Eof do
   begin
      xTotMN:=xTotMN+DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsFloat;
      xTotME:=xTotME+DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat;;
      DMCXP.cdsDetCanje.Next;
   end;
   DMCXP.cdsDetCanje.GotoBookmark( xRegAct );
   DMCXP.cdsDetCanje.FreeBookmark( xRegAct );
   DMCXP.cdsDetCanje.EnableControls;

   dbgPagos.ColumnByName('PAGOMN').FooterValue:=FloatToStrF(xTotMN, ffNumber, 15, 2 );
   dbgPagos.ColumnByName('PAGOME').FooterValue:=FloatToStrF(xTotME, ffNumber, 15, 2 );

end;


procedure TFAplicaCaja.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;


procedure TFAplicaCaja.Z2bbtnAceptaClick(Sender: TObject);
begin
   try
     if StrToFloat(dbeTCambio.Text)<=0 then begin
        ShowMessage( 'Error : Ingresar Tipo de Cambio' );
        Exit;
     end;
   except
     ShowMessage( 'Error : Ingresar Tipo de Cambio' );
     Exit;
   end;

   if ( FRound(xTotME,15,2)<=0 ) AND ( FRound(xTotMN,15,2)<=0 ) then begin
      ShowMessage( 'Error : No existe monto a Aplicar' );
      Exit;
   end;


   if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonExt then begin
      if FRound(xTotME,15,2)>FRound(DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat,15,2) then begin
         ShowMessage( 'Error : Monto en Dolares a aplicar excede al Documento' );
         Exit;
      end;
   end
   else begin
      if FRound(xTotMN,15,2)>FRound(DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat,15,2) then begin
         ShowMessage( 'Error : Monto en Dolares a aplicar excede al Documento' );
         Exit;
      end;
   end;

   if MessageDlg( 'Aplica Pagos de Caja a Documentos' + chr(13)+
                  '         ¿ Esta Seguro ?         ',mtConfirmation,[mbYes, mbNo],0)=mrNo then
      exit;

   GrabaCabeceraCanje;

   GrabaDetalleCanje;

   ActualizaCaja;

   ActualizaSaldoCXP;

   GrabaDetCanje;

   DMCXP.SaldosAuxiliar( DMCXP.cdsMovCxP.FieldByName('CIAID').AsString,   DMCXP.cdsCCanje.fieldbyname('CJAAMM').AsString,
                       DMCXP.cdsCCanje.FieldByName('CLAUXID').AsString, DMCXP.cdsCCanje.FieldByName('PROV').AsString,
   		       '=', xTotMN, xTotME, DMCXP.cdsCCanje.fieldbyname('TMONID').AsString );

   edtCanje.text:=DMCXP.cdsCCanje.FieldByName('CANJE').AsString;
   edtComp.text :=DMCXP.cdsCCanje.FieldByName('CCCMPRB').AsString;

   EstadoDeForma( DMCXP.cdsCCanje.fieldbyname('CJESTADO').AsString, DMCXP.cdsCCanje.fieldbyname('CJ_CONTA').AsString );

   ShowMessage( 'Aplicación OK');
end;


procedure TFAplicaCaja.GrabaCabeceraCanje;
var
   sSQL, xNCanje, xTAutoNum : string;
   xxC1, xxC2, xxC3 : string;
   a, m, d : word;
   xxTAno, xxTMes : string;
   nNoReg : integer;
begin
   DecodeDate(dbdtpFEmis.Date,a,m,d);
   xxTAno   :=StrZero(IntToStr(a),4);
   xxTMes   :=StrZero(IntToStr(m),2);
//   xxTDiar  :=BuscaQry('dspTGE','TGE110','TDIARID','DOCTIPREG=''AP'' AND DOCMOD=''CAJA''','TDIARID');
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

  sSQL:='CIAID='+QuotedStr(dblcCia.Text)+' AND TCANJEID='+QuotedStr('CA');
  xxc1 :=StrZero(DMCXP.BuscaUltTGE('dspTGE','CXP304','CCPCANJE',sSQL),6);
  xxc2 :=StrZero(DMCXP.BuscaUltTGE('dspTGE','CXP301','CPCANJE',sSQL),6);
  xxc3 :=StrZero(DMCXP.BuscaUltTGE('dspTGE','CXP308','CANJE',sSQL),6);
  if xxc1>xxc2 then
     wCje:=xxc1
  else
     wCje:=xxc2;
  if wCje<xxc3 then
     wCje:=xxc3;

  sSQL:=' SELECT * FROM CXP308 WHERE CIAID=''CLG'' AND TCANJEID=''CLG'' AND CANJE=''CLG'' ';
  DMCXP.cdsCCanje.Close;
  DMCXP.cdsCCanje.DataRequest(sSQL);
  DMCXP.cdsCCanje.Open;

  wTDiar:=xxTDiar;
  DMCXP.cdsCCanje.Insert;
  DMCXP.cdsCCanje.FieldByName('CIAID').AsString     :=dblcCia.text;
  DMCXP.cdsCCanje.FieldByName('TCANJEID').AsString  :='CA';
  DMCXP.cdsCCanje.FieldByName('CANJE').AsString     :=wCje;
  DMCXP.cdsCCanje.FieldByName('PROV').AsString      :=dblcdProv.text;
  DMCXP.cdsCCanje.FieldByName('PROVRUC').AsString   :=DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString;
  DMCXP.cdsCCanje.FieldByName('DOCID').AsString     :=dblcDoc2.text;

  DMCXP.cdsCCanje.fieldbyname('NDDOC').AsString    := DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
  DMCXP.cdsCCanje.fieldbyname('NDSERIE').AsString  := DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
  DMCXP.cdsCCanje.fieldbyname('NDNUMERO').AsString := DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;

  DMCXP.cdsCCanje.FieldByName('TDIARID').AsString   :=xxTDiar;
  DMCXP.cdsCCanje.FieldByName('CCCMPRB').AsString   :=xNoreg ;
  DMCXP.cdsCCanje.FieldByName('CJFCANJE').AsDateTime:=dbdtpFEmis.date;
  DMCXP.cdsCCanje.FieldByName('CJFVALOR').AsDateTime:=dbdtpFEmis.date;
  DMCXP.cdsCCanje.FieldByName('CJFCOMP').AsDateTime :=dbdtpFEmis.date;
  DMCXP.cdsCCanje.FieldByName('TMONID').AsString    :=DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;
  DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsString :=dbeTCambio.Text;
  DMCXP.cdsCCanje.FieldByName('CJLOTE').AsString    :=dbeLote.Text;
  DMCXP.cdsCCanje.FieldByName('CPTOID').AsString   :=DMCXP.cdsMovCxP.FieldByName('CPTOTOT').AsString;
  DMCXP.cdsCCanje.FieldByName('CUENTAID').AsString :=DMCXP.cdsMovCxP.FieldByName('CTATOTAL').AsString;
  DMCXP.cdsCCanje.FieldByName('CJGLOSA').AsString  :=BuscaQry('dspTGE','CXP201','CPTODES','CPTOID='+QuotedStr(DMCXP.cdsMovCxP.FieldByName('CPTOTOT').AsString),'CPTODES');
  DMCXP.cdsCCanje.FieldByName('CJNUMLET').AsInteger:=0;
  DMCXP.cdsCCanje.FieldByName('CJDIAS').AsInteger  :=0;
  DMCXP.cdsCCanje.FieldByName('CJLETINI').AsString :='';
  DMCXP.cdsCCanje.FieldByName('CJUSER').AsString   :=DMCXP.wUsuario;
  DMCXP.cdsCCanje.FieldByName('CJFREG').AsDateTime :=Date;
  DMCXP.cdsCCanje.FieldByName('CJFHOR').AsDateTime :=Time;
  DMCXP.cdsCCanje.FieldByName('CJESTADO').AsString :='P';
  DMCXP.cdsCCanje.FieldByName('CLAUXID').AsString  :=DMCXP.cdsMovCxP.FieldByName('CLAUXID').AsString;
  DMCXP.cdsCCanje.FieldByName('CJEGIRADO').AsString:=DMCXP.cdsMovCxP.FieldByName('PROVDES').AsString;
  //
  if DMCXP.cdsCCanje.FieldByName('TMONID').AsString=DMCXP.wTMonExt then
     DMCXP.cdsCCanje.FieldByName('CJTOTORI').AsFloat := xTotME
  else
     DMCXP.cdsCCanje.FieldByName('CJTOTORI').AsFloat := xTotMN;

  DMCXP.cdsCCanje.FieldByName('CJTOTLOC').AsFloat := xTotMN;
  DMCXP.cdsCCanje.FieldByName('CJTOTEXT').AsFloat := xTotME;
  //
  DMCXP.cdsCCanje.FieldByName('CJAAMM').AsString := dbeAnoMM.Text;     
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
  DMCXP.AplicaDatos( DMCXP.cdsCCanje, 'CCanje'  );
end;


procedure TFAplicaCaja.GrabaDetalleCanje;
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

         if DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsFloat>0 then begin

            xSQL:='Select * from CAJA301 A '
                 +'Where CIAID='''   +DMCXP.cdsDetCanje.FieldByName('CIAID').AsString   +''' '
                 +  'and TDIARID=''' +DMCXP.cdsDetCanje.FieldByName('TDIARID').AsString +''' '
                 +  'and ECANOMM=''' +DMCXP.cdsDetCanje.FieldByName('ECANOMM').AsString +''' '
                 +  'and ECNOCOMP='''+DMCXP.cdsDetCanje.FieldByName('ECNOCOMP').AsString+''' ';
            DMCXP.cdsQry1.Close;
            DMCXP.cdsQry1.DataRequest( xSQL );
            DMCXP.cdsQry1.Open;

            DMCXP.cdsDetCxP.Insert;
            LlenaDetCxP1(xNoReg);

            DMCXP.cdsDetCxP.Edit;
            DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    :='D';
            DMCXP.cdsDetCxP.FieldByName('DOCID').AsString   := DMCXP.cdsQry1.FieldByName('DOCID2').AsString;
            DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString := DMCXP.cdsQry1.FieldByName('CPSERIE').AsString;
            DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString := DMCXP.cdsQry1.FieldByName('CPNODOC').AsString;
            DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString  := DMCXP.cdsQry1.FieldByName('CPTOID').AsString;
            DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString:= DMCXP.cdsQry1.FieldByName('CUENTAID').AsString;
            DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:= DMCXP.DisplayDescrip2('prvSQL','CAJA201','CPTOID, CPTODES, NIVEL, CUENTAID','CPTOID='+quotedStr(DMCXP.cdsQry1.FieldByName('CUENTAID').AsString),'CPTOID');

            if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonExt then
            begin
               DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsFloat;
               DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat;
               DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat:=DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat;
            end
            else begin
               DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat;
               DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsFloat;
               DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsFloat;
            end;

            DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat   :=DMCXP.cdsDetCanje.FieldByName('ECTCAMB').AsFloat;
            DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat   :=StrToFloat( dbeTCambio.Text );
            DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDatetime :=dbdtpFEmis.Date;
            DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDatetime:=dbdtpFEmis.Date;
            DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := dbeLote.Text;
            DMCXP.cdsDetCxP.FieldByName('TMONID').AsString    :=DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;
            xNReg:=xNReg+1;
            DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger   :=xNReg;
            DMCXP.cdsDetCxP.Post;

            if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonExt then
            begin
               GeneraDiferenciaCambio(xNoReg);;
            end;
         end;
         DMCXP.cdsDetCanje.Next;
      end;

      // INSERTA EL REGISTRO DE LA NOTA DE CREDITO EN EL DEBE
      DMCXP.cdsDetCanje.First;
      DMCXP.cdsDetCxP.Insert;
      LlenaDetCxP1(xNoReg);

      DMCXP.cdsDetCxP.Edit;
      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString     :='H';
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString     :=DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString   :=DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString   :=DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString    :=DMCXP.cdsMovCxP.FieldByName('CPTOTOT').AsString;
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString  :=DMCXP.cdsMovCxP.FieldByName('CTATOTAL').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString  :=BuscaQry('dspTGE','CXP201','CPTODES','CPTOID='+QuotedStr(DMCXP.cdsMovCxP.FieldByName('CPTOTOT').AsString),'CPTODES');
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat   :=DMCXP.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat   :=StrToFloat( dbeTCambio.Text );
      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDatetime :=DMCXP.cdsMovCxP.FieldByName('CPFEMIS').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDatetime:=DMCXP.cdsMovCxP.FieldByName('CPFVCMTO').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('TMONID').AsString    :=DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat   :=FRound(xTotME*DMCXP.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat,15,2);
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat   :=xTotME;
      DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := dbeLote.Text;

      if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
      begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := FRound(xTotME*DMCXP.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat,15,2);
      end
      else begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := xTotME;
      end;
      xNReg:=xNReg+1;
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger   :=xNReg;
      DMCXP.cdsDetCxP.Post;

      if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonExt then
      begin
         GeneraDiferenciaCambio2( xNoReg );
      end;
   end;
   DMCXP.cdsDetCanje.EnableControls;

   DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DetCxP' );
end;

procedure TFAplicaCaja.LlenaDetCxP1(xxNReg:string);
begin
  DMCXP.cdsDetCxP.Edit;
  DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsMovCxP.FieldByName('CIAID').AsString;
  DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := wTDiar;
  DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := xxNReg;
  DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString   := copy( dbeAnomm.Text,1,4);
  DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := dbeAnomm.Text;
  DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := DMCXP.cdsMovCxP.FieldByName('PROV').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString;
  DMCXP.cdsDetCxP.FieldByName('PROVRUC').AsString  := DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString;
//  DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
//  DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString;
//  DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString;
  DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsDetCanje.FieldByName('ECTCAMB').AsFloat;
  DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat  := StrToFloat(dbeTCambio.Text);
  DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDatetime:= dbdtpFEmis.Date;
  DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDatetime:= dbdtpFEmis.Date;
  DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'P'; // Pendiente
  DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString   := DMCXP.wUsuario;
  DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime := Date;
  DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime := Time;
  DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString     := DMCXP.cdsCCanje.FieldByName('CJMM').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString     := DMCXP.cdsCCanje.FieldByName('CJDD').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString    := DMCXP.cdsCCanje.FieldByName('CJTRI').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString    := DMCXP.cdsCCanje.FieldByName('CJSEM').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString     := DMCXP.cdsCCanje.FieldByName('CJSS').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString  := DMCXP.cdsCCanje.FieldByName('CJAATRI').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString  := DMCXP.cdsCCanje.FieldByName('CJAASEM').AsString;
  DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString   := DMCXP.cdsCCanje.FieldByName('CJAASS').AsString;
  DMCXP.cdsDetCxP.FieldByName('TMONID').AsString    := DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;
  DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString  := 'CA';
  DMCXP.cdsDetCxP.FieldByName('CANJE').AsString     := wCje;
end;


procedure TFAplicaCaja.GeneraDiferenciaCambio(xxNReg:string);
var
   xDebe, xHabe, xDifCam, xDifCLoc : Double;
   xCtaDif, xGloDif, xDH : String;
begin
   xDebe:=FRound(DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat*DMCXP.cdsDetCanje.FieldByName('ECTCAMB').AsFloat,15,2);
   xHabe:=FRound(DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat*StrToFloat(dbeTCambio.Text),15,2);

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
      DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := 'CA';
      DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := wCje;
      DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := xxNReg;
      DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString   := copy( dbeAnomm.Text,1,4);
      DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := dbeAnomm.Text;
      DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := dblcdProv.Text;
      DMCXP.cdsDetCxP.FieldByName('PROVRUC').AsString  := DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString;
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsQry1.FieldByName('DOCID2').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := DMCXP.cdsQry1.FieldByName('CPSERIE').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsQry1.FieldByName('CPNODOC').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := StrToFloat(dbeTCambio.Text);
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat  := StrToFloat(dbeTCambio.Text);
      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDatetime:= DMCXP.cdsQry1.FieldByName('CPFEMIS').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDatetime:= dbdtpFEmis.Date;;
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'P'; // Pendiente
      DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
      DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime:= Date;
      DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime:= Time;
      DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString     := DMCXP.cdsCCanje.FieldByName('CJMM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString     := DMCXP.cdsCCanje.FieldByName('CJDD').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString    := DMCXP.cdsCCanje.FieldByName('CJTRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString    := DMCXP.cdsCCanje.FieldByName('CJSEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString     := DMCXP.cdsCCanje.FieldByName('CJSS').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString  := DMCXP.cdsCCanje.FieldByName('CJAATRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString  := DMCXP.cdsCCanje.FieldByName('CJAASEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString   := DMCXP.cdsCCanje.FieldByName('CJAASS').AsString;

      DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := dbeLote.Text;
      DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xCtaDif;
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGloDif;
      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := xDH;
      //
      if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonExt then begin
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


procedure TFAplicaCaja.GeneraDiferenciaCambio2(xxNReg:string);
var
   xDebe, xHabe, xDifCam, xDifCLoc : Double;
   xCtaDif, xGloDif, xDH : String;
begin
   xDebe:=FRound(DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat,15,2);
   xHabe:=FRound(DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat*StrToFloat(dbeTCambio.Text),15,2);

   if xDebe < xHabe then begin
      xDifCam  := FRound( xHabe-xDebe,15,2);
      xDifCLoc := FRound( xHabe-xDebe,15,2);
      xCtaDif  := DMCXP.wDifAjuG;
      xCtaDif  := DMCXP.displaydescrip2('dspTGE','TGE202','CUENTAID','CIAID='''+dblcCia.Text+''' AND CTA_DIFGP=''G''','CUENTAID');
      xGloDif  := 'Ganancia - Ajuste por Diferencia de Cambio';
      xDH      := 'H'
   end
   else begin
      xDifCam  := FRound( xDebe-xHabe,15,2);
      xDifCLoc := FRound( xDebe-xHabe,15,2);
      xCtaDif  := DMCXP.wDifAjuP;
      xCtaDif  := DMCXP.displaydescrip2('dspTGE','TGE202','CUENTAID','CIAID='''+dblcCia.Text+''' AND CTA_DIFGP=''P''','CUENTAID');
      xGloDif  := 'Perdida - Ajuste por Diferencia de Cambio';
      xDH      := 'D'
   end;

   If xDifCam > 0 Then begin
      DMCXP.cdsDetCxP.Insert;
      DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := dblcCia.Text;
      DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := wTDiar;
      DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := 'CA';
      DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := wCje;
      DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := xxNReg;
      DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString   := copy( dbeAnomm.Text,1,4);
      DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := dbeAnomm.Text;
      DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := dblcdProv.Text;
      DMCXP.cdsDetCxP.FieldByName('PROVRUC').AsString  := DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString;
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := StrToFloat(dbeTCambio.Text);
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat  := StrToFloat(dbeTCambio.Text);
      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDatetime:= dbdtpFEmis.Date;
      DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDatetime:= dbdtpFEmis.Date;
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'P'; // Pendiente
      DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
      DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime:= Date;
      DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime:= Time;
      DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString     := DMCXP.cdsCCanje.FieldByName('CJMM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString     := DMCXP.cdsCCanje.FieldByName('CJDD').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString    := DMCXP.cdsCCanje.FieldByName('CJTRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString    := DMCXP.cdsCCanje.FieldByName('CJSEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString     := DMCXP.cdsCCanje.FieldByName('CJSS').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString  := DMCXP.cdsCCanje.FieldByName('CJAATRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString  := DMCXP.cdsCCanje.FieldByName('CJAASEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString   := DMCXP.cdsCCanje.FieldByName('CJAASS').AsString;

      DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := dbeLote.Text;
      DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xCtaDif;
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGloDif;
      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := xDH;
      //
      if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonExt then begin
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


procedure TFAplicaCaja.FormActivate(Sender: TObject);
var
   xWhere, xSQL, xMes : String;
   wAno, wMes, wDia : Word;
begin
   Z2bbtnContab.Enabled :=False;
   Z2bbtnPreview.Enabled:=False;
   Z2bbtnAcepta.Enabled :=True;
   pnlCanje.Enabled     :=True;
   dbgPagos.ReadOnly    :=False;

   DMCXP.cdsDetCanje.FieldByname('PAGOMN').ReadOnly := False;
   DMCXP.cdsDetCanje.FieldByname('PAGOMN').ReadOnly := False;

   lblActivo.Visible    := True;
   lblAcepta.Visible    := False;
   lblAnula.Visible     := False;
   lblContab.Visible    := False;
   lblEliminado.Visible := False;

   pnlCanje.Enabled     := True;

   dbdtpFEmis.date:=Date;
   DecodeDate(dbdtpFEmis.Date, wAno, wMes, wDia);

   if wMes<10 then xMes:='0'+inttostr(wMes) else xMes:=inttostr(wMes);
   dbeAnoMM.Text:= IntToStr(wAno)+xMes;

   if xModo='EDITA' then begin
      if DMCXP.cdsCCanje.FieldByname('CJESTADO').AsString='P' then begin

         lblActivo.Visible    := False;
         lblAcepta.Visible    := True;
         lblContab.Visible    := False;

         Z2bbtnContab.Enabled :=True;
         Z2bbtnPreview.Enabled:=True;
         Z2bbtnAcepta.Enabled :=False;
         pnlCanje.Enabled     :=False;

         pnlCanje.Enabled     :=False;
         dbgPagos.ReadOnly    :=True;

         xSQL:='Select * froM CXP302 '
              +'Where CIAID='''   +DMCXP.cdsCCanje.FieldByname('CIAID').AsString+''' '
              +  'and TCANJEID='''+DMCXP.cdsCCanje.FieldByname('TCANJEID').AsString+''' '
              +  'and CANJE='''   +DMCXP.cdsCCanje.FieldByname('CANJE').AsString+'''';
         DMCXP.cdsDetCxP.Close;
         DMCXP.cdsDetCxP.DataRequest( xSQL );
         DMCXP.cdsDetCxP.Open;

         dbdtpFEmis.Date:=DMCXP.cdsDetCxP.FieldByname('CPFEMIS').AsDateTime;
         dbeAnoMM.Text  :=DMCXP.cdsDetCxP.FieldByname('DCPANOMM').AsString;
         dbeTCambio.Text:=FloatToStrF(DMCXP.cdsDetCxP.FieldByname('CPTCAMPA').AsFloat,ffNumber,15,2);
         dbeLote.text   :=DMCXP.cdsDetCxP.FieldByname('DCPLOTE').AsString;
         edtCanje.text  :=DMCXP.cdsCCanje.FieldByName('CANJE').AsString;
         edtComp.text   :=DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString;
      end;
      if DMCXP.cdsCCanje.FieldByname('CJ_CONTA').AsString='S' then begin
         Z2bbtnContab.Enabled :=False;
         lblActivo.Visible    :=False;
         lblAcepta.Visible    :=False;
         lblContab.Visible    :=True;
      end;
   end;

   xWhere:='CIAID='+quotedstr(dblcCia.Text);
   edtCia.Text:=BuscaQry('dspTGE','TGE101','CIAABR,CIARETIGV',xWhere,'CIAABR');

   xWhere:='CLAUXID='''+dblcClAux.Text+''' and PROV='''+dblcdProv.Text+'''';
   edtProv.Text:=BuscaQry('dspTGE','TGE201','PROV, PROVRUC, PROVDES, PROVRETIGV',xWhere,'PROVDES');

   xWhere:='DOCID='''+dblcTDoc.Text+''' and DOCMOD=''CXP''';
   edtTDoc.Text:=BuscaQry('PrvTGE','TGE110','*',xWhere,'DocDes');

   xWhere := 'TDIARID='+''''+dblcTDiario.Text+'''';
   edtTDiario.Text:=BuscaQry('PrvTGE','TGE104','*',xWhere,'TDIARDES');

   xWhere:='TMONID='+''''+dblcTMon.Text+'''';
   edtTMon.Text:=BuscaQry('PrvTGE','TGE103','TMONDES, TMON_LOC',xWhere,'TMONDES');

   dbeSalMN.text:=FloatToStrF(DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat,ffNumber,15,2);
   dbeSalME.text:=FloatToStrF(DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat,ffNumber,15,2);

   xxTDiar:=BuscaQry('dspTGE','TGE110','DOCID, DOCDES, TDIARID','DOCTIPREG=''AP'' AND DOCMOD=''CAJA''','TDIARID');
   dblcDoc2.text  :=DMCXP.cdsQry.FieldByName('DOCID').AsString;
   edtDocDes2.text:=DMCXP.cdsQry.FieldByName('DOCDES').AsString;
   dblcTDiario2.text:=xxTDiar;
   edtTDDes.text   :=BuscaQry('dspTGE','TGE104','TDIARID, TDIARDES','TDIARID='''+xxTDiar+''' ','TDIARDES');
end;


procedure TFAplicaCaja.dbdtpFEmisExit(Sender: TObject);
var
   wAno, wMes, wDia : Word;
   xMes : String;
begin
   if dbdtpFEmis.Date=0 then
   begin
      dbdtpFEmis.SetFocus;
      Raise Exception.Create('Falta Fecha de Comprobante');
   end;

   if xControlFec(dblcCia.Text, dbdtpFEmis.Date) = False then
   begin
      dbdtpFEmis.SetFocus;
      Exit;
   end;

   DecodeDate(dbdtpFEmis.Date, wAno, wMes, wDia);

   if wMes<10 then xMes:='0'+inttostr(wMes) else xMes:=inttostr(wMes);
   dbeAnoMM.Text:= IntToStr(wAno)+xMes;
end;


procedure TFAplicaCaja.Z2bbtnPreviewClick(Sender: TObject);
var
   xSQL, xTDiario, xNoComp  : String;
   xDia, xMes, xAno : word;
   mes, ano, xwhere, MONABR : string;
   mesdes : String;
   xAnoMes : String;
   TSimbolo,TMoneda : String;
   xTotHaber:DOUBLE;
begin
   if DMCXP.wAdmin='G' then Exit;

   xSQL:='Select * from CXP308 '
        +'Where CIAID='''   +DMCXP.cdsCCanje.FieldByname('CIAID').AsString+''' '
        +  'and TCANJEID='''+DMCXP.cdsCCanje.FieldByname('TCANJEID').AsString+''' '
        +  'and CANJE='''   +DMCXP.cdsCCanje.FieldByname('CANJE').AsString+'''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xSQL );
   DMCXP.cdsQry.Open;
   {
   xSQL:='Select * from CXP308 '
        +'Where CIAID='''+dblcCia.text+''' and TCANJEID=''CA'' and CANJE='''+wCje+'''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xSQL );
   DMCXP.cdsQry.Open;
   }
   xTDiario:=DMCXP.cdsQry.FieldByname('TDIARID').AsString;
   xNoComp :=DMCXP.cdsQry.FieldByname('CCCMPRB').AsString;
   xAnoMes :=DMCXP.cdsQry.FieldByname('CJAAMM').AsString;

   if DMCXP.cdsCCanje.fieldbyname('CJ_CONTA').AsString <> 'S' then
   begin
      if not AsientoCuadra then
         raise exception.Create('Error:  Asiento No Cuadra');

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

      DMCXP.GeneraContab( dblcCia.Text, xTDiario, xAnoMes, xNoComp, Self, 'P' );

      DMCXP.cdsCXP.Data:=DMCXP.cdsMovCnt.data;

      decodedate(dbdtpFEmis.Date,xAno,xMes,xDia);
      mes:= strzero(inttostr(xMes),2);
      ano:= inttostr(xAno);
      xWhere := 'MESIDR='''+mes+'''';
      mesdes := DMCXP.DisplayDescrip2('dspTGE','TGE181','MESDESL',XWHERE,'MESDESL');
   end;

   if DMCXP.cdsCCanje.fieldbyname('CJ_CONTA').AsString = 'S' then
   begin
      xSql:='SELECT * FROM CNT301 '
           +'WHERE CIAID=' + quotedstr( dblcCia.text  ) +' AND '
           +  'CNTANOMM='  + quotedstr( xAnoMes ) +' AND '
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

   ppdbpPreview.DataSource     := DMCXP.dsCxP;
   pprPreview.TEMPLATE.FileName:= ExtractFilePath( application.ExeName ) + wRutaRpt+'\CxPVoucher.rtm' ;
   pprPreview.template.LoadFromFile ;

   TMoneda:= DMCXP.DisplayDescrip2('dspTGE','TGE103','TMON_LOC','TMONID='+quotedstr(DMCXP.cdsMovCxP.FieldByName('TMONID').AsString),'TMON_LOC');
   MONABR := DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONABR', 'TMONID='+quotedstr(DMCXP.cdsMovCxP.FieldByName('TMONID').AsString),'TMONABR' );

   pplblMonedaDoc.Caption := MONABR;
   pplblCiades.Caption    := edtCia.text ;
   pplblCodProv.Caption   := dblcdProv.Text;
   pplblDiarioDes.Caption := DMCXP.DisplayDescrip2('dspTGE','TGE104','TDIARDES','TDIARID='+quotedstr(xTDiario),'TDIARDES');
   pplblTDiario.Caption   := xTDiario;
   pplblProveedor.Caption := edtProv.text;
   pplblGlosaDes.caption  := DMCXP.cdsCxP.fieldbyname('CNTGLOSA').asstring;
   pplblTipoCamb.Caption  := FloatToStrF(DMCXP.cdsCCanje.FieldByname('CJTCAMBIO').AsFloat,ffNumber,10,3);
   pplblAnoMes.Caption    := xAnomes;
   pplblNoCompro.Caption  := xNoComp;
   pplblMonedaDes.caption := DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONDES','TMONID='+quotedstr(DMCXP.cdsMovCxP.FieldByName('TMONID').AsString),'TMONDES');

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

   if DMCXP.cdsCCanje.FieldByName('CJ_CONTA').AsString='S' then
      pplblDesEstado.caption:='Contabilizado'
   else
      pplblDesEstado.caption:='Previo';

   pprPreview.Print;
   pprPreview.Stop;
   ppdbpPreview.DataSource:=nil ;
end;


Function TFAplicaCaja.AsientoCuadra:Boolean;
var
   xTotDebe, xTotHaber : double;
   xCampo  : String;
begin
   Result    := False;
   xTotDebe  := 0;
   xTotHaber := 0;
   if DMCXP.cdsCCanje.fieldbyname('TMONID').AsString=DMCXP.wTMonLoc then
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


procedure TFAplicaCaja.ppDetailBand2BeforePrint(Sender: TObject);
begin
//   pplblMesDia.Caption := DMCXP.CdsCxP.Fieldbyname('CNTFEMIS').AsString;
	pplblFecEmision.Caption := DMCXP.CdsCxP.Fieldbyname('CNTFEMIS').AsString;
end;

procedure TFAplicaCaja.pprPreviewPreviewFormCreate(Sender: TObject);
begin
  pprPreview.PreviewForm.ClientHeight := 580;
  pprPreview.PreviewForm.ClientWidth := 780;			// ppViewr
  tppviewer(pprPreview.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;


procedure TFAplicaCaja.ActualizaCaja;
var
   xSQL : String;
begin

   DMCXP.cdsDetCanje.First;
   while not DMCXP.cdsDetCanje.EOF do
   begin
      if DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsFloat>0 then begin

         xSQL:='Update CAJA302 '
              +   'Set ECSALMN=ECSALMN-'+DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsString+', '
              +       'ECSALME=ECSALME-'+DMCXP.cdsDetCanje.FieldByName('PAGOME').AsString+' '
              +'Where CIAID='''   +DMCXP.cdsDetCanje.FieldByName('CIAID').AsString   +''' '
              +  'and TDIARID=''' +DMCXP.cdsDetCanje.FieldByName('TDIARID').AsString +''' '
              +  'and ECANOMM=''' +DMCXP.cdsDetCanje.FieldByName('ECANOMM').AsString +''' '
              +  'and ECNOCOMP='''+DMCXP.cdsDetCanje.FieldByName('ECNOCOMP').AsString+'''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest( xSQL );
         DMCXP.cdsQry.Execute;

         DMCXP.cdsDetCanje.Next;
      end;
   end;
end;


procedure TFAplicaCaja.ActualizaSaldoCXP;
begin
   DMCXP.cdsMovCxP.Edit;
   if DMCXP.cdsMovCxP.FieldByname('TMONID').AsString=DMCXP.wTMonLoc then
   begin
      DMCXP.cdsMovCxP.FieldByname('CPPAGORI').AsFloat:=DMCXP.cdsMovCxP.FieldByname('CPPAGORI').AsFloat+DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsFloat;
      DMCXP.cdsMovCxP.FieldByname('CPSALORI').AsFloat:=DMCXP.cdsMovCxP.FieldByname('CPSALORI').AsFloat+DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsFloat;
      if DMCXP.cdsMovCxP.FieldByname('CPSALORI').AsFloat<=0 then
         DMCXP.cdsMovCxP.FieldByname('CPESTADO').AsString:='C';
   end
   else begin
      DMCXP.cdsMovCxP.FieldByname('CPPAGORI').AsFloat:=DMCXP.cdsMovCxP.FieldByname('CPPAGORI').AsFloat+DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat;
      DMCXP.cdsMovCxP.FieldByname('CPSALORI').AsFloat:=DMCXP.cdsMovCxP.FieldByname('CPSALORI').AsFloat+DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat;
      if DMCXP.cdsMovCxP.FieldByname('CPSALORI').AsFloat<=0 then
         DMCXP.cdsMovCxP.FieldByname('CPESTADO').AsString:='C';

   end;
   DMCXP.cdsMovCxP.FieldByname('CPPAGLOC').AsFloat:=DMCXP.cdsMovCxP.FieldByname('CPPAGLOC').AsFloat+DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsFloat;
   DMCXP.cdsMovCxP.FieldByname('CPPAGEXT').AsFloat:=DMCXP.cdsMovCxP.FieldByname('CPPAGEXT').AsFloat+DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat;
   DMCXP.cdsMovCxP.FieldByname('CPSALLOC').AsFloat:=DMCXP.cdsMovCxP.FieldByname('CPSALLOC').AsFloat-DMCXP.cdsDetCanje.FieldByName('PAGOMN').AsFloat;
   DMCXP.cdsMovCxP.FieldByname('CPSALEXT').AsFloat:=DMCXP.cdsMovCxP.FieldByname('CPSALEXT').AsFloat-DMCXP.cdsDetCanje.FieldByName('PAGOME').AsFloat;
   DMCXP.cdsMovCxP.Post;
   DMCXP.AplicaDatos( DMCXP.cdsMovCxP, 'MOVCXP' );
end;


Procedure TFAplicaCaja.GrabaDetCanje;
var
   xSQL : String;
begin
   xSQL:='Select * from CXP305 '
        +'Where CIAID=''ZZ'' AND TCANJEID=''XX'' ';
   DMCXP.cdsDetCanje2.Close;
   DMCXP.cdsDetCanje2.dataRequest( xSQL );
   DMCXP.cdsDetCanje2.Open;

   DMCXP.cdsDetCanje2.Insert;
   DMCXP.cdsDetCanje2.FieldByName('CIAID').AsString    := DMCXP.cdsCCanje.FieldByName('CIAID').AsString;
   DMCXP.cdsDetCanje2.FieldByName('PROV').AsString     := DMCXP.cdsCCanje.FieldByName('PROV').AsString;
   DMCXP.cdsDetCanje2.FieldByName('PROVRUC').AsString  := DMCXP.cdsCCanje.FieldByName('PROVRUC').AsString;
   DMCXP.cdsDetCanje2.FieldByName('DOCID').AsString    := DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
   DMCXP.cdsDetCanje2.FieldByName('CPSERIE').AsString  := DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
   DMCXP.cdsDetCanje2.FieldByName('CPNODOC').AsString  := DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
   DMCXP.cdsDetCanje2.FieldByName('CPNOREG').AsString  := DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString;
   DMCXP.cdsDetCanje2.FieldByName('TCANJEID').AsString := DMCXP.cdsCCanje.FieldByName('TCANJEID').AsString;
   DMCXP.cdsDetCanje2.FieldByName('CCPCANJE').AsString := DMCXP.cdsCCanje.FieldByName('CANJE').AsString;
   DMCXP.cdsDetCanje2.FieldByName('CCPFCJE').AsDateTime:= DMCXP.cdsCCanje.FieldByName('CJFCANJE').AsDateTime;
   DMCXP.cdsDetCanje2.FieldByName('DOCID2').AsString   := DMCXP.cdsCCanje.FieldByName('TCANJEID').AsString;
   DMCXP.cdsDetCanje2.FieldByName('CPSERIE2').AsString := '000';
   DMCXP.cdsDetCanje2.FieldByName('CPNODOC2').AsString := DMCXP.cdsCCanje.FieldByName('CANJE').AsString;
   DMCXP.cdsDetCanje2.FieldByName('TMONID').AsString   := DMCXP.cdsCCanje.FieldByName('TMONID').AsString;
   DMCXP.cdsDetCanje2.FieldByName('DCDUSER').AsString  := DMCXP.wUsuario;
   DMCXP.cdsDetCanje2.FieldByName('DCDFREG').AsdateTime:= DATE;
   DMCXP.cdsDetCanje2.FieldByName('DCDHREG').AsDateTime:= TIME;
   DMCXP.cdsDetCanje2.FieldByName('DCDAAAA').AsString  := DMCXP.cdsCCanje.FieldByName('CJAA').AsString;
   DMCXP.cdsDetCanje2.FieldByName('DCDMM').AsString    := DMCXP.cdsCCanje.FieldByName('CJMM').AsString;
   DMCXP.cdsDetCanje2.FieldByName('DCDDD').AsString    := DMCXP.cdsCCanje.FieldByName('CJDD').AsString;
   DMCXP.cdsDetCanje2.FieldByName('DCDTRI').AsString   := DMCXP.cdsCCanje.FieldByName('CJTRI').AsString;
   DMCXP.cdsDetCanje2.FieldByName('DCDSEM').AsString   := DMCXP.cdsCCanje.FieldByName('CJSEM').AsString;
   DMCXP.cdsDetCanje2.FieldByName('DCDSS').AsString    := DMCXP.cdsCCanje.FieldByName('CJSS').AsString;
   DMCXP.cdsDetCanje2.FieldByName('DCDANOMM').AsString := DMCXP.cdsCCanje.FieldByName('CJAAMM').AsString;
   DMCXP.cdsDetCanje2.FieldByName('DCDAATRI').AsString := DMCXP.cdsCCanje.FieldByName('CJAATRI').AsString;
   DMCXP.cdsDetCanje2.FieldByName('DCDAASEM').AsString := DMCXP.cdsCCanje.FieldByName('CJAASEM').AsString;
   DMCXP.cdsDetCanje2.FieldByName('DCDAASS').AsString  := DMCXP.cdsCCanje.FieldByName('CJAASS').AsString;
   DMCXP.cdsDetCanje2.FieldByName('DCDMOLOC').AsFloat  := FRound(DMCXP.cdsCCanje.FieldByName('CJTOTLOC').AsFloat,15,2);
   DMCXP.cdsDetCanje2.FieldByName('DCDMOEXT').AsFloat  := FRound(DMCXP.cdsCCanje.FieldByName('CJTOTEXT').AsFloat,15,2);

   DMCXP.cdsDetCanje2.FieldByName('CAJATDIAR').AsString:= DMCXP.cdsDetCanje.FieldByName('TDIARID').AsString;
   DMCXP.cdsDetCanje2.FieldByName('CAJAAAMM').AsString := DMCXP.cdsDetCanje.FieldByName('ECANOMM').AsString;
   DMCXP.cdsDetCanje2.FieldByName('CAJACOMP').AsString := DMCXP.cdsDetCanje.FieldByName('ECNOCOMP').AsString;

   DMCXP.cdsDetCanje2.Post;
   DMCXP.AplicaDatos( DMCXP.cdsDetCanje2, 'DetCanje2' );
end;

procedure TFAplicaCaja.Z2bbtnContabClick(Sender: TObject);
var
   xSQL, xTDiario, xNoComp  : String;
   xAnoMes : String;
begin
   if DMCXP.wAdmin='G' then Exit;

   if MessageDlg( 'Contabilizar Aplica Pagos de Caja' + chr(13)+
                  '         ¿ Esta Seguro ?         ',mtConfirmation,[mbYes, mbNo],0)=mrNo then
      exit;

   xSQL:='Select * from CXP308 '
        +'Where CIAID='''+dblcCia.text+''' and TCANJEID=''CA'' and CANJE='''+wCje+'''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xSQL );
   DMCXP.cdsQry.Open;

   xTDiario:=DMCXP.cdsQry.FieldByname('TDIARID').AsString;
   xNoComp :=DMCXP.cdsQry.FieldByname('CCCMPRB').AsString;
   xAnoMes :=dbeAnoMM.Text;

   if DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString <> 'S' then
   begin
      if not AsientoCuadra then
         raise exception.Create('Error:  Asiento No Cuadra');

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

      try
         DMCXP.GeneraContab( dblcCia.Text, xTDiario, dbeAnoMM.Text, xNoComp, Self, 'C' );

         DMCXP.cdsCCanje.Edit;
         DMCXP.cdsCCanje.FieldByName('CJ_CONTA').AsString:='S';
         DMCXP.AplicaDatos( DMCXP.cdsCCanje, 'CCanje'  );

         EstadoDeForma( DMCXP.cdsCCanje.fieldbyname('CJESTADO').AsString, DMCXP.cdsCCanje.fieldbyname('CJ_CONTA').AsString );
         ShowMessage('Contabilización Ok.');
      except
         ShowMessage('Contabilización Error');
      end;

   end;
end;

procedure TFAplicaCaja.EstadoDeForma( xMovEstado, xMovConta : String );
begin
   Z2bbtnContab.Enabled :=False;
   Z2bbtnPreview.Enabled:=False;
   Z2bbtnAcepta.Enabled :=True;
   pnlCanje.Enabled     :=True;
   dbgPagos.ReadOnly    :=False;

   DMCXP.cdsDetCanje.FieldByname('PAGOMN').ReadOnly := False;
   DMCXP.cdsDetCanje.FieldByname('PAGOMN').ReadOnly := False;

   lblActivo.Visible    := True;
   lblAcepta.Visible    := False;
   lblAnula.Visible     := False;
   lblContab.Visible    := False;
   lblEliminado.Visible := False;

   pnlCanje.Enabled     := True;

   if xMovEstado='P' then begin
      lblActivo.Visible    := False;
      lblAcepta.Visible    := True;
      lblContab.Visible    := False;
      Z2bbtnContab.Enabled :=True;
      Z2bbtnPreview.Enabled:=True;
      Z2bbtnAcepta.Enabled :=False;
      pnlCanje.Enabled     :=False;

      pnlCanje.Enabled     :=False;
      dbgPagos.ReadOnly    :=True;
   end;

   if xMovConta='S' then begin
      Z2bbtnAcepta.Enabled :=False;
      Z2bbtnContab.Enabled :=False;
      Z2bbtnPreview.Enabled:=True;
      lblActivo.Visible    :=False;
      lblAcepta.Visible    :=False;
      lblContab.Visible    :=True;
   end;
end;

procedure TFAplicaCaja.FormCreate(Sender: TObject);
begin

   CargaDataSource;

end;


procedure TFAplicaCaja.CargaDataSource;
begin
   dblcCia.DataSource        :=DMCXP.dsMovCxP;
   dblcCia.LookupTable       :=DMCXP.cdsCia;
   dblcClAux.DataSource      :=DMCXP.dsMovCxP;
   dblcClAux.LookupTable     :=DMCXP.cdsClAux;
   dblcdProv.DataSource      :=DMCXP.dsMovCxP;
   dblcdProv.LookupTable     :=DMCXP.cdsProv;
   dtpFComp.DataSource       :=DMCXP.dsMovCxP;
   dblcTDoc.DataSource       :=DMCXP.dsMovCxP;
   dblcTDoc.LookupTable      :=DMCXP.cdsTDoc;
   edtSerie.DataSource       :=DMCXP.dsMovCxP;
   edtNoDoc.DataSource       :=DMCXP.dsMovCxP;
   dblcTDiario.DataSource    :=DMCXP.dsMovCxP;
   dblcTDiario.LookupTable   :=DMCXP.cdsTDiario;
   meAnoMM.DataSource        :=DMCXP.dsMovCxP;
   meNoReg.DataSource        :=DMCXP.dsMovCxP;
   dblcTMon.DataSource       :=DMCXP.dsMovCxP;
   dblcTMon.LookupTable      :=DMCXP.cdsTMon;

   dblcDoc2.DataSource      :=nil;
   dblcDoc2.LookupTable     :=DMCXP.cdsTDoc;

   dbgPagos.DataSource       :=DMCXP.dsDetCanje;
end;


procedure TFAplicaCaja.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//   FVariables.ActualizaFiltro( DMCXP.cdsCCanje, FPrincipal.GLetras, DMCXP.wModo );
   if not (FPrincipal.GLetras=nil) then
      FPrincipal.GLetras.RefreshFilter;
   Action := CaFree;   
end;

procedure TFAplicaCaja.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.
