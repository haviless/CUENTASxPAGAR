Unit CxP778;

// Inicio Uso Estándares:   01/08/2011
// Unidad               :   CxP778
// Formulario           :   FToolCont
// Fecha de Creación    :   04/05/2010
// Autor                :   Hugo Noriega
// Objetivo             :   Panel Superior para agregar botones en Provisiones por Pagar.
//
// Actualizaciones      :
// HPP_201103_CXP  27/07/2011  Revertir la Orden de Pago al eliminar la provisión.
// HPP_201104_CXP  09/08/2011  Validar que no elimine Provisión que se este usando en Orden de Pago.
// HPC_201406_CXP  15/05/2014  Se incluye control de Periodo al Botón Eliminar.
//                 15/05/2014  Se añade condición CPESTADO='E' para que pueda volver a eliminar el mismo documento.
// HPC_201412_CXP  10/09/2014  Se esta retirando la condición CPESTADO ='E' para que pueda volver a eliminar el mismo documento.
// HPC_201501_CXP  24/04/2015  Importación de Recibos por Honorarios Electrónicos.
// HPC_201602_CXP  11/04/2016  Transfiere Amortizaciones y/o Cancelaciones de una Provisión a otra
//                 22/04/2016  Modifica Condicional de acuerdo al Tipo de Documento
// HPC_201604_CXP  17/10/2016  El Saldo de la Provisión se inicializa con el campo TO (Total) del Detalle
//
// HPC_201707_CXP  17/11/2017  Solo se ha modificado el DFM
//
// HPC_201803_CXP  14/05/2018  Se modifica solo el dfm.
// HPC_201805_CXP  14/05/2018  Se realiza el cambio debido a la aceptación grupal.

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, Buttons, Mant, Db, Wwdatsrc, DBClient, wwclient, ppDB,
   ppDBPipe, ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv,
   ppProd, ppReport, Wwdbigrd, Wwdbgrid, ExtCtrls, ppVar, ppViewr, StdCtrls,
// Inicio HPC_201602_CXP
// adición de Librería Variants
   wwdblook, pptypes, oaVariables, variants;
// Fin HPC_201602_CXP

Type
   TFToolCont = Class(TForm)
      pnGLT: TPanel;
      sbtABl: TSpeedButton;
      sbtCBl: TSpeedButton;
      sbtEliminar: TSpeedButton;
      Z2sbDetalle: TSpeedButton;
      ppdbFuente: TppDBPipeline;
      ppReporte: TppReport;
      SpeedButton2: TSpeedButton;
      sbtNC: TSpeedButton;
      SpeedButton3: TSpeedButton;
      ppHBCab: TppHeaderBand;
      pplblSistema: TppLabel;
      pplblTitulo: TppLabel;
      ppsvPagina: TppSystemVariable;
      ppsvFecha: TppSystemVariable;
      ppsvHora: TppSystemVariable;
      pplblPagina: TppLabel;
      pplblFecha: TppLabel;
      pplblHora: TppLabel;
      pplblGuionBase: TppLabel;
      pplblLin0: TppLabel;
      pplblLin1: TppLabel;
      ppDBDet: TppDetailBand;
      ppFBPie: TppFooterBand;
      pplblLin2: TppLabel;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppDBText1: TppDBText;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      Timer1: TTimer;
      bbtnTotales: TBitBtn;
      sbRecalculo: TSpeedButton;
      bbtnRecHon: TBitBtn;
   // Inicio HPC_201602_CXP
   // adición de botones
      sbTransfPago: TSpeedButton;
      sbRecalculoBloque: TSpeedButton;
   // Fin HPC_201602_CXP
      Procedure sbtABlClick(Sender: TObject);
      Procedure sbtCBlClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure sbtEliminarClick(Sender: TObject);
      Procedure Z2sbDetalleClick(Sender: TObject);
      Procedure ppHBCabBeforePrint(Sender: TObject);
      Procedure ppReporteBeforePrint(Sender: TObject);
      Procedure ppReportePreviewFormCreate(Sender: TObject);
      Procedure SpeedButton2Click(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure sbtNCClick(Sender: TObject);
      Procedure SpeedButton3Click(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure bbtnTotalesClick(Sender: TObject);
      Procedure RecalculaTotales2;
      procedure sbRecalculoClick(Sender: TObject);
      procedure bbtnRecHonClick(Sender: TObject);
   // Inicio HPC_201602_CXP
   // rutinas de botones
      procedure sbTransfPagoClick(Sender: TObject);
      procedure sbRecalculoBloqueClick(Sender: TObject);
   // Fin HPC_201602_CXP

   Private
      xPanel: TPanel;
      xLabel1, xLabel2, xLabel3: TLabel;
      xCont: String;
      cdsGProv: TwwClientDataSet;
      MProv: TMant;
      xTipDet: String;
      xDCPH: String;
      xDCPMOORI, xDCPMOLOC, xDCPMOEXT: double;
      xIGVPORI, xIGVPLOC, xIGVPEXT: double; //Calculo del Igv Prorrateado
      xTIGVPORI, xTIGVPLOC, xTIGVPEXT: double; // total igv
      xTotGOri, xTotGLoc, xTotGExt: double; //Total de debe sin IGV
      xDTotOri, xDTotLoc, xDTotExt: double; //Total de debe
      xPTotOri, xPTotLoc, xPTotExt: double; //Total de Gastos menos Igv Prorrateado
      xPDifIgvOri, xPDifIgvLoc, xPDifIgvExt: double; //Total de Gastos menos Igv Prorrateado
      xFac: double; //Valores del detalle de Gastos
      Procedure EliminaNotaCredito;
      Procedure EliminaProvision;
      Procedure HallaProIGV;
      Procedure HalloCXPREG(xxCia, xxDiar, xxPer, xxNreg: String);
      Procedure CreandoPanel;
   Public
    { Public declarations }
      xWhereMant: String;
      xToolCia, xTooldiario, xToolAnomm: String;
      xDifProMLOC, xDifProMEXt: Double;
      Procedure Prorrateo(xxCia, xxDiar, xxPer, xxNreg: String);
      Function AsientoCuadra: Boolean;
      Function PeriodoCuadra: Boolean;
   End;

Var
   FToolCont: TFToolCont;
   xAccesoBotones: Boolean;
// Inicio HPC_201602_CXP
   xbRecalcBloque: Boolean;
// Fin HPC_201602_CXP

// Inicio HPC_201701_CXP
   // 23/01/2017 Considera Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00
   xValorMinRta4ta : Currency;
// Fin HPC_201701_CXP

Implementation

// Inicio HPC_201602_CXP
// Se añade formulario CXP218 - Transfiere Amortizaciones y/o Cancelaciones de una Provisión a otra
Uses CxP001, CxPDM, CxP201, CxP801, CxP222, CxP223,
     CXP230, // Importación de Recibos por Honorarios Electrónicos.
     CXP218; // Transfiere Amortizaciones y/o Cancelaciones de una Provisión a otra
// Fin HPC_201602_CXP

{$R *.DFM}

Procedure TFToolCont.FormCreate(Sender: TObject);
Begin
   FEscogeCia := TFEscogeCia.create(self);
End;

Procedure TFToolCont.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMCXP.cdsReporte.close;
   FEscogeCia.Free;
End;

Procedure TFToolCont.sbtABlClick(Sender: TObject);
Var
   P, E, T, xFiltro, xtmonid: String;
   xClAuxId, xProv: String;
   xCPMtoLoc, xCPMtoExt: double;
   xCia, xPer, xDiar, xNReg: String;
   xSalir: Boolean;

// Inicio HPC_201701_CXP
// 31/01/2017 parámetros de Fecha para Considerar Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00
   wAno, wMes, wDia : Word;
   xSigue : Boolean;
// Fin HPC_201701_CXP

Begin
   If MessageDlg('ACEPTAR Movimientos' + chr(13) +
      '   ¿Esta Seguro?   ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      exit;

   Try
      screen.Cursor := crHOURGLASS;
      If FPrincipal.xTipoProv = 'P' Then
      Begin
         cdsGProv := FPrincipal.GProvision.FMant.cds2; //Provisiones
         MProv := FPrincipal.GProvision;
      End
      Else
         If FPrincipal.xTipoProv = 'N' Then
         Begin
            cdsGProv := FPrincipal.GNCredito.FMant.cds2; //Nota Credito
            MProv := FPrincipal.GNCredito;
         End
         Else
            If FPrincipal.xTipoProv = 'O' Then
            Begin
               cdsGProv := FPrincipal.GProvision.FMant.cds2; //Otras Obligaciones
               MProv := FPrincipal.GProvision;
            End;

      If Not PeriodoCuadra Then
      Begin

         If MessageDlg('Aceptara Registros Diferentes e Incompletos' + chr(13) +
            '          ¿Esta Seguro?  ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Begin
            xSalir := False;
            exit;

         End;

      End;

      cdsGprov.disablecontrols;
      cdsGProv.Close;
      cdsGProv.Open;

      If cdsGProv.RecordCount = 0 Then
      Begin
         cdsGprov.EnableControls;
         Exit;
      End;

      cdsGProv.First;

      P := cdsGProv.FieldByName('CPANOMES').AsString;

      While Not cdsGProv.EOF Do
      Begin

         T := cdsGProv.FieldByName('CPANOMES').AsString;
         E := cdsGProv.FieldByName('CPESTADO').AsString;

         If (P = T) And (E = 'I') Then
         Begin
            xCont := 'S';
            xCia := cdsGProv.FieldByName('CIAID').value;
            xPer := cdsGProv.FieldByName('CPANOMES').value;
            xDiar := cdsGProv.FieldByName('TDIARID').value;
            xNReg := cdsGProv.FieldByName('CPNOREG').value;
         /////////////////////////////////////////////////
            xClAuxId := cdsGProv.FieldByName('CLAUXID').value;
            xProv := cdsGProv.FieldByName('PROV').value;
            xCPMtoLoc := FRound(cdsGProv.FieldByName('CPMTOLOC').AsFloat, 15, 2);
            xCPMtoExt := FRound(cdsGProv.FieldByName('CPMTOEXT').AsFloat, 15, 2);
            xtmonid := cdsGProv.FieldByName('TMONID').value;
         /////////////////////////////////////////////////
            xFiltro := 'CIAID=' + '''' + xCia + '''' + ' and ' +
               'TDIARID=' + '''' + xDiar + '''' + ' and ' +
               'DCPANOMM=' + '''' + xPer + '''' + ' and ' +
               'CPNOREG=' + '''' + xNReg + '''';

            Filtracds(DMCXP.cdsDetCxP, 'SELECT * FROM CXP302 WHERE ' + xFiltro);
         /////////////////////////////////////////////////
            If Not AsientoCuadra Then
            Begin
               ShowMessage(
                  'Error:  Asiento NO Cuadra' + #13 +
                  'Compañía  : ' + cdsGProv.FieldByName('CIAID').asstring + #13 +
                  'T. Diario : ' + cdsGProv.FieldByName('TDIARID').asstring + #13 +
                  'Periodo   : ' + cdsGProv.FieldByName('CPANOMES').asstring + #13 +
                  'Registro  : ' + cdsGProv.FieldByName('CPNOREG').asstring);
               cdsGProv.Next;
               continue;
            End;

            DMCXP.CuadraAsiento;

            DMCXP.AplicaDatos(DMCXP.cdsDetCxP, 'DETCXP');

         // Inicio HPC_201701_CXP
         // 23/01/2017 Considera Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00
            If FPrincipal.GProvision.FMant.cds2.FieldByname('DOCID').AsString='02' then
            Begin
               If xValorMinRta4ta>0 then
               Begin
                  If (FPrincipal.GProvision.FMant.cds2.FieldByName('CPGRAVAD').AsFloat
                     +FPrincipal.GProvision.FMant.cds2.FieldByName('CPNOGRAV').AsFloat
                     +FPrincipal.GProvision.FMant.cds2.FieldByName('ADQ_NO_GRAV').AsFloat) > xValorMinRta4ta then
                  Begin
                     xSigue := False;

                     DecodeDate(FPrincipal.GProvision.FMant.cds2.FieldByName('CPFCMPRB').AsDateTime, wAno, wMes, wDia);

                     xSQL := 'Select CPNOREG '
                            +'  from CXP302 '
                            +' where CIAID='+quotedstr(FPrincipal.GProvision.FMant.cds2.FieldByName('CIAID').AsString)
                            +'   and DCPANOMM='+quotedstr(FPrincipal.GProvision.FMant.cds2.FieldByName('CPANOMES').AsString)
                            +'   and TDIARID='+quotedstr(FPrincipal.GProvision.FMant.cds2.FieldByName('TDIARID').AsString)
                            +'   and CPNOREG='+quotedstr(FPrincipal.GProvision.FMant.cds2.FieldByName('CPNOREG').AsString)
                            +'   and TIPDET=''I1'' ';
                     DMCXP.cdsQry.Close;
                     DMCXP.cdsQry.DataRequest(xSQL);
                     DMCXP.cdsQry.Open;
                     If DMCXP.cdsQry.RecordCount>0 then
                     Begin
                        xSigue := True;
                     End
                     Else
                     Begin
                        xSQL := 'Select FECEXON4TA '
                               +'  from TGE201 '
                               +' where CLAUXID='+quotedstr(FPrincipal.GProvision.FMant.cds2.FieldByName('CLAUXID').AsString)
                               +'   and PROV='+quotedstr(FPrincipal.GProvision.FMant.cds2.FieldByName('PROV').AsString)
                               +'   and to_char(FECEXON4TA,''YYYY'')='+quotedstr(inttostr(wAno));
                        DMCXP.cdsQry.Close;
                        DMCXP.cdsQry.DataRequest(xSQL);
                        DMCXP.cdsQry.Open;
                        If DMCXP.cdsQry.RecordCount>0 then
                        Begin
                           xSigue := True;
                        End;
                     End;

                     If not xSigue then
                     Begin
                        ShowMessage('El Proveedor no tiene Suspensión de 4ta.Categoría, regularize por el Maestro de Proveedores');
                        Exit;
                     End;
                  End;
               End;
            End;
         // Fin HPC_201701_CXP

            cdsGProv.Edit;
            cdsGProv.FieldByname('CPESTADO').Value := 'P';

            DMCXP.SaldosAuxiliar(xCia, xPer, xClAuxId, xProv, '+', xCPMtoLoc, xCPMtoExt, xTmonid);
// Inicio HPC_201803_CXP
// Se graba el registro de provisiones por pagar
            cdsGProv.ApplyUpdates(0);
// Fin HPC_201803_CXP
        /////////////////////////////////////////////////
         End
         Else
            If P <> T Then //  Compara si los periodos son iguales
            Begin
               ShowMessage(' Debe Aceptar solo Registros con periodos iguales');
               xCont := 'N';
               cdsGprov.enablecontrols;
               exit;
            End;

      // validación de  los estados
         If (E = 'P') Or (E = 'C') Then //Pendiente o Contabilizado
         Begin
            ShowMessage(' Debe Aceptar solo Movimientos Sin Aceptar y No Contabilizados');
            xCont := 'N';
            cdsGprov.EnableControls;
            Exit;
         End;
// Inicio HPC_201805_CXP
// Ajuste en la opción de Nota de Crédito
{         try
           xSQL :=     'CALL SP_CNT_REC_SAL('
           +quotedstr(FPrincipal.GProvision.FMant.cds2.FieldByName('CIAID').AsString)+','
           +quotedstr(FPrincipal.GProvision.FMant.cds2.FieldByName('TDIARID').AsString)+','
           +quotedstr(FPrincipal.GProvision.FMant.cds2.FieldByName('CPANOMES').AsString)+','
           +quotedstr(FPrincipal.GProvision.FMant.cds2.FieldByName('CPNOREG').AsString)+','
           +QuotedStr(FPrincipal.GProvision.FMant.cds2.FieldByName('DTRPORC').AsString)+')' ;
           DMCXP.DCOM1.AppServer.EjecutaSql(xSQL);
         Except
             showmessage('Error al intentar recalcular los saldos');
             exit;
         Raise;
         End;
}         
// Fin HPC_201805_CXP
         cdsGProv.Next;
      End;
      xSalir := True;

   Finally

      If xSalir Then
      Begin	
// Inicio HPC_201803_CXP
// Ajuste en la opción de Nota de Crédito
//         cdsGProv.ApplyUpdates(0);  
// Fin HPC_201803_CXP
         ShowMessage('Proceso Finalizado');
         FPrincipal.GProvision.RefreshFilter;
      End;

      cdsGprov.enablecontrols;
      screen.Cursor := crDefault;
   End;
End;

Procedure TFToolCont.sbtCBlClick(Sender: TObject);

Function Sustituir(pCadena, pEsto, pPor: String): String;
   Var
      xPos: Integer;
   Begin
      xPos := Pos(pEsto, pCadena);
      Result := '';
      While (xPos <> 0) Do
      Begin
         Result := Result + copy(pCadena, 1, xPos - 1) + pPor;
         Delete(pCadena, 1, xPos + Length(pEsto) - 1);
         xPos := Pos(pEsto, pCadena);
      End;
      Result := Result + pCadena;
   End;
Const
  // Array con los campos equivalentes de la CXP302 los cuales se reemplazarán
   xCamposR: Array[1..20, 0..1] Of String = (('CPANOMES', 'DCPANOMM'), ('PROV', 'DCPAUXID'), ('CPESTADO=''P''', 'DCPESTDO=''I'''), ('CPESTADO=''C''', 'DCPESTDO=''I'''), ('CPMTOORI', 'DCPMOORI'), ('CPMTOLOC', 'DCPMOLOC'),
      ('CPMTOEXT', 'DCPMOEXT'), ('CPCANJE', 'CANJE'), ('CPUSER', 'DCPUSER'), ('CPFREG', 'DCPFREG'), ('CPHREG', 'DCPHREG'),
      ('CPMM', 'DCPMM'), ('CPDD', 'DCPDD'), ('CPTRI', 'DCPTRI'), ('CPSEM', 'DCPSEM'), ('CPSS', 'DCPSS'),
      ('CPAATRI', 'DCPAATRI'), ('CPAASEM', 'DCPAASEM'), ('CPAASS', 'DCPAASS'), ('CPFCMPRB', 'DCPFCOM'));
  //** Array con los Campos que se eliminaran del filtro, xque no tienen equivalentes en la CXP302
   xCamposE: Array[1..32] Of String = (('PROVRUC'), ('CPFRECEP'), ('CPOCOMP'), ('CP_CONTA'), ('CPGRAVAD'), ('CPNOGRAV'), ('CPIGV'), ('CPISC'), ('CPDCTO'), ('CPSERVIC'),
      ('CPPAGORI'), ('CPPAGLOC'), ('CPPAGEXT'), ('CPSALORI'), ('CPSALLOC'), ('CPSALEXT'), ('CPFCANJE'), ('CPAAAA'), ('CTATOTAL'), ('FLAGVAR'),
      ('CPTOTOT'), ('CPIGV2'), ('CPGRAVAD2'), ('CPHMOD'), ('FLAGVAR2'), ('PROVDES'), ('CLAUXREND'), ('AUXIDREND'), ('CCBCOID'), ('BANCOID'),
      ('SITUAID'), ('CPFLAGTDOC'));
Var
   xEst: String; // Flag de Estado, Aceptados, Rechazados
   xConta, xProrateo: String; //Flag de Contabilizacion
   xIgvSN, xCia, xPer, xDiar, xNReg: String;
   xTR, xRP: Integer;
   xSql, xSqlMant: String;
Begin
   If DMCXP.wAdmin = 'G' Then
      Exit;
   If MessageDlg('Contabilizar Comprobantes' + chr(13) + ' ¿Esta Seguro?   ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then exit;
  //** VERIFICA EL TIPO DE OBLIGACION
   If FPrincipal.xTipoProv = 'P' Then
   Begin
      cdsGProv := FPrincipal.GProvision.FMant.cds2; //Provisiones
      MProv := FPrincipal.GProvision;
   End
   Else
   Begin
      If FPrincipal.xTipoProv = 'N' Then
      Begin
         cdsGProv := FPrincipal.GNCredito.FMant.cds2; //Nota Credito
         MProv := FPrincipal.GNCredito;
      End
      Else
         If FPrincipal.xTipoProv = 'O' Then
         Begin
            cdsGProv := FPrincipal.GProvision.FMant.cds2; //Otras Obligaciones
            MProv := FPrincipal.GProvision;
         End;
   End;
   xSqlMant := FPrincipal.GProvision.FMant.SQL;

   If pos('CIAID=', xSqlMant) > 0 Then
      xToolCia := copy(xSqlMant, pos('CIAID=', xSqlMant) + 7, 2);
   If pos('TDIARID=', xSqlMant) > 0 Then
      xTooldiario := copy(xSqlMant, pos('TDIARID=', xSqlMant) + 9, 2);
   If pos('CPANOMES=', xSqlMant) > 0 Then
      xToolAnomm := copy(xSqlMant, pos('CPANOMES=', xSqlMant) + 10, 6);
   If (xToolCIa = '') Then
   Begin
      showMessage('Debe de Filtrar también por Compañia');
      exit;
   End;
   If (xTooldiario = '') Then
   Begin
      showMessage('Debe de Filtrar también por Tipo de Diario');
      exit;
   End;
   If (xToolAnomm = '') Then
   Begin
      showMessage('Debe de Filtrar también por Periodo');
      exit;
   End;

   cdsGProv.filter := 'CP_CONTA<>''S'' OR CP_CONTA IS NULL';
   cdsGProv.filtered := true;
   If cdsGProv.recordcount = 0 Then
   Begin
      cdsGProv.filtered := false;
      showmessage('No existen registros a contabilizar');
      exit;
   End;

   CreandoPanel;

   xProrateo := DMCXP.DisplayDescrip('TGE101', 'PRORATEO', 'CiaID', cdsGProv.FieldByName('CIAID').Asstring);
   xIgvSN := DMCXP.DisplayDescrip('TGE101', 'IGVSN', 'CiaID', cdsGProv.FieldByName('CIAID').Asstring);
   cdsGprov.disablecontrols;
   xLabel1.caption := 'Indexando ' + IntToStr(cdsGProv.recordcount) + ' Registros de Cabecera...';
   xLabel1.refresh;
   xPanel.refresh;
   cdsGProv.IndexFieldNames := 'CIAID;CPANOMES;TDIARID;CPNOREG;CPESTADO;CP_CONTA';

   xLabel1.caption := 'Filtrando Registros del Detalle...';
   xLabel1.refresh;
   xPanel.refresh;
   xLabel1.refresh;
   xPanel.refresh;

   DMCXP.cdsDetCxP.IndexFieldNames := 'CIAID;DCPANOMM;TDIARID;CPNOREG';

   cdsGProv.First;

   xTr := 0;
   xRP := 0;
   While Not cdsGProv.EOF Do
   Begin
      xCia := cdsGProv.FieldByName('CIAID').Asstring;
      xPer := cdsGProv.FieldByName('CPANOMES').Asstring;
      xDiar := cdsGProv.FieldByName('TDIARID').Asstring;
      xNReg := cdsGProv.FieldByName('CPNOREG').Asstring;
      xEst := cdsGProv.FieldByName('CPESTADO').Asstring;
      xConta := cdsGProv.FieldByName('CP_CONTA').Asstring;
    //** se valida que el periodo no este cerrado
      If DMCXP.MesCerrado(copy(xPer, 5, 2), copy(xPer, 1, 4), xCia) Then
     //** no se visualiza mensaje
      Else
      Begin
         If ((xEst = 'P') Or (xEst = 'C')) And ((xConta = 'N') Or (xConta = '')) Then
         Begin
            If xProrateo = 'S' Then
            Begin
               If xIgvSN = '1' Then
               Begin
                  If DMCXP.cdsMovCxP.FieldByName('CPIGV2').AsFloat > 0 Then
                  Begin
                     FToolCont.Prorrateo(cdsGProv.FieldByName('CIAID').AsString,
                        cdsGProv.FieldByName('TDIARID').AsString,
                        cdsGProv.FieldByName('CPANOMES').AsString,
                        cdsGProv.FieldByName('CPNOREG').AsString);
                     xRP := xRP + 1;
                     xLabel1.caption := 'Registros a Prorrateados :' + inttostr(xRP);
                     xLabel1.refresh;
                     xPanel.refresh;
                  End;
               End
               Else
                  If xIgvSN = '2' Then
                  Begin
                     If DMCXP.cdsMovCxP.FieldByName('CPIGV').AsFloat > 0 Then
                     Begin
                        FToolCont.Prorrateo(cdsGProv.FieldByName('CIAID').AsString,
                           cdsGProv.FieldByName('TDIARID').AsString,
                           cdsGProv.FieldByName('CPANOMES').AsString,
                           cdsGProv.FieldByName('CPNOREG').AsString);
                        xLabel1.caption := 'Registros a Prorrateados :' + inttostr(xRP);
                        xLabel1.refresh;
                        xPanel.refresh;
                     End;
                  End;
            End;
            DMCXP.GeneraContab(cdsGProv.FieldByName('CIAID').AsString,
               cdsGProv.FieldByName('TDIARID').AsString,
               cdsGProv.FieldByName('CPANOMES').AsString,
               cdsGProv.FieldByName('CPNOREG').AsString,
               Self, 'C');

            xSQL := 'Update CXP301 Set CP_CONTA=' + quotedstr('S')
               + ' Where CiaID=' + quotedstr(cdsGProv.FieldByName('CIAID').AsString)
               + '  and TDIARID=' + quotedstr(cdsGProv.FieldByName('TDIARID').AsString)
               + '  and CPANOMES=' + quotedstr(cdsGProv.FieldByName('CPANOMES').AsString)
               + '  and CPNOREG=' + quotedstr(cdsGProv.FieldByName('CPNOREG').AsString)
               + '  and (CPESTADO=' + quotedstr('P') + ' OR CPESTADO =' + quotedstr('C') + ' ) ';
            Try
               DMCXP.DCOM1.AppServer.IniciaTransaccion;
               DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
               DMCXP.DCOM1.AppServer.GrabaTransaccion;
            Except
               DMCXP.DCOM1.AppServer.RetornaTransaccion;
            End;
         End;
      End;
      xTR := xTR + 1;
      xLabel2.caption := 'Total de Registros :' + inttostr(xTR);
      xLabel2.refresh;
      xPanel.refresh;
      cdsGProv.Next;
   End;

   MProv.RefreshFilter;
   cdsGprov.Enablecontrols;
   xLabel3.caption := 'TERMINO...';
   xLabel3.refresh;
   xPanel.refresh;
   xLabel1.free;
   xLabel2.free;
   xLabel3.free;
   xPanel.Free;
   cdsGProv.filtered := false;
   showmessage('Registros Contabilizados');
End;

Function TFToolCont.PeriodoCuadra: Boolean;
Var
   xA, xR, xI: integer;
   P, E, T: String;
Begin
   result := False;

   xA := 0;
   xR := 0;
   xI := 0;
   cdsGProv.First;
   P := cdsGProv.FieldByName('CPANOMES').AsString;
   E := cdsGProv.FieldByName('CPESTADO').AsString;
   While Not cdsGProv.EOF Do
   Begin
      T := cdsGProv.FieldByName('CPANOMES').AsString;

      If (P = T) And (E = 'I') Then //Si periodos son iguales
         xA := xA + 1
      Else
         If P <> T Then //  Compara si los periodos son iguales
         Begin
            Showmessage(' Debe Aceptar solo Registros con periodos iguales');
            xR := xR + 1;
            result := False;
            Exit;
         End;

        // validación de  los estados
      If (E = 'P') Or (E = 'C') Then //Pendiente  o Contabilizado
      Begin
         Showmessage(' Debe Aceptar solo Incompletos');
         xI := xI + 1;
         result := False;
         Exit;
      End;

      cdsGProv.Next;
   End;
   If (xR = 0) Or (xI = 0) Then
      result := true;
End;

Procedure TFToolCont.Prorrateo(xxCia, xxDiar, xxPer, xxNreg: String);
Var
   xPorcentaje: Array[1..100, 0..2] Of String;
   xMontoO, xMontoL, xMontoE, xValor, xValorL, xValorE, xValorO: Double;
   xZ, xRecord, xContador: Integer;
   xRegAct: TBookMark;
   xxIndex: String;
Begin
// Busqueda de Factor
   If (DMCXP.cdsCia.FieldByName('PRORATEO').AsString = 'S') Then
   Begin
      Try
         DMCXP.cdsqry3.Close;
         DMCXP.cdsQry3.ProviderName := 'dspTGE';
         DMCXP.cdsqry3.DataRequest('SELECT * FROM CXP307 WHERE CCANOMES=' + '''' + xxPer + '''	' + '');
         DMCXP.cdsqry3.Open;
         DMCXP.cdsqry3.First;
         While Not DMCXP.cdsqry3.EOf Do
         Begin
            xFac := DMCXP.cdsqry3.Fieldbyname('FACTOR').value;
            DMCXP.cdsqry3.Next;
         End;
      Except
         Raise;
      End;
   End
   Else
      xFac := 0;

   xValorO := 0;
   xTIGVPORI := 0;
   xTIGVPLOC := 0;
   xTIGVPEXT := 0;

   xxIndex := DMCXP.cdsDetCxP.IndexFieldNames;
   DMCXP.cdsDetCxP.IndexFieldNames := 'CIAID;DCPANOMM;TDIARID;CPNOREG';

   DMCXP.cdsDetCxP.SetKey;
   DMCXP.cdsDetCxP.FieldByName('CIAID').AsString := xxCia; //cdsGProv.FieldByName('CIAID').Asstring;
   DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString := xxDiar; //cdsGProv.FieldByName('TDIARID').Asstring;
   DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := xxPer; //cdsGProv.FieldByName('CPANOMES').Asstring;
   DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString := xxNReg; //cdsGProv.FieldByName('CPNOREG').Asstring;
   If DMCXP.cdsDetCxP.GotoKey Then
   Begin
      xRegAct := DMCXP.cdsDetCxP.GetBookmark;
      xValor := 0;
      xContador := 0;
      xRecord := 0;

      While (DMCXP.cdsDetCxP.FieldByName('CIAID').AsString = xxCia) And
         (DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString = xxDiar) And
         (DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString = xxPer) And
         (DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString = xxNReg) And (Not DMCXP.cdsDetCxP.Eof) Do
      Begin
         If (DMCXP.CdsDetCxP.fieldbyname('TIPDET').Asstring = 'MG') Or
            (DMCXP.CdsDetCxP.fieldbyname('TIPDET').Asstring = 'NG') Then
         Begin
            xValor := xValor + DMCXP.CdsDetCxP.fieldbyname('DCPMOORI').AsFloat;
            xRecord := xRecord + 1;
            xContador := xContador + 1;
        //** se Asigna el Porcentaje que le corresponde a caja monto
            xPorcentaje[xContador, 0] := DMCXP.CdsDetCxP.fieldbyname('CUENTAID').AsString;
            xPorcentaje[xContador, 2] := DMCXP.CdsDetCxP.fieldbyname('CCOSID').AsString;
         End;
         DMCXP.cdsDetCxP.next;
      End;
      DMCXP.cdsDetCxP.GotoBookmark(xRegAct);
      xContador := 0;
      While (DMCXP.cdsDetCxP.FieldByName('CIAID').AsString = xxCia) And
         (DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString = xxDiar) And
         (DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString = xxPer) And
         (DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString = xxNReg) And (Not DMCXP.cdsDetCxP.Eof) Do
      Begin
         If (DMCXP.CdsDetCxP.fieldbyname('TIPDET').Asstring = 'MG') Or
            (DMCXP.CdsDetCxP.fieldbyname('TIPDET').Asstring = 'NG') Then
         Begin
            xContador := xContador + 1;
            xPorcentaje[xContador, 1] := FloatToStrF((100 * DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat) / xValor, ffFixed, 15, 2);
         End;
         DMCXP.CdsDetCxP.next;
      End;
      DMCXP.cdsDetCxP.GotoBookmark(xRegAct);

    //** hallo el total sin IGV de todos los Montos Grabados
      While (DMCXP.cdsDetCxP.FieldByName('CIAID').AsString = xxCia) And
         (DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString = xxDiar) And
         (DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString = xxPer) And
         (DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString = xxNReg) And (Not DMCXP.cdsDetCxP.Eof) Do
      Begin
         xTipDet := DMCXP.CdsDetCxP.fieldbyname('TIPDET').Asstring;
         xDCPH := DMCXP.CdsDetCxP.fieldbyname('DCPDH').Asstring;
         xDCPMOORI := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         xDCPMOLOC := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat, 15, 2);
         xDCPMOEXT := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat, 15, 2);

       //** CARGA EL TOTAL
         If DMCXP.CdsDetCxP.fieldbyname('TIPDET').Asstring = 'TO' Then
         Begin
            xValorO := FRound(xValorO + FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOORI').AsFloat, 15, 2), 15, 2);
            xValorL := FRound(xValorL + FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOLOC').AsFloat, 15, 2), 15, 2);
            xValorE := FRound(xValorE + FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOEXT').AsFloat, 15, 2), 15, 2);
         End;

         If DMCXP.CdsDetCxP.fieldbyname('TIPDET').Asstring = 'MN' Then
         Begin
            xValorO := FRound(xValorO - FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOORI').AsFloat, 15, 2), 15, 2);
            xValorL := FRound(xValorL - FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOLOC').AsFloat, 15, 2), 15, 2);
            xValorE := FRound(xValorE - FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOEXT').AsFloat, 15, 2), 15, 2);
         End;

       // cuando es Provision
         If FPrincipal.xTipoProv = 'P' Then
         Begin
            If xDCPH = 'H' Then //Detalle del Haber
            Begin
            //Total del Debe
               xDTotORI := FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOORI').AsFloat, 15, 2); //1180
               xDTotLOC := FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOLOC').AsFloat, 15, 2);
               XDTotEXT := FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOEXT').AsFloat, 15, 2);
            End;
            If xDCPH = 'D' Then //Detalle del Debe
               If (xTipDet = 'I3') Or (xTipDet = 'I1') Then
                  HallaProIGV
         End;

       // cuando es N.C.
         If FPrincipal.xTipoProv = 'N' Then
         Begin
            If xDCPH = 'D' Then //Detalle del Haber
            Begin
           //Total del Debe
               xDTotORI := FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOORI').AsFloat, 15, 2); //1180
               xDTotLOC := FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOLOC').AsFloat, 15, 2);
               XDTotEXT := FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOEXT').AsFloat, 15, 2);
            End;
            If xDCPH = 'H' Then //Detalle del Debe
               If (xTipDet = 'I3') Or (xTipDet = 'I1') Then
                  HallaProIGV;
         End;
         DMCXP.cdsDetCxP.edit;
         DMCXP.cdsDetCxP.fieldbyname('DCPHREG').value := Time;
         DMCXP.cdsDetCxP.fieldbyname('DCPFREG').value := Date;

         DMCXP.CdsDetCxP.next;
      End;
     //**
      DMCXP.cdsDetCxP.GotoBookmark(xRegAct);
   End
   Else
      Exit;

   //Inicializacion de Totales
   xDTotOri := 0.00;
   xDTotLoc := 0.00;
   xDTotExt := 0.00;
   xTotGOri := 0.00;
   xTotGLoc := 0.00;
   xTotGExt := 0.00;

    //** 31/08/2001 - pjsv, Se halla los montos prorrateados por cada 'MG'
   xContador := 0;
   xMontoO := 0;
   xZ := 0;
   DMCXP.cdsDetCxP.GotoBookmark(xRegAct);
   While (DMCXP.cdsDetCxP.FieldByName('CIAID').AsString = xxCia) And
      (DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString = xxDiar) And
      (DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString = xxPer) And
      (DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString = xxNReg) And (Not DMCXP.cdsDetCxP.Eof) Do
   Begin
      xTipDet := DMCXP.CdsDetCxP.fieldbyname('TIPDET').Asstring;
       // cuando es Provision o N.C., el proceso es igual
      If (FPrincipal.xTipoProv = 'P') Or (FPrincipal.xTipoProv = 'N') Then
         If (xTipDet = 'MG') Or (xTipDet = 'NG') Then
         Begin
          //** solo el último registro se hallará por diferencia
            xZ := xZ + 1;
            If xRecord > xZ Then
            Begin
            //Actualizacion Del IGV Prorrateado en Detalle
//            For xContador := 1 to 9 do
               For xContador := 1 To DMCXP.cdsDetCxP.recordcount + 2 Do // CIM  17/06/2002
               Begin
                  If (xPorcentaje[xContador, 0] = DMCXP.CdsDetCxP.fieldbyname('CUENTAID').AsString) And
                     (xPorcentaje[xContador, 2] = DMCXP.CdsDetCxP.fieldbyname('CCOSID').AsString) Then
                  Begin
                     DMCXP.cdsDetCxP.edit;
                     DMCXP.CdsDetCxP.fieldbyname('CPPRORORI').AsFloat := FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOORI').AsFloat +
                        ((xPDifIgvOri * StrToFloat(xPorcentaje[xContador, 1])) / 100), 15, 2);
                     DMCXP.CdsDetCxP.fieldbyname('CPPRORMOLOC').AsFloat := FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOLOC').AsFloat +
                        ((xPDifIgvLoc * StrToFloat(xPorcentaje[xContador, 1])) / 100), 15, 2);
                     DMCXP.CdsDetCxP.fieldbyname('CPPRORMOEXT').AsFloat := FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOEXT').AsFloat +
                        ((xPDifIgvExt * StrToFloat(xPorcentaje[xContador, 1])) / 100), 15, 2);
                     DMCXP.cdsDetCxP.fieldbyname('DCPHREG').value := Time;
                     DMCXP.cdsDetCxP.fieldbyname('DCPFREG').value := Date;
                     xMontoO := xMontoO + DMCXP.CdsDetCxP.fieldbyname('CPPRORORI').AsFloat;
                     xMontoL := xMontoL + DMCXP.CdsDetCxP.fieldbyname('CPPRORMOLOC').AsFloat;
                     xMontoE := xMontoE + DMCXP.CdsDetCxP.fieldbyname('CPPRORMOEXT').AsFloat;
                     break;
                  End;
               End;
            End
            Else
            Begin
               DMCXP.cdsDetCxP.edit;
               DMCXP.CdsDetCxP.fieldbyname('CPPRORORI').AsFloat := FRound((xValorO - xTIGVPORI) - xMontoO, 15, 2);
               DMCXP.CdsDetCxP.fieldbyname('CPPRORMOLOC').AsFloat := FRound((xValorL - xTIGVPLOC) - xMontoL, 15, 2);
               DMCXP.CdsDetCxP.fieldbyname('CPPRORMOEXT').AsFloat := FRound((xValorE - xTIGVPEXT) - xMontoE, 15, 2);
               DMCXP.cdsDetCxP.fieldbyname('DCPHREG').value := Time;
               DMCXP.cdsDetCxP.fieldbyname('DCPFREG').value := Date;
            End;
         End;
      DMCXP.CdsDetCxP.next;
   End;
   DMCXP.cdsDetCxP.FreeBookmark(xRegAct);
   DMCXP.AplicaDatos(DMCXP.cdsDetCxP, 'DetCxP');

   DMCXP.cdsDetCxP.IndexFieldNames := xxIndex;

End;

Function TFToolCont.AsientoCuadra: Boolean;
Var
   xTotDebe, xTotHaber: double;
   xCampo: String;
Begin
   Result := False;
   xTotDebe := 0;
   xTotHaber := 0;
   If cdsGProv.FieldByName('TMONID').value = DMCXP.wTMonLoc Then
      xCampo := 'DCPMOLOC'
   Else
      xCampo := 'DCPMOEXT';

   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.Eof Do
   Begin
      If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
         xTotDebe := xTotDebe + FRound(DMCXP.cdsDetCxP.Fieldbyname(xCampo).Value, 15, 2)
      Else
      Begin
         xTotHaber := xTotHaber + FRound(DMCXP.cdsDetCxP.Fieldbyname(xCampo).Value, 15, 2);
      End;
      DMCXP.cdsDetCxP.Next;
   End;
   DMCXP.cdsDetCxP.First;
   DMCXP.cdsDetCxP.EnableControls;

   If FRound(xTotDebe, 15, 2) = FRound(xTotHaber, 15, 2) Then
      Result := True;
End;

Procedure TFToolCont.sbtEliminarClick(Sender: TObject);
Begin
   DMCXP.wModo := 'M';
// Inicio HPC_201602_CXP
// Modifica Condicional de acuerdo al Tipo de Documento
   {
   If xControlFec(FPrincipal.GProvision.FMant.cds2.fieldbyname('CIAID').AsString,
                  FPrincipal.GProvision.FMant.cds2.fieldbyname('CPFCMPRB').AsDateTime) = False Then
      Exit;
   }
// Fin HPC_201602_CXP

   If FPrincipal.xTipoProv = 'P' Then
   Begin
// Inicio HPC_201602_CXP
// Modifica Condicional de acuerdo al Tipo de Documento
      If xControlFec(FPrincipal.GProvision.FMant.cds2.fieldbyname('CIAID').AsString,
                     FPrincipal.GProvision.FMant.cds2.fieldbyname('CPFCMPRB').AsDateTime) = False Then
         Exit;
// Fin HPC_201602_CXP
      cdsGProv := FPrincipal.GProvision.FMant.cds2; //Provisiones
      If Not DMCXP.Accesos_a_Registros(cdsGProv.fieldbyname('CPUSER').AsString) Then
         Exit;
      MProv := FPrincipal.GProvision;
      EliminaProvision;
   End
   Else
      If FPrincipal.xTipoProv = 'N' Then
      Begin
   // Inicio HPC_201602_CXP
   // Modifica Condicional de acuerdo al Tipo de Documento
         If xControlFec(FPrincipal.GNCredito.FMant.cds2.fieldbyname('CIAID').AsString,
                        FPrincipal.GNCredito.FMant.cds2.fieldbyname('CPFCMPRB').AsDateTime) = False Then
            Exit;
         cdsGProv := FPrincipal.GNCredito.FMant.cds2; //Nota Credito
         If Not DMCXP.Accesos_a_Registros(cdsGProv.fieldbyname('CPUSER').AsString) Then
            Exit;
         MProv := FPrincipal.GNCredito;
         //EliminaNotaCredito;
         EliminaProvision;
   // Fin HPC_201602_CXP
      End
      Else
         If FPrincipal.xTipoProv = 'O' Then
         Begin
      // Inicio HPC_201602_CXP
      // Modifica Condicional de acuerdo al Tipo de Documento
            If xControlFec(FPrincipal.GProvision.FMant.cds2.fieldbyname('CIAID').AsString,
                           FPrincipal.GProvision.FMant.cds2.fieldbyname('CPFCMPRB').AsDateTime) = False Then
               Exit;
      // Fin HPC_201602_CXP
            cdsGProv := FPrincipal.GProvision.FMant.cds2; //Otras Obligaciones
            If Not DMCXP.Accesos_a_Registros(cdsGProv.fieldbyname('CPUSER').AsString) Then
               Exit;
            MProv := FPrincipal.GProvision;
         End;
   cdsGprov.EnableControls;
End;

Procedure TFToolCont.EliminaNotaCredito;
Var
   xWhere: String;
   xSQL,
      xMes,
      xAno: String;

Begin
   If Application.MessageBox('¿Confirme Eliminación?',
      'Eliminar',
      MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK Then
      Exit;

    //comprobación sobre Notas der crédito
   If cdsGProv.FieldByName('CPESTADO').AsString = 'E' Then
   Begin
      Raise Exception.create('No se puede Eliminar, pues la Nota de Crédito' + #13 +
         'ya se encuentra Eliminada');
   End;

   If cdsGProv.FieldByName('CP_CONTA').AsString = 'S' Then
   Begin
      Raise Exception.create('No se puede Eliminar, pues la Nota de Crédito' + #13 +
         'ya se encuentra contabilizada');
   End;
   xWhere := ' CIAID    = ''' + cdsGProv.fieldbyname('CIAID').AsString + ''' ' +
      'AND TCANJEID  = ''NC'' ' +
      'AND CCPCANJE  = ''' + cdsGProv.fieldbyname('CPCANJE').AsString + ''' ';

   If DMCXP.RecuperarDatos('CXP304', '*', xWhere) Then
   Begin
   // Realizar Comprobaciones sobre documentos subyacentes
      With DMCXP.cdsUltTGE Do
      Begin
         First;
         While Not Eof Do
         Begin
            xSQL := 'SELECT * FROM CXP301 ';
            xWhere := ' WHERE CIAID       = ''' + fieldbyname('CIAID').AsString + ''' ' +
               'AND DOCID   = ''' + fieldbyname('DOCID').AsString + ''' ' +
               'AND CPSERIE = ''' + fieldbyname('CPSERIE').AsString + ''' ' +
               'AND CPNODOC = ''' + fieldbyname('CPNODOC').AsString + ''' ' +
               'AND CLAUXID = ''' + fieldbyname('CLAUXID').AsString + ''' ' +
               'AND CPESTADO <> ''E'' ' +
               'AND PROV    = ''' + fieldbyname('PROV').AsString + ''' ';
            xSQL := xSQL + xWhere;
            DMCXP.cdsqry.Close;
            DMCXP.cdsQry.DataRequest(xSQL);
            DMCXP.cdsQry.Open;

            If Not DMCXP.cdsQry.FieldByName('CPPAGLOC').IsNull Then
            Begin
               If DMCXP.cdsQry.FieldByName('CPPAGLOC').AsFloat <> 0 Then
               Begin
                   //poner código que comprueba si la unica cancelación es de la nota de crédito
                  If (FieldByName('DCDMOLOC').AsFloat <> DMCXP.cdsqry.FieldByName('CPPAGLOC').AsFloat) And
                     (FieldByName('DCDMOEXT').AsFloat <> DMCXP.cdsqry.FieldByName('CPPAGEXT').AsFloat) Then
                     Raise Exception.create('No se puede Eliminar, pues la Provisión' + #13 +
                        'ya tiene Cancelaciones')
               End
               Else
                  If DMCXP.cdsQry.FieldByName('CPSALLOC').AsFloat <> DMCXP.cdsQry.FieldByName('CPMTOLOC').AsFloat Then
                     Raise Exception.create('No se puede Eliminar, Debe Anular ' + #13 +
                        'la Cancelación Pendiente en Caja');
            End
            Else
               If DMCXP.cdsQry.FieldByName('CPSALLOC').AsFloat <> DMCXP.cdsQry.FieldByName('CPMTOLOC').AsFloat Then
                  Raise Exception.create('No se puede Eliminar, Debe Anular ' + #13 +
                     'la Cancelación Pendiente en Caja');

            Next;
         End; //del while
      End; //del with

       //Aqui empieza reversión de documentos afectos a nota de credito
      With DMCXP.cdsUltTGE Do
      Begin
         First;
         While Not Eof Do
         Begin
            xSQL := 'SELECT * FROM CXP301 ';
            xWhere := ' WHERE CIAID       = ''' + fieldbyname('CIAID').AsString + ''' ' +
               'AND DOCID   = ''' + fieldbyname('DOCID').AsString + ''' ' +
               'AND CPSERIE = ''' + fieldbyname('CPSERIE').AsString + ''' ' +
               'AND CPNODOC = ''' + fieldbyname('CPNODOC').AsString + ''' ' +
               'AND CLAUXID = ''' + fieldbyname('CLAUXID').AsString + ''' ' +
               'AND CPESTADO <> ''E'' ' +
               'AND PROV    = ''' + fieldbyname('PROV').AsString + ''' ';
            xSQL := xSQL + xWhere;
            DMCXP.cdsGrab.Close;
            DMCXP.cdsGrab.DataRequest(xSQL);
            DMCXP.cdsGrab.Open;
            DMCXP.cdsGrab.Edit;

            If (cdsGProv.FieldByName('CPESTADO').AsString = 'C') Then
            Begin
               DMCXP.cdsgrab.FieldByName('CPPAGLOC').AsFloat := DMCXP.cdsgrab.FieldByName('CPPAGLOC').AsFloat -
                  DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
               DMCXP.cdsgrab.FieldByName('CPPAGEXT').AsFloat := DMCXP.cdsgrab.FieldByName('CPPAGEXT').AsFloat -
                  DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
            End;

            DMCXP.cdsgrab.FieldByName('CPSALLOC').AsFloat := DMCXP.cdsgrab.FieldByName('CPSALLOC').AsFloat +
               DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
            DMCXP.cdsgrab.FieldByName('CPSALEXT').AsFloat := DMCXP.cdsgrab.FieldByName('CPSALEXT').AsFloat +
               DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;

            If DMCXP.cdsGrab.fieldbyname('TMONID').AsString = DMCXP.wTMonLoc Then
            Begin
               DMCXP.cdsgrab.FieldByName('CPPAGORI').AsFloat := DMCXP.cdsgrab.FieldByName('CPPAGLOC').AsFloat;
               DMCXP.cdsgrab.FieldByName('CPSALORI').AsFloat := DMCXP.cdsgrab.FieldByName('CPSALLOC').AsFloat;
            End
            Else
            Begin
               DMCXP.cdsgrab.FieldByName('CPPAGORI').AsFloat := DMCXP.cdsgrab.FieldByName('CPPAGEXT').AsFloat;
               DMCXP.cdsgrab.FieldByName('CPSALORI').AsFloat := DMCXP.cdsgrab.FieldByName('CPSALEXT').AsFloat;
            End;
            If DMCXP.cdsGrab.FieldByName('CPESTADO').AsString = 'C' Then
               DMCXP.cdsGrab.FieldByName('CPESTADO').AsString := 'P';
            DMCXP.cdsgrab.Post;
            DMCXP.AplicaDatos(DMCXP.cdsgrab, '');

            Next;
         End; //del while
      End; //del with
   End; //del if

    //procedimientos de Eliminación
    //I. Reversión de Saldos en tge401

   DMCXP.SaldosAuxiliar(cdsGProv.fieldbyname('CIAID').AsString, cdsGProv.fieldbyname('CPANOMES').AsString,
      cdsGProv.FieldByName('CLAUXID').AsString, cdsGProv.FieldByName('PROV').AsString, '+',
      cdsGProv.FieldByName('CPMTOLOC').AsFloat, cdsGProv.FieldByName('CPMTOEXT').AsFloat,
      cdsGProv.FieldByName('TMONID').AsString);

    //III. Cambio del Flag en cxp301   
// Inicio HPC_201412_CXP
   xSQL := 'UPDATE CXP301 SET CPESTADO = ''E'' ';
//   ,CPNOREG=' + quotedstr('E' + copy(cdsGProv.fieldbyname('CPNOREG').AsString,2,cdsGProv.fieldbyname('CPNOREG').Size)) + ' ';
// Fin HPC_201412_CXP
   xSQL := xSQL + ' WHERE CIAID    = ' + '''' + cdsGProv.fieldbyname('CIAID').AsString + '''' + ' AND '
      + ' CPANOMES = ' + '''' + cdsGProv.fieldbyname('CPANOMES').AsString + '''' + ' AND '
      + ' TDIARID  = ' + '''' + cdsGProv.fieldbyname('TDIARID').AsString + '''' + ' AND '
      + ' CPNOREG  = ' + '''' + cdsGProv.fieldbyname('CPNOREG').AsString + '''';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   cdsGProv.edit;
   cdsGProv.fieldbyname('CPESTADO').AsString := 'E';
   cdsGProv.Post;
// Inicio HPC_201412_CXP
   xSQL := 'UPDATE CXP302 SET DCPESTDO = ''E'' ';
//   , CPNOREG=' + quotedstr('E' + copy(cdsGProv.fieldbyname('CPNOREG').AsString,2,cdsGProv.fieldbyname('CPNOREG').Size)) + ' ';
// Fin HPC_201412_CXP
   xSQL := xSQL + ' WHERE CIAID    = ''' + cdsGProv.fieldbyname('CIAID').AsString + ''' AND '
      + ' DCPANOMM = ''' + cdsGProv.fieldbyname('CPANOMES').AsString + ''' AND '
      + ' TDIARID  = ''' + cdsGProv.fieldbyname('TDIARID').AsString + ''' AND '
      + ' CPNOREG  = ''' + cdsGProv.fieldbyname('CPNOREG').AsString + '''';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
End;

Procedure TFToolCont.EliminaProvision;
Var
   xSQL, xMes, xAno,
      xNmes, xtmonid, ssql, sSigno: String;
   iX: integer;
   xsCompaniaOPago: String;
Begin
// Inicio HPC_201406_CXP
   If Application.MessageBox('¿Confirme Eliminación?',
      'Eliminar',
      MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK Then
      Exit;

// Inicio HPC_201413_CXP
// realizará la búsqueda por Cia + tipoDiario + AñoMes + NroRegistro
{
   xSQL := 'select * from CXP301 '
         + ' Where CIAID = ' + quotedstr(cdsGProv.fieldbyname('CIAID').AsString)
         + '   and CLAUXID = ' + quotedstr(cdsGProv.fieldbyname('CLAUXID').AsString)
         + '   and PROV = ' + quotedstr(cdsGProv.fieldbyname('PROV').AsString)
         + '   and DOCID = ' + quotedstr(cdsGProv.fieldbyname('DOCID').AsString)
         + '   and CPSERIE = ' + quotedstr(cdsGProv.fieldbyname('CPSERIE').AsString)
         + '   and CPNODOC = ' + quotedstr(cdsGProv.fieldbyname('CPNODOC').AsString);
}
   xSQL := 'select * from CXP301 '
         + ' Where CIAID = ' + quotedstr(cdsGProv.fieldbyname('CIAID').AsString)
         + '   and TDIARID = ' + quotedstr(cdsGProv.fieldbyname('TDIARID').AsString)
         + '   and CPANOMES = ' + quotedstr(cdsGProv.fieldbyname('CPANOMES').AsString)
         + '   and CPNOREG = ' + quotedstr(cdsGProv.fieldbyname('CPNOREG').AsString);
// Fin HPC_201413_CXP

   cdsGProv.Close;
   cdsGProv.DataRequest(xSQL);
   cdsGProv.Open;

   If cdsGProv.FieldByName('CPESTADO').AsString = 'E' Then
   Begin
      Raise Exception.create('No se puede Eliminar, pues la Provisión' + #13 +
         'ya se encuentra Eliminada');
   End;

   If cdsGProv.FieldByName('CP_CONTA').AsString = 'S' Then
   Begin
      Raise Exception.create('No se puede Eliminar, pues la Provisión' + #13 +
         'ya se encuentra contabilizada');
   End;

// Inicio HPC_201602_CXP
// retira validacion de Saldo vs Monto
   If Not cdsGProv.FieldByName('CPPAGLOC').IsNull Then
   Begin
      {
      If cdsGProv.FieldByName('CPPAGLOC').AsFloat <> 0 Then
         Raise Exception.create('No se puede Eliminar, pues la Provisión' + #13 +
            'ya tiene Cancelaciones')
      Else
         If cdsGProv.FieldByName('CPSALLOC').AsFloat <> cdsGProv.FieldByName('CPMTOLOC').AsFloat Then
            Raise Exception.create('No se puede Eliminar, Debe Anular ' + #13 +
               'la Cancelación Pendiente en Caja');
      }
      If cdsGProv.FieldByName('CPPAGLOC').AsFloat <> 0 Then
         Raise Exception.create('No se puede Eliminar, pues la Provisión' + #13 +
            'ya tiene Cancelaciones');
   End;
   {
   Else
      If cdsGProv.FieldByName('CPSALLOC').AsFloat <> cdsGProv.FieldByName('CPMTOLOC').AsFloat Then
         Raise Exception.create('No se puede Eliminar, Debe Anular ' + #13 +
            'la Cancelación Pendiente en Caja');
   }
// Fin HPC_201602_CXP

   If cdsGProv.FieldByName('CPESTADO').AsString = 'A' Then
   Begin
      If MessageDlg('Provisión está ANULADA se cambiará estado a ELIMINADO' + chr(13)
                  + ' ¿Desea continuar? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Exit;
   End;


// Validar que no se seleccione un documento cancelado.
// Validar en Detalle de Orden de Pago si el documento esta siendo usado
   xSQL := 'select A.CIAID, A.NUMERO, A.CLAUXID, A.AUXID, A.DOCID, A.CPSERIE, A.CPNODOC, '
         + '       B.ESTADO, B.FECHA, C.CIADES '
         + '  from CXP_ORD_PAG_DET A, CXP_ORD_PAG_CAB B, TGE101 C '
         + ' where A.CIAID = ' + quotedstr(cdsGProv.fieldbyname('CIAID').AsString)
         + '   and A.CLAUXID = ' + quotedstr(cdsGProv.fieldbyname('CLAUXID').AsString)
         + '   and A.AUXID = ' + quotedstr(cdsGProv.fieldbyname('PROV').AsString)
         + '   and A.DOCID = ' + quotedstr(cdsGProv.fieldbyname('DOCID').AsString)
         + '   and A.CPSERIE = ' + quotedstr(cdsGProv.fieldbyname('CPSERIE').AsString)
         + '   and A.CPNODOC = ' + quotedstr(cdsGProv.fieldbyname('CPNODOC').AsString)
         + '   and A.CIAID = B.CIAID(+) AND A.NUMERO = B.NUMERO(+) '
         + '   and NOT nvl(B.ESTADO,''I'')=''A'' '
         + '   and A.CIAID=C.CIAID(+)';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   If DMCXP.cdsQry.Recordcount > 0 Then
   Begin
      MessageDlg('No se puede ELIMINAR documento, esta registrado en :' + chr(13)
                +'Compañía: ' + DMCXP.cdsQry.FieldByName('CIADES').AsString + '  /  '
                +'Orden de Pago: ' + DMCXP.cdsQry.FieldByName('NUMERO').AsString + '  /  '
                +'Fecha : ' + DMCXP.cdsQry.FieldByName('FECHA').AsString,
         mtWarning, [mbOK], 0);
      Exit;
   End;

   xSQL := 'Select CPESTADO, CP_CONTA, CPMTOLOC, CPPAGLOC, CPSALLOC '
         + '  from CXP301 '
         + ' where CIAID = ' + quotedstr(cdsGProv.fieldbyname('CIAID').AsString)
         + '   and CPANOMES = ' + quotedstr(cdsGProv.fieldbyname('CPANOMES').AsString)
         + '   and TDIARID = ' + quotedstr(cdsGProv.fieldbyname('TDIARID').AsString)
         + '   and CPNOREG = ' + quotedstr(cdsGProv.fieldbyname('CPNOREG').AsString);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;

   If DMCXP.cdsQry.FieldByName('CPESTADO').AsString = 'C' Then
   Begin
      Raise Exception.create('No se puede Eliminar, pues la Provisión ya se encuentra Cancelada');
   End;

   If DMCXP.cdsQry.FieldByName('CPESTADO').AsString = 'E' Then
   Begin
      Raise Exception.create('No se puede Eliminar, pues la Provisión ya se encuentra Eliminada');
   End;

   If DMCXP.cdsQry.FieldByName('CP_CONTA').AsString = 'S' Then
   Begin
      Raise Exception.create('No se puede Eliminar, pues la Provisión ya se encuentra contabilizada');
   End;

// Inicio HPC_201602_CXP
// retira validacion de Saldo vs Monto
   If Not DMCXP.cdsQry.FieldByName('CPPAGLOC').IsNull Then
   Begin
      {
      If DMCXP.cdsQry.FieldByName('CPPAGLOC').AsFloat <> 0 Then
         Raise Exception.create('No se puede Eliminar, pues la Provisión' + #13 +
            'ya tiene Cancelaciones')
      Else
         If DMCXP.cdsQry.FieldByName('CPSALLOC').AsFloat <> DMCXP.cdsQry.FieldByName('CPMTOLOC').AsFloat Then
            Raise Exception.create('No se puede Eliminar, Debe Anular ' + #13 +
               'la Cancelación Pendiente en Caja');
      }
      If DMCXP.cdsQry.FieldByName('CPPAGLOC').AsFloat <> 0 Then
         Raise Exception.create('No se puede Eliminar, pues la Provisión' + #13 +
            'ya tiene Cancelaciones');
   End;
   {
   Else
      If DMCXP.cdsQry.FieldByName('CPSALLOC').AsFloat <> DMCXP.cdsQry.FieldByName('CPMTOLOC').AsFloat Then
         Raise Exception.create('No se puede Eliminar, Debe Anular ' + #13 +
            'la Cancelación Pendiente en Caja');
   }
// Fin HPC_201602_CXP

// asignación de Control Transaccional para la Eliminación de la Provisión por Pagar
   DMCXP.DCOM1.AppServer.IniciaTransaccion;

// No hay un control operativo de los Saldos de Proveedores en DM
  {
   If (cdsGProv.fieldbyname('CPESTADO').asstring = 'P') Then
   Begin
      sSigno := '-';
      If DMCXP.DisplayDescrip2('dspTGE', 'TGE110', 'DOCID,DOCTIPREG', 'DOCID=' + quotedstr(cdsGProv.fieldbyname('DOCID').AsString), 'DOCTIPREG') = 'NC' Then
         sSigno := '+'
      Else
         sSigno := '-';
      DMCXP.SaldosAuxiliar(cdsGProv.fieldbyname('CIAID').AsString, cdsGProv.fieldbyname('CPANOMES').AsString,
         cdsGProv.fieldbyname('CLAUXID').AsString, cdsGProv.fieldbyname('PROV').AsString, sSigno,
         cdsGProv.fieldbyname('CPMTOLOC').AsFloat, cdsGProv.fieldbyname('CPMTOEXT').AsFloat, cdsGProv.fieldbyname('TMONID').AsString);
   End;
   }
// Inicio HPC_201406_CXP
// CPNOREG='+quotedstr(copy(cdsGProv.fieldbyname('CPNOREG').AsString,1,cdsGProv.fieldbyname('CPNOREG').Size-1)+'E')+','
// Actualiza estado Eliminado en Provisión por Pagar
   xSQL := 'update CXP301 '
         + '   set CPESTADO = ' + quotedstr('E') + ', '
// Inicio HPC_201412_CXP
//         + '       CPNOREG='+quotedstr('E' + copy(cdsGProv.fieldbyname('CPNOREG').AsString,2,cdsGProv.fieldbyname('CPNOREG').Size))+','
// Fin HPC_201412_CXP
         + '       CPUSER =' + quotedstr(DMCXP.wUsuario) + ','
         + '       CPFREG = trunc(sysdate), '
         + '       CPHREG = sysdate '
         + ' where CIAID = ' + quotedstr(cdsGProv.fieldbyname('CIAID').AsString)
         + '   and CPANOMES = ' + quotedstr(cdsGProv.fieldbyname('CPANOMES').AsString)
         + '   and TDIARID = ' + quotedstr(cdsGProv.fieldbyname('TDIARID').AsString)
         + '   and CPNOREG = ' + quotedstr(cdsGProv.fieldbyname('CPNOREG').AsString);
   try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se pudo actualizar el Estado de la Provisión en la eliminación');
      exit;
   end;
   cdsGProv.edit;
   cdsGProv.fieldbyname('CPESTADO').AsString := 'E';
   cdsGProv.Post;

   xSQL := 'UPDATE CXP302 '
         + '   SET DCPESTDO = ' + quotedstr('E') + ','
// Inicio HPC_201412_CXP
//         + '       CPNOREG='+quotedstr('E' + copy(cdsGProv.fieldbyname('CPNOREG').AsString,2,cdsGProv.fieldbyname('CPNOREG').Size))+','
// Fin HPC_201412_CXP
         + '       DCPUSER=' + quotedstr(DMCXP.wUsuario) + ','
         + '       DCPFREG= trunc(sysdate), '
         + '       DCPHREG= sysdate '
         + ' WHERE CIAID = ' + quotedstr(cdsGProv.fieldbyname('CIAID').AsString)
         + '   AND DCPANOMM = ' + quotedstr(cdsGProv.fieldbyname('CPANOMES').AsString)
         + '   AND TDIARID  = ' + quotedstr(cdsGProv.fieldbyname('TDIARID').AsString)
         + '   AND CPNOREG  = ' + quotedstr(cdsGProv.fieldbyname('CPNOREG').AsString);
   try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se pudo actualizar el Estado del Detalle de la Provisión en la eliminación');
      exit;
   end;
// Fin HPC_201406_CXP
// revertir la orden de Pago de SSGG
   xSQL := 'Select * '
          +'  from LOG130 '
          + '  WHERE LOG130.CPCIAID = ' + QuotedStr(cdsGProv.fieldbyname('CIAID').AsString)
          + '    AND LOG130.CPANOMES = ' + QuotedStr(cdsGProv.fieldbyname('CPANOMES').AsString)
          + '    AND LOG130.TDIARID = ' + QuotedStr(cdsGProv.fieldbyname('TDIARID').AsString)
          + '    AND LOG130.CPNOREG = ' + QuotedStr(cdsGProv.fieldbyname('CPNOREG').AsString);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xSQL);
   DMCXP.cdsQry.Open;
   if DMCXP.cdsQry.Recordcount> 0 then
   Begin
      If cdsGProv.fieldbyname('CIAID').AsString = '04' Then
      Begin
         xsCompaniaOPago := cdsGProv.fieldbyname('CIAID').AsString;
      End
      Else
      Begin
         xsCompaniaOPago := '02';
      End;

      xSQL := ' Update LOG130 '
            + '    set LOG130.CPESTTRA = ' + QuotedStr('ACEPTADO') + ', '
            + '        LOG130.CPCIAID = ' + QuotedStr(xsCompaniaOPago) + ', '
            + '        LOG130.CPFECTRA = NULL, '
            + '        LOG130.CPUSUTRA = NULL,'
            + '        LOG130.CPANOMES = NULL, '
            + '        LOG130.TDIARID = NULL, '
            + '        LOG130.CPNOREG = NULL, '
            + '        LOG130.USUMOD = ' + QuotedStr(DMCXP.wUsuario) + ', '
            + '        LOG130.FECMOD = sysdate '
            + '  where LOG130.CPCIAID = ' + QuotedStr(cdsGProv.fieldbyname('CIAID').AsString)
            + '    and LOG130.CPANOMES = ' + QuotedStr(cdsGProv.fieldbyname('CPANOMES').AsString)
            + '    and LOG130.TDIARID = ' + QuotedStr(cdsGProv.fieldbyname('TDIARID').AsString)
            + '    and LOG130.CPNOREG = ' + QuotedStr(cdsGProv.fieldbyname('CPNOREG').AsString);
      try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo actualizar la Orden de Pago de SSGG en la eliminación de la provisión');
         exit;
      end;

   // revirtiendo el saldo de la Orden de Compra
      xSQL := 'Select * '
            + '  from LOG130 '
            + ' where LOG130.CPCIAID = ' + QuotedStr(cdsGProv.fieldbyname('CIAID').AsString)
            + '   and LOG130.CPANOMES = ' + QuotedStr(cdsGProv.fieldbyname('CPANOMES').AsString)
            + '   and LOG130.TDIARID = ' + QuotedStr(cdsGProv.fieldbyname('TDIARID').AsString)
            + '   and LOG130.CPNOREG = ' + QuotedStr(cdsGProv.fieldbyname('CPNOREG').AsString);
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      if DMCXP.cdsQry.Recordcount> 0 then
      begin
         xSQL := 'UPDATE LOG304 '
               + '   SET ODCTIMPAMOR = ODCTIMPAMOR - '
               + '                     (SELECT LOG130.TOTAL '
               + '                        FROM LOG130 '
               + '                       WHERE LOG130.ODCCIAID = LOG304.CIAID '
               + '                         AND LOG130.PROV = LOG304.PROV '
               + '                         AND LOG130.ODCID = LOG304.ODCID '
               + '                         AND LOG130.CPCIAID = ' + QuotedStr(cdsGProv.fieldbyname('CIAID').AsString)
               + '                         AND LOG130.CPANOMES = ' + QuotedStr(cdsGProv.fieldbyname('CPANOMES').AsString)
               + '                         AND LOG130.TDIARID = ' + QuotedStr(cdsGProv.fieldbyname('TDIARID').AsString)
               + '                         AND LOG130.CPNOREG = ' + QuotedStr(cdsGProv.fieldbyname('CPNOREG').AsString) + '  ) '
               + ' WHERE CIAID = ' + QuotedStr(cdsGProv.fieldbyname('CIAID').AsString)
               + '   AND PROV = ' + QuotedStr(cdsGProv.fieldbyname('PROV').AsString)
               + '   AND ODCID = ' + QuotedStr(cdsGProv.fieldbyname('CPOCOMP').AsString);
         try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            DMCXP.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se pudo actualizar la Orden de Compra asociada a la Provisión en la eliminación de la provisión');
            exit;
         end;
      end;
   end;

   DMCXP.DCOM1.AppServer.GrabaTransaccion;
   ShowMessage('Actualización realizada con éxito en la eliminación de la provisión');
// Fin HPC_201406_CXP

// Inicio HPC_201602_CXP
// Diferencia Notas de Crédito de facturas y otros documentos
   If (FPrincipal.xTipoProv = 'P') or (FPrincipal.xTipoProv = 'O') Then
      FPrincipal.GProvision.RefreshFilter;
   If FPrincipal.xTipoProv = 'N' Then
      FPrincipal.GNCredito.RefreshFilter;
// Fin HPC_201602_CXP
End;

Procedure TFToolCont.Z2sbDetalleClick(Sender: TObject);
Var
   sSQL: String;
   sWhere: String;
   x10: Integer;
Begin
   If FPrincipal.xTipoProv = 'P' Then
   Begin
      sWhere := DMCXP.GetWhereFromSQL(FPrincipal.GProvision.FMant.SQL);
   End;

   If FPrincipal.xTipoProv = 'N' Then
   Begin
      sWhere := DMCXP.GetWhereFromSQL(FPrincipal.GNCredito.FMant.SQL);
   End;

   If sWhere = '' Then Exit;

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      sSQL := 'SELECT CXP301.CIAID, TGE101.CIADES, CXP301.TDIARID, CXP301.CPANOMES, CXP301.CPNOREG, CXP301.CPESTADO'
         + ', CXP301.PROVDES, CXP301.CPFRECEP, CXP301.TMONID, CXP302.DCPDH, CXP301.DCPLOTE'
         + ', CXP302.TREGID, TGE113.TREGDES, CXP302.CPTOID, CXP302.CUENTAID'
         + ', CXP302.DCPGLOSA, CXP302.CCOSID, TGE203.CCOSDES, TGE115.ESTDOCDES '
         + ', CASE WHEN CXP302.DCPDH=' + quotedStr('D') + ' THEN CXP302.DCPMOLOC ELSE 0 END MONTOD'
         + ', CASE WHEN CXP302.DCPDH=' + quotedStr('D') + ' THEN 0 ELSE CXP302.DCPMOLOC END MONTOH'
         + ', CASE WHEN CXP302.DCPDH=' + quotedStr('D') + ' THEN CXP302.DCPMOEXT ELSE 0 END MONTOED'
         + ', CASE WHEN CXP302.DCPDH=' + quotedStr('D') + ' THEN 0 ELSE CXP302.DCPMOEXT END MONTOEH'
         + ', TGE103.TMONDES, TGE110.DOCABR, CXP301.CPNODOC, CXP301.CPSERIE, CXP301.CPOCOMP'
         + ' FROM CXP302 '
         + ' LEFT JOIN CXP301 ON ( CXP301.CIAID = CXP302.CIAID AND CXP301.TDIARID = CXP302.TDIARID'
         + ' AND CXP301.CPANOMES = CXP302.DCPANOMM AND CXP301.CPNOREG = CXP302.CPNOREG )'
         + ' LEFT JOIN TGE113 ON ( CXP302.TREGID = TGE113.TREGID )'
         + ' LEFT JOIN TGE203 ON ( CXP302.CCOSID = TGE203.CCOSID )'
         + ' LEFT JOIN TGE103 ON ( CXP301.TMONID = TGE103.TMONID ) '
         + ' LEFT JOIN TGE110 ON ( CXP301.DOCID = TGE110.DOCID AND DOCMOD = ' + quotedStr('CXP') + ' ) '
         + ' LEFT JOIN TGE101 ON ( CXP302.CIAID = TGE101.CIAID )'
         + ' LEFT JOIN TGE115 ON ( CXP301.CPESTADO = TGE115.ESTDOCID )';
      If sWhere <> '' Then
         sSQL := sSQL + ' WHERE ' + sWhere;
      sSQL := sSQL + ' ORDER BY CXP301.CIAID, CXP301.TDIARID, CXP301.CPANOMES, CXP301.CPNOREG, CXP302.DCPDH';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := 'SELECT CXP301.CIAID, TGE101.CIADES, CXP301.TDIARID, CXP301.CPANOMES, CXP301.CPNOREG, CXP301.CPESTADO'
            + ', CXP301.PROVDES, CXP301.CPFRECEP, CXP301.TMONID, CXP302.DCPDH, CXP301.DCPLOTE'
            + ', CXP302.TREGID, TGE113.TREGDES, CXP302.CPTOID, CXP302.CUENTAID'
            + ', CXP302.DCPGLOSA, CXP302.CCOSID, TGE203.CCOSDES, TGE115.ESTDOCDES '
            + ', CASE WHEN CXP302.DCPDH=' + quotedStr('D') + ' THEN CXP302.DCPMOLOC ELSE 0 END MONTOD'
            + ', CASE WHEN CXP302.DCPDH=' + quotedStr('D') + ' THEN 0 ELSE CXP302.DCPMOLOC END MONTOH'
            + ', CASE WHEN CXP302.DCPDH=' + quotedStr('D') + ' THEN CXP302.DCPMOEXT ELSE 0 END MONTOED'
            + ', CASE WHEN CXP302.DCPDH=' + quotedStr('D') + ' THEN 0 ELSE CXP302.DCPMOEXT END MONTOEH'
            + ', TGE103.TMONDES, TGE110.DOCABR,CXP301.CPNODOC, CXP301.CPSERIE, CXP301.CPOCOMP '
            + ' FROM CXP302, CXP301, TGE113, TGE203, TGE103, TGE110, TGE101, TGE115 '
            + ' WHERE CXP301.CIAID = CXP302.CIAID(+) AND CXP301.TDIARID = CXP302.TDIARID(+)'
            + ' AND CXP301.CPANOMES = CXP302.DCPANOMM(+) AND CXP301.CPNOREG = CXP302.CPNOREG(+)'
            + ' AND CXP302.TREGID = TGE113.TREGID(+)'
            + ' AND CXP302.CCOSID = TGE203.CCOSID(+)'
            + ' AND CXP301.TMONID = TGE103.TMONID(+) '
            + ' AND CXP301.DOCID  = TGE110.DOCID(+) AND DOCMOD = ' + quotedStr('CXP')
            + ' AND CXP302.CIAID  = TGE101.CIAID(+) AND CXP301.CPESTADO = TGE115.ESTDOCID(+)';
         If sWhere <> '' Then
            sSQL := sSQL + ' AND ' + sWhere;
         sSQL := sSQL + ' ORDER BY CXP301.CIAID, CXP301.TDIARID, CXP301.CPANOMES, CXP301.CPNOREG, CXP302.DCPDH';
      End;

   DMCXP.cdsReporte.close;
   DMCXP.cdsReporte.dataRequest(sSQL);
   DMCXP.cdsReporte.open;

   If DMCXP.cdsReporte.recordcount = 0 Then exit;

   ppReporte.template.fileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\CxP778a.rtm';
   ppReporte.template.LoadFromFile;

   If DMCXP.cdsReporte.RecordCount = 0 Then
   Begin
      Raise exception.create('Error, No existen registros');
   End;

   pplblSistema.text := 'CUENTA POR PAGAR';
   pplblTitulo.text := 'PROVISIONES CON DETALLE';

   ppdbFuente.DataSource := DMCXP.dsReporte;

   ppReporte.print;
   ppReporte.Stop;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
End;

Procedure TFToolCont.ppHBCabBeforePrint(Sender: TObject);
Begin
   pplblPagina.Caption := 'PAGINA: ' + ppsvPagina.Text;
End;

Procedure TFToolCont.ppReporteBeforePrint(Sender: TObject);
Var
   nTemp: single;
   nTotCar, i: word;
   sCadena: String;
Begin
   pplblFecha.Caption := 'FECHA : ' + ppsvFecha.Text;
   pplblHora.Caption := 'HORA  : ' + ppsvHora.Text;

   nTemp := ppReporte.PrinterSetup.PaperWidth - ppReporte.PrinterSetup.MarginRight - ppReporte.PrinterSetup.MarginLeft - pplblHora.Width - 40;
           //ancho de pagina - ancho de la hora (por ser el de mayor ancho) + 3
   pplblPagina.Left := nTemp;
   pplblFecha.Left := nTemp;
   pplblHora.Left := nTemp;

   sCadena := pplblGuionBase.text;
   nTotCar := trunc((ppReporte.PrinterSetup.PaperWidth - ppReporte.PrinterSetup.MarginRight - ppReporte.PrinterSetup.MarginLeft) / pplblGuionBase.Width);
   For i := 1 To nTotCar Do
      sCadena := sCadena + '-';
   pplblLin0.Caption := sCadena;
   pplblLin1.Caption := sCadena;
   pplblLin2.Caption := sCadena;

   pplblLin0.AutoSize := false;
   nTemp := pplblHora.Width + pplblHora.Left + 30;
   pplblLin0.width := nTemp;
   pplblLin1.width := nTemp;
   pplblLin2.width := nTemp;

   pplblTitulo.Left := 40;
   pplblTitulo.Width := ppReporte.PrinterSetup.PaperWidth - 80 - ppReporte.PrinterSetup.MarginRight - ppReporte.PrinterSetup.MarginLeft;
End;

Procedure TFToolCont.ppReportePreviewFormCreate(Sender: TObject);
Begin
   (sender As tppReport).PreviewForm.ClientHeight := 500;
   (sender As tppReport).PreviewForm.ClientWidth := 650;
   tppviewer((sender As tppReport).PreviewForm.Viewer).zoomSetting := zspageWidth;
End;

Procedure TFToolCont.SpeedButton2Click(Sender: TObject);
Var
   sSQL, sWhere: String;
Begin
   If FEscogeCia.ShowModal = mrCancel Then
      exit;

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      sSQL := 'SELECT '
         + 'YY.CPNOREG, '
         + 'CXP302.CCOSID, CXP302.CUENTAID, CXP302.DCPGLOSA, '
         + 'CXP301.CPNOREG, CXP301.DOCID, CXP301.PROVDES, '
         + 'CXP301.CPSERIE||' + quotedStr('-') + '||CXP301.CPNODOC SERIEDOC, '
         + 'CASE WHEN CXP301.TMONID=' + quotedStr('01') + ' THEN CXP301.CPMTOLOC ELSE 0 END SOLES, '
         + 'CASE WHEN CXP301.TMONID=' + quotedStr('02') + ' THEN CXP301.CPMTOEXT ELSE 0 END DOLARES, '
         + 'TGE110.DOCABR '
         + 'FROM ( '
         + 'SELECT MIN(RRN(CXP302)) RECNO, CPNOREG '
         + 'FROM CXP302 '
         + 'WHERE CIAID=' + quotedStr(FEscogeCia.dblcCia.text)
         + ' AND (TIPDET=' + quotedStr('MG') + ' OR TIPDET=' + quotedStr('MN') + ' OR TIPDET=' + quotedStr('NG') + ') '
         + 'GROUP BY CPNOREG'
         + ' ) YY '
         + 'INNER JOIN CXP302 ON (YY.RECNO=RRN(CXP302)) '
         + 'INNER JOIN CXP301 ON (CXP302.CPNOREG = CXP301.CPNOREG '
         + 'AND CXP302.CIAID=CXP301.CIAID '
         + 'AND CXP302.DCPANOMM=CXP301.CPANOMES '
         + 'AND CXP302.TDIARID=CXP301.TDIARID) '
         + 'INNER JOIN TGE110 ON (CXP301.DOCID=TGE110.DOCID AND TGE110.DOCMOD=' + quotedStr('CXP') + ') '
         + 'WHERE CXP301.CIAID=' + quotedStr(FEscogeCia.dblcCia.text) + ' AND CXP302.CIAID=' + quotedStr(FEscogeCia.dblcCia.text)
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := 'SELECT '
            + 'YY.CPNOREG, '
            + 'CXP302.CCOSID, CXP302.CUENTAID, CXP302.DCPGLOSA, '
            + 'CXP301.CPNOREG, CXP301.DOCID, CXP301.PROVDES, '
            + 'CXP301.CPSERIE||' + quotedStr('-') + '||CXP301.CPNODOC SERIEDOC, '
            + 'DECODE( CXP301.TMONID, ' + quotedStr('01') + ', CXP301.CPMTOLOC, 0 ) SOLES, '
            + 'DECODE( CXP301.TMONID, ' + quotedStr('02') + ', CXP301.CPMTOEXT, 0 ) DOLARES, '
            + 'TGE110.DOCABR '
            + 'FROM ( '
            + 'SELECT MIN(RRN(CXP302)) RECNO, CPNOREG '
            + 'FROM CXP302 '
            + 'WHERE CIAID=' + quotedStr(FEscogeCia.dblcCia.text)
            + ' AND (TIPDET=' + quotedStr('MG') + ' OR TIPDET=' + quotedStr('MN') + ' OR TIPDET=' + quotedStr('NG') + ') '
            + 'GROUP BY CPNOREG'
            + ' ) YY, CXP301, CXP302, TGE110 '
            + 'WHERE CXP301.CIAID=' + quotedStr(FEscogeCia.dblcCia.text)
            + ' AND CXP302.CIAID=' + quotedStr(FEscogeCia.dblcCia.text)
            + ' AND (YY.RECNO=RRN(CXP302)) '
            + ' AND (CXP302.CPNOREG = CXP301.CPNOREG '
            + 'AND CXP302.CIAID=CXP301.CIAID '
            + 'AND CXP302.DCPANOMM=CXP301.CPANOMES '
            + 'AND CXP302.TDIARID=CXP301.TDIARID) '
            + ' AND (CXP301.DOCID=TGE110.DOCID AND TGE110.DOCMOD=' + quotedStr('CXP') + ') '
      End;

   sWhere := DMCXP.GetWhereFromSQL(FPrincipal.GProvision.FMant.SQL);

   If sWhere <> '' Then
      sSQL := sSQL + ' AND ' + sWhere;

   ppReporte.template.fileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\CxP778b.rtm';
   ppReporte.template.LoadFromFile;

   pplblTitulo.text := 'LISTADO DE PROVEEDORES';

   DMCXP.cdsReporte.close;
   DMCXP.cdsReporte.dataRequest(sSQL);
   DMCXP.cdsReporte.open;

   If DMCXP.cdsReporte.RecordCount = 0 Then
   Begin
      Raise exception.create('Error, No existen registros');
   End;

   ppReporte.print;
End;

Procedure TFToolCont.sbtNCClick(Sender: TObject);
Var
   xSql: String;
Begin

   xSQL := 'Select * from CXP301 '
         + 'Where CIAID=''' + FPrincipal.GNCredito.FMant.cds2.FieldByName('CIAID').AsString + ''' '
         + '  AND TDIARID=''' + FPrincipal.GNCredito.FMant.cds2.FieldByName('TDIARID').AsString + ''' '
         + '  AND CPANOMES=''' + FPrincipal.GNCredito.FMant.cds2.FieldByName('CPANOMES').AsString + ''' '
         + '  AND CPNOREG=''' + FPrincipal.GNCredito.FMant.cds2.FieldByName('CPNOREG').AsString + ''' ';
   DMCXP.cdsMovCxP2.Close;
   DMCXP.cdsMovCxP2.DataRequest(xSQL);
   DMCXP.cdsMovCxP2.Open;

   If (DMCXP.DisplayDescrip2('dspTGE', 'TGE110', 'DOC_FREG', 'DOCID=' + quotedstr(DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString) +
      ' AND DOCMOD=' + quotedstr('CXP'), 'DOC_FREG') = 'N') Or
      (DMCXP.DisplayDescrip2('dspTGE', 'TGE110', 'DOCTIPREG', 'DOCID=' + quotedstr(DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString) +
      ' AND DOCMOD=' + quotedstr('CXP'), 'DOCTIPREG') = 'NC') Then
   Begin
      If (DMCXP.cdsmovcxp2.fieldbyname('CPESTADO').AsString = 'P') Then
      Begin
         xSql := 'CIAID=' + quotedstr(DMCXP.cdsMovCxP2.fieldbyname('CIAID').AsString)
            + ' and PROV=' + quotedstr(DMCXP.cdsMovCxP2.fieldbyname('PROV').AsString)
            + ' and DOCID<>' + quotedstr(DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString)
            + ' AND ( CPESTADO=''P'' ) AND (CPSALLOC > 0 AND CPSALEXT > 0)';
         Filtracds(DMCXP.cdsMovCxP, 'Select * from CXP301 Where ' + xSql);

         xsql := 'CIAID=' + quotedstr(DMCXP.cdsMovCxP2.fieldbyname('CIAID').AsString)
            + ' AND TCANJEID=' + quotedstr('NC')
            + ' AND CCPCANJE=' + quotedstr(DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString);
         Filtracds(DMCXP.cdsDetCanje, 'Select * from CXP305 Where ' + xSql);

         xSQL := 'SELECT * FROM CXP308 '
            + 'WHERE CIAID=''CLG'' AND TCANJEID=''NC'' AND '
            + 'CANJE=' + quotedstr(DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString);
         DMCXP.cdsCCanje.Close;
         DMCXP.cdsCCanje.DataRequest(xSQL);
         DMCXP.cdsCCanje.Open;

         FCanjeNC := TFCanjeNC.Create(FToolCont);
         FCanjeNC.ShowModal;
         FCanjeNC.Free;
      End
      Else
         Raise Exception.Create('La Nota de Crédito debe de estar en Estado ''P''=Pendiente de Aplicar');
   End
   Else
      Raise Exception.Create('No Existen Notas de Crédito Registrados para Esta Opcion');
End;

Procedure TFToolCont.HallaProIGV;
Begin
    //IGV PRORRATEADO
   xIGVPORI := FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOORI').AsFloat * xFac, 15, 2); // 32.40
   xIGVPLOC := FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOLOC').AsFloat * xFac, 15, 2);
   xIGVPEXT := FRound(DMCXP.CdsDetCxP.fieldbyname('DCPMOEXT').AsFloat * xFac, 15, 2);

   xTIGVPORI := xTIGVPORI + xIGVPORI;
   xTIGVPLOC := xTIGVPLOC + xIGVPLOC;
   xTIGVPEXT := xTIGVPEXT + xIGVPEXT;

   xPDifIgvOri := DMCXP.CdsDetCxP.fieldbyname('DCPMOORI').AsFloat - xIGVPORI;
   xPDifIgvLoc := DMCXP.CdsDetCxP.fieldbyname('DCPMOLOC').AsFloat - xIGVPLOC;
   xPDifIgvExt := DMCXP.CdsDetCxP.fieldbyname('DCPMOEXT').AsFloat - xIGVPEXT;
    //Diferencia entre el Total del Debe menos el IGV
   xTotGOri := xDTotOri - DMCXP.CdsDetCxP.fieldbyname('DCPMOORI').AsFloat; //1000
   xTotGLoc := xDTotLoc - DMCXP.CdsDetCxP.fieldbyname('DCPMOLOC').AsFloat;
   xTotGExt := xDTotExt - DMCXP.CdsDetCxP.fieldbyname('DCPMOEXT').AsFloat;
    //Actualizacion Del IGV Prorrateado en Detalle
   DMCXP.cdsDetCxP.edit;
   DMCXP.CdsDetCxP.fieldbyname('CPPRORORI').AsFloat := xIGVPORI;
   DMCXP.CdsDetCxP.fieldbyname('CPPRORMOLOC').AsFloat := xIGVPLOC;
   DMCXP.CdsDetCxP.fieldbyname('CPPRORMOEXT').AsFloat := xIGVPEXT;
   // Calculo del Debe menos el Igv Prorrateado
   xPTotOri := xDTotOri - xIGVPORI; //1180-32
   xPTotLoc := xDTotLoc - xIGVPLOC;
   xPTotExt := xDTotExt - xIGVPEXT;

End;

Procedure TFToolCont.HalloCXPREG(xxCia, xxDiar, xxPer, xxNreg: String);
Var
   xCxPReg: Integer;
Begin
   If DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString = '2001070121' Then showmessage('9');
   DMCXP.cdsDetCxP.Filter := 'CIAID=' + quotedstr(cdsGProv.FieldByName('CIAID').Asstring) + ' AND TDIARID=' + quotedstr(cdsGProv.FieldByName('TDIARID').Asstring) +
      ' AND DCPANOMM=' + quotedstr(cdsGProv.FieldByName('CPANOMES').Asstring) + ' AND CPNOREG=' + quotedstr(cdsGProv.FieldByName('CPNOREG').Asstring);
   DMCXP.cdsDetCxP.Filtered := true;
   xCxPReg := 0;
   //** hallo el total sin IGV de todos los Montos Grabados
   While (DMCXP.cdsDetCxP.FieldByName('CIAID').AsString = cdsGProv.FieldByName('CIAID').Asstring) And
      (DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString = cdsGProv.FieldByName('TDIARID').Asstring) And
      (DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString = cdsGProv.FieldByName('CPANOMES').Asstring) And
      (DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString = cdsGProv.FieldByName('CPNOREG').Asstring) Do
   Begin
      xCxPReg := xCxPReg + 1;
      DMCXP.cdsDetCxP.edit;
      DMCXP.cdsDetCxP.fieldbyname('DCPREG').value := xCxPReg;
      DMCXP.cdsDetCxP.fieldbyname('DCPHREG').value := Time;
      DMCXP.cdsDetCxP.fieldbyname('DCPFREG').value := Date;
      DMCXP.CdsDetCxP.next;
      If DMCXP.CdsDetCxP.Eof Then Break;
   End;
    //**
   DMCXP.cdsDetCxP.Filter := '';
   DMCXP.cdsDetCxP.Filtered := true;

   DMCXP.AplicaDatos(DMCXP.cdsDetCxP, 'DetCxP');
End;

Procedure TFToolCont.CreandoPanel;
Begin
   xPanel := TPanel.create(Nil);
   xPanel.parent := Screen.ActiveForm;
   xPanel.Height := 100;
   xPanel.width := 300;
   xPanel.Left := (Screen.Width Div 2) - (xPanel.width Div 2);
   xPanel.top := (Screen.Height Div 2) - (xPanel.Height Div 2);
   xPanel.BevelInner := bvRaised;
   xPanel.BevelOuter := bvRaised;
   xPanel.BevelWidth := 3;
   FPrincipal.GProvision.FMant.Refresh;
   xLabel1 := TLabel.create(Nil);
   xlabel1.parent := xPanel;
   xLabel1.Left := 5;
   xLabel1.top := 10;
   xLabel1.Font.Name := 'Comic Sans MS';
   xLabel1.Font.Style := [fsBold, fsItalic];
   xLabel1.Font.Size := 10;
   xLabel2 := TLabel.create(Nil);
   xlabel2.parent := xPanel;
   xLabel2.Left := 5;
   xLabel2.top := xLabel1.top + xLabel2.height;
   xLabel2.Font.Name := 'Comic Sans MS';
   xLabel2.Font.Style := [fsBold, fsItalic];
   xLabel2.Font.Size := 10;
   xLabel3 := TLabel.create(Nil);
   xlabel3.parent := xPanel;
   xLabel3.Left := 5;
   xLabel3.top := xLabel2.top + xLabel3.height;
   xLabel3.Font.Name := 'Comic Sans MS';
   xLabel3.Font.Style := [fsBold, fsItalic];
   xLabel3.Font.Size := 10;
   xPanel.refresh;
End;

Procedure TFToolCont.SpeedButton3Click(Sender: TObject);
Begin
   FImpBProvision := TFImpBProvision.Create(Self);
   Try
      FImpBProvision.ShowModal;
   Finally
      FImpBProvision.free;
   End;

End;

Procedure TFToolCont.Timer1Timer(Sender: TObject);
Begin
   FVariables.w_NombreForma := 'FToolCont';
   If (DMCXP.wAdmin = 'G') Or (DMCXP.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMCXP.AccesosUsuariosR(DMCXP.wModulo, DMCXP.wUsuario, '2', FToolCont);
      xAccesoBotones := True;
   End;

// Inicio HPC_201701_CXP
// 23/01/2017 Considera Registro de Suspensión de Renta 4ta para montos mayores a S/1500.00
//   xValorMinRta4ta := 0;
//   if xDOCTIPREG ='4C' then
      xValorMinRta4ta := 1500;
// Fin HPC_201701_CXP

   Timer1.Destroy;
End;

Procedure TFToolCont.bbtnTotalesClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If FPrincipal.xTipoProv = 'P' Then
   Begin
      cdsGProv := FPrincipal.GProvision.FMant.cds2; //Provisiones
      MProv := FPrincipal.GProvision;
   End
   Else
      If FPrincipal.xTipoProv = 'N' Then
      Begin
         cdsGProv := FPrincipal.GNCredito.FMant.cds2; //Nota Credito
         MProv := FPrincipal.GNCredito;
      End
      Else
         If FPrincipal.xTipoProv = 'O' Then
         Begin
            cdsGProv := FPrincipal.GProvision.FMant.cds2; //Otras Obligaciones
            MProv := FPrincipal.GProvision;
         End;

// se habilitará el botón que recalcula totales sólo si la provisión está aceptada
// y aún no está cancelada
   If (cdsGProv.FieldByName('CPESTADO').AsString = 'E') Then
   Begin
      xSQL := 'Update CXP301 '
         + 'Set CPNODOC=CPNODOC||' + quotedstr('E') + ' '
         + 'where CIAID=' + QuotedStr(cdsGProv.fieldbyname('CIAID').AsString)
         + '  and TDIARID=' + quotedstr(cdsGProv.fieldbyname('TDIARID').AsString)
         + '  and CPANOMES=' + quotedstr(cdsGProv.fieldbyname('CPANOMES').AsString)
         + '  and CPNOREG=' + quotedstr(cdsGProv.fieldbyname('CPNOREG').AsString);
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      ShowMessage('Nùmero de Documento Actualizado');
      exit;
   End;

   If ((cdsGProv.FieldByName('CPESTADO').AsString <> 'P') And
      (cdsGProv.FieldByName('CPESTADO').AsString <> 'C')) Then
   Begin
      ShowMessage(' Sólo se puede recalcular Provisiones Aceptadas o Canceladas');
      exit;
   End;

   If DMCXP.MesCerrado(copy(cdsGProv.fieldbyname('CPANOMES').AsString, 5, 2), copy(cdsGProv.fieldbyname('CPANOMES').AsString, 1, 4), cdsGProv.fieldbyname('CIAID').AsString) Then
   Begin
      ShowMessage(' Mes Cerrado!!!, No se puede Recalcular registro');
      exit;
   End;

   If MessageDlg('¿ Se actualizará el registro: ' + cdsGProv.fieldbyname('CPNOREG').AsString + ', desea continuar ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      RecalculaTotales2; // Recalcula Cabecera
      ShowMessage('Actualizacion finalizada');
   End;
End;

Procedure TFToolCont.RecalculaTotales2;
Var
   xSQL: String;
   xcpgravad, xcpgravad2, xcpigv, xcpigv2, xcpdcto, xcpnograv, xcpmtoori: double;
   xcp_otros, xadq_no_grav, xigv_gra_no_dest, xCPSERVIC, xCPISC, xTotalL: double;
Begin
   xTotalL := 0;

   xSQL := 'select CIAID, TDIARID, CPNOREG, DCPANOC, DCPANOMM, DCPLOTE, DCPCOMP, TRANSID, CPTOID, CUENTAID, '
         + '       CLAUXID, DCPAUXID, DOCID, CPSERIE, CPNODOC, DCPGLOSA, DCPDH, CCOSID, CPTCAMPR, CPTCAMPA, '
         + '       DCPMOORI, DCPMOLOC, DCPMOEXT, CPFEMIS, CPFVCMTO, DCPFCOM, DCPESTDO, DCPFLCDR, DCPFLAUT, '
         + '       DCPUSER, DCPFREG, DCPHREG, DCPMM, DCPDD, DCPTRI, DCPSEM, DCPSS, DCPAATRI, DCPAASEM, DCPAASS, '
         + '       TREGID, TMONID, FLAGVAR, TIPDET, TCANJEID, CANJE, PARPRESID, CPPRORORI, CPPRORMOLOC, CPPRORMOEXT, '
         + '       TIPPRESID, DCPREG, CXPRRHH, PROVRUC '
         + '  from CXP302 '
         + ' where CIAID=' + quotedstr(cdsGProv.fieldbyname('CIAID').AsString)
         + '   and TDIARID=' + quotedstr(cdsGProv.fieldbyname('TDIARID').AsString)
         + '   and DCPANOMM=' + quotedstr(cdsGProv.fieldbyname('CPANOMES').AsString)
         + '   and CPNOREG=' + quotedstr(cdsGProv.fieldbyname('CPNOREG').AsString);
   DMCXP.cdsDetCxP.Close;
   DMCXP.cdsDetCxP.DataRequest(xSQL);
   DMCXP.cdsDetCxP.Open;

   DMCXP.cdsDetCxP.First;

   xcpgravad := 0;
   xcpigv := 0;

   xcpgravad2 := 0;
   xcpigv2 := 0;

   xcpnograv := 0;

   xadq_no_grav := 0;
   xigv_gra_no_dest := 0;

   xcpdcto := 0;
   xcpmtoori := 0;
   xcp_otros := 0;

   xCPISC := 0;
   xCPSERVIC := 0;
   While Not DMCXP.cdsDetCxP.EOF Do
   Begin
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MG' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpgravad := xcpgravad + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpgravad := xcpgravad - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'NG' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpgravad2 := xcpgravad2 + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpgravad2 := xcpgravad2 - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I1' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpigv := xcpigv + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpigv := xcpigv - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I3' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpigv2 := xcpigv2 + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpigv2 := xcpigv2 - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'DC' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpdcto := xcpdcto + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpdcto := xcpdcto - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MN' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpnograv := xcpnograv + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpnograv := xcpnograv - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'TO') Or
         (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I4') Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpmtoori := xcpmtoori + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpmtoori := xcpmtoori - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'OT' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcp_otros := xcp_otros + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcp_otros := xcp_otros - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'AN' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xadq_no_grav := xadq_no_grav + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xadq_no_grav := xadq_no_grav - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I2' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xigv_gra_no_dest := xigv_gra_no_dest + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xigv_gra_no_dest := xigv_gra_no_dest - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I5' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xcpISC := xcpISC + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xcpISC := xcpISC - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      xCPSERVIC := 0;

      DMCXP.cdsDetCxP.Next;
   End;

   If xCPGRAVAD < 0 Then xCPGRAVAD := xCPGRAVAD * -1;
   If xcpgravad2 < 0 Then xcpgravad2 := xcpgravad2 * -1;
   If xcpigv < 0 Then xcpigv := xcpigv * -1;
   If xcpigv2 < 0 Then xcpigv2 := xcpigv2 * -1;
   If xcpdcto < 0 Then xcpdcto := xcpdcto * -1;
   If xcpnograv < 0 Then xcpnograv := xcpnograv * -1;
   If xcpmtoori < 0 Then xcpmtoori := xcpmtoori * -1;
   If xcp_otros < 0 Then xcp_otros := xcp_otros * -1;
   If xadq_no_grav < 0 Then xadq_no_grav := xadq_no_grav * -1;
   If xigv_gra_no_dest < 0 Then xigv_gra_no_dest := xigv_gra_no_dest * -1;
   If xcpigv2 < 0 Then xcpigv2 := xcpigv2 * -1;
   If xCPISC < 0 Then xCPISC := xCPISC * -1;
   If xCPSERVIC < 0 Then xCPSERVIC := xCPSERVIC * -1;

   xTotalL := xcpgravad + xcpgravad2 + xcpnograv + xadq_no_grav
      + xcpigv + xcpigv2 + xigv_gra_no_dest
      - xcpdcto
      + xcp_otros + xCPISC + xCPSERVIC;

// actualizando la cabecera
   cdsGProv.Edit;
   cdsGProv.fieldbyname('CPGRAVAD').AsFloat := xCPGRAVAD;
   cdsGProv.fieldbyname('CPGRAVAD2').AsFloat := xcpgravad2;
   cdsGProv.fieldbyname('CPIGV').AsFloat := xcpigv;
   cdsGProv.fieldbyname('CPIGV2').AsFloat := xcpigv2;
   cdsGProv.fieldbyname('CPDCTO').AsFloat := xcpdcto;
   cdsGProv.fieldbyname('CPNOGRAV').AsFloat := xcpnograv;
   cdsGProv.fieldbyname('CP_OTROS').AsFloat := xcp_otros;
   cdsGProv.fieldbyname('ADQ_NO_GRAV').AsFloat := xadq_no_grav;
   cdsGProv.fieldbyname('IGV_GRA_NO_DEST').AsFloat := xigv_gra_no_dest;
   cdsGProv.fieldbyname('CPISC').AsFloat := xCPISC;
   cdsGProv.fieldbyname('CPSERVIC').AsFloat := xCPSERVIC;
   cdsGProv.fieldbyname('CPHREG').AsDateTime := Date + Time; // Hora de Registro de Usuario

   Begin
      cdsGProv.fieldbyname('CPMTOORI').AsFloat := xcpmtoori;
      If cdsGProv.fieldbyname('TMONID').AsString = DMCXP.wTMonLoc Then
      Begin
         cdsGProv.fieldbyname('CPMTOLOC').AsFloat := xcpmtoori; // Total en moneda local
         cdsGProv.fieldbyname('CPMTOEXT').AsFloat := FRound(xcpmtoori / FRound(cdsGProv.fieldbyname('CPTCAMPR').AsFloat, 12, 3), 15, 2); // Total en moneda extranjera
      End
      Else
      Begin
         If cdsGProv.fieldbyname('TMONID').AsString = DMCXP.wTMonExt Then
         Begin
            cdsGProv.fieldbyname('CPMTOLOC').AsFloat := xTotalL; // Total en moneda local
            cdsGProv.fieldbyname('CPMTOEXT').AsFloat := xcpmtoori; // Total en moneda extranjera
            cdsGProv.fieldbyname('CPSALLOC').AsFloat := xTotalL; // Saldo en moneda Local
            cdsGProv.fieldbyname('CPSALEXT').AsFloat := xcpmtoori; // Saldo en moneda extranjera
         End;
      End;
   End;

   cdsGProv.fieldbyname('CPSALORI').AsFloat := cdsGProv.fieldbyname('CPMTOORI').AsFloat
      - cdsGProv.fieldbyname('CPPAGORI').AsFloat;
   cdsGProv.fieldbyname('CPSALLOC').AsFloat := cdsGProv.fieldbyname('CPMTOLOC').AsFloat
      - cdsGProv.fieldbyname('CPPAGLOC').AsFloat;
   cdsGProv.fieldbyname('CPSALEXT').AsFloat := cdsGProv.fieldbyname('CPMTOEXT').AsFloat
      - cdsGProv.fieldbyname('CPPAGEXT').AsFloat;
   cdsGProv.Post;

   xSQL := 'update CXP301 '
         + '   set CPGRAVAD  = ' + floattostr(cdsGProv.fieldbyname('CPGRAVAD').AsFloat) + ','
         + '       CPGRAVAD2 = ' + floattostr(cdsGProv.fieldbyname('CPGRAVAD2').AsFloat) + ','
         + '       CPIGV     = ' + floattostr(cdsGProv.fieldbyname('CPIGV').AsFloat) + ','
         + '       CPIGV2    = ' + floattostr(cdsGProv.fieldbyname('CPIGV2').AsFloat) + ','
         + '       CPDCTO    = ' + floattostr(cdsGProv.fieldbyname('CPDCTO').AsFloat) + ','
         + '       CPNOGRAV  = ' + floattostr(cdsGProv.fieldbyname('CPNOGRAV').AsFloat) + ','
         + '       CP_OTROS  = ' + floattostr(cdsGProv.fieldbyname('CP_OTROS').AsFloat) + ','
         + '       ADQ_NO_GRAV = ' + floattostr(cdsGProv.fieldbyname('ADQ_NO_GRAV').AsFloat) + ','
         + '       IGV_GRA_NO_DEST = ' + floattostr(cdsGProv.fieldbyname('IGV_GRA_NO_DEST').AsFloat) + ','
         + '       CPISC = ' + floattostr(cdsGProv.fieldbyname('CPISC').AsFloat) + ','
         + '       CPSERVIC  = ' + floattostr(cdsGProv.fieldbyname('CPSERVIC').AsFloat) + ','
         + '       CPMTOORI  = ' + floattostr(cdsGProv.fieldbyname('CPMTOORI').AsFloat) + ','
         + '       CPMTOLOC  = ' + floattostr(cdsGProv.fieldbyname('CPMTOLOC').AsFloat) + ','
         + '       CPMTOEXT  = ' + floattostr(cdsGProv.fieldbyname('CPMTOEXT').AsFloat) + ','
         + '       CPSALORI  = ' + floattostr(cdsGProv.fieldbyname('CPSALORI').AsFloat) + ','
         + '       CPSALLOC  = ' + floattostr(cdsGProv.fieldbyname('CPSALLOC').AsFloat) + ','
         + '       CPSALEXT  = ' + floattostr(cdsGProv.fieldbyname('CPSALEXT').AsFloat) + ' '
         + ' where CIAID=' + quotedstr(cdsGProv.fieldbyname('CIAID').AsString)
         + '   and TDIARID=' + quotedstr(cdsGProv.fieldbyname('TDIARID').AsString)
         + '   and CPANOMES=' + quotedstr(cdsGProv.fieldbyname('CPANOMES').AsString)
         + '   and CPNOREG=' + quotedstr(cdsGProv.fieldbyname('CPNOREG').AsString);
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
End;

// Inicio HPC_201501_CXP
procedure TFToolCont.sbRecalculoClick(Sender: TObject);
// Fin HPC_201501_CXP
Var
   xSQL: String;
   xCPGravad, xCPIGV, xCPGravad2, xCPIGV2, xCPNoGrav, xIGV_Gra_No_Dest, xAdq_No_Grav : double;
   xCPOtros,  xCPDcto, xCPServic, xCPMtoOri, xCPMtoLoc, xCPMtoExt, xCPISC : double;
// Inicio HPC_201602_CXP
// variables para Saldos
   xCPSalOri, xCPSalLoc, xCPSalExt : double;
// Fin HPC_201602_CXP

Begin
   xSQL := 'Delete from CAJ_NIV_AUT_USU where USERID in (''IANAYA'',''RRUIZ'') ';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   xSQL := 'Insert into CAJ_NIV_AUT_USU(USERID, USERNIV, USUAUT, FECAUT) Values(''IANAYA'', ''N2'', ''JLINARES'', sysdate)';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   xSQL := 'Insert into CAJ_NIV_AUT_USU(USERID, USERNIV, USUAUT, FECAUT) Values(''RRUIZ'', ''N2'', ''JLINARES'', sysdate)';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

   If FPrincipal.xTipoProv = 'P' Then
   Begin
      cdsGProv := FPrincipal.GProvision.FMant.cds2; //Provisiones
      MProv := FPrincipal.GProvision;
   End
   Else
      If FPrincipal.xTipoProv = 'N' Then
      Begin
         cdsGProv := FPrincipal.GNCredito.FMant.cds2; //Nota Credito
         MProv := FPrincipal.GNCredito;
      End
      Else
         If FPrincipal.xTipoProv = 'O' Then
         Begin
            cdsGProv := FPrincipal.GProvision.FMant.cds2; //Otras Obligaciones
            MProv := FPrincipal.GProvision;
         End;

   xCPGravad:=0; xCPIGV:=0; xCPGravad2:=0; xCPIGV2:=0; xCPNoGrav:=0; xIGV_Gra_No_Dest:=0; xAdq_No_Grav:=0;
   xCPOtros:=0;  xCPDcto:=0; xCPServic:=0; xCPMtoOri:=0; xCPMtoLoc:=0; xCPMtoExt:=0; xCPISC:=0;
// Inicio HPC_201602_CXP
// Inicializa variables para Saldos
   xCPSalOri:=0; xCPSalLoc:=0; xCPSalExt:=0;
// Fin HPC_201602_CXP

   xSQL:='Select * From CXP302 '
        +' where CIAID='+QuotedStr(cdsGProv.FieldByName('CIAID').AsString)
        +'   and TDIARID='+QuotedStr(cdsGProv.FieldByName('TDIARID').AsString)
        +'   and DCPANOMM='+QuotedStr(cdsGProv.FieldByName('CPANOMES').AsString)
        +'   and CPNOREG='+QuotedStr(cdsGProv.FieldByName('CPNOREG').AsString);
   Filtracds(DMCXP.cdsDetCxP,xSQL);

   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.First;
   While Not DMCXP.cdsDetCxP.EOF Do
   Begin
   // xCPGravad
      If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MG') or (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'BI') Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xCPGravad := xCPGravad + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xCPGravad := xCPGravad - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

   // xCPIGV
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I1' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xCPIGV := xCPIGV + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xCPIGV := xCPIGV - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

   // xCPGravad2
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'NG' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xCPGravad2 := xCPGravad2 + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xCPGravad2 := xCPGravad2 - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

   // xCPIGV2
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I3' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xCPIGV2 := xCPIGV2 + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xCPIGV2 := xCPIGV2 - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

   // xCPNoGrav
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'MN' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xCPNoGrav := xCPNoGrav + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xCPNoGrav := xCPNoGrav - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

   // xIGV_Gra_No_Dest
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I2' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xIGV_Gra_No_Dest := xIGV_Gra_No_Dest + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xIGV_Gra_No_Dest := xIGV_Gra_No_Dest - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

   // xAdq_No_Grav
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'AN' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xadq_no_grav := xadq_no_grav + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xadq_no_grav := xadq_no_grav - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

   // xCPOtros
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'OT' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xCPOtros := xCPOtros + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xCPOtros := xCPOtros - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

   // xCPDcto
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'DC' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xCPDcto := xCPDcto + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xCPDcto := xCPDcto - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

   // xCPServic
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'SV' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xCPServic := xCPServic + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xCPServic := xCPServic - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

   // xCPMtoOri
   // xCPMtoLoc
   // xCPMtoExt

   // Inicio HPC_201602_CXP
   // Inicializa variables para Saldos
      If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
      Begin
         xCPMtoOri := xCPMtoOri + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         xCPMtoLoc := xCPMtoLoc + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
         xCPMtoExt := xCPMtoExt + DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat;
      End;

      If (DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'TO') Then
      Begin
      // Inicio HPC_201604_CXP
      // 11/08/2016 El Saldo del Detalle es sólo para Recibo por Honorarios Profesionales
         {
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
         Begin
            xCPSalOri := xCPSalOri + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
            xCPSalLoc := xCPSalLoc + DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
            xCPSalExt := xCPSalExt + DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat;
         End
         Else
         Begin
            xCPSalOri := xCPSalOri - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
            xCPSalLoc := xCPSalLoc - DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
            xCPSalExt := xCPSalExt - DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat;
         End;
         }
      // El Saldo de la Provisión se inicializa con el campo TO (Total) del Detalle
         xCPSalOri := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         xCPSalLoc := DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat;
         xCPSalExt := DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat;
      // Fin HPC_201604_CXP
      End;
   // Fin HPC_201602_CXP

   // xCPISC
      If DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString = 'I5' Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' Then
            xCPISC := xCPISC + DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat
         Else
            xCPISC := xCPISC - DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      End;

      DMCXP.cdsDetCxP.Next;
   End;
   DMCXP.cdsDetCxP.EnableControls;

// Inicio HPC_201604_CXP
// 11/08/2016 El Saldo del Detalle es sólo para Recibo por Honorarios Profesionales
   {
   If cdsGProv.fieldbyname('DOCID').AsString<>'02' then
   Begin
      xCPSalOri := xCPMtoOri;
      xCPSalLoc := xCPMtoLoc;
      xCPSalExt := xCPMtoExt;
   End;
   }
   xCPSalOri := xCPSalOri - cdsGProv.FieldByName('CPPAGORI').AsFloat;
   If xCPSalOri>0 then
   Begin
      xCPSalLoc := xCPSalLoc - cdsGProv.FieldByName('CPPAGLOC').AsFloat;
      xCPSalExt := xCPSalExt - cdsGProv.FieldByName('CPPAGEXT').AsFloat;
   End
   Else
   Begin
      xCPSalOri := 0;
      xCPSalLoc := 0;
      xCPSalExt := 0;
   End;
// Fin HPC_201604_CXP

   If xCPGravad        < 0 Then xCPGravad := xCPGravad * -1;
   If xCPIGV           < 0 Then xCPIGV := xCPIGV * -1;
   If xCPGravad2       < 0 Then xCPGravad2 := xCPGravad2 * -1;
   If xCPIGV2          < 0 Then xCPIGV2 := xCPIGV2 * -1;
   If xCPNoGrav        < 0 Then xCPNoGrav := xCPNoGrav * -1;
   If xIGV_Gra_No_Dest < 0 Then xIGV_Gra_No_Dest := xIGV_Gra_No_Dest * -1;
   If xAdq_No_Grav     < 0 Then xAdq_No_Grav := xAdq_No_Grav * -1;
   If xCPOtros         < 0 Then xCPOtros := xCPOtros * -1;
   If xCPDcto          < 0 Then xCPDcto := xCPDcto * -1;
   If xCPServic        < 0 Then xCPServic := xCPServic * -1;
   If xCPMtoOri        < 0 Then xCPMtoOri := xCPMtoOri * -1;
   If xCPMtoLoc        < 0 Then xCPMtoLoc := xCPMtoLoc * -1;
   If xCPMtoExt        < 0 Then xCPMtoExt := xCPMtoExt * -1;
// Inicio HPC_201602_CXP
// Valida variables de Saldos en Negativo
   If xCPSalOri        < 0 Then xCPSalOri := xCPSalOri * -1;
   If xCPSalLoc        < 0 Then xCPSalLoc := xCPSalLoc * -1;
   If xCPSalExt        < 0 Then xCPSalExt := xCPSalExt * -1;
// Fin HPC_201602_CXP

   If xCPISC           < 0 Then xCPISC := xCPISC * -1;

   xSQL := ' Update CXP301 '
         + '    set CPGRAVAD ='+floattostr(xCPGravad)+','
         + '        CPIGV ='+floattostr(xCPIGV)+','
         + '        CPGRAVAD2 ='+floattostr(xCPGravad2)+','
         + '        CPIGV2 ='+floattostr(xCPIGV2)+','
         + '        CPNOGRAV ='+floattostr(xCPNoGrav)+','
         + '        IGV_GRA_NO_DEST ='+floattostr(xIGV_Gra_No_Dest)+','
         + '        ADQ_NO_GRAV ='+floattostr(xAdq_No_Grav)+','
         + '        CP_OTROS ='+floattostr(xCPOtros)+','
         + '        CPDCTO ='+floattostr(xCPDcto)+','
         + '        CPSERVIC ='+floattostr(xCPServic)+','
         + '        CPMTOORI ='+floattostr(xCPMtoOri)+','
         + '        CPMTOLOC ='+floattostr(xCPMtoLoc)+','
         + '        CPMTOEXT ='+floattostr(xCPMtoExt)+','
// Inicio HPC_201602_CXP
// Actualiza Saldos con variables de Saldos
         + '        CPSALORI ='+floattostr(xCPSalOri)+','
         + '        CPSALLOC ='+floattostr(xCPSalLoc)+','
         + '        CPSALEXT ='+floattostr(xCPSalExt)+','
// Fin HPC_201602_CXP
         + '        CPISC ='+floattostr(xCPISC)+','
         + '        CPHREG = sysdate '
         + '  Where CIAID='+quotedstr(cdsGProv.fieldbyname('CIAID').AsString)
         + '    and TDIARID='+quotedstr(cdsGProv.fieldbyname('TDIARID').AsString)
         + '    and CPANOMES='+quotedstr(cdsGProv.fieldbyname('CPANOMES').AsString)
         + '    and CPNOREG='+quotedstr(cdsGProv.fieldbyname('CPNOREG').AsString);
   Try
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se puede grabar la cabecera de la Provisión');
      exit;
   End;
// Inicio HPC_201602_CXP
// Condiciona mensaje de acuerdo a resultado
   if not xbRecalcBloque then
      ShowMessage('ok')
   else
      xbRecalcBloque := False;
// Fin HPC_201602_CXP

end;


// Inicio HPC_201501_CXP
procedure TFToolCont.bbtnRecHonClick(Sender: TObject);
begin
   try
     FImpRecHonElect := TFImpRecHonElect.Create( Application );
     FImpRecHonElect.ShowModal;
   finally
     FImpRecHonElect.Free;
   end;
end;
// Fin HPC_201501_CXP

// Inicio HPC_201602_CXP
procedure TFToolCont.sbTransfPagoClick(Sender: TObject);
begin
// CXP218 - Transfiere Amortizaciones y/o Cancelaciones de una Provisión a otra
   try
     FTrasladoAmort := TFTrasladoAmort.Create( Application );
     FTrasladoAmort.ShowModal;
   finally
     FTrasladoAmort.Free;
   end;
end;
// Fin HPC_201602_CXP

// Inicio HPC_201602_CXP
// recálculo de provisión en bloque
procedure TFToolCont.sbRecalculoBloqueClick(Sender: TObject);
var
   xSQL : String;
begin
// Inicio HPC_201604_CXP
   {
   xSQL := 'select A.CIAID, A.TDIARID, A.CPANOMES, A.CPNOREG, A.CPMTOORI, '
      +'           sum(B.DCPMOORI) MONTODET '
      +'      from CXP301 A, CXP302 B '
      +'     where A.CPANOMES like '+quotedstr('2016%')
      +'       and A.CPESTADO in (''C'', ''P'') '
      +'       and B.CIAID=A.CIAID and B.TDIARID=A.TDIARID '
      +'       and B.DCPANOMM=A.CPANOMES and B.CPNOREG=A.CPNOREG '
      +'       and B.DCPDH=''D'' '
      +'     group by A.CIAID, A.TDIARID, A.CPANOMES, A.CPNOREG, A.CPMTOORI '
      +'     having A.CPMTOORI <> sum(B.DCPMOORI) '
      +'     order by A.CIAID, A.TDIARID, A.CPANOMES, A.CPNOREG ';
   }
   xSQL := 'Select CXP301.CIAID, CXP301.TDIARID, CXP301.CPANOMES, CXP301.CPNOREG, '
      +'           CXP301.PROV, CXP301.CPESTADO, CXP301.DTRPORC, CXP301.CPMTOORI, '
      +'           CXP301.CPMTOLOC, CXP301.CPMTOEXT, CXP301.CPPAGORI, CXP301.CPPAGLOC, '
      +'           CXP301.CPPAGEXT, CXP301.CPSALORI, '
      +'           CXP301.CPSALLOC, CXP301.CPSALEXT, DETCXP.DCPMOORI, '
      +'           DETCXP.DCPMOLOC, DETCXP.DCPMOEXT '
      + '     from CXP301, '
      + '          (Select * '
      + '             from CXP302 '
      + '            where CIAID<>''02'' and TIPDET=''TO'' '
      + '              and DCPANOMM>=''201608'' '
      + '           ) DETCXP '
      + '    where CXP301.CIAID<>''02'' '
      + '      and CXP301.CPANOMES>=''201608'' '
      + '      and DETCXP.CIAID=CXP301.CIAID and DETCXP.DCPANOMM=CXP301.CPANOMES '
      + '      and DETCXP.TDIARID=CXP301.TDIARID and DETCXP.CPNOREG=CXP301.CPNOREG '
      + '      and CXP301.CPSALORI <> DETCXP.DCPMOORI '
      + '      and CXP301.CPSALORI>0 '
      + '      and CXP301.CPESTADO in (''P'',''C'') '
      + '      and CXP301.DTRPORC>0 '
      + '    ORDER BY CXP301.CIAID, CXP301.CPANOMES, CXP301.TDIARID, CXP301.CPNOREG ';
// Fin HPC_201604_CXP
   DMCXP.cdsQry2.Close;
   DMCXP.cdsQry2.DataRequest(xSQL);
   DMCXP.cdsQry2.Open;
   DMCXP.cdsQry2.First;
   while not DMCXP.cdsQry2.EOF do
   begin
      xbRecalcBloque := True;
      If FPrincipal.GProvision.FMant.cds2.Locate('CIAID;CPANOMES;TDIARID;CPNOREG',
           VarArrayOf([DMCXP.cdsQry2.FieldByName('CIAID').AsString,
                       DMCXP.cdsQry2.FieldByName('CPANOMES').AsString,
                       DMCXP.cdsQry2.FieldByName('TDIARID').AsString,
                       DMCXP.cdsQry2.FieldByName('CPNOREG').AsString]), [loCaseInsensitive]) Then
         sbRecalculoClick(Sender);
      DMCXP.cdsQry2.Next;
   end;
   DMCXP.cdsQry2.Close;
   ShowMessage('Ok');
   xbRecalcBloque := False;
end;
// Fin HPC_201602_CXP

End.

