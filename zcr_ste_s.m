prompt = 'path please?';
str = input(prompt,'s');
if isempty(str)
 str = 'Y';
  end
 fp = fopen('energy.txt','w')
path = str;
fileList = getallfiles(str,'*.wav',0,fp);
fclose(fp);
fp = fopen('energy.txt','r');
while ~feof(fp)
A = fgets(fp);
B = strtrim(A); %wav file name with path
len1 = length(B);
C = B(1:len1-4);
energyFileName = strcat(C,'.energy');
[p,Fs] = wavread(B); 
p = p.';
N = length(p); % signal length
n = 0:N-1;
ts = n*(1/Fs); % time for signal

% define the window
wintype = 'hamming';
winlen = 255;
winamp =[0.5,1];

% find the zero-crossing rate
zc = zerocross(p,wintype,winamp(1),winlen);
fpx=fopen('avg energy order.txt','a');
% find the energy
E = energy(p,wintype,winamp(2),winlen);
s=sum(E);
ag=s/N;
fprintf(fpx,'%f\t',ag);  
fprintf(fpx,'\r\n');
 % time index for the ST-ZCR and STE after delay compensation
out = (winlen-1)/2:(N+winlen-1)-(winlen-1)/2;
t = (out-(winlen-1)/2)*(1/Fs);
% figure;
% plot(ts,p); hold on;
% plot(t,zc(out),'r','Linewidth',2); xlabel('t, seconds');
% title('Short-time Zero Crossing Rate');
% legend('signal','STZCR');
% 
% figure;
% plot(ts,p); hold on;
% plot(t,E(out),'r','Linewidth',2); xlabel('t, seconds');
% title('Short-time Energy');
% legend('signal','STE');
end
fclose(fp)
fclose(fpx)