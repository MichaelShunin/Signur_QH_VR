unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EtHtmlClasses, EtHtmlControls;

type
  THTMLReport = class(TForm)
    HTMLPage: TEtHtmlPage;
    EtHtmlPanel1: TEtHtmlPanel;
    EtHtmlLabel1: TEtHtmlLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HTMLReport: THTMLReport;

implementation

{$R *.dfm}

end.
