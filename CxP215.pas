unit CxP215;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, wwdbedit, StdCtrls, wwdblook, ExtCtrls, Buttons, Grids, Wwdbigrd,
  Wwdbgrid, Wwdbspin, db, DBClient, wwclient, ppCache, ppDB, ppDBPipe,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands, ppPrnabl, ppCtrls,
  ppVar, ppViewr, ppModule, daDatMod, Wwkeycb, variants, ppTypes;

type
  TFEstCtaCli = class(TForm)
    pnlHEAD: TPanel;
    grBCIA: TGroupBox;
    Label11: TLabel;
    Label1: TLabel;
    dbeCIA: TwwDBEdit;
    dbeMoneda: TwwDBEdit;
    dbclMoneda: TwwDBLookupCombo;
    rgImportes: TRadioGroup;
    pnlFOOT: TPanel;
    Z2bbtnCancel: TBitBtn;
    Z2bbtnAceptar: TBitBtn;
    dbgEst1: TwwDBGrid;
    GroupBox1: TGroupBox;
    dbSpAnno: TwwDBSpinEdit;
    cbMes: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    bbtnPrint: TBitBtn;
    ppReport: TppReport;
    ppDBPipeline: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    pplblPERIODO: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLabel12: TppLabel;
    pnlOrden: TPanel;
    lblBusca: TLabel;
    Bevel1: TBevel;
    isBusca: TwwIncrementalSearch;
    btnSalir: TBitBtn;
    pplCia: TppLabel;
    rgMoneda: TRadioGroup;
    dbeSaldoWhere: TwwDBEdit;
    Bevel2: TBevel;
    Label4: TLabel;
    ppDBText6: TppDBText;
    ppDBCalc7: TppDBCalc;
    ppLabel14: TppLabel;
    ppLabel4: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel19: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    dblcCia: TwwDBLookupCombo;
    procedure dblcExist(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Z2bbtnCancelClick(Sender: TObject);
    procedure dbclMonedaChange(Sender: TObject);
    procedure Z2bbtnAceptarClick(Sender: TObject);
    procedure cbMesChange(Sender: TObject);
    procedure dbgEst1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure bbtnPrintClick(Sender: TObject);
    procedure ppReportPreviewFormCreate(Sender: TObject);
    procedure dbgEst1TitleButtonClick(Sender: TObject; AFieldName: String);
    procedure btnSalirClick(Sender: TObject);
    procedure isBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgEst1CalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbMesExit(Sender: TObject);
    procedure dbSpAnnoKeyPress(Sender: TObject; var Key: Char);
    procedure dbSpAnnoExit(Sender: TObject);
    procedure cbMesEnter(Sender: TObject);
    procedure dbgEst1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure rgImportesClick(Sender: TObject);
    procedure dbeSaldoWhereKeyPress(Sender: TObject; var Key: Char);
    procedure dbeSaldoWhereExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);

  private
    { Private declarations }
    wAnoHoy ,wMesHoy : Word ;
    procedure cReport;
    procedure Valida ;
  public
    { Public declarations }
    iYEAR, iMONTH          : Integer;
    isMLOC                 : Boolean;
    sCIA, sMON, sSQL,
    sSACUM, sSAMES, sSAANT, sSAANTL, sSAANTE,
    sM, sMES, sMESA, sMesN,sGroupBy           : String;

    san, sac, sal,TotalMn,TotalMe,AntLoc,AntExt,CheLoc,CheExt,LetNor,LetExt,NCreLoc,NCreExt : Double;
    sFechaEmision:string;
    procedure dcCIA;
    procedure dcMon;
    procedure strGRID;
    procedure cSQL;
    procedure cFooter;
  end;

var
  FEstCtaCli: TFEstCtaCli;

implementation

uses CxPDM, CxP216;

{$R *.DFM}

function OperClientDataSet( ClientDataSet : TwwClientDataSet;
                            Expression, Condicion : String  ) : Double;
var
  cdsClone    : TwwClientDataSet;
//bmk         : TBookmark;
  Agg         : TAggregate;
begin
  result := 0;

  if trim(Expression)= '' then Exit;

//  bmk:=ClientDataSet.GetBookmark;
  cdsClone    := TwwClientDataSet.Create(nil);
  try

    with cdsClone do
    begin
      CloneCursor(ClientDataSet,True);
      Agg := nil;
      Agg := Aggregates.Add;
      Agg.AggregateName := 'OPER';
      Agg.Expression := Expression;
      Agg.Active := True;

      if Trim(Condicion)<>'' then
      begin
        Filtered     := False;
        Filter       := Condicion;
        Filtered     := True;
      end;

      if Aggregates.Items[Aggregates.IndexOf('OPER')].Value<>NULL then
         result := Aggregates.Items[Aggregates.IndexOf('OPER')].Value;

      Aggregates.Clear;

    end;
//    ClientDataSet.GotoBookmark(bmk);
//    ClientDataSet.FreeBookmark(bmk);
  finally
    cdsClone.Free;
  end;
end;


procedure TFEstCtaCli.dblcExist(Sender: TObject);
begin

	 dbeCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CIAID',dblcCia.Text);

	 if length(dbeCia.Text)=0 then
	 begin
			ShowMessage('Falta Código de Compañía');
			dblcCia.SetFocus;
	 end;
end;

procedure TFEstCtaCli.FormCreate(Sender: TObject);
Var
  i        : Integer;
  y, m, d  : word;
begin

  for i:=1 to 12 do
  begin
    cbMes.Items.Add(UpperCase(LongMonthNames[i]));
  end;
  DecodeDate(Date,y,m,d);
//
  wAnoHoy := y ;
  wMesHoy := m ;
//
  cbMes.ItemIndex := m-1;
  dbSpAnno.Value  := y;

  iYEAR := y;
  sMES  := StrZero(FloatToStr(m),2);
  sMESA  := StrZero(FloatToStr(m-1),2);
  dcCIA;
  dcMon;

  cSQL;

  dbgEst1.Selected.Clear;
  dbgEst1.Selected.Add ( 'PROV'#9'10'#9'Código'#9'F'               ) ;
  dbgEst1.Selected.Add ( 'PROVDES'#9'20'#9'Descripción'#9'F'         ) ;

  dbgEst1.Selected.Add ( 'SALANTMN'#9'10'#9'S. Ant.~(MN)'#9'F'   ) ;
  dbgEst1.Selected.Add ( 'CARGOSMN'#9'10'#9'Cargos ~(MN)'#9'F'    ) ;
  dbgEst1.Selected.Add ( 'ABONOSMN'#9'10'#9'Abonos ~(MN)'#9'F'    ) ;
  dbgEst1.Selected.Add ( 'SALACUMMN'#9'10'#9'Saldo~(MN)'#9'F' ) ;
  dbgEst1.Selected.Add ( 'LETNORLOC'#9'10'#9'Letras~(MN)'#9'F' ) ;
  dbgEst1.Selected.Add ( 'CHENORLOC'#9'10'#9'Cheques~(MN)'#9'F' ) ;
  dbgEst1.Selected.Add ( 'ANTNORLOC'#9'10'#9'Anticipos~(MN)'#9'F' ) ;
  dbgEst1.Selected.Add ( 'NCRENORLOC'#9'10'#9'N. Crédito~Sin Aplicar(MN)'#9'F' ) ;

  dbgEst1.Selected.Add ( 'SALTOTALMN'#9'10'#9'Saldo~Total(MN)'#9'F' ) ;

  dbgEst1.Selected.Add ( 'SALANTME'#9'10'#9'S. Ant.~(ME)'#9'F'   ) ;
  dbgEst1.Selected.Add ( 'CARGOSME'#9'10'#9'Cargos~(ME)'#9'F' ) ;
  dbgEst1.Selected.Add ( 'ABONOSME'#9'10'#9'Abonos~(ME)'#9'F' ) ;
  dbgEst1.Selected.Add ( 'SALACUMME'#9'10'#9'Saldo~(ME)'#9'F' ) ;
  dbgEst1.Selected.Add ( 'LETNOREXT'#9'10'#9'Letras~(ME)'#9'F' ) ;
  dbgEst1.Selected.Add ( 'CHENOREXT'#9'10'#9'Cheques~(ME)'#9'F' ) ;
  dbgEst1.Selected.Add ( 'ANTNOREXT'#9'12'#9'Anticipos~(ME)'#9'F' ) ;
  dbgEst1.Selected.Add ( 'NCRENOREXT'#9'12'#9'N. Crédito~Sin Aplicar(ME)'#9'F' ) ;

  dbgEst1.Selected.Add ( 'SALTOTALME'#9'10'#9'Saldo~Total(MN)'#9'F' ) ;

  san :=0;
  sac :=0;
  sal :=0;
  LetNor :=0;
  LetExt :=0;
  CheLoc :=0;
  CheExt :=0;
  TotalMn :=0;
  TotalMe :=0;

  Z2bbtnAceptarClick(nil);
  cFooter;

  Application.CreateForm(TFEstCxCli, FEstCxCli);

  dbgEst1.DataSource := DMCXP.dsQRY;
end;

procedure TFEstCtaCli.Z2bbtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFEstCtaCli.dcCIA;
begin
  DMCXP.cdsCIA.First;
  sCIA := trim(DMCXP.cdsCIA.FieldByName('CIAID').AsString);
  dblcCIA.Text := sCIA;
  dbeCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CIAID',dblcCia.Text);
  dblcCIA.Enabled := DMCXP.cdsCIA.RecordCount > 1;
end;

procedure TFEstCtaCli.dbclMonedaChange(Sender: TObject);
begin
  sMON := dbclMoneda.Text;
  dbeMoneda.Text := DMCXP.cdsTMon.FieldByName('TMONDES').AsString;
  isMLOC         := trim(DMCXP.cdsTMon.FieldByName('TMON_LOC').AsString)='L';
  if isMLOC then  // moneda local
  begin
    sM := 'N';
  end
  else begin      // moneda extranjera
    sM := 'E';
  end;
end;

procedure TFEstCtaCli.dcMon;
begin
  DMCXP.cdsTMon.First;
  sMON               := trim(DMCXP.cdsTMon.FieldByName('TMONID').AsString);
  dbclMoneda.Text    := sMON;
  isMLOC             := trim(DMCXP.cdsTMon.FieldByName('TMON_LOC').AsString)='L';
  dbclMoneda.Enabled := DMCXP.cdsTMon.RecordCount > 1;
  if isMLOC then  // moneda local
  begin
    sM := 'N';
  end
  else begin      // moneda extranjera
    sM := 'E';
  end;
end;

procedure TFEstCtaCli.strGRID;
begin
end;

procedure TFEstCtaCli.Z2bbtnAceptarClick(Sender: TObject);
var
  sXSQL : String ;
  sMoneda : String ;
begin
  Valida ;
  iYEAR  := Trunc( dbSpAnno.Value ) ;
  sMES  := StrZero(FloatToStr(cbMes.ItemIndex+1),2);
  sMESN  := StrZero(FloatToStr(cbMes.ItemIndex+2),2);
  sMESA  := StrZero(FloatToStr(cbMes.ItemIndex),2);
//  dcCIA;
  dcMon;

  if sMes<>'12' Then
    sFechaEmision:='01'+'/'+sMesN+'/'+IntToStr(iYEAR)
  else
    sFechaEmision:='01'+'/'+'01'+'/'+IntToStr(iYEAR+1);

  cSQL   ;
  if rgMoneda.ItemIndex = 0 then
     sMoneda := 'MN'
  else
     sMoneda := 'ME' ;

  case rgImportes.ItemIndex of
   0 : begin //>
        sXSQL := 'AND ('+DMCXP.wReplacCeros+'(SAL.SALDS' +sMoneda +sMES+',0)+ '+DMCXP.wReplacCeros+'(SAL.DEBES'+ sMoneda+ sMES+',0)'
                    +'- '+DMCXP.wReplacCeros+'(HABES'+ sMoneda + sMES+',0))> ' + dbeSaldoWhere.Text ;
       end;
   1 : begin //>=
        sXSQL := 'AND ('+DMCXP.wReplacCeros+'(SAL.SALDS'+ sMoneda + sMES+',0)+ '+DMCXP.wReplacCeros+'(SAL.DEBES'+ sMoneda +sMES+',0)'
                    +'- '+DMCXP.wReplacCeros+'(HABES'+ sMoneda + sMES+',0)) >= ' + dbeSaldoWhere.Text ;
       end;
   2 : begin //=
        sXSQL := 'AND ('+DMCXP.wReplacCeros+'(SAL.SALDS'+ sMoneda + sMES+',0)+ '+DMCXP.wReplacCeros+'(SAL.DEBES'+ sMoneda + sMES+',0)'
                    +'- '+DMCXP.wReplacCeros+'(HABES'+ sMoneda + sMES+',0)) = ' + dbeSaldoWhere.Text ;
       end;
   3 : begin //<=
        sXSQL := 'AND ('+DMCXP.wReplacCeros+'(SAL.SALDS'+ sMoneda + sMES+',0)+ '+DMCXP.wReplacCeros+'(SAL.DEBES'+ sMoneda + sMES+',0)'
                    +'- '+DMCXP.wReplacCeros+'(HABES'+ sMoneda + sMES+',0)) <= ' + dbeSaldoWhere.Text ;
       end;
   4 : begin //<
        sXSQL := 'AND ('+DMCXP.wReplacCeros+'(SAL.SALDS'+ sMoneda + sMES+',0)+ '+DMCXP.wReplacCeros+'(SAL.DEBES'+ sMoneda + sMES+',0)'
                    +'- '+DMCXP.wReplacCeros+'(HABES'+ sMoneda + sMES+',0)) < ' + dbeSaldoWhere.Text ;
       end;
   5 : begin //<>
        sXSQL := 'AND ('+DMCXP.wReplacCeros+'(SAL.SALDS'+ sMoneda + sMES+',0)+ '+DMCXP.wReplacCeros+'(SAL.DEBES'+ sMoneda + sMES+',0)'
                    +'- '+DMCXP.wReplacCeros+'(HABES'+ sMoneda + sMES+',0)) <> ' + dbeSaldoWhere.Text ;
       end;
   6 : begin //Todos
        sXSQL := '' ;
       end;
  end;
  sSQL := sSQL + sXSQL+sGroupBy ;
  DMCXP.cdsQry.Close;
  DMCXP.cdsQry.DataRequest ( sSQL );
  DMCXP.cdsQry.Open;
  
  TNumericField( DMCXP.cdsQry.FieldByName('SALACUMMN') ).DisplayFormat :='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('SALANTMN')  ).DisplayFormat :='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('SALACUMME') ).DisplayFormat :='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('SALANTME')  ).DisplayFormat :='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('LETNORLOC') ).DisplayFormat :='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('LETNOREXT') ).DisplayFormat :='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('CHENORLOC') ).DisplayFormat :='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('CHENOREXT') ).DisplayFormat :='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('ANTNORLOC') ).DisplayFormat :='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('ANTNOREXT') ).DisplayFormat :='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('NCRENORLOC') ).DisplayFormat:='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('NCRENOREXT') ).DisplayFormat:='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('SALTOTALMN') ).DisplayFormat:='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('SALTOTALME') ).DisplayFormat:='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('CARGOSMN') ).DisplayFormat  :='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('ABONOSMN') ).DisplayFormat  :='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('CARGOSME') ).DisplayFormat  :='###,###,##0.00';
  TNumericField( DMCXP.cdsQry.FieldByName('ABONOSME') ).DisplayFormat  :='###,###,##0.00';

  cFooter;
end;

procedure TFEstCtaCli.cSQL;
var
  sClie,sAnt,sLet,sNCre,sChe,sCarAbo,sTotal,sFPagoCheque,sClauxProv : string ;

begin

 sFPagoCheque:=BuscaQry('dspTGE','TGE112','FPAGOID','FCHQ=''1''','FPAGOID');
 sClauxProv:=BuscaQry('dspTGE','TGE102','CLAUXID','CLAUXCP=''P''','CLAUXID');
 sAnt :=BuscaQry('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''P'' AND DOCTIPREG=''R''','DOCID');
 sLet :=BuscaQry('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''L''','DOCID');
 sNCre:=BuscaQry('dspTGE','TGE110','DOCID','DOCMOD=''CXP'' AND DOC_FREG=''P'' AND DOCTIPREG=''NC''','DOCID');

 sClie:=BuscaQry('dspTGE','TGE102','CLAUXID','CLAUXCP=''P''','CLAUXID');

 sGroupBy:= ' GROUP BY SAL.CLAUXID, SAL.AUXID, PROVE.CLAUXID, PROVE.PROV, PROVE.PROVDES, '+
            ' SAL.SALDSMN'+sMESA+',SAL.SALDSME'+sMESA+',SAL.DEBESMN'+sMES+',SAL.DEBESME'+sMES+',SAL.HABESMN'+sMES+',SAL.HABESME'+sMES+' ';

 if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
 begin
 sSACUM:='NULLIF('+DMCXP.wReplacCeros+'(SAL.SALDSMN'+sMESA+',0.00)+ '+DMCXP.wReplacCeros+'(SAL.DEBESMN'+sMES+',0.00)'
        +'  - '+DMCXP.wReplacCeros+'(HABESMN'+sMES+',0.00),0) AS SALACUMMN, '
        +'NULLIF('+DMCXP.wReplacCeros+'(SAL.SALDSME'+sMESA+',0.00)+ '+DMCXP.wReplacCeros+'(SAL.DEBESME'+sMES+',0.00) '
        +'  - '+DMCXP.wReplacCeros+'(HABESME'+sMES+',0.00),0) AS SALACUMME ';
 end;
 if SRV_D = 'ORACLE' then
 begin
 sSACUM:=DMCXP.wReplacCeros+'(SAL.SALDSMN'+sMESA+',0.00)+ '+DMCXP.wReplacCeros+'(SAL.DEBESMN'+sMES+',0.00)'
        +'  - '+DMCXP.wReplacCeros+'(HABESMN'+sMES+',0.00) AS SALACUMMN, '
        +DMCXP.wReplacCeros+'(SAL.SALDSME'+sMESA+',0.00)+ '+DMCXP.wReplacCeros+'(SAL.DEBESME'+sMES+',0.00) '
        +'  - '+DMCXP.wReplacCeros+'(HABESME'+sMES+',0.00) AS SALACUMME ';
 end;

 if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
 begin
 sTotal:='NULLIF('+DMCXP.wReplacCeros+'(SAL.SALDSMN'+sMESA+',0.00)+ '+DMCXP.wReplacCeros+'(SAL.DEBESMN'+sMES+',0.00)'
        +'  - '+DMCXP.wReplacCeros+'(HABESMN'+sMES+',0.00) + SUM(CASE WHEN LETRA.LETTMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN LETRA.LETSALLOC ELSE 0 END) '
        +'+ SUM(CASE WHEN CHEQUE.CHETMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN CHEQUE.CHESALLOC ELSE 0 END) - SUM(CASE WHEN ANTICIPO.ANTTMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN ANTICIPO.ANTSALLOC ELSE 0 END)- SUM(CASE WHEN NCREDITO.NCRETMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN NCREDITO.NCRESALLOC ELSE 0 END) ,0) AS SALTOTALMN, '
        +'NULLIF('+DMCXP.wReplacCeros+'(SAL.SALDSME'+sMESA+',0.00)+ '+DMCXP.wReplacCeros+'(SAL.DEBESME'+sMES+',0.00)'
        +'  - '+DMCXP.wReplacCeros+'(HABESME'+sMES+',0.00) + SUM(CASE WHEN LETRA.LETTMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN LETRA.LETSALEXT ELSE 0 END) '
        +'+ SUM(CASE WHEN CHEQUE.CHETMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN CHEQUE.CHESALEXT ELSE 0 END) - SUM(CASE WHEN ANTICIPO.ANTTMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN ANTICIPO.ANTSALEXT ELSE 0 END)- SUM(CASE WHEN NCREDITO.NCRETMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN NCREDITO.NCRESALEXT ELSE 0 END) ,0) AS SALTOTALME ';
 end;
 if SRV_D = 'ORACLE' then
 begin
 sTotal:=DMCXP.wReplacCeros+'(SAL.SALDSMN'+sMESA+',0.00)+ '+DMCXP.wReplacCeros+'(SAL.DEBESMN'+sMES+',0.00)'
        +' - '+DMCXP.wReplacCeros+'(HABESMN'+sMES+',0.00) + '
        +' SUM( DECODE( LETRA.LETTMONID,'     +QuotedStr(DMCXP.wTMonLoc)+', LETRA.LETSALLOC, 0 ) ) + '
        +' SUM( DECODE( CHEQUE.CHETMONID, '   +QuotedStr(DMCXP.wTMonLoc)+', CHEQUE.CHESALLOC, 0 ) ) - '
        +' SUM( DECODE( ANTICIPO.ANTTMONID, ' +QuotedStr(DMCXP.wTMonLoc)+', ANTICIPO.ANTSALLOC, 0 ) ) - '
        +' SUM( DECODE( NCREDITO.NCRETMONID, '+QuotedStr(DMCXP.wTMonLoc)+', NCREDITO.NCRESALLOC, 0 ) ) AS SALTOTALMN, '

        +DMCXP.wReplacCeros+'(SAL.SALDSME'+sMESA+',0.00)+ '+DMCXP.wReplacCeros+'(SAL.DEBESME'+sMES+',0.00) '
        +'  - '+DMCXP.wReplacCeros+'(HABESME'+sMES+',0.00) + '
        +' SUM( DECODE( LETRA.LETTMONID, '    +QuotedStr(DMCXP.wTMonExt)+', LETRA.LETSALEXT,  0 ) ) + '
        +' SUM( DECODE( CHEQUE.CHETMONID, '   +QuotedStr(DMCXP.wTMonExt)+', CHEQUE.CHESALEXT, 0 ) ) - '
        +' SUM( DECODE( ANTICIPO.ANTTMONID, ' +QuotedStr(DMCXP.wTMonExt)+', ANTICIPO.ANTSALEXT, 0 ) ) - '
        +' SUM( DECODE( NCREDITO.NCRETMONID, '+QuotedStr(DMCXP.wTMonExt)+', NCREDITO.NCRESALEXT, 0 ) ) AS SALTOTALME ';
 end;


 if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
 begin
 sCarAbo := 'NULLIF('+DMCXP.wReplacCeros+'(SAL.DEBESMN'+sMES+',0.00),0) AS CARGOSMN , NULLIF('+DMCXP.wReplacCeros+'(SAL.HABESMN'+sMES+',0.00),0) AS ABONOSMN, '
          + 'NULLIF('+DMCXP.wReplacCeros+'(SAL.DEBESME'+sMES+',0.00),0) AS CARGOSME , NULLIF('+DMCXP.wReplacCeros+'(SAL.HABESME'+sMES+',0.00),0) AS ABONOSME ';

 sSAANT := 'NULLIF('+DMCXP.wReplacCeros+'(SAL.SALDSMN'+sMESA+',0.00),0) AS SALANTMN, '
         + 'NULLIF('+DMCXP.wReplacCeros+'(SAL.SALDSME'+sMESA+',0.00),0) AS SALANTME';
 end;

 if SRV_D = 'ORACLE' then
 begin
 sCarAbo := DMCXP.wReplacCeros+'(SAL.DEBESMN'+sMES+',0.00) AS CARGOSMN , '+DMCXP.wReplacCeros+'(SAL.HABESMN'+sMES+',0.00) AS ABONOSMN, '
          + DMCXP.wReplacCeros+'(SAL.DEBESME'+sMES+',0.00) AS CARGOSME , '+DMCXP.wReplacCeros+'(SAL.HABESME'+sMES+',0.00) AS ABONOSME ';

 sSAANT := DMCXP.wReplacCeros+'(SAL.SALDSMN'+sMESA+',0.00) AS SALANTMN, '
         + DMCXP.wReplacCeros+'(SAL.SALDSME'+sMESA+',0.00) AS SALANTME';
 end;

 sSQL:=' SELECT SAL.CLAUXID, SAL.AUXID,'+ sSACUM +','+ sTotal +','+ sCarAbo +', ' + sSAANT +', '
      +' PROVE.CLAUXID, PROVE.PROV, PROVE.PROVDES, ';


 if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
 begin
 sSQL:=sSQL
      +' SUM( CASE WHEN LETRA.LETTMONID='    +QuotedStr(DMCXP.wTMonLoc)+' THEN '+DMCXP.wReplacCeros+'(LETRA.LETSALLOC,0 ) ELSE 0 END) LETNORLOC, '
      +' SUM( CASE WHEN LETRA.LETTMONID='    +QuotedStr(DMCXP.wTMonExt)+' THEN '+DMCXP.wReplacCeros+'(LETRA.LETSALEXT,0 ) ELSE 0 END) LETNOREXT, '
      +' SUM( CASE WHEN CHEQUE.CHETMONID='   +QuotedStr(DMCXP.wTMonLoc)+' THEN '+DMCXP.wReplacCeros+'(CHEQUE.CHESALLOC,0 ) ELSE 0 END) CHENORLOC, '
      +' SUM( CASE WHEN CHEQUE.CHETMONID='   +QuotedStr(DMCXP.wTMonExt)+' THEN '+DMCXP.wReplacCeros+'(CHEQUE.CHESALEXT,0 ) ELSE 0 END) CHENOREXT, '
      +' SUM( CASE WHEN ANTICIPO.ANTTMONID=' +QuotedStr(DMCXP.wTMonLoc)+' THEN '+DMCXP.wReplacCeros+'(ANTICIPO.ANTSALLOC,0 ) ELSE 0 END) ANTNORLOC, '
      +' SUM( CASE WHEN ANTICIPO.ANTTMONID=' +QuotedStr(DMCXP.wTMonExt)+' THEN '+DMCXP.wReplacCeros+'(ANTICIPO.ANTSALEXT,0 ) ELSE 0 END) ANTNOREXT, '
      +' SUM( CASE WHEN NCREDITO.NCRETMONID='+QuotedStr(DMCXP.wTMonLoc)+' THEN '+DMCXP.wReplacCeros+'(NCREDITO.NCRESALLOC,0 ) ELSE 0 END) NCRENORLOC, '
      +' SUM( CASE WHEN NCREDITO.NCRETMONID='+QuotedStr(DMCXP.wTMonExt)+' THEN '+DMCXP.wReplacCeros+'(NCREDITO.NCRESALEXT,0 ) ELSE 0 END) NCRENOREXT ';
 end;
 if SRV_D = 'ORACLE' then
 begin
 sSQL:=sSQL
      +' SUM( DECODE( LETRA.LETTMONID, '    +QuotedStr(DMCXP.wTMonLoc)+', '+DMCXP.wReplacCeros+'(LETRA.LETSALLOC,0 )     ) ) LETNORLOC, '
      +' SUM( DECODE( LETRA.LETTMONID, '    +QuotedStr(DMCXP.wTMonExt)+', '+DMCXP.wReplacCeros+'(LETRA.LETSALEXT,0 )     ) ) LETNOREXT, '
      +' SUM( DECODE( CHEQUE.CHETMONID, '   +QuotedStr(DMCXP.wTMonLoc)+', '+DMCXP.wReplacCeros+'(CHEQUE.CHESALLOC,0 )    ) ) CHENORLOC, '
      +' SUM( DECODE( CHEQUE.CHETMONID, '   +QuotedStr(DMCXP.wTMonExt)+', '+DMCXP.wReplacCeros+'(CHEQUE.CHESALEXT,0 )    ) ) CHENOREXT, '
      +' SUM( DECODE( ANTICIPO.ANTTMONID, ' +QuotedStr(DMCXP.wTMonLoc)+', '+DMCXP.wReplacCeros+'(ANTICIPO.ANTSALLOC,0 )  ) ) ANTNORLOC, '
      +' SUM( DECODE( ANTICIPO.ANTTMONID, ' +QuotedStr(DMCXP.wTMonExt)+', '+DMCXP.wReplacCeros+'(ANTICIPO.ANTSALEXT,0 )  ) ) ANTNOREXT, '
      +' SUM( DECODE( NCREDITO.NCRETMONID, '+QuotedStr(DMCXP.wTMonLoc)+', '+DMCXP.wReplacCeros+'(NCREDITO.NCRESALLOC,0 ) ) ) NCRENORLOC, '
      +' SUM( DECODE( NCREDITO.NCRETMONID, '+QuotedStr(DMCXP.wTMonExt)+', '+DMCXP.wReplacCeros+'(NCREDITO.NCRESALEXT,0 ) ) ) NCRENOREXT ';
 end;

 if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
 begin
 sSQL:=sSQL
      +' FROM TGE401 SAL '
      +' LEFT JOIN (SELECT PROV,TMONID LETTMONID,SUM(CPSALLOC) LETSALLOC, SUM(CPSALEXT) LETSALEXT '
      +'  FROM CXP301 LET WHERE LET.CPFEMIS<DATE('+QuotedStr(sFechaEmision)+') AND LET.CPESTADO='+QuotedStr('P')
      +'  AND LET.DOCID='+QuotedStr(sLet)+' GROUP BY PROV,TMONID) LETRA ON LETRA.PROV=SAL.AUXID '
      +' LEFT JOIN (SELECT PROV,TMONID CHETMONID,SUM(ECMTOLOC) CHESALLOC, SUM(ECMTOEXT) CHESALEXT '
      +'  FROM CAJA302 CHE WHERE CHE.ECFEMICH<DATE('+QuotedStr(sFechaEmision)+') AND CHE.FPAGOID='+QuotedStr(sFPagoCheque)
      +'  AND  CHE.CLAUXID='+QuotedStr(sClauxProv)+' GROUP BY PROV,TMONID) CHEQUE ON CHEQUE.PROV=SAL.AUXID '
      +' LEFT JOIN (SELECT PROV,TMONID ANTTMONID,SUM(ECMTOLOC) ANTSALLOC, SUM(ECMTOEXT) ANTSALEXT '
      +'  FROM CAJA302 ANT WHERE ANT.ECFCOMP<DATE('+QuotedStr(sFechaEmision)+') AND ANT.EC_PROCE=''1'' AND ANT.DOCID='+QuotedStr(sAnt)
      +'  GROUP BY PROV,TMONID) ANTICIPO ON ANTICIPO.PROV=SAL.AUXID '
      +' LEFT JOIN (SELECT PROV,TMONID NCRETMONID,SUM(CPSALLOC) NCRESALLOC, SUM(CPSALEXT) NCRESALEXT '
      +'  FROM CXP301 NCRE WHERE NCRE.CPFEMIS<DATE('+QuotedStr(sFechaEmision)+') AND NCRE.CPESTADO='+QuotedStr('P')
      +'  AND (NCRE.CPPAGEXT=0 OR NCRE.CPPAGLOC=0) AND NCRE.DOCID='+QuotedStr(sNCre)+' GROUP BY PROV,TMONID) NCREDITO ON NCREDITO.PROV=SAL.AUXID '
      +' LEFT JOIN TGE201 PROVE ON PROVE.PROV=SAL.AUXID AND PROVE.CLAUXID=SAL.CLAUXID '
      +' WHERE SAL.CIAID='''+dblcCIA.Text+''' AND SAL.CLAUXID='+QuotedStr(sClie)
      +'       AND SAL.ANO='''+IntToStr(iYEAR)+''' ';
 end;
 if SRV_D = 'ORACLE' then
 begin
 sSQL:=sSQL
      +' FROM TGE401 SAL, '
      +  '(SELECT PROV,TMONID LETTMONID,SUM(CPSALLOC) LETSALLOC, SUM(CPSALEXT) LETSALEXT '
      +   'FROM CXP301 LET WHERE LET.CPFEMIS<TO_DATE('+QuotedStr(sFechaEmision)+') AND LET.CPESTADO='+QuotedStr('P')
      +                    ' AND LET.DOCID='+QuotedStr(sLet)+' GROUP BY PROV,TMONID ) LETRA, '
      +  '(SELECT PROV,TMONID CHETMONID,SUM(ECMTOLOC) CHESALLOC, SUM(ECMTOEXT) CHESALEXT '
      +   'FROM CAJA302 CHE WHERE CHE.ECFEMICH<TO_DATE('+QuotedStr(sFechaEmision)+') AND CHE.FPAGOID='+QuotedStr(sFPagoCheque)
      +                     ' AND CHE.CLAUXID='+QuotedStr(sClauxProv)+' GROUP BY PROV,TMONID) CHEQUE, '
      +  '(SELECT PROV,TMONID ANTTMONID,SUM(ECMTOLOC) ANTSALLOC, SUM(ECMTOEXT) ANTSALEXT '
      +   'FROM CAJA302 ANT WHERE ANT.ECFCOMP<TO_DATE('+QuotedStr(sFechaEmision)+') AND ANT.EC_PROCE=''1'' AND ANT.DOCID='+QuotedStr(sAnt)
      +   'GROUP BY PROV,TMONID) ANTICIPO, '
      +  '(SELECT PROV,TMONID NCRETMONID,SUM(CPSALLOC) NCRESALLOC, SUM(CPSALEXT) NCRESALEXT '
      +   'FROM CXP301 NCRE WHERE NCRE.CPFEMIS<TO_DATE('+QuotedStr(sFechaEmision)+') AND NCRE.CPESTADO='+QuotedStr('P')
      +                     ' AND (NCRE.CPPAGEXT=0 OR NCRE.CPPAGLOC=0) AND NCRE.DOCID='+QuotedStr(sNCre)+' GROUP BY PROV,TMONID) NCREDITO, '
      +  'TGE201 PROVE '
      +' WHERE SAL.CIAID='''+dblcCIA.Text+''' AND SAL.CLAUXID='+QuotedStr(sClie)
      +  ' and SAL.ANO='''+IntToStr(iYEAR)+''' '
      +  ' and LETRA.PROV(+)=SAL.AUXID and CHEQUE.PROV(+)=SAL.AUXID and  ANTICIPO.PROV(+)=SAL.AUXID '
      +  ' and NCREDITO.PROV(+)=SAL.AUXID and PROVE.PROV(+)=SAL.AUXID AND PROVE.CLAUXID(+)=SAL.CLAUXID ';
 end
end;

procedure TFEstCtaCli.cbMesChange(Sender: TObject);
begin
  sMES  := StrZero(FloatToStr(cbMes.ItemIndex+1),2);
end;

procedure TFEstCtaCli.dbgEst1DblClick(Sender: TObject);
begin
  Cursor := crHourGlass ;
  try
    FEstCxCli.ClAux     := DMCXP.cdsQry.FieldByName('CLAUXID').AsString ;
    FEstCxCli.Cliente   := DMCXP.cdsQry.FieldByName('PROV').AsString  ;
    FEstCxCli.ProvDes   := DMCXP.cdsQry.FieldByName('PROVDES').AsString  ;
    FEstCxCli.Moneda    := dbclMoneda.Text ;
    FEstCxCli.Activar   := False  ;
    FEstCxCli.MonLoc    := isMLOC ;
    FEstCxCli.Internal  := True   ;
    FEstCxCli.SaldoIni  := DMCXP.cdsQry.FieldByName('SALANTMN').AsFloat ;
    FEstCxCli.SaldoIniL := DMCXP.cdsQry.FieldByName('SALANTMN').AsFloat ;
    FEstCxCli.SaldoIniE := DMCXP.cdsQry.FieldByName('SALANTME').AsFloat ;
    FEstCxCli.Anio      := Trunc(dbSpAnno.Value) ;
    FEstCxCli.Mes       := cbMes.ItemIndex+1     ;

    ShowWindow( FEstCxCli.Handle, SW_HIDE ) ;

    FEstCxCli.ShowModal ;
  finally
  Z2bbtnAceptarClick(Sender);
  end;
  Screen.Cursor := crDefault ;
end;

procedure TFEstCtaCli.cFooter ;
var
   sCargos , sAbonos : double ;
begin
//   TNumericField( DMCXP.cdsQry.FieldByName('SALMENMN')  ).DisplayFormat:='###,###,##0.00';
   TNumericField( DMCXP.cdsQry.FieldByName('SALACUMMN') ).DisplayFormat:='###,###,##0.00';
   TNumericField( DMCXP.cdsQry.FieldByName('SALANTMN')  ).DisplayFormat:='###,###,##0.00';
//   TNumericField( DMCXP.cdsQry.FieldByName('SALMENME')  ).DisplayFormat:='###,###,##0.00';
   TNumericField( DMCXP.cdsQry.FieldByName('SALACUMME') ).DisplayFormat:='###,###,##0.00';
   TNumericField( DMCXP.cdsQry.FieldByName('SALANTME')  ).DisplayFormat:='###,###,##0.00';
//
   TNumericField( DMCXP.cdsQry.FieldByName('CARGOSMN') ) . DisplayFormat:='###,###,##0.00';
   TNumericField( DMCXP.cdsQry.FieldByName('ABONOSMN') ) . DisplayFormat:='###,###,##0.00';
   TNumericField( DMCXP.cdsQry.FieldByName('CARGOSME') ) . DisplayFormat:='###,###,##0.00';
   TNumericField( DMCXP.cdsQry.FieldByName('ABONOSME') ) . DisplayFormat:='###,###,##0.00';
//
//wmc2403   san := OperClientDataSet( DMCXP.cdsQry , 'SUM(SALMENMN)' , '');
   sal := OperClientDataSet( DMCXP.cdsQry , 'SUM(SALANTMN)' , '') ;
   LetNor := OperClientDataSet( DMCXP.cdsQry , 'SUM(LETNORLOC)' , '') ;
   LetExt := OperClientDataSet( DMCXP.cdsQry , 'SUM(LETNOREXT)' , '') ;
   CheLoc := OperClientDataSet( DMCXP.cdsQry , 'SUM(CHENORLOC)' , '') ;
   CheExt := OperClientDataSet( DMCXP.cdsQry , 'SUM(CHENOREXT)' , '') ;
   AntLoc := OperClientDataSet( DMCXP.cdsQry , 'SUM(ANTNORLOC)' , '') ;
   AntExt := OperClientDataSet( DMCXP.cdsQry , 'SUM(ANTNOREXT)' , '') ;
   NCreLoc := OperClientDataSet( DMCXP.cdsQry , 'SUM(NCRENORLOC)' , '') ;
   NCreExt := OperClientDataSet( DMCXP.cdsQry , 'SUM(NCRENOREXT)' , '') ;
   TotalMn := OperClientDataSet( DMCXP.cdsQry , 'SUM(SALTOTALMN)' , '') ;
   TotalMe := OperClientDataSet( DMCXP.cdsQry , 'SUM(SALTOTALME)' , '') ;
   sCargos := OperClientDataSet( DMCXP.cdsQry , 'SUM(CARGOSMN)', '');
   sAbonos := OperClientDataSet( DMCXP.cdsQry , 'SUM(ABONOSMN)', '');
   sac := OperClientDataSet( DMCXP.cdsQry , 'SUM(SALACUMMN)', '') ;

//wmc2403   dbgEst1.ColumnByName('SALMENMN' ).FooterValue:=floattostrf(san, ffNumber, 15, 2);
   dbgEst1.ColumnByName('LETNORLOC' ).FooterValue := floattostrf(LetNor, ffNumber, 15, 2) ;
   dbgEst1.ColumnByName('LETNOREXT' ).FooterValue := floattostrf(LetExt, ffNumber, 15, 2) ;
   dbgEst1.ColumnByName('CHENORLOC' ).FooterValue := floattostrf(CheLoc, ffNumber, 15, 2) ;
   dbgEst1.ColumnByName('CHENOREXT' ).FooterValue := floattostrf(CheExt, ffNumber, 15, 2) ;
   dbgEst1.ColumnByName('ANTNORLOC' ).FooterValue := floattostrf(AntLoc, ffNumber, 15, 2) ;
   dbgEst1.ColumnByName('ANTNOREXT' ).FooterValue := floattostrf(AntExt, ffNumber, 15, 2) ;
   dbgEst1.ColumnByName('NCRENORLOC' ).FooterValue := floattostrf(NCreLoc, ffNumber, 15, 2) ;
   dbgEst1.ColumnByName('NCRENOREXT' ).FooterValue := floattostrf(NCreExt, ffNumber, 15, 2) ;
   dbgEst1.ColumnByName('SALTOTALMN' ).FooterValue := floattostrf(TotalMn, ffNumber, 15, 2) ;
   dbgEst1.ColumnByName('SALTOTALME' ).FooterValue := floattostrf(TotalMe, ffNumber, 15, 2) ;
   dbgEst1.ColumnByName('SALANTMN' ).FooterValue := floattostrf(sal, ffNumber, 15, 2) ;
   dbgEst1.ColumnByName('CARGOSMN' ).FooterValue := floattostrf(sCargos, ffNumber, 15, 2) ;
   dbgEst1.ColumnByName('ABONOSMN' ).FooterValue := floattostrf(sAbonos, ffNumber, 15, 2) ;
   dbgEst1.ColumnByName('SALACUMMN').FooterValue:=floattostrf(sac, ffNumber, 15, 2) ;

//wmc2403   san := OperClientDataSet( DMCXP.cdsQry , 'SUM(SALMENME)' , '');
   sal := OperClientDataSet( DMCXP.cdsQry , 'SUM(SALANTME)' , '');
   sCargos := OperClientDataSet( DMCXP.cdsQry , 'SUM(CARGOSME)', '');
   sAbonos := OperClientDataSet( DMCXP.cdsQry , 'SUM(ABONOSME)', '');
   sac := OperClientDataSet( DMCXP.cdsQry , 'SUM(SALACUMME)', '');

//wmc2403   dbgEst1.ColumnByName('SALMENME' ).FooterValue:=floattostrf(san, ffNumber, 15, 2);
   dbgEst1.ColumnByName('SALANTME' ).FooterValue:=floattostrf(sal, ffNumber, 15, 2);
   dbgEst1.ColumnByName('CARGOSME' ).FooterValue := floattostrf(sCargos, ffNumber, 15, 2);
   dbgEst1.ColumnByName('ABONOSME' ).FooterValue := floattostrf(sAbonos, ffNumber, 15, 2);
   dbgEst1.ColumnByName('SALACUMME').FooterValue:=floattostrf(sac, ffNumber, 15, 2);


   dbgEst1.FooterCellColor := clInfoBk;
end;

procedure TFEstCtaCli.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
  cFooter;
end;

procedure TFEstCtaCli.FormDestroy(Sender: TObject);
begin
   FEstCxCli.Free ;
   FEstCxCli := nil ;
end;

procedure TFEstCtaCli.cReport;
begin
  ppDBPipeline.DataSource := DMCXP.dsQRY;
end;

procedure TFEstCtaCli.ppHeaderBand1BeforePrint(Sender: TObject);
begin
  pplblPERIODO.Caption:='PERIODO :'+cbMes.Text+' '+dbSpAnno.Text;
  pplCia.Caption      :=dbeCia.Text;
end;

procedure TFEstCtaCli.bbtnPrintClick(Sender: TObject);
begin
  cReport;
  ppReport.Print;
end;

procedure TFEstCtaCli.ppReportPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;
end;

procedure TFEstCtaCli.dbgEst1TitleButtonClick(Sender: TObject;
  AFieldName: String);
var
   xFlag : Boolean ;
begin
   xFlag := False ;
   if AfieldName='PROV' then begin
      DMCXP.cdsQry.IndexFieldNames:='PROV';
      lblBusca.Caption:='Busca por Código:';
      isBusca.SearchField:='PROV';
      xFlag := True ;
   end;
   if AfieldName='PROVDES' then begin
      DMCXP.cdsQry.IndexFieldNames:='PROVDES';
      lblBusca.Caption:='Busca por Descripción:';
      isBusca.SearchField:='PROVDES';
      xFlag := true ;
   end;
   if xFlag then
   begin
      pnlOrden.Visible := True;
      isBusca.Text:='';
      isBusca.SetFocus;
      pnlFOOT.Enabled  := False ;
      pnlHEAD.Enabled  := False ;
      dbgEst1.Enabled  := False ;
   end;
end;

procedure TFEstCtaCli.btnSalirClick(Sender: TObject);
begin
   pnlOrden.Visible := False;
   pnlFOOT.Enabled  := True ;
   pnlHEAD.Enabled  := True ;
   dbgEst1.Enabled  := true ;
end;

procedure TFEstCtaCli.isBuscaKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      pnlOrden.Visible := False;
      dbgEst1.SetFocus;
   end;
end;

procedure TFEstCtaCli.dbgEst1CalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
   if (AFieldName='PROV') or (AFieldName='PROVDES') then Afont.Color:=clRed;
end;

procedure TFEstCtaCli.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;

end;

procedure TFEstCtaCli.cbMesExit(Sender: TObject);
begin
  cbmes.Text := AnsiUpperCase(trim( cbmes.Text )) ;
  if cbMes.Text = '' then
  begin
     Showmessage('Ingrese Mes Para Consulta de Saldos') ;
     cbmes.SetFocus ;
     Exit ;
  end ;
  if cbmes.items.IndexOf( cbmes.Text ) = -1 then
  begin
     Showmessage('Escoja un Mes de La Lista') ;
     cbmes.SetFocus ;
     Exit ;
  end ;

  if strtoint(dbSpAnno.Text) = wAnoHoy then
     if ( cbmes.items.IndexOf( cbmes.Text ) + 1 ) > wMesHoy then
     begin
        Showmessage('El Mes No puede ser Posterior Al Mes Actual') ;
        cbmes.SetFocus ;
        Exit ;
     end ;

end;

procedure TFEstCtaCli.dbSpAnnoKeyPress(Sender: TObject; var Key: Char);
begin
   if not ( key in [ '0'..'9',#8 ] ) then
      key := #0 ;
end;

procedure TFEstCtaCli.dbSpAnnoExit(Sender: TObject);
var
   xAno : Integer ;
begin
   dbSpAnno.Text  := trim( dbSpAnno.Text ) ;
   if trim(dbSpAnno.Text) = '' then
   begin
     Showmessage('Ingrese Año') ;
     dbSpAnno.SetFocus ;
     Exit ;
   end ;
   if StrToInt( dbSpAnno.Text ) = 0 then
   begin
     Showmessage('Ingrese Año diferente de Cero') ;
     dbSpAnno.SetFocus ;
     Exit ;
   end ;
   xAno  := strtoint ( dbSpAnno.Text ) ;
   dbSpAnno.Text := inttostr( xAno ) ;
   if ( length( dbSpAnno.Text) <> 2 )  and ( length( dbSpAnno.Text ) <> 4 )
      and ( length( dbSpAnno.Text ) <> 1 ) then
   begin
     Showmessage('Ingrese Año de 2 ó 4 Caracteres') ;
     dbSpAnno.SetFocus ;
     Exit ;
   end
   else
   begin
      if length( dbSpAnno.Text ) <= 2 then
      begin
         if xAno < 50 then
         begin
            if xano >= 10 then
               dbSpAnno.Text := '20' + dbSpAnno.Text
            else
               dbSpAnno.Text := '200' + dbSpAnno.Text
         end
         else
            dbSpAnno.Text := '19' + dbSpAnno.Text
      end ;
   end ;
   xAno  := strtoint ( dbSpAnno.Text ) ;

   if xano > wAnoHoy then
   begin
     Showmessage('Año No puede Ser Mayor Al Año Actual') ;
     dbSpAnno.SetFocus ;
     Exit ;
   end ;

end;

procedure TFEstCtaCli.cbMesEnter(Sender: TObject);
begin
//   cbmes.DroppedDown := true ;
end;

procedure TFEstCtaCli.dbgEst1CalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
//////////////
  if (Field.FieldName = 'SALANTMN') or (Field.FieldName = 'CARGOSMN')
      or (Field.FieldName = 'ABONOSMN') or (Field.FieldName = 'SALACUMMN')  then
  begin
     if (not Highlight) then
       AFont.Color := clBlue
     else
       AFont.Color := clHighlightText;
     Exit ;
  end ;
  if (Field.FieldName = 'SALANTME') or (Field.FieldName = 'CARGOSME')
      or (Field.FieldName = 'ABONOSME') or (Field.FieldName = 'SALACUMME')  then
  begin
     if (not Highlight) then
       AFont.Color := $00004000
     else
       AFont.Color := clHighlightText;
     Exit ;
  end ;

//////////////
end;

procedure TFEstCtaCli.rgImportesClick(Sender: TObject);
begin
   if FEstCtaCli = nil then
      Exit ;
   if not FEstCtaCli.Showing then
      Exit ;
   if rgImportes.ItemIndex = 6 then
   begin
      dbeSaldoWhere.Enabled := False ;
      dbeSaldoWhere.Text    := '' ;
   end
   else
   begin
      dbeSaldoWhere.Enabled := True ;
      if trim(dbeSaldoWhere.Text) = '' then
        dbeSaldoWhere.Text := '0.00' ;
   end ;
end;

procedure TFEstCtaCli.dbeSaldoWhereKeyPress(Sender: TObject;
  var Key: Char);
var
   xStr : String ;
begin
    if not( Key in [ '0'..'9' , '.' , #8 ]) then
    begin
       Key := #0 ;
    end ;
    xStr := TCustomEdit(self.ActiveControl).text ;
    if key = '.' then
       if pos('.',xSTR) <> 0 then
          Key := #0 ;
end;

procedure TFEstCtaCli.Valida;
begin
    if ( dbeSaldoWhere.Enabled ) and ( Trim( dbeSaldoWhere.Text ) = '' ) then
    begin
       dbeSaldoWhere.SetFocus ;
       Raise Exception.Create ('Ingrese Saldo de Recuperacion') ;
    end ;
end;

procedure TFEstCtaCli.dbeSaldoWhereExit(Sender: TObject);
begin
   dbeSaldoWhere.Text := trim( dbeSaldoWhere.Text ) ;
   if trim( dbeSaldoWhere.Text ) = '' then
   begin
      ShowMessage('Ingrese Saldo de Recuperacion') ;
      dbeSaldoWhere.SetFocus ;
      Exit ;
   end ;
end;

procedure TFEstCtaCli.dblcCiaExit(Sender: TObject);
begin
	 dbeCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CIAID',dblcCia.Text);

	 if length(dbeCia.Text)=0 then
	 begin
			ShowMessage('Falta Código de Compañía');
			dblcCia.SetFocus;
	 end;
end;

end.
