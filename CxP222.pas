//** psjv, PARA EL CANJE POR DOC. PENDIENTES DEL PROVEEDOR SOBRE EL QUE SE ESTA
//** POSICIONADO EN EL GRID
unit CxP222;
// Inicio Uso Estándares: 01/08/2011
// Unidad               : CxP222
// Formulario           : FCanjeNC
// Fecha de Creación    : 23/11/2015
// Autor                : Equipo Sistemas.
// Objetivo             : Canje de Notas de Crédito
// Actualizaciones      :

// HPC_201707_CXP       : Ajuste en la opción de Nota de Crédito
// HPC_201805_CXP       : Ajustes en la aplicación de la Nota de Crédito

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, Mask, wwdbedit, Wwdbdlg, StdCtrls, wwdblook, ExtCtrls,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, Tabnotbk,DB, ppDB,
  ppDBPipe, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, ppViewr, ppTypes, oaVariables;

type
  TFCanjeNC = class(TForm)
    pnlCabecera: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Label8: TLabel;
    dblcClAux: TwwDBLookupCombo;
    lblprov: TLabel;
    dblcdProv: TwwDBLookupComboDlg;
    lblRuc: TLabel;
    dblcdProvRuc: TwwDBLookupComboDlg;
    lblProvNom: TLabel;
    edtProv: TEdit;
    lblSerie: TLabel;
    edtSerie: TwwDBEdit;
    lblNoDoc: TLabel;
    edtNoDoc: TwwDBEdit;
    lblFComprob: TLabel;
    dtpFComp: TwwDBDateTimePicker;
    lblComprob: TLabel;
    dbeNoReg: TwwDBEdit;
    lblLote: TLabel;
    dbeLote: TwwDBEdit;
    lblTMon: TLabel;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    lblTCam: TLabel;
    dbeTCambio: TwwDBEdit;
    lblFRecep: TLabel;
    dbdtpFRecep: TwwDBDateTimePicker;
    lblFEmis: TLabel;
    dbdtpFEmis: TwwDBDateTimePicker;
    pnlDetalle: TPanel;
    tnbkDetalle: TTabbedNotebook;
    pnlPendientes2: TPanel;
    Label1: TLabel;
    pnlDetCanje: TPanel;
    Label4: TLabel;
    dbgDetCanje: TwwDBGrid;
    pnlPie: TPanel;
    Z2bbtnAcepta: TBitBtn;
    dbgPendientes2: TwwDBGrid;
    bbtnSumat: TBitBtn;
    edtFinal: TEdit;
    bbtnCancela: TBitBtn;
    Z2bbtnPAplica: TBitBtn;
    Z2bbtnContab: TBitBtn;
    pprPreview: TppReport;
    ppHeaderBand2: TppHeaderBand;
    pplblCiaDes: TppLabel;
    ppsvFecha: TppSystemVariable;
    pplblModulo: TppLabel;
    pplblPeriodo: TppLabel;
    pplblNroComp: TppLabel;
    pplblTDiario: TppLabel;
    pplblDiarioDes: TppLabel;
    pplblAnoMes: TppLabel;
    pplblNoCompro: TppLabel;
    pplblProvDes: TppLabel;
    pplblProveedor: TppLabel;
    pplblMoneda: TppLabel;
    pplblMonedaDes: TppLabel;
    pplblGlosa: TppLabel;
    pplblGlosaDes: TppLabel;
    pplblSerie: TppLabel;
    pplblNoDoc: TppLabel;
    pplblFEmision: TppLabel;
    pplblCuenta: TppLabel;
    pplblDescrip: TppLabel;
    pplblProvId: TppLabel;
    pplblCCosto: TppLabel;
    pplblCntTCambio: TppLabel;
    pplblMonedaDoc: TppLabel;
    pplblDebe: TppLabel;
    pplblHaber: TppLabel;
    pplblCodProv: TppLabel;
    ppdbCntTCambio: TppDBText;
    pplblFecComp: TppLabel;
    ppdbCia: TppDBText;
    pplblFecEmision: TppLabel;
    ppdbFecComp: TppDBText;
    pplblEstado: TppLabel;
    ppLblDesEstado: TppLabel;
    pplblTit: TppLabel;
    pplblFecha: TppLabel;
    ppraya1: TppLabel;
    ppraya2: TppLabel;
    ppraya3: TppLabel;
    pplblItem: TppLabel;
    pplblFecDoc: TppLabel;
    pplblImporte: TppLabel;
    pplblMontoImporte: TppLabel;
    pplblTipCam: TppLabel;
    pplblHora: TppLabel;
    ppsvHora: TppSystemVariable;
    pplblTipoCamb: TppLabel;
    pplblDiario: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppdbSerie: TppDBText;
    ppdbNoDoc: TppDBText;
    ppdbCuenta: TppDBText;
    ppdbDebe: TppDBText;
    ppdbHaber: TppDBText;
    ppdbGlosa: TppDBText;
    ppdbCCos: TppDBText;
    ppdbMtoExt: TppDBText;
    ppdbFEmis: TppDBText;
    ppdbItem: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppdbcDebe: TppDBCalc;
    ppdbcHaber: TppDBCalc;
    ppRaya4: TppLabel;
    ppLabel1: TppLabel;
    ppdbpPreview: TppDBPipeline;
    pnlEstado: TPanel;
    lblAcepta: TLabel;
    lblContab: TLabel;
    lblAnula: TLabel;
    lblActivo: TLabel;
    lblEliminado: TLabel;
    procedure dbgPendientes2EndDrag(Sender, Target: TObject; X,
      Y: Integer);
    procedure dbgPendientes2DragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgDetCanjeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgDetCanjeEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgPendientes2MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgDetCanjeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bbtnSumatClick(Sender: TObject);
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure dbgDetCanjeColExit(Sender: TObject);
    procedure Z2bbtnPAplicaClick(Sender: TObject);
    procedure pprPreviewPreviewFormCreate(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure Z2bbtnContabClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    xGlosa, wTDiar : String; //** para acumular los documentos
    xNoReg      : string;
    wTDev2      : Double;
    procedure CalculaTotalDetCje;
    procedure FiltraGrids;
    procedure GrabaCabeceraCanje;
    procedure GrabaDetalleCanje;
    procedure LlenaDetCxP1(xxNReg:string);
    Function  AsientoCuadra:Boolean;
    procedure EstadoDeForma( xMovEstado, xMovConta : String );
    procedure CalculaTotalDetCje2;
    procedure CargaDataSource;
  public
    { Public declarations }
  end;

var
  xRegAct : TBookMark;
  FCanjeNC: TFCanjeNC;
  wSimbMn,wCje, wEstadTem: string;
  xNC,xMontoL,xMontoE,wToTalDocs : Double;  // Cantidad IGV para restarle al saldo y tener MtoMax de Ingreso


implementation

Uses CxPDM, CXP001;

{$R *.DFM}

procedure TFCanjeNC.dbgPendientes2EndDrag(Sender, Target: TObject; X, Y: Integer);
var
  i : integer;
begin
 If DMCXP.wModo <> 'C' then
  begin
   If Target=dbgDetCanje Then
    Begin
//     xNc := xNC - DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat;
     If (xNC > 0) or (DMCXP.cdsDetCanje.recordcount = 0) then
      begin
        xNc := xNC - DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat;
        DMCXP.cdsMovCxP.DisableControls;
        if FRound((DMCXP.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat),15,2 ) <>
           FRound( DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat,15,2 ) then begin
           ShowMessage('Documento esta en trámite y no es elegible');
           DMCXP.cdsMovCxP.EnableControls;
           exit;
        end;
        if Length(DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString)=0 then
           DMCXP.cdsDetCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPNODOC'
        else
           DMCXP.cdsDetCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
        for i:= 0 to dbgPendientes2.SelectedList.Count-1 do
         begin
          dbgPendientes2.datasource.dataset.GotoBookmark(dbgPendientes2.SelectedList.items[i]);
          DMCXP.cdsDetCanje.DisableControls;
          DMCXP.cdsDetCanje.SetKey;
          DMCXP.cdsDetCanje.FieldByName('CIAID').AsString   := DMCXP.cdsMovCxP.FieldByName('CIAID').AsString;
          DMCXP.cdsDetCanje.FieldByName('PROV').AsString    := DMCXP.cdsMovCxP.FieldByName('PROV').AsString;
          DMCXP.cdsDetCanje.FieldByName('DOCID').AsString   := DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
          if Length(DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString)=0 then
             DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString := DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
          DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString := DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
          if not( DMCXP.cdsDetCanje.GotoKey ) then
           begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
/////////////////////////////////
             DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := False;
             DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := False;
             DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := False;
             DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := False;
             DMCXP.cdsDetCanje.FieldByName('CIAID').ReadOnly := False;
             DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := False;
             DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := False;
             DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := False;
             DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := False;
/////////////////////////////////
// Fin HPC_201707_CXP
             DMCXP.cdsDetCanje.Insert;
             DMCXP.cdsDetCanje.FieldByName('CIAID').AsString    := DMCXP.cdsMovCxP.FieldByName('CIAID').AsString;
             DMCXP.cdsDetCanje.FieldByName('CLAUXID').AsString  := trim(dblcClAux.Text) ;
             DMCXP.cdsDetCanje.FieldByName('PROV').AsString     := DMCXP.cdsMovCxP.FieldByName('PROV').AsString;
             DMCXP.cdsDetCanje.FieldByName('PROVRUC').AsString  := DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString;
             DMCXP.cdsDetCanje.FieldByName('DOCID').AsString    := DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
             DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString  := DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
             DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString  := DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
             DMCXP.cdsDetCanje.FieldByName('CPNOREG').AsString  := DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString;
             DMCXP.cdsDetCanje.FieldByName('TCANJEID').AsString := 'NC';
             DMCXP.cdsDetCanje.FieldByName('CCPCANJE').AsString := wCje;
             DMCXP.cdsDetCanje.FieldByName('DOCID2').AsString   := DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
             DMCXP.cdsDetCanje.FieldByName('CPSERIE2').AsString := DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
             DMCXP.cdsDetCanje.FieldByName('CPNODOC2').AsString := DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
             DMCXP.cdsDetCanje.FieldByName('TMONID').AsString   := DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;
             DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := False;
             DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := False;
             DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := False;
             DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := False;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
             //DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsDateTime:= dtpFComp.Date;
             DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsDateTime:= Date;
// Fin HPC_201707_CXP
             DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat  := DMCXP.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat;
             DMCXP.cdsDetCanje.FieldByName('CPTCAMAJ').AsFloat  := strtofloat(dbeTCambio.Text);
             DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat  := DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat;
             DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat  := DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat;
             DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat  := DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;
            // Reglas de Negocio
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
             DMCXP.cdsDetCanje.FieldByName('CIAID').ReadOnly := True;
             DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := True;
             DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := True;
             DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := False;
             DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := False;

             {If DMCXP.wVRN_PagosParciales='S' then
              begin
                DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := False;
                DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := True;
                DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := False;
                DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := False;
              end
             else
              begin
                DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := True;
                DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := True;
                DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := True;
                DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := True;
              end; }
// Fin HPC_201707_CXP
             //
             DMCXP.cdsDetCanje.FieldByName('SALLOC').AsFloat    := DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat;
             DMCXP.cdsDetCanje.FieldByName('SALEXT').AsFloat    := DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;
             DMCXP.cdsDetCanje.FieldByName('DCDUSER').AsString  := DMCXP.wUsuario;
             DMCXP.cdsDetCanje.FieldByName('DCDFREG').AsdateTime:= date;
             DMCXP.cdsDetCanje.FieldByName('DCDHREG').AsDateTime:= time;
             DMCXP.cdsDetCanje.FieldByName('DCDAAAA').AsString  := DMCXP.cdsMovCxP.FieldByName('CPAAAA').AsString;
             DMCXP.cdsDetCanje.FieldByName('DCDMM').AsString    := DMCXP.cdsMovCxP.FieldByName('CPMM').AsString;
             DMCXP.cdsDetCanje.FieldByName('DCDDD').AsString    := DMCXP.cdsMovCxP.FieldByName('CPDD').AsString;
             DMCXP.cdsDetCanje.FieldByName('DCDTRI').AsString   := DMCXP.cdsMovCxP.FieldByName('CPTRI').AsString;
             DMCXP.cdsDetCanje.FieldByName('DCDSEM').AsString   := DMCXP.cdsMovCxP.FieldByName('CPSEM').AsString;
             DMCXP.cdsDetCanje.FieldByName('DCDSS').AsString    := DMCXP.cdsMovCxP.FieldByName('CPSS').AsString;
             DMCXP.cdsDetCanje.FieldByName('DCDANOMM').AsString := DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString;
             DMCXP.cdsDetCanje.FieldByName('DCDAATRI').AsString := DMCXP.cdsMovCxP.FieldByName('CPAATRI').AsString;
             DMCXP.cdsDetCanje.FieldByName('DCDAASEM').AsString := DMCXP.cdsMovCxP.FieldByName('CPAASEM').AsString;
             DMCXP.cdsDetCanje.FieldByName('DCDAASS').AsString  := DMCXP.cdsMovCxP.FieldByName('CPAASS').AsString;
             DMCXP.cdsDetCanje.Post;
             DMCXP.cdsMovCxP.Edit;
             wEstadTem := 'X';
             DMCXP.cdsMovCxP.FieldByname('CPESTADO').AsString := wEstadTem;
             DMCXP.cdsMovCxP.Post;
           end;
           dbgPendientes2.datasource.dataset.Freebookmark(dbgPendientes2.SelectedList.items[i]);
         end;
        dbgPendientes2.SelectedList.clear;  { Clear selected record list since they are all deleted}
        wEstadTem := 'P';
        FiltraGrids;
        DMCXP.cdsMovCxP.EnableControls;
        DMCXP.cdsDetCanje.EnableControls;
        DMCXP.cdsDetCanje.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
        bbtnSumatClick(Sender);
        DMCXP.cdsDetCanje.first;
        xGlosa := '';
        while not DMCXP.cdsDetCanje.eof do
         begin
          If xGlosa = '' then xGlosa := 'Doc. '+DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString + ' - '
          else xGlosa := xGlosa + ' - Doc. '+DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString + ' - ';
          DMCXP.cdsDetCanje.next;
         end;
      end
     else
      begin
       showmessage('Saldo de la Nota de Credito esta Cubierto');
       //** para restaurar el xNC
       xNc := xNC + DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat;
      end;
    end;
  end;
end;

procedure TFCanjeNC.dbgPendientes2DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFCanjeNC.dbgDetCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFCanjeNC.dbgDetCanjeEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
 try
  If DMCXP.wModo <> 'C' then
   begin
     If Target=dbgPendientes2 Then
      Begin
         xNc := xNC + DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat;
         DMCXP.cdsMovCxP.DisableControls;
         wEstadTem := 'X';
         FiltraGrids;
         if Length(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString)=0 then
           DMCXP.cdsMovCxP.IndexFieldNames:='CIAID;PROV;DOCID;CPNODOC'
         else
             DMCXP.cdsMovCxP.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
         DMCXP.cdsMovCxP.SetKey;
         DMCXP.cdsMovCxP.FieldByName('CIAID').AsString  :=DMCXP.cdsDetCanje.FieldByName('CIAID').AsString;
         DMCXP.cdsMovCxP.FieldByName('PROV').AsString   :=DMCXP.cdsDetCanje.FieldByName('PROV').AsString;
         DMCXP.cdsMovCxP.FieldByName('DOCID').AsString  :=DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
         if Length(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString)>0 then
           DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString:=DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString;
         DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString:=DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString;
         if DMCXP.cdsMovCxP.GotoKey then
          begin
             DMCXP.cdsMovCxP.Edit;
              wEstadTem := 'P';
              DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString := wEstadTem;
             DMCXP.cdsMovCxP.Post;
             FiltraGrids;
             DMCXP.cdsDetCanje.Delete;
             bbtnSumatClick(Sender);
          end;
          DMCXP.cdsMovCxP.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
      end;
       DMCXP.cdsDetCanje.first;
       xGlosa := '';
       while not DMCXP.cdsDetCanje.eof do
        begin
         If xGlosa = '' then xGlosa := 'Doc. '+ DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString  + ' - '
         else xGlosa := xGlosa + ' - Doc. '+DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString  + ' - ';
         DMCXP.cdsDetCanje.next;
        end;
   end;
 finally
   DMCXP.cdsMovCxP.EnableControls;
 end;
end;

procedure TFCanjeNC.dbgPendientes2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     dbgPendientes2.BeginDrag(False);
end;

procedure TFCanjeNC.dbgDetCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     dbgDetCanje.BeginDrag(False);
end;

procedure TFCanjeNC.bbtnSumatClick(Sender: TObject);
begin
   with DMCXP do Begin
      CalculaTotalDetCje;
      dbgDetCanje.ColumnByName('CPNoDoc').FooterValue:='Totales';
      if dblcTMon.Text = wTMonExt then
       begin
         dbgDetCanje.ColumnByName('DCDMoExt').FooterValue:=floattostrf(xMontoE,ffNumber,15,2);
         dbgDetCanje.ColumnByName('DCDMoLoc').FooterValue:= floattostrf(xMontoL,ffNumber,15,2);
       end
      else
       begin
         dbgDetCanje.ColumnByName('DCDMoLoc').FooterValue:=floattostrf(xMontoL,ffNumber,15,2);
         dbgDetCanje.ColumnByName('DCDMoExt').FooterValue:= floattostrf(xMontoE,ffNumber,15,2);
       end;
   End;
end;

procedure TFCanjeNC.CalculaTotalDetCje;
begin
     // Totales de Documentos de canje  (Cancelación)
   With DMCXP do
   Begin
      xMontoL:=0; xMontoE := 0;
//      cdsDetCanje.DisableControls;  // inhab. movim. de puntero pal grid
      xRegAct := cdsDetCanje.GetBookmark;  // marca reg. donde se quedo
      cdsDetCanje.First ;
      wToTalDocs := 0;
      While not cdsDetCanje.Eof do
      begin
      // JORGE
         DMCXP.cdsDetCanje.Edit;
         If dblcTMon.text = DMCXP.wTMonLoc then
         begin
            DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat:=DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat/
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            //                                             strtofloat(dbeTCambio.Text);
                                                           DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat;
// Fin HPC_201707_CXP
            DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat:=fRound(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat,15,2);
            wToTalDocs := wToTalDocs+DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
         end
         else
         begin
            DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat:=DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat*
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            //                                            strtofloat(dbeTCambio.Text);
                                                          DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat;
// Fin HPC_201707_CXP
            DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat:=fRound(DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat,15,2);
            wToTalDocs := wToTalDocs+DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
         end;
       //
         xMontoE := xMontoE + cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
         xMontoL := xMontoL + cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
         cdsDetCanje.Next;
      end;
      cdsDetCanje.GotoBookmark(xRegAct);
      cdsDetCanje.FreeBookmark(xRegAct);
      cdsDetCanje.EnableControls;
   end;
end;

procedure TFCanjeNC.FiltraGrids;
begin
   DMCXP.cdsMovCxP.Filtered := False;
   DMCXP.cdsMovCxP.Filter   := 'CPESTADO='+quotedstr(wEstadTem);
   DMCXP.cdsMovCxP.Filtered := True;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   IF DMCXP.cdsMovCxP.Recordcount<=0 then
   begin
       DMCXP.cdsMovCxP.Filtered := False;
       DMCXP.cdsMovCxP.Filter   := 'CPESTADO='+quotedstr('P');
       DMCXP.cdsMovCxP.Filtered := True;
   end;
// Fin HPC_201707_CXP
end;


procedure TFCanjeNC.Z2bbtnAceptaClick(Sender: TObject);
var
 xMontoNCO,xMontoNCL,xMontoNCE : Double;
 xMontoDCO,xMontoDCL,xMontoDCE : Double;
 xBool : Bool; 
// Inicio HPC_201805_cxp
// Se cambia los AplicaDatos por los SQL y aplica saldo a la Factura Origen
 xSQL : String;	
// Fin HPC_201805_CXP
begin
  try
     bbtnSumatClick(Sender);

     CalculaTotalDetCje2;

     if wTDev2<>DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat then begin
        ShowMessage('Error : No Cuadra la Nota de Credito con los Documentos Seleccionados');
        Exit;
     end;

     xBool := False; // Por defecto
     DMCXP.cdsDetCanje.DisableControls;
     DMCXP.cdsMovCxP.DisableControls;
    //** se cargan la variables
     xMontoNCO := DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat;
     xMontoNCL := DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat;
     xMontoNCE := DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat;
     xMontoDCO := 0;
     xMontoDCL := 0;
     xMontoDCE := 0;
     //** se valida que la NC sea canjeada en su totalidad
     if xMontoNCO <= wTotalDocs then
        xBool := True;

     //** si el canje es total y no parcial
     if XBool Then
     begin
        //** Filtra, para que me muestre solo los doc. que se han jalado
        wEstadTem := 'X';
        FiltraGrids;
        //** recorre el CDS de los doc. a canjear para ir restando el Saldo
        //** tando de la NC como del o los Doc. jalados
        DMCXP.cdsDetCanje.First;
        while not DMCXP.cdsDetCanje.eof do
        begin
           if Length(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString)=0 then
              DMCXP.cdsMovCxP.IndexFieldNames:='CIAID;PROV;DOCID;CPNODOC'
           else
              DMCXP.cdsMovCxP.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
           DMCXP.cdsMovCxP.SetKey;
           DMCXP.cdsMovCxP.FieldByName('CIAID').AsString  :=DMCXP.cdsDetCanje.FieldByName('CIAID').AsString;
           DMCXP.cdsMovCxP.FieldByName('PROV').AsString   :=DMCXP.cdsDetCanje.FieldByName('PROV').AsString;
           DMCXP.cdsMovCxP.FieldByName('DOCID').AsString  :=DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
           if Length(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString)>0 then
              DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString:=DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString;
           DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString:=DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString;
           if DMCXP.cdsMovCxP.GotoKey then
           begin
              DMCXP.cdsMovCxP.Edit;
              //** se cargan varibles con los monto del DOC
             xMontoDCO := DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat;
             xMontoDCL := DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat;
             xMontoDCE := DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;
             //** si el Monto de la NC es menor que el monto del DOC
             if xMontoNCO <= xMontoDCO then
             begin
                //** se valida la moneda de la NC
                if dblcTMon.text = DMCXP.wTMonLoc then
                begin
                   //** se valida la moneda de la NC y del Doc.
                   If dblcTMon.text = DMCXP.cdsMovCxP.FieldByName('TMONID').AsString then
                    begin
                       //** al saldo del Doc. se le resta el Monto de la NC
                       //** el monto pagado es igual al monto de la NC
                       DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat := xMontoDCL - xMontoNCL;
                       DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := xMontoDCL - xMontoNCL;
                       DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := xMontoDCE - xMontoNCE;
                       DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat+xMontoNCL;
                       DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat+xMontoNCL;
                       DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat+xMontoNCE;
                    end
                    else begin
                      //** al saldo del Doc. se le resta el Monto de la NC
                      //** el monto pagado es igual al monto de la NC
                      DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat := xMontoDCE - xMontoNCE;
                      DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := xMontoDCL - xMontoNCL;
                      DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := xMontoDCE - xMontoNCE;
                      DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat+xMontoNCE;
                      DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat+xMontoNCL;
                      DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat+xMontoNCE;
                   end;
                end
                else begin
                   if dblcTMon.text = DMCXP.cdsMovCxP.FieldByName('TMONID').AsString then
                   begin
                      //** al saldo del Doc. se le resta el Monto de la NC
                      //** el monto pagado es igual al monto de la NC
                      DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat := xMontoDCE - xMontoNCE;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
                      xMontoNCL := FRound((DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat),15,2);
                      DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := xMontoDCL - xMontoNCL;
                      //DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := xMontoDCL - xMontoNCL;
// Fin HPC_201707_CXP
                      DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := xMontoDCE - xMontoNCE;
                      DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat+xMontoNCE;
                      DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat+xMontoNCL;
                      DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat+xMontoNCE;
                   end
                   else begin
                      //** se le resta el Monto de la NC
                      DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat := xMontoDCL - xMontoNCL;
                      DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := xMontoDCL - xMontoNCL;
                      DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := xMontoDCE - xMontoNCE;
                      DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat+xMontoNCL;
                      DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat+xMontoNCL;
                      DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat+xMontoNCE;
                   end;
                end;
                if DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat = 0 then
                   DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString := 'C'
               else
                   DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString := 'P';

               //** el Monto de la NC queda en CERO
               xMontoNCO := 0;
               xMontoNCL := 0;
               xMontoNCE := 0;
            end
            else //** si el Monto de la NC es Mayor que el monto del DOC
            begin
               //** el saldo del DOC se iguala a CERO
               DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat := 0;
               DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := 0;
               DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := 0;
               if dblcTMon.text = DMCXP.wTMonLoc then
               begin
                  If dblcTMon.text = DMCXP.cdsMovCxP.FieldByName('TMONID').AsString then
                  begin
                     DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := xMontoDCL;
                     DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := xMontoDCL;
                     DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := xMontoDCE;
                  end
                  else begin
                     DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := xMontoDCE;
                     DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := xMontoDCL;
                     DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := xMontoDCE;
                  end;
               end
               else begin
                  if dblcTMon.text = DMCXP.cdsMovCxP.FieldByName('TMONID').AsString then
                  begin
                     DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := xMontoDCE;
                     DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := xMontoDCL;
                     DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := xMontoDCE;
                  end
                  else begin
                     DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := xMontoDCL;
                     DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := xMontoDCL;
                     DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := xMontoDCE;
                  end;
               end;
               DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString := 'C';
               //** el Monto de la NC se le resta el monto del DOC
               xMontoNCO := xMontoNCO - xMontoDCO;
               xMontoNCL := xMontoNCL - xMontoDCL;
               xMontoNCE := xMontoNCE - xMontoDCE;
            end;
// Inicio HPC_201805_cxp
// Se cambia los AplicaDatos por los SQL y aplica saldo a la Factura Origen
            xSQL := '';
            xSQL := ' CALL SP_CXP_UPD_FAC_SALDO('
                +     quotedstr(DMCXP.cdsMovCxP.FieldByName('CIAID').AsString) + ','
                +     quotedstr(DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString) + ','
                +     quotedstr(DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString) + ','
                +     quotedstr(DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString) + ','
                +     FloatToStr(DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat) + ','
                +     FloatToStr(DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat) + ','
                +     FloatToStr(DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat) + ','
                +     FloatToStr(DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat) + ','
                +     FloatToStr(DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat)  + ','
                +     FloatToStr(DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat) + ', '
                +     quotedstr(DMCXP.cdsMovCxP.FieldByName('CPESTADO').AsString) + ' ) ';

            Try
               DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al Actualizar saldo de la Nota de Crédito (CXP301)');
               exit;
            End;
            xSQL := '';
//          DMCXP.cdsMovCxP.post;
// Fin HPC_201805_CXP
        end;
        DMCXP.cdsDetCanje.next;
     end;

     DMCXP.cdsMovCxP2.Edit;

     // Se genera al Aceptar la Nota de Credito
     DMCXP.cdsMovCxP2.FieldByName('CPSALORI').AsFloat := 0;
     DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsFloat := 0;
     DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsFloat := 0;
     DMCXP.cdsMovCxP2.FieldByName('CPPAGORI').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat;
     DMCXP.cdsMovCxP2.FieldByName('CPPAGLOC').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat;
     DMCXP.cdsMovCxP2.FieldByName('CPPAGEXT').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat;
     DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString := 'C';
     DMCXP.cdsMovCxP2.post;
// Inicio HPC_201805_CXP
// Se cambia los AplicaDatos por los SQL y aplica saldo a la Nota de Crédito
//   DMCXP.AplicaDatos( DMCXP.cdsMovCxP2, 'MovCxP2' );
     xSQL := ' CALL SP_CXP_UPD_NC_SALDO('
         +     quotedstr(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString) + ','
         +     quotedstr(DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString) + ','
         +     quotedstr(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString) + ','
         +     quotedstr(DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString) + ','
         +     FloatToStr(DMCXP.cdsMovCxP2.FieldByName('CPSALORI').AsFloat) + ','
         +     FloatToStr(DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsFloat) + ','
         +     FloatToStr(DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsFloat) + ','
         +     FloatToStr(DMCXP.cdsMovCxP2.FieldByName('CPPAGORI').AsFloat) + ','
         +     FloatToStr(DMCXP.cdsMovCxP2.FieldByName('CPPAGLOC').AsFloat)  + ','
         +     FloatToStr(DMCXP.cdsMovCxP2.FieldByName('CPPAGEXT').AsFloat) + ','
         +     quotedstr(DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString) + ' ) ';

     Try
        DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
     Except
        Screen.Cursor := crDefault;
        ShowMessage('Error al Actualizar saldo de la Nota de Crédito (CXP301)');
        exit;
     End;

     xSQL := ' CALL SP_CXP_INS_CANJE_DET('
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('CIAID').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('PROV').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('PROVRUC').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('DOCID').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('CPNOREG').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('TCANJEID').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('CCPCANJE').AsString) + ','
         +               quotedstr(datetostr(DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsDateTime)) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('DOCID2').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('CPSERIE2').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('CPNODOC2').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('TMONID').asString) + ','
         +               floattostr(DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat) + ','
         +               floattostr(DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat) + ','
         +               floattostr(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('DCDUSER').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('DCDAAAA').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('DCDMM').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('DCDDD').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('DCDTRI').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('DCDSEM').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('DCDSS').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('DCDANOMM').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('DCDAATRI').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('DCDAASEM').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('DCDAASS').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('FLAGVAR').AsString) + ','
         +               floattostr(DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat) + ','
         +               floattostr(DMCXP.cdsDetCanje.FieldByName('CJEANTMN').AsFloat) + ','
         +               floattostr(DMCXP.cdsDetCanje.FieldByName('CJEANTME').AsFloat) + ','
         +               floattostr(DMCXP.cdsDetCanje.FieldByName('SALLOC').AsFloat) + ','
         +               floattostr(DMCXP.cdsDetCanje.FieldByName('SALEXT').AsFloat) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('CLAUXID').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('CAJAAAMM').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('CAJACOMP').AsString) + ','
         +               quotedstr(DMCXP.cdsDetCanje.FieldByName('CAJATDIAR').AsString) + ','
         +               floattostr(DMCXP.cdsDetCanje.FieldbyName('CPTCAMAJ').AsFloat) + ' ) ';

     Try
        DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
     Except
        Screen.Cursor := crDefault;
        ShowMessage('Error al Actualizar Detalle canje de la Aplicación de Nota de Crédito (CXP305)');
        exit;
     End;
//   DMCXP.AplicaDatos(DMCXP.cdsDetCanje, 'DETCANJE'  );
// Fin HPC_201805_CXP
     // SALDO SE ACTUALIZA CUANDO SE ACEPTA NOTA DE CREDITO
     //
     //DMCXP.SaldosAuxiliar(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString,DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString,
     //                   DMCXP.cdsMovCxP2.FieldByName('CLAUXID').AsString, DMCXP.cdsMovCxP2.FieldByName('PROV').AsString,'-',
     //                   DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat,DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat,
     //                   DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString);
     //

     // vhn 20/04/2003
     // GENERA ASIENTO Y CABECERA DE LA APLICACION DE LA NOTA DE CREDITO

     GrabaCabeceraCanje;

     GrabaDetalleCanje;

     EstadoDeForma( DMCXP.cdsCCanje.FieldByName('CJESTADO').AsString, DMCXP.cdsCCanje.FieldByName('CJ_CONTA').AsString );

     showmessage('Aceptacion Ok...');
     //** Filtra
     wEstadTem := 'P';
     FiltraGrids;
    end
    else
     showmessage('La Nota de Crédito debe ser canjeada por su Totalidad y no Parcial');
  finally
    DMCXP.cdsDetCanje.EnableControls;
    DMCXP.cdsMovCxP.EnableControls;
    wEstadTem := 'P';
    FiltraGrids;
  end;
end;

procedure TFCanjeNC.bbtnCancelaClick(Sender: TObject);
begin
   // Cancela todas las modificaciones en los
   DMCXP.cdsMovCxP2.CancelUpdates  ;
   DMCXP.cdsMovCxP2.Cancel;
   DMCXP.cdsMovCxP.Cancel;
   DMCXP.cdsMovCxP.CancelUpdates;
   DMCXP.cdsDetCanje.Cancel;
   DMCXP.cdsDetCanje.CancelUpdates;
   Close;
end;

procedure TFCanjeNC.dbgDetCanjeColExit(Sender: TObject);
begin
   if dbgDetCanje.SelectedField.FieldName='DCDTCAMB' then dbgDetCanje.RefreshDisplay;

   if DMCXP.wVRN_PagosParciales='S' then
   begin
      if (dbgDetCanje.SelectedField.FieldName='DCDMOLOC') and (DMCXP.cdsDetCanje.FieldByName('CIAID').AsString<>'') then
      begin
         if DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat>DMCXP.cdsDetCanje.FieldByName('SALLOC').AsFloat then
         begin
            DMCXP.cdsDetCanje.Edit;
            DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := DMCXP.cdsDetCanje.FieldByName('CJEANTMN').AsFloat;
            DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat  := DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
            DMCXP.cdsDetCanje.Post;
            raise exception.create('Error: Monto no debe ser mayor al Saldo');
         end
         else begin
            DMCXP.cdsDetCanje.Edit;
            DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat:= DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat / StrToFloat(dbeTCambio.text);
            TNumericField(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT')).DisplayFormat := '###,###,##0.00';
            DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat  := DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
            DMCXP.cdsDetCanje.Post;
         end; //**
      end
      else
         bbtnSumatClick(Sender);

      if (dbgDetCanje.SelectedField.FieldName='DCDMOEXT') and (DMCXP.cdsDetCanje.FieldByName('CIAID').AsString<>'') then
      begin
         if DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat>DMCXP.cdsDetCanje.FieldByName('SALEXT').AsFloat then
         begin
            DMCXP.cdsDetCanje.Edit;
            DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat:=DMCXP.cdsDetCanje.FieldByName('CJEANTME').AsFloat;
            DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat  := DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
            DMCXP.cdsDetCanje.Post;
            raise exception.create('Error: Monto no debe ser mayor al Saldo');
         end;
      end
         else  bbtnSumatClick(Sender);
   end
end;


procedure TFCanjeNC.GrabaCabeceraCanje;
var
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
  sSQL,xNCanje, xTAutoNum,xSQL,fechaCalc : string;
// Fin HPC_201707_CXP
  xxC1,xxC2,xxC3:string;
  a,m,d:word;
  xxTAno,xxTMes,xxTDiar:string;
  nNoReg:integer;
begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   //DecodeDate(dbdtpFEmis.Date,a,m,d);
   DMCXP.cdsDetCanje.First;
   DecodeDate(DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsDateTime,a,m,d);
// Fin HPC_201707_CXP
   xxTAno:=StrZero(IntToStr(a),4);
   xxTMes:=StrZero(IntToStr(m),2);
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   xSQL := 'SELECT  PER' + FormatFloat('00', StrToInt(xxTMes))
      + ' AS PERIODO FROM TGE154 WHERE CIAID=''' + dblcCia.text + ''''
      + 'AND MODULO=''CNT'' '
      + 'AND ANO=''' + xxTAno
      + '''';
   DMCXP.cdsQry1.close;
   DMCXP.cdsQry1.datarequest(xSQL);
   DMCXP.cdsQry1.open;

   If DMCXP.cdsQry1.FieldByName('PERIODO').asstring = 'S' Then
   Begin
      xxTMes:= IntToStr(StrToInt(xxTMes)-1);
   End;
// Fin HPC_201707_CXP
   xxTDiar:=BuscaQry('dspTGE','TGE110','TDIARID','DOCTIPREG=''AP'' AND DOCMOD=''CXP''','TDIARID');
   xTAutoNum:=DMCXP.DisplayDescrip('TGE104','AUTONUM','TDIARID',xxTDiar);
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   //ShowMessage( dblcCia.text+' - '+xxTDiar+' - '+xxTAno+xxTMes );
// Fin HPC_201707_CXP
   xNoReg   :=DMCXP.UltimoRegistro(xTAutoNum,dblcCia.text,xxTDiar,xxTAno,xxTMes );
   nNoReg   :=StrToInt(xNoReg);
   xNoReg   :='';
   while Length(xNoReg)=0 do
   begin
      xNoReg:=DMCXP.GrabaUltimoRegistro(xTAutoNum,dblcCia.text,xxTDiar,xxTAno,xxTMes, nNoReg );
      xNoReg:=StrZero( xNoReg, 10 );
      if not DMCXP.BuscaCxPReg(dblcCia.text,xxTDiar,xxTAno+xxTMes,xNoReg) then
      begin
           xNoReg:=StrZero( xNoReg, 10 );
         Break;
      end;
      nNoReg:=nNoReg+1;
   end;

   // vhn - Aperturar Antes
  {
  sSQL:=' SELECT * FROM CXP308 WHERE CIAID=''CLG'' AND TCANJEID=''CLG'' AND CANJE=''CLG'' ';
  DMCXP.cdsCCanje.Close;
  DMCXP.cdsCCanje.DataRequest(sSQL);
  DMCXP.cdsCCanje.Open;
  }
  wTDiar:=xxTDiar;
// Inicio HPC_201805_CXP
// Se cambia el AplicaDatos por procedimiento almacenado
  DMCXP.cdsCCanje.Insert;
  DMCXP.cdsCCanje.FieldByName('CIAID').AsString     :=dblcCia.text;
  DMCXP.cdsCCanje.FieldByName('TCANJEID').AsString  :='NC';
  DMCXP.cdsCCanje.FieldByName('CANJE').AsString     :=DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString;
  DMCXP.cdsCCanje.FieldByName('PROV').AsString      :=trim(dblcdProv.text);
  DMCXP.cdsCCanje.FieldByName('PROVRUC').AsString   :=trim(dblcdProvRuc.text);
  DMCXP.cdsCCanje.FieldByName('DOCID').AsString     :=DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
  DMCXP.cdsCCanje.FieldByName('TDIARID').AsString   :=xxTDiar;
  DMCXP.cdsCCanje.FieldByName('CCCMPRB').AsString   :=xNoreg ;
  DMCXP.cdsCCanje.FieldByName('CJFCANJE').AsDateTime:=dbdtpFEmis.date;
  DMCXP.cdsCCanje.FieldByName('CJFVALOR').AsDateTime:=dbdtpFEmis.date;
  DMCXP.cdsCCanje.FieldByName('CJFCOMP').AsDateTime :=dbdtpFEmis.date;
  DMCXP.cdsCCanje.FieldByName('TMONID').AsString    :=DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;
  DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsString :=DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsString;
  DMCXP.cdsCCanje.FieldByName('CJLOTE').AsString   :='';
  DMCXP.cdsCCanje.FieldByName('CPTOID').AsString   :=DMCXP.cdsMovCxP.FieldByName('CPTOTOT').AsString;
  DMCXP.cdsCCanje.FieldByName('CUENTAID').AsString :=DMCXP.cdsMovCxP.FieldByName('CTATOTAL').AsString;
  DMCXP.cdsCCanje.FieldByName('CJGLOSA').AsString  :=BuscaQry('dspTGE','CXP201','CPTODES','CPTOID='+QuotedStr(DMCXP.cdsMovCxP.FieldByName('CPTOTOT').AsString),'CPTODES');
  DMCXP.cdsCCanje.FieldByName('CJNUMLET').AsInteger:=0;
  DMCXP.cdsCCanje.FieldByName('CJDIAS').AsInteger  :=0;
  DMCXP.cdsCCanje.FieldByName('CJLETINI').AsString :='';
  DMCXP.cdsCCanje.FieldByName('CJUSER').AsString   :=DMCXP.wUsuario;
  DMCXP.cdsCCanje.FieldByName('CJESTADO').AsString :='C';
  DMCXP.cdsCCanje.FieldByName('CLAUXID').AsString  :=trim(dblcClAux.text);
  DMCXP.cdsCCanje.FieldByName('CJEGIRADO').AsString:=DMCXP.cdsMovCxP.FieldByName('PROVDES').AsString;

  DMCXP.cdsCCanje.FieldByName('CJAAMM').AsString := xxTAno+xxTMes;

  if DMCXP.BuscaFecha('TGE114','FECANO','FECHA',dbdtpFEmis.date ) then
  begin
    DMCXP.cdsCCanje.FieldByName('CJAA').AsString   := DMCXP.cdsULTTGE.FieldByName('FECANO').AsString;
    DMCXP.cdsCCanje.FieldByName('CJMM').AsString   := DMCXP.cdsULTTGE.FieldByName('FECMES').AsString;      // mes
    DMCXP.cdsCCanje.FieldByName('CJDD').AsString   := DMCXP.cdsULTTGE.FieldByName('FECDIA').AsString;      // día
    DMCXP.cdsCCanje.FieldByName('CJTRI').AsString  := DMCXP.cdsULTTGE.FieldByName('FECTRIM').AsString;     // trimestre
    DMCXP.cdsCCanje.FieldByName('CJSEM').AsString  := DMCXP.cdsULTTGE.FieldByName('FECSEM').AsString;      // semestre
    DMCXP.cdsCCanje.FieldByName('CJSS').AsString   := DMCXP.cdsULTTGE.FieldByName('FECSS').AsString;       // semana
    DMCXP.cdsCCanje.FieldByName('CJAATRI').AsString:= DMCXP.cdsULTTGE.FieldByName('FECAATRI').AsString;    // año+trimestre
    DMCXP.cdsCCanje.FieldByName('CJAASEM').AsString:= DMCXP.cdsULTTGE.FieldByName('FECAASEM').AsString;    // año+semestre
    DMCXP.cdsCCanje.FieldByName('CJAASS').AsString := DMCXP.cdsULTTGE.FieldByName('FECAASS').AsString;     // año+semana
  end;
  DMCXP.cdsCCanje.Post;
  DMCXP.cdsMovCxP.post;
  xSQL := ' CALL SP_CXP_INS_CCANJE('
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CIAID').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('TCANJEID').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CANJE').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('PROV').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('PROVRUC').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('DOCID').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('TDIARID').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CCCMPRB').AsString) + ','
         +               quotedstr(datetostr(DMCXP.cdsCCanje.FieldByName('CJFCANJE').AsDateTime)) + ','
         +               quotedstr(datetostr(DMCXP.cdsCCanje.FieldByName('CJFVALOR').AsDateTime)) + ','
         +               quotedstr(datetostr(DMCXP.cdsCCanje.FieldByName('CJFCOMP').AsDateTime)) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('TMONID').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJLOTE').asString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CPTOID').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CUENTAID').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJGLOSA').AsString) + ','
         +               inttostr(DMCXP.cdsCCanje.FieldByName('CJNUMLET').AsInteger) + ','
         +               inttostr(DMCXP.cdsCCanje.FieldByName('CJDIAS').AsInteger) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJLETINI').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJUSER').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJESTADO').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CLAUXID').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJEGIRADO').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJAAMM').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJAA').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJMM').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJDD').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJTRI').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJSEM').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJSS').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJAATRI').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJAASEM').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldByName('CJAASS').AsString) + ','
         +               quotedstr(DMCXP.cdsCCanje.FieldbyName('CJ_CONTA').AsString) + ' ) ';

  Try
        DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
  Except
        Screen.Cursor := crDefault;
        ShowMessage('Error al Actualizar Detalle canje de la Aplicación de Nota de Crédito (CXP308)');
        exit;
  End;
//  DMCXP.AplicaDatos( DMCXP.cdsCCanje, 'CCanje'  );
// Fin HPC_201805_CXP
  {
  DMCXP.SaldosAuxiliar( DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString,   DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString,
                      DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString, DMCXP.cdsMovCxP.fieldbyname('PROV').AsString, sSigno,
                      DMCXP.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat, DMCXP.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat,
                      DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString);
   }
end;


procedure TFCanjeNC.GrabaDetalleCanje;
Var
   I: Integer;
   wTasa, wSubT, dDebe, dHabe : Double;
   xsql : String;
begin
   Filtracds( DMCXP.cdsDetCxP, 'Select * from CXP302 Where CIAID=''CLG''' );

   DMCXP.cdsDetCanje.DisableControls;
   DMCXP.cdsDetCanje.First;
   if DMCXP.cdsDetCanje.RecordCount>0 then
   begin
      // INSERTA LOS REGISTROS DE LOS DOCUMENTOS SELECCIONADOS EN EL HABER
      while not DMCXP.cdsDetCanje.EOF do
      begin
         xSQL:='Select * from CXP301 A '
              +'Where CIAID='''  +dblcCia.text   +''' and CLAUXID='''+dblcClAux.text+''' '
              +  'and PROV='''   +dblcdProv.text +''' '
              +  'and DOCID='''  +DMCXP.cdsDetCanje.FieldByName('DOCID').AsString  +''' '
              +  'and CPSERIE='''+DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString+''' '
              +  'and CPNODOC='''+DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString+''' ';
         DMCXP.cdsQry1.Close;
         DMCXP.cdsQry1.DataRequest( xSQL );
         DMCXP.cdsQry1.Open;

         DMCXP.cdsDetCxP.Insert;
         LlenaDetCxP1(xNoReg);
         //BuscaQry('dspTGE','CXC208','CIAID,CPTOCAB,CPTODES,CPTOABR,CUENTAID,TREGID,TIPDET,CCDH','CIAID='+QuotedStr(dblcCia.text)+' AND CPTOCAB='+QuotedStr(DMCXP.cdsCanjes.FieldByName('CPTOID').AsString),'CPTOCAB');

         DMCXP.cdsDetCxP.Edit;
         //DMCXP.cdsDetCxC.FieldByName('TREGID').AsString:=DMCXP.cdsQry.FieldByName('TREGID').AsString;
         //DMCXP.cdsDetCxC.FieldByName('TIPDET').AsString:=DMCXP.cdsQry.FieldByName('TIPDET').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    :='D';
         DMCXP.cdsDetCxP.FieldByName('DOCID').AsString   := DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString := DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString := DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString  := DMCXP.cdsQry1.FieldByName('CPTOTOT').AsString;
         DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString:= DMCXP.cdsQry1.FieldByName('CTATOTAL').AsString;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
         DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString:= DMCXP.DisplayDescrip2('prvSQL','CXP201','CPTOID, CPTODES, NIVELMOV, CUENTAID','CPTOID='+quotedStr(DMCXP.cdsQry1.FieldByName('CPTOTOT').AsString),'CPTODES');
// Fin HPC_201707_CXP


         if DMCXP.cdsDetCanje.FieldByName('TMONID').AsString=DMCXP.wTMonExt then
         begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            //DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat*DMCXP.cdsDetCanje.FieldByName('CPTCAMAJ').AsFloat,15,2);
            //DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat,15,2);
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat*DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat,15,2);
// Fin HPC_201707_CXP
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
            DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
         end
         else begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat;
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
            DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
         end;

         DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat   :=DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat   :=DMCXP.cdsDetCanje.FieldByName('CPTCAMAJ').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDatetime :=DMCXP.cdsQry1.FieldByName('CPFEMIS').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDatetime:=DMCXP.cdsQry1.FieldByName('CPFVCMTO').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('TMONID').AsString    :=DMCXP.cdsDetCanje.FieldByName('TMONID').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger    :=DMCXP.cdsDetCxP.RecNo+1;
         DMCXP.cdsDetCxP.Post;
         dDebe:=FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat*DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat,15,2);
         dHabe:=FRound(DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat*DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat,15,2);
         if dDebe>dHabe then
         begin
            //HABER GANANCIA
            //GeneraDiferenciaCambio('D1');
         end
         else begin
            if dDebe<dHabe then
            begin
               // DEBE PERDIDA
               //GeneraDiferenciaCambio('D2');
            end;
         end;
         DMCXP.cdsDetCanje.Next;
      end;

      // INSERTA EL REGISTRO DE LA NOTA DE CREDITO EN EL DEBE
      DMCXP.cdsDetCanje.First;
      DMCXP.cdsDetCxP.Insert;
      LlenaDetCxP1(xNoReg);
      //BuscaQry('dspTGE','CXC208','CIAID,CPTOCAB,CPTODES,CPTOABR,CUENTAID,TREGID,TIPDET,CCDH','CIAID='+QuotedStr(dblcCia.text)+' AND CPTOCAB='+QuotedStr(DMCXP.cdsMovCxC.FieldByName('CCPTOTOT').AsString),'CPTOCAB');

      DMCXP.cdsDetCxP.Edit;
      //DMCXP.cdsDetCxC.FieldByName('TREGID').AsString:=DMCXP.cdsQry.FieldByName('TREGID').AsString;
      //DMCXP.cdsDetCxC.FieldByName('TIPDET').AsString:=DMCXP.cdsQry.FieldByName('TIPDET').AsString;

      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString     :='H';
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString     :=DMCXP.cdsMovCxP2.FieldByName('DOCID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString   :=edtSerie.text;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString   :=edtNoDoc.text;
      DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString    :=DMCXP.cdsMovCxP2.FieldByName('CPTOTOT').AsString;
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString  :=DMCXP.cdsMovCxP2.FieldByName('CTATOTAL').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString  :=DMCXP.cdsQry.FieldByName('CPTODES').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat   :=DMCXP.cdsMovCxP2.FieldByName('CPTCAMAJ').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat   :=DMCXP.cdsMovCxP2.FieldByName('CPTCAMAJ').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDatetime :=DMCXP.cdsMovCxP2.FieldByName('CPFEMIS').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDatetime:=DMCXP.cdsMovCxP2.FieldByName('CPFVCMTO').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('TMONID').AsString    :=DMCXP.cdsDetCanje.FieldByName('TMONID').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat   :=DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat   :=DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat;

      if DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
      begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat;
      end
      else begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat;
      end;
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger :=DMCXP.cdsDetCxP.RecNo+1;
      DMCXP.cdsDetCxP.Post;
   end;
   DMCXP.cdsDetCanje.EnableControls;

   dDebe:=FRound(OperClientDataSet(DMCXP.cdsDetCxP,'SUM(DCPMOLOC)','DCPDH=''D'''),15,2);
   dHabe:=FRound(OperClientDataSet(DMCXP.cdsDetCxP,'SUM(DCPMOLOC)','DCPDH=''H'''),15,2);
   if dDebe>dHabe then
   begin
      //HABER GANANCIA
      //GeneraDiferenciaCambio('D1');
   end
   else
   begin
      if dDebe<dHabe then
      begin
         // DEBE PERDIDA
        // GeneraDiferenciaCambio('D2');
      end;
   end;
   DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DetCxP' );
end;

procedure TFCanjeNC.LlenaDetCxP1(xxNReg:string);
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
var
   xSQL,xcntmm,xcntdd,xcnttri,xcntsem,xcntss,xcntaatri,xcntaasem,xcntaass : String;
// Fin HPC_201707_CXP
begin
  DMCXP.cdsDetCxP.Edit;
  DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := dblcCia.Text;
  DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := wTDiar;
  DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := xxNReg;
  DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString   := copy(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString,1,4);
  DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString;
  DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
  DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := dblcdProv.Text;
  DMCXP.cdsDetCxP.FieldByName('PROVRUC').AsString  := dblcdProvRuc.Text;
  DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsDetCanje.FieldByName('DOCID').AsString;
  DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString;
  DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString;
  DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsDetCanje.FieldByName('CPTCAMAJ').AsFloat;
  DMCXP.cdsDetCxP.FieldByName('CPTCAMPA').AsFloat  := DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat;
  DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDatetime:= DMCXP.cdsQry1.FieldByName('CPFEMIS').AsDateTime;
  DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDatetime:= dtpFComp.Date;
  DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'P'; // Pendiente
  DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString   := DMCXP.wUsuario;
  DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime := Date;
  DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime := Time;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
  xSQL := ' select fecmes, fecdia, fectrim, fecsem, fecss, fecaatri, fecaasem, '
         +' fecaass  from TGE114 where fecha=' + quotedstr(DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsString);
  Try
     DMCXP.cdsQry6.close;
     DMCXP.cdsQry6.DataRequest(xSQL);
     DMCXP.cdsQry6.Open;
  Except
     Screen.Cursor := crDefault;
     ShowMessage('Error al obtener los campos de fechas');
     exit;
  End;

  xcntmm := DMCXP.cdsQry6.fieldbyname('fecmes').AsString;
  xcntdd := DMCXP.cdsQry6.fieldbyname('fecdia').AsString;
  xcnttri := DMCXP.cdsQry6.fieldbyname('fectrim').AsString;
  xcntsem := DMCXP.cdsQry6.fieldbyname('fecsem').AsString;
  xcntss := DMCXP.cdsQry6.fieldbyname('fecss').AsString;
  xcntaatri := DMCXP.cdsQry6.fieldbyname('fecaatri').AsString;
  xcntaasem := DMCXP.cdsQry6.fieldbyname('fecaasem').AsString;
  xcntaass := DMCXP.cdsQry6.fieldbyname('fecaass').AsString;
  DMCXP.cdsQry6.close;
  DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString     := xcntmm;
  DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString     := xcntdd;
  DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString    := xcnttri;
  DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString    := xcntsem;
  DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString     := xcntss;
  DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString  := xcntaatri;
  DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString  := xcntaasem;
  DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString   := xcntaass;
// Fin HPC_201707_CXP
  DMCXP.cdsDetCxP.FieldByName('TMONID').AsString    := dblcTMon.Text;
  DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString  := 'NC';
  DMCXP.cdsDetCxP.FieldByName('CANJE').AsString     := DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString;
end;


procedure TFCanjeNC.Z2bbtnPAplicaClick(Sender: TObject);
var
   xSQL, xTDiario, xNoComp  : String;
   xDia, xMes, xAno : word;
   mes, ano, xwhere, MONABR : string;
   mesdes : String;
   TSimbolo,TMoneda : String;
   xTotHaber:DOUBLE;
   xAnoMes : sTRING;
begin
   if DMCXP.wAdmin='G' then Exit;

   xSQL:='Select * from CXP308 '
        +'Where CIAID='''   +dblcCia.text+''' '
        +  'and TCANJEID='''+DMCXP.cdsMovCxP2.FieldByName('TCANJEID').AsString+''' '
        +  'and CANJE='''   +DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString +''' ';
   DMCXP.cdsQry11.Close;
   DMCXP.cdsQry11.DataRequest( xSQL );
   DMCXP.cdsQry11.Open;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   //ShowMessage( xSQL );
// Fin HPC_201707_CXP
   xTDiario:=DMCXP.cdsQry11.FieldByname('TDIARID').AsString;
   xNoComp :=DMCXP.cdsQry11.FieldByname('CCCMPRB').AsString;
   xAnoMes :=DMCXP.cdsQry11.FieldByname('CJAAMM').AsString;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   //ShowMessage( dblcCia.text+' - '+xTDiario+' - '+ xNoComp+' - '+ xAnoMes );

   //ShowMessage( DMCXP.cdsQry11.fieldbyname('CJ_CONTA').AsString );
// Fin HPC_201707_CXP
   if DMCXP.cdsQry11.fieldbyname('CJ_CONTA').AsString <> 'S' then
   begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      //ShowMessage( 'SI' );
// Fin HPC_201707_CXP
//      if not AsientoCuadra then
//         raise exception.Create('Error:  Asiento No Cuadra');

      xSQL:='Delete FROM CNT311 '
           +'Where CIAID='     +quotedstr( dblcCia.text ) +' and '
           +      'CNTANOMM='  +quotedstr( xAnomes  )     +' and '
           +      'TDIARID='   +quotedstr( xTDiario )     +' and '
           +      'CNTCOMPROB='+quotedstr( xNoComp  );
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
      except
      end;

      xSQL:='Delete FROM CNT310 '
           +'Where CIAID='     +quotedstr( dblcCia.text ) +' and '
           +      'CNTANOMM='  +quotedstr( xAnomes  )     +' and '
           +      'TDIARID='   +quotedstr( xTDiario )     +' and '
           +      'CNTCOMPROB='+quotedstr( xNoComp  );
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
      except
      end;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      DMCXP.GeneraContab_NC( dblcCia.Text, xTDiario, xAnomes, DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString, xNoComp, Self, 'P' );
      //DMCXP.GeneraContab( dblcCia.Text, xTDiario, xAnomes, xNoComp, Self, 'P' );
// Fin HPC_201707_CXP

      DMCXP.cdsCXP.Data:=DMCXP.cdsMovCnt.data;

      decodedate(dtpFComp.Date,xAno,xMes,xDia);
      mes:= strzero(inttostr(xMes),2);
      ano:= inttostr(xAno);
      xWhere := 'MESIDR='''+mes+'''';
      mesdes := DMCXP.DisplayDescrip2('dspTGE','TGE181','MESDESL',XWHERE,'MESDESL');
   end;

   if DMCXP.cdsQry11.fieldbyname('CJ_CONTA').AsString = 'S' then
   begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      //ShowMessage( 'NO' );
// Fin HPC_201707_CXP
      xSql:='SELECT * FROM CNT301 '
           +'WHERE CIAID=' + quotedstr( dblcCia.text) +' AND '
           +  'CNTANOMM='  + quotedstr( xAnomes  )    +' AND '
           +  'TDIARID='   + quotedstr( xTDiario )    +' AND '
           +  'CNTCOMPROB='+ quotedstr( xNoComp  )    +' '
           +'Order by CNT301.CNTREG';
      DMCXP.cdsCxP.Close;
      DMCXP.cdsCxP.DataRequest(xSQL);
      DMCXP.cdsCxP.Open;

      ppdbpPreview.DataSource := DMCXP.dsCxP;

      mes:=copy(DMCXP.cdsCxP.fieldbyname('CNTANOMM').asstring,5,2);
      ano:=copy(DMCXP.cdsCxP.fieldbyname('CNTANOMM').asstring,1,4);

      xWhere:= 'MESIDR='''+mes+'''';
      mesdes:= DMCXP.DisplayDescrip2( 'dspTGE', 'TGE181', 'MESDESL', xWHERE, 'MESDESL' );
   end;

   ppdbpPreview.DataSource     := DMCXP.dsCxP;
   pprPreview.TEMPLATE.FileName:= ExtractFilePath( application.ExeName ) + wRutaRpt+'\CxPVoucher.rtm' ;
   pprPreview.template.LoadFromFile ;

   TMoneda:= DMCXP.DisplayDescrip2('dspTGE','TGE103','TMON_LOC','TMONID='+quotedstr(dblcTMon.text),'TMON_LOC');
   MONABR := DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONABR', 'TMONID='+quotedstr(dblcTMon.text),'TMONABR' );

   pplblMonedaDoc.Caption := MONABR;
   pplblCiades.Caption    := edtCia.text ;
   pplblCodProv.Caption   := dblcdProv.Text;
   pplblDiarioDes.Caption := DMCXP.DisplayDescrip2('dspTGE','TGE104','TDIARDES','TDIARID='+quotedstr(xTDiario),'TDIARDES');
   pplblTDiario.Caption   := xTDiario;
   pplblProveedor.Caption := edtProv.text;
   pplblGlosaDes.caption  := DMCXP.cdsCxP.fieldbyname('CNTGLOSA').asstring;
   pplblTipoCamb.Caption  := FloatToStrF(StrToFloat(dbeTCambio.text),ffNumber,10,3);
   pplblAnoMes.Caption    := xAnomes;
   pplblNoCompro.Caption  := xNoComp;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   //pplblFecEmision.Caption := DMCXP.cdsMovCxP2.FieldByName('CPFEMIS').AsString;
   pplblFecEmision.Caption := DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsString;
// Fin HPC_201707_CXP
   pplblMonedaDes.caption := DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONDES','TMONID='+quotedstr(dblcTMon.text),'TMONDES');

   xTotHaber:= 0;
   DMCXP.cdsDetCxP.First ;
   while not DMCXP.cdsDetCxP.Eof do
   begin
      if DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'H' then
         xTotHaber:= xTotHaber+FRound(DMCXP.cdsDetCxP.Fieldbyname('DCPMOORI').AsFloat,15,2);
      DMCXP.cdsDetCxP.Next;
   end;
   DMCXP.cdsDetCxP.First;
   pplblMontoImporte.Caption:=MONABR+' '+FloatToStrF(xTotHaber,ffNumber,15,2);

   if TMoneda = 'L' then
   begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      {pplblMonedaDoc.Visible := false;
      ppdbMtoExt.Visible:= false;
      pplblCntTCambio.Visible:= false;
      ppdbCntTCambio.Visible:= false; }

      pplblMonedaDoc.Visible := true;
      ppdbMtoExt.Visible:= true;
      pplblCntTCambio.Visible:= true;
      ppdbCntTCambio.Visible:= true;
// Fin HPC_201707_CXP
   end;

   if DMCXP.cdsMovCxP2.FieldByName('CP_CONTA').AsString='S' then
      pplblDesEstado.caption:='Contabilizado'
   else
      pplblDesEstado.caption:='Previo';

   pprPreview.Print;
   pprPreview.Stop;
   ppdbpPreview.DataSource:=nil ;
end;


Function TFCanjeNC.AsientoCuadra:Boolean;
var
   xTotDebe, xTotHaber : double;
   xCampo  : String;
begin
   Result    := False;
   xTotDebe  := 0;
   xTotHaber := 0;
   if DMCXP.cdsMovCxP2.fieldbyname('TMONID').AsString=DMCXP.wTMonLoc then
      xCampo:= 'DCPMOLOC'
   else
      xCampo:= 'DCPMOEXT';

//   DMCXP.cdsDetCxP.DisableControls;
   DMCXP.cdsDetCxP.First ;
   While not DMCXP.cdsDetCxP.Eof do begin
      If DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString = 'D' then
         xTotDebe := xTotDebe +FRound(DMCXP.cdsDetCxP.Fieldbyname(xCampo).Value,15,2)
      else begin
         xTotHaber:= xTotHaber+FRound(DMCXP.cdsDetCxP.Fieldbyname(xCampo).Value,15,2);
      end;
      DMCXP.cdsDetCxP.Next;
   end;
   DMCXP.cdsDetCxP.First;
//   DMCXP.cdsDetCxP.EnableControls;

   If FRound(xTotDebe,15,2)=FRound(xTotHaber,15,2) then
      Result := True;
end;

procedure TFCanjeNC.pprPreviewPreviewFormCreate(Sender: TObject);
begin
  pprPreview.PreviewForm.ClientHeight := 580;
  pprPreview.PreviewForm.ClientWidth := 780;			// ppViewr
  tppviewer(pprPreview.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFCanjeNC.ppDetailBand2BeforePrint(Sender: TObject);
begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   //pplblFecEmision.Caption := DMCXP.CdsCxP.Fieldbyname('CNTFEMIS').AsString;
   pplblFecEmision.Caption := DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsString;
// Fin HPC_201707_CXP
end;


procedure TFCanjeNC.EstadoDeForma( xMovEstado, xMovConta : String );
begin

   pnlDetalle.Enabled   := False;

   dbgPendientes2.Enabled := False;
   dbgDetCanje.Enabled    := False;
   dbgPendientes2.ReadOnly:= True;
   dbgDetCanje.ReadOnly   := True;

   pnlPie.Refresh;
   pnlPie.Enabled       := False;
   bbtnCancela.Enabled  := False;
   Z2bbtnAcepta.Enabled := False;
   //Z2bbtnAnula.Enabled  := False;
   Z2bbtnContab.Enabled := False;
   //Z2bbtnPreview.Enabled:= False;
   Z2bbtnPAplica.Enabled:= False;

   lblActivo.Visible    := False;
   lblAcepta.Visible    := False;
   lblAnula.Visible     := False;
   lblContab.Visible    := False;
   lblEliminado.Visible := False ;

   if (xMovEstado='') then
   begin
      pnlDetalle.Enabled     := True;
      dbgDetCanje.Enabled    := True;
      pnlPie.Enabled         := True;
      //Z2bbtnPreview.Enabled:= True;
      Z2bbtnAcepta.Enabled   := True;
      Z2bbtnPAplica.Enabled  := False;
      lblActivo.Visible      := True;
      dbgPendientes2.Enabled := True;
      dbgDetCanje.Enabled    := True;
      dbgPendientes2.ReadOnly:= False;
      dbgDetCanje.ReadOnly   := False;
   end;

   if xMovConta='S' then
   begin
      pnlDetalle.Enabled   := True;
      pnlPie.Enabled       := True;
      //Z2bbtnPreview.Enabled:= True;
      Z2bbtnPAplica.Enabled:= True;
      dbgDetCanje.Enabled  := True;
      lblContab.Visible    := True;
   end
   else begin
      if (xMovEstado='P') then
      begin
         pnlDetalle.Enabled    := True;
         dbgPendientes2.Enabled:= True;
         dbgDetCanje.Enabled   := True;
         dbgDetCanje.ReadOnly  := False;

         pnlPie.Enabled        := True;
         Z2bbtnAcepta.Enabled  := True;
         Z2bbtnPAplica.Enabled := False;
         Z2bbtnContab.Enabled  := False;
         //Z2bbtnPreview.Enabled:= True;

         lblAcepta.Visible    := True;
      end;
      if (xMovEstado='C') then
      begin
         pnlDetalle.Enabled    := True;
         dbgDetCanje.Enabled   := True;

         pnlPie.Enabled       := True;
         Z2bbtnContab.Enabled := True;
         //Z2bbtnPreview.Enabled:= True;
         Z2bbtnPAplica.Enabled:= True;

         lblAcepta.Visible    := True;
      end;
      if (xMovEstado='A') then
      begin
         pnlDetalle.Enabled    := True;
         dbgDetCanje.Enabled   := True;
         pnlPie.Enabled        := True;
         lblAnula.Visible      := True;
      end;

   end;

end;

procedure TFCanjeNC.Z2bbtnContabClick(Sender: TObject);
var
   xSQL, xTDiario, xNoComp  : String;
   xDia, xMes, xAno : word;
   mes, ano, xwhere, MONABR : string;
   mesdes : String;
   TSimbolo,TMoneda : String;
   xTotHaber:DOUBLE;
   xAnoMes : sTRING;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   a,m,d:word;
   xxTAno,xxTMes:string;
// Fin HPC_201707_CXP
begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   //DecodeDate(Date,a,m,d);
   //DecodeDate(dbdtpFEmis.Date,a,m,d);
   DMCXP.cdsDetCanje.First;
   DecodeDate(DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsDateTime,a,m,d);
   xxTAno:=StrZero(IntToStr(a),4);
   xxTMes:=StrZero(IntToStr(m),2);

   xSQL := 'SELECT  PER' + FormatFloat('00', StrToInt(xxTMes))
      + ' AS PERIODO FROM TGE154 WHERE CIAID=''' + dblcCia.text + ''''
      + 'AND MODULO=''CNT'' '
      + 'AND ANO=''' + xxTAno
      + '''';
   DMCXP.cdsQry1.close;
   DMCXP.cdsQry1.datarequest(xSQL);
   DMCXP.cdsQry1.open;

   If DMCXP.cdsQry1.FieldByName('PERIODO').asstring = 'S' Then
   Begin
      xxTMes:= IntToStr(StrToInt(xxTMes)-1);
   End;



    xSQL:='SELECT CJ_CONTA,TDIARID,CCCMPRB FROM CXP308 '
         +'WHERE CIAID='''+dblcCia.Text+''' AND TCANJEID=''NC'' '
         +  'AND CANJE='''+DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString+'''';
    DMCXP.cdsQry.Close;
    DMCXP.cdsQry.DataRequest( xSQL );
    DMCXP.cdsQry.Open;

    if DMCXP.cdsQry.FieldByName('CJ_CONTA').AsString<>'S' then begin

       {DMCXP.GeneraContab( dblcCia.Text, DMCXP.cdsQry.FieldByName('TDIARID').AsString,
//                         DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString,
                         (xxTAno+xxTMes),
                         DMCXP.cdsQry.FieldByName('CCCMPRB').AsString, Self, 'C' );}
     try
       DMCXP.GeneraContab_NC( dblcCia.Text, DMCXP.cdsQry.FieldByName('TDIARID').AsString,
                              (xxTAno+xxTMes), DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString,
                              DMCXP.cdsQry.FieldByName('CCCMPRB').AsString, Self, 'C' );
       Z2bbtnContab.Enabled   := False;
       EstadoDeForma( DMCXP.cdsCCanje.fieldbyname('CJESTADO').AsString, 'S' ); //jesus
       ShowMessage('Registro Contabilizado... Pulse Intro para continuar');
     Except
          showmessage('Error al intentar contabilizar la aplicación del documento');
          exit;
     Raise;
     End;
    end;



   {if DMCXP.wAdmin='G' then Exit;

   xSQL:='Select * from CXP308 '
        +'Where CIAID='''   +dblcCia.text+''' '
        +  'and TCANJEID='''+DMCXP.cdsMovCxP2.FieldByName('TCANJEID').AsString+''' '
        +  'and CANJE='''   +DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString +''' ';
   DMCXP.cdsQry11.Close;
   DMCXP.cdsQry11.DataRequest( xSQL );
   DMCXP.cdsQry11.Open;

   xTDiario:=DMCXP.cdsQry11.FieldByname('TDIARID').AsString;
   xNoComp :=DMCXP.cdsQry11.FieldByname('CCCMPRB').AsString;
   xAnoMes :=DMCXP.cdsQry11.FieldByname('CJAAMM').AsString;

   if DMCXP.cdsQry11.fieldbyname('CJ_CONTA').AsString <> 'S' then
   begin
//      if not AsientoCuadra then
//         raise exception.Create('Error:  Asiento No Cuadra');

      xSQL:='Delete FROM CNT311 '
           +'Where CIAID='     +quotedstr( dblcCia.text ) +' and '
           +      'CNTANOMM='  +quotedstr( xAnomes  )     +' and '
           +      'TDIARID='   +quotedstr( xTDiario )     +' and '
           +      'CNTCOMPROB='+quotedstr( xNoComp  );
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
      except
      end;

      xSQL:='Delete FROM CNT310 '
           +'Where CIAID='     +quotedstr( dblcCia.text ) +' and '
           +      'CNTANOMM='  +quotedstr( xAnomes  )     +' and '
           +      'TDIARID='   +quotedstr( xTDiario )     +' and '
           +      'CNTCOMPROB='+quotedstr( xNoComp  );
      Try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
      except
      end;

      DMCXP.GeneraContab( dblcCia.Text, xTDiario, xAnomes, xNoComp, Self, 'C' );

      DMCXP.cdsCCanje.Edit;
      DMCXP.cdsCCanje.FieldByName('CJ_CONTA').AsString:='S';
      DMCXP.AplicaDatos( DMCXP.cdsCCanje, 'CCanje'  );

      EstadoDeForma( DMCXP.cdsCCanje.fieldbyname('CJESTADO').AsString, DMCXP.cdsCCanje.fieldbyname('CJ_CONTA').AsString );

      ShowMessage('Registro Contabilizado... Pulse Intro para continuar');
   end;  }
// Fin HPC_201707_CXP
end;


procedure TFCanjeNC.CalculaTotalDetCje2;
begin
   // Totales de Documentos de canje  (Cancelación)
   wTDev2:=0;
   DMCXP.cdsDetCanje.DisableControls;  // inhab. movim. de puntero pal grid
   xRegAct := DMCXP.cdsDetCanje.GetBookmark;  // marca reg. donde se quedo
   DMCXP.cdsDetCanje.First ;
   while not DMCXP.cdsDetCanje.Eof do begin
      if dblcTMon.Text = DMCXP.wTMonExt then
         wTDev2 := wTDev2 + DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat
      else
         wTDev2 := wTDev2 + DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat;
      DMCXP.cdsDetCanje.Next;
   end;
   DMCXP.cdsDetCanje.GotoBookmark(xRegAct);
   DMCXP.cdsDetCanje.FreeBookmark(xRegAct);
   DMCXP.cdsDetCanje.EnableControls;
end;


procedure TFCanjeNC.FormShow(Sender: TObject);
var
   xWhere, xFiltro : String;
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );

// Inicio HPC_201707_CXP       : Ajuste en la opción de Nota de Crédito
   xWhere := 'Select CLAUXID, PROV, PROVRUC, PROVDES, PROVABR, PROVNOMCOM, PROVRETIGV, PAISID, PROVDIR, '
           + '       PROVCZIP, PROVTELF, PROVFAX, PROVEMAI, CONVDOBTRI '
           + '  from TGE201 '
           + ' where CLAUXID = '+quotedstr(dblcClAux.Text)
           + '   and NVL(ACTIVO,''N'')=''S'' ';
   Filtracds(DMCXP.cdsProv, xWhere);
// Fin HPC_201707_CXP
   
   pnlPendientes2.Enabled := True;
   pnlDetCanje.Enabled := True;
   Z2bbtnAcepta.Enabled := True;
   edtCia.text  := DMCXP.displaydescrip2('dspTGE','TGE101','CIADES', 'CIAID=' +quotedstr(dblcCia.text),'CIADES');
   edtProv.text := DMCXP.displaydescrip2('dspTGE','TGE201','PROVDES','PROV='  +quotedstr(dblcdProv.text),'PROVDES');
   edtTMon.text := DMCXP.displaydescrip2('dspTGE','TGE103','TMONDES','TMONID='+quotedstr(dblcTMon.text),'TMONDES');

   // El Canje se Genera en la Aplicación
   wCje := DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString;

   if length(edtTMon.Text)>0 then
     wSimbMn:=DMCXP.displaydescrip2('dspTGE','TGE103','TMONABR','TMONID='+quotedstr(dblcTMon.text),'TMONABR');
   edtFinal.Text:='Nota de Crédito deberá ser cancelada por la suma de '
                    + wSimbMn +'  '+ floattostrf(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat,ffNumber,15,2);
   xNC := DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat;

   bbtnSumatClick(Sender);

   // Reglas de Negocio
   If DMCXP.wVRN_PagosParciales='S' then
    begin
      DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := False;
      DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := True;
      DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := False;
      DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := False;
    end
   else
    begin
      DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly  := True;
      DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly := True;
      DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly := True;
      DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly := True;
    end;

   xFiltro:= 'CIAID    =''' + dblcCia.Text  + ''' and '
           + 'DCPANOMM =''' + DMCXP.cdsMovCxP2.fieldbyname('CPANOMES').AsString + ''' and '
           + 'TDIARID  =''' + DMCXP.cdsMovCxP2.fieldbyname('TDIARID').AsString  + ''' and '
           + 'CPNOREG  =''' + DMCXP.cdsMovCxP2.fieldbyname('CPNOREG').AsString  + '''' ;
   Filtracds( DMCXP.cdsDetCxP,'Select * from CXP302 Where '+xFiltro );

// Inicio HPC_201707_CXP       : Ajuste en la opción de Nota de Crédito
   DMCXP.cdsMovCxP.IndexFieldNames:='CIAID;CPANOMES;PROV;DOCID;CPSERIE;CPNODOC';
// Fin HPC_201707_CXP       : Ajuste en la opción de Nota de Crédito

   EstadoDeForma( DMCXP.cdsCCanje.FieldByName('CJESTADO').AsString, DMCXP.cdsCCanje.FieldByName('CJ_CONTA').AsString );

   if DMCXP.wAdmin='G' then
      DMCXP.wModo := 'C';
end;

procedure TFCanjeNC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//   FVariables.ActualizaFiltro( DMCXP.cdsCCanje, FPrincipal.GLetras, DMCXP.wModo );
   if not (FPrincipal.GLetras=nil) then
      FPrincipal.GLetras.RefreshFilter;
   Action:=caFree;
end;

procedure TFCanjeNC.FormCreate(Sender: TObject);
begin

   CargaDataSource;

end;


procedure TFCanjeNC.CargaDataSource;
begin
   dblcCia.DataSource        :=DMCXP.dsMovCxP2;
   dblcCia.LookupTable       :=DMCXP.cdsCia;
   dblcClAux.DataSource      :=DMCXP.dsMovCxP2;
   dblcClAux.LookupTable     :=DMCXP.cdsClAux;
   dblcdProv.DataSource      :=DMCXP.dsMovCxP2;
   dblcdProv.LookupTable     :=DMCXP.cdsProv;
   dblcdProvRuc.DataSource   :=DMCXP.dsMovCxP2;
   dblcdProvRuc.LookupTable  :=DMCXP.cdsProv;
   edtSerie.DataSource       :=DMCXP.dsMovCxP2;
   edtNoDoc.DataSource       :=DMCXP.dsMovCxP2;
   dtpFComp.DataSource       :=DMCXP.dsMovCxP2;
   dbeNoReg.DataSource       :=DMCXP.dsMovCxP2;
   dbeLote.DataSource        :=DMCXP.dsMovCxP2;
   dblcTMon.DataSource       :=DMCXP.dsMovCxP2;
   dblcTMon.LookupTable      :=DMCXP.cdsTMon;
   dbeTCambio.DataSource     :=DMCXP.dsMovCxP2;
   dbdtpFRecep.DataSource    :=DMCXP.dsMovCxP2;
   dbdtpFEmis.DataSource     :=DMCXP.dsMovCxP2;
   
   dbgPendientes2.DataSource :=DMCXP.dsMovCxP;
   dbgDetCanje.DataSource    :=DMCXP.dsDetCanje;
end;


end.



