unit CxP268;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, Mask, wwdbedit,
  ExtCtrls;

type
  TFAsientos = class(TForm)
    dbgConta: TwwDBGrid;
    pnlLote: TPanel;
    dbeLote: TwwDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    pnlDoc: TPanel;
    dbgDoc: TwwDBGrid;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAsientos: TFAsientos;

implementation

{$R *.dfm}

USES CXPDM, CXP264;

procedure TFAsientos.FormActivate(Sender: TObject);
begin
  dbgConta.Selected.Clear;
  dbgConta.Selected.Add('CIAID'#9'3'#9'Cía'#9'F');
  dbgConta.Selected.Add('TDIARID'#9'3'#9'TD'#9'F');
  dbgConta.Selected.Add('CNTANOMM'#9'7'#9'Periodo'#9'F');
  dbgConta.Selected.Add('CNTCOMPROB'#9'11'#9'Comprobante'#9'F');
  dbgConta.Selected.Add('CNTLOTE'#9'5'#9'Lote'#9'F');
  dbgConta.Selected.Add('CNTGLOSA'#9'32'#9'Glosa'#9'F');
  dbgConta.Selected.Add('TMONID'#9'2'#9'TM'#9'F');
  dbgConta.Selected.Add('CNTDEBEMN'#9'10'#9'Debe~Soles'#9'F');
  dbgConta.Selected.Add('CNTHABEMN'#9'10'#9'Haber~Soles'#9'F');
  dbgConta.Selected.Add('CNTDEBEME'#9'10'#9'Debe~Dolares'#9'F');
  dbgConta.Selected.Add('CNTHABEME'#9'10'#9'Haber~Dolares'#9'F');
  dbgConta.DataSource:=DMCXP.dsDetCjeProv;
end;

procedure TFAsientos.BitBtn1Click(Sender: TObject);
var
   xSQL : String;
begin
   if DMCXP.cdsDetCjeProv.ApplyUpdates(-1)>0 then
      ShowMessage('Error')
   else
   begin
      xSQL:='Update CNT301 SET CNTLOTE='''+DMCXP.cdsDetCjeProv.FieldByname('CNTLOTE').AsString+''' '
           +'where CIAID='''     +DMCXP.cdsDetCjeProv.FieldByname('CIAID').AsString     +''' '
           +  'and TDIARID='''   +DMCXP.cdsDetCjeProv.FieldByname('TDIARID').AsString   +''' '
           +  'and CNTANOMM='''  +DMCXP.cdsDetCjeProv.FieldByname('CNTANOMM').AsString  +''' '
           +  'and CNTCOMPROB='''+DMCXP.cdsDetCjeProv.FieldByname('CNTCOMPROB').AsString+'''';
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      ShowMessage('Ok');
   end;
end;

procedure TFAsientos.BitBtn2Click(Sender: TObject);
var
   xSQL, xNoComp02, xNoCompFI, xNoComp, xPeriodo, xOrigen, xLote, xTCambio, xCta166, xCta466, xWhere, xCiaAbr : String;
begin
   DMCXP.cdsQry.indexfieldnames:='';
   xWhere:='CIAID='+quotedstr(DMCXP.cdsOPago.FieldByname('CIAID').AsString);
   xCiaAbr:=BuscaQry('dspTGE','TGE101','CIAABR,CIARETIGV,EXOIGV',xWhere,'CIAABR');
   xOrigen :='53';
   xPeriodo:=Copy(DMCXP.cdsOPago.FieldByname('FECHA').AsString,7,4)+Copy(DMCXP.cdsOPago.FieldByname('FECHA').AsString,4,2);
   xLote   := Copy( DMCXP.cdsOPago.FieldByname('NUMERO').AsString, 3,4);

   xTCambio:='0';
   xWhere:='TMONID='''+DMCXP.wTMonExt+''' and FECHA='''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+'''';
   if length(BuscaQry('PrvTGE','TGE107','*',xWhere,'TMONID'))>0 then
      xTCambio:=FloatToStr(DMCXP.cdsQry.fieldbyname('TCAM'+DMCXP.wVRN_TipoCambio).AsFloat);

   if xTCambio='0' then
   begin
      ShowMessage('Falta ingresar el Tipo de Cambio');
      Exit;
   end;

 if MessageDlg('¿ Contabilizar Orden de Pago ?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
 begin

   Screen.Cursor := crHourGlass;

   //////////////////////////////////
   //  ASIENTO EN COMPAÑIA FILIAL  //
   //////////////////////////////////

   if DMCXP.cdsOPago.FieldByname('TMONID').AsString='D' then
     xSQL:='SELECT CIAID, CNTCOMPROB FROM CNT300 '
          +'WHERE CIAID in ('''+DMCXP.cdsOPago.FieldByname('CIAID').AsString+''',''02'' ) and CNTANOMM='''+xPeriodo+''' '
          +  'and TDIARID='''  +xOrigen         +''' and CNTLOTE='''+xLote+''' '
          +  'and ( CNTDEBEME='+FloatToStr(FOrdenPagoCab.nImpPago)+' '
          +   'or CNTHABEME='+FloatToStr(FOrdenPagoCab.nImpPago)+' '
          +   'or CNTDEBEMN='+FloatToStr(FOrdenPagoCab.nImpPago)+' ) '
          +'ORDER BY CIAID, CNTCOMPROB'
   else
     xSQL:='SELECT CIAID, CNTCOMPROB FROM CNT300 '
          +'WHERE CIAID in ('''+DMCXP.cdsOPago.FieldByname('CIAID').AsString+''',''02'' ) and CNTANOMM='''+xPeriodo+''' '
          +  'and TDIARID='''  +xOrigen         +''' and CNTLOTE='''+xLote+''' '
          +  'and (CNTDEBEMN='+FloatToStr(FOrdenPagoCab.nImpPago)+' '
          +   'or CNTHABEMN='+FloatToStr(FOrdenPagoCab.nImpPago)+' '
          +   'or CNTDEBEME='+FloatToStr(FOrdenPagoCab.nImpPago)+' ) '
          +'ORDER BY CIAID, CNTCOMPROB';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.indexfieldnames:='CIAID;CNTCOMPROB';
   DMCXP.cdsQry.DataRequest( xSQL );
   DMCXP.cdsQry.Open;

   if DMCXP.cdsOPago.FieldByname('CIAID').AsString='02' then
   begin
   
   end
   else
   begin
      if DMCXP.cdsQry.recordcount<>2 then
      begin
         DMCXP.cdsQry.indexfieldnames:='';
         ShowMessage('Error : No existen Dos (2) Asientos Contables');
         Exit;
      end;
   end;

   xNoComp02:=DMCXP.cdsQry.FieldByName('CNTCOMPROB').AsString;
   DMCXP.cdsQry.Next;
   xNoCompFi:=DMCXP.cdsQry.FieldByName('CNTCOMPROB').AsString;
   DMCXP.cdsQry.indexfieldnames:='';

   xSQL:='Select CTADEBE, B.CTA_AUX AUX_D, B.CTA_CCOS CCOS_D, CTAHABER, C.CTA_AUX AUX_H, C.CTA_CCOS CCOS_H, TDIARID, CIAORIGEN, TDIARID2 '
        +'From CAJA103 A, TGE202 B, TGE202 C '
        +'Where A.CIAID='''+DMCXP.cdsOPago.FieldByname('CIAID').AsString+''' '
        + ' AND B.CIAID=A.CIAID AND A.CTADEBE=B.CUENTAID '
        + ' AND C.CIAID=A.CIAID AND A.CTAHABER=C.CUENTAID ';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xSQL );
   DMCXP.cdsQry.Open;
   xCta166:=DMCXP.cdsQry.FieldByName('CTADEBE').AsString;
   xCta466:=DMCXP.cdsQry.FieldByName('CTAHABER').AsString;

   if xCta466='' then
   begin
      xSQL:='Select CTAPRINC From TGE106 '
           +'Where CIAID=''02'' AND BANCOID='''+DMCXP.cdsOPago.FieldByname('BANCOID').AsString+''' '
           +  'and CCBCOID='''+DMCXP.cdsOPago.FieldByname('CCBCOID').AsString+''' ';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest( xSQL );
      DMCXP.cdsQry.Open;
      xCta466:=DMCXP.cdsQry.FieldByName('CTAPRINC').AsString;
   end;

   xNoComp:=xNoCompFi;
   if xNoComp='' then
   begin
       xSQL:='SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
            +'WHERE CIAID='''+DMCXP.cdsOPago.FieldByname('CIAID').AsString+''' AND CNTANOMM='''+xPeriodo+''' AND TDIARID='''+xOrigen+'''';
       DMCXP.cdsQry.Close;
       DMCXP.cdsQry.indexfieldnames:='';
       DMCXP.cdsQry.DataRequest( xSQL );
       DMCXP.cdsQry.Open;
       xNoComp:=DMCXP.cdsQry.FieldByName('NOCOMP').AsString;
   end;

   xSQL:='delete from CNT311 '
        +'WHERE CIAID='''   +DMCXP.cdsOPago.FieldByname('CIAID').AsString+''' '
        +  'AND TDIARID=''' +xOrigen +''' AND CNTANOMM='''+xPeriodo+''' AND CNTCOMPROB='''+xNoComp+'''';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   xSQL:='delete from CNT301 '
        +'WHERE CIAID='''   +DMCXP.cdsOPago.FieldByname('CIAID').AsString+''' '
        +  'AND TDIARID=''' +xOrigen +''' AND CNTANOMM='''+xPeriodo+''' AND CNTCOMPROB='''+xNoComp+'''';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   xSQL:='delete from CNT300 '
        +'WHERE CIAID='''   +DMCXP.cdsOPago.FieldByname('CIAID').AsString+''' '
        +  'AND TDIARID=''' +xOrigen +''' AND CNTANOMM='''+xPeriodo+''' AND CNTCOMPROB='''+xNoComp+'''';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);


   // cabecera
   xSQL:='INSERT INTO CNT300 (CIAID, TDIARID, CNTCOMPROB, '
        +  'CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
        +  'CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
        +  'CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
        +  'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
        +'Select A.CIAID, '''+xOrigen+''', '''+xNoComp+''', '
        +  ''''+xPeriodo+''', '''+xLote+''', ''P:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString+' TELECREDITO'', '+xTCambio+', '''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''', '
        +  '''I'', ''N'', NULL, '''+DMCXP.wUsuario+''', SYSDATE, SYSDATE, b.fecano , b.fecmes, b.fecdia, '
        +  'b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, A.TMONID,  NULL, NULL, NULL, TDIARDES, '
        +  'CASE WHEN A.TMONID=''N'' THEN A.MONPAG ELSE round(A.MONPAG*'+xTCambio+',2) END, CASE WHEN A.TMONID=''D'' THEN A.MONPAG ELSE round(A.MONPAG/'+xTCambio+',2) END, '
        +  'CASE WHEN A.TMONID=''N'' THEN A.MONPAG ELSE round(A.MONPAG*'+xTCambio+',2) END, CASE WHEN A.TMONID=''D'' THEN A.MONPAG ELSE round(A.MONPAG/'+xTCambio+',2) END, 0, 0, NULL, ''CXP'', ''CXP'' '
        +'FROM CXP_ORD_PAG_CAB A, TGE114 B, TGE104 C '
        +'WHERE A.CIAID='''+DMCXP.cdsOPago.FieldByname('CIAID').AsString+''' AND A.NUMERO='''+DMCXP.cdsOPago.FieldByname('NUMERO').AsString+''' and modulo is null '
        +  'AND A.FECHA=B.FECHA '
        +  'AND C.TDIARID='''+xOrigen+'''';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 1
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select A.CIAID, '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , b.fecano, '''+xPeriodo+''', '''+xLote+''', D.CTATOTAL, D.CLAUXID, PROV, '
        +  'D.DOCID, D.CPSERIE, D.CPNODOC, SUBSTR(D.PROVDES,1,40), case when A.IMPPAGO<0 then ''H'' else ''D'' END, NULL, '+xTCambio+', '
        +  'ABS(A.IMPPAGO), ABS(CASE WHEN A.TMONID=''N'' THEN A.IMPPAGO ELSE round(A.IMPPAGO*'+xTCambio+',2) END), '
        +  'ABS(CASE WHEN A.TMONID=''D'' THEN A.IMPPAGO ELSE round(A.IMPPAGO/'+xTCambio+',2) END), '
        +  'D.CPFEMIS, D.CPFVCMTO, '''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''', ''I'', ''N'', ''N'', '''+DMCXP.wUsuario+''', '
        +  'SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARDES, E.CTAABR, SUBSTR(D.PROVDES,1,15), F.DOCABR, NULL, '
        +  'case when A.IMPPAGO>=0 then CASE WHEN A.TMONID=''N'' THEN A.IMPPAGO ELSE round(A.IMPPAGO*'+xTCambio+',2) END ELSE 0 END, '
        +  'case when A.IMPPAGO>=0 then CASE WHEN A.TMONID=''D'' THEN A.IMPPAGO ELSE round(A.IMPPAGO/'+xTCambio+',2) END ELSE 0 END, '
        +  'case when A.IMPPAGO<0 then ABS(CASE WHEN A.TMONID=''N'' THEN A.IMPPAGO ELSE round(A.IMPPAGO*2.825,2) END) ELSE 0 END, '
        +  'case when A.IMPPAGO<0 then ABS(CASE WHEN A.TMONID=''D'' THEN A.IMPPAGO ELSE round(A.IMPPAGO/2.825,2) END) ELSE 0 END, '
        +  '0, 0, NULL, NULL, NULL, ''CXP'', ROWNUM, ''CXP'', NULL '
        +'FROM CXP_ORD_PAG_DET A, CXP301 D, TGE114 B, TGE104 C, TGE202 E, TGE110 F '
        +'WHERE A.CIAID='''+DMCXP.cdsOPago.FieldByname('CIAID').AsString+''' AND A.NUMERO='''+DMCXP.cdsOPago.FieldByname('NUMERO').AsString+''' '
        +  'AND A.CIAID=D.CIAID(+) AND A.CLAUXID=D.CLAUXID AND A.AUXID=D.PROV '
        +  'AND A.DOCID=D.DOCID(+) AND NVL(A.CPSERIE,''0'')=NVL(D.CPSERIE,''0'') AND A.CPNODOC=D.CPNODOC(+) '
        +  'AND D.CPESTADO IN (''P'',''C'') '
        +  'AND B.FECHA(+)='''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=E.CIAID AND D.CTATOTAL=E.CUENTAID '
        +  'AND A.DOCID=F.DOCID '
        +'ORDER BY A.ITEM ';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 2
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select A.CIAID, '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , b.fecano, '''+xPeriodo+''', '''+xLote+''', '''+xCta466+''', NULL, NULL, '
        +  '''21'', ''ABO'', '''+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString+''', '''+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString+' - ABONO EN CUENTA'', ''H'', NULL, '+xTCambio+', '
        +  'A.MONPAG, CASE WHEN A.TMONID=''N'' THEN A.MONPAG ELSE round(A.MONPAG*'+xTCambio+',2) END, CASE WHEN A.TMONID=''D'' THEN A.MONPAG ELSE round(A.MONPAG/'+xTCambio+',2) END, '
        +  ''''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''', '''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''', '''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''', ''I'', ''N'', ''N'', '''+DMCXP.wUsuario+''', '
        +  'SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARDES, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  '0, 0, CASE WHEN A.TMONID=''N'' THEN A.MONPAG ELSE round(A.MONPAG*'+xTCambio+',2) END, CASE WHEN A.TMONID=''D'' THEN A.MONPAG ELSE round(A.MONPAG/'+xTCambio+',2) END, 0, 0, NULL, NULL, '
        +  'NULL, ''CXP'', '+IntToStr(DMCXP.cdsDetallePres.RecordCount+1)+', ''CXP'', NULL '
        +'FROM CXP_ORD_PAG_CAB A, TGE106 D, TGE114 B, TGE104 C, TGE202 E '
        +'WHERE A.CIAID='''+DMCXP.cdsOPago.FieldByname('CIAID').AsString+''' AND A.NUMERO='''+DMCXP.cdsOPago.FieldByname('NUMERO').AsString+''' and modulo is null '
        +  'AND B.FECHA(+)='''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND D.CIAID=''02'' AND D.BANCOID=A.BANCOID AND D.CCBCOID=A.CCBCOID '
        +  'AND A.CIAID=E.CIAID AND '''+xCta466+'''=E.CUENTAID ';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);


   ///////////////////////////////
   //  ASIENTO EN COMPAÑIA 02   //
   ///////////////////////////////

   if DMCXP.cdsOPago.FieldByname('CIAID').AsString<>'02' then
   begin

      xNoComp:=xNoComp02;
      if xNoComp='' then
      begin
          xSQL:='SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
               +'WHERE CIAID=''02'' AND CNTANOMM='''+xPeriodo+''' AND TDIARID='''+xOrigen+'''';
          DMCXP.cdsQry.Close;
          DMCXP.cdsQry.indexfieldnames:='';
          DMCXP.cdsQry.DataRequest( xSQL );
          DMCXP.cdsQry.Open;
          xNoComp:=DMCXP.cdsQry.FieldByName('NOCOMP').AsString;
      end;

      xSQL:='delete from CNT311 '
           +'WHERE CIAID=''02'' AND TDIARID=''' +xOrigen +''' AND CNTANOMM='''+xPeriodo+''' AND CNTCOMPROB='''+xNoComp+'''';
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      xSQL:='delete from CNT301 '
           +'WHERE CIAID=''02'' AND TDIARID=''' +xOrigen +''' AND CNTANOMM='''+xPeriodo+''' AND CNTCOMPROB='''+xNoComp+'''';
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      xSQL:='delete from CNT300 '
           +'WHERE CIAID=''02'' AND TDIARID=''' +xOrigen +''' AND CNTANOMM='''+xPeriodo+''' AND CNTCOMPROB='''+xNoComp+'''';
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

      xSQL:='INSERT INTO CNT300 (CIAID, TDIARID, CNTCOMPROB, '
           +  'CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
           +  'CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
           +  'CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
           +  'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
           +'Select ''02'', '''+xOrigen+''', '''+xNoComp+''', '
           +  ''''+xPeriodo+''', '''+xLote+''', ''P:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString+' / TELECREDITO '+xCiaAbr+''', '+xTCambio+', '''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''', '
           +  '''I'', ''N'', NULL, '''+DMCXP.wUsuario+''', SYSDATE, SYSDATE, b.fecano , b.fecmes, b.fecdia, '
           +  'b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, A.TMONID,  NULL, NULL, NULL, TDIARDES, '
           +  'CASE WHEN A.TMONID=''N'' THEN A.MONPAG ELSE round(A.MONPAG*'+xTCambio+',2) END, CASE WHEN A.TMONID=''D'' THEN A.MONPAG ELSE round(A.MONPAG/'+xTCambio+',2) END, '
           +  'CASE WHEN A.TMONID=''N'' THEN A.MONPAG ELSE round(A.MONPAG*'+xTCambio+',2) END, CASE WHEN A.TMONID=''D'' THEN A.MONPAG ELSE round(A.MONPAG/'+xTCambio+',2) END, 0, 0, NULL, ''CXP'', ''CXP'' '
           +'FROM CXP_ORD_PAG_CAB A, TGE114 B, TGE104 C '
           +'WHERE A.CIAID='''+DMCXP.cdsOPago.FieldByname('CIAID').AsString+''' AND A.NUMERO='''+DMCXP.cdsOPago.FieldByname('NUMERO').AsString+''' and modulo is null '
           +  'AND A.FECHA=B.FECHA '
           +  'AND C.TDIARID='''+xOrigen+'''';
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

      // DETALLE 1
      xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
           +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
           +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
           +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
           +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
           +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
           +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
           +'Select ''02'', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , b.fecano, '''+xPeriodo+''', '''+xLote+''', '''+xCta166+''', NULL, NULL, '
           +  '''21'', ''ABO'', '''+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString+''', ''P:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString+' TELECREDITO '', ''D'', NULL, '+xTCambio+', '
           +  'A.MONPAG, CASE WHEN A.TMONID=''N'' THEN A.MONPAG ELSE round(A.MONPAG*'+xTCambio+',2) END, CASE WHEN A.TMONID=''D'' THEN A.MONPAG ELSE round(A.MONPAG/'+xTCambio+',2) END, '
           +  ''''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''', '''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''', '''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''', ''I'', ''N'', ''N'', '''+DMCXP.wUsuario+''', '
           +  'SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, '
           +  'A.TMONID, NULL, NULL, NULL, C.TDIARDES, G.CTAABR, NULL, ''A Cuenta'', NULL, '
           +  'CASE WHEN A.TMONID=''N'' THEN A.MONPAG ELSE round(A.MONPAG*'+xTCambio+',2) END, CASE WHEN A.TMONID=''D'' THEN A.MONPAG ELSE round(A.MONPAG/'+xTCambio+',2) END, 0, 0, 0, 0, NULL, NULL, '
           +  'NULL, ''CXP'', 1, ''CXP'', NULL '
           +'FROM CXP_ORD_PAG_CAB A, TGE106 D, TGE114 B, TGE104 C, TGE202 G '
           +'WHERE A.CIAID='''+DMCXP.cdsOPago.FieldByname('CIAID').AsString+''' AND A.NUMERO='''+DMCXP.cdsOPago.FieldByname('NUMERO').AsString+''' and modulo is null '
           +  'AND B.FECHA(+)='''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''' '
           +  'AND C.TDIARID(+)='''+xOrigen+''' '
           +  'AND D.CIAID=''02'' AND D.BANCOID=A.BANCOID AND D.CCBCOID=A.CCBCOID '
           +  'AND G.CIAID=''02'' AND G.CUENTAID='''+xCta166+'''';
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

      // DETALLE 2
      xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
           +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
           +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
           +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
           +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
           +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
           +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
           +'Select ''02'', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , b.fecano, '''+xPeriodo+''', '''+xLote+''', D.CTAPRINC, NULL, NULL, '
           +  '''21'', ''ABO'', '''+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString+''', '''+xCiaAbr+' / P:'+DMCXP.cdsOPago.FieldByname('NUMPLA').AsString+''', ''H'', NULL, '+xTCambio+', '
           +  'A.MONPAG, CASE WHEN A.TMONID=''N'' THEN A.MONPAG ELSE round(A.MONPAG*'+xTCambio+',2) END, CASE WHEN A.TMONID=''D'' THEN A.MONPAG ELSE round(A.MONPAG/'+xTCambio+',2) END, '
           +  ''''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''', '''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''', '''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''', ''I'', ''N'', ''N'', '''+DMCXP.wUsuario+''', '
           +  'SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, '
           +  'A.TMONID, NULL, NULL, NULL, C.TDIARDES, G.CTAABR, NULL, ''A Cuenta'', NULL, '
           +  '0, 0, CASE WHEN A.TMONID=''N'' THEN A.MONPAG ELSE round(A.MONPAG*'+xTCambio+',2) END, CASE WHEN A.TMONID=''D'' THEN A.MONPAG ELSE round(A.MONPAG/'+xTCambio+',2) END, 0, 0, NULL, NULL, '
           +  'NULL, ''CXP'', 2, ''CXP'', NULL '
           +'FROM CXP_ORD_PAG_CAB A, TGE106 D, TGE114 B, TGE104 C, TGE202 G '
           +'WHERE A.CIAID='''+DMCXP.cdsOPago.FieldByname('CIAID').AsString+''' AND A.NUMERO='''+DMCXP.cdsOPago.FieldByname('NUMERO').AsString+''' and modulo is null '
           +  'AND B.FECHA(+)='''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''' '
           +  'AND C.TDIARID(+)='''+xOrigen+''' '
           +  'AND D.CIAID=''02'' AND D.BANCOID=A.BANCOID AND D.CCBCOID=A.CCBCOID '
           +  'AND G.CIAID=''02'' AND G.CUENTAID='''+xCta166+'''';
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
   end;


   DMCXP.cdsOPago.Edit;
   DMCXP.cdsOPago.fieldByname('USUCONTA').AsString:=DMCXP.wUsuario;
   DMCXP.cdsOPago.fieldByname('FECCONTA').AsDateTime:=DATE;
   DMCXP.cdsOPago.Post;

   Screen.Cursor := crDefault;

   if DMCXP.cdsOPago.ApplyUpdates(-1)>0 then
   begin
      ShowMessage('Error al grabar 1');
      Exit;
   end;
   if DMCXP.cdsDetCjeProv.ApplyUpdates(-1)>0 then
   begin
      ShowMessage('Error al grabar 2');
      Exit;
   end;

 end;

end;

procedure TFAsientos.BitBtn3Click(Sender: TObject);
var
   xSQL : String;
begin
   if MessageDlg('¿ Seguro de Eliminar Asiento ?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin
      xSQL:='delete from CNT301 '
           +'where CIAID='''     +DMCXP.cdsDetCjeProv.FieldByname('CIAID').AsString     +''' '
           +  'and TDIARID='''   +DMCXP.cdsDetCjeProv.FieldByname('TDIARID').AsString   +''' '
           +  'and CNTANOMM='''  +DMCXP.cdsDetCjeProv.FieldByname('CNTANOMM').AsString  +''' '
           +  'and CNTCOMPROB='''+DMCXP.cdsDetCjeProv.FieldByname('CNTCOMPROB').AsString+'''';
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

      xSQL:='delete from CNT311 '
           +'where CIAID='''     +DMCXP.cdsDetCjeProv.FieldByname('CIAID').AsString     +''' '
           +  'and TDIARID='''   +DMCXP.cdsDetCjeProv.FieldByname('TDIARID').AsString   +''' '
           +  'and CNTANOMM='''  +DMCXP.cdsDetCjeProv.FieldByname('CNTANOMM').AsString  +''' '
           +  'and CNTCOMPROB='''+DMCXP.cdsDetCjeProv.FieldByname('CNTCOMPROB').AsString+'''';
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

      xSQL:='delete from CNT300 '
           +'where CIAID='''     +DMCXP.cdsDetCjeProv.FieldByname('CIAID').AsString     +''' '
           +  'and TDIARID='''   +DMCXP.cdsDetCjeProv.FieldByname('TDIARID').AsString   +''' '
           +  'and CNTANOMM='''  +DMCXP.cdsDetCjeProv.FieldByname('CNTANOMM').AsString  +''' '
           +  'and CNTCOMPROB='''+DMCXP.cdsDetCjeProv.FieldByname('CNTCOMPROB').AsString+'''';
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);

      ShowMessage('Eliminado');
      DMCXP.cdsDetCjeProv.Close;
      DMCXP.cdsDetCjeProv.Open;
   end;
end;

procedure TFAsientos.BitBtn4Click(Sender: TObject);
var
   xSQL, xWhere, xTCambio, xOrigen : String;
   dImpPago : Double;
begin
   xOrigen :='53';
   xTCambio:='0';
   xWhere:='TMONID='''+DMCXP.wTMonExt+''' and FECHA='''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+'''';
   if length(BuscaQry('PrvTGE','TGE107','*',xWhere,'TMONID'))>0 then
      xTCambio:=FloatToStr(DMCXP.cdsQry.fieldbyname('TCAM'+DMCXP.wVRN_TipoCambio).AsFloat);

   if xTCambio='0' then
   begin
      ShowMessage('Falta ingresar el Tipo de Cambio');
      Exit;
   end;

   xSQL:='Select A.CIAID, D.CTATOTAL, D.CLAUXID, PROV, D.DOCID, D.CPSERIE, D.CPNODOC, SUBSTR(D.PROVDES,1,40), '+xTCambio+', '
        +  'A.IMPPAGO, CASE WHEN A.TMONID=''N'' THEN A.IMPPAGO ELSE round(A.IMPPAGO*'+xTCambio+',2) END SOLES, CASE WHEN A.TMONID=''D'' THEN A.IMPPAGO ELSE round(A.IMPPAGO/'+xTCambio+',2) END DOLARES, '
        +  'D.CPFEMIS, D.CPFVCMTO, '''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''', '''+DMCXP.wUsuario+''', '
        +  'A.TMONID, E.CTAABR, F.DOCABR, ROWNUM '
        +'FROM CXP_ORD_PAG_DET A, CXP301 D, TGE114 B, TGE104 C, TGE202 E, TGE110 F '
        +'WHERE A.CIAID='''+DMCXP.cdsOPago.FieldByname('CIAID').AsString+''' AND A.NUMERO='''+DMCXP.cdsOPago.FieldByname('NUMERO').AsString+''' '
        +  'AND A.CIAID=D.CIAID(+) AND A.CLAUXID=D.CLAUXID AND A.AUXID=D.PROV '
        +  'AND A.DOCID=D.DOCID(+) AND A.CPSERIE=D.CPSERIE(+) AND A.CPNODOC=D.CPNODOC(+) '
        +  'AND D.CPESTADO IN (''P'',''C'') '
        +  'AND B.FECHA(+)='''+DMCXP.cdsOPago.FieldByname('FECHA').AsString+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=E.CIAID AND D.CTATOTAL=E.CUENTAID '
        +  'AND A.DOCID=F.DOCID '
        +'ORDER BY A.ITEM ';
   DMCXP.cdsHLetras.Close;
   DMCXP.cdsHLetras.DataRequest( xSQL );
   DMCXP.cdsHLetras.Open;
                                                
   dImpPago:=0;
   DMCXP.cdsHLetras.First;
   while not DMCXP.cdsHLetras.Eof do
   begin
      dImpPago:=dImpPago+DMCXP.cdsHLetras.FieldByname('IMPPAGO').AsFloat;
      DMCXP.cdsHLetras.Next;
   end;
   dbgDoc.ColumnByName('IMPPAGO').FooterValue :=floattostrf(dImpPago, ffNumber, 10, 2);
   DMCXP.cdsHLetras.First;

   pnlDoc.Visible:=true;
   pnlDoc.BringToFront;
end;

procedure TFAsientos.BitBtn5Click(Sender: TObject);
begin
   pnlDoc.Visible:=False;
end;

procedure TFAsientos.BitBtn6Click(Sender: TObject);
var
   xSQL, xWhere, xTCambio, xOrigen : String;
   dImpPago : Double;
begin

   xSQL:='Select A.*, ROWID '
        +'FROM CXP_ORD_PAG_DET A '
        +'WHERE A.CIAID='''+DMCXP.cdsOPago.FieldByname('CIAID').AsString+''' AND A.NUMERO='''+DMCXP.cdsOPago.FieldByname('NUMERO').AsString+''' '
        +'ORDER BY A.ITEM ';
   DMCXP.cdsHLetras.Close;
   DMCXP.cdsHLetras.DataRequest( xSQL );
   DMCXP.cdsHLetras.Open;
                                                
   dImpPago:=0;
   DMCXP.cdsHLetras.First;
   while not DMCXP.cdsHLetras.Eof do
   begin
      dImpPago:=dImpPago+DMCXP.cdsHLetras.FieldByname('IMPPAGO').AsFloat;
      DMCXP.cdsHLetras.Next;
   end;
   dbgDoc.ColumnByName('IMPPAGO').FooterValue :=floattostrf(dImpPago, ffNumber, 10, 2);
   DMCXP.cdsHLetras.First;

   pnlDoc.Visible:=true;
   pnlDoc.BringToFront;
end;

procedure TFAsientos.BitBtn7Click(Sender: TObject);
begin
     if DMCXP.cdsHLetras.ApplyUpdates(-1)>0 then
     begin
        ShowMessage('Error al grabar 2');
        Exit;
     end;
     ShowMessage('Grabado');
end;

end.
