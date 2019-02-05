unit oaOP0000;

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
//                   24/11/2016  Añade cdsQryRUC para validar algoritmo de RUC
// 

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, oaVariables, mant, DB, DBClient, wwclient, StdCtrls;

type
  TFOPIni = class(TForm)
    wwClientDataSet1: TwwClientDataSet;
    lblVersion: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    MantHelp : TMant;
//    DM2 : TDMCXP;
  end;

  procedure OPDataModulo; stdcall;
  //INICIO SAR666
  procedure OPDataModuloProv; stdcall;
  //FIN SAR666
  procedure OPDataModuloAcceso;  stdcall;
  procedure OPDataModuloAccesoClose;  stdcall;
  procedure OPMantenimientoAccesos; stdcall;
  procedure OPOpcionAccesos; stdcall;
  procedure OPOpcionAccesosShow; stdcall;
  procedure OPMantenimientoAyudaMant; stdcall;



  procedure CambioPassword; stdcall;

exports
  OPDataModulo,
  //INICIO SAR666
  OPDataModuloProv,
  //FIN SAR666
  OPDataModuloAcceso,
  OPDataModuloAccesoClose,
  OPMantenimientoAccesos,
  OPOpcionAccesos,
  OPOpcionAccesosShow,
  OPMantenimientoAyudaMant,
  CambioPassword;

var
  FOPIni: TFOPIni;

implementation

{$R *.dfm}

//USES CXPDM;
USES CXPDM,PROVDM;

procedure OPDataModulo;
begin
   Application.Initialize;
   try
      if ( DMCXP=nil ) or ( DMCXP.sClose='1' ) then
      begin
         FVariables:=TFVariables.Create(Application);
         DMCXP:=TDMCXP.Create( Application );
         if DMCXP.sClose='1' then
         begin
            DMCXP.Free;
            DMCXP := nil;
         end;
      end;
   finally
   end;
end;
//INICIO SAR666
procedure OPDataModuloProv;
begin
   Application.Initialize;
   try
      if ( DMPROV=nil ) or ( DMPROV.sClose='1' ) then
      begin
         DMPROV:=TDMPROV.Create( Application );
         DMPROV.DCOM1 :=  DMCXP.DCOM1   ;
         DMPROV.wUsuario := DMCXP.wUsuario;
         DMPROV.wAdmin := DMCXP.wAdmin;
         DMPROV.wGrupo := DMCXP.wGrupo;
         DMPROV.wModulo := DMCXP.wModulo;

      // Inicio HPC_201401_PROV
         DMPROV.cdsCia.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsTDoc.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsTDiario.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCCBco.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsTipReg.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsNivel.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsDoc2.RemoteServer :=DMCXP.DCOM1;
      // Fin HPC_201401_PROV

         DMPROV.cdsCanje.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsTMon.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsBanco.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsFPago.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsProv.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCCosto.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsDetCxP2.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsClAux.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsPais.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsDpto.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsProvinc.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsDistrito.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsSecEco.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry2.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry3.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsGiro.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsClasif.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsReporte.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsTipProv.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsMTipProv.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsTipPer.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsGArti.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry4.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry5.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry6.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry7.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry12.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry13.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry15.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry14.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry16.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCargo.RemoteServer :=DMCXP.DCOM1;

         DMPROV.cdsReglas.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsUsuarios.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsGrupos.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsMGrupo.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsAcceso.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsUltTGE.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsUser.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsUsuarioAct.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCnpEgr.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCCanje.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsConsulta.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsProvClientes.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCtaBanco.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsRepLegal.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsContacto.RemoteServer :=DMCXP.DCOM1;

      // Inicio HPC_201604_CXP
      // Añade cdsQryRUC para validar algoritmo de RUC
         DMPROV.cdsQryRUC.RemoteServer :=DMCXP.DCOM1;
      // Fin HPC_201604_CXP

         (*DMPROV.cdsMovCxP.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsOPago.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCia.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsTDiario.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCCBco.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsTDoc.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCuenta.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsTipReg.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsdetcanje.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsLetras.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsMovCxP2.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsPagare.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsDetCanje2.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCoaProv.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsDoc2.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsTipReg2.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCierre.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsNivel.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCuenta2.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCuenta3.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsRCuenta.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsRCCosto.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCtaConsol.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsTipCta.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsDetCxP.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsMovCNT.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry4.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry5.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsPresup.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsFactor.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsGrab.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsSQL.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCXP.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsResp.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCLAux1.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsTipPre.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsPlaParPre.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsNivelPresu.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsDetallePres.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCjeCxC.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsDetCjeClie.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsDetCjeProv.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsSitua.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsResultSet.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry6.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsDetRet.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsCanjeClone.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry7.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry8.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry9.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry10.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry11.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry13.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsQry1.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsHLetras.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsDetPagoLiq.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cDSAUXID.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cDSRETENCION.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cDSTASARET.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cdsConsulta.RemoteServer :=DMCXP.DCOM1;
         DMPROV.cDSSUNAT.RemoteServer :=DMCXP.DCOM1;*)
         DMPROV.cdsQry7.ProviderName :=DMCXP.cdsGiro.ProviderName;
         DMPROV.cdsConsulta.ProviderName :=DMCXP.cdsConsulta.ProviderName;
         DMPROV.cdsProvClientes.ProviderName :='dspTGE';
         DMPROV.cdsCtaBanco.ProviderName :='dspTGE';
         DMPROV.cdsCargo.ProviderName :='dspTGE';
         DMPROV.cdsRepLegal.ProviderName :='dspTGE';
         DMPROV.cdsContacto.ProviderName :='dspTGE';

         //DMPROV.cdsClasif
         DMPROV.DataModuleCreate1;

         if DMPROV.sClose='1' then
         begin
            DMPROV.Free;
            DMPROV := nil;
         end;
      end;
   finally
   end;
end;
//FIN SAR666

procedure OPDataModuloAcceso;
begin
   Application.Initialize;
   try
      FVariables.w_Var_Acceso:='S';
//      FOPIni.DM2:=TDMCXP.Create( Application );
   finally
   end;
end;


procedure OPDataModuloAccesoClose;
begin
//   FOPIni.DM2.free;
end;


procedure OPMantenimientoAccesos;
begin
{  try
     if ( DMCXP.wAdmin='G' ) or ( DMCXP.wAdmin='P' ) then
     begin
        if FMantAcceso=Nil then
        begin
           FMantAcceso:=TFMantAcceso.Create( nil );
           FMantAcceso.wDCOM1       :=DMCXP.DCOM1;
           FMantAcceso.wcdsAcceso   :=DMCXP.cdsAcceso;
           FMantAcceso.wcdsGrupos   :=DMCXP.cdsGrupos;
           FMantAcceso.wcdsMGrupo   :=DMCXP.cdsMGrupo;
           FMantAcceso.wcdsUsuarios :=DMCXP.cdsUsuarios;
           FMantAcceso.wcdsResultSet:=DMCXP.cdsResultSet;
           FMantAcceso.wcdsUser     :=DMCXP.cdsUser;
           FMantAcceso.sModulo      :=DMCXP.wModulo;
           FMantAcceso.sSRV_D       :=SRV_D;
        end
        else begin
           Exit;
        end;

        With FMantAcceso Do
        Try
           ShowModal;
        Finally
           DMCXP.wGrupoTmp:=FMantAcceso.sGrupoTmp;
           Free;
           FMantAcceso:=Nil;
        End;
     end
     else
     begin
        ShowMessage( 'Password NO es Administrador' );
     end;
  except
  end;}
end;


procedure OPOpcionAccesos;
begin
{   IF FMantOpcion <> nil then Exit;

   FMantOpcion:=TFMantOpcion.Create( nil );
   FMantOpcion.wcdsAcceso   :=DMCXP.cdsAcceso;
   FMantOpcion.wcdsGrupos   :=DMCXP.cdsGrupos;
   FMantOpcion.wcdsMGrupo   :=DMCXP.cdsMGrupo;
   FMantOpcion.wcdsUsuarios :=DMCXP.cdsUsuarios;
   FMantOpcion.wcdsResultSet:=DMCXP.cdsResultSet;
   FMantOpcion.wDCOM1       :=DMCXP.DCOM1;
   FMantOpcion.sGrupoTmp    :=DMCXP.wGrupoTmp;
//   FMantOpcion.sObjetoDescr :=DMCXP.wObjetoDescr;
//   FMantOpcion.sObjetoForma :=DMCXP.wObjetoForma;
//   FMantOpcion.sObjetoNombr :=DMCXP.wObjetoNombr;
   FMantOpcion.sObjetoNombr:=FVariables.w_Var_sObjetoNombr;
   FMantOpcion.sObjetoDescr:=FVariables.w_Var_sObjetoDescr;
   FMantOpcion.sObjetoForma:=FVariables.w_Var_sObjetoForma;

   FMantOpcion.sModulo      :=DMCXP.wModulo;}
end;


procedure OPOpcionAccesosShow;
begin
{   Try
      If Length(DMCXP.wGrupoTmp)>0 then begin
         FMantOpcion.ShowModal;
      end;
   Finally
      FMantOpcion.Free;
   End;

   FMantOpcion:=nil;}
end;


procedure CambioPassword;
begin
{   try
     if not DMCXP.DCOM1.Connected then Exit;

     FCPassw:=TFCPassw.Create( Application );

     FCPassw.dbeUser.Text:=DMCXP.wUsuario;
     FCPassw.sUser       :=DMCXP.wUsuario;
     FCPassw.wcdsUsuarios:=DMCXP.cdsUsuarios;
     FCPassw.wDCOM1      :=DMCXP.DCOM1;
     FCPassw.sModulo     :=DMCXP.wModulo;
     FCPassw.ShowModal;
   finally
     FCPassw.Free;
   end;}
End;


procedure OPMantenimientoAyudaMant;
begin
   FVariables.cdsTempVar :=TwwClientDataSet( DMCXP.FindComponent( FVariables.dblcTempVar.LookupTable.Name ) );
   FOPIni:=TFOPIni.Create( NIL );
   FOPIni.MantHelp:=TMant.Create( Application );
   FOPIni.MantHelp.ClientDataSet:= FVariables.cdsTempVar;
   FOPIni.MantHelp.Module       := DMCXP.wModulo;
   FOPIni.MantHelp.Tipo         := 'HELP';
   FOPIni.MantHelp.Admin        := 'N';
   FOPIni.MantHelp.DComC        := DMCXP.DCOM1;
   FOPIni.MantHelp.User         := DMCXP.wUsuario;
   FOPIni.MantHelp.Execute;
end;


end.
