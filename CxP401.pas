Unit CxP401;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   CxP401
// Formulario           :   FCRegComp
// Fecha de Creación    :
// Autor                :   Equipo de desarrollo
// Objetivo             :   Ventana que permite listar el registro de Compras

// Actualizaciones      :
// HPC_201302_CXP  27/05/2013  se implementa la funcionalidad que permite exportar
//                             el Registro de Compras en un archivo de texto con
//                             el formato del PLE
// HPC_201303_CXP  21/10/2013  se restaura eventos para reporte de Registro de Compras
//                             para que sincronice con archivo rtm
// HPC_201304_CXP  23/10/2013  se restaura eventos para reporte de Registro de Compras
//                             para que sincronice con archivo rtm, adicion para la Retencion de No Domiciliados
// HPC_201405_CXP  08/04/2014  se Modifica eventos para reporte de Registro de Compras
//                             para que sincronice con archivo rtm, adicion para la Retencion de No Domiciliados,
//                             debido a que se cambio del Tipo de Diario 51 al 63
// HPC_201412_CXP  17/09/2014  Se está adicionando 2 botones que permitirá visualizar reportes de validacion
//                             entre cuentas por pagar y contabilidad
// HPC_201602_CXP  15/01/2016: DAF_2016000019_CXP_2
//                             Se define la variable wTMonLocDes para descripción de la Moneda Local
//                             Se define la variable wTMonExtDes para descripción de la Moneda Extranjera
//                 19/01/2016  Se cambia cambio de Monto Total a pagar por Monto Total de la Provisión 
//                             ya que no necesariamente es lo mismo

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, Db, DBTables, Wwquery,
   ppDBBDE, ppClass, daDataVw, daQuery, daDBBDE, ppModule, daDatMod,
   ppPrnabl, ppCtrls, ppBands, ppProd, ppReport, Wwdatsrc, StdCtrls,
   ExtCtrls, Mask, wwdbedit, daQClass, wwdblook, Buttons, Wwdbdlg,
   wwdbdatetimepicker, ppVar, ppviewr, Grids, Wwdbigrd, Wwdbgrid, ppStrtch,
   ppRegion, ppEndUsr, ppTypes, oaVariables, ppParameter, DBClient,
   filectrl,
   wwExport, shellapi,
   wwclient, ComCtrls, daDataModule;

Type
   TFCRegComp = Class(TForm)
      pnlRegComp: TPanel;
      lblLetras: TLabel;
      bbtnOk: TBitBtn;
      ppdbMovCxP2: TppDBPipeline;
      bbtnBorra: TBitBtn;
      pnlDatos1: TPanel;
      lblCia: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      dbeAnoMM: TwwDBEdit;
      Label2: TLabel;
      pnlDatos2: TPanel;
      lblRango1: TLabel;
      dbeNoReg1: TwwDBEdit;
      dbdtpFReg1: TwwDBDateTimePicker;
      dblcdProv1: TwwDBLookupComboDlg;
      dbdtpFReg2: TwwDBDateTimePicker;
      dblcdProv2: TwwDBLookupComboDlg;
      dbeNoReg2: TwwDBEdit;
      lblRango2: TLabel;
      rgMoneda: TRadioGroup;
      rgOrden: TRadioGroup;
      rgEstado: TRadioGroup;
      Panel1: TPanel;
      rgFormato: TRadioGroup;
      ppRegComCta: TppReport;
      ppdbRegCta: TppDBPipeline;
      ppRegComCtbl: TppReport;
      pprRC: TppReport;
      ppdbRC: TppDBPipeline;
      ppReport1: TppReport;
      ppHeaderBand5: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel34: TppLabel;
      ppLabel81: TppLabel;
      ppSystemVariable12: TppSystemVariable;
      ppSystemVariable13: TppSystemVariable;
      ppSystemVariable14: TppSystemVariable;
      ppLabel107: TppLabel;
      ppLabel108: TppLabel;
      ppLabel109: TppLabel;
      ppLabel131: TppLabel;
      ppLabel133: TppLabel;
      ppLabel134: TppLabel;
      ppLabel135: TppLabel;
      ppLabel137: TppLabel;
      ppLabel138: TppLabel;
      ppLabel139: TppLabel;
      ppLabel140: TppLabel;
      ppLabel141: TppLabel;
      ppLabel142: TppLabel;
      ppLabel143: TppLabel;
      ppLabel144: TppLabel;
      ppLabel145: TppLabel;
      ppLabel146: TppLabel;
      ppDBText3: TppDBText;
      ppLabel147: TppLabel;
      ppDBText38: TppDBText;
      ppDetailBand5: TppDetailBand;
      ppDBText40: TppDBText;
      ppDBText41: TppDBText;
      ppDBText42: TppDBText;
      ppDBText43: TppDBText;
      ppDBText44: TppDBText;
      ppDBText45: TppDBText;
      ppDBText46: TppDBText;
      ppDBText47: TppDBText;
      ppDBText48: TppDBText;
      ppDBText49: TppDBText;
      ppDBText50: TppDBText;
      ppDBText51: TppDBText;
      ppDBText52: TppDBText;
      ppSummaryBand5: TppSummaryBand;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppDBCalc19: TppDBCalc;
      ppDBCalc22: TppDBCalc;
      ppLabel148: TppLabel;
      ppDBCalc24: TppDBCalc;
      ppLabel149: TppLabel;
      ppLabel164: TppLabel;
      ppLabel166: TppLabel;
      ppDBText56: TppDBText;
      ppDBText57: TppDBText;
      ppDBCalc33: TppDBCalc;
      ppDBCalc34: TppDBCalc;
      ppHeaderBand3: TppHeaderBand;
      ppLabel17: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppSystemVariable7: TppSystemVariable;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppSystemVariable8: TppSystemVariable;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLine8: TppLine;
      ppLabel27: TppLabel;
      ppLine9: TppLine;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppVariable16: TppVariable;
      ppVariable17: TppVariable;
      ppDetailBand3: TppDetailBand;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText8: TppDBText;
      ppDBText18: TppDBText;
      ppFooterBand3: TppFooterBand;
      ppSummaryBand3: TppSummaryBand;
      ppLine10: TppLine;
      ppVariable18: TppVariable;
      ppVariable19: TppVariable;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      gbTDiario: TGroupBox;
      chktodos: TCheckBox;
      edtTDiario: TEdit;
      dblcTDiario: TwwDBLookupCombo;
      ppDesigner1: TppDesigner;
      ppHeaderBand4: TppHeaderBand;
      ppLabel110: TppLabel;
      ppLabel111: TppLabel;
      ppLabel112: TppLabel;
      ppLabel113: TppLabel;
      ppLabel116: TppLabel;
      ppLabel117: TppLabel;
      ppLabel118: TppLabel;
      ppLabel119: TppLabel;
      ppLabel120: TppLabel;
      ppLabel121: TppLabel;
      ppLabel122: TppLabel;
      ppLabel123: TppLabel;
      ppLabel124: TppLabel;
      ppLabel125: TppLabel;
      ppLabel126: TppLabel;
      ppLabel127: TppLabel;
      ppLabel128: TppLabel;
      ppLabel129: TppLabel;
      ppLabel130: TppLabel;
      ppLabel132: TppLabel;
      ppLabel136: TppLabel;
      ppLabel165: TppLabel;
      ppLabel167: TppLabel;
      ppLabel168: TppLabel;
      ppLabel198: TppLabel;
      ppSystemVariable9: TppSystemVariable;
      ppSystemVariable10: TppSystemVariable;
      ppSystemVariable11: TppSystemVariable;
      ppLabel199: TppLabel;
      ppLabel201: TppLabel;
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
      ppLabel214: TppLabel;
      ppLabel215: TppLabel;
      ppLabel217: TppLabel;
      ppLabel218: TppLabel;
      ppLabel219: TppLabel;
      ppLabel220: TppLabel;
      ppLabel221: TppLabel;
      ppLabel222: TppLabel;
      ppLabel223: TppLabel;
      ppLabel224: TppLabel;
      ppLabel225: TppLabel;
      ppLabel226: TppLabel;
      ppLabel227: TppLabel;
      ppLabel228: TppLabel;
      ppLabel229: TppLabel;
      ppLabel230: TppLabel;
      ppLabel231: TppLabel;
      ppLabel232: TppLabel;
      ppLabel233: TppLabel;
      ppLabel234: TppLabel;
      ppLabel235: TppLabel;
      ppLabel236: TppLabel;
      ppLabel237: TppLabel;
      ppLabel238: TppLabel;
      ppLabel239: TppLabel;
      ppLabel240: TppLabel;
      ppLabel241: TppLabel;
      ppLabel242: TppLabel;
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
      ppLabel262: TppLabel;
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
      ppLabel285: TppLabel;
      ppLabel286: TppLabel;
      ppLabel287: TppLabel;
      ppLabel288: TppLabel;
      ppLabel289: TppLabel;
      ppLabel290: TppLabel;
      ppLabel291: TppLabel;
      ppLabel292: TppLabel;
      ppLabel293: TppLabel;
      ppLabel294: TppLabel;
      ppLabel295: TppLabel;
      ppLabel296: TppLabel;
      ppDBText67: TppDBText;
      ppDBText68: TppDBText;
      ppDBText69: TppDBText;
      ppDBText70: TppDBText;
      ppLabel114: TppLabel;
      ppLabel115: TppLabel;
      ppLabel200: TppLabel;
      ppLabel202: TppLabel;
      ppLabel203: TppLabel;
      ppDetailBand4: TppDetailBand;
      ppDBText19: TppDBText;
      ppdbtProv: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppvEstado2: TppVariable;
      ppVariable7: TppVariable;
      ppDBText24: TppDBText;
      ppDBText26: TppDBText;
      ppdbtRUC: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppDBText30: TppDBText;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
      ppDBText33: TppDBText;
      ppDBText58: TppDBText;
      ppDBText59: TppDBText;
      ppDBText60: TppDBText;
      ppDBText64: TppDBText;
      ppDBText65: TppDBText;
      ppDBText66: TppDBText;
      ppDBText20: TppDBText;
      ppDBText25: TppDBText;
      ppSummaryBand4: TppSummaryBand;
      ppVariable8: TppVariable;
      ppLabel297: TppLabel;
      ppLabel298: TppLabel;
      ppRegion1: TppRegion;
      ppLabel299: TppLabel;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc27: TppDBCalc;
      ppDBCalc28: TppDBCalc;
      ppDBCalc30: TppDBCalc;
      ppDBCalc57: TppDBCalc;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppDBText63: TppDBText;
      ppDBText71: TppDBText;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppLabel172: TppLabel;
      ppLabel173: TppLabel;
      ppRegion3: TppRegion;
      ppLabel174: TppLabel;
      ppDBCalc49: TppDBCalc;
      ppDBCalc50: TppDBCalc;
      ppDBCalc51: TppDBCalc;
      ppDBCalc53: TppDBCalc;
      ppDBCalc54: TppDBCalc;
      ppDBCalc55: TppDBCalc;
      ppDBCalc52: TppDBCalc;
      ppDBText72: TppDBText;
      ppDBCalc56: TppDBCalc;
      ppParameterList2: TppParameterList;
      ppHeaderBand2: TppHeaderBand;
      ppLabel4: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLine5: TppLine;
      ppLabel16: TppLabel;
      ppLine7: TppLine;
      ppDetailBand2: TppDetailBand;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText5: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppSummaryBand2: TppSummaryBand;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppLine6: TppLine;
      ppd1: TppDesigner;
      bbtnNuevo: TBitBtn;
      pprRCompras: TppReport;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      pplblFecFin: TppLabel;
      pplblFecIni: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      pplblDel: TppLabel;
      pplblAl: TppLabel;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppLabel50: TppLabel;
      ppLabel54: TppLabel;
      ppLabel55: TppLabel;
      ppLabel56: TppLabel;
      ppLabel57: TppLabel;
      ppLabel58: TppLabel;
      ppLabel59: TppLabel;
      ppLabel60: TppLabel;
      ppLabel61: TppLabel;
      ppvIGravada1: TppVariable;
      pplblImp01a: TppLabel;
      ppLabel68: TppLabel;
      ppLabel69: TppLabel;
      ppLabel70: TppLabel;
      svPag: TppSystemVariable;
      ppSystemVariable5: TppSystemVariable;
      ppsvFec: TppSystemVariable;
      ppLabel71: TppLabel;
      ppVariable1: TppVariable;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLabel45: TppLabel;
      ppLabel46: TppLabel;
      ppLabel53: TppLabel;
      ppLabel64: TppLabel;
      ppLabel65: TppLabel;
      ppLabel66: TppLabel;
      ppLabel67: TppLabel;
      ppLabel72: TppLabel;
      ppLabel73: TppLabel;
      ppLabel74: TppLabel;
      ppLabel75: TppLabel;
      ppLabel76: TppLabel;
      ppLabel77: TppLabel;
      ppLabel78: TppLabel;
      ppLabel79: TppLabel;
      pplblImp02a: TppLabel;
      ppLabel52: TppLabel;
      ppLabel63: TppLabel;
      ppLabel51: TppLabel;
      ppLabel62: TppLabel;
      ppLabel150: TppLabel;
      ppLabel154: TppLabel;
      ppLabel155: TppLabel;
      ppDBText90: TppDBText;
      ppDBText91: TppDBText;
      ppLabel37: TppLabel;
      ppLabel105: TppLabel;
      ppLabel106: TppLabel;
      ppLabel169: TppLabel;
      ppLabel170: TppLabel;
      ppLabel171: TppLabel;
      ppLabel175: TppLabel;
      ppLabel176: TppLabel;
      ppLabel177: TppLabel;
      ppLabel178: TppLabel;
      ppLabel179: TppLabel;
      ppLabel2: TppLabel;
      ppLabel186: TppLabel;
      ppLabel83: TppLabel;
      ppLabel84: TppLabel;
      ppLabel85: TppLabel;
      ppLabel87: TppLabel;
      ppLabel88: TppLabel;
      ppLabel188: TppLabel;
      ppLabel190: TppLabel;
      ppLabel191: TppLabel;
      ppLabel192: TppLabel;
      ppLabel193: TppLabel;
      ppLabel89: TppLabel;
      ppLabel194: TppLabel;
      ppLabel195: TppLabel;
      ppLabel86: TppLabel;
      ppLabel196: TppLabel;
      ppLabel197: TppLabel;
      ppLabel216: TppLabel;
      ppLabel300: TppLabel;
      ppLabel301: TppLabel;
      ppLabel92: TppLabel;
      ppLabel93: TppLabel;
      ppLabel94: TppLabel;
      ppLabel189: TppLabel;
      ppLabel302: TppLabel;
      ppLabel303: TppLabel;
      ppLabel304: TppLabel;
      ppLabel305: TppLabel;
      ppLabel306: TppLabel;
      ppLabel307: TppLabel;
      ppLabel308: TppLabel;
      ppLabel95: TppLabel;
      ppLabel96: TppLabel;
      ppLabel97: TppLabel;
      ppLabel309: TppLabel;
      ppLabel90: TppLabel;
      ppLabel91: TppLabel;
      ppLabel181: TppLabel;
      ppLabel151: TppLabel;
      ppLabel152: TppLabel;
      ppLabel153: TppLabel;
      ppLabel98: TppLabel;
      ppLabel99: TppLabel;
      ppLabel100: TppLabel;
      ppLabel182: TppLabel;
      ppLabel183: TppLabel;
      ppLabel184: TppLabel;
      ppLabel185: TppLabel;
      ppLabel101: TppLabel;
      ppLabel102: TppLabel;
      ppLabel103: TppLabel;
      ppLabel187: TppLabel;
      ppLabel156: TppLabel;
      ppLabel157: TppLabel;
      ppLabel158: TppLabel;
      ppLabel159: TppLabel;
      ppLabel160: TppLabel;
      ppLabel161: TppLabel;
      ppLabel162: TppLabel;
      ppLabel163: TppLabel;
      ppLabel3: TppLabel;
      ppLabel31: TppLabel;
      ppLabel80: TppLabel;
      ppLabel310: TppLabel;
      ppLabel311: TppLabel;
      ppLabel315: TppLabel;
      ppLabel316: TppLabel;
      ppLabel317: TppLabel;
      ppLabel318: TppLabel;
      ppLabel319: TppLabel;
      ppLabel320: TppLabel;
      ppLabel321: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText2: TppDBText;
      ppdbProvDes: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppVarEstado: TppVariable;
      ppVariable3: TppVariable;
      ppdbTMon: TppDBText;
      ppDBText4: TppDBText;
      ppdbResta: TppDBText;
      ppdbProvRuc: TppDBText;
      ppDBText34: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppDBText37: TppDBText;
      ppdbtIGV2: TppDBText;
      ppDBText39: TppDBText;
      ppDBText54: TppDBText;
      ppDBText55: TppDBText;
      ppDBText53: TppDBText;
      ppDBText14: TppDBText;
      ppDBText27: TppDBText;
      ppDBText61: TppDBText;
      ppDBText62: TppDBText;
      ppDBText1: TppDBText;
      ppDBText75: TppDBText;
      ppDBText76: TppDBText;
      ppDBText77: TppDBText;
      ppDBText78: TppDBText;
      ppDBText74: TppDBText;
      ppDBText79: TppDBText;
      ppDBText80: TppDBText;
      ppDBText81: TppDBText;
      ppDBText82: TppDBText;
      ppDBText83: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppDBCalc37: TppDBCalc;
      ppDBCalc38: TppDBCalc;
      ppDBCalc39: TppDBCalc;
      ppLabel104: TppLabel;
      ppDBCalc40: TppDBCalc;
      ppDBCalc41: TppDBCalc;
      ppDBCalc42: TppDBCalc;
      ppDBCalc43: TppDBCalc;
      ppDBCalc46: TppDBCalc;
      ppDBCalc44: TppDBCalc;
      ppDBCalc45: TppDBCalc;
      ppDBCalc61: TppDBCalc;
      ppDBCalc64: TppDBCalc;
      ppDBCalc67: TppDBCalc;
      ppSummaryBand1: TppSummaryBand;
      ppVariable2: TppVariable;
      ppLabel82: TppLabel;
      ppLabel180: TppLabel;
      pprTotal: TppRegion;
      ppLabel312: TppLabel;
      ppDBCalc2: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppDBCalc20: TppDBCalc;
      ppDBCalc21: TppDBCalc;
      ppdbcT3IGV2: TppDBCalc;
      ppDBCalc25: TppDBCalc;
      ppDBCalc29: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc47: TppDBCalc;
      ppDBCalc62: TppDBCalc;
      ppDBCalc65: TppDBCalc;
      ppDBCalc68: TppDBCalc;
      ppDBCalc31: TppDBCalc;
      ppDBCalc17: TppDBCalc;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText15: TppDBText;
      ppDBText73: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLabel313: TppLabel;
      ppDBCalc9: TppDBCalc;
      ppDBCalc18: TppDBCalc;
      ppDBCalc23: TppDBCalc;
      ppLabel314: TppLabel;
      ppDBCalc26: TppDBCalc;
      ppDBCalc32: TppDBCalc;
      ppdbcT1IGV2: TppDBCalc;
      ppDBCalc35: TppDBCalc;
      ppDBCalc36: TppDBCalc;
      ppDBCalc48: TppDBCalc;
      ppDBCalc58: TppDBCalc;
      ppDBCalc60: TppDBCalc;
      ppDBCalc63: TppDBCalc;
      ppDBCalc66: TppDBCalc;
      gbFecRep: TGroupBox;
      dtpFecRep: TwwDBDateTimePicker;
      cbFecRep: TCheckBox;
      pplFec: TppLabel;
      BitBtn1: TBitBtn;
      dbgdata: TwwDBGrid;
      btnExportarExcel: TBitBtn;
      dbgRegCompras: TwwDBGrid;
      btnExportarPLE: TBitBtn;
      sdNombreArchivo: TSaveDialog;
      prgb_Progreso: TProgressBar;
      ppParameterList3: TppParameterList;
      ppLabel322: TppLabel;
      ppLabel323: TppLabel;
      ppLabel324: TppLabel;
      ppLabel325: TppLabel;
      ppDBText84: TppDBText;
      ppDBText85: TppDBText;
      cbDiseno: TCheckBox;
    sbDiseno: TSpeedButton;
    ppdbRegNodom: TppDBPipeline;
    pprRNodom: TppReport;
    ppD2: TppDesigner;
    ppdbReg2daCat: TppDBPipeline;
    pprR2daCat: TppReport;
    gbValidaciones: TGroupBox;					   // HPC_201412_CXP
    btnImprime1: TBitBtn;						   // HPC_201412_CXP
    btnImprime2: TBitBtn;						   // HPC_201412_CXP
    ppdV: TppDesigner;							   // HPC_201412_CXP
    ppD3: TppDesigner;							   // HPC_201412_CXP
    pprV: TppReport;							   // HPC_201412_CXP
    ppHeaderBand6: TppHeaderBand;				   // HPC_201412_CXP
    ppDetailBand6: TppDetailBand;				   // HPC_201412_CXP
    ppFooterBand4: TppFooterBand;				   // HPC_201412_CXP
    ppdbV: TppDBPipeline;						   // HPC_201412_CXP

      Procedure rgOrdenClick(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcTDiarioExit(Sender: TObject);
      Procedure bbtnCancClick(Sender: TObject);
      Procedure dbdtpFReg1Exit(Sender: TObject);
      Procedure dbdtpFReg2Exit(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure ppVarEstadoCalc(Sender: TObject; Var Value: Variant);
      Procedure ppvIGravada1Calc(Sender: TObject; Var Value: Variant);
      Procedure pprRComprasPreviewFormCreate(Sender: TObject);
      Procedure dbeAnoMMExit(Sender: TObject);
      Procedure bbtnBorraClick(Sender: TObject);
      Procedure IniciaDatos;
      Procedure CompletaRegistros;
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure ppVariable1Calc(Sender: TObject; Var Value: Variant);
      Procedure ppVariable2Calc(Sender: TObject; Var Value: Variant);
      Procedure ppVariable3Calc(Sender: TObject; Var Value: Variant);
      Procedure ppRegComCtaPreviewFormCreate(Sender: TObject);
      Procedure ppRegComCtblPreviewFormCreate(Sender: TObject);
      Procedure ppVariable4Calc(Sender: TObject; Var Value: Variant);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure ppDetailBand2BeforePrint(Sender: TObject);
      Procedure ppDBText7Print(Sender: TObject);
      Procedure ppDBText5Print(Sender: TObject);
      Procedure ppDBCalc5Print(Sender: TObject);
      Procedure ppDBCalc4Print(Sender: TObject);
      Procedure ppvEstado2Calc(Sender: TObject; Var Value: Variant);
      Procedure chktodosClick(Sender: TObject);
      Procedure chktodosExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure ppHeaderBand1BeforePrint(Sender: TObject);
      Procedure ppGroupFooterBand1AfterPrint(Sender: TObject);
      Procedure bbtnNuevoClick(Sender: TObject);
      Procedure cbFecRepClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure btnExportarExcelClick(Sender: TObject);
      Procedure btnExportarPLEClick(Sender: TObject);
      Procedure ppDBText4Print(Sender: TObject);
      Procedure ppSummaryBand2BeforePrint(Sender: TObject);
      Procedure ppVariable10Print(Sender: TObject);
      Procedure ppFooterBand1BeforePrint(Sender: TObject);
    procedure sbDisenoClick(Sender: TObject);
    procedure btnImprime1Click(Sender: TObject);    // HPC_201412_CXP
    procedure btnImprime2Click(Sender: TObject);    // HPC_201412_CXP
   Private
    { Private declarations }
      xbExportarExcel: Boolean;
      wCiaRetIgv: String[1];
      Procedure CargaDataSource;
      Procedure PaginarReporte(xxCds: TwwClientDataSet; xxTipoRep: String);
      Procedure fg_ExportarExcel(wgFormato: String);
      Procedure fg_PLEexportarFormato(wgPeriodo, wgRutaArchivo: String);
      Function fg_PLEvalidaParametros: boolean;
      Procedure fg_PLEinsertaTabla(wgRegistroCompras: TwwClientDataSet; wgPeriodo: String);
      Function fg_PLEvalidaDatos(Var wgMensaje: String): Boolean;
      Function fg_PLEprocesaRegCompras(wgPeriodo: String): Boolean;
      Procedure fg_PLEeliminaRegCompras(wgPeriodo: String);
      Procedure fg_PLEdocReferenciaNC(Var wgFechaDocRef: String; Var wgTDocRef: String;
         Var wgSerieRef: String; Var wgNumDocRef: String;
         wgCiaNC, wgCanjeNC, wgProvNC: String);
      Function fg_PLEobtieneTdocProv(wgTipoAuxiliar,
         wgAuxiliarId, wgNumDocIdentidad: String): String;

   Public
    { Public declarations }
      sCiaOrigen: String;
   End;

Var
   FCRegComp: TFCRegComp;
   Year, Month, Day: Word;
   wfechOk: boolean;
   anomm, wMes: String;
   xMoneda: String;
   xFiltroP1, xFiltroP2: String;
   sTemp: String;
   xMenos: Double;
   xResta: String;
   sTDiarios: String;
   xImpTotalxPag: Boolean;
   wwTasaIGV: double; //  define variable donde se carga valor IGV

Implementation

Uses CxPDM, CxP998,
   CXP402;

{$R *.DFM}

Procedure TFCRegComp.IniciaDatos;
Begin
   dblcCia.Text := '';
   edtCia.Text := '';
   dblcTDiario.Text := '';
   edtTDiario.Text := '';
   rgOrden.ItemIndex := -1;
   dbeNoReg1.Text := '';
   dbeNoReg2.Text := '';
   dbdtpFReg1.Date := 0;
   dbdtpFReg2.Date := 0;
   dblcdProv1.Text := '';
   dblcdProv2.Text := '';
   rgMoneda.ItemIndex := 0;
   rgEstado.ItemIndex := 1;
   sTDiarios := '';
// Inicia HPC_201405_CXP (SPP_201405_CXP)
   chktodos.Checked := False;
   chktodos.visible := False;
   dblcTDiario.Visible := True;
   edtTDiario.text := '';
   edtTDiario.Visible := True;
   cbDiseno.Visible := False;
// Fin HPC_201405_CXP (SPP_201405_CXP)

End;

Procedure TFCRegComp.dblcCiaExit(Sender: TObject);
Begin
   If bbtnBorra.Focused Then Exit;
   edtCia.Text := DMCXP.DisplayDescrip('TGE101', 'CIADES', 'CiaID', dblcCia.Text);
   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Falta Código de Compañía');
      dblcCia.SetFocus;
   End;
   wCiaRetIgv := DMCXP.cdsULTTGE.FieldByName('CIARETIGV').asString;
   sCiaOrigen := DMCXP.FiltraTablaxCia(DMCXP.cdsTDiario, 'TGE104', 'TDIARID', dblcCia.Text);
// Inicia HPC_201405_CXP (SPP_201405_CXP)
//   chktodosClick(Self);
// Fin HPC_201405_CXP (SPP_201405_CXP)
   btnExportarPLE.Enabled := False;
   If dblcCia.Text = '01' Then
   Begin
      btnExportarPLE.Enabled := True;
   End;
End;

Procedure TFCRegComp.dblcTDiarioExit(Sender: TObject);
Begin
   If bbtnBorra.Focused Then Exit;
// Inicia HPC_201405_CXP (SPP_201405_CXP)
   //   If chktodos.Focused Then Exit;
// Fin HPC_201405_CXP (SPP_201405_CXP)
   edtTDiario.Text := DMCXP.DisplayDescrip('TGE104', 'TDiarDES', 'TDiarID', dblcTDiario.Text);
   If length(edtTDiario.Text) = 0 Then
   Begin
      ShowMessage('Falta Tipo de Diario');
      dblcTDiario.SetFocus;
   End;
End;

Procedure TFCRegComp.rgOrdenClick(Sender: TObject);
Begin

   With DMCXP Do
   Begin
      If edtCia.Text = '' Then Raise exception.Create('Compañia no válida');
// Inicia HPC_201405_CXP (SPP_201405_CXP)
      //If chktodos.checked = False Then
      //   If edtTDiario.Text = '' Then Raise exception.Create('Diario no válido');
// Fin HPC_201405_CXP (SPP_201405_CXP)
      If length(dbeAnoMM.Text) <> 6 Then Raise exception.Create('Periodo no válido');
      xFiltroP2 := '';
      Case rgOrden.ItemIndex Of
         0:
            Begin // No. de Registro
               dblcdProv1.Visible := False;
               dblcdProv2.Visible := False;
               dbdtpFReg1.Visible := False;
               dbdtpFReg2.Visible := False;
               dbeNoReg1.Visible := True;
               dbeNoReg2.Visible := True;
               cdsMovCxP2.IndexFieldNames := 'CPNOREG';
               cdsMovCxP2.First;
               dbeNoReg1.Text := cdsMovCxP2.FieldByName('CPNOREG').AsString;
               cdsMovCxP2.Last;
               dbeNoReg2.Text := cdsMovCxP2.FieldByName('CPNOREG').AsString;
               xFiltroP2 := ' AND CPNOREG>=' + '''' + dbeNoReg1.Text + ''''
                          + ' AND CPNOREG<=' + '''' + dbeNoReg2.Text + '''';
            End;
         1:
            Begin // Fecha Reg.
               dblcdProv1.Visible := False;
               dblcdProv2.Visible := False;
               dbeNoReg1.Visible := False;
               dbeNoReg2.Visible := False;
               dbdtpFReg1.Visible := True;
               dbdtpFReg2.Visible := True;
               cdsMovCxP2.IndexFieldNames := 'CPFCMPRB';
               cdsMovCxP2.First;
               dbdtpFReg1.Date := cdsMovCxP2.FieldByName('CPFCMPRB').AsDateTime;
               cdsMovCxP2.Last;
               dbdtpFReg2.Date := cdsMovCxP2.FieldByName('CPFCMPRB').AsDateTime;
               xFiltroP2 := ' AND CPFCMPRB>=' + DMCXP.wRepFuncDate + '''' + FORMATDATETIME(DMCXP.wFormatFecha, dbdtpFReg1.Date) + '''' + ')'
                          + ' AND CPFCMPRB<=' + DMCXP.wRepFuncDate + '''' + FORMATDATETIME(DMCXP.wFormatFecha, dbdtpFReg2.Date) + '''' + ')';
            End;
         2:
            Begin // Proveedor

               Filtracds(DMCXP.cdsProv, 'SELECT * FROM TGE201');

               dbeNoReg1.Visible := False;
               dbeNoReg2.Visible := False;
               dbdtpFReg1.Visible := False;
               dbdtpFReg2.Visible := False;
               dblcdProv1.Visible := True;
               dblcdProv2.Visible := True;
               cdsMovCxP2.IndexFieldNames := 'PROV';
               cdsMovCxP2.First;
               dblcdProv1.Text := cdsMovCxP2.FieldByName('PROV').AsString;
               cdsMovCxP2.Last;
               dblcdProv2.Text := cdsMovCxP2.FieldByName('PROV').AsString;
               xFiltroP2 := ' AND PROV>=' + '''' + dblcdProv1.Text + ''''
                          + ' AND PROV<=' + '''' + dblcdProv2.Text + '''';
            End;
         3:
            Begin // No. de Registro
               dblcdProv1.Visible := False;
               dblcdProv2.Visible := False;
               dbdtpFReg1.Visible := False;
               dbdtpFReg2.Visible := False;
               dbeNoReg1.Visible := True;
               dbeNoReg2.Visible := True;
               cdsMovCxP2.IndexFieldNames := 'CPNOREG';
               cdsMovCxP2.First;
               dbeNoReg1.Text := cdsMovCxP2.FieldByName('CPNOREG').AsString;
               cdsMovCxP2.Last;
               dbeNoReg2.Text := cdsMovCxP2.FieldByName('CPNOREG').AsString;
               xFiltroP2 := ' AND CPNOREG>=' + '''' + dbeNoReg1.Text + ''''
                          + ' AND CPNOREG<=' + '''' + dbeNoReg2.Text + '''';
            End;
         4:
            Begin // Fecha Reg.
               dblcdProv1.Visible := False;
               dblcdProv2.Visible := False;
               dbeNoReg1.Visible := False;
               dbeNoReg2.Visible := False;
               dbdtpFReg1.Visible := True;
               dbdtpFReg2.Visible := True;
               cdsMovCxP2.IndexFieldNames := 'CPFCMPRB';
               cdsMovCxP2.First;
               dbdtpFReg1.Date := cdsMovCxP2.FieldByName('CPFCMPRB').AsDateTime;
               cdsMovCxP2.Last;
               dbdtpFReg2.Date := cdsMovCxP2.FieldByName('CPFCMPRB').AsDateTime;
               xFiltroP2 := ' AND CPFCMPRB>=' + DMCXP.wRepFuncDate + '''' + FORMATDATETIME(DMCXP.wFormatFecha, dbdtpFReg1.Date) + '''' + ')'
                          + ' AND CPFCMPRB<=' + DMCXP.wRepFuncDate + '''' + FORMATDATETIME(DMCXP.wFormatFecha, dbdtpFReg2.Date) + '''' + ')';
            End;
         5:
            Begin // Proveedor
               Filtracds(DMCXP.cdsProv, 'SELECT * FROM TGE201');
               dbeNoReg1.Visible := False;
               dbeNoReg2.Visible := False;
               dbdtpFReg1.Visible := False;
               dbdtpFReg2.Visible := False;
               dblcdProv1.Visible := True;
               dblcdProv2.Visible := True;
               cdsMovCxP2.IndexFieldNames := 'PROV';
               cdsMovCxP2.First;
               dblcdProv1.Text := cdsMovCxP2.FieldByName('PROV').AsString;
               cdsMovCxP2.Last;
               dblcdProv2.Text := cdsMovCxP2.FieldByName('PROV').AsString;
               xFiltroP2 := ' AND PROV>=' + '''' + dblcdProv1.Text + ''''
                          + ' AND PROV<=' + '''' + dblcdProv2.Text + '''';
            End;
      End;
   End;
   Screen.Cursor := crDefault;
End;

Procedure TFCRegComp.bbtnCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFCRegComp.dbdtpFReg1Exit(Sender: TObject);
Begin
   DecodeDate(dbdtpFReg1.date, Year, Month, Day);
   wMes := inttostr(Month);
   If Month < 10 Then wMes := '0' + inttostr(Month);
   anomm := IntToStr(Year) + wMes;
   If anomm <> dbeAnoMM.Text Then
      wFechOk := False
   Else
      wFechOk := True;
End;

Procedure TFCRegComp.dbdtpFReg2Exit(Sender: TObject);
Begin
   DecodeDate(dbdtpFReg2.date, Year, Month, Day);
   wMes := inttostr(Month);
   If Month < 10 Then wMes := '0' + inttostr(Month);
   anomm := IntToStr(Year) + wMes;
   If anomm <> dbeAnoMM.Text Then
      wFechOk := False
   Else
      wFechOk := True;
End;

Procedure TFCRegComp.bbtnOkClick(Sender: TObject);
Var
   flagFech: Boolean;
   xEstado, xSql, xSql1, xCuenta, wSQL, xOper, xExpresado, xCONDICION, xWhere: String;
   xMontoD, xMontoH, xMonto: double;
   xSQL2, xSQL3, xSQL4: String;
   x10: Integer;
Begin
   If rgOrden.ItemIndex < 0 Then
   Begin
      ShowMessage('Error : Seleccionar Orden del Reporte');
      rgOrden.SetFocus;
      Exit;
   End;

   DMCXP.cdsReporte.Close;
   flagFech := False;
   If edtCia.Text = '' Then Raise exception.Create('Compañia no válida');

   If chktodos.Checked Then
   Begin
      xSQL := 'SELECT TDIARID DIARIO '
            + '  FROM CXP301 '
            + ' WHERE CIAID=' + Quotedstr(dblcCia.text)
            + ' GROUP BY TDIARID';

      DMCXP.cdsQry2.IndexFieldNames;
      DMCXP.cdsQry2.Filter := '';
      DMCXP.cdsQry2.Filtered := False;
      DMCXP.cdsQry2.Close;
      DMCXP.cdsQry2.DataRequest(xSQL);
      DMCXP.cdsQry2.Open;
      sTDiarios := '';
      DMCXP.cdsQry2.First;
      While Not DMCXP.cdsQry2.Eof Do
      Begin
         If length(sTDiarios) = 0 Then
            sTDiarios := 'IN(' + '''' + DMCXP.cdsQry2.fieldbyname('DIARIO').AsString + ''
         Else
            sTDiarios := sTDiarios + ''' ,' + '''' + DMCXP.cdsQry2.fieldbyname('DIARIO').AsString + '';

         DMCXP.cdsQry2.Next;
         If DMCXP.cdsQry2.Eof Then
            sTDiarios := sTDiarios + ''') ';
      End;
   End
   Else
      If dblcTDiario.Text = '' Then Raise exception.Create('Diario no válido');

   If length(dbeAnoMM.Text) <> 6 Then Raise exception.Create('Periodo no válido');
   Case rgOrden.ItemIndex Of
      0:
         Begin // No. de Registro
            If (dbeNoReg1.Text = '') Or (dbeNoReg2.Text = '') Then
               Raise exception.Create('Ingrese rango inferior y superior');
         End;
      1:
         Begin // Fecha Reg.
            flagFech := True;
            If (dbdtpFReg1.Date = 0) Or (dbdtpFReg1.Date = 0) Then
               Raise exception.Create('Ingrese rango inferior y superior');
            If Not (wFechOk) Then Raise exception.Create('Fecha no coincide con el periodo');
         End;
      2:
         Begin // Proveedor
            If (dblcdProv1.Text = '') Or (dblcdProv2.Text = '') Then
               Raise exception.Create('Ingrese rango inferior y superior');
         End;
      3:
         Begin // No. de Registro
            If (dbeNoReg1.Text = '') Or (dbeNoReg2.Text = '') Then
               Raise exception.Create('Ingrese rango inferior y superior');
         End;
      4:
         Begin // Fecha Reg.
            flagFech := True;
            If (dbdtpFReg1.Date = 0) Or (dbdtpFReg1.Date = 0) Then
               Raise exception.Create('Ingrese rango inferior y superior');
            If Not (wFechOk) Then Raise exception.Create('Fecha no coincide con el periodo');
         End;
      5:
         Begin // Proveedor
            If (dblcdProv1.Text = '') Or (dblcdProv2.Text = '') Then
               Raise exception.Create('Ingrese rango inferior y superior');
         End;
   End;

   If flagFech Then
   Begin
      pplblDel.Visible := True;
      pplblFecIni.Visible := True;
      pplblFecIni.Caption := datetostr(dbdtpFReg1.Date);
      pplblAl.Visible := True;
      pplblFecFin.Visible := True;
      pplblFecFin.Caption := datetostr(dbdtpFReg2.Date);
   End;

   Case rgMoneda.ItemIndex Of
      0:
         Begin
            xMoneda := DMCXP.wTMonLoc;
// Inicio HPC_201602_CXP
// DAF_2016000019_CXP_2 Se usa la variable wTMonLocDes para descripción de la Moneda Local
            xExpresado := 'Expresado en ' + DMCXP.wTMonLocDes ;
//            xExpresado := 'Expresado en Nuevos Soles';
// Fin HPC_201602_CXP
            xOper := '*';
         End;
      1:
         Begin
            xMoneda := DMCXP.wTMonExt;
// Inicio HPC_201602_CXP
// DAF_2016000019_CXP_2 Se usa la variable wTMonExtDes para descripción de la Moneda Extranjera
            xExpresado := 'Expresado en ' + DMCXP.wTMonExtDes ;
//            xExpresado := 'Expresado en Dolares';
// Fin HPC_201602_CXP
            xOper := '/';
         End;
   End;

   Case rgEstado.ItemIndex Of
      0: xCondicion := 'Estado: No Aceptados';
      1: xCondicion := 'Estado: Aceptados';
      2: xCondicion := 'Estado: Todos';
      3: xCondicion := 'Estado: Todos sin Eliminados';
   End;

   Case rgOrden.ItemIndex Of
      0: xFiltroP2 := ' AND CXP301.CPNOREG>=' + '''' + dbeNoReg1.Text + ''''
                    + ' AND CXP301.CPNOREG<=' + '''' + dbeNoReg2.Text + '''';
      1: xFiltroP2 := ' AND CXP301.CPFCMPRB>=' + DMCXP.wRepFuncDate + '''' + FormatDateTime(DMCXP.wFormatFecha, dbdtpFReg1.Date) + '''' + ')'
                    + ' AND CXP301.CPFCMPRB<=' + DMCXP.wRepFuncDate + '''' + FormatDateTime(DMCXP.wFormatFecha, dbdtpFReg2.Date) + '''' + ')';
      2: xFiltroP2 := ' AND CXP301.PROV>=' + '''' + dblcdProv1.Text + ''''
                    + ' AND CXP301.PROV<=' + '''' + dblcdProv2.Text + '''';
      3: xFiltroP2 := ' AND CXP301.CPNOREG>=' + '''' + dbeNoReg1.Text + ''''
                    + ' AND CXP301.CPNOREG<=' + '''' + dbeNoReg2.Text + '''';
      4: xFiltroP2 := ' AND CXP301.CPFCMPRB>=' + DMCXP.wRepFuncDate + '''' + FormatDateTime(DMCXP.wFormatFecha, dbdtpFReg1.Date) + '''' + ')'
                    + ' AND CXP301.CPFCMPRB<=' + DMCXP.wRepFuncDate + '''' + FormatDateTime(DMCXP.wFormatFecha, dbdtpFReg2.Date) + '''' + ')';
      5: xFiltroP2 := ' AND CXP301.PROV>=' + '''' + dblcdProv1.Text + ''''
                    + ' AND CXP301.PROV<=' + '''' + dblcdProv2.Text + '''';
   End;

   If sCiaOrigen <> '' Then
      xFiltroP2 := xFiltroP2 + ' and CXP301.' + sCiaOrigen;

   Case rgEstado.ItemIndex Of
      0: xEstado := ' (CXP301.CPESTADO=' + '''' + 'I' + '''' + ') AND ';
      1: xEstado := ' (CXP301.CPESTADO=' + '''' + 'P' + '''' + ' OR '
                  + '  CXP301.CPESTADO=' + '''' + 'C' + '''' + ' OR '
                  + '  CXP301.CPESTADO=' + '''' + 'A' + '''' + ') AND ';
      2: xEstado := ' (CXP301.CPESTADO=' + '''' + 'I' + '''' + ' OR '
                  + '  CXP301.CPESTADO=' + '''' + 'P' + '''' + ' OR '
                  + '  CXP301.CPESTADO=' + '''' + 'C' + '''' + ' OR '
                  + '  CXP301.CPESTADO=' + '''' + 'E' + '''' + ' OR '
                  + '  CXP301.CPESTADO=' + '''' + 'A' + '''' + ') AND ';
      3: xEstado := ' (CXP301.CPESTADO=' + '''' + 'I' + '''' + ' OR '
                  + '  CXP301.CPESTADO=' + '''' + 'P' + '''' + ' OR '
                  + '  CXP301.CPESTADO=' + '''' + 'C' + '''' + ' OR '
                  + '  CXP301.CPESTADO=' + '''' + 'A' + '''' + ') AND ';
   End;

// Inicio HPC_201602_CXP
// Valida que variables xEstado, xFiltroP1 y xFiltroP2 tengan valores
   If length(xEstado)=0 then
   Begin
      ShowMessage('No se ha definido correctamente el Estado');
      rgEstado.SetFocus;
      exit;
   End;
   If length(xFiltroP1)=0 then
   Begin
      ShowMessage('No se ha definido correctamente la Compañía, tipo de Diario y/o Periodo');
      dblcCia.SetFocus;
      exit;
   End;
   If length(xFiltroP2)=0 then
   Begin
      ShowMessage('No se ha definido correctamente el Orden de Impresión');
      rgOrden.SetFocus;
      exit;
   End;
// Fin HPC_201602_CXP

  ///////////////////////////
  //     DETALLADO         //
  ///////////////////////////

   If rgFormato.ItemIndex = 0 Then
   Begin
     //** Si el indice es 0,1 y 2
      If (rgOrden.ItemIndex = 0) Or (rgOrden.ItemIndex = 1) Or (rgOrden.ItemIndex = 2) Then
      Begin
         xSQL1 := 'SELECT CXP301.CIAID, CXP301.CPANOMES, CXP301.TDIARID, CXP301.CPNOREG, '
                + '       CXP301.CLAUXID, CXP301.PROV, CXP301.PROVRUC, CXP301.DOCID, '
                + '       CXP301.CPSERIE, CXP301.CPNODOC, CXP301.CPFRECEP, CXP301.CPFEMIS, '
                + '       CXP301.CPFVCMTO, CXP301.TMONID, CXP301.CPTCAMPR, CXP301.CPTCAMPA, '
                + '       CXP301.CPESTADO, CXP301.CP_CONTA, CXP301.FECDEPDET, CXP301.NUMDEPDET, '
                + '       CXP301.CPTODETRSUNATID, CXP301.TIPOOPERSUNATID, CXP301.DTRPORC, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
                + '            ELSE nvl(A.CPGRAVAD,0.00) end CPGRAVAD, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
                + '            ELSE nvl(A.CPIGV,0.00) end CPIGV, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
                + '            ELSE nvl(A.CPGRAVAD2,0.00) end CPGRAVAD2, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
                + '            ELSE nvl(A.CPIGV2,0.00) end CPIGV2, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
                + '            ELSE nvl(A.CPNOGRAV,0.00) end CPNOGRAV, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
                + '            ELSE nvl(A.IGV_GRA_NO_DEST,0.00) end IGV_GRA_NO_DEST, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
                + '            ELSE nvl(A.ADQ_NO_GRAV,0.00) end ADQ_NO_GRAV, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
                + '            ELSE nvl(A.CP_OTROS,0.00) end CP_OTROS, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
                + '            ELSE nvl(A.CPDCTO,0.00) end CPDCTO, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
                + '            ELSE nvl(A.CPISC,0.00) end CPISC, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
                + '            ELSE nvl(A.CPSERVIC,0.00) end CPSERVIC, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
                + '            ELSE  nvl(A.CP4TA,0.00) end CP4TA, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
                + '            ELSE  nvl(A.CPNODOM,0.00) end CPNODOM, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
                + '            ELSE  nvl(A.CP2TA,0.00) end CP2TA, '
                + '       DECODE( CPESTADO,''A'',0, DECODE( CPESTADO,''E'',0, ROUND( NVL( A.CPMTOORI, 0) ' + xOper + ' DECODE(trim(CXP301.TMONID),' + QuotedStr(xMoneda) + ', 1, CPTCAMPR) * DECODE(DOCRESTA,' + QuotedStr('S') + ', -1, 1 ), 2 ) )) CPMTOORI, '
                + '       DECODE( CPESTADO,''A'',0, DECODE( CPESTADO,''E'',0, DECODE( ' + QuotedStr(trim(xMoneda)) + ', ' + QuotedStr(trim(DMCXP.wTMonLoc)) + ', NVL( A.CPMTOLOC,0), NVL( A.CPMTOEXT,0) ) )) CPMTOLOC, '
                + '       DECODE( trim(CXP301.TMONID),' + QuotedStr(trim(DMCXP.wTMonLoc)) + ', 0, DECODE( CPESTADO,''A'', 0, DECODE( CPESTADO,''E'', 0, NVL( A.CPMTOEXT,0)) ) ) CPMTOEXT, '
                + '       CXP301.CPUSER, CXP301.CPFREG, CXP301.CPHREG, CXP301.CPFCMPRB,  '
                + '       TGE201.PROVDES,TGE110.DOCDES, NVL(TGE110.DOCRESTA,'' '') DOCRESTA, '
                + quotedstr(DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4)) + ' PERIODO, '
                + quotedstr(edtCia.Text) + ' CIADES, ';

         If wCiaRetIgv = 'S' Then
         Begin
            xSQL2 := '    CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0 '
                   + '            ELSE CASE WHEN nvl(TGE201.PROVRETIGV,''N'') = ' + quotedstr('S')
                   + '                      THEN CASE WHEN nvl(A.CPIGV,0) > 0 '
                   + '                                THEN CASE WHEN nvl(A.CPGRAVAD,0) > nvl(TASAMTO,0) '
                   + '                                          THEN nvl(A.CPGRAVAD,0)+nvl(A.CPIGV,0) '
                   + '                                          ELSE 0 '
                   + '                                     END '
                   + '                                ELSE 0 '
                   + '                           END '
                   + '                      ELSE 0 '
                   + '                 END '
                   + '       END COMPSUJRET,'
                   + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0 '
                   + '            ELSE CASE WHEN nvl(TGE201.PROVRETIGV,''N'') = ' + quotedstr('S')
                   + '                      THEN CASE WHEN nvl(A.CPIGV,0) > 0 '
                   + '                                THEN CASE WHEN nvl(A.CPGRAVAD,0) > nvl(TASAMTO,0) '
                   + '                                          THEN (nvl(A.CPGRAVAD,0)+nvl(A.CPIGV,0))*nvl(TASACAN,0)/100 '
                   + '                                          ELSE 0 '
                   + '                                     END '
                   + '                                ELSE 0 '
                   + '                           END '
                   + '                      ELSE 0 '
                   + '                 END '
                   + '       END IGVRET ';
         End
         Else
         Begin
            xSQL2 := ' 0 COMPSUJRET, 0 IGVRET ';
         End;
         xSQL3 := ', CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0 ELSE NVL( A.CPIGV,0)+NVL( A.CPIGV2,0) END CXPTOTIGV, '
                + ' CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0  ELSE NVL( A.CPGRAVAD,0)+NVL( A.CPGRAVAD2,0) END CXPTOTGRAVAD, '
                + ' CASE WHEN TGE201.PROVRETIGV = ' + quotedstr('S') + ' THEN '
                + ' CASE WHEN A.CPIGV > 0 THEN '
                + ' CASE WHEN A.CPGRAVAD > TASAMTO THEN'
                + ' ''X'' ELSE '' '' END ELSE '' '' END ELSE '' '' END RETSN, '
                + '''' + DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4) + ''' PERIODO, '
                + '''' + edtCia.Text + ''' CIADES, '
                + '''' + 'Periodo : ' + DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4) + ''', '
                + '''' + xExpresado + ''' EXPRESADO, '
                + '''' + xCondicion + ''' CONDICION '
                + ', TGE104.TDIARDES '
                + ', ''PERIODO : ' + DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4) + ''' PERIODO '
                + ', ''' + edtCia.Text + ''' COMPANIA, A.GLOSA '
                + ', 0 NUMPAGINA '
                + ', TGE201.TIPPERID TIPOPERSONA'
                + ', CXP301.CPTCAMPR TIPOCAMBIO';
      // Inicio HPC_201405_CXP (SPP_201405_CXP)
         If (STRTOINT(dblcTDiario.Text) = 63) or (STRTOINT(dblcTDiario.Text) = 64) Then
            xSQL3 := xSQL3 + ', NVL(PORCDESC,0) PORCDESC, CXP301.CPIGV, CXP301.CPMTOEXT ';
      // Fin HPC_201405_CXP (SPP_201405_CXP)
         xSQL3 := xSQL3 + ', (select CXP301_A.CPFEMIS from CXP301 CXP301_A '
                + ' where CXP304.CIAID = CXP301_A.CIAID '
                + ' and CXP304.DOCID = CXP301_A.DOCID '
                + ' and CXP304.CPSERIE = CXP301_A.CPSERIE '
                + ' and CXP304.CPNODOC = CXP301_A.CPNODOC '
                + ' and CXP304.Prov = CXP301_A.Prov '
                + ' and CXP304.TCANJEID = ' + QuotedStr('NC')
                + ' and rownum = 1 ) NC_FECHA_DOC'
                + ', CXP304.DOCID NC'
                + ', CXP304.CPSERIE NC_SERIE'
                + ', CXP304.CPNODOC NC_DOC'
                + ' FROM CXP301, TGE201, TGE110, TGE108, TGE104,  ';

         xSQL3 := xSQL3 + '     (SELECT CIAID, DOCID, CPSERIE, PROV, TCANJEID, CCPCANJE, max(CPNODOC) CPNODOC '
                + '        FROM CXP304 '
                + '       GROUP BY CIAID, DOCID, CPSERIE, PROV, TCANJEID, CCPCANJE) CXP304, ';
         xSQL4 := '( '
                + 'SELECT CIAID, TDIARID, DCPANOMM, CPNOREG,  SUM( CPGRAVAD )  CPGRAVAD, '
                + 'SUM( CPIGV ) CPIGV,  SUM( CPGRAVAD2 ) CPGRAVAD2,  SUM( CPIGV2 ) CPIGV2, '
                + 'SUM( CPNOGRAV ) CPNOGRAV,  SUM( IGV_GRA_NO_DEST ) IGV_GRA_NO_DEST,  SUM( ADQ_NO_GRAV ) ADQ_NO_GRAV, '
                + 'SUM( CP_OTROS ) CP_OTROS, SUM( CPDCTO ) CPDCTO, SUM( CPISC ) CPISC, '
                + 'SUM( CPSERVIC ) CPSERVIC, SUM( CPMTOORI ) CPMTOORI, '
                + 'SUM( CPMTOLOC ) CPMTOLOC, SUM( CPMTOEXT ) CPMTOEXT, SUM( CP4TA ) CP4TA, SUM( CPNODOM ) CPNODOM, SUM( CP2TA ) CP2TA, '
                + 'MAX( CASE WHEN TIPDET=''MG'' OR TIPDET=''NG'' OR TIPDET=''MN'' OR TIPDET=''AN'' THEN DCPGLOSA ELSE '' '' END ) GLOSA '
                + 'FROM ( '
                + 'SELECT CIAID, TDIARID, DCPANOMM, CPNOREG, DCPGLOSA, TIPDET, '
                + 'CASE WHEN TIPDET=''MG'' or TIPDET=''BI'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD, '
                + 'CASE WHEN TIPDET=''I1'' AND TREGID=''03'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV, '
                + 'CASE WHEN TIPDET=''NG'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD2, '
                + 'CASE WHEN TIPDET=''I3'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV2, '
                + 'CASE WHEN TIPDET=''MN'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPNOGRAV, '
                + 'CASE WHEN TIPDET=''I2'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END IGV_GRA_NO_DEST, '
                + 'CASE WHEN TIPDET=''AN'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END ADQ_NO_GRAV, '
                + 'CASE WHEN TIPDET=''OT'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CP_OTROS, '
                + 'CASE WHEN TIPDET=''DC'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPDCTO, '
                + 'CASE WHEN TIPDET=''SV'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPSERVIC, '
                + 'CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOORI, '
                + 'CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOLOC * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOLOC, '
                + 'CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOEXT * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOEXT, '
                + 'CASE WHEN TIPDET=''I2'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPISC, '
                + 'CASE WHEN TIPDET=''I1'' AND TREGID=''12'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CP4TA, '
                + '(CASE WHEN TIPDET=''I1'' AND TREGID=''14'' THEN ((CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END) * (CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END)) ELSE 0 END) CPNODOM, '
                + '(CASE WHEN TIPDET=''SC'' AND TREGID=''20'' THEN ((CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END) * (CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END)) ELSE 0 END) CP2TA '
                + 'FROM CXP302 '
                + 'WHERE CIAID=''' + dblcCia.text + ''' AND DCPANOMM=''' + dbeAnoMM.Text + ''' '
                + ') A '
                + 'GROUP BY CIAID, TDIARID, DCPANOMM, CPNOREG ) A '
                + ' WHERE ' + xEstado + xFiltroP1 + xFiltroP2
                + ' AND CXP301.CLAUXID=TGE201.CLAUXID(+) AND CXP301.PROV=TGE201.PROV(+)'
                + ' AND TGE110.DOCMOD=''CXP'' AND CXP301.DOCID=TGE110.DOCID '
                + ' AND CXP301.TDIARID=TGE104.TDIARID(+) '
                + ' AND TASAFLG = ''R'''
                + ' AND CXP301.CIAID=A.CIAID AND CXP301.TDIARID=A.TDIARID '
                + ' AND CXP301.CPANOMES=A.DCPANOMM AND CXP301.CPNOREG=A.CPNOREG '
                + ' AND CXP304.CIAID(+)=CXP301.CIAID '
                + ' and CXP304.CCPCANJE(+)=CXP301.CPCANJE '
                + ' and CXP304.Prov(+) = CXP301.Prov ';
      // Inicio HPC_201304_CXP
      //   If STRTOINT(dblcTDiario.Text) = 63 Then
      //      xSQL4 := xSQL4 + '     AND PORCDESC IS NOT NULL ';
      // Fin HPC_201304_CXP

           //Fin Nuevo Formato RCompras
         xSQL := xSQL1 + xSQL2 + xSQL3 + xSQL4;

      End;

     //** si el indice es mayo o igual a 3
      If (rgOrden.ItemIndex >= 3) Then
      Begin
      // Inicio HPC_201602_CXP
      // Se retira método de aplicación servidor que es antiguo
      //   DMCXP.DCOM1.AppServer.ParamDSPGraba('0', 'MOVCXP2');
      // Fin HPC_201602_CXP
         xSql := 'Select CXP301.CIAID, CXP301.CPANOMES, CXP301.TDIARID, CXP301.CPNOREG, '
               + 'CXP301.CLAUXID, CXP301.PROV, CXP301.PROVRUC, CXP301.DOCID, CXP301.CPSERIE, '
               + 'CXP301.CPNODOC, CXP301.CPFRECEP, CXP301.CPFEMIS, CXP301.CPFVCMTO, CXP301.TMONID, '
               + 'CXP301.CPTCAMPR, CXP301.CPTCAMPA,  CXP301.CPESTADO, CXP301.CP_CONTA, '
               + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
               + 'ELSE nvl(A.CPGRAVAD,0.00) end CPGRAVAD, '
               + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
               + 'ELSE nvl(A.CPNOGRAV,0.00) end CPNOGRAV, '
               + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
               + 'ELSE nvl(A.CPIGV,0.00) end CPIGV, '
               + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
               + 'ELSE nvl(A.CPISC,0.00) end CPISC, '
               + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
               + 'ELSE nvl(A.CPDCTO,0.00) end CPDCTO, '
               + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
               + 'ELSE nvl(A.CPSERVIC,0.00) end CPSERVIC, '
               + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
               + 'ELSE nvl(A.CPMTOORI,0.00) end CPMTOORI, '
               + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
               + 'ELSE nvl(A.CPMTOLOC,0.00) end CPMTOLOC, '
               + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
               + 'ELSE nvl(A.CPMTOEXT,0.00) end CPMTOEXT, '
               + 'CXP301.CPUSER, CXP301.CPFREG, CXP301.CPHREG, CXP301.CPFCMPRB, '
               + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
               + 'ELSE nvl(A.CPGRAVAD2,0.00) end CPGRAVAD2, '
               + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
               + 'ELSE nvl(A.CPIGV2,0.00) end CPIGV2, '
               + 'TGE201.PROVDES,TGE110.DOCDES, NVL(TGE110.DOCRESTA,'''') DOCRESTA, '
               + quotedstr(DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4)) + ' PERIODO, '
               + quotedstr(edtCia.Text) + ' CIADES, '
               + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
               + 'ELSE DECODE(TGE201.PROVRETIGV,' + quotedstr('S') + ',DECODE(GREATEST(A.CPIGV,0),0,DECODE(GREATEST(A.CPGRAVAD,0),0,TASAMTO,0),0),0) END COMPSUJRET,'
               + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
               + 'ELSE DECODE(TGE201.PROVRETIGV,' + quotedstr('S') + ',DECODE(GREATEST(A.CPIGV,0),0,DECODE(GREATEST(A.CPGRAVAD,TASAMTO),TASAMTO,round((A.CPGRAVAD+A.CPIGV)*TASACAN/100,2),0),0),0) END IGVRET '
               + ' ,CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
               + 'ELSE NVL(A.CPIGV,0)+NVL(A.CPIGV2,0) END CXPTOTIGV '
               + ' ,CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 '
               + 'ELSE NVL(A.CPGRAVAD,0)+NVL(A.CPGRAVAD2,0) END CXPTOTGRAVAD, '
               + ' CXP305.DOCID DOCIDR, CXP305.CPSERIE CPSERIER, CXP305.CPNODOC CPNODOCR, '
               + ' CASE WHEN TGE201.PROVRETIGV = ' + quotedstr('S') + ' THEN '
               + ' CASE WHEN A.CPIGV > 0 THEN '
               + ' CASE WHEN A.CPGRAVAD > TASAMTO THEN'
               + ' ''X'' ELSE '' '' END ELSE '' '' END ELSE '' '' END RETSN, '
               + '''' + DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4) + ''' PERIODO, '
               + '''' + edtCia.Text + ''' CIADES, '
               + '''' + 'Periodo : ' + DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4) + ''', '
               + '''' + xExpresado + ''' EXPRESADO, '
               + '''' + xCondicion + ''' CONDICION '
               + ', TGE104.TDIARDES '
               + ' From CXP301, TGE201, TGE110, TGE108, TGE104, CXP305, '
               + '( '
               + 'SELECT CIAID, TDIARID, DCPANOMM, CPNOREG,  SUM( CPGRAVAD )  CPGRAVAD, '
               + 'SUM( CPGRAVAD2 ) CPGRAVAD2,  SUM( CPNOGRAV ) CPNOGRAV,  SUM( CPIGV ) CPIGV, '
               + 'SUM( CPIGV2 ) CPIGV2, SUM( CPISC ) CPISC, SUM( CPDCTO ) CPDCTO, '
               + 'SUM( CPSERVIC ) CPSERVIC,  SUM( CPMTOORI ) CPMTOORI, '
               + 'SUM( CPMTOLOC ) CPMTOLOC, SUM( CPMTOEXT ) CPMTOEXT '
               + 'FROM ( '
               + 'SELECT CIAID, TDIARID, DCPANOMM, CPNOREG, '
               + 'CASE WHEN TIPDET=''MG'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD, '
               + 'CASE WHEN TIPDET=''NG'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD2, '
               + 'CASE WHEN TIPDET=''MN'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPNOGRAV, '
               + 'CASE WHEN TIPDET=''I1'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV, '
               + 'CASE WHEN TIPDET=''I3'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV2, '
               + 'CASE WHEN TIPDET=''I2'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPISC, '
               + 'CASE WHEN TIPDET=''DC'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPDCTO, '
               + 'CASE WHEN TIPDET=''SV'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPSERVIC, '
               + 'CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOLOC * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOORI, '
               + 'CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOLOC * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOLOC, '
               + 'CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOEXT * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOEXT '
               + 'FROM CXP302 '
               + 'WHERE CIAID=''' + dblcCia.text + ''' AND DCPANOMM=''' + dbeAnoMM.Text + ''' '
               + ') A '
               + 'GROUP BY CIAID, TDIARID, DCPANOMM, CPNOREG ) A '
               + ' Where ' + xEstado + xFiltroP1 + xFiltroP2
               + ' AND CXP301.CLAUXID=TGE201.CLAUXID(+) AND CXP301.PROV=TGE201.PROV(+) AND '
               + ' TGE110.DOCMOD(+)=''CXP'' AND CXP301.DOCID=TGE110.DOCID(+) AND '
               + ' CXP301.TDIARID=TGE104.TDIARID(+) AND '
               + ' TGE108.TASAFLG(+) = ' + quotedstr('R')
               + ' AND CXP301.CIAID=A.CIAID AND CXP301.TDIARID=A.TDIARID '
               + ' AND CXP301.CPANOMES=A.DCPANOMM AND CXP301.CPNOREG=A.CPNOREG'
               + ' AND CXP305.CIAID(+)=CXP301.CIAID and CXP305.DOCID2(+)=CXP301.DOCID '
               + ' and CXP305.CPSERIE2(+)=CXP301.CPSERIE and CXP305.CPNODOC2(+)=CXP301.CPNODOC'
               + ' and CXP305.CCPCANJE(+)=CXP301.CPCANJE ';
      End;
   End
   Else
   Begin
      Case rgEstado.ItemIndex Of
         0: xEstado := ' ( CXP301.CPESTADO=' + '''' + 'I' + '''' + ' ) AND ';
         1: xEstado := ' ( CXP301.CPESTADO=' + '''' + 'P' + '''' + ' OR '
                     + '   CXP301.CPESTADO=' + '''' + 'C' + '''' + ' ) AND ';
         2: xEstado := ' ( CXP301.CPESTADO=' + '''' + 'I' + '''' + ' OR '
                     + '   CXP301.CPESTADO=' + '''' + 'P' + '''' + ' OR '
                     + '   CXP301.CPESTADO=' + '''' + 'C' + '''' + ' OR '
                     + '   CXP301.CPESTADO=' + '''' + 'E' + '''' + ' ) AND ';
         3: xEstado := ' ( CXP301.CPESTADO=' + '''' + 'I' + '''' + ' OR '
                     + '   CXP301.CPESTADO=' + '''' + 'P' + '''' + ' OR '
                     + '   CXP301.CPESTADO=' + '''' + 'C' + '''' + ' ) AND ';
      End;
   End;

   If rgFormato.ItemIndex = 1 Then // Resumen por Cuenta
   Begin
      xSQL := 'Select X.CIAID, A.CIADES, CUENTAID, docresta,  sum( debe ) AS DEBE, sum( haber ) AS HABE, '
            + '      ''Periodo : ' + DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4) + ''' PERIODO '
            + '  From (select A.CIAID, A.CUENTAID, A.DCPDH, B.DOCRESTA, '
            + '               case when B.DOCRESTA=''S'' then sum(A.DCPMOLOC)*-1 else sum(A.DCPMOLOC) end MONTO, '
            + '               case when B.DOCRESTA=''S'' '
            + '                    then sum(case when A.DCPDH=''D'' then A.DCPMOLOC else 0 end)*-1 '
            + '                    else sum(case when A.DCPDH=''D'' then A.DCPMOLOC else 0 end) '
            + '               end DEBE, '
            + '               case when B.DOCRESTA= ''S'' '
            + '                    then sum(case when A.DCPDH=''H'' then A.DCPMOLOC else 0 end )*-1 '
            + '                    else sum(case when A.DCPDH=''H'' then A.DCPMOLOC else 0 end ) '
            + '               end HABER '
            + '          from CXP302 A, TGE110 B, CXP301 '
            + '         where ' + xEstado + xFiltroP1 + xFiltroP2
            + '           and A.CIAID(+)=' + '''' + dblcCia.Text + ''''
            + '           and A.DCPANOMM(+)=' + '''' + dbeAnoMM.Text + ''''
            + '           and (CXP301.CIAID = A.CIAID(+) '
            + '           and CXP301.TDIARID = A.TDIARID(+) '
            + '           and CXP301.CPNOREG = A.CPNOREG(+) )'
            + '           and (A.DOCID=B.DOCID) '
            + '         group by A.CIAID, A.CUENTAID, A.DCPDH, DOCRESTA) X, '
            + '       TGE101 A '
            + ' where X.CIAID=A.CIAID '
            + ' group by X.CIAID, A.CIADES, CUENTAID, DOCRESTA ';

      xSQL1 := 'Select CPDCTO '
            + '   from CXP301, CXP302 B '
            + '  where ' + xEstado + xFiltroP1 + xFiltroP2 + ' ';
      xWhere := '';

      xSQL1 := xSQL1 + ' AND B.DCPANOMM(+)=' + '''' + dbeAnoMM.Text + ''''
            + ' AND CXP301.CIAID = B.CIAID(+) '
            + ' AND CXP301.TDIARID = B.TDIARID(+) '
            + ' AND CXP301.CPNOREG = B.CPNOREG(+) '
            + ' group by cxp301.cpdcto';
      DMCXP.cdsQry.close;
      DMCXP.cdsQry.DataRequest(xSql1);
      DMCXP.cdsQry.open;
      DMCXP.cdsQry.first;
      xMenos := 0;
      While Not DMCXP.cdsQry.eof Do
      Begin
         xMenos := xMenos + DMCXP.cdsQry.FieldByName('CPDCTO').AsFloat;
         DMCXP.cdsQry.next;
      End;
   End;

   If rgFormato.ItemIndex = 2 Then // Resumen Contable
   Begin
      xSQL := ' select cuentaid, auxid AS DCPAUXID, serie AS CPSERIE, nodoc AS CPNODOC, '
            + '  max(femis) AS CPFEMIS, docresta, sum(debe) as DEBE, sum(haber) AS HABE, '
            + '''' + edtCia.Text + ''' CIADES, '
            + '''Periodo : ' + DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4) + ''' PERIODO '
            + ' from ( '
            + ' select a.ciaid, a.cuentaid, a.dcpdh, '
            + ' CASE WHEN c.cta_aux=''S'' THEN a.dcpauxid ELSE '' '' END auxid, '
            + ' CASE WHEN c.cta_aux=''S'' THEN a.cpserie ELSE '' '' END serie, '
            + ' CASE WHEN c.cta_aux=''S'' THEN a.cpnodoc ELSE '' '' END nodoc, '
            + ' CASE WHEN c.cta_aux=''S'' THEN a.cpfemis ELSE a.cpfemis END femis, '
            + ' b.docresta, '
            + ' CASE WHEN b.docresta= ''S'' THEN sum( a.dcpmoloc)*-1 ELSE sum(a.dcpmoloc) END monto, '
            + ' CASE WHEN b.docresta= ''S'' THEN sum( CASE WHEN a.dcpdh=''D'' THEN a.dcpmoloc ELSE 0 END )*-1 ELSE '
            + '   sum( CASE WHEN a.dcpdh=''D'' THEN a.dcpmoloc ELSE 0 END ) END debe, '
            + ' CASE WHEN b.docresta=''S'' THEN sum( CASE WHEN a.dcpdh=''H'' THEN a.dcpmoloc ELSE 0 END )*-1 ELSE '
            + '   sum( CASE WHEN a.dcpdh=''H'' THEN a.dcpmoloc ELSE 0 END ) END haber '
            + ' from cxp302 a, tge110 b, tge202 c, cxp301 '
            + ' WHERE ' + xEstado + xFiltroP1 + xFiltroP2
            + ' AND a.CIAID=' + '''' + dblcCia.Text + '''';

      xSQL := xSQL + ' AND a.DCPANOMM=' + '''' + dbeAnoMM.Text + ''''
            + ' AND (CXP301.CIAID = A.CIAID(+) '
            + ' AND CXP301.TDIARID = A.TDIARID(+) '
            + ' AND CXP301.CPNOREG = A.CPNOREG(+) )'
            + ' and ( a.docid=b.docid ) '
            + ' and ( a.ciaid=c.ciaid and a.cuentaid=c.cuentaid ) '
            + ' group by a.ciaid, a.cuentaid, a.dcpdh, c.cta_aux, c.cta_doc, '
            + ' a.dcpauxid, a.cpserie, a.cpnodoc, a.cpfemis,  docresta ) x '
            + ' group by cuentaid, auxid, serie, nodoc, docresta '
            + ' ORDER BY cuentaid, auxid, serie, nodoc ';

      xSql1 := 'SELECT cpdcto'
            + ' FROM CXP301, CXP302 B, TGE202 C '
            + ' WHERE ' + xEstado + xFiltroP1 + xFiltroP2 + ' ';
      xWhere := '';
      xSql1 := xSQL1 + ' AND B.DCPANOMM(+)=' + '''' + dbeAnoMM.Text + ''''
            + ' AND CXP301.CIAID = B.CIAID '
            + ' AND CXP301.TDIARID = B.TDIARID '
            + ' AND CXP301.CPNOREG = B.CPNOREG '
            + ' AND B.CIAID=C.CIAID '
            + ' AND B.CUENTAID=C.CUENTAID '
            + ' AND C.CTA_AUX<>''S'' '
            + ' GROUP BY CXP301.CPDCTO';
      DMCXP.cdsQry.close;
      DMCXP.cdsQry.DataRequest(xSql1);
      DMCXP.cdsQry.open;
      DMCXP.cdsQry.first;
      xMenos := 0;
      While Not DMCXP.cdsQry.eof Do
      Begin
         xMenos := xMenos + DMCXP.cdsQry.FieldByName('CPDCTO').AsFloat;
         DMCXP.cdsQry.next;
      End;
   End;

   If rgFormato.ItemIndex = 0 Then
   Begin

      Filtracds(DMCXP.cdsMovCxP2, xSql);
      Case rgOrden.ItemIndex Of
         0: DMCXP.cdsMovCxP2.IndexFieldNames := 'TDIARID;DOCID;CPNOREG';
         1: DMCXP.cdsMovCxP2.IndexFieldNames := 'TDIARID;DOCID;CPFCMPRB';
         2: DMCXP.cdsMovCxP2.IndexFieldNames := 'TDIARID;DOCID;PROV';
         3: DMCXP.cdsMovCxP2.IndexFieldNames := 'TDIARID;CPNOREG';
         4: DMCXP.cdsMovCxP2.IndexFieldNames := 'TDIARID;CPFCMPRB';
         5: DMCXP.cdsMovCxP2.IndexFieldNames := 'TDIARID;PROV';
      End;

      If chktodos.Checked Then
         sTemp := BuscaQry('dspTGE', 'TGE104', 'REGISTRO', 'TDIARID ' + sTDiarios + ' AND REGISTRO=''C'' ', 'REGISTRO')
      Else
         sTemp := DMCXP.DisplayDescrip('TGE104', 'REGISTRO', 'TDIARID', dblcTDiario.Text);
      ppdbMovCxP2.DataSource := DMCXP.dsMovCxP2;
      ppdbRC.DataSource := DMCXP.dsMovCxP2;
   End;

   If (rgFormato.ItemIndex = 1) Or (rgFormato.ItemIndex = 2) Then
   Begin
      Filtracds(DMCXP.cdsReporte, xSql);
      If DMCXP.cdsReporte.RecordCount > 0 Then
      Begin
         If rgFormato.ItemIndex = 1 Then
         Begin
            xMontoD := 0;
            xMontoH := 0;
            DMCXP.cdsReporte.First;
            While Not DMCXP.cdsReporte.Eof Do
            Begin
               DMCXP.cdsReporte.Edit;
               If (DMCXP.cdsReporte.FieldByName('DEBE').AsFloat <> 0) And
                  (DMCXP.cdsReporte.FieldByName('HABE').AsFloat <> 0) Then
               Begin
                  If DMCXP.cdsReporte.FieldByName('DEBE').AsFloat > DMCXP.cdsReporte.FieldByName('HABE').AsFloat Then
                  Begin
                     DMCXP.cdsReporte.FieldByName('DEBE').AsFloat := DMCXP.cdsReporte.FieldByName('DEBE').AsFloat -
                        DMCXP.cdsReporte.FieldByName('HABE').AsFloat;
                     DMCXP.cdsReporte.FieldByName('HABE').AsFloat := 0;
                  End;
                  If DMCXP.cdsReporte.FieldByName('HABE').AsFloat > DMCXP.cdsReporte.FieldByName('DEBE').AsFloat Then
                  Begin
                     DMCXP.cdsReporte.FieldByName('HABE').AsFloat := DMCXP.cdsReporte.FieldByName('HABE').AsFloat -
                        DMCXP.cdsReporte.FieldByName('DEBE').AsFloat;
                     DMCXP.cdsReporte.FieldByName('DEBE').AsFloat := 0;
                  End;
               End;
               DMCXP.cdsReporte.Next;
            End;
         End;
         If rgFormato.ItemIndex = 2 Then
         Begin
            xMontoD := 0;
            xMontoH := 0;
            DMCXP.cdsReporte.First;
            While Not DMCXP.cdsReporte.Eof Do
            Begin
               DMCXP.cdsReporte.Edit;
               If (DMCXP.cdsReporte.FieldByName('DEBE').AsFloat <> 0) And
                  (DMCXP.cdsReporte.FieldByName('HABE').AsFloat <> 0) Then
               Begin
                  If DMCXP.cdsReporte.FieldByName('DEBE').AsFloat > DMCXP.cdsReporte.FieldByName('HABE').AsFloat Then
                  Begin
                     DMCXP.cdsReporte.FieldByName('DEBE').AsFloat := DMCXP.cdsReporte.FieldByName('DEBE').AsFloat -
                        DMCXP.cdsReporte.FieldByName('HABE').AsFloat;
                     DMCXP.cdsReporte.FieldByName('HABE').AsFloat := 0;
                  End;
                  If DMCXP.cdsReporte.FieldByName('HABE').AsFloat > DMCXP.cdsReporte.FieldByName('DEBE').AsFloat Then
                  Begin
                     DMCXP.cdsReporte.FieldByName('HABE').AsFloat := DMCXP.cdsReporte.FieldByName('HABE').AsFloat -
                        DMCXP.cdsReporte.FieldByName('DEBE').AsFloat;
                     DMCXP.cdsReporte.FieldByName('DEBE').AsFloat := 0;
                  End;
               End;
               DMCXP.cdsReporte.Next;
            End;

         End;
      End;
      ppdbRegCta.DataSource := DMCXP.dsReporte;

   End;
   If xbExportarExcel = True Then
   Begin
      fg_ExportarExcel('FORMATO1');
      Exit;
   End;

// Graba Log de Consultas
   DMCXP.Graba_Log_Consultas(DMCXP.wModulo, DMCXP.wUsuario, 'Registro de Compras',
      dblcCia.Text, // Campañía
      dbeAnoMM.Text, '', // Periodo Inicio - Final
      '', '', // Fecha   Inicio - final
      '', '', // Nivel   - Origen
      '', inttostr(rgMoneda.itemindex), // Lote    -  Moneda
      '', '', // Cuentas - Auxiliares
      '', 'Impresora', // Costos - Tipo Salida
      inttostr(rgFormato.itemindex)); // Tipo Rep

   If rgFormato.ItemIndex = 0 Then
   Begin
   // Inicio HPC_201405_CXP (SPP_201405_CXP)
      If (rgOrden.ItemIndex = 0) Or (rgOrden.ItemIndex = 1) Or (rgOrden.ItemIndex = 2) Then
      Begin
         If (sTemp = 'C') and (STRTOINT(dblcTDiario.Text) <> 63) and (STRTOINT(dblcTDiario.Text) <> 64) Then
         Begin
            pprRCompras.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\REGISTROCOMPRATX.rtm';
            PaginarReporte(DMCXP.cdsMovCxP2, 'RCOM');
            pprRCompras.template.LoadFromFile;
            pprRCompras.DataPipeline := ppdbMovCxP2;
            If cbDiseno.Checked Then
            Begin
               ppDesigner1.Report := pprRCompras;
               ppDesigner1.ShowModal;
            End
            Else
            Begin
               pprRCompras.Print;
               pprRCompras.Stop;
               pprRCompras.DataPipeline := Nil;
            End;
         End;

         If (sTemp = '4') and (STRTOINT(dblcTDiario.Text) <> 63) Then
         Begin
            pprRCompras.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\REGISTRO4TACATEGORIATX.rtm';
            PaginarReporte(DMCXP.cdsMovCxP2, '4CAT');
            pprRCompras.template.LoadFromFile;
            pprRCompras.DataPipeline := ppdbMovCxP2;
            If cbDiseno.Checked Then
            Begin
               ppDesigner1.Report := pprRCompras;
               ppDesigner1.ShowModal;
            End
            Else
            Begin
               pprRCompras.Print;
               pprRCompras.Stop;
               pprRCompras.DataPipeline := Nil;
            End;
         End;

         If (sTemp = 'C') and (STRTOINT(dblcTDiario.Text) = 63) Then
         Begin

            pprRCompras.DataPipeline := ppdbMovCxP2;
            pprRCompras.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RegistroRegNoDomiciliado.rtm';
            pprRCompras.template.LoadFromFile;
            If cbDiseno.Checked Then
            Begin
               ppDesigner1.Report := pprRCompras;
               ppDesigner1.ShowModal;
            End
            Else
            Begin
               pprRCompras.Print;
               pprRCompras.Stop;
               pprRCompras.DataPipeline := Nil;
            End;
         {DMCXP.cdsRegNodom.IndexFieldNames := 'PORCDESC;'+DMCXP.cdsRegNodom.IndexFieldNames;
            pprRNodom.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RegistroRegNoDomiciliado.rtm';
            pprRNodom.template.LoadFromFile;
            pprRNodom.DataPipeline := ppdbRegNodom;
            If cbDiseno.Checked Then
            Begin
               ppDesigner1.Report := pprRNodom;
               ppDesigner1.ShowModal;
            End
            Else
            Begin
               pprRNodom.Print;
               pprRNodom.Stop;
               pprRNodom.DataPipeline := Nil;
            End;
            ppdbRegNodom.DataSource := Nil;
         }
         End;
              //cdsReg2daCat
         If (sTemp = 'C') and (STRTOINT(dblcTDiario.Text) = 64) Then
         Begin
            pprRCompras.DataPipeline := ppdbMovCxP2;
            pprRCompras.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RegistroReg2daCategoria.rtm';
            pprRCompras.template.LoadFromFile;
            If cbDiseno.Checked Then
            Begin
               ppDesigner1.Report := pprRCompras;
               ppDesigner1.ShowModal;
            End
            Else
            Begin
               pprRCompras.Print;
               pprRCompras.Stop;
               pprRCompras.DataPipeline := Nil;
            End;
            {DMCXP.cdsReg2daCat.IndexFieldNames := 'PORCDESC;'+DMCXP.cdsReg2daCat.IndexFieldNames;
            pprR2daCat.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RegistroReg2daCategoria.rtm';
            pprR2daCat.template.LoadFromFile;
            pprR2daCat.DataPipeline := ppdbReg2daCat;
            If cbDiseno.Checked Then
            Begin
               ppDesigner1.Report := pprR2daCat;
               ppDesigner1.ShowModal;
            End
            Else
            Begin
               pprR2daCat.Print;
               pprR2daCat.Stop;
               pprR2daCat.DataPipeline := Nil;
            End;
            ppdbReg2daCat.DataSource := Nil;
            }

         End;

         ppdbRegNodom.DataSource := Nil;
      End;

      If rgOrden.ItemIndex >= 3 Then
      Begin
         If sTemp = 'C' Then
         Begin
            ppdbRC.DataSource := DMCXP.dsMovCxP2;
            pprRC.DataPipeline := ppdbRC;
            pprRC.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RegCompra.rtm';
            pprRC.template.LoadFromFile;
            pprRC.Print;
            pprRC.Stop;
         End;

         If sTemp = '4' Then
         Begin
            If STRTOINT(dblcTDiario.Text) <> 63 Then
            Begin
               pprRCompras.DataPipeline := ppdbMovCxP2;
               pprRCompras.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\REGISTRO4TACATEGORIA.rtm';
               pprRCompras.template.LoadFromFile;
               pprRCompras.Print;
               pprRCompras.Stop;
            End
            Else
            Begin
               pprRCompras.DataPipeline := ppdbMovCxP2;
               pprRCompras.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RegistroRegNoDomiciliado.rtm';
               pprRCompras.template.LoadFromFile;
               pprRCompras.Print;
               pprRCompras.Stop;
            End;
         End;
      End;

      If not cbDiseno.Checked Then
      begin
         x10 := Self.ComponentCount - 1;
         While x10 > 0 Do
         Begin
            If Self.components[x10].Classname = 'TppGroup' Then
            Begin
               Self.components[x10].Free;
               x10 := x10 - 1;
            End;
            x10 := x10 - 1;
         End;
         ppdbMovCxP2.DataSource := Nil;
      End;
   // Fin HPC_201405_CXP (SPP_201405_CXP)
   End
   Else
      If rgFormato.ItemIndex = 1 Then
      Begin
         ppRegComCta.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RegComResCtaTX.rtm';
         ppRegComCta.template.LoadFromFile;
         ppRegComCta.DataPipeline := ppdbRegCta;
         If cbDiseno.Checked Then
         Begin
            ppd1.Report := ppRegComCta;
            ppd1.ShowModal;
         End
         Else
         Begin
            ppRegComCta.Print;
         End;
         ppRegComCta.DataPipeline := Nil;
         ppdbRegCta.DataSource := Nil;

         ppRegComCta.Stop;

         x10 := Self.ComponentCount - 1;
         While x10 > 0 Do
         Begin
            If Self.components[x10].Classname = 'TppGroup' Then
            Begin
               Self.components[x10].Free;
               x10 := x10 - 1;
            End;
            x10 := x10 - 1;
         End;
         ppdbRegCta.DataSource := Nil;
      End // Formato Resumen cuenta
      Else
         If rgFormato.ItemIndex = 2 Then
         Begin
            ppRegComCtbl.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RegComResCtblTX.rtm';
            ppRegComCtbl.Template.LoadFromFile;
            ppRegComCtbl.DataPipeline := ppdbRegCta;

            If cbDiseno.Checked Then
            Begin
               ppd1.Report := ppRegComCtbl;
               ppd1.ShowModal;
            End
            Else
            Begin
               ppRegComCtbl.Print;
               ppRegComCtbl.Stop;
            End;
            ppRegComCtbl.DataPipeline := Nil;
            ppdbRegCta.DataSource := Nil;

            x10 := Self.ComponentCount - 1;
            While x10 > 0 Do
            Begin
               If Self.components[x10].Classname = 'TppGroup' Then
               Begin
                  Self.components[x10].Free;
                  x10 := x10 - 1;
               End;
               x10 := x10 - 1;
            End;
         End;

   If rgFormato.ItemIndex = 0 Then
      DMCXP.cdsMovCxP2.CancelUpdates;
   DMCXP.cdsReporte.Close;
End;

Procedure TFCRegComp.CompletaRegistros;
Var
   xNum: Integer;
   xReg: String;
Begin
   DMCXP.cdsMovCxP2.First;
   xNum := StrToInt(dbeNoReg1.Text);
   While Not DMCXP.cdsMovCxP2.Eof Do
   Begin
      xReg := StrZero(IntToStr(xNum), DMCXP.cdsMovCxP2.FieldByName('CPNOREG').Size);
      If xReg < DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString Then
      Begin
         DMCXP.cdsMovCxP2.Insert;
         DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString := dblcCia.Text;
         DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString := dblcTDiario.Text;
         DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString := dbeAnoMM.Text;
         DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString := xReg;
         DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString := 'A';
         DMCXP.cdsMovCxP2.Post
      End;
      xNum := xNum + 1;
      DMCXP.cdsMovCxP2.Next;
   End;
End;

Procedure TFCRegComp.ppVarEstadoCalc(Sender: TObject; Var Value: Variant);
Begin
   If DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString = 'A' Then
   Begin
      ppdbProvRuc.Visible := False;
      ppdbProvDes.Visible := False;
      ppVarEstado.Visible := True;
      ppVarEstado.AutoSize := True;
      ppVarEstado.Text := 'A       N       U       L       A       D       O';
   End
   Else
   Begin
      If DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString = 'E' Then
      Begin
         ppdbProvRuc.Visible := False;
         ppdbProvDes.Visible := False;
         ppVarEstado.Visible := True;
         ppVarEstado.AutoSize := True;
         ppVarEstado.Text := 'E     L     I     M     I     N     A     D     O';
      End
      Else
      Begin
         ppVarEstado.Visible := False;
         ppdbProvRuc.Visible := True;
         ppdbProvDes.Visible := True;
      End;
   End;
End;

Procedure TFCRegComp.ppvIGravada1Calc(Sender: TObject; Var Value: Variant);
Begin
   If xMoneda = DMCXP.wTMonLoc Then
// Inicio HPC_201602_CXP
// DAF_2016000019_CXP_2
// Se usa la variable wTMonLocDes para descripción de la Moneda Local
      Value := 'Expresado en ' + DMCXP.wTMonLocDes
//      Value := 'Expresado en Nuevos Soles'
   Else
// Se usa la variable wTMonExtDes para descripción de la Moneda Extranjera
      Value := 'Expresado en ' + DMCXP.wTMonExtDes;
//      Value := 'Expresado en Dolares Americanos';
// Fin HPC_201602_CXP
End;

Procedure TFCRegComp.pprRComprasPreviewFormCreate(Sender: TObject);
Begin
   pprRCompras.PreviewForm.WindowState := WsMaximized;
   TppViewer(pprRCompras.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFCRegComp.dbeAnoMMExit(Sender: TObject);
Begin
   If bbtnBorra.Focused Then Exit;

   If length(dbeAnoMM.Text) = 0 Then
   Begin
      ShowMessage('Falta Ingresar Periodo');
      dbeAnoMM.SetFocus;
      Exit
   End;

   If length(dbeAnoMM.Text) < 6 Then
   Begin
      ShowMessage('Periodo No Valido');
      dbeAnoMM.SetFocus;
      Exit
   End;

   xFiltroP1 := 'CXP301.CIAID=' + '''' + dblcCia.Text + '''';
   If chktodos.Checked Then
      xFiltroP1 := xFiltroP1 + ' AND CXP301.TDIARID ' + sTDiarios
   Else
      xFiltroP1 := xFiltroP1 + ' AND CXP301.TDIARID=' + '''' + dblcTDiario.Text + '''';

   xFiltroP1 := xFiltroP1 + ' AND CXP301.CPANOMES=' + '''' + dbeAnoMM.Text + '''';
   Filtracds(DMCXP.cdsMovCxP2, 'Select * from CXP301 Where ' + xFiltroP1);

   rgOrden.SetFocus;
   rgOrden.ItemIndex := 0;
   rgOrdenClick(Sender);
End;

Procedure TFCRegComp.bbtnBorraClick(Sender: TObject);
Begin
   IniciaDatos;
   If dblcCia.Enabled Then
      dblcCia.Setfocus;
End;

Procedure TFCRegComp.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFCRegComp.ppVariable1Calc(Sender: TObject; Var Value: Variant);
Begin
   If rgEstado.ItemIndex = 0 Then Value := 'Estado: No Aceptados';
   If rgEstado.ItemIndex = 1 Then Value := 'Estado: Aceptados';
   If rgEstado.ItemIndex = 2 Then Value := 'Estado: Todos';
End;

Procedure TFCRegComp.ppVariable2Calc(Sender: TObject; Var Value: Variant);
Begin
   Value := DMCXP.cdsMovCxP2.RecordCount;
End;

Procedure TFCRegComp.ppVariable3Calc(Sender: TObject; Var Value: Variant);
Begin
   If DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString = 'I' Then
      Value := 'x'
   Else
      Value := ' ';
End;

Procedure TFCRegComp.ppRegComCtaPreviewFormCreate(Sender: TObject);
Begin
   ppRegComCta.PreviewForm.WindowState := WsMaximized;
   TppViewer(ppRegComCta.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFCRegComp.ppRegComCtblPreviewFormCreate(Sender: TObject);
Begin
   ppRegComCtbl.PreviewForm.WindowState := WsMaximized;
   TppViewer(ppRegComCtbl.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFCRegComp.ppVariable4Calc(Sender: TObject; Var Value: Variant);
Begin
   Value := Value + DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat;
End;

Procedure TFCRegComp.ppDBText4Print(Sender: TObject);
Begin
// Inicio HPC_201303_CXP
{
// si si va a retirar se debe actualizar el archivo RTM que tenga este evento
}
// Fin HPC_201303_CXP
End;

Procedure TFCRegComp.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Try
      DMCXP.cdsQry.IndexFieldNames := '';
      DMCXP.cdsQry.Filter := '';
      DMCXP.cdsQry.filtered := true;
      DMCXP.cdsQry2.Close;
      DMCXP.cdsQry2.filter := '';
      DMCXP.cdsQry2.filtered := False;
      DMCXP.cdsQry2.indexfieldnames := '';
      DMCXP.cdsCxP.IndexFieldNames := '';
   Except
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;
   FCRegComp := Nil;
   Action := caFree;
End;

Procedure TFCRegComp.ppSummaryBand2BeforePrint(Sender: TObject);
Begin
// Inicio HPC_201303_CXP
{
// si si va a retirar se debe actualizar el archivo RTM que tenga este evento
}
// Fin HPC_201303_CXP
End;

Procedure TFCRegComp.ppDetailBand2BeforePrint(Sender: TObject);
Begin
   If StrToFloat(ppDBText7.Text) < 0 Then
   Begin
      ppDBText7.DisplayFormat := '(###,###,##0.00)';
   End;
End;

Procedure TFCRegComp.ppVariable10Print(Sender: TObject);
Begin
// Inicio HPC_201303_CXP
{
// si si va a retirar se debe actualizar el archivo RTM que tenga este evento
}
// Fin HPC_201303_CXP
End;

Procedure TFCRegComp.ppDBText7Print(Sender: TObject);
Begin
   If StrToFloat(ppDBText7.Text) < 0 Then
   Begin
      ppDBText7.DisplayFormat := '(###,###,##0.00)';
   End;
End;

Procedure TFCRegComp.ppDBText5Print(Sender: TObject);
Begin
   If StrToFloat(ppDBText5.Text) < 0 Then
   Begin
      ppDBText5.Text := '(' + ppDBText5.Text + ')';
   End;

End;

Procedure TFCRegComp.ppDBCalc5Print(Sender: TObject);
Begin
   If StrToFloat(ppDBCalc5.Text) < 0 Then
   Begin
      ppDBCalc5.Text := '(' + ppDBCalc5.Text + ')';
   End;
End;

Procedure TFCRegComp.ppDBCalc4Print(Sender: TObject);
Begin
   If StrToFloat(ppDBCalc4.Text) < 0 Then
   Begin
      ppDBCalc4.Text := '(' + ppDBCalc4.Text + ')';
   End;
End;

Procedure TFCRegComp.ppvEstado2Calc(Sender: TObject; Var Value: Variant);
Begin
   If DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString = 'A' Then
   Begin
      ppdbtRuc.Visible := False;
      ppdbtProv.Visible := False;
      ppvEstado2.Visible := True;
      ppvEstado2.AutoSize := True;
      ppvEstado2.Text := ' A       N       U       L       A       D       O';
   End
   Else
   Begin
      If DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString = 'E' Then
      Begin
         ppdbtRuc.Visible := False;
         ppdbtProv.Visible := False;
         ppvEstado2.Visible := True;
         ppvEstado2.AutoSize := True;
         ppvEstado2.Text := ' E       L       I       M       I       N       A       D       O';
      End
      Else
      Begin
         ppvEstado2.Visible := False;
         ppdbtRuc.Visible := True;
         ppdbtProv.Visible := True;
      End;
   End;
End;

Procedure TFCRegComp.chktodosClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If chktodos.Checked = True Then
   Begin
      dblcTDiario.Visible := False;
      edtTDiario.Visible := False;
   End
   Else
      If chktodos.Checked = False Then
      Begin
         dblcTDiario.Visible := True;
         dblcTDiario.Text := '';
         edtTDiario.Visible := True;
         edtTDiario.Text := '';
      End;

   If chktodos.Checked Then
   Begin
      xSQL := 'Select TDIARID DIARIO FROM CXP301 '
            + ' where CIAID=' + Quotedstr(dblcCia.text)
            + ' group BY TDIARID';
      DMCXP.cdsQry2.IndexFieldNames;
      DMCXP.cdsQry2.Filter := '';
      DMCXP.cdsQry2.Filtered := False;
      DMCXP.cdsQry2.Close;
      DMCXP.cdsQry2.DataRequest(xSQL);
      DMCXP.cdsQry2.Open;
      sTDiarios := '';
      DMCXP.cdsQry2.First;
      While Not DMCXP.cdsQry2.Eof Do
      Begin
         If length(sTDiarios) = 0 Then
            sTDiarios := 'IN(' + '''' + DMCXP.cdsQry2.fieldbyname('DIARIO').AsString + ''
         Else
            sTDiarios := sTDiarios + ''' ,' + '''' + DMCXP.cdsQry2.fieldbyname('DIARIO').AsString + '';

         DMCXP.cdsQry2.Next;
         If DMCXP.cdsQry2.Eof Then
            sTDiarios := sTDiarios + ''') ';
      End;
   End;
End;

Procedure TFCRegComp.chktodosExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If chktodos.Checked = True Then
   Begin
      dblcTDiario.Visible := False;
      edtTDiario.Visible := False;
   End
   Else
      If chktodos.Checked = False Then
      Begin
         dblcTDiario.Visible := True;
         dblcTDiario.Text := '';
         edtTDiario.Visible := True;
         edtTDiario.Text := '';
      End;

   If chktodos.Checked Then
   Begin
      xSQL := 'Select TDIARID DIARIO '
            + '  from CXP301 '
            + ' where CIAID=' + Quotedstr(dblcCia.text)
            + ' group by TDIARID';
      DMCXP.cdsQry2.IndexFieldNames;
      DMCXP.cdsQry2.Filter := '';
      DMCXP.cdsQry2.Filtered := False;
      DMCXP.cdsQry2.Close;
      DMCXP.cdsQry2.DataRequest(xSQL);
      DMCXP.cdsQry2.Open;
      sTDiarios := '';
      DMCXP.cdsQry2.First;
      While Not DMCXP.cdsQry2.Eof Do
      Begin
         If length(sTDiarios) = 0 Then
            sTDiarios := ' IN (' + '''' + DMCXP.cdsQry2.fieldbyname('DIARIO').AsString + ''
         Else
            sTDiarios := sTDiarios + ''' ,' + '''' + DMCXP.cdsQry2.fieldbyname('DIARIO').AsString + '';

         DMCXP.cdsQry2.Next;
         If DMCXP.cdsQry2.Eof Then
            sTDiarios := sTDiarios + ''') ';
      End;
   End;
End;

Procedure TFCRegComp.FormShow(Sender: TObject);
Begin
// calcula valor de periodo aaaamm tomando como base la fecha del sistema
   Screen.Cursor := crHourGlass;
   wFechOk := True;
   DecodeDate(date, Year, Month, Day);
   wMes := inttostr(Month);
   If Month < 10 Then wMes := '0' + inttostr(Month);
   dbeAnoMM.Text := IntToStr(Year) + wMes;
   If dblcCia.enabled = True Then
      dblcCia.SetFocus;
   DMCXP.cdsTDoc.Filter := '';
   DMCXP.cdsTDoc.Filtered := True;

   Filtracds(DMCXP.cdsMovCxP2, 'SELECT * FROM CXP301 WHERE CIAID=''''');
   Filtracds(DMCXP.cdsTDiario, 'SELECT * FROM TGE104 WHERE REGISTRO in(''4'',''C'')');
   If DMCXP.cdsTDiario.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('Tipos de Diario no registra definición de Provisiones');
      exit;
   End;

// carga valor IGV desde tabla de Tasas e Impuestos TGE108
   wwTasaIGV := strtofloat(BuscaQry('PrvTGE', 'TGE108', 'TASACAN', 'TASAFLG=''I''', 'TASACAN'));

   IniciaDatos;
   Screen.Cursor := crDefault;
End;

Procedure TFCRegComp.FormCreate(Sender: TObject);
Begin
   CargaDataSource;
End;

Procedure TFCRegComp.CargaDataSource;
Begin
   dblcCia.DataSource := Nil;
   dblcCia.LookupTable := DMCXP.cdsCia;
   dblcTDiario.DataSource := Nil;
   dblcTDiario.LookupTable := DMCXP.cdsTDiario;
End;

Procedure TFCRegComp.ppHeaderBand1BeforePrint(Sender: TObject);
Begin
   xImpTotalxPag := True;

   pplFec.Visible := False;
   ppsvFec.Visible := False;
   If (cbFecRep.Checked) And (dtpFecRep.Date > 0) Then
   Begin
      pplFec.Text := Datetostr(dtpFecRep.Date);
      pplFec.Visible := True;
   End
   Else
      ppsvFec.Visible := True;
End;

Procedure TFCRegComp.ppFooterBand1BeforePrint(Sender: TObject);
Begin
// Inicio HPC_201303_CXP
{
// si si va a retirar se debe actualizar el archivo RTM que tenga este evento
}
// Fin HPC_201303_CXP
End;

Procedure TFCRegComp.ppGroupFooterBand1AfterPrint(Sender: TObject);
Begin
   xImpTotalxPag := False;
End;

Procedure TFCRegComp.bbtnNuevoClick(Sender: TObject);
Var
   flagFech: Boolean;
   xEstado, xSql, xSql1, xCuenta, wSQL, xOper, xExpresado, xCONDICION, xWhere: String;
   xMontoD, xMontoH, xMonto: double;
   xSQL2, xSQL3, xSQL4: String;
   x10: Integer;
Begin
// Validar Parámetros
   If rgOrden.ItemIndex < 0 Then
   Begin
      ShowMessage('Error : Seleccionar Orden del Reporte');
      rgOrden.SetFocus;
      Exit;
   End;

   If rgFormato.ItemIndex > 0 Then
   Begin
      ShowMessage('Error : Reporte solo para Formato Detallado');
      Exit;
   End;

   flagFech := False;
   If edtCia.Text = '' Then Raise exception.Create('Compañia no válida');

   DMCXP.cdsReporte.Close;

   If chktodos.Checked Then
   Begin
      xSQL := 'SELECT TDIARID DIARIO FROM CXP301 '
            + ' WHERE CIAID=' + Quotedstr(dblcCia.text)
            + ' GROUP BY TDIARID';
      DMCXP.cdsQry2.IndexFieldNames;
      DMCXP.cdsQry2.Filter := '';
      DMCXP.cdsQry2.Filtered := False;
      DMCXP.cdsQry2.Close;
      DMCXP.cdsQry2.DataRequest(xSQL);
      DMCXP.cdsQry2.Open;
      sTDiarios := '';
      DMCXP.cdsQry2.First;
      While Not DMCXP.cdsQry2.Eof Do
      Begin
         If length(sTDiarios) = 0 Then
            sTDiarios := 'IN(' + '''' + DMCXP.cdsQry2.fieldbyname('DIARIO').AsString + ''
         Else
            sTDiarios := sTDiarios + ''' ,' + '''' + DMCXP.cdsQry2.fieldbyname('DIARIO').AsString + '';

         DMCXP.cdsQry2.Next;
         If DMCXP.cdsQry2.Eof Then
            sTDiarios := sTDiarios + ''') ';
      End;
   End
   Else
      If dblcTDiario.Text = '' Then Raise exception.Create('Diario no válido');

   If length(dbeAnoMM.Text) <> 6 Then Raise exception.Create('Periodo no válido');
   Case rgOrden.ItemIndex Of
      0:
         Begin // No. de Registro
            If (dbeNoReg1.Text = '') Or (dbeNoReg2.Text = '') Then
               Raise exception.Create('Ingrese rango inferior y superior');
         End;
      1:
         Begin // Fecha Reg.
            flagFech := True;
            If (dbdtpFReg1.Date = 0) Or (dbdtpFReg1.Date = 0) Then
               Raise exception.Create('Ingrese rango inferior y superior');
            If Not (wFechOk) Then Raise exception.Create('Fecha no coincide con el periodo');
         End;
      2:
         Begin // Proveedor
            If (dblcdProv1.Text = '') Or (dblcdProv2.Text = '') Then
               Raise exception.Create('Ingrese rango inferior y superior');
         End;
      3:
         Begin // No. de Registro
            If (dbeNoReg1.Text = '') Or (dbeNoReg2.Text = '') Then
               Raise exception.Create('Ingrese rango inferior y superior');
         End;
      4:
         Begin // Fecha Reg.
            flagFech := True;
            If (dbdtpFReg1.Date = 0) Or (dbdtpFReg1.Date = 0) Then
               Raise exception.Create('Ingrese rango inferior y superior');
            If Not (wFechOk) Then Raise exception.Create('Fecha no coincide con el periodo');
         End;
      5:
         Begin // Proveedor
            If (dblcdProv1.Text = '') Or (dblcdProv2.Text = '') Then
               Raise exception.Create('Ingrese rango inferior y superior');
         End;

   End;

   If flagFech Then
   Begin
      pplblDel.Visible := True;
      pplblFecIni.Visible := True;
      pplblFecIni.Caption := datetostr(dbdtpFReg1.Date);
      pplblAl.Visible := True;
      pplblFecFin.Visible := True;
      pplblFecFin.Caption := datetostr(dbdtpFReg2.Date);
   End;

   Case rgMoneda.ItemIndex Of
      0:
         Begin
            xMoneda := DMCXP.wTMonLoc;
// Inicio HPC_201602_CXP
// DAF_2016000019_CXP_2 Se usa la variable wTMonLocDes para descripción de la Moneda Local
            xExpresado := 'Expresado en ' + DMCXP.wTMonLocDes ;
//            xExpresado := 'Expresado en Nuevos Soles';
// Fin HPC_201602_CXP
            xOper := '*';
         End;
      1:
         Begin
            xMoneda := DMCXP.wTMonExt;
// Inicio HPC_201602_CXP
// DAF_2016000019_CXP_2 Se usa la variable wTMonExtDes para descripción de la Moneda Extranjera
            xExpresado := 'Expresado en ' + DMCXP.wTMonExtDes ;
//            xExpresado := 'Expresado en Dolares';
// Fin HPC_201602_CXP
            xOper := '/';
         End;
   End;

   Case rgEstado.ItemIndex Of
      0: xCondicion := 'Estado: No Aceptados';
      1: xCondicion := 'Estado: Aceptados';
      2: xCondicion := 'Estado: Todos';
      3: xCondicion := 'Estado: Todos sin Eliminados';
   End;

   Case rgOrden.ItemIndex Of
      0: xFiltroP2 := ' AND CXP301.CPNOREG>=' + '''' + dbeNoReg1.Text + ''''
                    + ' AND CXP301.CPNOREG<=' + '''' + dbeNoReg2.Text + '''';
      1: xFiltroP2 := ' AND CXP301.CPFCMPRB>=' + DMCXP.wRepFuncDate + '''' + FormatDateTime(DMCXP.wFormatFecha, dbdtpFReg1.Date) + '''' + ')'
                    + ' AND CXP301.CPFCMPRB<=' + DMCXP.wRepFuncDate + '''' + FormatDateTime(DMCXP.wFormatFecha, dbdtpFReg2.Date) + '''' + ')';
      2: xFiltroP2 := ' AND CXP301.PROV>=' + '''' + dblcdProv1.Text + ''''
                    + ' AND CXP301.PROV<=' + '''' + dblcdProv2.Text + '''';
      3: xFiltroP2 := ' AND CXP301.CPNOREG>=' + '''' + dbeNoReg1.Text + ''''
                    + ' AND CXP301.CPNOREG<=' + '''' + dbeNoReg2.Text + '''';
      4: xFiltroP2 := ' AND CXP301.CPFCMPRB>=' + DMCXP.wRepFuncDate + '''' + FormatDateTime(DMCXP.wFormatFecha, dbdtpFReg1.Date) + '''' + ')'
                    + ' AND CXP301.CPFCMPRB<=' + DMCXP.wRepFuncDate + '''' + FormatDateTime(DMCXP.wFormatFecha, dbdtpFReg2.Date) + '''' + ')';
      5: xFiltroP2 := ' AND CXP301.PROV>=' + '''' + dblcdProv1.Text + ''''
                    + ' AND CXP301.PROV<=' + '''' + dblcdProv2.Text + '''';
   End;

   Case rgEstado.ItemIndex Of
      0: xEstado := '(CXP301.CPESTADO=' + '''' + 'I' + '''' + ') AND ';
      1: xEstado := '(CXP301.CPESTADO=' + '''' + 'P' + '''' + ' OR '
                  + 'CXP301.CPESTADO=' + '''' + 'C' + '''' + ' OR '
                  + 'CXP301.CPESTADO=' + '''' + 'A' + '''' + ') AND ';
      2: xEstado := '(CXP301.CPESTADO=' + '''' + 'I' + '''' + ' OR '
                  + 'CXP301.CPESTADO=' + '''' + 'P' + '''' + ' OR '
                  + 'CXP301.CPESTADO=' + '''' + 'C' + '''' + ' OR '
                  + 'CXP301.CPESTADO=' + '''' + 'E' + '''' + ' OR '
                  + 'CXP301.CPESTADO=' + '''' + 'A' + '''' + ') AND ';
      3: xEstado := '(CXP301.CPESTADO=' + '''' + 'I' + '''' + ' OR '
                  + 'CXP301.CPESTADO=' + '''' + 'P' + '''' + ' OR '
                  + 'CXP301.CPESTADO=' + '''' + 'C' + '''' + ' OR '
                  + 'CXP301.CPESTADO=' + '''' + 'A' + '''' + ') AND ';
   End;

  ///////////////////////////
  //     DETALLADO         //
  ///////////////////////////

   If rgFormato.ItemIndex = 0 Then
   Begin
     //** Si el indice es 0,1 y 2
      If (rgOrden.ItemIndex = 0) Or (rgOrden.ItemIndex = 1) Or (rgOrden.ItemIndex = 2) Then
      Begin
         xSQL1 := 'SELECT CXP301.CIAID, CXP301.CPANOMES, CXP301.TDIARID, CXP301.CPNOREG, '
                + '       CXP301.CLAUXID, CXP301.PROV, CXP301.PROVRUC, CXP301.DOCID, '
                + '       CXP301.CPSERIE, CXP301.CPNODOC, CXP301.CPFRECEP, CXP301.CPFEMIS, '
                + '       CXP301.CPFVCMTO, CXP301.TMONID, CXP301.CPTCAMPR, CXP301.CPTCAMPA, '
                + '       CXP301.CPESTADO, CXP301.CP_CONTA, CXP301.FECDEPDET, CXP301.NUMDEPDET, '
                + '       CXP301.CPTODETRSUNATID, CXP301.TIPOOPERSUNATID, CXP301.DTRPORC, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPGRAVAD,0.00) end CPGRAVAD, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPIGV,0.00) end CPIGV, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPGRAVAD2,0.00) end CPGRAVAD2, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPIGV2,0.00) end CPIGV2, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPNOGRAV,0.00) end CPNOGRAV, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.IGV_GRA_NO_DEST,0.00) end IGV_GRA_NO_DEST, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.ADQ_NO_GRAV,0.00) end ADQ_NO_GRAV, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CP_OTROS,0.00) end CP_OTROS, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPDCTO,0.00) end CPDCTO, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPISC,0.00) end CPISC, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPSERVIC,0.00) end CPSERVIC, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CP4TA,0.00) end CP4TA, '
                + '       DECODE( CPESTADO,''A'',0, DECODE( CPESTADO,''E'',0, ROUND( NVL( A.CPMTOORI, 0) ' + xOper + ' DECODE(trim(CXP301.TMONID),' + QuotedStr(xMoneda) + ', 1, CPTCAMPR) * DECODE(DOCRESTA,' + QuotedStr('S') + ', -1, 1 ), 2 ) )) CPMTOORI, '
                + '       DECODE( CPESTADO,''A'',0, DECODE( CPESTADO,''E'',0, DECODE( ' + QuotedStr(trim(xMoneda)) + ', ' + QuotedStr(trim(DMCXP.wTMonLoc)) + ', NVL( A.CPMTOLOC,0), NVL( A.CPMTOEXT,0) ) )) CPMTOLOC, '
                + '       DECODE( trim(CXP301.TMONID),' + QuotedStr(trim(DMCXP.wTMonLoc)) + ', 0, DECODE( CPESTADO,''A'', 0, DECODE( CPESTADO,''E'', 0, NVL( A.CPMTOEXT,0)) ) ) CPMTOEXT, '
                + '       CXP301.CPUSER, CXP301.CPFREG, CXP301.CPHREG, CXP301.CPFCMPRB,  '
                + '       TGE201.PROVDES,TGE110.DOCDES, NVL(TGE110.DOCRESTA,'' '') DOCRESTA, '
                + quotedstr(DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4)) + ' PERIODO, '
                + quotedstr(edtCia.Text) + ' CIADES, ';

         If wCiaRetIgv = 'S' Then
         Begin
            xSQL2 :=
                  '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' '
                + '            THEN 0 '
                + '            ELSE CASE WHEN nvl(TGE201.PROVRETIGV,''N'') = ' + quotedstr('S')
                + '                      THEN CASE WHEN nvl(A.CPIGV,0) > 0 '
                + '                                THEN CASE WHEN nvl(A.CPGRAVAD,0) > nvl(TASAMTO,0) '
                + '                                          THEN nvl(A.CPGRAVAD,0)+nvl(A.CPIGV,0) '
                + '                                          ELSE 0 '
                + '                                     END '
                + '                                ELSE 0 '
                + '                           END '
                + '                      ELSE 0 '
                + '                 END '
                + '       END COMPSUJRET,'
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' '
                + '            THEN 0 '
                + '            ELSE CASE WHEN nvl(TGE201.PROVRETIGV,''N'') = ' + quotedstr('S')
                + '                      THEN CASE WHEN nvl(A.CPIGV,0) > 0 '
                + '                                THEN CASE WHEN nvl(A.CPGRAVAD,0) > nvl(TASAMTO,0) '
                + '                                          THEN (nvl(A.CPGRAVAD,0)+nvl(A.CPIGV,0))*nvl(TASACAN,0)/100 '
                + '                                          ELSE 0 '
                + '                                     END '
                + '                                ELSE 0 '
                + '                           END '
                + '                      ELSE 0 '
                + '                 END '
                + '       END IGVRET ';
         End
         Else
         Begin
            xSQL2 := ' 0 COMPSUJRET, 0 IGVRET ';
         End;
         xSQL3 := '     , CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0 ELSE NVL( A.CPIGV,0)+NVL( A.CPIGV2,0) END CXPTOTIGV, '
                + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0  ELSE NVL( A.CPGRAVAD,0)+NVL( A.CPGRAVAD2,0) END CXPTOTGRAVAD, '
                + '       CASE WHEN TGE201.PROVRETIGV = ' + quotedstr('S') + ' THEN '
                + '       CASE WHEN A.CPIGV > 0 THEN '
                + '       CASE WHEN A.CPGRAVAD > TASAMTO THEN'
                + '       ''X'' ELSE '' '' END ELSE '' '' END ELSE '' '' END RETSN, '
                + '       ''' + DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4) + ''' PERIODO, '
                + '       ''' + edtCia.Text + ''' CIADES, '
                + '       ''' + 'Periodo : ' + DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4) + ''', '
                + '       ''' + xExpresado + ''' EXPRESADO, '
                + '       ''' + xCondicion + ''' CONDICION '
                + '     , TGE104.TDIARDES '
                + '     , ''PERIODO : ' + DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4) + ''' PERIODO '
                + '     , ''' + edtCia.Text + ''' COMPANIA, A.GLOSA '
                + '     , 0 NUMPAGINA '
                + '     , TGE201.TIPPERID TIPOPERSONA'
                + '     , CXP301.CPTCAMPR TIPOCAMBIO'
                + '     , (select CXP301_A.CPFEMIS from CXP301 CXP301_A '
                + '       where CXP304.CIAID = CXP301_A.CIAID '
                + '         and CXP304.DOCID = CXP301_A.DOCID '
                + '         and CXP304.CPSERIE = CXP301_A.CPSERIE '
                + '         and CXP304.CPNODOC = CXP301_A.CPNODOC '
                + '         and CXP304.Prov = CXP301_A.Prov '
                + '         and CXP304.TCANJEID = ' + QuotedStr('NC')
                + '         and rownum = 1 ) NC_FECHA_DOC'
                + '     , CXP304.DOCID NC'
                + '     , CXP304.CPSERIE NC_SERIE'
                + '     , CXP304.CPNODOC NC_DOC'
                + '  FROM CXP301, TGE201, TGE110, TGE108, TGE104,  CXP304, ';

         xSQL4 := '( '
                + 'select CIAID, TDIARID, DCPANOMM, CPNOREG,  SUM(CPGRAVAD) CPGRAVAD, '
                + '       SUM( CPIGV ) CPIGV,  SUM( CPGRAVAD2 ) CPGRAVAD2,  SUM( CPIGV2 ) CPIGV2, '
                + '       SUM( CPNOGRAV ) CPNOGRAV,  SUM( IGV_GRA_NO_DEST ) IGV_GRA_NO_DEST,  SUM( ADQ_NO_GRAV ) ADQ_NO_GRAV, '
                + '       SUM( CP_OTROS ) CP_OTROS, SUM( CPDCTO ) CPDCTO, SUM( CPISC ) CPISC, '
                + '       SUM( CPSERVIC ) CPSERVIC, SUM( CPMTOORI ) CPMTOORI, '
                + '       SUM( CPMTOLOC ) CPMTOLOC, SUM( CPMTOEXT ) CPMTOEXT, SUM( CP4TA ) CP4TA, '
                + '       MAX( CASE WHEN TIPDET=''MG'' OR TIPDET=''NG'' OR TIPDET=''MN'' OR TIPDET=''AN'' THEN DCPGLOSA ELSE '' '' END ) GLOSA '
                + '  FROM ( '
                + '        SELECT CIAID, TDIARID, DCPANOMM, CPNOREG, DCPGLOSA, TIPDET,'
                + '               CASE WHEN TIPDET=''MG'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD, '
                + '               CASE WHEN TIPDET=''I1'' AND TREGID=''03'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV, '
                + '               CASE WHEN TIPDET=''NG'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD2, '
                + '               CASE WHEN TIPDET=''I3'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV2, '
                + '               CASE WHEN TIPDET=''MN'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPNOGRAV, '
                + '               CASE WHEN TIPDET=''I2'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END IGV_GRA_NO_DEST, '
                + '               CASE WHEN TIPDET=''AN'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END ADQ_NO_GRAV, '
                + '               CASE WHEN TIPDET=''OT'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CP_OTROS, '
                + '               CASE WHEN TIPDET=''DC'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPDCTO, '
                + '               CASE WHEN TIPDET=''SV'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPSERVIC, '
                + '               CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOORI, '
                + '               CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOLOC * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOLOC, '
                + '               CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOEXT * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOEXT, '
                + '               CASE WHEN TIPDET=''I2'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPISC, '
                + '               CASE WHEN TIPDET=''I1'' AND TREGID=''12'' THEN CASE WHEN ''' + xMoneda + '''=''' + DMCXP.wTMonLoc + ''' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CP4TA '
                + '          FROM CXP302 '
                + '         WHERE CIAID=''' + dblcCia.text + ''' AND DCPANOMM=''' + dbeAnoMM.Text + ''' '
                + '       ) A '
                + ' group by CIAID, TDIARID, DCPANOMM, CPNOREG ) A '
                + ' where ' + xEstado + xFiltroP1 + xFiltroP2
                + '   and CXP301.CLAUXID=TGE201.CLAUXID(+) AND CXP301.PROV=TGE201.PROV(+)'
                + '   and TGE110.DOCMOD=''CXP'' AND CXP301.DOCID=TGE110.DOCID '
                + '   and CXP301.TDIARID=TGE104.TDIARID(+) '
                + '   and TASAFLG = ''R'''
                + '   and CXP301.CIAID=A.CIAID AND CXP301.TDIARID=A.TDIARID '
                + '   and CXP301.CPANOMES=A.DCPANOMM AND CXP301.CPNOREG=A.CPNOREG '
                + '   and CXP304.CIAID(+)=CXP301.CIAID '
                + '   and CXP304.CCPCANJE(+)=CXP301.CPCANJE '
                + '   and CXP304.Prov(+) = CXP301.Prov ';
         xSQL := xSQL1 + xSQL2 + xSQL3 + xSQL4;

      End;

      If (rgOrden.ItemIndex >= 3) Then
      Begin
      // Inicio HPC_201602_CXP
      // Se retira método de aplicación servidor que es antiguo
      //   DMCXP.DCOM1.AppServer.ParamDSPGraba('0', 'MOVCXP2');
      // Fin HPC_201602_CXP
         xSql := 'Select CXP301.CIAID, CXP301.CPANOMES, CXP301.TDIARID, CXP301.CPNOREG, '
                + '       CXP301.CLAUXID, CXP301.PROV, CXP301.PROVRUC, CXP301.DOCID, CXP301.CPSERIE, '
                + '       CXP301.CPNODOC, CXP301.CPFRECEP, CXP301.CPFEMIS, CXP301.CPFVCMTO, CXP301.TMONID, '
                + '       CXP301.CPTCAMPR, CXP301.CPTCAMPA,  CXP301.CPESTADO, CXP301.CP_CONTA, '
                + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPGRAVAD,0.00)  end CPGRAVAD, '
                + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPNOGRAV,0.00)  end CPNOGRAV, '
                + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPIGV,0.00)     end CPIGV, '
                + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPISC,0.00)     end CPISC, '
                + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPDCTO,0.00)    end CPDCTO, '
                + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPSERVIC,0.00)  end CPSERVIC, '
                + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPMTOORI,0.00)  end CPMTOORI, '
                + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPMTOLOC,0.00)  end CPMTOLOC, '
                + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPMTOEXT,0.00)  end CPMTOEXT, '
                + '       CXP301.CPUSER, CXP301.CPFREG, CXP301.CPHREG, CXP301.CPFCMPRB, '
                + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPGRAVAD2,0.00) end CPGRAVAD2, '
                + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPIGV2,0.00)    end CPIGV2, '
                + '       TGE201.PROVDES,TGE110.DOCDES, NVL(TGE110.DOCRESTA,'''') DOCRESTA, '
                + quotedstr(DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4)) + ' PERIODO, '
                + quotedstr(edtCia.Text) + ' CIADES, '
                + '       case when CPESTADO=''A'' or CPESTADO=''E'' '
                + '            then 0.00 '
                + '            else DECODE(TGE201.PROVRETIGV,' + quotedstr('S') + ',DECODE(GREATEST(A.CPIGV,0),0,DECODE(GREATEST(A.CPGRAVAD,0),0,TASAMTO,0),0),0) END COMPSUJRET,'
                + '       case when CPESTADO=''A'' or CPESTADO=''E'' '
                + '            then 0.00 '
                + '            else DECODE(TGE201.PROVRETIGV,' + quotedstr('S') + ',DECODE(GREATEST(A.CPIGV,0),0,DECODE(GREATEST(A.CPGRAVAD,TASAMTO),TASAMTO,round((A.CPGRAVAD+A.CPIGV)*TASACAN/100,2),0),0),0) END IGVRET, '
                + '       case when CPESTADO=''A'' OR CPESTADO=''E'' then 0.00 else NVL(A.CPIGV,0)+NVL(A.CPIGV2,0) END CXPTOTIGV, '
                + '       case when CPESTADO=''A'' OR CPESTADO=''E'' then 0.00 else NVL(A.CPGRAVAD,0)+NVL(A.CPGRAVAD2,0) END CXPTOTGRAVAD, '
                + '       CXP305.DOCID DOCIDR, CXP305.CPSERIE CPSERIER, CXP305.CPNODOC CPNODOCR, '
                + '       case when TGE201.PROVRETIGV = ' + quotedstr('S')
                + '            then case when A.CPIGV > 0 '
                + '                      then case when A.CPGRAVAD > TASAMTO '
                + '                                then ''X'' else '' '' end else '' '' end else '' '' end RETSN, '
                + quotedstr(DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4)) + ' PERIODO, '
                + quotedstr(edtCia.Text) + ' CIADES, '
                + quotedstr('Periodo : ' + DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4)) + ', '
                + quotedstr(xExpresado) + ' EXPRESADO, '
                + quotedstr(xCondicion) + ' CONDICION, '
                + '       TGE104.TDIARDES '
                + '  From CXP301, TGE201, TGE110, TGE108, TGE104, CXP305, '
                + '      (select CIAID, TDIARID, DCPANOMM, CPNOREG,  SUM( CPGRAVAD )  CPGRAVAD, '
                + '              SUM( CPGRAVAD2 ) CPGRAVAD2,  SUM( CPNOGRAV ) CPNOGRAV,  SUM( CPIGV ) CPIGV, '
                + '              SUM( CPIGV2 ) CPIGV2, SUM( CPISC ) CPISC, SUM( CPDCTO ) CPDCTO, '
                + '              SUM( CPSERVIC ) CPSERVIC,  SUM( CPMTOORI ) CPMTOORI, '
                + '              SUM( CPMTOLOC ) CPMTOLOC, SUM( CPMTOEXT ) CPMTOEXT '
                + '         from (select CIAID, TDIARID, DCPANOMM, CPNOREG, '
                + '                      CASE WHEN TIPDET=''MG'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD, '
                + '                      CASE WHEN TIPDET=''NG'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD2, '
                + '                      CASE WHEN TIPDET=''MN'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPNOGRAV, '
                + '                      CASE WHEN TIPDET=''I1'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV, '
                + '                      CASE WHEN TIPDET=''I3'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV2, '
                + '                      CASE WHEN TIPDET=''I2'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPISC, '
                + '                      CASE WHEN TIPDET=''DC'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPDCTO, '
                + '                      CASE WHEN TIPDET=''SV'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPSERVIC, '
                + '                      CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOLOC * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOORI, '
                + '                      CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOLOC * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOLOC, '
                + '                      CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOEXT * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOEXT '
                + '                 from CXP302 '
                + '                where CIAID=''' + dblcCia.text + ''' AND DCPANOMM=''' + dbeAnoMM.Text + ''' '
                + '               ) A '
                + '        group by CIAID, TDIARID, DCPANOMM, CPNOREG '
                + '      ) A '
                + ' Where ' + xEstado + xFiltroP1 + xFiltroP2
                + '   and CXP301.CLAUXID=TGE201.CLAUXID(+) AND CXP301.PROV=TGE201.PROV(+) '
                + '   and TGE110.DOCMOD(+)=''CXP'' AND CXP301.DOCID=TGE110.DOCID(+) '
                + '   and CXP301.TDIARID=TGE104.TDIARID(+) '
                + '   and TGE108.TASAFLG(+) = ' + quotedstr('R')
                + '   and CXP301.CIAID=A.CIAID AND CXP301.TDIARID=A.TDIARID '
                + '   and CXP301.CPANOMES=A.DCPANOMM AND CXP301.CPNOREG=A.CPNOREG'
                + '   and CXP305.CIAID(+)=CXP301.CIAID and CXP305.DOCID2(+)=CXP301.DOCID '
                + '   and CXP305.CPSERIE2(+)=CXP301.CPSERIE and CXP305.CPNODOC2(+)=CXP301.CPNODOC'
                + '   and CXP305.CCPCANJE(+)=CXP301.CPCANJE ';
      End;
   End
   Else
   Begin
      Case rgEstado.ItemIndex Of
         0: xEstado := ' ( CXP301.CPESTADO=' + '''' + 'I' + '''' + ' ) AND ';
         1: xEstado := ' ( CXP301.CPESTADO=' + '''' + 'P' + '''' + ' OR '
                     + 'CXP301.CPESTADO=' + '''' + 'C' + '''' + ' ) AND ';
         2: xEstado := ' ( CXP301.CPESTADO=' + '''' + 'I' + '''' + ' OR '
                     + 'CXP301.CPESTADO=' + '''' + 'P' + '''' + ' OR '
                     + 'CXP301.CPESTADO=' + '''' + 'C' + '''' + ' OR '
                     + 'CXP301.CPESTADO=' + '''' + 'E' + '''' + ' ) AND ';
         3: xEstado := ' ( CXP301.CPESTADO=' + '''' + 'I' + '''' + ' OR '
                     + 'CXP301.CPESTADO=' + '''' + 'P' + '''' + ' OR '
                     + 'CXP301.CPESTADO=' + '''' + 'C' + '''' + ' ) AND ';
      End;
   End;

   If rgFormato.ItemIndex = 0 Then
   Begin
      Filtracds(DMCXP.cdsMovCxP2, xSql);
      Case rgOrden.ItemIndex Of
         0: DMCXP.cdsMovCxP2.IndexFieldNames := 'TDIARID;DOCID;CPNOREG';
         1: DMCXP.cdsMovCxP2.IndexFieldNames := 'TDIARID;DOCID;CPFCMPRB';
         2: DMCXP.cdsMovCxP2.IndexFieldNames := 'TDIARID;DOCID;PROV';
         3: DMCXP.cdsMovCxP2.IndexFieldNames := 'TDIARID;CPNOREG';
         4: DMCXP.cdsMovCxP2.IndexFieldNames := 'TDIARID;CPFCMPRB';
         5: DMCXP.cdsMovCxP2.IndexFieldNames := 'TDIARID;PROV';
      End;

      If chktodos.Checked Then
         sTemp := BuscaQry('dspTGE', 'TGE104', 'REGISTRO', 'TDIARID ' + sTDiarios + ' AND REGISTRO=''C'' ', 'REGISTRO')
      Else
         sTemp := DMCXP.DisplayDescrip('TGE104', 'REGISTRO', 'TDIARID', dblcTDiario.Text);

      ppdbMovCxP2.DataSource := DMCXP.dsMovCxP2;
      ppdbRC.DataSource := DMCXP.dsMovCxP2;

   End;

   // Graba Log de Consultas
   DMCXP.Graba_Log_Consultas(DMCXP.wModulo, DMCXP.wUsuario, 'Registro de Compras',
      dblcCia.Text, // Campañía
      dbeAnoMM.Text, '', // Periodo Inicio - Final
      '', '', // Fecha   Inicio - final
      '', '', // Nivel   - Origen
      '', inttostr(rgMoneda.itemindex), // Lote    -  Moneda
      '', '', // Cuentas - Auxiliares
      '', 'Impresora', // Costos - Tipo Salida
      inttostr(rgFormato.itemindex)); // Tipo Rep

   If (rgFormato.ItemIndex = 1) Or (rgFormato.ItemIndex = 2) Then
   Begin
      Filtracds(DMCXP.cdsReporte, xSql);
      If DMCXP.cdsReporte.RecordCount > 0 Then
      Begin
         If rgFormato.ItemIndex = 1 Then
         Begin
            xMontoD := 0;
            xMontoH := 0;
            DMCXP.cdsReporte.First;
            While Not DMCXP.cdsReporte.Eof Do
            Begin
               DMCXP.cdsReporte.Edit;
               If (DMCXP.cdsReporte.FieldByName('DEBE').AsFloat <> 0) And
                  (DMCXP.cdsReporte.FieldByName('HABE').AsFloat <> 0) Then
               Begin
                  If DMCXP.cdsReporte.FieldByName('DEBE').AsFloat > DMCXP.cdsReporte.FieldByName('HABE').AsFloat Then
                  Begin
                     DMCXP.cdsReporte.FieldByName('DEBE').AsFloat := DMCXP.cdsReporte.FieldByName('DEBE').AsFloat -
                        DMCXP.cdsReporte.FieldByName('HABE').AsFloat;
                     DMCXP.cdsReporte.FieldByName('HABE').AsFloat := 0;
                  End;
                  If DMCXP.cdsReporte.FieldByName('HABE').AsFloat > DMCXP.cdsReporte.FieldByName('DEBE').AsFloat Then
                  Begin
                     DMCXP.cdsReporte.FieldByName('HABE').AsFloat := DMCXP.cdsReporte.FieldByName('HABE').AsFloat -
                        DMCXP.cdsReporte.FieldByName('DEBE').AsFloat;
                     DMCXP.cdsReporte.FieldByName('DEBE').AsFloat := 0;
                  End;
               End;
               DMCXP.cdsReporte.Next;
            End;
         End;
         If rgFormato.ItemIndex = 2 Then
         Begin

            xMontoD := 0;
            xMontoH := 0;
            DMCXP.cdsReporte.First;
            While Not DMCXP.cdsReporte.Eof Do
            Begin
               DMCXP.cdsReporte.Edit;
               If (DMCXP.cdsReporte.FieldByName('DEBE').AsFloat <> 0) And
                  (DMCXP.cdsReporte.FieldByName('HABE').AsFloat <> 0) Then
               Begin
                  If DMCXP.cdsReporte.FieldByName('DEBE').AsFloat > DMCXP.cdsReporte.FieldByName('HABE').AsFloat Then
                  Begin
                     DMCXP.cdsReporte.FieldByName('DEBE').AsFloat := DMCXP.cdsReporte.FieldByName('DEBE').AsFloat -
                        DMCXP.cdsReporte.FieldByName('HABE').AsFloat;
                     DMCXP.cdsReporte.FieldByName('HABE').AsFloat := 0;
                  End;
                  If DMCXP.cdsReporte.FieldByName('HABE').AsFloat > DMCXP.cdsReporte.FieldByName('DEBE').AsFloat Then
                  Begin
                     DMCXP.cdsReporte.FieldByName('HABE').AsFloat := DMCXP.cdsReporte.FieldByName('HABE').AsFloat -
                        DMCXP.cdsReporte.FieldByName('DEBE').AsFloat;
                     DMCXP.cdsReporte.FieldByName('DEBE').AsFloat := 0;
                  End;
               End;
               DMCXP.cdsReporte.Next;
            End;

         End;
      End;
      ppdbRegCta.DataSource := DMCXP.dsReporte;
   End;

   If rgFormato.ItemIndex = 0 Then
   Begin
      If (rgOrden.ItemIndex = 0) Or (rgOrden.ItemIndex = 1) Or (rgOrden.ItemIndex = 2) Then
      Begin
         If sTemp = 'C' Then
            pprRCompras.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\REGISTROCOMPRATX.rtm';
         If sTemp = '4' Then
            pprRCompras.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\REGISTRO4TACATEGORIATX.rtm';
         pprRCompras.template.LoadFromFile;

         ppdbtIGV2.DataField := 'CPIGV2';
         ppdbcT1IGV2.DataField := 'CPIGV2';
         ppDBCalc42.DataField := 'CPIGV2';
         ppdbcT3IGV2.DataField := 'CPIGV2';

         pprRCompras.DataPipeline := ppdbMovCxP2;
         If cbDiseno.Checked Then
         Begin
            ppDesigner1.Report := pprRCompras;
            ppDesigner1.ShowModal;
         End
         Else
         Begin
            pprRCompras.Print;
            pprRCompras.Stop;
         End;
         pprRCompras.DataPipeline := Nil;
         ppdbMovCxP2.DataSource := Nil;
      End;

      If rgOrden.ItemIndex >= 3 Then
      Begin
         If FImpresion.wFlTexto = 'G' Then
         Begin
            If sTemp = 'C' Then
            Begin
               ppdbRC.DataSource := DMCXP.dsMovCxP2;
               pprRC.DataPipeline := ppdbRC;
               pprRC.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RegCompra.rtm';
               pprRC.template.LoadFromFile;
            End;

            If sTemp = '4' Then
            Begin
               ppdbMovCxP2.DataSource := DMCXP.dsMovCxP2;
               pprRCompras.DataPipeline := ppdbMovCxP2;
               pprRCompras.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\REGISTRO4TACATEGORIA.rtm';
               pprRCompras.template.LoadFromFile;
            End;
         End;

         If FImpresion.wFlTexto = 'T' Then
         Begin
            If sTemp = 'C' Then
            Begin
               ppdbRC.DataSource := DMCXP.dsMovCxP2;
               pprRC.DataPipeline := ppdbRC;
               pprRC.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RegCompraTX.rtm';
               pprRC.template.LoadFromFile;
               pprRC.Print;
               pprRC.Stop;
            End;
            If sTemp = '4' Then
            Begin
               ppdbMovCxP2.DataSource := DMCXP.dsMovCxP2;
               pprRCompras.DataPipeline := ppdbMovCxP2;
               pprRCompras.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\REGISTRO4TACATEGORIATX.rtm';
               pprRCompras.template.LoadFromFile;
               pprRCompras.Print;
               pprRCompras.Stop;
            End;
         End;
      End;

      x10 := Self.ComponentCount - 1;
      While x10 > 0 Do
      Begin
         If Self.components[x10].Classname = 'TppGroup' Then
         Begin
            Self.components[x10].Free;
            x10 := x10 - 1;
         End;
         x10 := x10 - 1;
      End;
      ppdbMovCxP2.DataSource := Nil;
   End
   Else
      If rgFormato.ItemIndex = 1 Then
      Begin
         ppRegComCta.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RegComResCtaTX.rtm';

         ppRegComCta.template.LoadFromFile;

         ppRegComCta.DataPipeline := ppdbRegCta;
         If cbDiseno.Checked Then
         Begin
            ppd1.Report := ppRegComCta;
            ppd1.ShowModal;
         End
         Else
         Begin
            ppRegComCta.Print;
         End;
         ppRegComCta.DataPipeline := Nil;
         ppdbRegCta.DataSource := Nil;

         ppRegComCta.Stop;

         x10 := Self.ComponentCount - 1;
         While x10 > 0 Do
         Begin
            If Self.components[x10].Classname = 'TppGroup' Then
            Begin
               Self.components[x10].Free;
               x10 := x10 - 1;
            End;
            x10 := x10 - 1;
         End;
         ppdbRegCta.DataSource := Nil;
      End // Formato Resumen cuenta
      Else
         If rgFormato.ItemIndex = 2 Then
         Begin
            ppRegComCtbl.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RegComResCtblTX.rtm';

            ppRegComCtbl.Template.LoadFromFile;

            ppRegComCtbl.DataPipeline := ppdbRegCta;
            If cbDiseno.Checked Then
            Begin
               ppd1.Report := ppRegComCtbl;
               ppd1.ShowModal;
            End
            Else
            Begin
               ppRegComCtbl.Print;
            End;
            ppRegComCtbl.DataPipeline := Nil;
            ppdbRegCta.DataSource := Nil;

            ppRegComCtbl.Stop;

            x10 := Self.ComponentCount - 1;
            While x10 > 0 Do
            Begin
               If Self.components[x10].Classname = 'TppGroup' Then
               Begin
                  Self.components[x10].Free;
                  x10 := x10 - 1;
               End;
               x10 := x10 - 1;
            End;
         End;

   If rgFormato.ItemIndex = 0 Then
      DMCXP.cdsMovCxP2.CancelUpdates;
   DMCXP.cdsReporte.Close;

End;

//Inicio Nuevo formato RCompras

Procedure TFCRegComp.PaginarReporte(xxCds: TwwClientDataSet; xxTipoRep: String);
Var
   xRegxPag: Integer;
   xNumFila, xNumPagina: Integer;
   xDocId, xDocId_Ant: String;
Begin
   xRegxPag := 40;
   xNumFila := 0;
   xNumPagina := 1;
   If xxCds.recordcount = 0 Then
      exit
   Else
      xxCds.first;
   xDocId_Ant := xxCds.FieldByName('DOCID').asString;
   While Not xxCds.Eof Do
   Begin
      xxCds.Edit;
      xDocId := xxCds.FieldByName('DOCID').asString;
      If xxTipoRep = '4CAT' Then
         xDocId_Ant := xDocId;
      If (xNumFila >= xRegxPag) Or (xDocId_Ant <> xDocId) Then
      Begin
         xNumPagina := xNumPagina + 1;
         xNumFila := 0
      End;
      xxCds.FieldByName('NUMPAGINA').asInteger := xNumPagina;
      xDocId_Ant := xDocId;
      xNumFila := xNumFila + 1;
      xxCds.Next;
   End;
End;

Procedure TFCRegComp.cbFecRepClick(Sender: TObject);
Begin
   If cbFecRep.Checked Then
      gbFecRep.Enabled := True
   Else
      gbFecRep.Enabled := False;
End;

Procedure TFCRegComp.BitBtn1Click(Sender: TObject);
Var
   xSQL, xsql1, xsql2: String;
Begin

   xSQL1 := 'Select to_char(cpfemis,''yyyymm'') mes_emi, a.* from ( '
          + 'SELECT CXP301.CIAID, CXP301.CPANOMES, CXP301.TDIARID, CXP301.CPNOREG, CXP301.PROVRUC, CXP301.DOCID, CXP301.CPSERIE, CXP301.CPNODOC, CXP301.CPFEMIS, CXP301.TMONID, CXP301.CPTCAMPR, CXP301.CPESTADO, '
          + '  CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPGRAVAD,0.00) end B_IMPONIBLE, CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPIGV,0.00) end IGV,                        '
          + '  CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPGRAVAD2,0.00) end B_IMP_MIXTA, CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPIGV2,0.00) end IGV_MIXTA,                 '
          + '  CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPNOGRAV,0.00) end BI_GRAV_DEST_NO_GRAV, CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.IGV_GRA_NO_DEST,0.00) end IGV_GRA_NO_DEST,'
          + '  CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.ADQ_NO_GRAV,0.00) end ADQ_NO_GRAV, CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CP_OTROS,0.00) end OTROS,'
          + '  CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPDCTO,0.00) end CPDCTO,'
          + '  DECODE( CPESTADO,''A'',0, DECODE( CPESTADO,''E'',0, DECODE( ''N'', ''N'', NVL( A.CPMTOLOC,0), NVL( A.CPMTOEXT,0) ) )) TOTAL,'
          + '  CXP301.CPFCMPRB, TGE201.PROVDES, TGE110.DOCDES, NVL(TGE110.DOCRESTA,'' '') DOCRESTA, TGE104.TDIARDES , '
          + quotedstr(DMCXP.DisplayDescrip('TGE181', 'MESDESL', 'MESIDR', copy(dbeAnoMM.Text, 5, 2)) + ' - ' + copy(dbeAnoMM.Text, 1, 4)) + ' PERIODO  '
          + 'FROM CXP301, TGE201, TGE110, TGE108, TGE104,'
          + '( SELECT CIAID, TDIARID, DCPANOMM, CPNOREG,  SUM( CPGRAVAD )  CPGRAVAD, SUM( CPIGV ) CPIGV,  SUM( CPGRAVAD2 ) CPGRAVAD2, SUM( CPIGV2 ) CPIGV2, SUM( CPNOGRAV ) CPNOGRAV,'
          + '    SUM( IGV_GRA_NO_DEST ) IGV_GRA_NO_DEST,  SUM( ADQ_NO_GRAV ) ADQ_NO_GRAV, SUM( CP_OTROS ) CP_OTROS, SUM( CPDCTO ) CPDCTO, SUM( CPISC ) CPISC, SUM( CPSERVIC ) CPSERVIC,'
          + '    SUM( CPMTOORI ) CPMTOORI, SUM( CPMTOLOC ) CPMTOLOC, SUM( CPMTOEXT ) CPMTOEXT, SUM( CP4TA ) CP4TA'
          + '  FROM ';
   xSQL2 := '  (SELECT CIAID, TDIARID, DCPANOMM, CPNOREG, DCPGLOSA, TIPDET,'
          + '     CASE WHEN TIPDET=''MG'' THEN CASE WHEN ''N''=''N'' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD,'
          + '     CASE WHEN TIPDET=''I1'' AND TREGID=''03'' THEN CASE WHEN ''N''=''N'' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV, '
          + '     CASE WHEN TIPDET=''NG'' THEN CASE WHEN ''N''=''N'' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD2,'
          + '     CASE WHEN TIPDET=''I3'' THEN CASE WHEN ''N''=''N'' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV2,    '
          + '     CASE WHEN TIPDET=''MN'' THEN CASE WHEN ''N''=''N'' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPNOGRAV,                      '
          + '     CASE WHEN TIPDET=''I2'' THEN CASE WHEN ''N''=''N'' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END IGV_GRA_NO_DEST,                '
          + '     CASE WHEN TIPDET=''AN'' THEN CASE WHEN ''N''=''N'' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END ADQ_NO_GRAV,                     '
          + '     CASE WHEN TIPDET=''OT'' THEN CASE WHEN ''N''=''N'' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CP_OTROS,                         '
          + '     CASE WHEN TIPDET=''DC'' THEN CASE WHEN ''N''=''N'' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPDCTO,                            '
          + '     CASE WHEN TIPDET=''SV'' THEN CASE WHEN ''N''=''N'' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPSERVIC,                         '
          + '     CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN CASE WHEN ''N''=''N'' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOORI,          '
          + '     CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOLOC * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOLOC,                                                   '
          + '     CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOEXT * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOEXT,                                                   '
          + '     CASE WHEN TIPDET=''I2'' THEN CASE WHEN ''N''=''N'' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPISC,                            '
          + '     CASE WHEN TIPDET=''I1'' AND TREGID=''12'' THEN CASE WHEN ''N''=''N'' THEN DCPMOLOC ELSE DCPMOEXT END * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CP4TA             '
          + '   FROM CXP302 WHERE CIAID=''' + dblcCia.text + ''' AND DCPANOMM=''' + dbeAnoMM.Text + '''  ) A    '
          + 'GROUP BY CIAID, TDIARID, DCPANOMM, CPNOREG ) A                                                                                                                          '
          + 'WHERE (CXP301.CPESTADO=''P'' OR CXP301.CPESTADO=''C'' OR CXP301.CPESTADO=''A'')                                                                                               '
          + '  AND CXP301.CIAID=''' + dblcCia.text + ''' and ' + xFiltroP1
          + '  AND CXP301.CPANOMES=''' + dbeAnoMM.Text + ''' '
          + ' AND CXP301.CLAUXID=TGE201.CLAUXID(+) AND CXP301.PROV=TGE201.PROV(+) AND TGE110.DOCMOD=''CXP'' AND CXP301.DOCID=TGE110.DOCID AND CXP301.TDIARID=TGE104.TDIARID(+) AND TASAFLG = ''R'''
          + ' AND CXP301.CIAID=A.CIAID AND CXP301.TDIARID=A.TDIARID AND CXP301.CPANOMES=A.DCPANOMM AND CXP301.CPNOREG=A.CPNOREG'
          + ') a '
          + 'order by to_char(cpfemis,''yyyymm''), docid, cpnoreg ';
   xSQL := xsql1 + xsql2;
   DMCXP.cdsQry.close;
   DMCXP.cdsQry.DataRequest(xSql);
   DMCXP.cdsQry.open;
   dbgData.DataSource := DMCXP.dsQry;

   // Graba Log de Consultas
   DMCXP.Graba_Log_Consultas(DMCXP.wModulo, DMCXP.wUsuario, 'Registro de Compras IGV 18 y 19%',
      dblcCia.Text, // Campañía
      dbeAnoMM.Text, '', // Periodo Inicio - Final
      '', '', // Fecha   Inicio - final
      '', '', // Nivel   - Origen
      '', inttostr(rgMoneda.itemindex), // Lote    -  Moneda
      '', '', // Cuentas - Auxiliares
      '', 'Excel', // Costos - Tipo Salida
      inttostr(rgFormato.itemindex)); // Tipo Rep

   dmcxp.ExportaGridExcel(dbgData, 'Registro_Compras');

End;

Procedure TFCRegComp.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFCRegComp.btnExportarExcelClick(Sender: TObject);
Begin
   xbExportarExcel := True;
   bbtnOkClick(Self);
   xbExportarExcel := False;
End;

Procedure TFCRegComp.fg_ExportarExcel(wgFormato: String);
Begin
   dbgRegCompras.Selected.Clear;
   If wgFormato = 'FORMATO1' Then
   Begin
      dbgRegCompras.Selected.Add('CIAID'#9'8'#9'Compañía'#9'F');
      dbgRegCompras.Selected.Add('CPANOMES'#9'8'#9'Periodo'#9'F');
      dbgRegCompras.Selected.Add('TDIARID'#9'6'#9'TDiario'#9'F');
      dbgRegCompras.Selected.Add('CPNOREG'#9'8'#9'NºRegistro'#9'F');
      dbgRegCompras.Selected.Add('CPFEMIS'#9'8'#9'FechaEmisión'#9'F');
      dbgRegCompras.Selected.Add('DOCID'#9'4'#9'TDoc'#9'F');
      dbgRegCompras.Selected.Add('DOCDES'#9'18'#9'TipoDocumento'#9'F');
      dbgRegCompras.Selected.Add('CPFVCMTO'#9'8'#9'FechaVencimiento'#9'F');
      dbgRegCompras.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
      dbgRegCompras.Selected.Add('CPNODOC'#9'8'#9'NumDocumento'#9'F');
      dbgRegCompras.Selected.Add('TIPOPERSONA'#9'8'#9'TPersona'#9'F');
      dbgRegCompras.Selected.Add('PROVRUC'#9'11'#9'RUC'#9'F');
      dbgRegCompras.Selected.Add('PROVDES'#9'15'#9'Proveedor'#9'F');
      dbgRegCompras.Selected.Add('GLOSA'#9'15'#9'Glosa'#9'F');
      dbgRegCompras.Selected.Add('CPGRAVAD'#9'8'#9'BaseImponCredFisc100'#9'F');
      dbgRegCompras.Selected.Add('CPIGV'#9'8'#9'IGV_100'#9'F');
      dbgRegCompras.Selected.Add('CPGRAVAD2'#9'8'#9'BaseImponMixto'#9'F');
      dbgRegCompras.Selected.Add('CPIGV2'#9'8'#9'IgvMixto'#9'F');
      dbgRegCompras.Selected.Add('CPNOGRAV'#9'8'#9'BaseImponGC'#9'F');
      dbgRegCompras.Selected.Add('IGV_GRA_NO_DEST'#9'8'#9'IGV_GC'#9'F');
      dbgRegCompras.Selected.Add('ADQ_NO_GRAV'#9'8'#9'Adq_NoGravadas'#9'F');
      dbgRegCompras.Selected.Add('CP_OTROS'#9'8'#9'OtrosCargos'#9'F');
      dbgRegCompras.Selected.Add('CPDCTO'#9'8'#9'Descuento'#9'F');
      dbgRegCompras.Selected.Add('CPMTOLOC'#9'8'#9'Total'#9'F');
      dbgRegCompras.Selected.Add('CPMTOEXT'#9'8'#9'Importe$'#9'F');
      dbgRegCompras.Selected.Add('CPTCAMPR'#9'6'#9'TipoCambio'#9'F');
      dbgRegCompras.Selected.Add('CPTODETRSUNATID'#9'8'#9'TipoDetraccion'#9'F');
      dbgRegCompras.Selected.Add('TIPOOPERSUNATID'#9'8'#9'TipoOperacion'#9'F');
      dbgRegCompras.Selected.Add('DTRPORC'#9'8'#9'PorcDetraccion'#9'F');
      dbgRegCompras.Selected.Add('NUMDEPDET'#9'8'#9'NumDetracción'#9'F');
      dbgRegCompras.Selected.Add('FECDEPDET'#9'8'#9'FecDetracción'#9'F');
      dbgRegCompras.Selected.Add('NC_FECHA_DOC'#9'8'#9'NC_Fec'#9'F');
      dbgRegCompras.Selected.Add('NC'#9'5'#9'NC_TDoc'#9'F');
      dbgRegCompras.Selected.Add('NC_SERIE'#9'6'#9'NC_Serie'#9'F');
      dbgRegCompras.Selected.Add('NC_DOC'#9'8'#9'NC_Doc'#9'F');

   End;

   dbgRegCompras.DataSource := DMCXP.dsMovCxP2;
   Try
      Screen.Cursor := crHourGlass;
      dbgRegCompras.ExportOptions.ExportType := wwgetSYLK;
      dbgRegCompras.ExportOptions.FileName := 'RegistroCompras_' + dbeAnoMM.Text + '.slk';
      dbgRegCompras.ExportOptions.Save; //el primero genera error
      dbgRegCompras.ExportOptions.Save;
      ShellExecute(Handle, 'Open', PChar(dbgRegCompras.ExportOptions.Filename), Nil, Nil, sw_shownormal);
      Screen.Cursor := crDefault;
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;
End;

Procedure TFCRegComp.fg_PLEexportarFormato(wgPeriodo, wgRutaArchivo: String);
Var
   xsSql: String;
   xfArchivoTexto: TextFile;
   xsDelimitador: String;

   xsPeriodoRC: String;

   xsCorrelativo: String;
   xdFecEmi: String;
   xdFecPag: String;
   xsDocId: String;
   xsSerie: String;
   xsAnio: String;
   xsNoDoc: String;
   xsImpOpeDia: String;
   xsProvDocId: String;
   xsProvDocNum: String;
   xsProvRazSoc: String;
   xsBasImp: String;
   xsIgv: String;
   xsBasImpMixto: String;
   xsIgvMixto: String;
   xsBasImpGas: String;
   xsIgvGas: String;
   xsAdqNoGrav: String;
   xsImpIsc: String;
   xsImpOtros: String;
   xsImpTotal: String;
   xsTipoCambio: String;
   xsModFecEmi: String;
   xsModDocId: String;
   xsModSerie: String;
   xsModNoDoc: String;
   xsNumDocNoDom: String;
   xsFecDetraccion: String;
   xsNumDetraccion: String;
   xsFlgRet: String;
   xsFlgMod: String;
Begin
   xsDelimitador := '|';
   xsSql := ' SELECT CXP_REG_COM.*, '
           +'        TO_CHAR(CXP_REG_COM.FECEMI,' + QuotedStr('YYYYMM') + ') PERIODODOC '
           +'   FROM CXP_REG_COM '
           +'  WHERE PERIODO = ' + QuotedStr(wgPeriodo);
   DMCXP.cdsQry.close;
   DMCXP.cdsQry.DataRequest(xsSql);
   DMCXP.cdsQry.open;

   AssignFile(xfArchivoTexto, wgRutaArchivo);
   Rewrite(xfArchivoTexto);
   While Not DMCXP.cdsQry.Eof Do
   Begin
      xsPeriodoRC := wgPeriodo + '00';
      xsCorrelativo := DMCXP.cdsQry.FieldByName('CORRELATIVO').AsString;
      xdFecEmi := DMCXP.cdsQry.FieldByName('FECEMI').AsString;
      If DMCXP.cdsQry.FieldByName('DOCID').AsString = '14' Then
      Begin
         xdFecPag := DMCXP.cdsQry.FieldByName('FECPAG').AsString;
      End
      Else
      Begin
         xdFecPag := DMCXP.cdsQry.FieldByName('FECPAG').AsString;
      End;
      xsDocId := DMCXP.cdsQry.FieldByName('DOCID').AsString;
      xsSerie := DMCXP.cdsQry.FieldByName('CPSERIE').AsString;
      If Length(xsSerie) = 0 Then
      Begin
         xsSerie := '-';
      End
      Else
         If Length(xsSerie) < 4 Then
         Begin
            xsSerie := StringOfChar('0', 4 - Length(xsSerie)) + xsSerie;
         End
         Else
            If Length(xsSerie) < 6 Then
            Begin
               xsSerie := StringOfChar('0', 6 - Length(xsSerie)) + xsSerie;
            End;
      xsAnio := '0';

      xsNoDoc := StringReplace(DMCXP.cdsQry.FieldByName('CPNODOC').AsString, '-', '', [rfreplaceall]);
      xsImpOpeDia := DMCXP.cdsQry.FieldByName('IMPOPEDIA').AsString;
      xsProvDocId := DMCXP.cdsQry.FieldByName('PROVDOCID').AsString;
      If Length(xsProvDocId) = 0 Then
      Begin
         xsProvDocId := '0';
      End;
      xsProvDocNum := DMCXP.cdsQry.FieldByName('PROVDOCNUM').AsString;
      If Length(xsProvDocNum) = 0 Then
      Begin
         xsProvDocNum := '-';
      End;
      xsProvRazSoc := DMCXP.cdsQry.FieldByName('PROVRAZSOC').AsString;
      If Length(xsProvRazSoc) = 0 Then
      Begin
         xsProvRazSoc := '-';
      End;
      xsBasImp := FormatFloat('##0.00', DMCXP.cdsQry.FieldByName('BASIMP').AsFloat);

      xsIgv := FormatFloat('##0.00', DMCXP.cdsQry.FieldByName('IGV').AsFloat);
      xsBasImpMixto := FormatFloat('##0.00', DMCXP.cdsQry.FieldByName('BASIMPMIX').AsFloat);
      xsIgvMixto := FormatFloat('##0.00', DMCXP.cdsQry.FieldByName('IGVMIX').AsFloat);
      xsBasImpGas := FormatFloat('##0.00', DMCXP.cdsQry.FieldByName('BASIMPGAS').AsFloat);
      xsIgvGas := FormatFloat('##0.00', DMCXP.cdsQry.FieldByName('IGVGAS').AsFloat);
      xsAdqNoGrav := FormatFloat('##0.00', DMCXP.cdsQry.FieldByName('ADQNOGRAV').AsFloat);
      xsImpIsc := FormatFloat('##0.00', DMCXP.cdsQry.FieldByName('IMPISC').AsFloat);
      xsImpOtros := FormatFloat('##0.00', DMCXP.cdsQry.FieldByName('IMPOTROS').AsFloat);
      xsImpTotal := FormatFloat('##0.00', DMCXP.cdsQry.FieldByName('IMPTOTAL').AsFloat);
      xsTipoCambio := FormatFloat('##0.000', DMCXP.cdsQry.FieldByName('CPTCAMPR').AsFloat);
      xsModFecEmi := DMCXP.cdsQry.FieldByName('MODFECEMI').AsString;
      If Length(xsModFecEmi) = 0 Then
      Begin
         xsModFecEmi := '01/01/0001';
      End;
      xsModDocId := DMCXP.cdsQry.FieldByName('MODDOCID').AsString;
      If Length(xsModDocId) = 0 Then
      Begin
         xsModDocId := '00';
      End;
      xsModSerie := DMCXP.cdsQry.FieldByName('MODCPSERIE').AsString;
      If Length(xsModSerie) = 0 Then
      Begin
         xsModSerie := '-';
      End;
      xsModNoDoc := DMCXP.cdsQry.FieldByName('MODCPNODOC').AsString;
      If Length(xsModNoDoc) = 0 Then
      Begin
         xsModNoDoc := '-';
      End;
      xsNumDocNoDom := DMCXP.cdsQry.FieldByName('NUMDOCNODOM').AsString;
      If Length(xsNumDocNoDom) = 0 Then
      Begin
         xsNumDocNoDom := '-';
      End;
      xsFecDetraccion := DMCXP.cdsQry.FieldByName('FECCONDTR').AsString;
      If Length(xsFecDetraccion) = 0 Then
      Begin
         xsFecDetraccion := '01/01/0001';
      End;
      xsNumDetraccion := DMCXP.cdsQry.FieldByName('NUMCONDTR').AsString;
      If Length(xsNumDetraccion) = 0 Then
      Begin
         xsNumDetraccion := '0';
      End;
      xsFlgRet := DMCXP.cdsQry.FieldByName('FLGRET').AsString;
      xsFlgMod := DMCXP.cdsQry.FieldByName('FLGMOD').AsString;

      WriteLn(xfArchivoTexto, xsPeriodoRC + xsDelimitador +
         xsCorrelativo + xsDelimitador +
         xdFecEmi + xsDelimitador +
         xdFecPag + xsDelimitador +
         xsDocId + xsDelimitador +
         xsSerie + xsDelimitador +
         xsAnio + xsDelimitador +
         xsNoDoc + xsDelimitador +
         xsImpOpeDia + xsDelimitador +
         xsProvDocId + xsDelimitador +
         xsProvDocNum + xsDelimitador +
         xsProvRazSoc + xsDelimitador +
         xsBasImp + xsDelimitador +
         xsIgv + xsDelimitador +
         xsBasImpMixto + xsDelimitador +
         xsIgvMixto + xsDelimitador +
         xsBasImpGas + xsDelimitador +
         xsIgvGas + xsDelimitador +
         xsAdqNoGrav + xsDelimitador +
         xsImpIsc + xsDelimitador +
         xsImpOtros + xsDelimitador +
         xsImpTotal + xsDelimitador +
         xsTipoCambio + xsDelimitador +
         xsModFecEmi + xsDelimitador +
         xsModDocId + xsDelimitador +
         xsModSerie + xsDelimitador +
         xsModNoDoc + xsDelimitador +
         xsNumDocNoDom + xsDelimitador +
         xsFecDetraccion + xsDelimitador +
         xsNumDetraccion + xsDelimitador +
         xsFlgRet + xsDelimitador +
         xsFlgMod + xsDelimitador);
      DMCXP.cdsQry.Next;
   End;
   CloseFile(xfArchivoTexto);
   DMCXP.cdsQry.Close;
   ShowMessage('Archivo '+wgRutaArchivo+#13+' generado correctamente');
End;

Function TFCRegComp.fg_PLEvalidaParametros: boolean;
Begin

End;

Procedure TFCRegComp.btnExportarPLEClick(Sender: TObject);
Var
   xsSql: String;
   xsProcesar :String;
   xsRuc,xsNombre,xsCarpeta :String;
Begin
   try
      Screen.Cursor := crHourGlass;
      FRegComprasPLE := TFRegComprasPLE.Create( Application );
      FRegComprasPLE.ShowModal;
   finally
      FRegComprasPLE.Free;
   End;
End;

Function TFCRegComp.fg_PLEvalidaDatos(Var wgMensaje: String): Boolean;
Var
   xsPeriodo: String;
   xsCorrelativo: String;
   xdFecEmi: String;
   xdFecPag: String;
   xsDocId: String;
   xsSerie: String;
   xsAnio: String;
   xsNoDoc: String;
   xsImpOpeDia: String;
   xsProvDocId: String;
   xsProvDocNum: String;
   xsProvRazSoc: String;
   xsBasImp: String;
   xsIgv: String;
   xsBasImpMixto: String;
   xsIgvMixto: String;
   xsBasImpGas: String;
   xsIgvGas: String;
   xsAdqNoGrav: String;
   xsImpIsc: String;
   xsImpOtros: String;
   xsImpTotal: String;
   xsTipoCambio: String;
   xsModFecEmi: String;
   xsModDocId: String;
   xsModSerie: String;
   xsModNoDoc: String;
   xsNumDocNoDom: String;
   xsFecDetraccion: String;
   xsNumDetraccion: String;
   xsFlgRet: String;
   xsFlgMod: String;
Begin
// validamos los datos usando el mismo clientdataset (cdsRegCompra)

// 1.valida periodo informado
   xsPeriodo := DMCXP.cdsRegCompra.FieldByName('PERIODO').AsString;

// 2.valida correlativo
   xsCorrelativo := DMCXP.cdsRegCompra.FieldByName('CORRELATIVO').AsString;

// 3.valida Fecha emision documento
   xdFecEmi := DMCXP.cdsRegCompra.FieldByName('FECEMI').AsString;
   If Length(xdFecEmi) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [3] Fecha de emisión incorrecto';
   End;

// 4.valida Fecha de Vencim o pago
   xdFecPag := DMCXP.cdsRegCompra.FieldByName('FECPAG').AsString;

// 5.valida Tipo de comprobante de pago
   xsDocId := DMCXP.cdsRegCompra.FieldByName('DOCID').AsString;
   If Length(xsDocId) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [5] Tipo de Comprobante incorrecto' + #13;
   End;

// 6.valida Serie
   xsSerie := DMCXP.cdsRegCompra.FieldByName('CPSERIE').AsString;
   If Length(xsSerie) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [6] Número de Serie incorrecto' + #13;
   End;

// 7.valida año
   xsAnio := DMCXP.cdsRegCompra.FieldByName('ANIO').AsString;

// 8.valida numero de documento
   xsNoDoc := DMCXP.cdsRegCompra.FieldByName('CPNODOC').AsString;
   If Length(xsSerie) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [8] Número de comprobante incorrecto' + #13;
   End;

// 9.valida importe por operaciones registradas consolidadas por dia
   xsImpOpeDia := DMCXP.cdsRegCompra.FieldByName('IMPOPEDIA').AsString;
   If Length(xsImpOpeDia) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [9] Debe tener un valor' + #13;
   End;

// 10.valida tipo de documento de identidad de proveedor

// 11.valida RUC o DNI
   xsProvDocNum := DMCXP.cdsRegCompra.FieldByName('PROVDOCNUM').AsString;

// 12.valida Razón social
   xsProvRazSoc := DMCXP.cdsRegCompra.FieldByName('PROVRAZSOC').AsString;
   If Length(xsProvRazSoc) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [12] Debe tener Razón social' + #13;
   End;

// 13.valida Base imponible
   xsBasImp := DMCXP.cdsRegCompra.FieldByName('BASIMP').AsString;
   If Length(xsBasImp) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [13] Base imponible incorrecto' + #13;
   End;

// 14.valida Igv
   xsIgv := DMCXP.cdsRegCompra.FieldByName('IGV').AsString;
   If Length(xsIgv) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [14] Igv Incorrecto' + #13;
   End;

// 15.valida Base Imponible Mixto
   xsBasImpMixto := DMCXP.cdsRegCompra.FieldByName('BASIMPMIX').AsString;
   If Length(xsBasImpMixto) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [15] Base Imponible Mixto Incorrecto' + #13;
   End;

// 16.valida Igv Mixto
   xsIgvMixto := DMCXP.cdsRegCompra.FieldByName('IGVMIX').AsString;
   If Length(xsBasImpMixto) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [16] Igv Mixto Incorrecto' + #13;
   End;

// 17.valida Base imponible gasto
   xsBasImpGas := DMCXP.cdsRegCompra.FieldByName('BASIMPGAS').AsString;
   If Length(xsBasImpGas) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [17] Base Imponible Gasto Incorrecto' + #13;
   End;

// 18.valida IGV Gasto
   xsIgvGas := DMCXP.cdsRegCompra.FieldByName('IGVGAS').AsString;
   If Length(xsIgvGas) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [18] IGV Gasto Incorrecto' + #13;
   End;

// 19.valida Adquisiciones no gravadas
   xsAdqNoGrav := DMCXP.cdsRegCompra.FieldByName('ADQNOGRAV').AsString;
   If Length(xsAdqNoGrav) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [19] Adquisiciones No Gravadas Incorrecto' + #13;
   End;

// 20.valida Impuesto selectivo al consumo
   xsImpIsc := DMCXP.cdsRegCompra.FieldByName('IMPISC').AsString;
   If Length(xsImpIsc) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [20] ISC Incorrecto' + #13;
   End;

// 21.valida Otros impuestos
   xsImpOtros := DMCXP.cdsRegCompra.FieldByName('IMPOTROS').AsString;
   If Length(xsImpOtros) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [21] Otros Impuestos Incorrecto' + #13;
   End;

// 22.valida importe total
   xsImpTotal := DMCXP.cdsRegCompra.FieldByName('IMPTOTAL').AsString;
   If Length(xsImpOtros) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [22] Total Incorrecto' + #13;
   End;

// 23.valida Tipo de cambio
   xsTipoCambio := DMCXP.cdsRegCompra.FieldByName('CPTCAMPR').AsString;
   If Length(xsTipoCambio) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [23] Tipo de Cambio Incorrecto' + #13;
   End;

// 24.valida Fecha de emisión de constancia de detracción
   xsFecDetraccion := DMCXP.cdsRegCompra.FieldByName('FECCONDTR').AsString;

// 25.valida Número de comprobante de detracción
   xsNumDetraccion := DMCXP.cdsRegCompra.FieldByName('NUMCONDTR').AsString;

// 26.valida Flag si existe retención
   xsFlgRet := DMCXP.cdsRegCompra.FieldByName('FLGRET').AsString;
   If Length(xsFlgRet) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [31] Flag que indica si hay retención o no' + #13;
   End;

// 27.valida Estado que identifica la oportunidad de la anotación
   xsFlgMod := DMCXP.cdsRegCompra.FieldByName('FLGMOD').AsString;
   If Length(xsFlgMod) = 0 Then
   Begin
      wgMensaje := wgMensaje + ' [32] Flag de Oportunidad del registro' + #13;
   End;

End;

Function TFCRegComp.fg_PLEprocesaRegCompras(wgPeriodo: String): Boolean;
Var
   xsSql: String;
   xsMensajeError: String;
   xsMensaje: String;
Begin
   xsMensajeError := '';
   xsSql := ' SELECT CXP301.CPANOMES PERIODO, '
           +'        LPAD(ROWNUM,10,' + QuotedStr('0') + ') CORRELATIVO, '
           +'        CXP301.CPFEMIS FECEMI, '
           +'        CXP301.CPFEMIS FECPAG, '
           +'        (SELECT TGE110.TDOC_SUNAT FROM TGE110 WHERE TGE110.DOCID=CXP301.DOCID AND TGE110.DOCMOD='+QuotedStr('CXP')+') DOCID,'
           +'        CXP301.CPSERIE, '
           +'        TO_NUMBER(SUBSTR(CXP301.CPANOMES,1,4)) ANIO, '
           +'        CXP301.CPNODOC, '
           +'        0 IMPOPEDIA, '
           +'        (SELECT TGE201.TIPDOCID FROM TGE201 WHERE TGE201.CLAUXID = CXP301.CLAUXID AND TGE201.PROV = CXP301.PROV ) PROVDOCID, '
           +'        CXP301.PROVRUC PROVDOCNUM, '
           +'        CXP301.PROVDES PROVRAZSOC, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuotedStr('N')+' THEN CXP301.CPGRAVAD ELSE CXP301.CPGRAVAD * CXP301.CPTCAMPR END),0) BASIMP, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N')+' THEN CXP301.CPIGV    ELSE CXP301.CPIGV * CXP301.CPTCAMPR END),0) IGV, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N')+' THEN CXP301.CPGRAVAD2 ELSE CXP301.CPGRAVAD2 * CXP301.CPTCAMPR END),0) BASIMPMIX, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N')+' THEN CXP301.CPIGV2 ELSE CXP301.CPIGV2 * CXP301.CPTCAMPR END),0) IGVMIX, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N')+' THEN CXP301.CPNOGRAV ELSE CXP301.CPNOGRAV * CXP301.CPTCAMPR END),0) BASIMPGAS, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N')+' THEN CXP301.IGV_GRA_NO_DEST ELSE CXP301.IGV_GRA_NO_DEST * CXP301.CPTCAMPR END),0) IGVGAS, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N')+' THEN CXP301.ADQ_NO_GRAV ELSE CXP301.ADQ_NO_GRAV * CXP301.CPTCAMPR END),0) ADQNOGRAV, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N')+' THEN CXP301.CPISC ELSE CXP301.CPISC * CXP301.CPTCAMPR END),0) IMPISC, '
           +'        NVL((CASE WHEN CXP301.TMONID = ' + QuoTedStr('N')+' THEN CXP301.CP_OTROS ELSE CXP301.CP_OTROS * CXP301.CPTCAMPR END),0) IMPOTROS, '
           +'        CXP301.CPMTOLOC IMPTOTAL, '
           +'        CXP301.CPTCAMPR, '
           +'        NULL MODFECEMI, '
           +'        NULL MODDOCID, '
           +'        NULL MODCPSERIE, '
           +'        NULL MODCPNODOC, '
           +'        NULL NUMDOCNODOM, '
           +'        CXP301.FECDEPDET FECCONDTR, '
           +'        CXP301.NUMDEPDET NUMCONDTR, '
           +'        (CASE WHEN CXP301.PROVRETIGV = ' + QuotedStr('S') + ' THEN 1 ELSE 0 END) FLGRET,  '
           +'        1 FLGMOD, '
           +'        CXP301.CIAID, '
           +'        CXP301.TDIARID, '
           +'        CXP301.CPNOREG, '
           +'        CXP301.CLAUXID, '
           +'        CXP301.PROV, CXP301.CPCANJE, '
           +'        TO_CHAR(CXP301.CPFEMIS,' + QuotedStr('YYYYMM') + ') PERIODODOC '
           +'   FROM CXP301 '
           +'  WHERE CXP301.CPANOMES = ' + QuotedStr(wgPeriodo)
           +'    AND CXP301.CPESTADO IN (' + QuotedStr('C') + ',' + QuotedStr('P') + ')'
           +'    AND CXP301.TDIARID = ' + QuotedStr('08')
           +'  ORDER BY CXP301.CIAID, CXP301.CPNOREG ';
   DMCXP.cdsRegCompra.close;
   DMCXP.cdsRegCompra.DataRequest(xsSql);
   DMCXP.cdsRegCompra.open;
   While Not DMCXP.cdsRegCompra.Eof Do
   Begin
      xsMensaje := '';
      DMCXP.cdsRegCompra.Edit; //sólo para modificar temporalmente los datos
      //validamos los datos usando el mismo clientdataset (cdsRegCompra)
      If fg_PLEvalidaDatos(xsMensaje) = False Then
      Begin
         xsMensajeError := xsMensajeError + xsMensaje;
      End;
      DMCXP.cdsRegCompra.Next;
   End;

   If xsMensajeError <> '' Then
   Begin
      ShowMessage(xsMensajeError);
      Result := False;
      Exit;
   End;
   //si no hay error entonces insertamos en la tabla el registro de compras
   DMCXP.cdsRegCompra.First;
   fg_PLEinsertaTabla(DMCXP.cdsRegCompra, wgPeriodo);
   Result := True;
End;

Procedure TFCRegComp.fg_PLEinsertaTabla(wgRegistroCompras: TwwClientDataSet; wgPeriodo: String);
Var
   xsPeriodoRC: String;
   xsCorrelativo: String;
   xsFecEmi: String;
   xsFecPag: String;
   xsDocId: String;
   xsSerie: String;
   xsAnio: String;
   xsNoDoc: String;
   xsImpOpeDia: String;
   xsProvDocId: String;
   xsProvDocNum: String;
   xsProvRazSoc: String;
   xsBasImp: String;
   xsIgv: String;
   xsBasImpMixto: String;
   xsIgvMixto: String;
   xsBasImpGas: String;
   xsIgvGas: String;
   xsAdqNoGrav: String;
   xsImpIsc: String;
   xsImpOtros: String;
   xsImpTotal: String;
   xsTipoCambio: String;
   xsModFecEmi: String;
   xsModDocId: String;
   xsModSerie: String;
   xsModNoDoc: String;
   xsNumDocNoDom: String;
   xsFecDetraccion: String;
   xsNumDetraccion: String;
   xsFlgRet: String;
   xsFlgMod: String;
   xsCompania: String;
   xsTDiario: String;
   xsCPNoReg: String;
   xsClauxId: String;
   xsProv: String;

   xnCorrelativo: Double;
   xsSql: String;
Begin

   fg_PLEeliminaRegCompras(wgPeriodo);
   //validamos los datos usando el mismo clientdataset (cdsRegCompra)
   xnCorrelativo := 1;

// inicializa barra de progreso que se muestra en la pantalla
   prgb_Progreso.Max := wgRegistroCompras.RecordCount;
   prgb_Progreso.Min := 0;
   prgb_Progreso.Position := 0;

   While Not wgRegistroCompras.Eof Do
   Begin

      xsPeriodoRC := wgPeriodo;
      xsCorrelativo := FormatFloat('0000000', xnCorrelativo);
      xsFecEmi := wgRegistroCompras.FieldByName('FECEMI').AsString;
      xsFecPag := wgRegistroCompras.FieldByName('FECPAG').AsString;

      xsDocId := wgRegistroCompras.FieldByName('DOCID').AsString;
      xsSerie := wgRegistroCompras.FieldByName('CPSERIE').AsString;
      xsAnio := wgRegistroCompras.FieldByName('ANIO').AsString;
      xsNoDoc := wgRegistroCompras.FieldByName('CPNODOC').AsString;
      xsImpOpeDia := wgRegistroCompras.FieldByName('IMPOPEDIA').AsString;

      xsProvDocId := fg_PLEobtieneTdocProv(wgRegistroCompras.FieldByName('CLAUXID').AsString,
         wgRegistroCompras.FieldByName('PROV').AsString,
         wgRegistroCompras.FieldByName('PROVDOCNUM').AsString);

      xsProvDocNum := wgRegistroCompras.FieldByName('PROVDOCNUM').AsString;
      xsProvRazSoc := wgRegistroCompras.FieldByName('PROVRAZSOC').AsString;
      xsBasImp := wgRegistroCompras.FieldByName('BASIMP').AsString;
      xsIgv := wgRegistroCompras.FieldByName('IGV').AsString;
      xsBasImpMixto := wgRegistroCompras.FieldByName('BASIMPMIX').AsString;
      xsIgvMixto := wgRegistroCompras.FieldByName('IGVMIX').AsString;
      xsBasImpGas := wgRegistroCompras.FieldByName('BASIMPGAS').AsString;
      xsIgvGas := wgRegistroCompras.FieldByName('IGVGAS').AsString;
      xsAdqNoGrav := wgRegistroCompras.FieldByName('ADQNOGRAV').AsString;
      xsImpIsc := wgRegistroCompras.FieldByName('IMPISC').AsString;
      xsImpOtros := wgRegistroCompras.FieldByName('IMPOTROS').AsString;
      xsImpTotal := wgRegistroCompras.FieldByName('IMPTOTAL').AsString;
      xsTipoCambio := wgRegistroCompras.FieldByName('CPTCAMPR').AsString;
      //en el caso de ser NC
      If xsDocId = '07' Then
      Begin
      // datos complementarios en la Nota de Crédito
         xsBasImp := '-' + xsBasImp;
         xsIgv := '-' + xsIgv;
         xsBasImpMixto := '-' + xsBasImpMixto;
         xsIgvMixto := '-' + xsIgvMixto;
         xsBasImpGas := '-' + xsBasImpGas;
         xsIgvGas := '-' + xsIgvGas;
         xsAdqNoGrav := '-' + xsAdqNoGrav;
         xsImpIsc := '-' + xsImpIsc;
         xsImpOtros := '-' + xsImpOtros;
         xsImpTotal := '-' + xsImpTotal;

         fg_PLEdocReferenciaNC(xsModFecEmi, xsModDocId, xsModSerie, xsModNoDoc,
            wgRegistroCompras.FieldByName('CIAID').AsString,
            wgRegistroCompras.FieldByName('CPCANJE').AsString,
            wgRegistroCompras.FieldByName('PROV').AsString);
      End
      Else
         If xsDocId = '08' Then
         Begin
            xsModFecEmi := ' To_date(' + QuotedStr(xsFecEmi) + ',' + QuotedStr('dd/mm/yyyy') + ')';
            xsModDocId := xsDocId;
            xsModSerie := xsSerie;
            xsModNoDoc := xsNoDoc;
         End
         Else
         Begin
            xsModFecEmi := 'Null';
            xsModDocId := '';
            xsModSerie := '';
            xsModNoDoc := '';
         End;

      xsSql := ' CLAUXID = ' + QuotedStr(wgRegistroCompras.FieldByName('CLAUXID').AsString)
              +' AND PROV = ' + QuotedStr(wgRegistroCompras.FieldByName('PROV').AsString)
              +' AND TIPPERID IN (' + QuotedStr('03') + ',' + QuotedStr('04') + ') ';

      If Length(BuscaQry('dspTGE', 'TGE201', 'PROVRUC', xsSql, 'PROVRUC')) > 0 Then
      Begin
         xsNumDocNoDom := DMCXP.cdsQry.FieldByName('PROVRUC').AsString;
      End
      Else
      Begin
         xsNumDocNoDom := '';
      End;

      xsFecDetraccion := wgRegistroCompras.FieldByName('FECCONDTR').AsString;
      If Length(xsFecDetraccion) = 0 Then
      Begin
         xsFecDetraccion := 'NULL';
      End
      Else
      Begin
         xsFecDetraccion := 'To_date(' + QuotedStr(xsFecDetraccion) + ',' + QuotedStr('dd/mm/yyyy') + ')';
      End;
      xsNumDetraccion := wgRegistroCompras.FieldByName('NUMCONDTR').AsString;
      xsFlgRet := wgRegistroCompras.FieldByName('FLGRET').AsString;
      xsFlgMod := wgRegistroCompras.FieldByName('FLGMOD').AsString;

      If xsPeriodoRC = wgRegistroCompras.FieldByName('PERIODODOC').AsString Then //en el mismo periodo
      Begin
         xsFlgMod := '1';
      End
      Else
         If StrToFloat(xsPeriodoRC) - StrToFloat(wgRegistroCompras.FieldByName('PERIODODOC').AsString) < 100 Then //menos de 12 meses
         Begin
            xsFlgMod := '6';
         End
         Else
            If StrToFloat(xsPeriodoRC) - StrToFloat(wgRegistroCompras.FieldByName('PERIODODOC').AsString) >= 100 Then //mas de 12 meses
            Begin
               xsFlgMod := '7';
            End;

      xsCompania := wgRegistroCompras.FieldByName('CIAID').AsString;
      xsTDiario := wgRegistroCompras.FieldByName('TDIARID').AsString;
      xsCPNoReg := wgRegistroCompras.FieldByName('CPNOREG').AsString;
      xsClauxId := wgRegistroCompras.FieldByName('CLAUXID').AsString;
      xsProv := wgRegistroCompras.FieldByName('PROV').AsString;

      xsSql := ' INSERT INTO CXP_REG_COM (PERIODO, CORRELATIVO, '
             + '                          FECEMI, '
             + '                          FECPAG, '
             + '                          DOCID, CPSERIE, ANIO, '
             + '                          CPNODOC, IMPOPEDIA, PROVDOCID, PROVDOCNUM, '
             + '                          PROVRAZSOC, BASIMP, IGV, BASIMPMIX, IGVMIX, '
             + '                          BASIMPGAS, IGVGAS, ADQNOGRAV, IMPISC, '
             + '                          IMPOTROS, IMPTOTAL, CPTCAMPR, MODFECEMI, MODDOCID, '
             + '                          MODCPSERIE, MODCPNODOC, NUMDOCNODOM, '
             + '                          FECCONDTR, NUMCONDTR, FLGRET, FLGMOD, '
             + '                          CIAID, TDIARID, CPNOREG, '
             + '                          CLAUXID, PROV) '
             + ' Values ('+ QuotedStr(xsPeriodoRC)+', '+QuotedStr(xsCorrelativo)+', '
                          +'to_date('+QuotedStr(xsFecEmi)+','+QuotedStr('dd/mm/yyyy')+'), '
                          +'to_date('+QuotedStr(xsFecPag)+','+QuotedStr('dd/mm/yyyy')+'), '
                          + QuotedStr(xsDocId)+', '+QuotedStr(xsSerie)+', '+ xsAnio + ', '
                          + QuotedStr(xsNoDoc)+', '+xsImpOpeDia+', '+QuotedStr(xsProvDocId)+', '+QuotedStr(xsProvDocNum)+', '
                          + QuotedStr(xsProvRazSoc)+', '+xsBasImp+', '+xsIgv+', '+xsBasImpMixto+', '+xsIgvMixto+', '
                          + xsBasImpGas+', '+xsIgvGas+', '+xsAdqNoGrav+', '+xsImpIsc+', '
                          + xsImpOtros+', '+xsImpTotal+', '+xsTipoCambio+', '+xsModFecEmi+', '+QuotedStr(xsModDocId)+', '
                          + QuotedStr(xsModSerie)+', '+QuotedStr(xsModNoDoc)+', '+QuotedStr(xsNumDocNoDom)+', '
                          + xsFecDetraccion+', '+QuotedStr(xsNumDetraccion)+', '+QuotedStr(xsFlgRet)+', '+QuotedStr(xsFlgMod)+', '
                          + QuotedStr(xsCompania)+', '+QuotedStr(xsTDiario)+', '+QuotedStr(xsCPNoReg)+', '
                          + QuotedStr(xsClauxId)+', '+QuotedStr(xsProv) + ') ';
      DMCXP.DCOM1.AppServer.EjecutaSQL(xsSql);

      prgb_Progreso.Position := prgb_Progreso.Position + 1;

      xnCorrelativo := xnCorrelativo + 1;
      wgRegistroCompras.Next;
   End;
End;

Procedure TFCRegComp.fg_PLEeliminaRegCompras(wgPeriodo: String);
Var
   xsSql: String;
Begin
   xsSql := ' DELETE CXP_REG_COM WHERE PERIODO = ' + QuotedStr(wgPeriodo);
   DMCXP.DCOM1.AppServer.EjecutaSQL(xsSql);
End;

Procedure TFCRegComp.fg_PLEdocReferenciaNC(Var wgFechaDocRef: String; Var wgTDocRef: String;
   Var wgSerieRef: String; Var wgNumDocRef: String;
   wgCiaNC, wgCanjeNC, wgProvNC: String);
Var
   xsSql: String;
Begin
   xsSql := ' SELECT CXP301.CPFEMIS, CXP304.DOCID ,CXP304.CPSERIE , CXP304.CPNODOC '
          + '   FROM CXP304,CXP301 '
          + '  WHERE CXP304.CIAID = CXP301.CIAID '
          + '    AND CXP304.DOCID = CXP301.DOCID '
          + '    AND CXP304.CPSERIE = CXP301.CPSERIE '
          + '    AND CXP304.CPNODOC = CXP301.CPNODOC '
          + '    AND CXP304.Prov = CXP301.Prov  '
          + '    AND CXP304.TCANJEID IN ' + QuotedStr('NC')
          + '    AND CXP304.CIAID = ' + QuotedStr(wgCiaNC)
          + '    AND CXP304.CCPCANJE = ' + QuotedStr(wgCanjeNC)
          + '    AND CXP304.Prov = ' + QuotedStr(wgProvNC);
   DMCXP.cdsQry.close;
   DMCXP.cdsQry.DataRequest(xsSql);
   DMCXP.cdsQry.open;
   If DMCXP.cdsQry.RecordCount > 0 Then
   Begin
      wgFechaDocRef := 'To_date(' + QuotedStr(DMCXP.cdsQry.FieldByName('CPFEMIS').AsString) + ',' + QuotedStr('dd/mm/yyyy') + ')';
      wgTDocRef := DMCXP.cdsQry.FieldByName('DOCID').AsString;
      wgSerieRef := DMCXP.cdsQry.FieldByName('CPSERIE').AsString;
      wgNumDocRef := DMCXP.cdsQry.FieldByName('CPNODOC').AsString;
   End
   Else
   Begin
      wgFechaDocRef := 'Null';
      wgTDocRef := '';
      wgSerieRef := '';
      wgNumDocRef := '';
   End;
   //si es nota de débito

End;

Function TFCRegComp.fg_PLEobtieneTdocProv(wgTipoAuxiliar,
   wgAuxiliarId, wgNumDocIdentidad: String): String;
Var
   xsSql: String;
Begin
   If Length(wgNumDocIdentidad) = 11 Then
   Begin
      Result := '6';
   End
   Else
   Begin
      Result := '1';
   End;

End;

procedure TFCRegComp.sbDisenoClick(Sender: TObject);
begin
   cbDiseno.Checked := not cbDiseno.Checked;
end;

// Inicio HPC_201412_CXP
procedure TFCRegComp.btnImprime1Click(Sender: TObject);
Var
   xSQL: String;
   x10: Integer;
Begin
// Inicio HPC_201602_CXP
// DAF_2016000019_CXP_2
// Se cambia cambio de Monto Total a pagar por Monto Total de la Provisión ya que no necesariamente es los mismo
   xSQL := '   select CIAID, TDIARID, CPNOREG,'''+ dbeAnoMM.text +''' CPANOMES, CPESTADO,T.ESTDOCDES,CP_CONTA, sum(MONTO301) MONTO301, sum(DEBE_CXP) DEBE302, sum(HABER_CXP) HABER302 '
         + '     from ( '
         + '      select CIAID, TDIARID, CPNOREG, CPESTADO,CP_CONTA, '
         + '             round((nvl(CPGRAVAD,0) + nvl(CPNOGRAV,0) + nvl(CPIGV,0)  '
         + '           + nvl(CPISC,0) + nvl(CPSERVIC,0) + nvl(CPIGV2,0) '
         + '           + nvl(CPGRAVAD2,0) + nvl(ADQ_NO_GRAV,0) + nvl(IGV_GRA_NO_DEST,0) '
         + '           + nvl(CP_OTROS,0))*(case when TMONID=''N'' then 1 else CPTCAMPR end),2) MONTO301, '
         + '             0.00 DEBE_CXP, 0.00 HABER_CXP '
         + '        from CXP301 '
         + '       where CIAID='''+ dblcCia.text +''' and TDIARID='''+ dblcTDiario.text +''' and CPANOMES='''+ dbeAnoMM.text +''' and CPESTADO not in (''A'',''I'',''E'') '
         + '       union all '
         + '      select D.CIAID, D.TDIARID, D.CPNOREG,C.CPESTADO,CP_CONTA, 0.00 MONTO301, '
         + '             sum(case when DCPDH=''D'' then DCPMOLOC else 0.00 end) DEBE_CXP, '
         + '             sum(case when DCPDH=''H'' then DCPMOLOC else 0.00 end) HABER_CXP '
         + '        from CXP302 D INNER JOIN CXP301 C ON D.CIAID = C.CIAID AND D.TDIARID = C.TDIARID AND D.DCPANOMM = C.CPANOMES AND D.CPNOREG = C.CPNOREG '
         + '       where D.CIAID='''+ dblcCia.text +''' and D.TDIARID='''+ dblcTDiario.text +''' and D.DCPANOMM='''+ dbeAnoMM.text +''' and C.CPESTADO not in (''A'',''I'',''E'') '
         + '    group by D.CIAID, D.TDIARID, D.CPNOREG,C.CPESTADO,CP_CONTA ) INNER JOIN TGE115 T ON CPESTADO = T.ESTDOCID '
         + ' group by CIAID, TDIARID, CPNOREG, CPESTADO,T.ESTDOCDES,CP_CONTA '
         + '   having sum(MONTO301)<>sum(DEBE_CXP) or sum(MONTO301)<>sum(HABER_CXP) or sum(DEBE_CXP)<>sum(HABER_CXP) '
         + ' order by CIAID, TDIARID, CPNOREG ';
// Fin HPC_201602_CXP
   DMCXP.cdsQry2.Close;
   DMCXP.cdsQry2.DataRequest(xSQL);
   DMCXP.cdsQry2.Open;

   pprV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\CompCXP301vsCXP302.rtm';
   pprV.Template.LoadFromFile;
   ppdbV.DataSource := DMCXP.dsQry2;

   Screen.Cursor := crDefault;
   If cbDiseno.Checked Then
   Begin
      ppdV.Report := pprV;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprV.Print;
      pprV.Stop;
      ppdbV.DataSource := Nil;
      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;
   End;

end;
// Fin HPC_201412_CXP

// Inicio HPC_201412_CXP
procedure TFCRegComp.btnImprime2Click(Sender: TObject);
Var
   xSQL: String;
   x10: Integer;
Begin

   xSQL := '   select CIAID, TDIARID, CNTCOMPROB,'''+ dbeAnoMM.text +''' CPANOMES,CP_CONTA,T.ESTDOCDES, sum(DEBE) DEBE, sum(HABER) HABER, '
         + '          sum(DEBE_CXP) DEBE_CXP, sum(HABER_CXP) HABER_CXP '
         + '     from ( '
         + '           select F.CIAID, F.TDIARID, F.CNTCOMPROB,G.CPESTADO,G.CP_CONTA, sum(CNTDEBEMN) DEBE, sum(CNTHABEMN) HABER, '
         + '                  0.00 DEBE_CXP, 0.00 HABER_CXP '
         + '             from CNT301 F INNER JOIN CXP301 G ON F.CIAID = G.CIAID AND F.TDIARID = G.TDIARID AND F.CNTANOMM = G.CPANOMES AND F.CNTCOMPROB = G.CPNOREG '
         + '            where F.CIAID='''+ dblcCia.text +''' and F.TDIARID='''+ dblcTDiario.text +''' and F.CNTANOMM='''+ dbeAnoMM.text +''' and F.CNTFAUTOM is null '
         + '         group by F.CIAID, F.TDIARID, F.CNTCOMPROB,G.CPESTADO,G.CP_CONTA '
         + '        union all '
         + '           select D.CIAID, D.TDIARID, D.CPNOREG CNTCOMPROB,C.CPESTADO,C.CP_CONTA, 0.00 DEBE, 0.00 HABER, '
         + '                  sum(case when D.DCPDH=''D'' then D.DCPMOLOC else 0.00 end) DEBE_CXP, '
         + '                  sum(case when D.DCPDH=''H'' then D.DCPMOLOC else 0.00 end) HABER_CXP '
         + '             from CXP302 D inner join CXP301 C ON D.CIAID = C.CIAID AND D.TDIARID = C.TDIARID AND D.DCPANOMM = C.CPANOMES AND D.CPNOREG = C.CPNOREG '
         + '            where D.CIAID='''+ dblcCia.text +''' and D.TDIARID='''+ dblcTDiario.text +''' and D.DCPANOMM='''+ dbeAnoMM.text +''' and C.CPESTADO not in (''A'',''I'',''E'') '
         + '         group by D.CIAID, D.TDIARID, D.CPNOREG,C.CPESTADO,C.CP_CONTA )  INNER JOIN TGE115 T ON CPESTADO = T.ESTDOCID '
         + ' group by CIAID, TDIARID, CNTCOMPROB,CPESTADO,CP_CONTA,T.ESTDOCDES '
         + '   having sum(DEBE) <> sum(DEBE_CXP) '
         + ' order by CIAID, TDIARID, CNTCOMPROB ';
   DMCXP.cdsQry2.Close;
   DMCXP.cdsQry2.DataRequest(xSQL);
   DMCXP.cdsQry2.Open;

   pprV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\CompCXP301vsCNT301.rtm';
   pprV.Template.LoadFromFile;
   ppdbV.DataSource := DMCXP.dsQry2;

   Screen.Cursor := crDefault;
   If cbDiseno.Checked Then
   Begin
      ppdV.Report := pprV;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprV.Print;
      pprV.Stop;
      ppdbV.DataSource := Nil;
      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;
   End;

end;
// Fin HPC_201412_CXP

End.

