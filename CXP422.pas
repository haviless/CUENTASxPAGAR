unit CXP422;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, wwDataInspector;

type
  TFMantRegCompPLE_xReg = class(TForm)
    wwDataInspector1: TwwDataInspector;
    bbtnValida: TBitBtn;
    bbtnRegCanc: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure bbtnValidaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnRegCancClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMantRegCompPLE_xReg: TFMantRegCompPLE_xReg;
  xsSQL : String;

implementation

uses CXPDM, CxP401;

{$R *.dfm}

procedure TFMantRegCompPLE_xReg.FormShow(Sender: TObject);
begin
{
   dbgRegCompPLE.Selected.Add('PERIODO'#9'8'#9'Periodo'#9'F');
   dbgRegCompPLE.Selected.Add('CORRELATIVO'#9'10'#9'Correlativo'#9'F');
   dbgRegCompPLE.Selected.Add('FECEMI'#9'10'#9'Fecha~Emisión'#9'F');
   dbgRegCompPLE.Selected.Add('FECPAG'#9'10'#9'Fecha~Pago'#9'F');
   dbgRegCompPLE.Selected.Add('DOCID'#9'8'#9'Tipo~Doc'#9'F');
   dbgRegCompPLE.Selected.Add('CPSERIE'#9'8'#9'Serie'#9'F');
   dbgRegCompPLE.Selected.Add('ANIO'#9'8'#9'Año'#9'F');
   dbgRegCompPLE.Selected.Add('CPNODOC'#9'15'#9'Número~Documento'#9'F');

   dbgRegCompPLE.Selected.Add('ADQNOGRAV'#9'10'#9'Adquis~No Gravadas'#9'F');
   dbgRegCompPLE.Selected.Add('BASIMPGAS'#9'10'#9'Adq.Gravadas~p/Oper No Grav'#9'F');
   dbgRegCompPLE.Selected.Add('IGVGAS'#9'10'#9'IGV Gasto'#9'F');

   dbgRegCompPLE.Selected.Add('BASIMPMIX'#9'10'#9'B.Imp. Mixta'#9'F');
   dbgRegCompPLE.Selected.Add('IGVMIX'#9'10'#9'IGV Mixto'#9'F');

   dbgRegCompPLE.Selected.Add('BASIMP'#9'10'#9'Gravado'#9'F');
   dbgRegCompPLE.Selected.Add('IGV'#9'10'#9'IGV Gravado'#9'F');

   dbgRegCompPLE.Selected.Add('IMPTOTAL'#9'10'#9'TOTAL'#9'F');
   dbgRegCompPLE.Selected.Add('IMPOTROS'#9'10'#9'Otros Cargos'#9'F');

   dbgRegCompPLE.Selected.Add('IMPOPEDIA'#9'10'#9'Imp.Operat~Diario'#9'F');
   dbgRegCompPLE.Selected.Add('PROVDOCID'#9'8'#9'Tipo Doc.~Proveedor'#9'F');
   dbgRegCompPLE.Selected.Add('PROVDOCNUM'#9'8'#9'Nro.Doc~Proveedor'#9'F');
   dbgRegCompPLE.Selected.Add('PROVRAZSOC'#9'40'#9'Razón Social'#9'F');
   dbgRegCompPLE.Selected.Add('IMPISC'#9'10'#9'ISC'#9'F');
   dbgRegCompPLE.Selected.Add('CPTCAMPR'#9'10'#9'T.Cambio'#9'F');
   dbgRegCompPLE.Selected.Add('MODFECEMI'#9'10'#9'Fecha Emisión~Mod'#9'F');
   dbgRegCompPLE.Selected.Add('MODDOCID'#9'10'#9'Nro.Doc~Mod'#9'F');
   dbgRegCompPLE.Selected.Add('MODCPSERIE'#9'10'#9'Serie~Mod'#9'F');
   dbgRegCompPLE.Selected.Add('MODCPNODOC'#9'10'#9'Nro.Doc~Mod'#9'F');
   dbgRegCompPLE.Selected.Add('NUMDOCNODOM'#9'10'#9'Nro.Doc~No domiciliado'#9'F');
   dbgRegCompPLE.Selected.Add('FECCONDTR'#9'10'#9'Fecha Detracción'#9'F');
   dbgRegCompPLE.Selected.Add('NUMCONDTR'#9'10'#9'Nro.Comp~Detracción'#9'F');
   dbgRegCompPLE.Selected.Add('FLGRET'#9'10'#9'Indica~Retención'#9'F');
   dbgRegCompPLE.Selected.Add('FLGMOD'#9'10'#9'Indica~Modificación'#9'F');
   dbgRegCompPLE.Selected.Add('CIAID'#9'8'#9'Compañía'#9'F');
   dbgRegCompPLE.Selected.Add('TDIARID'#9'6'#9'TDiario'#9'F');
   dbgRegCompPLE.Selected.Add('CPNOREG'#9'8'#9'NºRegistro'#9'F');
   dbgRegCompPLE.Selected.Add('CLAUXID'#9'8'#9'Clase~Auxiliar'#9'F');
   dbgRegCompPLE.Selected.Add('PROV'#9'10'#9'Código~Proveedor'#9'F');
   dbgRegCompPLE.Selected.Add('CPCANJE'#9'8'#9'NºCanje'#9'F');
   dbgRegCompPLE.Selected.Add('PERIODODOC'#9'8'#9'Doc.Periodo'#9'F');
   dbgRegCompPLE.Selected.Add('OBS_X_ERROR'#9'20'#9'Observac~x Error'#9'F');

}
end;

procedure TFMantRegCompPLE_xReg.bbtnValidaClick(Sender: TObject);
begin
   if DMCXP.cdsRegCompra.Modified then
   begin
      if DMCXP.cdsRegCompra.ApplyUpdates(0)>0 then
      begin
         xsSQL := 'update CXP_REG_COM '
                 +'   set PERIODO='+quotedstr(DMCXP.cdsRegCompra.FieldByName('PERIODO').AsString)+','
                 +'       CORRELATIVO='+quotedstr(DMCXP.cdsRegCompra.FieldByName('CORRELATIVO').AsString)+','
                 +'       FECEMI='+quotedstr(datetostr(DMCXP.cdsRegCompra.FieldByName('FECEMI').AsDateTime))+','
                 +'       FECPAG='+quotedstr(datetostr(DMCXP.cdsRegCompra.FieldByName('FECPAG').AsDateTime))+','
                 +'       DOCID='+quotedstr(DMCXP.cdsRegCompra.FieldByName('DOCID').AsString)+','
                 +'       CPSERIE='+quotedstr(DMCXP.cdsRegCompra.FieldByName('CPSERIE').AsString)+','
                 +'       ANIO='+quotedstr(DMCXP.cdsRegCompra.FieldByName('ANIO').AsString)+','
                 +'       CPNODOC='+quotedstr(DMCXP.cdsRegCompra.FieldByName('CPNODOC').AsString)+','
                 +'       IMPOPEDIA='+floattostr(DMCXP.cdsRegCompra.FieldByName('IMPOPEDIA').AsFloat)+','
                 +'       PROVDOCID='+quotedstr(DMCXP.cdsRegCompra.FieldByName('PROVDOCID').AsString)+','
                 +'       PROVDOCNUM='+quotedstr(DMCXP.cdsRegCompra.FieldByName('PROVDOCNUM').AsString)+','
                 +'       PROVRAZSOC='+quotedstr(DMCXP.cdsRegCompra.FieldByName('PROVRAZSOC').AsString)+','
                 +'       BASIMP='+floattostr(DMCXP.cdsRegCompra.FieldByName('BASIMP').AsFloat)+','
                 +'       IGV='+floattostr(DMCXP.cdsRegCompra.FieldByName('IGV').AsFloat)+','
                 +'       BASIMPMIX='+floattostr(DMCXP.cdsRegCompra.FieldByName('BASIMPMIX').AsFloat)+','
                 +'       IGVMIX='+floattostr(DMCXP.cdsRegCompra.FieldByName('IGVMIX').AsFloat)+','
                 +'       BASIMPGAS='+floattostr(DMCXP.cdsRegCompra.FieldByName('BASIMPGAS').AsFloat)+','
                 +'       IGVGAS='+floattostr(DMCXP.cdsRegCompra.FieldByName('IGVGAS').AsFloat)+','
                 +'       ADQNOGRAV='+floattostr(DMCXP.cdsRegCompra.FieldByName('ADQNOGRAV').AsFloat)+','
                 +'       IMPISC='+floattostr(DMCXP.cdsRegCompra.FieldByName('IMPISC').AsFloat)+','
                 +'       IMPOTROS='+floattostr(DMCXP.cdsRegCompra.FieldByName('IMPOTROS').AsFloat)+','
                 +'       IMPTOTAL='+floattostr(DMCXP.cdsRegCompra.FieldByName('IMPTOTAL').AsFloat)+','
                 +'       CPTCAMPR='+floattostr(DMCXP.cdsRegCompra.FieldByName('CPTCAMPR').AsFloat)+','
                 +'       MODFECEMI='+quotedstr(datetostr(DMCXP.cdsRegCompra.FieldByName('MODFECEMI').AsDateTime))+','
                 +'       MODDOCID='+quotedstr(DMCXP.cdsRegCompra.FieldByName('MODDOCID').AsString)+','
                 +'       MODCPSERIE='+quotedstr(DMCXP.cdsRegCompra.FieldByName('MODCPSERIE').AsString)+','
                 +'       MODCPNODOC='+quotedstr(DMCXP.cdsRegCompra.FieldByName('MODCPNODOC').AsString)+','
                 +'       NUMDOCNODOM='+quotedstr(DMCXP.cdsRegCompra.FieldByName('NUMDOCNODOM').AsString)+','
                 +'       FECCONDTR='+quotedstr(datetostr(DMCXP.cdsRegCompra.FieldByName('FECCONDTR').AsDateTime))+','
                 +'       NUMCONDTR='+quotedstr(DMCXP.cdsRegCompra.FieldByName('NUMCONDTR').AsString)+','
                 +'       FLGRET='+quotedstr(DMCXP.cdsRegCompra.FieldByName('FLGRET').AsString)+','
                 +'       FLGMOD='+quotedstr(DMCXP.cdsRegCompra.FieldByName('FLGMOD').AsString)+','
                 +'       CIAID='+quotedstr(DMCXP.cdsRegCompra.FieldByName('CIAID').AsString)+','
                 +'       TDIARID='+quotedstr(DMCXP.cdsRegCompra.FieldByName('TDIARID').AsString)+','
                 +'       CPNOREG='+quotedstr(DMCXP.cdsRegCompra.FieldByName('CPNOREG').AsString)+','
                 +'       CLAUXID='+quotedstr(DMCXP.cdsRegCompra.FieldByName('CLAUXID').AsString)+','
                 +'       PROV='+quotedstr(DMCXP.cdsRegCompra.FieldByName('PROV').AsString)+' '
                 +' where PERIODO=' + QuotedStr(FCRegComp.dbeAnoMM.Text)
//                 +'   and CORRELATIVO=' + QuotedStr(copy(DMCXP.cdsRegCompra.FieldByName('CORRELATIVO').AsString,4,7));
                 +'   and CORRELATIVO=' + QuotedStr(DMCXP.cdsRegCompra.FieldByName('CORRELATIVO').AsString);
         try
            DMCXP.DCOM1.AppServer.EjecutaSQL(xsSQL);
         except
            ShowMessage('No se pudo actualizar el registro');
         end;
      end;
   end;
   Close;
end;

procedure TFMantRegCompPLE_xReg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFMantRegCompPLE_xReg.bbtnRegCancClick(Sender: TObject);
begin
   DMCXP.cdsRegCompra.CancelUpdates;
   Close;
end;

end.
