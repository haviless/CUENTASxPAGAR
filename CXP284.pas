unit CXP284;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons,db, ExtCtrls,
  StrContainer, Mask;

type
  TFConsulta = class(TForm)
    GroupBox1: TGroupBox;
    edtRUC: TEdit;
    edtNombre: TEdit;
    GroupBox2: TGroupBox;
    dbgSunat: TwwDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    bbtnTransfData: TBitBtn;
    BitBtn1: TBitBtn;
    scFile: TStrContainer;
    sdGraba: TSaveDialog;
    meBC: TMaskEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    meAR: TMaskEdit;
    meAP: TMaskEdit;
    meAPVI: TMaskEdit;
    BitBtn5: TBitBtn;
    procedure edtRUCChange(Sender: TObject);
    procedure edtNombreChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure edtRUCEnter(Sender: TObject);
    procedure edtRUCExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbgSunatDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure edtNombreKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure bbtnTransfDataClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsulta: TFConsulta;

implementation

uses CxPDM;



{$R *.dfm}

procedure TFConsulta.edtRUCChange(Sender: TObject);
begin
if Length(edtRUC.Text)> 0 then
   edtNombre.Text := '';
end;

procedure TFConsulta.edtNombreChange(Sender: TObject);
begin
IF Length(edtNombre.Text)>0 then
   edtRUC.Text := '';
end;

procedure TFConsulta.SpeedButton3Click(Sender: TObject);
begin
IF Length(edtRUC.Text)>0 then
   BEGIN
     DMCXP.CDSSUNAT.Close;
     DMCXP.CDSSUNAT.DataRequest('SELECT A.TIPO,'+
                                        'A.RUC,'+
                                        'A.RAZONSOC,'+
                                        'A.RESOLUCION,'+
                                        'B.PROVRUC,'+
                                        'B.PROVRETIGV '+
                                        'FROM CXP203 A,TGE201 B '+
                                        'WHERE  RUC LIKE '''+  TRIM(edtRUC.Text) + '%'' AND '+
                                        'A.RUC = B.PROVRUC (+) order by TIPO, RUC');

     DMCXP.CDSSUNAT.Open;


   END
ELSE IF Length(edtNombre.Text)>0 then
   BEGIN
     DMCXP.CDSSUNAT.Close;
     DMCXP.CDSSUNAT.DataRequest( 'SELECT A.TIPO,'+
                                        'A.RUC,'+
                                        'A.RAZONSOC,'+
                                        'A.RESOLUCION,'+
                                        'B.PROVRUC,'+
                                        'B.PROVRETIGV '+
                                        'FROM CXP203 A,TGE201 B '+
                                        'WHERE RAZONSOC LIKE '''+ TRIM(edtNombre.Text) + '%'' AND '+
                                        'A.RUC = B.PROVRUC (+) order by TIPO, RUC');

     DMCXP.CDSSUNAT.Open;
   END;

end;

procedure TFConsulta.edtRUCEnter(Sender: TObject);
begin
  if sender is TEdit   then TEdit(sender).color := clInfoBk;
end;

procedure TFConsulta.edtRUCExit(Sender: TObject);
begin
  if sender is TEdit   then TEdit(sender).color := clWindow;
end;

procedure TFConsulta.SpeedButton2Click(Sender: TObject);
begin

  //FILTRA EN TABLA DE PROVEEDORES
  DMCXP.CDSPROV.Close;
  DMCXP.CDSPROV.DataRequest('SELECT * FROM TGE201 WHERE PROVRUC LIKE '''+TRIM(DMCXP.CDSSUNAT.FieldByName('RUC').AsString)+''' ' );
  DMCXP.CDSPROV.Open;

  //FILTRA EN TABLA DE AUXILIARES
  DMCXP.CDSAUXID.Close;
  DMCXP.CDSAUXID.DataRequest( 'SELECT * FROM CNT201 WHERE AUXRUC LIKE '''+TRIM(DMCXP.CDSSUNAT.FieldByName('RUC').AsString)+''' ' );
  DMCXP.CDSAUXID.Open;


  //SI NO EXISTE EL CODIGO DE RUC EN TABLA DE PROVEEDORES
  IF (DMCXP.CDSPROV.RecordCount =0) or (DMCXP.CDSAUXID.RecordCount =0)  THEN
      BEGIN
        ShowMessage('      RUC NO EXISTE EN "PROVEEDOR" ,'+#13+' VERIFIQUE, ACTUALICE Y MARQUE EL REGISTRO NUEVAMENTE' );
        EXIT;
      END;

  //SI NO EXISTE EL CODIGO DE RUC EN TABLA DE AUXILIARES
  IF (DMCXP.CDSPROV.RecordCount =0) or (DMCXP.CDSAUXID.RecordCount =0)  THEN
      BEGIN
        ShowMessage('      RUC NO EXISTE EN LOS "AUXILIARES",'+#13+' VERIFIQUE, ACTUALICE Y MARQUE EL REGISTRO NUEVAMENTE' );
        EXIT;
      END;


  //wmc  IF (DMCXP.CDSPROVEE.RecordCount > 0) or (DMCXP.CDSAUX.RecordCount > 0) THEN
  IF (DMCXP.CDSPROV.RecordCount > 1)  THEN
      BEGIN
        ShowMessage('       RUC DUPLICADO EN "PROVEEDOR" ,'+#13+' VERIFIQUE, ACTUALICE Y MARQUE EL REGISTRO NUEVAMENTE' );
        EXIT;
      END;

  IF (DMCXP.CDSAUXID.RecordCount > 1)  THEN
      BEGIN
        ShowMessage('       RUC DUPLICADO EN LOS "AUXILIARES",'+#13+' VERIFIQUE, ACTUALICE Y MARQUE EL REGISTRO NUEVAMENTE' );
        EXIT;
      END;


  //MARCA CON "N" PARA NO RETENERLE
  DMCXP.CDSPROV.Edit;
  DMCXP.CDSPROV.FieldByName('PROVRETIGV').AsString := 'N';
  DMCXP.CDSPROV.ApplyUpdates(0);

  DMCXP.CDSAUXID.Edit;
  DMCXP.CDSAUXID.FieldByName('PROVRETIGV').AsString := 'N' ;
  DMCXP.CDSAUXID.ApplyUpdates(0);

  ShowMessage('.... MARCADO ....');

end;

procedure TFConsulta.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
  end
end;

procedure TFConsulta.SpeedButton1Click(Sender: TObject);
begin
//wmcDMCXP.SQLCONECT.close;
FConsulta.Close;
end;

procedure TFConsulta.dbgSunatDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
   IF DMCXP.CDSSUNAT.FieldByName('PROVRETIGV').AsString = 'N' then
       begin
       dbgSunat.Canvas.Font.color := clRed;
       dbgSunat.DefaultDrawDataCell(rect,field,state);
       end
end;

procedure TFConsulta.FormShow(Sender: TObject);
begin

  DMCXP.CDSSUNAT.Close;
  DMCXP.CDSSUNAT.DataRequest( 'Select A.TIPO, A.RUC, A.RAZONSOC, A.RESOLUCION, '+
                              'B.PROVRUC, B.PROVRETIGV '+
                            'FROM CXP203 A,TGE201 B '+
                            'WHERE A.RUC = B.PROVRUC (+) order by TIPO, RUC');
  DMCXP.CDSSUNAT.Open;

  DMCXP.CDSPROV.Close;
  DMCXP.CDSPROV.DataRequest( 'select * from TGE201' );
  DMCXP.CDSPROV.Open;

  DMCXP.CDSAUXID.Close;
  DMCXP.CDSAUXID.DataRequest( 'select * from CNT201' );
  DMCXP.CDSAUXID.Open;
end;

procedure TFConsulta.edtNombreKeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(key);
end;

procedure TFConsulta.BitBtn1Click(Sender: TObject);
begin
   if not sdGraba.Execute then Exit;

   meBC.Text:=sdGraba.FileName;
end;

procedure TFConsulta.bbtnTransfDataClick(Sender: TObject);
var
  a, i, nPos : Integer;
  cSQL, cLinea, cDato, cTipo : String;
  fContinua : Boolean;
begin
   if MessageDlg('¿ Confirmar Proceso?', mtConfirmation, [mbYes, mbNo], 0)=mrNo then Exit;

   For a:=1 to 4 do
   begin
       fContinua:=True;
       if a=1 then
       begin
          if trim(meBC.Text)='' then fContinua:=False;
          if trim(meBC.Text)<>'' then scFile.Lines.LoadFromFile( meBC.Text );
          cTipo:='BUENOS';
       end;
       if a=2 then
       begin
          if trim(meAR.Text)='' then fContinua:=False;
          if trim(meAR.Text)<>'' then scFile.Lines.LoadFromFile( meAR.Text );
          cTipo:='SELECCIONADOS';
       end;
       if a=3 then
       begin
          if trim(meAP.Text)='' then fContinua:=False;
          if trim(meAR.Text)<>'' then scFile.Lines.LoadFromFile( meAP.Text );
          cTipo:='PERCEPCION';
       end;
       if a=4 then
       begin
          if trim(meAPVI.Text)='' then fContinua:=False;
          if trim(meAR.Text)<>'' then scFile.Lines.LoadFromFile( meAPVI.Text );
          cTipo:='PERCEPCION V.I.';
       end;

       if fContinua then
       begin
          DMCXP.CDSRETENCION.Close;
          DMCXP.CDSRETENCION.DataRequest('Delete from CXP203 WHERE TIPO='''+cTipo+'''');
          DMCXP.CDSRETENCION.Execute;

          DMCXP.CDSRETENCION.Close;
          DMCXP.CDSRETENCION.DataRequest('Select * from CXP203 WHERE TIPO='''+cTipo+'''');
          DMCXP.CDSRETENCION.Open;

          For i:=1 to scFile.Lines.Count-1 do
          begin
              DMCXP.CDSRETENCION.Insert;
              DMCXP.CDSRETENCION.FieldByName('TIPO').AsString:=cTipo;
              DMCXP.CDSRETENCION.FieldByName('ORDEN').AsInteger:=i;

              cLinea:=scFile.Lines.Strings[ i ];
              cDato:=Copy( cLinea, 1, Pos('|',cLinea)-1 );
              DMCXP.CDSRETENCION.FieldByName('RUC').AsString:=cDato;

              cLinea:=Copy(cLinea, Pos('|',cLinea)+1, Length(cLinea) );
              cDato:=Copy( cLinea, 1, Pos('|',cLinea)-1 );
              DMCXP.CDSRETENCION.FieldByName('RAZONSOC').AsString:=cDato;

              cLinea:=Copy(cLinea, Pos('|',cLinea)+1, Length(cLinea) );
              cDato:=Copy( cLinea, 1, Pos('|',cLinea)-1 );

              cLinea:=Copy(cLinea, Pos('|',cLinea)+1, Length(cLinea) );
              cDato:=Copy( cLinea, 1, Pos('|',cLinea)-1 );
              DMCXP.CDSRETENCION.FieldByName('RESOLUCION').AsString:=cDato;
              DMCXP.CDSRETENCION.FieldByName('FECREG').AsDateTime:=Date+Time;

              DMCXP.CDSRETENCION.Post;
              DMCXP.CDSRETENCION.ApplyUpdates( -1 );
          end;
       end;
   end;
   DMCXP.CDSSUNAT.Close;
   DMCXP.CDSSUNAT.DataRequest( 'Select A.TIPO, A.RUC, A.RAZONSOC, A.RESOLUCION, '+
                              'B.PROVRUC, B.PROVRETIGV '+
                             'FROM CXP203 A,TGE201 B '+
                             'WHERE A.RUC = B.PROVRUC (+) order by TIPO, RUC');
   DMCXP.CDSSUNAT.Open;
   ShowMessage('Ok');
end;

procedure TFConsulta.BitBtn2Click(Sender: TObject);
begin
   if not sdGraba.Execute then Exit;

   meAR.Text:=sdGraba.FileName;
end;

procedure TFConsulta.BitBtn3Click(Sender: TObject);
begin
   if not sdGraba.Execute then Exit;

   meAP.Text:=sdGraba.FileName;
end;

procedure TFConsulta.BitBtn4Click(Sender: TObject);
begin
   if not sdGraba.Execute then Exit;

   meAPVI.Text:=sdGraba.FileName;
end;

procedure TFConsulta.BitBtn5Click(Sender: TObject);
begin
   if MessageDlg('¿ Confirmar Proceso?', mtConfirmation, [mbYes, mbNo], 0)=mrNo then Exit;

   DMCXP.CDSRETENCION.Close;
   DMCXP.CDSRETENCION.DataRequest('Update TGE201 SET PROVRETIGV=''S''');
   DMCXP.CDSRETENCION.Execute;

   DMCXP.CDSRETENCION.Close;
   DMCXP.CDSRETENCION.DataRequest('Update CNT201 SET PROVRETIGV=''S''');
   DMCXP.CDSRETENCION.Execute;

   DMCXP.CDSSUNAT.Close;
   DMCXP.CDSSUNAT.DataRequest( 'Select A.TIPO, A.RUC, A.RAZONSOC, A.RESOLUCION, '+
                              'B.PROVRUC, B.PROVRETIGV '+
                             'FROM CXP203 A,TGE201 B '+
                             'WHERE A.RUC = B.PROVRUC order by TIPO, RUC');
   DMCXP.CDSSUNAT.Open;

   While not DMCXP.CDSSUNAT.Eof do
   begin
      try
      //FILTRA EN TABLA DE PROVEEDORES
      DMCXP.CDSPROV.Close;
      DMCXP.CDSPROV.DataRequest('UPDATE TGE201 SET PROVRETIGV=''N'' WHERE PROVRUC='''+TRIM(DMCXP.CDSSUNAT.FieldByName('RUC').AsString)+'''');
      DMCXP.CDSPROV.Execute;

      DMCXP.CDSPROV.Close;
      DMCXP.CDSPROV.DataRequest('UPDATE CNT201 SET PROVRETIGV=''N'' WHERE AUXRUC='''+TRIM(DMCXP.CDSSUNAT.FieldByName('RUC').AsString)+'''');
      DMCXP.CDSPROV.Execute;
      except
      end;
      DMCXP.CDSSUNAT.Next;
   end;

   DMCXP.CDSSUNAT.Close;
   DMCXP.CDSSUNAT.DataRequest( 'Select A.TIPO, A.RUC, A.RAZONSOC, A.RESOLUCION, '+
                              'B.PROVRUC, B.PROVRETIGV '+
                             'FROM CXP203 A,TGE201 B '+
                             'WHERE A.RUC = B.PROVRUC (+) order by TIPO, RUC');
   DMCXP.CDSSUNAT.Open;

   ShowMessage('Ok');
end;

end.
