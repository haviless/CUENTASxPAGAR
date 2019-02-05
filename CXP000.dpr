program CXP000;

uses
  Forms,
  Windows,
  CxP101 in 'CxP101.pas' {FReglasNeg},
  CxP102 in 'CxP102.pas' {FReferencias},
  CxP402 in 'CxP402.pas' {FCCtaCte},
  CxP205 in 'CXP205.PAS' {FPagos},
  CxP201 in 'CxP201.pas' {FProvision},
  CxP202 in 'CxP202.pas' {FNotasDC},
  CxP207 in 'CxP207.pas' {FCanjeDoc},
  CxP006 in 'CxP006.pas' {FAccesos},
  CxP008 in 'CxP008.pas' {FMantOpcion},
  CxP007 in 'CxP007.pas' {FMantAcceso},
  CxP502 in 'CxP502.pas' {FCierreOpe},
  CxP209 in 'CxP209.pas' {FPlnCta},
  CxP777 in 'CxP777.pas' {FToolLetras},
  CxP778 in 'CxP778.pas' {FToolCont},
  CxP601 in 'CxP601.pas' {FCCuadreMovs},
  CxP602 in 'CxP602.pas' {FRepRegDiarios},
  SOL900 in '..\..\SOLTLib\SOL900.pas' {CFReporte},
  CxP406 in 'CxP406.pas' {FLetrasProvisio},
  CxP405 in 'CXP405.PAS' {FcrConCCos},
  CxP403 in 'CxP403.pas' {FCLetras},
  CxP217 in 'CxP217.pas' {FDetAmo},
  CxP216 in 'CxP216.pas' {FEstCxCli},
  CxP215 in 'CxP215.pas' {FEstCtaCli},
  CxP801 in 'CxP801.pas' {FEscogeCia},
  CxP001 in 'CxP001.pas' {FPrincipal},
  CxP222 in 'CxP222.pas' {FCanjeNC},
  CxP407 in 'CxP407.pas' {FIngDia},
  CXP417 in 'CXP417.PAS' {FSelCCosto},
  CXP408 in 'CXP408.pas' {FDistribucion},
  CxPDM in 'CxPDM.pas' {DM1: TDataModule},
  SPLASH in 'Splash.pas' {FSplash},
  CxP223 in 'CxP223.pas' {FImpBProvision},
  Cxp800 in 'Cxp800.pas' {FCanjeLT},
  CxP779 in 'CxP779.pas' {ToolLetras},
  CxP780ant in 'CxP780ant.pas' {FToolLetPendant},
  CxP504 in 'CxP504.pas' {FNuevoProv},
  CXP805 in 'CXP805.pas' {FToolVista},
  CxP780 in 'CxP780.pas' {FToolLetPend},
  Cxp781 in 'Cxp781.pas' {FToolRegLetras},
  CXP803 in 'CXP803.PAS' {FToolCCProv},
  CXP404 in 'CXP404.pas' {CFRepMov},
  CxP900 in 'CxP900.pas' {FInserta},
  Cxp804 in 'Cxp804.pas' {FActLetra},
  CxP203 in 'CxP203.pas' {FLetras},
  CXP420 in 'CXP420.pas' {FEstCxCPro},
  CxP700 in 'CxP700.pas' {FToolCtaCteProv},
  CxP200 in 'CxP200.pas' {FMaesProv},
  CxP505 in 'CxP505.pas' {FTransfDAOT},
  CxP210 in 'CxP210.pas' {FCanjeCxC},
  CxP503 in 'CxP503.pas' {FTransfPDT},
  CxP208 in 'CxP208.pas' {FIntermediacion},
  CXP409 in 'CXP409.pas' {FCuadroMensual},
  CxP401 in 'CxP401.pas' {FCRegComp},
  CXP802 in 'CXP802.pas' {FToolCtaCte},
  CxP206 in 'CxP206.pas' {FPagares},
  CXP240 in 'CXP240.pas' {FAplicaCaja},
  CXP776 in 'CXP776.pas' {FToolAplica},
  CxP501 in 'CxP501.pas' {FTransfCOA},
  CXP782 in 'CXP782.pas' {FToolRetPend},
  CXP009 in 'CXP009.pas' {FActAgRet},
  CxP998 in 'CXP998.PAS' {FImpresion},
  CXP999 in 'CXP999.pas' {Form1},
  CxP425 in 'CxP425.pas' {FMovCptoCC},
  CxP424 in 'CxP424.pas' {FMovProveedor};

{$R *.RES}

var
  HMutex: THandle;

begin
  HMutex := CreateMutex (nil, False, 'OneCopyMutexCxP');
  if WaitForSingleObject (HMutex, 0) <> wait_TimeOut then
  begin
     Application.Initialize;
     Application.Title := 'Obligaciones por Pagar';
     fSplash := TfSplash.Create(Nil);
     fSplash.Show;
     fSplash.Repaint;
     Application.CreateForm(TDM1, DM1);
  Application.CreateForm(TFAccesos, FAccesos);
  Application.CreateForm(TFMovCptoCC, FMovCptoCC);
  Application.CreateForm(TFMovProveedor, FMovProveedor);
  Application.Run;
  end
  else
  begin
     ShowMessage( 'Obligaciones por Pagar, Ya se Encuentra en Ejecución el Modulo');
  end;
end.
