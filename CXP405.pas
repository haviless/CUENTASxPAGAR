unit CxP405;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppVar, ppPrnabl, ppClass, ppCtrls, ppProd, ppReport,
  ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, StdCtrls, Buttons, ExtCtrls,
  ComCtrls, wwdblook, Db, Wwdatsrc, DBClient, wwclient, ppParameter, oaVariables;

type
//  TFcrConCCos = class(TCFReporte)
  TFcrConCCos = class(TForm)
    gbRango: TGroupBox;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dtpDesde: TDateTimePicker;
    dtpHasta: TDateTimePicker;
    rgCCosto: TRadioGroup;
    Z2bbtnSelCCosto: TBitBtn;
    rgEstado: TRadioGroup;
    cdsClone: TwwClientDataSet;
    dsDocContClone: TwwDataSource;
    Z2bbtnImprimir: TBitBtn;
    Z2bbtnSalir: TBitBtn;
    ppdbFuente: TppDBPipeline;
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
    ppField12: TppField;
    ppField13: TppField;
    ppField14: TppField;
    ppField15: TppField;
    Label1: TLabel;
    ppReporte: TppReport;
    ppParameterList1: TppParameterList;
    ppHBCab: TppHeaderBand;
    pplblEmpresa: TppLabel;
    pplblSistema: TppLabel;
    pplblPagina: TppLabel;
    pplblFecha: TppLabel;
    pplblHora: TppLabel;
    pplblTitulo: TppLabel;
    pplblLin0: TppLabel;
    pplblLin1: TppLabel;
    ppsvPagina: TppSystemVariable;
    ppsvFecha: TppSystemVariable;
    ppsvHora: TppSystemVariable;
    ppDBDet: TppDetailBand;
    pptxtNroReg: TppDBText;
    pptxtTPDoc: TppDBText;
    pptxtFeDoc: TppDBText;
    pptxtMtoLoc: TppDBText;
    pptxtMtoExt: TppDBText;
    pptxtProov: TppDBText;
    ppDBText5: TppDBText;
    ppDBText4: TppDBText;
    ppFBPie: TppFooterBand;
    pplblLin2: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc6: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    pptxtConcepto: TppDBText;
    ppDBText3: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel1: TppLabel;
    ppDBText7: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel2: TppLabel;
    ppDBText6: TppDBText;
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnSalirClick(Sender: TObject);
    procedure Z2bbtnImprimirClick(Sender: TObject);
    procedure rgCCostoClick(Sender: TObject);
    procedure Z2bbtnSelCCostoClick(Sender: TObject);
    procedure ppReportePreviewFormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Z2bbtnSalirClick(Sender: TObject);
    procedure ppHBCabBeforePrint(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    { Private declarations }
    procedure CargaDataSource;
  public
    { Public declarations }
    procedure ExecPrint(yDesde, yHasta : tdatetime; wCia : string);
  end;

  procedure OPMovimientosCptoCCosto; stdcall;

exports
  OPMovimientosCptoCCosto;

var
  FcrConCCos: TFcrConCCos;

implementation

{$R *.DFM}

uses CxPDM, CXP417;


procedure OPMovimientosCptoCCosto;
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
   if Assigned( FcrConCCos ) then Exit;
   try
     FcrConCCos := TFcrConCCos.Create( Application );
     FcrConCCos.ActiveMDIChild;
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   finally
   end;
end;


procedure TFcrConCCos.dblcCiaExit(Sender: TObject);
begin
//  inherited;
   edtCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CiaID',dblcCia.Text);
end;

procedure TFcrConCCos.bbtnSalirClick(Sender: TObject);
begin
  DMCXP.cdsCia.Close;
  Close;
//  inherited;
end;


procedure TFcrConCCos.Z2bbtnImprimirClick(Sender: TObject);
var dtTemp : tdatetime;
begin
//quitar  inherited ;
  if dtpDesde.dateTime = 0 then
  begin
    dtpDesde.setFocus;
    raise exception.Create('Error, Fecha invalida');
  end;
  if dtpHasta.dateTime = 0 then
  begin
    dtpHasta.setFocus;
    raise exception.Create('Error, Fecha invalida');
  end;
  if dtpDesde.date > dtpHasta.date then
  begin
    dtTemp := dtpDesde.datetime;
    dtpDesde.datetime := dtpHasta.datetime;
    dtpHasta.datetime := dtTemp;
  end;
  if Length(edtCia.Text)=0 then begin
    dblcCia.SetFocus;
    Raise Exception.Create(' Error :  Falta Registrar Compañía ');
  end;
  //quitar pplblEmpresa.Caption := edtCia.text;
  ExecPrint(dtpDesde.datetime, dtpHasta.datetime, dblcCia.text);
end;


procedure TFcrConCCos.ExecPrint(yDesde, yHasta : tdatetime; wCia : string);
var
	xAnd400,xAndOra,sWhere, sSQL : string;
begin
  //sWhere := 'CXP302.CPFEMIS>=DATE(' +quotedstr(formatdatetime(DMCXP.wFormatFecha,yDesde))+')';
  Screen.Cursor:=crHourGlass;
  sWhere := 'CXP302.CPFEMIS>='+quotedstr(formatdatetime(DMCXP.wFormatFecha,yDesde));
  sWhere := sWhere+ ' AND CXP302.CPFEMIS<=' +quotedstr(formatdatetime(DMCXP.wFormatFecha,yHasta));
  xAnd400 := '';
  xAndORA := '';
  If FSelCCosto.cdsClone.Active then
   if FSelCCosto.cdsClone.RecordCount > 0 then
    begin
     FSelCCosto.cdsClone.First;
     While not FSelCCosto.cdsClone.Eof do
      begin
       If (xAnd400 = '') or (xAndORA = '') then
        begin
         xAnd400 := ' AND (CXP302.CCOSID='+quotedstr(FSelCCosto.cdsClone.FieldByName('CCOSID').AsString);
         xAndORA := ' AND (CXP302.CCOSID='+quotedstr(FSelCCosto.cdsClone.FieldByName('CCOSID').AsString);
        end
       else
        begin
         xAnd400 := xAnd400 + ' OR CXP302.CCOSID='+quotedstr(FSelCCosto.cdsClone.FieldByName('CCOSID').AsString);
         xAndORA := xAndORA + ' OR CXP302.CCOSID='+quotedstr(FSelCCosto.cdsClone.FieldByName('CCOSID').AsString);
        end;
       FSelCCosto.cdsClone.next;
      end;
      xAnd400 := xAnd400 + ') ';
      xAndORA := xAndORA + ') ';
    end;
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    sSQL:=     'SELECT CXP302.CPNOREG, CXP302.DOCID, CXP302.CPNODOC, CXP302.DCPGLOSA, CXP302.CPTOID,';
    sSQL:=sSQL+  'CXP302.CPFEMIS, CXP302.DCPMOLOC, CXP302.DCPMOEXT, CXP302.CCOSID, ';
    sSQL:=sSQL+  'TGE201.PROVDES, CXP201.CPTODES, TGE203.CCOSDES, CXP301.PROV ';
    sSQL:=sSQL+'FROM CXP302 ';
    sSQL:=sSQL+' LEFT JOIN TGE203 ON ( CXP302.CCOSID=TGE203.CCOSID ) ';
    sSQL:=sSQL+' INNER JOIN CXP301 ON ( CXP302.CIAID=CXP301.CIAID AND CXP302.TDIARID=CXP301.TDIARID ';
    sSQL:=sSQL+' AND CXP302.DCPANOMM=CXP301.CPANOMES AND CXP302.CPNOREG=CXP301.CPNOREG ) ';
    sSQL:=sSQL+' LEFT JOIN CXP201 ON (CXP302.CPTOID=CXP201.CPTOID) ';
    sSQL:=sSQL+' LEFT JOIN TGE201 ON (TGE201.CLAUXID=CXP301.CLAUXID AND TGE201.PROV=CXP301.PROV) ';


    sSQL:=sSQL+'WHERE CXP302.CIAID='+quotedstr(wCia);
    sSQL:=sSQL+' AND ' +sWhere;

    if rgestado.ItemIndex=0 then
       sSQL:=sSQL+'AND ( CXP301.CPESTADO=''I'' ) ';
    if rgestado.ItemIndex=1 then
       sSQL:=sSQL+'AND ( CXP301.CPESTADO=''P'' OR CXP301.CPESTADO=''C'' ) ';
    if rgestado.ItemIndex=2 then
       sSQL:=sSQL+'AND ( CXP301.CPESTADO=''P'' OR CXP301.CPESTADO=''C'' or CXP301.CPESTADO=''I'') ';

    If Length(xAnd400) <> 0 then
     sSql := sSql + xAnd400;
    sSQL:=sSQL+' ORDER BY CXP201.CPTODES, TGE203.CCOSDES, TGE201.PROVDES';
  end
  else
	if SRV_D = 'ORACLE' then
  begin
    sSQL:=     'SELECT CXP302.*, TGE201.PROVDES, CXP201.CPTODES, TGE203.CCOSDES, CXP301.PROV ';
    sSQL:=sSQL+'FROM CXP302, TGE203, CXP301, CXP201, TGE201 ';

    if rgestado.ItemIndex=0 then
       sSQL:=sSQL+'WHERE ( CXP301.CPESTADO=''I'' ) ';
    if rgestado.ItemIndex=1 then
       sSQL:=sSQL+'WHERE ( CXP301.CPESTADO=''P'' OR CXP301.CPESTADO=''C'' ) ';
    if rgestado.ItemIndex=2 then
       sSQL:=sSQL+'WHERE ( CXP301.CPESTADO=''P'' OR CXP301.CPESTADO=''C'' or CXP301.CPESTADO=''I'') ';

    sSQL:=sSQL+'AND CXP302.CIAID='+quotedstr(wCia);
    sSQL:=sSQL+' AND CXP302.CCOSID=TGE203.CCOSID(+) ';
    sSQL:=sSQL+'AND CXP302.CIAID = CXP301.CIAID(+) ';
    sSQL:=sSQL+'AND CXP302.TDIARID = CXP301.TDIARID(+) ';
    sSQL:=sSQL+'AND CXP302.DCPANOMM = CXP301.CPANOMES(+) ';
    sSQL:=sSQL+'AND CXP302.CPNOREG=CXP301.CPNOREG(+) ';
    sSQL:=sSQL+'AND CXP302.CPTOID=CXP201.CPTOID(+) ';
    sSQL:=sSQL+'AND CXP301.CLAUXID=TGE201.CLAUXID(+) ';
    sSQL:=sSQL+'AND CXP301.PROV=TGE201.PROV(+) ';
    sSQL:=sSQL+'AND ' +sWhere;
    If Length(xAndORA) <> 0 then
     sSql := sSql + xAndORA;
    sSQL:=sSQL+' ORDER BY CXP201.CPTODES, TGE203.CCOSDES, TGE201.PROVDES ';
	end;
  Screen.Cursor:=crDefault;
  try
    DMCXP.cdsReporte.close;
    DMCXP.cdsReporte.datarequest(sSQL);
    DMCXP.cdsReporte.open;
    if DMCXP.cdsReporte.fieldbyname('CPNOREG').asString = '' then
    begin
      raise exception.Create('No existen registros para esta Solicitud');
    end;
    //ojo pplblTitulo.Text := 'MOVIMIENTOS POR CONCEPTO Y CENTRO DE COSTO'+#13+
    //ojo                    ' DEL ' +datetostr(yDesde)+ ' AL ' +datetostr(yHasta);

    ppReporte.TEMPLATE.FileName:=ExtractFilePath( application.ExeName )+wRutaRpt+'\RepMovCptoCC.rtm';
    ppReporte.Template.LoadFromFile;
    ppdbFuente.DataSource:=DMCXP.dsReporte;
    ppReporte.Print;
  finally

  end;

end;


procedure TFcrConCCos.rgCCostoClick(Sender: TObject);
begin
//  inherited;
  Z2bbtnSelCCosto.Enabled := rgCCosto.ItemIndex = 1;
end;

procedure TFcrConCCos.Z2bbtnSelCCostoClick(Sender: TObject);
begin
//  inherited;
   FSelCCosto.ShowModal ;
end;

procedure TFcrConCCos.ppReportePreviewFormCreate(Sender: TObject);
begin
//  inherited;
  //pprDistribucion.PreviewForm.ClientHeight := 500;
  //pprDistribucion.PreviewForm.ClientWidth := 650;			// ppViewr
  //tppviewer(pprDistribucion.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFcrConCCos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FSelCCosto.Free;
  FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
  Action:=caFree;
end;

procedure TFcrConCCos.FormCreate(Sender: TObject);
begin
//  inherited;

  CargaDataSource;

end;

procedure TFcrConCCos.CargaDataSource;
begin
   dblcCia.DataSource        :=nil;
   dblcCia.LookupTable       :=DMCXP.cdsCia;
end;


procedure TFcrConCCos.FormShow(Sender: TObject);
begin
  DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );

  dtpDesde.DateTime := date;
  dtpHasta.DateTime := date;
  DMCXP.cdsCia.Open;
  DMCXP.cdsCia.First;
  dblcCIA.text := DMCXP.cdsCia.fieldbyname('CIAID').asstring;
  dblcCIA.OnExit( Application );
  dblcCIA.enabled := (DMCXP.cdsCia.RecordCount > 1);
  FSelCCosto := TFSelCCosto.Create( Application );
end;

procedure TFcrConCCos.Z2bbtnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFcrConCCos.ppHBCabBeforePrint(Sender: TObject);
begin
   //xx
end;

procedure TFcrConCCos.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

Initialization
  registerclasses([TLabel, TppLabel]);
End.

