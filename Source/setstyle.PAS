unit Setstyle;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, Grids, DBGrids, ExtCtrls, DBCtrls, Buttons,
  StdCtrls, IBCustomDataSet, IBTable, DBGridEh;

type
  TSetStyle_Form = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGridEh;
    DataSource2: TDataSource;
    DBGrid2: TDBGridEh;
    DBNavigator1: TDBNavigator;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Button1: TButton;
    ColorDialog1: TColorDialog;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    BitBtn2: TBitBtn;
    ApplyButton: TButton;
    Button5: TButton;
    Bevel1: TBevel;
    btnDefault: TButton;
    Table_Style: TIBTable;
    Table_Ch_Style: TIBTable;
    Table_StyleID_STYLE: TIntegerField;
    Table_StyleID_NAME: TIBStringField;
    Table_Ch_StyleID_CHANAL_STYLE: TIntegerField;
    Table_Ch_StyleID_IM_STYLE: TIntegerField;
    Table_Ch_StyleCH_NOMER: TSmallintField;
    Table_Ch_StyleCH_COLOR: TIntegerField;
    Table_Ch_StyleCH_CURVE_STYLE: TSmallintField;
    Table_Ch_StyleCH_CURVE_WIDTH: TSmallintField;
    Table_Ch_StyleCH_HIDE: TSmallintField;
    procedure DBGrid2DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure Table_Ch_Style_Ch_Curve_styleGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure Table_Ch_Style_Ch_HideGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  colorsTMP : array[1..16] of longint;
  LinestylesTMP : array[1..16] of byte;
  LineWidthTMP : array[1..16] of byte;
  LineHideTMP : array[1..16] of boolean;
  end;

var
  SetStyle_Form: TSetStyle_Form;

implementation
 uses tvc_u, config, DM_dm;
{$R *.DFM}

procedure TSetStyle_Form.DBGrid2DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
 if field.FieldName =   'Ch_Color' then
  begin
   DBGrid2.Canvas.Brush.color:=Field.asInteger;
      DBGrid2.Canvas.FillRect(Rect);
  end;
 end;

procedure TSetStyle_Form.Table_Ch_Style_Ch_Curve_styleGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 case Table_Ch_StyleCh_Curve_style.Value of
   1:Text:='Ступенчатая';
   2:Text:='Точечная';
   3:Text:='Прямоугольники';
   4:Text:='RoundRect';
   5:Text:='Линейная';
   6:Text:='Пунктир';
   7:Text:='Линия-точки';
   8:Text:='Линия(тчк-тире)';
   9:Text:='Линия(тчктчк-)';
   10:Text:='Линия+Прямоуг';
   11:Text:='Линия+Точки';
end;
end;

procedure TSetStyle_Form.SpeedButton1Click(Sender: TObject);
begin
 Table_ch_Style.edit;
 if Table_Ch_StyleCh_Curve_style.Value < 11 then Table_Ch_StyleCh_Curve_style.Value:=Table_Ch_StyleCh_Curve_style.Value+1;
 Table_ch_Style.post;
end;

procedure TSetStyle_Form.SpeedButton2Click(Sender: TObject);
begin
 Table_ch_Style.edit;
 if Table_Ch_StyleCh_Curve_style.Value >1 then Table_Ch_StyleCh_Curve_style.Value:=Table_Ch_StyleCh_Curve_style.Value-1;
 Table_ch_Style.post;
end;

procedure TSetStyle_Form.SpeedButton3Click(Sender: TObject);
begin
 Table_ch_Style.edit;
 if Table_Ch_StyleCh_Curve_width.Value <50 then Table_Ch_StyleCh_Curve_width.Value:=
          Table_Ch_StyleCh_Curve_width.Value+1;
 Table_ch_Style.post;
end;

procedure TSetStyle_Form.SpeedButton4Click(Sender: TObject);
begin
 Table_ch_Style.edit;
 if Table_Ch_StyleCh_Curve_width.Value >1 then Table_Ch_StyleCh_Curve_width.Value:=
     Table_Ch_StyleCh_Curve_width.value-1;
 Table_ch_Style.post;
end;

procedure TSetStyle_Form.Button1Click(Sender: TObject);
begin
 if ColorDialog1.Execute then
   begin
    Table_ch_Style.edit;
    Table_Ch_StyleCh_color.Value:=ColorDialog1.Color;
    Table_ch_Style.post;
   end;
end;

procedure TSetStyle_Form.Button2Click(Sender: TObject);
 var
  color:longint;
  interp:word;
  Cwidth:word;
  bHide:boolean;
begin
 Color:=Table_Ch_StyleCh_Color.Value;
 Interp:=Table_Ch_StyleCh_Curve_style.Value;
 Cwidth:=Table_Ch_StyleCh_Curve_Width.Value;
 bHide:=boolean(Table_Ch_StyleCh_Hide.Value);
 Table_Ch_Style.DisableControls;
 if sender = Button2 then Table_ch_Style.First;
 while  not Table_ch_Style.EOF do
   begin
    Table_ch_Style.edit;
    if DBGrid2.SelectedField.FieldName = 'Ch_Nomer' then
     begin
      Table_Ch_StyleCh_Color.Value:=Color;
      Table_Ch_StyleCh_Curve_style.Value:=Interp;
      Table_Ch_StyleCh_Curve_Width.Value:=Cwidth;
      Table_Ch_StyleCh_Hide.Value:=integer(bHide);
     end;
    if DBGrid2.SelectedField.FieldName = 'Ch_Hide' then Table_Ch_StyleCh_Hide.Value:=integer(bHide);
    if DBGrid2.SelectedField.FieldName = 'Ch_Curve_Width' then Table_Ch_StyleCh_Curve_Width.Value:=Cwidth;
    if DBGrid2.SelectedField.FieldName = 'Ch_Color' then Table_Ch_StyleCh_Color.Value:=Color;
    if DBGrid2.SelectedField.FieldName = 'Ch_Curve_style' then
     Table_Ch_Stylech_Curve_Style.Value:=Interp;
    Table_ch_Style.post;
    Table_ch_Style.Next;
   end;
Table_Ch_Style.EnableControls;
end;

procedure TSetStyle_Form.Button3Click(Sender: TObject);
 var
  color:longint;
  interp:word;
  Cwidth:word;
  i:integer;
  bHide:boolean;
begin
 Color:=Table_Ch_StyleCh_Color.Value;
 Interp:=Table_Ch_StyleCh_Curve_style.Value;
 Cwidth:=Table_Ch_StyleCh_Curve_Width.Value;
 bHide:=boolean(Table_Ch_StyleCh_Hide.Value);
 Table_ch_Style.First;
 Table_Style.Append;
 Table_Style.Post;
 Table_Ch_Style.DisableControls;
 for i:=1 to 16 do
   begin
    Table_ch_Style.Insert;
    Table_Ch_StyleID_Im_Style.Value:=Table_StyleId_Style.Value;
    Table_Ch_StyleCh_Nomer.Value:=i;
    if DBGrid2.SelectedField.FieldName = 'Ch_Nomer' then
     begin
      Table_Ch_StyleCh_Color.Value:=Color;
      Table_Ch_StyleCh_Curve_style.Value:=Interp;
      Table_Ch_StyleCh_Curve_Width.Value:=Cwidth;
      Table_Ch_StyleCh_Hide.Value:=integer(bHide);
     end;
   if DBGrid2.SelectedField.FieldName = 'Ch_Hide' then Table_Ch_StyleCh_Hide.Value:=integer(bHide);
   if DBGrid2.SelectedField.FieldName = 'Ch_Curve_Width' then Table_Ch_StyleCh_Curve_Width.Value:=Cwidth;
   if DBGrid2.SelectedField.FieldName = 'Ch_Color' then Table_Ch_StyleCh_Color.Value:=Color;
   if DBGrid2.SelectedField.FieldName = 'Ch_Curve_Style' then Table_Ch_Stylech_Curve_Style.Value:=Interp;
    Table_ch_Style.post;
    Table_ch_Style.Next;
   end;
Table_Ch_Style.EnableControls;

end;

procedure TSetStyle_Form.Button4Click(Sender: TObject);
begin
if Table_Style.RecordCount>1 then
 begin
 Table_ch_Style.First;
 while not Table_Ch_Style.EOF do
  Table_ch_Style.delete;
 Table_style.delete;
 end
  else
   Showmessage ('Должен быть хотя бы один стиль!');
end;

procedure TSetStyle_Form.ApplyButtonClick(Sender: TObject);
 var
  BookMark:TBookmark;
  i:byte;
begin
 BookMark:=Table_Ch_Style.GetBookMark;
 Table_Ch_Style.DisableControls;
 Table_Ch_Style.First;
 Table_ch_Style.First;
 i:=1;
 while not Table_ch_Style.EOF do
  begin
   ColorsTMP[i]:=Table_Ch_StyleCh_Color.Value;
   LineStylesTMP[i]:=Table_Ch_StyleCh_Curve_style.Value;
   LineWidthTMP[i]:=Table_Ch_StyleCh_Curve_Width.Value;
   LineHideTMP[i]:=boolean(Table_Ch_StyleCh_Hide.Value);
   if sender = btnDefault then
    begin
      Colors[i]:=Table_Ch_StyleCh_Color.Value;
      LineStyles[i]:=Table_Ch_StyleCh_Curve_style.Value;
      LineWidth[i]:=Table_Ch_StyleCh_Curve_Width.Value;
      LineHide[i]:=boolean(Table_Ch_StyleCh_Hide.Value);
      AppConfig.IniFile.Writeinteger('Channel','Chanal_Color_'+intToStr(i),Colors[i]);
      AppConfig.IniFile.Writeinteger('Channel','Chanal_Style_'+intToStr(i),LineStyles[i]);
      AppConfig.IniFile.Writeinteger('Channel','Chanal_Width_'+intToStr(i),LineWidth[i]);
      if LineHide[i] then AppConfig.IniFile.Writeinteger('Channel','Chanal_Hide_'+intToStr(i),1) else
       AppConfig.IniFile.Writeinteger('Channel','Chanal_Hide_'+intToStr(i),0);
    end;
   Table_ch_Style.Next;
   inc(i);
  end;
 Table_Ch_Style.EnableControls;
end;

procedure TSetStyle_Form.DBGrid2DblClick(Sender: TObject);
begin
 if DBGrid2.SelectedField.FieldName = 'Ch_Hide' then
  begin
   Table_Ch_Style.Edit;
   Table_Ch_StyleCh_Hide.Value:= not Table_Ch_StyleCh_Hide.Value;
   Table_Ch_Style.Post;
  end;
 if DBGrid2.SelectedField.FieldName = 'Ch_Color' then Button1Click(nil);
end;

procedure TSetStyle_Form.Table_Ch_Style_Ch_HideGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 if Table_Ch_StyleCh_Hide.Value =integer(true) then Text:='да' else
    Text:='нет';
end;

procedure TSetStyle_Form.FormCreate(Sender: TObject);
begin
//Get_Lang_Par({Lang_Ini,}self,'SetStyleForm');
//Save_Lang_Par(Lang_Ini,self,'SetStyleForm');
 table_Style.open;
 Table_CH_Style.open;
end;

end.
