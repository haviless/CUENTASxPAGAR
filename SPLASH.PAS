unit SPLASH;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TFSplash = class(TForm)
    imgSpalsh: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSplash: TFSplash;

implementation

{$R *.DFM}

procedure TFSplash.FormCreate(Sender: TObject);
begin
	if FileExists('Grafico.bmp') then
  	imgSpalsh.Picture.LoadFromFile('Grafico.bmp');
end;

end.
