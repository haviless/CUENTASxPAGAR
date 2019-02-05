Unit CXP293;
//*********************************************************
// CREADO     POR   : Christian Flores Rodríguez
// Nº HPC           : HPC_201801_CXP
// FECHA DE MODIF.  : 08/02/2018
// DESCRIPCION      : Planilla de Dietas de Directorio
//
//*********************************************************

// Actualizaciones
// HPC_201801_CXP  29/01/2018 Inicio de Formulario
// HPC_201804_CXP  19/07/2018 Bifurca entre CONFIRMADO y CONTABILIZADO
//                 19/07/2018 Incluye Contabilización de Provisiones y Órdenes de Pago
//                 19/07/2018 Incluye el punto decimal en la validación de Importes
//                 19/07/2018 Incluye Descripción del Proveedor en los Datos del Banco
//                 19/07/2018 reubica posición izquierda de panel de datos de banco

Interface

Uses

   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Buttons, Wwdbigrd, Grids, Wwdbgrid, StdCtrls, Wwkeycb, ExtCtrls, wwdblook, DB,
   Mask, wwdbedit, Wwdbdlg, DBClient, wwclient, wwdbdatetimepicker, wwidlg,
   ppDB, ppDBPipe, ppEndUsr, ppComm, ppRelatv, ppProd, ppClass, ppReport,
   ppBands, ppCache;

Type
   TFPlanillaDietasDetalle = Class(TForm)
      pnlDetalle: TPanel;
      grpDatosGenerales: TGroupBox;
      lblnumero: TLabel;
      meNoReg: TwwDBEdit;
      lblTipoPlanilla: TLabel;
      dblcTplani: TwwDBLookupCombo;
      edtDescripcionPlani: TEdit;
      lblOrigen: TLabel;
      dblcdCCosto: TwwDBLookupComboDlg;
      edtCCosto: TEdit;
      lblFechaSesion: TLabel;
      dtpFSesion: TwwDBDateTimePicker;
      lblPosiPago: TLabel;
      dtpFPosiPago: TwwDBDateTimePicker;
      lblPlanilla: TLabel;
      grpCuentaContable: TGroupBox;
      lblCuentaContable: TLabel;
      dblcdCuentaCont: TwwDBLookupComboDlg;
      lblDescripcionContable: TLabel;
      edtCnpEgr: TEdit;
      grpCuentaCorriente: TGroupBox;
      dbgDietaCuenta: TwwDBGrid;
      btnActCuenta: TwwIButton;
      grpDetallePlanilla: TGroupBox;
      dbgDietaDetalle: TwwDBGrid;
      btnActReg: TwwIButton;
      pnlRegistro: TPanel;
      bbtnRegOk: TBitBtn;
      bbtnCancelar: TBitBtn;
      StaticText1: TStaticText;
      dbeTM: TwwDBEdit;
      lblBanco: TLabel;
      lblCuentaBancaria: TLabel;
      lblMoneda: TLabel;
      pnlEstado: TPanel;
      lblEstado: TLabel;
      bbtnAnula: TBitBtn;
      bbtnContab: TBitBtn;
      bbtnAcepta: TBitBtn;
      bbtnGraba: TBitBtn;
      bbtnRegresa: TBitBtn;
      bbtnImprimePlla: TBitBtn;
      bbtnPago: TBitBtn;
      bbtnVisa: TBitBtn;
      bbtnObserva: TBitBtn;
      bbtnApruebaPago: TBitBtn;
      dblcBanco: TwwDBLookupCombo;
      edtBanco: TEdit;
      dblcCCBco: TwwDBLookupCombo;
      Label5: TLabel;
      dblcTMon: TwwDBLookupCombo;
      edtTMon: TEdit;
      Label1: TLabel;
      sdGraba: TSaveDialog;
      Memo1: TMemo;
      pnlRegistroDetalle: TPanel;
      lblTipReg: TLabel;
      lblCnpEgr: TLabel;
      lblCCosto: TLabel;
      lblGlosa: TLabel;
      lblTipPre: TLabel;
      lblPresu: TLabel;
      lblTDoc: TLabel;
      lblSerie: TLabel;
      edtClaseAux: TEdit;
      dbeTMDet: TwwDBEdit;
      bbtnRegDetalleOk: TBitBtn;
      bbtnCanc: TBitBtn;
      edtProv: TwwDBEdit;
      dbeCargoDir: TwwDBEdit;
      stTituloDet: TStaticText;
      dblcdProv: TwwDBLookupComboDlg;
      dblcBancoDetalle: TwwDBLookupCombo;
      dbeBanco: TEdit;
      dblcTDoc: TwwDBLookupCombo;
      edtTDoc: TEdit;
      edtSerie: TwwDBEdit;
      edtNoDoc: TwwDBEdit;
      dblcClAux: TwwDBLookupCombo;
      edtCuenta: TEdit;
      pnlDetCpto: TPanel;
      dbgDietaDirecto: TwwDBGrid;
      wwIButton1: TwwIButton;
      pnlConceptoDet: TPanel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      edtConcepto: TEdit;
      dbeSR: TwwDBEdit;
      bbtnGrabaCnpDet: TBitBtn;
      bbtnCancelDetCpto: TBitBtn;
      StaticText3: TStaticText;
      dbeImporte: TwwDBEdit;
      dblcAfecto: TwwDBLookupCombo;
      dblcCnpEgrDet: TwwDBLookupComboDlg;
      dblcdCargo: TwwDBLookupComboDlg;
      pprPlanillaDietas: TppReport;
      pprBoletaDietas: TppReport;
      ppdbPllaCab: TppDBPipeline;
      ppdbPllaDet: TppDBPipeline;
      ppdbPllaConc: TppDBPipeline;
      ppdbPllaBcos: TppDBPipeline;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      bbtnImprimeBoleta: TBitBtn;
      ppHeaderBand2: TppHeaderBand;
      ppDetailBand2: TppDetailBand;
      ppFooterBand2: TppFooterBand;
      ppDesigner1: TppDesigner;
      cbDisenoRep: TCheckBox;
      pnlNumPllaBco: TPanel;
      bbtnOkNumPllaBco: TBitBtn;
      bbtnExitNumPllaBco: TBitBtn;
      dbgNumPllaBco: TwwDBGrid;
      dbeNumOPago: TwwDBEdit;
      dbeNumPllaOpago: TwwDBEdit;
      dbeNumOp: TwwDBEdit;
      lblOPago: TLabel;
      lblNumPlaOPago: TLabel;
      lblNumOpBco: TLabel;
      bbtnVisorOPago: TBitBtn;
      lblEstadoDescr: TLabel;
      Procedure FormShow(Sender: TObject);
      Procedure bbtnRetornaClick(Sender: TObject);
      Procedure bbtnRegOkClick(Sender: TObject);
      Procedure dblcdCCostoExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcTplaniExit(Sender: TObject);
      Procedure dblcBancoExit(Sender: TObject);
      Procedure bbtnCancClick(Sender: TObject);
      Procedure dblcTplaniEnter(Sender: TObject);
      Procedure btnActRegClick(Sender: TObject);
      Procedure bbtnVisaClick(Sender: TObject);
      Procedure dblcdCuentaContExit(Sender: TObject);
      Procedure dbgDietaDetalleDblClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure dblcCCBcoExit(Sender: TObject);
      Procedure dblcCCBcoEnter(Sender: TObject);
      Procedure dbgDietaCuentaDblClick(Sender: TObject);
      Procedure bbtnGrabaClick(Sender: TObject);
      Procedure bbtnAceptaClick(Sender: TObject);
      Procedure bbtnObservaClick(Sender: TObject);
      Procedure bbtnApruebaPagoClick(Sender: TObject);
      Procedure dblcTMonExit(Sender: TObject);
      Procedure btnActCuentaClick(Sender: TObject);
      Procedure bbtnRegDetalleOkClick(Sender: TObject);
      Procedure dblcClAuxExit(Sender: TObject);
      Procedure dblcdProvExit(Sender: TObject);
      Procedure dblcdCargoExit(Sender: TObject);
      Procedure dblcBancoDetalleExit(Sender: TObject);
      Procedure dblcTDocExit(Sender: TObject);
      Procedure dbgDietaDetalleKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure bbtnPagoClick(Sender: TObject);
      Procedure bbtnContabClick(Sender: TObject);
      Procedure wwIButton1Click(Sender: TObject);
      Procedure dblcCnpEgrDetExit(Sender: TObject);
      Procedure bbtnGrabaCnpDetClick(Sender: TObject);
      Procedure dbgDietaDirectoDblClick(Sender: TObject);
      Procedure bbtnCancelDetCptoClick(Sender: TObject);
      Procedure InsertaPlantilla;
      Procedure dblcdCargoCloseDialog(Dialog: TwwLookupDlg);
      Procedure dblcClAuxCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure dblcdProvCloseDialog(Dialog: TwwLookupDlg);
      Procedure dblcBancoDetalleCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure dblcTDocCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure dbeImporteExit(Sender: TObject);
      Procedure dbeSRExit(Sender: TObject);
      Procedure dblcAfectoExit(Sender: TObject);
      Procedure bbtnImprimePllaClick(Sender: TObject);
      Procedure bbtnImprimeBoletaClick(Sender: TObject);
      Procedure dblcCnpEgrDetEnter(Sender: TObject);
      Procedure dbgDietaDirectoKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure bbtnOkNumPllaBcoClick(Sender: TObject);
      Procedure bbtnExitNumPllaBcoClick(Sender: TObject);
      Procedure dbeNumPllaOpagoExit(Sender: TObject);
      Procedure dbeNumOpExit(Sender: TObject);
      Procedure bbtnVisorOPagoClick(Sender: TObject);
    procedure bbtnAnulaClick(Sender: TObject);

   private
      xGlosaRep, xCta_Ccos, xDistri: String;
      numreg: Integer;
      wTasa: double;
      xModo: String;
      bModo: String;
      sModoCptoDet: String;
      xTot4ta: double;
      vPlantillaAnt: String;
      xSigueGrab: Boolean;
      Procedure AsignaLookup;
      Procedure AsignaDatasource;
      Procedure RecuperaDocumentos(pCiaid, pProveedor: String);
      Procedure CargaDataSource;
      Function fg_validaCierreContable(wgFecha: TDateTime): Boolean;
      Procedure GrabaTexto(Datos: TDatasource; Fichero: String; Delimitador: char);
      Procedure GrabaTextoBBVA(Datos: TDatasource; Fichero: String; Delimitador: char);
      Function SumaCuentasBBVA: String;
      Function SumaCuentas: String;
      Procedure AbreTablasReportes;
      Procedure Recalcula4ta;
      Procedure Genera4ta;
      Procedure PideDatosBanco(wOrigen: String);

   public
      xDTRPorc: DOUBLE;
      xdblcTRegistroOP, xedtTRegistroOP, xdblcdCnpEgrOP, xdbeCuentaOP, xdbeGlosaOP, xdblcdCCosto, xedtCCosto, xdbeDetracOP: String;
      Procedure EstadoDeForma(xMovEstado, xConta: String);
   End;

Var
   FPlanillaDietasDetalle: TFPlanillaDietasDetalle;
   xSQL: String;
   xTemTReg: String;
   xTemCpto: String;
   xTemCta: String;
   xTemDH: String;
   xNuevoDet: boolean;

Implementation
Uses CxPDM, StrUtils;
{$R *.dfm}

Procedure TFPlanillaDietasDetalle.AsignaLookup;
Begin

   dbgDietaDetalle.Selected.Clear;
   dbgDietaDetalle.Selected.Add('ITEM'#9'2'#9'Orden'#9'F');
   dbgDietaDetalle.Selected.Add('CLAUXID'#9'2'#9'Clase~Aux.'#9'F');
   dbgDietaDetalle.Selected.Add('PROV'#9'5'#9'Id.~Prov.'#9'F');
   dbgDietaDetalle.Selected.Add('PROVDES'#9'20'#9'Nombre'#9'F');
   dbgDietaDetalle.Selected.Add('PROVRUC'#9'11'#9'R.U.C.'#9'F');
   dbgDietaDetalle.Selected.Add('DESCRIPCION'#9'10'#9'Cargo'#9'F');
   dbgDietaDetalle.Selected.Add('MONTOT'#9'7'#9'Importe~Total'#9'F');
   dbgDietaDetalle.Selected.Add('DOCID'#9'2'#9'TDoc'#9'F');
   dbgDietaDetalle.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
   dbgDietaDetalle.Selected.Add('CPNODOC'#9'7'#9'Nro.Doc.'#9'F');
   dbgDietaDetalle.Selected.Add('BANCOID'#9'3'#9'Banco'#9'F');
//   dbgDietaDetalle.Selected.Add('BANCONOM'#9'15'#9'Nombre~del Banco'#9'F');
   dbgDietaDetalle.Selected.Add('TMONID'#9'2'#9'TM'#9'F');
   dbgDietaDetalle.Selected.Add('CCBCOID'#9'17'#9'Cta.Cte.'#9'F');
   dbgDietaDetalle.ApplySelected;

   dbgDietaCuenta.Selected.Clear;
   dbgDietaCuenta.Selected.Add('BANCOID'#9'3'#9'Banco'#9'F');
   dbgDietaCuenta.Selected.Add('BANCONOM'#9'40'#9'Nombre~del Banco'#9'F');
   dbgDietaCuenta.Selected.Add('TMONID'#9'2'#9'TM'#9'F');
   dbgDietaCuenta.Selected.Add('CCBCOID'#9'18'#9'Cta.Cte.'#9'F');
   dbgDietaCuenta.ApplySelected;

End;

Procedure TFPlanillaDietasDetalle.AsignaDatasource;
Begin
   xSQL := ' Select C.CIAID, C.ID_NUMERO, C.ITEM, C.CLAUXID, C.PROV, C.PROVDES, A.PROVRUC, C.CARGO IDCARGO, D.DESCRIPCION, '
      + '           C.MONTOT, C.DOCID, C.CPSERIE, C.CPNODOC, C.BANCOID, B.BANCONOM, C.TMONID, C.CCBCOID, C.FECCREA, '
      + '           C.FECMODIF, C.USUARIO, C.FREG, C.HREG '
      + '      from DB2ADMIN.CXP_PLANILLAS_DIETAS_DET C '
      + '           INNER JOIN CXP_CARGOS_DIRECT D ON C.CARGO = D.IDCARGO '
      + '           INNER JOIN TGE105 B ON C.BANCOID = B.BANCOID '
      + '           INNER JOIN TGE201 A ON C.CLAUXID = A.CLAUXID AND C.PROV = A.PROV '
      + '     Where C.CIAID=' + quotedstr('02')
      + '       and C.ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString)
      + '     order by C.ITEM, C.CLAUXID, C.PROV ';
   DMCXP.cdsPlanillaDet.Close;
   DMCXP.cdsPlanillaDet.DataRequest(xSQL);
   DMCXP.cdsPlanillaDet.Open;
   dbgDietaDetalle.DataSource := DMCXP.dsPlanillaDet;
   dbgDietaDetalle.ApplySelected;

//   DMCXP.cdsPlanillaDet.Close;
//   DMCXP.cdsPlanillaDet.DataRequest(xWhere);
//   DMCXP.cdsPlanillaDet.Open;
//   dbgDietaDetalle.DataSource := DMCXP.dsPlanillaDet;

   xSQL := ' Select C.ID_NUMERO, C.BANCOID, B.BANCONOM, C.CCBCOID, C.TMONID, C.FECCREA, C.FECMODIF, C.USUARIO, C.FREG, C.HREG '
      + '      from CXP_PLANILLAS_CUENTA_BANCO C '
      + '           INNER JOIN TGE105 B ON C.BANCOID = B.BANCOID '
      + '     Where CIAID=' + quotedstr('02')
      + '       and C.ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString)
      + '     order by C.BANCOID ';
   DMCXP.cdsPlanillaBanco.Close;
   DMCXP.cdsPlanillaBanco.DataRequest(xSQL);
   DMCXP.cdsPlanillaBanco.Open;
   dbgDietaCuenta.DataSource := DMCXP.dsPlanillaBanco;
End;

Procedure TFPlanillaDietasDetalle.RecuperaDocumentos(pCiaid, pProveedor: String);
Begin

End;

Procedure TFPlanillaDietasDetalle.FormShow(Sender: TObject);
Var
   ls_idNumero, ls_tipo_Plant, ls_descripcion, ls_CCosto, ls_Cuenta, ls_Moneda, sano: String;
//ls_fechasesion, ls_fechasuge : DATE;
   Year, Month, Day: Word;
   NoReg: String;
Begin
   bmodo := '';
   DecodeDate(Date, Year, Month, Day);
   sano := StrZero(inttostr(Year), 4);
   ls_idNumero := DMCXP.cdsPlanillaCab.fieldbyname('ID_NUMERO').AsString;
   ls_tipo_plant := DMCXP.cdsPlanillaCab.fieldbyname('IDNUMERO').AsString;
   ls_descripcion := DMCXP.cdsPlanillaCab.fieldbyname('DESCRIPCION').AsString;
   ls_CCosto := DMCXP.cdsPlanillaCab.fieldbyname('CCOSID').AsString;
   ls_Cuenta := DMCXP.cdsPlanillaCab.fieldbyname('CUENTAID').AsString;
   ls_Moneda := DMCXP.cdsPlanillaCab.fieldbyname('TMONID').AsString;
// ls_fechasesion := DMCXP.cdsPlanillaCab.fieldbyname('FECSESION').AsDateTime;
// ls_fechasuge := DMCXP.cdsPlanillaCab.fieldbyname('FECSUGEREN').AsDateTime;

   meNoReg.Text := '';
   dblcTplani.Text := '';
   edtDescripcionPlani.Text := '';
   dblcdCCosto.Text := '';
   edtCCosto.Text := '';
   dblcdCuentaCont.Text := '';
   edtCnpEgr.Text := '';
   dblcTMon.Text := '';
   edtTMon.Text := '';

   If DMCXP.wModo = 'A' Then
   Begin
      NoReg := '';
      NoReg := DMCXP.UltimoRegistroPlanilla;
      NoReg := Strzero(NoReg, 4);
      NoReg := SANO + NoReg;
      meNoReg.Text := NoReg;
      dblcTplani.Text := '';
      dblcTplani.Enabled := True;
      edtDescripcionPlani.Text := '';
      dblcdCCosto.Text := '';
      dblcdCuentaCont.Text := '';
      dblcdCuentaCont.Enabled := True;
      dblcTMon.Text := '';
      edtTMon.Text := '';
      dtpFSesion.date := DATE;
      dtpFSesion.Enabled := True;
      dtpFPosiPago.Date := DATE;
      dtpFPosiPago.Enabled := True;

      EstadoDeForma('T', '');

   End
   Else
   Begin
      dblcTplani.Enabled := False;
      meNoReg.Text := ls_idNumero;
      dblcTplani.Text := ls_tipo_plant;
//       dblcTplani.Enabled := False;
      edtDescripcionPlani.Text := ls_descripcion;
      dblcdCCosto.Text := ls_CCosto;
      dblcdCCostoExit(Self);
      dblcdCuentaCont.Text := ls_Cuenta;
      If length(ls_Cuenta) > 0 Then
      Begin
         dblcdCuentaContExit(Self);
      End;
      dblcTMon.text := ls_Moneda;
      dblcTMonExit(Self);
//       dblcdCuentaCont.Enabled := False;
      dtpFSesion.Date := DMCXP.cdsPlanillaCab.fieldbyname('FECSESION').AsDateTime;
//       dtpFSesion.Enabled := False;
      dtpFPosiPago.Date := DMCXP.cdsPlanillaCab.fieldbyname('FECSUGEREN').AsDateTime;
//       dtpFPosiPago.Enabled := False;
   // Inicio HPC_201804_CXP
   // 19/07/2018 Bifurca entre CONFIRMADO y CONTABILIZADO
      If DMCXP.cdsPlanillaCab.fieldbyname('CONTABILIZA').AsString='S' then
         EstadoDeForma(DMCXP.cdsPlanillaCab.fieldbyname('DESTADO').AsString, 'S')
      Else
         EstadoDeForma(DMCXP.cdsPlanillaCab.fieldbyname('DESTADO').AsString, '');
   // Fin HPC_201804_CXP
   End;

   AsignaLookup;
   AsignaDatasource;

End;

Procedure TFPlanillaDietasDetalle.bbtnRetornaClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFPlanillaDietasDetalle.bbtnRegOkClick(Sender: TObject);
Var
   xTipDet, xWhere: String;
   xDiferencia, xMontoOri, xIGVx, xTotMG, xTotTO, xCalc: Double;
   cdsClone: TwwClientDataSet;
   xRecord: Integer;
Begin

   If length(dblcBanco.Text) = 0 Then
   Begin
      dblcBanco.SetFocus;
      Raise Exception.Create('Debe seleccionar el Banco');
   End;
   If length(dblcCCBco.Text) = 0 Then
   Begin
      dblcCCBco.SetFocus;
      Raise Exception.Create('Debe seleccionar la Cuenta Corriente');
   End;

   DMCXP.cdsPlanillaBanco.Edit;
   DMCXP.cdsPlanillaBanco.fieldbyname('ID_NUMERO').AsString := meNoReg.Text;
   DMCXP.cdsPlanillaBanco.fieldbyname('BANCOID').AsString := dblcBanco.Text;
   DMCXP.cdsPlanillaBanco.fieldbyname('CCBCOID').AsString := dblcCCBco.Text;
   DMCXP.cdsPlanillaBanco.fieldbyname('TMONID').AsString := dbeTM.Text;
   DMCXP.cdsPlanillaBanco.fieldbyname('USUARIO').AsString := DMCXP.wUsuario;
   DMCXP.cdsPlanillaBanco.Post;

   If bModo = 'A' Then
   Begin
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      xSQL := ' Insert into DB2ADMIN.CXP_PLANILLAS_CUENTA_BANCO( CIAID, ID_NUMERO, BANCOID, CCBCOID, TMONID, FECCREA, FECMODIF, USUARIO, FREG, HREG ) '
         + '    Values( ' + quotedstr('02') + ','
         + quotedstr(DMCXP.cdsPlanillaBanco.fieldbyname('ID_NUMERO').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaBanco.fieldbyname('BANCOID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaBanco.fieldbyname('CCBCOID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaBanco.fieldbyname('TMONID').AsString) + ', '
         + '              trunc(sysdate),  '
         + '              sysdate,  '
         + quotedstr(DMCXP.cdsPlanillaBanco.fieldbyname('USUARIO').AsString) + ', '
         + '              trunc(sysdate),  '
         + '              sysdate )';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo Insertar el Detalle de la Cuenta Corriente');
         exit;
      End;

      DMCXP.DCOM1.AppServer.GrabaTransaccion;
   End
   Else
   Begin
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      xSQL := ' Update DB2ADMIN.CXP_PLANILLAS_CUENTA_BANCO '
         + '       set BANCOID = ' + quotedstr(DMCXP.cdsPlanillaBanco.fieldbyname('BANCOID').AsString) + ','
         + '           CCBCOID = ' + quotedstr(DMCXP.cdsPlanillaBanco.fieldbyname('CCBCOID').AsString) + ','
         + '           TMONID = ' + quotedstr(DMCXP.cdsPlanillaBanco.fieldbyname('TMONID').AsString) + ','
         + '           USUARIO = ' + quotedstr(DMCXP.cdsPlanillaBanco.fieldbyname('USUARIO').AsString) + ','
         + '           FECMODIF = sysdate, '
         + '           FREG = trunc(sysdate), '
         + '           HREG = sysdate '
         + '     Where CIAID=' + quotedstr('02')
         + '       and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaBanco.fieldbyname('IDNUMERO').AsString);

      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede actualizar el Detalle de la Cuenta Corriente');
         exit;
      End;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
   End;

   pnlRegistro.Visible := False;

   AsignaDatasource;

End;

Procedure TFPlanillaDietasDetalle.dblcTplaniEnter(Sender: TObject);
Begin
   DMCXP.cdsPlantillaCab.Filter := '';
   xSQL := 'Select IDNUMERO, DESCRIPCION, CCOSID, TMONID, FECCREA, FECMODIF, USUARIO, FREG, HREG '
      + '     from DB2ADMIN.CXP_PLANT_DIETAS_CAB WHERE 1=1 ';
   Filtracds(DMCXP.cdsPlantillaCab, xSQL);
   dblcTplani.LookupField := 'IDNUMERO';
   dblcTplani.LookupTable := DMCXP.cdsPlantillaCab;
   vPlantillaAnt := dblcTplani.Text;
End;

Procedure TFPlanillaDietasDetalle.dblcdCCostoExit(Sender: TObject);
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

Procedure TFPlanillaDietasDetalle.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFPlanillaDietasDetalle.FormCreate(Sender: TObject);
Begin
   xSQL := '';
(*
   // Centro de Costo
   xSQL := 'Select CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV '
            + '  from TGE203 '
            + ' where CCOSMOV=' + quotedstr('S')
            + '   and CCOSCIAS LIKE (' + quotedstr('%02%') + ' ) '
            + '   and CCOSACT=''S''';
   DMCXP.cdsCCosto.Close;
   DMCXP.cdsCCosto.DataRequest(xSQL);
   DMCXP.cdsCCosto.open;
   DMCXP.cdsCCosto.Filter := '';
   DMCXP.cdsCCosto.Filtered := False;
   DMCXP.cdsCCosto.IndexFieldNames := 'CCOSID';
*)
// Plan de Cuentas
   xSQL := 'Select CUENTAID, CTADES, CTA_MOV, CTA_CCOS '
      + '     from DB2ADMIN.TGE202 '
      + '    Group by CUENTAID, CTADES, CTA_MOV, CTA_CCOS ';
   DMCXP.cdsCuenta.Close;
   DMCXP.cdsCuenta.ProviderName := 'dspTGE';
   DMCXP.cdsCuenta.DataRequest(xSQL);
   DMCXP.cdsCuenta.Open;
   DMCXP.cdsCuenta.IndexFieldNames := 'CUENTAID';
   dblcdCuentaCont.LookUpField := 'CUENTAID';
   dblcdCuentaCont.LookupTable := DMCXP.cdsCuenta;
   dblcdCuentaCont.Selected.Clear;
   dblcdCuentaCont.Selected.Add('CUENTAID'#9'10'#9'Cuenta'#9'F');
   dblcdCuentaCont.Selected.Add('CTADES'#9'20'#9'Descripción'#9'F');
   dblcdCuentaCont.Selected.Add('CTA_MOV'#9'5'#9'Movim'#9'F');
   dblcdCuentaCont.Selected.Add('CTA_CCOS'#9'5'#9'Req.CCosto'#9'F');

// Concepto por Pagar
   xSQL := ' Select CPTOID,CPTODES,CUENTAID,NIVELMOV,DIETA_DIREC '
      + '     from DB2ADMIN.CXP201 '
      + '    where NIVELMOV=' + quotedstr('S')
      + '      and DIETA_DIREC =' + quotedstr('S');
   DMCXP.cdsCnpEgr.Close;
   DMCXP.cdsCnpEgr.DataRequest(xSQL);
   DMCXP.cdsCnpEgr.open;
   DMCXP.cdsCnpEgr.Filter := '';
   DMCXP.cdsCnpEgr.Filtered := False;
   DMCXP.cdsCnpEgr.IndexFieldNames := 'CPTOID';
   dblcCnpEgrDet.LookUpField := 'CPTOID';
   dblcCnpEgrDet.LookupTable := DMCXP.cdsCnpEgr;
   dblcCnpEgrDet.Selected.Clear;
   dblcCnpEgrDet.Selected.Add('CPTOID'#9'15'#9'Concepto'#9'F');
   dblcCnpEgrDet.Selected.Add('CPTODES'#9'40'#9'Descripción'#9'F');
   dblcCnpEgrDet.Selected.Add('CUENTAID'#9'20'#9'Cuenta'#9'F');

   // Tipo de Plantilla
   //cdsPlantillaCab
   xSQL := 'Select IDNUMERO, DESCRIPCION, CCOSID, TMONID, FECCREA, FECMODIF, USUARIO, FREG, HREG '
      + '     from DB2ADMIN.CXP_PLANT_DIETAS_CAB ';
   DMCXP.cdsPlantillaCab.Close;
   DMCXP.cdsPlantillaCab.ProviderName := 'dspTGE';
   DMCXP.cdsPlantillaCab.DataRequest(xSQL);
   DMCXP.cdsPlantillaCab.Open;
   DMCXP.cdsPlantillaCab.IndexFieldNames := 'IDNUMERO';
   dblcTplani.LookUpField := 'IDNUMERO';
   dblcTplani.LookupTable := DMCXP.cdsPlantillaCab;
   dblcTplani.Selected.Clear;
   dblcTplani.Selected.Add('IDNUMERO'#9'7'#9'Cuenta'#9'F');
   dblcTplani.Selected.Add('DESCRIPCION'#9'47'#9'Descripción'#9'F');
   dblcTplani.Selected.Add('CCOSID'#9'8'#9'Movim'#9'F');
// dblcTplani.Selected.Add('CTA_CCOS'#9'5'#9'Req.CCosto'#9'F');

   DMCXP.FiltraTabla(DMCXP.cdsTDoc, 'TGE110', 'DOCID');
   DMCXP.FiltraTabla(DMCXP.cdsTMon, 'TGE103', 'TMONID');
   DMCXP.FiltraTabla(DMCXP.cdsClAux, 'TGE102', 'CLAUXID');

   xSQL := 'Select IDCARGO, DESCRIPCION '
      + '     from DB2ADMIN.CXP_CARGOS_DIRECT '
      + '    where ESTADO=''S'' ';
   DMCXP.cdsCargDirect.Close;
   DMCXP.cdsCargDirect.ProviderName := 'dspTGE';
   DMCXP.cdsCargDirect.DataRequest(xSQL);
   DMCXP.cdsCargDirect.Open;
   dblcdCargo.Selected.Clear;
   dblcdCargo.Selected.Add('IDCARGO'#9'2'#9'Id~Cargo.'#9'F');
   dblcdCargo.Selected.Add('DESCRIPCION'#9'5'#9'Descripción'#9'F');

   xSQL := 'Select T.BANCOID, T.BANCONOM '
      + '      from DB2ADMIN.TGE105 T '
      + '     order by T.BANCOID ';
   DMCXP.cdsBanco.Close;
   DMCXP.cdsBanco.DataRequest(xSQL);
   DMCXP.cdsBanco.open;
   DMCXP.cdsBanco.Filter := '';
   DMCXP.cdsBanco.Filtered := False;
   DMCXP.cdsBanco.IndexFieldNames := 'BANCOID';

   dblcBanco.Selected.Clear;
   dblcBanco.Selected.Add('BANCOID'#9'3'#9'Id~Banco.'#9'F');
   dblcBanco.Selected.Add('BANCONOM'#9'18'#9'Banco.'#9'F');
//   dblcBanco.Selected.Add('CCBCOID'#9'18'#9'Cuenta~Bancaria'#9'F');
//   dblcBanco.Selected.Add('TMONID'#9'2'#9'Moneda'#9'F');

   xSQL := 'Select ID_NUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, '
      + '          AFECTO4TA, FECCREA, FECMODIF, USUARIO, FREG, HREG, CIAID, '' '' ORDENIMP '
      + '     from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO '
      + '    Where 1<>1';
   DMCXP.cdsPlanillaDConcepto.Close;
   DMCXP.cdsPlanillaDConcepto.DataRequest(xSQL);
   DMCXP.cdsPlanillaDConcepto.Open;

   dblcCnpEgrDet.dataSource := DMCXP.dsPlanillaDConcepto;
   dbeImporte.dataSource := DMCXP.dsPlanillaDConcepto;
   dbeSR.dataSource := DMCXP.dsPlanillaDConcepto;
   dblcAfecto.dataSource := DMCXP.dsPlanillaDConcepto;

   dblcCnpEgrDet.DataField := 'CPTOID';
   dbeImporte.DataField := 'IMPORTE';
   dbeSR.DataField := 'SUMRES';
   dblcAfecto.DataField := 'AFECTO4TA';

   xSQL := 'select VALOR, DESCRIP from DB2ADMIN.TGE801';
   DMCXP.cdsQry8.Close;
   DMCXP.cdsQry8.DataRequest(xSQL);
   DMCXP.cdsQry8.Open;

   dblcAfecto.LookUpField := 'VALOR';
   dblcAfecto.LookupTable := DMCXP.cdsQry8;
   dblcAfecto.Selected.Clear;
   dblcAfecto.Selected.Add('VALOR'#9'5'#9'Valor'#9'F');
   dblcAfecto.Selected.Add('DESCRIP'#9'10'#9'Descripción'#9'F');

   CargaDataSource;

End;

Procedure TFPlanillaDietasDetalle.CargaDataSource;
Begin

   meNoReg.DataSource := Nil;

//   dblcTMon.DataSource := DMCXP.dsPlantillaCab;
//   dblcTMon.LookupTable := DMCXP.cdsTMon;

//   dblcdCCosto.DataSource := DMCXP.dsPlanillaCab;
//   dblcdCCosto.LookupTable := DMCXP.cdsCCosto;
// Detalle de la Plantilla de Dieta

//   dblcdCuentaCont.DataSource := DMCXP.dsPlanillaCab;
   dblcdCuentaCont.LookupTable := DMCXP.cdsCuenta;

   dblcTplani.DataSource := DMCXP.dsPlanillaCab;
   dblcTplani.LookupTable := DMCXP.cdsPlantillaCab;
(*
   dblcTDoc.DataSource := DMCXP.dsPlantillaDet;
   dblcTDoc.LookupTable := DMCXP.cdsTDoc;
   edtSerie.DataSource := DMCXP.dsPlantillaDet;
   edtNoDoc.DataSource := DMCXP.dsPlantillaDet;

   dblcdCargo.DataSource := DMCXP.dsPlantillaDet;
   dblcdCargo.LookupTable := DMCXP.cdsCargDirect;

   dblcBanco.DataSource := DMCXP.dsPlantillaDet;
   dblcBanco.LookupTable := DMCXP.cdsBanco;
*)
   dblcBanco.DataSource := DMCXP.dsPlanillaBanco;
   dblcBanco.LookupTable := DMCXP.cdsBanco;

   // pnlDetalle
   dblcClAux.DataSource := DMCXP.dsPlantillaDet;
   dblcClAux.LookupTable := DMCXP.cdsClAux;
   dblcdProv.DataSource := DMCXP.dsPlantillaDet;
   dblcdProv.LookupTable := DMCXP.cdsProv;
   dblcTDoc.DataSource := DMCXP.dsPlantillaDet;
   dblcTDoc.LookupTable := DMCXP.cdsTDoc;
   edtSerie.DataSource := DMCXP.dsPlantillaDet;
   edtNoDoc.DataSource := DMCXP.dsPlantillaDet;

//   dblcdCargo.DataSource := DMCXP.dsPlantillaDet;
//   dblcdCargo.DataField := 'IDCARGO';
   dblcdCargo.LookupTable := DMCXP.cdsCargDirect;
   dblcdCargo.LookupField := 'IDCARGO';

   dblcBancoDetalle.DataSource := DMCXP.dsPlantillaDet;
   dblcBancoDetalle.LookupTable := DMCXP.cdsBanco;

   // *******************

   dbgDietaDetalle.DataSource := DMCXP.dsPlanillaDet;
   dbgDietaCuenta.DataSource := DMCXP.dsPlanillaBanco;

End;

Procedure TFPlanillaDietasDetalle.dblcTplaniExit(Sender: TObject);
Var
   xWhere, xTipo: String;
Begin

   Screen.Cursor := crHourGlass;

   xWhere := 'IDNUMERO=' + '''' + dblcTplani.Text + '''';
   edtDescripcionPlani.Text := BuscaQry('PrvTGE', 'CXP_PLANT_DIETAS_CAB', 'DESCRIPCION', xWhere, 'DESCRIPCION');

   Screen.Cursor := crDefault;
   If length(edtDescripcionPlani.Text) = 0 Then
   Begin
      ShowMessage('Falta Tipo de Plantilla');
      dblcTplani.SetFocus;
      exit;
   End;

   dblcdCCosto.text := DMCXP.cdsPlantillaCab.FieldByName('CCOSID').AsString;
   If length(dblcdCCosto.Text) > 0 Then
   Begin
      dblcdCCostoExit(Self);
   End;

   dblcTMon.text := DMCXP.cdsPlantillaCab.FieldByName('TMONID').AsString;
   If length(dblcTMon.Text) > 0 Then
   Begin
      dblcTMonExit(Self);
   End;

   If DMCXP.wModo = 'A' Then
   Begin
      InsertaPlantilla;
      AsignaDatasource;
      AsignaLookup;
   End;

{
   xWhere := ' Select C.ID_NUMERO, C.ITEM, C.CLAUXID, C.PROV, C.PROVDES, A.PROVRUC, C.CARGO IDCARGO, D.DESCRIPCION, C.MONTOT, C.DOCID, C.CPSERIE, C.CPNODOC, C.BANCOID, B.BANCONOM, C.CCBCOID, C.TMONID, C.FECCREA, C.FECMODIF, C.USUARIO, C.FREG, C.HREG '
      + '        from CXP_PLANILLAS_DIETAS_DET C INNER JOIN CXP_CARGOS_DIRECT D ON C.CARGO = D.IDCARGO '
      + '   INNER JOIN TGE105 B ON C.BANCOID = B.BANCOID '
      + '   INNER JOIN TGE201 A ON C.CLAUXID = A.CLAUXID AND C.PROV = A.PROV '
      + '  Where C.ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString)
      + ' order by C.CLAUXID, C.PROV ';
   DMCXP.cdsPlanillaDet.Close;
   DMCXP.cdsPlanillaDet.DataRequest(xWhere);
   DMCXP.cdsPlanillaDet.Open;

   // Cargar el Detalle de la Plantilla Seleccionada
   xWhere := ' Select C.IDNUMERO ID_NUMERO, ROWNUM ITEM, C.CLAUXID, C.PROV, C.PROVDES, A.PROVRUC, C.CARGO IDCARGO, D.DESCRIPCION, C.MONTOT, C.DOCID, C.CPSERIE, C.CPNODOC, C.BANCOID, B.BANCONOM, C.TMONID, C.CCBCOID, C.FECCREA, C.FECMODIF, C.USUARIO, C.FREG, C.HREG '
      + ' from CXP_PLANTILLAS_DIETAS_DET C INNER JOIN CXP_CARGOS_DIRECT D ON C.CARGO = D.IDCARGO '
      + '   INNER JOIN TGE105 B ON C.BANCOID = B.BANCOID '
      + '   INNER JOIN TGE201 A ON C.CLAUXID = A.CLAUXID AND C.PROV = A.PROV '
      + ' Where C.IDNUMERO=' + quotedstr(DMCXP.cdsPlantillaCab.FieldByName('IDNUMERO').AsString)
      + ' order by ROWNUM, C.CLAUXID, C.PROV ';
   DMCXP.cdsPlantillaDet.Close;
   DMCXP.cdsPlantillaDet.DataRequest(xWhere);
   DMCXP.cdsPlantillaDet.Open;

   DMCXP.cdsPlantillaDet.First;
   While not DMCXP.cdsPlantillaDet.EOD do
   Begin
      DMCXP.cdsPlanillaDet.Append;
      DMCXP.cdsPlanillaDet.FieldByName('').As;

      DMCXP.cdsPlantillaDet.Next;
   End;

   If (DMCXP.cdsPlanillaDet.recordcount = 0) Or (DMCXP.cdsPlanillaCab.fieldbyname('IDNUMERO').AsString <> dblcTplani.Text) Then
   Begin
      dbgDietaDetalle.DataSource := DMCXP.dsPlantillaDet;
   End
   Else
   Begin
      AsignaDatasource;

   End;
}
   bbtnGrabaClick(Self);
   Screen.Cursor := crDefault;

End;

Procedure TFPlanillaDietasDetalle.dblcBancoExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If length(dblcBanco.text) > 0 Then
   Begin
      xWhere := 'BANCOID=' + quotedstr(dblcBanco.text) + ' ';
      BuscaQry('PrvTGE', 'TGE105', 'BANCONOM', xWhere, 'BANCONOM');
      edtBanco.Text := DMCXP.cdsQry.FieldByName('BANCONOM').AsString;

      xWhere := '   Select CCBCOID, TMONID '
         + '          from DB2ADMIN.TGE106 '
         + '         where BANCOID = ' + quotedstr(dblcBanco.text)
         + '           and TMONID = ' + quotedstr(DMCXP.cdsPlanillaCab.fieldbyname('TMONID').AsString)
         + '         Group by CCBCOID, TMONID ';
      Filtracds(DMCXP.cdsCCBco, xWhere);

      DMCXP.cdsCCBco.Filter := '';
      DMCXP.cdsCCBco.Filtered := False;
      DMCXP.cdsCCBco.IndexFieldNames := 'CCBCOID';

      dblcCCBco.Selected.Clear;
      dblcCCBco.Selected.Add('CCBCOID'#9'18'#9'Cuenta~Bancaria'#9'F');
      dblcCCBco.Selected.Add('TMONID'#9'2'#9'Moneda'#9'F');

      dblcCCBco.DataSource := DMCXP.dsPlanillaBanco;
      dblcCCBco.LookupTable := DMCXP.cdsCCBco;
   End;

End;

Procedure TFPlanillaDietasDetalle.bbtnCancClick(Sender: TObject);
Begin
   pnlRegistroDetalle.Visible := False;
   pnlDetalle.Enabled := True;
   If xModo = 'A' Then
      DMCXP.cdsPlanillaDet.Delete
   Else
   Begin
      DMCXP.cdsPlanillaDet.Cancel;
   End;
   AsignaDatasource;
End;

Procedure TFPlanillaDietasDetalle.btnActRegClick(Sender: TObject);
Begin
   pnlRegistroDetalle.Top := 72;
   pnlRegistroDetalle.Left := 176;
   pnlRegistroDetalle.Visible := True;
   pnlDetalle.Enabled := False;
   pnlRegistroDetalle.BringToFront;
   pnlConceptoDet.Visible := False;
   pnlRegistroDetalle.SetFocus;
   dblcClAux.Enabled := True;
   dblcdProv.Enabled := True;
   dblcClAux.setfocus;
   xModo := 'A';

   dblcClAux.Text := '';
   edtClaseAux.Text := '';
   dblcdProv.Text := '';
   edtProv.Text := '';
   dblcdCargo.Text := '';
   dbeCargoDir.Text := '';
   dblcBancoDetalle.Text := '';
   dbeBanco.Text := '';
   edtCuenta.Text := '';
   dbeTM.Text := '';
   dblcTDoc.Text := '';
   edtTDoc.Text := '';
   edtSerie.Text := '';
   edtNoDoc.Text := '';

   dblcClAux.Enabled := True;
   dblcdProv.Enabled := True;

   dblcClAux.ReadOnly := False;
   dblcdProv.ReadOnly := False;

   xSQL := 'Select ID_NUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, '
      + '          AFECTO4TA, FECCREA, FECMODIF, USUARIO, FREG, HREG, CIAID, '
      + '          case when SUMRES=''+'' then ''1'' else ''2'' end ORDENIMP '
      + '     from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO '
      + '    Where CIAID=' + quotedstr('02')
      + '      and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString)
      + '      and CLAUXID=' + quotedstr(dblcClAux.Text)
      + '      and PROV=' + quotedstr(dblcdProv.Text);
   DMCXP.cdsPlanillaDConcepto.Close;
   DMCXP.cdsPlanillaDConcepto.DataRequest(xSQL);
   DMCXP.cdsPlanillaDConcepto.Open;
   DMCXP.cdsPlanillaDConcepto.IndexFieldNames := 'ORDENIMP;CPTOID';

   DMCXP.cdsPlanillaDet.Append;
   DMCXP.cdsPlanillaDet.FieldByName('CIAID').AsString := '02';
   DMCXP.cdsPlanillaDet.FieldByName('ID_NUMERO').AsString := meNoReg.Text;

   dblcClAux.SetFocus;
End;

Procedure TFPlanillaDietasDetalle.dbgDietaDetalleDblClick(Sender: TObject);
Begin
//dblcClAux.Enabled := False;
//dblcdProv.Enabled := False;
   If DMCXP.cdsPlanillaDet.RECORDCOUNT > 0 Then
   Begin
      xModo := 'M';
      DMCXP.cdsPlanillaDet.Edit;

      pnlRegistroDetalle.Top := 72;
      pnlRegistroDetalle.Left := 176;
      pnlRegistroDetalle.Visible := True;
      pnlDetalle.Enabled := False;
      pnlRegistroDetalle.BringToFront;
      pnlConceptoDet.Visible := False;

      dblcClAux.Text := DMCXP.cdsPlanillaDet.fieldbyname('CLAUXID').AsString;
      dblcClAuxExit(Self);
      dblcdProv.Text := DMCXP.cdsPlanillaDet.fieldbyname('PROV').AsString;
      dblcdProvExit(Self);
      dblcdCargo.Text := DMCXP.cdsPlanillaDet.fieldbyname('IDCARGO').AsString;
      dblcdCargoExit(Self);
      dblcBancoDetalle.Text := DMCXP.cdsPlanillaDet.fieldbyname('BANCOID').AsString;
      dbeBanco.Text := DMCXP.cdsPlanillaDet.fieldbyname('BANCONOM').AsString;
      edtCuenta.Text := DMCXP.cdsPlanillaDet.fieldbyname('CCBCOID').AsString;
      dbeTMDet.Text := DMCXP.cdsPlanillaDet.fieldbyname('TMONID').AsString;

      dblcTDoc.Text := DMCXP.cdsPlanillaDet.fieldbyname('DOCID').AsString;
      dblcTDocExit(Self);
      edtSerie.Text := DMCXP.cdsPlanillaDet.fieldbyname('CPSERIE').AsString;
      edtNoDoc.Text := DMCXP.cdsPlanillaDet.fieldbyname('CPNODOC').AsString;

    //
      xSQL := 'Select ID_NUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, '
         + '          AFECTO4TA, FECCREA, FECMODIF, USUARIO, FREG, HREG, CIAID, '
         + '          case when SUMRES=''+'' then ''1'' else ''2'' end ORDENIMP '
         + '     from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO '
         + '    Where CIAID=' + quotedstr('02')
         + '      and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString)
         + '      and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('CLAUXID').AsString)
         + '      and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('PROV').AsString);
      DMCXP.cdsPlanillaDConcepto.Close;
      DMCXP.cdsPlanillaDConcepto.DataRequest(xSQL);
      DMCXP.cdsPlanillaDConcepto.Open;
      DMCXP.cdsPlanillaDConcepto.IndexFieldNames := 'ORDENIMP;CPTOID';
      dbgDietaDirecto.datasource := DMCXP.dsPlanillaDConcepto;
      dbgDietaDirecto.Selected.Clear;
      dbgDietaDirecto.Selected.Add('CPTOID'#9'10'#9'Concepto'#9'F');
      dbgDietaDirecto.Selected.Add('CPTODES'#9'40'#9'Descripción'#9'F');
      dbgDietaDirecto.Selected.Add('IMPORTE'#9'10'#9'Importe'#9'F');
      dbgDietaDirecto.Selected.Add('SUMRES'#9'5'#9'+/-'#9'F');
      dbgDietaDirecto.Selected.Add('AFECTO4TA'#9'5'#9'Afecto~4ta'#9'F');
      dbgDietaDirecto.ApplySelected;

      dblcCnpEgrDet.Text := DMCXP.cdsPlanillaDConcepto.FieldByName('CPTOID').AsString;

      edtConcepto.Text := DMCXP.cdsPlanillaDConcepto.FieldByName('CPTODES').AsString;

    //
      dblcClAux.Enabled := False;
      dblcdProv.Enabled := False;
      DMCXP.cdsPlanillaDet.Edit;
      dbgDietaDirecto.SetFocus;
   End;
End;

Procedure TFPlanillaDietasDetalle.bbtnVisaClick(Sender: TObject);
Begin
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'I' Then
   Begin
      ShowMessage('Planilla de Dietas se encuentra en Inicial');
      Exit;
   End;
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Planilla de Dietas Esta Anulada');
      Exit;
   End;
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'V' Then
   Begin
      ShowMessage('Planilla de Dietas ya se encuentra Visada');
      Exit;
   End;

   If MessageDlg('¿ Visar la Planilla de Dietas ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

   If DMCXP.cdsPlanillaCab.fieldByname('ID_NUMERO').AsString = '' Then
      ShowMessage('Error al Grabar')
   Else
   Begin
      DMCXP.cdsPlanillaCab.Edit;
      DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString := 'V';
      DMCXP.cdsPlanillaCab.fieldbyname('CUENTAID').AsString := dblcdCuentaCont.Text;
      DMCXP.cdsPlanillaCab.fieldByname('USUVISA').AsString := DMCXP.wUsuario;
      DMCXP.cdsPlanillaCab.fieldByname('FECVISA').AsDateTime := DATE;
      DMCXP.cdsPlanillaCab.Post;

      xSQL := 'Update DB2ADMIN.CXP_PLANI_DIETAS_CAB '
         + '      set DESTADO=' + quotedstr('V') + ', '
         + '          CUENTAID = ' + quotedstr(DMCXP.cdsPlanillaCab.fieldbyname('CUENTAID').AsString) + ','
         + '          USUVISA=' + quotedstr(DMCXP.wUsuario) + ', '
         + '          FECVISA= trunc(sysdate) '
         + '    where ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.fieldByname('ID_NUMERO').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en la Visación de la Planilla de Dietas');
         Exit;
      End;

      EstadoDeForma(DMCXP.cdsPlanillaCab.fieldbyname('DESTADO').AsString, '');

      ShowMessage('Visado');

   End;
End;

Procedure TFPlanillaDietasDetalle.dblcdCuentaContExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If bbtnAnula.Focused then Exit;
   If bbtnObserva.Focused then Exit;
   
   xWhere := 'CUENTAID=' + quotedstr(dblcdCuentaCont.Text) + '  ';
   edtCnpEgr.Text := BuscaQry('dspTGE', 'TGE202', 'CTADES', xWhere, 'CTADES');

   If length(edtCnpEgr.Text) = 0 Then
   Begin
      edtCnpEgr.Text := '';
      ShowMessage('Cuenta Contable no Existe');
      Exit;
   End;
End;

Procedure TFPlanillaDietasDetalle.bbtnCancelarClick(Sender: TObject);
Begin
   pnlRegistro.Visible := False;
End;

Procedure TFPlanillaDietasDetalle.dblcCCBcoExit(Sender: TObject);
Begin
   If length(dblcBanco.text) > 0 Then
   Begin
      dbeTM.Text := DMCXP.cdsCCBco.FieldByName('TMONID').AsString;

   End;
End;

Procedure TFPlanillaDietasDetalle.dblcCCBcoEnter(Sender: TObject);
Begin
   If dblcBanco.text = '' Then
   Begin
      ShowMessage('Debe ingresar Banco');
   End;
End;

Procedure TFPlanillaDietasDetalle.dbgDietaCuentaDblClick(Sender: TObject);
Begin
   bModo := 'M';
   dblcBanco.Enabled := False;

   If DMCXP.cdsPlanillaBanco.RECORDCOUNT > 0 Then
   Begin
      pnlRegistro.Visible := True;
      pnlRegistro.BringToFront;

      dblcBanco.Text := DMCXP.cdsPlanillaBanco.fieldbyname('BANCOID').AsString;
//    dblcBancoExit(Self);
      edtBanco.Text := DMCXP.cdsPlanillaBanco.fieldbyname('BANCONOM').AsString;
      dblcCCBco.Text := DMCXP.cdsPlanillaBanco.fieldbyname('CCBCOID').AsString;
      dbeTM.Text := DMCXP.cdsPlanillaBanco.fieldbyname('TMONID').AsString;

      dblcCCBco.setfocus;
   End;
End;

Procedure TFPlanillaDietasDetalle.bbtnGrabaClick(Sender: TObject);
Var
   xTipDet, xWhere: String;
   xDiferencia, xMontoOri, xIGVx, xTotMG, xTotTO, xCalc: Double;
   cdsClone: TwwClientDataSet;
   xRecord: Integer;
Begin

   If length(dblcTplani.Text) = 0 Then
   Begin
      dblcTplani.SetFocus;
      Raise Exception.Create('Debe Seleccionar el Tipo de Plantilla');
   End;

   DMCXP.wModo := 'M';
   dblcTplani.Enabled := False;

   // Grabar Cabecera
   DMCXP.cdsPlanillaCab.Edit;
   DMCXP.cdsPlanillaCab.fieldbyname('ID_NUMERO').AsString := meNoReg.Text;
   DMCXP.cdsPlanillaCab.fieldbyname('IDNUMERO').AsString := dblcTplani.Text;
   DMCXP.cdsPlanillaCab.fieldbyname('DESCRIPCION').AsString := edtDescripcionPlani.Text;
   DMCXP.cdsPlanillaCab.fieldbyname('CCOSID').AsString := dblcdCCosto.Text;
   DMCXP.cdsPlanillaCab.fieldbyname('CUENTAID').AsString := dblcdCuentaCont.Text;
   DMCXP.cdsPlanillaCab.fieldbyname('TMONID').AsString := dblcTMon.Text;
   DMCXP.cdsPlanillaCab.fieldbyname('FECSESION').AsdateTime := dtpFSesion.DATE;
   DMCXP.cdsPlanillaCab.fieldbyname('FECSUGEREN').AsdateTime := dtpFPosiPago.DATE;
   DMCXP.cdsPlanillaCab.fieldbyname('DESTADO').AsString := 'I';
   DMCXP.cdsPlanillaCab.fieldbyname('USUARIO').AsString := DMCXP.wUsuario;
   DMCXP.cdsPlanillaCab.Post;

   DMCXP.DCOM1.AppServer.IniciaTransaccion;
   xSQL := ' Update DB2ADMIN.CXP_PLANI_DIETAS_CAB '
      + '       set IDNUMERO = ' + quotedstr(DMCXP.cdsPlanillaCab.fieldbyname('IDNUMERO').AsString) + ','
      + '           DESCRIPCION = ' + quotedstr(DMCXP.cdsPlanillaCab.fieldbyname('DESCRIPCION').AsString) + ','
      + '           CCOSID = ' + quotedstr(DMCXP.cdsPlanillaCab.fieldbyname('CCOSID').AsString) + ','
      + '           CUENTAID = ' + quotedstr(DMCXP.cdsPlanillaCab.fieldbyname('CUENTAID').AsString) + ','
      + '           TMONID = ' + quotedstr(DMCXP.cdsPlanillaCab.fieldbyname('TMONID').AsString) + ','
      + '           FECSESION = ' + quotedstr(datetostr(DMCXP.cdsPlanillaCab.fieldbyname('FECSESION').AsdateTime)) + ','
      + '           FECSUGEREN = ' + quotedstr(datetostr(DMCXP.cdsPlanillaCab.fieldbyname('FECSUGEREN').AsdateTime)) + ','
      + '           DESTADO = ''I'', '
      + '           USUARIO = ' + quotedstr(DMCXP.cdsPlanillaCab.fieldbyname('USUARIO').AsString) + ','
      + '           FECMODIF = sysdate, '
      + '           FREG = trunc(sysdate), '
      + '           HREG = sysdate '
      + '     Where ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.fieldbyname('ID_NUMERO').AsString);
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se puede Actualizar la cabecera de la Planilla');
      exit;
   End;

   EstadoDeForma(DMCXP.cdsPlanillaCab.fieldbyname('DESTADO').AsString, '');
   DMCXP.DCOM1.AppServer.GrabaTransaccion;
   ShowMessage('Se Actualizó correctamente la Planilla de Dieta');
   AsignaDatasource;
End;

Procedure TFPlanillaDietasDetalle.EstadoDeForma(xMovEstado, xConta: String);
Begin
   // Desactivar Combitos
   dblcTMon.Enabled := False;
   //
   If xMovEstado <> '' Then
      lblEstadoDescr.Visible := True
   Else
      lblEstadoDescr.Visible := False;
   // Desactivar Botones
   bbtnRegresa.Enabled := False;
   bbtnGraba.Enabled := False;
   bbtnAcepta.Enabled := False;
   bbtnAnula.Enabled := False;
   bbtnVisa.Enabled := False;
   bbtnObserva.Enabled := False;
   bbtnApruebaPago.Enabled := False;
   bbtnVisorOPago.Enabled := False;
   bbtnPago.Enabled := False;
   bbtnContab.Enabled := False;
   // Desactivar Grupos de la Pantalla de Planilla
   grpDatosGenerales.Enabled := False;
   grpCuentaCorriente.Enabled := False;
   grpCuentaContable.Enabled := False;
   grpDetallePlanilla.Enabled := False;
   // Desactivar botones de Adición de Grillas
   btnActReg.Enabled := False;
   btnActCuenta.Enabled := False;
   // Desactivar Grid
   dbgDietaDetalle.Enabled := False;
   dbgDietaCuenta.Enabled := False;

   If (xMovEstado = 'I') Or (xMovEstado = 'T') Then
   Begin
      lblEstadoDescr.Caption := 'ACTIVO';
      lblEstadoDescr.Font.Color := clGreen;
      grpDatosGenerales.Enabled := True;
      grpDetallePlanilla.Enabled := True;
      dbgDietaDetalle.Enabled := True;
      btnActReg.Enabled := True;
      bbtnGraba.Enabled := True;
   End;

   If xMovEstado = 'I' Then // si ya esta grabado
   Begin
      bbtnAcepta.Enabled := True;
      bbtnRegresa.Enabled := True;
   End;

   If (xMovEstado = 'P') Then
   Begin
      lblEstadoDescr.Caption := 'ACEPTADO';
      lblEstadoDescr.Font.Color := clBlue;

      bbtnAnula.Enabled := True;
      bbtnVisa.Enabled := True;
      bbtnObserva.Enabled := True;
      grpCuentaContable.Enabled := True;
   End;

   If (xMovEstado = 'A') Then
   Begin
      lblEstadoDescr.Caption := 'ANULADO';
      lblEstadoDescr.Font.Color := clRed;
   End;

   If (xMovEstado = 'V') Then
   Begin
      lblEstadoDescr.Caption := 'VISADO';
      lblEstadoDescr.Font.Color := clGreen;

      bbtnApruebaPago.Enabled := True;
      grpCuentaCorriente.Enabled := True;
      dbgDietaCuenta.Enabled := True;
      btnActCuenta.Enabled := True;
   End;

   If (xMovEstado = 'L') Then
   Begin
      lblEstadoDescr.Caption := 'APROBADO';
      lblEstadoDescr.Font.Color := clGreen;
      bbtnVisorOPago.Enabled := True;
      bbtnPago.Enabled := True;
   End;

   If (xMovEstado = 'O') And (xConta = '') Then
   Begin
      lblEstadoDescr.Caption := 'CONFIRMADO';
      lblEstadoDescr.Font.Color := clBlue;
      bbtnVisorOPago.Enabled := True;
      bbtnContab.Enabled := True;
   End;

   If (xMovEstado = 'O') And (xConta = 'S') Then
   Begin
      bbtnVisorOPago.Enabled := True;
      lblEstadoDescr.Caption := 'CONTABILIZADO';
      lblEstadoDescr.Font.Color := clNavy;
   End;

   If xMovEstado = 'E' Then
   Begin
      lblEstadoDescr.Caption := 'ELIMINADO';
      lblEstadoDescr.Font.Color := clRed;
   End;
End;

Procedure TFPlanillaDietasDetalle.bbtnAceptaClick(Sender: TObject);
Begin
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'P' Then
   Begin
      ShowMessage('Planilla de Dietas se encuentra Aceptada');
      Exit;
   End;
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Planilla de Dietas Esta Anulada');
      Exit;
   End;
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'V' Then
   Begin
      ShowMessage('Planilla de Dietas ya se encuentra Visada');
      Exit;
   End;

   xSQL := 'Select sum(DET_CONCEPTO) DET_CONCEPTO, sum(DETALLE) DETALLE '
      + '     from (Select count(*) DET_CONCEPTO, 0 DETALLE '
      + '              from (select distinct CLAUXID, PROV '
      + '                      from CXP_PLANILLAS_DET_CONCEPTO '
      + '                     where CIAID=''02'' '
      + '                       and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.fieldByname('ID_NUMERO').AsString) + ')'
      + '            Union all '
      + '           Select 0 DET_CONCEPTO, count(*) DETALLE '
      + '             from CXP_PLANILLAS_DIETAS_DET '
      + '            where CIAID=''02'' '
      + '              and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.fieldByname('ID_NUMERO').AsString)
      + '           )';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.FieldByName('DET_CONCEPTO').AsInteger <> DMCXP.cdsQry.FieldByName('DETALLE').AsInteger Then
   Begin
      ShowMessage('Algunos Directivos no tienen detalle de Conceptos, no se puede ACEPTAR');
      Exit;
   End;

   If DMCXP.cdsQry.FieldByName('DET_CONCEPTO').AsInteger = 0 Then
   Begin
      ShowMessage('No se puede ACEPTAR, con 0 registros en el Detalle');
      Exit;
   End;

   If MessageDlg('¿ Aceptar la Planilla de Dietas ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

   If DMCXP.cdsPlanillaCab.fieldByname('ID_NUMERO').AsString = '' Then
      ShowMessage('Error al Grabar')
   Else
   Begin
      DMCXP.cdsPlanillaCab.Edit;
      DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString := 'P';
      DMCXP.cdsPlanillaCab.fieldByname('USUACEPTA').AsString := DMCXP.wUsuario;
      DMCXP.cdsPlanillaCab.fieldByname('FECACEPTA').AsDateTime := DATE;
      DMCXP.cdsPlanillaCab.Post;

      xSQL := 'Update DB2ADMIN.CXP_PLANI_DIETAS_CAB '
         + '      set DESTADO=' + quotedstr('P') + ', '
         + '          USUACEPTA=' + quotedstr(DMCXP.wUsuario) + ', '
         + '          FECACEPTA= trunc(sysdate) '
         + '    where CIAID=' + quotedstr('02')
         + '      and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.fieldByname('ID_NUMERO').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en la Aceptación de la Planilla de Dietas');
         Exit;
      End;

      EstadoDeForma(DMCXP.cdsPlanillaCab.fieldbyname('DESTADO').AsString, '');

      ShowMessage('Aceptada');
   End;
End;

Procedure TFPlanillaDietasDetalle.bbtnObservaClick(Sender: TObject);
Begin
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'I' Then
   Begin
      ShowMessage('Planilla de Dietas se encuentra en Inicial');
      Exit;
   End;
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Planilla de Dietas Esta Anulada');
      Exit;
   End;
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'V' Then
   Begin
      ShowMessage('Planilla de Dietas ya se encuentra Visada');
      Exit;
   End;

   If MessageDlg('¿ Desea Observar la Planilla de Dietas ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

   If DMCXP.cdsPlanillaCab.fieldByname('ID_NUMERO').AsString = '' Then
      ShowMessage('Error al Grabar')
   Else
   Begin
      DMCXP.cdsPlanillaCab.Edit;
      DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString := 'I';
      DMCXP.cdsPlanillaCab.fieldByname('CUENTAID').AsString := '';
      DMCXP.cdsPlanillaCab.fieldByname('USUACEPTA').AsString := '';
      DMCXP.cdsPlanillaCab.fieldByname('FECACEPTA').AsDateTime := 0;
      DMCXP.cdsPlanillaCab.Post;

      xSQL := 'Update DB2ADMIN.CXP_PLANI_DIETAS_CAB '
         + '      set DESTADO=' + quotedstr('I') + ', '
         + '          CUENTAID='''', '
         + '          USUACEPTA='''', '
         + '          FECACEPTA= NULL '
         + '    where CIAID=' + quotedstr('02')
         + '      and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.fieldByname('ID_NUMERO').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en la Observación de la Planilla de Dietas');
         Exit;
      End;
      dblcdCuentaCont.Text := '';
      edtCnpEgr.Text := '';
      EstadoDeForma(DMCXP.cdsPlanillaCab.fieldbyname('DESTADO').AsString, '');

      ShowMessage('Observado');
   End;
End;

Function TFPlanillaDietasDetalle.fg_validaCierreContable(
   wgFecha: TDateTime): Boolean;
Var
   xnAnio, xnMes, xnDia: Word;
Begin
   decodeDate(wgFecha, xnAnio, xnMes, xnDia);
   If DMCXP.MesCerrado(intToStr(xnMes), intToStr(xnAnio), '02') Then
   Begin
      Result := True;
      exit;
   End;
   Result := False;
End;

Procedure TFPlanillaDietasDetalle.bbtnApruebaPagoClick(Sender: TObject);
Var
   xNumOrdsPago, xNomArchivo, xCorrelativo: String;
Begin
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'I' Then
   Begin
      ShowMessage('Planilla de Dietas se encuentra en Inicial');
      Exit;
   End;
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Planilla de Dietas Esta Anulada');
      Exit;
   End;
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'P' Then
   Begin
      ShowMessage('Planilla de Dietas ya se encuentra Aceptada');
      Exit;
   End;
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'L' Then
   Begin
      ShowMessage('Planilla de Dietas ya se encuentra Aprobado para Pago');
      Exit;
   End;

   xSQL := ' Select BANCOID, CCBCOID, TMONID '
      + '      from DB2ADMIN.CXP_PLANILLAS_CUENTA_BANCO '
      + '     Where CIAID=' + quotedstr('02')
      + '       and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.fieldByname('ID_NUMERO').AsString);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No se han definido Cuentas Corrientes de Derrama para el Pago');
      Exit;
   End;

   xSQL := 'Select TCAMVBC '
      + '     from DB2ADMIN.TGE107 '
      + '    where TMONID=' + quotedstr(DMCXP.wTMonExt)
      + '      and FECHA=trunc(Sysdate) ';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage(' Fecha No tiene Tipo de Cambio para Dólares');
      Exit;
   End;

   If MessageDlg('¿ Aprobar la Planilla de Dietas ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

   DMCXP.cdsPlanillaCab.Edit;
   DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString := 'L';
   DMCXP.cdsPlanillaCab.fieldByname('USUVISA').AsString := DMCXP.wUsuario;
   DMCXP.cdsPlanillaCab.fieldByname('FECVISA').AsDateTime := DATE;
   DMCXP.cdsPlanillaCab.Post;

   xSQL := 'Update DB2ADMIN.CXP_PLANI_DIETAS_CAB '
      + '      set DESTADO=' + quotedstr('L') + ', '
      + '          USUAPRUEBA=' + quotedstr(DMCXP.wUsuario) + ', '
      + '          FECAPRUEBA= trunc(sysdate) '
      + '    where CIAID=' + quotedstr('02')
      + '      and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.fieldByname('ID_NUMERO').AsString);
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error en la Aprobación de la Planilla de Dietas');
      Exit;
   End;

   EstadoDeForma(DMCXP.cdsPlanillaCab.fieldbyname('DESTADO').AsString, '');

   // Dispara el procedimiento de Provisión por Pagar
   // Procedimiento 1
   Try
      xSQL := 'CALL DB2ADMIN.SP_CXP_GEN_CXP_X_DIETAS(''02'','
         + QuotedStr(meNoReg.Text) + ')';
      DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);
   Except
      showmessage('Error al intentar Generar la Orden de Pago');
      exit;
      Raise;
   End;
   // Dispara el procedimiento de Orden de Pago
   // Procedimiento 2

   Try
      xSQL := 'CALL DB2ADMIN.SP_CXP_GEN_OPAGO_X_DIETAS(''02'','
         + QuotedStr(meNoReg.Text) + ',' + quotedstr(xNumOrdsPago) + ')';
      DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);
   Except
      showmessage('Error al intentar Generar la Orden de Pago');
      exit;
      Raise;
   End;

   xNumOrdsPago := 'DETALLADO'; // Para generar una Sola Orden de Pago por Banco cambiara a valor 'UNO'

   xSQL := ' Select C.ID_NUMERO, C.BANCOID, B.BANCONOM, C.CCBCOID, C.TMONID, C.FECCREA, C.FECMODIF, C.USUARIO, C.FREG, C.HREG '
      + '      from DB2ADMIN.CXP_PLANILLAS_CUENTA_BANCO C '
      + '           INNER JOIN TGE105 B ON C.BANCOID = B.BANCOID '
      + '     Where C.CIAID=' + quotedstr('02')
      + '       and C.ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString)
      + '     order by C.BANCOID ';
   DMCXP.cdsPlanillaBanco.Close;
   DMCXP.cdsPlanillaBanco.DataRequest(xSQL);
   DMCXP.cdsPlanillaBanco.Open;

// Genera el Archivo de Texto para el Banco de la Orden de Pago
   If xNumOrdsPago = 'UNO' Then
   Begin

      If Not sdGraba.Execute Then Exit;

      DMCXP.cdsPlanillaBanco.First;
      While Not DMCXP.cdsPlanillaBanco.Eof Do
      Begin

         If DMCXP.cdsPlanillaBanco.fieldByname('BANCOID').AsString = '05' Then
            GrabaTextoBBVA(DMCXP.dsPlanillaDet, sdGraba.FileName, ',')
         Else
            GrabaTexto(DMCXP.dsPlanillaDet, sdGraba.FileName, ',');

         DMCXP.cdsPlanillaBanco.Next;
      End;
   End
   Else // 'DETALLADO'
   Begin

      If Not sdGraba.Execute Then Exit;

      xCorrelativo := '0';
      {
      xSQL := 'Select ID_NUMERO, ITEM, CLAUXID, PROV, PROVDES, CARGO, DOCID, CPSERIE, CPNODOC, MONTOT, BANCOID, CCBCOID, '
         + '          TMONID, FECCREA, FECMODIF, USUARIO, FREG, HREG, CIAID '
         + '     from DB2ADMIN.CXP_PLANILLAS_DIETAS_DET '
         + '    where CIAID=' + quotedstr('02')
         + '      and ID_NUMERO=' + quotedstr(meNoReg.Text);
      DMCXP.cdsQry7.Close;
      DMCXP.cdsQry7.DataRequest(xSQL);
      DMCXP.cdsQry7.Open;
      }
      DMCXP.cdsPlanillaBanco.First;
      While Not DMCXP.cdsPlanillaBanco.Eof Do
      Begin
         DMCXP.cdsPlanillaDet.First;
         While Not DMCXP.cdsPlanillaDet.EOF Do
         Begin
            If DMCXP.cdsPlanillaDet.FieldByName('BANCOID').AsString = DMCXP.cdsPlanillaBanco.FieldByName('BANCOID').AsString Then
            Begin
               xSQL := 'Select ID_NUMERO, ITEM, CLAUXID, PROV, PROVDES, CARGO, DOCID, CPSERIE, CPNODOC, MONTOT, BANCOID, CCBCOID, '
                  + '          TMONID, FECCREA, FECMODIF, USUARIO, FREG, HREG, CIAID '
                  + '     from DB2ADMIN.CXP_PLANILLAS_DIETAS_DET '
                  + '    where CIAID=' + quotedstr('02')
                  + '      and ID_NUMERO=' + quotedstr(meNoReg.Text)
                  + '      and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
                  + '      and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString);
               DMCXP.cdsQry9.Close;
               DMCXP.cdsQry9.DataRequest(xSQL);
               DMCXP.cdsQry9.Open;
               xCorrelativo := StrZero(inttostr(strtoint(xCorrelativo) + 1), 2);
               xNomArchivo := 'PLLA_DIETA_' + DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString + '_' + xCorrelativo + '_' + trim(copy(edtDescripcionPlani.Text, 1, 20)) + '.txt';
               If DMCXP.cdsPlanillaDet.fieldByname('BANCOID').AsString = '05' Then
                  GrabaTextoBBVA(DMCXP.dsQry9, xNomArchivo, ',')
               Else
                  GrabaTexto(DMCXP.dsQry9, xNomArchivo, ',');
            End;
            DMCXP.cdsPlanillaDet.Next;
         End;
         DMCXP.cdsPlanillaBanco.Next;
      End;
   End;

   ShowMessage('Aprobado');
   DMCXP.cdsQry9.Close;
End;

Procedure TFPlanillaDietasDetalle.dblcTMonExit(Sender: TObject);
Var
   xWhere, xTipo: String;
Begin

   xWhere := 'TMONID=' + '''' + dblcTMon.Text + '''';
   edtTMon.Text := BuscaQry('PrvTGE', 'TGE103', 'TMONDES, TMON_LOC', xWhere, 'TMONDES');
   If length(edtTMon.Text) = 0 Then
   Begin
      ShowMessage('Falta Tipo de Moneda');
      exit;
   End;

End;

Procedure TFPlanillaDietasDetalle.btnActCuentaClick(Sender: TObject);
Begin
   pnlRegistro.Top := 224;
   pnlRegistro.Left := 128;
   pnlRegistro.Visible := True;
   pnlRegistro.BringToFront;
   pnlRegistro.SetFocus;
   bModo := 'A';

   xSQL := 'Select T.BANCOID, T.BANCONOM '
      + '     from DB2ADMIN.TGE105 T '
      + '    where T.BANCOID in (Select distinct BANCOID '
      + '                          from DB2ADMIN.CXP_PLANILLAS_DIETAS_DET '
      + '                         where CIAID=''02'' '
      + '                           and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.fieldByname('ID_NUMERO').AsString) + ') '
      + '    order by T.BANCOID ';
   DMCXP.cdsBanco.Close;
   DMCXP.cdsBanco.DataRequest(xSQL);
   DMCXP.cdsBanco.open;
   DMCXP.cdsBanco.Filter := '';
   DMCXP.cdsBanco.Filtered := False;
   DMCXP.cdsBanco.IndexFieldNames := 'BANCOID';

   dblcBanco.Enabled := True;
   dblcCCBco.Enabled := True;
End;

Procedure TFPlanillaDietasDetalle.bbtnRegDetalleOkClick(Sender: TObject);
Var
   xTipDet, xWhere: String;
   xItem: Integer;
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
   If length(dblcBancoDetalle.Text) = 0 Then
   Begin
      dblcBancoDetalle.SetFocus;
      Raise Exception.Create('Debe seleccionar el Banco');
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
   If length(edtNoDoc.Text) = 0 Then
   Begin
      edtNoDoc.SetFocus;
      Raise Exception.Create('Debe ingresar el Número del Documento');
   End;
   If xModo = 'A' Then
   Begin
      xSQL := 'Select max(ITEM) ITEM '
         + '     from DB2ADMIN.CXP_PLANILLAS_DIETAS_DET '
         + '    where CIAID = ' + quotedstr('02')
         + '      and ID_NUMERO = ' + quotedstr(meNoReg.Text);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      xItem := 1;
      If DMCXP.cdsQry.RecordCount>0 Then
         xItem := DMCXP.cdsQry.FieldByName('ITEM').AsInteger + 1;
   End
   Else
   Begin
      xItem := DMCXP.cdsPlanillaDet.fieldbyname('ITEM').AsInteger;
   End;

   DMCXP.cdsPlanillaDet.Edit;
   DMCXP.cdsPlanillaDet.fieldbyname('ID_NUMERO').AsString := meNoReg.Text;
   DMCXP.cdsPlanillaDet.fieldbyname('ITEM').AsInteger := xItem;
   DMCXP.cdsPlanillaDet.fieldbyname('CLAUXID').AsString := dblcClAux.Text;
   DMCXP.cdsPlanillaDet.fieldbyname('PROV').AsString := dblcdProv.Text;
   DMCXP.cdsPlanillaDet.fieldbyname('PROVDES').AsString := edtProv.Text;
   DMCXP.cdsPlanillaDet.fieldbyname('IDCARGO').AsString := dblcdCargo.Text;
   DMCXP.cdsPlanillaDet.fieldbyname('DESCRIPCION').AsString := dbeCargoDir.Text;
   DMCXP.cdsPlanillaDet.fieldbyname('DOCID').AsString := dblcTDoc.Text;
   DMCXP.cdsPlanillaDet.fieldbyname('CPSERIE').AsString := edtSerie.Text;
   DMCXP.cdsPlanillaDet.fieldbyname('CPNODOC').AsString := edtNoDoc.Text;
   DMCXP.cdsPlanillaDet.fieldbyname('MONTOT').AsFloat := 0;
   DMCXP.cdsPlanillaDet.fieldbyname('BANCOID').AsString := dblcBancoDetalle.Text;
   DMCXP.cdsPlanillaDet.fieldbyname('CCBCOID').AsString := edtCuenta.Text;
   DMCXP.cdsPlanillaDet.fieldbyname('TMONID').AsString := dbeTMDet.Text;
   DMCXP.cdsPlanillaDet.fieldbyname('USUARIO').AsString := DMCXP.wUsuario;
   DMCXP.cdsPlanillaDet.Post;

   If xModo = 'A' Then
   Begin
      DMCXP.DCOM1.AppServer.IniciaTransaccion;

      xSQL := ' Insert into DB2ADMIN.CXP_PLANILLAS_DIETAS_DET( CIAID, ID_NUMERO, ITEM, CLAUXID, PROV, PROVDES, CARGO, DOCID, CPSERIE, CPNODOC, MONTOT, BANCOID, CCBCOID, TMONID, FECCREA, FECMODIF, USUARIO, FREG, HREG ) '
         + '    Values( ' + quotedstr('02') + ','
         + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('ID_NUMERO').AsString) + ', '
         + inttostr(DMCXP.cdsPlanillaDet.fieldbyname('ITEM').AsInteger) + ', '
         + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('CLAUXID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('PROV').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('PROVDES').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('IDCARGO').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('DOCID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('CPSERIE').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('CPNODOC').AsString) + ', '
         + '                0, '
         + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('BANCOID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('CCBCOID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('TMONID').AsString) + ', '
         + '                trunc(sysdate),  '
         + '                sysdate,  '
         + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('USUARIO').AsString) + ', '
         + '                trunc(sysdate),  '
         + '                sysdate )';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo Insertar el Detalle de la Planilla de Dieta');
         exit;
      End;

      DMCXP.DCOM1.AppServer.GrabaTransaccion;
      xModo := 'M';
      xSQL := 'Select ID_NUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, '
         + '          AFECTO4TA, FECCREA, FECMODIF, USUARIO, FREG, HREG, CIAID, '
         + '          case when SUMRES=''+'' then ''1'' else ''2'' end ORDENIMP '
         + '     from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO '
         + '    Where CIAID=' + quotedstr('02')
         + '      and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString)
         + '      and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('CLAUXID').AsString)
         + '      and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('PROV').AsString);
      DMCXP.cdsPlanillaDConcepto.Close;
      DMCXP.cdsPlanillaDConcepto.DataRequest(xSQL);
      DMCXP.cdsPlanillaDConcepto.Open;
      DMCXP.cdsPlanillaDConcepto.IndexFieldNames := 'ORDENIMP;CPTOID';
      dbgDietaDirecto.datasource := DMCXP.dsPlanillaDConcepto;
      dbgDietaDirecto.Selected.Clear;
      dbgDietaDirecto.Selected.Add('CPTOID'#9'10'#9'Concepto'#9'F');
      dbgDietaDirecto.Selected.Add('CPTODES'#9'40'#9'Descripción'#9'F');
      dbgDietaDirecto.Selected.Add('IMPORTE'#9'10'#9'Importe'#9'F');
      dbgDietaDirecto.Selected.Add('SUMRES'#9'5'#9'+/-'#9'F');
      dbgDietaDirecto.Selected.Add('AFECTO4TA'#9'5'#9'Afecto~4ta'#9'F');
      dbgDietaDirecto.ApplySelected;
   End
   Else
   Begin
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      xSQL := ' Update DB2ADMIN.CXP_PLANILLAS_DIETAS_DET '
         + '       set CARGO = ' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('IDCARGO').AsString) + ','
         + '           DOCID = ' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('DOCID').AsString) + ','
         + '           CPSERIE = ' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('CPSERIE').AsString) + ','
         + '           CPNODOC = ' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('CPNODOC').AsString) + ','
         + '           BANCOID = ' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('BANCOID').AsString) + ','
         + '           CCBCOID = ' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('CCBCOID').AsString) + ','
         + '           TMONID = ' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('TMONID').AsString) + ','
         + '           USUARIO = ' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('USUARIO').AsString) + ','
         + '           FECMODIF = sysdate, '
         + '           FREG = trunc(sysdate), '
         + '           HREG = sysdate '
         + '     Where CIAID=' + quotedstr('02')
         + '       and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('ID_NUMERO').AsString)
         + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('CLAUXID').AsString)
         + '       and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('PROV').AsString)
         + '       and ITEM=' + inttostr(DMCXP.cdsPlanillaDet.fieldbyname('ITEM').AsInteger);

      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede actualizar el Detalle de la Planilla de Dieta');
         exit;
      End;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
   End;
   dbgDietaDirecto.SetFocus;
End;

Procedure TFPlanillaDietasDetalle.dblcClAuxExit(Sender: TObject);
Begin
   xSQL := 'Select CLAUXID, PROV, PROVRUC, PROVDES, PROVABR, PROVNOMCOM, PROVRETIGV, PAISID, PROVDIR, '
      + '          PROVCZIP, PROVTELF, PROVFAX, PROVEMAI, CONVDOBTRI '
      + '     from DB2ADMIN.TGE201 '
      + '    where CLAUXID = ' + quotedstr(dblcClAux.Text)
      + '      and nvl(ACTIVO,''N'')=''S'' ';
   Filtracds(DMCXP.cdsProv, xSQL);

   If length(dblcClAux.Text) > 0 Then
   Begin
      xSQL := 'CLAUXID=' + quotedstr(dblcClAux.Text);
      edtClaseAux.Text := BuscaQry('dspTGE', 'TGE102', 'CLAUXID, CLAUXDES', xSQL, 'CLAUXDES');
      DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString := dblcClAux.Text;
   End;
End;

Procedure TFPlanillaDietasDetalle.dblcdProvExit(Sender: TObject);
Var
   xWhere, xNumDoc: String;
Begin
   If bbtnCanc.Focused Then Exit;

   If xModo = 'A' Then
   Begin
      xSQL := 'Select PROV '
         + '     from DB2ADMIN.CXP_PLANILLAS_DIETAS_DET '
         + '    where CIAID=' + quotedstr('02')
         + '      and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('ID_NUMERO').AsString)
         + '      and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
         + '      and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      If DMCXP.cdsQry.RecordCount > 0 Then
      Begin
         ShowMessage('Directivo ya se encuentra en la presente Planilla');
         dblcdProv.SetFocus;
         Exit;
      End;

   // Tipo de Documento
      DMCXP.cdsPlanillaDet.FieldByName('DOCID').AsString := '34';
      dblcTDoc.Text := DMCXP.cdsPlanillaDet.FieldByName('DOCID').AsString;
      dblcTDocExit(Self);

   // Serie del Documento
      xSQL := 'Select nvl(max(CPSERIE),''0'') CPSERIE '
         + '     from DB2ADMIN.CXP_PLANILLAS_DIETAS_DET '
         + '    where CIAID=' + quotedstr('02')
         + '      and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
         + '      and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      If DMCXP.cdsQry.RecordCount > 0 Then
         xNumDoc := DMCXP.cdsQry.FieldByName('CPSERIE').AsString
      Else
         xNumDoc := dblcClAux.Text + '001';
      DMCXP.cdsPlanillaDet.FieldByName('CPSERIE').AsString := xNumDoc;
      edtSerie.Text := xNumDoc;

   // Número de Documento
      xSQL := 'Select nvl(max(CPNODOC),''0'') MAXNUMERO '
         + '     from DB2ADMIN.CXP_PLANILLAS_DIETAS_DET '
         + '    where CIAID=' + quotedstr('02')
         + '      and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
         + '      and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString)
         + '      and CPSERIE=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CPSERIE').AsString);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      If DMCXP.cdsQry.RecordCount = 0 Then
         xNumDoc := '0'
      Else
         xNumDoc := DMCXP.cdsQry.FieldByName('MAXNUMERO').AsString;
      xNumDoc := StrZero((inttostr(strtoint(xNumDoc) + 1)), 5);
      DMCXP.cdsPlanillaDet.FieldByName('CPNODOC').AsString := xNumDoc;
      edtNoDoc.Text := xNumDoc;
   End;

   If length(dblcdProv.Text) > 0 Then
   Begin
      xWhere := 'CLAUXID=' + quotedstr(dblcClAux.Text)
         + ' and PROV=' + quotedstr(dblcdProv.Text);

      edtProv.Text := BuscaQry('dspTGE', 'TGE201', 'PROV, PROVRUC, PROVDES, PROVRETIGV, ACTIVO, ESDOMIC', xWhere, 'PROVDES');
   End
   Else
   Begin
      edtProv.Text := '';
      ShowMessage('No ha seleccionado el Nombre del Directivo');
      dblcdProv.SetFocus;
      exit;
   End;

   xSQL := ' Select T.BANCOID, T5.BANCONOM, T.CCBCOID, T.TMONID '
      + '      from DB2ADMIN.CAJA102 T INNER JOIN DB2ADMIN.TGE105 T5 ON T.BANCOID = T5.BANCOID '
      + '     where T.CLAUXID = ' + quotedstr(dblcClAux.Text)
      + '       and T.PROV = ' + quotedstr(dblcdProv.Text)
      + '     Group by T.BANCOID, T5.BANCONOM, T.CCBCOID, T.TMONID ';
   DMCXP.cdsBanco.Close;
   DMCXP.cdsBanco.DataRequest(xSQL);
   DMCXP.cdsBanco.open;
   DMCXP.cdsBanco.Filter := '';
   DMCXP.cdsBanco.Filtered := False;
   DMCXP.cdsBanco.IndexFieldNames := 'BANCOID';

   dblcBancoDetalle.Selected.Clear;
   dblcBancoDetalle.Selected.Add('BANCOID'#9'3'#9'Id~Banco.'#9'F');
   dblcBancoDetalle.Selected.Add('BANCONOM'#9'25'#9'Banco.'#9'F');
   dblcBancoDetalle.Selected.Add('CCBCOID'#9'18'#9'Cuenta~Bancaria'#9'F');
   dblcBancoDetalle.Selected.Add('TMONID'#9'2'#9'Moneda'#9'F');
End;

Procedure TFPlanillaDietasDetalle.dblcdCargoExit(Sender: TObject);
Begin
   If length(dblcdCargo.Text) > 0 Then
      xSQL := 'IDCARGO=' + quotedstr(dblcdCargo.Text);

   dbeCargoDir.Text := BuscaQry('dspTGE', 'CXP_CARGOS_DIRECT', 'IDCARGO, DESCRIPCION', xSQL, 'DESCRIPCION');
End;

Procedure TFPlanillaDietasDetalle.dblcBancoDetalleExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If DMCXP.cdsBanco.RecordCount > 0 Then
   Begin
      dbeBanco.Text := DMCXP.cdsBanco.FieldByName('BANCONOM').AsString;
      edtCuenta.Text := DMCXP.cdsBanco.FieldByName('CCBCOID').AsString;
      dbeTMDet.Text := DMCXP.cdsBanco.FieldByName('TMONID').AsString;
   End;
End;

Procedure TFPlanillaDietasDetalle.dblcTDocExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If length(dblcTDoc.Text) > 0 Then
      xWhere := 'DOCID=' + quotedstr(dblcTDoc.Text);

   edtTDoc.Text := BuscaQry('dspTGE', 'TGE110', 'DOCID, DOCDES', xWhere, 'DOCDES');
End;

Procedure TFPlanillaDietasDetalle.dbgDietaDetalleKeyDown(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin

      If MessageDlg('Eliminar el Detalle de la Planilla de Dietas ¿Continuar? ',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         xSQL := 'Delete from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO '
            + '    where CIAID=' + quotedstr('02')
            + '      and ID_NUMERO = ' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('ID_NUMERO').AsString)
            + '      and CLAUXID = ' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('CLAUXID').AsString)
            + '      and PROV = ' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('PROV').AsString);
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se puede Eliminar el detalle de Conceptos del Directivo en la Planilla de Dieta');
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         xSQL := 'Delete from DB2ADMIN.CXP_PLANILLAS_DIETAS_DET '
            + '    where CIAID=' + quotedstr('02')
            + '      and ID_NUMERO = ' + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('ID_NUMERO').AsString)
            + '      and ITEM = ' + inttostr(DMCXP.cdsPlanillaDet.fieldbyname('ITEM').AsInteger);
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se puede Eliminar el detalle de la Planilla de Dieta');
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
         ShowMessage('Se eliminó correctamente el detalle de la Planilla de Dieta');
      End;
      AsignaDatasource;
   End;
End;

Procedure TFPlanillaDietasDetalle.bbtnPagoClick(Sender: TObject);
Begin
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'I' Then
   Begin
      ShowMessage('Planilla de Dietas se encuentra en Inicial');
      Exit;
   End;
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Planilla de Dietas Esta Anulada');
      Exit;
   End;
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'P' Then
   Begin
      ShowMessage('Planilla de Dietas ya se encuentra Aceptada');
      Exit;
   End;

   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'V' Then
   Begin
      ShowMessage('Planilla de Dietas ya se encuentra Visado para Pago');
      Exit;
   End;

   xSQL := 'Select NUMERO, NUMERO, NUMPLA, NUMOPE '
      + '     from DB2ADMIN.CXP_ORD_PAG_CAB '
      + '    where CIAID=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('CIAID').AsString)
      + '      and MODULO=' + quotedstr('TLC')
      + '      and DOCID=' + quotedstr('34')
      + '      and CPNODOC=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No se ha generado correctamente la Orden de Pago');
      Exit;
   End;

   DMCXP.cdsQry.First;
   While not DMCXP.cdsQry.EOF Do
   Begin
      If (length(DMCXP.cdsQry.FieldByName('NUMPLA').AsString) = 0) or
         (length(DMCXP.cdsQry.FieldByName('NUMOPE').AsString) = 0) Then
      Begin
         ShowMessage('Regularice primero los datos de retorno del Banco');
         PideDatosBanco('CONFIRMA');
         Exit;
      End;
      DMCXP.cdsQry.Next;
   End;

   If MessageDlg('¿ Confirma la Planilla de Dietas ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

   If DMCXP.cdsPlanillaCab.fieldByname('ID_NUMERO').AsString = '' Then
      ShowMessage('Error al Grabar')
   Else
   Begin
      DMCXP.cdsPlanillaCab.Edit;
      DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString := 'O';
      DMCXP.cdsPlanillaCab.fieldByname('USUCONFIRMA').AsString := DMCXP.wUsuario;
      DMCXP.cdsPlanillaCab.fieldByname('FECCONFIRMA').AsDateTime := DATE;
      DMCXP.cdsPlanillaCab.Post;

      xSQL := 'Update DB2ADMIN.CXP_PLANI_DIETAS_CAB '
         + '      set DESTADO=' + quotedstr('O') + ', '
         + '          USUCONFIRMA=' + quotedstr(DMCXP.wUsuario) + ', '
         + '          FECCONFIRMA= trunc(sysdate) '
         + '    where CIAID=' + quotedstr('02')
         + '      and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.fieldByname('ID_NUMERO').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en la Aprobación de la Planilla de Dietas');
         Exit;
      End;

   // Inicio HPC_201804_CXP
   // 19/07/2018 Incluye Contabilización de Provisiones y Órdenes de Pago
//      EstadoDeForma(DMCXP.cdsPlanillaCab.fieldbyname('DESTADO').AsString, '');

      ShowMessage('Confirmado');

      xSQL := 'Begin '
         + '      SP_CXP_PL_DIETA_A_CNT('+quotedstr(DMCXP.cdsPlanillaCab.FieldByName('CIAID').AsString)+','+quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString)+'); '
         + '   End; ';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en Contabilización de la Dieta');
         Exit;
      End;

      xSQL := 'Select DB2ADMIN.FN_CXP_PL_DIETA_A_CNT('+quotedstr(DMCXP.cdsPlanillaCab.FieldByName('CIAID').AsString)+','
                +quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString)+') RESULTADO from DUAL';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      ShowMessage('Contabilización : '+DMCXP.cdsQry.FieldByName('RESULTADO').AsString);

      If DMCXP.cdsQry.FieldByName('RESULTADO').AsString='OK' Then
         EstadoDeForma(DMCXP.cdsPlanillaCab.fieldbyname('DESTADO').AsString, 'S')
      Else
         EstadoDeForma(DMCXP.cdsPlanillaCab.fieldbyname('DESTADO').AsString, '');
         
   // Fin HPC_201804_CXP
   End;
End;

Procedure TFPlanillaDietasDetalle.bbtnContabClick(Sender: TObject);
Begin
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'I' Then
   Begin
      ShowMessage('Planilla de Dietas se encuentra en Inicial');
      Exit;
   End;
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Planilla de Dietas Esta Anulada');
      Exit;
   End;
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'P' Then
   Begin
      ShowMessage('Planilla de Dietas ya se encuentra Aceptada');
      Exit;
   End;
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'V' Then
   Begin
      ShowMessage('Planilla de Dietas ya se encuentra Visado para Pago');
      Exit;
   End;
   If DMCXP.cdsPlanillaCab.fieldByname('DESTADO').AsString = 'L' Then
   Begin
      ShowMessage('Planilla de Dietas ya se encuentra Aprobado para Pago');
      Exit;
   End;
   If fg_validaCierreContable(dtpFSesion.Date) = True Then
   Begin
      ShowMessage(' Mes Cerrado Contablemente!!!, No se puede Registrar');
      Exit;
   End;
   If MessageDlg('¿ Desea Contabilizar la Planilla de Dietas ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

   If DMCXP.cdsPlanillaCab.fieldByname('ID_NUMERO').AsString = '' Then
      ShowMessage('Error al Grabar')
   Else
   Begin
      DMCXP.cdsPlanillaCab.Edit;
      DMCXP.cdsPlanillaCab.fieldByname('CONTABILIZA').AsString := 'S';
      DMCXP.cdsPlanillaCab.fieldByname('USUCONFIRMA').AsString := DMCXP.wUsuario;
      DMCXP.cdsPlanillaCab.fieldByname('FECCONFIRMA').AsDateTime := DATE;
      DMCXP.cdsPlanillaCab.Post;

      xSQL := 'Update DB2ADMIN.CXP_PLANI_DIETAS_CAB '
         + '      set CONTABILIZA=' + quotedstr('S') + ', '
         + '          FREG=trunc(sysdate), '
         + '          HREG= sysdate '
         + '    where CIAID=' + quotedstr('02')
         + '      and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.fieldByname('ID_NUMERO').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en la Aprobación de la Planilla de Dietas');
         Exit;
      End;

      EstadoDeForma(DMCXP.cdsPlanillaCab.fieldbyname('DESTADO').AsString, 'S');

      ShowMessage('Contabilizado');

   End;
End;

Procedure TFPlanillaDietasDetalle.GrabaTexto(Datos: TDatasource; Fichero: String; Delimitador: char);
Var
   f: textfile;
   n, i: integer;
   Linea, Entero, Decimal, Cuenta, Importe, Punto, Ruc, xCtaCte, xTmpC, xTM, xfec, xNom, xTipD: String;
   xTDoc, xNoDoc, xRuc, xRef, xDir, xDis, xPro, xDep, xContacto, xCtl, xReg: String;
   nTotal: Double;
Begin
   xCtl := SumaCuentas;

   If xCtl = '' Then
   Begin
      Exit;
   End;

   AssignFile(f, Fichero);
   Rewrite(f);

// Cabecera
//         1         2         3         4         5         6         7         8         9        10        11
//12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
//# P 12345678901234567890  1234567890123  ddmmaaaa                    123456789012345      9               1
// 1 C                    S/             12        12345678901234567890               123456 123456789012345

   If Length(DMCXP.cdsPlanillaBanco.fieldByname('CCBCOID').AsString) = 16 Then
   Begin
      //194-0625508-0-61
      xTmpC := StringReplace(DMCXP.cdsPlanillaBanco.fieldByname('CCBCOID').AsString, '-', '', [rfReplaceAll]);
      xCtaCte := Copy(xTmpC, 1, 3) + '0' + Copy(xTmpC, 4, 13) + '      ';
   End;
   If Length(DMCXP.cdsPlanillaBanco.fieldByname('CCBCOID').AsString) = 17 Then
   Begin
      //194-04238403-0-14
      xTmpC := StringReplace(DMCXP.cdsPlanillaBanco.fieldByname('CCBCOID').AsString, '-', '', [rfReplaceAll]);
      xCtaCte := xTmpC + '      ';
   End;

   Importe := FormatFloat('######.#0', DMCXP.cdsPlanillaDet.FieldByname('MONTOT').AsCurrency);
   Entero := Copy(StrZero(Importe, 16), 1, 13);
   Decimal := Copy(StrZero(Importe, 16), 15, 2);

   If DMCXP.cdsPlanillaDet.FieldByname('TMONID').AsString = 'N' Then
      xTM := 'S/'
   Else
      xTM := 'US';

   xfec := StringReplace(dtpFSesion.text, '/', '', [rfReplaceAll]);
   xfec := StringReplace(xFec, '-', '', [rfReplaceAll]);
   xfec := StringReplace(xFec, '-', '', [rfReplaceAll]);
   xRef := Copy(meNoReg.Text + '                    ', 1, 20);
   xReg := RightStr('000000' + Trim(IntToStr(Datos.DataSet.RecordCount)), 6);

   Linea := '#1PC' + xCtaCte + xTM + Entero + Decimal + xFec + xRef + xCtl + xReg + '9' + '               ' + '0';

   Memo1.Lines.Add(Linea);
   writeln(f, Linea);

   With Datos.DataSet Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         xSQL := 'Select * '
            + '     from DB2ADMIN.TGE201 '
            + '    where CLAUXID=''' + Datos.DataSet.FieldByName('CLAUXID').AsString + ''' '
            + '      and PROV=''' + Datos.DataSet.FieldByName('PROV').AsString + '''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.indexfieldnames := '';
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;

         xSQL := 'Select PROV, CCBCOID, BANCOID, CLAUXID, CIAID, FPAGOID, TMONID, USUARIO, FECREG, DETRACCION, CODBCOCCI, CCBCODC '
            + '     from DB2ADMIN.CAJA102 '
            + '    where CLAUXID=' + quotedstr(Datos.DataSet.FieldByName('CLAUXID').AsString)
            + '      and PROV=' + quotedstr(Datos.DataSet.FieldByName('PROV').AsString)
            + '      and BANCOID=' + quotedstr(Datos.DataSet.fieldByname('BANCOID').AsString)
            + '      and TMONID=' + quotedstr(Datos.DataSet.fieldByname('TMONID').AsString);
         DMCXP.cdsQry2.Close;
         DMCXP.cdsQry2.indexfieldnames := '';
         DMCXP.cdsQry2.DataRequest(xSQL);
         DMCXP.cdsQry2.Open;

// Detalle
//         1         2         3         4         5         6         7         8         9        10        11        12        13        14        15        16        17        18        19        20        21        22        23        24        25        26        27        28        29
//12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
// 2 12345678901234567890                                        S/               RUC            F          1                                        0 1                                        12345678901234567890                    12345678901234567890
//  C                    1234567890123456789012345678901234567890  123456789012345   123456789012 1234567890 1234567890123456789012345678901234567890 0 1234567890123456789012345678901234567890                    12345678901234567890                    1234567890123456789012345678901234567890

         Linea := ' 2';

         If DMCXP.cdsQry2.FieldByname('FPAGOID').AsString = 'AB' Then
         Begin
            xCtaCte := '';
            xTmpC := '';
            If Length(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString) = 16 Then
            Begin
              //194-0625508-0-61   -- 13
               xTmpC := StringReplace(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString, '-', '', [rfReplaceAll]);
               xCtaCte := Copy('2C' + Copy(xTmpC, 1, 3) + '0' + Copy(xTmpC, 4, 13) + '                       ', 1, 22);
            End;
            If Length(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString) = 17 Then
            Begin
              //194-04238403-0-14     -- 14
               xTmpC := StringReplace(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString, '-', '', [rfReplaceAll]);
               xCtaCte := Copy('2A' + xTmpC + '                       ', 1, 22);
            End;
            If Length(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString) <= 15 Then
            Begin
               ShowMessage('Error en Cuenta de ' + DMCXP.cdsQry.FieldByName('PROVDES').AsString);
               CloseFile(f);
               Exit;
            End;
         End
         Else
         Begin
            xCtaCte := Copy('0G' + '                          ', 1, 22);
         End;

         If DMCXP.cdsQry.FieldByname('TIPPERID').AsString = '02' Then
         Begin
            xTipD := 'RUC';
            xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVRUC').AsString) + '            ', 1, 12);
         End
         Else
         Begin
            If Copy(DMCXP.cdsQry.FieldByName('PROVRUC').AsString, 1, 2) = '10' Then
            Begin
               xTipD := 'RUC';
               xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVRUC').AsString) + '            ', 1, 12);
            End
            Else
            Begin
               xTipD := '   ';
               If DMCXP.cdsQry.FieldByname('TIPDOCID').AsString = '01' Then xTipD := 'DNI';
               If DMCXP.cdsQry.FieldByname('TIPDOCID').AsString = '04' Then xTipD := 'CE ';
               If DMCXP.cdsQry.FieldByname('TIPDOCID').AsString = '07' Then xTipD := 'PAS';
               xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVDNI').AsString) + '            ', 1, 12);
            End;
         End;

         xNom := Copy(DMCXP.cdsQry.FieldByName('PROVDES').AsString + '                                        ', 1, 40);
         Importe := FormatFloat('######.#0', Datos.DataSet.FieldByName('MONTOT').AsCurrency);
         Entero := Copy(StrZero(Importe, 16), 1, 13);
         Decimal := Copy(StrZero(Importe, 16), 15, 2);

         If (Datos.DataSet.FieldByName('DOCID').AsString = '01') Or // Factura por pagar
            (Datos.DataSet.FieldByName('DOCID').AsString = '02') Or // Recibo por Honorario
            (Datos.DataSet.FieldByName('DOCID').AsString = '03') Or // Boleta de venta
            (Datos.DataSet.FieldByName('DOCID').AsString = '05') Or // Boleto Aviacion
            (Datos.DataSet.FieldByName('DOCID').AsString = '14') Or // Recibo de Servicio Publico
            (Datos.DataSet.FieldByName('DOCID').AsString = '16') Or // Boleto Transporte
            (Datos.DataSet.FieldByName('DOCID').AsString = '19') Or // Boleto espectaculo publico
            (Datos.DataSet.FieldByName('DOCID').AsString = '12') Or // Ticket de Maquina registradora
            (Datos.DataSet.FieldByName('DOCID').AsString = '69') Then //Nuevo documento 69 para la condicion
            xTDoc := 'F'
         Else
         Begin
            If Datos.DataSet.FieldByName('DOCID').AsString = '07' Then
               xTDoc := 'N'
            Else
               xTDoc := 'D';
         End;
         If DMCXP.cdsQry.FieldByname('FPAGOID').AsString = 'CH' Then
            xTDoc := 'F';

         xNoDoc := RightStr('0000000000' + Datos.DataSet.FieldByName('CPSERIE').AsString + Datos.DataSet.FieldByName('CPNODOC').AsString, 10);

         xRef := Copy('REFERENCIA                                          ', 1, 40);
         xDir := Copy(DMCXP.cdsQry.FieldByname('PROVDIR').AsString + '                                                     ', 1, 40);

         xSQL := 'Select * from DB2ADMIN.TGE147 '
            + '    where UBIGEOID=''' + DMCXP.cdsQry.FieldByname('DPTOID').AsString
            + DMCXP.cdsQry.FieldByname('CIUDID').AsString
            + DMCXP.cdsQry.FieldByname('PROVCZIP').AsString + '''';
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;

         xDis := Copy(DMCXP.cdsQry.FieldByname('UBIGEODIST').AsString + '                       ', 1, 20);
         xPro := Copy(DMCXP.cdsQry.FieldByname('UBIGEOPROV').AsString + '                       ', 1, 20);
         xDep := Copy(DMCXP.cdsQry.FieldByname('UBIGEODPTO').AsString + '                       ', 1, 20);
         xContacto := Copy('                                                   ', 1, 40);

         Linea := ' ' + xCtaCte + xNom + xTM + Entero + Decimal + xTipD + xRuc + xTDoc + xNoDoc + '1' + xRef + '0' + '0' + '0' + xDir + xDis + xPro + xDep + xContacto;

         Memo1.Lines.Add(Linea);
         writeln(f, Linea);
         Next;
      End;
      EnableControls;
   End;

   CloseFile(f);
   MessageDlg(' Diskette Se Grabo Con Exito ', mtInformation, [mbOk], 0);
End;

Procedure TFPlanillaDietasDetalle.GrabaTextoBBVA(Datos: TDatasource; Fichero: String; Delimitador: char);
Var
   f: textfile;
   n, i: integer;
   Linea, Entero, Decimal, Cuenta, Importe, Punto, Ruc, xCtaCte, xTmpC, xTM, xfec, xNom, xTipD: String;
   xTDoc, xNoDoc, xRuc, xRef, xDir, xContacto, xCtl, xReg: String;
   xTproc, xFecProc, xHorProc, xValPerte, xBlanco: String;
   nTotal: Double;
   xTipAbon, xAbonAgr, xIndavi, xMedavi, xIndProc, xDescrip, xFiller: String;
   xBcoAge, xNroCta, xDigCtr: String;
Begin
   If DMCXP.cdsPlanillaDet.FieldByname('MONTOT').AsCurrency = 0 Then
   Begin
      Exit;
   End;

   AssignFile(f, Fichero);
   Rewrite(f);

// Cabecera
//         1         2         3         4         5         6         7         8         9        10        11
//12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
//# P 12345678901234567890  1234567890123  ddmmaaaa                    123456789012345      9               1
// 1 C                    S/             12        12345678901234567890               123456 123456789012345

   If copy(DMCXP.cdsPlanillaBanco.fieldByname('CCBCOID').AsString, 1, 4) <> '0011' Then
      xCtaCte := '00110' + StringReplace(DMCXP.cdsPlanillaBanco.fieldByname('CCBCOID').AsString, '-', '', [rfReplaceAll])
   Else
      xCtaCte := StringReplace(DMCXP.cdsPlanillaBanco.fieldByname('CCBCOID').AsString, '-', '', [rfReplaceAll]);
   xCtaCte := copy(xCtaCte + '                    ', 1, 20);

   Importe := FormatFloat('######.#0', DMCXP.cdsPlanillaDet.FieldByname('MONTOT').AsCurrency);
   Entero := Copy(StrZero(Importe, 16), 1, 13);
   Decimal := Copy(StrZero(Importe, 16), 15, 2);

   If DMCXP.cdsPlanillaBanco.fieldByname('TMONID').AsString = 'N' Then
      xTM := 'PEN'
   Else
      xTM := 'USD';

   xfec := StringReplace(dtpFSesion.text, '/', '', [rfReplaceAll]);
   xfec := StringReplace(xFec, '-', '', [rfReplaceAll]);
   xfec := StringReplace(xFec, '-', '', [rfReplaceAll]);
   xRef := Copy(meNoReg.Text + '                         ', 1, 25);
   xFecProc := '        ';
   xHorProc := ' ';
   xTproc := 'A';
   xReg := RightStr('000000' + Trim(IntToStr(Datos.DataSet.RecordCount)), 6);
   xValPerte := 'S';
          //                 1         1         1         1         1         1
          // 8     9         0         1         2         3         4         5
          // 45678901234567890123456789012345678901234567890123456789012345678901
   xBlanco := '000000000000000000                                                  ';
   Linea := '750' + xCtaCte + xTM + Entero + Decimal + xTproc + xFecProc + xHorProc + xRef + xReg + xValPerte + xBlanco;

   Memo1.Lines.Add(Linea);
   writeln(f, Linea);

   Datos.DataSet.DisableControls;
   Datos.DataSet.First;
   While Not Datos.DataSet.Eof Do
   Begin
      xSQL := 'Select PROV, PROVDES, PROVABR, TIPPERID, PROVAPEPAT, PROVAPEMAT, '
         + '          PROVNOMBRE, PROVDNI, PROVRUC, PROVEXONER, PROVGIRA, PAISID, '
         + '          PROVDIR, PROVCZIP, PROVTELF, PROVFAX, PROVEMAI, PROVREPR, '
         + '          PROVSALL, PROVSALE, CLAUXID, DPTOID, CIUDID, GIROID, CLASIFID, '
         + '          SECECOID, PROVLUGPAG, PROVCOMMIN, PROVCOMMAX, PROVEMAIL, '
         + '          PROVUFMOV, ACTXOC, PROVNOMCOM, PROVRETIGV, USERID, FREG, HREG, '
         + '          PROVNOMBRE1, TIPDIARID, PROV_PROC, EQUPROOFI, CENCOSOFI, ACTIVO, '
         + '          SEXO, FECNAC, TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, MZADOMIC, '
         + '          LOTEDOMIC, TIPZONAID, NOMZONA, REFDOMIC, ESDOMIC, TIPDOCID, '
         + '          CONVDOBTRI, FPAGOID, TIPLOCID, USOLOCID, PERADM, PERPRO, PEREXT, '
         + '          FECEXON4TA, SNPAFPID, TIPCOMAFPID '
         + '     from DB2ADMIN.TGE201 '
         + '    where CLAUXID=''' + Datos.DataSet.FieldByName('CLAUXID').AsString + ''' '
         + '      and PROV=''' + Datos.DataSet.FieldByName('PROV').AsString + '''';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.indexfieldnames := '';
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;

      xSQL := 'Select PROV, CCBCOID, BANCOID, CLAUXID, CIAID, FPAGOID, TMONID, USUARIO, FECREG, DETRACCION, CODBCOCCI, CCBCODC '
         + '     from DB2ADMIN.CAJA102 '
         + '    where CLAUXID=' + quotedstr(Datos.DataSet.FieldByName('CLAUXID').AsString)
         + '      and PROV=' + quotedstr(Datos.DataSet.FieldByName('PROV').AsString)
         + '      and BANCOID=' + quotedstr(Datos.DataSet.FieldByName('BANCOID').AsString)
         + '      and TMONID=' + quotedstr(Datos.DataSet.FieldByName('TMONID').AsString);
      DMCXP.cdsQry2.Close;
      DMCXP.cdsQry2.indexfieldnames := '';
      DMCXP.cdsQry2.DataRequest(xSQL);
      DMCXP.cdsQry2.Open;

// Detalle
//         1         2         3         4         5         6         7         8         9        10        11        12        13        14        15        16        17        18        19        20        21        22        23        24        25        26        27        28        29
//12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
// 2 12345678901234567890                                        S/               RUC            F          1                                        0 1                                        12345678901234567890                    12345678901234567890
//  C                    1234567890123456789012345678901234567890  123456789012345   123456789012 1234567890 1234567890123456789012345678901234567890 0 1234567890123456789012345678901234567890                    12345678901234567890                    1234567890123456789012345678901234567890

      Linea := ' 2';

      If DMCXP.cdsQry2.FieldByname('BANCOID').AsString = '05' Then
      Begin
         xTipAbon := 'P';
         If DMCXP.cdsQry2.FieldByname('FPAGOID').AsString = 'AB' Then
         Begin
            If Length(trim(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString)) > 0 Then
            Begin
               xCtaCte := DMCXP.cdsQry2.FieldByname('CCBCOID').AsString;
               xBcoAge := copy(xCtaCte, 1, 8);
               xNroCta := copy(xCtaCte, 9, 18);
               If (DMCXP.cdsQry2.FieldByname('CCBCODC').isNull) Or
                  (DMCXP.cdsQry2.FieldByname('CCBCODC').AsString = '') Then
                  xDigCtr := '00'
               Else
                  xDigCtr := DMCXP.cdsQry2.FieldByname('CCBCODC').AsString;

               xCtaCte := xBcoAge + xDigCtr + xNroCta;
            End
            Else
            Begin
               ShowMessage('El proveedor no tiene la cuenta de banco con el formato correcto ' + DMCXP.cdsQry.FieldByName('PROVDES').AsString + Chr(13) +
                  'Si es tipo de abono cuenta propia el formato es el siguiente 0011xxxxDCnnnnnnnnnn' + Chr(13) +
                  'Donde' + Chr(13) +
                  'xxxx = Oficina' + Chr(13) +
                  'DC, dígitos de control, si no los conoce informar "00" ' + Chr(13) +
                  ' ' + Chr(13) +
                  'nnnnnnnnnn = Núm. de cuenta ');
               CloseFile(f);
               Exit;
            End;
         End;
      End
      Else
         If Length(DMCXP.cdsQry2.FieldByname('BANCOID').AsString) = 2 Then
         Begin
            xTipAbon := 'I';
            If Length(DMCXP.cdsQry2.FieldByname('CODBCOCCI').AsString) = 20 Then
            Begin
               xCtaCte := Copy(DMCXP.cdsQry2.FieldByname('CODBCOCCI').AsString + '                    ', 1, 20);
            End
            Else
            Begin
               ShowMessage('El proveedor no tiene la cuenta Interbancario CCI con el formato correcto ' + DMCXP.cdsQry.FieldByName('PROVDES').AsString);
               CloseFile(f);
               Exit;
            End;
         End
         Else
         Begin
            xTipAbon := 'O';
            xCtaCte := '                    ';
         End;

      If DMCXP.cdsQry.FieldByname('TIPPERID').AsString = '01' Then
      Begin
         xTipD := 'L';
         xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVDNI').AsString) + '            ', 1, 12);
      End
      Else
         If DMCXP.cdsQry.FieldByname('TIPPERID').AsString = '02' Then
         Begin
            xTipD := 'R';
            xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVRUC').AsString) + '            ', 1, 12);
         End
         Else
         Begin
            If Copy(DMCXP.cdsQry.FieldByName('PROVRUC').AsString, 1, 2) = '10' Then
            Begin
               xTipD := 'R';
               xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVRUC').AsString) + '            ', 1, 12);
            End
            Else
            Begin
               xTipD := '   ';
               If DMCXP.cdsQry.FieldByname('TIPDOCID').AsString = '01' Then xTipD := 'L';
               If DMCXP.cdsQry.FieldByname('TIPDOCID').AsString = '04' Then xTipD := 'E';
               If DMCXP.cdsQry.FieldByname('TIPDOCID').AsString = '07' Then xTipD := 'P';
               xRuc := Copy(trim(DMCXP.cdsQry.FieldByName('PROVDNI').AsString) + '            ', 1, 12);
            End;
         End;

      xNom := Copy(DMCXP.cdsQry.FieldByName('PROVDES').AsString + '                                        ', 1, 40);
      Importe := FormatFloat('######.#0', Datos.DataSet.FieldByName('MONTOT').AsCurrency);
      Entero := Copy(StrZero(Importe, 16), 1, 13);
      Decimal := Copy(StrZero(Importe, 16), 15, 2);

      If (Datos.DataSet.FieldByName('DOCID').AsString = '01') Or // Factura por pagar
         (Datos.DataSet.FieldByName('DOCID').AsString = '02') Or // Recibo por Honorario
         (Datos.DataSet.FieldByName('DOCID').AsString = '05') Or // Boleto Aviacion
         (Datos.DataSet.FieldByName('DOCID').AsString = '14') Or // Recibo de Servicio Publico
         (Datos.DataSet.FieldByName('DOCID').AsString = '16') Or // Boleto Transporte
         (Datos.DataSet.FieldByName('DOCID').AsString = '19') Or // Boleto espectaculo publico
         (Datos.DataSet.FieldByName('DOCID').AsString = '12') Then // Ticket de Maquina registradora
         xTDoc := 'F'
      Else
      Begin
         If Datos.DataSet.FieldByName('DOCID').AsString = '07' Then
            xTDoc := 'N'
         Else
            xTDoc := 'B';
      End;
      If DMCXP.cdsQry.FieldByname('FPAGOID').AsString = 'CH' Then
         xTDoc := 'F';

      xNoDoc := LeftStr(Datos.DataSet.FieldByName('CPSERIE').AsString + Datos.DataSet.FieldByName('CPNODOC').AsString + '            ', 12);
      xAbonAgr := 'N';
      xRef := Copy('REFERENCIA                                          ', 1, 40);
      xDir := Copy(DMCXP.cdsQry.FieldByname('PROVDIR').AsString + '                                                     ', 1, 40);
      xIndavi := ' ';
      xMedavi := Copy('                                                    ', 1, 50);
      xContacto := Copy('                                                   ', 1, 30);
      xIndProc := '  ';
      //          2 2         2         2         2         2
      //          2 3         4         5         6         7
      //          89012345678901234567890123456789012345678901234567
      xFiller := '00000000000000000000000000000000                  ';
      Linea := '002' + xTipD + xRuc + xTipAbon + xCtaCte + xNom + Entero + Decimal + xTDoc + xNoDoc + xAbonAgr + xRef + xIndavi + xMedavi + xContacto + xFiller;
      Memo1.Lines.Add(Linea);
      writeln(f, Linea);
      Datos.DataSet.Next;
   End;
   Datos.DataSet.EnableControls;

   CloseFile(f);
   MessageDlg(' Diskette se grabó con éxito ', mtInformation, [mbOk], 0);
End;

Function TFPlanillaDietasDetalle.SumaCuentasBBVA: String;
Var
   nTotal: Double;
   xTmpC, xCtaCte: String;
Begin
   nTotal := 0;
   DMCXP.cdsPlanillaDet.First;
   While Not DMCXP.cdsPlanillaDet.Eof Do
   Begin
      xSQL := 'Select PROV, PROVDES, PROVABR, TIPPERID, PROVAPEPAT, PROVAPEMAT, '
         + '          PROVNOMBRE, PROVDNI, PROVRUC, PROVEXONER, PROVGIRA, PAISID, '
         + '          PROVDIR, PROVCZIP, PROVTELF, PROVFAX, PROVEMAI, PROVREPR, '
         + '          PROVSALL, PROVSALE, CLAUXID, DPTOID, CIUDID, GIROID, CLASIFID, '
         + '          SECECOID, PROVLUGPAG, PROVCOMMIN, PROVCOMMAX, PROVEMAIL, '
         + '          PROVUFMOV, ACTXOC, PROVNOMCOM, PROVRETIGV, USERID, FREG, HREG, '
         + '          PROVNOMBRE1, TIPDIARID, PROV_PROC, EQUPROOFI, CENCOSOFI, ACTIVO, '
         + '          SEXO, FECNAC, TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, MZADOMIC, '
         + '          LOTEDOMIC, TIPZONAID, NOMZONA, REFDOMIC, ESDOMIC, TIPDOCID, '
         + '          CONVDOBTRI, FPAGOID, TIPLOCID, USOLOCID, PERADM, PERPRO, PEREXT, '
         + '          FECEXON4TA, SNPAFPID, TIPCOMAFPID '
         + '     from DB2ADMIN.TGE201 '
         + '    where CLAUXID=''' + DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString + ''' '
         + '      and PROV=''' + DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString + '''';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.indexfieldnames := '';
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;

      xSQL := 'Select PROV, CCBCOID, BANCOID, CLAUXID, CIAID, FPAGOID, TMONID, '
         + '          USUARIO, FECREG, DETRACCION, CODBCOCCI '
         + '     from DB2ADMIN.CAJA102 '
         + '    where CLAUXID=''' + DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString + ''' '
         + '      and PROV=''' + DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString + ''' '
         + '      and CIAID=''02''';
      DMCXP.cdsQry2.Close;
      DMCXP.cdsQry2.indexfieldnames := '';
      DMCXP.cdsQry2.DataRequest(xSQL);
      DMCXP.cdsQry2.Open;

      nTotal := nTotal + 1;

      DMCXP.cdsPlanillaDet.Next;
   End;

   If nTotal > 0 Then
      Result := RightStr('00000000000000' + Trim(FloatToStr(nTotal)), 15)
   Else
      Result := RightStr('000000000000000', 15);
End;

Function TFPlanillaDietasDetalle.SumaCuentas: String;
Var
   nTotal: Double;
   xTmpC, xCtaCte: String;
Begin
   nTotal := 0;
   DMCXP.cdsPlanillaDet.First;
   While Not DMCXP.cdsPlanillaDet.Eof Do
   Begin
      xSQL := 'Select * '
         + '     from DB2ADMIN.TGE201 '
         + '    where CLAUXID=''' + DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString + ''' '
         + '      and PROV=''' + DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString + '''';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.indexfieldnames := '';
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;

      xSQL := 'Select PROV, CCBCOID, BANCOID, CLAUXID, CIAID, FPAGOID, TMONID, USUARIO, FECREG, DETRACCION, CODBCOCCI, CCBCODC '
         + '     from DB2ADMIN.CAJA102 '
         + '    where CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
         + '      and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString)
         + '      and BANCOID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('BANCOID').AsString)
         + '      and TMONID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('TMONID').AsString);
      DMCXP.cdsQry2.Close;
      DMCXP.cdsQry2.indexfieldnames := '';
      DMCXP.cdsQry2.DataRequest(xSQL);
      DMCXP.cdsQry2.Open;

   // Verifica que no tenga Forma de Pago <<Cheque de Gerencia>>
      If DMCXP.cdsQry2.RecordCount = 0 Then
      Begin
         xSQL := 'Select PROV, CCBCOID, BANCOID, CLAUXID, CIAID, FPAGOID, TMONID, USUARIO, FECREG, DETRACCION, CODBCOCCI, CCBCODC '
            + '     from DB2ADMIN.CAJA102 '
            + '    where CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
            + '      and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString)
            + '      and FPAGOID=''CH'' ';
         DMCXP.cdsQry2.Close;
         DMCXP.cdsQry2.DataRequest(xSQL);
         DMCXP.cdsQry2.Open;
      End;

      If DMCXP.cdsQry2.FieldByname('FPAGOID').AsString = 'AB' Then
      Begin
         If Length(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString) = 16 Then
         Begin
              //194-0625508-0-61
            xTmpC := StringReplace(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString, '-', '', [rfReplaceAll]);
            xTmpC := '00' + Copy(xTmpC, 4, 10);
         End;
         If Length(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString) = 17 Then
         Begin
              //194-04238403-0-14
            xTmpC := StringReplace(DMCXP.cdsQry2.FieldByname('CCBCOID').AsString, '-', '', [rfReplaceAll]);
            xTmpC := '0' + Copy(xTmpC, 4, 11);
         End;
         If xTmpC = '' Then
         Begin
            ShowMessage('Error en Datos del Proveedor ' + Trim(DMCXP.cdsQry.FieldByname('PROV').AsString) + ' - ' + Trim(DMCXP.cdsQry.FieldByname('PROVDES').AsString) + ', RUC ' + Trim(DMCXP.cdsQry.FieldByname('PROVRUC').AsString) + ',  Cta.Cte.:' + DMCXP.cdsQry2.FieldByname('CCBCOID').AsString);
            Break;
         End;
      End
      Else
      Begin
         If DMCXP.cdsQry2.FieldByname('FPAGOID').AsString = 'CH' Then
         Begin
            If DMCXP.cdsQry.FieldByName('PROVRUC').AsString <> '' Then
               xTmpC := Copy('0' + Trim(DMCXP.cdsQry.FieldByName('PROVRUC').AsString), 1, 12)
            Else
               xTmpC := Copy('00000000' + Trim(DMCXP.cdsQry.FieldByName('PROVDNI').AsString), 1, 12)
         End
         Else
         Begin
            ShowMessage('Error en Datos del Proveedor ' + Trim(DMCXP.cdsQry.FieldByname('PROV').AsString) + ' - ' + Trim(DMCXP.cdsQry.FieldByname('PROVDES').AsString) + ', RUC ' + Trim(DMCXP.cdsQry.FieldByname('PROVRUC').AsString) + ',  Cta.Cte.:' + DMCXP.cdsQry2.FieldByname('CCBCOID').AsString);
            Break;
         End;
      End;

      nTotal := nTotal + StrToFloat(xTmpC);

      DMCXP.cdsPlanillaDet.Next;
   End;

   If nTotal > 0 Then
      Result := RightStr('00000000000000' + Trim(FloatToStr(nTotal)), 15)
   Else
      Result := RightStr('000000000000000', 15);
End;

Procedure TFPlanillaDietasDetalle.wwIButton1Click(Sender: TObject);
Begin
   dblcCnpEgrDet.Enabled := True;
   pnlConceptoDet.Visible := True;
   pnlConceptoDet.BringToFront;
   sModoCptoDet := 'A';

   dblcCnpEgrDet.Text := '';
   edtConcepto.Text := '';
   dbeImporte.Text := '';
   dbeSR.Text := '';
   dblcAfecto.Text := '';

   dblcCnpEgrDet.Enabled := True;
   dbeImporte.Enabled := True;
   dbeSR.Enabled := True;
   dblcAfecto.Enabled := True;

   DMCXP.cdsPlanillaDConcepto.Append;
End;

Procedure TFPlanillaDietasDetalle.dblcCnpEgrDetExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If bbtnCancelDetCpto.Focused Then Exit;

   xWhere := 'CPTOID=''' + dblcCnpEgrDet.Text + ''' ';

   edtConcepto.Text := BuscaQry('dspTGE', 'CXP201', 'CPTODES', xWhere, 'CPTODES');

   If length(edtConcepto.Text) = 0 Then
   Begin
      edtConcepto.Text := '';
      ShowMessage('Concepto NO esta Activo');
      Exit;
   End;

   If dblcCnpEgrDet.Enabled Then
   Begin
      xSQL := 'Select ID_NUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, '
         + '          AFECTO4TA, FECCREA, FECMODIF, USUARIO, FREG, HREG, CIAID '
         + '     from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO '
         + '    Where CIAID=' + quotedstr('02')
         + '      and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString)
         + '      and CLAUXID=' + quotedstr(dblcClAux.Text)
         + '      and PROV=' + quotedstr(dblcdProv.Text)
         + '      and CPTOID=' + quotedstr(dblcCnpEgrDet.Text);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      If DMCXP.cdsQry.RecordCount > 0 Then
      Begin
         ShowMessage('El Concepto ya ha sido registrado para el Directivo');
         dblcCnpEgrDet.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFPlanillaDietasDetalle.bbtnGrabaCnpDetClick(Sender: TObject);
Var
   xTipDet, xWhere: String;
   xDiferencia, xMontoOri, xIGVx, xTotMG, xTotTO, xCalc: Double;
   cdsClone: TwwClientDataSet;
   xRecord: Integer;
Begin
   xWhere := '';
   xCalc := 0;

   If length(dblcCnpEgrDet.Text) = 0 Then
   Begin
      dblcCnpEgrDet.SetFocus;
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

   DMCXP.cdsPlanillaDConcepto.Edit;
   DMCXP.cdsPlanillaDConcepto.fieldbyname('ID_NUMERO').AsString := DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString;
   DMCXP.cdsPlanillaDConcepto.fieldbyname('CLAUXID').AsString := dblcClAux.Text;
   DMCXP.cdsPlanillaDConcepto.fieldbyname('PROV').AsString := DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString; //dblcdProv.Text;
   DMCXP.cdsPlanillaDConcepto.fieldbyname('CPTOID').AsString := dblcCnpEgrDet.Text;
   DMCXP.cdsPlanillaDConcepto.fieldbyname('CPTODES').AsString := edtConcepto.Text;
   DMCXP.cdsPlanillaDConcepto.fieldbyname('IMPORTE').AsFloat := StrToFloat(dbeImporte.Text);
   DMCXP.cdsPlanillaDConcepto.fieldbyname('SUMRES').AsString := dbeSR.Text;
   DMCXP.cdsPlanillaDConcepto.fieldbyname('AFECTO4TA').AsString := dblcAfecto.Text;
   DMCXP.cdsPlanillaDConcepto.fieldbyname('USUARIO').AsString := DMCXP.wUsuario;
   DMCXP.cdsPlanillaDConcepto.Post;

   DMCXP.DCOM1.AppServer.IniciaTransaccion;
   If sModoCptoDet = 'A' Then
   Begin
      xSQL := ' Insert into DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO( CIAID, ID_NUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, AFECTO4TA, FECCREA, FECMODIF, USUARIO, FREG, HREG ) '
         + '    Values( ' + quotedstr('02') + ','
         + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('ID_NUMERO').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('CLAUXID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('PROV').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('CPTOID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('CPTODES').AsString) + ', '
         + floattostr(DMCXP.cdsPlanillaDConcepto.fieldbyname('IMPORTE').AsFloat) + ', '
         + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('SUMRES').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('AFECTO4TA').AsString) + ', '
         + '              trunc(sysdate),  '
         + '              sysdate,  '
         + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('USUARIO').AsString) + ', '
         + '              trunc(sysdate),  '
         + '              sysdate )';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo Insertar el Detalle de Conceptos de la Planilla');
         exit;
      End;
   End
   Else
   Begin
      xSQL := ' Update DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO '
         + '       set CPTOID = ' + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('CPTOID').AsString) + ','
         + '           CPTODES = ' + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('CPTODES').AsString) + ','
         + '           IMPORTE = ' + floattostr(DMCXP.cdsPlanillaDConcepto.fieldbyname('IMPORTE').AsFloat) + ','
         + '           SUMRES = ' + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('SUMRES').AsString) + ','
         + '           AFECTO4TA = ' + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('AFECTO4TA').AsString) + ','
         + '           USUARIO = ' + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('USUARIO').AsString) + ','
         + '           FECMODIF = sysdate, '
         + '           FREG = trunc(sysdate), '
         + '           HREG = sysdate '
         + '     Where CIAID=' + quotedstr('02')
         + '       and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('ID_NUMERO').AsString)
         + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('CLAUXID').AsString)
         + '       and PROV=' + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('PROV').AsString)
         + '       and CPTOID=' + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('CPTOID').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede actualizar el Detalle de Concepto de la Planilla');
         exit;
      End;
   End;

   Recalcula4ta;

   pnlConceptoDet.Visible := False;
   DMCXP.cdsPlanillaDConcepto.EnableControls;
End;

Procedure TFPlanillaDietasDetalle.dbgDietaDirectoDblClick(Sender: TObject);
Begin
   If DMCXP.cdsPlanillaDConcepto.RECORDCOUNT > 0 Then
   Begin
      If DMCXP.cdsPlanillaDConcepto.FieldByName('CPTOID').AsString = '4010704' Then
      Begin
         ShowMessage('No se puede actualizar el Concepto de 4ta. Categoría');
         exit;
      End;

      dblcCnpEgrDet.Enabled := False;
      dbeImporte.Enabled := True;
      dbeSR.Enabled := True;
      dblcAfecto.Enabled := True;

      pnlConceptoDet.Visible := True;
      pnlConceptoDet.BringToFront;
      sModoCptoDet := 'M';

      dblcCnpEgrDet.Text := DMCXP.cdsPlanillaDConcepto.fieldbyname('CPTOID').AsString;
      dblcCnpEgrDetExit(Self);
      dbeImporte.Text := floattostr(DMCXP.cdsPlanillaDConcepto.fieldbyname('IMPORTE').AsFloat);
      dbeSR.Text := DMCXP.cdsPlanillaDConcepto.fieldbyname('SUMRES').AsString;
      dblcAfecto.Text := DMCXP.cdsPlanillaDConcepto.fieldbyname('AFECTO4TA').AsString;
   End;
End;

Procedure TFPlanillaDietasDetalle.bbtnCancelDetCptoClick(Sender: TObject);
Begin
   pnlConceptoDet.Visible := False;
   DMCXP.cdsPlanillaDConcepto.Cancel;
End;

Procedure TFPlanillaDietasDetalle.InsertaPlantilla;
Var
   xItem, xNumDoc: String;
Begin
   DMCXP.DCOM1.AppServer.IniciaTransaccion;

   xSQL := 'Delete from DB2ADMIN.CXP_PLANI_DIETAS_CAB where CIAID=' + quotedstr('02') + ' and ID_NUMERO=' + quotedstr(meNoReg.Text);
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se pudo Borrar previamente antes de Insertar la Cabecera de la Planilla');
      exit;
   End;

   xSQL := 'Delete from DB2ADMIN.CXP_PLANILLAS_DIETAS_DET where CIAID=' + quotedstr('02') + ' and ID_NUMERO=' + quotedstr(meNoReg.Text);
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se pudo Borrar previamente antes de Insertar el Detalle de la Planilla');
      exit;
   End;

   xSQL := 'Delete from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO where CIAID=' + quotedstr('02') + ' and ID_NUMERO=' + quotedstr(meNoReg.Text);
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se pudo Borrar previamente antes de Insertar el Detalle de Conceptos de la Planilla');
      exit;
   End;

   xSQL := ' Insert into DB2ADMIN.CXP_PLANI_DIETAS_CAB(CIAID, ID_NUMERO, IDNUMERO, DESCRIPCION, CCOSID, '
      + '                                              TMONID, DESTADO, USUARIO, FREG, HREG ) '
      + '    Values( ''02'', '
      + quotedstr(meNoReg.Text) + ', '
      + quotedstr(DMCXP.cdsPlantillaCab.FieldByName('IDNUMERO').AsString) + ', '
      + quotedstr(DMCXP.cdsPlantillaCab.FieldByName('DESCRIPCION').AsString) + ', '
      + quotedstr(DMCXP.cdsPlantillaCab.FieldByName('CCOSID').AsString) + ', '
      + quotedstr(DMCXP.cdsPlantillaCab.fieldbyname('TMONID').AsString) + ', '
      + quotedstr('T') + ','
      + quotedstr(DMCXP.cdsPlanillaCab.fieldbyname('USUARIO').AsString) + ', '
      + '                    trunc(sysdate),  '
      + '                    sysdate )';
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se pudo Insertar la Cabecera de la Planilla');
      exit;
   End;

   xSQL := 'Select ID_NUMERO, IDNUMERO, DESCRIPCION, CCOSID, CUENTAID, TMONID, FECSESION, FECSUGEREN, DESTADO, USUACEPTA, FECACEPTA, '
      + '        USUVISA, FECVISA, FECCREA, FECMODIF, USUARIO, FREG, HREG, '
      + '        CIAID, USUAPRUEBA, FECAPRUEBA, USUCONFIRMA, FECCONFIRMA, CONTABILIZA '
      + '   from DB2ADMIN.CXP_PLANI_DIETAS_CAB '
      + '  Where CIAID=' + quotedstr('02')
      + '    and ID_NUMERO=' + quotedstr(meNoReg.Text);
   DMCXP.cdsPlanillaCab.Close;
   DMCXP.cdsPlanillaCab.DataRequest(xSQL);
   DMCXP.cdsPlanillaCab.Open;

// Graba Detalle de la Planilla
   xSQL := 'Insert into DB2ADMIN.CXP_PLANILLAS_DIETAS_DET(CIAID, ID_NUMERO, ITEM, CLAUXID, PROV, PROVDES, CARGO, DOCID, CPSERIE, '
      + '                                                 CPNODOC, MONTOT, BANCOID, CCBCOID, TMONID, FECCREA, FECMODIF, '
      + '                                                 USUARIO, FREG, HREG ) '
      + '   Select CIAID, ' + quotedstr(meNoReg.Text) + ' ID_NUMERO, '
      + '          lpad(cast(rownum as varchar2(3)),3,''0'') ITEM, '
      + '          CLAUXID, PROV, PROVDES, CARGO, DOCID, CPSERIE, '
      + '          CPNODOC, MONTOT, BANCOID, CCBCOID, TMONID, FECCREA, FECMODIF, '
      + quotedstr(DMCXP.cdsPlanillaCab.fieldbyname('USUARIO').AsString) + ', '
      + '          trunc(sysdate),  '
      + '          sysdate '
      + '     from DB2ADMIN.CXP_PLANTILLAS_DIETAS_DET '
      + '    where CIAID=' + quotedstr('02')
      + '      and IDNUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.fieldbyname('IDNUMERO').AsString);
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se pudo Insertar la Cabecera de la Planilla');
      exit;
   End;
// Actualiza Números de Documentos
   xSQL := 'Select ID_NUMERO, ITEM, CLAUXID, PROV, PROVDES, CARGO, DOCID, CPSERIE, CPNODOC, MONTOT, BANCOID, CCBCOID, '
      + '          TMONID, FECCREA, FECMODIF, USUARIO, FREG, HREG, CIAID '
      + '     from DB2ADMIN.CXP_PLANILLAS_DIETAS_DET '
      + '    where CIAID=' + quotedstr('02')
      + '      and ID_NUMERO=' + quotedstr(meNoReg.Text);
   DMCXP.cdsPlanillaDet.Close;
   DMCXP.cdsPlanillaDet.DataRequest(xSQL);
   DMCXP.cdsPlanillaDet.Open;
   DMCXP.cdsPlanillaDet.First;
   While Not DMCXP.cdsPlanillaDet.EOF Do
   Begin
      xSQL := 'Select nvl(max(CPNODOC),''0'') MAXNUMERO '
         + '     from DB2ADMIN.CXP_PLANILLAS_DIETAS_DET '
         + '    where CIAID=' + quotedstr('02')
         + '      and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
         + '      and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString)
         + '      and CPSERIE=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CPSERIE').AsString);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      If DMCXP.cdsQry.RecordCount = 0 Then
         xNumDoc := '0'
      Else
         xNumDoc := DMCXP.cdsQry.FieldByName('MAXNUMERO').AsString;
      xNumDoc := StrZero((inttostr(strtoint(xNumDoc) + 1)), 5);
      xSQL := 'Update DB2ADMIN.CXP_PLANILLAS_DIETAS_DET '
         + '      Set CPNODOC=' + quotedstr(xNumDoc)
         + '    where CIAID=' + quotedstr('02')
         + '      and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('ID_NUMERO').AsString)
         + '      and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
         + '      and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString)
         + '      and CPSERIE=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CPSERIE').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo Insertar la Cabecera de la Planilla');
         exit;
      End;
      DMCXP.cdsPlanillaDet.Next;
   End;

// Detalle de Conceptos
   xSQL := 'Insert into DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO(ID_NUMERO, CLAUXID, PROV, CPTOID, '
      + '                                                   CPTODES, IMPORTE, SUMRES, '
      + '                                                   AFECTO4TA, FECCREA, FECMODIF, USUARIO, FREG, HREG, CIAID) '
      + '   Select ' + quotedstr(meNoReg.Text) + ','
      + '          CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, '
      + '          AFECTO4TA, FECCREA, FECMODIF, USUARIO, FREG, HREG, CIAID '
      + '     from DB2ADMIN.CXP_PLANTILLAS_DET_CONCEPTO '
      + '    Where CIAID=' + quotedstr('02')
      + '      and IDNUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('IDNUMERO').AsString);
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se pudo Insertar el Detalle de Conceptos de la Planilla');
      exit;
   End;

   DMCXP.cdsPlanillaDet.First;
   While Not DMCXP.cdsPlanillaDet.EOF Do
   Begin
      xSQL := 'Select ID_NUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, '
         + '          AFECTO4TA, FECCREA, FECMODIF, USUARIO, FREG, HREG, CIAID, '
         + '          case when SUMRES=''+'' then ''1'' else ''2'' end ORDENIMP '
         + '     from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO '
         + '    Where CIAID=' + quotedstr('02')
         + '      and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('ID_NUMERO').AsString)
         + '      and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
         + '      and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString);
      DMCXP.cdsPlanillaDConcepto.Close;
      DMCXP.cdsPlanillaDConcepto.DataRequest(xSQL);
      DMCXP.cdsPlanillaDConcepto.Open;
      DMCXP.cdsPlanillaDConcepto.IndexFieldNames := 'ORDENIMP;CPTOID';

      Genera4ta;
      DMCXP.cdsPlanillaDet.Next;
   End;
   DMCXP.cdsPlanillaDet.Close;
   DMCXP.cdsPlanillaDConcepto.Close;

//   EstadoDeForma(DMCXP.cdsPlanillaCab.fieldbyname('DESTADO').AsString, '');
   // Confirma Grabación
   DMCXP.DCOM1.AppServer.GrabaTransaccion;
   ShowMessage('Se Inicializó correctamente la Planilla de Dieta');
End;

Procedure TFPlanillaDietasDetalle.dblcdCargoCloseDialog(
   Dialog: TwwLookupDlg);
Begin
   dblcdCargo.Text := DMCXP.cdsCargDirect.FieldByName('IDCARGO').Text;
   DMCXP.cdsPlanillaDet.Fieldbyname('IDCARGO').AsString := dblcdCargo.Text;
   dblcdCargoExit(Self);
End;

Procedure TFPlanillaDietasDetalle.dblcClAuxCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   dblcClAux.Text := DMCXP.cdsClAux.FieldByName('CLAUXID').Text;
   DMCXP.cdsPlanillaDet.Fieldbyname('IDCARGO').AsString := dblcClAux.Text;
   dblcClAuxExit(Self);
End;

Procedure TFPlanillaDietasDetalle.dblcdProvCloseDialog(
   Dialog: TwwLookupDlg);
Begin
   dblcdProv.Text := DMCXP.cdsProv.FieldByName('PROV').Text;
   DMCXP.cdsPlanillaDet.Fieldbyname('PROV').AsString := dblcdProv.Text;
   dblcdProvExit(Self);
End;

Procedure TFPlanillaDietasDetalle.dblcBancoDetalleCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   dblcBancoDetalle.Text := DMCXP.cdsBanco.FieldByName('BANCOID').Text;
   DMCXP.cdsPlanillaDet.Fieldbyname('BANCOID').AsString := dblcBancoDetalle.Text;
   dblcBancoDetalleExit(Self);
End;

Procedure TFPlanillaDietasDetalle.dblcTDocCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   dblcTDoc.Text := DMCXP.cdsTDoc.FieldByName('DOCID').Text;
   DMCXP.cdsPlanillaDet.Fieldbyname('DOCID').AsString := dblcTDoc.Text;
   dblcTDocExit(Self);
End;

Procedure TFPlanillaDietasDetalle.dbeImporteExit(Sender: TObject);
Var
   xContador: Integer;
Begin
   If bbtnCancelDetCpto.Focused Then Exit;

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
   //  19/07/2018 Incluye el punto decimal en la validación
      If (copy(dbeImporte.Text, xContador, 1) <> '0') And (copy(dbeImporte.Text, xContador, 1) <> '1') And (copy(dbeImporte.Text, xContador, 1) <> '2')
         And (copy(dbeImporte.Text, xContador, 1) <> '3') And (copy(dbeImporte.Text, xContador, 1) <> '4') And (copy(dbeImporte.Text, xContador, 1) <> '5')
         And (copy(dbeImporte.Text, xContador, 1) <> '6') And (copy(dbeImporte.Text, xContador, 1) <> '7') And (copy(dbeImporte.Text, xContador, 1) <> '8')
         And (copy(dbeImporte.Text, xContador, 1) <> '9') And (copy(dbeImporte.Text, xContador, 1) <> '.') Then
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
      Showmessage('Debe ser un importe mayor a cero');
      dbeImporte.SetFocus;
      Exit;
   End;

End;

Procedure TFPlanillaDietasDetalle.dbeSRExit(Sender: TObject);
Begin
   If bbtnCancelDetCpto.Focused Then Exit;

   If (dbeSR.Text <> '+') And (dbeSR.Text <> '-') Then
   Begin
      Showmessage('Sólo se permite registra + ó -');
      dbeSR.SetFocus;
      Exit;
   End;
End;

Procedure TFPlanillaDietasDetalle.dblcAfectoExit(Sender: TObject);
Begin
   If bbtnCancelDetCpto.Focused Then Exit;

   If (dblcAfecto.Text <> 'S') And (dblcAfecto.Text <> 'N') Then
   Begin
      Showmessage('Sólo se permite registra S ó N');
      dblcAfecto.SetFocus;
      Exit;
   End;
End;

Procedure TFPlanillaDietasDetalle.bbtnImprimePllaClick(Sender: TObject);
Begin
   AbreTablasReportes;

   pprPlanillaDietas.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\DietasPlanilla.rtm';
   pprPlanillaDietas.template.LoadFromFile;

   If Not cbDisenoRep.Checked Then
   Begin
      pprPlanillaDietas.Print;
      pprPlanillaDietas.Stop;
      DMCXP.cdsQry6.IndexFieldNames := '';
   End
   Else
   Begin
      ppDesigner1.Report := pprPlanillaDietas;
      ppDesigner1.Show;
   End;
End;

Procedure TFPlanillaDietasDetalle.bbtnImprimeBoletaClick(Sender: TObject);
Begin
   AbreTablasReportes;

   pprBoletaDietas.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\DietasBoletas.rtm';
   pprBoletaDietas.template.LoadFromFile;

   If Not cbDisenoRep.Checked Then
   Begin
      pprBoletaDietas.Print;
      pprBoletaDietas.Stop;
      DMCXP.cdsQry6.IndexFieldNames := '';
   End
   Else
   Begin
      ppDesigner1.Report := pprBoletaDietas;
      ppDesigner1.Show;
   End;
End;

Procedure TFPlanillaDietasDetalle.AbreTablasReportes;
Begin
// Cabecera de Planilla
   xSQL := 'Select CAB.ID_NUMERO, CAB.DESCRIPCION, CAB.CCOSID, CCOS.CCOSDES, CAB.CUENTAID, PLANCTA.CTADES, CAB.FECCREA, CAB.FECMODIF, '
      + '          CAB.USUARIO, CAB.FREG, CAB.HREG, CAB.FECSESION, CAB.FECSUGEREN, CAB.IDNUMERO, '
      + '          ''PLANILLA DE ''||upper(CAB.DESCRIPCION)||'' NRO.''||ID_NUMERO  CABTITULO, '
      + '          CAB.DESTADO, '
      + '          case when CAB.DESTADO=''T'' then ''TRANSITO'' '
      + '               when CAB.DESTADO=''I'' then ''INICIAL'' '
      + '               when CAB.DESTADO=''I'' then ''INICIAL'' '
      + '               when CAB.DESTADO=''P'' Then ''ACEPTADA'' '
      + '               when CAB.DESTADO=''A'' Then ''ANULADA'' '
      + '               when CAB.DESTADO=''V'' Then ''VISADA'' '
      + '               when CAB.DESTADO=''L'' Then ''APROBADA'' '
      + '               when CAB.DESTADO=''O'' and nvl(CONTABILIZA,''N'')<>''S'' Then ''CONFIRMADA'' '
      + '               when CAB.DESTADO=''O'' and nvl(CONTABILIZA,''N'')=''S'' Then ''CONTABILIZADA'' '
      + '               else ''NO DEFINIDO'' '
      + '           end DESCRIP_ESTADO, '
      + '          CAB.USUACEPTA, CAB.FECACEPTA, CAB.USUVISA, CAB.FECVISA, '
      + '          CAB.CIAID, CIAS.CIADES, CAB.TMONID, MONEDAS.TMONDES, MONEDAS.TMONABR, '
      + '          CAB.USUAPRUEBA, CAB.FECAPRUEBA, CAB.USUCONFIRMA, CAB.FECCONFIRMA, '
      + '          CAB.CONTABILIZA '
      + '     from DB2ADMIN.CXP_PLANI_DIETAS_CAB CAB, '
      + '          DB2ADMIN.TGE203 CCOS, '
      + '          DB2ADMIN.TGE202 PLANCTA, '
      + '          DB2ADMIN.TGE101 CIAS, '
      + '          DB2ADMIN.TGE103 MONEDAS '
      + '    where CAB.CIAID=''02'' '
      + '      and CAB.ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString)
      + '      and CCOS.CCOSID(+)=CAB.CCOSID '
      + '      and PLANCTA.CIAID(+)=CAB.CIAID and PLANCTA.CUENTAID(+)=CAB.CUENTAID '
      + '      and CIAS.CIAID(+)=CAB.CIAID '
      + '      and MONEDAS.TMONID(+)=CAB.TMONID ';
   DMCXP.cdsReporte.Close;
   DMCXP.cdsReporte.DataRequest(xSQL);
   DMCXP.cdsReporte.Open;
   ppdbPllaCab.DataSource := DMCXP.dsReporte;

// Detalle de Planillas por directivo
   ppdbPllaDet.DataSource := DMCXP.dsPlanillaDet;

// Detalle de Planillas por Concepto
   xSQL := 'Select CONCEP.ID_NUMERO, CONCEP.CLAUXID, CONCEP.PROV, CONCEP.CPTOID, CONCEP.CPTODES, CONCEP.IMPORTE, CONCEP.SUMRES, '
      + '          CONCEP.AFECTO4TA, CONCEP.FECCREA, CONCEP.FECMODIF, CONCEP.USUARIO, CONCEP.FREG, CONCEP.HREG, CONCEP.CIAID, '
      + '          PROVE.PROVDES, PROVE.PROVRUC, DETA.CARGO CARGOID, CARGOS.DESCRIPCION CARGODES, '
      + '          case when CONCEP.SUMRES=''+'' then IMPORTE else -IMPORTE end IMPORTE2, '
      + '          DB2ADMIN.NUM_A_LETRAS(DETA.MONTOT)||'' ''||' + quotedstr(DMCXP.wTMonLocDes) + ' MONTOLETRAS, '
      + '          case when CONCEP.SUMRES=''+'' then 1 else 2 end ORDENCPTOS '
      + '     from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO CONCEP, '
      + '          DB2ADMIN.CXP_PLANILLAS_DIETAS_DET DETA, '
      + '          DB2ADMIN.TGE201 PROVE, '
      + '          DB2ADMIN.CXP_CARGOS_DIRECT CARGOS '
      + '    Where CONCEP.CIAID=' + quotedstr('02')
      + '      and CONCEP.ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString)
      + '      and DETA.CIAID=CONCEP.CIAID '
      + '      and DETA.ID_NUMERO=CONCEP.ID_NUMERO '
      + '      and DETA.CLAUXID=CONCEP.CLAUXID '
      + '      and DETA.PROV=CONCEP.PROV '
      + '      and PROVE.CLAUXID=CONCEP.CLAUXID '
      + '      and PROVE.PROV=CONCEP.PROV '
      + '      and CARGOS.IDCARGO = DETA.CARGO';
   DMCXP.cdsQry6.Close;
   DMCXP.cdsQry6.DataRequest(xSQL);
   DMCXP.cdsQry6.Open;
   DMCXP.cdsQry6.IndexFieldNames := 'PROV;ORDENCPTOS;CPTOID';
   ppdbPllaConc.DataSource := DMCXP.dsQry6;
End;

Procedure TFPlanillaDietasDetalle.dblcCnpEgrDetEnter(Sender: TObject);
Begin
   If DMCXP.cdsPlanillaDConcepto.State = DsBrowse Then
      If dblcCnpEgrDet.Enabled Then
         DMCXP.cdsPlanillaDConcepto.Append;
End;

Procedure TFPlanillaDietasDetalle.dbgDietaDirectoKeyDown(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If DMCXP.cdsPlanillaDConcepto.RECORDCOUNT > 0 Then
      Begin
         If MessageDlg('¿Está seguro de ELIMINAR el Concepto? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
            Exit;

         If DMCXP.cdsPlanillaDConcepto.FieldByName('CPTOID').AsString = '4010704' Then
         Begin
            ShowMessage('No se puede eliminar directamente el Concepto de 4ta. Categoría');
            exit;
         End;
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         xSQL := 'Delete from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO '
            + '    Where CIAID=' + quotedstr('02')
            + '      and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('ID_NUMERO').AsString)
            + '      and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('CLAUXID').AsString)
            + '      and PROV=' + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('PROV').AsString)
            + '      and CPTOID=' + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('CPTOID').AsString);
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se puede actualizar el Detalle de Concepto de la Planilla');
            exit;
         End;
         DMCXP.cdsPlanillaDConcepto.Delete;
         xSigueGrab := False;
         Recalcula4ta;
         If xSigueGrab Then
            DMCXP.DCOM1.AppServer.GrabaTransaccion;
      End;
   End;
End;

Procedure TFPlanillaDietasDetalle.Recalcula4ta;
Var
   xConc4ta, xConcdes4ta, xWhere: String;
   xCalc, xTotTO: Double;
Begin
   xConc4ta := '4010704';
   xWhere := 'CPTOID=''' + xConc4ta + ''' ';
   xConcdes4ta := BuscaQry('dspTGE', 'CXP201', 'CPTODES', xWhere, 'CPTODES');

   xSQL := ' Select ID_NUMERO '
      + '      from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO '
      + '     Where CIAID=' + quotedstr('02')
      + '       and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('ID_NUMERO').AsString)
      + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
      + '       and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString)
      + '       and CPTOID=' + quotedstr(xConc4ta);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount > 0 Then
   Begin
      xSQL := 'Delete from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO '
         + '    Where CIAID=' + quotedstr('02')
         + '      and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('ID_NUMERO').AsString)
         + '      and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
         + '      and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString)
         + '      and CPTOID=' + quotedstr(xConc4ta);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede actualizar la 4ta categoría en el Detalle de Concepto de la Planilla');
         xSigueGrab := False;
         exit;
      End;
   End;

   DMCXP.cdsPlanillaDConcepto.DisableControls;
   DMCXP.cdsPlanillaDConcepto.First;
   xTot4ta := 0;
   While Not DMCXP.cdsPlanillaDConcepto.EOF Do
   Begin
      If DMCXP.cdsPlanillaDConcepto.fieldbyname('AFECTO4TA').AsString = 'S' Then
      Begin
         If DMCXP.cdsPlanillaDConcepto.fieldbyname('SUMRES').AsString = '+' Then
            xTot4ta := xTot4ta + DMCXP.cdsPlanillaDConcepto.fieldbyname('IMPORTE').AsFloat;
      End;
      DMCXP.cdsPlanillaDConcepto.Next;
   End;
   If xTot4ta > 0 Then
   Begin
      xCalc := FRound((xTot4ta * 0.08), 15, 2);
      DMCXP.cdsPlanillaDConcepto.Append;
      DMCXP.cdsPlanillaDConcepto.fieldbyname('ID_NUMERO').AsString := DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString;
      DMCXP.cdsPlanillaDConcepto.fieldbyname('CLAUXID').AsString := dblcClAux.Text;
      DMCXP.cdsPlanillaDConcepto.fieldbyname('PROV').AsString := DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString;
      DMCXP.cdsPlanillaDConcepto.fieldbyname('CPTOID').AsString := xConc4ta;
      DMCXP.cdsPlanillaDConcepto.fieldbyname('CPTODES').AsString := xConcdes4ta;
      DMCXP.cdsPlanillaDConcepto.fieldbyname('IMPORTE').AsFloat := xCalc;
      DMCXP.cdsPlanillaDConcepto.fieldbyname('SUMRES').AsString := '-';
      DMCXP.cdsPlanillaDConcepto.Post;
      xSQL := ' Insert into DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO(CIAID, ID_NUMERO, CLAUXID, PROV, CPTOID, '
         + '                                                    CPTODES, IMPORTE, SUMRES, AFECTO4TA, '
         + '                                                    FECCREA, FECMODIF, USUARIO, FREG, HREG) '
         + '    Values(' + quotedstr('02') + ','
         + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('ID_NUMERO').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('CLAUXID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('PROV').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('CPTOID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('CPTODES').AsString) + ', '
         + floattostr(DMCXP.cdsPlanillaDConcepto.fieldbyname('IMPORTE').AsFloat) + ', '
         + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('SUMRES').AsString) + ', '
         + quotedstr('N') + ', '
         + '              trunc(sysdate), '
         + '              sysdate, '
         + quotedstr(DMCXP.cdsPlanillaDConcepto.fieldbyname('USUARIO').AsString) + ', '
         + '              trunc(sysdate), '
         + '              sysdate )';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo Insertar el registro de Cuarta Categoría');
         xSigueGrab := False;
         exit;
      End;
   End;
   DMCXP.cdsPlanillaDConcepto.EnableControls;

   xSQL := 'Select ID_NUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, '
      + '           AFECTO4TA, FECCREA, FECMODIF, USUARIO, FREG, HREG, CIAID, '
      + '           case when SUMRES=''+'' then ''1'' else ''2'' end ORDENIMP '
      + '      from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO '
      + '     Where CIAID=' + quotedstr('02')
      + '       and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('ID_NUMERO').AsString)
      + '       And CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
      + '       And PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString);
   DMCXP.cdsPlanillaDConcepto.Close;
   DMCXP.cdsPlanillaDConcepto.DataRequest(xSQL);
   DMCXP.cdsPlanillaDConcepto.Open;
   DMCXP.cdsPlanillaDConcepto.IndexFieldNames := 'ORDENIMP;CPTOID';

// se Implementa la actualización de la tabla de detalle de la Plantilla
   xTotTO := 0;
   If DMCXP.cdsPlanillaDConcepto.RecordCount > 0 Then
   Begin
      DMCXP.cdsPlanillaDConcepto.First;
      While Not DMCXP.cdsPlanillaDConcepto.Eof Do
      Begin
         If DMCXP.cdsPlanillaDConcepto.fieldbyname('SUMRES').AsString = '+' Then
            xTotTO := xTotTO + DMCXP.cdsPlanillaDConcepto.fieldbyname('IMPORTE').AsFloat
         Else
            xTotTO := xTotTO - DMCXP.cdsPlanillaDConcepto.fieldbyname('IMPORTE').AsFloat;
         DMCXP.cdsPlanillaDConcepto.Next;
      End;
   End;
   xSQL := ' Update DB2ADMIN.CXP_PLANILLAS_DIETAS_DET '
      + '       set USUARIO = ' + quotedstr(DMCXP.wUsuario) + ','
      + '           MONTOT = ' + floattostr(xTotTO) + ', '
      + '           FREG = trunc(sysdate), '
      + '           HREG = sysdate '
      + '     where CIAID=' + quotedstr('02')
      + '       and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('ID_NUMERO').AsString)
      + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
      + '       and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString);
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se puede Actualizar el importe del detalle de la Planilla de Dieta');
      xSigueGrab := False;
      exit;
   End;
End;

Procedure TFPlanillaDietasDetalle.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMCXP.cdsBanco.Close;
   DMCXP.cdsBanco.Filter := '';
   DMCXP.cdsBanco.Filtered := False;
   DMCXP.cdsBanco.IndexFieldNames := '';
   DMCXP.FiltraTabla(DMCXP.cdsBanco, 'TGE105', 'BANCOID');
   Action := caFree;
End;

Procedure TFPlanillaDietasDetalle.Genera4ta;
Var
   xConc4ta, xConcdes4ta, xWhere: String;
   xCalc, xTotTO: Double;
Begin
   xConc4ta := '4010704';
   xWhere := 'CPTOID=''' + xConc4ta + ''' ';
   xConcdes4ta := BuscaQry('dspTGE', 'CXP201', 'CPTODES', xWhere, 'CPTODES');

   xSQL := ' Select ID_NUMERO '
      + '      from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO '
      + '     Where CIAID=' + quotedstr('02')
      + '       and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('ID_NUMERO').AsString)
      + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
      + '       and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString)
      + '       and CPTOID=' + quotedstr(xConc4ta);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount > 0 Then
   Begin
      xSQL := 'Delete from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO '
         + '    Where CIAID=' + quotedstr('02')
         + '      and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('ID_NUMERO').AsString)
         + '      and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
         + '      and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString)
         + '      and CPTOID=' + quotedstr(xConc4ta);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se puede actualizar la 4ta categoría en el Detalle de Concepto de la Planilla');
         xSigueGrab := False;
         exit;
      End;
   End;

   DMCXP.cdsPlanillaDConcepto.DisableControls;
   DMCXP.cdsPlanillaDConcepto.First;
   xTot4ta := 0;
   While Not DMCXP.cdsPlanillaDConcepto.EOF Do
   Begin
      If DMCXP.cdsPlanillaDConcepto.fieldbyname('AFECTO4TA').AsString = 'S' Then
      Begin
         If DMCXP.cdsPlanillaDConcepto.fieldbyname('SUMRES').AsString = '+' Then
            xTot4ta := xTot4ta + DMCXP.cdsPlanillaDConcepto.fieldbyname('IMPORTE').AsFloat;
      End;
      DMCXP.cdsPlanillaDConcepto.Next;
   End;
   If xTot4ta > 0 Then
   Begin
      xCalc := FRound((xTot4ta * 0.08), 15, 2);
      xSQL := ' Insert into DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO(CIAID, ID_NUMERO, CLAUXID, PROV, CPTOID, '
         + '                                                    CPTODES, IMPORTE, SUMRES, AFECTO4TA, '
         + '                                                    FECCREA, FECMODIF, USUARIO, FREG, HREG) '
         + '    Values(' + quotedstr('02') + ','
         + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('ID_NUMERO').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('CLAUXID').AsString) + ', '
         + quotedstr(DMCXP.cdsPlanillaDet.fieldbyname('PROV').AsString) + ', '
         + quotedstr(xConc4ta) + ', '
         + quotedstr(xConcdes4ta) + ', '
         + floattostr(xCalc) + ', '
         + quotedstr('-') + ', '
         + quotedstr('N') + ', '
         + '             trunc(sysdate), '
         + '             sysdate, '
         + quotedstr(DMCXP.wUsuario) + ', '
         + '             trunc(sysdate), '
         + '             sysdate )';
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo Insertar el registro de Cuarta Categoría');
         xSigueGrab := False;
         exit;
      End;
   End;
   DMCXP.cdsPlanillaDConcepto.EnableControls;

   xSQL := 'Select ID_NUMERO, CLAUXID, PROV, CPTOID, CPTODES, IMPORTE, SUMRES, '
      + '           AFECTO4TA, FECCREA, FECMODIF, USUARIO, FREG, HREG, CIAID, '
      + '           case when SUMRES=''+'' then ''1'' else ''2'' end ORDENIMP '
      + '      from DB2ADMIN.CXP_PLANILLAS_DET_CONCEPTO '
      + '     Where CIAID=' + quotedstr('02')
      + '       and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('ID_NUMERO').AsString)
      + '       And CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
      + '       And PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString);
   DMCXP.cdsPlanillaDConcepto.Close;
   DMCXP.cdsPlanillaDConcepto.DataRequest(xSQL);
   DMCXP.cdsPlanillaDConcepto.Open;
   DMCXP.cdsPlanillaDConcepto.IndexFieldNames := 'ORDENIMP;CPTOID';

// se Implementa la actualización de la tabla de detalle de la Plantilla
   xTotTO := 0;
   If DMCXP.cdsPlanillaDConcepto.RecordCount > 0 Then
   Begin
      DMCXP.cdsPlanillaDConcepto.First;
      While Not DMCXP.cdsPlanillaDConcepto.Eof Do
      Begin
         If DMCXP.cdsPlanillaDConcepto.fieldbyname('SUMRES').AsString = '+' Then
            xTotTO := xTotTO + DMCXP.cdsPlanillaDConcepto.fieldbyname('IMPORTE').AsFloat
         Else
            xTotTO := xTotTO - DMCXP.cdsPlanillaDConcepto.fieldbyname('IMPORTE').AsFloat;
         DMCXP.cdsPlanillaDConcepto.Next;
      End;
   End;
   xSQL := ' Update DB2ADMIN.CXP_PLANILLAS_DIETAS_DET '
      + '       set USUARIO = ' + quotedstr(DMCXP.wUsuario) + ','
      + '           MONTOT = ' + floattostr(xTotTO) + ', '
      + '           FREG = trunc(sysdate), '
      + '           HREG = sysdate '
      + '     where CIAID=' + quotedstr('02')
      + '       and ID_NUMERO=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('ID_NUMERO').AsString)
      + '       and CLAUXID=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('CLAUXID').AsString)
      + '       and PROV=' + quotedstr(DMCXP.cdsPlanillaDet.FieldByName('PROV').AsString);
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se puede Actualizar el importe del detalle de la Planilla de Dieta');
      xSigueGrab := False;
      exit;
   End;
End;

Procedure TFPlanillaDietasDetalle.PideDatosBanco(wOrigen: String);
Begin
// Inicio HPC_201804_CXP
// 19/07/2018 Incluye Descripción del Proveedor en los Datos del Banco
   {
   xSQL := 'Select NUMERO, NUMPLA, NUMOPE '
      + '     from DB2ADMIN.CXP_ORD_PAG_CAB '
      + '    where CIAID=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('CIAID').AsString)
      + '      and MODULO=' + quotedstr('TLC')
      + '      and DOCID=' + quotedstr('34')
      + '      and CPNODOC=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString);
  }
   xSQL := 'Select rownum FILA, CXP_ORD_PAG_CAB.CIAID, CXP_ORD_PAG_CAB.NUMERO, CXP_ORD_PAG_CAB.NUMPLA, CXP_ORD_PAG_CAB.NUMOPE, '
      + '          TGE201.PROVDES, CXP_ORD_PAG_CAB.FECHA '
      + '     from DB2ADMIN.CXP_ORD_PAG_CAB, DB2ADMIN.CXP_ORD_PAG_DET, DB2ADMIN.TGE201 '
      + '    where CXP_ORD_PAG_CAB.CIAID=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('CIAID').AsString)
      + '      and CXP_ORD_PAG_CAB.MODULO=' + quotedstr('TLC')
      + '      and CXP_ORD_PAG_CAB.DOCID=' + quotedstr('34')
      + '      and CXP_ORD_PAG_CAB.CPNODOC=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString)
      + '      and CXP_ORD_PAG_DET.CIAID=CXP_ORD_PAG_CAB.CIAID '
      + '      and CXP_ORD_PAG_DET.NUMERO=CXP_ORD_PAG_CAB.NUMERO '
      + '      and TGE201.CLAUXID=CXP_ORD_PAG_DET.CLAUXID '
      + '      and TGE201.PROV=CXP_ORD_PAG_DET.AUXID ';
   DMCXP.cdsQry3.Close;
   DMCXP.cdsQry3.DataRequest(xSQL);
   DMCXP.cdsQry3.Open;
   DMCXP.cdsQry3.IndexFieldNames := 'FILA';
   dbgNumPllaBco.DataSource := DMCXP.dsQry3;
   dbgNumPllaBco.Selected.Clear;
   dbgNumPllaBco.Selected.Add('FILA'#9'5'#9'Orden'#9'F');
   dbgNumPllaBco.Selected.Add('FECHA'#9'10'#9'Fec.Oper'#9'F');
   dbgNumPllaBco.Selected.Add('NUMERO'#9'10'#9'O.Pago'#9'F');
   dbgNumPllaBco.Selected.Add('NUMPLA'#9'10'#9'Planilla'#9'F');
   dbgNumPllaBco.Selected.Add('NUMOPE'#9'10'#9'Nro.Oper'#9'F');
   dbgNumPllaBco.Selected.Add('PROVDES'#9'45'#9'Directivo'#9'F');
   dbgNumPllaBco.ApplySelected;
// Fin HPC_201804_CXP

   dbeNumOPago.DataSource := DMCXP.dsQry3;
   dbeNumOPago.DataField := 'NUMERO';
   dbeNumPllaOpago.DataSource := DMCXP.dsQry3;
   dbeNumPllaOpago.DataField := 'NUMPLA';
   dbeNumOp.DataSource := DMCXP.dsQry3;
   dbeNumOp.DataField := 'NUMOPE';

   If wOrigen = 'CONFIRMA' Then
   Begin
      lblOPago.Visible := True;
      dbeNumOPago.Visible := True;
      lblNumPlaOPago.Visible := True;
      dbeNumPllaOpago.Visible := True;
      lblNumOpBco.Visible := True;
      dbeNumOp.Visible := True;
      bbtnOkNumPllaBco.Visible := True;

      bbtnExitNumPllaBco.Top := 265;
      pnlNumPllaBco.Height := 300;
   End;

   If wOrigen = 'CONSULTA' Then
   Begin
      lblOPago.Visible := False;
      dbeNumOPago.Visible := False;
      lblNumPlaOPago.Visible := False;
      dbeNumPllaOpago.Visible := False;
      lblNumOpBco.Visible := False;
      dbeNumOp.Visible := False;
      bbtnOkNumPllaBco.Visible := False;

      bbtnExitNumPllaBco.Top := 165;
      pnlNumPllaBco.Height := 200;
   End;
// Inicio HPC_201804_CXP
// reubica posición izquierda de panel de datos de banco
   pnlNumPllaBco.Left := 270;
// Fin HPC_201804_CXP
   pnlNumPllaBco.Top := 184;
   pnlNumPllaBco.Visible := True;
   DMCXP.cdsQry3.First;
End;

Procedure TFPlanillaDietasDetalle.bbtnOkNumPllaBcoClick(Sender: TObject);
Begin
   DMCXP.cdsQry3.First;
   While Not DMCXP.cdsQry3.EOF Do
   Begin
      xSQL := 'Update DB2ADMIN.CXP_ORD_PAG_CAB '
         + '      Set NUMPLA=' + quotedstr(DMCXP.cdsQry3.FieldByName('NUMPLA').AsString) + ', '
         + '          NUMOPE=' + quotedstr(DMCXP.cdsQry3.FieldByName('NUMOPE').AsString)
         + '    where CIAID=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('CIAID').AsString)
         + '      and NUMERO=' + quotedstr(DMCXP.cdsQry3.FieldByName('NUMERO').AsString);
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo actualizar la Orden de Pago=' + DMCXP.cdsQry3.FieldByName('NUMERO').AsString);
         Exit;
      End;
      DMCXP.cdsQry3.Next;
   End;
   ShowMessage('Se actualizó la Orden de Pago corretamente')
End;

Procedure TFPlanillaDietasDetalle.bbtnExitNumPllaBcoClick(Sender: TObject);
Begin
// Inicio HPC_201804_CXP
// 19/07/2018 retira Indice
   DMCXP.cdsQry3.IndexFieldNames := '';
// Fin HPC_201804_CXP
   pnlNumPllaBco.Visible := False;
End;

Procedure TFPlanillaDietasDetalle.dbeNumPllaOpagoExit(Sender: TObject);
Begin
   dbgNumPllaBco.RefreshDisplay;
End;

Procedure TFPlanillaDietasDetalle.dbeNumOpExit(Sender: TObject);
Begin
   dbgNumPllaBco.RefreshDisplay;
End;

Procedure TFPlanillaDietasDetalle.bbtnVisorOPagoClick(Sender: TObject);
Begin
   xSQL := 'Select NUMERO, NUMERO, NUMPLA, NUMOPE '
      + '     from DB2ADMIN.CXP_ORD_PAG_CAB '
      + '    where CIAID=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('CIAID').AsString)
      + '      and MODULO=' + quotedstr('TLC')
      + '      and DOCID=' + quotedstr('34')
      + '      and CPNODOC=' + quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No se ha generado la Orden de Pago');
      Exit;
   End;

   PideDatosBanco('CONSULTA');
End;

procedure TFPlanillaDietasDetalle.bbtnAnulaClick(Sender: TObject);
begin
   If (DMCXP.cdsPlanillaCab.FieldByName('DESTADO').AsString <> 'P') Then
   Begin
      ShowMessage( 'Estado de la Planilla de Pago no permite ANULACIÓN');
      exit;
   End;


   If MessageDlg('Esta Seguro de Anular la Planilla de Dieta : '+DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString,mtConfirmation, [mbYes, mbNo], 0)=mrYes then
   Begin
      If DMCXP.cdsPlanillaCab.State = dsBrowse Then DMCXP.cdsPlanillaCab.Edit;
      DMCXP.cdsPlanillaCab.fieldbyname('DESTADO').AsString := 'A';
      DMCXP.cdsPlanillaCab.Post;

      xSQL:= 'Update DB2ADMIN.CXP_PLANI_DIETAS_CAB '
         + '     Set DESTADO=''A'', '
         + '         USUARIO='+quotedstr(DMCXP.wUsuario)+','
         + '         FREG=trunc(Sysdate), '
         + '         HREG=Sysdate '
         + '   where CIAID='+quotedstr('02')
         + '     and ID_NUMERO='+quotedstr(DMCXP.cdsPlanillaCab.FieldByName('ID_NUMERO').AsString);
      try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         ShowMessage('Planilla cambió a Estado ANULADO correctamente');
      except
      end;
      EstadoDeForma(DMCXP.cdsPlanillaCab.fieldbyname('DESTADO').AsString, '');
   End;

end;

End.

