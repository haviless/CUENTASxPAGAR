unit CxP777;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Buttons, Mant, Db, Wwdatsrc, DBClient, wwclient, ppDB,
  ppDBPipe, ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, Wwdbigrd, Wwdbgrid, ExtCtrls, oaVariables;

type
  TFToolLetras = class(TForm)
    pnlBot: TPanel;
    sbtn5: TSpeedButton;
    sbtn6: TSpeedButton;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    grid : TwwDBGrid;
  public
    { Public declarations }
  end;

var
  FToolLetras: TFToolLetras;
  xAccesoBotones : Boolean;

implementation

uses CxP001, CXPDM;

{$R *.DFM}

procedure TFToolLetras.Timer1Timer(Sender: TObject);
begin
   FVariables.w_NombreForma := 'FToolLetras';
   if (DMCXP.wAdmin='G') or (DMCXP.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMCXP.AccesosUsuariosR( DMCXP.wModulo,DMCXP.wUsuario,'2',FToolLetras);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

end.
