unit CxP998;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFImpresion = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wFlTexto : String;
  end;

var
  FImpresion: TFImpresion;

implementation

uses CXPDM;

{$R *.DFM}

procedure TFImpresion.BitBtn1Click(Sender: TObject);
begin
   wFlTexto := 'G';
   Close;
end;

procedure TFImpresion.BitBtn2Click(Sender: TObject);
begin
   wFlTexto := 'T';
   Close;
end;

procedure TFImpresion.BitBtn3Click(Sender: TObject);
begin
   wFlTexto := 'C';
   Close;
end;

procedure TFImpresion.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.
