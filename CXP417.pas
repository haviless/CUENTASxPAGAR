unit CxP417;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBClient, wwclient, MConnect,
  StdCtrls, ExtCtrls, Buttons, Wwkeycb;

type
  TFSelCCosto = class(TForm)
    cds: TwwClientDataSet;
    dsDocsCont: TwwDataSource;
    dsDocContClone: TwwDataSource;
    pnlPendientes: TPanel;
    Label16: TLabel;
    dbgPendientes: TwwDBGrid;
    pnlDocCanje: TPanel;
    Label17: TLabel;
    dbgDocCanje: TwwDBGrid;
    cdsClone: TwwClientDataSet;
    bbtnOk: TBitBtn;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    pnlBusca: TPanel;
    lblBusca: TLabel;
    isBusca: TwwIncrementalSearch;
    procedure dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
    procedure dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure isBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgPendientesTitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSelCCosto: TFSelCCosto;

implementation

uses CxPDM;

{$R *.DFM}

procedure TFSelCCosto.dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFSelCCosto.dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
var
   I : Integer ;
begin
   If (Target = dbgpendientes) AND (cdsClone.recordcount <> 0 ) Then
   Begin
      if dbgDocCanje.SelectedList.Count>0 then
      begin
         for i:= 0 to dbgDocCanje.SelectedList.Count-1 do
         begin
            dbgDocCanje.datasource.dataset.GotoBookmark(dbgDocCanje.SelectedList.items[i]);
            cdsClone.edit ;
            cdsClone.FieldByName('FLAG').AsString := 'N' ;
            cdsClone.Post ;
            dbgDocCanje.datasource.dataset.Freebookmark(dbgDocCanje.SelectedList.items[i]);
         end; // for
         dbgDocCanje.SelectedList.clear;  { Clear selected record list since they are all deleted}
      end
      else begin
         cdsClone.edit ;
         cdsClone.FieldByName('FLAG').AsString := 'N' ;
         cdsClone.Post ;
      end;
   end;
end;

procedure TFSelCCosto.dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocCanje.BeginDrag(False);
end;

procedure TFSelCCosto.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFSelCCosto.dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
var
  I: integer;
begin
   If (Target = dbgDocCanje) AND (cds.recordcount <> 0 ) Then
   begin
      if dbgPendientes.SelectedList.Count>0 then
      begin
         for i:= 0 to dbgPendientes.SelectedList.Count-1 do
         begin
              dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);
              cds.edit ;
              cds.FieldByName('FLAG').AsString := 'S' ;
              cds.Post ;
              dbgPendientes.datasource.dataset.Freebookmark(dbgPendientes.SelectedList.items[i]);
         end; // for
         dbgPendientes.SelectedList.clear;  { Clear selected record list since they are all deleted}
      end
      else begin
         cds.edit ;
         cds.FieldByName('FLAG').AsString := 'S' ;
         cds.Post ;
      end;
   end ;
end;

procedure TFSelCCosto.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgPendientes.BeginDrag(False);
end;

procedure TFSelCCosto.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
   
   cdsClone.CloneCursor(cds,TRUE) ;
   cdsClone.FILTER := 'FLAG = ''S''' ;
   cdsClone.FILTERED := tRUE ;
end;


procedure TFSelCCosto.FormCreate(Sender: TObject);
var
   xSQL :String ;
begin
   cds.Close;
   cds.RemoteServer := DMCXP.DCOM1 ;
   cds.ProviderName := 'dspTGE';
   xSQL := ' SELECT CCOSID ,CCOSDES ,CCOSABR , ''N'' FLAG   ' +
           '  FROM TGE203 ' ;
   cds.DataRequest(xSQL);
   cds.Open;
   cds.IndexFieldNames:='CCOSID';

end;

procedure TFSelCCosto.bbtnOkClick(Sender: TObject);
begin
   Close ;
end;

procedure TFSelCCosto.BitBtn1Click(Sender: TObject);
begin
   Close ;
end;

procedure TFSelCCosto.isBuscaKeyPress(Sender: TObject; var Key: Char);
begin
   if (key=#13) or (key=#27) then
   begin
      pnlBusca.Visible := False;
   end;
end;

procedure TFSelCCosto.dbgPendientesTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   if AFieldName='CCOSID'  then lblBusca.Caption:='Centro de Costo:';
   if AFieldName='CCOSDES' then lblBusca.Caption:='Descripción de C.Costo:';
   if AFieldName='CCOSABR' then lblBusca.Caption:='Nombre Corto de C.Costo:';
//   lblBusca.Caption := AFieldName;
   cds.indexfieldNames:= AFieldName;
   isBusca.SearchField:= AFieldName;
   isBusca.Left := lblBusca.Width+24;
   pnlBusca.Width:= 12+lblBusca.Width+12+isBusca.Width+12;
   pnlBusca.Visible := True;
   isBusca.SetFocus;
end;

end.
