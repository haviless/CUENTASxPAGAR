unit Cxp800;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, Tabnotbk,
	wwdbdatetimepicker, Mask, wwdbedit, Wwdbdlg, wwdblook, ExtCtrls, DB;

type
	TFCanjeLT = class(TForm)
		pnlCabecera: TPanel;
		lblCia: TLabel;
		Label8: TLabel;
		lblprov: TLabel;
		lblRuc: TLabel;
		lblProvNom: TLabel;
		lblSerie: TLabel;
    lblNoDoc: TLabel;
    lblFComprob: TLabel;
    lblComprob: TLabel;
		lblLote: TLabel;
    lblTMon: TLabel;
    lblTCam: TLabel;
    lblFRecep: TLabel;
		lblFEmis: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dblcClAux: TwwDBLookupCombo;
		dblcdProv: TwwDBLookupComboDlg;
    dblcdProvRuc: TwwDBLookupComboDlg;
    edtProv: TEdit;
    edtSerie: TwwDBEdit;
    edtNoDoc: TwwDBEdit;
		dtpFComp: TwwDBDateTimePicker;
    dbeNoReg: TwwDBEdit;
    dbeLote: TwwDBEdit;
		dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    dbeTCambio: TwwDBEdit;
    dbdtpFRecep: TwwDBDateTimePicker;
    dbdtpFEmis: TwwDBDateTimePicker;
		pnlDetalle: TPanel;
		edtFinal: TEdit;
		pnlPie: TPanel;
		Z2bbtnAcepta: TBitBtn;
		bbtnSumat: TBitBtn;
		bbtnCancela: TBitBtn;
    pgcDetalle: TPageControl;
    tbsDocum: TTabSheet;
		TabSheet2: TTabSheet;
    Panel1: TPanel;
    sbtABl: TSpeedButton;
    dbgDetCxP: TwwDBGrid;
    pnlPendientes2: TPanel;
    Label1: TLabel;
    dbgPendientes2: TwwDBGrid;
    pnlDetCanje: TPanel;
    Label4: TLabel;
    dbgDetCanje: TwwDBGrid;
    Z2bbtnGraba: TBitBtn;
    lblTDoc: TLabel;
		dblcTDoc: TwwDBLookupCombo;
		edtTDoc: TEdit;
    lblTDiario: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    lblAnoMes: TLabel;
    meAnoMM: TwwDBEdit;
    bbtnOK: TBitBtn;
		procedure dbgPendientes2DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
		procedure dbgPendientes2EndDrag(Sender, Target: TObject; X, Y: Integer);
		procedure dbgPendientes2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
		procedure dbgDetCanjeDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
		procedure dbgDetCanjeEndDrag(Sender, Target: TObject; X, Y: Integer);
		procedure dbgDetCanjeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
		procedure bbtnSumatClick(Sender: TObject);
		procedure FormActivate(Sender: TObject);
		procedure bbtnCancelaClick(Sender: TObject);
		procedure Z2bbtnAceptaClick(Sender: TObject);
		procedure sbtABlClick(Sender: TObject);
		procedure Z2bbtnGrabaClick(Sender: TObject);
		procedure dblcTDocExit(Sender: TObject);
		procedure dtpFCompExit(Sender: TObject);
		procedure bbtnOKClick(Sender: TObject);
		function ConsistenciaDoc : Boolean;
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure FormKeyPress(Sender: TObject; var Key: Char);
		procedure dblcTMonExit(Sender: TObject);
    procedure dbgDetCanjeKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDetCanjeColExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
	private
		{ Private declarations }
		xGlosa : String;
		procedure CalculaTotalDetCje;
		procedure FiltraGrids;

	public
		xFiltroTDiar : string;
		{ Public declarations }
	end;

var
	FCanjeLT: TFCanjeLT;
	xRegAct : TBookMark;
	wSimbMn, wCje, wEstadTem : string;
	xNC, xMontoL, xMontoE, wToTalDocs : Double;
  xxTCambio, xxTCamDol : Double;
	xCrea : Boolean;
	xConta    : String;

implementation

uses CxPDM;

{$R *.DFM}

procedure TFCanjeLT.dbgPendientes2DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
	Accept:=True;
end;

procedure TFCanjeLT.dbgPendientes2EndDrag(Sender, Target: TObject; X, Y: Integer);
var
	 i : integer;
begin
	 if DMCXP.wModo <> 'C' then
	 begin
			if Target=dbgDetCanje Then
			begin
				 if DMCXP.cdsMovCxP.recordcount = 0 then
						exit;
				 // xNC ==> Monto de la Letra a Canjear
				 xNC := DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat;
				 if (xNC > 0) or (DMCXP.cdsDetCanje.recordcount = 0) then
				 begin

				 // verifica que Documento elegido no esté en trámite
						if DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
						begin
							 if FRound((DMCXP.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat),15,2 ) <>
									FRound( DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat,15,2 ) then
							 begin
									ShowMessage('Documento está en trámite y no es elegible');
									exit;
							 end
						end
						else
						begin
							 if DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
							 begin
									if FRound((DMCXP.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat-DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat),15,2 ) <>
											 FRound( DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat,15,2 ) then
									begin
										 ShowMessage('Documento Esta en Trámite y no es Elegible');
										 exit;
									end
							 end
							 else
							 begin
									ShowMessage( 'Comunicar a Sistemas, No existe Tipo de Moneda para el Proceso');
									Exit;
							 end;
						end;

						if DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
							 xNC := xNC - DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat
						else
							 xNC := xNC - DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;

						DMCXP.cdsMovCxP.DisableControls;
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
							 if Length(DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString) > 0 then
									DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString := DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
							 DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString := DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
							 if not( DMCXP.cdsDetCanje.GotoKey ) then
							 begin
									DMCXP.cdsDetCanje.Insert;
									DMCXP.cdsDetCanje.FieldByName('CIAID').AsString    	 	:= DMCXP.cdsMovCxP.FieldByName('CIAID').AsString;
									DMCXP.cdsDetCanje.FieldByName('CLAUXID').AsString 	 	:= trim(dblcClAux.Text) ;
									DMCXP.cdsDetCanje.FieldByName('CPNOREG').AsString    	:= DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString;
									DMCXP.cdsDetCanje.FieldByName('PROV').AsString       	:= DMCXP.cdsMovCxP.FieldByName('PROV').AsString;
									DMCXP.cdsDetCanje.FieldByName('PROVRUC').AsString    	:= DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString;
									DMCXP.cdsDetCanje.FieldByName('DOCID').AsString      	:= DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
									DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString    	:= DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
									DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString    	:= DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
									DMCXP.cdsDetCanje.FieldByName('TDIARID').AsString    	:= DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString;
									DMCXP.cdsDetCanje.FieldByName('TCANJEID').AsString   	:= 'LT';
									DMCXP.cdsDetCanje.FieldByName('CCPCANJE').AsString   	:= wCje;
									DMCXP.cdsDetCanje.FieldByName('CJEANTMN').AsFloat  		:= 0;
									DMCXP.cdsDetCanje.FieldByName('CJEANTME').AsFloat  		:= 0;
									DMCXP.cdsDetCanje.FieldByName('CCPMOLOC').AsFloat  		:= 0;
									DMCXP.cdsDetCanje.FieldByName('CCPMOEXT').AsFloat  		:= 0;
									DMCXP.cdsDetCanje.FieldByName('CCPESTDO').AsString 		:= 'P';
									DMCXP.cdsDetCanje.FieldByName('CCPUSER').AsString  		:= DMCXP.wUsuario;
									DMCXP.cdsDetCanje.FieldByName('CCPFREG').AsdateTime		:= date;
									DMCXP.cdsDetCanje.FieldByName('CCPHREG').AsDateTime		:= time;
									DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsDateTime		:= dtpFComp.Date;
									DMCXP.cdsDetCanje.FieldByName('CCPTCCJE').AsFloat  		:= strtofloat(dbeTCambio.Text);

									DMCXP.cdsDetCanje.FieldByName('CCPMM').AsString    		:= DMCXP.cdsMovCxP.FieldByName('CPMM').AsString;
									DMCXP.cdsDetCanje.FieldByName('CCPDD').AsString    		:= DMCXP.cdsMovCxP.FieldByName('CPDD').AsString;
									DMCXP.cdsDetCanje.FieldByName('CCPTRI').AsString   		:= DMCXP.cdsMovCxP.FieldByName('CPTRI').AsString;
									DMCXP.cdsDetCanje.FieldByName('CCPSEM').AsString   		:= DMCXP.cdsMovCxP.FieldByName('CPSEM').AsString;
									DMCXP.cdsDetCanje.FieldByName('CCPSS').AsString    		:= DMCXP.cdsMovCxP.FieldByName('CPSS').AsString;
									DMCXP.cdsDetCanje.FieldByName('CCPAATRI').AsString 		:= DMCXP.cdsMovCxP.FieldByName('CPAATRI').AsString;
									DMCXP.cdsDetCanje.FieldByName('CCPAASEM').AsString 		:= DMCXP.cdsMovCxP.FieldByName('CPAASEM').AsString;
									DMCXP.cdsDetCanje.FieldByName('CCPAASS').AsString  		:= DMCXP.cdsMovCxP.FieldByName('CPAASS').AsString;
							 //DMCXP.cdsDetCanje.FieldByName('DCDAAAA').AsString  	:= DMCXP.cdsMovCxP.FieldByName('CPAAAA').AsString;
							 //DMCXP.cdsDetCanje.FieldByName('DCDANOMM').AsString	:= DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString;
							 //DMCXP.cdsDetCanje.FieldByName('CCPANOC').AsString  	:= DMCXP.cdsLetras.FieldByName('CPAAAA').AsString;
							 //DMCXP.cdsDetCanje.FieldByName('CCPANOMM').AsString 	:= DMCXP.cdsLetras.FieldByName('CPANOMES').AsString;
								 DMCXP.cdsDetCanje.FieldByName('TMONID').AsString   		:= DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;
							 //DMCXP.cdsDetCanje.FieldByName('CCPTCDOC').AsString 	:= DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsString;
								 DMCXP.cdsDetCanje.FieldByname('CPSALLOC').ReadOnly 		:= False;
								 DMCXP.cdsDetCanje.FieldByname('CPSALEXT').ReadOnly 		:= False;
								 DMCXP.cdsDetCanje.FieldByName('CPSALLOC').AsFloat  		:= DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat;
								 DMCXP.cdsDetCanje.FieldByName('CPSALEXT').AsFloat  		:= DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;
							 //DMCXP.cdsDetCanje.FieldByName('TDIARID').AsString  	:= DMCXP.cdsLetras.FieldByName('TDIARID').AsString;
								 cdsPost(DMCXP.cdsDetCanje);
								 DMCXP.cdsDetCanje.Post;
								 DMCXP.cdsMovCxP.Edit;
								 wEstadTem := 'X';
								 DMCXP.cdsMovCxP.FieldByname('CPESTADO').AsString := wEstadTem;
								 DMCXP.cdsMovCxP.FieldByName('TCANJEID').AsString 	 := 'LA';
								 DMCXP.cdsMovCxP.FieldByName('CPCANJE').AsString  := DMCXP.cdsMovCxP2.FieldByName('CPNODOC').AsString;

								 DMCXP.cdsMovCxP.Post;

							 {DMCXP.cdsDetCanje.FieldByName('DOCID2').AsString     := DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
							 DMCXP.cdsDetCanje.FieldByName('CPSERIE2').AsString   := DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
							 DMCXP.cdsDetCanje.FieldByName('CPNODOC2').AsString   := DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;
							 DMCXP.cdsDetCanje.FieldByName('TMONID').AsString     := DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;
							 DMCXP.cdsDetCanje.FieldByname('CCPFCJE').ReadOnly    := False;
							 DMCXP.cdsDetCanje.FieldByname('DCDTCAMB').ReadOnly   := False;
							 DMCXP.cdsDetCanje.FieldByname('DCDMOLOC').ReadOnly   := False;
							 DMCXP.cdsDetCanje.FieldByname('DCDMOEXT').ReadOnly   := False;
							 DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsDateTime  := dtpFComp.Date;
							 DMCXP.cdsDetCanje.FieldByName('DCDTCAMB').AsFloat    := strtofloat(dbeTCambio.Text);
							 DMCXP.cdsDetCanje.FieldByName('DCDMOORI').AsFloat  	 := DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat;
							 DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat    := DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat;
							 DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat    := DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;
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
							 DMCXP.cdsMovCxP.Post;}

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
							 if xGlosa = '' then
									xGlosa := 'Doc. '+DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString + ' - '
							 else
									xGlosa := xGlosa + ' - Doc. '+DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString + ' - ';
							 DMCXP.cdsDetCanje.next;
						end;
				 end
				 else
				 begin
						showmessage('Saldo de Letra Anticipada esta Cubierto');
					 //** para restaurar el xNC
						xNc := xNC + DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat;
				 end;
			end;
	 end;
end;

procedure TFCanjeLT.dbgPendientes2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	dbgPendientes2.BeginDrag(False);
end;

procedure TFCanjeLT.dbgDetCanjeDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
	Accept:=True;
end;

procedure TFCanjeLT.dbgDetCanjeEndDrag(Sender, Target: TObject; X, Y: Integer);
var
	xBookMark:TBookMark;
begin
	try
		If DMCXP.wModo <> 'C' then
		begin
			If Target=dbgPendientes2 Then
			Begin
				if DMCXP.cdsDetCanje.recordcount = 0 then
					Exit;
				if DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
					xNc := xNC - DMCXP.cdsDetCanje.FieldByName('CPSALLOC').AsFloat
				else
					xNc := xNC - DMCXP.cdsDetCanje.FieldByName('CPSALEXT').AsFloat;
				//xNc := xNC + DMCXP.cdsDetCanje.FieldByName('CPSALLOC').AsFloat;
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
					DMCXP.cdsMovCxP.FieldByName('TCANJEID').AsString 	 := '';
					DMCXP.cdsMovCxP.FieldByName('CPCANJE').AsString  := '';
					DMCXP.cdsMovCxP.Post;
					FiltraGrids;
					DMCXP.cdsDetCanje.Delete;
					bbtnSumatClick(Sender);
				end;
				DMCXP.cdsMovCxP.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';
			end;
			xBookMark:=DMCXP.cdsDetCanje.GetBookmark;
			DMCXP.cdsDetCanje.first;
			xGlosa := '';
			while not DMCXP.cdsDetCanje.eof do
			begin
				If xGlosa = '' then
					xGlosa := 'Doc. '+ DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString  + ' - '
				else xGlosa := xGlosa + ' - Doc. '+DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString  + ' - ';
					DMCXP.cdsDetCanje.next;
			end;
			DMCXP.cdsDetCanje.GotoBookmark(xBookMark);
			DMCXP.cdsDetCanje.FreeBookmark(xBookMark);
		end;
	finally
		dbgDetCanje.RedrawGrid;
		DMCXP.cdsMovCxP.EnableControls;
	end;
end;

procedure TFCanjeLT.dbgDetCanjeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	dbgDetCanje.BeginDrag(False);
end;

procedure TFCanjeLT.CalculaTotalDetCje;
begin
	// Totales de Documentos de canje  (Cancelación)
	xMontoL:=0; xMontoE := 0;
	DMCXP.cdsDetCanje.DisableControls;  // inhab. movim. de puntero pal grid
	xRegAct := DMCXP.cdsDetCanje.GetBookmark;  // marca reg. donde se quedo
	DMCXP.cdsDetCanje.First ;
	wToTalDocs := 0;
	While not DMCXP.cdsDetCanje.Eof do
	begin
		// JORGE
		DMCXP.cdsDetCanje.FieldByname('CPSALLOC').ReadOnly   := False;
		DMCXP.cdsDetCanje.FieldByname('CPSALEXT').ReadOnly   := False;

		DMCXP.cdsDetCanje.Edit;
		If dblcTMon.text = DMCXP.wTMonLoc then
		begin
			DMCXP.cdsDetCanje.FieldByName('CPSALEXT').AsFloat:=DMCXP.cdsDetCanje.FieldByName('CPSALLOC').AsFloat/
																										 strtofloat(dbeTCambio.Text);
			DMCXP.cdsDetCanje.FieldByName('CPSALEXT').AsFloat:=FRound(DMCXP.cdsDetCanje.FieldByName('CPSALEXT').AsFloat,15,2);
			wToTalDocs := wToTalDocs+DMCXP.cdsDetCanje.FieldByName('CPSALLOC').AsFloat;
		end
		else
		begin
			DMCXP.cdsDetCanje.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsDetCanje.FieldByName('CPSALEXT').AsFloat*
																																strtofloat(dbeTCambio.Text),15,2);
			DMCXP.cdsDetCanje.FieldByName('CPSALLOC').AsFloat:=FRound(DMCXP.cdsDetCanje.FieldByName('CPSALLOC').AsFloat,15,2);
			wToTalDocs := wToTalDocs+DMCXP.cdsDetCanje.FieldByName('CPSALEXT').AsFloat;
		end;

		if DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
		begin
			DMCXP.cdsDetCanje.FieldByname('CPSALLOC').ReadOnly := False;
			DMCXP.cdsDetCanje.FieldByname('CPSALEXT').ReadOnly := True;
		end
		else
		if DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
		begin
			DMCXP.cdsDetCanje.FieldByname('CPSALLOC').ReadOnly := True;
			DMCXP.cdsDetCanje.FieldByname('CPSALEXT').ReadOnly := False;
		end
		else
		begin
			DMCXP.cdsDetCanje.FieldByname('CPSALLOC').ReadOnly := True;
			DMCXP.cdsDetCanje.FieldByname('CPSALEXT').ReadOnly := True;
		end;
		//
		xMontoE := xMontoE + DMCXP.cdsDetCanje.FieldByName('CPSALEXT').AsFloat;
		xMontoL := xMontoL + DMCXP.cdsDetCanje.FieldByName('CPSALLOC').AsFloat;
		DMCXP.cdsDetCanje.Next;
	end;
	DMCXP.cdsDetCanje.GotoBookmark(xRegAct);
	DMCXP.cdsDetCanje.FreeBookmark(xRegAct);
	DMCXP.cdsDetCanje.EnableControls;
end;

procedure TFCanjeLT.FiltraGrids;
begin
	 DMCXP.cdsMovCxP.Filtered := False;
	 DMCXP.cdsMovCxP.Filter   := 'CPESTADO='+quotedstr(wEstadTem);
	 DMCXP.cdsMovCxP.Filtered := True;
end;

procedure TFCanjeLT.bbtnSumatClick(Sender: TObject);
begin
	CalculaTotalDetCje;
	dbgDetCanje.ColumnByName('CPNoDoc').FooterValue:='Totales';
	if dblcTMon.Text = DMCXP.wTMonExt then
	begin
		dbgDetCanje.ColumnByName('CPSALEXT').FooterValue:=floattostrf(xMontoE,ffNumber,15,2);
		dbgDetCanje.ColumnByName('CPSALLOC').FooterValue:= floattostrf(xMontoL,ffNumber,15,2);
	end
	else
	begin
		dbgDetCanje.ColumnByName('CPSALLOC').FooterValue:=floattostrf(xMontoL,ffNumber,15,2);
		dbgDetCanje.ColumnByName('CPSALEXT').FooterValue:= floattostrf(xMontoE,ffNumber,15,2);
	end;
end;

procedure TFCanjeLT.FormActivate(Sender: TObject);
var
	xWhere : String;
begin
	 xCrea := false;
	 xNC := 0;
	 pgcDetalle.ActivePage:=tbsDocum;
	 pnlPendientes2.Enabled := True;
	 pnlDetCanje.Enabled := True;
	 Z2bbtnAcepta.Enabled := True;

	 edtCia.text  := DMCXP.displaydescrip2('dspTGE','TGE101','CIADES','CIAID='+quotedstr(dblcCia.text),'CIADES');
	 edtProv.text := DMCXP.displaydescrip2('dspTGE','TGE201','PROVDES','PROV='+quotedstr(dblcdProv.text),'PROVDES');
	 edtTMon.text := DMCXP.displaydescrip2('dspTGE','TGE103','TMONDES','TMONID='+quotedstr(dblcTMon.text),'TMONDES');
	 dblcTDocExit(Sender);

	 xWhere := 'CIAID='+''''+dblcCia.Text+''''+' and TCANJEID='+''''+'LA'+'''';
	 wCje := strZero(DMCXP.BuscaUltTGE('PrvUltCxP','CXP305','CCPCANJE',xWhere),6);
	 //wCje := DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString;

	 if length(edtTMon.Text)>0 then
		 wSimbMn:=DMCXP.displaydescrip2('dspTGE','TGE103','TMONABR','TMONID='+quotedstr(dblcTMon.text),'TMONABR');
	 edtFinal.Text:='La letra deberá ser Aplicada por la suma de '
										+ wSimbMn +'  '+ floattostrf(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat,ffNumber,15,2);
	 xNC := DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat;
	 bbtnSumatClick(Sender);

	 if DMCXP.wAdmin='G' then
			DMCXP.wModo := 'C';

	 pnlCabecera.Enabled:=True;
	 pnlDetalle.Enabled:=False;
	 if DMCXP.wModo='C' then
	 begin
			pnlCabecera.Enabled:=False;
			pnlDetalle.Enabled:=True;
	 end;

end;

procedure TFCanjeLT.bbtnCancelaClick(Sender: TObject);
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

procedure TFCanjeLT.Z2bbtnAceptaClick(Sender: TObject);
var
	xMontoNCO,xMontoNCL,xMontoNCE : Double;
	xMontoDCO,xMontoDCL,xMontoDCE : Double;
	xBool : Bool;
begin
	bbtnSumatClick(Sender);
	if DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
	begin
		if floattostrf(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat,ffNumber,15,2) <> floattostrf(xMontoL,ffNumber,15,2) then
		begin
			ShowMessage( 'Error : Monto de Amortización no Cuadra, Verifique ');
			Exit;
		end;
	end
	else
	if DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
	begin
		if floattostrf(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat,ffNumber,15,2) <> floattostrf(xMontoE,ffNumber,15,2) then
		begin
      ShowMessage( 'Error : Monto de Amortización no Cuadra, Verifique ');
			Exit;
		end;
	end
	else
	begin
		ShowMessage( 'Error : Tipo de Moneda no Existe !!!!');
		Exit;
	end;

	try
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
		If xMontoNCO <= wTotalDocs then					//	wTotalDocs = al Monto Total A Aplicar
			xBool := True;

		//** si el canje es total y no parcial
		If XBool Then
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
					If xMontoNCO <= xMontoDCO then
					begin
						//** se valida la moneda de la NC
						If dblcTMon.text = DMCXP.wTMonLoc then
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
							else
							begin
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
						else
						begin
							If dblcTMon.text = DMCXP.cdsMovCxP.FieldByName('TMONID').AsString then
							begin
								//** al saldo del Doc. se le resta el Monto de la NC
								//** el monto pagado es igual al monto de la NC
								DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat := xMontoDCE - xMontoNCE;
								DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := xMontoDCL - xMontoNCL;
								DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := xMontoDCE - xMontoNCE;
								DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat+xMontoNCE;
								DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat+xMontoNCL;
								DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat+xMontoNCE;
							end
							else
							begin
								//** se le resta el Monto de la NC
								DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat := xMontoDCL - xMontoNCL;
								DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := xMontoDCL - xMontoNCL;
								DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := xMontoDCE - xMontoNCE;
								DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat+xMontoNCL;
								DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat+xMontoNCL;
								DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat+xMontoNCE;
							end;
						end;
						If DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat = 0 then
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
						If dblcTMon.text = DMCXP.wTMonLoc then
						begin
							If dblcTMon.text = DMCXP.cdsMovCxP.FieldByName('TMONID').AsString then
							begin
								DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := xMontoDCL;
								DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := xMontoDCL;
								DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := xMontoDCE;
							end
							else
							begin
								DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := xMontoDCE;
								DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := xMontoDCL;
								DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := xMontoDCE;
							end;
						end
						else
						begin
							If dblcTMon.text = DMCXP.cdsMovCxP.FieldByName('TMONID').AsString then
							begin
								DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := xMontoDCE;
								DMCXP.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := xMontoDCL;
								DMCXP.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := xMontoDCE;
							end
							else
							begin
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
					DMCXP.cdsMovCxP.post;
				end;
				DMCXP.cdsDetCanje.next;
			end;
			DMCXP.cdsMovCxP2.Edit;
			DMCXP.cdsMovCxP2.FieldByName('CPSALORI').AsFloat := xMontoNCO;
			DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsFloat := xMontoNCL;
			DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsFloat := xMontoNCE;
			DMCXP.cdsMovCxP2.FieldByName('CPPAGORI').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat;
			DMCXP.cdsMovCxP2.FieldByName('CPPAGLOC').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat;
			DMCXP.cdsMovCxP2.FieldByName('CPPAGEXT').AsFloat := DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat;
			DMCXP.cdsMovCxP2.FieldByName('CPESTADO').AsString := 'C';
			DMCXP.cdsMovCxP2.post;
			DMCXP.AplicaDatos(DMCXP.cdsMovCxP2, 'MovCxP2'  );
			DMCXP.AplicaDatos(DMCXP.cdsMovCxP, 'MovCxP'  );
			// JORGE
			DMCXP.AplicaDatos(DMCXP.cdsDetCanje, 'DETCANJE'  );
			//

			DMCXP.SaldosAuxiliar(DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString,DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString,
												 DMCXP.cdsMovCxP2.FieldByName('CLAUXID').AsString, DMCXP.cdsMovCxP2.FieldByName('PROV').AsString,'-',
												 DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat,DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat,
												 DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString);
			showmessage('Aceptacion Ok...');
			//** Filtra
			wEstadTem := 'P';
			FiltraGrids;
			pnlPendientes2.Enabled := False;
			pnlDetCanje.Enabled := False;
			Z2bbtnAcepta.Enabled := False;
		end
		else
			ShowMessage( 'Obligaciones por Pagar, La Letra debe ser Canjeada por su Totalidad y no Parcial');
	finally
		DMCXP.cdsDetCanje.EnableControls;
		DMCXP.cdsMovCxP.EnableControls;
		wEstadTem := 'P';
		FiltraGrids;
	end;
end;

procedure TFCanjeLT.sbtABlClick(Sender: TObject);
var
	xSQL : String;
	NumReg : Integer;
begin
	bbtnSumatClick(Sender);
	if DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
	begin
		if floattostrf(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat,ffNumber,15,2) <> floattostrf(xMontoL,ffNumber,15,2) then
		begin
			 ShowMessage( 'Error : Monto de Amortización no Cuadra, Verifique ');
			 Exit;
		end;
	end
	else
	if DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
	begin
		if floattostrf(DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat,ffNumber,15,2) <> floattostrf(xMontoE,ffNumber,15,2) then
		begin
			ShowMessage( 'Error : Monto de Amortización no Cuadra, Verifique ');
			Exit;
		end;
	end
	else
	begin
		ShowMessage( 'Error : Tipo de Moneda no Existe !!!!');
		Exit;
	end;

	if DMCXP.cdsDetCxP.RecordCount > 0 then
		if MessageDlg('Ya se Genero Detalle '+ #13+#13+#13
                     +' Desea Recalcular ' ,mtConfirmation, [mbYes, mbNo], 0)=mrNo then
		begin
			Exit;
		end;
	DMCXP.cdsDetCxP.EmptyDataSet;

	NumReg:=0;
	DMCXP.cdsDetCanje.First;
	while not DMCXP.cdsDetCanje.Eof do
	begin
		//numreg:=numreg+1;
		DMCXP.cdsDetCxP.Last;
		NumReg := DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger+1;

		DMCXP.cdsDetCxP.Insert;

		DMCXP.cdsDetCxP.FieldByName('CIAID').AsString   		:= DMCXP.cdsDetCanje.fieldbyname('CIAID').AsString;
		DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString 		:= DMCXP.cdsDetCanje.fieldbyname('TDIARID').AsString;
		DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString 		:= DMCXP.cdsDetCanje.fieldbyname('CPNOREG').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString 		:= copy(DMCXP.cdsMovCxP2.fieldbyname('CPANOMES').AsString,1,4);
		DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  		:= numreg;
		DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString		:= DMCXP.cdsMovCxP2.fieldbyname('CPANOMES').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString 		:= DMCXP.cdsMovCxP2.fieldbyname('DCPLOTE').AsString;
		DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString 		:= 'LA';			// LETRAS ANTICIPADAS
		DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString 		:= 'CP';
		DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    		:= 'D';
		DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString 		:= dblcClAux.Text;
		DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString		:= DMCXP.cdsDetCanje.fieldbyname('PROV').AsString;
		DMCXP.cdsDetCxP.FieldByName('DOCID').AsString   		:= DMCXP.cdsDetCanje.fieldbyname('DOCID').AsString;
		DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString 		:= DMCXP.cdsDetCanje.fieldbyname('CPSERIE').AsString;
		DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString 		:= DMCXP.cdsDetCanje.fieldbyname('CPNODOC').AsString;
		DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat 		:= FRound(DMCXP.cdsMovCxP2.fieldbyname('CPTCAMPR').AsFloat,7,3);
		DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime		:= DMCXP.cdsDetCanje.fieldbyname('CPFEMIS').AsDateTime;
		DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime	:= DMCXP.cdsDetCanje.fieldbyname('CPFVCMTO').AsDateTime;
		//DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime	:= DMCXP.cdsDetCanje.fieldbyname('CPFCMPRB').AsDateTime;
		DMCXP.cdsDetCxP.FieldByName('TREGID').AsString   		:= DMCXP.displaydescrip2('dspTGE','TGE113','TREGID','TIPDET=''MG''','TREGID');

		if DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
			DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsString  := DMCXP.cdsDetCanje.fieldbyname('CPSALLOC').AsString
		else
			DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsString  := DMCXP.cdsDetCanje.fieldbyname('CPSALEXT').AsString;

		xSQL:='CIAID='''+DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString+''' AND TDIARID='''+DMCXP.cdsDetCanje.FieldByName('TDIARID').AsString+''' '+
					'AND CPANOMES='''+DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString+''' AND CPNOREG='''+DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString+'''';
		DMCXP.displaydescrip2('dspTGE','CXP301','CPTOTOT, CTATOTAL',xSQL,'CPTOTOT');

		DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   		:= DMCXP.cdsQry.fieldbyname('CPTOTOT').AsString;
		DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString   	:= DMCXP.cdsQry.fieldbyname('CTATOTAL').AsString;

		xSQL:='DOCID='''+DMCXP.cdsDetCxP.FieldByName('DOCID').AsString+''' AND DOCMOD=''CXP''';
		DMCXP.displaydescrip2('dspTGE','TGE110','DOCDES',xSQL,'DOCDES');

		DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString		:= DMCXP.cdsQry.fieldbyname('DOCDES').AsString+' '+
																												 DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString+'-'+
																												 DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString;
		//DMCXP.cdsDetCxP.FieldByName('CCOSID').AsString			:= DMCXP.cdsQry.fieldbyname('CCOSID').AsString;

		DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString		:= 'I';
		DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString 		:= DMCXP.wUsuario;
		DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime		:= DMCXP.cdsMovCxP2.fieldbyname('CPFREG').AsDateTime;
		DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime		:= DMCXP.cdsMovCxP2.fieldbyname('CPHREG').AsDateTime;
		DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString   		:= DMCXP.cdsMovCxP2.fieldbyname('CPMM').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString   		:= DMCXP.cdsMovCxP2.fieldbyname('CPDD').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString  		:= DMCXP.cdsMovCxP2.fieldbyname('CPTRI').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString  		:= DMCXP.cdsMovCxP2.fieldbyname('CPSEM').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString   		:= DMCXP.cdsMovCxP2.fieldbyname('CPSS').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString		:= DMCXP.cdsMovCxP2.fieldbyname('CPAATRI').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString		:= DMCXP.cdsMovCxP2.fieldbyname('CPAASEM').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString 		:= DMCXP.cdsMovCxP2.fieldbyname('CPAASS').AsString;
		DMCXP.cdsDetCxP.FieldByName('TMONID').AsString  		:= DMCXP.cdsMovCxP2.fieldbyname('TMONID').AsString;

		DMCXP.cdsDetCxP.Post;
		DMCXP.cdsdetcanje.Next;
	end;

	DMCXP.cdsQry6.First;
	while not DMCXP.cdsQry6.Eof do
	begin

		NumReg := DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger+1;
		DMCXP.cdsDetCxP.Append;

		DMCXP.cdsDetCxP.FieldByName('CIAID').AsString   		:= DMCXP.cdsMovCxP2.fieldbyname('CIAID').AsString;
		DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString 		:= DMCXP.cdsMovCxP2.fieldbyname('TDIARID').AsString;
		DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString 		:= DMCXP.cdsMovCxP2.fieldbyname('CPNOREG').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString 		:= copy(DMCXP.cdsMovCxP2.fieldbyname('CPANOMES').AsString,1,4);
		DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  		:= NumReg;
		DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString		:= DMCXP.cdsMovCxP2.fieldbyname('CPANOMES').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString 		:= DMCXP.cdsMovCxP2.fieldbyname('DCPLOTE').AsString;
		DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString 		:= 'LA';
		DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString 		:= 'CP';
		DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    		:= 'H';
		DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString 		:= dblcClAux.Text;
		DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString		:= DMCXP.cdsMovCxP2.fieldbyname('PROV').AsString;
		DMCXP.cdsDetCxP.FieldByName('DOCID').AsString   		:= DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString;
		DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString 		:= DMCXP.cdsMovCxP2.fieldbyname('CPSERIE').AsString;
		DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString 		:= DMCXP.cdsMovCxP2.fieldbyname('CPNODOC').AsString;
		DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat 		:= DMCXP.cdsMovCxP2.fieldbyname('CPTCAMPR').AsFloat;
		DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime		:= DMCXP.cdsMovCxP2.fieldbyname('CPFEMIS').AsDateTime;
		DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime	:= DMCXP.cdsMovCxP2.fieldbyname('CPFVCMTO').AsDateTime;
		DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime	  := DMCXP.cdsMovCxP2.fieldbyname('CPFCMPRB').AsDateTime;
		DMCXP.cdsDetCxP.FieldByName('TREGID').AsString   		:= DMCXP.cdsQry6.fieldbyname('TREGID').AsString;
		DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString   		:= DMCXP.cdsQry6.fieldbyname('TIPDET').AsString;

		DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsString   	:= DMCXP.cdsQry6.fieldbyname('DCPMOORI').AsString;

		DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   		:= DMCXP.cdsQry6.fieldbyname('CPTOID').AsString;
		DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString   	:= DMCXP.cdsQry6.fieldbyname('CUENTAID').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString		:= DMCXP.cdsQry6.fieldbyname('DCPGLOSA').AsString;
		DMCXP.cdsDetCxP.FieldByName('CCOSID').AsString			:= DMCXP.cdsQry6.fieldbyname('CCOSID').AsString;

		DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString		:= 'I';
		DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString 		:= DMCXP.wUsuario;
		DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime		:= DMCXP.cdsMovCxP2.fieldbyname('CPFREG').AsDateTime;
		DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime		:= DMCXP.cdsMovCxP2.fieldbyname('CPHREG').AsDateTime;
		DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString   		:= DMCXP.cdsMovCxP2.fieldbyname('CPMM').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString   		:= DMCXP.cdsMovCxP2.fieldbyname('CPDD').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString  		:= DMCXP.cdsMovCxP2.fieldbyname('CPTRI').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString  		:= DMCXP.cdsMovCxP2.fieldbyname('CPSEM').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString   		:= DMCXP.cdsMovCxP2.fieldbyname('CPSS').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString		:= DMCXP.cdsMovCxP2.fieldbyname('CPAATRI').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString		:= DMCXP.cdsMovCxP2.fieldbyname('CPAASEM').AsString;
		DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString 		:= DMCXP.cdsMovCxP2.fieldbyname('CPAASS').AsString;
		DMCXP.cdsDetCxP.FieldByName('TMONID').AsString  		:= DMCXP.cdsMovCxP2.fieldbyname('TMONID').AsString;

		DMCXP.cdsDetCxP.Post;
		DMCXP.cdsQry6.Next;
	end;

end;

procedure TFCanjeLT.Z2bbtnGrabaClick(Sender: TObject);
begin
	 DMCXP.AplicaDatos( DMCXP.cdsMovCxP2, 'MOVCXP' );

	 DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DETCXP' );

	 DMCXP.AplicaDatos( DMCXP.cdsDetCanje, 'DETCANJE' );
end;

procedure TFCanjeLT.dblcTDocExit(Sender: TObject);
var
	 xTDiar2, xWhere : string;
begin
	 if xCrea then Exit;
//   if bbtnBorra.Focused then Exit;

	 xWhere:='DOCID='+quotedstr(dblcTDoc.Text)
					+' and DOCMOD='+quotedstr(DMCXP.wModulo);
	 edtTDoc.Text:=BuscaQry('PrvTGE','TGE110','*',xWhere,'DOCDES');

	 if length(edtTDoc.Text)>0 then
	 begin
			xConta  := DMCXP.cdsQry.fieldbyname('DOCCONTA').AsString;
			xTDiar2 := DMCXP.cdsQry.fieldbyname('TDIARID2').AsString;
	 // Asigna Tipo de Diario a lookup combo TDiario
			DMCXP.cdsMovCxP2.Edit;
			DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString:=DMCXP.cdsQry.fieldbyname('TDiarID').Asstring;
	 // Busca descripción TDiario y asigna a edit TDiario
			edtTDiario.Text  := DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);
	 // Filtra Tipo de Diario específico
			xFiltroTDiar:='TDiarID='+''''+DMCXP.cdsUltTGE.fieldbyname('TDIARID').Asstring+'''';
			if length(xTDiar2)>0 then
			begin
				 xFiltroTDiar:=xFiltroTDiar+' or TDiarID='+''''+xTDiar2+'''';
			end;
			DMCXP.cdsTDiario.Filter  :='';
			DMCXP.cdsTDiario.Filter  :=xFiltroTDiar;
			DMCXP.cdsTDiario.Filtered:=true;
			if DMCXP.cdsTDiario.Recordcount=0 then
			begin
				 dblcTDoc.SetFocus;
				 Raise Exception.Create('Documento No Tiene Tipo De Diario asignado');
			end;
			if DMCXP.cdsTDiario.Recordcount=1 then
				 dblcTDiario.Enabled:=false
			else begin
				 dblcTDiario.Enabled:=true;
			end;
	 end
	 else
	 begin
			raise Exception.Create('Falta Código de Documento');
	 end;
	 dbdtpFEmis.SetFocus;
end;

procedure TFCanjeLT.dtpFCompExit(Sender: TObject);
var
	 xWhere, xMes : string;
	 xFCierre : TDate;
	 wAno, wMes, wDia: Word;
	 xTAutoNum,xTAno,xTMes : String;
begin
	 if xCrea then Exit;
//	 if bbtnBorra.Focused then Exit;
	 if edtNoDoc.Focused  then Exit;
	 if edtSerie.Focused  then Exit;
	 if dblcTDoc.Focused  then Exit;

	 if Length(edtNoDoc.Text)=0 then
	 begin
			Raise Exception.Create('Falta Número de Documento');
	 end;

	 if dtpFComp.Date=0 then
	 begin
			dtpFComp.SetFocus;
			Raise Exception.Create('Falta Fecha de Comprobante');
	 end;

	 if xControlFec(dblcCia.Text, dtpFComp.Date) = False then
	 begin
			dtpFComp.SetFocus;
			Exit;
	 end;

	 DecodeDate(dtpFComp.Date, wAno, wMes, wDia);
	 xMes := strZero(inttostr(wMes),2);
	 xTMes := xMes;
	 xTAno := IntToStr(wAno);
	 DMCXP.cdsMovCxP2.Edit;
//	 DMCXP.cdsMovCxP2.fieldbyname('CPNOREG').AsString := dbeNoReg.Text;
	 DMCXP.cdsMovCxP2.fieldbyname('CPANOMES').AsString:= IntToStr(wAno)+xMes;

	 if (length(edtTDiario.Text)>0) and (length(dbeNoReg.Text)=0) then
	 begin
			xTAutoNum := DMCXP.DisplayDescrip('TGE104','AUTONUM','TDIARID',dblcTDiario.Text);
			DMCXP.cdsMovCxP2.fieldbyname('CPNOREG').AsString:= DMCXP.UltimoRegistroCXP(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes );
			DMCXP.cdsMovCxP2.fieldbyname('CPNOREG').AsString:= Strzero(DMCXP.cdsMovCxP2.fieldbyname('CPNOREG').AsString, DMCXP.cdsMovCxP2.fieldbyname('CPNOREG').Size );
	 end;
//	 DMCXP.cdsMovCxP2.fieldbyname('CPFRECEP').AsDateTime:= DMCXP.cdsMovCxP2.fieldbyname('CPFCMPRB').AsDateTime;
//	 DMCXP.cdsMovCxP2.fieldbyname('CPFEMIS').AsDateTime := DMCXP.cdsMovCxP2.fieldbyname('CPFCMPRB').AsDateTime;
	 DMCXP.cdsMovCxP2.fieldbyname('CPFVCMTO').AsDateTime:= DMCXP.cdsMovCxP2.fieldbyname('CPFCMPRB').AsDateTime;
	 DMCXP.cdsMovCxP2.Post;
	 dblcTMonExit(Sender);
   dbeNoReg.SetFocus;
end;

procedure TFCanjeLT.bbtnOKClick(Sender: TObject);
var
	 xFiltro : String;
begin
	 if xCrea then Exit;
	 if not ConsistenciaDoc then Exit;

	 if xControlFec(dblcCia.Text, dtpFComp.Date) = False then
	 begin
			exit;
	 end;

	 DMCXP.cdsMovCxP.Edit;
	 DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString  := dblcClAux.Text;
	 DMCXP.cdsMovCxP.fieldbyname('CP_CONTA').AsString := 'N';

	 if DMCXP.BuscaFecha('TGE114','FecAno','Fecha',dtpFComp.date ) then
	 begin
			DMCXP.cdsMovCxP2.fieldbyname('CPAAAA').AsString := DMCXP.cdsUltTGE.fieldbyname('FECANO'  ).Value;    // ano
			DMCXP.cdsMovCxP2.fieldbyname('CPMM').AsString   := DMCXP.cdsUltTGE.fieldbyname('FECMES'  ).Value;    // mes
			DMCXP.cdsMovCxP2.fieldbyname('CPDD').AsString   := DMCXP.cdsUltTGE.fieldbyname('FECDIA'  ).Value;    // día
			DMCXP.cdsMovCxP2.fieldbyname('CPTRI').AsString  := DMCXP.cdsUltTGE.fieldbyname('FECTRIM' ).Value;    // trimestre
			DMCXP.cdsMovCxP2.fieldbyname('CPSEM').AsString  := DMCXP.cdsUltTGE.fieldbyname('FECSEM'  ).Value;    // semestre
			DMCXP.cdsMovCxP2.fieldbyname('CPSS').AsString   := DMCXP.cdsUltTGE.fieldbyname('FECSS'   ).Value;    // semana
			DMCXP.cdsMovCxP2.fieldbyname('CPAATRI').AsString:= DMCXP.cdsUltTGE.fieldbyname('FECAATRI').Value;    // año+trimestre
			DMCXP.cdsMovCxP2.fieldbyname('CPAASEM').AsString:= DMCXP.cdsUltTGE.fieldbyname('FECAASEM').Value;    // año+semestre
			DMCXP.cdsMovCxP2.fieldbyname('CPAASS').AsString := DMCXP.cdsUltTGE.fieldbyname('FECAASS' ).Value;    // año+semana
	 end;
	 DMCXP.cdsMovCxP2.fieldbyname('CPUSER').AsString     := DMCXP.wUsuario; // usuario que registra
	 DMCXP.cdsMovCxP2.fieldbyname('CPFREG').AsDateTime   := Date;         // fecha que registra Usuario
	 DMCXP.cdsMovCxP2.fieldbyname('CPHREG').AsDateTime   := Time;         // Hora de Registro de Usuario
	 pnlCabecera.Enabled:=False;
	 pnlDetalle.Enabled:=True;
end;

function TFCanjeLT.ConsistenciaDoc: Boolean;
begin
 // consistencia Código de Compañía
	 if length(dblcCia.Text)=0 then
			raise exception.Create('Falta Código de Compañía');
	 if length(edtCia.Text)=0 then
			raise exception.Create('Código de Compañía Errado');

 // consistencia Código de Proveedor
	 if length(dblcdProv.Text)=0 then
			raise exception.Create('Faltan Datos del Proveedor');
	 if length(edtProv.Text)=0 then
			raise exception.Create('Código/RUC de Proveedor Errado');

 // consistencia ingreso de tipo de documento
	 if length(dblcTDoc.Text)=0 then
			raise exception.Create('Falta Tipo de Documento');
	 if length(lblTDoc.Caption)=0 then
			raise exception.Create('Tipo de Documento Errado');

 // consistencia No.Doc
	 if length(edtNoDoc.Text)=0 then
			raise exception.Create('Falta No. de Documento');

 // consistencia ingreso de Tipo de Diario
	 if length(dblcTDiario.Text)=0 then
			raise exception.Create('Falta Tipo de Diario');
	 if length(edtTDiario.Text)=0 then
			raise exception.Create('Tipo de Diario Errado');

 // consistencia Periodo
	 if length(meAnoMM.Text)<6 then
			raise exception.Create('Periodo Errado (AAAAMM)');

 // consistencia ingreso de No.Registro
	 if length(dbeNoReg.Text)=0 then
			raise exception.Create('Falta No.Registro');

 // consistencia ingreso de Fecha de Documento
	 if dbdtpFEmis.Date=0 then
			raise exception.Create('Falta Fecha de Documento');

// // consistencia ingreso de Fecha de Vencimiento
//	 if dtpFVcmto.Date=0 then
//			raise exception.Create('Falta Fecha de Vencimiento');

 // consistencia ingreso de Tipo de Moneda
	 if length(dblcTMon.Text)=0 then
			raise exception.Create('Falta Tipo de Moneda');
	 if length(edtTMon.Text)=0 then
			raise exception.Create('Tipo de Moneda Errado');

 // consistencia ingreso de Fecha de Comprobante
	 if dtpFComp.Date=0 then
			raise exception.Create('Falta Fecha de Comprobante');

 // consistencia ingreso de Tipo de Cambio
	 if dbeTCambio.Text='' then
			raise exception.Create('Falta Tipo de Cambio');
	 if strtofloat(dbeTCambio.Text)=0 then
			raise exception.Create('Falta Tipo de Cambio');

 // Fecha de Recepción
	 if dbdtpFRecep.date=0 then
			raise exception.Create('Falta Fecha de Recepción');

	 Result := True;

end;

procedure TFCanjeLT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	 xCrea := true;
	 DMCXP.cdsMovCxP2.CancelUpdates;
	 DMCXP.cdsDetCxP.CancelUpdates;
	 DMCXP.cdsMovCxP.CancelUpdates;
	 DMCXP.cdsDetCanje.CancelUpdates;
	 DMCXP.cdsMovCxP.IndexFieldNames:='';
	 DMCXP.cdsMovCxP2.IndexFieldNames:='';
	 DMCXP.cdsDetCxP.IndexFieldNames:='';
end;

procedure TFCanjeLT.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if FCanjeLT.activecontrol is twwdbgrid then
			Exit ;
	 if key=#13 then
	 begin
			key:=#0;
			perform(CM_DialogKey,VK_TAB,0);
	 end;
end;

procedure TFCanjeLT.dblcTMonExit(Sender: TObject);
var
	 xWhere, xTipo : string;
begin
	 if xCrea then Exit;
	 if dbdtpFEmis.Focused  then Exit;

	 Screen.Cursor:=crHourGlass;
//	 if not bbtnBorra.Focused then
//	 begin
			xWhere:='TMonId='+''''+dblcTMon.Text+'''';
			//       +' and (TMON_LOC='+''''+'L'+''''+' or TMON_LOC='+''''+'E'+''''+')';
			edtTMon.Text:=BuscaQry('PrvTGE','TGE103','TMONDES, TMON_LOC',xWhere,'TMONDES');
			if length(edtTMon.Text)=0 then
			begin
				 Screen.Cursor:=crDefault;
				 ShowMessage('Falta Tipo de Moneda');
				 dblcTMon.SetFocus;
				 exit;
			end;

			xTipo:=DMCXP.cdsQry.FieldByName('TMON_LOC').AsString;

			if (xTipo='L') then
				 xWhere:='TMONID='+''''+DMCXP.wTMonExt+''''+' and '
								+'FECHA='+DMCXP.wRepFuncDate+''''+ FormatDateTime(DMCXP.wFormatFecha,dtpFComp.Date)+''''+')'
			else
				 xWhere:='TMONID='+''''+dblcTMon.Text+''''+' and '
								+'FECHA='+DMCXP.wRepFuncDate+''''+ FormatDateTime(DMCXP.wFormatFecha,dtpFComp.Date)+''''+')';

			if length(BuscaQry('PrvTGE','TGE107','*',xWhere,'TMONID'))>0 then
			begin
				 xxTCambio:=DMCXP.cdsQry.fieldbyname('TCAM'+DMCXP.wVRN_TipoCambio).AsFloat;

				 if (xTipo<>'L') and (xTipo<>'E') then begin
						xWhere:='TMonId='+''''+DMCXP.wTMonExt+''''+' and '
									 +'Fecha='+DMCXP.wRepFuncDate+''''+ FormatDateTime(DMCXP.wFormatFecha,dtpFComp.Date)+''''+')';
						if length(BuscaQry('PrvTGE','TGE107','*',xWhere,'TMONID'))>0 then
							 xxTCamDol:=DMCXP.cdsQry.fieldbyname('TCam'+DMCXP.wVRN_TipoCambio).AsFloat
						else begin
							 Screen.Cursor:=crDefault;
							 dtpFComp.SetFocus;
							 raise exception.create( ' Error :  Fecha No tiene Tipo de Cambio Dólares' );
						end;
				 end;
			end
			else
			begin
				 Screen.Cursor:=crDefault;
				 dtpFComp.SetFocus;
				 raise exception.create( ' Error :  Fecha No tiene Tipo de Cambio para la Moneda seleccionada' );
			end;

			DMCXP.cdsMovCxP2.Edit;
			DMCXP.cdsMovCxP2.fieldbyname('CPTCAMPR').AsFloat := xxTCambio;
			DMCXP.cdsMovCxP2.fieldbyname('CPTCAMDOL').AsFloat:= xxTCamDol;

//	 end;
	 Screen.Cursor:=crDefault;
end;

procedure TFCanjeLT.dbgDetCanjeKeyPress(Sender: TObject; var Key: Char);
begin
	 if key=#13 then
		begin
			dbgDetCanjeColExit(Sender);
		end;
end;

procedure TFCanjeLT.dbgDetCanjeColExit(Sender: TObject);
begin
	bbtnSumatClick(Sender);
end;

procedure TFCanjeLT.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.
