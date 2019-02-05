unit CxP801;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, wwdblook;

type
  TFEscogeCia = class(TForm)
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    pnlMenu: TPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEscogeCia: TFEscogeCia;

implementation

uses CxPDM;

{$R *.DFM}

procedure TFEscogeCia.FormCreate(Sender: TObject);
begin
  DMCXP.cdsCia.First;
  dblcCia.text := DMCXP.cdsCia.FieldByName('CIAID').asString;
  dblcCiaExit(dblcCia);

  if DMCXP.cdsCia.RecordCount < 2 then
  begin
    lblCia.enabled := false;
    dblcCia.enabled:= false;
    edtCia.enabled := false;
  end
  else
  begin
    lblCia.enabled := true;
    dblcCia.enabled:= true;
    edtCia.enabled := true;
  end;
end;

procedure TFEscogeCia.dblcCiaExit(Sender: TObject);
begin
  edtCia.Text := DMCXP.DisplayDescrip2('dspTGE','TGE101','CIADES','CIAID='+quotedStr(dblcCia.text),'CIADES');
end;

procedure TFEscogeCia.btnAceptarClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFEscogeCia.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFEscogeCia.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.
