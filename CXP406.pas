unit CxP406;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppCtrls, ppDB, ppPrnabl, ppClass, ppBands, ppProd, ppReport, ppComm,
  ppRelatv, ppCache, ppDBPipe, StdCtrls, ExtCtrls, wwdblook, Buttons, Mask,
  wwdbedit, ComCtrls, wwdbdatetimepicker, Wwdbdlg, ppVar, ppModule,
  daDatMod, ppviewr, Spin, pptypes, oaVariables, db;

type
  TFLetrasProvisio = class(TForm)
    ppdbLetras: TppDBPipeline;
    pprLetras: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    pnlRegComp: TPanel;
    lblLetras: TLabel;
    bbtnOk: TBitBtn;
    bbtnBorra: TBitBtn;
    ppLabel2: TppLabel;
    pplblDel: TppLabel;
    pplblAl: TppLabel;
    pplblFecini: TppLabel;
    pplblFecfin: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppLine2: TppLine;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel23: TppLabel;
    ppVarEstado: TppVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel22: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLine3: TppLine;
    pnlDatos1: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    edtTDoc: TEdit;
    dblcTDoc: TwwDBLookupCombo;
    Label1: TLabel;
    Label5: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    Label2: TLabel;
    pnlDatos2: TPanel;
    rgOrden: TRadioGroup;
    lblRango1: TLabel;
    dbeNoReg1: TwwDBEdit;
    dbdtpFReg1: TwwDBDateTimePicker;
    dblcdProv1: TwwDBLookupComboDlg;
    lblRango2: TLabel;
    dbeNoReg2: TwwDBEdit;
    dblcdProv2: TwwDBLookupComboDlg;
    dbdtpFReg2: TwwDBDateTimePicker;
    pprNLetras: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBText4: TppDBText;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLine4: TppLine;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLine5: TppLine;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppVariable1: TppVariable;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppVariable2: TppVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLabel51: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLine6: TppLine;
    ppLabel52: TppLabel;
    ppDBText6: TppDBText;
    ppLabel14: TppLabel;
    ppLabel3: TppLabel;
    pplblPeriodo: TppLabel;
    pplblDato: TppLabel;
    Label3: TLabel;
    dbeAno: TSpinEdit;
    dbeMes: TSpinEdit;
    pplblCia: TppLabel;
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure rgOrdenClick(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkClick(Sender: TObject);
    procedure dbdtpFReg1Exit(Sender: TObject);
    procedure dbdtpFReg2Exit(Sender: TObject);
    procedure ppVarPlazoCalc(Sender: TObject; var Value: Variant);
    procedure ppVarEstadoCalc(Sender: TObject; var Value: Variant);
    procedure pprLetrasPreviewFormCreate(Sender: TObject);
    procedure IniciaDatos;
    procedure dbeAnoExit(Sender: TObject);
    procedure bbtnBorraClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcdProv1Exit(Sender: TObject);
    procedure seAnoExit(Sender: TObject);
    procedure seMesExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure OPLetrasProvisionadas; stdcall;

exports
  OPLetrasProvisionadas;


var
   FLetrasProvisio: TFLetrasProvisio;
   Year, Month, Day: Word;
   wfechOk: boolean;
   anomm, wMes, xperMes : string;
   xFiltroP1, xFiltroP2 : string;

implementation

uses CxPDM;

{$R *.DFM}


procedure OPLetrasProvisionadas;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   if Assigned( FLetrasProvisio ) then Exit;
   try
      Screen.Cursor:=crHourGlass;
      DMCXP.FiltraTabla( DMCXP.cdsCia,  'TGE101', 'CIAID');
      FLetrasProvisio := TFLetrasProvisio.Create( Application );
      FLetrasProvisio.ActiveMDIChild;
      FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
      Screen.Cursor:=crDefault;
   finally
   end;
end;


procedure TFLetrasProvisio.IniciaDatos;
begin

   pnlDatos1.Enabled := True;
   pnlDatos2.Enabled := False;

   dblcCia.Text      := '';
   edtCia.Text       := '';
   dblcTDoc.Text     := '';
   edtTDoc.Text      := '';
   dblcTDiario.Text  := '';
   edtTDiario.Text   := '';
   dbeAno.Value      := Year;
   dbeMes.Value      := Month;
   rgOrden.ItemIndex := -1;
   dbeNoReg1.Text    := '';
   dbeNoReg2.Text    := '';
   dbdtpFReg1.Date   := 0;
   dbdtpFReg2.Date   := 0;
   dblcdProv1.Text   := '';
   dblcdProv2.Text   := '';

end;

procedure TFLetrasProvisio.dblcCiaExit(Sender: TObject);
begin
   if bbtnBorra.Focused then Exit;
   edtCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Código de Compañía');
      dblcCia.SetFocus;
   end;
end;

procedure TFLetrasProvisio.dblcTDocExit(Sender: TObject);
Var
   xx, xFiltro, xWhere: String;
begin
   if bbtnBorra.Focused then Exit;
   With DMCXP do Begin
    if dblcTDoc.Text='' then begin dblcTDoc.SetFocus; exit; end;
    cdsTDoc.Filter:='';
    xFiltro:='DOCID='''+dblcTDoc.Text+'''';
    xFiltro:=xFiltro+' and DOC_FREG='+quotedstr('L');
    cdsTDoc.Filter:=xFiltro;
    cdsTDoc.Filtered:=True;
    if cdsTDoc.RecordCount > 0 then begin
       edtTDoc.Text:=cdsTDoc.fieldbyname('DOCDES').AsString;
       xWhere:='TDiarID='+quotedstr(cdsTDoc.fieldbyname('TDIARID').AsString);
       if length(cdsTDoc.fieldbyname('TDIARID2').AsString)>0 then begin
          xWhere:=xWhere+' or TDiarID='+quotedstr(cdsTDoc.fieldbyname('TDIARID2').AsString);
       end;
       xx:=BuscaQry('PrvTGE','TGE104','*',xWhere,'TDiarId');
       if cdsQry.RecordCount>1 then begin
          dblcTDiario.Enabled:=True;
          dblcTDiario.LookUpTable:=cdsQry;
          dblcTDiario.LookUpField:='TDiarId';
       end
       else dblcTDiario.Enabled:=False;
       dblcTDiario.Value:=xx;
       edtTDiario.Text:=cdsQry.FieldByName('TDiarDes').Value;
    end;
   End;
end;

procedure TFLetrasProvisio.dblcTDiarioExit(Sender: TObject);
begin
   if bbtnBorra.Focused then Exit;
   With DMCXP do Begin
    cdsQry.IndexFieldNames:='TDiarId';
    cdsQry.SetKey;
    cdsQry.FieldByName('TDiarId').Value:=dblcTDiario.Text;
    if cdsQry.GotoKey then edtTDiario.Text:=cdsQry.FieldByName('TDiarDes').Value;
    cdsTDoc.Filter:='DOC_FREG='+quotedstr('L'); // TDocum Letras
    cdsTDoc.Filtered:=True;
   End;
end;

procedure TFLetrasProvisio.rgOrdenClick(Sender: TObject);
begin
   with DMCXP do Begin
      if edtCia.Text='' then raise exception.Create('Compañia no válida');
      if edtTDoc.Text='' then raise exception.Create('Documento no válido');
      if edtTDiario.Text='' then raise exception.Create('Diario no válido');
      if (length(dbeAno.Text)+length(xperMes))<>6 then raise exception.Create('Periodo no válido');
      xFiltroP2:='';
      case rgOrden.ItemIndex of
      0 : begin // No. de Registro
             dblcdProv1.Visible:=False;
             dblcdProv2.Visible:=False;
             dbdtpFReg1.Visible:=False;
             dbdtpFReg2.Visible:=False;
             dbeNoReg1.Visible:=True;
             dbeNoReg2.Visible:=True;
             cdsMovCxP2.IndexFieldNames:='CPNOREG';
             cdsMovCxP2.First;
             dbeNoReg1.Text:=cdsMovCxP2.FieldByName('CPNOREG').AsString;
             cdsMovCxP2.Last;
             dbeNoReg2.Text:=cdsMovCxP2.FieldByName('CPNOREG').AsString;
             xFiltroP2:=' and CPNOREG>='+quotedstr(dbeNoReg1.Text)
                       +' and CPNOREG<='+quotedstr(dbeNoReg2.Text);
          end;
      1 : begin  // Fecha Venc.
             dblcdProv1.Visible:=False;
             dblcdProv2.Visible:=False;
             dbeNoReg1.Visible:=False;
             dbeNoReg2.Visible:=False;
             dbdtpFReg1.Visible:=True;
             dbdtpFReg2.Visible:=True;
             cdsMovCxP2.IndexFieldNames:='CPFREG';

             cdsMovCxP2.First;
             dbdtpFReg1.Date:=cdsMovCxP2.FieldByName('CPFvcmto').AsDateTime;
             cdsMovCxP2.Last;
             dbdtpFReg2.Date:=cdsMovCxP2.FieldByname('CPFvcmto').AsDateTime;

             xFiltroP2:=' and CPFVCMTO>='+quotedstr(formatdateTime(DMCXP.wFormatFecha,dbdtpFReg1.DateTime))
                       +' and CPFVCMTO<='+quotedstr(formatdateTime(DMCXP.wFormatFecha,dbdtpFReg2.DateTime));
          end;
      2 : begin  // Proveedor
             dbeNoReg1.Visible:=False;
             dbeNoReg2.Visible:=False;
             dbdtpFReg1.Visible:=False;
             dbdtpFReg2.Visible:=False;
             dblcdProv1.Visible:=True;
             dblcdProv2.Visible:=True;
             cdsMovCxP2.IndexFieldNames:='PROV';
             cdsMovCxP2.First;
             dblcdProv1.Text:=cdsMovCxP2.FieldByName('PROV').AsString;
             cdsMovCxP2.Last;
             dblcdProv2.Text:=cdsMovCxP2.FieldByName('PROV').AsString;
             xFiltroP2:=' and PROV>='+quotedstr(dblcdProv1.value)
                       +' and PROV<='+quotedstr(dblcdProv2.value);
          end;
      3 : begin  // Fecha Emision
             dblcdProv1.Visible:=False;
             dblcdProv2.Visible:=False;
             dbeNoReg1.Visible:=False;
             dbeNoReg2.Visible:=False;
             dbdtpFReg1.Visible:=True;
             dbdtpFReg2.Visible:=True;
             cdsMovCxP2.IndexFieldNames:='CPFEMIS';

             cdsMovCxP2.First;
             dbdtpFReg1.Date:=cdsMovCxP2.FieldByName('CPFEMIS').AsDateTime;
             cdsMovCxP2.Last;
             dbdtpFReg2.Date:=cdsMovCxP2.FieldByname('CPFEMIS').AsDateTime;

             xFiltroP2:=' and CPFEMIS>='+quotedstr(formatdateTime(DMCXP.wFormatFecha,dbdtpFReg1.DateTime))
                       +' and CPFEMIS<='+quotedstr(formatdateTime(DMCXP.wFormatFecha,dbdtpFReg2.DateTime));
          end;

      end;
   end;  // With DMCXP
end;

procedure TFLetrasProvisio.dbdtpFReg1Exit(Sender: TObject);
begin
   /////////////////////////// JSR
   DecodeDate(dbdtpFReg1.date, Year, Month, Day);
   wMes := inttostr(Month);
   if Month<10 then wMes := '0'+inttostr(Month);
   anomm:= IntToStr(Year)+wMes;
   if anomm <> (trim(dbeAno.Text)+trim(xperMes)) then wFechOk:=False
   else wFechOk:=True;
   ///////////////////////////
//   rgOrden.OnClick(nil);
end;

procedure TFLetrasProvisio.dbdtpFReg2Exit(Sender: TObject);
begin
   /////////////////////////// JSR
   DecodeDate(dbdtpFReg2.date, Year, Month, Day);
   wMes := inttostr(Month);
   if Month<10 then wMes := '0'+inttostr(Month);
   anomm:= IntToStr(Year)+wMes;
   if anomm <> trim(dbeAno.Text)+trim(xperMes) then wFechOk:=False
   else wFechOk:=True;
   ///////////////////////////
//   rgOrden.OnClick(nil);
end;

procedure TFLetrasProvisio.bbtnOkClick(Sender: TObject);
Var
   flagFech,flagFechReg,flagNroReg,flagProov:Boolean;
   xSQL : String;
begin
   pprLetras.template.fileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\LetraProvisionada.rtm' ;
   pprLetras.template.LoadFromFile;
   flagFech  :=False ;
   flagNroReg:=False ;
   flagProov :=False ;
   flagFechReg:= false;
   if edtCia.Text='' then raise exception.Create('Compañia no válida')     ;
   if edtTDoc.Text='' then raise exception.Create('Documento no válido')   ;
   if dblcTDiario.Text='' then raise exception.Create('Diario no válido')  ;
   if (length(dbeAno.Text)+length(xperMes))<>6 then raise exception.Create('Periodo no válido') ;
   case rgOrden.ItemIndex of
   0 : begin // No. de Registro
          flagNroReg:=True  ;
          if (dbeNoReg1.Text='') or (dbeNoReg2.Text='')
             then raise exception.Create('Ingrese rango inferior y superior');
       end;
   1 : begin  // Fecha Venc.
          flagFech:=True;
          if (dbdtpFReg1.Date=0) or (dbdtpFReg1.Date=0)
             then raise exception.Create('Ingrese rango inferior y superior');
  // 			  if not(wFechOk) then raise exception.Create('Fecha no coincide con el periodo');
       end;
   2 : begin  // Proveedor
          flagProov:=True;
          if (dblcdProv1.Text='') or (dblcdProv2.Text='')
             then raise exception.Create('Ingrese rango inferior y superior');
       end;
   3 : begin  // Fecha Reg.
          flagFechReg:=True;
          if (dbdtpFReg1.Date=0) or (dbdtpFReg1.Date=0)
             then raise exception.Create('Ingrese rango inferior y superior');
  // 			  if not(wFechOk) then raise exception.Create('Fecha no coincide con el periodo');
       end;

   end;

      pplblPeriodo.Caption:=dbeAno.Text+xperMes;
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
   xSQL:='SELECT CXP301.* , '+
          'CASE WHEN CPESTADO <>''E'' AND CPESTADO <>''A'' THEN CPMTOLOC END CPMTOLOCX , '  +
          'CASE WHEN CPESTADO <>''E'' AND CPESTADO <>''A'' THEN CPMTOEXT END CPMTOEXTX , '  +
          'CASE WHEN CPESTADO <>''E'' AND CPESTADO <>''A'' THEN CPTCAMPR END   TCAMPRX    '  +
          'FROM CXP301 WHERE '+xFiltroP1+xFiltroP2;
  end
  else
	if SRV_D = 'ORACLE' then
  begin
   xSQL:='SELECT CXP301.* , '+
		     'DECODE(CPESTADO, ''E'', '''', DECODE(CPESTADO, ''A'', '''', CPMTOLOC)) CPMTOLOCX, '+
		     'DECODE(CPESTADO, ''E'', '''', DECODE(CPESTADO, ''A'', '''', CPMTOEXT)) CPMTOEXTX, '+
		     'DECODE(CPESTADO, ''E'', '''', DECODE(CPESTADO, ''A'', '''', CPTCAMPR))   TCAMPRX  '+
         'FROM CXP301 WHERE '+xFiltroP1+xFiltroP2;
	end;

   // llena campos del archivo de impresion
   if flagFech then begin
      pplblDato.Caption:='Fecha Vencimiento';
      pplblFecIni.Caption:=datetostr(dbdtpFReg1.Date);
      pplblFecFin.Caption:=datetostr(dbdtpFReg2.Date);
      //CIM 27/08/2002
      xSQL:=xSQL+' Order by CPFVCMTO,CPNOREG';
      //*
   end;
   if flagNroReg then begin
      pplblDato.Caption:='Nº de Registro';
      pplblFecIni.Caption:=dbeNoreg1.text;
      pplblFecFin.Caption:=dbeNoreg2.text;
   end;
   if flagProov then begin
      pplblDato.Caption:='Proveedor';
      pplblFecIni.Caption:=dblcdProv1.text;
      pplblFecFin.Caption:=dblcdProv2.text;
      xSQL:=xSQL+' Order by PROV,CPFVCMTO'
   end;
   //CIM 27/08/2002
   if flagFechReg then begin
      pplblDato.Caption:='Fecha Emisión';
      pplblFecIni.Caption:=datetostr(dbdtpFReg1.Date);
      pplblFecFin.Caption:=datetostr(dbdtpFReg2.Date);
      xSQL:=xSQL+' Order by CPFEMIS,CPNOREG';
   end;
   //*

   DMCXP.cdsUltTGE.Close                   ;
   DMCXP.cdsUltTGE.DataRequest(xSQL)       ;
   DMCXP.cdsUltTGE.Open                    ;

{
   DMCXP.cdsMovCxP2.Close                   ;
   DMCXP.cdsMovCxP2.DataRequest(xSQL)       ;
   DMCXP.cdsMovCxP2.Open                    ;
}
   ppdbLetras.DataSource := DMCXP.dsUltTGE ;

   pplblCia.Caption := DMCXP.DisplayDescrip2('dspTGE','TGE101','CIADES','CIAID='+quotedstr(dblcCia.text),'CIADES');
   pprLetras.Print                       ;
   ppdbLetras.DataSource := nil          ;
end;

procedure TFLetrasProvisio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMCXP.cdsMovCxP2.Filter:= '';
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
   Action:=caFree;
end;

// Calcula el plazo de la Letra.... para el informe
procedure TFLetrasProvisio.ppVarPlazoCalc(Sender: TObject; var Value: Variant);
begin
  //ppVarPlazo.Value:=(DMCXP.cdsMovCxP2CPFVcmto.Value-DMCXP.cdsMovCxP2CPFEmis.Value);
end;

procedure TFLetrasProvisio.ppVarEstadoCalc(Sender: TObject; var Value: Variant);
begin
  if DMCXP.cdsUltTGE.fieldbyname('CPESTADO').Value = 'A' then
  begin
     ppVarEstado.Visible:=True ;
     ppVarEstado.Text:= 'A   N   U   L   A   D   O' ;
     Exit ;
  end ;
  if DMCXP.cdsUltTGE.FIELDBYNAME('CPESTADO').Value = 'E' then
  begin
     ppVarEstado.Visible:=True ;
     ppVarEstado.Text:= 'E  L  I  M  I  N  A  D  O' ;
     Exit                      ;
  end ;
  ppVarEstado.Visible := False ;
end ;

procedure TFLetrasProvisio.pprLetrasPreviewFormCreate(Sender: TObject);
begin
  //pprLetras.PreviewForm.ClientHeight := 500;
  //pprLetras.PreviewForm.ClientWidth := 650;			// ppViewr
  //tppviewer(pprLetras.PreviewForm.Viewer).zoomSetting := zspageWidth;

  pprLetras.PreviewForm.WindowState:=WsMaximized;
  TppViewer(pprLetras.PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
end;

procedure TFLetrasProvisio.dbeAnoExit(Sender: TObject);
begin
   if bbtnBorra.Focused then Exit;

   if length(dbeAno.Text)=0 then
   begin
      ShowMessage('Falta Ingresar Año');
      dbeAno.SetFocus;
      Exit
   end;

   if length(dbeAno.Text)<4 then
   begin
      ShowMessage('Año No Valido');
      dbeAno.SetFocus;
      Exit
   end;

end;

procedure TFLetrasProvisio.bbtnBorraClick(Sender: TObject);
begin
   IniciaDatos;
   dblcCia.Setfocus;
end;

procedure TFLetrasProvisio.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFLetrasProvisio.dblcdProv1Exit(Sender: TObject);
begin
//  rgOrden.OnClick(nil);
end;

procedure TFLetrasProvisio.seAnoExit(Sender: TObject);
begin
   if bbtnBorra.Focused then Exit;

   if length(dbeAno.Text)=0 then
   begin
      ShowMessage('Falta Ingresar Año');
      dbeAno.SetFocus;
      Exit
   end;

   if length(dbeAno.Text)<4 then
   begin
      ShowMessage('Año No Valido');
      dbeAno.SetFocus;
      Exit
   end;

end;

procedure TFLetrasProvisio.seMesExit(Sender: TObject);
begin
   if bbtnBorra.Focused then Exit;

   if length(dbeMes.Text)=0 then
   begin
      ShowMessage('Falta Ingresar Mes');
      dbeMes.SetFocus;
      Exit
   end;

   if StrToInt(dbeMes.text) < 10 then
    xperMes := '0'+dbeMes.text
   else
    xperMes := dbeMes.text;

   {if length(dbeMes.Text)<2 then
   begin
      ShowMessage('Mes no Valido');
      dbeMes.SetFocus;
      Exit
   end;}

   xFiltroP1:='';
   xFiltroP1 :='CIAID='+quotedstr(dblcCia.Text)
                       +' and DOCID='+quotedstr(dblcTDoc.Text)
                       +' and TDIARID='+quotedstr(dblcTDiario.Text)
                       +' and CPANOMES='+quotedstr(trim(dbeAno.Text)+trim(xperMes));
   pnlDatos1.Enabled  :=False;
   pnlDatos2.Enabled  :=True;
   rgOrden.SetFocus;
end;

procedure TFLetrasProvisio.FormShow(Sender: TObject);
var
   xSelDoc : String;
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
   
//   DMCXP.cdsMovCxP2.DisableControls;
 // calcula valor de periodo aaaamm tomando como base la fecha del sistema
   wFechOk:=True;
   DecodeDate(date, Year, Month, Day);
   wMes := inttostr(Month);
   if Month<10 then wMes := '0'+inttostr(Month);

   dblcCia.SetFocus;

   DMCXP.cdsTDoc.Filter:='';
   DMCXP.cdsTDoc.Filter:='DOC_FREG=''L'' and DOCMOD=''CXP''';
   DMCXP.cdsTDoc.Filtered:=True;
   if DMCXP.cdsTDoc.RecordCount=0 then begin
      ShowMessage('Tipos de Documento no registra definicion de Letras');
      // Forma de Registro (L) no definido en tabla TDocum(TGE110)     ¿?
      // Salir
      exit;
   end;

   xSelDoc := '';
   while not DMCXP.cdsTDoc.Eof do begin
      if Length(xSelDoc)=0 then
         xSelDoc := 'DOCID='+quotedstr(DMCXP.cdsTDoc.fieldbyname('DOCID').AsString)
      else
         xSelDoc := xSelDoc+ ' or DOCID='+quotedstr(DMCXP.cdsTDoc.fieldbyname('DOCID').AsString);
      DMCXP.cdsTDoc.Next;
   end;
   if Length( xSelDoc )=0 then
      Raise Exception.Create('No Existen Tipos de Documentos Registrados para Esta Opcion');

   Filtracds( DMCXP.cdsProv,   'Select * from TGE201' );
   Filtracds( DMCXP.cdsMovCxP2,'Select * from CXP301 Where '+xSelDoc );

   IniciaDatos;

end;

procedure TFLetrasProvisio.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.
