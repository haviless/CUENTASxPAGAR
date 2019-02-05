unit CXP420;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, wwdbedit, wwdblook, wwdbdatetimepicker,
  Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, db, DBClient, wwclient, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppCtrls,
  ppPrnabl, ppBands, ppVar, ppStrtch, ppSubRpt, ppViewr, ppModule, daDatMod,
  ComCtrls, ppEndUsr,wwdatsrc, ppCache, Menus, Wwkeycb, ppMemo,
  Spin, variants, pptypes;

type
  TFEstCxCPro = class(TForm)
    pnlFOOT: TPanel;
    Z2bbtnCancel: TBitBtn;
    bbtnPrint: TBitBtn;
    pnlHEAD: TPanel;
    ppDBPipelineF: TppDBPipeline;
    ppDBPipelineL: TppDBPipeline;
    ppDBPipelineN: TppDBPipeline;
    BitBtn1: TBitBtn;
    ppdbp1: TppDBPipeline;
    ppdbp2: TppDBPipeline;
    pgcDctos: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    dbgEst2: TwwDBGrid;
    ppDBPipelineC: TppDBPipeline;
    ppDBPipelineA: TppDBPipeline;
    ppDesigner1: TppDesigner;
    TabSheet4: TTabSheet;
    Panel5: TPanel;
    dbgEst6: TwwDBGrid;
    pprCtaCte: TppReport;
    ppdbCtaCte: TppDBPipeline;
    ppDBPipelineDF: TppDBPipeline;
    ppDBPipelineDL: TppDBPipeline;
    ppDBPipelineDC: TppDBPipeline;
    ppDBPipelineDA: TppDBPipeline;
    pnlLetras: TPanel;
    dbgHist: TwwDBGrid;
    TabSheet5: TTabSheet;
    Panel2: TPanel;
    dbgEst3: TwwDBGrid;
    TabSheet6: TTabSheet;
    Panel6: TPanel;
    dbgTodos: TwwDBGrid;
    ppRepAnos: TppReport;
    dbplRepAnos: TppDBPipeline;
    Z2bbtnRepAnos: TBitBtn;
    ppHeaderBand3: TppHeaderBand;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    ppLabel152: TppLabel;
    ppLabel153: TppLabel;
    ppLabel154: TppLabel;
    ppLabel155: TppLabel;
    ppLabel156: TppLabel;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppLabel159: TppLabel;
    pplRATitulo: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppLabel160: TppLabel;
    ppLine1: TppLine;
    ppLabel161: TppLabel;
    ppDetailBand10: TppDetailBand;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppFooterBand2: TppFooterBand;
//    ExtraOptions1: TExtraOptions;
    pgcDatCli: TPageControl;
    tshDatCliente: TTabSheet;
    tshEstDctos: TTabSheet;
    lblTipCam: TLabel;
    dbeTCAMB: TwwDBEdit;
    Label11: TLabel;
    dbeCLIE: TwwDBEdit;
    gbPER: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dtpINI: TwwDBDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    dbeDirec: TwwDBEdit;
    dbeDistrito: TwwDBEdit;
    dbeTelf: TwwDBEdit;
    dbeSalAntME: TwwDBEdit;
    dbeCargosME: TwwDBEdit;
    dbeAbonosME: TwwDBEdit;
    dbeSalActME: TwwDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    dblcProv: TwwDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    dbeSalActMN: TwwDBEdit;
    Label21: TLabel;
    dbeAbonosMN: TwwDBEdit;
    Label22: TLabel;
    dbeCargosMN: TwwDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    dbeSalAntMN: TwwDBEdit;
    rgEST: TRadioGroup;
    Label4: TLabel;
    Z2bbtnOtros: TBitBtn;
    pnlClientes: TPanel;
    StaticText2: TStaticText;
    bbtnCierra1: TBitBtn;
    dbgClientes: TwwDBGrid;
    ppmLetra: TPopupMenu;
    CanLetra: TMenuItem;
    ppmDocu: TPopupMenu;
    CanDocu: TMenuItem;
    ppmChDev: TPopupMenu;
    CanChDev: TMenuItem;
    ppmNCre: TPopupMenu;
    CanNCre: TMenuItem;
    pnlBusca1: TPanel;
    isBusca1: TwwIncrementalSearch;
    Edit1: TEdit;
    Z2bbtnAceptar: TBitBtn;
    chbFecha: TCheckBox;
    bbtnImprimeAmortiza: TBitBtn;
    ppdbAmortiza: TppDBPipeline;
    pprAmortiza: TppReport;
    pnlDetFPagoLiq: TPanel;
    dbgDetPagoLiq: TwwDBGrid;
    dbgDetPagoLiqIButton: TwwIButton;
    StaticText1: TStaticText;
    bbtnCierraDetFPagoLiq: TBitBtn;
    SpeedButton1: TSpeedButton;
    pnlHist: TStaticText;
    bbtnCierraHist: TBitBtn;
    dbeComment: TwwDBEdit;
    Label5: TLabel;
    DocumentosOrigen1: TMenuItem;
    lblDocumento: TLabel;
    ppdbPipelineAdendo: TppDBPipeline;
    dtpFIN: TwwDBDateTimePicker;
    Label8: TLabel;
    seAno: TSpinEdit;
    seMes: TSpinEdit;
    bbtnEjecuta: TBitBtn;
    ppHeaderBand4: TppHeaderBand;
    ppLabel163: TppLabel;
    ppLabel164: TppLabel;
    ppLabel165: TppLabel;
    ppLabel166: TppLabel;
    ppLabel167: TppLabel;
    ppLabel168: TppLabel;
    ppLabel169: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel170: TppLabel;
    pplblCliente: TppLabel;
    ppLabel171: TppLabel;
    pplblTDoc: TppLabel;
    ppLabel172: TppLabel;
    pplblSerie: TppLabel;
    ppLabel173: TppLabel;
    pplblNoDoc: TppLabel;
    ppLabel174: TppLabel;
    pplblMoneda: TppLabel;
    ppLabel175: TppLabel;
    pplblImporte: TppLabel;
    ppLabel176: TppLabel;
    pplblSaldo: TppLabel;
    pplblCodigo: TppLabel;
    ppLabel177: TppLabel;
    ppLabel178: TppLabel;
    ppLabel179: TppLabel;
    ppLabel180: TppLabel;
    ppLabel181: TppLabel;
    ppLabel182: TppLabel;
    ppLabel183: TppLabel;
    ppLabel184: TppLabel;
    ppLabel185: TppLabel;
    ppDetailBand11: TppDetailBand;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppSummaryBand9: TppSummaryBand;
    ppDBCalc2: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppLabel186: TppLabel;
    ppCtaCteProv: TppReport;
    pgcNProv: TTabSheet;
    dbgNProv: TwwDBGrid;
    ppdbpNoProv: TppDBPipeline;
    ppHeaderBand5: TppHeaderBand;
    ppCia: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    ppLabel231: TppLabel;
    ppLabel232: TppLabel;
    ppLabel233: TppLabel;
    ppLabel234: TppLabel;
    ppLabel235: TppLabel;
    ppLabel236: TppLabel;
    ppLabel237: TppLabel;
    ppLabel238: TppLabel;
    ppCod: TppLabel;
    ppRuc: TppLabel;
    ppProv: TppLabel;
    ppDir: TppLabel;
    ppDetailBand13: TppDetailBand;
    CF: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBand9: TppTitleBand;
    ppLabel243: TppLabel;
    ppLabel244: TppLabel;
    ppLabel245: TppLabel;
    ppLabel246: TppLabel;
    ppLabel247: TppLabel;
    ppLabel248: TppLabel;
    ppLabel249: TppLabel;
    ppLabel250: TppLabel;
    ppLabel251: TppLabel;
    ppLabel252: TppLabel;
    ppLabel253: TppLabel;
    ppLabel254: TppLabel;
    ppLabel255: TppLabel;
    ppLabel256: TppLabel;
    ppLabel257: TppLabel;
    ppLabel258: TppLabel;
    ppLabel259: TppLabel;
    ppLabel260: TppLabel;
    ppLabel261: TppLabel;
    ppLabel285: TppLabel;
    ppLabel286: TppLabel;
    ppLabel287: TppLabel;
    ppLabel288: TppLabel;
    ppLabel289: TppLabel;
    ppLabel290: TppLabel;
    ppLabel262: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppDBText121: TppDBText;
    ppSubReport5: TppSubReport;
    ppChildReport8: TppChildReport;
    ppTitleBand10: TppTitleBand;
    ppDetailBand15: TppDetailBand;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppDBText125: TppDBText;
    ppDBText126: TppDBText;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppSummaryBand12: TppSummaryBand;
    ppDBText129: TppDBText;
    ppDBText130: TppDBText;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppDBText133: TppDBText;
    ppDBText134: TppDBText;
    ppDBText135: TppDBText;
    ppDBText136: TppDBText;
    ppDBText137: TppDBText;
    ppDBText138: TppDBText;
    ppDBText139: TppDBText;
    ppSummaryBand13: TppSummaryBand;
    ppLabel291: TppLabel;
    ppLabel292: TppLabel;
    ppdbcCLF: TppDBCalc;
    ppdbcPLF: TppDBCalc;
    ppdbcSLF: TppDBCalc;
    ppdbcCEF: TppDBCalc;
    ppdbcPEF: TppDBCalc;
    ppdbcSEF: TppDBCalc;
    CN: TppSubReport;
    ppChildReport9: TppChildReport;
    ppTitleBand11: TppTitleBand;
    ppLabel263: TppLabel;
    ppLabel264: TppLabel;
    ppLabel265: TppLabel;
    ppLabel266: TppLabel;
    ppLabel267: TppLabel;
    ppLabel268: TppLabel;
    ppLabel269: TppLabel;
    ppLabel270: TppLabel;
    ppLabel271: TppLabel;
    ppLabel272: TppLabel;
    ppLabel273: TppLabel;
    ppLabel274: TppLabel;
    ppLabel275: TppLabel;
    ppLabel276: TppLabel;
    ppLabel277: TppLabel;
    ppLabel278: TppLabel;
    ppLabel279: TppLabel;
    ppLabel280: TppLabel;
    ppLabel281: TppLabel;
    ppLabel282: TppLabel;
    ppLabel283: TppLabel;
    ppLabel284: TppLabel;
    ppLabel293: TppLabel;
    ppLabel294: TppLabel;
    ppLabel295: TppLabel;
    ppLabel239: TppLabel;
    ppDetailBand16: TppDetailBand;
    ppDBText140: TppDBText;
    ppDBText142: TppDBText;
    ppDBText143: TppDBText;
    ppDBText144: TppDBText;
    ppDBText145: TppDBText;
    ppDBText146: TppDBText;
    ppDBText147: TppDBText;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    ppDBText150: TppDBText;
    ppDBText151: TppDBText;
    ppDBText141: TppDBText;
    ppSummaryBand14: TppSummaryBand;
    ppLabel296: TppLabel;
    ppLabel297: TppLabel;
    ppdbcCLN: TppDBCalc;
    ppdbcPLN: TppDBCalc;
    ppdbcSLN: TppDBCalc;
    ppdbcCEN: TppDBCalc;
    ppdbcPEN: TppDBCalc;
    ppdbcSEN: TppDBCalc;
    CL: TppSubReport;
    ppChildReport10: TppChildReport;
    ppTitleBand12: TppTitleBand;
    ppLabel298: TppLabel;
    ppLabel299: TppLabel;
    ppLabel300: TppLabel;
    ppLabel301: TppLabel;
    ppLabel302: TppLabel;
    ppLabel303: TppLabel;
    ppLabel304: TppLabel;
    ppLabel305: TppLabel;
    ppLabel306: TppLabel;
    ppLabel307: TppLabel;
    ppLabel308: TppLabel;
    ppLabel309: TppLabel;
    ppLabel310: TppLabel;
    ppLabel311: TppLabel;
    ppLabel312: TppLabel;
    ppLabel313: TppLabel;
    ppLabel314: TppLabel;
    ppLabel315: TppLabel;
    ppLabel316: TppLabel;
    ppLabel317: TppLabel;
    ppLabel318: TppLabel;
    ppLabel319: TppLabel;
    ppDetailBand17: TppDetailBand;
    ppDBText152: TppDBText;
    ppDBText153: TppDBText;
    ppDBText154: TppDBText;
    ppDBText155: TppDBText;
    ppDBText156: TppDBText;
    ppDBText157: TppDBText;
    ppDBText158: TppDBText;
    ppDBText159: TppDBText;
    ppDBText160: TppDBText;
    ppSubReport4: TppSubReport;
    ppChildReport11: TppChildReport;
    ppTitleBand13: TppTitleBand;
    ppDetailBand18: TppDetailBand;
    ppDBText161: TppDBText;
    ppDBText162: TppDBText;
    ppDBText163: TppDBText;
    ppDBText164: TppDBText;
    ppDBText165: TppDBText;
    ppDBText166: TppDBText;
    ppDBText167: TppDBText;
    ppDBText168: TppDBText;
    ppSummaryBand15: TppSummaryBand;
    ppSummaryBand16: TppSummaryBand;
    ppLabel320: TppLabel;
    ppLabel321: TppLabel;
    ppdbcCLL: TppDBCalc;
    ppdbcSLL: TppDBCalc;
    ppdbcPEL: TppDBCalc;
    ppdbcSEL: TppDBCalc;
    NP: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
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
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppdbNPL: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppdbNPE: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppdbcNPL: TppDBCalc;
    ppdbcNPE: TppDBCalc;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand17: TppSummaryBand;
    ppLabel230: TppLabel;
    ppLabel324: TppLabel;
    ppLabel76: TppLabel;
    ppLabel87: TppLabel;
    ppLabel92: TppLabel;
    ppLabel94: TppLabel;
    ppLabel97: TppLabel;
    ppvCLF: TppVariable;
    ppvPLF: TppVariable;
    ppvSLF: TppVariable;
    ppvCLL: TppVariable;
    ppvPLL: TppVariable;
    ppvSLL: TppVariable;
    ppLabel103: TppLabel;
    ppvCLT: TppVariable;
    ppvPLT: TppVariable;
    ppvSLT: TppVariable;
    ppvCEF: TppVariable;
    ppvPEF: TppVariable;
    ppvSEF: TppVariable;
    ppvCEL: TppVariable;
    ppvPEL: TppVariable;
    ppvSEL: TppVariable;
    ppvCET: TppVariable;
    ppvPET: TppVariable;
    ppvSET: TppVariable;
    ppLabel60: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel123: TppLabel;
    ppvCLN: TppVariable;
    ppvPLN: TppVariable;
    ppvSLN: TppVariable;
    ppvCEN: TppVariable;
    ppvPEN: TppVariable;
    ppvSEN: TppVariable;
    ppLabel27: TppLabel;
    ppvCLNP: TppVariable;
    ppvPLNP: TppVariable;
    ppvSLNP: TppVariable;
    ppvCENP: TppVariable;
    ppvPENP: TppVariable;
    ppvSENP: TppVariable;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    pplblCiaInc: TppLabel;
    pplblTelefonoInc: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    ppLabel188: TppLabel;
    pplblFechaINC: TppLabel;
    ppLabel190: TppLabel;
    pplblClienteINC: TppLabel;
    pplblrucinc: TppLabel;
    pplbldirinc: TppLabel;
    pplblDistritoinc: TppLabel;
    pplblCodigoinc: TppLabel;
    ppLabel198: TppLabel;
    ppLabel199: TppLabel;
    ppLabel200: TppLabel;
    ppLabel201: TppLabel;
    ppLabel202: TppLabel;
    ppLabel203: TppLabel;
    ppLabel204: TppLabel;
    ppLabel205: TppLabel;
    ppLabel206: TppLabel;
    ppLabel207: TppLabel;
    ppLabel208: TppLabel;
    ppLabel209: TppLabel;
    ppLabel210: TppLabel;
    ppLabel211: TppLabel;
    ppLabel212: TppLabel;
    ppLabel213: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBCalc1: TppDBCalc;
    ppDBText5: TppDBText;
    ppDBText11: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppDBText120: TppDBText;
    ppSummaryBand10: TppSummaryBand;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLabel214: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppLabel229: TppLabel;
    ppMemo1: TppMemo;
    ppLabel30: TppLabel;
    procedure Z2bbtnAceptarClick(Sender: TObject);
    procedure dbgEst2CalCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure Z2bbtnCancelClick(Sender: TObject);
    procedure bbtnPrintClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgEst2TitleButtonClick(Sender: TObject; AFieldName: String);
    procedure dbgEst3TitleButtonClick(Sender: TObject; AFieldName: String);
    procedure dbgEst2CalcTitleAttributes(Sender: TObject; AFieldName: String; AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
    procedure dbgEst3CalcTitleAttributes(Sender: TObject; AFieldName: String; AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbeTCAMBKeyPress(Sender: TObject; var Key: Char);
    procedure dbgEst3CalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chbFechaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Z2bbtnRepAnosClick(Sender: TObject);
    procedure ppRepAnosPreviewFormCreate(Sender: TObject);
    procedure Z2bbtnOtrosClick(Sender: TObject);
    procedure bbtnCierra1Click(Sender: TObject);
    procedure CanLetraClick(Sender: TObject);
    procedure dbgHistDblClick(Sender: TObject);
    procedure CanDocuClick(Sender: TObject);
    procedure CanChDevClick(Sender: TObject);
    procedure CanNCreClick(Sender: TObject);
    procedure dbgTodosTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure isBusca1Exit(Sender: TObject);
    procedure dbgEst6TitleButtonClick(Sender: TObject; AFieldName: String);
    procedure dbeTelfMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure bbtnCierraDetFPagoLiqClick(Sender: TObject);
    procedure bbtnCierraHistClick(Sender: TObject);
    procedure DocumentosOrigen1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnEjecutaClick(Sender: TObject);
    procedure seMesExit(Sender: TObject);
    procedure pprAmortizaPreviewFormCreate(Sender: TObject);
    procedure pprCtaCtePreviewFormCreate(Sender: TObject);
    procedure ppCtaCteProvPreviewFormCreate(Sender: TObject);
    procedure ppSummaryBand17BeforePrint(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    sSQL,sSQLLetras,sSQLDocs,sSQLTodos, sSQL2,stcam  : String;
    FMoneda, FCIAID,FCliente,FClienteDes, FClAux, FNomCliente, FCIA : String;
    FActivar, FMonLoc, FInternal : Boolean;
    orig, camp, extr, loca, pag, sal, FSaldoIni, FSaldoIniE,
    FSaldoIniL, col1, col2, col3, col4, FSaldoReal,
    FSaldoRealE, FSaldoRealL : Double;
    FAnio, FMes : Integer;
    rLineaCrdito:real;
    xPopup : String;
    sDoc,sDocAbr,sSerie,sNodoc,sMon:string;
    fImp,FSal:double;
    procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure ProcessSaldo(cds : TwwClientDataSet);
    function MonLocal( const CodMoneda: String ): Boolean;
    function NomMoneda(const CodMoneda: String ): String;
    procedure cGRID(dbg : TwwDBGrid);
    procedure cLetras;
    procedure Totales;
    procedure CalculaTotales;
    procedure InsertaRayas;
    procedure CargaDetalle(xDocumentos : String);
    procedure CagaBusca(xDataSource : TwwDataSource);
    procedure InsertaGrupo;
    procedure cFooter(dbg: TwwDBGrid; cds: TwwClientDataSet);
    function  FiltraDoc( xTipoProv : String ) : String;
  public
    { Public declarations }
    rLineaCredito:real;
    sCia:string;
    cdsLinea: TwwClientDataSet;

		{Moneda,} ClAux, Cliente, ClienteDes{, CIAID} : String;
    //Internal, Activar, MonLoc : Boolean;
    //SaldoIni, SaldoIniL, SaldoIniE, SaldoReal, SaldoRealL, SaldoRealE : Double;
    //Mes, Anio : Integer;
    procedure AceptarCompleto;
    procedure AceptarParcial;
    procedure cSQLTodos;
    procedure cSQLDocs;
    procedure cSQLLetras;
    procedure cFormat(cds : TwwClientDataSet);
    procedure cFooterletras(dbg : TwwDBGrid; cds : TwwClientDataSet);
    procedure cFooterProvis(dbg : TwwDBGrid; cds : TwwClientDataSet);
    procedure cFooterCheque(dbg : TwwDBGrid; cds : TwwClientDataSet);
    procedure cFooterAnticipo(dbg : TwwDBGrid; cds : TwwClientDataSet);
    procedure cFooterNCredito(dbg : TwwDBGrid; cds : TwwClientDataSet);
    procedure cFooterTodos(dbg : TwwDBGrid; cds : TwwClientDataSet);
    procedure cFooterNProv(dbg : TwwDBGrid; cds : TwwClientDataSet);

    property Moneda    : String  read FMoneda     write FMoneda;
    //property ClAux     : String  read FClAux      write FClAux;
    //property Cliente   : String  read FCliente    write FCliente;
    //property ClienteDes: String  read FClienteDes write FClienteDes ;
    property CIAID     : String  read FCIAID    	write FCIAID ;
    property Internal  : Boolean read FInternal   write FInternal;
    property Activar   : Boolean read FActivar    write FActivar;
    property MonLoc    : Boolean read FMonLoc     write FMonLoc;
    property SaldoIni  : Double  read FSaldoIni   write FSaldoIni;
    property SaldoIniL : Double  read FSaldoIniL  write FSaldoIniL;
    property SaldoIniE : Double  read FSaldoIniE  write FSaldoIniE;
    property SaldoReal : Double  read FSaldoReal  write FSaldoReal;
    property SaldoRealL: Double  read FSaldoRealL write FSaldoRealL;
    property SaldoRealE: Double  read FSaldoRealE write FSaldoRealE;
    property Mes       : Integer read FMes        Write FMes;
    property Anio      : Integer read FAnio       Write FAnio;

  end;

var
  FEstCxCPro: TFEstCxCPro;

implementation

uses CxPDM, CxP700;

{$R *.DFM}
{
function DaysOfMonth ( iMonth, iYear : Word ) : Word;
const
  DaysxMes : Array [1..12] of Integer = (31,28,31,30,31,30,31,31,30,31,30,31);
begin
  if IsLeapYear(iYear) then DaysxMes[2]:= 29;
  result := DaysxMes[iMonth];
end;
}
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

procedure TFEstCxCPro.cSQLTodos;
begin
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     sSQLTodos:=
         'SELECT '''' CPFLAGPROT, '''' CPNLETBCO, CXP.CPFVCMTO FECHA, 1 POS, '
        +  'DAYS(CXP.CPFVCMTO)-DAYS(CXP.CPFVCMTO) EDAD, CXP.CPNOREG, CXP.CPSERIE, CXP.CPNODOC, '
        +  'CXP.CPFEMIS, CXP.CPFVCMTO, CXP.PROV, CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, CXP.CPMTOEXT, '
        +  'CXP.CPPAGEXT, CXP.CPSALEXT, CXP.CIAID, CXP.DOCID, '
        +  'MON.TMON_LOC, MON.TMONABR, DOC.DOCABR, DOC.DOCRESTA, '''' UBICADES, '
        +  ''''' SITUADES, CXP.CPMTOORI, CXP.TMONID, CXP.CPESTADO, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN (CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*CXP.CPMTOLOC) ELSE CXP.CPMTOLOC END) ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN (CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*CXP.CPMTOEXT) ELSE CPMTOEXT END) ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN (CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*('+DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGLOC,0))) ELSE '+DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGLOC,0) END) ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN (CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*('+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGEXT,0))) ELSE '+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGEXT,0) END) ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN (CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*CXP.CPPAGLOC) ELSE CPPAGLOC END) ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN (CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*CXP.CPPAGEXT) ELSE CPPAGEXT END) ELSE 0 END) AS PAGEXT, '
        +  '(CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*CXP.CPMTOEXT) ELSE CPMTOEXT END) AS MTODOLAR, '
        +  '(CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*CXP.CPPAGEXT) ELSE CPPAGEXT END) AS PAGDOLAR, '
        +  '(CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*('+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGEXT,0))) ELSE '+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGEXT,0) END) AS SALDOLAR '
        +'FROM CXP301 CXP '
        +  'INNER JOIN TGE103 MON ON (CXP.TMONID=MON.TMONID) '
        +  'INNER JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD = ''CXP'') ';
  end;
  if (SRV_D = 'ORACLE') then
  begin
     sSQLTodos:=
         'SELECT '''' CPFLAGPROT, '''' CPNLETBCO, CXP.CPFVCMTO FECHA, 1 POS, '
        +  'TO_NUMBER(TO_CHAR(CXP.CPFVCMTO,''DD'')) - TO_NUMBER(TO_CHAR(CXP.CPFVCMTO,''DD'')) EDAD, '
        +  'CXP.CPNOREG, CXP.CPSERIE, CXP.CPNODOC, '
        +  'CXP.CPFEMIS, CXP.CPFVCMTO, CXP.PROV, CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, CXP.CPMTOEXT, '
        +  'CXP.CPPAGEXT, CXP.CPSALEXT, CXP.CIAID, CXP.DOCID, '
        +  'MON.TMON_LOC, MON.TMONABR, DOC.DOCABR, DOC.DOCRESTA, '''' UBICADES, '
        +  ''''' SITUADES, CXP.CPMTOORI, CXP.TMONID, CXP.CPESTADO, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN (CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*CXP.CPMTOLOC) ELSE CXP.CPMTOLOC END) ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN (CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*CXP.CPMTOEXT) ELSE CPMTOEXT END) ELSE 0 END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN (CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*('+DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGLOC,0))) ELSE '+DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGLOC,0) END) ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN (CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*('+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGEXT,0))) ELSE '+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGEXT,0) END) ELSE 0 END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN (CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*CXP.CPPAGLOC) ELSE CPPAGLOC END) ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN (CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*CXP.CPPAGEXT) ELSE CPPAGEXT END) ELSE 0 END) AS PAGEXT, '
        +  '(CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*CXP.CPMTOEXT) ELSE CPMTOEXT END) AS MTODOLAR, '
        +  '(CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*CXP.CPPAGEXT) ELSE CPPAGEXT END) AS PAGDOLAR, '
        +  '(CASE WHEN (DOC.DOCRESTA=''S'') THEN ((-1)*('+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGEXT,0))) ELSE '+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGEXT,0) END) AS SALDOLAR '
        +'FROM CXP301 CXP, TGE103 MON, TGE110 DOC '
        +'WHERE CXP.TMONID=MON.TMONID '
        +  'AND CXP.DOCID=DOC.DOCID AND DOC.DOCMOD=''CXP'' ';
  end;
end;


procedure TFEstCxCPro.Z2bbtnAceptarClick(Sender: TObject);
begin
  AceptarParcial;
end;

procedure TFEstCxCPro.dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFEstCxCPro.cFormat(cds : TwwClientDataSet);
begin
  with cds do
  begin
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

procedure TFEstCxCPro.cFooter(dbg : TwwDBGrid; cds : TwwClientDataSet);
var
  Mloc, MExt, Ploc, PExt, Sloc, SExt : Double;
begin
  Mloc := OperClientDataSet( cds , 'SUM(MTOLOC)', '');
  MExt := OperClientDataSet( cds , 'SUM(MTOEXT)', '');
  dbg.ColumnByName('MTOLOC').FooterValue  :=floattostrf(MLoc, ffNumber, 15, 2);
  dbg.ColumnByName('MTOEXT').FooterValue  :=floattostrf(MExt, ffNumber, 15, 2);

  Mloc := OperClientDataSet( cds , 'SUM(SALLOC)', '');
  MExt := OperClientDataSet( cds , 'SUM(SALEXT)', '');
  dbg.ColumnByName('SALLOC').FooterValue  :=floattostrf(MLoc, ffNumber, 15, 2);
  dbg.ColumnByName('SALEXT').FooterValue  :=floattostrf(MExt, ffNumber, 15, 2);

  dbg.FooterCellColor := clInfoBk;
  dbg.RedrawGrid;
end;

procedure TFEstCxCPro.ProcessSaldo;
var
  nSaldoAcu, nSaldoAnt, nSaldo,
  eSaldoLOC, eSaldoEXT,
  eSaldoAcu, eSaldoAnt, eSaldo : Double;
begin
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
            nSaldo := FieldByName('SALLOC').AsFloat*(-1);
            eSaldo := FieldByName('SALEXT').AsFloat*(-1);
         end
         else
         begin
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

procedure TFEstCxCPro.dbgEst2CalCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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
     if MonLocal(DMCXP.cdsQry2.FieldByName('TMONABR').AsString) then
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

  if (Field.FieldName = 'CPFVCMTO') then
  begin
     if DMCXP.cdsQry2.FieldByName('CPFVCMTO').AsDateTime>Date then
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
     if DMCXP.cdsQry2.FieldByName('CPFVCMTO').AsDateTime<Date then
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

function TFEstCxCPro.MonLocal(const CodMoneda: String): Boolean;
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

procedure TFEstCxCPro.Z2bbtnCancelClick(Sender: TObject);
begin
   Close;
end;

function TFEstCxCPro.NomMoneda(const CodMoneda: String): String;
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

procedure TFEstCxCPro.cGRID(dbg : TwwDBGrid);
begin
   dbg.Selected.Clear;
   dbg.Selected.Add('POS'#9'3'#9'Pos'#9'F');
   if dbg.Name<>'dbgEst3' then
   begin
      dbg.Selected.Add('DOCABR'#9'5'#9'Doc.'#9'F');
      dbg.Selected.Add('CPSERIE'#9'4'#9'Serie'#9'F');
   end;

   dbg.Selected.Add('CPNODOC'#9'10'#9'Número'#9'F');
   if dbg.Name='dbgEst3' then
      dbg.Selected.Add('CPCANJE'#9'8'#9'Nº~Canje'#9'F');

   dbg.Selected.Add('CPNOREG'#9'10'#9'Nº~Reg.'#9'F');

   if dbg.Name='dbgEst2' then
   begin
      //dbg.Selected.Add('DOCABR'#9'8'#9'Tipo~Doc.'#9'F');
      //dbg.Selected.Add('CPNODOC'#9'7'#9'Nº de~Doc.'#9'F');
   end
   else  begin
      if dbg.Name<>'dbgEst3' then
      begin
         dbg.Selected.Add('SITUADES'#9'10'#9'Situación'#9'F');
         dbg.Selected.Add('CPFLAGPROT'#9'3'#9'Pro'#9'F');
         dbg.Selected.Add('UBICADES'#9'10'#9'Ubicación'#9'F');
      end;
      dbg.Selected.Add('CPNLETBCO'#9'10'#9'Nº Bancario~Letra'#9'F');
   end;
   dbg.Selected.Add('CPFEMIS'#9'10'#9'Fecha~Emisión'#9'F');
   dbg.Selected.Add('CPFVCMTO'#9'10'#9'Fecha de~Vencimiento'#9'F' );
   dbg.Selected.Add('TMONABR'#9'4'#9'T.M.'#9'F' );
   dbg.Selected.Add('CPTCAMPR'#9'4'#9'T.C.'#9'F' );
   dbg.Selected.Add('MTOLOC'#9'12'#9'Cargo~MN'#9'F');
   dbg.Selected.Add('PAGLOC'#9'12'#9'Abono~MN'#9'F');
   dbg.Selected.Add('SALLOC'#9'12'#9'Saldo~MN'#9'F');
   dbg.Selected.Add('MTOEXT'#9'12'#9'Cargo~ME'#9'F') ;
   dbg.Selected.Add('PAGEXT'#9'12'#9'Abono~ME'#9'F') ;
   dbg.Selected.Add('SALEXT'#9'12'#9'Saldo~ME'#9'F') ;
end;

procedure TFEstCxCPro.Totales;
var
  xTotS, xTotD, xTotSTC, xTotDTC : Single;
  nAboL, nAboE : Double;
  sAboL, sAboE : String;
begin
  xTotS:=OperClientDataSet( DMCXP.cdsQry2, 'SUM(SALLOC)', '') +
  	 OperClientDataSet( DMCXP.cdsQry4, 'SUM(SALLOC)', '') +
         OperClientDataSet( DMCXP.cdsQry6, 'SUM(CPSALLOC)', 'CPPAGLOC<=0');
  xTotD:=OperClientDataSet( DMCXP.cdsQry2, 'SUM(SALEXT)', '') +
  	 OperClientDataSet( DMCXP.cdsQry4, 'SUM(SALEXT)', '') +
         OperClientDataSet( DMCXP.cdsQry6, 'SUM(CPSALEXT)', 'CPPAGEXT<=0');

  sAboE:=dbgEst6.ColumnByName('CPSALEXT').FooterValue;
  sAboL:=dbgEst6.ColumnByName('CPSALLOC').FooterValue;
  sAboE:=StringReplace(sAboE,',','',[rfReplaceAll]);
  sAboL:=StringReplace(sAboL,',','',[rfReplaceAll]);

  if Length(Trim(dbgEst6.ColumnByName('CPSALLOC').FooterValue)) = 0 then
    nAboL := 0
  else
    nAboL:=StrtoFloat(sAboL);

  if Length(trim(dbgEst6.ColumnByName('CPSALEXT').FooterValue)) = 0 then
    nAboE := 0
  else
    nAboE:=StrtoFloat(sAboE);
end;


procedure TFEstCxCPro.cLetras;
begin
   sSQL2 := sSQL;

   DMCXP.cdsQry4.ProviderName := 'dspTGE';
   DMCXP.cdsQry4.Close;
   DMCXP.cdsQry4.DataRequest(sSQL2);
   DMCXP.cdsQry4.Open;
end;

procedure TFEstCxCPro.bbtnPrintClick(Sender: TObject);
var
   xSQL : string;
   sSQL1, sSQL, xIndex : String;
begin
//  pprCtaCte.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\CtaCteINC.rtm';
  pprCtaCte.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\CtaCteProv.rtm';
  pprCtaCte.template.LoadFromFile ;

  pplblCiaINC.caption      := DMCXP.displaydescrip2('dspTGE','TGE101','CIADES, CIATLF, CIAFAX','CIAID='+QuotedStr(CIAID),'CIADES');
  pplblTelefonoInc.Caption := 'Teléfono: '+DMCXP.cdsQry.FieldByName('CIATLF').AsString+' Fax : '+DMCXP.cdsQry.FieldByName('CIAFAX').AsString;
  pplblFechaINC.caption    := DateToStr(dtpFIN.date);
  pplblClienteInc.caption  := dbeCLIE.text;
  pplblRucInc.caption      := 'RUC: '+DMCXP.cdsCxP.FieldByName('PROVRUC').AsString+' Telf: '+DMCXP.cdsCxP.FieldByName('PROVTELF').AsString;
  pplblDirInc.caption      := DMCXP.cdsCxP.FieldByName('PROVDIR').AsString;
  pplblDistritoINC.caption := DMCXP.cdsCxP.FieldByName('ZIPDES').AsString;
  pplblCodigoInc.caption   := 'Código Provedor : '+DMCXP.cdsCxP.FieldByName('PROV').AsString;
  //pplblZonaInc.caption     := 'Zona de Venta  : '+DMCXP.cdsCxP.FieldByName('ZIPDES').AsString;
  //pplblVendedorINC.caption := 'Vendedor       : '+DMCXP.cdsCxP.FieldByName('VENOMBRES').AsString;

  xIndex:=DMCXP.cdsReporte.IndexFieldNames;

  DMCXP.cdsReporte.IndexFieldNames:='CPFEMIS;DOCID;CPSERIE;CPNODOC';

  ppdbCtaCte.DataSource:=DMCXP.dsReporte;
  pprCtaCte.DataPipeline:=ppdbCtaCte;

  //ppDesigner1.Show;
  pprCtaCte.print;
  pprCtaCte.Stop;

  DMCXP.cdsReporte.IndexFieldNames:=xIndex;
end;

procedure TFEstCxCPro.BitBtn1Click(Sender: TObject);
var
	xxSQL, xxCia, xNomrtm : String;
  x10:integer;
begin
  AceptarCompleto;

  x10:=Self.ComponentCount-1;
  while x10>=0 do
  begin
     if Self.Components[ x10 ].ClassName='TppGroup' then
     	Self.Components[ x10 ].Free ;
     x10:=x10-1;
  end;

  xNomrtm:= ExtractFilePath( application.ExeName ) + wRutaRpt +'\CCProv.rtm';
  ppCtaCteProv.Template.FileName := xNomrtm;
  ppCtaCteProv.Template.LoadFromFile ;

  ppCia.Text := FToolCtaCteProv.dbeCIA.Text;
  ppCod.Text := DMCXP.cdsCXP.FieldByName('PROV').AsString;
  ppRuc.Text := DMCXP.cdsCXP.FieldByName('PROVRUC').AsString;
  ppProv.Text:= DMCXP.cdsCXP.FieldByName('PROVDES').AsString;
  ppDir.Text := DMCXP.cdsCXP.FieldByName('PROVDIR').AsString;

  //ppDesigner1.Show;
  ppCtaCteProv.Print;
  ppCtaCteProv.stop;

  x10:=Self.ComponentCount-1;
  while x10>=0 do
  begin
    if Self.Components[ x10 ].ClassName='TppGroup' then
  	  	 Self.Components[ x10 ].Free ;
  	 x10:=x10-1;
	end;
end;

procedure TFEstCxCPro.dbgEst2CalcTitleAttributes(Sender: TObject; AFieldName: String; AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
	if (AFieldName='CPNODOC') or (AFieldName='CPFEMIS') or (AFieldName='CPFVCMTO') then
  	Afont.Color:=clRed;
end;

procedure TFEstCxCPro.dbgEst3CalcTitleAttributes(Sender: TObject; AFieldName: String; AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
	if (AFieldName='CNLETBCO') OR (AFieldName='CPNODOC') or (AFieldName='CPFEMIS') or (AFieldName='CPFVCMTO') then
  	Afont.Color:=clRed;
end;

procedure TFEstCxCPro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
   begin
    key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
   end;

end;

procedure TFEstCxCPro.dbeTCAMBKeyPress(Sender: TObject; var Key: Char);
var
  xStr : String ;
begin
  if not( Key in [ '0'..'9' , '.' , #8 ]) then
  begin
     Key := #0 ;
  end ;
  xStr := TCustomEdit(self.ActiveControl).text ;
  if key = '.' then
     if pos('.',xSTR) <> 0 then
        Key := #0 ;
end;

procedure TFEstCxCPro.cFooterCheque(dbg: TwwDBGrid; cds: TwwClientDataSet);
var
  Mloc, MExt,TLoc,TExt : Double;
begin
  Mloc := OperClientDataSet( cds , 'SUM(CPMTOLOC)', '');
  MExt := OperClientDataSet( cds , 'SUM(CPMTOEXT)', '');
  Tloc := OperClientDataSet( cds , 'SUM(CPSALLOC)', '');
  TExt := OperClientDataSet( cds , 'SUM(CPSALEXT)', '');
  dbg.ColumnByName('CPMTOLOC').FooterValue  :=floattostrf(MLoc, ffNumber, 15, 2);
  dbg.ColumnByName('CPMTOEXT').FooterValue  :=floattostrf(MExt, ffNumber, 15, 2);
  dbg.ColumnByName('CPSALLOC').FooterValue  :=floattostrf(TLoc, ffNumber, 15, 2);
  dbg.ColumnByName('CPSALEXT').FooterValue  :=floattostrf(TExt, ffNumber, 15, 2);
  dbg.FooterCellColor := clInfoBk;
  dbg.RedrawGrid;
end;

procedure TFEstCxCPro.cFooterAnticipo(dbg: TwwDBGrid;
  cds: TwwClientDataSet);
var
  Mloc, MExt,TLoc,TExt : Double;
begin
  Mloc := OperClientDataSet( cds , 'SUM(CPMTOLOC)', '');
  MExt := OperClientDataSet( cds , 'SUM(CPMTOEXT)', '');
  Tloc := OperClientDataSet( cds , 'SUM(CPSALLOC)', '');
  TExt := OperClientDataSet( cds , 'SUM(CPSALEXT)', '');
  dbg.ColumnByName('CPMTOLOC').FooterValue  :=floattostrf(MLoc, ffNumber, 15, 2);
  dbg.ColumnByName('CPMTOEXT').FooterValue  :=floattostrf(MExt, ffNumber, 15, 2);
  dbg.ColumnByName('CPSALLOC').FooterValue  :=floattostrf(TLoc, ffNumber, 15, 2);
  dbg.ColumnByName('CPSALEXT').FooterValue  :=floattostrf(TExt, ffNumber, 15, 2);
  dbg.FooterCellColor := clInfoBk;
  dbg.RedrawGrid;
end;

procedure TFEstCxCPro.dbgEst3CalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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
     if MonLocal(DMCXP.cdsQry2.FieldByName('TMONABR').AsString) then
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

  if (Field.FieldName = 'CPFVCMTO') then
  begin
     if DMCXP.cdsQry4.FieldByName('CPFVCMTO').AsDateTime>Date then
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
     if DMCXP.cdsQry4.FieldByName('CPFVCMTO').AsDateTime<Date then
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


procedure TFEstCxCPro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMCXP.cdsQry8.MasterSource:=NIL;
  DMCXP.cdsQry8.IndexFieldNames:='';
  DMCXP.cdsQry8.MasterFields:='';

  DMCXP.cdsQry9.MasterSource:=NIL;
  DMCXP.cdsQry9.IndexFieldNames:='';
  DMCXP.cdsQry9.MasterFields:='';

  DMCXP.cdsQry10.MasterSource:=NIL;
  DMCXP.cdsQry10.IndexFieldNames:='';
  DMCXP.cdsQry10.MasterFields:='';

  DMCXP.cdsQry12.MasterSource:=NIL;
  DMCXP.cdsQry12.IndexFieldNames:='';
  DMCXP.cdsQry12.MasterFields:='';

  DMCXP.cdsReporte.IndexFieldNames:='';
  DMCXP.cdsQry2.IndexFieldNames:='';
  DMCXP.cdsQry4.IndexFieldNames:='';
  DMCXP.cdsQry5.IndexFieldNames:= '';
  DMCXP.cdsQry6.IndexFieldNames:='';
  DMCXP.cdsQry7.IndexFieldNames:='';
  DMCXP.cdsQry14.IndexFieldNames:= '';

end;

procedure TFEstCxCPro.chbFechaClick(Sender: TObject);
var
	i : word;
  FDate : TDateTime;
begin
  i:= 1;
  FDate := EnCodeDate(Anio,Mes,i);
  dtpINI.Date := FDate;

  if chbFecha.checked then
  begin
    dtpFIN.Date := Date;
  end
  else
  begin
    dtpFIN.Date := FDate + (DaysOfMonth (Mes,Anio)-1);
  end;
end;

procedure TFEstCxCPro.SpeedButton1Click(Sender: TObject);
begin
  pnlLetras.Visible:=False;
  bbtnImprimeAmortiza.visible:=False;
end;

procedure TFEstCxCPro.Z2bbtnRepAnosClick(Sender: TObject);
var
	sSQL, sSql1 : string;
  Y, M, Y1, M1, D : word;
begin
	if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
  	sSQL:=' SELECT MESIDR,MESDESL,ANO,CLIECREMAX, SUM(MTOLOC) MTOLOC, SUM(MTOEXT) MTOEXT, '+
          ' SUM(PAGLOC) PAGLOC, SUM(PAGEXT) PAGEXT, SUM(SALLOC) SALLOC, '+
          ' SUM(SALEXT) SALEXT, SUM(NRORENOV) NRORENOV, SUM(RENLOC) RENLOC, '+
          ' SUM(RENEXT) RENEXT, SUM(NROREFINA) NROREFINA, SUM(REFLOC) REFLOC, '+
          ' SUM(REFEXT) REFEXT, SUM(NRODIF) NRODIF, SUM(DIFLOC) DIFLOC, '+
          ' SUM(DIFEXT) DIFEXT, SUM(NRODEV) NRODEV, SUM(DEVLOC) DEVLOC, SUM(DEVEXT) DEVEXT, SUM(NROPROT) NROPROT, SUM(PROTLOC) PROTLOC, SUM(PROTEXT) PROTEXT '+
          '  FROM ( '+
          // COLUMNA DE CARGOS CXP301 DOCUMENTOS 5,6
          ' SELECT MESIDR,MESDESL,YEAR(CPFEMIS) ANO, 0 CLIECREMAX, SUM(CPMTOLOC) MTOLOC, SUM(CPMTOEXT) MTOEXT, 0 PAGLOC, 0 PAGEXT, 0 SALLOC, 0 SALEXT, '+
          ' 0 NRORENOV,0 RENLOC,0 RENEXT,0 NROREFINA, 0 REFLOC, 0 REFEXT,0 NRODIF, 0 DIFLOC, 0 DIFEXT,0 NRODEV, 0 DEVLOC, 0 DEVEXT, '+
          ' 0 NROPROT, 0 PROTLOC, 0 PROTEXT '+
          ' FROM CXP301,TGE181 '+                                                                                                                                                 // NO VA CHEQUE
          ' WHERE MESIDR=SUBSTR(CPANOMES,5,2) AND CXP301.CLIEID='+QuotedStr(dblcProv.text)+' AND DOCID IN ('+QuotedStr(DMCXP.wsFac)+','+QuotedStr(DMCXP.wsBol)+','+QuotedStr(DMCXP.wsNDe)+') AND CPESTADO<>''A'' '+
          ' GROUP BY MESIDR,MESDESL,YEAR(CPFEMIS) '+
          ' '+
          ' UNION '+
          ' '+
          // COLUMNA DE ABONOS CXP305 7,8
          ' SELECT MESIDR,MESDESL, YEAR(CPFCANJE) ANO, 0 CLIECREMAX, 0 MTOLOC, 0 MTOEXT, SUM(DCPMTOLOC) PAGLOC, SUM(DCPMTOEXT) PAGEXT, 0 SALLOC, 0 SALEXT, '+
          ' 0 NRORENOV,0 RENLOC,0 RENEXT,0 NROREFINA, 0 REFLOC, 0 REFEXT,0 NRODIF, 0 DIFLOC, 0 DIFEXT,0 NRODEV, 0 DEVLOC, 0 DEVEXT,    '+
          ' 0 NROPROT, 0 PROTLOC, 0 PROTEXT '+                                                                                               // NO VA CHEQUE
          ' FROM CXP305,TGE181 '+
					//' WHERE CLIEID='+QuotedStr(dblcProv.text)+' AND DOCID IN ('+QuotedStr(DMCXP.wsFac)+','+QuotedStr(DMCXP.wsBol)+','+QuotedStr(DMCXP.wsNDe)+') AND MESID=CHAR(MONTH(CPFCANJE)) '+
          ' WHERE CLIEID='+QuotedStr(dblcProv.text)+' AND DOCID2 NOT IN ('+QuotedStr(DMCXP.wsLet)+') AND MESID=CHAR(MONTH(CPFCANJE)) '+
          ' GROUP BY MESIDR,MESDESL,YEAR(CPFCANJE) '+
          ' '+
          // COLUMNA DE RENOVACIONES CXP301 11,12,13
          ' UNION '+
          ' SELECT MESIDR,MESDESL,YEAR(CPFEMIS) ANO, 0 CLIECREMAX, 0 MTOLOC, 0 MTOEXT, 0 PAGLOC, 0 PAGEXT, 0 SALLOC, 0 SALEXT,SUM(CPNRENOV) NRORENOV,SUM(CPMTOLOC) RENLOC, SUM(CPMTOEXT) RENEXT,0 NROREFINA, 0 REFLOC, 0 REFEXT,0 NRODIF, 0 DIFLOC, 0 DIFEXT, '+
          ' 0 NRODEV, 0 DEVLOC, 0 DEVEXT, '+
          ' 0 NROPROT, 0 PROTLOC, 0 PROTEXT '+
          ' FROM CXP301,TGE181 '+
          ' WHERE MESIDR=SUBSTR(CPANOMES,5,2) AND CXP301.CLIEID='+QuotedStr(dblcProv.text)+' AND DOCID ='+QuotedStr(DMCXP.wsLet)+' AND CPNRENOV=1 '+
          ' GROUP BY MESIDR,MESDESL,YEAR(CPFEMIS),CPNRENOV '+
          ' ';
          // COLUMNA DE REFINANCIACIONES CXP301 14,15,16

  	sSQL1:=' UNION '+
          ' SELECT MESIDR,MESDESL,YEAR(CPFEMIS) ANO, 0 CLIECREMAX, 0 MTOLOC, 0 MTOEXT, 0 PAGLOC, 0 PAGEXT, 0 SALLOC, 0 SALEXT,0 NRORENOV, 0 RENLOC, '+
          ' 0 RENEXT,COUNT(CPMTOEXT) NROREFINA, SUM(CPMTOLOC) REFLOC, SUM(CPMTOEXT) REFEXT,0 NRODIF, 0 DIFLOC, 0 DIFEXT, '+
          ' 0 NRODEV, 0 DEVLOC, 0 DEVEXT, '+
          ' 0 NROPROT, 0 PROTLOC, 0 PROTEXT '+
          ' FROM CXP301,TGE181 '+
          ' WHERE MESIDR=SUBSTR(CPANOMES,5,2) AND CXP301.CLIEID='+QuotedStr(dblcProv.text)+' AND DOCID ='+QuotedStr(DMCXP.wsLet)+' AND '+DMCXP.wReplacCeros+'(CPFLAGVTA,''NULO'')=''NULO'' '+' AND CPNRENOV IS NULL '+
          ' GROUP BY MESIDR,MESDESL,YEAR(CPFEMIS) '+
          ' '+
          // COLUMNA DE CHEQUES DIFERIDOS CXP301 14,15,16 !!!!!!!!!!! ESTA MAL
          ' UNION '+
          ' '+
					{          ' SELECT MESIDR,MESDESL,YEAR(CPFEMIS) ANO, 0 CLIECREMAX, 0 MTOLOC, 0 MTOEXT, 0 PAGLOC, 0 PAGEXT, 0 SALLOC, 0 SALEXT,0 NRORENOV, 0 RENLOC, '+
         ' 0 RENEXT,0 NROREFINA, 0 REFLOC, 0 REFEXT, COUNT(CPMTOLOC) NRODIF, SUM(CPMTOLOC) DIFLOC, SUM(CPMTOEXT) DIFEXT, '+
         ' 0 NRODEV, 0 DEVLOC, 0 DEVEXT, '+
         ' 0 NROPROT, 0 PROTLOC, 0 PROTEXT '+
         ' FROM CXP301,TGE181 '+
         ' WHERE MESIDR=SUBSTR(CPANOMES,5,2) AND CXP301.CLIEID='+QuotedStr(dblcProv.text)+' AND DOCID ='+QuotedStr(DMCXP.wsChe)+' AND TCANJEID=''DI'' '+
         ' GROUP BY MESIDR,MESDESL,YEAR(CPFEMIS) '+}
         ' SELECT MESIDR,MESDESL,YEAR(FC_FEMIS) ANO,0 CLIECREMAX, 0 MTOLOC, 0 MTOEXT, 0 PAGLOC, 0 PAGEXT, 0 SALLOC, 0 SALEXT,0 NRORENOV, 0 RENLOC, '+
         '   0 RENEXT,0 NROREFINA, 0 REFLOC, 0 REFEXT, COUNT(FC_MTOLOC) NRODIF, SUM(FC_MTOLOC) DIFLOC, SUM(FC_MTOEXT) DIFEXT, '+
         '   0 NRODEV, 0 DEVLOC, 0 DEVEXT, '+
         '   0 NROPROT, 0 PROTLOC, 0 PROTEXT '+
         ' FROM '+
         '   CAJA314,TGE181 '+
         ' WHERE '+
         '   FPAGOID='+QuotedStr(DMCXP.wsFChe)+'  AND CLIEID='+QuotedStr(dblcProv.text)+' AND MESIDR= CASE WHEN LENGTH(RTRIM(LTRIM(CHAR(MONTH(FC_FEMIS)))))=1 THEN ''0''||CHAR(MONTH(FC_FEMIS)) ELSE CHAR(MONTH(FC_FEMIS)) END '+
        ' GROUP BY '+
         '   MESIDR,MESDESL,YEAR(FC_FEMIS) '+
         ' '+
          // COLUMNA DE LETRAS EN PROTESTO 20,21,22
         ' UNION '+
         ' '+
	{         '  SELECT MESIDR,MESDESL,YEAR(CPFEMIS) ANO, 0 CLIECREMAX, 0 MTOLOC, 0 MTOEXT, 0 PAGLOC, 0 PAGEXT, 0 SALLOC, 0 SALEXT,  0 NRORENOV,0 RENLOC, '+
         ' 0 RENEXT,0 NROREFINA, 0 REFLOC, 0 REFEXT,0 NRODIF, 0 DIFLOC, 0 DIFEXT,0 NRODEV, 0 DEVLOC, 0 DEVEXT, '+
         ' COUNT(CPMTOLOC) NROPROT, SUM(CPMTOLOC) PROTLOC, SUM(CPMTOEXT) PROTEXT '+
         ' FROM CXP301,TGE181  WHERE MESIDR=SUBSTR(CPANOMES,5,2) AND CXP301.CLIEID='+QuotedStr(dblcProv.text)+' AND DOCID ='+QuotedStr(DMCXP.wsLet)+ ' AND CCFLAGPROT=''S'' '+
         ' GROUP BY MESIDR,MESDESL,YEAR(CPFEMIS) '+
         ' '+}
          ' SELECT MESIDR,MESDESL,CASE WHEN YEAR(D.PLBCFECHA) IS NULL THEN YEAR(CXP301.CPFEMIS) ELSE  YEAR(D.PLBCFECHA) END ANO, 0 CLIECREMAX, 0 MTOLOC, 0 MTOEXT, 0 PAGLOC, 0 PAGEXT, 0 SALLOC, 0 SALEXT,  0 NRORENOV,0 RENLOC, '+
          ' 0 RENEXT,0 NROREFINA, 0 REFLOC, 0 REFEXT,0 NRODIF, 0 DIFLOC, 0 DIFEXT,0 NRODEV, 0 DEVLOC, 0 DEVEXT, COUNT(CPMTOLOC) NROPROT, '+
          ' SUM(CASE WHEN YEAR(D.PLBCFECHA) IS NULL THEN  CPMTOLOC  ELSE LETIMPORTE END) PROTLOC, '+
          ' SUM(CASE WHEN YEAR(D.PLBCFECHA) IS NULL THEN  CPMTOEXT  ELSE LETIMPORTE END) PROTEXT '+
          ' FROM CXP301 '+
          ' LEFT JOIN CXP309 D ON D.CIAID=CXP301.CIAID AND D.DOCID=CXP301.DOCID AND LETRA=CXP301.CPNODOC AND D.CLIEID=CXP301.PROV '+
          ' LEFT JOIN CXP104 ON  D.SITID=CXP104.SITUAID AND CXP104.FLAGPROTESTO=''S'' ,TGE181 '+
          ' WHERE MESIDI=MONTH(CASE WHEN D.PLBCFECHA IS NULL THEN CXP301.CPFEMIS ELSE D.PLBCFECHA END) AND '+
          '  CXP301.CLIEID='+QuotedStr(dblcProv.text)+' AND CXP301.DOCID ='+QuotedStr(DMCXP.wsLet)+' AND CPFLAGPROT=''S'' '+
          ' GROUP BY MESIDR,MESDESL,YEAR(D.PLBCFECHA),YEAR(CXP301.CPFEMIS) '+
          ' '+
         ' UNION '+
         ' '+
          // COLUMNA DE CHEQUES DEVUELTOS CXP301 17,18,19
         {' SELECT MESIDR,MESDESL,YEAR(CPFEMIS) ANO, 0 CLIECREMAX, 0 MTOLOC, 0 MTOEXT, 0 PAGLOC, 0 PAGEXT, 0 SALLOC, 0 SALEXT,0 NRORENOV, 0 RENLOC, '+
         ' 0 RENEXT,0 NROREFINA, 0 REFLOC, 0 REFEXT, 0 NRODIF, 0 DIFLOC, 0 DIFEXT, '+
         ' COUNT(CPMTOLOC) NRODEV, SUM(CPMTOLOC) DEVLOC, SUM(CPMTOEXT) DEVEXT, 0 NROPROT, 0 PROTLOC, 0 PROTEXT '+
         ' FROM CXP301,TGE181 '+
         ' WHERE MESIDR=SUBSTR(CPANOMES,5,2) AND CXP301.CLIEID='+QuotedStr(dblcProv.text)+' AND DOCID ='+QuotedStr(DMCXP.wsChe)+' AND TCANJEID=''DE'' '+
         ' GROUP BY MESIDR,MESDESL,YEAR(CPFEMIS) '+}
         ' SELECT MESIDR,MESDESL,CASE WHEN YEAR(C.CHQ_FECDEV) IS NULL THEN YEAR(CXP301.CPFEMIS) ELSE YEAR(C.CHQ_FECDEV) END ANO, 0 CLIECREMAX, 0 MTOLOC, 0 MTOEXT, 0 PAGLOC, 0 PAGEXT, 0 SALLOC, 0 SALEXT,0 NRORENOV, 0 RENLOC, '+
         ' 0 RENEXT,0 NROREFINA, 0 REFLOC, 0 REFEXT, 0 NRODIF, 0 DIFLOC, 0 DIFEXT, '+
         ' COUNT(CPMTOLOC) NRODEV, '+
         ' SUM(CASE WHEN C.CHQ_FECDEV IS NULL THEN CPMTOLOC ELSE C.TXMTOLOC END ) DEVLOC, '+
         ' SUM(CASE WHEN C.CHQ_FECDEV IS NULL THEN CPMTOEXT ELSE C.TXMTOEXT END ) DEVEXT, '+
         ' 0 NROPROT, 0 PROTLOC, 0 PROTEXT '+
         ' FROM CXP301 LEFT JOIN CAJA305 C ON C.CIAID=CXP301.CIAID AND C.FPAGOID='+QuotedStr(DMCXP.wsFChe)+' AND C.TXNOCHQ=CXP301.CPNODOC AND C.CLIEID=CXP301.CLIEID AND C.CHQ_ESTADO=''DEVUELTO''  ,TGE181 '+
         ' WHERE MESIDI=CASE WHEN  YEAR(C.CHQ_FECDEV) IS NULL THEN MONTH(CXP301.CPFEMIS) ELSE MONTH(C.CHQ_FECDEV) END AND '+
         ' CXP301.CLIEID='+QuotedStr(dblcProv.text)+' AND CXP301.DOCID ='+QuotedStr(DMCXP.wsChe)+' AND TCANJEID=''DE'' '+
         ' GROUP BY MESIDR,MESDESL,YEAR(CXP301.CPFEMIS),YEAR(C.CHQ_FECDEV) '+
         ' '+
         ' ) TABLA '+
         ' GROUP BY MESIDR,MESDESL,CLIECREMAX,ANO '+
         ' ORDER BY MESIDR,MESDESL,ANO ';
  end
 	else
  if (SRV_D = 'ORACLE') then
  begin
    sSQL:=' SELECT MESIDR,MESDESL,ANO,CLIECREMAX, SUM(MTOLOC) MTOLOC, SUM(MTOEXT) MTOEXT, '+
          ' SUM(PAGLOC) PAGLOC, SUM(PAGEXT) PAGEXT, SUM(SALLOC) SALLOC, '+
          ' SUM(SALEXT) SALEXT, SUM(NRORENOV) NRORENOV, SUM(RENLOC) RENLOC, '+
          ' SUM(RENEXT) RENEXT, SUM(NROREFINA) NROREFINA, SUM(REFLOC) REFLOC, '+
          ' SUM(REFEXT) REFEXT, SUM(NRODIF) NRODIF, SUM(DIFLOC) DIFLOC, '+
          ' SUM(DIFEXT) DIFEXT, SUM(NRODEV) NRODEV, SUM(DEVLOC) DEVLOC, SUM(DEVEXT) DEVEXT, SUM(NROPROT) NROPROT, SUM(PROTLOC) PROTLOC, SUM(PROTEXT) PROTEXT '+
          '  FROM ( '+
          ' SELECT MESIDR,MESDESL,TO_NUMBER(TO_CHAR(CPFEMIS,''YYYY'')) ANO, 0 CLIECREMAX, SUM(CPMTOLOC) MTOLOC, SUM(CPMTOEXT) MTOEXT, 0 PAGLOC, 0 PAGEXT, 0 SALLOC, 0 SALEXT, '+
          ' 0 NRORENOV,0 RENLOC,0 RENEXT,0 NROREFINA, 0 REFLOC, 0 REFEXT,0 NRODIF, 0 DIFLOC, 0 DIFEXT,0 NRODEV, 0 DEVLOC, 0 DEVEXT, '+
          ' 0 NROPROT, 0 PROTLOC, 0 PROTEXT '+
          ' FROM CXP301,TGE181 '+
          ' WHERE MESIDR=SUBSTR(CPANOMES,5,2) AND CXP301.CLIEID='+QuotedStr(dblcProv.text)+' AND DOCID IN ('+QuotedStr(DMCXP.wsFac)+','+QuotedStr(DMCXP.wsBol)+','+QuotedStr(DMCXP.wsNCre)+') '+
          ' GROUP BY MESIDR,MESDESL,TO_NUMBER(TO_CHAR(CPFEMIS,''YYYY'')) '+
          ' UNION '+
          ' SELECT MESIDR,MESDESL, TO_NUMBER(TO_CHAR(CPFCANJE,''YYYY'')) ANO, 0 CLIECREMAX, 0 MTOLOC, 0 MTOEXT, SUM(DCPMTOLOC) PAGLOC, SUM(DCPMTOEXT) PAGEXT, 0 SALLOC, 0 SALEXT, '+
          ' 0 NRORENOV,0 RENLOC,0 RENEXT,0 NROREFINA, 0 REFLOC, 0 REFEXT,0 NRODIF, 0 DIFLOC, 0 DIFEXT,0 NRODEV, 0 DEVLOC, 0 DEVEXT,    '+
          ' 0 NROPROT, 0 PROTLOC, 0 PROTEXT '+
          ' FROM CXP305,TGE181 '+
          ' WHERE CLIEID='+QuotedStr(dblcProv.text)+' AND DOCID IN ('+QuotedStr(DMCXP.wsFac)+','+QuotedStr(DMCXP.wsBol)+','+QuotedStr(DMCXP.wsNDe)+') AND MESID= TO_NUMBER(TO_CHAR(CPFCANJE,''MM'')) '+
          ' GROUP BY MESIDR,MESDESL,TO_NUMBER(TO_CHAR(CPFCANJE,''YYYY'')) '+
          ' UNION '+
          ' SELECT MESIDR,MESDESL,TO_NUMBER(TO_CHAR(CPFEMIS,''YYYY'')) ANO, 0 CLIECREMAX, '+
          ' 0 MTOLOC, 0 MTOEXT, 0 PAGLOC, 0 PAGEXT, 0 SALLOC, 0 SALEXT,SUM(CPNRENOV) NRORENOV,'+
          ' SUM(CPMTOLOC) RENLOC, SUM(CPMTOEXT) RENEXT,0 NROREFINA, 0 REFLOC, 0 REFEXT,0 NRODIF,'+
          '  0 DIFLOC, 0 DIFEXT, '+
          ' 0 NRODEV, 0 DEVLOC, 0 DEVEXT, '+
          ' 0 NROPROT, 0 PROTLOC, 0 PROTEXT '+
          ' FROM CXP301,TGE181 '+
          ' WHERE MESIDR=SUBSTR(CPANOMES,5,2) AND CXP301.CLIEID='+QuotedStr(dblcProv.text)+' AND DOCID ='+QuotedStr(DMCXP.wsLet)+' AND CPNRENOV=1 '+
          ' GROUP BY MESIDR,MESDESL,TO_NUMBER(TO_CHAR(CPFEMIS,''YYYY'')),CPNRENOV '+
          ' UNION '+
          ' SELECT MESIDR,MESDESL,TO_NUMBER(TO_CHAR(CPFEMIS,''YYYY'')) ANO, 0 CLIECREMAX,'+
          ' 0 MTOLOC, 0 MTOEXT, 0 PAGLOC, 0 PAGEXT, 0 SALLOC, 0 SALEXT,0 NRORENOV, '+
          ' 0 RENLOC, '+
          ' 0 RENEXT,COUNT(CPMTOEXT) NROREFINA, SUM(CPMTOLOC) REFLOC, SUM(CPMTOEXT) REFEXT,0 NRODIF, 0 DIFLOC, 0 DIFEXT, '+
          ' 0 NRODEV, 0 DEVLOC, 0 DEVEXT, '+
          ' 0 NROPROT, 0 PROTLOC, 0 PROTEXT '+
          ' FROM CXP301,TGE181 '+
          ' WHERE MESIDR=SUBSTR(CPANOMES,5,2) AND CXP301.CLIEID='+
          QuotedStr(dblcProv.text)+' AND DOCID ='+QuotedStr(DMCXP.wsLet);


    sSQL1:= sSql1 + ' AND '+DMCXP.wReplacCeros+'(CPFLAGVTA,''NULO'')=''NULO'' '+' AND CPNRENOV IS NULL '+
          ' GROUP BY MESIDR,MESDESL,TO_NUMBER(TO_CHAR(CPFEMIS,''YYYY'')) '+
          ' UNION '+
          ' SELECT MESIDR,MESDESL,TO_NUMBER(TO_CHAR(CPFEMIS,''YYYY'')) ANO, 0 CLIECREMAX,'+
          ' 0 MTOLOC, 0 MTOEXT, 0 PAGLOC, 0 PAGEXT, 0 SALLOC, 0 SALEXT,0 NRORENOV, '+
          ' 0 RENLOC, '+
          ' 0 RENEXT,0 NROREFINA, 0 REFLOC, 0 REFEXT, COUNT(CPMTOLOC) NRODIF, '+
          ' SUM(CPMTOLOC) DIFLOC, SUM(CPMTOEXT) DIFEXT, '+
          ' 0 NRODEV, 0 DEVLOC, 0 DEVEXT, '+
          ' 0 NROPROT, 0 PROTLOC, 0 PROTEXT '+
          ' FROM CXP301,TGE181 '+
          ' WHERE MESIDR=SUBSTR(CPANOMES,5,2) AND CXP301.CLIEID='+QuotedStr(dblcProv.text)+' AND DOCID ='+QuotedStr(DMCXP.wsChe)+' AND TCANJEID=''DI'' '+
          ' GROUP BY MESIDR,MESDESL,TO_NUMBER(TO_CHAR(CPFEMIS,''YYYY'')) '+
          ' UNION '+
          '  SELECT MESIDR,MESDESL,TO_NUMBER(TO_CHAR(CPFEMIS,''YYYY'')) ANO, 0 CLIECREMAX,'+
          ' 0 MTOLOC, 0 MTOEXT, 0 PAGLOC, 0 PAGEXT, 0 SALLOC, 0 SALEXT,  0 NRORENOV,'+
          ' 0 RENLOC, '+
          ' 0 RENEXT,0 NROREFINA, 0 REFLOC, 0 REFEXT,0 NRODIF, 0 DIFLOC, 0 DIFEXT,0 NRODEV, 0 DEVLOC, 0 DEVEXT, '+
          ' COUNT(CPMTOLOC) NROPROT, SUM(CPMTOLOC) PROTLOC, SUM(CPMTOEXT) PROTEXT '+
          ' FROM CXP301,TGE181  WHERE MESIDR=SUBSTR(CPANOMES,5,2) AND CXP301.CLIEID='+QuotedStr(dblcProv.text)+' AND DOCID ='+QuotedStr(DMCXP.wsLet)+ ' AND CPFLAGPROT=''S'' '+
          ' GROUP BY MESIDR,MESDESL,TO_NUMBER(TO_CHAR(CPFEMIS,''YYYY'')) '+
          ' UNION '+
          ' SELECT MESIDR,MESDESL,TO_NUMBER(TO_CHAR(CPFEMIS,''YYYY'')) ANO, 0 CLIECREMAX, '+
          ' 0 MTOLOC, 0 MTOEXT, 0 PAGLOC, 0 PAGEXT, 0 SALLOC, 0 SALEXT,0 NRORENOV, 0 RENLOC, '+
          ' 0 RENEXT,0 NROREFINA, 0 REFLOC, 0 REFEXT, 0 NRODIF, 0 DIFLOC, 0 DIFEXT, '+
          ' COUNT(CPMTOLOC) NRODEV, SUM(CPMTOLOC) DEVLOC, SUM(CPMTOEXT) DEVEXT, 0 NROPROT, 0 PROTLOC, 0 PROTEXT '+
          ' FROM CXP301,TGE181 '+
          ' WHERE MESIDR=SUBSTR(CPANOMES,5,2) AND CXP301.CLIEID='+QuotedStr(dblcProv.text)
          +' AND DOCID ='+QuotedStr(DMCXP.wsChe)+' AND TCANJEID=''DE'' '+
          ' GROUP BY MESIDR,MESDESL,TO_NUMBER(TO_CHAR(CPFEMIS,''YYYY'')) ) TABLA '+
          ' GROUP BY MESIDR,MESDESL,CLIECREMAX,ANO '+
          ' ORDER BY MESIDR,MESDESL,ANO ';
  end;
	sSql := sSql + sSql1;
  DMCXP.cdsQry12.Close;
  DMCXP.cdsQry12.DataRequest(sSQL);
  DMCXP.cdsQry12.Open;
  DMCXP.cdsQry12.IndexFieldNames:='MESIDR;ANO';

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  	sSQL:='SELECT CLIECREMAX, ULTFECHA, MONTH(ULTFECHA) MES, '+
        	'YEAR(ULTFECHA) ANO '+
          'FROM CXP403 '+
          'WHERE CLIEID='+QuotedStr(dblcProv.text)+' '+
          'AND CIAID='+QuotedStr(FCIAID)
 	else
  	sSQL:='SELECT CLIECREMAX, ULTFECHA, TO_NUMBER(TO_CHAR(ULTFECHA,''MM'')) MES, '+
        	'TO_NUMBER(TO_CHAR(ULTFECHA,''YYYY'')) ANO '+
          'FROM CXP403 '+
          'WHERE CLIEID='+QuotedStr(dblcProv.text)+' '+
          'AND CIAID='+QuotedStr(FCIAID);
  DMCXP.cdsQry13.Close;
  DMCXP.cdsQry13.DataRequest(sSQL);
  DMCXP.cdsQry13.Open;
  DMCXP.cdsQry13.First;

  while not DMCXP.cdsQry13.EOF do
  begin
    DMCXP.cdsQry12.SetKey;
    DMCXP.cdsQry12.FieldByName('MESIDR').AsString:=StrZero(DMCXP.cdsQry13.FieldByName('MES').AsString,2);
    DMCXP.cdsQry12.FieldByName('ANO').AsString:=DMCXP.cdsQry13.FieldByName('ANO').AsString;
    if DMCXP.cdsQry12.Gotokey then
    begin
      DMCXP.cdsQry12.Edit;
      DMCXP.cdsQry12.FieldByName('CLIECREMAX').AsFloat:=DMCXP.cdsQry13.FieldByName('CLIECREMAX').AsFloat;
      DMCXP.cdsQry12.Post;
    end;
    DMCXP.cdsQry13.Next;
  end;

  if DMCXP.cdsQry12.RecordCount>0 then
  begin
    DecodeDate(date,Y,M,D);

    DMCXP.cdsQry12.First;
    while NOT DMCXP.cdsQry12.EOF do
    begin
      DMCXP.cdsQry12.Edit;
      if (Y=DMCXP.cdsQry12.FieldByName('ANO').AsInteger) AND (M=DMCXP.cdsQry12.FieldByName('MESIDR').AsInteger) then
      begin
        DMCXP.cdsQry12.FieldByName('CLIECREMAX').AsFloat:=rLineaCredito;
      end;

      DMCXP.cdsQry12.FieldByName('SALLOC').AsFloat:=DMCXP.cdsQry12.FieldByName('MTOLOC').AsFloat-DMCXP.cdsQry12.FieldByName('PAGLOC').AsFloat;
      DMCXP.cdsQry12.FieldByName('SALEXT').AsFloat:=DMCXP.cdsQry12.FieldByName('MTOEXT').AsFloat-DMCXP.cdsQry12.FieldByName('PAGEXT').AsFloat;
      DMCXP.cdsQry12.Post;
      DMCXP.cdsQry12.Next;

    end;
    CalculaTotales;
    ppRepAnos.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\RepAnos.rtm';
    ppRepAnos.template.LoadFromFile ;
    pplRATitulo.text:=' ANALISIS DEL CLIENTE: '+dbeCLIE.text;
    ppRepAnos.Print;
    ppRepAnos.stop;
    //ppDesigner1.Show;
  end
  else
  begin
    ShowMessage('No Hay Registros que mostrar');
  end;
end;

procedure TFEstCxCPro.ppRepAnosPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;
end;

procedure TFEstCxCPro.CalculaTotales;
var sAno,sIndice:string;
    ListaAno: array [1..5] of string;
    i,x:word;
begin
  sIndice:=DMCXP.cdsQry12.IndexFieldNames;
  i:=1;
  DMCXP.cdsQry12.IndexFieldNames:='ANO';
  DMCXP.cdsQry12.First;
  sAno:=DMCXP.cdsQry12.FieldByName('ANO').AsString;
  ListaAno[i]:=sAno;
  while not DMCXP.cdsQry12.EOF do
  begin
    if sAno<>DMCXP.cdsQry12.FieldByName('ANO').AsString then
    begin
      i:=i+1;
      ListaAno[i]:=DMCXP.cdsQry12.FieldByName('ANO').AsString;
      sAno:=DMCXP.cdsQry12.FieldByName('ANO').AsString;
    end;
    DMCXP.cdsQry12.Next;
  end;
  InsertaRayas;
  for x:=1 to i do
  begin
    DMCXP.cdsQry12.Insert;
    DMCXP.cdsQry12.FieldByName('MESIDR').AsString:='99';
    DMCXP.cdsQry12.FieldByName('MESDESL').AsString:='TOTAL';
    DMCXP.cdsQry12.FieldByName('ANO').AsString:=ListaAno[x];
//    DMCXP.cdsQry12.FieldByName('CLIECREMAX').AsFloat:=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(CLIECREMAX)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('MTOLOC').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(MTOLOC)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('MTOEXT').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(MTOEXT)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('PAGLOC').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(PAGLOC)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('PAGEXT').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(PAGEXT)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('SALLOC').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(SALLOC)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('SALEXT').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(SALEXT)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('NRORENOV').AsFloat  :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(NRORENOV)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('RENLOC').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(RENLOC)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('RENEXT').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(RENEXT)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('NROREFINA').AsFloat :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(NROREFINA)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('REFLOC').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(REFLOC)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('REFEXT').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(REFEXT)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('NRODIF').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(NRODIF)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('DIFLOC').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(DIFLOC)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('DIFEXT').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(DIFEXT)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('NRODEV').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(NRODEV)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('DEVLOC').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(DEVLOC)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('DEVEXT').AsFloat    :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(DEVEXT)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('NROPROT').AsFloat   :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(NROPROT)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('PROTLOC').AsFloat   :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(PROTLOC)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.FieldByName('PROTEXT').AsFloat   :=OperClientDataSet( DMCXP.cdsQry12 , 'SUM(PROTEXT)', 'ANO='+QuotedStr(ListaAno[x]));
    DMCXP.cdsQry12.Post;
  end;

  DMCXP.cdsQry12.IndexFieldNames:=sIndice;
end;

procedure TFEstCxCPro.InsertaRayas;
begin
    DMCXP.cdsQry12.Insert;
    DMCXP.cdsQry12.FieldByName('MESIDR').AsString:='99';
    DMCXP.cdsQry12.FieldByName('MESDESL').AsString:='   ';
    DMCXP.cdsQry12.Post;
end;


procedure TFEstCxCPro.cSQLDocs;
begin
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     sSQLDocs:=
        'SELECT CXP.CPFVCMTO FECHA, ''01'' DCPOMABR, DAYS(CXP.CPFVCMTO)-DAYS(CXP.CPFVCMTO) EDAD, CXP.CPNODOC, '
       +   ''''' CPNLETBCO, CXP.CPFEMIS, CXP.CPFVCMTO, CXP.CPTCAMPR, CXP.CPNOREG, '
       +   'CXP.PROV, CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, CXP.CPMTOEXT, '
       +   'CXP.CPPAGEXT, CXP.CPSALEXT, CXP.CPSERIE, CXP.CIAID, CXP.DOCID, '
       +   'MON.TMON_LOC, MON.TMONABR, DOC.DOCABR, DOC.DOCRESTA, '''' UBICADES, '
       +   ''''' SITUADES, CXP.CPMTOORI, CLI.PROVDES, CXP.TMONID, CXP.CPESTADO , '
       +   DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0) AS COL_2,'+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0) AS COL_3, '
       +   '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
       +   '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE CXP.CPMTOEXT END) AS MTOEXT, '
       +   '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN '+DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGLOC,0) ELSE 0 END) AS SALLOC, '
       +   '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE '+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGEXT,0) END) AS SALEXT, '
       +   '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
       +   '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE CXP.CPPAGEXT END) AS PAGEXT '
       +'FROM CXP301 CXP '
       +   'INNER JOIN TGE103 MON ON (CXP.TMONID=MON.TMONID) '
       +   'INNER JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD=''CXP'' AND DOC.DOC_FREG=''P'' '
       +              'AND COALESCE(DOCRESTA,'''')<>''S'' AND COALESCE(DOCTIPREG,'''')<>''LT''), '
       +   'TGE201 CLI ';
  end;
  if (SRV_D = 'ORACLE') then
  begin
     sSQLDocs:=
        'SELECT CXP.CPFVCMTO FECHA, ''01'' DCPOMABR, '
       +   'TO_NUMBER(TO_CHAR(CXP.CPFVCMTO,''DD'')) - TO_NUMBER(TO_CHAR(CXP.CPFVCMTO,''DD'')) EDAD, '
       +   'CXP.CPNODOC, '''' CPNLETBCO, CXP.CPFEMIS, CXP.CPFVCMTO, CXP.CPTCAMPR, CXP.CPNOREG, '
       +   'CXP.PROV, CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, CXP.CPMTOEXT, '
       +   'CXP.CPPAGEXT, CXP.CPSALEXT, CXP.CPSERIE, CXP.CIAID, CXP.DOCID, '
       +   'MON.TMON_LOC, MON.TMONABR, DOC.DOCABR, DOC.DOCRESTA, '''' UBICADES, '
       +   ''''' SITUADES, CXP.CPMTOORI, CLI.PROVDES, CXP.TMONID, CXP.CPESTADO , '
       +   DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0) AS COL_2,'+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0) AS COL_3, '
       +   '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
       +   '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE CXP.CPMTOEXT END) AS MTOEXT, '
       +   '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN '+DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGLOC,0) ELSE 0 END) AS SALLOC, '
       +   '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP .wTMonLoc)+' THEN 0 ELSE '+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGEXT,0) END) AS SALEXT, '
       +   '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
       +   '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE CXP.CPPAGEXT END) AS PAGEXT '
       +'FROM CXP301 CXP, TGE103 MON, TGE110 DOC, TGE201 CLI '
       +'WHERE ( CXP.TMONID=MON.TMONID ) '
       +  'AND ( CXP.DOCID=DOC.DOCID AND DOC.DOCMOD=''CXP'' AND DOC.DOC_FREG=''P'' AND '
       +        'NVL(DOCRESTA,''X'')<>''S'' AND NVL(DOCTIPREG,''X'')<>''LT'') ';
  end;
end;

procedure TFEstCxCPro.cSQLLetras;
begin
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      sSQLLetras:=
         'SELECT CXP.TCANJEID, CXP.CPCANJE, '''' CPFLAGPROT, CXP.CPFVCMTO FECHA, '''' DCPOMABR, '
        +  'CXP.CPNOREG, DAYS(CXP.CPFVCMTO)-DAYS(CXP.CPFVCMTO) EDAD, '
        +  'CXP.CPNODOC, '''' CPNLETBCO, CXP.CPFEMIS, CXP.CPFVCMTO, CXP.CPTCAMPR, '
        +  'CXP.PROV, CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, CXP.CPMTOEXT, '
        +  'CXP.CPPAGEXT, CXP.CPSALEXT, CXP.CPSERIE, CXP.CIAID, CXP.DOCID, '
        +  'MON.TMON_LOC, MON.TMONABR, DOC.DOCABR, DOC.DOCRESTA, '''' UBICADES, '
        +  ''''' SITUADES, CXP.CPMTOORI, CLI.PROVDES, CXP.TMONID, CXP.CPESTADO, '
        +  DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0) AS COL_2,'+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0) AS COL_3, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE CXP.CPMTOEXT END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN '+DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGLOC,0) ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE '+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGEXT,0) END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE CXP.CPPAGEXT END) AS PAGEXT '
        +'FROM CXP301 CXP '
        +  'INNER JOIN TGE103 MON ON (CXP.TMONID=MON.TMONID) '
        +  'INNER JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD=''CXP'' AND DOC.DOC_FREG=''L''), '
        +  'TGE201 CLI ';
   end;
   if (SRV_D = 'ORACLE') then
   begin
      sSQLLetras:=
         'SELECT CXP.TCANJEID, CXP.CPCANJE, '''' CPFLAGPROT, CXP.CPFVCMTO FECHA, '''' DCPOMABR, '
        +  'CXP.CPNOREG, TO_NUMBER(TO_CHAR(CXP.CPFVCMTO,''DD'')) - TO_NUMBER(TO_CHAR(CXP.CPFVCMTO,''DD'')) EDAD, '
        +  'CXP.CPNODOC, '''' CPNLETBCO, CXP.CPFEMIS, CXP.CPFVCMTO, CXP.CPTCAMPR, '
        +  'CXP.PROV, CXP.CPMTOLOC, CXP.CPPAGLOC, CXP.CPSALLOC, CXP.CPMTOEXT, '
        +  'CXP.CPPAGEXT, CXP.CPSALEXT, CXP.CPSERIE, CXP.CIAID, CXP.DOCID, '
        +  'MON.TMON_LOC, MON.TMONABR, DOC.DOCABR, DOC.DOCRESTA, '''' UBICADES, '
        +  ''''' SITUADES, CXP.CPMTOORI, CLI.PROVDES, CXP.TMONID, CXP.CPESTADO, '
        +  DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0) AS COL_2,'+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0) AS COL_3, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CXP.CPMTOLOC ELSE 0 END) AS MTOLOC, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE CXP.CPMTOEXT END) AS MTOEXT, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN '+DMCXP.wReplacCeros+'(CXP.CPMTOLOC,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGLOC,0) ELSE 0 END) AS SALLOC, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE '+DMCXP.wReplacCeros+'(CXP.CPMTOEXT,0)-'+DMCXP.wReplacCeros+'(CXP.CPPAGEXT,0) END) AS SALEXT, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CXP.CPPAGLOC ELSE 0 END) AS PAGLOC, '
        +  '(CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE CXP.CPPAGEXT END) AS PAGEXT '
        +'FROM CXP301 CXP, TGE103 MON, TGE110 DOC, TGE201 CLI '
        +'WHERE ( CXP.TMONID=MON.TMONID ) '
        +  'AND ( CXP.DOCID=DOC.DOCID AND DOC.DOCMOD=''CXP'' AND DOC.DOC_FREG=''L'' ) ';
   end;
end;

procedure TFEstCxCPro.cFooterTodos(dbg: TwwDBGrid; cds: TwwClientDataSet);
var
  MlocS, MExtS, TLocS, TExtS, MlocR, MExtR, TLocR, TExtR, PLocS, PExtS : Double;
begin
  MlocS := OperClientDataSet( cds , 'SUM(MTOLOC)', '');
  PLocS := OperClientDataSet( cds , 'SUM(PAGLOC)', '');
  TlocS := OperClientDataSet( cds , 'SUM(SALLOC)', '');

  MExtS := OperClientDataSet( cds , 'SUM(MTOEXT)', '');
  PExtS := OperClientDataSet( cds , 'SUM(PAGEXT)', '');
  TExtS := OperClientDataSet( cds , 'SUM(SALEXT)', '');

  dbg.ColumnByName('MTOLOC').FooterValue  :=FloatToStrF(MLocS, ffNumber, 15, 2);
  dbg.ColumnByName('PAGLOC').FooterValue  :=FloatToStrF(PLocS, ffNumber, 15, 2);
  dbg.ColumnByName('SALLOC').FooterValue  :=FloatToStrF(TLocS, ffNumber, 15, 2);

  dbg.ColumnByName('MTOEXT').FooterValue  :=FloatToStrF(MExtS, ffNumber, 15, 2);
  dbg.ColumnByName('PAGEXT').FooterValue  :=FloatToStrF(PExtS, ffNumber, 15, 2);
  dbg.ColumnByName('SALEXT').FooterValue  :=FloatToStrF(TExtS, ffNumber, 15, 2);
  dbg.FooterCellColor := clInfoBk;
  dbg.RedrawGrid;
end;

procedure TFEstCxCPro.AceptarCompleto;
var
 c,xSQL, xSQLAdendo, xSQLLetra, xSQLNCredito, xSQLCheque, xSQLCheque1, xSQLChequeCXP301, xSQLAnticipo, xSQLCajaNoProv : String;
 xCondicion ,sConDoc,
 xCondicionLetras : string ;
 xSQLFinal,xLetras  : String ;
 sConAdendo,sConNCreditos,sNCredito,sConChequesCXP301,sConLetras,sConCheques,sConCheques1,sConAnticipos,sWhere,sCheque,sAnticipo, sConNoProvisio : string;
begin
  Screen.Cursor:=crHourGlass;
  if dtpINI.Date > dtpFIN.Date then
  begin
     Application.MessageBox('La fecha inicial no debe ser mayor que la fecha final',
                            'Error en fechas', MB_ICONERROR+MB_OK);
     dtpINI.SetFocus;
     Exit;
  end;

  sNCredito:= FiltraDoc( 'N' );
  xLetras  := DMCXP.displaydescrip2('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''L''','DOCID');
  sCheque  := DMCXP.displaydescrip2('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''9''','DOCID');
  sAnticipo:= DMCXP.displaydescrip2('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''NC''','DOCID'); // JORGE

  if StrToFloat(dbeTCAMB.Text) <= 0 then
     stcam := '1'
  else
     stcam := dbeTCAMB.Text;

  xSQL := '';
  xSQLLetra:='';
  xSQLAdendo:='';
  sConAdendo:='';
  sConLetras:='';
  sConCheques:='';
  sConCheques1:='';
  xSQLCajaNoProv:='';
  sConChequesCXP301:='';
  sConAnticipos:='';
  sConNCreditos:='';

  case rgEST.ItemIndex of
   0: begin //TODOS
        //** 25/10/2002 - PJSV
        sConDoc:=' AND ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') <>''XX'' '
                + 'AND '+DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''I'' '
                + 'AND '+DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''E'' AND '
                + DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''A'')';

        sConLetras:=' AND ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') <>''XX'' AND '
                   +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''I'' AND '
                   +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''E'' AND '
                   +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''A'')';
        sConCheques	  := '';
        sConCheques1	  := '';
        sConChequesCXP301 := '';
        sConAnticipos	 :=' AND ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') <>''XX'' AND '
                          +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''I'' AND '
                          +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''E'' AND '
                          +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''A'')';
        sConNCreditos:=' AND ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') <>''XX'' AND '
                      +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''I'' AND '
                      +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''E'' AND '
                      +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''A'')';
        //**
       end;
    1: begin //PENDIENTES
        sConDoc		  := ' AND CPESTADO=''P'' ';
        sConLetras 	  := ' AND CPESTADO=''P'' ';
        sConCheques	  := ' AND (CAJA.CHQ_ESTADO=''PEND.COB'' OR CAJA.CHQ_ESTADO IS NULL)';
        sConCheques1	  := ' AND (A.CHQ_ESTADO=''PEND.COB'' OR A.CHQ_ESTADO IS NULL)';
        sConNoProvisio	  := ' AND 1<>1';
        sConNoProvisio	  := ' AND 1=1';
        sConChequesCXP301 := ' AND CPESTADO=''P'' ';
        sConAnticipos	  := ' AND CPESTADO=''P'' ';
        sConNCreditos	  := ' AND CPESTADO=''P'' ';
       end;
     2: begin //CANCELADOS
         sConDoc	  := ' AND CPESTADO=''C'' ';
         sConLetras 	  := ' AND CPESTADO=''C'' ';
         sConCheques	  := ' AND (CAJA.CHQ_ESTADO=''COBRADO'')';
         sConCheques1	  := ' AND (A.CHQ_ESTADO=''COBRADO'')';
         sConChequesCXP301:= ' AND CPESTADO=''C'' ';
         sConAnticipos	  := ' AND CPESTADO=''C'' ';
         sConNCreditos	  := ' AND CPESTADO=''C'' ';
        end;
     3: begin // PENDIENTES DE ACEPTACION
         //** 25/10/2002 - PJSV
         sConDoc	  := ' AND (('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') = ''XX'') OR ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') = ''I''))';
         sConLetras 	  := ' AND (('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') =''XX'') OR ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') = ''I''))';
         sConCheques	  := ' AND (CAJA.CHQ_ESTADO=''XX'')';
         sConCheques1	  := ' AND (A.CHQ_ESTADO=''XX'')';
         sConChequesCXP301:= '';
         sConNoProvisio	  := ' AND 1<>1';
         sConAnticipos	  := ' AND (('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') = ''XX'') OR ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') = ''I''))';
         sConNCreditos	  := ' AND (('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') = ''XX'') OR ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') = ''I''))';
         //**
        end;
  end;
  sConAdendo:= ' AND (('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') =''XX'') OR ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') = ''I''))';

  xSQL 		  := xSQL          + ' AND (CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) '+sConDoc;
  xSQLLetra 	  := xSQLLetra     + ' AND (CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) '+sConLetras;
  xSQLCajaNoProv  := xSQLCajaNoProv+ ' AND (A.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) '+sConNoProvisio; //AND A.CPFEMIS>='01/01/2003' AND A.CPFEMIS<='03/02/2003'
  xSQLAdendo 	  := xSQLAdendo    + ' AND (CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) '+sConAdendo;
  xSQLCheque 	  := xSQLCheque    + ' AND CAJA.CHQ_FECEMI < CAJA.CHQ_FECVCM  '+sConCheques;
  xSQLCheque1 	  := xSQLCheque1   + ' AND A.CHQ_FECEMI < A.CHQ_FECVCM '+sConCheques1;
  xSQLChequeCXP301:= xSQLChequeCXP301+sConChequesCXP301; //+ ' AND (CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) '
  xSQLAnticipo    := xSQLAnticipo  + ' AND (CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) '+sConAnticipos;
  xSQLNCredito    := xSQLNCredito  + ' AND (CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) '+sConNCreditos;

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    xSQL 	         := ' WHERE CXP.PROV='''+Cliente+''''+ xSQL;
    xSQLLetra 	      := ' WHERE CXP.PROV='''+Cliente+''''+xSQLLetra;
    xSQLAdendo 	   := ' WHERE CXP.PROV='''+Cliente+''''+xSQLAdendo;
    xSQLCajaNoProv   := ' AND A.PROV='''+Cliente+''''+xSQLCajaNoProv;
    xSQLCheque 	   := ' WHERE CAJA.PROV='''+Cliente+''''+xSQLCheque;
    xSQLCheque1      := ' WHERE A.PROV='''+Cliente+''''+xSQLCheque1;
    xSQLChequeCXP301 := ' WHERE CXP.PROV='''+Cliente+''''+xSQLChequeCXP301;
    xSQLAnticipo     := ' WHERE CXP.PROV='''+Cliente+''''+xSQLAnticipo;
    xSQLNCredito     := ' WHERE CXP.PROV='''+Cliente+''''+xSQLNCredito;
  end;
  if (SRV_D = 'ORACLE') then
  begin
    xSQL 	         := ' AND CXP.PROV='''+Cliente+''''+ xSQL;
    xSQLLetra 	      := ' AND CXP.PROV='''+Cliente+''''+xSQLLetra;
    xSQLCajaNoProv   := ' AND A.PROV='''  +Cliente+''''+xSQLCajaNoProv;
    xSQLAdendo 	   := ' AND CXP.PROV='''+Cliente+''''+xSQLAdendo;
    xSQLCheque 	   := ' AND CAJA.PROV='''+Cliente+''''+xSQLCheque;
    xSQLCheque1      := ' AND A.PROV='''  +Cliente+''''+xSQLCheque1;
    xSQLChequeCXP301 := ' AND CXP.PROV='''+Cliente+''''+xSQLChequeCXP301;
    xSQLAnticipo     := ' AND CXP.PROV='''+Cliente+''''+xSQLAnticipo;
    xSQLNCredito     := ' AND CXP.PROV='''+Cliente+''''+xSQLNCredito;
  end;

  ////////////////////////////////////// TODOS //////////////////////////
  cSQLTodos;
  xSQLFinal:= sSQLTodos + xSQL + ' AND CXP.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text);
  dbgTodos.DataSource := DMCXP.dsReporte;
  DMCXP.cdsReporte.Close;
  DMCXP.cdsReporte.DataRequest ( xSQLFinal ) ;

  DMCXP.cdsReporte.Open;
  DMCXP.cdsReporte.IndexFieldNames:='CIAID;DOCID;CPSERIE;CPNODOC';

  TNumericField(DMCXP.cdsReporte.FieldByName('MTOLOC')).DisplayFormat :='###,###,##0.00';
  TNumericField(DMCXP.cdsReporte.FieldByName('PAGLOC')).DisplayFormat :='###,###,##0.00';
  TNumericField(DMCXP.cdsReporte.FieldByName('SALLOC')).DisplayFormat :='###,###,##0.00';
  TNumericField(DMCXP.cdsReporte.FieldByName('MTOEXT')).DisplayFormat :='###,###,##0.00';
  TNumericField(DMCXP.cdsReporte.FieldByName('PAGEXT')).DisplayFormat :='###,###,##0.00';
  TNumericField(DMCXP.cdsReporte.FieldByName('SALEXT')).DisplayFormat :='###,###,##0.00';

  dbgTodos.Selected.Clear;
  dbgTodos.Selected.Add('POS'#9'3'#9'Pos'#9'F');
  dbgTodos.Selected.Add('DOCABR'#9'5'#9'Tipo'#9'F');
  dbgTodos.Selected.Add('CPSERIE'#9'4'#9'Serie'#9'F');
  dbgTodos.Selected.Add('CPNODOC'#9'11'#9'Número'#9'F');
  dbgTodos.Selected.Add('CPFEMIS'#9'10'#9'Fecha~Emisión.'#9'F');
  dbgTodos.Selected.Add('CPFVCMTO'#9'10'#9'Fecha~Vencimiento.'#9'F');
  dbgTodos.Selected.Add('TMONABR'#9'4'#9'Moneda.'#9'F');
  dbgTodos.Selected.Add('MTOEXT'#9'10'#9'Monto~Original(ME)'#9'F');
  dbgTodos.Selected.Add('PAGEXT'#9'10'#9'Pago (ME)'#9'F');
  dbgTodos.Selected.Add('SALEXT'#9'10'#9'Saldo (ME)'#9'F');
  dbgTodos.Selected.Add('MTOLOC'#9'10'#9'Monto~Original(MN)'#9'F');
  dbgTodos.Selected.Add('PAGLOC'#9'10'#9'Pago (MN)'#9'F');
  dbgTodos.Selected.Add('SALLOC'#9'10'#9'Saldo (MN)'#9'F');
  dbgTodos.RedrawGrid;

  DMCXP.cdsReporte.DisableControls;
  DMCXP.cdsReporte.First;
  while not DMCXP.cdsReporte.EOF do
  begin
     DMCXP.cdsReporte.Edit;
     DMCXP.cdsReporte.FieldByName('POS').AsString:=IntToStr(DMCXP.cdsReporte.RecNo);
     DMCXP.cdsReporte.Post;
     DMCXP.cdsReporte.Next;
  end;
  DMCXP.cdsReporte.EnableControls;

  ////////////////////////////////// DOCUMENTOS /////////////////////////////////
  cSQLDocs;
  xSQLFinal := sSQLDocs + xSQL +' AND CXP.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text)+
  															' AND (CLI.PROV=CXP.PROV AND CLI.CLAUXID=CXP.CLAUXID)' ;
  dbgEst2.DataSource := DMCXP.dsQRY2;
  DMCXP.cdsQRY2.Close;
  DMCXP.cdsQRY2.ProviderName := 'dspTGE'  ;
  DMCXP.cdsQRY2.DataRequest ( xSQLFinal ) ;
  DMCXP.cdsQRY2.Open;

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     C :='SELECT A.CIAID, A.PROV, A.DOCID, A.CPSERIE, A.CPNODOC, A.TCANJEID, A.DOCID2, A.CPSERIE2, A.CPNODOC2, '
        +  'A.TMONID, A.CCPCANJE, '
        +  'CASE WHEN A.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE A.DCDMOEXT END DCPMTOEXT, '
        +  'CASE WHEN A.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN A.DCDMOLOC ELSE 0 END DCPMTOLOC, '
        +  'A.DCDMOEXT CPMTOEXT, A.DCDMOLOC CPMTOLOC, CPNOREG, '
        +  'A.DCDMOORI, A.CCPFCJE, B.DOCABR, C.DOCABR DOCABR2, E.TMONDES, E.TMONABR, E.TMON_LOC '
        +'FROM CXP305 A '
        +  'LEFT JOIN TGE103 E ON (E.TMONID=A.TMONID) '
        +  'LEFT JOIN TGE110 C ON C.DOCMOD=''CXP'' AND C.DOCID=A.DOCID2 '
	+  'INNER JOIN TGE110 B ON B.DOCMOD=''CXP'' AND B.DOCID=A.DOCID '
        +     'AND (('+DMCXP.wReplacCeros+'(B.DOCTIPREG,''XX'')<>''XX'' OR '+DMCXP.wReplacCeros+'(B.DOCTIPREG,''XX'')<>''CH'') '
        +     'AND B.DOC_FREG = ''P'') '
        +'WHERE A.PROV = '+QuotedStr(dblcProv.text)+' '
        +  'AND A.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text);
  end;
  if (SRV_D = 'ORACLE') then
  begin
     C :='SELECT A.CIAID, A.PROV, A.DOCID, A.CPSERIE, A.CPNODOC, A.TCANJEID, A.DOCID2, A.CPSERIE2, '
        +  'A.CPNODOC2, A.TMONID, A.CCPCANJE, '
        +  'CASE WHEN A.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE A.DCDMOEXT END DCPMTOEXT, '
        +  'CASE WHEN A.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN A.DCDMOLOC ELSE 0 END DCPMTOLOC, '
        +  'A.DCDMOEXT CPMTOEXT, A.DCDMOLOC CPMTOLOC, CPNOREG, '
        +  'A.DCDMOORI, A.CCPFCJE, B.DOCABR, C.DOCABR DOCABR2, E.TMONDES, E.TMONABR, E.TMON_LOC '
        +'FROM CXP305 A, TGE103 E, TGE110 C, TGE110 B '
        +'WHERE A.PROV='+QuotedStr(dblcProv.text)+' '
        +  'AND A.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text)+' '
        +  'AND E.TMONID(+)=A.TMONID AND C.DOCMOD(+)=''CXP'' AND C.DOCID(+)=A.DOCID2 '
        +  'AND B.DOCMOD=''CXP'' AND B.DOCID=A.DOCID AND B.DOCTIPREG<>''NC'' '
        +  'AND B.DOC_FREG<>''H'''+' AND B.DOC_FREG<>''A'' AND B.DOC_FREG<>''L''';
  end;

  DMCXP.cdsQry8.Close;
  DMCXP.cdsQry8.DataRequest( c );
  DMCXP.cdsQry8.Open;

  if DMCXP.cdsQry8.IndexFieldNames<>'CIAID;DOCID;CPSERIE;CPNODOC;CPNOREG' then
     DMCXP.cdsQry8.IndexFieldNames:='CIAID;DOCID;CPSERIE;CPNODOC;CPNOREG';
  DMCXP.cdsQry8.MasterSource:=DMCXP.dsQry2;
  DMCXP.cdsQry8.MasterFields:='CIAID;DOCID;CPSERIE;CPNODOC;CPNOREG';
  ppDBPipelineDF.DataSource:=DMCXP.dsQry8;

  //////////////////////////// LETRAS //////////////////////////////////
  cGRID(dbgEst3);
  cSQLLetras;
  xSQLFinal := sSQLLetras + xSQLLetra + ' AND CXP.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text) +
  	     ' AND (CLI.PROV=CXP.PROV AND CLI.CLAUXID=CXP.CLAUXID)'+
	     ' AND CXP.DOCID='+quotedstr(xLetras);
  DMCXP.cdsQRY4.Close;
  DMCXP.cdsQRY4.ProviderName := 'dspTGE';
  DMCXP.cdsQRY4.DataRequest ( xSQLFinal );
  DMCXP.cdsQRY4.Open;

  xSQLFinal := sSQLLetras + xSQLAdendo +' AND CXP.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text) +
	     ' AND (CLI.PROV=CXP.PROV AND CLI.CLAUXID=CXP.CLAUXID)'+
	     ' AND CXP.DOCID='+quotedstr(xLetras);
  DMCXP.cdsQRY11.Close;
  DMCXP.cdsQRY11.ProviderName := 'dspTGE';
  DMCXP.cdsQRY11.DataRequest ( xSQLFinal );
  DMCXP.cdsQRY11.Open;
  if rgEST.ItemIndex=3 then
     DMCXP.cdsQry11.EmptyDataSet;
                                     //YA
  // PAGOS DE LETRAS
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     c:='SELECT '+
	 'A.CIAID, A.PROV, A.DOCID, A.CPSERIE, A.CPNODOC, A.TCANJEID, A.DOCID2, A.CPSERIE2, A.CPNODOC2, A.TMONID, A.CCPCANJE, '+
	 'CASE WHEN A.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE A.DCDMOEXT END DCPMTOEXT, '+
	 'CASE WHEN A.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN A.DCDMOLOC ELSE 0 END DCPMTOLOC, '+
         'A.DCDMOEXT CPMTOEXT, A.DCDMOLOC CPMTOLOC, CPNOREG, '+
			 'A.DCDMOORI, A.CCPFCJE, '+
			 'B.DOCABR, C.DOCABR DOCABR2, E.TMONDES, E.TMONABR, E.TMON_LOC '+
			 'FROM CXP305 A '+
			 'LEFT JOIN TGE103 E ON (E.TMONID=A.TMONID)'+
			 'LEFT JOIN TGE110 C ON C.DOCID=A.DOCID2 AND C.DOCMOD=''CXP'' '+
			 'INNER  JOIN TGE110 B ON B.DOCID=A.DOCID AND B.DOCMOD=''CXP'' '+
			 'AND B.DOC_FREG=''L'''+
			 'WHERE A.PROV='+QuotedStr(dblcProv.text)+' '+
       'AND A.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text);
  end;
  if (SRV_D = 'ORACLE') then
  begin
     c:='SELECT '+
	   'A.CIAID, A.PROV, A.DOCID, A.CPSERIE, A.CPNODOC, A.TCANJEID, A.DOCID2, A.CPSERIE2, A.CPNODOC2, A.TMONID, A.CCPCANJE, '+
	   'CASE WHEN A.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE A.DCDMOEXT END DCPMTOEXT, '+
	   'CASE WHEN A.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN A.DCDMOLOC ELSE 0 END DCPMTOLOC, '+
       'A.DCDMOEXT CPMTOEXT, A.DCDMOLOC CPMTOLOC, CPNOREG, '+
			 'A.DCDMOORI, A.CCPFCJE, '+
       'B.DOCABR, C.DOCABR DOCABR2, E.TMONDES, E.TMONABR, E.TMON_LOC '+
       'FROM '+
       'CXP305 A,TGE103 E,TGE110 C,TGE110 B '+
       'WHERE A.PROV = '+QuotedStr(dblcProv.text)+' '+
       'AND A.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text)+' '+
       'AND E.TMONID=A.TMONID AND C.DOCID=A.DOCID2 AND C.DOCMOD=''CXP'' '+
       'AND B.DOCID=A.DOCID AND B.DOCMOD = ''CXP'' '+
       'AND B.DOC_FREG=''L''';
  end;

  DMCXP.cdsQry9.Close;
  DMCXP.cdsQry9.DataRequest (c) ;
  DMCXP.cdsQry9.Open;
  
  if DMCXP.cdsQry9.IndexFieldNames<>'CIAID;DOCID;CPSERIE;CPNODOC;CPNOREG' then
     DMCXP.cdsQry9.IndexFieldNames:='CIAID;DOCID;CPSERIE;CPNODOC;CPNOREG';
     
  DMCXP.cdsQry9.MasterSource:=DMCXP.dsQry4;
  DMCXP.cdsQry9.MasterFields:='CIAID;DOCID;CPSERIE;CPNODOC;CPNOREG';
  ppDBPipelineDL.DataSource:=DMCXP.dsQry9;

  //QUERY DE NOTAS DE CREDITO    DMCXP.cdsQry6
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     xSQL:='SELECT DOCABR, TMONABR, PROV, PROVDES, PROVRUC, CXP.CPSERIE, CPNODOC, CPFEMIS, CXP.CPFVCMTO, CXP.TMONID, '+
          'CXP.CPMTOORI, CXP.CPPAGORI, CXP.CPSALORI, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CPPAGLOC ELSE 0 END CPMTOLOC, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CPSALLOC ELSE 0 END CPSALLOC, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CPMTOLOC ELSE 0 END CPPAGLOC, '
          +  'CASE WHNE CXP.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN CPPAGEXT ELSE 0 END CPMTOEXT, '
          +  'CASE WHNE CXP.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN CPSALEXT ELSE 0 END CPSALEXT, '
          +  'CASE WHNE CXP.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN CPMTOEXT ELSE 0 END CPPAGEXT, '+
          'CXP.BANCOID, TGE105.BANCONOM '+
					'FROM CXP301 CXP '+
					'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD = ''CXP'') ' +
					'LEFT JOIN TGE103 ON TGE103.TMONID=CXP.TMONID '+
					'LEFT JOIN TGE105 ON CXP.BANCOID=TGE105.BANCOID '+xSQLNCredito+sConNCreditos+
//          'AND CXP.DOCID='+QuotedStr(sNCredito)+' '+
          'AND CXP.DOCID IN ( '+sNCredito+' ) '+
       		'AND CXP.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text);
  end;
  if (SRV_D = 'ORACLE') then
  begin
     xSQL:='SELECT DOCABR,TMONABR, PROV, PROVDES, PROVRUC, CXP.CPSERIE, CPNODOC, CPFEMIS, CXP.CPFVCMTO, CXP.TMONID, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CPPAGLOC      ELSE 0 END CPMTOLOC, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CPSALLOC*(-1) ELSE 0 END CPSALLOC, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CPMTOLOC      ELSE 0 END CPPAGLOC, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN CPPAGEXT      ELSE 0 END CPMTOEXT, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN CPSALEXT*(-1) ELSE 0 END CPSALEXT, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN CPMTOEXT      ELSE 0 END CPPAGEXT, '+
          'CXP.BANCOID, TGE105.BANCONOM '+
          'FROM CXP301 CXP, TGE105, TGE103, TGE110 DOC '+
          'WHERE CXP.BANCOID=TGE105.BANCOID(+) '+xSQLNCredito+sConNCreditos+
          'AND CXP.DOCID IN ( '+sNCredito +' ) AND TGE103.TMONID=CXP.TMONID '+
          'AND CXP.DOCID=DOC.DOCID AND DOC.DOCMOD = ''CXP'' '+
       		'AND CXP.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text);
  end; //AND CXP.CPPAGORI<=0

  dbgEst6.Selected.Clear;
  dbgEst6.Selected.Add('CPSERIE'#9'10'#9'Serie'#9'F');
  dbgEst6.Selected.Add('CPNODOC'#9'15'#9'Número'#9'F');
  dbgEst6.Selected.Add('CPNOREG'#9'4'#9'Nº~Reg.'#9'F');
  dbgEst6.Selected.Add('CPFEMIS'#9'10'#9'Fecha~Emisión.'#9'F');
  dbgEst6.Selected.Add('TMONID'#9'3'#9'Moneda.'#9'F');
  dbgEst6.Selected.Add('CPMTOLOC'#9'10'#9'Monto~Original(MN)'#9'F');
  dbgEst6.Selected.Add('CPPAGLOC'#9'10'#9'Monto~Aplicado(MN)'#9'F');
  dbgEst6.Selected.Add('CPSALLOC'#9'10'#9'Saldo (MN)'#9'F');
  dbgEst6.Selected.Add('CPMTOEXT'#9'10'#9'Monto~Original(ME)'#9'F');
  dbgEst6.Selected.Add('CPPAGEXT'#9'10'#9'Monto~Aplicado(ME)'#9'F');
  dbgEst6.Selected.Add('CPSALEXT'#9'10'#9'Saldo (ME)'#9'F');
  dbgEst6.RedrawGrid;

  DMCXP.cdsQry6.Close;
  dbgEst6.DataSource := DMCXP.dsQRY6;
  DMCXP.cdsQry6.DataRequest(xSQL);
  DMCXP.cdsQry6.Open;

  //QUERY DE NO PROVISIONADOS  DMCXP.cdsQry16
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     xSQL:='SELECT A.CPSERIE, A.CPNODOC, A.CPNOREG, A.CPFEMIS, A.CPFVCMTO, J.TMONABR, T.DOCABR, '
          +  'CASE WHEN A.TMONID='+quotedstr(DMCXP.wTMonLoc)+' THEN A.DEMTOORI ELSE 0 END MONTOMN, '
          +  'CASE WHEN A.TMONID='+quotedstr(DMCXP.wTMonExt)+' THEN A.DEMTOORI ELSE 0 END MONTOME '
          +'FROM CAJA302 H, CAJA301 A, TGE103 J, TGE110 T '
          +'WHERE H.EC_PROCE=''1'' AND H.ECESTADO=''C'' '
          +  'AND A.DOCID2 IN ( SELECT B.DOCID FROM TGE110 B '
          +                    'WHERE B.DOCMOD=''CXP'' AND B.DOC_FREG=''P'' '
          +                      'AND B.TDIARID=( SELECT C.TDIARID FROM TGE104 C '
          +                                      'WHERE C.TDIARID=B.TDIARID '
          +                                        'AND C.REGISTRO=''C'' ) '
          +                  ') ';
     xSQL:=xSQL+xSQLCajaNoProv
          + ' AND A.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text)+' '
          + ' AND A.CIAID=H.CIAID AND A.TDIARID=H.TDIARID AND A.ECANOMM=H.ECANOMM '
          + ' AND A.ECNOCOMP=H.ECNOCOMP AND J.TMONID=A.TMONID AND A.DOCID2=T.DOCID AND T.DOCMOD=''CXP''';
  end;
  if (SRV_D = 'ORACLE') then
  begin
     xSQL:='SELECT A.CPSERIE, A.CPNODOC, A.CPNOREG, A.CPFEMIS, A.CPFVCMTO, J.TMONABR, T.DOCABR, '
          +  'CASE WHEN A.TMONID='+quotedstr(DMCXP.wTMonLoc)+' THEN A.DEMTOORI ELSE 0 END MONTOMN, '
          +  'CASE WHEN A.TMONID='+quotedstr(DMCXP.wTMonExt)+' THEN A.DEMTOORI ELSE 0 END MONTOME '
          +'FROM CAJA302 H, CAJA301 A, TGE103 J, TGE110 T '
          +'WHERE H.EC_PROCE=''1'' AND H.ECESTADO=''C'' '
          +  'AND A.DOCID2 IN ( SELECT B.DOCID FROM TGE110 B '
          +                    'WHERE B.DOCMOD=''CXP'' AND B.DOC_FREG=''P'' '
          +                      'AND B.TDIARID=( SELECT C.TDIARID FROM TGE104 C '
          +                                      'WHERE C.TDIARID=B.TDIARID '
          +                                        'AND C.REGISTRO=''C'' ) '
          +                  ') ';
     xSQL:=xSQL+xSQLCajaNoProv
          + ' AND A.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text)+' '
          + ' AND A.CIAID=H.CIAID AND A.TDIARID=H.TDIARID AND A.ECANOMM=H.ECANOMM '
          + ' AND A.ECNOCOMP=H.ECNOCOMP AND J.TMONID=A.TMONID AND A.DOCID2=T.DOCID AND T.DOCMOD=''CXP''';
  end;

  dbgNProv.Selected.Clear;
  dbgNProv.Selected.Add('DOCABR'#9'10'#9'Doc.'#9'F');
  dbgNProv.Selected.Add('CPSERIE'#9'4'#9'Serie'#9'F');
  dbgNProv.Selected.Add('CPNODOC'#9'10'#9'Número'#9'F');
  dbgNProv.Selected.Add('CPNOREG'#9'10'#9'Nº~Reg.'#9'F');
  dbgNProv.Selected.Add('CPFEMIS'#9'10'#9'Fecha~Emisión.'#9'F');
  dbgNProv.Selected.Add('CPFVCMTO'#9'10'#9'Fecha de~Vencimiento'#9'F' );
  dbgNProv.Selected.Add('TMONABR'#9'3'#9'Tipo~Moneda'#9'F');
  dbgNProv.Selected.Add('MONTOMN'#9'10'#9'Monto~MN'#9'F');
  dbgNProv.Selected.Add('MONTOME'#9'10'#9'Monto~ME'#9'F');
  dbgNProv.RedrawGrid;

  DMCXP.cdsQry16.Close;
//  dbgEst6.DataSource := DMCXP.dsQry16;
  dbgNProv.DataSource := DMCXP.dsQry16;
  DMCXP.cdsQry16.DataRequest(xSQL);
  DMCXP.cdsQry16.Open;

  ProcessSaldo(DMCXP.cdsQRY2);
  ProcessSaldo(DMCXP.cdsQRY4);

  cGRID(dbgEst2);

  cFormat(DMCXP.cdsQRY2);
  cFormat(DMCXP.cdsQRY4);

  cFooterTodos(dbgTodos, DMCXP.cdsReporte);
  cFooterletras(dbgEst3, DMCXP.cdsQry4);
  cFooterProvis(dbgEst2, DMCXP.cdsQRY2);
  cFooterNCredito(dbgEst6, DMCXP.cdsQRY6);
  cFooter(dbgEst3, DMCXP.cdsQRY4);
  cFooterNProv(dbgNProv, DMCXP.cdsQry16);

  Totales;
  Screen.Cursor:=crDefault;
end;

procedure TFEstCxCPro.AceptarParcial;
var
  c,xSQL,xSQLAdendo,xSQLLetra,xSQLNCredito,xSQLCheque,xSQLCheque1,xSQLChequeCXC301,xSQLAnticipo, xSQLCajaNoProv : String;
  xCondicion ,sConDoc,
  xCondicionLetras : string ;
  xSQLFinal,xLetras  : String ;
  sConAdendo,sConNCreditos,sNCredito,sConChequesCXC301,sConLetras,sConCheques,sConCheques1,sConAnticipos,sWhere,sCheque,sAnticipo, sConNoProvisio : string;
begin
  Screen.Cursor:=crHourGlass;
  if dtpINI.Date > dtpFIN.Date then
  begin
  	Application.MessageBox('La fecha inicial no debe ser mayor que la fecha final',
    'Error en fechas', MB_ICONERROR+MB_OK);
    dtpINI.SetFocus;
    Exit;
  end;


  sNCredito:= FiltraDoc( 'N' );
  xLetras  := DMCXP.displaydescrip2('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''L''','DOCID');
  sCheque  := DMCXP.displaydescrip2('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''9''','DOCID');
  sAnticipo:= DMCXP.displaydescrip2('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''NC''','DOCID'); // JORGE

  if StrToFloat(dbeTCAMB.Text) <= 0 then
     stcam := '1'
  else
     stcam := dbeTCAMB.Text;

  xSQL := '';
  xSQLLetra:='';
  xSQLAdendo:='';
  sConAdendo:='';
  sConLetras:='';
  sConCheques:='';
  sConCheques1:='';
  xSQLCajaNoProv:='';
  sConChequesCXC301:='';
  sConAnticipos:='';
  sConNCreditos:='';

  case rgEST.ItemIndex of
    0 : begin //TODOS
         //** 25/10/2002 - PJSV
        sConDoc:=' AND ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') <>''XX'' '
                + 'AND '+DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''I'' '
                + 'AND '+DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''E'' AND '
                + DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''A'')';

        sConLetras:=' AND ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') <>''XX'' AND '
                   +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''I'' AND '
                   +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''E'' AND '
                   +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''A'')';

        sConCheques	 := '';
        sConCheques1	 := '';
        sConNoProvisio	 := '';
        sConChequesCXC301:= '';
        sConAnticipos	 :=' AND ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') <>''XX'' AND '
                          +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''I'' AND '
                          +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''E'' AND '
                          +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''A'')';

         sConNCreditos:=' AND ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') <>''XX'' AND '
                       +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''I'' AND '
                       +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''E'' AND '
                       +DMCXP.wReplacCeros+'(CPESTADO,''XX'') <> ''A'')';
          //**
        end;
    1 : begin //PENDIENTES
         sConDoc	  := ' AND CPESTADO=''P'' ';
         sConLetras 	  := ' AND CPESTADO=''P'' ';
         sConCheques	  := ' AND (CAJA.CHQ_ESTADO=''PEND.COB'' OR CAJA.CHQ_ESTADO IS NULL)';
         sConCheques1	  := ' AND (A.CHQ_ESTADO=''PEND.COB'' OR A.CHQ_ESTADO IS NULL)';
         sConChequesCXC301:= ' AND CPESTADO=''P'' ';
         sConNoProvisio	  := ' AND 1=1';
         sConAnticipos	  := ' AND CPESTADO=''P'' ';
         sConNCreditos	  := ' AND CPESTADO=''P'' ';
       end;
    2: begin //CANCELADOS
         sConDoc	   := ' AND CPESTADO=''C'' ';
         sConLetras 	   := ' AND CPESTADO=''C'' ';
         sConCheques	   := ' AND (CAJA.CHQ_ESTADO=''COBRADO'')';
         sConCheques1	   := ' AND (A.CHQ_ESTADO=''COBRADO'')';
         sConNoProvisio    := '';
         sConChequesCXC301 := ' AND CPESTADO=''C'' ';
         sConAnticipos	   := ' AND CPESTADO=''C'' ';
         sConNCreditos	   := ' AND CPESTADO=''C'' ';
       end;
    3: begin // PENDIENTES DE ACEPTACION
         //** 25/10/2002 - PJSV
         sConDoc	   := ' AND (('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') =''XX'') OR ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') = ''I''))';
         sConLetras 	   := ' AND (('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') =''XX'') OR ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') = ''I''))';
         sConCheques	   := ' AND (CAJA.CHQ_ESTADO=''XX'')';
         sConCheques1	   := ' AND (A.CHQ_ESTADO=''XX'')';
         sConChequesCXC301:='';
         sConNoProvisio   := ' AND 1<>1';
         sConAnticipos	   := ' AND (('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') = ''XX'') OR ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') = ''I''))';
         sConNCreditos	   := ' AND (('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') = ''XX'') OR ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') = ''I''))';
         //**
       end;
  end;
  sConAdendo:= ' AND (('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') =''XX'') OR ('+DMCXP.wReplacCeros+'(CPESTADO,''XX'') = ''I''))';

  xSQL 		  := xSQL        +' AND (CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) '+sConDoc;
  xSQLLetra 	  := xSQLLetra   +' AND (CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) '+sConLetras;
  xSQLAdendo 	  := xSQLAdendo  +' AND (CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) '+sConAdendo;
  xSQLCheque 	  := xSQLCheque  +' AND CAJA.FC_FEMIS < CAJA.FC_FVCMTO '+sConCheques;  //' AND (CAJA.CHQ_FECEMI<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) '+sConCheques;
  xSQLCheque1 	  := xSQLCheque1 +' AND A.CHQ_FECEMI < A.CHQ_FECVCM '+sConCheques1;
  xSQLCajaNoProv  := xSQLCajaNoProv+' AND (A.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) '+sConNoProvisio; //AND A.CPFEMIS>='01/01/2003' AND A.CPFEMIS<='03/02/2003'
  xSQLChequeCXC301:= xSQLChequeCXC301 +sConChequesCXC301; //+ ' AND (CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) '

  xSQLAnticipo := xSQLAnticipo + ' AND (CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) '+sConAnticipos;
  xSQLNCredito := xSQLNCredito + ' AND (CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) '+sConNCreditos;

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     xSQL 	     := ' WHERE CXP.PROV=''' +Cliente+''''+xSQL;
     xSQLLetra 	     := ' WHERE CXP.PROV=''' +Cliente+''''+xSQLLetra;
     xSQLAdendo      := ' WHERE CXP.PROV=''' +Cliente+''''+xSQLAdendo;
     xSQLCheque      := ' WHERE CAJA.PROV='''+Cliente+''''+xSQLCheque;
     xSQLCajaNoProv  := ' AND A.PROV='''+Cliente+''''+xSQLCajaNoProv;
     xSQLCheque1     := ' WHERE A.PROV='''   +Cliente+''''+xSQLCheque1;
     xSQLChequeCXC301:= ' WHERE CXP.PROV=''' +Cliente+''''+xSQLChequeCXC301;
     xSQLAnticipo    := ' WHERE CXP.PROV=''' +Cliente+''''+xSQLAnticipo;
     xSQLNCredito    := ' WHERE CXP.PROV=''' +Cliente+''''+xSQLNCredito;
  end
  else
  if (SRV_D = 'ORACLE') then
  begin
     xSQL 	     := ' AND CXP.PROV=''' +Cliente+''''+xSQL;
     xSQLLetra 	     := ' AND CXP.PROV=''' +Cliente+''''+xSQLLetra;
     xSQLAdendo      := ' AND CXP.PROV=''' +Cliente+''''+xSQLAdendo;
     xSQLCheque      := ' AND CAJA.PROV='''+Cliente+''''+xSQLCheque;
     xSQLCajaNoProv  := ' AND A.PROV='''+Cliente+''''+xSQLCajaNoProv;
     xSQLCheque1     := ' AND A.PROV='''		+Cliente+''''+xSQLCheque1;
     xSQLChequeCXC301:= ' AND CXP.PROV=''' +Cliente+''''+xSQLChequeCXC301;
     xSQLAnticipo    := ' AND CXP.PROV=''' +Cliente+''''+xSQLAnticipo;
     xSQLNCredito    := ' AND CXP.PROV=''' +Cliente+''''+xSQLNCredito;
  end;

  ////////////////////////////////////// TODOS //////////////////////////
  cSQLTodos;
  xSQLFinal:= sSQLTodos + xSQL + ' AND CXP.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text);
  dbgTodos.DataSource := DMCXP.dsReporte;
  DMCXP.cdsReporte.Close;
  DMCXP.cdsReporte.DataRequest ( xSQLFinal );
  DMCXP.cdsReporte.Open;

  DMCXP.cdsReporte.IndexFieldNames:='CIAID;DOCID;CPSERIE;CPNODOC';

  TNumericField(DMCXP.cdsReporte.FieldByName('MTOLOC')).DisplayFormat :='###,###,##0.00';
  TNumericField(DMCXP.cdsReporte.FieldByName('PAGLOC')).DisplayFormat :='###,###,##0.00';
  TNumericField(DMCXP.cdsReporte.FieldByName('SALLOC')).DisplayFormat :='###,###,##0.00';
  TNumericField(DMCXP.cdsReporte.FieldByName('MTOEXT')).DisplayFormat :='###,###,##0.00';
  TNumericField(DMCXP.cdsReporte.FieldByName('PAGEXT')).DisplayFormat :='###,###,##0.00';
  TNumericField(DMCXP.cdsReporte.FieldByName('SALEXT')).DisplayFormat :='###,###,##0.00';

  dbgTodos.Selected.Clear;
  dbgTodos.Selected.Add('POS'#9'3'#9'Pos'#9'F');
  dbgTodos.Selected.Add('DOCABR'#9'6'#9'Doc.'#9'F');
  dbgTodos.Selected.Add('CPSERIE'#9'4'#9'Serie'#9'F');
  dbgTodos.Selected.Add('CPNODOC'#9'11'#9'Número'#9'F');
  dbgTodos.Selected.Add('CPNOREG'#9'10'#9'Nº~Reg.'#9'F');
  dbgTodos.Selected.Add('CPFEMIS'#9'10'#9'Fecha~Emisión.'#9'F');
  dbgTodos.Selected.Add('CPFVCMTO'#9'10'#9'Fecha~Vencimiento.'#9'F');
  dbgTodos.Selected.Add('TMONABR'#9'4'#9'Moneda.'#9'F');
  dbgTodos.Selected.Add('MTOLOC'#9'12'#9'Cargo~MN'#9'F');
  dbgTodos.Selected.Add('PAGLOC'#9'12'#9'Abono~MN'#9'F');
  dbgTodos.Selected.Add('SALLOC'#9'12'#9'Saldo~MN'#9'F');
  dbgTodos.Selected.Add('MTOEXT'#9'12'#9'Cargo~ME'#9'F');
  dbgTodos.Selected.Add('PAGEXT'#9'12'#9'Abono~ME'#9'F');
  dbgTodos.Selected.Add('SALEXT'#9'12'#9'Saldo~ME'#9'F');
  dbgTodos.RedrawGrid;

  DMCXP.cdsReporte.DisableControls;
  DMCXP.cdsReporte.First;
  while not DMCXP.cdsReporte.EOF do
  begin
     DMCXP.cdsReporte.Edit;
     DMCXP.cdsReporte.FieldByName('POS').AsString:=IntToStr(DMCXP.cdsReporte.RecNo);
     DMCXP.cdsReporte.Post;
     DMCXP.cdsReporte.Next;
  end;
  DMCXP.cdsReporte.EnableControls;

  ////////////////////////////////// DOCUMENTOS /////////////////////////////////
  cSQLDocs;
  xSQLFinal := sSQLDocs + xSQL +' AND CXP.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text) +
																' AND (CLI.PROV=CXP.PROV AND CLI.CLAUXID=CXP.CLAUXID)' ;
  dbgEst2.DataSource := DMCXP.dsQRY2;
  DMCXP.cdsQRY2.Close;
  DMCXP.cdsQRY2.ProviderName := 'dspTGE'  ;
  DMCXP.cdsQRY2.DataRequest ( xSQLFinal ) ;
  cGRID(dbgEst2);
  DMCXP.cdsQRY2.Open;

  //////////////////////////// LETRAS //////////////////////////////////
  cSQLLetras;
  xSQLFinal := sSQLLetras + xSQLLetra + ' AND CXP.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text) +
	     ' AND (CLI.PROV=CXP.PROV AND CLI.CLAUXID=CXP.CLAUXID)'+
	     ' AND CXP.DOCID='+quotedstr(xLetras);
  DMCXP.cdsQRY4.Close;
  DMCXP.cdsQRY4.ProviderName := 'dspTGE';
  DMCXP.cdsQRY4.DataRequest ( xSQLFinal );
  cGRID(dbgEst3);
  DMCXP.cdsQRY4.Open;
                                                 //YA
  dbgEst3.DataSource := DMCXP.dsQRY4;

  xSQLFinal := sSQLLetras + xSQLAdendo +' AND CXP.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text) +
	    ' AND (CLI.PROV=CXP.PROV AND CLI.CLAUXID=CXP.CLAUXID)'+
	    ' AND CXP.DOCID='+quotedstr(xLetras);
  DMCXP.cdsQRY11.Close;
  DMCXP.cdsQRY11.ProviderName := 'dspTGE';
  DMCXP.cdsQRY11.DataRequest ( xSQLFinal );
  DMCXP.cdsQRY11.Open;
  if rgEST.ItemIndex=3 then
     DMCXP.cdsQry11.EmptyDataSet;

  //QUERY DE NOTAS DE CREDITO    DMCXP.cdsQry6
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     xSQL:='SELECT CXP.CIAID, CXP.DOCID, PROV, PROVDES, PROVRUC, CXP.CPSERIE, CPNODOC, CPNOREG, '
          +  'CXP.CPFEMIS, CXP.CPFVCMTO, CXP.TMONID, '
          +  'TGE103.TMONDES, TGE103.TMONABR, TGE103.TMON_LOC, '
          +  'CXP.CPMTOORI, CXP.CPPAGORI, CXP.CPSALORI, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CPMTOLOC ELSE 0 END CPMTOLOC, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CPSALLOC ELSE 0 END CPSALLOC, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE CPMTOEXT END CPMTOEXT, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE CPSALEXT END CPSALEXT, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE CPPAGEXT END CPPAGEXT, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CPPAGLOC ELSE 0 END CPPAGLOC, '
          +  'CXP.BANCOID, TGE105.BANCONOM, DOC.DOCABR '
          +'FROM CXP301 CXP '
          +    'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD=''CXP'') '
          +    'LEFT JOIN TGE103 ON TGE103.TMONID=CXP.TMONID '
          +    'LEFT JOIN TGE105 ON CXP.BANCOID=TGE105.BANCOID '+xSQLNCredito+sConNCreditos+' '
          +                'AND CXP.DOCID IN ( '+sNCredito+' ) '
          +                'AND CXP.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text);
  end;
  if (SRV_D = 'ORACLE') then
  begin
     xSQL:='SELECT CXP.CIAID, CXP.DOCID, PROV, PROVDES, PROVRUC, CXP.CPSERIE, CPNODOC, CPNOREG, '
          +  'CXP.CPFEMIS, CXP.CPFVCMTO, CXP.TMONID, '
          +  'TGE103.TMONDES, TGE103.TMONABR, TGE103.TMON_LOC, '
          +  'CXP.CPMTOORI, CXP.CPPAGORI, CXP.CPSALORI, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CPMTOLOC ELSE 0 END CPMTOLOC, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CPSALLOC ELSE 0 END CPSALLOC, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE CPMTOEXT END CPMTOEXT, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE CPSALEXT END CPSALEXT, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE CPPAGEXT END CPPAGEXT, '
          +  'CASE WHEN CXP.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CPPAGLOC ELSE 0 END CPPAGLOC, '
          +  'CXP.BANCOID, TGE105.BANCONOM, DOC.DOCABR '
          +'FROM CXP301 CXP, TGE110 DOC, TGE103, TGE105 '
          +'WHERE ( CXP.DOCID=DOC.DOCID(+) AND DOC.DOCMOD(+)=''CXP'' ) '
          +  'AND TGE103.TMONID(+)=CXP.TMONID '
          +  'AND CXP.BANCOID=TGE105.BANCOID(+) '+xSQLNCredito+sConNCreditos+' '
          +  'AND CXP.DOCID IN ( '+sNCredito+' ) '
          +  'AND CXP.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text);
  end;    //AND CXP.CPPAGORI<=0

  dbgEst6.Selected.Clear;
  dbgEst6.Selected.Add('CPSERIE'#9'4'#9'Serie'#9'F');
  dbgEst6.Selected.Add('CPNODOC'#9'10'#9'Número'#9'F');
  dbgEst6.Selected.Add('CPNOREG'#9'10'#9'Nº~Reg.'#9'F');
  dbgEst6.Selected.Add('CPFEMIS'#9'10'#9'Fecha~Emisión.'#9'F');
  dbgEst6.Selected.Add('CPFVCMTO'#9'10'#9'Fecha de~Vencimiento'#9'F' );
  dbgEst6.Selected.Add('TMONABR'#9'4'#9'T.M.'#9'F' );
  dbgEst6.Selected.Add('CPMTOLOC'#9'12'#9'Monto~N/Cred.~MN'#9'F');
  dbgEst6.Selected.Add('CPPAGLOC'#9'12'#9'Monto~Aplicado~MN'#9'F');
  dbgEst6.Selected.Add('CPSALLOC'#9'12'#9'Saldo~MN'#9'F');
  dbgEst6.Selected.Add('CPMTOEXT'#9'12'#9'Monto~N/Cred.~ME'#9'F');
  dbgEst6.Selected.Add('CPPAGEXT'#9'12'#9'Monto~AplicadoME'#9'F');
  dbgEst6.Selected.Add('CPSALEXT'#9'12'#9'Saldo~ME'#9'F');
  dbgEst6.RedrawGrid;

  DMCXP.cdsQry6.Close;
  dbgEst6.DataSource := DMCXP.dsQRY6;
  DMCXP.cdsQry6.DataRequest(xSQL);
  DMCXP.cdsQry6.Open;

  //QUERY DE NO PROVISIONADOS  DMCXP.cdsQry16
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     //	xSQL:='SELECT H.*, A.*, J.TMONABR, T.DOCABR, '+
     xSQL:='SELECT A.CPSERIE, A.CPNODOC, A.CPNOREG, A.CPFEMIS, A.CPFVCMTO, J.TMONABR, T.DOCABR, '
          +  'CASE WHEN A.TMONID='+quotedstr(DMCXP.wTMonLoc)+' THEN A.DEMTOORI ELSE 0 END MONTOMN, '
          +  'CASE WHEN A.TMONID='+quotedstr(DMCXP.wTMonExt)+' THEN A.DEMTOORI ELSE 0 END MONTOME '
          +'FROM CAJA302 H, CAJA301 A, TGE103 J, TGE110 T '
          +'WHERE H.EC_PROCE=''1'' AND H.ECESTADO=''C'' '
          +  'AND A.DOCID2 IN ( '
          +                     'SELECT B.DOCID FROM TGE110 B '
          +                     'WHERE B.DOCMOD=''CXP'' AND B.DOC_FREG=''P'' '
          +                       'AND B.TDIARID=( '
          +                                        'SELECT C.TDIARID FROM TGE104 C '
          +                                        'WHERE C.TDIARID=B.TDIARID '
          +                                          'AND C.REGISTRO=''C'' ) '
          +                  ' ) ';

     xSQL:=xSQL + xSQLCajaNoProv
          +  'AND A.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text)+' '
          +  'AND A.CIAID=H.CIAID AND A.TDIARID=H.TDIARID '
          +  'AND A.ECANOMM=H.ECANOMM AND A.ECNOCOMP=H.ECNOCOMP '
          +  'AND J.TMONID=A.TMONID AND A.DOCID2=T.DOCID AND T.DOCMOD=''CXP''';
  end;
  if (SRV_D = 'ORACLE') then
  begin
     xSQL:='SELECT A.CPSERIE, A.CPNODOC, A.CPNOREG, A.CPFEMIS, A.CPFVCMTO, J.TMONABR, T.DOCABR, '
          +  'CASE WHEN A.TMONID='+quotedstr(DMCXP.wTMonLoc)+' THEN A.DEMTOORI ELSE 0 END MONTOMN, '
          +  'CASE WHEN A.TMONID='+quotedstr(DMCXP.wTMonExt)+' THEN A.DEMTOORI ELSE 0 END MONTOME '
          +'FROM CAJA302 H, CAJA301 A, TGE103 J, TGE110 T '
          +'WHERE H.EC_PROCE=''1'' AND H.ECESTADO=''C'' '
          +  'AND A.DOCID2 IN ( '
          +                     'SELECT B.DOCID FROM TGE110 B '
          +                     'WHERE B.DOCMOD=''CXP'' AND B.DOC_FREG=''P'' '
          +                       'AND B.TDIARID=( '
          +                                        'SELECT C.TDIARID FROM TGE104 C '
          +                                        'WHERE C.TDIARID=B.TDIARID '
          +                                          'AND C.REGISTRO=''C'' ) '
          +                  ' ) ';

     xSQL:=xSQL + xSQLCajaNoProv
          +  'AND A.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text)+' '
          +  'AND A.CIAID=H.CIAID AND A.TDIARID=H.TDIARID '
          +  'AND A.ECANOMM=H.ECANOMM AND A.ECNOCOMP=H.ECNOCOMP '
          +  'AND J.TMONID=A.TMONID AND A.DOCID2=T.DOCID AND T.DOCMOD=''CXP''';
  end;

  dbgNProv.Selected.Clear;
  dbgNProv.Selected.Add('DOCABR'#9'10'#9'Doc.'#9'F');
  dbgNProv.Selected.Add('CPSERIE'#9'4'#9'Serie'#9'F');
  dbgNProv.Selected.Add('CPNODOC'#9'10'#9'Número'#9'F');
  dbgNProv.Selected.Add('CPNOREG'#9'12'#9'Nº~Reg.'#9'F');
  dbgNProv.Selected.Add('CPFEMIS'#9'10'#9'Fecha~Emisión.'#9'F');
  dbgNProv.Selected.Add('CPFVCMTO'#9'10'#9'Fecha de~Vencimiento'#9'F' );
  dbgNProv.Selected.Add('TMONABR'#9'3'#9'Tipo~Moneda'#9'F');
  dbgNProv.Selected.Add('MONTOMN'#9'12'#9'Monto~MN'#9'F');
  dbgNProv.Selected.Add('MONTOME'#9'12'#9'Monto~ME'#9'F');
  dbgNProv.RedrawGrid;

  DMCXP.cdsQry16.Close;
  dbgNProv.DataSource := DMCXP.dsQry16;
  DMCXP.cdsQry16.DataRequest(xSQL);
  DMCXP.cdsQry16.Open;

  ProcessSaldo(DMCXP.cdsQRY2);
  ProcessSaldo(DMCXP.cdsQRY4);

  cFormat(DMCXP.cdsQRY2);
  cFormat(DMCXP.cdsQRY4);

  cFooterTodos(dbgTodos, DMCXP.cdsReporte);
  //cFooter(dbgEst2, DMCXP.cdsQRY2);
  cFooterletras(dbgEst3, DMCXP.cdsQry4);
  cFooterProvis(dbgEst2, DMCXP.cdsQRY2);
  cFooterNCredito(dbgEst6, DMCXP.cdsQRY6);
  cFooter(dbgEst3, DMCXP.cdsQRY4);
  cFooterNProv(dbgNProv, DMCXP.cdsQry16);

  Totales;
	Screen.Cursor:=crDefault;
end;


procedure TFEstCxCPro.Z2bbtnOtrosClick(Sender: TObject);
var sGrupo,sSQL:string;
begin
  DMCXP.cdsQry6.IndexFieldNames:='';
  sGrupo:=DMCXP.displaydescrip2('dspTGE','TGE204','GRUPOID','CLIEID='+QuotedStr(dblcProv.text),'GRUPOID');
  sSQL:='SELECT CLIEID,CLIERUC,CLIEDES FROM TGE204 WHERE GRUPOID='+QuotedStr(sGrupo)+
        ' and CLIEID<>'+QuotedStr(dblcProv.text);
  DMCXP.cdsQry.close;
  DMCXP.cdsQry.DataRequest(sSQL);
  DMCXP.cdsQry.OPen;
  if DMCXP.cdsQry.RecordCount=0 then
  begin
    ShowMessage('No hay otros Clientes');
    exit;
  end;
 dbgClientes.DataSource:=DMCXP.dsQry;
 dbgClientes.Selected.Clear;
 dbgClientes.Selected.Add('CLIEID'#9'11'#9'Id');
 dbgClientes.Selected.Add('CLIERUC'#9'11'#9'RUC');
 dbgClientes.Selected.Add('CLIEDES'#9'40'#9'Nombres');
 dbgClientes.RedrawGrid;

 pnlClientes.Visible:=True;
end;

procedure TFEstCxCPro.bbtnCierra1Click(Sender: TObject);
begin
  dbgClientes.DataSource:=NIL;
  pnlClientes.Visible:=False;
end;

procedure TFEstCxCPro.CanLetraClick(Sender: TObject);
begin
	xPopup := '2';
 	pnlHist.Caption := 'Cancelaciones de Letras';
 	bbtnImprimeAmortiza.visible:=True;
 	CargaDetalle(' AND B.DOC_FREG='+quotedstr('L'));
end;

procedure TFEstCxCPro.CargaDetalle(xDocumentos: String);
var
	C : String;
begin
	Screen.Cursor := crHourGlass;
  // PAGOS DE LETRAS
	if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
	begin
		c :='SELECT '+
				'A.CIAID, A.PROV, A.DOCID, A.CPSERIE, A.CPNODOC, A.TCANJEID, A.DOCID2, A.CPSERIE2, A.CPNODOC2, A.TMONID, A.CCPCANJE, '+
				'CASE WHEN A.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE A.DCDMOEXT END DCPMTOEXT, '+
				'CASE WHEN A.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN A.DCDMOLOC ELSE 0 END DCPMTOLOC, '+
				'A.DCDMOEXT CPMTOEXT, '+
				'A.DCDMOLOC CPMTOLOC, '+
				'A.DCDMOORI, A.CCPFCJE, '+
				'B.DOCABR, C.DOCABR DOCABR2, E.TMONDES, E.TMONABR, E.TMON_LOC '+
				'FROM CXP305 A '+
				'LEFT JOIN TGE103 E ON (E.TMONID=A.TMONID) '+
				'LEFT JOIN TGE110 C ON C.DOCID=A.DOCID2 AND C.DOCMOD=''CXP'' '+
				'INNER JOIN TGE110 B ON B.DOCID=A.DOCID AND B.DOCMOD=''CXP'' '+xDocumentos+' ';
		if (xPopup = '1') or (xPopup = '2') then			// 2 Letras
    begin
    	lblDocumento.caption:=dbgEst3.DataSource.DataSet.FieldByName('DOCABR').AsString+' '+
                            dbgEst3.DataSource.DataSet.FieldByName('CPSERIE').AsString+' '+
                            dbgEst3.DataSource.DataSet.FieldByName('CPNODOC').AsString+' '+
                            'MONTO ORIGINAL: '+
                            dbgEst3.DataSource.DataSet.FieldByName('TMONABR').AsString+' '+
                            floattostrf(dbgEst3.DataSource.DataSet.FieldByName('CPMTOORI').AsFloat, ffNumber, 15, 2);

      c := c +'WHERE A.CIAID='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CIAID').AsString)+' '+
              'AND A.DOCID='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('DOCID').AsString)+' '+
              'AND A.CPSERIE='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPSERIE').AsString)+' '+
              'AND A.CPNODOC='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPNODOC').AsString)+' '+
              'AND A.CPNOREG='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPNOREG').AsString)+' '+
			        'AND A.PROV='+QuotedStr(dblcProv.text);
      sDoc   :=dbgEst3.DataSource.DataSet.FieldByName('DOCID').AsString;
      sDocAbr:=dbgEst3.DataSource.DataSet.FieldByName('DOCABR').AsString;
      sSerie :=dbgEst3.DataSource.DataSet.FieldByName('CPSERIE').AsString;
      sNoDoc :=dbgEst3.DataSource.DataSet.FieldByName('CPNODOC').AsString;
      sMon   :=dbgEst3.DataSource.DataSet.FieldByName('TMONABR').AsString;
      if dbgEst3.DataSource.DataSet.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
      begin
      	fImp := dbgEst3.DataSource.DataSet.FieldByName('MTOLOC').AsFloat;
        fSal := dbgEst3.DataSource.DataSet.FieldByName('SALLOC').AsFloat;
      end
      else
      begin
      	fImp   :=dbgEst3.DataSource.DataSet.FieldByName('MTOEXT').AsFloat;
        fSal   :=dbgEst3.DataSource.DataSet.FieldByName('SALEXT').AsFloat;
      end;
    end
    else
    if (xPopup = '3') then	// Provision
    begin
    	lblDocumento.caption:=dbgEst2.DataSource.DataSet.FieldByName('DOCABR').AsString+' '+
                            dbgEst2.DataSource.DataSet.FieldByName('CPSERIE').AsString+' '+
                            dbgEst2.DataSource.DataSet.FieldByName('CPNODOC').AsString+' '+
                            'MONTO ORIGINAL: '+
                            dbgEst2.DataSource.DataSet.FieldByName('TMONABR').AsString+' '+
                            floattostrf(dbgEst2.DataSource.DataSet.FieldByName('CPMTOORI').AsFloat, ffNumber, 15, 2);
      c := c +'WHERE A.CIAID='+QuotedStr(dbgEst2.DataSource.DataSet.FieldByName('CIAID').AsString)+' '+
              'AND A.DOCID='+QuotedStr(dbgEst2.DataSource.DataSet.FieldByName('DOCID').AsString)+' '+
              'AND A.CPSERIE='+QuotedStr(dbgEst2.DataSource.DataSet.FieldByName('CPSERIE').AsString)+' '+
              'AND A.CPNODOC='+QuotedStr(dbgEst2.DataSource.DataSet.FieldByName('CPNODOC').AsString)+' '+
              'AND A.CPNOREG='+QuotedStr(dbgEst2.DataSource.DataSet.FieldByName('CPNOREG').AsString)+' '+
			        'AND A.PROV='+QuotedStr(dblcProv.text);
      sDoc   :=dbgEst2.DataSource.DataSet.FieldByName('DOCID').AsString;
      sDocAbr:=dbgEst2.DataSource.DataSet.FieldByName('DOCABR').AsString;
      sSerie :=dbgEst2.DataSource.DataSet.FieldByName('CPSERIE').AsString;
      sNoDoc :=dbgEst2.DataSource.DataSet.FieldByName('CPNODOC').AsString;
      sMon   :=dbgEst2.DataSource.DataSet.FieldByName('TMONABR').AsString;
      if dbgEst2.DataSource.DataSet.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
      begin
      	fImp   :=dbgEst2.DataSource.DataSet.FieldByName('MTOLOC').AsFloat;
        fSal   :=dbgEst2.DataSource.DataSet.FieldByName('SALLOC').AsFloat;
      end
      else
      begin
      	fImp   :=dbgEst2.DataSource.DataSet.FieldByName('MTOEXT').AsFloat;
        fSal   :=dbgEst2.DataSource.DataSet.FieldByName('SALEXT').AsFloat;
      end;
    end
    else
    if (xPopup = '6') then		// Nota de Credito
    begin
    	lblDocumento.caption:=dbgEst6.DataSource.DataSet.FieldByName('DOCABR').AsString+' '+
                            dbgEst6.DataSource.DataSet.FieldByName('CPSERIE').AsString+' '+
                            dbgEst6.DataSource.DataSet.FieldByName('CPNODOC').AsString+' '+
                            'MONTO ORIGINAL: '+
                            dbgEst6.DataSource.DataSet.FieldByName('TMONABR').AsString+' '+
                            floattostrf(dbgEst6.DataSource.DataSet.FieldByName('CPMTOORI').AsFloat, ffNumber, 15, 2);
      c := c +'WHERE A.CIAID='+QuotedStr(dbgEst6.DataSource.DataSet.FieldByName('CIAID').AsString)+' '+
              'AND A.DOCID='+QuotedStr(dbgEst6.DataSource.DataSet.FieldByName('DOCID').AsString)+' '+
              'AND A.CPSERIE='+QuotedStr(dbgEst6.DataSource.DataSet.FieldByName('CPSERIE').AsString)+' '+
              'AND A.CPNODOC='+QuotedStr(dbgEst6.DataSource.DataSet.FieldByName('CPNODOC').AsString)+' '+
              'AND A.CPNOREG='+QuotedStr(dbgEst6.DataSource.DataSet.FieldByName('CPNOREG').AsString)+' '+
			        'AND A.PROV='+QuotedStr(dblcProv.text);
      sDoc   :=dbgEst6.DataSource.DataSet.FieldByName('DOCID').AsString;
      sDocAbr:=dbgEst6.DataSource.DataSet.FieldByName('DOCABR').AsString;
      sSerie :=dbgEst6.DataSource.DataSet.FieldByName('CPSERIE').AsString;
      sNoDoc :=dbgEst6.DataSource.DataSet.FieldByName('CPNODOC').AsString;
      sMon   :=dbgEst6.DataSource.DataSet.FieldByName('TMONABR').AsString;
      if dbgEst6.DataSource.DataSet.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
      begin
      	fImp   :=dbgEst6.DataSource.DataSet.FieldByName('CPMTOLOC').AsFloat;
        fSal   :=dbgEst6.DataSource.DataSet.FieldByName('CPSALLOC').AsFloat;
      end
      else
      begin
      	fImp   :=dbgEst6.DataSource.DataSet.FieldByName('CPMTOEXT').AsFloat;
        fSal   :=dbgEst6.DataSource.DataSet.FieldByName('CPSALEXT').AsFloat;
      end;
    end;
	end
	else
  if (SRV_D = 'ORACLE') then
	begin
  	C :='SELECT '+
			  'A.CIAID, A.PROV, A.DOCID, A.CPSERIE, A.CPNODOC, A.TCANJEID, A.DOCID2, A.CPSERIE2, A.CPNODOC2, A.TMONID, '+
			  'CASE WHEN A.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN 0 ELSE A.DCPMOEXT END DCPMTOEXT, '+
			  'CASE WHEN A.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN A.DCPMOLOC ELSE 0 END DCPMTOLOC, '+
			  'A.DCPMOORI, A.CCPFCJE, '+
			  'B.DOCABR, C.DOCABR DOCABR2, E.TMONDES, E.TMONABR, E.TMON_LOC '+
			  'FROM CXP305 A, TGE103 E, TGE110 C, TGE110 B ';
    if (xPopup = '1') or (xPopup = '2') then
    begin
    	lblDocumento.caption:=dbgEst3.DataSource.DataSet.FieldByName('DOCABR').AsString+' '+
                              dbgEst3.DataSource.DataSet.FieldByName('CPSERIE').AsString+' '+
                              dbgEst3.DataSource.DataSet.FieldByName('CPNODOC').AsString;

      c := c +'WHERE E.TMONID=A.TMONID AND C.DOCID=A.DOCID2 AND C.DOCMOD=''CXP'' '+
              'AND B.DOCID=A.DOCID AND B.DOCMOD = ''CXP'' '+ xDocumentos+' '+
              'AND A.CIAID='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CIAID').AsString)+' '+
              'AND A.DOCID='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('DOCID').AsString)+' '+
              'AND A.CPSERIE='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPSERIE').AsString)+' '+
              'AND A.CPNODOC='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPNODOC').AsString)+' '+
              'AND A.CPNOREG='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPNOREG').AsString)+' '+
              'AND A.PROV='+QuotedStr(dblcProv.text);
    end
    else
    if (xPopup = '3') then
    begin
    	lblDocumento.caption:=dbgEst3.DataSource.DataSet.FieldByName('DOCID').AsString+' '+
                              dbgEst3.DataSource.DataSet.FieldByName('CPSERIE').AsString+' '+
                              dbgEst3.DataSource.DataSet.FieldByName('CPNODOC').AsString;

      c := c +'WHERE E.TMONID=A.TMONID and C.DOCID=A.DOCID2 AND C.DOCMOD=''CXP'''+
              'AND B.DOCID=A.DOCID AND B.DOCMOD = ''CXP'' '+ xDocumentos+
              'AND A.CIAID='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CIAID').AsString)+
              'AND A.DOCID='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('DOCID').AsString)+
              'AND A.CPSERIE='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPSERIE').AsString)+
              'AND A.CPNODOC='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPNODOC').AsString)+
              'AND A.CPNOREG='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPNOREG').AsString)+' '+
              'AND A.PROV='+QuotedStr(dblcProv.text);
    end
    else
    If (xPopup = '4') then
    begin
      c := c +'WHERE E.TMONID=A.TMONID and C.DOCID=A.DOCID2 AND C.DOCMOD=''CXP'''+
              'AND B.DOCID=A.DOCID AND B.DOCMOD = ''CXP'' '+ xDocumentos+
              'AND A.CIAID='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CIAID').AsString)+
              'AND A.DOCID='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('DOCID').AsString)+
              'AND A.CPSERIE='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPSERIE').AsString)+
              'AND A.CPNODOC='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPNODOC').AsString)+
              'AND A.CPNOREG='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPNOREG').AsString)+' '+
              'AND A.PROV='+QuotedStr(dblcProv.text);
    end
    else
    If (xPopup = '5') then
    begin
    	c := c +'WHERE E.TMONID=A.TMONID and C.DOCID=A.DOCID2 AND C.DOCMOD=''CXP'''+
              'AND B.DOCID=A.DOCID AND B.DOCMOD = ''CXP'' '+ xDocumentos+
              'AND A.CIAID='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CIAID').AsString)+
              'AND A.DOCID2='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('DOCID').AsString)+
              'AND A.CPSERIE2='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPSERIE').AsString)+
              'AND A.CPNODOC2='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPNODOC').AsString)+
              'AND A.CPNOREG='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPNOREG').AsString)+' '+
              'AND A.PROV='+QuotedStr(dblcProv.text);
    end
    else
    If (xPopup = '6') then
    begin
    	c := c +'WHERE E.TMONID=A.TMONID and C.DOCID=A.DOCID2 AND C.DOCMOD=''CXP'''+
              'AND B.DOCID=A.DOCID AND B.DOCMOD = ''CXP'' '+ xDocumentos+
              'AND A.CIAID='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CIAID').AsString)+
              'AND A.DOCID2='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('DOCID').AsString)+
              'AND A.CPSERIE2='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPSERIE').AsString)+
              'AND A.CPNODOC2='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPNODOC').AsString)+
              'AND A.CPNOREG='+QuotedStr(dbgEst3.DataSource.DataSet.FieldByName('CPNOREG').AsString)+' '+
              'AND A.PROV='+QuotedStr(dblcProv.text);
  	end;
	end;
  dbgHist.DataSource := NIL;
  dbgHist.Selected.Clear;
  //dbgHist.Selected.Add('CIAID'#9'4'#9'Cia.'#9'F');

  If (xPopup = '5') or (xPopup = '6') then
  begin
    dbgHist.Selected.Add('DOCABR'#9'10'#9'Documento'#9'F');
    dbgHist.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
    dbgHist.Selected.Add('CPNODOC'#9'13'#9'Número~Documento'#9'F');
  end
  else
  begin
    dbgHist.Selected.Add('DOCABR2'#9'10'#9'Documento'#9'F');
    dbgHist.Selected.Add('CPSERIE2'#9'5'#9'Serie'#9'F');
    dbgHist.Selected.Add('CPNODOC2'#9'13'#9'Número~Documento'#9'F');
  end;

  dbgHist.Selected.Add('TCANJEID'#9'5'#9'Canje'#9'F');
  dbgHist.Selected.Add('CCPFCJE'#9'10'#9'Fecha~Canje'#9'F');
  dbgHist.Selected.Add('TMONDES'#9'6'#9'Moneda'#9'F');
  dbgHist.Selected.Add('DCPMTOLOC'#9'9'#9'Importe~(MN)'#9'F');
  dbgHist.Selected.Add('DCPMTOEXT'#9'9'#9'Importe~(ME)'#9'F');
  dbgHist.Selected.Add('CPMTOLOC'#9'9'#9'Importe~Equiv. (MN)'#9'F');
  dbgHist.Selected.Add('CPMTOEXT'#9'9'#9'Importe~Equiv. (ME)'#9'F');

  DMCXP.cdsHLetras.Filter := '';
  DMCXP.cdsHLetras.Filtered := False;
  DMCXP.cdsHLetras.indexfieldnames := '';
  DMCXP.cdsHLetras.Close;

  DMCXP.cdsHLetras.DataRequest(c);
  DMCXP.cdsHLetras.Open;

  if DMCXP.cdsHLetras.RecordCount = 0 then
  begin
  	Screen.Cursor := crDefault;
  	bbtnImprimeAmortiza.visible:=False;    
  	ShowMessage('Error : No Existe información a Mostrar');
  	Exit;
  end;

	if DMCXP.cdsHLetras.IndexFieldNames<>'CIAID;DOCID;CPSERIE;CPNODOC' then
		DMCXP.cdsHLetras.IndexFieldNames:='CIAID;DOCID;CPSERIE;CPNODOC';

  dbgHist.DataSource := DMCXP.dsHLetras;

  dbgHist.ColumnByName('DCPMTOEXT').FooterValue:=floattostrf(OperClientDataSet( DMCXP.cdsHLetras, 'SUM(DCPMTOEXT)', ''),ffNumber, 15, 2);
  dbgHist.ColumnByName('DCPMTOLOC').FooterValue:=floattostrf(OperClientDataSet( DMCXP.cdsHLetras, 'SUM(DCPMTOLOC)', ''),ffNumber, 15, 2);

  TNumericField(DMCXP.cdsHLetras.FieldByName('DCPMTOLOC')).DisplayFormat:='###,###,###,##0.00';
  TNumericField(DMCXP.cdsHLetras.FieldByName('DCPMTOEXT')).DisplayFormat:='###,###,###,##0.00';

  pnlLetras.Height:=263;
  pnlLetras.Left:=42;
  pnlLetras.Top:=266;
  pnlLetras.Width:=726;
  pnlLetras.Visible:=True;
  Screen.Cursor := crDefault;
end;

procedure TFEstCxCPro.CanDocuClick(Sender: TObject);
begin
  xPopup := '3';
  pnlHist.Caption := 'Cancelaciones de Documentos';
  bbtnImprimeAmortiza.visible:=True;
  CargaDetalle(' AND (('+DMCXP.wReplacCeros+'(B.DOCTIPREG,''XX'') <> ''XX'' OR '+DMCXP.wReplacCeros+'(B.DOCTIPREG,''XX'') <> ''CH'') AND B.DOC_FREG = ''P'')');
end;

procedure TFEstCxCPro.CanChDevClick(Sender: TObject);
begin
  xPopup := '4';
  pnlHist.Caption := 'Cancelaciones de Cheques';
  bbtnImprimeAmortiza.visible:=True;
 CargaDetalle(' AND B.DOC_FREG='+quotedstr('H'));
end;

procedure TFEstCxCPro.CanNCreClick(Sender: TObject);
begin
  xPopup := '6';
  pnlHist.Caption := 'Cancelaciones de Notas de Crédito';
  bbtnImprimeAmortiza.visible:=True;
  CargaDetalle(''); //(' AND B.DOC_FREG='+quotedstr(wsNCre));
end;

procedure TFEstCxCPro.dbgEst6TitleButtonClick(Sender: TObject;  AFieldName: String);
begin
  pnlBusca1.Visible := True;
  isBusca1.SetFocus;
  CagaBusca(DMCXP.dsQRY6);
  isBusca1.SearchField := AFieldName;
  DMCXP.cdsQRY6.IndexFieldNames:=AFieldName;
end;

procedure TFEstCxCPro.dbgEst2TitleButtonClick(Sender: TObject; AFieldName: String);
begin
  pnlBusca1.Visible := True;
  isBusca1.SetFocus;
  CagaBusca(DMCXP.dsQRY2);
  isBusca1.SearchField := AFieldName;
  DMCXP.cdsQRY2.IndexFieldNames:=AFieldName;
end;

procedure TFEstCxCPro.dbgEst3TitleButtonClick(Sender: TObject; AFieldName: String);
begin
  pnlBusca1.Visible := True;
  isBusca1.SetFocus;
  CagaBusca(DMCXP.dsQRY4);
  isBusca1.SearchField := AFieldName;
  DMCXP.cdsQRY4.IndexFieldNames:=AFieldName;
end;

procedure TFEstCxCPro.dbgTodosTitleButtonClick(Sender: TObject;AFieldName: String);
begin
  pnlBusca1.Visible := True;
  isBusca1.SetFocus;
  CagaBusca(DMCXP.dsReporte);
  isBusca1.SearchField := AFieldName;
  DMCXP.cdsReporte.IndexFieldNames:=AFieldName;
end;

procedure TFEstCxCPro.isBusca1Exit(Sender: TObject);
begin
  pnlBusca1.Visible := False;
  isBusca1.DataSource := Nil;
  isBusca1.SearchField := '';
end;

procedure TFEstCxCPro.CagaBusca(xDataSource: TwwDataSource);
begin
  isBusca1.DataSource := xDataSource;
end;



procedure TFEstCxCPro.InsertaGrupo;
var sGrupo,sSQL:string;
begin
{  memGrupo.Lines.Clear;
  sGrupo:=DMCXP.BuscaQry2('dspTGE','TGE204','GRUPOID','CLIEID='+QuotedStr(dblcProv.text),'GRUPOID');
  sSQL:='SELECT CLIEID,CLIERUC,CLIEDES FROM TGE204 WHERE GRUPOID='+QuotedStr(sGrupo)+
        ' and CLIEID<>'+QuotedStr(dblcProv.text);
  DMCXP.cdsQry.close;
  DMCXP.cdsQry.DataRequest(sSQL);
  DMCXP.cdsQry.OPen;
  if DMCXP.cdsQry.RecordCount>0 then
  begin
    DMCXP.cdsQry.First;
    while not DMCXP.cdsQry.EOF do
    begin
      memGrupo.Lines.Add(DMCXP.cdsQry.FieldByName('CLIEID').AsString+' '+DMCXP.cdsQry.FieldByName('CLIEDES').AsString);
      DMCXP.cdsQry.Next;
    end;
  end;}
end;

procedure TFEstCxCPro.dbeTelfMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  dbeTelf.Hint:=dbeTelf.text;
end;

procedure TFEstCxCPro.dbgHistDblClick(Sender: TObject);
var sSQL:string;
begin
  try
  if DMCXP.cdsHLetras.FieldByName('DOCID2').AsString=DMCXP.wsCob then
  begin
    sSQL:='SELECT * FROM CXP320 WHERE CIAID='+QuotedStr(DMCXP.cdsHLetras.FieldByName('CIAID').AsString)+
          ' AND LICOID='+QuotedStr(DMCXP.cdsHLetras.FieldByName('CPNODOC2').AsString)+
          ' AND DOCID='+QuotedStr(DMCXP.cdsHLetras.FieldByName('DOCID').AsString)+
          ' AND CPSERIE='+QuotedStr(DMCXP.cdsHLetras.FieldByName('CPSERIE').AsString)+
          ' AND CPNODOC='+QuotedStr(DMCXP.cdsHLetras.FieldByName('CPNODOC').AsString)+
          ' AND CLIEID='+QuotedStr(DMCXP.cdsHLetras.FieldByName('CLIEID').AsString);
    DMCXP.cdsDetPagoLiq.Close;
    DMCXP.cdsDetPagoLiq.DataRequest(sSQL);
    DMCXP.cdsDetPagoLiq.Open;
    if DMCXP.cdsDetPagoLiq.RecordCount>0 then
       pnlDetFPagoLiq.visible:=True;

  end;
  except
  end;
end;

procedure TFEstCxCPro.bbtnCierraDetFPagoLiqClick(Sender: TObject);
begin
   pnlDetFPagoLiq.visible:=False;
end;

procedure TFEstCxCPro.bbtnCierraHistClick(Sender: TObject);
begin
  pnlLetras.Visible:=False;
  bbtnImprimeAmortiza.visible:=false;
end;

procedure TFEstCxCPro.DocumentosOrigen1Click(Sender: TObject);
//var
  //sSQL:string;
begin
	{Screen.Cursor := crHourGlass;
	sSQL:='SELECT CXP301.CIAID, TGE110.DOCABR, CXP301.CPSERIE, CXP301.CPNODOC, CXP304.CCPCANJE, CXP304.CCPFCJE, CXP308.CJESTADO '+
				'FROM CXP301 '+
				'LEFT JOIN TGE110 ON TGE110.DOCID=CXP301.DOCID '+
				'LEFT JOIN CXP304 ON CXP304.CIAID=CXP301.CIAID AND CXP304.CCPCANJE=CXP301.CPCANJE AND CXP304.TCANJEID=CXP301.TCANJEID '+
				'LEFT JOIN CXP308 ON CXP308.CIAID=CXP304.CIAID AND CXP308.CANJE=CXP304.CCPCANJE AND CXP308.TCANJEID=CXP304.TCANJEID '+
				'WHERE CXP304.CIAID='+QuotedStr(DMCXP.cdsQry4.FieldByName('CIAID').AsString)+' '+
				'AND CXP304.DOCID='+QuotedStr(DMCXP.cdsQry4.FieldByName('DOCID').AsString)+' '+
				'AND CXP304.CPSERIE=''000'' '+
				'AND CXP304.CPNODOC='+QuotedStr(DMCXP.cdsQry4.FieldByName('CPNODOC').AsString)+' '+
				'AND TGE110.DOCMOD=''CXP'' '+
				'AND CJESTADO<>''A''';
  dbgHist.Selected.Clear;
  dbgHist.DataSource := NIL;
	DMCXP.cdsHLetras.Filter := '';
	DMCXP.cdsHLetras.Filtered := False;
	DMCXP.cdsHLetras.indexfieldnames := '';

  DMCXP.cdsHLetras.Close;
  DMCXP.cdsHLetras.DataRequest(sSQL);
  DMCXP.cdsHLetras.Open;

  if DMCXP.cdsHLetras.RecordCount = 0 then
  begin
  	Screen.Cursor := crDefault;
  	Information(Caption, 'No Existe información a Mostrar');
  	Exit;
  end;

  try
  	dbgHist.Selected.Add('DOCABR'#9'5'#9'Documento'#9'F');
    dbgHist.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
    dbgHist.Selected.Add('CPNODOC'#9'10'#9'Número'#9'F');
    dbgHist.Selected.Add('CCPCANJE'#9'10'#9'Canje'#9'F');
    dbgHist.Selected.Add('CCPFCJE'#9'10'#9'Fecha~Canje'#9'F');
    dbgHist.Selected.Add('CJESTADO'#9'10'#9'Estado'#9'F');

    dbgHist.DataSource := DMCXP.dsHLetras;
    pnlHist.Caption := 'Documentos de Compromiso ';
    lblDocumento.caption:=dbgEst3.DataSource.DataSet.FieldByName('DOCABR').AsString+' '+
                          dbgEst3.DataSource.DataSet.FieldByName('CPSERIE').AsString+' '+
                          dbgEst3.DataSource.DataSet.FieldByName('CPNODOC').AsString;

  	pnlLetras.Height:=263;
  	pnlLetras.Left:=42;
  	pnlLetras.Top:=266;
  	pnlLetras.Width:=726;
    pnlLetras.Visible:=True;
    Screen.Cursor := crDefault;

  finally
    dbgHist.Selected.Clear;

    dbgHist.Selected.Add('CPHIST'#9'4'#9'No.'#9'F');
    dbgHist.Selected.Add('CPFSITUA'#9'10'#9'Fecha~Cambio'#9'F');
    dbgHist.Selected.Add('UBICA'#9'13'#9'Ubicación'#9'F');
    dbgHist.Selected.Add('SITUA'#9'13'#9'Situación'#9'F');
    dbgHist.Selected.Add('CPFEMIS'#9'10'#9'Fecha~Emisión'#9'F');
    dbgHist.Selected.Add('CPFVCMTO'#9'10'#9'Fecha~Vencimiento'#9'F');
    dbgHist.Selected.Add('CPTCAMPR'#9'6'#9'Tipo~Cambio'#9'F');
    dbgHist.Selected.Add('CPMTOLOC'#9'9'#9'Importe~(MN)'#9'F');
    dbgHist.Selected.Add('CPMTOEXT'#9'9'#9'Importe~(ME)'#9'F');
    dbgHist.Selected.Add('CPUSER'#9'6'#9'Usuario'#9'F');
    dbgHist.Selected.Add('CPFREG'#9'10'#9'Fecha ~Reg.'#9'F');
    dbgHist.Selected.Add('CPHREG'#9'10'#9'Hora ~Reg.'#9'F');
  end;}
end;

procedure TFEstCxCPro.FormActivate(Sender: TObject);
var
  FDate : TDateTime;
  i : Word;
  LC : String;
begin
  pgcDctos.ActivePage := TabSheet6;
  pgcDatCli.ActivePage:= tshDatCliente;
  pnlLetras.visible := false;
	dbeTCAMB.Text := '0';
	stcam := '1';

	FEstCxCPro.ClAux     := DMCXP.cdsCXP.FieldByName('CLAUXID').AsString;
	FEstCxCPro.Cliente   := DMCXP.cdsCXP.FieldByName('PROV').AsString;
	FEstCxCPro.ClienteDes:= DMCXP.cdsCXP.FieldByName('PROVDES').AsString;

  bbtnEjecuta.Click;

  if Internal then
  begin
//     rLineaCredito:=DMCXP.cdsQry1.FieldByName('CLIECREMAX').AsFloat;
//     dblcProv.Enabled := Activar;
  end;
  rgEST.ItemIndex:=1;
  i:= 1;
  FDate := EnCodeDate(Anio,Mes,i);
  dtpINI.Date := FDate;
  dtpFIN.Date := Date;
  chbFecha.Checked:=True;
//	TNumericField(DMCXP.cdsQry1.FieldByName('CLIECREMAX')).DisplayFormat:='###,###,#0.00';
//	TNumericField(DMCXP.cdsQry1.FieldByName('DISPONIBLE')).DisplayFormat:='###,###,#0.00';
  TNumericField(DMCXP.cdsQry1.FieldByName('SALANTME')).DisplayFormat:='###,###,#0.00';
  TNumericField(DMCXP.cdsQry1.FieldByName('CARGOSME')).DisplayFormat:='###,###,#0.00';
  TNumericField(DMCXP.cdsQry1.FieldByName('ABONOSME')).DisplayFormat:='###,###,#0.00';
  TNumericField(DMCXP.cdsQry1.FieldByName('SALTOTALME')).DisplayFormat:='###,###,#0.00';
  Z2bbtnAceptarClick(nil);
end;

procedure TFEstCxCPro.bbtnEjecutaClick(Sender: TObject);
var
  wAno, wMes, wDia : Word;
  xMesAct, xMesAnt, xAnoAct : String;
  xCampos, xWhere : String;
begin
  wAno := seAno.Value;
  wMes := seMes.Value;

  xMesAct := strzero( inttostr( wMes ),2 );
  if xMesAct='01' then
  	xMesAnt:='00'
  else
  	xMesAnt:=strzero(inttostr(wMes-1),2);
  xAnoAct := inttostr(wAno);

  xCampos:='AUXID, '+
  				 DMCXP.wReplacCeros+'(SALDSME'+XMESANT+',0) SALDSANTME, '+DMCXP.wReplacCeros+'(DEBESME'+XMESACT+',0) CARGOSME, '+
           DMCXP.wReplacCeros+'(HABESME'+XMESACT+',0) ABONOSME, '	+	DMCXP.wReplacCeros+'(SALDSME'+XMESACT+',0) SALDSACTME, '+
           DMCXP.wReplacCeros+'(SALDSMN'+XMESANT+',0) SALDSANTMN, '+DMCXP.wReplacCeros+'(DEBESMN'+XMESACT+',0) CARGOSMN, '+
           DMCXP.wReplacCeros+'(HABESMN'+XMESACT+',0) ABONOSMN, '	+	DMCXP.wReplacCeros+'(SALDSMN'+XMESACT+',0) SALDSACTMN, '+
           DMCXP.wReplacCeros+'(SALDTME'+XMESANT+',0) SALDTANTME, '+DMCXP.wReplacCeros+'(DEBETME'+XMESACT+',0) CARGOTME, '+
           DMCXP.wReplacCeros+'(HABETME'+XMESACT+',0) ABONOTME, '	+	DMCXP.wReplacCeros+'(SALDTME'+XMESACT+',0) SALDTACTME, '+
           DMCXP.wReplacCeros+'(SALDTMN'+XMESANT+',0) SALDTANTMN, '+DMCXP.wReplacCeros+'(DEBETMN'+XMESACT+',0) CARGOTMN, '+
           DMCXP.wReplacCeros+'(HABETMN'+XMESACT+',0) ABONOTMN, '	+	DMCXP.wReplacCeros+'(SALDTMN'+XMESACT+',0) SALDTACTMN';

  xWhere :='CIAID='''+FToolCtaCteProv.dblcCia.Text+''' AND ANO='+quotedstr(xAnoAct)+' AND AUXID='+QuotedStr(DMCXP.cdsCXP.FieldByName('PROV').AsString);

  DMCXP.displaydescrip2('dspTGE','TGE401',xCampos,xWhere,'AUXID');

	dbeSalAntMN.Text := DMCXP.cdsQry.FieldByName('SALDSANTMN').AsString;
  dbeCargosMN.Text := DMCXP.cdsQry.FieldByName('CARGOSMN').AsString;
  dbeAbonosMN.Text := DMCXP.cdsQry.FieldByName('ABONOSMN').AsString;
  dbeSalActMN.Text := DMCXP.cdsQry.FieldByName('SALDSACTMN').AsString;

	dbeSalAntME.Text := DMCXP.cdsQry.FieldByName('SALDSANTME').AsString;
  dbeCargosME.Text := DMCXP.cdsQry.FieldByName('CARGOSME').AsString;
  dbeAbonosME.Text := DMCXP.cdsQry.FieldByName('ABONOSME').AsString;
  dbeSalActME.Text := DMCXP.cdsQry.FieldByName('SALDSACTME').AsString;
end;

procedure TFEstCxCPro.seMesExit(Sender: TObject);
begin
	seMes.Text:=StrZero(seMes.Text,2);
end;

procedure TFEstCxCPro.pprAmortizaPreviewFormCreate(Sender: TObject);
begin
	pprAmortiza.PreviewForm.ClientHeight := 500;
	pprAmortiza.PreviewForm.ClientWidth  := 650;
	TppViewer(pprAmortiza.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
end;

procedure TFEstCxCPro.pprCtaCtePreviewFormCreate(Sender: TObject);
begin
	pprCtaCte.PreviewForm.ClientHeight := 500;
	pprCtaCte.PreviewForm.ClientWidth  := 650;
	TppViewer(pprCtaCte.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
end;

procedure TFEstCxCPro.ppCtaCteProvPreviewFormCreate(Sender: TObject);
begin
	ppCtaCteProv.PreviewForm.ClientHeight := 500;
	ppCtaCteProv.PreviewForm.ClientWidth  := 650;
	TppViewer(ppCtaCteProv.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
end;

procedure TFEstCxCPro.ppSummaryBand17BeforePrint(Sender: TObject);
begin
   //FACTURAS
   ppvCLF.Value:=ppdbcCLF.Value;
   ppvPLF.Value:=ppdbcPLF.Value;
   ppvSLF.Value:=ppdbcSLF.Value;
   ppvCEF.Value:=ppdbcCEF.Value;
   ppvPEF.Value:=ppdbcPEF.Value;
   ppvSEF.Value:=ppdbcSEF.Value;

	//N.CREDITO
   ppvCLN.Value:=ppdbcCLN.Value;
   ppvPLN.Value:=ppdbcPLN.Value;
   ppvSLN.Value:=ppdbcSLN.Value;
   ppvCEN.Value:=ppdbcCEN.Value;
   ppvPEN.Value:=ppdbcPEN.Value;
   ppvSEN.Value:=ppdbcSEN.Value;

   //LETRAS
   ppvCLL.Value:=ppdbcCLL.Value;
   //ppvPLL.Value:=ppdbcPLL.Value;
   ppvSLL.Value:=ppdbcSLL.Value;

   //ppvCEL.Value:=ppdbcCEL.Value;
   ppvCEL.Value:=ppdbcPEL.Value;
   ppvSEL.Value:=ppdbcSEL.Value;
   ppvPEL.Value:=ppvCEL.Value-ppvSEL.Value;


   ppvPLNP.Value:=ppdbcNPL.Value;
   ppvSLNP.Value:=ppdbcNPL.Value*(-1);
   ppvPENP.Value:=ppdbcNPE.Value;
   ppvSENP.Value:=ppdbcNPE.Value*(-1);

   //TOTALES
   ppvCLT.Value:=ppdbcCLF.Value+ppdbcCLL.Value+ppdbcCLN.Value;
   ppvPLT.Value:=ppdbcPLF.Value+ppdbcPLN.Value+ppdbcNPL.Value;
   ppvSLT.Value:=ppdbcSLF.Value+ppdbcSLL.Value+ppdbcSLN.Value;
   ppvSLT.Value:=ppvCLT.Value-ppvPLT.Value;
   ppvCET.Value:=ppdbcCEF.Value+ppdbcCEN.Value+ppvCEL.Value;
//   ppvPET.Value:=ppdbcPEF.Value+ppdbcPEL.Value+ppdbcPEN.Value+ppdbcNPE.Value;
   ppvPET.Value:=ppdbcPEF.Value+ppdbcPEN.Value+ppdbcNPE.Value+ppvPEL.Value;
   ppvSET.Value:=ppdbcSEF.Value+ppdbcSEL.Value+ppdbcSEN.Value;
   ppvSET.Value:=ppvCET.Value-ppvPET.Value;
   //ppvLin.Value:=StrToFloat(pplLin.caption);
   //ppvDis.Value:=ppvLin.Value-(ppvSET.Value+(ppvSLT.Value*DMCXP.cdsSQL.FieldByName('CAMBIO').AsFloat));
end;

procedure TFEstCxCPro.cFooterNProv(dbg: TwwDBGrid; cds: TwwClientDataSet);
var
  MlocS, MExtS, TLocS, TExtS, MlocR, MExtR, TLocR, TExtR, PLocS, PExtS : Double;
begin
  MlocS := OperClientDataSet( cds , 'SUM(MONTOMN)', '');
  MExtS := OperClientDataSet( cds , 'SUM(MONTOME)', '');

  dbg.ColumnByName('MONTOMN').FooterValue  :=FloatToStrF(MLocS, ffNumber, 15, 2);

  dbg.ColumnByName('MONTOME').FooterValue  :=FloatToStrF(MExtS, ffNumber, 15, 2);
  dbg.FooterCellColor := clInfoBk;
  dbg.RedrawGrid;
end;

procedure TFEstCxCPro.cFooterNCredito(dbg: TwwDBGrid; cds: TwwClientDataSet);
var
  Mloc, MExt,TLoc,TExt,PLoc,PExt : Double;
begin
  Mloc := OperClientDataSet( cds , 'SUM(CPMTOLOC)', '');
  MExt := OperClientDataSet( cds , 'SUM(CPMTOEXT)', '');
  dbg.ColumnByName('CPMTOLOC').FooterValue  :=floattostrf(MLoc, ffNumber, 15, 2);
  dbg.ColumnByName('CPMTOEXT').FooterValue  :=floattostrf(MExt, ffNumber, 15, 2);

  Ploc := OperClientDataSet( cds , 'SUM(CPPAGLOC)', '');
  PExt := OperClientDataSet( cds , 'SUM(CPPAGEXT)', '');
  dbg.ColumnByName('CPPAGLOC').FooterValue  :=floattostrf(PLoc, ffNumber, 15, 2);
  dbg.ColumnByName('CPPAGEXT').FooterValue  :=floattostrf(PExt, ffNumber, 15, 2);

  Tloc := OperClientDataSet( cds , 'SUM(CPSALLOC)', '');
  TExt := OperClientDataSet( cds , 'SUM(CPSALEXT)', '');
  dbg.ColumnByName('CPSALLOC').FooterValue  :=floattostrf(TLoc, ffNumber, 15, 2);
  dbg.ColumnByName('CPSALEXT').FooterValue  :=floattostrf(TExt, ffNumber, 15, 2);

  dbg.FooterCellColor := clInfoBk;
  dbg.RedrawGrid;
end;

procedure TFEstCxCPro.cFooterProvis(dbg: TwwDBGrid; cds: TwwClientDataSet);
var
  Mloc, MExt, Ploc, PExt, Sloc, SExt : Double;
begin
  MLoc := OperClientDataSet( cds , 'SUM(MTOLOC)', '');
  MExt := OperClientDataSet( cds , 'SUM(MTOEXT)', '');
  dbg.ColumnByName('MTOLOC').FooterValue  :=floattostrf(MLoc, ffNumber, 15, 2);
  dbg.ColumnByName('MTOEXT').FooterValue  :=floattostrf(MExt, ffNumber, 15, 2);

  PLoc := OperClientDataSet( cds , 'SUM(PAGLOC)', '');
  PExt := OperClientDataSet( cds , 'SUM(PAGEXT)', '');
  dbg.ColumnByName('PAGLOC').FooterValue  :=floattostrf(PLoc, ffNumber, 15, 2);
  dbg.ColumnByName('PAGEXT').FooterValue  :=floattostrf(PExt, ffNumber, 15, 2);

  Mloc := OperClientDataSet( cds , 'SUM(SALLOC)', '');
  MExt := OperClientDataSet( cds , 'SUM(SALEXT)', '');
  dbg.ColumnByName('SALLOC').FooterValue  :=floattostrf(MLoc, ffNumber, 15, 2);
  dbg.ColumnByName('SALEXT').FooterValue  :=floattostrf(MExt, ffNumber, 15, 2);

  dbg.FooterCellColor := clInfoBk;
  dbg.RedrawGrid;
end;

procedure TFEstCxCPro.cFooterletras(dbg: TwwDBGrid; cds: TwwClientDataSet);
var
  Mloc, MExt, Ploc, PExt, Sloc, SExt : Double;
begin
  MLoc := OperClientDataSet( cds , 'SUM(MTOLOC)', '');
  MExt := OperClientDataSet( cds , 'SUM(MTOEXT)', '');
  dbg.ColumnByName('MTOLOC').FooterValue  :=floattostrf(MLoc, ffNumber, 15, 2);
  dbg.ColumnByName('MTOEXT').FooterValue  :=floattostrf(MExt, ffNumber, 15, 2);

  PLoc := OperClientDataSet( cds , 'SUM(PAGLOC)', '');
  PExt := OperClientDataSet( cds , 'SUM(PAGEXT)', '');
  dbg.ColumnByName('PAGLOC').FooterValue  :=floattostrf(PLoc, ffNumber, 15, 2);
  dbg.ColumnByName('PAGEXT').FooterValue  :=floattostrf(PExt, ffNumber, 15, 2);

  Mloc := OperClientDataSet( cds , 'SUM(SALLOC)', '');
  MExt := OperClientDataSet( cds , 'SUM(SALEXT)', '');
  dbg.ColumnByName('SALLOC').FooterValue  :=floattostrf(MLoc, ffNumber, 15, 2);
  dbg.ColumnByName('SALEXT').FooterValue  :=floattostrf(MExt, ffNumber, 15, 2);

  dbg.FooterCellColor := clInfoBk;
  dbg.RedrawGrid;
end;


function TFEstCxCPro.FiltraDoc( xTipoProv : String ) : String;
var
   xFiltro, xSelDoc : String;
begin
   DMCXP.cdsTDoc.Filter:='';
   // JORGE
   //      xTipoProv  := 'P'; // para Provisiones (facturas, n/Débito)
   //      xTipoProv  := 'N'; // para Notas de Crédito
   //      xTipoProv  := 'L'; // para Letras
   //	   xTipoProv  := 'T'; // para préstamos de terceros
   //  	   xTipoProv  := 'I'; // pera Intermediación
   //  	   xTipoProv  := 'F'; // Facturas del Exterior

   xFiltro := '(DOC_FREG='+quotedstr( xTipoProv )+' and DOCMOD='+quotedstr('CXP')+')';

   if xTipoProv='P' then
      xFiltro := '( ( DOC_FREG=''P'' OR DOC_FREG=''F'' ) and DOCMOD='+quotedstr('CXP')+')';

   if xTipoProv='N' then
      xFiltro := xFiltro + ' or (DOCTIPREG='+quotedstr('NC')+' and DOCMOD='+quotedstr('CXP')+')' ;

   if xTipoProv='L' then
      xFiltro := xFiltro + ' or (DOCTIPREG='+quotedstr('LT')+' and DOCMOD='+quotedstr('CXP')+')' ;

   DMCXP.cdsTDoc.Filter:= xFiltro;
   DMCXP.cdsTDoc.Filtered:=true;
   xSelDoc := '';
   while not DMCXP.cdsTDoc.Eof do
   begin
      if Length(xSelDoc)=0 then
	 xSelDoc := ''''+DMCXP.cdsTDoc.fieldbyname('DOCID').AsString+''''
      else
	 xSelDoc := xSelDoc+ ', '''+DMCXP.cdsTDoc.fieldbyname('DOCID').AsString+'''';
      DMCXP.cdsTDoc.Next;
   end;
   if Length( xSelDoc )=0 then
      xSelDoc:='ZZ';

   Result:=xSelDoc;
end;


procedure TFEstCxCPro.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.
