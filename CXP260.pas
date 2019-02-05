Unit CxP260;

// Actualizaciones    :
// HPC_201305_CXP  28/10/2013  Permite eliminación de registros
// HPC_201307_CXP  26/11/2013  Consolida la grabación con SQL
//                             retira comparación de modulo=null
// HPC_201501_CXP  28/05/2015  Se añade Transferencias Interbancarias
// HPC_201504_CXP  21/10/2015  Se adicionó un campo NUMOPE para guardar el Número de Operación
//                             en la tabla CXP_ORD_PAG_CAB
// HPC_201602_CXP  07/04/2016  Filtra sólo órdenes de pago
//                             Apertura cds de Tipo de Moneda.


Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, DBCtrls, wwdblook,
   wwdbdatetimepicker, Mask, wwdbedit, ExtCtrls, db;

Type
   TFOrdenPago = Class(TForm)
      dbgDetalle: TwwDBGrid;
      Panel1: TPanel;
      Label1: TLabel;
      dtpFecha: TwwDBDateTimePicker;
      dblcTMoneda: TwwDBLookupCombo;
      lblTMon: TLabel;
      edtTMoneda: TEdit;
      Panel2: TPanel;
      wwDBGrid1IButton: TwwIButton;
      lblCia: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      bbtnBuscar: TBitBtn;
      Procedure wwDBGrid1IButtonClick(Sender: TObject);
      Procedure bbtnBuscarClick(Sender: TObject);
      Procedure dbgDetalleDblClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcTMonedaExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbgDetalleKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
   Private
    { Private declarations }
      Procedure CargaDataSource;
      Procedure CargaGrid;
   Public
    { Public declarations }
      xgTipoAct : String;   // HPC_201307_CXP
   End;

Var
   FOrdenPago: TFOrdenPago;

Implementation

{$R *.dfm}

Uses CXPDM, CXP264;

Procedure TFOrdenPago.CargaDataSource;
Begin
   dblcCia.LookupTable := DMCXP.cdsCia;

// Inicio HPC_201602_CXP
// Apertura cds de Tipo de Moneda.
   DMCXP.cdsTMon.Close;
   DMCXP.cdsTMon.DataRequest('Select TMONID, TMONDES, TMONABR, TMON_LOC, ISOCODEALF, ISOCODENUM from TGE103 where TMONID in (''N'',''D'')');
   DMCXP.cdsTMon.Open;
// Fin HPC_201602_CXP

   dblcTMoneda.LookupTable := DMCXP.cdsTMon;
   dbgDetalle.DataSource := DMCXP.dsOPago;
End;

Procedure TFOrdenPago.wwDBGrid1IButtonClick(Sender: TObject);
Begin
   Try
      DMCXP.cdsOPago.Insert;
   // Inicio : HPC_201307_CXP
      xgTipoAct := 'I';
   // Fin : HPC_201307_CXP
      FOrdenPagoCab := TFOrdenPagoCab.Create(Application);
      FOrdenPagoCab.ShowModal;
   Finally
      FOrdenPagoCab.Free;
   End;
End;

Procedure TFOrdenPago.bbtnBuscarClick(Sender: TObject);
Var
   xSQL: String;
Begin
// Inicio : HPC_201504_CXP
   xSQL := 'Select CIAID, NUMERO, FECHA, TMONID, MONTOT, MONPAG, OBSERVA, '
         + '       FECREG, USUARIO, ESTADO, FECACEPTA, USUACEPTA, FECPAGO, '
         + '       USUPAGO, BANCOID, CCBCOID, USUANULA, FECANU, USUCONTA, '
         + '       FECCONTA, NUMPLA, MODULO,FLAG_OPER,NUMOPE '
         + '  from CXP_ORD_PAG_CAB '
         + ' where CIAID LIKE '+quotedstr(dblcCia.text);
// Fin : HPC_201504_CXP

   If dtpFecha.date <> 0 Then
      xSQL := xSQL + ' and FECHA=''' + dtpFecha.Text + ''' ';

   If dblcTMoneda.Text <> '' Then
      xSQL := xSQL + ' and TMONID=''' + dblcTMoneda.Text + ''' ';

   If DMCXP.cFilterUsuarioUserOrd <> '' Then
      xSQL := xSQL + ' and ' + DMCXP.cFilterUsuarioUserOrd;

// Inicio HPC_201602_CXP
// Filtra sólo órdenes de pago
   xSQL := xSQL + ' and (MODULO is null or MODULO=''TLC'' )';
// Fin HPC_201602_CXP

   xSQL := xSQL + ' order by CIAID, NUMERO desc';
   dbgDetalle.Selected.Clear;
   dbgDetalle.Selected.Add('CIAID'#9'3'#9'Cía'#9'F');
   dbgDetalle.Selected.Add('NUMERO'#9'7'#9'Orden~Pago'#9'F');
   dbgDetalle.Selected.Add('NUMPLA'#9'7'#9'Planilla'#9'F');
   dbgDetalle.Selected.Add('FECHA'#9'11'#9'Fecha'#9'F');
   dbgDetalle.Selected.Add('TMONID'#9'5'#9'Moneda'#9'F');
   dbgDetalle.Selected.Add('MONPAG'#9'10'#9'Importe~Total'#9'F');
   dbgDetalle.Selected.Add('ESTADO'#9'5'#9'Estado'#9'F');
   dbgDetalle.Selected.Add('USUARIO'#9'15'#9'Usuario'#9'F');
   dbgDetalle.Selected.Add('USUACEPTA'#9'15'#9'Usuario~Acepta'#9'F');
   dbgDetalle.Selected.Add('FECACEPTA'#9'11'#9'Fecha~Acepta'#9'F');
   dbgDetalle.Selected.Add('USUCONTA'#9'10'#9'Usuario~Contab'#9'F');
//  dbgDetalle.Selected.Add('USUPAGO'#9'15'#9'Usuario~Pago'#9'F');
//  dbgDetalle.Selected.Add('FECPAGO'#9'11'#9'Fecha~Acepta'#9'F');

   DMCXP.cdsOPago.Close;
   DMCXP.cdsOPago.DataRequest(xSQL);
   DMCXP.cdsOPago.Open;
End;

Procedure TFOrdenPago.dbgDetalleDblClick(Sender: TObject);
Begin
   Try
      FOrdenPagoCab := TFOrdenPagoCab.Create(Application);
      FOrdenPagoCab.ShowModal;
   Finally
      FOrdenPagoCab.Free;
   End;
End;

Procedure TFOrdenPago.FormActivate(Sender: TObject);
Begin
   CargaDataSource;
   DMCXP.cdsBanco.Filtered := False;
   DMCXP.cdsBanco.Filter := '';
   DMCXP.cdsBanco.Filter := 'BCOTIPCTA=''B'' AND (FLAVIGCOB=''S'' OR FLAHISPRE=''S'')';
   DMCXP.cdsBanco.Filtered := True;
   bbtnBuscarClick(Self);
   //dtpFecha.date:=Date;
End;

Procedure TFOrdenPago.dblcCiaExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If trim(dblcCia.Text) = '' Then Exit;

   xWhere := 'CIAID=' + quotedstr(dblcCia.Text);
   edtCia.Text := BuscaQry('dspTGE', 'TGE101', 'CIAABR,CIARETIGV,EXOIGV', xWhere, 'CIAABR');
   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Error en código de Compañía');
      dblcCia.SetFocus;
   End;
End;

Procedure TFOrdenPago.dblcTMonedaExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If trim(dblcTMoneda.Text) = '' Then Exit;

   Screen.Cursor := crHourGlass;
   xWhere := 'TMONID=' + '''' + dblcTMoneda.Text + '''';
   edtTMoneda.Text := BuscaQry('PrvTGE', 'TGE103', 'TMONDES, TMON_LOC', xWhere, 'TMONDES');
   Screen.Cursor := crDefault;

   If length(edtTMoneda.Text) = 0 Then
   Begin
      ShowMessage('Error en Tipo de Moneda');
      dblcTMoneda.SetFocus;
   End;
End;

Procedure TFOrdenPago.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMCXP.cdsMovCxP.IndexFieldNames := '';
   DMCXP.cdsBanco.Filtered := False;
   DMCXP.cdsBanco.Filter := ''
End;

Procedure TFOrdenPago.dbgDetalleKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Var
   xSQL: String;
Begin
   If (Key = VK_DELETE) And (ssCtrl In Shift) Then //^Del
   Begin
      If (DMCXP.cdsOPago.FieldByname('ESTADO').AsString = 'A') Or (DMCXP.cdsOPago.FieldByname('ESTADO').AsString = 'P') Then
      Begin
         ShowMessage('No se puede Eliminar Orden de Pago');
         Exit;
      End;

      If MessageDlg('¿ Realmente está seguro de Eliminar la Orden de Pago ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

      DMCXP.DCOM1.AppServer.IniciaTransaccion;
   // Inicio HPC_201305_CXP
   // borrado de registros físicos Detalle
      xSQL := 'Delete from CXP_ORD_PAG_DET '
            + ' where CIAID =''' + DMCXP.cdsOPago.FieldByname('CIAID').AsString + ''' '
            + '   and NUMERO=''' + DMCXP.cdsOPago.FieldByname('NUMERO').AsString + ''' ';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en la Transaccion Eliminar Detalle');
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
      End;

   // borrado de registros físicos Cabecera
      xSQL := 'Delete from CXP_ORD_PAG_CAB '
            + ' where CIAID =''' + DMCXP.cdsOPago.FieldByname('CIAID').AsString + ''' '
            + '   and NUMERO=''' + DMCXP.cdsOPago.FieldByname('NUMERO').AsString + ''' ';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en la Transaccion Eliminar Cabecera');
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
      End;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
{
     DMCXP.cdsOPago.Delete;

     if DMCXP.cdsOPago.ApplyUpdates(-1)>0 then
     begin
        ShowMessage('Error al grabar 1');
        Exit;
     end;
}
   // Fin HPC_201305_CXP
      ShowMessage('Orden de Pago Eliminada');
      bbtnBuscarClick(Sender);
   //   cargaGrid;
   End;
End;

Procedure TFOrdenPago.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;

End;

Procedure TFOrdenPago.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFOrdenPago.CargaGrid;
Var
   xSQL: String;
Begin
// Inicio HPC_201504_CXP
   xSQL := 'Select CIAID, NUMERO, FECHA, TMONID, MONTOT, MONPAG, OBSERVA, FECREG, USUARIO, ESTADO, '
         + '       FECACEPTA, USUACEPTA, FECPAGO, USUPAGO, BANCOID, CCBCOID, USUANULA, FECANU, USUCONTA, '
         + '       FECCONTA, NUMPLA, NUMOPE '
         + '  from CXP_ORD_PAG_CAB, MODULO '
         + ' where CIAID LIKE ''' + dblcCia.text + '%'' and modulo is null ';
// Fin HPC_201504_CXP
   If dtpFecha.date <> 0 Then
      xSQL := xSQL + ' and FECHA=''' + dtpFecha.Text + ''' ';

   If dblcTMoneda.Text <> '' Then
      xSQL := xSQL + ' and TMONID=''' + dblcTMoneda.Text + ''' ';

   If DMCXP.cFilterUsuarioUserOrd <> '' Then
      xSQL := xSQL + ' and ' + DMCXP.cFilterUsuarioUserOrd;

   xSQL := xSQL + ' order by CIAID, NUMERO desc';
   dbgDetalle.Selected.Clear;
   dbgDetalle.Selected.Add('CIAID'#9'3'#9'Cía'#9'F');
   dbgDetalle.Selected.Add('NUMERO'#9'7'#9'Orden~Pago'#9'F');
   dbgDetalle.Selected.Add('NUMPLA'#9'7'#9'Planilla'#9'F');
   dbgDetalle.Selected.Add('FECHA'#9'11'#9'Fecha'#9'F');
   dbgDetalle.Selected.Add('TMONID'#9'5'#9'Moneda'#9'F');
   dbgDetalle.Selected.Add('MONPAG'#9'10'#9'Importe~Total'#9'F');
   dbgDetalle.Selected.Add('ESTADO'#9'5'#9'Estado'#9'F');
   dbgDetalle.Selected.Add('USUARIO'#9'15'#9'Usuario'#9'F');
   dbgDetalle.Selected.Add('USUACEPTA'#9'15'#9'Usuario~Acepta'#9'F');
   dbgDetalle.Selected.Add('FECACEPTA'#9'11'#9'Fecha~Acepta'#9'F');
   dbgDetalle.Selected.Add('USUCONTA'#9'10'#9'Usuario~Contab'#9'F');

   DMCXP.cdsOPago.Close;
   DMCXP.cdsOPago.DataRequest(xSQL);
   DMCXP.cdsOPago.Open;
End;

End.

