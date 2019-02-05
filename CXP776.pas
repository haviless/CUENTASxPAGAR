unit CXP776;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, db, Mant, oaVariables;

type
  TFToolAplica = class(TForm)
    pnGLT: TPanel;
    sbtNC: TSpeedButton;
    Timer2: TTimer;
    procedure sbtNCClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
    procedure NCreditoAplica(Sender: TObject; MantFields: TFields);
    procedure NCreditoActiva;
    function  FiltraDocGrid : Boolean;
  public
    { Public declarations }
    xTipoProv : String;
    GNCredito  : TMant;
    xSelDoc    : String;
  end;

var
  FToolAplica: TFToolAplica;
   xAccesoBotones : Boolean;

implementation

uses CxPDM, CxP222, CxP202, CxP778, CxP001;

{$R *.DFM}

procedure TFToolAplica.sbtNCClick(Sender: TObject);
var
   xSQL : String;
begin
   xTipoProv  :='N';

   if not FiltraDocGrid then Exit;
   //
   NCreditoActiva;

   GNCredito := TMant.Create( Application );
   //GNCredito.ControlGridDisp:= FPrincipal.cgdPrincipal;
   GNCredito.OnCreateMant   := nil; //UbiSitCreate;
   GNCredito.Admin          := DMCXP.wAdmin;
   GNCredito.OnInsert       := nil; //NCreditoInsert;
   GNCredito.OnEdit         := NCreditoAplica;
   GNCredito.OnShow         := nil;
   GNCredito.DComC          := DMCXP.DCom1;
   GNCredito.ClientDataSet  := DMCXP.cdsMovCxP2;
   GNCredito.TableName      := 'CXP301';
   GNCredito.Filter         := xSelDoc+' AND CXP301.CPESTADO=''P''';

   if ( GNCredito.Filter<>'') and (DMCXP.cFilterCiaUser<>'') then
      GNCredito.Filter   := GNCredito.Filter+' and '+DMCXP.cFilterCiaUser
   else
      GNCredito.Filter   := DMCXP.cFilterCiaUser;

   GNCredito.Titulo         := 'Notas de Credito';
   GNCredito.User           := DMCXP.wUsuario;
   GNCredito.Module         := 'CXP' ;
   GNCredito.SectionName    :='CXPNCreditoAp';
   GNCredito.FileNameIni    :='\SOLCXP.INI';

   try
     GNCredito.Execute;
   finally
     {
     DMCXP.cdsProv.Close;
     DMCXP.cdsDetCanje.Close;
     DMCXP.cdsDetCanje.IndexFieldNames:='';
     }
   end;
end;


procedure TFToolAplica.NCreditoAplica(Sender: TObject; MantFields: TFields);
var
   xSql : String;
begin
   xSQL:='Select * from CXP301 '
        +'Where CIAID='''   +MantFields.FieldByName('CIAID').AsString   +''' '
        +  'AND TDIARID=''' +MantFields.FieldByName('TDIARID').AsString +''' '
        +  'AND CPANOMES='''+MantFields.FieldByName('CPANOMES').AsString+''' '
        +  'AND CPNOREG=''' +MantFields.FieldByName('CPNOREG').AsString +''' ';
   DMCXP.cdsMovCxP2.Close;
   DMCXP.cdsMovCxP2.DataRequest( xSQL );
   DMCXP.cdsMovCxP2.Open;

   xSQL:='Select * from CXP308 '
        +'Where CIAID='''   + DMCXP.cdsMovCxP2.FieldByName('CIAID').AsString    +''' '
        +  'AND TCANJEID='''+ DMCXP.cdsMovCxP2.FieldByName('TCANJEID').AsString +''' '
        +  'AND CANJE='''   + DMCXP.cdsMovCxP2.FieldByName('CPCANJE').AsString  +'''';

   DMCXP.cdsCCanje.Close;
   DMCXP.cdsCCanje.DataRequest( xSQL );
   DMCXP.cdsCCanje.Open;

   if (DMCXP.DisplayDescrip2('dspTGE','TGE110','DOC_FREG','DOCID='+quotedstr(DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString)+
                         ' AND DOCMOD='+quotedstr('CXP'),'DOC_FREG') = 'N') or
      (DMCXP.DisplayDescrip2('dspTGE','TGE110','DOCTIPREG','DOCID='+quotedstr(DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString)+
                         ' AND DOCMOD='+quotedstr('CXP'),'DOCTIPREG') = 'NC') then
   begin
      if ( DMCXP.cdsmovcxp2.fieldbyname('CPESTADO').AsString = 'P' ) then
      begin
         xSql:='CIAID='+quotedstr(DMCXP.cdsMovCxP2.fieldbyname('CIAID').AsString)
              + ' and PROV='+quotedstr(DMCXP.cdsMovCxP2.fieldbyname('PROV').AsString)
              + ' and DOCID<>'+quotedstr(DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString)
              + ' AND ( CPESTADO=''P'' ) AND (CPSALLOC > 0 AND CPSALEXT > 0)';
         Filtracds(DMCXP.cdsMovCxP,'Select * from CXP301 Where '+xSql );
         xsql:='CIAID='+quotedstr(DMCXP.cdsMovCxP2.fieldbyname('CIAID').AsString)
              + ' AND TCANJEID='+quotedstr('NC')
              + ' AND CCPCANJE='+quotedstr(DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString);
         Filtracds( DMCXP.cdsDetCanje,'Select * from CXP305 Where '+xSql );
         FCanjeNC := TFCanjeNC.Create( Application );
         FCanjeNC.ShowModal;
         FCanjeNC.Free;
      end
      else
         Raise Exception.Create('La Nota de Crédito debe de estar en Estado ''P''=Pendiente de Aplicar');
   end
   else
      Raise Exception.Create('No Existen Notas de Crédito Registrados para Esta Opcion');
end;


function TFToolAplica.FiltraDocGrid : Boolean;
var
   xFiltro : String;
begin
   DMCXP.cdsTDoc.Filter:='';
   // JORGE
   //      xTipoProv  := 'P'; // para Provisiones (facturas, n/Débito)
   //      xTipoProv  := 'N'; // para Notas de Crédito
   //      xTipoProv  := 'L'; // para Letras
   //	   xTipoProv  := 'T'; // para préstamos de terceros
   //  	   xTipoProv  := 'I'; // pera Intermediación
   //  	   xTipoProv  := 'F'; // Facturas del Exterior

   xFiltro := '(DOC_FREG='+quotedstr(xTipoProv)+' and DOCMOD='+quotedstr('CXP')+')';

   if xTipoProv='N' then
      xFiltro := xFiltro + ' or (DOCTIPREG='+quotedstr('NC')+' and DOCMOD='+quotedstr('CXP')+')' ;

   DMCXP.cdsTDoc.Filter:= xFiltro;
   DMCXP.cdsTDoc.Filtered:=true;

   xSelDoc := '';
   while not DMCXP.cdsTDoc.Eof do
   begin
   	if Length(xSelDoc)=0 then
   		xSelDoc := 'CXP301.DOCID='+''''+DMCXP.cdsTDoc.fieldbyname('DOCID').AsString+''''
   	else
   		xSelDoc := xSelDoc+ ' or CXP301.DOCID='+''''+DMCXP.cdsTDoc.fieldbyname('DOCID').AsString+'''';
   	DMCXP.cdsTDoc.Next;
   end;
   if Length( xSelDoc )=0 then
      Raise Exception.Create('No Existen Tipos de Documentos Registrados para Esta Opcion')
   else
      xSelDoc := '( '+xSelDoc+' ) ';

   Result := True;
end;

procedure TFToolAplica.NCreditoActiva;
begin
 // Filtra Tipos de documentos aptos para guardar como Provisión
   DMCXP.cdsTDoc.Filter:='';
   DMCXP.cdsTDoc.Filter:='DOC_FREG='''+FPrincipal.xTipoProv+''' and DOCMOD=''CXP''';
   DMCXP.cdsTDoc.Filtered:=true;

   // Indexa ClientDataSets
   DMCXP.cdsMovCxP.IndexFieldNames   := 'CIAID;PROV;DOCID;CPSERIE;CPNODOC';
   DMCXP.cdsLetras.IndexFieldNames   := 'CIAID;PROV;DOCID;CPSERIE;CPNODOC';
   DMCXP.cdsCanje.IndexFieldNames    := 'CIAID;PROV;DOCID;CPSERIE;CPNODOC';
   DMCXP.cdsDetCanje.IndexFieldNames := 'CIAID;PROV;DOCID;CPSERIE;CPNODOC';
   DMCXP.cdsTipReg.IndexFieldNames   := 'TREGID';
   DMCXP.cdsCnpEgr.IndexFieldNames   := 'CPTOID';
end;


{

var
   xSql : String;
begin
   if (DMCXP.DisplayDescrip2('dspTGE','TGE110','DOC_FREG','DOCID='+quotedstr(DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString)+
                         ' AND DOCMOD='+quotedstr('CXP'),'DOC_FREG') = 'N') or
      (DMCXP.DisplayDescrip2('dspTGE','TGE110','DOCTIPREG','DOCID='+quotedstr(DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString)+
                         ' AND DOCMOD='+quotedstr('CXP'),'DOCTIPREG') = 'NC') then
   begin
      if ( DMCXP.cdsmovcxp2.fieldbyname('CPESTADO').AsString = 'P' ) then
      begin
         xSql:='CIAID='+quotedstr(DMCXP.cdsMovCxP2.fieldbyname('CIAID').AsString)
              + ' and PROV='+quotedstr(DMCXP.cdsMovCxP2.fieldbyname('PROV').AsString)
              + ' and DOCID<>'+quotedstr(DMCXP.cdsMovCxP2.fieldbyname('DOCID').AsString)
              + ' AND ( CPESTADO=''P'' ) AND (CPSALLOC > 0 AND CPSALEXT > 0)';
         Filtracds(DMCXP.cdsMovCxP,'Select * from CXP301 Where '+xSql );
         xsql:='CIAID='+quotedstr(DMCXP.cdsMovCxP2.fieldbyname('CIAID').AsString)
              + ' AND TCANJEID='+quotedstr('NC')
              + ' AND CCPCANJE='+quotedstr(DMCXP.cdsMovCxP2.fieldbyname('CPCANJE').AsString);
         Filtracds( DMCXP.cdsDetCanje,'Select * from CXP305 Where '+xSql );
         FCanjeNC := TFCanjeNC.Create(self);
         FCanjeNC.ShowModal;
         FCanjeNC.Free;
      end
      else
         Raise Exception.Create('La Nota de Crédito debe de estar en Estado ''P''=Pendiente de Aplicar');
   end
   else
      Raise Exception.Create('No Existen Notas de Crédito Registrados para Esta Opcion');

 }
procedure TFToolAplica.Timer2Timer(Sender: TObject);
begin
   FVariables.w_NombreForma := 'FToolAplica';
   if (DMCXP.wAdmin='G') or (DMCXP.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMCXP.AccesosUsuariosR( DMCXP.wModulo,DMCXP.wUsuario,'2',FToolAplica);
      xAccesoBotones := True;
   end;

end;

end.
