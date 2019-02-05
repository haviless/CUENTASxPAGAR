unit CxP216;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, wwdbedit, wwdblook, wwdbdatetimepicker,
  Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, db, DBClient, wwclient, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppCtrls,
  ppPrnabl, ppBands, ppVar, ppStrtch, ppSubRpt, ppViewr, ppModule, daDatMod,
  ComCtrls, variants, ppTypes;


type
  TFEstCxCli = class(TForm)
    pnlFOOT: TPanel;
    Z2bbtnCancel: TBitBtn;
    bbtnPrint: TBitBtn;
    pnlHEAD: TPanel;
    ppDBPipelineF: TppDBPipeline;
    ppDBPipelineL: TppDBPipeline;
    ppReportF: TppReport;
    ppDetailBand4: TppDetailBand;
    ppSubReport1: TppSubReport;
    ppCHDOCUM: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    pdb1: TppDBText;
    pdb2: TppDBText;
    pdb3: TppDBText;
    pdb4: TppDBText;
    pdb5: TppDBText;
    pdb6: TppDBText;
    ppSubReport2: TppSubReport;
    ppCHLETRAS: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    plim1: TppLabel;
    plim2: TppLabel;
    plim4: TppLabel;
    plim3: TppLabel;
    plim6: TppLabel;
    plim5: TppLabel;
    ppLine4: TppLine;
    ppDBText36: TppDBText;
    ppLabel41: TppLabel;
    pplblPERIODO: TppLabel;
    ppLabel45: TppLabel;
    ppLabel47: TppLabel;
    pplblSalLoc: TppLabel;
    ppLabel50: TppLabel;
    pplblSalExt: TppLabel;
    ppLine5: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppLabel54: TppLabel;
    ppLine6: TppLine;
    ppLabel55: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    pliml1: TppLabel;
    pliml2: TppLabel;
    pdbl2: TppDBText;
    pdbl1: TppDBText;
    pliml3: TppLabel;
    pdbl3: TppDBText;
    pdbl4: TppDBText;
    pliml4: TppLabel;
    ppLine1: TppLine;
    Bevel1: TBevel;
    ppSummaryBand1: TppSummaryBand;
    ppLbl1: TppLabel;
    ppLblD1: TppLabel;
    ppLbl2: TppLabel;
    ppLblD2: TppLabel;
    ppLbl3: TppLabel;
    ppLblD3: TppLabel;
    GroupBox1: TGroupBox;
    lbl1: TLabel;
    dbe1: TStaticText;
    lbl2: TLabel;
    dbe2: TStaticText;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    dbe3: TStaticText;
    dbe4: TStaticText;
    plim7: TppLabel;
    pdb7: TppDBText;
    plim8: TppLabel;
    pdb8: TppDBText;
    pdb9: TppDBText;
    pdb0: TppDBText;
    plim9: TppLabel;
    plim0: TppLabel;
    ppDBPipelineD: TppDBPipeline;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppDBText20: TppDBText;
    ppdbLoc: TppDBText;
    ppdbDoc: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppdbMon: TppDBText;
    ppdbExt: TppDBText;
    pplLoc: TppLabel;
    pplExt: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine10: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    pplblESTADO: TppLabel;
    BitBtn1: TBitBtn;
    ppdbp1: TppDBPipeline;
    ppdbp2: TppDBPipeline;
    ppReport2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    pplTitulo: TppLabel;
    pplPeriodo: TppLabel;
    pplCia: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppSubReport3: TppSubReport;
    ppcFactura: TppChildReport;
    ppSubReport4: TppSubReport;
    ppChildReport2: TppChildReport;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppDetailBand7: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppLabel58: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLabel86: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    pplSalMN: TppLabel;
    pplSalME: TppLabel;
    ppLabel109: TppLabel;
    ppDBText26: TppDBText;
    ppDBText33: TppDBText;
    ppDBText37: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    pplActMN: TppLabel;
    pplMovME: TppLabel;
    pplMovMN: TppLabel;
    pplActME: TppLabel;
    ppLabel60: TppLabel;
    ppLabel76: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel88: TppLabel;
    ppLabel91: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel103: TppLabel;
    ppLabel105: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel110: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText5: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    dbgEst2: TwwDBGrid;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    dbgEst4: TwwDBGrid;
    TabSheet3: TTabSheet;
    Panel4: TPanel;
    dbgEst5: TwwDBGrid;
    TabSheet4: TTabSheet;
    Panel5: TPanel;
    dbgEst6: TwwDBGrid;
    Z2bbtnAceptar: TBitBtn;
    PageControl2: TPageControl;
    TabSheet8: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dblcClie: TwwDBLookupComboDlg;
    dbeClie: TwwDBEdit;
    dbeDirec: TwwDBEdit;
    dbeDistrito: TwwDBEdit;
    dbeTelf: TwwDBEdit;
    dbeSaldoAnt: TwwDBEdit;
    dbeCargos: TwwDBEdit;
    dbeAbonos: TwwDBEdit;
    dbeSaldoAct: TwwDBEdit;
    dbeLCredito: TwwDBEdit;
    dbeDisponible: TwwDBEdit;
    TabSheet10: TTabSheet;
    Label20: TLabel;
    wwDBEdit2: TwwDBEdit;
    chbFecha: TCheckBox;
    BitBtn2: TBitBtn;
    rgEst: TRadioGroup;
    GroupBox3: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    dtpIni: TwwDBDateTimePicker;
    dtpFin: TwwDBDateTimePicker;
    TabSheet7: TTabSheet;
    dbgLinea: TwwDBGrid;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    dbgEst3: TwwDBGrid;
    dblcClAux: TwwDBLookupCombo;
    dbeClAux: TwwDBEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Z2bbtnAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgEst2CalCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure Z2bbtnCancelClick(Sender: TObject);
    procedure dbgEst2DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DOCUMBeforePrint(Sender: TObject);
    procedure bbtnPrintClick(Sender: TObject);
    procedure ppTitleBand4BeforePrint(Sender: TObject);
    procedure ppReportFPreviewFormCreate(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand5BeforePrint(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ppHeaderBand2BeforePrint(Sender: TObject);
    procedure dbgEst2TitleButtonClick(Sender: TObject; AFieldName: String);
    procedure dbgEst3TitleButtonClick(Sender: TObject; AFieldName: String);
    procedure dbgEst2CalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure dbgEst3CalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ppReport2PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
    sSQL, sSQL2,stcam  : String;
    FMoneda, FCliente, FClAux, FNomCliente, FProvDes : String;
    FActivar, FMonLoc, FInternal : Boolean;
    orig, camp, extr, loca, pag, sal, FSaldoIni, FSaldoIniE,
    FSaldoIniL, col1, col2, col3, col4, FSaldoReal,
    FSaldoRealE, FSaldoRealL : Double;
    FAnio, FMes : Integer;

    procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure ProcessSaldo(cds : TwwClientDataSet);
    procedure PSaldoAnt;
    function MonLocal( const CodMoneda: String ): Boolean;
    function NomMoneda(const CodMoneda: String ): String;
    procedure cGRID(dbg : TwwDBGrid);
    procedure cLetras;
    procedure Totales;
  public
    { Public declarations }
    procedure cSQL;
    procedure cFormat(cds : TwwClientDataSet);
    procedure cFooter(dbg : TwwDBGrid; cds : TwwClientDataSet);
    procedure cFooterCheque(dbg : TwwDBGrid; cds : TwwClientDataSet);
    procedure cFooterAnticipo(dbg : TwwDBGrid; cds : TwwClientDataSet);
    procedure cFooterNCredito(dbg : TwwDBGrid; cds : TwwClientDataSet);
    procedure GeneraData;
    property Moneda    : String  read FMoneda     write FMoneda     ;
    property ClAux     : String  read FClAux      write FClAux      ;
    property Cliente   : String  read FCliente    write FCliente    ;
    property Internal  : Boolean read FInternal   write FInternal   ;
    property Activar   : Boolean read FActivar    write FActivar    ;
    property MonLoc    : Boolean read FMonLoc     write FMonLoc     ;
    property SaldoIni  : Double  read FSaldoIni   write FSaldoIni   ;
    property SaldoIniL : Double  read FSaldoIniL  write FSaldoIniL  ;
    property SaldoIniE : Double  read FSaldoIniE  write FSaldoIniE  ;
    property SaldoReal : Double  read FSaldoReal  write FSaldoReal  ;
    property SaldoRealL: Double  read FSaldoRealL write FSaldoRealL ;
    property SaldoRealE: Double  read FSaldoRealE write FSaldoRealE ;
    property Mes       : Integer read FMes        Write FMes        ;
    property Anio      : Integer read FAnio       Write FAnio       ;
    property ProvDes   : String  read FProvDes    write FProvDes    ;
  end;

var
  FEstCxCli: TFEstCxCli;
  xCiaDes : String;

implementation

uses CxPDM, CxP217, CxP215 ;

{$R *.DFM}

function DaysOfMonth ( iMonth, iYear : Word ) : Word;
//const
//  DaysxMes : Array [1..12] of Integer = (31,28,31,30,31,30,31,31,30,31,30,31);
var
  DaysxMes : Array [1..12] of Integer; // = (31,28,31,30,31,30,31,31,30,31,30,31);
begin
//const
//  DaysxMes := (31,28,31,30,31,30,31,31,30,31,30,31);
  DaysxMes[1]:= 31;
  DaysxMes[2]:= 28;
  DaysxMes[3]:= 31;
  DaysxMes[4]:= 30;
  DaysxMes[5]:= 31;
  DaysxMes[6]:= 30;
  DaysxMes[7]:= 31;
  DaysxMes[8]:= 31;
  DaysxMes[9]:= 30;
  DaysxMes[10]:= 31;
  DaysxMes[11]:= 30;
  DaysxMes[12]:= 31;
  if IsLeapYear(iYear) then DaysxMes[2]:= 29;
  result := DaysxMes[iMonth];
end;

function OperClientDataSet( ClientDataSet : TwwClientDataSet;
                            Expression, Condicion : String  ) : Double;
var
  cdsClone    : TwwClientDataSet;
  Agg         : TAggregate;
begin
  result := 0;

  if trim(Expression)= '' then Exit;

  cdsClone    := TwwClientDataSet.Create(nil);
  try

    with cdsClone do
    begin
      CloneCursor(ClientDataSet,True);
      Agg := nil;
      Aggregates.Clear;
      Agg := Aggregates.Add;
      Agg.AggregateName := 'OPER';
      Agg.Expression := Expression;
      Agg.Active := True;

      if Trim(Condicion)<>'' then
      begin
        Filtered     := False;
        Filter       := Condicion;
        Filtered     := True;
      end;

      if Aggregates.Items[Aggregates.IndexOf('OPER')].Value<>NULL then
         result := Aggregates.Items[Aggregates.IndexOf('OPER')].Value;

      Aggregates.Clear;

    end;

  finally
    cdsClone.Free;
  end;
end;


procedure TFEstCxCli.cSQL;
begin
  if (SRV_D = 'DB2NT') or
		 (SRV_D = 'DB2400') then
  begin
    sSQL:='SELECT CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO, CXP.CPTCAMPR, '+
    'CXP.PROV, CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, CXP.CPMTOEXT, '+
    'CXP.CPPAGEXT, CXP.CPSALEXT, CXP.CPSERIE, CXP.CIAID, CXP.DOCID, '+
    {CXPWMC2803
    'MON.TMON_LOC, MON.TMONABR, DOC.DOCABR, DOC.DOCRESTA, UBI.UBICADES, '+
    'SIT.SITUADES, CXP.CPMTOORI, CLI.CLIEDES , CXP.TMONID , '+
    }
    'MON.TMON_LOC, MON.TMONABR, DOC.DOCABR, DOC.DOCRESTA,  '+
    'CXP.CPMTOORI, PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '+

    ''+DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGLOC,0) AS CPSALLOC, '+
    ''+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGEXT,0) AS CPSALEXT, '+
    ''+DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0) AS COL_2, '+DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0) AS COL_3, '+
    {WMC2303
    '(CASE WHEN CXP.TMONID=''01'' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '+
    '(CASE WHEN CXP.TMONID=''02'' THEN CXP.CPMTOEXT ELSE 0 END) AS MTOEXT, '+
    '(CASE WHEN CXP.TMONID=''01'' THEN CXP.CPSALLOC ELSE 0 END) AS SALLOC, '+
    '(CASE WHEN CXP.TMONID=''02'' THEN CXP.CPSALEXT ELSE 0 END) AS SALEXT, '+
    '(CASE WHEN CXP.TMONID=''01'' THEN '+DMCXP.wReplacCeros+'(CXP.CPPAGLOC,0) ELSE 0 END) AS PAGLOC, '+
    '(CASE WHEN CXP.TMONID=''02'' THEN '+DMCXP.wReplacCeros+'(CXP.CPPAGEXT,0) ELSE 0 END) AS PAGEXT '+
    }
    '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPMTOLOC END) AS MTOLOC, '+
    '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPMTOEXT END) AS MTOEXT, '+
    '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPSALLOC END) AS SALLOC, '+
    '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPSALEXT END) AS SALEXT, '+
    '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonLoc+''' THEN CXP.CPPAGLOC END) AS PAGLOC, '+
    '(CASE WHEN CXP.TMONID='''+DMCXP.wTMonExt+''' THEN CXP.CPPAGEXT END) AS PAGEXT '+

    'FROM CXP301 CXP ' +
    'LEFT JOIN TGE103 MON ON (CXP.TMONID=MON.TMONID) ' +
    //wmc2803      'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID) ' +
    //CXPWMC2903      'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD = ''CXP'') ' +
    'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD = ''CXP'') ' +
    //CXPWMC2803      'LEFT JOIN CXC105 UBI ON (CXC.UBIID=UBI.UBICAID) ' +
    //CXPWMC2803      'LEFT JOIN CXC104 SIT ON (CXC.SITID=SIT.SITUAID), ' +
    ',TGE201 PROVE ';
  end
  else
	if SRV_D = 'ORACLE' then
  begin
    sSQL:='SELECT CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO, CXP.CPTCAMPR, '+
    'CXP.PROV, CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, CXP.CPMTOEXT, '+
    'CXP.CPPAGEXT, CXP.CPSALEXT, CXP.CPSERIE, CXP.CIAID, CXP.DOCID, '+
    'MON.TMON_LOC, MON.TMONABR, DOC.DOCABR, DOC.DOCRESTA,  '+
    'CXP.CPMTOORI, PROVE.PROVDES , CXP.TMONID , CXP.CPESTADO , '+
    ''+DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGLOC,0) AS CPSALLOC, '+
    ''+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGEXT,0) AS CPSALEXT, '+
    ''+DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0) AS COL_2, '+DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0) AS COL_3, '+
    'DECODE(CXP.TMONID, '''+DMCXP.wTMonLoc+''', CXP.CPMTOLOC, 0) MTOLOC, '+
    'DECODE(CXP.TMONID, '''+DMCXP.wTMonExt+''', CXP.CPMTOEXT, 0) MTOEXT, '+
    'DECODE(CXP.TMONID, '''+DMCXP.wTMonLoc+''', CXP.CPSALLOC, 0) SALLOC, '+
    'DECODE(CXP.TMONID, '''+DMCXP.wTMonExt+''', CXP.CPSALEXT, 0) SALEXT, '+
    'DECODE(CXP.TMONID, '''+DMCXP.wTMonLoc+''', CXP.CPPAGLOC, 0) PAGLOC, '+
    'DECODE(CXP.TMONID, '''+DMCXP.wTMonExt+''', CXP.CPPAGEXT, 0) PAGEXT '+
    'FROM CXP301 CXP, TGE201 PROVE, TGE103 MON, TGE110 DOC ' +
    'WHERE CXP.TMONID=MON.TMONID(+) '+
    'AND CXP.DOCID=DOC.DOCID(+) AND DOC.DOCMOD = ''CXP'' ';
	end;
end;

procedure TFEstCxCli.FormCreate(Sender: TObject);
begin
   Cursor := crDefault;

//   dbeTCAMB.Text := '0';
   stcam := '1';
   cSQL;

   cGRID(dbgEst2);
   cGRID(dbgEst3);

//   dblcProv.OnNotInList := dblcNotInList;

   Application.CreateForm(TFDetAmo,FDetAmo);
end;


procedure TFEstCxCli.GeneraData;
var
   xSQL,xSQLLetra,xSQLNCredito,xSQLCheque,xSQLAnticipo : String;
   xCondicion, xCondicionLetras : string ;
   xSQLFinal        : String ;
   sFPagoCheque,sConNCreditos,sNCredito,sConLetras,sConCheques,sConAnticipos : string;
   sAnt, sWhere, sClauxProv, sSitIni, sAnticipo, sCheque :string;
begin
   sNCredito   :=BuscaQry('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''P'' AND DOCTIPREG=''NC''','DOCID');
   sCheque     :=BuscaQry('dspTGE','TGE110','DOCID','DOCMOD=''CAJA'' AND DOC_FREG=''H''','DOCID');
   sFPagoCheque:=BuscaQry('dspTGE','TGE112','FPAGOID','FCHQ=''1''','FPAGOID');
   sClauxProv  :=BuscaQry('dspTGE','TGE102','CLAUXID','CLAUXCP=''P''','CLAUXID');
   sAnt        :=BuscaQry('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''P'' AND DOCTIPREG=''R''','DOCID');

   // Busca el Saldo
   PSaldoAnt;
   {
   stt3.Caption := floattostrf(SaldoRealL, ffNumber, 15, 2);
   stt4.Caption := floattostrf(SaldoRealE, ffNumber, 15, 2);
   }
end;


procedure TFEstCxCli.Z2bbtnAceptarClick(Sender: TObject);
var
   xSQL,xSQLLetra,xSQLNCredito,xSQLCheque,xSQLAnticipo : String;
   xCondicion, xCondicionLetras : string ;
   xSQLFinal        : String ;
   sFPagoCheque,sConNCreditos,sNCredito,sConLetras,sConCheques,sConAnticipos : string;
   sAnt, sWhere, sClauxProv, sSitIni, sAnticipo, sCheque :string;
begin

   sNCredito   :=BuscaQry('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''P'' AND DOCTIPREG=''NC''','DOCID');
   sCheque     :=BuscaQry('dspTGE','TGE110','DOCID','DOCMOD=''CAJA'' AND DOC_FREG=''H''','DOCID');
   sFPagoCheque:=BuscaQry('dspTGE','TGE112','FPAGOID','FCHQ=''1''','FPAGOID');
   sClauxProv  :=BuscaQry('dspTGE','TGE102','CLAUXID','CLAUXCP=''P''','CLAUXID');
   sAnt        :=BuscaQry('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''P'' AND DOCTIPREG=''R''','DOCID');
//   sAnticipo:=BuscaQry2('dspTGE','TGE110','DOCID','DOCMOD=''CXC'' AND DOC_FREG=''A''','DOCID');
//   sSitIni:= DisplayDescrip('CXC104','SITUAID','SITUAFLAG','1'); // EQUIVALE AL 00
   PSaldoAnt;

//   stt3.Caption := floattostrf(SaldoRealL, ffNumber, 15, 2);
//   stt4.Caption := floattostrf(SaldoRealE, ffNumber, 15, 2);
{
   if trim(dbeTCAMB.Text) = '' then
      stcam := '1'
   else
   begin
      if StrToFloat(dbeTCAMB.Text) <= 0 then
          stcam := '1'
      else
          stcam := dbeTCAMB.Text;
   end ;
}
   xSQL := '';
   xSQLLetra:='';
   sConLetras:='';
   sConCheques:='';
   sConAnticipos:='';
   sConNCreditos:='';

   case rgEST.ItemIndex of
        0: begin
             xSQL := xSQL + ' AND ( CPESTADO = ''C'' OR CPESTADO = ''P'' ) ' ;
             sConLetras := '';
             sConCheques:='';
             sConAnticipos:='';
             sConNCreditos:='';
           end;
        1: begin
             xSQL := xSQL + ' AND ( CPESTADO = ''P'' ) ' ;
             sConLetras := ' AND CPESTADO=''P'' ';
             sConCheques:= ' AND ECESTADO=''P'' ';
             sConAnticipos:= ' AND ECESTADO=''P'' ';
             sConNCreditos:= ' AND CPESTADO=''P'' ';
           end;
        2: begin
             xSQL := xSQL + ' AND ( CPESTADO = ''C'' ) ' ;
             sConLetras := 'AND CPESTADO=''C'' ';
             sConCheques:= ' AND ECESTADO=''C'' ';
             sConAnticipos:= ' AND ECESTADO=''C'' ';
             sConNCreditos:= ' AND CPESTADO=''C'' ';
           end;
   end;


   xSQL := xSQL + ' AND (CXP.CPFEMIS>='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpINI.Date)+''') AND CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) ';
   xSQLLetra := xSQLLetra + ' AND (CXP.CPFEMIS>='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpINI.Date)+''') AND CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) ';
   xSQLCheque := xSQLCheque + ' AND (CAJA.ECFEMICH>='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpINI.Date)+''') AND CAJA.ECFEMICH<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) ';
   xSQLAnticipo := xSQLAnticipo + ' AND (ANT.ECFEMICH>='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpINI.Date)+''') AND ANT.ECFEMICH<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) ';
   xSQLNCredito := xSQLNCredito + ' AND (CXP.CPFEMIS>='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpINI.Date)+''') AND CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) ';

  //** 18/10/2001 - PJSV
  if (SRV_D = 'DB2NT') or
		 (SRV_D = 'DB2400') then
  begin
  	  xSQL := ' WHERE CXP.PROV='''+Cliente+''''+ xSQL;
     xSQLLetra := ' WHERE CXP.PROV='''+Cliente+''''+xSQLLetra;
     xSQLCheque := ' WHERE CAJA.PROV='''+Cliente+''''+xSQLCheque;
     xSQLAnticipo := ' WHERE ANT.PROV='''+Cliente+''''+xSQLAnticipo;
     xSQLNCredito := ' WHERE CXP.PROV='''+Cliente+''''+xSQLNCredito;
  end
  else
	if SRV_D = 'ORACLE' then
  begin
  	    xSQL := ' AND CXP.PROV='''+Cliente+''''+ xSQL;
       xSQLLetra := ' AND CXP.PROV='''+Cliente+''''+xSQLLetra;
       xSQLCheque := ' AND CAJA.PROV='''+Cliente+''''+xSQLCheque;
       xSQLAnticipo := ' AND ANT.PROV='''+Cliente+''''+xSQLAnticipo;
       xSQLNCredito := ' AND CXP.PROV='''+Cliente+''''+xSQLNCredito;
  end;


   xSQLFinal := sSQL + xSQL +
                    ' AND DOC.DOC_FREG<>''L'''+' AND DOCMOD='+''''+'CXP'+''''+
                    ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID)' ;
   dbgEst2.DataSource := DMCXP.dsQRY2;
   DMCXP.cdsQRY2.Close;
   DMCXP.cdsQRY2.ProviderName := 'dspTGE'  ;
   DMCXP.cdsQRY2.DataRequest ( xSQLFinal ) ;
   DMCXP.cdsQRY2.Open;

   with DMCXP.cdsQRY4 do
   begin
      xSQLFinal := sSQL + xSQLLetra + sConLetras +
                    ' AND DOC.DOC_FREG=''L'''+' and DOCMOD='+''''+'CXP'+''''+
                    ' AND (PROVE.PROV=CXP.PROV and PROVE.CLAUXID=CXP.CLAUXID)' ;
      dbgEst3.DataSource := DMCXP.dsQRY4;
      Close;
      ProviderName := 'dspTGE';
      DataRequest ( xSQLFinal );
      Open;
   end;

   //QUERY DE CHEQUES    DMCXP.cdsQry3
   if (SRV_D = 'DB2NT') or
      (SRV_D = 'DB2400') then
   begin
     xSQL:=' SELECT PROV,PROVRUC,ECNOCHQ,ECFEMICH,CAJA.TMONID, '+
           ' CASE WHEN CAJA.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN ECMTOLOC ELSE 0 END ECMTOLOC, '+
           ' CASE WHEN CAJA.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN ECMTOEXT ELSE 0 END ECMTOEXT, '+
           ' CAJA.DOCID,CAJA.CIAID, DOC.DOCABR, MON.TMON_LOC, CAJA.BANCOID,TGE105.BANCONOM '+
           ' FROM CAJA302 CAJA '+
           ' LEFT JOIN TGE110 DOC ON (CAJA.DOCID=DOC.DOCID AND DOC.DOCMOD = ''CXP'') ' +
           ' LEFT JOIN TGE103 MON ON MON.TMONID=CAJA.TMONID '+
           ' LEFT JOIN TGE105 ON CAJA.BANCOID=TGE105.BANCOID '+xSQLCheque+sConCheques+
           ' AND CAJA.CLAUXID='+QuotedStr(sClauxProv)+' AND FPAGOID='+QuotedStr(sFPagoCheque);
   end
   else
     if (SRV_D = 'ORACLE') then
     begin
{     xSQL:=' SELECT PROV,PROVRUC,ECNOCHQ,ECFEMICH,CAJA.TMONID, '+
           ' DECODE( CAJA.TMONID, '+QuotedStr(DMCXP.wTMonLoc)+', ECMTOLOC, 0 ) ECMTOLOC, '+
           ' DECODE( CAJA.TMONID, '+QuotedStr(DMCXP.wTMonExt)+', ECMTOEXT, 0 ) ECMTOEXT, '+
           ' CAJA.DOCID, CAJA.CIAID, DOC.DOCABR, MON.TMON_LOC, CAJA.BANCOID, TGE105.BANCONOM '+
           ' FROM CAJA302 CAJA, TGE110 DOC, TGE103 MON, TGE105 '
           + xSQLCheque+sConCheques+
           ' AND CAJA.DOCID='+QuotedStr(sCheque)+'(+) '+
           ' AND ( CAJA.DOCID=DOC.DOCID(+) AND DOC.DOCMOD(+) = ''CXP'') ' +
           ' AND MON.TMONID(+)=CAJA.TMONID '+
           ' AND CAJA.BANCOID=TGE105.BANCOID(+) '}
     xSQL:=' SELECT PROV,PROVRUC,ECNOCHQ,ECFEMICH,CAJA.TMONID, '+
           ' DECODE( CAJA.TMONID, '+QuotedStr(DMCXP.wTMonLoc)+', ECMTOLOC, 0 ) ECMTOLOC, '+
           ' DECODE( CAJA.TMONID, '+QuotedStr(DMCXP.wTMonExt)+', ECMTOEXT, 0 ) ECMTOEXT, '+
           ' CAJA.DOCID,CAJA.CIAID, DOC.DOCABR, MON.TMON_LOC, CAJA.BANCOID, TGE105.BANCONOM '+
           ' FROM CAJA302 CAJA, TGE110 DOC, TGE103 MON, TGE105 '
          +'WHERE '+
           ' ( CAJA.DOCID=DOC.DOCID(+) AND DOC.DOCMOD(+)=''CXP'') ' +
           ' AND MON.TMONID(+)=CAJA.TMONID '+
           ' AND CAJA.BANCOID=TGE105.BANCOID(+) '+xSQLCheque+sConCheques+
           ' AND CAJA.CLAUXID='+QuotedStr(sClauxProv)+' AND FPAGOID='+QuotedStr(sFPagoCheque);
     end;

   DMCXP.cdsQry3.Close;
   dbgEst4.DataSource := DMCXP.dsQRY3;
   DMCXP.cdsQry3.DataRequest(xSQL);
   DMCXP.cdsQry3.Open;

   dbgEst4.Selected.Clear;
   dbgEst4.Selected.Add('ECNOCHQ'#9'15'#9'Número~Cheque'#9'F');
//   dbgEst4.Selected.Add('TCANJEID'#9'3'#9'Tipo~Cheque'#9'F');
//   dbgEst4.Selected.Add('CCFVCMTO'#9'10'#9'Fecha~Vcto.'#9'F');
//   dbgEst4.Selected.Add('ECFEMIS'#9'10'#9'Fecha~Emisión.'#9'F');
   dbgEst4.Selected.Add('TMONID'#9'3'#9'Moneda.'#9'F');
   dbgEst4.Selected.Add('ECFEMICH'#9'10'#9'Fecha~Emisión.'#9'F');
   dbgEst4.Selected.Add('ECMTOLOC'#9'10'#9'Monto~Original(MN)'#9'F');
//   dbgEst4.Selected.Add('CCSALLOC'#9'10'#9'Saldo (MN)'#9'F');
   dbgEst4.Selected.Add('ECMTOEXT'#9'10'#9'Monto~Original(ME)'#9'F');
//   dbgEst4.Selected.Add('CCSALEXT'#9'10'#9'Saldo (ME)'#9'F');
   dbgEst4.Selected.Add('BANCONOM'#9'15'#9'Banco.'#9'F');
   dbgEst4.RedrawGrid;

   //QUERY DE ANTICIPO    DMCXP.cdsQry5
   if (SRV_D = 'DB2NT') or
      (SRV_D = 'DB2400') then
   begin
     xSQL:=' SELECT PROV,PROVRUC,ECNODOC,ECFEMICH,ANT.TMONID, '+
           ' CASE WHEN ANT.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN ECMTOLOC ELSE 0 END ECMTOLOC, '+
           ' CASE WHEN ANT.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN ECMTOEXT ELSE 0 END ECMTOEXT, '+
           ' ANT.DOCID,ANT.CIAID, DOC.DOCABR, MON.TMON_LOC, ANT.BANCOID,TGE105.BANCONOM '+
           ' FROM CAJA302 ANT '+
           ' LEFT JOIN TGE110 DOC ON (ANT.DOCID=DOC.DOCID AND DOC.DOCMOD = ''CXP'') ' +
           ' LEFT JOIN TGE103 MON ON MON.TMONID=ANT.TMONID '+
           ' LEFT JOIN TGE105 ON ANT.BANCOID=TGE105.BANCOID '+xSQLAnticipo+sConAnticipos+
           ' AND ANT.EC_PROCE=''1'' AND ANT.DOCID='+QuotedStr(sAnt);
   end
   else
     if (SRV_D = 'ORACLE') then
     begin
     xSQL:=' SELECT PROV,PROVRUC,ECNODOC,ECFEMICH,ANT.TMONID, '+
           ' DECODE( ANT.TMONID, '+QuotedStr(DMCXP.wTMonLoc)+', ECMTOLOC, 0 ) ECMTOLOC, '+
           ' DECODE( ANT.TMONID, '+QuotedStr(DMCXP.wTMonExt)+', ECMTOEXT, 0 ) ECMTOEXT, '+
           ' ANT.DOCID,ANT.CIAID, DOC.DOCABR, MON.TMON_LOC, ANT.BANCOID,TGE105.BANCONOM '+
           ' FROM CAJA302 ANT, TGE110 DOC, TGE103 MON, TGE105 '+
           ' WHERE '+
           '     ANT.EC_PROCE=''1'' AND ANT.DOCID='+QuotedStr(sAnt)+
           ' AND (ANT.DOCID=DOC.DOCID(+) AND DOC.DOCMOD(+) = ''CXP'') ' +
           ' AND MON.TMONID(+)=ANT.TMONID '+
           ' AND ANT.BANCOID=TGE105.BANCOID(+) '
           + xSQLAnticipo+sConAnticipos;
     end;

   DMCXP.cdsQry5.Close;
   dbgEst5.DataSource := DMCXP.dsQRY5;
   DMCXP.cdsQry5.DataRequest(xSQL);
   DMCXP.cdsQry5.Open;

   dbgEst5.Selected.Clear;
   dbgEst5.Selected.Add('ECNOCHQ'#9'15'#9'Número~Cheque'#9'F');
//   dbgEst4.Selected.Add('TCANJEID'#9'3'#9'Tipo~Cheque'#9'F');
//   dbgEst4.Selected.Add('CCFVCMTO'#9'10'#9'Fecha~Vcto.'#9'F');
//   dbgEst4.Selected.Add('ECFEMIS'#9'10'#9'Fecha~Emisión.'#9'F');
   dbgEst5.Selected.Add('TMONID'#9'3'#9'Moneda.'#9'F');
   dbgEst5.Selected.Add('ECFEMICH'#9'10'#9'Fecha~Emisión.'#9'F');
   dbgEst5.Selected.Add('ECMTOLOC'#9'10'#9'Monto~Original(MN)'#9'F');
//   dbgEst4.Selected.Add('CCSALLOC'#9'10'#9'Saldo (MN)'#9'F');
   dbgEst5.Selected.Add('ECMTOEXT'#9'10'#9'Monto~Original(ME)'#9'F');
//   dbgEst4.Selected.Add('CCSALEXT'#9'10'#9'Saldo (ME)'#9'F');
   dbgEst5.Selected.Add('BANCONOM'#9'15'#9'Banco.'#9'F');
   dbgEst5.RedrawGrid;


   //QUERY DE NOTAS DE CREDITO    DMCXP.cdsQry6
   if (SRV_D = 'DB2NT') or
      (SRV_D = 'DB2400') then
   begin
     xSQL:=' SELECT PROV,PROVRUC,CXP.CPSERIE,CPNODOC,CXP.CPFEMIS,CXP.TMONID, '+
           ' CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CPMTOLOC ELSE 0 END CPMTOLOC, '+
           ' CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CPSALLOC ELSE 0 END CPSALLOC, '+
           ' CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN CPMTOEXT ELSE 0 END CPMTOEXT, '+
           ' CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN CPSALEXT ELSE 0 END CPSALEXT, '+
           ' CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN CPPAGEXT ELSE 0 END CPPAGEXT, '+
           ' CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CPPAGLOC ELSE 0 END CPPAGLOC, '+
           ' CXP.BANCOID,TGE105.BANCONOM '+
           ' FROM CXP301 CXP '+
           ' LEFT JOIN TGE105 ON CXP.BANCOID=TGE105.BANCOID '+xSQLNCredito+sConNCreditos+
           ' AND CXP.DOCID='+QuotedStr(sNCredito);
   end       //AND CXC.CCPAGORI<=0
   else
     if (SRV_D = 'ORACLE') then
     begin
       xSQL:=' SELECT PROV,PROVRUC,CXP.CPSERIE,CPNODOC,CPFEMIS,CXP.TMONID, '+
             ' DECODE (CXP.TMONID,'+QuotedStr(DMCXP.wTMonLoc)+',CPMTOLOC, 0) CPMTOLOC, '+
             ' DECODE (CXP.TMONID,'+QuotedStr(DMCXP.wTMonLoc)+',CPSALLOC, 0) CPSALLOC, '+
             ' DECODE (CXP.TMONID,'+QuotedStr(DMCXP.wTMonExt)+',CPMTOEXT, 0) CPMTOEXT, '+
             ' DECODE (CXP.TMONID,'+QuotedStr(DMCXP.wTMonExt)+',CPSALEXT, 0) CPSALEXT, '+
             ' DECODE (CXP.TMONID,'+QuotedStr(DMCXP.wTMonExt)+',CPPAGEXT, 0) CPPAGEXT, '+
             ' DECODE (CXP.TMONID,'+QuotedStr(DMCXP.wTMonLoc)+',CPPAGLOC, 0) CPPAGLOC, '+
             ' CXP.BANCOID,TGE105.BANCONOM '+
             ' FROM CXP301 CXP,TGE105 '+
             ' WHERE CXP.BANCOID=TGE105.BANCOID(+) '+xSQLNCredito+sConNCreditos+
             ' AND CXP.DOCID='+QuotedStr(sNCredito);
     end;    //AND CXC.CCPAGORI<=0

   DMCXP.cdsQry6.Close;
   dbgEst6.DataSource := DMCXP.dsQRY6;
   DMCXP.cdsQry6.DataRequest(xSQL);
   DMCXP.cdsQry6.Open;

   dbgEst6.Selected.Clear;
//   dbgEst6.Selected.Add('CLIEID'#9'8'#9'Código~Cliente'#9'F');
//   dbgEst6.Selected.Add('CLIEDES'#9'20'#9'Nombres~Cliente'#9'F');
   dbgEst6.Selected.Add('CPSERIE'#9'10'#9'Serie'#9'F');
   dbgEst6.Selected.Add('CPNODOC'#9'15'#9'Número'#9'F');
   dbgEst6.Selected.Add('CPFEMIS'#9'10'#9'Fecha~Emisión.'#9'F');
   dbgEst6.Selected.Add('TMONID'#9'3'#9'Moneda.'#9'F');
   dbgEst6.Selected.Add('CPMTOLOC'#9'10'#9'Monto~Original(MN)'#9'F');
   dbgEst6.Selected.Add('CPPAGLOC'#9'10'#9'Monto~Aplicado(MN)'#9'F');
   dbgEst6.Selected.Add('CPSALLOC'#9'10'#9'Saldo (MN)'#9'F');
   dbgEst6.Selected.Add('CPMTOEXT'#9'10'#9'Monto~Original(ME)'#9'F');
   dbgEst6.Selected.Add('CPPAGEXT'#9'10'#9'Monto~Aplicado(ME)'#9'F');
   dbgEst6.Selected.Add('CPSALEXT'#9'10'#9'Saldo (ME)'#9'F');
//   dbgEst6.Selected.Add('BANCONOM'#9'15'#9'Banco.'#9'F');
   dbgEst6.RedrawGrid;



   ProcessSaldo ( DMCXP.cdsQRY2 ) ;
   ProcessSaldo ( DMCXP.cdsQRY4 ) ;

   cFormat(DMCXP.cdsQRY2);
   cFormat(DMCXP.cdsQRY4);

   cFooter(dbgEst2, DMCXP.cdsQRY2);
   cFooter(dbgEst3, DMCXP.cdsQRY4);
   cFooterCheque(dbgEst4, DMCXP.cdsQRY3);
   cFooterAnticipo(dbgEst5, DMCXP.cdsQRY5);
   cFooterNCredito(dbgEst6, DMCXP.cdsQRY6);
   Totales;
end;

procedure TFEstCxCli.PSaldoAnt;
var
  xSQL, ySQL, mMes, mAno : String;
  Y, M,Mant, D, iAno : Word;
  fSaldoA : Double;
  sLet,sChe,sAnt,sNCre,sFPagoCheque:string;
begin
   sLet :=BuscaQry('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''L''','DOCID');
   sNCre:=BuscaQry('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''N''','DOCID');
   sFPagoCheque:=BuscaQry('dspTGE','TGE112','FPAGOID','FCHQ=''1''','FPAGOID');
   sAnt :=BuscaQry('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''P'' AND DOCTIPREG=''R''','DOCID');

   DecodeDate(dtpINI.Date,Y,M,D)  ;
   DecodeDate(dtpINI.Date,Y,M,D)  ;

   if M=1 then
   begin
     Mant:=12;
   end
   else
   begin
     Mant:=M-1;
   end;
   //** 11/09/2001 - pjsv - para que me muestre el saldo del mes anterior y no del actual
   mMes := strzero(inttostr(M-1),2) ;
   //**
   mAno := StrZero(inttostr(y),4) ;


   xSQL:='SELECT SALDSMN' + mMes + ' AS X, '+
         ' SALDSME' + mMes + ' AS Y FROM TGE401 WHERE'+
         ' ANO = ''' + mAno + ''' ' +
         ' AND CLAUXID=' + '''' + FClAux + '''' +
         ' AND AUXID=' + '''' + FCliente + '''' ;

   DMCXP.cdsQry3.Close;
   DMCXP.cdsQry3.ProviderName:='dspTGE';
   DMCXP.cdsQry3.DataRequest(xSQL);    //este es la llamada remota al provider del servidor
   DMCXP.cdsQry3.Open;

   SaldoRealL := DMCXP.cdsQry3.FieldByName('X').AsFloat;
   SaldoRealE := DMCXP.cdsQry3.FieldByName('Y').AsFloat;

   if d >= 1 then
   begin
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
      xSQL:='SELECT SUM( CASE WHEN TMONID = '''+DMCXP.wTMonLoc+''' THEN CPSALLOC ELSE 0 END ) AS X, '+
          ' SUM( CASE WHEN TMONID = '''+DMCXP.wTMonExt+''' THEN CPSALEXT ELSE 0 END ) AS Y FROM CXP301 WHERE'+
          ' CPFEMIS>='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,EnCodeDate(Y,M,1))+''')'+
          ' AND CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpINI.Date)+''')'+
          ' AND (CPESTADO = ''P'' OR CPESTADO =''C'') ' +
          ' AND CLAUXID='+''''+FClAux+''''+
          ' AND PROV=' +''''+FCliente+'''';
      end
      else
         if SRV_D = 'ORACLE' then
         begin
         xSQL:='SELECT SUM( DECODE(TMONID,'''+DMCXP.wTMonLoc+''',CPSALLOC, 0 )) AS X, '+
          ' SUM( DECODE(TMONID,'''+DMCXP.wTMonExt+''',CPSALEXT, 0 )) AS Y FROM CXP301 WHERE'+
          ' CPFEMIS>='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,EnCodeDate(Y,M,1))+''')'+
          ' AND CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpINI.Date)+''')'+
          ' AND (CPESTADO = ''P'' OR CPESTADO =''C'') ' +
          ' AND CLAUXID='+''''+FClAux+''''+
          ' AND PROV=' +''''+FCliente+'''';
       	 end;

      DMCXP.cdsQry3.Close;
      DMCXP.cdsQry3.ProviderName:='dspTGE';
      DMCXP.cdsQry3.DataRequest(xSQL);    //este es la llamada remota al provider del servidor
      DMCXP.cdsQry3.Open;
      IF DMCXP.cdsQry3.RecordCount <> 0 then
      begin
         SaldoRealL := SaldoRealL + DMCXP.cdsQry3.fieldbyname('X').AsFloat ;
         SaldoRealE := SaldoRealE + DMCXP.cdsQry3.fieldbyname('Y').AsFloat ;
      end ;


      // SUMA TAMBIEN LOS SALDOS DE LAS LETRAS(SUMAR) Y NOTAS DE CREDITO (RESTAR)
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin //FALTA PARA ORACLE
       xSQL:='SELECT SUM( CASE WHEN TMONID = '''+DMCXP.wTMonLoc+''' THEN (CASE WHEN DOCID='+QuotedStr(sNCre)+' THEN CPSALLOC*(-1) ELSE CPSALLOC END) ELSE 0 END ) AS X, '+
             ' SUM( CASE WHEN TMONID = '''+DMCXP.wTMonExt+''' THEN (CASE WHEN DOCID='+QuotedStr(sNCre)+' THEN CPSALEXT*(-1) ELSE CPSALEXT END) ELSE 0 END ) AS Y FROM CXP301 WHERE '+
             ' CPFEMIS<'+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,EnCodeDate(Y,M,1))+''')'+
             ' AND (CPESTADO = ''P'' OR CPESTADO =''C'') ' +
             ' AND ((DOCID='+QuotedStr(sLet)+') OR ((DOCID='+QuotedStr(sNCre)+') AND (CPPAGEXT=0 OR CPPAGLOC=0)) )'+
             ' AND CLAUXID='+''''+FClAux+''''+
             ' AND PROV=' +''''+FCliente+'''';
      end
      else
         if SRV_D = 'ORACLE' then
         begin
         xSQL:='SELECT SUM( DECODE( TMONID, '''+DMCXP.wTMonLoc+''', ( DECODE( DOCID, '+QuotedStr(sNCre)+', CPSALLOC*(-1), CPSALLOC ) ), 0 ) ) AS X, '+
                   ' SUM( DECODE( TMONID, '''+DMCXP.wTMonExt+''', ( DECODE( DOCID, '+QuotedStr(sNCre)+', CPSALEXT*(-1), CPSALEXT ) ), 0 ) ) AS Y FROM CXP301 WHERE '+
             ' CPFEMIS<'+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,EnCodeDate(Y,M,1))+''')'+
             ' AND (CPESTADO = ''P'' OR CPESTADO =''C'') ' +
             ' AND ((DOCID='+QuotedStr(sLet)+') OR ((DOCID='+QuotedStr(sNCre)+') AND (CPPAGEXT=0 OR CPPAGLOC=0)) )'+
             ' AND CLAUXID='+''''+FClAux+''''+
             ' AND PROV=' +''''+FCliente+'''';
         end;

      DMCXP.cdsQry3.Close;
      DMCXP.cdsQry3.ProviderName:='dspTGE';
      DMCXP.cdsQry3.DataRequest(xSQL);    //este es la llamada remota al provider del servidor
      DMCXP.cdsQry3.Open;
      if DMCXP.cdsQry3.RecordCount <> 0 then
      begin
         SaldoRealL := SaldoRealL + DMCXP.cdsQry3.fieldbyname('X').AsFloat ;
         SaldoRealE := SaldoRealE + DMCXP.cdsQry3.fieldbyname('Y').AsFloat ;
      end;


      //SUMA TAMBIEN LOS CHEQUES(SUMAR)
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin //FALTA PARA ORACLE
         xSQL:='SELECT SUM( CASE WHEN TMONID = '''+DMCXP.wTMonLoc+''' THEN ECMTOLOC ELSE 0 END ) AS X, '+
             ' SUM( CASE WHEN TMONID = '''+DMCXP.wTMonExt+''' THEN ECMTOEXT ELSE 0 END ) AS Y FROM CAJA302 WHERE '+
             ' ECFCOMP<'+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,EnCodeDate(Y,M,1))+''')'+
             ' AND (ECESTADO = ''P'' OR ECESTADO =''C'') ' +
             ' AND CLAUXID='+''''+FClAux+''''+
             ' AND PROV=' +''''+FCliente+''''+
             ' AND FPAGOID='+QuotedStr(sFPagoCheque);
      end
      else
         if SRV_D = 'ORACLE' then
         begin
            xSQL:='SELECT SUM( DECODE( TMONID, '''+DMCXP.wTMonLoc+''', ECMTOLOC, 0 ) ) AS X, '+
                   ' SUM( DECODE( TMONID, '''+DMCXP.wTMonExt+''', ECMTOEXT, 0 ) ) AS Y FROM CAJA302 WHERE '+
             ' ECFCOMP<'+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,EnCodeDate(Y,M,1))+''')'+
             ' AND (ECESTADO = ''P'' OR ECESTADO =''C'') ' +
             ' AND CLAUXID='+''''+FClAux+''''+
             ' AND PROV=' +''''+FCliente+''''+
             ' AND FPAGOID='+QuotedStr(sFPagoCheque);
         end;

      DMCXP.cdsQry3.Close;
      DMCXP.cdsQry3.ProviderName:='dspTGE';
      DMCXP.cdsQry3.DataRequest(xSQL);    //este es la llamada remota al provider del servidor
      DMCXP.cdsQry3.Open;
      if DMCXP.cdsQry3.RecordCount <> 0 then
      begin
         SaldoRealL := SaldoRealL + DMCXP.cdsQry3.fieldbyname('X').AsFloat ;
         SaldoRealE := SaldoRealE + DMCXP.cdsQry3.fieldbyname('Y').AsFloat ;
      end ;

      //RESTA TAMBIEN LOS ANTICIPOS
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin //FALTA PARA ORACLE
       xSQL:='SELECT SUM( CASE WHEN TMONID = '''+DMCXP.wTMonLoc+''' THEN ECMTOLOC*(-1) ELSE 0 END ) AS X, '+
             ' SUM( CASE WHEN TMONID = '''+DMCXP.wTMonExt+''' THEN ECMTOEXT*(-1) ELSE 0 END ) AS Y FROM CAJA302 WHERE '+
             ' ECFCOMP<'+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,EnCodeDate(Y,M,1))+''')'+
             ' AND (ECESTADO = ''P'' OR ECESTADO =''C'') ' +
             ' AND EC_PROCE=''1'' AND DOCID='+QuotedStr(sAnt)+
             ' AND CLAUXID='+''''+FClAux+''' '+
             ' AND PROV=' +''''+FCliente+''' ';
      end
      else
         if SRV_D = 'ORACLE' then
         begin
          xSQL:='SELECT SUM( DECODE( TMONID, '''+DMCXP.wTMonLoc+''', ECMTOLOC*(-1), 0 ) ) AS X, '+
                   ' SUM( DECODE( TMONID, '''+DMCXP.wTMonExt+''', ECMTOEXT*(-1), 0 ) ) AS Y FROM CAJA302 WHERE '+
             ' ECFCOMP<'+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,EnCodeDate(Y,M,1))+''')'+
             ' AND (ECESTADO = ''P'' OR ECESTADO =''C'') ' +
             ' AND EC_PROCE=''1'' AND DOCID='+QuotedStr(sAnt)+
             ' AND CLAUXID='+''''+FClAux+''' '+
             ' AND PROV=' +''''+FCliente+''' ';
         end;
      DMCXP.cdsQry3.Close;
      DMCXP.cdsQry3.ProviderName:='dspTGE';
      DMCXP.cdsQry3.DataRequest(xSQL);    //este es la llamada remota al provider del servidor
      DMCXP.cdsQry3.Open;
      IF DMCXP.cdsQry3.RecordCount <> 0 then
      begin
         SaldoRealL := SaldoRealL + DMCXP.cdsQry3.fieldbyname('X').AsFloat ;
         SaldoRealE := SaldoRealE + DMCXP.cdsQry3.fieldbyname('Y').AsFloat ;
      end;

   end ;
end;

procedure TFEstCxCli.dblcNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFEstCxCli.FormShow(Sender: TObject);
var
  FDate : TDateTime;
  i     : Word;
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
   
  if Internal then
  begin
     dblcCLIE.Text  := Cliente ;
     dbeCLIE.Text := FProvDes  ;
     if Activar then
        dblcCLIE.Color := clWindow
     else
        dblcCLIE.Color := clBtnFace;

     dblcCLIE.Enabled := Activar;
//CXPWMC2803     dblcCLIEChange(nil);
  end;

  {
  stt3.Caption := floattostrf(SaldoIniL, ffNumber, 15, 2);
  stt4.Caption := floattostrf(SaldoIniE, ffNumber, 15, 2);
  }
  i:= 1;
  {
  FDate := EnCodeDate(Anio,Mes,i);
  dtpINI.Date := FDate;
  }
  dtpINI.Date := Date-360;

  dtpFIN.Date := FDate + (DaysOfMonth (Mes,Anio)-1);

  dblcCLIE.Text        := Cliente;
  dblcCLIE.Enabled     := Activar;

  Z2bbtnAceptarClick(nil);
end;

procedure TFEstCxCli.cFormat(cds : TwwClientDataSet);
begin
   with cds do begin
      TNumericField(FieldByName('CPMTOORI')).DisplayFormat :='### ### ###.#0' ;
      TNumericField(FieldByName('CPTCAMPR')).DisplayFormat :='### ### ###.#0' ;
      TNumericField(FieldByName('MTOLOC')).DisplayFormat   :='### ### ##0.00' ;
      TNumericField(FieldByName('MTOEXT')).DisplayFormat   :='### ### ##0.00' ;
      TNumericField(FieldByName('SALLOC')).DisplayFormat   :='### ### ##0.00' ;
      TNumericField(FieldByName('PAGLOC')).DisplayFormat   :='### ### ##0.00' ;
      TNumericField(FieldByName('PAGEXT')).DisplayFormat   :='### ### ##0.00' ;
      TNumericField(FieldByName('SALEXT')).DisplayFormat   :='### ### ##0.00' ;
      TNumericField(FieldByName('CPMTOLOC')).DisplayFormat :='### ### ###.#0' ;
      TNumericField(FieldByName('CPPAGLOC')).DisplayFormat :='### ### ###.#0' ;
      TNumericField(FieldByName('CPSALLOC')).DisplayFormat :='### ### ###.#0' ;
      TNumericField(FieldByName('CPMTOEXT')).DisplayFormat :='### ### ###.#0' ;
      TNumericField(FieldByName('CPPAGEXT')).DisplayFormat :='### ### ###.#0' ;
      TNumericField(FieldByName('CPSALEXT')).DisplayFormat :='### ### ###.#0' ;
      TNumericField(FieldByName('COL_2')).DisplayFormat    :='### ### ##0.00' ;
      TNumericField(FieldByName('COL_3')).DisplayFormat    :='### ### ##0.00' ;
   end;
end;

procedure TFEstCxCli.cFooter(dbg : TwwDBGrid; cds : TwwClientDataSet);
var
  Mloc, MExt : Double;
begin
  Mloc := OperClientDataSet( cds , 'SUM(MTOLOC)', '');
  MExt := OperClientDataSet( cds , 'SUM(MTOEXT)', '');
  dbg.ColumnByName('MTOLOC').FooterValue  :=floattostrf(MLoc, ffNumber, 15, 2);
  dbg.ColumnByName('MTOEXT').FooterValue  :=floattostrf(MExt, ffNumber, 15, 2);

  Mloc := OperClientDataSet( cds , 'SUM(SALLOC)', '');
  MExt := OperClientDataSet( cds , 'SUM(SALEXT)', '');
  dbg.ColumnByName('SALLOC').FooterValue  :=floattostrf(MLoc, ffNumber, 15, 2);
  dbg.ColumnByName('SALEXT').FooterValue  :=floattostrf(MExt, ffNumber, 15, 2);
{wmc2303
  loca := OperClientDataSet( cds , 'SUM(CCMTOLOC)', '');
  pag  := OperClientDataSet( cds , 'SUM(CCPAGLOC)', '');
  sal  := OperClientDataSet( cds , 'SUM(CCSALLOC)', '');
  dbg.ColumnByName('CCMTOLOC').FooterValue:=floattostrf(loca, ffNumber, 15, 2);
  dbg.ColumnByName('CCPAGLOC').FooterValue:=floattostrf(pag,  ffNumber, 15, 2);
  dbg.ColumnByName('CCSALLOC').FooterValue:=floattostrf(sal,  ffNumber, 15, 2);

  extr := OperClientDataSet( cds , 'SUM(CCMTOEXT)', '');
  pag  := OperClientDataSet( cds , 'SUM(CCPAGEXT)', '');
  col1 := OperClientDataSet( cds , 'SUM(CCSALEXT)', '');
  dbg.ColumnByName('CCMTOEXT').FooterValue:=floattostrf(extr, ffNumber, 15, 2);
  dbg.ColumnByName('CCPAGEXT').FooterValue:=floattostrf(pag,  ffNumber, 15, 2);
  dbg.ColumnByName('CCSALEXT').FooterValue:=floattostrf(col1, ffNumber, 15, 2);
}
  loca := OperClientDataSet( cds , 'SUM(MTOLOC)', '');
  pag  := OperClientDataSet( cds , 'SUM(PAGLOC)', '');
  dbg.ColumnByName('MTOLOC').FooterValue:=floattostrf(loca, ffNumber, 15, 2);
  dbg.ColumnByName('PAGLOC').FooterValue:=floattostrf(pag,  ffNumber, 15, 2);

  extr := OperClientDataSet( cds , 'SUM(MTOEXT)', '');
  pag  := OperClientDataSet( cds , 'SUM(PAGEXT)', '');
  dbg.ColumnByName('MTOEXT').FooterValue:=floattostrf(extr, ffNumber, 15, 2);
  dbg.ColumnByName('PAGEXT').FooterValue:=floattostrf(pag,  ffNumber, 15, 2);

  col2 := OperClientDataSet( cds ,'SUM(COL_2)', '');
  col3 := OperClientDataSet( cds ,'SUM(COL_3)', '');
  dbg.ColumnByName('COL_2').FooterValue   :=floattostrf(col2, ffNumber, 15, 2);
  dbg.ColumnByName('COL_3').FooterValue   :=floattostrf(col3, ffNumber, 15, 2);
  dbg.FooterCellColor := clInfoBk;
end;

procedure TFEstCxCli.ProcessSaldo;
var
  nSaldoAcu, nSaldoAnt, nSaldo,
  eSaldoLOC, eSaldoEXT,
  eSaldoAcu, eSaldoAnt, eSaldo : Double;
begin
   //WMC2303
   //En este procedimiento he
   //cambiado todos los CC p. ej. CCMTOLOC por MTOLOC
   with cds do
   begin
      DisableControls ;
      First ;

      nSaldoAnt := SaldoRealL ;
      eSaldoAnt := SaldoRealE ;

      nSaldo    := 0 ;
      eSaldo    := 0 ;

      while not eof do
      begin

         if FieldByName('DOCRESTA').AsString = 'S' then
         begin
{wmc2303
            nSaldo := FieldByName('CCSALLOC').AsFloat*(-1);
            eSaldo := FieldByName('CCSALEXT').AsFloat*(-1);
}
            nSaldo := FieldByName('SALLOC').AsFloat*(-1);
            eSaldo := FieldByName('SALEXT').AsFloat*(-1);
         end
         else
         begin
{wmc2303
            nSaldo := FieldByName('CCSALLOC').AsFloat;
            eSaldo := FieldByName('CCSALEXT').AsFloat;
}
            nSaldo := FieldByName('SALLOC').AsFloat;
            eSaldo := FieldByName('SALEXT').AsFloat;
         end;

         nSaldoAcu := nSaldoAnt + nSaldo;
         nSaldoAnt := nSaldoAcu;

         eSaldoAcu := eSaldoAnt + eSaldo;
         eSaldoAnt := eSaldoAcu;

         Edit;

         // saldos  en moneda local y extrajera
         FieldByName('COL_2').AsFloat := 0;
         FieldByName('COL_3').AsFloat := 0;

         if StrToFloat(stcam)>1 then begin

            if FieldByName('SALLOC').Visible then begin
               if DMCXP.wTMonLoc=FieldByName('TMONID').AsString then begin
                  eSaldoLOC := FieldByName('SALLOC').AsFloat;
                  FieldByName('COL_2').AsFloat := eSaldoLOC;
                  eSaldoEXT := FieldByName('SALLOC').AsFloat/StrToFloat(stcam);
                  FieldByName('COL_3').AsFloat := eSaldoEXT;
               end
               else begin
                  eSaldoLOC := FieldByName('SALEXT').AsFloat*StrToFloat(stcam);
                  FieldByName('COL_2').AsFloat := eSaldoLOC;
                  eSaldoEXT := FieldByName('SALEXT').AsFloat;
                  FieldByName('COL_3').AsFloat := eSaldoEXT;
               end;
            end
            else begin
               if DMCXP.wTMonLoc=FieldByName('TMONID').AsString then
               begin
                  eSaldoLOC := FieldByName('MTOLOC').AsFloat;
                  FieldByName('COL_2').AsFloat := eSaldoLOC;
                  eSaldoEXT := FieldByName('MTOLOC').AsFloat/StrToFloat(stcam);
                  FieldByName('COL_3').AsFloat := eSaldoEXT;
               end
               else begin
                  eSaldoLOC := FieldByName('MTOEXT').AsFloat*StrToFloat(stcam);
                  FieldByName('COL_2').AsFloat := eSaldoLOC;
                  eSaldoEXT := FieldByName('MTOEXT').AsFloat;
                  FieldByName('COL_3').AsFloat := eSaldoEXT;
               end;
            end;
         end;
         Post;
         Next;
      end;
      First;
      EnableControls;
   end;
end;

procedure TFEstCxCli.dbgEst2CalCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if (Field.FieldName = 'COL_2') or (Field.FieldName = 'COL_3')  then
    if (not Highlight) then
    begin
      ABrush.Color := clInfoBk;
      AFont.Color := clBlue;
      AFont.Style := AFont.Style + [fsBold];
    end
    else begin
      AFont.Color := clHighlightText;
    end;

  if (Field.FieldName = 'TMONABR') then
  begin
     if MonLocal(DMCXP.cdsQry2.Fieldbyname('TMONABR').AsString) then
     begin
        if (not Highlight) then
        begin
          AFont.Color := clBlue;
        end
        else begin
          AFont.Color := clHighlightText;
        end;
     end else begin
        if (not Highlight) then
        begin
          AFont.Color := clGreen;
        end
        else begin
          AFont.Color := clHighlightText;
        end;
     end;
  end;
{wmc2303
  if (Field.FieldName = 'CCMTOLOC') or (Field.FieldName = 'CCPAGLOC')
        or (Field.FieldName = 'CCSALLOC') or (Field.FieldName = 'MTOLOC')
        or (Field.FieldName = 'SALLOC')  then begin
     if (not Highlight) then
     begin
        AFont.Color := clBlue;
     end
     else begin
        AFont.Color := clHighlightText;
     end;
  end;
  if (Field.FieldName = 'CCMTOEXT') or (Field.FieldName = 'CCPAGEXT')
        or (Field.FieldName = 'CCSALEXT') or (Field.FieldName = 'MTOEXT')
        or (Field.FieldName = 'SALEXT')  then begin
     if (not Highlight) then
     begin
        AFont.Color := clGreen;
     end
     else begin
        AFont.Color := clHighlightText;
     end;
  end;
}
  if (Field.FieldName = 'CPFVCMTO') then
  begin
     if DMCXP.cdsQry4.Fieldbyname('CPFVCMTO').AsDateTime>Date then
     begin
        if (not Highlight) then
        begin
          AFont.Color := clBlack;
        end
        else begin
          AFont.Color := clHighlightText;
        end;
     end
     else
     if DMCXP.cdsQry4.Fieldbyname('CPFVCMTO').AsDateTime<Date then
     begin
        if (not Highlight) then
        begin
          AFont.Color := clRed;
        end
        else begin
          AFont.Color := clHighlightText;
        end;
     end;
  end;

  if (Field.FieldName = 'MTOLOC') or (Field.FieldName = 'PAGLOC')
        or (Field.FieldName = 'SALLOC') then begin
     if (not Highlight) then
     begin
        AFont.Color := clBlue;
     end
     else begin
        AFont.Color := clHighlightText;
     end;
  end;
  if (Field.FieldName = 'MTOEXT') or (Field.FieldName = 'PAGEXT')
        or (Field.FieldName = 'SALEXT') then begin
     if (not Highlight) then
     begin
        AFont.Color := clGreen;
     end
     else begin
        AFont.Color := clHighlightText;
     end;
  end;

end;

function TFEstCxCli.MonLocal(const CodMoneda: String): Boolean;
var
  bmk : TBookMark;
begin
   bmk:=DMCXP.cdsTMon.GetBookmark;

   result := DMCXP.cdsTMon.Locate('TMONABR',CodMoneda,[]);

   if result then
     result := DMCXP.cdsTMon.FieldByName('TMON_LOC').AsString = 'L';

   DMCXP.cdsTMon.GotoBookmark(bmk);
   DMCXP.cdsTMon.FreeBookmark(bmk);
end;

procedure TFEstCxCli.Z2bbtnCancelClick(Sender: TObject);
begin
   Close;
end;

function TFEstCxCli.NomMoneda(const CodMoneda: String): String;
var
  bmk : TBookMark;
begin
   bmk:=DMCXP.cdsTMon.GetBookmark;
   result := '';
   if DMCXP.cdsTMon.Locate('TMONID',CodMoneda,[]) then
     result := DMCXP.cdsTMon.FieldByName('TMONDES').AsString;

   DMCXP.cdsTMon.GotoBookmark(bmk);
   DMCXP.cdsTMon.FreeBookmark(bmk);
end;

procedure TFEstCxCli.cGRID(dbg : TwwDBGrid);
begin

   with dbg.Selected do begin
      Clear;

      if dbg.Name='dbgEst2' then
      begin
         Add('DOCABR'#9'8'#9'Tipo~Doc.'#9'F');
         Add('CPNODOC'#9'6'#9'Nº de~Doc.'#9'F');
      end
      else
      begin
{CXPWMC2803
         Add('SITUADES'#9'10'#9'Situación'#9'F');
         Add('UBICADES'#9'10'#9'Ubicación'#9'F');
}
         Add('CPNODOC'#9'14'#9'Nº de~Letra'#9'F');
      end;

      Add('CPFEMIS'#9'10'#9'Fecha ~Emisión'#9'F');
//      if dbg.Name='dbgEst3' then
         Add( 'CPFVCMTO'#9'10'#9'Fecha de~Vencimiento'#9'F' );

      Add( 'CPTCAMPR'#9'4'#9'T.C.'#9'F' );
      Add( 'TMONABR'#9'4'#9'T.M.'#9'F' );

      if dbg.Name='dbgEst2' then
      begin
         Add('MTOLOC'#9'10'#9'Cargo~(MN)'#9'F');
         Add('PAGLOC'#9'10'#9'Abono~(MN)'#9'F');
         Add('SALLOC'#9'10'#9'Saldo~(MN)'#9'F');
      end
      else
         Add('MTOLOC'#9'14'#9'Importe~(MN)'#9'F');

      if dbg.Name='dbgEst2' then
      begin
         Add('MTOEXT'#9'10'#9'Cargo~(ME)'#9'F') ;
         Add('PAGEXT'#9'10'#9'Abono~(ME)'#9'F') ;
         Add('SALEXT'#9'10'#9'Saldo~(ME)'#9'F') ;
      end
      else
         Add('MTOEXT'#9'14'#9'Importe~(ME)'#9'F');
{wmc2203
      Add('CCMTOLOC'#9'14'#9'Importe~Mon.Nacional'#9'F');
      if dbg.Name='dbgEst2' then begin
         Add('CCPAGLOC'#9'14'#9'Importe~Pagado'#9'F');
         Add('CCSALLOC'#9'14'#9'Saldo~Mon. Local'#9'F');
      end;
      Add('CCMTOEXT'#9'14'#9'Importe~Mon.Extranjera'#9'F');
      if dbg.Name='dbgEst2' then begin
         Add('CCPAGEXT'#9'14'#9'Importe~Pagado'#9'F');
         Add('CCSALEXT'#9'14'#9'Saldo~Mon. Extranjera'#9'F');
      end;
}
      Add('COL_2'#9'12'#9'Saldo ~al T.C.(MN)'#9'F');
      Add('COL_3'#9'10'#9'Saldo ~al T.C.(ME)'#9'F');
  end;
end;


procedure TFEstCxCli.Totales;
var
//   xTotS, xTotD : Double;
   xTotS, xTotD{, xTotSTC, xTotDTC?} : Single;
begin
{wmc2603
    xTotS:=OperClientDataSet( DMCXP.cdsQry2, 'SUM(CCSALLOC)', '') + OperClientDataSet( DMCXP.cdsQry4, 'SUM(CCSALLOC)', '');
    xTotD:=OperClientDataSet( DMCXP.cdsQry2, 'SUM(CCSALEXT)', '') + OperClientDataSet( DMCXP.cdsQry4, 'SUM(CCSALEXT)', '');
}
    xTotS:=OperClientDataSet( DMCXP.cdsQry2, 'SUM(SALLOC)', '') + OperClientDataSet( DMCXP.cdsQry4, 'SUM(SALLOC)', '');
    xTotD:=OperClientDataSet( DMCXP.cdsQry2, 'SUM(SALEXT)', '') + OperClientDataSet( DMCXP.cdsQry4, 'SUM(SALEXT)', '');
   // saldos aplicandoles tipo de cambio
{wmc2603
   xTotSTC:=OperClientDataSet( DMCXP.cdsQry2, 'SUM(COL_2)', '')+OperClientDataSet( DMCXP.cdsQry4, 'SUM(COL_2)', '');
   xTotDTC:=OperClientDataSet( DMCXP.cdsQry2, 'SUM(COL_3)', '')+OperClientDataSet( DMCXP.cdsQry4, 'SUM(COL_3)', '');
}
   dbe3.Caption:=floattostrf( xTotS, ffNumber, 15, 2);
   dbe4.Caption:=floattostrf( xTotD, ffNumber, 15, 2);

   dbe1.Caption:=floattostrf( xTotS+SaldoRealL, ffNumber, 15, 2);
   dbe2.Caption:=floattostrf( xTotD+SaldoRealE, ffNumber, 15, 2);
end;


procedure TFEstCxCli.dbgEst2DblClick(Sender: TObject);
begin
   //Código Adicional de WMC

   if ((dbgEst2.DataSource.DataSet.FieldByName('PAGLOC').AsFloat = 0)
         or dbgEst2.DataSource.DataSet.FieldByName('PAGLOC').IsNull )
      and ((dbgEst2.DataSource.DataSet.FieldByName('PAGEXT').AsFloat = 0)
             or dbgEst2.DataSource.DataSet.FieldByName('PAGEXT').IsNull ) then
   begin
      Raise Exception.Create('No hay abonos Efectuados a Este Documento') ;
   end ;
   
   //
   Screen.Cursor := crHourGlass;

   FDetAmo.Generate;
   ShowWindow( FDetAmo.Handle, SW_HIDE);

   FDetAmo.Compania   := DMCXP.cdsQry2.FieldByName('CIAID').AsString;
   FDetAmo.TDocumento := DMCXP.cdsQry2.FieldByName('DOCID').AsString;
   FDetAmo.Documento  := DMCXP.cdsQry2.FieldByName('CPNODOC').AsString;
   FDetAmo.Serie      := DMCXP.cdsQry2.FieldByName('CPSERIE').AsString;
   FDetAmo.Cliente    := DMCXP.cdsQry2.FieldByName('PROV').AsString;
   FDetAmo.MonLoc     := (DMCXP.cdsQry2.FieldByName('TMON_LOC').AsString='L');

   if FDetAmo.MonLoc then
   begin
      FDetAmo.DImporte:= DMCXP.cdsQry2.FieldByName('MTOLOC').AsFloat ;
      FDetAmo.DSaldo  := DMCXP.cdsQry2.FieldByName('SALLOC').AsFloat ;
      end
   else begin
      FDetAmo.DImporte:= DMCXP.cdsQry2.FieldByName('MTOEXT').AsFloat ;
      FDetAmo.DSaldo  := DMCXP.cdsQry2.FieldByName('SALEXT').AsFloat ;
   end;
   //lLENAR CLIENTE Y TIPO DE DOCUMENTO
   With FDetAmo do
   begin
     dbeCLIE.Text := self.dbeCLIE.Text ;
     dbeTDOC.Text := DMCXP.cdsQry2.fielDbyname('DOCABR').AsString ;
   end ;
   //
   FDetAmo.ShowModal;

   Screen.Cursor := crDefault;

end;

procedure TFEstCxCli.FormDestroy(Sender: TObject);
begin
 FDetAmo.Free;
 FDetAmo := nil;
end;

procedure TFEstCxCli.cLetras;
begin
   sSQL2 := sSQL;

   DMCXP.cdsQry4.ProviderName := 'dspTGE';
   DMCXP.cdsQry4.Close;
   DMCXP.cdsQry4.DataRequest(sSQL2);
   DMCXP.cdsQry4.Open;
end;

procedure TFEstCxCli.DOCUMBeforePrint(Sender: TObject);
begin
   pplblESTADO.Caption  := rgEST.Items.Strings[rgEST.ItemIndex];
   pplblPERIODO.Caption := dtpINI.Text+' al '+dtpFIN.Text;
   {
   pplblSalLoc.Caption  := stt3.Caption ;
   pplblSalExt.Caption  := stt4.Caption ;
   }
   pdb1.DataField := 'MTOLOC'; // Importe Local
   plim1.Caption  := 'Importe';
   pdb2.DataField := 'SALLOC';
   plim2.Caption  := 'Saldo';

   pdb3.DataField := 'MTOEXT';
   plim3.Caption  := 'Importe';
   pdb4.DataField := 'SALEXT';
   plim4.Caption  := 'Saldo';

//wmc2303   pdb5.DataField := 'CCMTOLOC';
   pdb5.DataField := 'MTOLOC';
   plim5.Caption  := 'Importe';
   pdb6.DataField := 'CPPAGLOC';
   plim6.Caption  := 'Pagado';;
   pdb7.DataField := 'CPSALLOC';
   plim7.Caption  := 'Saldo';

   pdb8.DataField := 'CPMTOEXT';
   plim8.Caption  := 'Importe';
   pdb9.DataField := 'CPPAGEXT';
   plim9.Caption  := 'Pagado';;
   pdb0.DataField := 'CPSALEXT';
   plim0.Caption  := 'Saldo';

   ppdbMon.DataField := 'TMONABR';
   ppdbDoc.DataField := 'DOCDES';
end;

procedure TFEstCxCli.bbtnPrintClick(Sender: TObject);
var
   xxSQL : String;
begin
   xxSQL:= 'Select CXP.*, TM.*, DOC.DOCID, DOC.DOCDES, DOC.DOCABR '
         + 'From CXP305 CXP, TGE103 TM, TGE110 DOC '
         + 'WHERE PROV=''09579288'' AND '
         + 'CXP.TMONID=TM.TMONID AND '
         + 'CXP.DOCID2=DOC.DOCID AND ''CXP''=DOC.DOCMOD ';

   DMCXP.cdsQry5.Close;
   DMCXP.cdsQry5.ProviderName:='dspTGE';
   DMCXP.cdsQry5.DataRequest(xxSQL);    //este es la llamada remota al provider del servidor
   DMCXP.cdsQry5.Open;
   DMCXP.cdsQry5.IndexFieldNames:= 'CIAID;DOCID;CPSERIE;CPNODOC';
   DMCXP.cdsQry5.MasterFields   := 'CIAID;DOCID;CPSERIE;CPNODOC';
   DMCXP.cdsQry5.MasterSource   := DMCXP.dsQry2;

   ppReportF.Print;

   DMCXP.cdsQry5.MasterFields   := '';
   DMCXP.cdsQry5.IndexFieldNames:= '';
   DMCXP.cdsQry5.MasterSource   := Nil;
end;

procedure TFEstCxCli.ppTitleBand4BeforePrint(Sender: TObject);
begin
   pdbl1.DataField := 'MTOLOC'; //
   pliml1.Caption  := 'Importe Mon. Local';

   pdbl2.DataField := 'MTOEXT';
   pliml2.Caption  := 'Importe Mon. Extranjera';

//wmc2303   pdbl3.DataField := 'CCMTOLOC';
   pdbl3.DataField := 'MTOLOC';
   pliml3.Caption  := 'Total en Mon. Local';

   pdbl4.DataField := 'CPMTOEXT';
   pliml4.Caption  := 'Total en Mon. Extranjera';
end;

procedure TFEstCxCli.ppReportFPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;
end;

procedure TFEstCxCli.ppHeaderBand1BeforePrint(Sender: TObject);
begin
   pplCia.Caption := xCiaDes;
   pplPeriodo.Caption := dtpINI.Text+' al '+dtpFIN.Text;
end;

procedure TFEstCxCli.ppDetailBand5BeforePrint(Sender: TObject);
begin
   pplExt.Visible  := False;
   ppdbExt.Visible := False;
   pplLoc.Visible  := False;
   ppdbLoc.Visible := False;
   if DMCXP.cdsQry5.FieldByName( 'TMONID' ).AsString=DMCXP.wTMonLoc then begin
      pplLoc.Visible  := True;
      ppdbLoc.Visible := True;
   end;
   if DMCXP.cdsQry5.FieldByName( 'TMONID' ).AsString=DMCXP.wTMonExt then begin
      pplExt.Visible  := True;
      ppdbExt.Visible := True;
   end
end;

procedure TFEstCxCli.BitBtn1Click(Sender: TObject);
var
   xxSQL, xxCia : String;
begin
(*wmc2903
   xxSQL:='SELECT DOC.DOCID AS TCANJEID, CXP.CPNODOC, CXP.CPFEMIS AS CPFCANJE, '
   +'CXP.CPSERIE AS CPSERIE2, MON.TMONID,MON.TMONABR, DOC.DOCID, '
   +'DOC.DOCDES, CXP.CPTCAMPR AS TCAMBIO, '
{WMC2303
   +'CASE WHEN DOC.DOC_FREG<>''N'' THEN '+DMCXP.wReplacCeros+'(CXC.CCMTOLOC,0) ELSE 0 END AS CARGOMN, '
   +'CASE WHEN DOC.DOC_FREG<>''N'' THEN '+DMCXP.wReplacCeros+'(CXC.CCMTOEXT,0) ELSE 0 END AS CARGOME, '
   +'CASE WHEN DOC.DOC_FREG= ''N'' THEN '+DMCXP.wReplacCeros+'(CXC.CCMTOLOC,0) ELSE 0 END AS ABONOMN, '
   +'CASE WHEN DOC.DOC_FREG= ''N'' THEN '+DMCXP.wReplacCeros+'(CXC.CCMTOEXT,0) ELSE 0 END AS ABONOME, '
}
   +'CASE WHEN DOC.DOC_FREG<>''N'' THEN  CASE WHEN CXP.TMONID = ''' + DMCXP.wTMonLoc + ''' THEN CXP.CPMTOORI ELSE 0 END  ELSE 0 END AS CARGOMN, '
   +'CASE WHEN DOC.DOC_FREG<>''N'' THEN  CASE WHEN CXP.TMONID = ''' + DMCXP.wTMonExt + ''' THEN CXP.CPMTOORI ELSE 0 END  ELSE 0 END AS CARGOME, '
   +'CASE WHEN DOC.DOC_FREG= ''N'' THEN  CASE WHEN CXP.TMONID = ''' + DMCXP.wTMonLoc + ''' THEN CXP.CPMTOORI ELSE 0 END  ELSE 0 END AS ABONOMN, '
   +'CASE WHEN DOC.DOC_FREG= ''N'' THEN  CASE WHEN CXP.TMONID = ''' + DMCXP.wTMonExt + ''' THEN CXP.CPMTOORI ELSE 0 END  ELSE 0 END AS ABONOME, '

   +'CASE WHEN DOC.DOC_FREG= ''N'' THEN ''B'' ELSE ''A'' END AS ORDENQRY '
   +'FROM CXP301 CXP '
   +'LEFT JOIN TGE103 MON ON (CXP.TMONID=MON.TMONID) '
   +'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID and ''CXP''=DOC.DOCMOD ), '
   +'TGE201 PROVE '

   +'WHERE CXP.PROV='+''''+Cliente+''''+' AND '
   +'CXP.CPFEMIS>=DATE('''+FormatDateTime(DMCXP.wFormatFecha,dtpINI.Date)+''') AND '
   +'CXP.CPFEMIS<=DATE('''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''') AND '
   +'DOC.DOC_FREG<>''L'' AND '
   +'( CXP.CPESTADO=''P'' OR CXP.CPESTADO=''C'' ) '

   +'UNION '

//CXPWMC2803   +'SELECT CXP.TCANJEID, CXP.CPCANJE AS CPNODOC, CXP.CPFCANJE, '
   +'SELECT CXP.TCANJEID, CXP.CCPCANJE AS CPNODOC, CXP.CCPFCJE CPFCANJE, '
   +''' '' as CPSERIE2, TM.TMONID, TM.TMONABR, DOC.DOCID, ''CANJE'' as DOCDES, '
//CXPWMC2803   +'CXP.DCPTCAMB AS TCAMBIO, 0.00 AS CARGOMN, 0.00 AS CARGOME, '
   +'CXP.DCDTCAMB AS TCAMBIO, 0.00 AS CARGOMN, 0.00 AS CARGOME, '
//CXPWMC2803   +'Sum(CXP.DCPMTOLOC) as ABONOMN, sum(CXP.DCPMTOEXT) AS ABONOME, '
   +'Sum(CXP.DCDMOLOC) as ABONOMN, sum(CXP.DCDMOEXT) AS ABONOME, '
   +'''B'' AS ORDENQRY '
   +'From CXP305 CXP, TGE103 TM, TGE110 DOC '
   +'WHERE PROV='+''''+Cliente+''''+' AND '
   +'CXP.TCANJEID=''LC'' AND '
   +'CXP.TMONID=TM.TMONID AND '
   +'CXP.DOCID2=DOC.DOCID AND ''CXP''=DOC.DOCMOD AND '
// +'CXC.CCFCANJE>=DATE('''+FormatDateTime(DMCXP.wFormatFecha,dtpINI.Date)+''') AND '
//CXPWMC2803   +'CXP.CPFCANJE<=DATE('''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''') '
   +'CXP.CCPFCJE<=DATE('''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''') '
//CXPWMC2803   +'Group By CXP.TCANJEID,  CXP.CPCANJE,   CXP.CPFCANJE, CPSERIE2, '
   +'Group By CXP.TCANJEID,  CXP.CCPCANJE,   CXP.CCPFCJE, CPSERIE2, '
//CXPWMC2803   +'TM.TMONID, TM.TMONABR, DOC.DOCID, DOC.DOCDES, DOC.DOCABR, CXP.DCPTCAMB '
   +'TM.TMONID, TM.TMONABR, DOC.DOCID, DOC.DOCDES, DOC.DOCABR, CXP.DCDTCAMB '

   +'ORDER BY ORDENQRY,CPFCANJE ';

   DMCXP.cdsQry5.Close;
   DMCXP.cdsQry5.ProviderName:='dspTGE';
   DMCXP.cdsQry5.DataRequest(xxSQL);    //este es la llamada remota al provider del servidor
   DMCXP.cdsQry5.Open;
*)
   xCiaDes:= DMCXP.cdsCia.FIELDBYNAME('Ciades').AsString;

   ppReport2.Print;
end;

procedure TFEstCxCli.ppHeaderBand2BeforePrint(Sender: TObject);
begin

   pplTitulo.Caption := 'Estado de Cta.Cte. Proveedor: '
                      + TRIM(DMCXP.cdsQry2.FieldByname('PROV').AsString)+' '
                      + TRIM(DMCXP.cdsQry2.FieldByname('PROVDES').AsString);

   pplCia.Caption    := xCiaDes;
   pplPeriodo.Caption:= dtpINI.Text+' al '+dtpFIN.Text;
   {
   pplSalMN.Caption  := stt3.Caption;
   pplSalME.Caption  := stt4.Caption;
   pplMovMN.Caption  := dbe3.Caption;
   pplMovME.Caption  := dbe4.Caption;
   pplActMN.Caption  := dbe1.Caption;
   pplActME.Caption  := dbe2.Caption;
   }
end;

procedure TFEstCxCli.dbgEst2TitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   if AfieldName='CPNODOC' then begin
      DMCXP.cdsQry2.IndexFieldNames:='CPNODOC';
   end;
   if AfieldName='CPFEMIS' then begin
      DMCXP.cdsQry2.IndexFieldNames:='CPFEMIS';
   end;
end;

procedure TFEstCxCli.dbgEst3TitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   if AfieldName='CPNODOC' then begin
      DMCXP.cdsQry4.IndexFieldNames:='CPNODOC';
   end;
   if AfieldName='CPFEMIS' then begin
      DMCXP.cdsQry4.IndexFieldNames:='CPFEMIS';
   end;
   if AfieldName='CPFVCMTO' then begin
      DMCXP.cdsQry4.IndexFieldNames:='CPFVCMTO';
   end;
end;

procedure TFEstCxCli.dbgEst2CalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
   if (AFieldName='CPNODOC') or (AFieldName='CPFEMIS') then
      Afont.Color:=clRed;
end;

procedure TFEstCxCli.dbgEst3CalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
   if (AFieldName='CPNODOC') or (AFieldName='CPFEMIS') or (AFieldName='CPFVCMTO') then
      Afont.Color:=clRed;
end;

procedure TFEstCxCli.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;

end;

procedure TFEstCxCli.ppReport2PreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;
end;

procedure TFEstCxCli.cFooterCheque(dbg: TwwDBGrid; cds: TwwClientDataSet);
var
  Mloc, MExt,TLoc,TExt : Double;
begin
  Mloc := OperClientDataSet( cds , 'SUM(ECMTOLOC)', '');
  MExt := OperClientDataSet( cds , 'SUM(ECMTOEXT)', '');
  dbg.ColumnByName('ECMTOLOC').FooterValue  :=floattostrf(MLoc, ffNumber, 15, 2);
  dbg.ColumnByName('ECMTOEXT').FooterValue  :=floattostrf(MExt, ffNumber, 15, 2);
  dbg.FooterCellColor := clInfoBk;
  dbg.RedrawGrid;
end;

procedure TFEstCxCli.cFooterAnticipo(dbg: TwwDBGrid; cds: TwwClientDataSet);
var
  Mloc, MExt,TLoc,TExt : Double;
begin
  Mloc := OperClientDataSet( cds , 'SUM(ECMTOLOC)', '');
  MExt := OperClientDataSet( cds , 'SUM(ECMTOEXT)', '');
  dbg.ColumnByName('ECMTOLOC').FooterValue  :=floattostrf(MLoc, ffNumber, 15, 2);
  dbg.ColumnByName('ECMTOEXT').FooterValue  :=floattostrf(MExt, ffNumber, 15, 2);
  dbg.FooterCellColor := clInfoBk;
  dbg.RedrawGrid;
end;

procedure TFEstCxCli.cFooterNCredito(dbg: TwwDBGrid; cds: TwwClientDataSet);
var
  Mloc, MExt,TLoc,TExt,PLoc,PExt : Double;
begin
  Mloc := OperClientDataSet( cds , 'SUM(CPMTOLOC)', '');
  MExt := OperClientDataSet( cds , 'SUM(CPMTOEXT)', '');
  Tloc := OperClientDataSet( cds , 'SUM(CPSALLOC)', '');
  TExt := OperClientDataSet( cds , 'SUM(CPSALEXT)', '');
  Ploc := OperClientDataSet( cds , 'SUM(CPPAGLOC)', '');
  PExt := OperClientDataSet( cds , 'SUM(CPPAGEXT)', '');
  dbg.ColumnByName('CPMTOLOC').FooterValue  :=floattostrf(MLoc, ffNumber, 15, 2);
  dbg.ColumnByName('CPMTOEXT').FooterValue  :=floattostrf(MExt, ffNumber, 15, 2);
  dbg.ColumnByName('CPPAGLOC').FooterValue  :=floattostrf(PLoc, ffNumber, 15, 2);
  dbg.ColumnByName('CPPAGEXT').FooterValue  :=floattostrf(PExt, ffNumber, 15, 2);
  dbg.ColumnByName('CPSALLOC').FooterValue  :=floattostrf(TLoc, ffNumber, 15, 2);
  dbg.ColumnByName('CPSALEXT').FooterValue  :=floattostrf(TExt, ffNumber, 15, 2);
  dbg.FooterCellColor := clInfoBk;
  dbg.RedrawGrid;
end;



end.
