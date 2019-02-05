unit CXP404;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppVar, ppPrnabl, ppClass, ppCtrls, ppProd, ppReport,
  ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, StdCtrls, Buttons, ExtCtrls,
  ComCtrls, wwdblook, ppViewr, Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid, Wwkeycb,
  wwdbdatetimepicker, ppTypes, oaVariables, db;

type
  TCFRepMov = class(TForm)
    gbRango: TGroupBox;
    Bevel4: TBevel;
    Bevel5: TBevel;
    cboEstado: TComboBox;
    cboOrdenar: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    lvTipoProv: TListView;
    rbProvTodos: TRadioButton;
    rbProvEscoger: TRadioButton;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Label1: TLabel;
    dbgProv: TwwDBGrid;
    pnlOrden: TPanel;
    lblBusca: TLabel;
    Bevel2: TBevel;
    isBusca: TwwIncrementalSearch;
    btnSalir: TBitBtn;
    GroupBox1: TGroupBox;
    dtpDesde: TwwDBDateTimePicker;
    dtpHasta: TwwDBDateTimePicker;
    Label2: TLabel;
    Label5: TLabel;
    rbFETodos: TRadioButton;
    rbFEEscoger: TRadioButton;
    ppRepMov: TppReport;
    ppdbRepMov: TppDBPipeline;
    Z2bbtnImprimir: TBitBtn;
    Z2bbtnSalir: TBitBtn;
    ppHeaderBand1: TppHeaderBand;
    pplblCia: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    pplblLin01: TppLabel;
    ppLabel21: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLine4: TppLine;
    pplblLin02: TppLine;
    ppLabel22: TppLabel;
    ppLabel36: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppVariable1: TppVariable;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppFooterBand1: TppFooterBand;
    lblLin03: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc5: TppDBCalc;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLine6: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText24: TppDBText;
    ppDBText20: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel38: TppLabel;
    ppDBText33: TppDBText;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText25: TppDBText;
    ppDBText13: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel37: TppLabel;
    ppDBText28: TppDBText;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    bbtnResumen: TBitBtn;
    procedure bbtnImprimirClick(Sender: TObject);
    procedure bbtnSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbProvTodosClick(Sender: TObject);
    procedure rbProvEscogerClick(Sender: TObject);
    procedure cboOrdenarExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppReportePreviewFormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure dbgProvTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure dbgProvEnter(Sender: TObject);
    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);
    procedure Z2bbtnSalirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnResumenClick(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    { Private declarations }
    xClAux : String;
    procedure CargaDataSource;
  public
    { Public declarations }
  end;

  procedure OPMovimientosPorProveedor; stdcall;

exports
  OPMovimientosPorProveedor;

var
  CFRepMov: TCFRepMov;

implementation

{$R *.DFM}

uses CXPDM;

procedure OPMovimientosPorProveedor;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   if Assigned( CFRepMov ) then Exit;
   try
     CFRepMov := TCFRepMov.Create( Application );
     CFRepMov.ActiveMDIChild;
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   finally
   end;
end;

procedure TCFRepMov.bbtnImprimirClick(Sender: TObject);
var
  xWhere, xSQL, xCondicion, xAdic   : string    ;
  //i       : Integer   ;
  Bandera : Boolean   ;
  x10 : integer;
begin
   Screen.Cursor:=crHourGlass;
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      xSQL:='SELECT CXP301.TDIARID, CXP301.CPNOREG, TGE110.DOCABR, '
         +  'CXP301.CPSERIE, CXP301.CPNODOC, CXP301.PROV, CXP301.TMONID, CXP301.DOCID, CPFEMIS, CPFVCMTO, '
         +  'CNT201.CLAUXID,CNT201.AUXNOMB,TGE103.TMONABR, XX.FPAGO, '
         +  'CASE WHEN CPESTADO<>''A'' AND CPESTADO<>''E'' THEN CPMTOORI END CPMTOORI, '
         +  'CASE WHEN CPESTADO<>''A'' AND CPESTADO<>''E'' THEN CPSALORI END CPSALORI, '
         +  'CASE WHEN CXP301.CPMTOLOC=CXP301.CPMTOORI AND CPESTADO<>''A'' AND CPESTADO<>''E'' THEN CPMTOLOC END CPMTOLOC, '
         +  'CASE WHEN CXP301.CPMTOEXT=CXP301.CPMTOORI AND CPESTADO<>''A'' AND CPESTADO<>''E'' THEN CPMTOEXT END CPMTOEXT, '
         +  'CASE WHEN CXP301.CPSALLOC=CXP301.CPSALORI AND CPESTADO<>''A'' AND CPESTADO<>''E'' THEN CPSALLOC END CPSALLOC, '
         +  'CASE WHEN CXP301.CPSALEXT=CXP301.CPSALORI AND CPESTADO<>''A'' AND CPESTADO<>''E'' THEN CPSALEXT END CPSALEXT, CXP301.CPESTADO '
         +'FROM CXP301 '
         +  'LEFT JOIN TGE110 ON (CXP301.DOCID=TGE110.DOCID AND TGE110.DOCMOD=''CXP'' ) '
         //+  'LEFT JOIN TGE110 ON (CXP301.DOCID=TGE110.DOCID AND TGE110.DOCMOD=''CXP'' AND DOC_FREG=''P'') '
         +  'LEFT JOIN TGE103 ON (CXP301.TMONID=TGE103.TMONID) '
         +  'LEFT JOIN CNT201 ON (CNT201.CLAUXID=CXP301.CLAUXID AND CNT201.AUXID=CXP301.PROV  ) '
         +  'LEFT JOIN (SELECT CIAID,PROV,DOCID,CPNODOC ,MAX(CXP305.CCPFCJE ) FPAGO '
         +             'FROM CXP305 GROUP BY CIAID,PROV,DOCID,CPNODOC ) AS XX '
         +        'ON  (CXP301.CIAID=XX.CIAID AND CXP301.PROV=XX.PROV AND CXP301.DOCID=XX.DOCID AND '
         +             'CXP301.CPNODOC=XX.CPNODOC) ';
      xWhere:='WHERE CXP301.CIAID ='''+dblcCia.Text+''' ' ;
   end
   else
	if SRV_D = 'ORACLE' then
   begin
      xSQL:=     'SELECT CXP301.TDIARID, CXP301.CPNOREG, TGE110.DOCABR, ';
      xSQL:=xSQL+'CXP301.CPSERIE,CXP301.CPNODOC,CXP301.PROV,CXP301.TMONID,CXP301.DOCID,CPFEMIS,CPFVCMTO, ';
      xSQL:=xSQL+'CNT201.CLAUXID,CNT201.AUXNOMB,TGE103.TMONABR, ';
      xSQL:=xSQL+'XX.FPAGO, CXP301.CPESTADO, ';
      xSQL:=xSQL+'DECODE (CPESTADO, ''A'', 0, DECODE(CPESTADO, ''E'', 0,CPMTOORI)) CPMTOORI, ';
      xSQL:=xSQL+'DECODE (CPESTADO, ''A'', 0, DECODE(CPESTADO, ''E'', 0,CPSALORI)) CPSALORI, ';
      xSQL:=xSQL+'DECODE(CXP301.CPMTOLOC, CXP301.CPMTOORI, DECODE(CPESTADO, ''A'', 0, DECODE(CPESTADO, ''E'', 0, CPMTOLOC))) CPMTOLOC, ';
      xSQL:=xSQL+'DECODE(CXP301.CPMTOEXT, CXP301.CPMTOORI, DECODE(CPESTADO, ''A'', 0, DECODE(CPESTADO, ''E'', 0, CPMTOEXT))) CPMTOEXT, ';
      xSQL:=xSQL+'DECODE(CXP301.CPSALLOC, CXP301.CPSALORI, DECODE(CPESTADO, ''A'', 0, DECODE(CPESTADO, ''E'', 0, CPSALLOC))) CPSALLOC, ';
      xSQL:=xSQL+'DECODE(CXP301.CPSALEXT, CXP301.CPSALORI, DECODE(CPESTADO, ''A'', 0, DECODE(CPESTADO, ''E'', 0, CPSALEXT))) CPSALEXT ';
      xSQL:=xSQL+'FROM CXP301, TGE110, TGE103, CNT201, ';
      xSQL:=xSQL+  '(SELECT CIAID, PROV,DOCID, CPNODOC, MAX(CXP305.CCPFCJE) FPAGO ';
      xSQL:=xSQL+  'FROM CXP305 ';
      xSQL:=xSQL+  'GROUP BY CIAID, PROV, DOCID, CPNODOC) XX ';
      xSQL:=xSQL+'WHERE CXP301.CIAID ='''+dblcCia.Text+''' ' ;
      xSQL:=xSQL+'AND CXP301.DOCID = TGE110.DOCID(+) AND TGE110.DOCMOD = ''CXP'' AND DOC_FREG = ''P'' ';
      xSQL:=xSQL+'AND CXP301.TMONID(+) = TGE103.TMONID ';
      xSQL:=xSQL+'AND CXP301.PROV = CNT201.AUXID(+) AND  CXP301.CLAUXID = CNT201.CLAUXID(+) ';
      xSQL:=xSQL+'AND CXP301.CIAID = XX.CIAID(+) ';
      xSQL:=xSQL+'AND CXP301.PROV = XX.PROV(+) ';
      xSQL:=xSQL+'AND CXP301.DOCID = XX.DOCID(+) ';
      xSQL:=xSQL+'AND CXP301.CPNODOC = XX.CPNODOC(+) ';
	end;

   if rbProvEscoger.Checked then
   begin
  	   Bandera := False ;
   	xAdic   := ''    ;
   	xWhere := xWhere + 'AND CXP301.PROV IN (''' ;

      DMCXP.cdsProv.DisableControls;
      DMCXP.cdsProv.First;
      while not DMCXP.cdsProv.Eof do
      begin
         if DMCXP.cdsProv.FieldByName('ACTXOC').AsString = 'S' then
         begin
            Bandera := True;
            xAdic   := xAdic + DMCXP.cdsProv.FieldByName('PROV').AsString+''',''' ;
            DMCXP.cdsProv.Edit;
            DMCXP.cdsProv.FieldByName('ACTXOC').AsString:='N';
            DMCXP.cdsProv.Post;
         end;
         DMCXP.cdsProv.Next;
      end;
      DMCXP.cdsProv.EnableControls;
   	xAdic := copy(xAdic,1,length(xAdic)-2)+')' ;
   	xWhere := xWhere + xAdic ;
   	if not Bandera then
      begin
    		Screen.Cursor:=crDefault;
      	Raise Exception.create('Seleccione Proveedor');
      end;
   end
   else
   begin
   	xWhere := xWhere + 'AND CXP301.CLAUXID='''+xClAux+'''';
   end;

  if rbFEEscoger.Checked then
  begin
     if dtpDesde.Date<>0 then
     begin
        if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
        begin
           xWhere := xWhere + ' AND CPFEMIS>=Date('+quotedstr(formatdatetime(DMCXP.wFormatFecha,dtpDesde.Date))+')';
        end;
    	  if SRV_D = 'ORACLE' then
        begin
           xWhere := xWhere + ' AND TO_DATE(CPFEMIS)>=TO_Date('+quotedstr(formatdatetime(DMCXP.wFormatFecha,dtpDesde.Date))+')';
        end;
     end;
     if dtpHasta.Date<>0 then
     begin
        if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
        begin
           xWhere := xWhere + ' AND CPFEMIS<=Date('+quotedstr(formatdatetime(DMCXP.wFormatFecha,dtpHasta.Date))+')';
        end;
    	  if SRV_D = 'ORACLE' then
        begin
           xWhere := xWhere + ' AND TO_DATE(CPFEMIS)<=TO_Date('+quotedstr(formatdatetime(DMCXP.wFormatFecha,dtpHasta.Date))+')';
        end;
     end;
  end;

  {
  case cboEstado.ItemIndex of
   1 :
      begin
        xWhere := xWhere + ' AND CPESTADO = ''I''';
        xCondicion := 'Iniciales'
      end   ;
   2 :
      begin
        xWhere := xWhere + ' AND CPESTADO = ''A''';
        xCondicion := 'Anulados'
      end  ;
   3 :
      begin
        xWhere := xWhere + ' AND CPESTADO = ''P''' ;
        xCondicion := 'Aceptados'
      end  ;
   4 :
      begin
        xWhere := xWhere + ' AND CP_CONTA = ''S'''  ;
        xCondicion := 'Contabilizados'
      end ;
   5 :
      begin
        xWhere := xWhere + ' AND CPESTADO = ''E'''   ;
        xCondicion := 'Eliminados'
      end ;
  end;
  }

  xWhere := xWhere + ' AND CPESTADO in (''P'',''C'') ';
  xCondicion := 'Aceptados';

  xSQL := xSQL + xwhere;

  case cboOrdenar.ItemIndex of
   0 :
      begin
//        xSQL := xSQL + ' ORDER BY DOCABR, CPNODOC'
        xSQL := xSQL + ' ORDER BY CXP301.PROV, CXP301.DOCID,CXP301.CPNODOC '
      end   ;
   1 :
      begin
//        xSQL := xSQL + ' ORDER BY CLAUXID, AUXNOMB '
        xSQL := xSQL + ' ORDER BY CXP301.PROV, CXP301.DOCID '
      end  ;
   end;
   DMCXP.cdsCXP.Close ;
   DMCXP.cdsCXP.DataRequest(xSQL) ;
   DMCXP.cdsCXP.Open  ;

   ppdbRepMov.DataSource:=DMCXP.dsCxP;
   Screen.Cursor:=crDefault;
   if DMCXP.cdsCXP.RecordCount = 0 then
      Raise exception.create('No hay Datos Para el Rango Seleccionado') ;

   ppRepMov.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\MovProveedor2.rtm';
   ppRepMov.Template.LoadFromFile;

   pplblCia.Caption := edtCia.text;

   ppRepMov.Print;
   ppRepMov.Stop;
   x10:=self.componentCount-1;
   while x10>0 do
   begin
      if self.components[x10].classname='TppGroup' then
      begin
         self.components[x10].free;
         x10:=x10-1;
      end;
      x10:=x10-1;
   end;
end;

procedure TCFRepMov.bbtnSalirClick(Sender: TObject);
begin
 close;
end;

procedure TCFRepMov.FormShow(Sender: TObject);
var
  sSQL : String;
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
   
   DMCXP.cdsCia.Open;
   sSQL:= 'CLAUXLOG='+''''+'S'+'''';
   sSQL:= DMCXP.displaydescrip2('prvSQL','TGE102','CLAUXID',sSQL,'CLAUXID');
   xClAux:=sSQL;
	 DMCXP.cdsProv.close;
   DMCXP.cdsProv.DataRequest('SELECT PROV, PROVRUC, PROVDES, '' '' ACTXOC FROM TGE201 WHERE CLAUXID='''+sSQL+'''');
   DMCXP.cdsProv.open;

   cboEstado.ItemIndex := 0 ;
   cboOrdenar.ItemIndex := 0 ;
   dblcCia.setfocus;
end;

procedure TCFRepMov.rbProvTodosClick(Sender: TObject);
begin
  //lvTipoProv.Enabled := False ;
  dbgProv.Enabled := False ;
end;

procedure TCFRepMov.rbProvEscogerClick(Sender: TObject);
begin
  //lvTipoProv.Enabled := true ;
  dbgProv.Enabled := true ;
end;

procedure TCFRepMov.cboOrdenarExit(Sender: TObject);
begin
 gbRango.setfocus;
end;

procedure TCFRepMov.dblcCiaExit(Sender: TObject);
begin
  if  Z2bbtnSalir.Focused then exit;
   edtCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Código de Compañía');
      dblcCia.SetFocus;
   end;
   cboEstado.SetFocus;

end;

procedure TCFRepMov.FormCreate(Sender: TObject);
begin

  CargaDataSource;

end;

procedure TCFRepMov.CargaDataSource;
begin
   dblcCia.DataSource        :=nil;
   dblcCia.LookupTable       :=DMCXP.cdsCia;
   dbgProv.DataSource        :=DMCXP.dsProv;
   isBusca.DataSource        :=DMCXP.dsProv;
end;


procedure TCFRepMov.ppReportePreviewFormCreate(Sender: TObject);
begin
   ppRepMov.PreviewForm.WindowState:=WsMaximized;
   TppViewer(ppRepMov.PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
end;

procedure TCFRepMov.btnSalirClick(Sender: TObject);
begin
	pnlOrden.Visible := False;
end;

procedure TCFRepMov.dbgProvTitleButtonClick(Sender: TObject; AFieldName: String);
begin
	lblBusca.Caption:='XX';
	if AfieldName='PROV' then
	begin
		DMCXP.cdsPROV.IndexFieldNames:='PROV';
		lblBusca.Caption:='Busca por Código:';
		isBusca.SearchField:='PROV';
	end;
	if AfieldName='PROVDES' then
	begin
		DMCXP.cdsPROV.IndexFieldNames:='PROVDES';
		lblBusca.Caption:='Busca por Descripción:';
		isBusca.SearchField:='PROVDES';
	end;
	if AfieldName='PROVRUC' then
	begin
		DMCXP.cdsPROV.IndexFieldNames:='PROVRUC';
		lblBusca.Caption:='Busca por R.U.C. :';
		isBusca.SearchField:='PROVRUC';
	end;
	if lblBusca.Caption<>'XX' then
	begin
		pnlOrden.Visible := True;
		isBusca.Text:='';
		isBusca.SetFocus;
	end;
end;

procedure TCFRepMov.dbgProvEnter(Sender: TObject);
begin
	pnlOrden.Visible:=False;
end;

procedure TCFRepMov.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
  Action:=caFree;
end;

procedure TCFRepMov.ppVariable1Calc(Sender: TObject; var Value: Variant);
begin
  if DMCXP.cdscXp.FieldByName('CPESTADO').AsString = 'E'  then
  begin
     ppVariable1.Text      := ' E L I M I N A D O'   ;
     ppVariable1.Visible   := True         ;
     EXIT ;
  end ;
  if DMCXP.cdscXp.FieldByName('CPESTADO').AsString = 'A'  then
  begin
     ppVariable1.Text      := 'A  N  U  L  A  D  O'     ;
     ppVariable1.Visible   := True         ;
     eXIT ;
  end ;
  ppVariable1.Visible := false ;

end;

procedure TCFRepMov.Z2bbtnSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TCFRepMov.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;


procedure TCFRepMov.bbtnResumenClick(Sender: TObject);
var
  xWhere, xSQL, xCondicion, xAdic   : string    ;
  Bandera : Boolean   ;
  x10, xCorrel : integer;
  xMinimo : double;
begin

   if dtpDesde.Date=0 then
   begin
      ShowMessage('Ingrese Rengo de Fechas');
      Exit;
   end;
   if dtpHasta.Date=0 then
   begin
      ShowMessage('Ingrese Rengo de Fechas');
      Exit;
   end;

   Screen.Cursor:=crHourGlass;

{
var
	 xSQL,xSQL1,xSQL2,xSQL3,xNombre,xVar : string;
	 xCorrel : integer;
	 xMinimo : double;
begin
}
	xSQL:='Select 0 CORRELAT, TIPPERID, TGE201.PROVRUC, '
       +  'sum(case when DOCRESTA=''S'' '
       +           'then (case when A.TMONID='+QuotedStr(DMCXP.wTMonLoc)
       +                     ' then (( nvl(CPGRAVAD,0) + nvl(CPGRAVAD2,0) + nvl(CPNOGRAV,0))*-1) '
       +                     ' else (( nvl(CPGRAVAD,0) + nvl(CPGRAVAD2,0) + nvl(CPNOGRAV,0))*CPTCAMPR)*-1 end) '
       +           'else (case when A.TMONID='+quotedStr(DMCXP.wTMonLoc)
       +                     ' then nvl(CPGRAVAD,0) + nvl(CPGRAVAD2,0) + nvl(CPNOGRAV,0) '
       +                     ' else (( nvl(CPGRAVAD,0) + nvl(CPGRAVAD2,0) + nvl(CPNOGRAV,0))*CPTCAMPR) end ) end) IMPORTE, '
			 +  'CASE WHEN TIPPERID=''01'' THEN PROVAPEPAT  ELSE '''' END PROVAPEPAT, '
       +  'CASE WHEN TIPPERID=''01'' THEN PROVAPEMAT  ELSE '''' END PROVAPEMAT, '
       +  'CASE WHEN TIPPERID=''01'' THEN PROVNOMBRE  ELSE '''' END PROVNOMBRE, '
       +  'CASE WHEN TIPPERID=''01'' THEN PROVNOMBRE1 ELSE '''' END PROVNOMBRE1, '
       +  'TGE201.PROVDES, PROVDIR, PROVTELF '
			 +'From CXP301 A, TGE201, TGE110 '
       +'Where A.CIAID like ''%'' '  //in ('+wRUCCIA+') '
       + ' and TO_DATE(CPFEMIS)>=TO_Date('+quotedstr(formatdatetime(DMCXP.wFormatFecha,dtpDesde.Date))+')'
       + ' and TO_DATE(CPFEMIS)<=TO_Date('+quotedstr(formatdatetime(DMCXP.wFormatFecha,dtpHasta.Date))+')'
			 + ' and (CPESTADO=''P'' or CPESTADO=''C'')'
			 + ' and TGE201.PROV=A.PROV '
			 + ' and TGE110.DOCMOD=''CXP'' and TGE110.DOCID=A.DOCID '
			 +'group by TIPPERID, TGE201.PROVRUC, PROVAPEPAT, PROVAPEMAT, PROVNOMBRE, PROVNOMBRE1, TGE201.PROVDES, PROVDIR, PROVTELF';
	DMCXP.cdsQry3.filtered:=false;
	DMCXP.cdsQry3.indexfieldnames:='';
	DMCXP.cdsQry3.Close;
	DMCXP.cdsQry3.ProviderName:='dspTGE';
	DMCXP.cdsQry3.DataRequest(xSQL);
	DMCXP.cdsQry3.Open;

	xMinimo := 10000; //strtofloat(dbeUITs.Text)*strtofloat(dbeValorUIT.Text);
	DMCXP.cdsQry3.indexfieldnames:='PROVRUC';
	DMCXP.cdsQry3.First;
  DMCXP.cdsQry3.DisableControls;
	xCorrel := 1;
	while not DMCXP.cdsQry3.EOF do
	begin
		if DMCXP.cdsQry3.fieldbyname('IMPORTE').AsFloat<xMinimo then
			DMCXP.cdsQry3.Delete
		else
		begin
         if DMCXP.cdsQry3.fieldbyname('CORRELAT').AsInteger=0 then
         begin
            DMCXP.cdsQry3.Edit;
            DMCXP.cdsQry3.fieldbyname('CORRELAT').AsInteger:=xCorrel;
            DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString:=
                  stringreplace(DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString,' ','',[rfreplaceall]);
            DMCXP.cdsQry3.fieldbyname('PROVAPEPAT').AsString:=Uppercase(DMCXP.cdsQry3.fieldbyname('PROVAPEPAT').AsString);
            DMCXP.cdsQry3.fieldbyname('PROVAPEMAT').AsString:=Uppercase(DMCXP.cdsQry3.fieldbyname('PROVAPEMAT').AsString);
            DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString:=Uppercase(DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString);
            DMCXP.cdsQry3.fieldbyname('PROVNOMBRE1').AsString:=Uppercase(DMCXP.cdsQry3.fieldbyname('PROVNOMBRE1').AsString);
            DMCXP.cdsQry3.Post;
            xCorrel := xCorrel+1;
         end;
         DMCXP.cdsQry3.Next;
		end;
	end;
   DMCXP.cdsQry3.EnableControls;
   {
   xSQL:=     'SELECT CXP301.TDIARID, CXP301.CPNOREG, TGE110.DOCABR, ';
   xSQL:=xSQL+'CXP301.CPSERIE, CXP301.CPNODOC, CXP301.PROV, CXP301.TMONID, CXP301.DOCID, CPFEMIS, ';
   xSQL:=xSQL+'TGE201.CLAUXID, TGE201.PROVDES, TGE103.TMONABR, PROVDIR, PROVTELF, ';
   xSQL:=xSQL+'CPMTOORI, CPSALORI, CPMTOLOC, CPMTOEXT, CPSALLOC, CPSALEXT ';
   xSQL:=xSQL+'FROM CXP301, TGE110, TGE103, TGE201, ';
   xSQL:=xSQL+'WHERE CXP301.CIAID ='''+dblcCia.Text+''' ' ;
   xSQL:=xSQL+  'AND CXP301.DOCID = TGE110.DOCID(+) AND TGE110.DOCMOD = ''CXP'' AND DOC_FREG = ''P'' ';
   xSQL:=xSQL+  'AND CXP301.TMONID(+) = TGE103.TMONID ';
   xSQL:=xSQL+  'AND CXP301.PROV = TGE201.PROV(+) AND  CXP301.CLAUXID = TGE201.CLAUXID(+) ';

   xWhere := xWhere + 'AND CXP301.CLAUXID='''+xClAux+'''';
   xWhere := xWhere + ' AND TO_DATE(CPFCMPRB)>=TO_Date('+quotedstr(formatdatetime(DMCXP.wFormatFecha,dtpDesde.Date))+')';
   xWhere := xWhere + ' AND TO_DATE(CPFCMPRB)<=TO_Date('+quotedstr(formatdatetime(DMCXP.wFormatFecha,dtpHasta.Date))+')';
   xWhere := xWhere + ' AND CPESTADO in (''P'',''C'') ';

   xSQL := xSQL + xwhere;
   xSQL := xSQL + ' ORDER BY CXP301.PROV ';

   DMCXP.cdsCXP.Close ;
   DMCXP.cdsCXP.DataRequest(xSQL) ;
   DMCXP.cdsCXP.Open  ;
   }
   ppdbRepMov.DataSource:=DMCXP.dsQry3;
   Screen.Cursor:=crDefault;
   if DMCXP.cdsCXP.RecordCount = 0 then
      Raise exception.create('No hay Datos Para el Rango Seleccionado');

   ppRepMov.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\ReporteDAOT-Log.rtm';
   ppRepMov.Template.LoadFromFile;
// pplblCia.Caption := edtCia.text;

   ppRepMov.Print;
   ppRepMov.Stop;
   x10:=self.componentCount-1;
   while x10>0 do
   begin
      if self.components[x10].classname='TppGroup' then
      begin
         self.components[x10].free;
         x10:=x10-1;
      end;
      x10:=x10-1;
   end;
end;

procedure TCFRepMov.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.
