unit RRHH590;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, wwdbdatetimepicker, Mask, wwdbedit, wwdblook, fcLabel,
  ExtCtrls, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB,
  ppDBPipe, ppEndUsr, ppCtrls, ppPrnabl, ppBands, ppVar,wwClient, oaVariables,
  ppParameter;

type
  TFGenArchBcoxBoleta = class(TForm)
    pnlCierre: TPanel;
    fcLabel1: TfcLabel;
    dblcPeriodo: TwwDBLookupCombo;
    dblcTipBol: TwwDBLookupCombo;
    edtTipBol: TEdit;
    dblcBanco: TwwDBLookupCombo;
    edtnomBanco: TEdit;
    Z2bbtnCancela: TBitBtn;
    Z2bbtnGeneraTxt: TBitBtn;
    lblTipoBoleta: TLabel;
    lblPeriodo: TLabel;
    lblBanco: TLabel;
    sdlgGuardaArchivo: TSaveDialog;
    Z2bbtnImprimir: TBitBtn;
    ppdbRepBancos: TppDBPipeline;
    pprRepBancos: TppReport;
    ppDesigner1: TppDesigner;
    rgOrden: TRadioGroup;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    pplblNroCta: TppLabel;
    pplblTrabajador: TppLabel;
    pplblDNI: TppLabel;
    pplblMoneda: TppLabel;
    pplblImporte: TppLabel;
    pplblCia: TppLabel;
    pplblAreaPersonal: TppLabel;
    pplblTitulo: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppdbNroCta: TppDBText;
    ppdbTrabajador: TppDBText;
    ppdbDNI: TppDBText;
    ppdbMoneda: TppDBText;
    ppdbImporte: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppdbTotImporte: TppDBCalc;
    procedure IniciaDatos;
    procedure dblcTipBolExit(Sender: TObject);
    procedure dblcPeriodoExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure Z2bbtnGeneraTxtClick(Sender: TObject);
    procedure Z2bbtnImprimirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure ValidaBanco(cds : TwwClientDataset);
    function  HallaTotal(cds : TwwClientDataset):Integer;
    function  CheckSum(cds : TwwClientDataset):extended;
    function  ExtraeCuenta(wCuenta : String):String;
  public
    { Public declarations }
  end;

var
  FGenArchBcoxBoleta: TFGenArchBcoxBoleta;

implementation

uses RRHHDM;

{$R *.DFM}

procedure TFGenArchBcoxBoleta.IniciaDatos;
begin
   dblcTipBol.Text:='';
   edtTipBol.Text:='';
   dblcPeriodo.Text:='';
   dblcBanco.Text:='';
   edtNomBanco.Text:='';
   dblcTipBol.SetFocus;
end;

procedure TFGenArchBcoxBoleta.dblcTipBolExit(Sender: TObject);
begin
   if Z2bbtnCancela.focused then exit;

   DMPL.cdsTipBol.SetKey;
   DMPL.cdsTipBol.FieldByName('TIPBOLID').AsString := dblcTipBol.Text;
   if not DMPL.cdsTipBol.GotoKey Then
   begin
      ShowMessage('Tipo de Boleta no es válido');
      edtTipBol.Text := '';
      dblcTipBol.SetFocus;
      exit;
   end;
   edtTipBol.Text := DMPL.cdsTipBol.FieldByName('TIPBOLDES').AsString;

   DMPL.cdsPerBol.Filtered := False;
   DMPL.cdsPerBol.Filter   := 'TIPBOLID ='+QuotedStr(dblcTipBol.Text);
   DMPL.cdsPerBol.Filtered := True;

   DMPL.cdsPerBol.Last;
   dblcPeriodo.Text := DMPL.cdsPerBol.FieldByName('PERBOL').AsString;
end;


procedure TFGenArchBcoxBoleta.dblcPeriodoExit(Sender: TObject);
begin
   if Z2bbtnCancela.focused then exit;

   DMPL.cdsPerBol.SetKey;
   DMPL.cdsPerBol.FieldByName('PERBOL').AsString:=dblcPeriodo.Text;
   if not DMPL.cdsPerBol.Gotokey then
   begin
      ShowMessage('Periodo de Boleta No definido');
      dblcPeriodo.SetFocus;
      exit;
   end;
   if DMPL.cdsPerBol.FieldByName('PERB_CIER').AsString<>'S' then
   begin
      ShowMessage('Periodo de Boleta No está Cerrado');
      dblcPeriodo.SetFocus;
      exit;
   end;
end;

procedure TFGenArchBcoxBoleta.dblcBancoExit(Sender: TObject);
begin
   if Z2bbtnCancela.focused then exit;

   DMPL.cdsBanco.setkey;
   DMPL.cdsBanco.fieldbyname('BANCOID').AsString:=dblcBanco.text;
   if not DMPL.cdsbanco.gotokey then
   begin
      ShowMessage('Banco no es válido');
      edtnombanco.text:='';
      dblcBanco.SetFocus;
      exit;
   end;
   edtNomBanco.text:=DMPL.cdsbanco.fieldbyname('BANCONOM').AsString;
end;

procedure TFGenArchBcoxBoleta.Z2bbtnGeneraTxtClick(Sender: TObject);
var
   xSQL,xRegistro,xNomArch,xImporte : String;
   xRegTxt : tstringlist;
   xRegMN, xRegME : integer;
   xTotMN, xTotME : double;
   xAno, xMes, xDia : word;
   xAnoSys, xMesSys, xDiaSys : word;
   xBcoCia : String;
   sAno, sMes, sDia : String;
begin
// Boletas de Pago
{
   xSQL := 'select Boletas.TRABID,Trab.TRABNOMT,Boletas.BOLMONTO,Trab.TRABBCODEP,Trab.TRABCTADEP, '
          +quotedstr(DMPL.wTMonLoc)+' TMONID, TipoMoneda.TMONABR, Trab.TRABLE TRABDNI '
          +'from RRHH314 Boletas, RRHH201 Trab, TGE103 TipoMoneda '
          +'where Boletas.CIAID='+quotedstr(DMPL.wCia)
          +'  and Boletas.TIPPLAID='+quotedstr(DMPL.wTipPla)
          +'  and Boletas.TIPBOLID='+quotedstr(dblcTipBol.Text)
          +'  and Boletas.PERBOL='+quotedstr(dblcPeriodo.Text)
          +'  and Boletas.RUBTIPO='+quotedstr(DMPL.wRubNeto)
          +'  and Trab.CIAID=Boletas.CIAID and Trab.TIPPLAID=Boletas.TIPPLAID '
          +'  and Trab.TRABID=Boletas.TRABID '
          +'  and Trab.TRABBCODEP='+quotedstr(dblcBanco.text)
          +'  and TipoMoneda.TMONID='+quotedstr(DMPL.wTMonLoc);
}
   xSQL := 'select Boletas.TRABID,Trab.TRABNOMT,Boletas.BOLMONTO,Trab.TRABBCODEP,Trab.TRABCTADEP, '
          +' nvl(TMONJR,'+quotedstr(DMPL.wTMonLoc)+') TMONDEP, '
          +quotedstr(DMPL.wTMonLoc)+' TMONID, TipoMoneda.TMONABR, Trab.TRABLE TRABDNI , to_char(Periodo.PERBFFIN,''DDMMYYYY'') PERBFFIN '
          +'from RRHH314 Boletas, RRHH201 Trab, TGE103 TipoMoneda , RRHH301 Periodo '
          +'where Boletas.CIAID='+quotedstr(DMPL.wCia)
          +'  and Boletas.TIPPLAID='+quotedstr(DMPL.wTipPla)
          +'  and Boletas.TIPBOLID='+quotedstr(dblcTipBol.Text)
          +'  and Boletas.PERBOL='+quotedstr(dblcPeriodo.Text)
          +'  and Boletas.RUBTIPO='+quotedstr(DMPL.wRubNeto)
          +'  and Trab.CIAID=Boletas.CIAID and Trab.TIPPLAID=Boletas.TIPPLAID '
          +'  and Trab.TRABID=Boletas.TRABID '
          +'  and Trab.TRABBCODEP='+quotedstr(dblcBanco.text)
          //
          +'  and Boletas.CIAID=Periodo.CIAID and Boletas.TIPPLAID=Periodo.TIPPLAID '
          +'  and Boletas.TIPBOLID=Periodo.TIPBOLID '
          +'  and Boletas.PERBOL=Periodo.PERBOL '
          //
          +'  and TipoMoneda.TMONID='+quotedstr(DMPL.wTMonLoc);

   xIndice := '';
   if rgOrden.ItemIndex=0 then
      xIndice := 'TRABNOMT'
   else if rgOrden.ItemIndex=1 then
           xIndice := 'TRABCTADEP'
        else
           xIndice := 'TRABID';
   xFiltro := '';
   DMPL.AbreCDS(DMPL.cdsQry5,xSQL,xIndice,xFiltro);

// valida que existan registros para el Banco
   ValidaBanco(DMPL.cdsQry5);

// determina Nro de Registros y totales en MN y ME
   DMPL.cdsQry5.Filter := 'TMONDEP='+quotedstr(DMPL.wTMonLoc);
   DMPL.cdsQry5.Filtered := True;
   xRegMN := DMPL.cdsQry5.RecordCount;
   xTotMN := DMPL.FRound(HallaTotal(DMPL.cdsQry5),15,2);

   DMPL.cdsQry5.Filter := 'TMONDEP='+quotedstr(DMPL.wTMonExt);
   DMPL.cdsQry5.Filtered := True;
   xRegME := DMPL.cdsQry5.RecordCount;
   xTotME := DMPL.FRound(HallaTotal(DMPL.cdsQry5),15,2);

   DMPL.cdsQry5.Filter := '';
   DMPL.cdsQry5.Filtered := False;

// transforma fecha de generación a String
   decodedate(DMPL.cdsPerBol.FieldByName('PERBFFIN').AsDateTime, xAno, xMes, xDia);
   sAno := inttostr(xAno);
   sMes := DMPL.StrZero(inttostr(xMes),2);
   sDia := DMPL.StrZero(inttostr(xDia),2);
   decodedate(DATE, xAnoSys, xMesSys, xDiaSys);
   sAno := inttostr(xAnoSys);
   sMes := DMPL.StrZero(inttostr(xMesSys),2);
   sDia := DMPL.StrZero(inttostr(xDiaSys),2);

   xRegTxt := TStringList.Create;
   try
      xRegTxt.BeginUpdate;

   // CABECERA
      if dblcBanco.Text = '03' then // Banco de Crédito
      begin
         xRegistro:='#1HM19400625508061      S/' ;
         xImporte := DMPL.RellenaCadena(IntToStr(HallaTotal(DMPL.cdsQry5)),15,'0',True) ;
         xRegistro:=xRegistro+xImporte
                   +DMPL.cdsQry5.FieldByName('PERBFFIN').AsString
                   +DMPL.RellenaCadena('PAGO DE HAB. DERRAMA',20,'*',True)
                   +DMPL.RellenaCadena(floattostr(checksum(DMPL.cdsqry5)),15,'0',True)
                   +DMPL.RellenaCadena(inttostr(DMPL.cdsQry5.RecordCount),6,'0',True)
                   +'1'
                   +DMPL.RellenaCadena('',15,' ',True)
                   +'0';
         xRegTxt.Add(xRegistro);
      end ;

      if dblcBanco.Text = '05' then  // Banco Continental
      begin
         xBcoCia := '00262'; // codigo para Derrama Magisterial
         xRegistro:='038010011' // constantes definidas por el formato de Banco
                   +xBcoCia     // código de la compañía otorgada por el Banco
                   +DMPL.RellenaCadena(inttostr(xRegMN),7,'0',False) // número de registros en MN
                   +DMPL.RellenaCadena(floattostr(int(xTotMN)),15,'0',False) // total Remun. en MN
                   +DMPL.RellenaCadena(inttostr(xRegME),7,'0',True) // número de registros en ME
                   +DMPL.RellenaCadena(floattostr(int(xTotME)),15,'0',True) // total Remun. en ME
                   +sAno+sMes+sDia
                   +DMPL.RellenaCadena('',34,' ',True);
         xRegTxt.Add(xRegistro);
      end;

   // DETALLE
      DMPL.cdsQry5.First;
      while not DMPL.cdsQry5.EOF do
      begin
         if dblcBanco.Text = '03' then  // Banco de Crédito
         begin
            xRegistro:=' 2A'
                      +stringreplace(trim(DMPL.cdsQry5.Fieldbyname('TRABCTADEP').Asstring),'-','',[rfReplaceAll])
                      +'      '
                      +DMPL.RellenaCadena(trim(DMPL.cdsQry5.Fieldbyname('TRABNOMT').Asstring),40,' ',True)
                      +'S/';
//            xImporte := DMPL.strZero(floattostr(int(DMPL.cdsQry5.FieldByName('BOLMONTO').AsFloat*100)),15);
            xImporte := DMPL.strZero(floattostr(ROUND(DMPL.cdsQry5.FieldByName('BOLMONTO').AsFloat*100)),15);
            xRegistro:=xRegistro+xImporte
                      +DMPL.RellenaCadena('PAGO DE HAB.EMPLEADO',40,' ',True)
                      +'0'
                      +'DNI'
                      +DMPL.rellenacadena(trim(DMPL.cdsQry5.Fieldbyname('TRABDNI').Asstring),12,' ',True)
                      +'1';
            xRegTxt.Add(xRegistro);
         end;

         if dblcBanco.Text = '05' then  // Banco Continental
         begin
            xRegistro:='0680' // constantes definidas por el formato de Banco
                      +DMPL.RellenaCadena(DMPL.cdsQry5.FieldByName('TRABID').AsString,15,' ',True); // Código Interno del Trabajador
            if DMPL.cdsQry5.FieldByName('TMONDEP').AsString=DMPL.wTMonLoc then
               xRegistro:=xRegistro+'001' // para depósitos en MN
            else
               xRegistro:=xRegistro+'002'; // para depósitos en ME
            xRegistro:=xRegistro
                      +DMPL.RellenaCadena(ExtraeCuenta(DMPL.cdsQry5.FieldByName('TRABCTADEP').AsString),20,' ',False); // Cuenta de Ahorros del trabajador
            xImporte := DMPL.strZero(floattostr(ROUND(DMPL.cdsQry5.FieldByName('BOLMONTO').AsFloat*100)),14);
            xRegistro:=xRegistro+xImporte
                      +sAno+sMes+sDia
                      +DMPL.RellenaCadena('PAGO DE HAB.EMPLEADO',30,' ',True)
                      +DMPL.RellenaCadena('',6,' ',True);
            xRegTxt.Add(xRegistro);
         end;

         if dblcBanco.Text = 'XX' then  // Banco XX
         begin
            xRegistro:=' '
                      +trim(DMPL.cdsQry5.Fieldbyname('TRABCTADEP').Asstring)+'|'
                      +trim(DMPL.cdsQry5.Fieldbyname('TRABNOMT').Asstring)+'|'
                      +trim(DMPL.cdsQry5.Fieldbyname('TMONABR').Asstring)+'|';
//            xImporte := DMPL.strZero(floattostr(int(DMPL.cdsQry5.FieldByName('BOLMONTO').AsFloat*100)),15);
            xImporte := DMPL.strZero(floattostr(ROUND(DMPL.cdsQry5.FieldByName('BOLMONTO').AsFloat*100)),15);
            xRegistro:=xRegistro+xImporte+'|'
                      +'PAGO DE HAB.EMPLEADO                    '+'|'
                      +'0'+'|'
                      +'DNI'+'|'
                      +trim(DMPL.cdsQry5.Fieldbyname('TRABDNI').Asstring)+'|'
                      +'    1';
            xRegTxt.Add(xRegistro);
         end ;
//
         DMPL.cdsQry5.Next;
      end;
      xRegTxt.EndUpdate;

      if dblcBanco.Text='05' then // Banco Continental
      begin
         xNomArch := xBcoCia+sMes+sDia+'.txt';
      end;

      if sdlgGuardaArchivo.Execute then
      begin
         xNomArch := sdlgGuardaArchivo.FileName;
         xRegTxt.SaveToFile(xNomArch);
      end;
   finally
      xRegTxt.Free;
   end;
end;

procedure TFGenArchBcoxBoleta.Z2bbtnImprimirClick(Sender: TObject);
var
   xSQL : String;
begin
// Boletas de Pago
   xSQL := 'select '+quotedstr(dblcBanco.text)+' BANCOID, '+quotedstr(edtnomBanco.text)+' BANCODES, '
          +'Boletas.TRABID,Trab.TRABNOMT,Boletas.BOLMONTO,Trab.TRABBCODEP,Trab.TRABCTADEP, '
          +quotedstr(DMPL.wTMonLoc)+' TMONID, TipoMoneda.TMONABR, Trab.TRABLE TRABDNI '
          +'from RRHH314 Boletas, RRHH201 Trab, TGE103 TipoMoneda '
          +'where Boletas.CIAID='+quotedstr(DMPL.wCia)
          +'  and Boletas.TIPPLAID='+quotedstr(DMPL.wTipPla)
          +'  and Boletas.TIPBOLID='+quotedstr(dblcTipBol.Text)
          +'  and Boletas.PERBOL='+quotedstr(dblcPeriodo.Text)
          +'  and Boletas.RUBTIPO='+quotedstr(DMPL.wRubNeto)
          +'  and Trab.CIAID=Boletas.CIAID and Trab.TIPPLAID=Boletas.TIPPLAID '
          +'  and Trab.TRABID=Boletas.TRABID '
          +'  and Trab.TRABBCODEP='+quotedstr(dblcBanco.text)
          +'  and TipoMoneda.TMONID='+quotedstr(DMPL.wTMonLoc);
   xIndice := '';
   if rgOrden.ItemIndex=0 then
      xIndice := 'TRABNOMT'
   else if rgOrden.ItemIndex=1 then
           xIndice := 'TRABCTADEP'
        else
           xIndice := 'TRABID';
   xFiltro := '';
   DMPL.AbreCDS(DMPL.cdsQry5,xSQL,xIndice,xFiltro);

   pprRepBancos.template.FileName := wRutaRpt + '\BancosBoletaMensual.rtm' ;
   pprRepBancos.template.LoadFromFile;

   pplblCia.Caption := DMPL.wciades;
   pplblAreaPersonal.Caption := DMPL.wAreaPersonal;
   pplblTitulo.Caption := 'Información para '+edtnomBanco.text+' ';

   if dblcTipBol.Text<>'N' then
      pplblTitulo.Caption:=pplblTitulo.Caption+edtTipBol.Text+' '
   else
   begin
      if DMPL.wTipPlaFrec='Semana' then
         pplblTitulo.Caption:=pplblTitulo.Caption+'Semana '
      else
         pplblTitulo.Caption:=pplblTitulo.Caption+'Plla.Mensual ';
   end;
   pplblTitulo.Caption:=pplblTitulo.Caption+'- '+dblcPeriodo.Text;
   pprRepBancos.Print;

//   ppDesigner1.show;
end;

procedure TFGenArchBcoxBoleta.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key := #0;
      perform(CM_Dialogkey, VK_TAB, 0);
   end;
end;

procedure TFGenArchBcoxBoleta.ValidaBanco(cds: TwwClientDataset);
var
    sMensaje : String ;
begin
    if cds.RecordCount = 0 then
       Raise Exception.Create ('No existen Datos para el Banco Seleccionado');
    if dblcBanco.Text <> '03' then
       Exit ;
    cds.First ;
    while not cds.Eof do
    begin
      if cds.FieldByName('TRABCTADEP').IsNull or (Length(Stringreplace(trim(cds.FieldByName('TRABCTADEP').AsString),'-','',[rfReplaceAll])) <> 14) then
         Raise Exception.Create('La Cuenta del Trabajador :'+char(13)+cds.FieldByName('TRABID').AsString+'  '+
                                cds.FieldByName('TRABNOMT').AsString + #13 +
                                'NO tiene 14 dígitos !!Revise!!'+#13+'PROCESO ABORTADO') ;
      if cds.FieldByName('BOLMONTO').isNull or (cds.FieldByName('BOLMONTO').AsCurrency = 0) then
      begin
         Raise Exception.Create( 'El Trabajador ' + #13 +
               cds.FieldByName('TRABID').AsString + '  ' + cds.FieldByName('TRABNOMT').AsString + #13 +
               'Tiene Neto igual a 0.00 !!Revise!! '+#13 + 'PROCESO ABORTADO' );
      end ;

      if length(trim(cds.FieldByName('TRABDNI').AsString))<>8 then
      begin
         sMensaje := sMensaje +#13 + 'El Trabajador ' + #13 +
               cds.FieldByName('TRABID').AsString + '  ' + cds.FieldByName('TRABNOMT').AsString + #13 +
               'No tiene DNI de 8 dígitos' ;
      end ;
      if length(trim(cds.FieldByName('TRABNOMT').AsString))>40 then
      begin
         sMensaje := sMensaje +#13 + 'El Trabajador ' + #13 +
               cds.FieldByName('TRABID').AsString + '  ' + cds.FieldByName('TRABNOMT').AsString + #13 +
               'Tiene un Nombre Mayor de 40 caracteres , será truncado' ;
      end ;
      cds.Next ;
    end ;
    ShowMessage(sMensaje);
end;

function TFGenArchBcoxBoleta.HallaTotal(cds: TwwClientDataset): Integer;
begin
    result := 0;
    cds.first ;
    while not cds.eof do
    begin
       result := result + Round(cds.FieldByName('BOLMONTO').AsFloat*100) ;
       cds.Next ;
    end ;
end;

function TFGenArchBcoxBoleta.CheckSum(cds: TwwClientDataset): extended;
begin
    result := 0 ;
    cds.first ;
    while not cds.eof do
    begin
       result := result + strtoint(copy(Stringreplace(trim(cds.FieldByName('TRABCTADEP').AsString),'-','',[rfReplaceAll]),4,8));
       cds.Next ;
    end ;
    result := result + 62550806 ;
end;

procedure TFGenArchBcoxBoleta.FormCreate(Sender: TObject);
var
   xWhere : String;
begin
   Caption:=wNomAplicacion+' - '+DMPL.wTipPlaDes;

// Tipo de Boleta RRHH106
   if DMPL.cdsTipBol.Active=False then
      DMPL.FiltraCDS(DMPL.cdsTipBol,'RRHH106','*','TIPBOLID','TIPBOLID','TIPBOL_FLG='+quotedstr('S'));

   xWhere:='CIAID='+quotedstr(DMPL.wCia)+' and TIPPLAID='+quotedstr(DMPL.wTipPla);
   DMPL.FiltraCDS(DMPL.cdsPerbol ,'RRHH301','*','PERBOL','PERBOL',xFiltro);  // Periodos de Boleta
   DMPL.FiltraCDS(DMPL.cdsBanco ,'TGE105','*','BANCOID','BANCOID','');

end;

procedure TFGenArchBcoxBoleta.FormShow(Sender: TObject);
begin
   Iniciadatos;
   DMPL.AccesosUsuarios( DMPL.wModulo,DMPL.wUsuario,'2',Screen.ActiveForm.Name );
end;

procedure TFGenArchBcoxBoleta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMPL.CierraCDS(DMPL.cdsQry);
   DMPL.CierraCDS(DMPL.cdsQry5);
   FVariables.w_Num_Formas  := FVariables.w_Num_Formas-1;
   FVariables.w_PL_Registro := False;
   Action := caFree;
end;

function TFGenArchBcoxBoleta.ExtraeCuenta(wCuenta: String): String;
var
   xLargoCadena, i : integer;
   xCaracter : String;
begin
   result := '';
   xLargoCadena := length(wCuenta);
   for i:=1 to xLargoCadena do
   begin
      xCaracter := copy(wCuenta,i,1);
      if xCaracter[1] in ['-',' '] then
      else
         result := result+copy(wCuenta,i,1);
   end;
end;

end.
