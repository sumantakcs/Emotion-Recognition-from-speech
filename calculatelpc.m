%function totalLPC = calculatelpc(str)
%Input=filepath in the form of string(str)
%Output=total framewise LPC in array
%Specification:framesize=16miliseconds
 %             framelength=256points
 %             overlap=50%
 %             sample frequency(Fs)=16000Hz
function totalLPC = calculatelpc(str)
fp = fopen('FileName.txt','w');
path ='C:\Users\SpeechLab\Desktop\aot project\samples\database\database(bengali)\surprise\reetapa';
fileList = getallfiles(path,'*.wav',0,fp);
fclose(fp);
% getLPC(fileList);
fp = fopen('FileName.txt','r');
totalLPC=[0 0 0 0 0 0 0 0 0 0 0 0];
while ~feof(fp)
    A = fgets(fp);
    B = strtrim(A); %wav file name with path
    len1 = length(B);
    C = B(1:len1-4);
    outFileName = strcat(C,'.lpc'); % Output LPC file name with path
    [Y,Fs]= wavread(B);
    fpx=fopen(outFileName,'w');
    fpr=fopen('emotion','a');
    g=length(Y);
    framesize=16; % in Milli Second
    frameLength=(Fs/1000)*framesize;% Number of sample per frame
    foverlap=frameLength/2;
    e=rem(g,frameLength); % Number of sample of Last frame
    start=1;
    last=frameLength;
    frameno=(g-e)/frameLength;
    
    for T=1.0:frameno
        u=lpc(Y(start:last),12);% Calculate LPC
        for n=2:length(u)
            fprintf(fpx,'%f\t',u(n));
        end %for tab
        fprintf(fpx,'\r\n');
        totalLPC=cat(1,totalLPC,u(2:13));
        start=last;    last=frameLength+start;
    end
end
fclose(fpx);
fclose(fpr);
end




