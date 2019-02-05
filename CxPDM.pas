unit CxPDM;

// Actualizaciones
// HPC_201401_CXP 10/01/2014: Se comentaron por el mal uso de las Transacciones
//                11/02/2014: Se comentaron por el mal uso de las Transacciones
// HPC_201406_CXP 17/05/2014: Se agrega variable xSigueGrab para continuar o no con grabaciones controladas
//                            con Control Transaccional
//                            Se actualiza rutina SaldosAuxiliar (sangría + variables control transaccional
// HPC_201412_CXP 10/09/2014: Se ha comentado el filtro de Estado diferente de "E" a la busqueda de registros
//                            para encontrar el siguiente numero de registro en la cabecera de una provision(CXP301).
// HPC_201601_CXP 11/01/2016: Se define la variable wTMonLocDes para descripción de la Moneda Local
//                            Se define la variable wTMonExtDes para descripción de la Moneda Extranjera
// HPC_201604_CXP 23/11/2016  DAF_2016000575 Se añade Funcion fg_ValidaNroRUC - Valida por algoritmo un número de RUC Válido
//                            DAF_2016001440 Se cambia Librería de Excel de ExcelXP a Excel2000
//
// HPC_201705_CXP 31/07/2017: Cambio en validacion de documento duplicado
// HPC_201707_CXP           : Ajuste en la opción de Nota de Crédito
// HPC_201801_CXP           : Implementación de Accesos a la Opción de Dietas
// HPC_201803_CXP           : Se cambia formato de la columna de detalle de la provisión
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, DBClient, wwclient, MConnect, DBTables, Wwquery, Dbiprocs,
  Dbierrs, Dbitypes, Wwtable, ExtCtrls, ComCtrls, wwdblook ,stdctrls,buttons,
  oaContabiliza, RecError, variants, IniFiles, wwFrame,
  Wwdbdlg, wwdbedit, wwdbdatetimepicker, Wwdbspin, Grids, Wwdbigrd, Wwdbgrid,
  SConnect, Mant, winsock,  Mask,  DBCtrls, wwSpeedButton, wwDBNavigator,
  Wwdotdot, Wwdbcomb, gridControl, Menus, Math, OleServer, DBGrids,
  shellapi, ToolWin,
  clipbrd, wwExport, ImgList, wwclearbuttongroup, wwradiogroup, wwcheckbox,
  ppCtrls, ppBands, ppVar, ppPrnabl,
  ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  Spin, Excel2000;

type
  TDMCXP = class(TDataModule)
    cdsMovCxP: TwwClientDataSet;
    dsMovCxP: TwwDataSource;
    cdsOPago: TwwClientDataSet;
    cdsCanje: TwwClientDataSet;
    dsDetCxP: TwwDataSource;
    dsOPago: TwwDataSource;
    dsCanje: TwwDataSource;
    dsCia: TwwDataSource;
    dsTMon: TwwDataSource;
    dsTDiario: TwwDataSource;
    dsBanco: TwwDataSource;
    dsCCBco: TwwDataSource;
    dsTDoc: TwwDataSource;
    dsFPago: TwwDataSource;
    dsProv: TwwDataSource;
    dsCuenta: TwwDataSource;
    dsCCosto: TwwDataSource;
    cdsCia: TwwClientDataSet;
    cdsTMon: TwwClientDataSet;
    cdsTDiario: TwwClientDataSet;
    cdsBanco: TwwClientDataSet;
    cdsCCBco: TwwClientDataSet;
    cdsTDoc: TwwClientDataSet;
    cdsFPago: TwwClientDataSet;
    cdsProv: TwwClientDataSet;
    cdsCuenta: TwwClientDataSet;
    cdsCCosto: TwwClientDataSet;
    cdsTipReg: TwwClientDataSet;
    dsTipReg: TwwDataSource;
    cdsCnpEgr: TwwClientDataSet;
    dsCnpEgr: TwwDataSource;
    cdsdetcanje: TwwClientDataSet;
    dsDetCanje: TwwDataSource;
    cdsUltTGE: TwwClientDataSet;
    cdsLetras: TwwClientDataSet;
    dsLetras: TwwDataSource;
    cdsMovCxP2: TwwClientDataSet;
    cdsQry: TwwClientDataSet;
    dsUltTGE: TwwDataSource;
    cdsDetCxP2: TwwClientDataSet;
    dsMovCxP2: TwwDataSource;
    cdsPagare: TwwClientDataSet;
    dsPagare: TwwDataSource;
    cdsDetCanje2: TwwClientDataSet;
    dsDetCanje2: TwwDataSource;
    tbCoaFact: TwwTable;
    tbCoaNotas: TwwTable;
    cdsCoaProv: TwwClientDataSet;
    dsCoaProv: TwwDataSource;
    cdsReglas: TwwClientDataSet;
    dsReglas: TwwDataSource;
    cdsUsuarios: TwwClientDataSet;
    dsUsuarios: TwwDataSource;
    dsGrupos: TwwDataSource;
    cdsGrupos: TwwClientDataSet;
    cdsMGrupo: TwwClientDataSet;
    dsMGrupo: TwwDataSource;
    cdsAcceso: TwwClientDataSet;
    dsAcceso: TwwDataSource;
    cdsDoc2: TwwClientDataSet;
    dsDoc2: TwwDataSource;
    cdsClAux: TwwClientDataSet;
    dsClAux: TwwDataSource;
    cdsTipReg2: TwwClientDataSet;
    dsTipReg2: TwwDataSource;
    cdsCierre: TwwClientDataSet;
    dsCierre: TwwDataSource;
    cdsNivel: TwwClientDataSet;
    dsNivel: TwwDataSource;
    cdsCuenta2: TwwClientDataSet;
    cdsCuenta3: TwwClientDataSet;
    dsCuenta2: TwwDataSource;
    dsCuenta3: TwwDataSource;
    cdsRCuenta: TwwClientDataSet;
    cdsRCCosto: TwwClientDataSet;
    dsRCuenta: TwwDataSource;
    dsRCCosto: TwwDataSource;
    cdsCtaConsol: TwwClientDataSet;
    dsCtaConsol: TwwDataSource;
    cdsTipCta: TwwClientDataSet;
    dsTipCta: TwwDataSource;
    cdsDetCxP: TwwClientDataSet;
    cdsMovCNT: TwwClientDataSet;
    dsMovCNT: TwwDataSource;
    cdsPais: TwwClientDataSet;
    dsPais: TwwDataSource;
    cdsDpto: TwwClientDataSet;
    dsDpto: TwwDataSource;
    cdsProvinc: TwwClientDataSet;
    dsProvinc: TwwDataSource;
    cdsDistrito: TwwClientDataSet;
    dsDistrito: TwwDataSource;
    cdsSecEco: TwwClientDataSet;
    dsSecEco: TwwDataSource;
    cdsQry2: TwwClientDataSet;
    cdsQry3: TwwClientDataSet;
    cdsQry4: TwwClientDataSet;
    cdsQry5: TwwClientDataSet;
    dsQry: TwwDataSource;
    dsQry2: TwwDataSource;
    dsQry3: TwwDataSource;
    dsQry4: TwwDataSource;
    dsQry5: TwwDataSource;
    cdsPresup: TwwClientDataSet;
    dsPresup: TwwDataSource;
    cdsGiro: TwwClientDataSet;
    dsGiro: TwwDataSource;
    cdsClasif: TwwClientDataSet;
    dsClasif: TwwDataSource;
    cdsFactor: TwwClientDataSet;
    cdsGrab: TwwClientDataSet;
    dsGrab: TwwDataSource;
    cdsReporte: TwwClientDataSet;
    dsReporte: TwwDataSource;
    cdsSQL: TwwClientDataSet;
    dsSQL: TwwDataSource;
    cdsCXP: TwwClientDataSet;
    dsCXP: TwwDataSource;
    cdsResp: TwwClientDataSet;
    dsResp: TwwDataSource;
    cdsCLAux1: TwwClientDataSet;
    dsCLAux1: TwwDataSource;
    cdsTipPre: TwwClientDataSet;
    dsTipPre: TwwDataSource;
    cdsPlaParPre: TwwClientDataSet;
    cdsNivelPresu: TwwClientDataSet;
    cdsDetallePres: TwwClientDataSet;
    dsPlaParPre: TwwDataSource;
    dsNivelPresu: TwwDataSource;
    dsDetallePres: TwwDataSource;
    cdsCjeCxC: TwwClientDataSet;
    cdsDetCjeClie: TwwClientDataSet;
    cdsDetCjeProv: TwwClientDataSet;
    dsCjeCxC: TwwDataSource;
    dsDetCjeClie: TwwDataSource;
    dsDetCjeProv: TwwDataSource;
    cdsSitua: TwwClientDataSet;
    dsSitua: TwwDataSource;
    cdsTipProv: TwwClientDataSet;
    dsTipProv: TwwDataSource;
    cdsMTipProv: TwwClientDataSet;
    dsMTipProv: TwwDataSource;
    cdsTipPer: TwwClientDataSet;
    dsTipPer: TwwDataSource;
    cdsResultSet: TwwClientDataSet;
    cdsQry6: TwwClientDataSet;
    dsQry6: TwwDataSource;
    cdsCCanje: TwwClientDataSet;
    dsCCanje: TwwDataSource;
    cdsDetRet: TwwClientDataSet;
    dsDetRet: TwwDataSource;
    cdsCanjeClone: TwwClientDataSet;
    cdsGArti: TwwClientDataSet;
    dsQry7: TwwDataSource;
    cdsQry7: TwwClientDataSet;
    cdsQry8: TwwClientDataSet;
    cdsQry9: TwwClientDataSet;
    cdsQry10: TwwClientDataSet;
    cdsQry11: TwwClientDataSet;
    cdsQry12: TwwClientDataSet;
    cdsQry13: TwwClientDataSet;
    dsQry8: TwwDataSource;
    dsQry9: TwwDataSource;
    dsQry10: TwwDataSource;
    dsQry11: TwwDataSource;
    dsQry12: TwwDataSource;
    dsQry13: TwwDataSource;
    cdsQry1: TwwClientDataSet;
    dsQry1: TwwDataSource;
    dsQry15: TwwDataSource;
    cdsQry15: TwwClientDataSet;
    dsQry14: TwwDataSource;
    cdsQry14: TwwClientDataSet;
    cdsHLetras: TwwClientDataSet;
    dsHLetras: TwwDataSource;
    cdsDetPagoLiq: TwwClientDataSet;
    dsDetPagoLiq: TwwDataSource;
    cdsQry16: TwwClientDataSet;
    dsQry16: TwwDataSource;
    cdsUser: TwwClientDataSet;
    dsUser: TwwDataSource;
    cdsUsuarioAct: TwwClientDataSet;
    DCOM1: TSocketConnection;
    dsDetCxP2: TwwDataSource;
    DSAUXID: TwwDataSource;
    CDSAUXID: TwwClientDataSet;
    DSRETENCION: TwwDataSource;
    CDSRETENCION: TwwClientDataSet;
    CDSTASARET: TwwClientDataSet;
    DSTASARET: TwwDataSource;
    cdsConsulta: TwwClientDataSet;
    dsConsulta: TwwDataSource;
    CDSSUNAT: TwwClientDataSet;
    DSSUNAT: TwwDataSource;
    cdsGrabaLog: TwwClientDataSet;
    dsTipo: TwwDataSource;
    cdsTipo: TwwClientDataSet;
    dsOper: TwwDataSource;
    cdsOper: TwwClientDataSet;
    dsRegCompra: TwwDataSource;
    cdsRegCompra: TwwClientDataSet;
    dsDaotDetalle: TwwDataSource;
    cdsDaotDetalle: TwwClientDataSet;
    ExcelApp: TExcelApplication;
    ExcelBook: TExcelWorkbook;
    WS: TExcelWorksheet;
    cdsRegNodom: TwwClientDataSet;
    dsRegNodom: TwwDataSource;
    cdsReg2daCat: TwwClientDataSet;
    dsReg2daCat: TwwDataSource;
 // Inicio HPC_201604_CXP
    cdsQryRUC: TwwClientDataSet;
    dsQryRUC: TwwDataSource;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
    cdsQryCCosto: TwwClientDataSet;
    dsQryCCosto: TwwDataSource;
// Fin HPC_201707_CXP
// Inicio HPC_201801_CXP
// Implementación de Dietas de Directorio
    cdsCargDirect: TwwClientDataSet;
    dsCargDirect: TwwDataSource;
    dsPlantillaCab: TwwDataSource;
    cdsPlantillaCab: TwwClientDataSet;
    cdsPlantillaDet: TwwClientDataSet;
    dsPlantillaDet: TwwDataSource;
    cdsPlantillaDConcepto: TwwClientDataSet;
    dsPlantillaDConcepto: TwwDataSource;
    cdsCondicional: TwwClientDataSet;
    dsCondicional: TwwDataSource;
    dsUltPlani: TwwDataSource;
    cdsUltPlani: TwwClientDataSet;
    cdsPlanillaDet: TwwClientDataSet;
    dsPlanillaDet: TwwDataSource;
    cdsPlanillaCab: TwwClientDataSet;
    dsPlanillaCab: TwwDataSource;
    dsPlanillaDConcepto: TwwDataSource;
    cdsPlanillaDConcepto: TwwClientDataSet;
    cdsPlanillaBanco: TwwClientDataSet;
    dsPlanillaBanco: TwwDataSource;	
// Inicio HPC_201803_CXP
// Se adicionó cds para atender pedido de solicitud de Orden de Pago
    cdsCiaOP: TwwClientDataSet;
    dsCiaOP: TwwDataSource;											
// Fin HPC_201803_CXP
// Fin HPC_201801_CXP
    
    procedure ControlTran;
    procedure cdsCanjeCCPMOLOCChange(Sender: TField);
    procedure cdsCanjeCCPMOEXTChange(Sender: TField);
    procedure cdsCanjeCCPTCCJEChange(Sender: TField);
    procedure cdsDetCanjeDCDMOLOCChange(Sender: TField);
    procedure cdsDetCanjeDCDMOEXTChange(Sender: TField);
    procedure cdsCuentaAfterOpen(DataSet: TDataSet);
    procedure cdsDetCxPReconcileError(DataSet: TClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdsMovCNTReconcileError(DataSet: TClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdsCCanjeReconcileError(DataSet: TClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdsSQLReconcileError(DataSet: TClientDataSet;    E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdsdetcanjeReconcileError(DataSet: TClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsMovCxP2ReconcileError(DataSet: TClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsMovCxPReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
     xxCia,xMesT,xMes,xAno : string;
     xDigitos,xDigitos1 : Integer;
     FormatCel: Array Of OleVariant;
   procedure GrabaSaldos;

  public
    { Public declarations }
    // Variables de Reglas de Negocios
    cFilterCiaUser     : String;
    cFilterOrigenUser  : String;
    cFilterCuentaUser  : String;
    cFilterUsuarioUser : String;
    cFilterUsuarioUserOrd : String;
    cFilterUsuarioUserDet : String;

    cIP, wOfiId, widepc, ideconex, fechorcon :String;

    inifile : TIniFile;
//    SRV_D   : String;
    sClose, wSRV : String;

    wAnchoProv : Integer;
    wAnchoLote : Integer;

	 wRepFuncDate,
    wFormatFecha,
	 wReplacCeros,
    wRepHorServi,
	 wRepFecServi       : String;
    wSRV_RUTA          : String;
    wVRN_OrdenCompra   : String;
    wVRN_OrdenPago     : String;
    wVRN_PagosParciales: String;
    wVRN_TipoCambio    : String;
    wVRN_TCambioFijo   : String;
    wVRN_GlosaDup      : String;
    wVRN_InterMed      : String;
    wVRN_CptoCia       : String;
    wVRN_CCosCia       : String;
    wVRN_ProvAutoDD    : String;
    wVRN_ProvOrden     : String;
    wVRN_AutoDDLC      : String;
    wVRN_GlosaRep      : String;
    wVRN_ObTDiario     :String;
    //
    wTMonExt   : string; // Tipo de Moneda extranjera oficial (normalmente dólares)
    wTMonLoc   : string;
    wUserName  : array[0..63] of char;
    wUsuario   : string;
    wComponente: TControl;
    wObjetoDescr: String;
    wObjetoForma: String;
    wObjetoNombr: String;
    wObjetoDesPr: String;
    wModulo    : String;
    wGrupo     : String;
    wGrupoTmp  : String;
    wAdmin     : String;
    wDifAjuG   : String;  // Cuenta de Ganancia x Dif.Cambio
    wDifAjuP   : String;  // Cuenta de Pérdida x Dif.Cambio
    wModifica  : Boolean;
    wModo      : String;
    wTIPOREG1  : String;
    wTIPOREG2  : String;
    wsLet, wsAnt, wsNCre, wsNCreS, wsFac, wsBol, wsNDe, wsFChe, wsChe, wsCob : String;
    wTipoAdicion : String; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa

 // Inicio HPC_201601_CXP
 // Se define la variable wTMonLocDes para descripción de la Moneda Local
    wTMonLocDes : String;
 // Se define la variable wTMonExtDes para descripción de la Moneda Extranjera
    wTMonExtDes : String;
 // Fin HPC_201601_CXP

    procedure AbreCierraCDS(xxCds : Array of TwwClientDataSet;xxNom : Array of String; xBool : Boolean);
    //**
    procedure MovCxPDataRequest( xSQLx:String; xFCxP,xFCxP2,xFLet:Boolean );
    procedure  SaldosAuxiliar( xxCia,xxAnoMes,xxClAux,xxAux,xxSigno:String;
                               xxImpMN,xxImpME: Double; xxTMonid : String );
    procedure AccesosUsuarios( xxModulo,xxUsuario,xxTipo,xxForma:String );
    procedure AccesosUsuariosR(xxModulo,xxUsuario,xxTipo:String; xxForma:TForm);
    procedure AplicaDatos( wCDS:TwwClientDataSet; wNomArch:String );
    function BuscaUltTGE(xPrv,xTabla,xCampo,xWhere:String):String;
    function DisplayDescrip(PTable,PDescrip,PKey,PVal:String):string; overload;
    function DisplayDescrip2(wPrv,wTabla,wCampos,wWhere,wResult:string):string; overload;
    function BuscaUltFecha(xPrv,xTabla,xCampo,xWhere:String): TDate;
    function UltimoRegistro( xAutoNum,xCia,xTDiario,xAno,xMes:String ):String;
    function UltimoRegistroCXP( xAutoNum,xCia,xTDiario,xAno,xMes:String ):String;
// Inicio HPC_201801_CXP
// Implementación de Dietas de Directorio
    function UltimoRegistroCD :String;
    function UltimoRegistroPlantilla :String;
    function UltimoRegistroPlanilla :String;
// Fin HPC_201801_CXP
    function GrabaUltimoRegistro( xAutoNum,xCia,xTDiario,xAno,xMes:String; xNumUsu:Integer ):String;
    function DesEncripta(wPalabra:String): String;
    function Encripta(wPalabra:String): String;
    function BuscaFecha(PTable,PDescrip,PKey: String; PVal:TDateTime ): Boolean;
    function BuscaObjeto( Const xNombre:String; xForm:TForm ):TControl ;
    function BuscaCxPReg( PCia,PTDiario,PAnoMes,PNoReg:String):Boolean;
    function BuscaCxPDoc( PCia,PProv,PDoc,PSerie,PNoDoc:String):Boolean;
    //Inicio HPC_201705_CXP
    //nueva funcion para buscar documentos duplicados
    function BuscaCxPDocDup( PClaux,PProv,PDoc,PSerie,PNoDoc:String):Boolean;
    //Fin HPC_201705_CXP
    function BuscaCxPDoc2( PCia,PProv,PDoc,PSerie,PNoDoc,PTD,PAM,PNR :String):Boolean;
    function BuscaCxP310( PCia,PTDiario,PAnoMes,PNoReg,PCanje:String):Boolean;
    function BuscaPagare( PCia,PDoc,PNoPag:String):Boolean;
    function BuscaOPago( PCia,PNoOPa:String):Boolean;
    function BuscaCanje( PCia,PTCa,PNoCje:String):Boolean;
    // Contabilidad
    procedure GeneraCorrelativoCtasAutom( xCia, xTDiario, xAnoMM : String) ;

    procedure GeneraContab( xxCia, xxTDiario, xxAnoMM, xxNoComp: String;
                            xForma: TForm; xTipoC : String );
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
    procedure GeneraContab_NC( xxCia, xxTDiario, xxAnoMM, xxAnoMM_Busq, xxNoComp: String;
                            xForma: TForm; xTipoC : String );
    procedure Transferencia_CXP_a_CNT_NC( xCia, xTDia, xAAMM, xAAMM_Busq, xNoComp, xTipoC : String );
    procedure GeneraDiferenciaCambioNC( xContR: Integer; xxTCambio,xDif : Double; xCuenta,xCia,xTDia,xAAMM,xNoComp,xTipoC : String; wCDS:TwwClientDataSet; wCDS2:TwwClientDataSet );
// Fin HPC_201707_CXP

    procedure Transferencia_CXP_a_CNT( xCia, xTDia, xAAMM, xNoComp, xTipoC : String );
    // Fin Contabilidad
    procedure GrabaAuxConta( wCDST:TClientDataSet );
    function RecuperarDatos(xTabla , xCampos , xWhere : String) : Boolean ;
    function  strDia (Fecha : TDateTime) : String ;
    function strMes (Fecha : TDateTime) : String ;
    function strAno (Fecha : TDateTime) : String ;
    function GetWhereFromSQL(xSQL: String): String;
    //** 16/04/2001
		function MaxProv(const sCIA: String): String;
    function MaxSQL(const sTabla, sMxCampo, sCondicion: String): String;
    //**
    function MesCerrado(xMes, xAno, xCiaid: String): Boolean;
    procedure GeneraEnLinea401P( xxxCia,xxxDiario,xxxAnoMM: String );
    procedure HalloCXPREG(xxCia,xxDiar,xxPer,xxNreg:string);
    procedure CuadraAsiento;
    function  UltimoRegistroCXP310( xCia, xTDiario, xAnoMes : String ) : String;
    function LaCuentaSeRegistraSoloEnME(xxCia:string;xxCpto:string='';xxCuenta:string=''):boolean;
    procedure FiltraTabla( xxCds:TwwClientDataSet; xxArchivo,xxCampo:String  );

    // Tablas Remoto
    procedure FiltraTablaRemoto( xxCds:TwwClientDataSet; xxArchivo, xxCampo, xxFilter : String  );
    function DisplayDescripCds( wwCds: TwwClientDataSet; wWhere, wResult : string; wLiberar : Boolean ) : string;
    //
    procedure ActualizaFiltro(wwFiltro:TMant; wwCdsLee:TwwClientDataSet; wwAccion:String);
    procedure Verpercadpas;
    function ObtenerIpdeNetbios(Host: string): string;
    function ComputerName: string;
    function AccesosModulo :  Boolean;
    procedure formatosNumericos;
    procedure ExportaGridExcel(xDataGrid:TwwDBGrid;xFileName:String);

    function FiltraCiaPorUsuario( cdsCiaUser :TwwClientDataSet ) : String;
    function FiltraCuentaPorUsuario_Cia( xxArchivo, xxCampo  : String ) : String;
    function FiltraOrigenPorUsuario_Cia( xxArchivo, xxCampo  : String ) : String;
    function FiltraUsuarioPorUsuario_Cia( xxArchivo, xxCampo : String ) : String;
    function FiltraTablaxCia( xxCds:TwwClientDataSet; xxArchivo, xxCampo, xxCiaSel : String  ) : String;

    function Accesos_a_Registros( sUsuarioReg : String ) : Boolean;

    procedure Graba_Log_Consultas( sLog_Modulo, sLog_Usuario, sLog_Opcion,
       sLog_Cia, sLog_PerIni, sLog_PerFin, sLog_FecIni, sLog_FecFin, sLog_Nivel,
       sLog_Diario, sLog_Lote, sLog_Moneda, sLog_Cuentas, sLog_Auxs, sLog_Costos,
       sLog_TipSal, sLog_TipRep : String );
    Procedure HojaExcel(Tit: String; TDs: TDataSource; TDb: TDBGrid);
    Procedure FormatosCeldas(N: Integer; TDs: TDataSource);
   // Inicio HPC_201401_CXP
      Function fg_VerificaVersion(wgVersion: String): Boolean;
   // Fin HPC_201401_CXP

   // Inicio HPC_201604_CXP
      Function fg_ValidaNroRUC(wgRUC: String): Boolean;
   // Fin HPC_201604_CXP

   // Inicio HPC_201801_CXP
   // Implementación de Accesos a la Opción de Dietas
      Function wf_AccesoOpcion(wOpcion: String): Boolean;
   // Función que valida si string es alfanumérica
      Function isAlfanumerico(ICad: String): boolean;
   // Fin HPC_201801_CXP

  end;

var

  DMCXP: TDMCXP;

  wBD : String;
  vFecCie, vFecIni : Tdate;
  vyear2, vmonth2, vday2 : word;

  xNombreBoton : String;
  ErrorCount   : Integer;

  xFRecep  : TDate;
  xFlagCal : Boolean;
  //*CIM 15/02/2001
  xFlagCalC : Boolean;
  xFlagCalP : Boolean;
  //////////////////
  cdsCloneDetCxP    : TwwClientDataSet;
  pnlConta : TPanel;
  //pbConta  : TProgressBar;
  //** 12/12/2000 - pjsv
  wActuaPresu : bool;
  //**
  //** 06/06/2001 - pjsv
  SRV_E : String;
  SRV_D : String;
  SRV_V : String;
  wRptCia, wRutaRpt : String;
  wAnchoPu : Integer;
  wSigueGrab : boolean; // HPC_201406_CXP
  //**
  procedure Filtracds( xxCds:TwwClientDataSet; xxSQL:String  );
  function  OperClientDataSet( ClientDataSet : TwwClientDataSet;
                            Expression, Condicion : String  ) : Double;
  function  StrZero(xVar:string;xLargo:integer):string;
  function  FRound(xReal:double;xEnteros,xDecimal:Integer):double;
  function  BuscaQry(wPrv,wTabla,wCampos,wWhere,wResult:String):string;
  procedure RecuperarCiaUnica(ComboLookUp:TwwDBLookupCombo;Edicion:TCustomEdit);
  function  FechaDB2(Fecha : TDateTime) : String ;
  procedure cdsPost( xxCds:TwwClientDataSet );

  Function  UltDiaMes(xAnoMes : String) : String;
  Function  xControlFec (xCia : String; xFecha : TDateTime ) : Boolean;
  Function DateS():TDatetime; // devuelve fecha del servidor

implementation

{$R *.DFM}

Uses CXP020;


procedure TDMCXP.Graba_Log_Consultas( sLog_Modulo, sLog_Usuario, sLog_Opcion,
  sLog_Cia, sLog_PerIni, sLog_PerFin, sLog_FecIni, sLog_FecFin, sLog_Nivel,
  sLog_Diario, sLog_Lote, sLog_Moneda, sLog_Cuentas, sLog_Auxs, sLog_Costos,
  sLog_TipSal, sLog_TipRep : String );
var
  sLogC : String;
  sLogV : String;
begin
  sLogC:='insert into db2admin.aud_acc_oasis_log( modulo, fecha, usuario, opcion';
  sLogV:='values( '''+sLog_Modulo+''', SYSDATE, '''+sLog_Usuario+''', '''+sLog_Opcion+'''';

  if sLog_Cia<>'' then
  begin
     sLogC:=sLogC+', ciaid';
     sLogV:=sLogV+', '''+sLog_Cia+'''';
  end;

  if sLog_PerIni<>'' then
  begin
     sLogC:=sLogC+', per_ini';
     sLogV:=sLogV+', '''+sLog_PerIni+'''';
  end;

  if sLog_PerFin<>'' then
  begin
     sLogC:=sLogC+', per_fin';
     sLogV:=sLogV+', '''+sLog_PerFin+'''';
  end;

  if sLog_FecIni<>'' then
  begin
     sLogC:=sLogC+', fec_Ini';
     sLogV:=sLogV+', '''+sLog_FecIni+'''';
  end;

  if sLog_FecFin<>'' then
  begin
     sLogC:=sLogC+', fec_Fin';
     sLogV:=sLogV+', '''+sLog_FecFin+'''';
  end;

  if sLog_Nivel<>'' then
  begin
     sLogC:=sLogC+', nivel';
     sLogV:=sLogV+', '''+sLog_Nivel+'''';
  end;

  if sLog_Diario<>'' then
  begin
     sLogC:=sLogC+', origen';
     sLogV:=sLogV+', '''+sLog_Diario+'''';
  end;

  if sLog_Lote<>'' then
  begin
     sLogC:=sLogC+', lote';
     sLogV:=sLogV+', '''+sLog_Lote+'''';
  end;

  if sLog_Moneda<>'' then
  begin
     sLogC:=sLogC+', moneda';
     sLogV:=sLogV+', '''+sLog_Moneda+'''';
  end;

  if sLog_Cuentas<>'' then
  begin
     sLogC:=sLogC+', cuentas';
     sLogV:=sLogV+', '''+sLog_Cuentas+'''';
  end;

  if sLog_Auxs<>'' then
  begin
     sLogC:=sLogC+', auxs';
     sLogV:=sLogV+', '''+sLog_Auxs+'''';
  end;

  if sLog_Costos<>'' then
  begin
     sLogC:=sLogC+', ccostos';
     sLogV:=sLogV+', '''+sLog_Costos+'''';
  end;

  if sLog_TipSal<>'' then
  begin
     sLogC:=sLogC+', tipo_salida';
     sLogV:=sLogV+', '''+sLog_TipSal+'''';
  end;

  if sLog_TipRep<>'' then
  begin
     sLogC:=sLogC+', tipo_rep';
     sLogV:=sLogV+', '''+sLog_TipRep+'''';
  end;

  sLogC:=sLogC+' ) ';
  sLogV:=sLogV+' ) ';

  cdsGrabaLog.Close;
  cdsGrabaLog.DataRequest( sLogC+sLogV );
  try
     cdsGrabaLog.Execute;
  except
  end;
end;



function TDMCXP.Accesos_a_Registros( sUsuarioReg : String ) : Boolean;
begin
   Result:=False;
   if wAdmin='C' then
   begin
      ShowMessage('Usuario '+wUsuario+', Solo tiene Acceso a consultar los Comprobantes registrados por : '+sUsuarioReg);
      Exit;
   end;

   if wAdmin='U' then
   begin
      if sUsuarioReg<>wUsuario then
      begin
         ShowMessage('Usuario '+wUsuario+', no tiene Acceso a modificar los Comprobantes Registrados por : '+sUsuarioReg);
         Exit;
      end;
   end;
   Result:=True;
end;


function TDMCXP.FiltraTablaxCia( xxCds:TwwClientDataSet; xxArchivo, xxCampo, xxCiaSel : String  ) : String;
var
   xFiltro : String;
   xSQL2:string;
begin
   cdsAcceso.Filtered := False;
   cdsAcceso.Filter   := '';
   cdsAcceso.Filter   := 'NTABLA='+''''+xxArchivo+''' and CIAID='''+xxCiaSel+''' ';
   cdsAcceso.Filtered := True;

   xFiltro:='';
   cdsAcceso.First;
   while not cdsAcceso.Eof do begin
      If Length(xFiltro)=0 then
         xFiltro:= xxCampo+' IN ('+''''+cdsAcceso.FieldByName('CODIGO').AsString+''', '
      else
         xFiltro:=xFiltro+''''+cdsAcceso.FieldByName('CODIGO').AsString+''', ';
      cdsAcceso.Next;
   end;

   if Length(xFiltro)>0 then
   begin
      xFiltro:=Copy( xFiltro, 1, length(xFiltro)-2 ) + ' ) ';
   end;

   xxCds.Filtered:=False;
   xxCds.Filter  :='';
   xxCds.Filter  :=xFiltro;
   xxCds.Filtered:=True;

   Result:=xFiltro;
end;


function TDMCXP.FiltraCiaPorUsuario( cdsCiaUser :TwwClientDataSet ) : String;
var
   cFilter : String;
begin
   cFilter:='';
   cdsCiaUser.First;
   while not cdsCiaUser.Eof do
   begin
      if cFilter='' then
         cFilter:=' CIAID IN ( '''+cdsCiaUser.FieldByName('CIAID').AsString+''''
      else
         cFilter:=cFilter+', '''+cdsCiaUser.FieldByName('CIAID').AsString+'''';

      cdsCiaUser.Next;
   end;

   if cFilter<>'' then
      cFilter:=cFilter+' ) ';

   Result:=cFilter;
end;


function TDMCXP.FiltraCuentaPorUsuario_Cia( xxArchivo, xxCampo : String ) : String;
var
   xFiltro : String;
   xCiaFil : String;
begin
   xCiaFil:=DMCXP.cFilterCiaUser;

   cdsAcceso.Filtered := False;
   cdsAcceso.Filter   := '';
   cdsAcceso.Filter   := 'NTABLA='+''''+xxArchivo+'''';
   cdsAcceso.Filtered := True;

   xFiltro := '';
   cdsAcceso.First;
   while not cdsAcceso.Eof do
   begin
      if cdsAcceso.FieldByName('CIAID').AsString<>'' then
      begin
         if Length(xFiltro)=0 then
            xFiltro:='(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +   xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')'
         else
            xFiltro:=xFiltro+' OR '
                    +'(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')';

         if xCiaFil<>'' then
         begin
            xCiaFil:=StringReplace(xCiaFil,''''+cdsAcceso.FieldByName('CIAID').AsString+''',','',[rfReplaceAll]);
            xCiaFil:=StringReplace(xCiaFil,''''+cdsAcceso.FieldByName('CIAID').AsString+'''' ,'',[rfReplaceAll]);
         end;

      end;

      cdsAcceso.Next;
   end;
   if xCiaFil=' CIAID IN (  ) ' then
      xCiaFil:=''
   else
      xCiaFil:=' or '+xCiaFil;


   if xFiltro<>'' then
      xFiltro:=' ( '+ xFiltro + xCiaFil +' ) ';

   Result:=xFiltro;
end;



function TDMCXP.FiltraOrigenPorUsuario_Cia( xxArchivo, xxCampo : String ) : String;
var
   xFiltro : String;
   xCiaFil : String;
begin
   xCiaFil:=cFilterCiaUser;

   cdsAcceso.Filtered := False;
   cdsAcceso.Filter   := '';
   cdsAcceso.Filter   := 'NTABLA='+''''+xxArchivo+'''';
   cdsAcceso.Filtered := True;

   xFiltro := '';
   cdsAcceso.First;
   while not cdsAcceso.Eof do begin
      if cdsAcceso.FieldByName('CIAID').AsString<>'' then
      begin
         If Length(xFiltro)=0 then
            xFiltro:='(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +   xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')'
         else
            xFiltro:=xFiltro+' OR '
                    +'(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')';

         if xCiaFil<>'' then
         begin
            xCiaFil:=StringReplace(xCiaFil,''''+cdsAcceso.FieldByName('CIAID').AsString+''',','',[rfReplaceAll]);
            xCiaFil:=StringReplace(xCiaFil,''''+cdsAcceso.FieldByName('CIAID').AsString+'''' ,'',[rfReplaceAll]);
         end;

      end;
      cdsAcceso.Next;
   end;

   if xCiaFil=' CIAID IN (  ) ' then
      xCiaFil:=''
   else
      xCiaFil:=' or '+xCiaFil;

   if xFiltro<>'' then
      xFiltro:=' ( '+ xFiltro + xCiaFil +' ) ';

   Result:=xFiltro;
end;


function TDMCXP.FiltraUsuarioPorUsuario_Cia( xxArchivo, xxCampo : String ) : String;
var
   xFiltro : String;
begin
   cdsAcceso.Filtered := False;
   cdsAcceso.Filter   := '';
   cdsAcceso.Filter   := 'NTABLA='+''''+xxArchivo+'''';
   cdsAcceso.Filtered := True;

   xFiltro := '';
   cdsAcceso.First;
   while not cdsAcceso.Eof do begin
      if cdsAcceso.FieldByName('CIAID').AsString<>'' then
      begin
         If Length(xFiltro)=0 then
            xFiltro:='(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +   xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')'
         else
            xFiltro:=xFiltro+' OR '
                    +'(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')';
      end;
      cdsAcceso.Next;
   end;

   if xFiltro<>'' then
      xFiltro:=' ( '+ xFiltro+ ' or ('+cFilterCiaUser+' and '+xxCampo+'='''+wUsuario+''')'+ ' ) '
   else
      xFiltro:=' ( '+'('+cFilterCiaUser+' and '+xxCampo+'='''+wUsuario+''')'+ ' ) ';
      
   if (wAdmin='V') or (wAdmin='P') or (wAdmin='G') then
      xFiltro:=' ( '+xxCampo+' is not NULL ) ';

   Result:=xFiltro;
end;


procedure TDMCXP.ExportaGridExcel(xDataGrid: TwwDBGrid; xFileName: String);
begin
     Screen.Cursor:=crHourGlass;
     with xDataGrid,xDataGrid.ExportOptions do begin
        ExportType := wwgetSYLK;
        FileName := xFileName+'.xls';
        Save;
        if not(esoClipboard in Options) then
        ShellExecute(Handle, 'Open', PChar(xDataGrid.exportoptions.Filename), nil, nil, sw_shownormal);
     end;
     Screen.Cursor:=crDefault;
end;


function TDMCXP.ObtenerIpdeNetbios(Host: string): string;
var
  WSAData: TWSADATA;
  HostEnt: phostent;
begin
  Result:= '';
  if WSAStartup(MAKEWORD(1, 1), WSADATA) = 0 then
  begin
    HostEnt:= gethostbyname(PChar(Host));
    if HostEnt <> nil then
      Result:= String(inet_ntoa(PInAddr(HostEnt.h_addr_list^)^));
    WSACleanup;
  end;
end;


function TDMCXP.ComputerName: string;
var
  Buffer: array[ 0..100 ] of Char;
  MaxSize: Cardinal ;
begin
  MaxSize := SizeOf( Buffer );
  if not GetComputerName( @Buffer, MaxSize ) then
    raise Exception.Create( 'No puedo determinar el nombre de la máquina' );
  Result := StrPas( @Buffer );
end;


function UltDiaMes(xAnoMes : String) : String;
var
	xFAnt : String;
  xMes, xAno : String;
begin
  xMes := copy(xAnoMes,5,2);
  xAno := copy(xAnoMes,1,4);
  if  xMes = '12' then
  begin
    xAno:=FloatToStr(strtofloat(xAno)+1);
  	xMes := '01';
  end
  else
  begin
  	xMes:=FloattoStr(StrtoFloat(xMes)+1);
    xAno:=xAno
  end;
	xFAnt:='01/'+xMes+'/'+xAno;
  xFAnt:=DateToStr(StrToDate(xFAnt)-1);
	xFAnt:=copy(xFAnt,1,2)+'/'+copy(xAnoMes,5,2)+'/'+copy(xAnoMes,1,4);
	Result:=xFAnt;
end;


function xControlFec(xCia: String; xFecha: TDateTime): Boolean;
var
	sSQL : String;
begin
  if (DMCXP.wModo = 'A') OR (DMCXP.wModo = 'M') then
  begin

     sSql:='SELECT * FROM TGE154 WHERE CIAID='+quotedstr( xCia )+
           ' AND ANO='+quotedstr(Copy(DateToStr(xFecha),7,4));
    DMCXP.cdsReporte.Close;
    DMCXP.cdsReporte.DataRequest(sSQL);
    DMCXP.cdsReporte.Open;
     if DMCXP.cdsReporte.FieldByName('PER'+Copy(DateToStr(xFecha),4,2)).AsString = 'S' then
     begin
        Showmessage('El Periodo Contable se encuentra Cerrado');
        Result:=False;
        exit;
     end;

    sSQL := 'SELECT FINICIO, FCIERRE FROM CXP202'
       +' WHERE CIAID='+quotedstr(xCia)
       +' ORDER BY NOCIERRE';
    DMCXP.cdsReporte.Close;
    DMCXP.cdsReporte.DataRequest(sSQL);
    DMCXP.cdsReporte.Open;

    if DMCXP.cdsReporte.RecordCount = 0 then
    begin
      ShowMessage( 'Error :  No Existe Frecuencia de Cierre ');
      Result:=False;
      Exit;
    end
    else
    if DMCXP.cdsReporte.RecordCount > 0 then
    begin
      DMCXP.cdsReporte.Last;
      if (xFecha >=  DMCXP.cdsReporte.FieldByName('FINICIO').AsDateTime) and
         (xFecha <= DMCXP.cdsReporte.FieldByName('FCIERRE').AsDateTime) then
      begin
        Result:=True;
        Exit;
      end;
      vFecIni := DMCXP.cdsReporte.Fieldbyname('FINICIO').AsDateTime;
      vFecCie := DMCXP.cdsReporte.Fieldbyname('FCIERRE').AsDateTime;
      DecodeDate(xFecha, vyear2,vmonth2,vday2);  // Digitada

      ShowMessage( 'Error :  No se Puede Registrar El Documento al '+#13+#13
                +IntToStr(vday2)+' de '+LongMonthNames[vmonth2]+' del '+IntToStr(vyear2)+' '+#13+#13+
                'Fecha No esta dentro del Rango Permitido del '+datetostr(vFecIni)+ ' al '+datetostr(vFecCie));
    end;

    Result:=False;
  end;
end;

procedure cdsPost( xxCds:TwwClientDataSet );
var
   i:integer;
begin
   for i:=0 to xxCds.Fields.Count-1 do begin

       if xxCds.Fields[ i ].ClassType=TStringField then begin
          if xxCds.Fields[ i ].AsString='' then
             xxCds.Fields[ i ].Clear;
       end;

       if xxCds.Fields[ i ].ClassType=TMemoField then begin
          if xxCds.Fields[ i ].AsString='' then
             xxCds.Fields[ i ].AsString:='.';
       end;

   end;
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
         result :=  FRound(Aggregates.Items[Aggregates.IndexOf('OPER')].Value,15,2);

      Aggregates.Clear;

    end;
//    ClientDataSet.GotoBookmark(bmk);
//    ClientDataSet.FreeBookmark(bmk);
  finally
    cdsClone.Free;
  end;
end;


procedure TDMCXP.AplicaDatos( wCDS:TwwClientDataSet ; wNomArch : String );
var
   Delta, Results, OwnerData: OleVariant;
begin

   if (wcds.ChangeCount > 0) or (wcds.Modified) then begin

//      if SRV_D = 'DB2NT' then
//         DMCXP.DCOM1.AppServer.ParamDSPGraba('1', wNomArch);

         wCDS.CheckBrowseMode;
         Results := DCOM1.Appserver.AS_ApplyUpdates( wCDS.ProviderName,wcds.Delta,-1,ErrorCount,OwnerData);
         cdsResultSet.Data := Results;
         wCDS.Reconcile(Results);

//      if SRV_D = 'DB2NT' then
//         DMCXP.DCOM1.AppServer.ParamDSPGraba('0', wNomArch);

   end;

end;


procedure TDMCXP.ControlTran;
//var
  //wError : string;
begin
   ErrorCount:=0;

   if (ErrorCount=0) and ((cdsMovCNT.ChangeCount > 0)   or (cdsMovCNT.Modified  )) then
       DMCXP.AplicaDatos(DMCXP.cdsMovCNT,  'MOVCNT'   );
end;


procedure TDMCXP.formatosNumericos;
begin
  TFloatField(cdsMovCxP.FieldByName('CPMTOORI') ).EditFormat   :='########0.00';
  TFloatField(cdsMovCxP.FieldByName('CPMTOLOC') ).DisplayFormat:='###,###,##0.00';
  TFloatField(cdsMovCxP.FieldByName('CPMTOLOC') ).EditFormat   :='########0.00';
  TFloatField(cdsMovCxP.FieldByName('CPMTOEXT') ).DisplayFormat:='###,###,##0.00';
  TFloatField(cdsMovCxP.FieldByName('CPMTOEXT') ).EditFormat   :='########0.00';
  TFloatField(cdsMovCxP.FieldByName('CPPAGORI') ).DisplayFormat:='###,###,##0.00';
  TFloatField(cdsMovCxP.FieldByName('CPPAGORI') ).EditFormat   :='########0.00';
  TFloatField(cdsMovCxP.FieldByName('CPPAGLOC') ).DisplayFormat:='###,###,##0.00';
  TFloatField(cdsMovCxP.FieldByName('CPPAGLOC') ).EditFormat   :='########0.00';
  TFloatField(cdsMovCxP.FieldByName('CPPAGEXT') ).DisplayFormat:='###,###,##0.00';
  TFloatField(cdsMovCxP.FieldByName('CPPAGEXT') ).EditFormat   :='########0.00';
  TFloatField(cdsMovCxP.FieldByName('CPSALORI') ).DisplayFormat:='###,###,##0.00';
  TFloatField(cdsMovCxP.FieldByName('CPSALORI') ).EditFormat   :='########0.00';
  TFloatField(cdsMovCxP.FieldByName('CPSALLOC') ).DisplayFormat:='###,###,##0.00';
  TFloatField(cdsMovCxP.FieldByName('CPSALLOC') ).EditFormat   :='########0.00';
  TFloatField(cdsMovCxP.FieldByName('CPSALEXT') ).DisplayFormat:='###,###,##0.00';
  TFloatField(cdsMovCxP.FieldByName('CPSALEXT') ).EditFormat   :='########0.00';
  TFloatField(cdsMovCxP.FieldByName('CPTCAMPR') ).DisplayFormat:='##,##0.000';
  TFloatField(cdsMovCxP.FieldByName('CPTCAMPR') ).EditFormat   :='####0.000';
  TFloatField(cdsMovCxP.FieldByName('CPTCAMPA') ).DisplayFormat:='##,##0.000';
  TFloatField(cdsMovCxP.FieldByName('CPTCAMPA') ).EditFormat   :='####0.0000';

{
  (DMCXP.cdsLetras.FieldByName('CPMTOORI') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsLetras.FieldByName('CPMTOORI') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsLetras.FieldByName('CPMTOLOC') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsLetras.FieldByName('CPMTOLOC') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsLetras.FieldByName('CPMTOEXT') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsLetras.FieldByName('CPMTOEXT') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsLetras.FieldByName('CPPAGORI') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsLetras.FieldByName('CPPAGORI') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsLetras.FieldByName('CPPAGLOC') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsLetras.FieldByName('CPPAGLOC') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsLetras.FieldByName('CPPAGEXT') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsLetras.FieldByName('CPPAGEXT') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsLetras.FieldByName('CPSALORI') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsLetras.FieldByName('CPSALORI') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsLetras.FieldByName('CPSALLOC') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsLetras.FieldByName('CPSALLOC') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsLetras.FieldByName('CPSALEXT') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsLetras.FieldByName('CPSALEXT') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsLetras.FieldByName('CPTCAMPR') as TFloatField).DisplayFormat:='##,##0.000';
  (DMCXP.cdsLetras.FieldByName('CPTCAMPR') as TFloatField).EditFormat   :='####0.000';
  (DMCXP.cdsLetras.FieldByName('CPTCAMPA') as TFloatField).DisplayFormat:='##,##0.000';
  (DMCXP.cdsLetras.FieldByName('CPTCAMPA') as TFloatField).EditFormat   :='####0.0000';

  (DMCXP.cdsMovCxP2.FieldByName('CPMTOORI') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPMTOORI') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPPAGORI') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPPAGORI') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPPAGLOC') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPPAGLOC') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPPAGEXT') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPPAGEXT') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPSALORI') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPSALORI') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPSALLOC') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPSALLOC') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPSALEXT') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPSALEXT') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsMovCxP2.FieldByName('CPTCAMPR') as TFloatField).DisplayFormat:='##,##0.000';
  (DMCXP.cdsMovCxP2.FieldByName('CPTCAMPR') as TFloatField).EditFormat   :='####0.000';
  (DMCXP.cdsMovCxP2.FieldByName('CPTCAMPA') as TFloatField).DisplayFormat:='##,##0.000';
  (DMCXP.cdsMovCxP2.FieldByName('CPTCAMPA') as TFloatField).EditFormat   :='####0.0000';
}
{
  (DMCXP.cdsDetCxP.FieldByName('DCPMOORI') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsDetCxP.FieldByName('DCPMOORI') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsDetCxP.FieldByName('DCPMOLOC') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsDetCxP.FieldByName('DCPMOLOC') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsDetCxP.FieldByName('DCPMOEXT') as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsDetCxP.FieldByName('DCPMOEXT') as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsDetCxP.FieldByName('CPTCAMPR') as TFloatField).DisplayFormat:='##,##0.000';
  (DMCXP.cdsDetCxP.FieldByName('CPTCAMPR') as TFloatField).EditFormat   :='####0.000';
  (DMCXP.cdsDetCxP.FieldByName('CPTCAMPA') as TFloatField).DisplayFormat:='##,##0.000';
  (DMCXP.cdsDetCxP.FieldByName('CPTCAMPA') as TFloatField).EditFormat   :='####0.0000';
  }
end;

function StrZero(xVar:string;xLargo:integer):string;
var
  i : integer;
  s : String;
begin
   s := '';
   for i:=1 to xLargo do
   begin
      s:=s+'0';
   end;
   s :=s+trim(xVar);
   result:= copy(s,length(s)-(xLargo-1),xLargo);
end;

function FRound(xReal:Double;xEnteros,xDecimal:Integer):Double;
Var
//   xNum   : String;
//   code   : Integer;
//   xNReal : Double;
   xParteDec,xflgneg   : String;
   xDec: Integer;
   xMultiplo10, xUltdec, xNReal, xPDec : Double;
begin
//   xNum := Floattostrf( xReal, ffFixed, xEnteros, xDecimal );
//   Val( xNum, xNReal, code );
//   Result := xNReal;
   Result:=0;
   xflgneg:='0';

   if xReal<0 then
   begin
   xflgneg:='1';
   xReal:=xReal*-1;
   end;
   xReal := strtofloat(floattostr(xReal));

   if xReal=0 then exit;
// primer redondeo a un decimal + de lo indicado en los parámetros
   xDec := xDecimal+1;
   if xDec=0 then xMultiplo10:=1;
   if xDec=1 then xMultiplo10:=10;
   if xDec=2 then xMultiplo10:=100;
   if xDec=3 then xMultiplo10:=1000;
   if xDec=4 then xMultiplo10:=10000;
   if xDec=5 then xMultiplo10:=100000;
   if xDec=6 then xMultiplo10:=1000000;
   if xDec=7 then xMultiplo10:=10000000;

   xNreal := strtofloat(floattostr(xReal*xMultiplo10));
   xPdec  := int(strtofloat(floattostr(xReal)))*xMultiplo10;
   xPdec  := xNReal - xPDec;

   xPDec  := int(xPDec);
   xParteDec := floattostr(xPDec);
   if length(xParteDec)<xDec then
      xParteDec:=strZero(xParteDec,xDec);


   if length(xParteDec)>=xDec then
      xultdec:=  strtofloat(copy(xParteDec,xDec,1))
   else begin
      xUltDec := 0;
   end;
   xNReal := strtofloat(floattostr(xReal*xMultiplo10/10));
   xNReal := int(xNReal);
   if xultdec>=5 then xNReal := xNReal+1;

   if xflgneg='1' then
   begin
   Result := (xNReal/(xMultiplo10/10))*-1;
   end
   else
   begin
   Result := xNReal/(xMultiplo10/10);
   end;
end;

procedure Filtracds( xxCds:TwwClientDataSet; xxSQL:String  );
begin
   if Length( xxSQL )>0 then
   begin
      xxSQL := UpperCase( xxSQL );
   end;
   xxCds.Close;
   xxCds.IndexFieldNames:='';
   xxCds.MasterFields   :='';
   xxCds.Filter         :='';
   xxCds.Filtered       :=False;
   xxCds.DataRequest(xxSQL);
   xxCds.Open;
end;


procedure TDMCXP.FiltraTabla( xxCds:TwwClientDataSet; xxArchivo,xxCampo:String  );
var
   xFiltro : String;
   xSQL2   : String;
begin
   cdsAcceso.Filtered := False;
   cdsAcceso.Filter   := '';
   cdsAcceso.Filter   := 'NTabla='+''''+xxArchivo+''' and USERID='''+wUsuario+'''';
   cdsAcceso.Filtered := True;

   xFiltro := '';
   cdsAcceso.First;
   while not cdsAcceso.Eof do begin
      If Length(xFiltro)=0 then
         xFiltro:=xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''''
      else
         xFiltro:=xFiltro+' or '+xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+'''';

      cdsAcceso.Next;
   end;

   xxCds.Close;
   xSQL2 := 'Select * from '+ xxArchivo;
   if Length(xFiltro)>0 then begin
      xSQL2 := xSQL2+' Where '+xFiltro;
   end;
   xxCds.DataRequest( xSQL2 );
   xxCds.Open;
end;




function TDMCXP.BuscaObjeto( Const xNombre:String; xForm:TForm):TControl;
var
   ic : Integer;
begin
   Result := Nil;
   for ic:=0 to xForm.ComponentCount-1 do
   begin
      if xForm.Components[ic].Name=xNombre then
         Result := TControl( xForm.Components[ic]);
   end;
end;

function TDMCXP.BuscaUltTGE(xPrv,xTabla,xCampo,xWhere:String):String;
var
   xSQL, xxVar : string;
   yy, yy1 : Integer;
   xLetra  : Boolean;
begin
   if UpperCase(xPrv)='PRVTGE' then xPrv:='dspTGE';
   if UpperCase(xPrv)='PRVCXP' then xPrv:='dspCxP';
   if UpperCase(xPrv)='PRVULTCXP' then xPrv:='dspUltCxP';

   xSQL := '';
   xSQL:= 'Select max('+xCampo+') as MaxNum from '+xTabla;
   if length(xWhere)>0 then xSQL:=xSQL+' where '+xWhere;
   xSQL := UpperCase( xSQL );
   cdsULTTGE.Close;
   cdsULTTGE.ProviderName:=xPrv;
   cdsULTTGE.DataRequest(xSQL);    //esta es la llamada remota al provider del servidor
   cdsULTTGE.Open;
   if cdsULTTGE.FieldByName('MaxNum').Value=null then
      result:='1'
   else
   begin

      xxVar:=cdsULTTGE.FieldByName('MaxNum').AsString;

      xLetra:=False;
      for yy:=1 to Length(cdsULTTGE.FieldByName('MaxNum').AsString) do begin
          if Pos( xxVar[yy], '0123456789' )=0 then begin
             xLetra:=True;
          end;
          if xLetra then Exit;
      end;

      if xLetra then
         result:=''
      else
         result:=inttostr(strtoint(cdsULTTGE.FieldByName('MaxNum').Value)+1);
   end;
end;

function TDMCXP.UltimoRegistro( xAutoNum,xCia,xTDiario,xAno,xMes:String ):String;
var
   xSQL : string;
begin
   If xAutoNum<>'N' then
   begin
      xSQL := '';
      xSQL := 'Select Numero from TGE301 Where CiaID='+''''+xCia+''''+' and '
            + 'TDiarID='+''''+xTDiario+'''';
      if (xAutoNum='A') or (xAutoNum='M') then xSQL := xSQL + ' and Ano='+''''+xAno+'''';
      if  xAutoNum='M'                    then xSQL := xSQL + ' and Mes='+''''+xMes+'''';
      xSQL := UpperCase( xSQL );
      cdsULTTGE.Close;
      cdsULTTGE.ProviderName:= 'dspTGE';
      cdsULTTGE.DataRequest(xSQL); // Llamada remota al provider del servidor
      cdsULTTGE.Open;
      if cdsULTTGE.FieldByName('Numero').Value=null then
         result:='1'
      else begin
         result:=inttostr(cdsULTTGE.FieldByName('Numero').Value+1);
      end;
   end
   else
      result:='';
end;

function TDMCXP.UltimoRegistroCXP( xAutoNum,xCia,xTDiario,xAno,xMes:String ):String;
var
   xSQL : string;
begin
   If xAutoNum<>'N' then
   begin
// Inicio HPC_201412_CXP
      xSQL:='Select MAX(CPNOREG) NUMERO from CXP301 '
           +'Where CIAID='   +''''+xCia     +''''+' and '
           +      'TDIARID=' +''''+xTDiario +''''+' and '
           +      'CPANOMES='+''''+xAno+xMes+''' ';
//          and CPESTADO<>''E''';
// Fin HPC_201412_CXP
      xSQL := UpperCase( xSQL );
      cdsULTTGE.Close;
      cdsULTTGE.ProviderName:= 'dspTGE';
      cdsULTTGE.DataRequest(xSQL); // Llamada remota al provider del servidor
      cdsULTTGE.Open;
      if cdsULTTGE.FieldByName('Numero').Value=null then
         result:='1'
      else begin
         result:=inttostr(cdsULTTGE.FieldByName('Numero').Value+1);
      end;
   end
   else
      result:='';
end;

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
function TDMCXP.UltimoRegistroCD :String;
var
   xSQL : string;
begin


      xSQL:='Select MAX(IDCARGO) NUMERO from CXP_CARGOS_DIRECT ';

      xSQL := UpperCase( xSQL );
      cdsULTTGE.Close;
      cdsULTTGE.ProviderName:= 'dspTGE';
      cdsULTTGE.DataRequest(xSQL); // Llamada remota al provider del servidor
      cdsULTTGE.Open;
      if cdsULTTGE.FieldByName('Numero').Value=null then
         result:='1'
      else begin
         result:=inttostr(cdsULTTGE.FieldByName('Numero').Value+1);
      end;

end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
function TDMCXP.UltimoRegistroPlantilla :String;
var
   xSQL : string;
begin


      xSQL:='Select MAX(IDNUMERO) NUMERO from CXP_PLANT_DIETAS_CAB ';

      xSQL := UpperCase( xSQL );
      cdsULTTGE.Close;
      cdsULTTGE.ProviderName:= 'dspTGE';
      cdsULTTGE.DataRequest(xSQL); // Llamada remota al provider del servidor
      cdsULTTGE.Open;
      if cdsULTTGE.FieldByName('Numero').Value=null then
         result:='1'
      else begin
         result:=inttostr(cdsULTTGE.FieldByName('Numero').Value+1);
      end;

end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
function TDMCXP.UltimoRegistroPlanilla :String;
var
   xSQL : string;
begin


      xSQL:='Select MAX(TO_NUMBER(SUBSTR(ID_NUMERO,5,4))) NUMERO from CXP_PLANI_DIETAS_CAB WHERE SUBSTR(ID_NUMERO,1,4) = TO_CHAR(SYSDATE, ''YYYY'') ';

      xSQL := UpperCase( xSQL );
      cdsUltPlani.Close;
      cdsUltPlani.ProviderName:= 'dspTGE';
      cdsUltPlani.DataRequest(xSQL); // Llamada remota al provider del servidor
      cdsUltPlani.Open;
      if cdsUltPlani.FieldByName('Numero').Value=null then
         result:='1'
      else begin
         result:=inttostr(cdsUltPlani.FieldByName('Numero').Value+1);
      end;

end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
function TDMCXP.UltimoRegistroCXP310( xCia, xTDiario, xAnoMes : String ) : String;
var
   xSQL : string;
begin
   xSQL:='Select MAX(CPNOREG) NUMERO from CXP310 '
        +'Where CIAID='   +''''+xCia     +''''+' and '
        +      'TDIARID=' +''''+xTDiario +''''+' and '
        +      'CJANOMES='+''''+xAnoMes  +''' and CJESTADO<>''E''';
   xSQL := UpperCase( xSQL );
   cdsULTTGE.Close;
   cdsULTTGE.ProviderName:= 'dspTGE';
   cdsULTTGE.DataRequest(xSQL); // Llamada remota al provider del servidor
   cdsULTTGE.Open;
   if cdsULTTGE.FieldByName('Numero').Value=null then
      result:='1'
   else begin
      result:=inttostr(cdsULTTGE.FieldByName('Numero').Value+1);
   end;
end;
// Fin HPC_201801_CXP

function TDMCXP.GrabaUltimoRegistro( xAutoNum,xCia,xTDiario,xAno,xMes:String; xNumUsu:Integer ):String;
var
   xSQL : string;
begin
   If xAutoNum<>'N' then
   begin
      xSQL := '';
      xSQL := 'Select Numero from TGE301 '
            + 'Where CiaID='+''''+xCia+''''+' and '
            + 'TDiarID='+''''+xTDiario+'''';
      if (xAutoNum='A') or (xAutoNum='M') then xSQL:=xSQL+ ' and Ano='+''''+xAno+'''';
      if xAutoNum='M' then xSQL := xSQL + ' and Mes='+''''+xMes+'''';
      xSQL := UpperCase( xSQL );
      cdsULTTGE.Close;
      cdsULTTGE.ProviderName:= 'dspTGE';
      cdsULTTGE.DataRequest(xSQL); // Llamada remota al provider del servidor
      cdsULTTGE.Open;

      if cdsULTTGE.FieldByName('Numero').Value=null then
      begin
         Result := IntToStr( xNumUsu );
       { If xNumUsu>cdsULTTGE.FieldByName('Numero').AsInteger Then
            Result := IntToStr( xNumUsu )
         else begin
            Result := '1';
         end; }
         xSQL := 'Insert into TGE301( CiaID, TDiarID ';
         if (xAutoNum='A') or (xAutoNum='M') then xSQL:= xSQL+ ',Ano ';
         if  xAutoNum='M'                    then xSQL:= xSQL+ ',Mes ';
         xSQL := xSQL + ',Numero ) Values ('+''''+xCia+''''+','+''''+xTDiario+'''';
         if (xAutoNum='A') or (xAutoNum='M') then xSQL:= xSQL+ ','+''''+xAno+'''';
         if  xAutoNum='M'                    then xSQL:= xSQL+ ','+''''+xMes+'''';
         xSQL := xSQL + ','+Result+' )';
         xSQL := UpperCase( xSQL );

         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      end
      else begin
         Result := IntToStr( xNumUsu );
//         If xNumUsu>cdsULTTGE.FieldByName('Numero').AsInteger Then begin
            xSQL := 'Update TGE301 Set Numero='+Result+' ';
            xSQL := xSQL + 'Where CiaID='+''''+xCia+''''+' and TDiarID='+''''+xTDiario+'''';
            if (xAutoNum='A') or (xAutoNum='M') then xSQL:= xSQL+ ' and Ano='+''''+xAno+'''';
            if  xAutoNum='M'                    then xSQL:= xSQL+ ' and Mes='+''''+xMes+'''';
            xSQL := UpperCase( xSQL );
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
//         end;
      end;
   end;
end;

function TDMCXP.DisplayDescrip2(wPrv,wTabla,wCampos,wWhere,wResult:string):string;
var
   xSQL : string;
begin
   xSQL := 'select '+wCampos+' from '+wTabla;
   if length(wWhere)>0 then
      xSQL:=xSQL+' where '+wWhere;
   cdsQry.Close;
   cdsQry.Filter:='';
   cdsQry.Filtered:=False;
   cdsQry.IndexFieldNames:='';
   cdsQry.ProviderName:=wPrv;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   result:=cdsQry.FieldByName(wResult).Asstring;
end;

function TDMCXP.DisplayDescrip(PTable,PDescrip,PKey,PVal:String):String;
var
   xSQL: String;
begin
   xSQL:='select * from '+PTable+' ';
   xSQL:= xSQL + 'where '+ PKey +'='+''''+ PVal +'''';
   xSQL := UpperCase( xSQL );
   cdsULTTGE.Close;
   cdsULTTGE.ProviderName:='dspUltTGE';
   cdsULTTGE.DataRequest(xSQL);    //este es la llamada remota al provider del servidor
   cdsULTTGE.Open;
   result:=cdsULTTGE.FieldByName(PDescrip).AsString;
//   cdsULTTGE.Close;
end;


function TDMCXP.BuscaFecha(PTable,PDescrip,PKey: String; PVal:TDateTime ): Boolean;
var
   xSQL: String;
begin
   xSQL:='select * from '+PTable+' ';
   xSQL:= xSQL + 'where '+ PKey +'='+wRepFuncDate+''''+ FORMATDATETIME(DMCXP.wFormatFecha,PVal)+''''+')';
   xSQL := UpperCase( xSQL );
   cdsULTTGE.Close;
   cdsULTTGE.ProviderName:='dspUltTGE';
   cdsULTTGE.DataRequest(xSQL);    //este es la llamada remota al provider del servidor
   cdsULTTGE.Open;
   if cdsULTTGE.RecordCount>0 then
      Result:=True
   else
      Result:=False;
end;


function TDMCXP.BuscaCxPReg( PCia,PTDiario,PAnoMes,PNoReg:String):Boolean;
var
   xSQL: String;
begin
   xSQL:='select * from CXP301 Where ';
   xSQL:= xSQL + 'CIAID='   +''''+ PCia +''''+' and ';
   xSQL:= xSQL + 'CPANOMES='+''''+ PAnoMes +''''+' and ';
   xSQL:= xSQL + 'TDIARID=' +''''+ PTDiario +''''+' and ';
   xSQL:= xSQL + 'CPNOREG=' +''''+ PNoReg +'''';
   xSQL := UpperCase( xSQL );
   cdsUltTGE.Close;
   cdsUltTGE.ProviderName:='dspCxP';
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   If cdsUltTGE.RecordCount>0 then
      result:=True
   Else
      result:=False;
end;

function TDMCXP.BuscaCxP310( PCia,PTDiario,PAnoMes,PNoReg, PCanje : String):Boolean;
var
   xSQL: String;
begin
   xSQL:='select * from CXP310 Where ';
   xSQL:= xSQL + 'CIAID='   +''''+ PCia     +''' and ';
   xSQL:= xSQL + 'CJANOMES='+''''+ PAnoMes  +''' and ';
   xSQL:= xSQL + 'TDIARID=' +''''+ PTDiario +''' and ';
   xSQL:= xSQL + 'CPNOREG=' +''''+ PNoReg   +''' and ';
   xSQL:= xSQL + 'CJCANJE<>'+''''+ PCanje   +'''';
   xSQL := UpperCase( xSQL );
   cdsUltTGE.Close;
   cdsUltTGE.ProviderName:='dspCxP';
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   If cdsUltTGE.RecordCount>0 then
      result:=True
   Else
      result:=False;
end;



function TDMCXP.BuscaCxPDoc( PCia,PProv,PDoc,PSerie,PNoDoc:String):Boolean;
var
   xSQL: String;
begin
   xSQL:='select * from CXP301 Where ';
   xSQL:= xSQL + ''+DMCXP.wReplacCeros+'(CPESTADO,'''') <> ''E'' and ';
   xSQL:= xSQL + 'CiaID='  +''''+ PCia   +''''+' and ';
   xSQL:= xSQL + 'Prov='   +''''+ PProv  +''''+' and ';
   xSQL:= xSQL + 'DocId='  +''''+ PDoc   +''''+' and ';
   xSQL:= xSQL + 'CPSerie='+''''+ PSerie +''''+' and ';
   xSQL:= xSQL + 'CPNoDoc='+''''+ PNoDoc +'''';
   xSQL := UpperCase( xSQL );
   cdsUltTGE.Close;
   cdsUltTGE.ProviderName:='dspCxP';
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   If cdsUltTGE.RecordCount>0 then
      result:=True
   Else
      result:=False;
end;

// Inicio HPC_201705_CXP
// nueva funcion para buscar documentos duplicados
function TDMCXP.BuscaCxPDocDup( PClaux,PProv,PDoc,PSerie,PNoDoc:String):Boolean;
var
   xSQL: String;
begin

   xSQL:='select * from CXP301 Where ';
   xSQL:= xSQL + ''+DMCXP.wReplacCeros+'(CPESTADO,'''') <> ''E'' and ';
   xSQL:= xSQL + 'Clauxid='   +''''+ PClaux  +''''+' and ';
   xSQL:= xSQL + 'Prov='   +''''+ PProv  +''''+' and ';
   xSQL:= xSQL + 'DocId='  +''''+ PDoc   +''''+' and ';
   xSQL:= xSQL + 'CPSerie='+''''+ PSerie +''''+' and ';
   xSQL:= xSQL + '( CASE WHEN LENGTH(TRIM(TRANSLATE(CPNoDoc, ''0123456789'', '' ''))) IS NULL THEN TO_CHAR(TO_NUMBER(CPNoDoc)) '
               + ' ELSE UPPER(CPNoDoc) END) = '
               + '( CASE WHEN LENGTH(TRIM(TRANSLATE('''+ PNoDoc +''', ''0123456789'', '' ''))) IS NULL THEN TO_CHAR(TO_NUMBER('''+ PNoDoc +''')) '
               + ' ELSE UPPER('''+ PNoDoc +''') END)';


   xSQL := UpperCase( xSQL );

   cdsUltTGE.Close;
   cdsUltTGE.ProviderName:='dspCxP';
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   If cdsUltTGE.RecordCount>0 then
      result:=True
   Else
      result:=False;
end;
// Fin HPC_201705_CXP

function TDMCXP.BuscaCxPDoc2( PCia,PProv,PDoc,PSerie,PNoDoc,PTD,PAM,PNR :String):Boolean;
var
   xSQL: String;
begin
   xSQL:='select * from CXP301 Where ';
   xSQL:= xSQL + ''+DMCXP.wReplacCeros+'(CPESTADO,'''') <> ''E'' and ';
   xSQL:= xSQL + 'CiaID='   +''''+ PCia   +''''+' and ';
   xSQL:= xSQL + 'Prov='    +''''+ PProv  +''''+' and ';
   xSQL:= xSQL + 'DocId='   +''''+ PDoc   +''''+' and ';
   xSQL:= xSQL + 'CPSerie=' +''''+ PSerie +''''+' and ';
   xSQL:= xSQL + 'CPNoDoc=' +''''+ PNoDoc +''''+' and ';
   xSQL:= xSQL + 'TDIARID=' +''''+ PTD    +''''+' and ';
   xSQL:= xSQL + 'CPANOMES='+''''+ PAM    +''''+' and ';
   xSQL:= xSQL + 'CPNOREG=' +''''+ PNR    +'''';
   xSQL := UpperCase( xSQL );
   cdsUltTGE.Close;
   cdsUltTGE.ProviderName:='dspCxP';
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   If cdsUltTGE.RecordCount>0 then
      result:=True
   Else
      result:=False;
end;

function TDMCXP.BuscaOPago( PCia,PNoOPa:String):Boolean;
var
   xSQL: String;
begin
   xSQL:='Select * from CXP303 Where CiaID='''+PCia+''' and OPago='''+PNoOpa+'''';
   xSQL := UpperCase( xSQL );
   cdsUltTGE.Close;
   cdsUltTGE.ProviderName:='dspCxP';
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   If cdsUltTGE.RecordCount>0 then
      result:=True
   Else
      result:=False;
end;

function TDMCXP.BuscaPagare( PCia,PDoc,PNoPag:String):Boolean;
var
   xSQL: String;
begin
   xSQL:='Select * from CXP306 Where CiaID='''+PCia+''' and '
        +'DocId='''+PDoc+''' and Pagare='''+PNoPag+'''';
   xSQL := UpperCase( xSQL );
   cdsUltTGE.Close;
   cdsUltTGE.ProviderName:='dspCxP';
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   if cdsUltTGE.RecordCount>0 then
      result:=True
   else
      result:=False;
end;

function TDMCXP.BuscaCanje( PCia,PTCa,PNoCje:String):Boolean;
var
   xSQL: String;
begin
   xSQL:='Select * from CXP302 Where CiaID='''+PCia+''' and '
        +'TCanjeId='''+PTCa+''' and Canje='''+PNoCje+'''';
   xSQL := UpperCase( xSQL );
   cdsUltTGE.Close;
   cdsUltTGE.ProviderName:='dspCxP';
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   if cdsUltTGE.RecordCount>0 then
      result:=True
   else
      result:=False;
end;

function BuscaQry(wPrv,wTabla,wCampos,wWhere,wResult:String):string;
var
	xSQL : string;
begin
{ wPrv    = Provider al que hace referencia el cdsQry
  wTabla  = Tabla en la que se va a hacer la búsqueda
  wCampos = Campos que va a considerar en el "select" de sentencia SQL
  wWhere  = Condicional de la búsqueda
  wResult = Resultado que entrega la búsqueda }
  wPrv:='dspTGE';
  xSQL:= 'SELECT '+wCampos+' FROM '+wTabla;
  if length(wWhere)>0 then xSQL:=xSQL+' where '+wWhere;
  xSQL := UpperCase( xSQL );
  DMCXP.cdsQry.Close;
  //DMCXP.cdsQry.ProviderName:=wPrv;
  DMCXP.cdsQry.DataRequest(xSQL);
  DMCXP.cdsQry.Open;
  if Length(Trim(DMCXP.cdsQry.FieldByName(wResult).AsString)) = 0 then
  	result:=''
  else
  	result:=DMCXP.cdsQry.FieldByName(wResult).AsString;
end;

function TDMCXP.strMes (Fecha : TDateTime) : String ;
var
	Year, Month, Day: Word ;
begin
  if Fecha = 0 then
  	Result := ''
  else
  begin
  	DecodeDate(Fecha, Year, Month, Day);
    Result := Strzero(inttostr(Month),2) ;
  end ;
end;

function TDMCXP.strAno (Fecha : TDateTime) : String ;
var
   Year, Month, Day: Word ;
begin
   if Fecha = 0 then
      Result := ''
   else begin
      DecodeDate(Fecha, Year, Month, Day);
      Result := Strzero(inttostr(Year),4) ;
   end ;
end;


procedure TDMCXP.cdsCanjeCCPMOLOCChange(Sender: TField);
begin
   If xFlagCal then begin
      xFlagCal := False;
      If cdsCanje.FieldByName('CCPTCCJE').AsFloat>0 then
         cdsCanje.FieldByName('CCPMOEXT').AsFloat := FRound( cdsCanje.FieldByName('CCPMOLOC').AsFloat/cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
      end
    Else begin
      xFlagCal := True;
   end;
end;

procedure TDMCXP.cdsCanjeCCPMOEXTChange(Sender: TField);
begin
   If xFlagCal then
   begin
      xFlagCal := False;
      If cdsCanje.FieldByName('CCPTCCJE').AsFloat>0 then
         cdsCanje.FieldByName('CCPMOLOC').AsFloat := FRound( cdsCanje.FieldByName('CCPMOEXT').asFloat*cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
   end
   Else begin
      xFlagCal := True;
   end;
end;

procedure TDMCXP.cdsCanjeCCPTCCJEChange(Sender: TField);
begin
   If wTMonLoc=cdsCanje.FieldByName('TMONID').AsString then begin
      cdsCanje.FieldByName('CCPMOLOC').AsFloat := FRound( cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
      If cdsCanje.FieldByName('CPSALLOC').AsFloat=0 then begin
         cdsCanje.FieldByName('CPSALLOC').AsFloat := FRound( cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
         cdsCanje.FieldByName('CPSALEXT').AsFloat := FRound( cdsCanje.FieldByName('CCPMOLOC').AsFloat/cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
         end
      else begin
         cdsCanje.FieldByName('CPSALLOC').AsFloat := FRound( cdsCanje.FieldByName('CPSALLOC').AsFloat,15,2);
         cdsCanje.FieldByName('CPSALEXT').AsFloat := FRound( cdsCanje.FieldByName('CPSALLOC').AsFloat/cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
      end;
      end
   else begin
      cdsCanje.FieldByName('CCPMOEXT').AsFloat := FRound( cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2);
      If cdsCanje.FieldByName('CPSALEXT').AsFloat=0 then begin
         cdsCanje.FieldByName('CPSALLOC').AsFloat := FRound( cdsCanje.FieldByName('CCPMOEXT').AsFloat*cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
         cdsCanje.FieldByName('CPSALEXT').AsFloat := FRound( cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2);
         end
      else begin
         cdsCanje.FieldByName('CPSALLOC').AsFloat := FRound( cdsCanje.FieldByName('CPSALEXT').AsFloat*cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
         cdsCanje.FieldByName('CPSALEXT').AsFloat := FRound( cdsCanje.FieldByName('CPSALEXT').AsFloat,15,2);
      end;
   end;
end;

procedure TDMCXP.cdsDetCanjeDCDMOLOCChange(Sender: TField);
begin
   If xFlagCal then begin
      xFlagCal := False;
      If cdsDetCanje.FieldByName('DCDTCAMB').AsFloat>0 then
         cdsDetCanje.FieldByName('DCDMOEXT').AsFloat:=FRound(cdsDetCanje.FieldByName('DCDMOLOC').AsFloat/cdsDetCanje.FieldByName('DCDTCAMB').AsFloat,15,2);
   end
   Else begin
      xFlagCal := True;
   end;
end;

procedure TDMCXP.cdsDetCanjeDCDMOEXTChange(Sender: TField);
begin
   If xFlagCal then begin
      xFlagCal := False;
      If cdsDetCanje.FieldByName('DCDTCAMB').AsFloat>0 then
         cdsDetCanje.FieldByName('DCDMOLOC').AsFloat:=FRound(cdsDetCanje.FieldByName('DCDMOEXT').AsFloat*cdsDetCanje.FieldByName('DCDTCAMB').AsFloat,15,2);
   end
   Else begin
      xFlagCal := True;
   end;
end;

procedure TDMCXP.cdsCuentaAfterOpen(DataSet: TDataSet);
begin
   wDifAjuG := '77001';  // Cuenta de Ganancia x Dif.Cambio
   wDifAjuP := '67001';  // Cuenta de Pérdida x Dif.Cambio
end;

procedure TDMCXP.MovCxPDataRequest( xSQLx:String; xFCxP,xFCxP2,xFLet:Boolean );
begin
   If xFCxP then begin
      DMCXP.cdsMovCxP.Close;
      DMCXP.cdsMovCxP.DataRequest(xSQLx);
      DMCXP.cdsMovCxP.Open;
   end;
   If xFCxP2 then begin
      DMCXP.cdsMovCxP2.Close;
      DMCXP.cdsMovCxP2.DataRequest(xSQLx);
      DMCXP.cdsMovCxP2.Open;
   end;
   If xFLet then begin
      DMCXP.cdsLetras.Close;
      DMCXP.cdsLetras.DataRequest(xSQLx);
      DMCXP.cdsLetras.Open;
   end;
end;

function TDMCXP.BuscaUltFecha(xPrv,xTabla,xCampo,xWhere:String): TDate;
var
	xSQL : string;
	Y, M, D : Word;
begin
  xSQL:= 'SELECT MAX('+xCampo+') AS MAXFECHA FROM '+xTabla;
  if length(xWhere)>0 then xSQL:=xSQL+' where '+xWhere;

  if UpperCase(xPrv)='PRVTGE'    then xPrv:='dspTGE';
  if UpperCase(xPrv)='PRVCXP'    then xPrv:='dspCxP';
  if UpperCase(xPrv)='PRVULTCXP' then xPrv:='dspUltCxP';
  xSQL := UpperCase( xSQL );
  cdsULTTGE.Close;
  //cdsULTTGE.ProviderName:=xPrv;
  cdsULTTGE.DataRequest(xSQL);    //esta es la llamada remota al provider del servidor
  cdsULTTGE.Open;
  if Length(Trim(cdsULTTGE.FieldByName('MAXFECHA').AsString)) = 0 then
  begin
  	DecodeDate(Date, Y, M, D);
  	result:=StrToDate('01/'+inttostr(M)+'/'+InttoStr(Y))-1;
  end
  else
  begin
  	result:= (cdsULTTGE.FieldByName('MAXFECHA').AsDateTime);
  end;
end;

// Inicio HPC_201406_CXP
// reordena sangría de rutina
// agrega flags de Control Transaccional
procedure TDMCXP.SaldosAuxiliar( xxCia,xxAnoMes,xxClAux,xxAux,xxSigno:String;
                               xxImpMN,xxImpME: Double; xxTMonid : String );
var
 	xxAno, xxMes, xSQL, xxSaldo13 : String;
   xxSaldo01, xxSaldo02, xxSaldo03, xxSaldo04, xxSaldo05, xxSaldo06 : String;
   xxSaldo07, xxSaldo08, xxSaldo09, xxSaldo10, xxSaldo11, xxSaldo12 : String;
   iX : integer;
   ssql,ssql1,xmes : string;
begin
   xxAno:= Copy(xxAnoMes,1,4);
   xxMes:= Copy(xxAnoMes,5,2);
   xSQL := 'Select * from TGE401 '
         + ' where CIAID='  +''''+xxCia    +''''+' and '
         + '       ANO='    +''''+xxAno    +''''+' and '
         + '       CLAUXID='+''''+xxClAux  +''''+' and '
         + '       AUXID='  +''''+xxAux    +'''';
   xSQL := UpperCase( xSQL );
   cdsQry.Close;
   cdsQry.ProviderName:= 'dspTGE';
   cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
   cdsQry.Open;
	if cdsQry.RecordCount=0 then
   begin
      xSQL := 'Insert into TGE401(CIAID,ANO,CLAUXID,AUXID';
      if (xxSigno='+') or (xxSigno='=') then
      begin
         xSQL:= xSQL + ', DEBETMN'+xxMes+', DEBETME'+xxMes;
         if xxtmonid = wTMonLoc then
            xSQL:= xSQL + ', DEBESMN'+xxMes
         else
            xSQL:= xSQL + ', DEBESME'+xxMes;
      end;
      if (xxSigno='-') or (xxSigno='=') then
      begin
         xSQL:= xSQL + ', HABETMN'+xxMes+', HABETME'+xxMes;
         if xxtmonid = wTMonLoc then
            xSQL:= xSQL + ', HABESMN'+xxMes
         else
            xSQL:= xSQL + ', HABESME'+xxMes;
      end;
      xSQL:= xSQL+ ') Values ('+''''+xxCia  +''''+','+''''+xxAno +''''+','
                             +''''+xxClAux+''''+','+''''+xxAux +'''';
      xSQL:= xSQL + ', '+FloatToStr(xxImpMN)+', '+FloatToStr(xxImpME);
      if xxtmonid = wTMonLoc then
         xSQL:= xSQL + ', ' +FloatToStr(xxImpMN)
      else
         xSQL:= xSQL + ', ' +FloatToStr(xxImpME);

      if xxSigno='=' then
      begin
         xSQL:= xSQL + ', '+FloatToStr(xxImpMN)+', '+FloatToStr(xxImpME);
         if xxtmonid = wTMonLoc then
            xSQL:= xSQL + ', ' +FloatToStr(xxImpMN)
         else
            xSQL:= xSQL + ', ' +FloatToStr(xxImpME);
      end;
      xSQL := UpperCase( xSQL + ' ) ' );
      try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      except
         ShowMessage('Error al intentar actualizar Saldos de Proveedor - 1');
         wSigueGrab := False;
         exit;
      end
   end
   else
   begin
      xSQL := 'Update TGE401 Set ';
      if (xxSigno='+') or (xxSigno='=') then
      begin
         xSQL:=xSQL+'  DEBETMN'+xxMes+'='+DMCXP.wReplacCeros+'(DEBETMN'+xxMes+',0)+'+FloatToStr(xxImpMN);
         xSQL:=xSQL+', DEBETME'+xxMes+'='+DMCXP.wReplacCeros+'(DEBETME'+xxMes+',0)+'+FloatToStr(xxImpME);
         if xxTMonId = wTMonLoc then
            xSQL:=xSQL+', DEBESMN'+xxMes+'='+DMCXP.wReplacCeros+'(DEBESMN'+xxMes+',0)+'+FloatToStr(xxImpMN)
         else
            xSQL:=xSQL+', DEBESME'+xxMes+'='+DMCXP.wReplacCeros+'(DEBESME'+xxMes+',0)+'+FloatToStr(xxImpME);
      end;

      if (xxSigno='-') or (xxSigno='=') then
      begin
         if xxSigno='=' then xSQL := xSQL +',';
         xSQL:=xSQL+'  HABETMN'+xxMes+'='+DMCXP.wReplacCeros+'(HABETMN'+xxMes+',0)+'+FloatToStr(xxImpMN);
         xSQL:=xSQL+', HABETME'+xxMes+'='+DMCXP.wReplacCeros+'(HABETME'+xxMes+',0)+'+FloatToStr(xxImpME);
         if xxTMonId=wTMonLoc then
            xSQL:=xSQL+', HABESMN'+xxMes+'='+DMCXP.wReplacCeros+'(HABESMN'+xxMes+',0)+'+FloatToStr(xxImpMN)
         else
            xSQL:=xSQL+', HABESME'+xxMes+'='+DMCXP.wReplacCeros+'(HABESME'+xxMes+',0)+'+FloatToStr(xxImpME);
      end;
      xSQL := xSQL +' Where CIAID='  +''''+xxCia  +''''+' and '
                   +       'ANO='    +''''+xxAno  +''''+' and '
                   +       'CLAUXID='+''''+xxClAux+''''+' and '
                   +       'AUXID='  +''''+xxAux  +'''';
      xSQL := UpperCase( xSQL );
      try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      except
         ShowMessage('Error al intentar actualizar Saldos de Proveedor - 2');
         wSigueGrab := False;
         exit;
      end
   end;

   //////////////////////////////////////
   //                                  //
   //   Actualiza DebeTMN y HaberTME   //
   //                                  //
   //////////////////////////////////////

   if xxSigno='=' then Exit;

	xSQL:='Update TGE401 Set ';
   sSQL:='Where CIAID='  +''''+xxCia    +''''+' and '
       +      'ANO='    +''''+xxAno    +''''+' and '
       +      'CLAUXID='+''''+xxClAux  +''''+' and '
       +      'AUXID='  +''''+xxAux    +'''';

// Actualiza Saldos Moneda Local
   for iX:=StrToInt( xxMes ) to 13 do
   begin
      xmes:=strzero(IntToStr(iX),2);
      if iX=StrToInt( xxMes ) then
         xSQL:=xSQL+'SaldTMN'+xmes+'='+''+DMCXP.wReplacCeros+'(SaldTMN'+xmes+',0)'+xxSigno+FloatToStr(xxImpMN)
      else
         xSQL:=xSQL+', SaldTMN'+xmes+'='+''+DMCXP.wReplacCeros+'(SaldTMN'+xmes+',0)'+xxSigno+FloatToStr(xxImpMN)
   end;

// Actualiza Saldos Moneda Extranjera
   for iX:=StrToInt( xxMes ) to 13 do
   begin
      xmes:=strzero(IntToStr(iX),2);
      xSQL:=xSQL+', SaldTME'+xmes+'='+''+DMCXP.wReplacCeros+'(SaldTME'+xmes+',0)'+xxSigno+FloatToStr(xxImpME)
   end;

// Actualiza Saldos Solamente Moneda Local
 	if xxtmonid = wTMonLoc then
   begin
      for iX:=StrToInt( xxMes ) to 13 do
      begin
         xmes:=strzero(IntToStr(iX),2);
         xSQL:=xSQL+', SaldSMN'+xmes+'='+''+DMCXP.wReplacCeros+'(SaldSMN'+xmes+',0)'+xxSigno+FloatToStr(xxImpMN)
      end;
   end;

// Actualiza Saldos Solamente Moneda Extranjera
 	if xxtmonid = wTMonExt then
   begin
      for iX:=StrToInt( xxMes ) to 13 do
      begin
         xmes:=strzero(IntToStr(iX),2);
         xSQL:=xSQL+', SaldSME'+xmes+'='+''+DMCXP.wReplacCeros+'(SaldSME'+xmes+',0)'+xxSigno+FloatToStr(xxImpME)
      end;
   end;

   xSQL := xSQL + ' Where CIAID='+''''+xxCia   +''''+' and '
                + 'ANO='        +''''+xxAno    +''''+' and '
                + 'CLAUXID='    +''''+xxClAux  +''''+' and '
                + 'AUXID='      +''''+xxAux    +'''';
   xSQL := UpperCase( xSQL );
   try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
      ShowMessage('Error al intentar actualizar Saldos de Proveedor - 3');
      wSigueGrab := False;
      exit;
   end
end;
// Fin HPC_201406_CXP

Procedure TDMCXP.AccesosUsuarios(xxModulo,xxUsuario,xxTipo,xxForma:String);
begin
   if Trim(cdsUsuarios.FieldByName('GRUPOID').AsString)='' then
   begin
      if cdsUsuarios.IndexFieldNames<>'USERID' then
         cdsUsuarios.IndexFieldNames:='USERID';
      cdsUsuarios.SetKey;
      cdsUsuarios.FieldByName('USERID').AsString := xxUsuario;
      If not cdsUsuarios.GotoKey then
         Exit;
   end;
   cdsGrupos.Filter := '';

   if xxTipo='1' then
   begin
      cdsGrupos.Filter:='GRUPOID='+''''+cdsUsuarios.FieldByname('GRUPOID').AsString+''''+' and '
                       +'MODULOID='+''''+xxModulo+''''+' and '
                       +'TIPO='+''''+xxTipo+'''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      while not cdsGrupos.Eof do begin
         wComponente := BuscaObjeto( cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      end;
   end;

   if xxTipo='2' then
   begin
      cdsGrupos.Filter:='GRUPOID=' +''''+cdsUsuarios.FieldByname('GRUPOID').AsString+''''+' and '
                       +'MODULOID='+''''+xxModulo+''''+' and '
                       +'FORMA='   +''''+xxForma +''''+' and '
                       +'TIPO='    +''''+xxTipo  +'''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      while not cdsGrupos.Eof do
      begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm );
         wComponente.Enabled := False;
         cdsGrupos.Next;
      end;
   end;
end;

procedure TDMCXP.AccesosUsuariosR(xxModulo,xxUsuario,xxTipo:String; xxForma:TForm);
begin
   if Trim(cdsUsuarios.FieldByname('GRUPOID').AsString)='' then begin
      if cdsUsuarios.IndexFieldNames<>'USERID' then
         cdsUsuarios.IndexFieldNames:='USERID';
      cdsUsuarios.SetKey;
      cdsUsuarios.FieldByname('USERID').AsString := xxUsuario;
      If not cdsUsuarios.GotoKey then Exit;
   end;

   cdsGrupos.Filter := '';
   If xxTipo='1' then begin
      cdsGrupos.Filter:='GrupoID='+''''+cdsUsuarios.FieldByname('GRUPOID').AsString+''''+' and '
                       +'ModuloID='+''''+xxModulo+''''+' and '
                       +'Tipo='+''''+xxTipo+'''';
      cdsGrupos.Filtered := True;

      if (DMCXP.wAdmin='G') or (DMCXP.wAdmin='P') then Exit;

      cdsGrupos.First;
      While not cdsGrupos.Eof do begin
         wComponente := BuscaObjeto( cdsGrupos.FieldByName('OBJETO').AsString, xxForma );
         wComponente.Enabled := False;
         cdsGrupos.Next;
      end;
   end;

   If xxTipo='2' then begin
      cdsGrupos.Filter:='GrupoID=' +''''+cdsUsuarios.FieldByname('GRUPOID').AsString+''''+' and '
                       +'ModuloID='+''''+xxModulo                +''''+' and '
                       +'Forma='   +''''+xxForma.Name            +''''+' and '
                       +'Tipo='    +''''+xxTipo                  +'''';
      cdsGrupos.Filtered := True;

      if (DMCXP.wAdmin='G') or (DMCXP.wAdmin='P') then Exit;

      cdsGrupos.First;
      While not cdsGrupos.Eof do begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, xxForma );
//         If (wComponente.Name='Z2bbtnModifica') or
//            (wComponente.Name='Z2bbtnConsulta') then
            wComponente.Enabled := False;
//         else begin
//            wComponente.Visible := False;
//         end;
         cdsGrupos.Next;
      end;
   end;
end;

function TDMCXP.DesEncripta(wPalabra:String): String;
var
   xLargoPal,i,j : integer;
   xReal,xEncriptado1,xEncriptado2,xEncriptado3,xEncriptado4,
   xEncriptado5,xNuevaPal,xEncriptado : string;
   xTiene : boolean;
begin
   xReal       := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1:= '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2:= '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3:= '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4:= 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5:= ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal   := length(wPalabra);
   xNuevaPal   := '';
   i := 1;
   while i<=xLargoPal do begin
      j := 1;
      xTiene := False;
      if (i=1) or (i=11)or (i=21) or (i=31) then xEncriptado:=xEncriptado1;
      if (i=2) or (i=12)or (i=22) or (i=32) then xEncriptado:=xEncriptado2;
      if (i=3) or (i=13)or (i=23) or (i=33) then xEncriptado:=xEncriptado3;
      if (i=4) or (i=14)or (i=24) or (i=34) then xEncriptado:=xEncriptado4;
      if (i=5) or (i=15)or (i=25) or (i=35) then xEncriptado:=xEncriptado5;
      if (i=6) or (i=16)or (i=26) or (i=36) then xEncriptado:=xEncriptado1;
      if (i=7) or (i=17)or (i=27) or (i=37) then xEncriptado:=xEncriptado2;
      if (i=8) or (i=18)or (i=28) or (i=38) then xEncriptado:=xEncriptado3;
      if (i=9) or (i=19)or (i=29) or (i=39) then xEncriptado:=xEncriptado4;
      if (i=10)or (i=20)or (i=30) or (i=40) then xEncriptado:=xEncriptado5;
      while j<=length(xReal) do begin
         if copy(wPalabra,i,1)=copy(xEncriptado,j,1) then begin
            xNuevaPal := xNuevaPal+copy(xReal,j,1);
            xTiene := True;
         end;
         j := j+1;
      end;
      if not xTiene then xNuevaPal:=xNuevaPal+copy(wPalabra,i,1);
      i := i+1;
   end;
   result:=xNuevaPal;
end;

function TDMCXP.Encripta(wPalabra:String): String;
var
   xLargoPal,i,j : integer;
   xReal,xEncriptado1,xEncriptado2,xEncriptado3,xEncriptado4,
   xEncriptado5,xNuevaPal,xEncriptado : string;
   xTiene : boolean;
begin
   xReal       := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1:= '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2:= '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3:= '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4:= 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5:= ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal   := length(wPalabra);
   xNuevaPal   := '';
   i := 1;
   while i<=xLargoPal do begin
      j := 1;
      xTiene := False;
      if (i=1) or (i=11)or (i=21) or (i=31) then xEncriptado:=xEncriptado1;
      if (i=2) or (i=12)or (i=22) or (i=32) then xEncriptado:=xEncriptado2;
      if (i=3) or (i=13)or (i=23) or (i=33) then xEncriptado:=xEncriptado3;
      if (i=4) or (i=14)or (i=24) or (i=34) then xEncriptado:=xEncriptado4;
      if (i=5) or (i=15)or (i=25) or (i=35) then xEncriptado:=xEncriptado5;
      if (i=6) or (i=16)or (i=26) or (i=36) then xEncriptado:=xEncriptado1;
      if (i=7) or (i=17)or (i=27) or (i=37) then xEncriptado:=xEncriptado2;
      if (i=8) or (i=18)or (i=28) or (i=38) then xEncriptado:=xEncriptado3;
      if (i=9) or (i=19)or (i=29) or (i=39) then xEncriptado:=xEncriptado4;
      if (i=10)or (i=20)or (i=30) or (i=40) then xEncriptado:=xEncriptado5;
      while j<=length(xReal) do begin
         if copy(wPalabra,i,1)=copy(xReal,j,1) then begin
            xNuevaPal := xNuevaPal+copy(xEncriptado,j,1);
            xTiene := True;
         end;
         j := j+1;
      end;
      if not xTiene then xNuevaPal:=xNuevaPal+copy(wPalabra,i,1);
      i := i+1;
   end;
   result:=xNuevaPal;
end;



/////////////////////////////////////////////
/////////////////////////////////////////////
///                                       ///
///    PROCEDIMIENTOS PARA CONTABILIDAD   ///
///                                       ///
/////////////////////////////////////////////
/////////////////////////////////////////////

procedure TDMCXP.GeneraContab( xxCia, xxTDiario, xxAnoMM, xxNoComp: String;
                             xForma: TForm; xTipoC : String );
var
   xSQL : String;
   xNombreBoton : String;
begin
   ////  Contabilización en Linea: requiere que en el DM del módulo exista
   ////  cdsMOVCNT debe hacer referencia a la tabla CNT301

  //Para Verificar duplicados
   if xTipoC='C' then begin
      xSQL:='Select CNTCOMPROB from CNT301 '
           +'WHERE CIAID='      +quotedstr(xxCia)    +' AND '
           +      'CNTANOMM='   +quotedstr(xxAnoMM)  +' AND '
           +      'TDIARID='    +quotedstr(xxTDiario)+' AND '
           +      'CNTCOMPROB=' +quotedstr(xxNoComp);
      cdsQry.Close;
      cdsQry.ProviderName:='dspTGE';
      cdsQry.DataRequest(xSQL);
      cdsQry.Open;
      if cdsQry.Recordcount>0 then begin
         ShowMessage( 'Nro. de Registro ya Existe en Contabilidad');
         Exit;
      end;
   end;

   Transferencia_CXP_a_CNT( xxCia, xxTDiario, xxAnoMM, xxNoComp, xTipoC );
   if SOLConta( xxCia, xxTDiario, xxAnoMM, xxNoComp, SRV_D, xTipoC, DMCXP.wModulo,
                cdsMovCNT, cdsNivel, cdsResultSet,
                DCOM1, xForma ) then begin
      // Correcto
   end;

end;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
procedure TDMCXP.GeneraContab_NC( xxCia, xxTDiario, xxAnoMM, xxAnoMM_busq, xxNoComp: String;
                             xForma: TForm; xTipoC : String );
var
   xSQL : String;
   xNombreBoton : String;
   xsWhere, xtWhere : String;
   xxTCambio : Double;
begin
   ////  Contabilización en Linea: requiere que en el DM del módulo exista
   ////  cdsMOVCNT debe hacer referencia a la tabla CNT301

  //Para Verificar duplicados
   if xTipoC='C' then begin
      xSQL:='Select CNTCOMPROB from CNT301 '
           +'WHERE CIAID='      +quotedstr(xxCia)    +' AND '
           +      'CNTANOMM='   +quotedstr(xxAnoMM)  +' AND '
           +      'TDIARID='    +quotedstr(xxTDiario)+' AND '
           +      'CNTCOMPROB=' +quotedstr(xxNoComp);
      cdsQry.Close;
      cdsQry.ProviderName:='dspTGE';
      cdsQry.DataRequest(xSQL);
      cdsQry.Open;
      if cdsQry.Recordcount>0 then begin
         ShowMessage( 'Nro. de Registro ya Existe en Contabilidad');
         Exit;
      end;
   end;

   Transferencia_CXP_a_CNT_NC( xxCia, xxTDiario, xxAnoMM, xxAnoMM_busq, xxNoComp, xTipoC );





   if SOLConta( xxCia, xxTDiario, xxAnoMM, xxNoComp, SRV_D, xTipoC, DMCXP.wModulo,
                cdsMovCNT, cdsNivel, cdsResultSet,
                DCOM1, xForma ) then begin
   end;


   xsWhere := 'CIAID='+quotedstr(xxCia)
   + ' and TDIARID='+quotedstr(xxTDiario)
   + ' and CNTANOMM='+quotedstr(xxAnoMM)
   + ' and CNTCOMPROB='+quotedstr(xxNoComp);

   xSQL:=' Select CIAID,TDIARID,CNTANOMM,CNTCOMPROB,CNTFCOMP from CNT300 '
       +' where ' + xsWhere ;
   cdsQry.Close;
   cdsQry.ProviderName:='dspTGE';
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   if cdsQry.Recordcount>0 then begin
     xtWhere:='TMONID='+''''+DMCXP.wTMonExt+''''+' and '
          +'FECHA='+DMCXP.wRepFuncDate+''''+FORMATDATETIME(DMCXP.wFormatFecha,cdsQry.FieldByName('CNTFCOMP').AsDateTime)+''')';
     BuscaQry('PrvTGE','TGE107',' tmonid, fecha, tcamvbc, tcamvbv, tcamvpc, tcamvpv, tcamvoc, tcamvov, tcamvxc, tcamvxv ',xtWhere,'TMONID');
     xxTCambio:=DMCXP.cdsQry.fieldbyname('TCAMVOC').AsFloat;

     xSQL := 'Update CNT300 '
          +'   set CNTTCAMBIO='+ FLOATTOSTR(xxTCambio) +', '
          +'       CNTUSER='''+(wUsuario)+''','
          +'       CNTFREG=trunc(sysdate),'
          +'       CNTHREG=sysdate '
          +' where ' + xsWhere ;
     try
        DCOM1.AppServer.EjecutaSQL(xSQL) ;
     except
        Screen.Cursor := CrDefault;
        ShowMessage('No se puede Grabar la cabecera del Comprobante');
        exit;
     End;
   end;



end;
// Fin HPC_201707_CXP

// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
procedure TDMCXP.Transferencia_CXP_a_CNT_NC( xCia, xTDia, xAAMM, xAAMM_busq, xNoComp, xTipoC : String );
var
   xSQL, xWhere : String;
   xNombreBoton : String;
   cdsDetCxPx, cdsDetCxP2 : TwwClientDataSet;
   xContR: Integer;
   xTOTMG, xTOTTO, xxTCambio : Double;

   xTotDebeMN, xTotHaberMN, xTotDebeME, xTotHaberME, xDif: Double;
begin
   // 2
   cdsDetCxPx := TwwClientDataSet.Create( Self );
   cdsDetCxPx.RemoteServer:=DCOM1;
   cdsDetCxPx.ProviderName:='dspTGE';

   xSQL:='SELECT CXP302.CIAID, CXP302.TDIARID, CXP302.DCPANOMM, CXP302.CPNOREG, '
          +  'CXP302.CUENTAID, B.CTA_AUX,  CXP302.CLAUXID, CXP302.DCPAUXID, D.PROVABR, '
          +  'B.CTA_CCOS, CXP302.CCOSID, F.CCOSABR, B.CTA_DOC, CXP302.DOCID, '
          +  'CXP302.CPSERIE, CXP302.CPNODOC, E.DOCABR, ''CXP'' MODULO, '
          +  'CXP302.DCPGLOSA, CXP302.DCPDH, CXP302.CPTCAMPR, '
          +  'CXP302.CPPRORORI, CXP302.DCPMOORI, '
          +  'CXP302.CPPRORMOLOC, CXP302.DCPMOLOC, '
          +  'CXP302.CPPRORMOEXT, CXP302.DCPMOEXT, '
          +  'CXP302.CPFEMIS, CXP302.CPFVCMTO, CXP302.DCPFCOM, ''P'' DCPESTDO, '
          +  'CXP302.DCPUSER, SYSDATE FECHA, SYSDATE HORA, CXP302.DCPMM, CXP302.DCPDD, '
          +  'CXP302.DCPTRI, CXP302.DCPSEM, CXP302.DCPANOC, CXP302.DCPSS, '
          +  'CXP302.DCPAATRI, CXP302.DCPAASEM, CXP302.DCPAASS, CXP302.TMONID, '
          +  '''S'' CNTCUADRE, B.CTAABR, C.TDIARABR, '
          +  ''' '' FLAGVAR, CXP302.DCPLOTE, CXP302.TIPDET, CXP302.DCPREG '
          +'FROM CXP302, TGE202 B, TGE104 C, TGE201 D, TGE110 E, TGE203 F '
          +'WHERE CXP302.CIAID='   +''''+xCia   +''''+' AND '
          +      'CXP302.TDIARID=' +''''+xTDia  +''''+' AND '
          +      'CXP302.DCPANOMM='+''''+xAAMM_busq  +''''+' AND '
          + ' CXP302.CIAID=B.CIAID(+) AND CXP302.CUENTAID=B.CUENTAID(+) '
          + ' AND CXP302.TDIARID=C.TDIARID(+) '
          + ' AND CXP302.CLAUXID=D.CLAUXID(+) AND CXP302.DCPAUXID=D.PROV(+) '
          + ' AND ''CXP''=E.DOCMOD(+) AND CXP302.DOCID=E.DOCID(+) '
          + ' AND CXP302.CCOSID=F.CCOSID(+) ';

      If ( xTipoC='P' ) or ( xTipoC= 'C' ) or ( xTipoC= 'BP' )then
         xSQL:= xSQL+ 'AND CXP302.CPNOREG=' +''''+xNoComp+''' ';

      xSQL:=xSQL+'ORDER BY DCPREG'; 

   cdsDetCxPx.DataRequest( xSQL );
   cdsDetCxPx.Open;

   if xTipoC='C' then begin
      try
         xSQL:='delete  from CNT311 where '
              + 'CIAID='     +''''+xCia    +''''+' AND '
              + 'TDIARID='   +''''+xTDia   +''''+' AND '
              + 'CNTANOMM='  +''''+xAAMM   +''''+' AND '
              + 'CNTCOMPROB='+''''+xNoComp +'''' ;
         DCOM1.AppServer.EjecutaSQL(xSQL) ;
      except
      end;
   end;

   if (xTipoC='C') or (xTipoC='P') or (xTipoC='BP') then
      Filtracds( cdsMovCNT,'Select ciaid, tdiarid, cntcomprob, cntano, cntanomm, cntlote, cuentaid, clauxid, auxid, docid, cntserie, cntnodoc, cntglosa, '
      +' cntdh, ccosid, cnttcambio, cntmtoori, cntmtoloc, cntmtoext, cntfemis, cntfvcmto, cntfcomp, cntestado, cntcuadre, cntfautom, cntuser, cntfreg, '
      +' cnthreg, cntmm, cntdd, cnttri, cntsem, cntss, cntaatri, cntaasem, cntaass, tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, '
      +' ccosdes, cntdebemn, cntdebeme, cnthabemn, cnthabeme, cntsaldmn, cntsaldme, campovar, cntts, cntpagado, cntmoddoc, cntreg, modulo, cta_secu from CNT311 Where '
                         + 'CIAID='     +''''+xCia    +''''+' AND '
                         + 'TDIARID='   +''''+xTDia   +''''+' AND '
                         + 'CNTANOMM='  +''''+xAAMM   +''''+' AND '
                         + 'CNTCOMPROB='+''''+xNoComp +'''' );

   if xTipoC='B' then
      Filtracds( cdsMovCNT,'Select ciaid, tdiarid, cntcomprob, cntano, cntanomm, cntlote, cuentaid, clauxid, auxid, docid, cntserie, cntnodoc, cntglosa, '
      +' cntdh, ccosid, cnttcambio, cntmtoori, cntmtoloc, cntmtoext, cntfemis, cntfvcmto, cntfcomp, cntestado, cntcuadre, cntfautom, cntuser, cntfreg, '
      +' cnthreg, cntmm, cntdd, cnttri, cntsem, cntss, cntaatri, cntaasem, cntaass, tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, '
      +' ccosdes, cntdebemn, cntdebeme, cnthabemn, cnthabeme, cntsaldmn, cntsaldme, campovar, cntts, cntpagado, cntmoddoc, cntreg, modulo, cta_secu from CNT301 Where '
                         + 'CIAID='     +''''+xCia    +''''+' AND '
                         + 'TDIARID='   +''''+xTDia   +''''+' AND '
                         + 'CNTANOMM='  +''''+xAAMM   +'''' );

   xTOTMG:=0;
   xTOTTO:=0;
    if (DMCXP.cdsCia.FieldByName('IGVSN').AsString='2') and
       (cdsDetCxPx.FieldByName('TMONID').AsString=wTMonExt) then begin

       xWhere:='TMONID='+''''+DMCXP.wTMonExt+''''+' and '
              +'FECHA='+DMCXP.wRepFuncDate+''''+FORMATDATETIME(DMCXP.wFormatFecha,cdsDetCxPx.FieldByName('DCPFCOM').AsDateTime)+''')';
       BuscaQry('PrvTGE','TGE107',' tmonid, fecha, tcamvbc, tcamvbv, tcamvpc, tcamvpv, tcamvoc, tcamvov, tcamvxc, tcamvxv ',xWhere,'TMONID');
       xxTCambio:=DMCXP.cdsQry.fieldbyname('TCAMVXC').AsFloat;
       if xxTCambio=0 then begin
          xxTCambio:=DMCXP.cdsQry.fieldbyname('TCAMVXV').AsFloat;
          if xxTCambio=0 then
             xxTCambio:=cdsDetCxPx.FieldByName('CPTCAMPR').AsFloat;
       end;

       cdsDetCxPx.First;
       while not cdsDetCxPx.EOF do begin
          if cdsDetCxPx.FieldByName('TIPDET').AsString='MG' then begin

             if cdsDetCxPx.FieldByName('CPPRORORI').Value>=0 then begin
                if cdsDetCxPx.FieldByName('DCPDH').AsString='D' then
                   XTOTMG := FRound(XTOTMG + FRound(cdsDetCxPx.FieldByName('CPPRORORI').AsFloat,15,2),15,2)
                else
                   XTOTMG := FRound(XTOTMG - FRound(cdsDetCxPx.FieldByName('CPPRORORI').AsFloat,15,2),15,2)
             end
             else begin
                if cdsDetCxP.FieldByName('DCPDH').AsString='D' then
                   XTOTMG := FRound(XTOTMG + FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat,15,2),15,2)
                else
                   XTOTMG := FRound(XTOTMG - FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat,15,2),15,2)
             end;

          end;

          if cdsDetCxPx.FieldByName('TIPDET').AsString='TO' then begin

             if cdsDetCxPx.FieldByName('CPPRORORI').Value>=0 then begin
                if cdsDetCxPx.FieldByName('DCPDH').AsString='D' then
                   XTOTTO := FRound(XTOTTO + FRound(cdsDetCxPx.FieldByName('CPPRORORI').AsFloat,15,2),15,2)
                else
                   XTOTTO := FRound(XTOTTO - FRound(cdsDetCxPx.FieldByName('CPPRORORI').AsFloat,15,2),15,2)
             end
             else begin
                if cdsDetCxPx.FieldByName('DCPDH').AsString='D' then
                   XTOTTO := FRound(XTOTTO + FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat,15,2),15,2)
                else
                   XTOTTO := FRound(XTOTTO - FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat,15,2),15,2)
             end;
          end;

          cdsDetCxPx.Next;
       end;

    end;

    xContR:=0;
    cdsDetCxPx.First;
    while not cdsDetCxPx.EOF do begin
       cdsMovCNT.Insert;
       cdsMovCNT.FieldByName('CIAID').Value     :=cdsDetCxPx.FieldByName('CIAID').AsString;
       cdsMovCNT.FieldByName('TDIARID').Value   :=cdsDetCxPx.FieldByName('TDIARID').AsString;
       cdsMovCNT.FieldByName('CNTANOMM').Value  := xAAMM;
       cdsMovCNT.FieldByName('CNTCOMPROB').Value:=cdsDetCxPx.FieldByName('CPNOREG').AsString;
       cdsMovCNT.FieldByName('CUENTAID').Value  :=cdsDetCxPx.FieldByName('CUENTAID').AsString;
       if cdsDetCxPx.FieldByName('CTA_AUX').AsString='S' then
       begin
          cdsMovCNT.FieldByName('CLAUXID').AsString   :=cdsDetCxPx.FieldByName('CLAUXID').AsString;
          cdsMovCNT.FieldByName('AUXID').AsString     :=cdsDetCxPx.FieldByName('DCPAUXID').AsString;
          cdsMovCNT.FieldByName('AUXDES').AsString    :=cdsDetCxPx.FieldByName('PROVABR').AsString;
       end
       else
       begin
       end;
       if cdsDetCxPx.FieldByName('CTA_CCOS').AsString='S' then begin
          cdsMovCNT.FieldByName('CCOSID').Value    :=cdsDetCxPx.FieldByName('CCOSID').AsString;
          cdsMovCNT.FieldByName('CCOSDES').Value   :=cdsDetCxPx.FieldByName('CCOSABR').AsString;
       end;
       if cdsDetCxPx.FieldByName('CTA_DOC').AsString='S' then begin
          cdsMovCNT.FieldByName('DOCID').Value     :=cdsDetCxPx.FieldByName('DOCID').AsString;
          cdsMovCNT.FieldByName('CNTSERIE').Value  :=cdsDetCxPx.FieldByName('CPSERIE').AsString;
          cdsMovCNT.FieldByName('CNTNODOC').Value  :=cdsDetCxPx.FieldByName('CPNODOC').AsString;
          cdsMovCNT.FieldByName('DOCDES').Value    :=cdsDetCxPx.FieldByName('DOCABR').AsString;
       end;
       cdsMovCNT.FieldByName('CNTMODDOC').Value :=cdsDetCxPx.FieldByName('MODULO').AsString;
       cdsMovCNT.FieldByName('CNTGLOSA').Value  :=cdsDetCxPx.FieldByName('DCPGLOSA').AsString;
       cdsMovCNT.FieldByName('CNTDH').Value     :=cdsDetCxPx.FieldByName('DCPDH').AsString;

       if DMCXP.cdsCia.FieldByName('IGVSN').AsString='2' then begin
          if cdsDetCxPx.FieldByName('TIPDET').AsString='MG' then
             cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=cdsDetCxPx.FieldByName('CPTCAMPR').AsString
          else
             cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=xxTCambio;
       end
       else begin
          cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=cdsDetCxPx.FieldByName('CPTCAMPR').AsString;
       end;

       if cdsDetCxPx.FieldByName('CPPRORORI').Value>=0 then begin
          cdsMovCNT.FieldByName('CNTMTOORI').Value :=FRound(cdsDetCxPx.FieldByName('CPPRORORI').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOLOC').Value :=FRound(cdsDetCxPx.FieldByName('CPPRORMOLOC').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOEXT').Value :=FRound(cdsDetCxPx.FieldByName('CPPRORMOEXT').AsFloat,15,2);
       end
       else begin
          cdsMovCNT.FieldByName('CNTMTOORI').Value :=FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOLOC').Value :=FRound(cdsDetCxPx.FieldByName('DCPMOLOC').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOEXT').Value :=FRound(cdsDetCxPx.FieldByName('DCPMOEXT').AsFloat,15,2);
       end;

       cdsMovCNT.FieldByName('CNTFEMIS').Value  :=cdsDetCxPx.FieldByName('CPFEMIS').AsDateTime;
       cdsMovCNT.FieldByName('CNTFVCMTO').Value :=cdsDetCxPx.FieldByName('CPFVCMTO').AsDateTime;
       cdsMovCNT.FieldByName('CNTFCOMP').Value  :=cdsDetCanje.FieldByName('CCPFCJE').AsString;
       cdsMovCNT.FieldByName('CNTESTADO').Value :=cdsDetCxPx.FieldByName('DCPESTDO').AsString;
       cdsMovCNT.FieldByName('CNTUSER').Value   :=DMCXP.wUsuario;
       cdsMovCNT.FieldByName('CNTFREG').Value   :=cdsDetCxPx.FieldByName('FECHA').AsDateTime;
       cdsMovCNT.FieldByName('CNTHREG').Value   :=cdsDetCxPx.FieldByName('HORA').AsDateTime;
       cdsMovCNT.FieldByName('CNTMM').Value     :=cdsDetCxPx.FieldByName('DCPMM').AsString;
       cdsMovCNT.FieldByName('CNTDD').Value     :=cdsDetCxPx.FieldByName('DCPDD').AsString;
       cdsMovCNT.FieldByName('CNTTRI').Value    :=cdsDetCxPx.FieldByName('DCPTRI').AsString;
       cdsMovCNT.FieldByName('CNTSEM').Value    :=cdsDetCxPx.FieldByName('DCPSEM').AsString;
       cdsMovCNT.FieldByName('CNTANO').Value    :=cdsDetCxPx.FieldByName('DCPANOC').AsString;
       cdsMovCNT.FieldByName('CNTSS').Value     :=cdsDetCxPx.FieldByName('DCPSS').AsString;
       cdsMovCNT.FieldByName('CNTAATRI').Value  :=cdsDetCxPx.FieldByName('DCPAATRI').AsString;
       cdsMovCNT.FieldByName('CNTAASEM').Value  :=cdsDetCxPx.FieldByName('DCPAASEM').AsString;
       cdsMovCNT.FieldByName('CNTAASS').Value   :=cdsDetCxPx.FieldByName('DCPAASS').AsString;
       cdsMovCNT.FieldByName('TMONID').Value    :=cdsDetCxPx.FieldByName('TMONID').AsString;
       cdsMovCNT.FieldByName('CNTCUADRE').Value :=cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
       cdsMovCNT.FieldByName('CTADES').Value    :=cdsDetCxPx.FieldByName('CTAABR').AsString;
       cdsMovCNT.FieldByName('TDIARDES').Value  :=cdsDetCxPx.FieldByName('TDIARABR').AsString;
       cdsMovCNT.FieldByName('CNTLOTE').Value   :=cdsDetCxPx.FieldByName('DCPLOTE').AsString;

       if cdsDetCxPx.FieldByName('DCPDH').AsString='D' then begin
          cdsMovCNT.FieldByName('CNTDEBEMN').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTDEBEME').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTHABEMN').Value :=0;
          cdsMovCNT.FieldByName('CNTHABEME').Value :=0;
          if DMCXP.cdsCia.FieldByName('IGVSN').AsString='2' then begin
             if cdsDetCxPx.FieldByName('TMONID').AsString=DMCXP.wTMonExt then begin
                if cdsDetCxPx.FieldByName('TIPDET').AsString='TO' then begin
                   cdsMovCNT.FieldByName('CNTDEBEME').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
                   cdsMovCNT.FieldByName('CNTDEBEMN').Value:=0;
                end
                else begin
                   cdsMovCNT.FieldByName('CNTDEBEMN').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
                   cdsMovCNT.FieldByName('CNTDEBEME').Value:=0;
                end;
             end;
          end;
       end;

       if cdsDetCxPx.FieldByName('DCPDH').AsString='H' then begin
          cdsMovCNT.FieldByName('CNTHABEMN').Value :=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTHABEME').Value :=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTDEBEMN').Value :=0;
          cdsMovCNT.FieldByName('CNTDEBEME').Value :=0;
          if DMCXP.cdsCia.FieldByName('IGVSN').AsString='2' then begin
             if cdsDetCxPx.FieldByName('TMONID').AsString=DMCXP.wTMonExt then begin
                if cdsDetCxPx.FieldByName('TIPDET').AsString='TO' then begin
                   cdsMovCNT.FieldByName('CNTHABEME').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
                   cdsMovCNT.FieldByName('CNTHABEMN').Value:=0;
                end
                else begin
                   cdsMovCNT.FieldByName('CNTHABEMN').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
                   cdsMovCNT.FieldByName('CNTHABEME').Value:=0;
                end;
             end;
          end
       end;

       if cdsDetCxPx.FieldByName('CPPRORORI').Value=0 then
          cdsMovCNT.Delete
       else begin
          xContR:=xContR+1;
          cdsMovCNT.FieldByName('CNTREG').Value    :=xContR;
       end;
       cdsMovCNT.FieldByName('MODULO').AsString    :=DMCXP.wModulo;
       cdsPost( DMCXP.cdsMovCNT );

       AplicaDatos( cdsMovCNT, 'MOVCNT' );

       cdsDetCxPx.Next;
    end;

    if (DMCXP.cdsCia.FieldByName('IGVSN').AsString='2') and
       (cdsDetCxPx.FieldByName('TMONID').AsString=wTMonExt) then begin

       if XTOTMG>0 then begin

          cdsMovCNT.Insert;
          cdsMovCNT.FieldByName('CIAID').Value     :=cdsDetCxPx.FieldByName('CIAID').AsString;
          cdsMovCNT.FieldByName('TDIARID').Value   :=cdsDetCxPx.FieldByName('TDIARID').AsString;
          cdsMovCNT.FieldByName('CNTANOMM').Value  :=cdsDetCxPx.FieldByName('DCPANOMM').AsString;
          cdsMovCNT.FieldByName('CNTCOMPROB').Value:=cdsDetCxPx.FieldByName('CPNOREG').AsString;
          cdsMovCNT.FieldByName('CUENTAID').Value  :='1918090000000000';

          cdsMovCNT.FieldByName('CNTMODDOC').Value :=cdsDetCxPx.FieldByName('MODULO').AsString;
          cdsMovCNT.FieldByName('CNTGLOSA').Value  :='CAMBIOS';
          cdsMovCNT.FieldByName('CNTDH').Value     :='H';

          cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=cdsDetCxPx.FieldByName('CPTCAMPR').AsString;

          cdsMovCNT.FieldByName('CNTMTOORI').Value :=XTOTMG;
          cdsMovCNT.FieldByName('CNTMTOLOC').Value :=FRound(XTOTMG*cdsMovCNT.FieldByName('CNTTCAMBIO').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOEXT').Value :=XTOTMG;

          cdsMovCNT.FieldByName('CNTFEMIS').Value  :=cdsDetCxPx.FieldByName('CPFEMIS').AsString;
          cdsMovCNT.FieldByName('CNTFVCMTO').Value :=cdsDetCxPx.FieldByName('CPFVCMTO').AsString;
          cdsMovCNT.FieldByName('CNTFCOMP').Value  :=cdsDetCxPx.FieldByName('DCPFCOM').AsString;
          cdsMovCNT.FieldByName('CNTESTADO').Value :=cdsDetCxPx.FieldByName('DCPESTDO').AsString;
          cdsMovCNT.FieldByName('CNTUSER').Value   :=DMCXP.wUsuario;
          cdsMovCNT.FieldByName('CNTFREG').Value   :=cdsDetCxPx.FieldByName('FECHA').AsDateTime;
          cdsMovCNT.FieldByName('CNTHREG').Value   :=cdsDetCxPx.FieldByName('HORA').AsDateTime;
          cdsMovCNT.FieldByName('CNTMM').Value     :=cdsDetCxPx.FieldByName('DCPMM').AsString;
          cdsMovCNT.FieldByName('CNTDD').Value     :=cdsDetCxPx.FieldByName('DCPDD').AsString;
          cdsMovCNT.FieldByName('CNTTRI').Value    :=cdsDetCxPx.FieldByName('DCPTRI').AsString;
          cdsMovCNT.FieldByName('CNTSEM').Value    :=cdsDetCxPx.FieldByName('DCPSEM').AsString;
          cdsMovCNT.FieldByName('CNTANO').Value    :=cdsDetCxPx.FieldByName('DCPANOC').AsString;
          cdsMovCNT.FieldByName('CNTSS').Value     :=cdsDetCxPx.FieldByName('DCPSS').AsString;
          cdsMovCNT.FieldByName('CNTAATRI').Value  :=cdsDetCxPx.FieldByName('DCPAATRI').AsString;
          cdsMovCNT.FieldByName('CNTAASEM').Value  :=cdsDetCxPx.FieldByName('DCPAASEM').AsString;
          cdsMovCNT.FieldByName('CNTAASS').Value   :=cdsDetCxPx.FieldByName('DCPAASS').AsString;
          cdsMovCNT.FieldByName('TMONID').Value    :=cdsDetCxPx.FieldByName('TMONID').AsString;
          cdsMovCNT.FieldByName('CNTCUADRE').Value :=cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
          cdsMovCNT.FieldByName('CTADES').Value    :=cdsDetCxPx.FieldByName('CTAABR').AsString;
          cdsMovCNT.FieldByName('TDIARDES').Value  :=cdsDetCxPx.FieldByName('TDIARABR').AsString;
          cdsMovCNT.FieldByName('CNTLOTE').Value   :=cdsDetCxPx.FieldByName('DCPLOTE').AsString;
          cdsMovCNT.FieldByName('MODULO').Value    :='CXP';

          cdsMovCNT.FieldByName('CNTHABEMN').Value :=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTHABEME').Value :=0;
          cdsMovCNT.FieldByName('CNTDEBEMN').Value :=0;
          cdsMovCNT.FieldByName('CNTDEBEME').Value :=0;

          xContR:=xContR+1;
          cdsMovCNT.FieldByName('CNTREG').Value    :=xContR;
          cdsMovCNT.FieldByName('MODULO').AsString    :=DMCXP.wModulo;
          cdsPost( DMCXP.cdsMovCNT );

       end
       else begin
          cdsMovCNT.Insert;
          cdsMovCNT.FieldByName('CIAID').Value     :=cdsDetCxPx.FieldByName('CIAID').AsString;
          cdsMovCNT.FieldByName('TDIARID').Value   :=cdsDetCxPx.FieldByName('TDIARID').AsString;
          cdsMovCNT.FieldByName('CNTANOMM').Value  :=cdsDetCxPx.FieldByName('DCPANOMM').AsString;
          cdsMovCNT.FieldByName('CNTCOMPROB').Value:=cdsDetCxPx.FieldByName('CPNOREG').AsString;
          cdsMovCNT.FieldByName('CUENTAID').Value  :='1918090000000000';

          cdsMovCNT.FieldByName('CNTMODDOC').Value :=cdsDetCxPx.FieldByName('MODULO').AsString;
          cdsMovCNT.FieldByName('CNTGLOSA').Value  :='CAMBIOS';
          cdsMovCNT.FieldByName('CNTDH').Value     :='D';

          cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=cdsDetCxPx.FieldByName('CPTCAMPR').AsString;

          cdsMovCNT.FieldByName('CNTMTOORI').Value :=XTOTMG*(-1);
          cdsMovCNT.FieldByName('CNTMTOLOC').Value :=FRound(XTOTMG*(-1)*cdsMovCNT.FieldByName('CNTTCAMBIO').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOEXT').Value :=XTOTMG*(-1);

          cdsMovCNT.FieldByName('CNTFEMIS').Value  :=cdsDetCxPx.FieldByName('CPFEMIS').AsString;
          cdsMovCNT.FieldByName('CNTFVCMTO').Value :=cdsDetCxPx.FieldByName('CPFVCMTO').AsString;
          cdsMovCNT.FieldByName('CNTFCOMP').Value  :=cdsDetCxPx.FieldByName('DCPFCOM').AsString;
          cdsMovCNT.FieldByName('CNTESTADO').Value :=cdsDetCxPx.FieldByName('DCPESTDO').AsString;
          cdsMovCNT.FieldByName('CNTUSER').Value   :=DMCXP.wUsuario;
          cdsMovCNT.FieldByName('CNTFREG').Value   :=cdsDetCxPx.FieldByName('FECHA').AsDateTime;
          cdsMovCNT.FieldByName('CNTHREG').Value   :=cdsDetCxPx.FieldByName('HORA').AsDateTime;
          cdsMovCNT.FieldByName('CNTMM').Value     :=cdsDetCxPx.FieldByName('DCPMM').AsString;
          cdsMovCNT.FieldByName('CNTDD').Value     :=cdsDetCxPx.FieldByName('DCPDD').AsString;
          cdsMovCNT.FieldByName('CNTTRI').Value    :=cdsDetCxPx.FieldByName('DCPTRI').AsString;
          cdsMovCNT.FieldByName('CNTSEM').Value    :=cdsDetCxPx.FieldByName('DCPSEM').AsString;
          cdsMovCNT.FieldByName('CNTANO').Value    :=cdsDetCxPx.FieldByName('DCPANOC').AsString;
          cdsMovCNT.FieldByName('CNTSS').Value     :=cdsDetCxPx.FieldByName('DCPSS').AsString;
          cdsMovCNT.FieldByName('CNTAATRI').Value  :=cdsDetCxPx.FieldByName('DCPAATRI').AsString;
          cdsMovCNT.FieldByName('CNTAASEM').Value  :=cdsDetCxPx.FieldByName('DCPAASEM').AsString;
          cdsMovCNT.FieldByName('CNTAASS').Value   :=cdsDetCxPx.FieldByName('DCPAASS').AsString;
          cdsMovCNT.FieldByName('TMONID').Value    :=cdsDetCxPx.FieldByName('TMONID').AsString;
          cdsMovCNT.FieldByName('CNTCUADRE').Value :=cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
          cdsMovCNT.FieldByName('CTADES').Value    :=cdsDetCxPx.FieldByName('CTAABR').AsString;
          cdsMovCNT.FieldByName('TDIARDES').Value  :=cdsDetCxPx.FieldByName('TDIARABR').AsString;
          cdsMovCNT.FieldByName('CNTLOTE').Value   :=cdsDetCxPx.FieldByName('DCPLOTE').AsString;

          cdsMovCNT.FieldByName('CNTDEBEMN').Value :=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTDEBEME').Value :=0;
          cdsMovCNT.FieldByName('CNTHABEMN').Value :=0;
          cdsMovCNT.FieldByName('CNTHABEME').Value :=0;

          xContR:=xContR+1;
          cdsMovCNT.FieldByName('CNTREG').Value    :=xContR;
          cdsMovCNT.FieldByName('MODULO').AsString    :=DMCXP.wModulo;
          cdsPost( DMCXP.cdsMovCNT );

       end;

       if XTOTTO>0 then begin

          cdsMovCNT.Insert;
          cdsMovCNT.FieldByName('CIAID').Value     :=cdsDetCxPx.FieldByName('CIAID').AsString;
          cdsMovCNT.FieldByName('TDIARID').Value   :=cdsDetCxPx.FieldByName('TDIARID').AsString;
          cdsMovCNT.FieldByName('CNTANOMM').Value  :=cdsDetCxPx.FieldByName('DCPANOMM').AsString;
          cdsMovCNT.FieldByName('CNTCOMPROB').Value:=cdsDetCxPx.FieldByName('CPNOREG').AsString;
          cdsMovCNT.FieldByName('CUENTAID').Value  :='2928090000000000';

          cdsMovCNT.FieldByName('CNTMODDOC').Value :=cdsDetCxPx.FieldByName('MODULO').AsString;
          cdsMovCNT.FieldByName('CNTGLOSA').Value  :='CONVERSIONES';
          cdsMovCNT.FieldByName('CNTDH').Value     :='H';

          cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=xxTCambio;

          cdsMovCNT.FieldByName('CNTMTOORI').Value :=XTOTTO;
          cdsMovCNT.FieldByName('CNTMTOLOC').Value :=FRound(XTOTTO*cdsMovCNT.FieldByName('CNTTCAMBIO').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOEXT').Value :=XTOTTO;

          cdsMovCNT.FieldByName('CNTFEMIS').Value  :=cdsDetCxPx.FieldByName('CPFEMIS').AsString;
          cdsMovCNT.FieldByName('CNTFVCMTO').Value :=cdsDetCxPx.FieldByName('CPFVCMTO').AsString;
          cdsMovCNT.FieldByName('CNTFCOMP').Value  :=cdsDetCxPx.FieldByName('DCPFCOM').AsString;
          cdsMovCNT.FieldByName('CNTESTADO').Value :=cdsDetCxPx.FieldByName('DCPESTDO').AsString;
          cdsMovCNT.FieldByName('CNTUSER').Value   :=DMCXP.wUsuario;
          cdsMovCNT.FieldByName('CNTFREG').Value   :=cdsDetCxPx.FieldByName('FECHA').AsDateTime;
          cdsMovCNT.FieldByName('CNTHREG').Value   :=cdsDetCxPx.FieldByName('HORA').AsDateTime;
          cdsMovCNT.FieldByName('CNTMM').Value     :=cdsDetCxPx.FieldByName('DCPMM').AsString;
          cdsMovCNT.FieldByName('CNTDD').Value     :=cdsDetCxPx.FieldByName('DCPDD').AsString;
          cdsMovCNT.FieldByName('CNTTRI').Value    :=cdsDetCxPx.FieldByName('DCPTRI').AsString;
          cdsMovCNT.FieldByName('CNTSEM').Value    :=cdsDetCxPx.FieldByName('DCPSEM').AsString;
          cdsMovCNT.FieldByName('CNTANO').Value    :=cdsDetCxPx.FieldByName('DCPANOC').AsString;
          cdsMovCNT.FieldByName('CNTSS').Value     :=cdsDetCxPx.FieldByName('DCPSS').AsString;
          cdsMovCNT.FieldByName('CNTAATRI').Value  :=cdsDetCxPx.FieldByName('DCPAATRI').AsString;
          cdsMovCNT.FieldByName('CNTAASEM').Value  :=cdsDetCxPx.FieldByName('DCPAASEM').AsString;
          cdsMovCNT.FieldByName('CNTAASS').Value   :=cdsDetCxPx.FieldByName('DCPAASS').AsString;
          cdsMovCNT.FieldByName('TMONID').Value    :=cdsDetCxPx.FieldByName('TMONID').AsString;
          cdsMovCNT.FieldByName('CNTCUADRE').Value :=cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
          cdsMovCNT.FieldByName('CTADES').Value    :=cdsDetCxPx.FieldByName('CTAABR').AsString;
          cdsMovCNT.FieldByName('TDIARDES').Value  :=cdsDetCxPx.FieldByName('TDIARABR').AsString;
          cdsMovCNT.FieldByName('CNTLOTE').Value   :=cdsDetCxPx.FieldByName('DCPLOTE').AsString;

          cdsMovCNT.FieldByName('CNTHABEMN').Value :=0; //cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat;
          cdsMovCNT.FieldByName('CNTHABEME').Value :=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTDEBEMN').Value :=0;
          cdsMovCNT.FieldByName('CNTDEBEME').Value :=0;

          xContR:=xContR+1;
          cdsMovCNT.FieldByName('CNTREG').Value    :=xContR;
          cdsMovCNT.FieldByName('MODULO').AsString    :=DMCXP.wModulo;
          cdsPost( DMCXP.cdsMovCNT );
       end
       else begin

          cdsMovCNT.Insert;
          cdsMovCNT.FieldByName('CIAID').Value     :=cdsDetCxPx.FieldByName('CIAID').AsString;
          cdsMovCNT.FieldByName('TDIARID').Value   :=cdsDetCxPx.FieldByName('TDIARID').AsString;
          cdsMovCNT.FieldByName('CNTANOMM').Value  :=cdsDetCxPx.FieldByName('DCPANOMM').AsString;
          cdsMovCNT.FieldByName('CNTCOMPROB').Value:=cdsDetCxPx.FieldByName('CPNOREG').AsString;
          cdsMovCNT.FieldByName('CUENTAID').Value  :='2928090000000000';

          cdsMovCNT.FieldByName('CNTMODDOC').Value :=cdsDetCxPx.FieldByName('MODULO').AsString;
          cdsMovCNT.FieldByName('CNTGLOSA').Value  :='CONVERSIONES';
          cdsMovCNT.FieldByName('CNTDH').Value     :='D';

          cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=xxTCambio;

          cdsMovCNT.FieldByName('CNTMTOORI').Value :=XTOTTO*(-1);
          cdsMovCNT.FieldByName('CNTMTOLOC').Value :=FRound(XTOTTO*(-1)*cdsMovCNT.FieldByName('CNTTCAMBIO').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOEXT').Value :=XTOTTO*(-1);
          cdsMovCNT.FieldByName('CNTFEMIS').Value  :=cdsDetCxPx.FieldByName('CPFEMIS').AsString;
          cdsMovCNT.FieldByName('CNTFVCMTO').Value :=cdsDetCxPx.FieldByName('CPFVCMTO').AsString;
          cdsMovCNT.FieldByName('CNTFCOMP').Value  :=cdsDetCxPx.FieldByName('DCPFCOM').AsString;
          cdsMovCNT.FieldByName('CNTESTADO').Value :=cdsDetCxPx.FieldByName('DCPESTDO').AsString;
          cdsMovCNT.FieldByName('CNTUSER').Value   :=DMCXP.wUsuario;
          cdsMovCNT.FieldByName('CNTFREG').Value   :=cdsDetCxPx.FieldByName('FECHA').AsDateTime;
          cdsMovCNT.FieldByName('CNTHREG').Value   :=cdsDetCxPx.FieldByName('HORA').AsDateTime;
          cdsMovCNT.FieldByName('CNTMM').Value     :=cdsDetCxPx.FieldByName('DCPMM').AsString;
          cdsMovCNT.FieldByName('CNTDD').Value     :=cdsDetCxPx.FieldByName('DCPDD').AsString;
          cdsMovCNT.FieldByName('CNTTRI').Value    :=cdsDetCxPx.FieldByName('DCPTRI').AsString;
          cdsMovCNT.FieldByName('CNTSEM').Value    :=cdsDetCxPx.FieldByName('DCPSEM').AsString;
          cdsMovCNT.FieldByName('CNTANO').Value    :=cdsDetCxPx.FieldByName('DCPANOC').AsString;
          cdsMovCNT.FieldByName('CNTSS').Value     :=cdsDetCxPx.FieldByName('DCPSS').AsString;
          cdsMovCNT.FieldByName('CNTAATRI').Value  :=cdsDetCxPx.FieldByName('DCPAATRI').AsString;
          cdsMovCNT.FieldByName('CNTAASEM').Value  :=cdsDetCxPx.FieldByName('DCPAASEM').AsString;
          cdsMovCNT.FieldByName('CNTAASS').Value   :=cdsDetCxPx.FieldByName('DCPAASS').AsString;
          cdsMovCNT.FieldByName('TMONID').Value    :=cdsDetCxPx.FieldByName('TMONID').AsString;
          cdsMovCNT.FieldByName('CNTCUADRE').Value :=cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
          cdsMovCNT.FieldByName('CTADES').Value    :=cdsDetCxPx.FieldByName('CTAABR').AsString;
          cdsMovCNT.FieldByName('TDIARDES').Value  :=cdsDetCxPx.FieldByName('TDIARABR').AsString;
          cdsMovCNT.FieldByName('CNTLOTE').Value   :=cdsDetCxPx.FieldByName('DCPLOTE').AsString;

          cdsMovCNT.FieldByName('CNTDEBEMN').Value:=0; 
          cdsMovCNT.FieldByName('CNTDEBEME').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTHABEMN').Value :=0;
          cdsMovCNT.FieldByName('CNTHABEME').Value :=0;

          xContR:=xContR+1;
          cdsMovCNT.FieldByName('CNTREG').Value    :=xContR;
          cdsMovCNT.FieldByName('MODULO').AsString :=DMCXP.wModulo;
          cdsPost( DMCXP.cdsMovCNT );
       end

    end;
    //diferencia de cambio
     xTotDebeMN := 0;
     xTotHaberMN := 0;
     xTotDebeME := 0;
     xTotHaberME := 0;
     cdsMovCnt.First;
     While Not cdsMovCnt.eof Do
     Begin
        If cdsMovCnt.FieldByName('CNTDH').AsString = 'D' Then
        Begin
           xTotDebeMN := xTotDebeMN + cdsMovCnt.FieldByName('CNTMTOLOC').AsFloat;
           xTotDebeME := xTotDebeME + cdsMovCnt.FieldByName('CNTMTOEXT').AsFloat;
        End
        Else
        Begin
           xTotHaberMN := xTotHaberMN + cdsMovCnt.FieldByName('CNTMTOLOC').AsFloat;
           xTotHaberME := xTotHaberME + cdsMovCnt.FieldByName('CNTMTOEXT').AsFloat;
        End;
        cdsMovCnt.Next;
     End;
     If FRound(xTotHaberMN, 15, 2) <> FRound(xTotDebeMN, 15, 2) Then
     Begin
       If FRound(xTotHaberMN, 15, 2) < FRound(xTotDebeMN, 15, 2) Then
       Begin
          xDif := FRound(FRound(xTotDebeMN, 15, 2) - FRound(xTotHaberMN, 15, 2), 15, 2);
          cdsDetCxPx.Edit;
          cdsDetCxPx.FieldByName('DCPDH').AsString:='H';
          cdsDetCxPx.Post;
          GeneraDiferenciaCambioNC( xContR, xxTCambio,xDif, '976', xCia, xTDia, xAAMM, xNoComp, xTipoC,cdsDetCxPx,cdsDetCanje);
       End;
       If FRound(xTotDebeMN, 15, 2) < FRound(xTotHaberMN, 15, 2) Then
       Begin
          xDif := FRound(FRound(xTotHaberMN, 15, 2) - FRound(xTotDebeMN, 15, 2), 15, 2);
          cdsDetCxPx.Edit;
          cdsDetCxPx.FieldByName('DCPDH').AsString:='D';
          cdsDetCxPx.Post;
          GeneraDiferenciaCambioNC( xContR, xxTCambio,xDif, '776', xCia, xTDia, xAAMM, xNoComp, xTipoC,cdsDetCxPx,cdsDetCanje);
       End;
     End;
    AplicaDatos( cdsMovCNT, 'MOVCNT' );

end;
// Fin HPC_201707_CXP

// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
procedure TDMCXP.GeneraDiferenciaCambioNC( xContR: Integer; xxTCambio,xDif : Double; xCuenta,xCia,xTDia,xAAMM,xNoComp,xTipoC : String; wCDS:TwwClientDataSet; wCDS2:TwwClientDataSet  );
begin
  if (xTipoC='C') or (xTipoC='P') or (xTipoC='BP') then
      Filtracds( cdsMovCNT,'Select ciaid, tdiarid, cntcomprob, cntano, cntanomm, cntlote, cuentaid, clauxid, auxid, docid, cntserie, cntnodoc, cntglosa, '
      +' cntdh, ccosid, cnttcambio, cntmtoori, cntmtoloc, cntmtoext, cntfemis, cntfvcmto, cntfcomp, cntestado, cntcuadre, cntfautom, cntuser, cntfreg, '
      +' cnthreg, cntmm, cntdd, cnttri, cntsem, cntss, cntaatri, cntaasem, cntaass, tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, '
      +' ccosdes, cntdebemn, cntdebeme, cnthabemn, cnthabeme, cntsaldmn, cntsaldme, campovar, cntts, cntpagado, cntmoddoc, cntreg, modulo, cta_secu from CNT311 Where '
                         + 'CIAID='     +''''+xCia    +''''+' AND '
                         + 'TDIARID='   +''''+xTDia   +''''+' AND '
                         + 'CNTANOMM='  +''''+xAAMM   +''''+' AND '
                         + 'CNTCOMPROB='+''''+xNoComp +'''' );

   if xTipoC='B' then
      Filtracds( cdsMovCNT,'Select ciaid, tdiarid, cntcomprob, cntano, cntanomm, cntlote, cuentaid, clauxid, auxid, docid, cntserie, cntnodoc, cntglosa, '
      +' cntdh, ccosid, cnttcambio, cntmtoori, cntmtoloc, cntmtoext, cntfemis, cntfvcmto, cntfcomp, cntestado, cntcuadre, cntfautom, cntuser, cntfreg, '
      +' cnthreg, cntmm, cntdd, cnttri, cntsem, cntss, cntaatri, cntaasem, cntaass, tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, '
      +' ccosdes, cntdebemn, cntdebeme, cnthabemn, cnthabeme, cntsaldmn, cntsaldme, campovar, cntts, cntpagado, cntmoddoc, cntreg, modulo, cta_secu from CNT301 Where '
                         + 'CIAID='     +''''+xCia    +''''+' AND '
                         + 'TDIARID='   +''''+xTDia   +''''+' AND '
                         + 'CNTANOMM='  +''''+xAAMM   +'''' );


   cdsMovCNT.Insert;
   cdsMovCNT.FieldByName('CIAID').Value     :=wCDS.FieldByName('CIAID').AsString; //cdsDetCxPx
   cdsMovCNT.FieldByName('TDIARID').Value   :=wCDS.FieldByName('TDIARID').AsString;
   cdsMovCNT.FieldByName('CNTANOMM').Value  := xAAMM;
   cdsMovCNT.FieldByName('CNTCOMPROB').Value:=wCDS.FieldByName('CPNOREG').AsString;
   cdsMovCNT.FieldByName('CUENTAID').Value  :=xCuenta;
   if wCDS.FieldByName('CTA_AUX').AsString='S' then
   begin
      cdsMovCNT.FieldByName('CLAUXID').AsString   :='';
      cdsMovCNT.FieldByName('AUXID').AsString     :='';
      cdsMovCNT.FieldByName('AUXDES').AsString    :='';
   end
   else
   begin
   end;
   if wCDS.FieldByName('CTA_CCOS').AsString='S' then begin
      If (xCuenta = '976') then
      Begin
          cdsMovCNT.FieldByName('CCOSID').Value    :='0301';
          cdsMovCNT.FieldByName('CCOSDES').Value   :='Gerencia Administrativa';
      End
      Else
      Begin
          cdsMovCNT.FieldByName('CCOSID').Value    :='';
          cdsMovCNT.FieldByName('CCOSDES').Value   :='';
      End;


   end;
   if wCDS.FieldByName('CTA_DOC').AsString='S' then begin
      cdsMovCNT.FieldByName('DOCID').Value     :=wCDS.FieldByName('DOCID').AsString;
      cdsMovCNT.FieldByName('CNTSERIE').Value  :=wCDS.FieldByName('CPSERIE').AsString;
      cdsMovCNT.FieldByName('CNTNODOC').Value  :=wCDS.FieldByName('CPNODOC').AsString;
      cdsMovCNT.FieldByName('DOCDES').Value    :=wCDS.FieldByName('DOCABR').AsString;
   end;
   cdsMovCNT.FieldByName('CNTMODDOC').Value :=wCDS.FieldByName('MODULO').AsString;
   cdsMovCNT.FieldByName('CNTGLOSA').Value  :='Diferencia de cambio';
   cdsMovCNT.FieldByName('CNTDH').Value     :=wCDS.FieldByName('DCPDH').AsString;

   if DMCXP.cdsCia.FieldByName('IGVSN').AsString='2' then begin
      if wCDS.FieldByName('TIPDET').AsString='MG' then
      begin
         //cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=FRound(wCDS.FieldByName('CPTCAMPR').AsFloat,15,2);
         cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=wCDS.FieldByName('CPTCAMPR').AsFloat;
      end
      else
      begin
         cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=xxTCambio;
      end;
   end
   else begin
      //cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=FRound(wCDS.FieldByName('CPTCAMPR').AsFloat,15,2);
      cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=wCDS.FieldByName('CPTCAMPR').AsFloat;
   end;

   cdsMovCNT.FieldByName('CNTMTOORI').Value :=0;
   cdsMovCNT.FieldByName('CNTMTOLOC').Value :=xDif;
   cdsMovCNT.FieldByName('CNTMTOEXT').Value :=0;
   
   {cdsMovCNT.FieldByName('CNTFEMIS').Value  :=wCDS.FieldByName('CPFEMIS').AsDateTime;
   cdsMovCNT.FieldByName('CNTFVCMTO').Value :=wCDS.FieldByName('CPFVCMTO').AsDateTime;}
   cdsMovCNT.FieldByName('CNTFEMIS').Value  :=wCDS2.FieldByName('CCPFCJE').AsDateTime;
   cdsMovCNT.FieldByName('CNTFVCMTO').Value :=wCDS2.FieldByName('CCPFCJE').AsDateTime;

   cdsMovCNT.FieldByName('CNTFCOMP').Value  :=wCDS2.FieldByName('CCPFCJE').AsString;//cdsDetCanje
   cdsMovCNT.FieldByName('CNTESTADO').Value :=wCDS.FieldByName('DCPESTDO').AsString;
   cdsMovCNT.FieldByName('CNTUSER').Value   :=DMCXP.wUsuario;
   cdsMovCNT.FieldByName('CNTFREG').Value   :=wCDS.FieldByName('FECHA').AsDateTime;
   cdsMovCNT.FieldByName('CNTHREG').Value   :=wCDS.FieldByName('HORA').AsDateTime;
   cdsMovCNT.FieldByName('CNTMM').Value     :=wCDS.FieldByName('DCPMM').AsString;
   cdsMovCNT.FieldByName('CNTDD').Value     :=wCDS.FieldByName('DCPDD').AsString;
   cdsMovCNT.FieldByName('CNTTRI').Value    :=wCDS.FieldByName('DCPTRI').AsString;
   cdsMovCNT.FieldByName('CNTSEM').Value    :=wCDS.FieldByName('DCPSEM').AsString;
   cdsMovCNT.FieldByName('CNTANO').Value    :=wCDS.FieldByName('DCPANOC').AsString;
   cdsMovCNT.FieldByName('CNTSS').Value     :=wCDS.FieldByName('DCPSS').AsString;
   cdsMovCNT.FieldByName('CNTAATRI').Value  :=wCDS.FieldByName('DCPAATRI').AsString;
   cdsMovCNT.FieldByName('CNTAASEM').Value  :=wCDS.FieldByName('DCPAASEM').AsString;
   cdsMovCNT.FieldByName('CNTAASS').Value   :=wCDS.FieldByName('DCPAASS').AsString;
   cdsMovCNT.FieldByName('TMONID').Value    :=wCDS.FieldByName('TMONID').AsString;
   cdsMovCNT.FieldByName('CNTCUADRE').Value :=wCDS.FieldByName('CNTCUADRE').AsString;
   cdsMovCNT.FieldByName('CTADES').Value    :=wCDS.FieldByName('CTAABR').AsString;
   cdsMovCNT.FieldByName('TDIARDES').Value  :=wCDS.FieldByName('TDIARABR').AsString;
   cdsMovCNT.FieldByName('CNTLOTE').Value   :=wCDS.FieldByName('DCPLOTE').AsString;

   if wCDS.FieldByName('DCPDH').AsString='D' then begin
      cdsMovCNT.FieldByName('CNTDEBEMN').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
      cdsMovCNT.FieldByName('CNTDEBEME').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
      cdsMovCNT.FieldByName('CNTHABEMN').Value :=0;
      cdsMovCNT.FieldByName('CNTHABEME').Value :=0;
      if DMCXP.cdsCia.FieldByName('IGVSN').AsString='2' then begin
         if wCDS.FieldByName('TMONID').AsString=DMCXP.wTMonExt then begin
            if wCDS.FieldByName('TIPDET').AsString='TO' then begin
               cdsMovCNT.FieldByName('CNTDEBEME').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
               cdsMovCNT.FieldByName('CNTDEBEMN').Value:=0;
            end
            else begin
               cdsMovCNT.FieldByName('CNTDEBEMN').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
               cdsMovCNT.FieldByName('CNTDEBEME').Value:=0;
            end;
         end;
      end;
   end;

   if wCDS.FieldByName('DCPDH').AsString='H' then begin
      cdsMovCNT.FieldByName('CNTHABEMN').Value :=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
      cdsMovCNT.FieldByName('CNTHABEME').Value :=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
      cdsMovCNT.FieldByName('CNTDEBEMN').Value :=0;
      cdsMovCNT.FieldByName('CNTDEBEME').Value :=0;
      if DMCXP.cdsCia.FieldByName('IGVSN').AsString='2' then begin
         if wCDS.FieldByName('TMONID').AsString=DMCXP.wTMonExt then begin
            if wCDS.FieldByName('TIPDET').AsString='TO' then begin
               cdsMovCNT.FieldByName('CNTHABEME').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
               cdsMovCNT.FieldByName('CNTHABEMN').Value:=0;
            end
            else begin
               cdsMovCNT.FieldByName('CNTHABEMN').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
               cdsMovCNT.FieldByName('CNTHABEME').Value:=0;
            end;
         end;
      end
   end;

   if wCDS.FieldByName('CPPRORORI').Value=0 then
      cdsMovCNT.Delete
   else begin
      xContR:=xContR+1;
      cdsMovCNT.FieldByName('CNTREG').Value    :=xContR;
   end;
   cdsMovCNT.FieldByName('MODULO').AsString    :=DMCXP.wModulo;
   cdsPost( DMCXP.cdsMovCNT );

   AplicaDatos( cdsMovCNT, 'MOVCNT' );

end;
// Fin HPC_201707_CXP

procedure TDMCXP.Transferencia_CXP_a_CNT( xCia, xTDia, xAAMM, xNoComp, xTipoC : String );
var
   xSQL, xWhere : String;
   xNombreBoton : String;
   cdsDetCxPx, cdsDetCxP2 : TwwClientDataSet;
   xContR: Integer;
   xTOTMG, xTOTTO, xxTCambio : Double;
begin
   // 2
   cdsDetCxPx := TwwClientDataSet.Create( Self );
   cdsDetCxPx.RemoteServer:=DCOM1;
   cdsDetCxPx.ProviderName:='dspTGE';

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
     xSQL:='SELECT CXP302.CIAID, CXP302.TDIARID, CXP302.DCPANOMM, CXP302.CPNOREG, '
          +  'CXP302.CUENTAID, B.CTA_AUX,  CXP302.CLAUXID, CXP302.DCPAUXID, D.PROVABR, '
          +  'B.CTA_CCOS, CXP302.CCOSID, F.CCOSABR, B.CTA_DOC, CXP302.DOCID, '
          +  'CXP302.CPSERIE, CXP302.CPNODOC, E.DOCABR, ''CXP'' MODULO, '
          +  'CXP302.DCPGLOSA, CXP302.DCPDH, CXP302.CPTCAMPR, '
          +  'CXP302.CPPRORORI, CXP302.DCPMOORI, '
          +  'CXP302.CPPRORMOLOC, CXP302.DCPMOLOC, '
          +  'CXP302.CPPRORMOEXT, CXP302.DCPMOEXT, '
          +  'CXP302.CPFEMIS, CXP302.CPFVCMTO, CXP302.DCPFCOM, ''P'' DCPESTDO, '
          +  'CXP302.DCPUSER, CURRENT DATE FECHA, CURRENT TIME HORA, CXP302.DCPMM, CXP302.DCPDD, '
          +  'CXP302.DCPTRI, CXP302.DCPSEM, CXP302.DCPANOC, CXP302.DCPSS, '
          +  'CXP302.DCPAATRI, CXP302.DCPAASEM, CXP302.DCPAASS, CXP302.TMONID, '
          +  '''S'' CNTCUADRE, B.CTAABR, C.TDIARABR, '
          +  '''Z'' FLAGVAR, CXP302.DCPLOTE, CXP302.TIPDET, CXP302.DCPREG '
          +'FROM CXP302 '
          +  'LEFT JOIN TGE202 B ON ( CXP302.CIAID=B.CIAID AND CXP302.CUENTAID=B.CUENTAID ) '
          +  'LEFT JOIN TGE104 C ON ( CXP302.TDIARID =C.TDIARID ) '
          +  'LEFT JOIN TGE201 D ON ( CXP302.CLAUXID=D.CLAUXID AND CXP302.DCPAUXID=D.PROV ) '
          +  'LEFT JOIN TGE110 E ON ( E.DOCMOD=''CXP'' AND CXP302.DOCID=E.DOCID ) '
          +  'LEFT JOIN TGE203 F ON ( CXP302.CCOSID=F.CCOSID  ) '
          +'WHERE CXP302.CIAID='''+ xCia  +''' and CXP302.DCPANOMM='''+ xAAMM +''' '
          +  'and CXP302.TDIARID=''' + xTDia +''' ';

      If ( xTipoC='P' ) or ( xTipoC= 'C' ) or ( xTipoC= 'BP' )then
         xSQL:= xSQL+ 'AND CXP302.CPNOREG='''+ xNoComp +''' ';

      xSQL:=xSQL+'ORDER BY DCPREG';
   end;

   if SRV_D = 'ORACLE' then
   begin
     xSQL:='SELECT CXP302.CIAID, CXP302.TDIARID, CXP302.DCPANOMM, CXP302.CPNOREG, '
          +  'CXP302.CUENTAID, B.CTA_AUX,  CXP302.CLAUXID, CXP302.DCPAUXID, D.PROVABR, '
          +  'B.CTA_CCOS, CXP302.CCOSID, F.CCOSABR, B.CTA_DOC, CXP302.DOCID, '
          +  'CXP302.CPSERIE, CXP302.CPNODOC, E.DOCABR, ''CXP'' MODULO, '
          +  'CXP302.DCPGLOSA, CXP302.DCPDH, CXP302.CPTCAMPR, '
          +  'CXP302.CPPRORORI, CXP302.DCPMOORI, '
          +  'CXP302.CPPRORMOLOC, CXP302.DCPMOLOC, '
          +  'CXP302.CPPRORMOEXT, CXP302.DCPMOEXT, '
          +  'CXP302.CPFEMIS, CXP302.CPFVCMTO, CXP302.DCPFCOM, ''P'' DCPESTDO, '
          +  'CXP302.DCPUSER, SYSDATE FECHA, SYSDATE HORA, CXP302.DCPMM, CXP302.DCPDD, '
          +  'CXP302.DCPTRI, CXP302.DCPSEM, CXP302.DCPANOC, CXP302.DCPSS, '
          +  'CXP302.DCPAATRI, CXP302.DCPAASEM, CXP302.DCPAASS, CXP302.TMONID, '
          +  '''S'' CNTCUADRE, B.CTAABR, C.TDIARABR, '
          +  ''' '' FLAGVAR, CXP302.DCPLOTE, CXP302.TIPDET, CXP302.DCPREG '
          +'FROM CXP302, TGE202 B, TGE104 C, TGE201 D, TGE110 E, TGE203 F '
          +'WHERE CXP302.CIAID='   +''''+xCia   +''''+' AND '
          +      'CXP302.TDIARID=' +''''+xTDia  +''''+' AND '
          +      'CXP302.DCPANOMM='+''''+xAAMM  +''''+' AND '
          + ' CXP302.CIAID=B.CIAID(+) AND CXP302.CUENTAID=B.CUENTAID(+) '
          + ' AND CXP302.TDIARID=C.TDIARID(+) '
          + ' AND CXP302.CLAUXID=D.CLAUXID(+) AND CXP302.DCPAUXID=D.PROV(+) '
          + ' AND ''CXP''=E.DOCMOD(+) AND CXP302.DOCID=E.DOCID(+) '
          + ' AND CXP302.CCOSID=F.CCOSID(+) ';

      If ( xTipoC='P' ) or ( xTipoC= 'C' ) or ( xTipoC= 'BP' )then
         xSQL:= xSQL+ 'AND CXP302.CPNOREG=' +''''+xNoComp+''' ';

      xSQL:=xSQL+'ORDER BY DCPREG';

   end;

   cdsDetCxPx.DataRequest( xSQL );
   cdsDetCxPx.Open;

   if xTipoC='C' then begin
      try
         xSQL:='delete  from CNT311 where '
              + 'CIAID='     +''''+xCia    +''''+' AND '
              + 'TDIARID='   +''''+xTDia   +''''+' AND '
              + 'CNTANOMM='  +''''+xAAMM   +''''+' AND '
              + 'CNTCOMPROB='+''''+xNoComp +'''' ;
 //    Inicio HPC_201401_CXP
 //        DCOM1.AppServer.IniciaTransaccion;
         DCOM1.AppServer.EjecutaSQL(xSQL) ;
 //        DCOM1.AppServer.GrabaTransaccion;
      except
 //        DCOM1.AppServer.RetornaTransaccion;
      end;
 //    Fin HPC_201401_CXP
   end;

   if (xTipoC='C') or (xTipoC='P') or (xTipoC='BP') then
      Filtracds( cdsMovCNT,'Select * from CNT311 Where '
                         + 'CIAID='     +''''+xCia    +''''+' AND '
                         + 'TDIARID='   +''''+xTDia   +''''+' AND '
                         + 'CNTANOMM='  +''''+xAAMM   +''''+' AND '
                         + 'CNTCOMPROB='+''''+xNoComp +'''' );

   if xTipoC='B' then
      Filtracds( cdsMovCNT,'Select * from CNT301 Where '
                         + 'CIAID='     +''''+xCia    +''''+' AND '
                         + 'TDIARID='   +''''+xTDia   +''''+' AND '
                         + 'CNTANOMM='  +''''+xAAMM   +'''' );

   xTOTMG:=0;
   xTOTTO:=0;
    if (DMCXP.cdsCia.FieldByName('IGVSN').AsString='2') and
       (cdsDetCxPx.FieldByName('TMONID').AsString=wTMonExt) then begin

       xWhere:='TMONID='+''''+DMCXP.wTMonExt+''''+' and '
              +'FECHA='+DMCXP.wRepFuncDate+''''+FORMATDATETIME(DMCXP.wFormatFecha,cdsDetCxPx.FieldByName('DCPFCOM').AsDateTime)+''')';
       BuscaQry('PrvTGE','TGE107','*',xWhere,'TMONID');
       xxTCambio:=DMCXP.cdsQry.fieldbyname('TCAMVXC').AsFloat;
       if xxTCambio=0 then begin
          xxTCambio:=DMCXP.cdsQry.fieldbyname('TCAMVXV').AsFloat;
          if xxTCambio=0 then
             xxTCambio:=cdsDetCxPx.FieldByName('CPTCAMPR').AsFloat;
       end;

       cdsDetCxPx.First;
       while not cdsDetCxPx.EOF do begin
          if cdsDetCxPx.FieldByName('TIPDET').AsString='MG' then begin

             if cdsDetCxPx.FieldByName('CPPRORORI').Value>=0 then begin
                if cdsDetCxPx.FieldByName('DCPDH').AsString='D' then
                   XTOTMG := FRound(XTOTMG + FRound(cdsDetCxPx.FieldByName('CPPRORORI').AsFloat,15,2),15,2)
                else
                   XTOTMG := FRound(XTOTMG - FRound(cdsDetCxPx.FieldByName('CPPRORORI').AsFloat,15,2),15,2)
             end
             else begin
                if cdsDetCxP.FieldByName('DCPDH').AsString='D' then
                   XTOTMG := FRound(XTOTMG + FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat,15,2),15,2)
                else
                   XTOTMG := FRound(XTOTMG - FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat,15,2),15,2)
             end;

          end;

          if cdsDetCxPx.FieldByName('TIPDET').AsString='TO' then begin

             if cdsDetCxPx.FieldByName('CPPRORORI').Value>=0 then begin
                if cdsDetCxPx.FieldByName('DCPDH').AsString='D' then
                   XTOTTO := FRound(XTOTTO + FRound(cdsDetCxPx.FieldByName('CPPRORORI').AsFloat,15,2),15,2)
                else
                   XTOTTO := FRound(XTOTTO - FRound(cdsDetCxPx.FieldByName('CPPRORORI').AsFloat,15,2),15,2)
             end
             else begin
                if cdsDetCxPx.FieldByName('DCPDH').AsString='D' then
                   XTOTTO := FRound(XTOTTO + FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat,15,2),15,2)
                else
                   XTOTTO := FRound(XTOTTO - FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat,15,2),15,2)
             end;
          end;

          cdsDetCxPx.Next;
       end;

    end;

    xContR:=0;
    cdsDetCxPx.First;
    while not cdsDetCxPx.EOF do begin
       cdsMovCNT.Insert;
       cdsMovCNT.FieldByName('CIAID').Value     :=cdsDetCxPx.FieldByName('CIAID').AsString;
       cdsMovCNT.FieldByName('TDIARID').Value   :=cdsDetCxPx.FieldByName('TDIARID').AsString;
       cdsMovCNT.FieldByName('CNTANOMM').Value  :=cdsDetCxPx.FieldByName('DCPANOMM').AsString;
       cdsMovCNT.FieldByName('CNTCOMPROB').Value:=cdsDetCxPx.FieldByName('CPNOREG').AsString;
       cdsMovCNT.FieldByName('CUENTAID').Value  :=cdsDetCxPx.FieldByName('CUENTAID').AsString;
       if cdsDetCxPx.FieldByName('CTA_AUX').AsString='S' then
       begin
          cdsMovCNT.FieldByName('CLAUXID').AsString   :=cdsDetCxPx.FieldByName('CLAUXID').AsString;
          cdsMovCNT.FieldByName('AUXID').AsString     :=cdsDetCxPx.FieldByName('DCPAUXID').AsString;
          cdsMovCNT.FieldByName('AUXDES').AsString    :=cdsDetCxPx.FieldByName('PROVABR').AsString;
       end
       else
       begin
//          cdsMovCNT.FieldByName('CLAUXID').AsString   :='xx';
//          cdsMovCNT.FieldByName('AUXID').AsString     :='xxx';
//          cdsMovCNT.FieldByName('AUXDES').AsString    :='xxx';
       end;
       if cdsDetCxPx.FieldByName('CTA_CCOS').AsString='S' then begin
          cdsMovCNT.FieldByName('CCOSID').Value    :=cdsDetCxPx.FieldByName('CCOSID').AsString;
          cdsMovCNT.FieldByName('CCOSDES').Value   :=cdsDetCxPx.FieldByName('CCOSABR').AsString;
       end;
       if cdsDetCxPx.FieldByName('CTA_DOC').AsString='S' then begin
          cdsMovCNT.FieldByName('DOCID').Value     :=cdsDetCxPx.FieldByName('DOCID').AsString;
          cdsMovCNT.FieldByName('CNTSERIE').Value  :=cdsDetCxPx.FieldByName('CPSERIE').AsString;
          cdsMovCNT.FieldByName('CNTNODOC').Value  :=cdsDetCxPx.FieldByName('CPNODOC').AsString;
          cdsMovCNT.FieldByName('DOCDES').Value    :=cdsDetCxPx.FieldByName('DOCABR').AsString;
       end;
       cdsMovCNT.FieldByName('CNTMODDOC').Value :=cdsDetCxPx.FieldByName('MODULO').AsString;
       cdsMovCNT.FieldByName('CNTGLOSA').Value  :=cdsDetCxPx.FieldByName('DCPGLOSA').AsString;
       cdsMovCNT.FieldByName('CNTDH').Value     :=cdsDetCxPx.FieldByName('DCPDH').AsString;

       if DMCXP.cdsCia.FieldByName('IGVSN').AsString='2' then begin
          if cdsDetCxPx.FieldByName('TIPDET').AsString='MG' then
             cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=cdsDetCxPx.FieldByName('CPTCAMPR').AsString
          else
             cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=xxTCambio;
       end
       else begin
          cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=cdsDetCxPx.FieldByName('CPTCAMPR').AsString;
       end;

       if cdsDetCxPx.FieldByName('CPPRORORI').Value>=0 then begin
          cdsMovCNT.FieldByName('CNTMTOORI').Value :=FRound(cdsDetCxPx.FieldByName('CPPRORORI').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOLOC').Value :=FRound(cdsDetCxPx.FieldByName('CPPRORMOLOC').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOEXT').Value :=FRound(cdsDetCxPx.FieldByName('CPPRORMOEXT').AsFloat,15,2);
       end
       else begin
          cdsMovCNT.FieldByName('CNTMTOORI').Value :=FRound(cdsDetCxPx.FieldByName('DCPMOORI').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOLOC').Value :=FRound(cdsDetCxPx.FieldByName('DCPMOLOC').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOEXT').Value :=FRound(cdsDetCxPx.FieldByName('DCPMOEXT').AsFloat,15,2);
       end;

       cdsMovCNT.FieldByName('CNTFEMIS').Value  :=cdsDetCxPx.FieldByName('CPFEMIS').AsDateTime;
       cdsMovCNT.FieldByName('CNTFVCMTO').Value :=cdsDetCxPx.FieldByName('CPFVCMTO').AsDateTime;
       cdsMovCNT.FieldByName('CNTFCOMP').Value  :=cdsDetCxPx.FieldByName('DCPFCOM').AsString;
       cdsMovCNT.FieldByName('CNTESTADO').Value :=cdsDetCxPx.FieldByName('DCPESTDO').AsString;
       cdsMovCNT.FieldByName('CNTUSER').Value   :=DMCXP.wUsuario;
       cdsMovCNT.FieldByName('CNTFREG').Value   :=cdsDetCxPx.FieldByName('FECHA').AsDateTime;
       cdsMovCNT.FieldByName('CNTHREG').Value   :=cdsDetCxPx.FieldByName('HORA').AsDateTime;
       cdsMovCNT.FieldByName('CNTMM').Value     :=cdsDetCxPx.FieldByName('DCPMM').AsString;
       cdsMovCNT.FieldByName('CNTDD').Value     :=cdsDetCxPx.FieldByName('DCPDD').AsString;
       cdsMovCNT.FieldByName('CNTTRI').Value    :=cdsDetCxPx.FieldByName('DCPTRI').AsString;
       cdsMovCNT.FieldByName('CNTSEM').Value    :=cdsDetCxPx.FieldByName('DCPSEM').AsString;
       cdsMovCNT.FieldByName('CNTANO').Value    :=cdsDetCxPx.FieldByName('DCPANOC').AsString;
       cdsMovCNT.FieldByName('CNTSS').Value     :=cdsDetCxPx.FieldByName('DCPSS').AsString;
       cdsMovCNT.FieldByName('CNTAATRI').Value  :=cdsDetCxPx.FieldByName('DCPAATRI').AsString;
       cdsMovCNT.FieldByName('CNTAASEM').Value  :=cdsDetCxPx.FieldByName('DCPAASEM').AsString;
       cdsMovCNT.FieldByName('CNTAASS').Value   :=cdsDetCxPx.FieldByName('DCPAASS').AsString;
       cdsMovCNT.FieldByName('TMONID').Value    :=cdsDetCxPx.FieldByName('TMONID').AsString;
       cdsMovCNT.FieldByName('CNTCUADRE').Value :=cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
       cdsMovCNT.FieldByName('CTADES').Value    :=cdsDetCxPx.FieldByName('CTAABR').AsString;
       cdsMovCNT.FieldByName('TDIARDES').Value  :=cdsDetCxPx.FieldByName('TDIARABR').AsString;
       cdsMovCNT.FieldByName('CNTLOTE').Value   :=cdsDetCxPx.FieldByName('DCPLOTE').AsString;

       if cdsDetCxPx.FieldByName('DCPDH').AsString='D' then begin
          cdsMovCNT.FieldByName('CNTDEBEMN').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTDEBEME').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTHABEMN').Value :=0;
          cdsMovCNT.FieldByName('CNTHABEME').Value :=0;
          if DMCXP.cdsCia.FieldByName('IGVSN').AsString='2' then begin
             if cdsDetCxPx.FieldByName('TMONID').AsString=DMCXP.wTMonExt then begin
                if cdsDetCxPx.FieldByName('TIPDET').AsString='TO' then begin
                   cdsMovCNT.FieldByName('CNTDEBEME').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
                   cdsMovCNT.FieldByName('CNTDEBEMN').Value:=0;
                end
                else begin
                   cdsMovCNT.FieldByName('CNTDEBEMN').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
                   cdsMovCNT.FieldByName('CNTDEBEME').Value:=0;
                end;
             end;
          end;
       end;

       if cdsDetCxPx.FieldByName('DCPDH').AsString='H' then begin
          cdsMovCNT.FieldByName('CNTHABEMN').Value :=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTHABEME').Value :=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTDEBEMN').Value :=0;
          cdsMovCNT.FieldByName('CNTDEBEME').Value :=0;
          if DMCXP.cdsCia.FieldByName('IGVSN').AsString='2' then begin
             if cdsDetCxPx.FieldByName('TMONID').AsString=DMCXP.wTMonExt then begin
                if cdsDetCxPx.FieldByName('TIPDET').AsString='TO' then begin
                   cdsMovCNT.FieldByName('CNTHABEME').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
                   cdsMovCNT.FieldByName('CNTHABEMN').Value:=0;
                end
                else begin
                   cdsMovCNT.FieldByName('CNTHABEMN').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
                   cdsMovCNT.FieldByName('CNTHABEME').Value:=0;
                end;
             end;
          end
       end;

       if cdsDetCxPx.FieldByName('CPPRORORI').Value=0 then
          cdsMovCNT.Delete
       else begin
          xContR:=xContR+1;
          cdsMovCNT.FieldByName('CNTREG').Value    :=xContR;
          cdsMovCNT.FieldByName('CNTREG').Value    :=cdsDetCxPx.FieldByName('DCPREG').AsInteger;
       end;
       cdsMovCNT.FieldByName('MODULO').AsString    :=DMCXP.wModulo;
       cdsPost( DMCXP.cdsMovCNT );

       AplicaDatos( cdsMovCNT, 'MOVCNT' );

       cdsDetCxPx.Next;
    end;

    if (DMCXP.cdsCia.FieldByName('IGVSN').AsString='2') and
       (cdsDetCxPx.FieldByName('TMONID').AsString=wTMonExt) then begin

       if XTOTMG>0 then begin

          cdsMovCNT.Insert;
          cdsMovCNT.FieldByName('CIAID').Value     :=cdsDetCxPx.FieldByName('CIAID').AsString;
          cdsMovCNT.FieldByName('TDIARID').Value   :=cdsDetCxPx.FieldByName('TDIARID').AsString;
          cdsMovCNT.FieldByName('CNTANOMM').Value  :=cdsDetCxPx.FieldByName('DCPANOMM').AsString;
          cdsMovCNT.FieldByName('CNTCOMPROB').Value:=cdsDetCxPx.FieldByName('CPNOREG').AsString;
          cdsMovCNT.FieldByName('CUENTAID').Value  :='1918090000000000';

          cdsMovCNT.FieldByName('CNTMODDOC').Value :=cdsDetCxPx.FieldByName('MODULO').AsString;
          cdsMovCNT.FieldByName('CNTGLOSA').Value  :='CAMBIOS';
          cdsMovCNT.FieldByName('CNTDH').Value     :='H';

          cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=cdsDetCxPx.FieldByName('CPTCAMPR').AsString;

          cdsMovCNT.FieldByName('CNTMTOORI').Value :=XTOTMG;
          cdsMovCNT.FieldByName('CNTMTOLOC').Value :=FRound(XTOTMG*cdsMovCNT.FieldByName('CNTTCAMBIO').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOEXT').Value :=XTOTMG;

          cdsMovCNT.FieldByName('CNTFEMIS').Value  :=cdsDetCxPx.FieldByName('CPFEMIS').AsString;
          cdsMovCNT.FieldByName('CNTFVCMTO').Value :=cdsDetCxPx.FieldByName('CPFVCMTO').AsString;
          cdsMovCNT.FieldByName('CNTFCOMP').Value  :=cdsDetCxPx.FieldByName('DCPFCOM').AsString;
          cdsMovCNT.FieldByName('CNTESTADO').Value :=cdsDetCxPx.FieldByName('DCPESTDO').AsString;
          cdsMovCNT.FieldByName('CNTUSER').Value   :=DMCXP.wUsuario;
          cdsMovCNT.FieldByName('CNTFREG').Value   :=cdsDetCxPx.FieldByName('FECHA').AsDateTime;
          cdsMovCNT.FieldByName('CNTHREG').Value   :=cdsDetCxPx.FieldByName('HORA').AsDateTime;
          cdsMovCNT.FieldByName('CNTMM').Value     :=cdsDetCxPx.FieldByName('DCPMM').AsString;
          cdsMovCNT.FieldByName('CNTDD').Value     :=cdsDetCxPx.FieldByName('DCPDD').AsString;
          cdsMovCNT.FieldByName('CNTTRI').Value    :=cdsDetCxPx.FieldByName('DCPTRI').AsString;
          cdsMovCNT.FieldByName('CNTSEM').Value    :=cdsDetCxPx.FieldByName('DCPSEM').AsString;
          cdsMovCNT.FieldByName('CNTANO').Value    :=cdsDetCxPx.FieldByName('DCPANOC').AsString;
          cdsMovCNT.FieldByName('CNTSS').Value     :=cdsDetCxPx.FieldByName('DCPSS').AsString;
          cdsMovCNT.FieldByName('CNTAATRI').Value  :=cdsDetCxPx.FieldByName('DCPAATRI').AsString;
          cdsMovCNT.FieldByName('CNTAASEM').Value  :=cdsDetCxPx.FieldByName('DCPAASEM').AsString;
          cdsMovCNT.FieldByName('CNTAASS').Value   :=cdsDetCxPx.FieldByName('DCPAASS').AsString;
          cdsMovCNT.FieldByName('TMONID').Value    :=cdsDetCxPx.FieldByName('TMONID').AsString;
          cdsMovCNT.FieldByName('CNTCUADRE').Value :=cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
          cdsMovCNT.FieldByName('CTADES').Value    :=cdsDetCxPx.FieldByName('CTAABR').AsString;
          cdsMovCNT.FieldByName('TDIARDES').Value  :=cdsDetCxPx.FieldByName('TDIARABR').AsString;
          cdsMovCNT.FieldByName('CNTLOTE').Value   :=cdsDetCxPx.FieldByName('DCPLOTE').AsString;
          cdsMovCNT.FieldByName('MODULO').Value    :='CXP';

          cdsMovCNT.FieldByName('CNTHABEMN').Value :=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTHABEME').Value :=0;
          cdsMovCNT.FieldByName('CNTDEBEMN').Value :=0;
          cdsMovCNT.FieldByName('CNTDEBEME').Value :=0;

          xContR:=xContR+1;
          cdsMovCNT.FieldByName('CNTREG').Value    :=xContR;
          cdsMovCNT.FieldByName('MODULO').AsString    :=DMCXP.wModulo;
          cdsPost( DMCXP.cdsMovCNT );

       end
       else begin
          cdsMovCNT.Insert;
          cdsMovCNT.FieldByName('CIAID').Value     :=cdsDetCxPx.FieldByName('CIAID').AsString;
          cdsMovCNT.FieldByName('TDIARID').Value   :=cdsDetCxPx.FieldByName('TDIARID').AsString;
          cdsMovCNT.FieldByName('CNTANOMM').Value  :=cdsDetCxPx.FieldByName('DCPANOMM').AsString;
          cdsMovCNT.FieldByName('CNTCOMPROB').Value:=cdsDetCxPx.FieldByName('CPNOREG').AsString;
          cdsMovCNT.FieldByName('CUENTAID').Value  :='1918090000000000';

          cdsMovCNT.FieldByName('CNTMODDOC').Value :=cdsDetCxPx.FieldByName('MODULO').AsString;
          cdsMovCNT.FieldByName('CNTGLOSA').Value  :='CAMBIOS';
          cdsMovCNT.FieldByName('CNTDH').Value     :='D';

          cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=cdsDetCxPx.FieldByName('CPTCAMPR').AsString;

          cdsMovCNT.FieldByName('CNTMTOORI').Value :=XTOTMG*(-1);
          cdsMovCNT.FieldByName('CNTMTOLOC').Value :=FRound(XTOTMG*(-1)*cdsMovCNT.FieldByName('CNTTCAMBIO').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOEXT').Value :=XTOTMG*(-1);

          cdsMovCNT.FieldByName('CNTFEMIS').Value  :=cdsDetCxPx.FieldByName('CPFEMIS').AsString;
          cdsMovCNT.FieldByName('CNTFVCMTO').Value :=cdsDetCxPx.FieldByName('CPFVCMTO').AsString;
          cdsMovCNT.FieldByName('CNTFCOMP').Value  :=cdsDetCxPx.FieldByName('DCPFCOM').AsString;
          cdsMovCNT.FieldByName('CNTESTADO').Value :=cdsDetCxPx.FieldByName('DCPESTDO').AsString;
          cdsMovCNT.FieldByName('CNTUSER').Value   :=DMCXP.wUsuario;
          cdsMovCNT.FieldByName('CNTFREG').Value   :=cdsDetCxPx.FieldByName('FECHA').AsDateTime;
          cdsMovCNT.FieldByName('CNTHREG').Value   :=cdsDetCxPx.FieldByName('HORA').AsDateTime;
          cdsMovCNT.FieldByName('CNTMM').Value     :=cdsDetCxPx.FieldByName('DCPMM').AsString;
          cdsMovCNT.FieldByName('CNTDD').Value     :=cdsDetCxPx.FieldByName('DCPDD').AsString;
          cdsMovCNT.FieldByName('CNTTRI').Value    :=cdsDetCxPx.FieldByName('DCPTRI').AsString;
          cdsMovCNT.FieldByName('CNTSEM').Value    :=cdsDetCxPx.FieldByName('DCPSEM').AsString;
          cdsMovCNT.FieldByName('CNTANO').Value    :=cdsDetCxPx.FieldByName('DCPANOC').AsString;
          cdsMovCNT.FieldByName('CNTSS').Value     :=cdsDetCxPx.FieldByName('DCPSS').AsString;
          cdsMovCNT.FieldByName('CNTAATRI').Value  :=cdsDetCxPx.FieldByName('DCPAATRI').AsString;
          cdsMovCNT.FieldByName('CNTAASEM').Value  :=cdsDetCxPx.FieldByName('DCPAASEM').AsString;
          cdsMovCNT.FieldByName('CNTAASS').Value   :=cdsDetCxPx.FieldByName('DCPAASS').AsString;
          cdsMovCNT.FieldByName('TMONID').Value    :=cdsDetCxPx.FieldByName('TMONID').AsString;
          cdsMovCNT.FieldByName('CNTCUADRE').Value :=cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
          cdsMovCNT.FieldByName('CTADES').Value    :=cdsDetCxPx.FieldByName('CTAABR').AsString;
          cdsMovCNT.FieldByName('TDIARDES').Value  :=cdsDetCxPx.FieldByName('TDIARABR').AsString;
          cdsMovCNT.FieldByName('CNTLOTE').Value   :=cdsDetCxPx.FieldByName('DCPLOTE').AsString;

          cdsMovCNT.FieldByName('CNTDEBEMN').Value :=FRound(cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTDEBEME').Value :=0;
          cdsMovCNT.FieldByName('CNTHABEMN').Value :=0;
          cdsMovCNT.FieldByName('CNTHABEME').Value :=0;

          xContR:=xContR+1;
          cdsMovCNT.FieldByName('CNTREG').Value    :=xContR;
          cdsMovCNT.FieldByName('MODULO').AsString    :=DMCXP.wModulo;
          cdsPost( DMCXP.cdsMovCNT );

       end;

       if XTOTTO>0 then begin

          cdsMovCNT.Insert;
          cdsMovCNT.FieldByName('CIAID').Value     :=cdsDetCxPx.FieldByName('CIAID').AsString;
          cdsMovCNT.FieldByName('TDIARID').Value   :=cdsDetCxPx.FieldByName('TDIARID').AsString;
          cdsMovCNT.FieldByName('CNTANOMM').Value  :=cdsDetCxPx.FieldByName('DCPANOMM').AsString;
          cdsMovCNT.FieldByName('CNTCOMPROB').Value:=cdsDetCxPx.FieldByName('CPNOREG').AsString;
          cdsMovCNT.FieldByName('CUENTAID').Value  :='2928090000000000';

          cdsMovCNT.FieldByName('CNTMODDOC').Value :=cdsDetCxPx.FieldByName('MODULO').AsString;
          cdsMovCNT.FieldByName('CNTGLOSA').Value  :='CONVERSIONES';
          cdsMovCNT.FieldByName('CNTDH').Value     :='H';

          cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=xxTCambio;

          cdsMovCNT.FieldByName('CNTMTOORI').Value :=XTOTTO;
          cdsMovCNT.FieldByName('CNTMTOLOC').Value :=FRound(XTOTTO*cdsMovCNT.FieldByName('CNTTCAMBIO').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOEXT').Value :=XTOTTO;

          cdsMovCNT.FieldByName('CNTFEMIS').Value  :=cdsDetCxPx.FieldByName('CPFEMIS').AsString;
          cdsMovCNT.FieldByName('CNTFVCMTO').Value :=cdsDetCxPx.FieldByName('CPFVCMTO').AsString;
          cdsMovCNT.FieldByName('CNTFCOMP').Value  :=cdsDetCxPx.FieldByName('DCPFCOM').AsString;
          cdsMovCNT.FieldByName('CNTESTADO').Value :=cdsDetCxPx.FieldByName('DCPESTDO').AsString;
          cdsMovCNT.FieldByName('CNTUSER').Value   :=DMCXP.wUsuario;
          cdsMovCNT.FieldByName('CNTFREG').Value   :=cdsDetCxPx.FieldByName('FECHA').AsDateTime;
          cdsMovCNT.FieldByName('CNTHREG').Value   :=cdsDetCxPx.FieldByName('HORA').AsDateTime;
          cdsMovCNT.FieldByName('CNTMM').Value     :=cdsDetCxPx.FieldByName('DCPMM').AsString;
          cdsMovCNT.FieldByName('CNTDD').Value     :=cdsDetCxPx.FieldByName('DCPDD').AsString;
          cdsMovCNT.FieldByName('CNTTRI').Value    :=cdsDetCxPx.FieldByName('DCPTRI').AsString;
          cdsMovCNT.FieldByName('CNTSEM').Value    :=cdsDetCxPx.FieldByName('DCPSEM').AsString;
          cdsMovCNT.FieldByName('CNTANO').Value    :=cdsDetCxPx.FieldByName('DCPANOC').AsString;
          cdsMovCNT.FieldByName('CNTSS').Value     :=cdsDetCxPx.FieldByName('DCPSS').AsString;
          cdsMovCNT.FieldByName('CNTAATRI').Value  :=cdsDetCxPx.FieldByName('DCPAATRI').AsString;
          cdsMovCNT.FieldByName('CNTAASEM').Value  :=cdsDetCxPx.FieldByName('DCPAASEM').AsString;
          cdsMovCNT.FieldByName('CNTAASS').Value   :=cdsDetCxPx.FieldByName('DCPAASS').AsString;
          cdsMovCNT.FieldByName('TMONID').Value    :=cdsDetCxPx.FieldByName('TMONID').AsString;
          cdsMovCNT.FieldByName('CNTCUADRE').Value :=cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
          cdsMovCNT.FieldByName('CTADES').Value    :=cdsDetCxPx.FieldByName('CTAABR').AsString;
          cdsMovCNT.FieldByName('TDIARDES').Value  :=cdsDetCxPx.FieldByName('TDIARABR').AsString;
          cdsMovCNT.FieldByName('CNTLOTE').Value   :=cdsDetCxPx.FieldByName('DCPLOTE').AsString;

          cdsMovCNT.FieldByName('CNTHABEMN').Value :=0; //cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat;
          cdsMovCNT.FieldByName('CNTHABEME').Value :=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTDEBEMN').Value :=0;
          cdsMovCNT.FieldByName('CNTDEBEME').Value :=0;

          xContR:=xContR+1;
          cdsMovCNT.FieldByName('CNTREG').Value    :=xContR;
          cdsMovCNT.FieldByName('MODULO').AsString    :=DMCXP.wModulo;
          cdsPost( DMCXP.cdsMovCNT );
       end
       else begin

          cdsMovCNT.Insert;
          cdsMovCNT.FieldByName('CIAID').Value     :=cdsDetCxPx.FieldByName('CIAID').AsString;
          cdsMovCNT.FieldByName('TDIARID').Value   :=cdsDetCxPx.FieldByName('TDIARID').AsString;
          cdsMovCNT.FieldByName('CNTANOMM').Value  :=cdsDetCxPx.FieldByName('DCPANOMM').AsString;
          cdsMovCNT.FieldByName('CNTCOMPROB').Value:=cdsDetCxPx.FieldByName('CPNOREG').AsString;
          cdsMovCNT.FieldByName('CUENTAID').Value  :='2928090000000000';

          cdsMovCNT.FieldByName('CNTMODDOC').Value :=cdsDetCxPx.FieldByName('MODULO').AsString;
          cdsMovCNT.FieldByName('CNTGLOSA').Value  :='CONVERSIONES';
          cdsMovCNT.FieldByName('CNTDH').Value     :='D';

          cdsMovCNT.FieldByName('CNTTCAMBIO').Value:=xxTCambio;

          cdsMovCNT.FieldByName('CNTMTOORI').Value :=XTOTTO*(-1);
          cdsMovCNT.FieldByName('CNTMTOLOC').Value :=FRound(XTOTTO*(-1)*cdsMovCNT.FieldByName('CNTTCAMBIO').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTMTOEXT').Value :=XTOTTO*(-1);
          cdsMovCNT.FieldByName('CNTFEMIS').Value  :=cdsDetCxPx.FieldByName('CPFEMIS').AsString;
          cdsMovCNT.FieldByName('CNTFVCMTO').Value :=cdsDetCxPx.FieldByName('CPFVCMTO').AsString;
          cdsMovCNT.FieldByName('CNTFCOMP').Value  :=cdsDetCxPx.FieldByName('DCPFCOM').AsString;
          cdsMovCNT.FieldByName('CNTESTADO').Value :=cdsDetCxPx.FieldByName('DCPESTDO').AsString;
          cdsMovCNT.FieldByName('CNTUSER').Value   :=DMCXP.wUsuario;
          cdsMovCNT.FieldByName('CNTFREG').Value   :=cdsDetCxPx.FieldByName('FECHA').AsDateTime;
          cdsMovCNT.FieldByName('CNTHREG').Value   :=cdsDetCxPx.FieldByName('HORA').AsDateTime;
          cdsMovCNT.FieldByName('CNTMM').Value     :=cdsDetCxPx.FieldByName('DCPMM').AsString;
          cdsMovCNT.FieldByName('CNTDD').Value     :=cdsDetCxPx.FieldByName('DCPDD').AsString;
          cdsMovCNT.FieldByName('CNTTRI').Value    :=cdsDetCxPx.FieldByName('DCPTRI').AsString;
          cdsMovCNT.FieldByName('CNTSEM').Value    :=cdsDetCxPx.FieldByName('DCPSEM').AsString;
          cdsMovCNT.FieldByName('CNTANO').Value    :=cdsDetCxPx.FieldByName('DCPANOC').AsString;
          cdsMovCNT.FieldByName('CNTSS').Value     :=cdsDetCxPx.FieldByName('DCPSS').AsString;
          cdsMovCNT.FieldByName('CNTAATRI').Value  :=cdsDetCxPx.FieldByName('DCPAATRI').AsString;
          cdsMovCNT.FieldByName('CNTAASEM').Value  :=cdsDetCxPx.FieldByName('DCPAASEM').AsString;
          cdsMovCNT.FieldByName('CNTAASS').Value   :=cdsDetCxPx.FieldByName('DCPAASS').AsString;
          cdsMovCNT.FieldByName('TMONID').Value    :=cdsDetCxPx.FieldByName('TMONID').AsString;
          cdsMovCNT.FieldByName('CNTCUADRE').Value :=cdsDetCxPx.FieldByName('CNTCUADRE').AsString;
          cdsMovCNT.FieldByName('CTADES').Value    :=cdsDetCxPx.FieldByName('CTAABR').AsString;
          cdsMovCNT.FieldByName('TDIARDES').Value  :=cdsDetCxPx.FieldByName('TDIARABR').AsString;
          cdsMovCNT.FieldByName('CNTLOTE').Value   :=cdsDetCxPx.FieldByName('DCPLOTE').AsString;

          cdsMovCNT.FieldByName('CNTDEBEMN').Value:=0; //cdsMovCNT.FieldByName('CNTMTOLOC').AsFloat;
          cdsMovCNT.FieldByName('CNTDEBEME').Value:=FRound(cdsMovCNT.FieldByName('CNTMTOEXT').AsFloat,15,2);
          cdsMovCNT.FieldByName('CNTHABEMN').Value :=0;
          cdsMovCNT.FieldByName('CNTHABEME').Value :=0;

          xContR:=xContR+1;
          cdsMovCNT.FieldByName('CNTREG').Value    :=xContR;
          cdsMovCNT.FieldByName('MODULO').AsString :=DMCXP.wModulo;
          cdsPost( DMCXP.cdsMovCNT );
       end

    end;

    AplicaDatos( cdsMovCNT, 'MOVCNT' );

end;



procedure TDMCXP.GeneraCorrelativoCtasAutom( xCia, xTDiario, xAnoMM : String) ;
var
   xSQL : String;
   nNum : Integer;
begin

   xSQL:='Select CIAID, TDIARID, CNTANOMM, CNTCOMPROB, MIN(NVL(CNTREG,0)), '
        +  'MAX(NVL(CNTREG,0)) NREG, COUNT(*) '
        +  'From CNT301 '
        +'WHERE CIAID='   +''''+xCia    +''''+' AND '
        +      'TDIARID=' +''''+xTDiario+''''+' AND '
        +      'CNTANOMM='+''''+xAnoMM  +''' '
        +'GROUP BY CIAID, TDIARID, CNTANOMM, CNTCOMPROB '
        +'HAVING MIN(NVL(CNTREG,0))=0 '
        +'Order by CNTCOMPROB ';

   cdsQry.Close;
   cdsQry.DataRequest( xSQL );
   cdsQry.Open;

   cdsQry.First;
   while not cdsQry.Eof do begin

      xSQL:='Select CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CUENTAID, CNTDH, '
           +   'CNTMTOORI, CNTREG '
           +'From CNT301 '
           +'WHERE CIAID='''     +xCia      +''''+' AND '
           +      'TDIARID='''   +xTDiario  +''''+' AND '
           +      'CNTANOMM='''  +xAnoMM    +''''+' AND '
           +      'CNTCOMPROB='''+DMCXP.cdsQry.FieldByName('CNTCOMPROB').AsString+'''';

      cdsMovCNT.Close;
      cdsMovCNT.IndexFieldNames:='';
      cdsMovCNT.DataRequest( xSQL );
      cdsMovCNT.Open;

      cdsMovCNT.First;
      while not cdsMovCNT.EOF do begin
         if cdsMovCNT.FieldByName('CNTREG').AsInteger=0 then begin
            cdsMovCNT.Edit;
            cdsMovCNT.FieldByName('CNTREG').AsInteger:=9999;
         end;
         cdsMovCNT.Next;
      end;

      cdsMovCNT.IndexFieldNames:='CNTCOMPROB;CNTREG;CNTMTOORI;CNTDH';

      nNum:=DMCXP.cdsQry.FieldByName('NREG').AsInteger;

      cdsMovCNT.First;
      while not DMCXP.cdsMovCNT.EOF do begin
         if cdsMovCNT.FieldByName('CNTREG').AsInteger=9999 then begin
            nNum:=nNum+1;
            cdsMovCNT.Edit;
            cdsMovCNT.FieldByName('CNTREG').AsInteger:=nNum;
            cdsPost( DMCXP.cdsMovCNT );
         end;
         cdsMovCNT.Next;
      end;
      AplicaDatos( cdsMovCNT, 'MOVCNT' );

      cdsQry.Next;
   end;

   cdsMovCNT.IndexFieldNames:='';
end;



////////////////////////////////////////
//       Fin de Contabilización       //
////////////////////////////////////////

procedure TDMCXP.GrabaAuxConta( wCDST:TClientDataSet );
var
  xSQL2 : String;
begin
	xSQL2 := 'Select * from CNT201 '
         + 'Where AUXID='  +''''+wCDST.FieldByName( 'Prov' ).Value +''''+' and '
         + 'CLAUXID='+''''+wCDST.FieldByName( 'ClAuxId' ).Value +'''';
  cdsQry.Active:=False;
  cdsQry.ProviderName:= 'dspTGE';
  cdsQry.DataRequest(xSQL2); // Llamada remota al provider del servidor
  cdsQry.Active:=True;

  if cdsQry.RecordCount>0 then
  begin
  	xSQL2:='Update CNT201 '
          +  'Set AUXID='''     +wCDST.FieldByName('PROV'    ).AsString  +''', '
          +      'AUXNOMB='''   +wCDST.FieldByName('PROVDES' ).AsString  +''', '
          +      'AUXRUC='''    +wCDST.FieldByName('PROVRUC' ).AsString  +''', '
          +      'AUXDNI='''    +wCDST.FieldByName('PROVDNI' ).AsString  +''', '
          +      'CLAUXID='''   +wCDST.FieldByName('CLAUXID' ).AsString  +''', '
          +      'AUXABR='''    +wCDST.FieldByName('PROVABR' ).AsString  +''', '
          +      'PAISID='''    +wCDST.FieldByName('PAISID'  ).AsString  +''', '
          +      'AUXDIR='''    +wCDST.FieldByName('PROVDIR' ).AsString  +''', '
          +      'AUXCZIP='''   +wCDST.FieldByName('PROVCZIP').AsString  +''', '
          +      'AUXTELF='''   +wCDST.FieldByName('PROVTELF').AsString  +''', '
          +      'AUXFAX='''    +wCDST.FieldByName('PROVFAX' ).AsString  +''', '
          +      'AUXEMAIL='''  +wCDST.FieldByName('PROVEMAI').AsString  +''', '
          +      'ACTIVO='''    +wCDST.FieldByName('ACTIVO').AsString    +''', '
          +      'PROVRETIGV='''+wCDST.FieldByName('PROVRETIGV').AsString+''', '
          +      'AUXGIRA='''   +wCDST.FieldByName('PROVGIRA').AsString+''' '
          +'Where AUXID='''  +wCDST.FieldByName('PROV').AsString   +''' '
          +  'AND CLAUXID='''+wCDST.FieldByName('CLAUXID').AsString+'''';
  end
  else
  begin
  	xSQL2:='INSERT INTO CNT201(AUXID, AUXNOMB, AUXABR, AUXRUC, AUXDNI, PAISID, AUXDIR, '
          +    'AUXCZIP, AUXTELF, AUXFAX, AUXEMAIL, CLAUXID, PROVRETIGV, AUXGIRA, ACTIVO ) '
          + 'VALUES('
          +    ''''+wCDSt.FieldByName( 'PROV'     ).AsString+''''+', '
          +    ''''+wCDSt.FieldByName( 'PROVDES'  ).AsString+''''+', '
          +    ''''+wCDSt.FieldByName( 'PROVABR'  ).AsString+''''+', '
          +    ''''+wCDSt.FieldByName( 'PROVRUC'  ).AsString+''''+', '
          +    ''''+wCDSt.FieldByName( 'PROVDNI'  ).AsString+''''+', '
          +    ''''+wCDSt.FieldByName( 'PAISID'   ).AsString+''''+', '
          +    ''''+wCDSt.FieldByName( 'PROVDIR'  ).AsString+''''+', '
          +    ''''+wCDSt.FieldByName( 'PROVCZIP' ).AsString+''''+', '
          +    ''''+wCDSt.FieldByName( 'PROVTELF' ).AsString+''''+', '
          +    ''''+wCDSt.FieldByName( 'PROVFAX'  ).AsString+''''+', '
          +    ''''+wCDSt.FieldByName( 'PROVEMAI' ).AsString+''''+', '
          +    ''''+wCDSt.FieldByName( 'CLAUXID'  ).AsString+''''+', '
          +    ''''+wCDSt.FieldByName('PROVRETIGV').AsString+''''+', '
          +    ''''+wCDSt.FieldByName('PROVGIRA').AsString  +''''+', '
          +    ''''+wCDSt.FieldByName('ACTIVO').AsString    +''''+' )';
	end;
  cdsQry.Active:=False;
  cdsQry.Active:=True;
  // Inicia HPC_201402_CXP
  DCOM1.AppServer.EjecutaSQL(xSQL2);
  // Finaliza HPC_201402_CXP
end;

function TDMCXP.RecuperarDatos(xTabla , xCampos , xWhere : String) : Boolean ;
var
   xAux ,
   xSQL : String ;
begin
   xAux := '' ;
   if trim(xWhere) <> '' then
      xAux := ' WHERE ' +xWhere ;
   xSQL := 'SELECT ' + xCampos + ' FROM ' + xTabla + xAux ;
   xSQL := UpperCase( xSQL ) ;
   cdsULTTGE.Close;
   cdsULTTGE.ProviderName:='dspUltTGE';
   cdsULTTGE.DataRequest(xSQL);    //este es la llamada remota al provider del servidor
   cdsULTTGE.Open;
   result := ( cdsULTTGE.recordcount <> 0) ;
end;

function TDMCXP.strDia(Fecha: TDateTime): String;
var
   Year, Month, Day: Word ;
begin

     if Fecha = 0 then
         Result := ''
     else
     begin
         DecodeDate(Fecha, Year, Month, Day);
         Result := strzero(inttostr(Day),2) ;
     end ;
end;

procedure RecuperarCiaUnica(ComboLookUp:TwwDBLookupCombo;Edicion:TCustomEdit);
begin
if DMCXP.cdsCia.Active=true then
   if DMCXP.cdsCia.recordcount=1 then
   begin
      DMCXP.cdsCia.first;
      ComboLookUp.Text:=DMCXP.cdsCia.fieldbyname('CIAID').AsString;
      ComboLookUp.Enabled:=FALSE;
      Edicion.text:=DMCXP.cdsCia.fieldbyname('CIAABR').AsString;
   end
   else
   begin
      ComboLookUp.Enabled:=true;
      ComboLookUp.text:='';
      Edicion.text:='';
      try
        ComboLookUp.SetFocus
      except
      end ;
   end;
end;
function FechaDB2(Fecha : TDateTime) : String ;
begin
    Result := formatdatetime( DMCXP.wFormatFecha , Fecha ) ;
end ;

//** 18/12/2000 - pjsv
procedure TDMCXP.AbreCierraCDS(xxCds : Array of TwwClientDataSet; xxNom : Array of String; xBool : Boolean);
var
 iX : integer;
begin
  For ix := 0 To High(xxCds) do
   begin
     xxCds[iX].Close;
     xxCds[iX].DataRequest('Select * from '+xxNom[iX]);
     xxCds[iX].Active := xBool;
   end;
end;
//**

function TDMCXP.GetWhereFromSQL(xSQL: String): String;
var
   xIndice   : Integer ;
   Tmp       : string  ;
begin

   xSQL      := AnsiUpperCase( xSQL )  ;
   xIndice   := Pos ( 'WHERE' , xSQL ) ;
   if xIndice <> 0 then
   begin
      Tmp := copy(xSQL , xIndice + 6 ,length(xSQL))  ;
      xIndice   := Pos ( 'ORDER BY' , tmp ) ;
      if xIndice <> 0 then
         Result := '(' + copy(Tmp , 1 , xIndice - 1 ) + ')'
      else
         Result := '(' + Tmp + ')' ;
   end
   else
      Result := ''  ;

end  ;

function TDMCXP.MaxProv(const sCIA: String): String;
begin
  result := MaxSQL('TGE201','PROV','');
end;

function TDMCXP.MaxSQL(const sTabla, sMxCampo, sCondicion: String): String;
var
	xnum : integer;
  sSQL, sWhere: String;
begin
	sWhere:='WHERE '+SMXCAMPO+' not like (''%A%'') and '+SMXCAMPO+' not like (''%B%'') and '+SMXCAMPO+' not like (''%C%'') '+
            'and '+SMXCAMPO+' not like (''%D%'') and '+SMXCAMPO+' not like (''%E%'') and '+SMXCAMPO+' not like (''%F%'') '+
            'and '+SMXCAMPO+' not like (''%G%'') and '+SMXCAMPO+' not like (''%H%'') and '+SMXCAMPO+' not like (''%I%'') '+
            'and '+SMXCAMPO+' not like (''%J%'') and '+SMXCAMPO+' not like (''%K%'') and '+SMXCAMPO+' not like (''%L%'') '+
            'and '+SMXCAMPO+' not like (''%M%'') and '+SMXCAMPO+' not like (''%N%'') and '+SMXCAMPO+' not like (''%O%'') '+
            'and '+SMXCAMPO+' not like (''%P%'') and '+SMXCAMPO+' not like (''%Q%'') and '+SMXCAMPO+' not like (''%R%'') '+
            'and '+SMXCAMPO+' not like (''%S%'') and '+SMXCAMPO+' not like (''%T%'') and '+SMXCAMPO+' not like (''%U%'') '+
            'and '+SMXCAMPO+' not like (''%V%'') and '+SMXCAMPO+' not like (''%W%'') and '+SMXCAMPO+' not like (''%X%'') '+
            'and '+SMXCAMPO+' not like (''%Y%'') and '+SMXCAMPO+' not like (''%Z%'') ';
  if Length(Trim(sCondicion))>0 then
  sWhere:=sWhere+' and '+sCondicion;
  cdsSql.Close;
  {if (SRV_D = 'DB2NT') or
		 (SRV_D = 'DB2400') then
  begin
  	sSQL:='SELECT MAX(INTEGER('+SMXCAMPO+')) AS X FROM '+sTabla+' '+ sWhere+sCondicion;
  end
  else
	if SRV_D = 'ORACLE' then
  begin
  	sSQL:='SELECT MAX(TO_NUMBER('+SMXCAMPO+')) AS X FROM '+sTabla+' '+ sCondicion;
	end;}
  sSQL:='SELECT MAX('+SMXCAMPO+') AS X FROM '+sTabla+' '+ sWhere;
  cdssql.DataRequest(sSQL);
  cdsSql.Open;
  if cdsSql.FieldByName('X').IsNull then
    result := '1'
  else
  begin
    xnum := StrToInt(Trim(cdsSql.FieldByName('X').AsString));
    result := IntToStr(xnum+1);
  end;
end;

//** 13/09/2001 - pjsv
function TDMCXP.MesCerrado(xMes, xAno, xCiaid: String): Boolean;
var
 xSql : String;
begin
  xSql := 'SELECT PER'+strzero(xMes,2)+' FROM TGE154 WHERE CIAID='+quotedstr(xCiaid)+
          ' AND ANO='+quotedstr(xAno);
  cdsCxP.Close;
  cdsCxP.DataRequest(xSql);
  cdsCxP.Open;
  If cdsCxP.FieldByName('PER'+strzero(xMes,2)).AsString = 'S' then
   result := True
  else result := False;
end;
//**


procedure TDMCXP.GeneraEnLinea401P( xxxCia,xxxDiario,xxxAnoMM: String );
var
   xZ,xNumNiv : Integer;
   xCuenta,xMesA,xNivel,xSql,xSql1,xSql2,xSql3,xSql4,xSql5,xSql6,xSql7,xSql8 : String;
   xNiv : Array[1..10] of integer;
begin
   xAno := Copy(xxxAnoMM,1,4);
   xMes := Copy(xxxAnoMM,5,2);
   xxCia := xxxCia; // para pasarlo a GrabaSaldos
    xsql := 'Insert into CNT401 '+
             ' (CIAID, CUENTAID, CTADES, TIPO,CTA_MOV,ANO,'+
             'DEBEMN00,DEBEMN01,DEBEMN02,DEBEMN03,DEBEMN04,DEBEMN05,DEBEMN06,'+
             'DEBEMN07,DEBEMN08,DEBEMN09,DEBEMN10,DEBEMN11,DEBEMN12,DEBEMN13,'+
             'DEBEME00,DEBEME01,DEBEME02,DEBEME03,DEBEME04,DEBEME05,DEBEME06,'+
             'DEBEME07,DEBEME08,DEBEME09,DEBEME10,DEBEME11,DEBEME12,DEBEME13,'+
             'HABEMN00,HABEMN01,HABEMN02,HABEMN03,HABEMN04,HABEMN05,HABEMN06,'+
             'HABEMN07,HABEMN08,HABEMN09,HABEMN10,HABEMN11,HABEMN12,HABEMN13,'+
             'HABEME00,HABEME01,HABEME02,HABEME03,HABEME04,HABEME05,HABEME06,'+
             'HABEME07,HABEME08,HABEME09,HABEME10,HABEME11,HABEME12,HABEME13,'+
             'SALDMN00,SALDMN01,SALDMN02,SALDMN03,SALDMN04,SALDMN05,SALDMN06,'+
             'SALDMN07,SALDMN08,SALDMN09,SALDMN10,SALDMN11,SALDMN12,SALDMN13,'+
             'SALDME00,SALDME01,SALDME02,SALDME03,SALDME04,SALDME05,SALDME06,'+
             'SALDME07,SALDME08,SALDME09,SALDME10,SALDME11,SALDME12,SALDME13)'+
             ' select TGE202.CIAID,TGE202.CUENTAID,TGE202.CTADES,TGE202.CTANIV,TGE202.CTA_MOV,'+
             quotedstr(xAno)+','+
             ' 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'+
             ' 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'+
             ' 0,0,0,0,0,0,0,0,0,0,0,0,0,0'+
             ' FROM TGE202'+
             ' LEFT JOIN CNT401 ON (trim(TGE202.CUENTAID) = trim(CNT401.CUENTAID) AND TGE202.CIAID=CNT401.CIAID)'+
             ' WHERE CNT401.CUENTAID IS NULL AND TGE202.CIAID='+quotedstr(xxxCia);
  DMCXP.DCOM1.AppServer.IniciaTransaccion;
  try
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   // Inicia HPC_201402_CXP

   {DMCXP.DCOM1.AppServer.GrabaTransaccion;
  except
   DMCXP.DCOM1.AppServer.RetornaTransaccion;
  end;}

   //**07/09/2001 - pjsv, actualizo todos los auxiliares y clase de auxiliares a null
   //** siempre y cuando esten en '', para que no me generen registro indebidos
   xSql1 := 'UPDATE CNT301 SET AUXID=NULL,CLAUXID=NULL WHERE AUXID=''''';
//   DMCXP.DCOM1.AppServer.IniciaTransaccion;
//   try
    DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL1);
//    DMCXP.DCOM1.AppServer.GrabaTransaccion;
//   except
//   DMCXP.DCOM1.AppServer.RetornaTransaccion;
//   end;
   //**actualizo todos los C. de Costo a null
   //** siempre y cuando esten en '', para que no me generen registro indebidos
   xSql2 := 'UPDATE CNT301 SET CCOSID=NULL WHERE CCOSID=''''';
//   DMCXP.DCOM1.AppServer.IniciaTransaccion;
//   try
    DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL2);
//    DMCXP.DCOM1.AppServer.GrabaTransaccion;
//   except
//   DMCXP.DCOM1.AppServer.RetornaTransaccion;
//   end;
   //**


//////////////////////// para Auxiliares /////////////////////////////
   //**07/09/2001 - pjsv, actualizo todos los auxiliares y clase de auxiliares a null
   //** siempre y cuando esten en '', para que no me generen registro indebidos
   xSql3 := 'UPDATE CNT401 SET AUXID=NULL,CLAUXID=NULL WHERE AUXID=''''';
//   DMCXP.DCOM1.AppServer.IniciaTransaccion;
//   try
    DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL3);
//    DMCXP.DCOM1.AppServer.GrabaTransaccion;
//   except
//   DMCXP.DCOM1.AppServer.RetornaTransaccion;
//   end;
   //**

    xSql4 := ' insert into cnt401'+
            '(ciaid,cuentaid,auxid,clauxid,ano,ctades,tipo,cta_mov,auxdes,'+
            'DEBEMN'+ xMes+','+'DEBEME'+ xMes +','+
            'HABEMN'+ xMes +','+'HABEME'+ xMes +')'+
            ' select '+quotedstr(xxxCia)+', a.cuentaid,a.auxid,a.clauxid,'+
            quotedstr(xAno)+',max(a.ctades) ctades, max(c.ctaniv) ctaniv,'+
            ' max(c.cta_mov) cta_mov, max(a.auxdes) auxdes,'+
            'sum('+wReplacCeros+'(a.CNTDEBEMN'+',0)) DEBEMN'+ xMes+','+
            'sum('+wReplacCeros+'(a.CNTDEBEME'+',0)) DEBEME'+ xMes+','+
            'sum('+wReplacCeros+'(a.CNTHABEMN'+',0)) HABEMN'+ xMes+','+
            'sum('+wReplacCeros+'(a.CNTHABEME'+',0)) HABEME'+ xMes ;
    xSql4 := xSql4 + ' from cnt301 a'+
                   ' left join tge202 c on (a.CUENTAID = c.CUENTAID and a.CIAID=c.CIAID AND C.CTA_AUX=''S'')'+
                   ' where  a.auxid is not null  and a.CNTANOMM='+quotedstr(xxxAnoMM)+
                   ' AND a.CIAID='+quotedstr(xxxCia)+

                   ' AND NOT EXISTS(SELECT * FROM CNT401 B WHERE B.CLAUXID=A.CLAUXID AND '+
                   ' B.AUXID=A.AUXID AND B.CLAUXID IS NOT NULL AND B.AUXID IS NOT NULL AND'+
                   ' B.CCOSID IS NULL)'+
                   ' group by a.cuentaid,a.clauxid,a.auxid';
{                   ' left join cnt401 b on (a.CUENTAID = b.CUENTAID AND  b.auxid <> a.auxid and'+
                   ' a.clauxid <> b.clauxid and '+wReplacCeros+'(b.auxid,''-'')<>''-'' AND '+wReplacCeros+'(b.CCOSID,''-'')=''-'')'+
                   ' where  a.auxid is not null  and a.CNTANOMM='+quotedstr(xxxAnoMM)+
                   ' AND a.CIAID='+quotedstr(dblcCia.text)+}


//  DMCXP.DCOM1.AppServer.IniciaTransaccion;
//  try
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL4);
//   DMCXP.DCOM1.AppServer.GrabaTransaccion;
//  except
//  DMCXP.DCOM1.AppServer.RetornaTransaccion;
//  end;

  xMesA := StrZero(IntToStr(StrToInt(xmes) -1),2);
  xSql5 := 'UPDATE CNT401 SET '+
          'SALDMN'+ xMes +'= ('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
          wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),'+
          'SALDME'+ xMes +'= ('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0),';


 for xZ:=StrToInt( xMes )+1 to 13 do
  begin
   xMesT := StrZero( IntToStr(xZ),2);
   xSQL5:= xSQL5 + 'SALDMN'+ xMesT +'=('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
         wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),';
  end;
 for xZ:=StrToInt( xMes )+1 to 13 do
  begin
    xMesT := StrZero( IntToStr(xZ),2);
    If xZ <> 13 then
     xSQL5:= xSQL5 + 'SALDME'+ xMesT +'=('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0),'
    else
     xSQL5:= xSQL5 + 'SALDME'+ xMesT +'=('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0)';
  end;
  xSQL5:= xSQL5 + ' where ANO='+quotedstr(xAno)+
                ' AND CIAID='+quotedstr(xxxCia);

//  DMCXP.DCOM1.AppServer.IniciaTransaccion;
//  try
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL5);
//   DMCXP.DCOM1.AppServer.GrabaTransaccion;
//  except
//   DMCXP.DCOM1.AppServer.RetornaTransaccion;
//  end;

///////////////////// para C. Costos ///////////////////////////////////
   //**07/09/2001 - pjsv, actualizo todos los C. de Costo a null
   //** siempre y cuando esten en '', para que no me generen registro indebidos
   xSql6 := 'UPDATE CNT401 SET CCOSID=NULL WHERE CCOSID=''''';
//   DMCXP.DCOM1.AppServer.IniciaTransaccion;
//   try
    DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL6);
//    DMCXP.DCOM1.AppServer.GrabaTransaccion;
//   except
//   DMCXP.DCOM1.AppServer.RetornaTransaccion;
//   end;
   //**

 xSql7 := ' insert into cnt401'+
         '(ciaid,cuentaid,auxid,clauxid,ano,ctades,tipo,cta_mov,auxdes,ccosid,ccodes,'+
         'DEBEMN'+ xMes+','+'DEBEME'+ xMes +','+
         'HABEMN'+ xMes +','+'HABEME'+ xMes +')'+
         ' select '+quotedstr(xxxCia)+', a.cuentaid,max(a.auxid) auxid,max(a.clauxid) clauxid,'+
         quotedstr(xAno)+', max(a.ctades) ctades, max(c.ctaniv) ctaniv,'+
         ' max(c.cta_mov) cta_mov, max(a.auxdes) auxdes, a.ccosid,max(a.ccosdes) ccosdes,'+
         'sum('+wReplacCeros+'(a.CNTDEBEMN'+',0)) DEBEMN'+ xMes+','+
         'sum('+wReplacCeros+'(a.CNTDEBEME'+',0)) DEBEME'+ xMes+','+
         'sum('+wReplacCeros+'(a.CNTHABEMN'+',0)) HABEMN'+ xMes+','+
         'sum('+wReplacCeros+'(a.CNTHABEME'+',0)) HABEME'+ xMes ;
     xSql7 := xSql7 +  ' from cnt301 a'+
                     ' left join tge202 c on (a.CUENTAID = c.CUENTAID and a.CIAID=c.CIAID AND c.CTA_CCOS=''S'')'+
{                     ' left join cnt401 b on (a.CUENTAID = b.CUENTAID AND a.ccosid <> b.ccosid and '+wReplacCeros+'(b.ccosid,''-'')<>''-'' AND '+
                      wReplacCeros+'(b.AUXID,''-'')=''-'')'+}
                     ' where a.ccosid is not null and a.auxid is null and a.CNTANOMM='+quotedstr(xxxAnoMM)+
                     ' AND a.CIAID='+quotedstr(xxxCia)+
                     ' AND NOT EXISTS(SELECT * FROM CNT401 B WHERE B.CCOSID=A.CCOSID '+
                     ' AND B.CLAUXID IS NULL AND B.AUXID IS NULL AND'+
                     ' B.CCOSID IS NOT NULL)'+
                     ' group by a.cuentaid,a.ccosid';
 //DMCXP.DCOM1.AppServer.IniciaTransaccion;
 //try
  DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL7);
 // DMCXP.DCOM1.AppServer.GrabaTransaccion;
 //except
 // DMCXP.DCOM1.AppServer.RetornaTransaccion;
 //end;

  xMesA := StrZero( IntToStr(StrToInt(xmes) -1),2);
  xSql8 := 'UPDATE CNT401 SET '+
          'SALDMN'+ xMes +'= ('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
          wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),'+
          'SALDME'+ xMes +'= ('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0),';


  for xZ:=StrToInt( xMes )+1 to 13 do
   begin
    xMesT := StrZero( IntToStr(xZ),2);
    xSQL8:= xSQL8 + 'SALDMN'+ xMesT +'=('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
          wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),';
   end;
 for xZ:=StrToInt( xMes )+1 to 13 do
  begin
    xMesT := StrZero( IntToStr(xZ),2);
    If xZ <> 13 then
     xSQL8:= xSQL8 + 'SALDME'+ xMesT +'=('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0),'
    else
     xSQL8:= xSQL8 + 'SALDME'+ xMesT +'=('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0)';
  end;
  xSQL8:= xSQL8 + ' where ANO='+quotedstr(xAno)+
                ' AND CIAID='+quotedstr(xxxCia);

// DMCXP.DCOM1.AppServer.IniciaTransaccion;
// try
  DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL8);
// Finaliza todos los EjecutarSQL para los xSQL, xSQL1,xSQL2, xSQL3,xSQL4, xSQL5,xSQL6, xSQL7,xSQL8
// Luego se realiza el GrabaTransaccion para ejecutar el commit
  DMCXP.DCOM1.AppServer.GrabaTransaccion;
except
// Si ocurre algun problema se realiza el RetornaTransaccion para no ejecutar ninguna sentencia SQLs mencionados
  DMCXP.DCOM1.AppServer.RetornaTransaccion;
end;
// Finaliza HPC_201402_CXP

  //** genero montos de las cuentas en la CNT401 que no tengan Auxid y CCOSID
    xSql := 'select a.ciaid,a.cuentaid,sum(a.cntdebemn) cntdebemn,sum(a.cntdebeme) cntdebeme,'+
          'sum(a.cnthabemn) cnthabemn, sum(a.cnthabeme) cnthabeme,'+
          '(sum(a.cntdebemn) -  sum(a.cnthabemn)) saldmn'+StrZero(xMes,2)+','+
          '(sum(a.cntdebeme) -  sum(a.cnthabeme)) saldme'+StrZero(xMes,2);
    xSql := xSql + ' from cnt301 a'+
                   ' left join cnt401 b on (b.cuentaid=a.cuentaid and '+
                   wReplacCeros+'(b.auxid,''-'') = ''-'' and '+wReplacCeros+'(b.ccosid,''-'') = ''-'' and '+
                   wreplacCeros+'(b.clauxid,''-'') = ''-'' and b.ano='+quotedstr(xAno)+' AND b.CIAID='+quotedstr(xxxCia)+')'+
                 ' where a.cntanomm='+quotedstr(xxxAnoMM)+' AND a.CIAID='+quotedstr(xxxCia)+
                 ' group by a.ciaid,a.cntano,a.cntanomm,a.cuentaid';
 DMCXP.cdsQry2.Close;
 DMCXP.cdsQry2.ProviderName:= 'dspTGE';
 DMCXP.cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
 DMCXP.cdsQry2.Open;
 DMCXP.cdsQry2.IndexFieldNames:='CIAID;CUENTAID';
 GrabaSaldos;

 //** genero los montos de las cuentas internas
 DMCXP.cdsNivel.Open;
 xNumNiv := DMCXP.cdsNivel.recordcount;
 DMCXP.cdsNivel.IndexFieldNames := 'NIVEL';
 DMCXP.cdsNivel.Last;
 xNivel := DMCXP.cdsNivel.FieldByName('NIVEL').AsString;

 For xZ := 1 to xNumNiv do
    If (StrToInt(xNivel) - xZ) >= 1 then
     xNiv[xZ] := StrToInt(xNivel) - xZ
    else break;

 For xZ := 1 to High(xNiv) do
 begin
   if xNiv[xZ] <> 0 then
   begin

   // determina los digitos del nivel a totalizar
      DMCXP.cdsNivel.SetKey;
      //** 17/07/2001 - pjsv - quitar esta condicional si el nivel no esta precedido de Cero y
      //** dejar solo DMCXP.cdsNivel.fieldbyname('NIVEL').AsString := IntToStr(xNiv[xZ]);
      If xNiv[xZ] <= 9 then
       DMCXP.cdsNivel.fieldbyname('NIVEL').AsString := '0' + IntToStr(xNiv[xZ])
      else  DMCXP.cdsNivel.fieldbyname('NIVEL').AsString := IntToStr(xNiv[xZ]);
      //**

      xCuenta := DMCXP.cdsNivel.fieldbyname('NIVEL').AsString;

      if DMCXP.cdsNivel.GotoKey then
         xDigitos1 := StrToInt(DMCXP.cdsNivel.fieldbyname('DIGITOS').AsString);

      //** 17/07/2001 - pjsv - quitar esta condicional si el nivel no esta precedido de Cero y
      //** dejar solo DMCXP.cdsNivel.fieldbyname('NIVEL').AsString := IntToStr(xNiv[xZ]);
      //** determina los dígitos del nivel a sumar
      If IntToStr(xNiv[xZ]+1 ) <= '9' then
       xNivel := '0' + IntToStr(xNiv[xZ]+1 )
      else xNivel := IntToStr(xNiv[xZ]+1 );
      //**

      DMCXP.cdsNivel.SetKey;
      DMCXP.cdsNivel.fieldbyname('NIVEL').AsString := xNivel; //IntToStr(xNiv[xZ]);
      If DMCXP.cdsNivel.GotoKey then
         xDigitos := StrToInt(DMCXP.cdsNivel.fieldbyname('DIGITOS').AsString);

      // xsigno := DMCXP.cdsNivel.fieldbyname('SIGNO').AsString;
      xSql := 'SELECT TGE202.ciaid, tge202.cuentaid,'+
          ' sum(debemn'+StrZero(xMes,2)+') cntdebemn,'+
          ' sum(debeme'+StrZero(xMes,2)+') cntdebeme,'+
          ' sum(habemn'+StrZero(xMes,2)+') cnthabemn,'+
          ' sum(habeme'+StrZero(xMes,2)+') cnthabeme,'+
          '(sum(debemn'+StrZero(xMes,2)+') -  sum(habemn'+StrZero(xMes,2) +')) saldmn'+StrZero(xMes,2)+','+
          '(sum(debeme'+StrZero(xMes,2)+') -  sum(habeme'+StrZero(xMes,2) +')) saldme'+StrZero(xMes,2);
       xSql := xSql + ' from cnt401 '+
                       ' left join tge202 on (tge202.ctaniv='+quotedstr(xCuenta)+
        ' and tge202.cuentaid= substr(cnt401.cuentaid,1,'+IntToSTr(xDigitos1)+') '+
        ' and tge202.CIAID='+quotedstr(xxxCia)+
        ' ) where '+wReplacCeros+'(cnt401.auxid,''-'') = ''-'' and '+
                 wReplacCeros+'(cnt401.ccosid,''-'') = ''-'' and '+
                 wReplacCeros+'(cnt401.clauxid,''-'') = ''-'' '+
        ' and cnt401.tipo= '+quotedstr(xNivel)+
        '  and CNT401.ANO='+quotedstr(xAno)+
        ' and CNT401.CIAID='+quotedstr(xxxCia)+
        ' GROUP BY TGE202.CIAID,TGE202.CUENTAID'+
        ' ORDER BY tge202.cuentaid';
      DMCXP.cdsQry2.Close;
      DMCXP.cdsQry2.ProviderName:= 'dspTGE';
      DMCXP.cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
      DMCXP.cdsQry2.Open;
      DMCXP.cdsQry2.IndexFieldNames:='CIAID;CUENTAID';
      GrabaSaldos;
    end;
  end;
end;

procedure TDMCXP.GrabaSaldos;
var
 xZ : Integer;
 xMesA,xSql : String;
begin
   xMesA := StrZero(IntToStr(StrToInt(xmes) -1),2);
   DMCXP.cdsRCuenta.Close;
   xSql := 'SELECT * FROM CNT401 WHERE ('+wReplacCeros+'(cnt401.auxid,''-'') = ''-'' OR (CNT401.AUXID = ''''))'+
                            ' and ('+wReplacCeros+'(cnt401.ccosid,''-'') = ''-'' OR (cnt401.ccosid = ''''))and ('+
                            wReplacCeros+'(cnt401.clauxid,''-'') = ''-'' OR (cnt401.clauxid = ''''))'+
                           ' AND cnt401.ANO='+quotedstr(xAno)+
                           ' AND cnt401.CIAID='+quotedstr(xxCia)+' ORDER BY CUENTAID';
   DMCXP.cdsRCuenta.DataRequest(xSql);
   DMCXP.cdsRCuenta.Open;
   DMCXP.cdsRCuenta.IndexFieldNames :='CIAID;CUENTAID';
   DMCXP.cdsQry2.First;
 while not DMCXP.cdsQry2.eof do
  begin
   DMCXP.cdsRCuenta.Setkey;
   DMCXP.cdsRCuenta.FieldByname('CIAID').AsString   :=DMCXP.cdsQry2.FieldByName('CIAID').AsString;
   DMCXP.cdsRCuenta.FieldByname('CUENTAID').AsString:= DMCXP.cdsQry2.FieldByName('CUENTAID').AsString;
   If DMCXP.cdsRCuenta.Gotokey then
    begin
     DMCXP.cdsRCuenta.edit;
     DMCXP.cdsRCuenta.FieldByname('DEBEMN'+StrZero(xMes,2)).AsString := DMCXP.cdsQry2.FieldByName('CNTDEBEMN').AsString;
     DMCXP.cdsRCuenta.FieldByname('DEBEME'+StrZero(xMes,2)).AsString := DMCXP.cdsQry2.FieldByName('CNTDEBEME').AsString;
     DMCXP.cdsRCuenta.FieldByname('HABEMN'+StrZero(xMes,2)).AsString := DMCXP.cdsQry2.FieldByName('CNTHABEMN').AsString;
     DMCXP.cdsRCuenta.FieldByname('HABEME'+StrZero(xMes,2)).AsString := DMCXP.cdsQry2.FieldByName('CNTHABEME').AsString;
     DMCXP.cdsRCuenta.FieldByname('SALDMN'+StrZero(xMes,2)).AsFloat  := DMCXP.cdsRCuenta.FieldByname('SALDMN'+StrZero(xMesA,2)).AsFloat + DMCXP.cdsQry2.FieldByName('SALDMN'+StrZero(xMes,2)).AsFloat;
     DMCXP.cdsRCuenta.FieldByname('SALDME'+StrZero(xMes,2)).AsFloat  := DMCXP.cdsRCuenta.FieldByname('SALDME'+StrZero(xMesA,2)).AsFloat + DMCXP.cdsQry2.FieldByName('SALDME'+StrZero(xMes,2)).AsFloat;
     for xZ:=StrToInt(xMes)+1 to 13 do
      begin
       xMesT := StrZero( IntToStr(xZ),2);
       DMCXP.cdsRCuenta.FieldByname('SALDMN'+xMesT).AsFloat := DMCXP.cdsRCuenta.FieldByname('SALDMN'+StrZero(xMes,2)).AsFloat;
       DMCXP.cdsRCuenta.FieldByname('SALDME'+xMesT).AsFloat := DMCXP.cdsRCuenta.FieldByname('SALDME'+StrZero(xMes,2)).AsFloat;
      end;
    end;
   DMCXP.cdsQry2.next;
  end;
  AplicaDatos(cdsRCuenta,'RCUENTA')
end;


procedure TDMCXP.HalloCXPREG(xxCia, xxDiar, xxPer, xxNreg: string);
var
 xCxPReg : Integer;
begin
   xCxPReg := 0;
      //** hallo el total sin IGV de todos los Montos Grabados
   while (DMCXP.cdsDetCxP.FieldByName('CIAID').AsString= xxCia) and
         (DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString = xxDiar) and
         (DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString= xxPer) and
         (DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString =  xxNreg) do
   begin
      xCxPReg := xCxPReg + 1;
      DMCXP.cdsDetCxP.edit;
      DMCXP.cdsDetCxP.fieldbyname('DCPREG').value:= xCxPReg;
      DMCXP.cdsDetCxP.fieldbyname('DCPHREG').value := Now;
      DMCXP.cdsDetCxP.fieldbyname('DCPFREG').value:= Now;
      cdsPost( DMCXP.cdsDetCxP );
      DMCXP.CdsDetCxP.next;
      If DMCXP.CdsDetCxP.Eof then Break;

   end;

   DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DetCxP' );
end;


procedure TDMCXP.CuadraAsiento;
var
   xTotDebeMN, xTotHaberMN : DOUBLE;
   xTotDebeME, xTotHaberME : DOUBLE;
   xDif : Double;
begin
   xTotDebeMN:=0;  xTotHaberMN:=0;
   xTotDebeME:=0;  xTotHaberME:=0;

   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.First ;
   while not DMCXP.cdsDetCxP.eof do begin
      DMCXP.cdsDetCxP.Edit;
      if DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString='D' then begin
         xTotDebeMN := xTotDebeMN  + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
         xTotDebeME := xTotDebeME  + DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat;
      end
      else begin
         xTotHaberMN:= xTotHaberMN + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
         xTotHaberME:= xTotHaberME + DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat;
      end;
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString:='P';
// Inicio HPC_201803_CXP
// Se cambia formato de la columna
      DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsString:=COPY(DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsString,1,10);
// Fin HPC_201803_CXP
      DMCXP.cdsDetCxP.Next;
   end;

   xDif:=0;

   if DMCXP.cdsDetCxP.FieldByName('TMONID').AsString=DMCXP.wTMonExt then
   begin
      if fround(xTotHaberMN,15,2)<>fround(xTotDebeMN,15,2) then begin
         if fround(xTotHaberMN,15,2)>fround(xTotDebeMN,15,2) then begin
            xDIf:=fround(xTotHaberMN,15,2)-fround(xTotDebeMN,15,2);
            DMCXP.cdsDetCxP.First ;
            while not DMCXP.cdsDetCxP.eof do begin
               if DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString='D' then begin
                  DMCXP.cdsDetCxP.Edit;
                  DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat+xDif;
                  Break;
               end;
               DMCXP.cdsDetCxP.Next;
            end;
         end
         else begin
            xDIf:=fround(xTotDebeMN,15,2)-fround(xTotHaberMN,15,2);
            DMCXP.cdsDetCxP.First ;
            while not DMCXP.cdsDetCxP.eof do begin
               if DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString='H' then begin
                  DMCXP.cdsDetCxP.Edit;
                  DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat:=DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat+xDif;
                  Break;
               end;
               DMCXP.cdsDetCxP.Next;
            end;
         end

      end;
   end
   else begin
      if fround(xTotHaberME,15,2)<>fround(xTotDebeME,15,2) then begin
         if fround(xTotHaberME,15,2)>fround(xTotDebeME,15,2) then begin
            xDIf:=fround(xTotHaberME,15,2)-fround(xTotDebeME,15,2);
            DMCXP.cdsDetCxP.First ;
            while not DMCXP.cdsDetCxP.eof do begin
               if DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString='D' then begin
                  DMCXP.cdsDetCxP.Edit;
                  DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat+xDif;
                  Break;
               end;
               DMCXP.cdsDetCxP.Next;
            end;
         end
         else begin
            xDIf:=fround(xTotDebeME,15,2)-fround(xTotHaberME,15,2);
            DMCXP.cdsDetCxP.First ;
            while not DMCXP.cdsDetCxP.eof do begin
               if DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString='H' then begin
                  DMCXP.cdsDetCxP.Edit;
                  DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat:=DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat+xDif;
                  Break;
               end;
               DMCXP.cdsDetCxP.Next;
            end;
         end
      end;
   end;

   DMCXP.cdsDetCxP.First;
   DMCXP.cdsDetCxP.EnableControls;
end;

procedure TDMCXP.cdsDetCxPReconcileError(DataSet: TClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Action:=HandleReconcileError( DataSet, UpdateKind, E )
end;

procedure TDMCXP.cdsMovCNTReconcileError(DataSet: TClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Action:=HandleReconcileError( DataSet, UpdateKind, E )
end;

procedure TDMCXP.cdsCCanjeReconcileError(DataSet: TClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Action:=HandleReconcileError( DataSet, UpdateKind, E )
end;

procedure TDMCXP.cdsSQLReconcileError(DataSet: TClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Action:=HandleReconcileError( DataSet, UpdateKind, E )
end;

function DateS: TDatetime;
var
	sSQL : string;
begin
	sSQL:=' SELECT '+DMCXP.wRepFecServi+' FECHA  FROM TGE901 ';
	DMCXP.cdsQry.Close;
	DMCXP.cdsQry.DataRequest(sSQL);
	DMCXP.cdsQry.Open;
	Result := DMCXP.cdsQry.fieldbyname('FECHA').AsDateTime;
end;


procedure TDMCXP.cdsdetcanjeReconcileError(DataSet: TClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Action:=HandleReconcileError( DataSet, UpdateKind, E )
end;

procedure TDMCXP.cdsMovCxP2ReconcileError(DataSet: TClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Action:=HandleReconcileError( DataSet, UpdateKind, E )
end;

function TDMCXP.LaCuentaSeRegistraSoloEnME(xxCia, xxCpto,
  xxCuenta: string): boolean;
var sSQL:string;
begin
  if xxCpto<>'' then
  begin
//    sSQL:=' SELECT CUENTAID FROM CXP201 WHERE CPTOID = '+quotedstr(xxCpto);
    sSQL:=' SELECT CUENTAID FROM CXP201 WHERE CPTOID in ('+quotedstr(xxCpto)+')';
    Filtracds(DMCXP.cdsQry,sSQL);
    sSQL:=' SELECT CUENTAID,REGSOLOME FROM TGE202 WHERE CIAID='+QuotedStr(xxCia)+
          ' AND CUENTAID='+QuotedStr(DMCXP.cdsQry.FieldbyName('CUENTAID').AsString);
    Filtracds(DMCXP.cdsQry,sSQL);
    result:=(DMCXP.cdsQry.FieldbyName('REGSOLOME').AsString='S');
  end
  else
  begin
    sSQL:=' SELECT CUENTAID,REGSOLOME FROM TGE202 WHERE CIAID='+QuotedStr(xxCia)+
          ' AND CUENTAID='+QuotedStr(xxCuenta);
    Filtracds(DMCXP.cdsQry,sSQL);
    result:=(DMCXP.cdsQry.FieldbyName('REGSOLOME').AsString='S');
  end;
end;


// VHN REMOTO
procedure TDMCXP.FiltraTablaRemoto( xxCds:TwwClientDataSet; xxArchivo, xxCampo, xxFilter : String  );
var
   xFiltro, xSQL2, xDirectorio : String;
begin
   xDirectorio:='';
   if DirectoryExists( ExtractFilePath( application.ExeName )+'\CDS' ) then
      xDirectorio:=ExtractFilePath( application.ExeName )+'\CDS\';

   cdsAcceso.Filtered:=False;
   cdsAcceso.Filter  :='';
   cdsAcceso.Filter  :='NTABLA='''+xxArchivo+''' AND USERID='''+wUsuario+'''';
   cdsAcceso.Filtered:=True;

   cdsUsuarioAct.Filtered:=False;
   cdsUsuarioAct.Filter  :='';
   cdsUsuarioAct.Filter  :='USERID='''+wUsuario+''' AND TABLANOMBRE='''+xxArchivo+'''';
   cdsUsuarioAct.Filtered:=True;

   xFiltro := '';
   cdsAcceso.First;
   while not cdsAcceso.Eof do begin
      If Length(xFiltro)=0 then
         xFiltro:=xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''''
      else
         xFiltro:=xFiltro+' OR '+xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+'''';
      cdsAcceso.Next;
   end;

   xxCds.Close;
   xxCds.Filtered:=False;
   xxCds.Filter  :='';
   xxCds.IndexFieldNames:='';

   if ( cdsUsuarioAct.RecordCount>0 ) or
      ( not FileExists( xDirectorio+xxArchivo ) ) then
   begin
      xSQL2 := 'SELECT * FROM '+ xxArchivo;
      //xxCds.Close;
      xxCds.DataRequest( xSQL2 );
      xxCds.Open;
      xxCds.SaveToFile( xDirectorio+xxArchivo );
      xxCds.Close;

      xSQL2:='Delete from TGE009 Where USERID='''+wUsuario+''' and TABLANOMBRE='''+xxArchivo+'''';
      cdsQry.Close;
      cdsQry.DataRequest( xSQL2 );
      cdsQry.Execute;
      cdsQry.Close;
   end;

   xxCds.LoadFromFile( xDirectorio+xxArchivo );

   if xFiltro='' then
      xFiltro:=xxFilter
   else begin
      if xxFilter<>'' then
         xFiltro:='( '+xFiltro+' ) and '+xxFilter;
   end;

   if Length(xFiltro)>0 then
   begin
      xxCds.Filter  :=xFiltro;
      xxCds.Filtered:=True;
   end;

end;


function TDMCXP.DisplayDescripCds( wwCds: TwwClientDataSet; wWhere, wResult : string; wLiberar : Boolean ) : string;
var
  xxCdsTmp : TwwClientDataSet;
begin
  xxCdsTmp := TwwClientDataSet.Create( nil );
  xxCdsTmp.Data := wwCds.Data;
  xxCdsTmp.Filtered:=False;
  xxCdsTmp.Filter:='';
  xxCdsTmp.Filter:=wWhere;
  xxCdsTmp.Filtered:=True;
  result:=xxCdsTmp.FieldByName(wResult).Asstring;
  xxCdsTmp.Free
end;


procedure TDMCXP.ActualizaFiltro(wwFiltro: TMant; wwCdsLee: TwwClientDataSet;
  wwAccion: String);
var
   i : integer;
begin
// wFiltro : Es el Filtro que va a actualizar
// wCDsLee : Es el cds que contiene la información a actualizar
// wAccion : 'A' = Adición/Inserción/Nuevo Item
//           'M' = Actualización del Registro
//           'E' = Eliminación del Registro
  TRY
   if wwAccion='E' then
   begin
      wwFiltro.FMant.cds2.Delete;
   end;

   if wwAccion='A' then
   begin
      wwFiltro.FMant.cds2.Append;
   end;

   if wwAccion='M' then
   begin
      wwFiltro.FMant.cds2.Edit;
   end;

   if (wwAccion='A') or (wwAccion='M') then
   begin
      for i:=0 to wwCdsLee.FieldCount-1 do
      begin
         wwFiltro.FMant.cds2.FieldByName(wwCdsLee.Fields[i].FieldName).Value :=
                wwCdsLee.FieldByName(wwCdsLee.Fields[i].FieldName).Value;
      end;
      wwFiltro.FMant.cds2.Post;
   end;
  EXCEPT
  END; 
end;


procedure TDMCXP.DataModuleCreate(Sender: TObject);
var
   xWhere, sSQL, xSQL2 :string;
   inifile : TIniFile;
   nVeces : Integer;
begin
   Screen.Cursor:=crHourGlass;
   DCOM1.Connected:=False;

   if ParamStr(1)='' then
   begin
      inifile:=TIniFile.Create( ExtractFilePath( application.ExeName )+'\oaCfg.ini');
      DCOM1.Address:=IniFile.ReadString('TCPIP','ADDRESS','');
      wSRV:=IniFile.ReadString('MOTOR','NAME','');
   end;

   TRY
      DCOM1.Connected:=true;
   EXCEPT
      // por no realizar la conexion
      SHOWMESSAGE( 'ERROR de Conexión.');
      Exit;
   END;

   Try
      cIP:= DMCXP.ObtenerIpdeNetbios(DMCXP.computerName);
   Except
      ShowMessage( 'ERROR de Conexión.');
      DCOM1.Connected:=False;
      Exit;
   End;

   FCtrlAcceso := TFCtrlAcceso.Create(Application);
   wModulo := 'CXP';
   FCtrlAcceso.wDCOM1:=DCOM1;
   Screen.Cursor:=crHourGlass;

   FCtrlAcceso.ShowModal;

   if FCtrlAcceso.cAccesoSistema='S' then
   begin
      wUsuario := FCtrlAcceso.dbeUsuario.Text;
      FCtrlAcceso.free;
   end
   else
   begin
      DCOM1.Connected:=False;
      FCtrlAcceso.free;
      sClose:='1';
      Exit;
   end;

   if not AccesosModulo then
   begin
      DCOM1.Connected:=False;
      Screen.Cursor:=CrDefault;
   end
   else
   begin
      wModulo := 'CXP';
      {
      //
      Verpercadpas;
      //
      }
      if (wSRV = 'ORACLE') then
      begin
         xSQL2:='Select A.USERID, A.GRUPOID, B.MODULOID, B.TIPO, B.OBJETO, B.FORMA, C.GRUPOADM '
               +'From TGE007 A, TGE001 B, TGE003 C '
               +'WHERE A.USERID='''+wUsuario+''' '
               +'AND A.GRUPOID=B.GRUPOID(+) and B.MODULOID='''+wModulo+''''
               +'AND A.GRUPOID=C.GRUPOID(+)';
      end;
      if (wSRV = 'DB2NT') or (wSRV = 'DB2400') then
      begin
         xSQL2:='Select A.USERID, A.GRUPOID, B.MODULOID, B.TIPO, B.OBJETO, B.FORMA, C.GRUPOADM '
               +'From TGE007 A '
               +'Left Outer Join TGE001 B ON (A.GRUPOID=B.GRUPOID) '
               +'Left Outer Join TGE003 C ON (A.GRUPOID=C.GRUPOID) '
               +'WHERE A.USERID='''+wUsuario+''' '
               +'and B.MODULOID='''+wModulo+'''';
      end;
      cdsUsuarios.Close;
      cdsUsuarios.DataRequest( xSQL2 );
      cdsUsuarios.Open;
      cdsMGrupo.Open;
      wAdmin := cdsMGrupo.fieldbyname('GrupoAdm').AsString;
      wAdmin := cdsUsuarios.fieldbyname('GrupoAdm').AsString;
      cdsGrupos.Open;
      cdsReglas.Open;

   // Inicio HPC_201801_CXP
   // 26/01/2018 Asigna grupo de usuario a variable para controlar acceso a opciones
      wGrupo := cdsUsuarios.FieldByName('GRUPOID').AsString;
   // Fin HPC_201801_CXP


      xSQL2 := 'SELECT * FROM TGE004 '
             + 'WHERE MODULOID='+''''+wModulo    +''''
             + ' AND  USERID='  +''''+wUsuario+'''';
      cdsAcceso.Close;
      cdsAcceso.DataRequest( xSQL2 );
      cdsAcceso.Open;

      ssql := '';
      ssql := 'SELECT * FROM SOLCONFIG';
      cdsQry.Close;
      cdsQry.DataRequest(ssql);
      cdsQry.Open;
      wSRV_RUTA := cdsQry.fieldbyname('SRV_RUTA').AsString;
      if cdsQry.fieldbyname('SRV_PRESU').AsString = 'S' Then
         wActuaPresu := true
      else
         wActuaPresu :=false;

      DisplayDescrip2('prvSQL','SOLCONFIG','*','','SRV_DB');
      SRV_E     := cdsqry.fieldbyname('SRV_EQUIP').AsString;
      SRV_D     := wSRV; //cdsqry.fieldbyname('SRV_DB').AsString;
      SRV_V     := cdsqry.fieldbyname('SRV_VERS').AsString;
      wRptCia   := cdsqry.fieldbyname('RPTCIA').AsString;
      wAnchoPu  := cdsqry.fieldbyname('DECPU_OC').AsInteger;
      wAnchoProv:= cdsqry.fieldbyname('NDIG_PROV').AsInteger;
      wAnchoLote:= cdsqry.fieldbyname('NDIGLOTE').AsInteger;

      cdsReglas.Close;
      cdsReglas.DataRequest('Select * From SOLREGLAS where VRN_MODULO=''CXP''' );
      cdsReglas.Open;

      if cdsReglas.RecordCount>0 then
      begin
         cdsReglas.First;
         wVRN_OrdenCompra   := cdsReglas.FieldByName('VRN_OCOMPRA').AsString;
         wVRN_OrdenPago     := cdsReglas.FieldByName('VRN_OPAGO').AsString;
         wVRN_PagosParciales:= cdsReglas.FieldByName('VRN_PAGOSP').AsString;
         wVRN_TipoCambio    := cdsReglas.FieldByName('VRN_TCAM').AsString;
         wVRN_TCambioFijo   := cdsReglas.FieldByName('VRN_TCFIJO').AsString;
         wVRN_GlosaDup      := cdsReglas.FieldByName('VRN_GLOSADUP').AsString;
         wVRN_InterMed      := cdsReglas.FieldByName('VRN_INTERMED').AsString;
         wVRN_CptoCia       := cdsReglas.FieldByName('VRN_CPTOCIA').AsString;
         wVRN_CCosCia       := cdsReglas.FieldByName('VRN_CCOSCIA').AsString;
         wVRN_ProvAutoDD    := cdsReglas.FieldByName('VRN_PROVAUTODD').AsString;
         wVRN_ProvOrden     := cdsReglas.FieldByName('VRN_PROVORDEN').AsString;
         wVRN_AutoDDLC      := cdsReglas.FieldByName('VRN_AUTODDLC').AsString;
         wVRN_GlosaRep      := cdsReglas.FieldByName('VRN_GLOSAREP').AsString;
         wVRN_ObTDiario     := cdsReglas.FieldByName('VRN_OBTDIARIO').AsString;
      end;
      cdsReglas.Close;

      if (SRV_D = 'DB2NT') or
         (SRV_D = 'DB2400') then
      begin
         wFormatFecha:='YYYY-MM-DD';
         wReplacCeros:='COALESCE';
         wRepFecServi:='CURRENT DATE';
         wRepHorServi:='CURRENT TIME';
         wRepFuncDate:='DATE(';
      end
      else
      if SRV_D = 'ORACLE' then
      begin
         wFormatFecha:='DD/MM/YYYY';
         wReplacCeros:='NVL';
         wRepFecServi:='SYSDATE';
         wRepHorServi:='SYSDATE';
         wRepFuncDate:='TO_DATE(';
      end;

//   wRutaRpt := 'RTMs\'+wModulo+'\'+wRptCia;
      wRutaRpt := 'RTMs\OP\'+wRptCia;

      xSQL2:='Select * from TGE009 WHERE USERID='''+wUsuario+'''';
      cdsUsuarioAct.Close;
      cdsUsuarioAct.DataRequest( xSQL2 );
      cdsUsuarioAct.Open;

   // Inicio HPC_201405_CXP
      {
      FiltraTablaRemoto( cdsCia,     'TGE101', 'CIAID',   '' );
      FiltraTablaRemoto( cdsTDoc,    'TGE110', 'DOCID',   '' );
      FiltraTablaRemoto( cdsTDiario, 'TGE104', 'TDIARID', '' );
      FiltraTablaRemoto( cdsTMon,    'TGE103', 'TMONID',  '' );
      FiltraTablaRemoto( cdsBanco,   'TGE105', 'BANCOID', '' );
      FiltraTablaRemoto( cdsCCBco,   'TGE106', 'CCBCOID', '' );
      FiltraTablaRemoto( cdsFPago,   'TGE112', 'FPAGOID', '' );
      FiltraTablaRemoto( cdsTipReg,  'TGE113', 'TREGID',  '' );
      FiltraTablaRemoto( cdsClAux,   'TGE102', 'CLAUXID', '' );
      FiltraTablaRemoto( cdsNivel,   'CNT202', 'NIVEL',   '' );
      FiltraTablaRemoto( cdsDoc2,    'TGE110', 'DOCID',   '' );
      FiltraTablaRemoto( cdsTipo,    'CXP_DETR_SUNAT', 'CPTODETRSUNATID',   '' );
      FiltraTablaRemoto( cdsOper,    'CXP_TIP_OPER_SUNAT', 'TIPOOPERSUNATID',   '' );
      }
      FiltraTabla( cdsCia,     'TGE101', 'CIAID' );
      FiltraTabla( cdsTDoc,    'TGE110', 'DOCID' );
      FiltraTabla( cdsTDiario, 'TGE104', 'TDIARID' );
      FiltraTabla( cdsTMon,    'TGE103', 'TMONID' );
      FiltraTabla( cdsBanco,   'TGE105', 'BANCOID' );
      FiltraTabla( cdsCCBco,   'TGE106', 'CCBCOID' );
      FiltraTabla( cdsFPago,   'TGE112', 'FPAGOID' );
      FiltraTabla( cdsTipReg,  'TGE113', 'TREGID' );
      FiltraTabla( cdsClAux,   'TGE102', 'CLAUXID' );
      FiltraTabla( cdsNivel,   'CNT202', 'NIVEL' );
      FiltraTabla( cdsDoc2,    'TGE110', 'DOCID' );
      FiltraTabla( cdsTipo,    'CXP_DETR_SUNAT', 'CPTODETRSUNATID' );
      FiltraTabla( cdsOper,    'CXP_TIP_OPER_SUNAT', 'TIPOOPERSUNATID' );
   // Fin HPC_201405_CXP

      // vhndema
      cFilterCiaUser    :=FiltraCiaPorUsuario( cdsCia );
//      sCiaOrigen:=DMCNT.FiltraTablaxCia( DMCNT.cdsTDiario, 'TGE104', 'TDIARID',  dblcCia.Text );


      cFilterOrigenUser :=FiltraOrigenPorUsuario_cia( 'TGE104', 'TDIARID' );

      cFilterUsuarioUser   :=FiltraUsuarioPorUsuario_cia( 'TGE006', 'CPUSER' );
      cFilterUsuarioUserOrd:=FiltraUsuarioPorUsuario_cia( 'TGE006', 'USUARIO' );
      cFilterUsuarioUserDet:=FiltraUsuarioPorUsuario_cia( 'TGE006', 'DCPUSER' );

      wTMonExt:= DisplayDescripCds( cdsTMon, 'TMon_Loc=''E''', 'TMONID', false );
      wTMonLoc:= DisplayDescripCds( cdsTMon, 'TMon_Loc=''L''', 'TMONID', false );

   // Inicio HPC_201601_CXP
   // Se inicializa la variable wTMonLocDes con descripción de la Moneda Local
      wTMonLocDes := UpperCase(DisplayDescripCds( cdsTMon, 'TMon_Loc=''L''', 'TMONDES', false ));
   // Se inicializa la variable wTMonExtDes con descripción de la Moneda Extranjera
      wTMonExtDes := UpperCase(DisplayDescripCds( cdsTMon, 'TMon_Loc=''E''', 'TMONDES', false ));
   // Fin HPC_201601_CXP

      wsLet   := DisplayDescripCds( cdsTDoc, 'DOCMOD=''CXP'' AND DOC_FREG=''L''','DOCID', false );
      wsAnt   := DisplayDescripCds( cdsTDoc, 'DOCMOD=''CXP'' AND DOC_FREG=''A''','DOCID', false );
      wsNDe   := DisplayDescripCds( cdsTDoc, 'DOCMOD=''CXP'' AND DOC_FREG=''P'' AND DOCTIPREG=''ND''','DOCID', false );
      wsChe   := DisplayDescripCds( cdsTDoc, 'DOCMOD=''CXP'' AND DOC_FREG=''H''','DOCID', false );
      wsCob   := DisplayDescripCds( cdsTDoc, 'DOCMOD=''CXP'' AND DOC_FREG=''C''','DOCID', false );
      wsNCre  := DisplayDescripCds( cdsTDoc, 'DOCMOD=''CXP'' AND DOC_FREG=''N''','DOCID', false );
      wsFac   := DisplayDescripCds( cdsTDoc, 'DOCMOD=''CXP'' AND DOC_FREG=''F''','DOCID', false );
      wsBol   := DisplayDescripCds( cdsTDoc, 'DOCMOD=''CXP'' AND DOC_FREG=''B''','DOCID', false );
      wsFChe  := DisplayDescripCds( cdsFPago,'FCHQ='+QuotedStr('1'),'FPAGOID', false );
      //
      {
      FiltraTabla( cdsCia,     'TGE101', 'CIAID'    );
      FiltraTabla( cdsTDoc,    'TGE110', 'DOCID'    );
      FiltraTabla( cdsTDiario, 'TGE104', 'TDIARID'  );
      FiltraTabla( cdsTMon,    'TGE103', 'TMONID'   );
      FiltraTabla( cdsBanco,   'TGE105', 'BANCOID'  );
      FiltraTabla( cdsCCBco,   'TGE106', 'CCBCOID'  );
      FiltraTabla( cdsFPago,   'TGE112', 'FPAGOID'  );
      FiltraTabla( cdsTipReg,  'TGE113', 'TREGID'   );
      FiltraTabla( cdsClAux,   'TGE102', 'CLAUXID'  );
      // determina Tipo de Moneda Extranjera Oficial (normalmente dólares)
      ssql    := 'TMon_Loc='+''''+'E'+'''';
      wTMonExt:= displaydescrip2('prvSQL','TGE103','*',ssql,'TMonId');
      ssql    := 'TMon_Loc='+''''+'L'+'''';
      wTMonLoc:= displaydescrip2('prvSQL','TGE103','*',ssql,'TMonId');
      wsLet   := displaydescrip2('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''L''','DOCID');
      wsAnt   := displaydescrip2('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''A''','DOCID');
      wsNDe   := displaydescrip2('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''P'' AND DOCTIPREG=''ND''','DOCID');
      wsChe   := displaydescrip2('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''H''','DOCID');
      wsCob   := displaydescrip2('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''C''','DOCID');
      wsNCre  := displaydescrip2('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''N''','DOCID');
      wsFac   := displaydescrip2('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOCTIPREG=''F''','DOCID');
      wsBol   := displaydescrip2('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOCTIPREG=''B''','DOCID');
      wsFChe  := displaydescrip2('dspTGE','TGE112','FPAGOID','FCHQ='+QuotedStr('1'),'FPAGOID');
      }
      xSQL2:='SELECT * FROM CXP201'
            +' where '+wReplacCeros+'(NIVELMOV,'+quotedstr('')+')='+quotedstr('S');
      cdsCnpEgr.Close;
      cdsCnpEgr.DataRequest( xSQL2 );
      cdsCnpEgr.Open;
   end;
   Screen.Cursor:=CrDefault;
end;


function TDMCXP.AccesosModulo :  Boolean;
var
   xSQL : String;
   xfecfin :TDate;
   xdiasexppass:Integer;
   xdiasfaltantes:Integer;
   xdiasduracpass:Integer;
   xpassact, xctrl_ip, xingresa :String;
begin
// busca en tabla DE USUARIO (TGE006) para determinar que es un usuario de base de datos
   xSQL := 'select FECEXP, OFDESID, nvl(CTRL_IP,''S'') CTRL_IP, '
          +'       TO_DATE(nvl(FECINI_PWD,sysdate-30)) FECINI_PWD, '
          +'       TO_DATE(nvl(FECFIN_PWD, sysdate-1)) FECFIN_PWD, '
          +'       nvl(DIASEXP_PWD,7) DIASEXP_PWD,'
          +'       nvl(DIASDURAC_PWD,30) DIASDURAC_PWD '
          +'from TGE006 '
          +'where USERID = '+QuotedStr(wUsuario);
   cdsQry.Close;
   cdsQry.DataRequest(xSql);
   cdsQry.Open;
   If cdsQry.RecordCount=0 then
   Begin
      Showmessage('Usuario no reconocido para el uso de Aplicaciones');
      Result:=False;
      Exit;
   End;

// valida que contraseña en control de aplicaciones (TGE006), no haya expirado
   If (cdsQry.FieldByName('FECEXP').AsDateTime>0) and
      (cdsQry.FieldByName('FECEXP').AsDateTime<Date) Then
   Begin
      Showmessage('Usuario ha caducado para el uso de Aplicaciones');
      Result:=False;
      Exit;
   End;
   xfecfin         := cdsQry.FieldByName('FECFIN_PWD').AsDateTime;
   xdiasexppass    := cdsQry.FieldByName('DIASEXP_PWD').AsInteger;
   xdiasduracpass  := cdsQry.FieldByName('DIASDURAC_PWD').AsInteger;
   //xpassact        := FCtrlAcceso.dbePassword.Text;

   wOfiId  := cdsQry.FieldByName('OFDESID').AsString;
   xctrl_ip:= cdsQry.FieldByName('CTRL_IP').AsString;
   widepc  := computerName;

// determina que el usuario tenga acceso al módulo
// busca en tabla TGE006 para determinar que es un usuario de base de datos y de la aplicación
   xSQL := 'Select USUARIOS.USERID, USUARIOS.USERNOM, USUARIOGRUPO.GRUPOID, '
          +'       GRUPOS.GRUPODES, GRUPOS.GRUPOADM, ACCESOGRUPO.MODULOID, '
          +'       ACCESOGRUPO.TIPO, ACCESOGRUPO.OBJETO, ACCESOGRUPO.FORMA '
          +'From TGE006 USUARIOS, TGE007 USUARIOGRUPO, TGE003 GRUPOS, TGE001 ACCESOGRUPO '
          +'where USUARIOS.USERID='+quotedstr(wUsuario) // -- TGE006 USUARIOS
          +'  and USUARIOGRUPO.USERID=USUARIOS.USERID' // -- TGE007 USUARIOGRUPO
          +'  and GRUPOS.GRUPOID=USUARIOGRUPO.GRUPOID' // -- TGE003 GRUPOS
          +'  and ACCESOGRUPO.GRUPOID=USUARIOGRUPO.GRUPOID '
          +'  and ACCESOGRUPO.MODULOID='+quotedstr(wModulo)
          +'  and ACCESOGRUPO.TIPO=''0'' '; // TGE001 ACCESOGRUPO
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If cdsQry.RecordCount=0 then
   Begin
      ShowMessage('No tiene Acceso al módulo');
      Result:=False;
      Exit;
   End;

// Identifica si el usuario puede ejecutar los sistemas de cualquier maquina
// o solo de las máquina que se le han asignado
   xingresa := 'N';
   If xctrl_ip = 'S' Then
   Begin
     xSQL := 'SELECT IP_ASIGNADO FROM TGE010 WHERE USERID = '+QuotedStr(DMCXP.wUsuario);
     cdsQry.Close;
     cdsQry.DataRequest(xSQL);
     cdsQry.Open;
     While Not cdsQry.Eof Do
     Begin
        If cdsQry.FieldByName('IP_ASIGNADO').AsString = cIP then xingresa := 'S';
        cdsQry.Next;
     End;
   End;
   If (xingresa = 'N') And (xctrl_ip = 'S') Then
   Begin
      Showmessage('Usuario no autorizado para ingresar de este equipo');
      Result:=False;
      Exit;
   End;

// DETERMINA NRO DE IDENTIFICADOR PARA GRABAR EN ARCHIVO LOG DE ACCESOS
// SE DETERMINA EN BASE A LA FECHA+HORA DE INGRESO A LA BASE DE DATOS
   xSQL := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') IDE, SYSDATE FECHORCON FROM DUAL';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   ideconex  := cdsQry.FieldByName('IDE').AsString;
   fechorcon := cdsQry.FieldByName('FECHORCON').AsString;

// ENVIA PARAMETROS DE LA PC DEL USUARIO HACIA LA APLICACION SERVIDOR
   DCOM1.AppServer.ConexionON( wUsuario, cIP, wModulo, ideconex, fechorcon, widepc);

// controla caducidad de contraseña
   xSQL := 'SELECT TO_DATE('+QuotedStr(DateToStr(xfecfin))+') - TO_DATE(SYSDATE) DIASFALTANTE FROM DUAL';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;

   xdiasfaltantes := cdsQry.FieldByName('DIASFALTANTE').AsInteger; // dias que faltan
   If xdiasfaltantes <= xdiasexppass Then
   Begin
      If xdiasfaltantes <= 0 then
         MessageDlg('SU CONTRASEÑA HA CADUCADO, DEBE CAMBIARLA AHORA', mtCustom, [mbOk], 0)
      else
         if xdiasfaltantes=1 then
            MessageDlg('!!! FALTA 1 DíA PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡'+chr(13)
                      +'            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0)
         else
            MessageDlg('!!! FALTAN '+IntToStr(xdiasfaltantes)+' DÍAS PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡'+chr(13)
                      +'            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0);
     { FCambioContrasena:= TFCambioContrasena.create(self);
      Try
         FCambioContrasena.ShowModal;
      Finally
         FCambioContrasena.Free;
      End;}
   End;
   If xdiasfaltantes <= 0 Then
   Begin
      Result:=False;
      Exit;
   End;

   Result:=True;

end;


procedure TDMCXP.cdsMovCxPReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Action:=HandleReconcileError( DataSet, UpdateKind, E )
end;

procedure TDMCXP.Verpercadpas;
Var
   xSql:String;
   xfecfin :TDate;
   xdiasexppass, xdiasduracpass:Integer;
   xdiasfaltantes:Integer;
   xpassact, xpassnue:String;
begin
   xSql := 'SELECT TO_DATE(nvl(FECINI_PWD,sysdate)) FECINI_PWD, '
          +'       TO_DATE(nvl(FECFIN_PWD,sysdate+30)) FECFIN_PWD, '
          +'       nvl(DIASEXP_PWD,7) DIASEXP_PWD, '
          +'       nvl(DIASDURAC_PWD,30) DIASDURAC_PWD, PASSWORD '
          +'FROM TGE006 WHERE USERID = '+QuotedStr(wUsuario);

   cdsQry.Close;
   cdsQry.DataRequest(xSql);
   cdsQry.Open;

   xfecfin        := cdsQry.FieldByName('FECFIN_PWD').AsDateTime;
   xdiasexppass   := cdsQry.FieldByName('DIASEXP_PWD').AsInteger;
   xdiasduracpass := cdsQry.FieldByName('DIASDURAC_PWD').AsInteger;
   xpassact       := cdsQry.FieldByName('PASSWORD').AsString;
   xSql := 'SELECT TO_DATE('+QuotedStr(DateToStr(xfecfin))+') - TO_DATE(SYSDATE) DIASFALTANTE FROM DUAL';
   cdsQry.Close;
   cdsQry.DataRequest(xSql);
   cdsQry.Open;
   xdiasfaltantes := cdsQry.FieldByName('DIASFALTANTE').AsInteger; // dias que faltan
   if xdiasfaltantes <= xdiasexppass Then
   Begin
      if xdiasfaltantes<=0 then
         MessageDlg('SU CONTRASEÑA HA CADUCADO, DEBE CAMBIARLA AHORA', mtCustom, [mbOk], 0)
      else
         if xdiasfaltantes=1 then
            MessageDlg('*** FALTA 1 DíA PARA EL VENCIMIENTO DE SU PASSWORD. ***'#13'                            SE SUGIERE CAMBIARLA AHORA', mtCustom, [mbOk], 0)
         else
            MessageDlg('*** FALTAN '+IntToStr(xdiasfaltantes)+' DÍAS PARA EL VENCIMIENTO DE SU PASSWORD. ***'#13'                            SE SUGIERE CAMBIARLA AHORA', mtCustom, [mbOk], 0);
      Application.Terminate;
      {
      cdsUser.Close;
      cdsUser.DataRequest('SELECT * FROM TGE006 WHERE USERID='''+wUsuario+'''');
      cdsUser.Open;
      FCPassw := TFCPassw.Create(Self);
      FCPassw.dbeUsuario.Text := DMCXP.wUsuario;
      FCPassw.dbeNombre.Text  := DMCXP.cdsUser.FieldByname('USERNOM').AsString;
      FCPassw.dbeUser.Text    := DMCXP.wUsuario;
      FCPassw.sPassword       := DMCXP.cdsUser.FieldByname('PASSWORD').AsString;
      FCPassw.sModulo         := DMCXP.wModulo;
      FCPassw.wDCOM1          := DMCXP.DCOM1;
      FCPassw.wcdsUsuarios    := DMCXP.cdsUser;
      Try
         FCPassw.ShowModal;
      Finally
         FCPassw.Free;
      End;

      xSql := 'SELECT PASSWORD FROM TGE006 WHERE USERID = '+QuotedStr(wUsuario);
      cdsQry.Close;
      cdsQry.DataRequest(xSql);
      cdsQry.Open;
      xpassnue := cdsQry.FieldByName('PASSWORD').AsString;
      If xpassact <> xpassnue Then
      Begin
         xSql := 'UPDATE TGE006 '
                +'SET FECINI_PWD = TO_DATE(SYSDATE), '
                +'    FECFIN_PWD = TO_DATE(SYSDATE)+'+IntToStr(xdiasduracpass)
                +' WHERE USERID = '+QuotedStr(wUsuario);
         DCOM1.AppServer.EjecutaSQL(xSql);
         Application.Terminate;
      End;
      If xdiasfaltantes <= 0 Then Application.Terminate;
      }
   End // if xdiasfaltantes <= xdiasexppass
   Else
      If xdiasfaltantes <= 0 Then Application.Terminate;
end;


procedure TDMCXP.DataModuleDestroy(Sender: TObject);
begin
// ENVIA PARAMETROS DE LA PC DEL USUARIO HACIA LA APLICACION SERVIDOR
   try
      if ideconex<>'' then
         DCOM1.AppServer.ConexionOFF( wUsuario, ideconex);
   except
   end;
end;

procedure TDMCXP.HojaExcel(Tit: String; TDs: TDataSource; TDb: TDBGrid);
Var
   Lcid, C, CH, CH1, I, W, X, Y, TotHoja: Integer;
   Bk: TBookmarkStr;
   Tabla: Variant;
   L, A: OleVariant;
   HH: Extended;
Begin
   If Not TDs.DataSet.Active Then Exit;
   If TDs.DataSet.RecordCount = 0 Then Exit;

   Lcid := GetUserDefaultLCID;
   C := TDb.Columns.Count;
   CH := 1;
   If TDs.DataSet.RecordCount > 15100 Then
   Begin
      HH := TDs.DataSet.RecordCount / 15100;
      CH := Trunc(HH);
      If Frac(HH) > 0 Then CH := CH + 1;
   End;

   ExcelApp.Visible[Lcid] := True;
   ExcelApp.Caption := 'Consultas en EXCEL';
   ExcelBook.ConnectTo(ExcelApp.Workbooks.Add(1, Lcid));
   If CH > 1 Then
   Begin
      ExcelBook.Worksheets.Add(NULL, NULL, (CH - 1), NULL, Lcid);
      For I := 1 To CH Do
      Begin
         WS.ConnectTo(ExcelBook.Worksheets[I] As _Worksheet);
         WS.Name := Tit + '_' + IntToStr(I);
      End;
   End;

   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);
   If CH = 1 Then WS.Name := Tit;
   ExcelApp.ScreenUpdating[Lcid] := False;
   For X := 1 To CH Do
   Begin
      WS.ConnectTo(ExcelBook.Worksheets[X] As _Worksheet);
      WS.Activate(Lcid);
      For I := 0 To (C - 1) Do
      Begin
         L := WS.Cells.Item[1, I + 1];
         WS.Range[L, L].Value2 := TDb.Columns[I].Title.Caption;
      End;
   End;

   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);

   CH1 := 1;
   W := 2;
   I := 1;
   Y := 1;
   TotHoja := 0;
   TDs.DataSet.DisableControls;
   Bk := TDs.DataSet.Bookmark;

   Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
   TDs.DataSet.First;
   While Not TDs.DataSet.Eof Do
   Begin
      For X := 0 To (C - 1) Do
         Tabla[Y, X] := TDs.DataSet.Fields[X].AsString;
      If Y = 5000 Then
      Begin
         L := 'A' + IntToStr(W);
         WS.Range[L, WS.Cells.Item[I + 1, C]].Value2 := Tabla;
         Try
            Tabla := Unassigned;
         Finally
            Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
         End;

         Y := 0;
         W := I + 2;
      End;
      Inc(Y, 1);
      Inc(I, 1);
      Inc(TotHoja, 1);
      If TotHoja = 15100 Then
      Begin
         L := 'A' + IntToStr(W);
         WS.Range[L, WS.Cells.Item[I, C]].Value2 := Tabla;

         Try
            Tabla := Unassigned;
         Finally
            Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
         End;

         CH1 := CH1 + 1;
         WS.ConnectTo(ExcelBook.Worksheets[CH1] As _Worksheet);
         WS.Activate(Lcid);

         Y := 1;
         W := 2;
         I := 1;
         TotHoja := 0;
      End;
      Application.ProcessMessages;
      TDs.DataSet.Next;
   End;
   CH1 := I;
   Try
      WS.Range['A' + IntToStr(W), WS.Cells.Item[CH1, C]].Value2 := Tabla;
   Finally
      Tabla := Unassigned;
   End;

   For X := 1 To CH Do
   Begin
      WS.ConnectTo(ExcelBook.Worksheets[X] As _Worksheet);
      WS.Activate(Lcid);

      SetLength(FormatCel, C + 1);
      FormatosCeldas(C, TDs);
      For I := 1 To C Do
      Begin
         L := WS.Cells.Item[1, I];
         WS.Range[L, L].EntireColumn.NumberFormat := FormatCel[I];
      End;

      For I := 0 To (C - 1) Do
      Begin
         L := WS.Cells.Item[1, I + 1];
         Y := TDs.DataSet.Fields[I].DisplayWidth;
         If Length(TDb.Columns[I].Title.Caption) > Y Then
            Y := Length(TDb.Columns[I].Title.Caption);
         WS.Range[L, L].EntireColumn.ColumnWidth := Y + 2;
         If TDb.Columns[I].Alignment = taLeftJustify Then A := 2;
         If TDb.Columns[I].Alignment = taCenter Then A := 3;
         If TDb.Columns[I].Alignment = taRightJustify Then A := 4;
         WS.Range[L, L].EntireColumn.HorizontalAlignment := A;
      End;

      L := WS.Cells.Item[1, C];
      WS.Range['A1', L].HorizontalAlignment := 3;
      WS.Range['A1', L].Interior.Color := clMaroon;
      WS.Range['A1', L].Font.Color := clWhite;
      WS.Range['A1', L].Font.Bold := True;

      If CH = 1 Then
         W := TDs.DataSet.RecordCount + 1
      Else
         If (CH > 1) And (X < CH) Then
            W := 15101
         Else
            If (CH > 1) And (X = CH) Then W := CH1;

      WS.PageSetup.PrintGridlines := True;
      WS.PageSetup.PrintTitleRows := '1:1';

      WS.DefaultInterface.Set_DisplayAutomaticPageBreaks(Lcid, True);
   End;

   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);

   ExcelApp.ScreenUpdating[Lcid] := True;

   TDs.DataSet.EnableControls;
   TDs.DataSet.Bookmark := Bk;
end;

procedure TDMCXP.FormatosCeldas(N: Integer; TDs: TDataSource);
Var
   I: Integer;
   F: TFieldDef;
Begin
   For I := 1 To N Do
   Begin
      F := TDs.DataSet.FieldDefs.Items[I - 1];
      Case F.DataType Of
         ftString: FormatCel[I] := StrZero('0', Length(TDs.DataSet.Fields[I - 1].AsString));
         ftDate: FormatCel[I] := 'dd/mm/yyyy';
         ftDateTime: FormatCel[I] := 'dd/mm/yyyy';
         ftTimeStamp: FormatCel[I] := 'dd/mm/yyyy';
         ftUnknown: FormatCel[I] := StrZero('0', Length(TDs.DataSet.Fields[I - 1].AsString));
      Else
         FormatCel[I] := Null;
      End;
   End;
end;

// Inicio HCP_201401_CXP
function TDMCXP.fg_VerificaVersion(wgVersion: String): Boolean;
Var
   xsSQL: String;
Begin
   Result := False;
   xsSQL := 'SELECT * FROM TGE600 WHERE CODIGO = ' + QuotedStr(wModulo);
   cdsQry.Close;
   cdsQry.DataRequest(xsSQL);
   cdsQry.Open;
   If Trim(wgVersion) = Trim(cdsQry.FieldByName('VERSION').AsString) Then
      Result := True
   Else
      Result := False;
end;
// Fin HCP_201401_CXP

// Inicio HPC_201604_CXP
// DAF_2016000575
function TDMCXP.fg_ValidaNroRUC(wgRUC: String): Boolean;
var
   xSQL : String;
begin
   xSQL := 'select VALIDA_RUC_SUNAT('+quotedstr(wgRUC)+') RUCVALIDO from DUAL ';
   cdsQryRUC.Close;
   cdsQryRUC.DataRequest(xSQL);
   cdsQryRUC.Open;
   if cdsQryRUC.FieldByName('RUCVALIDO').AsString='S' then
      result := True
   else
   Begin
      ShowMessage('Número de RUC es inválido');
      result := False;
   End;
end;
// Fin HPC_201604_CXP

// Inicio HPC_201801_CXP
// Implementación de Accesos a la Opción de Dietas
function TDMCXP.wf_AccesoOpcion(wOpcion: String): Boolean;
begin
   xSQL := 'Select OBJETO '
      + '     from TGE001 '
      + '    where GRUPOID='+quotedstr(DMCXP.wGrupo)
      + '      and MODULOID='+quotedstr(DMCXP.wModulo)
      + '      and TIPO='+quotedstr('1')
      + '      and OBJETO='+quotedstr(wOpcion);
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If cdsQry.RecordCount=0 then
   Begin
      ShowMessage('No tiene Acceso a esta Opción');
      result := False;
   End
   Else
   Begin
      result := True;
   End;
end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Función que valida si string es alfanumérica
Function TDMCXP.isAlfanumerico(ICad: String): boolean;
Var
   i: integer;
   valor: char;
Begin
   For i := 1 To Length(ICad) Do
   Begin
      valor := ICad[i];
      If Not ((valor In ['A'..'Z'])
         Or (valor In ['a'..'z'])
         Or (valor In ['0'..'9'])) Then
      Begin
         Result := False;
         exit;
      End;
   End;
   Result := true;
End;
// Fin HPC_201801_CXP

end.



