unit CxP001;
// Actualizaciones
// HPC_201401_CXP    24/02/2014  Se actualiza versión 20140225083000
// HPC_201403_CXP    20/03/2014  Se actualiza versión 20140324083000
// HPC_201404_CXP    26/03/2014  Se actualiza versión 20140326083000
// HPC_201405_CXP    21/04/2014  Se actualiza versión 20140422083000
// HPC_201406_CXP    22/05/2014  Se actualiza versión 20140528083000
// HPC_201407_CXP    04/06/2014  Se actualiza versión 20140604083000
// HPC_201408_CXP    18/06/2014  Se actualiza versión 20140619083000
// HPC_201409_CXP    10/07/2014  Se actualiza versión 20140710083000
// HPC_201410_CXP    10/07/2014  Se actualiza versión 20140801083000
// HPC_201411_CXP    10/07/2014  Se actualiza versión 20140901083000
// HPC_201412_CXP    22/09/2014  Se actualiza versión 20141006083000
// HPC_201604_CXP    28/11/2016  Se actualizó versión 20161228083000
//                               Se abre Tabla en Tipo de Documento porque puede haber sido cerrada en otras opciones
// HPC_201801_CXP    26/01/2018  Se incorpora las opciones para Dietas
//                               agrega CXP783 Tool de Planilla de Dietas de Directorio
//

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls, Buttons, wwdblook, Wwdbdlg,
  ComCtrls, Db, DBClient, Menus, Wwdatsrc, wwclient, Mask, DBCtrls, DBiProcs,
  DbiErrs, DBiTypes, DBTables, ToolWin, wwidlg, Wwlocate, Wwkeycb, Spin,
  wwDialog, Tabnotbk, daQClass, ppDB, ppDBBDE, ppClass, daDataVw, daQuery,
  daDBBDE, ppModule, daDatMod, ppCtrls, ppBands, ppPrnabl, ppProd,
  ppReport, ppComm, ppRelatv, ppCache, ppDBPipe, ppviewr, wwrcdvw,
  TeeProcs, TeEngine, Chart, fcImager, fcLabel, ControlGridDisp,
  Mant, oaVariables;

type
  TFPrincipal = class(TForm)
    lblVersion: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Z1sbSalidaClick(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Z1sbMenuReglas1Click(Sender: TObject);
    procedure Z1sbMenuReglas2Click(Sender: TObject);
    procedure Z1sbMRegistro1Click(Sender: TObject);
    procedure Z1sbMRegistro2Click(Sender: TObject);
    procedure Z1sbMRegistro3Click(Sender: TObject);
    procedure Z1sbMRegistro4Click(Sender: TObject);
    procedure Z1sbMRegistro6Click(Sender: TObject);
    procedure Z1sbMenuReportes1Click(Sender: TObject);
    procedure Z1sbMenuReportes3Click(Sender: TObject);
    procedure Z1sbAyudaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Z1sbMRegistro5Click(Sender: TObject);
    procedure Z1sbMRegistro7Click(Sender: TObject);
    procedure Z1sbMenuReportes2Click(Sender: TObject);
    procedure Z1sbMenuOtros1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AppMessage(var Msg:TMsg; var Handled:Boolean );
    Procedure MueveMouse(xObjeto: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListaComponentes( xForm : TForm);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z1sbMenuOtros3Click(Sender: TObject);
    procedure Z1sbMRegistro9Click(Sender: TObject);
    procedure Z1sbMRegistro0Click(Sender: TObject);
    procedure Z2sbMenuContabClick(Sender: TObject);
    procedure Z2sbMenuIngresadosClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Z1sbMRegistro11Click(Sender: TObject);
    procedure Z1sbDetalleCXPClick(Sender: TObject);
    procedure Z1sbInfDiarioClick(Sender: TObject);
    procedure Z1sbInfDistribucionClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Z1sbMRegistro8Click(Sender: TObject);
    procedure Z1sbRLetFacClick(Sender: TObject);
    procedure Z2LetrasPendientesClick(Sender: TObject);
    procedure Z1sbMenuOtros4Click(Sender: TObject);
    procedure Z2bbtnRegLetrasClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Z1sbMnInf2Click(Sender: TObject);
    procedure Z1TransfDAOTClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Z2CuadroMensualClick(Sender: TObject);
    procedure Z1sbMovProvClick(Sender: TObject);
    procedure Z1sbRetCuartaClick(Sender: TObject);
    procedure Z1sbAbonosClick(Sender: TObject);
    procedure Z1sbMenuActAgRetClick(Sender: TObject);
  private
    { Private declarations }
    function  VerificaVersion: Boolean;

  public
    xTipoProv  : string; // variable usada para Provisiones y Otras Obligaciones (P,O)
    xTituProv  : string; // Caption del Form para Provisiones y Otras Obligaciones
    Mouse_X    : Integer;
    Mouse_Y    : Integer;
    nComponets : Integer;
    xSelDoc    : String;
    Mantc 		 : TMant;
    MRefe      : TMant;
    GProvision : TMant;
    GDetProvi  : TMant;
    GNCredito  : TMant;
    GLetras    : TMant;
    GPagares   : TMant;
    GPagos     : TMant;
    GCanjeDoc  : TMant;
    GIntermediacion : TMant;
    GRegLetras,GCCProv : TMant;
    GCtaCte    : TMant;
    GCtaCteDet : TMant;
    GNotiSunat  : TMant;
 // Inicio HPC_201801_CXP
 // Componentes de Filtro OASIS para Opciones de Dietas de Directorio
    GCargosDirect : TMant;
    GPlantillaDieta : TMant;
    GPlanillaDieta : TMant;
 // Fin HPC_201801_CXP
    xxCia, xxTDiario, xxAnoMM, xxNoReg : String;
    procedure CreaAccesos;
    procedure CreaOpciones;
    procedure SacaMenu(Sender: TObject);
    procedure ProvisionCreate(Sender: TObject);
    procedure ProvisionInsert(Sender: TObject);
    procedure ProvisionEdita(Sender: TObject; MantFields: TFields);
    procedure ProvisionDelete(Sender: TObject; MantFields: TFields);
    procedure PGridShow(Sender: TObject);
    procedure ProvisionActiva;
    procedure NCreditoActiva;
    procedure NCreditoInsert(Sender: TObject);
    procedure NCreditoEdita(Sender: TObject; MantFields: TFields);
    procedure LetrasActiva;
    procedure LetrasInsert(Sender: TObject);
    procedure LetrasEdita(Sender: TObject; MantFields: TFields);
    procedure PagaresActiva;
    procedure PagaresInsert(Sender: TObject);
    procedure PagaresEdita(Sender: TObject; MantFields: TFields);
    procedure PagosActiva;
    procedure PagosInsert(Sender: TObject);
    procedure PagosEdita(Sender: TObject; MantFields: TFields);
    procedure CanjeDocActiva;
    procedure CanjeDocInsert(Sender: TObject);
    procedure CanjeDocEdita(Sender: TObject; MantFields: TFields);
    function  FiltraDocGrid : Boolean;
    function  FiltraDocGrid1 : Boolean;
    function  TieneAcceso( xxTMant: TMant ): Boolean;
    procedure AdicCtaPrin(Sender: TObject);
    procedure EditaCtaPrin(Sender: TObject; MantFields: TFields);
    procedure DeleteCtaPrin(Sender: TObject; MantFields: TFields);
    procedure AdicMaesProv(Sender: TObject);
    procedure EditaMaesProv(Sender: TObject; MantFields: TFields);
    procedure BorraMaesProv(Sender: TObject; MantFields: TFields);
    procedure ToolProvCreate(Sender: TObject);
    //vhn
    procedure AdicProveNoti(Sender: TObject);
    procedure EditaProveNoti(Sender: TObject; MantFields: TFields);
    procedure BorraProveNoti(Sender: TObject; MantFields: TFields);
    // end vhn
    procedure UbiSitCreate(Sender: TObject);
    procedure ProcInsertOn( xxTMant:TMant; ccUser,ccFec,ccHor:String );
		procedure ToolLetrasCreate(Sender: TObject);
    //**02/02/2001 CIM
     procedure AdicCompensacion(Sender: TObject);
     procedure  EditaCompensacion(Sender: TObject; MantFields: TFields);
    //**
    //CIM 11/12/2001
     procedure IntermediacionActiva;
     procedure IntermediacionInsert(Sender: TObject);
     procedure IntermediacionEdita(Sender: TObject; MantFields: TFields);
     //CIM 26/06/2002
     procedure LetPendCreate(Sender: TObject);
     procedure RetPendCreate(Sender: TObject);
     procedure ToolsCreate(Sender: TObject);
     procedure CtaCteEdita(Sender: TObject; MantFields: TFields);
     procedure CtaCteDetEdita(Sender: TObject; MantFields: TFields);
     procedure PegaPanelToolRegLetras(Sender: TObject);
     procedure ToolsCCCreate(Sender: TObject);
     procedure ToolsCtaCteProv(Sender: TObject);
     procedure CtaCteProvEdita(Sender: TObject; MantFields: TFields);
     procedure cSQLCtaCte;
     procedure VistaCreateMant(Sender: TObject);
     procedure AbonosEdita(Sender: TObject; MantFields: TFields);
     procedure AplicaCreate(Sender: TObject);
     //
     procedure ProvisionCierra(Sender: TObject);
     procedure NCreditoCierra(Sender: TObject);
     procedure LetrasCierra(Sender: TObject);
     procedure PagaresCierra(Sender: TObject);
     procedure CompensacionCierra(Sender: TObject);
     procedure AbonosCierra(Sender: TObject);
     procedure IntermediacionCierra(Sender: TObject);
     procedure MaesProvCierra(Sender: TObject);
     procedure CtaCteProvCierra(Sender: TObject);
     procedure DetalleCierra(Sender: TObject);
     procedure LetPendCierra(Sender: TObject);
     procedure DocProvCierra(Sender: TObject);
     procedure RetPendCierra(Sender: TObject);
  // Inicio HPC_201801_CXP
  // Rutinas de actualización para Opciones de Dietas de Directorio
     Procedure CargDirectCreate(Sender: TObject);
     procedure CargDirectInsert(Sender: TObject);
     procedure CargDirectEdita(Sender: TObject; MantFields: TFields);
     procedure CargDirectDelete(Sender: TObject; MantFields: TFields);
     procedure CargDirectCierra(Sender: TObject);
     Procedure PlantillaDietaCreate(Sender: TObject);
     procedure PlantillaDietaInsert(Sender: TObject);
     procedure PlantillaDietaEdita(Sender: TObject; MantFields: TFields);
     procedure PlantillaDietaDelete(Sender: TObject; MantFields: TFields);
     procedure PlantillaDietaCierra(Sender: TObject);
     Procedure PlanillaDietaCreate(Sender: TObject);
     procedure PlanillaDietaInsert(Sender: TObject);
     procedure PlanillaDietaEdita(Sender: TObject; MantFields: TFields);
     procedure PlanillaDietaDelete(Sender: TObject; MantFields: TFields);
     procedure PlanillaDietaCierra(Sender: TObject);
     procedure PegaToolPlanillaDietas(Sender: TObject);
  // Fin HPC_201801_CXP
  end;

  procedure OPProvisionMant;       stdcall;
  procedure OPProvision;           stdcall;
  procedure OPNCreditoMant;        stdcall;
  procedure OPNCredito;            stdcall;
  procedure OPLetrasMant;          stdcall;
  procedure OPPTercerosMant;       stdcall;
  procedure OPCompensacionMant;    stdcall;
  procedure OPAplicaAbonosMant;    stdcall;
  procedure OPIntermediacionMant;  stdcall;
  procedure OPProveedoresMant;     stdcall;
  procedure OPCuentaCorriente;     stdcall;
  procedure OPDetalleProvisiones;  stdcall;
  procedure OPLetrasPendientes;    stdcall;
  procedure OPDocumentosProveedor; stdcall;
  procedure OPRetenciones4ta;      stdcall;
  procedure OPNotificadoSunat;     stdcall;
  procedure OPOrdenDePago;         stdcall;
  procedure OPRetenciones;         stdcall;
// Inicio HPC_201801_CXP
// Se incorpora las opciones para Dietas
  procedure OPCargosDirectorio;    stdcall;
  procedure OPPlantillaDietas;     stdcall;
  procedure OPPlanillaDietas;      stdcall;
// Fin HPC_201801_CXP
  procedure OPAgentesSunat;        stdcall;
// HPC_201401_CXP
   procedure OPVerificaVersion; stdcall;
// FIN HPC_201401_CXP


exports
  OPProvisionMant,

  OPProvision,

  OPNCreditoMant,

  OPNCredito,

  OPLetrasMant,

  OPPTercerosMant,

  OPCompensacionMant,

  OPAplicaAbonosMant,

  OPIntermediacionMant,

  OPProveedoresMant,

  OPCuentaCorriente,
  OPDetalleProvisiones,
  OPLetrasPendientes,
  OPDocumentosProveedor,
  OPRetenciones4ta,
  OPNotificadoSunat,
  OPOrdenDePago,
  OPRetenciones,
// Inicio HPC_201801_CXP
// Implementación de Dietas de Directorio
  OPCargosDirectorio,
  OPPlantillaDietas,
  OPPlanillaDietas,
// Fin HPC_201801_CXP
  OPAgentesSunat,
  OPVerificaVersion;

var
  FPrincipal: TFPrincipal;
  w_total : double;
  wTipoPago,Wtiporep:Boolean;
  wsalida : Boolean;
  wDocOP  : String;
  function  InicializaMant( wwwMant : TMant ) : Boolean;

implementation

Uses CxPDM,  CxP201, CxP202, CxP203, CxP101, CxP102, CxP205, CxP206,
     CxP207, CxP209, CxP200, CxP215, CxP777, CXP006,
     CxP778, CxP210, CxP407, CXP408, CxP208,
     CxP779, CxP900, CxP780, CxP216, CXP802, Cxp781, CXP803, CxP700,
     CXP420, CXP782, CXP805, CXP240, CxP222, CXP776, CXP242, CXP775,
// Inicio HPC_201801_CXP
// agrega CXP783 Tool de Planilla de Dietas de Directorio
     CXP260, CXP280, CXP284, CXP290, CXP291, CXP293, CXP783;
// Fin HPC_201801_CXP

// CXP260   FOrdenPago       Orden de Pago
// CXP280   FRetencion       Retenciones
// CXP284   FConsulta        AGENTES Y BUENOS CONTRIBUYENTES
// CXP776   FToolAplica
// CXP775   ToolProv
// CxP700   FToolCtaCteProv  Tool de cuenta corriente de proveedores
// CxP601   FCCuadreMovs     Conprobantes Contabilizados
// CXP776   FToolAplica      Aplicar Nota de Crédito
// CxP405   TFcrConCCos      Movimientos por conceptos y centros de costos
// CXP404   CFRepMov         Reporte de Movimientos
// CxP406   FLetrasProvisio  Letras Provisionadas
// CXP782   FToolRetPend     Retenciones de cuarta categoria
// CxP780   FToolLetPend     Letras pendientes  
// Inicio HPC_201801_CXP
// Formularios de Dietas de Directorio
// CXP290   FCargosDirectorio    Formulario de Cargos de Directorio
// CXP291   FPlantillaDieta      Plantilla de Dietas de Directorio
// CXP292   FPlantillaDetalle    Detalle de Conceptos Plantilla de Dietas de Directorio
// cxp293   FPlanillaDietasDetalle Planilla de Dietas de Directorio
// CXP783   FToolPlanillaDietas  Tool de Planilla de Dietas de Directorio
// Fin HPC_201801_CXP

{$R *.DFM}


//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////
///                                    ///
///   INICIO DE PROCEDURES EXPORTADOS  ///
///                                    ///
//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////


procedure OPAgentesSunat;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;

   if not Assigned( FPrincipal ) then
      FPrincipal:=TFPrincipal.Create( Application );
   try
     FConsulta := TFConsulta.Create( Application );
     FConsulta.ShowModal;
   finally
     FConsulta.Free;
   end;
end;


procedure OPRetenciones;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;

   if not Assigned( FPrincipal ) then
      FPrincipal:=TFPrincipal.Create( Application );
   try
     FRetencion := TFRetencion.Create( Application );
     FRetencion.ShowModal;
   finally
     FRetencion.Free;
   end;
end;

// Inicio HPC_201801_CXP
// Se incorpora las opciones para Dietas
procedure OPCargosDirectorio;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   If not DMCXP.wf_AccesoOpcion('3030310') then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   try
      if not Assigned( FPrincipal ) then
         FPrincipal:=TFPrincipal.Create( Application );
      if not (FPrincipal.GCargosDirect=nil) then Exit;
      FPrincipal.GCargosDirect := TMant.Create(Application);
      FPrincipal.GCargosDirect.Admin          := DMCXP.wAdmin;
      FPrincipal.GCargosDirect.OnInsert       := FPrincipal.CargDirectInsert;
      FPrincipal.GCargosDirect.OnEdit         := FPrincipal.CargDirectEdita;
      FPrincipal.GCargosDirect.OnDelete       := FPrincipal.CargDirectDelete;
      FPrincipal.GCargosDirect.OnShow         := FPrincipal.PGridShow;
      FPrincipal.GCargosDirect.OnCierra       := FPrincipal.CargDirectCierra;
      FPrincipal.GCargosDirect.DComC          := DMCXP.DCOM1;
      FPrincipal.GCargosDirect.ClientDataSet  := DMCXP.cdsCargDirect;
      FPrincipal.GCargosDirect.TableName      := 'CXP_CARGOS_DIRECT';
      FPrincipal.GCargosDirect.Titulo         := 'Cargos de Directorio';
      FPrincipal.GCargosDirect.User           := DMCXP.wUsuario;
      FPrincipal.GCargosDirect.Module         := DMCXP.wModulo;
      FPrincipal.GCargosDirect.SectionName    := 'CXPCargosDirectorio';
      FPrincipal.GCargosDirect.FileNameIni    := '\oaCXP.INI';
      FPrincipal.GCargosDirect.Execute;
      FVariables.w_Num_Formas:=FVariables.w_Num_Formas+1;
   finally
   end;

end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure OPPlantillaDietas;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;

   If not DMCXP.wf_AccesoOpcion('3030311') then Exit;

   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   try
      if not Assigned( FPrincipal ) then
         FPrincipal:=TFPrincipal.Create( Application );
      if not (FPrincipal.GCargosDirect=nil) then Exit;

      FPrincipal.GPlantillaDieta := TMant.Create(Application);
      FPrincipal.GPlantillaDieta.Admin          := DMCXP.wAdmin;
      FPrincipal.GPlantillaDieta.OnInsert       := FPrincipal.PlantillaDietaInsert;
      FPrincipal.GPlantillaDieta.OnEdit         := FPrincipal.PlantillaDietaEdita;
      FPrincipal.GPlantillaDieta.OnDelete       := FPrincipal.PlantillaDietaDelete;
      FPrincipal.GPlantillaDieta.OnShow         := FPrincipal.PGridShow;
      FPrincipal.GPlantillaDieta.OnCierra       := FPrincipal.PlantillaDietaCierra;
      FPrincipal.GPlantillaDieta.DComC          := DMCXP.DCOM1;
      FPrincipal.GPlantillaDieta.ClientDataSet  := DMCXP.cdsPlantillaCab;
      FPrincipal.GPlantillaDieta.TableName      := 'CXP_PLANT_DIETAS_CAB';
      FPrincipal.GPlantillaDieta.Titulo         := 'Plantillas de Dietas';
      FPrincipal.GPlantillaDieta.User           := DMCXP.wUsuario;
      FPrincipal.GPlantillaDieta.Module         := DMCXP.wModulo;
      FPrincipal.GPlantillaDieta.SectionName    := 'CXPPlantillasDietas';
      FPrincipal.GPlantillaDieta.FileNameIni    := '\oaCXP.INI';
      FPrincipal.GPlantillaDieta.Execute;
      FVariables.w_Num_Formas:=FVariables.w_Num_Formas+1;
   finally
   end;
end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure OPPlanillaDietas;
begin
//
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;

   If not DMCXP.wf_AccesoOpcion('3030312') then Exit;

   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;

   try
      if not Assigned( FPrincipal ) then
         FPrincipal:=TFPrincipal.Create( Application );
      if not (FPrincipal.GCargosDirect=nil) then Exit;

      FToolPlanillaDietas := TFToolPlanillaDietas.Create( Application );
      FToolPlanillaDietas.Visible := False;

      FPrincipal.GPlanillaDieta := TMant.Create(Application);
      FPrincipal.GPlanillaDieta.Admin          := DMCXP.wAdmin;
      FPrincipal.GPlanillaDieta.OnInsert       := FPrincipal.PlanillaDietaInsert;
      FPrincipal.GPlanillaDieta.OnEdit         := FPrincipal.PlanillaDietaEdita;
      FPrincipal.GPlanillaDieta.OnDelete       := FPrincipal.PlanillaDietaDelete;
      FPrincipal.GPlanillaDieta.OnCreateMant   := FPrincipal.PegaToolPlanillaDietas;
      FPrincipal.GPlanillaDieta.OnShow         := FPrincipal.PGridShow;
      FPrincipal.GPlanillaDieta.OnCierra       := FPrincipal.PlanillaDietaCierra;
      FPrincipal.GPlanillaDieta.DComC          := DMCXP.DCOM1;
      FPrincipal.GPlanillaDieta.ClientDataSet  := DMCXP.cdsPlanillaCab;
      FPrincipal.GPlanillaDieta.TableName      := 'CXP_PLANI_DIETAS_CAB';
      FPrincipal.GPlanillaDieta.Titulo         := 'Planillas de Dietas';
      FPrincipal.GPlanillaDieta.User           := DMCXP.wUsuario;
      FPrincipal.GPlanillaDieta.Module         := DMCXP.wModulo;
      FPrincipal.GPlanillaDieta.SectionName    := 'CXPPlanillasDietas';
      FPrincipal.GPlanillaDieta.FileNameIni    := '\oaCXP.INI';
      FPrincipal.GPlanillaDieta.Execute;
      FVariables.w_Num_Formas:=FVariables.w_Num_Formas+1;
   finally
   end;
end;
// Fin HPC_201801_CXP

procedure OPOrdenDePago;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   if not FVariables.w_OP_Registro  then
   begin
      if not Assigned( FPrincipal ) then
         FPrincipal:=TFPrincipal.Create( Application );

      DMCXP.wModo := 'A';
      FOrdenPago := TFOrdenPago.Create( Application );
      FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
      FOrdenPago.ShowModal;
   end
   else
   begin
      ShowMessage( 'Opcion en USO' );
   end
end;

procedure OPProvisionMant;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   try
      if not Assigned( FPrincipal ) then
         FPrincipal:=TFPrincipal.Create( Application );
      if not (FPrincipal.GProvision=nil) then Exit;

      FPrincipal.xTipoProv:='P';
      if not FPrincipal.FiltraDocGrid then Exit;
      FToolCont := TFToolCont.Create( Application );
      FToolCont.Visible := False;
      FToolCont.sbtNC.visible:= False;
      DMCXP.cdsMovCxP.IndexFieldNames:= '';
      DMCXP.cdsMovCxP.Filter         := '';
      DMCXP.cdsMovCxP.Filtered       := False;

      DMCXP.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FPrincipal.GProvision := TMant.Create( Application );
      FPrincipal.GProvision.Admin          := DMCXP.wAdmin;
      FPrincipal.GProvision.OnInsert       := FPrincipal.ProvisionInsert;
      FPrincipal.GProvision.OnEdit         := FPrincipal.ProvisionEdita;
      FPrincipal.GProvision.OnCreateMant   := FPrincipal.UbiSitCreate;
      FPrincipal.GProvision.OnDelete       := FPrincipal.ProvisionDelete;
      FPrincipal.GProvision.OnShow         := FPrincipal.PGridShow;
      FPrincipal.GProvision.OnCierra       := FPrincipal.ProvisionCierra;
      FPrincipal.GProvision.DComC          := DMCXP.DCom1;
      FPrincipal.GProvision.ClientDataSet  := DMCXP.cdsMovCxP;
      FPrincipal.GProvision.TableName      := 'CXP301';

      FPrincipal.GProvision.Filter         := '( '+FPrincipal.xSelDoc+') ';

      if DMCXp.cFilterCiaUser<>'' then
      begin
         if (FPrincipal.GProvision.Filter<>'')  then
            FPrincipal.GProvision.Filter   := FPrincipal.GProvision.Filter+' and '+DMCXP.cFilterCiaUser
         else
            FPrincipal.GProvision.Filter   := DMCXP.cFilterCiaUser;
      end;

      if (DMCXP.cFilterOrigenUser<>'') then
      begin
         if (FPrincipal.GProvision.Filter<>'')  then
            FPrincipal.GProvision.Filter   := FPrincipal.GProvision.Filter+' and '+DMCXP.cFilterOrigenUser
         else
            FPrincipal.GProvision.Filter   :=  DMCXP.cFilterOrigenUser;
      end;

      if (DMCXP.cFilterUsuarioUser<>'') then
      begin
         if (FPrincipal.GProvision.Filter<>'')  then
            FPrincipal.GProvision.Filter   := FPrincipal.GProvision.Filter+' and '+DMCXP.cFilterUsuarioUser
         else
            FPrincipal.GProvision.Filter   := DMCXP.cFilterUsuarioUser;
      end;

      FPrincipal.GProvision.Titulo         := 'Provisiones por Pagar';
      FPrincipal.GProvision.User           := DMCXP.wUsuario;
      FPrincipal.GProvision.Module         := DMCXP.wModulo;
      FPrincipal.GProvision.SectionName    := 'CXPProvisiones';
      FPrincipal.GProvision.FileNameIni    := '\oaCXP.INI';
      FPrincipal.GProvision.Execute;
      FVariables.w_Num_Formas:=FVariables.w_Num_Formas+1;
   finally
   end;
end;


procedure OPProvision;
var
   FProvision : TFProvision;
   xSQL : String;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   if not FVariables.w_OP_Registro  then
   begin
      if not Assigned( FPrincipal ) then
         FPrincipal:=TFPrincipal.Create( Application );

      xSQL:='Select * from CXP301 Where CIAID=''ZZ'' AND TDIARID=''ZZ''';
      DMCXP.cdsMovCxP.Close;
      DMCXP.cdsMovCxP.DataRequest( xSQL );
      DMCXP.cdsMovCxP.Open;
      DMCXP.wModo := 'A';
      FProvision := TFProvision.Create( Application );
      FProvision.xTituProv :='Provisiones';
      FProvision.xTipoProv :='P';
      FVariables.w_OP_Registro:=True;
      FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
      FProvision.ActiveMDIChild;
   end
   else
   begin
      ShowMessage( 'Opcion en USO' );
   end
end;



procedure OPNCreditoMant;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   try
      if not Assigned( FPrincipal ) then
         FPrincipal:=TFPrincipal.Create( Application );
      if not (FPrincipal.GNCredito=nil) then Exit;

      FPrincipal.xTipoProv:='N';
      if not FPrincipal.FiltraDocGrid then Exit;
      //
      FToolCont := TFToolCont.Create( Application );
      FToolCont.sbtABl.Visible := False ;
      FToolcont.sbtCBl.visible := False ;
      FToolcont.sbtNC.visible := True;
      FToolCont.Visible := False;

     //
      DMCXP.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FPrincipal.NCreditoActiva;
      FPrincipal.GNCredito := TMant.Create( Application );
      FPrincipal.GNCredito.OnCreateMant   := FPrincipal.UbiSitCreate;
      FPrincipal.GNCredito.Admin          := DMCXP.wAdmin;
      FPrincipal.GNCredito.OnInsert       := FPrincipal.NCreditoInsert;
      FPrincipal.GNCredito.OnEdit         := FPrincipal.NCreditoEdita;
      FPrincipal.GNCredito.OnShow         := FPrincipal.PGridShow;
      FPrincipal.GNCredito.DComC          := DMCXP.DCom1;
      FPrincipal.GNCredito.ClientDataSet  := DMCXP.cdsMovCxP2;
      FPrincipal.GNCredito.TableName      := 'CXP301';
      FPrincipal.GNCredito.Filter         := FPrincipal.xSelDoc;

      if DMCXP.cFilterCiaUser<>'' then
      begin
         if (FPrincipal.GNCredito.Filter<>'') then
            FPrincipal.GNCredito.Filter   := FPrincipal.GNCredito.Filter+' and '+DMCXP.cFilterCiaUser
         else
            FPrincipal.GNCredito.Filter   := DMCXP.cFilterCiaUser;
      end;

      if (DMCXP.cFilterOrigenUser<>'') then
      begin
         if (FPrincipal.GNCredito.Filter<>'') then
            FPrincipal.GNCredito.Filter   := FPrincipal.GNCredito.Filter+' and '+DMCXP.cFilterOrigenUser
         else
            FPrincipal.GNCredito.Filter   :=  DMCXP.cFilterOrigenUser;
      end;

      if (DMCXP.cFilterUsuarioUser<>'') then
      begin
         if (FPrincipal.GNCredito.Filter<>'') then
            FPrincipal.GNCredito.Filter   := FPrincipal.GNCredito.Filter+' and '+DMCXP.cFilterUsuarioUser
         else
            FPrincipal.GNCredito.Filter   := DMCXP.cFilterUsuarioUser;
      end;

      FPrincipal.GNCredito.Titulo         := 'Notas de Crédito';
      FPrincipal.GNCredito.OnCierra       := FPrincipal.NCreditoCierra;
      FPrincipal.GNCredito.User           := DMCXP.wUsuario;
      FPrincipal.GNCredito.Module         := DMCXP.wModulo ;
      FPrincipal.GNCredito.SectionName    := 'CXPNCredito';
      FPrincipal.GNCredito.FileNameIni    := '\oaCXP.INI';
      FPrincipal.GNCredito.Execute;
      FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   finally
      {
      DMCXP.cdsProv.Close;
      DMCXP.cdsDetCanje.Close;
      DMCXP.cdsDetCanje.IndexFieldNames:='';
      }
   end;
end;


procedure OPNCredito;
var
   xSQL : String;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if not FVariables.w_OP_Registro then
   begin
      xSQL:='Select * from CXP301 Where CIAID=''ZZ'' AND TDIARID=''ZZ''';
      DMCXP.cdsMovCxP2.Close;
      DMCXP.cdsMovCxP2.DataRequest( xSQL );
      DMCXP.cdsMovCxP2.Open;
      DMCXP.wModo:= 'A';

      FNotasDC := TFNotasDC.Create( Application );
      FNotasDC.xTipoProv :='N';
      if FPrincipal.FiltraDocGrid then
      begin
         FNotasDC.ActiveMDIChild;
         FVariables.w_OP_Registro:=True;
      end
      else
         FNotasDC.Close;
   end
   else
   begin
      ShowMessage( 'Opcion en USO' );
   end
end;


procedure OPLetrasMant;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   try
      if not Assigned( FPrincipal ) then
         FPrincipal:=TFPrincipal.Create( Application );
      if not (FPrincipal.GLetras=nil) then Exit;

      FPrincipal.xTipoProv  :='L';
      DMCXP.FiltraTabla( DMCXP.cdsCCBco,  'TGE106', 'CCBCOID');
      DMCXP.FiltraTabla( DMCXP.cdsSitua,  'CXC104', 'SITUAID');
      if not FPrincipal.FiltraDocGrid1 then Exit;

      DMCXP.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FPrincipal.LetrasActiva;
      ToolLetras := TToolLetras.Create( Application );
      ToolLetras.Visible := False;
      FPrincipal.GLetras := TMant.Create( Application );
      FPrincipal.GLetras.Admin          := DMCXP.wAdmin;
      FPrincipal.GLetras.OnCreateMant   := FPrincipal.ToolLetrasCreate;
      FPrincipal.GLetras.OnInsert       := FPrincipal.LetrasInsert;
      FPrincipal.GLetras.OnEdit         := FPrincipal.LetrasEdita;
      FPrincipal.GLetras.OnShow         := FPrincipal.PGridShow;
      FPrincipal.GLetras.OnCierra       := FPrincipal.LetrasCierra;
      FPrincipal.GLetras.ClientDataSet  := DMCXP.cdsCCanje;
      FPrincipal.GLetras.TableName      := 'CXP308';
      FPrincipal.GLetras.Filter         := 'TCANJEID=''LE''';
      FPrincipal.GLetras.Titulo         := 'Canje de Letras';
      FPrincipal.GLetras.User           := DMCXP.wUsuario;
      FPrincipal.GLetras.DComC          := DMCXP.DCom1;
      FPrincipal.GLetras.Module         := DMCXP.wModulo ;
      FPrincipal.GLetras.SectionName	  := 'CXPLetras';
      FPrincipal.GLetras.FileNameIni	  := '\oaCXP.INI';
      FPrincipal.GLetras.Execute;
      FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   finally
      {
      DMCXP.cdsLetras.close;
      DMCXP.cdsProv.Close;
      DMCXP.cdsTDoc.Filter  :='';
      DMCXP.cdsTDoc.Filtered:=False;
      }
   end;
end;


procedure OPPTercerosMant;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   try
      if not Assigned( FPrincipal ) then
         FPrincipal:=TFPrincipal.Create( Application );
      if not (FPrincipal.GPagares=nil) then Exit;

   	 FPrincipal.xTipoProv  := 'T';
	   if not FPrincipal.FiltraDocGrid then Exit;

     DMCXP.cdsCxP.IndexFieldNames:='';
     DMCXP.FiltraTabla(DMCXP.cdsBanco,'TGE105','BANCOID');
     DMCXP.FiltraTabla(DMCXP.cdsCCBco,'TGE106','CCBCOID');
     DMCXP.cdsBanco.Filter := '';
     DMCXP.cdsBanco.Filter := 'BCOTIPCTA<>''C''';
     DMCXP.cdsBanco.Filtered := True;
     //**
     DMCXP.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
     FPrincipal.PagaresActiva;
     FPrincipal.GPagares := TMant.Create( Application );
     FPrincipal.GPagares.Admin          := DMCXP.wAdmin;
     FPrincipal.GPagares.OnInsert       := FPrincipal.PagaresInsert;
     FPrincipal.GPagares.OnEdit         := FPrincipal.PagaresEdita;
     FPrincipal.GPagares.OnShow         := FPrincipal.PGridShow;
     FPrincipal.GPagares.OnCierra       := FPrincipal.PagaresCierra;
     FPrincipal.GPagares.DComC          := DMCXP.DCom1;
     FPrincipal.GPagares.ClientDataSet  := DMCXP.cdsPagare;
     FPrincipal.GPagares.TableName      := 'CXP306';
     FPrincipal.GPagares.Filter         := '';//xSelDoc;
     FPrincipal.GPagares.Titulo         := 'Prestamos de Terceros';
     FPrincipal.GPagares.User           := DMCXP.wUsuario;
     FPrincipal.GPagares.Module         := DMCXP.wModulo ;
     FPrincipal.GPagares.SectionName:='CXPPagares';
     FPrincipal.GPagares.FileNameIni:='\oaCXP.INI';
     FPrincipal.GPagares.Execute;
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   finally
     {
      DMCXP.cdsProv.Close;
      DMCXP.cdsCxP.IndexFieldNames:='';
     }
   end
end;


procedure OPCompensacionMant;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   try
     if not Assigned( FPrincipal ) then
         FPrincipal:=TFPrincipal.Create( Application );
     if not (FPrincipal.Mantc=nil) then Exit;

     DMCXP.cdsCxP.IndexFieldNames:='';
     xSQL:='select * From TGE104 Where REGISTRO=''R''';
     DMCXP.cdsQry6.Close;
     DMCXP.cdsQry6.DataRequest(xSQL);
     DMCXP.cdsQry6.Open;
     if DMCXP.cdsQry6.Recordcount=0 then begin
        ShowMessage( 'Error : Falta Registrar el T.Diario de Compensación');
        Exit;
     end;
       DMCXP.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   	 FPrincipal.Mantc := TMant.Create( Application );
		 FPrincipal.Mantc.Admin     		 :=DMCXP.wAdmin;
		 FPrincipal.Mantc.User      		 :=DMCXP.wUsuario;
		 FPrincipal.Mantc.DComC 			   :=DMCXP.DCOM1;
		 FPrincipal.Mantc.Titulo    		 :='Compensación';
		 FPrincipal.Mantc.Module    		 :=DMCXP.wModulo;
		 FPrincipal.Mantc.Tablename 		 :='CXP310';
		 FPrincipal.Mantc.Filter    		 :='';
		 FPrincipal.Mantc.ClientDataset  :=DMCXP.cdsCjeCxC;
		 FPrincipal.Mantc.OnInsert  		 :=FPrincipal.AdicCompensacion ;
		 FPrincipal.Mantc.OnEdit    		 :=FPrincipal.EditaCompensacion ;
     FPrincipal.Mantc.OnCierra       :=FPrincipal.CompensacionCierra;
		 FPrincipal.Mantc.OnDelete       :=Nil;//OnDeleteProv;
		 FPrincipal.Mantc.OnCreateMant   :=Nil ;
		 FPrincipal.Mantc.SectionName		 :='CXPCompensacion';
		 FPrincipal.Mantc.FileNameIni		 :='\oaCXP.INI';
		 FPrincipal.Mantc.Execute;
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
 	 Finally
      {
      DMCXP.cdsQry6.Close;
      DMCXP.cdsCxP.IndexFieldNames:='';
      DMCXP.cdsQry3.Close;
      DMCXP.cdsQry3.ProviderName := 'dspTGE';
      }
   end;
end;


procedure OPAplicaAbonosMant;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   try
     if not Assigned( FPrincipal ) then
        FPrincipal:=TFPrincipal.Create( Application );
     if not (FPrincipal.GLetras=nil) then Exit;

     FPrincipal.xTipoProv  :='L';

     if not FPrincipal.FiltraDocGrid1 then Exit;

     FToolAplica := TFToolAplica.Create( Application );
     FToolAplica.Visible := False;

     DMCXP.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
     FPrincipal.GLetras := TMant.Create( Application );
     FPrincipal.GLetras.Admin          := DMCXP.wAdmin;
     FPrincipal.GLetras.OnCreateMant   := FPrincipal.AplicaCreate;
     FPrincipal.GLetras.OnInsert       := Nil; // LetrasInsert;
     FPrincipal.GLetras.OnEdit         := FPrincipal.AbonosEdita;
     FPrincipal.GLetras.OnShow         := FPrincipal.PGridShow;
     FPrincipal.GLetras.OnCierra       := FPrincipal.AbonosCierra;
     FPrincipal.GLetras.ClientDataSet  := DMCXP.cdsCCanje;
     FPrincipal.GLetras.TableName      := 'CXP308';
     FPrincipal.GLetras.Filter         := '( CXP308.TCANJEID=''CA'' or CXP308.TCANJEID=''NC'' )';

     if (DMCXP.cFilterCiaUser<>'') then
     begin
         if (FPrincipal.GLetras.Filter<>'') and (DMCXP.cFilterCiaUser<>'') then
            FPrincipal.GLetras.Filter   := FPrincipal.GLetras.Filter+' and '+DMCXP.cFilterCiaUser
         else
            FPrincipal.GLetras.Filter   := DMCXP.cFilterCiaUser;
     end;

     FPrincipal.GLetras.Titulo         := 'Aplicación de Abonos';
     FPrincipal.GLetras.User           := DMCXP.wUsuario;
     FPrincipal.GLetras.DComC          := DMCXP.DCOM1;
     FPrincipal.GLetras.Module         := DMCXP.wModulo ;
     FPrincipal.GLetras.SectionName	  := 'CXPAbonos';
     FPrincipal.GLetras.FileNameIni	  := '\oaCXP.INI';
     FPrincipal.GLetras.Execute;
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   finally
     {
     DMCXP.cdsLetras.close;
     DMCXP.cdsProv.Close;
     DMCXP.cdsTDoc.Filter  :='';
     DMCXP.cdsTDoc.Filtered:=False;
     DMCXP.cdsDetCanje.IndexFieldNames:='';
     }
   end;
end;


procedure OPIntermediacionMant;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   try
     if not Assigned( FPrincipal ) then
        FPrincipal:=TFPrincipal.Create( Application );
     if not (FPrincipal.GIntermediacion=nil) then Exit;

     FPrincipal.xTipoProv  :='I';
     if not FPrincipal.FiltraDocGrid then Exit;

     DMCXP.cdsCxP.IndexFieldNames:='';
     DMCXP.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
     FPrincipal.IntermediacionActiva;
     FPrincipal.GIntermediacion := TMant.Create( Application );
     FPrincipal.GIntermediacion.OnCreateMant   := NIL;
     FPrincipal.GIntermediacion.Admin          := DMCXP.wAdmin;
     FPrincipal.GIntermediacion.OnInsert       := FPrincipal.IntermediacionInsert;
     FPrincipal.GIntermediacion.OnEdit         := FPrincipal.IntermediacionEdita;
     FPrincipal.GIntermediacion.OnShow         := FPrincipal.PGridShow;
     FPrincipal.GIntermediacion.OnCierra       := FPrincipal.IntermediacionCierra;
     FPrincipal.GIntermediacion.DComC          := DMCXP.DCom1;
     FPrincipal.GIntermediacion.ClientDataSet  := DMCXP.cdsMovCxP2;
     FPrincipal.GIntermediacion.TableName      := 'CXP301';
     FPrincipal.GIntermediacion.Filter         := FPrincipal.xSelDoc;
     FPrincipal.GIntermediacion.Titulo         := 'Intermediación';
     FPrincipal.GIntermediacion.User           := DMCXP.wUsuario;
     FPrincipal.GIntermediacion.Module         := DMCXP.wModulo ;
     FPrincipal.GIntermediacion.SectionName    := 'CXPIntermediacion';
     FPrincipal.GIntermediacion.FileNameIni    := '\oaCXP.INI';
     FPrincipal.GIntermediacion.Execute;
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   finally
     //DMCXP.cdsCxP.IndexFieldNames:='';
   end;
end;


procedure OPProveedoresMant;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   try
      if not Assigned( FPrincipal ) then
         FPrincipal:=TFPrincipal.Create( Application );
      if not (FPrincipal.Mantc=nil) then Exit;

      FToolProv := TFToolProv.Create( Application );
      FToolProv.Visible := False;
//      FToolProv.bbtnActiva.visible:= False;

      DMCXP.FiltraTabla( DMCXP.cdsPais,    'TGE118', 'PaisId');

   // DEPARTAMENTOS
      xSQL := 'SELECT SUBSTR(UBIGEOID,1,2) DPTOID,UBIGEODPTO DPTODES '
             +'FROM TGE147 '
             +'WHERE UBIGEOPROV IS NULL and SUBSTR(UBIGEOID,1,2)<>''00'' '
             +'ORDER BY UBIGEOID';
      FiltraCds(DMCXP.cdsDpto,xSQL);
      DMCXP.cdsDpto.IndexFieldNames:='DPTOID';

   // PROVINCIAS
      xSQL := 'SELECT SUBSTR(UBIGEOID,1,2) DPTOID, SUBSTR(UBIGEOID,3,2) CIUDID,UBIGEOPROV CIUDDES '
             +'FROM TGE147 '
             +'WHERE UBIGEOPROV IS NOT NULL AND UBIGEODIST IS NULL';
      FiltraCds(DMCXP.cdsProvinc,xSQL);
      DMCXP.cdsProvinc.IndexFieldNames:='CIUDID';

   // DISTRITO
      xSQL := 'SELECT SUBSTR(UBIGEOID,1,2) DPTOID, SUBSTR(UBIGEOID,3,2) CIUDID,SUBSTR(UBIGEOID,5,2) ZIPID,UBIGEODIST ZIPDES '
             +'FROM TGE147 '
             +'WHERE UBIGEOPROV IS NOT NULL AND UBIGEODIST IS NOT NULL';
      FiltraCds(DMCXP.cdsDistrito,xSQL);
      DMCXP.cdsDistrito.IndexFieldNames:='ZIPID';

   // SEXO
      DMCXP.FiltraTabla( DMCXP.cdsQry15,  'TGE817', 'ID');

   // TIPO DE DOCUMENTO
      DMCXP.FiltraTabla( DMCXP.cdsQry14,  'SUNAT101', 'TIPDOCID');

   // TIPO DE VIA
      DMCXP.FiltraTabla( DMCXP.cdsQry13,  'TGE145', 'TIPVIAID');

   // TIPO DE ZONA
      DMCXP.FiltraTabla( DMCXP.cdsQry12,  'TGE146', 'TIPZONAID');

      DMCXP.FiltraTabla( DMCXP.cdsSecEco,  'TGE163', 'SecEcoId');
      DMCXP.FiltraTabla( DMCXP.cdsGiro,    'TGE116', 'GiroId');
      DMCXP.FiltraTabla( DMCXP.cdsClasif,  'TGE132', 'ClasifId');
      DMCXP.FiltraTabla( DMCXP.cdsBanco,   'TGE105', 'BANCOID');
      DMCXP.FiltraTabla( DMCXP.cdsSitua,   'CXC104', 'SITUAID');
      DMCXP.FiltraTabla( DMCXP.cdsTipProv, 'TGE134', 'TIPPROVID');
      DMCXP.FiltraTabla( DMCXP.cdsClAux,   'TGE102', 'ClauxId');
      DMCXP.FiltraTabla( DMCXP.cdsGArti,   'TGE131', 'GRARID');

      DMCXP.cdsProv.IndexFieldNames:= '';

      DMCXP.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FPrincipal.Mantc := TMant.Create( Application );
      FPrincipal.Mantc.Admin     		 := DMCXP.wAdmin;
		  FPrincipal.Mantc.User      		 := DMCXP.wUsuario;
		  FPrincipal.Mantc.DComC 				 := DMCXP.DCOM1;
		  FPrincipal.Mantc.Titulo    		 := 'Maestro de Proveedores' ;
		  FPrincipal.Mantc.Module    		 := DMCXP.wModulo;
		  FPrincipal.Mantc.Tablename 		 := 'TGE201' ;
		  FPrincipal.Mantc.Filter    		 := '' ;
		  FPrincipal.Mantc.ClientDataset := DMCXP.cdsProv ;
		  FPrincipal.Mantc.OnInsert  		 := FPrincipal.AdicMaesProv ;
		  FPrincipal.Mantc.OnEdit    		 := FPrincipal.EditaMaesProv ;
		  FPrincipal.Mantc.OnDelete      := FPrincipal.BorraMaesProv ;
      FPrincipal.Mantc.OnCierra      := FPrincipal.MaesProvCierra;
		  FPrincipal.Mantc.OnCreateMant  := FPrincipal.ToolProvCreate;
		  FPrincipal.Mantc.SectionName	 := 'CXPProveedores';
		  FPrincipal.Mantc.FileNameIni	 := '\oaCXP.INI';
		  FPrincipal.Mantc.Execute;
      FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
	Finally
	end;
end;


procedure OPNotificadoSunat;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;

   try
      if not Assigned( FPrincipal ) then
         FPrincipal:=TFPrincipal.Create( Application );

      if not (FPrincipal.GNotiSunat=nil) then Exit;

      Filtracds( DMCXP.cdsProv, 'SELECT CLAUXID, PROV, PROVRUC, PROVDES FROM TGE201 WHERE CLAUXID=''P''' );

      DMCXP.cdsPagare.IndexFieldNames:= '';
      DMCXP.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa

  	  FPrincipal.GNotiSunat := TMant.Create( Application );
		  FPrincipal.GNotiSunat.Admin     		 := DMCXP.wAdmin;
	 		FPrincipal.GNotiSunat.User      		 := DMCXP.wUsuario;
			FPrincipal.GNotiSunat.DComC 				 := DMCXP.DCOM1;
			FPrincipal.GNotiSunat.Titulo    		 := 'Proveedores Notificados por la SUNAT' ;
			FPrincipal.GNotiSunat.Module    		 := DMCXP.wModulo;
			FPrincipal.GNotiSunat.Tablename 		 := 'CXP_PRO_NOT_SUN' ;
			FPrincipal.GNotiSunat.Filter    		 := '' ;
			FPrincipal.GNotiSunat.ClientDataset  := DMCXP.cdsPagare;
			FPrincipal.GNotiSunat.OnInsert  		 := FPrincipal.AdicProveNoti;
			FPrincipal.GNotiSunat.OnEdit    		 := FPrincipal.EditaProveNoti;
			FPrincipal.GNotiSunat.OnDelete       := FPrincipal.BorraProveNoti;
      FPrincipal.GNotiSunat.OnCierra       := FPrincipal.MaesProvCierra;
			FPrincipal.GNotiSunat.OnCreateMant   := Nil ;
			FPrincipal.GNotiSunat.SectionName	   := 'CXPNotificados';
			FPrincipal.GNotiSunat.FileNameIni	   := '\oaCXP.INI';
			FPrincipal.GNotiSunat.Execute;
      FVariables.w_Num_Formas        := FVariables.w_Num_Formas+1;
	 finally
	 end;
end;



procedure OPCuentaCorriente;
var
  xSQL : string;
  wAno, wMes, wDia : word;
	xMesAnt, xMesAct, xAnoAct : String;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   try

     if not Assigned( FPrincipal ) then
        FPrincipal:=TFPrincipal.Create( Application );

     if not (FPrincipal.GCtaCte=nil) then Exit;

     // apertura Tabla de Tipos de Documento
     xSQL := 'SELECT * FROM TGE110 WHERE DOCMOD='''+DMCXP.wModulo+''' ';
     DMCXP.cdsTDoc.Close;
     DMCXP.cdsTDoc.IndexFieldNames:='DOCID';
     DMCXP.cdsTDoc.Filter:='';
     DMCXP.cdsTDoc.DataRequest(xSQL);
     DMCXP.cdsTDoc.Open;

     Decodedate(date,wAno,wMes,wDia);
     xMesAct := strzero(inttostr(wMes),2);
     if xMesAct='01' then
        xMesAnt:='00'
     else
        xMesAnt:=strzero(inttostr(wMes-1),2);
     xAnoAct := inttostr(wAno);

     if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
     begin
        xSQL:='SELECT A.CLAUXID, S.CLAUXDES, '+
              'A.PROV, A.PROVDES, A.PROVDIR, A.PROVCZIP, D.ZIPDES, A.PROVTELF, '+
              'A.PROVFAX, A.PROVEMAI, A.PROVDNI, A.PROVRUC, A.PROVUFMOV '+
              'FROM TGE201 A '+
              'LEFT JOIN TGE122 D ON (D.ZIPID=A.PROVCZIP) '+
              'LEFT JOIN TGE102 S ON (S.CLAUXID=A.CLAUXID) '+
              'WHERE PROV=''@&%$'' ';
     end;
     if (SRV_D = 'ORACLE') then
     begin
     // TGE201 Maestro de Proveedores
     // TGE122 Distritos
     // TGE102 Clase de Auxiliar
     // TGE401 Saldos del Proveedor
        xSQL:='SELECT A.CLAUXID, S.CLAUXDES, '
             +'A.PROV, A.PROVDES, A.PROVDIR, A.PROVCZIP, D.ZIPDES, A.PROVTELF, '
             +'A.PROVFAX, A.PROVEMAI, A.PROVDNI, A.PROVRUC, A.PROVUFMOV '
             +'FROM TGE201 A, TGE122 D, TGE102 S '
             +'WHERE D.ZIPID(+)=A.PROVCZIP '
             +'  AND S.CLAUXID(+)=A.CLAUXID '
             +'AND PROV=''@&%$'' ';
     end;

     xSQL:='Select * From ( '+xSQL+' ) SOLVISTA ';

     FToolCtaCteProv 		 := TFToolCtaCteProv.create( Application );
     FToolCtaCteProv.Ano := wAno;
     FToolCtaCteProv.Mes := wMes;

     DMCXP.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
     FPrincipal.GCtaCte                := TMant.Create( Application );
     FPrincipal.GCtaCte.Admin          := DMCXP.wAdmin;
     FPrincipal.GCtaCte.Titulo         := 'Cuenta Corriente de Proveedores' ;
     FPrincipal.GCtaCte.OnCreateMant   := FPrincipal.ToolsCtaCteProv;
     FPrincipal.GCtaCte.dcOMc          := DMCXP.DCOM1;
     FPrincipal.GCtaCte.UsuarioSQL.Clear;
     FPrincipal.GCtaCte.UsuarioSQL.Add( xSQL );
     FPrincipal.GCtaCte.User           := DMCXP.wUsuario;
     FPrincipal.GCtaCte.ClientDataset  := DMCXP.cdsCXP;
     FPrincipal.GCtaCte.Module         := DMCXP.wModulo ;
     FPrincipal.GCtaCte.TableName      := 'VWCXPCTACTEPROV';
     FPrincipal.GCtaCte.Filter         := '';
     FPrincipal.GCtaCte.OnEdit         := FPrincipal.CtaCteProvEdita;
     FPrincipal.GCtaCte.OnCierra       := FPrincipal.CtaCteProvCierra;
     FPrincipal.GCtaCte.OnDelete       := NIL;
     FPrincipal.GCtaCte.OnInsert       := NIL;
     FPrincipal.GCtaCte.SectionName    :='ProvCtaCte';
     FPrincipal.GCtaCte.FileNameIni    :='\oaCXP.INI';
     FPrincipal.GCtaCte.Execute;
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   Finally
     {
     DMCXP.cdsQry2.Close;
     DMCXP.cdsQry2.filter :='';
     DMCXP.cdsQry2.filtered := False;
     DMCXP.cdsQry2.indexfieldnames :='';
     DMCXP.cdsQry5.Close;
     DMCXP.cdsQry5.filter :='';
     DMCXP.cdsQry5.filtered := False;
     DMCXP.cdsQry5.indexfieldnames :='';
     DMCXP.cdsQry6.Close;
     DMCXP.cdsQry6.filter             := '';
     DMCXP.cdsQry6.filtered           := False;
     DMCXP.cdsQry6.indexfieldnames    := '';
     DMCXP.cdsReporte.CLOSE;
     DMCXP.cdsReporte.filter          := '';
     DMCXP.cdsReporte.filtered        := False;
     DMCXP.cdsReporte.indexfieldnames := '';
     DMCXP.cdsCxP.filter          := '';
     DMCXP.cdsCxP.filtered        := False;
     DMCXP.cdsCxP.indexfieldnames := '';
     }
  end;
end;

procedure OPDetalleProvisiones;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   try
     if not Assigned( FPrincipal ) then
        FPrincipal:=TFPrincipal.Create( Application );
     if not (FPrincipal.GDetProvi=nil) then Exit;

     FPrincipal.xTipoProv  := 'P';
     DMCXP.cdsTDoc.Filter:='';
     DMCXP.cdsTDoc.Filter:='DOC_FREG='''+FPrincipal.xTipoProv+''' and DOCMOD='''+DMCXP.wModulo+'''';
     DMCXP.cdsTDoc.Filtered:=True;

     FPrincipal.xSelDoc := '';
     while not DMCXP.cdsTDoc.Eof do begin
        if Length(FPrincipal.xSelDoc)=0 then
           FPrincipal.xSelDoc:='( CXP302.DOCID='''+DMCXP.cdsTDoc.FieldByName('DocId').AsString+''''
        else
           FPrincipal.xSelDoc:=FPrincipal.xSelDoc+' or CXP302.DOCID='''+DMCXP.cdsTDoc.FieldByName('DOCID').AsString+'''';
        DMCXP.cdsTDoc.Next;
     end;
     if Length( FPrincipal.xSelDoc )=0 then
        Raise Exception.Create('No Existen Tipos de Documentos Registrados para Esta Opcion');

     FPrincipal.xSelDoc:=FPrincipal.xSelDoc+') and '+DMCXP.wReplacCeros+'(CXP302.DCPESTDO,'''')<>''A'' '
                        +'  and '+DMCXP.wReplacCeros+'(CXP302.DCPESTDO,'''')<>''E'' ';

    DMCXP.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
    FPrincipal.GDetProvi:=TMant.Create( Application );
    FPrincipal.GDetProvi.Admin          := DMCXP.wAdmin;
    FPrincipal.GDetProvi.DComC          := DMCXP.DCom1;
    FPrincipal.GDetProvi.OnCierra       := FPrincipal.DetalleCierra;
    FPrincipal.GDetProvi.ClientDataSet  := DMCXP.cdsDetCxP;
    FPrincipal.GDetProvi.TableName      := 'CXP302';
    FPrincipal.GDetProvi.Filter         := FPrincipal.xSelDoc;

    if (DMCXP.cFilterCiaUser<>'') then
    begin
       if (FPrincipal.GDetProvi.Filter<>'') then
          FPrincipal.GDetProvi.Filter   := FPrincipal.GDetProvi.Filter+' and '+DMCXP.cFilterCiaUser
       else
          FPrincipal.GDetProvi.Filter   := DMCXP.cFilterCiaUser;
    end;

    if (DMCXP.cFilterOrigenUser<>'') then
    begin
       if (FPrincipal.GDetProvi.Filter<>'') then
          FPrincipal.GDetProvi.Filter   := FPrincipal.GDetProvi.Filter+' and '+DMCXP.cFilterOrigenUser
       else
          FPrincipal.GDetProvi.Filter   :=  DMCXP.cFilterOrigenUser;
    end;

    if (DMCXP.cFilterUsuarioUserDet<>'') then
    begin
       if (FPrincipal.GDetProvi.Filter<>'') then
          FPrincipal.GDetProvi.Filter   := FPrincipal.GDetProvi.Filter+' and '+DMCXP.cFilterUsuarioUserDet
       else
          FPrincipal.GDetProvi.Filter   := DMCXP.cFilterUsuarioUserDet;
    end;

    FPrincipal.GDetProvi.Titulo         := 'Detalle Provisiones por Pagar';
    FPrincipal.GDetProvi.User           := DMCXP.wUsuario;
    FPrincipal.GDetProvi.Module         := DMCXP.wModulo ;
    FPrincipal.GDetProvi.SectionName    := 'CXPDetalleProvision';
    FPrincipal.GDetProvi.FileNameIni    := '\oaCXP.INI';
    FPrincipal.GDetProvi.OnInsert       := nil;
    FPrincipal.GDetProvi.OnEdit         := nil;
    FPrincipal.GDetProvi.OnCreateMant   := nil;
    FPrincipal.GDetProvi.OnDelete       := nil;
    FPrincipal.GDetProvi.OnShow         := nil;
    FPrincipal.GDetProvi.Execute;
    FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
  finally
    //GDetProvi.Free;
  end;
end;


procedure OPLetrasPendientes;
var
   xSQL, xDoc1, xDoc2, xTmonEuro : String;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   try
     if not Assigned( FPrincipal ) then
        FPrincipal:=TFPrincipal.Create( Application );
     if not (FPrincipal.Mantc=nil) then Exit;

     // 26/06/2002 Consulta de Letras Pendiente a pedidom de JCC
     //exclusiva para Inoresa
     //se ha utilizado codigo duro por premura del tiempo a pedido de JCC
     xDoc1 :='08';
     xDoc2 :='93';
     xLote :='08';
     xTmonEuro :='04';
     xSQL:=' SELECT  CIAID,CPANOMES,CPMM,CPSS,CPAAAA,CPNOREG,CPNODOC,CPFVCMTO,PROVDES, '+
          '  ''                '' OBSERVACION,TMONID,'+
          ' CASE WHEN TMONID='+Quotedstr(DMCXP.wTMonLoc)+' THEN CPMTOORI ELSE 0  END MTOLOC ,'+
          ' CASE WHEN TMONID='+Quotedstr(DMCXP.wTMonExt)+' THEN CPMTOORI ELSE 0  END MTOEXT ,'+
          ' CASE WHEN TMONID='+Quotedstr(xTMonEuro)+' THEN CPMTOORI ELSE 0  END MTOEURO , '+
          ' CPMTOLOC  SOLOSOLES,PROV,CPCANJE FROM CXP301 '+
          ' WHERE (CIAID=''01'''+
          ' AND'+
          '( (DOCID='+Quotedstr(xDoc1)+' OR DOCID='+Quotedstr(xDoc2)+')'+
          ' AND   DCPLOTE<>'+Quotedstr(xLote)+
          ' )'+
          ' AND CPESTADO=''P'''+
          ' AND CPFEMIS<='+DMCXP.wRepFecServi+
          ' )'+
          '  OR (CIAID=''01'' AND  DCPLOTE='+Quotedstr(xLote)+' AND CPESTADO=''P'''+
          ' AND CPFEMIS<='+DMCXP.wRepFecServi+
          ')'+
          ' ORDER BY CPAAAA,CPMM,CPSS';

     FToolLetPend := TFToolLetPend.Create( Application );
     FToolLetPend.Visible := False;

     DMCXP.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
     FPrincipal.Mantc                := TMant.Create( Application );
     FPrincipal.Mantc.Admin          := DMCXP.wAdmin;
     FPrincipal.Mantc.DComC          := DMCXP.DCOM1;
     FPrincipal.Mantc.OnEdit         := Nil;
     FPrincipal.Mantc.OnShow         := FPrincipal.PGridShow;
     FPrincipal.Mantc.OnCierra       := FPrincipal.LetPendCierra;
     FPrincipal.Mantc.UsuarioSQL.Add(xSQL) ;
     FPrincipal.Mantc.Module         := DMCXP.wModulo;
     FPrincipal.Mantc.ClientDataSet  := DMCXP.cdsReporte;
     FPrincipal.Mantc.OnCreateMant   := FPrincipal.LetPendCreate;
     FPrincipal.Mantc.TableName      := 'VWCXPLETPEND';
     FPrincipal.Mantc.Titulo         := 'Consulta de Letras Pendientes';
     FPrincipal.Mantc.User           := DMCXP.wUsuario;
     FPrincipal.Mantc.SectionName    :='CXPLetPend';
     FPrincipal.Mantc.FileNameIni    :='\oaCXP.INI';
     FPrincipal.Mantc.Execute;
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   finally
   end;
end;


procedure OPDocumentosProveedor;
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
   try
     if not Assigned( FPrincipal ) then
         FPrincipal:=TFPrincipal.Create( Application );
     if not (FPrincipal.GProvision=nil) then Exit;

     xSQL:='Select * From ( '
        +'select A.CIAID, B.CIADES, A.CPANOMES, A.TDIARID, CPNOREG, C.TDIARDES, '
        +   'A.CLAUXID, D.CLAUXDES, A.PROV, A.PROVRUC, E.PROVDES, '
        +   'PROV_PROC, DESCRIP PROCEDENCIA, DCPLOTE, A.DOCID, A.CPSERIE, '
        +   'A.CPNODOC, CPFCMPRB, CPFEMIS, CPFVCMTO, A.TMONID, '
        +   'G.TMONDES, G.TMONABR, CPTCAMPR, CPESTADO, ESTDOCDES,  CP_CONTA, '
        +   'A.CPMTOORI, A.CPMTOLOC, A.CPMTOEXT, A.CPSALORI, A.CPSALLOC, A.CPSALEXT, '
        +   'A.CPTOTOT, I.CPTODES '
        +'FROM CXP301 A, TGE101 B, TGE104 C, TGE102 D, TGE201 E, TGE829 F, '
        +  'TGE103 G, TGE115 H, CXP201 I '
        +'WHERE A.CIAID=B.CIAID AND A.TDIARID=C.TDIARID AND A.CLAUXID=D.CLAUXID '
        +  'AND A.CLAUXID=E.CLAUXID AND A.PROV=E.PROV AND E.PROV_PROC=F.ID '
        +  'AND A.TMONID=G.TMONID AND CPESTADO=ESTDOCID '
        +  'AND A.CIAID=I.CIAID AND A.CPTOTOT=I.CPTOID '
        +' ) SOLVISTA '
        +'ORDER BY CIAID, PROV_PROC, PROV, TMONID, CPFCMPRB';

      FToolVista := TFToolVista.Create( Application );

      DMCXP.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FPrincipal.GProvision := TMant.Create( Application );
      FPrincipal.GProvision.Admin          := DMCXP.wAdmin;
      FPrincipal.GProvision.DComC          := DMCXP.DCom1;
      FPrincipal.GProvision.ClientDataSet  := DMCXP.cdsMovCxP;
      FPrincipal.GProvision.TableName      := 'VWCXPMOVPROV';
      FPrincipal.GProvision.Filter         := FPrincipal.xSelDoc;
      FPrincipal.GProvision.Titulo         := 'Movimientos por Proveedores';
      FPrincipal.GProvision.User           := DMCXP.wUsuario;
      FPrincipal.GProvision.Module         := DMCXP.wModulo ;
      FPrincipal.GProvision.OnCierra       := FPrincipal.DocProvCierra;
      FPrincipal.GProvision.SectionName    := 'CXPMovProv';
      FPrincipal.GProvision.FileNameIni    := '\oaCXP.INI';
      FPrincipal.GProvision.OnCreateMant   := FPrincipal.VistaCreateMant;
      FPrincipal.GProvision.UsuarioSQL.Add( xSQL );
      FPrincipal.GProvision.Execute;
      FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   finally
      //GProvision.Free;
      //FToolVista.Free;
   end;
end;



procedure OPRetenciones4ta;
var
   xSQL : string;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   try
     if not Assigned( FPrincipal ) then
        FPrincipal:=TFPrincipal.Create( Application );
     if not (FPrincipal.Mantc=nil) then Exit;

     xSQL:='SELECT A.CIAID, A.CPANOMES, A.TDIARID, A.CPNOREG, A.CLAUXID, A.PROV, A.PROVRUC, '
       +  'A.PROVDES, A.DOCID, A.CPSERIE, A.CPNODOC, A.CPFEMIS, '
       +  'A.TMONID, A.CPTCAMPR, A.CPESTADO, A.CP_CONTA, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPGRAVAD ELSE 0 END BASEME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPIGV*-1 ELSE 0 END CUARME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPISC*-1 ELSE 0 END IESME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPMTOORI ELSE 0 END TOTME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPGRAVAD ELSE A.CPGRAVAD END BASEMN, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPIGV    ELSE A.CPIGV    END CUARMN, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPISC    ELSE A.CPISC    END IESMN, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPMTOLOC ELSE A.CPMTOLOC END TOTMN '
       +'FROM CXP301 A, '
       +  '( SELECT CIAID, TDIARID, DCPANOMM, CPNOREG,  SUM( CPGRAVAD )  CPGRAVAD, '
       +      'SUM( CPIGV ) CPIGV, SUM( CPISC ) CPISC, SUM( CPMTOLOC ) CPMTOLOC '
       +    'FROM ( SELECT CIAID, TDIARID, DCPANOMM, CPNOREG, '
       +             'CASE WHEN TIPDET=''MG'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD, '
       +             'CASE WHEN TIPDET=''I1'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV, '
       +             'CASE WHEN TIPDET=''I2'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPISC, '
       +             'CASE WHEN TIPDET=''TO'' THEN DCPMOLOC * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOLOC '
       +           'FROM CXP302 '
       +           'WHERE CIAID=''ZZ'' AND DCPANOC=''ZZZZ'' AND CLAUXID=''Z'' AND DCPAUXID=''ZZZZZ'' '
       +         ') A '
       +    'GROUP BY CIAID, TDIARID, DCPANOMM, CPNOREG '
       +  ') B '
       +'WHERE A.CIAID=''ZZ'' AND A.CPAAAA=''ZZZZ'' AND A.PROV=''ZZZZZ'' '
       +  'AND A.CIAID=B.CIAID AND A.TDIARID=B.TDIARID AND A.CPANOMES=B.DCPANOMM AND A.CPNOREG=B.CPNOREG '
       +'ORDER BY A.CPANOMES, A.CPNOREG';

     FToolRetPend := TFToolRetPend.Create( Application );
     FToolRetPend.Visible := False;

     DMCXP.wTipoAdicion:='xFiltro';    // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
     FPrincipal.Mantc                := TMant.Create( Application );
     FPrincipal.Mantc.Admin          := DMCXP.wAdmin;
     FPrincipal.Mantc.DComC          := DMCXP.DCOM1;
     FPrincipal.Mantc.OnEdit         := Nil;
     FPrincipal.Mantc.OnShow         := FPrincipal.PGridShow;
     FPrincipal.Mantc.OnCierra       := FPrincipal.RetPendCierra;
     FPrincipal.Mantc.UsuarioSQL.Add(xSQL) ;
     FPrincipal.Mantc.Module         := DMCXP.wModulo;
     FPrincipal.Mantc.ClientDataSet  := DMCXP.cdsReporte;
     FPrincipal.Mantc.OnCreateMant   := FPrincipal.RetPendCreate;
     FPrincipal.Mantc.TableName      := 'VWCXPRETCUARTA';
     FPrincipal.Mantc.Titulo         := 'RETENCIONES DE CUARTA CATEGORIA';
     FPrincipal.Mantc.User           := DMCXP.wUsuario;
     FPrincipal.Mantc.SectionName    := 'CXPRetCuarta';
     FPrincipal.Mantc.FileNameIni    := '\oaCXP.INI';
     FPrincipal.Mantc.Execute;
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   finally
     //Mantc.Free;
   end;
end;


//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////
///                                    ///
///     FIN DE PROCEDURES EXPORTADOS     ///
///                                    ///
//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////


procedure TFPrincipal.FormShow(Sender: TObject);
begin
   Screen.Cursor:=CrDefault;
end;

procedure TFPrincipal.Z1sbSalidaClick(Sender: TObject);
begin
   close;
end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMCXP.DCOM1.Connected:=False;
   Application.Terminate;
end;

procedure TFPrincipal.Z1sbMenuReglas1Click(Sender: TObject);
begin
   SacaMenu(sender);
   FReglasNeg:=TFReglasNeg.Create(Self);
   Try
      FReglasNeg.ShowModal;
   Finally
      FReglasNeg.Free;
   end;
end;

/////////////////////////////////////
//                                 //
//   MANTENIMIENTO DE REFERENCIAS  //
//                                 //
/////////////////////////////////////

procedure TFPrincipal.Z1sbMenuReglas2Click(Sender: TObject);
var
   xSQL : String;
begin
   MRefe := TMant.Create(Self);
   MRefe.Module := DMCXP.wModulo;
   MRefe.Admin  := DMCXP.wAdmin;
   MRefe.OnShow := PGridShow;
   MRefe.DComC  := DMCXP.DCOM1 ;
   MRefe.User   := DMCXP.wUsuario;
   try
      begin
         MRefe.Execute;
         MRefe.Free;
         xSQL := 'SELECT * FROM TGE203 ORDER BY CCOSID';
         DMCXP.cdsCCosto.Close;
         DMCXP.cdsCCosto.DataRequest(xSQL);
         DMCXP.cdsCCosto.open;
         DMCXP.cdsCCosto.Filter   := '';
         DMCXP.cdsCCosto.Filtered := False;
         DMCXP.cdsCCosto.IndexFieldNames := 'CCOSID';

         DMCXP.FiltraTabla( DMCXP.cdsFPago,   'TGE112', 'FPagoId'  );
         DMCXP.FiltraTabla( DMCXP.cdsTipReg,  'TGE113', 'TRegId'   );
			end
   except
   end;
end;



/////////////////////////////////////
//                                 //
//     PROVISIONES POR PAGAR       //
//                                 //
/////////////////////////////////////

procedure TFPrincipal.Z1sbMRegistro1Click(Sender: TObject);
begin
   try
      SacaMenu(sender);
      xTipoProv  := 'P';
      if not FiltraDocGrid then Exit;
      FProvision := TFProvision.Create(Self);
      FToolCont := TFToolCont.Create(Self);
      FToolCont.Visible := False;
      ftoolcont.sbtNC.visible := False;

      DMCXP.cdsMovCxP.IndexFieldNames:= '';
      DMCXP.cdsMovCxP.Filter         := '';
      DMCXP.cdsMovCxP.Filtered       := False;

      GProvision := TMant.Create(Self);
      GProvision.Admin          := DMCXP.wAdmin;
      GProvision.OnInsert       := ProvisionInsert;
      GProvision.OnEdit         := ProvisionEdita;
      GProvision.OnCreateMant   := UbiSitCreate;
      GProvision.OnDelete       := ProvisionDelete;
      GProvision.OnShow         := PGridShow;
      GProvision.DComC          := DMCXP.DCom1;
      GProvision.ClientDataSet  := DMCXP.cdsMovCxP;
      GProvision.TableName      := 'CXP301';
      GProvision.Filter         := xSelDoc;
      GProvision.Titulo         := 'Provisiones por Pagar';
      GProvision.User           := DMCXP.wUsuario;
      GProvision.Module         := DMCXP.wModulo ;
      GProvision.SectionName    := 'CXPProvisiones';
      GProvision.FileNameIni    := '\oaCXP.INI';
      ShowMessage('7');

      GProvision.Execute;
   finally
      {
      GProvision.Free;
      FProvision.Free;
      DMCXP.cdsQry3.close;
      DMCXP.cdsQry3.ProviderName := 'dspTGE';
      DMCXP.cdsProv.Close;
      }
   end;
end;

procedure TFPrincipal.ProcInsertOn( xxTMant:TMant; ccUser,ccFec,ccHor:String );
var
   xxFec, xxFil, xxTim, ccSQL : String;
begin
   xxFec:=FORMATDATETIME(DMCXP.wFormatFecha,date);
   xxTim:=FORMATDATETIME('HH:MM:SS',now);
   xxFil:=xxTMant.Filter;
   ccSQL :='Select * From '+xxTMant.TableName+',CXP301 Where ';
   if Length(xxFil)>0 then
      ccSQL:=ccSQL+'('+xxFil+')'+' and '+ccFec+'='''+xxFec+''' and '
            +ccHor+'>='''+xxTim+''' and '+ccUser+'='''+DMCXP.wUsuario+''''
   else begin
      ccSQL:=ccSQL+ccFec+'='''+xxFec+''' and '
            +ccHor+'>='''+xxTim+''' and '+ccUser+'='''+DMCXP.wUsuario+'''';
   end;
   xxTMant.FMant.cds2.Close;
   xxTMant.FMant.cds2.DataRequest( ccSQL );
   xxTMant.FMant.cds2.Open;
end;

procedure TFPrincipal.ProvisionCreate(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolLetras.pnlBot;
  pl := TMant(Sender).FMant.pnlBtns;

  pl.AutoSize := True;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 5;

  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;

procedure TFPrincipal.ProvisionInsert(Sender: TObject);
begin
   if FVariables.w_OP_Registro then
   begin
      ShowMessage( 'Opcion de Registro se encuentra en USO');
      Exit;
   end;

   xSQL:='Select * from CXP301 '
        +'Where CIAID=''ZZ'' AND TDIARID=''ZZ'' ';
   DMCXP.cdsMovCxP.Close;
   DMCXP.cdsMovCxP.DataRequest( xSQL );
   DMCXP.cdsMovCxP.Open;

   DMCXP.wModo := 'A';
   FProvision := TFProvision.Create( Application );
   FProvision.xTituProv :='Provisiones';
   FProvision.xTipoProv :='P';
   FVariables.w_OP_Registro:=True;
   FProvision.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;

procedure TFPrincipal.ProvisionEdita(Sender: TObject; MantFields: TFields);
begin
   if FVariables.w_OP_Registro then
   begin
      ShowMessage( 'Opcion de Registro se encuentra en USO');
      Exit;
   end;

   xSQL:='Select * from CXP301 '
        +'Where CIAID='''   +MantFields.FieldByName('CIAID').AsString   +''' '
        +  'AND TDIARID=''' +MantFields.FieldByName('TDIARID').AsString +''' '
        +  'AND CPANOMES='''+MantFields.FieldByName('CPANOMES').AsString+''' '
        +  'AND CPNOREG=''' +MantFields.FieldByName('CPNOREG').AsString +''' ';
   DMCXP.cdsMovCxP.Close;
   DMCXP.cdsMovCxP.DataRequest( xSQL );
   DMCXP.cdsMovCxP.Open;

// AQUI ASIGNA EL VALOR DE wModo
   if not TieneAcceso( GProvision ) then Exit;

   if DMCXP.cdsMovCxP.RecordCount = 0 then
   begin
      ShowMessage( 'Error : No Existen Registros a Editar');
      exit;
   end;
   FProvision := TFProvision.Create( Application );
   FProvision.xTituProv :='Provisiones';
   FProvision.xTipoProv :='P';
   FProvision.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;


function TFPrincipal.TieneAcceso( xxTMant: TMant ): Boolean;
begin
   Result := False;
   if ( not xxTMant.FMant.Z2bbtnConsulta.Enabled ) and
      ( not xxTMant.FMant.Z2bbtnModifica.Enabled ) then Exit;

   if xxTmant.FMant.Z2bbtnModifica.Enabled then
      DMCXP.wModo := 'M'
   else begin
      DMCXP.wModo := 'C';
   end;

   if xxTmant.FMant.cds2.RecordCount=0 then Exit;

   Result := True;
end;


procedure TFPrincipal.ProvisionDelete(Sender: TObject; MantFields: TFields);
begin
end;

procedure TFPrincipal.ProvisionActiva;
begin
	DMCXP.cdsMovCxP.IndexFieldNames:= '';
	DMCXP.cdsMovCxP.Filter         := '';
	DMCXP.cdsMovCxP.Filtered       := False;
end;

function TFPrincipal.FiltraDocGrid : Boolean;
var
	xFiltro : String;
begin
// Inicio HPC_201604_CXP
// 28/11/2016  Se abre Tabla en Tipo de Documento porque puede haber sido cerrada en otras opciones
   DMCXP.FiltraTabla( DMCXP.cdsTDoc,  'TGE110', 'DOCID');
// Fin HPC_201604_CXP

	DMCXP.cdsTDoc.Filter:='';
	// JORGE
	//    	 xTipoProv  := 'P';  // para Provisiones (facturas, n/Débito)
	//       xTipoProv  := 'N';  // para Notas de Crédito
	//       xTipoProv  := 'L';  // para Letras
	//	 xTipoProv  := 'T';  // para préstamos de terceros
	//  	 xTipoProv  := 'I';  // pera Intermediación
	//  	 xTipoProv  := 'F';  // Facturas del Exterior
	//  	 xTipoProv  := '4C'; // Cuarta Categoria

	xFiltro := '(DOC_FREG='+QuotedStr(FPrincipal.xTipoProv)+' and DOCMOD='+QuotedStr(DMCXP.wModulo)+')';

	if FPrincipal.xTipoProv='P' then
		xFiltro := '( ( DOC_FREG=''P'' OR DOC_FREG=''F'' ) and DOCMOD='+QuotedStr(DMCXP.wModulo)+')';

	if FPrincipal.xTipoProv='N' then
		xFiltro := xFiltro + ' or (DOCTIPREG='+QuotedStr('NC')+' and DOCMOD='+QuotedStr(DMCXP.wModulo)+')' ;

	if FPrincipal.xTipoProv='L' then
		xFiltro := xFiltro + ' or (DOCTIPREG='+QuotedStr('LT')+' and DOCMOD='+QuotedStr(DMCXP.wModulo)+')' ;

	if FPrincipal.xTipoProv='4C' then
	   xFiltro := xFiltro + ' or (DOCTIPREG='+QuotedStr('4C')+' and DOCMOD='+QuotedStr(DMCXP.wModulo)+')' ;

	DMCXP.cdsTDoc.Filter:= xFiltro;
	DMCXP.cdsTDoc.Filtered:=True;

	xSelDoc := '';
	while not DMCXP.cdsTDoc.Eof do
	begin
		if Length(xSelDoc)=0 then
			xSelDoc := 'CXP301.DOCID='+''''+DMCXP.cdsTDoc.FieldByName('DOCID').AsString+''''
		else
			xSelDoc := xSelDoc+ ' or CXP301.DOCID='+''''+DMCXP.cdsTDoc.FieldByName('DOCID').AsString+'''';
		DMCXP.cdsTDoc.Next;
	end;
	if Length( xSelDoc )=0 then
		Raise Exception.Create('No Existen Tipos de Documentos Registrados para Esta Opcion');

	Result := True;
end;

procedure TFPrincipal.PGridShow( Sender: TObject );
var
   i     : Integer;
   MGrid : TMant;
begin

   MGrid := TMant( Sender );
   for i:=0 to MGrid.FMant.ComponentCount-1 do begin
       if MGrid.FMant.Components[i].ClassName = 'TPanel' then
          TPanel(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
       // para botones
       if MGrid.FMant.Components[i].ClassName = 'TButton' then
          TButton(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
       // para bitbuttons
       if MGrid.FMant.Components[i].ClassName = 'TBitBtn' then
          TBitBtn(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
       // para speedbuttons
       if MGrid.FMant.Components[i].ClassName = 'TSpeedButton' then
          TSpeedButton(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
       // Boton de Grid
       if MGrid.FMant.Components[i].ClassName = 'TwwIButton' then
          TwwIButton(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
       // para la forma
       MGrid.FMant.onMouseMove := MueveMouse;
   end;
   DMCXP.AccesosUsuariosR(DMCXP.wModulo, DMCXP.wUsuario,'2', MGrid.FMant );

end;



/////////////////////////////////////
//                                 //
//     NOTAS DE CREDITO      //
//                                 //
/////////////////////////////////////

procedure TFPrincipal.Z1sbMRegistro2Click(Sender: TObject);
begin
   SacaMenu(sender);
   xTipoProv  :='N';

   //AGREGADO POR ANA 09/11/2001
   DMCXP.cdsMovCxP2.Close;
   DMCXP.cdsMovCxP2.DataRequest('SELECT * FROM CXP301 WHERE CIAID=''ZZ''');
   DMCXP.cdsMovCxP2.OPEN;
   //FIN

   if not FiltraDocGrid then Exit;

   FNotasDC:=TFNotasDC.Create(Self);
   //
   FToolCont := TFToolCont.Create(Self);
   FToolCont.sbtABl.Visible := False ;
   ftoolcont.sbtCBl.visible := False ;
   ftoolcont.sbtNC.visible := True;
   FToolCont.Visible := False;
   //
   NCreditoActiva;

   GNCredito := TMant.Create(Self);
   GNCredito.OnCreateMant   := UbiSitCreate;
   GNCredito.Admin          := DMCXP.wAdmin;
   GNCredito.OnInsert       := NCreditoInsert;
   GNCredito.OnEdit         := NCreditoEdita;
   GNCredito.OnShow         := PGridShow;
   GNCredito.DComC          := DMCXP.DCom1;
   GNCredito.ClientDataSet  := DMCXP.cdsMovCxP2;
   GNCredito.TableName      := 'CXP301';
   GNCredito.Filter         := xSelDoc;
   GNCredito.Titulo         := 'Notas de Crédito';
   GNCredito.User           := DMCXP.wUsuario;
   GNCredito.Module         := DMCXP.wModulo ;
   GNCredito.SectionName    := 'CXPNCredito';
   GNCredito.FileNameIni    := '\oaCXP.INI';
   
   try
     GNCredito.Execute;
   finally
   end;
end;

procedure TFPrincipal.NCreditoActiva;
begin
 // Filtra Tipos de documentos aptos para guardar como Provisión
   DMCXP.cdsTDoc.Filter:='';
   DMCXP.cdsTDoc.Filter:='DOC_FREG='''+FPrincipal.xTipoProv+''' and DOCMOD='''+DMCXP.wModulo+'''';
   DMCXP.cdsTDoc.Filtered:=True;

   // Indexa ClientDataSets
   DMCXP.cdsMovCxP.IndexFieldNames   := 'CIAID;PROV;DOCID;CPSERIE;CPNODOC';
   DMCXP.cdsLetras.IndexFieldNames   := 'CIAID;PROV;DOCID;CPSERIE;CPNODOC';
   DMCXP.cdsCanje.IndexFieldNames    := 'CIAID;PROV;DOCID;CPSERIE;CPNODOC';
   DMCXP.cdsDetCanje.IndexFieldNames := 'CIAID;PROV;DOCID;CPSERIE;CPNODOC';
   DMCXP.cdsTipReg.IndexFieldNames   := 'TREGID';
   DMCXP.cdsCnpEgr.IndexFieldNames   := 'CPTOID';
end;

procedure TFPrincipal.NCreditoInsert(Sender: TObject);
begin
   if FVariables.w_OP_Registro then
   begin
      ShowMessage( 'Opcion de Registro se encuentra en USO');
      Exit;
   end;

   xSQL:='Select * from CXP301 '
        +'Where CIAID=''ZZ'' AND TDIARID=''ZZ'' ';
   DMCXP.cdsMovCxP2.Close;
   DMCXP.cdsMovCxP2.DataRequest( xSQL );
   DMCXP.cdsMovCxP2.Open;

   DMCXP.wModo := 'A';
   FNotasDC := TFNotasDC.Create( Application );
   FNotasDC.xTipoProv :='N';
   FNotasDC.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;

procedure TFPrincipal.NCreditoEdita(Sender: TObject; MantFields: TFields);
begin
   if FVariables.w_OP_Registro then
   begin
      ShowMessage( 'Opcion de Registro se encuentra en USO');
      Exit;
   end;

   xSQL:='Select * from CXP301 '
        +'Where CIAID='''   +MantFields.FieldByName('CIAID').AsString   +''' '
        +  'AND TDIARID=''' +MantFields.FieldByName('TDIARID').AsString +''' '
        +  'AND CPANOMES='''+MantFields.FieldByName('CPANOMES').AsString+''' '
        +  'AND CPNOREG=''' +MantFields.FieldByName('CPNOREG').AsString +''' ';
   DMCXP.cdsMovCxP2.Close;
   DMCXP.cdsMovCxP2.DataRequest( xSQL );
   DMCXP.cdsMovCxP2.Open;

   if not TieneAcceso( GNCredito ) then Exit;

   if DMCXP.cdsMovCxP2.RecordCount = 0 then
   begin
      ShowMessage( 'Error : No Existen Registros a Editar');
      exit;
   end;
   FNotasDC := TFNotasDC.Create( Application );
   FNotasDC.xTipoProv :='N';
   FNotasDC.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;

/////////////////////////////////////
//                                 //
//        LETRAS POR PAGAR         //
//                                 //
/////////////////////////////////////

procedure TFPrincipal.Z1sbMRegistro3Click(Sender: TObject);
begin
   SacaMenu(sender);
   xTipoProv  :='L';
   xSelDoc:='';
   DMCXP.FiltraTabla( DMCXP.cdsCCBco,  'TGE106', 'CCBCOID');
   DMCXP.FiltraTabla( DMCXP.cdsSitua,  'CXC104', 'SITUAID');
   if not FiltraDocGrid1 then Exit;

   FLetras:=TFLetras.Create(Self);
   LetrasActiva;
   ToolLetras := TToolLetras.Create(Self);
   ToolLetras.Visible := False;

   GLetras := TMant.Create(Self);
   GLetras.Admin          := DMCXP.wAdmin;
   GLetras.OnCreateMant   := ToolLetrasCreate;
   GLetras.OnInsert       := LetrasInsert;
   GLetras.OnEdit         := LetrasEdita;
   GLetras.OnShow         := PGridShow;
   GLetras.ClientDataSet  := DMCXP.cdsCCanje;
   GLetras.TableName      := 'CXP308';
   GLetras.Filter         := 'TCANJEID=''LE''';
   GLetras.Titulo         := 'Canje de Letras';
   GLetras.User           := DMCXP.wUsuario;
   GLetras.DComC          := DMCXP.DCom1;
   GLetras.Module         := DMCXP.wModulo ;
   GLetras.SectionName	  := 'CXPLetras';
   GLetras.FileNameIni	  := '\oaCXP.INI';
   try
      GLetras.Execute;
   finally
      DMCXP.cdsLetras.close;
      GLetras.Free;
      FLetras.Free;
      ToolLetras.Free;
      DMCXP.cdsProv.Close;
      DMCXP.cdsTDoc.Filter  :='';
      DMCXP.cdsTDoc.Filtered:=False;
   end;
end;

procedure TFPrincipal.ToolLetrasCreate(Sender: TObject);
var
	pl, pg : TPanel;
begin
	pg := ToolLetras.pnlTool;
  pl := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 2;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.AutoSize := True;
  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;

procedure TFPrincipal.LetrasActiva;
begin
 // Filtra Tipos de documentos aptos para guardar como Provisión

   Filtracds( DMCXP.cdsDetCxP, 'Select * From CXP302 Where CIAID=''''' );

   // Indexa Client Dat sets
   DMCXP.cdsDetCxP.IndexFieldNames  :='CIAID;TDIARID;DCPAnoMM;CPNOREG';
   DMCXP.cdsMovCxP.IndexFieldNames  :='CIAID;TDIARID;CPANOMES;CPNOREG';
   DMCXP.cdsCanje.IndexFieldNames   :='CIAID;TCANJEID;CCPCANJE;TDIARID;CCPANOMM;CPNOREG';
   DMCXP.cdsDetCanje.IndexFieldNames:='CIAID;TCANJEID;CCPCANJE';
   DMCXP.cdsLetras.IndexFieldNames  :='CIAID;TCANJEID;CPCANJE';
end;

procedure TFPrincipal.LetrasInsert(Sender: TObject);
begin
   if FVariables.w_OP_Registro then
   begin
      ShowMessage( 'Opcion de Registro se encuentra en USO');
      Exit;
   end;

   xSQL:='Select * from CXP308 '
        +'Where CIAID=''ZZ'' AND TCANJEID=''LE'' AND CANJE=''ZZZZZZ'' ';
   DMCXP.cdsCCanje.Close;
   DMCXP.cdsCCanje.DataRequest( xSQL );
   DMCXP.cdsCCanje.Open;

   DMCXP.wModo := 'A';
   FLetras := TFLetras.Create( Application );
   FLetras.xTipoProv :='L';
   FLetras.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;

procedure TFPrincipal.LetrasEdita(Sender: TObject; MantFields: TFields);
begin
   if FVariables.w_OP_Registro then
   begin
      ShowMessage( 'Opcion de Registro se encuentra en USO');
      Exit;
   end;

   xSQL:='Select * from CXP308 '
        +'Where CIAID='''   +MantFields.FieldByName('CIAID').AsString   +''' '
        +  'AND TCANJEID=''LE'' '
        +  'AND CANJE='''   +MantFields.FieldByName('CANJE').AsString +''' ';
   DMCXP.cdsCCanje.Close;
   DMCXP.cdsCCanje.DataRequest( xSQL );
   DMCXP.cdsCCanje.Open;

   if not TieneAcceso( GLetras ) then Exit;

   if DMCXP.cdsCCanje.RecordCount = 0 then
   begin
      ShowMessage( 'Error : No Existen Registros a Editar');
      exit;
   end;

   if (DMCXP.DisplayDescrip2('dspTGE','TGE110','DOCTIPREG','DOCID='+QuotedStr(DMCXP.cdsCCanje.FieldByName('DOCID').AsString)+
                                                       ' AND DOCMOD='+QuotedStr(DMCXP.wModulo),'DOCTIPREG') = 'LT') then // LT = Letras '93'
   begin
      ShowMessage( 'Error : Documento no Disponible ');
      Exit;
   end;

   FLetras := TFLetras.Create( Application );
   FLetras.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;



/////////////////////////////////////
//                                 //
//   OTRAS OBLIGACIONES POR PAGAR  //
//                                 //
/////////////////////////////////////

procedure TFPrincipal.Z1sbMRegistro4Click(Sender: TObject);
begin
   SacaMenu(sender);
   xTipoProv  := 'O';
   if not FiltraDocGrid then Exit;

   FProvision := TFProvision.Create(Self);

   ProvisionActiva;

   GProvision := TMant.Create(Self);
   GProvision.Admin          := DMCXP.wAdmin;
   GProvision.OnInsert       := ProvisionInsert;
   GProvision.OnEdit         := ProvisionEdita;
   GProvision.OnShow         := PGridShow;
   GProvision.DComC          := DMCXP.DCom1;
   GProvision.ClientDataSet  := DMCXP.cdsMovCxP;
   GProvision.TableName      := 'CXP301';
   GProvision.Filter         := xSelDoc;
   GProvision.Titulo         := 'Otras Obligaciones por Pagar';
   GProvision.User           := DMCXP.wUsuario;
////////////////////
   GProvision.Module         := DMCXP.wModulo ;
   GProvision.SectionName:='CXPOtrasObli';
   GProvision.FileNameIni:='\oaCXP.INI';
////////////////////
   GProvision.Execute;
   GProvision.Free;
   FProvision.Free;
end;



/////////////////////////////////////
//                                 //
//     PRESTAMOS DE TERCEROS       //
//                                 //
/////////////////////////////////////

procedure TFPrincipal.Z1sbMRegistro5Click(Sender: TObject);
begin
 	 SacaMenu(sender);
 	 xTipoProv  := 'T';
	 if not FiltraDocGrid then Exit;

   DMCXP.cdsCxP.IndexFieldNames:='';
   FPagares := TFPagares.Create(Self);
   //** 16/07/2001 - pjsv
   FAccesos.FiltraTabla(DMCXP.cdsBanco,'TGE105','BANCOID');
   FAccesos.FiltraTabla(DMCXP.cdsCCBco,'TGE106','CCBCOID');
   DMCXP.cdsBanco.Filter := 'BCOTIPCTA <> ''C''';
   DMCXP.cdsBanco.Filtered := True;
   //**
   PagaresActiva;

   GPagares := TMant.Create(Self);
   GPagares.Admin          := DMCXP.wAdmin;
   GPagares.OnInsert       := PagaresInsert;
   GPagares.OnEdit         := PagaresEdita;
   GPagares.OnShow         := PGridShow;
   GPagares.DComC          := DMCXP.DCom1;
   GPagares.ClientDataSet  := DMCXP.cdsPagare;
   GPagares.TableName      := 'CXP306';
   GPagares.Filter         := '';//xSelDoc;
   GPagares.Titulo         := 'Prestamos de Terceros';
   GPagares.User           := DMCXP.wUsuario;
////////////////////
   GPagares.Module         := DMCXP.wModulo ;
   GPagares.SectionName:='CXPPagares';
   GPagares.FileNameIni:='\oaCXP.INI';
////////////////////
   GPagares.Execute;
   GPagares.Free;
   FPagares.Free;
    DMCXP.cdsProv.Close;
    DMCXP.cdsCxP.IndexFieldNames:='';
end;

procedure TFPrincipal.PagaresActiva;
begin
   // Filtra Tipos de documentos aptos para guardar como Provisión
   DMCXP.cdsTDoc.Filter:='';
   DMCXP.cdsTDoc.Filter:='DOC_FREG='''+FPrincipal.xTipoProv+''' and DOCMOD='''+DMCXP.wModulo+'''';
   DMCXP.cdsTDoc.Filtered:=True;

   Filtracds( DMCXP.cdsLetras,'Select * From CXP301 Where '+xSelDoc );

   // Indexa Client Dat sets
   DMCXP.cdsLetras.IndexFieldNames  :='CIAID;TDIARID;CPANOMES;CPNOREG';
   DMCXP.cdsPagare.IndexFieldNames  :='CIAID;DOCID;PAGARE';
end;


procedure TFPrincipal.PagaresInsert(Sender: TObject);
begin
   if FVariables.w_OP_Registro then
   begin
      ShowMessage( 'Opcion de Registro se encuentra en USO');
      Exit;
   end;

   DMCXP.wModo := 'A';
   xSQL:='Select * from CXP306 '
        +'Where CIAID=''ZZ'' AND DOCID=''ZZ'' AND PAGARE=''ZZZZZ''';
   DMCXP.cdsPagare.Close;
   DMCXP.cdsPagare.DataRequest( xSQL );
   DMCXP.cdsPagare.Open;
   FPagares := TFPagares.Create( Application );
   FPagares.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;


procedure TFPrincipal.PagaresEdita(Sender: TObject; MantFields: TFields);
begin
   if FVariables.w_OP_Registro then
   begin
      ShowMessage( 'Opcion de Registro se encuentra en USO');
      Exit;
   end;

   xSQL:='Select * from CXP306 '
        +'Where CIAID='''  +MantFields.FieldByName('CIAID').AsString  +''' '
        +  'AND DOCID='''  +MantFields.FieldByName('DOCID').AsString  +''' '
        +  'AND PAGARE=''' +MantFields.FieldByName('PAGARE').AsString +''' ';
   DMCXP.cdsPagare.Close;
   DMCXP.cdsPagare.DataRequest( xSQL );
   DMCXP.cdsPagare.Open;

 	 if not TieneAcceso( GPagares ) then Exit;
   if DMCXP.cdsPagare.RecordCount = 0 then
   begin
      ShowMessage( 'Error : No Existen Registros a Editar');
      exit;
   end;
   FPagares := TFPagares.Create( Application );
   FPagares.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;


/////////////////////////////////////
//                                 //
//       ORDENES DE PAGO           //
//                                 //
/////////////////////////////////////

procedure TFPrincipal.Z1sbMRegistro6Click(Sender: TObject);
begin
   if DMCXP.wVRN_OrdenPago='S' then begin
//de hugo      xTipoProv:='G';
      //Martín lo dijo
      xTipoProv:='P' ;
      if not FiltraDocGrid then Exit        ;
      SacaMenu(sender)                      ;
      wDocOP   := DMCXP.cdsTDoc.FieldByName('DOCID').AsString ;

      FPagos   := TFPagos.Create(Self) ;

      PagosActiva;

      GPagos := TMant.Create(Self);
      GPagos.Admin          := DMCXP.wAdmin;
      GPagos.OnInsert       := PagosInsert;
      GPagos.OnEdit         := PagosEdita;
      GPagos.OnShow         := PGridShow;
      GPagos.DComC          := DMCXP.DCom1;
      GPagos.ClientDataSet  := DMCXP.cdsOPago;
      GPagos.TableName      := 'CXP303';
      GPagos.Titulo         := 'Ordenes de Pago';
      GPagos.User           := DMCXP.wUsuario;
////////////////
      GPagos.Module         := DMCXP.wModulo ;
      GPagos.SectionName:='CXPPagos';
      GPagos.FileNameIni:='\oaCXP.INI';
////////////////
      GPagos.Execute;
      GPagos.Free;
      FPagos.Free;
      end
   else begin
      Raise Exception.create( ' Opción No Se usa en este Modulo ' );
   end;
end;

procedure TFPrincipal.PagosActiva;
begin
 // Filtra Tipos de Moneda Sólo Oficial Nacional y Extranjera
   DMCXP.cdsTMon.Filter:='';
   DMCXP.cdsTMon.Filter:='TMON_LOC=''L'' OR TMON_LOC=''E''';
   DMCXP.cdsTMon.Filtered:=True;

   DMCXP.cdsOPago.IndexFieldNames    := 'CIAID;OPAGO';
   DMCXP.cdsDetCanje.IndexFieldNames := 'CIAID;TCANJEID;CCPCANJE';
   DMCXP.cdsMovCxP.IndexFieldNames   := 'CIAID;CPANOMES;TDIARID;CPNOREG';
   DMCXP.cdsCanje.IndexFieldNames    := 'CIAID;TCANJEID;CCPCANJE;TDIARID;CCPANOMM;CPNOREG';
end;

procedure TFPrincipal.PagosInsert(Sender: TObject);
begin
   DMCXP.wModo := 'A';
   ProcInsertOn( GPagos, 'OPUSER','OPFREG','OPHREG' );
   FPagos.ShowModal;
end;

procedure TFPrincipal.PagosEdita(Sender: TObject; MantFields: TFields);
begin
   if not TieneAcceso( GPagos ) then Exit;
   FPagos.ShowModal;
end;



/////////////////////////////////////
//                                 //
//      CANJE DE DOCUMENTOS        //
//                                 //
/////////////////////////////////////

procedure TFPrincipal.Z1sbMRegistro7Click(Sender: TObject);
begin
   SacaMenu(sender);
   xTipoProv  := 'C';
	if not FiltraDocGrid then Exit;
   FCanjeDoc  := TFCanjeDoc.Create(Self);

   CanjeDocActiva;

   GCanjeDoc := TMant.Create(Self);
   GCanjeDoc.Admin          := DMCXP.wAdmin;
   GCanjeDoc.OnInsert       := CanjeDocInsert;
   GCanjeDoc.OnEdit         := CanjeDocEdita;
   GCanjeDoc.OnShow         := PGridShow;
   GCanjeDoc.DComC          := DMCXP.DCom1;
   GCanjeDoc.ClientDataSet  := DMCXP.cdsMovCxP2;
   GCanjeDoc.TableName      := 'CXP301';
   GCanjeDoc.Filter         := xSelDoc;
   GCanjeDoc.Titulo         := 'Canje de Documentos';
   GCanjeDoc.User           := DMCXP.wUsuario;
////////////////////
   GCanjeDoc.Module         := DMCXP.wModulo ;
   GCanjeDoc.SectionName:='CXPCanjeDoc';
   GCanjeDoc.FileNameIni:='\oaCXP.INI';
////////////////////
   GCanjeDoc.Execute;
   GCanjeDoc.Free;
   FCanjeDoc.Free;
end;

procedure TFPrincipal.CanjeDocActiva;
var
   xFiltro : String;
begin
 // Quita Filtro a archivo de Movimientos
 // Filtra Tipos de documentos aptos para guardar como Provisión
   DMCXP.cdsTDoc.Filter:='';
   DMCXP.cdsTDoc.Filter:='DOC_FREG='''+FPrincipal.xTipoProv+''' and DOCMOD='''+DMCXP.wModulo+'''';
   DMCXP.cdsTDoc.Filtered:=True;

   xFiltro := 'CPSALLOC>0 AND CPESTADO=''P''';

   Filtracds( DMCXP.cdsMovCxP, 'Select * From CXP301 Where '+xFiltro );
   Filtracds( DMCXP.cdsLetras, 'Select * From CXP301 Where TCANJEID=''CD''' );
   Filtracds( DMCXP.cdsCanje,   '');
   Filtracds( DMCXP.cdsDetCanje,'');

   DMCXP.cdsMovCxP2.IndexFieldNames :='CIAID;TDIARID;CPANOMES;CPNOREG';
   DMCXP.cdsDetCxP.IndexFieldNames  :='CIAID;TDIARID;DCPANOMM;CPNOREG';
   DMCXP.cdsMovCxP.IndexFieldNames  :='CIAID;TDIARID;CPANOMES;CPNOREG';
   DMCXP.cdsCanje.IndexFieldNames   :='CIAID;TCANJEID;CCPCANJE;TDIARID;CCPANOMM;CPNOREG';
   DMCXP.cdsDetCanje.IndexFieldNames:='CIAID;TCANJEID;CCPCANJE';
   DMCXP.cdsLetras.IndexFieldNames  :='CIAID;TDIARID;CPANOMES;CPNOREG';
end;

procedure TFPrincipal.CanjeDocInsert(Sender: TObject);
begin
   DMCXP.wModo := 'A';
//   ProcInsertOn( GCanjeDoc, 'CPUSER','CPFREG','CPHREG' );
   FCanjeDoc.ShowModal;
   GCanjeDoc.RefreshFilter;
end;

procedure TFPrincipal.CanjeDocEdita(Sender: TObject; MantFields: TFields);
var
   xxRecno : Integer;
   xxCia, xxTCa, xxCje : String;
begin
   if not TieneAcceso( GCanjeDoc ) then Exit;

   xxRecno := DMCXP.cdsMovCxP2.Recno;

   xxCia := DMCXP.cdsMovCxP2.FieldByName( 'CIAID').AsString;
   xxTCA := DMCXP.cdsMovCxP2.FieldByName( 'TCANJEID').AsString;
   xxCJE := DMCXP.cdsMovCxP2.FieldByName( 'CPCANJE'   ).AsString;

   Filtracds( DMCXP.cdsDetCxP,'Select * From CXP302 Where '
                + 'CIAID='    +''''+ xxCia +''''+' and '
                + 'TCANJEID=' +''''+ xxTCA +''''+' and '
                + 'CANJE='    +''''+ xxCJE +'''' );

   FCanjeDoc.ShowModal;

   GCanjeDoc.RefreshFilter;

   if DMCXP.cdsMovCxP2.Recordcount<=xxRecno then
      DMCXP.cdsMovCxP2.Recno:=xxRecno;

end;

/////////////////////////////////////
//                                 //
//    FIN DE REGISTRO DE DATOS     //
//                                 //
/////////////////////////////////////




procedure TFPrincipal.Z1sbMenuReportes1Click(Sender: TObject);
begin
{
// JCC 10/06/2002
// SE CAMBIO Y AHORA SOLO UTILIZA EL CXP401
// EN EL CXP401 SE MODIFICÓ TODA LA FORMA

// Reporte de Registro de Compras
	 SacaMenu(sender);
   Screen.Cursor:=crHourGlass;
   DMCXP.cdsTDiario.Close;
   DMCXP.cdsTDiario.Filter := '';
   DMCXP.cdsTDiario.Filtered := False;
   DMCXP.cdsCxP.IndexFieldNames:='';
   FCRegComp:=TFCRegComp.Create(Self);
   Screen.Cursor:=crDefault;
   try
      FCRegComp.ShowModal;
   finally
      FCRegComp.Free;
      DMCXP.cdsQry2.Close;
      DMCXP.cdsQry2.filter :='';
      DMCXP.cdsQry2.filtered := False;
      DMCXP.cdsQry2.indexfieldnames :='';
   end;
   DMCXP.cdsCxP.IndexFieldNames:='';
   }
end;

procedure TFPrincipal.Z1sbMenuReportes3Click(Sender: TObject);
var
   xSQL : string;
   wAno, wMes, wDia : word;
   xMesAnt, xMesAct, xAnoAct : String;
begin
	SacaMenu(Sender) ;

   // apertura Tabla de Tipos de Documento
   xSQL := 'select * From TGE110 where DOCMOD='''+DMCXP.wModulo+''' ';
   DMCXP.cdsTDoc.Close;
   DMCXP.cdsTDoc.IndexFieldNames:='DOCID';
   DMCXP.cdsTDoc.Filter:='';
   DMCXP.cdsTDoc.DataRequest(xSQL);
   DMCXP.cdsTDoc.Open;

   Decodedate(date,wAno,wMes,wDia);
   xMesAct := strzero(inttostr(wMes),2);
   if xMesAct='01' then
      xMesAnt:='00'
   else
      xMesAnt:=strzero(inttostr(wMes-1),2);
   xAnoAct := inttostr(wAno);

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      xSQL:='Select A.CLAUXID, S.CLAUXDES, '
           +  'A.PROV, A.PROVDES, A.PROVDIR, A.PROVCZIP, D.ZIPDES, A.PROVTELF, '
           +  'A.PROVFAX, A.PROVEMAI, A.PROVDNI, A.PROVRUC, '
           +  'J.SALDSME'+XMESANT+' SALDSANTME, J.DEBESME'+XMESACT+' CARGOSME, J.HABESME'+XMESACT+' ABONOSME, J.SALDSME'+XMESACT+' SALDSACTME,'
           +  'J.SALDSMN'+XMESANT+' SALDSANTMN, J.DEBESMN'+XMESACT+' CARGOSMN, J.HABESMN'+XMESACT+' ABONOSMN, J.SALDSMN'+XMESACT+' SALDSACTMN, '
           +  'J.SALDTME'+XMESANT+' SALDTANTME, J.DEBETME'+XMESACT+' CARGOTME, J.HABETME'+XMESACT+' ABONOTME, J.SALDTME'+XMESACT+' SALDTACTME,'
           +  'J.SALDTMN'+XMESANT+' SALDTANTMN, J.DEBETMN'+XMESACT+' CARGOTMN, J.HABETMN'+XMESACT+' ABONOTMN, J.SALDTMN'+XMESACT+' SALDTACTMN '
           +'From TGE201 A '
           +  'LEFT JOIN TGE122 D on (D.ZIPID=A.PROVCZIP) '
           +  'LEFT JOIN TGE102 S on (S.CLAUXID=A.CLAUXID) '
           +  'LEFT JOIN TGE401 J on ( J.CIAID=''ZZ'' and J.ANO='+QuotedStr(XANOACT)+' and '
           +                         'J.CLAUXID=A.CLAUXID and J.AUXID=A.PROV ) '
           +'Where PROV=''@&%$''';
   end;

   if (SRV_D = 'ORACLE') then
   begin
      xSQL:='Select A.CLAUXID, S.CLAUXDES, '
           +  'A.PROV, A.PROVDES, A.PROVDIR, A.PROVCZIP, D.ZIPDES, A.PROVTELF, '
           +  'A.PROVFAX, A.PROVEMAI, A.PROVDNI, A.PROVRUC, '
           +  'J.SALDSME'+XMESANT+' SALDSANTME, J.DEBESME'+XMESACT+' CARGOSME, J.HABESME'+XMESACT+' ABONOSME, J.SALDSME'+XMESACT+' SALDSACTME,'
           +  'J.SALDSMN'+XMESANT+' SALDSANTMN, J.DEBESMN'+XMESACT+' CARGOSMN, J.HABESMN'+XMESACT+' ABONOSMN, J.SALDSMN'+XMESACT+' SALDSACTMN, '
           +  'J.SALDTME'+XMESANT+' SALDTANTME, J.DEBETME'+XMESACT+' CARGOTME, J.HABETME'+XMESACT+' ABONOTME, J.SALDTME'+XMESACT+' SALDTACTME,'
           +  'J.SALDTMN'+XMESANT+' SALDTANTMN, J.DEBETMN'+XMESACT+' CARGOTMN, J.HABETMN'+XMESACT+' ABONOTMN, J.SALDTMN'+XMESACT+' SALDTACTMN '
           +'From TGE201 A, TGE122 D, TGE102 S, TGE401 J '
           +'Where D.ZIPID(+)=A.PROVCZIP and  S.CLAUXID(+)=A.CLAUXID '
           +' and   J.CIAID=''ZZ'' and J.ANO='+QuotedStr(XANOACT)+' and J.CLAUXID(+)=A.CLAUXID and J.AUXID(+)=A.PROV  '
           +' and  PROV=''@&%$''';

   end;

   try

     FToolCtaCte := TFToolCtaCte.create(self);
     FToolCtaCte.seAno.Value:=wAno;
     FToolCtaCte.seMes.Value:=wMes;

     FEstCxCli := TFEstCxCli.create(self);
     GCtaCte                := TMant.Create(SELF);
     GCtaCte.Admin          := DMCXP.wAdmin ;
     GCtaCte.Titulo         := 'Cuenta Corriente de Proveedores' ;
     GCtaCte.OnCreateMant   := ToolsCreate;
     GCtaCte.dcOMc          := DMCXP.DCOM1;
     GCtaCte.UsuarioSQL.Add(xSQL);
     GCtaCte.User           := DMCXP.wUsuario;
     GCtaCte.ClientDataset  := DMCXP.cdsCXP;
     GCtaCte.TableName      := 'VWCXPCTACTE';
     GCtaCte.Filter         := '';
     GCtaCte.OnEdit         := CtaCteEdita;
     GCtaCte.OnDelete       := NIL;
     GCtaCte.OnInsert       := NIL;
     GCtaCte.SectionName    :='ProvCtaCte';
  	  GCtaCte.FileNameIni    :='\oaCXP.INI';
     GCtaCte.Execute;
   Finally
     GCtaCte.Free;
     DMCXP.cdsQry5.filter :='';
     DMCXP.cdsQry5.filtered := False;
     DMCXP.cdsQry5.indexfieldnames :='';
     DMCXP.cdsQry5.Close;

     DMCXP.cdsQry6.filter             := '';
     DMCXP.cdsQry6.filtered           := False;
     DMCXP.cdsQry6.indexfieldnames    := '';
     DMCXP.cdsQry6.Close;

     DMCXP.cdsReporte.filter          := '';
     DMCXP.cdsReporte.filtered        := False;
     DMCXP.cdsReporte.indexfieldnames := '';

     DMCXP.cdsCxP.filter          := '';
     DMCXP.cdsCxP.filtered        := False;
     DMCXP.cdsCxP.indexfieldnames := '';




   end ;
   SacaMenu(Sender);
end;

procedure TFPrincipal.Z1sbAyudaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   SacaMenu(sender);
end;

procedure TFPrincipal.Z1sbMenuReportes2Click(Sender: TObject);
begin
{
  SacaMenu(sender);
  //** 07/09/2001 - pjsv, se baja el tiempo de 5' a segundos
  Screen.Cursor := crHourGlass;
  FiltraTabla( DMCXP.cdsTDoc,  'TGE110', 'DOCID');
  FiltraTabla( DMCXP.cdsCia,  'TGE101', 'CIAID');
  DMCXP.cdsCxP.IndexFieldNames := '';

  FCLetras := TFCLetras.Create(Self);
  Screen.Cursor := crDefault;
  Try
  	FCLetras.ShowModal;
  Finally
    FCLetras.Free;
   	DMCXP.cdsLetras.Close;
    DMCXP.cdsCxP.IndexFieldNames := '';
  end;
  }
end;

procedure TFPrincipal.Z1sbMenuOtros1Click(Sender: TObject);
begin
{
   SacaMenu(sender);
   DMCXP.cdsSQL.Close;
   xSQL:= 'SELECT CIAID, CIARUC, CIADES FROM TGE101 GROUP BY CIAID, CIARUC, CIADES';
   DMCXP.cdsSQL.ProviderName:='dspTGE';
   DMCXP.cdsSQL.DataRequest(xSQL);
   DMCXP.cdsSQL.Open;

   xTipoProv  := '4C';
   if not FiltraDocGrid then begin
      ShowMessage('No existen Documentos registrados como 4ta. Categoría');
      Exit;
   end;

   FTransfPDT:=TFTransfPDT.Create(Self);
   Try
      FTransfPDT. ShowModal;
   Finally
      FTransfPDT. Free;
   end;
   }
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
{
   If DMCXP.wAdmin='G' then begin

      DMCXP.wGrupoTmp := '';

      Application.OnMessage:=AppMessage;

      ListaComponentes(Self);
   end;
   }
end;

Procedure TFPrincipal.MueveMouse(xObjeto: TObject; Shift: TShiftState; X, Y: Integer);
var
  xComponente : String;
  xForma : TForm;
begin
   xForma      := Screen.ActiveForm;
   xComponente := xForma.Name;

   if xObjeto is TForm then
   else begin

      xComponente := xComponente+'.'+TControl(xObjeto).Name;

      DMCXP.wObjetoForma := xForma.Name;
      DMCXP.wObjetoNombr := TControl(xObjeto).Name;
      If Copy(DMCXP.wObjetoNombr,2,1)='2' then
         DMCXP.wObjetoDescr := DMCXP.wObjetoDesPr+' - '+TControl(xObjeto).Hint
      else begin
         DMCXP.wObjetoDescr := TControl(xObjeto).Hint;
      end;
   end;
end;

procedure TFPrincipal.ListaComponentes( xForm : TForm);
var
   i : integer;
begin

   for i:=0 to xForm.ComponentCount-1 do begin

      if xForm.Components[i].ClassName = 'TPanel' then
         TPanel(xForm.components[i]).OnMouseMove := MueveMouse;
      // para botones
      if xForm.Components[i].ClassName = 'TButton' then
         TButton(xForm.components[i]).OnMouseMove := MueveMouse;
      // para bitbuttons
      if xForm.Components[i].ClassName = 'TBitBtn' then
         TBitBtn(xForm.components[i]).OnMouseMove := MueveMouse;
      // para speedbuttons
      if xForm.Components[i].ClassName = 'TSpeedButton' then
         TSpeedButton(xForm.components[i]).OnMouseMove := MueveMouse;
      // Boton de Grid
      if xForm.Components[i].ClassName = 'TwwIButton' then
         TwwIButton(xForm.components[i]).OnMouseMove := MueveMouse;

      // para la forma
      xForm.onMouseMove := MueveMouse;
   end;
end;

procedure TFPrincipal.AppMessage(var Msg:TMsg; var Handled:Boolean );
begin
   if Msg.message = WM_KEYDOWN then begin

      if ( Msg.wParam=VK_F5 ) then begin

         If (Copy(DMCXP.wObjetoNombr,1,2)='Z1') or
            (Copy(DMCXP.wObjetoNombr,1,2)='Z2') then begin
            CreaOpciones;
         end;
      end;

      if ( Msg.wParam=VK_F12 ) then begin

         CreaAccesos;
      end;
   end;

end;

procedure TFPrincipal.CreaAccesos;
begin
  {
	IF FMantAcceso<>NIL then Exit;

  FMantAcceso:=TFMantAcceso.Create(Self);
  Try
  	FMantAcceso. ShowModal;
  Finally
  	FMantAcceso. Free;
  end;
  }
end;

procedure TFPrincipal.CreaOpciones;
begin
  {
	FMantOpcion:=TFMantOpcion.Create(Self);
  Try
  	If Length(DMCXP.wGrupoTmp)>0 then
    begin
    	FMantOpcion. ShowModal;
    end;
  Finally
  	FMantOpcion. Free;
  end;
  }
end;

procedure TFPrincipal.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   SacaMenu(Sender);
end;

procedure TFPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFPrincipal.SacaMenu(Sender: TObject);
begin
end;

procedure TFPrincipal.Z1sbMenuOtros3Click(Sender: TObject);
begin
{
  SacaMenu(Sender);
  Screen.Cursor:=crHourGlass;
  FCierreOpe:=TFCierreOpe.Create(Self);
  Screen.Cursor:=crDefault;
  Try
     FCierreOpe.ShowModal;
  Finally
     FCierreOpe.Free;
  end;
  }
end;

procedure TFPrincipal.Z1sbMRegistro9Click(Sender: TObject);
begin
	// Registro de Cuenta Contable Principal
  SacaMenu(Sender);
  Filtracds( DMCXP.cdsRCuenta,  '' );
  Filtracds( DMCXP.cdsTipCta,   '' );
  Filtracds( DMCXP.cdsCtaConsol,'' );
  DMCXP.cdsCuenta.Close;
  DMCXP.cdsCuenta.Open;
  DMCXP.cdsCuenta.Close;

  FPlnCta   := TFPlnCta.Create(Self);

	Mantc := TMant.Create(Self);

  Mantc.User      := DMCXP.wUsuario;
  Mantc.Admin     := DMCXP.wAdmin;
  Mantc.Titulo    := 'Plan de Cuentas Principal' ;
  Mantc.Module    := DMCXP.wModulo ;
  Mantc.Tablename := 'TGE202' ;
  Mantc.Filter    := '';//'CIAID=''01'' ' ;
  Mantc.ClientDataset:=DMCXP.cdsCuenta ;

  Mantc.OnInsert  := AdicCtaPrin ;
  Mantc.OnEdit    := EditaCtaPrin ;
  Mantc.OnDelete  := DeleteCtaPrin ;
  Mantc.SectionName:='CXPPlanCta';
  Mantc.FileNameIni:='\oaCXP.INI';
  try
    Mantc.Execute ;
  Finally
    FPlnCta.Free ;
  end ;
end;

procedure TFPrincipal.AdicCtaPrin(Sender: TObject);
begin
   DMCXP.wModo := 'A';
   FPlnCta.ShowModal;
end;

procedure TFPrincipal.EditaCtaPrin(Sender: TObject; MantFields: TFields);
begin
   if ( not Mantc.FMant.Z2bbtnConsulta.Enabled ) and
      ( not Mantc.FMant.Z2bbtnModifica.Enabled ) then Exit;

   if Mantc.FMant.Z2bbtnModifica.Enabled then
      DMCXP.wModo := 'M'
   else begin
      DMCXP.wModo := 'C';
   end;

   If DMCXP.cdsCUENTA.RecordCount=0 then Exit;

   FPlnCta.ShowModal;
end;

procedure TFPrincipal.DeleteCtaPrin(Sender: TObject; MantFields: TFields);
begin
   ShowMessage('No Se Pueden Eliminar Cuentas');
end;


procedure TFPrincipal.AdicProveNoti(Sender: TObject);
begin
   DMCXP.wModo := 'A';
   xSQL:='Select * from CXP_PRO_NOT_SUN Where NUMERO=''ZZXXYYZZ''';
   DMCXP.cdsPagare.Close;
   DMCXP.cdsPagare.DataRequest( xSQL );
   DMCXP.cdsPagare.Open;
   FProveNotiSunat:= TFProveNotiSunat.Create( Application );
   FProveNotiSunat.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;

procedure TFPrincipal.EditaProveNoti(Sender: TObject; MantFields: TFields);
begin
	if ( not GNotiSunat.FMant.Z2bbtnConsulta.Enabled ) and
     ( not GNotiSunat.FMant.Z2bbtnModifica.Enabled ) then Exit;

  if GNotiSunat.FMant.Z2bbtnModifica.Enabled then
     DMCXP.wModo := 'M'
  else
  begin
     DMCXP.wModo := 'C';
  end;

   xSQL:='Select * from CXP_PRO_NOT_SUN '
        +'Where NUMERO='''+MantFields.FieldByName('NUMERO').AsString +'''';
   DMCXP.cdsPagare.Close;
   DMCXP.cdsPagare.DataRequest( xSQL );
   DMCXP.cdsPagare.Open;

	if DMCXP.cdsPagare.RecordCount = 0 then
 	begin
    ShowMessage( 'Error : No Existen Registros a Editar');
    exit;
 	end;
   FProveNotiSunat:= TFProveNotiSunat.Create( Application );
   FProveNotiSunat.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;


procedure TFPrincipal.BorraProveNoti(Sender: TObject; MantFields: TFields);
begin
   ShowMessage('No se puede eliminar Registro');
end;


procedure TFPrincipal.AdicMaesProv(Sender: TObject);
begin
   DMCXP.wModo := 'A';
   xSQL:='Select * from TGE201 Where CLAUXID=''ZZ'' AND PROV=''ZZZZXY''';
   DMCXP.cdsProv.Close;
   DMCXP.cdsProv.DataRequest( xSQL );
   DMCXP.cdsProv.Open;

	DMCXP.FiltraTabla( DMCXP.cdsQry16,   'SUNAT102', 'CONVDOBTRI');

   DMCXP.cdsDetCxP2.Close;
   DMCXP.FiltraTabla( DMCXP.cdsFPago,   'TGE112', 'FPagoId'  );

   FMaesProv:= TFMaesProv.Create( Application );
   FMaesProv.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;

procedure TFPrincipal.EditaMaesProv(Sender: TObject; MantFields: TFields);
begin          
	if ( not FPrincipal.Mantc.FMant.Z2bbtnConsulta.Enabled ) and
     ( not FPrincipal.Mantc.FMant.Z2bbtnModifica.Enabled ) then Exit;

  if FPrincipal.Mantc.FMant.Z2bbtnModifica.Enabled then
  	DMCXP.wModo := 'M'
  else
  begin
  	DMCXP.wModo := 'C';
  end;

   xSQL:='Select * from TGE201 '
        +'Where CLAUXID='''+MantFields.FieldByName('CLAUXID').AsString +''' '
        +  'AND PROV='''   +MantFields.FieldByName('PROV').AsString    +'''';
   DMCXP.cdsProv.Close;
   DMCXP.cdsProv.DataRequest( xSQL );
   DMCXP.cdsProv.Open;

	if DMCXP.cdsPROV.RecordCount = 0 then
 	begin
    ShowMessage( 'Error : No Existen Registros a Editar');
    exit;
 	end;
   FMaesProv:= TFMaesProv.Create( Application );
   FMaesProv.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;

procedure TFPrincipal.Z1sbMRegistro0Click(Sender: TObject);
begin
	 SacaMenu(Sender);
	 DMCXP.FiltraTabla( DMCXP.cdsPais,    'TGE118', 'PaisId');
	 DMCXP.FiltraTabla( DMCXP.cdsDpto,    'TGE158', 'DptoId');
	 DMCXP.FiltraTabla( DMCXP.cdsProvinc, 'TGE121', 'CiudId');
	 DMCXP.FiltraTabla( DMCXP.cdsDistrito,'TGE122', 'ZipId');
	 DMCXP.FiltraTabla( DMCXP.cdsSecEco,  'TGE163', 'SecEcoId');
	 DMCXP.FiltraTabla( DMCXP.cdsGiro,    'TGE116', 'GiroId');
	 DMCXP.FiltraTabla( DMCXP.cdsClasif,  'TGE132', 'ClasifId');
	 DMCXP.FiltraTabla( DMCXP.cdsBanco,   'TGE105', 'BANCOID');
	 DMCXP.FiltraTabla( DMCXP.cdsSitua,   'CXC104', 'SITUAID');
	 DMCXP.FiltraTabla( DMCXP.cdsTipProv, 'TGE134', 'TIPPROVID');
	 DMCXP.FiltraTabla( DMCXP.cdsClAux,   'TGE102', 'ClauxId');
 	 DMCXP.FiltraTabla( DMCXP.cdsGArti,   'TGE131', 'GRARID');

//    Filtracds( DMCXP.cdsProv, 'SELECT * FROM TGE201' );

	 DMCXP.cdsProv.IndexFieldNames:= '';

	 FMaesProv := TFMaesProv.Create(Self);
	 Mantc := TMant.Create(Self);
	 Try
			Mantc.Admin     			:= DMCXP.wAdmin;
			Mantc.User      			:= DMCXP.wUsuario;
			Mantc.DComC 					:= DMCXP.DCOM1;
			Mantc.Titulo    			:= 'Maestro de Proovedores' ;
			Mantc.Module    			:= DMCXP.wModulo;
			Mantc.Tablename 			:= 'TGE201' ;
			Mantc.Filter    			:= '' ;
			Mantc.ClientDataset 	:= DMCXP.cdsProv ;
			Mantc.OnInsert  			:= AdicMaesProv ;
			Mantc.OnEdit    			:= EditaMaesProv ;
			Mantc.OnDelete        := BorraMaesProv ;
			Mantc.OnCreateMant    := Nil ;
			Mantc.SectionName			:= 'CXPProveedores';
			Mantc.FileNameIni			:= '\oaCXP.INI';
			Mantc.Execute;
	 Finally
			Screen.Cursor:=crHourGlass;
			Mantc.Free;
			FMaesProv.Free ;
{   FiltraTabla( DMCXP.cdsProv,  'TGE201', 'PROV');
		DMCXP.cdsProv.IndexFieldNames:='PROV';}
			Screen.Cursor:=crDefault;
	 end;
end;

procedure TFPrincipal.UbiSitCreate(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolCont.pnGLt;
  pl := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 2;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.AutoSize := True;
  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;

procedure TFPrincipal.ToolProvCreate(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolProv.pnlBtns;
  pl := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 2;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.AutoSize := True;
  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;



procedure TFPrincipal.AplicaCreate(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolAplica.pnGLt;
  pl := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 2;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.AutoSize := True;
  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;


procedure TFPrincipal.Z2sbMenuContabClick(Sender: TObject);
begin
  {
	SacaMenu(Sender) ;
  try
  	Screen.Cursor:=crHourGlass;
  	FCCuadreMovs := TFCCuadreMovs.Create(self);
    Screen.Cursor:=crDefault;
    FCCuadreMovs.ShowModal;
  finally
  	FCCuadreMovs.Free;
	end;
  }
end;

procedure TFPrincipal.Z2sbMenuIngresadosClick(Sender: TObject);
begin
  {
	SacaMenu(Sender) ;
  Screen.Cursor:=crHourGlass;
  FRepRegDiarios := TFRepRegDiarios.create(self) ;
  Screen.Cursor:=crDefault;
  try
  	FRepRegDiarios.ShowModal;
  finally
  	FRepRegDiarios.Free;
  end ;
  }
end;

procedure TFPrincipal.SpeedButton1Click(Sender: TObject);
begin
  {
	SacaMenu(Sender) ;
  try
    //FSelCCosto := TFSelCCosto.create(self) ;
    FcrConCCos := TFcrConCCos.Create(self);
    FcrConCCos.Showmodal;
  finally
    FcrConCCos.Free;
  end;
  }
end;

procedure TFPrincipal.SpeedButton2Click(Sender: TObject);
begin
  {
  SacaMenu(Sender) ;
  try
  	Screen.Cursor:=crHourGlass;
    CFRepMov := TCFRepMov.Create(self);
  	Screen.Cursor:=crDefault;
    CFRepMov.showModal;
  finally
    CFRepMov.Free;
  end;
  }
end;

procedure TFPrincipal.SpeedButton3Click(Sender: TObject);
begin
  {
	SacaMenu(sender);
  try
	 FiltraTabla( DMCXP.cdsCia,  'TGE101', 'CIAID');
	 Screen.Cursor:=crHourGlass;
	 FLetrasProvisio := TFLetrasProvisio.Create(self);
	 Screen.Cursor:=crDefault;
	 FLetrasProvisio.showModal;
  finally
	 FLetrasProvisio.Free;
  end;
  }
end;

procedure TFPrincipal.Z1sbMRegistro11Click(Sender: TObject);
begin
	SacaMenu(Sender);

   DMCXP.cdsCxP.IndexFieldNames:='';
   xSQL:='select * From TGE104 Where REGISTRO=''R''';
   DMCXP.cdsQry6.Close;
   DMCXP.cdsQry6.DataRequest(xSQL);
   DMCXP.cdsQry6.Open;

   if DMCXP.cdsQry6.Recordcount=0 then begin
      ShowMessage( 'Error : Falta Registrar el T.Diario de Compensación');
      Exit;
   end;

	FCanjeCxC := TFCanjeCxC.Create(Self);
	Mantc := TMant.Create(Self);
	Try
		Mantc.Admin     		 :=DMCXP.wAdmin;
		Mantc.User      		 :=DMCXP.wUsuario;
		Mantc.DComC 			   :=DMCXP.DCOM1;
		Mantc.Titulo    		 :='Compensación';
		Mantc.Module    		 :=DMCXP.wModulo;
		Mantc.Tablename 		 :='CXP310';
		Mantc.Filter    		 :='';
		Mantc.ClientDataset  :=DMCXP.cdsCjeCxC;
		Mantc.OnInsert  		 :=AdicCompensacion ;
		Mantc.OnEdit    		 :=EditaCompensacion ;
		Mantc.OnDelete       :=Nil;//OnDeleteProv;
		Mantc.OnCreateMant   :=Nil ;
		Mantc.SectionName		 :='CXPCompensacion';
		Mantc.FileNameIni		 :='\oaCXP.INI';
		Mantc.Execute;
	Finally
		Mantc.Free;
		FCanjeCxC.Free;
      DMCXP.cdsQry6.Close;
      DMCXP.cdsCxP.IndexFieldNames:='';
      DMCXP.cdsQry3.Close;
      DMCXP.cdsQry3.ProviderName := 'dspTGE';
	end;
end;

procedure TFPrincipal.AdicCompensacion(Sender: TObject);
begin
   if FVariables.w_OP_Registro then
   begin
      ShowMessage( 'Opcion de Registro se encuentra en USO');
      Exit;
   end;

   xSQL:='Select * from CXP310 '
        +'Where CIAID=''ZZ'' AND CJCANJE=''ZZZZZ'' ';
   DMCXP.cdsCjeCxC.Close;
   DMCXP.cdsCjeCxC.DataRequest( xSQL );
   DMCXP.cdsCjeCxC.Open;
   DMCXP.wModo := 'A';
   FCanjeCxC := TFCanjeCxC.Create( Application );
   FCanjeCxC.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;

procedure  TFPrincipal.EditaCompensacion(Sender: TObject; MantFields: TFields);
begin
   if FVariables.w_OP_Registro then
   begin
      ShowMessage( 'Opcion de Registro se encuentra en USO');
      Exit;
   end;

   xSQL:='Select * from CXP310 '
        +'Where CIAID='''   +MantFields.FieldByName('CIAID').AsString   +''' '
        +  'AND CJCANJE=''' +MantFields.FieldByName('CJCANJE').AsString +'''';
   DMCXP.cdsCjeCxC.Close;
   DMCXP.cdsCjeCxC.DataRequest( xSQL );
   DMCXP.cdsCjeCxC.Open;
   DMCXP.wModo := 'M';

   if DMCXP.cdsCjeCxC.RecordCount = 0 then
   begin
      ShowMessage( 'Error : No Existen Registros a Editar');
      exit;
   end;
   FCanjeCxC := TFCanjeCxC.Create( Application );
   FCanjeCxC.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;



procedure TFPrincipal.Z1sbDetalleCXPClick(Sender: TObject);
begin
  try
    SacaMenu(sender);
    xTipoProv  := 'P';

    DMCXP.cdsTDoc.Filter:='';
    DMCXP.cdsTDoc.Filter:='DOC_FREG='''+FPrincipal.xTipoProv+''' and DOCMOD='''+DMCXP.wModulo+'''';
    DMCXP.cdsTDoc.Filtered:=True;

    xSelDoc := '';
    while not DMCXP.cdsTDoc.Eof do begin
       if Length(xSelDoc)=0 then
          xSelDoc := '( CXP302.DOCID='+''''+DMCXP.cdsTDoc.FieldByName('DocId').AsString+''''
       else
          xSelDoc := xSelDoc+ ' or CXP302.DOCID='+''''+DMCXP.cdsTDoc.FieldByName('DOCID').AsString+'''';
       DMCXP.cdsTDoc.Next;
    end;
    if Length( xSelDoc )=0 then
       Raise Exception.Create('No Existen Tipos de Documentos Registrados para Esta Opcion');

    xSelDoc:=xSelDoc+') and '+DMCXP.wReplacCeros+'(CXP302.DCPESTDO,'''')<>''A'' '
                    +'  and '+DMCXP.wReplacCeros+'(CXP302.DCPESTDO,'''')<>''E'' ';

    GDetProvi:=TMant.Create(Self);
    GDetProvi.Admin          := DMCXP.wAdmin;
    GDetProvi.DComC          := DMCXP.DCom1;
    GDetProvi.ClientDataSet  := DMCXP.cdsDetCxP;
    GDetProvi.TableName      := 'CXP302';
    GDetProvi.Filter         := xSelDoc;
    GDetProvi.Titulo         := 'Detalle Provisiones por Pagar';
    GDetProvi.User           := DMCXP.wUsuario;
    GDetProvi.Module         := DMCXP.wModulo ;
    GDetProvi.SectionName    := 'CXPDetalleProvision';
    GDetProvi.FileNameIni    := '\oaCXP.INI';
    GDetProvi.Execute;
  finally
    GDetProvi.Free;
  end;
end;

procedure TFPrincipal.Z1sbInfDiarioClick(Sender: TObject);
begin
	SacaMenu(sender);
  Screen.Cursor:=crHourGlass;
  DMCXP.FiltraTabla(DMCXP.cdsCia,'TGE101', 'CIAID');
  DMCXP.FiltraTabla(DMCXP.cdsTDiario,'TGE104', 'TDIARID');
  FIngDia := TFIngDia.create(application);
  Screen.Cursor:=crDefault;
  FIngDia.ShowModal;
end;

procedure TFPrincipal.Z1sbInfDistribucionClick(Sender: TObject);
begin
	SacaMenu(sender);
  DMCXP.FiltraTabla(DMCXP.cdsCia,'TGE101', 'CIAID');
  Screen.Cursor:=crHourGlass;
  FDistribucion:=TFDistribucion.Create(Self);
  Screen.Cursor:=crDefault;
  Try
  	FDistribucion.ShowModal;
  Finally
  	FDistribucion.Free;
  end;
end;

procedure TFPrincipal.BitBtn1Click(Sender: TObject);
begin
   FInserta := TFInserta.Create(Self);
   FInserta.Visible := True;
{   DMCXP.cdsQRY.close;
   DMCXP.cdsQRY.datarequest('select A.CPNOREG,SUM(A.DCPMOORI) DCPMOORI,SUM(A.DCPMOLOC) DCPMOLOC,SUM(A.DCPMOEXT) DCPMOEXT,SUM(A.DCPMOORI) DCPMOORI1'
                         +' From cxp302 A,cxp301 B'
                         +' where A.tdiarid=''19'' and A.dcpanomm=''200110'' and A.ciaid=''02'''
                         +' and  B.tdiarid(+) = A.tdiarid and B.ciaid(+) = A.ciaid'
                         +' and B.cpanomes(+) = A.dcpanomm AND B.CPNOREG(+) = A.CPNOREG'
                         +' AND A.TIPDET = ''MG'''
                         +' GROUP BY A.CPNOREG'
                         +' order by A.CPNOREG' );
   DMCXP.cdsQRY.open;
   DMCXP.cdsmovcxp.close;
   DMCXP.cdsmovcxp.datarequest('SELECT * FROM CXP301  WHERE TDIARID=''19'' AND CPANOMES=''200110'' AND CIAID=''02'''
                              +'ORDER BY CPNOREG');
   DMCXP.cdsmovcxp.open;
   DMCXP.cdsmovcxp.IndexFieldNames := 'CPNOREG';
   DMCXP.cdsmovcxp.first;
   DMCXP.cdsQRY.first;
   while not DMCXP.cdsQRY.Eof do
    begin
     DMCXP.cdsmovcxp.SetKey;
     DMCXP.cdsmovcxp.FieldByName('CPNOREG').AsString := DMCXP.cdsQry.FieldByName('CPNOREG').AsString;
     If DMCXP.cdsmovcxp.gotokey then
      begin
       DMCXP.cdsmovcxp.Edit;
       DMCXP.cdsmovcxp.FieldByName('CPMTOORI').AsString := DMCXP.cdsQry.FieldByName('DCPMOORI').AsString;
       DMCXP.cdsmovcxp.FieldByName('CPMTOLOC').AsString := DMCXP.cdsQry.FieldByName('DCPMOLOC').AsString;
       DMCXP.cdsmovcxp.FieldByName('CPMTOEXT').AsString := DMCXP.cdsQry.FieldByName('DCPMOEXT').AsString;
       DMCXP.cdsmovcxp.FieldByName('CPGRAVAD').AsString := DMCXP.cdsQry.FieldByName('DCPMOORI1').AsString;
      end;
     DMCXP.cdsQRY.next;
    end;
   DMCXP.AplicaDatos(DMCXP.cdsmovcxp,'MovCxP');}
end;

procedure TFPrincipal.Z1sbMRegistro8Click(Sender: TObject);
begin
   SacaMenu(sender);
   xTipoProv  :='I';
   if not FiltraDocGrid then Exit;

   DMCXP.cdsCxP.IndexFieldNames:='';
   FIntermediacion:=TFIntermediacion.Create(Self);
   IntermediacionActiva;

   GIntermediacion := TMant.Create(Self);
   GIntermediacion.OnCreateMant   := NIL;
   GIntermediacion.Admin          := DMCXP.wAdmin;
   GIntermediacion.OnInsert       := IntermediacionInsert;
   GIntermediacion.OnEdit         := IntermediacionEdita;
   GIntermediacion.OnShow         := PGridShow;
   GIntermediacion.DComC          := DMCXP.DCom1;
   GIntermediacion.ClientDataSet  := DMCXP.cdsMovCxP2;
   GIntermediacion.TableName      := 'CXP301';
   GIntermediacion.Filter         := xSelDoc;
   GIntermediacion.Titulo         := 'Intermediación';
   GIntermediacion.User           := DMCXP.wUsuario;
////////////////////
   GIntermediacion.Module         := DMCXP.wModulo ;
   GIntermediacion.SectionName    := 'CXPIntermediacion';
   GIntermediacion.FileNameIni    := '\oaCXP.INI';
////////////////////
   GIntermediacion.Execute;
   GIntermediacion.Free;
   FIntermediacion.Free;
   DMCXP.cdsCxP.IndexFieldNames:='';
end;

procedure TFPrincipal.IntermediacionActiva;
begin
 // Filtra Tipos de documentos aptos para guardar como Provisión

   Filtracds( DMCXP.cdsDetCxP, 'Select * From CXP302 Where CIAID=''''' );

   // Indexa Client Dat sets
   DMCXP.cdsDetCxP.IndexFieldNames  :='CIAID;TDIARID;DCPAnoMM;CPNOREG';
   DMCXP.cdsMovCxP.IndexFieldNames  :='CIAID;TDIARID;CPANOMES;CPNOREG';
   DMCXP.cdsCanje.IndexFieldNames   :='CIAID;TCANJEID;CCPCANJE;TDIARID;CCPANOMM;CPNOREG';
   DMCXP.cdsDetCanje.IndexFieldNames:='CIAID;TCANJEID;CCPCANJE';
   DMCXP.cdsLetras.IndexFieldNames  :='CIAID;TCANJEID;CPCANJE';
end;

procedure TFPrincipal.IntermediacionInsert(Sender: TObject);
begin
   if FVariables.w_OP_Registro then
   begin
      ShowMessage( 'Opcion de Registro se encuentra en USO');
      Exit;
   end;

   xSQL:='Select * from CXP301 '
        +'Where CIAID=''ZZ'' AND TDIARID=''ZZ'' AND CPANOMES=''ZZZZ''';
   DMCXP.cdsMovCxP2.Close;
   DMCXP.cdsMovCxP2.DataRequest( xSQL );
   DMCXP.cdsMovCxP2.Open;

   DMCXP.wModo := 'A';
   FIntermediacion:=TFIntermediacion.Create( Application );
   FVariables.w_OP_Registro:=True;
   FIntermediacion.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;


procedure TFPrincipal.IntermediacionEdita(Sender: TObject; MantFields: TFields);
begin
   if FVariables.w_OP_Registro then
   begin
      ShowMessage( 'Opcion de Registro se encuentra en USO');
      Exit;
   end;

   xSQL:='Select * from CXP301 '
        +'Where CIAID='''   +MantFields.FieldByName('CIAID').AsString   +''' '
        +  'AND TDIARID=''' +MantFields.FieldByName('TDIARID').AsString +''' '
        +  'AND CPANOMES='''+MantFields.FieldByName('CPANOMES').AsString+''' '
        +  'AND CPNOREG=''' +MantFields.FieldByName('CPNOREG').AsString +'''';
   DMCXP.cdsMovCxP2.Close;
   DMCXP.cdsMovCxP2.DataRequest( xSQL );
   DMCXP.cdsMovCxP2.Open;

	 if not TieneAcceso( GIntermediacion ) then Exit;

   if DMCXP.cdsMovCxP2.RecordCount = 0 then
   begin
     ShowMessage( 'Error : No Existen Registros a Editar');
     exit;
   end;
   DMCXP.wModo := 'M';
   FIntermediacion:=TFIntermediacion.Create( Application );
   FVariables.w_OP_Registro:=True;
   FIntermediacion.ActiveMDIChild;
//   FVariables.ConfiguraForma( Screen.ActiveForm );
end;


procedure TFPrincipal.Z1sbRLetFacClick(Sender: TObject);
begin
 	 SacaMenu(sender);
   ShowMessage('En Construcción');
   Exit;
end;

procedure TFPrincipal.BorraMaesProv(Sender: TObject; MantFields: TFields);
var
   sSQL : String;
begin
   xSQL:='Select * from TGE201 '
        +'Where CLAUXID='''+MantFields.FieldByName('CLAUXID').AsString +''' '
        +  'AND PROV='''   +MantFields.FieldByName('PROV').AsString    +'''';
   DMCXP.cdsProv.Close;
   DMCXP.cdsProv.DataRequest( xSQL );
   DMCXP.cdsProv.Open;

	if DMCXP.cdsPROV.RecordCount = 0 then
 	begin
    ShowMessage( 'Error : No Existen Registros a Editar');
    exit;
 	end;

	sSQL:= 'AUXID = '''+ DMCXP.cdsPROV.FieldByName('PROV').AsString+'''';
  if length(DMCXP.DisplayDescrip2('dspTGE','TGE401','AUXID',sSQL,'AUXID')) > 0 then
  begin
  	ShowMessage( 'Error : Este Proveedor Tiene Movimientos registrados ');
    Exit;
  end;
	sSQL:= 'PROV = '''+ DMCXP.cdsPROV.FieldByName('PROV').AsString+'''';
  if length(DMCXP.DisplayDescrip2('dspTGE','LOG304','ODCID',sSQL,'ODCID')) > 0 then
  begin
  	ShowMessage( 'Error : Este Proveedor Tiene Ordenes de Compra hechas ');
    Exit;
  end;
	sSQL:= 'PROV = '''+ DMCXP.cdsPROV.FieldByName('PROV').AsString+'''';
  if length(DMCXP.DisplayDescrip2('dspTGE','LOG314','NISAID',sSQL,'NISAID')) > 0 then
  begin
  	ShowMessage( 'Error : Este Proveedor Tiene Notas de Entrada hechas ');
    Exit;
  end;
	sSQL:= 'PROV = '''+ DMCXP.cdsPROV.FieldByName('PROV').AsString+'''';
  if length(DMCXP.DisplayDescrip2('dspTGE','CXP301','PROV',sSQL,'PROV')) > 0 then
  begin
  	ShowMessage( 'Error : Este Proveedor Tiene Obligaciones por Pagar hechas ');
    Exit;
  end;

  if MessageDlg('Esta Seguro de Eliminar El Proveedor '+ #13+#13+
                 DMCXP.cdsProv.FieldByName('PROV').AsString  + '  -  '+
                 DMCXP.cdsProv.FieldByName('PROVDES').AsString + #13+
                 #13 +' Desea Continuar ',mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
    sSQL:= 'delete From TGE201 where PROV='+QuotedStr(DMCXP.cdsProv.FieldByName('PROV').AsString)
          +' and CLAUXID='+QuotedStr(DMCXP.cdsProv.FieldByName('CLAUXID').AsString);
    try
       DMCXP.DCOM1.AppServer.EjecutaSQL(sSQL);
    except
    end;
    DMCXP.cdsProv.Delete;
    DMCXP.ControlTran;
  end;
end;


function TFPrincipal.FiltraDocGrid1: Boolean;
var
	xFiltro : String;
begin
   DMCXP.cdsTDoc.Filter:='';
   // JORGE
   //      xTipoProv  := 'P'; // para Provisiones (facturas, n/Débito)
   //      xTipoProv  := 'N'; // para Notas de Crédito
   //      xTipoProv  := 'L'; // para Letras
   //	   xTipoProv  := 'T'; // para préstamos de terceros
   //  	   xTipoProv  := 'I'; // pera Intermediación
   //  	   xTipoProv  := 'F'; // Facturas del Exterior

   xFiltro := '(DOC_FREG='+QuotedStr(FPrincipal.xTipoProv)+' and DOCMOD='+QuotedStr(DMCXP.wModulo)+')';

   if FPrincipal.xTipoProv='P' then
      xFiltro := '( ( DOC_FREG=''P'' OR DOC_FREG=''F'' ) and DOCMOD='+QuotedStr(DMCXP.wModulo)+')';

   if FPrincipal.xTipoProv='N' then
      xFiltro := xFiltro + ' or (DOCTIPREG='+QuotedStr('NC')+' and DOCMOD='+QuotedStr(DMCXP.wModulo)+')' ;

   if FPrincipal.xTipoProv='L' then
      xFiltro := xFiltro + ' or (DOCTIPREG='+QuotedStr('LT')+' and DOCMOD='+QuotedStr(DMCXP.wModulo)+')' ;

   DMCXP.cdsTDoc.Filter   := xFiltro;
   DMCXP.cdsTDoc.Filtered := True;
   xSelDoc := '';
   while not DMCXP.cdsTDoc.Eof do
   begin
      if Length(xSelDoc)=0 then
	 xSelDoc := 'CXP308.DOCID='+''''+DMCXP.cdsTDoc.FieldByName('DOCID').AsString+''''
      else
	 xSelDoc := xSelDoc+ ' or CXP308.DOCID='+''''+DMCXP.cdsTDoc.FieldByName('DOCID').AsString+'''';
      DMCXP.cdsTDoc.Next;
   end;
   if Length( xSelDoc )=0 then
      Raise Exception.Create('No Existen Tipos de Documentos Registrados para Esta Opción');

   Result := True;
end;


procedure TFPrincipal.Z2LetrasPendientesClick(Sender: TObject);
var
   xSQL, xDoc1, xDoc2, xTmonEuro : String;
begin
   // 26/06/2002 Consulta de Letras Pendiente a pedidom de JCC
   //exclusiva para Inoresa
   //se ha utilizado codigo duro por premura del tiempo a pedido de JCC
   xDoc1 :='08';
   xDoc2 :='93';
   xLote :='08';
   xTmonEuro :='04';
   xSQL := ' SELECT  CIAID,CPANOMES,CPMM,CPSS,CPAAAA,CPNOREG,CPNODOC,CPFVCMTO,PROVDES, '+
          '  ''                '' OBSERVACION,TMONID,'+
          ' CASE WHEN TMONID='+Quotedstr(DMCXP.wTMonLoc)+' THEN CPMTOORI ELSE 0  END MTOLOC ,'+
          ' CASE WHEN TMONID='+Quotedstr(DMCXP.wTMonExt)+' THEN CPMTOORI ELSE 0  END MTOEXT ,'+
          ' CASE WHEN TMONID='+Quotedstr(xTMonEuro)+' THEN CPMTOORI ELSE 0  END MTOEURO , '+
          ' CPMTOLOC  SOLOSOLES,PROV,CPCANJE FROM CXP301 '+
          ' WHERE (CIAID=''01'''+
          ' AND'+
          '( (DOCID='+Quotedstr(xDoc1)+' OR DOCID='+Quotedstr(xDoc2)+')'+
          ' AND   DCPLOTE<>'+Quotedstr(xLote)+
          ' )'+
          ' AND CPESTADO=''P'''+
          ' AND CPFEMIS<='+DMCXP.wRepFecServi+
          ' )'+
          '  OR (CIAID=''01'' AND  DCPLOTE='+Quotedstr(xLote)+' AND CPESTADO=''P'''+
          ' AND CPFEMIS<='+DMCXP.wRepFecServi+
          ')'+
          ' ORDER BY CPAAAA,CPMM,CPSS';
  try

     FToolLetPend := TFToolLetPend.Create(Self);
     FToolLetPend.Visible := False;

     Mantc                := TMant.Create(Self);
     Mantc.Admin          := DMCXP.wAdmin;
     Mantc.DComC          := DMCXP.DCOM1;
     Mantc.OnEdit         := Nil;
     Mantc.OnShow         := PGridShow;
     Mantc.UsuarioSQL.Add(xSQL) ;
     Mantc.Module         := DMCXP.wModulo;
     Mantc.ClientDataSet  := DMCXP.cdsReporte;
     Mantc.OnCreateMant    := LetPendCreate;
     Mantc.TableName      := 'VWCXPLETPEND';
     Mantc.Titulo         := 'Consulta de Letras Pendientes';
     Mantc.User           := DMCXP.wUsuario;
     Mantc.SectionName    :='CXPLetPend';
     Mantc.FileNameIni    :='\oaCXP.INI';
     Mantc.Execute;
   finally
     Mantc.Free;
     SacaMenu(sender);
   end;

end;

procedure TFPrincipal.LetPendCreate(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolLetPend.pnlLet;
  pl := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 2;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.AutoSize := True;
  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;

procedure TFPrincipal.RetPendCreate(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolRetPend.pnlLet;
  pl := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 2;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.AutoSize := True;
  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;

procedure TFPrincipal.Z1sbMenuOtros4Click(Sender: TObject);
begin
{
   Screen.Cursor:=crHourGlass;
   DMCXP.cdsProv.Close;
   DMCXP.cdsProv.Open;
   FNuevoProv:=TFNuevoProv.Create(Self);
   Screen.Cursor:=crDefault;
   try
      FNuevoProv.ShowModal;
   finally
      FNuevoProv.Free;
   end;
 }
end;

procedure TFPrincipal.Z2bbtnRegLetrasClick(Sender: TObject);
var
   xSQL : String;
begin

//   DMCXP.Filtracds(DMCXP.cdsBanco,'SELECT * FROM TGE105 WHERE BCOTIPCTA=''C'' ORDER BY BANCOID');

  FToolRegLetras   := TFToolRegLetras.create(self) ;


  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    xSQL :=' SELECT TGE101.CIADES AS CIADESC, '+
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
           ' CPESTADO, TGE115.ESTDOCDES '
           +' FROM CXP301, CNT201, TGE101, TGE115 '  +
           ' WHERE CXP301.CIAID=''FF'' AND CXP301.TDIARID =''FF'' '+
           ' AND CXP301.DOCID =''FF'' '+
           ' AND (CXP301.PROV = CNT201.AUXID AND CXP301.CLAUXID = CNT201.CLAUXID ) AND CPANOMES =''FF'' '+
           ' AND CXP301.CIAID = TGE101.CIAID  AND CXP301.CPESTADO=TGE115.ESTDOCID ';
  end
  else
	if SRV_D = 'ORACLE' then
  begin
    xSQL :='SELECT TGE101.CIADES AS CIADESC,  '+
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
           'CPESTADO , TGE115.ESTDOCDES '+
           'FROM CXP301, CNT201, TGE101, TGE115  ' +
           'WHERE CXP301.CIAID=''FF''  AND CXP301.TDIARID =''FF''' +
           ' AND CXP301.DOCID =''FF'''+
           ' AND (CXP301.PROV = CNT201.AUXID AND CXP301.CLAUXID = CNT201.CLAUXID ) AND CPANOMES =''FF'' ' +
           ' AND CXP301.CIAID = TGE101.CIAID AND CXP301.CPESTADO=TGE115.ESTDOCID ';

	end;



   DMCXP.cdsReporte.Close;
   DMCXP.cdsReporte.IndexFieldNames:='';
   DMCXP.cdsReporte.Filter:='';

   SacaMenu(sender);
   GRegLetras     := TMant.create(self) ;

   with GRegLetras do
   begin
      Admin         := DMCXP.wAdmin ;
      Titulo        := 'Letras por Pagar';
      Tablename     := 'VWCAJAREGLETRAS';
      ClientDataSet := DMCXP.cdsReporte ;
      OnCreateMant  := PegaPanelToolRegLetras ;
      OnInsert      := nil ;
      OnEdit        := nil ;
      OnShow        := fprincipal.PGridShow;
      OnDelete      := nil ;
      DComC         := DMCXP.DCOM1 ;
      Module        := 'CAJA' ;
      SectionName   := 'CAJAMOVCAJA';
      FileNameIni   := '\SOLCAJA.INI';
      User          := DMCXP.wUsuario ;
      UsuarioSQL.Add(xSQL);
      try
         Execute ;
      finally
         Free ;
         DMCXP.cdsReporte.Close;
         DMCXP.cdsReporte.IndexFieldNames:='';
         DMCXP.cdsReporte.Filter:='';
         DMCXP.cdsReporte.close;
         FToolRegLetras.free;
       end ;
   end ;

end;

procedure TFPrincipal.ToolsCreate(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolCtaCte.pnlTool;
  pl := TMant(Sender).FMant.pnlBtns;

  pl.AutoSize := True;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 5;

  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;

procedure TFPrincipal.CtaCteEdita(Sender: TObject; MantFields: TFields);
var
   xSQL : String;
begin

   try
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'CXP.CPMTOLOC, CXP.CPPAGLOC, '//CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, '//CXP.CPSALEXT, '
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
//        +  'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID AND DOC.DOCMOD='''+DMCXP.wModulo+'''), TGE201 PROVE '
        +  'LEFT JOIN TGE110 DOC ON (CXP.DOCID=DOC.DOCID ), TGE201 PROVE '
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByName('PROV').AsString+''' '
        + ' AND ( CPESTADO = ''P'' OR CPESTADO = ''C''  ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, Date )+''' ) ) '
        + ' AND  DOCMOD='''+DMCXP.wModulo+''' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) AND CXP.CIAID='''
        +FToolCtaCte.dblcCia.Text+'''';
   end;
   if (SRV_D = 'ORACLE') then
   begin
    xSQL:='SELECT CXP.CIAID, CXP.DOCID, DOC.DOCDES DOCABR, DOC.DOCRESTA, '
        +  'CXP.CPSERIE, CXP.CPNODOC, CXP.CPFEMIS, CXP.CPFVCMTO,   CXP.CPTCAMPR, CXP.PROV, '
        +  'CXP.CPMTOLOC, CXP.CPPAGLOC, '//CXP.CPSALLOC, '
        +  'CXP.CPMTOEXT, CXP.CPPAGEXT, '//CXP.CPSALEXT, '
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
        +'WHERE CXP.PROV='''+DMCXP.cdsCXP.FieldByName('PROV').AsString+''' '
        + ' AND ( CPESTADO = ''P'' OR CPESTADO = ''C'' ) '
        + ' AND ( CXP.CPFEMIS<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha, Date )+''' ) ) '
        + ' AND  DOCMOD='''+DMCXP.wModulo+''' '
        + ' AND (PROVE.PROV = CXP.PROV AND PROVE.CLAUXID=CXP.CLAUXID) '
        + ' AND CXP.TMONID=MON.TMONID(+) AND CXP.DOCID=DOC.DOCID(+) AND DOC.DOCMOD='''+DMCXP.wModulo+''''
        + ' AND CIAID='''+FToolCtaCte.dblcCia.Text+'''';
   end;

     FToolCCProv := TFToolCCProv.create(self);

     FToolCCProv.dbeCiaCod.Text  := FToolCtaCte.dblcCia.Text;
     FToolCCProv.dbeCia.Text   := FToolCtaCte.dbeCia.Text;
     FToolCCProv.dbeProvCod.Text := DMCXP.cdsCXP.FieldByName('PROV').AsString;
     FToolCCProv.dbeProv.Text  := DMCXP.cdsCXP.FieldByName('PROVDES').AsString;
     TNumericField(DMCXP.CdsCxP.FieldByName('SALDSACTMN')).DisplayFormat := '###,###,##0.00';
//     FToolCCProv.dbesalactmn.Text := DMCXP.cdsCXP.FieldByName('SALDSACTMN').AsString;
//     FToolCCProv.dbesaltotmn.Text := DMCXP.cdsCXP.FieldByName('SALDTACTMN').AsString;
     TNumericField(DMCXP.CdsCxP.FieldByName('SALDTACTMN')).DisplayFormat := '###,###,##0.00';
  //   FToolCCProv.dbesalactme.Text := DMCXP.cdsCXP.FieldByName('SALDSACTME').AsString;
     TNumericField(DMCXP.CdsCxP.FieldByName('SALDSACTME')).DisplayFormat := '###,###,##0.00';
//     FToolCCProv.dbesaltotme.Text := DMCXP.cdsCXP.FieldByName('C').AsString;
     TNumericField(DMCXP.CdsCxP.FieldByName('SALDTACTME')).DisplayFormat := '###,###,##0.00';

     GCCProv                := TMant.Create(SELF);
     GCCProv.Admin          := DMCXP.wAdmin ;
     GCCProv.Titulo         := 'Cuenta Corriente' ;
     GCCProv.OnCreateMant   := ToolsCCCreate;
     GCCProv.dcOMc          := DMCXP.DCOM1;
     GCCProv.UsuarioSQL.Add(xSQL);
     GCCProv.User           := DMCXP.wUsuario;
     GCCProv.ClientDataset  := DMCXP.cdsqRY;
     GCCProv.TableName      := 'VWCXPCCPROV';
  	 GCCProv.Filter         := '';
     GCCProv.OnEdit         := CtaCteDetEdita;
//     GCCProv.OnEdit         := NIL;
     GCCProv.OnDelete       := NIL;
     GCCProv.OnInsert       := NIL;
     GCCProv.SectionName    :='ProvCCProv';
  	 GCCProv.FileNameIni    :='\oaCXP.INI';
     GCCProv.Execute;
   Finally
     GCCProv.Free;
     DMCXP.cdsQry5.filter :='';
     DMCXP.cdsQry5.filtered := False;
     DMCXP.cdsQry5.indexfieldnames :='';
     DMCXP.cdsQry5.Close;

     DMCXP.cdsQry6.filter :='';
     DMCXP.cdsQry6.filtered := False;
     DMCXP.cdsQry6.indexfieldnames :='';
     DMCXP.cdsQry6.Close;

     DMCXP.cdsQry.filter :='';
     DMCXP.cdsQry.filtered := False;
     DMCXP.cdsQry.indexfieldnames :='';
     DMCXP.cdsQry.Close;

   end ;
   SacaMenu(Sender);

{
   Exit;

  Cursor := crHourGlass ;
  try

    FEstCxCli.dblcClAux.Text  := DMCXP.cdsCXP.FieldByName('CLAUXID').AsString ;
    FEstCxCli.dbeClAux.Text   := DMCXP.cdsCXP.FieldByName('CLAUXDES').AsString ;
    FEstCxCli.dblcProv.Text   := DMCXP.cdsCXP.FieldByName('PROV').AsString ;
    FEstCxCli.dbeClie.Text    := DMCXP.cdsCXP.FieldByName('PROVDES').AsString ;
    FEstCxCli.dbeDirec.Text   := DMCXP.cdsCXP.FieldByName('PROVDIR').AsString ;
    FEstCxCli.dbeDistrito.Text:= DMCXP.cdsCXP.FieldByName('ZIPDES').AsString ;
    FEstCxCli.dbeTelf.Text    := DMCXP.cdsCXP.FieldByName('PROVTELF').AsString ;

    FEstCxCli.ClAux     := DMCXP.cdsCXP.FieldByName('CLAUXID').AsString ;
    FEstCxCli.Cliente   := DMCXP.cdsCXP.FieldByName('PROV').AsString  ;
    FEstCxCli.ProvDes   := DMCXP.cdsCXP.FieldByName('PROVDES').AsString  ;
    //FEstCxCli.Moneda    := dbclMoneda.Text ;
    FEstCxCli.Activar   := False  ;
    //FEstCxCli.MonLoc    := isMLOC ;
    FEstCxCli.Internal  := True   ;
//    FEstCxCli.SaldoIni  := DMCXP.cdsCXP.FieldByName('SALANTMN').AsFloat ;
//    FEstCxCli.SaldoIniL := DMCXP.cdsCXP.FieldByName('SALANTMN').AsFloat ;
//    FEstCxCli.SaldoIniE := DMCXP.cdsCXP.FieldByName('SALANTME').AsFloat ;
//    FEstCxCli.Anio      := Trunc(dbSpAnno.Value) ;
//    FEstCxCli.Mes       := cbMes.ItemIndex+1     ;

    ShowWindow( FEstCxCli.Handle, SW_HIDE ) ;

    FEstCxCli.ShowModal ;
  finally
//    Z2bbtnAceptarClick(Sender);
  end;
  Screen.Cursor := crDefault ;

}

end;

procedure TFPrincipal.PegaPanelToolRegLetras(Sender: TObject);
var
   cb, cl : TPanel ;
begin
   cb := FToolRegLetras.PnlComprobante ;
   cl:= TMant(Sender).FMant.pnlBtns ;
   cb.Parent   := TMant(Sender).FMant.pnlBtns ;
   cl.Height := cb.Height+5;
   cb.Align    := alClient ;
   cl.AutoSize := True ;
   TMant(Sender).FMant.pnlBtns.Visible  := True;
end;
procedure TFPrincipal.ToolsCCCreate(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolCCProv.pnlTool;
  pl := TMant(Sender).FMant.pnlBtns;

  pl.AutoSize := True;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 5;

  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;





function TFPrincipal.VerificaVersion: Boolean;
begin
end;

procedure TFPrincipal.CtaCteDetEdita(Sender: TObject; MantFields: TFields);
var
   xSQL : String;
begin
   SacaMenu(Sender);
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
     xSQL:='SELECT CIAID,PROV,PROVRUC,CXP305.DOCID,DOC.DOCABR,CPSERIE,CPNODOC,CPNOREG,TCANJEID,CCPCANJE,CCPFCJE,DOCID2,DOC1.DOCABR DOCABR2,CPSERIE2,CPNODOC2, '+
        ' TMONID,DCDMOORI,DCDMOEXT,DCDMOLOC,DCDUSER,DCDFREG,DCDHREG '+
        ' FROM CXP305 '+
        ' LEFT JOIN TGE110 DOC ON CXP305.DOCID=DOC.DOCID AND DOC.DOCMOD='''+DMCXP.wModulo+''' '+
        ' LEFT JOIN TGE110 DOC1 ON CXP305.DOCID2=DOC1.DOCID AND DOC1.DOCMOD='''+DMCXP.wModulo+''' '+
        ' WHERE CIAID='+QuotedStr(FToolCtaCte.dblcCia.Text)+' AND PROV='+QuotedStr(DMCXP.cdsCXP.FieldByName('PROV').AsString)+
        ' AND CXP305.DOCID='+QuotedStr(DMCXP.cdsqRY.FieldByName('DOCID').AsString)+' AND CPSERIE='+QuotedStr(DMCXP.cdsqRY.FieldByName('CPSERIE').AsString)+
        ' AND CPNODOC='+QuotedStr(DMCXP.cdsqRY.FieldByName('CPNODOC').AsString);
   DMCXP.cdsSQL.Close;
   DMCXP.cdsSQL.DataRequest(xSQL);
   DMCXP.cdsSQL.Open;
   if DMCXP.cdsSQL.RecordCount>0 then
   begin

     try
       GCtaCteDet                := TMant.Create(SELF);
       GCtaCteDet.Admin          := DMCXP.wAdmin ;
       GCtaCteDet.Titulo         := 'Detalle de Pagos' ;
       GCtaCteDet.OnCreateMant   := NIL;
       GCtaCteDet.dcOMc          := DMCXP.DCOM1;
       GCtaCteDet.UsuarioSQL.Add(xSQL);
       GCtaCteDet.User           := DMCXP.wUsuario;
       GCtaCteDet.ClientDataset  := DMCXP.cdsSQL;
       GCtaCteDet.TableName      := 'VWCXPDETPAG';
       GCtaCteDet.Filter         := '';
       GCtaCteDet.OnEdit         := NIL;
       GCtaCteDet.OnDelete       := NIL;
       GCtaCteDet.OnInsert       := NIL;
       GCtaCteDet.SectionName    :='CxPDetPag';
       GCtaCteDet.FileNameIni    :='\oaCXP.INI';
       GCtaCteDet.Execute;
     Finally
       GCtaCteDet.Free;
     END;
   end
   else
   begin
     ShowMessage('No existen Registros que mostrar');
   end;
end;

procedure TFPrincipal.SpeedButton4Click(Sender: TObject);
begin
{
   SacaMenu(sender);
   DMCXP.cdsSQL.Close;
   xSQL:= 'SELECT CIAID, CIARUC, CIADES FROM TGE101 GROUP BY CIAID, CIARUC, CIADES';
   DMCXP.cdsSQL.ProviderName:='dspTGE';
   DMCXP.cdsSQL.DataRequest(xSQL);
   DMCXP.cdsSQL.Open;

   FTransfCOA:=TFTransfCOA.Create(Self);
   Try
    	FTransfCOA. ShowModal;
   Finally
  	   FTransfCOA. Free;
   end;
   }
end;

procedure TFPrincipal.Z1sbMnInf2Click(Sender: TObject);
var
  xSQL : string;
  wAno, wMes, wDia : word;
	xMesAnt, xMesAct, xAnoAct : String;
begin
	SacaMenu(Sender) ;
  // apertura Tabla de Tipos de Documento
  xSQL := 'SELECT * FROM TGE110 WHERE DOCMOD='''+DMCXP.wModulo+''' ';
  DMCXP.cdsTDoc.Close;
  DMCXP.cdsTDoc.IndexFieldNames:='DOCID';
  DMCXP.cdsTDoc.Filter:='';
  DMCXP.cdsTDoc.DataRequest(xSQL);
  DMCXP.cdsTDoc.Open;

  Decodedate(date,wAno,wMes,wDia);
  xMesAct := strzero(inttostr(wMes),2);
  if xMesAct='01' then
     xMesAnt:='00'
  else
     xMesAnt:=strzero(inttostr(wMes-1),2);
  xAnoAct := inttostr(wAno);

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     xSQL:='SELECT A.CLAUXID, S.CLAUXDES, '+
          'A.PROV, A.PROVDES, A.PROVDIR, A.PROVCZIP, D.ZIPDES, A.PROVTELF, '+
          'A.PROVFAX, A.PROVEMAI, A.PROVDNI, A.PROVRUC, A.PROVUFMOV '+
          'FROM TGE201 A '+
          'LEFT JOIN TGE122 D ON (D.ZIPID=A.PROVCZIP) '+
          'LEFT JOIN TGE102 S ON (S.CLAUXID=A.CLAUXID) '+
          'WHERE PROV=''@&%$''';
  end;
  if (SRV_D = 'ORACLE') then
  begin
     xSQL:='SELECT A.CLAUXID, S.CLAUXDES, '+
          'A.PROV, A.PROVDES, A.PROVDIR, A.PROVCZIP, D.ZIPDES, A.PROVTELF, '+
          'A.PROVFAX, A.PROVEMAI, A.PROVDNI, A.PROVRUC, A.PROVUFMOV '+
          'FROM TGE201 A, TGE122 D, TGE102 S, TGE401 J '+
          'WHERE D.ZIPID(+)=A.PROVCZIP AND S.CLAUXID(+)=A.CLAUXID '+
          'AND PROV=''@&%$''';
  end;

  xSQL:='Select * From ( '+xSQL+' ) SOLVISTA ';

  try
    FToolCtaCteProv 		:= TFToolCtaCteProv.create(self);
    FToolCtaCteProv.Ano := wAno;
    FToolCtaCteProv.Mes := wMes;

    FEstCxCPro := TFEstCxCPro.create(self);
    FEstCxCPro.seAno.Value:= wAno;
    FEstCxCPro.seMes.Text	:= StrZero(FloattoStr(wMes),2);

    GCtaCte                := TMant.Create(SELF);
    GCtaCte.Admin          := DMCXP.wAdmin;
    GCtaCte.Titulo         := 'Cuenta Corriente de Proveedores' ;
    GCtaCte.OnCreateMant   := ToolsCtaCteProv;
    GCtaCte.dcOMc          := DMCXP.DCOM1;
    GCtaCte.UsuarioSQL.Add(xSQL);
    GCtaCte.User           := DMCXP.wUsuario;
    GCtaCte.ClientDataset  := DMCXP.cdsCXP;
    GCtaCte.TableName      := 'VWCXPCTACTEPROV';
    GCtaCte.Filter         := '';
    GCtaCte.OnEdit         := CtaCteProvEdita;
    GCtaCte.OnDelete       := NIL;
    GCtaCte.OnInsert       := NIL;
    GCtaCte.SectionName    :='ProvCtaCte';
    GCtaCte.FileNameIni    :='\oaCXP.INI';
    GCtaCte.Execute;
  Finally
    GCtaCte.Free;
    FToolCtaCteProv.Free;
    FEstCxCPro.Free;

    DMCXP.cdsQry2.Close;
    DMCXP.cdsQry2.filter :='';
    DMCXP.cdsQry2.filtered := False;
    DMCXP.cdsQry2.indexfieldnames :='';
    DMCXP.cdsQry5.Close;
    DMCXP.cdsQry5.filter :='';
    DMCXP.cdsQry5.filtered := False;
    DMCXP.cdsQry5.indexfieldnames :='';
    DMCXP.cdsQry6.Close;
    DMCXP.cdsQry6.filter             := '';
    DMCXP.cdsQry6.filtered           := False;
    DMCXP.cdsQry6.indexfieldnames    := '';
    DMCXP.cdsReporte.CLOSE;
    DMCXP.cdsReporte.filter          := '';
    DMCXP.cdsReporte.filtered        := False;
    DMCXP.cdsReporte.indexfieldnames := '';
    DMCXP.cdsCxP.filter          := '';
    DMCXP.cdsCxP.filtered        := False;
    DMCXP.cdsCxP.indexfieldnames := '';
  end;
end;

procedure TFPrincipal.ToolsCtaCteProv(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolCtaCteProv.pnlTool;
  pl := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 2;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.AutoSize := True;
  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;


procedure TFPrincipal.CtaCteProvEdita(Sender: TObject; MantFields: TFields);
var
	dd, mm, aa : word;
	sCIA, sSQL : string;
begin
   Screen.Cursor := crHourGlass;

   //////////
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      xSQL:='SELECT A.CLAUXID, S.CLAUXDES, '+
          'A.PROV, A.PROVDES, A.PROVDIR, A.PROVCZIP, D.ZIPDES, A.PROVTELF, '+
          'A.PROVFAX, A.PROVEMAI, A.PROVDNI, A.PROVRUC, A.PROVUFMOV '+
          'FROM TGE201 A '+
          'LEFT JOIN TGE122 D ON (D.ZIPID=A.PROVCZIP) '+
          'LEFT JOIN TGE102 S ON (S.CLAUXID=A.CLAUXID)';
      if FToolCtaCteProv.chbFecha.Checked = False then
       	xSQL:=xSQL+' WHERE (A.PROVUFMOV>='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,FToolCtaCteProv.dtpINI.Date)+''')) '+
                   ' AND (A.PROVUFMOV<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,FToolCtaCteProv.dtpFIN.Date)+''')) ';
      xSQL:=xSQL+' and A.CLAUXID='''+GCtaCte.FMant.cds2.FieldByName('CLAUXID').AsString+'''';
      xSQL:=xSQL+' and A.PROV='''   +GCtaCte.FMant.cds2.FieldByName('PROV').AsString   +'''';
   end;

   if (SRV_D = 'ORACLE') then
   begin
      xSQL:='SELECT A.CLAUXID, S.CLAUXDES, '+
            'A.PROV, A.PROVDES, A.PROVDIR, A.PROVCZIP, D.ZIPDES, A.PROVTELF, '+
            'A.PROVFAX, A.PROVEMAI, A.PROVDNI, A.PROVRUC, A.PROVUFMOV '+
            'FROM TGE201 A, TGE122 D, TGE102 S '+
            'WHERE D.ZIPID(+)=A.PROVCZIP '
           +'  AND S.CLAUXID(+)=A.CLAUXID';
      if FToolCtaCteProv.chbFecha.Checked = False then
  	      xSQL:=xSQL+' AND (A.PROVUFMOV>='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,FToolCtaCteProv.dtpINI.Date)+''')) '+
                    ' AND (A.PROVUFMOV<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,FToolCtaCteProv.dtpFIN.Date)+''')) ';
      xSQL:=xSQL+' and A.CLAUXID='''+GCtaCte.FMant.cds2.FieldByName('CLAUXID').AsString+'''';
      xSQL:=xSQL+' and A.PROV='''   +GCtaCte.FMant.cds2.FieldByName('PROV').AsString   +'''';
   end;

   xSQL:='Select * from ( '+xSQL+' ) SOLVISTA ';

   DMCXP.cdsCXP.Close;
   DMCXP.cdsCXP.DataRequest( xSQL );
   DMCXP.cdsCXP.Open;

  /////////

   DecodeDate(dateS,aa,mm,dd);

   sCIA:=FToolCtaCteProv.dblcCia.Text;

   sSQL:='SELECT '+DMCXP.wReplacCeros+'(SALDTMN'+StrZero(IntToStr(mm-1),2)+',0) SALLOC, '
        + 			DMCXP.wReplacCeros+'(SALDTME'+StrZero(IntToStr(mm-1),2)+',0) SALEXT  '
        +'FROM TGE401 '
        +'WHERE CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text)
        +'  and ANO='+QuotedStr(IntToStr(aa))
        +'  and CLAUXID='+QuotedStr(DMCXP.cdsCXP.FieldByName('CLAUXID').AsString)
        +'  and AUXID='+QuotedStr(DMCXP.cdsCXP.FieldByName('PROV').AsString);
 	DMCXP.cdsQry2.Close;
	DMCXP.cdsQry2.DataRequest(sSQL);
	DMCXP.cdsQry2.Open;


   // Graba Log de Consultas
   DMCXP.Graba_Log_Consultas( DMCXP.wModulo, DMCXP.wUsuario, 'Registro de Compras',
              FToolCtaCteProv.dblcCia.Text,                  // Campañía
              '',  '',                                       // Periodo Inicio - Final
              FormatDateTime(DMCXP.wFormatFecha,FToolCtaCteProv.dtpINI.Date),
              FormatDateTime(DMCXP.wFormatFecha,FToolCtaCteProv.dtpFIN.Date),                                        // Fecha   Inicio - final
              '',  '',                                       // Nivel   - Origen
              '', '0',                                       // Lote    -  Moneda
              '', DMCXP.cdsCXP.FieldByName('PROV').AsString, // Cuentas - Auxiliares
              '', 'Impresora',                               // Costos - Tipo Salida
              '' );               // Tipo Rep


	cSQLCtaCte;

	try
      FEstCxCPro := TFEstCxCPro.create( Application );

      FEstCxCPro.seAno.Value:= aa;
      FEstCxCPro.seMes.Text := StrZero(FloattoStr(mm),2);
      FEstCxCPro.CiaID     := FToolCtaCteProv.dblcCia.Text;
		FEstCxCPro.Moneda    := DMCXP.wTMonExt;
		FEstCxCPro.Activar   := False;
		FEstCxCPro.MonLoc    := False;
		FEstCxCPro.Internal  := True;
		FEstCxCPro.SaldoIni  := DMCXP.cdsQry2.FieldByName('SALLOC').AsFloat;
		FEstCxCPro.SaldoIniL := DMCXP.cdsQry2.FieldByName('SALLOC').AsFloat;
		FEstCxCPro.SaldoIniE := DMCXP.cdsQry2.FieldByName('SALEXT').AsFloat;
		FEstCxCPro.Anio      := aa;
		FEstCxCPro.Mes       := mm;
 		ShowWindow( FEstCxCPro.Handle, SW_HIDE ) ;
		FEstCxCPro.ShowModal ;
	finally
		FEstCxCPro.Free;
	end;
	Screen.Cursor := crDefault ;
end;


procedure TFPrincipal.cSQLCtaCte;
var
  sDisp,sAnt,sLet,sNCre,sChe,sCarAbo,sTotal : string ;
  xWhere : String;
  sMoneda : String ;
  mm,dd : word;
  iYEAR : Word;
  sFechaEmision, sSAANT, sSACUM, sMES, sSQL, sMESA, sMesN, sGroupBy : String;
  dTCambio:double;
begin
  // Tipo de Cambio
  if (SRV_D = 'DB2400') or (SRV_D = 'DB2NT')  then
     sSQL:='SELECT FECHA, '+DMCXP.wReplacCeros+'(TCAM'+DMCXP.wVRN_TipoCambio+',0) CAMBIO '
          +'FROM TGE107 '
          +'WHERE TMONID='+QuotedStr(DMCXP.wTMonExt)+' '
          +  'AND FECHA>='+DMCXP.wRepFuncDate+QuotedStr(FORMATDATETIME(DMCXP.wFormatFecha,Date-30))+') '
          +  'AND FECHA<='+DMCXP.wRepFuncDate+QuotedStr(FORMATDATETIME(DMCXP.wFormatFecha,Date))+') '
          +'ORDER BY FECHA DESC '
  else
     sSQL:='SELECT '+DMCXP.wReplacCeros+'(TCAM'+DMCXP.wVRN_TipoCambio+',0) CAMBIO '
          +'FROM TGE107 '
          +'WHERE TMONID='+QuotedStr(DMCXP.wTMonExt)+' '
          +  'AND FECHA>='+DMCXP.wRepFuncDate+QuotedStr(FORMATDATETIME(DMCXP.wFormatFecha,Date-30))+') '
          +  'AND FECHA<='+DMCXP.wRepFuncDate+QuotedStr(FORMATDATETIME(DMCXP.wFormatFecha,Date))+') '
          + 'ORDER BY FECHA DESC ';
    //**
  DMCXP.cdsSQL.close;
  DMCXP.cdsSQL.DataRequest(sSQL);
  DMCXP.cdsSQL.Open;
  dTCambio:=DMCXP.cdsSQL.FieldByName('CAMBIO').AsFloat;

  DecodeDate(date,iYear,mm,dd);
  sMES  := StrZero(IntToStr(mm),2);
  sMESN  := StrZero(IntToStr(mm+1),2);
  sMESA  := StrZero(IntToStr(mm-1),2);

// determina códigos de documentos
   sChe := ''; sAnt := ''; sLet := ''; sNCre:= '';
   if DMCXP.cdsTDoc.Locate('DOC_FREG','H',[]) then sChe := DMCXP.cdsTDoc.FieldByName('DOCID').AsString; // Cheques
   if DMCXP.cdsTDoc.Locate('DOC_FREG','A',[]) then sAnt := DMCXP.cdsTDoc.FieldByName('DOCID').AsString; // Anticipos
   if DMCXP.cdsTDoc.Locate('DOC_FREG','L',[]) then sLet := DMCXP.cdsTDoc.FieldByName('DOCID').AsString; // Letras
   if DMCXP.cdsTDoc.Locate('DOC_FREG','N',[]) then sNCre:= DMCXP.cdsTDoc.FieldByName('DOCID').AsString; // Notas de Crédito


   xWhere := 'CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text)+' '+
             'AND ANO='+QuotedStr(inttostr(iYear))+' '+
             'AND CLAUXID='+QuotedStr(DMCXP.cdsCxP.FieldByName('CLAUXID').AsString)+' '+
             'AND AUXID='+QuotedStr(DMCXP.cdsCxP.FieldByName('PROV').AsString);

   if sMes<>'12' Then
      sFechaEmision:='01'+'/'+sMesN+'/'+IntToStr(iYEAR)
   else
      sFechaEmision:='01'+'/'+'01'+'/'+IntToStr(iYEAR+1);

   sGroupBy:= ' GROUP BY SAL.CLAUXID, SAL.AUXID,PROVEED.CLAUXID, PROVEED.PROV, PROVEED.PROVDES, '+
              'SAL.SALDSMN'+sMESA+', SAL.SALDSME'+sMESA+', SAL.DEBESMN'+sMES+', SAL.DEBESME'+sMES+', '+
              'SAL.HABESMN'+sMES+', SAL.HABESME'+sMES+' ';

   sSACUM:=DMCXP.wReplacCeros+'(SAL.SALDSMN'+sMESA+',0.00)+ '+DMCXP.wReplacCeros+'(SAL.DEBESMN'+sMES+',0.00) '+
           '- '+DMCXP.wReplacCeros+'(HABESMN'+sMES+',0.00) AS SALACUMMN, '+
           DMCXP.wReplacCeros+'(SAL.SALDSME'+sMESA+',0.00)+ '+DMCXP.wReplacCeros+'(SAL.DEBESME'+sMES+',0.00) '+
           '- '+DMCXP.wReplacCeros+'(HABESME'+sMES+',0.00) AS SALACUMME';

   sTotal:=DMCXP.wReplacCeros+'(SAL.SALDSMN'+sMESA+',0.00)+ '+DMCXP.wReplacCeros+'(SAL.DEBESMN'+sMES+',0.00) '+
           '- '+DMCXP.wReplacCeros+'(HABESMN'+sMES+',0.00) AS SALTOTALMN, '+
           DMCXP.wReplacCeros+'(SAL.SALDSME'+sMESA+',0.00)+ '+DMCXP.wReplacCeros+'(SAL.DEBESME'+sMES+',0.00) '+
					 '- '+DMCXP.wReplacCeros+'(HABESME'+sMES+',0.00) AS SALTOTALME ';

   sDisp:='';

   sCarAbo:= DMCXP.wReplacCeros+'(SAL.DEBESMN'+sMES+',0.00) AS CARGOSMN, '+DMCXP.wReplacCeros+'(SAL.HABESMN'+sMES+',0.00) AS ABONOSMN, '+
             DMCXP.wReplacCeros+'(SAL.DEBESME'+sMES+',0.00) AS CARGOSME, '+DMCXP.wReplacCeros+'(SAL.HABESME'+sMES+',0.00) AS ABONOSME ';

   sSAANT := DMCXP.wReplacCeros+'(SAL.SALDSMN'+sMESA+',0.00) AS SALANTMN, '+
             DMCXP.wReplacCeros+'(SAL.SALDSME'+sMESA+',0.00) AS SALANTME';

   if (SRV_D = 'DB2400') or (SRV_D = 'DB2NT') then
   	sSQL:='SELECT SAL.CLAUXID, SAL.AUXID, '+
//          sDisp   +', '+ // DISPONIBLE
          sSACUM  +', '+ // SALACUMMN y SALACUMME
          sSAANT  +', '+ // SALANTMN y SALANTME
          sCarAbo +', '+ // CARGOSMN, CARGOSME, ABONOSMN y ABONOSME
          sTotal  +', '+ // SALTOTALMN y SALTOTALME
          'PROVEED.CLAUXID, PROVEED.PROV, PROVEED.PROVDES, '+
          'SUM(CASE WHEN DOCS.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN DOCS.LETSALLOC  ELSE 0.00 END) LETNORLOC, '+
          'SUM(CASE WHEN DOCS.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN DOCS.LETSALEXT  ELSE 0.00 END) LETNOREXT, '+
          'SUM(CASE WHEN DOCS.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN DOCS.CHESALLOC  ELSE 0.00 END) CHENORLOC, '+
          'SUM(CASE WHEN DOCS.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN DOCS.CHESALEXT  ELSE 0.00 END) CHENOREXT, '+
          'SUM(CASE WHEN DOCS.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN DOCS.ANTSALLOC  ELSE 0.00 END) ANTNORLOC, '+
          'SUM(CASE WHEN DOCS.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN DOCS.ANTSALEXT  ELSE 0.00 END) ANTNOREXT, '+
          'SUM(CASE WHEN DOCS.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN DOCS.NCRESALLOC ELSE 0.00 END) NCRENORLOC, '+
          'SUM(CASE WHEN DOCS.TMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN DOCS.NCRESALEXT ELSE 0.00 END) NCRENOREXT '+
          'FROM TGE401 SAL '+
          'LEFT JOIN TGE201 PROVEED ON '+
          'PROVEED.CLAUXID=SAL.CLAUXID AND PROVEED.PROV=SAL.AUXID '+
          'LEFT JOIN (SELECT PROV, TMONID TMONID, '+
          'SUM(CASE WHEN DOCID='+QuotedStr(sLet)+'  THEN CPSALLOC ELSE 0 END) LETSALLOC, '+
          'SUM(CASE WHEN DOCID='+QuotedStr(sLet)+'  THEN CPSALEXT ELSE 0 END) LETSALEXT, '+
          'SUM(CASE WHEN DOCID='+QuotedStr(sNcre)+' THEN CPSALLOC ELSE 0 END) NCRESALLOC, '+
          'SUM(CASE WHEN DOCID='+QuotedStr(sNCre)+' THEN CPSALEXT ELSE 0 END) NCRESALEXT, '+
          'SUM(CASE WHEN DOCID='+QuotedStr(sChe)+'  THEN CPSALLOC ELSE 0 END) CHESALLOC, '+
          'SUM(CASE WHEN DOCID='+QuotedStr(sChe)+'  THEN CPSALEXT ELSE 0 END) CHESALEXT, '+
          'SUM(CASE WHEN DOCID='+QuotedStr(sAnt)+'  THEN CPSALLOC ELSE 0 END) ANTSALLOC, '+
          'SUM(CASE WHEN DOCID='+QuotedStr(sAnt)+'  THEN CPSALEXT ELSE 0 END) ANTSALEXT '+
          'FROM CXP301 CXP '+
        	'WHERE CXP.CPFEMIS<DATE('+QuotedStr(sFechaEmision)+') AND CXP.CPESTADO='+QuotedStr('P')+' '+
          'AND CXP.DOCID IN ('+QuotedStr(sLet)+', '+QuotedStr(sAnt)+', '+QuotedStr(sNcre)+', '+QuotedStr(sChe)+') '+
          'GROUP BY PROV,TMONID) DOCS ON DOCS.PROV=SAL.AUXID '+
          'WHERE SAL.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text)+' '+
          'AND SAL.ANO='+QuotedStr(IntToStr(iYEAR))+' '+
          'AND SAL.CLAUXID='+QuotedStr(DMCXP.cdsCXP.FieldByName('CLAUXID').AsString)+' '+
          'AND SAL.AUXID='+QuotedStr(DMCXP.cdsCXP.FieldByName('PROV').AsString)
   else
      sSQL:=' SELECT SAL.CLAUXID, SAL.AUXID, '
//        + sDisp   +',' // DISPONIBLE
        + sSACUM  +',' // SALACUMMN y SALACUMME
        + sSAANT  +',' // SALANTMN y SALANTME
        + sCarAbo +',' // CARGOSMN, CARGOSME, ABONOSMN y ABONOSME
        + sTotal  +',' // SALTOTALMN y SALTOTALME
        +' PROVEED.CLAUXID, PROVEED.PROV, PROVEED.PROVDES, '
        +' sum(case when DOCS.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' then DOCS.LETSALLOC  else 0.00 end) LETNORLOC, '
        +' sum(case when DOCS.TMONID='+QuotedStr(DMCXP.wTMonExt)+' then DOCS.LETSALEXT  else 0.00 end) LETNOREXT, '
        +' sum(case when DOCS.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' then DOCS.CHESALLOC  else 0.00 end) CHENORLOC, '
        +' sum(case when DOCS.TMONID='+QuotedStr(DMCXP.wTMonExt)+' then DOCS.CHESALEXT  else 0.00 end) CHENOREXT, '
        +' sum(case when DOCS.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' then DOCS.ANTSALLOC  else 0.00 end) ANTNORLOC, '
        +' sum(case when DOCS.TMONID='+QuotedStr(DMCXP.wTMonExt)+' then DOCS.ANTSALEXT  else 0.00 end) ANTNOREXT, '
		  +' sum(case when DOCS.TMONID='+QuotedStr(DMCXP.wTMonLoc)+' then DOCS.NCRESALLOC else 0.00 end) NCRENORLOC,'
        +' sum(case when DOCS.TMONID='+QuotedStr(DMCXP.wTMonExt)+' then DOCS.NCRESALEXT else 0.00 end) NCRENOREXT '
        +' From TGE401 SAL,TGE201 PROVEED,'
        +' (select PROV,TMONID, '
        +' sum(case when DOCID='+QuotedStr(sLet)+'  then CPSALLOC else 0 end) LETSALLOC, '
        +' sum(case when DOCID='+QuotedStr(sLet)+'  then CPSALEXT else 0 end) LETSALEXT, '
        +' sum(case when DOCID='+QuotedStr(sNcre)+' then CPSALLOC else 0 end) NCRESALLOC,'
        +' sum(case when DOCID='+QuotedStr(sNCre)+' then CPSALEXT else 0 end) NCRESALEXT,'
        +' sum(case when DOCID='+QuotedStr(sChe)+'  then CPSALLOC else 0 end) CHESALLOC, '
        +' sum(case when DOCID='+QuotedStr(sChe)+'  then CPSALEXT else 0 end) CHESALEXT, '
        +' sum(case when DOCID='+QuotedStr(sAnt)+'  then CPSALLOC else 0 end) ANTSALLOC, '
        +' sum(case when DOCID='+QuotedStr(sAnt)+'  then CPSALEXT else 0 end) ANTSALEXT  '
        +' FROM CXP301 CXP '
        +' WHERE CXP.CPFEMIS<TO_DATE('+QuotedStr(sFechaEmision)+') AND CXP.CPESTADO='+QuotedStr('P')
        +' AND CXP.DOCID IN ('+QuotedStr(sLet)+','+QuotedStr(sAnt)+','+QuotedStr(sNcre)+','+QuotedStr(sChe)+')'
        +' GROUP BY PROV,TMONID) DOCS'
        +' WHERE SAL.CIAID='+QuotedStr(FToolCtaCteProv.dblcCia.Text)
        +' AND SAL.ANO='+QuotedStr(IntToStr(iYEAR))+' AND SAL.CLAUXID='
        +QuotedStr(DMCXP.cdsCXP.FieldByName('CLAUXID').AsString)
        +' AND SAL.AUXID='+QuotedStr(DMCXP.cdsCXP.FieldByName('PROV').AsString)
    //    +' AND PROVEED.CIAID(+)='+QuotedStr(FToolCtaCteProv.dblcCia.Text)
        +' AND PROVEED.CLAUXID(+)=SAL.CLAUXID AND PROVEED.PROV(+)=SAL.AUXID '
        +' AND DOCS.PROV(+)=SAL.AUXID';
    //**
   sMoneda := 'ME' ;

   sSQL := sSQL + sGroupBy ;
   DMCXP.cdsQry1.Close;
   DMCXP.cdsQry1.DataRequest ( sSQL );
   DMCXP.cdsQry1.Open;
end;



procedure TFPrincipal.Z1TransfDAOTClick(Sender: TObject);
begin
{
   SacaMenu(sender);
   FTransfDAOT:=TFTransfdaot.Create(Self);
   Try
      FTransfDAOT.ShowModal;
   Finally
      FTransfDAOT.Free;
   end;
   }
end;

procedure TFPrincipal.BitBtn2Click(Sender: TObject);
var
   xSQL, sResta : String;
   wSubT,xTotal : Double;
begin
   xSQL := 'Select * From CXP301 '
          +'where TCANJEID=''CB'' ';
//   xSQL := xSQL+' and CPCANJE=''000012'' ';
   Filtracds( DMCXP.cdsMovCxP,xSQL);
   DMCXP.cdsMovCxP.IndexFieldNames:='CIAID;TDIARID;CPANOMES;CPNOREG';
   DMCXP.cdsMovCxP.First;
   while not DMCXP.cdsMovCxP.EOF do
   begin

   // Detalle de Nota de Cobranza
      xSQL:='Select * From CXP302 '
           +'where CIAID='+QuotedStr(DMCXP.cdsMovCxP.FieldByName('CIAID').AsString)
           +'  and TDIARID='+QuotedStr(DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString)
           +'  and DCPANOMM='+QuotedStr(DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString)
           +'  and CPNOREG='+QuotedStr(DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString);
      Filtracds(DMCXP.cdsDetCxP,xSQL);
      DMCXP.cdsDetCxP.First;
      while not DMCXP.cdsDetCxP.EOF do
      begin
         DMCXP.cdsDetCxP.Delete;
      end;

   // Detalle de Documentos
      xSQL:='Select * From CXP304 '
           +'where CIAID='+QuotedStr(DMCXP.cdsMovCxP.FieldByName('CIAID').AsString)
           +'  and TCANJEID=''CB'' '
           +'  and CCPCANJE='+QuotedStr(DMCXP.cdsMovCxP.FieldByName('CPCANJE').AsString);
      Filtracds(DMCXP.cdsCanje,xSQL);
      DMCXP.cdsCanje.IndexFieldNames:='CIAID;TDIARID;CPANOMES;CPNOREG';
      DMCXP.cdsCanje.First;
      xTotal := 0;
      while not DMCXP.cdsCanje.EOF do
      begin
         DMCXP.cdsDetCxP.Append;
         DMCXP.cdsDetCxP.FieldByName('CIAID').AsString     := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
         DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString   := DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString   := DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString   := copy(DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString,1,4);
         DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString  := DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString;
         DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString   := 'CP';
         DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString   := DMCXP.cdsMovCxP.FieldByName('DCPLOTE').AsString;
         DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString   := DMCXP.cdsMovCxP.FieldByName('CLAUXID').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString  := DMCXP.cdsCanje.FieldByName('PROV').AsString;
         DMCXP.cdsDetCxP.FieldByName('DOCID').AsString     := DMCXP.cdsCanje.FieldByName('DOCID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString   := DMCXP.cdsCanje.FieldByName('CPSERIE').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString   := DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat   := DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat   := DMCXP.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime := DMCXP.cdsMovCxP.FieldByName('CPFCANJE').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString  := DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString   := DMCXP.cdsMovCxP.FieldByName('CPUSER').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime := DMCXP.cdsMovCxP.FieldByName('CPFREG').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime := DMCXP.cdsMovCxP.FieldByName('CPHREG').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString     := DMCXP.cdsMovCxP.FieldByName('CPMM').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString     := DMCXP.cdsMovCxP.FieldByName('CPDD').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString    := DMCXP.cdsMovCxP.FieldByName('CPTRI').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString    := DMCXP.cdsMovCxP.FieldByName('CPSEM').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString     := DMCXP.cdsMovCxP.FieldByName('CPSS').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPAATri').AsString  := DMCXP.cdsMovCxP.FieldByName('CPAATRI').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPAASem').AsString  := DMCXP.cdsMovCxP.FieldByName('CPAASEM').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString   := DMCXP.cdsMovCxP.FieldByName('CPAASS').AsString;
         DMCXP.cdsDetCxP.FieldByName('TMONID').AsString    := DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;

         DMCXP.cdsTipReg.IndexFieldNames:='TIPDET';
         DMCXP.cdsTipReg.SetKey;
         DMCXP.cdsTipReg.FieldByName('TIPDET').AsString:='MG';
         DMCXP.cdsTipReg.Gotokey;
	      DMCXP.cdsDetCxP.Edit;
         DMCXP.cdsDetCxP.FieldByName('TREGID').AsString := DMCXP.cdsTipReg.FieldByName('TREGID').AsString;
         DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString := DMCXP.cdsTipReg.FieldByName('TIPDET').AsString;
         sResta:=BuscaQry('dspTGE','TGE110','DOCRESTA,DOCABR','DOCMOD='''+DMCXP.wModulo+''' AND DOCID='+QuotedStr(DMCXP.cdsCanje.FieldByName('DOCID').AsString),'DOCRESTA');
         if sResta='S' then
  		      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString  := 'H'
         else
            DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString  := 'D';
         DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:= DMCXP.cdsQry.FieldByName('DOCABR').AsString
                                                     +' '+DMCXP.cdsCanje.FieldByName('CPSERIE').AsString
																	  +'-'+DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
         xSQL := 'Select * From CXP301 '
                +' where CIAID='+QuotedStr(DMCXP.cdsCanje.FieldByName('CIAID').AsString)
                +'  and TDIARID='+QuotedStr(DMCXP.cdsCanje.FieldByName('TDIARID').AsString)
                +'  and CPANOMES='+QuotedStr(DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString)
                +'  and CPNOREG='+QuotedStr(DMCXP.cdsCanje.FieldByName('CPNOREG').AsString);
         Filtracds(DMCXP.cdsQry5,xSQL);

	      DMCXP.cdsDetCxP.Edit;
         DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString  := DMCXP.cdsQry5.FieldByName('CPTOTOT').AsString;
         DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString:= DMCXP.cdsQry5.FieldByName('CTATOTAL').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime := DMCXP.cdsQry5.FieldByName('CPFEMIS').AsDateTime;

{		   if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
         begin
			   DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat;
			   DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat;
			   wSubT := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat/DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat;
			   wSubT := fRound(wSubT,15,2);
			   DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := wSubT;
         end
         else
		   begin
			   DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat;
			   DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat;
			   wSubT := DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat*DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat;
			   wSubT := fRound(wSubT,15,2);
			   DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := wSubT;
		   end;
}
         if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
         begin
			   DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat;
			   DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat;
			   wSubT := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat/DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat;
			   wSubT := fRound(wSubT,15,2);
			   DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := wSubT;
            if sResta='S' then
  			      xTotal := xTotal-DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat
            else
  			      xTotal := xTotal+DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
         end
         else
         begin
			   DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat;
			   DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat;
			   wSubT := DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat*DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat;
			   wSubT := fRound(wSubT,15,2);
			   DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := wSubT;
            if sResta='S' then
  		      	xTotal := xTotal-DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat
            else
  			      xTotal := xTotal+DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat;
         end;
         DMCXP.cdsCanje.Next;
      end;

   // Graba el Monto de la Nota de Cobranza como último Detalle
	   DMCXP.cdsDetCxP.Insert;
      DMCXP.cdsDetCxP.FieldByName('CIAID').AsString     := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
      DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString   := DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString   := DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString   := copy(DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString,1,4);
      DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString  := DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString   := DMCXP.cdsMovCxP.FieldByName('DCPLOTE').AsString;
      DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString   := 'CP';
      DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString   := DMCXP.cdsMovCxP.FieldByName('CLAUXID').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString  := DMCXP.cdsMovCxP.FieldByName('PROV').AsString;
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString     := DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString   := DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString   := DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat   := DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat   := DMCXP.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime := DMCXP.cdsMovCxP.FieldByName('CPFEMIS').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime := DMCXP.cdsMovCxP.FieldByName('CPFCANJE').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString  := DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString   := DMCXP.cdsMovCxP.FieldByName('CPUSER').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime := DMCXP.cdsMovCxP.FieldByName('CPFREG').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime := DMCXP.cdsMovCxP.FieldByName('CPHREG').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString     := DMCXP.cdsMovCxP.FieldByName('CPMM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString     := DMCXP.cdsMovCxP.FieldByName('CPDD').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString    := DMCXP.cdsMovCxP.FieldByName('CPTRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString    := DMCXP.cdsMovCxP.FieldByName('CPSEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString     := DMCXP.cdsMovCxP.FieldByName('CPSS').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAATri').AsString  := DMCXP.cdsMovCxP.FieldByName('CPAATRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASem').AsString  := DMCXP.cdsMovCxP.FieldByName('CPAASEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString   := DMCXP.cdsMovCxP.FieldByName('CPAASS').AsString;
      DMCXP.cdsDetCxP.FieldByName('TMONID').AsString    := DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;

      DMCXP.cdsTipReg.IndexFieldNames:='TIPDET';
      DMCXP.cdsTipReg.SetKey;
      DMCXP.cdsTipReg.FieldByName('TIPDET').AsString:='TO';
      DMCXP.cdsTipReg.Gotokey;
			//
	   DMCXP.cdsDetCxP.Edit;
	   DMCXP.cdsDetCxP.FieldByName('TREGID').AsString   := DMCXP.cdsTipReg.FieldByName('TREGID').AsString;
	   DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString   := DMCXP.cdsTipReg.FieldByName('TIPDET').AsString;
	   DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := 'H';
	   DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   := DMCXP.cdsMovCxP.FieldByName('CPTOTOT').AsString;
	   DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := DMCXP.cdsMovCxP.FieldByName('CTATOTAL').AsString;
	   DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := 'NOTA COBRANZA '
                                                       +DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString+' '
                                                       +DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
	   if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
      begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := xTotal;
		   DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := xTotal;
		   wSubT := xTotal/DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').Asfloat;
		   wSubT := fRound(wSubT,15,2);
		   DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := wSubT;
	   end
	   else
	   begin
		   DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := xTotal;
		   DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := xTotal;
		   wSubT := xTotal*DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').Asfloat;
		   wSubT := fRound(wSubT,15,2);
		   DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := wSubT;
	   end;
	   DMCXP.cdsDetCxP.Post;
      xSQL:='Select * From CXP302 '
           +'where CIAID='+QuotedStr(DMCXP.cdsMovCxP.FieldByName('CIAID').AsString)
           +'  and TDIARID='+QuotedStr(DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString)
           +'  and DCPANOMM='+QuotedStr(DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString)
           +'  and CPNOREG='+QuotedStr(DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString);
      DMCXP.cdsDetCxP.DataRequest(xSQL);
      DMCXP.cdsDetCxP.ApplyUpdates(0);

      DMCXP.cdsMovCxP.Next;
   end;
   ShowMessage('OK');
end;

procedure TFPrincipal.Z1sbRetCuartaClick(Sender: TObject);
var
   xSQL : string;
begin

  xSQL:='SELECT A.CIAID, A.CPANOMES, A.TDIARID, A.CPNOREG, A.CLAUXID, A.PROV, A.PROVRUC, '
       +  'A.PROVDES, A.DOCID, A.CPSERIE, A.CPNODOC, A.CPFEMIS, '
       +  'A.TMONID, A.CPTCAMPR, A.CPESTADO, A.CP_CONTA, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPGRAVAD ELSE 0 END BASEME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPIGV*-1 ELSE 0 END CUARME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPISC*-1 ELSE 0 END IESME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPMTOORI ELSE 0 END TOTME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPGRAVAD ELSE A.CPGRAVAD END BASEMN, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPIGV    ELSE A.CPIGV    END CUARMN, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPISC    ELSE A.CPISC    END IESMN, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPMTOLOC ELSE A.CPMTOLOC END TOTMN '
       +'FROM CXP301 A, '
       +  '( SELECT CIAID, TDIARID, DCPANOMM, CPNOREG,  SUM( CPGRAVAD )  CPGRAVAD, '
       +      'SUM( CPIGV ) CPIGV, SUM( CPISC ) CPISC, SUM( CPMTOLOC ) CPMTOLOC '
       +    'FROM ( SELECT CIAID, TDIARID, DCPANOMM, CPNOREG, '
       +             'CASE WHEN TIPDET=''MG'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD, '
       +             'CASE WHEN TIPDET=''I1'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV, '
       +             'CASE WHEN TIPDET=''I2'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPISC, '
       +             'CASE WHEN TIPDET=''TO'' THEN DCPMOLOC * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOLOC '
       +           'FROM CXP302 '
       +           'WHERE CIAID=''ZZ'' AND DCPANOC=''ZZZZ'' AND CLAUXID=''Z'' AND DCPAUXID=''ZZZZZ'' '
       +         ') A '
       +    'GROUP BY CIAID, TDIARID, DCPANOMM, CPNOREG '
       +  ') B '
       +'WHERE A.CIAID=''ZZ'' AND A.CPAAAA=''ZZZZ'' AND A.PROV=''ZZZZZ'' '
       +  'AND A.CIAID=B.CIAID AND A.TDIARID=B.TDIARID AND A.CPANOMES=B.DCPANOMM AND A.CPNOREG=B.CPNOREG '
       +'ORDER BY A.CPANOMES, A.CPNOREG';

    try

     FToolRetPend := TFToolRetPend.Create(Self);
     FToolRetPend.Visible := False;

     Mantc                := TMant.Create(Self);
     Mantc.Admin          := DMCXP.wAdmin;
     Mantc.DComC          := DMCXP.DCOM1;
     Mantc.OnEdit         := Nil;
     Mantc.OnShow         := PGridShow;
     Mantc.UsuarioSQL.Add(xSQL) ;
     Mantc.Module         := DMCXP.wModulo;
     Mantc.ClientDataSet  := DMCXP.cdsReporte;
     Mantc.OnCreateMant   := RetPendCreate;
     Mantc.TableName      := 'VWCXPRETCUARTA';
     Mantc.Titulo         := 'RETENCIONES DE CUARTA CATEGORIA';
     Mantc.User           := DMCXP.wUsuario;
     Mantc.SectionName    :='CXPRetCuarta';
     Mantc.FileNameIni    :='\oaCXP.INI';
     Mantc.Execute;
   finally
     Mantc.Free;
     SacaMenu(sender);
   end;

end;

procedure TFPrincipal.Z2CuadroMensualClick(Sender: TObject);
begin
   {
   SacaMenu(sender);
   FCuadroMensual:=TFCuadroMensual.Create(Self);
   Try
      FCuadroMensual.ShowModal;
   Finally
      FCuadroMensual.Free;
   end;
   }
end;

procedure TFPrincipal.Z1sbMovProvClick(Sender: TObject);
var
   xSQL : String;
begin
   xSQL:='Select * From ( '
        +'select A.CIAID, B.CIADES, A.CPANOMES, A.TDIARID, CPNOREG, C.TDIARDES, '
        +   'A.CLAUXID, D.CLAUXDES, A.PROV, A.PROVRUC, E.PROVDES, '
        +   'PROV_PROC, DESCRIP PROCEDENCIA, DCPLOTE, A.DOCID, A.CPSERIE, '
        +   'A.CPNODOC, CPFCMPRB, CPFEMIS, CPFVCMTO, A.TMONID, '
        +   'G.TMONDES, G.TMONABR, CPTCAMPR, CPESTADO, ESTDOCDES,  CP_CONTA, '
        +   'A.CPMTOORI, A.CPMTOLOC, A.CPMTOEXT, A.CPSALORI, A.CPSALLOC, A.CPSALEXT, '
        +   'A.CPTOTOT, I.CPTODES '
        +'FROM CXP301 A, TGE101 B, TGE104 C, TGE102 D, TGE201 E, TGE829 F, '
        +  'TGE103 G, TGE115 H, CXP201 I '
        +'WHERE A.CIAID=B.CIAID AND A.TDIARID=C.TDIARID AND A.CLAUXID=D.CLAUXID '
        +  'AND A.CLAUXID=E.CLAUXID AND A.PROV=E.PROV AND E.PROV_PROC=F.ID '
        +  'AND A.TMONID=G.TMONID AND CPESTADO=ESTDOCID '
        +  'AND A.CIAID=I.CIAID AND A.CPTOTOT=I.CPTOID '
        +' ) SOLVISTA '
        +'ORDER BY CIAID, PROV_PROC, PROV, TMONID, CPFCMPRB';

   try
      SacaMenu(sender);
      FToolVista := TFToolVista.Create(Self);

      GProvision := TMant.Create(Self);
      GProvision.Admin          := DMCXP.wAdmin;
      GProvision.DComC          := DMCXP.DCom1;
      GProvision.ClientDataSet  := DMCXP.cdsMovCxP;
      GProvision.TableName      := 'VWCXPMOVPROV';
      GProvision.Filter         := xSelDoc;
      GProvision.Titulo         := 'Movimientos por Proveedores';
      GProvision.User           := DMCXP.wUsuario;
      GProvision.Module         := DMCXP.wModulo ;
      GProvision.SectionName    := 'CXPMovProv';
      GProvision.FileNameIni    := '\oaCXP.INI';
      GProvision.OnCreateMant   := VistaCreateMant;
      GProvision.UsuarioSQL.Add( xSQL );
      GProvision.Execute;
   finally
      GProvision.Free;
      FToolVista.Free;
   end;
end;

procedure TFPrincipal.VistaCreateMant(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolVista.pnlTool;
  pl := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 2;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.AutoSize := True;
  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;

procedure TFPrincipal.Z1sbAbonosClick(Sender: TObject);
begin

   SacaMenu(sender);
   xTipoProv  :='L';
   xSelDoc:='';

   if not FiltraDocGrid1 then Exit;

   FToolAplica := TFToolAplica.Create(Self);
   FToolAplica.Visible := False;

   GLetras := TMant.Create( Self );
   GLetras.Admin          := DMCXP.wAdmin;
   GLetras.OnCreateMant   := AplicaCreate;
   GLetras.OnInsert       := Nil; // LetrasInsert;
   GLetras.OnEdit         := AbonosEdita;
   GLetras.OnShow         := PGridShow;
   GLetras.ClientDataSet  := DMCXP.cdsCCanje;
   GLetras.TableName      := 'CXP308';
   GLetras.Filter         := '( CXP308.TCANJEID=''CA'' or CXP308.TCANJEID=''NC'' )';
   GLetras.Titulo         := 'Aplicación de Abonos';
   GLetras.User           := DMCXP.wUsuario;
   GLetras.DComC          := DMCXP.DCOM1;
   GLetras.Module         := DMCXP.wModulo ;
   GLetras.SectionName	  := 'CXPAbonos';
   GLetras.FileNameIni	  := '\oaCXP.INI';
   try
      GLetras.Execute;
   finally
      DMCXP.cdsLetras.close;
      //GLetras.Free;
      //FLetras.Free;
      //ToolLetras.Free;
      DMCXP.cdsProv.Close;
      DMCXP.cdsTDoc.Filter  :='';
      DMCXP.cdsTDoc.Filtered:=False;
      DMCXP.cdsDetCanje.IndexFieldNames:='';
   end;
end;


procedure TFPrincipal.AbonosEdita(Sender: TObject; MantFields: TFields);
var
   xSQL : String;
begin
   xSQL:='Select * from CXP308 '
        +'Where CIAID='''   +MantFields.FieldByName('CIAID').AsString    +''' '
        +  'AND TCANJEID='''+MantFields.FieldByName('TCANJEID').AsString +''' '
        +  'AND CANJE='''   +MantFields.FieldByName('CANJE').AsString    +'''';
   DMCXP.cdsCCanje.Close;
   DMCXP.cdsCCanje.DataRequest( xSQL );
   DMCXP.cdsCCanje.Open;

   if DMCXP.cdsCCanje.FieldByName('TCANJEID').AsString='NC' then begin

      xSQL:='Select * From CXP301 '
           +'Where CIAID='''   +DMCXP.cdsCCanje.FieldByName('CIAID').AsString   +''' '
           +  'and TCANJEID='''+DMCXP.cdsCCanje.FieldByName('TCANJEID').AsString   +''' '
           +  'and CPCANJE=''' +DMCXP.cdsCCanje.FieldByName('CANJE').AsString +''' ';
      DMCXP.cdsMovCxP2.Close;
      DMCXP.cdsMovCxP2.DataRequest( xSQL );
      DMCXP.cdsMovCxP2.Open;

      xSQL:='CIAID='+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString)
           + ' and PROV='+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('PROV').AsString)
           + ' and DOCID<>'+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('DOCID').AsString)
           + ' AND ( CPESTADO=''P'' ) AND (CPSALLOC > 0 AND CPSALEXT > 0)';
      Filtracds(DMCXP.cdsMovCxP,'Select * From CXP301 Where '+xSQL );

      xSQL:='CIAID='+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString)
           + ' AND TCANJEID='+QuotedStr('NC')
           + ' AND CCPCANJE='+QuotedStr(DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString);
      Filtracds( DMCXP.cdsDetCanje,'Select * From CXP305 Where '+xSQL );

      try
         FCanjeNC := TFCanjeNC.Create(self);
         FCanjeNC.ActiveMDIChild;
//         FVariables.ConfiguraForma( Screen.ActiveForm );
      finally
      end;
   end;

   if DMCXP.cdsCCanje.FieldByName('TCANJEID').AsString='CA' then begin
      xSQL:='Select * From CXP301 '
           +'Where CIAID='''  +DMCXP.cdsCCanje.FieldByName('CIAID').AsString+''' '
           +  'and CLAUXID='''+DMCXP.cdsCCanje.FieldByName('CLAUXID').AsString+''' '
           +  'and PROV='''   +DMCXP.cdsCCanje.FieldByName('PROV').AsString+''' '
           +  'and DOCID='''  +DMCXP.cdsCCanje.FieldByName('NDDOC').AsString+''' '
           +  'and CPSERIE='''+DMCXP.cdsCCanje.FieldByName('NDSERIE').AsString+''' '
           +  'and CPNODOC='''+DMCXP.cdsCCanje.FieldByName('NDNUMERO').AsString+'''';
      DMCXP.cdsMovCxP.Close;
      DMCXP.cdsMovCxP.DataRequest( xSQL );
      DMCXP.cdsMovCxP.Open;

      xSQL:='SELECT A.BANCOID, BANCOABR, CCBCOID, ECNOCHQ, ECFEMICH, ECSALMN, ECSALME, '
           +  'DCDMOLOC PAGOMN, DCDMOEXT PAGOME, ECTCAMB, A.CIAID, TDIARID, ECANOMM, ECNOCOMP '
           +'FROM CAJA302 A, CXP305 C, TGE105 B '
           +'Where A.CIAID='''  +DMCXP.cdsCCanje.FieldByName('CIAID').AsString+''' '
           +  'and A.CLAUXID='''+DMCXP.cdsCCanje.FieldByName('CLAUXID').AsString+''' '
           +  'and A.PROV='''   +DMCXP.cdsCCanje.FieldByName('PROV').AsString+''' '
           +  'and ( ECSALMN>0 AND ECSALME>0 ) '
           +  'and C.CIAID=A.CIAID AND C.CAJATDIAR=A.TDIARID AND C.CAJAAAMM=A.ECANOMM '
           +  'and C.CAJACOMP=A.ECNOCOMP '
           +  'and C.TCANJEID='''+DMCXP.cdsCCanje.FieldByName('TCANJEID').AsString+''' '
           +  'and C.CCPCANJE='''+DMCXP.cdsCCanje.FieldByName('CANJE').AsString   +''' '
           +  'and A.BANCOID=B.BANCOID ';
      DMCXP.cdsDetCanje.Close;
      DMCXP.cdsDetCanje.DataRequest( xSQL );
      DMCXP.cdsDetCanje.Open;

      if DMCXP.cdsDetCanje.Recordcount>0 then begin
         try
           FAplicaCaja := TFAplicaCaja.Create( Self );
           FAplicaCaja.xModo := 'EDITA';
           FAplicaCaja.ActiveMDIChild;
//           FVariables.ConfiguraForma( Screen.ActiveForm );
         finally
         end
      end;
   end;
end;

procedure TFPrincipal.Z1sbMenuActAgRetClick(Sender: TObject);
begin
   {
   pnlMenuReglas.Visible := False;
   FActAgRet := TFActAgRet.Create(Self);
   With FActAgRet do
    Try
     ShowModal;
    Finally
     Free;
    end;
    }
end;

procedure TFPrincipal.ProvisionCierra( Sender: TObject);
begin
   GProvision:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;


procedure TFPrincipal.NCreditoCierra(Sender: TObject);
begin
   GNCredito:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;

procedure TFPrincipal.LetrasCierra(Sender: TObject);
begin
   GLetras:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;

procedure TFPrincipal.PagaresCierra(Sender: TObject);
begin
   GPagares:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;

procedure TFPrincipal.CompensacionCierra(Sender: TObject);
begin
   Mantc:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;

procedure TFPrincipal.AbonosCierra(Sender: TObject);
begin
   GLetras:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;

procedure TFPrincipal.IntermediacionCierra(Sender: TObject);
begin
   GIntermediacion:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;

procedure TFPrincipal.MaesProvCierra(Sender: TObject);
begin
   Mantc:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;

procedure TFPrincipal.CtaCteProvCierra(Sender: TObject);
begin
   GCtaCte:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;

procedure TFPrincipal.DetalleCierra(Sender: TObject);
begin
   GDetProvi:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;

procedure TFPrincipal.LetPendCierra(Sender: TObject);
begin
   Mantc:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;

procedure TFPrincipal.DocProvCierra(Sender: TObject);
begin
   GProvision:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;

procedure TFPrincipal.RetPendCierra(Sender: TObject);
begin
   Mantc:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;

function InicializaMant( wwwMant : TMant ) : Boolean;
begin
   Result:=False;

   if not DMCXP.DCOM1.Connected then Exit;

   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;

   if not Assigned( FPrincipal ) then
      FPrincipal:=TFPrincipal.Create( Application );

   if not ( wwwMant=nil) then Exit;

   Result:=True;
end;

// Inicio HPC_201401_CXP
procedure OPVerificaVersion;
Begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   FPrincipal := TFPrincipal.Create( Application );
   If DMCXP.fg_VerificaVersion(FPrincipal.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.'+#13+'Comuníquese con Soporte Técnico');
			Application.Terminate;
      Exit;
   End;
End;
// Fin HPC_201401_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.CargDirectCierra;
begin
   GCargosDirect:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.CargDirectDelete;
Var
   xSQL : String;
begin
   If FPrincipal.GCargosDirect.FMant.cds2.RecordCount=0 Then Exit;

   xSQL := 'Select IDNUMERO '
      + '     from DB2ADMIN.CXP_PLANTILLAS_DIETAS_DET '
      + '    where CARGO='+quotedstr(MantFields.FieldByName('IDCARGO').AsString);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xSQL );
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount>0 Then
   Begin
      ShowMessage('No se puede eliminar, ya se han registrado Plantillas con el Concepto: '+MantFields.FieldByName('IDCARGO').AsString);
      Exit;
   End;

   xSQL := 'Select ID_NUMERO '
      + '     from DB2ADMIN.CXP_PLANILLAS_DIETAS_DET '
      + '    where CARGO='+quotedstr(MantFields.FieldByName('IDCARGO').AsString);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xSQL );
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount>0 Then
   Begin
      ShowMessage('No se puede eliminar, ya se han registrado Planillas con el Concepto: '+MantFields.FieldByName('IDCARGO').AsString);
      Exit;
   End;

   If MessageDlg('Esta Seguro de Eliminar el Cargo : '+MantFields.FieldByName('IDCARGO').AsString,mtConfirmation, [mbYes, mbNo], 0)=mrYes then
   Begin
      xSQL:= 'delete From DB2ADMIN.CXP_CARGOS_DIRECT '
         + '   where IDCARGO='+QuotedStr(MantFields.FieldByName('IDCARGO').AsString);
      try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      except
      end;
      FPrincipal.GCargosDirect.RefreshFilter;
   End;
//   GCargosDirect:=nil;
end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.CargDirectEdita;
var
   FCargosDirectorio : TFCargosDirectorio;
   xSQL : String;
begin

   if FVariables.w_OP_Registro then
   begin
      ShowMessage( 'Opcion de Registro se encuentra en USO');
      Exit;
   end;

   xSQL:='Select IDCARGO, DESCRIPCION, ESTADO, FECCREA, FECMODIF, USUARIO, FREG, HREG '
      + '   from DB2ADMIN.CXP_CARGOS_DIRECT '
      + '  Where IDCARGO='+quotedstr(MantFields.FieldByName('IDCARGO').AsString);
   DMCXP.cdsCargDirect.Close;
   DMCXP.cdsCargDirect.DataRequest( xSQL );
   DMCXP.cdsCargDirect.Open;

   if DMCXP.cdsCargDirect.RecordCount = 0 then
   begin
      ShowMessage( 'Error : No Existen Registros a Editar');
      exit;
   end;

   DMCXP.wModo := 'M';

   try
     FCargosDirectorio := TFCargosDirectorio.Create( Application );
     FCargosDirectorio.ShowModal;
   finally
     FCargosDirectorio.Free;
     FPrincipal.GCargosDirect.RefreshFilter;
   end;
end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.CargDirectInsert(Sender: TObject);
var
   FCargosDirectorio : TFCargosDirectorio;
   xSQL : String;
begin
   xSQL:='Select IDCARGO, DESCRIPCION, ESTADO, FECCREA, FECMODIF, USUARIO, FREG, HREG '
      + '   from DB2ADMIN.CXP_CARGOS_DIRECT '
      + '  Where 1<>1';
   DMCXP.cdsCargDirect.Close;
   DMCXP.cdsCargDirect.DataRequest( xSQL );
   DMCXP.cdsCargDirect.Open;

   DMCXP.wModo := 'A';
   if not Assigned( FPrincipal ) then
      FPrincipal:=TFPrincipal.Create( Application );
   try
     FCargosDirectorio := TFCargosDirectorio.Create( Application );
     FCargosDirectorio.ShowModal;
   finally
     FCargosDirectorio.Free;
     FPrincipal.GCargosDirect.RefreshFilter;
   end;
end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.CargDirectCreate(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolLetras.pnlBot;
  pl := TMant(Sender).FMant.pnlBtns;

  pl.AutoSize := True;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 5;

  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.PlantillaDietaCreate(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolLetras.pnlBot;
  pl := TMant(Sender).FMant.pnlBtns;

  pl.AutoSize := True;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 5;

  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.PlantillaDietaInsert(Sender: TObject);
var
   FPlantillaDieta : TFPlantillaDieta;
   xSQL : String;
begin
   xSQL:='Select IDNUMERO, DESCRIPCION, CCOSID, TMONID, FECCREA, FECMODIF, USUARIO, FREG, HREG '
      + '   from DB2ADMIN.CXP_PLANT_DIETAS_CAB '
      + '  Where 1<>1';
   DMCXP.cdsPlantillaCab.Close;
   DMCXP.cdsPlantillaCab.DataRequest( xSQL );
   DMCXP.cdsPlantillaCab.Open;

   DMCXP.wModo := 'A';
   if not Assigned( FPrincipal ) then
      FPrincipal:=TFPrincipal.Create( Application );
   try
     FPlantillaDieta := TFPlantillaDieta.Create( Application );
     FPlantillaDieta.ShowModal;
   finally
     FPlantillaDieta.Free;
   end;
end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.PlantillaDietaEdita;
var
   FPlantillaDieta : TFPlantillaDieta;
   xSQL : String;
begin

   if FVariables.w_OP_Registro then
   begin
      ShowMessage( 'Opcion de Registro se encuentra en USO');
      Exit;
   end;

   xSQL:='Select IDNUMERO, DESCRIPCION, CCOSID, TMONID, FECCREA, FECMODIF, USUARIO, FREG, HREG '
      + '   from DB2ADMIN.CXP_PLANT_DIETAS_CAB '
      + '  Where IDNUMERO='+quotedstr(MantFields.FieldByName('IDNUMERO').AsString);
   DMCXP.cdsPlantillaCab.Close;
   DMCXP.cdsPlantillaCab.DataRequest( xSQL );
   DMCXP.cdsPlantillaCab.Open;

   if DMCXP.cdsPlantillaCab.RecordCount = 0 then
   begin
      ShowMessage( 'Error : No Existen Registros a Editar');
      exit;
   end;

   xSQL:='Select C.IDNUMERO, C.CLAUXID, C.PROV, C.PROVDES, C.CARGO IDCARGO, D.DESCRIPCION, C.DOCID, C.CPSERIE, C.CPNODOC, C.MONTOT, C.BANCOID, B.BANCONOM, C.CCBCOID, C.TMONID, C.FECCREA, C.FECMODIF, C.USUARIO, C.FREG, C.HREG '
      + '   from DB2ADMIN.CXP_PLANTILLAS_DIETAS_DET C INNER JOIN CXP_CARGOS_DIRECT D ON C.CARGO = D.IDCARGO '
      + '   INNER JOIN TGE105 B ON C.BANCOID = B.BANCOID '
      + '  Where C.CIAID='+quotedstr('02')+' and C.IDNUMERO='+quotedstr(MantFields.FieldByName('IDNUMERO').AsString);
   DMCXP.cdsPlantillaDet.Close;
   DMCXP.cdsPlantillaDet.DataRequest( xSQL );
   DMCXP.cdsPlantillaDet.Open;

   DMCXP.wModo := 'M';
   FPlantillaDieta := TFPlantillaDieta.Create(Self);
   FPlantillaDieta.ShowModal;

end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.PlantillaDietaDelete;
begin
   GPlantillaDieta:=nil;
end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.PlantillaDietaCierra;
begin
   GPlantillaDieta:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.PlanillaDietaCreate(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolLetras.pnlBot;
  pl := TMant(Sender).FMant.pnlBtns;

  pl.AutoSize := True;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 5;

  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.PlanillaDietaInsert(Sender: TObject);
var
//   FPlanillaDietasDetalle : TFPlanillaDietasDetalle;
   xSQL : String;
begin
   xSQL:='Select ID_NUMERO, IDNUMERO, DESCRIPCION, CCOSID, CUENTAID, TMONID, FECSESION, FECSUGEREN, DESTADO, USUACEPTA, FECACEPTA, '
      + '        USUVISA, FECVISA, FECCREA, FECMODIF, USUARIO, FREG, HREG '
      + '        CIAID, USUAPRUEBA, FECAPRUEBA, USUCONFIRMA, FECCONFIRMA, CONTABILIZA '
      + '   from DB2ADMIN.CXP_PLANI_DIETAS_CAB '
      + '  Where 1<>1';
   DMCXP.cdsPlanillaCab.Close;
   DMCXP.cdsPlanillaCab.DataRequest( xSQL );
   DMCXP.cdsPlanillaCab.Open;

   DMCXP.wModo := 'A';
   if not Assigned( FPrincipal ) then
      FPrincipal:=TFPrincipal.Create( Application );
   try
     FPlanillaDietasDetalle := TFPlanillaDietasDetalle.Create( Application );
     FPlanillaDietasDetalle.ShowModal;
   finally
     FPlanillaDietasDetalle.Free;
   end;
end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.PlanillaDietaEdita;
var
//   FPlanillaDietasDetalle : TFPlanillaDietasDetalle;
   xSQL : String;
begin

   if FVariables.w_OP_Registro then
   begin
      ShowMessage( 'Opcion de Registro se encuentra en USO');
      Exit;
   end;

   xSQL:='Select ID_NUMERO, IDNUMERO, DESCRIPCION, CCOSID, CUENTAID, TMONID, FECSESION, FECSUGEREN, DESTADO, USUACEPTA, FECACEPTA, '
      + '        USUVISA, FECVISA, FECCREA, FECMODIF, USUARIO, FREG, HREG, '
      + '        CIAID, USUAPRUEBA, FECAPRUEBA, USUCONFIRMA, FECCONFIRMA, CONTABILIZA '
      + '   from DB2ADMIN.CXP_PLANI_DIETAS_CAB '
      + '  Where CIAID='+quotedstr('02')
      + '    and ID_NUMERO='+quotedstr(MantFields.FieldByName('ID_NUMERO').AsString);
   DMCXP.cdsPlanillaCab.Close;
   DMCXP.cdsPlanillaCab.DataRequest( xSQL );
   DMCXP.cdsPlanillaCab.Open;

   if DMCXP.cdsPlanillaCab.RecordCount = 0 then
   begin
      ShowMessage( 'Error : No Existen Registros a Editar');
      exit;
   end;

   xSQL:=' Select C.ID_NUMERO, C.ITEM, C.CLAUXID, C.PROV, C.PROVDES, A.PROVRUC, C.CARGO IDCARGO, D.DESCRIPCION, C.MONTOT, C.DOCID, C.CPSERIE, C.CPNODOC, C.BANCOID, B.BANCONOM, C.CCBCOID, C.TMONID, C.FECCREA, C.FECMODIF, C.USUARIO, C.FREG, C.HREG '
           + ' from CXP_PLANILLAS_DIETAS_DET C INNER JOIN CXP_CARGOS_DIRECT D ON C.CARGO = D.IDCARGO '
           + '   INNER JOIN TGE105 B ON C.BANCOID = B.BANCOID '
           + '   INNER JOIN TGE201 A ON C.CLAUXID = A.CLAUXID AND C.PROV = A.PROV '
           + '  Where C.ID_NUMERO='+quotedstr(MantFields.FieldByName('ID_NUMERO').AsString)
           + ' order by C.CLAUXID, C.PROV ';
   DMCXP.cdsPlanillaDet.Close;
   DMCXP.cdsPlanillaDet.DataRequest( xSQL );
   DMCXP.cdsPlanillaDet.Open;

   xSQL:=' Select C.ID_NUMERO, C.BANCOID, B.BANCONOM, C.CCBCOID, C.TMONID, C.FECCREA, C.FECMODIF, C.USUARIO, C.FREG, C.HREG '
           + ' from CXP_PLANILLAS_CUENTA_BANCO C '
           + '   INNER JOIN TGE105 B ON C.BANCOID = B.BANCOID '
           + '  Where C.ID_NUMERO='+quotedstr(MantFields.FieldByName('ID_NUMERO').AsString)
           + ' order by C.BANCOID ';
   DMCXP.cdsPlanillaBanco.Close;
   DMCXP.cdsPlanillaBanco.DataRequest( xSQL );
   DMCXP.cdsPlanillaBanco.Open;

   DMCXP.wModo := 'M';
   FPlanillaDietasDetalle := TFPlanillaDietasDetalle.Create(Self);
   FPlanillaDietasDetalle.ShowModal;

end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.PlanillaDietaDelete;
var
   xSQL : String;
begin
   xSQL:='Select ID_NUMERO, IDNUMERO, DESCRIPCION, CCOSID, CUENTAID, TMONID, FECSESION, FECSUGEREN, DESTADO, USUACEPTA, FECACEPTA, '
      + '        USUVISA, FECVISA, FECCREA, FECMODIF, USUARIO, FREG, HREG, '
      + '        CIAID, USUAPRUEBA, FECAPRUEBA, USUCONFIRMA, FECCONFIRMA, CONTABILIZA '
      + '   from DB2ADMIN.CXP_PLANI_DIETAS_CAB '
      + '  Where CIAID='+quotedstr('02')
      + '    and ID_NUMERO='+quotedstr(MantFields.FieldByName('ID_NUMERO').AsString);
   DMCXP.cdsPlanillaCab.Close;
   DMCXP.cdsPlanillaCab.DataRequest( xSQL );
   DMCXP.cdsPlanillaCab.Open;

   If DMCXP.cdsPlanillaCab.RecordCount = 0 then
   Begin
      ShowMessage( 'Error : No Existen Registros a Eliminar');
      exit;
   End;

   If DMCXP.cdsPlanillaCab.FieldByName('DESTADO').AsString <> 'I' Then
   Begin
      ShowMessage( 'Estado de la Planilla de Pago no permite ELIMINACIÓN');
      exit;
   End;

   If MessageDlg('Esta Seguro de Eliminar la Planilla de Dieta : '+MantFields.FieldByName('ID_NUMERO').AsString,mtConfirmation, [mbYes, mbNo], 0)=mrYes then
   Begin
      xSQL:= 'Update DB2ADMIN.CXP_PLANI_DIETAS_CAB '
         + '     Set DESTADO=''E'', '
         + '         USUARIO='+quotedstr(DMCXP.wUsuario)+','
         + '         FREG=trunc(Sysdate), '
         + '         HREG=Sysdate '
         + '   where CIAID='+quotedstr('02')
         + '     and ID_NUMERO='+quotedstr(MantFields.FieldByName('ID_NUMERO').AsString);
      try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         ShowMessage('Planilla cambió a Estado ELIMINADO correctamente');
      except
      end;
      FPrincipal.GPlanillaDieta.RefreshFilter;
   End;
end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.PlanillaDietaCierra;
begin
   GPlanillaDieta:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;
// Fin HPC_201801_CXP

// Inicio HPC_201801_CXP
// Cambios por Dietas de Directorio
procedure TFPrincipal.PegaToolPlanillaDietas(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolPlanillaDietas.pnGLt;
  pl := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 2;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.AutoSize := True;
  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;
// Fin HPC_201801_CXP

end.
