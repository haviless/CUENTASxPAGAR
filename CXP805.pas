unit CXP805;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, wwdbedit, StdCtrls, wwdblook, Buttons, ExtCtrls, wwdbdatetimepicker,
  Spin, ppVar, ppPrnabl, ppClass, ppCtrls, ppBands, ppCache, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, oaVariables;

type
  TFToolVista = class(TForm)
    pnlTool: TPanel;
    Label11: TLabel;
    dblcCia: TwwDBLookupCombo;
    dbeCIA: TwwDBEdit;
    bbtnEjecuta: TBitBtn;
    GroupBox1: TGroupBox;
    dtpFIni: TwwDBDateTimePicker;
    dtpFFin: TwwDBDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    rgEstado: TRadioGroup;
    Timer1: TTimer;
    procedure dblcCiaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnEjecutaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
     xfiltro : String;
  public
    { Public declarations }
  end;

var
  FToolVista: TFToolVista;
  xAccesoBotones : Boolean;

implementation

uses CxPDM, CXP001;

{$R *.DFM}

procedure TFToolVista.dblcCiaExit(Sender: TObject);
begin
	 dbeCia.Text:=DMCXP.DisplayDescrip('TGE101','CIADES','CIAID',dblcCia.Text);
end;

procedure TFToolVista.FormCreate(Sender: TObject);
begin
//  dtpFecha.date:=date;
end;

procedure TFToolVista.bbtnEjecutaClick(Sender: TObject);
var
   xSQL, xCIA, xFINI, xFFIN, xWhere  : String;
   wAno, wMes, wDia : word;
begin
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
   xSQL:='Select * from ( '
        +'select A.CIAID, B.CIADES, A.CPANOMES, A.TDIARID, CPNOREG, C.TDIARDES, '
        +   'A.CLAUXID, D.CLAUXDES, A.PROV, A.PROVRUC, E.PROVDES, '
        +   'PROV_PROC, DESCRIP PROCEDENCIA, DCPLOTE, A.DOCID, A.CPSERIE, '
        +   'A.CPNODOC, CPFCMPRB, CPFEMIS, CPFVCMTO, A.TMONID, '
        +   'G.TMONDES, G.TMONABR, CPTCAMPR, CPESTADO, ESTDOCDES,  CP_CONTA, '
        +   'A.CPMTOORI, A.CPMTOLOC, A.CPMTOEXT, A.CPSALORI, A.CPSALLOC, A.CPSALEXT, '
        +   'A.CPTOTOT, I.CPTODES '
        +'FROM CXP301 A '
        +     'LEFT JOIN CXP201 I ON ( A.CIAID=I.CIAID AND A.CPTOTOT=I.CPTOID ), '
        +   'TGE101 B, TGE104 C, TGE102 D, '
        +   'TGE201 E '
        +     'LEFT JOIN TGE829 F ON ( E.PROV_PROC=F.ID ), '
        +  'TGE103 G, TGE115 H'
        +'WHERE A.CIAID=B.CIAID AND A.TDIARID=C.TDIARID AND A.CLAUXID=D.CLAUXID '
        +  'AND A.CLAUXID=E.CLAUXID AND A.PROV=E.PROV  '
        +  'AND A.TMONID=G.TMONID AND CPESTADO=ESTDOCID '
        +' ) SOLVISTA ';
   end;
   if SRV_D = 'ORACLE' then
   begin
   xSQL:='Select * from ( '
        +'select A.CIAID, B.CIADES, A.CPANOMES, A.TDIARID, CPNOREG, C.TDIARDES, '
        +   'A.CLAUXID, D.CLAUXDES, A.PROV, A.PROVRUC, E.PROVDES, '
        +   'PROV_PROC, DESCRIP PROCEDENCIA, DCPLOTE, A.DOCID, A.CPSERIE, '
        +   'A.CPNODOC, CPFCMPRB, CPFEMIS, CPFVCMTO, A.TMONID, '
        +   'G.TMONDES, G.TMONABR, CPTCAMPR, CPESTADO, ESTDOCDES,  CP_CONTA, '
        +   'A.CPMTOORI, A.CPMTOLOC, A.CPMTOEXT, A.CPSALORI, A.CPSALLOC, A.CPSALEXT, '
        +   'A.CPTOTOT, I.CPTODES '
        +'FROM CXP301 A, TGE101 B, TGE104 C, TGE102 D, TGE201 E, TGE829 F, '
        +  'TGE103 G, TGE115 H, CXP201 I '
        +'WHERE A.CIAID=B.CIAID AND A.TDIARID=C.TDIARID AND A.CLAUXID=D.CLAUXID '
        +  'AND A.CLAUXID=E.CLAUXID AND A.PROV=E.PROV AND E.PROV_PROC=F.ID(+) '
        +  'AND A.TMONID=G.TMONID AND CPESTADO=ESTDOCID '
        +  'AND A.CIAID=I.CIAID(+) AND A.CPTOTOT=I.CPTOID(+) '
        +' ) SOLVISTA ';
   end;

   if dblcCia.Text<>'' then begin
      xCIA:='CIAID='''+dblcCia.Text+''' ';
   end;

   if dtpFIni.Date>0 then begin
      xFINI:='CPFCMPRB>='+DMCXP.wRepFuncDate+''''+FORMATDATETIME(DMCXP.wFormatFecha,dtpFIni.Date)+''') ';
   end;

   if dtpFFin.Date>0 then begin
      xFFIN:='CPFCMPRB<='+DMCXP.wRepFuncDate+''''+FORMATDATETIME(DMCXP.wFormatFecha,dtpFFin.Date)+''') ';
   end;

   xWhere:='WHERE ';
   if rgEstado.ItemIndex=0 then begin
      xWhere:=xWhere+'CPESTADO IN (''I'',''P'',''C'',''E'',''A'') ';
   end;
   if rgEstado.ItemIndex=1 then begin
      xWhere:=xWhere+'CPESTADO=''I''';
   end;
   if rgEstado.ItemIndex=2 then begin
      xWhere:=xWhere+'( CPESTADO=''P'' OR CPESTADO=''C'' ) ';
   end;
   if rgEstado.ItemIndex=3 then begin
      xWhere:=xWhere+'CPESTADO=''C'' ';
   end;
   if rgEstado.ItemIndex=4 then begin
      xWhere:=xWhere+'CPESTADO=''P'' AND CPSALORI>0 ';
   end;

   if (dblcCia.Text<>'') or (dtpFIni.Date>0) or (dtpFFin.Date>0) then begin
      if dblcCia.Text<>'' then begin
         xWhere:=xWhere+' and '+xCIA;
      end;

      if dtpFIni.Date>0 then begin
         xWhere:=xWhere+' and '+xFINI;
      end;

      if dtpFFin.Date>0 then begin
         xWhere:=xWhere+' and '+xFFIN;
      end;
   end;

   xSQL:=xSQL+xWhere+'ORDER BY CIAID, PROV_PROC, PROV, TMONID, CPFCMPRB';

   FPrincipal.GProvision.UsuarioSQL.Clear;
   FPrincipal.GProvision.UsuarioSQL.Add(xSQL);
   FPrincipal.GProvision.NewQuery;
end;

procedure TFToolVista.Timer1Timer(Sender: TObject);
begin
   FVariables.w_NombreForma := 'FToolVista';
   if (DMCXP.wAdmin='G') or (DMCXP.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMCXP.AccesosUsuariosR( DMCXP.wModulo,DMCXP.wUsuario,'2',FToolVista);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

end.
