Unit CXP503;

// Actualizaciones
// HPC_201410_CXP    23/07/2014  Cambios por inclusión de campos y validaciones de Régimen de Pensión
// HPC_201411_CXP    15/08/2014  Adicionales Régimen de Pensión
// SPP_201411_CXP    28/08/2014  Revisión control de calidad.
// HPC_201412_CXP    19/09/2014  Reordenamiento de Sangría
//                               Retiro de SQLs que no son Oracle
// HPC_201501_CXP    25/05/2014  Retiro de proceso de calculo por Derogación de Ley 29903
// HPC_201602_CXP    26/02/2016  DAF_2016000282_CXP_1 Retiro de Validación de Fecha de Nacimiento en Maestro de Proveedores
//                   26/02/2016  DAF_2016000282_CXP_1 Reporte de Validación - Imprime sólo los que tienen Observación
//                   26/02/2016  DAF_2016000282_CXP_1 Se agrega savedialog para que usuario escoja destino de archivo a generar
//                   26/02/2016  DAF_2016000282_CXP_1 Asume default 'S' para Domiciliados
//                   29/02/2016  DAF_2016000282_CXP_1 Debido a Recibos Electrónicos, se mantiene la Serie tal como se provisionó
//                   29/02/2016  DAF_2016000282_CXP_1 Modifica script que genera Resumen de Pago por Cía
//                   24/02/2016  DAF_2016000168_CXP_1 Modifica reporte de detalle RepPDT2_A4.rtm - Añade columna de suspensión de 4ta


Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, wwdblook, StrContainer,
   Grids, Wwdbigrd, Wwdbgrid, ppCache, ppDB, ppDBPipe, ppComm, ppRelatv,
   ppProd, ppClass, ppReport, ppCtrls, ppBands, ppVar, ppPrnabl, dbclient,
   db, wwClient, variants, ppEndUsr, ppParameter;

Type
   TFTransfPDT = Class(TForm)
      BitBtn2: TBitBtn;
      savdlg1: TSaveDialog;
      lblCia: TLabel;
      dblcRUC: TwwDBLookupCombo;
      edtCia: TEdit;
      Label2: TLabel;
      dbeAnoMM: TwwDBEdit;
      Bevel1: TBevel;
      bbtnBorra: TBitBtn;
      bbtnOk: TBitBtn;
      edtNomArch: TEdit;
      scFILES: TStrContainer;
      dbgRecibos4ta: TwwDBGrid;
      rgSoloPagados: TRadioGroup;
      bbtnImprime: TBitBtn;
      ppReportePDT: TppReport;
      ppDBReportePDT: TppDBPipeline;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
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
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLabel5: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppDBCalc2: TppDBCalc;
      bbtnRecuperar: TBitBtn;
      BitBtn1: TBitBtn;
      BitBtn4: TBitBtn;
      pprPDT2: TppReport;
      bbtnE4: TBitBtn;
      bbtnE7: TBitBtn;
      bbtnIncon: TBitBtn;
      edtNomArch2: TEdit;
      bbtnE20: TBitBtn;
      ppdb2: TppDBPipeline;
      ppr2: TppReport;
      ppd2: TppDesigner;
      ppHeaderBand3: TppHeaderBand;
      ppDetailBand3: TppDetailBand;
      ppd3: TppDesigner;
      ppParameterList1: TppParameterList;
      ppHeaderBand2: TppHeaderBand;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
   // Inicio HPC_201602_CXP
   // DAF_2016000282_CXP_1 retira etiqueta
   // ppLabel16: TppLabel;
   // Fin HPC_201602_CXP
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppSystemVariable5: TppSystemVariable;
      ppSystemVariable6: TppSystemVariable;
      ppLabel20: TppLabel;
      ppDBText16: TppDBText;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
   // Inicio HPC_201602_CXP
   // DAF_2016000282_CXP_1 restaura variable ppLabel45
      ppLabel45: TppLabel;
   // Fin HPC_201602_CXP

      ppLabel46: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
   // Inicio HPC_201602_CXP
   // DAF_2016000282_CXP_1 retira etiqueta
   // ppLabel35: TppLabel;
   // Fin HPC_201602_CXP

      ppLabel62: TppLabel;
      ppLine9: TppLine;
      ppLine10: TppLine;
      ppDetailBand2: TppDetailBand;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBCalc3: TppDBCalc;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppDBText33: TppDBText;
      ppDBText34: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
   // Inicio HPC_201602_CXP
   // DAF_2016000282_CXP_1 declaración de variables de reporte
   // ppDBText9: TppDBText;
   // ppDBText40: TppDBText;
      ppDBText52: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      ppLabel21: TppLabel;
      ppDBCalc4: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppLine11: TppLine;
      ppLine12: TppLine;
   // ppDBCalc17: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
   // ppDBCalc7: TppDBCalc;
   // Fin HPC_201602_CXP

      GroupBox2: TGroupBox;
      Label4: TLabel;
      btnAfpnet: TBitBtn;
      bbtnResumen: TBitBtn;
      ppdbRes: TppDBPipeline;
      pprRes: TppReport;
      ppdRes: TppDesigner;
      ppParameterList2: TppParameterList;
      ppHeaderBand4: TppHeaderBand;
      ppDBText25: TppDBText;
      ppLine2: TppLine;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppLine4: TppLine;
      ppLabel42: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppSystemVariable7: TppSystemVariable;
      ppSystemVariable8: TppSystemVariable;
      ppSystemVariable9: TppSystemVariable;
      ppDetailBand4: TppDetailBand;
      ppDBText10: TppDBText;
      ppDBText13: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText26: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppSummaryBand3: TppSummaryBand;
      ppDBCalc8: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppLine1: TppLine;
      ppLine3: TppLine;
      ppLabel49: TppLabel;
      BitBtn3: TBitBtn;
      ppdbInc: TppDBPipeline;
      pprInc: TppReport;
      ppParameterList3: TppParameterList;
      ppdInc: TppDesigner;
      ppHeaderBand5: TppHeaderBand;
      ppLine5: TppLine;
      ppLabel50: TppLabel;
      ppLabel51: TppLabel;
      ppLabel52: TppLabel;
      ppLabel53: TppLabel;
      ppLabel54: TppLabel;
      ppLine6: TppLine;
      ppLabel56: TppLabel;
      ppLabel57: TppLabel;
      ppLabel58: TppLabel;
      ppSystemVariable10: TppSystemVariable;
      ppSystemVariable11: TppSystemVariable;
      ppSystemVariable12: TppSystemVariable;
      ppDBText30: TppDBText;
      ppLabel55: TppLabel;
      ppDetailBand5: TppDetailBand;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppDBText37: TppDBText;
      ppDBText38: TppDBText;
      ppDBText39: TppDBText;
      ppFooterBand3: TppFooterBand;
      ppSummaryBand4: TppSummaryBand;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppLabel59: TppLabel;
      ppDBCalc16: TppDBCalc;
      ppLabel60: TppLabel;
      ppLabel61: TppLabel;
      rgTam: TRadioGroup;
      ppd4: TppDesigner;
      Label1: TLabel;
      BitBtn5: TBitBtn;
      mSQL: TMemo;
      GroupBox1: TGroupBox;
      btnArchivoPs4: TBitBtn;
      Label3: TLabel;
      btnArchivo4ta: TLabel;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
      btnDetallePension: TBitBtn;
      ppParameterList4: TppParameterList;
      ppLine13: TppLine;
      ppLabel22: TppLabel;
      ppLabel63: TppLabel;
      ppLine14: TppLine;
      ppLabel64: TppLabel;
      ppLabel65: TppLabel;
      ppSystemVariable13: TppSystemVariable;
      ppSystemVariable14: TppSystemVariable;
      ppSystemVariable15: TppSystemVariable;
      ppLabel66: TppLabel;
      ppLabel67: TppLabel;
      ppLabel68: TppLabel;
      ppLabel69: TppLabel;
      ppLabel70: TppLabel;
      ppLabel71: TppLabel;
      ppLabel72: TppLabel;
      ppLabel73: TppLabel;
      ppLabel74: TppLabel;
      ppDBText41: TppDBText;
      ppDBText42: TppDBText;
      ppDBText43: TppDBText;
      ppDBText44: TppDBText;
      ppDBText45: TppDBText;
      ppDBText46: TppDBText;
      ppDBText47: TppDBText;
      ppDBText48: TppDBText;
      ppDBText49: TppDBText;
      ppDBText50: TppDBText;
      ppDBText51: TppDBText;
      ppSummaryBand5: TppSummaryBand;
      ppDBCalc18: TppDBCalc;
      ppLabel75: TppLabel;
      ppLine15: TppLine;
    btn4ta: TBitBtn;
   // Inicio HPC_21602_CXP
   // Se agrega savedialog para que usuario escoja destino de archivo a generar
      sdGraba: TSaveDialog;
      bbtnDetVsRes: TBitBtn;
   // Fin HPC_21602_CXP

      Procedure dblcRUCExit(Sender: TObject);
      Procedure dbeAnoMMExit(Sender: TObject);
      Procedure bbtnBorraClick(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure IniciaDatos;
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbeAnoMMKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnImprimeClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure bbtnRecuperarClick(Sender: TObject);
      Function FRound(xReal: DOUBLE; xEnteros, xDecimal: Integer): DOUBLE;
      Procedure BitBtn4Click(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnE4Click(Sender: TObject);
      Procedure bbtnE7Click(Sender: TObject);
      Procedure bbtnE20Click(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure bbtnInconClick(Sender: TObject);
      Function DevuelveNumeros(wCadena: String): String;
      Procedure bbtnResumenClick(Sender: TObject);
      Procedure BitBtn3Click(Sender: TObject);
      Procedure BitBtn5Click(Sender: TObject);
      Procedure btnArchivoPs4Click(Sender: TObject);
      Procedure btn4taClick(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
      Procedure btnDetallePensionClick(Sender: TObject);
      Procedure btnAfpnetClick(Sender: TObject);
   // Inicio HPC_21602_CXP
   // Rutina que define Detalle versus Resumen
      Procedure bbtnDetVsResClick(Sender: TObject);
   // Fin HPC_21602_CXP
   Private
    { Private declarations }
      xTipoProv: String;
      xSelDoc: String;
      xsArchivoPs4: Boolean;
      xsArchivo4ta: Boolean;
      xsArchivoAFPnet: Boolean;
      Procedure fg_GeneraTxtPs4;
      Procedure fg_GeneraTxt4ta;
      Procedure fg_GeneraTxtAFPnet;

   Public
    { Public declarations }
      Function OperClientDataSet(cdsOrigen: TwwClientDataSet; wExpresion, wCondicion: String): Double;
      Function FiltraDocGrid: Boolean;
   End;

Procedure OPTransferenciaPDT; stdcall;

Exports
   OPTransferenciaPDT;

Var
   FTransfPDT: TFTransfPDT;
   wRUCCIA: String;

Implementation

Uses CxPDM;

{$R *.DFM}

Procedure OPTransferenciaPDT;
Var
   xSQL: String;
Begin
   If DMCXP = Nil Then exit;
   If Not DMCXP.DCOM1.Connected Then Exit;
   Try
      FTransfPDT := TFTransfPDT.Create(Application);

      DMCXP.cdsSQL.Close;
      xSQL := 'SELECT CIAID, CIARUC, CIADES FROM TGE101 GROUP BY CIAID, CIARUC, CIADES';
      DMCXP.cdsSQL.ProviderName := 'dspTGE';
      DMCXP.cdsSQL.DataRequest(xSQL);
      DMCXP.cdsSQL.Open;
      FTransfPDT.xTipoProv := '4C';
      If Not FTransfPDT.FiltraDocGrid Then
      Begin
         ShowMessage('No existen Documentos registrados como 4ta. Categoría');
         Exit;
      End;
      FTransfPDT.ShowModal;
   Finally
      FTransfPDT.Free;
   End;
End;

Procedure TFTransfPDT.dblcRUCExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If bbtnBorra.Focused Then exit;
   If length(trimleft(trimright(dblcRUC.Text))) = 0 Then
   Begin
      ShowMessage('Falta indicar RUC de Compañía');
      dblcRUC.SetFocus;
      exit;
   End;
   xSQL := 'select CIAID,CIARUC from TGE101 '
         + ' where CIARUC=' + QuotedStr(dblcRUC.Text);
   DMCXP.cdsQry.Filter := '';
   DMCXP.cdsQry.Filtered := False;
   DMCXP.cdsQry.IndexFieldNames := '';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   DMCXP.cdsQry.First;
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
End;

Procedure TFTransfPDT.dbeAnoMMExit(Sender: TObject);
Var
   xSQL, xSQL1, xSQL2, xSQL3, xNombre, xVar: String;
Begin
   If bbtnBorra.Focused Then Exit;

   If Length(dblcRUC.Text) = 0 Then
   Begin
      ShowMessage('Falta Seleccionar el RUC');
      dblcRUC.SetFocus;
      Exit;
   End;

   If length(dbeAnoMM.Text) = 0 Then
   Begin
      ShowMessage('Falta Ingresar Periodo');
      dbeAnoMM.SetFocus;
      Exit;
   End;

   If length(dbeAnoMM.Text) < 6 Then
   Begin
      ShowMessage('Periodo No Valido');
      dbeAnoMM.SetFocus;
      Exit;
   End;

   If (strtoint(copy(dbeAnoMM.Text, 1, 4)) < 1999) Then
   Begin
      ShowMessage('Año Inválido');
      dbeAnoMM.SetFocus;
      Exit;
   End;

   If (strtoint(copy(dbeAnoMM.Text, 5, 2)) < 0) Or (strtoint(copy(dbeAnoMM.Text, 5, 2)) > 12) Then
   Begin
      ShowMessage('Mes Inválido');
      dbeAnoMM.SetFocus;
      Exit;
   End;
   Screen.Cursor := crHourGlass;

// Inicio HPC_201602_CXP
// DAF_2016000168_CXP_1
// Incluye en reporte la columna de suspención de 4ta.
// Incluye columna de Neto, calculada en base a Monto Total-Retención
   xSQL := 'Select CP.CIAID, CP.CPANOMES, CP.TDIARID, CP.CLAUXID, CP.PROV, '
         + '       CP.CPNOREG, PROVE.PROVRUC, PROVE.PROVDES, '
         + '       NVL( CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.CPGRAVAD ELSE ROUND(CP.CPGRAVAD*CPTCAMPR,2) END,0) + '
         + '       NVL( CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.ADQ_NO_GRAV ELSE ROUND(CP.ADQ_NO_GRAV*CPTCAMPR,2) END,0) MTOTOT, '
         + '       CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.CPIGV ELSE ROUND(CP.CPIGV*CPTCAMPR,2) END RTA4TA, '
         + '       CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.CPISC ELSE ROUND(CP.CPISC*CPTCAMPR,2) END RTAIES, '
         + '       CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.CPGRAVAD ELSE ROUND(CP.CPGRAVAD*CPTCAMPR,2) END GRAVADO, '
         + '       NVL( CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.ADQ_NO_GRAV ELSE ROUND(CP.ADQ_NO_GRAV*CPTCAMPR,2) END,0) NOGRAVADO, '
         + '       CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.CPDCTO ELSE ROUND(CP.CPDCTO*CPTCAMPR,2) END*(-1) DESCUENTO, '
         + '       NVL( CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.CPGRAVAD ELSE ROUND(CP.CPGRAVAD*CPTCAMPR,2) END,0) '
         + '       + NVL( CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.ADQ_NO_GRAV ELSE ROUND(CP.ADQ_NO_GRAV*CPTCAMPR,2) END,0)  '
         + '       - CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.CPIGV ELSE ROUND(CP.CPIGV*CPTCAMPR,2) END '
         + '       - CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.CPISC ELSE ROUND(CP.CPISC*CPTCAMPR,2) END MTONETO, '
         + '       PROVE.PROVAPEPAT, PROVE.PROVAPEMAT, PROVE.PROVNOMBRE, PROVE.PROVNOMBRE1, '
         + '       PROVE.PROVEXONER, CP.DOCID, CP.CPSERIE, CP.CPNODOC, '
         + '       CP.CPFEMIS, CP.TMONID, CP.CPTCAMPR, '
         + '       CP.CPMTOLOC, DOCS.DOCPROV, CP.CPSALLOC, CP.CPESTADO, '
         + '       CP.CP4TAPENSION '
         + '  From CXP301 CP, TGE110 DOCS, TGE201 PROVE '
         + ' Where CP.CPANOMES=' + quotedstr(dbeAnoMM.Text)
         + '   and (CP.DOCID=DOCS.DOCID and DOCS.DOCPROV=' + quotedstr('S') + ')'
         + '   and (CP.CLAUXID=PROVE.CLAUXID and CP.PROV=PROVE.PROV)'
         + '   and CP.CPESTADO in (''P'',''C'') '
         + '   and ' + xSelDoc;
   xSQL := xSQL + ' and CP.CIAID in (' + wRUCCIA + ')';
   If rgSoloPagados.ItemIndex = 1 Then
   Begin
      xSQL := xSQL + ' and CP.CPESTADO=' + quotedstr('C');
   End;
   xSQL := xSQL + ' ORDER BY CP.PROVRUC, CP.CIAID, CP.TDIARID, CP.CPNOREG';
// Fin HPC_201602_CXP

   DMCXP.cdsQry3.filtered := false;
   DMCXP.cdsQry3.filter := '';
   DMCXP.cdsQry3.indexfieldnames := '';
   DMCXP.cdsQry3.Close;
   DMCXP.cdsQry3.ProviderName := 'dspTGE';
   DMCXP.cdsQry3.DataRequest(xSQL);
   DMCXP.cdsQry3.Open;

   mSQL.Text := xSQL;

   DMCXP.cdsQry3.First;
   While Not DMCXP.cdsQry3.EOF Do
   Begin
      DMCXP.cdsQry3.Edit;
      DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString :=
         stringreplace(DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString, ' ', '', [rfreplaceall]);
      DMCXP.cdsQry3.fieldbyname('PROVAPEPAT').AsString := Uppercase(DMCXP.cdsQry3.fieldbyname('PROVAPEPAT').AsString);
      DMCXP.cdsQry3.fieldbyname('PROVAPEMAT').AsString := Uppercase(DMCXP.cdsQry3.fieldbyname('PROVAPEMAT').AsString);
      DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString := Uppercase(DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString);
      DMCXP.cdsQry3.Post;
      DMCXP.cdsQry3.Next;
   End;

   dbgRecibos4ta.Selected.clear;
   dbgRecibos4ta.Selected.Add('CIAID'#9'4'#9'Cía');
   dbgRecibos4ta.Selected.Add('CPANOMES'#9'6'#9'Periodo');
   dbgRecibos4ta.Selected.Add('TDIARID'#9'6'#9'T.Diario');
   dbgRecibos4ta.Selected.Add('CPNOREG'#9'12'#9'Nro.Registro');
   dbgRecibos4ta.Selected.Add('CLAUXID'#9'5'#9'Clase Aux');
   dbgRecibos4ta.Selected.Add('PROV'#9'10'#9'Id Prov.');
   dbgRecibos4ta.Selected.Add('PROVRUC'#9'12'#9'RUC');
   dbgRecibos4ta.Selected.Add('PROVDES'#9'25'#9'Proveedor');
   dbgRecibos4ta.Selected.Add('MTOTOT'#9'15'#9'Mto.Recibo');
   dbgRecibos4ta.Selected.Add('RTA4TA'#9'15'#9'Rta.4ta.');
   dbgRecibos4ta.Selected.Add('RTAIES'#9'15'#9'Rta.IES');
   dbgRecibos4ta.Selected.Add('DESCUENTO'#9'15'#9'Descuento');
   dbgRecibos4ta.Selected.Add('PROVAPEPAT'#9'20'#9'Ap.Paterno');
   dbgRecibos4ta.Selected.Add('PROVAPEMAT'#9'20'#9'Ap.Materno');
   dbgRecibos4ta.Selected.Add('PROVNOMBRE'#9'20'#9'Nombres');
   dbgRecibos4ta.Selected.Add('PROVEXONER'#9'15'#9'No.Exoner.SUNAT');
   dbgRecibos4ta.Selected.Add('DOCID'#9'10'#9'Documento');
   dbgRecibos4ta.Selected.Add('CPSERIE'#9'5'#9'Serie');
   dbgRecibos4ta.Selected.Add('CPNODOC'#9'5'#9'No.Doc');
   dbgRecibos4ta.Selected.Add('CPFEMIS'#9'10'#9'Fec.Emisión');
   dbgRecibos4ta.Selected.Add('TMONID'#9'10'#9'Moneda');
   dbgRecibos4ta.Selected.Add('CPTCAMPR'#9'10'#9'T.Cambio');
   dbgRecibos4ta.Selected.Add('CPMTOLOC'#9'15'#9'Mto.Pagar');
   dbgRecibos4ta.Selected.Add('CPSALLOC'#9'15'#9'Saldo');
// Inicio HPC_201602_CXP
// DAF_2016000282_CXP_1 ajusta cálculo de Totales con columnas correctas
   dbgRecibos4ta.Selected.Add('MTONETO'#9'15'#9'Neto');
   dbgRecibos4ta.Selected.Add('CPESTADO'#9'15'#9'Estado');
   dbgRecibos4ta.Selected.Add('ECFEMICH'#9'11'#9'Fec.Pago');

   TFloatField(DMCXP.cdsQry3.FieldByName('MTOTOT')).DisplayFormat := '###,##0.00';
   TFloatField(DMCXP.cdsQry3.FieldByName('RTA4TA')).DisplayFormat := '###,##0.00';
   TFloatField(DMCXP.cdsQry3.FieldByName('RTAIES')).DisplayFormat := '###,##0.00';
   TFloatField(DMCXP.cdsQry3.FieldByName('CPTCAMPR')).DisplayFormat := '###,##0.00';
   TFloatField(DMCXP.cdsQry3.FieldByName('CPMTOLOC')).DisplayFormat := '###,##0.00';
   TFloatField(DMCXP.cdsQry3.FieldByName('CPSALLOC')).DisplayFormat := '###,##0.00';
// añade Monto Neto a Totales
   TFloatField(DMCXP.cdsQry3.FieldByName('MTONETO')).DisplayFormat := '###,##0.00';
   TFloatField(DMCXP.cdsQry3.FieldByName('CP4TAPENSION')).DisplayFormat := '###,##0.00';

   dbgRecibos4ta.DataSource := DMCXP.dsQry3;

// ajusta cálculo de Totales con columnas correctas
   dbgRecibos4ta.ColumnByName('MTOTOT').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(MTOTOT)', ''), ffNumber, 15, 2);
   dbgRecibos4ta.ColumnByName('RTA4TA').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(RTA4TA)', ''), ffNumber, 15, 2);
   dbgRecibos4ta.ColumnByName('RTAIES').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(RTAIES)', ''), ffNumber, 15, 2);
   dbgRecibos4ta.ColumnByName('DESCUENTO').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(DESCUENTO)', ''), ffNumber, 15, 2);
   dbgRecibos4ta.ColumnByName('CPMTOLOC').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(CPMTOLOC)', ''), ffNumber, 15, 2);
   dbgRecibos4ta.ColumnByName('CPSALLOC').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(CPSALLOC)', ''), ffNumber, 15, 2);
   dbgRecibos4ta.ColumnByName('MTONETO').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(MTONETO)', ''), ffNumber, 15, 2);
// Fin HPC_201602_CXP

   edtNomArch.Text := '0621' + DMCXP.cdsSQL.FieldByName('CIARUC').AsString + dbeAnoMM.Text + '.txt';
   savdlg1.FileName := edtNomArch.Text;
   DMCXP.cdsQry3.First;
   dbgRecibos4ta.SetFocus;
   Screen.Cursor := crDefault;
End;

Procedure TFTransfPDT.bbtnBorraClick(Sender: TObject);
Begin
   IniciaDatos;
   dblcRUC.Setfocus;
End;

Procedure TFTransfPDT.bbtnOkClick(Sender: TObject);
Var
   xLinea: String;
Begin
// verificacion de datos
   DMCXP.cdsQry3.DisableControls;
   DMCXP.cdsQry3.First;
   While Not DMCXP.cdsQry3.EOF Do
   Begin
      If length(trim(DMCXP.cdsQry3.fieldbyname('PROVRUC').AsString)) = 0 Then
      Begin
         ShowMessage('Falta RUC para proveedor ' + DMCXP.cdsQry3.fieldbyname('PROV').AsString
            + chr(13) + ' Registro:' + DMCXP.cdsQry3.fieldbyname('CPNOREG').AsString);
         DMCXP.cdsQry3.EnableControls;
         exit;
      End;
      If length(trim(DMCXP.cdsQry3.fieldbyname('PROVAPEPAT').AsString)) = 0 Then
      Begin
         ShowMessage('Falta APELLIDO PATERNO para proveedor ' + DMCXP.cdsQry3.fieldbyname('PROV').AsString
            + chr(13) + ' Registro:' + DMCXP.cdsQry3.fieldbyname('CPNOREG').AsString);
         DMCXP.cdsQry3.EnableControls;
         exit;
      End;
      If length(trim(DMCXP.cdsQry3.fieldbyname('PROVAPEMAT').AsString)) = 0 Then
      Begin
         ShowMessage('Falta APELLIDO MATERNO para proveedor ' + DMCXP.cdsQry3.fieldbyname('PROV').AsString
            + chr(13) + ' Registro:' + DMCXP.cdsQry3.fieldbyname('CPNOREG').AsString);
         DMCXP.cdsQry3.EnableControls;
         exit;
      End;
      If length(trim(DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString)) = 0 Then
      Begin
         ShowMessage('Falta NOMBRE para proveedor ' + DMCXP.cdsQry3.fieldbyname('PROV').AsString
            + chr(13) + ' Registro:' + DMCXP.cdsQry3.fieldbyname('CPNOREG').AsString);
         DMCXP.cdsQry3.EnableControls;
         exit;
      End;
      DMCXP.cdsQry3.Next;
   End;

   If length(trimleft(trimright(edtNomArch.Text))) = 0 Then
   Begin
      ShowMessage('Falta Archivo Destino');
      edtNomArch.Enabled := True;
      edtNomArch.SetFocus;
      exit;
   End;
   Screen.Cursor := crHourGlass;

   scFILES.Lines.Clear;

   DMCXP.cdsQry3.First;
   While Not DMCXP.cdsQry3.EOF Do
   Begin
      xLinea := '';
      xLinea := DMCXP.cdsQry3.fieldbyname('PROVRUC').AsString; //1
      xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PROVAPEPAT').AsString; // 2
      xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PROVAPEMAT').AsString; // 3
      xLinea := xLinea + '|' + DMCXP.cdsQry3.fieldbyname('PROVNOMBRE').AsString; // 4
      xLinea := xLinea + '|' + copy(DMCXP.cdsQry3.fieldbyname('CPSERIE').AsString, 1, 3); // 5
      xLinea := xLinea + '|' + copy(DMCXP.cdsQry3.fieldbyname('CPNODOC').AsString, 1, 8); // 6
      xLinea := xLinea + '|' + datetostr(DMCXP.cdsQry3.fieldbyname('CPFEMIS').AsDateTime); // 7
      xLinea := xLinea + '|' + FormatFloat('###########0.00', DMCXP.cdsQry3.fieldbyname('MTOTOT').AsFloat); // 8

      If DMCXP.cdsQry3.fieldbyname('RTA4TA').AsFloat > 0 Then
         xLinea := xLinea + '|' + '1'
      Else
         xLinea := xLinea + '|' + '0'; // 9

      xLinea := xLinea + '|' + '10'; // 10

      If DMCXP.cdsQry3.fieldbyname('RTAIES').AsFloat > 0 Then
         xLinea := xLinea + '|' + '1'
      Else
         xLinea := xLinea + '|' + ''; // 11

// aqui agregar número de exoneración
      xLinea := xLinea + '|' + copy(DMCXP.cdsQry3.fieldbyname('PROVEXONER').AsString, 1, 8); //
      xLinea := xLinea + '|'; // 12
      scFILES.Lines.Add(xLinea);
      DMCXP.cdsQry3.Next;
   End;
   Screen.Cursor := crDefault;
   BitBtn2.Click;
   DMCXP.cdsQry3.EnableControls;
   ShowMessage('Transferencia Realizada');
End;

Procedure TFTransfPDT.IniciaDatos;
Begin
   dbgRecibos4ta.DataSource := Nil;
   dblcRUC.Clear;
   edtCia.Clear;
   dbeAnoMM.Clear;
   DMCXP.cdsTDoc.Filter := 'DOCMOD=''CXP'' ';
   DMCXP.cdsTDoc.Filtered := True;
End;

Procedure TFTransfPDT.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFTransfPDT.dbeAnoMMKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then dbeAnoMMExit(Sender);
End;

Procedure TFTransfPDT.bbtnImprimeClick(Sender: TObject);
Var
   x10: Integer;
Begin
   DMCXP.cdsQry3.DisableControls;
   If DMCXP.cdsQry3.RecordCount = 0 Then
   Begin
      ShowMessage('No existe Detalle a Imprimir');
      exit;
   End;
   ppDBReportePDT.DataSource := DMCXP.dsQry3;

   If rgTam.ItemIndex = 0 Then
      ppReportePDT.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ReportePDT.rtm'
   Else
      ppReportePDT.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ReportePDT_A4.rtm';

   ppReportePDT.Template.LoadFromFile;

   If cbDisenoRep.Checked Then
      ppd4.ShowModal
   Else
   Begin
      ppReportePDT.Print;

      ppReportePDT.Stop;

      x10 := Self.ComponentCount - 1;
      While x10 >= 0 Do
      Begin
         If Self.Components[x10].ClassName = 'TppGroup' Then
         Begin
            Self.Components[x10].Free;
         End;
         x10 := x10 - 1;
      End;
      DMCXP.cdsQry3.EnableControls;
      ppDBReportePDT.DataSource := Nil;
   End;
End;

Procedure TFTransfPDT.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMCXP.cdsTDoc.Filtered := False;
   DMCXP.cdsTDoc.Filter := '';
   DMCXP.cdsQry3.close;
   Action := caFree;
End;

Procedure TFTransfPDT.BitBtn1Click(Sender: TObject);
Var
   xSQL, wSQL: String;
   xComprobante: String;
Begin
   If MessageDlg('Se Reemplazará los Registros Guardados Anteriormente ¿Desea Continuar?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCXP.cdsQry3.DisableControls;
      xSQL := 'SELECT * FROM CXP402';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      If DMCXP.cdsQry.RecordCount > 0 Then
      Begin
         xSQL := 'DELETE FROM CXP402';

         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
      DMCXP.cdsQry.Close;

      If DMCXP.cdsQry3.RecordCount > 0 Then
      Begin
         DMCXP.cdsQry3.First;
         While Not DMCXP.cdsQry3.EOF Do
         Begin
            xSQL := ' INSERT INTO CXP402 (CIAID       ,  CPANOMES    ,    TDIARID    , '
                  + '                     CLAUXID     ,  PROV        ,    CPNOREG    , '
                  + '                     PROVRUC     ,  PROVDES     ,    PROVAPEPAT , '
                  + '                     PROVAPEMAT  ,  PROVNOMBRE  ,    PROVEXONER , '
                  + '                     DOCID       ,  CPSERIE     ,    CPNODOC    , '
                  + '                     CPFEMIS     ,  TMONID      ,    CPTCAMPR   , '
                  + '                     MTOTOT      ,  RTA4TA      ,    RTAIES     , '
                  + '                     CPMTOLOC    ,  DOCPROV     ,    CPSALLOC   , '
                  + '                     CPESTADO    )'
                  + ' VALUES (' + QuotedStr(DMCXP.cdsQry3.FieldByName('CIAID').AsString)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('CPANOMES').AsString)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('TDIARID').AsString)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('CLAUXID').AsString)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('PROV').AsString)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('CPNOREG').AsString)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('PROVRUC').AsString)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('PROVDES').AsString)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('PROVAPEPAT').AsString)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('PROVAPEMAT').AsString)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('PROVNOMBRE').AsString)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('PROVEXONER').AsString)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('DOCID').AsString)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('CPSERIE').AsString)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('CPNODOC').AsString)+','
                  +               QuotedStr(FormatDateTime(DMCXP.wFormatFecha, DMCXP.cdsQry3.FieldByName('CPFEMIS').AsDateTime))+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('TMONID').AsString)+','
                  +               FloatToStr(DMCXP.cdsQry3.FieldByName('CPTCAMPR').AsFloat)+','
                  +               FloatToStr(DMCXP.cdsQry3.FieldByName('MTOTOT').AsFloat)+','
                  +               FloatToStr(DMCXP.cdsQry3.FieldByName('RTA4TA').AsFloat)+','
                  +               FloatToStr(DMCXP.cdsQry3.FieldByName('RTAIES').AsFloat)+','
                  +               FloatToStr(DMCXP.cdsQry3.FieldByName('CPMTOLOC').AsFloat)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('DOCPROV').AsString)+','
                  +               FloatToStr(DMCXP.cdsQry3.FieldByName('CPSALLOC').AsFloat)+','
                  +               QuotedStr(DMCXP.cdsQry3.FieldByName('CPESTADO').AsString) + ')';
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
            DMCXP.cdsQry3.Next;
         End;

         If rgSoloPagados.ItemIndex = 0 Then
         Begin
            xComprobante := 'Provisionados';
         End
         Else
         Begin
            If rgSoloPagados.ItemIndex = 0 Then
            Begin
               xComprobante := 'Pagados';
            End;
         End;

         wSQL := ' INSERT INTO CXP402 (CIAID       ,  CPANOMES    ,    TDIARID    , '
                +'                     PROVRUC     ,  PROVDES     ,    PROVAPEPAT , '
                +'                     DOCID)'
                +' VALUES ('+QuotedStr('R')+ ','
                +            QuotedStr(dbeAnoMM.Text) + ','
                +            QuotedStr('99') + ','
                +            QuotedStr(dblcRUC.text) + ',' //PROVRUC
                +            QuotedStr('TD') + ',' //PROVDES = DESCRIP TDIAR
                +            QuotedStr(xComprobante) + ',' //PROVAPEPAT
                +            QuotedStr('X') + ')'; // DOCID
         DMCXP.DCOM1.AppServer.EjecutaSQL(wSQL);

         ShowMessage('Registros Grabados');
      End
      Else
      Begin
         ShowMEssage('No existen registros a insertar');
      End;
      DMCXP.cdsQry3.EnableControls;
   End;
   DMCXP.cdsQry3.EnableControls;
   Screen.Cursor := crDefault;
End;

Procedure TFTransfPDT.bbtnRecuperarClick(Sender: TObject);
Var
   xSQL, xFecha: String;
Begin
   Screen.Cursor := crHourGlass;
   DMCXP.cdsQry3.DisableControls;
   dbgRecibos4ta.DataSource := Nil;
   DMCXP.cdsQry3.Close;

   xSQL := 'SELECT CIAID, CPANOMES, TDIARID, CLAUXID, PROV, CPNOREG, PROVRUC, '
         + '       PROVDES, MTOTOT, RTA4TA, RTAIES, '
         + '       PROVAPEPAT, PROVAPEMAT, PROVNOMBRE, '
         + '       PROVEXONER, DOCID, CPSERIE, CPNODOC, CPFEMIS, TMONID, '
         + '       CPTCAMPR, CPMTOLOC, DOCPROV, CPSALLOC, CPESTADO '
         + '  FROM CXP402 WHERE DOCID<>' + QuotedStr('X') + ' '
         + ' ORDER BY CIAID,TDIARID,CPNOREG';

   DMCXP.cdsQry3.filtered := false;
   DMCXP.cdsQry3.indexfieldnames := '';
   DMCXP.cdsQry3.ProviderName := 'dspTGE';
   DMCXP.cdsQry3.DataRequest(xSQL);
   DMCXP.cdsQry3.Open;

   dbgRecibos4ta.Selected.clear;
   dbgRecibos4ta.Selected.Add('CIAID'#9'4'#9'Cía');
   dbgRecibos4ta.Selected.Add('CPANOMES'#9'6'#9'Periodo');
   dbgRecibos4ta.Selected.Add('TDIARID'#9'6'#9'T.Diario');
   dbgRecibos4ta.Selected.Add('CPNOREG'#9'12'#9'Nro.Registro');
   dbgRecibos4ta.Selected.Add('CLAUXID'#9'5'#9'Clase Aux');
   dbgRecibos4ta.Selected.Add('PROV'#9'10'#9'Id Prov.');
   dbgRecibos4ta.Selected.Add('PROVRUC'#9'12'#9'RUC');
   dbgRecibos4ta.Selected.Add('PROVDES'#9'25'#9'Proveedor');
   dbgRecibos4ta.Selected.Add('MTOTOT'#9'15'#9'Mto.Recibo');
   dbgRecibos4ta.Selected.Add('RTA4TA'#9'15'#9'Rta.4ta.');
   dbgRecibos4ta.Selected.Add('RTAIES'#9'15'#9'Rta.IES');
   dbgRecibos4ta.Selected.Add('PROVAPEPAT'#9'20'#9'Ap.Paterno');
   dbgRecibos4ta.Selected.Add('PROVAPEMAT'#9'20'#9'Ap.Materno');
   dbgRecibos4ta.Selected.Add('PROVNOMBRE'#9'20'#9'Nombres');
   dbgRecibos4ta.Selected.Add('PROVEXONER'#9'15'#9'No.Exoner.SUNAT');
   dbgRecibos4ta.Selected.Add('DOCID'#9'10'#9'Documento');
   dbgRecibos4ta.Selected.Add('CPSERIE'#9'5'#9'Serie');
   dbgRecibos4ta.Selected.Add('CPNODOC'#9'5'#9'No.Doc');
   dbgRecibos4ta.Selected.Add('CPFEMIS'#9'10'#9'Fec.Emisión');
   dbgRecibos4ta.Selected.Add('TMONID'#9'10'#9'Moneda');
   dbgRecibos4ta.Selected.Add('CPTCAMPR'#9'10'#9'T.Cambio');
   dbgRecibos4ta.Selected.Add('CPMTOLOC'#9'15'#9'Mto.Pagar');
   dbgRecibos4ta.Selected.Add('CPSALLOC'#9'15'#9'Saldo');
   dbgRecibos4ta.Selected.Add('CPESTADO'#9'15'#9'Estado');
   dbgRecibos4ta.DataSource := DMCXP.dsQry3;

   DMCXP.cdsQry3.First;
   dbgRecibos4ta.SetFocus;

   dbgRecibos4ta.ColumnByName('MTOTOT').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(MTOTOT)', ''), ffNumber, 15, 2);
   dbgRecibos4ta.ColumnByName('RTA4TA').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(RTA4TA)', ''), ffNumber, 15, 2);
   dbgRecibos4ta.ColumnByName('RTAIES').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(RTAIES)', ''), ffNumber, 15, 2);
   dbgRecibos4ta.ColumnByName('CPMTOLOC').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(RTAIES)', ''), ffNumber, 15, 2);
   dbgRecibos4ta.ColumnByName('CPSALLOC').FooterValue := FloatToStrF(OperClientDataSet(DMCXP.cdsQry3, 'SUM(RTAIES)', ''), ffNumber, 15, 2);

   DMCXP.cdsQry.Close;

   xSQL := 'SELECT CIAID, CPANOMES, TDIARID, CLAUXID, PROV, CPNOREG,'
         + '       PROVRUC, PROVDES, PROVAPEPAT, PROVAPEMAT, PROVNOMBRE,'
         + '       PROVEXONER, DOCID, CPSERIE, CPNODOC, CPFEMIS, TMONID,'
         + '       CPTCAMPR, MTOTOT, RTA4TA, RTAIES, CPMTOLOC, DOCPROV,'
         + '       CPSALLOC, CPESTADO '
         + '  FROM CXP402 '
         + ' WHERE DOCID=' + QuotedStr('X');

   DMCXP.cdsQry.filtered := false;
   DMCXP.cdsQry.indexfieldnames := '';
   DMCXP.cdsQry.ProviderName := 'dspTGE';
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;

   dblcRUC.Text := DMCXP.cdsQry.FieldByName('PROVRUC').AsString;

   dbeAnoMM.Text := DMCXP.cdsQry.FieldByName('CPANOMES').AsString;

   If DMCXP.cdsQry.FieldByName('PROVAPEPAT').AsString = 'Provisionados' Then // Comprobante
   Begin
      rgSoloPagados.ItemIndex := 0;
   End
   Else
   Begin
      rgSoloPagados.ItemIndex := 1;
   End;

   edtNomArch.Text := '0621' + DMCXP.cdsSQL.FieldByName('CIARUC').AsString + dbeAnoMM.Text + '.txt';
   savdlg1.FileName := edtNomArch.Text;

   DMCXP.cdsQry3.EnableControls;
   Screen.Cursor := crDefault;
End;

Function TFTransfPDT.FRound(xReal: DOUBLE; xEnteros, xDecimal: Integer): DOUBLE;
Var
   xNum: String;
   code: Integer;
   xNReal: DOUBLE;
Begin
   xNum := Floattostrf(xReal, ffFixed, xEnteros, xDecimal);
   Val(xNum, xNReal, code);
   Result := xNReal;
End;

Function TFTransfPDT.OperClientDataSet(cdsOrigen: TwwClientDataSet; wExpresion, wCondicion: String): Double;
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

Procedure TFTransfPDT.BitBtn4Click(Sender: TObject);
Var
   x10: Integer;
Begin
   DMCXP.cdsQry3.DisableControls;
   If DMCXP.cdsQry3.RecordCount = 0 Then
   Begin
      ShowMessage('No existe Detalle a Imprimir');
      exit;
   End;
   ppDBReportePDT.DataSource := DMCXP.dsQry3;

   If rgTam.ItemIndex = 0 Then
      pprPDT2.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RepPDT2.rtm'
   Else
      pprPDT2.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RepPDT2_A4.rtm';

   pprPDT2.Template.LoadFromFile;

   If cbDisenoRep.Checked Then
      ppd3.ShowModal
   Else
   Begin
      pprPDT2.Print;

      pprPDT2.Stop;

      x10 := Self.ComponentCount - 1;
      While x10 >= 0 Do
      Begin
         If Self.Components[x10].ClassName = 'TppGroup' Then
         Begin
            Self.Components[x10].Free;
         End;
         x10 := x10 - 1;
      End;
      DMCXP.cdsQry3.EnableControls;
      ppDBReportePDT.DataSource := Nil;
   End;
End;

Procedure TFTransfPDT.FormShow(Sender: TObject);
Var
   xSQL: String;
Begin
   edtNomArch2.TEXT := ExtractFilePath(application.ExeName);
   IniciaDatos;
End;

Function TFTransfPDT.FiltraDocGrid: Boolean;
Var
   xFiltro: String;
Begin
   DMCXP.cdsTDoc.Filtered := False;
   DMCXP.cdsTDoc.Filter := '';

//  xTipoProv  := 'P';  // para Provisiones (facturas, n/Débito)
//  xTipoProv  := 'N';  // para Notas de Crédito
//  xTipoProv  := 'L';  // para Letras
// Inicio HPC_201602_CXP
// DAF_2016000282_CXP_1 reordena alineamiento de sangría
// Fin HPC_201602_CXP
//	 xTipoProv  := 'T';  // para préstamos de terceros
//  xTipoProv  := 'I';  // pera Intermediación
//  xTipoProv  := 'F';  // Facturas del Exterior
//  xTipoProv  := '4C'; // Cuarta Categoria

   xFiltro := '(DOC_FREG=' + QuotedStr(xTipoProv) + ' and DOCMOD=' + QuotedStr('CXP') + ')';

   If xTipoProv = 'P' Then
      xFiltro := '( ( DOC_FREG=''P'' OR DOC_FREG=''F'' ) and DOCMOD=' + QuotedStr('CXP') + ')';

   If xTipoProv = 'N' Then
      xFiltro := xFiltro + ' or (DOCTIPREG=' + QuotedStr('NC') + ' and DOCMOD=' + QuotedStr('CXP') + ')';

   If xTipoProv = 'L' Then
      xFiltro := xFiltro + ' or (DOCTIPREG=' + QuotedStr('LT') + ' and DOCMOD=' + QuotedStr('CXP') + ')';

   If xTipoProv = '4C' Then
      xFiltro := xFiltro + ' or (DOCTIPREG=' + QuotedStr('4C') + ' and DOCMOD=' + QuotedStr('CXP') + ')';

   DMCXP.cdsTDoc.Filter := xFiltro;
   DMCXP.cdsTDoc.Filtered := True;
   xSelDoc := '';
   While Not DMCXP.cdsTDoc.Eof Do
   Begin
      If Length(xSelDoc) = 0 Then
         xSelDoc := '( CP.DOCID=' + '''' + DMCXP.cdsTDoc.FieldByName('DOCID').AsString + ''''
      Else
         xSelDoc := xSelDoc + ' or CP.DOCID=' + '''' + DMCXP.cdsTDoc.FieldByName('DOCID').AsString + '''';
      DMCXP.cdsTDoc.Next;
   End;
   If Length(xSelDoc) = 0 Then
      Raise Exception.Create('No Existen Tipos de Documentos Registrados para Esta Opcion')
   Else
      xSelDoc := xSelDoc + ' ) ';

   Result := True;
End;

Procedure TFTransfPDT.bbtnE4Click(Sender: TObject);
Var
   xLinea, xSQL, fNum, sTel: String;
   nTelf: String;
// Inicio HPC_201602_CXP
// DAF_2016000282_CXP_1 Variable para Nombre de Archivo a Grabar
   xsNombreArchivo : String;
// Fin HPC_201602_CXP
Begin
   xSQL := 'Select * '
// Inicio HPC_201602_CXP
// DAF_2016000282_CXP_1  cambio en validaciónes de Fecha de Nacimiento y Domiciliado
         + '  from (Select CP.CLAUXID, CP.PROV, PROVE.PROVDES, '
         + '               TIPDOCID, PROVDNI, FECNAC, SEXO, nvl(ESDOMIC,''S'') ESDOMIC, PROVE.PROVRUC, '
         + '               TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, TIPZONAID, NOMZONA, REFDOMIC, '
         + '               DPTOID||CIUDID||PROVCZIP UBIGEO '
         + '          From CXP301 CP, TGE110 DOCS, TGE201 PROVE '
         + '         Where CP.CPANOMES=' + quotedstr(dbeAnoMM.Text)
         + '           and (CP.DOCID=DOCS.DOCID and DOCS.DOCPROV=' + quotedstr('S') + ')'
         + '           and (CP.CLAUXID=PROVE.CLAUXID and CP.PROV=PROVE.PROV)'
         + '           and CP.CPESTADO in (''P'',''C'') '
         + '           and ' + xSelDoc
         + '           and CP.CIAID in (' + wRUCCIA + ')'
         + '         Group by CP.CLAUXID, CP.PROV, PROVE.PROVDES, '
         + '                  TIPDOCID, PROVDNI, FECNAC, SEXO, ESDOMIC, PROVE.PROVRUC, '
         + '                  TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, TIPZONAID, NOMZONA, REFDOMIC, '
         + '                  DPTOID||CIUDID||PROVCZIP ) A '
         + ' where TIPDOCID is null '
         + '    or PROVDNI is null '
      //   + '    or FECNAC is null '
         + '    or not SEXO in ( ''F'',''M'' ) '
         + '    or ESDOMIC in null '
         + '    or (nvl(ESDOMIC,''S'')=''S'' and length(PROVRUC)<>11 ) ';
      //   + '    or (nvl(ESDOMIC,''S'')=''N'' and (TIPVIAID is null and NOMVIA is null and TIPZONAID is null '
      //   + '           and NOMZONA is null and nvl(LENGTH(UBIGEO),0)<>6) ) ';
// Fin HPC_201602_CXP
   DMCXP.cdsQry13.filtered := false;
   DMCXP.cdsQry13.indexfieldnames := '';
   DMCXP.cdsQry13.Close;
   DMCXP.cdsQry13.ProviderName := 'dspTGE';
   DMCXP.cdsQry13.DataRequest(xSQL);
   DMCXP.cdsQry13.Open;

   If DMCXP.cdsQry13.RecordCount > 0 Then
   Begin
      ShowMessage('Existen Inconsistencias, Emitir reporte');
      exit;
   End;

// Inicio HPC_201602_CXP
// DAF_2016000282_CXP_1  Asume default 'S' para Domiciliados
   xSQL := 'Select CP.CLAUXID, CP.PROV, PROVE.PROVRUC, PROVE.PROVDES, '
         + '       PROVE.PROVAPEPAT, PROVE.PROVAPEMAT, PROVE.PROVNOMBRE, PROVE.PROVNOMBRE1, '
         + '       TIPDOCID, PROVDNI, FECNAC, '
         + '       SEXO, PROVE.PAISID, PA.CODSUNAT, PROVTELF, PROVEMAI, ''0'' ESSALUD, nvl(ESDOMIC,''S'') ESDOMIC, '
         + '       TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, TIPZONAID, NOMZONA, REFDOMIC, '
         + '       DPTOID||CIUDID||PROVCZIP UBIGEO, '
         + '       CASE WHEN SEXO=''M'' THEN ''1'' WHEN SEXO=''F'' THEN ''2'' ELSE '' '' END SEXO2, '
         + '       CASE WHEN nvl(ESDOMIC,''S'')=''S'' THEN ''1'' WHEN ESDOMIC=''N'' THEN ''2'' ELSE ''1'' END ESDOMIC2 '
         + '  From CXP301 CP, TGE110 DOCS, TGE201 PROVE, TGE118 PA '
         + ' where CP.CPANOMES=' + quotedstr(dbeAnoMM.Text)
         + '   and (CP.DOCID=DOCS.DOCID and DOCS.DOCPROV=' + quotedstr('S') + ')'
         + '   and (CP.CLAUXID=PROVE.CLAUXID and CP.PROV=PROVE.PROV)'
         + '   and CP.CPESTADO in (''P'',''C'') '
         + '   and PROVE.PAISID=PA.PAISID(+) '
         + '   and ' + xSelDoc
         + '   and CP.CIAID in (' + wRUCCIA + ')';
   If rgSoloPagados.ItemIndex = 1 Then
   Begin
      xSQL := xSQL + ' and CP.CPESTADO=' + quotedstr('C');
   End;
   xSQL := xSQL
         + ' Group by CP.CLAUXID, CP.PROV, PROVE.PROVRUC, PROVE.PROVDES, '
         + '          PROVE.PROVAPEPAT, PROVE.PROVAPEMAT, PROVE.PROVNOMBRE, PROVE.PROVNOMBRE1, '
         + '          TIPDOCID, PROVDNI, FECNAC, '
         + '          SEXO, PROVE.PAISID, PA.CODSUNAT, PROVTELF, PROVEMAI, ESDOMIC, '
         + '          TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, TIPZONAID, NOMZONA, REFDOMIC, '
         + '          DPTOID||CIUDID||PROVCZIP, '
         + '          CASE WHEN SEXO=''M'' THEN ''1'' WHEN SEXO=''F'' THEN ''2'' ELSE '' '' END, '
         + '          CASE WHEN ESDOMIC=''S'' THEN ''1'' WHEN ESDOMIC=''N'' THEN ''2'' ELSE ''1'' END '
         + ' order by PROVE.PROVAPEPAT, PROVE.PROVAPEMAT, PROVE.PROVNOMBRE, PROVE.PROVNOMBRE1';
// Fin HPC_201602_CXP

   DMCXP.cdsQry13.filtered := false;
   DMCXP.cdsQry13.indexfieldnames := '';
   DMCXP.cdsQry13.Close;
   DMCXP.cdsQry13.ProviderName := 'dspTGE';
   DMCXP.cdsQry13.DataRequest(xSQL);
   DMCXP.cdsQry13.Open;
   DMCXP.cdsQry13.First;
   While Not DMCXP.cdsQry13.EOF Do
   Begin
      DMCXP.cdsQry13.Edit;
      DMCXP.cdsQry13.fieldbyname('PROVNOMBRE').AsString :=
         stringreplace(DMCXP.cdsQry13.fieldbyname('PROVNOMBRE').AsString, ' ', '', [rfreplaceall]);
      DMCXP.cdsQry13.fieldbyname('PROVAPEPAT').AsString := Uppercase(DMCXP.cdsQry13.fieldbyname('PROVAPEPAT').AsString);
      DMCXP.cdsQry13.fieldbyname('PROVAPEMAT').AsString := Uppercase(DMCXP.cdsQry13.fieldbyname('PROVAPEMAT').AsString);
      DMCXP.cdsQry13.fieldbyname('PROVNOMBRE').AsString := Uppercase(DMCXP.cdsQry13.fieldbyname('PROVNOMBRE').AsString);
      DMCXP.cdsQry13.Post;
      DMCXP.cdsQry13.Next;
   End;

   Screen.Cursor := crDefault;
// verificacion de datos
   DMCXP.cdsQry13.First;
   While Not DMCXP.cdsQry13.EOF Do
   Begin
      If length(trim(DMCXP.cdsQry13.fieldbyname('PROVAPEPAT').AsString)) = 0 Then
      Begin
         ShowMessage('Falta APELLIDO PATERNO para proveedor ' + DMCXP.cdsQry13.fieldbyname('PROV').AsString
            + chr(13));
         DMCXP.cdsQry13.EnableControls;
         exit;
      End;
      If length(trim(DMCXP.cdsQry13.fieldbyname('PROVAPEMAT').AsString)) = 0 Then
      Begin
         ShowMessage('Falta APELLIDO MATERNO para proveedor ' + DMCXP.cdsQry13.fieldbyname('PROV').AsString
            + chr(13));
         DMCXP.cdsQry13.EnableControls;
         exit;
      End;
      If length(trim(DMCXP.cdsQry13.fieldbyname('PROVNOMBRE').AsString)) = 0 Then
      Begin
         ShowMessage('Falta NOMBRE para proveedor ' + DMCXP.cdsQry13.fieldbyname('PROV').AsString
            + chr(13));
         DMCXP.cdsQry13.EnableControls;
         exit;
      End;
      DMCXP.cdsQry13.Next;
   End;

   If xsArchivoPs4 = True Then
   Begin
      fg_GeneraTxtPs4;
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   scFILES.Lines.Clear;

   DMCXP.cdsQry13.First;
   While Not DMCXP.cdsQry13.EOF Do
   Begin
      xLinea := '';
      xLinea := DMCXP.cdsQry13.fieldbyname('TIPDOCID').AsString; // 1
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('PROVDNI').AsString; // 2
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('PROVAPEPAT').AsString; // 3
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('PROVAPEMAT').AsString; // 4
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('PROVNOMBRE').AsString; // 5
      If DMCXP.cdsQry13.fieldbyname('PROVNOMBRE1').AsString <> '' Then
         xLinea := xLinea + ' ' + DMCXP.cdsQry13.fieldbyname('PROVNOMBRE1').AsString; // 5
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('FECNAC').AsString; // 5
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('SEXO2').AsString; // 5
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('CODSUNAT').AsString; // 5

      Try
         nTelf := DevuelveNumeros(DMCXP.cdsQry13.fieldbyname('PROVTELF').AsString);
         If length(nTelf) = 0 Then
            xLinea := xLinea + '|'
         Else
         Begin
            If StrToFloat(nTelf) > 100000 Then
               xLinea := xLinea + '|' + nTelf
            Else
               xLinea := xLinea + '|'; // 5
         End;
      Except
         xLinea := xLinea + '|'; // 5
      End;

      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('PROVEMAI').AsString; // 5
      xLinea := xLinea + '|0'; // 5
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('ESDOMIC2').AsString; // 5

      If DMCXP.cdsQry13.fieldbyname('TIPDOCID').AsString = '01' Then
      Begin
         xLinea := xLinea + '|';
         xLinea := xLinea + '|';
         xLinea := xLinea + '|';
         xLinea := xLinea + '|';
         xLinea := xLinea + '|';
         xLinea := xLinea + '|';
         xLinea := xLinea + '|';
         xLinea := xLinea + '|';
      End
      Else
      Begin
         xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('TIPVIAID').AsString; // 5
         xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('NOMVIA').AsString; // 5
         xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('NUMDOMIC').AsString; // 5
         xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('INTDOMIC').AsString; // 5
         xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('TIPZONAID').AsString; // 5
         xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('NOMZONA').AsString; // 5
         xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('REFDOMIC').AsString; // 5
         xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('UBIGEO').AsString; // 5
      End;
      xLinea := xLinea + '|'; // 12
      scFILES.Lines.Add(xLinea);
      DMCXP.cdsQry13.Next;
   End;
// Inicio HPC_201602_CXP
// DAF_2016000282_CXP_1 Pide Ruta para Grabar Archivos
   xsNombreArchivo := edtNomArch2.Text + DMCXP.cdsSQL.FieldByName('CIARUC').AsString + '.t00';
   sdGraba.FileName := xsNombreArchivo;
   If Not sdGraba.Execute Then
   Begin
      Screen.Cursor := crDefault;
      Exit;
   End;
   scFILES.Lines.SaveToFile(xsNombreArchivo);
//   scFILES.Lines.SaveToFile(edtNomArch2.Text + DMCXP.cdsSQL.FieldByName('CIARUC').AsString + '.t00');
// Fin HPC_201602_CXP
   Screen.Cursor := crDefault;
   ShowMessage('Transferencia Realizada');
End;

Procedure TFTransfPDT.bbtnE7Click(Sender: TObject);
Var
   xLinea, xSQL: String;
Begin
   xSQL := 'Select * '
         + '  from (Select CP.CLAUXID, CP.PROV, PROVE.PROVDES, '
         + '               TIPDOCID, PROVDNI, FECNAC, SEXO, ESDOMIC, PROVE.PROVRUC, '
         + '               TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, TIPZONAID, NOMZONA, REFDOMIC, '
         + '               DPTOID||CIUDID||PROVCZIP UBIGEO '
         + '          From CXP301 CP, TGE110 DOCS, TGE201 PROVE '
         + '         where CP.CPANOMES=' + quotedstr(dbeAnoMM.Text)
         + '           and (CP.DOCID=DOCS.DOCID and DOCS.DOCPROV=' + quotedstr('S') + ')'
         + '           and (CP.CLAUXID=PROVE.CLAUXID and CP.PROV=PROVE.PROV)'
         + '           and CP.CPESTADO in (''P'',''C'') '
         + '           and ' + xSelDoc
         + '           and CP.CIAID in (' + wRUCCIA + ')'
         + '         Group by CP.CLAUXID, CP.PROV, PROVE.PROVDES, '
         + '                  TIPDOCID, PROVDNI, FECNAC, SEXO, ESDOMIC, PROVE.PROVRUC, '
         + '                  TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, TIPZONAID, NOMZONA, REFDOMIC, '
         + '                  DPTOID||CIUDID||PROVCZIP ) A '
         + ' where TIPDOCID is null '
         + '    or PROVDNI is null '
      // Inicio HPC_201602_CXP
      // DAF_2016000282_CXP_1 retira validación de Fecha de Nacimiento
      //   + '    or FECNAC is null '
      // Fin HPC_201602_CXP
         + '    or not SEXO in ( ''F'',''M'' ) '
         + '    or ESDOMIC in null '
         + '    or (ESDOMIC=''S'' and LENGTH(PROVRUC)<>11 ) '
         + '    or (nvl(ESDOMIC,''N'')=''N'' and (TIPVIAID is null and NOMVIA is null and TIPZONAID IS NULL '
         + '              and NOMZONA is null and nvl(length(UBIGEO),0)<>6) ) ';
   DMCXP.cdsQry13.filtered := false;
   DMCXP.cdsQry13.indexfieldnames := '';
   DMCXP.cdsQry13.Close;
   DMCXP.cdsQry13.ProviderName := 'dspTGE';
   DMCXP.cdsQry13.DataRequest(xSQL);
   DMCXP.cdsQry13.Open;

   If DMCXP.cdsQry13.RecordCount > 0 Then
   Begin
      ShowMessage('Existen Inconsistencias, Emitir reporte');
      exit;
   End;

   xSQL := 'Select CP.CLAUXID, CP.PROV, PROVE.PROVRUC, PROVE.PROVDES, TIPDOCID, PROVDNI, CONVDOBTRI  '
         + '  From CXP301 CP, TGE110 DOCS, TGE201 PROVE WHERE'
         + '       CP.CPANOMES=' + quotedstr(dbeAnoMM.Text)
         + '   and (CP.DOCID=DOCS.DOCID and DOCS.DOCPROV=' + quotedstr('S') + ')'
         + '   and (CP.CLAUXID=PROVE.CLAUXID and CP.PROV=PROVE.PROV)'
         + '   and CP.CPESTADO in (''P'',''C'') '
         + '   and ' + xSelDoc
         + '   and CP.CIAID in (' + wRUCCIA + ')';

   If rgSoloPagados.ItemIndex = 1 Then
   Begin
      xSQL := xSQL + ' and CP.CPESTADO=' + quotedstr('C');
   End;
   xSQL := xSQL + ' Group by CP.CLAUXID, CP.PROV, PROVE.PROVRUC, PROVE.PROVDES, TIPDOCID, PROVDNI, CONVDOBTRI ';
   xSQL := xSQL + 'ORDER BY PROVE.PROVRUC';

   DMCXP.cdsQry13.filtered := false;
   DMCXP.cdsQry13.indexfieldnames := '';
   DMCXP.cdsQry13.Close;
   DMCXP.cdsQry13.ProviderName := 'dspTGE';
   DMCXP.cdsQry13.DataRequest(xSQL);
   DMCXP.cdsQry13.Open;

   Screen.Cursor := crDefault;
// verificacion de datos
   DMCXP.cdsQry13.First;
   While Not DMCXP.cdsQry13.EOF Do
   Begin
      DMCXP.cdsQry13.Next;
   End;

   Screen.Cursor := crHourGlass;
   scFILES.Lines.Clear;

   DMCXP.cdsQry13.First;
   While Not DMCXP.cdsQry13.EOF Do
   Begin
      xLinea := '';
      xLinea := DMCXP.cdsQry13.fieldbyname('TIPDOCID').AsString; // 1
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('PROVDNI').AsString; // 2
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('PROVRUC').AsString; // 3
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('CONVDOBTRI').AsString; // 4
      xLinea := xLinea + '|'; // 12
      scFILES.Lines.Add(xLinea);
      DMCXP.cdsQry13.Next;
   End;
   scFILES.Lines.SaveToFile(edtNomArch2.Text + DMCXP.cdsSQL.FieldByName('CIARUC').AsString + '.t03');
   Screen.Cursor := crDefault;
   ShowMessage('Transferencia Realizada');
End;

Procedure TFTransfPDT.bbtnE20Click(Sender: TObject);
Var
   xSQL, xLinea: String;
// Inicio HPC_201602_CXP
// DAF_2016000282_CXP_1 Variable para Nombre de Archivo a Grabar
   xsNombreArchivo : String;
// Fin HPC_201602_CXP
Begin
// inconsistencias
   xSQL := 'Select * '
      // Inicio HPC_201602_CXP
      // DAF_2016000282_CXP_1 retira validación de Fecha de Nacimiento, default EsDomiciliado
         + '  from (Select CP.CLAUXID, CP.PROV, PROVE.PROVDES, '
         + '               TIPDOCID, PROVDNI, FECNAC, SEXO, nvl(ESDOMIC,''S'') ESDOMIC, PROVE.PROVRUC, '
         + '               TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, TIPZONAID, NOMZONA, REFDOMIC, '
         + '               DPTOID||CIUDID||PROVCZIP UBIGEO '
         + '          From CXP301 CP, TGE110 DOCS, TGE201 PROVE '
         + '         where CP.CPANOMES=' + quotedstr(dbeAnoMM.Text)
         + '           and (CP.DOCID=DOCS.DOCID and DOCS.DOCPROV=' + quotedstr('S') + ')'
         + '           and (CP.CLAUXID=PROVE.CLAUXID and CP.PROV=PROVE.PROV)'
         + '           and CP.CPESTADO in (''P'',''C'') '
         + '           and ' + xSelDoc
         + '           and CP.CIAID in (' + wRUCCIA + ')'
         + '         Group by CP.CLAUXID, CP.PROV, PROVE.PROVDES, '
         + '                  TIPDOCID, PROVDNI, FECNAC, SEXO, ESDOMIC, PROVE.PROVRUC, '
         + '                  TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, TIPZONAID, NOMZONA, REFDOMIC, '
         + '                  DPTOID||CIUDID||PROVCZIP ) A '
         + ' where TIPDOCID is null '
         + '    or PROVDNI is null '
      //   + '    or FECNAC is null '
         + '    or not SEXO IN ( ''F'',''M'' ) '
      //   + '    or ESDOMIC in null '
         + '    or ( nvl(ESDOMIC,''S'')=''S'' AND LENGTH(PROVRUC)<>11 ) ';
      //   + '    or (  nvl(ESDOMIC,''N'')=''N'' and ( TIPVIAID IS NULL and NOMVIA IS NULL and TIPZONAID IS NULL '
      //   + '              and NOMZONA IS NULL and nvl(LENGTH(UBIGEO),0)<>6) ) ';
      // Fin HPC_201602_CXP

   DMCXP.cdsQry13.filtered := false;
   DMCXP.cdsQry13.indexfieldnames := '';
   DMCXP.cdsQry13.Close;
   DMCXP.cdsQry13.ProviderName := 'dspTGE';
   DMCXP.cdsQry13.DataRequest(xSQL);
   DMCXP.cdsQry13.Open;

   If DMCXP.cdsQry13.RecordCount > 0 Then
   Begin
      ShowMessage('Existen Inconsistencias, Emitir reporte');
      exit;
   End;

// Inicio HPC_201602_CXP
// DAF_2016000282_CXP_1 Asume default 'S' para Domiciliados
// DAF_2016000282_CXP_1 Debido a Recibos Electrónicos, se mantiene la Serie tal como se provisionó
   xSQL := 'Select TIPDOCID,CP.PROVRUC, PROVDNI, CP.DOCID, '
//         + '       CASE WHEN CP.DOCID=''02'' THEN SUBSTR(CPSERIE, LENGTH(CPSERIE)-2,3)  WHEN CP.DOCID=''34'' THEN NULL ELSE NULL END CPSERIE, '
         + '       CASE WHEN CP.DOCID=''02'' THEN CPSERIE WHEN CP.DOCID=''34'' THEN NULL ELSE NULL END CPSERIE, '
         + '       CASE WHEN CP.DOCID=''02'' THEN CP.CPNODOC  WHEN CP.DOCID=''34'' THEN NULL ELSE NULL END CPNODOC, '
         + '       nvl( CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.CPGRAVAD ELSE ROUND(CP.CPGRAVAD*CPTCAMPR,2) END, 0 ) + '
         + '       nvl( CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.ADQ_NO_GRAV ELSE ROUND(CP.ADQ_NO_GRAV*CPTCAMPR,2) END, 0 ) MTOTOT, '
         + '       CASE WHEN CP.DOCID=''02'' THEN TO_DATE(CP.CPFEMIS)  WHEN CP.DOCID=''34'' THEN TO_DATE(CP.CPFEMIS) ELSE NULL END CPFEMIS, '
         + '       CASE WHEN CP.DOCID=''02'' THEN TO_DATE(CP.CPFCMPRB) WHEN CP.DOCID=''34'' THEN TO_DATE(CP.CPFCMPRB) ELSE NULL END FECPAG, '
         + '       CASE WHEN NVL(CP.CPIGV,0)>0 THEN ''1'' ELSE ''0'' END INDICADOR, '
         + '       CASE WHEN CP.DOCID=''02'' THEN ''R'' WHEN CP.DOCID=''34'' THEN ''D'' ELSE '' '' END DOCSUNAT, '
         + '       CASE WHEN nvl(ESDOMIC,''S'')=''S'' THEN ''1'' WHEN ESDOMIC=''N'' THEN ''2'' ELSE '' '' END ESDOMIC2 '
         + '  From CXP301 CP, TGE110 DOCS, TGE201 PROVE ' //, CAJA303 CA, CAJA302 CC '
         + ' where CP.CPANOMES=' + quotedstr(dbeAnoMM.Text)
         + '   and (CP.DOCID=DOCS.DOCID and DOCS.DOCPROV=' + quotedstr('S') + ')'
         + '   and (CP.CLAUXID=PROVE.CLAUXID and CP.PROV=PROVE.PROV)'
         + '   and CP.CPESTADO in (''P'',''C'') '
         + '   and ' + xSelDoc
         + '   and CP.CIAID in (' + wRUCCIA + ')';
// Fin HPC_201602_CXP
   If rgSoloPagados.ItemIndex = 1 Then
   Begin
      xSQL := xSQL + ' and CP.CPESTADO=' + quotedstr('C');
   End;
   xSQL := xSQL + ' ORDER BY CP.PROVRUC, CP.CIAID, CP.TDIARID, CP.CPNOREG';

   DMCXP.cdsQry13.filtered := false;
   DMCXP.cdsQry13.indexfieldnames := '';
   DMCXP.cdsQry13.Close;
   DMCXP.cdsQry13.ProviderName := 'dspTGE';
   DMCXP.cdsQry13.DataRequest(xSQL);
   DMCXP.cdsQry13.Open;

   If xsArchivo4ta = True Then
   Begin
      fg_GeneraTxt4ta;
      Exit;
   End;

   scFILES.Lines.Clear;

   Screen.Cursor := crHourGlass;
   DMCXP.cdsQry13.First;
   While Not DMCXP.cdsQry13.EOF Do
   Begin
      xLinea := '';
      xLinea := DMCXP.cdsQry13.fieldbyname('TIPDOCID').AsString; // 1
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('PROVDNI').AsString; // 2
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('DOCSUNAT').AsString; // 3
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('CPSERIE').AsString; // 4
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('CPNODOC').AsString; // 5
      xLinea := xLinea + '|' + FormatFloat('######0.00', DMCXP.cdsQry13.fieldbyname('MTOTOT').AsFloat); // 6
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('CPFEMIS').AsString; // 7
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('FECPAG').AsString; // 8
      xLinea := xLinea + '|' + DMCXP.cdsQry13.fieldbyname('INDICADOR').AsString; // 9
      xLinea := xLinea + '|'; // 12
      scFILES.Lines.Add(xLinea);
      DMCXP.cdsQry13.Next;
   End;
   ShowMessage(xSQL);
// Inicio HPC_201602_CXP
// DAF_2016000282_CXP_1 Pide Ruta para Grabar Archivos
   xsNombreArchivo := edtNomArch2.Text + '0601' + dbeAnoMM.Text + DMCXP.cdsSQL.FieldByName('CIARUC').AsString + '.4ta';
   sdGraba.FileName := xsNombreArchivo;
   If Not sdGraba.Execute Then
   Begin
      Screen.Cursor := crDefault;
      Exit;
   End;
   scFILES.Lines.SaveToFile(xsNombreArchivo);
// Fin HPC_201602_CXP
   Screen.Cursor := crDefault;
   ShowMessage('Transferencia Realizada');
End;

Procedure TFTransfPDT.BitBtn2Click(Sender: TObject);
Begin
   If savdlg1.Execute Then
   Begin
      edtNomArch.Text := savdlg1.FileName;
      scFILES.Lines.SaveToFile(edtNomArch.Text);
   End;
End;

Procedure TFTransfPDT.bbtnInconClick(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select * '
      // Inicio HPC_201602_CXP
      // DAF_2016000282_CXP_1 retira validación de Fecha de Nacimiento
         + '  from (Select CP.CLAUXID, CP.PROV, PROVE.PROVDES, '
         + '               TIPDOCID, PROVDNI, FECNAC, SEXO, nvl(ESDOMIC,''S'') ESDOMIC, PROVE.PROVRUC, '
         + '               TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, TIPZONAID, NOMZONA, REFDOMIC, '
         + '               DPTOID||CIUDID||PROVCZIP UBIGEO, PAISID, '
         + '               CP.CPANOMES, '
         + '               case when TIPDOCID is null then ''X'' end OB1, ' // Falta Tip.Doc
         + '               case when PROVDNI is null  then ''X'' end OB2, ' // Falta Nro.Doc
      //   + '               case when FECNAC is null  then ''X'' end OB3, ' // Falta Fecha Nac
         + '               '' '' OB3, '
         + '               case when NOT SEXO IN ( ''F'',''M'' )  then ''X'' end OB4, ' // Falta Sexo
         + '               case when ESDOMIC in null  then ''X'' end OB5, ' // Falta Indicar si es o no Domiciliado
         + '               case when PAISID is null  then ''X'' end OB6, ' // Falta País
         + '               case when (nvl(ESDOMIC,''S'')=''S'' AND LENGTH(PROVE.PROVRUC)<>11 ) ' //
         + '                    then ''X'' end OB7, ' // Si es Domiciliado debe tener RUC
      //   + '               case when (nvl(ESDOMIC,''S'')=''S'' and ( TIPVIAID IS NULL OR NOMVIA IS NULL OR TIPZONAID IS NULL '
      //   + '                        OR NOMZONA IS NULL OR nvl(LENGTH(DPTOID||CIUDID||PROVCZIP),0)<>6) ) '
      //   + '                    then ''X'' ' // Si es Domiciliado debe tener domicilio
      //   + '               end OB8 '
         + '               '' '' OB8 '
      // Fin HPC_201602_CXP
         + '          From CXP301 CP, TGE110 DOCS, TGE201 PROVE ' //, CAJA303 B, CAJA302 C '
         + '         WHERE CP.CPANOMES=' + quotedstr(dbeAnoMM.Text)
         + '           and (CP.DOCID=DOCS.DOCID and DOCS.DOCPROV=' + quotedstr('S') + ')'
         + '           and (CP.CLAUXID=PROVE.CLAUXID and CP.PROV=PROVE.PROV)'
         + '           and CP.CPESTADO in (''P'',''C'') '
         + '           and ' + xSelDoc
         + '           and CP.CIAID in (' + wRUCCIA + ')';
   If rgSoloPagados.ItemIndex = 1 Then
   Begin
      xSQL := xSQL + ' and CP.CPESTADO=' + quotedstr('C');
   End;

   xSQL := xSQL + ' Group by PROVE.TIPPERID,DOCS.DOCID,PROVE.SNPAFPID,PROVE.TIPCOMAFPID,CP.CLAUXID, CP.PROV, PROVE.PROVDES, '
                + '          TIPDOCID, PROVDNI, FECNAC, SEXO, ESDOMIC, PROVE.PROVRUC, '
                + '          TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, TIPZONAID, NOMZONA, REFDOMIC, '
                + '          DPTOID||CIUDID||PROVCZIP, PAISID, CP.CPANOMES ) A ';
// Inicio HPC_201602_CXP
   // DAF_2016000282_CXP_1 Imprime sólo los que tienen Observación
   {
   xSQL := xSQL + ' WHERE TIPDOCID is null or PROVDNI is not null or FECNAC is null '
                + '    or NOT SEXO IN ( ''F'',''M'' ) or ESDOMIC in null or PAISID is null '
                + '    or ( ESDOMIC=''S'' AND LENGTH(PROVRUC)<>11 ) '
                + '    or (  nvl(ESDOMIC,''N'')=''N'' '
                + '           and ( TIPVIAID IS NULL and NOMVIA IS NULL and TIPZONAID IS NULL '
                + '           and NOMZONA IS NULL and nvl(LENGTH(UBIGEO),0)<>6) ) ';
        //      + '    OR (A.SNPAFPID IS NULL OR A.TIPCOMAFPID IS NULL) AND NOT A.OB9 IS NULL ';
   }
   xSQL := xSQL + ' Where OB1=''X'' or OB2=''X'' or OB3=''X'' or OB4=''X'' or OB5=''X'' '
                + '    or OB6=''X'' or OB7=''X'' or OB8=''X'' ';
// Fin HPC_201602_CXP
   DMCXP.cdsQry13.filtered := false;
   DMCXP.cdsQry13.indexfieldnames := '';
   DMCXP.cdsQry13.Close;
   DMCXP.cdsQry13.ProviderName := 'dspTGE';
   DMCXP.cdsQry13.DataRequest(xSQL);
   DMCXP.cdsQry13.Open;

   DMCXP.cdsQry13.DisableControls;
   If DMCXP.cdsQry13.RecordCount = 0 Then
   Begin
      ShowMessage('No existe Detalle a Imprimir');
      exit;
   End;
   ppdb2.DataSource := DMCXP.dsQry13;
   ppr2.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\Inconsistencia4ta.rtm';
   ppr2.Template.LoadFromFile;

   If cbDisenoRep.Checked Then
      ppd2.ShowModal
   Else
   Begin
      ppr2.Print;
      ppr2.Stop;
      ppdb2.DataSource := Nil;
   End;
End;

Function TFTransfPDT.DevuelveNumeros(wCadena: String): String;
Var
   I: integer;
   xResult: String;
Begin
   xResult := '';
   wCadena := trimleft(trimright(wCadena));
   If length(wCadena) > 0 Then
   Begin
      For I := 1 To Length(Trim(wCadena)) Do
      Begin
         If (Copy(wCadena, I, 1) = '1') Or (Copy(wCadena, I, 1) = '2') Or (Copy(wCadena, I, 1) = '3')
            Or (Copy(wCadena, I, 1) = '4') Or (Copy(wCadena, I, 1) = '5') Or (Copy(wCadena, I, 1) = '6')
            Or (Copy(wCadena, I, 1) = '7') Or (Copy(wCadena, I, 1) = '8') Or (Copy(wCadena, I, 1) = '9')
            Or (Copy(wCadena, I, 1) = '0') Then
            xResult := xResult + Copy(wCadena, I, 1);
      End
   End
   Else
      xResult := '';

   Result := xResult;

End;

Procedure TFTransfPDT.bbtnResumenClick(Sender: TObject);
Var
   xSQL, xSQL1, xSQL2, xSQL3, xSQL4, xSQL5, xSQL6, xSQL7: String;
   x10: Integer;
Begin
// Inicio HPC_201602_CXP
// DAF_2016000282_CXP_1 Modifica script que genera Resumen de Pago por Cía
   xSQL1 := 'Select A.CIAID, B.CIADES, count(1) TOTREG, sum(CPGRAVAD) GRAVADO, '
          + '       sum(ADQ_NO_GRAV) NO_GRAVADO, sum(CP4TA) RENTA_4TA, sum(APORTEONP) APORTEONP, '
          + '       sum(APORTEAFP) APORTEAFP, sum(COMISION) COMISION, sum(SEGURO) SEGURO, '
          + '       (sum(APORTEONP)+sum(APORTEAFP)+sum(COMISION)+sum(SEGURO)) CP4TAPENSION, '
          + '       sum(CPGRAVAD) + sum(ADQ_NO_GRAV)+sum(CP4TA) NETOSUNAT, '
          + '       sum(CPMTOLOC) TOTAL, ' + quotedstr(dbeAnoMM.Text) + ' PERIODO '
          + '  from ( ';

   xSQL2 := 'Select CXP301.CIAID, CXP301.CPANOMES, CXP301.TDIARID, CXP301.CPNOREG, CXP301.CLAUXID, '
          + '       CXP301.PROV, CXP301.DOCID, CXP301.CPSERIE, CXP301.CPNODOC, CXP301.CPFEMIS, '
          + '       CXP301.TMONID, CXP301.CPTCAMPR, CXP301.CPESTADO, CXP301.CP_CONTA, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPGRAVAD,0.00) end CPGRAVAD, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPIGV,0.00) end CPIGV, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPGRAVAD2,0.00) end CPGRAVAD2, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPIGV2,0.00) end CPIGV2, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPNOGRAV,0.00) end CPNOGRAV, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.IGV_GRA_NO_DEST,0.00) end IGV_GRA_NO_DEST, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.ADQ_NO_GRAV,0.00) end ADQ_NO_GRAV, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CP_OTROS,0.00) end CP_OTROS, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPDCTO,0.00) end CPDCTO, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPISC,0.00) end CPISC, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CPSERVIC,0.00) end CPSERVIC, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.CP4TA,0.00) end CP4TA, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.APORTEONP,0.00) end APORTEONP, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.APORTEAFP,0.00) end APORTEAFP, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.COMISION,0.00) end COMISION, '
          + '       case when CPESTADO=''A'' or CPESTADO=''E'' then 0.00 else nvl(A.SEGURO,0.00) end SEGURO, '
          + '       DECODE( CPESTADO,''A'',0, DECODE( CPESTADO,''E'',0, ROUND( NVL( A.CPMTOORI, 0) * DECODE(trim(CXP301.TMONID),''N'', 1, CPTCAMPR) * DECODE(DOCRESTA,''S'', -1, 1 ), 2 ) )) CPMTOORI, '
          + '       DECODE( CPESTADO,''A'',0, DECODE( CPESTADO,''E'',0, DECODE( ''N'', ''N'', NVL( A.CPMTOLOC,0), NVL( A.CPMTOEXT,0) ) )) CPMTOLOC, '
          + '       DECODE( trim(CXP301.TMONID),''N'', 0, DECODE( CPESTADO,''A'', 0, DECODE( CPESTADO,''E'', 0, NVL( A.CPMTOEXT,0)) ) ) CPMTOEXT, '
          + '       CXP301.CPFCMPRB,  TGE201.PROVDES, TGE110.DOCDES, NVL(TGE110.DOCRESTA,'' '') DOCRESTA, ';

   xSQL3 := 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0 ELSE '
          + 'CASE WHEN nvl(TGE201.PROVRETIGV,''N'')=''S'' THEN CASE WHEN nvl(A.CPIGV,0) > 0 THEN CASE WHEN nvl(A.CPGRAVAD,0) > nvl(TASAMTO,0) THEN nvl(A.CPGRAVAD,0)+nvl(A.CPIGV,0) ELSE 0 END ELSE 0 END ELSE 0 END END COMPSUJRET, '
          + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0 ELSE '
          + 'CASE WHEN nvl(TGE201.PROVRETIGV,''N'')=''S'' THEN CASE WHEN nvl(A.CPIGV,0) > 0 THEN CASE WHEN nvl(A.CPGRAVAD,0) > nvl(TASAMTO,0) THEN (nvl(A.CPGRAVAD,0)+nvl(A.CPIGV,0))*nvl(TASACAN,0)/100 ELSE 0 END ELSE 0 END ELSE 0 END END IGVRET, '
          + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0 ELSE NVL( A.CPIGV,0)+NVL( A.CPIGV2,0) END CXPTOTIGV, '
          + 'CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0  ELSE NVL( A.CPGRAVAD,0)+NVL( A.CPGRAVAD2,0) END CXPTOTGRAVAD, '
          + 'CASE WHEN TGE201.PROVRETIGV=''S'' THEN CASE WHEN A.CPIGV > 0 THEN  CASE WHEN A.CPGRAVAD > TASAMTO THEN ''X'' ELSE '' '' END ELSE '' '' END ELSE '' '' END RETSN, '
          + 'TGE104.TDIARDES, A.GLOSA, 0 NUMPAGINA, TGE201.TIPPERID TIPOPERSONA, CXP301.CPTCAMPR TIPOCAMBIO, ';

   xSQL4 := '( Select CXP301_A.CPFEMIS from CXP301 CXP301_A '
          + '   where CXP304.CIAID=CXP301_A.CIAID and CXP304.DOCID=CXP301_A.DOCID '
          + '     and CXP304.CPSERIE=CXP301_A.CPSERIE and CXP304.CPNODOC=CXP301_A.CPNODOC '
          + '     and CXP304.Prov=CXP301_A.Prov and CXP304.TCANJEID=''NC'' and rownum=1 ) NC_FECHA_DOC, ';

   xSQL5 := 'CXP304.DOCID NC, CXP304.CPSERIE NC_SERIE, CXP304.CPNODOC NC_DOC '
          + 'FROM CXP301, TGE201, TGE110, TGE108, TGE104, CXP304, '
          + ' ( Select CIAID, TDIARID, DCPANOMM, CPNOREG, SUM(CPGRAVAD) CPGRAVAD, SUM(CPIGV) CPIGV, SUM(CPGRAVAD2) CPGRAVAD2, '
          + '          SUM(CPIGV2) CPIGV2, SUM(CPNOGRAV) CPNOGRAV, SUM(IGV_GRA_NO_DEST) IGV_GRA_NO_DEST, SUM(ADQ_NO_GRAV) ADQ_NO_GRAV, '
          + '          SUM(CP_OTROS) CP_OTROS, SUM(CPDCTO) CPDCTO, SUM(CPISC) CPISC, SUM(CPSERVIC) CPSERVIC, SUM(CPMTOORI) CPMTOORI, '
          + '          SUM(CPMTOLOC) CPMTOLOC, SUM(CPMTOEXT) CPMTOEXT, SUM(CP4TA) CP4TA, SUM(APORTEONP) APORTEONP,SUM(APORTEAFP) APORTEAFP,SUM(COMISION) COMISION,SUM(SEGURO) SEGURO, '
          + '          MAX( CASE WHEN TIPDET=''MG'' OR TIPDET=''NG'' OR TIPDET=''MN'' OR TIPDET=''AN'' THEN DCPGLOSA ELSE '' '' END ) GLOSA '
          + '     FROM ( SELECT CIAID, TDIARID, DCPANOMM, CPNOREG, DCPGLOSA, TIPDET, '
          + '                   CASE WHEN TIPDET=''MG'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD, '
          + '                   CASE WHEN TIPDET=''I1'' AND TREGID=''03'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV, '
          + '                   CASE WHEN TIPDET=''NG'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD2, '
          + '                   CASE WHEN TIPDET=''I3'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV2, '
          + '                   CASE WHEN TIPDET=''MN'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPNOGRAV, '
          + '                   CASE WHEN TIPDET=''I2'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END IGV_GRA_NO_DEST, '
          + '                   CASE WHEN TIPDET=''AN'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END ADQ_NO_GRAV, '
          + '                   CASE WHEN TIPDET=''OT'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CP_OTROS, '
          + '                   CASE WHEN TIPDET=''DC'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPDCTO, '
          + '                   CASE WHEN TIPDET=''SV'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPSERVIC, '
          + '                   CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOLOC * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOORI, '
          + '                   CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOLOC * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOLOC, '
          + '                   CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOEXT * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOEXT, '
          + '                   CASE WHEN TIPDET=''I2'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPISC, '
          + '                   CASE WHEN TIPDET=''I1'' AND TREGID=''12'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CP4TA, '
          + '                   CASE WHEN TIPDET=''SN'' AND TREGID=''16'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END APORTEONP,'
          + '                   CASE WHEN TIPDET=''AF'' AND TREGID=''17'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END APORTEAFP,'
          + '                   CASE WHEN TIPDET=''CA'' AND TREGID=''18'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END COMISION,'
          + '                   CASE WHEN TIPDET=''SA'' AND TREGID=''19'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END SEGURO '
          + '              FROM CXP302 '
          + '             WHERE CIAID>=''02'' '
          + '               and DCPANOMM=' + quotedstr(dbeAnoMM.Text)
          + '               and TDIARID=''19'' ) A '
          + '             GROUP BY CIAID, TDIARID, DCPANOMM, CPNOREG ) A ';

   xSQL6 := '      where (CXP301.CPESTADO=''P'' or CXP301.CPESTADO=''C'' '
          + '          or CXP301.CPESTADO=''A'') '
          + '        and CXP301.CIAID>=''02'' '
          + '        and CXP301.TDIARID=''19'' '
          + '        and CXP301.CPANOMES=' + quotedstr(dbeAnoMM.Text)
          + '        and TGE201.CLAUXID(+)=CXP301.CLAUXID '
          + '        and TGE201.PROV(+)=CXP301.PROV '
          + '        and TGE110.DOCMOD=''CXP'' '
          + '        and TGE110.DOCID=CXP301.DOCID '
          + '        and TGE104.TDIARID(+)=CXP301.TDIARID '
          + '        and TASAFLG=''R'' '
          + '        and A.CIAID(+)=CXP301.CIAID '
          + '        and A.TDIARID(+)=CXP301.TDIARID '
          + '        and A.DCPANOMM=CXP301.CPANOMES '
          + '        and A.CPNOREG(+)=CXP301.CPNOREG '
          + '        and CXP304.CIAID(+)=CXP301.CIAID '
          + '        and CXP304.CCPCANJE(+)=CXP301.CPCANJE  '
          + '        and CXP304.PROV(+) = CXP301.PROV '
          + '             ) A, TGE101 B '
          + '  where A.CIAID=B.CIAID '
          + '  Group by A.CIAID, B.CIADES '
          + '  Order by CIAID';
// Fin HPC_201602_CXP

   xSQL := xSQL1 + xSQL2 + xSQL3 + xSQL4 + xSQL5 + xSQL6;

   DMCXP.cdsConsulta.Close;
   DMCXP.cdsConsulta.DataRequest(xSQL);
   DMCXP.cdsConsulta.Open;

   ppdbRes.DataSource := DMCXP.dsConsulta;
   pprRes.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\Rep_A4_Resumen.rtm';
   pprRes.Template.LoadFromFile;

   If cbDisenoRep.Checked Then
      ppdRes.ShowModal
   Else
   Begin
      pprRes.Print;
      pprRes.Stop;
      x10 := Self.ComponentCount - 1;
      While x10 >= 0 Do
      Begin
         If Self.Components[x10].ClassName = 'TppGroup' Then
         Begin
            Self.Components[x10].Free;
         End;
         x10 := x10 - 1;
      End;
      DMCXP.CdsConsulta.EnableControls;
      ppdbRes.DataSource := Nil;
   End;
End;

Procedure TFTransfPDT.BitBtn3Click(Sender: TObject);
Var
   xSQL, xSQL1, xSQL2, xSQL3, xSQL4, xSQL5, xSQL6, xSQL7, xSQL8, xSQL9: String;
   xNombre, xVar: String;
Begin

   If bbtnBorra.Focused Then Exit;

   If Length(dblcRUC.Text) = 0 Then
   Begin
      ShowMessage('Falta Seleccionar el RUC');
      dblcRUC.SetFocus;
      Exit;
   End;

   If length(dbeAnoMM.Text) = 0 Then
   Begin
      ShowMessage('Falta Ingresar Periodo');
      dbeAnoMM.SetFocus;
      Exit;
   End;

   If length(dbeAnoMM.Text) < 6 Then
   Begin
      ShowMessage('Periodo No Valido');
      dbeAnoMM.SetFocus;
      Exit;
   End;

   If (strtoint(copy(dbeAnoMM.Text, 1, 4)) < 1999) Then
   Begin
      ShowMessage('Año Inválido');
      dbeAnoMM.SetFocus;
      Exit;
   End;

   If (strtoint(copy(dbeAnoMM.Text, 5, 2)) < 0) Or (strtoint(copy(dbeAnoMM.Text, 5, 2)) > 12) Then
   Begin
      ShowMessage('Mes Inválido');
      dbeAnoMM.SetFocus;
      Exit;
   End;
   Screen.Cursor := crHourGlass;

   xSQL1 := 'SELECT A.CIAID CIA_REG_COMP, A.CPANOMES ANOMM_REGCOM, A.TDIARID TD_REGCOM, '
          + '       A.CPNOREG REG_REGCOM, A.CLAUXID CLAUX_REGCOM, A.PROV PROV_REGCOM, '
          + '       A.CPMTOLOC MTOLOC_REGCOM, A.CP4TA CTA_REGCOM, '
          + '       B.CIAID CIA_DAOT, B.CLAUXID CLAUX_DAOT, B.PROV PROV_DAOT, B.CPMTOLOC MTOLOC_DAOT, B.RTA4TA CTA_DAOT '
          + ' FROM ( ';

   xSQL2 := 'SELECT CXP301.CIAID, CXP301.CPANOMES, CXP301.TDIARID, CXP301.CPNOREG, CXP301.CLAUXID, CXP301.PROV, '
          + '       CXP301.DOCID, CXP301.CPSERIE, CXP301.CPNODOC, CXP301.CPFEMIS, CXP301.TMONID, '
          + '       CXP301.CPTCAMPR, CXP301.CPESTADO, CXP301.CP_CONTA, '
          + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPGRAVAD,0.00) end CPGRAVAD, '
          + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPIGV,0.00) end CPIGV, '
          + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPGRAVAD2,0.00) end CPGRAVAD2, '
          + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPIGV2,0.00) end CPIGV2, '
          + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPNOGRAV,0.00) end CPNOGRAV, '
          + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.IGV_GRA_NO_DEST,0.00) end IGV_GRA_NO_DEST, '
          + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.ADQ_NO_GRAV,0.00) end ADQ_NO_GRAV, '
          + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CP_OTROS,0.00) end CP_OTROS, '
          + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPDCTO,0.00) end CPDCTO, '
          + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPISC,0.00) end CPISC, '
          + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CPSERVIC,0.00) end CPSERVIC, '
          + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0.00 ELSE nvl(A.CP4TA,0.00) end CP4TA, '
          + '       DECODE( CPESTADO,''A'',0, DECODE( CPESTADO,''E'',0, ROUND( NVL( A.CPMTOORI, 0) * DECODE(trim(CXP301.TMONID),''N'', 1, CPTCAMPR) * DECODE(DOCRESTA,''S'', -1, 1 ), 2 ) )) CPMTOORI, '
          + '       DECODE( CPESTADO,''A'',0, DECODE( CPESTADO,''E'',0, DECODE( ''N'', ''N'', NVL( A.CPMTOLOC,0), NVL( A.CPMTOEXT,0) ) )) CPMTOLOC, '
          + '       DECODE( trim(CXP301.TMONID),''N'', 0, DECODE( CPESTADO,''A'', 0, DECODE( CPESTADO,''E'', 0, NVL( A.CPMTOEXT,0)) ) ) CPMTOEXT, '
          + '       CXP301.CPFCMPRB,  TGE201.PROVDES, TGE110.DOCDES, NVL(TGE110.DOCRESTA,'' '') DOCRESTA, ';

   xSQL3 := '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0 ELSE '
          + '       CASE WHEN nvl(TGE201.PROVRETIGV,''N'')=''S'' THEN CASE WHEN nvl(A.CPIGV,0) > 0 THEN CASE WHEN nvl(A.CPGRAVAD,0) > nvl(TASAMTO,0) THEN nvl(A.CPGRAVAD,0)+nvl(A.CPIGV,0) ELSE 0 END ELSE 0 END ELSE 0 END END COMPSUJRET, '
          + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0 ELSE '
          + '       CASE WHEN nvl(TGE201.PROVRETIGV,''N'')=''S'' THEN CASE WHEN nvl(A.CPIGV,0) > 0 THEN CASE WHEN nvl(A.CPGRAVAD,0) > nvl(TASAMTO,0) THEN (nvl(A.CPGRAVAD,0)+nvl(A.CPIGV,0))*nvl(TASACAN,0)/100 ELSE 0 END ELSE 0 END ELSE 0 END END IGVRET, '
          + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0 ELSE NVL( A.CPIGV,0)+NVL( A.CPIGV2,0) END CXPTOTIGV, '
          + '       CASE WHEN CPESTADO=''A'' OR CPESTADO=''E'' THEN 0  ELSE NVL( A.CPGRAVAD,0)+NVL( A.CPGRAVAD2,0) END CXPTOTGRAVAD, '
          + '       CASE WHEN TGE201.PROVRETIGV=''S'' THEN CASE WHEN A.CPIGV > 0 THEN  CASE WHEN A.CPGRAVAD > TASAMTO THEN ''X'' ELSE '' '' END ELSE '' '' END ELSE '' '' END RETSN, '
          + '       TGE104.TDIARDES, A.GLOSA, 0 NUMPAGINA, TGE201.TIPPERID TIPOPERSONA, CXP301.CPTCAMPR TIPOCAMBIO, ';

   xSQL4 := '     ( Select CXP301_A.CPFEMIS from CXP301 CXP301_A '
          + '        where CXP304.CIAID=CXP301_A.CIAID and CXP304.DOCID=CXP301_A.DOCID '
          + '          and CXP304.CPSERIE=CXP301_A.CPSERIE and CXP304.CPNODOC=CXP301_A.CPNODOC '
          + '          and CXP304.Prov=CXP301_A.Prov and CXP304.TCANJEID=''NC'' and rownum=1 ) NC_FECHA_DOC, ';

   xSQL5 := '       CXP304.DOCID NC, CXP304.CPSERIE NC_SERIE, CXP304.CPNODOC NC_DOC '
          + '  FROM CXP301, TGE201, TGE110, TGE108, TGE104, CXP304, '
          + '     ( Select CIAID, TDIARID, DCPANOMM, CPNOREG, SUM(CPGRAVAD) CPGRAVAD, SUM(CPIGV) CPIGV, SUM(CPGRAVAD2) CPGRAVAD2, '
          + '              SUM(CPIGV2) CPIGV2, SUM(CPNOGRAV) CPNOGRAV, SUM(IGV_GRA_NO_DEST) IGV_GRA_NO_DEST, SUM(ADQ_NO_GRAV) ADQ_NO_GRAV, '
          + '              SUM(CP_OTROS) CP_OTROS, SUM(CPDCTO) CPDCTO, SUM(CPISC) CPISC, SUM(CPSERVIC) CPSERVIC, SUM(CPMTOORI) CPMTOORI, '
          + '              SUM(CPMTOLOC) CPMTOLOC, SUM(CPMTOEXT) CPMTOEXT, SUM(CP4TA) CP4TA, '
          + '              MAX( CASE WHEN TIPDET=''MG'' OR TIPDET=''NG'' OR TIPDET=''MN'' OR TIPDET=''AN'' THEN DCPGLOSA ELSE '' '' END ) GLOSA '
          + '         FROM ( SELECT CIAID, TDIARID, DCPANOMM, CPNOREG, DCPGLOSA, TIPDET, '
          + '                       CASE WHEN TIPDET=''MG'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD, '
          + '                       CASE WHEN TIPDET=''I1'' AND TREGID=''03'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV, '
          + '                       CASE WHEN TIPDET=''NG'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD2, '
          + '                       CASE WHEN TIPDET=''I3'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV2, '
          + '                       CASE WHEN TIPDET=''MN'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPNOGRAV, '
          + '                       CASE WHEN TIPDET=''I2'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END IGV_GRA_NO_DEST, '
          + '                       CASE WHEN TIPDET=''AN'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END ADQ_NO_GRAV, '
          + '                       CASE WHEN TIPDET=''OT'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CP_OTROS, '
          + '                       CASE WHEN TIPDET=''DC'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPDCTO, '
          + '                       CASE WHEN TIPDET=''SV'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPSERVIC, '
          + '                       CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOLOC * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOORI, '
          + '                       CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOLOC * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOLOC, '
          + '                       CASE WHEN TIPDET=''TO'' or TIPDET=''I4'' THEN DCPMOEXT * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOEXT, '
          + '                       CASE WHEN TIPDET=''I2'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPISC, '
          + '                       CASE WHEN TIPDET=''I1'' AND TREGID=''12'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CP4TA '
          + '                  FROM CXP302 '
          + '                 WHERE CIAID>=''02'' and DCPANOMM=' + quotedstr(dbeAnoMM.Text) + ' ) A '
          + '         GROUP BY CIAID, TDIARID, DCPANOMM, CPNOREG ) A ';

   xSQL6 := ' WHERE ( CXP301.CPESTADO=''P'' OR CXP301.CPESTADO=''C'' OR CXP301.CPESTADO=''A'' ) '
          + '   AND CXP301.ciaid>=''02'' and CXP301.TDIARID=''19'' AND CXP301.CPANOMES=' + quotedstr(dbeAnoMM.Text)
          + '   AND CXP301.CLAUXID=TGE201.CLAUXID(+) AND CXP301.PROV=TGE201.PROV(+) '
          + '   AND TGE110.DOCMOD=''CXP'' AND CXP301.DOCID=TGE110.DOCID AND CXP301.TDIARID=TGE104.TDIARID(+) '
          + '   AND TASAFLG=''R'' AND CXP301.CIAID=A.CIAID AND CXP301.TDIARID=A.TDIARID AND CXP301.CPANOMES=A.DCPANOMM '
          + '   AND CXP301.CPNOREG=A.CPNOREG  AND CXP304.CIAID(+)=CXP301.CIAID  and CXP304.CCPCANJE(+)=CXP301.CPCANJE  '
          + '   and CXP304.Prov(+) = CXP301.Prov ';

   xSQL7 := ') A, ( ';

   xSQL8 := 'Select CP.CIAID, CP.CPANOMES, CP.TDIARID, CP.CLAUXID, CP.PROV, '
          + '       CP.CPNOREG, PROVE.PROVRUC, PROVE.PROVDES, '
          + '       NVL( CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.CPGRAVAD ELSE ROUND(CP.CPGRAVAD*CPTCAMPR,2) END,0) + '
          + '       NVL( CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.ADQ_NO_GRAV ELSE ROUND(CP.ADQ_NO_GRAV*CPTCAMPR,2) END,0) MTOTOT, '
          + '       CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.CPIGV ELSE ROUND(CP.CPIGV*CPTCAMPR,2) END RTA4TA, '
          + '       CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.CPISC ELSE ROUND(CP.CPISC*CPTCAMPR,2) END RTAIES, '
          + '       CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.CPGRAVAD ELSE ROUND(CP.CPGRAVAD*CPTCAMPR,2) END GRAVADO, '
          + '       NVL( CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.ADQ_NO_GRAV ELSE ROUND(CP.ADQ_NO_GRAV*CPTCAMPR,2) END,0) NOGRAVADO, '
          + '       CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.CPDCTO ELSE ROUND(CP.CPDCTO*CPTCAMPR,2) END*(-1) DESCUENTO, '
          + '       PROVE.PROVAPEPAT, PROVE.PROVAPEMAT, PROVE.PROVNOMBRE, PROVE.PROVNOMBRE1, '
          + '       PROVE.PROVEXONER, CP.DOCID, CP.CPSERIE, CP.CPNODOC, '
          + '       CP.CPFEMIS, CP.TMONID, CP.CPTCAMPR, '
          + '       CP.CPMTOLOC, DOCS.DOCPROV, CP.CPSALLOC, CP.CPESTADO '
          + '  From CXP301 CP, TGE110 DOCS, TGE201 PROVE ' //, CAJA303 B, CAJA302 C '
          + ' Where CP.CPANOMES=' + quotedstr(dbeAnoMM.Text)
          + '   and (CP.DOCID=DOCS.DOCID and DOCS.DOCPROV=' + quotedstr('S') + ')'
          + '   and (CP.CLAUXID=PROVE.CLAUXID and CP.PROV=PROVE.PROV)'
          + '   and CP.CPESTADO in (''P'',''C'') '
          + '   and ' + xSelDoc
          + '   and CP.CIAID in (' + wRUCCIA + ') '
          + ' ORDER BY CP.PROVRUC, CP.CIAID, CP.TDIARID, CP.CPNOREG ';

   xSQL9 := ' ) B '
          + ' WHERE A.CIAID=B.CIAID(+) AND A.CPANOMES=B.CPANOMES(+) AND A.TDIARID=B.TDIARID(+) AND A.CPNOREG=B.CPNOREG(+) '
          + '   AND B.CPNOREG IS NULL ';

   xSQL := xSQL1 + xSQL2 + xSQL3 + xSQL4 + xSQL5 + xSQL6 + xSQL7 + xSQL8 + xSQL9;

   DMCXP.cdsConsulta.Close;
   DMCXP.cdsConsulta.DataRequest(xSQL);
   DMCXP.cdsConsulta.Open;
   If DMCXP.cdsConsulta.RecordCount=0 Then
   Begin
     ShowMessage('No Existe información para mostrar');
     Screen.Cursor := crDefault;
     exit;
   End;
   ppdbInc.DataSource := DMCXP.dsConsulta;
   pprInc.Print;
   pprInc.Stop;
   Screen.Cursor := crDefault;
End;

Procedure TFTransfPDT.BitBtn5Click(Sender: TObject);
Begin
   mSQL.Visible := Not mSQL.Visible;
End;

Procedure TFTransfPDT.fg_GeneraTxtPs4;
Var
   xsSql: String;
   xsFormulario: String;
   xsAnioMes: String;
   xsRuc: String;
   xsNombreArchivo: String;
   xsLinea: String;
Begin
   xsFormulario := '0601';
   xsAnioMes := dbeAnoMM.Text;
   xsRuc := dblcRUC.Text;
   xsNombreArchivo := xsFormulario + xsAnioMes + xsRuc + '.ps4';
   Screen.Cursor := crHourGlass;
   scFILES.Lines.Clear;

   DMCXP.cdsQry13.First;
   While Not DMCXP.cdsQry13.EOF Do
   Begin
      xsLinea := '';
      //sie es domiciliado entonces RUC
      If DMCXP.cdsQry13.fieldbyname('ESDOMIC2').AsString = '2' Then
      Begin
         xsLinea := DMCXP.cdsQry13.fieldbyname('TIPDOCID').AsString; // 1
         xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('PROVDNI').AsString; // 2
      End
      Else
      Begin
         xsLinea := '06'; // 1
         xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('PROVRUC').AsString; // 2
      End;
      xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('PROVAPEPAT').AsString; // 3
      xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('PROVAPEMAT').AsString; // 4
      xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('PROVNOMBRE').AsString; // 5
      If DMCXP.cdsQry13.fieldbyname('PROVNOMBRE1').AsString <> '' Then
         xsLinea := xsLinea + ' ' + DMCXP.cdsQry13.fieldbyname('PROVNOMBRE1').AsString; // 5
      xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('ESDOMIC2').AsString; // 5  Domiciliado

      xsSql := ' CLAUXID = ' + QuotedStr(DMCXP.cdsQry13.fieldbyname('CLAUXID').AsString)
              +' AND PROV = ' + QuotedStr(DMCXP.cdsQry13.fieldbyname('PROV').AsString);
      xsLinea := xsLinea + '|' + BuscaQry('dspTGE', 'TGE201', 'NVL(CONVDOBTRI,' + QuotedStr('0') + ') CONVDOBTRI ', xsSql, 'CONVDOBTRI');

      xsLinea := xsLinea + '|'; // 12
      scFILES.Lines.Add(xsLinea);
      DMCXP.cdsQry13.Next;
   End;
// Inicio HPC_201602_CXP
// DAF_2016000282_CXP_1 Pide Ruta para Grabar Archivos
   sdGraba.FileName := xsNombreArchivo;
   If Not sdGraba.Execute Then
   Begin
      Screen.Cursor := crDefault;
      Exit;
   End;
   scFILES.Lines.SaveToFile(xsNombreArchivo);
// Fin HPC_201602_CXP

   Screen.Cursor := crDefault;
   ShowMessage('El archivo ' + xsNombreArchivo + ' se generó correctamente');

End;

Procedure TFTransfPDT.btnArchivoPs4Click(Sender: TObject);
Begin
   xsArchivoPs4 := True;
   bbtnE4Click(bbtnE4);
   xsArchivoPs4 := False;
End;

Procedure TFTransfPDT.btn4taClick(Sender: TObject);
Begin
   xsArchivo4ta := True;
   bbtnE20Click(bbtnE20);
   xsArchivo4ta := False;
End;

Procedure TFTransfPDT.fg_GeneraTxt4ta;
Var
   xsLinea: String;
   xsFormulario: String;
   xsAnioMes: String;
   xsRuc: String;
   xsNombreArchivo: String;
Begin
   xsFormulario := '0601';
   xsAnioMes := dbeAnoMM.Text;
   xsRuc := dblcRUC.Text;
   xsNombreArchivo := xsFormulario + xsAnioMes + xsRuc + '.4ta';

   scFILES.Lines.Clear;
   Screen.Cursor := crHourGlass;
   DMCXP.cdsQry13.First;
   While Not DMCXP.cdsQry13.EOF Do
   Begin
      xsLinea := '';
      //Si es domiciliado es con RUC
      If DMCXP.cdsQry13.fieldbyname('ESDOMIC2').AsString = '2' Then
      Begin
         xsLinea := DMCXP.cdsQry13.fieldbyname('TIPDOCID').AsString; // 1
         xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('PROVDNI').AsString; // 2
      End
      Else
      Begin
         xsLinea := '06'; // 1
         xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('PROVRUC').AsString; // 2
      End;
      xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('DOCSUNAT').AsString; // 3
      xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('CPSERIE').AsString; // 4
      xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('CPNODOC').AsString; // 5
      xsLinea := xsLinea + '|' + FormatFloat('######0.00', DMCXP.cdsQry13.fieldbyname('MTOTOT').AsFloat); // 6
      If DMCXP.cdsQry13.fieldbyname('CPFEMIS').Value < DMCXP.cdsQry13.fieldbyname('FECPAG').Value Then
      Begin
         xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('CPFEMIS').AsString; // 7
         xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('FECPAG').AsString; // 8
      End
      Else
      Begin
         xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('CPFEMIS').AsString; // 7
         xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('CPFEMIS').AsString; // 8
      End;
      xsLinea := xsLinea + '|' + DMCXP.cdsQry13.fieldbyname('INDICADOR').AsString; // 9
   // Inicio HPC_201602_CXP
   // DAF_2016000282_CXP_1 Añade 2 palotes faltantes
   //   xsLinea := xsLinea + '|'; // 12
      xsLinea := xsLinea + '|||';
   // Fin HPC_201602_CXP
      scFILES.Lines.Add(xsLinea);
      DMCXP.cdsQry13.Next;
   End;

// Inicio HPC_201602_CXP
// DAF_2016000282_CXP_1 Pide Ruta para Grabar Archivos
   sdGraba.FileName := xsNombreArchivo;
   If Not sdGraba.Execute Then
   Begin
      Screen.Cursor := crDefault;
      Exit;
   End;
// Fin HPC_201602_CXP

   scFILES.Lines.SaveToFile(xsNombreArchivo);
   Screen.Cursor := crDefault;
   ShowMessage('El archivo ' + xsNombreArchivo + ' se generó correctamente');
End;

Procedure TFTransfPDT.fg_GeneraTxtAFPnet;
Var
   xsLinea: String;
   xsFormulario: String;
   xsAnioMes: String;
   xsRuc: String;
   xsNombreArchivo: String;
   xsi: Double;
   xsmontofinal, xsmonto, xsmontoent, xsmontodec: String;
Begin
   xsFormulario := '0601';
   xsAnioMes := dbeAnoMM.Text;
   xsRuc := dblcRUC.Text;
   xsNombreArchivo := xsFormulario + xsAnioMes + xsRuc + '.AFPnet';

   scFILES.Lines.Clear;
   Screen.Cursor := crHourGlass;
   DMCXP.cdsQry13.First;
   xsi := 1;
   xsmonto := '';
   While Not DMCXP.cdsQry13.EOF Do
   Begin
      xsmonto := FormatFloat('######0.00', DMCXP.cdsQry13.fieldbyname('MTOTOT').AsFloat);
      xsmontoent := copy(xsmonto, 0, pos('.', xsmonto) - 1);
      xsmontodec := copy(xsmonto, pos('.', xsmonto) + 1, length(xsmonto));
      xsmontofinal := strzero(xsmontoent, 7) + strzero(xsmontodec, 2);

      xsLinea := '';
      xsLinea := strzero(FloatToStr(xsi), 5); // 1
      xsLinea := xsLinea + StringOfChar(' ', 12); // 2
      xsLinea := xsLinea + DMCXP.cdsQry13.fieldbyname('TIPDOCAFP').AsString; // 3  Tipo de Documento de Identidad AFP
      xsLinea := xsLinea + DMCXP.cdsQry13.fieldbyname('PROVDNI').AsString + StringOfChar(' ', 20 - length(DMCXP.cdsQry13.fieldbyname('PROVDNI').AsString)); // 4  Número de Documento de Identidad
      xsLinea := xsLinea + DMCXP.cdsQry13.fieldbyname('PROVAPEPAT').AsString + StringOfChar(' ', 20 - length(DMCXP.cdsQry13.fieldbyname('PROVAPEPAT').AsString)); // 5  Apellido Paterno del Afiliado
      xsLinea := xsLinea + DMCXP.cdsQry13.fieldbyname('PROVAPEMAT').AsString + StringOfChar(' ', 20 - length(DMCXP.cdsQry13.fieldbyname('PROVAPEMAT').AsString)); // 6  Apellido Materno del Afiliado
      xsLinea := xsLinea + DMCXP.cdsQry13.fieldbyname('PROVNOMBRE').AsString + StringOfChar(' ', 20 - length(DMCXP.cdsQry13.fieldbyname('PROVNOMBRE').AsString)); // 7  Nombres del Afiliado
      xsLinea := xsLinea + StringOfChar(' ', 1); // 8  Tipo de Movimiento de Personal
      xsLinea := xsLinea + StringOfChar(' ', 10); // 9  Fecha Movimiento
      xsLinea := xsLinea + xsmontofinal; // 10
      xsLinea := xsLinea + StringOfChar(' ', 9); // 11  Aporte Voluntario con fin previsional
      xsLinea := xsLinea + StringOfChar(' ', 9); // 12  Aporte Voluntario sin fin previsional
      xsLinea := xsLinea + StringOfChar(' ', 9); // 13  Aporte Voluntario del Empleador
      xsLinea := xsLinea + DMCXP.cdsQry13.fieldbyname('TIPTRAB').AsString; // 14  Tipo de Trabajador
      xsLinea := xsLinea + DMCXP.cdsQry13.fieldbyname('AFPNETID').AsString; // 15  AFP
      xsLinea := xsLinea + ''; // 16
      xsi := xsi + 1;
      scFILES.Lines.Add(xsLinea);
      DMCXP.cdsQry13.Next;

   End;

   scFILES.Lines.SaveToFile(xsNombreArchivo);
   Screen.Cursor := crDefault;
   ShowMessage('El archivo ' + xsNombreArchivo + ' se generó correctamente');

End;

Procedure TFTransfPDT.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;

Procedure TFTransfPDT.btnDetallePensionClick(Sender: TObject);
Var
   x10: Integer;
   xSQL: String;
Begin
// Inicio HPC_201602_CXP
// DAF_2016000282_CXP_1 Incluye columna de Neto, calculada en base a Monto Total-Retención
   xSQL := 'Select CP.CIAID, CP.CPANOMES, CP.TDIARID, CP.CLAUXID, CP.PROV, CP.CPNOREG, '
      + '          PROVE.PROVRUC, PROVE.PROVDES, PROVE.PROVAPEPAT,  PROVE.PROVAPEMAT, '
      + '          PROVE.PROVNOMBRE, PROVE.PROVNOMBRE1, PROVE.PROVEXONER, CP.DOCID, '
      + '          CP.CPSERIE,  CP.CPNODOC, CP.CPFEMIS, CP.TMONID, CP.CPTCAMPR, CP.CPMTOLOC, '
      + '          DOCS.DOCPROV, CP.CPSALLOC, CP.CPESTADO ,  PROVE.FECNAC, CP.SNPAFPID, RP.SNPAFPDES, '
      + '         (CASE WHEN CP.SNPAFPID = ''01'' '
      + '               THEN (CASE WHEN CP.TMONID=''N'' '
      + '                          THEN CP.CPGRAVAD '
      + '                          ELSE ROUND(CP.CPGRAVAD*CP.CPTCAMPR,2) END) '
      + '                  + (CASE WHEN CP.TMONID=''N'' '
      + '                          THEN CP.ADQ_NO_GRAV '
      + '                          ELSE ROUND(CP.ADQ_NO_GRAV*CP.CPTCAMPR,2) END) '
      + '               ELSE 0.00 '
      + '           END) BI_ONP, '
      + '          SUM(CASE WHEN TIPDET = ''SN'' THEN DCPMOORI ELSE 0 END) ONP,'
      + '         (CASE WHEN CP.SNPAFPID = ''01'' '
      + '               THEN 0.00 '
      + '               ELSE (CASE WHEN CP.TMONID=''N'' '
      + '                          THEN CP.CPGRAVAD '
      + '                          ELSE ROUND(CP.CPGRAVAD*CP.CPTCAMPR,2) END) '
      + '                  + (CASE WHEN CP.TMONID=''N'' '
      + '                          THEN CP.ADQ_NO_GRAV '
      + '                          ELSE ROUND(CP.ADQ_NO_GRAV*CP.CPTCAMPR,2) END) '
      + '           END) BI_AFP,'
      + '          SUM(CASE WHEN TIPDET = ''AF'' THEN DCPMOORI ELSE 0 END) APORTE, '
      + '          SUM(CASE WHEN TIPDET = ''CA'' THEN DCPMOORI ELSE 0 END) COMISION, '
      + '          SUM(CASE WHEN TIPDET = ''SA'' THEN DCPMOORI ELSE 0 END) SEGURO, '
      + '          CP.CP4TAPENSION, '
      + '          CP.CPMTOLOC - CP.CPIGV NETO '
      + '      From CXP301 CP '
      + '           inner join CXP302 CD on (CP.CIAID =CD.CIAID '
      + '                                and CP.CPANOMES = CD.DCPANOMM '
      + '                                and CP.TDIARID = CD.TDIARID '
      + '                                and CP.CPNOREG = CD.CPNOREG)'
      + '           inner join TGE110 DOCS on (CP.DOCID=DOCS.DOCID)'
      + '           inner join TGE201 PROVE on (CP.CLAUXID=PROVE.CLAUXID and CP.PROV=PROVE.PROV)'
      + '           inner join RRHH103 RP on (CP.SNPAFPID = RP.SNPAFPID)'
      + '     Where CP.CPANOMES=' + quotedstr(dbeAnoMM.Text)
      + '       and DOCS.DOCPROV=' + quotedstr('S') + ' '
      + '       and CP.CPESTADO in (''P'',''C'') AND CD.TIPDET IN (''AF'',''CA'',''SA'',''SN'')'
      + '       and ' + xSelDoc
      + '       and CP.CIAID in (' + wRUCCIA + ')'
      + '     group by CP.CIAID, CP.CPANOMES, CP.TDIARID, CP.CLAUXID, CP.PROV, CP.CPNOREG, '
      + '              PROVE.PROVRUC, PROVE.PROVDES, PROVE.PROVAPEPAT,  PROVE.PROVAPEMAT, '
      + '              PROVE.PROVNOMBRE, PROVE.PROVNOMBRE1, PROVE.PROVEXONER, CP.DOCID, '
      + '              CP.CPSERIE,  CP.CPNODOC, CP.CPFEMIS, CP.TMONID, CP.CPTCAMPR, CP.CPMTOLOC,'
      + '              DOCS.DOCPROV, CP.CPSALLOC, CP.CPESTADO ,CP.CP4TAPENSION,PROVE.FECNAC, '
      + '              PROVE.SNPAFPID, RP.SNPAFPDES,CP.CPGRAVAD,CP.ADQ_NO_GRAV,CP.SNPAFPID'
      + '     Order by PROVE.PROVRUC, CP.CIAID, CP.TDIARID, CP.CPNOREG';
// Fin HPC_201602_CXP

   DMCXP.cdsQry2.filtered := false;
   DMCXP.cdsQry2.filter := '';
   DMCXP.cdsQry2.indexfieldnames := '';
   DMCXP.cdsQry2.Close;
   DMCXP.cdsQry2.ProviderName := 'dspTGE';
   DMCXP.cdsQry2.DataRequest(xSQL);
   DMCXP.cdsQry2.Open;

   DMCXP.cdsQry2.DisableControls;
   If DMCXP.cdsQry2.RecordCount = 0 Then
   Begin
      ShowMessage('No existe Detalle a Imprimir');
      exit;
   End;
   ppDBReportePDT.DataSource := DMCXP.dsQry2;

   pprPDT2.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RepPDT2_A4_RegPension.rtm';

   pprPDT2.Template.LoadFromFile;

   If cbDisenoRep.Checked Then
   Begin
      ppd2.Report := pprPDT2;
      ppd2.ShowModal;
   End
   Else
   Begin
      pprPDT2.Print;

      pprPDT2.Stop;

      x10 := Self.ComponentCount - 1;
      While x10 >= 0 Do
      Begin
         If Self.Components[x10].ClassName = 'TppGroup' Then
         Begin
            Self.Components[x10].Free;
         End;
         x10 := x10 - 1;
      End;
      DMCXP.cdsQry2.EnableControls;
      ppDBReportePDT.DataSource := Nil;
   End;

End;

Procedure TFTransfPDT.btnAfpnetClick(Sender: TObject);
Var
   xSQL, xLinea: String;
Begin
// inconsistencias
   xSQL := 'Select * '
          +'  from (Select CP.CLAUXID, CP.PROV, PROVE.PROVDES, '
          +'               TIPDOCID, PROVDNI, FECNAC, SEXO, ESDOMIC, PROVE.PROVRUC, '
          +'               TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, TIPZONAID, NOMZONA, REFDOMIC, '
          +'               DPTOID||CIUDID||PROVCZIP UBIGEO '
          +'          From CXP301 CP, TGE110 DOCS, TGE201 PROVE '
          +'         WHERE CP.CPANOMES=' + quotedstr(dbeAnoMM.Text)
          +'           and (CP.DOCID=DOCS.DOCID and DOCS.DOCPROV=' + quotedstr('S') + ')'
          +'           and (CP.CLAUXID=PROVE.CLAUXID and CP.PROV=PROVE.PROV)'
          +'           and CP.CPESTADO in (''P'',''C'') '
          +'           and ' + xSelDoc;
   xSQL := xSQL + ' and CP.CIAID in (' + wRUCCIA + ')';
   xSQL := xSQL + ' Group by CP.CLAUXID, CP.PROV, PROVE.PROVDES, '
          + 'TIPDOCID, PROVDNI, FECNAC, SEXO, ESDOMIC, PROVE.PROVRUC, '
          + 'TIPVIAID, NOMVIA, NUMDOMIC, INTDOMIC, TIPZONAID, NOMZONA, REFDOMIC, '
          + 'DPTOID||CIUDID||PROVCZIP ) A ';
   xSQL := xSQL + 'WHERE TIPDOCID is null or PROVDNI is null or FECNAC is null or '
          + 'NOT SEXO IN ( ''F'',''M'' ) or ESDOMIC in null '
          + 'or ( ESDOMIC=''S'' AND LENGTH(PROVRUC)<>11 ) '
          + 'or (  nvl(ESDOMIC,''N'')=''N'' '
          + 'and ( TIPVIAID IS NULL and NOMVIA IS NULL and TIPZONAID IS NULL and '
          + 'NOMZONA IS NULL and nvl(LENGTH(UBIGEO),0)<>6) ) ';
   DMCXP.cdsQry13.filtered := false;
   DMCXP.cdsQry13.indexfieldnames := '';
   DMCXP.cdsQry13.Close;
   DMCXP.cdsQry13.ProviderName := 'dspTGE';
   DMCXP.cdsQry13.DataRequest(xSQL);
   DMCXP.cdsQry13.Open;

   If DMCXP.cdsQry13.RecordCount > 0 Then
   Begin
      ShowMessage('Existen Inconsistencias, Emitir reporte');
      exit;
   End;

   xSQL := 'Select PROVE.TIPDOCID,CP.PROVRUC, PROVDNI, '
         + '       CP.DOCID, '
         + '       CASE WHEN CP.DOCID=''02'' THEN SUBSTR(CPSERIE, LENGTH(CPSERIE)-2,3)  WHEN CP.DOCID=''34'' THEN NULL ELSE NULL END CPSERIE, '
         + '       CASE WHEN CP.DOCID=''02'' THEN CP.CPNODOC  WHEN CP.DOCID=''34'' THEN NULL ELSE NULL END CPNODOC, '
         + '       nvl( CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.CPGRAVAD ELSE ROUND(CP.CPGRAVAD*CPTCAMPR,2) END, 0 ) + '
         + '           nvl( CASE WHEN CP.TMONID=''' + DMCXP.wTMonLoc + ''' THEN CP.ADQ_NO_GRAV ELSE ROUND(CP.ADQ_NO_GRAV*CPTCAMPR,2) END, 0 ) MTOTOT, '
         + '       CASE WHEN CP.DOCID=''02'' THEN TO_DATE(CP.CPFEMIS)  WHEN CP.DOCID=''34'' THEN TO_DATE(CP.CPFEMIS) ELSE NULL END CPFEMIS, '
         + '       CASE WHEN CP.DOCID=''02'' THEN TO_DATE(CP.CPFCMPRB) WHEN CP.DOCID=''34'' THEN TO_DATE(CP.CPFCMPRB) ELSE NULL END FECPAG, '
         + '       CP.SNPAFPID, (CASE WHEN CP.SNPAFPID IS NOT NULL THEN RP.SNPAFPDES ELSE '' '' END) SNPAFPDES, '
         + '      (CASE WHEN CP.SNPAFPID IS NOT NULL THEN CP.CP4TAPENSION ELSE NULL END) CP4TAPENSION, '
         + '       S.TIPDOCAFP, PROVE.PROVAPEPAT,PROVE.PROVAPEMAT,PROVE.PROVNOMBRE, ''I'' TIPTRAB,RP.AFPNETID  '
         + '  From CXP301 CP, TGE110 DOCS, TGE201 PROVE, '
         + '       RRHH103 RP,SUNAT101 S '
         + ' WHERE CP.CPANOMES=' + quotedstr(dbeAnoMM.Text)
         + '   and (CP.DOCID=DOCS.DOCID and DOCS.DOCPROV=' + quotedstr('S') + ')'
         + '   and (CP.CLAUXID=PROVE.CLAUXID and CP.PROV=PROVE.PROV)'
         + '   and CP.CPESTADO in (''P'',''C'') '
         + '   and PROVE.SNPAFPID = RP.SNPAFPID(+)'
         + '   and PROVE.TIPDOCID = S.TIPDOCID '
         + '   and CP.SNPAFPID not in (''01'') '
         + '   and ' + xSelDoc;
   xSQL := xSQL + ' and CP.CIAID in (' + wRUCCIA + ')';
   If rgSoloPagados.ItemIndex = 1 Then
   Begin
      xSQL := xSQL + ' and CP.CPESTADO=' + quotedstr('C');
   End;
   xSQL := xSQL + ' GROUP BY PROVE.TIPDOCID,CP.PROVRUC, PROVDNI,CP.SNPAFPID, '
                + '         (CASE WHEN CP.SNPAFPID IS NOT NULL THEN RP.SNPAFPDES ELSE '' '' END), '
                + '          S.TIPDOCAFP, PROVE.PROVAPEPAT,PROVE.PROVAPEMAT,PROVE.PROVNOMBRE,RP.AFPNETID ';
   xSQL := xSQL + ' ORDER BY CP.PROVRUC';

   DMCXP.cdsQry13.filtered := false;
   DMCXP.cdsQry13.indexfieldnames := '';
   DMCXP.cdsQry13.Close;
   DMCXP.cdsQry13.ProviderName := 'dspTGE';
   DMCXP.cdsQry13.DataRequest(xSQL);
   DMCXP.cdsQry13.Open;

   fg_GeneraTxtAFPnet;

End;

// Inicio HPC_201602_CXP
// DAF_2016000282_CXP_1 Rutina de boton que determina diferencias detalle versus resumen
procedure TFTransfPDT.bbtnDetVsResClick(Sender: TObject);
var
   xSQL : String;
   i : integer;
begin
   xSQL := 'Select CIAID, CPNOREG, MONTORET4TA, CP4TA, DIFER '
      + '     from (Select CXP301.CIAID, CXP301.CPNOREG, '
      + '                  (case when CXP301.TMONID=''N'' '
      + '                        then CXP301.CPIGV '
      + '                        else CXP301.CPIGV*CXP301.CPTCAMPR end) MONTORET4TA, '
      + '                  CP4TA, '
      + '                  round((case when CXP301.TMONID=''N'' '
      + '                              then CXP301.CPIGV '
      + '                              else CXP301.CPIGV*CXP301.CPTCAMPR end)+CP4TA,2) DIFER '
      + '             from CXP301, TGE201, TGE110, TGE104, TGE108, CXP304, '
      + '                  (Select CIAID, TDIARID, DCPANOMM, CPNOREG, sum(CPGRAVAD) CPGRAVAD, '
      + '                          sum(CPIGV) CPIGV, sum(CPGRAVAD2) CPGRAVAD2, '
      + '                          sum(CPIGV2) CPIGV2, sum(CPNOGRAV) CPNOGRAV, '
      + '                          sum(IGV_GRA_NO_DEST) IGV_GRA_NO_DEST, sum(ADQ_NO_GRAV) ADQ_NO_GRAV, '
      + '                          sum(CP_OTROS) CP_OTROS, sum(CPDCTO) CPDCTO, sum(CPISC) CPISC, '
      + '                          sum(CPSERVIC) CPSERVIC, sum(CPMTOORI) CPMTOORI, '
      + '                          sum(CPMTOLOC) CPMTOLOC, sum(CPMTOEXT) CPMTOEXT, '
      + '                          sum(CP4TA) CP4TA, sum(APORTEONP) APORTEONP, sum(APORTEAFP) APORTEAFP,'
      + '                          sum(COMISION) COMISION, sum(SEGURO) SEGURO, '
      + '                          max(case when TIPDET=''MG'' or TIPDET=''NG'' or TIPDET=''MN'' '
      + '                                        or TIPDET=''AN'' '
      + '                                   then DCPGLOSA '
      + '                                   else '' '' END ) GLOSA '
      + '                     from (Select CIAID, TDIARID, DCPANOMM, CPNOREG, DCPGLOSA, TIPDET, '
      + '                             case when TIPDET=''MG'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end CPGRAVAD,'
      + '                             case when TIPDET=''I1'' and TREGID=''03'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end CPIGV, '
      + '                             case when TIPDET=''NG'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end CPGRAVAD2,'
      + '                             case when TIPDET=''I3'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end CPIGV2, '
      + '                             case when TIPDET=''MN'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end CPNOGRAV, '
      + '                             case when TIPDET=''I2'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end IGV_GRA_NO_DEST, '
      + '                             case when TIPDET=''AN'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end ADQ_NO_GRAV, '
      + '                             case when TIPDET=''OT'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end CP_OTROS, '
      + '                             case when TIPDET=''DC'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end CPDCTO, '
      + '                             case when TIPDET=''SV'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end CPSERVIC, '
      + '                             case when TIPDET=''TO'' or TIPDET=''I4'' '
      + '                                  then DCPMOLOC*case when DCPDH=''D'' '
      + '                                                     then -1 else 1 end else 0 end CPMTOORI, '
      + '                             case when TIPDET=''TO'' or TIPDET=''I4'' '
      + '                                  then DCPMOLOC*case when DCPDH=''D'' '
      + '                                                     then -1 else 1 end else 0 end CPMTOLOC, '
      + '                             case when TIPDET=''TO'' or TIPDET=''I4'' '
      + '                                  then DCPMOEXT*case when DCPDH=''D'' '
      + '                                                     then -1 else 1 end else 0 end CPMTOEXT, '
      + '                             case when TIPDET=''I2'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end CPISC, '
      + '                             case when TIPDET=''I1'' and TREGID=''12'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end CP4TA, '
      + '                             case when TIPDET=''SN'' and TREGID=''16'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end APORTEONP, '
      + '                             case when TIPDET=''AF'' and TREGID=''17'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end APORTEAFP, '
      + '                             case when TIPDET=''CA'' and TREGID=''18'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end COMISION, '
      + '                             case when TIPDET=''SA'' and TREGID=''19'' '
      + '                                  then DCPMOLOC*case when DCPDH=''H'' '
      + '                                                     then -1 else 1 end else 0 end SEGURO '
      + '                             from CXP302 '
      + '                            where CIAID>=''02'' '
      + '                              and DCPANOMM='+quotedstr(dbeAnoMM.Text)
      + '                              and TDIARID=''19'' ) A '
      + '                     group by CIAID, TDIARID, DCPANOMM, CPNOREG '
      + '                  ) A '
      + '            where (CXP301.CPESTADO = ''P'' or CXP301.CPESTADO = ''C'' '
      + '                  or CXP301.CPESTADO = ''A'') '
      + '              and CXP301.CIAID >= ''02'' '
      + '              and CXP301.TDIARID = ''19'' '
      + '              and CXP301.CPANOMES = '+quotedstr(dbeAnoMM.Text)
      + '              and CXP301.CLAUXID = TGE201.CLAUXID(+) '
      + '              and CXP301.PROV = TGE201.PROV(+) '
      + '              and TGE110.DOCMOD = ''CXP'' '
      + '              and CXP301.DOCID = TGE110.DOCID '
      + '              and CXP301.TDIARID = TGE104.TDIARID(+) '
      + '              and TASAFLG = ''R'' '
      + '              and CXP301.CIAID = A.CIAID(+) '
      + '              and CXP301.TDIARID = A.TDIARID(+) '
      + '              and CXP301.CPANOMES = A.DCPANOMM(+) '
      + '              and CXP301.CPNOREG = A.CPNOREG(+) '
      + '              and CXP304.CIAID(+) = CXP301.CIAID '
      + '              and CXP304.CCPCANJE(+) = CXP301.CPCANJE '
      + '              and CXP304.PROV(+) = CXP301.PROV '
      + '           ) where DIFER<>0 '
      + '    order by CIAID, CPNOREG ';
   DMCXP.cdsConsulta.Close;
   DMCXP.cdsConsulta.DataRequest(xSQL);
   DMCXP.cdsConsulta.Open;
   If DMCXP.cdsConsulta.RecordCount=0 then
   Begin
      ShowMessage('No hay diferencias encontradas');
   End
   Else
   Begin
      i := 0;
      xSQL := '';
      While not DMCXP.cdsConsulta.EOF do
      Begin
         i := i+1;
         xSQL := xSQL + 'Cía:'+ DMCXP.cdsConsulta.FieldByName('CIAID').AsString
            + ' Nro.Reg:'+ DMCXP.cdsConsulta.FieldByName('CPNOREG').AsString+chr(13);
         if i>10 then break;
         DMCXP.cdsConsulta.Next;
      End;
      ShowMessage('Diferencias encontradas:'+chr(13)+xSQL);
   End;
end;
// Fin HPC_201602_CXP

End.

