unit CXP009;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcButton, fcImgBtn, fcShapeBtn, fcLabel, ExtCtrls;

type
  TFActAgRet = class(TForm)
    pnlCabecera: TPanel;
    fcLabel1: TfcLabel;
    Panel2: TPanel;
    bbtnAceptar: TfcShapeBtn;
    bbtnCancelar: TfcShapeBtn;
    fcLabel2: TfcLabel;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure OPActualizaAgentesRetencion; stdcall;

exports
  OPActualizaAgentesRetencion;

var
  FActAgRet: TFActAgRet;

implementation

uses CxPDM;

{$R *.DFM}

procedure OPActualizaAgentesRetencion;
var
   xSQL : String;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   Try
     FActAgRet:=TFActAgRet.Create( Application );
     FActAgRet. ShowModal;
   Finally
 	   FActAgRet. Free;
   end;
end;


procedure TFActAgRet.bbtnCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TFActAgRet.bbtnAceptarClick(Sender: TObject);
var
   xSQL : String;
begin
   If MessageDlg('Seguro de Actualizar los Agentes de Retención'+#13+'             y Buenos Contribuyentes?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    begin
     Screen.Cursor := crHourGlass;
     //Para Actualizar el Maestro de Proveedores
     xSQL := 'Update TGE201'
            +' Set PROVRETIGV ='+QuotedStr('S');
     DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

     xSQL := 'Update TGE201'
            +' Set PROVRETIGV ='+QuotedStr('N')
            +' Where Exists (Select RUC From CXP203 Where PROVRUC = RUC)';

     DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

     //Para Actualizar el Maestro de Auxiliares
     xSQL := 'Update CNT201'
            +' Set PROVRETIGV ='+QuotedStr('S');
     DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

     xSQL := 'Update CNT201'
            +' Set PROVRETIGV ='+QuotedStr('N')
            +' Where Exists (Select RUC From CXP203 Where AUXRUC = RUC)';

     DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

     Beep;
     MessageDlg('Datos Actualizados', mtCustom, [mbOk], 0);
     Screen.Cursor := crDefault;
    end;
end;

end.
