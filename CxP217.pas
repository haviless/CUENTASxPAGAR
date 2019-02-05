
unit CxP217;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit,
  wwdblook, Wwdbdlg, db, ppDB, ppDBPipe, ppCtrls, ppBands, ppVar, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, variants;

type
  TFDetAmo = class(TForm)
    pnlHEAD: TPanel;
    Z2bbtnAceptar: TBitBtn;
    dbgEst4: TwwDBGrid;
    pnlFOOT: TPanel;
    Z2bbtnCancel: TBitBtn;
    bbtnPrint: TBitBtn;
    dblcCLIE: TwwDBLookupComboDlg;
    Label11: TLabel;
    dbeCLIE: TwwDBEdit;
    lblTipCam: TLabel;
    stt1: TStaticText;
    stt2: TStaticText;
    Label4: TLabel;
    Bevel2: TBevel;
    dblcSER: TwwDBLookupCombo;
    Label1: TLabel;
    dblcTDOC: TwwDBLookupCombo;
    Label2: TLabel;
    dbeTDOC: TwwDBEdit;
    dbeNDOC: TwwDBEdit;
    Label3: TLabel;
    Panel1: TPanel;
    stMoneda: TStaticText;
    Label5: TLabel;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    pplCia: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel19: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc2: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppLabel18: TppLabel;
    ppDBPipeline: TppDBPipeline;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel12: TppLabel;
    pplblCliente: TppLabel;
    ppLabel15: TppLabel;
    pplblTDoc: TppLabel;
    ppLabel21: TppLabel;
    pplblSerie: TppLabel;
    ppLabel23: TppLabel;
    pplblNoDoc: TppLabel;
    ppLabel25: TppLabel;
    pplblMoneda: TppLabel;
    ppLabel27: TppLabel;
    pplblImporte: TppLabel;
    ppLabel29: TppLabel;
    pplblSaldo: TppLabel;
    pplblCodigo: TppLabel;
    ppLabel13: TppLabel;
    ppLabel20: TppLabel;
    ppLabel22: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    procedure dblcCLIEChange(Sender: TObject);
    procedure Z2bbtnCancelClick(Sender: TObject);
    procedure dblcTDOCChange(Sender: TObject);
    procedure dblcSERChange(Sender: TObject);
    procedure dblcExit(Sender: TObject);
    procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure Z2bbtnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgEst4Enter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnPrintClick(Sender: TObject);
  private
    { Private declarations }
    sCIA, sCLI, sSER, sTDO, sSQL : String;

    procedure dcCLI;
    procedure dcSER;
    procedure dcTDO;
    procedure cSQL;
    procedure cQRY;
    procedure cGRID;
    procedure cFOOTER;
    procedure cSALDOS;
    function  CajaDec(xNumero : string ;Digitos : Integer = 2) : string ;    
  public
    { Public declarations }
    MonLoc : Boolean;
    Compania, Cliente , Documento, TDocumento,
    TDiario, NumReg, Periodo, Serie : String;
    DImporte, DSaldo : Double;
    procedure Generate;
  end;

var
  FDetAmo: TFDetAmo;

implementation

uses CxPDM  ;

{$R *.DFM}

procedure TFDetAmo.dblcCLIEChange(Sender: TObject);
begin
{
  sCLI := dblcCLIE.Text;
  dbeCLIE.Text := DMCXP.cdsClie.FieldByName('CLIEDES').AsString;
}  
end;

procedure TFDetAmo.Z2bbtnCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TFDetAmo.dblcTDOCChange(Sender: TObject);
begin
{
  sTDO := dblcTDOC.Text;
  dbeTDOC.Text := DMCXP.cdsTDoc.FieldByName('DOCDES').AsString;
}
end;

procedure TFDetAmo.dblcSERChange(Sender: TObject);
begin
//hALLAR LA DESCRIPCIÓN DE LA SERIE
{
  sSER := dblcSER.Text;
  dbeSER.Text := DMCXP.cdsSerie.FieldByName('SERIEDES').AsString;
}
{WMC2903
   with DMCXP.cdsUltTGE do
   begin
      Close ;
      DataRequest( ' SELECT * FROM CXP103 WHERE SERIEID=''' + dblcSER.Text + ''' ' ) ;
      Open ;
      if recordcount <> 0 then
         dbeser.Text := fieldbyname('SERIEDES').AsString
      else
         dbeSER.Text := '' ;
   end ;
}
end;

procedure TFDetAmo.dblcExit(Sender: TObject);
var
 bRq : Boolean;
begin
  if TwwDBCustomLookupCombo(Sender).DataSource <> nil then
    bRq := TwwDBCustomLookupCombo(Sender).DataSource.DataSet.FieldByName(TwwDBCustomLookupCombo(Sender).DataField).Required;
  if (bRq) and (trim(TwwDBCustomLookupCombo(Sender).Text)='') then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFDetAmo.dblcNotInList(Sender: TObject; LookupTable: TDataSet;
  NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFDetAmo.Z2bbtnAceptarClick(Sender: TObject);
begin
//
end;

procedure TFDetAmo.FormCreate(Sender: TObject);
begin
 Cursor := crDefault;

 dblcCLIE.OnNotInList := dblcNotInList;
 sCIA :='';
 sCLI :='';
 sSER :='';
 sTDO :='';

 DMCXP.cdsTDoc.Open;

 dcCLI;
 dcSER;
 dcTDO;

end;

procedure TFDetAmo.dcCLI;
begin
  if trim(Cliente)='' then
  begin
   dblcCLIE.Text := Cliente;
   dblcCLIE.Enabled := False;
   sCLI := Cliente;
   Exit;
  end;

end;

procedure TFDetAmo.dcSER;
begin
{  DMCXP.cdsSerie.First;
  sSER := trim(DMCXP.cdsSerie.FieldByName('SERIEID').AsString);
  dblcSER.Text := sSER;

  dblcSER.Enabled := DMCXP.cdsSerie.RecordCount > 1;}
end;

procedure TFDetAmo.dcTDO;
begin
  if trim(TDocumento)='' then
  begin
   dblcTDOC.Text := TDocumento;
   dblcTDOC.Enabled := False;
   sTDO := TDocumento;
   Exit;
  end;

{ DMCXP.cdsTDoc.First;
  sSER := trim(DMCXP.cdsTDoc.FieldByName('DOCID').AsString);
  dblcTDOC.Text := sTDO;
  dblcTDOC.Enabled := DMCXP.cdsTDoc.RecordCount > 1;}
end;


procedure TFDetAmo.cSQL;
begin
{
   dbgEst4.Selected.Clear;
   dbgEst4.Selected.Add('CCPFCJE'#9'11'#9'Fecha de~Pago'#9'F');
   dbgEst4.Selected.Add('DOCABR'#9'10'#9'Tipo~Doc.'#9'F');
   dbgEst4.Selected.Add('CPSERIE2'#9'8'#9'Nº de~Serie'#9'F');
   dbgEst4.Selected.Add('CPNODOC2'#9'10'#9'Documento'#9'F');
   dbgEst4.Selected.Add('TCANJEID'#9'10'#9'Tipo de~Canje'#9'F');
   dbgEst4.Selected.Add('CCPCANJE'#9'10'#9'Nº de Canje'#9'F');
   dbgEst4.Selected.Add('TMONABR'#9'6'#9'T.M.'#9'F');
   dbgEst4.Selected.Add('DCDMOLOC'#9'15'#9'Monto~(MN)'#9'F');
   dbgEst4.Selected.Add('DCDMOEXT'#9'15'#9'Monto~(ME)'#9'F');
}
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
    sSQL:=' SELECT A.*, '+
          '  B.DOCABR , G.PROVDES , E.TMONDES, E.TMONABR, E.TMON_LOC, F.CIADES ' +
          ' FROM CXP305 A ' +
          ' LEFT  JOIN TGE103 E ON (E.TMONID=A.TMONID)'+
          ' LEFT  JOIN TGE110 B ON (B.DOCID=A.DOCID2 AND B.DOCMOD = ''CXP'' )'+
          ' LEFT  JOIN TGE101 F ON (F.CIAID=A.CIAID)'+
          ' LEFT  JOIN TGE201 G ON (G.PROV=A.PROV)'+
          ' WHERE '+
          ' A.CIAID = '''+Compania+''''+
          ' AND A.PROV = '''+Cliente+''''+
          ' AND A.DOCID = '''+TDocumento+''''+
          ' AND A.CPSERIE = '''+Serie+''''+
          ' AND A.CPNODOC = '''+Documento+'''';
  end
  else
	if SRV_D = 'ORACLE' then
  begin
    sSQL:='SELECT A.*, '+
          '  B.DOCABR , G.PROVDES , E.TMONDES, E.TMONABR, E.TMON_LOC, F.CIADES ' +
          ' FROM  CXP305 A, TGE103 E, TGE110 B, TGE101 F, TGE201 G' +
          ' WHERE'+
          ' A.CIAID = '''+Compania+''''+
          ' AND A.PROV = '''+Cliente+''''+
          ' AND A.DOCID = '''+TDocumento+''''+
          ' AND A.CPSERIE = '''+Serie+''''+
          ' AND A.CPNODOC = '''+Documento+''''+
          ' AND E.TMONID(+)=A.TMONID'+
          ' AND B.DOCID(+)=A.DOCID2 AND B.DOCMOD = ''CXP'''+
          ' AND F.CIAID(+)=A.CIAID'+
          ' AND G.PROV=A.PROV(+)';
	end;
end;

procedure TFDetAmo.cQRY;
begin
 DMCXP.cdsQry3.ProviderName := 'dspTGE';
 DMCXP.cdsQry3.Close;
 DMCXP.cdsQry3.DataRequest(sSQL);
 DMCXP.cdsQry3.Open;
 TNumericField(DMCXP.cdsQry3.FieldByName('DCDMOLOC')).DisplayFormat  :='### ### ###.#0';
 TNumericField(DMCXP.cdsQry3.FieldByName('DCDMOEXT')).DisplayFormat  :='### ### ###.#0';
end;

procedure TFDetAmo.Generate;
begin

 cSQL;
 cGRID;
 cQRY;
 cGRID;
 cFOOTER;
 cSALDOS;

end;

procedure TFDetAmo.FormShow(Sender: TObject);
begin
  DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
  
  Generate;
  //** 11/09/2001 - pjsv
  dblcCLIE. Text := Cliente;
  dblcSER. Text := Serie;
  dblcTDOC. Text := TDocumento;
  dbeNDOC. Text  := Documento;
  //**

  if MonLoc then
  begin
     if DMCXP.cdsTMon.Locate('TMON_LOC',VarArrayOf(['L']),[]) then
        stMoneda.Caption := DMCXP.cdsTMon.fieldbyname('TMONABR').AsString ;
  end
  else
     if DMCXP.cdsTMon.Locate('TMON_LOC',VarArrayOf(['E']),[]) then
     begin
        stMoneda.Caption := DMCXP.cdsTMon.fieldbyname('TMONABR').AsString ;
     end ;

end;

procedure TFDetAmo.cFOOTER;
begin
  with dbgEst4 do
  begin
    FooterCellColor := clInfoBk;
    if MonLoc then
       ColumnByName ('DCDMOLOC').FooterValue :=cAJADEC( FloatToStr(OperClientDataset(DMCXP.cdsQRY3,'SUM(DCDMOLOC)','')))
    else
       ColumnByName ('DCDMOEXT').FooterValue :=cAJADEC( FloatToStr(OperClientDataset(DMCXP.cdsQRY3,'SUM(DCDMOEXT)',''))  ) ;
  end;
end;

procedure TFDetAmo.cGRID;
begin
   dbgEst4.Selected.Clear;
   dbgEst4.Selected.Add('CCPFCJE'#9'11'#9'Fecha de~Pago'#9'F');
   dbgEst4.Selected.Add('DOCABR'#9'10'#9'Tipo~Doc.'#9'F');
   dbgEst4.Selected.Add('CPSERIE2'#9'8'#9'Nº de~Serie'#9'F');
   dbgEst4.Selected.Add('CPNODOC2'#9'15'#9'Documento'#9'F');
   dbgEst4.Selected.Add('TCANJEID'#9'10'#9'Tipo de~Canje'#9'F');
   dbgEst4.Selected.Add('CCPCANJE'#9'10'#9'Nº de Canje'#9'F');
   dbgEst4.Selected.Add('TMONABR'#9'6'#9'T.M.'#9'F');
   dbgEst4.Selected.Add('DCDMOLOC'#9'15'#9'Monto~(MN)'#9'F');
   dbgEst4.Selected.Add('DCDMOEXT'#9'15'#9'Monto~(ME)'#9'F');

end;

procedure TFDetAmo.cSALDOS;
begin
  stt1.Caption := Format(' %15.2f',[DImporte]);
  stt2.Caption := Format(' %15.2f',[DSaldo]);
end;

procedure TFDetAmo.dbgEst4Enter(Sender: TObject);
begin
  cFOOTER;
end;

procedure TFDetAmo.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;

end;

function TFDetAmo.CajaDec(xNumero: string; Digitos: Integer): string;
var
   xFloat : Double ;
   xNumTmp : String ;
begin
   if trim(xNumero) <> '' then
      xFloat  := strtofloat ( xNumero )
   else
      xFloat  := 0 ;
   xNumTmp := floattostrf(xFloat,fffixed,10,Digitos) ;
   xFloat  := strtofloat(xNumTmp) ;
   if xFloat = 0 then
   begin
      Result := '' ;
   end
   else
   begin
      Result := xNumTmp ;
   end ;
end ;

procedure TFDetAmo.bbtnPrintClick(Sender: TObject);
begin
  //previa

  pplblCodigo.Caption  := dblcCLIE.Text ;
  pplblCliente.Caption := dbeCLIE.Text  ;
  pplblTDoc.Caption    := dbeTDOC.Text ;
  pplblSerie.Caption   := dblcSER.Text  ;
  pplblNoDoc.Caption   := dbeNDOC.Text ;
  pplblMoneda.Caption  := stMoneda.Caption ;
  pplblImporte.Caption := TRIM(stt1.Caption) ;
  pplblSaldo.Caption   := tRIM(stt2.Caption) ;

  if not DMCXP.cdsCia.Active then
     DMCXP.cdsCia.Open ;
  pplCia.Caption       := DMCXP.cdsCia.fieldbyname('CIAABR').AsString ;
  
  ppReport.Print ;
end;

end.
