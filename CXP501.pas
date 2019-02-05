unit CxP501;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, wwdbdatetimepicker, wwdblook, Grids,
  Wwdbigrd, Wwdbgrid, StrContainer, ComCtrls, FileCtrl, db, ppCache, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppEndUsr, ppBands,
  ppCtrls, ppPrnabl, oaVariables;

type
  TFTransfCOA = class(TForm)
    pnlOpciones: TPanel;
    cbTrProv: TCheckBox;
    cbTrCompr: TCheckBox;
    cbTrNotas: TCheckBox;
    bbtnOk: TBitBtn;
    dbdtpFecIni: TwwDBDateTimePicker;
    dbdtpFecFin: TwwDBDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    cbTrPoliza: TCheckBox;
    cbTrExporta: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    scFile: TStrContainer;
    RichEdit1: TRichEdit;
    edtNomArch: TEdit;
    BitBtn2: TBitBtn;
    savdlg1: TSaveDialog;
    dlbDir: TDirectoryListBox;
    bbtnX61: TBitBtn;
    bbtnX58: TBitBtn;
    bbtnX68: TBitBtn;
    bbtnX78: TBitBtn;
    bbtnX88: TBitBtn;
    dbgVer: TwwDBGrid;
    gbPeriodo: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dblcPeriodo1: TwwDBLookupCombo;
    dblcPeriodo2: TwwDBLookupCombo;
    bbtnImpX61: TBitBtn;
    bbtnImpX58: TBitBtn;
    bbtnImpX68: TBitBtn;
    bbtnImpX78: TBitBtn;
    bbtnImpX88: TBitBtn;
    pprProv: TppReport;
    pprMovs: TppReport;
    ppdbProv: TppDBPipeline;
    ppdbMovs: TppDBPipeline;
    ppDesigner1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppDesigner2: TppDesigner;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    Label10: TLabel;
    dblcRUC: TwwDBLookupCombo;
    edtRUC: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure IniciaDatos;
    procedure dbdtpFecIniExit(Sender: TObject);
    procedure dbdtpFecFinExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure dlbDirChange(Sender: TObject);
    procedure dlbDirExit(Sender: TObject);
    procedure bbtnX61Click(Sender: TObject);
    procedure bbtnX58Click(Sender: TObject);
    procedure bbtnX68Click(Sender: TObject);
    procedure bbtnX78Click(Sender: TObject);
    procedure bbtnX88Click(Sender: TObject);
    procedure dblcPeriodo1Exit(Sender: TObject);
    procedure dblcPeriodo2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnImpX61Click(Sender: TObject);
    procedure bbtnImpX58Click(Sender: TObject);
    procedure bbtnImpX68Click(Sender: TObject);
    procedure bbtnImpX78Click(Sender: TObject);
    procedure bbtnImpX88Click(Sender: TObject);
    procedure dblcRUCExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure TransfProv;
    procedure TransfCompr;
    procedure TransfNotas;
    procedure TransfPoliza;
    procedure TransfExporta;
  public
    { Public declarations }
  end;

  procedure OPTransferenciaCOA; stdcall;

exports
  OPTransferenciaCOA;

var
  FTransfCOA: TFTransfCOA;
  FlTrProv, FlTrCompr, FlTrNotas : Boolean;
  wRUCCIA : String;

implementation

{$R *.DFM}

Uses CxPDM;


procedure OPTransferenciaCOA;
var
   xSQL : String;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   Try
     DMCXP.cdsSQL.Close;
     xSQL:= 'SELECT CIAID, CIARUC, CIADES FROM TGE101 GROUP BY CIAID, CIARUC, CIADES';
     DMCXP.cdsSQL.ProviderName:='dspTGE';
     DMCXP.cdsSQL.DataRequest(xSQL);
     DMCXP.cdsSQL.Open;

     FTransfCOA:=TFTransfCOA.Create( Application );
     FTransfCOA. ShowModal;
   Finally
 	   FTransfCOA. Free;
   end;
end;

procedure TFTransfCOA.FormActivate(Sender: TObject);
begin
   IniciaDatos;
   if Copy(dlbDir.Directory,Length(dlbDir.Directory),1)='\' then
      edtNomArch.Text:=dlbDir.Directory
   else
      edtNomArch.Text:=dlbDir.Directory+'\';

   dblcRUC.SetFocus;

//   FVariables.ConfiguraForma( FTransfCOA );

end;

procedure TFTransfCOA.IniciaDatos;
var
   xSQL : string;
begin
   dblcRUC.Text     := '';
   edtRUC.Text      := '';
{   dbdtpFecIni.Date := 0;
   dbdtpFecFin.Date := 0;}
   cbTrProv.Checked := False;
   cbTrCompr.Checked:= False;
   cbTrNotas.Checked:= False;

   xSQL:= 'SELECT CIAID, CIARUC, CIADES FROM TGE101 where CIARUC is not NULL GROUP BY CIAID, CIARUC, CIADES';
   DMCXP.cdsQry1.IndexFieldNames :='';
   DMCXP.cdsQry1.Filter   := '';
   DMCXP.cdsQry1.Filtered := False;
 	 DMCXP.cdsQry1.Close;
	 DMCXP.cdsQry1.ProviderName:='dspTGE';
	 DMCXP.cdsQry1.DataRequest(xSQL);
	 DMCXP.cdsQry1.Open;

   dblcRuc.LookupTable:=DMCXP.cdsQry1;

   xSQL := 'SELECT ANOMES PERIODO FROM TGE813';
   DMCXP.cdsQry2.IndexFieldNames :='';
   DMCXP.cdsQry2.Filter   := '';
   DMCXP.cdsQry2.Filtered := False;
   DMCXP.cdsQry2.Close;
   DMCXP.cdsQry2.DataRequest(xSQL);
   DMCXP.cdsQry2.Open;

   DMCXP.cdsQry3.IndexFieldNames :='';
   DMCXP.cdsQry3.Filter   := '';
   DMCXP.cdsQry3.Filtered := False;
   DMCXP.cdsQry3.Close;
   DMCXP.cdsQry3.DataRequest(xSQL);
   DMCXP.cdsQry3.Open;

   dblcPeriodo1.LookupTable := DMCXP.cdsQry2;
   dblcPeriodo1.LookupField := 'PERIODO';

{   dblcPeriodo1.Selected.Clear;
   dblcPeriodo1.Selected.Add('TREGID'#9'3'#9'Id'#9'F');}

   dblcPeriodo2.LookupTable := DMCXP.cdsQry3;
   dblcPeriodo2.LookupField := 'PERIODO';
end;


procedure TFTransfCOA.dbdtpFecIniExit(Sender: TObject);
begin
{   if dbdtpFecIni.Date=0 then
   begin
      ShowMessage('Falta Fecha de Inicial');
      dbdtpFecIni.SetFocus;
      exit;
   end;}
end;

procedure TFTransfCOA.dbdtpFecFinExit(Sender: TObject);
begin
{   if dbdtpFecFin.Date=0 then
   begin
      ShowMessage('Falta Fecha de Inicial');
      dbdtpFecFin.SetFocus;
      exit;
   end;}
end;

procedure TFTransfCOA.bbtnOkClick(Sender: TObject);
begin
	If Length(dblcRUC.Text)=0 Then
	Begin
			ShowMessage('Falta Seleccionar el RUC');
			dblcRUC.SetFocus;
			Exit;
	End;

   if Length(Trim(dblcPeriodo1.Text))=0 then
   begin
      ShowMessage('Falta Periodo Inicial');
      dblcPeriodo1.SetFocus;
      exit;
   end;

   if Length(Trim(dblcPeriodo2.Text))=0 then
   begin
      ShowMessage('Falta Periodo Final');
      dblcPeriodo2.SetFocus;
      exit;
   end;

{   if dbdtpFecIni.Date=0 then
   begin
      ShowMessage('Falta Fecha de Inicial');
      dbdtpFecIni.SetFocus;
      exit;
   end;
   if dbdtpFecFin.Date=0 then
   begin
      ShowMessage('Falta Fecha de Inicial');
      dbdtpFecFin.SetFocus;
      exit;
   end;
   }
   If (not cbTrProv.Checked ) and (not cbTrCompr.Checked) and
      (not cbTrNotas.Checked ) and (not cbTrPoliza.Checked ) and
      (not cbTrExporta.Checked ) then begin
      ShowMessage('Falta Checks de transferencias');
      exit;
   end;

   FlTrProv  := False;

   if cbTrProv.Checked  then TransfProv;
   if cbTrCompr.Checked then TransfCompr;
   if cbTrNotas.Checked then TransfNotas;
   if cbTrPoliza.Checked then TransfPoliza;
   if cbTrExporta.Checked then TransfExporta;

   //If FlTrProv then  DMCXP.cdsCoaProv.ApplyUpdates( 0 );

   ShowMessage(' Transferencia Terminada ');

//   IniciaDatos;

   dblcRUC.SetFocus;

end;

procedure TFTransfCOA.TransfProv;
var
  xNroReg, xNroReg1 : Integer;
  xSQL, xLinea : String;
begin

   xSQL:='Select CLAUXID from TGE102 WHERE CLAUXCP=''P''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xSQL );
   DMCXP.cdsQry.Open;

   xSQL:='SELECT A.CLAUXID, A.PROV, A.PROVRUC, A.PROVDES, A.PROVABR, A.PROVNOMCOM, A.PROVRETIGV, '
        +  'A.PAISID, A.PROVDIR, A.PROVCZIP, A.PROVTELF, A.PROVFAX, A.PROVEMAI '
        +'FROM TGE201 A, '
        +   '( SELECT CLAUXID, PROV FROM CXP301 B '
        +     'where CIAID in ('+wRUCCIA+')'
{        +       'and CPFCMPRB>='+DMCXP.wRepFuncDate+' '''+ FormatDateTime(DMCXP.wFormatFecha,dbdtpFecIni.Date)+''' )'
        +       'and CPFCMPRB<='+DMCXP.wRepFuncDate+' '''+ FormatDateTime(DMCXP.wFormatFecha,dbdtpFecFin.Date)+''' )'}
        +       ' and CPANOMES>='+Quotedstr(dblcPeriodo1.Text)
        +       ' and CPANOMES<='+Quotedstr(dblcPeriodo2.Text)

        +       'and CPIGV>0 '
        +     'GROUP BY CLAUXID, PROV '
        +   ') B '
        +'WHERE A.CLAUXID='''+DMCXP.cdsQry.FieldByName('CLAUXID').AsString+''' '
        +  'and A.CLAUXID=B.CLAUXID and A.PROV=B.PROV ';

   Filtracds( DMCXP.cdsProv, xSQL );
   {
   DMCXP.cdsCoaProv.Close;
   DMCXP.cdsCoaProv.DataRequest('Delete from X61COAPR');
   DMCXP.cdsCoaProv.Execute;

   DMCXP.cdsCoaProv.Close;
   DMCXP.cdsCoaProv.DataRequest('Select * from X61COAPR');
   DMCXP.cdsCoaProv.Open;

   DMCXP.cdsCoaProv.IndexFieldNames := 'X61NRORUC';
   xNroReg  := DMCXP.cdsCoaProv.RecordCount;
   xNroReg1 := DMCXP.cdsCoaProv.RecordCount;
   }
   xNroReg  := 0;
   scFile.Lines.Clear;

   DMCXP.cdsProv.First;
   while not DMCXP.cdsProv.Eof do begin

      xNroReg   := xNroReg + 1;
      xLinea:= StrZero( IntToStr(xNroReg),6)+' '
             + Copy( DMCXP.cdsProv.FieldByName('PROVRUC').AsString,1,11)+' '
             + Copy( DMCXP.cdsProv.FieldByName('PROV').AsString,1,15)   +' '
             + Copy( DMCXP.cdsProv.FieldByName('PROVDES').AsString,1,40)+' '
             + '0';
      scFile.Lines.Add( xLinea );

      FlTrProv  := True;

      DMCXP.cdsProv.Next
   end;

   scFile.Lines.SaveToFile( edtNomArch.Text+'X61COAPR.ASC' );

end;

procedure TFTransfCOA.TransfCompr;
var
  xNroReg : Integer;
  xFiltro, xCoaDoc, xCoaDBF, xDia, xMoneda, xLinea : String;
  xBase, xIGV : String;
begin
   xFiltro := 'CIAID in ('+wRUCCIA+')'
{            + ' and CPFCMPRB>='+DMCXP.wRepFuncDate+' '''+ FormatDateTime(DMCXP.wFormatFecha,dbdtpFecIni.Date)+''' )'
            + ' and CPFCMPRB<='+DMCXP.wRepFuncDate+' '''+ FormatDateTime(DMCXP.wFormatFecha,dbdtpFecFin.Date)+''' )'}
            + ' and CPANOMES>='+Quotedstr(dblcPeriodo1.Text)
            + ' and CPANOMES<='+Quotedstr(dblcPeriodo2.Text)

            + ' and ( CPESTADO=''P'' or CPESTADO=''C'' ) and CPIGV>0 ';

   Filtracds( DMCXP.cdsMovCxP, 'Select * from CXP301 Where '+xFiltro );

   xNroReg := 0;

   scFile.Lines.Clear;

   DMCXP.cdsMovCxP.First;
   while not DMCXP.cdsMovCxP.Eof do begin

      xCoaDoc:=DMCXP.DisplayDescrip('TGE110','COADOCID','DOCID',DMCXP.cdsMovCxP.FieldByName('DocID').AsString);

      If Length(xCoaDoc)>0 then begin

         xCoaDBF := DMCXP.DisplayDescrip('TGE129','COADBF','COADOCID',xCoaDoc);

         If Length(xCoaDBF)>0 then begin

            If xCoaDBF='X58CPCOA' then begin

               FlTrCompr := True;
               xNroReg := xNroReg + 1;
               xDia    := Copy(DateToStr(DMCXP.cdsMovCxP.FieldByName('CPFCMPRB').AsDateTime),1,2);
               if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then begin
                  xMoneda:='1';
                  xBase:=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPGRAVAD').AsFloat,15,2),ffNumber,15,2);
                  xIGV :=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPIGV').AsFloat   ,15,2),ffNumber,15,2);
                  xBase:=Copy('             '+xBase, (Length(xBase)),14);
                  xIGV :=Copy('             '+xIGV , (Length(xIGV )),14);
               end
               else begin
                  xMoneda:='0';
                  xBase:=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPGRAVAD').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2), ffNumber,15,2);
                  xIGV :=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPIGV').AsFloat   *DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2), ffNumber,15,2);
                  xBase:=Copy('             '+xBase, (Length(xBase)),14);
                  xIGV :=Copy('             '+xIGV , (Length(xIGV )),14);
               end;
               xLinea:= StrZero( IntToStr(xNroReg),6)+' '
                      + Copy( DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString+'        ',1,15)+' '
                      + DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString+' '
                      + DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString+xDia+' '
                      + xCoaDoc+' '
                      + Copy(DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString+'    ',1,4)+' '
                      + Copy(DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString+'                    ',1,20)+' '
                      + xBase+' '
                      + xIGV +' '
                      + '001 '
                      + xMoneda+' '
                      + Copy(DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString,5,6)+' '
                      + '0';
               scFile.Lines.Add( xLinea );
            end;
         end;
      end;
      DMCXP.cdsMovCxP.Next
   end;

   scFile.Lines.SaveToFile( edtNomArch.Text+'X58CPCOA.ASC' );

end;

procedure TFTransfCOA.TransfNotas;
var
  xNroReg : Integer;
  xFiltro, xCoaDoc, xCoaDBF, xDia, xMoneda : String;
  xBase, xIGV, xLinea : String;
begin
   xFiltro := 'CIAID in ('+wRUCCIA+')'
{            + ' and CPFCMPRB>='+DMCXP.wRepFuncDate+' '''+ FormatDateTime(DMCXP.wFormatFecha,dbdtpFecIni.Date)+''' )'
            + ' and CPFCMPRB<='+DMCXP.wRepFuncDate+' '''+ FormatDateTime(DMCXP.wFormatFecha,dbdtpFecFin.Date)+''' )'}
            + ' and CPANOMES>='+Quotedstr(dblcPeriodo1.Text)
            + ' and CPANOMES<='+Quotedstr(dblcPeriodo2.Text)

            + ' and ( CPESTADO=''P'' or CPESTADO=''C'' ) and CPIGV>0 ';

   Filtracds( DMCXP.cdsMovCxP, 'Select * from CXP301 Where '+xFiltro );

   xNroReg := 0;

   DMCXP.cdsMovCxP.First;
   while not DMCXP.cdsMovCxP.Eof do begin

      xCoaDoc:=DMCXP.DisplayDescrip('TGE110','COADOCID','DOCID',DMCXP.cdsMovCxP.FieldByName('DOCID').AsString);

      If Length(xCoaDoc)>0 then begin

         xCoaDBF := DMCXP.DisplayDescrip('TGE129','COADBF','COADOCID',xCoaDoc);

         If Length(xCoaDBF)>0 then begin

            If xCoaDBF='X68CPCOA' then begin

               FlTrNotas := True;
               xNroReg := xNroReg + 1;

               xDia    := Copy(DateToStr(DMCXP.cdsMovCxP.FieldByName('CPFCMPRB').AsDateTime),1,2);

               if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then begin
                  xMoneda:='1';
                  xBase:=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPGRAVAD').AsFloat,15,2),ffNumber,15,2);
                  xIGV :=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPIGV').AsFloat   ,15,2),ffNumber,15,2);
                  xBase:=Copy('             '+xBase, (Length(xBase)),14);
                  xIGV :=Copy('             '+xIGV , (Length(xIGV )),14);
               end
               else begin
                  xMoneda:='0';
                  xBase:=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPGRAVAD').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2), ffNumber,15,2);
                  xIGV :=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPIGV').AsFloat   *DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2), ffNumber,15,2);
                  xBase:=Copy('             '+xBase, (Length(xBase)),14);
                  xIGV :=Copy('             '+xIGV , (Length(xIGV )),14);
               end;
               xLinea:= StrZero( IntToStr(xNroReg),6)+' '
                      + Copy( DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString+'        ',1,15)+' '
                      + DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString+' '
                      + DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString+xDia+' '
                      + xCoaDoc+' '
                      + Copy(DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString+'    ',1,4)+' '
                      + Copy(DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString+'                    ',1,20)+' '
                      + xBase+' '
                      + xIGV +' '
                      + '001 '
                      + xMoneda+' '
                      + Copy('  ',1,2)+' '
                      + Copy(DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString,5,6)+' '
                      + Copy(DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString+'    ',1,4)+' '
                      + Copy(DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString+'                    ',1,20)+' '
                      + DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString+xDia+' '
                      + '0';
               scFile.Lines.Add( xLinea );
            end;
         end;
      end;
      DMCXP.cdsMovCxP.Next
   end;

   scFile.Lines.SaveToFile( edtNomArch.Text+'X68CPCOA.ASC' );

end;


procedure TFTransfCOA.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFTransfCOA.BitBtn2Click(Sender: TObject);
begin
   dlbDir.Visible:= not dlbDir.Visible;

   if dlbDir.Visible then
      dlbDir.SetFocus;
end;

procedure TFTransfCOA.dlbDirChange(Sender: TObject);
begin
   if Copy(dlbDir.Directory,Length(dlbDir.Directory),1)='\' then
      edtNomArch.Text:=dlbDir.Directory
   else
      edtNomArch.Text:=dlbDir.Directory+'\';

end;

procedure TFTransfCOA.dlbDirExit(Sender: TObject);
begin
   dlbDir.Visible:=False;
end;

procedure TFTransfCOA.bbtnX61Click(Sender: TObject);
var
   xSQL,xSQL2,xVar : String;
begin
   xSQL:='Select CLAUXID from TGE102 WHERE CLAUXCP=''P'' OR CLAUXCP=''A''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest( xSQL );
   DMCXP.cdsQry.Open;
   if DMCXP.cdsQry.RecordCount= 0 then raise exception.Create('No exsiten Auxiliares para esta opción');

   DMCXP.cdsQry.First;
   xSQL2:=' (';
   xVar:='0';
   While Not DMCXP.cdsQry.Eof Do
   Begin
    If xVar='1' Then xSQL2:=xSQL2+',';
    xVar:='1';
    xSQL2:=xSQL2+QuotedStr(DMCXP.cdsQry.FieldByName('CLAUXID').AsString);
    DMCXP.cdsQry.Next;
   End;
   xSQL2:=xSQL2+') ';

   xSQL:='SELECT A.CLAUXID, A.PROV, A.PROVRUC, A.PROVDES, A.PROVABR, A.PROVNOMCOM, A.PROVRETIGV, '
        +  'A.PAISID, A.PROVDIR, A.PROVCZIP, A.PROVTELF, A.PROVFAX, A.PROVEMAI '
        +'FROM TGE201 A, '
        +   '( SELECT CLAUXID, PROV FROM CXP301 B '
        +     'where CIAID in ('+wRUCCIA+')'
        +       ' and CPANOMES>='+Quotedstr(dblcPeriodo1.Text)
        +       ' and CPANOMES<='+Quotedstr(dblcPeriodo2.Text)
        +       ' and CPIGV>0 '
        +     'GROUP BY CLAUXID, PROV '
        +   ') B '
        +'WHERE A.CLAUXID IN'+xSQL2
        +  'and A.CLAUXID=B.CLAUXID and A.PROV=B.PROV ';

   Filtracds( DMCXP.cdsProv, xSQL );

   dbgVer.Selected.Clear;
   dbgVer.Selected.Add('CLAUXID'#9'05'#9'Clase~Auxiliar'#9'F');
   dbgVer.Selected.Add('PROV'#9'12'#9'Auxiliar'#9'F');
   dbgVer.Selected.Add('PROVRUC'#9'12'#9'R.U.C.'#9'F');
   dbgVer.Selected.Add('PROVDES'#9'40'#9'Nombre/~Razón Social'#9'F');

   dbgVer.DataSource:=DMCXP.dsProv;

   bbtnImpX61.Enabled:=True;
   bbtnImpX58.Enabled:=False;
   bbtnImpX68.Enabled:=False;
   bbtnImpX78.Enabled:=False;
   bbtnImpX88.Enabled:=False;
end;

procedure TFTransfCOA.bbtnX58Click(Sender: TObject);
var
   xSQL : String;
   xGRABADO,xIGV : double;

begin
   if length(edtRUC.Text)=0 then
   begin
      ShowMessage('Falta Código de Compañía');
      dblcRUC.SetFocus;
      Exit;
   end;

   if Length(Trim(dblcPeriodo1.Text))=0 then
   begin
      ShowMessage('Falta Periodo Inicial');
      dblcPeriodo1.SetFocus;
      exit;
   end;

   if Length(Trim(dblcPeriodo2.Text))=0 then
   begin
      ShowMessage('Falta Periodo Final');
      dblcPeriodo2.SetFocus;
      exit;
   end;

   if Trim(dblcPeriodo2.Text)< Trim(dblcPeriodo1.Text) then
   begin
      dblcPeriodo2.Text := dblcPeriodo1.Text;
      raise exception.Create('El Periodo Final no puede'+#13+ 'ser menor al Periodo Inicial');
   end;

   xGRABADO := 0;
   xIGV     := 0;

   xSQL:='Select PROVRUC RUC, CPNOREG REGISTRO, CPANOMES PERIODO, CPFCMPRB FECHA, B.COADOCID DOCUMENTO, CPSERIE SERIE, CPNODOC NUMERO, '
        +  'ROUND(CASE WHEN TMONID='''+DMCXP.wTMonLoc+''' THEN CPGRAVAD ELSE CPGRAVAD*CPTCAMPR END,2) GRABADO, '
        +  'ROUND(CASE WHEN TMONID='''+DMCXP.wTMonLoc+''' THEN CPIGV    ELSE CPIGV   *CPTCAMPR END,2) IGV, '
        +  '''001'' CLASIFICACION, '
        +  'CASE WHEN TMONID='''+DMCXP.wTMonLoc+''' THEN 1 ELSE 0 END MONEDA '
        +'From CXP301 A, TGE110 B, TGE129 C '
        +'where CIAID in ('+wRUCCIA+')'
        + ' and CPANOMES>='+Quotedstr(dblcPeriodo1.Text)
        + ' and CPANOMES<='+Quotedstr(dblcPeriodo2.Text)
        + ' and ( CPESTADO=''P'' or CPESTADO=''C'' ) and CPIGV>0 '
        + ' and B.DOCMOD=''CXP'' AND A.DOCID=B.DOCID '
        + ' and B.COADOCID=C.COADOCID and COADBF=''X58CPCOA''';

   Filtracds( DMCXP.cdsMovCxP, xSQL );

   (DMCXP.cdsMovCxP.FieldByName('GRABADO') AS TFloatField).DisplayFormat:= '###,##0.00';
   (DMCXP.cdsMovCxP.FieldByName('IGV') AS TFloatField).DisplayFormat    := '###,##0.00';

   (DMCXP.cdsMovCxP.FieldByName('GRABADO') AS TFloatField).EditFormat   := '#####0.00';
   (DMCXP.cdsMovCxP.FieldByName('IGV') AS TFloatField).EditFormat       := '#####0.00';

   dbgVer.Selected.Clear;
   dbgVer.Selected.Add('RUC'#9'12'#9'R.U.C.'#9'F');
   dbgVer.Selected.Add('REGISTRO'#9'11'#9'Registro'#9'F');
   dbgVer.Selected.Add('PERIODO'#9'07'#9'Periodo~(AAAAMM)'#9'F');
   dbgVer.Selected.Add('FECHA'#9'11'#9'Fecha'#9'F');
   dbgVer.Selected.Add('DOCUMENTO'#9'04'#9'Tipo~Doc.'#9'F');
   dbgVer.Selected.Add('SERIE'#9'05'#9'Serie'#9'F');
   dbgVer.Selected.Add('NUMERO'#9'10'#9'Número'#9'F');
   dbgVer.Selected.Add('GRABADO'#9'11'#9'Monto~Grabado'#9'F');
   dbgVer.Selected.Add('IGV'#9'11'#9'I.G.V.'#9'F');
   dbgVer.Selected.Add('CLASIFICACION'#9'05'#9'Clasificación'#9'F');
   dbgVer.Selected.Add('MONEDA'#9'05'#9'Moneda'#9'F');

   dbgVer.DataSource:=DMCXP.dsMovCxP;

   xGRABADO := OperClientDataSet( DMCXP.cdsMovCxP , 'SUM(GRABADO)', '');
   xIGV     := OperClientDataSet( DMCXP.cdsMovCxP , 'SUM(IGV)', '');

   dbgVer.ColumnByName('GRABADO').FooterValue :=floattostrf(xGrabado, ffNumber, 10, 2);
   dbgVer.ColumnByName('IGV').FooterValue     :=floattostrf(xIgv, ffNumber, 10, 2);

   bbtnImpX61.Enabled:=False;
   bbtnImpX58.Enabled:=True;
   bbtnImpX68.Enabled:=False;
   bbtnImpX78.Enabled:=False;
   bbtnImpX88.Enabled:=False;
end;

procedure TFTransfCOA.bbtnX68Click(Sender: TObject);
var
   xSQL : String;
   xGRABADO, xIGV  :double;

begin
   if length(edtRUC.Text)=0 then
   begin
      ShowMessage('Falta Código de Compañía');
      dblcRUC.SetFocus;
      Exit;
   end;

   if Length(Trim(dblcPeriodo1.Text))=0 then
   begin
      ShowMessage('Falta Periodo Inicial');
      dblcPeriodo1.SetFocus;
      exit;
   end;

   if Length(Trim(dblcPeriodo2.Text))=0 then
   begin
      ShowMessage('Falta Periodo Final');
      dblcPeriodo2.SetFocus;
      exit;
   end;

   if Trim(dblcPeriodo2.Text)< Trim(dblcPeriodo1.Text) then
   begin
      dblcPeriodo2.Text := dblcPeriodo1.Text;
      raise exception.Create('El Periodo Final no puede'+#13+ 'ser menor al Periodo Inicial');
   end;

   xGRABADO :=0;
   xIGV     :=0;
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
       xSQL:='Select A.PROVRUC RUC, A.CPNOREG REGISTRO, A.CPANOMES PERIODO, A.CPFCMPRB FECHA, '
            +  'B.COADOCID DOCUMENTO, A.CPSERIE SERIE, A.CPNODOC NUMERO, '
            +  'ROUND(CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN CPGRAVAD ELSE CPGRAVAD*CPTCAMPR END,2) GRABADO, '
            +  'ROUND(CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN CPIGV    ELSE CPIGV   *CPTCAMPR END,2) IGV, '
            +  '''001'' CLASIFICACION, CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN 1 ELSE 0 END MONEDA, '
            +  'E.COADOCID REFDOC, D.CPSERIE REFSERIE, D.CPNODOC REFDOCUM, CCPFCJE REFFECHA '
            +'From CXP301 A '
            +  'LEFT JOIN CXP305 D ON ( D.CIAID=A.CIAID and D.DOCID2=A.DOCID and '
            +                          'D.CPSERIE2=A.CPSERIE AND D.CPNODOC2=A.CPNODOC ) '
            +                          'A.TCANJEID=D.TCANJEID AND A.CPCANJE=D.CCPCANJE ) '
            +  'LEFT JOIN TGE110 E ON ( E.DOCMOD=''CXP'' AND D.DOCID=E.DOCID ), '
            +  'TGE110 B, TGE129 C '
            +'where A.CIAID in ('+wRUCCIA+')'
            + ' and CPANOMES>='+Quotedstr(dblcPeriodo1.Text)
            + ' and CPANOMES<='+Quotedstr(dblcPeriodo2.Text)
            + ' and ( CPESTADO=''P'' or CPESTADO=''C'' ) and CPIGV>0 '
            + ' and B.DOCMOD=''CXP'' AND A.DOCID=B.DOCID '
            + ' and B.COADOCID=C.COADOCID and COADBF=''X68CPCOA'''
   else
      if (SRV_D = 'ORACLE')  then
         xSQL:='Select A.PROVRUC RUC, A.CPNOREG REGISTRO, A.CPANOMES PERIODO, A.CPFCMPRB FECHA, '
              +  'B.COADOCID DOCUMENTO, A.CPSERIE SERIE, A.CPNODOC NUMERO, '
              +  'ROUND(CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN CPGRAVAD ELSE CPGRAVAD*CPTCAMPR END,2) GRABADO, '
              +  'ROUND(CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN CPIGV    ELSE CPIGV   *CPTCAMPR END,2) IGV, '
              +  '''001'' CLASIFICACION, CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN 1 ELSE 0 END MONEDA, '
              +  'E.COADOCID REFDOC, D.CPSERIE REFSERIE, D.CPNODOC REFDOCUM, CCPFCJE REFFECHA '
              +'From CXP301 A , CXP305 D, TGE110 E ,'
              +  'TGE110 B, TGE129 C '
              +'where A.CIAID in ('+wRUCCIA+')'
              + ' and CPANOMES>='+Quotedstr(dblcPeriodo1.Text)
              + ' and CPANOMES<='+Quotedstr(dblcPeriodo2.Text)
              + ' and ( CPESTADO=''P'' or CPESTADO=''C'' ) and CPIGV>0 '
              + ' and B.DOCMOD=''CXP'' AND A.DOCID=B.DOCID '
              + ' and B.COADOCID=C.COADOCID and COADBF=''X68CPCOA'''
              +  'AND ( A.CIAID=D.CIAID(+) and A.DOCID=D.DOCID2(+) and '
              +        'A.CPSERIE=D.CPSERIE2(+) AND A.CPNODOC=D.CPNODOC2(+) and '
              +        'A.TCANJEID=D.TCANJEID(+) AND A.CPCANJE=D.CCPCANJE(+) ) '
              +  'AND ( D.DOCID=E.DOCID(+) AND E.DOCMOD=''CXP'' ) ';

   Filtracds( DMCXP.cdsMovCxP, xSQL );

   (DMCXP.cdsMovCxP.FieldByName('GRABADO') AS TFloatField).DisplayFormat:= '###,##0.00';
   (DMCXP.cdsMovCxP.FieldByName('IGV') AS TFloatField).DisplayFormat    := '###,##0.00';
   (DMCXP.cdsMovCxP.FieldByName('GRABADO') AS TFloatField).EditFormat   := '#####0.00';
   (DMCXP.cdsMovCxP.FieldByName('IGV') AS TFloatField).EditFormat       := '#####0.00';

   dbgVer.Selected.Clear;
   dbgVer.Selected.Add('RUC'#9'12'#9'R.U.C.'#9'F');
   dbgVer.Selected.Add('REGISTRO'#9'11'#9'Registro'#9'F');
   dbgVer.Selected.Add('PERIODO'#9'07'#9'Periodo~(AAAAMM)'#9'F');
   dbgVer.Selected.Add('FECHA'#9'11'#9'Fecha'#9'F');
   dbgVer.Selected.Add('DOCUMENTO'#9'04'#9'Tipo~Doc.'#9'F');
   dbgVer.Selected.Add('SERIE'#9'05'#9'Serie'#9'F');
   dbgVer.Selected.Add('NUMERO'#9'10'#9'Número'#9'F');
   dbgVer.Selected.Add('GRABADO'#9'11'#9'Monto~Grabado'#9'F');
   dbgVer.Selected.Add('IGV'#9'11'#9'I.G.V.'#9'F');
   dbgVer.Selected.Add('CLASIFICACION'#9'05'#9'Clasificación'#9'F');
   dbgVer.Selected.Add('MONEDA'#9'05'#9'Moneda'#9'F');
   dbgVer.Selected.Add('REFDOC'#9'10'#9'Referencia~Tipo Doc.'#9'F');
   dbgVer.Selected.Add('REFSERIE'#9'10'#9'Referencia~Serie'#9'F');
   dbgVer.Selected.Add('REFDOCUM'#9'12'#9'Referencia~Número'#9'F');
   dbgVer.Selected.Add('REFFECHA'#9'11'#9'Referencia~Fecha'#9'F');

   dbgVer.DataSource:=DMCXP.dsMovCxP;

   xGRABADO := OperClientDataSet( DMCXP.cdsMovCxP , 'SUM(GRABADO)', '');
   xIGV     := OperClientDataSet( DMCXP.cdsMovCxP , 'SUM(IGV)', '');

   dbgVer.ColumnByName('GRABADO').FooterValue :=floattostrf(xGrabado, ffNumber, 10, 2);
   dbgVer.ColumnByName('IGV').FooterValue     :=floattostrf(xIgv, ffNumber, 10, 2);

   bbtnImpX61.Enabled:=False;
   bbtnImpX58.Enabled:=False;
   bbtnImpX68.Enabled:=True;
   bbtnImpX78.Enabled:=False;
   bbtnImpX88.Enabled:=False;
end;

procedure TFTransfCOA.bbtnX78Click(Sender: TObject);
var
   xSQL : String;
   xGRABADO, xIGV  :double;
begin
   if length(edtRUC.Text)=0 then
   begin
      ShowMessage('Falta RUC de Compañía');
      dblcRUC.SetFocus;
      Exit;
   end;

   if Length(Trim(dblcPeriodo1.Text))=0 then
   begin
      ShowMessage('Falta Periodo Inicial');
      dblcPeriodo1.SetFocus;
      exit;
   end;

   if Length(Trim(dblcPeriodo2.Text))=0 then
   begin
      ShowMessage('Falta Periodo Final');
      dblcPeriodo2.SetFocus;
      exit;
   end;

   if Trim(dblcPeriodo2.Text)< Trim(dblcPeriodo1.Text) then
   begin
      dblcPeriodo2.Text := dblcPeriodo1.Text;
      raise exception.Create('El Periodo Final no puede'+#13+ 'ser menor al Periodo Inicial')
   end;

   xGRABADO :=0;
   xIGV     :=0;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
       xSQL:='Select A.PROVRUC RUC, A.CPNOREG REGISTRO, A.CPANOMES PERIODO, A.CPFCMPRB FECHA, '
            +  'B.COADOCID DOCUMENTO, A.CPSERIE SERIE, A.CPNODOC NUMERO, '
            +  'ROUND(CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN CPGRAVAD ELSE CPGRAVAD*CPTCAMPR END,2) GRABADO, '
            +  'ROUND(CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN CPIGV    ELSE CPIGV   *CPTCAMPR END,2) IGV, '
            +  '''001'' CLASIFICACION, CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN 1 ELSE 0 END MONEDA, '
            +  'E.COADOCID REFDOC, D.CPSERIE REFSERIE, D.CPNODOC REFDOCUM, CCPFCJE REFFECHA '
            +'From CXP301 A '
            +  'LEFT JOIN CXP305 D ON ( D.CIAID=A.CIAID and D.DOCID2=A.DOCID and '
            +                          'D.CPSERIE2=A.CPSERIE AND D.CPNODOC2=A.CPNODOC ) '
            +  'LEFT JOIN TGE110 E ON ( E.DOCMOD=''CXP'' AND D.DOCID=E.DOCID ), '
            +  'TGE110 B, TGE129 C '
            +'where A.CIAID in ('+wRUCCIA+')'
            + ' and CPANOMES>='+Quotedstr(dblcPeriodo1.Text)
            + ' and CPANOMES<='+Quotedstr(dblcPeriodo2.Text)
            + ' and ( CPESTADO=''P'' or CPESTADO=''C'' ) and CPIGV>0 '
            + ' and B.DOCMOD=''CXP'' AND A.DOCID=B.DOCID '
            + ' and B.COADOCID=C.COADOCID and COADBF=''X78CPCOA'''
   else
      if (SRV_D = 'ORACLE')  then
          xSQL:='Select A.PROVRUC RUC, A.CPNOREG REGISTRO, A.CPANOMES PERIODO, A.CPFCMPRB FECHA, '
              +  'B.COADOCID DOCUMENTO, A.CPSERIE SERIE, A.CPNODOC NUMERO, '
              +  'ROUND(CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN CPGRAVAD ELSE CPGRAVAD*CPTCAMPR END,2) GRABADO, '
              +  'ROUND(CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN CPIGV    ELSE CPIGV   *CPTCAMPR END,2) IGV, '
              +  '''001'' CLASIFICACION, CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN 1 ELSE 0 END MONEDA, '
              +  'E.COADOCID REFDOC, D.CPSERIE REFSERIE, D.CPNODOC REFDOCUM, CCPFCJE REFFECHA '
              +'From CXP301 A, CXP305 D, TGE110 E, '
              +  'TGE110 B, TGE129 C '
              +'where A.CIAID in ('+wRUCCIA+')'
              + ' and CPANOMES>='+Quotedstr(dblcPeriodo1.Text)
              + ' and CPANOMES<='+Quotedstr(dblcPeriodo2.Text)
              + ' and ( CPESTADO=''P'' or CPESTADO=''C'' ) and CPIGV>0 '
              + ' and B.DOCMOD=''CXP'' AND A.DOCID=B.DOCID '
              + ' and B.COADOCID=C.COADOCID and COADBF=''X78CPCOA'''
              +  'and ( A.CIAID=D.CIAID(+) and A.DOCID=D.DOCID2(+) and '
              +                          'A.CPSERIE=D.CPSERIE2(+) AND A.CPNODOC=D.CPNODOC2(+) ) '
              +  'and ( D.DOCID=E.DOCID(+) AND E.DOCMOD=''CXP'') ';

   Filtracds( DMCXP.cdsMovCxP, xSQL );

   (DMCXP.cdsMovCxP.FieldByName('GRABADO') AS TFloatField).DisplayFormat:= '###,##0.00';
   (DMCXP.cdsMovCxP.FieldByName('IGV') AS TFloatField).DisplayFormat    := '###,##0.00';

   (DMCXP.cdsMovCxP.FieldByName('GRABADO') AS TFloatField).EditFormat   := '#####0.00';
   (DMCXP.cdsMovCxP.FieldByName('IGV') AS TFloatField).EditFormat       := '#####0.00';

   dbgVer.Selected.Clear;
   dbgVer.Selected.Add('RUC'#9'12'#9'R.U.C.'#9'F');
   dbgVer.Selected.Add('REGISTRO'#9'11'#9'Registro'#9'F');
   dbgVer.Selected.Add('PERIODO'#9'07'#9'Periodo~(AAAAMM)'#9'F');
   dbgVer.Selected.Add('FECHA'#9'11'#9'Fecha'#9'F');
   dbgVer.Selected.Add('DOCUMENTO'#9'04'#9'Tipo~Doc.'#9'F');
   dbgVer.Selected.Add('SERIE'#9'05'#9'Serie'#9'F');
   dbgVer.Selected.Add('NUMERO'#9'10'#9'Número'#9'F');
   dbgVer.Selected.Add('GRABADO'#9'11'#9'Monto~Grabado'#9'F');
   dbgVer.Selected.Add('IGV'#9'11'#9'I.G.V.'#9'F');
   dbgVer.Selected.Add('CLASIFICACION'#9'05'#9'Clasificación'#9'F');
   dbgVer.Selected.Add('MONEDA'#9'05'#9'Moneda'#9'F');
   dbgVer.Selected.Add('REFDOC'#9'10'#9'Referencia~Tipo Doc.'#9'F');
   dbgVer.Selected.Add('REFSERIE'#9'10'#9'Referencia~Serie'#9'F');
   dbgVer.Selected.Add('REFDOCUM'#9'12'#9'Referencia~Número'#9'F');
   dbgVer.Selected.Add('REFFECHA'#9'11'#9'Referencia~Fecha'#9'F');

   dbgVer.DataSource:=DMCXP.dsMovCxP;

   xGRABADO := OperClientDataSet( DMCXP.cdsMovCxP , 'SUM(GRABADO)', '');
   xIGV     := OperClientDataSet( DMCXP.cdsMovCxP , 'SUM(IGV)', '');

   dbgVer.ColumnByName('GRABADO').FooterValue :=floattostrf(xGrabado, ffNumber, 10, 2);
   dbgVer.ColumnByName('IGV').FooterValue     :=floattostrf(xIgv, ffNumber, 10, 2);

   bbtnImpX61.Enabled:=False;
   bbtnImpX58.Enabled:=False;
   bbtnImpX68.Enabled:=False;
   bbtnImpX78.Enabled:=True;
   bbtnImpX88.Enabled:=False;
end;


procedure TFTransfCOA.bbtnX88Click(Sender: TObject);
var
   xSQL : String;
   xGRABADO, xIGV  :double;
begin
	if Length(dblcRUC.Text)=0 Then
	begin
      ShowMessage('Falta Seleccionar el RUC');
      dblcRUC.SetFocus;
      Exit;
	end;

   if Length(Trim(dblcPeriodo1.Text))=0 then
   begin
      ShowMessage('Falta Periodo Inicial');
      dblcPeriodo1.SetFocus;
      exit;
   end;

   if Length(Trim(dblcPeriodo2.Text))=0 then
   begin
      ShowMessage('Falta Periodo Final');
      dblcPeriodo2.SetFocus;
      exit;
   end;

   if Trim(dblcPeriodo2.Text)< Trim(dblcPeriodo1.Text) then
   begin
      dblcPeriodo2.Text := dblcPeriodo1.Text;   
      raise exception.Create('El Periodo Final no puede'+#13+ 'ser menor al Periodo Inicial')
   end;


   xGRABADO :=0;
   xIGV     :=0;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
       xSQL:='Select A.PROVRUC RUC, A.CPNOREG REGISTRO, A.CPANOMES PERIODO, A.CPFCMPRB FECHA, '
            +  'B.COADOCID DOCUMENTO, A.CPSERIE SERIE, A.CPNODOC NUMERO, '
            +  'ROUND(CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN CPGRAVAD ELSE CPGRAVAD*CPTCAMPR END,2) GRABADO, '
            +  'ROUND(CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN CPIGV    ELSE CPIGV   *CPTCAMPR END,2) IGV, '
            +  '''001'' CLASIFICACION, CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN 1 ELSE 0 END MONEDA, '
            +  'E.COADOCID REFDOC, D.CPSERIE REFSERIE, D.CPNODOC REFDOCUM, CCPFCJE REFFECHA '
            +'From CXP301 A '
            +  'LEFT JOIN CXP305 D ON ( D.CIAID=A.CIAID and D.DOCID2=A.DOCID and '
            +                          'D.CPSERIE2=A.CPSERIE AND D.CPNODOC2=A.CPNODOC ) '
            +  'LEFT JOIN TGE110 E ON ( E.DOCMOD=''CXP'' AND D.DOCID=E.DOCID ), '
            +  'TGE110 B, TGE129 C '
            +'where A.CIAID in ('+wRUCCIA+')'
            + ' and CPANOMES>='+Quotedstr(dblcPeriodo1.Text)
            + ' and CPANOMES<='+Quotedstr(dblcPeriodo2.Text)
            + ' and ( CPESTADO=''P'' or CPESTADO=''C'' ) and CPIGV>0 '
            + ' and B.DOCMOD=''CXP'' AND A.DOCID=B.DOCID '
            + ' and B.COADOCID=C.COADOCID and COADBF=''X88CPCOA'''
   else
      if (SRV_D = 'ORACLE') then
          xSQL:='Select A.PROVRUC RUC, A.CPNOREG REGISTRO, A.CPANOMES PERIODO, A.CPFCMPRB FECHA, '
                +  'B.COADOCID DOCUMENTO, A.CPSERIE SERIE, A.CPNODOC NUMERO, '
                +  'ROUND(CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN CPGRAVAD ELSE CPGRAVAD*CPTCAMPR END,2) GRABADO, '
                +  'ROUND(CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN CPIGV    ELSE CPIGV   *CPTCAMPR END,2) IGV, '
                +  '''001'' CLASIFICACION, CASE WHEN A.TMONID='''+DMCXP.wTMonLoc+''' THEN 1 ELSE 0 END MONEDA, '
                +  'E.COADOCID REFDOC, D.CPSERIE REFSERIE, D.CPNODOC REFDOCUM, CCPFCJE REFFECHA '
                +'From CXP301 A, CXP305 D, TGE110 E, '
                +  'TGE110 B, TGE129 C '
                +'where A.CIAID in ('+wRUCCIA+')'
                + ' and CPANOMES>='+Quotedstr(dblcPeriodo1.Text)
                + ' and CPANOMES<='+Quotedstr(dblcPeriodo2.Text)
                + ' and ( CPESTADO=''P'' or CPESTADO=''C'' ) and CPIGV>0 '
                + ' and B.DOCMOD=''CXP'' AND A.DOCID=B.DOCID '
                + ' and B.COADOCID=C.COADOCID and COADBF=''X88CPCOA'' '
                +  'and ( A.CIAID=D.CIAID(+) and A.DOCID=D.DOCID2(+) and '
                +                          'A.CPSERIE=D.CPSERIE2(+) AND A.CPNODOC=D.CPNODOC2(+) ) '
                +  'and ( D.DOCID=E.DOCID(+) and E.DOCMOD=''CXP'') ';

   Filtracds( DMCXP.cdsMovCxP, xSQL );

   (DMCXP.cdsMovCxP.FieldByName('GRABADO') AS TFloatField).DisplayFormat:= '###,##0.00';
   (DMCXP.cdsMovCxP.FieldByName('IGV') AS TFloatField).DisplayFormat    := '###,##0.00';

   (DMCXP.cdsMovCxP.FieldByName('GRABADO') AS TFloatField).EditFormat   := '#####0.00';
   (DMCXP.cdsMovCxP.FieldByName('IGV') AS TFloatField).EditFormat       := '#####0.00';
   
   dbgVer.DataSource:=DMCXP.dsMovCxP;

   xGRABADO := OperClientDataSet( DMCXP.cdsMovCxP , 'SUM(GRABADO)', '');
   xIGV     := OperClientDataSet( DMCXP.cdsMovCxP , 'SUM(IGV)', '');

   dbgVer.ColumnByName('GRABADO').FooterValue :=floattostrf(xGrabado, ffNumber, 10, 2);
   dbgVer.ColumnByName('IGV').FooterValue     :=floattostrf(xIgv, ffNumber, 10, 2);

   bbtnImpX61.Enabled:=False;
   bbtnImpX58.Enabled:=False;
   bbtnImpX68.Enabled:=False;
   bbtnImpX78.Enabled:=False;
   bbtnImpX88.Enabled:=True;
end;


procedure TFTransfCOA.dblcPeriodo1Exit(Sender: TObject);
var
   xWhere : string;
begin
   if Length(Trim(dblcPeriodo1.Text))>0 then
   begin
      BuscaQry('dspTGE','TGE813','ANOMES','ANOMES='+Quotedstr(dblcPeriodo1.Text),'ANOMES');
      if Trim(DMCXP.cdsQry.FieldByName('ANOMES').AsString)<>Trim(dblcPeriodo1.Text) then
      begin
         dblcPeriodo1.Text := '';
         dblcPeriodo1.SetFocus;
         raise exception.Create('Periodo no Válido');
      end;
   end;

   if Length(Trim(dblcPeriodo2.Text))=0 then
      dblcPeriodo2.Text := dblcPeriodo1.Text
end;


procedure TFTransfCOA.dblcPeriodo2Exit(Sender: TObject);
begin
   if Length(Trim(dblcPeriodo2.Text))>0 then
   begin
      BuscaQry('dspTGE','TGE813','ANOMES','ANOMES='+Quotedstr(dblcPeriodo2.Text),'ANOMES');
      if Trim(DMCXP.cdsQry.FieldByName('ANOMES').AsString)<>Trim(dblcPeriodo2.Text) then
      begin
         dblcPeriodo2.Text := dblcPeriodo1.Text;
         dblcPeriodo2.SetFocus;
         raise exception.Create('Periodo no Válido');
      end;
   end;
   if Trim(dblcPeriodo2.Text)< Trim(dblcPeriodo1.Text) then
   begin
      dblcPeriodo2.Text := dblcPeriodo1.Text;
      raise exception.Create('El Periodo Final no puede'+#13+ 'ser menor al Periodo Inicial')
   end;


end;

procedure TFTransfCOA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMCXP.cdsQry2.IndexFieldNames :='';
   DMCXP.cdsQry2.Filter   := '';
   DMCXP.cdsQry2.Filtered := False;
   DMCXP.cdsQry2.Close;

   DMCXP.cdsQry3.IndexFieldNames :='';
   DMCXP.cdsQry3.Filter   := '';
   DMCXP.cdsQry3.Filtered := False;
   DMCXP.cdsQry3.Close;

   DMCXP.cdsProv.IndexFieldNames :='';
   DMCXP.cdsProv.Filter   := '';
   DMCXP.cdsProv.Filtered := False;
   DMCXP.cdsProv.Close;

   DMCXP.cdsMovCxP.IndexFieldNames :='';
   DMCXP.cdsMovCxP.Filter   := '';
   DMCXP.cdsMovCxP.Filtered := False;
   DMCXP.cdsMovCxP.Close;
end;

procedure TFTransfCOA.TransfPoliza;
var
  xNroReg : Integer;
  xFiltro, xCoaDoc, xCoaDBF, xDia, xMoneda, xLinea : String;
  xBase, xIGV : String;
begin

   xFiltro := 'CIAID in ('+wRUCCIA+')'
            + ' and CPANOMES>='+Quotedstr(dblcPeriodo1.Text)
            + ' and CPANOMES<='+Quotedstr(dblcPeriodo2.Text)
            + ' and ( CPESTADO=''P'' or CPESTADO=''C'' ) and CPIGV>0 ';

   Filtracds( DMCXP.cdsMovCxP, 'Select * from CXP301 Where '+xFiltro );

   xNroReg := 0;

   scFile.Lines.Clear;

   DMCXP.cdsMovCxP.First;
   while not DMCXP.cdsMovCxP.Eof do begin

      xCoaDoc:=DMCXP.DisplayDescrip('TGE110','COADOCID','DOCID',DMCXP.cdsMovCxP.FieldByName('DocID').AsString);

      If Length(xCoaDoc)>0 then begin

         xCoaDBF := DMCXP.DisplayDescrip('TGE129','COADBF','COADOCID',xCoaDoc);

         If Length(xCoaDBF)>0 then begin

            If xCoaDBF='X78CPCOA' then begin

               FlTrCompr := True;
               xNroReg := xNroReg + 1;
               xDia    := Copy(DateToStr(DMCXP.cdsMovCxP.FieldByName('CPFCMPRB').AsDateTime),1,2);
               if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then begin
                  xMoneda:='1';
                  xBase:=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPGRAVAD').AsFloat,15,2),ffNumber,15,2);
                  xIGV :=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPIGV').AsFloat   ,15,2),ffNumber,15,2);
                  xBase:=Copy('             '+xBase, (Length(xBase)),14);
                  xIGV :=Copy('             '+xIGV , (Length(xIGV )),14);
               end
               else begin
                  xMoneda:='0';
                  xBase:=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPGRAVAD').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2), ffNumber,15,2);
                  xIGV :=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPIGV').AsFloat   *DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2), ffNumber,15,2);
                  xBase:=Copy('             '+xBase, (Length(xBase)),14);
                  xIGV :=Copy('             '+xIGV , (Length(xIGV )),14);
               end;
               xLinea:= StrZero( IntToStr(xNroReg),6)+' '
                      + Copy( DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString+'        ',1,15)+' '
                      + DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString+' '
                      + DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString+xDia+' '
                      + xCoaDoc+' '
                      + Copy(DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString+'    ',1,4)+' '
                      + Copy(DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString+'                    ',1,20)+' '
                      + xBase+' '
                      + xIGV +' '
                      + '001 '
                      + xMoneda+' '
                      + Copy(DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString,5,6)+' '
                      + '0';
               scFile.Lines.Add( xLinea );
            end;
         end;
      end;
      DMCXP.cdsMovCxP.Next
   end;

   scFile.Lines.SaveToFile( edtNomArch.Text+'X78CPCOA.ASC' );

end;


procedure TFTransfCOA.TransfExporta;
var
  xNroReg : Integer;
  xFiltro, xCoaDoc, xCoaDBF, xDia, xMoneda, xLinea : String;
  xBase, xIGV : String;
begin
   xFiltro := 'CIAID in ('+wRUCCIA+')'
{            + ' and CPFCMPRB>='+DMCXP.wRepFuncDate+' '''+ FormatDateTime(DMCXP.wFormatFecha,dbdtpFecIni.Date)+''' )'
            + ' and CPFCMPRB<='+DMCXP.wRepFuncDate+' '''+ FormatDateTime(DMCXP.wFormatFecha,dbdtpFecFin.Date)+''' )'}
            + ' and CPANOMES>='+Quotedstr(dblcPeriodo1.Text)
            + ' and CPANOMES<='+Quotedstr(dblcPeriodo2.Text)

            + ' and ( CPESTADO=''P'' or CPESTADO=''C'' ) and CPIGV>0 ';

   Filtracds( DMCXP.cdsMovCxP, 'Select * from CXP301 Where '+xFiltro );

   xNroReg := 0;

   scFile.Lines.Clear;

   DMCXP.cdsMovCxP.First;
   while not DMCXP.cdsMovCxP.Eof do begin

      xCoaDoc:=DMCXP.DisplayDescrip('TGE110','COADOCID','DOCID',DMCXP.cdsMovCxP.FieldByName('DocID').AsString);

      If Length(xCoaDoc)>0 then begin

         xCoaDBF := DMCXP.DisplayDescrip('TGE129','COADBF','COADOCID',xCoaDoc);

         If Length(xCoaDBF)>0 then begin

            If xCoaDBF='X88CPCOA' then begin

               FlTrCompr := True;
               xNroReg := xNroReg + 1;
               xDia    := Copy(DateToStr(DMCXP.cdsMovCxP.FieldByName('CPFCMPRB').AsDateTime),1,2);
               if DMCXP.cdsMovCxP.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then begin
                  xMoneda:='1';
                  xBase:=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPGRAVAD').AsFloat,15,2),ffNumber,15,2);
                  xIGV :=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPIGV').AsFloat   ,15,2),ffNumber,15,2);
                  xBase:=Copy('             '+xBase, (Length(xBase)),14);
                  xIGV :=Copy('             '+xIGV , (Length(xIGV )),14);
               end
               else begin
                  xMoneda:='0';
                  xBase:=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPGRAVAD').AsFloat*DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2), ffNumber,15,2);
                  xIGV :=FloatToStrF( FRound( DMCXP.cdsMovCxP.FieldByName('CPIGV').AsFloat   *DMCXP.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2), ffNumber,15,2);
                  xBase:=Copy('             '+xBase, (Length(xBase)),14);
                  xIGV :=Copy('             '+xIGV , (Length(xIGV )),14);
               end;
               xLinea:= StrZero( IntToStr(xNroReg),6)+' '
                      + Copy( DMCXP.cdsMovCxP.FieldByName('PROVRUC').AsString+'        ',1,15)+' '
                      + DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString+' '
                      + DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString+xDia+' '
                      + xCoaDoc+' '
                      + Copy(DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString+'    ',1,4)+' '
                      + Copy(DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString+'                    ',1,20)+' '
                      + xBase+' '
                      + xIGV +' '
                      + '001 '
                      + xMoneda+' '
                      + Copy(DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString,5,6)+' '
                      + '0';
               scFile.Lines.Add( xLinea );
            end;
         end;
      end;
      DMCXP.cdsMovCxP.Next
   end;

   scFile.Lines.SaveToFile( edtNomArch.Text+'X88CPCOA.ASC' );

end;


procedure TFTransfCOA.bbtnImpX61Click(Sender: TObject);
begin
   pprProv.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\COAProvs.rtm' ;
   pprProv.Template.LoadFromFile;
   ppDesigner1.ShowModal;
end;

procedure TFTransfCOA.bbtnImpX58Click(Sender: TObject);
begin
   pprMovs.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\COAMovs.rtm' ;
   pprMovs.Template.LoadFromFile;
   ppDesigner2.ShowModal;
end;

procedure TFTransfCOA.bbtnImpX68Click(Sender: TObject);
begin
   pprMovs.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\COAMovs.rtm' ;
   pprMovs.Template.LoadFromFile;
   ppDesigner2.ShowModal;
end;

procedure TFTransfCOA.bbtnImpX78Click(Sender: TObject);
begin
   pprMovs.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\COAMovs.rtm' ;
   pprMovs.Template.LoadFromFile;
   ppDesigner2.ShowModal;
end;

procedure TFTransfCOA.bbtnImpX88Click(Sender: TObject);
begin
   pprMovs.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\COAMovs.rtm' ;
   pprMovs.Template.LoadFromFile;
   ppDesigner2.ShowModal;
end;

procedure TFTransfCOA.dblcRUCExit(Sender: TObject);
begin
//	 if bbtnBorra.Focused then Exit;
	 if length(trimleft(trimright(dblcRUC.Text)))=0 then
	 begin
			ShowMessage('Digite o Escoja RUC de Compañía');
			dblcRUC.SetFocus;
			exit;
	 end;
	 edtRUC.Text:=DMCXP.DisplayDescrip2('dspUltTGE','TGE101','CIAID,CIADES,CIARUC','CIARUC='+quotedstr(dblcRUC.Text),'CIADES');
	 if length(edtRUC.Text)=0 then
	 begin
			ShowMessage('RUC de Compañía Inválido');
			dblcRUC.SetFocus;
			exit;
	 end;
    wRUCCIA := '';
    DMCXP.cdsQry.First;
    while not DMCXP.cdsQry.EOF do
    begin
       if length(wRUCCIA)=0 then
          wRUCCIA:=quotedstr(DMCXP.cdsQry.FieldByName('CIAID').AsString)
       else
          wRUCCIA:=wRUCCIA+','+quotedstr(DMCXP.cdsQry.FieldByName('CIAID').AsString);
       DMCXP.cdsQry.Next;
    end;
end;

procedure TFTransfCOA.FormShow(Sender: TObject);
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.

