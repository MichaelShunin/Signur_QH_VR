�
 TFUNCDIALOG 0�*  TPF0TFuncDialog
FuncDialogLeft� Top� BorderIcons BorderStylebsDialogCaption%   Выберите  обработку ClientHeight�ClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style OldCreateOrder	PositionpoScreenCenter
OnActivateFormActivateOnClose	FormCloseOnCreate
FormCreatePixelsPerInchx
TextHeight TLabelLabel5LeftTop5Width� HeightCaption"   Наименование окна:Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont  TGaugeGauge2LeftTopmWidth�Height	BackColorclSilver	ForeColorclMaroonFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style MinValue
ParentFontProgress  TGaugeGauge1LeftTop�Width�Height	BackColorclSilverColorclPurple	ForeColorclPurpleFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style ParentColor
ParentFontProgress   TLabelLabel6Left�Top2Width� HeightCaption+   Наименование страницы: Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont  TDBRadioGroupPartAllLeftTop� Width� HeightSCaption
   1@01>B0BLCtl3D		DataFieldPartAll
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style Items.Strings   весь массив   видимую часть ParentCtl3D
ParentFontTabOrder Values.StringsTrueFalse OnClickPartAllClick  TDBRadioGroupSelectedSignalLeft� Top� Width� HeightSCaption'   Обрабатывать сигналы	DataField
SELECTSIGN
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style Items.Strings   активный   видимые   все на странице 
ParentFontTabOrderValues.Strings012   TDBEditHeadWinLeftTopIWidth�HeightAutoSize	DataFieldHeadWin
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFontTabOrder  TBitBtnButtonOKLeftTopoWidth� HeightCaption	   K?>;=8BLTabOrderOnClickButtonOKClickKindbkOK  TBitBtnButtonCancelLeft�TopoWidthnHeightCaption   B<5=0TabOrderOnClickButtonCancelClickKindbkCancel  TDBEditPageNameLeft�TopIWidth� HeightAutoSize	DataFieldPageName
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFontTabOrder  TDBRadioGroupShowWinLeftxTop� WidthHeightSCaption+   Отображение результата	DataFieldShowWin
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style Items.Strings   новое окно   новая страница!   исходная страница 
ParentFontTabOrderValues.Strings012 OnChangeShowWinChangeOnClickShowWinChange  TPageControl
SelectFuncLeft Top Width�Height� 
ActivePage	TabSheet3AlignalTop	MultiLine	TabOrderOnChangeC1_EditExitOnExitC1_EditExit 	TTabSheet	TabSheet1CaptionF(t) = F(t) - M[F(t)] TMemoMemo5Left Top Width�Height� AlignalClientFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style Lines.Strings�   Результирующий сигнал будет равен  исходному сигналу без учета его постоянной    составляющей ParentColor	
ParentFontTabOrder    	TTabSheet	TabSheet2Caption   @>872>4=0O
ImageIndex TLabelLabel11LeftTopWidthHeightCaption<   Используется 5-точечный алгоритмFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont  TLabelLabel13Left Top Width� HeightAlignalTopCaption(         F = производная от F Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont   	TTabSheet	TabSheet3Caption   =B53@0;
ImageIndex TMemoMemo6Left Top Width�Height� AlignalClientFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman Cyr
Font.Style Lines.Strings   Результирующий сигнал будет равен  интегралу от  исходного сигнала с    переменным    верхним пределом ParentColor	
ParentFontTabOrder    	TTabSheet	TabSheet4Caption   Арифметика..
ImageIndex TLabelLabel14Left Top Width� HeightAlignalTopCaption   F = F * C1 + C2Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont  TLabelLabel15Left� TopWidth$HeightCaption   С1 = Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont  TLabelLabel16Left� Top3Width$HeightCaption   С2 = Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont  TEditc1_EditLeft� TopWidthyHeightFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameSystem
Font.Style 
ParentFontTabOrder TextC1_EditOnExitC1_EditExit  TEditC2_EditLeft� Top0WidthyHeightFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameSystem
Font.Style 
ParentFontTabOrderTextC2_EditOnExitC1_EditExit   	TTabSheet	TabSheet5Caption
   #A@54=5=85
ImageIndex TLabelLabel17Left,TopWidth� HeightCaption%   Усредняемые отсчетыFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont  	TSpinEditSk_Sredn_SpinLeft� TopWidthQHeightFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameTimes New Roman Cyr
Font.Style MaxValueMinValue
ParentFontTabOrder ValueOnExitC1_EditExit  	TCheckBoxbSkUsrLeftTop,Width�HeightCaptionB   использовать скользящее усреднениеFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFontTabOrderOnClickbSkUsrClickOnExitC1_EditExit   	TTabSheet	TabSheet6Caption
F = abs(F)
ImageIndex TMemoMemo7Left Top Width�Height� AlignalClientColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style Lines.StringsQ   Результат равен модулю от исходного сигнала 
ParentFontTabOrder    	TTabSheet	TabSheet7Caption   2B>:>@@5;OF8O
ImageIndex TLabelLabel18Left Top Width8HeightAlignalTopCaption~         Результат равен автокорреляционной функции от исходного сигналаFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont  TLabelLabel10Left	Top<Width�Height&Caption�   В обрабатываемом сигнале более 8192 отсчетов.  Расчет может занять очень много времени. Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman Cyr
Font.StylefsBold 
ParentFontVisibleWordWrap	  	TCheckBoxbDopZeroLeftTopWidthhHeightCaption-   Дополнять нулями при БПФFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFontTabOrder   TButtonButton1Left�Top"Width� Height"Caption!   Ограничить расчетTabOrderOnClickButton1Click   	TTabSheet	TabSheet8Caption   Числовые х-ки
ImageIndex TLabelLabel20LeftTop^Width�HeightCaptionm   Спецификатор формата текстового представления результата:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont  TRadioGroup	Chisl_HarLeftTop Width� HeightYFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 	ItemIndex Items.StringsMx,Dx,CKO,Max,Min   Yсв=Sum(Yi*Xi) / Sum(Xi)   Xсв=Sum(Yi*Xi) / Sum(Yi) 
ParentFontTabOrder   TEditFormat_S_EditLeftToprWidth� HeightTabOrderText0.000000   	TTabSheet	TabSheet9Caption-   Межканальная статистика
ImageIndex
TabVisible TMemoMemo8Left Top Width�Height)AlignalTop
BevelOuterbvNoneBorderStylebsNoneLines.Stringsp   Будут определяться межканальные  результаты стат. обработки c   - обрабатываются  i-е  отсчеты соответствующих каналов. TabOrder   	TCheckBoxMax_CbLeftTop*Width� HeightCaption   0:A8<C<TabOrder  	TCheckBoxMin_CBLeftTopHWidth� HeightCaption   8=8<C<TabOrder  	TCheckBoxMx_CbLeftTopeWidthLHeightCaption-   Математическое.ожиданиеTabOrder    TDataSourceDataSource1DataSetTable1Left
Topv  TDbfTable1Indexes 	StoreDefs		TableNameprocessnew.dbf
TableLevel	FieldDefsName
SELECTSIGNDataTypeftFloat NamePARTALLDataType	ftBoolean Name
BSHOWRESULDataType	ftBoolean NameSHOWWINDataTypeftFloat NameHEADWINDataTypeftStringSize) NamePAGENAMEDataTypeftStringSize Name
SIGNUMSRCADataTypeftFloat Name
SIGNUMSRCBDataTypeftFloat Name
FILENAMEDEDataTypeftStringSizeQ Name	RESULTTIPDataTypeftFloat  Left�Tops TFloatFieldTable1SELECTSIGN	FieldName
SELECTSIGN  TBooleanFieldTable1PARTALL	FieldNamePARTALL  TBooleanFieldTable1BSHOWRESUL	FieldName
BSHOWRESUL  TFloatFieldTable1SHOWWIN	FieldNameSHOWWIN  TStringFieldTable1HEADWIN	FieldNameHEADWINSize)  TStringFieldTable1PAGENAME	FieldNamePAGENAMESize  TFloatFieldTable1SIGNUMSRCA	FieldName
SIGNUMSRCA  TFloatFieldTable1SIGNUMSRCB	FieldName
SIGNUMSRCB  TStringFieldTable1FILENAMEDE	FieldName
FILENAMEDESizeQ  TFloatFieldTable1RESULTTIP	FieldName	RESULTTIP    