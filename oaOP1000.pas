unit oaOP1000;

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
//

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mant, oaVariables, StdCtrls;

type
  TFReferencias = class(TForm)
    lblVersion: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefeCierra(Sender: TObject);
  end;

  procedure OPReferencias; stdcall;
// HPC_201401_CXP
   procedure OPVerificaVersion; stdcall;
// FIN HPC_201401_CXP


exports
  OPReferencias,
  OPVerificaVersion;


var
  MRefe : TMant;
  FReferencias: TFReferencias;

implementation

{$R *.dfm}

Uses CXPDM;

procedure OPReferencias;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   try
//      if not Assigned( FReferencias ) then
//         FReferencias:=TFReferencias.Create( Application );
      if not (MRefe=nil) then Exit;

      MRefe := TMant.Create( Application );
      MRefe.Module  := DMCXP.wModulo;
      MRefe.Admin   := DMCXP.wAdmin;
      MRefe.DComC   := DMCXP.DCOM1 ;
      MRefe.User    := DMCXP.wUsuario;
      MRefe.OnCierra:= FReferencias.RefeCierra;
      MRefe.Execute;
      FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   except
   end;
end;


procedure TFReferencias.RefeCierra(Sender: TObject);
begin
   MRefe:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;

// Inicio HPC_201401_CXP
procedure OPVerificaVersion;
Begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   FReferencias := TFReferencias.Create( Application );
   If DMCXP.fg_VerificaVersion(FReferencias.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.'+#13+'Comuníquese con Soporte Técnico');
			Application.Terminate;
      Exit;
   End;
End;
// Fin HPC_201401_CXP

end.
