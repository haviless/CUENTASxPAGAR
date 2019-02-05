unit CxP780;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, wwdblook, Buttons, wwdbdatetimepicker, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppCtrls,
  ppPrnabl, ppBands, ppVar, Wwdbdlg, oaVariables, db;

type
  TFToolLetPend = class(TForm)
    pnlLet: TPanel;
    SpeedButton3: TSpeedButton;
    ppDBLetras: TppDBPipeline;
    ppRLetras: TppReport;
    ppHeaderBand1: TppHeaderBand;
    pplblCia: TppLabel;
    pplblFecha: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    pplblUser: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText10: TppDBText;
    ppDBText6: TppDBText;
    ppLine2: TppLine;
    ppVMes: TppVariable;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLine3: TppLine;
    ppLabel17: TppLabel;
    ppDBText13: TppDBText;
    ppVariable1: TppVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText11: TppDBText;
    ppLabel11: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    gbProv: TGroupBox;
    Label6: TLabel;
    dblcClAux: TwwDBLookupCombo;
    lblProv: TLabel;
    dblcdProv: TwwDBLookupComboDlg;
    chkTodos: TCheckBox;
    gbCia: TGroupBox;
    lblCia: TLabel;
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dbdtpFecVenc: TwwDBDateTimePicker;
    Timer2: TTimer;
    procedure SpeedButton3Click(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure ppVMesCalc(Sender: TObject; var Value: Variant);
    procedure chkTodosClick(Sender: TObject);
    procedure dblcClAuxExit(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    { Private declarations }
    function NombreMes(wwMes: integer): String;    
  public
    { Public declarations }
  end;

var
  FToolLetPend: TFToolLetPend;
  xAccesoBotones : Boolean;

implementation

{$R *.DFM}
uses CxPDM, CxP001;

procedure TFToolLetPend.SpeedButton3Click(Sender: TObject);
var
   xSQL,xLote,xTdiario,xDoc1,xDoc2,xTmonEuro,sFecha, xDocs, vFecha  : string;
   x10 : integer;
begin
   // 26/06/2002 Consulta de Letras Pendiente a pedidom de JCC
   //exclusiva para Inoresa
   //se ha utilizado codigo duro por premura del tiempo a pedido de JCC

   xSQL:='SELECT * FROM TGE110 WHERE DOC_FREG=''L''';
   DMCXP.cdsSQL.IndexFieldNames :='';
   DMCXP.cdsSQL.Filter:='';
   DMCXP.cdsSQL.filtered:= false;
   DMCXP.cdsSQL.Close;
   DMCXP.cdsSQL.DataRequest(xSQL);
   DMCXP.cdsSQL.Open;
   DMCXP.cdsSQL.First;
   xDocs:='( A.DOCID='+Quotedstr( DMCXP.cdsSQL.FieldByname('DOCID').AsString )+' ';
   DMCXP.cdsSQL.Next;
   while not DMCXP.cdsSQL.Eof do begin
      xDocs:=xDocs+ ' or A.DOCID='+Quotedstr( DMCXP.cdsSQL.FieldByname('DOCID').AsString )+' ';
      DMCXP.cdsSQL.Next;
   end;
   xDocs:=xDocs+ ' ) ';

   xDoc1 :='08';
   xDoc2 :='93';
   xLote :='08';
   xTmonEuro :='04';
   xTdiario := '12';

   sFecha:= Quotedstr(FormatDatetime(DMCXP.wFormatFecha,date));
   vfecha:= Quotedstr(FormatDatetime(DMCXP.wFormatFecha,dbdtpFecVenc.date));
   if length(dblcCia.text)= 0 then
      raise exception.Create('Seleccione Compañia');

   if length(edtCia.Text)=0 then
      raise exception.Create('Compañia Errada');

   if chkTodos.Checked= false then
   begin
      if length(Trim(dblcClAux.text))=0 then
         raise exception.Create('Ingrese Clase de Auxiliar');

      if length(Trim(dblcdProv.text))=0 then
         raise exception.Create('Ingrese Proveedor');
   end;

   //ANAX SE GREGO LA SENETENCIA PARA ORACLE
   if ( SRV_D = 'DB2NT') or (SRV_D = 'DB2400' ) then
   begin
      xSQL:='SELECT  CIAID,RTRIM(LTRIM(C.FECANO))||RTRIM(LTRIM(C.FECMES)) CPANOMES, C.FECMES CPMM, '
           +  'C.FECSS CPSS, C.FECANO CPAAAA, CAST(CPNOREG AS INTEGER) CPNOREG, '
           +  'RTRIM(B.DOCABR)||'' ''||CPNODOC CPNODOC, CPFVCMTO, PROVDES, '
           +  '''                '' OBSERVACION, TMONID, CPCANJE, PROV, '
           +  'CASE WHEN TMONID='+Quotedstr(DMCXP.wTMonLoc)+' THEN COALESCE(CPMTOORI,0) ELSE 0 END MTOLOC, '
           +  'CASE WHEN TMONID='+Quotedstr(DMCXP.wTMonExt)+' THEN COALESCE(CPMTOORI,0) ELSE 0 END MTOEXT, '
           +  'CASE WHEN TMONID='+Quotedstr(xTMonEuro)+' THEN COALESCE(CPMTOORI,0) ELSE 0  END MTOEURO, '
           +  'COALESCE(CPMTOLOC,0) SOLOSOLES '
           +'FROM CXP301 A '
           +  'LEFT OUTER JOIN TGE110 B ON (A.DOCID=B.DOCID AND DOCMOD=''CXP'') '
           +  'LEFT JOIN TGE114 C ON (C.FECHA=A.CPFVCMTO) '
           +'WHERE ( CIAID='+Quotedstr(dblcCia.text)+' '
           +  'AND '+xDocs+' AND CPESTADO=''P''';

      if (DMCXP.wSRV_RUTA='\\INCORESA') then
         xSQL:=xSQL+'AND COALESCE(DCPLOTE,'''')<>'+Quotedstr(xLote)+' ';

      if dbdtpFecVenc.Date<>0 then
         xSQL:=xSQL+' AND CPFVCMTO<='+vFecha+' ';

      xSQL:=xSQL+' AND (CPSALLOC>0 OR CPSALEXT>0) ';

      if chkTodos.Checked= false then
         xSQL:= xSQL+' and A.PROV='+Quotedstr(dblcdProv.text);

      xSQL:=xSQL+' ) ';

      if (DMCXP.wSRV_RUTA='\\INCORESA') then begin
         xSQL:=xSQL
           + 'OR ( CIAID='+Quotedstr(dblcCia.text)+' AND CPESTADO=''P'' '
           +'AND ( CPSALLOC>0 OR CPSALEXT>0 )';

         xSQL:=xSQL+'AND COALESCE(DCPLOTE,'''')<>'+Quotedstr(xLote)+' ';

         if dbdtpFecVenc.Date<>0 then
            xSQL:=xSQL+' AND CPFVCMTO<='+vFecha+' ';

         if chkTodos.Checked= false then
            xSQL:= xSQL+' and A.PROV='+Quotedstr(dblcdProv.text);

         xSQL:=xSQL+' ) ';
      end;

     xSQL:=xSQL+' ORDER BY A.CPFVCMTO,A.CPNOREG';

   end;
   if SRV_D = 'ORACLE' then
   begin
      xSQL:='SELECT CIAID, RTRIM(LTRIM(C.FECANO))||RTRIM(LTRIM(C.FECMES)) CPANOMES, '
           +  'C.FECMES CPMM, C.FECSS CPSS, C.FECANO CPAAAA, '
           +  'CAST(CPNOREG AS INTEGER) CPNOREG ,RTRIM(B.DOCABR)||'' ''||CPNODOC CPNODOC, '
           +  'CPFVCMTO,PROVDES, ''                '' OBSERVACION, TMONID, CPCANJE, PROV, '
           +  'DECODE(trim(TMONID),'+Quotedstr(DMCXP.wTMonLoc)+',CPMTOORI,0)  MTOLOC, '
           +  'DECODE(trim(TMONID),'+Quotedstr(DMCXP.wTMonExt)+',CPMTOORI,0)  MTOEXT, '
           +  'DECODE(trim(TMONID),'+Quotedstr(xTMonEuro)+',CPMTOORI,0)  MTOEURO,'
           +  'CPMTOLOC SOLOSOLES '
           +'FROM CXP301 A, TGE110 B, TGE114 C '
           +'WHERE ( CIAID='+Quotedstr(dblcCia.text)+' '
           +  'AND '+xDocs+' AND CPESTADO=''P'' AND (CPSALLOC>0 OR CPSALEXT>0) '
           +  'AND (A.DOCID=B.DOCID AND DOCMOD=''CXP'') '
           +  'AND (C.FECHA=A.CPFVCMTO)';

      if (DMCXP.wSRV_RUTA='\\INCORESA') then
         xSQL:=xSQL+'AND COALESCE(DCPLOTE,'''')<>'+Quotedstr(xLote)+' ';

      if dbdtpFecVenc.Date<>0 then
         xSQL:=xSQL+' AND CPFVCMTO<='+vFecha+' ';

      if chkTodos.Checked= false then
         xSQL:=xSQL+' and A.PROV='+Quotedstr(dblcdProv.text);

      xSQL:=xSQL+' ) ';

      if (DMCXP.wSRV_RUTA='\\INCORESA') then begin
         xSQL:=xSQL
           + 'OR ( CIAID='+Quotedstr(dblcCia.text)+' '
           +'AND CPESTADO=''P'' '
           +'AND ( CPSALLOC>0 OR CPSALEXT>0 ) '
           +'AND (A.DOCID=B.DOCID AND DOCMOD=''CXP'') '
           +'AND C.FECHA=A.CPFVCMTO ';

         if dbdtpFecVenc.Date<>0 then
            xSQL:=xSQL+' AND CPFVCMTO<='+vFecha+' ';

         xSQL:=xSQL+'AND COALESCE(DCPLOTE,'''')<>'+Quotedstr(xLote)+' ';

         if chkTodos.Checked= false then
            xSQL:= xSQL+' and A.PROV='+Quotedstr(dblcdProv.text);

         xSQL:= xSQL+' )';
      end;
   end;

   FPrincipal.Mantc.UsuarioSQL.Clear;
   FPrincipal.Mantc.UsuarioSQL.Add(xSQL) ;
   FPrincipal.Mantc.NewQuery;

   if DMCXP.cdsReporte.RecordCount= 0 then
      raise exception.Create('No existen Datos');

   if ( SRV_D = 'DB2NT') or (SRV_D = 'DB2400' ) then
   begin
      xSQL:='SELECT CIAID, PROV, CCPCANJE, A.DOCID, RTRIM(B.DOCABR)||'' ''||CPNODOC CPNODOC '
           +'FROM CXP304 A '
           +  'LEFT JOIN TGE110 B ON (A.DOCID=B.DOCID AND DOCMOD=''CXP'') '
           +'WHERE CIAID='+Quotedstr(dblcCia.text)+' AND CCPFCJE<='+sFecha+' '
           +  'AND a.TDIARID<>'+Quotedstr(xTDiario)+' '
           +'ORDER BY CIAID, CCPCANJE, A.DOCID';
   end;
   if SRV_D = 'ORACLE' then
   begin
      xSQL:='SELECT CIAID, PROV, CCPCANJE, A.DOCID, RTRIM(B.DOCABR)||'' ''||CPNODOC CPNODOC '
           +'FROM CXP304 A, TGE110 B '
           +'WHERE CIAID='+Quotedstr(dblcCia.text)+' AND CCPFCJE<='+sFecha+' '
           +  'and a.TDIARID<>'+Quotedstr(xTDiario)+' '
           +  'and ( A.DOCID=B.DOCID(+) AND DOCMOD(+)=''CXP'') '
           +'ORDER BY CIAID, CCPCANJE, A.DOCID';
   end;

   DMCXP.cdsSQL.Close;
   DMCXP.cdsSQL.DataRequest(xSQL);
   DMCXP.cdsSQL.Open;
   DMCXP.cdsSQL.IndexFieldNames :='CIAID;CCPCANJE';
   DMCXP.cdsReporte.DisableControls;
   DMCXP.cdsReporte.First;
   while not DMCXP.cdsReporte.Eof do
   begin
      DMCXP.cdsSQL.SetKey;
      DMCXP.cdsSQL.FieldByName('CIAID').AsString    := DMCXP.cdsReporte.FieldByName('CIAID').AsString;
      DMCXP.cdsSQL.FieldByName('CCPCANJE').AsString := DMCXP.cdsReporte.FieldByName('CPCANJE').AsString;
      if DMCXP.cdsSQL.GotoKey then
      begin
         DMCXP.cdsReporte.Edit;
         DMCXP.cdsReporte.FieldByName('OBSERVACION').AsString := DMCXP.cdsSQL.fieldbyname('CPNODOC').AsString;
         DMCXP.cdsReporte.Post;
      end;
      DMCXP.cdsReporte.Next;
   end;

   DMCXP.cdsReporte.EnableControls;
   ppDBLetras.DataSource := DMCXP.dsReporte;
   ppRLetras.TEMPLATE.FileName:=ExtractFilePath( application.ExeName )+wRutaRpt+'\LetPend.rtm';
   ppRLetras.template.LoadFromFile ;
   pplblCia.Caption  := edtCia.Text;
   pplblUser.Caption := DMCXP.wUsuario;

   ppRLetras.Print;

   ppRLetras.Stop;
   x10:=Self.ComponentCount-1;
   while x10>=0 do
   begin
      if Self.Components[ x10 ].ClassName='TppGroup' then
      begin
      	 Self.Components[ x10 ].Free;
      end;
      x10:=x10-1;
   end;

   //ANAX LIMPIA EL CLIENTE CDSSQL
   DMCXP.cdsSQL.filter := '';
   DMCXP.cdsSQL.Filtered := False;
   DMCXP.cdsSQL.IndexFieldNames := '';
   DMCXP.cdsSQL.close ;
   //FIN ANAX LIMPIA EL CLIENTE CDSSQL
end;

procedure TFToolLetPend.dblcCiaExit(Sender: TObject);
begin
	 edtCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);
end;

function TFToolLetPend.NombreMes(wwMes: integer): String;
begin
   Case wwMes of
      1:  result:='Enero';
      2:  result:='Febrero';
      3:  result:='Marzo';
      4:  result:='Abril';
      5: result:='Mayo';
      6: result:='Junio';
      7: result:='Julio';
      8: result:='Agosto';
      9: result:='Setiembre';
     10: result:='Octubre';
     11: result:='Noviembre';
     12: result:='Diciembre';
   end;

end;


procedure TFToolLetPend.ppVMesCalc(Sender: TObject; var Value: Variant);
var
   iMes : integer;
begin
   iMes:= strtoint(DMCXP.cdsReporte.FieldByName('CPMM').AsString);
   value := NombreMes(iMes);
end;

procedure TFToolLetPend.chkTodosClick(Sender: TObject);
begin
  if chktodos.Checked then
  begin
     dblcClAux.Enabled:= false;
     dblcClAux.Text := '';
     dblcdProv.Enabled:= false;
     dblcdProv.Text:='';

  end
  else
  begin
     dblcClAux.Enabled:= True;
     dblcdProv.Enabled:= True;
  end;
end;

procedure TFToolLetPend.dblcClAuxExit(Sender: TObject);
begin
  Filtracds( DMCXP.cdsProv, 'SELECT CLAUXID, PROV, PROVRUC, PROVDES, PROVABR, PROVNOMCOM,PROVRETIGV,PAISID,PROVDIR,PROVCZIP,PROVTELF,PROVFAX,PROVEMAI FROM TGE201 WHERE CLAUXID='''+dblcClAux.Text+'''' );
end;

procedure TFToolLetPend.Timer2Timer(Sender: TObject);
begin
   FVariables.w_NombreForma := 'FToolLetPend';
   if (DMCXP.wAdmin='G') or (DMCXP.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMCXP.AccesosUsuariosR( DMCXP.wModulo,DMCXP.wUsuario,'2',FToolLetPend);
      xAccesoBotones := True;
   end;

end;

procedure TFToolLetPend.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.

