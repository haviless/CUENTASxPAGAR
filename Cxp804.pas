unit Cxp804;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Wwdbdlg, wwdblook, Buttons, Grids, DBGrids, ExtCtrls,
  wwdbdatetimepicker, Wwdbigrd, Wwdbgrid;

type
  TFActLetra = class(TForm)
    gbProv: TGroupBox;
    Label6: TLabel;
    lblProv: TLabel;
    dblcClAux: TwwDBLookupCombo;
    dblcdProv: TwwDBLookupComboDlg;
    edtPeriodo: TEdit;
    Label1: TLabel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Z2bbtnAcepta: TBitBtn;
    pnlActualiza: TPanel;
    bbtnRegOk: TBitBtn;
    bbtnRegCanc: TBitBtn;
    dbdtpFVcmto: TwwDBDateTimePicker;
    dblcTDoc: TwwDBLookupCombo;
    edtTDoc: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbgLetras: TwwDBGrid;
    dbgLetrasIButton: TwwIButton;
    dbdtpFvcmtoTemp: TwwDBDateTimePicker;
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure dbgLetrasDblClick(Sender: TObject);
    procedure bbtnRegOkClick(Sender: TObject);
    procedure bbtnRegCancClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcClAuxExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FActLetra: TFActLetra;

implementation
uses CxPDM;

{$R *.DFM}

procedure TFActLetra.Z2bbtnAceptaClick(Sender: TObject);
var
   xSQL: string;
begin
   if Length(dblcCia.text)=0 then
      raise exception.create('Ingrese Compañia');

   if Length(edtCia.text)=0 then
      raise exception.create('Compañia Errada');

   if Length(dblcClAux.text)=0 then
      raise exception.create('Ingrese Clase Auxiliar');

   if Length(dblcdProv.text)=0 then
      raise exception.create('Ingrese Proveedor');

   if Length(dblcTDoc.text)=0 then
      raise exception.create('Ingrese Documento');

   if Length(edtTDoc.text)=0 then
      raise exception.create('Documento Errado');

   xSQL:= ' SELECT * FROM CXP301 '+
          ' WHERE CIAID='+Quotedstr(dblcCia.text)+
          ' AND PROV='+Quotedstr(dblcdProv.text);
   if length(edtPeriodo.text)>0 then
      xSQL:= xSQL+' AND CPANOMES='+Quotedstr(edtPeriodo.text);

   xSQL:= xSQL+' AND DOCID='+Quotedstr(dblcTDoc.text)+
               ' AND CPESTADO=''P'' ';
   DMCXP.cdsLetras.IndexFieldNames:='';
   DMCXP.cdsLetras.Filter:='';
   DMCXP.cdsLetras.Filtered:= false;
   DMCXP.cdsLetras.Close;
   DMCXP.cdsLetras.DataRequest(xSQL);
   DMCXP.cdsLetras.Open;
   dbgLetras.DataSource:= DMCXP.dsLetras;
   dbgLetras.Selected.Clear;
   dbgLetras.Selected.Add('CPNOREG'#9'11'#9'No.Reg'#9'F');
   dbgLetras.Selected.Add('CPNODOC'#9'18'#9'No. Letra'#9'F');
   dbgLetras.Selected.Add('CPFEMIS'#9'11'#9'Fecha~Emisión'#9'T');
   dbgLetras.Selected.Add('CPFVCMTO'#9'11'#9'Fecha~Vencimiento'#9'F');
   dbgLetras.Selected.Add('CPMTOORI'#9'15'#9'Importe'#9'F');
   dbgLetras.Selected.Add('CPMTOLOC'#9'15'#9'Importe Mon.~Local'#9'T');
   dbgLetras.Selected.Add('CPMTOEXT'#9'15'#9'Importe Mon.~Extranjera'#9'T');
   dbgLetras.ApplySelected;
end;

procedure TFActLetra.FormActivate(Sender: TObject);
var
   xFiltro : string;
begin
	 DMCXP.cdsTDoc.Filter:='';
   xFiltro:=  '(DOC_FREG=''L'' and DOCMOD=''CXP'')'
             +'OR (DOCTIPREG=''LT'' and DOCMOD=''CXP'')';
//   DMCXP.cdsTDoc.Filter:='DOC_FREG=''L'' and DOCMOD=''CXP''';
   DMCXP.cdsTDoc.Filter:=xFiltro;
   DMCXP.cdsTDoc.Filtered:=True;

end;

procedure TFActLetra.dblcTDocExit(Sender: TObject);
begin
   edtTDoc.Text :=BuscaQry('dspTGE','TGE110','DOCABR','DOCID='+quotedstr(dblcTDoc.Text)
                  +' AND DOCMOD=''CXP'' ','DOCABR');
end;

procedure TFActLetra.dbgLetrasDblClick(Sender: TObject);
begin

   dbdtpFvcmtoTemp.Date := DMCXP.cdsLetras.fieldbyname('CPFVCMTO').AsDatetime;
   pnlActualiza.Visible := true;
   pnlActualiza.BringToFront;
   DMCXP.cdsLetras.Edit;

end;

procedure TFActLetra.bbtnRegOkClick(Sender: TObject);
begin
   if DMCXP.cdsLetras.fieldbyname('CPFVCMTO').AsDatetime<DMCXP.cdsLetras.fieldbyname('CPFEMIS').AsDatetime then
   begin
      DMCXP.cdsLetras.CancelUpdates;
      Showmessage('La Fecha Vencimiento no debe ser menor '+#13+'que la Fecha de Emisión');
      Exit;
   end;


   DMCXP.cdsLetras.FieldByName('CPUSER').AsString   := DMCXP.wUsuario;
   DMCXP.cdsLetras.FieldByName('CPFREG').AsDateTime := Date;
   DMCXP.cdsLetras.FieldByName('CPHREG').AsDateTime := Time;
   DMCXP.cdsLetras.Post;
   DMCXP.AplicaDatos( DMCXP.cdsLetras, 'Letras' );
   Showmessage('Fecha Cambiada');   
end;

procedure TFActLetra.bbtnRegCancClick(Sender: TObject);
begin
    DMCXP.cdsLetras.CancelUpdates;
    pnlActualiza.Visible:= false;  
end;

procedure TFActLetra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMCXP.cdsLetras.IndexFieldNames:='';
   DMCXP.cdsLetras.Filter:='';
   DMCXP.cdsLetras.Filtered:= false;
   DMCXP.cdsLetras.Close;

   DMCXP.cdsProv.IndexFieldNames:='';
   DMCXP.cdsProv.Filter:='';
   DMCXP.cdsProv.Filtered:=false;
   DMCXP.cdsProv.Close;
   Close;
end;

procedure TFActLetra.dblcClAuxExit(Sender: TObject);
begin
  Filtracds( DMCXP.cdsProv, 'SELECT CLAUXID, PROV, PROVRUC, PROVDES, PROVABR, PROVNOMCOM,PROVRETIGV,PAISID,PROVDIR,PROVCZIP,PROVTELF,PROVFAX,PROVEMAI FROM TGE201 WHERE CLAUXID='''+dblcClAux.Text+'''' );
end;

procedure TFActLetra.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;

end;

procedure TFActLetra.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:=BuscaQry('dspTGE','TGE101','CIAABR','CIAID='+quotedstr(dblcCia.Text),'CIAABR');
   edtPeriodo.text:='';   
end;

procedure TFActLetra.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.
