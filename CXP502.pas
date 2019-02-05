unit CxP502;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, Mask, wwdbedit, StdCtrls, wwdblook, ExtCtrls, Buttons, db;

type
  TFCierreOpe = class(TForm)
    bbtnGraba: TBitBtn;
    bbtnSalir: TBitBtn;
    Label1: TLabel;
    Panel1: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    pnlAct: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbeNoCierreU: TwwDBEdit;
    dtpFIniU: TwwDBDateTimePicker;
    dtpFCierreU: TwwDBDateTimePicker;
    dtpFRegU: TwwDBDateTimePicker;
    dtpHRegU: TwwDBDateTimePicker;
    dbeUserU: TwwDBEdit;
    pnlReg3: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dbeNoCierre: TwwDBEdit;
    dtpFIni: TwwDBDateTimePicker;
    dtpFCierre: TwwDBDateTimePicker;
    dtpFReg: TwwDBDateTimePicker;
    dtpHReg: TwwDBDateTimePicker;
    dbeUser: TwwDBEdit;
    sbAjustaPerAct: TSpeedButton;
    bbtnNuevo: TBitBtn;
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnSalirClick(Sender: TObject);
    procedure dtpFCierreExit(Sender: TObject);
    procedure dbeNoCierreExit(Sender: TObject);
    procedure bbtnGrabaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dtpFIniExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbAjustaPerActClick(Sender: TObject);
    procedure dtpFCierreUExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnNuevoClick(Sender: TObject);
    procedure dblcCiaEnter(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    { Private declarations }
     xFecCieAct : TDateTime;
  public
    { Public declarations }
  end;

  procedure OPCierreOperativo; stdcall;

exports
  OPCierreOperativo;

var
  FCierreOpe: TFCierreOpe;
  xAjustaPerAct : boolean;

implementation

uses CxPDM;

{$R *.DFM}

procedure OPCierreOperativo;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   try
     FCierreOpe:=TFCierreOpe.Create( Application );
     FCierreOpe. ShowModal;
   finally
     FCierreOpe. Free;
   end;
end;

procedure TFCierreOpe.dblcCiaExit(Sender: TObject);
var
	xWhere : String;
begin
   edtCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CIAID',dblcCia.Text);
   if length(edtCia.Text)=0 then
   begin
  	  dblcCia.SetFocus;
      Raise Exception.Create('Falta Código de Compañía');
   end;

   pnlReg3.Visible := False;
   {pnlReg3.Visible := True;
   
   xWhere   := 'CIAID='+''''+dblcCia.Text+'''';
   dtpFCierreU.Date  := DMCXP.BuscaUltFecha('dspUltCxP','CXP202','FCIERRE',xWhere);
   xWhere:=xWhere
         +' and FCIERRE='+DMCXP.wRepFuncDate+''''+ FORMATDATETIME(DMCXP.wFormatFecha,dtpFCierreU.Date)+''''+')';
   dbeNoCierreU.Text := BuscaQry('PrvTGE','CXP202','*',xWhere,'NOCIERRE');
   }
   xWhere:='Select * from CXP202 where CIAID='+''''+dblcCia.Text+''' order by NOCIERRE desc';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xWhere );
   DMCXP.cdsQry.Open;

   dbeNoCierreU.Text := DMCXP.cdsQry.FieldByName('NOCIERRE').AsString;
   dtpFCierreU.Date  := DMCXP.cdsQry.FieldByName('FCIERRE').AsDateTime;

   if dbeNoCierreU.Text='' then
      dbeNoCierreU.Text:='0';

   sbAjustaPerAct.Enabled := True;

// inicializa primer panel con los datos del Periodo Actual
   dtpFIniU.Enabled := False;
   dbeUserU.Enabled := False;
   dbeNoCierreU.Enabled := False;
   dtpFCierreU.Enabled := False;
   dtpFRegU.Enabled := False;
   dtpHRegU.Enabled := False;
   pnlAct.Visible   :=True;

   dtpFIniU.Date     := DMCXP.cdsQry.FieldByName('FINICIO').AsDateTime;
   xFecCieAct        := DMCXP.cdsQry.FieldByName('FCIERRE').AsDateTime;
   dbeUserU.Text     := DMCXP.cdsQry.FieldByName('USUARIO').AsString;
   dtpFRegU.Date     := DMCXP.cdsQry.FieldByName('FREG'   ).AsDateTime;
   dtpHRegU.Time     := DMCXP.cdsQry.FieldByName('HREG'   ).AsDateTime;
   bbtnNuevo.Visible:=True;
   {
   DMCXP.cdsCierre.Insert;
   DMCXP.cdsCierre.FieldByName('CIAID').AsString    := dblcCia.Text;
   DMCXP.cdsCierre.FieldByName('NOCIERRE').AsString := StrZero(IntToStr(StrtoInt(dbeNoCierreU.Text)+1),5);
   DMCXP.cdsCierre.FieldByName('FINICIO').AsDateTime:= dtpFCierreU.Date+1;
   DMCXP.cdsCierre.FieldByName('FCIERRE').AsDateTime:= dtpFCierreU.Date+1;
   DMCXP.cdsCierre.FieldByName('USUARIO').AsString  := DMCXP.wUsuario;
   DMCXP.cdsCierre.FieldByName('FREG').AsDateTime   := Date;
   DMCXP.cdsCierre.FieldByName('HREG').AsdateTime   := Date+Time;
   DMCXP.cdsCierre.Post;
   pnlReg3.Enabled := True;
   pnlReg3.SetFocus;
   xAjustaPerAct := False;}
end;

procedure TFCierreOpe.bbtnSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFCierreOpe.dtpFCierreExit(Sender: TObject);
begin
   If DMCXP.cdsCierre.FieldByName('FCIERRE').AsDateTime<DMCXP.cdsCierre.FieldByName('FINICIO').AsDateTime then begin
      Raise Exception.Create( 'Error : Fecha debe Ser Mayor a Fecha de Cierre Anterior' );
   end;
end;

procedure TFCierreOpe.dbeNoCierreExit(Sender: TObject);
begin
   If DMCXP.cdsCierre.FieldByName('NOCIERRE').AsString<=dbeNoCierreU.Text then begin
      Raise Exception.Create( 'Error : No.Cierre debe Ser Mayor a No.Cierre de Cierre Anterior' );
   end;
end;

procedure TFCierreOpe.bbtnGrabaClick(Sender: TObject);
var
   xSQL : String;
begin

   if MessageDlg( 'Grabar Periodo Operativo' + chr(13)+
                '        ¿Esta Seguro?   ',mtConfirmation,[mbYes, mbNo],0)=mrNo
      then exit;

   if xAjustaPerAct then // si se está ajustando la fecha final del periodo actual
   begin
      DMCXP.cdsCierre.Edit;
      DMCXP.cdsCierre.FieldByName('FCIERRE').AsDateTime:= dtpFCierreU.Date;
      DMCXP.cdsCierre.FieldByName('FREG'   ).AsDateTime:= dtpFRegU.Date;
      DMCXP.cdsCierre.FieldByName('HREG'   ).AsDateTime:= dtpHRegU.Time;
      DMCXP.AplicaDatos( DMCXP.cdsCierre, '' );
      dblcCiaEnter(sender);
      dblcCiaExit(sender);
   end
   else
   begin
      DMCXP.AplicaDatos( DMCXP.cdsCierre, '' );
      pnlReg3.Enabled := False;
      dblcCiaEnter(sender);
      dblcCiaExit(sender);
      bbtnNuevo.Visible:=False;
   end;
   bbtnSalir.SetFocus;
   ShowMessage( 'Cierre Operativo Grabado' );
end;

procedure TFCierreOpe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMCXP.cdsCierre.CancelUpdates;
   DMCXP.cdsCierre.Close;
end;

procedure TFCierreOpe.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFCierreOpe.dtpFIniExit(Sender: TObject);
begin
  if ( dtpFIni.Date>=dtpFIniU.date-45 ) then
  else begin
     ShowMessage('Error : Fecha debe estar en Rango Permitido');
     dtpFIni.SetFocus;
     Exit
  end;
end;

procedure TFCierreOpe.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
   
   sbAjustaPerAct.Enabled := False;
   pnlReg3.Enabled := False;
   dblcCia.SetFocus;
end;

procedure TFCierreOpe.sbAjustaPerActClick(Sender: TObject);
var
   xSQL : String;
begin
   DMCXP.cdsCierre.CancelUpdates;

   xSQL := 'select * from CXP202 '
          +'where CIAID='+quotedstr(dblcCia.Text)
          +'  and FCIERRE='+DMCXP.wRepFuncDate+''''+ FORMATDATETIME(DMCXP.wFormatFecha,dtpFCierreU.Date)+''''+')';
   Filtracds( DMCXP.cdsCierre,xSQL);

   pnlReg3.Enabled := False;
   pnlReg3.Visible := False;
   dtpFCierreU.Enabled := True;
   dtpFRegU.Date := DateS;
   dtpHRegU.Time := Time;
   xAjustaPerAct := True;
end;

procedure TFCierreOpe.dtpFCierreUExit(Sender: TObject);
begin
   if dtpFCierreU.Date<dtpFIniU.Date then
   begin
      ShowMessage('Fecha Final no puede ser menor que Fecha Inicial');
      dtpFCierreU.Date := xFecCieAct;
      dtpFCierreU.SetFocus;
      exit;
   end;
end;

procedure TFCierreOpe.FormCreate(Sender: TObject);
begin
   Filtracds( DMCXP.cdsCierre,'SELECT * FROM CXP202 WHERE CIAID=''''' );
end;

procedure TFCierreOpe.bbtnNuevoClick(Sender: TObject);
var
   xWhere : String;
begin
   if MessageDlg( 'Generar Nuevo Periodo Operativo' + chr(13)+
                '        ¿Esta Seguro?   ',mtConfirmation,[mbYes, mbNo],0)=mrNo
      then exit;

   xWhere:='Select * from CXP202 where CIAID='+''''+dblcCia.Text+''' order by NOCIERRE desc';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xWhere );
   DMCXP.cdsQry.Open;

   DMCXP.cdsCierre.Insert;
   DMCXP.cdsCierre.FieldByName('CIAID').AsString    := dblcCia.Text;
   DMCXP.cdsCierre.FieldByName('NOCIERRE').AsString := StrZero(IntToStr(StrtoInt(dbeNoCierreU.Text)+1),5);
   DMCXP.cdsCierre.FieldByName('FINICIO').AsDateTime:= dtpFCierreU.Date+1;
   DMCXP.cdsCierre.FieldByName('FCIERRE').AsDateTime:= dtpFCierreU.Date+1;
   DMCXP.cdsCierre.FieldByName('USUARIO').AsString  := DMCXP.wUsuario;
   DMCXP.cdsCierre.FieldByName('FREG').AsDateTime   := Date;
   DMCXP.cdsCierre.FieldByName('HREG').AsdateTime   := Date+Time;
   DMCXP.cdsCierre.Post;
   bbtnNuevo.Visible:=False;
   pnlReg3.Enabled  :=True;
   xAjustaPerAct    :=False;
   pnlReg3.Visible  :=True;
   bbtnGraba.Visible:=True;
   pnlReg3.SetFocus;
end;

procedure TFCierreOpe.dblcCiaEnter(Sender: TObject);
begin
   pnlAct.Visible   :=False;
   bbtnGraba.Visible:=False;
   bbtnNuevo.Visible:=False;
   pnlReg3.Visible  :=False;
end;

procedure TFCierreOpe.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.
