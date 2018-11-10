%FIRST PART
%-----------------
%IN_NCHAN - �������� �� ��������� ������
%IN_DELTX = 1:1:IN_NCHAN   - �������� �� ��������� ������
%IN_POINTY = 1:1:IN_NCHAN   - �������� �� ��������� ������
%IN_NPOINTMAX   - �������� �� ��������� ������
%IN_Y = ones(IN_NPOINTMAX,IN_NCHAN);   - �������� �� ��������� ������
%---------------
%- ������������ �������� ����������
OUT_NPOINT=1000;
OUT_NCHAN=IN_NCHAN+2;

OUT_DELTX = 1:1:OUT_NCHAN;
for chan = 1:OUT_NCHAN 
 OUT_DELTX(chan) = 100
end;

OUT_STARTTIME = 1:1:OUT_NCHAN;
for chan = 1:OUT_NCHAN 
 OUT_STARTTIME(chan) = 0
end;

OUT_POINTY= 1:1:OUT_NCHAN;
for chan = 1:OUT_NCHAN 
 OUT_POINTY(chan) =OUT_NPOINT;
end;
%--------------------------------------------------------------------------------------------------------------
%SECOND PART             

%OUT_Y=ones(OUT_NPOINT,OUT_NCHAN);    - �������� �� ��������� ������

% ��������� 
for chan = 1:IN_NCHAN 
  for point = 1:OUT_NPOINT
   OUT_Y(point,chan)=IN_Y(point,chan)*IN_Y(point,chan);
  end;
end;

for chan = IN_NCHAN:OUT_NCHAN
 for point = 1:OUT_NPOINT
 OUT_Y(point,chan)=IN_Y(point,1)+IN_Y(point,2);
end;
end;

% ������������ ��������
OUT_NAMEX='��� X';

% OUT_NAMEY = 1:1:OUT_NCHAN;    - �������� �� ��������� ������
for chan = 1:OUT_NCHAN 
 OUT_NAMEY(chan) = 'y'+chan
end;

% ������������ ������� ������ � ����������� ���������� ����������
OUT_PLOT=0;    % ���� 1, �� matlab �� ����� ������
%plot(OUT_Y)
OUT_FILE='c:\test.txt';   % ���� Out_File = '' , ��  ���� ����� ��������� �� ������
OUT_FILE='';