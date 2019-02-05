unit CxP504;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdbdlg, StdCtrls, wwdblook;

type
  TFNuevoProv = class(TForm)
    GroupBox1: TGroupBox;
    gbAntiguo: TGroupBox;
    Label27: TLabel;
    Label30: TLabel;
    dblcAntClAux: TwwDBLookupCombo;
    dblcdAntProv: TwwDBLookupComboDlg;
    gbnuevo: TGroupBox;
    Label29: TLabel;
    Label28: TLabel;
    dblcNueClAux: TwwDBLookupCombo;
    Button11: TButton;
    edtAntRuc: TEdit;
    edtNueRuc: TEdit;
    CheckBox1: TCheckBox;
    Button1: TButton;
    edtNueProv: TEdit;
    procedure Button11Click(Sender: TObject);
    procedure dblcdAntProvExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcAntClAuxExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcNueClAuxExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure OPRecodificacionProveedor; stdcall;

exports
  OPRecodificacionProveedor;

var
  FNuevoProv: TFNuevoProv;

implementation

uses CxPDM;

{$R *.DFM}

procedure OPRecodificacionProveedor;
begin
   if DMCXP=nil then exit;
   if not DMCXP.DCOM1.Connected then Exit;
   try
     FNuevoProv:=TFNuevoProv.Create( Application );
     FNuevoProv. ShowModal;
   finally
     FNuevoProv. Free;
   end;
end;


procedure TFNuevoProv.Button11Click(Sender: TObject);
var
   xNuevoProv, xClaseAux, xClaseAnt, xProvAnt : String;
   xAntRuc,xNueRuc : string;
   xSQL : string;
   xNumReg : integer;
begin

    if length(dblcAntClAux.Text)=0 then
      raise exception.Create('Ingrese Clase Auxiliar');

    if length(dblcdAntProv.Text)=0 then
      raise exception.Create('Ingrese Antiguo Proveedor!!!');

    if length(dblcNueClAux.Text)=0 then
      raise exception.Create('Ingrese Clase Auxiliar');

    if length(edtNueProv.Text)=0 then
      raise exception.Create('Ingrese Nuevo Proveedor!!!');

    if length(edtAntRuc.Text)=0 then
    begin
       if MessageDlg('El Provedor Antiguo no tine R.U.C'+chr(13)
       +'      ¿Continuar con Recodificación?       ',mtConfirmation, [mbYes, mbNo], 0)=mrNo then
          exit;
    end;

    if length(edtNueRuc.Text)=0 then
    begin
       if MessageDlg('El Provedor Nuevo no tine R.U.C'+chr(13)
       +'      ¿Continuar con Recodificación?       ',mtConfirmation, [mbYes, mbNo], 0)=mrNo then
          exit;
    end;


    Screen.Cursor:=crHourGlass;

    xNuevoProv := edtNueProv.Text;
    xClaseAux  := dblcNueClAux.Text;
    xClaseAnt  := dblcAntClAux.Text;
    xProvAnt   := dblcdAntProv.Text;

 // Maestro de Activos Fijos
    if xProvAnt<>xNuevoProv then
    begin
       xSQL :=  ' update ACF201 '
               +' set PROV='+quotedstr(xNuevoProv)
               +' where PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

 // Reformas de Activos Fijos
    if xProvAnt<>xNuevoProv then
    begin
       xSQL :=  ' update ACF203 '
               +' set PROV='+quotedstr(xNuevoProv)
               +' where PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

 // Archivo de Activos Fijos
    if xProvAnt<>xNuevoProv then
    begin
       xSQL :=  ' update ACF250 '
               +' set PROV='+quotedstr(xNuevoProv)
               +' where PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

 //
    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update ACF306 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

// Encargados de Rendición de Cuenta
    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CAJA101 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

// Código de Proveedor asignados al Banco
    if xProvAnt<>xNuevoProv then
    begin
       xSQL :=  ' update CAJA102 '
               +' set PROV='+quotedstr(xNuevoProv)
               +' where PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

// Conceptos de Caja
    if xProvAnt<>xNuevoProv then
    begin
       xSQL :=  ' update CAJA201 '
               +' set PROV='+quotedstr(xNuevoProv)
               +' where PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CAJA301 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CAJA302 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CAJA303 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL := 'AUXID='+quotedstr(xProvAnt);
       xNumReg := strtoint(DMCXP.DisplayDescrip2('dspTGE','CNT201','count(AUXID) NUMREG',xSQL,'NUMREG'));
       if xNumReg=1 then
       begin
          xSQL :=  ' update CNT201 '
                  +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
                  +'     AUXID='+quotedstr(xNuevoProv)
                  +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
                  +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
          try
             DMCXP.DCOM1.AppServer.IniciaTransaccion;
             DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
             DMCXP.DCOM1.AppServer.GrabaTransaccion;
          except
             DMCXP.DCOM1.AppServer.RetornaTransaccion;
          end;
       end;
       if xNumReg>1 then
       begin
          xSQL :=  ' delete from CNT201 '+
                   ' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
          try
             DMCXP.DCOM1.AppServer.IniciaTransaccion;
             DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
             DMCXP.DCOM1.AppServer.GrabaTransaccion;
          except
             DMCXP.DCOM1.AppServer.RetornaTransaccion;
          end;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CNT301 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CNT311 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CNT303 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CNT305 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CNT320 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CNT321 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CNT351 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CNT400 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CNT401 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CNT403 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CNT404 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CNT406 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CNT701 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CNT901 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if xProvAnt<>xNuevoProv then
    begin
       xSQL :=  ' update CXP201 '
               +' set PROV='+quotedstr(xNuevoProv)
               +' where PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CXP301 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;


    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CXP302 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     DCPAUXID='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and DCPAUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CXP303 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CXP304 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CXP305 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CXP306 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     PROV='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CXP308 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if xProvAnt<>xNuevoProv then
    begin
       xSQL :=  ' delete from CXP310'
               +' where CLAUXPROV='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
      xSQL :=  ' delete from CXP311'
              +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CXP313 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     PROV='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CXP401 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update CXP402 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     PROV='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update LOG201 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update LOG202 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     PROV='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if xProvAnt<>xNuevoProv then
    begin
       xSQL :=  ' update LOG304 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+', '
               +  'PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if xProvAnt<>xNuevoProv then
    begin
       xSQL :=  ' update LOG305 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+', PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if xProvAnt<>xNuevoProv then
    begin
       xSQL :=  ' update LOG311 '
               +' set PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if xProvAnt<>xNuevoProv then
    begin
       xSQL :=  ' update LOG312 '
               +' set PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if xProvAnt<>xNuevoProv then
    begin
       xSQL :=  ' update LOG314 '
               +' set PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if xProvAnt<>xNuevoProv then
    begin
       xSQL :=  ' update LOG315 '
               +' set PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if xProvAnt<>xNuevoProv then
    begin
       xSQL :=  ' update LOG318 '
               +' set PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update LOG322 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if xProvAnt<>xNuevoProv then
    begin
       xSQL :=  ' update LOG327 '
               +' set PROV='+quotedstr(xNuevoProv)
               +' ,PROVRUC='+quotedstr(edtNueRuc.Text)
               +' where PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update RRHH403 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update TGE105 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update TGE215 '
               +' set PROV='+quotedstr(xNuevoProv)
               +' where CLAUXID='+quotedstr(xClaseAnt)+' and PROV='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;

    if (dblcAntClAux.text<>dblcNueClAux.text) or (xProvAnt<>xNuevoProv) then
    begin
       xSQL :=  ' update TGE401 '
               +' set CLAUXID='+quotedstr(dblcNueClAux.text)+','
               +'     AUXID='+quotedstr(xNuevoProv)
               +' where AUXID='+quotedstr(xProvAnt);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;                           
       end;
    end;

    if CheckBox1.Checked  then
    begin
       xSQL:=  ' insert into TGE201(PROV,PROVDES,PROVABR,PROVRUC,PROVGIRA,PROVDIR,PROVCZIP,'+
               ' PROVTELF,PROVFAX,PROVREPR,PROVSALL,CLAUXID,TIPPERID,PROVAPEPAT,PROVAPEMAT,PROVUFMOV,ACTXOC,PROVEMAI,'+
               ' PROVEXONER,PROVNOMCOM,PROVRETIGV,USERID,FREG,HREG)'+
               ' SELECT '+Quotedstr(edtNueProv.text)+',PROVDES,PROVABR,PROVRUC,PROVGIRA,PROVDIR,PROVCZIP,'+
               ' PROVTELF,PROVFAX,PROVREPR,PROVSALL,'+Quotedstr(dblcNueClAux.text)+',TIPPERID,PROVAPEPAT,PROVAPEMAT,PROVUFMOV,ACTXOC,PROVEMAI,'+
               ' PROVEXONER,PROVNOMCOM,PROVRETIGV,'+Quotedstr(DMCXP.wUsuario)+
               // VHNDEMA
               //',CURRENT DATE,CURRENT TIME'+
                 ', '+DMCXP.wRepFecServi+', '+DMCXP.wRepHorServi+
               // END VHNDEMA
               ' FROM TGE201 '+
               ' WHERE CLAUXID='+Quotedstr(dblcAntClAux.text)+
               ' AND PROV='+Quotedstr(dblcdAntProv.text);
       try
         DMCXP.DCOM1.AppServer.IniciaTransaccion;
         DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
         DMCXP.DCOM1.AppServer.GrabaTransaccion;
       except
         DMCXP.DCOM1.AppServer.RetornaTransaccion;
       end;
    end;


    xSQL :=  ' delete from TGE201'+
             ' where CLAUXID='+quotedstr(dblcAntClAux.text)+' and PROV='+quotedstr(xProvAnt);
    try
      DMCXP.DCOM1.AppServer.IniciaTransaccion;
      DMCXP.DCOM1.AppServer.EjecutaSQL(xSQL) ;
      DMCXP.DCOM1.AppServer.GrabaTransaccion;
    except
      DMCXP.DCOM1.AppServer.RetornaTransaccion;
    end;

    Screen.Cursor:=crDefault;
    Showmessage('Ok');
end;

procedure TFNuevoProv.dblcdAntProvExit(Sender: TObject);
begin
   if DMCXP.cdsProv.IndexFieldNames<>'PROV' then
      DMCXP.cdsProv.IndexFieldNames:='PROV';
   DMCXP.cdsProv.SetKey;
   DMCXP.cdsProv.FieldByName('PROV').AsString := dblcdAntProv.Text;
   if not DMCXP.cdsProv.GotoKey then
   begin
      ShowMessage('Clase de Auxiliar del Código Anterior No Existe');
      dblcdAntProv.SetFocus;
      exit;
   end;
   edtAntRuc.Text := DMCXP.cdsProv.fieldbyname('PROVRUC').AsString;
   edtNueProv.Text := DMCXP.cdsProv.fieldbyname('PROV').AsString;
   edtNueRuc.Text := DMCXP.cdsProv.fieldbyname('PROVRUC').AsString;
end;

procedure TFNuevoProv.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;

end;

procedure TFNuevoProv.Button1Click(Sender: TObject);
begin
   dblcAntClAux.Text := '';
   dblcdAntProv.Text :='';
   edtAntRuc.Text :='';
   dblcNueClAux.Text := '';
   edtNueProv.Text := '';
   edtNueRuc.Text :='';
end;

procedure TFNuevoProv.FormShow(Sender: TObject);
var
   xSQL : String;
begin
   DMCXP.AccesosUsuarios( DMCXP.wModulo,DMCXP.wUsuario,'2',Screen.ActiveForm.Name );

   xSQL := 'select CLAUXID,CLAUXDES from TGE102';
   DMCXP.cdsClAux.IndexFieldNames:='';
   DMCXP.cdsClAux.Filter:='';
   DMCXP.cdsClAux.Filtered:=False;
   DMCXP.cdsClAux.Close;
   DMCXP.cdsClAux.DataRequest(xSQL);
   DMCXP.cdsClAux.Open;
   DMCXP.cdsClAux.IndexFieldNames:='CLAUXID';

   xSQL := 'select CLAUXID,PROV,PROVDES,PROVRUC from TGE201 ';
   DMCXP.cdsProv.IndexFieldNames:='';
   DMCXP.cdsProv.Filter:='';
   DMCXP.cdsProv.Filtered:=False;
   DMCXP.cdsProv.Close;
   DMCXP.cdsProv.DataRequest(xSQL);
   DMCXP.cdsProv.Open;
   DMCXP.cdsProv.IndexFieldNames:='PROV';

   dblcAntClAux.Selected.Clear;
   dblcAntClAux.LookupField:='';
   dblcAntClAux.LookupTable:=DMCXP.cdsClAux;
   dblcAntClAux.LookupField:='CLAUXID';
   dblcAntClAux.Selected.Add('CLAUXID'+#9+'2'+#9+'Id');
   dblcAntClAux.Selected.Add('CLAUXDES'+#9+'15'+#9+'Clase Auxiliar');

   dblcdAntProv.Selected.Clear;
   dblcdAntProv.LookupField:='';
   dblcdAntProv.LookupTable:=DMCXP.cdsProv;
   dblcdAntProv.LookupField:='PROV';
   dblcdAntProv.Selected.Add('PROV'+#9+'10'+#9+'Id');
   dblcdAntProv.Selected.Add('PROVDES'+#9+'20'+#9+'Proveedor');

///////////////////////////////////////////////////////////////////////////////

   xSQL := 'select CLAUXID,CLAUXDES from TGE102';
   DMCXP.cdsClAux1.IndexFieldNames:='';
   DMCXP.cdsClAux1.Filter:='';
   DMCXP.cdsClAux1.Filtered:=False;
   DMCXP.cdsClAux1.Close;
   DMCXP.cdsClAux1.DataRequest(xSQL);
   DMCXP.cdsClAux1.Open;
   DMCXP.cdsClAux1.IndexFieldNames:='CLAUXID';

   dblcNueClAux.Selected.Clear;
   dblcNueClAux.LookupField:='';
   dblcNueClAux.LookupTable:=DMCXP.cdsClAux1;
   dblcNueClAux.LookupField:='CLAUXID';
   dblcNueClAux.Selected.Add('CLAUXID'+#9+'2'+#9+'Id');
   dblcNueClAux.Selected.Add('CLAUXDES'+#9+'15'+#9+'Clase Auxiliar');
end;

procedure TFNuevoProv.dblcAntClAuxExit(Sender: TObject);
begin
   if DMCXP.cdsClAux.IndexFieldNames<>'CLAUXID' then
      DMCXP.cdsClAux.IndexFieldNames:='CLAUXID';
   DMCXP.cdsClAux.SetKey;
   DMCXP.cdsClAux.FieldByName('CLAUXID').AsString := dblcAntClAux.Text;
   if not DMCXP.cdsClAux.GotoKey then
   begin
      ShowMessage('Clase de Auxiliar del Código Anterior No Existe');
      dblcAntClAux.SetFocus;
      exit;
   end;
   DMCXP.cdsProv.Filter:='CLAUXID='+quotedstr(dblcAntClAux.Text);
   DMCXP.cdsProv.Filtered:=True;
end;

procedure TFNuevoProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMCXP.cdsProv.Filter:='';
   DMCXP.cdsProv.Filtered:=False;
   DMCXP.cdsProv.IndexFieldNames:='';
   DMCXP.cdsProv.Close;
//
   DMCXP.cdsQry2.Filter:='';
   DMCXP.cdsQry2.Filtered:=False;
   DMCXP.cdsQry2.IndexFieldNames:='';
   DMCXP.cdsQry2.Close;
end;

procedure TFNuevoProv.dblcNueClAuxExit(Sender: TObject);
begin
   if DMCXP.cdsClAux1.IndexFieldNames<>'CLAUXID' then
      DMCXP.cdsClAux1.IndexFieldNames:='CLAUXID';
   DMCXP.cdsClAux1.SetKey;
   DMCXP.cdsClAux1.FieldByName('CLAUXID').AsString := dblcNueClAux.Text;
   if not DMCXP.cdsClAux1.GotoKey then
   begin
      ShowMessage('Clase de Auxiliar del Código Anterior No Existe');
      dblcNueClAux.SetFocus;
      exit;
   end;
end;

end.
