Unit CXP505;

// Actualizaciones
// HPC_201602_CXP 27/04/2016 Revisión General de la opción
//                           Reordenamiento de Sangría


// Inicio HPC_201602_CXP
// revisión y ajuste para la generación del DAOT 2015
Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, wwdblook, StrContainer,
   Grids, Wwdbigrd, Wwdbgrid, ppCache, ppDB, ppDBPipe, ppComm, ppRelatv,
   ppProd, ppClass, ppReport, ppCtrls, ppBands, ppVar, ppPrnabl, dbclient, db,
   wwClient, ppEndUsr, Wwdbdlg, Spin, variants,
   shellapi, wwexport;

Type
   TFTransfDAOT = Class(TForm)
      BitBtn2: TBitBtn;
      savdlg1: TSaveDialog;
      lblCia: TLabel;
      dblcRUC: TwwDBLookupCombo;
      edtCia: TEdit;
      Label2: TLabel;
      Bevel1: TBevel;
      bbtnBorra: TBitBtn;
      bbtnGrabaTxt: TBitBtn;
      edtNomArch: TEdit;
      scFILES: TStrContainer;
      dbgObligaciones: TwwDBGrid;
      bbtnImprime: TBitBtn;
      ppReporteDAOT: TppReport;
      bbtnRecuperar: TBitBtn;
      bbtnGrabaCds: TBitBtn;
      Label3: TLabel;
      dbeUITs: TwwDBEdit;
      Label4: TLabel;
      dbeValorUIT: TwwDBEdit;
      bbtnGenerar: TBitBtn;
      bbtnDetalle: TBitBtn;
      pprDetalle: TppReport;
      bbtnDetalleRep: TBitBtn;
      ppDesigner1: TppDesigner;
      ppHeaderBand2: TppHeaderBand;
      pplblCiaDet: TppLabel;
      pplblTitDet: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppSystemVariable5: TppSystemVariable;
      ppSystemVariable6: TppSystemVariable;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText12: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      ppDBCalc4: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppLine2: TppLine;
      ppDBCalc14: TppDBCalc;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBCalc3: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppLine1: TppLine;
      ppDBCalc13: TppDBCalc;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppLine3: TppLine;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      dblcdProv: TwwDBLookupComboDlg;
      Label5: TLabel;
      edtProv: TEdit;
      rgTipoDiario: TRadioGroup;
      dblcTDiario: TwwDBLookupCombo;
      edtTDiario: TEdit;
      ppDBReporteDAOT: TppDBPipeline;
      ppHeaderBand1: TppHeaderBand;
      pplblTit: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppLabel7: TppLabel;
      ppLabel1: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      pplblRUC: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppdbTipoPersona: TppDBText;
      ppdbPROVRUC: TppDBText;
      ppdbProvDes: TppDBText;
      ppdbCorrel: TppDBText;
      ppdbApePat: TppDBText;
      ppdbApeMat: TppDBText;
      ppdbNombres: TppDBText;
      ppdbImporte: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLabel5: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppLabel6: TppLabel;
      ppDBCalc2: TppDBCalc;
      ppLabel16: TppLabel;
      dbeAno: TSpinEdit;
      Label1: TLabel;
      BitBtn1: TBitBtn;
      GroupBox1: TGroupBox;
      cbGravado: TCheckBox;
      cbGravado2: TCheckBox;
      cbNoGravado: TCheckBox;
      BitBtn4: TBitBtn;
      BitBtn3: TBitBtn;
      dbgData: TwwDBGrid;
      BitBtn5: TBitBtn;
      meCia: TMaskEdit;
      meMes: TMaskEdit;
      BitBtn6: TBitBtn;
      Label6: TLabel;
      Label7: TLabel;
      rgOrden: TRadioGroup;
      bbtnRenumerar: TBitBtn;
      cbAdqNoGra: TCheckBox;
      pnDetalle: TPanel;
      stxTitulo2: TPanel;
      dbgDetalleProveedor: TwwDBGrid;
      btnSalir: TBitBtn;
      btnExportarExcel: TBitBtn;
      dbeRuc: TwwDBEdit;
      dbeProveedor: TwwDBEdit;
      Label10: TLabel;
      Label11: TLabel;
      btnImprimeDet: TBitBtn;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure IniciaDatos;
      Procedure dblcRUCExit(Sender: TObject);
      Procedure dblcTDiarioExit(Sender: TObject);
      Procedure dbeAnoKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbeAnoExit(Sender: TObject);
      Procedure bbtnGenerarClick(Sender: TObject);
      Procedure bbtnRecuperarClick(Sender: TObject);
      Procedure bbtnImprimeClick(Sender: TObject);
      Procedure bbtnGrabaCdsClick(Sender: TObject);
      Procedure bbtnGrabaTxtClick(Sender: TObject);
      Procedure bbtnBorraClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure bbtnDetalleClick(Sender: TObject);
      Procedure bbtnDetalleRepClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dblcdProvExit(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure rgTipoDiarioClick(Sender: TObject);
      Procedure dblcdProvEnter(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure BitBtn4Click(Sender: TObject);
      Procedure BitBtn3Click(Sender: TObject);
      Procedure BitBtn5Click(Sender: TObject);
      Procedure BitBtn6Click(Sender: TObject);
      Procedure dbgObligacionesKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure bbtnRenumerarClick(Sender: TObject);
      Procedure dbgObligacionesDblClick(Sender: TObject);
      Procedure btnSalirClick(Sender: TObject);
      Procedure btnExportarExcelClick(Sender: TObject);
      Procedure btnImprimeDetClick(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
   Private
  { Private declarations }
   Public
  { Public declarations }
      Function OperClientDataSet(cdsOrigen: TwwClientDataSet; wExpresion, wCondicion: String): Double;
      Procedure ExportaGridExcel(xDataGrid: TwwDBGrid; xFileName: String);
      Procedure fg_AsignaDSDetalle;
      Procedure fg_RecuperaDetalle(wgPeriodo, wgProveedor: String);
      Function fg_BuscaProvDaot: Boolean;
   End;

Procedure OPTransferenciaDAOT; stdcall;

Exports
   OPTransferenciaDAOT;

Var
   FTransfDAOT: TFTransfDAOT;
   wTipDiarios: String;
   wRUCCIA: String;

Implementation

Uses CxPDM;

{$R *.DFM}

Procedure TFTransfDAOT.ExportaGridExcel(xDataGrid: TwwDBGrid; xFileName: String);
Begin
   Screen.Cursor := crHourGlass;
   With xDataGrid, xDataGrid.ExportOptions Do
   Begin
      ExportType := wwgetSYLK;
      FileName := xFileName + '.slk';
      Save;
      If Not (esoClipboard In Options) Then
         ShellExecute(Handle, 'Open', PChar(xDataGrid.exportoptions.Filename),
            Nil, Nil, sw_shownormal);
   End;
   Screen.Cursor := crDefault;
End;

Procedure OPTransferenciaDAOT;
Begin
   If DMCXP = Nil Then exit;
   If Not DMCXP.DCOM1.Connected Then Exit;
   Try
      FTransfDAOT := TFTransfDAOT.Create(Application);
      FTransfDAOT.ShowModal;
   Finally
      FTransfDAOT.Free;
   End;
End;

Procedure TFTransfDAOT.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFTransfDAOT.IniciaDatos;
Begin
   dbgObligaciones.DataSource := Nil;
   dblcRUC.Clear;
   edtCia.Clear;
   dbeAno.Clear;
   dbeUITs.Text := '3';
   dbeValorUIT.Clear;
End;

Procedure TFTransfDAOT.dblcRUCExit(Sender: TObject);
Var
   xsSql: String;
Begin
   If bbtnBorra.Focused Then Exit;
   If length(trimleft(trimright(dblcRUC.Text))) = 0 Then
   Begin
      ShowMessage('Digite o Escoja RUC de Compañía');
      dblcRUC.SetFocus;
      exit;
   End;
   edtCia.Text := DMCXP.DisplayDescrip2('dspUltTGE', 'TGE101', 'CIAID,CIADES', 'CIARUC=' + quotedstr(dblcRUC.Text), 'CIADES');
   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('RUC de Compañía Inválido');
      dblcRUC.SetFocus;
      exit;
   End;
   wRUCCIA := '';
   DMCXP.cdsQry.First;
   While Not DMCXP.cdsQry.EOF Do
   Begin
      If length(wRUCCIA) = 0 Then
         wRUCCIA := quotedstr(DMCXP.cdsQry.FieldByName('CIAID').AsString)
      Else
         wRUCCIA := wRUCCIA + ',' + quotedstr(DMCXP.cdsQry.FieldByName('CIAID').AsString);
      DMCXP.cdsQry.Next;
   End;
   xsSql := ' TO_CHAR(UITFCINI, ' + QuotedStr('YYYY') + ' ) <= ' + QuotedStr(dbeAno.Text) + ' AND TO_CHAR(UITFCFIN, ' + QuotedStr('YYYY') + ') >= ' + QuotedStr(dbeAno.Text);
   dbeValorUIT.Text := DMCXP.DisplayDescrip2('dspUltTGE', 'TGE188', 'TO_CHAR(UITMONTO) UITMONTO', xsSql, 'UITMONTO');
End;

Procedure TFTransfDAOT.dblcTDiarioExit(Sender: TObject);
Begin
   If length(dblcTDiario.Text) = 0 Then
   Begin
      dblcTDiario.Enabled := False;
      edtTDiario.Text := '';
      rgTipoDiario.ItemIndex := 0;
      rgTipoDiarioClick(self);
      exit;
   End;

   If bbtnBorra.Focused Then
   Begin
      dblcTDiario.Enabled := False;
      dbeAno.SetFocus;
      Exit;
   End;

   DMCXP.cdsTDiario.SetKey;
   DMCXP.cdsTDiario.FieldByName('TDIARID').AsString := dblcTDiario.Text;
   If Not DMCXP.cdsTDiario.Gotokey Then
   Begin
      ShowMessage('Tipo de Diario no Permitido');
      dblcTDiario.SetFocus;
      exit;
   End;

   DMCXP.cdsTDoc.Filtered := False;
   DMCXP.cdsTDoc.Filter := '';
   DMCXP.cdsTDoc.Filter := 'TDIARID=''' + dblcTDiario.Text + ''' OR TDIARID2=''' + dblcTDiario.Text + '''';
   DMCXP.cdsTDoc.Filtered := True;

   edtTDiario.Text := DMCXP.cdsTDiario.FieldByName('TDIARDES').AsString;
   wTipDiarios := ' A.TDIARID=' + quotedstr(dblcTDiario.Text) + ' ';
End;

Procedure TFTransfDAOT.dbeAnoKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then dbeAnoExit(Sender);
End;

Procedure TFTransfDAOT.dbeAnoExit(Sender: TObject);
Begin
   If bbtnBorra.Focused Then Exit;
End;

Procedure TFTransfDAOT.bbtnGenerarClick(Sender: TObject);
Var
   xSQL, xSQL1, xSQL2, xSQL3, xNombre, xVar: String;
   sGravado, sGravado2, sNoGravado, sAdqNoGrav: String;
   xCorrel: integer;
   xMinimo: double;
Begin
   If length(dbeAno.Text) = 0 Then
   Begin
      ShowMessage('Falta Ingresar Periodo');
      dbeAno.SetFocus;
      Exit;
   End;

   If length(dbeAno.Text) < 4 Then
   Begin
      ShowMessage('Periodo No Valido');
      dbeAno.SetFocus;
      Exit;
   End;

   If dbeAno.Text < '1999' Then
   Begin
      ShowMessage('Año Inválido');
      dbeAno.SetFocus;
      Exit;
   End;

   If Length(dblcRUC.Text) = 0 Then
   Begin
      ShowMessage('Falta Seleccionar el RUC');
      dblcRUC.SetFocus;
      Exit;
   End;

   sGravado := ' 0 ';
   sGravado2 := ' 0 ';
   sNoGravado := ' 0 ';
   sAdqNoGrav := ' 0 ';
   If cbGravado.Checked Then
      sGravado := ' nvl(CPGRAVAD,0) ';
   If cbGravado2.Checked Then
      sGravado2 := ' nvl(CPGRAVAD2,0) ';
   If cbNoGravado.Checked Then
      sNoGravado := ' nvl(CPNOGRAV,0) ';
   If cbAdqNoGra.Checked Then
      sAdqNoGrav := ' nvl(ADQ_NO_GRAV,0) ';

   Screen.Cursor := crHourGlass;

   xSQL := 'Select 0 CORRELAT,''6'' TD_DECLAR, ' + quotedstr(dblcRUC.Text) + ' RUC_DECLAR, '
      +            quotedstr(dbeAno.Text) + ' PERIODO, TIPPERID, ''6'' TD_PROV, TGE201.PROVRUC, '
      +    '       sum(case when DOCRESTA=''S'' '
      +    '                then (case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
      +    '                           then (( ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' + ' + sAdqNoGrav + ' )*-1) '
      +    '                           else (( ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' + ' + sAdqNoGrav + ' )*CPTCAMPR)*-1 end) '
      +    '                else (case when A.TMONID=' + quotedStr(DMCXP.wTMonLoc)
      +    '                           then ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' + ' + sAdqNoGrav + ' '
      +    '                           else (( ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' + ' + sAdqNoGrav + ' )*CPTCAMPR) end ) end) IMPORTE, '
      +    '       case when TIPPERID=''01'' then PROVAPEPAT  else '''' end PROVAPEPAT, '
      +    '       case when TIPPERID=''01'' then PROVAPEMAT  else '''' end PROVAPEMAT, '
      +    '       case when TIPPERID=''01'' then PROVNOMBRE  else '''' end PROVNOMBRE, '
      +    '       case when TIPPERID=''01'' then PROVNOMBRE1 else '''' end PROVNOMBRE1, '
      +    '       TGE201.PROVDES '
      +    '  From CXP301 A, TGE201, TGE110 '
      +    ' Where A.CIAID in (' + wRUCCIA + ') '
      +    '   and TO_CHAR(CPFEMIS,''YYYY'')=' + quotedstr(dbeAno.Text)
      +    '   and ' + wTipDiarios
      +    '   and (CPESTADO=''P'' or CPESTADO=''C'')'
      +    '   and TGE201.clauxid(+)=A.clauxid and TGE201.PROV(+)=A.PROV '
      +    '   and TGE110.DOCMOD(+)=''CXP'' and TGE110.DOCID(+)=A.DOCID '
      +    ' group by TIPPERID, TGE201.PROVRUC, PROVAPEPAT, PROVAPEMAT, PROVNOMBRE, PROVNOMBRE1, TGE201.PROVDES ';

   If rgOrden.ItemIndex = 0 Then
      xSQL := xSQL + ' Order by PROVRUC'
   Else
      xSQL := xSQL + ' Order by IMPORTE DESC';

   DMCXP.cdsQry3.filtered := false;
   DMCXP.cdsQry3.indexfieldnames := '';
   DMCXP.cdsQry3.Close;
   DMCXP.cdsQry3.ProviderName := 'dspTGE';
   DMCXP.cdsQry3.DataRequest(xSQL);
   DMCXP.cdsQry3.Open;
   TNumericField(DMCXP.cdsQry3.FieldByName('IMPORTE')).DisplayFormat := '###,###,##0.00';

   xMinimo := strtofloat(dbeUITs.Text) * strtofloat(dbeValorUIT.Text);

   DMCXP.cdsQry3.First;
   DMCXP.cdsQry3.DisableControls;
   xCorrel := 1;
   While Not DMCXP.cdsQry3.EOF Do
   Begin
      If DMCXP.cdsQry3.fieldbyname('IMPORTE').AsFloat < xMinimo Then
         DMCXP.cdsQry3.Delete
      Else
      Begin
         If DMCXP.cdsQry3.fieldbyname('CORRELAT').AsInteger = 0 Then
         Begin
            DMCXP.cdsQry3.Edit;
            DMCXP.cdsQry3.fieldbyname('CORRELAT').AsInteger := xCorrel;
            DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString :=
               stringreplace(DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString, ' ', '', [rfreplaceall]);
            DMCXP.cdsQry3.fieldbyname('PROVAPEPAT').AsString := Uppercase(DMCXP.cdsQry3.fieldbyname('PROVAPEPAT').AsString);
            DMCXP.cdsQry3.fieldbyname('PROVAPEMAT').AsString := Uppercase(DMCXP.cdsQry3.fieldbyname('PROVAPEMAT').AsString);
            DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString := Uppercase(DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString);
            DMCXP.cdsQry3.fieldbyname('PROVNOMBRE1').AsString := Uppercase(DMCXP.cdsQry3.fieldbyname('PROVNOMBRE1').AsString);
            DMCXP.cdsQry3.Post;
            xCorrel := xCorrel + 1;
         End;
         DMCXP.cdsQry3.Next;
      End;
   End;
   DMCXP.cdsQry3.EnableControls;
   dbgObligaciones.Selected.clear;
   dbgObligaciones.Selected.Add('CORRELAT'#9'4'#9'Corr.');
   dbgObligaciones.Selected.Add('TD_DECLAR'#9'6'#9'T.Doc~Declarante');
   dbgObligaciones.Selected.Add('RUC_DECLAR'#9'12'#9'RUC~Declarante');
   dbgObligaciones.Selected.Add('PERIODO'#9'6'#9'Periodo');
   dbgObligaciones.Selected.Add('TIPPERID'#9'5'#9'Tipo~Persona');
   dbgObligaciones.Selected.Add('TD_PROV'#9'10'#9'T.Doc~Proveedor');
   dbgObligaciones.Selected.Add('PROVRUC'#9'12'#9'RUC');
   dbgObligaciones.Selected.Add('IMPORTE'#9'15'#9'Importe~Total');
   dbgObligaciones.Selected.Add('PROVAPEPAT'#9'20'#9'Ap.Paterno');
   dbgObligaciones.Selected.Add('PROVAPEMAT'#9'20'#9'Ap.Materno');
   dbgObligaciones.Selected.Add('PROVNOMBRE'#9'20'#9'Nombre');
   dbgObligaciones.Selected.Add('PROVNOMBRE1'#9'20'#9'Segundo Nombre');
   dbgObligaciones.Selected.Add('PROVDES'#9'50'#9'Razón Social');
   dbgObligaciones.DataSource := DMCXP.dsQry3;

   dbgObligaciones.ColumnByName('IMPORTE').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(IMPORTE)', ''), ffNumber, 15, 2);

   edtNomArch.Text := 'DAOT' + dblcRUC.Text + dbeAno.Text + '.txt';
   savdlg1.FileName := edtNomArch.Text;
   bbtnImprime.enabled := True;
   bbtnDetalleRep.enabled := False;
   BitBtn4.enabled := False;
   bbtnGrabaCds.enabled := True;
   bbtnGrabaTxt.enabled := True;

   DMCXP.cdsQry3.First;
   dbgObligaciones.SetFocus;
   Screen.Cursor := crDefault;
End;

Procedure TFTransfDAOT.bbtnImprimeClick(Sender: TObject);
Var
   x10: Integer;
Begin
   If DMCXP.cdsQry3.RecordCount = 0 Then
   Begin
      ShowMessage('No existe Detalle a Imprimir');
      exit;
   End;
   ppDBReporteDAOT.dataSource := DMCXP.dsQry3;

   DMCXP.cdsQry3.DisableControls;
   ppReporteDAOT.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ReporteDAOT_A4.rtm';
   ppReporteDAOT.Template.LoadFromFile;

   pplblTit.Caption := 'DECLARACION ANUAL DE OPERACIONES CON TERCEROS - EJERCICIO ' + dbeAno.Text;
   pplblRUC.Caption := 'RUC : ' + dblcRUC.Text;

   ppDesigner1.Report := ppReporteDAOT;

   If cbDisenoRep.Checked Then
      ppDesigner1.ShowModal
   Else
   Begin
      ppReporteDAOT.Print;

      ppReporteDAOT.Stop;

      x10 := Self.ComponentCount - 1;
      While x10 >= 0 Do
      Begin
         If Self.Components[x10].ClassName = 'TppGroup' Then
         Begin
            Self.Components[x10].Free;
         End;
         x10 := x10 - 1;
      End;
      ppDBReporteDAOT.dataSource := Nil;

      DMCXP.cdsQry3.EnableControls;
   End;
End;

Procedure TFTransfDAOT.bbtnGrabaTxtClick(Sender: TObject);
Var
   xLinea, xWhere: String;
Begin
   If length(trimleft(trimright(edtNomArch.Text))) = 0 Then
   Begin
      ShowMessage('Falta Archivo Destino');
      exit;
   End;

// verificacion de datos
   DMCXP.cdsQry3.DisableControls;

   DMCXP.cdsQry3.First;
   While Not DMCXP.cdsQry3.EOF Do
   Begin

      xWhere := 'TIPPERID=' + quotedstr(DMCXP.cdsQry3.fieldbyname('TIPPERID').AsString);
      If DMCXP.DisplayDescrip2('dspUltTGE', 'TGE109', 'TIPPERS', xWhere, 'TIPPERS') = 'S' Then
      Begin
         If length(trim(DMCXP.cdsQry3.fieldbyname('PROVAPEPAT').AsString)) = 0 Then
         Begin
            ShowMessage('Falta APELLIDO PATERNO para Proveedor con RUC ' + DMCXP.cdsQry3.fieldbyname('PROVRUC').AsString);
            DMCXP.cdsQry3.EnableControls;
            exit;
         End;
         If length(trim(DMCXP.cdsQry3.fieldbyname('PROVAPEMAT').AsString)) = 0 Then
         Begin
            ShowMessage('Falta APELLIDO MATERNO para Proveedor con RUC ' + DMCXP.cdsQry3.fieldbyname('PROVRUC').AsString);
            DMCXP.cdsQry3.EnableControls;
            exit;
         End;
         If length(trim(DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString)) = 0 Then
         Begin
            ShowMessage('Falta NOMBRE para Proveedor con RUC ' + DMCXP.cdsQry3.fieldbyname('PROVRUC').AsString);
            DMCXP.cdsQry3.EnableControls;
            exit;
         End;
      End
      Else
         If length(trim(DMCXP.cdsQry3.fieldbyname('PROVDES').AsString)) = 0 Then
         Begin
            ShowMessage('Falta Razón Social para Proveedor con RUC ' + DMCXP.cdsQry3.fieldbyname('PROVRUC').AsString);
            DMCXP.cdsQry3.EnableControls;
            exit;
         End;
      DMCXP.cdsQry3.Next;
   End;

   Screen.Cursor := crHourGlass;
   scFILES.Lines.clear;
   DMCXP.cdsQry3.First;
   While Not DMCXP.cdsQry3.EOF Do
   Begin
      xLinea := '';
      xLinea := DMCXP.cdsQry3.fieldbyname('CORRELAT').AsString; //1
      xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('TD_DECLAR').AsString; // 2
      xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('RUC_DECLAR').AsString; // 2
      xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PERIODO').AsString; // 2
      xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('TIPPERID').AsString; // 2
      xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('TD_PROV').AsString; // 2
      xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PROVRUC').AsString; // 2
      xLinea := xLinea + '|' + FloattoStr(Int(FRound(DMCXP.cdsQry3.fieldbyname('IMPORTE').AsFloat, 20, 0))); // 8
      xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PROVAPEPAT').AsString; // 2
      xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PROVAPEMAT').AsString; // 3
      xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString; // 4
      xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PROVNOMBRE1').AsString; // 4
      xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PROVDES').AsString; // 4
      xLinea := xLinea + '|';
      scFILES.Lines.Add(xLinea);
      DMCXP.cdsQry3.Next;
   End;
   Screen.Cursor := crDefault;
   If savdlg1.Execute Then
   Begin
      edtNomArch.Text := savdlg1.FileName;
      scFILES.Lines.SaveToFile(edtNomArch.Text);
   End;
   DMCXP.cdsQry3.EnableControls;
   ShowMessage('Transferencia Realizada');
End;

Procedure TFTransfDAOT.bbtnBorraClick(Sender: TObject);
Begin
   IniciaDatos;
   dbeAno.Setfocus;
End;

Procedure TFTransfDAOT.bbtnGrabaCdsClick(Sender: TObject);
Var
   xSQL, wSQL: String;
   xComprobante: String;
Begin
   If Not DMCXP.cdsQry3.Active Then ShowMessage('No hay datos que Guardar!!!');

   If Not DMCXP.cdsQry3.RecordCount = 0 Then ShowMessage('No hay datos que Guardar!!!');

   xSQL := 'Select CORRELAT,TD_DECLAR, RUC_DECLAR, PERIODO, '
      +    '       TIPPERID, TD_PROV, PROVRUC, '
      +    '       IMPORTE, PROVAPEPAT, PROVAPEMAT, PROVNOMBRE, PROVNOMBRE1, PROVDES '
      +    '  from CXP403 '
      +    ' where RUC_DECLAR=' + quotedstr(dblcRUC.Text)
      +    '   and PERIODO=' + quotedstr(dbeAno.Text);
   DMCXP.cdsQry4.filtered := false;
   DMCXP.cdsQry4.indexfieldnames := '';
   DMCXP.cdsQry4.ProviderName := 'dspTGE';
   DMCXP.cdsQry4.Close;
   DMCXP.cdsQry4.DataRequest(xSQL);
   DMCXP.cdsQry4.Open;

   If DMCXP.cdsQry4.recordcount > 0 Then
   Begin
      If MessageDlg('¿Reemplazar los Registros Guardados Anteriormente?',
         mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Begin
         exit;
      End
      Else
      Begin
         xSQL := 'delete from CXP403 '
            +    ' where RUC_DECLAR=' + quotedstr(dblcRUC.Text)
            +    '   and PERIODO=' + quotedstr(dbeAno.Text);
         Try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
         End;
      End;
   End;

   DMCXP.cdsQry3.DisableControls;
   Screen.Cursor := crHourGlass;
   DMCXP.cdsQry3.First;
   While Not DMCXP.cdsQry3.EOF Do
   Begin
      DMCXP.cdsQry4.Append;
      DMCXP.cdsQry4.FieldByName('CORRELAT').AsInteger := DMCXP.cdsQry3.fieldbyname('CORRELAT').AsInteger;
      DMCXP.cdsQry4.FieldByName('TD_DECLAR').AsString := DMCXP.cdsQry3.fieldbyname('TD_DECLAR').AsString;
      DMCXP.cdsQry4.FieldByName('RUC_DECLAR').AsString := DMCXP.cdsQry3.fieldbyname('RUC_DECLAR').AsString;
      DMCXP.cdsQry4.FieldByName('PERIODO').AsString := DMCXP.cdsQry3.fieldbyname('PERIODO').AsString;
      DMCXP.cdsQry4.FieldByName('TIPPERID').AsString := DMCXP.cdsQry3.fieldbyname('TIPPERID').AsString;
      DMCXP.cdsQry4.FieldByName('TD_PROV').AsString := DMCXP.cdsQry3.fieldbyname('TD_PROV').AsString;
      DMCXP.cdsQry4.FieldByName('PROVRUC').AsString := DMCXP.cdsQry3.fieldbyname('PROVRUC').AsString;
      DMCXP.cdsQry4.FieldByName('IMPORTE').AsFloat := DMCXP.cdsQry3.fieldbyname('IMPORTE').AsFloat;
      DMCXP.cdsQry4.FieldByName('PROVAPEPAT').AsString := DMCXP.cdsQry3.fieldbyname('PROVAPEPAT').AsString;
      DMCXP.cdsQry4.FieldByName('PROVAPEMAT').AsString := DMCXP.cdsQry3.fieldbyname('PROVAPEMAT').AsString;
      DMCXP.cdsQry4.FieldByName('PROVNOMBRE').AsString := DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString;
      DMCXP.cdsQry4.FieldByName('PROVNOMBRE1').AsString := DMCXP.cdsQry3.fieldbyname('PROVNOMBRE1').AsString;
      DMCXP.cdsQry4.FieldByName('PROVDES').AsString := DMCXP.cdsQry3.fieldbyname('PROVDES').AsString;
      DMCXP.cdsQry3.Next;
   End;
   DMCXP.cdsQry4.Post;
   DMCXP.cdsQry4.DataRequest(xSQL);
   DMCXP.cdsQry4.ApplyUpdates(0);
   Screen.Cursor := crDefault;
   ShowMessage('Registros Grabados');
   DMCXP.cdsQry3.EnableControls;
   Screen.Cursor := crDefault;
End;

Procedure TFTransfDAOT.bbtnRecuperarClick(Sender: TObject);
Var
   xSQL, xFecha: String;
Begin
   Screen.Cursor := crHourGlass;
   DMCXP.cdsQry3.DisableControls;
   dbgObligaciones.DataSource := Nil;

   DMCXP.cdsQry3.Close;
   xSQL := 'Select CORRELAT,TD_DECLAR, RUC_DECLAR, PERIODO, '
      +    '       TIPPERID, TD_PROV, PROVRUC, '
      +    '       IMPORTE, PROVAPEPAT, PROVAPEMAT, PROVNOMBRE, PROVNOMBRE1, PROVDES '
      +    '  from CXP403 '
      +    ' where RUC_DECLAR=' + quotedstr(dblcRUC.Text)
      +    '   and PERIODO=' + quotedstr(dbeAno.Text)
      +    '  order by CORRELAT';
   DMCXP.cdsQry3.filtered := false;
   DMCXP.cdsQry3.indexfieldnames := '';
   DMCXP.cdsQry3.ProviderName := 'dspTGE';
   DMCXP.cdsQry3.DataRequest(xSQL);
   DMCXP.cdsQry3.Open;
   TNumericField(DMCXP.cdsQry3.FieldByName('IMPORTE')).DisplayFormat := '###,###,##0.00';

   dbgObligaciones.Selected.clear;
   dbgObligaciones.Selected.Add('CORRELAT'#9'5'#9'Corr.');
   dbgObligaciones.Selected.Add('TD_DECLAR'#9'6'#9'T.Doc~Declarante');
   dbgObligaciones.Selected.Add('RUC_DECLAR'#9'15'#9'RUC~Declarante');
   dbgObligaciones.Selected.Add('PERIODO'#9'6'#9'Periodo');
   dbgObligaciones.Selected.Add('TIPPERID'#9'5'#9'Tipo~Persona');
   dbgObligaciones.Selected.Add('TD_PROV'#9'10'#9'T.Doc~Proveedor');
   dbgObligaciones.Selected.Add('PROVRUC'#9'16'#9'RUC');
   dbgObligaciones.Selected.Add('IMPORTE'#9'15'#9'Importe~Total');
   dbgObligaciones.Selected.Add('PROVAPEPAT'#9'20'#9'Ap.Paterno');
   dbgObligaciones.Selected.Add('PROVAPEMAT'#9'20'#9'Ap.Materno');
   dbgObligaciones.Selected.Add('PROVNOMBRE'#9'20'#9'Nombre');
   dbgObligaciones.Selected.Add('PROVNOMBRE1'#9'20'#9'Segundo Nombre');
   dbgObligaciones.Selected.Add('PROVDES'#9'50'#9'Razón Social');
   dbgObligaciones.DataSource := DMCXP.dsQry3;

   dbgObligaciones.ColumnByName('IMPORTE').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(IMPORTE)', ''), ffNumber, 15, 2);

   edtNomArch.Text := 'DAOT' + dblcRUC.Text + dbeAno.Text + '.txt';

   DMCXP.cdsQry3.EnableControls;
   Screen.Cursor := crDefault;
End;

Procedure TFTransfDAOT.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMCXP.cdsTDoc.Filtered := False;
   DMCXP.cdsTDoc.Filter := '';
   DMCXP.cdsQry3.close;
End;

Function TFTransfDAOT.OperClientDataSet(cdsOrigen: TwwClientDataSet; wExpresion, wCondicion: String): Double;
Var
   cdsClone: TwwClientDataSet;
   bmk: TBookmark;
   Agg: TAggregate;
Begin
   result := 0;

   If trim(wExpresion) = '' Then Exit;

   bmk := cdsOrigen.GetBookmark;
   cdsClone := TwwClientDataSet.Create(Nil);
   Try

      With cdsClone Do
      Begin
         CloneCursor(cdsOrigen, True);

         Agg := Aggregates.Add;
         Agg.AggregateName := 'OPER';
         Agg.Expression := wExpresion;
         Agg.Active := True;

         If Trim(wCondicion) <> '' Then
         Begin
            Filtered := False;
            Filter := wCondicion;
            Filtered := True;
         End;

         If Aggregates.Items[Aggregates.IndexOf('OPER')].Value <> NULL Then
            result := Aggregates.Items[Aggregates.IndexOf('OPER')].Value;

         Aggregates.Clear;

      End;

      cdsOrigen.GotoBookmark(bmk);
      cdsOrigen.FreeBookmark(bmk);

   Finally
      cdsClone.Free;
   End;
End;

Procedure TFTransfDAOT.bbtnDetalleClick(Sender: TObject);
Var
   xProv, xSQL: String;
   xBorra: Boolean;
Begin
   xSQL := 'select PROV,MTOANUAL '
      +    '  from (select A.PROV,'
      +    '               sum(case when S.DOCRESTA=''S'' '
      +    '                        then case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
      +    '                                  then (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0) + nvl(ADQ_NO_GRAV, 0))*-1 '
      +    '                                  else (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0) + nvl(ADQ_NO_GRAV, 0))*CPTCAMPR*-1 end '
      +    '                        else case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
      +    '                                  then (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0) + nvl(ADQ_NO_GRAV, 0))'
      +    '                                  else (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0) + nvl(ADQ_NO_GRAV, 0))*CPTCAMPR end end) MTOANUAL '
      +    '          from CXP301 A, TGE110 S '
      +    '         where A.CIAID in (' + wRUCCIA + ')'
      +    '           and TO_CHAR(A.CPFEMIS,''YYYY'')=' + quotedstr(dbeAno.Text)
      +    '           and ' + wTipDiarios
      +    '           and (A.CPESTADO=''P'' or A.CPESTADO=''C'')'
      +    '           and S.DOCMOD=''CXP'' and S.DOCID=A.DOCID';
   If length(dblcdProv.Text) > 0 Then
      xSQL := xSQL + ' and A.PROVRUC=' + quotedstr(DMCXP.cdsProv.FieldByName('PROVRUC').AsString);

   xSQL := xSQL
      +    '         group by A.PROV '
      +    '        ) XX '
      +    ' where MTOANUAL>(' + dbeUITs.Text + '*' + dbeValorUIT.Text + ')';
   DMCXP.cdsQry4.filtered := false;
   DMCXP.cdsQry4.indexfieldnames := '';
   DMCXP.cdsQry4.Close;
   DMCXP.cdsQry4.ProviderName := 'dspTGE';
   DMCXP.cdsQry4.DataRequest(xSQL);
   DMCXP.cdsQry4.Open;
   DMCXP.cdsQry4.indexfieldnames := 'PROV';

   xSQL := 'Select A.CPAAAA,A.CPANOMES,A.CPFEMIS, A.PROV, A.PROVRUC,  B.PROVDES, '
      +    '       A.DOCID, C.DOCDES, A.CPSERIE, A.CPNODOC, A.TMONID, D.TMONABR, '
      +    '       case when C.DOCRESTA=''S'' '
      +    '            then A.CPMTOLOC*-1 else A.CPMTOLOC '
      +    '        end CPMTOLOC, '
      +    '       case when C.DOCRESTA=''S'' '
      +    '            then A.CPMTOEXT*-1 else A.CPMTOEXT '
      +    '        end CPMTOEXT, '
      +    '       case when C.DOCRESTA=''S'' '
      +    '            then case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
      +    '                      then (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))*-1 '
      +    '                      else (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))*A.CPTCAMPR*-1 end '
      +    '            else case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
      +    '                      then (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0)) '
      +    '                      else (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))*A.CPTCAMPR end '
      +    '        end MONTOMN, '
      +    '       Round( case when C.DOCRESTA=''S'' '
      +    '                   then case when A.TMONID<>' + QuotedStr(DMCXP.wTMonLoc) //
      +    '                             then (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))*-1 '
      +    '                             else (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))/A.CPTCAMPR*-1 end '
      +    '                   else case when A.TMONID<>' + QuotedStr(DMCXP.wTMonLoc)
      +    '                             then (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0)) '
      +    '                             else (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))/A.CPTCAMPR end '
      +    '               end ) MONTOME, '
      +    '       case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
      +    '            then (case when C.DOCRESTA=''S'' '
      +    '                       then (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))*-1 '
      +    '                       else (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0)) end) '
      +    '            else 0 '
      +    '        end MTOLOC, '
      +    '       case when A.TMONID<>' + QuotedStr(DMCXP.wTMonLoc)
      +    '            THEN (case when C.DOCRESTA=''S'' '
      +    '                       then (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))*-1 '
      +    '                       else (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0)) end) '
      +    '            ELSE 0 '
      +    '        end MTOEXT '
      +    '  from CXP301 A, TGE201 B, TGE110 C, TGE103 D '
      +    ' where A.CIAID in (' + wRUCCIA + ')'
      +    '   and TO_CHAR(A.CPFEMIS,''YYYY'')=' + quotedstr(dbeAno.Text)
      +    '   and ' + wTipDiarios
      +    '   and (A.CPESTADO=''P'' or A.CPESTADO=''C'') '
      +    '   and (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPIGV2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))>0 '
      +    '   and B.CLAUXID=A.CLAUXID and B.PROV=A.PROV '
      +    '   and C.DOCMOD=''CXP'' and C.DOCID=A.DOCID '
      +    '   and D.TMONID=A.TMONID ';
   If length(dblcdProv.Text) > 0 Then
      xSQL := xSQL + ' and A.PROVRUC=' + quotedstr(DMCXP.cdsProv.FieldByName('PROVRUC').AsString);
   DMCXP.cdsQry3.filtered := false;
   DMCXP.cdsQry3.filter := '';
   DMCXP.cdsQry3.indexfieldnames := '';
   DMCXP.cdsQry3.Close;
   dbgObligaciones.Selected.clear;
   DMCXP.cdsQry3.ProviderName := 'dspTGE';
   DMCXP.cdsQry3.DataRequest(xSQL);
   DMCXP.cdsQry3.Open;
   DMCXP.cdsQry3.indexfieldnames := 'PROV';
   Screen.Cursor := crHourGlass;
   DMCXP.cdsQry3.DisableControls;
   DMCXP.cdsQry3.First;
   While Not DMCXP.cdsQry3.EOF Do
   Begin
      xProv := DMCXP.cdsQry3.FieldByName('PROV').AsString;
      xBorra := False;
      DMCXP.cdsQry4.SetKey;
      DMCXP.cdsQry4.FieldByName('PROV').AsString := DMCXP.cdsQry3.FieldByName('PROV').AsString;
      If Not DMCXP.cdsQry4.Gotokey Then
         xBorra := True;
      While (Not DMCXP.cdsQry3.EOF) And (DMCXP.cdsQry3.FieldByName('PROV').AsString = xProv) Do
      Begin
         If xBorra Then
            DMCXP.cdsQry3.Delete
         Else
            DMCXP.cdsQry3.Next;
      End;
   End;
   DMCXP.cdsQry3.EnableControls;
   Screen.Cursor := crDefault;
   TNumericField(DMCXP.cdsQry3.FieldByName('CPMTOLOC')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.cdsQry3.FieldByName('CPMTOEXT')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.cdsQry3.FieldByName('MONTOMN')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.cdsQry3.FieldByName('MONTOME')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.cdsQry3.FieldByName('MTOLOC')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCXP.cdsQry3.FieldByName('MTOEXT')).DisplayFormat := '###,###,##0.00';

   DMCXP.cdsQry3.indexfieldnames := 'PROV';
   DMCXP.cdsQry3.First;

   dbgObligaciones.Selected.clear;
   dbgObligaciones.Selected.Add('CPAAAA'#9'5'#9'Año');
   dbgObligaciones.Selected.Add('CPANOMES'#9'6'#9'Año+Mes');
   dbgObligaciones.Selected.Add('CPFEMIS'#9'11'#9'Fecha~Emisión');
   dbgObligaciones.Selected.Add('PROV'#9'12'#9'Código~Proveedor');
   dbgObligaciones.Selected.Add('PROVRUC'#9'12'#9'R.U.C.');
   dbgObligaciones.Selected.Add('PROVDES'#9'40'#9'Razón Social');
   dbgObligaciones.Selected.Add('DOCID'#9'5'#9'T.Doc');
   dbgObligaciones.Selected.Add('DOCDES'#9'15'#9'Documento');
   dbgObligaciones.Selected.Add('CPSERIE'#9'5'#9'Serie');
   dbgObligaciones.Selected.Add('CPNODOC'#9'15'#9'No.Doc.');
   dbgObligaciones.Selected.Add('TMONID'#9'5'#9'T.Mon');
   dbgObligaciones.Selected.Add('TMONABR'#9'7'#9'Moneda');
   dbgObligaciones.Selected.Add('CPMTOLOC'#9'14'#9'Monto~MN');
   dbgObligaciones.Selected.Add('CPMTOEXT'#9'14'#9'Monto~ME');
   dbgObligaciones.Selected.Add('MONTOMN'#9'14'#9'Importe~MN');
   dbgObligaciones.Selected.Add('MONTOME'#9'14'#9'Importe~ME');
   dbgObligaciones.Selected.Add('MTOLOC'#9'14'#9'Importe~Solo MN');
   dbgObligaciones.Selected.Add('MTOEXT'#9'14'#9'Importe~Solo ME');

   dbgObligaciones.DataSource := DMCXP.dsQry3;

   dbgObligaciones.ColumnByName('CPMTOLOC').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(CPMTOLOC)', ''), ffNumber, 15, 2);
   dbgObligaciones.ColumnByName('CPMTOEXT').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(CPMTOEXT)', ''), ffNumber, 15, 2);
   dbgObligaciones.ColumnByName('MONTOMN').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(MONTOMN)', ''), ffNumber, 15, 2);
   dbgObligaciones.ColumnByName('MONTOME').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(MONTOME)', ''), ffNumber, 15, 2);
   dbgObligaciones.ColumnByName('MTOLOC').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(MTOLOC)', ''), ffNumber, 15, 2);
   dbgObligaciones.ColumnByName('MTOEXT').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(MTOEXT)', ''), ffNumber, 15, 2);
   dbgObligaciones.RedrawGrid;
   bbtnImprime.enabled := False;
   bbtnDetalleRep.enabled := True;
   BitBtn4.enabled := True;
   bbtnGrabaCds.enabled := False;
   bbtnGrabaTxt.enabled := False;
End;

Procedure TFTransfDAOT.bbtnDetalleRepClick(Sender: TObject);
Var
   x10: Integer;
Begin
   If DMCXP.cdsQry3.RecordCount = 0 Then
   Begin
      ShowMessage('No existe Detalle a Imprimir');
      exit;
   End;
   DMCXP.cdsQry3.DisableControls;
   ppDBReporteDAOT.dataSource := DMCXP.dsQry3;
   DMCXP.cdsQry3.indexfieldnames := 'PROVDES;DOCID;CPFEMIS';
   pprDetalle.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ReporteDAOTDet.rtm';
   pprDetalle.Template.LoadFromFile;

   pplblCiaDet.Caption := edtCia.Text;
   pplblTitDet.Caption := 'CONSISTENCIA DETALLADA PARA DECLARACION ANUAL DE OPERACIONES CON TERCEROS - EJERCICIO ' + dbeAno.Text;

   pprDetalle.Print;
   pprDetalle.Stop;
   DMCXP.cdsQry3.EnableControls;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
   ppDBReporteDAOT.dataSource := Nil;

End;

Procedure TFTransfDAOT.FormShow(Sender: TObject);
Var
   xSQL: String;
Begin
   DMCXP.cdsQry1.Close;
   xSQL := 'SELECT CIAID, CIARUC, CIADES FROM TGE101 where CIARUC is not NULL GROUP BY CIAID, CIARUC, CIADES';
   DMCXP.cdsQry1.ProviderName := 'dspTGE';
   DMCXP.cdsQry1.DataRequest(xSQL);
   DMCXP.cdsQry1.Open;

   xSQL := 'Select TDIARID, TDIARDES, TDIARNUM, TDIAREST, AUTONUM, FLAGBCOCJA, '
      + '          TDIARMAN, REGISTRO, FLAGALM, TDIARABR, FLAGPDT, FLAGPL, FLGPLPER, '
      + '          TDIARID1, FLAGAF '
      + '     from TGE104 '
      + '    where REGISTRO=' + quotedstr('C') + ' or REGISTRO=' + quotedstr('4');
   DMCXP.cdsTDiario.Close;
   DMCXP.cdsTDiario.DataRequest(xSQL);
   DMCXP.cdsTDiario.Open;

   If DMCXP.cdsTDiario.RecordCount = 0 Then
   Begin
      xSQL := 'Select TDIARID, TDIARDES, TDIARNUM, TDIAREST, AUTONUM, FLAGBCOCJA, '
         + '          TDIARMAN, REGISTRO, FLAGALM, TDIARABR, FLAGPDT, FLAGPL, FLGPLPER, '
         + '          TDIARID1, FLAGAF '
         + '     from TGE104';
      DMCXP.cdsTDiario.Close;
      DMCXP.cdsTDiario.DataRequest(xSQL);
      DMCXP.cdsTDiario.Open;
   End;
   DMCXP.cdsTDiario.IndexFieldNames := 'TDIARID';

   wTipDiarios := '';
   DMCXP.cdsTDiario.First;
   While Not DMCXP.cdsTDiario.EOF Do
   Begin
      If length(wTipDiarios) = 0 Then
         wTipDiarios := ' (A.TDIARID=' + quotedstr(DMCXP.cdsTDiario.FieldByName('TDIARID').AsString)
      Else
         wTipDiarios := wTipDiarios + ' or A.TDIARID=' + quotedstr(DMCXP.cdsTDiario.FieldByName('TDIARID').AsString);
      DMCXP.cdsTDiario.Next;
   End;
   If length(wTipDiarios) > 0 Then wTipDiarios := wTipDiarios + ') ';
   DMCXP.cdsTDiario.First;

   IniciaDatos;
   fg_AsignaDSDetalle;
End;

Procedure TFTransfDAOT.dblcdProvExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If (length(dblcdProv.Text) > 0) Then
   Begin
      xWhere := 'PROVRUC=''' + dblcdProv.Text + '''';
      edtProv.Text := BuscaQry('dspTGE', 'TGE201', 'PROV,PROVRUC,PROVDES', xWhere, 'PROVDES');
      If length(edtProv.Text) = 0 Then
      Begin
         dblcdProv.Text := '';
         ShowMessage('Proveedor no existe');
         dblcdProv.SetFocus;
         exit;
      End;
   End
   Else
   Begin
      edtProv.Text := '';
      dblcdProv.Clear;
      exit;
   End;
   If fg_BuscaProvDaot = False Then
   Begin
      Exit;
   End;

End;

Procedure TFTransfDAOT.FormActivate(Sender: TObject);
Var
   wAno, wMes, wDia: Word;
Begin
   DecodeDate(DateS, wAno, wMes, wDia);

   dbeAno.Value := wAno;

   If DMCXP.cdsProv.IndexFieldNames <> 'PROV' Then
      DMCXP.cdsProv.IndexFieldNames := 'PROV';

End;

Procedure TFTransfDAOT.rgTipoDiarioClick(Sender: TObject);
Begin
// si se escoge todos los Tipos de Diarios de Registro de Compras y 4ta. Categoría a la vez
   If rgTipoDiario.ItemIndex = 0 Then
   Begin
      wTipDiarios := '';
      DMCXP.cdsTDiario.First;
      While Not DMCXP.cdsTDiario.EOF Do
      Begin
         If length(wTipDiarios) = 0 Then
            wTipDiarios := ' (A.TDIARID=' + quotedstr(DMCXP.cdsTDiario.FieldByName('TDIARID').AsString)
         Else
            wTipDiarios := wTipDiarios + ' or A.TDIARID=' + quotedstr(DMCXP.cdsTDiario.FieldByName('TDIARID').AsString);
         DMCXP.cdsTDiario.Next;
      End;
      If length(wTipDiarios) > 0 Then wTipDiarios := wTipDiarios + ') ';
   End;
// si se especifica un Tipo de Diario
   If rgTipoDiario.ItemIndex = 1 Then
   Begin
      dblcTDiario.Enabled := True;
      dblcTDiario.SetFocus;
      exit;
   End;
End;

Procedure TFTransfDAOT.dblcdProvEnter(Sender: TObject);
Begin
   If Not DMCXP.cdsProv.Active Then
   Begin
      Screen.Cursor := crHourGlass;
      Filtracds(DMCXP.cdsProv, 'SELECT PROV, PROVRUC, PROVDES, PROVNOMCOM FROM TGE201');
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFTransfDAOT.FormCreate(Sender: TObject);
Begin
   Filtracds(DMCXP.cdsProv, 'SELECT PROV, PROVRUC, PROVDES, PROVNOMCOM FROM TGE201');
End;

Procedure TFTransfDAOT.BitBtn1Click(Sender: TObject);
Var
   xLinea, xWhere, xSQL, cImpTot, cTotProv: String;
   nTotProv: Double;
Begin
   If length(trimleft(trimright(edtNomArch.Text))) = 0 Then
   Begin
      ShowMessage('Falta Archivo Destino');
      exit;
   End;

// verificacion de datos
   DMCXP.cdsQry3.DisableControls;

   Screen.Cursor := crHourGlass;
   scFILES.Lines.clear;
   DMCXP.cdsQry3.First;
   While Not DMCXP.cdsQry3.EOF Do
   Begin
      xSQL := 'Select A.CIAID, A.PROV, A.PROVRUC, '
         +    '       sum(case when S.DOCRESTA=''S'' '
         +    '                then case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
         +    '                          then (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))*-1 '
         +    '                          else (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))*CPTCAMPR*-1 '
         +    '                      end '
         +    '                else case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
         +    '                          then (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))'
         +    '                          else (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))*CPTCAMPR '
         +    '                      end '
         +    '            end ) MTOANUAL '
         +    '  from CXP301 A, TGE110 S '
         +    ' where A.CIAID in (' + wRUCCIA + ')'
         +    '   and TO_CHAR(A.CPFEMIS,''YYYY'')=' + quotedstr(DMCXP.cdsQry3.fieldbyname('PERIODO').AsString)
         +    '   and ' + wTipDiarios
         +    '   and ( A.CPESTADO=''P'' or A.CPESTADO=''C'' ) and S.DOCMOD=''CXP'' and S.DOCID=A.DOCID '
         +    '   and A.PROVRUC=' + quotedstr(DMCXP.cdsQry3.fieldbyname('PROVRUC').AsString)
         +    '  group by A.CIAID, A.PROV, A.PROVRUC order by A.CIAID';
      DMCXP.cdsQry4.filtered := false;
      DMCXP.cdsQry4.indexfieldnames := '';
      DMCXP.cdsQry4.Close;
      DMCXP.cdsQry4.ProviderName := 'dspTGE';
      DMCXP.cdsQry4.DataRequest(xSQL);
      DMCXP.cdsQry4.Open;

      If DMCXP.cdsQry4.RecordCount <= 0 Then
      Begin
         xSQL := 'Select PROV '
            +    '  from TGE201 '
            +    ' where PROVDES=' + quotedstr(DMCXP.cdsQry3.fieldbyname('PROVDES').AsString);
         DMCXP.cdsQry4.Close;
         DMCXP.cdsQry4.DataRequest(xSQL);
         DMCXP.cdsQry4.Open;

         xSQL := 'Select A.CIAID, A.PROV, A.PROVRUC, '
            +    '       sum(case when S.DOCRESTA=''S'' '
            +    '                then case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
            +    '                          then (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))*-1 '
            +    '                          else (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))*CPTCAMPR*-1 '
            +    '                     end '
            +    '                else case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
            +    '                          then (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))'
            +    '                          else (' + DMCXP.wReplacCeros + '(A.CPGRAVAD,0)+' + DMCXP.wReplacCeros + '(A.CPGRAVAD2,0)+' + DMCXP.wReplacCeros + '(A.CPNOGRAV,0))*CPTCAMPR '
            +    '                     end '
            +    '            end ) MTOANUAL '
            +    '  from CXP301 A, TGE110 S '
            +    ' where A.CIAID in (' + wRUCCIA + ')'
            +    '   and TO_CHAR(A.CPFEMIS,''YYYY'')=' + quotedstr(DMCXP.cdsQry3.fieldbyname('PERIODO').AsString)
            +    '   and ' + wTipDiarios
            +    '   and ( A.CPESTADO=''P'' or A.CPESTADO=''C'' ) and S.DOCMOD=''CXP'' and S.DOCID=A.DOCID '
            +    '   and A.PROV=' + quotedstr(DMCXP.cdsQry4.fieldbyname('PROV').AsString)
            +    ' group by A.CIAID, A.PROV, A.PROVRUC order by A.CIAID';
         DMCXP.cdsQry4.Close;
         DMCXP.cdsQry4.DataRequest(xSQL);
         DMCXP.cdsQry4.Open;
      End;

      cImpTot := FloattoStr(Int(FRound(DMCXP.cdsQry3.fieldbyname('IMPORTE').AsFloat, 20, 0)));

      nTotProv := 0;
      DMCXP.cdsQry4.First;
      While Not DMCXP.cdsQry4.Eof Do
      Begin
         nTotProv := nTotProv + DMCXP.cdsQry4.fieldbyname('MTOANUAL').AsFloat;
         DMCXP.cdsQry4.Next;
      End;

      cTotProv := FloattoStr(Int(FRound(nTotProv, 20, 0)));

      DMCXP.cdsQry4.First;
      While Not DMCXP.cdsQry4.Eof Do
      Begin
         xLinea := '';
         xLinea := DMCXP.cdsQry3.fieldbyname('CORRELAT').AsString; //1
         xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('TD_DECLAR').AsString; // 2
         xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('RUC_DECLAR').AsString; // 2
         xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PERIODO').AsString; // 2
         xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('TIPPERID').AsString; // 2
         xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('TD_PROV').AsString; // 2
         xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PROVRUC').AsString; // 2
         xLinea := xLinea + '|' + cImpTot; // 8
         xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PROVAPEPAT').AsString; // 2
         xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PROVAPEMAT').AsString; // 3
         xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString; // 4
         xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PROVNOMBRE1').AsString; // 4
         xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PROVDES').AsString; // 4

         xLinea := xLinea + '|' + DMCXP.cdsQry4.fieldbyname('CIAID').AsString; // 4
         xLinea := xLinea + '|' + FloattoStr(Int(FRound(DMCXP.cdsQry4.fieldbyname('MTOANUAL').AsFloat, 20, 0))); // 4
         xLinea := xLinea + '|' + cTotProv; // 4
         xLinea := xLinea + '|';
         scFILES.Lines.Add(xLinea);
         cImpTot := '';
         cTotProv := '';
         DMCXP.cdsQry4.Next;
      End;

      DMCXP.cdsQry3.Next;
   End;
   Screen.Cursor := crDefault;
   If savdlg1.Execute Then
   Begin
      edtNomArch.Text := savdlg1.FileName;
      scFILES.Lines.SaveToFile(edtNomArch.Text);
      DMCXP.cdsQry3.EnableControls;

   End;

   DMCXP.cdsQry3.EnableControls;
   ShowMessage('Transferencia Realizada');
End;

Procedure TFTransfDAOT.BitBtn4Click(Sender: TObject);
Begin
   ExportaGridExcel(dbgObligaciones, 'Proveedor');
End;

Procedure TFTransfDAOT.BitBtn3Click(Sender: TObject);
Var
   xSQL: String;
   sGravado, sGravado2, sNoGravado: String;

Begin
   sGravado := ' 0 ';
   sGravado2 := ' 0 ';
   sNoGravado := ' 0 ';
   If cbGravado.Checked Then
      sGravado := ' nvl(CPGRAVAD,0) ';
   If cbGravado2.Checked Then
      sGravado2 := ' nvl(CPGRAVAD2,0) ';
   If cbNoGravado.Checked Then
      sNoGravado := ' nvl(CPNOGRAV,0) ';

   xSQL := 'select A.ciaid, B.CIADES, '
      +    '       sum( case when cpanomes=''200901'' then round(IMPORTE,2) else 0 end ) ENE,  '
      +    '       sum( case when cpanomes=''200902'' then round(IMPORTE,2) else 0 end ) FEB, '
      +    '       sum( case when cpanomes=''200903'' then round(IMPORTE,2) else 0 end ) MAR, '
      +    '       sum( case when cpanomes=''200904'' then round(IMPORTE,2) else 0 end ) ABR, '
      +    '       sum( case when cpanomes=''200905'' then round(IMPORTE,2) else 0 end ) MAY, '
      +    '       sum( case when cpanomes=''200906'' then round(IMPORTE,2) else 0 end ) JUN, '
      +    '       sum( case when cpanomes=''200907'' then round(IMPORTE,2) else 0 end ) JUL, '
      +    '       sum( case when cpanomes=''200908'' then round(IMPORTE,2) else 0 end ) AGO, '
      +    '       sum( case when cpanomes=''200909'' then round(IMPORTE,2) else 0 end ) SETI, '
      +    '       sum( case when cpanomes=''200910'' then round(IMPORTE,2) else 0 end ) OCT, '
      +    '       sum( case when cpanomes=''200911'' then round(IMPORTE,2) else 0 end ) NOV, '
      +    '       sum( case when cpanomes=''200912'' then round(IMPORTE,2) else 0 end ) DIC, '
      +    '       sum( round(importe,2) ) TOTAL '
      +    '  from ( '
      +    '        select A.CIAID, a.cpanomes, '
      +    '               sum(case when DOCRESTA=''S'' '
      +    '                        then (case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
      +    '                                   then (( ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' )*-1) '
      +    '                                   else (( ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' )*CPTCAMPR)*-1 end) '
      +    '                        else (case when A.TMONID=' + quotedStr(DMCXP.wTMonLoc)
      +    '                                   then ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' '
      +    '                                   else (( ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' )*CPTCAMPR) end ) end) IMPORTE '
      +    '          From CXP301 A, TGE110 '
      +    '         Where A.CIAID in (' + wRUCCIA + ') '
      +    '           and TO_CHAR(CPFEMIS,''YYYY'')=' + quotedstr(dbeAno.Text)
      +    '           and ' + wTipDiarios
      +    '           and (CPESTADO=''P'' or CPESTADO=''C'')'
      +    '           and TGE110.DOCMOD=''CXP'' and TGE110.DOCID=A.DOCID '
      +    '         group by A.CIAID, A.CPANOMES '
      +    '        ) A, TGE101 B '
      +    ' where A.CIAID=B.CIAID '
      +    ' group by A.ciaid, B.CIADES order by A.CIAID';
   DMCXP.cdsQry8.filtered := false;
   DMCXP.cdsQry8.indexfieldnames := '';
   DMCXP.cdsQry8.Close;
   DMCXP.cdsQry8.ProviderName := 'dspTGE';
   DMCXP.cdsQry8.DataRequest(xSQL);
   DMCXP.cdsQry8.Open;

   dbgData.DataSource := DMCXP.dsQry8;
   DMCXP.ExportaGridExcel(dbgData, 'PorFechaEmision');
End;

Procedure TFTransfDAOT.BitBtn5Click(Sender: TObject);
Var
   xSQL: String;
   sGravado, sGravado2, sNoGravado: String;

Begin
   sGravado := ' 0 ';
   sGravado2 := ' 0 ';
   sNoGravado := ' 0 ';
   If cbGravado.Checked Then
      sGravado := ' nvl(CPGRAVAD,0) ';
   If cbGravado2.Checked Then
      sGravado2 := ' nvl(CPGRAVAD2,0) ';
   If cbNoGravado.Checked Then
      sNoGravado := ' nvl(CPNOGRAV,0) ';

   xSQL := 'Select A.ciaid, B.CIADES, '
      +    '       sum( case when cpanomes=''200901'' then round(IMPORTE,2) else 0 end ) ENE,  '
      +    '       sum( case when cpanomes=''200902'' then round(IMPORTE,2) else 0 end ) FEB, '
      +    '       sum( case when cpanomes=''200903'' then round(IMPORTE,2) else 0 end ) MAR, '
      +    '       sum( case when cpanomes=''200904'' then round(IMPORTE,2) else 0 end ) ABR, '
      +    '       sum( case when cpanomes=''200905'' then round(IMPORTE,2) else 0 end ) MAY, '
      +    '       sum( case when cpanomes=''200906'' then round(IMPORTE,2) else 0 end ) JUN, '
      +    '       sum( case when cpanomes=''200907'' then round(IMPORTE,2) else 0 end ) JUL, '
      +    '       sum( case when cpanomes=''200908'' then round(IMPORTE,2) else 0 end ) AGO, '
      +    '       sum( case when cpanomes=''200909'' then round(IMPORTE,2) else 0 end ) SETI, '
      +    '       sum( case when cpanomes=''200910'' then round(IMPORTE,2) else 0 end ) OCT, '
      +    '       sum( case when cpanomes=''200911'' then round(IMPORTE,2) else 0 end ) NOV, '
      +    '       sum( case when cpanomes=''200912'' then round(IMPORTE,2) else 0 end ) DIC, '
      +    '       sum( round(importe,2) ) TOTAL '
      +    ' from ( '
      +    '       select A.CIAID, A.CPANOMES, '
      +    '              sum(case when DOCRESTA=''S'' '
      +    '                       then (case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
      +    '                                  then (( ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' )*-1) '
      +    '                                  else (( ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' )*CPTCAMPR)*-1 end) '
      +    '                       else (case when A.TMONID=' + quotedStr(DMCXP.wTMonLoc)
      +    '                                  then ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' '
      +    '                                  else (( ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' )*CPTCAMPR) end ) end) IMPORTE '
      +    '         From CXP301 A, TGE110 '
      +    '        Where A.CIAID in (' + wRUCCIA + ') '
      +    '          and cpanomes like ' + quotedstr(dbeAno.Text + '%')
      +    '          and ' + wTipDiarios
      +    '          and (CPESTADO=''P'' or CPESTADO=''C'')'
      +    '          and TGE110.DOCMOD(+)=''CXP'' and TGE110.DOCID(+)=A.DOCID '
      +    '        group by A.CIAID, a.cpanomes '
      +    '       ) A, TGE101 B '
      +    ' where A.CIAID=B.CIAID '
      +    ' group by A.CIAID, B.CIADES Order by A.CIAID';
   DMCXP.cdsQry8.filtered := false;
   DMCXP.cdsQry8.indexfieldnames := '';
   DMCXP.cdsQry8.Close;
   DMCXP.cdsQry8.ProviderName := 'dspTGE';
   DMCXP.cdsQry8.DataRequest(xSQL);
   DMCXP.cdsQry8.Open;

   dbgData.DataSource := DMCXP.dsQry8;
   DMCXP.ExportaGridExcel(dbgData, 'PorFechaRegistro');
  //dbgData.DataSource:=nil;

End;

Procedure TFTransfDAOT.BitBtn6Click(Sender: TObject);
Var
   xSQL: String;
   sGravado, sGravado2, sNoGravado: String;

Begin
   sGravado := ' 0 ';
   sGravado2 := ' 0 ';
   sNoGravado := ' 0 ';
   If cbGravado.Checked Then
      sGravado := ' nvl(CPGRAVAD,0) ';
   If cbGravado2.Checked Then
      sGravado2 := ' nvl(CPGRAVAD2,0) ';
   If cbNoGravado.Checked Then
      sNoGravado := ' nvl(CPNOGRAV,0) ';

   xSQL := 'Select A.CIAID, A.DOCID, A.CPNOREG, A.CPSERIE, A.CPNODOC, CPFCMPRB, '
      +    '       round(case when DOCRESTA=''S'' '
      +    '                  then (case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
      +    '                             then (( ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' )*-1) '
      +    '                             else (( ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' )*CPTCAMPR)*-1 end) '
      +    '                  else (case when A.TMONID=' + quotedStr(DMCXP.wTMonLoc)
      +    '                             then ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' '
      +    '                             else (( ' + sGravado + ' + ' + sGravado2 + ' + ' + sNoGravado + ' )*CPTCAMPR) end ) end,2) IMPORTE '
      +    '  From CXP301 A, TGE110 '
      +    ' Where A.CIAID in (' + meCia.text + ') '
      +    '   and CPANOMES like ' + quotedstr(meMes.Text + '%')
      +    '   and ' + wTipDiarios
      +    '   and (CPESTADO=''P'' or CPESTADO=''C'')'
      +    '   and TGE110.DOCMOD=''CXP'' and TGE110.DOCID=A.DOCID '
      +    ' order by A.CIAID, A.DOCID, CPNOREG, A.CPSERIE, A.CPNODOC';
   DMCXP.cdsQry8.filtered := false;
   DMCXP.cdsQry8.indexfieldnames := '';
   DMCXP.cdsQry8.Close;
   DMCXP.cdsQry8.ProviderName := 'dspTGE';
   DMCXP.cdsQry8.DataRequest(xSQL);
   DMCXP.cdsQry8.Open;

   dbgData.DataSource := DMCXP.dsQry8;
   DMCXP.ExportaGridExcel(dbgData, 'Detalle ');
End;

Procedure TFTransfDAOT.dbgObligacionesKeyDown(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg('¿Esta Seguro de Eliminar Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMCXP.cdsQry3.Delete;
      End;
   End;
End;

Procedure TFTransfDAOT.bbtnRenumerarClick(Sender: TObject);
Var
   nCont: integer;
Begin
   DMCXP.cdsQry3.First;
   nCont := 0;
   While Not DMCXP.cdsQry3.EOF Do
   Begin
      Inc(nCont);
      DMCXP.cdsQry3.Edit;
      DMCXP.cdsQry3.FieldByname('CORRELAT').AsInteger := nCont;
      DMCXP.cdsQry3.Post;
      DMCXP.cdsQry3.Next;
   End;
End;

Procedure TFTransfDAOT.fg_AsignaDSDetalle;
Begin

   dbgDetalleProveedor.Selected.clear;
   dbgDetalleProveedor.Selected.Add('CIAID'#9'5'#9'Cia');
   dbgDetalleProveedor.Selected.Add('CPAAAA'#9'5'#9'Año');
   dbgDetalleProveedor.Selected.Add('CPANOMES'#9'6'#9'Año+Mes');
   dbgDetalleProveedor.Selected.Add('CPFEMIS'#9'11'#9'Fecha~Emisión');
   dbgDetalleProveedor.Selected.Add('PROV'#9'12'#9'Código~Proveedor');
   dbgDetalleProveedor.Selected.Add('PROVRUC'#9'12'#9'R.U.C.');
   dbgDetalleProveedor.Selected.Add('PROVDES'#9'40'#9'Razón Social');

   dbgDetalleProveedor.Selected.Add('DOCID'#9'5'#9'T.Doc');
   dbgDetalleProveedor.Selected.Add('DOCDES'#9'15'#9'Documento');
   dbgDetalleProveedor.Selected.Add('CPSERIE'#9'5'#9'Serie');
   dbgDetalleProveedor.Selected.Add('CPNODOC'#9'15'#9'No.Doc.');
   dbgDetalleProveedor.Selected.Add('TMONID'#9'5'#9'T.Mon');

   dbgDetalleProveedor.Selected.Add('TMONABR'#9'7'#9'Moneda');
   dbgDetalleProveedor.Selected.Add('MONTOMN'#9'14'#9'Importe~MN');
   dbgDetalleProveedor.Selected.Add('MONTOME'#9'14'#9'Importe~ME');

   dbgDetalleProveedor.Selected.Add('CPMTOLOC'#9'14'#9'Monto MN~Inc IGV');
   dbgDetalleProveedor.Selected.Add('CPMTOEXT'#9'14'#9'Monto ME~Inc IGV');

   dbgDetalleProveedor.DataSource := DMCXP.dsDaotDetalle;

End;

Procedure TFTransfDAOT.dbgObligacionesDblClick(Sender: TObject);
Begin
   pnDetalle.Visible := True;
   dbeRuc.Text := DMCXP.cdsQry3.FieldByname('PROVRUC').AsString;
   dbeProveedor.Text := DMCXP.cdsQry3.FieldByname('PROVDES').AsString;
   fg_RecuperaDetalle(dbeAno.Text, DMCXP.cdsQry3.fieldbyname('PROVRUC').AsString);

End;

Procedure TFTransfDAOT.fg_RecuperaDetalle(wgPeriodo, wgProveedor: String);
Var
   xsSql: String;
   xsGravado, xsGravado2, xsNoGravado, xsAdqNoGrav: String;
Begin
   xsGravado := ' 0 ';
   xsGravado2 := ' 0 ';
   xsNoGravado := ' 0 ';
   xsAdqNoGrav := ' 0 ';
   If cbGravado.Checked Then
      xsGravado := ' nvl(A.CPGRAVAD,0) ';
   If cbGravado2.Checked Then
      xsGravado2 := ' nvl(A.CPGRAVAD2,0) ';
   If cbNoGravado.Checked Then
      xsNoGravado := ' nvl(A.CPNOGRAV,0) ';
   If cbAdqNoGra.Checked Then
      xsAdqNoGrav := ' nvl(A.ADQ_NO_GRAV,0) ';

   xsSql := 'Select A.CIAID, A.CPAAAA,A.CPANOMES,A.CPFEMIS, A.PROV, A.PROVRUC,  B.PROVDES, '
      +     '       A.DOCID, C.DOCDES, A.CPSERIE, A.CPNODOC, A.TMONID, D.TMONABR, '
      +     '       case when C.DOCRESTA=' + QuotedStr('S')
      +     '            then A.CPMTOLOC*-1 else A.CPMTOLOC '
      +     '        end CPMTOLOC, '
      +     '       case when C.DOCRESTA=' + QuotedStr('S')
      +     '            then A.CPMTOEXT*-1 else A.CPMTOEXT '
      +     '        end CPMTOEXT, '
      +     '       case when C.DOCRESTA=' + QuotedStr('S')
      +     '            then case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
      +     '                      then (' + xsGravado + '+' + xsGravado2 + '+' + xsNoGravado + '+' + xsAdqNoGrav + ')*-1 '
      +     '                      else (' + xsGravado + '+' + xsGravado2 + '+' + xsNoGravado + '+' + xsAdqNoGrav + ')*A.CPTCAMPR*-1 end '
      +     '            else case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
      +     '                      then (' + xsGravado + '+' + xsGravado2 + '+' + xsNoGravado + '+' + xsAdqNoGrav + ') '
      +     '                      else (' + xsGravado + '+' + xsGravado2 + '+' + xsNoGravado + '+' + xsAdqNoGrav + ')*A.CPTCAMPR end '
      +     '        end MONTOMN, '
      +     '       Round( case when C.DOCRESTA=''S'' '
      +     '                   then case when A.TMONID<>' + QuotedStr(DMCXP.wTMonLoc) //
      +     '                             then (' + xsGravado + '+' + xsGravado2 + '+' + xsNoGravado + '+' + xsAdqNoGrav + ')*-1 '
      +     '                             else (' + xsGravado + '+' + xsGravado2 + '+' + xsNoGravado + '+' + xsAdqNoGrav + ')/A.CPTCAMPR*-1 end '
      +     '                   else case when A.TMONID<>' + QuotedStr(DMCXP.wTMonLoc)
      +     '                             then (' + xsGravado + '+' + xsGravado2 + '+' + xsNoGravado + '+' + xsAdqNoGrav + ') '
      +     '                             else (' + xsGravado + '+' + xsGravado2 + '+' + xsNoGravado + '+' + xsAdqNoGrav + ')/A.CPTCAMPR end '
      +     '                end ) MONTOME, '
      +     '       case when A.TMONID=' + QuotedStr(DMCXP.wTMonLoc)
      +     '            then (case when C.DOCRESTA=''S'' '
      +     '                       then (' + xsGravado + '+' + xsGravado2 + '+' + xsNoGravado + '+' + xsAdqNoGrav + ')*-1 '
      +     '                       else (' + xsGravado + '+' + xsGravado2 + '+' + xsNoGravado + '+' + xsAdqNoGrav + ') end) '
      +     '            else 0 '
      +     '        end MTOLOC, '
      +     '       case when A.TMONID<>' + QuotedStr(DMCXP.wTMonLoc)
      +     '            then (case when C.DOCRESTA=''S'' '
      +     '                       then (' + xsGravado + '+' + xsGravado2 + '+' + xsNoGravado + '+' + xsAdqNoGrav + ')*-1 '
      +     '                       else (' + xsGravado + '+' + xsGravado2 + '+' + xsNoGravado + '+' + xsAdqNoGrav + ') end) '
      +     '            else 0 '
      +     '        end MTOEXT '
      +     '  from CXP301 A, TGE201 B, TGE110 C, TGE103 D '
      +     ' where A.CIAID in (' + wRUCCIA + ')'
      +     '   and to_char(A.CPFEMIS,''YYYY'')=' + quotedstr(wgPeriodo)
      +     '   and ' + wTipDiarios
      +     '   and (A.CPESTADO=''P'' or A.CPESTADO=''C'') '
      +     '   and B.CLAUXID=A.CLAUXID and B.PROV=A.PROV '
      +     '   and C.DOCMOD=''CXP'' and C.DOCID=A.DOCID '
      +     '   and D.TMONID=A.TMONID '
      +     '   and A.PROVRUC=' + QuotedStr(wgProveedor);
   DMCXP.cdsDaotDetalle.Close;
   DMCXP.cdsDaotDetalle.DataRequest(xsSQL);
   DMCXP.cdsDaotDetalle.Open;

   dbgDetalleProveedor.ColumnByName('CPMTOLOC').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsDaotDetalle, 'SUM(CPMTOLOC)', ''), ffNumber, 15, 2);
   dbgDetalleProveedor.ColumnByName('CPMTOEXT').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsDaotDetalle, 'SUM(CPMTOEXT)', ''), ffNumber, 15, 2);
   dbgDetalleProveedor.ColumnByName('MONTOMN').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsDaotDetalle, 'SUM(MONTOMN)', ''), ffNumber, 15, 2);
   dbgDetalleProveedor.ColumnByName('MONTOME').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsDaotDetalle, 'SUM(MONTOME)', ''), ffNumber, 15, 2);
   dbgDetalleProveedor.ColumnByName('MTOLOC').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsDaotDetalle, 'SUM(MTOLOC)', ''), ffNumber, 15, 2);
   dbgDetalleProveedor.ColumnByName('MTOEXT').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsDaotDetalle, 'SUM(MTOEXT)', ''), ffNumber, 15, 2);
   dbgDetalleProveedor.RedrawGrid;

End;

Procedure TFTransfDAOT.btnSalirClick(Sender: TObject);
Begin
   pnDetalle.Visible := False;
   dbeRuc.Text := '';
   dbeProveedor.Text := '';
End;

Function TFTransfDAOT.fg_BuscaProvDaot: Boolean;
Begin
   If DMCXP.cdsQry3.Locate('PROVRUC', VarArrayOf([dblcdProv.Text]), []) Then
   Begin
      Result := True;
      dbgObligacionesDblClick(dbgObligaciones);
      Exit;
   End
   Else
   Begin
      ShowMessage('Proveedor no está incluido en el Daot ');
      Result := False;
      Exit;
   End;
End;

Procedure TFTransfDAOT.btnExportarExcelClick(Sender: TObject);
Begin
   ExportaGridExcel(dbgDetalleProveedor, 'Prov_' + dbeRuc.Text);
End;

Procedure TFTransfDAOT.btnImprimeDetClick(Sender: TObject);
Var
   x10: Integer;
Begin
   If DMCXP.cdsDaotDetalle.RecordCount = 0 Then
   Begin
      ShowMessage('No existe Detalle a Imprimir');
      exit;
   End;
   DMCXP.cdsDaotDetalle.DisableControls;
   ppDBReporteDAOT.dataSource := DMCXP.dsDaotDetalle;
   DMCXP.cdsDaotDetalle.indexfieldnames := 'PROVDES;DOCID;CPFEMIS';
   pprDetalle.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ReporteDAOTDet.rtm';
   pprDetalle.Template.LoadFromFile;

   pplblCiaDet.Caption := edtCia.Text;
   pplblTitDet.Caption := 'CONSISTENCIA DETALLADA PARA DECLARACION ANUAL DE OPERACIONES CON TERCEROS - EJERCICIO ' + dbeAno.Text;

   pprDetalle.Print;

   pprDetalle.Stop;
   DMCXP.cdsDaotDetalle.EnableControls;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
   ppDBReporteDAOT.dataSource := Nil;

End;

Procedure TFTransfDAOT.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;

// Fin HPC_201602_CXP

End.

