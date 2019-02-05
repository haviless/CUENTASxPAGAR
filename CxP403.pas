unit CxP403;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppCtrls, ppDB, ppPrnabl, ppClass, ppBands, ppProd, ppReport, ppComm,
  ppRelatv, ppCache, ppDBPipe, StdCtrls, ExtCtrls, wwdblook, Buttons, Mask,
  wwdbedit, ComCtrls, wwdbdatetimepicker, Wwdbdlg, ppVar, ppModule,
  daDatMod, ppviewr, Spin, ppTypes, oaVariables;

type
  TFCLetras = class(TForm)
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
    ppLabel3: TppLabel;
    pplblPeriodo1: TppLabel;
    pplblDel1: TppLabel;
    pplblAl1: TppLabel;
    pplblFecini1: TppLabel;
    pplblFecfin1: TppLabel;
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
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppLine2: TppLine;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel23: TppLabel;
    ppVarPlazo: TppVariable;
    ppLabel21: TppLabel;
    ppVarEstado1: TppVariable;
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
    seAno: TSpinEdit;
    seMes: TSpinEdit;
    pplCia: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppDBText4: TppDBText;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    pplblPeriodo: TppLabel;
    pplblDel: TppLabel;
    pplblAl: TppLabel;
    pplblFecini: TppLabel;
    pplblFecfin: TppLabel;
    ppLine4: TppLine;
    ppLabel35: TppLabel;
    ppLabel37: TppLabel;
    ppLabel39: TppLabel;
    ppLabel44: TppLabel;
    ppLabel46: TppLabel;
    ppLabel48: TppLabel;
    ppLine5: TppLine;
    ppLabel50: TppLabel;
    ppLabel52: TppLabel;
    ppLabel54: TppLabel;
    ppLabel41: TppLabel;
    ppLabel36: TppLabel;
    ppLabel32: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppLabel33: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel34: TppLabel;
    ppVarEstado: TppVariable;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel40: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel45: TppLabel;
    ppLabel47: TppLabel;
    ppLabel49: TppLabel;
    ppLabel53: TppLabel;
    ppLabel38: TppLabel;
    ppLabel51: TppLabel;
    pplblOrden: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppPlazo: TppVariable;
    ppdic: TppDBText;
    ppReg: TppDBText;
    ppAfavor: TppDBText;
    ppLetra: TppDBText;
    ppTcam: TppDBText;
    ppMext: TppDBText;
    ppMloc: TppDBText;
    ppFechaE: TppDBText;
    ppProv: TppDBText;
    ppTmonto: TppDBText;
    ppano: TppDBText;
    ppene: TppDBText;
    ppfeb: TppDBText;
    ppmar: TppDBText;
    ppabr: TppDBText;
    ppjun: TppDBText;
    ppjul: TppDBText;
    ppago: TppDBText;
    ppset: TppDBText;
    ppoct: TppDBText;
    ppobs: TppDBText;
    ppmay: TppDBText;
    ppVariable2: TppVariable;
    ppnov: TppDBText;
    ppDBText1: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    pplbltot: TppLabel;
    ppdbtotext: TppDBCalc;
    ppdbtotloc: TppDBCalc;
    ppLine6: TppLine;
    ppDBCalc3: TppDBCalc;
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure rgOrdenClick(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkClick(Sender: TObject);
    procedure dbdtpFReg1Exit(Sender: TObject);
    procedure dbdtpFReg2Exit(Sender: TObject);
    procedure ppVarPlazoCalc(Sender: TObject; var Value: Variant);
    procedure ppVarEstado1Calc(Sender: TObject; var Value: Variant);
    procedure ppVarEstado1Print(Sender: TObject);
    procedure pprLetrasPreviewFormCreate(Sender: TObject);
    procedure IniciaDatos;
    procedure bbtnBorraClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure pprNLetrasPreviewFormCreate(Sender: TObject);
    procedure ppVarEstadoCalc(Sender: TObject; var Value: Variant);
    procedure ppdbtotextCalc(Sender: TObject);
    procedure ppdbtotlocCalc(Sender: TObject);
    procedure seMesExit(Sender: TObject);
    procedure seAnoExit(Sender: TObject);
    procedure ppVariable2Calc(Sender: TObject; var Value: Variant);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    xperiodo : string;
    procedure CamposVisibles(xBool : bool);
    procedure CargaPeriodo;
    procedure CargaDataSource;
  public
    { Public declarations }
  end;

  procedure OPRegistroLetras; stdcall;

exports
  OPRegistroLetras;

var
   FCLetras: TFCLetras;
   Year, Month, Day: Word;
   wfechOk: boolean;
   anomm, wMes : string;
   xFiltroP1, xFiltroP2 : string;

implementation

uses CxPDM;

{$R *.DFM}

procedure OPRegistroLetras;
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
   if Assigned( FCLetras ) then Exit;
   try
     Screen.Cursor := crHourGlass;
     DMCXP.FiltraTabla( DMCXP.cdsTDoc,  'TGE110', 'DOCID');
     DMCXP.FiltraTabla( DMCXP.cdsCia,  'TGE101', 'CIAID');
     DMCXP.cdsCxP.IndexFieldNames := '';
     FCLetras := TFCLetras.Create( Application );
     FCLetras.ActiveMDIChild;
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
     Screen.Cursor := crDefault;
   Finally
   end;
end;

procedure TFCLetras.IniciaDatos;
begin

	 pnlDatos1.Enabled := True;
	 pnlDatos2.Enabled := False;

   dblcCia.Text      := '';
   edtCia.Text       := '';
   dblcTDoc.Text     := '';
   edtTDoc.Text      := '';
   dblcTDiario.Text  := '';
   edtTDiario.Text   := '';
//   dbeAnoMM.Text     := '';
   rgOrden.ItemIndex := -1;
   dbeNoReg1.Text    := '';
   dbeNoReg2.Text    := '';
   dbdtpFReg1.Date   := 0;
   dbdtpFReg2.Date   := 0;
   dblcdProv1.Text   := '';
   dblcdProv2.Text   := '';

end;

procedure TFCLetras.dblcCiaExit(Sender: TObject);
begin
   if bbtnBorra.Focused then Exit;
   edtCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Código de Compañía');
      dblcCia.SetFocus;
   end;
end;

procedure TFCLetras.dblcTDocExit(Sender: TObject);
Var
   xx, xFiltro, xWhere: String;
begin
   if bbtnBorra.Focused then Exit;
   With DMCXP do Begin
    if dblcTDoc.Text='' then begin dblcTDoc.SetFocus; exit; end;
    cdsTDoc.Filter:='';
    xFiltro:='DOCID='''+dblcTDoc.Text+'''';
    xFiltro:=xFiltro+' and (DOC_FREG='+''''+'L'+''''
             +'OR DOCTIPREG=''LT'') and DOCMOD=''CXP''';
    cdsTDoc.Filter:=xFiltro;
    cdsTDoc.Filtered:=True;
    if cdsTDoc.RecordCount > 0 then begin
       edtTDoc.Text:=cdsTDoc.fieldbyname('DOCDES').AsString;
       xWhere:='TDiarID='+''''+cdsTDoc.fieldbyname('TDIARID').AsString+'''';
       if length(cdsTDoc.fieldbyname('TDIARID2').AsString) > 0 then begin
          xWhere:=xWhere+' or TDiarID='+''''+cdsTDoc.fieldbyname('TDIARID2').AsString+'''';
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

procedure TFCLetras.dblcTDiarioExit(Sender: TObject);
begin
   if bbtnBorra.Focused then Exit;
   With DMCXP do Begin
    cdsQry.IndexFieldNames:='TDiarId';
    cdsQry.SetKey;
    cdsQry.FieldByName('TDiarId').Value:=dblcTDiario.Text;
    if cdsQry.GotoKey then edtTDiario.Text:=cdsQry.FieldByName('TDiarDes').Value;
    cdsTDoc.Filter:='DOC_FREG='+''''+'L'+''''; // TDocum Letras
    cdsTDoc.Filtered:=True;
   End;
end;

procedure TFCLetras.rgOrdenClick(Sender: TObject);
var
 nfecha1,nfecha2 : string;
begin
	 with DMCXP do Begin
			if edtCia.Text='' then raise exception.Create('Compañia no válida');
			if edtTDoc.Text='' then raise exception.Create('Documento no válido');
			if edtTDiario.Text='' then raise exception.Create('Diario no válido');
			xFiltroP2:='';
      //cim 02/08/2002
      lblRango1.Visible := true;
      lblRango2.Visible := true;
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
						 xFiltroP2:=' AND CXP301.CPNoReg>='+''''+dbeNoReg1.Text+''''
											 +' AND CXP301.CPNoReg<='+''''+dbeNoReg2.Text+'''';
					end;
			1 : begin  // Fecha Reg.
					 dblcdProv1.Visible:=False;
					 dblcdProv2.Visible:=False;
					 dbeNoReg1.Visible:=False;
					 dbeNoReg2.Visible:=False;
					 dbdtpFReg1.Visible:=True;
					 dbdtpFReg2.Visible:=True;
					 cdsMovCxP2.IndexFieldNames:='CPFREG';
					nFecha1 := formatdatetime(DMCXP.wFormatFecha,dbdtpFReg1.DateTime);
					nFecha2 := formatdatetime(DMCXP.wFormatFecha,dbdtpFReg2.DateTime);
          //CIM 02/08/2002
					xFiltroP2:=' AND (CXP301.CPFReg>='+quotedstr(nfecha1)
										 +' AND CXP301.CPFReg<='+quotedstr(nfecha2)+')';
					end;
			2 : begin  // Proveedor
					Screen.Cursor:=crHourGlass;
					Filtracds( DMCXP.cdsProv,   'Select * from TGE201' );
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
					xFiltroP2:=' AND CXP301.Prov>='+''''+dblcdProv1.value+''''
										 +' AND CXP301.Prov<='+''''+dblcdProv2.value+'''';
					Screen.Cursor:=crDefault;
					end;
			3 : begin  // Fecha de Vencimiento
					 dblcdProv1.Visible:=False;
					 dblcdProv2.Visible:=False;
					 dbeNoReg1.Visible:=False;
					 dbeNoReg2.Visible:=False;
           //CIM 02/08/2002
           dbdtpFReg1.Visible:=false;
           dbdtpFReg2.Visible:=false;
           cdsMovCxP2.IndexFieldNames:='CPFVCMTO';
           lblRango1.Visible := false;
           lblRango2.Visible := false;

{           cdsMovCxP2.First;
           dbdtpFReg1.Date:=cdsMovCxP2.FieldByName('CPFVCMTO').AsDateTime;
           cdsMovCxP2.Last;
           dbdtpFReg2.Date:=cdsMovCxP2.FieldByName('CPFVCMTO').AsDateTime;
          nFecha1 := formatdatetime(DMCXP.wFormatFecha,dbdtpFReg1.DateTime);
          nFecha2 := formatdatetime(DMCXP.wFormatFecha,dbdtpFReg2.DateTime);
          xFiltroP2:=' AND (CXP301.CPFVCMTO>='+quotedstr(nfecha1)
                     +' AND CXP301.CPFVCMTO<='+quotedstr(nfecha2)+')';    }

          end;
      end;
   end;  // With DMCXP
end;

procedure TFCLetras.dbdtpFReg1Exit(Sender: TObject);
begin
   DecodeDate(dbdtpFReg1.date, Year, Month, Day);
   wMes := inttostr(Month);
   if Month<10 then wMes := '0'+inttostr(Month);
   anomm:= IntToStr(Year)+wMes;
   if anomm <> xperiodo then wFechOk:=False
   else wFechOk:=True;
end;

procedure TFCLetras.dbdtpFReg2Exit(Sender: TObject);
begin
   DecodeDate(dbdtpFReg2.date, Year, Month, Day);
   wMes := inttostr(Month);
   if Month<10 then wMes := '0'+inttostr(Month);
   anomm:= IntToStr(Year)+wMes;
   if anomm <> xperiodo then wFechOk:=False
   else wFechOk:=True;
end;

procedure TFCLetras.bbtnOkClick(Sender: TObject);
Var
	 flagFech:Boolean;
	 ssql : string;
begin
	 flagFech:=False;
//   rgOrden.OnClick(nil);
	 if edtCia.Text='' then raise exception.Create('Compañia no válida');
	 if edtTDoc.Text='' then raise exception.Create('Documento no válido');
	 if dblcTDiario.Text='' then raise exception.Create('Diario no válido');
//   if length(dbeAnoMM.Text)<>6 then raise exception.Create('Periodo no válido');
	 DMCXP.cdsCxP.close;
	 case rgOrden.ItemIndex of
	 0 : begin // No. de Registro
					if (dbeNoReg1.Text='') or (dbeNoReg2.Text='')
						 then raise exception.Create('Ingrese rango inferior y superior');
					DMCXP.cdsCxP.IndexFieldNames:='CPNOREG';
			 end;
	 1 : begin  // Fecha Reg.
					flagFech:=True;
					if (dbdtpFReg1.Date=0) or (dbdtpFReg1.Date=0)
						 then raise exception.Create('Ingrese rango inferior y superior');
					if not(wFechOk) then raise exception.Create('Fecha no coincide con el periodo');
					DMCXP.cdsCxP.IndexFieldNames:='CPFREG';
			 end;
	 2 : begin  // Proveedor
					if (dblcdProv1.Text='') or (dblcdProv2.Text='')
						 then raise exception.Create('Ingrese rango inferior y superior');
					DMCXP.cdsCxP.IndexFieldNames:='PROV';
			 end;
	 3 : begin  // Fecha de Vencimiento
          //cim 02/08/2002
					{flagFech:=True;
					if (dbdtpFReg1.Date=0) or (dbdtpFReg1.Date=0)
						 then raise exception.Create('Ingrese rango inferior y superior');
					if not(wFechOk) then raise exception.Create('Fecha no coincide con el periodo');}
					DMCXP.cdsCxP.IndexFieldNames:='CPFVCMTO';
			 end;
	 end;

	 xFiltroP2:='';
	 case rgOrden.ItemIndex of
	 0 : begin // No. de Registro
			 xFiltroP2:=' AND CXP301.CPNoReg>='+''''+dbeNoReg1.Text+''''
								 +' AND CXP301.CPNoReg<='+''''+dbeNoReg2.Text+'''';
			 end;
	 1 : begin  // Fecha Reg.
			 xFiltroP2:=' AND (CXP301.CPFReg>='+quotedstr(DateToStr(dbdtpFReg1.Date))
								 +' AND CXP301.CPFReg<='+quotedstr(DateToStr(dbdtpFReg2.Date))+')';
			 end;
	 2 : begin  // Proveedor
			 xFiltroP2:=' AND CXP301.Prov>='+''''+dblcdProv1.value+''''
								 +' AND CXP301.Prov<='+''''+dblcdProv2.value+'''';
			 end;
       //CIM 02/08/2002
	 3 : begin  // Fecha de Vencimiento
       xFiltroP2:= '';
{			 xFiltroP2:=' AND (CXP301.CPFVCMTO>='+quotedstr(DateToStr(dbdtpFReg1.Date))
								 +' AND CXP301.CPFVCMTO<='+quotedstr(DateToStr(dbdtpFReg2.Date))+')';}
			 end;
	 end;




	 // llena campos del archivo de impresion

	pprNLetras.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\CxPRegLetras.rtm' ;
	pprNLetras.template.LoadFromFile ;

	 pplblPeriodo.Caption:= xperiodo;
	 pplCia.Caption      := edtCia.Text;
   //cim 03/08/2002
   pplblOrden.Caption  := 'Ordenado x '+rgorden.Items.Strings[rgorden.ItemIndex];
//JORGE : 28/01/2002
	 if (flagFech) AND (rgOrden.itemindex<>3) then
	 begin
			pplblDel.Visible   :=True;
			pplblFecIni.Visible:=True;
			pplblFecIni.Caption:=datetostr(dbdtpFReg1.Date);
      pplblAl.Visible    :=True;
      pplblFecFin.Visible:=True;
			pplblFecFin.Caption:=datetostr(dbdtpFReg2.Date);
	 end;




   ssql := '';
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    SSQL :=' SELECT TGE101.CIADES AS CIADESC, '+
           ' CXP301.PROVRUC,CXP301.CPFVCMTO,'+
           ' CXP301.CPFEMIS, CXP301.CPNOREG,CXP301.CPNODOC,CXP301.CPFREG,'+
           //cim  02/08/2002
           ' CXP301.TMONID,DAYS(CXP301.CPFVCMTO)-DAYS(CXP301.CPFEMIS) PLAZO,'+
           //*
           ' CASE WHEN CPESTADO <> ''A'' AND CPESTADO <> ''E'' THEN CXP301.CPTCAMPR END CPTCAMPR,'+
           ' CASE WHEN CPESTADO <> ''A'' AND CPESTADO <> ''E'' THEN CXP301.CPMTOEXT END CPMTOEXT,' +
           ' CASE WHEN CPESTADO <> ''A'' AND CPESTADO <> ''E'' THEN CXP301.CPMTOLOC END CPMTOLOC,' +
           ' CASE WHEN CPESTADO <> ''A'' AND CPESTADO <> ''E'' THEN CXP301.CPMTOORI END CPMTOORI,'+
           ' CXP301.PROV AS PROVID,CXP301.PROV,'+
           ' CNT201.AUXNOMB AS AFAVOR,'+
           ' YEAR(CXP301.CPFVCMTO) AS ANIO,'+
           ' CASE WHEN MONTH(CXP301.CPFVCMTO) = 1  AND CPESTADO <> ''A'' AND CPESTADO <> ''E''  THEN DAY(CXP301.CPFVCMTO) ELSE 0 END AS ENE,'+
           ' CASE WHEN MONTH(CXP301.CPFVCMTO) = 2  AND CPESTADO <> ''A'' AND CPESTADO <> ''E''  THEN DAY(CXP301.CPFVCMTO) ELSE 0 END AS FEB,'+
           ' CASE WHEN MONTH(CXP301.CPFVCMTO) = 3  AND CPESTADO <> ''A'' AND CPESTADO <> ''E''  THEN DAY(CXP301.CPFVCMTO) ELSE 0 END AS MAR,'+
           ' CASE WHEN MONTH(CXP301.CPFVCMTO) = 4  AND CPESTADO <> ''A'' AND CPESTADO <> ''E''  THEN DAY(CXP301.CPFVCMTO) ELSE 0 END AS ABR,'+
           ' CASE WHEN MONTH(CXP301.CPFVCMTO) = 5  AND CPESTADO <> ''A'' AND CPESTADO <> ''E''  THEN DAY(CXP301.CPFVCMTO) ELSE 0 END AS MAY,'+
           ' CASE WHEN MONTH(CXP301.CPFVCMTO) = 6  AND CPESTADO <> ''A'' AND CPESTADO <> ''E''  THEN DAY(CXP301.CPFVCMTO) ELSE 0 END AS JUN,'+
           ' CASE WHEN MONTH(CXP301.CPFVCMTO) = 7  AND CPESTADO <> ''A'' AND CPESTADO <> ''E''  THEN DAY(CXP301.CPFVCMTO) ELSE 0 END AS JUL,'+
           ' CASE WHEN MONTH(CXP301.CPFVCMTO) = 8  AND CPESTADO <> ''A'' AND CPESTADO <> ''E''  THEN DAY(CXP301.CPFVCMTO) ELSE 0 END AS AGO,'+
           ' CASE WHEN MONTH(CXP301.CPFVCMTO) = 9  AND CPESTADO <> ''A'' AND CPESTADO <> ''E''  THEN DAY(CXP301.CPFVCMTO) ELSE 0 END AS SEP,'+
           ' CASE WHEN MONTH(CXP301.CPFVCMTO) = 10 AND CPESTADO <> ''A'' AND CPESTADO <> ''E''  THEN DAY(CXP301.CPFVCMTO) ELSE 0 END AS OCT,'+
           ' CASE WHEN MONTH(CXP301.CPFVCMTO) = 11 AND CPESTADO <> ''A'' AND CPESTADO <> ''E''  THEN DAY(CXP301.CPFVCMTO) ELSE 0 END AS NOV,'+
					 ' CASE WHEN MONTH(CXP301.CPFVCMTO) = 12 AND CPESTADO <> ''A'' AND CPESTADO <> ''E''  THEN DAY(CXP301.CPFVCMTO) ELSE 0 END AS DIC,'+
           ' CPESTADO, '+
           ' CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN ''ANULADA'' '+
                  'ELSE CASE WHEN CPESTADO=''P'' OR CPESTADO=''C'' THEN ''ACEPTADA'' '+
                            'ELSE ''INICIAL'' '+
           '            END '+
           ' END ESTDOCDES '+
           ' FROM CXP301, CNT201, TGE101' +
           ' WHERE CXP301.CIAID='+quotedstr(dblcCia.text)+' AND CXP301.TDIARID ='+quotedstr(dblcTDiario.text)+
           ' AND CXP301.DOCID ='+quotedstr(dblcTDoc.text)+
           ' AND (CXP301.PROV = CNT201.AUXID AND CXP301.CLAUXID = CNT201.CLAUXID ) AND CPANOMES ='+quotedstr(xperiodo)+
           ' AND CXP301.CIAID = TGE101.CIAID '+ xFiltroP2 ;
  end
  else
	if SRV_D = 'ORACLE' then
  begin
    SSQL :='SELECT TGE101.CIADES AS CIADESC, '+
           'CXP301.PROVRUC,CXP301.CPFVCMTO, '+
           'CXP301.CPFEMIS, CXP301.CPNOREG,CXP301.CPNODOC, '+
           //cim  02/08/2002
           ' CXP301.TMONID,0 PLAZO,'+
           //*
  		     'DECODE(CPESTADO, ''E'', '''', DECODE(CPESTADO, ''A'', '''', CXP301.CPTCAMPR)) CPTCAMPR, '+
	  	     'DECODE(CPESTADO, ''E'', '''', DECODE(CPESTADO, ''A'', '''', CXP301.CPMTOEXT)) CPMTOEXT, '+
		       'DECODE(CPESTADO, ''E'', '''', DECODE(CPESTADO, ''A'', '''', CXP301.CPMTOLOC)) CPMTOLOC, '+
		       'DECODE(CPESTADO, ''E'', '''', DECODE(CPESTADO, ''A'', '''', CXP301.CPMTOORI)) CPMTOORI, '+
           'CXP301.PROV AS PROVID,CXP301.PROV, '+
           'CNT201.AUXNOMB AS AFAVOR, '+
           'TO_CHAR(CXP301.CPFVCMTO,''YYYY'') AS ANIO, '+
           'DECODE(TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''MM'')),1, DECODE(CPESTADO,''A'',0, DECODE(CPESTADO,''E'',0,TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''DD'')))),0)  AS ENE, '+
           'DECODE(TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''MM'')),2, DECODE(CPESTADO,''A'',0, DECODE(CPESTADO,''E'',0,TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''DD'')))),0)  AS FEB, '+
           'DECODE(TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''MM'')),3, DECODE(CPESTADO,''A'',0, DECODE(CPESTADO,''E'',0,TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''DD'')))),0)  AS MAR, '+
           'DECODE(TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''MM'')),4, DECODE(CPESTADO,''A'',0, DECODE(CPESTADO,''E'',0,TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''DD'')))),0)  AS ABR, '+
           'DECODE(TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''MM'')),5, DECODE(CPESTADO,''A'',0, DECODE(CPESTADO,''E'',0,TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''DD'')))),0)  AS MAY, '+
           'DECODE(TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''MM'')),6, DECODE(CPESTADO,''A'',0, DECODE(CPESTADO,''E'',0,TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''DD'')))),0)  AS JUN, '+
           'DECODE(TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''MM'')),7, DECODE(CPESTADO,''A'',0, DECODE(CPESTADO,''E'',0,TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''DD'')))),0)  AS JUL, '+
           'DECODE(TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''MM'')),8, DECODE(CPESTADO,''A'',0, DECODE(CPESTADO,''E'',0,TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''DD'')))),0)  AS AGO, '+
           'DECODE(TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''MM'')),9, DECODE(CPESTADO,''A'',0, DECODE(CPESTADO,''E'',0,TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''DD'')))),0)  AS SEP, '+
					 'DECODE(TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''MM'')),10, DECODE(CPESTADO,''A'',0, DECODE(CPESTADO,''E'',0,TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''DD'')))),0) AS OCT, '+
           'DECODE(TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''MM'')),11, DECODE(CPESTADO,''A'',0, DECODE(CPESTADO,''E'',0,TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''DD'')))),0) AS NOV, '+
           'DECODE(TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''MM'')),12, DECODE(CPESTADO,''A'',0, DECODE(CPESTADO,''E'',0,TO_NUMBER(TO_CHAR(CXP301.CPFVCMTO,''DD'')))),0) AS DIC, '+
           'CPESTADO '+
           'FROM CXP301, CNT201, TGE101 ' +
           'WHERE CXP301.CIAID='+quotedstr(dblcCia.text)+' AND CXP301.TDIARID ='+quotedstr(dblcTDiario.text)+
           ' AND CXP301.DOCID ='+quotedstr(dblcTDoc.text)+
           ' AND (CXP301.PROV = CNT201.AUXID AND CXP301.CLAUXID = CNT201.CLAUXID ) AND CPANOMES ='+quotedstr(xperiodo)+
           ' AND CXP301.CIAID = TGE101.CIAID '+ xFiltroP2 ;
	end;

   DMCXP.cdsCxP.close;
   DMCXP.cdsCxP.DataRequest(ssql);
   DMCXP.cdsCxP.open;

{
   06/11/2000 pjsv
   DMCXP.cdsMovCxP2.Filtered := False;
   DMCXP.cdsMovCxP2.Filter   := '';
   DMCXP.cdsMovCxP2.Filter   := xFiltroP1+xFiltroP2;
   DMCXP.cdsMovCxP2.Filtered := True;
}
   pprNLetras.Print;
end;

procedure TFCLetras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   try
     DMCXP.cdsMovCxP2.Filter:= '';
     DMCXP.cdsCxP.Filter:= '';
 	   DMCXP.cdsLetras.Close;
     DMCXP.cdsCxP.IndexFieldNames := '';
   except
   end;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
   Action:=caFree;
end;

// Calcula el plazo de la Letra.... para el informe
procedure TFCLetras.ppVarPlazoCalc(Sender: TObject; var Value: Variant);
begin
//cim  02/08/2002
// if ( DMCXP.cdscXp.FieldByName('CPESTADO').AsString <> 'E') and (DMCXP.cdscXp.FieldByName('CPESTADO').AsString <> 'A') then
//     ppVarPlazo.Value:=(DMCXP.cdsMovCxP2.FieldByName('CPFVCMTO').AsDatetime-DMCXP.cdsMovCxP2.FieldByName('CPFEMIS').AsDateTime);
end;

procedure TFCLetras.ppVarEstado1Calc(Sender: TObject; var Value: Variant);
begin
//  if DMCXP.cdsMovCxP2CPEstado.Value = 'A' then begin
//     ppVarEstado.Visible:=True;
//     ppVarEstado.Text:= '  A       N       U       L       A       D       O   ';
//  end;
end;

procedure TFCLetras.ppVarEstado1Print(Sender: TObject);
begin
//    ppVarEstado.Visible:=False;
end;

procedure TFCLetras.pprLetrasPreviewFormCreate(Sender: TObject);
begin
	pprLetras.PreviewForm.WindowState:=WsMaximized;
  TppViewer(pprLetras.PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
end;


procedure TFCLetras.bbtnBorraClick(Sender: TObject);
begin
	IniciaDatos;
	dblcCia.Setfocus;
end;

procedure TFCLetras.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFCLetras.pprNLetrasPreviewFormCreate(Sender: TObject);
begin
   pprNLetras.PreviewForm.WindowState:=WsMaximized;
   TppViewer(pprNLetras.PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
end;

procedure TFCLetras.ppVarEstadoCalc(Sender: TObject; var Value: Variant);
begin
  if DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString = 'A' then
   begin
     ppVarEstado.Visible:=True;
     ppVarEstado.Text:= '  A       N       U       L       A       D       O   ';
     CamposVisibles(false);
   end
  else CamposVisibles(True);
end;

procedure TFCLetras.CamposVisibles(xBool : bool);
begin
     ppLetra.Visible := xBool;
     ppProv.Visible := xBool;
     ppPlazo.Visible := xBool;
     ppTcam.Visible := xBool;
     ppMext.Visible := xBool;
     ppMloc.Visible := xBool;
     ppTmonto.Visible := xBool;
     ppano.Visible := xBool;
     ppene.Visible := xBool;
     ppfeb.Visible := xBool;
     ppmar.Visible := xBool;
     ppabr.Visible := xBool;
     ppmay.Visible := xBool;
     ppjun.Visible := xBool;
     ppjul.Visible := xBool;
     ppago.Visible := xBool;
     ppset.Visible := xBool;
     ppoct.Visible := xBool;
     ppnov.Visible := xBool;
     ppdic.Visible := xBool;
     ppobs.Visible := xBool;
end;

procedure TFCLetras.ppdbtotextCalc(Sender: TObject);
begin
  if DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString = 'A' then
    ppdbtotext.Value := ppdbtotext.Value - ppdbtotext.FieldValue;
end;

procedure TFCLetras.ppdbtotlocCalc(Sender: TObject);
begin
  if DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString = 'A' then
    ppdbtotloc.Value := ppdbtotloc.Value - ppdbtotloc.FieldValue;
end;

procedure TFCLetras.seMesExit(Sender: TObject);
var
 nfecha : string;
begin
	CargaPeriodo;

	pnlDatos1.Enabled  :=False;
	pnlDatos2.Enabled  :=True;
	rgOrden.ItemIndex := 0;
	rgOrden.SetFocus;
end;

procedure TFCLetras.seAnoExit(Sender: TObject);
begin
	CargaPeriodo;
	seMes.SetFocus;
end;

procedure TFCLetras.CargaPeriodo;
var
 ssql : string;
begin
	 if bbtnBorra.Focused then Exit;
	 if StrToInt(seMes.text) < 10 then
		xperiodo := seAno.Text +StrZero( seMes.text, 2)
	 else
      xperiodo := seAno.Text + seMes.text;
	 ssql := '';
	 ssql:= 'SELECT * FROM CXP301 WHERE'+
					' CIAID ='+Trim(quotedstr(dblcCia.Text))+
					' AND DOCID ='+ Trim(quotedstr(dblcTDoc.Text)) +
					' AND TDIARID ='+ Trim(quotedstr(dblcTDiario.Text)) +
					' AND CPANOMES ='+ Trim(quotedstr(xperiodo));
	 DMCXP.cdsMovCxP2.Close;
	 DMCXP.cdsMovCxP2.DataRequest(ssql);
	 DMCXP.cdsMovCxP2.open;
end;

procedure TFCLetras.ppVariable2Calc(Sender: TObject; var Value: Variant);
begin
	if DMCXP.cdscXp.FieldByName('CPESTADO').AsString = 'E'  then
	begin
     ppVariable2.Text      := ' E   L   I   M   I   N   A   D   O' ;
     ppVariable2.Visible   := True         ;
     EXIT ;
  end ;
  if DMCXP.cdsCxp.FieldByName('CPESTADO').AsString = 'A'  then
  begin
     ppVariable2.Text      :=  'A     N     U     L     A     D     O'    ;
     ppVariable2.Visible   := True         ;
     eXIT ;
  end ;
  ppVariable2.Visible := false ;
end;

procedure TFCLetras.FormShow(Sender: TObject);
var
   xSelDoc,xFiltro : String;
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
   
 // calcula valor de periodo aaaamm tomando como base la fecha del sistema
	 wFechOk:=True;
	 DecodeDate(date, Year, Month, Day);
	 wMes := inttostr(Month);
	 if Month<10 then wMes := '0'+inttostr(Month);
//   dbeAnoMM.Text:= IntToStr(Year)+wMes;
	 dblcCia.SetFocus;
	 seAno.Value := Year;
	 seMEs.Value := Month;
	 DMCXP.cdsTDoc.Filter:='';
   xFiltro:=  '(DOC_FREG=''L'' and DOCMOD=''CXP'')'
             +'OR (DOCTIPREG=''LT'' and DOCMOD=''CXP'')';
//   DMCXP.cdsTDoc.Filter:='DOC_FREG=''L'' and DOCMOD=''CXP''';
   DMCXP.cdsTDoc.Filter:=xFiltro;
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
         xSelDoc := 'DOCID='+''''+DMCXP.cdsTDoc.fieldbyname('DOCID').AsString+''''
      else
         xSelDoc := xSelDoc+ ' or DOCID='+''''+DMCXP.cdsTDoc.fieldbyname('DOCID').AsString+'''';
			DMCXP.cdsTDoc.Next;
	 end;
	 if Length( xSelDoc )=0 then
			Raise Exception.Create('No Existen Tipos de Documentos Registrados para Esta Opcion');

	 //Filtracds( DMCXP.cdsMovCxP2,'Select * from CXP301 Where '+xSelDoc );

   IniciaDatos;

end;

procedure TFCLetras.FormCreate(Sender: TObject);
begin

   CargaDataSource;

end;


procedure TFCLetras.CargaDataSource;
begin
   dblcCia.DataSource     :=nil;
   dblcCia.LookupTable    :=DMCXP.cdsCia;
   dblcTDoc.DataSource    :=nil;
   dblcTDoc.LookupTable   :=DMCXP.cdsTDoc;
end;


end.
