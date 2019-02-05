unit CXP408;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ppBands, ppClass, ppStrtch, ppRegion, ppCtrls, ppVar,
  ppPrnabl, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppCache, ppDBPipe,
  Mask, wwdbedit, wwdblook, ExtCtrls, Spin, ppViewr, pptypes;

type
  TFDistribucion = class(TForm)
    pnlDatos1: TPanel;
    lblCia: TLabel;
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    ppdbDistribucion: TppDBPipeline;
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
    ppField60: TppField;
    ppField61: TppField;
    pprDistribucion: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel35: TppLabel;
    ppLabel37: TppLabel;
    pplblPeriodo: TppLabel;
    pplCia: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    bbtnOk: TBitBtn;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    seAno: TSpinEdit;
    seMes: TSpinEdit;
    ppLabel7: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel1: TppLabel;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine1: TppLine;
    Label5: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure pprDistribucionPreviewFormCreate(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    wMes : STring;
  public
    { Public declarations }
  end;

var
  FDistribucion: TFDistribucion;

implementation

uses CxPDM;

{$R *.DFM}

procedure TFDistribucion.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
  begin
   key:=#0;
   perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFDistribucion.FormActivate(Sender: TObject);
var
 anio,Mes,Dia : Word;
begin
 // calcula valor de periodo aaaamm tomando como base la fecha del sistema

  Filtracds( DMCXP.cdsTDiario,'SELECT * FROM TGE104 WHERE REGISTRO in(''4'',''C'')' );

   DecodeDate(date, Anio, Mes, Dia);
   wMes := inttostr(Mes);
   if Mes<10 then wMes := '0'+inttostr(Mes);
   seAno.value := Anio;
   seMes.Value := (Mes);
   dblcCia.SetFocus;

end;

procedure TFDistribucion.bbtnOkClick(Sender: TObject);
var
	xSQL,xSQL1 : String;
begin

   if (seAno.Value<=0) or (seMes.Value<=0) then
   begin
      ShowMessage('Falta Periodo');
      seAno.SetFocus;
      Exit;
   end;

   if length(edtTDiario.Text)=0 then
   begin
      ShowMessage('Falta Tipo de Diario');
      dblcTDiario.SetFocus;
      Exit;
   end;



  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
   xSql :=' select cpnoreg,'+
          //**  monto BASE
          ' CASE WHEN TMON_LOC = ''L'''+
          ' THEN CASE WHEN DOC_FREG = ''N'''+
          ' THEN CAST(((CASE WHEN SUBSTR(CAST((cpgravad2) AS CHAR(16)),'+
          ' POSSTR(CAST((cpgravad2) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (cpgravad2) + 0.01'+
          ' ELSE cpgravad2'+
          ' END) * -1) AS DECIMAL(15,2))'+
          ' ELSE  CAST((CASE WHEN SUBSTR(CAST((cpgravad2) AS CHAR(16)),'+
          ' POSSTR(CAST((cpgravad2) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (cpgravad2) + 0.01'+
          ' ELSE cpgravad2'+
          ' END) AS DECIMAL(15,2))'+
          ' END'+
          ' ELSE  CASE WHEN DOC_FREG = ''N'''+
          ' THEN CAST(((CASE WHEN SUBSTR(CAST((cpgravad2*CPTCAMPR) AS CHAR(16)),'+
          ' POSSTR(CAST((cpgravad2*CPTCAMPR) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (cpgravad2*CPTCAMPR) + 0.01'+
          ' ELSE cpgravad2*CPTCAMPR'+
          ' END) * -1) AS DECIMAL(15,2))'+
          ' ELSE CAST((CASE WHEN SUBSTR(CAST((cpgravad2*CPTCAMPR) AS CHAR(16)),'+
          ' POSSTR(CAST((cpgravad2*CPTCAMPR) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (cpgravad2*CPTCAMPR) + 0.01'+
          ' ELSE cpgravad2*CPTCAMPR'+
          ' END) AS DECIMAL(15,2))'+
          ' END'+
          ' END BASE,'+
          //** IGV
          ' CASE WHEN TMON_LOC = ''L'''+
          ' THEN CASE WHEN DOC_FREG = ''N'''+
          ' THEN CAST(((CASE WHEN SUBSTR(CAST((CPIGV2) AS CHAR(16)),'+
          ' POSSTR(CAST((CPIGV2) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (CPIGV2) + 0.01'+
          ' ELSE CPIGV2'+
          ' END) * -1) AS DECIMAL(15,2))'+
          ' ELSE CAST((CASE WHEN SUBSTR(CAST((CPIGV2) AS CHAR(16)),'+
          ' POSSTR(CAST((CPIGV2) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (CPIGV2) + 0.01'+
          ' ELSE CPIGV2'+
          ' END) AS DECIMAL(15,2))'+
          ' END'+
          ' ELSE CASE WHEN DOC_FREG = ''N'''+
          ' THEN CAST(((CASE WHEN SUBSTR(CAST((CPIGV2*CPTCAMPR) AS CHAR(16)),'+
          ' POSSTR(CAST((CPIGV2*CPTCAMPR) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (CPIGV2*CPTCAMPR) + 0.01'+
          ' ELSE CPIGV2*CPTCAMPR'+
          ' END) * -1) AS DECIMAL(15,2))'+
          ' ELSE CAST((CASE WHEN SUBSTR(CAST((CPIGV2*CPTCAMPR) AS CHAR(16)),'+
          ' POSSTR(CAST((CPIGV2*CPTCAMPR) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (CPIGV2*CPTCAMPR) + 0.01'+
          ' ELSE CPIGV2*CPTCAMPR'+
          ' END) AS DECIMAL(15,2))'+
          ' END'+
          ' END IGV,'+
          // PRECIO
          ' CASE WHEN TMON_LOC = ''L'''+
          ' THEN CAST((CASE WHEN SUBSTR(CAST((CPMTOORI) AS CHAR(16)),'+
          ' POSSTR(CAST((CPMTOORI) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (CPMTOORI) + 0.01'+
          ' ELSE CPMTOORI'+
          ' END) AS DECIMAL(15,2))'+
          ' ELSE CAST((CASE WHEN SUBSTR(CAST((CPMTOORI*CPTCAMPR) AS CHAR(16)),'+
          ' POSSTR(CAST((CPMTOORI*CPTCAMPR) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (CPMTOORI*CPTCAMPR) + 0.01'+
          ' ELSE CPMTOORI*CPTCAMPR'+
          ' END) AS DECIMAL(15,2))'+
          ' END PRECIO,'+
          //** PRECIO EN NEGATIVO
          ' CASE WHEN TMON_LOC = ''L'''+
          ' THEN CASE WHEN DOC_FREG = ''N'''+
          ' THEN CAST((CASE WHEN SUBSTR(CAST((CPMTOORI) AS CHAR(16)),'+
          ' POSSTR(CAST((CPMTOORI) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (CPMTOORI) + 0.01'+
          ' ELSE CPMTOORI'+
          ' END) AS DECIMAL(15,2)) * -1'+
          ' ELSE CAST((CASE WHEN SUBSTR(CAST((CPMTOORI) AS CHAR(16)),'+
          ' POSSTR(CAST((CPMTOORI) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (CPMTOORI) + 0.01'+
          ' ELSE CPMTOORI'+
          ' END) AS DECIMAL(15,2))'+
          ' END'+
          ' ELSE CASE WHEN DOC_FREG = ''N'''+
          ' THEN CAST((CASE WHEN SUBSTR(CAST((CPMTOORI*CPTCAMPR) AS CHAR(16)),'+
          ' POSSTR(CAST((CPMTOORI*CPTCAMPR) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (CPMTOORI*CPTCAMPR) + 0.01'+
          ' ELSE CPMTOORI*CPTCAMPR'+
          ' END) AS DECIMAL(15,2)) * -1'+
          ' ELSE CAST((CASE WHEN SUBSTR(CAST((CPMTOORI*CPTCAMPR) AS CHAR(16)),'+
          ' POSSTR(CAST((CPMTOORI*CPTCAMPR) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (CPMTOORI*CPTCAMPR) + 0.01'+
          ' ELSE CPMTOORI*CPTCAMPR'+
          ' END) AS DECIMAL(15,2))'+
          ' END'+
          ' END PRECION,'+
           //** TASA y FACTOR
          ' TASACAN TASA,FACTOR,';
           //** IGV PRORRATEADO
     xSql1 :=  ' CASE WHEN TMON_LOC = ''L'''+
          ' THEN CASE WHEN DOC_FREG = ''N'''+
          ' THEN CAST(((CASE WHEN SUBSTR(CAST((CPIGV2*FACTOR) AS CHAR(16)),'+
          ' POSSTR(CAST((CPIGV2*FACTOR) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (CPIGV2*FACTOR) + 0.01'+
          ' ELSE CPIGV2*FACTOR'+
          ' END))*-1 AS DECIMAL(15,2))'+
          ' ELSE CAST( (CASE WHEN SUBSTR(CAST((CPIGV2*FACTOR) AS CHAR(16)),'+
          ' POSSTR(CAST((CPIGV2*FACTOR) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (CPIGV2*FACTOR) + 0.01'+
          ' ELSE CPIGV2*FACTOR'+
          ' END)  AS DECIMAL(15,2))'+
          ' END'+
          ' ELSE CASE WHEN DOC_FREG = ''N'''+
          ' THEN CAST((( CASE WHEN SUBSTR(CAST(((CPIGV2*CPTCAMPR)*FACTOR) AS CHAR(16)),'+
          ' POSSTR(CAST(((CPIGV2*CPTCAMPR)*FACTOR) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN ((CPIGV2*CPTCAMPR)*FACTOR) + 0.01'+
          ' ELSE (CPIGV2*CPTCAMPR)*FACTOR'+
          ' END))*-1 AS DECIMAL(15,2))'+
          ' ELSE CAST((CASE WHEN SUBSTR(CAST(((CPIGV2*CPTCAMPR)*FACTOR) AS CHAR(16)),'+
          ' POSSTR(CAST(((CPIGV2*CPTCAMPR)*FACTOR) AS CHAR(16)),''.'')+3,1)  >= ''5'''+
          ' THEN ((CPIGV2*CPTCAMPR)*FACTOR) + 0.01'+
          ' ELSE (CPIGV2*CPTCAMPR)*FACTOR'+
          ' END) AS DECIMAL(15,2))'+
          ' END'+
          ' END IGVP,'+
          //** DIFERENCIA DE IGV
          ' CASE WHEN TMON_LOC = ''L'''+
          ' THEN CASE WHEN DOC_FREG = ''N'''+
          ' THEN CAST(((CASE WHEN SUBSTR(CAST((CPIGV2- (CPIGV2*FACTOR)) AS CHAR(16)),'+
          ' POSSTR(CAST((CPIGV2- (CPIGV2*FACTOR)) AS'+
          ' CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (CPIGV2- (CPIGV2*FACTOR)) + 0.01'+
          ' ELSE (CPIGV2- (CPIGV2*FACTOR))'+
          ' END))*-1 AS DECIMAL(15,2))'+
          ' ELSE CAST((CASE WHEN SUBSTR(CAST((CPIGV2- (CPIGV2*FACTOR)) AS CHAR(16)),'+
          ' POSSTR(CAST((CPIGV2- (CPIGV2*FACTOR)) AS'+
          ' CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN (CPIGV2- (CPIGV2*FACTOR)) + 0.01'+
          ' ELSE (CPIGV2- (CPIGV2*FACTOR))'+
          ' END) AS DECIMAL(15,2))'+
          ' END'+
          ' ELSE CASE WHEN DOC_FREG = ''N'''+
          ' THEN CAST(((CASE WHEN SUBSTR(CAST( ((CPIGV2 *CPTCAMPR) -((CPIGV2*CPTCAMPR)*FACTOR) ) AS CHAR(16)), POSSTR(CAST( ((CPIGV2*CPTCAMPR)- ((CPIGV2*CPTCAMPR)*FACTOR)) AS'+
          ' CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN ((CPIGV2*CPTCAMPR)-((CPIGV2*CPTCAMPR)*FACTOR)) + 0.01'+
          ' ELSE (CPIGV2*CPTCAMPR)-((CPIGV2*CPTCAMPR)*FACTOR)'+
          ' END))*-1 AS DECIMAL(15,2))'+
          ' ELSE CAST((CASE WHEN SUBSTR(CAST(((CPIGV2*CPTCAMPR)-((CPIGV2*CPTCAMPR)*FACTOR)) AS CHAR(16)),'+
          ' POSSTR(CAST(((CPIGV2*CPTCAMPR)-((CPIGV2*CPTCAMPR)*FACTOR)) AS CHAR(16)),''.'')+3,1) >= ''5'''+
          ' THEN ((CPIGV2*CPTCAMPR)-((CPIGV2*CPTCAMPR)*FACTOR)) + 0.01'+
          ' ELSE ((CPIGV2*CPTCAMPR)-((CPIGV2*CPTCAMPR)*FACTOR))'+
          ' END) AS DECIMAL(15,2))'+
          ' END'+
          ' END DIFE,'+
          //** NO GRAVADO
          ' CPNOGRAV'+
          ' from cxp301'+
          ' left join TGE110 on (TGE110.DOCID=CXP301.DOCID and DOCMOD=''CXP'')'+
          ' LEFT JOIN TGE103 ON (TGE103.TMONID= CXP301.TMONID)'+
          ' left join TGE108 on (TASAABR=''I.G.V.'')'+
          ' left join CXP307 on (CXP307.CIAID= '+quotedstr(dblcCia.Text)+' and CCANOMES='+quotedstr(seAno.text+strzero(seMes.text,2))+')'+
          ' where cpanomes='+quotedstr(seAno.text+strzero(seMes.text,2))+' and'+
          ' (cpgravad2 <> 0) and CXP301.tdiarid=''32'' and cpestado <> ''E'' order by cpnoreg';

		xSQL:= 'SELECT CPNOREG, '+
           '''HNY'' BASE, '+
           '''HNY'' IGV, '+
           '''HNY'' PRECIO, '+
           '''HNY'' PRECION, '+
           'TASACAN TASA, FACTOR, '+
           '''HNY'' IGVP, '+
           '''HNY'' DIFE, '+
           'CPNOGRAV ';
		xSQL1:='FROM CXP301, TGE110, TGE103, TGE108, CXP307 '+
           'WHERE CPANOMES='+quotedstr(seAno.text+strzero(seMes.text,2))+' '+
           'AND CPGRAVAD2 <> 0 '+
           'AND CXP301.TDIARID='''+dblcTDiario.Text+''' '+
           'AND CXP301.CPESTADO<>''E'' '+
           'AND TGE110.DOCID=CXP301.DOCID '+
           'AND DOCMOD=''CXP'' '+
           'AND TGE103.TMONID= CXP301.TMONID '+
           'AND TASAABR=''I.G.V.'' '+
           'AND CXP307.CIAID= '+quotedstr(dblcCia.Text)+' '+
           'AND CCANOMES='+quotedstr(seAno.text+strzero(seMes.text,2))+' '+
           'ORDER BY CPNOREG ';

  end
  else
  if SRV_D = 'ORACLE' then
  begin
		xSQL:= 'SELECT CPNOREG, '+
           '''HNY'' BASE, '+
           '''HNY'' IGV, '+
           '''HNY'' PRECIO, '+
           '''HNY'' PRECION, '+
           'TASACAN TASA, FACTOR, '+
           '''HNY'' IGVP, '+
           '''HNY'' DIFE, '+
           'CPNOGRAV ';
		xSQL1:='FROM CXP301, TGE110, TGE103, TGE108, CXP307 '+
           'WHERE CPANOMES='+quotedstr(seAno.text+strzero(seMes.text,2))+' '+
           'AND CPGRAVAD2 <> 0 '+
           'AND CXP301.TDIARID='''+dblcTDiario.Text+''' '+
           'AND CXP301.CPESTADO<>''E'' '+
           'AND TGE110.DOCID=CXP301.DOCID '+
           'AND DOCMOD=''CXP'' '+
           'AND TGE103.TMONID= CXP301.TMONID '+
           'AND TASAABR=''I.G.V.'' '+
           'AND CXP307.CIAID= '+quotedstr(dblcCia.Text)+' '+
           'AND CCANOMES='+quotedstr(seAno.text+strzero(seMes.text,2))+' '+
           'ORDER BY CPNOREG ';
	end;

  DMCXP.cdsCXP.Close;
  DMCXP.cdsCXP.DataRequest(xSQL+xSQL1);
  DMCXP.cdsCXP.Open;
  ppdbDistribucion.DataSource := DMCXP.dsCxP;
  pprDistribucion.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\Distribucion.rtm' ;
  pprDistribucion.template.LoadFromFile ;

  pplCia.Caption   := edtCia.text ;
  pplblPeriodo.caption := seAno.text + strzero(seMes.Text,2);// dbeAnoMM.text;
  pprDistribucion.Print;
  pprDistribucion.Stop;
  ppdbDistribucion.DataSource := nil ;
end;

procedure TFDistribucion.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CIAID',dblcCia.Text);

   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Compañía no existe');
      dblcCia.Text:='';
      dblcCia.SetFocus;
   end;
end;

procedure TFDistribucion.pprDistribucionPreviewFormCreate(Sender: TObject);
begin
  pprDistribucion.PreviewForm.ClientHeight := 500;
  pprDistribucion.PreviewForm.ClientWidth := 650;			// ppViewr
  tppviewer(pprDistribucion.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFDistribucion.dblcTDiarioExit(Sender: TObject);
begin

   edtTDiario.Text:=DMCXP.DisplayDescrip('TGE104','TDiarDES','TDiarID',dblcTDiario.Text);

end;

procedure TFDistribucion.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.
