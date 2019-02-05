unit CxP700;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, Buttons, Mask, wwdbedit, wwdblook, ExtCtrls,
  wwdbdatetimepicker, oaVariables, db;

type
  TFToolCtaCteProv = class(TForm)
    pnlTool: TPanel;
    Label11: TLabel;
    dblcCia: TwwDBLookupCombo;
    dbeCIA: TwwDBEdit;
    bbtnEjecuta: TBitBtn;
    BitBtn1: TBitBtn;
    gbPER: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dtpINI: TwwDBDateTimePicker;
    chbFecha: TCheckBox;
    dtpFIN: TwwDBDateTimePicker;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnEjecutaClick(Sender: TObject);
    procedure chbFechaClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
     xfiltro : String;
  	 Ano, Mes : Integer;
  end;

var
  FToolCtaCteProv: TFToolCtaCteProv;
  xAccesoBotones : Boolean;
implementation

uses CxPDM, CxP001, CXP420;

{$R *.DFM}

procedure TFToolCtaCteProv.dblcCiaExit(Sender: TObject);
begin
	dbeCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CIAID',dblcCia.Text);

	if length(dbeCia.Text)=0 then
	begin
		ShowMessage('Falta Código de Compañía');
		dblcCia.SetFocus;
	end;
end;

procedure TFToolCtaCteProv.bbtnEjecutaClick(Sender: TObject);
var
  xSQL, xMesAct, xMesAnt, xAnoAct : String;
begin
	if dblcCia.text = '' then
  begin
  	ShowMessage('Falta Compañía');
    dblcCia.Text;
    Exit;
  end;

  //apertura Tabla de Tipos de Documento
  screen.Cursor:=CrHourglass;
	xSQL := 'SELECT * FROM TGE110 WHERE DOCMOD=''CXP'' ';
  DMCXP.cdsTDoc.Close;
  DMCXP.cdsTDoc.IndexFieldNames:='DOCID';
  DMCXP.cdsTDoc.Filter:='';
  DMCXP.cdsTDoc.DataRequest(xSQL);
  DMCXP.cdsTDoc.Open;

  xfiltro:='';
  {if RbTodos.Checked = True then
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

  if length(xfiltro) > 0 then
  begin
    if length(edtmonto.text)=0 then
    begin
      Showmessage('Debe ingresar un monto de Referencia');
      edtmonto.setfocus;
      Exit;
    end;
  end;}

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     xSQL:='SELECT A.CLAUXID, S.CLAUXDES, '+
          'A.PROV, A.PROVDES, A.PROVDIR, A.PROVCZIP, D.ZIPDES, A.PROVTELF, '+
          'A.PROVFAX, A.PROVEMAI, A.PROVDNI, A.PROVRUC, A.PROVUFMOV '+
          'FROM TGE201 A '+
          'LEFT JOIN TGE122 D ON (D.ZIPID=A.PROVCZIP) '+
          'LEFT JOIN TGE102 S ON (S.CLAUXID=A.CLAUXID)';
    if chbFecha.Checked = False then
  	xSQL:= xSQL +' WHERE (A.PROVUFMOV>='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpINI.Date)+''')) '+
                   ' AND (A.PROVUFMOV<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) ';

  end;

  if (SRV_D = 'ORACLE') then
  begin
     xSQL:='SELECT A.CLAUXID, S.CLAUXDES, '+
          'A.PROV, A.PROVDES, A.PROVDIR, A.PROVCZIP, D.ZIPDES, A.PROVTELF, '+
          'A.PROVFAX, A.PROVEMAI, A.PROVDNI, A.PROVRUC, A.PROVUFMOV '+
          'FROM TGE201 A, TGE122 D, TGE102 S '+
          'WHERE D.ZIPID(+)=A.PROVCZIP AND S.CLAUXID(+)=A.CLAUXID';
    if chbFecha.Checked = False then
  	xSQL:= xSQL +' AND (A.PROVUFMOV>='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpINI.Date)+''')) '+
                 ' AND (A.PROVUFMOV<='+DMCXP.wRepFuncDate+''''+FormatDateTime(DMCXP.wFormatFecha,dtpFIN.Date)+''')) ';
  end;

  xSQL:='Select * from ( '+xSQL+' ) SOLVISTA ';

  FPrincipal.GCtaCte.UsuarioSQL.Clear;
  FPrincipal.GCtaCte.UsuarioSQL.Add(xSQL);
  FPrincipal.GCtaCte.NewQuery;
end;

function DaysOfMonth ( iMonth, iYear : Word ) : Word;
var
  DaysxMes : Array [1..12] of Integer; // = (31,28,31,30,31,30,31,31,30,31,30,31);
begin
//const
//  DaysxMes := (31,28,31,30,31,30,31,31,30,31,30,31);
  DaysxMes[1]:= 31;
  DaysxMes[2]:= 28;
  DaysxMes[3]:= 31;
  DaysxMes[4]:= 30;
  DaysxMes[5]:= 31;
  DaysxMes[6]:= 30;
  DaysxMes[7]:= 31;
  DaysxMes[8]:= 31;
  DaysxMes[9]:= 30;
  DaysxMes[10]:= 31;
  DaysxMes[11]:= 30;
  DaysxMes[12]:= 31;
  if IsLeapYear(iYear) then DaysxMes[2]:= 29;
  result := DaysxMes[iMonth];
end;

procedure TFToolCtaCteProv.chbFechaClick(Sender: TObject);
var
	i : word;
  FDate : TDateTime;
begin
  i:= 1;
  FDate := EnCodeDate(Ano,Mes,i);

  if chbFecha.checked then
  begin
  	dtpINI.Text:='';
    dtpFIN.Text:='';
  end
  else
  begin
  	dtpINI.Date := FDate;
    dtpFIN.Date := Date;
    //dtpFIN.Date := FDate + (DaysOfMonth (Mes,Ano)-1);
  end;
end;

procedure TFToolCtaCteProv.Timer2Timer(Sender: TObject);
begin
   FVariables.w_NombreForma := 'FToolCtaCteProv';
   if (DMCXP.wAdmin='G') or (DMCXP.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMCXP.AccesosUsuariosR( DMCXP.wModulo,DMCXP.wUsuario,'2',FToolCtaCteProv);
      xAccesoBotones := True;
   end;

end;

procedure TFToolCtaCteProv.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.

