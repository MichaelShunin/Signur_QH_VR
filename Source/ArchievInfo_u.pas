unit ArchievInfo_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, common_f, StdCtrls, Buttons, ExtCtrls;

type
  TArchievInfoForm = class(TCommonForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label3: TLabel;
    ArchievName: TStaticText;
    GroupBox1: TGroupBox;
    Info: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ArchievInfoForm: TArchievInfoForm;

implementation

{$R *.dfm}

end.
