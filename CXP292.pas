Unit CXP292;
//*********************************************************
// CREADO     POR   : Christian Flores Rodríguez
// Nº HPC           : HPC_201801_CXP
// FECHA DE MODIF.  : 31/01/2018
// DESCRIPCION      : Detalle de Conceptos Plantilla de Dietas de Directorio
//
//*********************************************************

// Actualizaciones
// HPC_201801_CXP  29/01/2018 Inicio de Formulario
// HPC_201804_CXP  19/07/2018 Incluye el punto decimal en la validación

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Buttons, Wwdbigrd, Grids, Wwdbgrid, StdCtrls, Wwkeycb, ExtCtrls, wwdblook, DB,
   Mask, wwdbedit, Wwdbdlg, DBClient, wwclient;

Type
   TFPlantillaDetalle = Class(TForm)
      dbgDietaDirecto: TwwDBGrid;
      btnActReg: TwwIButton;
      pnlDetalle: TPanel;
      Label7: TLabel;
      pnlRegistro: TPanel;
      lblTipReg: TLabel;
      lblTipPre: TLabel;
      lblPresu: TLabel;
      edtConcepto: TEdit;
      dbeSR: TwwDBEdit;
      bbtnRegOk: TBitBtn;
      bbtnCancelar: TBitBtn;
      StaticText1: TStaticText;
      dbeImporte: TwwDBEdit;
      lblTDoc: TLabel;
      dblcAfecto: TwwDBLookupCombo;
      GroupBox1: TGroupBox;
      Label1: TLabel;
      edtCodProv: TwwDBEdit;
      Label3: TLabel;
      edtDescripcionProv: TEdit;
      Label2: TLabel;
      edtCargo: TEdit;
      dblcdCnpEgr: TwwDBLookupComboDlg;
      Label4: TLabel;
      lblNumero: TLabel;
      lblclauxid: TLabel;
      Procedure FormShow(Sender: TObject);
      Procedure bbtnRegOkClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcdCnpEgrExit(Sender: TObject);
      Procedure btnActRegClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure dbgDietaDirectoDblClick(Sender: TObject);
      Procedure dbgDietaDirectoKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbeImporteExit(Sender: TObject);
      Procedure dbeSRExit(Sender: TObject);
      Procedure dblcAfectoExit(Sender: TObject);

   Private
      xGlosaRep, xCta_Ccos, xDistri: String;
      numreg: Integer;
      wTasa: double;
      sModo: String;
      Procedure AsignaLookup;
      Procedure AsignaDatasource;
      Procedure CargaDataSource;

   Public
      xDTRPorc: DOUBLE;
      xdblcTRegistroOP, xedtTRegistroOP, xdblcdCnpEgrOP, xdbeCuentaOP, xdbeGlosaOP, xdblcdCCosto, xedtCCosto, xdbeDetracOP: String;
   End;

Var
   FPlantillaDetalle: TFPlantillaDetalle;
   xSQL: String;
   xTemTReg: String;
   xTemCpto: String;
   xTemCta: String;
   xTemDH: String;
   xNuevoDet: boolean;

Implementation
Uses CxPDM, CXP291;
{$R *.dfm}

Procedure TFPlantillaDetalle.AsignaLookup;
Begin
   dbgDietaDirecto.Selected.Clear;
   dbgDietaDirecto.Selected.Add('CPTOID'#9'7'#9'Concepto'#9'F');
   dbgDietaDirecto.Selected.Add('CPTODES'#9'35'#9'Descripcion'#9'F');
   dbgDietaDirecto.Selected.Add('IMPORTE'#9'7'#9'Importe'#9'F');
   dbgDietaDirecto.Selected.Add('SUMRES'#9'5'#9'Suma/Resta'#9'F');
   dbgDietaDirecto.Selected.Add('VALOR'#9'5'#9'Afecto4ta.'#9'F');
End;

Procedure TFPlantillaDetalle.AsignaDatasource;
Var
   xSQL: String;
Begin
   xSQL := ' Select IDNUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, AFECTO4TA VALOR, FECCREA, FECMODIF, USUARIO, FREG, HREG '
      + '      from DB2ADMIN.CXP_PLANTILLAS_DET_CONCEPTO '
      + '     Where CIAID=' + quotedstr('02')
      + '       and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('IDNUMERO').AsString)
      + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('CLAUXID').AsString)
      + '       and PROV=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('PROV').AsString);
   DMCXP.cdsPlantillaDConcepto.Close;
   DMCXP.cdsPlantillaDConcepto.DataRequest(xSQL);
   DMCXP.cdsPlantillaDConcepto.Open;

   dbgDietaDirecto.DataSource := DMCXP.dsPlantillaDConcepto;
End;

Procedure TFPlantillaDetalle.FormShow(Sender: TObject);
Var
   ls_idNumero, ls_CodigoProv, ls_descripcion, ls_Cargo: String;
   xSQL: String;
   NoReg: String;
Begin
   lblnumero.caption := DMCXP.cdsPlantillaDet.fieldbyname('IDNUMERO').AsString;
   edtCodProv.text := DMCXP.cdsPlantillaDet.fieldbyname('PROV').AsString;
   edtDescripcionProv.text := DMCXP.cdsPlantillaDet.fieldbyname('PROVDES').AsString;
   edtCargo.text := DMCXP.cdsPlantillaDet.fieldbyname('DESCRIPCION').AsString;
   lblclauxid.caption := DMCXP.cdsPlantillaDet.fieldbyname('CLAUXID').AsString;

   AsignaLookup;
   AsignaDatasource;
End;

Procedure TFPlantillaDetalle.bbtnCancelarClick(Sender: TObject);
Begin
   pnlRegistro.Visible := False;
   DMCXP.cdsPlantillaDConcepto.Cancel;
End;

Procedure TFPlantillaDetalle.bbtnRegOkClick(Sender: TObject);
Var
   xSQL, xTipDet, xWhere, xConc4ta, xConcdes4ta: String;
   xDiferencia, xMontoOri, xIGVx, xTotMG, xTotTO, xCalc: Double;
   cdsClone: TwwClientDataSet;
   xRecord: Integer;
Begin
   If length(dblcdCnpEgr.Text) = 0 Then
   Begin
      dblcdCnpEgr.SetFocus;
      Raise Exception.Create('Debe Seleccionar el Concepto');
   End;
   If length(dbeImporte.Text) = 0 Then
   Begin
      dbeImporte.SetFocus;
      Raise Exception.Create('Debe Ingresar el Importe');
   End;
   If length(dbeSR.Text) = 0 Then
   Begin
      dbeSR.SetFocus;
      Raise Exception.Create('Debe seleccionar el signo del concepto');
   End;

   DMCXP.cdsPlantillaDConcepto.Edit;
   DMCXP.cdsPlantillaDConcepto.fieldbyname('IDNUMERO').AsString := lblNumero.caption;
   DMCXP.cdsPlantillaDConcepto.fieldbyname('CLAUXID').AsString := LBLCLAUXID.CAPTION;
   DMCXP.cdsPlantillaDConcepto.fieldbyname('PROV').AsString := edtCodProv.Text;
   DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTOID').AsString := dblcdCnpEgr.Text;
   DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTODES').AsString := edtConcepto.Text;
   DMCXP.cdsPlantillaDConcepto.fieldbyname('IMPORTE').AsFloat := StrToFloat(dbeImporte.Text);
   DMCXP.cdsPlantillaDConcepto.fieldbyname('SUMRES').AsString := dbeSR.Text;
   DMCXP.cdsPlantillaDConcepto.fieldbyname('VALOR').AsString := dblcAfecto.Text;
   DMCXP.cdsPlantillaDConcepto.fieldbyname('USUARIO').AsString := DMCXP.wUsuario;
   DMCXP.cdsPlantillaDConcepto.Post;

   xConc4ta := '4010704';
   xWhere := 'CPTOID=''' + xConc4ta + ''' ';
   xConcdes4ta := BuscaQry('dspTGE', 'CXP201', 'CPTODES', xWhere, 'CPTODES');

   If sModo = 'A' Then
   Begin
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      xSQL := ' Insert into DB2ADMIN.CXP_PLANTILLAS_DET_CONCEPTO( CIAID, IDNUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, AFECTO4TA, FECCREA, FECMODIF, USUARIO, FREG, HREG ) '
         + '    Values( ' + quotedstr('02') + ','
         + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('IDNUMERO').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CLAUXID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('PROV').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTOID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTODES').AsString) + ', '
         + floattostr(DMCXP.cdsPlantillaDConcepto.fieldbyname('IMPORTE').AsFloat) + ', '
         + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('SUMRES').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('VALOR').AsString) + ', '
         + '                trunc(sysdate),  '
         + '                sysdate,  '
         + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('USUARIO').AsString) + ', '
         + '                trunc(sysdate),  '
         + '                sysdate )';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo Insertar el Detalle de la Plantilla');
         exit;
      End;

      // Solo se inserta la renta de Cuarta si el Valor es "S"
      If DMCXP.cdsPlantillaDConcepto.fieldbyname('VALOR').AsString = 'S' Then
      Begin
         xWhere := '';
         xCalc := 0;

         xCalc := FRound((StrToFloat(dbeImporte.Text) * 0.08), 15, 2);
         DMCXP.cdsPlantillaDConcepto.Append;
         DMCXP.cdsPlantillaDConcepto.fieldbyname('IDNUMERO').AsString := lblNumero.caption;
         DMCXP.cdsPlantillaDConcepto.fieldbyname('CLAUXID').AsString := LBLCLAUXID.CAPTION;
         DMCXP.cdsPlantillaDConcepto.fieldbyname('PROV').AsString := edtCodProv.Text;
         DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTOID').AsString := xConc4ta;
         DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTODES').AsString := xConcdes4ta;
         DMCXP.cdsPlantillaDConcepto.fieldbyname('IMPORTE').AsFloat := xCalc;
         DMCXP.cdsPlantillaDConcepto.fieldbyname('SUMRES').AsString := '-';
         DMCXP.cdsPlantillaDConcepto.Post;

         xSQL := ' Insert into DB2ADMIN.CXP_PLANTILLAS_DET_CONCEPTO( CIAID, IDNUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, AFECTO4TA, FECCREA, FECMODIF, USUARIO, FREG, HREG ) '
            + '    Values( ' + quotedstr('02') + ','
            + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('IDNUMERO').AsString) + ', '
            + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CLAUXID').AsString) + ', '
            + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('PROV').AsString) + ', '
            + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTOID').AsString) + ', '
            + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTODES').AsString) + ', '
            + floattostr(DMCXP.cdsPlantillaDConcepto.fieldbyname('IMPORTE').AsFloat) + ', '
            + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('SUMRES').AsString) + ', '
            + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('VALOR').AsString) + ', '
            + '                trunc(sysdate),  '
            + '                sysdate,  '
            + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('USUARIO').AsString) + ', '
            + '                trunc(sysdate),  '
            + '                sysdate )';
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se pudo Insertar el registro de Cuarta Categoría');
            exit;
         End;
      End;

      // se Implementa la actualización de la tabla de detalle de la Plantilla

      xSQL := ' Select IDNUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, AFECTO4TA VALOR, FECCREA, FECMODIF, USUARIO, FREG, HREG '
         + '      from DB2ADMIN.CXP_PLANTILLAS_DET_CONCEPTO '
         + '     Where CIAID=' + quotedstr('02')
         + '       and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaDConcepto.FieldByName('IDNUMERO').AsString)
         + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlantillaDConcepto.FieldByName('CLAUXID').AsString)
         + '       and PROV=' + quotedstr(DMCXP.cdsPlantillaDConcepto.FieldByName('PROV').AsString);

      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      xTotTO := 0;
      If DMCXP.cdsQry.RECORDCOUNT > 0 Then
      Begin
         DMCXP.cdsQry.First;
         While Not DMCXP.cdsQry.Eof Do
         Begin
            If DMCXP.cdsQry.fieldbyname('SUMRES').AsString = '+' Then
               xTotTO := xTotTO + DMCXP.cdsQry.fieldbyname('IMPORTE').AsFloat
            Else
               xTotTO := xTotTO - DMCXP.cdsQry.fieldbyname('IMPORTE').AsFloat;

            DMCXP.cdsQry.Next;
         End;
         xSQL := ' Update DB2ADMIN.CXP_PLANTILLAS_DIETAS_DET '
            + '       set USUARIO = ' + quotedstr(DMCXP.wUsuario) + ','
            + '           MONTOT = ' + floattostr(xTotTO) + ', '
            + '           FREG = trunc(sysdate), '
            + '           HREG = sysdate '
            + '     where CIAID=' + quotedstr('02')
            + '       and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaDConcepto.FieldByName('IDNUMERO').AsString)
            + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlantillaDConcepto.FieldByName('CLAUXID').AsString)
            + '       and PROV=' + quotedstr(DMCXP.cdsPlantillaDConcepto.FieldByName('PROV').AsString);
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se puede Actualizar el importe del detalle de la Plantilla de Dieta');
            exit;
         End;
      End;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
   End
   Else
   Begin
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      xSQL := ' Update DB2ADMIN.CXP_PLANTILLAS_DET_CONCEPTO '
         + '       set CPTOID = ' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTOID').AsString) + ','
         + '           CPTODES = ' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTODES').AsString) + ','
         + '           IMPORTE = ' + floattostr(DMCXP.cdsPlantillaDConcepto.fieldbyname('IMPORTE').AsFloat) + ','
         + '           SUMRES = ' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('SUMRES').AsString) + ','
         + '           AFECTO4TA = ' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('VALOR').AsString) + ','
         + '           USUARIO = ' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('USUARIO').AsString) + ','
         + '           FECMODIF = sysdate, '
         + '           FREG = trunc(sysdate), '
         + '           HREG = sysdate '
         + '     Where CIAID=' + quotedstr('02')
         + '       and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('IDNUMERO').AsString)
         + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CLAUXID').AsString)
         + '       and PROV=' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('PROV').AsString)
         + '       and CPTOID=' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTOID').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede actualizar el Detalle de la Plantilla');
         exit;
      End;

      xSQL := ' Select IDNUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, AFECTO4TA VALOR, FECCREA, FECMODIF, USUARIO, FREG, HREG '
         + '      from DB2ADMIN.CXP_PLANTILLAS_DET_CONCEPTO '
         + '     Where CIAID=' + quotedstr('02')
         + '       and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaDConcepto.FieldByName('IDNUMERO').AsString)
         + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlantillaDConcepto.FieldByName('CLAUXID').AsString)
         + '       and PROV=' + quotedstr(DMCXP.cdsPlantillaDConcepto.FieldByName('PROV').AsString)
         + '       and CPTOID=' + quotedstr(xConc4ta);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;

      If DMCXP.cdsQry.RECORDCOUNT = 0 Then
      Begin
          // Solo se inserta la renta de Cuarta si el Valor es "S"
         If DMCXP.cdsPlantillaDConcepto.fieldbyname('VALOR').AsString = 'S' Then
         Begin
            xCalc := FRound((StrToFloat(dbeImporte.Text) * 0.08), 15, 2);
            DMCXP.cdsPlantillaDConcepto.Append;
            DMCXP.cdsPlantillaDConcepto.fieldbyname('IDNUMERO').AsString := lblNumero.caption;
            DMCXP.cdsPlantillaDConcepto.fieldbyname('CLAUXID').AsString := LBLCLAUXID.CAPTION;
            DMCXP.cdsPlantillaDConcepto.fieldbyname('PROV').AsString := edtCodProv.Text;
            DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTOID').AsString := xConc4ta;
            DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTODES').AsString := xConcdes4ta;
            DMCXP.cdsPlantillaDConcepto.fieldbyname('IMPORTE').AsFloat := xCalc;
            DMCXP.cdsPlantillaDConcepto.fieldbyname('SUMRES').AsString := '-';
            DMCXP.cdsPlantillaDConcepto.Post;

            xSQL := ' Insert into DB2ADMIN.CXP_PLANTILLAS_DET_CONCEPTO( CIAID, IDNUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, AFECTO4TA, FECCREA, FECMODIF, USUARIO, FREG, HREG ) '
               + '    Values( ' + quotedstr('02') + ','
               + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('IDNUMERO').AsString) + ', '
               + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CLAUXID').AsString) + ', '
               + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('PROV').AsString) + ', '
               + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTOID').AsString) + ', '
               + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTODES').AsString) + ', '
               + floattostr(DMCXP.cdsPlantillaDConcepto.fieldbyname('IMPORTE').AsFloat) + ', '
               + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('SUMRES').AsString) + ', '
               + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('VALOR').AsString) + ', '
               + '                trunc(sysdate),  '
               + '                sysdate,  '
               + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('USUARIO').AsString) + ', '
               + '                trunc(sysdate),  '
               + '                sysdate )';
            Try
               DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               DMCXP.DCOM1.AppServer.RetornaTransaccion;
               ShowMessage('No se pudo Insertar el registro de Cuarta Categoría');
               exit;
            End;
         End;
      End
      Else
      Begin
          // Solo se inserta la renta de Cuarta si el Valor es "S"
         If DMCXP.cdsPlantillaDConcepto.fieldbyname('VALOR').AsString = 'S' Then
         Begin
            xCalc := FRound((StrToFloat(dbeImporte.Text) * 0.08), 15, 2);
            DMCXP.cdsPlantillaDConcepto.Edit;
            DMCXP.cdsPlantillaDConcepto.fieldbyname('IDNUMERO').AsString := lblNumero.caption;
            DMCXP.cdsPlantillaDConcepto.fieldbyname('CLAUXID').AsString := LBLCLAUXID.CAPTION;
            DMCXP.cdsPlantillaDConcepto.fieldbyname('PROV').AsString := edtCodProv.Text;
            DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTOID').AsString := xConc4ta;
            DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTODES').AsString := xConcdes4ta;
            DMCXP.cdsPlantillaDConcepto.fieldbyname('IMPORTE').AsFloat := xCalc;
            DMCXP.cdsPlantillaDConcepto.fieldbyname('SUMRES').AsString := '-';
            DMCXP.cdsPlantillaDConcepto.Post;

            xSQL := ' Update DB2ADMIN.CXP_PLANTILLAS_DET_CONCEPTO '
               + '       set CPTOID = ' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTOID').AsString) + ','
               + '           CPTODES = ' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTODES').AsString) + ','
               + '           IMPORTE = ' + floattostr(DMCXP.cdsPlantillaDConcepto.fieldbyname('IMPORTE').AsFloat) + ','
               + '           SUMRES = ' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('SUMRES').AsString) + ','
               + '           AFECTO4TA = ' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('VALOR').AsString) + ','
               + '           USUARIO = ' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('USUARIO').AsString) + ','
               + '           FECMODIF = sysdate, '
               + '           FREG = trunc(sysdate), '
               + '           HREG = sysdate '
               + '     Where CIAID=' + quotedstr('02')
               + '       and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('IDNUMERO').AsString)
               + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CLAUXID').AsString)
               + '       and PROV=' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('PROV').AsString)
               + '       and CPTOID=' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTOID').AsString);

            Try
               DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               DMCXP.DCOM1.AppServer.RetornaTransaccion;
               ShowMessage('No se puede actualizar el Detalle Cuarta Categoria de la Plantilla');
               exit;
            End;
         End;
      End;

   // Se Implementa la Actualización del Importe del Detalle de la Plantilla
      xSQL := ' Select IDNUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, AFECTO4TA VALOR, FECCREA, FECMODIF, USUARIO, FREG, HREG '
         + '      from DB2ADMIN.CXP_PLANTILLAS_DET_CONCEPTO '
         + '     Where CIAID=' + quotedstr('02')
         + '       and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaDConcepto.FieldByName('IDNUMERO').AsString)
         + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlantillaDConcepto.FieldByName('CLAUXID').AsString)
         + '       and PROV=' + quotedstr(DMCXP.cdsPlantillaDConcepto.FieldByName('PROV').AsString);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      xTotTO := 0;
      If DMCXP.cdsQry.RECORDCOUNT > 0 Then
      Begin
         DMCXP.cdsQry.First;
         While Not DMCXP.cdsQry.Eof Do
         Begin
            If DMCXP.cdsQry.fieldbyname('SUMRES').AsString = '+' Then
               xTotTO := xTotTO + DMCXP.cdsQry.fieldbyname('IMPORTE').AsFloat
            Else
               xTotTO := xTotTO - DMCXP.cdsQry.fieldbyname('IMPORTE').AsFloat;

            DMCXP.cdsQry.Next;
         End;
         xSQL := ' Update DB2ADMIN.CXP_PLANTILLAS_DIETAS_DET '
            + '       set USUARIO = ' + quotedstr(DMCXP.wUsuario) + ','
            + '           MONTOT = ' + floattostr(xTotTO) + ', '
            + '           FREG = trunc(sysdate), '
            + '           HREG = sysdate '
            + '     Where CIAID=' + quotedstr('02')
            + '       and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaDConcepto.FieldByName('IDNUMERO').AsString)
            + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlantillaDConcepto.FieldByName('CLAUXID').AsString)
            + '       and PROV=' + quotedstr(DMCXP.cdsPlantillaDConcepto.FieldByName('PROV').AsString);
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se puede Actualizar el importe del detalle de la Plantilla de Dieta');
            exit;
         End;
      End;

      DMCXP.DCOM1.AppServer.GrabaTransaccion;
   End;

   pnlRegistro.Visible := False;

   AsignaDatasource;

End;

Procedure TFPlantillaDetalle.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFPlantillaDetalle.FormCreate(Sender: TObject);
Var
   xSQL, xSQL1: String;
Begin
   xSQL := '';
   xSQL := ' Select CPTOID,CPTODES,CUENTAID,NIVELMOV,DIETA_DIREC '
      + '      from CXP201 '
      + '     where NIVELMOV=' + quotedstr('S')
      + '       and DIETA_DIREC =' + quotedstr('S');
   DMCXP.cdsCnpEgr.Close;
   DMCXP.cdsCnpEgr.DataRequest(xSQL);
   DMCXP.cdsCnpEgr.open;
   DMCXP.cdsCnpEgr.Filter := '';
   DMCXP.cdsCnpEgr.Filtered := False;
   DMCXP.cdsCnpEgr.IndexFieldNames := 'CPTOID';

   DMCXP.FiltraTabla(DMCXP.cdsCondicional, 'TGE801', 'VALOR');

   dblcAfecto.Selected.Clear;
   dblcAfecto.Selected.Add('VALOR'#9'3'#9'Id~Valor.'#9'F');
   dblcAfecto.Selected.Add('DESCRIP'#9'10'#9'Descripcion.'#9'F');

   CargaDataSource;
End;

Procedure TFPlantillaDetalle.CargaDataSource;
Begin

   dblcdCnpEgr.DataSource := DMCXP.dsPlantillaDConcepto;
   dblcdCnpEgr.LookupTable := DMCXP.cdsCnpEgr;

   dblcAfecto.DataSource := DMCXP.dsPlantillaDConcepto;
   dblcAfecto.LookupTable := DMCXP.cdsCondicional;

   dbgDietaDirecto.DataSource := DMCXP.dsPlantillaDConcepto;
End;

Procedure TFPlantillaDetalle.dblcdCnpEgrExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CPTOID=''' + dblcdCnpEgr.Text + ''' ';

   edtConcepto.Text := BuscaQry('dspTGE', 'CXP201', 'CPTODES', xWhere, 'CPTODES');

   If length(edtConcepto.Text) = 0 Then
   Begin
      edtConcepto.Text := '';
      ShowMessage('Concepto NO está Activo');
      Exit;
   End;
End;

Procedure TFPlantillaDetalle.btnActRegClick(Sender: TObject);
Begin
   dblcdCnpEgr.Enabled := True;
   pnlRegistro.Visible := True;
   pnlRegistro.BringToFront;

   sModo := 'A';

   dblcdCnpEgr.Text := '';
   edtConcepto.Text := '';
   dbeImporte.Text := '';
   dbeSR.Text := '';
   dblcAfecto.Text := '';

   DMCXP.cdsPlantillaDConcepto.Append;
End;

Procedure TFPlantillaDetalle.dbgDietaDirectoDblClick(Sender: TObject);
Begin
   sModo := 'M';

   If DMCXP.cdsPlantillaDConcepto.RECORDCOUNT > 0 Then
   Begin
      pnlRegistro.Visible := True;
      pnlRegistro.BringToFront;
      dblcdCnpEgr.Text := DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTOID').AsString;
      dblcdCnpEgrExit(Self);
      dbeImporte.Text := floattostr(DMCXP.cdsPlantillaDConcepto.fieldbyname('IMPORTE').AsFloat);
      dbeSR.Text := DMCXP.cdsPlantillaDConcepto.fieldbyname('SUMRES').AsString;
      dblcAfecto.Text := DMCXP.cdsPlantillaDConcepto.fieldbyname('VALOR').AsString;
      If DMCXP.cdsPlantillaDConcepto.fieldbyname('CPTOID').AsString <> '4010704' Then
      Begin
         dblcdCnpEgr.Enabled := False;
         dbeimporte.Enabled := True;
         dbeSR.Enabled := True;
         dblcAfecto.Enabled := True;
         dbeImporte.setfocus;
         bbtnRegOk.Enabled := True;
      End
      Else
      Begin
         dblcdCnpEgr.Enabled := False;
         dbeimporte.Enabled := False;
         dbeSR.Enabled := False;
         dblcAfecto.Enabled := False;
         bbtnRegOk.Enabled := False;
      End;
   End;
End;

Procedure TFPlantillaDetalle.dbgDietaDirectoKeyDown(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Var
   xTotTO: Double;
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg('Al tratarse del detalle de Conceptos, se eliminarán TODOS los registros ¿Continuar? ',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         xSQL := 'Delete from DB2ADMIN.CXP_PLANTILLAS_DET_CONCEPTO '
            + '    Where CIAID=' + quotedstr('02')
            + '      and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('IDNUMERO').AsString)
            + '      and CLAUXID=' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('CLAUXID').AsString)
            + '      and PROV=' + quotedstr(DMCXP.cdsPlantillaDConcepto.fieldbyname('PROV').AsString);
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se puede Eliminar el detalle de Conceptos del Directivo');
            exit;
         End;
         xSQL := 'Select IDNUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, AFECTO4TA VALOR, FECCREA, FECMODIF, USUARIO, FREG, HREG '
            + '     from DB2ADMIN.CXP_PLANTILLAS_DET_CONCEPTO '
            + '    where CIAID=' + quotedstr('02')
            + '      and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('IDNUMERO').AsString)
            + '      and CLAUXID=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('CLAUXID').AsString)
            + '      and PROV=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('PROV').AsString);
         DMCXP.cdsPlantillaDConcepto.Close;
         DMCXP.cdsPlantillaDConcepto.DataRequest(xSQL);
         DMCXP.cdsPlantillaDConcepto.Open;

         xTotTO := 0;
         If DMCXP.cdsPlantillaDConcepto.RECORDCOUNT > 0 Then
         Begin
            DMCXP.cdsPlantillaDConcepto.First;
            While Not DMCXP.cdsPlantillaDConcepto.Eof Do
            Begin
               If DMCXP.cdsPlantillaDConcepto.fieldbyname('SUMRES').AsString = '+' Then
                  xTotTO := xTotTO + DMCXP.cdsPlantillaDConcepto.fieldbyname('IMPORTE').AsFloat
               Else
                  xTotTO := xTotTO - DMCXP.cdsPlantillaDConcepto.fieldbyname('IMPORTE').AsFloat;

               DMCXP.cdsPlantillaDConcepto.Next;
            End;
         End;
         xSQL := ' Update DB2ADMIN.CXP_PLANTILLAS_DIETAS_DET '
            + '       set USUARIO = ' + quotedstr(DMCXP.wUsuario) + ','
            + '           MONTOT = ' + floattostr(xTotTO) + ', '
            + '           FREG = trunc(sysdate), '
            + '           HREG = sysdate '
            + '     Where CIAID=' + quotedstr('02')
            + '       and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('IDNUMERO').AsString)
            + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('CLAUXID').AsString)
            + '       and PROV=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('PROV').AsString);
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se puede Actualizar el importe del detalle de la Plantilla de Dieta');
            exit;
         End;

         DMCXP.DCOM1.AppServer.GrabaTransaccion;
         AsignaDatasource;
      End;
   End;
End;

Procedure TFPlantillaDetalle.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   FPlantillaDieta.AsignaDatasource;
End;

Procedure TFPlantillaDetalle.dbeImporteExit(Sender: TObject);
Var
   xContador: Integer;
Begin
   If length(dbeImporte.Text) = 0 Then
   Begin
      Showmessage('Debe ingresar un valor (>0) para el Importe');
      dbeImporte.SetFocus;
      Exit;
   End;

   If length(dbeImporte.Text) <> length(trim(dbeImporte.Text)) Then
      dbeImporte.Text := trim(dbeImporte.Text);

   xContador := 1;
   While xContador <= length(dbeImporte.Text) Do
   Begin
// Inicio HPC_201804_CXP
// incluye el punto decimal en la validación
      If (copy(dbeImporte.Text, xContador, 1) <> '0') And (copy(dbeImporte.Text, xContador, 1) <> '1') And (copy(dbeImporte.Text, xContador, 1) <> '2')
         And (copy(dbeImporte.Text, xContador, 1) <> '3') And (copy(dbeImporte.Text, xContador, 1) <> '4') And (copy(dbeImporte.Text, xContador, 1) <> '5')
         And (copy(dbeImporte.Text, xContador, 1) <> '6') And (copy(dbeImporte.Text, xContador, 1) <> '7') And (copy(dbeImporte.Text, xContador, 1) <> '8')
         And (copy(dbeImporte.Text, xContador, 1) <> '9') And (copy(dbeImporte.Text, xContador, 1) <> '.')Then
// Fin HPC_201804_CXP
      Begin
         ShowMessage('Sólo se permiten datos numéricos');
         dbeImporte.Text := '';
         dbeImporte.SetFocus;
         Exit;
      End;
      xContador := xContador + 1;
   End;

   If strtofloat(dbeImporte.Text) <= 0 Then
   Begin
      Showmessage('debe ser un importe mayor a cero');
      dbeImporte.SetFocus;
      Exit;
   End;
End;

Procedure TFPlantillaDetalle.dbeSRExit(Sender: TObject);
Begin
   If (dbeSR.Text <> '+') And (dbeSR.Text <> '-') Then
   Begin
      Showmessage('Sólo se permite registra + ó -');
      dbeSR.SetFocus;
      Exit;
   End;
End;

Procedure TFPlantillaDetalle.dblcAfectoExit(Sender: TObject);
Begin
   If (dblcAfecto.Text <> 'S') And (dblcAfecto.Text <> 'N') Then
   Begin
      Showmessage('Sólo se permite registra S ó N');
      dblcAfecto.SetFocus;
      Exit;
   End;
End;

End.

