�
 TFFTDIALOG 0<%  TPF0
TfftDialog	fftDialogLeftrTop� BorderIcons BorderStylebsDialogCaptionX   Расчет спектральных или корреляционных функцийClientHeight�ClientWidth&Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style OldCreateOrder	PositionpoScreenCenter
OnActivateFormActivateOnClose	FormCloseOnCreate
FormCreatePixelsPerInchx
TextHeight TGaugeGauge1LeftTop�Width� Height	BackColorclOliveColorclNavy	ForeColorclMaroonParentColorProgress   TLabelLabel1Left� TopWidth� HeightAutoSizeCaption    Отсчеты в выборкеFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTahoma
Font.Style 
ParentFont  TLabelLabel4Left� Top$Width� HeightAutoSizeCaption   Весовая функцияFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTahoma
Font.Style 
ParentFont  TLabelLabel2LeftxTopWidth	HeightHintA   Шаг по частоте в полученном спектреCaptionDFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameSymbol
Font.Style 
ParentFontParentShowHintShowHint	  TLabelLabel8Left�TopWidthHeightHintA   Шаг по частоте в полученном спектреCaptionf =Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFontParentShowHintShowHint	  TLabelLabel7Left�TopfWidthHHeightCaption   Смещение Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTahoma
Font.Style ParentColor
ParentFontWordWrap	  TLabelLabel10Left� TopfWidth� HeightHint@   Количество рассчитываемых выборокAutoSizeCaption+   Рассчитываемые выборкиFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTahoma
Font.Style 
ParentFontParentShowHintShowHint	  TLabelLabel3LeftTopWidthHeightCaption   FFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTahoma
Font.Style 
ParentFontParentShowHintShowHint	  TBitBtnButtonOKLeft�Top�WidthiHeightCaption	   K?>;=8BLTabOrder OnClickButtonOKClickKindbkOK  TBitBtnBitBtn2LeftTop�WidthiHeightCaption   B<5=0TabOrderOnClickButtonCancelClickKindbkCancel  TDBRadioGroupPartAllLeft� Top� Width�Height0Caption
   1@01>B0BLColumnsCtl3D		DataFieldPartAll
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style Items.Strings   весь массив   видимую часть ParentCtl3D
ParentFontTabOrderValues.StringsTrueFalse OnChangePointFFTChangeOnClickPartAllClick  TRadioGroupSelectedSignalLeftTopWidth Height2Caption8   Обрабатывать сигналы страницыColumnsFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 	ItemIndex Items.Strings   активный   видимые   все  
ParentFontTabOrderOnClickSelectedSignalClick  TRadioGroup
SrednOrMapLeft8Top}Width� HeighteCaption   Вид результатаColumnsFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 	ItemIndex Items.Strings   сонограмма   усреднение    карта 
ParentFontTabOrderOnClickSrednOrMapClick  TRadioGroupVidFuncLeftTopWidth� HeightCaption   Вид функцииFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 	ItemIndex Items.StringsRe(f)Im(f)A(f)   ф(f)
Lg(1+A/Ao)20Lg(1+A/Ao)KxxRxx 
ParentFontTabOrderOnClickVidFuncClickOnExitVidFuncExit  	TComboBoxPointFFTLeft.TopWidthGHeightHintK   Кол-во отсчетов в выборке при расчете БПФDropDownCountFont.CharsetDEFAULT_CHARSET
Font.ColorclPurpleFont.Height�	Font.NameTahoma
Font.Style 
ItemHeight	ItemIndex 
ParentFontParentShowHintShowHint	TabOrderText8192OnChangePointFFTChangeOnExitVidFuncExitItems.Strings8192409620481024512256128643216   	TComboBoxSmeshLeft�TopgWidthKHeightHint/   Смещение между выборками DropDownCountFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameTahoma
Font.Style 
ItemHeight	ItemIndex 
ParentFontParentShowHintShowHint	TabOrderText8192OnChangePointFFTChangeOnExitVidFuncExitItems.Strings8192409620481024512256128643216   	TComboBoxWinFuncLeft.Top%Width� HeightDropDownCountFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameTahoma
Font.Style 
ItemHeight
ParentFontTabOrderTextWinFuncItems.StringsRectangularHanning;Hamming;Kaiser-BesselFlat TopBlackman-HarrisBarlett	Triangle Minimum 4-term Blackman-Harris   TEditNSpectrLeft@TopeWidth5HeightHint@   Количество рассчитываемых выборокTabStopBorderStylebsNoneColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontParentShowHintReadOnly	ShowHint	TabOrder	Text0OnChangeNSpectrChange  TEditStepFreqLeft�TopWidthkHeightHintA   Шаг по частоте в полученном спектреTabStopBorderStylebsNoneFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameTahoma
Font.Style 
ParentFontParentShowHintReadOnly	ShowHint	TabOrder
TextStepFreq  TRadioGroup	OneOrManyLeft� Top}Width� HeighteHintt   Если выборка одна, то она берется от начала обрабатываемой зоныCaption    0AAG8BK20BLFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 	ItemIndex Items.Strings   одну выборку   несколько 
ParentFontParentShowHintShowHint	TabOrderOnClickOneOrManyClick  TPanelPanel1Left� Top@Width�Height"
BevelOuterbvNoneTabOrder TLabelLabel12LeftTopWidth� HeightCaption   Коэффициент A0 = Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ParentFont  TEditAoEditLeft� TopWidth� HeightFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameTahoma
Font.Style 
ParentFontTabOrder TextAoEditOnExit
AoEditExit   	TGroupBox	GroupBox1LeftTopCWidthHeight]Caption+   Отображение результатаFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ParentFontTabOrder TLabelLabel9Left� TopWidth� HeightCaption2   Наименование окна/страницыFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTahoma
Font.Style 
ParentFont  TLabelLabel5Left� Top%Width� HeightCaption)   Наименование страницыFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTahoma
Font.Style 
ParentFont  TDBRadioGroupShowWinLeftTopWidth� HeightIBiDiModebdLeftToRight	DataFieldShowWin
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTahoma
Font.Style Items.Strings'   показать в новом окне1   показать на новой странице ParentBiDiMode
ParentFontTabOrder Values.Strings01  OnChangeShowWinChangeOnClickShowWinChange  TDBEditPageNameLeft� Top?Width8Height	DataFieldPageName
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameTahoma
Font.Style 
ParentFontTabOrder  TDBEditHeadWinLeft� Top Width8Height	DataFieldHeadWin
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameTahoma
Font.Style 
ParentFontTabOrder   TDataSourceDataSource1DataSetTable1LeftTTop�   TDbfTable1	IndexDefs 	StoreDefs		TableNameprocessnew.dbf
TableLevel	FieldDefsName
SELECTSIGNDataTypeftFloat NamePARTALLDataType	ftBoolean Name
BSHOWRESULDataType	ftBoolean NameSHOWWINDataTypeftFloat NameHEADWINDataTypeftStringSize) NamePAGENAMEDataTypeftStringSize Name
SIGNUMSRCADataTypeftFloat Name
SIGNUMSRCBDataTypeftFloat Name
FILENAMEDEDataTypeftStringSizeQ Name	RESULTTIPDataTypeftFloat  LeftLTopG TFloatFieldTable1SELECTSIGN	FieldName
SELECTSIGN  TBooleanFieldTable1PARTALL	FieldNamePARTALL  TBooleanFieldTable1BSHOWRESUL	FieldName
BSHOWRESUL  TFloatFieldTable1SHOWWIN	FieldNameSHOWWIN  TStringFieldTable1HEADWIN	FieldNameHEADWINSize)  TStringFieldTable1PAGENAME	FieldNamePAGENAMESize  TFloatFieldTable1SIGNUMSRCA	FieldName
SIGNUMSRCA  TFloatFieldTable1SIGNUMSRCB	FieldName
SIGNUMSRCB  TStringFieldTable1FILENAMEDE	FieldName
FILENAMEDESizeQ  TFloatFieldTable1RESULTTIP	FieldName	RESULTTIP    