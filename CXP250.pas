unit CXP250;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wwdblook, Buttons, Mask, wwdbedit, Wwdbdlg, ExtCtrls, db;

type
  TFTipoReg = class(TForm)
    bbtnRegOk: TBitBtn;
    bbtnRegCanc: TBitBtn;
    lblTipReg: TLabel;
    dblcTipReg: TwwDBLookupCombo;
    edtTipReg: TEdit;
    Panel1: TPanel;
    lblCnpEgr: TLabel;
    dblcdCnpEgr: TwwDBLookupComboDlg;
    lblGlosa: TLabel;
    dbeGlosa: TwwDBEdit;
    lblCCosto: TLabel;
    dblcdCCosto: TwwDBLookupComboDlg;
    lblDH: TLabel;
    dbeDH: TwwDBEdit;
    lblImporte: TLabel;
    dbeImporte: TwwDBEdit;
    cbProrratea: TCheckBox;
    Label1: TLabel;
    edtTRegDesAct: TEdit;
    edtTRegIdAct: TEdit;
    procedure dblcTipRegEnter(Sender: TObject);
    procedure dblcTipRegExit(Sender: TObject);
    procedure bbtnRegCancClick(Sender: TObject);
    procedure bbtnRegOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcTipRegNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    cTipReg : String;
    nImpReg : Double;
    
  end;

var
  FTipoReg: TFTipoReg;
  wwTasaIGV : double; //  HPP_201101_CXP define variable donde se carga valor IGV
//

implementation

{$R *.dfm}

uses CXPDM;

procedure TFTipoReg.dblcTipRegEnter(Sender: TObject);
begin
   DMCXP.cdsTipReg.Filter:='';
   DMCXP.cdsTipReg.IndexFieldNames:='TREGID';
   Filtracds( DMCXP.cdsTipReg,'SELECT * FROM TGE113 ORDER BY TREGID');
   dblcTipReg.LookupField:='TREGID';
   dblcTipReg.LookupTable:=DMCXP.cdsTipReg;
end;

procedure TFTipoReg.dblcTipRegExit(Sender: TObject);
var
   xWhere : string;
begin
   edtTipReg.Text:=DMCXP.DisplayDescrip('TGE113','TREGDES','TRegID',dblcTipReg.Text);

   if length(edtTipReg.Text)=0 then
   begin
      ShowMessage('Debe Ingresar el Tipo de Registro');
      dblcTipReg.SetFocus;
      exit;
   end;

   DMCXP.cdsDetCxP.Edit;
   DMCXP.cdsDetCxP.FieldByName('TIPDET').AsString := DMCXP.cdsUltTGE.FieldByName('TIPDET').AsString;
//   DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString :=DMCXP.cdsUltTGE.fieldbyname('DCPDH').AsString;
   if length(DMCXP.cdsUltTGE.FieldByName('CUENTAMN').AsString)>0 then
   begin
      if DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString=DMCXP.wTMonLoc then
      begin
         DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString  :=DMCXP.cdsUltTGE.fieldbyname('CPTOMN').AsString;
         DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString:=DMCXP.cdsUltTGE.fieldbyname('CUENTAMN').AsString;
      end
      else
      begin
         DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString  :=DMCXP.cdsUltTGE.fieldbyname('CPTOME').AsString;
         DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString:=DMCXP.cdsUltTGE.fieldbyname('CUENTAME').AsString;
      end;
   end;
   DMCXP.cdsDetCxP.Post;
end;

procedure TFTipoReg.bbtnRegCancClick(Sender: TObject);
begin
   Close;
end;

procedure TFTipoReg.bbtnRegOkClick(Sender: TObject);
var
   xBaseProrrateada, xIGVProrrateado : double;
   xSQL, xWhere : String;
   xTregid_n :String;
   xCptoId_n, xGlosa, xTipDet :String;
   x, xVeces : integer;
begin
   {
   if not ( (DMCXP.cdsDetCxP.fieldByName('TREGID').AsString='01') or
            (DMCXP.cdsDetCxP.fieldByName('TREGID').AsString='02') or
            (DMCXP.cdsDetCxP.fieldByName('TREGID').AsString='03') or
            (DMCXP.cdsDetCxP.fieldByName('TREGID').AsString='05') or
            (DMCXP.cdsDetCxP.fieldByName('TREGID').AsString='06') or
            (DMCXP.cdsDetCxP.fieldByName('TREGID').AsString='10') ) then
   begin
      ShowMessage('Solo se pueden cambiar a Tipos de Registro 01, 02, 03, 05, 06 y 10 ');
      Exit;
   end;
   }

   if MessageDlg( '¿ Esta Seguro de Grabar Cambios ?',mtConfirmation,[mbYes, mbNo],0)=mrNo then
   begin
     	Close;
      Exit;
   end;

   DMCXP.cdsDetCxP.Edit;
   if nImpReg<>DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat then
   begin
      if DMCXP.cdsMovCxP.fieldbyname('TMONID').AsString=DMCXP.wTMonLoc then
      begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat/DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
      end
      else
      begin
         DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
         DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;
      end;
   end;

   DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString;
   DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime:= date+time;

//   if (cTipReg<>DMCXP.cdsDetCxP.FieldByName('TREGID').AsString) or
//      (nImpReg<>DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat) then
   begin
   // sólo debe grabar cuando se ha cambiado el Tipo de Registro
      DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DetCxP' );
   end;

   if cbProrratea.Checked then
   begin
      if ( (DMCXP.cdsDetCxP.fieldByName('TREGID').AsString<>'01') and
           (DMCXP.cdsDetCxP.fieldByName('TREGID').AsString<>'02') and
           (DMCXP.cdsDetCxP.fieldByName('TREGID').AsString<>'06') )then
      begin
         ShowMessage('No se prorrateará porque no es Base Imponible');
      end
      else
      begin
         xBaseProrrateada  := 0;
         xIGVProrrateado   := 0;
         DMCXP.cdsMovCxP.Edit;
         if DMCXP.cdsDetCxP.FieldByName('TREGID').AsString='01' then
         begin
// inicio HPP_201101_CXP
// cambia instrucción para que tome valor IGV desde variable que toma valor de tabla
//            xBaseProrrateada  := FRound(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat/1.19,15,2);
            xBaseProrrateada  := FRound(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat/(1+wwTasaIGV/100),15,2);
// fin HPP_201101_CXP

            xIGVProrrateado   := DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat-xBaseProrrateada;
            xTregid_n         := '03';
            //xBaseProrrateada  := FRound(DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat/1.19,15,2);
            //xIGVProrrateado   := DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat-xBaseProrrateada;
            DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat  := xBaseProrrateada;
            DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat  := xIGVProrrateado;

         end;
         if DMCXP.cdsDetCxP.FieldByName('TREGID').AsString='02' then
         begin
// inicio HPP_201101_CXP
// cambia instrucción para que tome valor IGV desde variable que toma valor de tabla
//            xBaseProrrateada  := FRound(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat/1.19,15,2);
            xBaseProrrateada  := FRound(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat/(1+wwTasaIGV/100),15,2);
// fin HPP_201101_CXP

            xIGVProrrateado   := DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat-xBaseProrrateada;
            xTregid_n         := '04';
            //xBaseProrrateada  := FRound(DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD2').AsFloat/1.19,15,2);
            //xIGVProrrateado   := DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD2').AsFloat-xBaseProrrateada;
            DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD2').AsFloat := xBaseProrrateada;
            DMCXP.cdsMovCxP.fieldbyname('CPIGV2').AsFloat := xIGVProrrateado;
         end;
         if DMCXP.cdsDetCxP.FieldByName('TREGID').AsString='06' then
         begin
// inicio HPP_201101_CXP
// cambia instrucción para que tome valor IGV desde variable que toma valor de tabla
//            xBaseProrrateada  := FRound(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat/1.19,15,2);
            xBaseProrrateada  := FRound(DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat/(1+wwTasaIGV/100),15,2);
// fin HPP_201101_CXP

            xIGVProrrateado   := DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat-xBaseProrrateada;
            xTregid_n         := '09';
            //xBaseProrrateada  := FRound(DMCXP.cdsMovCxP.fieldbyname('CPNOGRAV').AsFloat/1.19,15,2);
            //xIGVProrrateado   := DMCXP.cdsMovCxP.fieldbyname('CPNOGRAV').AsFloat-xBaseProrrateada;
            DMCXP.cdsMovCxP.fieldbyname('CPNOGRAV').AsFloat :=   xBaseProrrateada ;
            DMCXP.cdsMovCxP.fieldbyname('IGV_GRA_NO_DEST').AsFloat := xIGVProrrateado;
         end;

         DMCXP.AplicaDatos( DMCXP.cdsMovCxP, 'MovCxP' );

         DMCXP.cdsDetCxP.Edit;
         DMCXP.cdsDetCxP.fieldbyname('DCPMOORI').AsFloat := xBaseProrrateada;
         if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString='N' then
         begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := xBaseProrrateada;
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound(xBaseProrrateada/DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
         end
         else
         begin
            DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := xBaseProrrateada;
            DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound(xBaseProrrateada*DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
         end;

         xWhere    := ' TREGID = '+quotedstr(xTregid_n);
         xCptoId_n := BuscaQry('PrvTGE','TGE113','*',xWhere,'CUENTAMN');
         xGlosa    := DMCXP.cdsQry.FieldByName('TREGDES').AsString;
         xTipDet   := DMCXP.cdsQry.FieldByName('TIPDET').AsString;

         xSQL:= 'select * from CXP302 '
               +'where CIAID='+quotedstr(DMCXP.cdsDetCxP.FieldByName('CIAID').AsString)
               +'  and DCPANOMM='+quotedstr(DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString)
               +'  and TDIARID=' +quotedstr(DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString)
               +'  and CPNOREG=' +quotedstr(DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString)
               +'  and DCPREG='+quotedstr(DMCXP.cdsDetCxP.FieldByName('DCPREG').AsString);
         DMCXP.cdsQry.close;
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;

         DMCXP.cdsDetCxP.Append;
         for x:=0 to DMCXP.cdsQry.FieldCount -1 do
         begin
            DMCXP.cdsDetCxP.FieldByName(DMCXP.cdsQry.Fields[x].DisplayName).Value
                      :=DMCXP.cdsQry.Fields[x].Value;

            if DMCXP.cdsQry.Fields[x].DisplayName = 'TREGID' then
            begin
               DMCXP.cdsDetCxP.FieldByName(DMCXP.cdsQry.Fields[x].DisplayName).Value
                          := xTregid_n;
            end;

            if DMCXP.cdsQry.Fields[x].DisplayName = 'TIPDET' then
            begin
               DMCXP.cdsDetCxP.FieldByName(DMCXP.cdsQry.Fields[x].DisplayName).Value
                          := xTipDet;
            end;

            if DMCXP.cdsQry.Fields[x].DisplayName = 'CPTOID' then
            begin
               if DMCXP.cdsQry.FieldByName('TREGID').AsString='06' then
                  DMCXP.cdsDetCxP.FieldByName(DMCXP.cdsQry.Fields[x].DisplayName).Value
                          := DMCXP.cdsQry.FieldByName('CPTOID').AsString
               else
                  DMCXP.cdsDetCxP.FieldByName(DMCXP.cdsQry.Fields[x].DisplayName).Value
                          := xCptoId_n;
            end;

            if DMCXP.cdsQry.Fields[x].DisplayName = 'CUENTAID' then
            begin
               if DMCXP.cdsQry.FieldByName('TREGID').AsString='06' then
                  DMCXP.cdsDetCxP.FieldByName(DMCXP.cdsQry.Fields[x].DisplayName).Value
                          := DMCXP.cdsQry.FieldByName('CUENTAID').AsString
               else
                   DMCXP.cdsDetCxP.FieldByName(DMCXP.cdsQry.Fields[x].DisplayName).Value
                          := xCptoId_n;
            end;

            if DMCXP.cdsQry.Fields[x].DisplayName = 'DCPGLOSA' then
            begin
               DMCXP.cdsDetCxP.FieldByName(DMCXP.cdsQry.Fields[x].DisplayName).Value
                          := xGlosa;
            end;

            if DMCXP.cdsQry.Fields[x].DisplayName =  'DCPMOORI' then
            begin
               DMCXP.cdsDetCxP.FieldByName(DMCXP.cdsQry.Fields[x].DisplayName).Value
                          := xIGVProrrateado;
            end;

            if DMCXP.cdsQry.Fields[x].DisplayName =  'DCPMOLOC' then
            begin
               if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString='N' then
               begin
                  DMCXP.cdsDetCxP.FieldByName(DMCXP.cdsQry.Fields[x].DisplayName).Value
                          := xIGVProrrateado;
               end
               else
               begin
                  DMCXP.cdsDetCxP.FieldByName(DMCXP.cdsQry.Fields[x].DisplayName).Value
                          := FRound(xIGVProrrateado*DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
               end;
            end;

            if DMCXP.cdsQry.Fields[x].DisplayName =  'DCPMOEXT' then
            begin
               if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString='N' then
               begin
                  DMCXP.cdsDetCxP.FieldByName(DMCXP.cdsQry.Fields[x].DisplayName).Value
                          := FRound(xIGVProrrateado/DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2);
               end
               else
               begin
                  DMCXP.cdsDetCxP.FieldByName(DMCXP.cdsQry.Fields[x].DisplayName).Value
                          := xIGVProrrateado;
               end;
            end;

            if DMCXP.cdsQry.Fields[x].DisplayName = 'DCPFREG' then
            begin
               DMCXP.cdsDetCxP.FieldByName(DMCXP.cdsQry.Fields[x].DisplayName).AsDateTime
                        := date;
            end;

         end;

         if DMCXP.cdsDetCxP.ApplyUpdates(0)>0 then
         begin
            ShowMessage('No se pudo Prorratear el IGV');
            exit;
         end;

         xSQL:= 'select * from CXP302 '
               +'where CIAID='+quotedstr(DMCXP.cdsDetCxP.FieldByName('CIAID').AsString)
               +'  and DCPANOMM='+quotedstr(DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString)
               +'  and TDIARID=' +quotedstr(DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString)
               +'  and CPNOREG=' +quotedstr(DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString)
               +' order by DCPREG,DCPFREG';
         DMCXP.cdsDetCxP.close;
         DMCXP.cdsDetCxP.DataRequest(xSQL);
         DMCXP.cdsDetCxP.Open;
         x := 0;
         DMCXP.cdsDetCxP.First;
         while not DMCXP.cdsDetCxP.eof do
         begin
            x := x+1;
            DMCXP.cdsDetCxP.Edit;
            DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger := x;
            DMCXP.cdsDetCxP.Post;
            DMCXP.cdsDetCxP.Next;
         end;
         if DMCXP.cdsDetCxP.ApplyUpdates(0)>0 then
         begin
            ShowMessage('¡No se actualizó el Número de Registro!');
            exit;
         end;
      end;
   end;

   ShowMessage('Documento actualizado');
   Close;
end;

procedure TFTipoReg.FormActivate(Sender: TObject);
begin
   edtTRegIdAct.Text   := DMCXP.cdsDetCxP.FieldByName('TREGID').AsString;
   edtTRegDesAct.Text  := BuscaQry('PrvTGE','TGE113','*',' TREGID = '+quotedstr(edtTRegIdAct.Text),'TREGDES');

// inicio HPP_201101_CXP
//  carga valor IGV desde tabla de Tasas e Impuestos TGE108
   wwTasaIGV := strtofloat(BuscaQry('PrvTGE','TGE108','TASACAN','TASAFLG=''I''','TASACAN'));
// fin HPP_201101_CXP

   dblcTipReg.DataSource  :=DMCXP.dsDetCxP;
   dblcTipReg.LookupTable :=DMCXP.cdsTipReg;
   dblcdCnpEgr.DataSource :=DMCXP.dsDetCxP;
   dblcdCnpEgr.LookupTable:=DMCXP.cdsCnpEgr;
   dbeGlosa.DataSource    :=DMCXP.dsDetCxP;
   dblcdCCosto.DataSource :=DMCXP.dsDetCxP;
   dblcdCCosto.LookupTable:=DMCXP.cdsCCosto;
   dbeDH.DataSource       :=DMCXP.dsDetCxP;
   dbeImporte.DataSource  :=DMCXP.dsDetCxP;

   cTipReg:=DMCXP.cdsDetCxP.FieldByName('TREGID').AsString;
   nImpReg:=DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat;

   edtTipReg.Text := edtTRegDesAct.Text;
end;

procedure TFTipoReg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMCXP.cdsMovCxP.CancelUpdates;
   DMCXP.cdsDetCxP.CancelUpdates;
end;

procedure TFTipoReg.dblcTipRegNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.
