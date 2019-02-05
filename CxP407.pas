unit CxP407;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Wwdbdlg, wwdbdatetimepicker, Mask, wwdbedit,
  wwdblook, Buttons, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache,
  ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, ppViewr, pptypes;

type
  TFIngDia = class(TForm)
    pnlRegComp: TPanel;
    bbtnOk: TBitBtn;
    pnlDatos1: TPanel;
    lblCia: TLabel;
    lblDiario: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    pnlDatos2: TPanel;
    rgOrden: TRadioGroup;
    pprptData: TppReport;
    ppdbpData: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    pplblProv: TppLabel;
    pplblSoles: TppLabel;
    ppLine2: TppLine;
    pplblDolar: TppLabel;
    pplTitulo: TppLabel;
    ppDescri: TppLabel;
    pplblNRegistro: TppLabel;
    pplblDoc: TppLabel;
    pplblTipDoc: TppLabel;
    ppFechas: TppLabel;
    pplblPag: TppLabel;
    svPag: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppdbReg: TppDBText;
    ppdbtTipDoc: TppDBText;
    ppDBText5: TppDBText;
    ppVariable2: TppVariable;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel17: TppLabel;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppDBCalc3: TppDBCalc;
    ppLabel26: TppLabel;
    pplblCia: TppLabel;
    pplvlCXP: TppLabel;
    pplblCuenta: TppLabel;
    pplblCC: TppLabel;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    pplblFecha: TppLabel;
    svFecha: TppSystemVariable;
    ppDBText2: TppDBText;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnOkClick(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pprptDataPreviewFormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIngDia: TFIngDia;

implementation

uses CxPDM;

{$R *.DFM}

procedure TFIngDia.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFIngDia.bbtnOkClick(Sender: TObject);
Var
   flagFech: Boolean;
   xEstado, xSql : String;
begin
	if edtCia.Text='' then raise exception.Create('Compañia no válida');
  if dblcTDiario.Text='' then raise exception.Create('Diario no válido');

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    xSql:='Select A.CPNOREG,A.CPNODOC,A.PROV,A.PROVDES,A.CPMTOLOC,A.CPMTOEXT,'+
          'B.DOCABR,C.DCPGLOSA,D.CUENTAID,D.CCOSID'+
          ' From CXP301 A'+
          ' LEFT JOIN TGE110 B ON (A.DOCID=B.DOCID AND DOCMOD='+quotedstr('CXP')+')'+
          ' LEFT JOIN (SELECT C.CIAID,C.TDIARID,C.CPNOREG,MIN(C.DCPGLOSA) DCPGLOSA'+
          ' FROM CXP302 C WHERE TREGID=''MG'' OR TREGID=''MN'' OR TREGID=''NG'''+
          ' GROUP BY C.CIAID,C.TDIARID,C.CPNOREG)'+
          ' AS C ON (C.CIAID  = A.CIAID AND A.TDIARID= C.TDIARID AND A.CPNOREG= C.CPNOREG )'+
          ' LEFT JOIN (SELECT D.CIAID,D.TDIARID,'+
          ' D.CPNOREG,MIN(DCPGLOSA) DCPGLOSA,MIN(D.CUENTAID) CUENTAID,'+
          ' MIN(D.CCOSID) CCOSID FROM CXP302 D WHERE  TREGID=''01'' OR'+
          ' TREGID=''02'' OR TREGID=''10'''+
          ' GROUP BY D.CPNOREG,D.CIAID,D.TDIARID ) AS D ON'+
          ' (D.CIAID  = C.CIAID AND D.TDIARID= C.TDIARID AND D.CPNOREG= C.CPNOREG)'+
//          ' LEFT JOIN CXP302 C ON (A.CIAID=C.CIAID AND A.TDIARID=C.TDIARID AND A.CPNOREG=C.CPNOREG'+
//          ' AND A.CPANOMES=C.DCPANOMM AND A.CPNODOC=C.CPNODOC AND A.PROV=C.DCPAUXID'+
//          ' AND (C.TIPDET <> ''I1'' AND C.TIPDET <> ''I2'' AND C.TIPDET <> ''I3'' AND '+
//          ' C.TIPDET <> ''DS'' AND C.TIPDET <> ''TO''))'+
          ' WHERE (A.CPESTADO=''I'' OR A.CPESTADO=''P'' OR A.CPESTADO=''C'')'+
          ' AND A.CPFREG='+DMCXP.wRepFuncDate+''''+FORMATDATETIME(DMCXP.wFormatFecha,now)+''''+')'+
          ' AND A.TDIARID='+quotedstr(dblcTDiario.text);
  end
	else
  if SRV_D = 'ORACLE' then
  begin
  	xSQL:='SELECT A.CPNOREG, A.CPNODOC, A.PROV, A.PROVDES, A.CPMTOLOC, A.CPMTOEXT, B.DOCABR, C.DCPGLOSA, '+
          'D.CUENTAID, D.CCOSID '+
          'FROM CXP301 A, TGE110 B, '+
          '(SELECT C.CIAID, C.TDIARID, C.CPNOREG, MIN(C.DCPGLOSA) DCPGLOSA '+
          'FROM CXP302 C '+
          'WHERE TREGID=''MG'' OR TREGID=''MN'' OR TREGID=''NG'' '+
          'GROUP BY C.CIAID, C.TDIARID, C.CPNOREG)  C, '+
          '(SELECT  D.CIAID,D.TDIARID, D.CPNOREG,MIN(DCPGLOSA) DCPGLOSA,MIN(D.CUENTAID) CUENTAID, '+
          'MIN(D.CCOSID) CCOSID '+
          'FROM CXP302 D '+
          'WHERE  TREGID=''01'' OR TREGID=''02'' OR TREGID=''10'' '+
          'GROUP BY D.CPNOREG, D.CIAID, D.TDIARID) D '+
          'WHERE (A.CPESTADO=''I'' OR A.CPESTADO=''P'' OR A.CPESTADO=''C'') '+
          'AND A.CPFREG=TO_DATE('+''''+FORMATDATETIME(DMCXP.wFormatFecha,now)+''''+')'+
          'AND A.TDIARID='+quotedstr(dblcTDiario.text)+
          'AND A.DOCID=B.DOCID(+) '+
          'AND DOCMOD(+)=''CXP'' '+
          'AND C.CIAID  = A.CIAID '+
          'AND A.TDIARID= C.TDIARID '+
          'AND A.CPNOREG= C.CPNOREG '+
          'AND D.CIAID  = C.CIAID '+
          'AND D.TDIARID= C.TDIARID '+
          'AND D.CPNOREG= C.CPNOREG ';
  end;
  case rgOrden.ItemIndex of
      0 : xSql := xSql + ' ORDER BY A.CPNOREG';
      1 : xSql := xSql + ' ORDER BY A.PROV';
  end;
  DMCXP.cdsCXP.Close;

  DMCXP.cdsCXP.DataRequest(xSQL);
  DMCXP.cdsCXP.Open;
  ppdbpData.DataSource := DMCXP.dsCxp;
  pprptData.template.fileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\CXPIngresoDiarioInt.rtm' ;
  pprptData.template.LoadFromFile;
  pplblCia.Caption      :=edtCia.Text;

  pprptData.Print;
end;

procedure TFIngDia.dblcCiaExit(Sender: TObject);
begin
  edtCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);
  if length(edtCia.Text)=0 then
   begin
    ShowMessage('Falta Código de Compañía');
    dblcCia.SetFocus;
   end;
end;

procedure TFIngDia.dblcTDiarioExit(Sender: TObject);
begin
 edtTDiario.Text:=DMCXP.DisplayDescrip('TGE104','TDiarDES','TDiarID',dblcTDiario.Text);
 if length(edtTDiario.Text)=0 then
  begin
   ShowMessage('Falta Tipo de Diario');
   dblcTDiario.SetFocus;
  end;
end;

procedure TFIngDia.FormActivate(Sender: TObject);
begin
  DMCXP.cdsTDiario.Filter := 'REGISTRO=''C''';
  DMCXP.cdsTDiario.Filtered := true;
end;

procedure TFIngDia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMCXP.cdsTDiario.Filter := '';
  DMCXP.cdsTDiario.Filtered := true;
end;

procedure TFIngDia.pprptDataPreviewFormCreate(Sender: TObject);
begin
  pprptData.PreviewForm.ClientHeight := 500;
  pprptData.PreviewForm.ClientWidth := 650;			//
  tppviewer(pprptData.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFIngDia.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.
