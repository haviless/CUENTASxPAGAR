unit CxP602;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, wwdbedit, wwdblook, ComCtrls,
  wwdbdatetimepicker, Buttons, ppDB, ppDBPipe, ppCtrls, ppBands, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppVar, ppStrtch,
  ppRegion, ppViewr, pptypes, oaVariables;

type
  TFRepRegDiarios = class(TForm)
    rgbTipDoc: TGroupBox;
    rbTipDocTodos: TRadioButton;
    rbTipDocEscoger: TRadioButton;
    Bevel1: TBevel;
    lvTipoDoc: TListView;
    Bevel2: TBevel;
    Label1: TLabel;
    rgbFechas: TGroupBox;
    dbdtpFReg1: TwwDBDateTimePicker;
    dbdtpFReg2: TwwDBDateTimePicker;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Z2bbtnOk: TBitBtn;
    Z2bbtnCanc: TBitBtn;
    Bevel3: TBevel;
    cboEstado: TComboBox;
    cboOrdenar: TComboBox;
    Label4: TLabel;
    Bevel4: TBevel;
    Label5: TLabel;
    Bevel5: TBevel;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    ppField7: TppField;
    ppField8: TppField;
    ppField9: TppField;
    ppField10: TppField;
    ppField11: TppField;
    edtTitulo: TEdit;
    Bevel6: TBevel;
    Label6: TLabel;
    rgHoja: TRadioGroup;
    Bevel7: TBevel;
    cbCCosto: TCheckBox;
    ppHeaderBand1: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine2: TppLine;
    ppLabel7: TppLabel;
    pplTitulo: TppLabel;
    ppLabel9: TppLabel;
    ppLabel16: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppFechas: TppLabel;
    ppLabel70: TppLabel;
    svPag: TppSystemVariable;
    pplblCia: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDBText8: TppDBText;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBText3: TppDBText;
    ppVariable1: TppVariable;
    ppDBText5: TppDBText;
    ppDBText9: TppDBText;
    ppLabel1: TppLabel;
    ppVariable2: TppVariable;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel17: TppLabel;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppDBCalc3: TppDBCalc;
    ppLabel26: TppLabel;
    ppLabel4: TppLabel;
    procedure dblcCiaChange(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dbdtpFReg1Exit(Sender: TObject);
    procedure dbdtpFReg2Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure rbTipDocEscogerClick(Sender: TObject);
    procedure rbTipDocTodosClick(Sender: TObject);
    procedure Z2bbtnOkClick(Sender: TObject);
    procedure ppVariable1Calc2(Sender: TObject;
  var Value: Variant);
    procedure ppVariable2Calc(Sender: TObject; var Value: Variant);
    procedure ppReport1PreviewFormCreate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);
  private
    { Private declarations }
    procedure Valida ;
    procedure CargaDataSource;
  public
    { Public declarations }
  end;

  procedure OPComprobantesIngresados; stdcall;

exports
  OPComprobantesIngresados;

var
  FRepRegDiarios: TFRepRegDiarios;

implementation

uses CxPDM;

{$R *.DFM}


procedure OPComprobantesIngresados;
var
   xSQL : String;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   if Assigned( FRepRegDiarios ) then Exit;
   try
   	 Screen.Cursor:=crHourGlass;
     FRepRegDiarios := TFRepRegDiarios.create( Application );
   	 FRepRegDiarios.ActiveMDIChild;
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
     Screen.Cursor:=crDefault;
   finally
   end;
end;


procedure TFRepRegDiarios.dblcCiaChange(Sender: TObject);
begin
   if  length(dblcCia.Text)=dblcCia.LookupTable.FieldByName('CIAID').Size then
   begin
	   if dblcCia.Text=dblcCia.LookupTable.FieldByName('CIAID').AsString then
	   begin
	      if edtCia.Text<>dblcCia.LookupTable.FieldByName('CIADES').AsString then
	      begin
	            edtCia.Text:=dblcCia.LookupTable.FieldByName('CIADES').AsString;
	      end;
	   end
	   else
	   begin
	     if not dblcCia.LookupTable.Locate('CIAID', dblcCia.Text,[]) then
	     begin
	          edtCia.text:='';
	     end
	     else
	     begin
	          edtCia.text:=dblcCia.LookupTable.fieldbyname('CIADES').AsString;
	     end;
	   end;
   end
   else
   begin
           edtCia.text:='';
   end;
end;


procedure TFRepRegDiarios.dblcCiaExit(Sender: TObject);
begin
if edtCia.Text='' then
begin
    if dblcCia.Text='' then
      ShowMessage('Ingrese Compañía')
    else
      ShowMessage('El Código de Compañía que ha Ingresado'+#13 +
                  'No está registrado');
    (Sender as twincontrol).SetFocus;
end
end;
procedure TFRepRegDiarios.dbdtpFReg1Exit(Sender: TObject);
begin
   If dbdtpFReg1.date=0 then
   begin
      dbdtpFReg1.SetFocus;
      ShowMessage('Error : Falta Registrar Fecha');
      Raise Exception.Create('Error : Falta Registrar Fecha');
   end
   else
       if (dbdtpFReg1.Date > dbdtpFReg2.Date) then
          dbdtpFReg2.Date := dbdtpFReg1.Date ;
end;

procedure TFRepRegDiarios.dbdtpFReg2Exit(Sender: TObject);
begin
   If dbdtpFReg2.date=0 then
   begin
      dbdtpFReg2.SetFocus;
      ShowMessage(' Error : Falta Registrar Fecha ');
      Raise Exception.Create(' Error : Falta Registrar Fecha ');
   end;
   If dbdtpFReg2.date<dbdtpFReg1.date then
   begin
      dbdtpFReg1.date := dbdtpFReg2.Date  ;
   end;

end;


procedure TFRepRegDiarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;

end;

procedure TFRepRegDiarios.FormShow(Sender: TObject);
var
   i : Integer ;
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );

   if not DMCXP.cdsCia.Active then
   begin
      DMCXP.cdsCia.Open ;
   end ;
   RecuperarCiaUnica( dblcCia , edtCia )  ;
   dbdtpFReg1.Date := Date                ;
   dbdtpFReg2.Date := Date                ;
//   if DMCXP.RecuperarDatos('TGE110','DOCID,DOCID||''-''||DOCDES DOCDES','DOCMOD = ''CXP'' ORDER BY DOCID ') then
   if DMCXP.RecuperarDatos('TGE110','DOCID,DOCDES','DOCMOD = ''CXP'' AND ( DOC_FREG=''P'' OR DOC_FREG=''N'' ) ORDER BY DOCID ') then
   begin
////////
      lvTipoDoc.Items.Clear ;
      i := 0 ;
      while (not DMCXP.cdsUltTGE.Eof) do
      begin
        lvTipoDoc.Items.Add;
        lvTipoDoc.Items[i].Caption := DMCXP.cdsUltTGE.fieldbyname('DOCID').asString;
        lvTipoDoc.Items[i].SubItems.Add(DMCXP.cdsUltTGE.fieldbyname('DOCDES').asString);
        DMCXP.cdsUltTGE.Next;
        i := i+1;
      end;
////////
   end ;
   cboEstado.ItemIndex := 0 ;
   cboOrdenar.ItemIndex := 0 ;
end;

procedure TFRepRegDiarios.rbTipDocEscogerClick(Sender: TObject);
begin
  lvTipoDoc.Enabled := true ;
end;

procedure TFRepRegDiarios.rbTipDocTodosClick(Sender: TObject);
begin
  lvTipoDoc.Enabled := False ;
end;

procedure TFRepRegDiarios.Z2bbtnOkClick(Sender: TObject);
var
  xWhere ,
  xSQL   ,
  xAdic   : string    ;
  i       : Integer   ;
  Bandera : Boolean   ;
begin
  Valida ;
  Screen.Cursor:=crHourGlass;
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
  	if not cbCCosto.Checked then
      xSQL:='SELECT CXP301.TDIARID, CXP301.CPNOREG, TGE110.DOCABR, '
           + 'CPSERIE, CPNODOC, PROV, CNT201.CLAUXID, CNT201.AUXNOMB, '
           + 'CASE WHEN (CXP301.CPMTOLOC=CXP301.CPMTOORI AND CPESTADO<>''A'' AND CPESTADO <> ''E'') THEN CPMTOLOC END CPMTOLOC, '
           + 'CASE WHEN (CXP301.CPMTOEXT=CXP301.CPMTOORI AND CPESTADO<>''A'' AND CPESTADO <> ''E'') THEN CPMTOEXT END CPMTOEXT, '
           + 'A.DCPGLOSA, CXP301.CPESTADO, CXP301.CPFCMPRB '
           +'FROM CXP301 '
           +  'INNER JOIN TGE110 ON ( TGE110.DOCMOD=''CXP'' AND CXP301.DOCID=TGE110.DOCID ) ' //AND  DOC_FREG=''P'') '
           +  'INNER JOIN CNT201 ON ( CXP301.CLAUXID=CNT201.CLAUXID AND CXP301.PROV=CNT201.AUXID ) '
           +  'LEFT JOIN '
           +  '( '
           +    'SELECT A.CIAID,A.DCPANOMM,A.TDIARID,A.CPNOREG,MIN(A.DCPGLOSA) DCPGLOSA '
           +    'FROM CXP302 A '
           +    'WHERE A.CIAID ='''+trim(dblcCia.Text)+''' AND  ( TREGID=''01'' OR TREGID=''02'' OR TREGID=''10'' ) '
           +    'GROUP BY A.CIAID,A.DCPANOMM ,A.TDIARID,A.CPNOREG '
           +  ') AS A '
           +   'ON ( A.CIAID  = CXP301.CIAID AND A.DCPANOMM= CXP301.CPANOMES AND '
           +        'A.TDIARID= CXP301.TDIARID AND A.CPNOREG= CXP301.CPNOREG )'
  	else
      xSQL:='SELECT CXP301.TDIARID, CXP301.CPNOREG, TGE110.DOCABR, '
           + 'CPSERIE, CPNODOC, A.CCOSID, A.CCOSDES, PROV,  CXP301.CLAUXID, CXP301.PROVDES AUXNOMB, '
           + 'CASE WHEN (CXP301.CPMTOLOC=CXP301.CPMTOORI AND CPESTADO<>''A'' AND CPESTADO <> ''E'') THEN CPMTOLOC END CPMTOLOC, '
           + 'CASE WHEN (CXP301.CPMTOEXT=CXP301.CPMTOORI AND CPESTADO<>''A'' AND CPESTADO <> ''E'') THEN CPMTOEXT END CPMTOEXT, '
           + 'CASE WHEN (A.DCPMOLOC=A.DCPMOORI AND CPESTADO<>''A'' AND CPESTADO<>''E'') '
           +      'THEN DECIMAL(A.DCPMOLOC,15,2) END DCPMOLOC, '
           + 'CASE WHEN (A.DCPMOEXT=A.DCPMOORI AND CPESTADO<>''A'' AND CPESTADO<>''E'') '
           +      'THEN DECIMAL(A.DCPMOEXT,15,2) END DCPMOEXT, '

           + 'A.DCPGLOSA, CXP301.CPESTADO, CXP301.CPFCMPRB '
           +'FROM CXP301 '
           +  'INNER JOIN TGE110 ON (CXP301.DOCID = TGE110.DOCID AND TGE110.DOCMOD=''CXP'' ) '  //AND DOC_FREG=''P'') '
           +  'LEFT JOIN '
           +  '( '
           +    'SELECT A.CIAID,A.DCPANOMM,A.TDIARID,A.CPNOREG,MIN(A.DCPGLOSA) DCPGLOSA, '
           +       'A.CCOSID, MAX(B.CCOSDES) CCOSDES, '
           +       'SUM( COALESCE(A.DCPMOORI,0)*1.18 ) DCPMOORI, '
           +       'SUM( COALESCE(A.DCPMOLOC,0)*1.18 ) DCPMOLOC, '
           +       'SUM( COALESCE(A.DCPMOEXT,0)*1.18 ) DCPMOEXT  '
           +    'FROM CXP302 A '
           +      'LEFT JOIN TGE203 B ON (A.CCOSID=B.CCOSID) '
           +    'WHERE TREGID=''01'' OR TREGID=''02'' OR TREGID=''10'' '
           +    'GROUP BY A.CIAID, A.DCPANOMM, A.TDIARID, A.CPNOREG, A.CCOSID '
           +  ') AS A '
           +   'ON ( A.CIAID  = CXP301.CIAID AND A.DCPANOMM= CXP301.CPANOMES AND '
           +        'A.TDIARID= CXP301.TDIARID AND A.CPNOREG= CXP301.CPNOREG )';
    xWhere:=' WHERE CXP301.CIAID ='''+trim(dblcCia.Text) +''' ' ;
  end
  else
	if SRV_D = 'ORACLE' then
  begin
  	if not cbCCosto.Checked then
    begin
      xSQL:=     'SELECT CXP301.TDIARID, CXP301.CPNOREG, TGE110.DOCABR, ';
      xSQL:=xSQL+'CPSERIE, CPNODOC, PROV, A.DCPGLOSA, CXP301.CPESTADO, CXP301.CPFCMPRB, ';
      xSQL:=xSQL+'CNT201.CLAUXID, CNT201.AUXNOMB, ';
      xSQL:=xSQL+'DECODE(CXP301.CPMTOLOC, CXP301.CPMTOORI, DECODE(CPESTADO, ''A'', 0, DECODE(CPESTADO, ''E'', 0, CPMTOLOC))) AS CPMTOLOC, ';
      xSQL:=xSQL+'DECODE(CXP301.CPMTOEXT, CXP301.CPMTOORI, DECODE(CPESTADO, ''A'', 0, DECODE(CPESTADO, ''E'', 0, CPMTOEXT))) AS CPMTOEXT ';
      xSQL:=xSQL+'FROM CXP301, TGE110, CNT201, (SELECT A.CIAID,A.DCPANOMM ,A.TDIARID,A.CPNOREG,MIN(A.DCPGLOSA) DCPGLOSA ';
      xSQL:=xSQL+' FROM CXP302 A ';
      xSQL:=xSQL+' WHERE TREGID=''01'' OR TREGID = ''02'' OR TREGID =''10'' OR TREGID =''08'' ';
      xSQL:=xSQL+' GROUP BY A.CIAID,A.DCPANOMM ,A.TDIARID,A.CPNOREG) A ';
      xSQL:=xSQL+'WHERE CXP301.CIAID ='''+trim(dblcCia.Text)+''' ' ;
      xSQL:=xSQL+'AND CXP301.DOCID = TGE110.DOCID(+) AND TGE110.DOCMOD = ''CXP'' AND DOC_FREG(+) = ''P'' ';
      xSQL:=xSQL+'AND CXP301.PROV = CNT201.AUXID(+) AND  CXP301.CLAUXID = CNT201.CLAUXID(+) ';
      xSQL:=xSQL+'AND A.CIAID = CXP301.CIAID(+) ';
      xSQL:=xSQL+'AND A.DCPANOMM = CXP301.CPANOMES(+) ';
      xSQL:=xSQL+'AND A.TDIARID = CXP301.TDIARID(+) ';
      xSQL:=xSQL+'AND A.CPNOREG = CXP301.CPNOREG(+) ';
    end
    else
    begin
      xSQL:=     'SELECT CXP301.TDIARID, CXP301.CPNOREG, TGE110.DOCABR, CPSERIE, CPNODOC, ';
      xSQL:=xSQL+'X.CCOSID, X.CCOSDES, PROV, CXP301.CLAUXID, CXP301.PROVDES AUXNOMB, CXP301.CPFCMPRB,';
//--DECODE(CXP301.CPMTOLOC, CXP301.CPMTOORI, CPESTADO<>'A', CPESTADO <> 'E',CPMTOLOC) CPMTOLOC,
//--DECODE(CXP301.CPMTOEXT=CXP301.CPMTOORI AND CPESTADO<>'A' AND CPESTADO <> 'E') THEN CPMTOEXT ) CPMTOEXT,
//--DECODE(A.DCPMOLOC=A.DCPMOORI AND CPESTADO<>'A' AND CPESTADO<>'E') THEN DECIMAL(A.DCPMOLOC,15,2) END DCPMOLOC,
//--DECODE(A.DCPMOEXT=A.DCPMOORI AND CPESTADO<>'A' AND CPESTADO<>'E') THEN DECIMAL(A.DCPMOEXT,15,2) END DCPMOEXT,
      xSQL:=xSQL+'CPMTOLOC,  CPMTOEXT, DCPMOLOC, DCPMOEXT, ';
      xSQL:=xSQL+'X.DCPGLOSA, CXP301.CPESTADO ';
      xSQL:=xSQL+'FROM CXP301, TGE110, ';
      xSQL:=xSQL+'(SELECT A.CIAID, A.DCPANOMM, A.TDIARID, A.CPNOREG, ';
      xSQL:=xSQL+'  MIN(A.DCPGLOSA) DCPGLOSA, A.CCOSID, MIN(B.CCOSDES) CCOSDES, ';
      xSQL:=xSQL+'  SUM( NVL(A.DCPMOORI,0)*1.18 ) DCPMOORI, ';
      xSQL:=xSQL+'  SUM( NVL(A.DCPMOLOC,0)*1.18 ) DCPMOLOC, ';
      xSQL:=xSQL+'  SUM( NVL(A.DCPMOEXT,0)*1.18 ) DCPMOEXT ';
      xSQL:=xSQL+'  FROM CXP302 A, TGE203 B ';
      xSQL:=xSQL+'  WHERE A.CCOSID=B.CCOSID ';
      xSQL:=xSQL+'    AND (TREGID=''01'' OR TREGID=''02'' OR TREGID=''10'' ) ';
      xSQL:=xSQL+'  GROUP BY A.CIAID, A.DCPANOMM, A.TDIARID, A.CPNOREG, A.CCOSID  )  X ';
      xSQL:=xSQL+'WHERE CXP301.DOCID = TGE110.DOCID(+) ';
      xSQL:=xSQL+'AND TGE110.DOCMOD(+)=''CXP'' ';
      xSQL:=xSQL+'AND DOC_FREG(+)=''P'' ';
      xSQL:=xSQL+'AND(X.CIAID  = CXP301.CIAID ';
      xSQL:=xSQL+'AND X.DCPANOMM= CXP301.CPANOMES ';
      xSQL:=xSQL+'AND X.TDIARID= CXP301.TDIARID ';
      xSQL:=xSQL+'AND X.CPNOREG= CXP301.CPNOREG) ';
    end;
  	xWhere := '' ;
	end;

  if rbTipDocEscoger.Checked then
  begin
   Bandera := False ;
   xAdic   := ''    ;
   xWhere := xWhere + ' AND CXP301.DOCID IN (''' ;
   for i := 0 to lvTipoDoc.items.Count-1 do
   begin
      if lvTipoDoc.items[i].Checked then
      begin
         Bandera := True ;
         xAdic   :=  xAdic + lvTipoDoc.items[i].Caption+''',''' ;
      end ;
   end;
   xAdic := copy(xAdic,1,length(xAdic)-2)+')' ;
   xWhere := xWhere + xAdic ;

   if not Bandera then
      Raise Exception.create('Seleccione Tipo de Documento') ;
  end ;
  case cboEstado.ItemIndex of
   1 :
      begin
        xWhere := xWhere + ' AND CPESTADO = ''I'' '
      end   ;
   2 :
      begin
        xWhere := xWhere + ' AND CPESTADO = ''A'' '
      end  ;
   3 :
      begin
        xWhere := xWhere + ' AND CPESTADO = ''P'' '
      end  ;
   4 :
      begin
        xWhere := xWhere + ' AND CP_CONTA = ''S'' '
      end ;
   5 :
      begin
        xWhere := xWhere + ' AND CPESTADO = ''E'' '
      end ;
  end;
{  xWhere := xWhere + ' AND (CPFREG >=''' + FechaDB2(dbdtpFReg1.date) + ''' ' +
                     ' OR CPFREG <=''' + FechaDB2(dbdtpFReg2.date) + ''' )' ;}
  xWhere:=xWhere+' AND ( CPFCMPRB>=''' + FechaDB2(dbdtpFReg1.date) + ''' AND ' +
                        'CPFCMPRB<=''' + FechaDB2(dbdtpFReg2.date) + ''' ) ' ;
  xsql := xSQL + xWhere ;
  case cboOrdenar.ItemIndex of
   0 :
      begin
        xSQL := xSQL + ' ORDER BY TDIARID, CPNOREG '
      end  ;
   1 :
      begin
        xSQL := xSQL + ' ORDER BY DOCABR, CPNODOC'
      end   ;
   2 :
      begin
        xSQL := xSQL + ' ORDER BY CLAUXID, AUXNOMB'
      end  ;
   3 :
      begin
        xSQL := xSQL + ' ORDER BY CPFCMPRB, CPNOREG'
      end  ;
  end;

  DMCXP.cdsUltTGE.Close ;
  DMCXP.cdsUltTGE.DataRequest(xSQL) ;
    DMCXP.cdsUltTGE.Open  ;
  Screen.Cursor:=crDefault;
  if DMCXP.cdsUltTGE.RecordCount = 0 then
     Raise exception.create('No hay Datos Para el Rango Seleccionado') ;
  Screen.Cursor:=crHourGlass;
  ppDBPipeline1.DataSource := DMCXP.dsUltTGE  ;

  if not cbCCosto.Checked then
  begin
  	if rgHoja.ItemIndex=0 then
    	ppReport1.template.fileName:=ExtractFilePath( application.ExeName ) + wRutaRpt+'\CXPIngresoDiario.rtm'
    else
    	ppReport1.template.fileName:=ExtractFilePath( application.ExeName ) + wRutaRpt+'\CXPIngresoDiario_A4.rtm' ;
  end
  else
  begin
  	if rgHoja.ItemIndex=0 then
    	ppReport1.template.fileName:=ExtractFilePath( application.ExeName ) + wRutaRpt+'\CXPIngresoDiarioCC.rtm'
    else
    	ppReport1.template.fileName:=ExtractFilePath( application.ExeName ) + wRutaRpt+'\CXPIngresoDiarioCC_A4.rtm' ;
  end;
  ppReport1.template.LoadFromFile;

  if (dbdtpFReg1.date <> dbdtpFReg2.date) then
      ppFechas.Caption:= 'del '+datetostr( dbdtpFReg1.date ) + ' al ' + datetostr( dbdtpFReg2.date )
  else
      ppFechas.Caption:= datetostr( dbdtpFReg1.date )  ;

  pplTitulo.Caption:=edtTitulo.Text;
  pplblCia.Caption:= edtCia.Text;
  Screen.Cursor:=crDefault;  
  ppReport1.Print;
  ppReport1.Stop;
  ppDBPipeline1.DataSource := nil ;
end;

procedure TFRepRegDiarios.Valida;
begin
  if trim(dblcCia.Text) = '' then
  begin
     dblcCia.SetFocus ;
     Raise Exception.create('Ingrese Compañía') ;
  end ;
end;
{
procedure TFRepRegDiarios.ppVariable1Calc(Sender: TObject;
  var Value: Variant);
begin
   IF TRIM(DMCXP.cdsUltTGE.FIELDBYNAME('CPSERIE').AsString ) <> '' THEN
      Value := DMCXP.cdsUltTGE.FIELDBYNAME('CPSERIE').AsString +'-'+
               DMCXP.cdsUltTGE.FIELDBYNAME('CPNODOC').AsString
   ELSE
      vALUE := DMCXP.cdsUltTGE.FIELDBYNAME('CPNODOC').AsString ;
end;
}
procedure TFRepRegDiarios.ppVariable1Calc2(Sender: TObject;
  var Value: Variant);
begin
   IF TRIM(DMCXP.cdsUltTGE.FIELDBYNAME('CPSERIE').AsString ) <> '' THEN
      Value := DMCXP.cdsUltTGE.FIELDBYNAME('CPSERIE').AsString +'-'+
               DMCXP.cdsUltTGE.FIELDBYNAME('CPNODOC').AsString
   ELSE
      vALUE := DMCXP.cdsUltTGE.FIELDBYNAME('CPNODOC').AsString ;
end;

procedure TFRepRegDiarios.ppVariable2Calc(Sender: TObject;
  var Value: Variant);
begin
  if DMCXP.cdsUltTGE.FieldByName('CPESTADO').AsString = 'E'  then
  begin
     ppVariable2.Text      := ' E    L    I    M    I    N    A    D    O' ;
     ppVariable2.Visible   := True         ;
     EXIT ;
  end ;
  if DMCXP.cdsUltTGE.FieldByName('CPESTADO').AsString = 'A'  then
  begin
     ppVariable2.Text      :=  'A     N     U     L     A     D     O'    ;
     ppVariable2.Visible   := True         ;
     eXIT ;
  end ;
  ppVariable2.Visible := false ;

end;

procedure TFRepRegDiarios.ppReport1PreviewFormCreate(Sender: TObject);
begin
  ppReport1.PreviewForm.ClientHeight := 500;
  ppReport1.PreviewForm.ClientWidth := 650;			// ppViewr
  tppviewer(ppReport1.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFRepRegDiarios.FormCreate(Sender: TObject);
begin

   CargaDataSource;

end;

procedure TFRepRegDiarios.CargaDataSource;
begin
   dblcCia.DataSource        :=nil;
   dblcCia.LookupTable       :=DMCXP.cdsCia;
end;


procedure TFRepRegDiarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
   Action:=caFree;
end;

end.
