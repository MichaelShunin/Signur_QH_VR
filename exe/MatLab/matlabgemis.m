%FIRST PART
%-----------------
%IN_NCHAN - задается из программы вызова
%IN_DELTX = 1:1:IN_NCHAN   - задается из программы вызова
%IN_POINTY = 1:1:IN_NCHAN   - задается из программы вызова
%IN_NPOINTMAX   - задается из программы вызова
%IN_Y = ones(IN_NPOINTMAX,IN_NCHAN);   - задается из программы вызова
%---------------
%- формирование выходных параметров
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

%OUT_Y=ones(OUT_NPOINT,OUT_NCHAN);    - задается из программы вызова

% обработка 
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

% формирование описания
OUT_NAMEX='ось X';

% OUT_NAMEY = 1:1:OUT_NCHAN;    - задается из программы вызова
for chan = 1:OUT_NCHAN 
 OUT_NAMEY(chan) = 'y'+chan
end;

% формирование условий выхода и отображения текстового результата
OUT_PLOT=0;    % если 1, то matlab не будет закрыт
%plot(OUT_Y)
OUT_FILE='c:\test.txt';   % если Out_File = '' , то  файл будет отображен на экране
OUT_FILE='';