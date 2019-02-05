unit Cxp781;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Buttons, Mant, Db, Wwdatsrc, DBClient, wwclient, ppDB,
  ppDBPipe, ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, Wwdbigrd, Wwdbgrid, ExtCtrls, Spin, StdCtrls, wwdblook,
  ppVar, Mask, wwdbedit, Wwdbdlg, wwdbdatetimepicker, oaVariables;

type
  TFToolRegLetras = class(TForm)
    pprNLetras: TppReport;
    ppdbLetras: TppDBPipeline;
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
    pnlComprobante: TPanel;
    rgOrden: TRadioGroup;
    lblRango1: TLabel;
    lblRango2: TLabel;
    dbdtpFReg1: TwwDBDateTimePicker;
    dblcdProv1: TwwDBLookupComboDlg;
    dblcdProv2: TwwDBLookupComboDlg;
    dbdtpFReg2: TwwDBDateTimePicker;
    dbeNoReg2: TwwDBEdit;
    dbeNoReg1: TwwDBEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label1: TLabel;
    zsbImprime: TSpeedButton;
    Label3: TLabel;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    lblCia: TLabel;
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    seAno: TSpinEdit;
    seMes: TSpinEdit;
    dblcTDoc: TwwDBLookupCombo;
    edtTDoc: TEdit;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    ppHeaderBand2: TppHeaderBand;
    pplblCia: TppDBText;
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
    ppLabel55: TppLabel;
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
    ppnov: TppDBText;
    ppDBText1: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    pplbltot: TppLabel;
    ppdbtotext: TppDBCalc;
    ppdbtotloc: TppDBCalc;
    ppLine6: TppLine;
    Timer1: TTimer;
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure seAnoExit(Sender: TObject);
    procedure seMesExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure IniciaDatos;
    procedure FormCreate(Sender: TObject);
    procedure rgOrdenClick(Sender: TObject);
    procedure zsbImprimeClick(Sender: TObject);
    procedure pprNLetrasPreviewFormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ppVariable2Calc(Sender: TObject; var Value: Variant);
    procedure ppVarEstadoCalc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc3Calc(Sender: TObject);
    procedure ppdbtotextCalc(Sender: TObject);
    procedure ppdbtotlocCalc(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure bbtnImprimeClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    grid : TwwDBGrid;
    xperiodo : string;
    procedure CamposVisibles(xBool : bool);
    procedure CargaPeriodo;
  public
    { Public declarations }

  end;

var
  FToolRegLetras: TFToolRegLetras;
  Year, Month, Day: Word;
  wfechOk: boolean;
  anomm, wMes : string;
  xFiltroP1, xFiltroP2 : string;
  xAccesoBotones : Boolean;


implementation

uses CxP001, CxPDM;

{$R *.DFM}

procedure TFToolRegLetras.dblcCiaExit(Sender: TObject);
var
   xSelDoc : String;
begin
//   if bbtnBorra.Focused then Exit;
   edtCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Código de Compañía');
      dblcCia.SetFocus;
      Exit;
   end;
  	 wFechOk:=True;
	 DecodeDate(date, Year, Month, Day);
	 wMes := inttostr(Month);
	 if Month<10 then wMes := '0'+inttostr(Month);
//   dbeAnoMM.Text:= IntToStr(Year)+wMes;
	 dblcTDoc.SetFocus;
	 seAno.Value := Year;
	 seMEs.Value := Month;
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
         xSelDoc := 'DOCID='+''''+DMCXP.cdsTDoc.fieldbyname('DOCID').AsString+''''
      else
         xSelDoc := xSelDoc+ ' or DOCID='+''''+DMCXP.cdsTDoc.fieldbyname('DOCID').AsString+'''';
			DMCXP.cdsTDoc.Next;
	 end;
	 if Length( xSelDoc )=0 then
			Raise Exception.Create('No Existen Tipos de Documentos Registrados para Esta Opcion');

	 //Filtracds( DMCXP.cdsMovCxP2,'Select * from CXP301 Where '+xSelDoc );

//   IniciaDatos;



end;

procedure TFToolRegLetras.CamposVisibles(xBool : bool);
begin
{     ppLetra.Visible := xBool;
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
}
end;


procedure TFToolRegLetras.dblcTDocExit(Sender: TObject);
Var
   xx, xFiltro, xWhere: String;
begin
//   if bbtnBorra.Focused then Exit;
   if dblcCia.focused then exit;
   With DMCXP do Begin
    if dblcTDoc.Text='' then begin dblcTDoc.SetFocus; exit; end;
    cdsTDoc.Filter:='';
    xFiltro:='DOCID='+dblcTDoc.Text;
    xFiltro:=xFiltro+' and DOC_FREG='+''''+'L'+'''';
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

procedure TFToolRegLetras.IniciaDatos;
begin

//	 pnlDatos1.Enabled := True;
//	 pnlDatos2.Enabled := False;

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


procedure TFToolRegLetras.dblcTDiarioExit(Sender: TObject);
begin
//   if bbtnBorra.Focused then Exit;
   With DMCXP do Begin
    cdsQry.IndexFieldNames:='TDiarId';
    cdsQry.SetKey;
    cdsQry.FieldByName('TDiarId').Value:=dblcTDiario.Text;
    if cdsQry.GotoKey then edtTDiario.Text:=cdsQry.FieldByName('TDiarDes').Value;
    cdsTDoc.Filter:='DOC_FREG='+''''+'L'+''''; // TDocum Letras
    cdsTDoc.Filtered:=True;
   End;
end;

procedure TFToolRegLetras.CargaPeriodo;
var
 ssql : string;
begin
//	 if bbtnBorra.Focused then Exit;
	 if StrToInt(seMes.text) < 10 then
 		 xperiodo := seAno.Text + StrZero( seMes.text, 2)
	 else
       xperiodo := seAno.Text + seMes.text;
	 ssql := '';
	 ssql:= 'SELECT * FROM CXP301 WHERE'+
					' CIAID ='+Trim(quotedstr(dblcCia.Text))+
					' AND DOCID ='+ Trim(quotedstr(dblcTDoc.Text)) +
					' AND TDIARID ='+ Trim(quotedstr(dblcTDiario.Text)) +
					' AND CPANOMES ='+ Trim(quotedstr(xperiodo))+
  					' AND TMONID ='+ Trim(quotedstr(dblcTMon.Text));
	 DMCXP.cdsMovCxP2.Close;
	 DMCXP.cdsMovCxP2.DataRequest(ssql);
	 DMCXP.cdsMovCxP2.open;
end;


procedure TFToolRegLetras.seAnoExit(Sender: TObject);
begin
	CargaPeriodo;
	seMes.SetFocus;
end;


procedure TFToolRegLetras.seMesExit(Sender: TObject);
var
 nfecha : string;
begin
//	CargaPeriodo;

//	pnlDatos1.Enabled  :=False;
//	pnlDatos2.Enabled  :=True;

 //	rgOrden.ItemIndex := 0;
 //	rgOrden.SetFocus;
 //  rgOrdenClick(sender);
end;


procedure TFToolRegLetras.FormActivate(Sender: TObject);
var
   xSelDoc : String;
begin
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

procedure TFToolRegLetras.FormCreate(Sender: TObject);
var
   xSelDoc : String;
begin
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

procedure TFToolRegLetras.rgOrdenClick(Sender: TObject);
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
           dbdtpFReg1.Visible:=true;
           dbdtpFReg2.Visible:=true;
           cdsMovCxP2.IndexFieldNames:='CPFVCMTO';
           lblRango1.Visible := false;
           lblRango2.Visible := false;
          	nFecha1 := formatdatetime(DMCXP.wFormatFecha,dbdtpFReg1.DateTime);
		  		nFecha2 := formatdatetime(DMCXP.wFormatFecha,dbdtpFReg2.DateTime);
          //CIM 02/08/2002
					xFiltroP2:=' AND (CXP301.CPFVCMTO>='+quotedstr(nfecha1)
										 +' AND CXP301.CPFVCMTO<='+quotedstr(nfecha2)+')';

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

procedure TFToolRegLetras.zsbImprimeClick(Sender: TObject);
Var
	 flagFech:Boolean;
	 xsql : string;
begin
	 flagFech:=False;
//   rgOrden.OnClick(nil);

	 if edtCia.Text='' then raise exception.Create('Compañia no válida');
	 if edtTDoc.Text='' then raise exception.Create('Documento no válido');
	 if dblcTDiario.Text='' then raise exception.Create('Diario no válido');
	 if edtTMon.Text='' then raise exception.Create('Tipo de Moneda no válido');
//   if length(dbeAnoMM.Text)<>6 then raise exception.Create('Periodo no válido');
	 DMCXP.cdsCxP.close;
	 case rgOrden.ItemIndex of
	 0 : begin // No. de Registro
					if (dbeNoReg1.Text='') or (dbeNoReg2.Text='')
						 then raise exception.Create('No hay Registros para la Consulta');
               //						 then raise exception.Create('Ingrese rango inferior y superior,No hay Datos para la Consulta');
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
			 xFiltroP2:=' AND (CXP301.CPFVCMTO>='+quotedstr(DateToStr(dbdtpFReg1.Date))
								 +' AND CXP301.CPFVCMTO<='+quotedstr(DateToStr(dbdtpFReg2.Date))+')';
			 end;
	 end;

	 // llena campos del archivo de impresion

	 pprNLetras.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\CxPRegLetras.rtm' ;
	 pprNLetras.template.LoadFromFile ;

	 pplblPeriodo.Caption:= xperiodo;
	 pplblCia.Caption      := edtCia.Text;
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


    xsql := '';


  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
  xSQL :=' SELECT TGE101.CIADES AS CIADESC, '+
           ' CXP301.PROVRUC,CXP301.CPFVCMTO,'+
           ' CXP301.CPFEMIS, CXP301.CPNOREG,CXP301.CPNODOC,CXP301.CPFREG,'+
           //cim  02/08/2002
           ' CXP301.TMONID,DAYS(CXP301.CPFVCMTO)-DAYS(CXP301.CPFEMIS) PLAZO,'+
           //*
           ' CASE WHEN CPESTADO <> ''A'' AND CPESTADO <> ''E'' THEN CXP301.CPTCAMPR ELSE CXP301.CPTCAMPR END CPTCAMPR,'+
           ' CASE WHEN CPESTADO <> ''A'' AND CPESTADO <> ''E'' THEN CXP301.CPMTOEXT ELSE 0 END CPMTOEXT,' +
           ' CASE WHEN CPESTADO <> ''A'' AND CPESTADO <> ''E'' THEN CXP301.CPMTOLOC ELSE 0 END CPMTOLOC,' +
           ' CASE WHEN CPESTADO <> ''A'' AND CPESTADO <> ''E'' THEN CXP301.CPMTOORI ELSE 0 END CPMTOORI,'+
           ' CXP301.PROV AS PROVID,CXP301.PROV,'+
           ' CNT201.AUXNOMB AS AFAVOR,'+
           ' YEAR(CXP301.CPFVCMTO)  AS ANIO,'+
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
           ' CPESTADO, TGE115.ESTDOCDES '+
           ' FROM CXP301, CNT201, TGE101, TGE115 ' +
           ' WHERE CXP301.CIAID='+quotedstr(dblcCia.text)+' AND CXP301.TDIARID ='+quotedstr(dblcTDiario.text)+
           ' AND CXP301.DOCID ='+quotedstr(dblcTDoc.text)+' AND CXP301.TMONID='+quotedstr(dblcTMon.text)+
           ' AND (CXP301.PROV = CNT201.AUXID AND CXP301.CLAUXID = CNT201.CLAUXID ) AND CPANOMES ='+quotedstr(xperiodo)+
           ' AND CXP301.CIAID = TGE101.CIAID AND CXP301.CPESTADO=TGE115.ESTDOCID  '+ xFiltroP2 ;
  end
  else
	if SRV_D = 'ORACLE' then
  begin
    xSQL :='SELECT TGE101.CIADES AS CIADESC, '+
           'CXP301.PROVRUC,CXP301.CPFVCMTO, '+
           'CXP301.CPFEMIS, CXP301.CPNOREG,CXP301.CPNODOC, '+
           //cim  02/08/2002
           ' CXP301.TMONID,0 PLAZO,'+
           //*
//  		     'DECODE(CPESTADO, ''E'', '''', DECODE(CPESTADO, ''A'','''' , CXP301.CPTCAMPR)) CPTCAMPR, '+
           //modificado por Ana 28/08/2002
  		     'DECODE(CPESTADO, ''E'', CXP301.CPTCAMPR, DECODE(CPESTADO, ''A'', CXP301.CPTCAMPR, CXP301.CPTCAMPR)) CPTCAMPR, '+
{	  	     'DECODE(CPESTADO, ''E'', '''', DECODE(CPESTADO, ''A'', '''', CXP301.CPMTOEXT)) CPMTOEXT, '+
		       'DECODE(CPESTADO, ''E'', '''', DECODE(CPESTADO, ''A'', '''', CXP301.CPMTOLOC)) CPMTOLOC, '+
		       'DECODE(CPESTADO, ''E'', '''', DECODE(CPESTADO, ''A'', '''', CXP301.CPMTOORI)) CPMTOORI, '+}
	  	       'DECODE(CPESTADO, ''E'', 0, DECODE(CPESTADO, ''A'', 0, CXP301.CPMTOEXT)) CPMTOEXT, '+
		       'DECODE(CPESTADO, ''E'', 0, DECODE(CPESTADO, ''A'', 0, CXP301.CPMTOLOC)) CPMTOLOC, '+
		       'DECODE(CPESTADO, ''E'', 0, DECODE(CPESTADO, ''A'', 0, CXP301.CPMTOORI)) CPMTOORI, '+
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
           'CPESTADO, TGE115.ESTDOCDES '+
           'FROM CXP301, CNT201, TGE101 ' +
           'WHERE CXP301.CIAID='+quotedstr(dblcCia.text)+' AND CXP301.TDIARID ='+quotedstr(dblcTDiario.text)+
           ' AND CXP301.DOCID ='+quotedstr(dblcTDoc.text)+' AND CXP301.TMONID='+quotedstr(dblcTMon.text)+
           ' AND (CXP301.PROV = CNT201.AUXID AND CXP301.CLAUXID = CNT201.CLAUXID ) AND CPANOMES ='+quotedstr(xperiodo)+
           ' AND CXP301.CIAID = TGE101.CIAID AND CXP301.CPESTADO=TGE115.ESTDOCID '+ xFiltroP2 ;
	end;

   Fprincipal.GRegLetras.UsuarioSQL.Clear;
   Fprincipal.GRegLetras.FMant.wTabla:='VWCAJAREGLETRAS';
   Fprincipal.GRegLetras.UsuarioSQL.Add( XSQL );
   Fprincipal.GRegLetras.NewQuery;
   DMCXP.cdsCxP.close;
   DMCXP.cdsCxP.DataRequest(Xsql);
   DMCXP.cdsCxP.open;

   if DMCXP.cdsCxP.Recordcount=0 then
   Begin
     Showmessage('No Existen Registros para la Consulta');
     Exit;
     screen.Cursor:=crdefault;
   End;

{
   06/11/2000 pjsv
   DMCXP.cdsMovCxP2.Filtered := False;
   DMCXP.cdsMovCxP2.Filter   := '';
   DMCXP.cdsMovCxP2.Filter   := xFiltroP1+xFiltroP2;
   DMCXP.cdsMovCxP2.Filtered := True;
}
   pprNLetras.Print;
end;


procedure TFToolRegLetras.pprNLetrasPreviewFormCreate(Sender: TObject);

begin
   pprNLetras.PreviewForm.WindowState:=WsMaximized;
//  TppViewer(pprNLetras.PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
end;

procedure TFToolRegLetras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMCXP.cdsMovCxP2.Filter:= '';
//JORGE : 28/01/2002
   DMCXP.cdsCxP.Filter:= '';

end;

procedure TFToolRegLetras.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;

end;

procedure TFToolRegLetras.ppVariable2Calc(Sender: TObject;
  var Value: Variant);
begin
{	if DMCXP.cdscXp.FieldByName('CPESTADO').AsString = 'E'  then
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
  ppVariable2.Visible := false ;}
end;

procedure TFToolRegLetras.ppVarEstadoCalc(Sender: TObject;
  var Value: Variant);
begin
{  if DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString = 'A' then
   begin
     ppVarEstado.Visible:=True;
     ppVarEstado.Text:= '  A       N       U       L       A       D       O   ';
     CamposVisibles(false);
   end
  else CamposVisibles(True);
 }
end;

procedure TFToolRegLetras.ppDBCalc3Calc(Sender: TObject);
begin
  if DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString = 'A' then
    ppdbtotext.Value := ppdbtotext.Value - ppdbtotext.FieldValue;

end;

procedure TFToolRegLetras.ppdbtotextCalc(Sender: TObject);
begin
  if DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString = 'A' then
    ppdbtotext.Value := ppdbtotext.Value - ppdbtotext.FieldValue;

end;

procedure TFToolRegLetras.ppdbtotlocCalc(Sender: TObject);
begin
  if DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString = 'A' then
    ppdbtotloc.Value := ppdbtotloc.Value - ppdbtotloc.FieldValue;

end;

procedure TFToolRegLetras.dblcTMonExit(Sender: TObject);
var
 xwhere : String;
begin
   xWhere:='TMonId='+''''+dblcTMon.Text+'''';
   edtTMon.Text:=BuscaQry('PrvTGE','TGE103','TMONDES, TMON_LOC',xWhere,'TMONDES');
   Screen.Cursor:=crDefault;
   if length(edtTMon.Text)=0 then
   begin
     ShowMessage('Falta Tipo de Moneda');
     dblcTMon.SetFocus;
     exit;
   end;
  	CargaPeriodo;

//	pnlDatos1.Enabled  :=False;
//	pnlDatos2.Enabled  :=True;

	rgOrden.ItemIndex := 0;
	rgOrden.SetFocus;
   rgOrdenClick(sender);

end;

procedure TFToolRegLetras.bbtnImprimeClick(Sender: TObject);
Var
	 flagFech:Boolean;
	 xsql : string;
begin
	 flagFech:=False;
//   rgOrden.OnClick(nil);
	 if edtCia.Text='' then raise exception.Create('Compañia no válida');
	 if edtTDoc.Text='' then raise exception.Create('Documento no válido');
	 if dblcTDiario.Text='' then raise exception.Create('Diario no válido');
	 if edtTMon.Text='' then raise exception.Create('Tipo de Moneda no válido');
//   if length(dbeAnoMM.Text)<>6 then raise exception.Create('Periodo no válido');
	 DMCXP.cdsCxP.close;
	 case rgOrden.ItemIndex of
	 0 : begin // No. de Registro
					if (dbeNoReg1.Text='') or (dbeNoReg2.Text='')
						 then raise exception.Create('Ingrese rango inferior y superior');
//					DMCXP.cdsCxP.IndexFieldNames:='CPNOREG';
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
			 xFiltroP2:=' AND (CXP301.CPFVCMTO>='+quotedstr(DateToStr(dbdtpFReg1.Date))
								 +' AND CXP301.CPFVCMTO<='+quotedstr(DateToStr(dbdtpFReg2.Date))+')';
			 end;
	 end;




	 // llena campos del archivo de impresion

	pprNLetras.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\CxPRegLetras.rtm' ;
	pprNLetras.template.LoadFromFile ;

	 pplblPeriodo.Caption:= xperiodo;
	 pplblCia.Caption      := edtCia.Text;
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


   xsql := '';
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    xSQL :=' SELECT TGE101.CIADES AS CIADESC, '+
           ' CXP301.PROVRUC,CXP301.CPFVCMTO,'+
           ' CXP301.CPFEMIS, CXP301.CPNOREG,CXP301.CPNODOC,CXP301.CPFREG,'+
           //cim  02/08/2002
           ' CXP301.TMONID,DAYS(CXP301.CPFVCMTO)-DAYS(CXP301.CPFEMIS) PLAZO,'+
           //*
           ' CASE WHEN CPESTADO <> ''A'' AND CPESTADO <> ''E'' THEN CXP301.CPTCAMPR ELSE CXP301.CPTCAMPR END CPTCAMPR,'+
           ' CASE WHEN CPESTADO <> ''A'' AND CPESTADO <> ''E'' THEN CXP301.CPMTOEXT ELSE 0 END CPMTOEXT,' +
           ' CASE WHEN CPESTADO <> ''A'' AND CPESTADO <> ''E'' THEN CXP301.CPMTOLOC ELSE 0 END CPMTOLOC,' +
           ' CASE WHEN CPESTADO <> ''A'' AND CPESTADO <> ''E'' THEN CXP301.CPMTOORI ELSE 0 END CPMTOORI,'+
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
           ' CPESTADO, TGE115.ESTDOCDES '+
           ' FROM CXP301, CNT201, TGE101, TGE115 ' +
           ' WHERE CXP301.CIAID='+quotedstr(dblcCia.text)+' AND CXP301.TDIARID ='+quotedstr(dblcTDiario.text)+
           ' AND CXP301.DOCID ='+quotedstr(dblcTDoc.text)+' AND CXP301.TMONID='+quotedstr(dblcTMon.text)+
           ' AND (CXP301.PROV = CNT201.AUXID AND CXP301.CLAUXID = CNT201.CLAUXID ) AND CPANOMES ='+quotedstr(xperiodo)+
           ' AND CXP301.CIAID = TGE101.CIAID AND CXP301.CPESTADO=TGE115.ESTDOCID  '+ xFiltroP2 ;
  end
  else
	if SRV_D = 'ORACLE' then
  begin
    xSQL :='SELECT TGE101.CIADES AS CIADESC, '+
           'CXP301.PROVRUC,CXP301.CPFVCMTO, '+
           'CXP301.CPFEMIS, CXP301.CPNOREG,CXP301.CPNODOC, '+
           //cim  02/08/2002
           ' CXP301.TMONID,0 PLAZO,'+
           //*
//  		     'DECODE(CPESTADO, ''E'', '''', DECODE(CPESTADO, ''A'','''' , CXP301.CPTCAMPR)) CPTCAMPR, '+
  		     'DECODE(CPESTADO, ''E'', CXP301.CPTCAMPR, DECODE(CPESTADO, ''A'', CXP301.CPTCAMPR, CXP301.CPTCAMPR)) CPTCAMPR, '+
{	  	     'DECODE(CPESTADO, ''E'', '''', DECODE(CPESTADO, ''A'', '''', CXP301.CPMTOEXT)) CPMTOEXT, '+
		       'DECODE(CPESTADO, ''E'', '''', DECODE(CPESTADO, ''A'', '''', CXP301.CPMTOLOC)) CPMTOLOC, '+
		       'DECODE(CPESTADO, ''E'', '''', DECODE(CPESTADO, ''A'', '''', CXP301.CPMTOORI)) CPMTOORI, '+}
	  	       'DECODE(CPESTADO, ''E'', 0, DECODE(CPESTADO, ''A'', 0, CXP301.CPMTOEXT)) CPMTOEXT, '+
		       'DECODE(CPESTADO, ''E'', 0, DECODE(CPESTADO, ''A'', 0, CXP301.CPMTOLOC)) CPMTOLOC, '+
		       'DECODE(CPESTADO, ''E'', 0, DECODE(CPESTADO, ''A'', 0, CXP301.CPMTOORI)) CPMTOORI, '+
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
           'CPESTADO, TGE115.ESTDOCDES '+
           'FROM CXP301, CNT201, TGE101 ' +
           'WHERE CXP301.CIAID='+quotedstr(dblcCia.text)+' AND CXP301.TDIARID ='+quotedstr(dblcTDiario.text)+
           ' AND CXP301.DOCID ='+quotedstr(dblcTDoc.text)+' AND CXP301.TMONID='+quotedstr(dblcTMon.text)+
           ' AND (CXP301.PROV = CNT201.AUXID AND CXP301.CLAUXID = CNT201.CLAUXID ) AND CPANOMES ='+quotedstr(xperiodo)+
           ' AND CXP301.CIAID = TGE101.CIAID AND CXP301.CPESTADO=TGE115.ESTDOCID '+ xFiltroP2 ;
	end;
   Fprincipal.GRegLetras.UsuarioSQL.Clear;
   Fprincipal.GRegLetras.FMant.wTabla:='VWCAJAREGLETRAS';
   Fprincipal.GRegLetras.UsuarioSQL.Add( XSQL );
   Fprincipal.GRegLetras.NewQuery;
   DMCXP.cdsCxP.close;
   DMCXP.cdsCxP.DataRequest(Xsql);
   DMCXP.cdsCxP.open;
   if DMCXP.cdsCxP.Recordcount=0 then
   Begin
     Showmessage('No Existen Registros para la Consulta');
     Exit;
     screen.Cursor:=crdefault;
   End;

{
   06/11/2000 pjsv
   DMCXP.cdsMovCxP2.Filtered := False;
   DMCXP.cdsMovCxP2.Filter   := '';
   DMCXP.cdsMovCxP2.Filter   := xFiltroP1+xFiltroP2;
   DMCXP.cdsMovCxP2.Filtered := True;
}
   pprNLetras.Print;
end;


procedure TFToolRegLetras.Timer1Timer(Sender: TObject);
begin
   FVariables.w_NombreForma := 'FToolRegLetras';
   if (DMCXP.wAdmin='G') or (DMCXP.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMCXP.AccesosUsuariosR( DMCXP.wModulo,DMCXP.wUsuario,'2',FToolRegLetras);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

end.
