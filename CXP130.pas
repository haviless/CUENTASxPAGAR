unit CXP130;
//*********************************************************
// CREADO     POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201103_CXP
// FECHA DE MODIF.  : 28/06/2011
// DESCRIPCION      : Lista las Ordenes de Pago registradas
//                    para el proveedor seleccionado
//*********************************************************

//Actualizaciones
// HPC_201702_CXP  05/05/2017  se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
// HPC_201803_CXP  05/03/2018  se adiciona la lectura del Centro de Costo en la solicitud de Orden de Pago

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  // Inicio HPC_201702_CXP
  // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
  Dialogs, Buttons, Wwdbigrd, Grids, Wwdbgrid, StdCtrls, Wwkeycb, ExtCtrls,wwdblook,DB,
  Mask, wwdbedit, Wwdbdlg, DBClient, wwclient;
  // Fin HPC_201702_CXP

type
  TFListaOrdenPago = class(TForm)
    dbgOrdenPago: TwwDBGrid;
    btnActReg: TwwIButton;
	// Inicio HPC_201702_CXP
    // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
	pnlBusca: TPanel;
    lblBusca: TLabel;
    Bevel1: TBevel;
    isBusca: TwwIncrementalSearch;
    btnSalir: TBitBtn;
    pnlDetalle: TPanel;
    Label1: TLabel;
    dblcTRegistroOP: TwwDBLookupCombo;
    Label2: TLabel;
    dblcdCnpEgrOP: TwwDBLookupComboDlg;
    Label4: TLabel;
    dbeGlosaOP: TwwDBEdit;
    Label5: TLabel;
    dblcdCCostoOP: TwwDBLookupComboDlg;
    edtTRegistroOP: TEdit;
    Label3: TLabel;
    dbeCuentaOP: TwwDBEdit;
    Label6: TLabel;
    dbeDetracOP: TwwDBEdit;
    edtCCostoOP: TEdit;
    bbtnRegOk: TBitBtn;
    bbtnRegCanc: TBitBtn;	
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
    Label7: TLabel;
    edtCiaOP: TEdit;
    dblcCiaOP: TwwDBLookupCombo;					   
// Fin HPC_201803_CXP
	// Fin HPC_201702_CXP
    procedure FormShow(Sender: TObject);
    procedure bbtnRegCancClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnRegOkClick(Sender: TObject);
    // Inicio HPC_201702_CXP
    // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
//    procedure dbgOrdenPagoDblClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure dbgOrdenPagoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure isBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure dblcTRegistroOPChange(Sender: TObject);
    procedure dblcTRegistroNotInList(Sender: TObject;
      LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure dblcTRegistroOPEnter(Sender: TObject);
    procedure dblcdCnpEgrOPEnter(Sender: TObject);
    procedure dblcdCnpEgrOPExit(Sender: TObject);
    procedure dblcdCCostoOPExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcTRegistroOPExit(Sender: TObject);
// Inicio HPC_201803_CXP
// se adiciona la lectura del Centro de Costo en la solicitud de Orden de Pago
    procedure dbgOrdenPagoDblClick(Sender: TObject);  
    procedure dblcCiaOPEnter(Sender: TObject);
    procedure dblcCiaOPExit(Sender: TObject);  
// Fin HPC_201803_CXP
    // Fin HPC_201702_CXP
  private
    // Inicio HPC_201702_CXP
    // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
    xGlosaRep, xCta_Ccos,xDistri : String;
    numreg: Integer;
    wTasa: double;
    // Fin HPC_201702_CXP
    { Private declarations }
    procedure AsignaLookup;
    procedure AsignaDatasource;
    procedure RecuperaDocumentos(pCiaid , pProveedor :String);
// Inicio HPC_201803_CXP
// se adiciona la lectura del Centro de Costo en la solicitud de Orden de Pago
    Function ValidaTipoRegistro(pCiaid, pTipDoc: String; pIgv : Double): String;
// Fin HPC_201803_CXP
  public
    { Public declarations }
    // Inicio HPC_201702_CXP
    // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
    xDTRPorc: DOUBLE;
    xdblcTRegistroOP,xedtTRegistroOP,xdblcdCnpEgrOP,xdbeCuentaOP,xdbeGlosaOP,xdblcdCCostoOP,xedtCCostoOP,xdbeDetracOP :String;
    // Fin HPC_201702_CXP
  end;

var
  FListaOrdenPago: TFListaOrdenPago;
  xSQL :String;
  // Inicio HPC_201702_CXP
  // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
  xTemTReg: String;
  xTemCpto: String;
  xTemCta: String;
  xTemDH: String;
  xNuevoDet : boolean;
  // Fin HPC_201702_CXP

implementation
Uses CxPDM, CxP201;
{$R *.dfm}

procedure TFListaOrdenPago.AsignaLookup;
begin

   dbgOrdenPago.Selected.Clear;
   dbgOrdenPago.Selected.Add('NUMORDPAG'#9'8'#9'Nº Ord~de Pago'#9'F');
   dbgOrdenPago.Selected.Add('ODCID'#9'8'#9'Nº Ord~Compra'#9'F');
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
   dbgOrdenPago.Selected.Add('CIAID'#9'3'#9'Cia~Doc'#9'F');
// Fin HPC_201803_CXP
   dbgOrdenPago.Selected.Add('DOCID'#9'3'#9'Tip~Doc'#9'F');
   dbgOrdenPago.Selected.Add('DOCID_DES'#9'10'#9'Tipo~Documento'#9'F');
   dbgOrdenPago.Selected.Add('TMONID'#9'2'#9'M'#9'F');
   dbgOrdenPago.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
   dbgOrdenPago.Selected.Add('CPNODOC'#9'6'#9'Número'#9'F');
   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   dbgOrdenPago.Selected.Add('BASIMP'#9'7'#9'Base ~Imponible'#9'F');
   dbgOrdenPago.Selected.Add('IGV'#9'7'#9'Igv'#9'F');
   dbgOrdenPago.Selected.Add('TOTAL'#9'7'#9'Total'#9'F');
   // Fin HPC_201702_CXP
   dbgOrdenPago.Selected.Add('CPFEMIS'#9'9'#9'Fecha~Emisión'#9'F');
   dbgOrdenPago.Selected.Add('CPFRECEP'#9'9'#9'Fecha~Recepción'#9'F');


end;
procedure TFListaOrdenPago.AsignaDatasource;
begin
   dbgOrdenPago.DataSource := DMCXP.dsQry1;
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
   dblcCiaOP.Selected.Clear;
   dblcCiaOP.Selected.Add('CIAID'#9'3'#9'Cia'#9'F');
   dblcCiaOP.Selected.Add('CIADES'#9'30'#9'Descripción'#9'F');

   DMCXP.cdsCiaOP.IndexFieldNames := 'CIAID';		   
// Fin HPC_201803_CXP
end;
procedure TFListaOrdenPago.RecuperaDocumentos(pCiaid , pProveedor :String);
begin
    (*xSQL := ' SELECT LOG130.NUMORDPAG, ' +
                 ' LOG130.ODCCIAID, ' +
                 ' LOG130.ODCID, ' +
                 ' LOG130.CPCIAID, ' +
                 ' LOG130.DOCID, ' +
                 ' (SELECT TGE110.DOCDES FROM TGE110 WHERE TGE110.DOCID = LOG130.DOCID   ' +
                             ' AND TGE110.DOCMOD = '+QuotedStr('CXP')+') DOCID_DES ,   ' +
                 ' LOG130.TMONID,   ' +
                 ' LOG130.CPSERIE,   ' +
                 ' LOG130.CPNODOC,   ' +
                 ' LOG130.CPFEMIS,   ' +
                 ' LOG130.CPFRECEP,   ' +
                 ' LOG130.CPFVCMTO,   ' +
                 ' LOG130.TOTAL   ' +
                 ' FROM LOG130   ' +
                 ' WHERE LOG130.CPCIAID = ' + QuotedStr(pCiaid)+
                 ' AND LOG130.PROV = ' + QuotedStr(pProveedor);

   DMCXP.cdsQry1.Close;
   DMCXP.cdsQry1.DataRequest(xSQL);
   DMCXP.cdsQry1.Open;  *)
end; 
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
procedure TFListaOrdenPago.FormShow(Sender: TObject);
var
ls_ciaid, ls_proveedor :String;
// Inicio HPC_201702_CXP
// se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
var
   xSQL, xWhere: String;
// Fin HPC_201702_CXP
begin
   If (DMCXP.cdsDetCxP.State = dsInsert) Or (DMCXP.cdsDetCxP.State = dsEdit) Then
      DMCXP.cdsDetCxP.Post;
   ls_ciaid := DMCXP.cdsQry1.fieldbyname('CIAID').AsString;
   dblcCiaOP.text := ls_ciaid;
   xWhere := 'CIAID=''' + dblcCiaOP.Text + ''' ';
   edtCiaOP.Text := BuscaQry('dspTGE', 'TGE101', 'CIADES', xWhere, 'CIADES');
   If length(edtCiaOP.Text) = 0 Then
   Begin
      edtCiaOP.Text := '';
      ShowMessage('No existe la compañía');
      dblcCiaOP.setfocus;
      Exit;
   End;

   ls_proveedor := DMCXP.cdsMovCxP.fieldbyname('PROV').AsString;
   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   dblcTRegistroOP.Text := '';
   edtTRegistroOP.Text := '';
   dblcdCnpEgrOP.DataSource := DMCXP.dsDetCxP;
   dblcdCnpEgrOP.LookupTable := DMCXP.cdsCnpEgr;
   dbeCuentaOP.DataSource := DMCXP.dsDetCxP;
// dblcdCCostoOP.DataSource := DMCXP.dsDetCxP;
   dblcdCCostoOP.LookupTable := DMCXP.cdsCCosto;

   Label6.Visible := false;
   dbeDetracOP.Visible := false;
   DMCXP.cdsMovCxP.Edit;
   DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString:=ls_ciaid;
//   DMCXP.cdsMovCxP.Post;
   dblcTRegistroOP.Text := ValidaTipoRegistro(ls_ciaid, DMCXP.cdsQry1.fieldbyname('DOCID').AsString, DMCXP.cdsQry1.fieldbyname('IGV').AsFloat);
   edtTRegistroOP.Text := DMCXP.DisplayDescrip('TGE113', 'TREGDES', 'TRegID', dblcTRegistroOP.Text);
   if DMCXP.cdsQry1.fieldbyname('CCOSID').AsString <>'' then
   begin
    dblcdCCostoOP.Text := DMCXP.cdsQry1.fieldbyname('CCOSID').AsString;
    dblcdCCostoOPExit(self);
   end
   else
   begin
    dblcdCCostoOP.Text := '';
    edtCCostoOP.Text := '';
   end;
   //Fin HPC_201702_CXP
   AsignaLookup;
   AsignaDatasource;
   //   RecuperaDocumentos(ls_ciaid, ls_proveedor);
end;
// Fin HPC_201803_CXP
procedure TFListaOrdenPago.bbtnRegCancClick(Sender: TObject);
begin  
   FListaOrdenPago.Close;
end;

procedure TFListaOrdenPago.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   //DMCXP.cdsQry1.Close;
   //FListaOrdenPago.Free
end;

procedure TFListaOrdenPago.bbtnRegOkClick(Sender: TObject);
// Inicio HPC_201702_CXP
// se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
var
    xSQL, xTipDet, xWhere :String;
    xDiferencia, xMontoOri, xIGVx, xTotMG, xTotTO, xCalc :Double;
    cdsClone: TwwClientDataSet;
    xRecord: Integer;
// Fin HPC_201702_CXP
begin
   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   If length(dblcTRegistroOP.Text) = 0 Then
   Begin
      dblcTRegistroOP.SetFocus;
      Raise Exception.Create('Debe Ingresar Tipo de Registro');
   End;
   If length(dblcdCnpEgrOP.Text) = 0 Then
   Begin
      dblcdCnpEgrOP.SetFocus;
      Raise Exception.Create('Debe Ingresar Concepto');
   End;
   If length(dbeGlosaOP.Text) = 0 Then
   Begin
      dbeGlosaOP.SetFocus;
      Raise Exception.Create('Debe Ingresar Glosa');
   End;

   xdblcTRegistroOP := dblcTRegistroOP.Text;
   xedtTRegistroOP := edtTRegistroOP.Text;
   xdblcdCnpEgrOP := dblcdCnpEgrOP.Text;
   xdbeCuentaOP := dbeCuentaOP.Text;
   xdbeGlosaOP := dbeGlosaOP.Text;
   xdblcdCCostoOP  := dblcdCCostoOP.Text;
   xedtCCostoOP := edtCCostoOP.Text;
   xdbeDetracOP := dbeDetracOP.Text;
   // Fin HPC_201702_CXP
   //INICIO SAR666
   FProvision.xOrdenPago :=  DMCXP.cdsQry1.fieldbyname('NUMORDPAG').AsString  ;
   FProvision.xnItemOP :=   DMCXP.cdsQry1.fieldbyname('ITEM').AsInteger;
   //FIN SAR666
// Inicio HPC_201803_CXP
// se adiciona la lectura del Centro de Costo en la solicitud de Orden de Pago
   DMCXP.cdsMovCxP.Edit;
// Fin HPC_201803_CXP
   DMCXP.cdsMovCxP.fieldbyname('DOCID').AsString := DMCXP.cdsQry1.fieldbyname('DOCID').AsString  ;
   FProvision.dblcTDocExit(FProvision.dblcTDoc);
   DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString := DMCXP.cdsQry1.fieldbyname('CPSERIE').AsString  ;
   FProvision.edtSerieExit(FProvision.edtSerie);
   DMCXP.cdsMovCxP.fieldbyname('CPNODOC').AsString := DMCXP.cdsQry1.fieldbyname('CPNODOC').AsString  ;
   FProvision.edtNoDocExit(FProvision.edtNoDoc);
// Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   DMCXP.cdsMovCxP.fieldbyname('CPFCMPRB').AsString := DMCXP.cdsQry1.fieldbyname('CPFCMPRB').AsString  ;
// Fin HPC_201702_CXP
   FProvision.dtpFCompExit(FProvision.dtpFComp);
   DMCXP.cdsMovCxP.Edit;
   DMCXP.cdsMovCxP.fieldbyname('CPFRECEP').AsString := DMCXP.cdsQry1.fieldbyname('CPFRECEP').AsString  ;
   FProvision.dtpFRecepExit(FProvision.dtpFRecep);
   DMCXP.cdsMovCxP.fieldbyname('CPFEMIS').AsString := DMCXP.cdsQry1.fieldbyname('CPFEMIS').AsString  ;
   FProvision.dtpFEmisExit(FProvision.dtpFEmis);
   DMCXP.cdsMovCxP.fieldbyname('CPFVCMTO').AsString := DMCXP.cdsQry1.fieldbyname('CPFVCMTO').AsString  ;
   FProvision.dtpFVcmtoExit(FProvision.dtpFVcmto);

   DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString := DMCXP.cdsQry1.fieldbyname('TMONID').AsString  ;
   FProvision.dblcTMonExit(FProvision.dblcTMon);
   DMCXP.cdsMovCxP.fieldbyname('CPOCOMP').AsString := DMCXP.cdsQry1.fieldbyname('ODCID').AsString  ;
   FProvision.dblcdOCompraEnter(FProvision.dblcdOCompra);
   FProvision.dblcdOCompraExit(FProvision.dblcdOCompra);
   // Inicio HPC_201702_CXP
   // se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
   FProvision.edtSerie.SetFocus;
   FProvision.xorigen := 'CxP130';
   FProvision.bbtnOKClick(Sender);
   FProvision.xorigen := 'CxP130';
   FProvision.bbtnRegOkClick(Sender);
   FProvision.bbtnRegCancClick(Sender);
   FProvision.xorigen := 'CxP130';
   FProvision.dblcdOCompraExit(FProvision.dblcdOCompra);
   FProvision.bbtnGenRegClick(Sender);
   FListaOrdenPago.Close;
   // Fin HPC_201702_CXP
end;
// Inicio HPC_201702_CXP
// se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
{
procedure TFListaOrdenPago.dbgOrdenPagoDblClick(Sender: TObject);
begin
   FListaOrdenPago.bbtnRegOkClick(FListaOrdenPago.bbtnRegOk);
end;
}
// Fin HPC_201702_CXP

// Inicio HPC_201702_CXP
// se adiciona la opción de búsqueda para los campos orden de pago y orden de compra
procedure TFListaOrdenPago.btnSalirClick(Sender: TObject);
begin
   pnlBusca.visible := false;
// dblcTRegistroOP.SetFocus;
end;

procedure TFListaOrdenPago.dbgOrdenPagoTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   If (AFieldName<>'NUMORDPAG') and (AFieldName<>'ODCID') and (AFieldName<>'CPNODOC') Then
   Begin
      pnlBusca.Visible := False;
      Exit;
   End;
   DMCXP.cdsQry1.IndexFieldNames:=AFieldName;
   isBusca.datasource:=DMCXP.dsQry1;
   isBusca.SearchField:=AFieldName;
   pnlBusca.Visible := True;
   isBusca.Text:='';
   isBusca.SetFocus;
   If AFieldName='NUMORDPAG' Then
   Begin
      lblBusca.Caption:='Busca por Orden de Pago';
   End;
   If AFieldName='ODCID' Then
   Begin
      lblBusca.Caption:='Busca por Orden de Compra';
   End;
end;

procedure TFListaOrdenPago.isBuscaKeyPress(Sender: TObject; var Key: Char);
begin
   If key = #13 Then
   Begin
      pnlBusca.visible := false;
      dblcTRegistroOP.SetFocus;
   End;
end;

procedure TFListaOrdenPago.dblcTRegistroOPChange(Sender: TObject);
Var
   xWhere:String;
Begin
   xWhere := 'TREGID=' + quotedstr(dblcTRegistroOP.Text);
   edtTRegistroOP.Text := BuscaQry('PrvTGE', 'TGE113', 'TREGID,TREGDES',xWhere, 'TREGDES');
   If length(edtTRegistroOP.Text) = 0 Then
   Begin
     ShowMessage('Falta Tipo de Registro');
     dblcTRegistroOP.SetFocus;
   End;
end;
procedure TFListaOrdenPago.dblcTRegistroNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFListaOrdenPago.dblcTRegistroOPEnter(Sender: TObject);
var
   xSQL:String;
begin
   DMCXP.cdsTipReg.Filter := '';
   xSQL := 'SELECT TREGID,TREGDES FROM TGE113 WHERE 1=1 ';
   Filtracds(DMCXP.cdsTipReg, xSQL);
   dblcTRegistroOP.LookupField := 'TREGID';
   dblcTRegistroOP.LookupTable := DMCXP.cdsTipReg;
end;

procedure TFListaOrdenPago.dblcdCnpEgrOPEnter(Sender: TObject);
begin
 DMCXP.cdsCnpEgr.IndexFieldNames := 'CUENTAID';
end;

procedure TFListaOrdenPago.dblcdCnpEgrOPExit(Sender: TObject);
Var
   xsql, xWhere, xxCta, xMensaje: String;
Begin

   DMCXP.cdsCnpEgr.IndexFieldNames := 'CPTOID';

   DMCXP.cdsCnpEgr.SetKey;
   DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString := dblcdCnpEgrOP.text;
   If Not DMCXP.cdsCnpEgr.Gotokey Then
   Begin
      DMCXP.cdsDetCxP.edit;
      DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString := '';
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := '';
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := '';
      ShowMessage('Error : Código de Concepto No Existe ');
      dblcdCnpEgrOP.SetFocus;
      Exit;
   End;

   If DMCXP.cdsCnpEgr.FieldByname('NIVELMOV').AsString <> 'S' Then
   Begin
      DMCXP.cdsDetCxP.edit;
      DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString := '';
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := '';
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := '';
      ShowMessage('Error : Concepto No es de Movimiento');
      dblcdCnpEgrOP.SetFocus;
      Exit;
   End;

   xxCta := DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString;
// Inicio HPC_201803_CXP
// se adiciona la lectura del Centro de Costo en la solicitud de Orden de Pago
  /////////////////////////////////////////////////////////////////////
  // obtiene el Porcentaje de Detraccion de acuerdo al concepto
   If length(DMCXP.cdsCnpEgr.FieldByName('DTRPORC').AsString) > 0 Then
   Begin
       If dblcTRegistroOP.text <>'10' then
       Begin
          Label6.Visible := true;
          dbeDetracOP.Visible := true;
          // carga el listbox que contiene los conceptos digitados que son afectos a DETRACCION
          FProvision.lbDTRCpto.Items.Add(DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString);
          dbeDetracOP.Text := DMCXP.cdsCnpEgr.FieldByName('DTRPORC').AsString;
          FProvision.lbDTRPorc.Items.Add(FloatToStrF(StrToFloat(dbeDetracOP.Text), ffFixed, 15, 4));
          FProvision.dbeDetrac.Visible := True;
          FProvision.lblDet.Visible := True;
          DMCXP.cdsMovCxP.edit;
          DMCXP.cdsMovCxP.fieldbyname('DTRPORC').AsFLoat := StrToFloat(dbeDetracOP.Text);
       end
       else
       Begin
          Label6.Visible := False;
          dbeDetracOP.Visible := False;
          // carga el listbox que contiene los conceptos digitados que son afectos a DETRACCION
          FProvision.lbDTRCpto.Items.Add(DMCXP.cdsCnpEgr.FieldByName('CPTOID').AsString);
          dbeDetracOP.Text := '0';
          FProvision.lbDTRPorc.Items.Add(FloatToStrF(StrToFloat(dbeDetracOP.Text), ffFixed, 15, 4));
          FProvision.dbeDetrac.Visible := False;
          FProvision.lblDet.Visible := False;
          DMCXP.cdsMovCxP.edit;
          DMCXP.cdsMovCxP.fieldbyname('DTRPORC').AsFLoat := 0;
       End;
   End;
  //////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////
  // si el Tipo de Documento (TGE110) seleccionado no esta afecto a Detraccion
  // NO se afectara la Provision con la Detraccion
   If (FProvision.xDTRAfectoP = 'N') or (FProvision.xDTRAfectoP = '') Then
   Begin
      FProvision.xDTRPorc := 0;
      FProvision.dbeDetrac.Visible := False;
      FProvision.lblDet.Visible := False;
      DMCXP.cdsMovCxP.edit;
      DMCXP.cdsMovCxP.fieldbyname('DTRPORC').AsFLoat := 0;
//      DMCXP.cdsMovCxP.Post;
   End;
// Fin HPC_201803_CXP
  /////////////////////////////////////////////////////////////////////

   DMCXP.cdsDetCxP.edit;
   DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString;

   dbeCuentaOP.Text := DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString;

// (2) si la cuenta contable existe
   xWhere := 'CIAID=' + Quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString) + ' and CUENTAID=' + quotedstr(DMCXP.cdsCnpEgr.fieldbyname('CUENTAID').AsString);
   If length(BuscaQry('PrvTGE', 'TGE202', 'CUENTAID, CTA_CCOS, CTAACT', xWhere, 'CUENTAID')) > 0 Then
   Begin

      If DMCXP.cdsQry.FieldByName('CTAACT').AsString = 'N' Then
      Begin
         ShowMessage('Cuenta Contable NO ESTA ACTIVA. VERIFICAR CON CONTABILIDAD');
         dblcdCnpEgrOP.SetFocus;
         exit;
      End;
// Inicio HPC_201803_CXP
// se adiciona la lectura del Centro de Costo en la solicitud de Orden de Pago
 // (3) si lleva Centro de Costo
      if length(dblcdCCostoOP.Text)=0 then
      begin
        If DMCXP.cdsQry.FieldByName('CTA_CCOS').AsString = 'S' Then
        Begin
           xCta_Ccos := 'S';
           xWhere := 'CUENTAID=' + quotedstr(DMCXP.cdsQry.fieldbyname('CUENTAID').AsString);
           If DMCXP.cdsCnpEgr.fieldbyname('DTRPORC').AsString = 'S' Then
           Begin
              xSQL := 'select sum(PORCENTAJE) TOTAL from CXP102 where CIAID=' + quotedstr(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString)
                 + ' and CPTOID=' + quotedstr(dblcdCnpEgrOP.text);
              DMCXP.cdsQry3.Close;
              DMCXP.cdsQry3.ProviderName := 'dspTGE';
              DMCXP.cdsQry3.DataRequest(xSql);
              DMCXP.cdsQry3.Open;
        //** si suman el 100%
              If DMCXP.cdsQry3.FieldByName('TOTAL').AsFloat = 100 Then
                 xMensaje := '1'
              Else
                 xMensaje := '2';
           End
           Else
              xMensaje := '2';
        End
        Else
        Begin
           xMensaje := '2';
           xCta_Ccos := 'N';
           DMCXP.cdsDetCxP.FieldByname('CCOSID').AsString := '';
           dblcdCCostoOP.Enabled := False;
        End;
      end
      else
      begin
         dblcdCCostoOP.Enabled := True;
         exit;
      end;
   End
   Else
   Begin
      ShowMessage('Cuenta Contable NO existe para la Compañía indicada');
      dblcdCnpEgrOP.SetFocus;
      exit;
   End;
// Fin HPC_201803_CXP
   If xMensaje = '1' Then
   Begin
      If MessageDlg('¿ Distribución de C.Costo Automática ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         xDistri := 'S';
         DMCXP.cdsDetCxP.FieldByname('CCOSID').AsString := '';
         dblcdCCostoOP.Enabled := false;
      End
      Else
         xDistri := '';
   End
   Else
      xDistri := '';

   //** si la distribucion es Manual y la Cuenta si Tiene Centro de Costo
   If (xDistri = '') And (xCta_Ccos = 'S') Then
   Begin
      dblcdCCostoOP.Enabled := true;

      xWhere := 'CIAID=''' + DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString + ''' and CUENTAID=' + '''' + DMCXP.cdsCnpEgr.fieldbyname('CUENTAID').AsString + '''';
      BuscaQry('PrvTGE', 'TGE202', 'CUENTAID,CTA_PRES', xWhere, 'CUENTAID');   //JESUS
      If (DMCXP.cdsQry.fieldbyname('CTA_PRES').AsString = 'S') And (wActuaPresu = true) Then
      Begin
         xSQL := 'SELECT ciaid, parpresid, parpresdes, parpresabr, parpresest, parpresniv, parpres_is, tippresid, parpresmov, tmonid, parpreuser, parprefreg, parprehreg, asientoid, parpresaut2, parpresaut1, origen, proce from PPRES201 WHERE PARPRES_IS=''S''';
         DMCXP.cdsPresup.Close;
         DMCXP.cdsPresup.DataRequest(xSQL);
         DMCXP.cdsPresup.Open;

      End;
   End;
end;

procedure TFListaOrdenPago.dblcdCCostoOPExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CCOSID=''' + dblcdCCostoOP.Text + ''' and CCOSMOV=''S'' AND CCOSACT=''S'' '
      + ' and CCOSCIAS LIKE (' + quotedstr('%' + DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString + '%') + ' )';
   edtCCostoOP.Text := BuscaQry('dspTGE', 'TGE203', 'CCOSDES', xWhere, 'CCOSDES');

   If length(edtCCostoOP.Text) = 0 Then
   Begin
      edtCCostoOP.Text := '';
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
      dblcdCCostoOP.Text :='';						   
// Fin HPC_201803_CXP
      ShowMessage('Centro de Costo NO esta Activo');
      dblcdCCostoOP.setfocus;
      Exit;
   End;
end;

procedure TFListaOrdenPago.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
end;

procedure TFListaOrdenPago.dblcTRegistroOPExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Not bbtnRegCanc.Focused Then
   Begin
      edtTRegistroOP.Text := DMCXP.DisplayDescrip('TGE113', 'TREGDES', 'TRegID', dblcTRegistroOP.Text);
      If length(dblcTRegistroOP.Text) = 0 Then
      Begin
         ShowMessage('Debe Ingresar el Tipo de Registro');
         dblcTRegistroOP.SetFocus;
         exit;
      End;
      wTasa := 0;
      wTasa := FRound((DMCXP.cdsULTTGE.FieldByName('TASA').AsFloat / 100), 7, 4);
      If (FProvision.dtpFEmis.date <= StrToDate('28/02/2011')) And
         ((DMCXP.cdsULTTGE.FieldByName('TREGID').AsString = '03') Or
         (DMCXP.cdsULTTGE.FieldByName('TREGID').AsString = '04') Or
         (DMCXP.cdsULTTGE.FieldByName('TREGID').AsString = '09')) Then
         wTasa := 0.19;
      If xNuevoDet Then
      Begin
         DMCXP.cdsDetCxP.Edit;
         DMCXP.cdsDetCxP.FieldByName('CIAID').AsString := DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString;
         DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString := DMCXP.cdsMovCxP.fieldbyname('TDIARID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString := DMCXP.cdsMovCxP.fieldbyname('CPNOREG').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString := copy(DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString, 1, 4);
         DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPANOMES').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString := DMCXP.cdsMovCxP.fieldbyname('DCPLOTE').AsString;
         DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString := 'CP';
         DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString := FProvision.dblcClAux.Text;
         DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsMovCxP.fieldbyname('PROV').AsString;
         DMCXP.cdsDetCxP.FieldByName('DOCID').AsString := DMCXP.cdsMovCxP.fieldbyname('DOCID').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString := DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString := DMCXP.cdsMovCxP.fieldbyname('CPNODOC').AsString;
         DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat := FRound(DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat, 7, 3);
         DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFEMIS').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFVCMTO').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFCMPRB').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('TREGID').AsString := dblcTRegistroOP.Text;
         DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'I'; // Activo
         DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString := DMCXP.wUsuario;
         DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPFREG').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime := DMCXP.cdsMovCxP.fieldbyname('CPHREG').AsDateTime;
         DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPMM').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString := DMCXP.cdsMovCxP.fieldbyname('CPDD').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString := DMCXP.cdsMovCxP.fieldbyname('CPTRI').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPSEM').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString := DMCXP.cdsMovCxP.fieldbyname('CPSS').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString := DMCXP.cdsMovCxP.fieldbyname('CPAATRI').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString := DMCXP.cdsMovCxP.fieldbyname('CPAASEM').AsString;
         DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString := DMCXP.cdsMovCxP.fieldbyname('CPAASS').AsString;
         DMCXP.cdsDetCxP.FieldByName('TMONID').AsString := DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString;
         xWhere := 'TRegId=' + '''' + dblcTRegistroOP.Text + '''';
         DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString := BuscaQry('PrvTGE', 'TGE113', 'TIPDET', xWhere, 'TIPDET');//JESUS
         DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString := DMCXP.cdsQry.fieldbyname('DCPDH').AsString;
      End
      Else
      Begin
         DMCXP.cdsDetCxP.edit;
      End;

      If xNuevoDet Then
      Begin
         If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString = DMCXP.wTMonLoc Then
         Begin
            If Length(DMCXP.cdsQry.fieldbyname('CPTOMN').AsString) > 0 Then
            Begin
               DMCXP.cdsDetCxP.Edit;
               DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString := DMCXP.cdsQry.fieldbyname('CPTOMN').AsString;
               DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := DMCXP.cdsQry.fieldbyname('CUENTAMN').AsString;
            End;
         End
         Else
         Begin
            If Length(DMCXP.cdsQry.fieldbyname('CPTOME').AsString) > 0 Then
            Begin
               DMCXP.cdsDetCxP.Edit;
               DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString := DMCXP.cdsQry.fieldbyname('CPTOME').AsString;
               DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := DMCXP.cdsQry.fieldbyname('CUENTAME').AsString;
            End;
         End;
      End;
      dblcdCnpEgrOP.Enabled := True;
      DMCXP.cdsCnpEgr.IndexFieldNames := 'CPTOID';
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
       If (DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '10') OR (DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '08') Then
      Begin
         FProvision.dblcImpuesto.Text := '';
      End;
// Fin HPC_201803_CXP
      If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '01' Then
      Begin
         FProvision.dblcImpuesto.Text := '03';
         If FProvision.dblcTDiario.Text = '19' Then FProvision.dblcImpuesto.Text := '12'; // 4ta categoría
      End;

      If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '02' Then
      Begin
         FProvision.dblcImpuesto.Text := '04';
      End;

      If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '06' Then
      Begin
         FProvision.dblcImpuesto.Text := '09';
         xCpto06 := DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString;
         xCta06 := DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString;
      End;

      If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '15' Then
      Begin
         FProvision.dblcImpuesto.Text := '14';
      End;

      If DMCXP.cdsDetCxP.FieldByName('TREGID').AsString = '21' Then
      Begin
         FProvision.dblcImpuesto.Text := '20';
      End;

      FProvision.dblcImpuesto.Enabled := False;
      FProvision.edtImpuesto.Text := DMCXP.DisplayDescrip('TGE113', 'TREGDES', 'TREGID', FProvision.dblcImpuesto.Text);
   End;
End;
// Fin HPC_201702_CXP
// Inicio HPC_201803_CXP
// Se implemento debido a la solicitud de Orden de Pago
procedure TFListaOrdenPago.dbgOrdenPagoDblClick(Sender: TObject);
Var
   xWhere: String;
begin
   If DMCXP.cdsQry1.RecordCount = 0 Then
   Begin
      ShowMessage('No se seleccionó ningún registro');
      Exit;
   End;
   dblcCiaOP.text := DMCXP.cdsQry1.fieldbyname('CIAID').AsString;
   xWhere := 'CIAID=''' + dblcCiaOP.Text + ''' ';
   edtCiaOP.Text := BuscaQry('dspTGE', 'TGE101', 'CIADES', xWhere, 'CIADES');
   If length(edtCiaOP.Text) = 0 Then
   Begin
      edtCiaOP.Text := '';
      ShowMessage('No existe la compañía');
      dblcCiaOP.setfocus;
      Exit;
   End;
   xSQL := 'Select CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV '
            + '  from TGE203 '
            + ' where CCOSMOV=' + quotedstr('S')
            + '   and CCOSCIAS LIKE (' + quotedstr('%' + DMCXP.cdsQry1.fieldbyname('CIAID').AsString + '%') + ' ) '
            + '   and CCOSACT=''S''';
   DMCXP.cdsCCosto.Close;
   DMCXP.cdsCCosto.DataRequest(xSQL);
   DMCXP.cdsCCosto.open;
   DMCXP.cdsCCosto.Filter := '';
   DMCXP.cdsCCosto.Filtered := False;
   DMCXP.cdsCCosto.IndexFieldNames := 'CCOSID';
   if DMCXP.cdsQry1.fieldbyname('CCOSID').AsString <>'' then
   begin
     DMCXP.cdsMovCxP.Edit;
     DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString:=DMCXP.cdsQry1.fieldbyname('CIAID').AsString;
     dblcTRegistroOP.Text := ValidaTipoRegistro(DMCXP.cdsQry1.fieldbyname('CIAID').AsString, DMCXP.cdsQry1.fieldbyname('DOCID').AsString, DMCXP.cdsQry1.fieldbyname('IGV').AsFloat);
     edtTRegistroOP.Text := DMCXP.DisplayDescrip('TGE113', 'TREGDES', 'TRegID', dblcTRegistroOP.Text);
     dblcdCCostoOP.Text := DMCXP.cdsQry1.fieldbyname('CCOSID').AsString  ;
//   DMCXP.cdsMovCxP.Post;
     dblcdCCostoOPExit(self);
   end
   else
   begin
     DMCXP.cdsMovCxP.Edit;
     DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString:=DMCXP.cdsQry1.fieldbyname('CIAID').AsString;
     dblcTRegistroOP.Text := ValidaTipoRegistro(DMCXP.cdsQry1.fieldbyname('CIAID').AsString, DMCXP.cdsQry1.fieldbyname('DOCID').AsString, DMCXP.cdsQry1.fieldbyname('IGV').AsFloat);
     edtTRegistroOP.Text := DMCXP.DisplayDescrip('TGE113', 'TREGDES', 'TRegID', dblcTRegistroOP.Text);
     dblcdCCostoOP.Text := ''  ;
//   DMCXP.cdsMovCxP.Post;
     edtCCostoOP.Text := '';
   end;

end;
// Fin HPC_201803_CXP
// Inicio HPC_201803_CXP
// se adiciona la lectura del Centro de Costo en la solicitud de Orden de Pago
Function TFListaOrdenPago.ValidaTipoRegistro(pCiaid, pTipDoc: String; pIgv : Double): String;
Var
   xTipReg: String;
Begin

   if (pCiaid = '02') and (pTipdoc = '01') and (pIgv >0) then
   begin
      xTipReg := '06';
      Result := xTipReg;
      exit;
   end;
   if (pCiaid = '02') and (pTipdoc = '01') and (pIgv =0) then
   begin
      xTipReg := '10';
      Result := xTipReg;
      exit;
   end;
   if (pCiaid = '02') and (pTipdoc = '14') then
   begin
      xTipReg := '02';
      Result := xTipReg;
      exit;
   end;
   if (pTipdoc = '69') then
   begin
      xTipReg := '08';
      Result := xTipReg;
      exit;
   end;
   if (pCiaid = '15') and (pTipdoc = '01') and (pIgv >0) then
   begin
      xTipReg := '06';
      Result := xTipReg;
      exit;
   end;
   if (pCiaid = '15') and (pTipdoc = '01') and (pIgv =0) then
   begin
      xTipReg := '10';
      Result := xTipReg;
      exit;
   end;
   if ((pCiaid <> '02') or (pCiaid<>'15'))  and (pTipdoc = '01') and (pIgv >0) then
   begin
      xTipReg := '01';
      Result := xTipReg;
      exit;
   end;
   if ((pCiaid <> '02') or (pCiaid<>'15'))  and (pTipdoc = '01') and (pIgv =0) then
   begin
      xTipReg := '10';
      Result := xTipReg;
      exit;
   end;

End;
// Fin HPC_201803_CXP
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
procedure TFListaOrdenPago.dblcCiaOPEnter(Sender: TObject);
var
   xSQL:String;
begin
   DMCXP.cdsciaOP.Filter := '';
   xSQL := 'SELECT CIAID,CIADES FROM TGE101 WHERE 1=1 ';
   Filtracds(DMCXP.cdsciaOP, xSQL);
   dblcCiaOP.LookupField := 'CIAID';
   dblcCiaOP.LookupTable := DMCXP.cdsciaOP;
end;
// Fin HPC_201803_CXP
// Inicio HPC_201803_CXP
// Se implementa debido a la solicitud de Orden de Pago
procedure TFListaOrdenPago.dblcCiaOPExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CIAID=''' + dblcCiaOP.Text + ''' ';
   edtCiaOP.Text := BuscaQry('dspTGE', 'TGE101', 'CIADES', xWhere, 'CIADES');

   If length(edtCiaOP.Text) = 0 Then
   Begin
      edtCiaOP.Text := '';
      ShowMessage('No existe la compañía');
      dblcCiaOP.setfocus;
      Exit;
   End;

   xSQL := 'Select CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV '
            + '  from TGE203 '
            + ' where CCOSMOV=' + quotedstr('S')
            + '   and CCOSCIAS LIKE (' + quotedstr('%' + dblcCiaOP.Text + '%') + ' ) '
            + '   and CCOSACT=''S''';
   DMCXP.cdsCCosto.Close;
   DMCXP.cdsCCosto.DataRequest(xSQL);
   DMCXP.cdsCCosto.open;
   DMCXP.cdsCCosto.Filter := '';
   DMCXP.cdsCCosto.Filtered := False;
   DMCXP.cdsCCosto.IndexFieldNames := 'CCOSID';
   if DMCXP.cdsQry1.fieldbyname('CCOSID').AsString <>'' then
   begin
     DMCXP.cdsMovCxP.Edit;
     DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString:=dblcCiaOP.Text;
     dblcTRegistroOP.Text := ValidaTipoRegistro(dblcCiaOP.Text, DMCXP.cdsQry1.fieldbyname('DOCID').AsString, DMCXP.cdsQry1.fieldbyname('IGV').AsFloat);
     edtTRegistroOP.Text := DMCXP.DisplayDescrip('TGE113', 'TREGDES', 'TRegID', dblcTRegistroOP.Text);
     dblcdCCostoOP.Text := DMCXP.cdsQry1.fieldbyname('CCOSID').AsString  ;
//   DMCXP.cdsMovCxP.Post;
     dblcdCCostoOPExit(self);
   end
   else
   begin
     DMCXP.cdsMovCxP.Edit;
     DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString:=dblcCiaOP.Text;
     dblcTRegistroOP.Text := ValidaTipoRegistro(dblcCiaOP.Text, DMCXP.cdsQry1.fieldbyname('DOCID').AsString, DMCXP.cdsQry1.fieldbyname('IGV').AsFloat);
     edtTRegistroOP.Text := DMCXP.DisplayDescrip('TGE113', 'TREGDES', 'TRegID', dblcTRegistroOP.Text);
     dblcdCCostoOP.Text := ''  ;
//   DMCXP.cdsMovCxP.Post;
     edtCCostoOP.Text := '';
   end;
   AsignaLookup;
 AsignaDatasource;
end;
// Fin HPC_201803_CXP
end.



