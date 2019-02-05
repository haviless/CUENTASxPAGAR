unit CXP282;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls, Wwkeycb, Buttons,
  Mask, db;
//StdCtrls, wwdbdatetimepicker, wwdbedit

type
  TFRetencionEdit = class(TForm)
    dbgFiltra: TwwDBGrid;
    Panel1: TPanel;
    wwIncrementalSearch1: TwwIncrementalSearch;
    Label1: TLabel;
    rgFiltro: TRadioGroup;
    meRuc: TMaskEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Bevel2: TBevel;
    mePeriodo: TMaskEdit;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgFiltraDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRetencionEdit: TFRetencionEdit;

implementation

{$R *.dfm}

USES CxPDM, CXP283;

procedure TFRetencionEdit.FormActivate(Sender: TObject);
var
   xSQL, xWhere : String;
begin
   mePeriodo.Text:=  Copy(DateToStr(Date),7,4)+Copy(DateToStr(Date),4,2);
   xWhere:='';
   if mePeriodo.Text<>'' then
   begin
      xWhere:='Where ANOMM='''+ mePeriodo.Text +''' ';
      rgFiltro.ItemIndex:=1;
   end;
   xSQL:='SELECT RETSERIE, RETNUMERO, FECPAGO, CLAUXID, AUXID, AUXRUC, '
        +  'SUM(MTOLOC) TMTOLOC, SUM(MTOEXT) TMTOEXT, '
        +  'SUM(MTORETLOC) MTOLOC, SUM(MTORETEXT) MTOEXT, '
        +  'CASE WHEN ECESTADO=''A'' THEN ''ANULADO'' ELSE ''ACTIVO'' END ECESTADO, '
        +  'CIAID, ECNOCOMP, Max(USUARIO) USUARIO, COUNT(*) ITEMS '
        +'FROM CNT320 '
        +xWhere
        +'GROUP BY CIAID, ECNOCOMP, RETSERIE, RETNUMERO, FECPAGO, CLAUXID, AUXID, AUXRUC, ECESTADO '
        +'ORDER BY RETSERIE, RETNUMERO';
   DMCXP.cdsConsulta.Close;
   DMCXP.cdsConsulta.DataRequest( xSQL );
   DMCXP.cdsConsulta.Open;

   TNumericField( DMCXP.cdsConsulta.FieldByName('MTOLOC') ).DisplayFormat:='###,##0.00';
   TNumericField( DMCXP.cdsConsulta.FieldByName('MTOEXT') ).DisplayFormat:='###,##0.00';
end;

procedure TFRetencionEdit.BitBtn1Click(Sender: TObject);
var
   xSQL, xWhere : String;
begin
   if rgFiltro.ItemIndex=0 then
   begin
   xSQL:='SELECT RETSERIE, RETNUMERO, FECPAGO, CLAUXID, AUXID, AUXRUC, '
        +  'SUM(MTOLOC) TMTOLOC, SUM(MTOEXT) TMTOEXT, '
        +  'SUM(MTORETLOC) MTOLOC, SUM(MTORETEXT) MTOEXT, '
        +  'CASE WHEN ECESTADO=''A'' THEN ''ANULADO'' ELSE ''ACTIVO'' END ECESTADO, '
        +  'CIAID, ECNOCOMP, Max(USUARIO) USUARIO, COUNT(*) ITEMS '
        +'FROM CNT320 '
        +'GROUP BY CIAID, ECNOCOMP, RETSERIE, RETNUMERO, FECPAGO, CLAUXID, AUXID, AUXRUC, ECESTADO '
        +'ORDER BY RETSERIE, RETNUMERO';
   DMCXP.cdsConsulta.Close;
   DMCXP.cdsConsulta.DataRequest( xSQL );
   DMCXP.cdsConsulta.Open;
   end
   else
   begin

   if (meRUC.Text='') and ( mePeriodo.Text='') then
   begin
      ShowMessage('Falta el RUC y Mes');
      Exit;
   end;
   xWhere:='';
   if meRuc.Text<>'' then
   begin
      xWhere:='Where AUXRUC LIKE '''+ meRuc.Text +'%'' ';
   end;

   if mePeriodo.Text<>'' then
   begin
      if xWhere='' then
         xWhere:='Where ANOMM='''+ mePeriodo.Text +''' '
      else
         xWhere:=xWhere+' and ANOMM='''+ mePeriodo.Text +''' '
   end;
   xSQL:='SELECT RETSERIE, RETNUMERO, FECPAGO, CLAUXID, AUXID, AUXRUC, '
        +  'SUM(MTOLOC) TMTOLOC, SUM(MTOEXT) TMTOEXT, '
        +  'SUM(MTORETLOC) MTOLOC, SUM(MTORETEXT) MTOEXT, '
        +  'CASE WHEN ECESTADO=''A'' THEN ''ANULADO'' ELSE ''ACTIVO'' END ECESTADO, '
        +  'CIAID, ECNOCOMP, Max(USUARIO) USUARIO, COUNT(*) ITEMS '
        +'FROM CNT320 '
        +xWhere
        +'GROUP BY CIAID, ECNOCOMP, RETSERIE, RETNUMERO, FECPAGO, CLAUXID, AUXID, AUXRUC, ECESTADO '
        +'ORDER BY RETSERIE, RETNUMERO';

   DMCXP.cdsConsulta.Close;
   DMCXP.cdsConsulta.DataRequest( xSQL );
   DMCXP.cdsConsulta.Open;
   end;

   TNumericField( DMCXP.cdsConsulta.FieldByName('MTOLOC') ).DisplayFormat:='###,##0.00';
   TNumericField( DMCXP.cdsConsulta.FieldByName('MTOEXT') ).DisplayFormat:='###,##0.00';
end;

procedure TFRetencionEdit.dbgFiltraDblClick(Sender: TObject);
begin
    FAnula := TFAnula.CReate(self);
    try
      FAnula.ShowModal ;
    finally
      FAnula.Free ;
    end ;

end;

end.
