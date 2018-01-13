% Input: Wav file with path
%Output: LPC and return array within totalLPCTestingValue


function totalLPC = calculatelpctesting(str)

[Y,Fs] = wavread(str);

totalLPC=[0,0,0,0,0,0,0,0,0,0,0,0];

len1 = length(str);
    C = str(1:len1-4);
outFileName = strcat(C,'.lpc');
fp=fopen(outFileName,'w');
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
        fprintf(fp,'%f\t',u(n));
    end %for tab
    fprintf(fp,'\r\n');
    totalLPC=cat(1,totalLPC,u(2:13));
    start=last;    last=frameLength+start;
end
fclose(fp);








