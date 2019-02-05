unit CxP900;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, ExtCtrls, Wwdbdlg,
  ComCtrls, DBGrids, Buttons;

type
  TFInserta = class(TForm)
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    lblProv: TLabel;
    Bevel2: TBevel;
    dbg1: TwwDBGrid;
    Button1: TButton;
    Button3: TButton;
    edtSerie: TEdit;
    edtNDoc: TEdit;
    dblcdProv: TwwDBLookupComboDlg;
    Button2: TButton;
    dbg2: TwwDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    Bevel3: TBevel;
    Label7: TLabel;
    Bevel4: TBevel;
    dbg3: TwwDBGrid;
    Button4: TButton;
    Button5: TButton;
    edtCanje: TEdit;
    wwDBLookupComboDlg1: TwwDBLookupComboDlg;
    Button6: TButton;
    dbg4: TwwDBGrid;
    dbg5: TwwDBGrid;
    Label6: TLabel;
    Label8: TLabel;
    TabSheet3: TTabSheet;
    dbg8: TwwDBGrid;
    Label9: TLabel;
    edtPeriodo: TEdit;
    Label10: TLabel;
    Button7: TButton;
    lblTotalReg: TLabel;
    Label11: TLabel;
    Panel1: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    lblSave: TLabel;
    lblNoSave: TLabel;
    Label14: TLabel;
    lblnofind: TLabel;
    pbTablas: TProgressBar;
    TabSheet4: TTabSheet;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    wwDBGrid1: TwwDBGrid;
    edtAnomm: TEdit;
    Button8: TButton;
    Panel2: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    ProgressBar1: TProgressBar;
    Label25: TLabel;
    TabSheet5: TTabSheet;
    edtcompania: TEdit;
    Button9: TButton;
    dbgn1: TwwDBGrid;
    Button10: TButton;
    Label26: TLabel;
    TabSheet6: TTabSheet;
    GroupBox1: TGroupBox;
    Button11: TButton;
    gbAntiguo: TGroupBox;
    Label27: TLabel;
    Label30: TLabel;
    dblcAntClAux: TwwDBLookupCombo;
    dblcdAntProv: TwwDBLookupComboDlg;
    gbnuevo: TGroupBox;
    Label29: TLabel;
    dblcNueClAux: TwwDBLookupCombo;
    Label28: TLabel;
    dblcdNueProv: TwwDBLookupComboDlg;
    CheckBox1: TCheckBox;
    edtAntRuc: TEdit;
    edtNueRuc: TEdit;
    TabSheet7: TTabSheet;
    Button12: TButton;
    dbgCCanje: TwwDBGrid;
    Label31: TLabel;
    dbgCanje: TwwDBGrid;
    dbgLetras: TwwDBGrid;
    Label32: TLabel;
    Label33: TLabel;
    lblCont: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    wwDBGrid2: TwwDBGrid;
    Label37: TLabel;
    edtCje: TEdit;
    TabSheet8: TTabSheet;
    Button13: TButton;
    Button14: TButton;
    DBGrid1: TDBGrid;
    PB2: TProgressBar;
    BitBtn1: TBitBtn;
    edtPeriodo2: TEdit;
    Button15: TButton;
    TabSheet9: TTabSheet;
    Button16: TButton;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Label34: TLabel;
    Label38: TLabel;
    DBGrid4: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure dblcAntClAuxExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

     Procedure GrabaDetCanje;
     Procedure GrabaRegCxP305;
     procedure GeneraDetalleRetencion;
     Procedure FiltraCanje;
//     procedure InsertaLETRASEnCNT320;     
                      
  public
    { Public declarations }
  end;

var
  FInserta: TFInserta;

implementation
uses CxPDM;

{$R *.DFM}

procedure TFInserta.Button1Click(Sender: TObject);
var
   xSQL : string;
begin
   xSQL:= ' SELECT * FROM CXP301 '+
          ' WHERE CXP301.CIAID='+Quotedstr(dblcCia.text)+
          ' AND CXP301.TCANJEID=''LE'''+
          ' AND NOT EXISTS(SELECT * FROM CXP304  WHERE CXP304.CIAID=CXP301.CIAID'+
          ' AND CXP304.TCANJEID=CXP301.TCANJEID  AND '+
          ' CXP304.CCPCANJE=CXP301.CPCANJE ) ';
   DMCXP.cdsLetras.IndexFieldNames :='';
//   DMCXP.cdsMovCxP.ProviderName := 'dspTGE';
   DMCXP.cdsLetras.Close;
   DMCXP.cdsLetras.DataRequest(xSQL);
   DMCXP.cdsLetras.Open;
   dbg1.DataSource:= DMCXP.dsLetras;
   DMCXP.cdsProv.open;
end;

procedure TFInserta.Button3Click(Sender: TObject);
var
  xSQL,xFiltro,xTipReg : string;
  xCont : integer;
begin
    xCont := 0;
    if DMCXP.cdsMovCxP.RecordCount>0 then
    begin
       Screen.Cursor:=crHourGlass;
       DMCXP.cdsMovCxP.First;
       DMCXP.cdsMovCxP.First;
       while not DMCXP.cdsMovCxP.Eof do
       begin
          xFiltro := 'CIAID='+Quotedstr(dblcCia.Text)+
                    ' AND TCANJEID='+Quotedstr('LE')+
                    ' AND CANJE='+Quotedstr(DMCXP.cdsLetras.fieldbyname('CPCANJE').AsString );
          Filtracds( DMCXP.cdsCCanje,'Select * from CXP308 Where '+xFiltro );

          DMCXP.cdsCanje.IndexFieldNames :='';
          xFiltro := ' CIAID='+Quotedstr(dblcCia.Text)+
                     ' AND TCANJEID='+Quotedstr('LE')+
                     ' AND CCPCANJE='+Quotedstr(DMCXP.cdsMovCxP.fieldbyname('CPCANJE').AsString );
          Filtracds( DMCXP.cdsCanje,'Select * from CXP304 Where '+xFiltro );
          DMCXP.cdsCanje.Insert;
          DMCXP.cdsCanje.FieldByName('CIAID').AsString    := DMCXP.cdsMovCxP.FieldByName('CIAID').AsString;
          DMCXP.cdsCanje.FieldByName('TDIARID').AsString  := DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString;
          DMCXP.cdsCanje.FieldByName('CPNOREG').AsString  := DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString;
          DMCXP.cdsCanje.FieldByName('CCPANOC').AsString  := DMCXP.cdsMovCxP.FieldByName('CPAAAA').AsString;
          DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString := DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString;
          DMCXP.cdsCanje.FieldByName('CLAUXID').AsString  := DMCXP.cdsMovCxP.FieldByName('CLAUXID').AsString;
          DMCXP.cdsCanje.FieldByName('PROV').AsString     := DMCXP.cdsMovCxP.FieldByName('PROV').AsString;
          DMCXP.cdsCanje.FieldByName('PROVRUC').AsString  := DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString;
          DMCXP.cdsCanje.FieldByName('DOCID').AsString    := DMCXP.cdsMovCxP.FieldByName('DOCID').AsString;
          DMCXP.cdsCanje.FieldByName('CPSERIE').AsString  := DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString;
          DMCXP.cdsCanje.FieldByName('CPNODOC').AsString  := DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString;

          DMCXP.cdsCanje.FieldByName('TCANJEID').AsString := 'LE';
          DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString := DMCXP.cdsLetras.fieldbyname('CPCANJE').AsString;
          DMCXP.cdsCanje.FieldByName('CPFEMIS').AsDateTime:= DMCXP.cdsMovCxP.FieldByName('CPFEMIS').AsDateTime;
          DMCXP.cdsCanje.FieldByName('CCPFCJE').AsDateTime:= DMCXP.cdsCCanje.fieldbyname('CJFCANJE').AsDateTime;
          DMCXP.cdsCanje.FieldByName('TMONID').AsString   := DMCXP.cdsMovCxP.FieldByName('TMONID').AsString;
          // JORGE
          xTipReg := DMCXP.DisplayDescrip2('dspTGE','TGE110','DOC_FREG,DOCTIPREG','DOCID='+quotedstr(DMCXP.cdsMovCxP.FieldByName('DOCID').AsString),'DOC_FREG');
          if (xTipReg = 'N') or (DMCXP.cdsQry.FieldByName('DOCTIPREG').AsString='NC') then // Nota de CREDITO
           begin
            DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOORI').AsFloat * -1,15,2);
            DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPSALLOC').AsFloat * -1,15,2);
            DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPSALEXT').AsFloat * -1,15,2);
            //** pjsv - acumula los montos de las nostas de credito
//            xNCL := xNCL + DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
//            xNCE := xNCE + DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
            //**
           end
          else
           begin
            DMCXP.cdsCanje.FieldByName('CCPMOORI').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPMtoOri').AsFloat,15,2);
            DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPSalLoc').AsFloat,15,2);
            DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPSalExt').AsFloat,15,2);
           end;
          //**
          DMCXP.cdsCanje.FieldByName('CJEANTMN').AsFloat  := 0;
          DMCXP.cdsCanje.FieldByName('CJEANTME').AsFloat  := 0;
          DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat  := FRound(DMCXP.cdsMovCxP.FieldByName('CPTCamPr').AsFloat,8,3);
          DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat  := FRound(DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,8,3);

          If DMCXP.wTMonLoc=DMCXP.cdsCanje.FieldByName('TMONID').AsString then begin
             DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
             DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
             DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat := FRound( DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
          end
          else begin
             DMCXP.cdsCanje.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
             DMCXP.cdsCanje.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat,15,2);
             DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat := FRound( DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2 );
          end;

          DMCXP.cdsCanje.FieldByName('CCPESTDO').AsString := 'P';
          DMCXP.cdsCanje.FieldByName('CTATOTAL').AsString := DMCXP.cdsMovCxP.FieldByName('CtaTotal').AsString;
          DMCXP.cdsCanje.FieldByName('CPTOTOT').AsString  := DMCXP.cdsMovCxP.FieldByName('CptoTot').AsString;
          DMCXP.cdsCanje.FieldByName('CPFVCMTO').AsdateTime:= DMCXP.cdsMovCxP.FieldByName('CPFVcmto').AsDateTime;
          DMCXP.cdsCanje.FieldByName('CCPUSER').AsString  := DMCXP.wUsuario;
          DMCXP.cdsCanje.FieldByName('CCPFREG').AsDateTime:= date;
          DMCXP.cdsCanje.FieldByName('CCPHREG').AsDateTime := time;
          DMCXP.cdsCanje.FieldByName('CCPMM').AsString    := DMCXP.cdsMovCxP.FieldByName('CPMM').AsString;
          DMCXP.cdsCanje.FieldByName('CCPDD').AsString    := DMCXP.cdsMovCxP.FieldByName('CPDD').AsString;
          DMCXP.cdsCanje.FieldByName('CCPTRI').AsString   := DMCXP.cdsMovCxP.FieldByName('CPTri').AsString;
          DMCXP.cdsCanje.FieldByName('CCPSEM').AsString   := DMCXP.cdsMovCxP.FieldByName('CPSem').AsString;
          DMCXP.cdsCanje.FieldByName('CCPSS').AsString    := DMCXP.cdsMovCxP.FieldByName('CPSS').AsString;
          DMCXP.cdsCanje.FieldByName('CCPAATRI').AsString := DMCXP.cdsMovCxP.FieldByName('CPAATri').AsString;
          DMCXP.cdsCanje.FieldByName('CCPAASEM').AsString := DMCXP.cdsMovCxP.FieldByName('CPAASem').AsString;
          DMCXP.cdsCanje.FieldByName('CCPAASS').AsString  := DMCXP.cdsMovCxP.FieldByName('CPAASS').AsString;
          DMCXP.AplicaDatos( DMCXP.cdsCanje,'Canje');
{          DMCXP.cdsMovCxP.Edit;
          DMCXP.cdsMovCxP.FieldByName('FlagVar').AsString := 'XX';
          DMCXP.AplicaDatos( DMCXP.cdsMovCxP, 'MovCxP' );}
          xCont := xCont+1;
          DMCXP.cdsMovCxP.Next;
       end;//while
    end
    else
        raise exception.create('No existen datos');
    ShowMessage('Total Reg.Insertados:'+inttostr(xCont));
    Screen.Cursor:=crDefault;

end;

procedure TFInserta.Button2Click(Sender: TObject);
var
  xSQL : string;
begin
    xSQL := ' SELECT * FROM CXP301 '+
            ' WHERE CIAID='+Quotedstr(dblcCia.text)+
            ' AND PROV='+Quotedstr(dblcdProv.text)+
            ' AND CPSERIE='+Quotedstr(edtSerie.text)+
            ' AND CPNODOC='+Quotedstr(edtNDoc.text);
     DMCXP.cdsMovCxP.IndexFieldNames :='';
     DMCXP.cdsMovCxP.Close;
     DMCXP.cdsMovCxP.DataRequest(xSQL);
     DMCXP.cdsMovCxP.Open;
     dbg2.DataSource := DMCXP.dsMovCxP;

end;

procedure TFInserta.Button4Click(Sender: TObject);
var
   xSQL : string;
begin
   xSQL:= ' SELECT  *  FROM CXP308 '+
          ' WHERE     NOT EXISTS(SELECT * FROM CXP305  WHERE CXP305.CIAID=CXP308.CIAID AND CXP305.TCANJEID=CXP308.TCANJEID  AND '+
          ' CXP305.CCPCANJE=CXP308.CANJE  AND CXP305.PROV=CXP308.PROV) ';
   DMCXP.cdsCCanje.IndexFieldNames :='';
   DMCXP.cdsCCanje.Close;
   DMCXP.cdsCCanje.DataRequest(xSQL);
   DMCXP.cdsCCanje.Open;
   dbg3.DataSource := DMCXP.dsCCanje;


end;

Procedure TFInserta.GrabaDetCanje;
Var
   xSalLoc,xSalExt,xSaldoC,xSaldoL,xNCL,xNCE : double;
   xSQL,xFiltro: string;
begin
   xFiltro := 'CIAID='+Quotedstr(dblcCia.Text)+
              ' AND TCANJEID='+Quotedstr('LE')+
              ' AND CCPCANJE='+''''+edtCanje.text+'''';
   Filtracds( DMCXP.cdsDetCanje,'Select * from CXP305 Where '+xFiltro );
   xNCL:=0;
   xNCE:=0;

   DMCXP.cdsDetCanje.First;
   While (not DMCXP.cdsDetCanje.Eof) and (DMCXP.cdsDetCanje.RecordCount>0) do
      DMCXP.cdsDetCanje.Delete;

   DMCXP.cdsLetras.First;
   DMCXP.cdsCanje.DisableControls;
   DMCXP.cdsCanje.First;
   While not DMCXP.cdsCanje.Eof do
    begin
     if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc Then
      begin
       If DMCXP.DisplayDescrip2('dspTGE','TGE110','DOC_FREG','DOCID='+quotedstr(DMCXP.cdsCanje.FieldByName('DOCID').AsString),'DOC_FREG') = 'N' then // Nota de CREDITO
        xSaldoC := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat * -1
       else
        xSaldoC := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
      end
     else
      begin
       If DMCXP.DisplayDescrip2('dspTGE','TGE110','DOC_FREG','DOCID='+quotedstr(DMCXP.cdsCanje.FieldByName('DOCID').AsString),'DOC_FREG') = 'N' then // Nota de CREDITO
        xSaldoC := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat * -1
       else
        xSaldoC := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
      end;
     xSalLoc := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
     xSalExt := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
         While xSaldoC > 0 do
          begin
           While (not DMCXP.cdsLetras.Eof) and (xSaldoC>0) do
              begin
                if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc Then
                 begin
                  If xNCL <> 0 then
                   xSaldoL := DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat + (xNCL * -2)
                  else
                   xSaldoL := DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat;
                 end
                else
                 begin
                  If xNCE <> 0 then
                   xSaldoL := DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat + (xNCE * -2)
                  else
                   xSaldoL := DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat;
                 end;

                DMCXP.cdsDetCanje.Insert;
                if xSaldoL<=xSaldoC then
                 begin
                   // Grabar en cxp305 en monto = a la letra
                   GrabaRegCxP305;
                   If DMCXP.cdsDetCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
                    begin
                      DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := FRound(DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat,15,2);
                      DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat := FRound(DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
                      xSalLoc := FRound( xSalLoc-DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat,15,2);
                      xSalExt := FRound( xSalExt-DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat,15,2);
                      xSaldoC := xSalLoc;
                    end
                   Else
                    begin
                      DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat := FRound(DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat,15,2);
                      DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := FRound(DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat,15,2);
                      xSalExt := FRound(xSalExt-DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat,15,2);
                      xSalLoc := FRound(xSalLoc-DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat,15,2);
                      xSaldoC := xSalExt;
                    End;
                     DMCXP.cdsLetras.Edit;
                     DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := 0;
                     DMCXP.cdsLetras.Delete;
                 end
                else
                 begin
                   // Grabar en cxp305 en monto = xSalLoc
                   GrabaRegCxP305;
                   If DMCXP.cdsDetCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
                    begin
                      DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := FRound(xSalLoc,15,2);
                      DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat := FRound(xSalLoc/DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat,15,2);
                    end
                   Else
                    begin
                      DMCXP.cdsDetCanje.FieldByName('DCDMOEXT').AsFloat := FRound(xSalExt,15,2);
                      DMCXP.cdsDetCanje.FieldByName('DCDMOLOC').AsFloat := FRound(xSalExt*DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat,15,2);
                    End;
                   DMCXP.cdsLetras.Edit;
                   DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound(DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat-xSalLoc,15,2);
                   DMCXP.cdsLetras.FieldByName('CPMtoExt').AsFloat := FRound(DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat-xSalExt,15,2);
                   xSalLoc := 0;
                   xSalExt := 0;
                   xSaldoC := 0;
                 end;
                DMCXP.cdsDetCanje.Post;
         //       DMCXP.cdsLetras.next;
              end;
          end;
//         end;
//       end;
      DMCXP.cdsCanje.Next;
    end;
   DMCXP.AplicaDatos( DMCXP.cdsDetCanje, 'DetCanje' );

   DMCXP.cdsLetras.CancelUpdates;
   DMCXP.cdsDetCanje.First;
   DMCXP.cdsLetras.EnableControls;
   DMCXP.cdsCanje.EnableControls;
   
   Showmessage('ok')

end;


procedure TFInserta.Button6Click(Sender: TObject);
var
   xFiltro : string;
begin
	 xFiltro := 'CIAID='   +''''+dblcCia.Text +''''+' AND '+
							'TCANJEID='+''''+'LE'         +''''+' AND '+
							'CCPCANJE='+''''+edtCanje.text+'''';
	 Filtracds( DMCXP.cdsCanje,'Select * from CXP304 Where '+xFiltro );
   dbg4.DataSource := DMCXP.dsCanje;

   xFiltro := 'CIAID='   +''''+dblcCia.Text +''''+' and '+
              'TCANJEID='+''''+'LE'         +''''+' and '+
              'CPCANJE=' +''''+edtCanje.Text+'''';
   Filtracds( DMCXP.cdsLetras,'Select * from CXP301 Where '+xFiltro );
   dbg5.DataSource := DMCXP.dsLetras;   

end;
Procedure TFInserta.GrabaRegCxP305;
begin
   DMCXP.cdsDetCanje.FieldByName('CIAID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
   DMCXP.cdsDetCanje.FieldByName('PROV').AsString     := DMCXP.cdsCanje.FieldByName('PROV').AsString;
   DMCXP.cdsDetCanje.FieldByName('PROVRUC').AsString  := DMCXP.cdsCanje.FieldByName('PROVRUC').AsString;
   DMCXP.cdsDetCanje.FieldByName('DOCID').AsString    := DMCXP.cdsCanje.FieldByName('DOCID').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPSERIE').AsString  := DMCXP.cdsCanje.FieldByName('CPSERIE').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPNODOC').AsString  := DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPNOREG').AsString  := DMCXP.cdsLetras.FieldByName('CPNOREG').AsString;
   DMCXP.cdsDetCanje.FieldByName('TCANJEID').AsString := DMCXP.cdsCanje.FieldByName('TCANJEID').AsString;
   DMCXP.cdsDetCanje.FieldByName('CCPCANJE').AsString := DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString;
   DMCXP.cdsDetCanje.FieldByName('CCPFCJE').AsDateTime:= DMCXP.cdsCanje.FieldByName('CCPFCJE').AsDateTime;
   DMCXP.cdsDetCanje.FieldByName('DOCID2').AsString   := DMCXP.cdsLetras.FieldByName('DOCID').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPSERIE2').AsString := DMCXP.cdsLetras.FieldByName('CPSERIE').AsString;
   DMCXP.cdsDetCanje.FieldByName('CPNODOC2').AsString := DMCXP.cdsLetras.FieldByName('CPNODOC').AsString;
   DMCXP.cdsDetCanje.FieldByName('TMONID').AsString   := DMCXP.cdsCanje.FieldByName('TMONID').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDUSER').AsString  := DMCXP.cdsCanje.FieldByName('CCPUSER').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDFREG').AsdateTime:= DMCXP.cdsCanje.FieldByName('CCPFREG').AsDateTime;
   DMCXP.cdsDetCanje.FieldByName('DCDHREG').AsDateTime:= DMCXP.cdsCanje.FieldByName('CCPHREG').AsDateTime;
   DMCXP.cdsDetCanje.FieldByName('DCDAAAA').AsString  := DMCXP.cdsCanje.FieldByName('CCPANOC').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDMM').AsString    := DMCXP.cdsCanje.FieldByName('CCPMM').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDDD').AsString    := DMCXP.cdsCanje.FieldByName('CCPDD').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDTRI').AsString   := DMCXP.cdsCanje.FieldByName('CCPTRI').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDSEM').AsString   := DMCXP.cdsCanje.FieldByName('CCPSEM').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDSS').AsString    := DMCXP.cdsCanje.FieldByName('CCPSS').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDANOMM').AsString := DMCXP.cdsCanje.FieldByName('CCPANOMM').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDAATRI').AsString := DMCXP.cdsCanje.FieldByName('CCPAATRI').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDAASEM').AsString := DMCXP.cdsCanje.FieldByName('CCPAASEM').AsString;
   DMCXP.cdsDetCanje.FieldByName('DCDAASS').AsString  := DMCXP.cdsCanje.FieldByName('CCPAASS').AsString;
end;



procedure TFInserta.Button5Click(Sender: TObject);
begin
   GrabaDetCanje;
end;

procedure TFInserta.Button7Click(Sender: TObject);
var xSQL : string;
    xFecCanje,xFecProv : string;
    xContRNE : integer;  //reg no encontrados
    xContRA  :integer;//reg actualizados
    xContRNA  :integer;//reg no actualizados
begin
   xSQL:= ' SELECT   *  FROM CXP304 '+
          ' WHERE CIAID='+Quotedstr(dblcCia.text)+
          ' AND TCANJEID=''LE'''+
          ' AND (CCPFCJE<''31/12/2001'''+
          ' OR CPFEMIS IS NULL) '+
          ' ORDER BY CCPFCJE ';
   DMCXP.cdsCanje.IndexFieldNames := '';
   DMCXP.cdsCanje.close;
   DMCXP.cdsCanje.DataRequest(xSQL);
   DMCXP.cdsCanje.Open;
   dbg8.DataSource := DMCXP.dsCanje;
   lblTotalReg.Caption := inttostr(DMCXP.cdsCanje.recordcount);
   lblTotalReg.Refresh;
   xSQL:= ' SELECT * FROM CXP301'+
          ' WHERE CIAID='+Quotedstr(dblcCia.text);
//          ' AND  TDIARID=''48''';
   DMCXP.cdsMovCxP.IndexFieldNames :='CIAID;PROV;DOCID;CPNODOC';
   DMCXP.cdsMovCxP.Close;
   DMCXP.cdsMovCxP.DataRequest(xSQL);
   DMCXP.cdsMovCxP.Open;
   DMCXP.cdsMovCxP.FIRST;

   if DMCXP.cdsCanje.RecordCount>0 then
   begin
    xContRNE :=0;
    xContRA :=0;
    xContRNA :=0;

      xSQL := 'SELECT * FROM CXP308'+
              ' WHERE CIAID='+Quotedstr(dblcCia.text);
      DMCXP.cdsCCanje.IndexFieldNames :='';
      DMCXP.cdsCCanje.Close;
      DMCXP.cdsCCanje.DataRequest(xSQL);
      DMCXP.cdsCCanje.Open;
      DMCXP.cdsCCanje.IndexFieldNames:='CIAID;TCANJEID;CANJE;PROV';
      DMCXP.cdsCanje.First;
      xFecCanje :='';
      xFecProv  :='';
      pbTablas.Max      := DMCXP.cdsCanje.RecordCount;    // Cantidad de Tablas a Abrir;
      pbTablas.Position := 1;     // Cantidad de Registros a Abrir;

      While not DMCXP.cdsCanje.Eof do
      begin
         DMCXP.cdsCCanje.SetKey;
         DMCXP.cdsCCanje.FieldByName('CIAID').AsString    := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
         DMCXP.cdsCCanje.FieldByName('TCANJEID').AsString := DMCXP.cdsCanje.FieldByName('TCANJEID').AsString;
         DMCXP.cdsCCanje.FieldByName('CANJE').AsString := DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString;
         DMCXP.cdsCCanje.FieldByName('PROV').AsString := DMCXP.cdsCanje.FieldByName('PROV').AsString;
         if DMCXP.cdsCCanje.GotoKey then
            xFecCanje := Datetostr(DMCXP.cdsCCanje.FieldByName('CJFCANJE').AsDatetime);

         if length(xFecCanje)>0 then
            xSQL := ' UPDATE CXP304 SET CCPFCJE='+Quotedstr(xFecCanje);
         DMCXP.cdsMovCxP.SetKey;
         DMCXP.cdsMovCxP.FieldByName('CIAID').AsString   := DMCXP.cdsCanje.FieldByName('CIAID').AsString;
         DMCXP.cdsMovCxP.FieldByName('PROV').AsString    := DMCXP.cdsCanje.FieldByName('PROV').AsString;
         DMCXP.cdsMovCxP.FieldByName('DOCID').AsString   := DMCXP.cdsCanje.FieldByName('DOCID').AsString;
         DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString :=DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
         if DMCXP.cdsMovCxP.GotoKey then
            xFecProv := Datetostr(DMCXP.cdsMovCxP.fieldbyname('CPFEMIS').AsDateTime);
         if length(xFecProv)>0 then
            xSQL:= xSQL +', CPFEMIS='+Quotedstr(xFecProv);

         if length(xSQL)>0 then
            begin
            xSQL := xSQL+' WHERE CIAID='+Quotedstr(DMCXP.cdsCanje.FieldByName('CIAID').AsString)+
                         ' AND TCANJEID='+Quotedstr(DMCXP.cdsCanje.FieldByName('TCANJEID').AsString)+
                         ' AND CCPCANJE='+Quotedstr(DMCXP.cdsCanje.FieldByName('CCPCANJE').AsString)+
                         ' AND PROV='+Quotedstr(DMCXP.cdsCanje.FieldByName('PROV').AsString);
            try
              DMCXP.DCOM1.AppServer.IniciaTransaccion;
              DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
              DMCXP.DCOM1.AppServer.GrabaTransaccion;
              xContRA := xContRA+1;
            except
              DMCXP.DCOM1.AppServer.RetornaTransaccion;
              xContRNA := xContRNA+1;

            end;
         end
         else
            xContRNE := xContRNE +1;

         lblSave.Caption := inttostr(xContRA);
         lblSave.Refresh;
         lblNoSave.Caption := inttostr(xContRNA);
         lblNoSave.Refresh;
         lblNoFind.Caption := inttostr(xContRNE);
         lblNoFind.Refresh;
         pbTablas.Position:=pbTablas.Position+1;
         DMCXP.cdsCanje.Next;
         xFecCanje :='';
         xFecProv  :='';
      end;
   end
   else
      raise exception.create('No existen datos!!!!!');
   Showmessage('ok');   


end;

procedure TFInserta.Button8Click(Sender: TObject);
var
   xSQL : string;
begin
  xSQL := ' SELECT * FROM CXP308 '+
          ' WHERE CJAAMM='+Quotedstr(edtAnoMM.text);
  DMCXP.cdsCCanje.Close;
  DMCXP.cdsCCanje.DataRequest(xSQL);
  DMCXP.cdsCCanje.Open;
  if DMCXP.cdsCCanje.RecordCount>0 then
  begin
    DMCXP.cdsCCanje.First;
    while not DMCXP.cdsCCanje.Eof do
    begin
        DMCXP.cdsCCanje.Next;
    end;
  end;

end;

procedure TFInserta.Button9Click(Sender: TObject);
var
   xSQL : string;
   xContA,xContNa : integer;
   xNReg : string;
begin
  xSQL := ' SELECT * FROM LXPINDU';
  DMCXP.cdsQry2.Close;
  DMCXP.cdsQry2.DataRequest(xSQL);
  DMCXP.cdsQry2.Open;
  DMCXP.cdsQry2.First;



  dbgn1.DataSource := DMCXP.dsQry2;
  DMCXP.cdsQry2.DisableControls;
  while not DMCXP.cdsQry2.Eof do
  begin
    xNReg:='';
    xNReg := DMCXP.cdsQry2.fieldbyname('CPNOREG').AsString;
    xSQL :=   ' UPDATE LXPINDU SET CPNOREG='+Quotedstr(Strzero(xNReg,10))
             +' WHERE CPNOREG='+Quotedstr(DMCXP.cdsQry2.fieldbyname('CPNOREG').AsString);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
      xContA := xContA+1;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      xContNA := xContNA+1;

    end;
    
    DMCXP.cdsQry2.Next;
  end;
  showmessage('ok'+inttostr(xContA)+ 'no ok '+inttostr(xContNA));

end;

procedure TFInserta.Button10Click(Sender: TObject);
var
   xSQL : string;
   xContA,xContNA : integer;
begin
  xSQL :=    ' SELECT * FROM LXPICSA'
            +' ORDER BY CPNOREG ';
  DMCXP.cdsQry2.Close;
  DMCXP.cdsQry2.DataRequest(xSQL);
  DMCXP.cdsQry2.Open;
  DMCXP.cdsQry2.DisableControls;
  dbgn1.DataSource :=  DMCXP.dsQry2;
  DMCXP.cdsQry2.First;
  while not DMCXP.cdsQry2.Eof do
  begin
     xSQL := 'UPDATE CXP301 SET FLAGVAR2='+Quotedstr('P')
           +' WHERE CIAID='+Quotedstr(edtCompania.text)
           +' AND TDIARID=''47'' '
           +' AND CPESTADO=''P'' '
           +' AND CPNOREG='+Quotedstr(DMCXP.cdsQry2.fieldbyname('CPNOREG').AsString);
     try
       DMCXP.DCOM1.AppServer.IniciaTransaccion;
       DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
       DMCXP.DCOM1.AppServer.GrabaTransaccion;
       xContA := xContA+1;
     except
       DMCXP.DCOM1.AppServer.RetornaTransaccion;
       xContNA := xContNA+1;

     end;


     DMCXP.cdsQry2.Next;
  end;
  showmessage('ok: '+inttostr(xContA)+ ' no ok : '+inttostr(xContNA));
end;

procedure TFInserta.dblcAntClAuxExit(Sender: TObject);
var
   xSQL : string;
begin

end;

procedure TFInserta.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;

end;

procedure TFInserta.Button11Click(Sender: TObject);
var
   xNuevoProv, xClaseAux, xProvAnt : String;
   xAntRuc,xNueRuc : string;
   xSQL : string;
begin

{    if length(dblcAntClAux.Text)=0 then
      raise exception.Create('Ingrese Clase Auxiliar');

    if length(dblcdAntProv.Text)=0 then
      raise exception.Create('Ingrese Antiguo Proveedor!!!');

    if length(dblcNueClAux.Text)=0 then
      raise exception.Create('Ingrese Clase Auxiliar');

    if length(dblcdNueProv.Text)=0 then
      raise exception.Create('Ingrese Nuevo Proveedor!!!');

    if length(edtAntRuc.Text)=0 then
    begin
       if MessageDlg('El Provedor Antiguo no tine R.U.C'+chr(13)
       +'      ¿Continuar con Recodificación?       ',mtConfirmation, [mbYes, mbNo], 0)=mrNo then
          exit;
    end;

    if length(edtNueRuc.Text)=0 then
    begin
       if MessageDlg('El Provedor Nuevo no tine R.U.C'+chr(13)
       +'      ¿Continuar con Recodificación?       ',mtConfirmation, [mbYes, mbNo], 0)=mrNo then
          exit;
    end; }
    xSQL := ' SELECT * FROM TGE201 '+
            ' WHERE CLAUXID=''01'' '+
            ' AND SUBSTR(PROVEMAI,1,4)=''0000'' '+
            ' AND COALESCE(TIPDIARID,'''')=''S'' '+
            ' ORDER BY PROVEMAI ';
    DMCXP.cdsQry2.Close;
    DMCXP.cdsQry2.DataRequest(xSQL);
    DMCXP.cdsQry2.Open;
    dblcAntClAux.Text := '';
    dblcdAntProv.Text :='';
    edtAntRuc.Text :='';
    dblcNueClAux.Text := '';
    dblcdNueProv.Text := '';
    edtNueRuc.Text :='';


    DMCXP.cdsQry2.first;
    while not DMCXP.cdsQry2.Eof do
    begin
       dblcAntClAux.Text := DMCXP.cdsQry2.fieldbyname('CLAUXID').AsString;
       dblcdAntProv.Text := DMCXP.cdsQry2.fieldbyname('PROV').AsString;
       edtAntRuc.Text    := DMCXP.cdsQry2.fieldbyname('PROVRUC').AsString;
       dblcNueClAux.Text := DMCXP.cdsQry2.fieldbyname('CLAUXID').AsString;
       dblcdNueProv.Text := DMCXP.cdsQry2.fieldbyname('PROVEMAI').AsString;
       edtNueRuc.Text    := DMCXP.cdsQry2.fieldbyname('PROVRUC').AsString;



    Screen.Cursor:=crHourGlass;

    xNuevoProv := dblcdNueProv.Text;
    xClaseAux  := dblcNueClAux.Text;
    xProvAnt   := dblcdAntProv.Text;


    xSQL :=  ' update CAJA301 set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where CLAUXID='+quotedstr(xClaseAux)+' and PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update CAJA302'+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where CLAUXID='+quotedstr(xClaseAux)+' and PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;



    xSQL :=  ' update CAJA303'+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where CLAUXID='+quotedstr(xClaseAux)+' and PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' delete from CNT201 '+
             ' where CLAUXID='+quotedstr(xClaseAux)+' and AUXID='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update CNT301'+
             ' set AUXID='+quotedstr(xNuevoProv)+
             ' where CLAUXID='+quotedstr(xClaseAux)+' and AUXID='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update CNT303'+
             ' set AUXID='+quotedstr(xNuevoProv) +
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where CLAUXID='+quotedstr(xClaseAux)+' and AUXID='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update CNT311'+
             ' set AUXID='+quotedstr(xNuevoProv)+
             ' where CLAUXID='+quotedstr(xClaseAux)+' and AUXID='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update CNT351 '+
             ' set AUXID='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where CLAUXID='+quotedstr(xClaseAux)+' and AUXID='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' delete from CNT401 '+
             ' where CLAUXID='+quotedstr(xClaseAux)+' and AUXID='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update CXP301 '+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+             
             ' where CLAUXID='+quotedstr(xClaseAux)+' and PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update CXP302 '+
             ' set DCPAUXID='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where CLAUXID='+quotedstr(xClaseAux)+' and DCPAUXID='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update CXP303 '+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where CLAUXID='+quotedstr(xClaseAux)+' and PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update CXP304'+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where CLAUXID='+quotedstr(xClaseAux)+' and PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update CXP305'+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where CLAUXID='+quotedstr(xClaseAux)+' and PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update CXP308'+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where CLAUXPROV='+quotedstr(xClaseAux)+' and PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' delete from CXP310'+
             ' where CLAUXPROV='+quotedstr(xClaseAux)+' and PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' delete from CXP311'+
             ' where CLAUXID='+quotedstr(xClaseAux)+' and PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;



    xSQL :=  ' update LOG201'+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+             
             ' where PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update LOG304 '+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+             
             ' where PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update LOG305 '+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update LOG311'+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+             
             ' where PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update LOG312'+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update LOG314 '+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update LOG315 '+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update LOG318 '+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' update LOG327'+
             ' set PROV='+quotedstr(xNuevoProv)+
             ' ,PROVRUC='+quotedstr(edtNueRuc.Text)+
             ' where PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    xSQL :=  ' delete from TGE401'+
             ' where CLAUXID='+quotedstr(xClaseAux)+' and AUXID='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;
    if CheckBox1.Checked  then
    begin
      xSQL:=  ' insert into TGE201(PROV,PROVDES,PROVABR,PROVRUC,PROVGIRA,PROVDIR,PROVCZIP,'+
              ' PROVTELF,PROVFAX,PROVREPR,PROVSALL,CLAUXID,TIPPERID,PROVAPEPAT,PROVAPEMAT,PROVUFMOV,ACTXOC,PROVEMAI,'+
              ' PROVEXONER,PROVNOMCOM,PROVRETIGV,USERID,FREG,HREG)'+
              ' SELECT '+Quotedstr(dblcdNueProv.text)+',PROVDES,PROVABR,PROVRUC,PROVGIRA,PROVDIR,PROVCZIP,'+
              ' PROVTELF,PROVFAX,PROVREPR,PROVSALL,'+Quotedstr(dblcNueClAux.text)+',TIPPERID,PROVAPEPAT,PROVAPEMAT,PROVUFMOV,ACTXOC,PROVEMAI,'+
              ' PROVEXONER,PROVNOMCOM,PROVRETIGV,'+Quotedstr(DMCXP.wUsuario)+',CURRENT DATE,CURRENT TIME'+
              ' FROM TGE201 '+
              ' WHERE CLAUXID='+Quotedstr(dblcAntClAux.text)+
              ' AND PROV='+Quotedstr(dblcdAntProv.text);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    end;


    xSQL :=  ' delete from TGE201'+
             ' where CLAUXID='+quotedstr(dblcAntClAux.text)+' and PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;


    ///////
       dblcAntClAux.Text := '';
       dblcdAntProv.Text := '';
       edtAntRuc.Text    := '';
       dblcNueClAux.Text := '';
       dblcdNueProv.Text := '';
       edtNueRuc.Text    := '';

       DMCXP.cdsQry2.Next;

    end;


    Screen.Cursor:=crDefault;
    Showmessage('Ok');
end;

procedure TFInserta.Button12Click(Sender: TObject);
var
  xSQL : string;
  xi   : integer;
begin
  Screen.Cursor:=crHourGlass;
  xSQL:= ' SELECT * FROM CXP308 '+
         ' WHERE MTORETIGV>0 ';
         if length(edtCje.Text)>0 then
            xSQL:= xSQL+' AND CANJE='+Quotedstr(edtCje.Text);

         xSQL:= xSQL+' ORDER BY CANJE ';
  DMCXP.cdsCCanje.Close;
  DMCXP.cdsCCanje.DataRequest(xSQL);
  DMCXP.cdsCCanje.Open;
  DMCXP.cdsCCanje.DisableControls;
  dbgCCanje.DataSource := DMCXP.dsCCanje;
  dbgCanje.DataSource := DMCXP.dsCanje;
  dbgLetras.DataSource := DMCXP.dsLetras;
  xi:=0;
  DMCXP.cdsCCanje.First;
  lblCont.caption :='';
  while not DMCXP.cdsCCanje.Eof do
  begin
     FiltraCanje;
     GeneraDetalleRetencion;
     DMCXP.cdsCCanje.Next;
     xi:= xi+1;
     lblCont.caption := floattostr(xi);
     lblCont.Refresh;
  end;
  Screen.Cursor:=crDefault;

end;

Procedure TFInserta.FiltraCanje;
var
   xFiltro : String;
begin
	 xFiltro := 'CIAID='''+DMCXP.cdsCCanje.FieldByName('CIAID').AsString+''' AND CLAUXID='''+DMCXP.cdsCCanje.FieldByName('CLAUXID').AsString
							+''' and PROV='+quotedstr(DMCXP.cdsCCanje.FieldByName('PROV').AsString);
	 Filtracds( DMCXP.cdsMovCxP,'Select * from CXP301 Where '+xFiltro );

	 DMCXP.cdsMovCxP.Filtered := False;

	 DMCXP.cdsMovCxP.Filter   := '( ( CPSALLOC>0 OR CPSALEXT > 0 ) and CPSALORI > 0) AND '+
														 'CPESTADO='+''''+'P'           +''''+' and '+
														 'CPCANJE<>'+''''+DMCXP.cdsCCanje.FieldByName('CANJE').AsString+''''+' and '+
														 'FLAGVAR<>'+''''+'XX'+'''';

	 xFiltro := 'CIAID='   +''''+DMCXP.cdsCCanje.FieldByName('CIAID').AsString+''''+' AND '+
							'TCANJEID='+''''+'LE'         +''''+' AND '+
							'CCPCANJE='+''''+DMCXP.cdsCCanje.FieldByName('CANJE').AsString+'''';
	 Filtracds( DMCXP.cdsCanje,'Select * from CXP304 Where '+xFiltro );

   xFiltro := 'CIAID='   +''''+DMCXP.cdsCCanje.FieldByName('CIAID').AsString+''''+' and '+
              'TCANJEID='+''''+'LE'         +''''+' and '+
              'CCPCANJE='+''''+DMCXP.cdsCCanje.FieldByName('CANJE').AsString+'''';
   Filtracds( DMCXP.cdsDetCanje,'Select * from CXP305 Where '+xFiltro );

   xFiltro := 'CIAID='   +''''+DMCXP.cdsCCanje.FieldByName('CIAID').AsString+''''+' and '+
              'TCANJEID='+''''+'LE'         +''''+' and '+
              'CPCANJE=' +''''+DMCXP.cdsCCanje.FieldByName('CANJE').AsString+'''';
   Filtracds( DMCXP.cdsLetras,'Select * from CXP301 Where '+xFiltro );

   //CIM 02/09/2002
   xFiltro :=  ' CIAID='+Quotedstr(DMCXP.cdsCCanje.FieldByName('CIAID').AsString)+
              ' AND PROV='+Quotedstr(DMCXP.cdsCCanje.FieldByName('PROV').AsString)+
              ' AND CANJE='+Quotedstr(DMCXP.cdsCCanje.FieldByName('CANJE').AsString);
   Filtracds( DMCXP.cdsDetRet,'Select * from CXP313 Where '+xFiltro );
end;
procedure TFInserta.GeneraDetalleRetencion;
var
   xSQL : string;
   xTTotLetOri,xTTotLetLoc,xTTotLetExt,
   xTotNetoOri,xTotNetoLoc,xTotNetoExt,
	 xTotRetOri,xTotRetLoc,xTotRetExt,
	 xTemRetOri,xTemRetLoc,xTemRetExt,
	 xTasaRet,xTotPorc,xPorc,xTotRetIGV : double;
	 xMtoAfectoO,xMtoAfectoL,	xMtoAfectoE : double;

	 bUltLetra,bUltFact : boolean;
	 xTasaFec : TDatetime;
	 xResta : double;
begin
   //Calcula Total Pago
   //*
   xSQL:='Select TASAMTO, TASACAN, TASADES,TASAFEC from TGE108 Where TASAFLG=''R''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.Datarequest( xSQL );
   DMCXP.cdsQry.Open;
   if DMCXP.cdsQry.RecordCount=0 then
   begin
      ShowMessage('No hay Tasa de Retención definida');
      exit;
   end;
   xTasaRet := FRound(DMCXP.cdsQry.FieldByname('TASACAN').AsFloat/100,15,2);
   xTasaFec := DMCXP.cdsQry.FieldByname('TASAFEC').AsDateTime;

   DMCXP.cdsLetras.DisableControls;
   xTTotLetOri := 0;
   xTTotLetLoc := 0;
   xTTotLetExt := 0;
   xTotRetOri  := 0;
   xTotRetLoc  := 0;
   xTotRetExt  := 0;
   xTotNetoOri := 0;
   xTotNetoLoc := 0;
   xTotNetoExt := 0;
   xTemRetOri  := 0;
   xTemRetLoc  := 0;
   xTemRetExt  := 0;
   xTotRetIGV  := 0;
   bUltLetra   := false;
	 bUltFact    := false;

   if DMCXP.cdsDetRet.RecordCount>0 then
   begin
      DMCXP.cdsDetRet.First;

      while not DMCXP.cdsDetRet.Eof do begin
            DMCXP.cdsDetRet.Delete
			end;
			DMCXP.cdsDetRet.Edit;
			DMCXP.cdsDetRet.Post;
	 end;

	 /////////////////////
	 xSQL:= ' SELECT CXP304.*,TGE110.DOCRETIGV '+
					' FROM CXP304 LEFT JOIN TGE110 ON CXP304.DOCID=TGE110.DOCID  '+
					' WHERE CIAID='+Quotedstr(DMCXP.cdsCCanje.FieldByName('CIAID').AsString)+
					' AND TCANJEID='+Quotedstr('LE')+
					' AND CCPCANJE='+Quotedstr(DMCXP.cdsCCanje.FieldByName('CANJE').AsString)+
					' AND TGE110.DOCMOD=''CXP'' '+
					' AND TGE110.DOCRETIGV=''S''';
	 DMCXP.cdsCanjeClone.Filter := '';
	 DMCXP.cdsCanjeClone.Filtered := false;
	 DMCXP.cdsCanjeClone.Close;
	 DMCXP.cdsCanjeClone.DataRequest(xSQL);
	 DMCXP.cdsCanjeClone.Open;
	 /////////////////////


	 DMCXP.cdsLetras.First ;
	 while not DMCXP.cdsLetras.eof do
	 begin
			xTTotLetOri := xTTotLetOri + DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat;
			xTTotLetLoc := xTTotLetLoc + DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat;
			xTTotLetExt := xTTotLetExt + DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat;
			DMCXP.cdsLetras.Next;
	 end;
	 xTotRetOri := DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat;
	 if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
	 begin
			xTotRetLoc := DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat;
			xTotRetExt := FRound(DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat/DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,2);
	 end
	 else
			if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
			begin
			xTotRetLoc := FRound(DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat*DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,2);
			xTotRetExt := DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat;
			end;


	 DMCXP.cdsLetras.First ;
	 DMCXP.cdsCanje.DisableControls;
	 DMCXP.cdsCanjeClone.First;

	 While not DMCXP.cdsLetras.Eof do
	 begin

		 if DMCXP.cdsLetras.RecNo=DMCXP.cdsLetras.RecordCount then
		 begin
				xPorc := Fround(100-xTotPorc,15,2);
				if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
				begin
					 xTemRetOri := Fround(xTotRetOri-xTotRetIgv,15,3);
					 xTemRetLoc := xTemRetOri;
					 xTemRetExt := Fround(xTemRetOri/DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3)
				end
				else
					if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
					begin
						 xTemRetOri := FRound(xTotRetOri-xTotRetIgv,15,3);
						 xTemRetExt := xTemRetOri;
						 xTemRetLoc := Fround(xTemRetOri*DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3)
					end;

		 end
		 else
		 begin
				if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
				begin
//           xPorc := FRound((DMCXP.cdsLetras.fieldbyname('CPMTOLOC').AsFloat/xTTotLetLoc)*100,15,4);
					 xPorc := FRound(FRound((DMCXP.cdsLetras.fieldbyname('CPMTOLOC').AsFloat/xTTotLetLoc),15,4)*100,15,2);
					 xTemRetOri := FRound(xTotRetOri*FRound(xPorc/100,15,4),15,3);
					 xTemRetLoc := xTemRetOri;
					 xTemRetExt := Fround(xTemRetOri/DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3)
				end
				else
					if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
					begin
						 xPorc := FRound(FRound((DMCXP.cdsLetras.fieldbyname('CPMTOEXT').AsFloat/xTTotLetExt),15,4)*100,15,2);
						 xTemRetOri := FRound(xTotRetOri*FRound(xPorc/100,15,4),15,3);
						 xTemRetExt := xTemRetOri;
						 xTemRetLoc := Fround(xTemRetOri*DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3)
					end;
		 end;


		 if DMCXP.cdsLetras.RecNo=DMCXP.cdsLetras.RecordCount then
		 begin
				bUltLetra := true ;
				DMCXP.cdsLetras.Edit;
				DMCXP.cdsLetras.FieldByName('CPNOGRAV').AsFloat   := FRound(xTotRetOri-xTotRetIgv,15,2);
				DMCXP.cdsLetras.fieldbyname('PROVRETIGV').AsString := 'S';  // Indica que el Documento está sujeto a retención IGV.
				DMCXP.cdsLetras.Post;
		 end
		 else
		 begin
			 bUltLetra := false;
			 DMCXP.cdsLetras.Edit;
			 DMCXP.cdsLetras.FieldByName('CPNOGRAV').AsFloat   :=   FRound(xTemRetOri,15,2);
			 DMCXP.cdsLetras.fieldbyname('PROVRETIGV').AsString := 'S';  // Indica que el Documento está sujeto a retención IGV.
			 DMCXP.cdsLetras.Post;
		 end;
		 xTotRetIGV := FRound(xTotRetIGV+xTemRetOri,15,3);

		 While not DMCXP.cdsCanjeClone.Eof do
		 begin
				xSQL:='select DOCRETIGV from TGE110 '
							+'where DOCMOD=''CXP'' and DOCID='''+DMCXP.cdsCanjeClone.FieldByName('DOCID').AsString+'''';
				DMCXP.cdsQry.Close;
				DMCXP.cdsQry.Datarequest( xSQL );
				DMCXP.cdsQry.Open;
				////LO NUEVO
				xSQL :=  ' SELECT * FROM CXP301 '+
								 ' WHERE CIAID='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('CIAID').AsString)+
								 ' AND TDIARID='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('TDIARID').AsString)+
								 ' AND CPANOMES='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('CCPANOMM').AsString)+
								 ' AND DOCID='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('DOCID').AsString)+
								 ' AND CPSERIE='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('CPSERIE').AsString)+
								 ' AND CPNODOC='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('CPNODOC').AsString)+
								 ' AND (CPESTADO=''P'' OR CPESTADO=''C'')';

				///
				DMCXP.cdsMovCxP.IndexFieldNames:='';
				DMCXP.cdsMovCxP.Filter:='';
				DMCXP.cdsMovCxP.Filtered:= false;
				DMCXP.cdsMovCxP.Close;
				DMCXP.cdsMovCxP.DataRequest(xSQL);
				DMCXP.cdsMovCxP.Open;
				xMtoAfectoO := DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat;
				if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
				begin
					xMtoAfectoL:=DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat;
					xMtoAfectoE:=FRound((DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat)/DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat,15,2);
				end
				else
				if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonExt then
				begin
					xMtoAfectoE:=DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat;
					xMtoAfectoL:=FRound((DMCXP.cdsMovCxP.fieldbyname('CPGRAVAD').AsFloat+DMCXP.cdsMovCxP.fieldbyname('CPIGV').AsFloat)*DMCXP.cdsMovCxP.fieldbyname('CPTCAMPR').AsFloat,15,2);
				end;

				if ((DMCXP.cdsQry.FieldByName('DOCRETIGV').AsString='S') and  (DMCXP.cdsMovCxp.FieldByName('CPFEMIS').AsDateTime>=xTasaFec) )then
				begin

					 DMCXP.cdsDetRet.Insert;
					 DMCXP.cdsDetRet.FieldByName('CIAID').AsString    := DMCXP.cdsLetras.fieldbyname('CIAID').AsString;
					 DMCXP.cdsDetRet.FieldByName('TCANJEID').AsString := DMCXP.cdsLetras.fieldbyname('TCANJEID').AsString;
					 DMCXP.cdsDetRet.FieldByName('CANJE').AsString    := DMCXP.cdsLetras.fieldbyname('CPCANJE').AsString;
					 DMCXP.cdsDetRet.FieldByName('CLAUXID').AsString  := DMCXP.cdsLetras.fieldbyname('CLAUXID').AsString;
					 DMCXP.cdsDetRet.FieldByName('PROV').AsString     := DMCXP.cdsLetras.fieldbyname('PROV').AsString;
					 DMCXP.cdsDetRet.FieldByName('PROVRUC').AsString  := DMCXP.cdsLetras.fieldbyname('PROVRUC').AsString;
					 DMCXP.cdsDetRet.FieldByName('CPANOMES').AsString := DMCXP.cdsLetras.fieldbyname('CPANOMES').AsString;
					 DMCXP.cdsDetRet.FieldByName('CJTCAMBIO').AsFloat := DMCXP.cdsLetras.fieldbyname('CPTCAMPR').AsFloat;
					 DMCXP.cdsDetRet.FieldByName('CPRETFEMIS').AsDatetime := DMCXP.cdsCCanje.fieldbyname('CJFCANJE').AsDateTime;

					 DMCXP.cdsDetRet.FieldByName('TMONID').AsString     := DMCXP.cdsLetras.fieldbyname('TMONID').AsString;
					 DMCXP.cdsDetRet.FieldByName('CPNOREGLET').AsString := DMCXP.cdsLetras.fieldbyname('CPNOREG').AsString;
					 DMCXP.cdsDetRet.FieldByName('DOCID').AsString      := DMCXP.cdsLetras.fieldbyname('DOCID').AsString;
					 DMCXP.cdsDetRet.FieldByName('CPSERIE').AsString    := DMCXP.cdsLetras.fieldbyname('CPSERIE').AsString;
					 DMCXP.cdsDetRet.FieldByName('CPNODOC').AsString    := DMCXP.cdsLetras.fieldbyname('CPNODOC').AsString;
					 DMCXP.cdsDetRet.FieldByName('CPFEMIS').AsDatetime  := DMCXP.cdsLetras.fieldbyname('CPFEMIS').AsDatetime;
					 DMCXP.cdsDetRet.FieldByName('CPFVCMTO').AsDatetime := DMCXP.cdsLetras.fieldbyname('CPFVCMTO').AsDatetime;

					 DMCXP.cdsDetRet.FieldByName('CPMTOORI').AsFloat    := DMCXP.cdsLetras.fieldbyname('CPMTOORI').AsFloat;
					 DMCXP.cdsDetRet.FieldByName('CPMTOLOC').AsFloat    := DMCXP.cdsLetras.fieldbyname('CPMTOLOC').AsFloat;
					 DMCXP.cdsDetRet.FieldByName('CPMTOEXT').AsFloat    := DMCXP.cdsLetras.fieldbyname('CPMTOEXT').AsFloat;

					 if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
					 begin
							if DMCXP.cdsLetras.RecNo=DMCXP.cdsLetras.RecordCount then
								 DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat :=FRound(100-xTotPorc,15,2)
							else
//                  DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat := FRound((DMCXP.cdsLetras.fieldbyname('CPMTOLOC').AsFloat/xTTotLetLoc)*100,15,4);
									DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat := FRound(FRound((DMCXP.cdsLetras.fieldbyname('CPMTOLOC').AsFloat/xTTotLetLoc),15,4)*100,15,2);
					 end
					 else
							if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
							begin
								 if DMCXP.cdsLetras.RecNo=DMCXP.cdsLetras.RecordCount then
										DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat :=FRound(100-xTotPorc,15,2)
								 else
//                    DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat := FRound((DMCXP.cdsLetras.fieldbyname('CPMTOEXT').AsFloat/xTTotLetExt)*100,15,4);
										DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat := FRound(FRound((DMCXP.cdsLetras.fieldbyname('CPMTOEXT').AsFloat/xTTotLetExt),15,4)*100,15,2);
							end;

					 if bUltLetra then
					 begin
							DMCXP.cdsDetRet.FieldByName('CPNETOORI').AsFloat  :=	 xMtoAfectoO - OperClientDataSet( DMCXP.cdsDetRet, 'SUM(CPNETOORI)', 'CPSERIE2='
							+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPSERIE').AsString)+' AND CPNODOC2='+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPNODOC').AsString));

							DMCXP.cdsDetRet.FieldByName('CPNETOLOC').AsFloat  :=   xMtoAfectoL - OperClientDataSet( DMCXP.cdsDetRet, 'SUM(CPNETOLOC)', 'CPSERIE2='
							+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPSERIE').AsString)+' AND CPNODOC2='+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPNODOC').AsString));

							DMCXP.cdsDetRet.FieldByName('CPNETOEXT').AsFloat  :=   xMtoAfectoE - OperClientDataSet( DMCXP.cdsDetRet, 'SUM(CPNETOEXT)', 'CPSERIE2='
							+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPSERIE').AsString)+' AND CPNODOC2='+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPNODOC').AsString));

							DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat:= FRound(100-xTotPorc,15,2);
							if DMCXP.cdsCanjeClone.RecNo=DMCXP.cdsCanjeClone.RecordCount then
							begin
								DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat:= xTemRetOri;
								DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat:= xTemRetLoc;
								DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat:= xTemRetExt;
							end
							else
							begin
								 if DMCXP.cdsCanjeClone.RecNo=DMCXP.cdsCanjeClone.RecordCount then
                 begin
                    DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat:= xTemRetOri;
                    DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat:= xTemRetLoc;
                    DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat:= xTemRetExt;
                 end
                 else
                 begin
										if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
											 DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPNETOLOC').AsFloat*xTasaRet,15,3)
										else
                        if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
                           DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPNETOEXT').AsFloat*xTasaRet,15,3);

										if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
										begin
												DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat  := DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat;
												DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat/DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3);
										end
										else
                       if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
                       begin
                          DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat*DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3);
                          DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat  := DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat;
                       end;
                 end;

                 xTemRetOri := FRound(xTemRetOri -DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat,15,3);
                 xTemRetLoc := FRound(xTemRetLoc -DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat,15,3);
                 xTemRetExt := FRound(xTemRetExt -DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat,15,3);
              end;

					 end
           else
           begin

							DMCXP.cdsDetRet.FieldByName('CPNETOORI').AsFloat  := Fround(xMtoAfectoO*FRound((DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat/100),8,4),15,2);
							DMCXP.cdsDetRet.FieldByName('CPNETOLOC').AsFloat  := Fround(xMtoAfectoL*FRound((DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat/100),8,4),15,2);
              DMCXP.cdsDetRet.FieldByName('CPNETOEXT').AsFloat  := Fround(xMtoAfectoE*FRound((DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat/100),8,4),15,2);

              if DMCXP.cdsCanjeClone.RecNo=DMCXP.cdsCanjeClone.RecordCount then
              begin
                 DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat:= xTemRetOri;
                 DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat:= xTemRetLoc;
                 DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat:= xTemRetExt;
              end
              else
							begin
								 if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
										DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPNETOLOC').AsFloat*xTasaRet,15,3)
								 else
										if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
   										 DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPNETOEXT').AsFloat*xTasaRet,15,3);										

								 if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
								 begin
										DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat  := DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat;
										DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat/DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3);
								 end
								 else
										if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
										begin
											 DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat*DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3);
											 DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat  := DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat;
										end;
								 xTemRetOri := FRound(xTemRetOri -DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat,15,3);
                 xTemRetLoc := FRound(xTemRetLoc -DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat,15,3);
                 xTemRetExt := FRound(xTemRetExt -DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat,15,3);
              end;

           end;

					 DMCXP.cdsDetRet.FieldByName('TMONID2').AsString     := DMCXP.cdsCanjeClone.fieldbyname('TMONID').AsString;
           DMCXP.cdsDetRet.FieldByName('DOCID2').AsString      := DMCXP.cdsCanjeClone.fieldbyname('DOCID').AsString;
           DMCXP.cdsDetRet.FieldByName('CPSERIE2').AsString    := DMCXP.cdsCanjeClone.fieldbyname('CPSERIE').AsString;
           DMCXP.cdsDetRet.FieldByName('CPNODOC2').AsString    := DMCXP.cdsCanjeClone.fieldbyname('CPNODOC').AsString;
           DMCXP.cdsDetRet.FieldByName('CPFEMIS2').AsDatetime  := DMCXP.cdsCanjeClone.fieldbyname('CPFEMIS').AsDatetime;
           DMCXP.cdsDetRet.FieldByName('CPFVCMTO2').AsDatetime := DMCXP.cdsCanjeClone.fieldbyname('CPFVCMTO').AsDatetime;

           DMCXP.cdsDetRet.FieldByName('CPMTOORI2').AsFloat    := xMtoAfectoO;
           DMCXP.cdsDetRet.FieldByName('CPMTOLOC2').AsFloat    := xMtoAfectoL;
           DMCXP.cdsDetRet.FieldByName('CPMTOEXT2').AsFloat    := xMtoAfectoE;
           DMCXP.cdsDetRet.FieldByName('CPANOMES2').AsString   := DMCXP.cdsCanjeClone.fieldbyname('CCPANOMM').AsString;
           DMCXP.cdsDetRet.FieldByName('CPTCAMPR').AsFloat     := DMCXP.cdsCanjeClone.fieldbyname('CCPTCDOC').AsFloat;

           DMCXP.cdsDetRet.FieldByName('CPFREG').value         := Date;
           DMCXP.cdsDetRet.FieldByName('CPHREG').value         := Time;
           DMCXP.cdsDetRet.FieldByName('CPUSER').AsString      := DMCXP.wUsuario;
           DMCXP.cdsDetRet.Post;
           DMCXP.cdsCanjeClone.Next;
        end
        else
        begin
          DMCXP.cdsCanjeClone.Next;
        end;

     end;//canje

     DMCXP.cdsLetras.Next;
     xTotPorc := FRound(xTotPorc+DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat,15,2);
     DMCXP.cdsCanjeClone.First;
   end;
   DMCXP.AplicaDatos( DMCXP.cdsDetRet, 'DetRet'  );
   DMCXP.cdsCanje.EnableControls;
   DMCXP.cdsLetras.EnableControls;
end;
/////////////
{procedure TFInserta.GeneraDetalleRetencion;
var
	 xSQL : string;
	 xTTotLetOri,xTTotLetLoc,xTTotLetExt,
	 xTotNetoOri,xTotNetoLoc,xTotNetoExt,
	 xTotRetOri,xTotRetLoc,xTotRetExt,
	 xTemRetOri,xTemRetLoc,xTemRetExt,
	 xTasaRet,xTotPorc,xPorc,xTotRetIGV : double;
	 bUltLetra,bUltFact : boolean;
	 xTasaFec : TDatetime;
begin
	 //Calcula Total Pago
	 //*
	 xSQL:='Select TASAMTO, TASACAN, TASADES,TASAFEC from TGE108 Where TASAFLG=''R''';
	 DMCXP.cdsQry.Close;
	 DMCXP.cdsQry.Datarequest( xSQL );
	 DMCXP.cdsQry.Open;
	 if DMCXP.cdsQry.RecordCount=0 then
	 begin
			ShowMessage('No hay Tasa de Retención definida');
			exit;
	 end;
	 xTasaRet := FRound(DMCXP.cdsQry.FieldByname('TASACAN').AsFloat/100,15,2);
	 xTasaFec := DMCXP.cdsQry.FieldByname('TASAFEC').AsDateTime;

	 DMCXP.cdsLetras.DisableControls;
	 xTTotLetOri := 0;
	 xTTotLetLoc := 0;
	 xTTotLetExt := 0;
	 xTotRetOri  := 0;
	 xTotRetLoc  := 0;
	 xTotRetExt  := 0;
	 xTotNetoOri := 0;
	 xTotNetoLoc := 0;
   xTotNetoExt := 0;
   xTemRetOri  := 0;
   xTemRetLoc  := 0;
   xTemRetExt  := 0;
   xTotRetIGV  := 0;
   bUltLetra   := false;
   bUltFact    := false;

   if DMCXP.cdsDetRet.RecordCount>0 then
   begin
      DMCXP.cdsDetRet.First;

      while not DMCXP.cdsDetRet.Eof do begin
            DMCXP.cdsDetRet.Delete
			end;
			DMCXP.cdsDetRet.Edit;
			DMCXP.cdsDetRet.Post;
	 end;

	 /////////////////////
	 xSQL:= ' SELECT CXP304.*,TGE110.DOCRETIGV '+
					' FROM CXP304 LEFT JOIN TGE110 ON CXP304.DOCID=TGE110.DOCID  '+
					' WHERE CIAID='+Quotedstr(DMCXP.cdsCCanje.FieldByName('CIAID').AsString)+
					' AND TCANJEID='+Quotedstr('LE')+
					' AND CCPCANJE='+Quotedstr(DMCXP.cdsCCanje.FieldByName('CANJE').AsString)+
					' AND TGE110.DOCMOD=''CXP'' '+
					' AND TGE110.DOCRETIGV=''S''';
	 DMCXP.cdsCanjeClone.Filter := '';
	 DMCXP.cdsCanjeClone.Filtered := false;
	 DMCXP.cdsCanjeClone.Close;
	 DMCXP.cdsCanjeClone.DataRequest(xSQL);
	 DMCXP.cdsCanjeClone.Open;
	 /////////////////////


	 DMCXP.cdsLetras.First ;
	 while not DMCXP.cdsLetras.eof do
	 begin
			xTTotLetOri := xTTotLetOri + DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat;
			xTTotLetLoc := xTTotLetLoc + DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat;
			xTTotLetExt := xTTotLetExt + DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat;
			DMCXP.cdsLetras.Next;
	 end;
	 xTotRetOri := DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat;
	 if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
	 begin
			xTotRetLoc := DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat;
			xTotRetExt := FRound(DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat/DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,2);
	 end
	 else
			if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
			begin
			xTotRetLoc := FRound(DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat*DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,2);
			xTotRetExt := DMCXP.cdsCCanje.fieldbyname('MTORETIGV').AsFloat;
			end;


	 DMCXP.cdsLetras.First ;
	 DMCXP.cdsCanje.DisableControls;
	 DMCXP.cdsCanjeClone.First;

	 While not DMCXP.cdsLetras.Eof do
	 begin

		 if DMCXP.cdsLetras.RecNo=DMCXP.cdsLetras.RecordCount then
		 begin
				xPorc := Fround(100-xTotPorc,15,2);
				if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
				begin
					 xTemRetOri := Fround(xTotRetOri-xTotRetIgv,15,3);
					 xTemRetLoc := xTemRetOri;
					 xTemRetExt := Fround(xTemRetOri/DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3)
				end
				else
					if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
					begin
						 xTemRetOri := FRound(xTotRetOri-xTotRetIgv,15,3);
						 xTemRetExt := xTemRetOri;
						 xTemRetLoc := Fround(xTemRetOri*DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3)
					end;

		 end
		 else
		 begin
				if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
				begin
//           xPorc := FRound((DMCXP.cdsLetras.fieldbyname('CPMTOLOC').AsFloat/xTTotLetLoc)*100,15,4);
					 xPorc := FRound(FRound((DMCXP.cdsLetras.fieldbyname('CPMTOLOC').AsFloat/xTTotLetLoc),15,4)*100,15,2);
					 xTemRetOri := FRound(xTotRetOri*FRound(xPorc/100,15,4),15,3);
					 xTemRetLoc := xTemRetOri;
					 xTemRetExt := Fround(xTemRetOri/DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3)
				end
				else
					if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
					begin
						 xPorc := FRound(FRound((DMCXP.cdsLetras.fieldbyname('CPMTOEXT').AsFloat/xTTotLetExt),15,4)*100,15,2);
						 xTemRetOri := FRound(xTotRetOri*FRound(xPorc/100,15,4),15,3);
						 xTemRetExt := xTemRetOri;
						 xTemRetLoc := Fround(xTemRetOri*DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3)
					end;
		 end;


		 if DMCXP.cdsLetras.RecNo=DMCXP.cdsLetras.RecordCount then
		 begin
				bUltLetra := true ;
				DMCXP.cdsLetras.Edit;
				DMCXP.cdsLetras.FieldByName('CPNOGRAV').AsFloat   := FRound(xTotRetOri-xTotRetIgv,15,2);
				DMCXP.cdsLetras.fieldbyname('PROVRETIGV').AsString := 'S';  // Indica que el Documento está sujeto a retención IGV.
				DMCXP.cdsLetras.Post;
		 end
		 else
		 begin
			 bUltLetra := false;
			 DMCXP.cdsLetras.Edit;
			 DMCXP.cdsLetras.FieldByName('CPNOGRAV').AsFloat   :=   FRound(xTemRetOri,15,2);
			 DMCXP.cdsLetras.fieldbyname('PROVRETIGV').AsString := 'S';  // Indica que el Documento está sujeto a retención IGV.
			 DMCXP.cdsLetras.Post;
		 end;
		 xTotRetIGV := FRound(xTotRetIGV+xTemRetOri,15,3);

		 While not DMCXP.cdsCanjeClone.Eof do
		 begin
				xSQL:='select DOCRETIGV from TGE110 '
							+'where DOCMOD=''CXP'' and DOCID='''+DMCXP.cdsCanjeClone.FieldByName('DOCID').AsString+'''';
				DMCXP.cdsQry.Close;
				DMCXP.cdsQry.Datarequest( xSQL );
				DMCXP.cdsQry.Open;
				////LO NUEVO
				xSQL :=  ' SELECT * FROM CXP301 '+								 '
								 ' WHERE CIAID='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('CIAID').AsString)+
								 ' AND TDIARID='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('TDIARID').AsString)+
								 ' AND CPANOMES='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('CCPANOMM').AsString)+
								 ' AND DOCID='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('DOCID').AsString)+
								 ' AND CPSERIE='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('CPSERIE').AsString)+
								 ' AND CPNODOC='+Quotedstr(DMCXP.cdsCanjeClone.FieldByName('CPNODOC').AsString);
				///
				DMCXP.cdsMovCxP.IndexFieldNames:='';
				DMCXP.cdsMovCxP.Filter:='';
				DMCXP.cdsMovCxP.Filtered:= false;
				DMCXP.cdsMovCxP.Close;
				DMCXP.cdsMovCxP.DataRequest(xSQL);
				DMCXP.cdsMovCxP.Open;

				if ((DMCXP.cdsQry.FieldByName('DOCRETIGV').AsString='S') and  (DMCXP.cdsMov.FieldByName('CPFEMIS').AsDateTime>=xTasaFec) )then
				begin

					 DMCXP.cdsDetRet.Insert;
					 DMCXP.cdsDetRet.FieldByName('CIAID').AsString    := DMCXP.cdsLetras.fieldbyname('CIAID').AsString;
					 DMCXP.cdsDetRet.FieldByName('TCANJEID').AsString := DMCXP.cdsLetras.fieldbyname('TCANJEID').AsString;
					 DMCXP.cdsDetRet.FieldByName('CANJE').AsString    := DMCXP.cdsLetras.fieldbyname('CPCANJE').AsString;
					 DMCXP.cdsDetRet.FieldByName('CLAUXID').AsString  := DMCXP.cdsLetras.fieldbyname('CLAUXID').AsString;
					 DMCXP.cdsDetRet.FieldByName('PROV').AsString     := DMCXP.cdsLetras.fieldbyname('PROV').AsString;
					 DMCXP.cdsDetRet.FieldByName('PROVRUC').AsString  := DMCXP.cdsLetras.fieldbyname('PROVRUC').AsString;
					 DMCXP.cdsDetRet.FieldByName('CPANOMES').AsString := DMCXP.cdsLetras.fieldbyname('CPANOMES').AsString;
					 DMCXP.cdsDetRet.FieldByName('CJTCAMBIO').AsFloat := DMCXP.cdsLetras.fieldbyname('CPTCAMPR').AsFloat;
					 DMCXP.cdsDetRet.FieldByName('CPRETFEMIS').AsDatetime := DMCXP.cdsCCanje.fieldbyname('CJFCANJE').AsDateTime;

					 DMCXP.cdsDetRet.FieldByName('TMONID').AsString     := DMCXP.cdsLetras.fieldbyname('TMONID').AsString;
					 DMCXP.cdsDetRet.FieldByName('CPNOREGLET').AsString := DMCXP.cdsLetras.fieldbyname('CPNOREG').AsString;
					 DMCXP.cdsDetRet.FieldByName('DOCID').AsString      := DMCXP.cdsLetras.fieldbyname('DOCID').AsString;
					 DMCXP.cdsDetRet.FieldByName('CPSERIE').AsString    := DMCXP.cdsLetras.fieldbyname('CPSERIE').AsString;
					 DMCXP.cdsDetRet.FieldByName('CPNODOC').AsString    := DMCXP.cdsLetras.fieldbyname('CPNODOC').AsString;
					 DMCXP.cdsDetRet.FieldByName('CPFEMIS').AsDatetime  := DMCXP.cdsLetras.fieldbyname('CPFEMIS').AsDatetime;
					 DMCXP.cdsDetRet.FieldByName('CPFVCMTO').AsDatetime := DMCXP.cdsLetras.fieldbyname('CPFVCMTO').AsDatetime;

					 DMCXP.cdsDetRet.FieldByName('CPMTOORI').AsFloat    := DMCXP.cdsLetras.fieldbyname('CPMTOORI').AsFloat;
					 DMCXP.cdsDetRet.FieldByName('CPMTOLOC').AsFloat    := DMCXP.cdsLetras.fieldbyname('CPMTOLOC').AsFloat;
					 DMCXP.cdsDetRet.FieldByName('CPMTOEXT').AsFloat    := DMCXP.cdsLetras.fieldbyname('CPMTOEXT').AsFloat;

					 if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
					 begin
							if DMCXP.cdsLetras.RecNo=DMCXP.cdsLetras.RecordCount then
								 DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat :=FRound(100-xTotPorc,15,2)
							else
//                  DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat := FRound((DMCXP.cdsLetras.fieldbyname('CPMTOLOC').AsFloat/xTTotLetLoc)*100,15,4);
									DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat := FRound(FRound((DMCXP.cdsLetras.fieldbyname('CPMTOLOC').AsFloat/xTTotLetLoc),15,4)*100,15,2);
					 end
					 else
							if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
							begin
								 if DMCXP.cdsLetras.RecNo=DMCXP.cdsLetras.RecordCount then
										DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat :=FRound(100-xTotPorc,15,2)
								 else
//                    DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat := FRound((DMCXP.cdsLetras.fieldbyname('CPMTOEXT').AsFloat/xTTotLetExt)*100,15,4);
										DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat := FRound(FRound((DMCXP.cdsLetras.fieldbyname('CPMTOEXT').AsFloat/xTTotLetExt),15,4)*100,15,2);
							end;

					 if bUltLetra then
					 begin
							DMCXP.cdsDetRet.FieldByName('CPNETOORI').AsFloat  :=OperClientDataSet( DMCXP.cdsCanje, 'SUM(CCPMOORI)', 'DOCID='+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('DOCID').AsString)
																																																	+' AND CPSERIE='+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPSERIE').AsString)+' AND CPNODOC='+
							Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPNODOC').AsString))-     OperClientDataSet( DMCXP.cdsDetRet, 'SUM(CPNETOORI)', 'CPSERIE2='
							+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPSERIE').AsString)+' AND CPNODOC2='+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPNODOC').AsString));

							DMCXP.cdsDetRet.FieldByName('CPNETOLOC').AsFloat  :=OperClientDataSet( DMCXP.cdsCanje, 'SUM(CCPMOLOC)', 'DOCID='+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('DOCID').AsString)
																																																	+' AND CPSERIE='+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPSERIE').AsString)+' AND CPNODOC='+
							Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPNODOC').AsString))-     OperClientDataSet( DMCXP.cdsDetRet, 'SUM(CPNETOLOC)', 'CPSERIE2='
							+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPSERIE').AsString)+' AND CPNODOC2='+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPNODOC').AsString));

							DMCXP.cdsDetRet.FieldByName('CPNETOEXT').AsFloat  :=OperClientDataSet( DMCXP.cdsCanje, 'SUM(CCPMOEXT)','DOCID='+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('DOCID').AsString)
																																																	+' AND CPSERIE='+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPSERIE').AsString)+' AND CPNODOC='+
							Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPNODOC').AsString))-     OperClientDataSet( DMCXP.cdsDetRet, 'SUM(CPNETOEXT)', 'CPSERIE2='
							+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPSERIE').AsString)+' AND CPNODOC2='+Quotedstr(DMCXP.cdsCanjeClone.fieldbyname('CPNODOC').AsString));

							DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat:= FRound(100-xTotPorc,15,2);
							if DMCXP.cdsCanjeClone.RecNo=DMCXP.cdsCanjeClone.RecordCount then
							begin
								DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat:= xTemRetOri;
								DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat:= xTemRetLoc;
								DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat:= xTemRetExt;
							end
							else
							begin
								 if DMCXP.cdsCanjeClone.RecNo=DMCXP.cdsCanjeClone.RecordCount then
                 begin
                    DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat:= xTemRetOri;
                    DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat:= xTemRetLoc;
                    DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat:= xTemRetExt;
                 end
                 else
                 begin
                    if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
                       DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPNETOLOC').AsFloat*xTasaRet,15,3)
                    else
                        if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
                           DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPNETOEXT').AsFloat*xTasaRet,15,3);

                    if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
                    begin
                        DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat  := DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat;
                        DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat/DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3);
                    end
                    else
                       if DMCXP.cdsCCanje.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
                       begin
                          DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat*DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3);
                          DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat  := DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat;
                       end;
                 end;

                 xTemRetOri := FRound(xTemRetOri -DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat,15,3);
                 xTemRetLoc := FRound(xTemRetLoc -DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat,15,3);
                 xTemRetExt := FRound(xTemRetExt -DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat,15,3);
							end;

           end
           else
           begin

              DMCXP.cdsDetRet.FieldByName('CPNETOORI').AsFloat  := Fround(DMCXP.cdsCanjeClone.fieldbyname('CCPMOORI').AsFloat*FRound((DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat/100),8,4),15,2);
              DMCXP.cdsDetRet.FieldByName('CPNETOLOC').AsFloat  := Fround(DMCXP.cdsCanjeClone.fieldbyname('CCPMOLOC').AsFloat*FRound((DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat/100),8,4),15,2);
              DMCXP.cdsDetRet.FieldByName('CPNETOEXT').AsFloat  := Fround(DMCXP.cdsCanjeClone.fieldbyname('CCPMOEXT').AsFloat*FRound((DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat/100),8,4),15,2);

              if DMCXP.cdsCanjeClone.RecNo=DMCXP.cdsCanjeClone.RecordCount then
              begin
                 DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat:= xTemRetOri;
                 DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat:= xTemRetLoc;
                 DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat:= xTemRetExt;
              end
              else
              begin
                 DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPNETOORI').AsFloat*xTasaRet,15,3);
                 if DMCXP.cdsCanjeClone.FieldByName('TMONID').AsString= DMCXP.wTMonLoc then
                 begin
                    DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat  := DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat;
                    DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat/DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3);
                 end
                 else
                    if DMCXP.cdsCanjeClone.FieldByName('TMONID').AsString= DMCXP.wTMonExt then
                    begin
                       DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat  := FRound(DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat*DMCXP.cdsCCanje.fieldbyname('CJTCAMBIO').AsFloat,15,3);
                       DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat  := DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat;
                    end;
                 xTemRetOri := FRound(xTemRetOri -DMCXP.cdsDetRet.FieldByName('CPRETORI').AsFloat,15,3);
                 xTemRetLoc := FRound(xTemRetLoc -DMCXP.cdsDetRet.FieldByName('CPRETLOC').AsFloat,15,3);
                 xTemRetExt := FRound(xTemRetExt -DMCXP.cdsDetRet.FieldByName('CPRETEXT').AsFloat,15,3);
              end;

					 end;

           DMCXP.cdsDetRet.FieldByName('TMONID2').AsString     := DMCXP.cdsCanjeClone.fieldbyname('TMONID').AsString;
           DMCXP.cdsDetRet.FieldByName('DOCID2').AsString      := DMCXP.cdsCanjeClone.fieldbyname('DOCID').AsString;
           DMCXP.cdsDetRet.FieldByName('CPSERIE2').AsString    := DMCXP.cdsCanjeClone.fieldbyname('CPSERIE').AsString;
           DMCXP.cdsDetRet.FieldByName('CPNODOC2').AsString    := DMCXP.cdsCanjeClone.fieldbyname('CPNODOC').AsString;
           DMCXP.cdsDetRet.FieldByName('CPFEMIS2').AsDatetime  := DMCXP.cdsCanjeClone.fieldbyname('CPFEMIS').AsDatetime;
           DMCXP.cdsDetRet.FieldByName('CPFVCMTO2').AsDatetime := DMCXP.cdsCanjeClone.fieldbyname('CPFVCMTO').AsDatetime;

           DMCXP.cdsDetRet.FieldByName('CPMTOORI2').AsFloat    := DMCXP.cdsCanjeClone.fieldbyname('CCPMOORI').AsFloat;
           DMCXP.cdsDetRet.FieldByName('CPMTOLOC2').AsFloat    := DMCXP.cdsCanjeClone.fieldbyname('CCPMOLOC').AsFloat;
           DMCXP.cdsDetRet.FieldByName('CPMTOEXT2').AsFloat    := DMCXP.cdsCanjeClone.fieldbyname('CCPMOEXT').AsFloat;
           DMCXP.cdsDetRet.FieldByName('CPANOMES2').AsString   := DMCXP.cdsCanjeClone.fieldbyname('CCPANOMM').AsString;
           DMCXP.cdsDetRet.FieldByName('CPTCAMPR').AsFloat     := DMCXP.cdsCanjeClone.fieldbyname('CCPTCDOC').AsFloat;

           DMCXP.cdsDetRet.FieldByName('CPFREG').value         := Date;
           DMCXP.cdsDetRet.FieldByName('CPHREG').value         := Time;
           DMCXP.cdsDetRet.FieldByName('CPUSER').AsString      := DMCXP.wUsuario;
           DMCXP.cdsDetRet.Post;
           DMCXP.cdsCanjeClone.Next;
        end
        else
        begin
          DMCXP.cdsCanjeClone.Next;
        end;

     end;//canje

     DMCXP.cdsLetras.Next;
     xTotPorc := FRound(xTotPorc+DMCXP.cdsDetRet.FieldByName('CPPORCRET').AsFloat,15,2);
     DMCXP.cdsCanjeClone.First;
   end;
   DMCXP.AplicaDatos( DMCXP.cdsDetRet, 'DetRet'  );
   DMCXP.cdsCanje.EnableControls;
   DMCXP.cdsLetras.EnableControls;
end;}

/////////////


{procedure TFInserta.InsertaLETRASEnCNT320;
var
  xSQL : string;
begin
   xSQL := ' SELECT * FROM CXP313'
          +' WHERE CIAID='+Quotedstr(DMCXP.cdsEgrCaja.FieldByName('CIAID').AsString)
          +' AND CLAUXID='+Quotedstr(DMCXP.cdsConsulta.FieldByName('CLAUXID').AsString)
          +' AND PROV='+Quotedstr(DMCXP.cdsConsulta.FieldByName('PROV').AsString)
          +' AND DOCID='+Quotedstr(DMCXP.cdsConsulta.FieldByName('DOCID2').AsString)
          +' AND CPSERIE='+Quotedstr(DMCXP.cdsConsulta.FieldByName('CPSERIE').AsString)
          +' AND CPNODOC='+Quotedstr(DMCXP.cdsConsulta.FieldByName('CPNODOC').AsString)
          +' AND CPNOREGLET='+Quotedstr(DMCXP.cdsConsulta.FieldByName('CPNOREG').AsString);
   DMCXP.cdsSQL.Close;
   DMCXP.cdsSQL.DataRequest(xSQL);
   DMCXP.cdsSQL.Open;
   DMCXP.cdsSQL.First;
   while not DMCXP.cdsSQL.Eof do
   begin
      DMCXP.cdsRetencion.Insert;
      DMCXP.cdsRetencion.FieldByname('CIAID').AsString     :=  DMCXP.cdsEgrCaja.FieldByName('CIAID').AsString;
      DMCXP.cdsRetencion.FieldByname('ANOMM').AsString     :=  DMCXP.cdsEgrCaja.FieldByName('ECANOMM').AsString;
      DMCXP.cdsRetencion.FieldByname('TDIARID').AsString   :=  DMCXP.cdsEgrCaja.FieldByName('TDIARID').AsString;
      DMCXP.cdsRetencion.FieldByname('ECNOCOMP').AsString  :=  DMCXP.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
      DMCXP.cdsRetencion.FieldByname('FECPAGO').AsDateTime :=  DMCXP.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
      DMCXP.cdsRetencion.FieldByname('CLAUXID').AsString   :=  DMCXP.cdsConsulta.FieldByName('CLAUXID').AsString;
      DMCXP.cdsRetencion.FieldByname('AUXID').AsString     :=  DMCXP.cdsConsulta.FieldByName('PROV').AsString;
      DMCXP.cdsRetencion.FieldByname('AUXRUC').AsString    :=  DMCXP.cdsConsulta.FieldByName('PROVRUC').AsString;
      DMCXP.cdsRetencion.FieldByname('DOCID2').AsString    :=  DMCXP.cdsConsulta.FieldByName('DOCID2').AsString;
      DMCXP.cdsRetencion.FieldByname('DOCDES').AsString    :=  DMCXP.cdsSQL.FieldByName('CPANOMES2').AsString;
      DMCXP.cdsRetencion.FieldByname('CPSERIE').AsString   :=  DMCXP.cdsConsulta.FieldByName('CPSERIE').AsString;
      DMCXP.cdsRetencion.FieldByname('CPNODOC').AsString   :=  DMCXP.cdsConsulta.FieldByName('CPNODOC').AsString;
      DMCXP.cdsRetencion.FieldByname('FECEMI').AsDateTime  :=  DMCXP.cdsSQL.FieldByName('CPFEMIS2').AsDateTime;

      DMCXP.cdsRetencion.FieldByname('DOCID').AsString     :=  DMCXP.cdsSQL.FieldByName('DOCID2').AsString;
      DMCXP.cdsRetencion.FieldByname('SERIE').AsString     :=  DMCXP.cdsSQL.FieldByName('CPSERIE2').AsString;
      DMCXP.cdsRetencion.FieldByname('NODOC').AsString     :=  DMCXP.cdsSQL.FieldByName('CPNODOC2').AsString;
      DMCXP.cdsRetencion.FieldByname('FECEMI').AsDateTime  :=  DMCXP.cdsSQL.FieldByName('CPFEMIS2').AsDateTime;

      DMCXP.cdsRetencion.FieldByname('TRANID').AsString    :=  '';
      DMCXP.cdsRetencion.FieldByname('TRANDES').AsString   :=  '';
      DMCXP.cdsRetencion.FieldByname('DH').AsString        :=  'H';

      DMCXP.cdsRetencion.FieldByname('TCAMB').AsFloat      :=  DMCXP.cdsSQL.FieldByName('CPTCAMPR').AsFloat;

      DMCXP.cdsRetencion.FieldByname('MTOORI').AsFloat     := DMCXP.cdsSQL.FieldByName('CPNETOORI').AsFloat;
      DMCXP.cdsRetencion.FieldByname('MTOLOC').AsFloat     := DMCXP.cdsSQL.FieldByName('CPNETOLOC').AsFloat;
      DMCXP.cdsRetencion.FieldByname('MTOEXT').AsFloat     := DMCXP.cdsSQL.FieldByName('CPNETOEXT').AsFloat;

      DMCXP.cdsRetencion.FieldByname('MTORETORI').AsFloat  := DMCXP.cdsSQL.FieldByName('CPRETORI').AsFloat;
      DMCXP.cdsRetencion.FieldByname('MTORETLOC').AsFloat  := DMCXP.cdsSQL.FieldByName('CPRETLOC').AsFloat;
      DMCXP.cdsRetencion.FieldByname('MTORETEXT').AsFloat  := DMCXP.cdsSQL.FieldByName('CPRETEXT').AsFloat;

      DMCXP.cdsRetencion.FieldByname('USUARIO').AsString :=DMCXP.wUsuario;
      DMCXP.cdsRetencion.FieldByname('FREG').Value       :=Date;
      DMCXP.cdsRetencion.FieldByname('HREG').Value       :=Time;
      cdsPost( DMCXP.cdsRetencion );

      DMCXP.cdsSQL.Next;
   end;


end;}





procedure TFInserta.Button13Click(Sender: TObject);
var
  xSQL,xWhere  : string;
begin
  xSQL := ' SELECT * FROM CNT320'+
          ' ORDER BY RETNUMERO ';
  DMCXP.cdsSQL.Close;
  DMCXP.cdsSQL.DataRequest(xSQL);
  DMCXP.cdsSQL.Open;
  DMCXP.cdsSQL.First;
  while not DMCXP.cdsSQL.Eof do
  begin
      xWhere :=  ' CIAID='+Quotedstr(DMCXP.cdsSQL.fieldbyname('CIAID').AsString)
                +' AND PROV='+Quotedstr(DMCXP.cdsSQL.fieldbyname('AUXID').AsString)
                +' AND DOCID='+Quotedstr(DMCXP.cdsSQL.fieldbyname('DOCID').AsString)
                +' AND CPSERIE='+Quotedstr(DMCXP.cdsSQL.fieldbyname('SERIE').AsString)
                +' AND CPNODOC='+Quotedstr(DMCXP.cdsSQL.fieldbyname('NODOC').AsString);

      BuscaQry('dspTGE','CXP301','CPNOREG',xWhere,'CPNOREG');
      if length(DMCXP.cdsQry.FieldByName('CPNOREG').AsString)>0 then
      begin
         xSQL:= ' UPDATE CNT320  SET CPNOREG='+Quotedstr(DMCXP.cdsQry.FieldByName('CPNOREG').AsString)+
                ' WHERE CIAID='+Quotedstr(DMCXP.cdsSQL.FieldByName('CIAID').AsString)+
                ' AND TDIARID='+Quotedstr(DMCXP.cdsSQL.FieldByName('TDIARID').AsString)+
                ' AND ECNOCOMP='+Quotedstr(DMCXP.cdsSQL.FieldByName('ECNOCOMP').AsString)+
                ' AND AUXID='+Quotedstr(DMCXP.cdsSQL.FieldByName('AUXID').AsString)+
                ' AND DOCID='+Quotedstr(DMCXP.cdsSQL.FieldByName('DOCID').AsString)+
                ' AND SERIE='+Quotedstr(DMCXP.cdsSQL.FieldByName('SERIE').AsString)+
                ' AND NODOC='+Quotedstr(DMCXP.cdsSQL.FieldByName('NODOC').AsString)+
                ' AND RETNUMERO='+Quotedstr(DMCXP.cdsSQL.FieldByName('RETNUMERO').AsString);
         try
           DMCXP.DCOM1.AppServer.IniciaTransaccion;
           DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
           DMCXP.DCOM1.AppServer.GrabaTransaccion;
         except
           DMCXP.DCOM1.AppServer.RetornaTransaccion;
         end;
      end;

     DMCXP.cdsSQL.Next;
  end;
  Showmessage('ok');


end;

procedure TFInserta.Button14Click(Sender: TObject);
var
   xSQL: string;
begin
  if length(edtPeriodo2.text)=0 then
     raise exception.Create('Falta Periodo');

  xSQL:= 'SELECT CIAID ,TDIARID,ECNOCOMP,ECANOMM,DOCID,DCNODOC,DCSERIE,NREG FROM CAJA304'+
         ' WHERE ECANOMM='+Quotedstr(edtPeriodo2.Text)+' AND NVL(FCAB,''X'')=''1'' AND NVL(DCDH,''X'')=''H'' ';
  DMCXP.cdsQry6.Close;
  DMCXP.cdsQry6.DataRequest(xSQL);
  DMCXP.cdsQry6.open;
  DMCXP.cdsQry6.First;
  DBGrid1.DataSource:= DMCXP.dsQry6;



end;

procedure TFInserta.BitBtn1Click(Sender: TObject);
var
   xSQL: string;
begin
   EXIT;
   //
   xSQL:=' UPDATE CAJA304 A  SET A.DCNODOC=(SELECT B.ECNOCHQ FROM CAJA302 B '+
                                     ' WHERE B.CIAID=A.CIAID AND B.ECANOMM=A.ECANOMM '+
                                     ' AND B.TDIARID=A.TDIARID AND B.ECNOCOMP=A.ECNOCOMP '+
                                     ' AND NVL(B.FPAGOID,''X'')=''02'' AND '+
                                     ' (B.EC_PROCE=''1'' OR EC_PROCE=''B'' OR EC_PROCE=''3'' )),DCSERIE=''000'' ,DOCID=''61'' '+
   'WHERE A.ECANOMM='+Quotedstr(edtPeriodo.text)+' AND NVL(A.FCAB,''X'')=''1'' AND NVL(A.DCDH,''X'')=''H'' ';
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
      Showmessage('No se Actualizaron los datos')
    end;

    Showmessage('Se Actualizaron los datos');



end;

procedure TFInserta.Button15Click(Sender: TObject);
var xSQL: string;
    xna : double;
begin

  PB2.Max := DMCXP.cdsQry6.RecordCount;
  DMCXP.cdsQry6.First;
  xna:=0;
  while not DMCXP.cdsQry6.Eof do
  begin
     xSQL:='UPDATE CNT301 SET DOCID='+Quotedstr(DMCXP.cdsQry6.fieldbyname('DOCID').AsString)+
           ' ,CNTSERIE='+Quotedstr(DMCXP.cdsQry6.fieldbyname('DCSERIE').AsString)+
           ' ,CNTNODOC='+Quotedstr(DMCXP.cdsQry6.fieldbyname('DCNODOC').AsString)+
           ' WHERE CIAID='+Quotedstr(DMCXP.cdsQry6.fieldbyname('CIAID').AsString)+
           ' AND TDIARID='+Quotedstr(DMCXP.cdsQry6.fieldbyname('TDIARID').AsString)+
           ' AND CNTANOMM='+Quotedstr(DMCXP.cdsQry6.fieldbyname('ECANOMM').AsString)+
           ' AND CNTCOMPROB='+Quotedstr(DMCXP.cdsQry6.fieldbyname('ECNOCOMP').AsString)+
           ' AND CNTREG='+Quotedstr(DMCXP.cdsQry6.fieldbyname('NREG').AsString);
            try
 						   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
            except
              xna:=xna+1; 
            end;
     PB2.Position:=PB2.Position+1;
     DMCXP.cdsQry6.Next;
  end;
     Showmessage('na= '+Floattostr(xNa));
     Showmessage('ok');


end;

procedure TFInserta.Button16Click(Sender: TObject);
var
   xSQL : string;
begin
  xSQL :=' SELECT * FROM CXP308';


end;

procedure TFInserta.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.

