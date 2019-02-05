unit CxP207;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Wwdbdlg, Mask, wwdbedit, ComCtrls, wwdbdatetimepicker,
  wwdblook, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DB, wwclient, variants;

type
  TFCanjeDoc = class(TForm)
    pnlCabecera: TPanel;
    pnlCab2: TPanel;
    lblTDoc: TLabel;
    lblTDiario: TLabel;
    Label7: TLabel;
    dblcTDoc: TwwDBLookupCombo;
    edtTDoc: TEdit;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    dbdtpFComp: TwwDBDateTimePicker;
    pnlCab1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    edtCanje: TwwDBEdit;
    dblcdProv: TwwDBLookupComboDlg;
    dblcdProvRuc: TwwDBLookupComboDlg;
    edtProv: TEdit;
    pnlDetalle: TPanel;
    pnlPendiente: TPanel;
    Label6: TLabel;
    dbgPendiente: TwwDBGrid;
    pnlDocCanje: TPanel;
    Label5: TLabel;
    dbgDocCanje: TwwDBGrid;
    pnlPie: TPanel;
    Z2bbtnGraba: TBitBtn;
    Z2bbtnContab: TBitBtn;
    Z2bbtnImprime: TBitBtn;
    Z2bbtnAnula: TBitBtn;
    bbtnRegresa: TBitBtn;
    bbtnCancela: TBitBtn;
    Z2bbtnNuevo: TBitBtn;
    Z2bbtnAcepta: TBitBtn;
    pnlEstado: TPanel;
    lblAnula: TLabel;
    lblActivo: TLabel;
    lblContab: TLabel;
    lblAcepta: TLabel;
    Label9: TLabel;
    bbtnCalc: TBitBtn;
    bbtnSumat: TBitBtn;
    dbeNoReg: TwwDBEdit;
    Label11: TLabel;
    dbeNoDoc: TwwDBEdit;
    dbeSerie: TwwDBEdit;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    pnlCab3: TPanel;
    lblFCanje: TLabel;
    dbdtpFEmis: TwwDBDateTimePicker;
    lblFRecep: TLabel;
    dtpFRecep: TDateTimePicker;
    lblTMon: TLabel;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    lblTCambio: TLabel;
    dbeTCLet: TwwDBEdit;
    Label10: TLabel;
    dbeLote: TwwDBEdit;
    dblcdCnpEgr: TwwDBLookupComboDlg;
    lblCnpEgr: TLabel;
    Label13: TLabel;
    dbeCuenta: TwwDBEdit;
    dbeGlosa: TwwDBEdit;
    lblGlosa: TLabel;
    bbtnBorra: TBitBtn;
    bbtnOk: TBitBtn;
    Label8: TLabel;
    Label17: TLabel;
    Label26: TLabel;
    dblcdPresup: TwwDBLookupComboDlg;
    dblcClAux: TwwDBLookupCombo;
    procedure dblcCiaExit(Sender: TObject);
    procedure edtCanjeExit(Sender: TObject);
    procedure dblcdProvExit(Sender: TObject);
    procedure dblcdProvRucExit(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure dbeTCLetExit(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dblcdCnpEgrExit(Sender: TObject);
    procedure BloqueaCampos;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnBorraClick(Sender: TObject);
    procedure InicializaClientDataSet;
    procedure InicializaPaneles;
    procedure InicializaPies;
    procedure InicializaDatos;
    procedure InicializaCampos;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkClick(Sender: TObject);
    function  ValidaCabecera: Boolean;
    function  ExisteMovCxP(xxCia,xxTDiario,xxAAMM,xxNoReg:String):Boolean;
    procedure bbtnSumatClick(Sender: TObject);
    procedure dbgPendienteDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgPendienteEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDocCanjeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgDocCanjeEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDocCanjeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgDocCanjeColExit(Sender: TObject);
    procedure bbtnRegresaClick(Sender: TObject);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure ActualizaSaldosMovCxP;
    procedure Z2bbtnAnulaClick(Sender: TObject);
    procedure Z2bbtnContabClick(Sender: TObject);
    procedure GeneraAsientoCanje;
    procedure ActualizaPagadoMovCxP;
    Procedure GrabaDetCanje;
    Procedure GrabaRegCxP305;
    procedure GeneraAsientoAutomatico;
    procedure GeneraDiferenciaCambio;
    procedure DetCxPUsuario;
    procedure GrabaDiferenciaCambio;
    function  AsientoCuadra:Boolean;
    procedure DetCxP2Usuario;
    procedure dbeNoDocExit(Sender: TObject);
    procedure dbgPendienteMouseDown(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
    Procedure FiltraCanje;
    procedure GrabaDocCanje;
    procedure dblcTDocEnter(Sender: TObject);
    procedure Z2bbtnNuevoClick(Sender: TObject);
    procedure dbgDocCanjeCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure EstadoDeForma( xxModo: Integer; xMovEstado,xMovConta: String );
    procedure FormCreate(Sender: TObject);
    procedure dblcdProvRucEnter(Sender: TObject);
    procedure dblcdProvEnter(Sender: TObject);
    procedure dblcClAuxExit(Sender: TObject);
    procedure dbeNoRegExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCanjeDoc: TFCanjeDoc;
  xTMon_Loc : String;
  xTAutoNum,xTAno,xTMes : String;
  xGlosa, xLote, xCuenta, xConcepto, xCtaDif, xGloDif, xDH : String;
  xDifCam, xPagAnt, xDifCLoc, xDifCExt : double;
  xSql : String;
  xxTCambio : double;
  xCrea : Boolean;
  TemMovCxP : TwwClientDataSet;
  xConta    : string;

implementation

uses CxPDM, CxP001;

{$R *.DFM}

procedure TFCanjeDoc.dblcCiaExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

   edtCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);

   if Length(edtCia.Text)=0 then begin
      dblcCia.SetFocus;
      Raise Exception.Create(' Error :  Falta Registrar Compañía ');
   end;
   edtCia.Text   := DMCXP.cdsCia.FieldByName('CiaDes').Value;
   edtCanje.Text := DMCXP.UltimoRegistro('A',dblcCia.Text,'CD','','' );
   edtCanje.Text := Strzero(edtCanje.Text,6);
   edtCanje.Setfocus;
end;

procedure TFCanjeDoc.edtCanjeExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if dblcCia.Focused   then Exit;

   edtCanje.Text:= StrZero(edtCanje.Text,6);
   if (Length(edtCanje.Text)=0) or (edtCanje.Text='000000') then begin
      edtCanje.SetFocus;
      Raise Exception.Create('Error en Número de Canje');
   end;

   If DMCXP.BuscaCanje(dblcCia.Text,'CD',edtCanje.Text) then begin
      edtCanje.SetFocus;
      Raise Exception.Create( 'Canje Ya Existe' )
   end;

   DMCXP.cdsDetCxP.Insert;
   DMCXP.cdsDetCxP.FieldByName('CIAID').AsString   := dblcCia.Text;
   DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString:= 'CD';
   DMCXP.cdsDetCxP.FieldByName('CANJE').AsString   := edtCanje.Text;
   DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString:= 'X';
   
   DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DetCxP' );

   Filtracds( DMCXP.cdsDetCxP,'Select * from CXP302 Where '
                + 'CIAID='   +''''+ dblcCia.Text +''''+' and '
                + 'TCANJEID='+''''+ 'CD'         +''''+' and '
                + 'CANJE='   +''''+ edtcanje.Text+'''' );

   DMCXP.cdsDetCxP.Edit;
   edtCanje.Text:=DMCXP.GrabaUltimoRegistro( 'A',dblcCia.Text,'CD','','',StrToInt( edtCanje.Text) );
   edtCanje.Text:=Strzero( edtCanje.Text,6 );

   DMCXP.cdsTDoc.Filtered := false;

   EstadoDeForma( 0, 'X', ' ' );
   dblcClAux.Setfocus;
end;


Procedure TFCanjeDoc.FiltraCanje;
begin
   DMCXP.cdsMovCxP.Filtered:=False;
   DMCXP.cdsMovCxP.Filter:='';
   DMCXP.cdsMovCxP.Filter:='CiaId='   +''''+dblcCia.Text  +''''+' and '+
                         'Prov='    +''''+dblcdProv.Text+''''+' and CPSaLLoc>0 and '+
                         'CPCanje<>'+''''+edtCanje.Text +''''+' and CPEstado='+''''+'P'+''''+
                         ' and FlagVar<>'+''''+'XX'+'''';
   DMCXP.cdsMovCxP.Filtered:=True;
   DMCXP.cdsMovCxP.First;

   DMCXP.cdsLetras.Filter:='';
   DMCXP.cdsLetras.Filter:='CiaId='+''''+dblcCia.Text+''''+' and '+
                         'TCanjeID='+''''+'CD'+''''+' and '+
                         'CPCanje='+''''+edtCanje.Text+'''';
   DMCXP.cdsLetras.Filtered:=True;

   DMCXP.cdsCanje.Filter:='';
   DMCXP.cdsCanje.Filter:='CiaId='+''''+dblcCia.Text+''''+' and '+
                        'TCanjeID='+''''+'CD'+''''+' and '+
                        'CCPCanje='+''''+edtCanje.text+'''';
   DMCXP.cdsCanje.Filtered:=True;

   DMCXP.cdsDetCanje.Filter:='';
   DMCXP.cdsDetCanje.Filter:='CiaId='+''''+dblcCia.Text+''''+' and '+
                           'TCanjeID='+''''+'CD'+''''+' and '+
                           'CCPCanje='+''''+edtCanje.text+'''';
   DMCXP.cdsDetCanje.Filtered:=True;

   DMCXP.cdsDetCxP.Filter:='';
   DMCXP.cdsDetCxP.Filter:='CiaId    ='+''''+dblcCia.Text +''''+' and '+
                         'TCanjeID ='+''''+'CD'         +''''+' and '+
                         'Canje='    +''''+edtCanje.Text+'''';
   DMCXP.cdsDetCxP.Filtered:=True;
end;

procedure TFCanjeDoc.dblcdProvExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if Length(dblcClAux.Text)=0 then begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Falta Ingresar Clase de Auxiliar');
   end;

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
       dblcdProvRuc.Text:=DMCXP.cdsULTTGE.FieldByName('ProvRuc').AsString;
       dblcTDoc.SetFocus;
   end
   else begin
      edtProv.Text:='';
      dblcdProvRuc.SetFocus;
   end;
end;

procedure TFCanjeDoc.dblcdProvRucExit(Sender: TObject);
var
   xWhere : String;
begin
   if xCrea then Exit;
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
         dblcdProv.Text   :='';
         dblcdProvRuc.Text:='';
         dblcdProvRuc.SetFocus;
         Raise Exception.Create('RUC de Proveedor no existe');
      end;
      dblcdProv.Text:=DMCXP.cdsQry.FieldByName('PROV').AsString;
      dblcTDoc.SetFocus;
   end
   else begin
      edtProv.Text:='';
      dblcdProv.SetFocus;
   end;
end;

procedure TFCanjeDoc.dblcTDocExit(Sender: TObject);
var
   xFiltro, xWhere : string;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

   xWhere:='DocId='''+dblcTDoc.Text+''' and DOC_FREG='''+FPrincipal.xTipoProv+'''';

   edtTDoc.Text:=BuscaQry('PrvTGE','TGE110','*',xWhere,'DOCDES');
   if length(edtTDoc.Text)=0 then
   begin
      ShowMessage('Falta Código de Documento');
      dblcTDoc.SetFocus;
      Exit;
   end;

   with DMCXP do begin
      if length(edtTDoc.Text)>0 then begin
      // Asigna Tipo de Diario a lookup combo TDiario
         DMCXP.cdsDetCxP.Edit;
         DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString := DMCXP.cdsQry.FieldByName('TDIARID').AsString;
         xConta := DMCXP.cdsQry.FieldByName('DOCCONTA').AsString;
      // Busca descripción TDiario y asigna a edit TDiario
         edtTDiario.Text:=DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);
      // Filtra Tipo de Diario específico
         xFiltro:='TDiarID='+cdsTDoc.fieldbyname('TDIARID').AsString;
         if length(cdsTDoc.fieldbyname('TDIARID2').AsString)>0 then begin
            xFiltro:=xFiltro+'or TDiarID='+''''+cdsTDoc.fieldbyname('TDIARID2').AsString+'''';
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
   DMCXP.cdsTDoc.Filtered := false;
end;

procedure TFCanjeDoc.dblcTDiarioExit(Sender: TObject);
begin
   if bbtnBorra.Focused then Exit;

   edtTDiario.Text:=DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);

   if length(edtTDiario.Text)=0 then
   begin
      ShowMessage('Falta Tipo de Diario');
      dblcTDiario.SetFocus;
   end;
end;

procedure TFCanjeDoc.dblcTMonExit(Sender: TObject);
Var
   xWhere : String;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

   xWhere := 'TMonId='+''''+dblcTMon.Text+''''
           + ' and (TMon_Loc='+''''+'L'+''''+' or TMon_Loc='+''''+'E'+''''+')';
   edtTMon.Text:=BuscaQry('PrvTGE','TGE103','TMONDES,TMon_Loc',xWhere,'TMONDES');

   if length(edtTMon.Text)=0 then
   begin
      ShowMessage('Falta Tipo de Moneda');
      dblcTMon.SetFocus;
      exit;
   end;
   if ( Length(dblcTMon.Text)>0) and (dbdtpFEmis.Date<>0) and
      ( DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat = 0) then begin

      if DMCXP.cdsQry.FieldByName('TMON_LOC').AsString <> null then
         xTMon_Loc := DMCXP.cdsQry.FieldByName('TMon_Loc').AsString
      else
         xTMon_Loc := 'N';

      xWhere:='TMONID='''+DMCXP.wTMonExt+''' and '
             +'FECHA='+DMCXP.wRepFuncDate+''''+ FORMATDATETIME(DMCXP.wFormatFecha,dbdtpFEmis.Date)+''')';
      if length(BuscaQry('PrvTGE','TGE107','*',xWhere,'TMonId'))>0 then begin
         DMCXP.cdsDetCxP.Edit;
         DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat:=DMCXP.cdsQry.fieldbyname('TCamVOV').AsFloat;
      end;
   end;

end;

procedure TFCanjeDoc.dbeTCLetExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

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
end;

procedure TFCanjeDoc.dbdtpFCompExit(Sender: TObject);
Var
   xWhere   : String;
   xFCierre : TDate;
   wAno, wMes, wDia: Word;
   xMes : String;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

   With DMCXP do begin

      xWhere := 'CiaId='+''''+dblcCia.Text+'''';
      xFCierre := DMCXP.BuscaUltFecha('PrvUltCxP','CXP202','FCierre',xWhere);

      if dbdtpFComp.Date<=xFCierre then
      begin
         ShowMessage(' Error :  Última Fecha de Cierre '+DateToStr(xFCierre) );
         dbdtpFComp.SetFocus;
         exit;
      end;
      DMCXP.cdsDetCxP.Edit;
//      DMCXP.cdsDetCxPDCPFCom').AsString := dbdtpFComp.date;
      If DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime = 0 then
         DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime := dbdtpFComp.date;

      DecodeDate(dbdtpFComp.Date, wAno, wMes, wDia);
      if wMes<10 then xMes:='0'+inttostr(wMes) else xMes:=inttostr(wMes);
      xTMes := xMes;
      xTAno := IntToStr(wAno);
      DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString:= xTAno + xTMes; // ano+Mes
      DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString:=DMCXP.DisplayDescrip('TGE114','FecAno','Fecha',datetostr(DMCXP.cdsDetCxP.FieldByName('DCPFCom').AsDateTime));
      if length(cdsDetCxP.FieldByName('DCPANOC').AsString)>0 then begin
         cdsDetCxP.FieldByName('DCPMM').AsString   := cdsUltTge.FieldByName('FECMES').AsString;      // mes
         cdsDetCxP.FieldByName('DCPDD').AsString   := cdsUltTge.FieldByName('FECDIA').AsString;      // día
         cdsDetCxP.FieldByName('DCPTRI').AsString  := cdsUltTge.FieldByName('FECTRIM').AsString;     // trimestre
         cdsDetCxP.FieldByName('DCPSEM').AsString  := cdsUltTge.FieldByName('FECSEM').AsString;      // semestre
         cdsDetCxP.FieldByName('DCPSS').AsString   := cdsUltTge.FieldByName('FECSS').AsString;       // semana
         cdsDetCxP.FieldByName('DCPAATRI').AsString:= cdsUltTge.FieldByName('FECAATRI').AsString;    // año+trimestre
         cdsDetCxP.FieldByName('DCPAASEM').AsString:= cdsUltTge.FieldByName('FECAASEM').AsString;    // año+semestre
         cdsDetCxP.FieldByName('DCPAASS').AsString := cdsUltTge.FieldByName('FECAASS').AsString;     // año+semana
      end;

      xWhere:='CiaId='''   +dblcCia.Text+''' and TDiarId='''+dblcTDiario.Text+''' and '
             +'DCPAnoMM='''+cdsDetCxP.FieldByName('DCPANOMM').AsString+'''';
      cdsDetCxP.FieldByName('DCPLOTE').AsString:=DMCXP.BuscaUltTGE('PrvUltCxP','CXP302','DCPLote',xWhere);
      cdsDetCxP.FieldByName('DCPLOTE').AsString:=Strzero(cdsDetCxP.FieldByName('DCPLOTE').AsString,cdsDetCxP.FieldByName('DCPLOTE').DisplayWidth);

      xTMes := DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString;
      xTAno := DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString;
      if (length(edtTDiario.Text)>0)  then
      begin
         xTAutoNum := DMCXP.DisplayDescrip('TGE104','AutoNum','TDiarID',dblcTDiario.Text);
         dbeNoReg.Text := DMCXP.UltimoRegistro(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes );
         dbeNoReg.Text := Strzero(dbeNoReg.Text,DMCXP.cdsDetCxP.FieldByName('CPNOREG').Size);
         DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString := dbeNoReg.Text;
      end;

      // Tipo de Cambio
      xWhere := 'TMonId='+''''+DMCXP.wTMonExt+''''
              +' and Fecha='+''''+datetostr(dbdtpFComp.Date)+'''';
      if length(BuscaQry('PrvTGE','TGE107','*',xWhere,'TMonId'))>0 then
         xxTCambio:=DMCXP.cdsQry.fieldbyname('TCAMVOC').AsFloat
      else begin
         dbdtpFComp.SetFocus;
         Raise Exception.Create( ' Error :  Fecha No tiene Tipo de Cambio ' );
      end;
      if ( DMCXP.wVRN_TCambioFijo='S' ) or
         ( (DMCXP.wVRN_TCambioFijo='N') and (DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat=0) ) then begin
         dbeTCLet.Text:= floattostr(FRound(xxTCambio,7,3));
         DMCXP.cdsDetCxP.Edit;
         DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat := FRound(xxTCambio,7,3);
         DMCXP.cdsDetCxP.Post;
      end;
   end;
end;

procedure TFCanjeDoc.dblcdCnpEgrExit(Sender: TObject);
var
   xWhere : String;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

   DMCXP.cdsDetCxP.Edit;
   DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString;
   if length(dbeGlosa.Text)=0 then
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := DMCXP.cdsCnpEgr.FieldByName('CPTODES').AsString;

   xWhere := 'CuentaId='+''''+DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString+'''';
   if length(BuscaQry('PrvTGE','TGE202','*',xWhere,'CuentaId'))>0 then begin
      if DMCXP.cdsQry.fieldbyname('CTA_PRES').AsString='S' then begin
         dblcdPresup.Enabled :=true;
         dblcdPresup.TabOrder:=8;
         dblcdPresup.SetFocus;
         end
      else begin
         DMCXP.cdsDetCxP.Edit;
         DMCXP.cdsDetCxP.FieldByName('PARPRESID').AsString:='';
         dblcdPresup.Enabled:=false;
         dbeGlosa.SetFocus;
      end;
   end;
end;

procedure TFCanjeDoc.BloqueaCampos;
begin
   dblcCia.Enabled      := False;
   edtCanje.Enabled     := False;
   dblcdProv.Enabled    := False;
   dblcdProvRuc.Enabled := False;
   dblcTDoc.Enabled     := False;
   dblcTDiario.Enabled  := False;
   dbdtpFComp.Enabled   := False;
   dbeNoReg.Enabled     := False;
   dbeSerie.Enabled     := False;
   dbeNoDoc.Enabled     := False;
end;

procedure TFCanjeDoc.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
       key:=#0;
       perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFCanjeDoc.bbtnBorraClick(Sender: TObject);
var
   xNumReg: Integer;
begin

   xNumReg := DMCXP.cdsDetCxP.RecordCount;

   DMCXP.cdsDetCxP.CancelUpdates;

   If DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString='I' then begin
      If DMCXP.wModo='A' then begin
         if xNumReg>DMCXP.cdsDetCxP.RecordCount then begin
            DMCXP.cdsDetCxP.Insert;
            InicializaClientDataSet;
            InicializaDatos;
            EstadoDeForma( 0, ' ', ' ' );
            dblcCia.SetFocus;
            end
         else begin
            EstadoDeForma(0,DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString,' ' );
            dbdtpFEmis.SetFocus;
         end
         end
      else begin
         EstadoDeForma(0,DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString,' ' );
         dbdtpFEmis.SetFocus;
      end;
      end
   else begin
      DMCXP.cdsDetCxP.Insert;
      InicializaClientDataSet;
      InicializaDatos;
      EstadoDeForma( 0, ' ', ' ' );
      dblcCia.SetFocus;
   end;
end;

procedure TFCanjeDoc.InicializaClientDataSet;
begin
   // Documentos Pendientes
   DMCXP.cdsMovCxP.Filter:='';
   DMCXP.cdsMovCxP.Filter:='CiaId='+''''+''+'''';
   DMCXP.cdsMovCxP.Filtered:=True;

   // Documentos Seleccionados para Canje
   DMCXP.cdsCanje.Filter:='';
   DMCXP.cdsCanje.Filter:='CiaId='+''''+''+'''';
   DMCXP.cdsCanje.Filtered:=True;

   // Documentos Seleccionados para Canje
   DMCXP.cdsLetras.Filter:='';
   DMCXP.cdsLetras.Filter:='CiaId='+''''+''+'''';
   DMCXP.cdsLetras.Filtered:=True;

   // Tipo de Moneda debe ser L o E
   DMCXP.cdsTMon.Filter:='';
   DMCXP.cdsTMon.Filter:='TMon_Loc=''L'' or TMon_Loc=''E'' ';
   DMCXP.cdsTMon.Filtered:=True;

   // Filtra Tipos de documentos aptos para guardar como Provisión
   DMCXP.cdsTDoc.Filter:='';
   DMCXP.cdsTDoc.Filter:='DOC_FREG='+''''+FPrincipal.xTipoProv+''''; // Forma de Registro Provisión
   DMCXP.cdsTDoc.Filtered:=true;
end;

procedure TFCanjeDoc.InicializaPaneles;
begin
   // Inicializa Paneles
   pnlCabecera.Enabled   := True;
   pnlCab1.Enabled       := True;
   pnlCab2.Enabled       := True;
   pnlPendiente.Enabled := False;
   pnlDocCanje.Enabled   := False;
end;

procedure TFCanjeDoc.InicializaPies;
begin

   dbgDocCanje.ColumnByName('CPNoDoc').FooterValue :='Totales';
   dbgDocCanje.ColumnByName('CPSalLoc').FooterValue:='';
   dbgDocCanje.ColumnByName('CPSalExt').FooterValue:='';
   dbgDocCanje.ColumnByName('CCPMoLoc').FooterValue:='';
   dbgDocCanje.ColumnByName('CCPMoExt').FooterValue:='';

end;

procedure TFCanjeDoc.InicializaDatos;
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
   edtCanje.Text     := '';
   dblcTDoc.Text     := '';
   edtTDoc.Text      := '';
   dblcTDiario.Text  := '';
   edtTDiario.Text   := '';
end;


procedure TFCanjeDoc.InicializaCampos;
begin
   dblcCia.Enabled       := True;
   edtCanje.Enabled      := True;
   dblcdProv.Enabled     := False;
   dblcdProvRuc.Enabled  := False;
   dblcTDoc.Enabled      := False;
   dblcTDiario.Enabled   := False;
   dbeSerie.Enabled      := False;
   dbeNoDoc.Enabled      := False;
   dbdtpFEmis.Enabled    := False;
   dtpFRecep.Enabled     := False;
   dblcTMon.Enabled      := False;
   dbeTCLet.Enabled      := False;
   dbdtpFComp.Enabled    := False;
   dbeLote.Enabled       := False;
   dblcdCnpEgr.Enabled   := False;
   dbeGlosa.Enabled      := False;
   dblcCia.SetFocus;
end;

procedure TFCanjeDoc.FormActivate(Sender: TObject);
begin
   xCrea := True;

   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );

   TemMovCxP := TwwClientDataSet.Create( Nil );
   TemMovCxP.CloneCursor( DMCXP.cdsMovCxP2, True );
   TemMovCxP.IndexFieldNames := 'CIAID;PROV;DOCID;CPSERIE;CPNODOC';

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
      dbeTCLet.Enabled:=True
   else begin
      dbeTCLet.Enabled:=False;
   end;

   if DMCXP.wModo='A' then begin
      InicializaClientDataSet;
      InicializaDatos;
      EstadoDeForma( 0, ' ', ' ' );
      dblcCia.SetFocus;
      end
   else begin
      dblcCia.Text    := DMCXP.cdsMoVCxP2.FieldByName('CIAID').AsString;
      edtCanje.Text   := DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString;
      dblcdProv.Text  := DMCXP.cdsMovCxP2.FieldByName('PROV').AsString;
      dblcClAux.Text  := DMCXP.cdsMovCxP2.FieldByName('CLAUXID').AsString;
      dblcdProvRuc.Text:=DMCXP.cdsMovCxP2.FieldByName('PROVRUC').AsString;
      edtCia.Text     := DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);
      edtProv.text    := DMCXP.DisplayDescrip('TGE201','PROVDES','PROV',dblcdProv.Text);
      dblcTDoc.Text   := DMCXP.cdsDetCxP.FieldByName('DOCID').AsString;
      dblcTDiario.Text:= DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString;
      edtTDoc.Text    := DMCXP.DisplayDescrip('TGE110','DOCDES',  'DocID',  dblcTDoc.Text);
      xConta          := DMCXP.cdsULTTGE.FieldByName('DOCCONTA').AsString;
      edtTDiario.Text := DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);
      edtTMon.Text    := DMCXP.DisplayDescrip('TGE103','TMONDES', 'TMonID', dblcTMon.Text);

      FiltraCanje;

      If DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString='I' then
         EstadoDeForma(0,DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString,DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString)
      else
         EstadoDeForma(1,DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString,DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString);
   end;

   xCrea := False;
end;


procedure TFCanjeDoc.EstadoDeForma( xxModo:Integer; xMovEstado, xMovConta : String );
begin
   pnlCab1.Enabled      := False;
   pnlCab2.Enabled      := False;
   pnlCab3.Enabled      := False;
   dblcCia.Enabled      := False;
   edtCanje.Enabled     := False;
   dblcClAux.Enabled    := False;
   dblcdProv.Enabled    := False;
   dblcdProvRuc.Enabled := False;
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
   Z2bbtnContab.Enabled := False;
   Z2bbtnNuevo.Enabled  := False;

   lblActivo.Visible    := False;
   lblAcepta.Visible    := False;
   lblAnula.Visible     := False;
   lblContab.Visible    := False;

   If xxModo=0 then
      begin
         If (xMovEstado=' ') or (xMovEstado='') then begin
            pnlCab1.Enabled    := True;
            dblcCia.Enabled    := True;
            edtCanje.Enabled   := True;
            pnlCab2.Enabled    := True;
            pnlCab3.Enabled    := True;
            bbtnOK.Enabled     := True;
            bbtnBorra.Enabled  := True;
            lblActivo.Visible  := False;
         end;
         If xMovEstado='X' then begin
            pnlCab1.Enabled     := True;
            dblcClAux.Enabled   := True;
            dblcdProv.Enabled   := True;
            dblcdProvRuc.Enabled:= True;
            pnlCab2.Enabled     := True;
            pnlCab3.Enabled     := True;
            bbtnOK.Enabled      := True;
            bbtnBorra.Enabled   := True;
            lblActivo.Visible   := False;
         end;
         If (xMovEstado='I') or (xMovEstado='T') then begin
            pnlCab3.Enabled    := True;
            bbtnOK.Enabled     := True;
            bbtnBorra.Enabled  := True;
            lblActivo.Visible  := True;
         end;
      end
   else begin

      bbtnSumatClick( Self );

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
            if xConta<>'N' then Z2bbtnContab.Enabled:=True;

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
      pnlCab3.Enabled      := False;
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
      Z2bbtnContab.Enabled := False;
      Z2bbtnNuevo.Enabled  := False;
   end;
end;

procedure TFCanjeDoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // Cancela todas las modificaciones en los cds.
   DMCXP.cdsLetras.CancelUpdates;
   DMCXP.cdsDetCxP.CancelUpdates;
   DMCXP.cdsMovCxP.CancelUpdates;
   DMCXP.cdsCanje.CancelUpdates;
   DMCXP.cdsDetCanje.CancelUpdates;

   TemMovCxP.Free;

   // Eliminar Filtros
   DMCXP.cdsDetCxP.Filtered := False;
   DMCXP.cdsTDoc.Filtered   := False;
   DMCXP.cdsCanje.Filtered  := False;
   DMCXP.cdsLetras.Filtered := False;
   DMCXP.cdsTMon.Filtered   := False;
end;

procedure TFCanjeDoc.bbtnOkClick(Sender: TObject);
begin
   xFlagCal := True;

   If not ValidaCabecera then Exit;  // Valida que Cabecera Tenga Datos Correctos

   DMCXP.cdsTDoc.Filtered:=false;

   if DMCXP.wModo='A' then begin
      DMCXP.cdsDetCxP.edit;
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := dblcTDoc.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := dblcdProv.Text;
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := dblcTDoc.Text;
      DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'I';
      DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
      DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := dblcTDiario.Text;
      dbeNoReg.Text := DMCXP.GrabaUltimoRegistro(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes,StrToInt(dbeNoReg.Text));
      dbeNoReg.Text := StrZero( dbeNoReg.Text,6);
      DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := dbeNoReg.Text;
      DMCXP.cdsDetCxP.Post;
      FiltraCanje;
      DMCXP.cdsDetCxP.First;
   end;

   xTAno := Copy(DMCXP.cdsDetCxP.FieldByName('DCPAnoMM').AsString,1,4);
   xTMes := Copy(DMCXP.cdsDetCxP.FieldByName('DCPAnoMM').AsString,5,2);

   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.First;
   While not DMCXP.cdsCanje.Eof do Begin
      DMCXP.cdsCanje.Edit;
      if ExisteMovCxP( DMCXP.cdsCanje.FieldByName('CIAID').AsString,DMCXP.cdsCanje.FieldByName('TDIARID').AsString,
                       DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString,DMCXP.cdsCanje.FieldByName('CPNOREG').AsString) then begin
         DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat:=DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
         DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat:=DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
      end;
      DMCXP.cdsCanje.FieldByName('CJEANTMN').AsString := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsString;
      DMCXP.cdsCanje.FieldByName('CJEANTME').AsString := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsString;
      DMCXP.cdsCanje.Next;
   end;
   DMCXP.cdsCanje.EnableControls;
   DMCXP.cdsMovCxP.First;

   xFrecep := dtpFRecep.Date;

   If ( DMCXP.cdsMovCxP.RecordCount=0 ) and ( DMCXP.cdsCanje.RecordCount=0 ) then
      Raise Exception.Create('Proveedor No tiene Documentos Pendientes de Pago');

   EstadoDeForma(1,DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString, DMCXP.cdsDetCxP.FieldByName('DCPFlCdr').AsString );

end;

function TFCanjeDoc.ValidaCabecera: Boolean;
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
   If length(dbeLote.Text)=0 then raise exception.Create('Falta Registrar Lote');
   If dbdtpFComp.Date=0 then raise exception.Create('Falta Fecha de Comprobante');
   if length(dbeCuenta.Text)=0 then raise exception.Create('Falta Registrar Cuenta');
   if length(dbeGlosa.Text)=0 then raise exception.Create('Código de Cuenta Errado');
   Result := true;
end;

Function TFCanjeDoc.ExisteMovCxP(xxCia,xxTDiario,xxAAMM,xxNoReg:String):Boolean;
begin
   DMCXP.cdsMovCxP.Setkey;
   DMCXP.cdsMovCxP.FieldByName('CiaId').AsString    := xxCia;
   DMCXP.cdsMovCxP.FieldByName('TDiarID').AsString  := xxTDiario;
   DMCXP.cdsMovCxP.FieldByName('CPAnoMes').AsString := xxAAMM;
   DMCXP.cdsMovCxP.FieldByName('CPNoReg').AsString  := xxNoReg;
   if DMCXP.cdsMovCxP.GotoKey then Result:=True else Result:=False;
end;

procedure TFCanjeDoc.bbtnSumatClick(Sender: TObject);
Var
   xTSalLoc, xTSalExt, xTPagLoc, xTPagExt : double;
   xRegAct : TBookMark;
begin
   With DMCXP Do Begin
      // Totales de Documentos de canje
      cdsCanje.DisableControls;
      xRegAct := cdsCanje.GetBookmark;
      xTSalLoc := 0;
      xTSalExt := 0;
      xTPagLoc := 0;
      xTPagExt := 0;
      cdsCanje.First ;
      While not cdsCanje.Eof do Begin
         xTSalLoc := xTSalLoc + cdsCanje.FieldByName('CPSalLoc').AsFloat;
         xTSalExt := xTSalExt + cdsCanje.FieldByName('CPSalExt').AsFloat;
         xTPagLoc := xTPagLoc + cdsCanje.FieldByName('CCPMoLoc').AsFloat;
         xTPagExt := xTPagExt + cdsCanje.FieldByName('CCPMoExt').AsFloat;
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

procedure TFCanjeDoc.dbgPendienteDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFCanjeDoc.dbgPendienteEndDrag(Sender, Target: TObject; X, Y: Integer);
var
   i: integer;
begin
   If Target=dbgDocCanje then begin

      DMCXP.cdsMovCxP.DisableControls;
      // Verifica que Documentos No Esten Pendientes de Actualización
      for i:= 0 to dbgPendiente.SelectedList.Count-1 do begin
          dbgPendiente.datasource.dataset.GotoBookmark(dbgPendiente.SelectedList.items[i]);
          If DMCXP.cdsMovCxP.FieldByName('TMonID').AsString = DMCXP.wTMonLoc then begin
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

      DMCXP.cdsCanje.DisableControls;
      for i:= 0 to dbgPendiente.SelectedList.Count-1 do begin
          dbgPendiente.datasource.dataset.GotoBookmark(dbgPendiente.SelectedList.items[i]);
          DMCXP.cdsCanje.SetKey;
          DMCXP.cdsCanje.FieldByName('CIAID').AsString    := DMCXP.cdsMovCxP.FieldByName('CIAID').AsString;
          DMCXP.cdsCanje.FieldByName('TCANJEID').AsString := 'CD';
          DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString := edtCanje.Text;
          DMCXP.cdsCanje.FieldByName('TDIARID').AsString  := DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString;
          DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString := DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString;
          DMCXP.cdsCanje.FieldByName('CPNOREG').AsString  := DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString;
          if not DMCXP.cdsCanje.GotoKey then begin
             DMCXP.cdsCanje.Insert;
             DMCXP.cdsCanje.FieldByName('CIAID').AsString    := DMCXP.cdsMovCxP.FieldByName('CIAID').AsString;
             DMCXP.cdsCanje.FieldByName('TDIARID').AsString  := DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString;
             DMCXP.cdsCanje.FieldByName('CPNOREG').AsString  := DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString;
             DMCXP.cdsCanje.FieldByName('CCPANOC').AsString  := DMCXP.cdsMovCxP.FieldByName('CPAAAA').AsString;
             DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString := DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString;
             DMCXP.cdsCanje.FieldByName('PROV').AsString     := DMCXP.cdsMovCxP.FieldByName('PROV').AsString;
             DMCXP.cdsCanje.FieldByName('PROVRUC').AsString  := DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString;
             DMCXP.cdsCanje.FieldByName('DOCID').AsString    := DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
             DMCXP.cdsCanje.FieldByName('LKDOCID').AsString  := DMCXP.cdsMovCxP.FieldByName('LKDOCID').AsString;
             DMCXP.cdsCanje.FieldByName('CPSERIE').AsString  := DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
             DMCXP.cdsCanje.FieldByName('CPNODOC').AsString  := DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
             DMCXP.cdsCanje.FieldByName('TCANJEID').AsString := 'CD';
             DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString := edtCanje.Text;
             DMCXP.cdsCanje.FieldByName('CCPFCJE').AsDateTime:= DMCXP.cdsMovCxP.FieldByName('CPFCanje').AsDatetime;
             DMCXP.cdsCanje.FieldByName('TMONID').AsString   := DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;
             DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOORI').AsFloat,15,2);
             DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat,15,2);
             DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat,15,2);
             DMCXP.cdsCanje.FieldByName('CJEANTMN').AsFloat  := 0;
             DMCXP.cdsCanje.FieldByName('CJEANTME').AsFloat  := 0;
             DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,8,3);
             DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat  := FRound(strtofloat(dbeTCLet.Text),8,3);
             DMCXP.cdsCanje.FieldByName('CCPESTDO').AsString := 'P';
             DMCXP.cdsCanje.FieldByName('CTATOTAL').AsString := DMCXP.cdsMovCxP.FieldByName('CTATOTAL').AsString;
             DMCXP.cdsCanje.FieldByName('CPTOTOT').AsString  := DMCXP.cdsMovCxP.FieldByName('CPTOTOT').AsString;
             DMCXP.cdsCanje.FieldByName('CPFVCMTO').AsDateTime:= DMCXP.cdsMovCxP.FieldByName('CPFVCMTO').AsDateTime;
             DMCXP.cdsCanje.FieldByName('CCPUSER').AsString  := DMCXP.wUsuario;
             DMCXP.cdsCanje.FieldByName('CCPFREG').AsdateTime:= date;
             DMCXP.cdsCanje.FieldByName('CCPHREG').AsdateTime:= time;
             DMCXP.cdsCanje.FieldByName('CCPMM').AsString    := DMCXP.cdsMovCxP.FieldByName('CPMM').AsString;
             DMCXP.cdsCanje.FieldByName('CCPDD').AsString    := DMCXP.cdsMovCxP.FieldByName('CPDD').AsString;
             DMCXP.cdsCanje.FieldByName('CCPTRI').AsString   := DMCXP.cdsMovCxP.FieldByName('CPTRI').AsString;
             DMCXP.cdsCanje.FieldByName('CCPSEM').AsString   := DMCXP.cdsMovCxP.FieldByName('CPSEM').AsString;
             DMCXP.cdsCanje.FieldByName('CCPSS').AsString    := DMCXP.cdsMovCxP.FieldByName('CPSS').AsString;
             DMCXP.cdsCanje.FieldByName('CCPAATRI').AsString := DMCXP.cdsMovCxP.FieldByName('CPAATRI').AsString;
             DMCXP.cdsCanje.FieldByName('CCPAASEM').AsString := DMCXP.cdsMovCxP.FieldByName('CPAASEM').AsString;
             DMCXP.cdsCanje.FieldByName('CCPAASS').AsString  := DMCXP.cdsMovCxP.FieldByName('CPAASS').AsString;

             DMCXP.cdsMovCxP.Edit;
             DMCXP.cdsMovCxP.FieldByName('FLAGVAR').AsString := 'XX';
             DMCXP.cdsMovCxP.Post;
          end;
          dbgPendiente.datasource.dataset.Freebookmark(dbgPendiente.SelectedList.items[i]);
      end;
      dbgPendiente.SelectedList.clear;  { Clear selected record list since they are all deleted}
      DMCXP.cdsMovCxP.EnableControls;
      DMCXP.cdsCanje.EnableControls;
      bbtnSumatClick(Sender);
   end;
end;

procedure TFCanjeDoc.dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFCanjeDoc.dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   If Target=dbgpendiente Then Begin
      DMCXP.cdsMovCxP.Filtered:=False;
      DMCXP.cdsMovCxP.SetKey;
      DMCXP.cdsMovCxP.FieldByName('CIAID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsCanje.FieldByName('TDIARID').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString := DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsCanje.FieldByName('CPNOREG').AsString;
      if DMCXP.cdsMovCxP.GotoKey then begin
         DMCXP.cdsMovCxP.Edit;
         DMCXP.cdsMovCxP.FieldByName('FLAGVAR').AsString:='';
         If DMCXP.cdsMovCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then begin
            DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat+DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat,15,2);
            If DMCXP.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat > 0 then
               DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat/DMCXP.cdsMovCxP.FieldByName('CPTCamPa').AsFloat,15,2)
            else begin
               DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat/DMCXP.cdsMovCxP.FieldByName('CPTCamPr').AsFloat,15,2);
            end;
            end
         else begin
            DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat+DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat,15,2);
            If DMCXP.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat > 0 then
               DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCamPa').AsFloat,15,2)
            else begin
               DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCamPr').AsFloat,15,2);
            end;
         end;

         DMCXP.cdsCanje.Delete;
      end;
      DMCXP.cdsMovCxP.Filtered:=True;
      dbgPendiente.RefreshDisplay;
   end;
end;

procedure TFCanjeDoc.dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocCanje.BeginDrag(False);
end;

procedure TFCanjeDoc.dbgDocCanjeColExit(Sender: TObject);
begin

   if dbgDocCanje.SelectedField.FieldName='CCPTCCJE' then begin
      dbgDocCanje.RefreshDisplay;
   end;

   if dbgDocCanje.SelectedField.FieldName='CCPMOLOC' then begin
      if ( DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsString > DMCXP.cdsCanje.FieldByName('CPSALLOC').AsString ) or
         ( DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat < 0 ) then begin

         if DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsString>DMCXP.cdsCanje.FieldByName('CPSALLOC').AsString then
            ShowMessage(' Error :  Monto excede a Saldo Actual ')
         else
            ShowMessage(' Error :  Monto Debe Ser Mayor a Cero ');

         DMCXP.cdsCanje.Edit;
         DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsString:=DMCXP.cdsCanje.FieldByName('CJEANTMN').AsString;
         DMCXP.cdsCanje.Post;
         dbgDocCanje.SelectedIndex:=8; // debería ser 9 pero no hace caso
         dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
         end
      else begin
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
         DMCXP.cdsCanje.Post;
         dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
         dbgDocCanje.SelectedIndex:=10; // debería ser 9 pero no hace caso
         end
      else begin
         bbtnSumatClick(Sender);
      end;
   end;
end;

procedure TFCanjeDoc.bbtnRegresaClick(Sender: TObject);
begin
   EstadoDeForma(0,DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString, DMCXP.cdsDetCxP.FieldByName('DCPFLCDR').AsString );
end;

procedure TFCanjeDoc.bbtnCancelaClick(Sender: TObject);
begin
   DMCXP.cdsMovCxP.CancelUpdates;
   DMCXP.cdsCanje.CancelUpdates;

   EstadoDeForma(0,DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString, DMCXP.cdsDetCxP.FieldByName('DCPFLCDR').AsString );
end;

procedure TFCanjeDoc.Z2bbtnGrabaClick(Sender: TObject);
begin
   // Verifica que existan Documentos
   if DMCXP.cdsCanje.RecordCount=0 then
      Raise exception.Create('Falta Registrar Documentos a Canjear');

   GrabaDocCanje;

   DMCXP.cdsDetCxP.Edit;
   DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat := FRound( DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat ,10,3);
   DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
   DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime:= Date;
   DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime:= Time;
   DMCXP.cdsDetCxP.Post;

   ActualizaSaldosMovCxP;

   DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DetCxP' );
   DMCXP.AplicaDatos( DMCXP.cdsCanje,  'Canje'  );
   DMCXP.AplicaDatos( DMCXP.cdsMovCxP, 'MovCxP' );
   DMCXP.AplicaDatos( DMCXP.cdsLetras, 'Letras' );

   Filtracds( DMCXP.cdsMovCxP2, '' );
   Filtracds( DMCXP.cdsMovCxP,  '' );
   Filtracds( DMCXP.cdsLetras,  '' );

   EstadoDeForma(1,DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString,DMCXP.cdsDetCxP.FieldByName('DCPFLCDR').AsString);

   ShowMessage('  Registro de Canje Grabado  ');
end;

procedure TFCanjeDoc.GrabaDocCanje;
var
   xTotDoc : double;
begin

   DMCXP.cdsCanje.First;
   xTotDoc := 0;
   while not DMCXP.cdsCanje.Eof do begin
      If dblcTMon.Text=DMCXP.wTMonLoc then begin
         xTotDoc := xTotDoc + DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
         end
      else begin
         xTotDoc := xTotDoc + DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
      end;
      DMCXP.cdsCanje.Next;
   end;

   DMCXP.cdsLetras.Setkey;
   DMCXP.cdsLetras.FieldByName('CIAID').AsString    := DMCXP.cdsDetCxP.FieldByName('CIAID').AsString;
   DMCXP.cdsLetras.FieldByName('TDIARID').AsString  := DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString;
   DMCXP.cdsLetras.FieldByName('CPANOMES').AsString := DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString;
   DMCXP.cdsLetras.FieldByName('CPNOREG').AsString  := DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString;
   if DMCXP.cdsLetras.GotoKey then
      DMCXP.cdsLetras.Edit
   else begin
      DMCXP.cdsLetras.Insert;
      DMCXP.cdsLetras.FieldByName('CIAID').AsString    := DMCXP.cdsDetCxP.FieldByName('CIAID').AsString;
      DMCXP.cdsLetras.FieldByName('TCANJEID').AsString := 'CD';
      DMCXP.cdsLetras.FieldByName('CPCANJE').AsString  := edtCanje.Text;
      DMCXP.cdsLetras.FieldByName('CPANOMES').AsString := DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString;
      DMCXP.cdsLetras.FieldByName('TDIARID').AsString  := DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString;
      DMCXP.cdsLetras.FieldByName('CPNOREG').AsString  := dbeNoReg.Text;
   end;

   DMCXP.cdsLetras.FieldByName('PROVDES').AsString  :=edtProv.Text; // Drescripcion del Proovedor
   DMCXP.cdsLetras.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
   DMCXP.cdsLetras.FieldByName('PROV').AsString     := DMCXP.cdsDetCxP.FieldByName('DCPAuxID').AsString;
   DMCXP.cdsLetras.FieldByName('PROVRUC').AsString  := dblcdProvRuc.Text;
   DMCXP.cdsLetras.FieldByName('DOCID').AsString    := DMCXP.cdsDetCxP.FieldByName('DOCID').AsString;
   DMCXP.cdsLetras.FieldByName('CPSERIE').AsString  := DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString;;
   DMCXP.cdsLetras.FieldByName('CPNODOC').AsString  := DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString;;
   DMCXP.cdsLetras.FieldByName('CPFRECEP').AsDateTime:= xFRecep;
   DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime := DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime;
   DMCXP.cdsLetras.FieldByName('TMONID').AsString   := DMCXP.cdsDetCxP.FieldByName('TMONID').AsString;
   DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat  := FRound(DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,10,3);
   DMCXP.cdsLetras.FieldByName('CPESTADO').AsString := 'I';
   DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString := 'N';

   If dblcTMon.Text=DMCXP.wTMonLoc then begin
      DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat := xTotDoc;
      DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
      DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
      DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
      DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
      DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
      end
   Else begin
      DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat := xTotDoc;
      DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
      DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
      DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
      DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
      DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
   end;

   DMCXP.cdsLetras.FieldByName('CPFCANJE').AsDateTime:= DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime;
   DMCXP.cdsLetras.FieldByName('CTATOTAL').AsString := DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString;
   DMCXP.cdsLetras.FieldByName('CPTOTOT').AsString  := DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString;
   DMCXP.cdsLetras.FieldByName('CPFCMPRB').AsDateTime:= DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime;
   DMCXP.cdsLetras.FieldByName('DCPLOTE').AsString  := DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString;
   DMCXP.cdsLetras.FieldByName('CPAAAA').AsString   := DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString;
   DMCXP.cdsLetras.FieldByName('CPMM').AsString     := DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString;
   DMCXP.cdsLetras.FieldByName('CPDD').AsString     := DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString;
   DMCXP.cdsLetras.FieldByName('CPTRI').AsString    := DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString;
   DMCXP.cdsLetras.FieldByName('CPSEM').AsString    := DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString;
   DMCXP.cdsLetras.FieldByName('CPSS').AsString     := DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString;
   DMCXP.cdsLetras.FieldByName('CPAATRI').AsString  := DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString;
   DMCXP.cdsLetras.FieldByName('CPAASEM').AsString  := DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString;
   DMCXP.cdsLetras.FieldByName('CPAASS').AsString   := DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString;
   DMCXP.cdsLetras.Post;
end;

procedure TFCanjeDoc.Z2bbtnAceptaClick(Sender: TObject);
begin
   ActualizaPagadoMovCxP;

   GrabaDetCanje;

   DMCXP.cdsDetCxP.Edit;
   DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'P';
   DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
   DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime:= date;
   DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime:= Time;

   DMCXP.cdsLetras.Setkey;
   DMCXP.cdsLetras.FieldByName('CIAID').AsString    := DMCXP.cdsDetCxP.FieldByName('CIAID').AsString;
   DMCXP.cdsLetras.FieldByName('TDIARID').AsString  := DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString;
   DMCXP.cdsLetras.FieldByName('CPANOMES').AsString := DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString;
   DMCXP.cdsLetras.FieldByName('CPNOREG').AsString  := DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString;
   if DMCXP.cdsLetras.GotoKey then begin
      DMCXP.cdsLetras.Edit;
      DMCXP.cdsLetras.FieldByName('CPESTADO').AsString := 'P';
   end;
   DMCXP.SaldosAuxiliar( DMCXP.cdsLetras.FieldByName('CiaId').AsString,DMCXP.cdsLetras.FieldByName('CPANOMES').AsString,
                       DMCXP.cdsLetras.FieldByName('CLAUXID').AsString,DMCXP.cdsLetras.FieldByName('PROV').AsString,
                       '-',DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat,DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat, DMCXP.cdsDetCxP.FieldByName('TMONID').AsString );

   DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DetCxP' );
   DMCXP.AplicaDatos( DMCXP.cdsLetras, 'Letras' );

   Filtracds( DMCXP.cdsMovCxP2, '' );
   Filtracds( DMCXP.cdsMovCxP,  '' );
   Filtracds( DMCXP.cdsLetras,  '' );

   EstadoDeForma(1,DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString,DMCXP.cdsDetCxP.FieldByName('DCPFLCDR').AsString);

   ShowMessage(' Canje de Letras Aceptado ');
end;

procedure TFCanjeDoc.ActualizaSaldosMovCxP;
var
   xRegAct : TBookMark;
   xPagLoc, xPagExt : double;
begin
   // Actualiza Saldo de MovCxP
   DMCXP.cdsMovCxP.DisableControls;
   DMCXP.cdsMovCxP.Filtered:=False;
   DMCXP.cdsCanje.DisableControls;
   xRegAct := DMCXP.cdsCanje.GetBookmark;
   DMCXP.cdsCanje.First;
   while not DMCXP.cdsCanje.Eof do begin
      DMCXP.cdsCanje.Edit;
      DMCXP.cdsMovCxP.Setkey;
      DMCXP.cdsMovCxP.FieldByName('CIAID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsCanje.FieldByName('TDIARID').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString := DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsCanje.FieldByName('CPNOREG').AsString;
      if DMCXP.cdsMovCxP.GotoKey then begin
         If DMCXP.cdsMovCxP.FieldByName('TMonID').AsString = DMCXP.wTMonLoc then begin
            If FRound(DMCXP.cdsMovCxP.FieldByName('CPPagLoc').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2)
               > FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoLoc').AsFloat,15,2) then begin
               Raise exception.Create('Error : Monto pagado excede a Monto Total de Documento');
            end;
            end
         else begin
            If FRound(DMCXP.cdsMovCxP.FieldByName('CPPagExt').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2)
               > FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoExt').AsFloat,15,2) Then begin
               Raise exception.Create('Error : Monto pagado excede a Monto Total de Documento');
            End;
         end;
         DMCXP.cdsMovCxP.edit;
         If DMCXP.cdsMovCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then begin
            xPagLoc := FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
            DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoLoc').AsFloat-xPagLoc,15,2);
            DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCjE').AsFloat,15,2);
            end
         else begin
            xPagExt := FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2);
            DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat-xPagExt,15,2);
            DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCCjE').AsFloat,15,2);
         end;
         DMCXP.cdsMovCxP.FieldByName('FlagVar').AsString := '';
      end;
      DMCXP.cdsCanje.Next;
   end;
   DMCXP.cdsMovCxP.Post;
   DMCXP.cdsCanje.GotoBookmark(xRegAct);
   DMCXP.cdsCanje.FreeBookmark(xRegAct);
   DMCXP.cdsCanje.EnableControls;
   DMCXP.cdsMovCxP.Filtered:=True;
   DMCXP.cdsMovCxP.EnableControls;
end;

Procedure TFCanjeDoc.GrabaDetCanje;
begin
   DMCXP.cdsDetCanje.First;
   While (not DMCXP.cdsDetCanje.Eof)and(DMCXP.cdsDetCanje.RecordCount>0) do
      DMCXP.cdsDetCanje.Delete;

   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.First;
   While not DMCXP.cdsCanje.Eof do begin

      GrabaRegCxP305;

      If DMCXP.cdsDetCanje.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then begin
         DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat:=FRound(DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
         DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat:=FRound(DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat,15,2);
         end
      Else begin
         DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat:=FRound(DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2);
         DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat:=FRound(DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat,15,2);
      End;

      DMCXP.cdsCanje.Next;
   end;
   DMCXP.cdsDetCanje.First;
   DMCXP.cdsCanje.EnableControls;
   DMCXP.AplicaDatos( DMCXP.cdsDetCanje, 'DetCanje' );

   // Actualiza Detalle de Canje
   xSQL := 'Select * from DB2ADMIN.CXP305';
   DMCXP.cdsDetCanje2.Close;
   DMCXP.cdsDetCanje2.DataRequest(xSQL);
   DMCXP.cdsDetCanje2.Open;
end;

Procedure TFCanjeDoc.GrabaRegCxP305;
begin
   DMCXP.cdsDetCanje.Insert;
   DMCXP.cdsDetCanje.FieldByName('CIAID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
   DMCXP.cdsDetCanje.FieldByName('PROV').AsString     := DMCXP.cdsCanje.FieldByName('PROV').AsString;
   DMCXP.cdsDetCanje.FieldByName('PROVRUC').AsString  := DMCXP.cdsCanje.FieldByName('PROVRUC').AsString;
   DMCXP.cdsDetCanje.FieldByName('DOCID').AsString    := DMCXP.cdsCanje.FieldByName('DOCID').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString  := DMCXP.cdsCanje.FieldByName('CPSERIE').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString  := DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPNOREG').AsString  := dbeNoReg.Text;
   DMCXP.cdsDetCanje.FieldByName('TCANJEID').AsString := DMCXP.cdsCanje.FieldByName('TCANJEID').AsString;
   DMCXP.cdsDetCanje.FieldByName('CCPCANJE').AsString := DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString;
   DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsString  := DMCXP.cdsCanje.FieldByName('CCPFCJE').AsString;
   DMCXP.cdsDetCanje.FieldByName('DOCID2').AsString   := dblcTDoc.Text;
   DMCXP.cdsDetCanje.FieldByName('CPSERIE2').AsString := DMCXP.cdsLetras.FieldByName('CPSERIE').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPNODOC2').AsString := DMCXP.cdsLetras.FieldByName('CPNODOC').AsString;
   DMCXP.cdsDetCanje.FieldByName('TMONID').AsString   := DMCXP.cdsCanje.FieldByName('TMONID').AsString;
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
end;


procedure TFCanjeDoc.Z2bbtnContabClick(Sender: TObject);
begin

   GeneraAsientoCanje;

   GeneraAsientoAutomatico;

   DMCXP.cdsLetras.Setkey;
   DMCXP.cdsLetras.FieldByName('CIAID').AsString    := DMCXP.cdsDetCxP.FieldByName('CiaID').AsString;
   DMCXP.cdsLetras.FieldByName('TDIARID').AsString  := DMCXP.cdsDetCxP.FieldByName('TDiarID').AsString;
   DMCXP.cdsLetras.FieldByName('CPANOMES').AsString := DMCXP.cdsDetCxP.FieldByName('DCPAnoMM').AsString;
   DMCXP.cdsLetras.FieldByName('CPNOREG').AsString  := DMCXP.cdsDetCxP.FieldByName('CPNoReg').AsString;
   if DMCXP.cdsLetras.GotoKey then begin
      DMCXP.cdsLetras.Edit;
      DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString := 'S';
   end;

   DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DetCxP' );
   DMCXP.AplicaDatos( DMCXP.cdsLetras, 'Letras' );

   Filtracds( DMCXP.cdsMovCxP2, '' );
   Filtracds( DMCXP.cdsMovCxP,  '' );
   Filtracds( DMCXP.cdsLetras,  '' );

   EstadoDeForma(1,DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString,DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString);

   ShowMessage('Registro Contabilizado');

end;

procedure TFCanjeDoc.GeneraAsientoCanje;
begin

   DMCXP.cdsDetCanje.Filter := '';
   DMCXP.cdsDetCanje.Filter := 'CiaId='   +''''+dblcCia.Text +''''+' and '+
                             'TCanjeID='+''''+'CD'         +''''+' and '+
                             'CCPCanje='+''''+edtCanje.text+''''+' and '+
                             'DocID2='  +''''+DMCXP.cdsLetras.FieldByName('DOCID').AsString  +''''+' and '+
                             'CPSerie2='+''''+DMCXP.cdsLetras.FieldByName('CPSERIE').AsString+''''+' and '+
                             'CPNoDoc2='+''''+DMCXP.cdsLetras.FieldByName('CPNODOC').AsString+'''';
   DMCXP.cdsDetCanje.Filtered := True;

   DMCXP.cdsDetCanje.First;
   while not DMCXP.cdsDetCanje.Eof do begin
      DMCXP.cdsCanje.SetKey;
      DMCXP.cdsCanje.FieldByName('CIAID').AsString    := DMCXP.cdsLetras.FieldByName('CIAID').AsString;
      DMCXP.cdsCanje.FieldByName('TCANJEID').AsString := DMCXP.cdsLetras.FieldByName('TCANJEID').AsString;
      DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString := DMCXP.cdsLetras.FieldByName('CPCANJE').AsString;
      DMCXP.cdsCanje.FieldByName('TDIARID').AsString  := DMCXP.cdsLetras.FieldByName('TDIARID').AsString;
      DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString := DMCXP.cdsLetras.FieldByName('CPANOMES').AsString;
      DMCXP.cdsCanje.FieldByName('CPNOREG').AsString  := DMCXP.cdsLetras.FieldByName('CPNOREG').AsString;
      if DMCXP.cdsCanje.GotoKey then begin

         GeneraDiferenciaCambio;

         DMCXP.cdsDetCxP.Insert;
         DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsLetras.FieldByName('CIAID').AsString;
         DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := DMCXP.cdsLetras.FieldByName('TCANJEID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := DMCXP.cdsLetras.FieldByName('CPCANJE').AsString;
         DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsLetras.FieldByName('TDIARID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsLetras.FieldByName('CPNOREG').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsLetras.FieldByName('CPANOMES').AsString;
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
         DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsString := DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsString;
         DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := DMCXP.cdsCanje.FieldByName('TMONID').AsString;
         if DMCXP.cdsCanje.FieldByName('TMONID').AsString=DMCXP.wTMonExt then
            DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsString := DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsString
         else begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsString := DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsString;
         end;
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat + xDifCLoc,15,2);
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat + xDifCExt,15,2);
         DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime:= DMCXP.cdsCanje.FieldByName('CPFEMIS').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:= DMCXP.cdsCanje.FieldByName('CPFVCMTO').AsDateTime;
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

         GrabaDiferenciaCambio;

      end;
      DMCXP.cdsDetCanje.Next;
   end;

end;

procedure TFCanjeDoc.DetCxPUsuario;
begin
   DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
   DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime:= Date;
   DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime:= time;
end;


procedure TFCanjeDoc.Z2bbtnAnulaClick(Sender: TObject);
begin
   // Anula todas Las letras del canje
   DMCXP.cdsDetCxP.Edit;
   DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'A';
   DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
   DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime:= date;
   DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime:= Time;

   // Actualiza los Saldos de los Documentos Canjeados
   DMCXP.cdsMovCxP.DisableControls;
   DMCXP.cdsMovCxP.Filtered:=False;
   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.First;
   While not DMCXP.cdsCanje.Eof do Begin
      DMCXP.cdsCanje.Edit;
      if ExisteMovCxP( DMCXP.cdsCanje.FieldByName('CIAID').AsString,DMCXP.cdsCanje.FieldByName('TDiarID').AsString,
                       DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString,DMCXP.cdsCanje.FieldByName('CPNoReg').AsString) then begin
         DMCXP.cdsMovCxP.Edit;
         If DMCXP.cdsMovCxP.FieldByName('TMONID').ASString = DMCXP.wTMonLoc then begin
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
      end;
      DMCXP.cdsCanje.Next;
   end;
   DMCXP.cdsCanje.EnableControls;
   DMCXP.cdsMovCxP.Filtered:=True;
   DMCXP.cdsMovCxP.EnableControls;
   /////////////
   DMCXP.cdsLetras.Setkey;
   DMCXP.cdsLetras.FieldByName('CIAID').AsString    := DMCXP.cdsDetCxP.FieldByName('CIAID').AsString;
   DMCXP.cdsLetras.FieldByName('TDIARID').AsString  := DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString;
   DMCXP.cdsLetras.FieldByName('CPANOMES').AsString := DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString;
   DMCXP.cdsLetras.FieldByName('CPNOREG').AsString  := DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString;
   if DMCXP.cdsLetras.GotoKey then begin
      DMCXP.cdsLetras.Edit;
      DMCXP.cdsLetras.FieldByName('CPESTADO').AsString := 'A';
   end;

   DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DetCxP' );
   DMCXP.AplicaDatos( DMCXP.cdsMovCxP, 'MovCxP' );

   Filtracds( DMCXP.cdsMovCxP2, '' );
   Filtracds( DMCXP.cdsMovCxP,  '' );
   Filtracds( DMCXP.cdsLetras,  '' );

   EstadoDeForma(1,DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString,DMCXP.cdsDetCxP.FieldByName('DCPFLCDR').AsString);

   ShowMessage(' Canje de Letras Anulado ');

end;


procedure TFCanjeDoc.ActualizaPagadoMovCxP;
begin
   DMCXP.cdsMovCxP.DisableControls;
   DMCXP.cdsMovCxP.Filtered:=False;
   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.First;
   While not DMCXP.cdsCanje.Eof do Begin
      DMCXP.cdsMovCxP.Setkey;
      DMCXP.cdsMovCxP.FieldByName('CIAID').AsString   := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString := DMCXP.cdsCanje.FieldByName('TDIARID').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString:= DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString;
      DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString := DMCXP.cdsCanje.FieldByName('CPNOREG').AsString;
      if DMCXP.cdsMovCxP.GotoKey then begin
         DMCXP.cdsMovCxP.edit;
         If DMCXP.cdsMovCxP.FieldByName('TMONID').ASString = DMCXP.wTMonLoc then begin
            DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
            DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
            If DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat <= 0 then
               DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString:='C';
            end
         else begin
            DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat+DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2);
            DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat:=FRound(DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
            If DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat<=0 then
               DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString:='C';
         end;
         DMCXP.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat:=FRound(DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
         DMCXP.cdsMovCxP.Post;
      end;
      DMCXP.cdsCanje.Next;
   end;
   DMCXP.cdsMovCxP.Filtered:=True;
   DMCXP.cdsMovCxP.First;

   DMCXP.AplicaDatos( DMCXP.cdsMovCxP, 'MovCxP' );
   DMCXP.cdsMovCxP.EnableControls;
   DMCXP.cdsCanje.EnableControls;
end;


procedure TFCanjeDoc.GeneraAsientoAutomatico;
var
   xCtaAut1, xCtaAut2, xDH1, xDH2 : String;
begin

   // Verifica Que Asiento Cuadre
   If not AsientoCuadra then raise exception.Create(' Error:  Asiento No Cuadra ');

   // Genera Asiento Automatico
   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.First ;
   While not DMCXP.cdsDetCxP.Eof do begin

      xCtaAut1 := DMCXP.DisplayDescrip('TGE202','CTAAUT1','CUENTAID',DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString);

      if length( xCtaAut1 )>0 then begin

         xCtaAut2:=DMCXP.cdsULTTGE.FieldByName('CtaAut2').AsString;

         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString='D' then xDH1:='D' else xDH1:='H';
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString='D' then xDH2:='H' else xDH2:='D';

         // Grabar Asiento Contable

         DMCXP.cdsDetCxP2.Insert;
         DMCXP.cdsDetCxP2.FieldByName('CIAID').AsString    := DMCXP.cdsDetCxP.FieldByName('CIAID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('TDIARID').AsString  := DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('CPNOREG').AsString  := DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPANOMM').AsString := DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPANOC').AsString  := DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPLOTE').AsString  := DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString;
         DMCXP.cdsDetCxP2.FieldByName('TRANSID').AsString  := DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('CUENTAID').AsString := xCtaAut1;
         DMCXP.cdsDetCxP2.FieldByName('CPTOID').AsString   := DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('CLAUXID').AsString  := DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPAUXID').AsString := DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DOCID').AsString    := DMCXP.cdsDetCxP.FieldByName('DOCID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('CPSERIE').AsString  := DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString;
         DMCXP.cdsDetCxP2.FieldByName('CPNODOC').AsString  := DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPGLOSA').AsString := DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPDH').AsString    := xDH1;
         DMCXP.cdsDetCxP2.FieldByName('CPTCAMPR').AsString := DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPMOORI').AsFloat  := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         DMCXP.cdsDetCxP2.FieldByName('DCPMOLOC').AsFloat  := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
         DMCXP.cdsDetCxP2.FieldByName('DCPMOEXT').AsFloat  := DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat;
         DMCXP.cdsDetCxP2.FieldByName('CPFEMIS').AsDateTime:= DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime;
         DMCXP.cdsDetCxP2.FieldByName('CPFVCMTO').AsdateTime:= DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime;
         DMCXP.cdsDetCxP2.FieldByName('DCPFCOM').AsDateTime:= DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime;
         DMCXP.cdsDetCxP2.FieldByName('DCPESTDO').AsString := DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString;
         DMCXP.cdsDetCxP2.FieldByName('TMONID').AsString   := DMCXP.cdsDetCxP.FieldByName('TMONID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPMM').AsString    := DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPDD').AsString    := DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPTRI').AsString   := DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPSEM').AsString   := DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPSS').AsString    := DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPAATRI').AsString := DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPAASEM').AsString := DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPAASS').AsString  := DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString;
         DetCxP2Usuario;  // Graba Usuario, Fecha y Hora

         DMCXP.cdsDetCxP2.Insert;
         DMCXP.cdsDetCxP2.FieldByName('CIAID').AsString    := DMCXP.cdsDetCxP.FieldByName('CIAID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('TDIARID').AsString  := DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('CPNOREG').AsString  := DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPANOMM').AsString := DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPANOC').AsString  := DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPLOTE').AsString  := DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString;
         DMCXP.cdsDetCxP2.FieldByName('TRANSID').AsString  := DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('CUENTAID').AsString := xCtaAut2;
         DMCXP.cdsDetCxP2.FieldByName('CPTOID').AsString   := DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('CLAUXID').AsString  := DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPAUXID').AsString := DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DOCID').AsString    := DMCXP.cdsDetCxP.FieldByName('DOCID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('CPSERIE').AsString  := DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString;
         DMCXP.cdsDetCxP2.FieldByName('CPNODOC').AsString  := DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPGLOSA').AsString := DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPDH').AsString    := xDH2;
         DMCXP.cdsDetCxP2.FieldByName('CPTCAMPR').AsString := DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPMOORI').AsFloat  := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         DMCXP.cdsDetCxP2.FieldByName('DCPMOLOC').AsFloat  := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
         DMCXP.cdsDetCxP2.FieldByName('DCPMOEXT').AsFloat  := DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat;
         DMCXP.cdsDetCxP2.FieldByName('CPFEMIS').AsDateTime:= DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime;
         DMCXP.cdsDetCxP2.FieldByName('CPFVCMTO').AsDateTime:= DMCXP.cdsDetCxP.FieldByName('CPFVCMTo').AsdateTime;
         DMCXP.cdsDetCxP2.FieldByName('DCPFCOM').AsDatetime:= DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime;
         DMCXP.cdsDetCxP2.FieldByName('DCPESTDO').AsString := DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString;
         DMCXP.cdsDetCxP2.FieldByName('TMONID').AsString   := DMCXP.cdsDetCxP.FieldByName('TMONID').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPMM').AsString    := DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPDD').AsString    := DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPTRI').AsString   := DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPSEM').AsString   := DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPSS').AsString    := DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPAATRI').AsString := DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPAASEM').AsString := DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString;
         DMCXP.cdsDetCxP2.FieldByName('DCPAASS').AsString  := DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString;
         DetCxP2Usuario;  // Graba Usuario, Fecha y Hora
      end;
      DMCXP.cdsDetCxP.Next;
   end;
   //
   DMCXP.AplicaDatos( DMCXP.cdsDetCxP2, 'DetCxP2' );
   //
   xSQL := 'Select * from DB2ADMIN.CXP302';
   DMCXP.cdsDetCxP.Close;
   DMCXP.cdsDetCxP.DataRequest(xSQL);
   DMCXP.cdsDetCxP.Open;
   DMCXP.cdsDetCxP2.Close;
   DMCXP.cdsDetCxP2.DataRequest(xSQL);
   DMCXP.cdsDetCxP2.Open;
   //
   DMCXP.cdsDetCxP.First;
   DMCXP.cdsDetCxP.EnableControls;
   //
   ShowMessage('Asiento Automático Generado');
   //
end;

procedure TFCanjeDoc.GeneraDiferenciaCambio;
begin
   xDifCLoc:=0;
   xDifCExt:=0;
   if DMCXP.cdsCanje.FieldByName('TMONID').AsString=DMCXP.wTMonExt then begin
      xPagAnt := FRound( DMCXP.cdsDetCanje.FieldByName('DCDMoExt').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCDoc').AsFloat,15,2);
      If DMCXP.cdsDetCanje.FieldByName('DCDMoLoc').AsFloat > xPagAnt then begin
         xDifCam  := FRound( DMCXP.cdsDetCanje.FieldByName('DCDMoLoc').AsFloat - xPagAnt,15,2);
         xDifCLoc := FRound( (-1)*(DMCXP.cdsDetCanje.FieldByName('DCDMoLoc').AsFloat - xPagAnt),15,2);
         xCtaDif  := DMCXP.wDifAjuP;
         xGloDif  := 'Perdida - Ajuste por Diferencia de Cambio';
         xDH      := 'D'
         end
      else begin
         xDifCam  := FRound(xPagAnt - DMCXP.cdsDetCanje.FieldByName('DCDMoLoc').AsFloat,15,2);
         xDifCLoc := FRound(xPagAnt - DMCXP.cdsDetCanje.FieldByName('DCDMoLoc').AsFloat,15,2);
         xCtaDif  := DMCXP.wDifAjuG;
         xGloDif  := 'Ganancia - Ajuste por Diferencia de Cambio';
         xDH      := 'H'
      end;
      end
   else begin
      xPagAnt := FRound( DMCXP.cdsDetCanje.FieldByName('DCDMoLoc').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCDoc').AsFloat,15,2);
      If DMCXP.cdsDetCanje.FieldByName('DCDMoExt').AsFloat > xPagAnt then begin
         xDifCam  := FRound( DMCXP.cdsCanje.FieldByName('CCPMoExt').AsFloat - xPagAnt,15,2);
         xDifCExt := FRound( (-1)*(DMCXP.cdsDetCanje.FieldByName('DCDMoExt').AsFloat - xPagAnt),15,2);
         xCtaDif  := DMCXP.wDifAjuP;
         xGloDif  := 'Perdida - Ajuste por Diferencia de Cambio';
         xDH      := 'D'
         end
      else begin
         xDifCam  := xPagAnt - DMCXP.cdsDetCanje.FieldByName('DCDMoExt').AsFloat;
         xDifCExt := xPagAnt - DMCXP.cdsDetCanje.FieldByName('DCDMoExt').AsFloat;
         xCtaDif  := DMCXP.wDifAjuG;
         xGloDif  := 'Ganancia - Ajuste por Diferencia de Cambio';
         xDH      := 'H'
      end;
   end;
end;

procedure TFCanjeDoc.GrabaDiferenciaCambio;
begin
   If xDifCam > 0 Then begin
      DMCXP.cdsDetCxP.Insert;
      DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsCanje.FieldByName('CiaID').AsString;
      DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString := DMCXP.cdsLetras.FieldByName('TCANJEID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CANJE').AsString    := DMCXP.cdsLetras.FieldByName('CPCANJE').AsString;
      DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsLetras.FieldByName('TDIARID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsLetras.FieldByName('CPNOREG').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsLetras.FieldByName('CPANOMES').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := DMCXP.cdsLetras.FieldByName('CPAAAA').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := xLote;
      DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xCtaDif;
      //cdsDetCxPCptoID').AsString   := cdsCanjeCptoTot').AsString;
      DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsCanje.FieldByName('Prov').AsString;
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsCanje.FieldByName('DocID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := DMCXP.cdsCanje.FieldByName('CPSerie').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsCanje.FieldByName('CPNoDoc').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := xGloDif;
      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := xDH;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsString := DMCXP.cdsCanje.FieldByName('CCPTCDoc').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsString := DMCXP.cdsCanje.FieldByName('CCPTCCje').AsString;
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
      //
      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime:= DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsdateTime:=DMCXP.cdsCanje.FieldByName('CPFVcmto').AsDateTime;
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

Function TFCanjeDoc.AsientoCuadra:Boolean;
var
   xTotDebe, xTotHaber : double;
begin

   Result    := False;
   xTotDebe  := 0;
   xTotHaber := 0;
   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.First ;
   While not DMCXP.cdsDetCxP.Eof do begin
      If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString='D' then
         xTotDebe  := xTotDebe  + DMCXP.cdsDetCxP.FieldByName('DCPMoLoc').AsFloat
      else begin
         xTotHaber := xTotHaber + DMCXP.cdsDetCxP.FieldByName('DCPMoLoc').AsFloat;
      end;
      DMCXP.cdsDetCxP.Next;
   end;
   DMCXP.cdsDetCxP.First;
   DMCXP.cdsDetCxP.EnableControls;

   If xTotDebe=xTotHaber then
      Result := True;

end;

procedure TFCanjeDoc.DetCxP2Usuario;
begin
   DMCXP.cdsDetCxP2.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
   DMCXP.cdsDetCxP2.FieldByName('DCPFREG').AsdateTime:= Date;
   DMCXP.cdsDetCxP2.FieldByName('DCPHREG').AsDateTime:= time;
end;

procedure TFCanjeDoc.dbeNoDocExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if dbeSerie.Focused  then Exit;

   if length(dbeNoDoc.Text)=0 then
   begin
      ShowMessage('Falta No. de Documento');
      dbeNoDoc.SetFocus;
      exit;
   end;
   TemMovCxP.SetKey;
   TemMovCxP.FieldByname('CIAID').AsString := dblcCia.Text;
   TemMovCxP.FieldByname('PROV').AsString := dblcdProv.Text;
   TemMovCxP.FieldByname('DOCID').AsString := dblcTDoc.Text;
   TemMovCxP.FieldByname('CPSERIE').AsString := dbeSerie.Text;
   TemMovCxP.FieldByname( 'CPNODOC').AsString := dbeNoDoc.Text;
   if TemMovCxP.Gotokey then begin
      ShowMessage('No de Documento Duplicado');
      dbeNoDoc.SetFocus;
   end;
end;

procedure TFCanjeDoc.dbgPendienteMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgPendiente.BeginDrag(False);
end;

procedure TFCanjeDoc.dblcTDocEnter(Sender: TObject);
begin
   DMCXP.cdsTDoc.Filtered := True;
end;

procedure TFCanjeDoc.Z2bbtnNuevoClick(Sender: TObject);
begin
   if MessageDlg('Ingresar Nuevo Canje'+chr(13)+chr(13)+
                 '   ¿ Esta Seguro ?  ',mtConfirmation, [mbYes, mbNo], 0)=mrYes then begin

      // Cancela todas las modificaciones en los
      DMCXP.cdsLetras.CancelUpdates;
      DMCXP.cdsDetCxP.CancelUpdates;
      DMCXP.cdsMovCxP.CancelUpdates;
      DMCXP.cdsCanje.CancelUpdates;
      DMCXP.cdsDetCanje.CancelUpdates;

      // Reinicializa todo
      InicializaClientDataSet;
      InicializaPaneles;
      InicializaPies;
      InicializaDatos;
      InicializaCampos;

   end;

end;

procedure TFCanjeDoc.dbgDocCanjeCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
// clInfoBk;    Amarillo
// $00FEE881;   Celeste
// clBlack;     Negro
// clGray;      Plomo Oscuro
// clSilver;    Plomo Claro

// $00FFE6CC;   Celeste del Fondo
// $00E8E8E8    Plomo Claro para el fondo del grid

   If DMCXP.wVRN_PagosParciales='S' then begin
      If (FIELD.FieldName='CCPTCCJE') or
         (FIELD.FieldName='CCPMOLOC') or
         (FIELD.FieldName='CCPMOEXT') then begin

         AFont.Color  := clBlack;
         ABrush.Color := clWindow;
      end;
   end;
end;

procedure TFCanjeDoc.FormCreate(Sender: TObject);
begin
   If DMCXP.wAdmin='G' then begin
      DMCXP.wObjetoDesPr := Caption;
      FPrincipal.ListaComponentes(Self);
   end;
end;

procedure TFCanjeDoc.dblcdProvRucEnter(Sender: TObject);
begin
   DMCXP.cdsProv.IndexFieldNames:='ProvDes';
end;

procedure TFCanjeDoc.dblcdProvEnter(Sender: TObject);
begin
   DMCXP.cdsProv.IndexFieldNames:='ProvDes';
end;

procedure TFCanjeDoc.dblcClAuxExit(Sender: TObject);
var
   xWhere : String;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

   xWhere:='ClAuxId='''+dblcClAux.Text+''' and MODULO LIKE ''%'+DMCXP.wModulo+'%''';
   if length(BuscaQry('dspTGE','TGE102','CLAUXDES',xWhere,'CLAUXDES'))=0 then
   begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Clase de Auxiliar');
   end;

   Filtracds( DMCXP.cdsProv,'Select * from TGE201 Where CLAUXID='''+dblcClAux.Text+'''' );

   if Length(dblcdProv.Text)>0 then begin
      xWhere:='ClAuxId='''+dblcClAux.Text+''' and Prov='''+dblcdProv.Text+'''';
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
   if Length(dblcdProv.Text)=0 then dblcdProv.SetFocus;
end;

procedure TFCanjeDoc.dbeNoRegExit(Sender: TObject);
begin
   DMCXP.cdsLetras.Insert;
   DMCXP.cdsLetras.FieldByName('CIAID').AsString    := DMCXP.cdsDetCxP.FieldByName('CIAID').AsString;
   DMCXP.cdsLetras.FieldByName('TCANJEID').AsString := 'CD';
   DMCXP.cdsLetras.FieldByName('CPCANJE').AsString  := edtCanje.Text;
   DMCXP.cdsLetras.FieldByName('CPANOMES').AsString := DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString;
   DMCXP.cdsLetras.FieldByName('TDIARID').AsString  := DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString;
   DMCXP.cdsLetras.FieldByName('CPNOREG').AsString  := dbeNoReg.Text;
   DMCXP.cdsLetras.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
   DMCXP.cdsLetras.FieldByName('PROV').AsString     := DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString;
   DMCXP.cdsLetras.FieldByName('PROVRUC').AsString  := dblcdProvRuc.Text;
   DMCXP.cdsLetras.FieldByName('DOCID').AsString    := DMCXP.cdsDetCxP.FieldByName('DOCID').AsString;
   DMCXP.cdsLetras.FieldByName('CPSERIE').AsString  := DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString;;
   DMCXP.cdsLetras.FieldByName('CPNODOC').AsString  := DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString;;
   DMCXP.AplicaDatos( DMCXP.cdsLetras, 'Letras' );
end;

procedure TFCanjeDoc.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.
