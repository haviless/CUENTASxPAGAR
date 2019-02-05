Unit CXP291;
//*********************************************************
// CREADO     POR   : Christian Flores Rodríguez
// Nº HPC           : HPC_201801_CXP
// FECHA DE MODIF.  : 30/01/2018
// DESCRIPCION      : Plantilla de Dietas de Directorio
//
//*********************************************************

// Actualizaciones
// HPC_201801_CXP  29/01/2018 Inicio de Formulario

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Buttons, Wwdbigrd, Grids, Wwdbgrid, StdCtrls, Wwkeycb, ExtCtrls, wwdblook, DB,
   Mask, wwdbedit, Wwdbdlg, DBClient, wwclient;

Type
   TFPlantillaDieta = Class(TForm)
      dbgDietaDirecto: TwwDBGrid;
      btnActReg: TwwIButton;
      pnlDetalle: TPanel;
      Label1: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      edtDescripcionPlant: TEdit;
      Label3: TLabel;
      meNoReg: TwwDBEdit;
      bbtnRegCanc: TBitBtn;
      Label7: TLabel;
      pnlRegistro: TPanel;
      lblTipReg: TLabel;
      lblCnpEgr: TLabel;
      lblCCosto: TLabel;
      lblGlosa: TLabel;
      lblTipPre: TLabel;
      lblPresu: TLabel;
      edtTipReg: TEdit;
      dbeTM: TwwDBEdit;
      bbtnRegOk: TBitBtn;
      bbtnCanc: TBitBtn;
      edtProv: TwwDBEdit;
      dbeGlosa: TwwDBEdit;
      StaticText1: TStaticText;
      dblcdCargo: TwwDBLookupComboDlg;
      dblcdProv: TwwDBLookupComboDlg;
      dblcBanco: TwwDBLookupCombo;
      dbeBanco: TEdit;
      dblcTMon: TwwDBLookupCombo;
      edtTMon: TEdit;
      dblcdCCosto: TwwDBLookupComboDlg;
      edtCCosto: TEdit;
      bbtnOK: TBitBtn;
      lblTDoc: TLabel;
      dblcTDoc: TwwDBLookupCombo;
      edtTDoc: TEdit;
      lblSerie: TLabel;
      edtSerie: TwwDBEdit;
      dblcClAux: TwwDBLookupCombo;
      edtCuenta: TEdit;
      bbtnImportDetalles: TBitBtn;
      Procedure FormShow(Sender: TObject);
      Procedure bbtnRegCancClick(Sender: TObject);
      Procedure bbtnRegOkClick(Sender: TObject);
      Procedure dblcdCCostoExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcTMonExit(Sender: TObject);
      Procedure bbtnOKClick(Sender: TObject);
      Procedure dblcBancoExit(Sender: TObject);
      Procedure bbtnCancClick(Sender: TObject);
      Procedure dblcTMonEnter(Sender: TObject);
      Procedure btnActRegClick(Sender: TObject);
      Procedure dblcClAuxExit(Sender: TObject);
      Procedure dblcdProvExit(Sender: TObject);
      Procedure dblcdCargoExit(Sender: TObject);
      Procedure dblcTDocExit(Sender: TObject);
      Procedure dbgDietaDirectoDblClick(Sender: TObject);
      Procedure bbtnImportDetallesClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure edtSerieExit(Sender: TObject);
      Procedure dbgDietaDirectoKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);

   Private
      xGlosaRep, xCta_Ccos, xDistri: String;
      numreg: Integer;
      wTasa: double;
      xModo: String;
      Procedure AsignaLookup;

      Procedure RecuperaDocumentos(pCiaid, pProveedor: String);
      Procedure CargaDataSource;

   Public
      xDTRPorc: DOUBLE;
      xdblcTRegistroOP, xedtTRegistroOP, xdblcdCnpEgrOP, xdbeCuentaOP, xdbeGlosaOP, xdblcdCCosto, xedtCCosto, xdbeDetracOP: String;
      Procedure AsignaDatasource;
   End;

Var
   FPlantillaDieta: TFPlantillaDieta;
   xSQL: String;
   xTemTReg: String;
   xTemCpto: String;
   xTemCta: String;
   xTemDH: String;
   xNuevoDet: boolean;

Implementation
Uses CxPDM, CxP001, CXP292;
{$R *.dfm}

Procedure TFPlantillaDieta.AsignaLookup;
Begin
   dbgDietaDirecto.Selected.Clear;
   dbgDietaDirecto.Selected.Add('CLAUXID'#9'2'#9'Clase~Aux.'#9'F');
   dbgDietaDirecto.Selected.Add('PROV'#9'7'#9'Id.~Prov.'#9'F');
   dbgDietaDirecto.Selected.Add('PROVDES'#9'30'#9'Nombre'#9'F');
   dbgDietaDirecto.Selected.Add('DESCRIPCION'#9'10'#9'Cargo'#9'F');
   dbgDietaDirecto.Selected.Add('MONTOT'#9'7'#9'Importe~Total'#9'F');
   dbgDietaDirecto.Selected.Add('BANCOID'#9'3'#9'Banco'#9'F');
   dbgDietaDirecto.Selected.Add('BANCONOM'#9'15'#9'Nombre~del Banco'#9'F');
   dbgDietaDirecto.Selected.Add('CCBCOID'#9'17'#9'Cta.Cte.'#9'F');
   dbgDietaDirecto.ApplySelected;
End;

Procedure TFPlantillaDieta.AsignaDatasource;
Var
   xWhere: String;
Begin
   xWhere := ' Select C.CIAID, C.IDNUMERO, C.CLAUXID, C.PROV, C.PROVDES, C.CARGO IDCARGO, D.DESCRIPCION, C.DOCID, '
      + '             C.CPSERIE, C.CPNODOC, C.MONTOT, C.BANCOID, B.BANCONOM, C.CCBCOID, C.TMONID, C.FECCREA, '
      + '             C.FECMODIF, C.USUARIO, C.FREG, C.HREG '
      + '        from CXP_PLANTILLAS_DIETAS_DET C INNER JOIN CXP_CARGOS_DIRECT D ON C.CARGO = D.IDCARGO '
      + '       inner JOIN TGE105 B ON C.BANCOID = B.BANCOID '
      + '       Where CIAID=' + quotedstr('02')
      + '         and C.IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaCab.FieldByName('IDNUMERO').AsString)
      + '       order by C.CLAUXID, C.PROV ';
   DMCXP.cdsPlantillaDet.Close;
   DMCXP.cdsPlantillaDet.DataRequest(xWhere);
   DMCXP.cdsPlantillaDet.Open;
End;

Procedure TFPlantillaDieta.RecuperaDocumentos(pCiaid, pProveedor: String);
Begin

End;

Procedure TFPlantillaDieta.FormShow(Sender: TObject);
Var
   ls_idNumero, ls_descripcion, ls_CCosto, ls_Moneda: String;
   xSQL: String;
   NoReg: String;
Begin
   ls_idNumero := DMCXP.cdsPlantillaCab.fieldbyname('IDNUMERO').AsString;
   ls_descripcion := DMCXP.cdsPlantillaCab.fieldbyname('DESCRIPCION').AsString;
   ls_CCosto := DMCXP.cdsPlantillaCab.fieldbyname('CCOSID').AsString;
   ls_Moneda := DMCXP.cdsPlantillaCab.fieldbyname('TMONID').AsString;

   meNoReg.Text := '';
   edtDescripcionPlant.Text := '';
   dblcdCCosto.Text := '';
   dblcTMon.Text := '';
   edtCCosto.Text := '';
   edtTMon.Text := '';

   If DMCXP.wModo = 'A' Then
   Begin
      NoReg := '';
      NoReg := DMCXP.UltimoRegistroPlantilla;
      NoReg := Strzero(NoReg, DMCXP.cdsPlantillaCab.fieldbyname('IDNUMERO').Size);
      meNoReg.Text := NoReg;
      edtDescripcionPlant.Text := '';
      dblcdCCosto.Text := '';
      dblcTMon.Text := '';
   End
   Else
   Begin
      meNoReg.Text := ls_idNumero;
      edtDescripcionPlant.Text := ls_descripcion;
      dblcdCCosto.Text := ls_CCosto;
      dblcdCCostoExit(Self);
      dblcTMon.Text := ls_Moneda;
      dblcTMonExit(Self);

   End;

   AsignaLookup;
   AsignaDatasource;

End;

Procedure TFPlantillaDieta.bbtnRegCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFPlantillaDieta.bbtnRegOkClick(Sender: TObject);
Var
   xSQL, xTipDet, xWhere: String;
   xDiferencia, xMontoOri, xIGVx, xTotMG, xTotTO, xCalc: Double;
   cdsClone: TwwClientDataSet;
   xRecord: Integer;
Begin

   If length(dblcClAux.Text) = 0 Then
   Begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Debe Seleccionar la Clase Auxiliar');
   End;
   If length(dblcdProv.Text) = 0 Then
   Begin
      dblcdProv.SetFocus;
      Raise Exception.Create('Debe seleccionar Personal del Directorio');
   End;
   If length(dblcdCargo.Text) = 0 Then
   Begin
      dblcdCargo.SetFocus;
      Raise Exception.Create('Debe seleccionar el Cargo del Directorio');
   End;
   If length(dblcBanco.Text) = 0 Then
   Begin
      dblcBanco.SetFocus;
      Raise Exception.Create('Debe seleccionar el Banco');
   End;
   If length(edtCuenta.Text) = 0 Then
   Begin
      dblcBanco.SetFocus;
      Raise Exception.Create('El Banco debe tener Cuenta Bancaria');
   End;
   If length(dblcTDoc.Text) = 0 Then
   Begin
      dblcTDoc.SetFocus;
      Raise Exception.Create('Debe seleccionar Tipo de Documento');
   End;
   If length(edtSerie.Text) = 0 Then
   Begin
      edtSerie.SetFocus;
      Raise Exception.Create('Debe ingresar la Serie del Documento');
   End;
   DMCXP.cdsPlantillaDet.Edit;
   DMCXP.cdsPlantillaDet.fieldbyname('CIAID').AsString := '02';
   DMCXP.cdsPlantillaDet.fieldbyname('IDNUMERO').AsString := meNoReg.Text;
   DMCXP.cdsPlantillaDet.fieldbyname('CLAUXID').AsString := dblcClAux.Text;
   DMCXP.cdsPlantillaDet.fieldbyname('PROV').AsString := dblcdProv.Text;
   DMCXP.cdsPlantillaDet.fieldbyname('PROVDES').AsString := edtProv.Text;
   DMCXP.cdsPlantillaDet.fieldbyname('IDCARGO').AsString := dblcdCargo.Text;
   DMCXP.cdsPlantillaDet.fieldbyname('DESCRIPCION').AsString := dbeGlosa.Text;
   DMCXP.cdsPlantillaDet.fieldbyname('DOCID').AsString := dblcTDoc.Text;
   DMCXP.cdsPlantillaDet.fieldbyname('CPSERIE').AsString := edtSerie.Text;
   DMCXP.cdsPlantillaDet.fieldbyname('MONTOT').AsFloat := 0;
   DMCXP.cdsPlantillaDet.fieldbyname('BANCOID').AsString := dblcBanco.Text;
   DMCXP.cdsPlantillaDet.fieldbyname('CCBCOID').AsString := edtCuenta.Text;
   DMCXP.cdsPlantillaDet.fieldbyname('TMONID').AsString := dbeTM.Text;
   DMCXP.cdsPlantillaDet.fieldbyname('USUARIO').AsString := DMCXP.wUsuario;
   DMCXP.cdsPlantillaDet.Post;

   If xModo = 'A' Then
   Begin
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      xSQL := ' Insert into DB2ADMIN.CXP_PLANTILLAS_DIETAS_DET( CIAID, IDNUMERO, CLAUXID, PROV, PROVDES, CARGO, DOCID, CPSERIE, MONTOT, BANCOID, CCBCOID, TMONID, FECCREA, FECMODIF, USUARIO, FREG, HREG ) '
         + '    Values( ' + quotedstr('02') + ','
         + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('IDNUMERO').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('CLAUXID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('PROV').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('PROVDES').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('IDCARGO').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('DOCID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('CPSERIE').AsString) + ', '
         + '                0, '
         + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('BANCOID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('CCBCOID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('TMONID').AsString) + ', '
         + '                trunc(sysdate),  '
         + '                sysdate,  '
         + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('USUARIO').AsString) + ', '
         + '                trunc(sysdate),  '
         + '                sysdate )';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo Insertar el Detalle de la Plantilla');
         exit;
      End;

      DMCXP.DCOM1.AppServer.GrabaTransaccion;
      xModo := 'M';
   End
   Else
   Begin
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      xSQL := ' Update DB2ADMIN.CXP_PLANTILLAS_DIETAS_DET '
         + '       set CARGO = ' + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('IDCARGO').AsString) + ','
         + '           DOCID = ' + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('DOCID').AsString) + ','
         + '           CPSERIE = ' + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('CPSERIE').AsString) + ','
         + '           BANCOID = ' + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('BANCOID').AsString) + ','
         + '           CCBCOID = ' + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('CCBCOID').AsString) + ','
         + '           TMONID = ' + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('TMONID').AsString) + ','
         + '           USUARIO = ' + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('USUARIO').AsString) + ','
         + '           FECMODIF = sysdate, '
         + '           FREG = trunc(sysdate), '
         + '           HREG = sysdate '
         + '     Where CIAID=' + quotedstr('02')
         + '       and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('IDNUMERO').AsString)
         + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('CLAUXID').AsString)
         + '       and PROV=' + quotedstr(DMCXP.cdsPlantillaDet.fieldbyname('PROV').AsString);

      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede actualizar el Detalle de la Plantilla');
         exit;
      End;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
   End;

   pnlRegistro.Visible := False;
   AsignaDatasource;
End;

Procedure TFPlantillaDieta.dblcTMonEnter(Sender: TObject);
Var
   xSQL: String;
Begin
   DMCXP.cdsTMon.Filter := '';
   xSQL := 'Select TMONID,TMONDES from TGE103 where 1=1 ';
   Filtracds(DMCXP.cdsTMon, xSQL);
   dblcTMon.LookupField := 'TMONID';
   dblcTMon.LookupTable := DMCXP.cdsTMon;
End;

Procedure TFPlantillaDieta.dblcdCCostoExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CCOSID=''' + dblcdCCosto.Text + ''' and CCOSMOV=''S'' AND CCOSACT=''S'' '
      + ' and CCOSCIAS LIKE (' + quotedstr('%02%') + ' )';
   edtCCosto.Text := BuscaQry('dspTGE', 'TGE203', 'CCOSDES', xWhere, 'CCOSDES');

   If length(edtCCosto.Text) = 0 Then
   Begin
      edtCCosto.Text := '';
      ShowMessage('Centro de Costo NO esta Activo');
      dblcdCCosto.setfocus;
      Exit;
   End;
End;

Procedure TFPlantillaDieta.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFPlantillaDieta.FormCreate(Sender: TObject);
Var
   xSQL, xSQL1: String;
Begin
   xSQL := '';
   xSQL1 := '';
   xSQL := 'Select CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV '
      + '     from TGE203 '
      + '    where CCOSMOV=' + quotedstr('S')
      + '      and CCOSCIAS LIKE (' + quotedstr('%02%') + ' ) '
      + '      and CCOSACT=''S''';
   DMCXP.cdsCCosto.Close;
   DMCXP.cdsCCosto.DataRequest(xSQL);
   DMCXP.cdsCCosto.open;
   DMCXP.cdsCCosto.Filter := '';
   DMCXP.cdsCCosto.Filtered := False;
   DMCXP.cdsCCosto.IndexFieldNames := 'CCOSID';

   DMCXP.FiltraTabla(DMCXP.cdsTDoc, 'TGE110', 'DOCID');
   DMCXP.FiltraTabla(DMCXP.cdsTMon, 'TGE103', 'TMONID');
   DMCXP.FiltraTabla(DMCXP.cdsClAux, 'TGE102', 'CLAUXID');
   DMCXP.FiltraTabla(DMCXP.cdsCargDirect, 'CXP_CARGOS_DIRECT', 'IDCARGO');
   dblcdCargo.Selected.Clear;
   dblcdCargo.Selected.Add('IDCARGO'#9'2'#9'Id~Cargo.'#9'F');
   dblcdCargo.Selected.Add('DESCRIPCION'#9'5'#9'Descripción'#9'F');
   CargaDataSource;
End;

Procedure TFPlantillaDieta.CargaDataSource;
Begin

   meNoReg.DataSource := Nil;

   dblcTMon.DataSource := DMCXP.dsPlantillaCab;
   dblcTMon.LookupTable := DMCXP.cdsTMon;

   dblcdCCosto.DataSource := DMCXP.dsPlantillaCab;
   dblcdCCosto.LookupTable := DMCXP.cdsCCosto;
// Detalle de la Plantilla de Dieta

   dblcClAux.DataSource := DMCXP.dsPlantillaDet;
   dblcClAux.LookupTable := DMCXP.cdsClAux;
   dblcdProv.DataSource := DMCXP.dsPlantillaDet;
   dblcdProv.LookupTable := DMCXP.cdsProv;
   dblcTDoc.DataSource := DMCXP.dsPlantillaDet;
   dblcTDoc.LookupTable := DMCXP.cdsTDoc;
   edtSerie.DataSource := DMCXP.dsPlantillaDet;

   dblcdCargo.DataSource := DMCXP.dsPlantillaDet;
   dblcdCargo.LookupTable := DMCXP.cdsCargDirect;

   dblcBanco.DataSource := DMCXP.dsPlantillaDet;
   dblcBanco.LookupTable := DMCXP.cdsBanco;

   dbgDietaDirecto.DataSource := DMCXP.dsPlantillaDet;

End;

Procedure TFPlantillaDieta.dblcTMonExit(Sender: TObject);
Var
   xWhere, xTipo: String;
Begin
   Screen.Cursor := crHourGlass;

   xWhere := 'TMONID=' + '''' + dblcTMon.Text + '''';
   edtTMon.Text := BuscaQry('PrvTGE', 'TGE103', 'TMONDES, TMON_LOC', xWhere, 'TMONDES');
   Screen.Cursor := crDefault;
   If length(edtTMon.Text) = 0 Then
   Begin
      ShowMessage('Falta Tipo de Moneda');
      dblcTMon.SetFocus;
      exit;
   End;

   Screen.Cursor := crDefault;
End;

Procedure TFPlantillaDieta.bbtnOKClick(Sender: TObject);
Begin
   DMCXP.cdsPlantillaCab.Edit;
   DMCXP.cdsPlantillaCab.fieldbyname('IDNUMERO').AsString := meNoReg.Text;
   DMCXP.cdsPlantillaCab.fieldbyname('DESCRIPCION').AsString := edtDescripcionPlant.Text;
   DMCXP.cdsPlantillaCab.fieldbyname('CCOSID').AsString := dblcdCCosto.Text;
   DMCXP.cdsPlantillaCab.fieldbyname('TMONID').AsString := dblcTMon.Text;
   DMCXP.cdsPlantillaCab.fieldbyname('USUARIO').AsString := DMCXP.wUsuario;
   DMCXP.cdsPlantillaCab.Post;

   If DMCXP.wModo = 'A' Then
   Begin
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      xSQL := ' Insert into DB2ADMIN.CXP_PLANT_DIETAS_CAB(CIAID, IDNUMERO, DESCRIPCION, CCOSID, TMONID, FECCREA, FECMODIF, '
         + '                                              USUARIO, FREG, HREG ) '
         + '    Values( ' + quotedstr('02') + ', '
         + quotedstr(DMCXP.cdsPlantillaCab.fieldbyname('IDNUMERO').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaCab.fieldbyname('DESCRIPCION').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaCab.fieldbyname('CCOSID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlantillaCab.fieldbyname('TMONID').AsString) + ', '
         + '                trunc(sysdate),  '
         + '                sysdate,  '
         + quotedstr(DMCXP.cdsPlantillaCab.fieldbyname('USUARIO').AsString) + ', '
         + '                trunc(sysdate),  '
         + '                sysdate)';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo Insertar la Cabecera de la Plantilla');
         exit;
      End;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
      DMCXP.wModo := 'M';
   End
   Else
   Begin
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      xSQL := ' Update DB2ADMIN.CXP_PLANT_DIETAS_CAB '
         + '       set DESCRIPCION = ' + quotedstr(DMCXP.cdsPlantillaCab.fieldbyname('DESCRIPCION').AsString) + ','
         + '           CCOSID = ' + quotedstr(DMCXP.cdsPlantillaCab.fieldbyname('CCOSID').AsString) + ','
         + '           TMONID = ' + quotedstr(DMCXP.cdsPlantillaCab.fieldbyname('TMONID').AsString) + ','
         + '           USUARIO = ' + quotedstr(DMCXP.cdsPlantillaCab.fieldbyname('USUARIO').AsString) + ','
         + '           FECMODIF = sysdate, '
         + '           FREG = trunc(sysdate), '
         + '           HREG = sysdate '
         + '     Where CIAID=' + quotedstr('02')
         + '       and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaCab.fieldbyname('IDNUMERO').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede Actualizar la cabecera de la Plantilla');
         exit;
      End;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
   End;
   dbgDietaDirecto.Enabled := True;
   btnActReg.Enabled := True;
End;

Procedure TFPlantillaDieta.dblcBancoExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If bbtnCanc.Focused Then Exit;

   If length(trim(dblcBanco.Text)) = 0 Then
   Begin
      ShowMessage('Indique el Banco del Directivo');
      dblcBanco.SetFocus;
      Exit;
   End;

   DMCXP.cdsBanco.SetKey;
   DMCXP.cdsBanco.FieldByName('BANCOID').AsString := dblcBanco.Text;
   If Not DMCXP.cdsBanco.GotoKey Then
   Begin
      ShowMessage('Código de Banco errado para Directivo, reintente');
      dblcBanco.SetFocus;
      Exit;
   End;

   dbeBanco.Text := DMCXP.cdsBanco.FieldByName('BANCONOM').AsString;
   edtCuenta.Text := DMCXP.cdsBanco.FieldByName('CCBCOID').AsString;
   dbeTM.Text := DMCXP.cdsBanco.FieldByName('TMONID').AsString;
End;

Procedure TFPlantillaDieta.bbtnCancClick(Sender: TObject);
Begin
   pnlRegistro.Visible := False;

   If xModo = 'A' Then
      DMCXP.cdsPlantillaDet.Delete
   Else
   Begin
      DMCXP.cdsPlantillaDet.Cancel;
   End;
End;

Procedure TFPlantillaDieta.btnActRegClick(Sender: TObject);
Begin
   pnlRegistro.Visible := True;
   pnlRegistro.BringToFront;
   pnlRegistro.SetFocus;
   dblcClAux.Enabled := True;
   dblcdProv.Enabled := True;
   dblcClAux.setfocus;
   xModo := 'A';

   dblcClAux.Text := '';
   edtTipReg.Text := '';
   dblcdProv.Text := '';
   edtProv.Text := '';
   dblcdCargo.Text := '';
   dbeGlosa.Text := '';
   dblcBanco.Text := '';
   dbeBanco.Text := '';
   edtCuenta.Text := '';
   dbeTM.Text := '';
   dblcTDoc.Text := '';
   edtTDoc.Text := '';
   edtSerie.Text := '';

   DMCXP.cdsPlantillaDet.Append;
End;

Procedure TFPlantillaDieta.dblcClAuxExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If bbtnCanc.Focused Then Exit;

   If length(trim(dblcClAux.Text)) = 0 Then
   Begin
      ShowMessage('Indique la Clase de Auxiliar del Directivo');
      dblcClAux.SetFocus;
      Exit;
   End;

   xWhere := 'CLAUXID=' + quotedstr(dblcClAux.Text);
   edtTipReg.Text := BuscaQry('dspTGE', 'TGE102', 'CLAUXID, CLAUXDES', xWhere, 'CLAUXDES');
   If length(trim(edtTipReg.Text)) = 0 Then
   Begin
      ShowMessage('Código de la Clase de Auxiliar del Directivo inválido, reintente');
      dblcClAux.SetFocus;
      Exit;
   End;

   xWhere := 'Select CLAUXID, PROV, PROVRUC, PROVDES, PROVABR, PROVNOMCOM, PROVRETIGV, PAISID, PROVDIR, '
      + '            PROVCZIP, PROVTELF, PROVFAX, PROVEMAI, CONVDOBTRI '
      + '       from TGE201 '
      + '      where CLAUXID = ' + quotedstr(dblcClAux.Text)
      + '        and NVL(ACTIVO,''N'')=''S'' ';
   Filtracds(DMCXP.cdsProv, xWhere);
End;

Procedure TFPlantillaDieta.dblcdProvExit(Sender: TObject);
Var
   xWhere, xSQL1: String;
Begin
   If bbtnCanc.Focused Then Exit;

   If length(trim(dblcdProv.Text)) = 0 Then
   Begin
      ShowMessage('Indique el Código del Directivo');
      dblcdProv.SetFocus;
      Exit;
   End;

   xWhere := 'CLAUXID=' + quotedstr(dblcClAux.Text)
      + ' and PROV=' + quotedstr(dblcdProv.Text);
   edtProv.Text := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV, ACTIVO, ESDOMIC', xWhere, 'PROVDES');
   If length(trim(edtProv.Text)) = 0 Then
   Begin
      ShowMessage('Código de Proveedor del Directivo inválido, reintente');
      dblcdProv.SetFocus;
      Exit;
   End;

   xSQL1 := 'Select T.BANCOID, T5.BANCONOM, T.CCBCOID, T.TMONID '
      + '      from CAJA102 T INNER JOIN TGE105 T5 ON T.BANCOID = T5.BANCOID '
      + '     where T.CLAUXID = ' + quotedstr(dblcClAux.Text)
      + '       and T.PROV = ' + quotedstr(dblcdProv.Text)
      + '     Group by T.BANCOID, T5.BANCONOM, T.CCBCOID, T.TMONID ';
   DMCXP.cdsBanco.Close;
   DMCXP.cdsBanco.DataRequest(xSQL1);
   DMCXP.cdsBanco.open;
   DMCXP.cdsBanco.Filter := '';
   DMCXP.cdsBanco.Filtered := False;
   DMCXP.cdsBanco.IndexFieldNames := 'BANCOID';

   dblcBanco.Selected.Clear;
   dblcBanco.Selected.Add('BANCOID'#9'3'#9'Id~Banco.'#9'F');
   dblcBanco.Selected.Add('BANCONOM'#9'25'#9'Banco.'#9'F');
   dblcBanco.Selected.Add('CCBCOID'#9'18'#9'Cuenta~Bancaria'#9'F');
   dblcBanco.Selected.Add('TMONID'#9'2'#9'Moneda'#9'F');
End;

Procedure TFPlantillaDieta.dblcdCargoExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If bbtnCanc.Focused Then Exit;

   If length(trim(dblcdCargo.Text)) = 0 Then
   Begin
      ShowMessage('Indique el Cargo del Directivo');
      dblcdCargo.SetFocus;
      Exit;
   End;

   xWhere := 'IDCARGO=' + quotedstr(dblcdCargo.Text);
   dbeGlosa.Text := BuscaQry('dspTGE', 'CXP_CARGOS_DIRECT', 'IDCARGO, DESCRIPCION', xWhere, 'DESCRIPCION');
   If length(trim(dbeGlosa.Text)) = 0 Then
   Begin
      ShowMessage('Código de Cargo del Directivo inválido, reintente');
      dblcdCargo.SetFocus;
      Exit;
   End;
End;

Procedure TFPlantillaDieta.dblcTDocExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If bbtnCanc.Focused Then Exit;

   If length(trim(dblcTDoc.Text)) = 0 Then
   Begin
      ShowMessage('Indique el Tipo de Documento de la Dieta');
      dblcTDoc.SetFocus;
      Exit;
   End;

   xWhere := 'DOCID=' + quotedstr(dblcTDoc.Text);
   edtTDoc.Text := BuscaQry('dspTGE', 'TGE110', 'DOCID, DOCDES', xWhere, 'DOCDES');

   If length(trim(edtTDoc.Text)) = 0 Then
   Begin
      ShowMessage('Tipo de Documento de la Dieta errado, reintente');
      dblcTDoc.SetFocus;
      Exit;
   End;
End;

Procedure TFPlantillaDieta.dbgDietaDirectoDblClick(Sender: TObject);
Var
   xSQL: String;
Begin
   xModo := 'M';
   dblcClAux.Enabled := False;
   dblcdProv.Enabled := False;
   If DMCXP.cdsPlantillaDet.RecordCount > 0 Then
   Begin
      pnlRegistro.Visible := True;
      pnlRegistro.BringToFront;

      dblcClAux.Text := DMCXP.cdsPlantillaDet.fieldbyname('CLAUXID').AsString;
      dblcClAuxExit(Self);
      dblcdProv.Text := DMCXP.cdsPlantillaDet.fieldbyname('PROV').AsString;
      dblcdProvExit(Self);
      dblcdCargo.Text := DMCXP.cdsPlantillaDet.fieldbyname('IDCARGO').AsString;
      dblcdCargoExit(Self);
      dblcBanco.Text := DMCXP.cdsPlantillaDet.fieldbyname('BANCOID').AsString;
      dbeBanco.Text := DMCXP.cdsPlantillaDet.fieldbyname('BANCONOM').AsString;
      edtCuenta.Text := DMCXP.cdsPlantillaDet.fieldbyname('CCBCOID').AsString;
      dbeTM.Text := DMCXP.cdsPlantillaDet.fieldbyname('TMONID').AsString;

      dblcTDoc.Text := DMCXP.cdsPlantillaDet.fieldbyname('DOCID').AsString;
      dblcTDocExit(Self);
      edtSerie.Text := DMCXP.cdsPlantillaDet.fieldbyname('CPSERIE').AsString;

      dblcdCargo.setfocus;
   End;
End;

Procedure TFPlantillaDieta.bbtnImportDetallesClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMCXP.cdsPlantillaDet.RecordCount > 0 Then
   Begin
      xSQL := 'Select IDNUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, AFECTO4TA VALOR, FECCREA, FECMODIF, USUARIO, FREG, HREG '
         + '     from DB2ADMIN.CXP_PLANTILLAS_DET_CONCEPTO '
         + '    where CIAID=' + quotedstr('02')
         + '      and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('IDNUMERO').AsString)
         + '      and CLAUXID=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('CLAUXID').AsString)
         + '      and PROV=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('PROV').AsString);
      DMCXP.cdsPlantillaDConcepto.Close;
      DMCXP.cdsPlantillaDConcepto.DataRequest(xSQL);
      DMCXP.cdsPlantillaDConcepto.Open;
      Try
         FPlantillaDetalle := TFPlantillaDetalle.Create(Application);
         FPlantillaDetalle.ShowModal;
      Finally
         FPlantillaDetalle.Free;
      End;
   End;
End;

Procedure TFPlantillaDieta.FormActivate(Sender: TObject);
Begin
   AsignaDatasource;
End;

Procedure TFPlantillaDieta.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   FPrincipal.GPlantillaDieta.RefreshFilter;
   DMCXP.cdsBanco.Close;
   DMCXP.cdsBanco.Filter := '';
   DMCXP.cdsBanco.Filtered := False;
   DMCXP.cdsBanco.IndexFieldNames := '';
   DMCXP.FiltraTabla(DMCXP.cdsBanco, 'TGE105', 'BANCOID');
   Action := caFree;
End;

Procedure TFPlantillaDieta.edtSerieExit(Sender: TObject);
Begin
   If bbtnCanc.Focused Then Exit;

   If length(trim(edtSerie.Text)) = 0 Then
   Begin
      ShowMessage('Indique el Número de Serie');
      edtSerie.SetFocus;
      Exit;
   End;

   If length(trim(edtSerie.Text)) <> 4 Then
   Begin
      ShowMessage('Longitud de Número de Serie debe ser de 4 caracteres');
      edtSerie.SetFocus;
      Exit;
   End;

   If Not DMCXP.isAlfanumerico(edtSerie.Text) Then
   Begin
      ShowMessage('Sólo se permiten Letras y Números para la Serie');
      edtSerie.SetFocus;
      Exit;
   End;
End;

Procedure TFPlantillaDieta.dbgDietaDirectoKeyDown(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Var
   xSQL: String;
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg('¿Está seguro de ELIMINAR al Directivo : ' + DMCXP.cdsPlantillaDet.FieldByName('PROVDES').AsString + ' de la Plantilla con sus Conceptos? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         xSQL := 'delete From DB2ADMIN.CXP_PLANTILLAS_DET_CONCEPTO '
            + '   where CIAID=' + quotedstr('02')
            + '     and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('IDNUMERO').AsString)
            + '     and CLAUXID=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('CLAUXID').AsString)
            + '     and PROV=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('PROV').AsString);
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo eliminar los Conceptos de ' + DMCXP.cdsPlantillaDet.FieldByName('PROVDES').AsString);
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            Exit;
         End;
         xSQL := 'delete From DB2ADMIN.CXP_PLANTILLAS_DIETAS_DET '
            + '   where CIAID=' + quotedstr('02')
            + '     and IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('IDNUMERO').AsString)
            + '     and CLAUXID=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('CLAUXID').AsString)
            + '     and PROV=' + quotedstr(DMCXP.cdsPlantillaDet.FieldByName('PROV').AsString);
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo eliminar al Directivo ' + DMCXP.cdsPlantillaDet.FieldByName('PROVDES').AsString);
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            Exit;
         End;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
         AsignaDatasource;
      End;
   End;
End;

End.

