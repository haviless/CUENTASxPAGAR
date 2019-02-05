unit CxP262;

// Inicio Uso Estándares:   01/08/2011
// Unidad               :   CxP262
// Formulario           :   FOrdenSelec
// Fecha de Creación    :   14/04/2010
// Autor                :   Hugo Noriega
// Objetivo             :   Seleccionar documentos para su cancelación por orden de pago.
//
// Actualizaciones      :
// HPP_201104_CXP  09/08/2011  Validar que no se seleccione un documento cancelado.
// HPC_201107_CXP  10/10/2011  Se implementa la función fg_Valida_Provision que se
//                             encarga de validar si el registro de la provisión
//                             se realizó correctamente.
// HPC_201501_CXP  28/05/2015  Se añade Transferencias Interbancarias
// HPC_201504_CXP  06/10/2015  Se cambia propiedad Border Style a SINGLE al formulario
// HPC_201601_CXP  04/01/2016  Se cambio valor máximo del año del filtro con el año de la fecha del sistema
//                             Se inicializa variable del año asignándole como máximi valor al año de la fecha
//
// HPC_201602_CXP  15/03/2016  DAF_2015001728_CXP_1 Valida Moneda de Documento versus Moneda de Orden de Pago
//                             Inserta las Notas de Crédito en Negativo
// HPC_201604_CXP  09/08/2016  DAF_2016000593 Valida que Fecha de Emisión del Documento no sea mayor que Fecha de Orden de Pago
//                 17/10/2016  DAF_2016001440 Se considera Saldo_Final > 0 en vez de Monto-Pagado
// HPC_201707_CXP              Ajuste en la opción de Nota de Crédito
//
// HPC_201805_CXP  10/08/2018  Ajustes en el Pago cuando tiene Nota de Crédito

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, Wwkeycb, ExtCtrls,
  Spin;

type
  TFOrdenSelec = class(TForm)
    dbgSelec: TwwDBGrid;
    bbtnTranferir: TBitBtn;
    pnlBusca: TPanel;
    lblBusca1: TLabel;
    lblBusca2: TLabel;
    isBusca: TwwIncrementalSearch;
    seMes: TSpinEdit;
    seAno: TSpinEdit;
    Label1: TLabel;
    bbtnBuscar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure bbtnTranferirClick(Sender: TObject);
    procedure dbgSelecTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure isBuscaExit(Sender: TObject);
    procedure bbtnBuscarClick(Sender: TObject);
    procedure dbgSelecDblClick(Sender: TObject);
  private
    { Private declarations }
    //INICIO HPC_201107_CXP
    Function  fg_Valida_Provision(wgCiaid, wgClauxId, wgProv, wgDocId, wgCpSerie, wgCpNodoc :String ) :Boolean ;
    //FIN HPC_201107_CXP
  public
    { Public declarations }
  end;

var
  FOrdenSelec: TFOrdenSelec;

implementation

{$R *.dfm}

// Inicio HPC_201602_CXP
// DAF_2015001728_CXP_1 -- Añade Formulario CXP264 
USES CXPDM, CXP260, CXP264;
// Fin HPC_201602_CXP

procedure TFOrdenSelec.FormActivate(Sender: TObject );
var
   ano, mes, dia : Word;
begin
   dbgSelec.Selected.Clear;
   dbgSelec.Selected.Add('MARCA'#9'3'#9'(x)'#9'F');
   dbgSelec.Selected.Add('CIAID'#9'3'#9'Cía'#9'F');
   dbgSelec.Selected.Add('CPANOMES'#9'6'#9'Periodo'#9'F');
   dbgSelec.Selected.Add('TDIARID'#9'3'#9'TD'#9'F');
   dbgSelec.Selected.Add('CPNOREG'#9'11'#9'No.Reg'#9'F');
   dbgSelec.Selected.Add('CLAUXID'#9'3'#9'Cl.~Aux'#9'F');
   dbgSelec.Selected.Add('PROV'#9'8'#9'Id'#9'F');
   dbgSelec.Selected.Add('PROVDES'#9'22'#9'Razón Social/Nombres'#9'F');
   dbgSelec.Selected.Add('DOCID'#9'3'#9'Doc'#9'F');
   dbgSelec.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
   dbgSelec.Selected.Add('CPNODOC'#9'12'#9'No.~Documento'#9'F');
   dbgSelec.Selected.Add('TMONID'#9'3'#9'TM'#9'F');
   dbgSelec.Selected.Add('CPMTOORI'#9'10'#9'Importe'#9'F');
   dbgSelec.Selected.Add('CPSALORI'#9'10'#9'Saldo'#9'F');
   dbgSelec.Selected.Add('PROVRETIGV'#9'3'#9'Ret'#9'F');
   dbgSelec.SetControlType('MARCA',fctCheckBox,'S;N');

   DecodeDate(date, ano, mes, dia);

// Inicio HPC_201601_CXP
// Se inicializa variable del año asignándole como máximi valor al año de la fecha
   seAno.MaxValue:=Ano;
// Fin HPC_201601_CXP
   seAno.Value:=Ano;
   seMes.Value:=Mes;

   bbtnBuscarClick(Self);
end;

procedure TFOrdenSelec.bbtnTranferirClick(Sender: TObject);
VAR
   xSQL : String;
   nPago, nRete, xTasaRet, nDetra, nTotal : Double;
   nReg : Integer;
begin
   xSQL:='Select TASAMTO, TASACAN, TASADES,TASAFEC from TGE108 Where TASAFLG=''R''';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.Datarequest( xSQL );
   DMCXP.cdsQry.Open;

   xTasaRet := (DMCXP.cdsQry.FieldByname('TASACAN').AsFloat/100);
// Inicio HPC_201402_CXP
  if DMCXP.cdsMovCxP.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
     xTasaRet := 0.03
  else
     xTasaRet := 0.06;
// Fin HPC_201402_CXP

   xSQL:='Select NVL(max( ITEM ),''000'') MAXITEM from CXP_ORD_PAG_DET '
        +' where CIAID =''' + DMCXP.cdsOPago.FieldByname('CIAID').AsString  +''' '
        +'   and NUMERO=''' + DMCXP.cdsOPago.FieldByname('NUMERO').AsString +''' ';
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.Datarequest( xSQL );
   DMCXP.cdsQry.Open;

   nReg:=StrToInt(DMCXP.cdsQry.FieldByname('MAXITEM').AsString);

   DMCXP.cdsMovCxP.First;
   while not DMCXP.cdsMovCxP.Eof do
   begin
      if DMCXP.cdsMovCxP.FieldByName('MARCA').AsString='S' then
      begin
         nRete:=0; nDetra:=0; nTotal:=0;
         if DMCXP.cdsMovCxP.FieldByName('PROVRETIGV').AsString='S' then
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            //nRete:=FRound(DMCXP.cdsMovCxP.FieldByName('CPMTOORI').AsFloat*xTasaRet,15,2);
            nRete:=FRound(DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat*xTasaRet,15,2);
// Fin HPC_201707_CXP
// Inicio HPC_201805_CXP
// Ajuste en la opción de Nota de Crédito
         if DMCXP.cdsMovCxP.FieldByName('DTRPORC').AsFloat>0 then
         begin
            xSQL:=' Select DCPMOORI from ( Select CASE WHEN G.CPNOREG IS NULL THEN ROUND(nvl(A.DCPMOORI,0),2) ELSE ROUND((nvl(A.DCPMOORI,0) - nvl(G.DCPMOORI,0)),2) END DCPMOORI '
                 +' from CXP302 A, DB2ADMIN.TGE201, CXP301 B, CXP305 F, '
                 +' (SELECT X.CIAID, X.CPANOMES, X.TDIARID, X.CPNOREG, X.CLAUXID, X.PROV, X.TCANJEID, X.CPCANJE, Z.CUENTAID, Z.DCPDH, Z.DOCID, Z.CPSERIE, '
                 +' Z.CPNODOC, Z.CPTCAMPR, Z.CPTCAMPA, Z.DCPMOORI, Z.DCPMOLOC, Z.DCPMOEXT  FROM CXP301 X,CXP302 Z '
                 +' WHERE X.CIAID=Z.CIAID and X.TDIARID=Z.TDIARID and X.CPANOMES=Z.DCPANOMM and X.CPNOREG=Z.CPNOREG AND Z.TIPDET=''I4'') G '
                 +' where A.ciaid=B.ciaid and A.tdiarid=B.tdiarid and A.Dcpanomm=B.cpanomes and A.cpnoreg=B.cpnoreg '
                 +'   and A.CIAID='''   +DMCXP.cdsMovCxP.FieldByname('CIAID').AsString   +''' '
                 +'   and A.TDIARID=''' +DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString +''' '
                 +'   and A.DCPANOMM='''+DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString+''' '
                 +'   and A.CPNOREG=''' +DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString +''' '
                 +'   and A.TIPDET=''I4'' '
                 +'   and TGE201.CLAUXID=A.CLAUXID and TGE201.PROV=A.DCPAUXID '
                 +'   and B.CIAID = F.CIAID(+) AND B.DOCID = F.DOCID(+) AND B.CPSERIE = F.CPSERIE(+) AND B.CPNODOC = F.CPNODOC(+) AND F.CIAID = G.CIAID(+) '
                 +'   and F.CLAUXID = G.CLAUXID(+) AND F.PROV = G.PROV(+) AND F.TCANJEID = G.TCANJEID(+) AND F.CCPCANJE = G.CPCANJE(+) ) V ' ;

            DMCXP.cdsQry.Close;
            DMCXP.cdsQry.Datarequest( xSQL );
            DMCXP.cdsQry.Open;
            nDetra:=DMCXP.cdsQry.FieldByname('DCPMOORI').AsFloat;
            xSQL:=' Select DCPMOORI from ( Select CASE WHEN G.CPNOREG IS NULL THEN ROUND(nvl(A.DCPMOORI,0),2) ELSE ROUND((nvl(A.DCPMOORI,0) - nvl(G.DCPMOORI,0)),2) END DCPMOORI '
                 +' from CXP302 A, DB2ADMIN.TGE201, CXP301 B, CXP305 F, '
                 +' (SELECT X.CIAID, X.CPANOMES, X.TDIARID, X.CPNOREG, X.CLAUXID, X.PROV, X.TCANJEID, X.CPCANJE, Z.CUENTAID, Z.DCPDH, Z.DOCID, Z.CPSERIE, '
                 +' Z.CPNODOC, Z.CPTCAMPR, Z.CPTCAMPA, Z.DCPMOORI, Z.DCPMOLOC, Z.DCPMOEXT  FROM CXP301 X,CXP302 Z '
                 +' WHERE X.CIAID=Z.CIAID and X.TDIARID=Z.TDIARID and X.CPANOMES=Z.DCPANOMM and X.CPNOREG=Z.CPNOREG AND Z.TIPDET=''TO'') G '
                 +' where A.ciaid=B.ciaid and A.tdiarid=B.tdiarid and A.Dcpanomm=B.cpanomes and A.cpnoreg=B.cpnoreg '
                 +'   and A.CIAID='''   +DMCXP.cdsMovCxP.FieldByname('CIAID').AsString   +''' '
                 +'   and A.TDIARID=''' +DMCXP.cdsMovCxP.FieldByName('TDIARID').AsString +''' '
                 +'   and A.DCPANOMM='''+DMCXP.cdsMovCxP.FieldByName('CPANOMES').AsString+''' '
                 +'   and A.CPNOREG=''' +DMCXP.cdsMovCxP.FieldByName('CPNOREG').AsString +''' '
                 +'   and A.TIPDET=''TO'' '
                 +'   and TGE201.CLAUXID=A.CLAUXID and TGE201.PROV=A.DCPAUXID '
                 +'   and B.CIAID = F.CIAID(+) AND B.DOCID = F.DOCID(+) AND B.CPSERIE = F.CPSERIE(+) AND B.CPNODOC = F.CPNODOC(+) AND F.CIAID = G.CIAID(+) '
                 +'   and F.CLAUXID = G.CLAUXID(+) AND F.PROV = G.PROV(+) AND F.TCANJEID = G.TCANJEID(+) AND F.CCPCANJE = G.CPCANJE(+)) V ' ;
            DMCXP.cdsQry.Close;
            DMCXP.cdsQry.Datarequest( xSQL );
            DMCXP.cdsQry.Open;
            nTotal:=DMCXP.cdsQry.FieldByname('DCPMOORI').AsFloat;
         end;
// Fin HPC_201805_CXP
         //nPago:=DMCXP.cdsMovCxP.FieldByName('CPMTOORI').AsFloat-nRete-nDetra;
         if nRete>0 then
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
            //nPago:=DMCXP.cdsMovCxP.FieldByName('CPMTOORI').AsFloat-nRete
            nPago:=DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat-nRete
         else
            if DMCXP.cdsMovCxP.FieldByName('DTRPORC').AsFloat>0 then
               //nPago:=nTotal
               nPago:=DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat
            else
               //nPago:=DMCXP.cdsMovCxP.FieldByName('CPMTOORI').AsFloat;
               nPago:=DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat;
// Fin HPC_201707_CXP
         nReg:=nReg+1;
      // Inicio HPC_201602_CXP
      // DAF_2015001728_CXP_1 Inserta las Notas de Crédito en Negativo
         xSQL:='Insert into CXP_ORD_PAG_DET( CIAID, NUMERO, ITEM, CLAUXID, AUXID, DOCID, CPSERIE, CPNODOC, '
              +  'TMONID, CPMTOORI, CPPAGORI, CPSALORI, IMPPAGO, IMPRETE, FREG, HREG, USUARIO, ESTADO ) '
              +'Values( '''+DMCXP.cdsOPago.FieldByName('CIAID').AsString +''', '
              +        ''''+DMCXP.cdsOPago.FieldByName('NUMERO').AsString+''', '
              +        ''''+strzero(IntToStr(nReg),3)+''', '
              +        ''''+DMCXP.cdsMovCxP.FieldByName('CLAUXID').AsString +''', '
              +        ''''+DMCXP.cdsMovCxP.FieldByName('PROV').AsString   +''', '
              +        ''''+DMCXP.cdsMovCxP.FieldByName('DOCID').AsString   +''', '
              +        ''''+DMCXP.cdsMovCxP.FieldByName('CPSERIE').AsString +''', '
              +        ''''+DMCXP.cdsMovCxP.FieldByName('CPNODOC').AsString +''', '
              +        ''''+DMCXP.cdsMovCxP.FieldByName('TMONID').AsString  +''', ';
         if DMCXP.cdsMovCxP.FieldByName('DOCID').AsString<>'07'  then
         Begin
            xSQL := xSQL
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
              +        FloatToStr(DMCXP.cdsMovCxP.FieldByName('CPMTOORI').AsFloat+nDetra)+', '
              +        FloatToStr(DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat)+', '
              +        FloatToStr(DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat)+', '
              +        FloatToStr(nPago)+', ';
// Fin HPC_201707_CXP
         End
         Else
         Begin
            xSQL := xSQL
              +        FloatToStr(DMCXP.cdsMovCxP.FieldByName('CPMTOORI').AsFloat*-1)+', '
              +        FloatToStr(DMCXP.cdsMovCxP.FieldByName('CPPAGORI').AsFloat*-1)+', '
              +        FloatToStr(DMCXP.cdsMovCxP.FieldByName('CPSALORI').AsFloat*-1)+', '
              +        FloatToStr(nPago*-1)+', '
         End;
         xSQL := xSQL
              +        FloatToStr(nRete+nDetra)+', '
              +        'SYSDATE, SYSDATE, '
              +        ''''+DMCXP.wUsuario+''', '
              +        '''P'' '
              +' )';
      // Fin HPC_201602_CXP
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;
      DMCXP.cdsMovCxP.Next;
   end;

   DMCXP.cdsMovCxP.Close;
	DMCXP.cdsMovCxP.Open;

   ShowMessage('Ok.');
end;

procedure TFOrdenSelec.dbgSelecTitleButtonClick(Sender: TObject;
  AFieldName: String);
var
   xTitLabel : String;
begin
   pnlBusca.Visible := True;
   isBusca.SearchField := AFieldName;
   dbgSelec.SetActiveField( AFieldName );
   DMCXP.cdsMovCxP.IndexFieldNames:=AFieldName;
   xTitLabel := dbgSelec.SelectedField.DisplayLabel;
   xTitLabel[ Pos('~',xTitLabel)] := ' ';
   lblBusca2.caption := xTitLabel;
   isBusca.SetFocus;
end;

procedure TFOrdenSelec.isBuscaExit(Sender: TObject);
begin
   pnlBusca.Visible := False;
   dbgSelec.Setfocus;
end;

procedure TFOrdenSelec.bbtnBuscarClick(Sender: TObject);
var
   xSQL, xPeriodo : String;
begin
   dbgSelec.Selected.Clear;
   dbgSelec.Selected.Add('MARCA'#9'3'#9'(x)'#9'F');
   dbgSelec.Selected.Add('CIAID'#9'3'#9'Cía'#9'F');
   dbgSelec.Selected.Add('CPANOMES'#9'6'#9'Periodo'#9'F');
   dbgSelec.Selected.Add('TDIARID'#9'3'#9'TD'#9'F');
   dbgSelec.Selected.Add('CPNOREG'#9'11'#9'No.Reg'#9'F');
   dbgSelec.Selected.Add('CLAUXID'#9'3'#9'Cl.~Aux'#9'F');
   dbgSelec.Selected.Add('PROV'#9'8'#9'Id'#9'F');
   dbgSelec.Selected.Add('PROVDES'#9'22'#9'Razón Social/Nombres'#9'F');
   dbgSelec.Selected.Add('DOCID'#9'3'#9'Doc'#9'F');
   dbgSelec.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
   dbgSelec.Selected.Add('CPNODOC'#9'12'#9'No.~Documento'#9'F');
   dbgSelec.Selected.Add('TMONID'#9'3'#9'TM'#9'F');
   dbgSelec.Selected.Add('CPMTOORI'#9'10'#9'Importe'#9'F');
   dbgSelec.Selected.Add('CPSALORI'#9'10'#9'Saldo'#9'F');
   dbgSelec.Selected.Add('PROVRETIGV'#9'3'#9'Ret'#9'F');
   dbgSelec.SetControlType('MARCA',fctCheckBox,'S;N');

   xPeriodo:=StrZero(IntToStr(seAno.Value),4)+StrZero(IntToStr(seMes.Value),2);

// Inicio HPC_201501_CXP
   xSQL := 'select CIAID, NUMERO, CLAUXID, PROV, BANCOID, CCBCOID, '
         + '       USUREG, FECREG, USUMOD, FECMOD, CPFREG '
         + '  from CXP_ORD_PAG_TINT '
         + ' where CIAID = '+quotedstr(DMCXP.cdsOPago.FieldByname('CIAID').AsString)
         + '   and NUMERO ='+quotedstr(DMCXP.cdsOPago.FieldByname('NUMERO').AsString);
   DMCXP.cdsQry13.Close;
   DMCXP.cdsQry13.DataRequest(xSQL);
   DMCXP.cdsQry13.Open;

   If DMCXP.cdsQry13.RecordCount > 0 Then
   Begin
      xSQL:= ' Select ''N'' MARCA, A.CIAID, CPANOMES, TDIARID, CPNOREG, A.CLAUXID, '
           + '        A.PROV, B.PROVDES, DOCID, CPSERIE, CPNODOC, TMONID, '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
           + '        CPMTOORI, CPPAGORI, CPSALORI, A.PROVRETIGV, a.DTRPORC, CPFEMIS,A.CPTODETRSUNATID,A.TIPOOPERSUNATID,A.FECDEPDET,A.NUMDEPDET '
// Fin HPC_201707_CXP
           + '   from CXP301 A, TGE201 B '
           + '  where A.CIAID='''+DMCXP.cdsOPago.FieldByname('CIAID').AsString+ ''' and CPESTADO IN (''P'') '
           + '    and A.CLAUXID='''+DMCXP.cdsQry13.FieldByname('CLAUXID').AsString+ ''''
           + '    and A.PROV='''+DMCXP.cdsQry13.FieldByname('PROV').AsString+ ''''
           + '    and CPANOMES>='''+xPeriodo+''' '
        // Inicio HPC_201604_CXP
        // 17/10/2016  Se considera Saldo_Final > 0 en ves de Monto-Pagado
        //     + '    and nvl(CPMTOORI,0)-nvl(CPPAGORI,0)=nvl(CPSALORI,0) '
           + '    and nvl(CPSALORI,0)>0 '
        // Fin HPC_201604_CXP
           + '    and A.CLAUXID=B.CLAUXID(+) AND A.PROV=B.PROV(+) '
           + '  Order by CPANOMES DESC, PROVDES, DOCID, CPSERIE, CPNODOC';
      DMCXP.cdsMovCxP.Close;
      DMCXP.cdsMovCxP.Datarequest(xSQL);
      DMCXP.cdsMovCxP.Open;
   End
   Else
   Begin
      xSQL:= ' Select ''N'' MARCA, A.CIAID, CPANOMES, TDIARID, CPNOREG, A.CLAUXID, '
           + '        A.PROV, B.PROVDES, DOCID, CPSERIE, CPNODOC, TMONID, '
// Inicio HPC_201707_CXP
// Ajuste en la opción de Nota de Crédito
           + '        CPMTOORI, CPPAGORI, CPSALORI, A.PROVRETIGV, a.DTRPORC, CPFEMIS,A.CPTODETRSUNATID,A.TIPOOPERSUNATID,A.FECDEPDET,A.NUMDEPDET '
           + '   ,a.CPESTADO '
// Fin HPC_201707_CXP
           + '   from CXP301 A, TGE201 B '
           + '  where A.CIAID='''+DMCXP.cdsOPago.FieldByname('CIAID').AsString+ ''' and CPESTADO IN (''P'') '
           + '    and CPANOMES>='''+xPeriodo+''' '
        // Inicio HPC_201604_CXP
        // 17/10/2016  Se considera Saldo_Final > 0 en ves de Monto-Pagado
        //     + '    and nvl(CPMTOORI,0)-nvl(CPPAGORI,0)=nvl(CPSALORI,0) '
           + '    and nvl(CPSALORI,0)>0 '
        // Fin HPC_201604_CXP
           + '    and A.CLAUXID=B.CLAUXID(+) AND A.PROV=B.PROV(+) '
           + '  order by CPANOMES DESC, PROVDES, DOCID, CPSERIE, CPNODOC';
      DMCXP.cdsMovCxP.Close;
      DMCXP.cdsMovCxP.Datarequest(xSQL);
      DMCXP.cdsMovCxP.Open;
   End;
// Fin HPC_201501_CXP

end;

procedure TFOrdenSelec.dbgSelecDblClick(Sender: TObject);
var
   xSQL : String;
begin
   if DMCXP.cdsMovCxP.FieldByname('MARCA').AsString='N' then
   begin

      // HPP_201104_CXP - Validar que no se seleccione un documento cancelado.
      xSQL:='select A.CIAID, A.NUMERO, A.CLAUXID, A.AUXID, A.DOCID, A.CPSERIE, A.CPNODOC, '
           +       'B.ESTADO, B.FECHA, C.CIADES '
           +'from CXP_ORD_PAG_DET A, CXP_ORD_PAG_CAB B, TGE101 C '
           +'where A.CIAID='''  +DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString  +''' '
           + ' and A.CLAUXID='''+DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString+''' '
           + ' and A.AUXID='''  +DMCXP.cdsMovCxP.fieldbyname('PROV').AsString   +''' '
           + ' and A.DOCID='''  +DMCXP.cdsMovCxP.fieldbyname('DOCID').AsString  +''' ';

      if DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString<>'' then
         xSQL:=xSQL
              + ' and A.CPSERIE='''+DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString+''' ';

      xSQL:=xSQL
           + ' and A.CPNODOC='''+DMCXP.cdsMovCxP.fieldbyname('CPNODOC').AsString+''' '
           + ' and A.CIAID=B.CIAID(+) AND A.NUMERO=B.NUMERO(+) '
           + ' and NOT nvl(B.ESTADO,''I'')=''A'' '
           + ' and A.CIAID=C.CIAID(+) and numdetrac is null';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;

      if DMCXP.cdsQry.Recordcount>0 then
      begin
         MessageDlg('No se puede SELECCIONAR Documento, esta registrado en :'+chr(13)+chr(13)+
                    'Compañía: '+DMCXP.cdsQry.FieldByName('CIADES').AsString+'  /  '+
                    'Orden de Pago: '+DMCXP.cdsQry.FieldByName('NUMERO').AsString+'  /  '+
                    'Fecha : '+DMCXP.cdsQry.FieldByName('FECHA').AsString,
                     mtWarning, [mbOK], 0);
         Exit;
      end;
      // HPP_201104_CXP - Fin
      //INCIO HPC_201107_CXP
      //invocamos a la función que valida la provisión
      If fg_Valida_Provision(DMCXP.cdsMovCxP.fieldbyname('CIAID').AsString,
                             DMCXP.cdsMovCxP.fieldbyname('CLAUXID').AsString,
                             DMCXP.cdsMovCxP.fieldbyname('PROV').AsString,
                             DMCXP.cdsMovCxP.fieldbyname('DOCID').AsString,
                             DMCXP.cdsMovCxP.fieldbyname('CPSERIE').AsString,
                             DMCXP.cdsMovCxP.fieldbyname('CPNODOC').AsString ) = False  Then
      Begin
         Exit;
      End;
      //FIN HPC_201107_CXP
      DMCXP.cdsMovCxP.Edit;
      DMCXP.cdsMovCxP.FieldByname('MARCA').AsString:='S'
   end
   else
   begin
      DMCXP.cdsMovCxP.Edit;
      DMCXP.cdsMovCxP.FieldByname('MARCA').AsString:='N';
   end;

	DMCXP.cdsMovCxP.Post;
end;
//INICIO HPC_201107_CXP
//Función que valida si la provisión fue registrada correctamente
Function  TFOrdenSelec.fg_Valida_Provision(wgCiaid, wgClauxId, wgProv, wgDocId, wgCpSerie, wgCpNodoc :String ) :Boolean ;
Var
xsMensaje, xsSql : String;
Begin
   xsSql := ' SELECT * FROM CXP301 WHERE CIAID = ' + QuotedStr(wgCiaid)  +
                 ' AND CLAUXID = ' + Quotedstr(wgClauxId)  +
                 ' AND PROV = ' + QuotedStr(wgProv) +
                 ' AND DOCID = ' + QuotedStr(wgDocId) +
                 ' AND NVL(CPSERIE,'+QuotedStr('x')+') = NVL(' + QuotedStr(wgCpSerie) +', '+QuotedStr('x')+')'+
                 ' AND CPESTADO = '+QuotedStr('P') +
                 ' AND CPNODOC = ' + QuotedStr(wgCpNodoc);
   DMCXP.cdsQry.Close;
   DMCXP.cdsQry.DataRequest(xsSql);
   DMCXP.cdsQry.Open;
   If (DMCXP.cdsQry.FieldByName('CTATOTAL').AsString = '') Or (DMCXP.cdsQry.FieldByName('CPTOTOT').AsString = '') Then
   Begin
      xsMensaje := 'La Provisión del Documento :' +#13+
                   ' Serie: '+ QuotedStr(wgCpSerie) + #13+
                   ' Número: '+ QuotedStr(wgCpNodoc) + #13+
                   ' No grabó el número de Cuenta Contable ';
      ShowMessage(xsMensaje );
      Result :=  False;
      Exit;
   End;

// Inicio HPC_201602_CXP
// Valida Moneda de Documento versus Moneda de Orden de Pago
   If (DMCXP.cdsQry.FieldByName('TMONID').AsString <> FOrdenPagoCab.dblcTMoneda.Text) Then
   Begin
      xsMensaje := 'La Moneda del Documento es diferente al de la Orden de Pago';
      ShowMessage(xsMensaje );
      Result :=  False;
      Exit;
   End;
// Fin HPC_201602_CXP

// Inicio HPC_201604_CXP
// DAF_2016000593 - Valida que Fecha de Emisión del Documento no sea mayor que Fecha de Orden de Pago
   If (DMCXP.cdsQry.FieldByName('CPFEMIS').AsDateTime > FOrdenPagoCab.dtpFecha.Date) Then
   Begin
      xsMensaje := 'No se permite elegir un documento con Fecha de Emisión mayor a la Fecha de la Orden de Pago'+chr(13)
                  +'Fecha de Emisión Doc.    :  '+datetostr(DMCXP.cdsQry.FieldByName('CPFEMIS').AsDateTime)+chr(13)
                  +'Fecha de Orden de Pago   :  '+datetostr(FOrdenPagoCab.dtpFecha.Date);
      ShowMessage(xsMensaje);
      Result :=  False;
      Exit;
   End;
// Fin HPC_201604_CXP

   Result := True;
End;
//FIN HPC_201107_CXP
end.
