unit CxP101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls, Buttons;

type
  TFReglasNeg = class(TForm)
    pnlRegla1: TPanel;
    Label1: TLabel;
    rgOCompra: TRadioGroup;
    pnlRegla2: TPanel;
    Label2: TLabel;
    rgOPago: TRadioGroup;
    pnlRegla3: TPanel;
    Label3: TLabel;
    rgPParciales: TRadioGroup;
    pnlRegla4: TPanel;
    Label4: TLabel;
    rgTCambio: TRadioGroup;
    rgTCFijo: TRadioGroup;
    Label5: TLabel;
    bbtnOk: TBitBtn;
    procedure bbtnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReglasNeg: TFReglasNeg;

implementation
{$R *.DFM}

uses CxPDM;

procedure TFReglasNeg.bbtnOkClick(Sender: TObject);
begin

   case rgOCompra.ItemIndex of
      0 : DMCXP.wVRN_OrdenCompra := 'S';
      1 : DMCXP.wVRN_OrdenCompra := 'N';
      2 : DMCXP.wVRN_OrdenCompra := 'O';
   end;
   case rgOPago.ItemIndex of
      0 : DMCXP.wVRN_OrdenPago := 'S';
      1 : DMCXP.wVRN_OrdenPago := 'N';
   end;
   case rgPParciales.ItemIndex of
      0 : DMCXP.wVRN_PagosParciales := 'S';
      1 : DMCXP.wVRN_PagosParciales := 'N';
   end;
   case rgTCambio.ItemIndex of
      0 : DMCXP.wVRN_TipoCambio := 'VBC';
      1 : DMCXP.wVRN_TipoCambio := 'VBV';
      2 : DMCXP.wVRN_TipoCambio := 'VPC';
      3 : DMCXP.wVRN_TipoCambio := 'VPV';
      4 : DMCXP.wVRN_TipoCambio := 'VOC';
      5 : DMCXP.wVRN_TipoCambio := 'VOV';
      6 : DMCXP.wVRN_TipoCambio := 'VXC';
      7 : DMCXP.wVRN_TipoCambio := 'VXV';
   end;
   case rgTCFijo.ItemIndex of
      0 : DMCXP.wVRN_TCambioFijo := 'N';
      1 : DMCXP.wVRN_TCambioFijo := 'S';
   end;

   if DMCXP.cdsReglas.RecordCount=0 then
      DMCXP.cdsReglas.Insert
   else begin
      DMCXP.cdsReglas.First;
      DMCXP.cdsReglas.Edit;
   end;

   DMCXP.cdsReglas.FieldByName('VRN_OCOMPRA').AsString := DMCXP.wVRN_OrdenCompra;
   DMCXP.cdsReglas.FieldByName('VRN_OPAGO').AsString   := DMCXP.wVRN_OrdenPago;
   DMCXP.cdsReglas.FieldByName('VRN_PAGOSP').AsString  := DMCXP.wVRN_PagosParciales;
   DMCXP.cdsReglas.FieldByName('VRN_TCAMBIO').AsString := DMCXP.wVRN_TipoCambio;
   DMCXP.cdsReglas.FieldByName('VRN_TCFIJO').AsString  := DMCXP.wVRN_TCambioFijo;
   DMCXP.cdsReglas.ApplyUpdates( 0 );
end;

procedure TFReglasNeg.FormActivate(Sender: TObject);
begin
   If DMCXP.cdsReglas.RecordCount>0 then begin

      DMCXP.cdsReglas.First;

      DMCXP.wVRN_OrdenCompra   := DMCXP.cdsReglas.FieldByName('VRN_OCOMPRA').AsString;
      DMCXP.wVRN_OrdenPago     := DMCXP.cdsReglas.FieldByName('VRN_OPAGO').AsString;
      DMCXP.wVRN_PagosParciales:= DMCXP.cdsReglas.FieldByName('VRN_PAGOSP').AsString;
      DMCXP.wVRN_TipoCambio    := DMCXP.cdsReglas.FieldByName('VRN_TCAMBIO').AsString;
      DMCXP.wVRN_TCambioFijo   := DMCXP.cdsReglas.FieldByName('VRN_TCFIJO').AsString;

      If DMCXP.wVRN_OrdenCompra='S' then
         rgOCompra.ItemIndex := 0
      else begin
         if DMCXP.wVRN_OrdenCompra='N' then
            rgOCompra.ItemIndex := 1
         else
            if DMCXP.wVRN_OrdenCompra='O' then
               rgOCompra.ItemIndex := 2;
      end;

      If DMCXP.wVRN_OrdenPago='S' then
         rgOPago.ItemIndex := 0
      else begin
         rgOPago.ItemIndex := 1;
      end;

      if DMCXP.wVRN_PagosParciales='S' then
         rgPParciales.ItemIndex := 0
      else begin
         rgPParciales.ItemIndex := 1;
      end;

      If DMCXP.wVRN_TipoCambio='VBC' then
         rgTCambio.ItemIndex := 0
      else begin
         if DMCXP.wVRN_TipoCambio='VBV' then
            rgTCambio.ItemIndex := 1
         else
            if DMCXP.wVRN_TipoCambio='VPC' then
               rgTCambio.ItemIndex := 2
            else
               if DMCXP.wVRN_TipoCambio='VPV' then
                  rgTCambio.ItemIndex := 3
               else
                  if DMCXP.wVRN_TipoCambio='VOC' then
                     rgTCambio.ItemIndex := 4
                  else
                     if DMCXP.wVRN_TipoCambio='VOV' then
                        rgTCambio.ItemIndex := 5
                     else
                        if DMCXP.wVRN_TipoCambio='VXC' then
                           rgTCambio.ItemIndex := 6
                        else
                           if DMCXP.wVRN_TipoCambio='VXV' then
                              rgTCambio.ItemIndex := 7
      end;

      if DMCXP.wVRN_TCambioFijo='N' then
         rgTCFijo.ItemIndex := 0
      else begin
         rgTCFijo.ItemIndex := 1;
      end;

   end;
end;

procedure TFReglasNeg.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFReglasNeg.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.
