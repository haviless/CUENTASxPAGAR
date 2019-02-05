unit CxP206;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, wwdblook, ExtCtrls, Mask, wwdbedit, 
  wwdbdatetimepicker, Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid, DB, wwclient,
  ComCtrls, oaVariables;

type
  TFPagares = class(TForm)
    pnlDetalle: TPanel;
    pnlPie: TPanel;
    bbtnCalc: TBitBtn;
    bbtnSumat: TBitBtn;
    Z2bbtnGraba: TBitBtn;
    Z2bbtnContab: TBitBtn;
    bbtnCancela: TBitBtn;
    Z2bbtnNuevo: TBitBtn;
    bbtnRegresa: TBitBtn;
    Z2bbtnAnula: TBitBtn;
    Z2bbtnAcepta: TBitBtn;
    Label24: TLabel;
    pnlCabecera: TPanel;
    pnlCab1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblcCia: TwwDBLookupCombo;
    dblcTDoc: TwwDBLookupCombo;
    edtCia: TEdit;
    edtTDoc: TEdit;
    pnlCab2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    dblcBanco: TwwDBLookupCombo;
    dblcCCBco: TwwDBLookupCombo;
    dblcdProvRuc: TwwDBLookupComboDlg;
    dbdtpFEmis: TwwDBDateTimePicker;
    dbdtpFVcmto: TwwDBDateTimePicker;
    dbeCuotas: TwwDBEdit;
    dblcTMon: TwwDBLookupCombo;
    edtProv: TEdit;
    edtBanco: TEdit;
    edtTDiario: TEdit;
    edtTMon: TEdit;
    dbeImporte: TwwDBEdit;
    pnlDetalle2: TPanel;
    Label20: TLabel;
    dbgDetalle: TwwDBGrid;
    pnlEstado: TPanel;
    lblAnula: TLabel;
    lblActivo: TLabel;
    lblContab: TLabel;
    lblAcepta: TLabel;
    Label23: TLabel;
    pnlCab3: TPanel;
    dblcdCnpEgr: TwwDBLookupComboDlg;
    Label16: TLabel;
    Cuenta: TLabel;
    dbeCuenta: TwwDBEdit;
    Glosa: TLabel;
    dbeGlosa: TwwDBEdit;
    bbtnOk: TBitBtn;
    bbtnBorra: TBitBtn;
    dbeNoDoc: TwwDBEdit;
    Z2bbtnPreview: TBitBtn;
    Label27: TLabel;
    dblcBancoDest: TwwDBLookupCombo;
    edtBancoDes: TEdit;
    Label28: TLabel;
    dbeInteres: TwwDBEdit;
    Label19: TLabel;
    dbeCCBCOOri: TwwDBEdit;
    dblcTDiario: TwwDBLookupCombo;
    bbtnTransferir: TBitBtn;
    pnlRegistro: TPanel;
    Label25: TLabel;
    dblcClAux: TwwDBLookupCombo;
    Label4: TLabel;
    dblcdProv: TwwDBLookupComboDlg;
    Label12: TLabel;
    dbeTCambio: TwwDBEdit;
    Label13: TLabel;
    dbdtpFRecep: TwwDBDateTimePicker;
    Label14: TLabel;
    dbdtpFComp: TwwDBDateTimePicker;
    Label15: TLabel;
    dbeLote: TwwDBEdit;
    GroupBox1: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    dblcCptoDeb: TwwDBLookupComboDlg;
    dblcCptoHab: TwwDBLookupComboDlg;
    Label26: TLabel;
    dblcdPresup: TwwDBLookupComboDlg;
    rgTipo: TRadioGroup;
    Label21: TLabel;
    Label31: TLabel;
    dbdtpFVDet: TwwDBDateTimePicker;
    dbgCuotas: TwwDBGrid;
    dbgbbtOk: TwwIButton;
    lblEstado: TLabel;
    pnlFoot: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    dbgDetalleIButton: TwwIButton;
    dbeSerie: TwwDBEdit;
    dbeNDoc: TwwDBEdit;
    bbtnNuevo: TBitBtn;
    dbeDetMonto: TwwDBEdit;
    Label32: TLabel;
    procedure BuscaPagare;
    procedure dblcTMonExit(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dblcdCnpEgrExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure InicializaClientDataSet;
    procedure InicializaDatos;
    procedure InicializaPaneles;
    procedure dbgDetalleColExit(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure bbtnCalcClick(Sender: TObject);
    procedure Z2bbtnContabClick(Sender: TObject);
    procedure DetCxPUsuario;
    procedure Z2bbtnNuevoClick(Sender: TObject);
    procedure bbtnRegresaClick(Sender: TObject);
    procedure Z2bbtnAnulaClick(Sender: TObject);
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure dbeImporteExit(Sender: TObject);
    procedure bbtnSumatClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure dblcdProvExit(Sender: TObject);
    procedure dblcdProvRucExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcCCBcoExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure bbtnBorraClick(Sender: TObject);
    procedure EstadoDeForma( xxModo:Integer; xMovEstado,xMovConta:String );
    procedure FiltraCanje;
    procedure GeneraPagares;
    function  ValidaCabecera: Boolean;
    procedure FormCreate(Sender: TObject);
    procedure dbeNoDocExit(Sender: TObject);
    procedure dblcdPresupExit(Sender: TObject);
    procedure dblcdProvEnter(Sender: TObject);
    procedure dblcdProvRucEnter(Sender: TObject);
    procedure dblcClAuxExit(Sender: TObject);
    procedure Z2bbtnPreviewClick(Sender: TObject);
    procedure dblcTMonOriExit(Sender: TObject);
    procedure dblcBancoDestExit(Sender: TObject);
    procedure dbdtpFVcmtoExit(Sender: TObject);
    procedure dbgDetalleIButtonClick(Sender: TObject);
    procedure dbgbbtOkClick(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure bbtnNuevoClick(Sender: TObject);
    procedure dblcClAuxNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcCCBcoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcTMonNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcTDiarioNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    { Private declarations }
    procedure GeneraDetCxP;
    procedure CargaDataSource;
  public
    { Public declarations }
    xFlagGr : Boolean;
    procedure MuestraEstado( xMovEstado, xMovConta   : String );
    procedure EstadoDeBotones( xMovEstado, xMovConta : String );
    procedure GeneraPagares2;
  end;

  procedure OPPTerceros; stdcall;

exports
  OPPTerceros;


var
  xAnoMes : STring;
  FPagares   : TFPagares;
  xCtaConBan : String;
  xTAutoNum,xTAno,xTMes : String;
  xxTCambio  : double;
  xCrea      : Boolean;
  xConta     : String;

implementation

uses CxPDM, CxP001, CxP223;

{$R *.DFM}

procedure OPPTerceros;
var
   xSQL : String;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   if not FVariables.w_OP_Registro then
   begin
      xSQL:='Select * from CXP306 '
           +'Where CIAID=''ZZ'' AND DOCID=''ZZ'' AND PAGARE=''ZZZZZ''';
      DMCXP.cdsPagare.Close;
      DMCXP.cdsPagare.DataRequest( xSQL );
      DMCXP.cdsPagare.Open;
      DMCXP.wModo := 'A';
      FPagares := TFPagares.Create( Application );
      FPagares.ActiveMDIChild;
      FVariables.ConfiguraForma( Screen.ActiveForm );
   end
   else
   begin
      ShowMessage( 'Opcion en USO' );
   end
end;

procedure TFPagares.dblcTMonExit(Sender: TObject);
begin
   if xCrea then Exit;
   edtTMon.Text:=DMCXP.DisplayDescrip('TGE103','TMONDES','TMonID',dblcTMon.Text);
end;

procedure TFPagares.dbdtpFCompExit(Sender: TObject);
Var
   xxFec,xWhere   : String;
   xFCierre : TDate;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

   With DMCXP do begin

      DMCXP.cdsPagare.Edit;

      if xControlFec(dblcCia.Text, dbdtpFComp.Date) = False then
      begin
         Exit;
      end;
      {
      xWhere := 'CiaId='+''''+dblcCia.Text+'''';
      xFCierre := DMCXP.BuscaUltFecha('PrvUltCxP','CXP202','FCierre',xWhere);

      if dbdtpFComp.Date<=xFCierre then
      begin
         ShowMessage(' Error :  Última Fecha de Cierre '+DateToStr(xFCierre) );
         dbdtpFComp.SetFocus;
         exit;
      end;
      }
      DMCXP.cdsPagare.FieldByName('PAFCOMP').AsDateTime:= dbdtpFComp.date;
      xxFec:=FORMATDATETIME(DMCXP.wFormatFecha,dbdtpFComp.date);

      cdsPagare.FieldByName('PAANOMM').AsString := FORMATDATETIME( 'YYYYMM', dbdtpFComp.date );

      DMCXP.cdsPagare.FieldByName('PAANO').AsString   := DMCXP.DisplayDescrip('TGE114','FecAno','Fecha',xxFec);
      if length(DMCXP.cdsPagare.FieldByName('PAANO').AsString)>0 then
      begin
         cdsPagare.FieldByName('PAMM').AsString    := copy(dbdtpFComp.text,4,2); //cdsUltTge.FieldByName('FECMES').AsString;      // mes
         cdsPagare.FieldByName('PAANOMM').AsString := cdsPagare.FieldByName('PAANO').AsString+cdsPagare.FieldByName('PAMM').AsString;   // ano+Mes
         cdsPagare.FieldByName('PADD').AsString    := cdsUltTge.FieldByName('FECDIA').AsString;      // día
         cdsPagare.FieldByName('PATRI').AsString   := cdsUltTge.FieldByName('FECTRIM').AsString;     // trimestre
         cdsPagare.FieldByName('PASEM').AsString   := cdsUltTge.FieldByName('FECSEM').AsString;      // semestre
         cdsPagare.FieldByName('PASS').AsString    := cdsUltTge.FieldByName('FECSS').AsString;       // semana
         cdsPagare.FieldByName('PAAATRI').AsString := cdsUltTge.FieldByName('FECAATRI').AsString;    // año+trimestre
         cdsPagare.FieldByName('PAAASEM').AsString := cdsUltTge.FieldByName('FECAASEM').AsString;    // año+semestre
         cdsPagare.FieldByName('PAAASS').AsString  := cdsUltTge.FieldByName('FECAASS').AsString;     // año+semana
      end;

      xWhere := 'CiaId='+''''+dblcCia.Text+''''+' and TDiarId='+''''+dblcTDiario.Text+''''+' and PaAnoMM='+''''+cdsPagare.FieldByName('PAANOMM').AsString+'''';
      cdsPagare.FieldByName('PALOTE').AsString:=DMCXP.BuscaUltTGE('PrvUltCxP','CXP306','PaLote',xWhere);
      cdsPagare.FieldByName('PALOTE').AsString:=Strzero(cdsPagare.FieldByName('PALOTE').AsString,cdsPagare.FieldByName('PALOTE').DisplayWidth);

      If DMCXP.cdsPagare.FieldByName('PATCAMB').AsFloat<=0 then begin
         // Tipo de Cambio
         xWhere:='TMonId='+''''+DMCXP.wTMonExt            +''''+' and '
                +'Fecha='+wRepFuncDate+''''+ FORMATDATETIME(DMCXP.wFormatFecha,dbdtpFComp.Date)+''''+')';
         if length(BuscaQry('PrvTGE','TGE107','*',xWhere,'TMonId'))>0 then
            xxTCambio:=DMCXP.cdsQry.fieldbyname('TCam'+DMCXP.wVRN_TipoCambio).Value
         else begin
            dbdtpFComp.SetFocus;
            Raise Exception.Create( ' Error :  Fecha No tiene Tipo de Cambio ' );
         end;
         dbeTCambio.Text:= floattostr(FRound(xxTCambio,7,3));
         DMCXP.cdsPagare.FieldByName('PATCAMB').AsFloat := FRound(xxTCambio,7,3);
      end;

   end;
 end;

procedure TFPagares.dblcdCnpEgrExit(Sender: TObject);
var
   xWhere : String;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;



   if Length(dblcdCnpEgr.Text)=0 then
      Raise Exception.Create(' Error :  Falta Registrar Concepto ');

   DMCXP.DisplayDescrip2('prvSQL','CXP201','CPTODES, NIVELMOV,CUENTAID','CPTOID='+quotedStr(dblcdCnpEgr.text),'CPTODES');
//   if Length(Trim(DMCXP.cdsQry.FieldByName('NIVELMOV').ASString)) = 0 then
   if DMCXP.cdsQry.FieldByName('NIVELMOV').ASString ='N'  then
   begin
     dbeCuenta.Text := '';
     dblcdCnpEgr.setfocus;
     ShowMessage( 'Error : Solo puede Seleccionar un Codigo de Concepto de Ultimo Nivel ');
     Exit;
   end;
   dbeCuenta.Text := DMCXP.cdsQry.FieldByName('CUENTAID').ASString;
   DMCXP.cdsPagare.FieldByName('PAGLOSA').AsString:=DMCXP.cdsCnpEgr.FieldByName('CPTODES').AsString;


   DMCXP.cdsPagare.FieldByName('CUENTAID').AsString := DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString;
   if length(dbeGlosa.Text)=0 then
      DMCXP.cdsPagare.FieldByName('PAGLOSA').AsString:=DMCXP.cdsCnpEgr.FieldByName('CPTODES').AsString;

//   xWhere := 'CuentaId='+''''+DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString+'''';
   xWhere := 'CIAID ='+QuotedStr(dblcCia.Text)
            +' and CUENTAID ='+QuotedStr(DMCXP.cdsCnpEgr.FieldByName('CUENTAID').AsString);
   if length(BuscaQry('PrvTGE','TGE202','*',xWhere,'CuentaId'))>0 then
   begin
      if DMCXP.cdsQry.fieldbyname('CTA_PRES').AsString='S' then
      begin
         dblcdPresup.Enabled :=true;
         dblcdPresup.TabOrder:=6;
         dblcdPresup.SetFocus;
      end
      else
      begin
//         DMCXP.cdsDetCxP.Edit;
//         DMCXP.cdsDetCxPParPresID.AsString:='';
         dblcdPresup.Enabled:=false;
         dbeGlosa.SetFocus;
      end;
   end
   else
   begin
      ShowMessage('Cuenta Contable NO existe para la Compañía indicada');
      dblcdCnpEgr.SetFocus;
      exit;
//			Raise Exception.Create('No tiene Cuenta Contable');
   end;
end;

procedure TFPagares.bbtnOkClick(Sender: TObject);
var
   xDias     : TDate;
   xNroCuotas : integer;
begin

   DMCXP.cdsPagare.Edit;
   DMCXP.cdsPagare.FieldByName('PACUOTAS').AsInteger:=1;

   if not ValidaCabecera then Exit;  // Valida que Cabecera Tenga Datos Correctos

   //CLG: 27/11/2003
   // VALIDA LA CUENTA DEL CONCEPTO
   if (DMCXP.LaCuentaSeRegistraSoloEnME(dblcCia.text,dblcdCnpEgr.text,'')) and (dblcTMon.text=DMCXP.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+DMCXP.cdsQry.FieldByName('CUENTAID').AsString+' del Concepto '+dblcdCnpEgr.text+' Se registra sólo en Moneda Extranjera.');
   end;
   
   if xControlFec(dblcCia.Text, dbdtpFComp.Date) = False then
   begin
  	  Exit;
   end;

   //Nro de Cuotas de los INTERESes
    xNroCuotas := Trunc(DMCXP.cdsPagare.FieldByName('PAFVCMTO').AsFloat-DMCXP.cdsPagare.FieldByName('PAFEMIS').AsFloat/30);
    if FRound((DMCXP.cdsPagare.FieldByName('PAFVCMTO').AsFloat-DMCXP.cdsPagare.FieldByName('PAFEMIS').AsFloat/30),15,2)-xNroCuotas>=0.03 then
       xNroCuotas:= xNroCuotas+1;

   DMCXP.cdsPagare.FieldByName('PACUOTAINT').AsInteger := xNroCuotas;
   DMCXP.cdsPagare.FieldByName('PAINTERMO').AsFloat := FRound(DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat*(StrToFloat(dbeInteres.text)/100),15,2);

   //CUOTA
//   DMCXP.cdsPagare.FieldByName('PAMTOORI').AsFloat :=  FRound(DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat+ FRound(DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat*(StrToFloat(dbeInteres.text)/100),15,2),15,2);
   DMCXP.cdsPagare.FieldByName('PAMTOORI').AsFloat := DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat;

   If DMCXP.cdsPagare.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
     begin
      DMCXP.cdsPagare.FieldByName('PAMTOLOC').AsFloat:=DMCXP.cdsPagare.FieldByName('PAMTOORI').AsFloat;
      DMCXP.cdsPagare.FieldByName('PAMTOEXT').AsFloat:=FRound(DMCXP.cdsPagare.FieldByName('PAMTOORI').AsFloat/DMCXP.cdsPagare.FieldByName('PATCAMB').AsFloat,15,2);
     end
   else
    begin
      DMCXP.cdsPagare.FieldByName('PAMTOEXT').AsFloat:=DMCXP.cdsPagare.FieldByName('PAMTOORI').AsFloat;
      DMCXP.cdsPagare.FieldByName('PAMTOLOC').AsFloat:=FRound(DMCXP.cdsPagare.FieldByName('PAMTOORI').AsFloat*DMCXP.cdsPagare.FieldByName('PATCAMB').AsFloat,15,2);
    end;

   xTAutoNum := DMCXP.DisplayDescrip('TGE104','AutoNum','TDiarID',dblcTDiario.Text);
   xTAno := Copy(DMCXP.cdsPagare.FieldByName('PAANOMM').AsString,1,4);
   xTMes := Copy(DMCXP.cdsPagare.FieldByName('PAANOMM').AsString,5,2);
   //** 13/09/2001 - pjsv
   xAnoMes := xTAno + xTMes;
   //**
   FiltraCanje;
   dbgCuotas.Selected.Clear ;
   dbgCuotas.Selected.Add('CPFEMIS'#9'10'#9'Fecha'#9'F');
   dbgCuotas.Selected.Add('CPSERIE'#9'4'#9'Serie'#9'F');
   dbgCuotas.Selected.Add('CPNODOC'#9'10'#9'Nro. Doc'#9'F');
   dbgCuotas.Selected.Add('DCPDH'#9'3'#9'D/H'#9'F');
   dbgCuotas.Selected.Add('DCPMOORI'#9'12'#9'Monto'#9'F');

//   GeneraPagares2;

   DMCXP.cdsLetras.First;

   bbtnSumatClick(Sender);
   if DMCXP.cdsLetras.recordcount=0 then
      dbgDetalleIButton.OnClick(Self);

   EstadoDeForma(1,DMCXP.cdsPagare.FieldByName('PAESTADO').AsString, ' ' );
end;

procedure TFPagares.GeneraPagares;
var
   I  : Integer;
   xDias : double;
    xTotAcum : double;
   xImpInt,xImpCap,xImpCuota : double;
   xTotInt,xTotCap,xTotCuota : double;   
   xCuota, xNoReg : String;
   xNRIni : Integer;
   xDiasFV : double;
begin

   If DMCXP.cdsLetras.RecordCount<>DMCXP.cdsPagare.FieldByName('PACUOTAS').AsFloat then begin

      DMCXP.cdsLetras.First;
      While not DMCXP.cdsLetras.Eof do begin
         DMCXP.cdsLetras.Delete;
      end;

      xTotAcum  := 0;

      xImpInt   := 0;
      xImpCap   := 0;
      xImpCuota := 0;

      xTotInt   := 0;
      xTotCap   := 0;
      xTotCuota := 0;

      xDiasFV   := (DMCXP.cdsPagare.fieldbyname('PAFVCMTO').AsFloat-DMCXP.cdsPagare.fieldbyname('PAFEMIS').AsFloat)/StrToFloat(dbeCuotas.Text);
      xDiasFV   := Trunc(xDiasFV);

      xDias     := xDiasFV;

//      xImpCuota := FRound(DMCXP.cdsPagare.FieldByName('PAMTOORI').AsFloat/DMCXP.cdsPagare.FieldByName('PACUOTAS').AsFloat,15,2);

//      xImpCap   := FRound(DMCXP.cdsPagare.FieldByName('PAMTOORI').AsFloat/DMCXP.cdsPagare.FieldByName('PACUOTAS').AsFloat,15,2);
      xImpCap   := FRound(DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat/DMCXP.cdsPagare.FieldByName('PACUOTAS').AsFloat,15,2);
      xImpInt   := FRound(xImpCap*(strtoFloat(dbeInteres.text)/100),15,2);
      xImpCuota := FRound(xImpCap+xImpInt,15,2);

      xTAutoNum := DMCXP.DisplayDescrip('TGE104','AUTONUM','TDIARID',dblcTDiario.Text);
      xNRIni    := StrToInt(DMCXP.UltimoRegistro(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes ));

      For i:=1 to DMCXP.cdsPagare.FieldByName('PACUOTAS').AsInteger do begin
          Str( i, xCuota);
          xNoReg :='';
          While Length(xNoReg)=0 do begin
             xNoReg := DMCXP.GrabaUltimoRegistro(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes,xNRIni );
             xNoReg := StrZero( xNoReg,6);
             if not DMCXP.BuscaCxPReg(dblcCia.Text,dblcTDiario.Text,xTAno+xTMes,xNoReg) then begin
                Break;
             end;
             xNoReg:= '';
             xNRIni := StrToInt(DMCXP.UltimoRegistro(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes ));
          end;

          DMCXP.cdsLetras.Insert;
          DMCXP.cdsLetras.FieldByName('PROVDES').AsString  := edtProv.Text; // Drescripcion del Proovedor
          DMCXP.cdsLetras.FieldByName('CIAID').AsString    := DMCXP.cdsPagare.FieldByName('CIAID').AsString;
          DMCXP.cdsLetras.FieldByName('CPANOMES').AsString := DMCXP.cdsPagare.FieldByName('PAANOMM').AsString;
          DMCXP.cdsLetras.FieldByName('TDIARID').AsString  := DMCXP.cdsPagare.FieldByName('TDIARID').AsString;
          DMCXP.cdsLetras.FieldByName('CPNOREG').AsString  := StrZero( xNoReg ,DMCXP.cdsLetras.FieldByName('CPNOREG').Size);
          DMCXP.cdsLetras.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
          DMCXP.cdsLetras.FieldByName('PROV').AsString     := DMCXP.cdsPagare.FieldByName('PROV').AsString;
          DMCXP.cdsLetras.FieldByName('PROVRUC').AsString  := DMCXP.cdsPagare.FieldByName('PROVRUC').AsString;
          DMCXP.cdsLetras.FieldByName('DOCID').AsString    := DMCXP.cdsPagare.FieldByName('DOCID').AsString;
          DMCXP.cdsLetras.FieldByName('CPSERIE').AsString  := StrZero( xCuota ,3 );
          DMCXP.cdsLetras.FieldByName('CPNODOC').AsString  := DMCXP.cdsPagare.FieldByName('PAGARE').AsString;
          DMCXP.cdsLetras.FieldByName('CPFRECEP').AsDateTime:=DMCXP.cdsPagare.FieldByName('PAFRECEP').AsDateTime;
          DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime :=DMCXP.cdsPagare.FieldByName('PAFEMIS').AsDateTime;

          if i=DMCXP.cdsPagare.FieldByName('PACUOTAS').AsInteger then
             DMCXP.cdsLetras.FieldByName('CPFVCMTO').AsDateTime:=DMCXP.cdsPagare.FieldByName('PAFVCMTO').AsDateTime
          else
            DMCXP.cdsLetras.FieldByName('CPFVCMTO').AsDateTime:=DMCXP.cdsPagare.FieldByName('PAFEMIS').AsDateTime+xDias;

          DMCXP.cdsLetras.FieldByName('CPFCMPRB').AsDateTime:=DMCXP.cdsPagare.FieldByName('PAFCOMP').AsDateTime;
          DMCXP.cdsLetras.FieldByName('TMONID').AsString   := DMCXP.cdsPagare.FieldByName('TMONID').AsString;
          DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsPagare.FieldByName('PATCAMB').AsFloat;
          DMCXP.cdsLetras.FieldByName('CPESTADO').AsString := 'I';
          DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString := 'N';
          DMCXP.cdsLetras.FieldByName('TCANJEID').AsString := 'PA';
          DMCXP.cdsLetras.FieldByName('CPFCANJE').AsFloat  := DMCXP.cdsPagare.FieldByName('PAFEMIS').AsFloat+xDias;
          DMCXP.cdsLetras.FieldByName('CPUSER').AsString   := DMCXP.wUsuario;
          DMCXP.cdsLetras.FieldByName('CPFREG').AsDateTime := date;
          DMCXP.cdsLetras.FieldByName('CPHREG').AsDateTime := time;
          DMCXP.cdsLetras.FieldByName('CPAAAA').AsString   := DMCXP.cdsPagare.FieldByName('PAANO').AsString;
          DMCXP.cdsLetras.FieldByName('CPMM').AsString     := DMCXP.cdsPagare.FieldByName('PAMM').AsString;
          DMCXP.cdsLetras.FieldByName('CPDD').AsString     := DMCXP.cdsPagare.FieldByName('PADD').AsString;
          DMCXP.cdsLetras.FieldByName('CPTRI').AsString    := DMCXP.cdsPagare.FieldByName('PATRI').AsString;
          DMCXP.cdsLetras.FieldByName('CPSEM').AsString    := DMCXP.cdsPagare.FieldByName('PASEM').AsString;
          DMCXP.cdsLetras.FieldByName('CPSS').AsString     := DMCXP.cdsPagare.FieldByName('PASS').AsString;
          DMCXP.cdsLetras.FieldByName('CPAATRI').AsString  := DMCXP.cdsPagare.FieldByName('PAAATRI').AsString;
          DMCXP.cdsLetras.FieldByName('CPAASEM').AsString  := DMCXP.cdsPagare.FieldByName('PAAASEM').AsString;
          DMCXP.cdsLetras.FieldByName('CPAASS').AsString   := DMCXP.cdsPagare.FieldByName('PAAASS').AsString;
          DMCXP.cdsLetras.FieldByName('DCPLOTE').AsString  := DMCXP.cdsPagare.FieldByName('PALOTE').AsString;
          DMCXP.cdsLetras.FieldByName('CTATOTAL').AsString := DMCXP.cdsPagare.FieldByName('CUENTAID').AsString;
          DMCXP.cdsLetras.FieldByName('CPTOTOT').AsString  := DMCXP.cdsPagare.FieldByName('CPTOID').AsString;

          //INTERES
          if i=DMCXP.cdsPagare.FieldByName('PACUOTAS').AsInteger then
//             DMCXP.cdsLetras.FieldByName('CPDCTO').AsFloat := FRound(DMCXP.cdsPagare.FieldByName('PAMTOORI').AsFloat*(StrToFloat(dbeInteres.text)/100)-xTotInt,15,2)
             DMCXP.cdsLetras.FieldByName('CPDCTO').AsFloat := FRound(DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat*(StrToFloat(dbeInteres.text)/100)-xTotInt,15,2)
          else
             DMCXP.cdsLetras.FieldByName('CPDCTO').AsFloat := xImpInt;

          //CAPITAL
          if i=DMCXP.cdsPagare.FieldByName('PACUOTAS').AsInteger then
//             DMCXP.cdsLetras.FieldByName('CPSERVIC').AsFloat := FRound(DMCXP.cdsPagare.FieldByName('PAMTOORI').AsFloat-xTotCap,15,2)
             DMCXP.cdsLetras.FieldByName('CPSERVIC').AsFloat := FRound(DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat-xTotCap,15,2)
          else
             DMCXP.cdsLetras.FieldByName('CPSERVIC').AsFloat := xImpCap;

          //CUOTA
          if i=DMCXP.cdsPagare.FieldByName('PACUOTAS').AsInteger then
//             DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat := FRound((DMCXP.cdsLetras.FieldByName('CPDCTO').AsFloat+DMCXP.cdsLetras.FieldByName('CPSERVIC').AsFloat)-xTotCuota,15,2)
             DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat :=  FRound(DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat+ FRound(DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat*(StrToFloat(dbeInteres.text)/100),15,2)
                                                               -xTotCuota,15,2)
          else
             DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat := xImpCuota;

          //CUOTA
{          If i=DMCXP.cdsPagare.FieldByName('PACUOTAS').AsInteger then
             DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat := FRound(DMCXP.cdsPagare.FieldByName('PAMTOORI').AsFloat-xTotAcum,15,2)
          else
             DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat := xImpCuota;}


          If DMCXP.cdsLetras.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then begin
             DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
             DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
             DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
             DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
             DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
             end
          Else begin
             DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
             DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
             DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
             DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
             DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
          end;
          cdsPost( DMCXP.cdsLetras );
          xTotAcum := FRound( xTotAcum + DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat ,15,2 );
          ////////
          xTotInt   := FRound( xTotInt + DMCXP.cdsLetras.FieldByName('CPDCTO').AsFloat ,15,2 );
          xTotCap   := FRound( xTotCap + DMCXP.cdsLetras.FieldByName('CPSERVIC').AsFloat ,15,2 );
          xTotCuota := FRound( xTotCuota + DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat ,15,2 );
          ///////
          xDias    := xDias + xDiasFV;
          xNRIni:= xNRIni+1;
      end;
      end
   else begin
      DMCXP.cdsLetras.First;
      While not DMCXP.cdsLetras.Eof do Begin
         DMCXP.cdsLetras.Edit;
         DMCXP.cdsLetras.FieldByName('CPFRECEP').AsDateTime:= DMCXP.cdsPagare.FieldByName('PAFRECEP').AsDateTime;
         DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime := DMCXP.cdsPagare.FieldByName('PAFEMIS').AsDateTime;
         DMCXP.cdsLetras.FieldByName('TMONID').AsString    := DMCXP.cdsPagare.FieldByName('TMONID').AsString;
         DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat   := DMCXP.cdsPagare.FieldByName('PATCAMB').AsFloat;
         DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat   := FRound(DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);

         If DMCXP.cdsLetras.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then begin
            DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
            DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
            end
         Else begin
            DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
            DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
            DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
         end;

         DMCXP.cdsLetras.FieldByName('DCPLOTE').AsString  := DMCXP.cdsPagare.FieldByName('PALOTE').AsString;
         DMCXP.cdsLetras.FieldByName('CTATOTAL').AsString := DMCXP.cdsPagare.FieldByName('CUENTAID').AsString;
         DMCXP.cdsLetras.FieldByName('CPTOTOT').AsString  := DMCXP.cdsPagare.FieldByName('CPTOID').AsString;
         cdsPost( DMCXP.cdsLetras );
         DMCXP.cdsLetras.Next;
      end;
   end;
end;

function TFPagares.ValidaCabecera: Boolean;
var
   Code    : Integer;
   xNumero : double;
begin
   If length(dblcdProv.Text)=0 then raise exception.Create('Falta Registrar Proveedor');
   If length(edtProv.Text)=0 then raise exception.Create('Proveedor Errado');
   if (dblcBanco.Enabled=True) and (length(dblcBanco.Text)=0) then raise exception.Create('Falta definir Banco');
   if (dblcCCBco.Enabled=True) and (length(dblcCCBco.Text)=0) then raise exception.Create('Falta Cuenta Corriente Banco');
   if length(dblcTDiario.Text)=0 then raise exception.Create('Falta Tipo de Diario');
   if dbdtpFEmis.Date=0 then raise exception.Create('Falta Fecha de Canje');
   if dbdtpFVcmto.Date=0 then raise exception.Create('Falta Fecha de Vencimiento');

   if dbdtpFVcmto.Date<dbdtpFEmis.Date then  raise exception.Create('Fecha de Vencimiento debe ser mayor o Igual a Fecha de Emisión');

   if length(dbeCuotas.Text)=0 then raise exception.Create(' Falta Cuotas ');
   Val( dbeCuotas.Text, xNumero, code );
   if xNumero<=0 then raise exception.Create(' Error en Número de Cuotas ');
   if length(dblcTMon.Text)=0 then raise exception.Create('Falta Tipo de Moneda de Pago');
   if length(edtTMon.Text)=0 then raise exception.Create('Código de Moneda Pago Errado');
   if length(dblcCptoDeb.Text)=0 then raise exception.Create('Ingrese Concepto para el Debe del Interes');
   if length(dblcCptoHab.Text)=0 then raise exception.Create('Ingrese Concepto para el Haber del Interes');


   if length(dbeTCambio.Text)=0 then raise exception.Create('Falta Tipo de Cambio');

   if length(dbeInteres.Text)=0 then raise exception.Create('Falta Interes');
   
   Val( dbeTCambio.Text, xNumero, code );
   if xNumero<=0 then raise exception.Create(' Error en Tipo de Cambio ');
   if length(dbeImporte.Text)=0 then raise exception.Create('Falta Importe');
   Val( dbeImporte.Text, xNumero, code );
   if xNumero<=0 then raise exception.Create(' Error en Importe del Pagare ');
   If dbdtpFRecep.Date=0 then raise exception.Create('Falta Fecha de Recepción');
   If dbdtpFComp.Date=0 then raise exception.Create('Falta Fecha de Comprobante');
   If length(dblcdCnpEgr.Text)=0 then raise exception.Create('Falta Registrar Concepto');
   if length(dbeCuenta.Text)=0 then raise exception.Create('Falta Registrar Cuenta');
//   If length(dblcdCCosto.Text)=0 then raise exception.Create('Falta Registrar Centro de Costo');
   if length(dbeGlosa.Text)=0 then raise exception.Create('Código de Cuenta Errado');
   Result := True;
end;

procedure TFPagares.FiltraCanje;
begin
   Filtracds( DMCXP.cdsLetras,'Select * from CXP301 Where '
                + 'CIAID='   +''''+ dblcCia.Text  +''''+' and '
                + 'DOCID='   +''''+ dblcTDoc.Text +''''+' and '
                + 'CPNODOC=' +''''+ dbeNoDoc.Text +''''+' and '
                + 'TCANJEID=''PA''' );

   Filtracds( DMCXP.cdsDetCxP,'Select * from CXP302 Where '
                + 'CIAID='   +''''+ dblcCia.Text  +''''+' and '
                + 'DOCID='   +''''+ dblcTDoc.Text +''''+' and '
                + 'CPNODOC=' +''''+ dbeNoDoc.Text +''''+' and '
                + 'TCANJEID=''PA''' );

//ANAX
  TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOORI')).DisplayFormat := '###,###,##0.00';
  TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOORI')).EditFormat := '########0.00';

  TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOLOC')).DisplayFormat := '###,###,##0.00';
  TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOLOC')).EditFormat := '########0.00';

  TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOEXT')).DisplayFormat := '###,###,##0.00';
  TNumericField(DMCXP.CdsLetras.FieldByName('CPMTOEXT')).EditFormat := '########0.00';

  TNumericField(DMCXP.CdsLetras.FieldByName('CPDCTO')).DisplayFormat := '###,###,##0.00';
  TNumericField(DMCXP.CdsLetras.FieldByName('CPDCTO')).EditFormat := '########0.00';

  TNumericField(DMCXP.CdsLetras.FieldByName('CPSERVIC')).DisplayFormat := '###,###,##0.00';
  TNumericField(DMCXP.CdsLetras.FieldByName('CPSERVIC')).EditFormat := '########0.00';

  dbgDetalle.Selected.Clear;
  dbgDetalle.Selected.Add('CPNOREG'#9'10'#9'No.Reg'#9'F');
  dbgDetalle.Selected.Add('CPNODOC'#9'12'#9'No.Doc'#9'F');
  dbgDetalle.Selected.Add('CPSERIE'#9'5'#9'No.Cuota'#9'F');
  dbgDetalle.Selected.Add('TMONID'#9'2'#9'Moneda'#9'F');
  dbgDetalle.Selected.Add('CPDCTO'#9'13'#9'Monto~Interes'#9'F');
  dbgDetalle.Selected.Add('CPSERVIC'#9'13'#9'Monto~Capital'#9'F');

  dbgDetalle.Selected.Add('CPMTOORI'#9'13'#9'Monto~Cuota Ori'#9'F');
  dbgDetalle.Selected.Add('CPMTOLOC'#9'13'#9'Monto~Cuota Loc'#9'F');
  dbgDetalle.Selected.Add('CPMTOEXT'#9'13'#9'Monto~Cuota Ext'#9'F');

  dbgDetalle.ApplySelected;


//FIN DE ANAX

end;

procedure TFPagares.EstadoDeForma( xxModo:Integer; xMovEstado, xMovConta : String );
begin
   pnlCab1.Enabled      := False;
//   pnlCab2.Enabled      := False;
   pnlCab3.Enabled      := False;
   bbtnOK.Enabled       := False;
   bbtnBorra.Enabled    := False;

   pnlDetalle.Enabled   := False;
   dbgDetalle.ReadOnly:= True;

   pnlPie.Enabled       := False;
   bbtnRegresa.Enabled  := False;
   bbtnCancela.Enabled  := False;
   Z2bbtnGraba.Enabled  := False;
   Z2bbtnAcepta.Enabled := False;
   Z2bbtnAnula.Enabled  := False;
//   Z2bbtnImprime.Enabled:= False;
   Z2bbtnContab.Enabled := False;
   Z2bbtnNuevo.Enabled  := False;

   lblActivo.Visible    := False;
   lblAcepta.Visible    := False;
   lblAnula.Visible     := False;
   lblContab.Visible    := False;

   If xxModo=0 then
      begin
         If (xMovEstado=' ') or (xMovEstado='') then begin
            pnlCab1.Enabled    := True;
            pnlCab2.Enabled    := True;
            pnlCab3.Enabled    := True;
            bbtnOK.Enabled     := True;
            bbtnBorra.Enabled  := True;
            lblActivo.Visible  := False;
            dblcCia.SetFocus;
         end;
         If xMovEstado='X' then begin
            pnlCab2.Enabled    := True;
            pnlCab3.Enabled    := True;
            bbtnOK.Enabled     := True;
            bbtnBorra.Enabled  := True;
            lblActivo.Visible  := False;
//            dblcClAux.Enabled  := True;
//            dblcClAux.SetFocus;
         end;
         If xMovEstado='I' then begin
            pnlCab2.Enabled    := True;
            pnlCab3.Enabled    := True;
            bbtnOK.Enabled     := True;
            bbtnBorra.Enabled  := True;
            lblActivo.Visible  := True;
            dbdtpFRecep.SetFocus;
         end;
      end
   else begin

      bbtnSumatClick( Self );

      If xMovConta='S' then
         begin
            pnlDetalle.Enabled   := True;
            pnlPie.Enabled       := True;
            Z2bbtnPreview.Enabled:= True;
            lblContab.Visible    := True;
         end
      else begin
         If (xMovEstado='I') or (xMovEstado='X') then begin
            pnlCab2.Enabled       := False;
            pnlDetalle.Enabled   := True;
            dbgDetalle.ReadOnly:= False;

            pnlPie.Enabled       := True;
            bbtnRegresa.Enabled  := True;
            bbtnCancela.Enabled  := True;
            Z2bbtnGraba.Enabled  := True;
            Z2bbtnAcepta.Enabled := True;
            Z2bbtnAnula.Enabled  := True;
            Z2bbtnPreview.Enabled:= True;

            lblActivo.Visible    := True;
         end;
         If (xMovEstado='P') or (xMovEstado='C') then
          begin
            pnlDetalle.Enabled   := True;
            pnlPie.Enabled       := True;
            Z2bbtnPreview.Enabled:= True;

            if xConta<>'N' then Z2bbtnContab.Enabled:=True;
            lblAcepta.Visible    := True;
         end;
         If xMovEstado='A' then begin
            pnlDetalle.Enabled   := True;
            pnlPie.Enabled       := True;
            lblAnula.Visible     := True;
         end;
      end;

      if DMCXP.wModo='A' then begin
         Z2bbtnNuevo.Enabled  := True;
      end;
   end;

   if DMCXP.wModo='C' then begin // Si Entra Solo Para Consulta
      pnlCab1.Enabled      := False;
      pnlCab2.Enabled      := False;
      pnlCab3.Enabled      := False;
      bbtnOK.Enabled       := False;
      bbtnBorra.Enabled    := False;

      pnlDetalle.Enabled   := False;
      dbgDetalle.ReadOnly:= True;

      pnlPie.Enabled       := False;
      bbtnRegresa.Enabled  := False;
      bbtnCancela.Enabled  := False;
      Z2bbtnGraba.Enabled  := False;
      Z2bbtnAcepta.Enabled := False;
      Z2bbtnAnula.Enabled  := False;
      Z2bbtnPreview.Enabled:= False;
      Z2bbtnContab.Enabled := False;
      Z2bbtnNuevo.Enabled  := False;
   end;
end;


procedure TFPagares.InicializaClientDataSet;
begin
   // Filtra Tipos de documentos aptos para guardar como Provisión
   Filtracds( DMCXP.cdsLetras,'Select * from CXP301 Where CIAID=''''' );
end;

procedure TFPagares.InicializaDatos;
begin
   xFlagGr          := False;
   dblcCia.Text      := '';
   edtCia.Text       := '';
   dblcTDoc.Text     := '';
   edtTDoc.Text      := '';
   dbeNoDoc.Text     := '';
   dblcClAux.Text    := '';
   dblcdProv.Text    := '';
   dblcdProvRuc.Text := '';
   edtProv.Text      := '';
   dblcBanco.Text    := '';
   edtBanco.Text     := '';
   dblcBancoDest.Text := '';
   edtBancoDes.Text  := '';
   dbeInteres.text   := '';
   dbeCCBCOOri.text  := '';

   dblcCCBco.Text    := '';
   dblcTDiario.Text  := '';
   edtTDiario.Text   := '';
   dbdtpFEmis.Date   := 0;
   dbdtpFVcmto.Date  := 0;
   dbeCuotas.Text    := '';
   dblcTMon.Text     := '';
   edtTMon.Text      := '';
   dbeImporte.text   := '';
   dbeTCambio.Text   := '';
   dbdtpFRecep.Date  := 0;


   dbdtpFComp.Date   := 0;
   dbeLote.Text      := '';
   dblcdCnpEgr.Text  := '';
   dbeCuenta.Text    := '';
   dbeGlosa.Text     := '';
   xCtaConBan        := ''
end;

procedure TFPagares.InicializaPaneles;
begin
   pnlCab1.Enabled   := True;
   pnlCab2.Enabled  := False;
   pnlCab3.Enabled  := False;

   dblcdprov.Enabled    := True;
   dblcdprovRuc.Enabled := True;
   dblcBanco.Enabled    := True;
   dblcTDiario.Enabled  := True;
   dbeCuotas.Enabled    := True;
   dbdtpFComp.Enabled   := True;

   // Reglas de Negocio
   if DMCXP.wVRN_TCambioFijo='N' then
      dbeTCambio.Enabled:=True
   else begin
      dbeTCambio.Enabled:=False;
   end;

   dblcCia.SetFocus;
end;



procedure TFPagares.dbgDetalleColExit(Sender: TObject);
begin
   if dbgDetalle.SelectedField.FieldName='CPMTOORI' then begin
      DMCXP.cdsLetras.Edit;
      If DMCXP.cdsLetras.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then begin
         DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
         DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
         DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
         DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
         DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
         end
      Else begin
         DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
         DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
         DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
         DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
         DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
      end;
      cdsPost( DMCXP.cdsLetras );
      dbgDetalle.RefreshDisplay;
   end;
end;

procedure TFPagares.Z2bbtnGrabaClick(Sender: TObject);
Var
   xOk  : Boolean;
  xSql : String;
begin

   If DMCXP.cdsLetras.RecordCount=0 Then Raise exception.Create(' Falta Registrar detalle de Pagarés ');

   DMCXP.cdsLetras.DisableControls;
   xOk := True;
   DMCXP.cdsLetras.First;
   While not DMCXP.cdsLetras.eof do begin
      If ( length(DMCXP.cdsLetras.FieldByName('CPNOREG').AsString)=0) or (DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat<=0) then
         xOk := False
      else
         DMCXP.cdsLetras.Next;
   end;

   If not xOk Then begin
      DMCXP.cdsLetras.First;
      DMCXP.cdsLetras.EnableControls;
      raise exception.Create('Detalle de Pagares Incompleto. Verificar....');
   end;

   DMCXP.cdsPagare.Edit;
   DMCXP.cdsPagare.FieldByName('PAUSER').AsString  := DMCXP.wUsuario;
   DMCXP.cdsPagare.FieldByName('PAFREG').AsDateTime:= Date;
   DMCXP.cdsPagare.FieldByName('PAHREG').AsDateTime := TIME;
   DMCXP.cdsPagare.FieldByName('PAESTADO').AsString:= 'I';
   DMCXP.AplicaDatos( DMCXP.cdsPagare, 'Pagare' );

   DMCXP.AplicaDatos( DMCXP.cdsLetras, 'Letras' );
   xFlagGr:= False;
   FiltraCanje;
   DMCXP.cdsLetras.EnableControls;
   EstadoDeForma(1,DMCXP.cdsLetras.FieldByName('CPESTADO').AsString, DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString);

   ShowMessage('  Registro de Canje Grabado  ');

end;

procedure TFPagares.FormClose(Sender: TObject; var Action: TCloseAction);
var
 xSql : String;
begin
   // Eliminar Filtros
   DMCXP.cdsTDoc.Filtered   := False;
   DMCXP.cdsTMon.Filtered   := False;
   DMCXP.cdsCCBCO.Filtered   := False;
   if ( DMCXP.wModo='A' ) and ( xFlagGr ) then
    begin
    	DMCXP.cdsPagare.Delete;
      DMCXP.AplicaDatos( DMCXP.cdsPagare, 'Pagare' );
    end
   else
    begin
      DMCXP.cdsPagare.CancelUpdates;
    end;

//   FVariables.ActualizaFiltro( DMCXP.cdsPagare, FPrincipal.GPagares, DMCXP.wModo );
   if not (FPrincipal.GPagares=nil) then
      FPrincipal.GPagares.RefreshFilter;

   Action:=caFree;
end;

procedure TFPagares.bbtnCancelaClick(Sender: TObject);
begin

   DMCXP.cdsLetras.CancelUpdates;

   EstadoDeForma( 0, DMCXP.cdsPagare.FieldByName('PAESTADO').AsString, ' ' );
end;


procedure TFPagares.bbtnCalcClick(Sender: TObject);
begin
   WinExec('C:\windows\calc.exe',1 );  // Executa Aplicación
end;

procedure TFPagares.Z2bbtnContabClick(Sender: TObject);
var
   xRegAct : TBookMark;
begin
   //** 13/09/2001 - pjsv
   If DMCXP.MesCerrado(copy(xAnomes,5,2),copy(xAnomes,1,4),dblcCia.text) then
    begin
     ShowMessage(' Mes cerrado, no se puede contabilizar');
     exit;
    end;
   //**
   xRegAct := DMCXP.cdsLetras.GetBookmark;

   DMCXP.cdsLetras.DisableControls;

   DMCXP.cdsLetras.First;
   if DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString='S' then begin
      DMCXP.cdsLetras.GotoBookmark(xRegAct);
      DMCXP.cdsLetras.FreeBookmark(xRegAct);
      DMCXP.cdsLetras.EnableControls;
      raise exception.Create(' Registro ya fue Contabilizado ');
   end;

   GeneraDetCxP;

   DMCXP.cdsLetras.First;
   While not DMCXP.cdsLetras.Eof do Begin

      DMCXP.GeneraContab( dblcCia.Text, dblcTDiario.Text, DMCXP.cdsLetras.FieldByName('CPANOMES').AsString, DMCXP.cdsLetras.FieldByName('CPNOREG').AsString, Self, 'C' );

      DMCXP.cdsLetras.Edit;
      DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString:='S';
      DMCXP.cdsLetras.Next;
   end;

   DMCXP.AplicaDatos( DMCXP.cdsLetras, 'Letras' );

   /////////////
   DMCXP.cdsPagare.Edit;
	DMCXP.cdsPagare.fieldbyname('PA_CONTA').AsString:='S';
	DMCXP.cdsPagare.fieldbyname('PAUSER').AsString  :=DMCXP.wUsuario;
	DMCXP.cdsPagare.fieldbyname('PAFREG').Value     :=Date;
	DMCXP.cdsPagare.fieldbyname('PAFHOR').Value     :=Time;
   DMCXP.cdsPagare.Post;
   DMCXP.AplicaDatos( DMCXP.cdsPagare, 'Pagare' );
   /////////////

   EstadoDeForma(1,DMCXP.cdsLetras.FieldByName('CPESTADO').AsString, DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString);
   ShowMessage('Registro Contabilizado');
end;

procedure TFPagares.DetCxPUsuario;
begin
   DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString  := DMCXP.wUsuario;
   DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime:= Date;
   DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime:= time;
end;


procedure TFPagares.Z2bbtnNuevoClick(Sender: TObject);
var
 xSql : String;
begin
   if DMCXP.wAdmin='G' then Exit;
   if MessageDlg('Ingresar Nuevo Documento'+chr(13)+chr(13)+
                 '     ¿ Esta Seguro ?    ',mtConfirmation, [mbYes, mbNo], 0)=mrNo
   then Exit;
   If ( DMCXP.wModo='A' ) and ( xFlagGr ) then
    begin
     //** 17/07/2001 - pjsv
      DMCXP.cdsPagare.Delete;
      DMCXP.AplicaDatos( DMCXP.cdsPagare, 'Pagare' );
     //**
    end;
   InicializaClientDataSet;
   DMCXP.cdsPagare.Insert;
   InicializaDatos;
   bbtnSumatClick(Sender);
   EstadoDeForma( 0, ' ', ' ' );
   Screen.Cursor:=crDefault;
end;

procedure TFPagares.bbtnRegresaClick(Sender: TObject);
begin
   EstadoDeForma( 0, DMCXP.cdsPagare.FieldByName('PAESTADO').AsString, ' ' );
end;

procedure TFPagares.Z2bbtnAnulaClick(Sender: TObject);
begin
   DMCXP.cdsPagare.Edit;
   DMCXP.cdsPagare.FieldByName('PAESTADO').AsString:='A';
   cdsPost( DMCXP.cdsPagare );
   DMCXP.cdsPagare.Post;

   DMCXP.cdsLetras.DisableControls;
   DMCXP.cdsLetras.First;
   While not DMCXP.cdsLetras.Eof do Begin
      //
      DMCXP.cdsLetras.Edit;
      DMCXP.cdsLetras.FieldByName('CPESTADO').AsString := 'A';
      cdsPost( DMCXP.cdsLetras );
      DMCXP.cdsLetras.Next;
      //
   end;
   DMCXP.cdsLetras.First;
   DMCXP.cdsLetras.EnableControls;

   //GeneraAsientoAutomatico;
   DMCXP.AplicaDatos( DMCXP.cdsPagare, 'Pagare' );
   DMCXP.AplicaDatos( DMCXP.cdsLetras, 'Letras' );
   EstadoDeForma(0,DMCXP.cdsPagare.FieldByName('PAESTADO').AsString, ' ' );

   ShowMessage('Registro Anulado');

end;

procedure TFPagares.Z2bbtnAceptaClick(Sender: TObject);
Var
   xSql : STring;
   xRegAct : TBookMark;
   xTotal,xTotCap,xTotInt  : double;
   xTotMN, xTotME : double;
begin

   DMCXP.cdsLetras.DisableControls;

   xRegAct  := DMCXP.cdsLetras.GetBookmark;

   xTotal := 0;
   DMCXP.cdsLetras.First;
   While not DMCXP.cdsLetras.Eof do Begin
//      xTotal := FRound( xTotal + DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
      xTotal := FRound( xTotal + DMCXP.cdsLetras.FieldByName('CPSERVIC').AsFloat,15,2);
      DMCXP.cdsLetras.Next;
   end;

   If not(FRound(DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat,15,2)=FRound(xTotal,15,2)) then begin
      DMCXP.cdsLetras.GotoBookmark(xRegAct);
      DMCXP.cdsLetras.FreeBookmark(xRegAct);
      DMCXP.cdsLetras.EnableControls;
      raise exception.Create('Error : El Monto del Pagare NO Coincide con el Detalle');
   end;

   DMCXP.cdsPagare.Edit;
   
   DMCXP.cdsPagare.FieldByName('PAESTADO').AsString := 'P';
   cdsPost( DMCXP.cdsPagare );
   DMCXP.cdsPagare.Post;

   xTotMN := 0;
   xTotME := 0;
   DMCXP.cdsLetras.First;
   While not DMCXP.cdsLetras.Eof do Begin
      DMCXP.cdsLetras.Edit;
      DMCXP.cdsLetras.FieldByName('CPESTADO').AsString:= 'P';
      xTotMN := xTotMN + DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat;
      xTotME := xTotME + DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat;
      cdsPost( DMCXP.cdsLetras );
      DMCXP.cdsLetras.Next;
   end;
   DMCXP.cdsLetras.First;

   DMCXP.SaldosAuxiliar( DMCXP.cdsLetras.FieldByName('CIAID').AsString,  DMCXP.cdsLetras.FieldByName('CPANOMES').AsString,
                       DMCXP.cdsLetras.FieldByName('CLAUXID').AsString,DMCXP.cdsLetras.FieldByName('PROV').AsString,
                       '+', xTotMN, xTotME, DMCXP.cdsPagare.FieldByName('TMONID').AsString );

   DMCXP.AplicaDatos( DMCXP.cdsLetras, 'Letras' );
   DMCXP.AplicaDatos( DMCXP.cdsPagare, 'Pagare' );
   
   DMCXP.cdsLetras.GotoBookmark(xRegAct);
   DMCXP.cdsLetras.FreeBookmark(xRegAct);
   DMCXP.cdsLetras.EnableControls;

   EstadoDeForma(1,DMCXP.cdsPagare.FieldByName('PAESTADO').AsString, ' ' );

   ShowMessage('  Canje Aceptado  ');
end;

procedure TFPagares.MuestraEstado( xMovEstado, xMovConta : String ) ;
begin

end;

procedure TFPagares.EstadoDeBotones( xMovEstado, xMovConta : String );
begin
   bbtnCalc.Enabled    := True;
   bbtnSumat.Enabled   := False;
end;



procedure TFPagares.dbeTCambioExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   
   if length(dbeTCambio.Text)=0 then
   begin
      dbeTCambio.SetFocus;
      ShowMessage('Falta Tipo de Cambio');
   end;
   if DMCXP.cdsPagare.FieldByName('PATCAMB').AsInteger<=0 then
   begin
      dbeTCambio.SetFocus;
      Raise Exception.Create('Tipo de Cambio debe ser Mayor a CERO');
   end;
end;

procedure TFPagares.dbeImporteExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   
   if length(dbeImporte.Text)=0 then
   begin
      dbeImporte.SetFocus;
      Raise Exception.Create(' Falta Importe ');
   end;
   if DMCXP.cdsPagare.FieldByName('PACAPITMO').AsInteger<=0 then
   begin
      dbeImporte.SetFocus;
      Raise Exception.Create('Importe debe ser Mayor a CERO');
   end;
end;


procedure TFPagares.bbtnSumatClick(Sender: TObject);
Var
   xTLetOri, xTLetLoc, xTLetExt : double;
   xTotInt,xTotCap : double;
   xTMonID : String;
   xRegAct : TBookMark;
begin

   With DMCXP Do Begin
      // Totales de Letras por Pagar
      cdsLetras.DisableControls;
      xRegAct  := cdsLetras.GetBookmark;
      xTLetOri := 0; xTLetLoc := 0; xTLetExt := 0;
      cdsLetras.First ;
      While not cdsLetras.Eof do
       Begin
         xTLetOri := xTLetOri + cdsLetras.FieldByName('CPMTOORI').AsFloat;
         xTLetLoc := xTLetLoc + cdsLetras.FieldByName('CPMTOLOC').AsFloat;
         xTLetExt := xTLetExt + cdsLetras.FieldByName('CPMTOEXT').AsFloat;

         xTotInt := xTotInt + cdsLetras.FieldByName('CPDCTO').AsFloat;
         xTotCap := xTotCap + cdsLetras.FieldByName('CPSERVIC').AsFloat;
         cdsLetras.Next;
       end;
//      dbgDetalle.ColumnByName('LKTMONID').FooterValue:=xTMonID;
      dbgDetalle.ColumnByName('CPDCTO').FooterValue  :=floattostrf(xTotInt, ffNumber, 10, 2);
      dbgDetalle.ColumnByName('CPSERVIC').FooterValue:=floattostrf(xTotCap, ffNumber, 10, 2);

      dbgDetalle.ColumnByName('CPMTOORI').FooterValue:=floattostrf(xTLetOri, ffNumber, 10, 2);
      dbgDetalle.ColumnByName('CPMTOLOC').FooterValue:=floattostrf(xTLetLoc, ffNumber, 10, 2);
      dbgDetalle.ColumnByName('CPMTOEXT').FooterValue:=floattostrf(xTLetExt, ffNumber, 10, 2);
      cdsLetras.GotoBookmark(xRegAct);
      cdsLetras.FreeBookmark(xRegAct);
      cdsLetras.EnableControls;

  end;


end;

procedure TFPagares.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFPagares.dblcCiaExit(Sender: TObject);
var
   xSQL : String;
begin
	if xCrea then Exit;
	if bbtnBorra.Focused then Exit;

	edtCia.Text:=DMCXP.cdsCia.FieldByName('CiaDes').Value;

  if DMCXP.wVRN_CCosCia='N' then
  	 xSQL:='SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 '
				+'Where CCOSMOV='+quotedstr('S')
  else
   	 xSQL:='SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 '
				+'Where CCOSMOV='+quotedstr('S')
        +' and CCOSCIAS LIKE ('+quotedstr('%'+dblcCia.Text+'%')+' ) ';

	 DMCXP.cdsCCosto.Close;
	 DMCXP.cdsCCosto.DataRequest(xSQL);
	 DMCXP.cdsCCosto.open;
	 DMCXP.cdsCCosto.Filter:='';
	 DMCXP.cdsCCosto.Filtered:=False;
	 DMCXP.cdsCCosto.IndexFieldNames :='CCOSID';

// JORGE 31/01/2002
// El concepto no tiene compañía pero las cuentas contables si, abre solo los conceptos
// de aquellas cuentas contables que tiene la compañía

    if DMCXP.wVRN_CptoCia='N' then
    	 xSQL:='select * from CXP201 '
    else
    	 xSQL:='select * from CXP201 '
		    	 	+'Where CIAID='+quotedstr(dblcCia.Text);

  	DMCXP.cdsCnpEgr.Close;
	  DMCXP.cdsCnpEgr.DataRequest( xSQL );
	  DMCXP.cdsCnpEgr.Open;
end;

procedure TFPagares.dblcTDocExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if dblcCia.Focused   then Exit;

   if Length(dblcTDoc.Text)=0 then begin
      dblcTDoc.SetFocus;
      Raise Exception.Create(' Error :  Falta Registrar Tipo de Documento ');
   end;
   edtTDoc.Text:=DMCXP.cdsTDoc.fieldbyname('DOCDES').AsString;
   xConta      :=DMCXP.cdsTDoc.fieldbyname('DOCCONTA').AsString;

   if Length(dbeNoDoc.Text)=0 then dbeNoDoc.SetFocus;
end;

procedure TFPagares.dblcdProvExit(Sender: TObject);
var
   xWhere : string;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if dblcClAux.Focused then Exit;
   if Length(dblcClAux.Text)=0 then begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Falta Ingresar Clase de Auxiliar');
   end;

   if length(dblcdProv.Text)>0 then
   begin
       BuscaPagare;   
       edtProv.Text:=DMCXP.DisplayDescrip('CNT201','AUXNOMB','AUXID',dblcdProv.Text);
       if length(edtProv.Text)=0 then
       begin
          dblcdProv.Text:='';
          dblcdProvRuc.Text:='';
          dblcdProv.SetFocus;
          Raise Exception.Create('Auxiliar no existe');
       end;
       DMCXP.cdsPagare.FieldByName('PROV').AsString   :=dblcdProv.Text;
       DMCXP.cdsPagare.FieldByName('PROVRUC').AsString:=DMCXP.cdsULTTGE.FieldByName('AUXRUC').AsString;

       xWhere:='ClAuxId='''+dblcClAux.Text+''' and MODULO LIKE ''%'+DMCXP.wModulo+'%''';
       BuscaQry('dspTGE','TGE102','CLAUXDES,CLAUXCP',xWhere,'CLAUXDES');
       if DMCXP.cdsQry.FieldByName('CLAUXCP').AsString='B' then
       begin
          dblcBanco.Text      := dblcdProv.Text;
          edtBanco.Text       := edtProv.Text;
          dbeCCBCOOri.Enabled := True;
          dbeCCBCOOri.SetFocus
       end
       else
       begin
          dbeCCBCOOri.Text    := '';
          dbeCCBCOOri.Enabled := True;
          dblcBanco.Enabled   := True;
          dblcBanco.SetFocus;
       end;
   end
   else
   begin
     edtProv.Text:='';
     dblcdProvRuc.SetFocus;
   end;
end;

procedure TFPagares.dblcdProvRucExit(Sender: TObject);
var
   xWhere : String;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if dblcClAux.Focused then Exit;
   if Length(dblcClAux.Text)=0 then begin
      dblcClAux.SetFocus;
      Raise Exception.Create('Falta Ingresar Clase de Auxiliar');
   end;

   if (length(dblcdProvRuc.Text)>0) then
   begin
//      xWhere:='ClAuxId='''+dblcClAux.Text+''' and ProvRuc='''+dblcdProvRuc.Text+'''';
      xWhere:='ClAuxId='''+dblcClAux.Text+''' and AUXRUC='''+dblcdProvRuc.Text+'''';
//      edtProv.Text:=BuscaQry('dspTGE','TGE201','PROV,PROVRUC,PROVDES',xWhere,'PROVDES');
      edtProv.Text:=BuscaQry('dspTGE','CNT201',' AUXID PROV,AUXRUC PROVRUC, AUXNOMB PROVDES',xWhere,'PROVDES');
      if length(edtProv.Text)=0 then
      begin
         ShowMessage('RUC de Proveedor no existe');
         dblcdProv.Text   :='';
         dblcdProvRuc.Text:='';
         dblcdProvRuc.SetFocus;
         exit;
      end;
      DMCXP.cdsPagare.FieldByName('PROV').AsString:=DMCXP.cdsULTTGE.FieldByName('PROVRUC').AsString;
      dblcBanco.SetFocus;
   end
   else begin
      edtProv.Text:='';
      dblcdProv.SetFocus;
   end;
end;

procedure TFPagares.dblcBancoExit(Sender: TObject);
var
   xWhere : string;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if dblcdProvRuc.Focused then Exit;
   if dblcdProv.Focused then Exit;

   If Length(dblcBanco.Text)=0 then begin
      dblcBanco.SetFocus;
      Raise Exception.Create(' Error :  Falta Registrar Banco ');
   end;

   xWhere := 'BANCOID='+''''+dblcBanco.text+'''';
   BuscaQry('PrvTGE','TGE105','BANCONOM',xWhere,'BANCONOM');
   edtBanco.Text := DMCXP.cdsQry.FieldByName('BANCONOM').AsString;

//   edtBanco.Text := DMCXP.cdsBanco.FieldByName('BANCONOM').AsString;
   if length(edtBanco.Text)>0 then
   begin
//      DMCXP.cdsCCBco.Filter:='';
//      DMCXP.cdsCCBco.Filter:='BANCOID='+quotedstr(dblcBanco.Text)+' AND CIAID='+quotedstr(dblcCia.text);
//      DMCXP.cdsCCBco.Filtered:=True;
//      dblcCCBco.Enabled:=true;
      dbeCCBCOOri.Enabled :=True;
   end;
end;

procedure TFPagares.dblcCCBcoExit(Sender: TObject);
begin
   xCtaConBan := DMCXP.cdsCCBco.FieldByName('CTAPRINC').AsString;
   DMCXP.cdsPagare.FieldByName('TMONID').AsString := DMCXP.cdsCCBco.FieldByName('TMONID').AsString;
   dblcTMon.text := DMCXP.cdsCCBco.FieldByName('TMONID').AsString;
   dblcTMon.OnExit(dblcTMon);
//   dbdtpFEmis.setfocus;
end;

procedure TFPagares.dblcTDiarioExit(Sender: TObject);
begin
   if xCrea then Exit;
//   if bbtnBorra.Focused then Exit;
   edtTDiario.Text:=DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);
end;

procedure TFPagares.bbtnBorraClick(Sender: TObject);
var
 xSql : STring;
begin
   If DMCXP.wModo='A' then
      begin
         if xFlagGr then begin
            DMCXP.cdsPagare.CancelUpdates;
            DMCXP.cdsLetras.CancelUpdates;
            //** 17/07/2001 - pjsv
            xSql := 'DELETE FROM CXP306 WHERE CIAID='+quotedstr(dblcCia.Text)+' AND DOCID='+quotedstr(dblcTDoc.Text)+
                    ' AND PAGARE='+quotedstr(dbeNoDoc.Text);
            try
             DMCXP.DCOM1.AppServer.IniciaTransaccion;
             DMCXP.DCOM1.AppServer.EjecutaSQL(xSql);
             DMCXP.DCOM1.AppServer.GrabaTransaccion;
            except
             DMCXP.DCOM1.AppServer.RetornaTransaccion;
            end;
            //            DMCXP.cdsPagare.Delete;
            //            DMCXP.AplicaDatos( DMCXP.cdsPagare, 'Pagare' );
            //**
            DMCXP.cdsPagare.Insert;
            InicializaDatos;
            InicializaClientDataSet;
            end
         else begin
            if Length(DMCXP.cdsPagare.FieldByName('PAESTADO').AsString)=0 then begin
               DMCXP.cdsPagare.CancelUpdates;
               DMCXP.cdsPagare.Insert;
               InicializaDatos;
               InicializaClientDataSet;
               end
            else begin
               DMCXP.cdsPagare.CancelUpdates;
            end;
         end;
      end
   else begin
      DMCXP.cdsPagare.CancelUpdates;
   end;

   EstadoDeForma( 0, DMCXP.cdsPagare.FieldByName('PAESTADO').AsString,' ' );
end;

procedure TFPagares.FormCreate(Sender: TObject);
begin
   If DMCXP.wAdmin='G' then begin
      DMCXP.wObjetoDesPr := Caption;
      FPrincipal.ListaComponentes(Self);
   end;

   CargaDataSource;

end;

procedure TFPagares.CargaDataSource;
begin
   dblcCia.DataSource        :=nil;
   dblcCia.LookupTable       :=DMCXP.cdsCia;
   dblcTDoc.DataSource       :=nil;
   dblcTDoc.LookupTable      :=DMCXP.cdsTDoc;
   dblcClAux.DataSource      :=nil;
   dblcClAux.LookupTable     :=DMCXP.cdsClAux;
   dblcdProv.DataSource      :=nil;
   dblcdProv.LookupTable     :=DMCXP.cdsProv;
   dblcdProvRuc.DataSource   :=DMCXP.dsPagare;
   dblcdProvRuc.LookupTable  :=DMCXP.cdsProv;
   dblcBanco.DataSource      :=DMCXP.dsPagare;
   dblcBanco.LookupTable     :=DMCXP.cdsBanco;
   dbeCCBCOOri.DataSource    :=DMCXP.dsPagare;
   dblcBancoDest.DataSource  :=DMCXP.dsPagare;
   dblcBancoDest.LookupTable :=DMCXP.cdsBanco;
   dblcCCBco.DataSource      :=DMCXP.dsPagare;
   dblcCCBco.LookupTable     :=DMCXP.cdsCCBco;
   dblcTMon.DataSource       :=DMCXP.dsPagare;
   dblcTMon.LookupTable      :=DMCXP.cdsTMon;
   dblcTDiario.LookupTable   :=DMCXP.cdsTDiario;
   dblcTDiario.DataSource    :=DMCXP.dsPagare;
   dbeImporte.DataSource     :=DMCXP.dsPagare;
   dbeInteres.DataSource     :=DMCXP.dsPagare;
   dbeCuotas.DataSource      :=DMCXP.dsPagare;
   dbdtpFEmis.DataSource     :=DMCXP.dsPagare;
   dbdtpFVcmto.DataSource    :=DMCXP.dsPagare;
   dbdtpFRecep.DataSource    :=DMCXP.dsPagare;
   dbdtpFComp.DataSource     :=DMCXP.dsPagare;
   dbeTCambio.DataSource     :=DMCXP.dsPagare;
   dbeLote.DataSource        :=DMCXP.dsPagare;
   dblcdPresup.DataSource    :=DMCXP.dsPagare;
   dblcdPresup.LookupTable   :=DMCXP.cdsPresup;
   dblcdCnpEgr.DataSource    :=DMCXP.dsPagare;
   dblcdCnpEgr.LookupTable   :=DMCXP.cdsCnpEgr;
   dbeCuenta.DataSource      :=DMCXP.dsPagare;
   dbeGlosa.DataSource       :=DMCXP.dsPagare;
   dblcCptoDeb.DataSource    :=DMCXP.dsPagare;
   dblcCptoDeb.LookupTable   :=DMCXP.cdsCnpEgr;
   dblcCptoHab.DataSource    :=DMCXP.dsPagare;
   dblcCptoHab.LookupTable   :=DMCXP.cdsCnpEgr;

   dbdtpFVDet.DataSource     :=DMCXP.dsPagare;

   dbgDetalle.DataSource     :=DMCXP.dsLetras;
   dbgCuotas.DataSource      := DMCXP.dsDetCxP;
end;


procedure TFPagares.dbeNoDocExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if dblcCia.Focused   then Exit;
   if dblcTDoc.Focused  then Exit;

   if length(dbeNoDoc.Text)=0 then begin
      dbeNoDoc.SetFocus;
      Raise exception.Create('Falta No. de Documento');
   end;
end;

procedure TFPagares.BuscaPagare;
Var
   xFiltro : String;
begin
   if DMCXP.BuscaPagare( dblcCia.Text, dblcTDoc.Text, dbeNoDoc.Text) then begin
      dbeNoDoc.SetFocus;
      Raise Exception.Create( 'Documento Existe' );
   end;
    DMCXP.cdsPagare.Filter := '';
    DMCXP.cdsPagare.Filtered := False;
    DMCXP.cdsPagare.Insert;
    DMCXP.cdsPagare.FieldByName('CIAID').AsString   := dblcCia.Text;
    DMCXP.cdsPagare.FieldByName('DOCID').AsString   := dblcTDoc.Text;
    DMCXP.cdsPagare.FieldByName('PAGARE').AsString  := dbeNoDoc.Text;
    DMCXP.cdsPagare.FieldByName('PAESTADO').AsString:= 'X';
    DMCXP.cdsPagare.FieldByName('PAUSER').AsString  := DMCXP.wUsuario;
    DMCXP.cdsPagare.FieldByName('PAFREG').AsDateTime:= date;
    DMCXP.cdsPagare.FieldByName('PAHREG').AsDateTime:= time;
    DMCXP.AplicaDatos( DMCXP.cdsPagare, 'Pagare' );
    xFlagGr:=True;

   DMCXP.cdsPagare.Edit;
   If Length(DMCXP.DisplayDescrip('TGE110','DOCDES','DocID',dblcTDoc.Text))>0 then begin;
      if length(edtTDoc.Text)>0 then begin
         DMCXP.cdsPagare.FieldByName('TDIARID').AsString := DMCXP.cdsULTTGE.FieldByName('TDIARID').AsString;
         edtTDiario.Text:=DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',DMCXP.cdsPagare.FieldByName('TDIARID').AsString);
         xFiltro:='TDiarID='+DMCXP.cdsTDoc.fieldbyname('TDIARID').AsString;
         if length(DMCXP.cdsTDoc.fieldbyname('TDIARID2').AsString)>0 then begin
            xFiltro:=xFiltro+'or TDiarID='+''''+DMCXP.cdsTDoc.fieldbyname('TDIARID2').AsString+'''';
         end;
         DMCXP.cdsTDiario.Filter  := '';
         DMCXP.cdsTDiario.Filter  := xFiltro;
         DMCXP.cdsTDiario.Filtered:= true;
         if DMCXP.cdsTDiario.Recordcount=1 then
            dblcTDiario.Enabled:=false
         else begin
            dblcTDiario.Enabled:=true;
         end;
      end;
   end;
   EstadoDeForma( 0, DMCXP.cdsPagare.FieldByName('PAESTADO').AsString, ' ' );
end;

procedure TFPagares.dblcdPresupExit(Sender: TObject);
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;

   if Length(DMCXP.DisplayDescrip('TGE216','PARPRESDES','PARPRESID',dblcdPresup.Text))=0 then
   begin
      dblcdPresup.SetFocus;
      raise exception.Create('Partida Presupuestal Errada');
   end;
end;


procedure TFPagares.dblcdProvEnter(Sender: TObject);
begin
   if DMCXP.wVRN_ProvOrden<>'' then
      DMCXP.cdsProv.IndexFieldNames:=DMCXP.wVRN_ProvOrden
   else begin
      DMCXP.cdsProv.IndexFieldNames:='PROV';
   end;
end;


procedure TFPagares.dblcdProvRucEnter(Sender: TObject);
begin
   DMCXP.cdsProv.IndexFieldNames:='ProvDes';
//   DMCXP.cdsProv.IndexFieldNames:='AUXNOMB';
end;

procedure TFPagares.dblcClAuxExit(Sender: TObject);
var
	xWhere, xSQL : String;
begin
  if xCrea then Exit;
  if bbtnBorra.Focused then Exit;

  xWhere:='ClAuxId='''+dblcClAux.Text+''' and MODULO LIKE ''%'+DMCXP.wModulo+'%''';
  if length(BuscaQry('dspTGE','TGE102','CLAUXDES,CLAUXCP',xWhere,'CLAUXDES'))=0 then
  begin
     dblcClAux.SetFocus;
     Raise Exception.Create('Clase de Auxiliar');
  end;
  Screen.Cursor:=crHourGlass;
  if DMCXP.cdsQry.FieldByName('CLAUXCP').AsString='B' then
  begin
    dblcBanco.Enabled   := False;
    dbeCCBCOOri.Enabled := True;
  end
  else
  begin
    dblcBanco.Enabled   := True;
    dbeCCBCOOri.Enabled := False;

  end;

  DMCXP.cdsPagare.FieldByName('CLAUXID').AsString   :=dblcClAux.Text;
  Filtracds( DMCXP.cdsProv,'Select AUXID PROV,AUXNOMB PROVDES ,AUXABR PROVABR ,AUXRUC PROVRUC from CNT201 Where CLAUXID='''+dblcClAux.Text+'''' );

  if Length(dblcdProv.Text)>0 then begin
     xWhere:='CLAUXID='''+dblcClAux.Text+''' and AUXID='''+dblcdProv.Text+'''';
     if length(BuscaQry('dspTGE','CNT201','AUXID PROV,AUXRUC PROVRUC, AUXNOMB PROVDES',xWhere,'PROVDES'))=0 then
     begin
        dblcdProv.Text   :='';
        dblcdProvRuc.Text:='';
        edtProv.Text:='';
        dblcdprov.SetFocus;
     end
     else begin
        dblcdProv.Text   :=DMCXP.cdsQry.FieldByname('PROV').AsString;
        dblcdProvRuc.Text:=DMCXP.cdsQry.FieldByname('PROVRUC').AsString;
        edtProv.Text     :=DMCXP.cdsQry.FieldByname('PROVDES').AsString;;
     end;
  end;
  if Length(dblcdProv.Text)=0 then dblcdProv.SetFocus;
  Screen.Cursor:=crDefault;
end;

procedure TFPagares.Z2bbtnPreviewClick(Sender: TObject);
var
   xPeriodo, xDiario, xNComprob, xTabla, mes, ano : String;
   xWhere, MesDes, xSQL, xNDetCxP : string;
   SUMA, xTotHaber : Double;
   x10 : Integer;
   xRegAct : TBookMark;
begin
   xDiario :=DMCXP.cdsLetras.FieldByName('TDIARID').AsString;
   xPeriodo:=DMCXP.cdsLetras.FieldByName('CPANOMES').AsString;

   if DMCXP.cdsLetras.RecordCount=0 then begin
      ShowMessage( 'Error : No Existen Letras' );
      Exit;
   end;

   if DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString='S' then
      xTabla:='CNT301'
   else begin

      GeneraDetCxP;

      xTabla:='CNT311';

      DMCXP.cdsLetras.DisableControls;
      xRegAct := DMCXP.cdsLetras.GetBookmark;
      DMCXP.cdsLetras.First;
      While not DMCXP.cdsLetras.Eof do Begin

         DMCXP.GeneraContab( dblcCia.Text, dblcTDiario.Text, DMCXP.cdsLetras.FieldByName('CPANOMES').AsString, DMCXP.cdsLetras.FieldByName('CPNOREG').AsString, Self, 'BP' );

         DMCXP.cdsLetras.Next;
      end;

      DMCXP.cdsLetras.GotoBookmark(xRegAct);
      DMCXP.cdsLetras.FreeBookmark(xRegAct);
      DMCXP.cdsLetras.EnableControls;
   end;

   xNComprob:='';
   xNDetCxP :='';
   DMCXP.cdsLetras.First;
   while not DMCXP.cdsLetras.Eof do begin
      if xNComprob='' then begin
         xNComprob:='( A.CNTCOMPROB='''+DMCXP.cdsLetras.FieldByName('CPNOREG').AsString+'''';
         xNDetCxP :='( A.CPNOREG='''   +DMCXP.cdsLetras.FieldByName('CPNOREG').AsString+'''';
      end
      else begin
         xNComprob:=xNComprob+' or A.CNTCOMPROB='''+DMCXP.cdsLetras.FieldByName('CPNOREG').AsString+'''';
         xNDetCxP :=xNDetCxP +' or A.CPNOREG='''   +DMCXP.cdsLetras.FieldByName('CPNOREG').AsString+'''';
      end;
      DMCXP.cdsLetras.Next;
   end;

   xNComprob:=xNComprob+' ) ';
   xNDetCxP :=xNDetCxP +' ) ';

   xSql:='SELECT  A.*, TGE103.TMONDES, TGE103.TMONABR, '
        +  '0.00 TOTAL, CXP301.PROV, CXP301.PROVDES, CXP301.CPNOREG '
        +'FROM '+xTabla+' A, TGE103, CXP301 '
        +'WHERE A.CIAID='''   +dblcCia.text +''' AND '
        +      'A.CNTANOMM='''+ xperiodo    +''' AND '
        +      'A.TDIARID=''' + xDiario     +''' AND '
        +      xNComprob+' and '
        +      'A.TMONID=TGE103.TMONID  AND '
        +      'A.CNTCOMPROB=CXP301.CPNOREG AND CXP301.CIAID= '+quotedstr(dblcCia.text)+' AND '
        +      'CXP301.CPANOMES='''+xperiodo+''' AND CXP301.TDIARID='+quotedstr(dblcTDiario.text)
        +' ORDER BY A.CNTREG ';
   DMCXP.cdsCxP.Close;
   DMCXP.cdsCxP.DataRequest(xSQL);
   DMCXP.cdsCxP.Open;

   if DMCXP.cdsCxP.recordcount=0 then
      raise exception.Create('No existen Registros Contabilizados para la Consulta');

   XSQL:='SELECT A.CNTCOMPROB, A.CNTDH, SUM(A.CNTMTOORI) TOTAL '
        +'FROM '+xTabla+' A '
        +'WHERE A.CIAID='''+dblcCia.text+''' AND A.TDIARID='''+xDiario+''' AND '
        +      'A.CNTANOMM='''+xperiodo+''' AND '+xNComprob+' and '
        +      DMCXP.wReplacCeros+'(A.CNTFAUTOM,''N'')<>''S'' '
        + 'GROUP BY A.CNTCOMPROB, A.CNTDH '
        + 'ORDER BY A.CNTCOMPROB';
   DMCXP.cdsQRY.Close;
   DMCXP.cdsQRY.DataRequest(xSQL);
   DMCXP.cdsQRY.Open;
   DMCXP.cdsQRY.IndexFieldNames:='CNTCOMPROB';

   DMCXP.cdsCxP.FIRST;
   while not DMCXP.cdsCxP.eof do
   begin
      SUMA:=0;
      DMCXP.CDSQRY.SetKey;
      DMCXP.CDSQRY.fieldbyname('CNTCOMPROB').asstring:=DMCXP.cdsCxP.fieldbyname('CNTCOMPROB').asstring;
      if DMCXP.CDSQRY.GotoKey then
      begin
         DMCXP.cdsCxP.edit;
         DMCXP.cdsCxP.fieldbyname('TOTAL').ASFLOAT:=DMCXP.cdsQry.fieldbyname('TOTAL').ASFLOAT
      end;
      DMCXP.cdsCxP.NEXT;
      SUMA:=0;
   end;
   DMCXP.CDSQRY.IndexFieldNames:='';

   FImpBProvision:=TFImpBProvision.Create(Self);

   with FImpBProvision do begin
   try
      ppdbpPreview.DataSource := DMCXP.dsCxP;
      pprPreview.TEMPLATE.FileName:=ExtractFilePath( application.ExeName ) + wRutaRpt+'\BCxPVoucher.rtm' ;
      pprPreview.template.LoadFromFile ;
      lblTD.caption:=DMCXP.cdsCxP.fieldbyname('TDIARID').asstring;
      lbldiario.caption:=DMCXP.DisplayDescrip2('dspTGE','TGE104','TDIARDES','TDIARID='+quotedstr(DMCXP.cdsCxP.fieldbyname('TDIARID').asstring),'TDIARDES');
      mes:=copy(DMCXP.cdsCxP.fieldbyname('CNTANOMM').asstring,5,2);
      ano:=copy(DMCXP.cdsCxP.fieldbyname('CNTANOMM').asstring,1,4);
      xWhere := 'MESIDR='''+mes+'''';
      mesdes := DMCXP.DisplayDescrip2('dspTGE','TGE181','MESDESL',XWHERE,'MESDESL');
      lblPeriodo.Caption  :=mesdes+' '+ano;
      lblCiaDes.caption:=edtcia.text;
      lblestado.caption:='Contabilizado';
      DMCXP.cdsCxP.First ;
      while not DMCXP.cdsCxP.Eof do
      begin
         If DMCXP.cdsCxP.FieldByName('CNTDH').AsString = 'H' then
            xTotHaber:= xTotHaber+FRound(DMCXP.cdsCxP.Fieldbyname('CNTMTOORI').Value,15,2);
         DMCXP.cdsCxP.Next;
      end;
      DMCXP.cdsCxP.First;
      DMCXP.cdsCxP.IndexFieldNames:='CIAID;CNTANOMM;TDIARID;CNTCOMPROB;CNTREG';
      pprPreview.print;
   finally
      pprPreview.Stop;

      if DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString='S' then
      else begin

         xSql:='Delete FROM CXP302 A '
              +'WHERE A.CIAID='''   + DMCXP.cdsLetras.FieldByName('CIAID').AsString   +''' AND '
              +      'A.DCPANOMM='''+ DMCXP.cdsLetras.FieldByName('CPANOMES').AsString+''' AND '
              +      'A.TDIARID=''' + DMCXP.cdsLetras.FieldByName('TDIARID').AsString +''' AND '
              +      xNDetCxP+' ';
         DMCXP.cdsCxP.Close;
         DMCXP.cdsCxP.DataRequest(xSQL);
         DMCXP.cdsCxP.Execute;

         xSql:='Delete FROM '+xTabla+' A '
              +'WHERE A.CIAID='''   + DMCXP.cdsLetras.FieldByName('CIAID').AsString+''' AND '
              +      'A.CNTANOMM='''+ xperiodo    +''' AND '
              +      'A.TDIARID=''' + xDiario     +''' AND '
              +      xNComprob+' ';
         DMCXP.cdsCxP.Close;
         DMCXP.cdsCxP.DataRequest(xSQL);
         DMCXP.cdsCxP.Execute;
      end;

      x10:=self.componentCount-1;
      while x10>0 do begin
        if self.components[x10].classname='TppGroup' then begin
           self.components[x10].free;
        end;
        x10:=x10-1;
      end;
      DMCXP.cdsCxP.IndexFieldNames:='';

      ppdbpPreview.DataSource := nil ;
      FImpBProvision.free;
   end;
   end;
end;


procedure TFPagares.GeneraDetCxP;
begin

   Filtracds( DMCXP.cdsDetCxP,'Select * from CXP302 Where CIAID=''''' );

   DMCXP.cdsLetras.First;
   while not DMCXP.cdsLetras.Eof do begin
      // Graba el Ingreso a Banco
      DMCXP.cdsDetCxP.Insert;
      DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsLetras.FieldByName('CIAID').AsString;
      DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsLetras.FieldByName('TDIARID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsLetras.FieldByName('CPNOREG').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := DMCXP.cdsLetras.FieldByName('CPAAAA').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsLetras.FieldByName('CPANOMES').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := DMCXP.cdsPagare.FieldByName('PALOTE').AsString;
      DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
      DMCXP.cdsdetCxP.FieldByName('CPTOID').AsString   := DMCXP.cdsPagare.FieldByName('CPTOID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := xCtaConBan;
      DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsLetras.FieldByName('PROV').AsString;
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsLetras.FieldByName('DOCID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := DMCXP.cdsLetras.FieldByName('CPSERIE').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsLetras.FieldByName('CPNODOC').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := DMCXP.cdsPagare.FieldByName('PAGLOSA').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := 'D';
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat  := DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime:= DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:= DMCXP.cdsLetras.FieldByName('CPFVCMTO').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime:= DMCXP.cdsPagare.FieldByName('PAFCOMP').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'P';
      DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := DMCXP.cdsLetras.FieldByName('TMONID').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString    := DMCXP.cdsLetras.FieldByName('CPMM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString    := DMCXP.cdsLetras.FieldByName('CPDD').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString   := DMCXP.cdsLetras.FieldByName('CPTRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString   := DMCXP.cdsLetras.FieldByName('CPSEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString    := DMCXP.cdsLetras.FieldByName('CPSS').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString := DMCXP.cdsLetras.FieldByName('CPAATRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString := DMCXP.cdsLetras.FieldByName('CPAASEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString  := DMCXP.cdsLetras.FieldByName('CPAASS').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  := 1;
      DetCxPUsuario;  // Graba Usuario, Fecha y Hora
      cdsPost( DMCXP.cdsDetCxP );

      // Graba la Deuda
      DMCXP.cdsDetCxP.Insert;
      DMCXP.cdsDetCxP.FieldByName('CIAID').AsString    := DMCXP.cdsLetras.FieldByName('CIAID').AsString;
      DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString  := DMCXP.cdsLetras.FieldByName('TDIARID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString  := DMCXP.cdsLetras.FieldByName('CPNOREG').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString  := DMCXP.cdsLetras.FieldByName('CPAAAA').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString := DMCXP.cdsLetras.FieldByName('CPANOMES').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString  := DMCXP.cdsPagare.FieldByName('PALOTE').AsString;
      DMCXP.cdsDetCxP.FieldByName('TRANSID').AsString  := 'CP';
      DMCXP.cdsDetCxP.FieldByName('CPTOID').AsString   := DMCXP.cdsPagare.FieldByName('CPTOID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CUENTAID').AsString := DMCXP.cdsPagare.FieldByName('CUENTAID').AsString;
      DMCXP.cdsDetCxP.FieldByName('PARPRESID').AsString:= DMCXP.cdsPagare.FieldByName('PARPRESID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString  := dblcClAux.Text;
      DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString := DMCXP.cdsLetras.FieldByName('PROV').AsString;
      DMCXP.cdsDetCxP.FieldByName('DOCID').AsString    := DMCXP.cdsLetras.FieldByName('DOCID').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString  := DMCXP.cdsLetras.FieldByName('CPSERIE').AsString;
      DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString  := DMCXP.cdsLetras.FieldByName('CPNODOC').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPGLOSA').AsString := DMCXP.cdsPagare.FieldByName('PAGLOSA').AsString;
      DMCXP.cdsDetCxP.FieldByName('CCOSID').AsString   := DMCXP.cdsPagare.FieldByName('CCOSID').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString    := 'H';
      DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat  := DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat  := DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat  := DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat  := DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat;
      DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime:= DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime:=DMCXP.cdsLetras.FieldByName('CPFVCMTO').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime:= DMCXP.cdsPagare.FieldByName('PAFCOMP').AsDateTime;
      DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString := 'P';
      DMCXP.cdsDetCxP.FieldByName('TMONID').AsString   := DMCXP.cdsLetras.FieldByName('TMONID').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString    := DMCXP.cdsLetras.FieldByName('CPMM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString    := DMCXP.cdsLetras.FieldByName('CPDD').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString   := DMCXP.cdsLetras.FieldByName('CPTRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString   := DMCXP.cdsLetras.FieldByName('CPSEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString    := DMCXP.cdsLetras.FieldByName('CPSS').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString := DMCXP.cdsLetras.FieldByName('CPAATRI').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString := DMCXP.cdsLetras.FieldByName('CPAASEM').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString  := DMCXP.cdsLetras.FieldByName('CPAASS').AsString;
      DMCXP.cdsDetCxP.FieldByName('DCPREG').AsInteger  := 1;
      DetCxPUsuario;  // Graba Usuario, Fecha y Hora
      cdsPost( DMCXP.cdsDetCxP );

      DMCXP.cdsLetras.Next;
   end;

   DMCXP.cdsDetCxP.DataRequest( 'Select * from CXP302');
   DMCXP.AplicaDatos( DMCXP.cdsDetCxP, 'DetCxP' );
end;

procedure TFPagares.dblcTMonOriExit(Sender: TObject);
begin
   if xCrea then Exit;
//   edtTMonOri.Text:=DMCXP.DisplayDescrip('TGE103','TMONDES','TMonID',dblcTMon.Text);

end;

procedure TFPagares.dblcBancoDestExit(Sender: TObject);
var
   xWhere : string;
begin
   if xCrea then Exit;
   if bbtnBorra.Focused then Exit;
   if dblcdProvRuc.Focused then Exit;
   if dblcdProv.Focused then Exit;

   If Length(dblcBancoDest.Text)=0 then begin
      dblcBancoDest.SetFocus;
      Raise Exception.Create(' Error :  Falta Registrar Banco Destino');
   end;
   xWhere := 'BANCOID='+''''+dblcBancoDest.text+'''';
   BuscaQry('PrvTGE','TGE105','BANCONOM',xWhere,'BANCONOM');
   edtBancoDes.Text := DMCXP.cdsQry.FieldByName('BANCONOM').AsString;
//   edtBancoDes.Text := DMCXP.cdsBanco.FieldByName('BANCONOM').AsString;

   if length(edtBancoDes.Text)>0 then
   begin
      DMCXP.cdsCCBco.Filter:='';
      DMCXP.cdsCCBco.Filter:='BANCOID='+quotedstr(dblcBancoDest.Text)+' AND CIAID='+quotedstr(dblcCia.text);
      DMCXP.cdsCCBco.Filtered:=True;
      dblcCCBco.Enabled:=true;
   end;

end;


procedure TFPagares.dbdtpFVcmtoExit(Sender: TObject);
begin
   if dbdtpFVcmto.Date=0 then
   begin
      ShowMessage('Falta Fecha de Vencimiento');
      dbdtpFVcmto.SetFocus;
      Exit;
   end;
   if dbdtpFVcmto.Date<dbdtpFEmis.Date then
   begin
      ShowMessage('Fecha de Vencimiento debe ser mayor o Igual a Fecha de Emisión');
      dbdtpFVcmto.SetFocus;
      Exit;
   end;

end;

procedure TFPagares.GeneraPagares2;
var
   I  : Integer;
   xDias : double;
    xTotAcum : double;
   xImpInt,xImpCap,xImpCuota : double;
   xTotInt,xTotCap,xTotCuota : double;
   xCuota, xNoReg : String;
   xNRIni : Integer;
   xDiasFV : double;
begin

   If DMCXP.cdsLetras.RecordCount<>DMCXP.cdsPagare.FieldByName('PACUOTAS').AsFloat then begin

      DMCXP.cdsLetras.First;
      While not DMCXP.cdsLetras.Eof do
      begin
         DMCXP.cdsLetras.Delete;
      end;

      xTotAcum  := 0;

      xImpInt   := 0;
      xImpCap   := 0;
      xImpCuota := 0;

      xTotInt   := 0;
      xTotCap   := 0;
      xTotCuota := 0;

      xDiasFV   := (DMCXP.cdsPagare.fieldbyname('PAFVCMTO').AsFloat-DMCXP.cdsPagare.fieldbyname('PAFEMIS').AsFloat)/StrToFloat(dbeCuotas.Text);
      xDiasFV   := Trunc(xDiasFV);

      xDias     := xDiasFV;

      xImpCap   := FRound(DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat/DMCXP.cdsPagare.FieldByName('PACUOTAS').AsFloat,15,2);
      xImpInt   := FRound(xImpCap*(strtoFloat(dbeInteres.text)/100),15,2);
      xImpCuota := FRound(xImpCap+xImpInt,15,2);

      xTAutoNum := DMCXP.DisplayDescrip('TGE104','AUTONUM','TDIARID',dblcTDiario.Text);
      xNRIni    := StrToInt(DMCXP.UltimoRegistro(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes ));

      For i:=1 to DMCXP.cdsPagare.FieldByName('PACUOTAS').AsInteger do begin
          Str( i, xCuota);
          xNoReg :='';
          While Length(xNoReg)=0 do begin
             xNoReg := DMCXP.GrabaUltimoRegistro(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes,xNRIni );
             xNoReg := StrZero( xNoReg,6);
             if not DMCXP.BuscaCxPReg(dblcCia.Text,dblcTDiario.Text,xTAno+xTMes,xNoReg) then begin
                Break;
             end;
             xNoReg:= '';
             xNRIni := StrToInt(DMCXP.UltimoRegistro(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes ));
          end;

          DMCXP.cdsLetras.Insert;
          DMCXP.cdsLetras.FieldByName('PROVDES').AsString   := edtProv.Text; // Drescripcion del Proovedor
          DMCXP.cdsLetras.FieldByName('CIAID').AsString     := DMCXP.cdsPagare.FieldByName('CIAID').AsString;
          DMCXP.cdsLetras.FieldByName('CPANOMES').AsString  := DMCXP.cdsPagare.FieldByName('PAANOMM').AsString;
          DMCXP.cdsLetras.FieldByName('TDIARID').AsString   := DMCXP.cdsPagare.FieldByName('TDIARID').AsString;
          DMCXP.cdsLetras.FieldByName('CPNOREG').AsString   := StrZero( xNoReg ,DMCXP.cdsLetras.FieldByName('CPNOREG').Size);
          DMCXP.cdsLetras.FieldByName('CLAUXID').AsString   := dblcClAux.Text;
          DMCXP.cdsLetras.FieldByName('PROV').AsString      := DMCXP.cdsPagare.FieldByName('PROV').AsString;
          DMCXP.cdsLetras.FieldByName('PROVRUC').AsString   := DMCXP.cdsPagare.FieldByName('PROVRUC').AsString;
          DMCXP.cdsLetras.FieldByName('DOCID').AsString     := DMCXP.cdsPagare.FieldByName('DOCID').AsString;
          DMCXP.cdsLetras.FieldByName('CPSERIE').AsString   := StrZero( xCuota ,3 );
          DMCXP.cdsLetras.FieldByName('CPNODOC').AsString   := DMCXP.cdsPagare.FieldByName('PAGARE').AsString;
          DMCXP.cdsLetras.FieldByName('CPFRECEP').AsDateTime:= DMCXP.cdsPagare.FieldByName('PAFRECEP').AsDateTime;
          DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime := DMCXP.cdsPagare.FieldByName('PAFEMIS').AsDateTime;

          if i=DMCXP.cdsPagare.FieldByName('PACUOTAS').AsInteger then
             DMCXP.cdsLetras.FieldByName('CPFVCMTO').AsDateTime:= DMCXP.cdsPagare.FieldByName('PAFVCMTO').AsDateTime
          else
            DMCXP.cdsLetras.FieldByName('CPFVCMTO').AsDateTime := DMCXP.cdsPagare.FieldByName('PAFEMIS').AsDateTime+xDias;

          DMCXP.cdsLetras.FieldByName('CPFCMPRB').AsDateTime := DMCXP.cdsPagare.FieldByName('PAFCOMP').AsDateTime;
          DMCXP.cdsLetras.FieldByName('TMONID').AsString     := DMCXP.cdsPagare.FieldByName('TMONID').AsString;
          DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat    := DMCXP.cdsPagare.FieldByName('PATCAMB').AsFloat;
          DMCXP.cdsLetras.FieldByName('CPESTADO').AsString   := 'I';
          DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString   := 'N';
          DMCXP.cdsLetras.FieldByName('TCANJEID').AsString   := 'PA';
          DMCXP.cdsLetras.FieldByName('CPFCANJE').AsFloat  := DMCXP.cdsPagare.FieldByName('PAFEMIS').AsFloat+xDias;
          DMCXP.cdsLetras.FieldByName('CPUSER').AsString   := DMCXP.wUsuario;
          DMCXP.cdsLetras.FieldByName('CPFREG').AsDateTime := date;
          DMCXP.cdsLetras.FieldByName('CPHREG').AsDateTime := time;
          DMCXP.cdsLetras.FieldByName('CPAAAA').AsString   := DMCXP.cdsPagare.FieldByName('PAANO').AsString;
          DMCXP.cdsLetras.FieldByName('CPMM').AsString     := DMCXP.cdsPagare.FieldByName('PAMM').AsString;
          DMCXP.cdsLetras.FieldByName('CPDD').AsString     := DMCXP.cdsPagare.FieldByName('PADD').AsString;
          DMCXP.cdsLetras.FieldByName('CPTRI').AsString    := DMCXP.cdsPagare.FieldByName('PATRI').AsString;
          DMCXP.cdsLetras.FieldByName('CPSEM').AsString    := DMCXP.cdsPagare.FieldByName('PASEM').AsString;
          DMCXP.cdsLetras.FieldByName('CPSS').AsString     := DMCXP.cdsPagare.FieldByName('PASS').AsString;
          DMCXP.cdsLetras.FieldByName('CPAATRI').AsString  := DMCXP.cdsPagare.FieldByName('PAAATRI').AsString;
          DMCXP.cdsLetras.FieldByName('CPAASEM').AsString  := DMCXP.cdsPagare.FieldByName('PAAASEM').AsString;
          DMCXP.cdsLetras.FieldByName('CPAASS').AsString   := DMCXP.cdsPagare.FieldByName('PAAASS').AsString;
          DMCXP.cdsLetras.FieldByName('DCPLOTE').AsString  := DMCXP.cdsPagare.FieldByName('PALOTE').AsString;
          DMCXP.cdsLetras.FieldByName('CTATOTAL').AsString := DMCXP.cdsPagare.FieldByName('CUENTAID').AsString;
          DMCXP.cdsLetras.FieldByName('CPTOTOT').AsString  := DMCXP.cdsPagare.FieldByName('CPTOID').AsString;

          //INTERES
{          if i=DMCXP.cdsPagare.FieldByName('PACUOTAS').AsInteger then
             DMCXP.cdsLetras.FieldByName('CPDCTO').AsFloat := FRound(DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat*(StrToFloat(dbeInteres.text)/100)-xTotInt,15,2)
          else
             DMCXP.cdsLetras.FieldByName('CPDCTO').AsFloat := xImpInt;}

          //CAPITAL
{          if i=DMCXP.cdsPagare.FieldByName('PACUOTAS').AsInteger then
             DMCXP.cdsLetras.FieldByName('CPSERVIC').AsFloat := FRound(DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat-xTotCap,15,2)
          else
             DMCXP.cdsLetras.FieldByName('CPSERVIC').AsFloat := xImpCap;    }

          //CUOTA
{          if i=DMCXP.cdsPagare.FieldByName('PACUOTAS').AsInteger then
             DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat :=  FRound(DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat+ FRound(DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat*(StrToFloat(dbeInteres.text)/100),15,2)
                                                               -xTotCuota,15,2)
          else
             DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat := xImpCuota;}

          if i=DMCXP.cdsPagare.FieldByName('PACUOTAS').AsInteger then
             DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat :=  FRound(DMCXP.cdsPagare.FieldByName('PACAPITMO').AsFloat,15,2)
          else
             DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat := xImpCuota;



          If DMCXP.cdsLetras.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then begin
             DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
             DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
             DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
             DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
             DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
             end
          Else begin
             DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
             DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
             DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
             DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
             DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
          end;
          cdsPost( DMCXP.cdsLetras );
          xTotAcum := FRound( xTotAcum + DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat ,15,2 );
          xTotInt   := FRound( xTotInt + DMCXP.cdsLetras.FieldByName('CPDCTO').AsFloat ,15,2 );
          xTotCap   := FRound( xTotCap + DMCXP.cdsLetras.FieldByName('CPSERVIC').AsFloat ,15,2 );
          xTotCuota := FRound( xTotCuota + DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat ,15,2 );
          xDias    := xDias + xDiasFV;
          xNRIni:= xNRIni+1;
      end;
      end
   else begin
      DMCXP.cdsLetras.First;
      While not DMCXP.cdsLetras.Eof do
      Begin
         DMCXP.cdsLetras.Edit;
         DMCXP.cdsLetras.FieldByName('CPFRECEP').AsDateTime:= DMCXP.cdsPagare.FieldByName('PAFRECEP').AsDateTime;
         DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime := DMCXP.cdsPagare.FieldByName('PAFEMIS').AsDateTime;
         DMCXP.cdsLetras.FieldByName('TMONID').AsString    := DMCXP.cdsPagare.FieldByName('TMONID').AsString;
         DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat   := DMCXP.cdsPagare.FieldByName('PATCAMB').AsFloat;
         DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat   := FRound(DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);

         If DMCXP.cdsLetras.FieldByName('TMONID').AsString = DMCXP.wTMonLoc then
         begin
            DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
            DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
         end
         Else
         begin
            DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
            DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
            DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
            DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
         end;

         DMCXP.cdsLetras.FieldByName('DCPLOTE').AsString  := DMCXP.cdsPagare.FieldByName('PALOTE').AsString;
         DMCXP.cdsLetras.FieldByName('CTATOTAL').AsString := DMCXP.cdsPagare.FieldByName('CUENTAID').AsString;
         DMCXP.cdsLetras.FieldByName('CPTOTOT').AsString  := DMCXP.cdsPagare.FieldByName('CPTOID').AsString;
         cdsPost( DMCXP.cdsLetras );
         DMCXP.cdsLetras.Next;
      end;
   end;
end;

procedure TFPagares.dbgDetalleIButtonClick(Sender: TObject);
begin
   pnlRegistro.Visible := True;
   pnlRegistro.BringToFront;
   dbgCuotas.DataSource := DMCXP.dsDetCxP;
   dbgbbtOk.Enabled    := True;
   rgTipo.Enabled      := True;
   dbeDetMonto.Enabled := True;

   
   if DMCXP.cdsDetCxP.RecordCount= 0 then
   begin
      rgTipo.ItemIndex:=0;
      rgTipo.OnClick(Self);
   end
   else
   begin
      rgTipo.ItemIndex:=1;
      rgTipo.OnClick(Self);
   end;


end;

procedure TFPagares.dbgbbtOkClick(Sender: TObject);
var
   i,xNRIni,xNroCuotas : integer;
   xNoReg,xTAutoNum,xAnoMes,xAno,xMes : string;

begin
    xAno := Copy(DMCXP.cdsPagare.FieldByName('PAANOMM').AsString,1,4);
    xMes := Copy(DMCXP.cdsPagare.FieldByName('PAANOMM').AsString,5,2);
    xAnoMes := xAno + xMes;

    xTAutoNum := DMCXP.DisplayDescrip('TGE104','AUTONUM','TDIARID',dblcTDiario.Text);
    xNRIni    := StrToInt(DMCXP.UltimoRegistro(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xAno,xMes ));

    xNoReg :='';
    While Length(xNoReg)=0 do
    begin
       xNoReg := DMCXP.GrabaUltimoRegistro(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes,xNRIni );
       xNoReg := StrZero( xNoReg,6);
       if not DMCXP.BuscaCxPReg(dblcCia.Text,dblcTDiario.Text,xTAno+xTMes,xNoReg) then
       begin
          Break;
       end;
       xNoReg:= '';
       xNRIni := StrToInt(DMCXP.UltimoRegistro(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes ));
    end;

    xNroCuotas := Trunc(DMCXP.cdsPagare.FieldByName('PAFVCMTO').AsFloat-DMCXP.cdsPagare.FieldByName('PAFEMIS').AsFloat/30);
    if FRound((DMCXP.cdsPagare.FieldByName('PAFVCMTO').AsFloat-DMCXP.cdsPagare.FieldByName('PAFEMIS').AsFloat/30),15,2)-xNroCuotas>=0.03 then
       xNroCuotas:= xNroCuotas+1;

    DMCXP.cdsLetras.Insert;
    DMCXP.cdsLetras.FieldByName('PROVDES').AsString    := edtProv.Text; // Drescripcion del Proovedor
    DMCXP.cdsLetras.FieldByName('CIAID').AsString      := DMCXP.cdsPagare.FieldByName('CIAID').AsString;
    DMCXP.cdsLetras.FieldByName('CPANOMES').AsString   := DMCXP.cdsPagare.FieldByName('PAANOMM').AsString;
    DMCXP.cdsLetras.FieldByName('TDIARID').AsString    := DMCXP.cdsPagare.FieldByName('TDIARID').AsString;
    DMCXP.cdsLetras.FieldByName('CPNOREG').AsString    := StrZero( xNoReg ,DMCXP.cdsLetras.FieldByName('CPNOREG').Size);
    DMCXP.cdsLetras.FieldByName('CLAUXID').AsString    := dblcClAux.Text;
    DMCXP.cdsLetras.FieldByName('PROV').AsString       := DMCXP.cdsPagare.FieldByName('PROV').AsString;
    DMCXP.cdsLetras.FieldByName('PROVRUC').AsString    := DMCXP.cdsPagare.FieldByName('PROVRUC').AsString;
    DMCXP.cdsLetras.FieldByName('DOCID').AsString      := DMCXP.cdsPagare.FieldByName('DOCID').AsString;
    DMCXP.cdsLetras.FieldByName('CPSERIE').AsString    := dbeSerie.Text;
    DMCXP.cdsLetras.FieldByName('CPNODOC').AsString    := dbeNDoc.Text;
    DMCXP.cdsLetras.FieldByName('CPFRECEP').AsDateTime := DMCXP.cdsPagare.FieldByName('PAFRECEP').AsDateTime;
    DMCXP.cdsLetras.FieldByName('CPFEMIS').AsDateTime  := DMCXP.cdsPagare.FieldByName('PAFEMIS').AsDateTime;
    DMCXP.cdsLetras.FieldByName('CPFVCMTO').AsDateTime := dbdtpFVDet.Date;

    DMCXP.cdsLetras.FieldByName('CPFCMPRB').AsDateTime := DMCXP.cdsPagare.FieldByName('PAFCOMP').AsDateTime;
    DMCXP.cdsLetras.FieldByName('TMONID').AsString     := DMCXP.cdsPagare.FieldByName('TMONID').AsString;
    DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat    := DMCXP.cdsPagare.FieldByName('PATCAMB').AsFloat;
    DMCXP.cdsLetras.FieldByName('CPESTADO').AsString   := 'I';
    DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString   := 'N';
    DMCXP.cdsLetras.FieldByName('TCANJEID').AsString   := 'PA';
    DMCXP.cdsLetras.FieldByName('CPCANJE').AsString    := dbeNDoc.Text;
    DMCXP.cdsLetras.FieldByName('CPFCANJE').AsDatetime := DMCXP.cdsPagare.FieldByName('PAFEMIS').AsDatetime;
    DMCXP.cdsLetras.FieldByName('CPUSER').AsString     := DMCXP.wUsuario;
    DMCXP.cdsLetras.FieldByName('CPFREG').AsDateTime   := date;
    DMCXP.cdsLetras.FieldByName('CPHREG').AsDateTime   := time;
    DMCXP.cdsLetras.FieldByName('CPAAAA').AsString     := DMCXP.cdsPagare.FieldByName('PAANO').AsString;
    DMCXP.cdsLetras.FieldByName('CPMM').AsString       := DMCXP.cdsPagare.FieldByName('PAMM').AsString;
    DMCXP.cdsLetras.FieldByName('CPDD').AsString       := DMCXP.cdsPagare.FieldByName('PADD').AsString;
    DMCXP.cdsLetras.FieldByName('CPTRI').AsString      := DMCXP.cdsPagare.FieldByName('PATRI').AsString;
    DMCXP.cdsLetras.FieldByName('CPSEM').AsString      := DMCXP.cdsPagare.FieldByName('PASEM').AsString;
    DMCXP.cdsLetras.FieldByName('CPSS').AsString       := DMCXP.cdsPagare.FieldByName('PASS').AsString;
    DMCXP.cdsLetras.FieldByName('CPAATRI').AsString    := DMCXP.cdsPagare.FieldByName('PAAATRI').AsString;
    DMCXP.cdsLetras.FieldByName('CPAASEM').AsString    := DMCXP.cdsPagare.FieldByName('PAAASEM').AsString;
    DMCXP.cdsLetras.FieldByName('CPAASS').AsString     := DMCXP.cdsPagare.FieldByName('PAAASS').AsString;
    DMCXP.cdsLetras.FieldByName('DCPLOTE').AsString    := DMCXP.cdsPagare.FieldByName('PALOTE').AsString;
    DMCXP.cdsLetras.FieldByName('CTATOTAL').AsString   := DMCXP.cdsPagare.FieldByName('CUENTAID').AsString;
    DMCXP.cdsLetras.FieldByName('CPTOTOT').AsString    := DMCXP.cdsPagare.FieldByName('CPTOID').AsString;

    if rgTipo.ItemIndex=0 then//Capital

       DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat := strtoFloat(dbeDetMonto.Text)
    else
       if rgTipo.ItemIndex=1 then//Interes
       begin
          DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat := strtoFloat(dbeDetMonto.Text);
       end;

    If DMCXP.cdsLetras.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
    begin
       DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
       DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
       DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
       DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
       DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat/DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
    end
    Else
    begin
       DMCXP.cdsLetras.FieldByName('CPMTOLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
       DMCXP.cdsLetras.FieldByName('CPMTOEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
       DMCXP.cdsLetras.FieldByName('CPSALORI').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
       DMCXP.cdsLetras.FieldByName('CPSALLOC').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat*DMCXP.cdsLetras.FieldByName('CPTCAMPR').AsFloat,15,2 );
       DMCXP.cdsLetras.FieldByName('CPSALEXT').AsFloat := FRound( DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat,15,2);
    end;
    cdsPost( DMCXP.cdsLetras );
    DMCXP.cdsLetras.Post;

    DMCXP.cdsDetCxP.Insert;
    DMCXP.cdsDetCxP.FieldByName('CIAID').AsString      := DMCXP.cdsPagare.FieldByName('CIAID').AsString;
    DMCXP.cdsDetCxP.FieldByName('DCPANOMM').AsString   := DMCXP.cdsPagare.FieldByName('PAANOMM').AsString;
    DMCXP.cdsDetCxP.FieldByName('DCPANOC').AsString    := Copy(DMCXP.cdsPagare.FieldByName('PAANOMM').AsString,1,4);
    DMCXP.cdsDetCxP.FieldByName('TDIARID').AsString    := DMCXP.cdsPagare.FieldByName('TDIARID').AsString;
    DMCXP.cdsDetCxP.FieldByName('CPNOREG').AsString    := StrZero( xNoReg ,DMCXP.cdsLetras.FieldByName('CPNOREG').Size);
    DMCXP.cdsDetCxP.FieldByName('CLAUXID').AsString    := dblcClAux.Text;
    DMCXP.cdsDetCxP.FieldByName('DCPAUXID').AsString   := DMCXP.cdsPagare.FieldByName('PROV').AsString;
    DMCXP.cdsDetCxP.FieldByName('DOCID').AsString      := DMCXP.cdsPagare.FieldByName('DOCID').AsString;
    DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString    := dbeSerie.Text;
    DMCXP.cdsDetCxP.FieldByName('CPNODOC').AsString    := dbeNDoc.Text;
    DMCXP.cdsDetCxP.FieldByName('CPFEMIS').AsDateTime  := DMCXP.cdsPagare.FieldByName('PAFEMIS').AsDateTime;
    DMCXP.cdsDetCxP.FieldByName('DCPFCOM').AsDateTime  := DMCXP.cdsPagare.FieldByName('PAFCOMP').AsDateTime;
    DMCXP.cdsDetCxP.FieldByName('CPFVCMTO').AsDateTime := dbdtpFVDet.Date;

    DMCXP.cdsDetCxP.FieldByName('TMONID').AsString     := DMCXP.cdsPagare.FieldByName('TMONID').AsString;
    DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat    := DMCXP.cdsPagare.FieldByName('PATCAMB').AsFloat;
    DMCXP.cdsDetCxP.FieldByName('DCPESTDO').AsString   := 'P';
    DMCXP.cdsDetCxP.FieldByName('DCPDH').AsString      := 'D';    
    DMCXP.cdsDetCxP.FieldByName('TCANJEID').AsString   := 'PA';
    DMCXP.cdsDetCxP.FieldByName('CANJE').AsString      := dbeNDoc.Text;
    DMCXP.cdsDetCxP.FieldByName('DCPUSER').AsString    := DMCXP.wUsuario;
    DMCXP.cdsDetCxP.FieldByName('DCPFREG').AsDateTime  := date;
    DMCXP.cdsDetCxP.FieldByName('DCPHREG').AsDateTime  := time;
    DMCXP.cdsDetCxP.FieldByName('DCPMM').AsString      := DMCXP.cdsPagare.FieldByName('PAMM').AsString;
    DMCXP.cdsDetCxP.FieldByName('DCPDD').AsString      := DMCXP.cdsPagare.FieldByName('PADD').AsString;
    DMCXP.cdsDetCxP.FieldByName('DCPTRI').AsString     := DMCXP.cdsPagare.FieldByName('PATRI').AsString;
    DMCXP.cdsDetCxP.FieldByName('DCPSEM').AsString     := DMCXP.cdsPagare.FieldByName('PASEM').AsString;
    DMCXP.cdsDetCxP.FieldByName('DCPSS').AsString      := DMCXP.cdsPagare.FieldByName('PASS').AsString;
    DMCXP.cdsDetCxP.FieldByName('DCPAATRI').AsString   := DMCXP.cdsPagare.FieldByName('PAAATRI').AsString;
    DMCXP.cdsDetCxP.FieldByName('DCPAASEM').AsString   := DMCXP.cdsPagare.FieldByName('PAAASEM').AsString;
    DMCXP.cdsDetCxP.FieldByName('DCPAASS').AsString    := DMCXP.cdsPagare.FieldByName('PAAASS').AsString;
    DMCXP.cdsDetCxP.FieldByName('DCPLOTE').AsString    := DMCXP.cdsPagare.FieldByName('PALOTE').AsString;
    DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat    := strtoFloat(dbeDetMonto.Text);

    If DMCXP.cdsDetCxP.FieldByName('TMONID').AsString=DMCXP.wTMonLoc then
    begin
       DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound( DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat,15,2);
       DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound( DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat/DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,2 );
    end
    Else
    begin
       DMCXP.cdsDetCxP.FieldByName('DCPMOLOC').AsFloat := FRound( DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat*DMCXP.cdsDetCxP.FieldByName('CPTCAMPR').AsFloat,15,2 );
       DMCXP.cdsDetCxP.FieldByName('DCPMOEXT').AsFloat := FRound( DMCXP.cdsDetCxP.FieldByName('DCPMOORI').AsFloat,15,2);
    end;


    cdsPost( DMCXP.cdsDetCxP );
    DMCXP.cdsDetCxP.Post;

    dbgbbtOk.Enabled    := False;
    rgTipo.Enabled      := False;
    dbeDetMonto.Enabled := False;
end;

procedure TFPagares.rgTipoClick(Sender: TObject);
var
    xContInt : integer;
    xMtoCuota,xSaldo : double;
    MtoCredito,Interes,InteresM,NroCuotas,InteresE : double;
begin

   xContInt :=0;
   xMtoCuota := 0;
   dbeDetMonto.Text := '';
   if rgTipo.ItemIndex=0 then//Capital
   begin
      DMCXP.cdsLetras.DisableControls ;
      DMCXP.cdsLetras.First ;
      while not DMCXP.cdsLetras.Eof do
      begin
         if DMCXP.cdsLetras.FieldByName('CPSERIE').AsString='000' then
            xMtoCuota := xMtoCuota+DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat;

         DMCXP.cdsLetras.Next ;

      end;
      DMCXP.cdsLetras.EnableControls ;

      xSaldo := FRound(strtoFloat(dbeImporte.Text) - xMtoCuota,15,2);
      dbeDetMonto.Text := Floattostr(xSaldo);

      if DMCXP.cdsDetCxP.RecordCount>0 then
      begin
         DMCXP.cdsDetCxP.DisableControls;
         DMCXP.cdsDetCxP.First;
         while not DMCXP.cdsDetCxP.Eof do
         begin
             if DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString='000' then
                xContInt := xContInt+1;

             DMCXP.cdsDetCxP.Next;
         end;
         DMCXP.cdsDetCxP.EnableControls;
//         if xContInt>0 then
         if xSaldo=0 then
            raise exception.create('No puede generar otra Cuota con Capital'+#13'Ya se encuentran Generadas');

      end;

      dbdtpFVDet.Date := dbdtpFVcmto.Date;
      dbdtpFVDet.Enabled := False;
      dbeSerie.Text  := '000';
      dbeNDoc.Text   := dbeNoDoc.Text;

   end
   else
   if rgTipo.ItemIndex=1 then//Interes
   begin
{///////////////////////////////////////////////////////////////////////////////////
    // Monto Otorgado - Monto crédito
      MtoCredito:= FRound(strtoFloat(dbeImporte.Text),15,2);

    // Interes
      Interes:= FRound(strtoFloat(dbeInteres.Text),15,2);/100;

    // Interes + 1 para la fórmula
      InteresM:=Interes+1; //FRound(Interes+1,15,3);

      //Número de Cuotas
      NroCuotas:= DMCXP.cdsPagare.FieldByName('PACUOTAINT').AsInteger;

      // Elevando a la potencia n para: (1+I)
      InteresE:= Power(InteresM,NroCuotas); //FRound(Power(InteresM,NroCuotas),15,3);

      //                   n
      // Calculando : [(1+I )]-1
      InteresK:= InteresE-1;//FRound(InteresE-1,15,3);

      // Calculando el Monto de la Cuota
      MtoCuota:= FRound( ( (Interes* ((InteresE)/(InteresK))) *MtoCredito),15,3);
///////////////////////////////////////////////////////////////////////////////////}
      DMCXP.cdsLetras.DisableControls ;
      DMCXP.cdsLetras.First ;
      while not DMCXP.cdsLetras.Eof do
      begin
         if DMCXP.cdsLetras.FieldByName('CPSERIE').AsString='001' then
            xMtoCuota := xMtoCuota+DMCXP.cdsLetras.FieldByName('CPMTOORI').AsFloat;

         DMCXP.cdsLetras.Next ;

      end;
      DMCXP.cdsLetras.EnableControls ;

      xSaldo := FRound(strtoFloat(dbeImporte.Text) - xMtoCuota,15,2);
      dbeDetMonto.Text := Floattostr(xSaldo);

      if DMCXP.cdsDetCxP.RecordCount>0 then
      begin
         DMCXP.cdsDetCxP.DisableControls;
         DMCXP.cdsDetCxP.First;
         while not DMCXP.cdsDetCxP.Eof do
         begin
             if DMCXP.cdsDetCxP.FieldByName('CPSERIE').AsString<>'000' then
                xContInt := xContInt+1;

             DMCXP.cdsDetCxP.Next;
         end;
         DMCXP.cdsDetCxP.EnableControls;

      end;
      if xSaldo=0 then
         raise exception.create('No puede generar otra Cuota con Interes'+#13'Ya se encuentran Generadas');

      dbdtpFVDet.Date := dbdtpFVcmto.Date;
      dbdtpFVDet.Enabled := True;
      dbeSerie.Text      := Strzero(Inttostr(xContInt+1),3);
      dbeNDoc.Text       := dbeNoDoc.Text;
   end;



end;

procedure TFPagares.BitBtn3Click(Sender: TObject);
begin
    pnlRegistro.Visible := False;
end;

procedure TFPagares.bbtnNuevoClick(Sender: TObject);
begin
    dbgbbtOk.Enabled    := True;
    rgTipo.Enabled      := True;
    dbeDetMonto.Enabled := True;
    rgTipo.OnClick(Self); 
end;

procedure TFPagares.dblcClAuxNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
//GAR***************************************************************************
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
//GAR***************************************************************************
end;

procedure TFPagares.dblcCCBcoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
//GAR***************************************************************************
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
//GAR***************************************************************************
end;

procedure TFPagares.dblcTMonNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
//GAR***************************************************************************
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
//GAR***************************************************************************
end;

procedure TFPagares.dblcTDiarioNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
//GAR***************************************************************************
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
//GAR***************************************************************************
end;

procedure TFPagares.FormShow(Sender: TObject);
var
   xsql,xWhere : string;
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );
   
   xCrea := True;

   DMCXP.cdsCCosto.IndexFieldNames :='CCosDes';

   DMCXP.cdsCnpEgr.IndexFieldNames :='CptoDes';

   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );

   // Tipo de Moneda debe ser L o E
   DMCXP.cdsTMon.Filter:='';
   DMCXP.cdsTMon.Filter:='TMon_Loc='+''''+'L'+''''+' or TMon_Loc='+''''+'E'+'''';
   DMCXP.cdsTMon.Filtered:=True;

   // Filtra Tipos de documentos aptos para guardar como Provisión
   DMCXP.cdsTDoc.Filter:='';
   DMCXP.cdsTDoc.Filter:='DOC_FREG='+''''+'T'+''''; // Forma de Registro Provisión
   DMCXP.cdsTDoc.Filtered:=true;

   if DMCXP.wVRN_ProvAutoDD='S' then
      dblcdProv.AutoDropDown:=true
   else begin
      dblcdProv.AutoDropDown:=false;
   end;

   dblcCCBco.Selected.Clear;
   dblcCCBco.Selected.Add('CCBCOID'#9'25'#9'Cuenta Corriente del Banco'#9'F');
   dblcCCBco.Selected.Add('CCBCODES'#9'30'#9'Descripción'#9'F');
   dblcCCBco.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');

   if DMCXP.wModo='A' then
    begin
      InicializaClientDataSet;
      InicializaDatos;
      InicializaPaneles;
      EstadoDeForma( 0, ' ', ' ' );
      dblcCia.SetFocus;
    end
   else
    begin
      xFlagGr          :=False;
      dblcCia.Text     :=DMCXP.cdsPagare.FieldByName('CIAID').AsString;
      edtCia.Text      :=DMCXP.cdsCia.FieldByName('CiaDes').Value;
      dblcTDoc.Text    :=DMCXP.cdsPagare.FieldByName('DOCID').AsString;
      edtTDoc.Text     :=DMCXP.cdsTDoc.fieldbyname('DOCDES').AsString;
      xConta           :=DMCXP.cdsTDoc.fieldbyname('DOCCONTA').AsString;
      dbeNoDoc.Text    :=DMCXP.cdsPagare.FieldByName('PAGARE').AsString;
      dblcdProv.Text   :=DMCXP.cdsPagare.FieldByName('PROV').AsString;

      xWhere:='CLAUXID='''+dblcClAux.Text+''' and AUXID='''+dblcdProv.Text+'''';
      edtProv.Text:= BuscaQry('dspTGE','CNT201','AUXNOMB',xWhere,'AUXNOMB');
//      edtProv.Text     :=DMCXP.DisplayDescrip('TGE201','PROVDES','PROV',dblcdProv.Text);
      edtTDiario.Text  := DMCXP.DisplayDescrip('TGE104','TDIARDES','TDIARID',DMCXP.cdsPagare.FieldByName('TDIARID').AsString);
      edtTMon.Text     := DMCXP.DisplayDescrip('TGE103','TMONDES','TMONID',dblcTMon.Text);
//      edtTMonOri.Text  :=DMCXP.DisplayDescrip('TGE103','TMONDES','TMonID',dblcTMonOri.Text);

      xWhere := 'BANCOID='+''''+dblcBanco.text+'''';
      BuscaQry('PrvTGE','TGE105','BANCONOM',xWhere,'BANCONOM');
      edtBanco.Text := DMCXP.cdsQry.FieldByName('BANCONOM').AsString;

      xWhere := 'BANCOID='+''''+dblcBancoDest.Text+'''';
      BuscaQry('PrvTGE','TGE105','BANCONOM',xWhere,'BANCONOM');
      edtBancoDes.Text := DMCXP.cdsQry.FieldByName('BANCONOM').AsString;

//      edtBanco.Text    :=DMCXP.cdsBanco.FieldByName('BANCONOM').AsString;
      //** 13/09/2001 -pjsv
      xAnoMes := DMCXP.cdsPagare.FieldByName('PAANOMM').AsString;
      //**
      DMCXP.cdsCCBco.Filter:='';
      DMCXP.cdsCCBco.Filter:='BANCOID='+''''+dblcBanco.Text+'''';
      DMCXP.cdsCCBco.Filtered:=True;
      dblcCCBco.Enabled:=true;

      xCtaConBan := DMCXP.cdsCCBco.FieldByName('CTAPRINC').AsString;

      if DMCXP.wVRN_CCosCia='N' then
      	 xSQL:='SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 '
		    			+'Where CCOSMOV='+quotedstr('S')
      else
       	 xSQL:='SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 '
		    			+'Where CCOSMOV='+quotedstr('S')
              +' and CCOSCIAS LIKE ('+quotedstr('%'+dblcCia.Text+'%')+' ) ';

      DMCXP.cdsCCosto.Close;
      DMCXP.cdsCCosto.DataRequest(xSQL);
      DMCXP.cdsCCosto.open;
      DMCXP.cdsCCosto.Filter:='';
      DMCXP.cdsCCosto.Filtered:=False;
      DMCXP.cdsCCosto.IndexFieldNames :='CCOSID';

      if DMCXP.wVRN_CptoCia='N' then
         xSQL:='select * from CXP201 '
      else
         xSQL:='select * from CXP201 '
              +'Where CIAID='+quotedstr(dblcCia.Text);

      DMCXP.cdsCnpEgr.Close;
      DMCXP.cdsCnpEgr.DataRequest( xSQL );
      DMCXP.cdsCnpEgr.Open;

      FiltraCanje;
      If DMCXP.cdsPagare.FieldByName('PAESTADO').AsString='I' then
         EstadoDeForma(0,DMCXP.cdsPagare.FieldByName('PAESTADO').AsString,' ' )
      else
         EstadoDeForma(1,DMCXP.cdsPagare.FieldByName('PAESTADO').AsString,DMCXP.cdsLetras.FieldByName('CP_CONTA').AsString);

   end;
   xCrea := False;
end;

procedure TFPagares.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.
