unit CXP775;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFToolProv = class(TForm)
    pnlBtns: TPanel;
    bbtnActiva: TBitBtn;
    procedure bbtnActivaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolProv: TFToolProv;

implementation

uses CxP001, CxPDM;

{$R *.dfm}

procedure TFToolProv.bbtnActivaClick(Sender: TObject);
var
  xSQL, xSQL_Cnt : String;
begin
	if ( not FPrincipal.Mantc.FMant.Z2bbtnConsulta.Enabled ) and
     ( not FPrincipal.Mantc.FMant.Z2bbtnModifica.Enabled ) then Exit;

  xSQL:='Select * from TGE201 '
       +'Where CLAUXID='''+FPrincipal.Mantc.FMant.cds2.FieldByName('CLAUXID').AsString +''' '
       +  'AND PROV='''   +FPrincipal.Mantc.FMant.cds2.FieldByName('PROV').AsString    +'''';
  DMCXP.cdsQry.Close;
  DMCXP.cdsQry.DataRequest( xSQL );
  DMCXP.cdsQry.Open;

	if DMCXP.cdsQry.RecordCount = 0 then
 	begin
     ShowMessage( 'Error : No Existen Registro a Moficiar');
     exit;
 	end;

  if DMCXP.cdsQry.FieldByname('ACTIVO').AsString='S' then
  begin
      if MessageDlg('Proveedor se encuentra ACTIVO '+chr(13)+chr(13)+
                    '   ¿ Desea Des-Activar ?     ',mtConfirmation,[mbYes, mbNo],0)=mrNo
      then exit;

      xSQL:='Update TGE201 set ACTIVO=''N'' '
           +'Where CLAUXID='''+FPrincipal.Mantc.FMant.cds2.FieldByName('CLAUXID').AsString +''' '
           +  'AND PROV='''   +FPrincipal.Mantc.FMant.cds2.FieldByName('PROV').AsString    +'''';

      xSQL_Cnt:='Update CNT201 set ACTIVO=''N'' '
           +'Where CLAUXID='''+FPrincipal.Mantc.FMant.cds2.FieldByName('CLAUXID').AsString +''' '
           +  'AND AUXID='''  +FPrincipal.Mantc.FMant.cds2.FieldByName('PROV').AsString    +'''';

      FPrincipal.Mantc.FMant.cds2.Edit;
      FPrincipal.Mantc.FMant.cds2.FieldByname('ACTIVO').AsString:='N';
      FPrincipal.Mantc.FMant.cds2.Post;
  end
  else
  begin
      if MessageDlg('Proveedor se encuentra DES-ACTIVO '+chr(13)+chr(13)+
                    '   ¿ Desea Activar ?     ',mtConfirmation,[mbYes, mbNo],0)=mrNo
      then exit;
      xSQL:='Update TGE201 set ACTIVO=''S'' '
           +'Where CLAUXID='''+FPrincipal.Mantc.FMant.cds2.FieldByName('CLAUXID').AsString +''' '
           +  'AND PROV='''   +FPrincipal.Mantc.FMant.cds2.FieldByName('PROV').AsString    +'''';

      xSQL_Cnt:='Update CNT201 set ACTIVO=''S'' '
           +'Where CLAUXID='''+FPrincipal.Mantc.FMant.cds2.FieldByName('CLAUXID').AsString +''' '
           +  'AND AUXID='''  +FPrincipal.Mantc.FMant.cds2.FieldByName('PROV').AsString    +'''';

      FPrincipal.Mantc.FMant.cds2.Edit;
      FPrincipal.Mantc.FMant.cds2.FieldByname('ACTIVO').AsString:='S';
      FPrincipal.Mantc.FMant.cds2.Post;
  end;

  try
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Execute;

      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL_Cnt);
      DMCXP.cdsQry.Execute;
  except
      ShowMessage('Error al Grabar');
      Exit;
  end;
  ShowMessage('Ok');
end;

end.
