unit CXP803;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdbdlg, wwdbdatetimepicker, Mask, wwdbedit, StdCtrls, wwdblook, Buttons,
  ExtCtrls, Wwdotdot, Wwdbcomb, ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppCache, ppDB, ppDBPipe, ppVar, ppPrnabl, ppCtrls, ppBands,
  ppSubRpt, ppStrtch, ppRegion, oaVariables;

type
  TFToolCCProv = class(TForm)
    pnlTool: TPanel;
    sbEjecuta: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label11: TLabel;
    Label1: TLabel;
    dbeCIA: TwwDBEdit;
    dtpFecha: TwwDBDateTimePicker;
    Label2: TLabel;
    dbeProv: TwwDBEdit;
    dbeCiaCod: TwwDBEdit;
    dbeProvCod: TwwDBEdit;
    bbtnTodos: TBitBtn;
    bbtnLetras: TBitBtn;
    bbtnProvision: TBitBtn;
    bbtnAnticipo: TBitBtn;
    bbtnNotCredito: TBitBtn;
    GroupBox1: TGroupBox;
    dbesaltotmn: TwwDBEdit;
    dbesaltotme: TwwDBEdit;
    dbesalactme: TwwDBEdit;
    dbesalactmn: TwwDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    GrEstados: TGroupBox;
    RbTodos: TRadioButton;
    RbPendientes: TRadioButton;
    RbCancelados: TRadioButton;
    ppdbCab: TppDBPipeline;
    ppdbDet: TppDBPipeline;
    pprReporte: TppReport;
    BitBtn1: TBitBtn;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    pplblCiades: TppLabel;
    ppRegion1: TppRegion;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    ppLabel7: TppLabel;
    ppDBText4: TppDBText;
    ppLabel8: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText10: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDBText11: TppDBText;
    ppLabel16: TppLabel;
    ppShape1: TppShape;
    ppLabel17: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBCalc2: TppDBCalc;
    ppLabel20: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppLabel21: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    Timer1: TTimer;
    procedure sbEjecutaClick(Sender: TObject);
    procedure bbtnTodosClick(Sender: TObject);
    procedure bbtnLetrasClick(Sender: TObject);
    procedure bbtnProvisionClick(Sender: TObject);
    procedure bbtnNotCreditoClick(Sender: TObject);
    procedure bbtnAnticipoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RbTodosClick(Sender: TObject);
    procedure RbPendientesClick(Sender: TObject);
    procedure RbCanceladosClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FToolCCProv: TFToolCCProv;
   xestadocxp : String;
   xAccesoBotones : Boolean;
implementation

uses CxPDM, CXP802, CxP001;

{$R *.DFM}

procedure TFToolCCProv.sbEjecutaClick(Sender: TObject);
var
  xSQL : String;
begin

   if length(dtpFecha.text)=0 then
   begin
    showmessage('Falta la fecha');
    dtpFecha.setfocus;
    Exit;
   end;
   screen.Cursor:=crHourglass;
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, CXP.CPSALEXT, '
        +  'MON.TMON_LOC, MON.TMONABR,  CXP.CPMTOORI, '
        +  'PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '
        +  'COALESCE(CXP.CPMTOLOC,0)-COALESCE(CXP.CPPAGLOC,0) AS CPSALLOC, '
        +  'COALESCE(CXP.CPMTOEXT,0)-COALESCE(CXP.CPPAGEXT,0) AS CPSALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT ELSE 0 END) AS PAGEXT '
        +'FROM CXP301 CXP '
        +  'LEFT JOIN TGE103 MON ON (CXP.TMONID=MON.TMONID) '
        +  'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD=''CXP''), TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
        + ' AND ( CPESTADO = ''P'' ) '
        + ' AND (CXP.CPFEMIS>=DATE(''2001-08-31'')) '
        + ' AND  DOCMOD=''CXP'' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text
        + ''' AND CXP.CPFEMIS<='''+dtpFecha.text+'''';
   end;
   if (SRV_D = 'ORACLE') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, CXP.CPSALEXT, '
        +  'MON.TMON_LOC, MON.TMONABR,  CXP.CPMTOORI, '
        +  'PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '
        +  'NVL(CXP.CPMTOLOC,0)-NVL(CXP.CPPAGLOC,0) AS CPSALLOC1, '
        +  'NVL(CXP.CPMTOEXT,0)-NVL(CXP.CPPAGEXT,0) AS CPSALEXT1, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT ELSE 0 END) AS PAGEXT '
        +'FROM CXP301 CXP, TGE103 MON, TGE110 DOC , TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
        + ' AND ( CPESTADO = ''P'' ) '
        + ' AND (CXP.CPFEMIS>=TO_DATE(''31-08-2001'')) '
        + ' AND  DOCMOD=''CXP'' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.TMONID=MON.TMONID(+) AND CXP.DOCID=DOC.DOCID(+) AND DOC.DOCMOD=''CXP'''
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text
        + ''' AND CXP.CPFEMIS<='''+dtpFecha.text+'''';
    end;

   Fprincipal.GCCProv.UsuarioSQL.Clear;
   Fprincipal.GCCProv.UsuarioSQL.Add(xSQL);
   Fprincipal.GCCProv.NewQuery;
   if Fprincipal.GCCProv.FMant.cds2.RecordCount=0 then
   begin
     Showmessage('No Existen Registros para la Consulta');
     screen.Cursor:=crDefault;
     Exit;
   end;
   screen.Cursor:=crDefault;

end;

procedure TFToolCCProv.bbtnTodosClick(Sender: TObject);
var
 xSQL : String;
begin
   if length(dtpFecha.text)=0 then
   begin
    showmessage('Falta la fecha');
    dtpFecha.setfocus;
    Exit;
   end;
   screen.Cursor:=crHourglass;
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, CXP.CPSALEXT, '
        +  'MON.TMON_LOC, MON.TMONABR,  CXP.CPMTOORI, '
        +  'PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '
        +  'COALESCE(CXP.CPMTOLOC,0)-COALESCE(CXP.CPPAGLOC,0) AS CPSALLOC, '
        +  'COALESCE(CXP.CPMTOEXT,0)-COALESCE(CXP.CPPAGEXT,0) AS CPSALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT ELSE 0 END) AS PAGEXT '
        +'FROM CXP301 CXP '
        +  'LEFT JOIN TGE103 MON ON (CXP.TMONID=MON.TMONID) '
        +  'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD=''CXP''), TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
//        + ' AND ( CPESTADO = ''P'' ) '
        + ' AND ( '+xestadocxp+' ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, dtpFecha.Date )+''' ) ) '
        + ' AND  DOCMOD=''CXP'' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text+'''';
   end;
   if (SRV_D = 'ORACLE') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, CXP.CPSALEXT, '
        +  'MON.TMON_LOC, MON.TMONABR,  CXP.CPMTOORI, '
        +  'PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '
        +  'NVL(CXP.CPMTOLOC,0)-NVL(CXP.CPPAGLOC,0) AS CPSALLOC1, '
        +  'NVL(CXP.CPMTOEXT,0)-NVL(CXP.CPPAGEXT,0) AS CPSALEXT1, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT ELSE 0 END) AS PAGEXT '
        +'FROM CXP301 CXP, TGE103 MON, TGE110 DOC , TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
//        + ' AND ( CPESTADO = ''P'' ) '
        + ' AND ( '+xestadocxp+' ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, dtpFecha.Date )+''' ) ) '
        + ' AND  DOCMOD=''CXP'' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.TMONID=MON.TMONID(+) AND CXP.DOCID=DOC.DOCID(+) AND DOC.DOCMOD=''CXP'''
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text+'''';
    end;

   Fprincipal.GCCProv.UsuarioSQL.Clear;
   Fprincipal.GCCProv.UsuarioSQL.Add(xSQL);
   Fprincipal.GCCProv.NewQuery;
   if Fprincipal.GCCProv.FMant.cds2.RecordCount=0 then
   begin
     Showmessage('No Existen Registros para la Consulta');
     screen.Cursor:=crDefault;
     Exit;
   end;
   screen.Cursor:=crDefault;


end;

procedure TFToolCCProv.bbtnLetrasClick(Sender: TObject);
var
 xSQL : String;
begin
   if length(dtpFecha.text)=0 then
   begin
    showmessage('Falta la fecha');
    dtpFecha.setfocus;
    Exit;
   end;
   screen.Cursor:=crHourglass;
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, CXP.CPSALEXT, '
        +  'MON.TMON_LOC, MON.TMONABR,  CXP.CPMTOORI, '
        +  'PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '
        +  'COALESCE(CXP.CPMTOLOC,0)-COALESCE(CXP.CPPAGLOC,0) AS CPSALLOC, '
        +  'COALESCE(CXP.CPMTOEXT,0)-COALESCE(CXP.CPPAGEXT,0) AS CPSALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT ELSE 0 END) AS PAGEXT '
        +'FROM CXP301 CXP '
        +  'LEFT JOIN TGE103 MON ON (CXP.TMONID=MON.TMONID) '
        +  'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD=''CXP''), TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
//        + ' AND ( CPESTADO = ''P'' ) '
        + ' AND ( '+xestadocxp+' ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, dtpFecha.Date )+''' ) ) '
        + ' AND  DOCMOD=''CXP'' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text
        + '''  AND  DOC.DOC_FREG=''L''';
   end;
   if (SRV_D = 'ORACLE') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, CXP.CPSALEXT, '
        +  'MON.TMON_LOC, MON.TMONABR,  CXP.CPMTOORI, '
        +  'PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '
        +  'NVL(CXP.CPMTOLOC,0)-NVL(CXP.CPPAGLOC,0) AS CPSALLOC1, '
        +  'NVL(CXP.CPMTOEXT,0)-NVL(CXP.CPPAGEXT,0) AS CPSALEXT1, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT ELSE 0 END) AS PAGEXT '
        +'FROM CXP301 CXP, TGE103 MON, TGE110 DOC , TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
//        + ' AND ( CPESTADO = ''P'' ) '
        + ' AND ( '+xestadocxp+' ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, dtpFecha.Date )+''' ) ) '
        + ' AND  DOCMOD=''CXP'' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.TMONID=MON.TMONID(+) AND CXP.DOCID=DOC.DOCID(+) AND DOC.DOCMOD=''CXP'''
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text
        + ''' AND  DOC.DOC_FREG=''L''';
    end;

   Fprincipal.GCCProv.UsuarioSQL.Clear;
   Fprincipal.GCCProv.UsuarioSQL.Add(xSQL);
   Fprincipal.GCCProv.NewQuery;
   if Fprincipal.GCCProv.FMant.cds2.RecordCount=0 then
   begin
     Showmessage('No Existen Registros para la Consulta');
     screen.Cursor:=crDefault;
     Exit;
   end;
   screen.Cursor:=crDefault;


end;

procedure TFToolCCProv.bbtnProvisionClick(Sender: TObject);
var
  xSQL : String;
begin
   if length(dtpFecha.text)=0 then
   begin
    showmessage('Falta la fecha');
    dtpFecha.setfocus;
    Exit;
   end;
   screen.Cursor:=crHourglass;
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, CXP.CPSALEXT, '
        +  'MON.TMON_LOC, MON.TMONABR,  CXP.CPMTOORI, '
        +  'PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '
        +  'COALESCE(CXP.CPMTOLOC,0)-COALESCE(CXP.CPPAGLOC,0) AS CPSALLOC, '
        +  'COALESCE(CXP.CPMTOEXT,0)-COALESCE(CXP.CPPAGEXT,0) AS CPSALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT ELSE 0 END) AS PAGEXT '
        +'FROM CXP301 CXP '
        +  'LEFT JOIN TGE103 MON ON (CXP.TMONID=MON.TMONID) '
        +  'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD=''CXP''), TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
//        + ' AND ( CPESTADO = ''P'' ) '
        + ' AND ( '+xestadocxp+' ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, dtpFecha.Date )+''' ) ) '
        + ' AND  DOCMOD=''CXP'' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text+''''
        +'  AND (DOC.DOC_FREG=''P'' AND COALESCE(DOC.DOCTIPREG,''X'')<>''NC'') ';

   end;
   if (SRV_D = 'ORACLE') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, CXP.CPSALEXT, '
        +  'MON.TMON_LOC, MON.TMONABR,  CXP.CPMTOORI, '
        +  'PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '
        +  'NVL(CXP.CPMTOLOC,0)-NVL(CXP.CPPAGLOC,0) AS CPSALLOC1, '
        +  'NVL(CXP.CPMTOEXT,0)-NVL(CXP.CPPAGEXT,0) AS CPSALEXT1, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT ELSE 0 END) AS PAGEXT '
        +'FROM CXP301 CXP, TGE103 MON, TGE110 DOC , TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
//        + ' AND ( CPESTADO = ''P'' ) '
        + ' AND ( '+xestadocxp+' ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, dtpFecha.Date )+''' ) ) '
        + ' AND  DOCMOD=''CXP'' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.TMONID=MON.TMONID(+) AND CXP.DOCID=DOC.DOCID(+) AND DOC.DOCMOD=''CXP'''
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text+''''
        + ' AND (DOC.DOC_FREG=''P'' AND NVL(DOC.DOCTIPREG,''X'')<>''NC'') ';
    end;
//
   Fprincipal.GCCProv.UsuarioSQL.Clear;
   Fprincipal.GCCProv.UsuarioSQL.Add(xSQL);
   Fprincipal.GCCProv.NewQuery;
   if Fprincipal.GCCProv.FMant.cds2.RecordCount=0 then
   begin
     Showmessage('No Existen Registros para la Consulta');
     screen.Cursor:=crDefault;
     Exit;
   end;
   screen.Cursor:=crDefault;



end;

procedure TFToolCCProv.bbtnNotCreditoClick(Sender: TObject);
var
 xSQL : String;
begin
   if length(dtpFecha.text)=0 then
   begin
    showmessage('Falta la fecha');
    dtpFecha.setfocus;
    Exit;
   end;
   screen.Cursor:=crHourglass;
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, CXP.CPSALEXT, '
        +  'MON.TMON_LOC, MON.TMONABR,  CXP.CPMTOORI, '
        +  'PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '
        +  'COALESCE(CXP.CPMTOLOC,0)-COALESCE(CXP.CPPAGLOC,0) AS CPSALLOC, '
        +  'COALESCE(CXP.CPMTOEXT,0)-COALESCE(CXP.CPPAGEXT,0) AS CPSALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT ELSE 0 END) AS PAGEXT '
        +'FROM CXP301 CXP '
        +  'LEFT JOIN TGE103 MON ON (CXP.TMONID=MON.TMONID) '
        +  'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD=''CXP''), TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
//        + ' AND ( CPESTADO = ''P'' ) '
        + ' AND ( '+xestadocxp+' ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, dtpFecha.Date )+''' ) ) '
        + ' AND  DOCMOD=''CXP'' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text+''''
        + ' AND DOC.DOC_FREG=''N''';
   end;
   if (SRV_D = 'ORACLE') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, CXP.CPSALEXT, '
        +  'MON.TMON_LOC, MON.TMONABR,  CXP.CPMTOORI, '
        +  'PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '
        +  'NVL(CXP.CPMTOLOC,0)-NVL(CXP.CPPAGLOC,0) AS CPSALLOC1, '
        +  'NVL(CXP.CPMTOEXT,0)-NVL(CXP.CPPAGEXT,0) AS CPSALEXT1, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT ELSE 0 END) AS PAGEXT '
        +'FROM CXP301 CXP, TGE103 MON, TGE110 DOC , TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
//        + ' AND ( CPESTADO = ''P'' ) '
        + ' AND ( '+xestadocxp+' ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, dtpFecha.Date )+''' ) ) '
        + ' AND  DOCMOD=''CXP'' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.TMONID=MON.TMONID(+) AND CXP.DOCID=DOC.DOCID(+) AND DOC.DOCMOD=''CXP'''
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text+''''
        + ' AND DOC.DOC_FREG=''N''';
    end;

   Fprincipal.GCCProv.UsuarioSQL.Clear;
   Fprincipal.GCCProv.UsuarioSQL.Add(xSQL);
   Fprincipal.GCCProv.NewQuery;
   if Fprincipal.GCCProv.FMant.cds2.RecordCount=0 then
   begin
     Showmessage('No Existen Registros para la Consulta');
     screen.Cursor:=crDefault;
     Exit;
   end;
   screen.Cursor:=crDefault;



end;

procedure TFToolCCProv.bbtnAnticipoClick(Sender: TObject);
var
  xSQL : String;
begin
   if length(dtpFecha.text)=0 then
   begin
    showmessage('Falta la fecha');
    dtpFecha.setfocus;
    Exit;
   end;
   screen.Cursor:=crHourglass;
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, CXP.CPSALEXT, '
        +  'MON.TMON_LOC, MON.TMONABR,  CXP.CPMTOORI, '
        +  'PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '
        +  'COALESCE(CXP.CPMTOLOC,0)-COALESCE(CXP.CPPAGLOC,0) AS CPSALLOC, '
        +  'COALESCE(CXP.CPMTOEXT,0)-COALESCE(CXP.CPPAGEXT,0) AS CPSALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT ELSE 0 END) AS PAGEXT '
        +'FROM CXP301 CXP '
        +  'LEFT JOIN TGE103 MON ON (CXP.TMONID=MON.TMONID) '
        +  'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD=''CXP''), TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
        + ' AND ( CPESTADO = ''P'' ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, dtpFecha.Date )+''' ) ) '
//        + ' AND  DOCMOD=''CXP'' '
        + ' AND ( '+xestadocxp+' ) '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text+''''
        + ' AND (DOC.DOC_FREG=''P'' AND COALESCE(DOC.DOCTIPREG,''X'')=''NC'') ';

   end;
   if (SRV_D = 'ORACLE') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, CXP.CPSALEXT, '
        +  'MON.TMON_LOC, MON.TMONABR,  CXP.CPMTOORI, '
        +  'PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '
        +  'NVL(CXP.CPMTOLOC,0)-NVL(CXP.CPPAGLOC,0) AS CPSALLOC1, '
        +  'NVL(CXP.CPMTOEXT,0)-NVL(CXP.CPPAGEXT,0) AS CPSALEXT1, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT ELSE 0 END) AS PAGEXT '
        +'FROM CXP301 CXP, TGE103 MON, TGE110 DOC , TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
        + ' AND ( CPESTADO = ''P'' ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, dtpFecha.Date )+''' ) ) '
//        + ' AND  DOCMOD=''CXP'' '
        + ' AND ( '+xestadocxp+' ) '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.TMONID=MON.TMONID(+) AND CXP.DOCID=DOC.DOCID(+) AND DOC.DOCMOD=''CXP'''
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text+''''
        + ' AND (DOC.DOC_FREG=''P'' AND NVL(DOC.DOCTIPREG,''X'')=''NC'') ';
    end;
//
   Fprincipal.GCCProv.UsuarioSQL.Clear;
   Fprincipal.GCCProv.UsuarioSQL.Add(xSQL);
   Fprincipal.GCCProv.NewQuery;
   if Fprincipal.GCCProv.FMant.cds2.RecordCount=0 then
   begin
     Showmessage('No Existen Registros para la Consulta');
     screen.Cursor:=crDefault;
     Exit;
   end;
   screen.Cursor:=crDefault;



end;


procedure TFToolCCProv.FormCreate(Sender: TObject);
begin
  dtpFecha.Date:=date;
  RbTodosClick(sender);
end;

procedure TFToolCCProv.RbTodosClick(Sender: TObject);
begin
  xestadocxp:='';
  xestadocxp:=' CPESTADO=''P'' OR CPESTADO=''C'' ';
end;

procedure TFToolCCProv.RbPendientesClick(Sender: TObject);
begin
  xestadocxp:='';
  xestadocxp:=' CPESTADO=''P'' ';

end;

procedure TFToolCCProv.RbCanceladosClick(Sender: TObject);
begin
  xestadocxp:='';
  xestadocxp:=' CPESTADO=''C'' ';

end;

procedure TFToolCCProv.BitBtn1Click(Sender: TObject);
var
  xsql : String;
begin
//   if DMCXP.cdsReporte.RecordCount>0 then
 //  begin
//      ppdbCtaCteProv.DataSource :=DMCXP.dsReporte;
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
    xSQL:=' SELECT CXP.CIAID, CXP.DOCID, MAX(DOC.DOCDES)  DOCDES,DOC.DOC_FREG,DOC.DOCTIPREG, '
        +' CXP.PROV, SUM(COALESCE(CXP.CPMTOLOC,0)) CPMTOLOC, SUM(COALESCE(CXP.CPPAGLOC,0)) CPPAGLOC , '
        +' SUM(CXP.CPSALLOC) CPSALLOC , SUM(CXP.CPMTOEXT) CPMTOEXT, SUM(CXP.CPPAGEXT) CPPAGEXT, '
        +' SUM(CXP.CPSALEXT) CPSALEXT , MAX(MON.TMON_LOC) TMON_LOC, MAX(MON.TMONABR) TMONABR, '
        +' SUM(CXP.CPMTOORI) CPMTOORI , MAX(PROVE.PROVDES) PROVDES, '
        +' MAX(PROVE.PROVRUC) PROVRUC, MAX(PROVE.PROVDIR) PROVDIR , '
        +' COALESCE(SUM(CXP.CPMTOLOC),0)-COALESCE(SUM(CXP.CPPAGLOC),0) AS CPSALLOC , '
        +' COALESCE(SUM(CXP.CPMTOEXT),0)-COALESCE(SUM(CXP.CPPAGEXT),0) AS CPSALEXT ,   '
        +  'SUM(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  'SUM(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '
        +  'SUM(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '
        +  'SUM(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '
        +  'SUM(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  'SUM(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT ELSE 0 END) AS PAGEXT, '
        +  ' CASE WHEN DOC.DOC_FREG=''P'' AND DOC.DOCTIPREG IS NULL THEN ''PROVISION'' ELSE '
        +  ' (CASE WHEN DOC.DOC_FREG=''N'' THEN ''NOTA DE CREDITO''  ELSE '
        +  ' (CASE WHEN DOC.DOC_FREG=''T'' THEN ''PAGOS A CUENTA'' ELSE '
        +  ' (CASE WHEN DOC.DOC_FREG=''L'' THEN ''LETRAS'' ELSE ''OTROS'' END ) END) END)  END TIPO '
        +'FROM CXP301 CXP '
        +  'LEFT JOIN TGE103 MON ON (CXP.TMONID=MON.TMONID) '
        +  'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD=''CXP''), TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
        + ' AND ( '+xestadocxp+' ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, dtpFecha.Date )+''' ) ) '
        + ' AND  DOCMOD=''CXP'' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text
        + ''' GROUP BY CXP.CIAID,CXP.PROV,CXP.DOCID,DOC.DOC_FREG,DOC.DOCTIPREG ';
   end;

   if (SRV_D = 'ORACLE') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, MAX(DOC.DOCDES) DOCDES, DOC.DOC_FREG,DOC.DOCTIPREG,  '
        +  'CXP.PROV, SUM(NVL(CXP.CPMTOLOC,0)) CPMTOLOC, SUM(NVL(CXP.CPPAGLOC,0)) CPPAGLOC, '
        +  'SUM(CXP.CPSALLOC) CPSALLOC , SUM(CXP.CPMTOEXT) CPMTOEXT , SUM(CXP.CPPAGEXT) CPPAGEXT , '
        +  'SUM(CXP.CPSALEXT) CPSALEXT, MAX(MON.TMON_LOC) TMON_LOC, MAX(MON.TMONABR) TMONABR, '
        +  'SUM(CXP.CPMTOORI) CPMTOORI, MAX(PROVE.PROVDES) PROVDES , '
        +  ' MAX(PROVE.PROVRUC) PROVRUC, MAX(PROVE.PROVDIR) PROVDIR , '
        +  'NVL(SUM(CXP.CPMTOLOC),0)-NVL(SUM(CXP.CPPAGLOC),0) AS CPSALLOC1, '
        +  'NVL(SUM(CXP.CPMTOEXT),0)-NVL(SUM(CXP.CPPAGEXT),0) AS CPSALEXT1, '

{    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, CXP.CPSALEXT, '
        +  'MON.TMON_LOC, MON.TMONABR,  CXP.CPMTOORI, '
        +  'PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '
        +  'NVL(CXP.CPMTOLOC,0)-NVL(CXP.CPPAGLOC,0) AS CPSALLOC1, '
        +  'NVL(CXP.CPMTOEXT,0)-NVL(CXP.CPPAGEXT,0) AS CPSALEXT1, '}
        +  'SUM(DECODE(CXP.TMONID,'''+DMCXP.wTMonLoc+''',CXP.CPMTOLOC,0 )) AS MTOLOC, '
        +  'SUM(DECODE(CXP.TMONID,'''+DMCXP.wTMonExt+''',CXP.CPMTOEXT,0 )) AS MTOEXT, '
        +  'SUM(DECODE(CXP.TMONID,'''+DMCXP.wTMonLoc+''',CXP.CPSALLOC,0 )) AS SALLOC, '
        +  'SUM(DECODE(CXP.TMONID,'''+DMCXP.wTMonExt+''',CXP.CPSALEXT,0 )) AS SALEXT, '
        +  'SUM(DECODE(CXP.TMONID,'''+DMCXP.wTMonLoc+''',CXP.CPPAGLOC,0 )) AS PAGLOC, '
        +  'SUM(DECODE(CXP.TMONID,'''+DMCXP.wTMonExt+''',CXP.CPPAGEXT,0 )) AS PAGEXT, '
        +  ' CASE WHEN DOC.DOC_FREG=''P'' AND DOC.DOCTIPREG IS NULL THEN ''PROVISION'' ELSE '
        +  ' (CASE WHEN DOC.DOC_FREG=''N'' THEN ''NOTA DE CREDITO''  ELSE '
        +  ' (CASE WHEN DOC.DOC_FREG=''T'' THEN ''PAGOS A CUENTA'' ELSE '
        +  ' (CASE WHEN DOC.DOC_FREG=''L'' THEN ''LETRAS'' ELSE ''OTROS'' END ) END) END)  END TIPO '
        +'FROM CXP301 CXP, TGE103 MON, TGE110 DOC , TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
//        + ' AND ( CPESTADO = ''P'' ) '
        + ' AND ( '+xestadocxp+' ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, dtpFecha.Date )+''' ) ) '
        + ' AND  DOCMOD=''CXP'' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.TMONID=MON.TMONID(+) AND CXP.DOCID=DOC.DOCID(+) AND DOC.DOCMOD=''CXP'''
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text
        + ''' GROUP BY CXP.CIAID,CXP.PROV,CXP.DOCID,DOC.DOC_FREG,DOC.DOCTIPREG ';
     end;
     DMCXP.cdsqry5.close;
     DMCXP.cdsqry5.DataRequest(xsql);
     DMCXP.cdsqry5.Open;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABRCIAID,DOC.DOC_FREG,DOC.DOCTIPREG, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'COALESCE(CXP.CPMTOLOC,0) CPMTOLOC , COALESCE(CXP.CPPAGLOC,0) CPPAGLOC , CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, CXP.CPSALEXT, '
        +  'MON.TMON_LOC, MON.TMONABR,  CXP.CPMTOORI, '
        +  'PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '
        +  'COALESCE(CXP.CPMTOLOC,0)-COALESCE(CXP.CPPAGLOC,0) AS CPSALLOC, '
        +  'COALESCE(CXP.CPMTOEXT,0)-COALESCE(CXP.CPPAGEXT,0) AS CPSALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT ELSE 0 END) AS PAGEXT '
        +'FROM CXP301 CXP '
        +  'LEFT JOIN TGE103 MON ON (CXP.TMONID=MON.TMONID) '
        +  'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD=''CXP''), TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
//        + ' AND ( CPESTADO = ''P'' ) '
        + ' AND ( '+xestadocxp+' ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, dtpFecha.Date )+''' ) ) '
        + ' AND  DOCMOD=''CXP'' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text
        + ''' ORDER BY CXP.CIAID, CXP.DOCID,DOC.DOC_FREG,DOC.DOCTIPREG';
   end;
   if (SRV_D = 'ORACLE') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR,DOC.DOC_FREG,DOC.DOCTIPREG, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'NVL(CXP.CPMTOLOC,0) CPMTOLOC, NVL(CXP.CPPAGLOC,0) CPPAGLOC, CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, CXP.CPSALEXT, '
        +  'MON.TMON_LOC, MON.TMONABR,  CXP.CPMTOORI, '
        +  'PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '
        +  'NVL(CXP.CPMTOLOC,0)-NVL(CXP.CPPAGLOC,0) AS CPSALLOC1, '
        +  'NVL(CXP.CPMTOEXT,0)-NVL(CXP.CPPAGEXT,0) AS CPSALEXT1, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT ELSE 0 END) AS PAGEXT '
        +'FROM CXP301 CXP, TGE103 MON, TGE110 DOC , TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByname('PROV').AsString+''' '
//        + ' AND ( CPESTADO = ''P'' ) '
        + ' AND ( '+xestadocxp+' ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, dtpFecha.Date )+''' ) ) '
        + ' AND  DOCMOD=''CXP'' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.TMONID=MON.TMONID(+) AND CXP.DOCID=DOC.DOCID(+) AND DOC.DOCMOD=''CXP'''
        + ' AND CXP.CIAID='''+dbeCiaCod.text+''' AND CXP.PROV='''+dbeProvCod.text+'''';
    end;
     DMCXP.cdsqry6.close;
     DMCXP.cdsqry6.DataRequest(xsql);
     DMCXP.cdsqry6.Open;



   // Con Estas Lineas Funciona
     DMCXP.cdsqry6.IndexFieldNames:='CIAID;DOC_FREG;DOCTIPREG';
     DMCXP.cdsqry6.MasterSource:=DMCXP.dsQry5;
     DMCXP.cdsqry6.MasterFields:='CIAID;DOC_FREG;DOCTIPREG';

      pprReporte.TEMPLATE.FileName:=ExtractFilePath( application.ExeName )+wRutaRpt+'\CtaCteDetProv.rtm';
      pprReporte.template.LoadFromFile ;
      pplblciades.caption:=dbeCIA.text;
      pprReporte.Print;
      screen.Cursor:=CrDefault;
  // end;
  { if DMCXP.cdsReporte.RecordCount=0 then
   begin
    Showmessage('No Existen Registros para la Consulta');
    screen.Cursor:=CrDefault;
    Exit;
   end;
   }

end;

procedure TFToolCCProv.Timer1Timer(Sender: TObject);
begin
   FVariables.w_NombreForma := 'FToolCCProv';
   if (DMCXP.wAdmin='G') or (DMCXP.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMCXP.AccesosUsuariosR( DMCXP.wModulo,DMCXP.wUsuario,'2',FToolCCProv);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

end.
