unit CxP006;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, wwdbedit, ComCtrls, Db, Wwdatsrc, wwclient,  Wwkeycb,
  mask, Wwtable, fcButton, fcImgBtn, fcClearPanel, fcButtonGroup, fcLabel;

type
  TFAccesos = class(TForm)
    Label1: TLabel;
    dbeUsuario: TwwDBEdit;
    Label2: TLabel;
    dbePassword: TwwDBEdit;                           
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    pnlConecta: TPanel;
    fcLabel1: TfcLabel;
    fcLabel2: TfcLabel;
    pbTablas: TProgressBar;
    Image2: TImage;
    fcBtnG1: TfcButtonGroup;
    fcbtn1: TfcImageBtn;
    lblTFecha: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    Procedure Accesos;
    procedure FormActivate(Sender: TObject);
    procedure FiltraTabla( xxCds:TwwClientDataSet; xxArchivo,xxCampo:String  );
    procedure AbrirCDS( xxCds:TwwClientDataSet );
    procedure AbrirTabla( xxTabla:TwwTable );
    procedure fcbtn1Click(Sender: TObject);
    procedure dbePasswordExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    xOk : Boolean;
  public
    { Public declarations }
  end;

var
  FAccesos: TFAccesos;
  xVeces  : Integer;
  xSQL2   : String;

implementation

uses CxPDM;

{$R *.DFM}

procedure TFAccesos.fcbtn1Click(Sender: TObject);
begin
   xVeces := xVeces + 1;
   xOk := False;
   DMCXP.cdsUsuarios.SetKey;
   DMCXP.cdsUsuarios.FieldByName('USERID').AsString := dbeUsuario.Text;
   DMCXP.cdsUsuarios.FieldByName('MODULOID').AsString := DMCXP.wModulo;
   If DMCXP.cdsUsuarios.GotoKey then begin
      If Uppercase(DMCXP.DesEncripta(DMCXP.cdsUsuarios.FieldByName('PASSWORD').AsString))=Uppercase(dbePassword.Text) then
      begin
         DMCXP.wGrupo := DMCXP.cdsUsuarios.FieldByName('GRUPOID').AsString;

         DMCXP.wAdmin := '';
         DMCXP.cdsMGrupo.SetKey;
         DMCXP.cdsMGrupo.FieldByName('GRUPOID').AsString := DMCXP.wGrupo;
         If DMCXP.cdsMGrupo.GotoKey then begin
            DMCXP.wAdmin := DMCXP.cdsMGrupo.FieldByName('GRUPOADM').AsString;
         end;
         If DMCXP.wAdmin='G' then
            xOk := True
         else begin
            DMCXP.cdsGrupos.Setkey;
            DMCXP.cdsGrupos.FieldByName('GRUPOID').AsString := DMCXP.wGrupo;
            DMCXP.cdsGrupos.FieldByName('MODULOID').AsString:= DMCXP.wModulo;
            DMCXP.cdsGrupos.FieldByName('TIPO').AsString    := '0';
            If DMCXP.cdsGrupos.GotoKey then begin
               xOk := True
            end
         end
      end
   end;

   If xOk then begin

      fcBtnG1.Visible    := False;
      pnlConecta.Visible := True;
      pnlConecta.Refresh;

      Accesos;

      //FPrincipal :=TFPrincipal.Create(Self);

      FAccesos.Visible := False;
      DMCXP.wUsuario := dbeUsuario.Text;
      {
      With FPrincipal Do
      Try
         DMCXP.wUsuario := dbeUsuario.Text;
         FPrincipal.ShowModal;
         Exit;
      Finally
         FPrincipal.Free;
       }
         FAccesos.Close;
       {
      End;
        }
      end
   else begin
      ShowMessage('No Tiene Acceso al Sistema');
      If xVeces>=3 then begin
         ShowMessage('Error : NO Puede Cargar el Sistema');
         FAccesos.Close;
         Exit;
      end;
      dbeUsuario.SetFocus;
   end;
end;

Procedure TFAccesos.Accesos;
begin
// buscar xCDS en Referencias y se toma ZArchivo

   fcLabel1.Visible  := True;
   fcLabel2.Visible  := True;

   pbTablas.Max      := 18;    // Cantidad de Tablas a Abrir;
   pbTablas.Position := 1;     // Cantidad de Tablas a Abrir;

   fcLabel1.Visible  := True;
   fcLabel2.Visible  := True;

   xSQL2:='Select * from TGE004 Where ModuloId='''+DMCXP.wModulo    +''' and '
         +                           'UserID='''  +dbeUsuario.Text+'''';

   DMCXP.cdsAcceso.Close;
   DMCXP.cdsAcceso.DataRequest( xSQL2 );
   DMCXP.cdsAcceso.Open;

   FiltraTabla( DMCXP.cdsCia,     'TGE101', 'CIAID'    );
   FiltraTabla( DMCXP.cdsTDoc,    'TGE110', 'DOCID'    );
   FiltraTabla( DMCXP.cdsTDiario, 'TGE104', 'TDIARID'  );
   FiltraTabla( DMCXP.cdsTMon,    'TGE103', 'TMONID'   );
   FiltraTabla( DMCXP.cdsBanco,   'TGE105', 'BANCOID'  );
   FiltraTabla( DMCXP.cdsCCBco,   'TGE106', 'CCBCOID'  );
   FiltraTabla( DMCXP.cdsFPago,   'TGE112', 'FPAGOID'  );
   FiltraTabla( DMCXP.cdsTipReg,  'TGE113', 'TREGID'   );
   FiltraTabla( DMCXP.cdsClAux,   'TGE102', 'CLAUXID'  );

   xSQL2:='SELECT * FROM CXP201'
         +' where '+DMCXP.wReplacCeros+'(NIVELMOV,'+quotedstr('')+')='+quotedstr('S');
//         +' order by CUENTAID';
   DMCXP.cdsCnpEgr.Close;
   DMCXP.cdsCnpEgr.DataRequest( xSQL2 );
   DMCXP.cdsCnpEgr.Open;
   pbTablas.Position:=pbTablas.Position+1;

//   FiltraTabla( DMCXP.cdsTipPre,  'PPRES101', 'TIPRESID');
//   FiltraTabla( DMCXP.cdsPresup,  'PPRES201', 'PARPRESID');

   FiltraTabla( DMCXP.cdsNivel,   'CNT202', 'NIVEL'    );
   AbrirCDS(   DMCXP.cdsDoc2     );
   pbTablas.Position:=pbTablas.Position+1;
end;

procedure TFAccesos.AbrirCDS( xxCds:TwwClientDataSet );
begin
   xxCds.Open;
   pbTablas.Position := pbTablas.Position + 1;
end;


procedure TFAccesos.AbrirTabla( xxTabla:TwwTable );
begin
   xxTabla.Open;
   pbTablas.Position := pbTablas.Position + 1;
end;


procedure TFAccesos.FiltraTabla( xxCds:TwwClientDataSet; xxArchivo,xxCampo:String  );
var
   xFiltro, xxFiltro2 : String;
begin
   DMCXP.cdsAcceso.Filtered := False;
   DMCXP.cdsAcceso.Filter   := '';
   DMCXP.cdsAcceso.Filter   := 'NTabla='+''''+xxArchivo+'''';
   DMCXP.cdsAcceso.Filtered := True;

   xFiltro := '';
   DMCXP.cdsAcceso.First;
   while not DMCXP.cdsAcceso.Eof do begin
      If Length(xFiltro)=0 then
         xFiltro:=xxCampo+'='+''''+DMCXP.cdsAcceso.FieldByName('CODIGO').AsString+''''
      else
         xFiltro:=xFiltro+' or '+xxCampo+'='+''''+DMCXP.cdsAcceso.FieldByName('CODIGO').AsString+'''';

      DMCXP.cdsAcceso.Next;
   end;

   xSQL2:='';
   xxFiltro2:='';
   if xxCds.Fields.FindField( 'MODULO' )<>Nil then
      xxFiltro2:='MODULO LIKE '+''''+'%'+DMCXP.wModulo+'%'+'''';

   if Length(xFiltro)>0 then begin
      xSQL2 := 'Select * from '+ xxArchivo+' Where '+xFiltro;
   end;

   if Length(xxFiltro2)>0 then begin
      if pos('WHERE',xSQL2)>0 Then
         xSQL2:=xSQL2+ ' AND ('  +xxFiltro2+')'
      else
         xSQL2:='Select * from '+ xxArchivo+' WHERE ('+xxFiltro2+')'
   end;

   xxCds.Close;

   if Length(xSQL2)>0 then xxCds.DataRequest( xSQL2 );

   xxCds.Open;

   pbTablas.Position := pbTablas.Position + 1;
end;



procedure TFAccesos.FormCreate(Sender: TObject);
begin
   xVeces := 0;
   dbeUsuario.Text := '';
   if DateS>StrToDAte(lblTFecha.Caption) then
   begin
//      Application.Terminate;
   end;
end;

procedure TFAccesos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFAccesos.FormActivate(Sender: TObject);
begin
//   fSplash.Free;
	dbeUsuario.SetFocus;
end;


procedure TFAccesos.dbePasswordExit(Sender: TObject);
begin
//   fcBtnG1.SetFocus;
//   fcBtn1.SetFocus;
   fcbtn1Click(Sender);
end;


procedure TFAccesos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if not xOk then
      DMCXP.wUsuario:='';
end;

procedure TFAccesos.FormShow(Sender: TObject);
begin
   xOk := False;
end;

end.

