unit CxP425;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TFMovCptoCC = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure OPMovimientosCptoCCosto; stdcall;

exports
  OPMovimientosCptoCCosto;

var
  FMovCptoCC: TFMovCptoCC;

implementation

{$R *.dfm}

uses CxPDM, CXP417;

procedure OPMovimientosCptoCCosto;
var
   xSQL : String;
begin
   Application.Initialize;

   try
     ShowMessage('1');
     FMovCptoCC := TFMovCptoCC.Create( Application );
     ShowMessage('3');
     FMovCptoCC.ActiveMDIChild;
   finally
     //FCCuadreMovs.Free;
   end;
end;

end.
