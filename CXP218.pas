Unit CXP218;

// Actualizaciones :
// HPC_201602_CXP  11/04/2016 DAF_2016000480_CXP_1
//                 Creación de Formulario
//                 Transfiere Cancelaciones de una Provisión a Otra


Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, Wwdbdlg, wwdblook;

Type
   TFTrasladoAmort = Class(TForm)
      pnlProvisionOrig: TPanel;
      pnlProvisionDest: TPanel;
      lblTipDocOrig: TLabel;
      lblProveedorOrig: TLabel;
      lblSerieDocOrig: TLabel;
      lblNroDocOrig: TLabel;
      lblTipDocDest: TLabel;
      lblSerieDocDest: TLabel;
      lblNroDocDest: TLabel;
      pnlCabOrig: TPanel;
      pnlCabDest: TPanel;
      lblProvisionOrig: TLabel;
      lblProvisionDest: TLabel;
      pnlTransferir: TPanel;
      bbtnTransferir: TBitBtn;
      bbtnSalir: TBitBtn;
      dblcTDocOrig: TwwDBLookupCombo;
      edtTDocOrig: TEdit;
      dblcClAuxOrig: TwwDBLookupCombo;
      dblcdProvOrig: TwwDBLookupComboDlg;
      dblcdProvRucOrig: TwwDBLookupComboDlg;
      edtProvOrig: TEdit;
      lblClAuxOrig: TLabel;
      lblRUCOrig: TLabel;
      lblRazonSocOrig: TLabel;
      bbtnDatosOrig: TBitBtn;
      edtSerieOrig: TwwDBEdit;
      edtNoDocOrig: TwwDBEdit;
      edtSerieDest: TwwDBEdit;
      edtNoDocDest: TwwDBEdit;
      Label1: TLabel;
      edtProvDest: TEdit;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      dblcClAuxDest: TwwDBLookupCombo;
      dblcdProvDest: TwwDBLookupComboDlg;
      dblcdProvRucDest: TwwDBLookupComboDlg;
      dblcTDocDest: TwwDBLookupCombo;
      edtTDocDest: TEdit;
      bbtnDatosDest: TBitBtn;
      bbtnNuevaBusqueda: TBitBtn;
      Procedure FormCreate(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure Inicializa;
      Procedure bbtnTransferirClick(Sender: TObject);
      Procedure bbtnSalirClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcTDocOrigExit(Sender: TObject);
      Procedure dblcClAuxOrigExit(Sender: TObject);
      Procedure dblcdProvOrigEnter(Sender: TObject);
      Procedure dblcdProvOrigExit(Sender: TObject);
      Procedure dblcdProvRucOrigEnter(Sender: TObject);
      Procedure dblcdProvRucOrigExit(Sender: TObject);
      Procedure edtSerieOrigExit(Sender: TObject);
      Procedure edtNoDocOrigExit(Sender: TObject);
      Procedure bbtnDatosOrigClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnNuevaBusquedaClick(Sender: TObject);
      Procedure dblcTDocDestExit(Sender: TObject);
      Procedure bbtnDatosDestClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FTrasladoAmort: TFTrasladoAmort;
   xSQL: String;
   xDatosOrig, xDatosDest, xCrea: Boolean;
   xCiaOrig, xTDiarOrig, xCPAnoMesOrig, xCPNoRegOrig : String;
   xCiaDest, xTDiarDest, xCPAnoMesDest, xCPNoRegDest : String;
   xMontoPago : currency;
   xMontoPagoMN, xMontoPagoME : currency;

Implementation

Uses CxPDM;

{$R *.dfm}

Procedure TFTrasladoAmort.FormCreate(Sender: TObject);
Begin
// Tipo de Documento
   dblcTDocOrig.LookupTable := DMCXP.cdsTDoc;
   dblcTDocOrig.LookupField := 'DOCID';
   dblcTDocOrig.DataSource := Nil;
   dblcTDocOrig.DataField := '';
   dblcTDocDest.LookupTable := DMCXP.cdsTDoc;
   dblcTDocDest.LookupField := 'DOCID';
   dblcTDocDest.DataSource := Nil;
   dblcTDocDest.DataField := '';

// Clase de Auxiliar
   dblcClAuxOrig.LookupTable := DMCXP.cdsClAux;
   dblcClAuxOrig.LookupField := 'CLAUXID';
   dblcClAuxOrig.DataSource := Nil;
   dblcClAuxOrig.DataField := '';
   dblcClAuxDest.Enabled := False;
   dblcClAuxDest.DataSource := Nil;
   dblcClAuxDest.DataField := '';

// Código de Proveedor
// Se inicia en Blanco para que el Lookuptable
// se asigne en el exit de la Clase de Auxiliar
   dblcdProvOrig.LookupTable := Nil;
   dblcdProvOrig.LookupField := 'PROV';
   dblcdProvOrig.DataSource := Nil;
   dblcdProvOrig.DataField := '';
   dblcdProvDest.Enabled := False;
   dblcdProvDest.DataSource := Nil;
   dblcdProvDest.DataField := '';

// RUC de Proveedor
   dblcdProvRucOrig.LookupTable := Nil;
   dblcdProvRucOrig.LookupField := 'PROVRUC';
   dblcdProvRucOrig.DataSource := Nil;
   dblcdProvRucOrig.DataField := '';
   dblcdProvRucDest.Enabled := False;
   dblcdProvRucDest.DataSource := Nil;
   dblcdProvRucDest.DataField := '';

// Nombre del Proveedor/Razón Social
   edtProvOrig.Enabled := False;
   edtProvDest.Enabled := False;

   xCrea := True;
End;

Procedure TFTrasladoAmort.FormShow(Sender: TObject);
Begin
   Inicializa;
End;

Procedure TFTrasladoAmort.Inicializa;
Begin
// Tipo de Documento
   dblcTDocOrig.Clear;
   edtTDocOrig.Clear;
   dblcTDocDest.Clear;
   edtTDocDest.Clear;

// Clase de Auxiliar
   dblcClAuxOrig.Clear;
   dblcClAuxDest.Clear;

// Código de Proveedor
   dblcdProvOrig.Clear;
   dblcdProvDest.Clear;

// RUC de Proveedor
   dblcdProvRucOrig.Clear;
   dblcdProvRucDest.Clear;

// Nombre del Proveedor/Razón Social
   edtProvOrig.Clear;
   edtProvDest.Clear;

// Serie
   edtSerieOrig.Clear;
   edtSerieDest.Clear;

// Número de Documento
   edtNoDocOrig.Clear;
   edtNoDocDest.Clear;

   xDatosOrig := False;
   xDatosDest := False;

// Desactiva Panel de Datos de Destino
   pnlProvisionOrig.Enabled := True;
   pnlProvisionDest.Enabled := False;

   xCrea := False;
   lblProvisionOrig.Caption := 'Provisión Original';
   lblProvisionDest.Caption := 'Provisión Destino';
   pnlProvisionDest.Enabled := False;

// Focus Inicial
   dblcTDocOrig.SetFocus;

End;

Procedure TFTrasladoAmort.bbtnTransferirClick(Sender: TObject);
var
   xWhere : String;
   xTieneOPago, xTieneCheque : Boolean;
Begin
   xTieneOPago := False;
   xTieneCheque := False;

// Busca Cancelación/Amortización de documento origen en Órdenes de Pago
   xSQL := 'Select CIAID, NUMERO, ITEM, CLAUXID, AUXID, DOCID, CPSERIE, CPNODOC, '
      +    '       TMONID, CPMTOORI, CPPAGORI, CPSALORI, IMPPAGO, IMPRETE, FREG, HREG, '
      +    '       USUARIO, ESTADO, IMPDEVO, RQCIAID, RQORIGEN, NUMDETRAC, NUMCONSTA, '
      +    '       MOD_DETR, OBSERVA, IMPOTRDTO '
      +    '  from CXP_ORD_PAG_DET '
      +    ' where CLAUXID = '+quotedstr(DMCXP.cdsQry2.FieldByName('CLAUXID').AsString)
      +    '   and AUXID ='+quotedstr(DMCXP.cdsQry2.FieldByName('PROV').AsString)
      +    '   and DOCID = '+quotedstr(DMCXP.cdsQry2.FieldByName('DOCID').AsString)
      +    '   and CPSERIE = '+quotedstr(DMCXP.cdsQry2.FieldByName('CPSERIE').AsString)
      +    '   and CPNODOC = '+quotedstr(DMCXP.cdsQry2.FieldByName('CPNODOC').AsString)
      +    '   and ESTADO<>''A'' ';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   if DMCXP.cdsQry.RecordCount>0 then
   Begin
      xTieneOPago := True;
   End
   Else
   Begin
   // Busca Cancelación/Amortización por Cheque
      xSQL := 'Select A.CIAID, A.ECANOMM, A.TDIARID, A.ECNOCOMP, '
         +    '       A.TMONID, A.DEMTOORI IMPPAGO, A.DEMTOLOC, A.DEMTOEXT, B.ECESTADO '
         +    '  from CAJA303 A, CAJA302 B '
         +    ' where A.CLAUXID = '+quotedstr(DMCXP.cdsQry2.FieldByName('CLAUXID').AsString)
         +    '   and A.PROV ='+quotedstr(DMCXP.cdsQry2.FieldByName('PROV').AsString)
         +    '   and A.DOCID2 = '+quotedstr(DMCXP.cdsQry2.FieldByName('DOCID').AsString)
         +    '   and A.CPSERIE = '+quotedstr(DMCXP.cdsQry2.FieldByName('CPSERIE').AsString)
         +    '   and A.CPNODOC = '+quotedstr(DMCXP.cdsQry2.FieldByName('CPNODOC').AsString)
         +    '   and B.CIAID=A.CIAID '
         +    '   and B.ECANOMM=A.ECANOMM '
         +    '   and B.TDIARID=A.TDIARID '
         +    '   and B.ECNOCOMP=A.ECNOCOMP '
         +    '   and B.ECESTADO=''C''  ';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      if DMCXP.cdsQry.RecordCount>0 then
      Begin
         xTieneCheque := True;
      End;
   End;

   if not xTieneOPago then
   Begin
      if not xTieneCheque then
      Begin
         ShowMessage('Documento no tiene cancelaciones en Órdenes de Pago ni Cheques');
         exit;
      End;
   End;

   xMontoPagoMN := 0;
   xMontoPagoME := 0;
   if DMCXP.cdsQry.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
      xMontoPagoMN := DMCXP.cdsQry.FieldByName('IMPPAGO').AsFloat
   else
      xMontoPagoME := DMCXP.cdsQry.FieldByName('IMPPAGO').AsFloat;

   If MessageDlg('¿Desea realizar la transferencia de Cancelaciones?  ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin

      DMCXP.DCOM1.AppServer.IniciaTransaccion;

   // Retorna cancelaciones a las factura
      xSQL := 'Update CXP301 '
         +    '   Set CPESTADO = ''P'', '
         +    '       CPPAGORI = 0, CPPAGLOC = 0, CPPAGEXT = 0, '
         +    '       CPSALORI = CPMTOORI, CPSALLOC = CPMTOLOC, CPSALEXT = CPMTOEXT '
         +    ' where CIAID = '+quotedstr(xCiaOrig)
         +    '   and TDIARID = '+quotedstr(xTDiarOrig)
         +    '   and CPANOMES = '+quotedstr(xCPAnoMesOrig)
         +    '   and CPNOREG = '+quotedstr(xCPNoRegOrig);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede actualizar la Provisión de Origen');
         exit;
      End;

   // Asigna cancelaciones de las facturas
      xSQL := 'Update CXP301 '
         +    '   Set CPESTADO = ''P'', '
         +    '       CPPAGORI = (case when TMONID=''N'' then '+floattostr(xMontoPagoMN)+' else '+floattostr(xMontoPagoME)+' end), '
         +    '       CPPAGLOC = (case when TMONID=''N'' then '+floattostr(xMontoPagoMN)+' else round('+floattostr(xMontoPagoME)+'*CPTCAMAJ,2) end), '
         +    '       CPPAGEXT = (case when TMONID=''D'' then '+floattostr(xMontoPagoME)+' else round('+floattostr(xMontoPagoMN)+'/CPTCAMAJ,2) end), '
         +    '       CPSALORI = CPMTOORI - '+floattostr(xMontoPago)+', '
         +    '       CPSALLOC = CPMTOLOC - (case when TMONID=''N'' then '+floattostr(xMontoPagoMN)+' else round('+floattostr(xMontoPagoME)+'*CPTCAMAJ,2) end), '
         +    '       CPSALEXT = CPMTOEXT - (case when TMONID=''D'' then '+floattostr(xMontoPagoME)+' else round('+floattostr(xMontoPagoMN)+'/CPTCAMAJ,2) end) '
         +    ' where CIAID = '+quotedstr(xCiaDest)
         +    '   and TDIARID = '+quotedstr(xTDiarDest)
         +    '   and CPANOMES = '+quotedstr(xCPAnoMesDest)
         +    '   and CPNOREG = '+quotedstr(xCPNoRegDest);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede actualizar la Provisión de Destino');
         exit;
      End;

      if xTieneOPago then
      Begin
      // Actualiza Detalle de Órdenes de Pago
         xSQL := 'Update CXP_ORD_PAG_DET '
            +    '   Set DOCID   = '+quotedstr(dblcTDocDest.Text)+','
            +    '       CPSERIE = '+quotedstr(edtSerieDest.Text)+','
            +    '       CPNODOC = '+quotedstr(edtNoDocDest.Text)
            +    ' where CIAID='+quotedstr(DMCXP.cdsQry.FieldByName('CIAID').AsString)
            +    '   and NUMERO='+quotedstr(DMCXP.cdsQry.FieldByName('NUMERO').AsString)
            +    '   and CLAUXID = '+quotedstr(DMCXP.cdsQry2.FieldByName('CLAUXID').AsString)
            +    '   and AUXID ='+quotedstr(DMCXP.cdsQry2.FieldByName('PROV').AsString)
            +    '   and DOCID = '+quotedstr(DMCXP.cdsQry2.FieldByName('DOCID').AsString)
            +    '   and CPSERIE = '+quotedstr(DMCXP.cdsQry2.FieldByName('CPSERIE').AsString)
            +    '   and CPNODOC = '+quotedstr(DMCXP.cdsQry2.FieldByName('CPNODOC').AsString);
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se puede actualizar la Orden de Pago');
            exit;
         End;
      End
      Else // Cheques
      Begin
      // Actualiza Detalle de Pago con Cheque
         xSQL := 'Update CAJA303 '
            +    '   Set DOCID2   = '+quotedstr(dblcTDocDest.Text)+','
            +    '       CPSERIE = '+quotedstr(edtSerieDest.Text)+','
            +    '       CPNODOC = '+quotedstr(edtNoDocDest.Text)
            +    ' where CLAUXID = '+quotedstr(DMCXP.cdsQry2.FieldByName('CLAUXID').AsString)
            +    '   and PROV ='+quotedstr(DMCXP.cdsQry2.FieldByName('PROV').AsString)
            +    '   and DOCID2 = '+quotedstr(DMCXP.cdsQry2.FieldByName('DOCID').AsString)
            +    '   and CPSERIE = '+quotedstr(DMCXP.cdsQry2.FieldByName('CPSERIE').AsString)
            +    '   and CPNODOC = '+quotedstr(DMCXP.cdsQry2.FieldByName('CPNODOC').AsString)
            +    '   and CIAID = '+quotedstr(DMCXP.cdsQry.FieldByName('CIAID').AsString)
            +    '   and ECANOMM = '+quotedstr(DMCXP.cdsQry.FieldByName('ECANOMM').AsString)
            +    '   and TDIARID = '+quotedstr(DMCXP.cdsQry.FieldByName('TDIARID').AsString)
            +    '   and ECNOCOMP = '+quotedstr(DMCXP.cdsQry.FieldByName('ECNOCOMP').AsString);
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se puede actualizar la Orden de Pago');
            exit;
         End;
      End;

   // Busca contabilizaciones de la Orden de Pago
      if xTieneOPago then
         xWhere := 'where TDIARID=''53'' '
            +      '  and CNTANOMM='+quotedstr(xCPAnoMesOrig)
            +      '  and CNTLOTE='+quotedstr(copy(DMCXP.cdsQry.FieldByName('NUMERO').AsString,3,4))
            +      '  and DOCID='+quotedstr(dblcTDocOrig.Text)
            +      '  and CNTSERIE='+quotedstr(edtSerieOrig.Text)
            +      '  and CNTNODOC='+quotedstr(edtNoDocOrig.Text)
      else
         xWhere := 'where CLAUXID='+quotedstr(dblcClAuxOrig.Text)
            +      '  and AUXID='+quotedstr(dblcdProvOrig.Text)
            +      '  and DOCID='+quotedstr(dblcTDocOrig.Text)
            +      '  and CNTSERIE='+quotedstr(edtSerieOrig.Text)
            +      '  and CNTNODOC='+quotedstr(edtNoDocOrig.Text);

      xSQL := 'Select CUENTAID '
         +    '  from CNT301 '
         +    xwhere;
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      If DMCXP.cdsQry.RecordCount>0 then
      Begin
         xSQL := 'Update CNT301 '
            +    '   Set DOCID='+quotedstr(dblcTDocOrig.Text)+','
            +    '       CNTSERIE='+quotedstr(edtSerieOrig.Text)+','
            +    '       CNTNODOC='+quotedstr(edtNoDocOrig.Text)
            +    xwhere;
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se pudo actualizar los asientos contables');
            exit;
         End;
      End;

      xSQL := 'Select CUENTAID '
         +    '  from CNT311 '
         +    xwhere;
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      If DMCXP.cdsQry.RecordCount>0 then
      Begin
         xSQL := 'Update CNT311 '
            +    '   Set DOCID='+quotedstr(dblcTDocOrig.Text)+','
            +    '       CNTSERIE='+quotedstr(edtSerieOrig.Text)+','
            +    '       CNTNODOC='+quotedstr(edtNoDocOrig.Text)
            +    xwhere;
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se pudo actualizar los asientos contables');
            exit;
         End;
      End;
   //
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
      ShowMessage('Transferencia de cancelaciones y/o amortizaciones realizada con éxito');
   End;
End;

Procedure TFTrasladoAmort.bbtnSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFTrasladoAmort.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   Action := caFree;
End;

Procedure TFTrasladoAmort.dblcTDocOrigExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If bbtnSalir.Focused Then Exit;

   xWhere := 'DOCID=' + quotedstr(dblcTDocOrig.Text)
      + ' and DOC_FREG=''P'' '
      + ' and DOCMOD=''CXP'' ';
   edtTDocOrig.Text := BuscaQry('PrvTGE', 'TGE110', '*', xWhere, 'DocDes');

   If length(edtTDocOrig.Text) = 0 Then
   Begin
      ShowMessage('Código de Documento Origen no encontrado, reintente');
      dblcTDocOrig.SetFocus;
      exit;
   End;

   dblcClAuxOrig.SetFocus;
End;

Procedure TFTrasladoAmort.dblcClAuxOrigExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If bbtnSalir.Focused Then Exit;
   If dblcTDocOrig.Focused Then Exit;

   xWhere := 'CLAUXID=''' + dblcClAuxOrig.Text + ''' and MODULO LIKE ''%' + DMCXP.wModulo + '%''';
   If length(BuscaQry('dspTGE', 'TGE102', 'CLAUXDES', xWhere, 'CLAUXDES')) = 0 Then
   Begin
      ShowMessage('Clase de Auxiliar no encontrada');
      dblcClAuxOrig.SetFocus;
      Exit;
   End;

   xWhere := 'Select CLAUXID, PROV, PROVRUC, PROVDES, PROVABR, PROVNOMCOM, PROVRETIGV, PAISID, PROVDIR, '
      + '       PROVCZIP, PROVTELF, PROVFAX, PROVEMAI, CONVDOBTRI '
      + '  from TGE201 '
      + ' where CLAUXID = ' + quotedstr(dblcClAuxOrig.Text)
      + '   and NVL(ACTIVO,''N'')=''S'' ';
   Filtracds(DMCXP.cdsProv, xWhere);

   dblcdProvOrig.LookupTable := DMCXP.cdsProv;
   dblcdProvOrig.LookupField := 'PROV';

   If Length(dblcdProvOrig.Text) > 0 Then
   Begin
      xWhere := 'CLAUXID=''' + dblcClAuxOrig.Text + ''' AND PROV=''' + dblcdProvOrig.Text + ''' and NVL(ACTIVO,''N'')=''S''';
      If length(BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES', xWhere, 'ProvDES')) = 0 Then
      Begin
         edtProvOrig.Text := '';
         dblcdProvOrig.SetFocus;
      End
      Else
      Begin
         edtProvOrig.Text := DMCXP.cdsQry.FieldByname('PROVDES').AsString;
      End;
   End
   Else
   Begin
      dblcdProvOrig.SetFocus;
   End;
   Screen.Cursor := crDefault;
End;

Procedure TFTrasladoAmort.dblcdProvOrigEnter(Sender: TObject);
Begin
   If DMCXP.cdsProv.IndexFieldNames <> 'PROVDES' Then
      DMCXP.cdsProv.IndexFieldNames := 'PROVDES';
End;

Procedure TFTrasladoAmort.dblcdProvOrigExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If bbtnSalir.Focused Then Exit;
   If dblcTDocOrig.Focused Then Exit;
   If dblcClAuxOrig.Focused Then Exit;

   If length(dblcClAuxOrig.Text) = 0 Then
   Begin
      ShowMessage('Falta Ingresar Clase de Auxiliar');
      dblcClAuxOrig.SetFocus;
      Exit;
   End;

   If (length(dblcdProvOrig.Text) = 0) And (dblcdProvRucOrig.Focused) Then
      exit;

   If (length(dblcdProvOrig.Text) = 0) And (length(dblcdProvRucOrig.Text) = 0) Then
   Begin
      ShowMessage('Indique un Código o RUC del Proveedor');
      dblcdProvOrig.SetFocus;
      exit;
   End;

   xWhere := 'CLAUXID=' + quotedstr(dblcClAuxOrig.Text)
      + ' and PROV=' + quotedstr(dblcdProvOrig.Text);
   edtProvOrig.Text := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV, ACTIVO, ESDOMIC', xWhere, 'PROVDES');

   If length(edtProvOrig.Text) = 0 Then
   Begin
      ShowMessage('Proveedor NO se encuentra en el Maestro de Proveedores');
      dblcdProvOrig.SetFocus;
      exit;
   End;

   If DMCXP.cdsQry.FieldByName('ACTIVO').AsString = 'N' Then
   Begin
      ShowMessage('Proveedor NO se encuentra ACTIVO');
      dblcdProvOrig.SetFocus;
      exit;
   End;
   dblcdProvRucOrig.Text := DMCXP.cdsQry.FieldByName('PROVRUC').AsString;
   edtSerieOrig.SetFocus;
End;

Procedure TFTrasladoAmort.dblcdProvRucOrigEnter(Sender: TObject);
Begin
   If DMCXP.cdsProv.IndexFieldNames <> 'PROVDES' Then
      DMCXP.cdsProv.IndexFieldNames := 'PROVDES';
End;

Procedure TFTrasladoAmort.dblcdProvRucOrigExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If bbtnSalir.Focused Then Exit;
   If dblcTDocOrig.Focused Then Exit;
   If dblcClAuxOrig.Focused Then Exit;

   If length(dblcClAuxOrig.Text) = 0 Then
   Begin
      ShowMessage('Falta Ingresar Clase de Auxiliar');
      dblcClAuxOrig.SetFocus;
      Exit;
   End;

   If (length(dblcdProvRucOrig.Text) = 0) And (dblcdProvOrig.Focused) Then
      exit;

   If (length(dblcdProvOrig.Text) = 0) And (length(dblcdProvRucOrig.Text) = 0) Then
   Begin
      ShowMessage('Indique un Código o RUC del Proveedor');
      dblcdProvRucOrig.SetFocus;
      exit;
   End;

   xWhere := 'CLAUXID=' + quotedstr(dblcClAuxOrig.Text)
      + ' and PROVRUC=' + quotedstr(dblcdProvRucOrig.Text);
   edtProvOrig.Text := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV, ACTIVO, ESDOMIC', xWhere, 'PROVDES');

   If length(edtProvOrig.Text) = 0 Then
   Begin
      ShowMessage('Proveedor NO se encuentra en el Maestro de Proveedores');
      dblcdProvRucOrig.SetFocus;
      exit;
   End;

   If DMCXP.cdsQry.FieldByName('ACTIVO').AsString = 'N' Then
   Begin
      ShowMessage('Proveedor NO se encuentra ACTIVO');
      dblcdProvRucOrig.SetFocus;
      exit;
   End;
   dblcdProvOrig.Text := DMCXP.cdsQry.FieldByName('PROV').AsString;
   edtSerieOrig.SetFocus;
End;

Procedure TFTrasladoAmort.edtSerieOrigExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtnSalir.Focused Then Exit;
   If dblcTDocOrig.Focused Then Exit;
   If dblcClAuxOrig.Focused Then Exit;
   If dblcdProvOrig.Focused Then Exit;
   If dblcdProvRucOrig.Focused Then Exit;

   If length(trim(edtSerieOrig.Text)) = 0 Then
   Begin
      ShowMessage('El Número de Serie no puede estar vacío');
      edtSerieOrig.SetFocus;
      exit;
   End;
End;

Procedure TFTrasladoAmort.edtNoDocOrigExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtnSalir.Focused Then Exit;
   If dblcTDocOrig.Focused Then Exit;
   If dblcClAuxOrig.Focused Then Exit;
   If dblcdProvOrig.Focused Then Exit;
   If dblcdProvRucOrig.Focused Then Exit;
   If edtSerieOrig.Focused Then Exit;

   If length(trim(edtNoDocOrig.Text)) = 0 Then
   Begin
      ShowMessage('El Número de Documento no puede estar vacío');
      edtNoDocOrig.SetFocus;
      exit;
   End;
End;

Procedure TFTrasladoAmort.bbtnDatosOrigClick(Sender: TObject);
Begin
   xSQL := 'Select CIAID, CPANOMES, TDIARID, CPNOREG, CLAUXID, PROV, PROVRUC, DOCID, '
      + '       CPSERIE, CPNODOC, CPFRECEP, CPFEMIS, CPFVCMTO, TMONID, CPTCAMPR, '
      + '       CPTCAMPA, CPESTADO, CPOCOMP, CP_CONTA, CPGRAVAD, CPNOGRAV, CPIGV, '
      + '       CPISC, CPDCTO, CPSERVIC, CPMTOORI, CPMTOLOC, CPMTOEXT, CPPAGORI, '
      + '       CPPAGLOC, CPPAGEXT, CPSALORI, CPSALLOC, CPSALEXT, TCANJEID, CPCANJE, '
      + '       CPFCANJE, CPUSER, CPFREG, CPHREG, CPAAAA, CPMM, CPDD, CPTRI, CPSEM, '
      + '       CPSS, CPAATRI, CPAASEM, CPAASS, CPFCMPRB, DCPLOTE, DCPCOMP, CTATOTAL, '
      + '       FLAGVAR, CPTOTOT, CPIGV2, CPGRAVAD2, CPHMOD, FLAGVAR2, PROVDES, CLAUXREND, '
      + '       AUXIDREND, CCBCOID, BANCOID, SITUAID, CPFLAGTDOC, CXPRRHH, AUXIDINTER, '
      + '       CLAUXINTER, CPTCAMDOL, PROVRETIGV, CPTCAMAJ, DTRPORC, CPMTOORIB, DTRFLAG, '
      + '       FECDEPDET, NUMDEPDET, ADQ_NO_GRAV, IGV_GRA_NO_DEST, CP_OTROS, CPTODETRSUNATID,'
      + '       TIPOOPERSUNATID, PORCDESC, CP4TAPENSION, SNPAFPID, TIPCOMAFPID '
      + '  from CXP301 '
      + ' where DOCID=' + quotedstr(dblcTDocOrig.Text)
      + '   and CLAUXID=' + quotedstr(dblcClAuxOrig.Text)
      + '   and PROV=' + quotedstr(dblcdProvOrig.Text)
      + '   and CPSERIE=' + quotedstr(edtSerieOrig.Text)
      + '   and CPNODOC=' + quotedstr(edtNoDocOrig.Text)
      + '   and CPESTADO in (''P'',''C'') ';
   DMCXP.cdsQry2.Close;
   DMCXP.cdsQry2.DataRequest(xSQL);
   DMCXP.cdsQry2.Open;

   If DMCXP.cdsQry2.RecordCount = 0 Then
   Begin
      ShowMessage('Documento Origen no encontrado');
      exit;
   End;

   If DMCXP.cdsQry2.RecordCount > 1 Then
   Begin
      ShowMessage('Documento del Proveedor encontrado 2 veces');
      exit;
   End;

   If (DMCXP.cdsQry2.FieldByName('CPESTADO').AsString <> 'C') And
      (DMCXP.cdsQry2.FieldByName('CPESTADO').AsString <> 'P') Then
   Begin
      ShowMessage('Documento del Proveedor no tiene la situación correcta para generar Traslado de Pago');
      exit;
   End;

   If DMCXP.MesCerrado(copy(DMCXP.cdsQry2.FieldByName('CPANOMES').AsString, 5, 2),
      copy(DMCXP.cdsQry2.FieldByName('CPANOMES').AsString, 1, 4),
      DMCXP.cdsQry2.FieldByName('CIAID').AsString) Then
   Begin
      ShowMessage(' Mes Cerrado!!!, No se puede transferir registro');
      exit;
   End;

   ShowMessage('Documento encontrado' + chr(13)
      + 'Puede realizar una nueva búsqueda con el Botón <<Nueva Búsqueda>>');

   xCiaOrig := DMCXP.cdsQry2.FieldByName('CIAID').AsString;
   xTDiarOrig := DMCXP.cdsQry2.FieldByName('TDIARID').AsString;
   xCPAnoMesOrig := DMCXP.cdsQry2.FieldByName('CPANOMES').AsString;
   xCPNoRegOrig := DMCXP.cdsQry2.FieldByName('CPNOREG').AsString;

   lblProvisionOrig.Caption := 'Provisión Original -->'
      + ' Compañía:' + DMCXP.cdsQry2.FieldByName('CIAID').AsString
      + ' T.Diario:' + DMCXP.cdsQry2.FieldByName('TDIARID').AsString
      + ' Año+Mes:' + DMCXP.cdsQry2.FieldByName('CPANOMES').AsString
      + ' Nro.Reg:' + DMCXP.cdsQry2.FieldByName('CPNOREG').AsString;
   pnlProvisionOrig.Enabled := False;
   pnlProvisionDest.Enabled := True;
End;

Procedure TFTrasladoAmort.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFTrasladoAmort.bbtnNuevaBusquedaClick(Sender: TObject);
Begin
   Inicializa;
End;

Procedure TFTrasladoAmort.dblcTDocDestExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If bbtnSalir.Focused Then Exit;
   If bbtnNuevaBusqueda.Focused Then Exit;

   xWhere := 'DOCID=' + quotedstr(dblcTDocDest.Text)
      + ' and DOC_FREG=''P'' '
      + ' and DOCMOD=''CXP'' ';
   edtTDocDest.Text := BuscaQry('PrvTGE', 'TGE110', '*', xWhere, 'DocDes');

   If length(edtTDocDest.Text) = 0 Then
   Begin
      ShowMessage('Código de Documento Destino no encontrado, reintente');
      dblcTDocDest.SetFocus;
      exit;
   End;

   dblcClAuxDest.Text := dblcClAuxOrig.Text;
   dblcdProvDest.Text := dblcdProvOrig.Text;
   dblcdProvRucDest.Text := dblcdProvRucOrig.Text;
   edtProvDest.Text := edtProvOrig.Text;

   edtSerieDest.SetFocus;
End;

Procedure TFTrasladoAmort.bbtnDatosDestClick(Sender: TObject);
Begin
   xSQL := 'Select CIAID, CPANOMES, TDIARID, CPNOREG, CLAUXID, PROV, PROVRUC, DOCID, '
      + '       CPSERIE, CPNODOC, CPFRECEP, CPFEMIS, CPFVCMTO, TMONID, CPTCAMPR, '
      + '       CPTCAMPA, CPESTADO, CPOCOMP, CP_CONTA, CPGRAVAD, CPNOGRAV, CPIGV, '
      + '       CPISC, CPDCTO, CPSERVIC, CPMTOORI, CPMTOLOC, CPMTOEXT, CPPAGORI, '
      + '       CPPAGLOC, CPPAGEXT, CPSALORI, CPSALLOC, CPSALEXT, TCANJEID, CPCANJE, '
      + '       CPFCANJE, CPUSER, CPFREG, CPHREG, CPAAAA, CPMM, CPDD, CPTRI, CPSEM, '
      + '       CPSS, CPAATRI, CPAASEM, CPAASS, CPFCMPRB, DCPLOTE, DCPCOMP, CTATOTAL, '
      + '       FLAGVAR, CPTOTOT, CPIGV2, CPGRAVAD2, CPHMOD, FLAGVAR2, PROVDES, CLAUXREND, '
      + '       AUXIDREND, CCBCOID, BANCOID, SITUAID, CPFLAGTDOC, CXPRRHH, AUXIDINTER, '
      + '       CLAUXINTER, CPTCAMDOL, PROVRETIGV, CPTCAMAJ, DTRPORC, CPMTOORIB, DTRFLAG, '
      + '       FECDEPDET, NUMDEPDET, ADQ_NO_GRAV, IGV_GRA_NO_DEST, CP_OTROS, CPTODETRSUNATID,'
      + '       TIPOOPERSUNATID, PORCDESC, CP4TAPENSION, SNPAFPID, TIPCOMAFPID '
      + '  from CXP301 '
      + ' where DOCID=' + quotedstr(dblcTDocDest.Text)
      + '   and CLAUXID=' + quotedstr(dblcClAuxDest.Text)
      + '   and PROV=' + quotedstr(dblcdProvDest.Text)
      + '   and CPSERIE=' + quotedstr(edtSerieDest.Text)
      + '   and CPNODOC=' + quotedstr(edtNoDocDest.Text)
      + '   and CPESTADO in (''P'',''C'') ';
   DMCXP.cdsQry3.Close;
   DMCXP.cdsQry3.DataRequest(xSQL);
   DMCXP.cdsQry3.Open;

   If DMCXP.cdsQry3.RecordCount = 0 Then
   Begin
      ShowMessage('Documento Destino no encontrado');
      exit;
   End;

   If DMCXP.cdsQry3.RecordCount > 1 Then
   Begin
      ShowMessage('Documento del Proveedor encontrado 2 veces');
      exit;
   End;

   If (DMCXP.cdsQry3.FieldByName('CPESTADO').AsString <> 'C') And
      (DMCXP.cdsQry3.FieldByName('CPESTADO').AsString <> 'P') Then
   Begin
      ShowMessage('Documento del Proveedor no tiene la situación correcta para generar Traslado de Pago');
      exit;
   End;

   If DMCXP.MesCerrado(copy(DMCXP.cdsQry3.FieldByName('CPANOMES').AsString, 5, 2),
      copy(DMCXP.cdsQry3.FieldByName('CPANOMES').AsString, 1, 4),
      DMCXP.cdsQry3.FieldByName('CIAID').AsString) Then
   Begin
      ShowMessage(' Mes Cerrado!!!, No se puede transferir registro');
      exit;
   End;

   ShowMessage('Documento encontrado' + chr(13)
      + 'Puede realizar una nueva búsqueda con el Botón <<Nueva Búsqueda>>');

   xCiaDest := DMCXP.cdsQry3.FieldByName('CIAID').AsString;
   xTDiarDest := DMCXP.cdsQry3.FieldByName('TDIARID').AsString;
   xCPAnoMesDest := DMCXP.cdsQry3.FieldByName('CPANOMES').AsString;
   xCPNoRegDest := DMCXP.cdsQry3.FieldByName('CPNOREG').AsString;

   lblProvisionDest.Caption := 'Provisión Original -->'
      + ' Compañía:' + DMCXP.cdsQry3.FieldByName('CIAID').AsString
      + ' T.Diario:' + DMCXP.cdsQry3.FieldByName('TDIARID').AsString
      + ' Año+Mes:' + DMCXP.cdsQry3.FieldByName('CPANOMES').AsString
      + ' Nro.Reg:' + DMCXP.cdsQry3.FieldByName('CPNOREG').AsString;
   pnlProvisionOrig.Enabled := False;
   pnlProvisionDest.Enabled := False;
   pnlProvisionDest.Enabled := True;
   bbtnTransferir.SetFocus;
End;

End.

