unit XLUnit;

interface

uses
  SysUtils, Classes, xlcClasses, xlEngine, xlReport,Dialogs,Variants,IBQuery, mnutils,
  OleServer, ExcelXP;

type
  TXLDataModule = class(TDataModule)
    xlReport1: TxlReport;
    ExcelApplication1: TExcelApplication;
  private
    function CreateDocInternal(const Template : String; ID : Integer; var FN : String ):  Boolean;
    function CreateDocInternal2(const Template : String; ID : Integer; var FN : String ):  Boolean;
    { Private declarations }
  public
    class function CreateDoc(const Template : String; ID : Integer; var FN : String  ):  Boolean;
    class function CreateDoc2(const Template : String; ID : Integer; var FN : String  ):  Boolean;
    { Public declarations }
  end;

var
  XLDataModule: TXLDataModule;

implementation

uses ComObj,DAtaUnit;

{$R *.dfm}

class function TXLDataModule.CreateDoc(const Template : String; ID : Integer; var FN : String  ):  Boolean;
begin
  XLDataModule := TXLDataModule.Create(nil);
  result :=  XLDataModule.CreateDocInternal(Template, ID , FN);
  XLDataModule.Free;
end;

class function TXLDataModule.CreateDoc2(const Template : String; ID : Integer; var FN : String  ):  Boolean;
begin
  XLDataModule := TXLDataModule.Create(nil);
  result :=  XLDataModule.CreateDocInternal2(Template, ID , FN);
  XLDataModule.Free;
end;

//-----------------------------------------------//
Function InitExcel : Variant;
begin
 try
 result  := CreateOleObject('Excel.Application');
 except
 result  := NULL;
 end;
end;
//----------------------------------------------//
Function   GetExcelSheet( Excel  : variant ; Book  , Sheet : integer ) : variant ;
begin
 try
 While Excel.WorkBooks.Count   < Book  do Excel.WorkBooks.Add(1);
 While Excel.WorkBooks[ Book ].Worksheets.Count < Sheet do Excel.WorkBooks[ Book ].Worksheets.Add(1);
 result := Excel.WorkBooks[ Book ].Worksheets[ Sheet ] ;
 except
 result := NULL;
 end;
end;

function TXLDataModule.CreateDocInternal(const Template : String; ID : Integer; var FN : String ) :  Boolean;
var
  XL,XLSHeet : Variant;
  V : Variant;
  i : Integer;
  q : TIBQuery;

begin
  if not FileExists(Template) Then
  begin
    MessageDlg(Format('Файл шаблона "%s" не  существует',[Template]),mtError,[mbOK],0);
    Result :=  False;
    Exit;
  end;
  XL := InitExcel;
  XL.Workbooks.Open(Template);

  XLSHeet := GetExcelSheet(XL, 1, 2);
  for I := 1 to 100  do
  begin
    if (VarToStr(XLSHeet.Cells[i,1]) =  '') then break;
    q := TIBQuery.Create(nil);
    q.Name := XLSheet.Cells[i,1];
    q.Database := CommonData.Database;
    q.Transaction :=  CommonData.ReadTransaction;
    q.SQL.Text := XLSHeet.Cells[i,3];

    if q.Params.FindParam('ID') <>  nil then
      q.ParamByName('ID').AsInteger := ID;
    q.Open;
    XLReport1.AddDataSet(q).Range := XLSHeet.Cells[i,2];
  end;
  XL.Quit;

  XL := Unassigned;
  fn := GetTmpFile('.xls');
  XLReport1.XLSTemplate := Template;
 xlReport1.MacroAfter:='DELETE_Q_SHEET';
  XLReport1.Report(EmptyParam, NULL,  fn);
//  ShowMessage((XLReport1.IWorkbooks.Item[1].Sheets.Item[2] as IxlWorksheet).Cells.Item[1,1]);
  result :=  True;
end;


// создание документа - аналога "Уведомления о прибытии"
function TXLDataModule.CreateDocInternal2(const Template : String; ID : Integer; var FN : String ) :  Boolean;
var
  XL,XLSHeet, xlsSheet_data : Variant;
  V : Variant;
  i,j,k : Integer;
  q : TIBQuery;
  SheetNum_s, RowNum_s,ColNum_s,By_s:string;
  s:string;
  SheetNum_i, RowNum_i,ColNum_i,By_i:integer;
  FieldName:string;
  fn_tmp:string;

begin
  if not FileExists(Template) Then
  begin
    MessageDlg(Format('Файл шаблона "%s" не  существует',[Template]),mtError,[mbOK],0);
    Result :=  False;
    Exit;
  end;
  XL := InitExcel;
  XL.Workbooks.Open(Template);

  XLSHeet := GetExcelSheet(XL, 1, 3);
  for I := 1 to 100  do
  begin
    if (VarToStr(XLSHeet.Cells[i,1]) =  '') then break;
    q := TIBQuery.Create(nil);
    q.Name := XLSheet.Cells[i,1];
    q.Database := CommonData.Database;
    q.Transaction :=  CommonData.ReadTransaction;
    q.SQL.Text := XLSHeet.Cells[i,2];

    if q.Params.FindParam('ID_Item') <>  nil then
      q.ParamByName('ID_Item').AsInteger := ID;
    q.Open;
   // XLReport1.AddDataSet(q).Range := XLSHeet.Cells[i,2];

   XLSHeet.Cells[i,2]:='';
   XLSHeet.Cells[i,1]:='';
      // здесь надо обработать данные запроса, расставив значение полей из запроса по местам в листах в соответствии с номаенование переменной

  // S1_Rxxx_Cxxx_by1_имяпеременной       или   S1_Rxxx_Cxxx_by2_имяпеременной

    for J:=0 to q.FieldCount-1 do
    begin
     Fieldname:=q.fields[j].fieldname;
     if pos('SRC_',Fieldname)=1 then  // имя переменной содержит номер листа, ряда, колонки и признак "by"
      begin
      SheetNum_i := strtoint(extractstring('_SH','_ROW',Fieldname));
      RowNum_i := strtoint(extractstring('_ROW','_COL',Fieldname));
      ColNum_i := strtoint(extractstring('_COL','_BY',Fieldname));
      By_i := strtoint(extractstring('_BY','_FN_',Fieldname));
      xlsSheet_data:=GetExcelSheet(XL, 1, SheetNum_i);
      s:=trim(ansiUpperCase(q.fields[j].asstring));
      for k:=0 to length(s)-1 do
        xlsSHeet_data.Cells[RowNum_i,ColNum_I+k*By_i]:=''''+s[k+1];
      end;
    end;
  end;

  fn := GetTmpFile('.xls');
  xl.activeworkbook.sheets[2].delete;
  xl.activeWorkBook.saveas(fn);
  XL.Quit;
  XL := Unassigned;

  //fn := GetTmpFile('.xls');

// XLReport1.XLSTemplate := fn_tmp;
// xlReport1.MacroAfter:='DELETE_Q_SHEET';
// XLReport1.Report( EmptyParam, NULL,  fn);
// ShowMessage((XLReport1.IWorkbooks.Item[1].Sheets.Item[2] as IxlWorksheet).Cells.Item[1,1]);
  result :=  True;
end;
end.
