unit CXP802;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, wwdbedit, StdCtrls, wwdblook, Buttons, ExtCtrls, wwdbdatetimepicker,
  Spin, ppVar, ppPrnabl, ppClass, ppCtrls, ppBands, ppCache, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, oaVariables;

type
  TFToolCtaCte = class(TForm)
    pnlTool: TPanel;
    Label11: TLabel;
    dblcCia: TwwDBLookupCombo;
    dbeCIA: TwwDBEdit;
    bbtnEjecuta: TBitBtn;
    seAno: TSpinEdit;
    seMes: TSpinEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    pprCtaCteProv: TppReport;
    ppdbCtaCteProv: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel8: TppLabel;
    pplblciades: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    GroupBox1: TGroupBox;
    RbTodos: TRadioButton;
    RbFiltrar1: TRadioButton;
    Label2: TLabel;
    edtMonto: TEdit;
    RbFiltrar2: TRadioButton;
    RbFiltrar3: TRadioButton;
    RbFiltrar4: TRadioButton;
    RbFiltrar5: TRadioButton;
    RbFiltrar6: TRadioButton;
    Timer1: TTimer;
    procedure dblcCiaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnEjecutaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RbFiltrar1Click(Sender: TObject);
    procedure RbTodosClick(Sender: TObject);
    procedure RbFiltrar2Click(Sender: TObject);
    procedure RbFiltrar3Click(Sender: TObject);
    procedure RbFiltrar4Click(Sender: TObject);
    procedure RbFiltrar5Click(Sender: TObject);
    procedure RbFiltrar6Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
     xfiltro : String;
  public
    { Public declarations }
  end;

var
  FToolCtaCte: TFToolCtaCte;
  xAccesoBotones : Boolean;

implementation

uses CxPDM, CXP001;

{$R *.DFM}

procedure TFToolCtaCte.dblcCiaExit(Sender: TObject);
begin
	 dbeCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CIAID',dblcCia.Text);

	 if length(dbeCia.Text)=0 then
	 begin
			ShowMessage('Falta Código de Compañía');
			dblcCia.SetFocus;
	 end;
end;

procedure TFToolCtaCte.FormCreate(Sender: TObject);
begin
//  dtpFecha.date:=date;
end;

procedure TFToolCtaCte.bbtnEjecutaClick(Sender: TObject);
var
   xSQL, xMesAct, xMesAnt, xAnoAct : String;
   wAno, wMes, wDia : word;

begin


   if dblcCia.text='' then begin
      ShowMessage('Falta Compañía');
      dblcCia.Text;
      Exit;
   end;

// apertura Tabla de Tipos de Documento
   xSQL := 'select * from TGE110 where DOCMOD=''CXP'' ';
   DMCXP.cdsTDoc.Close;
   DMCXP.cdsTDoc.IndexFieldNames:='DOCID';
   DMCXP.cdsTDoc.Filter:='';
   DMCXP.cdsTDoc.DataRequest(xSQL);
   DMCXP.cdsTDoc.Open;

//   Decodedate( dtpFecha.Date, wAno, wMes, wDia );

   wAno:=seAno.Value;
   wMes:=seMes.Value;

   xMesAct := strzero( inttostr( wMes ),2 );

   if xMesAct='01' then
      xMesAnt:='00'
   else
      xMesAnt:=strzero(inttostr(wMes-1),2);

   xAnoAct := inttostr(wAno);
   screen.Cursor:=CrHourglass;

   if RbTodos.Checked=True then
   begin
       xfiltro:='';
   end;
   if RbFiltrar1.Checked=True then
   begin
       xfiltro:='';
       if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
         xfiltro:=' WHERE  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar1.caption+' '+edtmonto.text;
       if (SRV_D = 'ORACLE') then
         xfiltro:=' AND  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar1.caption+' '+edtmonto.text;
   end;
   if RbFiltrar2.Checked=True then
   begin
       xfiltro:='';
       if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
         xfiltro:=' WHERE  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar2.caption+' '+edtmonto.text;
       if (SRV_D = 'ORACLE') then
         xfiltro:=' AND  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar2.caption+' '+edtmonto.text;

   end;
   if RbFiltrar3.Checked=True then
   begin
       xfiltro:='';
       if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
         xfiltro:=' WHERE  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar3.caption+' '+edtmonto.text;
       if (SRV_D = 'ORACLE') then
         xfiltro:=' AND  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar3.caption+' '+edtmonto.text;

   end;
   if RbFiltrar4.Checked=True then
   begin
       xfiltro:='';
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
         xfiltro:=' WHERE  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar4.caption+' '+edtmonto.text;
      if (SRV_D = 'ORACLE') then
         xfiltro:=' AND  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar4.caption+' '+edtmonto.text;

   end;
   if RbFiltrar5.Checked=True then
   begin
       xfiltro:='';
       if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
         xfiltro:=' WHERE  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar5.caption+' '+edtmonto.text;
       if (SRV_D = 'ORACLE') then
         xfiltro:=' AND  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar5.caption+' '+edtmonto.text;

   end;
   if RbFiltrar6.Checked=True then
   begin
       xfiltro:='';
       if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
         xfiltro:=' WHERE  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar6.caption+' '+edtmonto.text;
       if (SRV_D = 'ORACLE') then
         xfiltro:=' AND  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar6.caption+' '+edtmonto.text;

   end;


   if length(xfiltro)>0 then
   begin
     if length(edtmonto.text)=0 then
     begin
       Showmessage('Debe ingresar un monto de Referencia');
       edtmonto.setfocus;
       Exit;
     end;
   end;



   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      xSQL:='select A.CLAUXID, S.CLAUXDES, '
           +'A.PROV, A.PROVDES, A.PROVDIR, A.PROVCZIP, D.ZIPDES, A.PROVTELF, '
           +'A.PROVFAX, A.PROVEMAI, A.PROVDNI, A.PROVRUC, '
           +'J.SALDSME'+XMESANT+' SALDSANTME, J.DEBESME'+XMESACT+' CARGOSME, J.HABESME'+XMESACT+' ABONOSME, J.SALDSME'+XMESACT+' SALDSACTME,'
           +'J.SALDSMN'+XMESANT+' SALDSANTMN, J.DEBESMN'+XMESACT+' CARGOSMN, J.HABESMN'+XMESACT+' ABONOSMN, J.SALDSMN'+XMESACT+' SALDSACTMN, '
           +'J.SALDTME'+XMESANT+' SALDTANTME, J.DEBETME'+XMESACT+' CARGOTME, J.HABETME'+XMESACT+' ABONOTME, J.SALDTME'+XMESACT+' SALDTACTME,'
           +'J.SALDTMN'+XMESANT+' SALDTANTMN, J.DEBETMN'+XMESACT+' CARGOTMN, J.HABETMN'+XMESACT+' ABONOTMN, J.SALDTMN'+XMESACT+' SALDTACTMN '
           +' from TGE201 A '
           +' LEFT JOIN TGE122 D on (D.ZIPID=A.PROVCZIP) '
           +' LEFT JOIN TGE102 S on (S.CLAUXID=A.CLAUXID) '
           +' LEFT JOIN TGE401 J on ( J.CIAID='''+dblcCia.Text+''' and J.ANO='+quotedstr(XANOACT)+' and '
           +                         'J.CLAUXID=A.CLAUXID and J.AUXID=A.PROV )'+xfiltro ;
   end;

   if (SRV_D = 'ORACLE') then
   begin
      xSQL:='select A.CLAUXID, S.CLAUXDES, '
           +'A.PROV, A.PROVDES, A.PROVDIR, A.PROVCZIP, D.ZIPDES, A.PROVTELF, '
           +'A.PROVFAX, A.PROVEMAI, A.PROVDNI, A.PROVRUC, '
           +'J.SALDSME'+XMESANT+' SALDSANTME, J.DEBESME'+XMESACT+' CARGOSME, J.HABESME'+XMESACT+' ABONOSME, J.SALDSME'+XMESACT+' SALDSACTME,'
           +'J.SALDSMN'+XMESANT+' SALDSANTMN, J.DEBESMN'+XMESACT+' CARGOSMN, J.HABESMN'+XMESACT+' ABONOSMN, J.SALDSMN'+XMESACT+' SALDSACTMN, '
           +'J.SALDTME'+XMESANT+' SALDTANTME, J.DEBETME'+XMESACT+' CARGOTME, J.HABETME'+XMESACT+' ABONOTME, J.SALDTME'+XMESACT+' SALDTACTME,'
           +'J.SALDTMN'+XMESANT+' SALDTANTMN, J.DEBETMN'+XMESACT+' CARGOTMN, J.HABETMN'+XMESACT+' ABONOTMN, J.SALDTMN'+XMESACT+' SALDTACTMN '
           +' from TGE201 A, TGE122 D, TGE102 S, TGE401 J '
           +' Where D.ZIPID(+)=A.PROVCZIP  and S.CLAUXID(+)=A.CLAUXID  '
           +' and J.CIAID='''+dblcCia.Text+''' and J.ANO='+quotedstr(XANOACT)+' and '
           +                         'J.CLAUXID=A.CLAUXID and J.AUXID=A.PROV '+xfiltro ;

   end;

   FPrincipal.GCtaCte.UsuarioSQL.Clear;
   FPrincipal.GCtaCte.UsuarioSQL.Add(xSQL);
   FPrincipal.GCtaCte.NewQuery;
end;

procedure TFToolCtaCte.BitBtn1Click(Sender: TObject);
var
   xSQL, xMesAct, xMesAnt, xAnoAct : String;
   wAno, wMes, wDia : word;
begin

   if dblcCia.text='' then begin
      ShowMessage('Falta Compañía');
      dblcCia.Text;
      Exit;
   end;


// apertura Tabla de Tipos de Documento
   xSQL := 'select * from TGE110 where DOCMOD=''CXP'' ';
   DMCXP.cdsTDoc.Close;
   DMCXP.cdsTDoc.IndexFieldNames:='DOCID';
   DMCXP.cdsTDoc.Filter:='';
   DMCXP.cdsTDoc.DataRequest(xSQL);
   DMCXP.cdsTDoc.Open;

//   Decodedate( dtpFecha.Date, wAno, wMes, wDia );

   wAno:=seAno.Value;
   wMes:=seMes.Value;

   xMesAct := strzero( inttostr( wMes ),2 );

   if xMesAct='01' then
      xMesAnt:='00'
   else
      xMesAnt:=strzero(inttostr(wMes-1),2);

   xAnoAct := inttostr(wAno);

   if RbTodos.Checked=True then
   begin
       xfiltro:='';
   end;
   if RbFiltrar1.Checked=True then
   begin
       xfiltro:='';
       xfiltro:=' WHERE  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar1.caption+' '+edtmonto.text;
   end;
   if RbFiltrar2.Checked=True then
   begin
       xfiltro:='';
       xfiltro:=' WHERE  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar2.caption+' '+edtmonto.text;
   end;
   if RbFiltrar3.Checked=True then
   begin
       xfiltro:='';
       xfiltro:=' WHERE  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar3.caption+' '+edtmonto.text;
   end;
   if RbFiltrar4.Checked=True then
   begin
       xfiltro:='';
       xfiltro:=' WHERE  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar4.caption+' '+edtmonto.text;
   end;
   if RbFiltrar5.Checked=True then
   begin
       xfiltro:='';
       xfiltro:=' WHERE  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar5.caption+' '+edtmonto.text;
   end;
   if RbFiltrar6.Checked=True then
   begin
       xfiltro:='';
       xfiltro:=' WHERE  '+DMCXP.wReplacCeros+'(J.SALDSMN'+XMESACT+',0)'+RbFiltrar6.caption+' '+edtmonto.text;
   end;



   if length(xfiltro)>0 then
   begin
     if length(edtmonto.text)=0 then
     begin
       Showmessage('Debe ingresar un monto de Referencia');
       edtmonto.setfocus;
       Exit;
     end;
   end;


   screen.Cursor:=CrHourglass;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
      xSQL:='select A.CLAUXID, S.CLAUXDES, '
           +'A.PROV, A.PROVDES, A.PROVDIR, A.PROVCZIP, D.ZIPDES, A.PROVTELF, '
           +'A.PROVFAX, A.PROVEMAI, A.PROVDNI, A.PROVRUC, '
           +'J.SALDSME'+XMESANT+' SALDSANTME, J.DEBESME'+XMESACT+' CARGOSME, J.HABESME'+XMESACT+' ABONOSME, J.SALDSME'+XMESACT+' SALDSACTME,'
           +'J.SALDSMN'+XMESANT+' SALDSANTMN, J.DEBESMN'+XMESACT+' CARGOSMN, J.HABESMN'+XMESACT+' ABONOSMN, J.SALDSMN'+XMESACT+' SALDSACTMN, '
           +'J.SALDTME'+XMESANT+' SALDTANTME, J.DEBETME'+XMESACT+' CARGOTME, J.HABETME'+XMESACT+' ABONOTME, J.SALDTME'+XMESACT+' SALDTACTME,'
           +'J.SALDTMN'+XMESANT+' SALDTANTMN, J.DEBETMN'+XMESACT+' CARGOTMN, J.HABETMN'+XMESACT+' ABONOTMN, J.SALDTMN'+XMESACT+' SALDTACTMN '
           +' from TGE201 A '
           +' LEFT JOIN TGE122 D on (D.ZIPID=A.PROVCZIP) '
           +' LEFT JOIN TGE102 S on (S.CLAUXID=A.CLAUXID) '
           +' LEFT JOIN TGE401 J on ( J.CIAID='''+dblcCia.Text+''' and J.ANO='+quotedstr(XANOACT)+' and '
           +                         'J.CLAUXID=A.CLAUXID and J.AUXID=A.PROV )'+xfiltro ;
   end;

   if (SRV_D = 'ORACLE') then
   begin
      xSQL:='select A.CLAUXID, S.CLAUXDES, '
           +'A.PROV, A.PROVDES, A.PROVDIR, A.PROVCZIP, D.ZIPDES, A.PROVTELF, '
            +'A.PROVFAX, A.PROVEMAI, A.PROVDNI, A.PROVRUC, '
           +'J.SALDSME'+XMESANT+' SALDSANTME, J.DEBESME'+XMESACT+' CARGOSME, J.HABESME'+XMESACT+' ABONOSME, J.SALDSME'+XMESACT+' SALDSACTME,'
           +'J.SALDSMN'+XMESANT+' SALDSANTMN, J.DEBESMN'+XMESACT+' CARGOSMN, J.HABESMN'+XMESACT+' ABONOSMN, J.SALDSMN'+XMESACT+' SALDSACTMN, '
           +'J.SALDTME'+XMESANT+' SALDTANTME, J.DEBETME'+XMESACT+' CARGOTME, J.HABETME'+XMESACT+' ABONOTME, J.SALDTME'+XMESACT+' SALDTACTME,'
           +'J.SALDTMN'+XMESANT+' SALDTANTMN, J.DEBETMN'+XMESACT+' CARGOTMN, J.HABETMN'+XMESACT+' ABONOTMN, J.SALDTMN'+XMESACT+' SALDTACTMN '
           +' from TGE201 A, TGE122 D, TGE102 S, TGE401 J '
           +' Where D.ZIPID(+)=A.PROVCZIP  and S.CLAUXID(+)=A.CLAUXID  '
           +' and J.CIAID='''+dblcCia.Text+''' and J.ANO='+quotedstr(XANOACT)+' and '
           +                         'J.CLAUXID=A.CLAUXID and J.AUXID=A.PROV '+xfiltro;

   end;

   FPrincipal.GCtaCte.UsuarioSQL.Clear;
   FPrincipal.GCtaCte.UsuarioSQL.Add(xSQL);
   FPrincipal.GCtaCte.NewQuery;
   DMCXP.cdsReporte.Close;
   DMCXP.cdsReporte.DataRequest(XSQL);
   DMCXP.cdsReporte.Open;


   if DMCXP.cdsReporte.RecordCount>0 then
   begin
      ppdbCtaCteProv.DataSource :=DMCXP.dsReporte;

      ppRCtaCteProv.TEMPLATE.FileName:=ExtractFilePath( application.ExeName )+wRutaRpt+'\CtaCteProv.rtm';
      ppRCtaCteProv.template.LoadFromFile ;
      pplblciades.caption:=dbeCIA.text;
      ppRCtaCteProv.Print;
      screen.Cursor:=CrDefault;
   end;
   if DMCXP.cdsReporte.RecordCount=0 then
   begin
    Showmessage('No Existen Registros para la Consulta');
    screen.Cursor:=CrDefault;
    Exit;
   end;


end;


procedure TFToolCtaCte.RbFiltrar1Click(Sender: TObject);
begin
  edtmonto.enabled:=True;
  edtmonto.text:='0';
  edtmonto.setfocus;
end;

procedure TFToolCtaCte.RbTodosClick(Sender: TObject);
begin
  edtmonto.enabled:=False;
end;

procedure TFToolCtaCte.RbFiltrar2Click(Sender: TObject);
begin
  edtmonto.enabled:=True;
  edtmonto.text:='0';
  edtmonto.setfocus;

end;

procedure TFToolCtaCte.RbFiltrar3Click(Sender: TObject);
begin
  edtmonto.enabled:=True;
  edtmonto.text:='0';
  edtmonto.setfocus;

end;

procedure TFToolCtaCte.RbFiltrar4Click(Sender: TObject);
begin
  edtmonto.enabled:=True;
  edtmonto.text:='0';
  edtmonto.setfocus;

end;

procedure TFToolCtaCte.RbFiltrar5Click(Sender: TObject);
begin
  edtmonto.enabled:=True;
  edtmonto.text:='0';
  edtmonto.setfocus;

end;

procedure TFToolCtaCte.RbFiltrar6Click(Sender: TObject);
begin
  edtmonto.enabled:=True;
  edtmonto.text:='0';
  edtmonto.setfocus;

end;

procedure TFToolCtaCte.Timer1Timer(Sender: TObject);
begin
   FVariables.w_NombreForma := 'FToolCtaCte';
   if (DMCXP.wAdmin='G') or (DMCXP.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMCXP.AccesosUsuariosR( DMCXP.wModulo,DMCXP.wUsuario,'2',FToolCtaCte);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

end.
