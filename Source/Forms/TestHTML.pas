unit TestHTML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, EtHtmlDBControls, StdCtrls, EtHtmlClasses,
  DBCtrls, EtHtmlControls, DB, IBCustomDataSet, IBTable, OleCtrls, SHDocVw,
  MSHtml;

type
  TTestHTMLForm = class(TForm)
    Table: TIBTable;
    DataSource1: TDataSource;
    WebBrowser1: TWebBrowser;
    procedure FormShow(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestHTMLForm: TTestHTMLForm;

implementation

{$R *.dfm}

procedure TTestHTMLForm.FormShow(Sender: TObject);
begin
  Table.Open;
  WebBrowser1.Navigate('#');
end;

procedure TTestHTMLForm.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  S: string;
  Document: IHtmlDocument2;
begin
  S:=EtHtmlPage1.HTMLPageScript(0);
  Document := WebBrowser1.Document as IHtmlDocument2;
  if Assigned(Document) then Document.body.innerHTML := S;
end;

end.
