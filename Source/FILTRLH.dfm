�
 TBATTERVORT 0�  TPF0TBattervort
BattervortLeft	TopBorderIcons BorderStylebsDialogCaption#   Фильтр БаттервортаClientHeightDClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSystem
Font.Style OldCreateOrder	PositionpoScreenCenter
OnActivateFormActivateOnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight TLabelLabel6Left>Top� Width� HeightCaption+   Наименование страницы: Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont  TLabelLabel5LeftTop� WidthxHeightCaption"   Наименование окна:Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont  TGaugeGauge2Left�TopWidthHeight	BackColorclSilver	ForeColorclMaroonMinValueProgress  TGaugeGauge1Left�Top/WidthHeight	BackColorclSilverColorclPurple	ForeColorclPurpleParentColorProgress   TImageImage1LeftTop*Width&HeightPicture.Data
�   TBitmap�   BM�       >   (               P                      ��� �����  ���������������p���p���p���p���p��p��p���p�����p���p������������Stretch	  TLabelLabel8LeftTop
WidthSHeightAutoSizeCaption   Фильтр ВЧ:  TImageImage2LeftTop+Width+HeightPicture.Data
�   TBitmap�   BM�       >   (               P                      ��� �����  ���������������p���p��p��p���p���p���p���p�����p���p������������Stretch	  TLabelLabel9Left� Top
WidthPHeightAutoSizeCaption   Фильтр НЧ:  TDBRadioGroupShowWinLeftTop}Width� HeighteCaption+   Отображение результата	DataFieldShowWin
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style Items.Strings   новое окно   новая страница!   исходная страница 
ParentFontTabOrder Values.Strings012 OnChangeShowWinChangeOnClickShowWinChange  TDBEditPageNameLeft:Top� Width� HeightAutoSize	DataFieldPageName
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameSystem
Font.Style 
ParentFontTabOrder  TDBEditHeadWinLeft
Top� Width-HeightAutoSize	DataFieldHeadWin
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameSystem
Font.Style 
ParentFontTabOrder  TBitBtnButtonOKLeft�Top#WidthhHeightCaption	   K?>;=8BLTabOrderOnClickButtonOKClickKindbkOK  TBitBtnButtonCancelLeftTop#WidthhHeightCaption   B<5=0TabOrderOnClickButtonCancelClickKindbkCancel  TDBRadioGroupSelectedSignalLeft|Top}Width� HeightdCaption'   Обрабатывать сигналы	DataField
SELECTSIGN
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style Items.Strings   активный   видимые   все на странице 
ParentFontTabOrderValues.Strings012   TDBRadioGroupPartAllLeftTop}WidthrHeightdCaption
   1@01>B0BLCtl3D		DataFieldPartAll
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style Items.Strings   весь массив   видимую часть ParentCtl3D
ParentFontTabOrderValues.StringsTrueFalse OnClickPartAllClick  	TGroupBox	GroupBox1LeftZTopWidth� HeightvFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ParentFontTabOrder TLabelLabel1Left	TopWidth5HeightCaption   Порядок:Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont  TLabelLabel2Left
Top.WidthmHeightCaption!   Частота среза(Гц): Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont  TLabelLabel7Left
TopTWidthBHeightHint�   Кол-во отсчетов, обнуляемых на начальном участке сигнала для              подавления переходного процессаCaption!   Начальный участокFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFontParentShowHintShowHint	WordWrap	  	TSpinEditPorHFLeftFTopWidth$HeightFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameSystem
Font.Style 	IncrementMaxValue
MinValue
ParentFontTabOrder ValueOnExit	PorHFExit  TEditFHFLeft*Top>WidthPHeightAutoSizeFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameSystem
Font.Style 
ParentFontParentShowHintShowHint	TabOrderTextFHFOnExit	PorHFExit  	TSpinEditNachUchLeftRTopVWidth4HeightFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameSystem
Font.Style MaxValuedMinValue
ParentFontTabOrderValue   	TGroupBox	GroupBox2LeftOTopWidth� HeightvTabOrder TLabelLabel3LeftTopWidth5HeightCaption   Порядок:Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont  TLabelLabel4LeftTop2WidthmHeightCaption!   Частота среза(Гц): Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameTimes New Roman Cyr
Font.Style 
ParentFont  	TSpinEditPorLFLeftMTopWidth&HeightFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameSystem
Font.Style 	IncrementMaxValue
MinValue
ParentFontTabOrder ValueOnExit	PorHFExit  TEditFLFLeft0TopBWidthGHeightAutoSizeFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameSystem
Font.Style 
ParentFontParentShowHintShowHint	TabOrderTextFLFOnExit	PorHFExit   TDataSourceDataSource1DataSetTable1LeftNTopP  TDbfTable1	IndexDefs 	StoreDefs		TableNameprocessnew.dbf
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