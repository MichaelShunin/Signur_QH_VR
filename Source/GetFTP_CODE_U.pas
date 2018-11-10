unit GetFTP_CODE_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, StdCtrls, cxControls, cxContainer, cxEdit,
  cxMaskEdit, cxSpinEdit;

type
  TForm1 = class(TForm)
    cxCurrentNomer: TcxSpinEdit;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    cxFTP_CODE: TcxTextEdit;
    procedure cxSpinEdit1PropertiesChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.cxSpinEdit1PropertiesChange(Sender: TObject);
var
  CurrentNomer:Integer;
  FTP_Code:Integer;
begin                                      (*
   currentnOMER:=  cxcurrentNomer.Value;
   currentNomer :=currentNomer+2000;
   FTP_CODE :=(CurrentNomer*CurrentNomer);
   ftp_code:=ftp_code div 10;
   ftp_code :=ftp_code mod 10000;
   FTP_Code:=Round(ftp_code+sqrt(CurrentNomer*12.77)+9999) mod 10000;
   if FTP_Code<10 then ftp_code:=ftp_code+2345
    else
     begin
       if FTP_Code<100 then ftp_code:=ftp_code+3333
        else
         begin
          if FTP_Code<1000 then ftp_code:=ftp_code+1111

         end

     end;

   cxFTP_CODE.text:=inttostr(FTP_Code);  *)

   try
   currentnOMER:=    cxcurrentNomer.Value;
   FTP_CODE := round(ln(ln(currentnOMER+3))*10000000) mod 10000 ;
 (*  currentNomer :=currentNomer+2000;
   FTP_CODE :=(CurrentNomer*CurrentNomer);
   ftp_code:=ftp_code div 10;
   ftp_code :=ftp_code mod 10000;
   FTP_Code:=Round(ftp_code+sqrt(CurrentNomer*12.77)+9999) mod 10000;
  *)
   if FTP_Code<10 then ftp_code:=ftp_code+1000
    else
     begin
       if FTP_Code<100 then ftp_code:=ftp_code+2000
        else
         begin
          if FTP_Code<1000 then ftp_code:=ftp_code+3000

         end

     end;

   cxFTP_CODE.text:=inttostr(FTP_Code);
   except
    cxFTP_CODE.text :='';
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
   cxFTP_CODE.SelectAll;
   cxFTP_CODE.CopyToClipboard;
end;

end.
