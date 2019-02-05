unit CXP230;

// Actualizaciones    :
// HPC_201501_CXP  24/04/2015  Importación de Recibos por Honorarios Electrónicos.
// HPC_201503_CXP  07/09/2015  Se agrega la palabra DÓLARES
// HPC_201602_CXP  14/04/2016  DAF_2016000190_CXP_1 Diferencia SOLES de NUEVOS SOLES

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, wwdbedit, Wwdbspin, StdCtrls, Buttons, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, StrContainer, DB, wwdblook, Wwdbdlg,
  Wwkeycb;

type
  TFImpRecHonElect = class(TForm)
    pnlCabecera: TPanel;
    grbExtBanDatos: TGroupBox;
    edtRutaArchivo: TEdit;
    lblPeriodo: TLabel;
    dbgDatosdImportados: TwwDBGrid;
    dbeAnoMM: TwwDBEdit;
    pbProgreso: TProgressBar;
    odlgSeleccionarArchivo: TOpenDialog;
    btnBuscarArchivo: TButton;
    lblArchivoTxt: TLabel;
    edtLogResultado: TMemo;
    pbProgreso2: TProgressBar;
    gbArchivosImport: TGroupBox;
    dbgDatos: TwwDBGrid;
    bbtnProcesar: TBitBtn;
    gbFiltroDetalle: TGroupBox;
    rbTodos: TRadioButton;
    rbFaltantes: TRadioButton;
    lblNroRegistros: TLabel;
    gbFiltroBusqueda: TGroupBox;
    lblBusca: TLabel;
    isBusca: TwwIncrementalSearch;
    procedure dbeAnoMMExit(Sender: TObject);
    procedure btnBuscarArchivoClick(Sender: TObject);
    procedure fg_ProcesarImportacion(wgNombreArchivo: String);
    procedure fg_ProcesarArchivo(wgNombreArchivo: String);
    Procedure fg_AsignaArreglo(wgLineaTexto, wgDelimitador: String; Var wgArregloCampos: Array Of String);
    procedure FormShow(Sender: TObject);
    Function fg_ValidaFormato(wgLinea: Integer; Var wgArregloCampos: Array Of String; Var wgLogValidacion: String): Boolean;
    Procedure fg_InsertaRegistro(Var wgArregloCampos: Array Of String; wgNumeroLinea: Integer);
    Procedure fg_InsertaRegistroImportados(wgNombreArchivo, wgPeriodo: String);
    Procedure fg_ActualizaRegistroImportados(wgNombreArchivo, wgPeriodo: String);
    procedure bbtnProcesarClick(Sender: TObject);
    procedure dbgDatosdImportadosCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDatosdImportadosDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbTodosClick(Sender: TObject);
    procedure rbFaltantesClick(Sender: TObject);
    procedure dbgDatosdImportadosTitleButtonClick(Sender: TObject;
      AFieldName: String);
    function UltimoRegistroImportado( xPeriodo,xNombreArchivo:String ):Double;
  private
    { Private declarations }
    Procedure ObtenerReciboPeriodo;
  public
    xTotalReg: Double;
    { Public declarations }
  end;

var
   FImpRecHonElect: TFImpRecHonElect;
   xsDelimitador : String;
   xsArchivo: String;
   xnLinea: Integer;
   xSQL : String;

implementation

uses CxPDM, CXP231;

{$R *.dfm}

procedure TFImpRecHonElect.dbeAnoMMExit(Sender: TObject);
begin
   If length(dbeAnoMM.Text) = 0 Then
   Begin
      ShowMessage('Falta Ingresar Periodo');
      dbeAnoMM.SetFocus;
      Exit
   End;

   If length(dbeAnoMM.Text) < 6 Then
   Begin
      ShowMessage('Periodo No Valido');
      dbeAnoMM.SetFocus;
      Exit
   End;

   If (copy(dbeAnoMM.Text,5,2) < '01') or
      (copy(dbeAnoMM.Text,5,2) > '12') Then
   Begin
      ShowMessage('Mes incorrecto, reintente');
      dbeAnoMM.SetFocus;
      Exit
   End;
   ObtenerReciboPeriodo;
end;

procedure TFImpRecHonElect.btnBuscarArchivoClick(Sender: TObject);
Begin
   xsArchivo := '';
   If Not odlgSeleccionarArchivo.Execute Then Exit;
   xsArchivo := odlgSeleccionarArchivo.FileName;
   edtRutaArchivo.Text := xsArchivo;
end;

procedure TFImpRecHonElect.fg_ProcesarImportacion(wgNombreArchivo: String);
Var
   xsArregloCampos: Array[1..24] Of String;
   xSQL: String;
   xsLineaTexto: String;
   xsLogValidacion: String;
   xbResultado: Boolean;
   xnI: Integer;
   xdFechaProceso: TDate;
Begin
   xSQL := 'Select IDEREG, NOMARC, PERIODO, FECIMPARC, CANTOTREG, '
         + '       USUREG, CANTOTIMP, ESTADO, USUMOD, CPFREG, FECREG, FECMOD '
         + '  from CXP_REC_HON_ELEC '
         + ' where PERIODO = '+quotedstr(dbeAnoMM.Text)
         + '   and NOMARC ='+quotedstr(wgNombreArchivo);
   DMCXP.cdsQry12.Close;
   DMCXP.cdsQry12.DataRequest(xSQL);
   DMCXP.cdsQry12.Open;

// se valida con Cia 02 - Sede Central
   DMCXP.wModo := 'A';

   If DMCXP.cdsQry12.RecordCount = 0 then
      fg_InsertaRegistroImportados(wgNombreArchivo, Trim(dbeAnoMM.Text))
   else
      fg_ActualizaRegistroImportados(wgNombreArchivo, Trim(dbeAnoMM.Text));
end;

procedure TFImpRecHonElect.fg_ProcesarArchivo(wgNombreArchivo: String);
Var
   xsArregloCampos: Array[1..24] Of String;

   xsLineaTexto: String;
   xsLogValidacion: String;
   xbResultado: Boolean;
   xslArchivoCVS: TstringList;
   xnI: Integer;
Begin
   xSQL := 'Select '
         + '       ''12'' CIA, ''123456'' ANOMES, ''12''TDIARIO, ''1234567890'' NOREG, 0 CORRELATIVO,'
         + '       trunc(sysdate) CPFEMIS, ' // Fecha de Emisión
         + '       DOCID, ' // Tipo de Documento por Pagar (02 - Recibo de Honorarios Profesionales)
         + '       CPSERIE, ' // Serie del Recibo por Honorarios
         + '       CPNODOC, ' // Número de Documento
         + '       CPESTADO, ' // Estado del Documento
         + '       ''6'' TIPDOCPROV, ' // Tipo de Documento de Identidad del Trabajador Independiente
         + '       PROVRUC, ' // RUC del Trabajador Independiente
         + '       PROVDES, ' // Nombre del Trabajador Independiente
         + '       ''A'' TIPORENTA, ' // Tipo de Renta que Distingue a los Funcionarios Públicos
         + '       ''12'' ES_GRATUITO, ' // Indicador si es GRATUITO
         + '       ''1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'' CPGLOSA, ' // Glosa
         + '       ''1234567890'' TMONID, '
         + '       0.00 CPGRAVAD, '  // Monto Gravado
         + '       0.00 CPIGV, ' // Renta de 4ta Categoría
         + '       0.00 CPMTOORI, ' // Monto Total
         + '       0.00 CPSALORI, ' // Monto Neto
         + '       ''N'' ENVIADO_A_CXP, '
         + '       ''1234'' CCOSID '
         + '  from CXP301 '
         + ' where 1<>1 ';
   DMCXP.cdsQry2.Close;
   DMCXP.cdsQry2.DataRequest(xSQL);
   DMCXP.cdsQry2.Open;

   xslArchivoCVS := TstringList.Create;
   xslArchivoCVS.LoadFromFile(wgNombreArchivo);

   pbProgreso.Max := xslArchivoCVS.Count - 1;
   pbProgreso.Min := 0;
   pbProgreso.Position := 0;
   edtLogResultado.Text := '';

// Empieza desde la segunda línea, ya que la primera es la cabecera
   For xnLinea := 1 To xslArchivoCVS.Count - 1 Do
   Begin
      //limpia arreglo
      For xnI := 0 To 16 Do
      Begin
         xsArregloCampos[xnI] := '';
      End;

      xsLineaTexto := xslArchivoCVS.Strings[xnLinea];
      fg_AsignaArreglo(xsLineaTexto, xsDelimitador, xsArregloCampos);
      xsLogValidacion := '';

      If fg_ValidaFormato(xnlinea, xsArregloCampos, xsLogValidacion) = False Then
      Begin
         xbResultado := False;
         edtLogResultado.Text := xsLogValidacion;
         Showmessage('El Archivo no superó la validación de formato' + #13 + 'Verifique el Log');
         Exit;
      End
      Else
      Begin
         edtLogResultado.Text := 'Total registros Validados: ' + IntToStr(xnLinea + 1) + ' Registros';
         xbResultado := True;
      End;
      xTotalReg :=  xnLinea + 1;

      fg_InsertaRegistro(xsArregloCampos, xnLinea + 1);
      edtLogResultado.Text := 'Total registros Transferidos: ' + IntToStr(xnLinea + 1) + ' Registros';
      pbProgreso.Position := pbProgreso.Position + 1;
   End;
end;

procedure TFImpRecHonElect.fg_AsignaArreglo(wgLineaTexto,
  wgDelimitador: String; var wgArregloCampos: array of String);
Var
   xsCadenaTexto: String;
   xnIndice, xnPosicion: Integer;
Begin
   xsCadenaTexto := wgLineaTexto;
   xsCadenaTexto := StringReplace(xsCadenaTexto, '''', '', [rfreplaceall]);
   xsCadenaTexto := StringReplace(xsCadenaTexto, QuotedStr('"'), '', [rfreplaceall]);
   xsCadenaTexto := StringReplace(xsCadenaTexto, '"', '', [rfreplaceall]);
   xnIndice := 0;
   //Obtiene
   Repeat
      xnPosicion := Pos(wgDelimitador, xsCadenaTexto);
      If xnPosicion > 0 Then
      Begin
         wgArregloCampos[xnIndice] := Copy(xsCadenaTexto, 0, xnPosicion - 1);
         xsCadenaTexto := Trim(Copy(xsCadenaTexto, xnPosicion + 1, Length(xsCadenaTexto)));
      End
      Else
      Begin
         wgArregloCampos[xnIndice] := Trim(xsCadenaTexto);
         xsCadenaTexto := '';
      End;
      xnIndice := xnIndice + 1;
   Until Length(xsCadenaTexto) <= 0;
end;

procedure TFImpRecHonElect.FormShow(Sender: TObject);
begin
   xsDelimitador :='|';
   dbeAnoMM.SetFocus;
end;

function TFImpRecHonElect.fg_ValidaFormato(wgLinea: Integer;
  var wgArregloCampos: array of String;
  var wgLogValidacion: String): Boolean;
Var
   xnNumero: Double;
   xsEstadoDoc: String;
   xdFecha: TDate;
   xsSql: String;
Begin
   Result := True;
   If Length(wgLogValidacion) > 500 Then
   Begin
      wgLogValidacion := wgLogValidacion + #13 + #13 + #13;
      wgLogValidacion := wgLogValidacion + 'POR FAVOR VERIFICAR SI EL FORMATO DE LOS DATOS CONTENIDOS' + #13 +
         ' EN EL ARCHIVO SON LOS CORRECTOS';
      Result := False;
      Exit;
   End;

// 1. Fecha de Documento
   If strtodate(wgArregloCampos[0]) <= 0 Then
   Begin
      wgLogValidacion := wgLogValidacion + '[Línea: ' + IntToStr(wgLinea + 1) + '] Fecha de Emisión Inválida ' + #13;
      Result := False;
   End;

   If Result <> False Then
   Begin
      Result := True;
      Exit;
   End;
end;

procedure TFImpRecHonElect.fg_InsertaRegistro(
  var wgArregloCampos: array of String; wgNumeroLinea: Integer);
Var
   xCPFEMIS : TDateTime;
   xDOCID, xCPSERIE, xCPNODOC, xCPESTADO, xRUC, xPROVRUC, xPROVDES, xTIPORENTA,
   xGRATUITO, xCPTODES, xTMONID : String;
   xCPGRAVAD, XCPRENTA, xMONTONETO, xMTONETOPAGADO : Currency;
begin

// 1. Fecha de Emisión
   xCPFEMIS := strtodate(trim(wgArregloCampos[0]));

// 2. Tipo de Documento por Pagar (02 - Recibo de Honorarios Profesionales)
   if trim(wgArregloCampos[1])='RH' then
      xDOCID := '02'
   else
      xDOCID := trim(wgArregloCampos[1]);

// 3.1 Serie
   xCPSERIE := copy(trim(wgArregloCampos[2]),1,4);

// 3.2 Número de Documento
   xCPNODOC := copy(trim(wgArregloCampos[2]),6,(length(wgArregloCampos[2])-5));


// 4. Estado del Documento
   if trim(wgArregloCampos[3])='NO ANULADO' then
      xCPESTADO := 'T'
   else
      if trim(wgArregloCampos[3])='REVERTIDO' then
         xCPESTADO := 'R'
      else
         xCPESTADO := 'A';

// 5. Tipo de Documento de Identidad del Trabajador Independiente
   if trim(wgArregloCampos[4])='RUC' then
      xRUC := '6'
   else
      xRUC := trim(wgArregloCampos[4]);

// 6. RUC del Trabajador Independiente
   xPROVRUC := trim(wgArregloCampos[5]);

// 7. Nombre del Trabajador Independiente
   xPROVDES := trim(wgArregloCampos[6]);

// 8. Tipo de Renta que Distingue a los Funcionarios Públicos
   xTIPORENTA := trim(wgArregloCampos[7]);

// 9. Indicador si es GRATUITO
   xGRATUITO := trim(wgArregloCampos[8]);

// 10. Glosa
   xCPTODES := trim(wgArregloCampos[9]);
// 11. Glosa Adicional
   if trim(wgArregloCampos[10])<>'-' then
      xCPTODES := trim(xCPTODES+' '+trim(wgArregloCampos[10]));

// 12. Tipo de Moneda
// HPC_201602_CXP
// DAF_2016000190_CXP_1 Diferencia SOLES de NUEVOS SOLES
   if (trim(wgArregloCampos[11])='NUEVOS SOLES') or ((trim(wgArregloCampos[11])='SOLES')) then
      xTMONID := 'N'
   else if (trim(wgArregloCampos[11])='DOLARES') or
           (copy(trim(wgArregloCampos[11]),1,1)='D') then
           xTMONID := 'D'
        else
           xTMONID := trim(wgArregloCampos[11]);
// Fin HPC_201602_CXP

// 13. Monto Gravado
   xCPGRAVAD      := strtofloat(trim(wgArregloCampos[12]));

// 14. Renta de 4ta Categoría
   XCPRENTA       := strtofloat(trim(wgArregloCampos[13]));

// 15. Monto Total
   xMONTONETO     := strtofloat(trim(wgArregloCampos[14]));

// 16. Monto Neto
   xMTONETOPAGADO := strtofloat(trim(wgArregloCampos[15]));

   DMCXP.cdsQry2.Append;
   DMCXP.cdsQry2.FieldByName('CORRELATIVO').AsInteger  := xnLinea;   // Correlativo

   DMCXP.cdsQry2.FieldByName('CPFEMIS').AsDateTime  := xCPFEMIS;   // Fecha de Emisión
   DMCXP.cdsQry2.FieldByName('DOCID').AsString      := xDOCID;     // Tipo de Documento por Pagar (02 - Recibo de Honorarios Profesionales)
   DMCXP.cdsQry2.FieldByName('CPSERIE').AsString    := xCPSERIE;   // Serie del Recibo por Honorarios
   DMCXP.cdsQry2.FieldByName('CPNODOC').AsString    := xCPNODOC;   // Número de Documento
   DMCXP.cdsQry2.FieldByName('CPESTADO').AsString   := xCPESTADO;  // Estado del Documento
   DMCXP.cdsQry2.FieldByName('TIPDOCPROV').AsString := xRUC;       // Tipo de Documento de Identidad del Trabajador Independiente
   DMCXP.cdsQry2.FieldByName('PROVRUC').AsString    := xPROVRUC;   // RUC del Trabajador Independiente
   DMCXP.cdsQry2.FieldByName('PROVDES').AsString    := xPROVDES;   // Nombre del Trabajador Independiente
   DMCXP.cdsQry2.FieldByName('TIPORENTA').AsString  := xTIPORENTA; // Tipo de Renta que Distingue a los Funcionarios Públicos
   DMCXP.cdsQry2.FieldByName('ES_GRATUITO').AsString:= xGRATUITO;  // Indicador si es GRATUITO
   DMCXP.cdsQry2.FieldByName('CPGLOSA').AsString    := xCPTODES;   // Glosa
   DMCXP.cdsQry2.FieldByName('TMONID').AsString     := xTMONID;    // Tipo de Moneda
   DMCXP.cdsQry2.FieldByName('CPGRAVAD').AsFloat    := xCPGRAVAD;  // Monto Gravado
   DMCXP.cdsQry2.FieldByName('CPIGV').AsFloat       := xCPRENTA;   // Renta de 4ta Categoría
   DMCXP.cdsQry2.FieldByName('CPMTOORI').AsFloat    := xMONTONETO; // Monto Total
   DMCXP.cdsQry2.FieldByName('CPSALORI').AsFloat    := xMTONETOPAGADO; // Monto Neto
   DMCXP.cdsQry2.FieldByName('ENVIADO_A_CXP').AsString := 'N'; // Indicador que ya está en CXP
   DMCXP.cdsQry2.Post;

end;

procedure TFImpRecHonElect.fg_InsertaRegistroImportados(wgNombreArchivo, wgPeriodo: String);
Var
   xFecImpor, xCPFREG, xCPHREG : TDateTime;
   xNombArchivo, xUsuario, xEstado, xUsuUlt, xPeriodo: String;
   xCantImport, xCantReg, xId : Double;
begin

// 1. Correlativo
   xId := UltimoRegistroImportado(wgPeriodo, wgNombreArchivo);
// 2. Nombre del Archivo
   xNombArchivo := wgNombreArchivo;
// 3. Periodo
   xPeriodo := wgPeriodo;
// 4. Fecha de Importación
   xfecImpor := Date;
// 5. Cantidad de Registro
   xCantReg := xTotalReg;
// 6. Usuario
   xUsuario := DMCXP.wUsuario;
// 7. Cantidad de Importación
   xCantImport := 1;
// 8. Estado
   xEstado := 'NUEVO';
// 9. Último Usuario
   xUsuUlt := DMCXP.wUsuario;

   DMCXP.cdsQry12.Append;

   DMCXP.cdsQry12.FieldByName('IDEREG').AsFloat     := xId;   // ID Registro
   DMCXP.cdsQry12.FieldByName('NOMARC').AsString := xNombArchivo;     // Nombre de Archivo Importado
   DMCXP.cdsQry12.FieldByName('PERIODO').AsString        := xPeriodo;   // Periodo de Importación
   DMCXP.cdsQry12.FieldByName('FECIMPARC').AsDateTime   := xfecImpor;   // Fecha de Importación
   DMCXP.cdsQry12.FieldByName('CANTOTREG').AsFloat        := xCantReg;   // Cantidad de Registro de Importación
// Inicio HPC_201503_CXP
//   DMCXP.cdsQry12.FieldByName('USUARIO').AsString        := xUsuario;  // Usuario de Importación
   DMCXP.cdsQry12.FieldByName('USUREG').AsString        := xUsuario;  // Usuario de Importación
// Fin HPC_201503_CXP
   DMCXP.cdsQry12.FieldByName('CANTOTIMP').AsFloat     := xCantImport;       // Cantidad de veces Importados
   DMCXP.cdsQry12.FieldByName('ESTADO').AsString         := xEstado;   // Estado de la Importación
   DMCXP.cdsQry12.FieldByName('USUMOD').AsString        := xUsuUlt;   // Último Usuario de Importación

   DMCXP.cdsQry12.Post;

   xSQL:= ' insert into CXP_REC_HON_ELEC (IDEREG, NOMARC, PERIODO, FECIMPARC, '
        + '                               CANTOTREG, USUREG, CANTOTIMP, ESTADO, USUMOD, '
        + '                               CPFREG, FECREG, FECMOD) '
        + ' values ('+ floattostr(xId) +','+quotedstr(xNombArchivo)+', '
        +            quotedstr(xPeriodo)+','+quotedstr(datetostr(xfecImpor))+', '
        +            floattostr(xCantReg)+', '+quotedstr(xUsuario)+', '
        +            floattostr(xCantImport)+', '
        +            quotedstr(xEstado)+', '+quotedstr(xUsuUlt)+', '
        + '          trunc(sysdate), sysdate, sysdate) ';
   DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
end;

procedure TFImpRecHonElect.fg_ActualizaRegistroImportados(wgNombreArchivo, wgPeriodo: String);
Var
   xFecImpor, xCPFREG, xCPHREG : TDateTime;
   xNombArchivo, xUsuario, xEstado, xUsuUlt, xPeriodo, xSQL: String;
   xCantImport, xCantReg, xId : Double;
begin
// 1. Nombre del Archivo
   xNombArchivo := wgNombreArchivo;
// 2. Periodo
   xPeriodo := wgPeriodo;
// 3. Cantidad de Importación
   xCantImport := DMCXP.cdsQry12.FieldByName('CANTOTIMP').AsFloat + 1;
// 4. Estado
   xEstado := 'EDITADO';
// 5. Último Usuario
   xUsuUlt := DMCXP.wUsuario;

   DMCXP.cdsQry12.Edit;

   DMCXP.cdsQry12.FieldByName('CANTOTIMP').AsFloat     := xCantImport;       // Cantidad de veces Importados
   DMCXP.cdsQry12.FieldByName('ESTADO').AsString         := xEstado;   // Estado de la Importación
   DMCXP.cdsQry12.FieldByName('USUMOD').AsString        := xUsuUlt;   // Último Usuario de Importación

   DMCXP.cdsQry12.Post;

   if DMCXP.cdsQry12.ApplyUpdates(0)>0 then
   begin
      xSQL := ' Update CXP_REC_HON_ELEC '
            + '    set CANTOTIMP = '+ FLOATTOSTR(DMCXP.cdsQry12.fieldbyname('CANTOTIMP').AsFloat) +', '
            + '        ESTADO = '''+DMCXP.cdsQry12.fieldbyname('ESTADO').AsString+''', '
            + '        USUMOD = '''+DMCXP.cdsQry12.fieldbyname('USUMOD').AsString+''', '
            + '        CPFREG = trunc(sysdate), '
            + '        FECMOD = sysdate '
            + '  Where IDEREG=''' + DMCXP.cdsQry12.fieldbyname('IDEREG').AsString + ''' '
            + '    and NOMARC=''' + DMCXP.cdsQry12.fieldbyname('NOMARC').AsString + ''' ';
      try
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL);
      except
         ShowMessage('No se pudo actualizar los datos en el archivo de Importaciones RH');
         exit;
      end;
   end;
end;

procedure TFImpRecHonElect.bbtnProcesarClick(Sender: TObject);
var
   xdFechaProceso: TDate;
begin
   if length(dbeAnoMM.Text)=0 then
   begin
      ShowMessage('Debe indicar el Año y Mes de Proceso');
      dbeAnoMM.SetFocus;
      exit;
   end;
   if length(edtRutaArchivo.Text)=0 then
   begin
      ShowMessage('Debe indicar el Archivo de Importación de Renta 4ta. para el Proceso');
      edtRutaArchivo.SetFocus;
      exit;
   end;

// Valida si existe periodo operativo abierto
   DateSeparator := '/';
   ShortDateFormat := 'yyyy/mm/dd';
   xdFechaProceso := StrToDate(copy(dbeAnoMM.Text, 1, 4) + '/' + copy(dbeAnoMM.Text, 5, 2) + '/' + '01');
   ShortDateFormat := 'dd/mm/yyyy';

   // se valida con Cia 02 - Sede Central
   DMCXP.wModo := 'A';
   If xControlFec('02', xdFechaProceso) = False Then
   Begin
      dbeAnoMM.SetFocus;
      Exit;
   End;
// Fin Validación de Fecha

   xTotalReg := 0;
   fg_ProcesarArchivo(xsArchivo);
   dbgDatosdImportados.DataSource := DMCXP.dsQry2;

   dbgDatosdImportados.Selected.Clear;
   dbgDatosdImportados.Selected.Add('CIA'#9'10'#9'Compañía'#9'F');   // Compañía
   dbgDatosdImportados.Selected.Add('ANOMES'#9'10'#9'Año+Mes'#9'F');   // Periodo (Año+Mes)
   dbgDatosdImportados.Selected.Add('TDIARIO'#9'5'#9'Tipo~Diario'#9'F');   // Tipo de Diario
   dbgDatosdImportados.Selected.Add('NOREG'#9'10'#9'Número~Registro'#9'F');   // Número de Registro de Compras

   dbgDatosdImportados.Selected.Add('CORRELATIVO'#9'7'#9'Correlativo'#9'F');   // Número de Registro de Compras

   dbgDatosdImportados.Selected.Add('CPFEMIS'#9'10'#9'Fecha~Emisión'#9'F');   // Fecha de Emisión
   dbgDatosdImportados.Selected.Add('DOCID'#9'10'#9'Tipo~Documento'#9'F');   // Tipo de Documento por Pagar (02 - Recibo de Honorarios Profesionales)
   dbgDatosdImportados.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');   // Serie del Recibo por Honorarios
   dbgDatosdImportados.Selected.Add('CPNODOC'#9'7'#9'Nro.Doc'#9'F');   // Número de Documento
   dbgDatosdImportados.Selected.Add('CPESTADO'#9'6'#9'Estado'#9'F');   // Estado del Documento
   dbgDatosdImportados.Selected.Add('TIPDOCPROV'#9'10'#9'T.Doc~Proveedor'#9'F');   // Tipo de Documento de Identidad del Trabajador Independiente
   dbgDatosdImportados.Selected.Add('PROVRUC'#9'13'#9'RUC~Proveedor'#9'F');   // RUC del Trabajador Independiente
   dbgDatosdImportados.Selected.Add('PROVDES'#9'50'#9'Nombre~Proveedor'#9'F');   // Nombre del Trabajador Independiente
   dbgDatosdImportados.Selected.Add('TIPORENTA'#9'10'#9'Tipo~Renta'#9'F');   // Tipo de Renta que Distingue a los Funcionarios Públicos
   dbgDatosdImportados.Selected.Add('ES_GRATUITO'#9'10'#9'¿Es~Gratuito?'#9'F');   // Indicador si es GRATUITO
   dbgDatosdImportados.Selected.Add('TMONID'#9'10'#9'Tipo~Moneda'#9'F');    // Tipo de Moneda
   dbgDatosdImportados.Selected.Add('CPGRAVAD'#9'10'#9'Monto~Gravado'#9'F');   // Monto Gravado
   dbgDatosdImportados.Selected.Add('CPIGV'#9'10'#9'Renta~4ta.Categ'#9'F');   // Renta de 4ta Categoría
   dbgDatosdImportados.Selected.Add('CPMTOORI'#9'10'#9'Monto a~Pagar'#9'F');   // Monto Total
   dbgDatosdImportados.Selected.Add('CPSALORI'#9'10'#9'Neto por~Pagar'#9'F');   // Monto Neto
   dbgDatosdImportados.Selected.Add('CPGLOSA'#9'100'#9'Glosa'#9'F');   // Glosa
   dbgDatosdImportados.Selected.Add('ENVIADO_A_CXP'#9'3'#9'en~CXP'#9'F');   // Flag de si está en CXP
   dbgDatosdImportados.ApplySelected;

   fg_ProcesarImportacion(xsArchivo);

   pbProgreso2.Max := DMCXP.cdsQry2.RecordCount;
   pbProgreso2.Min := 0;
   pbProgreso2.Position := 0;

   DMCXP.cdsQry2.DisableControls;
   DMCXP.cdsQry2.First;
   while not DMCXP.cdsQry2.EOF do
   begin
      pbProgreso2.Position := pbProgreso2.Position + 1;
      xSQL := 'select CIAID,CPANOMES,TDIARID,CPNOREG,CPESTADO '
             +'  from CXP301 '
             +' where PROVRUC='+quotedstr(DMCXP.cdsQry2.FieldByName('PROVRUC').AsString)
             +'   and DOCID='+quotedstr(DMCXP.cdsQry2.FieldByName('DOCID').AsString)
             +'   and CPSERIE='+quotedstr(DMCXP.cdsQry2.FieldByName('CPSERIE').AsString)
             +'   and CPNODOC='+quotedstr(DMCXP.cdsQry2.FieldByName('CPNODOC').AsString)
             +'   and CPESTADO in (''P'',''C'',''I'',''A'')';
      DMCXP.cdsQry.Close;
      DMCXP.cdsQry.DataRequest(xSQL);
      DMCXP.cdsQry.Open;
      if DMCXP.cdsQry.RecordCount>0 then
      begin
         DMCXP.cdsQry2.Edit;
         DMCXP.cdsQry2.FieldByName('CIA').AsString := DMCXP.cdsQry.FieldByName('CIAID').AsString;
         DMCXP.cdsQry2.FieldByName('ANOMES').AsString := DMCXP.cdsQry.FieldByName('CPANOMES').AsString;
         DMCXP.cdsQry2.FieldByName('TDIARIO').AsString := DMCXP.cdsQry.FieldByName('TDIARID').AsString;
         DMCXP.cdsQry2.FieldByName('NOREG').AsString := DMCXP.cdsQry.FieldByName('CPNOREG').AsString;
         DMCXP.cdsQry2.FieldByName('CPESTADO').AsString := DMCXP.cdsQry.FieldByName('CPESTADO').AsString;
         DMCXP.cdsQry2.FieldByName('ENVIADO_A_CXP').AsString := 'S';
         DMCXP.cdsQry2.Post;
      // Detalle del Centro de Costo
         xSQL := 'Select nvl(max(CCOSID),'''') CCOSID '
               + '  from CXP302 '
               + ' where CIAID='+quotedstr(DMCXP.cdsQry2.FieldByName('CIA').AsString)
               + '   and DCPANOMM='+quotedstr(DMCXP.cdsQry2.FieldByName('ANOMES').AsString)
               + '   and TDIARID='+quotedstr(DMCXP.cdsQry2.FieldByName('TDIARIO').AsString)
               + '   and CPNOREG='+quotedstr(DMCXP.cdsQry2.FieldByName('NOREG').AsString);
         DMCXP.cdsQry.Close;
         DMCXP.cdsQry.DataRequest(xSQL);
         DMCXP.cdsQry.Open;
         if DMCXP.cdsQry.RecordCount>0 then
         Begin
            if length(DMCXP.cdsQry.FieldByName('CCOSID').AsString)>0 then
            Begin
               DMCXP.cdsQry2.Edit;
               DMCXP.cdsQry2.FieldByName('CCOSID').AsString := DMCXP.cdsQry.FieldByName('CCOSID').AsString;
               DMCXP.cdsQry2.Post;
            End;
         End;
      end;
      DMCXP.cdsQry2.Next;
   end;
   xTotalReg := 0;
   lblNroRegistros.Caption := inttostr(DMCXP.cdsQry2.RecordCount)+' Registros';
   lblNroRegistros.Visible := True;
   ObtenerReciboPeriodo;
   DMCXP.cdsQry2.EnableControls;
   DMCXP.cdsQry2.First;
end;

procedure TFImpRecHonElect.dbgDatosdImportadosCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   if Highlight then
   begin
      AFont.Color := clWhite;
      ABrush.Color := clNavy;
   end
   else
   begin
      If length(DMCXP.cdsQry2.FieldByName('CIA').AsString) > 0 Then
      Begin
         AFont.Color := clBlack;
         If DMCXP.cdsQry2.FieldByName('ENVIADO_A_CXP').AsString = 'S' Then
            ABrush.Color := $00CEFFCE
         Else
            ABrush.Color := $006AFFFF;
      End
      Else
      Begin
         AFont.Color := clBlack;
         ABrush.Color := clWhite;
      End;
   End;
end;

procedure TFImpRecHonElect.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFImpRecHonElect.dbgDatosdImportadosDblClick(Sender: TObject);
begin
   FImpRecHonElectCXP := TFImpRecHonElectCXP.Create(Application);
   FImpRecHonElectCXP.LlenaDatosparaCXP;
   try
      FImpRecHonElectCXP.ShowModal;
   Finally
      FImpRecHonElectCXP.Free;
   End;
end;

procedure TFImpRecHonElect.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMCXP.cdsQry3.IndexFieldNames := '';
   DMCXP.cdsQry3.Filter := '';
   DMCXP.cdsQry3.Filtered := False;
   DMCXP.cdsQry3.Close;

   DMCXP.cdsQry2.IndexFieldNames := '';
   DMCXP.cdsQry2.Filter := '';
   DMCXP.cdsQry2.Filtered := False;
   DMCXP.cdsQry2.Close;

   DMCXP.cdsQry.IndexFieldNames := '';
   DMCXP.cdsQry.Filter := '';
   DMCXP.cdsQry.Filtered := False;
   DMCXP.cdsQry.Close;
end;

procedure TFImpRecHonElect.rbTodosClick(Sender: TObject);
begin
   DMCXP.cdsQry2.Filter := '';
   DMCXP.cdsQry2.Filtered := False;
   DMCXP.cdsQry2.First;
   lblNroRegistros.Caption := inttostr(DMCXP.cdsQry2.RecordCount)+' Registros';
end;

procedure TFImpRecHonElect.rbFaltantesClick(Sender: TObject);
begin
   DMCXP.cdsQry2.Filter := 'ENVIADO_A_CXP <>'+quotedstr('S')
                     +' and CPESTADO<>'+quotedstr('R');
   DMCXP.cdsQry2.Filtered := True;
   DMCXP.cdsQry2.First;
   lblNroRegistros.Caption := inttostr(DMCXP.cdsQry2.RecordCount)+' Registros';
end;

procedure TFImpRecHonElect.dbgDatosdImportadosTitleButtonClick(
  Sender: TObject; AFieldName: String);
var
   xTitLabel : String;
begin
   gbFiltroBusqueda.Visible := True;
   isBusca.SearchField := AFieldName;
   DMCXP.cdsQry2.IndexFieldNames:=AFieldName;
   dbgDatosdImportados.SetActiveField( AFieldName );

   xTitLabel := dbgDatosdImportados.SelectedField.DisplayLabel;

   If AFieldName = 'CIA' Then  xTitLabel := 'Compañia';
   If AFieldName = 'ANOMES' Then  xTitLabel := 'Año+Mes';
   If AFieldName = 'TDIARIO' Then  xTitLabel := 'Tipo Diario';
   If AFieldName = 'NOREG' Then  xTitLabel := 'Número Registro';
   If AFieldName = 'CORRELATIVO' Then  xTitLabel := 'Correlativo';
   If AFieldName = 'CPFEMIS' Then  xTitLabel := 'Fecha Emisión';
   If AFieldName = 'DOCID' Then  xTitLabel := 'Tipo Documento';
   If AFieldName = 'CPSERIE' Then  xTitLabel := 'Serie';
   If AFieldName = 'CPNODOC' Then  xTitLabel := 'Nro.Doc.';
   If AFieldName = 'CPESTADO' Then  xTitLabel := 'Estado';
   If AFieldName = 'TIPDOCPROV' Then  xTitLabel := 'T.Doc.Proveedor';
   If AFieldName = 'PROVRUC' Then  xTitLabel := 'RUC';
   If AFieldName = 'PROVDES' Then  xTitLabel := 'Nomb. Provee.';
   If AFieldName = 'CPGLOSA' Then  xTitLabel := 'Glosa';
   If AFieldName = 'TIPORENTA' Then  xTitLabel := 'Tipo Renta';
   If AFieldName = 'ES_GRATUITO' Then  xTitLabel := 'Es Gratuito';
   If AFieldName = 'TMONID' Then  xTitLabel := 'Tipo Moneda';
   If AFieldName = 'CPGRAVAD' Then  xTitLabel := 'Monto Grabado';
   If AFieldName = 'CPIGV' Then  xTitLabel := 'Renta 4ta';
   If AFieldName = 'CPMTOORI' Then  xTitLabel := 'Monto a Pagar';
   If AFieldName = 'CPSALORI' Then  xTitLabel := 'Neto a Pagar';

   xTitLabel[ Pos('~',xTitLabel)] := ' ';
   lblBusca.caption := xTitLabel;
   isBusca.SetFocus;
end;

function TFImpRecHonElect.UltimoRegistroImportado( xPeriodo,xNombreArchivo:String ):Double;
var
   xSQL : string;
begin
// Inicio HPC_201503_CXP
   xSQL:= ' Select MAX(IDEREG) NUMERO '
        + '   from CXP_REC_HON_ELEC '
//      + '  Where PERIODO='+quotedstr(xPeriodo);
        + '  Where 1=1';
// Fin HPC_201503_CXP

   xSQL := UpperCase( xSQL );
   DMCXP.cdsULTTGE.Close;
   DMCXP.cdsULTTGE.ProviderName:= 'dspTGE';
   DMCXP.cdsULTTGE.DataRequest(xSQL);
   DMCXP.cdsULTTGE.Open;
   if DMCXP.cdsULTTGE.FieldByName('Numero').Value=null then
      result:=1
   else begin
      result:=DMCXP.cdsULTTGE.FieldByName('Numero').Value+1;
   end;
end;

Procedure TFImpRecHonElect.ObtenerReciboPeriodo;
Begin
// Inicio HPC_201503_CXP
   xSQL := 'Select IDEREG, NOMARC, PERIODO, FECIMPARC, CANTOTREG, '
         + '       USUREG, CANTOTIMP, ESTADO, USUMOD, '
         + '       CPFREG, FECREG, FECMOD '
         + '  from CXP_REC_HON_ELEC '
         + ' where PERIODO = ''' + dbeAnoMM.Text + ''' ';
// Fin HPC_201503_CXP
   DMCXP.cdsQry13.Close;
   DMCXP.cdsQry13.DataRequest(xSQL);
   DMCXP.cdsQry13.Open;

   dbgDatos.DataSource := DMCXP.dsQry13;
   dbgDatos.Selected.Clear;
   dbgDatos.Selected.Add('IDEREG'#9'10'#9'ID'#9'F');           // Identificador del Registro
   dbgDatos.Selected.Add('NOMARC'#9'10'#9'Archivo'#9'F');      // Nombre del Archivo de Importación
   dbgDatos.Selected.Add('PERIODO'#9'5'#9'Periodo'#9'F');      // Periodo (Año+Mes)
   dbgDatos.Selected.Add('FECIMPARC'#9'10'#9'Fecha'#9'F');     // Fecha de importación
   dbgDatos.Selected.Add('CANTOTREG'#9'7'#9'Cant_Reg'#9'F');    // Cantidad de Registros Importados
// Inicio HPC_201503_CXP
//   dbgDatos.Selected.Add('USUARIO'#9'10'#9'Usuario'#9'F');     // Usuario que realiza la impoertación
   dbgDatos.Selected.Add('USUREG'#9'10'#9'Usuario'#9'F');     // Usuario que realiza la impoertación
// Fin HPC_201503_CXP
   dbgDatos.Selected.Add('CANTOTIMP'#9'10'#9'Veces'#9'F');   // Cantidad de Veces importadas
   dbgDatos.Selected.Add('ESTADO'#9'5'#9'Estado'#9'F');        // Estado de la Importación
   dbgDatos.Selected.Add('USUMOD'#9'7'#9'Usu_Ult'#9'F');       // Usuario que modifica
   dbgDatos.ApplySelected;
End;

end.
