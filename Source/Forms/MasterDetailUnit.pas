unit MasterDetailUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MasterUnit, ImgList, DbGridUnit, DateTimeUnit, StdCtrls,
  ExtCtrls, ComCtrls, ToolWin, Menus;

type
{ TMasterDetailForm }

  TMasterDetailForm = class(TMasterForm)
    DetailFrame: TDbGridFrame;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MasterDetailForm: TMasterDetailForm;

implementation

{$R *.dfm}

end.
