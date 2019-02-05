unit CXP242;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, wwdbedit, Buttons, ExtCtrls, wwdbdatetimepicker,
  wwdblook, Wwdbdlg, wwclearbuttongroup, wwradiogroup, oaVariables, DB;

type
  TFProveNotiSunat = class(TForm)
    bbtnOK: TBitBtn;
    Z2bbtnCancel: TBitBtn;
    bbtnAnula: TBitBtn;
    pnlCab2: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbeUsuReg: TwwDBEdit;
    dbeUsuDes: TwwDBEdit;
    dbeFecReg: TwwDBDateTimePicker;
    dbeFecDes: TwwDBDateTimePicker;
    pnlCab1: TPanel;
    dbeNumero: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbeSaldo: TwwDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    pnlEstado: TPanel;
    rgEstado: TwwRadioGroup;
    pnlCab3: TPanel;
    lblProv: TLabel;
    dblcdProv: TwwDBLookupComboDlg;
    lblProvNom: TLabel;
    dbeNombre: TwwDBEdit;
    Bevel2: TBevel;
    pnlLev: TPanel;
    Label14: TLabel;
    dbeResolucion3: TwwDBEdit;
    dtpFecEmi3: TwwDBDateTimePicker;
    dbeFecRec3: TwwDBDateTimePicker;
    pnlp2: TPanel;
    Label13: TLabel;
    dbeResolucion2: TwwDBEdit;
    dtpFecEmi2: TwwDBDateTimePicker;
    dbeFecRec2: TwwDBDateTimePicker;
    dbeDeuda2: TwwDBEdit;
    pnlp1: TPanel;
    pnlDeuda: TPanel;
    Label12: TLabel;
    dbeResolucion1: TwwDBEdit;
    dtpFecEmi1: TwwDBDateTimePicker;
    dbeFecRec1: TwwDBDateTimePicker;
    dbeDeuda1: TwwDBEdit;
    Label15: TLabel;
    dbeResolucion: TwwDBEdit;
    dtpFecEmi: TwwDBDateTimePicker;
    dbeFecRec: TwwDBDateTimePicker;
    dbeDeuda: TwwDBEdit;
    cb1: TCheckBox;
    cb2: TCheckBox;
    cb3: TCheckBox;
    cb4: TCheckBox;
    procedure bbtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnAnulaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Z2bbtnCancelClick(Sender: TObject);
    procedure dblcdProvExit(Sender: TObject);
    procedure cb1Click(Sender: TObject);
    procedure cb2Click(Sender: TObject);
    procedure cb3Click(Sender: TObject);
    procedure cb4Click(Sender: TObject);
  private
    { Private declarations }
    procedure CargaDataSource;

  public
    { Public declarations }
  end;

var
  FProveNotiSunat: TFProveNotiSunat;

implementation

{$R *.dfm}

uses CxPDM, CxP001;


procedure TFProveNotiSunat.CargaDataSource;
begin
   dbeNumero.DataSource     := DMCXP.dsPagare;
   dblcdProv.DataSource     := DMCXP.dsPagare;
   dblcdProv.LookupTable    := DMCXP.cdsProv;
   dbeNombre.DataSource     := DMCXP.dsPagare;
   dbeResolucion.DataSource := DMCXP.dsPagare;
   dtpFecEmi.DataSource     := DMCXP.dsPagare;
   dbeFecRec.DataSource     := DMCXP.dsPagare;
   dbeDeuda.DataSource      := DMCXP.dsPagare;

   dbeResolucion1.DataSource := DMCXP.dsPagare;
   dtpFecEmi1.DataSource     := DMCXP.dsPagare;
   dbeFecRec1.DataSource     := DMCXP.dsPagare;
   dbeDeuda1.DataSource      := DMCXP.dsPagare;

   dbeResolucion2.DataSource := DMCXP.dsPagare;
   dtpFecEmi2.DataSource     := DMCXP.dsPagare;
   dbeFecRec2.DataSource     := DMCXP.dsPagare;
   dbeDeuda2.DataSource      := DMCXP.dsPagare;

   dbeResolucion3.DataSource := DMCXP.dsPagare;
   dtpFecEmi3.DataSource     := DMCXP.dsPagare;
   dbeFecRec3.DataSource     := DMCXP.dsPagare;

   dbeSaldo.DataSource      := DMCXP.dsPagare;
   dbeUsuReg.DataSource     := DMCXP.dsPagare;
   dbeFecReg.DataSource     := DMCXP.dsPagare;
   dbeUsuDes.DataSource     := DMCXP.dsPagare;
   dbeFecDes.DataSource     := DMCXP.dsPagare;
   rgEstado.DataSource      := DMCXP.dsPagare;
end;

procedure TFProveNotiSunat.bbtnOKClick(Sender: TObject);
var
  xWhere, sSQL : String;
begin
  if DMCXP.cdsPagare.FieldByName('PROVRUC').AsString='' then
  begin
     ShowMessage('Debe Ingresar el RUC');
     Exit;
  end;

  if Length(trim(DMCXP.cdsPagare.FieldByName('PROVRUC').AsString))<>11 then
  begin
     ShowMessage('El RUC debe tener 11 digitos');
     Exit;
  end;

  if DMCXP.cdsPagare.FieldByName('PROVDES').AsString='' then
  begin
     ShowMessage('Debe Ingresar el Nombre del Proveedor');
     Exit;
  end;

  if DMCXP.cdsPagare.FieldByName('ESTADO').AsString='D' then
  begin
     ShowMessage('Registro Levantado no se puede grabar... Verificar');
     Exit;
  end;


  if MessageDlg('¿ Grabar Registro?',mtConfirmation,[mbYes, mbNo], 0)=mrNo then Exit;

  DMCXP.cdsPagare.Edit;

  if DMCXP.cdsPagare.FieldByName('NUMERO').AsString='' then
  begin
     sSQL:='Select NVL(MAX(NUMERO),''00000'') NUMERO from CXP_PRO_NOT_SUN';
     DMCXP.cdsQry.Close;
     DMCXP.cdsQry.DataRequest(sSQL);
     DMCXP.cdsQry.Open;
     DMCXP.cdsPagare.FieldByName('NUMERO').AsString:=StrZero(IntToStr(DMCXP.cdsQry.FieldByName('NUMERO').AsInteger+1),5);
     DMCXP.cdsPagare.FieldByName('ESTADO').AsString:='A'
  end;

  DMCXP.cdsPagare.FieldByName('FECREG').AsDateTime := Date+Time;
  DMCXP.cdsPagare.FieldByName('USUARIO').AsString  := DMCXP.wUsuario;
  cdsPost(DMCXP.cdsPagare);
  DMCXP.AplicaDatos( DMCXP.cdsPagare, 'Pagare' );

  if DMCXP.wTipoAdicion='xFiltro' then
  begin
     DMCXP.ActualizaFiltro(FPrincipal.GNotiSunat, DMCXP.cdsPagare, DMCXP.wModo );
  end;
  pnlCab3.Enabled:=False;
  DMCXP.wModo:='M';
  ShowMessage(' Registro Grabado ');
end;

procedure TFProveNotiSunat.FormShow(Sender: TObject);
begin
 { Error en Nuevo Sistemas
  (DMCXP.cdsPagare.FieldByName('DEUDA')     as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsPagare.FieldByName('DEUDA')     as TFloatField).EditFormat   :='########0.00';
  (DMCXP.cdsPagare.FieldByName('SALDO')     as TFloatField).DisplayFormat:='###,###,##0.00';
  (DMCXP.cdsPagare.FieldByName('SALDO')     as TFloatField).EditFormat   :='########0.00';
 }
  if DMCXP.wModo = 'A' then
  begin
     pnlCab1.Enabled:=True;
     pnlCab3.Enabled:=True;
     bbtnOK.Enabled :=True;
     bbtnAnula.Enabled:=False;
     DMCXP.cdsPagare.Insert;
     dblcdProv.SetFocus;
  end
  else
  begin
     bbtnOK.Enabled :=False;
     if DMCXP.cdsPagare.FieldByName('ESTADO').AsString='D' then
     begin
        pnlCab1.Enabled:=False;
        bbtnAnula.Enabled:=False;
     end
     else
     begin
        pnlCab3.Enabled  :=False;
        bbtnOK.Enabled :=True;
        bbtnAnula.Enabled:=True;
        DMCXP.cdsPagare.Edit;
        dbeSaldo.SetFocus;
     end;
  end;

end;

procedure TFProveNotiSunat.FormCreate(Sender: TObject);
begin
  CargaDataSource;
end;

procedure TFProveNotiSunat.bbtnAnulaClick(Sender: TObject);
begin
  if MessageDlg('¿ Activar Registro?',mtConfirmation,[mbYes, mbNo], 0)=mrNo then Exit;

  DMCXP.cdsPagare.Edit;
  DMCXP.cdsPagare.FieldByName('ESTADO').AsString:='D';
  DMCXP.cdsPagare.FieldByName('FECCIE').AsDateTime := Date+Time;
  DMCXP.cdsPagare.FieldByName('USUCIER').AsString  := DMCXP.wUsuario;
  cdsPost(DMCXP.cdsPagare);
  DMCXP.AplicaDatos( DMCXP.cdsPagare, 'Pagare' );

  if DMCXP.wTipoAdicion='xFiltro' then
  begin
     DMCXP.ActualizaFiltro(FPrincipal.GNotiSunat, DMCXP.cdsPagare, DMCXP.wModo );
  end;
  pnlCab1.Enabled  :=False;
  bbtnOK.Enabled   :=False;
  bbtnAnula.Enabled:=False;
  ShowMessage(' Registro Desactivado ');
end;

procedure TFProveNotiSunat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FVariables.w_OP_Registro:=False;
  FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;

  Action:=caFree;
end;

procedure TFProveNotiSunat.Z2bbtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFProveNotiSunat.dblcdProvExit(Sender: TObject);
var
  xWhere : String;
begin
  if DMCXP.cdsPagare.FieldByName('PROVDES').AsString='' then
  begin
     xWhere:='PROVRUC='''+dblcdProv.Text+'''';
     DMCXP.cdsPagare.FieldByName('PROVDES').AsString:=
           BuscaQry('dspTGE','TGE201','PROV,PROVRUC,PROVDES',xWhere,'PROVDES');
  end;
end;

procedure TFProveNotiSunat.cb1Click(Sender: TObject);
begin
   if cb1.Checked then
      pnlDeuda.Enabled:=True
   else
      pnlDeuda.Enabled:=False;
end;

procedure TFProveNotiSunat.cb2Click(Sender: TObject);
begin
   if cb2.Checked then
      pnlp1.Enabled:=True
   else
      pnlp1.Enabled:=False;

end;

procedure TFProveNotiSunat.cb3Click(Sender: TObject);
begin
   if cb3.Checked then
      pnlp2.Enabled:=True
   else
      pnlp2.Enabled:=False;
end;

procedure TFProveNotiSunat.cb4Click(Sender: TObject);
begin
   if cb4.Checked then
      pnlLev.Enabled:=True
   else
      pnlLev.Enabled:=False;
end;

end.
