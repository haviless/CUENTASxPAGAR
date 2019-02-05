Unit CXP280;

// Actualizaciones
// HPC_201604_CXP  23/08/2016  DAF_2016000575_CXP_1 Agrega rutina que genera archivo para SUNAT
//                             Reordenamiento de todo el formulario, cambio de cds
//

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Mask, wwdbedit, StdCtrls, wwdblook, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg,
   wwdbdatetimepicker, DBCtrls, Buttons, DB, Wwdatsrc, DBClient, wwclient,
   wwIDlg, variants, ExtCtrls, ShellApi;

Type
   TFRetencion = Class(TForm)
      gbDocumento: TGroupBox;
      Label1: TLabel;
      Label2: TLabel;
      edtProvDes: TEdit;
      dbeRuc: TwwDBEdit;
      Label3: TLabel;
      gbDetalle: TGroupBox;
      dblcAux: TwwDBLookupComboDlg;
      Label4: TLabel;
      lkcDocid: TwwDBLookupCombo;
      dbeSerie: TwwDBEdit;
      Label5: TLabel;
      Label6: TLabel;
      dbeNoDoc: TwwDBEdit;
      dbdtFecemi: TwwDBDateTimePicker;
      Label7: TLabel;
      gbDatosPago: TGroupBox;
      Label10: TLabel;
      dblTipMon: TwwDBLookupCombo;
      Label11: TLabel;
      dbemonto: TwwDBEdit;
      spbCalcula: TBitBtn;
      gbCalculo: TGroupBox;
      dbeMontoRet: TwwDBEdit;
      dbeTasaRet: TwwDBEdit;
      Label12: TLabel;
      dbgGrid: TwwDBGrid;
      spbOtro: TBitBtn;
      spbSalir: TBitBtn;
      spbGraba: TBitBtn;
      spbAceptar: TBitBtn;
      spbNuevo: TBitBtn;
      gbxNumero: TGroupBox;
      lblNumero: TLabel;
      Label8: TLabel;
      dbdtFecPag: TwwDBDateTimePicker;
      Label9: TLabel;
      dbeTCam: TwwDBEdit;
      Label13: TLabel;
      dbdtFecPag2: TwwDBDateTimePicker;
      Label14: TLabel;
      dbeTCam2: TwwDBEdit;
      bbtnCancelar: TBitBtn;
      bbtnRetCons: TBitBtn;
      gbRetencion: TGroupBox;
      lblSerie: TLabel;
      lblNroRetencion: TLabel;
      dbeRetSerie: TwwDBEdit;
      dbeRetNumero: TwwDBEdit;
      dblClase: TwwDBLookupCombo;
      pnlImprDest: TPanel;
      bbtnImpDest: TBitBtn;
      StaticText3: TStaticText;
      dblcdImpDest: TwwDBLookupComboDlg;
      bbtnImpDestCanc: TBitBtn;
      Z2bbtnReImprime: TBitBtn;
      Procedure dblClaseChange(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcAuxChange(Sender: TObject);
      Procedure spbCalculaClick(Sender: TObject);
      Procedure spbOtroClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure wwDBGrid1DrawFooterCell(Sender: TObject; Canvas: TCanvas;
         FooterCellRect: TRect; Field: TField; FooterText: String;
         Var DefaultDrawing: Boolean);
      Procedure dbemontoExit(Sender: TObject);
      Procedure spbSalirClick(Sender: TObject);
      Procedure spbAceptarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure spbNuevoClick(Sender: TObject);
      Procedure OnEnter(Sender: TObject);
      Procedure dblClaseExit(Sender: TObject);
      Procedure dblcAuxExit(Sender: TObject);
      Procedure lkcDocidExit(Sender: TObject);
      Procedure dblTipMonExit(Sender: TObject);
      Procedure OnUpperKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbemontoKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbdtFecPagExit(Sender: TObject);
      Procedure dbemontoChange(Sender: TObject);
      Procedure dblcAuxInitDialog(Dialog: TwwLookupDlg);
      Procedure DSTEMPORALStateChange(Sender: TObject);
      Procedure CDSTEMPORALAfterDelete(DataSet: TDataSet);
      Procedure CDSTEMPORALBeforePost(DataSet: TDataSet);
      Procedure CDSTEMPORALAfterPost(DataSet: TDataSet);
      Procedure CDSTEMPORALPostError(DataSet: TDataSet; E: EDatabaseError;
         Var Action: TDataAction);
      Procedure spbGrabaClick(Sender: TObject);
      Procedure dbeNoDocExit(Sender: TObject);
      Procedure dbeSerieExit(Sender: TObject);
      Procedure CDSTEMPORALBeforeDelete(DataSet: TDataSet);
      Procedure dbeTCamChange(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure bbtnRetConsClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbeTCamExit(Sender: TObject);
      Procedure bbtnImpDestClick(Sender: TObject);
      Procedure Z2bbtnReImprimeClick(Sender: TObject);
      Procedure bbtnImpDestCancClick(Sender: TObject);
      Procedure GeneraTxtRetElec;

   Private
    { Private declarations }
      strTmp: String;
      sClaseProveedor: String;
      sFiltroActivo: String;
      cdsCache: TwwClientDataset;
      Procedure ValidaDatos;
      Procedure AdicionaFila;
      Function Redondea(currDato: Currency; digitos: word = 2): Currency;
      Procedure DevuelvePeriodo(Var sAno: String; Var sMes: String);
      Function NumLetra(Const mNum: Currency; Const iIdioma, iModo: Smallint): String;
      Function CalculaTotalRetencionSoles: Currency;
      Procedure ActualizaAdicionales;
      Procedure SumaGrid;
   Public
      rr, verif: String;
      Procedure SelecImpresDest;
    { Public declarations }
   End;

Var
   FRetencion: TFRetencion;
   xReqLongSerFija: boolean;
   xLongSerFija: Integer;
   xRetSerie, xRetNumero: String;
   sAno, sMes: String;
   xNumComp: String;
   xTasaRet: Double;
   xCiaRUC: String;

   wIP_Impresora: String;
   wId_Rutadest: String;
   xTienda: String;
   xPVenta: String;
   xContinuaGrab: Boolean;

Implementation

Uses CxPDM, CXP282;

{$R *.DFM}

Procedure TFRetencion.dblClaseChange(Sender: TObject);
Begin
   DMCXP.cdsAUXID.Close;
   DMCXP.cdsAUXID.DataRequest('Select * from CNT201 WHERE CLAUXID=''' + TRIM(dblClase.Text) + ''' ');
   DMCXP.cdsAUXID.Open;
End;

Procedure TFRetencion.FormCreate(Sender: TObject);
Begin
   DMCXP.cdsCLAUX.Close;
   DMCXP.cdsCLAUX.DataRequest('SELECT * FROM TGE102');
   DMCXP.cdsCLAUX.Open;

   DMCXP.cdsTDOC.Close;
   DMCXP.cdsTDOC.DataRequest('SELECT * FROM TGE110 WHERE  DOCMOD=''CXP'' and DOCRETIGV=''S''');
   DMCXP.cdsTDOC.Open;

   DMCXP.cdsTMON.Close;
   DMCXP.cdsTMON.DataRequest('SELECT * FROM TGE103');
   DMCXP.cdsTMON.Open;

   DMCXP.cdsTASARET.Close;
   DMCXP.cdsTASARET.DataRequest('Select TASACAN from TGE108 where TASATPO=''R''');
   DMCXP.cdsTASARET.Open;

   DMCXP.cdsQry3.Close;
   DMCXP.cdsQry3.DataRequest('Select * from CNT320 where 1<>1');
   DMCXP.cdsQry3.Open;

   dblClase.LookUpField := 'CLAUXID';
   dblClase.LookupTable := DMCXP.cdsClAux;
   dblClase.DataField := 'CLAUXID';
   dblClase.DataSource := DMCXP.dsQry3;

   dblcAux.LookUpField := 'AUXID';
   dblcAux.LookupTable := DMCXP.cdsAuxId;
   dblcAux.DataField := 'AUXID';
   dblcAux.DataSource := DMCXP.dsQry3;

   dbeRuc.DataField := 'AUXRUC';
   dbeRuc.DataSource := DMCXP.dsQry3;

   lkcDocid.LookupField := 'DOCID';
   lkcDocid.LookupTable := DMCXP.cdsTDoc;
   lkcDocid.DataField := 'DOCID';
   lkcDocid.DataSource := DMCXP.dsQry3;

   dbeSerie.DataField := 'SERIE';
   dbeSerie.DataSource := DMCXP.dsQry3;

   dbeNoDoc.DataField := 'NODOC';
   dbeNoDoc.DataSource := DMCXP.dsQry3;

   dbdtFecemi.DataField := 'FECEMI';
   dbdtFecemi.DataSource := DMCXP.dsQry3;

   dblTipMon.LookupField := 'TMONID';
   dblTipMon.LookupTable := DMCXP.cdsTMon;
   dblTipMon.DataField := 'TMONIDFAC';
   dblTipMon.DataSource := DMCXP.dsQry3;

   dbdtFecPag2.DataField := 'FECPAGO';
   dbdtFecPag2.DataSource := DMCXP.dsQry3;

   dbeTCam2.DataField := 'TCAMB';
   dbeTCam2.DataSource := DMCXP.dsQry3;

   dbemonto.DataField := 'MTOORI';
   dbemonto.DataSource := DMCXP.dsQry3;

   dbeRetSerie.DataField := 'RETSERIE';
   dbeRetSerie.DataSource := DMCXP.dsQry3;

   dbeRetNumero.DataField := 'RETNUMERO';
   dbeRetNumero.DataSource := DMCXP.dsQry3;

   dbeMontoRet.DataField := 'MTORETORI';
   dbeMontoRet.DataSource := DMCXP.dsQry3;

   dbgGrid.DataSource := DMCXP.dsQry3;
   dbgGrid.Selected.Clear;
   dbgGrid.Selected.Add('DOCID'#9'2'#9'TIPO'#9'F');
   dbgGrid.Selected.Add('SERIE'#9'5'#9'SERIE'#9'F');
   dbgGrid.Selected.Add('NODOC'#9'10'#9'NUMERO DOC'#9'F');
   dbgGrid.Selected.Add('FECEMI'#9'10'#9'FEC.EMI.'#9'F');
   dbgGrid.Selected.Add('MTOORI'#9'10'#9'MTO PAGO'#9'F');
   dbgGrid.Selected.Add('FECPAGO'#9'10'#9'FEC PAGO'#9'F');
   dbgGrid.Selected.Add('MTORETORI'#9'10'#9'RETENCION'#9'F');
   dbgGrid.Selected.Add('TMONIDFAC'#9'2'#9'MND'#9'F');
   dbgGrid.Selected.Add('TCAMB'#9'10'#9'TIPO CAMB.'#9'F');
   dbgGrid.Selected.Add('AUXID'#9'10'#9'AUXID'#9'F');
   dbgGrid.Selected.Add('AUXRUC'#9'11'#9'AUXRUC'#9'F');
   dbgGrid.Selected.Add('CLAUXID'#9'20'#9'CLAUXID'#9'F');
   dbgGrid.ApplySelected;

   dbgGrid.ColumnByName('MTORETORI').FooterValue := '0.00';
   dbgGrid.ColumnByName('MTOORI').FooterValue := '0.00';

   cdsCache := TwwClientDataSet.Create(self);
   cdsCache.IndexDefs.AddIndexDef.Name := 'ixs1';
   cdsCache.IndexDefs.AddIndexDef.Fields := 'AUXRUC;DOCID;SERIE;NODOC';
   cdsCache.IndexDefs.AddIndexDef.Options := [ixUnique];
   cdsCache.IndexName := 'ixs1';

End;

Procedure TFRetencion.dblcAuxChange(Sender: TObject);
Begin
   exit;
   If (VERIF = '1') And (Length(TRIM(dblcAux.Text)) >= 5) Then

   Begin
      If DMCXP.CDSAUXID.Locate('AUXID', dblcAux.Text, []) Then
      Begin
         edtProvDes.Text := DMCXP.CDSAUXID.fieldbyname('AUXNOMB').ASSTRING;
         If Length(TRIM(DMCXP.CDSAUXID.FieldByName('AUXRUC').AsString)) < 11 Then
         Begin
            ShowMessage('INGRESE CORRECTAMENTE EL RUC EN EL AUXILIARES Y PROVEEDORES');
            DMCXP.cdsQry3.FieldByName('AUXRUC').AsString := '';
            EXIT;
         End;

         DMCXP.cdsQry3.FieldByName('AUXRUC').AsString := DMCXP.CDSAUXID.FieldByName('AUXRUC').AsString;
      End
      Else
      Begin
         ShowMessage('MATRICULE EL CODIGO DEL PROVEEDOR COMO AUXILIAR Y PROVEEDORES');
         edtProvDes.Text := '';
         EXIT;
      End;

   End;
End;

Procedure TFRetencion.spbCalculaClick(Sender: TObject);
// Inicio HPC_201604_CXP
Var
   xx: Real;
//Var
   yy: Real;
// Fin HPC_201604_CXP
Begin
   If DMCXP.CDSRETENCION.FieldByName('MTORETORI').AsFloat > 0 Then
   Begin
      If MessageDlg('Retenciòn Ya Fue Calculada' + #13 + 'Calcula Nuevamente ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Begin
         Exit
      End;
   End;

   xx := DMCXP.CDSTASARET.FieldByName('TASACAN').AsFloat / 100;
   yy := DMCXP.cdsQry3.FieldByName('MTOORI').AsFloat;

   If dbdtFecemi.date < strtodate('01/03/2014') Then
      xx := 0.06;

   DMCXP.cdsQry3.FieldByName('MTORETORI').AsFloat := yy * xx;
   spbCalcula.Enabled := False;
End;

Procedure TFRetencion.spbOtroClick(Sender: TObject);
Begin
   ValidaDatos;
   AdicionaFila;
   lkcdocid.SetFocus;
End;

Procedure TFRetencion.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   End
End;

Procedure TFRetencion.wwDBGrid1DrawFooterCell(Sender: TObject; Canvas: TCanvas;
   FooterCellRect: TRect; Field: TField; FooterText: String;
   Var DefaultDrawing: Boolean);
Begin
//
End;

Procedure TFRetencion.dbemontoExit(Sender: TObject);
Begin
   spbCalcula.Enabled := True;
   SumaGrid;
   spbGraba.Enabled := True;
   spbGraba.SetFocus;
End;

Procedure TFRetencion.spbSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFRetencion.spbAceptarClick(Sender: TObject);
Var
   xSQL, xRetSerie, xRetNumero: String;
   xfArchivoTexto: TextFile;
   xsNombreTxt, xCarpeta, xsClave, xTDocSunat: String;
Begin
   xContinuaGrab := False;
   SelecImpresDest;
   If Not xContinuaGrab Then
   Begin
      ShowMessage('No continuará con la Aceptación del Comprobante de Retención IGV Manual');
      exit;
   End;

   xRetSerie := dbeRetSerie.Text;
   xRetNumero := dbeRetNumero.Text;
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
      + '    where DOCID = ' + QuotedStr(lkcDocid.Text);
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

// Fin HPC_201604_CXP

// Deshabilita botón de GRABAR por la ACEPTACION de la Retención
   spbGraba.Enabled := False;
   spbNuevo.Enabled := True;
   spbOtro.Enabled := False;
   spbAceptar.Enabled := False;
   lblNumero.Caption := xRetSerie + '-' + xRetnumero;
   gbRetencion.Enabled := False;
   gbDocumento.Enabled := False;
   gbDatosPago.Enabled := False;
   bbtnRetCons.Enabled := True;

End;

Procedure TFRetencion.ValidaDatos;
Begin
// Consistencia que se ingrese Datos
   If trim(dblClase.Text) = '' Then
   Begin
      dblClase.SetFocus;
      Raise Exception.Create('Ingrese Clase Auxiliar');
   End;
   If trim(dblcAux.Text) = '' Then
   Begin
      dblcAux.SetFocus;
      Raise Exception.Create('Ingrese Codigo de Auxiliar');
   End;
   If trim(lkcDocid.Text) = '' Then
   Begin
      lkcDocid.SetFocus;
      Raise Exception.Create('Ingrese Tipo de Documento');
   End;
   If trim(dbeSerie.Text) = '' Then
   Begin
      dbeSerie.SetFocus;
      Raise Exception.Create('Ingrese Serie de Dcoumento');
   End;
   If trim(dbeNoDoc.Text) = '' Then
   Begin
      dbeNoDoc.SetFocus;
      Raise Exception.Create('Ingrese Numero de Documento');
   End;
   If trim(dbdtFecemi.Text) = '' Then
   Begin
      dbdtFecemi.SetFocus;
      Raise Exception.CReate('Ingrese Fecha de Documento');
   End;
   If trim(dblTipMon.Text) = '' Then
   Begin
      dblTipMon.SetFocus;
      Raise Exception.Create('Ingrese Tipo de Moneda');
   End;
   If Trim(dbdtFecPag.Text) = '' Then
   Begin
      dbdtFecPag.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Pago');
   End;
   If Trim(dbeTCam.Text) = '' Then
   Begin
      dbeTCam.SetFocus;
      Raise Exception.Create('Ingrese Tipo de Cambio');
   End;
   If Trim(dbemonto.Text) = '' Then
   Begin
      dbemonto.SetFocus;
      Raise Exception.Create('Ingrese Monto de Pago');
   End;
End;

Procedure TFRetencion.FormShow(Sender: TObject);
Begin
//   Perform(WM_NEXTDLGCTL, 0, 0);

   sClaseProveedor := 'P';
   sFiltroActivo := 'P';
   strTmp := '';

   dblClase.text := sClaseProveedor;

   xRetSerie := '';
   xRetNumero := '';

   spbOtro.Enabled := False;
   bbtnCancelar.Enabled := False;
   spbGraba.Enabled := False;
   spbAceptar.Enabled := False;
   spbNuevo.Enabled := False;
   bbtnRetCons.Enabled := True;

   gbRetencion.Enabled := True;
   gbDocumento.Enabled := True;
   gbDatosPago.Enabled := True;

// Recuperar Fecha de Servidor
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest('Select sysdate FECHA from DUAL');
   DMCXP.cdsQry.Open;

   dbdtFecPag.date := DMCXP.cdsQry.FieldByName('FECHA').AsDateTime;
   dbdtFecPag2.date := DMCXP.cdsQry.FieldByName('FECHA').AsDateTime;

   AdicionaFila;
End;

Procedure TFRetencion.spbNuevoClick(Sender: TObject);
Begin

   If (lblNumero.Caption = '') And ((DMCXP.cdsQry3.RecordCount > 0) Or (DMCXP.cdsQry3.State In [dsInsert])) Then
   Begin
   // Preguntar
      If Application.MessageBox(
         'Tiene Datos no Grabados ¿Desea Continuar?',
         'Confirme Nueva Retención',
         MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK Then
         Exit;
   End;
   dblClase.Enabled := True;
   dblcAux.Enabled := True;

   spbOtro.Enabled := False;
   spbAceptar.Enabled := False;
   spbGraba.Enabled := False;
   spbNuevo.Enabled := False;
   spbAceptar.Enabled := False;
   bbtnRetCons.Enabled := False;

   gbRetencion.Enabled := True;
   gbDocumento.Enabled := True;
   gbDatosPago.Enabled := True;
   gbxNumero.Enabled := TRue;

   dbgGrid.DataSource := Nil;
   DMCXP.cdsQry3.BeforeScroll := Nil;
   DMCXP.cdsQry3.Close;
   DMCXP.cdsQry3.DataRequest('Select * from CNT320 where 1<>1');
   DMCXP.cdsQry3.Open;
   dbgGrid.DataSource := DMCXP.dsQry3;
   lblNumero.caption := '';
   edtProvDes.Clear;

   dbdtFecPagExit(Self);

   dbgGrid.ColumnByName('MTORETORI').FooterValue := '0.00';
   dbgGrid.ColumnByName('MTOORI').FooterValue := '0.00';
   DMCXP.cdsQry3.Append;
   DMCXP.cdsQry3.FieldByName('CLAUXID').AsString := sClaseProveedor;
   dblcAux.Enabled := True;
   dblClase.SetFocus;
   cdsCache.CloneCursor(DMCXP.cdsQry3, False);
   cdsCache.IndexName := 'ixs1';
End;

Procedure TFRetencion.OnEnter(Sender: TObject);
Begin
   strTmp := Trim(TCustomEdit(Sender).Text);
End;

Procedure TFRetencion.dblClaseExit(Sender: TObject);
Begin
   If strTmp <> trim(dblClase.Text) Then
   Begin
      DMCXP.cdsQry3.FieldByName(dblcAux.DataField).Clear;
      DMCXP.cdsQry3.FieldByName(dbeRuc.DataField).Clear;
      edtProvDes.Clear;
    //Buscar la Clase de Auxiliar
      If Not dblClase.LookupTable.Locate(dblClase.LookupField, VarArrayOf([trim(dblClase.Text)]), []) Then
      Begin
         DMCXP.cdsQry3.FieldByName(dblClase.DataField).Clear;
         dblcAux.Enabled := False;
      End
      Else
      Begin
         dblcAux.Enabled := True;
         dblcAux.SetFocus;
         If sFiltroActivo <> trim(dblClase.Text) Then
         Begin
            DMCXP.CDSAUXID.Filter := ' CLAUXID=''' + TRIM(dblClase.Text) + ''' ';
            DMCXP.CDSAUXID.Filtered := True;
            sFiltroActivo := trim(dblClase.Text);
         End;
      End;
   End;
End;

Procedure TFRetencion.dblcAuxExit(Sender: TObject);
Begin
   If Not (DMCXP.cdsQry3.State In [dsEdit, dsInsert]) Then
      Exit;
   If strTmp <> trim(dblcAux.Text) Then
   Begin
      bbtnCancelar.Enabled := True;
      If sFiltroActivo <> dblClase.Text Then
      Begin
         dblcAux.LookupTable.Filter := 'CLAUXID=''' + dblClase.Text + ''' ';
         dblcAux.LookupTable.Filtered := True;
         sFiltroActivo := dblClase.Text;
      End;

      If Not dblcAux.LookupTable.Locate('CLAUXID;AUXID', VarArrayOf([trim(dblClase.Text), trim(dblcAux.Text)]), []) Then
      Begin
         DMCXP.cdsQry3.FieldByName(dblcAux.DataField).Clear;
         DMCXP.cdsQry3.FieldByName(dbeRuc.DataField).Clear;
         edtProvDes.Clear;
      End
      Else
      Begin
         DMCXP.cdsQry3.FieldByName(dbeRuc.DataField).AsString := dblcAux.LookupTable.FieldBYName(dbeRuc.DataField).AsString;
         edtProvDes.Text := dblcAux.LookupTable.FieldBYName('AUXNOMB').AsString;

         If dblcAux.LookupTable.FieldBYName(dbeRuc.DataField).IsNull Then
         Begin
            ShowMessage('MATRICULE EL CODIGO DEL PROVEEDOR COMO AUXILIAR Y PROVEEDORES');
            DMCXP.cdsQry3.FieldByName(dblcAux.DataField).Clear;
            DMCXP.cdsQry3.FieldByName(dbeRuc.DataField).Clear;
            edtProvDes.Clear;
            Exit;
         End;
         If length(dblcAux.LookupTable.FieldBYName(dbeRuc.DataField).AsString) < 11 Then
         Begin
            ShowMessage('INGRESE CORRECTAMENTE EL RUC EN EL AUXILIARES Y PROVEEDORES');
            DMCXP.cdsQry3.FieldByName(dblcAux.DataField).Clear;
            DMCXP.cdsQry3.FieldByName(dbeRuc.DataField).Clear;
            edtProvDes.Clear;
            Exit;
         End;

      End;
   End;
End;

Procedure TFRetencion.lkcDocidExit(Sender: TObject);
Begin
   If strTmp <> trim(lkcDocid.Text) Then
   Begin
   // Buscar El tipo de Documento
      If Not lkcDocid.LookupTable.Locate(lkcDocid.LookupField, VarArrayOf([trim(lkcDocid.Text)]), []) Then
         DMCXP.cdsQry3.FieldByName(lkcDocid.DataField).Clear;
   End;
   xReqLongSerFija := False;
   xLongSerFija := 0;
   If lkcDocid.Text = '01' Then
   Begin
      xReqLongSerFija := True;
      xLongSerFija := 4;
   End;
End;

Procedure TFRetencion.dblTipMonExit(Sender: TObject);
Begin
   If strTmp <> trim(dblTipMon.Text) Then
   Begin
    //Buscar El tipo de Documento
      If Not dblTipMon.LookupTable.Locate(dblTipMon.LookupField, VarArrayOf([trim(dblTipMon.Text)]), []) Then
         DMCXP.cdsQry3.FieldByName(dblTipMon.DataField).Clear;
   End;
   dbemonto.SetFocus;
End;

Procedure TFRetencion.OnUpperKeyPress(Sender: TObject; Var Key: Char);
Begin
   key := UpCase(key);
End;

Procedure TFRetencion.dbemontoKeyPress(Sender: TObject; Var Key: Char);
Var
   sCadBuscar: String;
   i: integer;
   j: integer;
Begin
   If (key = #8) Then Exit;
//   if (key in ['-','+','E','e']) or (not(key in ['0'..'9','.'])) then
   If (key In ['-', '+', 'E', 'e']) Or (Not (key In ['0'..'9', '.'])) Then
   Begin
      key := #0;
      Exit;
   End;

// verificar que solo se ingrese a lo sumo un punto
   sCadBuscar := TCustomEdit(Sender).Text;
   i := AnsiPos('.', sCadBuscar);
   If key = '.' Then
      If AnsiPos('.', sCadBuscar) > 0 Then
      Begin
         key := #0;
         Exit;
      End;

   If i <> 0 Then
   Begin
      j := TCustomEdit(Sender).SelStart;
      If (j - i >= 2) And (key <> #8) Then
         key := #0
      Else
      Begin
         If (j >= i) And (key <> #8) Then
            If (Length(sCadBuscar) - i) >= 2 Then
            Begin
               TCustomEdit(Sender).Text := copy(sCadBuscar, 1, Length(sCadBuscar) - 1);
               TCustomEdit(Sender).SelStart := j;

            End;
      End;
   End;
End;

Procedure TFRetencion.dbdtFecPagExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select TCAMVPV '
      + '  from TGE107 '
      + ' where TMONID = ''D'' '
      + '   and FECHA = ' + quotedstr(datetostr(dbdtFecPag.Date));
   DMCXP.cdsQry2.Close;
   DMCXP.cdsQry2.DataRequest(xSQL);
   DMCXP.cdsQry2.Open;
   If DMCXP.cdsQry2.RecordCount = 0 Then
   Begin
      ShowMessage('No hay Tipo de Cambio para la Fecha de Pago');
      dbdtFecPag.SetFocus;
      Exit;
   End;
   dbeTCam.Text := DMCXP.cdsQry2.FieldByName('TCAMVPV').AsString;
   dbeTCam2.Text := DMCXP.cdsQry2.FieldByName('TCAMVPV').AsString;

   If Not (DMCXP.cdsQry3.State In [dsInsert, dsEdit]) Then
      DMCXP.cdsQry3.Edit;
   DMCXP.cdsQry3.FieldByName('FECPAGO').AsDateTime := dbdtFecPag.Date;
   DMCXP.cdsQry3.FieldByName('TCAMB').AsString := dbeTCam2.Text;
End;

Procedure TFRetencion.SumaGrid;
Var
   Val1, Val2: Double;
   nFactor: Double;
Begin
   Val1 := 0;
   Val2 := 0;
   DMCXP.cdsQry3.First;
   While Not DMCXP.cdsQry3.Eof Do
   Begin
      nFactor := 1;
      If lkcDocid.LookupTable.Locate('DOCID', VarArrayOf([DMCXP.cdsQry3.FieldBYName('DOCID').AsString]), []) Then
      Begin
         If lkcDocid.LookupTable.FieldByName('DOCRESTA').AsString = 'S' Then
            nFactor := -1;
      End;
      Val1 := Val1 + DMCXP.cdsQry3.FieldByName('MTORETORI').AsFloat * nFactor;
      Val2 := Val2 + DMCXP.cdsQry3.FieldByName('MTOORI').AsFloat * nFactor;
      DMCXP.cdsQry3.Next;
   End;
   dbgGrid.ColumnByName('MTORETORI').FooterValue := floattostr(Val1);
   dbgGrid.ColumnByName('MTOORI').FooterValue := floattostr(Val2);
End;

Procedure TFRetencion.AdicionaFila;
Var
   Vclase, VProveed, VRuc: String;
   Val1, Val2: Double;
   nFactor: Double;
Begin
   Vclase := dblClase.Text;
   Vproveed := dblcAux.Text;
   Vruc := dbeRuc.Text;
   verif := '0';

   Val1 := 0;
   Val2 := 0;
   DMCXP.cdsQry3.First;
   While Not DMCXP.cdsQry3.Eof Do
   Begin
      nFactor := 1;
      If lkcDocid.LookupTable.Locate('DOCID', VarArrayOf([DMCXP.cdsQry3.FieldBYName('DOCID').AsString]), []) Then
      Begin
         If lkcDocid.LookupTable.FieldByName('DOCRESTA').AsString = 'S' Then
            nFactor := -1;
      End;
      //
      Val1 := Val1 + DMCXP.cdsQry3.FieldByName('MTORETORI').AsFloat * nFactor;
      Val2 := Val2 + DMCXP.cdsQry3.FieldByName('MTOORI').AsFloat * nFactor;
      DMCXP.cdsQry3.Next;
   End;

   dbgGrid.ColumnByName('MTORETORI').FooterValue := floattostr(Val1);
   dbgGrid.ColumnByName('MTOORI').FooterValue := floattostr(Val2);

   DMCXP.cdsQry3.Append;
   DMCXP.cdsQry3.FieldByName('CLAUXID').AsString := Vclase;
   DMCXP.cdsQry3.FieldByName('AUXID').AsString := Vproveed;
   DMCXP.cdsQry3.FieldByName('AUXRUC').AsString := Vruc;
   DMCXP.cdsQry3.FieldByName('FECPAGO').AsDateTime := dbdtFecPag.Date;
   DMCXP.cdsQry3.FieldByName('TCAMB').AsString := dbeTCam.Text;
   DMCXP.cdsQry3.FieldByName('RETSERIE').AsString := xRetSerie;
   DMCXP.cdsQry3.FieldByName('RETNUMERO').AsString := xRetNumero;

   spbGraba.Enabled := False;
   spbOtro.Enabled := False;
   spbAceptar.Enabled := False;
   spbNuevo.Enabled := False;
   spbCalcula.Enabled := False;

//   dblClase.OnExit(dblClase);
   cdsCache.CloneCursor(DMCXP.cdsQry3, False);

   strTmp := '';

   dbdtFecPagExit(Self);
End;

Procedure TFRetencion.dbemontoChange(Sender: TObject);
Var
   xx, yy: Currency;
   xSQL: String;
Begin
   If dbemonto.focused And (dbemonto.DataSource.DataSet.state In [dsedit, dsinsert]) Then
   Begin
      If dbemonto.Text <> '' Then
      Begin
         xx := redondea(DMCXP.CDSTASARET.FieldByName('TASACAN').AsFloat / 100);
         yy := strtocurr(dbemonto.Text);

         If dbdtFecemi.date < strtodate('01/03/2014') Then
            xx := 0.06;

         DMCXP.cdsQry3.FieldByName('MTORETORI').AsFloat := redondea(yy * xx);
      End
      Else
      Begin
         DMCXP.cdsQry3.FieldByName('MTORETORI').AsFloat := 0;
      End;
   End;
End;

Function TFRetencion.Redondea(currDato: Currency; digitos: word = 2): Currency;
Begin
   result := strtocurr(floattostrf(currDato, ffFixed, 15, digitos));
End;

Procedure TFRetencion.dblcAuxInitDialog(Dialog: TwwLookupDlg);
Begin
   If sFiltroActivo <> dblClase.Text Then
   Begin
      dblcAux.LookupTable.Filter := 'CLAUXID=''' + dblClase.Text + ''' ';
      dblcAux.LookupTable.Filtered := True;
      sFiltroActivo := dblClase.Text;
   End;
End;

Procedure TFRetencion.DSTEMPORALStateChange(Sender: TObject);
Begin
   If DMCXP.cdsQry3.State = dsBrowse Then
      dbgGrid.KeyOptions := dbgGrid.KeyOptions + [dgAllowDelete]
   Else
      dbgGrid.KeyOptions := dbgGrid.KeyOptions - [dgAllowDelete];
End;

Procedure TFRetencion.CDSTEMPORALAfterDelete(DataSet: TDataSet);
Begin
   If DataSet.RecordCount = 0 Then
      spbNuevo.OnClick(spbNuevo);
End;

Procedure TFRetencion.CDSTEMPORALBeforePost(DataSet: TDataSet);
Begin
   ValidaDatos;
End;

Procedure TFRetencion.CDSTEMPORALAfterPost(DataSet: TDataSet);
Var
   currMonto: Currency;
Begin
   currMonto := OperClientDataSet(cdsCache, 'SUM(MTORETORI)', '');
   dbgGrid.ColumnByName('MTORETORI').FooterValue := FormatFloat('###,###,###.00', currMonto);

   currMonto := OperClientDataSet(cdsCache, 'SUM(MTOORI)', '');
   dbgGrid.ColumnByName('MTOORI').FooterValue := FormatFloat('###,###,###.00', currMonto);
   If DMCXP.cdsQry3.RecordCount = 1 Then
   Begin
      dblClase.Enabled := False;
      dblcAux.Enabled := False;
   End;
End;

Procedure TFRetencion.CDSTEMPORALPostError(DataSet: TDataSet;
   E: EDatabaseError; Var Action: TDataAction);
Begin
   ShowMessage('Está Tratando de Registrar este documento dos Veces -- REVISE');
   action := daAbort;
End;

Procedure TFRetencion.spbGrabaClick(Sender: TObject);
Var
   iFrac: Extended;
   xSQL: String;
   sTotalRetener: Currency;
   nFactor: Double;
   ltotal: String;
   xNumReg: Integer;
Begin
   ValidaDatos;
   If dbgGrid.DataSource.DataSet.State In [dsEdit, dsInsert] Then
      dbgGrid.DataSource.DataSet.post;
   SumaGrid;

   If trim(dbdtFecPag.Text) = '' Then
   Begin
      dbdtFecPag.Date := DateS;
      dbdtFecPag.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Emisión de Comprobante de Retención')
   End;

// Añade a todos los registros Fecha de Pago('FECPAGO') y Tipo de Cambio('TCAMB')
   ActualizaAdicionales;

   If xRetSerie = '' Then
   Begin
   // Serie de Retención
   // Inicio HPC_201601_CXP
   {
      xSQL := 'Select SERIEID '
         + '     from FAC103 '
         + '    where CIAID = ''02'' '
         + '      and FLAGV = ''R1'' ';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      If DMCXP.cdsQry.RecordCount = 0 Then
      Begin
         ShowMessage('No hay una serie de Retención definida con R1');
         exit;
      End;
      xRetSerie := DMCXP.cdsQry.FieldByName('SERIEID').AsString;
    }
      xSQL := 'Select CIARUC from TGE101 where CIAID=''02'' ';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      xCiaRUC := DMCXP.cdsQry.FieldByName('CIARUC').AsString;

      xRetSerie := '';
      xSQL := 'Select SERIERET '
         + '     from CXP104 '
         + '    where CIARUC='+quotedstr(xCiaRUC)
         + '      and VIGENCIA=''S'' ';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      If DMCXP.cdsQry.RecordCount > 0 Then
      Begin
         xRetSerie := DMCXP.cdsQry.fieldbyname('SERIERET').AsString;
      End;
   // Fin HPC_201604_CXP

   // Máximo Número de Retención
      xSQL := 'Select nvl(max(trim(to_char(to_number(RETNUMERO)+1,''0000000000''))),''0000000001'') RETNUMERO '
         + '     from CNT320 '
         + '    where CIAID = ''02'' '
         + '      and RETSERIE = ' + quotedstr(xRetSerie);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      xRetNumero := DMCXP.cdsQry.FieldByName('RETNUMERO').AsString;

      DevuelvePeriodo(sAno, sMes);

   // Máximo Número de Comprobante
      xSQL := 'Select nvl(max(trim(to_char(to_number(CNTCOMPROB)+1,''0000000000''))),''0000000001'') CNTCOMPROB '
         + '     from CNT301 '
         + '    where CIAID = ''02'' '
         + '      and CNTANOMM = ' + quotedstr(sAno + sMes)
         + '      and TDIARID = ' + quotedstr('40');
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      xNumComp := DMCXP.cdsQry.FieldByName('CNTCOMPROB').AsString;

   // Tasa de Retención
      xSQL := 'Select TASACAN '
         + '     from TGE108 '
         + '    where TASATPO=''R'' ';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      If DMCXP.cdsQry.RecordCount = 0 Then
      Begin
         ShowMessage('No hay Tasa de Retención');
         exit;
      End;
      xTasaRet := DMCXP.cdsQry.FieldByName('TASACAN').AsFloat;

   // Inicio HPC_201601_CXP
      {
      xSQL := 'Select CIARUC from TGE101 where CIAID=''02'' ';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      xCiaRUC := DMCXP.cdsQry.FieldByName('CIARUC').AsString;
      }
   // Fin HPC_201601_CXP
      dbeRetSerie.Text := xRetSerie;
      dbeRetNumero.Text := xRetNumero;
      dbeTasaRet.Text := floattostr(xTasaRet) + '%';
   End
   Else
   Begin
      xSQL := 'Delete from CNT320 '
         + '    where CIAID=''02'' '
         + '      and RETSERIE=' + quotedstr(xRetSerie)
         + '      and RETNUMERO=' + quotedstr(xRetNumero);
      Try
         DMCXP.DCOM1.AppServer.Ejecutasql(xSQL);
      Except
         ShowMessage('No se pudo Eliminar el Detalle para volver a generar');
         Exit;
      End;
   End;

   sTotalRetener := 0;
   cdsCache.First;
   While Not cdsCache.Eof Do
   Begin
      nFactor := 1;
      If lkcDocid.LookupTable.Locate('DOCID', VarArrayOf([cdsCache.FieldBYName('DOCID').AsString]), []) Then
      Begin
         If lkcDocid.LookupTable.FieldByName('DOCRESTA').AsString = 'S' Then
            nFactor := -1;
      End;
      cdsCache.Edit;
      cdsCache.FieldBYName('MTOORI').AsCurrency := cdsCache.FieldBYName('MTOORI').AsCurrency * nFactor;
      cdsCache.FieldBYName('MTORETORI').AsCurrency := cdsCache.FieldBYName('MTORETORI').AsCurrency * nFactor;
      cdsCache.Post;

      If cdsCache.FieldBYName('TMONIDFAC').AsString = 'N' Then
         sTotalRetener := sTotalRetener + cdsCache.FieldBYName('MTORETORI').AsCurrency
      Else
         sTotalRetener := sTotalRetener + redondea(cdsCache.FieldBYName('MTORETORI').AsCurrency * cdsCache.FieldBYName('TCAMB').AsCurrency);

      cdsCache.Next;
   End;

   ifrac := frac(sTotalRetener) * 100;
   ltotal := NumLetra(TRUNC(sTotalRetener), 1, 1) + ' Y ' + formatfloat('00', ifrac) + '/100' + ' ' + DMCXP.wTMonLocDes;

   DMCXP.DCOM1.AppServer.IniciaTransaccion;

   xNumReg := 1;
   cdsCache.First;
   While Not cdsCache.Eof Do
   Begin
      xSQL := 'Insert into CNT320(CIAID, TDIARID, ANOMM, ECNOCOMP, FECPAGO, CLAUXID, AUXID, AUXRUC, DOCID, '
         + '                   SERIE, NODOC, DH, DOCDES, MTOORI, MTOLOC, MTOEXT, USUARIO, FREG, HREG, MTORETORI, MTORETLOC, MTORETEXT, '
         + '                   FECEMI, RETSERIE, RETNUMERO, TCAMB, TMONIDFAC, FOTROREG, CIARUC, TASARET, NUMREGRET) '
         + 'Values('
         + '''02'' ' + ', '
         + '''40'' ' + ', '
         + quotedstr(sAno + sMes) + ', '
         + quotedstr(xNumComp) + ', '
         + quotedstr(datetostr(cdsCache.FieldByName('FECPAGO').AsDateTime)) + ', '
         + quotedstr(cdsCache.FieldByName('CLAUXID').AsString) + ', '
         + quotedstr(cdsCache.FieldByName('AUXID').AsString) + ', '
         + quotedstr(cdsCache.FieldByName('AUXRUC').AsString) + ', '
         + quotedstr(cdsCache.FieldByName('DOCID').AsString) + ', '
         + quotedstr(cdsCache.FieldBYName('SERIE').AsString) + ', '
         + quotedstr(cdsCache.FieldBYName('NODOC').AsString) + ', ';

      If lkcDocid.LookupTable.Locate('DOCID', VarArrayOf([cdsCache.FieldBYName('DOCID').AsString]), []) Then
      Begin
         If lkcDocid.LookupTable.FieldByName('DOCRESTA').AsString = 'S' Then
            xSQL := xSQL + quotedstr('D') + ', '
         Else
            xSQL := xSQL + quotedstr('H') + ', ';
         xSQL := xSQL + quotedstr(copy(lkcDocid.LookupTable.FieldByName('DOCDES').AsString, 1, 15)) + ',';
      End
      Else
         xSQL := xSQL + quotedstr('H') + ', ' + quotedstr(sAno + sMes) + ', ';

      xSQL := xSQL + floattostr(cdsCache.FieldByName('MTOORI').AsCurrency) + ', ';

      If cdsCache.FieldBYName('TMONIDFAC').AsString = 'N' Then
         xSQL := xSQL + floattostr(cdsCache.FieldByName('MTOORI').AsCurrency) + ', ' // MTOLOC
            + 'round(' + floattostr(cdsCache.FieldByName('MTOORI').AsCurrency / cdsCache.FieldBYName('TCAMB').AsCurrency) + ',2), ' // MTOEXT
      Else
      Begin
         xSQL := xSQL + 'round(' + floattostr(cdsCache.FieldByName('MTOORI').AsCurrency * cdsCache.FieldBYName('TCAMB').AsCurrency) + ',2), ' // MTOLOC
            + floattostr(cdsCache.FieldByName('MTOORI').AsCurrency) + ', '; // MTOEXT
      End;

      xSQL := xSQL + quotedstr(DMCXP.wUsuario) + ', '
         + 'trunc(sysdate), sysdate, '
         + floattostr(cdsCache.FieldByName('MTORETORI').AsCurrency) + ', ';
      If cdsCache.FieldBYName('TMONIDFAC').AsString = 'N' Then
         xSQL := xSQL + floattostr(cdsCache.FieldByName('MTORETORI').AsCurrency) + ', '
            + 'round(' + floattostr(cdsCache.FieldByName('MTORETORI').AsCurrency / cdsCache.FieldBYName('TCAMB').AsCurrency) + ',2), '
      Else
         xSQL := xSQL + 'round(' + floattostr(cdsCache.FieldByName('MTORETORI').AsCurrency * cdsCache.FieldBYName('TCAMB').AsCurrency) + ',2), '
            + floattostr(cdsCache.FieldByName('MTORETORI').AsCurrency) + ', ';
      xSQL := xSQL + quotedstr(datetostr(cdsCache.FieldBYName('FECEMI').AsDateTime)) + ', '
         + quotedstr(xRetSerie) + ', '
         + quotedstr(xRetNumero) + ', '
         + floattostr(cdsCache.FieldByName('TCAMB').AsCurrency) + ', '
         + quotedstr(cdsCache.FieldByName('TMONIDFAC').AsString) + ', '
         + quotedstr('1') + ', '
         + quotedstr(xCiaRuc) + ', '
         + floatToStr(xTasaRet) + ', '
         + 'trim(to_char(' + inttostr(xNumReg) + ',' + quotedstr('000') + ')))';
      Try
         DMCXP.DCOM1.AppServer.Ejecutasql(xSQL);
      Except
         ShowMessage('No se pudo grabar las Retenciones de IGV');
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;
      cdsCache.Next;
      xNumReg := xNumReg + 1;
   End;

   xSQL := 'Update CNT320 '
      + '      Set RETTOTDES=' + quotedstr(ltotal)
      + '    where CIAID=''02'' '
      + '      and RETSERIE=' + quotedstr(xRetSerie)
      + '      and RETNUMERO=' + quotedstr(xRetNumero);
   Try
      DMCXP.DCOM1.AppServer.Ejecutasql(xSQL);
   Except
      ShowMessage('No se pudo actualizar el Monto en Letras de la Retención de IGV');
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
   End;

   DMCXP.DCOM1.AppServer.GrabaTransaccion;

   spbOtro.Enabled := True;
   spbAceptar.Enabled := True;
   bbtnCancelar.Enabled := False;
   bbtnRetCons.Enabled := False;

   ShowMessage('Grabado correctamente');
End;

Procedure TFRetencion.DevuelvePeriodo(Var sAno, sMes: String);
Var
   Year, Month, Day: Word;
Begin
   DecodeDate(dbdtFecPag.Date, Year, Month, Day);
   sano := StrZero(inttostr(Year), 4);
   sMes := StrZero(inttostr(Month), 2);
End;

Function TFRetencion.NumLetra(Const mNum: Currency; Const iIdioma,
   iModo: Smallint): String;
Const
   iTopFil: Smallint = 6;
   iTopCol: Smallint = 10;
   aCastellano: Array[0..5, 0..9] Of PChar =
   (('UNA ', 'DOS ', 'TRES ', 'CUATRO ', 'CINCO ',
      'SEIS ', 'SIETE ', 'OCHO ', 'NUEVE ', 'UN '),
      ('ONCE ', 'DOCE ', 'TRECE ', 'CATORCE ', 'QUINCE ',
      'DIECISEIS ', 'DIECISIETE ', 'DIECIOCHO ', 'DIECINUEVE ', ''),
      ('DIEZ ', 'VEINTE ', 'TREINTA ', 'CUARENTA ', 'CINCUENTA ',
      'SESENTA ', 'SETENTA ', 'OCHENTA ', 'NOVENTA ', 'VEINTI'),
      ('CIEN ', 'DOSCIENTAS ', 'TRESCIENTAS ', 'CUATROCIENTAS ', 'QUINIENTAS ',
      'SEISCIENTAS ', 'SETECIENTAS ', 'OCHOCIENTAS ', 'NOVECIENTAS ', 'CIENTO '),
      ('CIEN ', 'DOSCIENTOS ', 'TRESCIENTOS ', 'CUATROCIENTOS ', 'QUINIENTOS ',
      'SEISCIENTOS ', 'SETECIENTOS ', 'OCHOCIENTOS ', 'NOVECIENTOS ', 'CIENTO '),
      ('MIL ', 'MILLON ', 'MILLONES ', 'CERO ', 'Y ',
      'UNO ', 'DOS ', 'CON ', '', ''));
   aCatalan: Array[0..5, 0..9] Of PChar =
   (('UNA ', 'DUES ', 'TRES ', 'QUATRE ', 'CINC ',
      'SIS ', 'SET ', 'VUIT ', 'NOU ', 'UN '),
      ('ONZE ', 'DOTZE ', 'TRETZE ', 'CATORZE ', 'QUINZE ',
      'SETZE ', 'DISSET ', 'DIVUIT ', 'DINOU ', ''),
      ('DEU ', 'VINT ', 'TRENTA ', 'QUARANTA ', 'CINQUANTA ',
      'SEIXANTA ', 'SETANTA ', 'VUITANTA ', 'NORANTA ', 'VINT-I-'),
      ('CENT ', 'DOS-CENTES ', 'TRES-CENTES ', 'QUATRE-CENTES ', 'CINC-CENTES ',
      'SIS-CENTES ', 'SET-CENTES ', 'VUIT-CENTES ', 'NOU-CENTES ', 'CENT '),
      ('CENT ', 'DOS-CENTS ', 'TRES-CENTS ', 'QUATRE-CENTS ', 'CINC-CENTS ',
      'SIS-CENTS ', 'SET-CENTS ', 'VUIT-CENTS ', 'NOU-CENTS ', 'CENT '),
      ('MIL ', 'MILIO ', 'MILIONS ', 'ZERO ', '-',
      'UN ', 'DOS ', 'AMB ', '', ''));
Var
   aTexto: Array[0..5, 0..9] Of PChar;
   cTexto, cNumero: String;
   iCentimos, iPos: Smallint;
   bHayCentimos, bHaySigni: Boolean;

  (*************************************)
  (* Cargar Textos según Idioma / Modo *)
  (*************************************)

   Procedure NumLetra_CarTxt;
   Var
      i, j: Smallint;
   Begin
  (* Asignación según Idioma *)

      For i := 0 To iTopFil - 1 Do
         For j := 0 To iTopCol - 1 Do
            Case iIdioma Of
               1: aTexto[i, j] := aCastellano[i, j];
               2: aTexto[i, j] := aCatalan[i, j];
            Else
               aTexto[i, j] := aCastellano[i, j];
            End;

    (* Asignación si Modo Masculino *)

      If (iModo = 1) Then
      Begin
         For j := 0 To 1 Do
            aTexto[0, j] := aTexto[5, j + 5];

         For j := 0 To 9 Do
            aTexto[3, j] := aTexto[4, j];
      End;
   End;

  (****************************)
  (* Traducir Dígito -Unidad- *)
  (****************************)

   Procedure NumLetra_Unidad;
   Begin
      If Not ((cNumero[iPos] = '0') Or (cNumero[iPos - 1] = '1')
         Or ((Copy(cNumero, iPos - 2, 3) = '001') And ((iPos = 3) Or (iPos = 9)))) Then
         If (cNumero[iPos] = '1') And (iPos <= 6) Then
            cTexto := cTexto + aTexto[0, 9]
         Else
            cTexto := cTexto + aTexto[0, StrToInt(cNumero[iPos]) - 1];

      If ((iPos = 3) Or (iPos = 9)) And (Copy(cNumero, iPos - 2, 3) <> '000') Then
         cTexto := cTexto + aTexto[5, 0];

      If (iPos = 6) Then
         If (Copy(cNumero, 1, 6) = '000001') Then
            cTexto := cTexto + aTexto[5, 1]
         Else
            cTexto := cTexto + aTexto[5, 2];
   End;

  (****************************)
  (* Traducir Dígito -Decena- *)
  (****************************)

   Procedure NumLetra_Decena;
   Begin
      If (cNumero[iPos] = '0') Then
         Exit
      Else
         If (cNumero[iPos + 1] = '0') Then
            cTexto := cTexto + aTexto[2, StrToInt(cNumero[iPos]) - 1]
         Else
            If (cNumero[iPos] = '1') Then
               cTexto := cTexto + aTexto[1, StrToInt(cNumero[iPos + 1]) - 1]
            Else
               If (cNumero[iPos] = '2') Then
                  cTexto := cTexto + aTexto[2, 9]
               Else
                  cTexto := cTexto + aTexto[2, StrToInt(cNumero[iPos]) - 1]
                     + aTexto[5, 4];
   End;

  (*****************************)
  (* Traducir Dígito -Centena- *)
  (*****************************)

   Procedure NumLetra_Centena;
   Var
      iPos2: Smallint;
   Begin
      If (cNumero[iPos] = '0') Then
         Exit;

      iPos2 := 4 - Ord(iPos > 6);

      If (cNumero[iPos] = '1') And (Copy(cNumero, iPos + 1, 2) <> '00') Then
         cTexto := cTexto + aTexto[iPos2, 9]
      Else
         cTexto := cTexto + aTexto[iPos2, StrToInt(cNumero[iPos]) - 1];
   End;

  (**************************************)
  (* Eliminar Blancos previos a guiones *)
  (**************************************)

   Procedure NumLetra_BorBla;
   Var
      i: Smallint;
   Begin
      i := Pos(' -', cTexto);

      While (i > 0) Do
      Begin
         Delete(cTexto, i, 1);
         i := Pos(' -', cTexto);
      End;
   End;

Begin
  (* Control de Argumentos *)

   If (mNum < 0.00) Or (mNum > 999999999999.99) Or (iIdioma < 1) Or (iIdioma > 2)
      Or (iModo < 1) Or (iModo > 2) Then
   Begin
      Result := 'ERROR EN ARGUMENTOS';
      Abort;
   End;

  (* Cargar Textos según Idioma / Modo *)

   NumLetra_CarTxt;

  (* Bucle Exterior -Tratamiento Céntimos-     *)
  (* NOTA: Se redondea a dos dígitos decimales *)

   cNumero := Trim(Format('%12.0f', [Int(mNum)]));
   cNumero := StringOfChar('0', 12 - Length(cNumero)) + cNumero;
   iCentimos := Trunc((Frac(mNum) * 100) + 0.5);

   Repeat
    (* Detectar existencia de Céntimos *)

      If (iCentimos <> 0) Then
         bHayCentimos := True
      Else
         bHayCentimos := False;

    (* Bucle Interior -Traducción- *)

      bHaySigni := False;

      For iPos := 1 To 12 Do
      Begin
      (* Control existencia Dígito significativo *)

         If Not (bHaySigni) And (cNumero[iPos] = '0') Then
            Continue
         Else
            bHaySigni := True;

      (* Detectar Tipo de Dígito *)

         Case ((iPos - 1) Mod 3) Of
            0: NumLetra_Centena;
            1: NumLetra_Decena;
            2: NumLetra_Unidad;
         End;
      End;

    (* Detectar caso 0 *)

      If (cTexto = '') Then
         cTexto := aTexto[5, 3];

    (* Traducir Céntimos -si procede- *)

      If (iCentimos <> 0) Then
      Begin
         cTexto := cTexto + aTexto[5, 7];
         cNumero := Trim(Format('%.12d', [iCentimos]));
         iCentimos := 0;
      End;
   Until Not (bHayCentimos);

  (* Eliminar Blancos innecesarios -sólo Catalán- *)

   If (iIdioma = 2) Then
      NumLetra_BorBla;

  (* Retornar Resultado *)

   Result := Trim(cTexto);
End;

Procedure TFRetencion.dbeNoDocExit(Sender: TObject);
Var
   xSQL: String;
Begin
   {
   If (Length(dbeNoDoc.Text) < 8) And (DMCXP.cdsQry3.state In [dsInsert, dsEdit]) And (trim(dbeNoDoc.Text) <> '') Then
   Begin
      DMCXP.cdsQry3.FieldByName(dbeNoDoc.DataField).AsString := StrZero(dbeNoDoc.Text, 8);
   End;
   }
   If bbtnCancelar.Focused Then exit;
   If spbSalir.Focused Then exit;

// Verifica que Documento no haya sido registrsdo en otra Retención de IGV
   xSQL := 'Select nvl(sum(1),0) REGISTROS '
      + '  from CNT320 '
      + ' where CLAUXID = ' + quotedstr(dblClase.Text)
      + '   and AUXID = ' + quotedstr(dblcAux.Text)
      + '   and DOCID = ' + quotedstr(lkcDocid.Text)
      + '   and SERIE = ' + quotedstr(dbeSerie.Text)
      + '   and NODOC = ' + quotedstr(dbeNoDoc.Text)
      + '   and nvl(ECESTADO, ''NORMAL'')<>''ACEPTADO'' ';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.FieldByName('REGISTROS').AsInteger > 0 Then
   Begin
      ShowMessage('Documento del Proveedor ya existe en otra Retención de IGV');
      dbeNoDoc.SetFocus;
      exit;
   End;

// Verifica que Documento haya sido registrado en CxP
   xSQL := 'Select CLAUXID, PROV, DOCID, CPSERIE, CPNODOC, CPMTOORI, CPMTOLOC, CPMTOEXT, TMONID, CPFEMIS, '
      + '       CPMTOORI, CPMTOLOC, CPMTOEXT '
      + '  from CXP301 '
      + ' where CLAUXID = ' + quotedstr(dblClase.Text)
      + '   and PROV = ' + quotedstr(dblcAux.Text)
      + '   and DOCID = ' + quotedstr(lkcDocid.Text)
      + '   and CPSERIE = ' + quotedstr(dbeSerie.Text)
      + '   and CPNODOC = ' + quotedstr(dbeNoDoc.Text)
      + '   and CPESTADO in (''P'',''C'') ';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.Recordcount = 0 Then
   Begin
      ShowMessage('Documento del Proveedor no ha sido registrado como una Cuenta por Pagar');
      dbeNoDoc.SetFocus;
      exit;
   End;
   DMCXP.cdsQry3.FieldByName('FECEMI').AsDateTime := DMCXP.cdsQry.FieldByName('CPFEMIS').AsDateTime;
   DMCXP.cdsQry3.FieldByName('TMONIDFAC').AsString := DMCXP.cdsQry.FieldByName('TMONID').AsString;
   DMCXP.cdsQry3.FieldByName('MTOORI').AsFloat := DMCXP.cdsQry.FieldByName('CPMTOLOC').AsFloat;
End;

Procedure TFRetencion.dbeSerieExit(Sender: TObject);
Begin
   If (Length(dbeSerie.Text) < 3) And (DMCXP.cdsQry3.state In [dsInsert, dsEdit]) And (trim(dbeSerie.Text) <> '') Then
   Begin
      DMCXP.cdsQry3.FieldByName(dbeSerie.DataField).AsString := StrZero(dbeSerie.Text, 3);
   End;
   If xReqLongSerFija Then
   Begin
      If length(dbeSerie.Text) <> xLongSerFija Then
      Begin
         dbeSerie.SetFocus;
         Raise exception.Create('Longitud de la Serie debe ser de ' + inttostr(xLongSerFija) + ' caracteres');
      End;
   End;
End;

Procedure TFRetencion.CDSTEMPORALBeforeDelete(DataSet: TDataSet);
Begin
   If TRim(lblNumero.Caption) <> '' Then
   Begin
      Raise Exception.Create('No puede Borra Registros de Este Comprobante de Retención');
   End;
End;

Function TFRetencion.CalculaTotalRetencionSoles: Currency;
Begin
   Result := 0;
   cdsCache.First;
   While Not cdsCache.Eof Do
   Begin
      If cdsCache.FieldBYName('TMONIDFAC').AsString = 'N' Then
         result := result + cdsCache.FieldBYName('MTORETORI').AsCurrency
      Else
         Result := result + redondea(cdsCache.FieldBYName('MTORETORI').AsCurrency * cdsCache.FieldBYName('TCAMB').AsCurrency);
      cdsCache.Next;
   End;
End;

Procedure TFRetencion.dbeTCamChange(Sender: TObject);
Begin
   dbetcam2.Text := dbeTCam.Text;
End;

Procedure TFRetencion.ActualizaAdicionales;
Var
   cdsClone: TwwClientDataset;
Begin
   cdsClone := TwwClientDataSet.CReate(self);
   cdsClone.CloneCursor(DMCXP.cdsQry3, True);
   cdsClone.First;
   While Not cdsClone.Eof Do
   Begin
      cdsClone.Edit;
      cdsClone.FieldByName('FECPAGO').AsDateTime := dbdtFecPag.Date;
      cdsClone.FieldByName('TCAMB').AsString := dbeTCam.Text;
      cdsClone.Next;
   End;
End;

Procedure TFRetencion.bbtnCancelarClick(Sender: TObject);
Begin
   If DMCXP.cdsQry3.RecordCount = 0 Then
   Begin
      DMCXP.cdsQry3.cancel;
      bbtnRetCons.Enabled := True;
      spbNuevo.Enabled := True;
   End
   Else
   Begin
      DMCXP.cdsQry3.Cancel;
      spbAceptar.Enabled := True;
      spbOtro.Enabled := True;
   End;
End;

Procedure TFRetencion.SelecImpresDest;
Var
   xSQL, xImpdefault, xCiaid: String;
Begin
   {
   xCiaid := '02';
       // Resolviendo Tienda / Id Impresora
          wIP_Impresora := '';
          xSQL := 'Select TIE_ID, PVTA_ID '
                + '  From db2admin.fac206 t '
                + '  Where CIAID  = ' + QuotedStr(xCiaid)
                + '   And  USERID = ' + QuotedStr(DMCXP.wUsuario) ;

          DMCXP.cdsQry.Close;
          DMCXP.cdsQry.DataRequest(xSQL);
          DMCXP.cdsQry.Open;

          xTienda := DMCXP.cdsQry.FieldByName('TIE_ID').AsString;
          xPVenta := DMCXP.cdsQry.FieldByName('PVTA_ID').AsString;

       // Resolviendo Impresora de Destino(Default)
          xSQL := 'Select T.IMP_ID, T.IMP_DES, T.IMP_IP, T.IMP_RUTAID '
                + '  From db2admin.FAC_FE_IMPR t, DB2ADMIN.FAC_FE_PVTA r '
                + '  Where r.CIAID   = ' + QuotedStr(xCiaid)
                + '   And  r.TIE_ID  = ' + QuotedStr(xTienda)
                + '   And  r.PVTA_ID = ' + QuotedStr(xPVenta)
                + '   And  t.IMP_ID  = r.IMP_ID '
                + '   And  nvl(t.IMP_ACTIVO,''N'')=''S'' ' ;
          DMCXP.cdsQry.Close;
          DMCXP.cdsQry.DataRequest(xSQL);
          DMCXP.cdsQry.Open;
          xImpdefault   := DMCXP.cdsQry.FieldByName('IMP_DES').AsString;
          wIP_Impresora := DMCXP.cdsQry.FieldByName('IMP_IP').AsString;
          wId_Rutadest  := DMCXP.cdsQry.FieldByName('IMP_RUTAID').AsString;

       // Carga Todas las Impresoras de Tienda
          xSQL := 'Select R.IMP_ID, R.IMP_DES, R.IMP_IP, R.IMP_RUTAID '
                + '  From DB2ADMIN.FAC_FE_PVTA T, DB2ADMIN.FAC_FE_IMPR R  '
                + '  Where T.CIAID   = ' + QuotedStr(xCiaid)
                + '   And  T.TIE_ID  = ' + QuotedStr(xTienda)
                + '   And  R.IMP_ID  = T.IMP_ID '
                + '   And  nvl(R.IMP_ACTIVO,''N'')=''S'' ' ;
          DMCXP.cdsQry9.Close;
          DMCXP.cdsQry9.DataRequest(xSQL);
          DMCXP.cdsQry9.Open;
          DMCXP.cdsQry9.IndexFieldNames :=  'IMP_DES';
          dblcdImpDest.text := xImpdefault;

          pnlImprDest.visible := True;
   }
   wIP_Impresora := '';
   xCiaId := '02';
   xTienda := '01';
   xPVenta := '01';

// Resolviendo Impresora de Destino(Default)
   xSQL := 'Select T.IMP_ID, T.IMP_DES, T.IMP_IP, T.IMP_RUTAID '
      + '  from DB2ADMIN.FAC_FE_IMPR T, DB2ADMIN.FAC_FE_PVTA R '
      + ' where R.CIAID   = ' + QuotedStr(xCiaid)
      + '   and R.TIE_ID  = ' + QuotedStr(xTienda)
      + '   and R.PVTA_ID = ' + QuotedStr(xPVenta)
      + '   and T.IMP_ID  = R.IMP_ID '
      + '   and nvl(T.IMP_ACTIVO,''N'')=''S'' ';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   xImpdefault := DMCXP.cdsQry.FieldByName('IMP_DES').AsString;
   wIP_Impresora := DMCXP.cdsQry.FieldByName('IMP_IP').AsString;
   wId_Rutadest := DMCXP.cdsQry.FieldByName('IMP_RUTAID').AsString;
   If DMCXP.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('El usuario no tiene definida una Impresora');
      xContinuaGrab := False;
      exit;
   End;
   xContinuaGrab := True;
End;

Procedure TFRetencion.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMCXP.cdsRETENCION.close;
   DMCXP.cdsTMON.close;
   DMCXP.cdsTDOC.close;
   DMCXP.cdsCLAUX.close;
   DMCXP.cdsAUXID.close;
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry2.Close;
   Action := caFree;
End;

Procedure TFRetencion.bbtnRetConsClick(Sender: TObject);
Begin
   FRetencionEdit := TFRetencionEdit.CReate(self);
   Try
      FRetencionEdit.ShowModal;
   Finally
      FRetencionEdit.Free;
   End;
End;

Procedure TFRetencion.dbeTCamExit(Sender: TObject);
Begin
   If gbDocumento.Enabled Then
      dblClase.SetFocus;
End;

Procedure TFRetencion.bbtnImpDestClick(Sender: TObject);
Begin
   pnlImprDest.visible := False;
   GeneraTxtRetElec;

   ShowMessage('Archivo fue Enviado a Sunat');
   exit;
End;

Procedure TFRetencion.GeneraTxtRetElec;
Var
   xSQL: String;
   xfArchivoTexto: TextFile;
   xsNombreTxt, xCarpeta, xsClave, xTDocSunat: String;
Begin

   Begin
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      xSQL := ' Begin '
         + '    DB2ADMIN.SP_TXT_CNT320_RETIGV2(' + quotedstr(dbeRetSerie.text) + ','
         + quotedstr(dbeRetNumero.text) + ','
         + QuotedStr(DMCXP.wUsuario) + ','
         + QuotedStr('ACEPTADO') + ','
         + QuotedStr(wIP_Impresora) + ') '
         + ' End;';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo generar el archivo electrónico para SUNAT');
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         exit;
      End;
   End;

// Resolviendo ID de Envio
   xsClave := '02' + dbeRetSerie.text + dbeRetNumero.Text;

// Resolviendo último número de Envio
   xSQL := 'Select max(NUMENVFAC) NUMENVFAC '
      + '     from db2admin.FAC_FACT_ELEC '
      + '    where CODFACELE = ' + QuotedStr(xsClave);
   DMCXP.cdsQry4.Close;
   DMCXP.cdsQry4.DataRequest(xSQL);
   DMCXP.cdsQry4.Open;

// Resolviendo Tipo de Documento Sunat
   xSQL := 'Select TDOC_SUNAT '
      + '  From db2admin.TGE110 '
      + '  Where DOCID = ' + QuotedStr(lkcDocid.text);
   DMCXP.cdsQry6.Close;
   DMCXP.cdsQry6.DataRequest(xSQL);
   DMCXP.cdsQry6.Open;

   xTDocSunat := DMCXP.cdsQry6.FieldByName('TDOC_SUNAT').AsString;

// Resolviendo Carpeta para Archivo
   xSQL := 'Select RUTADES '
      + '  From db2admin.TGE837 '
      + '  Where APLIC = ' + QuotedStr('RET')
      + '   And RUTAID = ' + QuotedStr(wId_Rutadest);
   DMCXP.cdsQry6.Close;
   DMCXP.cdsQry6.DataRequest(xSQL);
   DMCXP.cdsQry6.Open;

   xCarpeta := DMCXP.cdsQry6.FieldByName('RUTADES').AsString;

// Seleccionando Registros para escribir en Txt
   xSQL := 'Select NUMDETLIN, DESDETLIN '
      + '  from db2admin.FAC_FACT_ELEC '
      + '  where CODFACELE  = ' + QuotedStr(xsClave)
      + '    and NUMENVFAC  = ' + inttostr(DMCXP.cdsQry4.FieldByName('NUMENVRET').AsInteger);
//      +    '     and ESTADOFAC = ' +QuotedStr('ACEPTADO');
   DMCXP.cdsQry8.Close;
   DMCXP.cdsQry8.DataRequest(xSQL);
   DMCXP.cdsQry8.Open;
   DMCXP.cdsQry8.IndexFieldNames := 'NUMDETLIN';

//      If (DMFAC.cdsQry4.recordcount = 0) then
//   Begin

//   xCarpeta := 'Y:\Pases a Produccion\Retención Electrónica\';
   xsNombreTxt := xCarpeta + 'RE_' + xTDocSunat + '_' + dbeRetSerie.text + '_' + dbeRetNumero.text + '.txt';
   AssignFile(xfArchivoTexto, xsNombreTxt);
   Rewrite(xfArchivoTexto);

   DMCXP.cdsQry8.First;
   While Not DMCXP.cdsQry8.EOF Do
   Begin
      WriteLn(xfArchivoTexto, DMCXP.cdsQry8.FieldByName('DESDETLIN').AsString);
      DMCXP.cdsQry8.Next;
   End;
   CloseFile(xfArchivoTexto);

End;

Procedure TFRetencion.Z2bbtnReImprimeClick(Sender: TObject);
Begin
{
       If MessageDlg('¿Seguro de Reenviar Comprobante?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
       Begin
          pnlImprDest.visible := True;
          SelecImpresDest;
       End;
}
//       ShellExecute(FRetencion.Handle,nil,PChar('c:\archivo.pdf'),'','',SW_SHOWNORMAL);
   ShellExecute(FRetencion.Handle, Nil, PChar('\\10.11.10.156\pdf\20136424867-01-F009-00002062.pdf'), '', '', SW_SHOWNORMAL);
       //\\10.11.10.156\pdf
End;

Procedure TFRetencion.bbtnImpDestCancClick(Sender: TObject);
Begin
   pnlImprDest.visible := False;
   ShowMessage('Archivo NO fue Enviado a Sunat');
   Exit;
End;

End.

