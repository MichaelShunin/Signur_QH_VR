library paraminfo_dll;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  sharemem,
  windows,
  forms,
  SysUtils,
  Classes;

{$R *.res}


procedure ParamInfo(
        T_Ist: shortstring;      // время источника сигнала
        ImageSource:shortstring; // имя файла с картинкой исходного сигнала
        ImageSpectr:shortstring; // имя файла с картинкой рассчитанных спектров
        Fmax_P_Hz:shortstring;   // Частота максимума спектра на участке P-волны Fmax,Гц
        Flow_07_Hz:shortstring;  // Нижняя частота спектра (на уровне 0,7) fн,Гц
        FHigh_07_Hz:shortstring; // Верхняя частота спектра (на уровне 0,7) fв, Гц
        Steepness:shortstring;   // Крутизна спада спектра P-волны
        Amplituda:shortstring;   // Амплитуда сигнала А
        Complexity:shortstring   // Сложность записи Comp
{        NPointsFFT:integer;   // Количество отсчетов в спектре
        DirectoryName:string;// имя каталога, в котором сохранены файлы
        FileDatDest_Signal:string;// имя файла (File of single) со спектром исходного сигнала (одного сигнала
        FileDatDest_Noise:string; // имя файла (File of single)со спектром   шума
        FileDatDest_Signal_Noise:string}) ; // имя файла (File of single) со спектром разности сигнал-шум
 export;
begin
// далее  должен быть код dll, реализующий обработку переданных из Gemis параметров
// dll может быть написана на любом языке, однако имя dll, имя процедуры  и тип параметров следует оставить неизменными
// набор параметров может быть изменен в случае необходимости по согласованию разработчиков
 messagebox(0,pansiChar(
              'T_Ist:                    '+T_Ist+chr(10)+chr(13)+
              'Image Source:             '+ImageSource+chr(10)+chr(13)+
              'Image Spectr:             '+ImageSpectr+chr(10)+chr(13)+
              'Fmax_P_Hz:                '+Fmax_P_Hz+chr(10)+chr(13)+
              'Flow_07_Hz:               '+Flow_07_Hz+chr(10)+chr(13)+
              'FHigh_07_Hz:              '+FHigh_07_Hz+chr(10)+chr(13)+
              'Steepness:                '+Steepness+chr(10)+chr(13)+
              'Amplituda:                '+Amplituda+chr(10)+chr(13)+
              'Complexity:               '+Complexity+chr(10)+chr(13)
{              'NPointsFFT:               '+inttostr(NPointsFFT)+chr(10)+chr(13)+
              'DirectoryName:            '+DirectoryName+chr(10)+chr(13)+
              'FileDatDest_Signal:       '+FileDatDest_Signal+chr(10)+chr(13)+
              'FileDatDest_Noise:        '+FileDatDest_Noise+chr(10)+chr(13)+
              'FileDatDest_Signal_Noise: '+FileDatDest_Signal_Noise}),
              'работает paraminfo_dll для результатов расчета параметров',0);
end;


exports
 ParamInfo name 'ParamInfo';
end.

