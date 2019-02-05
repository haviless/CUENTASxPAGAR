unit CxP209;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, wwdblook, Mask, wwdbedit, ExtCtrls, Wwdbdlg, DB,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe,
  ppVar, ppCtrls, ppPrnabl, ppBands;

type
  TFPlnCta = class(TForm)
    pnlPrincipal: TPanel;
    pnlDetalle: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dbeDescripcion: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    Panel3: TPanel;
    dblcCia: TwwDBLookupCombo;
    dbeCia: TwwDBEdit;
    dbeCuenta: TwwDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    dbcbME: TDBCheckBox;
    Z2bbtnRegistra: TBitBtn;
    Z2bbtnCanc2: TBitBtn;
    Z2bbtnImprime: TBitBtn;
    dbcbAux: TDBCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    dblcCLAux: TwwDBLookupCombo;
    dbeCLAux: TwwDBEdit;
    DBCheckBox3: TDBCheckBox;
    Label9: TLabel;
    dbcbCcos: TDBCheckBox;
    Label19: TLabel;
    dblcTipCta: TwwDBLookupCombo;
    Label20: TLabel;
    dbeTipCta: TwwDBEdit;
    DBCheckBox5: TDBCheckBox;
    Label21: TLabel;
    Label22: TLabel;
    DBCheckBox6: TDBCheckBox;
    Label23: TLabel;
    DBCheckBox7: TDBCheckBox;
    Label10: TLabel;
    DBCheckBox8: TDBCheckBox;
    Label11: TLabel;
    dbeCtaConsol: TwwDBEdit;
    dblcCtaConsol: TwwDBLookupComboDlg;
    Panel5: TPanel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    dblcdCtaDes: TwwDBLookupComboDlg;
    dbeCtaDes: TwwDBEdit;
    dblcdCtaContra: TwwDBLookupComboDlg;
    dbeCtaContra: TwwDBEdit;
    Label18: TLabel;
    DBCheckBox9: TDBCheckBox;
    pnlReporte: TPanel;
    Label24: TLabel;
    dblcNivel: TwwDBLookupCombo;
    dbeNivel: TwwDBEdit;
    Panel4: TPanel;
    Label25: TLabel;
    dblcdCtaInic: TwwDBLookupComboDlg;
    dbeCtaInic: TwwDBEdit;
    Label26: TLabel;
    dblcdCtaFinal: TwwDBLookupComboDlg;
    dbeCtaFinal: TwwDBEdit;
    Label27: TLabel;
    Z2bbtnRegistra3: TBitBtn;
    Z2bbtnCanc3: TBitBtn;
    Label28: TLabel;
    ppDBPipeline1: TppDBPipeline;
    pprPlanCtas: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    pplblCia: TppLabel;
    ppLabel6: TppLabel;
    ppLine5: TppLine;
    ppLabel2: TppLabel;
    ppLine6: TppLine;
    ppLabel3: TppLabel;
    ppLabel1: TppLabel;
    pplblNivel: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel8: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel9: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    pplblNivel1: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel4: TppLabel;
    pnlFondo: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    DBCheckBox2: TDBCheckBox;
    procedure Z2bbtnCanc2Click(Sender: TObject);
    procedure Z2bbtnRegistraClick(Sender: TObject);
    procedure dblcCiaChange(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcCLAuxChange(Sender: TObject);
    procedure dblcCLAuxExit(Sender: TObject);
    procedure dbcbAuxClick(Sender: TObject);
    procedure dbcbCcosClick(Sender: TObject);
    procedure dblcTipCtaChange(Sender: TObject);
    procedure dblcTipCtaExit(Sender: TObject);
    procedure dblcCtaConsolChange(Sender: TObject);
    procedure dblcCtaConsolExit(Sender: TObject);
    procedure dblcdCtaDesEnter(Sender: TObject);
    procedure dblcdCtaDesChange(Sender: TObject);
    procedure dblcdCtaDesExit(Sender: TObject);
    procedure dblcdCtaContraEnter(Sender: TObject);
    procedure dblcdCtaContraChange(Sender: TObject);
    procedure dblcdCtaContraExit(Sender: TObject);
    procedure dbcbCcosEnter(Sender: TObject);
    procedure dbeCuentaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcCtaConsolEnter(Sender: TObject);
    procedure dblcNivelChange(Sender: TObject);
    procedure dblcdCtaInicChange(Sender: TObject);
    procedure dblcdCtaFinalChange(Sender: TObject);
    procedure Z2bbtnImprimeClick(Sender: TObject);
    procedure Z2bbtnCanc3Click(Sender: TObject);
    procedure dblcNivelExit(Sender: TObject);
    procedure dblcdCtaFinalExit(Sender: TObject);
    procedure Z2bbtnRegistra3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppDBText1Print(Sender: TObject);
    procedure dbcbAuxEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    xAux, xCCos, xAno, wModif : String;
    xNivel1 : String;
  public
    { Public declarations }
  end;

var
  FPlnCta: TFPlnCta;
  xCrea  : Boolean;
  xSalir : Boolean;

implementation
uses CxPDM;

{$R *.DFM}

procedure TFPlnCta.Z2bbtnCanc2Click(Sender: TObject);
begin
    if DMCXP.cdsCuenta.State=dsInsert then DMCXP.cdsCuenta.Delete;
    close
end;

procedure TFPlnCta.Z2bbtnRegistraClick(Sender: TObject);
var
    xNive   : Integer;
    xNivel2,xCuenta1,xSQL : String;
begin
   Screen.Cursor:=crHourGlass;
   if length(dbeTipCta.Text)=0 then
   begin
      ShowMessage('Falta Tipo de Cuenta');
      Screen.Cursor:=crDefault;
      exit;
   end;

   DMCXP.cdsCuenta.fieldbyname('CTANIV').AsString := xNivel1;
   DMCXP.cdsCuenta.fieldbyname('CTA_DET').AsString:= 'S';
   DMCXP.cdsCuenta.fieldbyname('CTAAUT1').AsString:= dblcdCtaDes.Text    ;
   DMCXP.cdsCuenta.fieldbyname('CTAAUT2').AsString:= dblcdCtaContra.Text ;

   DMCXP.cdsCuenta.ApplyUpdates(0);
   xNivel2:=StrZero(inttoStr((strtoInt(xNivel1))-1),2);

   DMCXP.cdsNivel.SetKey;
   DMCXP.cdsNivel.FieldByName('NIVEL').AsString:=xNivel2;
   if DMCXP.cdsNivel.GotoKey then xNive := DMCXP.cdsNivel.FieldByName('DIGITOS').AsInteger;

   xCuenta1:=copy(dbeCuenta.Text,1,xNive);

   xSQL:='select * From TGE202 where CIAID ='+''''+dblcCIA.Text+''''+
       ' order By CUENTAID';
   DMCXP.cdsCuenta2.Close;
   DMCXP.cdsCuenta2.DataRequest(xSQL);
   DMCXP.cdsCuenta2.Open;

   DMCXP.cdsCuenta2.SetKey;
   DMCXP.cdsCuenta2.fieldbyname('CIAID').AsString   :=dblcCia.Text;
   DMCXP.cdsCuenta2.fieldbyname('CUENTAID').AsString:=xCuenta1;
   if DMCXP.cdsCuenta2.GotoKey then
   begin
      DMCXP.cdsCuenta2.Edit;
      DMCXP.cdsCuenta2.fieldbyname('CTA_DET').AsString:='N';
      DMCXP.cdsCuenta2.ApplyUpdates(0);
   end;
   Screen.Cursor:=crDefault;
   ShowMessage('Grabación Exitosa');
end;

procedure TFPlnCta.dblcCiaChange(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'CIAID = '+''''+dblcCia.Text+'''';
   dbeCia.Text:=BuscaQry('dspTGE','TGE101','*',xWhere,'CIADES');
end;

procedure TFPlnCta.dblcCiaExit(Sender: TObject);
begin
   If xCrea then Exit;

   if length(dbeCia.Text)=0 then
   begin
      ShowMessage('Falta Código de Compañía');
      dblcCia.SetFocus;
      exit;
   end;
end;

procedure TFPlnCta.FormActivate(Sender: TObject);
begin
   xCrea := True;

   DMCXP.cdsRCuenta.IndexFieldNames:='CiaId;CuentaId';
   DMCXP.cdsRCCosto.IndexFieldNames:='CiaId;Ano;CuentaId';
   DMCXP.cdsCuenta2.IndexFieldNames:='CiaId;CuentaId';
   DMCXP.cdsNivel.IndexFieldNames:='Nivel';
   if DMCXP.wModo = 'A' then
   begin
     DMCXP.cdsCuenta.Insert;
     dblcdCtaDes.Text:='';
     dblcdCtaContra.Text:='';
     wModif:='N';
     dblcCLAux.Enabled:=True;
     dbeCLAux.Enabled :=False;
     dblcCia.SetFocus;
   end else
   begin
     wModif:='S';

     DMCXP.cdsNivel.First;
     while not DMCXP.cdsNivel.Eof do begin
        xNivel1:=DMCXP.cdsNivel.FieldByName('NIVEL').AsString;
        if length(dbeCuenta.Text)=DMCXP.cdsNivel.FieldByName('DIGITOS').AsInteger then begin
           break;
        end;
        DMCXP.cdsNivel.Next;
     end;

     DMCXP.cdsCuenta.Edit;
     xAux :=DMCXP.cdsCuenta.fieldbyname('CTA_AUX').AsString;
     xCCos:=DMCXP.cdsCuenta.fieldbyname('CTA_CCOS').AsString;

     dblcCiaChange(Self);
     dblcCia.Enabled :=False;
     dbeCuentaExit(Self);
     dbeCuenta.Enabled:=False;
     dblcCtaConsolChange(Self);
     dbeDescripcion.SetFocus;

     if xAux='N' then begin
        dblcCLAux.Enabled:=False;
        dbeCLAux.Enabled:=False;
     end;

     dblcdCtaDes.Text   :=DMCXP.cdsCuenta.fieldbyname('CTAAUT1').AsString;
     dblcdCtaContra.Text:=DMCXP.cdsCuenta.fieldbyname('CTAAUT2').AsString;
   end;
   xCrea := False;
end;

procedure TFPlnCta.dblcCLAuxChange(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'CLAUXID = '+''''+dblcCLAux.Text+'''';
   dbeCLAux.Text:=BuscaQry('dspTGE','TGE102','*',xWhere,'CLAUXDES');
end;

procedure TFPlnCta.dblcCLAuxExit(Sender: TObject);
begin
   If xCrea then Exit;
   
   if length(dbeCLAux.Text)=0 then
   begin
      ShowMessage('Falta Clase de Auxiliar');
      dblcCLAux.SetFocus;
      exit;
   end;
end;

procedure TFPlnCta.dbcbAuxClick(Sender: TObject);
begin
   If xCrea  then Exit;
   if xSalir then Exit;

   DMCXP.cdsRCuenta.SetKey;
   DMCXP.cdsRCuenta.FieldByName('CIAID').AsString   :=dblcCia.Text;
   DMCXP.cdsRCuenta.FieldByName('CUENTAID').AsString:=dbeCuenta.Text;
   if DMCXP.cdsRCuenta.GotoKey then
   begin
      if (DMCXP.cdsRCuenta.FieldByName('SALDMN'+DMCXP.strMes(Date)).AsFloat > 0) or(DMCXP.cdsRCuenta.FieldByName('SALDME'+DMCXP.strMes(Date)).AsFloat > 0) then
      begin
         showMessage('Se Requiere Extornar esta Cuenta porque se Observa Saldos en Auxilares');
         xSalir := True;
         dbcbAux.Checked := not dbcbAux.Checked;
         xSalir := False;
      end;
   end;
   if dbcbAux.Checked then
      dblcClAux.Enabled := True
   else begin
      DMCXP.cdsCuenta.Edit;
      DMCXP.cdsCuenta.fieldbyname('CTACLAUX').AsString:='';
      dblcClAux.Text    := '';
      dblcClAux.Enabled := False;
   end
end;

procedure TFPlnCta.dbcbCcosClick(Sender: TObject);
begin
   if xCcos='S' then
   begin
      DMCXP.cdsRCCosto.SetKey;
      DMCXP.cdsRCCosto.FieldByName('CIAID').AsString   :=dblcCia.Text;
      DMCXP.cdsRCCosto.FieldByName('ANO').AsString     :=xAno;
      DMCXP.cdsRCCosto.FieldByName('CUENTAID').AsString:=dbeCuenta.Text;
      if DMCXP.cdsRCCosto.GotoKey then
      begin
         dbcbCcos.ValueChecked:='S';
      end;
   end;

   if (xCcos='N') then
   begin
      DMCXP.cdsRCuenta.SetKey;
      DMCXP.cdsRCuenta.FieldByName('CIAID').AsString   :=dblcCia.Text;
      DMCXP.cdsRCuenta.FieldByName('CuentaId').AsString:=dbeCuenta.Text;
      if DMCXP.cdsRCuenta.GotoKey then
      begin
         if (DMCXP.cdsRCuenta.FieldByName('SALDMN'+DMCXP.strMes(Date)).AsFloat > 0) or(DMCXP.cdsRCuenta.FieldByName('SALDME'+DMCXP.strMes(Date)).AsFloat > 0) then
         begin
            showMessage('Cuenta ya tiene Saldos a Otro Nivel');
            dbcbCcos.ValueUnChecked:='N';
         end;
      end;
   end;
end;

procedure TFPlnCta.dblcTipCtaChange(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'TIPCTAID = '+''''+dblcTipCta.Text+'''';
   dbeTipCta.Text:=BuscaQry('dspTGE','TGE162','*',xWhere,'TIPCTADES');
end;

procedure TFPlnCta.dblcTipCtaExit(Sender: TObject);
begin
   If xCrea then Exit;
   
   if length(dbeTipCta.Text)=0 then
   begin
      ShowMessage('Falta Tipo de Cuenta');
      dblcTipCta.SetFocus;
      exit;
   end;
end;

procedure TFPlnCta.dblcCtaConsolChange(Sender: TObject);
var
   xWhere : string;
begin
   xWhere :='CIAID='''+dblcCia.Text+''' AND CUENTAID='''+dblcCtaConsol.Text+'''';
   dbeCtaConsol.Text:=BuscaQry('dspTGE','TGE209','*',xWhere,'CTADES');
end;

procedure TFPlnCta.dblcCtaConsolExit(Sender: TObject);
begin
   If xCrea then Exit;
   if Z2bbtnCanc2.Focused Then Exit;

   if length(dblcCtaConsol.Text)>0 then begin
      if length(dbeCtaConsol.Text)>0 then begin
         ShowMessage('Error en Cuenta Consolidada');
         dblcCtaConsol.SetFocus;
         exit;
      end;
   end;
end;

procedure TFPlnCta.dblcdCtaDesEnter(Sender: TObject);
var
    xSQL,xCtaDes,xCtaContra : String;
begin
   if wModif = 'S' then
   begin
      xCtaDes   :=dblcdCtaDes.Text;
      xCtaContra:=dblcdCtaContra.Text;
   end;

   xSQL:='select * From TGE202 where CIAID ='+''''+dblcCIA.Text+''''+
       ' AND CTA_DET ='+''''+'S'+''''; // +' and CTA_DEST='+''''+'S'+'''';
   DMCXP.cdsCuenta2.Close;
   DMCXP.cdsCuenta2.DataRequest(xSQL);
   DMCXP.cdsCuenta2.Open;

   if wModif = 'S' then
   begin
      dblcdCtaDes.Text   :=xCtaDes;
      dblcdCtaDesChange(Self);
      dblcdCtaContra.Text:=xCtaContra;
      dblcdCtaContraChange(Self);
   end;
end;

procedure TFPlnCta.dblcdCtaDesChange(Sender: TObject);
var
   xWhere : string;
begin
   xWhere:='CUENTAID = '+''''+dblcdCtaDes.Text+'''';
   dbeCtaDes.Text:=BuscaQry('dspTGE','TGE202','*',xWhere,'CTADES');
end;

procedure TFPlnCta.dblcdCtaDesExit(Sender: TObject);
begin
{   if length(dbeCtaDes.Text)=0 then
   begin
      ShowMessage('Falta Cuenta de Destino');
      dblcdCtaDes.SetFocus;
      exit;
   end;}
end;

procedure TFPlnCta.dblcdCtaContraEnter(Sender: TObject);
{var
    xSQL : String;}
begin
    {xSQL:='select * From TGE202 where CTA_DET ='+''''+'S'+'''';
    DMCXP.cdsCuenta2.Close;
    DMCXP.cdsCuenta2.DataRequest(xSQL);
    DMCXP.cdsCuenta2.Open;}
end;

procedure TFPlnCta.dblcdCtaContraChange(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'CUENTAID = '+''''+dblcdCtaContra.Text+'''';
   dbeCtaContra.Text:=BuscaQry('dspTGE','TGE202','*',xWhere,'CTADES');
end;

procedure TFPlnCta.dblcdCtaContraExit(Sender: TObject);
begin
   {if length(dbeCtaContra.Text)=0 then
   begin
      ShowMessage('Falta Cuenta de Contrapartida');
      dblcdCtaContra.SetFocus;
      exit;
   end;}
end;

procedure TFPlnCta.dbcbCcosEnter(Sender: TObject);
var
    xSQL : String;
begin
    xAno:=DMCXP.strAno(Date);
    xSQL:='select * From CNT402 where CIAID ='+''''+dblcCIA.Text+''''+
          ' AND ANO ='+''''+xAno+'''';
    DMCXP.cdsRCCosto.Close;
    DMCXP.cdsRCCosto.DataRequest(xSQL);
    DMCXP.cdsRCCosto.Open;
end;

procedure TFPlnCta.dbeCuentaExit(Sender: TObject);
var
   xNivel  : Integer;
   xCuenta, xSQL : String;
begin
   If xCrea then Exit;

   if wModif='N' then
   begin
      xSQL:='select * From TGE202 where CIAID ='+''''+dblcCIA.Text+''''+
            ' order By CUENTAID';
      DMCXP.cdsCuenta2.Close;
      DMCXP.cdsCuenta2.DataRequest(xSQL);
      DMCXP.cdsCuenta2.Open;
      DMCXP.cdsCuenta2.SetKey;
      DMCXP.cdsCuenta2.fieldbyname('CIAID').AsString   :=dblcCia.Text;
      DMCXP.cdsCuenta2.fieldbyname('CUENTAID').AsString:=dbeCuenta.Text;
      if DMCXP.cdsCuenta2.GotoKey then
      begin
         showMessage('Cuenta ya existe');
         dbeCuenta.SetFocus;
         exit;
      end;
   end;

   xNivel1 := '';
   DMCXP.cdsNivel.First;
   while not DMCXP.cdsNivel.Eof do begin
      if DMCXP.cdsNivel.FieldByName('Signo').AsString='=' then begin
         if length(dbeCuenta.Text)=DMCXP.cdsNivel.FieldByName('DIGITOS').AsInteger then begin
            xNivel1:=DMCXP.cdsNivel.FieldByName('NIVEL').AsString;
            break;
         end
      end;
      if DMCXP.cdsNivel.FieldByName('Signo').AsString='<=' then begin
         if length(dbeCuenta.Text)<=DMCXP.cdsNivel.FieldByName('DIGITOS').AsInteger then begin
            xNivel1:=DMCXP.cdsNivel.FieldByName('NIVEL').AsString;
            break;
         end
      end;
      if DMCXP.cdsNivel.FieldByName('Signo').AsString='>=' then begin
         if length(dbeCuenta.Text)>=DMCXP.cdsNivel.FieldByName('DIGITOS').AsInteger then begin
            xNivel1:=DMCXP.cdsNivel.FieldByName('NIVEL').AsString;
            break;
         end
      end;
      DMCXP.cdsNivel.Next;
   end;

   if Length(xNivel1)=0 then begin
      dbeCuenta.SetFocus;
      Raise Exception.Create('Longitud de Cuenta NO Existe en Tabla Nivel de Cuenta');
   end;

   DMCXP.cdsNivel.First;
   while (not DMCXP.cdsNivel.Eof) and (DMCXP.cdsNivel.FieldByName('NIVEL').Text < xNivel1) do
   begin
      xNivel :=DMCXP.cdsNivel.FieldByName('DIGITOS').AsInteger;
      xCuenta:=copy(dbeCuenta.Text,1,xNivel);

      DMCXP.cdsCuenta2.SetKey;
      DMCXP.cdsCuenta2.fieldbyname('CIAID').AsString   :=dblcCia.Text;
      DMCXP.cdsCuenta2.fieldbyname('CUENTAID').AsString:=xCuenta;
      if not DMCXP.cdsCuenta2.GotoKey then
      begin
         dbeCuenta.SetFocus;
         showMessage('Cuenta '+xCuenta+' No Existe');
         exit;
      end;
      DMCXP.cdsNivel.Next;
   end;
end;

procedure TFPlnCta.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFPlnCta.dblcCtaConsolEnter(Sender: TObject);
var
   xSQL : String;
begin
   if wModif='N' then dblcCtaConsol.Text:=dbeCuenta.Text;
   xSQL:='select * From TGE209 where CIAID ='+''''+dblcCIA.Text+''''+
         ' order By CUENTAID';
   DMCXP.cdsCtaConsol.Close;
   DMCXP.cdsCtaConsol.DataRequest(xSQL);
   DMCXP.cdsCtaConsol.Open;
end;

procedure TFPlnCta.dblcNivelChange(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'NIVEL = '+''''+dblcNivel.Text+'''';
   dbeNivel.Text:=BuscaQry('dspTGE','CNT202','*',xWhere,'DIGITOS');
end;

procedure TFPlnCta.dblcdCtaInicChange(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'CUENTAID = '+''''+dblcdCtaInic.Text+'''';
   dbeCtaInic.Text:=BuscaQry('dspTGE','TGE202','*',xWhere,'CTADES');
end;

procedure TFPlnCta.dblcdCtaFinalChange(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'CUENTAID = '+''''+dblcdCtaFinal.Text+'''';
   dbeCtaFinal.Text:=BuscaQry('dspTGE','TGE202','*',xWhere,'CTADES');
end;

procedure TFPlnCta.Z2bbtnImprimeClick(Sender: TObject);
var
   xSQL : String;
begin
    DMCXP.cdsNivel.Last;
    dblcNivel.Text:=DMCXP.cdsNivel.FieldByName('NIVEL').AsString;

    xSQL:='select * From TGE202 where CIAID ='+''''+dblcCIA.Text+''''+
          ' order By CUENTAID';
    DMCXP.cdsCuenta3.Close;
    DMCXP.cdsCuenta3.DataRequest(xSQL);
    DMCXP.cdsCuenta3.Open;

    DMCXP.cdsCuenta3.First;
    dblcdCtaInic.Text:=DMCXP.cdsCuenta3.FieldByName('CUENTAID').AsString;

    DMCXP.cdsCuenta3.Last;
    dblcdCtaFinal.Text:=DMCXP.cdsCuenta3.FieldByName('CUENTAID').AsString;

    pnlPrincipal.Enabled:=False;
    pnlReporte.Visible  :=True;
    pnlFondo.Visible    :=True;

    dblcNivel.SetFocus;
end;

procedure TFPlnCta.Z2bbtnCanc3Click(Sender: TObject);
begin
    pnlReporte.Visible  :=False;
    pnlFondo.Visible    :=False;
    pnlPrincipal.Enabled:=True;
    Z2bbtnCanc2.SetFocus;
end;

procedure TFPlnCta.dblcNivelExit(Sender: TObject);
var
   xSQL : String;
begin
    xSQL:='Select * From TGE202 where CIAID ='+''''+dblcCIA.Text+''''+
          ' and CTANIV <='+''''+dblcNivel.Text+''''+
          ' order By CUENTAID';
    DMCXP.cdsCuenta3.Close;
    DMCXP.cdsCuenta3.DataRequest(xSQL);
    DMCXP.cdsCuenta3.Open;

    DMCXP.cdsCuenta3.First;
    dblcdCtaInic.Text:=DMCXP.cdsCuenta3.FieldByName('CUENTAID').AsString;

    DMCXP.cdsCuenta3.Last;
    dblcdCtaFinal.Text:=DMCXP.cdsCuenta3.FieldByName('CUENTAID').AsString;

end;

procedure TFPlnCta.dblcdCtaFinalExit(Sender: TObject);
begin
    if dblcdCtaFinal.Text<dblcdCtaInic.Text then
    begin
       ShowMessage('Cuenta Inicial es Mayor que la Final');
       dblcdCtaInic.SetFocus;
    end;
end;

procedure TFPlnCta.Z2bbtnRegistra3Click(Sender: TObject);
var
    xSQL : String;
begin
    xSQL:='Select * From TGE202 where CIAID ='+''''+dblcCIA.Text+''''+
          ' and CTANIV <='+''''+dblcNivel.Text+''''+
          ' and CUENTAID >='+''''+dblcdCtaInic.Text+''''+
          ' and CUENTAID <='+''''+dblcdCtaFinal.Text+''''+
          ' order By CUENTAID';
    DMCXP.cdsCuenta3.Close;
    DMCXP.cdsCuenta3.DataRequest(xSQL);
    DMCXP.cdsCuenta3.Open;

    pplblCia.Caption  :=dblcCia.Text;
    pplblNivel.Caption:=dblcNivel.Text;
    pprPlanCtas.Print;
end;

procedure TFPlnCta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   xCrea := True;
   xCcos := '';
   pnlReporte.Visible  :=False;
   pnlFondo.Visible    :=False;
   pnlPrincipal.Enabled:=True;
   dblcCia.Enabled:=True;
   dbeCuenta.Enabled:=True;
   DMCXP.cdsCuenta.CancelUpdates;
   Close;
end;

procedure TFPlnCta.ppDBText1Print(Sender: TObject);
var
    x : double;
begin
    x:=strtoFloat(DMCXP.cdsCuenta3.FieldByName('CTANIV').AsString)*0.06;
    ppdbText1.Left:= 0.1+x;
end;

procedure TFPlnCta.dbcbAuxEnter(Sender: TObject);
begin
   xSalir := False;
end;

procedure TFPlnCta.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.
