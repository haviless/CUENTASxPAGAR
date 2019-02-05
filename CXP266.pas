unit CxP266;

// Actualizaciones    :
// HPC_201414_CXP  04/12/2014  Regularización Automatización de generación de la retención de IGV
// HPC_201504_CXP  20/10/2015  Se modificó e formulario adicionando nuevos campos de registro
//                             Otros Descuentos y un campo de Observación
// HPC_201602_CXP  15/03/2016  DAF_2015001728_CXP_1 Se ajustó filtro de actualización.
//                             Se añadió clase y código de Proveedor
// HPC_201604_CXP  08/09/2016  DAF_2015001979_CXP_1 Se añadio Cuenta Contable a otros descuentos de Recibos por Honorarios
// HPC_201701_CXP  17/01/2016  DAF_2016000288_CXP_1 Se habilitó otros descuentos, cuenta contable y centro de costo a otros documentos 
// HPC_201707_CXP              Ajuste en la opción de Nota de Crédito
//

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, wwdbedit, ExtCtrls, wwdblook, Wwdbdlg;

type
  TFEditaOP = class(TForm)
    dbeRetencion: TwwDBEdit;
    bbtnOk: TBitBtn;
    lblRetencion: TLabel;
    pnlCab: TPanel;
    lblSaldo: TLabel;
    lblImporte: TLabel;
    dbeImporte: TwwDBEdit;
    dbeSaldo: TwwDBEdit;
    bbtnCamb: TBitBtn;
    lblOtroDscto: TLabel;
    dbeotrosdesc: TwwDBEdit;
    lblObservac: TLabel;
    dbeObservacion: TwwDBEdit;
    lblCtaCntOtrDcto: TLabel;
    edtCtaCnt: TEdit;
    dblcdCtaCnt: TwwDBLookupComboDlg;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
    Label1: TLabel;
    dbeDetraccion: TwwDBEdit;
    lblCCosto: TLabel;
    dblcdCCosto: TwwDBLookupComboDlg;
    edtCCosto: TEdit;
// Fin HPC_201707_CXP
    procedure bbtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnCambClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeRetencionExit(Sender: TObject);
    procedure dbeotrosdescExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcdCtaCntExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
    procedure dblcdCtaCntChange(Sender: TObject);
    procedure dblcdCCostoExit(Sender: TObject);
    procedure dbeotrosdescEnter(Sender: TObject);
// Fin HPC_201707_CXP
  private
    { Private declarations }
  public
    { Public declarations }
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
    xOtrosDsto,xImppago : Double;
// Fin HPC_201707_CXP
  end;

var
  FEditaOP: TFEditaOP;

implementation

{$R *.dfm}

USES CXPDM, CXP264;

procedure TFEditaOP.bbtnOkClick(Sender: TObject);
var
   xSQL : String;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   xOtrosDesc, xImporte : Double;
// Fin HPC_201707_CXP
begin
// Inicio HPC_201604_CXP
//  if FRound( DMCXP.cdsDetallePres.FieldByname('IMPPAGO').AsFloat+DMCXP.cdsDetallePres.FieldByname('IMPRETE').AsFloat,15,2 )<=
//     FRound( DMCXP.cdsDetallePres.FieldByname('CPSALORI').AsFloat,15,2) then

  if FRound(DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsFloat,15,2 )>=0 then
  begin
     DMCXP.cdsDetallePres.Edit;
//     DMCXP.cdsDetallePres.fieldByname('CPMTOORI').AsFloat := StrTofloat(dbeSaldo.Text);
//     DMCXP.cdsDetallePres.fieldByname('CPSALORI').AsFloat  := StrTofloat(dbeSaldo.Text);
//     DMCXP.cdsDetallePres.fieldByname('IMPRETE').AsFloat := StrTofloat(dbeRetencion.Text);
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
     If ((length(dbeotrosdesc.Text) > 0) And  (length(dblcdCtaCnt.Text) =0)) Then
     Begin
            ShowMessage('Falta ingresar una Cuenta');
            Exit;
     End;
     If DMCXP.cdsQry5.FieldByName('CTA_CCOS').AsString = 'S' Then
     Begin
         If length(dblcdCCosto.Text)= 0 then
         Begin
            ShowMessage('Debe indicar un Centro de Costo');
            Exit;
         End;
     End;
     If length(dbeotrosdesc.Text)>0 Then
     Begin
         xOtrosDesc := StrTofloat(dbeotrosdesc.Text);
     End
     Else
     Begin
         xOtrosDesc := 0.0;
     End;
     If length(dbeImporte.Text)>0 Then
     Begin
        xImporte := StrTofloat(dbeImporte.Text);
     End
     Else
     Begin
        xImporte := 0.0;
     End;
     //DMCXP.cdsDetallePres.fieldByname('IMPOTRDTO').AsFloat := StrTofloat(dbeotrosdesc.Text);
     DMCXP.cdsDetallePres.fieldByname('IMPOTRDTO').AsFloat := xOtrosDesc;

// Fin HPC_201707_CXP
     DMCXP.cdsDetallePres.fieldByname('OBSERVA').AsString := dbeObservacion.Text;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
     //DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsFloat := StrTofloat(dbeImporte.Text);
     DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsFloat := xImporte;
// Fin HPC_201707_CXP
     DMCXP.cdsDetallePres.fieldByname('CTAOTRDTO').AsString := dblcdCtaCnt.Text;
     DMCXP.cdsDetallePres.Post;
     xSQL := 'Update CXP_ORD_PAG_DET '
            +'   set CPMTOORI='+FloatToStr(DMCXP.cdsDetallePres.FieldByName('CPMTOORI').AsFloat)+', '
            +'       CPSALORI='+FloatToStr(DMCXP.cdsDetallePres.FieldByName('CPSALORI').AsFloat)+', '
            +'       IMPPAGO='+FloatToStr(DMCXP.cdsDetallePres.FieldByName('IMPPAGO').AsFloat)+', '
            +'       IMPRETE='+FloatToStr(DMCXP.cdsDetallePres.FieldByName('IMPRETE').AsFloat)+', '
            +'       IMPOTRDTO='+FloatToStr(DMCXP.cdsDetallePres.FieldByName('IMPOTRDTO').AsFloat)+', '
            +'       OBSERVA='+quotedstr(DMCXP.cdsDetallePres.fieldByname('OBSERVA').AsString)+', '
            +'       CTAOTRDTO='+quotedstr(DMCXP.cdsDetallePres.fieldByname('CTAOTRDTO').AsString )+' '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            +'       ,CCOSID='+quotedstr(dblcdCCosto.Text )+' '
// Fin HPC_201707_CXP
            +' where CIAID='+quotedstr(DMCXP.cdsDetallePres.fieldByname('CIAID').AsString)
            +'   and NUMERO='+quotedstr(DMCXP.cdsDetallePres.fieldByname('NUMERO').AsString)
            +'   and CLAUXID='+quotedstr(DMCXP.cdsDetallePres.fieldByname('CLAUXID').AsString)
            +'   and AUXID='+quotedstr(DMCXP.cdsDetallePres.fieldByname('AUXID').AsString)
            +'   and DOCID='+quotedstr(DMCXP.cdsDetallePres.fieldByname('DOCID').AsString)
            +'   and CPSERIE='+quotedstr(DMCXP.cdsDetallePres.fieldByname('CPSERIE').AsString)
            +'   and CPNODOC='+quotedstr(DMCXP.cdsDetallePres.fieldByname('CPNODOC').AsString);
     Try
        DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
     Except
        ShowMessage('Error en la Actualización del detalle de la Orden de Pago');
        Exit;
     End;
     Close;
// Fin HPC_201604_CXP
  end
  else
  begin
     ShowMessage('Importe a Pagar es mayor al Saldo');
  end;
end;

procedure TFEditaOP.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFEditaOP.bbtnCambClick(Sender: TObject);
begin
  DMCXP.cdsDetallePres.Edit;
  DMCXP.cdsDetallePres.FieldByname('IMPRETE').AsFloat:=FRound(DMCXP.cdsDetallePres.FieldByname('CPMTOORI').AsFloat
                                                             -DMCXP.cdsDetallePres.FieldByname('IMPPAGO').AsFloat
                                                             -DMCXP.cdsDetallePres.FieldByname('IMPOTRDTO').AsFloat,
                                                             -15,2);
  DMCXP.cdsDetallePres.Post
end;

procedure TFEditaOP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// Inicio HPC_201604_CXP
   DMCXP.cdsQry5.Close;
   DMCXP.cdsQry5.IndexFieldNames := '';
// Fin HPC_201604_CXP
  FOrdenPagoCab.FormActivate(Sender);
end;

procedure TFEditaOP.dbeRetencionExit(Sender: TObject);
begin
  DMCXP.cdsDetallePres.Edit;
//  DMCXP.cdsDetallePres.FieldByname('IMPPAGO').AsFloat:=FRound(DMCXP.cdsDetallePres.FieldByname('CPSALORI').AsFloat-DMCXP.cdsDetallePres.FieldByname('IMPRETE').AsFloat-DMCXP.cdsDetallePres.FieldByname('IMPOTRDTO').AsFloat,15,2);
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
  if DMCXP.cdsDetallePres.fieldByname('PROVRETIGV').AsString = 'N' then
  begin
    DMCXP.cdsDetallePres.FieldByname('IMPPAGO').AsFloat:=FRound(DMCXP.cdsDetallePres.FieldByname('CPMTOORI').AsFloat
                                                             -DMCXP.cdsDetallePres.FieldByname('IMPOTRDTO').AsFloat,15,2);
  end
  else
  begin
    DMCXP.cdsDetallePres.FieldByname('IMPPAGO').AsFloat:=FRound(DMCXP.cdsDetallePres.FieldByname('CPMTOORI').AsFloat
                                                             -DMCXP.cdsDetallePres.FieldByname('IMPRETE').AsFloat
                                                             -DMCXP.cdsDetallePres.FieldByname('IMPOTRDTO').AsFloat,15,2);
  end;
// Fin HPC_201707_CXP
  DMCXP.cdsDetallePres.Post
end;

procedure TFEditaOP.dbeotrosdescExit(Sender: TObject);
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
var
  xImprete : Double;
// Fin HPC_201707_CXP
begin
  DMCXP.cdsDetallePres.Edit;

// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
  //DMCXP.cdsDetallePres.FieldByname('IMPPAGO').AsFloat:=FRound(DMCXP.cdsDetallePres.FieldByname('CPSALORI').AsFloat-DMCXP.cdsDetallePres.FieldByname('IMPRETE').AsFloat-DMCXP.cdsDetallePres.FieldByname('IMPOTRDTO').AsFloat,15,2);
 if DMCXP.cdsDetallePres.fieldByname('PROVRETIGV').AsString = 'N' then
  begin
     dbeRetencion.Text := floattostr(0);
     dbeDetraccion.Text := floattostr(DMCXP.cdsDetallePres.fieldByname('IMPRETE').AsFloat);
     DMCXP.cdsDetallePres.FieldByname('IMPPAGO').AsFloat:=FRound(DMCXP.cdsDetallePres.FieldByname('CPSALORI').AsFloat
                                                             -DMCXP.cdsDetallePres.FieldByname('IMPOTRDTO').AsFloat,15,2);
  end
  else
  begin
     dbeRetencion.Text := floattostr(DMCXP.cdsDetallePres.fieldByname('IMPRETE').AsFloat);
     dbeDetraccion.Text := floattostr(0);
     DMCXP.cdsDetallePres.FieldByname('IMPPAGO').AsFloat:=FRound(DMCXP.cdsDetallePres.FieldByname('CPSALORI').AsFloat
                                                             -DMCXP.cdsDetallePres.FieldByname('IMPRETE').AsFloat
                                                             -DMCXP.cdsDetallePres.FieldByname('IMPOTRDTO').AsFloat,15,2);
  end;
// Fin HPC_201707_CXP
  DMCXP.cdsDetallePres.Post
end;

procedure TFEditaOP.FormActivate(Sender: TObject);
var
   xFiltro : String;
// Inicio HPC_201604_CXP
   xReciboxHon : Boolean;
// Fin HPC_201604_CXP
begin
   xFiltro:='Select DOCID, DOCMOD, DOCDES, DOCABR, DOC_FREG, TDIARID, TDIARID2, DOCTIPREG, '
      +     '       DOCRESTA, COADOCID, FCING, DOCCONTA, DOCIDORIG, F_EMIDOC, DOCPROV, '
      +     '       DOCRECCAJ, DOCPLAZO, REFALM, URQALM, DOCRETIGV, GRACIAVCTO, DOCLENGTH, '
      +     '       DOCAF, DTRAFECTO, TDOC_SUNAT, AFEC_REGPENSION, AFEC_REND_CXP, '
      +     '       TDIARID_REND, RETENCION, FLAG_MOSTRAR_DOC, DETRACCION1 '
      +     '  from TGE110 '
      +     ' where DOCMOD=''CXP'' '
      +     '   and DOCTIPREG=''4C'' '
      +     '   and DOCID='+quotedstr(DMCXP.cdsDetallePres.fieldByname('DOCID').AsString)+'';
	DMCXP.cdsQry.Close;
	DMCXP.cdsQry.DataRequest( xFiltro );
	DMCXP.cdsQry.Open;
// Inicio HPC_201604_CXP
// DAF_2015001979_CXP_1  8/9/2016
   xReciboxHon := False;
//   if DMCXP.cdsQry.recordcount > 0 then
   begin
      xFiltro := 'Select CUENTAID, CTADES, CTA_MOV '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
         +       '  ,CTA_CCOS '
// Fin HPC_201707_CXP
         +       '  From TGE202 '
         +       ' Where CIAID='+quotedstr(FOrdenPagoCab.dblcCia.Text)
      //   +       '   and CUENTAID like ''16%'' '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      //    +       '   and CTA_CCOS=''N'' '
// Fin HPC_201707_CXP
         +       '   and CTAACT=''S'' ';
      DMCXP.cdsQry5.Close;
      DMCXP.cdsQry5.DataRequest(xFiltro);
      DMCXP.cdsQry5.Open;
      DMCXP.cdsQry5.IndexFieldNames := 'CUENTAID';
      xReciboxHon := True;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
      xFiltro := 'Select CCOSID,CCOSDES '
         +       '  From tge203 '
         +       ' Where CCOSMOV = ''S'' AND '
         +       '  CCOSACT=''S'' ';
      DMCXP.cdsQryCCosto.Close;
      DMCXP.cdsQryCCosto.DataRequest(xFiltro);
      DMCXP.cdsQryCCosto.Open;
      DMCXP.cdsQryCCosto.IndexFieldNames := 'CCOSID';
// Fin HPC_201707_CXP
   end;

   edtCtaCnt.Text := '';
   dbeSaldo.Text := floattostr(DMCXP.cdsDetallePres.fieldByname('CPMTOORI').AsFloat);
//   dbeSaldo.Text := floattostr(DMCXP.cdsDetallePres.fieldByname('CPSALORI').AsFloat);
   dbeImporte.Text := floattostr(DMCXP.cdsDetallePres.fieldByname('IMPPAGO').AsFloat);
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito

   xImppago :=  DMCXP.cdsDetallePres.FieldByname('IMPPAGO').AsFloat;

   if DMCXP.cdsDetallePres.fieldByname('PROVRETIGV').AsString = 'N' then
   begin
     dbeRetencion.Text := floattostr(0);
     dbeDetraccion.Text := floattostr(DMCXP.cdsDetallePres.fieldByname('IMPRETE').AsFloat);
   end
   else
   begin
     dbeRetencion.Text := floattostr(DMCXP.cdsDetallePres.fieldByname('IMPRETE').AsFloat);
     dbeDetraccion.Text := floattostr(0);
   end;
// Fin HPC_201707_CXP
   dbeotrosdesc.Text := floattostr(DMCXP.cdsDetallePres.fieldByname('IMPOTRDTO').AsFloat);
   dbeObservacion.Text := DMCXP.cdsDetallePres.fieldByname('OBSERVA').AsString;
   dblcdCtaCnt.Text := DMCXP.cdsDetallePres.fieldByname('CTAOTRDTO').AsString;
   If length(dblcdCtaCnt.Text)>0 then
   Begin
      edtCtaCnt.Text := BuscaQry('dspTGE', 'TGE202', 'CTADES', 'CIAID='+quotedstr(FOrdenPagoCab.dblcCia.Text)+' and CUENTAID='+quotedstr(dblcdCtaCnt.Text), 'CTADES');
   End;

   If FOrdenPagoCab.edtEstado.Text<>'INICIAL' then
   Begin
      dbeRetencion.Enabled := False;
      dbeotrosdesc.Enabled := False;
      dblcdCtaCnt.Enabled := False;
      dbeObservacion.Enabled := False;
      bbtnOk.Enabled := False;
   End
   Else
   Begin
      bbtnOk.Enabled := True;
      If xReciboxHon then
   //   if  DMCXP.cdsQry.recordcount <> 0 then
      Begin
         dbeRetencion.enabled := false;
         dbeotrosdesc.enabled := true;
         dblcdCtaCnt.enabled := true;
         dbeObservacion.enabled := true;
   //      DMCXP.cdsDetallePres.Edit;
   //      DMCXP.cdsDetallePres.fieldByname('IMPRETE').AsFloat := 0;
   //      DMCXP.cdsDetallePres.Post;
      End
      Else
      Begin
         dbeRetencion.enabled := True;
         dbeotrosdesc.enabled := false;
         dblcdCtaCnt.enabled := False;
         dbeObservacion.enabled := false;
   //      DMCXP.cdsDetallePres.Edit;
   //      DMCXP.cdsDetallePres.fieldByname('IMPOTRDTO').AsFloat := 0;
   //      DMCXP.cdsDetallePres.fieldByname('OBSERVA').AsString := '';
   //      DMCXP.cdsDetallePres.Post;
      End;
   End;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   If length(DMCXP.cdsDetallePres.fieldByname('CCOSID').AsString)>0 Then
   Begin
       lblCCosto.Visible := true;
       dblcdCCosto.Visible := true;
       edtCCosto.Visible := true;

       dblcdCCosto.Text := DMCXP.cdsDetallePres.fieldByname('CCOSID').AsString;
       edtCCosto.Text := BuscaQry('dspTGE', 'TGE203', 'CCOSDES', 'CCOSID='+quotedstr(dblcdCCosto.Text), 'CCOSDES');
       
       lblObservac.Top := 172;
       lblObservac.Left := 15;
       dbeObservacion.Top := 170;
       dbeObservacion.Left := 140;

       lblImporte.Top := 202;
       lblImporte.Left := 15;
       dbeImporte.Top := 200;
       dbeImporte.Left := 140;

       bbtnOk.Top := 221;
       bbtnOk.Left := 426;

       FEditaOP.ClientHeight := 273;
       FEditaOP.ClientWidth := 492;
   End
   Else
   Begin
       lblCCosto.Visible := false;
       dblcdCCosto.Visible := false;
       edtCCosto.Visible := false;

       lblObservac.Top := 141;
       lblObservac.Left := 14;
       dbeObservacion.Top := 139;
       dbeObservacion.Left := 139;

       lblImporte.Top := 172;
       lblImporte.Left := 15;
       dbeImporte.Top := 170;
       dbeImporte.Left := 140;

       bbtnOk.Top := 197;
       bbtnOk.Left := 426;

       FEditaOP.ClientHeight := 239;
       FEditaOP.ClientWidth := 492;
   End;
// Fin HPC_201707_CXP
// Fin HPC_201604_CXP
end;

// Inicio HPC_201604_CXP
// DAF_2015001979_CXP_1  8/9/2016
procedure TFEditaOP.dblcdCtaCntExit(Sender: TObject);
var
   xSQL : String;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   xWhere : String;
// Fin HPC_201707_CXP
begin
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito

  { DMCXP.cdsQry5.Filter := '';
   DMCXP.cdsQry5.Filter := 'CUENTAID = '''+dblcdCtaCnt.Text+''' ';
   DMCXP.cdsQry5.Filtered := true;   }
   //edtCtaCnt.Text := '';
// Fin HPC_201707_CXP
   If length(dblcdCtaCnt.Text)= 0 then
   Begin
      ShowMessage('Debe indicar la Cuenta Contable asociado al Descuento');
      dblcdCtaCnt.SetFocus;
      Exit;
   End;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   If DMCXP.cdsQry5.Locate('CUENTAID', VarArrayOf([DMCXP.cdsQry5.FieldByName('CUENTAID').AsString]),[]) Then
        edtCtaCnt.Text := DMCXP.cdsQry5.FieldByName('CTADES').AsString
   Else edtCtaCnt.Text := 'SIN DESCRIPCIÓN';
   dblcdCtaCnt.Text := DMCXP.cdsQry5.FieldByName('CUENTAID').AsString;
// Fin HPC_201707_CXP
   DMCXP.cdsQry5.SetKey;
   DMCXP.cdsQry5.FieldByName('CUENTAID').AsString := dblcdCtaCnt.Text;
   If not DMCXP.cdsQry5.GotoKey then
   Begin
      ShowMessage('Cuenta Contable no encontrada');
      dblcdCtaCnt.SetFocus;
      Exit;
   End;
   If DMCXP.cdsQry5.FieldByName('CTA_MOV').AsString <> 'S' then
   Begin
      ShowMessage('Sólo se pueden indicar Cuentas de Movimiento');
      dblcdCtaCnt.SetFocus;
      Exit;
   End;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   //edtCtaCnt.Text := DMCXP.cdsQry5.FieldByName('CTADES').AsString;
   //xWhere := 'CIAID=' + quotedstr(FOrdenPagoCab.dblcCia.Text) + ' and CUENTAID=''' + dblcdCtaCnt.Text + ''' and CTA_CCOS=''N'' and CTAACT=''S'' ';
   //edtCtaCnt.Text := BuscaQry('dspTGE', 'TGE202', 'CUENTAID, CTADES, CTA_MOV', xWhere, 'CTADES');
// Fin HPC_201707_CXP
   edtCtaCnt.Text := DMCXP.cdsQry5.FieldByName('CTADES').AsString;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
 {
   DMCXP.cdsQry5.Filter := '';
   DMCXP.cdsDetallePres.Filtered := false;
}
   If DMCXP.cdsQry5.FieldByName('CTA_CCOS').AsString = 'S' Then
   Begin
     lblCCosto.Visible := true;
     dblcdCCosto.Visible := true;
     edtCCosto.Visible := true;

     lblObservac.Top := 172;
     lblObservac.Left := 15;
     dbeObservacion.Top := 170;
     dbeObservacion.Left := 140;

     lblImporte.Top := 202;
     lblImporte.Left := 15;
     dbeImporte.Top := 200;
     dbeImporte.Left := 140;

     bbtnOk.Top := 221;
     bbtnOk.Left := 426;

     FEditaOP.ClientHeight := 273;
     FEditaOP.ClientWidth := 492;
   End
   Else
   Begin
     dblcdCCosto.Text := '';
     edtCCosto.Text := '';

     lblCCosto.Visible := false;
     dblcdCCosto.Visible := false;
     edtCCosto.Visible := false;

     lblObservac.Top := 141;
     lblObservac.Left := 14;
     dbeObservacion.Top := 139;
     dbeObservacion.Left := 139;

     lblImporte.Top := 172;
     lblImporte.Left := 15;
     dbeImporte.Top := 170;
     dbeImporte.Left := 140;

     bbtnOk.Top := 197;
     bbtnOk.Left := 426;

     FEditaOP.ClientHeight := 239;
     FEditaOP.ClientWidth := 492;
   End;

// Fin HPC_201707_CXP
end;
// Fin: HPC_201604_CXP

// Inicio HPC_201604_CXP
// DAF_2015001979_CXP_1  8/9/2016
procedure TFEditaOP.FormCreate(Sender: TObject);
begin
   dblcdCtaCnt.LookUpField := 'CUENTAID';
   dblcdCtaCnt.LookUpTable := DMCXP.cdsQry5;
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   dblcdCCosto.LookUpField := 'CCOSID';
   dblcdCCosto.LookUpTable := DMCXP.cdsQryCCosto;
// Fin HPC_201707_CXP
   dblcdCtaCnt.Selected.Clear;
   dblcdCtaCnt.Selected.Add('CUENTAID'#9'10'#9'Cuenta~Id'#9'F');
   dblcdCtaCnt.Selected.Add('CTADES'#9'30'#9'Cuenta~Desc'#9'F');
   dblcdCtaCnt.Selected.Add('CTA_MOV'#9'3'#9'Mov'#9'F');
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
   dblcdCCosto.Selected.Clear;
   dblcdCCosto.Selected.Add('CCOSID'#9'10'#9'C.Costo~Id'#9'F');
   dblcdCCosto.Selected.Add('CCOSDES'#9'30'#9'C.Costo~Desc'#9'F');
// Fin HPC_201707_CXP
end;
// Fin: HPC_201604_CXP
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
procedure TFEditaOP.dblcdCtaCntChange(Sender: TObject);
begin
{  If DMCXP.cdsQry5.Locate('CUENTAID', VarArrayOf([dblcdCtaCnt.Text]),[]) Then
        edtCtaCnt.Text := DMCXP.cdsQry5.FieldByName('CTADES').AsString
   Else edtCtaCnt.Text := 'SIN DESCRIPCIÓN';     }
end;
// Fin HPC_201707_CXP

// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
procedure TFEditaOP.dblcdCCostoExit(Sender: TObject);
var
   xWhere: String;
begin
   xWhere := 'CCOSID=''' + dblcdCCosto.Text + ''' and CCOSMOV=''S'' AND CCOSACT=''S'' ';
   edtCCosto.Text := BuscaQry('dspTGE', 'TGE203', 'CCOSDES', xWhere, 'CCOSDES');

   If length(edtCCosto.Text) = 0 Then
   Begin
      edtCCosto.Text := '';
      ShowMessage('Centro de Costo NO esta Activo');
      dblcdCCosto.setfocus;
      Exit;
   End;

end;
// Fin HPC_201707_CXP

// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
procedure TFEditaOP.dbeotrosdescEnter(Sender: TObject);
begin
    If  length(dbeotrosdesc.Text)>0 Then
    Begin
         xOtrosDsto := strtofloat(dbeotrosdesc.Text);
    End
    Else
    Begin
         dbeotrosdesc.Text := '0';
         xOtrosDsto := 0;
    End;

end;
// Fin HPC_201707_CXP
end.

