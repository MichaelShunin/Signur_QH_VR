unit Audio_u;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Spin,  MPlayer,
  tvc_U, Gauges,FileBuff,main_F, Buttons,  ExtCtrls,  Mask, {ServEdit,}
  ToolEdit, RXSlider, Menus, rxstrutils;

type
TaudioCFGRec= record
        FreqMult:real;
        Fragmentation,Ku:smallint;
         end  ;
TAudioForm = class(TForm)
    MarkButton: TButton;
    Timer1: TTimer;
    Label8: TLabel;
    Panel1: TPanel;
    MP: TMediaPlayer;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PrevChan: TSpeedButton;
    NextChan: TSpeedButton;
    Chanal_Name: TLabel;
    GroupBox1: TGroupBox;
    DAC_Bit: TRadioGroup;
    Label6: TLabel;
    Fragmentation: TSpinEdit;
    Ku: TSpinEdit;
    Label4: TLabel;
    Slider1: TRxSlider;
    SourceSignal: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    FdADC: TEdit;
    T_ADC: TEdit;
    Label7: TLabel;
    nPointAll: TEdit;
    Label5: TLabel;
    FreqMult: TEdit;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    T_DAC: TEdit;
    Label10: TLabel;
    Fd_DAC: TEdit;
    Button1: TButton;
    Poloska: TGauge;
    CheckBox1: TCheckBox;
    cbWAVSave: TCheckBox;
    edWAVName: TFilenameEdit;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FreqMultChange(Sender: TObject);
    procedure MPClick(Sender: TObject; Button: TMPBtnType;
      var DoDefault: Boolean);
    procedure MarkButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PrevChanClick(Sender: TObject);
    procedure Slider1SliderMove(Sender: TObject);
    procedure Slider1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);

  private
    { Private declarations }
    AudioCFG : TAudioCfgRec;
    WavShapka:TWavShapka;
    WavFile:TFileStream;
    FileSource:TBufferedFile;
    Maximum:real;
    Rez1:real;
  public
    { Public declarations }
   SigTabRec:TSigTabRec;
{   ViewPage:string;
   ViewNomer:longint;}
   MessHandle:THandle;
   MaxOnCurve,MinOnCurve:real;
   Mult:real;
   Procedure Nachat;

  end;

var
  AudioForm: TAudioForm;

implementation
 uses Image_U,mdrv, config, getgwrez, DM_dm;
{$R *.DFM}

procedure TAudioForm.FormCreate(Sender: TObject);
var FF:File of TAudioCFGRec;
begin
// Get_Lang_Par({Lang_Ini,}self,'Audio');
 AudioWavFile:=dm.ActiveStoragepath+AudioWavFileName;
 SigTabRec.DeltX:=1;
 Mult:=1;
 AudioCFG.FreqMult:=1;AudioCFG.Fragmentation:=5;AudioCFG.Ku:=1;
 assignFile(FF,AudioParFile);
   try
     Reset(FF);Read(FF,AudioCFG);CloseFile(FF);
    except
       on EInOutError do
        begin
         MessageDlg(AudioParFile +' I/O error.', mtError, [mbOk], 0);
         AudioCFG.FreqMult:=1;AudioCFG.Fragmentation:=5;AudioCFG.Ku:=1;
        end;
      end;

  Mult:=AudioCFG.FreqMult;
  Ku.Value:=AudioCFG.Ku;
  Fragmentation.Value:=AudioCFG.Fragmentation;
  MP.TimeFormat:=tfSamples;
  Label8.Visible:=false;
  {Slider1.Value:=1;}
  Slider1.MinValue:=0;Slider1.Value:=0;
  Slider1.Visible:=false;
  FreqMult.Text:=FloatToStrF(AudioCFG.FreqMult,ffGeneral,FormatAll,FormatAfterPoint);
{  Save_Lang_Par(Lang_Ini,self,'Audio');}
end;

procedure TAudioForm.FormClose(Sender: TObject; var Action: TCloseAction);
var FF:File of TAudioCFGRec;i:smallint;
begin
if  MP.FileName=AudioWavFile then
 begin
  Mp.Close;
  DeleteFile(PChar(AudioWavFile));
 end;
 try
   AudioCFG.FreqMult:=Mult;
  except
   on EConvertError do AudioCFG.FreqMult:= 1;
  end;
 AudioCFG.kU:=Ku.Value;
 AudioCFG.Fragmentation:=Fragmentation.Value;
 assignFile(FF,AudioParFile);
   try
     Rewrite(FF);write(FF,AudioCFG);CloseFile(FF);
    except
       on EInOutError do
         MessageDlg(AudioParFile +' I/O error.', mtError, [mbOk], 0);
      end;

 Action:=caFree;
 for i:=0 to Application.ComponentCount-1 do
    if ((Application.Components[i] is TImageForm ) and
       (TImageForm(Application.Components[i]).Handle = MessHandle))
        then TImageForm(Application.Components[i]).WindowState:=wsNormal;
end;

procedure TAudioForm.Button3Click(Sender: TObject);
begin
 Close;
end;

procedure TAudioForm.FormShow(Sender: TObject);
begin
 FdADC.Text:=FloatToStrF(1/SigtabRec.DeltX,ffFixed,7,2);
 T_Adc.Text:=FloatToStrF(SigTabRec.DeltX*SigTabRec.PointAll,ffFixed,7,2);
 Fd_DAC.Text:=FloatToStrF(1/SigtabRec.DeltX*Mult,ffFixed,7,2);
 T_DAC.Text:=FloatToStrF(SigTabRec.PointAll*SigtabRec.DeltX/Mult,ffFixed,7,2);
 NPointAll.Text:=IntToStr(SigTabRec.PointAll);
end;

procedure TAudioForm.Button1Click(Sender: TObject);
const NrezArray = 4095;
type TRezArray8 =array[0..NRezArray] of byte;
     TRezArray16 =array[0..NRezArray] of smallint;
var
 WavRez8:Byte;WavRez16:smallint;
 i:longint;
 status:smallint;
 RezArray8:^TRezArray8;
 RezArray16:^TRezArray16;
 cRezArray:smallint;
 GetRezRec:TGetRezRec;

procedure SaveWAVFile;
begin
  if not cbWAVSave.Checked then Exit;
  if edWAVName.Text='' then begin MessageDlg('Не задано имя WAV-файла!',mtError,[mbOK],0); Exit; end;
  if FileExists(edWAVName.Text) then
    if mrYes<>MessageDlg('Файл '+edWAVName.Text+' существует. Переписать?',mtWarning,[mbYes,mbNo],0) then Exit;
  CopyFile(pchar(AudioWavFile),pchar(delchars(edWAVName.Text,'"')),false);
end;

begin
 if FreqMult.Text='' then exit;
 if 1/SigtabRec.DeltX*Mult > 44100 then
      begin
       FreqMult.Text:=FloatToStrF(44100*SigtabRec.DeltX,ffGeneral,FormatAll,FormatAfterPoint);
       MessageDlg('Частота аудио-сигнала не более 44100 Гц', mtError,[mbOk], 0);
       exit;
      end;
if  MP.FileName=AudioWavFile then
 begin
  Mp.Close;
  DeleteFile(PChar(AudioWavFile));
 end;
with WavShapka do
 begin
     Poloska.Visible:=True;
     RiffStr[0]:='R';RiffStr[1]:='I';RiffStr[2]:='F';RiffStr[3]:='F';
     WaveFmt[0]:='W';WaveFmt[1]:='A';WaveFmt[2]:='V';WaveFmt[3]:='E';
     WaveFmt[4]:='f';WaveFmt[5]:='m';WaveFmt[6]:='t';WaveFmt[7]:=' ';
     PCM_Format:=$10;
     Tip_Format:=1;
     NChannels:=1;
     NSamplesPerSec:=round(1/SigtabRec.DeltX*Mult);
     case Dac_Bit.ItemIndex of
      0:begin BitsPerSample:=8; GetMem(RezArray8,sizeOf(TRezArray8)); end;
      1:begin BitsPerSample:=16;      GetMem(RezArray16,sizeOf(TRezArray16)); end;
     end;
     NAvgPerSec:=round (nChannels*NSamplesPerSec*BitsPerSample / 8);
     NBlockAlaign:=round(nChannels*BitsPerSample / 8);
     DataStr[0]:='d';DataStr[1]:='a';DataStr[2]:='t';DataStr[3]:='a';
     Razmer2:=SigTabRec.PointAll*(Dac_Bit.ItemIndex+1);
     Razmer1:=Razmer2+SizeOf(TWavShapka)-4;
    end;
    WavFile:=TFileStream.Create(AudioWavFile,fmcreate);
//    WavFile.Rewrite;
    WavFile.Write(WavShapka,SizeOf(WavShapka));
    if Abs(MaxOnCurve)>abs(MinOnCurve) then Maximum:=Abs(MaxonCurve)
     else Maximum:=Abs(MinOnCurve);
    if Maximum=0 then maximum:=1;
    FileSource:=TBufferedFile.Create(SigTabRec.FileDat_abs,4096);
    FileSource.Reset;
    Poloska.Progress:=0  ;
    Poloska.MinValue:=0;
    Poloska.maxValue:=SigTabRec.pointAll;
    with GetRezRec do
     begin
      Shag:=cSizeRez[SigTabRec.RezType];
      FileDat:=FileSource;
      Point:=0;
      Seek_Start:=SigTabRec.Seek_Start;
      RezType:=SigTabRec.RezType;
      A0:=SigTabRec.A0;A1:=SigTabRec.A1;A2:=SigTabRec.A2; A3:=SigTabRec.A3;
     end;
    cRezArray:=0;
    for i:=0 to SigTabRec.PointAll-1 do
     begin
      GetRezRec.Point:=i;
      GetRezRec.bSeek:=i=0;
      GetRezFromFile_New(GetRezRec);
      Rez1:=GetRezRec.Rez;
      if abs(Rez1*Ku.Value)<Maximum then Rez1:=Rez1*Ku.Value
       else
        begin
         if Rez1>0 then Rez1:=Maximum else Rez1:=-Maximum;
        end;
      case Dac_Bit.ItemIndex of
       0:begin
          WavRez8:=round(Rez1*127/Maximum+128);
          RezArray8^[cRezArray]:=WavRez8; inc(cRezArray);
         if cRezArray>NRezArray then
          begin
           WavFile.Write(RezArray8^,SizeOf(TRezArray8));
           cRezArray:=0;
          end;
         end;
       1:begin
          WavRez16:=round(Rez1*32767/Maximum);
          RezArray16^[cRezArray]:=WavRez16; inc(cRezArray);
         if cRezArray>NRezArray then
          begin
           WavFile.Write(RezArray16^,SizeOf(TRezArray16));
           cRezArray:=0;
          end;
         end;
      end;
      if i mod 5000 = 0 then
       begin
        Poloska.Progress:=i  ;
        Application.ProcessMessages;
       end;
    end;
    FileSource.Close;FileSource.destroy;
    if cRezArray<>0 then
     case Dac_Bit.ItemIndex of
       0:begin WavFile.Write(RezArray8^,cRezArray);FreeMem(RezArray8,sizeOf(TRezArray8));end;
       1:begin WavFile.Write(RezArray16^,cRezArray*2);FreeMem(RezArray16,sizeOf(TRezArray16));end;
    end;
    WavFile.Destroy;
    MP.FileName:={ 'C:\Games\00 BEETHOVEN___SONATA_N14__MOO.WAV';//}AudioWavFile;
    MP.Enabled:=True;
    Poloska.Visible:=False;
    Panel1.Visible:=True;

    SaveWAVFile;

    Nachat;
end;


Procedure TAudioForm.Nachat;
begin
    Slider1.MaxValue:=SigTabRec.PointAll; Slider1.MinValue:=0;Slider1.Value:=0;
    Slider1.Visible:=True;
    MP.Open;
     MP.StartPos:=0;MP.Position:=0;
     MP.TimeFormat:=tfSamples;
     MP.EnabledButtons:=MP.EnabledButtons+[btBack]+[btStep];
     Label8.Caption:=DateTimeToStr(SigTabRec.DateTimeStart+(MP.Position*SigTabRec.DeltX/24/3600));
     Label8.Visible:=true;
     Slider1.Value:=Mp.Position;
 end;

procedure TAudioForm.FreqMultChange(Sender: TObject);
var Byaka:boolean;
begin
 if FreqMult.Text='' then exit;
 mult:=1;
 try
   Mult:=StrToFloat(FreqMult.Text);
  except
   on EConvertError do Mult:=1;
  end;
 if abs(Mult)<0.0000001 then Mult:=1;
 Byaka:=SigtabRec.DeltX<>0.0;
 if Byaka then
  begin
    Fd_DAC.Text:=FloatToStrF(1/SigtabRec.DeltX*Mult,ffFixed,7,2);
    if Mult<>0 then  T_DAC.Text:=
      FloatToStrF(SigTabRec.PointAll*SigtabRec.DeltX/Mult,ffFixed,7,2);
  end;
end;

procedure TAudioForm.MPClick(Sender: TObject; Button: TMPBtnType;
  var DoDefault: Boolean);
begin
with MP do
 begin
  DoDefault:=true;
  case  Button of
   btPlay: begin
           MarkButton.Enabled:=True;
           MP.StartPos:=MP.Position;
{           Poloska.Progress:=Position;
           Poloska.Visible:=True;}
           Timer1.Enabled:=True;
           MarkButton.SetFocus;
          end;
   btStop: begin
           MarkButton.Enabled:=False;
           MP.Stop;
           end;
   btStep: begin
           if (Position+(SigTabRec.PointAll div Fragmentation.Value)) < SigTabRec.PointAll then
                Position:=Position+SigTabRec.PointAll div Fragmentation.Value;
          end;
   btBack: begin
           if ((Position-(SigTabRec.PointAll div Fragmentation.Value))>0) then
            Position:=Position-(SigTabRec.PointAll div Fragmentation.Value);
          end;
{   btNext:Position:=SigTabRec.PointAll-1;
   btPrev:Position:=0;}
  end; {Case}
 end;  {With}
end;

procedure TAudioForm.MarkButtonClick(Sender: TObject);
begin
 SendMessage(MessHandle, wm_SetCursorFromAudio,0,MP.Position);
end;

procedure TAudioForm.Timer1Timer(Sender: TObject);
var dodef:boolean;
begin
{ Poloska.Progress:=MP.Position;}
 if MP.Mode = mpPlaying then Slider1.Value:=Mp.Position;
 Label8.Caption:=DateTimeToStr(SigTabRec.DateTimeStart+(Slider1.Value*SigTabRec.DeltX/24/3600));
 if ((MP.Mode = mpStopped) and  MarkButton.Enabled) then
  begin
   if CheckBox1.Checked then
    begin
     MP.Position:=0;MP.StartPos:=0;
     Label8.Caption:=DateTimeToStr(SigTabRec.DateTimeStart+(MP.Position*SigTabRec.DeltX/24/3600));
     Label8.Visible:=true;
     Slider1.Value:=Mp.Position;
{     Slider1.Update;}
{     MP.EnabledButtons:=MP.EnabledButtons+[btStop];}
     MP.Play;
     exit;
    end;
   MarkButton.Enabled:=False;
  end;
 if ((MP.Mode = mpPlaying) and  not MarkButton.Focused ) then
  BEGIN
   markButton.Visible:=true;
   markButton.Enabled:=true;
   MarkButton.SetFocus;
  END;
end;

procedure TAudioForm.SpeedButton1Click(Sender: TObject);
var NewPos:longint;
begin
 if sender = speedButton1 then
  begin
   NewPos:=trunc(MP.Position-Fragmentation.Value/SigtabRec.DeltX*Mult);
   if NewPos<0 then NewPos:=0;
  end
   else
   begin
    NewPos:=trunc(MP.Position+Fragmentation.Value/SigtabRec.DeltX*Mult);
    if NewPos>Sigtabrec.PointAll-1 then NewPos:=Sigtabrec.PointAll-2;
   end;
 if MP.Mode = mpPlaying then
  begin
   MP.Position:=NewPos; Slider1.Value:=NewPos;
   MP.Play;
  end
  else
   begin
   MP.Position:=NewPos; Slider1.Value:=NewPos;
  end
{ MP.Play;}
end;

procedure TAudioForm.PrevChanClick(Sender: TObject);
begin
 MarkButton.Enabled:=False;
 if  MP.FileName=AudioWavFile then
  begin
   Mp.Close;
   DeleteFile(pchar(AudioWavFile));
  end;
  MP.TimeFormat:=tfSamples;
  Label8.Visible:=false;
  Slider1.MaxValue:=1; Slider1.MinValue:=0;Slider1.Value:=0;
  Slider1.Visible:=false;
  Poloska.Visible:=false;
  Timer1.Enabled:=false;
  Panel1.Visible:=False;
  if Sender=PrevChan then PostMessage(MessHandle, wm_PrevChan_FromAudio,0,longint(Self))
   else PostMessage(MessHandle, wm_NextChan_FromAudio,0,longint(Self));
end;

procedure TAudioForm.Slider1SliderMove(Sender: TObject);
begin
Label8.Caption:=DateTimeToStr(SigTabRec.DateTimeStart+(Slider1.Value*SigTabRec.DeltX/24/3600));
end;

procedure TAudioForm.Slider1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if ((MP.Mode=mpOpen) or (Mp.Mode = mpPlaying) or (MP.Mode=mpStopped))
      then Mp.Position:=Slider1.Value;
end;

procedure TAudioForm.N1Click(Sender: TObject);
begin
close
end;

end.
