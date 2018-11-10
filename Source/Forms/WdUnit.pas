unit WdUnit;

interface

uses
  SysUtils, Classes, OleServer, WordXP , IBQuery, Dialogs, Forms;

type
  TWordModule = class(TDataModule)
    wa: TWordApplication;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);

  private
    Document : _Document;
    FID, FID1, FID2  : Integer;
    function CreateDocInternal(const Template : String; ID_Item : Integer; ID_Doc:integer; ID_Staff:integer;var FN : String ):  Boolean;
    procedure OpenDocument(const AFileName : String);
    procedure SaveDocument(const AFileName : String);
    procedure PrepareDataSets;
    procedure InsertData;
    { Private declarations }
  public
    { Public declarations }
    class function CreateDoc(const Template : String; ID_Item : Integer; ID_Doc: integer; ID_staff: Integer; var FN : String  ):  Boolean;
  end;

var
  WordModule: TWordModule;

implementation
uses  DataUnit,mnUtils, Variants, DB, StrUtils;
{$R *.dfm}


class function TWordModule.CreateDoc(const Template : String; ID_Item : Integer; ID_Doc: integer; ID_staff: integer; var FN : String  ):  Boolean;
begin
  WordModule := TWordModule.Create(nil);
  result :=  WordModule.CreateDocInternal(Template, ID_Item , ID_doc, ID_staff,  FN);
  WordModule.Free;
end;

procedure TWordModule.OpenDocument(const AFileName : String);
var
  FileName,
  ConfirmConversions,
  ReadOnly,
  AddToRecentFiles,
  PasswordDocument,
  PasswordTemplate,
  Revert,
  WritePasswordDocument,
  WritePasswordTemplate,
  Format,
  encoding,
  wordvisible,
  OpenAndRepair,
  DocumentDirection,
  NoEncodingDialog : OleVariant;
begin
  FileName := AFileName;
  ConfirmConversions:=False;
  ReadOnly:=False;
  AddToRecentFiles:=False;
  PasswordDocument:='';
  PasswordTemplate:='';
  Revert:=False;
  WritePasswordDocument:='';
  encoding:='';
  DocumentDirection:=false;
  OpenAndRepair:=false;
  NoEncodingDialog:=false;
  WordVisible:= True;
  WritePasswordTemplate:='';
  Format:=wdOpenFormatAuto;
  //showmessage('before WA.Documents. Open  '+Filename);
  WA.Documents.Open( FileName, ConfirmConversions, ReadOnly, AddToRecentFiles, PasswordDocument,
                     PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate, Format, encoding,
                     wordvisible, OpenAndRepair, DocumentDirection, NoEncodingDialog);
  //showmessage('before WA.Documents.Item  '+Filename);
  Document := WA.ActiveDocument;// .Documents.Item.(0);{FileName)};
end;

procedure TWordModule.SaveDocument(const AFileName : String);
var
  FileName,
  OriginalDocumentFormat,
  LockComments,
  Password,
  AddToRecentFiles,
  WritePassword,
  ReadOnlyRecommended,
  EmbedTrueTypeFonts,
  SaveNativePictureFormat,
  SaveFormsData,
  SaveASOCELETTER : OleVariant; 
begin
  AddToRecentFiles := False;
  WritePassword := '';
  ReadOnlyRecommended := False;
  EmbedTrueTypeFonts := False;
  SaveNativePictureFormat := False;
  SaveFormsData := False;
  SaveASOCELETTER := False;
  OriginalDocumentFormat := wdOriginalDocumentFormat;
  FileName := AFileName;
  LockComments := False;
  Password := '';

  Document.SaveAs( FileName , OriginalDocumentFormat,
      LockComments, Password, AddToRecentFiles,WritePassword,ReadOnlyRecommended,
      EmbedTrueTypeFonts, SaveNativePictureFormat, SaveFormsData,SaveASOCELETTER,SaveASOCELETTER,SaveASOCELETTER,SaveASOCELETTER,SaveASOCELETTER,SaveASOCELETTER);
  Document := WA.activedocument;//Documents.Item(FileName);
end;
//------------------------------------------------------------------------------
procedure  TWordModule.InsertData;
var
  i, j : Integer;
  V : Variable;
  vn  : OleVariant;
  t : Table;
  BeforeRow : OleVariant;
  r : OleVariant;
  q : TComponent;
  CurRow :  Integer;
  QTable_Name:Olevariant;

  FindText: OleVariant;  MatchCase: OleVariant;
  MatchWholeWord: OleVariant;  MatchWildcards: OleVariant;
  MatchSoundsLike: OleVariant;  MatchAllWordForms: OleVariant;
  FindForward: OleVariant;  Wrap: OleVariant;  Format: OleVariant;
  ReplaceWith: OleVariant;  Replace: OleVariant;
  MatchKashida: OleVariant;  MatchDiacritics: OleVariant;
  MatchAlefHamza: OleVariant;  MatchControl: OleVariant;

  HomeUnit, Extend :olevariant;

begin
  For i := 0 to ComponentCount -1  do
  If Components[i] is TIBQuery then
  with Components[i] as TIBQuery do
  begin

    for j := 0  to Fields.Count -1  do
    begin
      vn := Name + '_' + Fields[j].FieldName;
      V := Document.Variables.Item(vn);
      if V <> nil then
      begin
        If Fields[j].AsString > '' then
          V.Value := Fields[j].AsString
        Else
          V.Value := ' ';
      end;
    end;
  end;

  // -- Вставляем  таблицу
  for i :=  Document.Tables.Count downto 2 do
  begin
    t := Document.Tables.Item(i);
    CurRow := 1;
    while CurRow <= t.Rows.Count do
    begin
      q := FindComponent(Trim(t.Cell(CurRow,1).Range.Text));
      QTable_Name:=Trim(t.Cell(CurRow,1).Range.Text);
      if q <> nil  then break;
      Inc(CurRow);
    end;
    if (q<>nil)  and (q is TIBQuery) then
    begin
      with q as TIBQuery do
      begin
        First;
        while  Not Eof  do
        begin
          BeforeRow := t.Rows.Item(CurRow);
          t.Rows.Add(BeforeRow);
          for j := 0  to Fields.Count - 1  do
            t.Rows.Item(CurRow).Cells.Item(j+1).Range.Text := Fields[j].AsString;
          Inc(CurRow);
          Next;
        end;
      end;
      t.Rows.Item(CurRow).Delete;
    end;
    try
     T.select;
    document.Application.Selection.copy;
    document.Application.Selection.Find.clearformatting;
    FindText:=QTABLE_NAME+'_DATA';
    HomeUnit := wdStory;
    document.Application.selection.HomeKey(homeUnit,Extend);
    FindForward:=wdForward;
    if document.Application.Selection.Find.Execute(FindText,MatchCase,
                      MatchWholeWord, MatchWildcards,
                      MatchSoundsLike, MatchAllWordForms,
                      FindForward,  Wrap, Format,
                     ReplaceWith, Replace,
                      MatchKashida, MatchDiacritics,
                      MatchAlefHamza, MatchControl) then
     begin
     document.Application.Selection.PasteAsNestedTable;
     T.Delete;
     end;
       except
    end; 
  end;

end;
//------------------------------------------------------------------------------
function TWordModule.CreateDocInternal(const Template : String; ID_Item : Integer; ID_Doc:integer; ID_staff:integer; var FN : String ):  Boolean;
begin
  FID := ID_Item;
  FID1 := ID_Doc;
  FID2 := ID_staff;
  WA.connectKind := ckRunningOrNew;
  WA.autoquit := false;
  //WA.Visible := true;
  WA.Visible := false;
  WA.Connect;
  //showmessage('before open '+Template);
  OpenDocument( Template );
  FN := GetTmpFile('.doc');
  //showmessage('before save template  '+FN);
  SaveDocument( FN ) ;
    //showmessage('before PrepareDataSets  '+FN);
  PrepareDataSets;
      //showmessage('before InsertData   '+FN);
  InsertData;
  WA.ActiveWindow.View.ShowFieldCodes:=False;
  Document.Fields.Update;
    //showmessage('before SaveDocument '+FN);
  SaveDocument( FN ) ;
  wa.Quit;
  result :=  True;
//  wa.close
//  Wa.Disconnect;
//  Wa.Free;
end;
//------------------------------------------------------------------------------
procedure TWordModule.DataModuleCreate(Sender: TObject);
begin
end;
//------------------------------------------------------------------------------
procedure TWordModule.DataModuleDestroy(Sender: TObject);
begin
end;
//------------------------------------------------------------------------------
procedure TWordModule.PrepareDataSets;
var
  r,c : Integer;
  Tbl  : Table;
  qn : String;
  q  : TIBQuery;
  idx : OleVariant;
  i : Integer;
  s,e : OleVariant;
  OleObj : Variant;
begin
  idx := 1;
  Tbl := Document.Tables.Item(idx);
  for r := 1  to Tbl.Rows.Count  do
  begin
    qn := AnsiUpperCase( Trim(Tbl.Cell(r,1).Range.Text) );
//    for i := 1  to Length(qn) do if not (qn[i] in ['A'..'Z','0'..'9']) then qn[i] := ' ';
//    qn := Trim(Tbl.Cell(r,1).Range.Text);
    q := CommonData.CreateDataSet(Self);
    q.Name := qn;
    q.SQL.Text := Trim(Tbl.Cell(r,2).Range.Text);
    if application.Title = 'АСУ Отдела Международного Сотрудничества' then
    begin
     if q.params.FindParam('ID_ITEM')<>nil then
              q.Params.ParamByName('ID_ITEM').asinteger := FID;
     if q.params.FindParam('ID_DOC')<>nil then
              q.Params.ParamByName('ID_DOC').asinteger := FID1;
     if q.params.FindParam('ID_STAFF')<>nil then
         q.Params.ParamByName('ID_STAFF').asinteger := FID2;
      {  If q.Params.Count=1 then q.paramByName('ID_ITEM').AsInteger := FID;
        If q.Params.Count=2 then
         begin
         q.paramByName('ID_ITEM').AsInteger := FID;
         q.paramByName('ID_DOC').AsInteger := FID1;
         end;
        If q.Params.Count=3 then
         begin
         q.paramByName('ID_ITEM').AsInteger := FID;
         q.paramByName('ID_DOC').AsInteger := FID1;
         q.paramByName('ID_STAFF').AsInteger := FID2;
         end;
       }
    end
    else
    begin
        if q.params.FindParam('ID')<>nil then q.Params.ParamByName('ID').asinteger := FID;
        If q.Params.Count=1 then q.params[0].AsInteger := FID;
        If q.Params.Count=2 then
         begin
          q.params[0].AsInteger := FID;
          q.params[1].AsInteger := FID1;
         end;
        If q.Params.Count=3 then
         begin
          q.params[0].AsInteger := FID;
          q.params[1].AsInteger := FID1;
          q.params[2].AsInteger := FID2;
         end;
    end;
  //  q.sql.SaveToFile('sql.sql');
   q.Open;
  end;
  Tbl.Delete;
  s := 1;
  e := 1;
  Document.Range(s,e).Delete(s,e);
  {
  OleObj := wa.Documents.Item(idx).ActiveWindow.Panes.Item(idx);
  OleObj := OleObj.Pages.Item(1);
  OleObj := OleObj.Breaks.Item(1);
  ShowMessage(OleObj.Range.Start);
  ShowMessage(OleObj.Range.End);
  }
//  wa.Documents.Item(1).b
end;


end.
