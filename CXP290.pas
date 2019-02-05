Unit CXP290;
//*********************************************************
// CREADO     POR   : Christian Flores Rodríguez
// Nº HPC           : HPC_201801_CXP
// FECHA DE MODIF.  : 29/01/2018
// DESCRIPCION      : Formulario de Cargos de Directorio
//*********************************************************

// Actualizaciones
// HPC_201801_CXP  29/01/2018 Inicio de Formulario

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Buttons, Wwdbigrd, Grids, Wwdbgrid, StdCtrls, Wwkeycb, ExtCtrls, wwdblook, DB,
   Mask, wwdbedit, Wwdbdlg, DBClient, wwclient;

Type
   TFCargosDirectorio = Class(TForm)
      pnlDetalle: TPanel;
      Label1: TLabel;
      edtDescripcion: TEdit;
      Label3: TLabel;
      bbtnRegOk: TBitBtn;
      bbtnRegCanc: TBitBtn;
      edtIdCargo: TEdit;
      Procedure FormShow(Sender: TObject);
      Procedure bbtnRegCancClick(Sender: TObject);
      Procedure bbtnRegOkClick(Sender: TObject);
      Procedure dblcTRegistroNotInList(Sender: TObject;
         LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);

   Private
      xGlosaRep, xCta_Ccos, xDistri: String;
      Procedure RecuperaDocumentos(pCiaid, pProveedor: String);
   Public
   End;

Var
   FCargosDirectorio: TFCargosDirectorio;
   xSQL: String;
   xTemTReg: String;
   xTemCpto: String;
   xTemCta: String;
   xTemDH: String;
   xNuevoDet: boolean;

Implementation
Uses CxPDM, CxP001, CxP201;
{$R *.dfm}

Procedure TFCargosDirectorio.RecuperaDocumentos(pCiaid, pProveedor: String);
Begin
End;

Procedure TFCargosDirectorio.FormShow(Sender: TObject);
Var
   ls_idCargo, ls_descripcion: String;
   xSQL: String;
   meNoReg: String;
Begin
   ls_idCargo := DMCXP.cdsCargDirect.fieldbyname('IDCARGO').AsString;
   ls_descripcion := DMCXP.cdsCargDirect.fieldbyname('DESCRIPCION').AsString;

   edtIdCargo.Text := '';
   edtDescripcion.Text := '';
   If DMCXP.wModo = 'A' Then
   Begin
      meNoReg := '';
      meNoReg := DMCXP.UltimoRegistroCD;
      meNoReg := Strzero(meNoReg, DMCXP.cdsCargDirect.fieldbyname('IDCARGO').Size);
      edtIdCargo.Text := meNoReg;
      edtDescripcion.Text := '';
   End
   Else
   Begin
      edtIdCargo.Text := ls_idCargo;
      edtDescripcion.Text := ls_descripcion;

   End;
End;

Procedure TFCargosDirectorio.bbtnRegCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFCargosDirectorio.bbtnRegOkClick(Sender: TObject);
Var
   xSQL, xTipDet, xWhere, xedtIdCargo, xedtDescripcion: String;
   cdsClone: TwwClientDataSet;
   xRecord: Integer;
Begin
   If length(edtIdCargo.Text) = 0 Then
   Begin
      edtIdCargo.SetFocus;
      Showmessage('Debe Ingresar el Código del Cargo');
      exit;
   End;

   xedtIdCargo := edtIdCargo.Text;
   xedtDescripcion := edtDescripcion.Text;
   If length(xedtDescripcion) = 0 Then
   Begin
      edtDescripcion.SetFocus;
      Showmessage('Debe Ingresar la descripción del Cargo de Directorio');
      exit;
   End;

   If DMCXP.wModo = 'A' Then
   Begin

      DMCXP.cdsCargDirect.Edit;
      DMCXP.cdsCargDirect.fieldbyname('IDCARGO').AsString := xedtIdCargo;
      DMCXP.cdsCargDirect.fieldbyname('DESCRIPCION').AsString := UpperCase(xedtDescripcion);
      DMCXP.cdsCargDirect.fieldbyname('ESTADO').AsString := 'S';
      DMCXP.cdsCargDirect.fieldbyname('FECCREA').Value := DATE;
      DMCXP.cdsCargDirect.FieldByName('FECMODIF').Value := DATE;
      DMCXP.cdsCargDirect.FieldByName('USUARIO').AsString := DMCXP.wUsuario;
      DMCXP.cdsCargDirect.FieldByName('FREG').Value := DATE;
      DMCXP.cdsCargDirect.FieldByName('HREG').Value := TIME;
      DMCXP.cdsCargDirect.POST;
      xSQL := ' Insert into DB2ADMIN.CXP_CARGOS_DIRECT( IDCARGO, DESCRIPCION, ESTADO, FECCREA, FECMODIF, USUARIO, FREG, HREG ) '
         + '    Values( ' + quotedstr(DMCXP.cdsCargDirect.fieldbyname('IDCARGO').AsString) + ', '
         + quotedstr(DMCXP.cdsCargDirect.fieldbyname('DESCRIPCION').AsString) + ', '
         + quotedstr(DMCXP.cdsCargDirect.fieldbyname('ESTADO').AsString) + ', '
         + '                trunc(sysdate),  '
         + '                sysdate,  '
         + quotedstr(DMCXP.cdsCargDirect.fieldbyname('USUARIO').AsString) + ', '
         + '                trunc(sysdate),  '
         + '                sysdate )';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo Insertar el Registro de Cargo de Directorio');
         exit;
      End;
   End
   Else
   Begin
      DMCXP.cdsCargDirect.Edit;
      DMCXP.cdsCargDirect.fieldbyname('IDCARGO').AsString := xedtIdCargo;
      DMCXP.cdsCargDirect.fieldbyname('DESCRIPCION').AsString := UpperCase(xedtDescripcion);
      DMCXP.cdsCargDirect.fieldbyname('ESTADO').AsString := 'S';
      DMCXP.cdsCargDirect.FieldByName('FECMODIF').Value := DATE;
      DMCXP.cdsCargDirect.FieldByName('USUARIO').AsString := DMCXP.wUsuario;
      DMCXP.cdsCargDirect.FieldByName('FREG').Value := DATE;
      DMCXP.cdsCargDirect.FieldByName('HREG').Value := TIME;
      DMCXP.cdsCargDirect.POST;

      xSQL := ' Update DB2ADMIN.CXP_CARGOS_DIRECT '
         + '       set DESCRIPCION = ' + quotedstr(DMCXP.cdsCargDirect.fieldbyname('DESCRIPCION').AsString) + ','
         + '           ESTADO = ' + quotedstr(DMCXP.cdsCargDirect.fieldbyname('ESTADO').AsString) + ','
         + '           FECMODIF = sysdate, '
         + '           USUARIO = ' + quotedstr(DMCXP.cdsCargDirect.fieldbyname('USUARIO').AsString) + ','
         + '           FREG = trunc(sysdate), '
         + '           HREG = sysdate '
         + '     Where IDCARGO=' + quotedstr(DMCXP.cdsCargDirect.fieldbyname('IDCARGO').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se puede actualizar el Cargo de Directorio');
         exit;
      End;
   End;
   DMCXP.cdsCargDirect.EnableControls;
   Close;
End;

Procedure TFCargosDirectorio.dblcTRegistroNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFCargosDirectorio.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

End.

