unit CxP223;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppCache, ppDBPipe, Spin, StdCtrls, Buttons, Mask,
  wwdbedit,wwdblook, ExtCtrls, ppViewr, ppTypes;


type
  TFImpBProvision = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label26: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Z1sbInformes: TSpeedButton;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dblctdiario: TwwDBLookupCombo;
    dbetdiario: TwwDBEdit;
    edtCompFin: TEdit;
    edtCompIni: TEdit;
    Z2bbtnCanc3: TBitBtn;
    gbPer: TGroupBox;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    pprPreview: TppReport;
    ppdbpPreview: TppDBPipeline;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    pptDesc: TppDBText;
    ppDBText4: TppDBText;
    ppDBText2: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel20: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel16: TppLabel;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    ppLabel12: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel5: TppLabel;
    lblCiaDes: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel30: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel2: TppLabel;
    lblPeriodo: TppLabel;
    ppLabel8: TppLabel;
    ppDBText5: TppDBText;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppLabel3: TppLabel;
    ppLabel10: TppLabel;
    lblTD: TppLabel;
    lblDiario: TppLabel;
    ppLabel14: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText15: TppDBText;
    ppDBText19: TppDBText;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel19: TppLabel;
    ppLabel27: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel4: TppLabel;
    ppLabel21: TppLabel;
    ppLabel9: TppLabel;
    ppLabel25: TppLabel;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLabel1: TppLabel;
    ppDBText18: TppDBText;
    ppLabel28: TppLabel;
    lblestado: TppLabel;
    procedure dblcCiaExit(Sender: TObject);
    procedure dblctdiarioExit(Sender: TObject);
    procedure Z1sbInformesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtCompIniExit(Sender: TObject);
    procedure edtCompFinExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ppHeaderBand2BeforePrint(Sender: TObject);
    procedure pprPreviewPreviewFormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    xperiodo:string;

  public
    { Public declarations }
  end;

var
  FImpBProvision: TFImpBProvision;

implementation

uses CxPDM ;

{$R *.DFM}

procedure TFImpBProvision.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DMCXP.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      dblcCia.setfocus;
      raise exception.Create('Falta registrar la Compañía');
   end;


end;

procedure TFImpBProvision.dblctdiarioExit(Sender: TObject);
begin
   if dblctdiario.Text<>'' then dbetdiario.Text:=DMCXP.cdsTDiario.FieldByName('TDIARDES').AsString;

   if length(dbetdiario.Text)=0 then
   begin
      dblctdiario.setfocus;
      raise exception.Create('Falta registrar el Tipo de Diario');
   end;


end;

procedure TFImpBProvision.Z1sbInformesClick(Sender: TObject);
VAR
  XSQL,mes,ano,xwhere,mesdes:STRING;
  xTotHaber,SUMA:double;
  X10:integer;
begin
      if length(dblcCia.text)=0 then
      begin
        dblcCia.setfocus;
        raise exception.Create('Falta registrar la Compañía');
      end;

      if length(dblctdiario.text)=0 then
      begin
        dblctdiario.setfocus;
        raise exception.Create('Falta registrar el tipo de Diario');
      end;

      if length(edtCompIni.text)=0 then
      begin
        edtCompIni.setfocus;
        raise exception.Create('Falta registrar el Comprobante Inicial');
      end;

      if length(edtCompFin.text)=0 then
      begin
        edtCompFin.setfocus;
        raise exception.Create('Falta registrar el Comprobante Final');
      end;
      if length(speano.text)=0  then
      begin
        speano.setfocus;
        raise exception.Create('Debe registar el Año');
      end;

      if length(speMM.text)=0  then
      begin
        speMM.setfocus;
        raise exception.Create('Debe registar el Mes');
      end;

      xperiodo:=trim(speano.text)+trim(StrZero(spemm.text,2));

      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
      xSql:='SELECT  CNT301.*,TGE103.TMONDES,TGE103.TMONABR,    '
            + '  0.00 TOTAL ,CXP301.PROV,CXP301.PROVDES '
           +'FROM CNT301 '
            + ' LEFT JOIN CXP301 ON ( CNT301.CNTCOMPROB=CXP301.CPNOREG AND CXP301.CIAID= '+quotedstr(dblcCia.text)+' AND '
            + ' CXP301.CPANOMES='''+xperiodo+''' AND CXP301.TDIARID='+quotedstr(dblcTDiario.text)+' ), '
            + ' TGE103 '
           +'WHERE '
            + ' CNT301.CIAID='+quotedstr(dblcCia.text) +' AND '
            + ' CNT301.CNTANOMM='''+ xperiodo+''' AND '
            + ' CNT301.TDIARID='+quotedstr(dblcTDiario.text) +' AND '
            + ' CNT301.CNTCOMPROB >='+''''+edtCompIni.Text+''''
            + ' and  CNT301.CNTCOMPROB<='+''''+edtCompFin.Text+ ''' AND '
            + ' CNT301.TMONID=TGE103.TMONID '
           +'ORDER BY CNT301.CNTREG ';
      end;
   	  if SRV_D = 'ORACLE' then
      begin
      xSql:=' SELECT  CNT301.*,TGE103.TMONDES,TGE103.TMONABR,    '
            + '  0.00 TOTAL ,CXP301.PROV,CXP301.PROVDES   FROM CNT301,TGE103,CXP301 '
            + ' WHERE '
            + ' CNT301.CIAID='+quotedstr(dblcCia.text) +' AND '
            + ' CNT301.CNTANOMM='''+ xperiodo+''' AND '
            + ' CNT301.TDIARID='+quotedstr(dblcTDiario.text) +' AND '
            + ' CNT301.CNTCOMPROB >='+''''+edtCompIni.Text+''''
            + ' and  CNT301.CNTCOMPROB<='+''''+edtCompFin.Text+ ''' AND '
            + ' CNT301.TMONID=TGE103.TMONID  AND '
            + ' CNT301.CNTCOMPROB=CXP301.CPNOREG(+) AND CXP301.CIAID(+)= '+quotedstr(dblcCia.text)+' AND '
            + ' CXP301.CPANOMES(+)='''+xperiodo+''' AND CXP301.TDIARID(+)='+quotedstr(dblcTDiario.text)
            + ' ORDER BY CNT301.CNTREG ';
      end;

      DMCXP.cdsCxP.Close;
      DMCXP.cdsCxP.DataRequest(xSQL);
      DMCXP.cdsCxP.Open;

      IF DMCXP.cdsCxP.recordcount=0 then
        raise exception.Create('No existen Registros Contabilizados para la Consulta');

      XSQL:='SELECT CNTCOMPROB, CNTDH, SUM(CNTMTOORI) TOTAL FROM CNT301 WHERE '
           + ' CIAID='''+dblcCia.text+''' AND TDIARID='''+dblctdiario.text
           + ''' AND CNTANOMM='''+xperiodo+''' AND CNTCOMPROB >='+''''+edtCompIni.Text+''''
           + ' and CNTCOMPROB <='+''''+edtCompFin.Text+''' AND '+DMCXP.wReplacCeros+'(CNTFAUTOM,''N'')<>''S'' '
           + 'GROUP BY CNTCOMPROB, CNTDH '
           + 'ORDER BY CNTCOMPROB';
      DMCXP.CDSQRY.Close;
      DMCXP.CDSQRY.DataRequest(xSQL);
      DMCXP.CDSQRY.Open;
      DMCXP.CDSQRY.IndexFieldNames:='CNTCOMPROB';

      DMCXP.cdsCxP.FIRST;
      while not DMCXP.cdsCxP.eof do
      begin
        SUMA:=0;
        DMCXP.CDSQRY.SetKey;
        DMCXP.CDSQRY.fieldbyname('CNTCOMPROB').asstring:=DMCXP.cdsCxP.fieldbyname('CNTCOMPROB').asstring;
        if DMCXP.CDSQRY.GotoKey then
        begin
            DMCXP.cdsCxP.edit;
            DMCXP.cdsCxP.fieldbyname('TOTAL').ASFLOAT:=DMCXP.cdsQry.fieldbyname('TOTAL').ASFLOAT
        end;
        DMCXP.cdsCxP.NEXT;
        SUMA:=0;
      end;
      DMCXP.CDSQRY.IndexFieldNames:='';

      ppdbpPreview.DataSource := DMCXP.dsCxP;
      pprPreview.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\BCxPVoucher.rtm' ;
      pprPreview.template.LoadFromFile ;

      lblTD.caption:=DMCXP.cdsCxP.fieldbyname('TDIARID').asstring;
      lbldiario.caption:=DMCXP.DisplayDescrip2('dspTGE','TGE104','TDIARDES','TDIARID='+quotedstr(DMCXP.cdsCxP.fieldbyname('TDIARID').asstring),'TDIARDES');
      //lblmoneda.caption   := DMCXP.DisplayDescrip2('dspTGE','TGE103','TMONABR','TMONID='+quotedstr(DMCXP.cdsCxP.fieldbyname('TMONID').asstring),'TMONABR');
      //lblproveedor.caption:= DMCXP.DisplayDescrip2('dspTGE','TGE201','Prov,ProvRUC,ProvDES','PROV='+quotedstr(DMCXP.cdsCxP.fieldbyname('DCPAUXID').asstring),'PROVDES');
      //lblauxiliar.caption := DMCXP.cdsCxP.fieldbyname('DCPAUXID').asstring;
      mes:=copy(DMCXP.cdsCxP.fieldbyname('CNTANOMM').asstring,5,2);
      ano:=copy(DMCXP.cdsCxP.fieldbyname('CNTANOMM').asstring,1,4);

      xWhere := 'MESIDR='''+mes+'''';
      mesdes := DMCXP.DisplayDescrip2('dspTGE','TGE181','MESDESL',XWHERE,'MESDESL');
      lblPeriodo.Caption  :=mesdes+' '+ano;
      lblCiaDes.caption:=edtcia.text;
      lblestado.caption:='Contabilizado';

      DMCXP.cdsCxP.First ;
      While not DMCXP.cdsCxP.Eof do
      begin
            If DMCXP.cdsCxP.FieldByName('CNTDH').AsString = 'H' then
               xTotHaber:= xTotHaber+FRound(DMCXP.cdsCxP.Fieldbyname('CNTMTOORI').Value,15,2);
            DMCXP.cdsCxP.Next;
      end;
      DMCXP.cdsCxP.First;
      DMCXP.cdsCxP.IndexFieldNames:='CIAID;CNTANOMM;TDIARID;CNTCOMPROB;CNTREG';
      pprPreview.print;
      pprPreview.Stop;

      x10:=self.componentCount-1;
      while x10>0 do begin
        if self.components[x10].classname='TppGroup' then begin
           self.components[x10].free;
        end;
        x10:=x10-1;
      end;
      DMCXP.cdsCxP.IndexFieldNames:='';

      ppdbpPreview.DataSource := nil ;
end;

procedure TFImpBProvision.FormActivate(Sender: TObject);
var
  xAno, xMes, xDia : Word;

begin
  {
  DMCXP.cdsMovCxP.First;
  edtCompIni.text:=DMCXP.cdsMovCxP.fieldbyname('CPNOREG').asstring;

  DMCXP.cdsMovCxP.Last;
  edtCompFin.text:=DMCXP.cdsMovCxP.fieldbyname('CPNOREG').asstring;
  }
  DecodeDate(Date, xAno, xMes, xDia);
  speAno.Value:=xAno;
  speMM.Value:=xMes;


end;

procedure TFImpBProvision.edtCompIniExit(Sender: TObject);
begin
  edtCompIni.text:=StrZero(edtCompIni.text,10);
end;

procedure TFImpBProvision.edtCompFinExit(Sender: TObject);
begin
  edtCompFin.text:=StrZero(edtCompFin.text,10);
end;

procedure TFImpBProvision.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFImpBProvision.ppHeaderBand2BeforePrint(Sender: TObject);
VAR
CIA:STRING;
begin

end;

procedure TFImpBProvision.pprPreviewPreviewFormCreate(Sender: TObject);
begin
  pprPreview.PreviewForm.ClientHeight := 580;
  pprPreview.PreviewForm.ClientWidth := 780;			// ppViewr
  tppviewer(pprPreview.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFImpBProvision.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.
