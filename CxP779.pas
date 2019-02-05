unit CxP779;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, ppDB, ppDBPipe, ppBands, ppClass,
  ppCtrls, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,DB,wwclient,
  oaVariables;

type
  TToolLetras = class(TForm)
    pnlTool: TPanel;
    sbtABl: TSpeedButton;
    sbtCBl: TSpeedButton;
    sbtEliminar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    sbtNC: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ppReporte: TppReport;
    ppHBCab: TppHeaderBand;
    pplblEmpresa: TppLabel;
    pplblSistema: TppLabel;
    pplblTitulo: TppLabel;
    ppsvPagina: TppSystemVariable;
    ppsvFecha: TppSystemVariable;
    ppsvHora: TppSystemVariable;
    pplblPagina: TppLabel;
    pplblFecha: TppLabel;
    pplblHora: TppLabel;
    pplblGuionBase: TppLabel;
    pplblLin0: TppLabel;
    pplblLin1: TppLabel;
    ppDBDet: TppDetailBand;
    ppFBPie: TppFooterBand;
    pplblLin2: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
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
    bbtnActLetra: TBitBtn;
    Timer2: TTimer;
    procedure sbtNCClick(Sender: TObject);
    procedure sbtCBlClick(Sender: TObject);
    procedure bbtnActLetraClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
		{ Private declarations }
    xGlosa, xLote, xCuenta, xPresup, xConcepto, xCtaDif, xGloDif, xDH : String;
		numreg  : iNTEGER;
    xDifCam, xPagAnt, xDifCLoc, xDifCExt : double;
    xPanel : TPanel;
    xLabel1,xLabel2,xLabel3 : TLabel;
    procedure GrabaContabilidadLetra;
   	procedure  GeneraAsientoCanje(xxCia,xxDiar,xxPer,xxNoReg:string);
    procedure CreandoPanel;
    procedure GrabaContabilidadDocumentos;
    procedure DetCxPUsuario;
    procedure GeneraDiferenciaCambio;
    procedure GrabaDiferenciaCambio;
    //CIM 27/06/2002
    procedure GrabaContabilidadRetencion;
	public
		{ Public declarations }
	end;

var
	ToolLetras: TToolLetras;
  xAccesoBotones : Boolean;

implementation

uses CxPDM, Cxp800,CxP001, Cxp804;

{$R *.DFM}

procedure TToolLetras.sbtNCClick(Sender: TObject);
var
	 xWhere, xSQL, xCia,xProv,xDocId,xSerie,xNoDoc,wModoCanje,xDocLetra,xDocAplica : String;
	 xClAux, xTMon, xRUC, xProvDes, xTDiario, xAnoMes, xCPNoReg : String;
	 xMtoOri, xMtoLoc, xMtoExt : Double;
begin
	 xWhere := 'DOCID='+quotedstr(DMCXP.cdsCCanje.fieldbyname('DOCID').AsString)
						 +' and DOCMOD='+quotedstr(DMCXP.wModulo);
	 xDocLetra := DMCXP.DisplayDescrip2('dspTGE','TGE110','DOCTIPREG',xWhere,'DOCTIPREG');
	 if (xDocLetra = 'LT') then // LT = Letras '93'
	 begin
			if (DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString = 'P' ) then
			begin
			// Determina Código de Documento para "Aplicación de Letras Anticipadas"
				 xWhere:='DOCMOD='+quotedstr('CXP')+' and DOCTIPREG='+quotedstr('LA');
				 xDocAplica := DMCXP.DisplayDescrip2('dspTGE','TGE110','DOCID',xWhere,'DOCID');

			// Busca en DMCXP.cdsMovCxP2, Documento de Aplicación, si no está se inserta en CXP301, sino se edita o consulta
			// dependiendo del estado de la Aplicación
				 if DMCXP.cdsMovCxP2.IndexFieldNames<>'CIAID;PROV;DOCID;CPSERIE;CPNODOC' then
						DMCXP.cdsMovCxP2.IndexFieldNames:='CIAID;PROV;DOCID;CPSERIE;CPNODOC';

				 xCia   := DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString;
				 xClAux := DMCXP.cdsMovCxP2.FieldByName('CLAUXID').AsString;
				 xAnoMes:= DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString;
				 xTDiario := DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString;
				 xCPNoReg := DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString;
				 xProv  := DMCXP.cdsMovCxP2.FieldByName('PROV').AsString;
				 xRUC   := DMCXP.cdsMovCxP2.FieldByName('PROVRUC').AsString;
				 xProvDes := DMCXP.cdsMovCxP2.FieldByName('PROVDES').AsString;
				 xDocId := DMCXP.cdsMovCxP2.FieldByName('DOCID').AsString;
				 xDocLetra := xDocId;
				 xSerie := DMCXP.cdsMovCxP2.FieldByName('CPSERIE').AsString;
				 xNoDoc := DMCXP.cdsMovCxP2.FieldByName('CPNODOC').AsString;
				 xTMon  := DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString;
				 xMtoOri:= DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat;
				 xMtoLoc:= DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat;
				 xMtoExt:= DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat;
				 DMCXP.cdsMovCxP2.SetKey;
				 DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString  := xCia;
				 DMCXP.cdsMovCxP2.FieldByName('PROV').AsString   := xProv;
				 DMCXP.cdsMovCxP2.FieldByName('DOCID').AsString  := xDocAplica;
				 DMCXP.cdsMovCxP2.FieldByName('CPSERIE').AsString:= xSerie;
				 DMCXP.cdsMovCxP2.FieldByName('CPNODOC').AsString:= xNoDoc;
				 if not DMCXP.cdsMovCxP2.GotoKey then
				 begin
						DMCXP.cdsMovCxP2.Append;
						DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString:=xCia;
						DMCXP.cdsMovCxP2.FieldByName('CLAUXID').AsString:=xClAux;
						DMCXP.cdsMovCxP2.FieldByName('PROV').AsString:=xProv;
						DMCXP.cdsMovCxP2.FieldByName('PROVRUC').AsString:=xRUC;
						DMCXP.cdsMovCxP2.FieldByName('PROVDES').AsString:=xProvDes;
						DMCXP.cdsMovCxP2.FieldByName('DOCID').AsString:=xDocAplica;
//						DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString:=xTDiario;
						DMCXP.cdsMovCxP2.FieldByName('TMONID').AsString:=xTMon;
						DMCXP.cdsMovCxP2.FieldByName('CPFCMPRB').AsDateTime:=Date;
						DMCXP.cdsMovCxP2.FieldByName('CPFRECEP').AsDateTime:=Date;
						DMCXP.cdsMovCxP2.FieldByName('CPFEMIS').AsDateTime:=Date;
						DMCXP.cdsMovCxP2.FieldByName('CPFVCMTO').AsDateTime:=Date;

						DMCXP.cdsMovCxP2.FieldByName('CPMTOORI').AsFloat:=xMtoOri;
						DMCXP.cdsMovCxP2.FieldByName('CPMTOLOC').AsFloat:=xMtoLoc;
						DMCXP.cdsMovCxP2.FieldByName('CPMTOEXT').AsFloat:=xMtoExt;
						DMCXP.cdsMovCxP2.FieldByName('CPPAGORI').AsFloat:=0;
						DMCXP.cdsMovCxP2.FieldByName('CPPAGLOC').AsFloat:=0;
						DMCXP.cdsMovCxP2.FieldByName('CPPAGEXT').AsFloat:=0;
						DMCXP.cdsMovCxP2.FieldByName('CPSALORI').AsFloat:=xMtoOri;
						DMCXP.cdsMovCxP2.FieldByName('CPSALLOC').AsFloat:=xMtoLoc;
						DMCXP.cdsMovCxP2.FieldByName('CPSALEXT').AsFloat:=xMtoExt;
//				 .....
						DMCXP.cdsMovCxP2.fieldbyname('CP_CONTA').AsString := 'N';
						DMCXP.cdsMovCxP2.fieldbyname('CPSERIE').AsString:= xSerie;
						DMCXP.cdsMovCxP2.fieldbyname('CPNODOC').AsString:= xNoDoc;

						DMCXP.cdsMovCxP2.Post;
						DMCXP.wModo := 'A';
				 end
				 else
				 begin
						if DMCXP.cdsMovCxP2.fieldbyname('CPESTADO').AsString = 'I' then
							 DMCXP.wModo := 'M'
						else
							 DMCXP.wModo := 'C';
				 end;

			// Detalle de la Letra
				 xSQL:='CIAID='+quotedstr(xCia)
							 +' and TDIARID='+quotedstr(xTDiario)
							 +' and DCPANOMM='+quotedstr(xAnoMes)
							 +' and CPNOREG='+quotedstr(xCPNoReg)
							 +' and DCPDH='+quotedstr('D');
				 Filtracds(DMCXP.cdsQry6,'select * from CXP302 where '+xSql );

			// Documentos a Seleccionar
				 xSQL := 'CIAID='+quotedstr(xCia)
							 + ' and PROV='+quotedstr(xProv)
							 + ' and DOCID<>'+quotedstr(xDocLetra)
							 + ' and DOCID<>'+quotedstr(xDocAplica)
							 + ' and ( CPESTADO=''P'' or CPESTADO=''C'' ) and (CPSALLOC > 0 and CPSALEXT > 0)';
				 Filtracds(DMCXP.cdsMovCxP,'select * from CXP301 where '+xSql );

			// Documentos Seleccionados (Archivo de Canje CXP304)
				 xSQL := 'CIAID='+quotedstr(xCia)
							 + ' and TCANJEID='+quotedstr('LA')
							 + ' and CCPCANJE='+quotedstr('');
				 Filtracds( DMCXP.cdsDetCanje,'select * from CXP304 where '+xSql );

				 xSQL:='CIAID='+quotedstr(xCia)
							+' and TDIARID='+quotedstr(DMCXP.cdsMovCxP2.FieldByName('TDIARID').AsString)
							+' and DCPANOMM='+quotedstr(DMCXP.cdsMovCxP2.FieldByName('CPANOMES').AsString)
							+' and CPNOREG='+quotedstr(DMCXP.cdsMovCxP2.FieldByName('CPNOREG').AsString)
							+' and TCANJEID='+quotedstr('LA');
				 Filtracds( DMCXP.cdsDetCxP,'select * from CXP302 where '+xSql+' order by DCPREG');

				 if DMCXP.cdsDetCxP.IndexFieldNames <> 'DCPREG' then
						DMCXP.cdsDetCxP.IndexFieldNames:='DCPREG';

				 FCanjeLT := TFCanjeLT.Create(self);

				 FCanjeLT.dbgDetCxP.Selected.clear;
				 FCanjeLT.dbgDetCxP.Selected.Add('DCPREG'#9'2'#9'Item');
				 FCanjeLT.dbgDetCxP.Selected.Add('TREGID'#9'2'#9'TR');
				 FCanjeLT.dbgDetCxP.Selected.Add('CPTOID'#9'11'#9'Concepto');
				 FCanjeLT.dbgDetCxP.Selected.Add('CUENTAID'#9'13'#9'Cuenta~Contable');
				 FCanjeLT.dbgDetCxP.Selected.Add('DCPGLOSA'#9'30'#9'Glosa');
				 FCanjeLT.dbgDetCxP.Selected.Add('CCOSID'#9'10'#9'Centro de~Costo');
				 FCanjeLT.dbgDetCxP.Selected.Add('DCPDH'#9'4'#9'Debe~Haber');
				 FCanjeLT.dbgDetCxP.Selected.Add('DCPMOORI'#9'12'#9'Importe');
				 FCanjeLT.dbgDetCxP.Selected.Add('TIPPRESID'#9'9'#9'Partida~Presupuestal');
				 FCanjeLT.dbgDetCxP.RedrawGrid;

				 FCanjeLT.dbgDetCanje.Selected.clear;
				 FCanjeLT.dbgDetCanje.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'T');
				 FCanjeLT.dbgDetCanje.Selected.Add('CPNODOC'#9'10'#9'Nº Documento'#9'T');
				 FCanjeLT.dbgDetCanje.Selected.Add('CCPFCJE'#9'12'#9'Fecha~Comprobante'#9'T');
				 FCanjeLT.dbgDetCanje.Selected.Add('CCPTCCJE'#9'13'#9'Tipo de~Cambio'#9'T');
				 FCanjeLT.dbgDetCanje.Selected.Add('CPSALLOC'#9'14'#9'Amortización~Mon. Local'#9'F');
				 FCanjeLT.dbgDetCanje.Selected.Add('CPSALEXT'#9'14'#9'Amortización~Mon. Extranjera'#9'F');
				 FCanjeLT.dbgDetCanje.RedrawGrid;
				 TNumericField(DMCXP.cdsDetCanje.FieldByName('CPSALLOC')).DisplayFormat := '###,###,##0.00';
				 TNumericField(DMCXP.cdsDetCanje.FieldByName('CPSALEXT')).DisplayFormat := '###,###,##0.00';


//				 FCanjeLT := TFCanjeLT.Create(self);
				 FCanjeLT.ShowModal;
				 FCanjeLT.Free;
			end
			else
				 Raise Exception.Create('La Letra no está ace[P]tada');
	end
	else
		Raise Exception.Create('Documento Seleccionado No es Letra Anticipada');
end;

procedure TToolLetras.sbtCBlClick(Sender: TObject);
var
   xSqlMant,xTabla,xSQL : string;
   xToolCia,xTooldiario,xToolAnomm : string;
   xCia,xPer,xDiar,xNReg,xEst,xConta : string;
   iCont : integer;
begin

  if DMCXP.cdsCCanje.recordcount=0 then exit;

  xSqlMant := FPrincipal.GLetras.FMant.SQL;

  If pos('CIAID=',xSqlMant) > 0 then
  	xToolCia     := copy(xSqlMant,pos('CIAID=',xSqlMant)+7,2);
  If pos('TDIARID=',xSqlMant) > 0 then
    xTooldiario := copy(xSqlMant,pos('TDIARID=',xSqlMant)+9,2);
  If pos('CJAAMM=',xSqlMant) > 0 then        
    xToolAnomm   := copy(xSqlMant,pos('CJAAMM=',xSqlMant)+8,6);
  If (xToolCIa = '') then
  begin
    showMessage('Debe de Filtrar también por Compañia');
    exit;
  end;
  If (xTooldiario = '') then
  begin
    showMessage('Debe de Filtrar también por Tipo de Diario');
    exit;
  end;
  If (xToolAnomm = '') then
  begin
    showMessage('Debe de Filtrar también por Periodo');
    exit;
  end;


  DMCXP.cdsCCanje.filter:='CJ_CONTA<>''S'' OR CJ_CONTA IS NULL';
  DMCXP.cdsCCanje.filtered:=true;
  if DMCXP.cdsCCanje.recordcount=0  then
  begin
     DMCXP.cdsCCanje.filtered:=false;
     showmessage('No existen registros a contabilizar');
     exit;
  end;
  if MessageDlg( 'Contabiliza Canje de Letras' + chr(13)+
									'       ¿Esta Seguro?       ',mtConfirmation,[mbYes, mbNo],0)=mrNo then
		 exit;

  CreandoPanel;
  xLabel1.caption := 'Filtrando Registros del Detalle...';
  xLabel1.refresh;
  xPanel.refresh;
  xLabel1.refresh;
  xPanel.refresh;

  iCont := 0;
  DMCXP.cdsCCanje.DisableControls;
  DMCXP.cdsCCanje.First;
  while not DMCXP.cdsCCanje.Eof do
  begin
  //////////////////
  	xCia   := DMCXP.cdsCCanje.FieldByName('CIAID').Asstring;
    xPer   := DMCXP.cdsCCanje.FieldByName('CJAAMM').Asstring;
    xDiar  := DMCXP.cdsCCanje.FieldByName('TDIARID').Asstring;
    xNReg  := DMCXP.cdsCCanje.FieldByName('CANJE').Asstring;
    xEst   := DMCXP.cdsCCanje.FieldByName('CJESTADO').Asstring;
    xConta := DMCXP.cdsCCanje.FieldByName('CJ_CONTA').Asstring;

	 if DMCXP.MesCerrado(copy(xPer,5,2),copy(xPer,1,4),xCia) then
   else
    	if ((xEst = 'P') or (xEst = 'C')) and ((xConta ='N') or (xConta='')) then
      begin
    	   GeneraAsientoCanje(xCia,xDiar,xPer,xNReg);

         xTabla:='CNT311';
         DMCXP.GeneraContab( xCia, xDiar, xPer, '0000'+xNReg, Self, 'C' );

         DMCXP.cdsLetras.DisableControls;
         DMCXP.cdsLetras.First;
         While not DMCXP.cdsLetras.Eof do
         begin
            xSQL := ' UPDATE CXP301 SET CP_CONTA='+Quotedstr('S')+
                    ' WHERE CIAID='+Quotedstr(xCia)+
                    ' AND TCANJEID='+Quotedstr('LE')+
                    ' AND CPCANJE='+Quotedstr(xNReg);
            try
              DMCXP.DCOM1.AppServer.IniciaTransaccion;
              DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
              DMCXP.DCOM1.AppServer.GrabaTransaccion;
            except
              DMCXP.DCOM1.AppServer.RetornaTransaccion;
            end;
            DMCXP.cdsLetras.Next;
         end;

         xSQL:='Update CXP308 Set CJ_CONTA='+quotedstr('S')
              +' Where CIAID='   +quotedstr(xCia)
              +'  and TDIARID=' +quotedstr(xDiar)
              +'  and CJAAMM='+quotedstr(xPer)
              +'  and CANJE=' +quotedstr(xNReg)
              +'  and (CJESTADO='+quotedstr('P')+' OR CJESTADO ='+quotedstr('C')+' ) ';
         try
           DMCXP.DCOM1.AppServer.IniciaTransaccion;
           DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
           DMCXP.DCOM1.AppServer.GrabaTransaccion;
         except
           DMCXP.DCOM1.AppServer.RetornaTransaccion;
         end;
         DMCXP.cdsLetras.EnableControls;
         DMCXP.cdsLetras.Close;
         DMCXP.cdsDetCxP.Close;
         DMCXP.cdsCanje.Close;
         iCont := icont+1;
         
      end;

   xLabel2.caption := 'Total de Registros :'+inttostr(iCont) ;
   xLabel2.refresh;
   xPanel.refresh;
   DMCXP.cdsCCanje.Next;
  end;
  DMCXP.cdsCCanje.Enablecontrols;
  xLabel3.caption := 'TERMINO...' ;
  xLabel3.refresh;
  xPanel.refresh;
  xLabel1.free;xLabel2.free;xLabel3.free; xPanel.Free;
  DMCXP.cdsCCanje.filtered:=false;
  showmessage('Registros Contabilizados');

end;
procedure TToolLetras.GeneraAsientoCanje(xxCia,xxDiar,xxPer,xxNoReg:string);
var
	 xFiltro,xSQL,xWhere : sTRING;
   xTDebe,xTHaber,xDifFinal : double;

begin
	 xFiltro:=' CIAID='+Quotedstr(xxCia)+
						' AND TDIARID='+Quotedstr(xxDiar)+
						' AND DCPANOMM='+Quotedstr(xxPer)+
						' AND CPNOREG=''' +'0000'+xxNoReg+'''';
	 Filtracds( DMCXP.cdsDetCxP,'Select * from CXP302 Where '+xFiltro );

	 xFiltro := ' CIAID='   +Quotedstr(xxCia)+
							' AND TCANJEID='+Quotedstr('LE')+
							' AND CCPCANJE='+Quotedstr(xxNoReg);
	 Filtracds( DMCXP.cdsCanje,'Select * from CXP304 Where '+xFiltro );

   xFiltro := ' CIAID='   +Quotedstr(xxCia)+
              ' AND TCANJEID='+Quotedstr('LE')+
              ' AND CPCANJE=' +Quotedstr(xxNoReg);
   Filtracds( DMCXP.cdsLetras,'Select * from CXP301 Where '+xFiltro );


	 DMCXP.cdsDetCxP.First;
	 DMCXP.cdsCanje.IndexFieldNames    :='CIAID;TCANJEID;CCPCANJE;DOCID;CPSERIE;CPNODOC';
	 DMCXP.cdsDetCxP.DisableControls;
	 DMCXP.cdsDetCxP.First;
	 xGlosa    := DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString;
	 xLote     := DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString;
	 xCuenta   := DMCXP.cdsCCanje.fieldbyname('CUENTAID').AsString;
	 xPresup   := DMCXP.cdsDetCxP.fieldbyname('PARPRESID').AsString;
	 xConcepto := DMCXP.cdsCCanje.fieldbyname('CPTOID').AsString;

	 //while (not DMCXP.cdsDetCxP.Eof) and (DMCXP.cdsDetCxP.RecordCount>0) do begin
   xSQL:=' DELETE FROM CXP302 '+
            ' WHERE CIAID='+Quotedstr(xxCia)+
            ' AND TDIARID='+Quotedstr(xxDiar)+
            ' AND DCPANOMM='+Quotedstr(xxPer)+
            ' AND CPNOREG=''' +'0000'+xxNoReg+'''';
   try
     DMCXP.DCOM1.AppServer.IniciaTransaccion;
     DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
     DMCXP.DCOM1.AppServer.GrabaTransaccion;
   except
     DMCXP.DCOM1.AppServer.RetornaTransaccion;
   end;

	 //end;

	 xFiltro:=' CIAID='+Quotedstr(xxCia)+
						' AND TDIARID='+Quotedstr(xxDiar)+
						' AND DCPANOMM='+Quotedstr(xxPer)+
						' AND CPNOREG=''' +'0000'+xxNoReg+'''';
	 Filtracds( DMCXP.cdsDetCxP,'Select * from CXP302 Where '+xFiltro );

	 DMCXP.cdsDetCxP.First;
	 DMCXP.cdsLetras.DisableControls;
	 numreg:=0;
	 GrabaContabilidadDocumentos;//ok
   //CIM 21/06/2002
   //Genera Cuenta puente de Retencion
   if DMCXP.cdsCCanje.FieldByName('MTORETIGV').AsFloat>0 then
      GrabaContabilidadRetencion;
   //*


	 DMCXP.cdsLetras.First;
	 While not DMCXP.cdsLetras.Eof do
	 begin
			GrabaContabilidadLetra;//ok
			DMCXP.cdsLetras.Next;
	 end;
	 DMCXP.cdsLetras.EnableControls;

   //////////////////////////////////////////////////////////////////////
   // CIM 09/09/2002
   // Aqui se debe Generar la diferencia de Cambio Final del Canje
   // se debe considerar los documentos a canjear la cuenta puente de retención y las letras
   //////////////////////////////////////////////////////////////////////
	 xFiltro:=' CIAID='+Quotedstr(xxCia)+
						' AND TDIARID='+Quotedstr(xxDiar)+
						' AND DCPANOMM='+Quotedstr(xxPer)+
						' AND CPNOREG=''' +'0000'+xxNoReg+'''';
	 Filtracds( DMCXP.cdsDetCxP,'Select * from CXP302 Where '+xFiltro );
   ///////////////////////////////////////////
   xTDebe := 0;
   xTHaber := 0;

   xDifCam  := 0;
   xDifCLoc := 0;
   xDifCExt := 0;

   xWhere:='CIAID='''+xxCia+''' and CTA_DIFC=''P'' ';
	 DMCXP.wDifAjuP:=DMCXP.DisplayDescrip2('dspTGE','TGE202','CUENTAID', xWhere, 'CUENTAID');
   xWhere:='CIAID='''+xxCia+''' and CTA_DIFC=''G'' ';
	 DMCXP.wDifAjuG:=DMCXP.DisplayDescrip2('dspTGE','TGE202','CUENTAID', xWhere, 'CUENTAID');

   DMCXP.cdsLetras.First;
   DMCXP.cdsDetCxP.First;
   while not DMCXP.cdsDetCxP.EOF do
   begin
      if DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString='D' then
         xTDebe := xTDebe+FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat,15,2)
      else
         xTHaber := xTHaber+FRound(DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat,15,2);
      DMCXP.cdsDetCxP.Next;
   end;

   if abs(xTDebe-xTHaber)>0 then
   begin
      xDifFinal := FRound(xTDebe-xTHaber,15,2);
      if xDifFinal>0 then
      begin
         // Ganancia por diferencia de Cambio
         if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
         begin
            xDifCam  := FRound(xDifFinal,15,2);
            xDifCLoc := FRound(xDifFinal,15,2);
         end
         else
         begin
            xDifCam  := FRound(xDifFinal,15,2);
            xDifCExt := FRound(xDifFinal,15,2);
         end;
         ///////////////
         xCtaDif  := DMCXP.wDifAjuG;
         xGloDif  := 'Ganancia - Ajuste por Dif. de Cambio';
         xDH      := 'H';

         NUMREG:=NUMREG+1;
         xSQL := ' INSERT INTO CXP302 (CIAID,TCANJEID,CANJE,TDIARID,CPNOREG,DCPANOC,DCPANOMM,DCPLOTE,TRANSID,CUENTAID,'+
                 ' CLAUXID,DCPAUXID,DOCID,CPSERIE,CPNODOC,DCPGLOSA,DCPDH,CPTCAMPR,DCPMOORI,DCPMOLOC,DCPMOEXT,CPFEMIS,CPFVCMTO,'+
                 ' DCPFCOM,DCPESTDO,TMONID,DCPMM,DCPDD,DCPTRI,DCPSEM,DCPSS,DCPAATRI,DCPAASEM,DCPAASS,DCPREG,DCPUSER,DCPFREG,DCPHREG)'+
                 ' VALUES('+
         Quotedstr(DMCXP.cdsLetras.FieldByName('CIAID').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('TCANJEID').AsString)
         +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPCANJE').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('TDIARID').AsString)
         +','+Quotedstr('0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString)+','+Quotedstr(Copy(DMCXP.cdsLetras.FieldByName('CPANOMES').AsString,1,4))
         +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPANOMES').AsString)+','+Quotedstr(xLote)+','+Quotedstr('CP')
         +','+Quotedstr(xCtaDif)+','+Quotedstr(DMCXP.cdsCCanje.fieldbyname('CLAUXID').AsString)
         +','+Quotedstr(DMCXP.cdsCCanje.FieldByName('PROV').AsString)+','+Quotedstr(DMCXP.cdsCCanje.FieldByName('DOCID').AsString)
         +','+Quotedstr('00000')+','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CANJE').AsString)
         +','+Quotedstr(xGloDif)+','+Quotedstr(xDH)
         +','+''+Floattostr(DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsFloat)+'';

         if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
            xSQL:= xSQL +','+''+Floattostr(xDifCam)+''+','+''+Floattostr(xDifCam)+''+','+''+Floattostr(0)+''
         else
            xSQL:= xSQL +','+''+Floattostr(xDifCam)+''+','+''+Floattostr(0)+''+','+''+Floattostr(xDifCam)+'';

         xSQL := xSQL +','+Quotedstr(Datetostr(DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime))+','+Quotedstr(Datetostr(DMCXP.cdsLetras.FieldByName('CPFVCMTO').AsDateTime))
         +','+Quotedstr(Datetostr(DMCXP.cdsCCanje.fieldbyname('CJFCOMP').AsDateTime))+','+Quotedstr('P')+','+Quotedstr(DMCXP.wTMonLoc)
         +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPMM').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPDD').AsString)
         +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPTRI').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPSEM').AsString)
         +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPSS').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPAATRI').AsString)
         +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPAASEM').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPAASS').AsString)
         +','+''+InttoStr(NUMREG)+''+','+Quotedstr(DMCXP.wUsuario)+','+DMCXP.wRepFecServi+','+DMCXP.wRepHorServi+')';
         try
           DMCXP.DCOM1.AppServer.IniciaTransaccion;
           DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
           DMCXP.DCOM1.AppServer.GrabaTransaccion;
         except
           DMCXP.DCOM1.AppServer.RetornaTransaccion;
         end;

      end
      else
      begin
      // Pérdida por Diferencia de Cambio
         if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
         begin
            xDifCam  := FRound(xDifFinal,15,2);
            xDifCLoc := FRound( (-1)*(xDifFinal),15,2);
         end
         else
         begin
            xDifCam  := FRound(xDifFinal ,15,2);
            xDifCExt := FRound( (-1)*(xDifFinal),15,2);
         end;
				 xCtaDif  := DMCXP.wDifAjuP;
				 xGloDif  := 'Perdida - Ajuste por Dif. de Cambio';
				 xDH      := 'D';

         NUMREG:=NUMREG+1;
         xSQL := ' INSERT INTO CXP302 (CIAID,TCANJEID,CANJE,TDIARID,CPNOREG,DCPANOC,DCPANOMM,DCPLOTE,TRANSID,CUENTAID,'+
                 ' CLAUXID,DCPAUXID,DOCID,CPSERIE,CPNODOC,DCPGLOSA,DCPDH,CPTCAMPR,DCPMOORI,DCPMOLOC,DCPMOEXT,CPFEMIS,CPFVCMTO,'+
                 ' DCPFCOM,DCPESTDO,TMONID,DCPMM,DCPDD,DCPTRI,DCPSEM,DCPSS,DCPAATRI,DCPAASEM,DCPAASS,DCPREG,DCPUSER,DCPFREG,DCPHREG)'+
                 ' VALUES('+
         Quotedstr(DMCXP.cdsLetras.FieldByName('CIAID').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('TCANJEID').AsString)
         +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPCANJE').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('TDIARID').AsString)
         +','+Quotedstr('0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString)+','+Quotedstr(Copy(DMCXP.cdsLetras.FieldByName('CPANOMES').AsString,1,4))
         +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPANOMES').AsString)+','+Quotedstr(xLote)+','+Quotedstr('CP')
         +','+Quotedstr(xCtaDif)+','+Quotedstr(DMCXP.cdsCCanje.fieldbyname('CLAUXID').AsString)
         +','+Quotedstr(DMCXP.cdsCCanje.FieldByName('PROV').AsString)+','+Quotedstr(DMCXP.cdsCCanje.FieldByName('DOCID').AsString)
         +','+Quotedstr('00000')+','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CANJE').AsString)
         +','+Quotedstr(xGloDif)+','+Quotedstr(xDH)
         +','+''+Floattostr(DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsFloat)+'';

         if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
            xSQL:= xSQL +','+''+Floattostr(xDifCLoc)+''+','+''+Floattostr(xDifCLoc)+''+','+''+Floattostr(0)+''
         else
            xSQL:= xSQL +','+''+Floattostr(xDifCExt)+''+','+''+Floattostr(0)+''+','+''+Floattostr(xDifCExt)+'';


         xSQL := xSQL +','+Quotedstr(Datetostr(DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime))+','+Quotedstr(Datetostr(DMCXP.cdsLetras.FieldByName('CPFVCMTO').AsDateTime))
         +','+Quotedstr(Datetostr(DMCXP.cdsCCanje.fieldbyname('CJFCOMP').AsDateTime))+','+Quotedstr('P')+','+Quotedstr(DMCXP.wTMonLoc)
         +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPMM').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPDD').AsString)
         +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPTRI').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPSEM').AsString)
         +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPSS').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPAATRI').AsString)
         +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPAASEM').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPAASS').AsString)
         +','+''+InttoStr(NUMREG)+''+','+Quotedstr(DMCXP.wUsuario)+','+DMCXP.wRepFecServi+','+DMCXP.wRepHorServi+')';
         try
           DMCXP.DCOM1.AppServer.IniciaTransaccion;
           DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
           DMCXP.DCOM1.AppServer.GrabaTransaccion;
         except
           DMCXP.DCOM1.AppServer.RetornaTransaccion;
         end;
      end;
   end;


   //////////////////////////////////////////////////////////////////////

	 DMCXP.cdsCanje.EnableControls;
	 DMCXP.cdsDetCxP.First;
	 DMCXP.cdsDetCxP.EnableControls;

	 DMCXP.cdsCanje.IndexFieldNames    :='CIAID;TCANJEID;CCPCANJE;TDIARID;CCPANOMM;CPNOREG';
end;

procedure TToolLetras.GrabaContabilidadLetra;
var
  xSQL : string;
begin
	 //DMCXP.cdsDetCxP.Insert;
	 NUMREG:=NUMREG+1;
   xSQL := ' INSERT INTO CXP302 (CIAID,TCANJEID,CANJE,TDIARID,CPNOREG,DCPANOC,DCPANOMM,DCPLOTE,TRANSID,CPTOID,CUENTAID,'+
           ' PARPRESID,CLAUXID,DCPAUXID,DOCID,CPSERIE,CPNODOC,DCPGLOSA,DCPDH,CPTCAMPR,DCPMOORI,DCPMOLOC,DCPMOEXT,CPFEMIS,CPFVCMTO,'+
           ' DCPFCOM,DCPESTDO,TMONID,DCPMM,DCPDD,DCPTRI,DCPSEM,DCPSS,DCPAATRI,DCPAASEM,DCPAASS,DCPREG,DCPUSER,DCPFREG,DCPHREG)'+
           ' VALUES('+
	 Quotedstr(DMCXP.cdsLetras.FieldByName('CIAID').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('TCANJEID').AsString)
	 +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPCANJE').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('TDIARID').AsString)
	 +','+Quotedstr('0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString)+','+Quotedstr(Copy(DMCXP.cdsLetras.FieldByName('CPANOMES').AsString,1,4))
	 +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPANOMES').AsString)+','+Quotedstr(xLote)+','+Quotedstr('CP')+','+Quotedstr(xConcepto)
	 +','+Quotedstr(xCuenta)+','+Quotedstr(xPresup)+','+Quotedstr(DMCXP.cdsCCanje.fieldbyname('CLAUXID').AsString)
   +','+Quotedstr(DMCXP.cdsLetras.FieldByName('PROV').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('DOCID').AsString)
	 +','+Quotedstr('00000')+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPNODOC').AsString)
   +','+Quotedstr('Letra # '+DMCXP.cdsLetras.FieldByName('CPNODOC').AsString)+','+Quotedstr('H')
   +','+''+Floattostr(DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat)+''+','+''+Floattostr(DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat)+''
	 +','+''+Floattostr(DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat)+''+','+''+Floattostr(DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat)+''
 +','+Quotedstr(Datetostr(DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime))+','+Quotedstr(Datetostr(DMCXP.cdsLetras.FieldByName('CPFVCMTO').AsDateTime))
	 +','+Quotedstr(Datetostr(DMCXP.cdsCCanje.fieldbyname('CJFCOMP').AsDateTime))+','+Quotedstr('P')+','+Quotedstr(DMCXP.cdsLetras.FieldByName('TMONID').AsString)
	 +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPMM').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPDD').AsString)
	 +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPTRI').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPSEM').AsString)
	 +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPSS').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPAATRI').AsString)
	 +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPAASEM').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPAASS').AsString)
	 +','+''+InttoStr(NUMREG)+''+','+Quotedstr(DMCXP.wUsuario)+','+DMCXP.wRepFecServi+','+DMCXP.wRepHorServi+')';
   try
     DMCXP.DCOM1.AppServer.IniciaTransaccion;
     DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
     DMCXP.DCOM1.AppServer.GrabaTransaccion;
   except
     DMCXP.DCOM1.AppServer.RetornaTransaccion;
   end;

end;
procedure TToolLetras.GrabaContabilidadDocumentos;
var
	 xfiltro,xSQL,xDcpdh : string;
   xMtoOri,xMtoLoc,xMtoExt : double;
begin

	 DMCXP.cdsCanje.First;
	 while not DMCXP.cdsCanje.Eof do
   begin
      xDifCLoc:=0;
      xDifCExt:=0;
      xMtoOri:=0;
      xMtoLoc:=0;
      xMtoExt:=0;
      xDcpdh :='';
			if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
				 GeneraDiferenciaCambio;

      xSQL := ' INSERT INTO CXP302(CIAID,TCANJEID,CANJE,TDIARID,CPNOREG,DCPANOMM,DCPANOC,DCPLOTE,TRANSID,'+
              ' CUENTAID,CPTOID,CLAUXID,DCPAUXID,DOCID,CPSERIE,CPNODOC,DCPGLOSA,DCPMOORI,DCPMOLOC,DCPMOEXT,'+
              ' DCPDH,CPTCAMPR,TMONID,CPFEMIS,CPFVCMTO,DCPFCOM,DCPESTDO,DCPMM,DCPDD,DCPTRI,DCPSEM,'+
              ' DCPSS,DCPAATRI,DCPAASEM,DCPAASS,DCPREG,DCPUSER,DCPFREG,DCPHREG)'+
              ' VALUES('+
		           Quotedstr(DMCXP.cdsCCanje.fieldbyname('CIAID').AsString)+','+Quotedstr(DMCXP.cdsCCanje.fieldbyname('TCANJEID').AsString)
        		   +','+Quotedstr(DMCXP.cdsCCanje.fieldbyname('CANJE').AsString)+','+Quotedstr(DMCXP.cdsCCanje.FieldByName('TDIARID').AsString)
		           +','+Quotedstr('0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString)+','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CJAAMM').AsString)
		           +','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CJAA').AsString)+','+Quotedstr(xLote)+','+Quotedstr('CP')
               +','+Quotedstr(DMCXP.cdsCanje.FieldByName('CTATOTAL').AsString)+','+Quotedstr(DMCXP.cdsCanje.FieldByName('CPTOTOT').AsString)
		           +','+Quotedstr(DMCXP.cdsCCanje.fieldbyname('CLAUXID').AsString)+','+Quotedstr(DMCXP.cdsCanje.FieldByName('PROV').AsString)
     		       +','+Quotedstr(DMCXP.cdsCanje.FieldByName('DOCID').AsString)+','+Quotedstr(DMCXP.cdsCanje.FieldByName('CPSERIE').AsString)
       		     +','+Quotedstr(DMCXP.cdsCanje.FieldByName('CPNODOC').AsString)+','+Quotedstr(DMCXP.cdsCCanje.fieldbyname('CJGLOSA').AsString);
////////////////////
			if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
					xMtoOri := DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat
			else begin
					xMtoOri := DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat;
			end;
			xMtoLoc  := FRound(DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat + xDifCLoc,15,2);
			xMtoExt  := FRound(DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat + xDifCExt,15,2);

			xFiltro:='Select * from TGE110 where DOCMOD=''CXP'' AND DOCID='''+DMCXP.cdsCanje.FieldByName('DOCID').AsString+'''';
			DMCXP.cdsQry.Close;
			DMCXP.cdsQry.DataRequest( xFiltro );
			DMCXP.cdsQry.Open;

			if DMCXP.cdsQry.FieldByName('DOCRESTA').AsString='S' then begin
				 xDcpdh  := 'H';
				 xMtoOri := xMtoOri*-1;
				 xMtoLoc := xMtoLoc*-1;
				 xMtoExt := xMtoExt*-1;
			end
			else begin
				 xDcpdh  := 'D';
			end;

////////////////////
	    xSQL := xSQL+','+''+Floattostr(xMtoOri)+''
			      	        +','+''+Floattostr(xMtoLoc)+''+','+''+Floattostr(xMtoExt)
              			  +','+Quotedstr(xDcpdh);


{			xFiltro:='Select * from TGE110 where DOCMOD=''CXP'' AND DOCID='''+DMCXP.cdsCanje.FieldByName('DOCID').AsString+'''';
		  DMCXP.cdsQry.Close;
			DMCXP.cdsQry.DataRequest( xFiltro );
			DMCXP.cdsQry.Open;

			if DMCXP.cdsQry.FieldByName('DOCRESTA').AsString='S' then
      begin
				 xSQL := xSQL+','+''+Floattostr(DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat*-1)+''
				 +','+''+Floattostr(DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat*-1)+''+','+''+Floattostr(DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat*-1)
				 +','+Quotedstr('H');
			end
			else
      begin
         if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
             xSQL:= xSQL+','+''+Floattostr(DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat)
         else begin
             xSQL:= xSQL+','+''+Floattostr(DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat);
         end;
         xSQL:= xSQL+','+''+Floattostr(FRound(DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat + xDifCLoc,15,2))
         +','+''+Floattostr(FRound(DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat + xDifCExt,15,2))
				 +','+Quotedstr('D');
			end;}

//			DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := TRIM(DMCXP.cdsQry.FieldByname('DOCDES').AsString)+' '+DMCXP.cdsCanje.FieldByName('CPSERIE').AsString+' '+DMCXP.cdsCanje.FieldByName('CPNODOC').AsString;
      NUMREG:=NUMREG+1;
			xSQL:= xSQL+','+''+Floattostr(DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat)+','+Quotedstr(DMCXP.cdsCanje.FieldByName('TMONID').AsString)
			           +','+Quotedstr(Datetostr(DMCXP.cdsCanje.FieldByName('CPFEMIS').AsDateTime))+','+Quotedstr(Datetostr(DMCXP.cdsCanje.FieldByName('CPFVCMTO').AsDateTime))
			           +','+Quotedstr(Datetostr(DMCXP.cdsCCanje.fieldbyname('CJFCOMP').AsDateTime))+','+Quotedstr('P')
                 +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPMM').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPDD').AsString)
                 +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPTRI').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPSEM').AsString)
		             +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPSS').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPAATRI').AsString)
		             +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPAASEM').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPAASS').AsString)
                 +','+''+Inttostr(NUMREG)+''+','+Quotedstr(DMCXP.wUsuario)+','+DMCXP.wRepFecServi+','+DMCXP.wRepHorServi+')';
      try
        DMCXP.DCOM1.AppServer.IniciaTransaccion;
        DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
        DMCXP.DCOM1.AppServer.GrabaTransaccion;
      except
        DMCXP.DCOM1.AppServer.RetornaTransaccion;
      end;

			if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
				 GrabaDiferenciaCambio;

			DMCXP.cdsCanje.Next;
	 end;
end;
procedure TToolLetras.DetCxPUsuario;
begin
   DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
   DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime:= Date;
   DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime:= time;
end;
procedure TToolLetras.GrabaDiferenciaCambio;
var
   xSQL : string;
begin
	 If xDifCam > 0 Then begin
			NUMREG:=NUMREG+1;
      xSQL:= ' INSERT INTO CXP302 (CIAID,TCANJEID,CANJE,TDIARID,CPNOREG,DCPANOMM,DCPANOC, '+
             ' DCPLOTE,TRANSID,CUENTAID,CLAUXID,DCPAUXID,DOCID,CPSERIE,CPNODOC,DCPGLOSA,DCPDH, '+
             ' CPTCAMPR,CPTCAMPA,DCPMOORI,DCPMOLOC,DCPMOEXT,CPFEMIS,CPFVCMTO,DCPFCOM,DCPESTDO,  '+
             ' TMONID,DCPMM,DCPDD,DCPTRI,DCPSEM,DCPSS,DCPAATRI,DCPAASEM,DCPAASS,DCPREG,DCPUSER, '+
             ' DCPFREG,DCPHREG) VALUES ('+
		  Quotedstr(DMCXP.cdsCanje.FieldByName('CIAID').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('TCANJEID').AsString)
		  +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPCANJE').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('TDIARID').AsString)
		  +','+Quotedstr('0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPANOMES').AsString)
		  +','+Quotedstr(Copy(DMCXP.cdsLetras.FieldByName('CPANOMES').AsString,1,4))+','+Quotedstr(xLote)+','+Quotedstr('CP')+','+Quotedstr(xCtaDif)
		  +','+Quotedstr(DMCXP.cdsCCanje.fieldbyname('CLAUXID').AsString)+','+Quotedstr(DMCXP.cdsCanje.FieldByName('PROV').AsString)
		  +','+Quotedstr(DMCXP.cdsCanje.FieldByName('DOCID').AsString)+','+Quotedstr(DMCXP.cdsCanje.FieldByName('CPSERIE').AsString)
		  +','+Quotedstr(DMCXP.cdsCanje.FieldByName('CPNODOC').AsString)+','+Quotedstr(xGloDif)+','+Quotedstr(xDH)
      +','+''+Floattostr(DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat)+''+','+''+Floattostr(DMCXP.cdsCanje.FieldByName('CCPTCCJE').AsFloat)+'';
			if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then
				 xSQL:= xSQL+','+''+Floattostr(FRound(xDifCam,15,2))+''+','+''+Floattostr(FRound(xDifCam,15,2))+''+','+''+Floattostr(0)+''
			else
				 xSQL:= xSQL+','+''+Floattostr(FRound(xDifCam,15,2))+''+','+''+Floattostr(0)+''+','+''+Floattostr(FRound(xDifCam,15,2))+'';
			//
		  xSQL:= xSQL+','+Quotedstr(Datetostr(DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime))+','+Quotedstr(Datetostr(DMCXP.cdsCanje.FieldByName('CPFVCMTO').AsDateTime))
		  +','+Quotedstr(Datetostr(DMCXP.cdsCCanje.fieldbyname('CJFCOMP').AsDateTime))+','+Quotedstr('P')+','+Quotedstr(DMCXP.wTMonLoc)
		  +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPMM').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPDD').AsString)
  		+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPTRI').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPSEM').AsString)
		  +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPSS').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPAATRI').AsString)
		  +','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPAASEM').AsString)+','+Quotedstr(DMCXP.cdsLetras.FieldByName('CPAASS').AsString)
      +','+''+Inttostr(NUMREG)+''+','+Quotedstr(DMCXP.wUsuario)+','+DMCXP.wRepFecServi+','+DMCXP.wRepHorServi+')';
      try
        DMCXP.DCOM1.AppServer.IniciaTransaccion;
        DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
        DMCXP.DCOM1.AppServer.GrabaTransaccion;
      except
        DMCXP.DCOM1.AppServer.RetornaTransaccion;
      end;

	 end;
end;
procedure TToolLetras.GeneraDiferenciaCambio;
var
   xWhere : String;
begin
	 xDifCLoc:=0;
	 xDifCExt:=0;

   xWhere:='CIAID='''+DMCXP.cdsCCanje.fieldbyname('CIAID').AsString+''' and CTA_DIFC=''P'' ';
	 DMCXP.wDifAjuP:=DMCXP.DisplayDescrip2('dspTGE','TGE202','CUENTAID', xWhere, 'CUENTAID');
   xWhere:='CIAID='''+DMCXP.cdsCCanje.fieldbyname('CIAID').AsString+''' and CTA_DIFC=''G'' ';
	 DMCXP.wDifAjuG:=DMCXP.DisplayDescrip2('dspTGE','TGE202','CUENTAID', xWhere, 'CUENTAID');

	 if DMCXP.cdsCanje.FieldByName('TMONID').AsString = DMCXP.wTMonExt then begin
			xPagAnt := FRound( DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat*DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat,15,2);
			If DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat > xPagAnt then begin
				 xDifCam  := FRound( DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat - xPagAnt,15,2);
				 xDifCLoc := FRound( (-1)*(DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat - xPagAnt),15,2);
{				 xCtaDif  := DMCXP.wDifAjuP;
				 xGloDif  := 'Perdida - Ajuste por Dif. de Cambio';
				 xDH      := 'D'}
				 xCtaDif  := DMCXP.wDifAjuG;
				 xGloDif  := 'Ganancia - Ajuste por Dif. de Cambio';
				 xDH      := 'H'
				 end
			else begin
				 xDifCam  := FRound(xPagAnt - DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
				 xDifCLoc := FRound(xPagAnt - DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat,15,2);
{				 xCtaDif  := DMCXP.wDifAjuG;
				 xGloDif  := 'Ganancia - Ajuste por Dif. de Cambio';
				 xDH      := 'H'}
				 xCtaDif  := DMCXP.wDifAjuP;
				 xGloDif  := 'Perdida - Ajuste por Dif. de Cambio';
				 xDH      := 'D'
			end;
			end
	 else begin
			xPagAnt := FRound( DMCXP.cdsCanje.FieldByName('CCPMOLOC').AsFloat/DMCXP.cdsCanje.FieldByName('CCPTCDOC').AsFloat,15,2);
			If DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat > xPagAnt then begin
				 xDifCam  := FRound( DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat - xPagAnt,15,2);
				 xDifCExt := FRound( (-1)*(DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat - xPagAnt),15,2);
{				 xCtaDif  := DMCXP.wDifAjuP;
				 xGloDif  := 'Perdida - Ajuste por Dif. de Cambio';
				 xDH      := 'D'}
				 xCtaDif  := DMCXP.wDifAjuG;
				 xGloDif  := 'Ganancia - Ajuste por Dif. de Cambio';
				 xDH      := 'H'
				 end
			else begin
				 xDifCam  := xPagAnt - DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
				 xDifCExt := xPagAnt - DMCXP.cdsCanje.FieldByName('CCPMOEXT').AsFloat;
{				 xCtaDif  := DMCXP.wDifAjuG;
				 xGloDif  := 'Ganancia - Ajuste por Dif. de Cambio';
				 xDH      := 'H'}
				 xCtaDif  := DMCXP.wDifAjuP;
				 xGloDif  := 'Perdida - Ajuste por Dif. de Cambio';
				 xDH      := 'D'

			end;
	 end;
end;
procedure TToolLetras.CreandoPanel;
begin
   xPanel := TPanel.create(nil);
   xPanel.parent := Screen.ActiveForm;
   xPanel.Height := 100;
   xPanel.width := 300;
   xPanel.Left := (Screen.Width div 2) - (xPanel.width div 2);
   xPanel.top := (Screen.Height div 2) - (xPanel.Height div 2);
   xPanel.BevelInner := bvRaised;
   xPanel.BevelOuter := bvRaised;
   xPanel.BevelWidth := 3;
   FPrincipal.GLetras.FMant.Refresh;
   xLabel1 := TLabel.create(nil);
   xlabel1.parent := xPanel;
   xLabel1.Left := 5;
   xLabel1.top := 10;
   xLabel1.Font.Name  := 'Comic Sans MS';
   xLabel1.Font.Style := [fsBold,fsItalic];
   xLabel1.Font.Size  := 10;
   xLabel2 := TLabel.create(nil);
   xlabel2.parent := xPanel;
   xLabel2.Left := 5;
   xLabel2.top := xLabel1.top + xLabel2.height;
   xLabel2.Font.Name  := 'Comic Sans MS';
   xLabel2.Font.Style := [fsBold,fsItalic];
   xLabel2.Font.Size  := 10;
   xLabel3 := TLabel.create(nil);
   xlabel3.parent := xPanel;
   xLabel3.Left := 5;
   xLabel3.top := xLabel2.top+ xLabel3.height;
   xLabel3.Font.Name  := 'Comic Sans MS';
   xLabel3.Font.Style := [fsBold,fsItalic];
   xLabel3.Font.Size  := 10;
   xPanel.refresh;
end;
//CIM 27/06/2002
procedure TToolLetras.GrabaContabilidadRetencion;
var
	 xSQL,xWhere : string;
begin
			NUMREG:=NUMREG+1;

      xSQL := ' INSERT INTO CXP302(CIAID,TCANJEID,CANJE,TDIARID,CPNOREG,DCPANOMM,DCPANOC,DCPLOTE,TRANSID,'+
              ' CUENTAID,CPTOID,DCPGLOSA,CLAUXID,DCPAUXID,DOCID,CPSERIE,CPNODOC,DCPMOORI,DCPMOLOC,DCPMOEXT,'+
              ' DCPDH,CPTCAMPR,TMONID,CPFEMIS,CPFVCMTO,DCPFCOM,DCPESTDO,DCPMM,DCPDD,DCPTRI,DCPSEM,'+
              ' DCPSS,DCPAATRI,DCPAASEM,DCPAASS,DCPREG,DCPUSER,DCPFREG,DCPHREG)'+
              ' VALUES('+
		          Quotedstr(DMCXP.cdsCCanje.fieldbyname('CIAID').AsString)+','+Quotedstr(DMCXP.cdsCCanje.fieldbyname('TCANJEID').AsString)+
			        ','+Quotedstr(DMCXP.cdsCCanje.fieldbyname('CANJE').AsString)+','+Quotedstr(DMCXP.cdsCCanje.FieldByName('TDIARID').AsString)+
          		','+Quotedstr('0000'+DMCXP.cdsCCanje.FieldByName('CANJE').AsString)+','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CJAAMM').AsString)+
			        ','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CJAA').AsString)+','+Quotedstr(xLote)+
			        ','+Quotedstr('CP');

              xWhere:='CPTOIS='+Quotedstr('R');
              BuscaQry('dspTGE','CAJA201','CPTOID,CPTODES,CUENTAID',xWhere,'CUENTAID');

			xSQL := xSQL+','+Quotedstr(DMCXP.cdsQry.FieldByName('CUENTAID').AsString)+','+Quotedstr(DMCXP.cdsQry.FieldByName('CPTOID').AsString)+
			             ','+Quotedstr(DMCXP.cdsQry.FieldByName('CPTODES').AsString)+','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CLAUXID').AsString)+
			             ','+Quotedstr(DMCXP.cdsCCanje.FieldByName('PROV').AsString)+','+Quotedstr('')+','+Quotedstr('000')+','+Quotedstr('S/N')+
  		             ','+''+Floattostr(DMCXP.cdsCCanje.FieldByName('MTORETIGV').AsFloat)+'';
			if DMCXP.cdsCCanje.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
      begin
         xSQL:= xSQL+','+''+Floattostr(DMCXP.cdsCCanje.FieldByName('MTORETIGV').AsFloat)+''+
                     ','+''+Floattostr(FRound(DMCXP.cdsCCanje.FieldByName('MTORETIGV').AsFloat/DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsFloat ,15,2))+'';
      end
			else
      begin
         xSQL:= xSQL+','+''+Floattostr(FRound(DMCXP.cdsCCanje.FieldByName('MTORETIGV').AsFloat*DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsFloat ,15,2))+
                     ','+''+Floattostr(DMCXP.cdsCCanje.FieldByName('MTORETIGV').AsFloat)+'';
      end;

 		  xSQL:= xSQL+','+Quotedstr('H')+','+''+Floattostr(DMCXP.cdsCCanje.FieldByName('CJTCAMBIO').AsFloat)+','+Quotedstr(DMCXP.cdsCCanje.FieldByName('TMONID').AsString)+
			            ','+Quotedstr(Datetostr(DMCXP.cdsCCanje.FieldByName('CJFCANJE').AsDateTime))+','+Quotedstr(Datetostr(DMCXP.cdsCCanje.FieldByName('CJFCANJE').AsDateTime))+
			            ','+Quotedstr(Datetostr(DMCXP.cdsCCanje.FieldByName('CJFCANJE').AsDateTime))+','+Quotedstr('P')+','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CJMM').AsString)+
			            ','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CJDD').AsString)+','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CJTRI').AsString)+
                  ','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CJSEM').AsString)+','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CJSS').AsString)+
                  ','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CJAATRI').AsString)+','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CJAASEM').AsString)+
                  //CIM 23/07/2002
//                  ','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CJAASS').AsString)+','+
                  ','+Quotedstr(DMCXP.cdsCCanje.FieldByName('CJAASS').AsString)+
                  ','+''+Inttostr(NUMREG)+''+','+Quotedstr(DMCXP.wUsuario)+','+DMCXP.wRepFecServi+','+DMCXP.wRepHorServi+')';
                  
      try
        DMCXP.DCOM1.AppServer.IniciaTransaccion;
        DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
        DMCXP.DCOM1.AppServer.GrabaTransaccion;
      except
        DMCXP.DCOM1.AppServer.RetornaTransaccion;
      end;
end;












procedure TToolLetras.bbtnActLetraClick(Sender: TObject);
begin
  FActLetra := TFActLetra.Create(Self);
  Try
    FActLetra.ShowModal;
  Except
    FActLetra.Free;  
  end;

end;

procedure TToolLetras.Timer2Timer(Sender: TObject);
begin
   FVariables.w_NombreForma := 'ToolLetras';
   if (DMCXP.wAdmin='G') or (DMCXP.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMCXP.AccesosUsuariosR( DMCXP.wModulo,DMCXP.wUsuario,'2',ToolLetras);
      xAccesoBotones := True;
   end;

end;

end.
