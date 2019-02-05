unit CXP782;

// Actualizaciones
// HPC_201604_CXP  22/04/2016  DAF_2016001430_CXP_1 Modifica Filtro para Certificado
//

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, wwdblook, Buttons, wwdbdatetimepicker, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppCtrls,
  ppPrnabl, ppBands, ppVar, Wwdbdlg, Spin, oaVariables, ppEndUsr,
  ppParameter, db;

type
  TFToolRetPend = class(TForm)
    pnlLet: TPanel;
    gbProv: TGroupBox;
    Label6: TLabel;
    dblcClAux: TwwDBLookupCombo;
    lblProv: TLabel;
    dblcdProv: TwwDBLookupComboDlg;
    chkTodos: TCheckBox;
    gbCia: TGroupBox;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Label1: TLabel;
    seAno: TSpinEdit;
    bbtnCertificado: TBitBtn;
    Timer1: TTimer;
    ppdb1: TppDBPipeline;
    ppr1: TppReport;
    ppd1: TppDesigner;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    GroupBox1: TGroupBox;
    bbtnMensual: TBitBtn;
    seAno2: TSpinEdit;
    seMes2: TSpinEdit;
    sbDisenoRep: TSpeedButton;
    cbDisenoRep: TCheckBox;
    procedure dblcCiaExit(Sender: TObject);
    procedure ppVMesCalc(Sender: TObject; var Value: Variant);
    procedure chkTodosClick(Sender: TObject);
    procedure dblcClAuxExit(Sender: TObject);
    procedure bbtnCertificadoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure bbtnMensualClick(Sender: TObject);
    procedure seMes2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }
    function NombreMes(wwMes: integer): String;
  public
    { Public declarations }
  end;

var
  FToolRetPend: TFToolRetPend;
  xAccesoBotones : Boolean;
  
implementation

{$R *.DFM}
uses CxPDM, CxP001;

procedure TFToolRetPend.dblcCiaExit(Sender: TObject);
begin
	 edtCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);
end;

function TFToolRetPend.NombreMes(wwMes: integer): String;
begin
   Case wwMes of
      1:  result:='Enero';
      2:  result:='Febrero';
      3:  result:='Marzo';
      4:  result:='Abril';
      5: result:='Mayo';
      6: result:='Junio';
      7: result:='Julio';
      8: result:='Agosto';
      9: result:='Setiembre';
     10: result:='Octubre';
     11: result:='Noviembre';
     12: result:='Diciembre';
   end;

end;


procedure TFToolRetPend.ppVMesCalc(Sender: TObject; var Value: Variant);
var
   iMes : integer;
begin
   iMes:= strtoint(DMCXP.cdsReporte.FieldByName('CPMM').AsString);
   value := NombreMes(iMes);
end;

procedure TFToolRetPend.chkTodosClick(Sender: TObject);
begin
  if chktodos.Checked then
  begin
     dblcClAux.Enabled:= false;
     dblcClAux.Text := '';
     dblcdProv.Enabled:= false;
     dblcdProv.Text:='';

  end
  else
  begin
     dblcClAux.Enabled:= True;
     dblcdProv.Enabled:= True;
  end;
end;

procedure TFToolRetPend.dblcClAuxExit(Sender: TObject);
begin
  Filtracds( DMCXP.cdsProv, 'SELECT CLAUXID, PROV, PROVRUC, PROVDES, PROVABR, PROVNOMCOM,PROVRETIGV,PAISID,PROVDIR,PROVCZIP,PROVTELF,PROVFAX,PROVEMAI FROM TGE201 WHERE CLAUXID='''+dblcClAux.Text+'''' );
end;

procedure TFToolRetPend.bbtnCertificadoClick(Sender: TObject);
var
  xSQL : String;
begin
// Inicio HPC_201604_CXP
// Actualiza Consulta por Provedor
   {
  xSQL:='SELECT A.CIAID, A.CPANOMES, A.TDIARID, A.CPNOREG, A.CLAUXID, A.PROV, A.PROVRUC, '
       +  'A.PROVDES, A.DOCID, A.CPSERIE, A.CPNODOC, A.CPFEMIS, A.CPAAAA, '
       +  'A.TMONID, A.CPTCAMPR, A.CPESTADO, A.CP_CONTA, '
       //+  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPGRAVAD ELSE 0 END BASEME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPGRAVAD+A.CPNOGRAV ELSE 0 END BASEME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPIGV*-1 ELSE 0 END CUARME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPISC*-1 ELSE 0 END IESME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPMTOORI ELSE 0 END TOTME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPGRAVAD ELSE A.CPGRAVAD+A.CPNOGRAV END BASEMN, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPIGV    ELSE A.CPIGV*(-1) END CUARMN, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPISC    ELSE A.CPISC*(-1) END IESMN, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPMTOLOC ELSE A.CPMTOLOC END TOTMN '
       +'FROM CXP301 A, '
       +  '( SELECT CIAID, TDIARID, DCPANOMM, CPNOREG,  SUM( CPGRAVAD )  CPGRAVAD, '
       +      'SUM( CPIGV ) CPIGV, SUM( CPISC ) CPISC, SUM( CPMTOLOC ) CPMTOLOC '
       +    'FROM ( SELECT CIAID, TDIARID, DCPANOMM, CPNOREG, '
       +             'CASE WHEN TIPDET=''MG'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD, '
       +             'CASE WHEN TIPDET=''I1'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV, '
       +             'CASE WHEN TIPDET=''I2'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPISC, '
       +             'CASE WHEN TIPDET=''TO'' THEN DCPMOLOC * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOLOC '
       +           'FROM CXP302 '
       +           'WHERE CIAID LIKE '''+dblcCia.text+'%'' AND DCPANOC='''+seAno.text+''' '
       +             'AND CLAUXID='''+dblcClAux.text+''' AND DCPAUXID='''+dblcdProv.text+''' '
       +         ') A '
       +    'GROUP BY CIAID, TDIARID, DCPANOMM, CPNOREG '
       +  ') B '
       +'WHERE A.CIAID LIKE '''+dblcCia.text+'%'' AND A.CPAAAA='''+seAno.text+''' '
       +  'AND CLAUXID='''+dblcClAux.text+'''AND A.PROV='''+dblcdprov.Text+''' '
       +  'AND A.CPESTADO IN (''P'',''C'') '
       +  'AND A.CIAID=B.CIAID AND A.TDIARID=B.TDIARID AND A.CPANOMES=B.DCPANOMM AND A.CPNOREG=B.CPNOREG '
       +'ORDER BY A.CPANOMES, A.CPNOREG';
  }
  xSQL:='Select A.CIAID, A.CPANOMES, A.TDIARID, A.CPNOREG, A.CLAUXID, A.PROV, A.PROVRUC, '
     +  '       A.PROVDES, A.DOCID, A.CPSERIE, A.CPNODOC, A.CPFEMIS, '
     +  '       A.CPAAAA, A.TMONID, A.CPTCAMPR, A.CPESTADO, A.CP_CONTA, '
     +  '       case when A.TMONID='''+DMCXP.wTMonLoc+''' then B.CPGRAVAD   else 0.00 end BASEMN, '
     +  '       case when A.TMONID='''+DMCXP.wTMonLoc+''' then B.CPIGV      else 0.00 end CUARMN, '
     +  '       case when A.TMONID='''+DMCXP.wTMonLoc+''' then B.CPISC      else 0.00 end IESMN, '
     +  '       case when A.TMONID='''+DMCXP.wTMonLoc+''' then B.CPMTOLOC   else 0.00 end TOTMN, '
     +  '       case when A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPGRAVADME else 0.00 end BASEME, '
     +  '       case when A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPIGVME    else 0.00 end CUARME, '
     +  '       case when A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPISCME    else 0.00 end IESME, '
     +  '       case when A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPMTOEXT   else 0.00 end TOTME '
     +  '  from CXP301 A, '
     +  '     (Select CIAID, TDIARID, DCPANOMM, CPNOREG, '
     +  '             sum(CPGRAVAD) CPGRAVAD,     sum(CPIGV) CPIGV,     sum(CPISC) CPISC,     sum(CPMTOLOC) CPMTOLOC, '
     +  '             sum(CPGRAVADME) CPGRAVADME, sum(CPIGVME) CPIGVME, sum(CPISCME) CPISCME, sum(CPMTOEXT) CPMTOEXT '
     +  '        from (Select CIAID, TDIARID, DCPANOMM, CPNOREG, '
     +  '                     case when TIPDET in (''MG'',''MN'',''AN'') then DCPMOLOC * case when DCPDH=''H'' THEN -1 else 1 end else 0 end CPGRAVAD, '
     +  '                     case when TIPDET=''I1''             then DCPMOLOC * case when DCPDH=''H'' THEN -1 else 1 end else 0 end CPIGV, '
     +  '                     case when TIPDET=''I2''             then DCPMOLOC * case when DCPDH=''H'' THEN -1 else 1 end else 0 end CPISC, '
     +  '                     case when TIPDET=''TO''             then DCPMOLOC * case when DCPDH=''D'' THEN -1 else 1 end else 0 end CPMTOLOC, '
     +  '                     case when TIPDET in (''MG'',''MN'',''AN'') then DCPMOEXT * case when DCPDH=''H'' THEN -1 else 1 end else 0 end CPGRAVADME, '
     +  '                     case when TIPDET=''I1''             then DCPMOEXT * case when DCPDH=''H'' THEN -1 else 1 end else 0 end CPIGVME, '
     +  '                     case when TIPDET=''I2''             then DCPMOEXT * case when DCPDH=''H'' THEN -1 else 1 end else 0 end CPISCME, '
     +  '                     case when TIPDET=''TO''             then DCPMOEXT * case when DCPDH=''D'' THEN -1 else 1 end else 0 end CPMTOEXT '
     +  '                from CXP302 '
     +  '               where CIAID like ('+quotedstr(dblcCia.text+'%')+')'
     +  '                 and DCPANOC='+quotedstr(seAno.text)
     +  '                 and CLAUXID='+quotedstr(dblcClAux.text)
     +  '                 and DCPAUXID='+quotedstr(dblcdProv.text)
     +  '              ) A '
     +  '       group by CIAID, TDIARID, DCPANOMM, CPNOREG '
     +  '      ) B '
     +  ' where A.CIAID like ('+quotedstr(dblcCia.text+'%')+')'
     +  '   and A.CPAAAA='+quotedstr(seAno.text)
     +  '   and CLAUXID='+quotedstr(dblcClAux.text)
     +  '   and A.PROV='+quotedstr(dblcdprov.Text)
     +  '   and A.CPESTADO IN (''P'',''C'') '
     +  '   and A.CIAID=B.CIAID AND A.TDIARID=B.TDIARID AND A.CPANOMES=B.DCPANOMM AND A.CPNOREG=B.CPNOREG '
     +  '  Order by A.CPANOMES, A.CPNOREG';
// Fin HPC_201604_CXP
   FPrincipal.Mantc.UsuarioSQL.Clear;
   FPrincipal.Mantc.UsuarioSQL.Add( xSQL );
   FPrincipal.Mantc.NewQuery;
end;

procedure TFToolRetPend.Timer1Timer(Sender: TObject);
begin
   FVariables.w_NombreForma := 'FToolRetPend';
   if (DMCXP.wAdmin='G') or (DMCXP.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMCXP.AccesosUsuariosR( DMCXP.wModulo,DMCXP.wUsuario,'2',FToolRetPend);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

procedure TFToolRetPend.bbtnMensualClick(Sender: TObject);
var
  xSQL : String;
begin

   if (seAno2.Text='') or (seMes2.Text='') then
   begin
      ShowMessage('Falta Ingresar Periodo');
      Exit;
   end;

  xSQL:='SELECT * FROM TGE104 WHERE REGISTRO=''4'' ';

  xSQL:='SELECT A.CIAID, A.CPANOMES, A.TDIARID, A.CPNOREG, A.CLAUXID, A.PROV, A.PROVRUC, '
       +  'A.PROVDES, A.DOCID, A.CPSERIE, A.CPNODOC, A.CPFEMIS, A.CPAAAA, '
       +  'A.TMONID, A.CPTCAMPR, A.CPESTADO, A.CP_CONTA, '
       +  'DCPGLOSA, CPTOID, CPTODES, C.CIADES, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPGRAVAD ELSE 0 END BASEME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPIGV*-1 ELSE 0 END CUARME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPISC*-1 ELSE 0 END IESME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN A.CPMTOORI ELSE 0 END TOTME, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPGRAVAD ELSE A.CPGRAVAD+A.CPNOGRAV+CPGRAVAD2+CPSERVIC END BASEMN, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPIGV    ELSE A.CPIGV*(-1) END CUARMN, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPISC    ELSE A.CPISC*(-1) END IESMN, '
       +  'CASE WHEN A.TMONID='''+DMCXP.wTMonExt+''' THEN B.CPMTOLOC ELSE A.CPMTOLOC + (NVL(A.CPDCTO,0)*CASE WHEN A.CPDCTO<0 THEN (-1) ELSE 1 END ) END TOTMN '
       +'FROM CXP301 A, '
       +  '( SELECT A.CIAID, A.TDIARID, DCPANOMM, CPNOREG, SUM( CPGRAVAD )  CPGRAVAD, '
       +      'SUM( CPIGV ) CPIGV, SUM( CPISC ) CPISC, SUM( CPMTOLOC ) CPMTOLOC, '
       +      'MAX( A.CPTOID ) CPTOID, MAX( DCPGLOSA ) DCPGLOSA, MAX( T.CPTODES ) CPTODES '
       +    'FROM ( SELECT D.CIAID, TDIARID, DCPANOMM, CPNOREG, '
       +             'CASE WHEN TIPDET=''MG'' OR TIPDET=''NG'' OR TIPDET=''MN'' OR TIPDET=''SV'' THEN D.CPTOID ELSE '''' END CPTOID, '
       +             'CASE WHEN TIPDET=''MG'' OR TIPDET=''NG'' OR TIPDET=''MN'' OR TIPDET=''SV'' THEN DCPGLOSA ELSE '''' END DCPGLOSA, '
       +             'CASE WHEN TIPDET=''MG'' OR TIPDET=''NG'' OR TIPDET=''MN'' OR TIPDET=''SV'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPGRAVAD, '
       +             'CASE WHEN TIPDET=''I1'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPIGV, '
       +             'CASE WHEN TIPDET=''I2'' THEN DCPMOLOC * CASE WHEN DCPDH=''H'' THEN -1 ELSE 1 END ELSE 0 END CPISC, '
       +             'CASE WHEN TIPDET=''TO'' OR TIPDET=''DC'' THEN DCPMOLOC * CASE WHEN DCPDH=''D'' THEN -1 ELSE 1 END ELSE 0 END CPMTOLOC '
       +           'FROM CXP302 D '
       +           'WHERE D.CIAID LIKE '''+dblcCia.text+'%'' AND DCPANOMM='''+seAno2.text+seMes2.Text+''' '
       //+           'WHERE D.CIAID LIKE '''+dblcCia.text+'%'' AND DCPANOC='''+seAno.text+''' '
       +             'AND CLAUXID LIKE '''+dblcClAux.text+'%'' AND DCPAUXID LIKE '''+dblcdProv.text+'%'' '
       +             'AND TDIARID=''19'' '
       +         ') A, CXP201 T '
       +    'WHERE A.CPTOID=T.CPTOID(+) '
       +    'GROUP BY A.CIAID, A.TDIARID, DCPANOMM, CPNOREG '
       +  ') B, TGE101 C '
       +'WHERE A.CIAID LIKE '''+dblcCia.text+'%'' AND A.CPANOMES='''+seAno2.text+seMes2.Text+''' AND A.TDIARID=''19'' '
       //+'WHERE A.CIAID LIKE '''+dblcCia.text+'%'' AND A.CPAAAA='''+seAno.text+''' AND A.TDIARID=''19'' '
       +  'AND CLAUXID LIKE '''+dblcClAux.text+'%''AND A.PROV LIKE '''+dblcdprov.Text+'%'' '
       +  'AND A.CIAID>=''02'' '
       +  'AND A.CPESTADO IN (''P'',''C'') '
       +  'and A.CIAID=C.CIAID '
       +  'AND A.CIAID=B.CIAID AND A.TDIARID=B.TDIARID AND A.CPANOMES=B.DCPANOMM AND A.CPNOREG=B.CPNOREG '
       +'ORDER BY CIAID, A.CPANOMES, A.CPNOREG';

   DMCXP.cdsQry10.Close;
   DMCXP.cdsQry10.DataRequest( xSQl );
   DMCXP.cdsQry10.Open;

   ppdb1.DataSource:=DMCXP.dsQry10;

   ppr1.Template.FileName:=ExtractFilePath( application.ExeName ) + wRutaRpt+'\Retenciones4taSunat.rtm' ;
   ppr1.Template.LoadFromFile;

   if cbDisenoRep.Checked then
      ppd1.ShowModal
   else
   begin
      ppr1.Print;
      ppr1.Stop;
   end;
end;

procedure TFToolRetPend.seMes2Exit(Sender: TObject);
begin
   seMes2.Text:=StrZero(seMes2.Text,2);
end;

procedure TFToolRetPend.FormCreate(Sender: TObject);
begin
   dblcCia.LookupTable       :=DMCXP.cdsCia;
   dblcClAux.LookupTable     :=DMCXP.cdsClAux;
   dblcdProv.LookupTable     :=DMCXP.cdsProv;      
end;

procedure TFToolRetPend.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFToolRetPend.sbDisenoRepClick(Sender: TObject);
begin
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
end;

end.

