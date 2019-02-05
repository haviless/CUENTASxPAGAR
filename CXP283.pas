unit CXP283;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, wwdbdatetimepicker, Mask,
  wwdbedit, Buttons, ExtCtrls;

type
  TFAnula = class(TForm)
    dbgRet: TwwDBGrid;
    bbtnAnula: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    bbtnActiva: TBitBtn;
    Bevel1: TBevel;
    Label8: TLabel;
    wwDBEdit7: TwwDBEdit;
    bbtnReemplazar: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure bbtnAnulaClick(Sender: TObject);
    procedure bbtnActivaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnReemplazarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    xserie: String;
    xnumero: String;
  public
    { Public declarations }
  end;

var
  FAnula: TFAnula;

implementation

{$R *.dfm}

USES CxPDM, DB, CXP280;

procedure TFAnula.FormActivate(Sender: TObject);
var
   xSQL : String;
begin
   xSQL:='Select DOCID, SERIE, NODOC, MTOLOC, MTOEXT, MTORETLOC, MTORETEXT, ECESTADO, RETSERIE, RETNUMERO '
        +'From CNT320 '
        +'Where RETSERIE=''' +DMCXP.cdsConsulta.FieldByName('RETSERIE').AsString+''' '
        +  'and RETNUMERO='''+DMCXP.cdsConsulta.FieldByName('RETNUMERO').AsString+'''';
   DMCXP.CDSRETENCION.Close;
   DMCXP.CDSRETENCION.DataRequest(xSQL);
   DMCXP.CDSRETENCION.Open;

   TNumericField( DMCXP.CDSRETENCION.FieldByName('MTOLOC') ).DisplayFormat:='###,##0.00';
   TNumericField( DMCXP.CDSRETENCION.FieldByName('MTOEXT') ).DisplayFormat:='###,##0.00';
   TNumericField( DMCXP.CDSRETENCION.FieldByName('MTORETLOC') ).DisplayFormat:='###,##0.00';
   TNumericField( DMCXP.CDSRETENCION.FieldByName('MTORETEXT') ).DisplayFormat:='###,##0.00';

   dbgRet.ColumnByName( 'MTOLOC' ).FooterValue   :=FloatToStrF(DMCXP.cdsConsulta.FieldByName('TMTOLOC').AsFloat,ffNumber,10,2);
   dbgRet.ColumnByName( 'MTOEXT' ).FooterValue   :=FloatToStrF(DMCXP.cdsConsulta.FieldByName('TMTOEXT').AsFloat,ffNumber,10,2);
   dbgRet.ColumnByName( 'MTORETLOC' ).FooterValue:=FloatToStrF(DMCXP.cdsConsulta.FieldByName('MTOLOC').AsFloat,ffNumber,10,2);
   dbgRet.ColumnByName( 'MTORETEXT' ).FooterValue:=FloatToStrF(DMCXP.cdsConsulta.FieldByName('MTOEXT').AsFloat,ffNumber,10,2);
end;

procedure TFAnula.bbtnAnulaClick(Sender: TObject);
Var
   xSQL : String;
begin
   {
   if DMCXP.cdsConsulta.FieldByName('USUARIO').AsString<>'MANUAL' then
   begin
      ShowMessage('Error : Solo se Pueden Anular Retenciones de Usuario MANUAL');
      Exit;
   end;
   }
   if DMCXP.cdsConsulta.FieldByName('ECESTADO').AsString='ANULADO' then
   begin
      ShowMessage('Error : Retención se encuentra Anulada');
      Exit;
   end;

   xSQL:='Select * from TGE154 '
        +'Where CIAID=''02'' '
        +  'and ANO='+QuotedStr( Copy(DateToStr(DMCXP.cdsConsulta.FieldByName('FECPAGO').AsDateTime),7,4) );
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xSQL );
   DMCXP.cdsQry.Open;
   if DMCXP.cdsQry.FieldByName('PER'+Copy(DateToStr(DMCXP.cdsConsulta.FieldByName('FECPAGO').AsDatetime),4,2) ).AsString='S' then
   begin
      ShowMessage('Periodo se encuentra Cerrado' );
      Exit;
   end;

   if MessageDlg('¿ Esta seguro de Anular Retención ?', mtconfirmation, [mbYes,mbNo],0)=mrNo then Exit;

   DMCXP.CDSRETENCION.First;
   while not DMCXP.CDSRETENCION.Eof do
   begin
      DMCXP.CDSRETENCION.Edit;
      DMCXP.CDSRETENCION.FieldByName('ECESTADO').AsString:='A';
      DMCXP.CDSRETENCION.Post;
      DMCXP.CDSRETENCION.Next;
   end;

   try
   xSQL:='Update CNT320 set ECESTADO=''A'' '
        +'Where RETSERIE=''' +DMCXP.cdsConsulta.FieldByName('RETSERIE').AsString+''' '
        +  'and RETNUMERO='''+DMCXP.cdsConsulta.FieldByName('RETNUMERO').AsString+'''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xSQL );
   DMCXP.cdsQry.Execute;

   //DMCXP.CDSRETENCION.ApplyUpdates( -1 );
   except
      ShowMessage('Error : al Grabar Retención');
      Exit;
   end;

   DMCXP.cdsConsulta.Edit;
   DMCXP.cdsConsulta.FieldByName('ECESTADO').AsString:='ANULADO';
   DMCXP.cdsConsulta.Post;
   ShowMessage('Retención Anulada');
end;

procedure TFAnula.bbtnActivaClick(Sender: TObject);
Var
   xSQL : String;
begin
   if DMCXP.cdsConsulta.FieldByName('USUARIO').AsString<>'MANUAL' then
   begin
      ShowMessage('Error : Solo se Pueden Activar Retenciones de Usuario MANUAL');
      Exit;
   end;

   if DMCXP.cdsConsulta.FieldByName('ECESTADO').AsString='ACTIVO' then
   begin
      ShowMessage('Error : Retención se encuentra Activa');
      Exit;
   end;

   xSQL:='Select * from TGE154 '
        +'Where CIAID=''02'' '
        +  'and ANO='+QuotedStr( Copy(DateToStr(DMCXP.cdsConsulta.FieldByName('FECPAGO').AsDateTime),7,4) );
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xSQL );
   DMCXP.cdsQry.Open;
   if DMCXP.cdsQry.FieldByName('PER'+Copy(DateToStr(DMCXP.cdsConsulta.FieldByName('FECPAGO').AsDatetime),4,2) ).AsString='S' then
   begin
      ShowMessage('Periodo se encuentra Cerrado' );
      Exit;
   end;

   if MessageDlg('¿ Esta seguro de Activar Retención ?', mtconfirmation, [mbYes,mbNo],0)=mrNo then Exit;

   DMCXP.CDSRETENCION.First;
   while not DMCXP.CDSRETENCION.Eof do
   begin
      DMCXP.CDSRETENCION.Edit;
      DMCXP.CDSRETENCION.FieldByName('ECESTADO').AsString:='';
      DMCXP.CDSRETENCION.Post;
      DMCXP.CDSRETENCION.Next;
   end;

   try
   xSQL:='Update CNT320 set ECESTADO=null '
        +'Where RETSERIE=''' +DMCXP.cdsConsulta.FieldByName('RETSERIE').AsString+''' '
        +  'and RETNUMERO='''+DMCXP.cdsConsulta.FieldByName('RETNUMERO').AsString+'''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xSQL );
   DMCXP.cdsQry.Execute;
   //DMCXP.CDSRETENCION.ApplyUpdates( -1 );
   except
      ShowMessage('Error : al Grabar Retención');
      Exit;
   end;

   DMCXP.cdsConsulta.Edit;
   DMCXP.cdsConsulta.FieldByName('ECESTADO').AsString:='ACTIVO';
   DMCXP.cdsConsulta.Post;
   ShowMessage('Retención Activada');
end;

procedure TFAnula.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure TFAnula.FormShow(Sender: TObject);
begin
  wwDBEdit1.enabled := True;
  wwDBEdit2.enabled := True;
  xserie := DMCXP.cdsConsulta.FieldBYName('RETSERIE').AsString;
  xnumero := DMCXP.cdsConsulta.FieldBYName('RETNUMERO').AsString;
end;

procedure TFAnula.bbtnReemplazarClick(Sender: TObject);
Var
   xSQL : String;
begin

   if DMCXP.cdsConsulta.FieldByName('ECESTADO').AsString='ANULADO' then
   begin
      ShowMessage('Error : Retención se encuentra Anulado');
      Exit;
   end;

   xSQL:='Select * from TGE154 '
        +'Where CIAID=''02'' '
        +  'and ANO='+QuotedStr( Copy(DateToStr(DMCXP.cdsConsulta.FieldByName('FECPAGO').AsDateTime),7,4) );
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xSQL );
   DMCXP.cdsQry.Open;
   if DMCXP.cdsQry.FieldByName('PER'+Copy(DateToStr(DMCXP.cdsConsulta.FieldByName('FECPAGO').AsDatetime),4,2) ).AsString='S' then
   begin
      ShowMessage('Periodo se encuentra Cerrado' );
      Exit;
   end;

   if MessageDlg('¿ Esta seguro de Reemplazar la Retención ?', mtconfirmation, [mbYes,mbNo],0)=mrNo then Exit;

   DMCXP.cdsConsulta.Edit;
   DMCXP.cdsConsulta.FieldByName('RETSERIE').AsString:=DMCXP.cdsConsulta.FieldByName('RETSERIE').AsString;
   DMCXP.cdsConsulta.FieldByName('RETNUMERO').AsString:=DMCXP.cdsConsulta.FieldByName('RETNUMERO').AsString;
   DMCXP.cdsConsulta.Post;

   try
   xSQL:='Update CNT320 set RETSERIE='''+DMCXP.cdsConsulta.FieldByName('RETSERIE').AsString+''', RETNUMERO= '''+DMCXP.cdsConsulta.FieldByName('RETNUMERO').AsString+''' '
        +'Where RETSERIE=''' +TRIM(XSERIE)+''' '
        +  'and RETNUMERO='''+TRIM(XNUMERO)+'''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xSQL );
   DMCXP.cdsQry.Execute;
   //DMCXP.CDSRETENCION.ApplyUpdates( -1 );
   except
      ShowMessage('Error : al Reemplazar la retención');
      Exit;
   end;


   ShowMessage('Se reemplazó la Retención');
end;

procedure TFAnula.BitBtn1Click(Sender: TObject);
Var
   xSQL, xRetSerie, xRetNumero: String;
   xfArchivoTexto: TextFile;
   xsNombreTxt, xCarpeta, xsClave, xTDocSunat: String;
Begin
   xContinuaGrab := False;
   FRetencion.SelecImpresDest;
   If Not xContinuaGrab Then
   Begin
      ShowMessage('No continuará con la Aceptación del Comprobante de Retención IGV Manual');
      exit;
   End;

   xRetSerie := DMCXP.cdsRetencion.FieldByName('RETSERIE').AsString;
   xRetNumero := DMCXP.cdsRetencion.FieldByName('RETNUMERO').AsString;
   Try
      xSQL := ' Begin '
         + '       DB2ADMIN.SP_TXT_CNT320_RETIGV2(' + quotedstr(xRetSerie) + ','
         +         quotedstr(xRetnumero) + ','
         +         quotedStr(DMCXP.wUsuario) + ','
         +         quotedStr('ACEPTADO') + ','
         +         quotedStr(wIP_Impresora) + '); '
         + '    End;';
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo generar el archivo txt para SUNAT');
      Exit;
   End;

// Resolviendo ID de Envio
   xsClave := '02' + xRetSerie + xRetnumero;

// Resolviendo último número de Envio
   xSQL := 'Select max(NUMENVRET) NUMENVRET '
      + '     from db2admin.CAJA_CERT_RETIGV '
      + '    where CODRETIGV = ' + QuotedStr(xsClave);
   DMCXP.cdsQry4.Close;
   DMCXP.cdsQry4.DataRequest(xSQL);
   DMCXP.cdsQry4.Open;

// Resolviendo Tipo de Documento Sunat
   xSQL := 'Select TDOC_SUNAT '
      + '     from db2admin.TGE110 '
      + '    where DOCID = ' + QuotedStr(DMCXP.cdsRetencion.FieldByName('DOCID').AsString);
   DMCXP.cdsQry6.Close;
   DMCXP.cdsQry6.DataRequest(xSQL);
   DMCXP.cdsQry6.Open;
   xTDocSunat := DMCXP.cdsQry6.FieldByName('TDOC_SUNAT').AsString;

// Resolviendo Carpeta para Archivo
   xSQL := 'Select RUTADES '
      + '     From db2admin.TGE837 '
      + '    Where APLIC = ' + QuotedStr('RET')
      + '      And RUTAID = ' + QuotedStr(wId_Rutadest);
   DMCXP.cdsQry6.Close;
   DMCXP.cdsQry6.DataRequest(xSQL);
   DMCXP.cdsQry6.Open;
   xCarpeta := DMCXP.cdsQry6.FieldByName('RUTADES').AsString;

// Seleccionando Registros para escribir en Txt
   xSQL := 'Select NUMDETLIN, DESDETLIN '
      + '     from db2admin.CAJA_CERT_RETIGV '
      + '    where CODRETIGV  = ' + QuotedStr(xsClave)
      + '      and NUMENVRET  = ' + inttostr(DMCXP.cdsQry4.FieldByName('NUMENVRET').AsInteger);
//      +    '     and ESTADOFAC = ' +QuotedStr('ACEPTADO');
   DMCXP.cdsQry8.Close;
   DMCXP.cdsQry8.DataRequest(xSQL);
   DMCXP.cdsQry8.Open;
   DMCXP.cdsQry8.IndexFieldNames := 'NUMDETLIN';

//
   xsNombreTxt := xCarpeta + 'RE_' + xTDocSunat + '_' + xRetSerie + '_' + xRetNumero + '.txt';
   AssignFile(xfArchivoTexto, xsNombreTxt);
   Rewrite(xfArchivoTexto);

   DMCXP.cdsQry8.First;
   While Not DMCXP.cdsQry8.EOF Do
   Begin
      WriteLn(xfArchivoTexto, DMCXP.cdsQry8.FieldByName('DESDETLIN').AsString);
      DMCXP.cdsQry8.Next;
   End;
   CloseFile(xfArchivoTexto);
   ShowMessage('ok');
end;

end.
