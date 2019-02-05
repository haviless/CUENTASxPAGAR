Unit CXP265;

// Actualizaciones
// HPC_201604_CXP  09/09/2016  Creación de formulario
//                             DAF_2016000198_CXP_1 cambio de mantenimiento de datos de Transferencia Interbancaria (CXP265)
//                                                  Añade datos e importe adicional por Transferencia Interbancaria
// HPC_201701_CXP  Añade Comisión, Proveedor y Cuenta
//

Interface

Uses
// Inicio HPC_201701_CXP
// Añade Unidad de Combo Dialogo
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Wwdbdlg, StdCtrls, wwdblook, Buttons, ExtCtrls, Mask, wwdbedit,
   wwIDlg;
// Fin HPC_201701_CXP

Type
   TFOPagoTransfInterb = Class(TForm)
      pnlConstancia: TPanel;
      Label9: TLabel;
      bbtnActDatosTrans: TBitBtn;
      bbtnCierraDatos: TBitBtn;
      gbProveedor: TGroupBox;
      lblClaseAux: TLabel;
      dblcClAux: TwwDBLookupCombo;
      dblcdProv: TwwDBLookupComboDlg;
      edtProv: TEdit;
      lblProvId: TLabel;
      lblRazSocial: TLabel;
      gbBcoTransf: TGroupBox;
      lblBanco: TLabel;
      edtBanco: TEdit;
      lblCtaCte: TLabel;
      lblTMoneda: TLabel;
      dblcTMon: TwwDBLookupCombo;
      edtTMon: TEdit;
      gbDatosComision: TGroupBox;
      lblCtaCnt: TLabel;
      lblCCosto: TLabel;
      lblImporteComision: TLabel;
      edtCtaCnt: TEdit;
      edtCCosto: TEdit;
      dbeImporteComis: TwwDBEdit;
      dblcdCtaCnt: TwwDBLookupComboDlg;
      dblcdCCosto: TwwDBLookupComboDlg;
      dbeCtaCte: TwwDBEdit;
      dblcBanco: TwwDBLookupCombo;
      Procedure bbtnActDatosTransClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcClAuxExit(Sender: TObject);
      Procedure dblcdProvExit(Sender: TObject);
      Procedure dblcBancoExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnCierraDatosClick(Sender: TObject);
      Procedure dblcdCtaCntExit(Sender: TObject);
      Procedure dblcdCCostoExit(Sender: TObject);
   // Inicio HPC_201701_CXP
      Procedure dbeImporteComisExit(Sender: TObject);
      Procedure dblcdProvCloseDialog(Dialog: TwwLookupDlg);
      Procedure dblcdCtaCntCloseDialog(Dialog: TwwLookupDlg);
      Procedure dblcdCCostoCloseDialog(Dialog: TwwLookupDlg);
   // Fin HPC_201701_CXP
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FOPagoTransfInterb: TFOPagoTransfInterb;
   xSQL: String;

Implementation

{$R *.dfm}

Uses CXPDM, CXP264;

Procedure TFOPagoTransfInterb.bbtnActDatosTransClick(
   Sender: TObject);
Var
   xSQL: String;
   xImporteMN, xImporteME, xImporteMO: Currency;
Begin
// Verifica Clase de Auxiliar
   If dblcClAux.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar la Clase Auxiliar');
      dblcClAux.SetFocus;
      Exit;
   End;

// Verifica Código de Proveedor
   If dblcdProv.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar el código de Proveedor');
      dblcdProv.SetFocus;
      Exit;
   End;

// Verifica Código de Banco
   If dblcBanco.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar el Banco que se va a realizar la Transferencia');
      dblcBanco.SetFocus;
      Exit;
   End;

// Verifica Cuenta corriente Interbancaria del Proveedor
   If dbeCtaCte.Text = '' Then
   Begin
      ShowMessage('No tiene Cuenta Corriente Interbancaria');
      dbeCtaCte.SetFocus;
      Exit;
   End;

   If DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'I' Then
   Begin
      xImporteMO := strtofloat(dbeImporteComis.Text);
      If dblcTMon.Text = 'N' Then
      Begin
         xImporteMN := strtofloat(dbeImporteComis.Text);
         xImporteME := FRound(strtofloat(dbeImporteComis.Text)/strtofloat(FOrdenPagoCab.xTCambio), 15, 2);
      End
      Else
      Begin
         xImporteME := strtofloat(dbeImporteComis.Text);
         xImporteMN := FRound(strtofloat(dbeImporteComis.Text)*strtofloat(FOrdenPagoCab.xTCambio), 15, 2);
      End;

      xSQL := ' Select CIAID, NUMERO, CLAUXID, PROV, BANCOID, CCBCOID, '
         + '           USUREG, FECREG, USUMOD, FECMOD, CPFREG, '
         + '           CUENTAID, CCOSID, TMONID, CPMTOORI, CPMTOLOC, CPMTOEXT '
         + '   from CXP_ORD_PAG_TINT '
         + '  where CIAID=' + quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
         + '    and NUMERO=' + quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      If DMCXP.cdsQry.RecordCount = 0 Then
      Begin
         xSQL := 'Insert into CXP_ORD_PAG_TINT(CIAID, NUMERO, CLAUXID, PROV, BANCOID, CCBCOID, '
            + '                             USUREG, FECREG, USUMOD, FECMOD, CPFREG, '
            + '                             CUENTAID, CCOSID, TMONID, CPMTOORI, CPMTOLOC, CPMTOEXT) '
            + 'values(' + quotedstr(FOrdenPagoCab.dblcCia.Text) + ', ' // CIAID
            + quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString) + ', ' // NUMERO
            + quotedstr(FOPagoTransfInterb.dblcClAux.Text) + ', ' // CLAUXID
            + quotedstr(FOPagoTransfInterb.dblcdProv.Text) + ', ' // PROV
            + quotedstr(FOPagoTransfInterb.dblcBanco.Text) + ', ' // BANCOID
            + quotedstr(FOPagoTransfInterb.dbeCtaCte.Text) + ', ' // CODBCOCCI
            + quotedstr(DMCXP.wUsuario) + ', ' // USUREG
            + '         sysdate, ' // FECFREG
            + quotedstr(DMCXP.wUsuario) + ', ' // USUMOD
            + '         sysdate, ' // FECMOD
            + '         trunc(sysdate), ' // CPFREG
            + quotedstr(FOPagoTransfInterb.dblcdCtaCnt.Text) + ', ' // CUENTAID
            + quotedstr(FOPagoTransfInterb.dblcdCCosto.Text) + ', ' // CCOSID
            + quotedstr(FOPagoTransfInterb.dblcTMon.Text) + ', ' // TMONID
            + floattostr(xImporteMO) + ', ' // Importe Moneda Original
            + floattostr(xImporteMN) + ', ' // Importe Moneda Local
            + floattostr(xImporteME) + ' ' // Importe Moneda Extranjera
            + ') ';
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      End
      Else
      Begin
         xSQL := 'Update CXP_ORD_PAG_TINT '
            + '      set CLAUXID=' + quotedstr(FOPagoTransfInterb.dblcClAux.Text) + ', '
            + '          PROV=' + quotedstr(FOPagoTransfInterb.dblcdProv.Text) + ', '
            + '          BANCOID=' + quotedstr(FOPagoTransfInterb.dblcBanco.Text) + ', '
            + '          CCBCOID=' + quotedstr(FOPagoTransfInterb.dbeCtaCte.Text) + ', '
            + '          USUMOD=' + quotedstr(DMCXP.wUsuario) + ', '
            + '          FECMOD=SYSDATE, '
            + '          CPFREG= TRUNC(SYSDATE), '
            + '          CUENTAID=' + quotedstr(FOPagoTransfInterb.dblcdCtaCnt.Text) + ', '
            + '          CCOSID=' + quotedstr(FOPagoTransfInterb.dblcdCCosto.Text) + ', '
            + '          TMONID=' + quotedstr(FOPagoTransfInterb.dblcTMon.Text) + ', '
            + '          CPMTOORI=' + floattostr(xImporteMO) + ', '
            + '          CPMTOLOC=' + floattostr(xImporteMN) + ', '
            + '          CPMTOEXT=' + floattostr(xImporteME) + ' '
            + '    where CIAID=' + quotedstr(DMCXP.cdsOPago.fieldByname('CIAID').AsString)
            + '      and NUMERO=' + quotedstr(DMCXP.cdsOPago.fieldByname('NUMERO').AsString);
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
   End;
   Close;
End;

Procedure TFOPagoTransfInterb.FormShow(Sender: TObject);
Begin
   xSQL := 'Select CCI.CIAID, CCI.NUMERO, CCI.CLAUXID, CCI.PROV, CCI.BANCOID, CCI.CCBCOID, '
      + '          CCI.USUREG, CCI.FECREG, CCI.USUMOD, CCI.FECMOD, CCI.CPFREG, PROVEEDORES.PROVDES, '
      + '          BANCOS.BANCONOM, '
      + '          CCI.CUENTAID, CTAS.CTADES, CCI.CCOSID, CCOSTOS.CCOSDES, CCI.TMONID, MONEDAS.TMONABR, '
      + '          CCI.CPMTOORI, CCI.CPMTOLOC, CCI.CPMTOEXT '
      + '     From CXP_ORD_PAG_TINT CCI, TGE201 PROVEEDORES, TGE105 BANCOS, TGE103 MONEDAS, TGE203 CCOSTOS, TGE202 CTAS '
      + '    Where CCI.CIAID=' + quotedstr(FOrdenPagoCab.dblcCia.Text)
      + '      and CCI.NUMERO =' + quotedstr(FOrdenPagoCab.dbeNumero.Text)
      + '      and PROVEEDORES.CLAUXID(+) = CCI.CLAUXID and PROVEEDORES.PROV(+) = CCI.PROV '
      + '      and BANCOS.BANCOID(+) = CCI.BANCOID '
      + '      and MONEDAS.TMONID(+) = CCI.TMONID '
      + '      and CCOSTOS.CCOSID(+) = CCI.CCOSID '
      + '      and CTAS.CIAID(+)=CCI.CIAID and CTAS.CUENTAID(+)=CCI.CUENTAID';
// Inicio HPC_201701_CXP
   DMCXP.cdsQry1.Close;
   DMCXP.cdsQry1.DataRequest(xSQL);
   DMCXP.cdsQry1.Open;
   If DMCXP.cdsQry1.RecordCount > 0 Then
   begin
   // Clase de Auxiliar
      dblcClAux.DataSource := Nil;
      dblcClAux.DataField := '';
      dblcClAux.Text := Trim(DMCXP.cdsQry1.fieldByname('CLAUXID').AsString);

   // Código de Proveedor
      dblcdProv.DataSource := Nil;
      dblcdProv.DataField := '';
      dblcdProv.Text := Trim(DMCXP.cdsQry1.fieldByname('PROV').AsString);

   // Nombre o Razón social del Proveedor
      edtProv.Text := Trim(DMCXP.cdsQry1.fieldByname('PROVDES').AsString);
   ////////////////////////////////////////////////////////////////////////////////////////////////////
   // Id del Banco
      dblcBanco.DataSource := Nil;
      dblcBanco.DataField := '';
      dblcBanco.Text := Trim(DMCXP.cdsQry1.fieldByname('BANCOID').AsString);

   // Nombre del Banco
      edtBanco.Text := Trim(DMCXP.cdsQry1.fieldByname('BANCONOM').AsString);

   // Cuenta para transferencia Interbancaria
      dbeCtaCte.DataSource := Nil;
      dbeCtaCte.DataField := '';
      dbeCtaCte.Text := Trim(DMCXP.cdsQry1.fieldByname('CCBCOID').AsString);

   // Tipo de Moneda
      dblcTMon.DataSource := Nil;
      dblcTMon.DataField := '';
      dblcTMon.Text := Trim(DMCXP.cdsQry1.fieldByname('TMONID').AsString);

   // Descripción de la Moneda
      edtTMon.Text := Trim(DMCXP.cdsQry1.fieldByname('TMONABR').AsString);

   // Cuenta Contable de la Comisión que cobra el Banco
      dblcdCtaCnt.DataSource := Nil;
      dblcdCtaCnt.DataField := '';
      dblcdCtaCnt.Text := Trim(DMCXP.cdsQry1.fieldByname('CUENTAID').AsString);

   // Descripción de la Cuenta Contable
      edtCtaCnt.Text := Trim(DMCXP.cdsQry1.fieldByname('CTADES').AsString);

   // Centro de Costo asociado a la Cuenta Contable
      dblcdCCosto.DataSource := Nil;
      dblcdCCosto.DataField := '';
      dblcdCCosto.Text := Trim(DMCXP.cdsQry1.fieldByname('CCOSID').AsString);

   // Descripción del Centro de costo asociado
      edtCCosto.Text := Trim(DMCXP.cdsQry1.fieldByname('CCOSDES').AsString);

   // Importe de la Comisión del Banco
      dbeImporteComis.DataSource := Nil;
      dbeImporteComis.DataField := '';
      dbeImporteComis.Text := floattostr(DMCXP.cdsQry1.fieldByname('CPMTOORI').AsFloat);
   end;
(*
   If length(dblcdProv.Text) > 0 Then
   Begin
      xSQL := 'CLAUXID=' + quotedstr(dblcClAux.Text)
         + ' and PROV=' + quotedstr(dblcdProv.Text);
      edtProv.Text := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV, ACTIVO, ESDOMIC', xSQL, 'PROVDES');

      xSQL := 'select CAJA102.CLAUXID, CAJA102.PROV, CAJA102.BANCOID, TGE105.BANCONOM, CAJA102.TMONID, TGE103.TMONABR, '
         + '          CAJA102.CODBCOCCI '
         + '     from CAJA102, TGE105, TGE103 '
         + '    where CAJA102.CLAUXID=' + quotedstr(dblcClAux.Text)
         + '      and CAJA102.PROV=' + quotedstr(dblcdProv.Text)
         + '      and CAJA102.FPAGOID=''AB'' '
         + '      and TGE105.BANCOID=CAJA102.BANCOID '
         + '      and CAJA102.CODBCOCCI is not null '
         + '      and TGE103.TMONID=CAJA102.TMONID';
      DMCXP.cdsQry15.Close;
      DMCXP.cdsQry15.Filtered := false;
      DMCXP.cdsQry15.indexfieldnames := '';
      DMCXP.cdsQry15.DataRequest(xSQL);
      DMCXP.cdsQry15.Open;
      If DMCXP.cdsQry15.RecordCount = 0 Then
      Begin
         ShowMessage('Proveedor no tiene asignada una Cuenta Corriente Interbancaria');
         dblcdProv.SetFocus;
         exit;

      End;
   End;
*)
// Fin HPC_201701_CXP

   If length(dblcBanco.Text) > 0 Then
   Begin
      dblcBancoExit(Self);
   End;

// Inicio HPC_201701_CXP
   If (DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'P')
     or (DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'A')
     or (DMCXP.cdsOPago.fieldByname('USUCONTA').AsString <> '')
     or (DMCXP.cdsOPago.fieldByname('ESTADO').AsString = 'C') Then
   Begin
      dblcClAux.Enabled := False;
      dblcdProv.Enabled := False;
      dblcBanco.Enabled := False;
      dblcdCtaCnt.Enabled := False;
      dblcdCCosto.Enabled := False;
      dbeImporteComis.Enabled := False;
      bbtnActDatosTrans.Enabled := False;
   End
   Else
   Begin
      dblcClAux.Enabled := True;
      dblcdProv.Enabled := True;
      dblcBanco.Enabled := True;
      dblcdCtaCnt.Enabled := True;
      dblcdCCosto.Enabled := True;
      dbeImporteComis.Enabled := True;
      bbtnActDatosTrans.Enabled := True;
      dblcClAux.SetFocus;
   End;
// Fin HPC_201701_CXP
End;

Procedure TFOPagoTransfInterb.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFOPagoTransfInterb.dblcClAuxExit(Sender: TObject);
Var
   xWhere, xProv: String;
Begin
   If bbtnCierraDatos.Focused Then Exit;
   If Length(dblcClAux.Text) = 0 Then Exit;

   xWhere := 'CLAUXID=''' + dblcClAux.Text + ''' and MODULO LIKE ''%' + DMCXP.wModulo + '%''';
   If length(BuscaQry('dspTGE', 'TGE102', 'CLAUXDES', xWhere, 'CLAUXDES')) = 0 Then
   Begin
      ShowMessage('Clase de auxiliar No Existe');
      dblcClAux.SetFocus;
      Exit;
   End;

   xProv := dblcdProv.Text;

// Inicio HPC_201701_CXP
   xWhere := 'Select A.PROV, A.PROVRUC, A.PROVDES'
      + '       from TGE201 A '
      + '      where A.CLAUXID = ' + quotedstr(dblcClAux.Text) + ' '
      + '        and NVL(A.ACTIVO,''N'')=''S'' ';
// Fin HPC_201701_CXP
   Filtracds(DMCXP.cdsProv, xWhere);

   dblcdProv.Text := xProv;

   If Length(dblcdProv.Text) > 0 Then
   Begin
      xWhere := 'CLAUXID=''' + dblcClAux.Text + ''' AND PROV=''' + dblcdProv.Text + ''' and NVL(ACTIVO,''N'')=''S''';
      If length(BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES', xWhere, 'ProvDES')) = 0 Then
      Begin
         dblcdProv.Text := '';
         edtProv.Text := '';
         dblcdProv.SetFocus;
   // Inicio HPC_201701_CXP
      {
      End
      Else
      Begin
         dblcdProv.Text := DMCXP.cdsQry.FieldByname('PROV').AsString;
         edtProv.Text := DMCXP.cdsQry.FieldByname('PROVDES').AsString;
      }
   // Fin HPC_201701_CXP
      End;
   End;

   If Length(dblcdProv.Text) = 0 Then dblcdProv.SetFocus;
   Screen.Cursor := crDefault;
End;

Procedure TFOPagoTransfInterb.dblcdProvExit(Sender: TObject);
Var
   xWhere, xSQL: String;
Begin

   If dblcClAux.Focused Then Exit;
   If bbtnCierraDatos.Focused Then Exit;

   If length(dblcClAux.Text) = 0 Then
   Begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Falta Ingresar Clase de Auxiliar');
   End;

   If DMCXP.wAnchoProv > 0 Then
   Begin
      If ((Length(dblcdProv.Text) < DMCXP.wAnchoProv) And (Length(dblcdProv.Text) > 0)) Then
      Begin
         dblcdProv.Text := StrZero(dblcdProv.Text, DMCXP.wAnchoProv);
      End;
   End;

   If (length(dblcdProv.Text) = 0) Then
   Begin
      ShowMessage('Indique un Código del Proveedor');
      dblcdProv.SetFocus;
      exit;
   End;

// Inicio HPC_201701_CXP
   xWhere := 'CLAUXID=' + quotedstr(dblcClAux.Text)
      + ' and PROV=' + quotedstr(dblcdProv.Text);
   edtProv.Text := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV, ACTIVO, ESDOMIC', xWhere, 'PROVDES');

   xSQL := 'select CAJA102.CLAUXID, CAJA102.PROV, CAJA102.BANCOID, TGE105.BANCONOM, CAJA102.TMONID, TGE103.TMONABR, '
      + '          CAJA102.CODBCOCCI '
      + '     from CAJA102, TGE105, TGE103 '
      + '    where CAJA102.CLAUXID=' + quotedstr(dblcClAux.Text)
      + '      and CAJA102.PROV=' + quotedstr(dblcdProv.Text)
      + '      and CAJA102.FPAGOID=''AB'' '
      + '      and TGE105.BANCOID=CAJA102.BANCOID '
      + '      and CAJA102.CODBCOCCI is not null '
      + '      and TGE103.TMONID=CAJA102.TMONID';
   DMCXP.cdsQry2.Close;
   DMCXP.cdsQry2.Filtered := false;
   DMCXP.cdsQry2.indexfieldnames := '';
   DMCXP.cdsQry2.DataRequest(xSQL);
   DMCXP.cdsQry2.Open;
   If DMCXP.cdsQry2.RecordCount = 0 Then
   Begin
      ShowMessage('Proveedor no tiene asignada una Cuenta Corriente Interbancaria');
      dblcdProv.SetFocus;
      exit;
   End;
   dblcBanco.SetFocus;
// Fin HPC_201701_CXP
End;

Procedure TFOPagoTransfInterb.dblcBancoExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If bbtnCierraDatos.Focused Then exit;

   xSQL := 'select CAJA102.CLAUXID, CAJA102.PROV, CAJA102.BANCOID, TGE105.BANCONOM, CAJA102.TMONID, TGE103.TMONABR, '
         + '          CAJA102.CODBCOCCI '
         + '     from CAJA102, TGE105, TGE103 '
         + '    where CAJA102.CLAUXID=' + quotedstr(dblcClAux.Text)
         + '      and CAJA102.PROV=' + quotedstr(dblcdProv.Text)
         + '      and CAJA102.FPAGOID=''AB'' '
         + '      and TGE105.BANCOID=CAJA102.BANCOID '
         + '      and CAJA102.CODBCOCCI is not null '
         + '      and TGE103.TMONID=CAJA102.TMONID';
   // Inicio HPC_201701_CXP
      DMCXP.cdsQry10.Close;
      DMCXP.cdsQry10.Filtered := false;
      DMCXP.cdsQry10.indexfieldnames := '';
      DMCXP.cdsQry10.DataRequest(xSQL);
      DMCXP.cdsQry10.Open;
   // Fin HPC_201701_CXP

   If length(dblcBanco.Text) > 0 Then
   Begin
   // Inicio HPC_201701_CXP
      If length(DMCXP.cdsQry10.FieldByName('BANCOID').AsString) = 0 Then
   // Fin HPC_201701_CXP
      Begin
         ShowMessage('No existe este Banco');
         edtBanco.Text := '';
         dbeCtaCte.text := '';
         dblcBanco.SetFocus;
         Exit;
      End;
   // Inicio HPC_201701_CXP
      edtBanco.Text := DMCXP.cdsQry10.fieldbyname('BANCONOM').AsString;
      dbeCtaCte.text := DMCXP.cdsQry10.fieldbyname('CODBCOCCI').AsString;
      dblcTMon.Text := DMCXP.cdsQry10.fieldbyname('TMONID').AsString;
      edtTMon.Text := DMCXP.cdsQry10.fieldbyname('TMONABR').AsString;
   // Fin HPC_201701_CXP
   End
   Else
   Begin
      ShowMessage('Defina correctamente el Banco y Cta.Cte');
      edtBanco.text := '';
      dbeCtaCte.text := '';
      dblcBanco.SetFocus;
      Exit;
   End;
   dblcdCtaCnt.setfocus;
End;

Procedure TFOPagoTransfInterb.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
// Inicio HPC_201701_CXP
   FOrdenPagoCab.pnlCab.enabled := True;
   FOrdenPagoCab.pnlGraba.enabled := True;
   FOrdenPagoCab.pnlVisa.Enabled := True;
   FOrdenPagoCab.pnlCab2.Enabled := True;
   FOrdenPagoCab.pnlCnt.Enabled := True;
   FOrdenPagoCab.rgoperacion.enabled := True;
// Fin HPC_201701_CXP
   Action := caFree;
End;

Procedure TFOPagoTransfInterb.FormCreate(Sender: TObject);
Begin
// Clase de Auxiliar
   dblcClAux.LookupTable := DMCXP.cdsClAux;

// Maestro de Proveedores
// Inicio HPC_201701_CXP
   xSQL := 'Select A.PROV, A.PROVRUC, A.PROVDES '
      + '  from TGE201 A '
      + ' where NVL(A.ACTIVO,''N'')=''S''  ';
   DMCXP.cdsProv.Close;
   DMCXP.cdsProv.DataRequest(xSQL);
   DMCXP.cdsProv.Open;
   DMCXP.cdsProv.IndexFieldNames := 'PROV';
   dblcdProv.LookupField := 'PROV';
   dblcdProv.LookupTable := DMCXP.cdsProv;
   dblcdProv.Selected.Clear;
   dblcdProv.Selected.Add('PROV'#9'4'#9'Proveedor'#9'F');
   dblcdProv.Selected.Add('PROVRUC'#9'11'#9'RUC'#9'F');
   dblcdProv.Selected.Add('PROVDES'#9'30'#9'Razón Social'#9'F');
// Fin HPC_201701_CXP

// Banco
// Inicio HPC_201701_CXP
   dblcBanco.LookupTable := DMCXP.cdsBanco;
// Fin HPC_201701_CXP
   dblcBanco.LookupField := 'BANCOID';
   dblcBanco.Selected.Clear;
   dblcBanco.Selected.Add('BANCOID'#9'4'#9'Banco'#9'F');
   dblcBanco.Selected.Add('BANCONOM'#9'30'#9'Nombre del Banco'#9'F');
   dblcBanco.Selected.Add('CODBCOCCI'#9'15'#9'Cta.Cte.'#9'F');
   dblcBanco.Selected.Add('TMONID'#9'5'#9'Moneda'#9'F');

// Tipo de Moneda
   xSQL := 'Select TMONID, TMONDES, TMONABR '
      + '  from TGE103 ';
   DMCXP.cdsTMon.Close;
   DMCXP.cdsTMon.DataRequest(xSQL);
   DMCXP.cdsTMon.Open;
   dblcTMon.LookUpField := 'TMONID';
   dblcTMon.LookupTable := DMCXP.cdsTMon;
   dblcTMon.Selected.Clear;
   dblcTMon.Selected.Add('TMONID'#9'4'#9'Moneda'#9'F');
   dblcTMon.Selected.Add('TMONDES'#9'10'#9'Abreviatura'#9'F');

// Plan de Cuentas
   xSQL := 'Select CUENTAID, CTADES, CTA_MOV, CTA_CCOS '
      + '  from TGE202 '
      + ' where CIAID=' + quotedstr(FOrdenPagoCab.dblcCia.Text);
   DMCXP.cdsCuenta.Close;
   DMCXP.cdsCuenta.ProviderName := 'dspTGE';
   DMCXP.cdsCuenta.DataRequest(xSQL);
   DMCXP.cdsCuenta.Open;
   DMCXP.cdsCuenta.IndexFieldNames := 'CUENTAID';
   dblcdCtaCnt.LookUpField := 'CUENTAID';
   dblcdCtaCnt.LookupTable := DMCXP.cdsCuenta;
   dblcdCtaCnt.Selected.Clear;
   dblcdCtaCnt.Selected.Add('CUENTAID'#9'10'#9'Cuenta'#9'F');
   dblcdCtaCnt.Selected.Add('CTADES'#9'20'#9'Descripción'#9'F');
   dblcdCtaCnt.Selected.Add('CTA_MOV'#9'5'#9'Movim'#9'F');
   dblcdCtaCnt.Selected.Add('CTA_CCOS'#9'5'#9'Req.CCosto'#9'F');

// Centros de Costo
// Inicio HPC_201701_CXP
   xSQL := 'Select CCOSID, CCOSDES, CCOSMOV '
      + '  from TGE203 '
      + ' where CCOSCIAS like (' + quotedstr('%02%') + ')';
// Fin HPC_201701_CXP
   DMCXP.cdsCCosto.Close;
   DMCXP.cdsCCosto.DataRequest(xSQL);
   DMCXP.cdsCCosto.Open;
   DMCXP.cdsCCosto.IndexFieldNames := 'CCOSID';
   dblcdCCosto.LookUpField := 'CCOSID';
   dblcdCCosto.LookupTable := DMCXP.cdsCCosto;
   dblcdCCosto.Selected.Clear;
   dblcdCCosto.Selected.Add('CCOSID'#9'10'#9'C.Costo'#9'F');
   dblcdCCosto.Selected.Add('CCOSDES'#9'20'#9'Descripción'#9'F');
   dblcdCCosto.Selected.Add('CCOSMOV'#9'5'#9'Movim'#9'F');
End;

Procedure TFOPagoTransfInterb.bbtnCierraDatosClick(Sender: TObject);
Begin
   If (length(edtProv.Text) = 0) Or (length(edtBanco.Text) = 0) Or (length(dbeCtaCte.Text) = 0) Or (length(edtTMon.Text) = 0)
      Or (length(edtCtaCnt.Text) = 0) Or (length(dbeImporteComis.Text) = 0) Then
   Begin
      If MessageDlg(' No están los datos completos para la Transferencia Interbancaria, ' + chr(13)
         + '    si sale la Orden se tomará como Abono en Cuenta ¿Continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Exit;
      FOrdenPagoCab.rgOperacion.ItemIndex := 0;
   End;
   Close;
End;

Procedure TFOPagoTransfInterb.dblcdCtaCntExit(Sender: TObject);
Begin
// Inicio HPC_201701_CXP
   If bbtnCierraDatos.Focused Then Exit;
// Fin HPC_201701_CXP

   If length(dblcdCtaCnt.Text) = 0 Then
   Begin
      ShowMessage('Debe definir una Cuenta Contable');
      dblcdCtaCnt.SetFocus;
      Exit;
   End;

   xSQL := 'Select CCI.CIAID, CCI.NUMERO, CCI.CLAUXID, CCI.PROV, CCI.BANCOID, CCI.CCBCOID, '
      + '          CCI.USUREG, CCI.FECREG, CCI.USUMOD, CCI.FECMOD, CCI.CPFREG, PROVEEDORES.PROVDES, '
      + '          BANCOS.BANCONOM, '
      + '          CCI.CUENTAID, CTAS.CTADES, CCI.CCOSID, CCOSTOS.CCOSDES, CCI.TMONID, MONEDAS.TMONABR, '
      + '          CCI.CPMTOORI, CCI.CPMTOLOC, CCI.CPMTOEXT '
      + '     From CXP_ORD_PAG_TINT CCI, TGE201 PROVEEDORES, TGE105 BANCOS, TGE103 MONEDAS, TGE203 CCOSTOS, TGE202 CTAS '
      + '    Where CCI.CIAID=' + quotedstr(FOrdenPagoCab.dblcCia.Text)
      + '      and CCI.NUMERO =' + quotedstr(FOrdenPagoCab.dbeNumero.Text)
      + '      and PROVEEDORES.CLAUXID(+) = CCI.CLAUXID and PROVEEDORES.PROV(+) = CCI.PROV '
      + '      and BANCOS.BANCOID(+) = CCI.BANCOID '
      + '      and MONEDAS.TMONID(+) = CCI.TMONID '
      + '      and CCOSTOS.CCOSID(+) = CCI.CCOSID '
      + '      and CTAS.CIAID(+)=CCI.CIAID and CTAS.CUENTAID(+)=CCI.CUENTAID';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;

// Inicio HPC_201701_CXP
   if DMCXP.cdsQry.RecordCount>0 then
   Begin
   // Cuenta Contable de la Comisión que cobra el Banco
      dblcdCtaCnt.DataSource := Nil;
      dblcdCtaCnt.DataField := '';
      dblcdCtaCnt.Text := Trim(DMCXP.cdsQry.fieldByname('CUENTAID').AsString);
   end;
// Fin HPC_201701_CXP

   DMCXP.cdsCuenta.SetKey;
   DMCXP.cdsCuenta.FieldByName('CUENTAID').AsString := dblcdCtaCnt.Text;
   If Not DMCXP.cdsCuenta.GotoKey Then
   Begin
      ShowMessage('La Cuenta Contable no existe');
      dblcdCtaCnt.SetFocus;
      Exit;
   End;

   If DMCXP.cdsCuenta.FieldByName('CTA_MOV').AsString <> 'S' Then
   Begin
      ShowMessage('Cuenta Contable no es de movimiento, no se permite registro');
      dblcdCtaCnt.SetFocus;
      Exit;
   End;

   edtCtaCnt.Text := DMCXP.cdsCuenta.FieldByName('CTADES').AsString;
   If DMCXP.cdsCuenta.FieldByName('CTA_CCOS').AsString = 'S' Then
   begin
      dblcdCCosto.Enabled := True;
   // Inicio HPC_201701_CXP
      dblcdCCosto.SetFocus;
   // Fin HPC_201701_CXP
   end
   Else
   begin
      dblcdCCosto.Enabled := False;
      dblcdCCosto.Text :='';
      edtCCosto.Text :='';
   end;
End;

Procedure TFOPagoTransfInterb.dblcdCCostoExit(Sender: TObject);
Begin
// Inicio HPC_201701_CXP
   If bbtnCierraDatos.Focused Then Exit;
// Fin HPC_201701_CXP

   If length(dblcdCCosto.Text) = 0 Then
   Begin
      ShowMessage('Debe definir un Centro de Costo');
      dblcdCCosto.SetFocus;
      Exit;
   End;
//   dblcdCCosto.Text := DMCXP.cdsCCosto.FieldByName('CCOSID').AsString;
//
   DMCXP.cdsCCosto.SetKey;
   DMCXP.cdsCCosto.FieldByName('CCOSID').AsString := dblcdCCosto.Text;
   If Not DMCXP.cdsCCosto.GotoKey Then
   Begin
      ShowMessage('El Centro de Costo no existe');
      dblcdCCosto.SetFocus;
      Exit;
   End;

   If DMCXP.cdsCCosto.FieldByName('CCOSMOV').AsString = 'N' Then
   Begin
      ShowMessage('Centro de Costo no es de movimiento, no se permite registro');
      dblcdCCosto.SetFocus;
      Exit;
   End;

   edtCCosto.Text := DMCXP.cdsCCosto.FieldByName('CCOSDES').AsString;
End;

// Inicio HPC_201701_CXP
Procedure TFOPagoTransfInterb.dbeImporteComisExit(Sender: TObject);
Begin
   If bbtnCierraDatos.Focused Then Exit;
   If strtofloat(dbeImporteComis.Text)<0 then
   Begin
      ShowMessage('No se aceptan valores negativos');
      dbeImporteComis.SetFocus;
   End;
End;
// Fin HPC_201701_CXP

// Inicio HPC_201701_CXP
Procedure TFOPagoTransfInterb.dblcdProvCloseDialog(Dialog: TwwLookupDlg);
Begin
   dblcdProv.Text := DMCXP.cdsProv.FieldByName('PROV').AsString;
End;
// Fin HPC_201701_CXP

// Inicio HPC_201701_CXP
Procedure TFOPagoTransfInterb.dblcdCtaCntCloseDialog(Dialog: TwwLookupDlg);
Begin
   dblcdCtaCnt.Text := DMCXP.cdsCuenta.FieldByName('CUENTAID').AsString;
   if DMCXP.cdsCuenta.IndexFieldNames<>'CUENTAID' then
      DMCXP.cdsCuenta.IndexFieldNames:='CUENTAID';  
End;
// Fin HPC_201701_CXP

// Inicio HPC_201701_CXP
Procedure TFOPagoTransfInterb.dblcdCCostoCloseDialog(Dialog: TwwLookupDlg);
Begin
   dblcdCCosto.Text := DMCXP.cdsCCosto.FieldByName('CCOSID').AsString;
End;
// Fin HPC_201701_CXP

End.

