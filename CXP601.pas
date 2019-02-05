unit CxP601;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdbdlg, wwdbdatetimepicker, StdCtrls, ExtCtrls, wwdblook, Buttons, Mask,
  wwdbedit, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB,
  ppDBPipe, ppBands, ppCtrls, ppVar, ppPrnabl, Spin, Db, Wwdatsrc,
  DBClient, wwclient, ppViewr, pptypes, oaVariables;

type
  TFCCuadreMovs = class(TForm)
    pnlCuadreMovs: TPanel;
    lblCia: TLabel;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    rgEstado: TRadioGroup;
    rgListado: TRadioGroup;
    ppdbMovCntD: TppDBPipeline;
    pprCuadreMovsR: TppReport;
    pprCuadreMovsD: TppReport;
    ppdbMovCntR: TppDBPipeline;
    GroupBox1: TGroupBox;
    ckTDiario: TCheckBox;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    dbeLote: TwwDBEdit;
    ckLote: TCheckBox;
    gbPer: TGroupBox;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    Label2: TLabel;
    dbdtpFReg1: TwwDBDateTimePicker;
    dbdtpFReg2: TwwDBDateTimePicker;
    cdsTmp: TwwClientDataSet;
    dsTmp: TwwDataSource;
    ppHeaderBand2: TppHeaderBand;
    ppLabel8: TppLabel;
    pplblDelD: TppLabel;
    pplblFecIniD: TppLabel;
    pplblAlD: TppLabel;
    pplblFecFinD: TppLabel;
    ppLabel20: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel21: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppLabel22: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    pplblCiaD: TppLabel;
    ppLabel9: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText9: TppDBText;
    ppDBText25: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel34: TppLabel;
    TDIARID_D: TppDBText;
    ppDBText7: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppLabel52: TppLabel;
    ppDBText33: TppDBText;
    ppDBText1: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel38: TppLabel;
    ppLabel14: TppLabel;
    ppLabel25: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel23: TppLabel;
    ppLabel10: TppLabel;
    ppLabel41: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel37: TppLabel;
    ppLine6: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel26: TppLabel;
    ppLabel53: TppLabel;
    ppDBText35: TppDBText;
    ppDBText16: TppDBText;
    ppLabel24: TppLabel;
    ppDBText36: TppDBText;
    ppLine3: TppLine;
    ppLabel55: TppLabel;
    ppLabel39: TppLabel;
    ppdbperiodo: TppDBText;
    ppLabel35: TppLabel;
    ppDBText10: TppDBText;
    ppLabel33: TppLabel;
    ppDBText8: TppDBText;
    ppLabel45: TppLabel;
    ppDBText28: TppDBText;
    ppLabel12: TppLabel;
    ppDBText11: TppDBText;
    ppLabel36: TppLabel;
    ppDBText12: TppDBText;
    lblmoneda: TppLabel;
    ppLabel54: TppLabel;
    lblestado: TppLabel;
    lblperiodo: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    pplblDel: TppLabel;
    pplblFecini: TppLabel;
    pplblAl: TppLabel;
    pplblFecfin: TppLabel;
    ppLine1: TppLine;
    ppLabel18: TppLabel;
    ppLine2: TppLine;
    ppLabel6: TppLabel;
    ppLabel13: TppLabel;
    ppLabel19: TppLabel;
    ppLabel4: TppLabel;
    ppLabel3: TppLabel;
    ppLabel15: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
    ppLabel7: TppLabel;
    ppLabel2: TppLabel;
    ppLabel40: TppLabel;
    pplblCiaR: TppLabel;
    ppLabel42: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText24: TppDBText;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
    ppVariable1: TppVariable;
    ppDBText4: TppDBText;
    ppDBText29: TppDBText;
    ppDBText5: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel5: TppLabel;
    TDIARID: TppDBText;
    ppDBText34: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel46: TppLabel;
    ppLine5: TppLine;
    ppDBText32: TppDBText;
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbeLoteExit(Sender: TObject);
    procedure ckTDiarioClick(Sender: TObject);
    procedure ckLoteClick(Sender: TObject);
    procedure gbPerExit(Sender: TObject);
    procedure dbdtpFReg1Exit(Sender: TObject);
    procedure dbdtpFReg2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pprCuadreMovsDPreviewFormCreate(Sender: TObject);
    procedure pprCuadreMovsRPreviewFormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    { Private declarations }
    procedure CargaDataSource;
  public
    { Public declarations }
  end;

  procedure OPComprobantesContabilizados; stdcall;

exports
  OPComprobantesContabilizados;


var
  vreal, TD, TH: Single;
  FCCuadreMovs: TFCCuadreMovs;
  vstr, xFiltro, xWhere: string;

implementation

uses CXPDM;

{$R *.DFM}


procedure OPComprobantesContabilizados;
var
   xSQL : String;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   if Assigned( FCCuadreMovs ) then Exit;
   try
   	 Screen.Cursor:=crHourGlass;
     FCCuadreMovs := TFCCuadreMovs.Create( Application );
     FCCuadreMovs.ActiveMDIChild;
     Screen.Cursor:=crDefault;
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   finally
   end;
end;

procedure TFCCuadreMovs.dblcCiaExit(Sender: TObject);
begin
   TD:=0;
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DMCXP.cdsCia.FieldByName('CiaDes').Text;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   end;
end;

procedure TFCCuadreMovs.dblcTDiarioExit(Sender: TObject);
begin
   edtTDiario.Text:='';
   if dblcTDiario.Text<>'' then edtTDiario.Text:=DMCXP.cdsTDiario.FieldByName('TDIARABR').AsString;
end;

procedure TFCCuadreMovs.bbtnOkClick(Sender: TObject);
Var
	estado,estado1,xSQL,mes,ano,mesdes : string;
  x10:integer;
begin
	if edtCia.Text=''
  then
  begin
  	//ShowMessage('Compañia no válida');
    raise exception.Create('Compañia no válida');
  end ;

  if (dbdtpFReg1.Date=0) or (dbdtpFReg2.Date=0)
  then
  begin
  	//ShowMessage('Fecha no válida');
  	raise exception.Create('Fecha no válida');
  end ;

  if (ckTDiario.Checked) and (edtTDiario.Text='')
  then
  begin
  	//ShowMessage('Seleccione un Tipo de Diario');
    raise exception.Create('Seleccione un Tipo de Diario');
  end ;

  if (ckLote.Checked) and (dbeLote.Text='')
  then
  begin
  	//showmessage('Seleccione Lote');
    raise exception.Create('Seleccione Lote');
  end ;
  Screen.Cursor:=crHourGlass;
  xFiltro:='CIAID='+''''+dblcCia.Text+''''
                   +' and CNTFCOMP>='+DMCXP.wRepFuncDate+''''+formatdatetime(DMCXP.wFormatFecha,dbdtpFReg1.DateTime)+''''+')'
                   +' and CNTFCOMP<='+DMCXP.wRepFuncDate+''''+formatdatetime(DMCXP.wFormatFecha,dbdtpFReg2.DateTime)+''''+')';

	if dblcTDiario.Text <> ''	then
  	xFiltro:=xFiltro+' and TDIARID='+''''+dblcTDiario.Text+'''';

  if dbeLote.Text <> ''
  then xFiltro:=xFiltro+' and CNTLOTE='+''''+dbeLote.Text+'''';

  case rgEstado.ItemIndex of
   0 : begin // Activos
          xFiltro:=xFiltro+' and CNTESTADO='+''''+'I'+'''';
       end;
   1 : begin  // Aceptado
          xFiltro:=xFiltro+' and CNTESTADO='+''''+'P'+''''+' and CNTCUADRE<>'+''''+'S'+'''';
       end;
   2 : begin  // Contabilizado
          xFiltro:=xFiltro+' and CNTCUADRE='+''''+'S'+''' ';
       end;
  end;

  case rgListado.ItemIndex of
   0: begin // Resumido
   			pplblCiaR.Text:=edtCia.Text;
        xSQL:='Select CIAID, TDIARID, CNTANOMM, CNTCOMPROB,'+
              ' TMONID, CNTFCOMP, CNTLOTE, CNTUSER, CNTTCAMBIO, CNTCUADRE, CNTESTADO,'+
              ' CNTDEBEMN, CNTHABEMN, CNTDEBEME, CNTHABEME, TDIARDES'+
							//WMC' from CNT300 Where '+xFiltro+
              ' from CNT300 Where '+xFiltro+ ' AND DOCMOD = ''CXP'' ' +
              ' Order by TDIARID, CNTANOMM, CNTCOMPROB, CNTFCOMP';

        cdsTmp.Close;
        cdsTmp.DataRequest(xSQL);
        cdsTmp.Open;
        cdsTmp.First;
        ppdbMovCntR.DataSource := dsTmp ;

        pprCuadreMovsR.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\CXPCompontR.rtm';
        pprCuadreMovsR.Template.LoadFromFile;

        pplblFecIni.Caption:=datetostr(dbdtpFReg1.Date);
        pplblFecFin.Caption:=datetostr(dbdtpFReg2.Date);
        pplblCiaR.caption:=edtcia.text;
  			Screen.Cursor:=crDefault;
        pprCuadreMovsR.Print;
        pprCuadreMovsR.Stop;        
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
       	ppdbMovCntD.DataSource := nil ;
        cdsTmp.CancelUpdates;
        ppdbMovCntR.DataSource := nil ;
   		end;
   1: begin // Detallado
   			pplblCiaD.Text:=edtCia.Text;
        xSQL:='SELECT * FROM CNT301 WHERE '+xFiltro+ ' AND CNTMODDOC = ''CXP'' ' +
              'ORDER BY TDIARID, CNTANOMM, CNTCOMPROB, CNTFCOMP,CNTREG';
        cdsTmp.Close;
        cdsTmp.DataRequest(xSQL);
        cdsTmp.Open;
        ppdbMovCntD.DataSource := dsTmp ;

        pprCuadreMovsD.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\CXPCompontD.rtm';
        pprCuadreMovsD.template.LoadFromFile ;

        pplblCiaD.caption:=edtcia.text;
        lblmoneda.caption:=DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONDES','TMONID='''+ppDBText28.caption+'''','TMONDES');

        pplblFecIniD.Caption:=datetostr(dbdtpFReg1.Date);
        pplblFecFinD.Caption:=datetostr(dbdtpFReg2.Date);

        mes:=copy(cdsTmp.fieldbyname('CNTANOMM').asstring,5,2);
        ano:=copy(cdsTmp.fieldbyname('CNTANOMM').asstring,1,4);

        xWhere := 'MESIDR='''+mes+'''';
        mesdes := DMCXP.DisplayDescrip2('dspTGE','TGE181','MESDESL',XWHERE,'MESDESL');
        lblperiodo.caption:=mesdes+' '+ano;
        xWhere := 'TMONID='''+cdsTmp.fieldbyname('TMONID').asstring+'''';
        lblmoneda.text:= DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONDES',XWHERE,'TMONDES');
        xWhere := 'CIAID='''+cdsTmp.fieldbyname('CIAID').asstring+''' AND TDIARID='''+
                  cdsTmp.fieldbyname('TDIARID').asstring+''' AND CNTCOMPROB='''+
                  cdsTmp.fieldbyname('CNTCOMPROB').asstring+''' AND CNTANOMM='''+cdsTmp.fieldbyname('CNTANOMM').asstring+'''';
        Estado:= DMCXP.DisplayDescrip2('dspTGE','CNT300','CNTCUADRE,CNTESTADO',XWHERE,'CNTCUADRE');
        estado1:=DMCXP.cdsqry.fieldbyname('CNTESTADO').asstring;
        if estado='S' then
          lblestado.caption:='Contabilizado'
        else
        begin
        	if estado1='P' then
          	lblestado.caption:='Aceptado';
          if estado1='A' then
          	lblestado.caption:='Anulado';
          if estado1='I' then
          	lblestado.caption:='Inicial';
        end;
  			Screen.Cursor:=crDefault;
        pprCuadreMovsD.Print;
        pprCuadreMovsD.stop;
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
       	ppdbMovCntD.DataSource := nil ;
   		end;
  end;
end;

procedure TFCCuadreMovs.ppVariable1Calc(Sender: TObject;
  var Value: Variant);
begin
   With DMCXP do Begin
     ppVariable1.Font.Size:=8;
     ppVariable1.Font.Style:=ppVariable1.Font.Style-[fsBold];
     if cdsTmp.FieldByName('CNTCUADRE').Value='S' then
        ppVariable1.Text:=' CONTABILIZADO'
     else begin
      if cdsTmp.FieldByName('CNTESTADO').Value='I' then
         ppVariable1.Text:='   ACTIVO';
      if cdsTmp.FieldByName('CNTESTADO').Value='P' then
         ppVariable1.Text:=' ACEPTADO';
      if cdsTmp.FieldByName('CNTESTADO').Value='A' then begin
         ppVariable1.Font.Size:=10;
         ppVariable1.Font.Style:=ppVariable1.Font.Style+[fsBold];
         ppVariable1.Text:=' A N U L A D O ';
      end;
     end;
   End;
end;

procedure TFCCuadreMovs.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFCCuadreMovs.dbeLoteExit(Sender: TObject);
begin
   if dbeLote.Text<>'' then dbeLote.Text:=strzero( dbeLote.Text,4);
end;

procedure TFCCuadreMovs.ckTDiarioClick(Sender: TObject);
begin
   if not(ckTDiario.Checked) then begin
      dblcTDiario.Text:='';  edtTDiario.Text:='';
      dblcTDiario.Enabled:=False;
   end
   else begin
      dblcTDiario.Enabled:=True;
   end;
end;

procedure TFCCuadreMovs.ckLoteClick(Sender: TObject);
begin
   if not(ckLote.Checked) then begin
      dbeLote.Text:='';
      dbeLote.Enabled:=False;
   end
   else begin
      dbeLote.Enabled:=True;
   end;
end;

procedure TFCCuadreMovs.gbPerExit(Sender: TObject);
var
   xFecha1, xFecha2 : TDateTime;
begin
   xFecha1 := strtodate('01/'+strZero(speMM.Text,2)+'/'+speAno.Text);
   if strtofloat(speMM.Text)+1=13 then
   begin
      speAno.Text:=floattostr(strtofloat(speAno.Text)+1);
      xFecha2 := strtodate('01/01/'+speAno.Text);
   end
   else begin
      xFecha2:=strtodate('01/'+strZero(floattostr(strtofloat(speMM.Text)+1),2)+'/'+speAno.Text);
   end;
   xFecha2:=xFecha2-1;
   dbdtpFReg1.date:=xFecha1;
   dbdtpFReg2.date:=xFecha2;
end;

procedure TFCCuadreMovs.dbdtpFReg1Exit(Sender: TObject);
begin
   If dbdtpFReg1.date=0 then
   begin
      dbdtpFReg1.SetFocus;
      ShowMessage('Error : Falta Registrar Fecha');
      Raise Exception.Create('Error : Falta Registrar Fecha');
   end;
end;

procedure TFCCuadreMovs.dbdtpFReg2Exit(Sender: TObject);
begin
   If dbdtpFReg2.date=0 then
   begin
      dbdtpFReg2.SetFocus;
      ShowMessage(' Error : Falta Registrar Fecha ');
      Raise Exception.Create(' Error : Falta Registrar Fecha ');
   end;
   If dbdtpFReg2.date<dbdtpFReg1.date then
   begin
      dbdtpFReg2.SetFocus;
      ShowMessage(' Error : Fecha debe ser Mayor');
      Raise Exception.Create(' Error : Fecha debe ser Mayor');
   end;

end;


procedure TFCCuadreMovs.FormShow(Sender: TObject);
var
    xSQL : String;
    xAno, xMes, xDia : Word;
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );

   xSQL:=' Select * From TGE104';
   DMCXP.cdsTdiario.Close;
   DMCXP.cdsTdiario.DataRequest(xSQL);
   DMCXP.cdsTdiario.Open;
   
   DecodeDate(Date, xAno, xMes, xDia);
   speAno.Value:=xAno;
   speMM.Value:=xMes;
end;

procedure TFCCuadreMovs.FormCreate(Sender: TObject);
begin
   cdsTmp.RemoteServer := DMCXP.DCOM1 ;
   cdsTmp.ProviderName := 'dspUltTGE';
   
   CargaDataSource;

end;


procedure TFCCuadreMovs.CargaDataSource;
begin
   dblcCia.DataSource        :=nil;
   dblcCia.LookupTable       :=DMCXP.cdsCia;
   dblcTDiario.DataSource    :=nil;
   dblcTDiario.LookupTable   :=DMCXP.cdsTDiario;
end;


procedure TFCCuadreMovs.pprCuadreMovsDPreviewFormCreate(Sender: TObject);
begin
  pprCuadreMovsD.PreviewForm.ClientHeight := 500;
  pprCuadreMovsD.PreviewForm.ClientWidth := 650;			// ppViewr
  tppviewer(pprCuadreMovsD.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFCCuadreMovs.pprCuadreMovsRPreviewFormCreate(Sender: TObject);
begin
  pprCuadreMovsR.PreviewForm.ClientHeight := 500;
  pprCuadreMovsR.PreviewForm.ClientWidth := 650;			// ppViewr
  tppviewer(pprCuadreMovsR.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFCCuadreMovs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TFCCuadreMovs.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.


