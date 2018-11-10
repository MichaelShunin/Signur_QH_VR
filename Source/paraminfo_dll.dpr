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
        T_Ist: shortstring;      // ����� ��������� �������
        ImageSource:shortstring; // ��� ����� � ��������� ��������� �������
        ImageSpectr:shortstring; // ��� ����� � ��������� ������������ ��������
        Fmax_P_Hz:shortstring;   // ������� ��������� ������� �� ������� P-����� Fmax,��
        Flow_07_Hz:shortstring;  // ������ ������� ������� (�� ������ 0,7) f�,��
        FHigh_07_Hz:shortstring; // ������� ������� ������� (�� ������ 0,7) f�, ��
        Steepness:shortstring;   // �������� ����� ������� P-�����
        Amplituda:shortstring;   // ��������� ������� �
        Complexity:shortstring   // ��������� ������ Comp
{        NPointsFFT:integer;   // ���������� �������� � �������
        DirectoryName:string;// ��� ��������, � ������� ��������� �����
        FileDatDest_Signal:string;// ��� ����� (File of single) �� �������� ��������� ������� (������ �������
        FileDatDest_Noise:string; // ��� ����� (File of single)�� ��������   ����
        FileDatDest_Signal_Noise:string}) ; // ��� ����� (File of single) �� �������� �������� ������-���
 export;
begin
// �����  ������ ���� ��� dll, ����������� ��������� ���������� �� Gemis ����������
// dll ����� ���� �������� �� ����� �����, ������ ��� dll, ��� ���������  � ��� ���������� ������� �������� �����������
// ����� ���������� ����� ���� ������� � ������ ������������� �� ������������ �������������
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
              '�������� paraminfo_dll ��� ����������� ������� ����������',0);
end;


exports
 ParamInfo name 'ParamInfo';
end.

