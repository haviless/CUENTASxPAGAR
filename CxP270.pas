unit CxP270;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, wwdbedit, ExtCtrls, Buttons;

type
  TFDetrac = class(TForm)
    bbtnRegOk: TBitBtn;
    bbtnRegCanc: TBitBtn;
    Panel1: TPanel;
    lblImporte: TLabel;
    dbeDetrac: TwwDBEdit;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure bbtnRegOkClick(Sender: TObject);
    procedure bbtnRegCancClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetrac: TFDetrac;

implementation

{$R *.dfm}

uses CXPDM;

procedure TFDetrac.FormActivate(Sender: TObject);
begin
   dbeDetrac.DataSource:=DMCXP.dsMovCxP;
end;

procedure TFDetrac.bbtnRegOkClick(Sender: TObject);
begin
    if DMCXP.cdsMovCxP.ApplyUpdates(0)>0 then
    begin
       ShowMessage('¡No se actualizó la Detracción!');
       exit;
    end;
end;

procedure TFDetrac.bbtnRegCancClick(Sender: TObject);
begin
   DMCXP.cdsMovCxP.CancelUpdates;
   Close;
end;

procedure TFDetrac.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMCXP.cdsMovCxP.CancelUpdates;
   Close;
end;

end.
